source("/mnt/ssd1/stockviz/R2/backtests/common/runtime.R")
source_common("returns")
source_common("charts")

suppressPackageStartupMessages({
  library(RODBC)
  library(DBI)
  library(RPostgres)
  library(data.table)
  library(xts)
  library(PerformanceAnalytics)
  library(gt)
  library(gtExtras)
  library(webshot2)
  library(tidyverse)
  library(ggthemes)
  library(viridis)
  library(ggrepel)
  library(patchwork)
  library(scales)
})

source("/mnt/hollandC/StockViz/R/config.r")

TRAIN_END <- as.Date("2019-12-31")
POST_START <- as.Date("2020-05-01")
LOOKBACK <- 252L
VOL_LOOKBACK <- 63L
TARGET_VOL <- 0.40
MAX_LEVERAGE <- 3.0

# Purpose: open a SQL Server connection with explicit database selection and retry transient login failures.
open_sql <- function(database) {
  conn <- sprintf(
    "Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=%s;Uid=%s;Pwd=%s;",
    ldbserver, database, ldbuser, ldbpassword
  )
  for (attempt in seq_len(4L)) {
    ch <- tryCatch(odbcDriverConnect(conn, case = "nochange", believeNRows = TRUE),
                   error = function(e) NA_integer_)
    if (is.numeric(ch) && length(ch) == 1L && is.finite(ch) && ch > 0) {
      probe <- tryCatch(sqlQuery(ch, "select 1 as ok", stringsAsFactors = FALSE),
                        error = function(e) NULL)
      if (is.data.frame(probe)) return(ch)
      try(odbcClose(ch), silent = TRUE)
    }
    if (attempt < 4L) Sys.sleep(2L)
  }
  stop(sprintf("Could not open SQL Server database %s after retries", database))
}

# Purpose: execute a checked SQL query and normalize its result to a data.table.
sql_dt <- function(con, sql) {
  x <- sqlQuery(con, sql, stringsAsFactors = FALSE)
  if (!is.data.frame(x)) stop(paste(x, collapse = " | "))
  setDT(x)
}

# Purpose: build a clean, sorted daily price xts from a long table.
long_to_xts <- function(dt, date_col, value_col, key_col) {
  dt <- copy(dt)
  dt[, date := as.Date(get(date_col))]
  dt[, value := as.numeric(get(value_col))]
  dt <- dt[is.finite(value) & value > 0 & !is.na(date)]
  setorderv(dt, c(key_col, "date"))
  dt <- unique(dt, by = c(key_col, "date"))
  wide <- dcast(dt, date ~ get(key_col), value.var = "value")
  dates <- wide$date
  wide[, date := NULL]
  out <- xts(as.matrix(wide), order.by = dates)
  colnames(out) <- setdiff(names(wide), "date")
  out[order(index(out))]
}

# Purpose: compute causal monthly target exposures for a time-series momentum panel.
make_tsmom <- function(prices, cost, asset_class, target_vol = TARGET_VOL,
                       lookback = LOOKBACK, vol_lookback = VOL_LOOKBACK,
                       max_leverage = MAX_LEVERAGE) {
  prices <- prices[order(index(prices))]
  prices <- prices[, !duplicated(colnames(prices)), drop = FALSE]
  n <- NROW(prices); k <- NCOL(prices); dates <- as.Date(index(prices))
  ret <- matrix(NA_real_, n, k, dimnames = list(as.character(dates), colnames(prices)))
  if (n > 1L) ret[2:n, ] <- coredata(prices)[2:n, , drop = FALSE] /
    coredata(prices)[1:(n - 1L), , drop = FALSE] - 1
  colnames(ret) <- colnames(prices)
  rebalance <- which(!duplicated(format(dates, "%Y-%m"), fromLast = TRUE))
  target_fixed <- matrix(NA_real_, n, k, dimnames = dimnames(ret))
  target_vol_scaled <- target_fixed
  signal <- matrix(NA_real_, n, k, dimnames = dimnames(ret))
  vol <- matrix(NA_real_, n, k, dimnames = dimnames(ret))

  for (i in rebalance) {
    if (i < max(lookback, vol_lookback) + 1L) next
    for (j in seq_len(k)) {
      rr <- ret[(i - lookback + 1L):i, j]
      vv <- ret[(i - vol_lookback + 1L):i, j]
      if (sum(is.finite(rr)) < lookback || sum(is.finite(vv)) < vol_lookback) next
      cumret <- prod(1 + rr) - 1
      annual_vol <- stats::sd(vv) * sqrt(252)
      if (!is.finite(cumret) || !is.finite(annual_vol) || annual_vol <= 0) next
      signal[i, j] <- sign(cumret)
      vol[i, j] <- annual_vol
      target_fixed[i, j] <- signal[i, j]
      target_vol_scaled[i, j] <- signal[i, j] * min(max_leverage, target_vol / annual_vol)
    }
  }

  # Carry each close-known target forward until the next month-end decision.
  for (i in seq_len(n)) {
    prior <- rebalance[rebalance <= i]
    if (length(prior)) {
      p <- tail(prior, 1L)
      target_fixed[i, ] <- target_fixed[p, ]
      target_vol_scaled[i, ] <- target_vol_scaled[p, ]
    }
  }
  # Close-t decisions earn return t+1. This is an explicit causal lag.
  eff_fixed <- rbind(rep(NA_real_, k), target_fixed[-n, , drop = FALSE])
  eff_scaled <- rbind(rep(NA_real_, k), target_vol_scaled[-n, , drop = FALSE])
  colnames(eff_fixed) <- colnames(eff_scaled) <- colnames(ret)

  panel_return <- function(exposure) {
    valid <- is.finite(ret) & is.finite(exposure)
    gross <- rep(NA_real_, n); turnover <- rep(NA_real_, n)
    for (i in seq_len(n)) {
      if (any(valid[i, ])) gross[i] <- sum(ret[i, ] * exposure[i, ], na.rm = TRUE) / sum(valid[i, ])
      if (i > 1L) turnover[i] <- sum(abs(exposure[i, ] - exposure[i - 1L, ]), na.rm = TRUE) / k
    }
    net <- gross - cost * turnover
    list(net = xts(net, dates), gross = xts(gross, dates), turnover = xts(turnover, dates), exposure = xts(exposure, dates))
  }

  benchmark <- rowMeans(ret, na.rm = TRUE)
  benchmark[!is.finite(benchmark)] <- NA_real_
  list(
    asset_class = asset_class,
    prices = prices,
    returns = xts(ret, dates),
    signal = xts(signal, dates),
    volatility = xts(vol, dates),
    fixed = panel_return(eff_fixed),
    vol_scaled = panel_return(eff_scaled),
    benchmark = xts(benchmark, dates),
    params = list(target_vol = target_vol, lookback = lookback,
                 vol_lookback = vol_lookback, max_leverage = max_leverage,
                 cost = cost, signal_lag = "close t target applies to return t+1")
  )
}

