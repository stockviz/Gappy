#!/usr/bin/env Rscript
# build.R — producer for the momentum-crash US study.
# Purpose: load point-in-time S&P 500 membership and raw unadjusted closes,
#          form monthly 12-2 equal-weight long/short deciles, simulate static
#          and pre-trained panic/vol-scaled WML, and persist all artifacts.

source("helpers.R")
setwd(script_dir())

OUT_DIR <- "."
dir.create(OUT_DIR, recursive = TRUE, showWarnings = FALSE)

con <- open_sql("StockVizUs2")

# ----------------------------------------------------------------------------
# 1. Point-in-time S&P 500 membership
# ----------------------------------------------------------------------------
const <- sql_dt(con, "select PERIOD, SYMBOL from SP500_CONSTITUENTS where INDEX_NAME='SPX'")
const[, `:=`(PERIOD = as.Date(PERIOD), SYMBOL = trimws(as.character(SYMBOL)))]
const <- unique(const[!is.na(PERIOD) & SYMBOL != ""])
periods <- sort(unique(const$PERIOD))
const_symbols <- sort(unique(const$SYMBOL))

# ----------------------------------------------------------------------------
# 2. Raw unadjusted closes for constituents + the SPY benchmark
# ----------------------------------------------------------------------------
all_syms <- sort(unique(c(const_symbols, "SPY")))
px <- sql_dt(con, sprintf(
  "select SYMBOL, TIME_STAMP, C from BHAV_EQ_TD where TIME_STAMP >= '%s' and C > 0 and SYMBOL in (%s) order by SYMBOL, TIME_STAMP",
  PRICE_START, quote_sql(all_syms)))
odbcClose(con)
px[, `:=`(TIME_STAMP = as.Date(TIME_STAMP), SYMBOL = as.character(SYMBOL), C = as.numeric(C))]
px <- unique(px[is.finite(C) & C > 0 & !is.na(TIME_STAMP)], by = c("SYMBOL", "TIME_STAMP"))
setorder(px, SYMBOL, TIME_STAMP)

price_syms <- sort(unique(px$SYMBOL))
data_dates <- sort(unique(px$TIME_STAMP))
date_idx <- setNames(seq_along(data_dates), as.character(data_dates))
sym_idx <- setNames(seq_along(price_syms), price_syms)

pxMat <- matrix(NA_real_, length(data_dates), length(price_syms),
                dimnames = list(as.character(data_dates), price_syms))
ri <- date_idx[as.character(px$TIME_STAMP)]
ci <- sym_idx[px$SYMBOL]
ok <- !is.na(ri) & !is.na(ci)
pxMat[cbind(ri[ok], ci[ok])] <- px$C[ok]

# Purpose: build per-symbol daily returns from consecutive observed closes;
#          a move above MAX_DAILY_MOVE is treated as a corporate action.
retMat <- matrix(NA_real_, nrow(pxMat), ncol(pxMat))
for (j in seq_along(price_syms)) {
  o <- which(is.finite(pxMat[, j]))
  if (length(o) > 1L) retMat[o[-1L], j] <- pxMat[o[-1L], j] / pxMat[o[-length(o)], j] - 1
}
retMat[is.finite(retMat) & abs(retMat) > MAX_DAILY_MOVE] <- NA_real_

# Pre-extract ascending per-symbol closes for fast momentum lookups.
sym_close_dates <- lapply(seq_along(price_syms), function(j) data_dates[is.finite(pxMat[, j])])
sym_close_prices <- lapply(seq_along(price_syms), function(j) pxMat[is.finite(pxMat[, j]), j])

spy_col <- sym_idx[["SPY"]]
if (is.na(spy_col)) stop("SPY not found in BHAV_EQ_TD")
spy_ret <- retMat[, spy_col]
mkt_ret <- spy_ret
mkt_ret[is.na(mkt_ret)] <- 0

# ----------------------------------------------------------------------------
# 3. Form 12-2 deciles at each month-end decision date (as-of decision)
# ----------------------------------------------------------------------------
sigdates <- month_end_dates(data_dates)
positions_long <- list()
positions_short <- list()
snapshot_by_date <- list()
feature_rows <- list()

