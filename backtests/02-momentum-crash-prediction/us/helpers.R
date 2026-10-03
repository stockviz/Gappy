# helpers.R — shared mechanics for the momentum-crash US study.
# Purpose: single source of truth for pure, testable helpers plus the DB/overlay
#          setup reused by build.R, analyze.R, and tests/test_helpers.R.

# ----------------------------------------------------------------------------
# Imports and house setup (all library()/source() at top, per house convention)
# ----------------------------------------------------------------------------
source("/mnt/ssd1/stockviz/R2/backtests/common/runtime.R")
source_common("returns")
source_common("charts")

suppressPackageStartupMessages({
  library(RODBC)
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

# ----------------------------------------------------------------------------
# Study constants (kept local to this study, not shared mechanics)
# ----------------------------------------------------------------------------
TRAIN_END   <- as.Date("2019-12-31")   # PRE window ends here (inclusive)
POST_START  <- as.Date("2020-05-01")   # POST window begins here (inclusive)
PRICE_START <- as.Date("2006-01-01")   # before the first 2008-01-31 S&P snapshot
DRAG        <- 0.0010                  # 10 bps US turnover, per leg, per weight change
N_DECILES   <- 10L                     # paper forms deciles; top = long, bottom = short
MIN_UNIVERSE <- 100L                   # minimum eligible names to form deciles
MAX_DAILY_MOVE <- 0.5                  # drop a symbol-day |return| above this (split guard)
VOL_WINDOW  <- 126L                    # market variance window (preceding trading days)
BEAR_WINDOW <- 504L                    # ~24 months of trading days for the bear indicator
MAX_LEVERAGE <- 2.0                    # cap on the scaled overlay exposure
PANIC_GRID  <- seq(0, 1, by = 0.25)    # pre-trained panic reduction grid

# ----------------------------------------------------------------------------
# Pure calendar / momentum / portfolio helpers
# ----------------------------------------------------------------------------

# Purpose: return the last trading date observed in each calendar month.
month_end_dates <- function(dates) {
  dates <- sort(unique(as.Date(dates)))
  dates[!duplicated(format(dates, "%Y-%m"), fromLast = TRUE)]
}

# Purpose: return the last calendar day of the month containing `d`.
end_of_month <- function(d) {
  d <- as.Date(d)
  m1 <- as.Date(format(d, "%Y-%m-01"))
  as.Date(format(seq.Date(m1, by = "1 month", length.out = 2)[2], "%Y-%m-01")) - 1
}

# Purpose: for a month-end decision date, return the 12-2 formation window as
#          c(start = end of month M-13, end = end of month M-2). This skips the
#          most recent month (M-1) and forms over months t-12 through t-2.
formation_endpoints <- function(decision_date) {
  d <- as.Date(decision_date)
  m1 <- as.Date(format(d, "%Y-%m-01"))
  first_m2  <- seq.Date(m1, by = "-1 month", length.out = 3)[3]    # first of M-2
  first_m13 <- seq.Date(m1, by = "-1 month", length.out = 14)[14]  # first of M-13
  c(start = end_of_month(first_m13), end = end_of_month(first_m2))
}

# Purpose: compute 12-2 momentum = last observed close at end of M-2 divided by
#          last observed close at end of M-13, minus one. `close_dates` must be
#          ascending and equal in length to `close_prices`. `max_move` guards
#          against corporate-action distortions: if any observed-close move
#          inside the formation window exceeds it in absolute terms, the result
#          is NA (split/delisting guard). Returns NA when either endpoint is
#          unobserved or the series is too short.
momentum_122 <- function(close_dates, close_prices, decision_date, max_move = Inf) {
  close_dates <- as.Date(close_dates)
  close_prices <- as.numeric(close_prices)
  keep <- is.finite(close_prices) & !is.na(close_dates)
  close_dates <- close_dates[keep]
  close_prices <- close_prices[keep]
  if (length(close_dates) < 2L) return(NA_real_)
  ep <- formation_endpoints(decision_date)
  i2  <- findInterval(ep[["end"]], close_dates)
  i13 <- findInterval(ep[["start"]], close_dates)
  if (i2 < 1L || i13 < 1L || i2 <= i13) return(NA_real_)
  if (is.finite(max_move)) {
    seg <- close_prices[(i13 + 1L):i2] / close_prices[i13:(i2 - 1L)] - 1
    if (any(!is.finite(seg)) || any(abs(seg) > max_move)) return(NA_real_)
  }
  close_prices[i2] / close_prices[i13] - 1
}

# Purpose: assign equal-count decile labels (1 = lowest .. n_deciles = highest)
#          from a numeric vector; non-finite entries and vectors with <2 finite
#          values receive NA.
equal_count_deciles <- function(x, n_deciles = N_DECILES) {
  x <- as.numeric(x)
  out <- rep(NA_integer_, length(x))
  ok <- is.finite(x)
  if (sum(ok) < 2L) return(out)
  r <- rank(x[ok], ties.method = "average")
  d <- as.integer(ceiling(r * n_deciles / sum(ok)))
  out[ok] <- pmin(d, n_deciles)
  out
}

# Purpose: absolute weight turnover between two named weight vectors.
weight_turnover <- function(new_w, old_w) {
  nm <- union(names(new_w), names(old_w))
  nv <- ifelse(nm %in% names(new_w), as.numeric(new_w[nm]), 0)
  ov <- ifelse(nm %in% names(old_w), as.numeric(old_w[nm]), 0)
  sum(abs(nv - ov), na.rm = TRUE)
}

# Purpose: trailing annualized realized volatility over `window` observations.
rolling_realized_vol <- function(r, window = VOL_WINDOW) {
  r <- as.numeric(r)
  n <- length(r)
  out <- rep(NA_real_, n)
  if (n < window) return(out)
  for (i in window:n) {
    w <- r[(i - window + 1L):i]
    if (all(is.finite(w))) out[i] <- stats::sd(w) * sqrt(252)
  }
  out
}

# ----------------------------------------------------------------------------
# Panic overlay (simple adaptation of the Daniel-Moskowitz conditional weight)
# ----------------------------------------------------------------------------

# Purpose: build the causal daily overlay exposure for the scaled WML arm.
#          Exposure at t uses information through close t and is lagged one day
#          by the caller before it earns returns. Components:
#            * inverse-vol targeting  sigma_bar / trailing_vol (mean-1, capped);
#            * panic gate            1 - panic_p * I[bear], where I[bear] is the
#              negative trailing ~2-year (bear_window) market return indicator.
#          This is a simplified stand-in for the paper's conditional
#          mean/variance weight (bear x variance mean forecast + GJR-GARCH
#          variance) and is NOT equivalent to it.
build_panic_exposure <- function(mkt_ret, sigma_bar, panic_p, vol_window = VOL_WINDOW,
                                 bear_window = BEAR_WINDOW, max_lev = MAX_LEVERAGE) {
  vol <- rolling_realized_vol(mkt_ret, vol_window)
  bear <- as.numeric(trailing_compound_return(mkt_ret, bear_window) < 0)
  invvol <- sigma_bar / vol
  invvol[!is.finite(invvol)] <- 0
  invvol <- pmin(pmax(invvol, 0), max_lev)
  exposure <- invvol * (1 - panic_p * bear)
  exposure[!is.finite(exposure)] <- 0
  exposure
}

# ----------------------------------------------------------------------------
# Database helpers
# ----------------------------------------------------------------------------

# Purpose: open a SQL Server connection with retries and a liveness probe.
open_sql <- function(database) {
  conn <- sprintf(
    "Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=%s;Uid=%s;Pwd=%s;",
    ldbserver, database, ldbuser, ldbpassword)
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

# Purpose: execute a checked SQL query and normalize the result to a data.table.
sql_dt <- function(con, sql) {
  x <- sqlQuery(con, sql, stringsAsFactors = FALSE)
  if (!is.data.frame(x)) stop(paste(x, collapse = " | "))
  as.data.table(x)
}

# Purpose: quote a character vector for a SQL IN (...) clause.
quote_sql <- function(x) paste(sprintf("'%s'", gsub("'", "''", x)), collapse = ",")

# Purpose: return the directory of the currently executing R script.
script_dir <- function() {
  a <- commandArgs(trailingOnly = FALSE)
  f <- a[grepl("^--file=", a)]
  if (length(f)) dirname(normalizePath(sub("^--file=", "", f[1]))) else getwd()
}

# Purpose: compute the annualized Sharpe of a numeric return vector (used by
#          the pre-training grid search; -Inf for degenerate samples).
annualized_sharpe <- function(rets) {
  rets <- as.numeric(rets)
  rets <- rets[is.finite(rets)]
  if (length(rets) < 20L || stats::sd(rets) == 0) return(-Inf)
  mean(rets) / stats::sd(rets) * sqrt(252)
}

# Purpose: pre-train the panic overlay on an in-sample return window only.
#          Returns the mean pre-window trailing volatility (sigma_bar), the
#          panic reduction (panic_p) chosen from a fixed grid to maximize
#          in-sample gross Sharpe, and the full grid scores for audit. The
#          overlay is applied with a one-day causal lag.
fit_panic_params <- function(wml_ret, mkt_ret, vol_window = VOL_WINDOW,
                             bear_window = BEAR_WINDOW, max_lev = MAX_LEVERAGE,
                             grid = PANIC_GRID, drag = 0, turnover = NULL) {
  r <- as.numeric(mkt_ret)
  w <- as.numeric(wml_ret)
  stopifnot(length(r) == length(w), length(w) >= vol_window)
  if (is.null(turnover)) turnover <- rep(0, length(w))
  stopifnot(length(turnover) == length(w))
  vol <- rolling_realized_vol(r, vol_window)
  sigma_bar <- mean(vol, na.rm = TRUE)
  if (!is.finite(sigma_bar) || sigma_bar <= 0) sigma_bar <- 0.15
  score <- function(p) {
    expo <- build_panic_exposure(r, sigma_bar, p, vol_window, bear_window, max_lev)
    eff <- c(0, expo[-length(expo)])
    exposure_turnover <- c(0, abs(diff(eff)))
    annualized_sharpe(eff * w - drag * (eff * turnover + exposure_turnover))
  }
  scores <- vapply(grid, score, numeric(1))
  list(sigma_bar = sigma_bar,
       panic_p = grid[which.max(scores)],
       grid = data.frame(panic_p = grid, sharpe = scores),
       n = length(w))
}