# Purpose: calculate the house metrics for a named window.
window_metrics <- function(x, system, window) {
  start <- if (window == "post") POST_START else NULL
  end <- if (window == "pre") TRAIN_END else NULL
  y <- slice_returns(x, start, end)
  y <- y[is.finite(y)]
  if (!NROW(y)) return(data.table(system = system, window = window, N = 0L,
                                  CAGR = NA_real_, Vol = NA_real_, Sharpe = NA_real_,
                                  MaxDD = NA_real_))
  m <- strategy_metrics(y)
  data.table(system = system, window = window, N = as.numeric(m[["N"]]),
             CAGR = as.numeric(m[["CAGR"]]), Vol = as.numeric(m[["Vol"]]),
             Sharpe = as.numeric(m[["Sharpe"]]), MaxDD = as.numeric(m[["MaxDD"]]))
}

# Purpose: persist a study checkpoint and auditable long-form outputs.
save_study <- function(result, out_dir) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  series <- list(
    B_H = result$benchmark,
    TSMOM_Fixed = result$fixed$net,
    TSMOM_VolScaled = result$vol_scaled$net
  )
  metrics <- rbindlist(lapply(names(series), function(nm) {
    rbindlist(lapply(c("pre", "post", "full"), function(w) window_metrics(series[[nm]], nm, w)))
  }))
  daily <- data.table(date = as.Date(index(result$benchmark)))
  for (nm in names(series)) daily[[nm]] <- as.numeric(merge(series[[nm]], xts(rep(NA_real_, NROW(daily)), daily$date), join = "right")[, 1])
  exposures <- data.table(date = as.Date(index(result$fixed$exposure)))
  for (nm in colnames(result$fixed$exposure)) exposures[[paste0("fixed_", nm)]] <- as.numeric(result$fixed$exposure[, nm])
  for (nm in colnames(result$vol_scaled$exposure)) exposures[[paste0("scaled_", nm)]] <- as.numeric(result$vol_scaled$exposure[, nm])
  signals <- data.table(date = as.Date(index(result$signal)))
  for (nm in colnames(result$signal)) signals[[nm]] <- as.numeric(result$signal[, nm])
  audit <- data.table(
    asset_class = result$asset_class,
    first_date = min(as.Date(index(result$prices))),
    last_date = max(as.Date(index(result$prices))),
    n_dates = NROW(result$prices),
    n_assets = NCOL(result$prices),
    missing_price_cells = sum(!is.finite(coredata(result$prices))),
    zero_return_cells = sum(coredata(result$returns) == 0, na.rm = TRUE),
    fixed_turnover = sum(as.numeric(result$fixed$turnover), na.rm = TRUE),
    scaled_turnover = sum(as.numeric(result$vol_scaled$turnover), na.rm = TRUE)
  )
  fwrite(metrics, file.path(out_dir, "metrics.csv"))
  fwrite(daily, file.path(out_dir, "daily_returns.csv"))
  fwrite(exposures, file.path(out_dir, "exposures.csv"))
  fwrite(signals, file.path(out_dir, "signals.csv"))
  fwrite(audit, file.path(out_dir, "data_audit.csv"))
  saveRDS(list(result = result, series = series, metrics = metrics, audit = audit,
               built = Sys.time()), file.path(out_dir, "checkpoint.rds"))
  invisible(metrics)
}