for (di in seq_along(sigdates)) {
  d <- sigdates[di]
  avail <- periods[periods <= d]
  if (!length(avail)) next
  snap <- tail(avail, 1L)
  mem <- intersect(unique(const[PERIOD == snap, SYMBOL]), price_syms)
  if (length(mem) < MIN_UNIVERSE) next
  moms <- vapply(mem, function(s) {
    j <- sym_idx[[s]]
    momentum_122(sym_close_dates[[j]], sym_close_prices[[j]], d, max_move = MAX_DAILY_MOVE)
  }, numeric(1))
  names(moms) <- mem
  moms <- moms[is.finite(moms)]
  if (length(moms) < MIN_UNIVERSE) next
  dec <- equal_count_deciles(moms)
  long_syms <- names(moms)[dec == N_DECILES]
  short_syms <- names(moms)[dec == 1L]
  if (!length(long_syms) || !length(short_syms)) next
  positions_long[[as.character(d)]] <- setNames(rep(1 / length(long_syms), length(long_syms)), long_syms)
  positions_short[[as.character(d)]] <- setNames(rep(1 / length(short_syms), length(short_syms)), short_syms)
  snapshot_by_date[[as.character(d)]] <- snap
  feature_rows[[as.character(d)]] <- data.table(
    DATE = d, SYMBOL = names(moms), MOM = as.numeric(moms), DECILE = dec)
}
valid_sigdates <- sort(as.Date(names(positions_long)))

# ----------------------------------------------------------------------------
# 4. Simulate daily returns (causal: month-end close decision applies next day)
# ----------------------------------------------------------------------------
nD <- length(data_dates)
long_gross <- rep(0, nD)
short_gross <- rep(0, nD)
to_long <- rep(0, nD)
to_short <- rep(0, nD)

for (k in seq_along(valid_sigdates)) {
  d0 <- valid_sigdates[k]
  d1 <- if (k < length(valid_sigdates)) valid_sigdates[k + 1L] else tail(data_dates, 1L)
  hold <- which(data_dates > d0 & data_dates <= d1)
  if (!length(hold)) next
  syL <- positions_long[[as.character(d0)]]
  syS <- positions_short[[as.character(d0)]]
  rL <- retMat[hold, unname(sym_idx[names(syL)]), drop = FALSE]
  rS <- retMat[hold, unname(sym_idx[names(syS)]), drop = FALSE]
  rL[is.na(rL)] <- 0   # stale-mark: missing holding-period return counts as zero
  rS[is.na(rS)] <- 0
  long_gross[hold] <- rowMeans(rL)
  short_gross[hold] <- rowMeans(rS)
  if (k > 1L) {
    oldL <- positions_long[[as.character(valid_sigdates[k - 1L])]]
    oldS <- positions_short[[as.character(valid_sigdates[k - 1L])]]
    to_long[hold[1L]] <- weight_turnover(syL, oldL)
    to_short[hold[1L]] <- weight_turnover(syS, oldS)
  }
}

long_net <- long_gross - DRAG * to_long
short_net <- short_gross - DRAG * to_short
wml_gross <- long_gross - short_gross
wml_net <- wml_gross - DRAG * (to_long + to_short)

# ----------------------------------------------------------------------------
# 5. Pre-train the panic/vol overlay on the PRE window only (<= 2019-12-31)
# ----------------------------------------------------------------------------
invest_start <- which(data_dates > min(valid_sigdates))[1]
pre_idx <- which(data_dates <= TRAIN_END)
# Retain the pre-book SPY history for the 504-day bear lookback. Mark days
# without a WML book as missing, rather than scoring fictitious zero P&L.
pre_wml <- wml_gross[pre_idx]
pre_wml[pre_idx < invest_start] <- NA_real_
fit <- fit_panic_params(pre_wml, mkt_ret[pre_idx], drag = DRAG,
                        turnover = (to_long + to_short)[pre_idx])

# Full-timeline causal exposure: exposure_t uses information through close t,
# effective exposure for day t is exposure_{t-1}.
expo <- build_panic_exposure(mkt_ret, fit$sigma_bar, fit$panic_p, VOL_WINDOW, BEAR_WINDOW, MAX_LEVERAGE)
eff <- c(0, expo[-nD])
expo_cost <- c(0, abs(diff(eff)))
scaled_net <- eff * wml_gross - DRAG * expo_cost - DRAG * eff * (to_long + to_short)

# ----------------------------------------------------------------------------
# 6. Assemble series and metrics (full / pre / post)
# ----------------------------------------------------------------------------
sim_dates <- data_dates[invest_start:nD]
series <- list(
  SPY        = xts(spy_ret[invest_start:nD], sim_dates),
  WML_Long   = xts(long_net[invest_start:nD], sim_dates),
  WML_Short  = xts(short_net[invest_start:nD], sim_dates),
  WML        = xts(wml_net[invest_start:nD], sim_dates),
  WML_Scaled = xts(scaled_net[invest_start:nD], sim_dates)
)

to_vec <- list(
  SPY        = rep(0, length(sim_dates)),
  WML_Long   = to_long[invest_start:nD],
  WML_Short  = to_short[invest_start:nD],
  WML        = (to_long + to_short)[invest_start:nD],
  WML_Scaled = (eff * (to_long + to_short) + expo_cost)[invest_start:nD]
)
expo_vec <- list(
  SPY        = rep(1, length(sim_dates)),
  WML_Long   = rep(1, length(sim_dates)),
  WML_Short  = rep(1, length(sim_dates)),
  WML        = rep(1, length(sim_dates)),
  WML_Scaled = eff[invest_start:nD]
)

windows <- list(pre = list(NULL, TRAIN_END), post = list(POST_START, NULL), full = list(NULL, NULL))
metric_rows <- list()
for (nm in names(series)) {
  x <- series[[nm]]
  for (w in names(windows)) {
    b <- windows[[w]]
    y <- slice_returns(x, b[[1]], b[[2]])
    y <- y[is.finite(y)]
    m <- if (length(y)) strategy_metrics(y) else c(N = 0, CAGR = NA_real_, Vol = NA_real_, Sharpe = NA_real_, MaxDD = NA_real_)
    mask <- rep(TRUE, length(sim_dates))
    if (!is.null(b[[1]])) mask <- mask & sim_dates >= b[[1]]
    if (!is.null(b[[2]])) mask <- mask & sim_dates <= b[[2]]
    metric_rows[[length(metric_rows) + 1L]] <- data.table(
      System = nm, Window = w,
      N = as.numeric(m[["N"]]), CAGR = as.numeric(m[["CAGR"]]), Vol = as.numeric(m[["Vol"]]),
      Sharpe = as.numeric(m[["Sharpe"]]), MaxDD = as.numeric(m[["MaxDD"]]),
      AvgExposure = mean(expo_vec[[nm]][mask], na.rm = TRUE),
      Turnover = sum(to_vec[[nm]][mask], na.rm = TRUE))
  }
}
metrics <- rbindlist(metric_rows)

# ----------------------------------------------------------------------------
# 7. Persist artifacts
# ----------------------------------------------------------------------------
daily <- data.table(date = sim_dates)
for (nm in names(series)) daily[[nm]] <- as.numeric(series[[nm]])
fwrite(daily, file.path(OUT_DIR, "daily_returns.csv"))

positions_dt <- rbindlist(lapply(as.character(valid_sigdates), function(dk) {
  rbind(
    data.table(DATE = as.Date(dk), SYSTEM = "Long",  SYMBOL = names(positions_long[[dk]]),  WEIGHT = unname(positions_long[[dk]])),
    data.table(DATE = as.Date(dk), SYSTEM = "Short", SYMBOL = names(positions_short[[dk]]), WEIGHT = unname(positions_short[[dk]]))
  )
}), use.names = TRUE)
setorder(positions_dt, DATE, SYSTEM, SYMBOL)
fwrite(positions_dt, file.path(OUT_DIR, "positions_monthly.csv"))

features_dt <- rbindlist(feature_rows, use.names = TRUE)
setorder(features_dt, DATE, -MOM, SYMBOL)
fwrite(features_dt, file.path(OUT_DIR, "features_monthly.csv"))

decisions <- data.table(
  DATE = valid_sigdates,
  SNAPSHOT_PERIOD = as.Date(unlist(snapshot_by_date[as.character(valid_sigdates)])),
  N_LONG = vapply(positions_long[as.character(valid_sigdates)], length, integer(1)),
  N_SHORT = vapply(positions_short[as.character(valid_sigdates)], length, integer(1))
)
if (length(valid_sigdates) > 1L) {
  decisions[, LONG_TURNOVER := c(NA_real_, vapply(2:length(valid_sigdates), function(k) {
    weight_turnover(positions_long[[as.character(valid_sigdates[k])]], positions_long[[as.character(valid_sigdates[k - 1L])]])
  }, numeric(1)))]
  decisions[, SHORT_TURNOVER := c(NA_real_, vapply(2:length(valid_sigdates), function(k) {
    weight_turnover(positions_short[[as.character(valid_sigdates[k])]], positions_short[[as.character(valid_sigdates[k - 1L])]])
  }, numeric(1)))]
}
fwrite(decisions, file.path(OUT_DIR, "decisions_audit.csv"))

exposure_audit <- data.table(
  date = data_dates,
  mkt_ret = mkt_ret,
  realized_vol = rolling_realized_vol(mkt_ret, VOL_WINDOW),
  bear = as.numeric(trailing_compound_return(mkt_ret, BEAR_WINDOW) < 0),
  exposure = expo,
  eff_exposure = eff
)
fwrite(exposure_audit, file.path(OUT_DIR, "exposure_audit.csv"))

data_audit <- data.table(
  constituent_snapshots = length(periods),
  constituent_symbols = length(const_symbols),
  price_symbols = length(price_syms),
  membership_price_overlap = sum(price_syms %in% const_symbols),
  first_period = min(periods), last_period = max(periods),
  first_price = min(data_dates), last_price = max(data_dates),
  n_dates = nD,
  missing_price_cells = sum(!is.finite(pxMat)),
  zero_return_cells = sum(retMat == 0, na.rm = TRUE),
  first_signal = min(valid_sigdates), last_signal = max(valid_sigdates),
  n_rebalances = length(valid_sigdates),
  min_universe = MIN_UNIVERSE, n_deciles = N_DECILES,
  drag_bps = DRAG * 10000, max_daily_move_guard = MAX_DAILY_MOVE,
  sigma_bar = fit$sigma_bar, panic_p = fit$panic_p,
  vol_window = VOL_WINDOW, bear_window = BEAR_WINDOW, max_leverage = MAX_LEVERAGE
)
fwrite(data_audit, file.path(OUT_DIR, "data_audit.csv"))
fwrite(as.data.table(fit$grid), file.path(OUT_DIR, "panic_grid.csv"))
fwrite(metrics, file.path(OUT_DIR, "metrics.csv"))

saveRDS(list(
  params = list(source = "StockVizUs2.BHAV_EQ_TD (raw C, price-only)",
                constituents = "SP500_CONSTITUENTS (INDEX_NAME='SPX'), latest PERIOD <= decision date",
                momentum = "12-2 (months t-12..t-2, one-month skip)", deciles = N_DECILES,
                drag = DRAG, min_universe = MIN_UNIVERSE, max_daily_move_guard = MAX_DAILY_MOVE,
                pre_end = TRAIN_END, post_start = POST_START,
                overlay = "inverse-vol targeting x (1 - panic_p * I[bear]); bear = trailing ~2y market return < 0",
                vol_window = VOL_WINDOW, bear_window = BEAR_WINDOW, max_leverage = MAX_LEVERAGE),
  series = series, metrics = metrics,
  positions_long = positions_long, positions_short = positions_short,
  decisions = decisions, features = features_dt,
  exposure = exposure_audit, fit = fit, data_audit = data_audit,
  built = Sys.time()
), file.path(OUT_DIR, "checkpoint.rds"))

cat(sprintf(
  "US momentum-crash build complete: %d rebalances (%s..%s), %d symbols, %d dates, %d metric rows\n",
  length(valid_sigdates), min(valid_sigdates), max(valid_sigdates),
  length(price_syms), nD, nrow(metrics)))
cat(sprintf("Pre-trained overlay: sigma_bar=%.4f, panic_p=%.2f (grid over pre-2020)\n",
            fit$sigma_bar, fit$panic_p))
