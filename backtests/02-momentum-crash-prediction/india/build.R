# build.R — India arm of "Momentum Crashes" (Daniel & Moskowitz 2016).
# =============================================================================
# True long-short (WML) single-stock-futures momentum on the India universe,
# a crash diagnostic (bear x high-variance panic states + written-call beta),
# and a PRE-trained panic exposure overlay (Static / CVol / Panic / Gate arms).
#
# This is an ADAPTATION, not a literal reproduction — see README.md. Key
# differences from the paper: (1) 12-2 momentum is computed on adjusted cash
# prices in trading days (skip 21d, look back 252d) instead of CRSP monthly
# value-weighted deciles; (2) long/short are top-20 / bottom-20 equal-weight
# single-stock futures (not top/bottom decile); (3) the panic overlay is a
# pre-trained mean/variance scalar, not the paper's GJR-GARCH variance model;
# (4) the bear indicator is the 24-month (504-day) cumulative market return < 0
# and market variance is the trailing 126-day variance — matching the paper's
# instruments exactly (NOT a running drawdown).
#
# House rules: causal one-day lag, contract-safe futures returns, 25 bps
# turnover drag, PRE ends 2019-12-31, POST begins 2020-05-01, all parameters
# (gamma regression, variance threshold, target vol, normalization) fitted on
# PRE only and applied untouched to POST.

source("/mnt/ssd1/stockviz/R2/backtests/common/runtime.R")
source_common("returns")
source_common("futures")
source("helpers.R")

suppressPackageStartupMessages({
  library(RODBC)
  library(RPostgres)
  library(data.table)
  library(xts)
  library(PerformanceAnalytics)
})

options(scipen = 100)
options(stringsAsFactors = FALSE)
pdf(NULL)

source("/mnt/hollandC/StockViz/R/config.r")

# ── Parameters (paper instruments + house windows) ──────────────────────────
FUT_START   <- "2015-06-01"          # futures liquidity window (matches anchor)
ENTRY_OFFSET <- 5L                    # business days before expiry to roll
DRAG        <- 0.0025                # 25 bps per unit turnover
TOP_N       <- 20L                   # long top-20 / short bottom-20 (decile adaptation)
SKIP_DAYS   <- 21L                    # 12-2 skip: most recent month (trading days)
LOOKBACK    <- 252L                   # 12-2 look-back: 12 months (trading days)
BEAR_HORIZON <- 504L                  # 24-month bear indicator (trading days)
VAR_HORIZON <- 126L                   # 126-day ex ante market variance
VOL_HORIZON <- 126L                   # trailing WML variance/vol horizon
CAP         <- 2.0                    # overlay leverage cap (never flips sign)
MIN_PRE_BEAR <- 63L                   # require a quarter of bear observations to fit interaction
TRAIN_END   <- as.Date("2019-12-31")
POST_START  <- as.Date("2020-05-01")

OUT_DIR <- "."
dir.create(OUT_DIR, recursive = TRUE, showWarnings = FALSE)
setwd(OUT_DIR)

# ── Connections ─────────────────────────────────────────────────────────────
lcon <- odbcDriverConnect(
  sprintf("Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=%s;Uid=%s;Pwd=%s;",
          ldbserver, "StockViz", ldbuser, ldbpassword),
  case = "nochange", believeNRows = TRUE)
pgCon <- dbConnect(RPostgres::Postgres(), host = "sweden",
                   user = ldbuser2, password = ldbpassword2,
                   dbname = "StockVizDyn", sslmode = "allow")

# ── 1. Futures universe (single-stock + index, STRIKE_PR = 0) ───────────────
cat("Loading futures (BHAV_EQ_FUT, STRIKE_PR = 0)...\n")
futDf <- sqlQuery(lcon, sprintf(
  "select SYMBOL, EXPIRY_DT, PX_CLOSE, TIME_STAMP from BHAV_EQ_FUT
   where STRIKE_PR = 0 and OPTION_TYP = 'XX' and TIME_STAMP >= '%s' and PX_CLOSE > 0", FUT_START))
if (!is.data.frame(futDf)) stop("futures query failed")
futDf <- as.data.table(futDf)
futDf[, TIME_STAMP := as.Date(TIME_STAMP)]
futDf[, EXPIRY_DT := as.Date(EXPIRY_DT)]
futDf <- futDf[!is.na(PX_CLOSE) & PX_CLOSE > 0]
futSyms <- sort(unique(futDf$SYMBOL))
cat(sprintf("  %d futures symbols\n", length(futSyms)))

# ── 2. Market index (NIFTY 50 TR) for bear/variance instruments ─────────────
cat("Loading NIFTY 50 TR...\n")
niftyDf <- sqlQuery(lcon, sprintf(
  "select time_stamp, px_close from bhav_index
   where index_name = 'NIFTY 50 TR' and time_stamp >= '%s' order by time_stamp",
  "2013-01-01"))
niftyDf <- as.data.table(niftyDf)
niftyDf[, time_stamp := as.Date(time_stamp)]
niftyDf <- niftyDf[!is.na(px_close) & px_close > 0]
niftyXts <- xts(niftyDf$px_close, as.Date(niftyDf$time_stamp))
niftyRet <- diff(niftyXts) / lag.xts(niftyXts, 1L)
niftyRet <- na.omit(niftyRet)
colnames(niftyRet) <- "NIFTY50_TR"

# ── 3. Adjusted stock prices (12-2 momentum, point-in-time) ─────────────────
cat("Loading adjusted stock prices (eod_adjusted_nse)...\n")
pxDf <- dbGetQuery(pgCon, "
  select ticker, date_stamp, c from eod_adjusted_nse
  where date_stamp >= '2014-01-01' and c > 0
  order by ticker, date_stamp")
pxDf$date_stamp <- as.Date(pxDf$date_stamp)
pxDf <- pxDf[!is.na(pxDf$c) & pxDf$c > 0, ]
pxDf$ticker <- toupper(pxDf$ticker)   # normalize to NSE uppercase (matches BHAV_EQ_FUT)
stockPx <- split(pxDf[, c("date_stamp", "c")], pxDf$ticker)
stockPx <- lapply(stockPx, function(df) {
  df <- df[order(df$date_stamp), ]
  df[!duplicated(df$date_stamp), ]
})
cat(sprintf("  %d stock tickers with price history; %d match the futures universe\n",
            length(stockPx), sum(futSyms %in% names(stockPx))))

# ── 4. Corporate actions (eligibility filter; ex-date caveat documented) ────
cat("Loading corporate actions...\n")
caDf <- sqlQuery(lcon, sprintf(
  "select SYMBOL, EX_DATE from CORP_ACTION
   where SERIES = 'EQ' and EX_DATE >= '%s' and EX_DATE <= '2027-01-01'", FUT_START))
caDf <- as.data.table(caDf)
caDf[, EX_DATE := as.Date(EX_DATE)]
caDf <- caDf[!is.na(EX_DATE)]
caBySymbol <- split(caDf$EX_DATE, caDf$SYMBOL)

# ── 5. Futures calendar + contract-safe return matrix ───────────────────────
cat("Building futures calendar...\n")
calendar <- build_monthly_futures_calendar(
  futDf, start_date = as.Date("2015-08-01"), entry_offset = ENTRY_OFFSET,
  first_roll = as.Date("2015-09-03"), last_month = as.Date("2026-11-01"))
tradingDates <- calendar$trading_dates
rollDates <- calendar$roll_dates
heldAfter <- calendar$held_after

# heldLag: the contract held ON each date (previous day's heldAfter), so the
# daily return is computed WITHIN a single contract and never across expiries.
heldDf <- data.table(TIME_STAMP = tradingDates, heldAfter = heldAfter)
heldDf[, heldLag := shift(heldAfter, 1L, type = "lag")]

futDf <- as.data.table(contract_returns_sorted(futDf))
retDf <- futDf[heldDf[, .(TIME_STAMP, heldLag)], on = .(TIME_STAMP, EXPIRY_DT = heldLag),
               nomatch = 0L, .(SYMBOL, TIME_STAMP, ret)]

# ── Backtest date grid aligned to returns ───────────────────────────────────
firstRollIdx <- match(rollDates[1], tradingDates)
btStart <- tradingDates[max(1L, firstRollIdx - 1L)]
btDates <- tradingDates[tradingDates >= btStart]
nD <- length(btDates)
symIdx <- setNames(seq_along(futSyms), futSyms)
btDateIdx <- setNames(seq_len(nD), as.character(btDates))

retMat <- matrix(NA_real_, nD, length(futSyms),
                 dimnames = list(as.character(btDates), futSyms))
rr <- btDateIdx[as.character(retDf$TIME_STAMP)]
rc <- symIdx[retDf$SYMBOL]
rok <- !is.na(rr) & !is.na(rc)
retMat[cbind(rr[rok], rc[rok])] <- retDf$ret[rok]

# ── 6. 12-2 momentum ranking at each roll date (point-in-time) ──────────────
# Purpose: for a symbol, the 12-2 cumulative return using adjusted closes on or
# before the decision date (no lookahead).
momentum_asof <- function(sym, asof_date) {
  df <- stockPx[[sym]]
  if (is.null(df)) return(NA_real_)
  k <- findInterval(as.numeric(asof_date), as.numeric(df$date_stamp))
  if (k < 1L) return(NA_real_)
  momentum_12_2(df$c[1:k], skip = SKIP_DAYS, lookback = LOOKBACK)
}

cat("Ranking 12-2 momentum per roll date...\n")
# A roll is usable only if the calendar supplies a NEXT contract and at least
# one following return day. Terminal placeholder rolls can duplicate the final
# date; they cannot initiate a historical position.
rollExpiry <- heldAfter[match(rollDates, tradingDates)]
usableRoll <- !is.na(rollExpiry) & rollDates < max(btDates)
rollDates <- rollDates[usableRoll]
rollExpiry <- rollExpiry[usableRoll]
stopifnot(length(rollDates) > 0L, !anyDuplicated(rollDates))
setindexv(futDf, c("TIME_STAMP", "EXPIRY_DT"))
longByRoll <- list(); shortByRoll <- list(); eligibility <- vector("list", length(rollDates))
prevRoll <- as.Date(NA)
for (j in seq_along(rollDates)) {
  rd <- rollDates[j]          # index-subset to preserve the Date class
  expiry <- rollExpiry[j]    # contract first held AFTER this decision close
  key <- as.character(rd)
  quoteRows <- futDf[.(rd, expiry), on = .(TIME_STAMP, EXPIRY_DT),
                     .(SYMBOL, TIME_STAMP, EXPIRY_DT, PX_CLOSE)]
  live <- unique(quoteRows$SYMBOL[is.finite(quoteRows$PX_CLOSE) & quoteRows$PX_CLOSE > 0])
  # corp-action window = previous roll .. this roll (holding period of last book)
  caCut <- !is.na(prevRoll)
  scores <- setNames(vapply(live, function(s) {
    if (caCut && s %in% names(caBySymbol)) {
      ca <- caBySymbol[[s]]
      if (any(ca > prevRoll & ca <= rd)) return(NA_real_)
    }
    momentum_asof(s, rd)
  }, numeric(1)), live)
  book <- rank_tradable_futures(scores, quoteRows, rd, expiry, top_n = TOP_N)
  longByRoll[[key]] <- book$long
  shortByRoll[[key]] <- book$short
  eligibility[[j]] <- data.table(roll_date = rd, held_expiry = expiry,
                                  n_quoted = length(live), n_rankable = book$n_eligible,
                                  n_long = length(book$long), n_short = length(book$short))
  prevRoll <- rd
}
eligibility <- rbindlist(eligibility)
cat(sprintf("  %d roll dates ranked; first long=%d short=%d\n", length(longByRoll),
            length(longByRoll[[as.character(rollDates[1])]]),
            length(shortByRoll[[as.character(rollDates[1])]])))

# ── 7. Static WML simulation (unscaled spread for the diagnostic) ───────────
cat("Simulating static WML...\n")
rollKeys <- as.character(rollDates)
wStatic <- rep(1, nD)
staticSim <- simulate_wml(retMat, btDates, rollKeys, longByRoll, shortByRoll,
                          w_target = wStatic, drag = DRAG,
                          n_long = TOP_N, n_short = TOP_N)
wmlGross <- staticSim$wml_gross            # unscaled 1x long-short (diagnostic)
staticNet <- staticSim$net
# Persist the audit before enforcing the guard so a blocked run explains which
# held contracts were missing. Both legs must remain close to 20 live names.
coverage <- data.table(date = btDates,
                       long_held = staticSim$n_long_held,
                       long_live = staticSim$n_long_live,
                       short_held = staticSim$n_short_held,
                       short_live = staticSim$n_short_live)
fwrite(eligibility, "roll_eligibility.csv")
fwrite(coverage, "holding_coverage.csv")
cat(sprintf("  quoted held contracts: long %.2f/20, short %.2f/20\n",
            mean(coverage$long_live[coverage$long_held > 0]),
            mean(coverage$short_live[coverage$short_held > 0])))
assert_book_coverage(staticSim, TOP_N, TOP_N)
cat(sprintf("  retMat non-NA cells: %d / %d\n", sum(is.finite(retMat)), length(retMat)))
cat(sprintf("  wmlGross finite days: %d / %d\n", sum(is.finite(wmlGross)), nD))
if (any(is.finite(wmlGross))) cat(sprintf("    finite range: %s .. %s\n",
  min(btDates[is.finite(wmlGross)]), max(btDates[is.finite(wmlGross)])))

# ── 8. Market panic instruments (causal, through each close) ────────────────
cat("Building market panic instruments...\n")
mktDates <- as.Date(index(niftyRet))
mktRetVec <- as.numeric(coredata(niftyRet))
# align market returns onto btDates (left join; missing -> NA)
mtch <- match(as.character(btDates), as.character(mktDates))
mktAligned <- rep(NA_real_, nD)
mktAligned[!is.na(mtch)] <- mktRetVec[mtch[!is.na(mtch)]]

marketState <- market_panic_asof(mktDates, mktRetVec, btDates,
                                 bear_horizon = BEAR_HORIZON,
                                 var_horizon = VAR_HORIZON)
bear <- marketState$bear
mktVar <- marketState$variance

# ── 9. PRE-only training of overlay parameters ──────────────────────────────
# Everything below uses ONLY data through TRAIN_END; applied untouched to POST.
cat("Pre-training overlay on PRE window (through 2019-12-31)...\n")
preIdx <- which(btDates <= TRAIN_END)
preWml <- wmlGross[preIdx]
preFinite <- which(is.finite(preWml))

# (a) mean-forecast regression: wml ~ bear + var + bear*var (paper Table 5 style)
regData <- data.frame(
  y = preWml[preFinite],
  bear = as.integer(bear[preIdx][preFinite]),
  var = mktVar[preIdx][preFinite])
gammaFull <- as.numeric(coef(lm(y ~ bear * var, data = regData)))
names(gammaFull) <- c("g0", "gB", "gVar", "gInt")
# Sparse panic samples make the interaction highly unstable. Use the full
# model only if the PRE period has at least a quarter of bear observations.
gammaVar <- as.numeric(coef(lm(y ~ var, data = regData)))   # c(g0, gVar)
nPreBear <- sum(bear[preIdx], na.rm = TRUE)
gamma <- if (nPreBear >= MIN_PRE_BEAR && all(is.finite(gammaFull)))
  gammaFull else c(g0 = gammaVar[1], gB = 0, gVar = gammaVar[2], gInt = 0)
names(gamma) <- c("g0", "gB", "gVar", "gInt")
cat(sprintf("  PRE bear days (24m cum return < 0): %d\n", nPreBear))

# (b) variance threshold = PRE 80th percentile of ex ante market variance
varThreshold <- as.numeric(quantile(mktVar[preIdx], 0.80, na.rm = TRUE))

# (c) target volatility for CVol = PRE realized vol of the static WML
preWmlFinite <- preWml[is.finite(preWml)]
targetVol <- sd(preWmlFinite) * sqrt(252)

# (d) dynamic normalization c: mean PRE weight ~ 1 before clipping
preMuHat <- vapply(preIdx, function(i) forecast_wml_mean(gamma, bear[i], mktVar[i]), numeric(1))
preVarHat <- vapply(preIdx, function(i) {
  seg <- wmlGross[1:i]; seg <- seg[is.finite(seg)]
  if (length(seg) < VOL_HORIZON) NA_real_ else trailing_variance(seg, VOL_HORIZON)
}, numeric(1))
preRaw <- preMuHat / preVarHat
preRaw <- preRaw[is.finite(preRaw)]
cNorm <- 1 / mean(preRaw)                  # average PRE weight ~ 1

cat(sprintf("  gamma (full): %s\n", paste(sprintf("%.5f", gammaFull), collapse = ", ")))
cat(sprintf("  gamma (variance-only, used): %s\n", paste(sprintf("%.5f", gamma), collapse = ", ")))
cat(sprintf("  var threshold: %.2e  target vol: %.2f  c norm: %.2f\n",
            varThreshold, targetVol, cNorm))

# ── 10. Overlay weight targets (full sample, causal) ────────────────────────
cat("Computing overlay weights (full sample)...\n")
muHatFull <- rep(NA_real_, nD)
varHatFull <- rep(NA_real_, nD)
for (i in seq_len(nD)) {
  muHatFull[i] <- forecast_wml_mean(gamma, bear[i], mktVar[i])
  seg <- wmlGross[1:i]; seg <- seg[is.finite(seg)]
  varHatFull[i] <- if (length(seg) < VOL_HORIZON) NA_real_
                   else trailing_variance(seg, VOL_HORIZON)
}
volHatFull <- sqrt(varHatFull) * sqrt(252)

wPanic <- dynamic_weight_series(muHatFull, varHatFull, c = cNorm,
                                lower = 0, upper = CAP)
wCVol  <- cvol_weight_series(volHatFull, target_vol = targetVol, cap = CAP)
wGate  <- ifelse(vapply(seq_len(nD), function(i)
                panic_flag(bear[i], mktVar[i], varThreshold), logical(1)), 0, 1)

# ── 11. Simulate every arm ──────────────────────────────────────────────────
cat("Simulating overlay arms...\n")
simulate_arm <- function(w) {
  simulate_wml(retMat, btDates, rollKeys, longByRoll, shortByRoll,
               w_target = w, drag = DRAG, n_long = TOP_N, n_short = TOP_N)
}
sims <- list(
  WML_Static = simulate_arm(wStatic),
  WML_CVol   = simulate_arm(wCVol),
  WML_Panic  = simulate_arm(wPanic),
  WML_Gate   = simulate_arm(wGate)
)

# ── 12. Metrics (pre / post / full) ─────────────────────────────────────────
arm_names <- names(sims)
series <- setNames(lapply(sims, function(s) xts(s$net, btDates)), arm_names)
niftyAligned <- rep(NA_real_, nD)
mm <- match(as.character(btDates), as.character(index(niftyRet)))
niftyAligned[!is.na(mm)] <- as.numeric(coredata(niftyRet))[mm[!is.na(mm)]]
series$NIFTY50_TR <- xts(niftyAligned, btDates)

window_metrics_row <- function(rets, system, window) {
  y <- slice_returns(rets, if (window == "post") as.character(POST_START) else NULL,
                     if (window == "pre") as.character(TRAIN_END) else NULL)
  if (NROW(y) == 0L) return(data.table(system = system, window = window, N = 0L,
                                       CAGR = NA_real_, Vol = NA_real_,
                                       Sharpe = NA_real_, MaxDD = NA_real_,
                                       AvgExp = NA_real_, Turnover = NA_real_))
  m <- strategy_metrics(y)
  # average exposure and total turnover for this window (from the sim's w_eff)
  idx <- which(btDates %in% index(y))
  data.table(system = system, window = window, N = as.numeric(m[["N"]]),
             CAGR = as.numeric(m[["CAGR"]]), Vol = as.numeric(m[["Vol"]]),
             Sharpe = as.numeric(m[["Sharpe"]]), MaxDD = as.numeric(m[["MaxDD"]]),
             AvgExp = if (system %in% arm_names) mean(sims[[system]]$w_eff[idx], na.rm = TRUE) else NA_real_,
             Turnover = if (system %in% arm_names) sum(sims[[system]]$turnover[idx], na.rm = TRUE) else NA_real_)
}
metrics <- rbindlist(lapply(arm_names, function(nm) {
  rbindlist(lapply(c("pre", "post", "full"), function(w) window_metrics_row(series[[nm]], nm, w)))
}))
# benchmark row for context (not part of the green-favorable WML comparison)
benchRows <- rbindlist(lapply(c("pre", "post", "full"), function(w) {
  window_metrics_row(series$NIFTY50_TR, "NIFTY50_TR", w)
}))
metrics <- rbind(metrics, benchRows)

# ── 13. Crash diagnostic (attribution, NOT used for hedging) ────────────────
cat("Computing crash diagnostic...\n")
mktDayRet <- mktAligned                      # market return on each btDate
diagDf <- data.table(date = btDates, wml = wmlGross, mkt = mktDayRet,
                     is_bear = bear, mkt_var = mktVar,
                     up = !is.na(mktDayRet) & mktDayRet > 0,
                     panic = vapply(seq_len(nD), function(i)
                       panic_flag(bear[i], mktVar[i], varThreshold), logical(1)))
diagDf <- diagDf[is.finite(wml)]
# local logicals aligned to diagDf rows (avoids column/global name shadowing)
dBear <- diagDf$is_bear; dUp <- diagDf$up; dPanic <- diagDf$panic
# worst daily crashes (negative wml) with their state
crashDays <- diagDf[order(wml)][1:min(20, .N)]
# state-conditional means (paper's panic quadrant)
stateStats <- rbindlist(list(
  data.table(state = "normal", n = sum(!dBear),
             mean_wml = mean(diagDf$wml[!dBear]),
             mean_mkt = mean(diagDf$mkt[!dBear], na.rm = TRUE)),
  data.table(state = "bear", n = sum(dBear),
             mean_wml = mean(diagDf$wml[dBear]),
             mean_mkt = mean(diagDf$mkt[dBear], na.rm = TRUE)),
  data.table(state = "bear_high_var", n = sum(dPanic),
             mean_wml = mean(diagDf$wml[dPanic]),
             mean_mkt = mean(diagDf$mkt[dPanic], na.rm = TRUE)),
  data.table(state = "bear_up", n = sum(dBear & dUp),
             mean_wml = mean(diagDf$wml[dBear & dUp]),
             mean_mkt = mean(diagDf$mkt[dBear & dUp], na.rm = TRUE))
))
# written-call diagnostic: WML beta in bear-up vs bear-down states (full sample)
diagDf[, state := ifelse(!is_bear, "normal",
                  ifelse(up, "bear_up", "bear_down"))]
betaRows <- rbindlist(lapply(c("normal", "bear_down", "bear_up"), function(st) {
  dd <- diagDf[state == st & is.finite(mkt)]
  if (nrow(dd) < 20) return(data.table(state = st, n = nrow(dd), beta = NA_real_,
                                       mean_wml = NA_real_, mean_mkt = NA_real_))
  b <- as.numeric(coef(lm(wml ~ mkt, data = dd))["mkt"])
  data.table(state = st, n = nrow(dd), beta = b,
             mean_wml = mean(dd$wml), mean_mkt = mean(dd$mkt))
}))

# ── 14. Write artifacts ─────────────────────────────────────────────────────
cat("Writing artifacts...\n")
fwrite(metrics, "metrics.csv")
fwrite(metrics[window == "pre"],  "metrics_pre.csv")
fwrite(metrics[window == "post"], "metrics_post.csv")
fwrite(metrics[window == "full"], "metrics_full.csv")

daily <- data.table(date = btDates)
for (nm in arm_names) daily[[nm]] <- sims[[nm]]$net
daily$NIFTY50_TR <- as.numeric(series$NIFTY50_TR)
fwrite(daily, "daily_returns.csv")

legs <- data.table(date = btDates,
                   leg_long = staticSim$leg_long, leg_short = staticSim$leg_short,
                   wml_gross = wmlGross)
fwrite(legs, "legs_daily.csv")

# effective holdings each day (forward-filled: a roll-date selection applies
# from the next trading day, matching simulate_wml's P&L timing)
effLong <- character(nD); effShort <- character(nD)
curLong <- character(); curShort <- character()
for (i in seq_len(nD)) {
  effLong[i] <- paste(curLong, collapse = "|")
  effShort[i] <- paste(curShort, collapse = "|")
  k <- as.character(btDates[i])
  if (k %in% rollKeys) { curLong <- longByRoll[[k]]; curShort <- shortByRoll[[k]] }
}
positions <- data.table(date = btDates, long = effLong, short = effShort)
fwrite(positions, "positions_daily.csv")

panic <- data.table(date = btDates, bear = bear, mkt_var = mktVar,
                    panic = vapply(seq_len(nD), function(i)
                      panic_flag(bear[i], mktVar[i], varThreshold), logical(1)),
                    w_target_panic = wPanic, w_target_cvol = wCVol, w_target_gate = wGate)
fwrite(panic, "panic_daily.csv")

turnover <- data.table(date = btDates)
for (nm in arm_names) turnover[[paste0("turnover_", tolower(sub("WML_", "", nm)))]] <- sims[[nm]]$turnover
fwrite(turnover, "turnover_daily.csv")

fwrite(crashDays, "crash_episodes.csv")
fwrite(stateStats, "state_stats.csv")
fwrite(betaRows, "state_betas.csv")

audit <- data.table(
  asset_class = "India: single-stock futures WML (top/bottom-20, 12-2 momentum)",
  first_date = min(btDates), last_date = max(btDates),
  n_dates = nD, n_symbols = length(futSyms),
  n_rolls = length(rollDates),
  min_quoted_at_roll = min(eligibility$n_quoted),
  min_rankable_at_roll = min(eligibility$n_rankable),
  mean_live_long = mean(coverage$long_live[coverage$long_held > 0]),
  mean_live_short = mean(coverage$short_live[coverage$short_held > 0]),
  max_missing_long = max(coverage$long_held - coverage$long_live),
  max_missing_short = max(coverage$short_held - coverage$short_live),
  missing_ret_cells = sum(!is.finite(retMat)),
  bear_days = sum(bear), panic_days = sum(vapply(seq_len(nD), function(i)
    panic_flag(bear[i], mktVar[i], varThreshold), logical(1))),
  static_turnover = sum(staticSim$turnover, na.rm = TRUE),
  panic_turnover = sum(sims$WML_Panic$turnover, na.rm = TRUE),
  gamma_g0 = gamma[["g0"]], gamma_gB = gamma[["gB"]],
  gamma_gVar = gamma[["gVar"]], gamma_gInt = gamma[["gInt"]],
  gamma_full_gB = gammaFull[["gB"]], gamma_full_gInt = gammaFull[["gInt"]],
  pre_bear_days = nPreBear, min_pre_bear = MIN_PRE_BEAR,
  var_threshold = varThreshold, target_vol = targetVol, c_norm = cNorm
)
fwrite(audit, "data_audit.csv")

saveRDS(list(
  params = list(fut_start = FUT_START, entry_offset = ENTRY_OFFSET, drag = DRAG,
                top_n = TOP_N, skip = SKIP_DAYS, lookback = LOOKBACK,
                bear_horizon = BEAR_HORIZON, var_horizon = VAR_HORIZON,
                vol_horizon = VOL_HORIZON, cap = CAP, min_pre_bear = MIN_PRE_BEAR,
                train_end = TRAIN_END, post_start = POST_START),
  btDates = btDates, futSyms = futSyms, rollDates = rollDates,
  rollExpiry = rollExpiry, eligibility = eligibility, coverage = coverage,
  retMat = retMat, longByRoll = longByRoll, shortByRoll = shortByRoll,
  sims = sims, series = series, metrics = metrics,
  wmlGross = wmlGross, bear = bear, mktVar = mktVar,
  gamma = gamma, gammaFull = gammaFull, nPreBear = nPreBear,
  varThreshold = varThreshold, targetVol = targetVol, cNorm = cNorm,
  wPanic = wPanic, wCVol = wCVol, wGate = wGate,
  crashDays = crashDays, stateStats = stateStats, betaRows = betaRows,
  audit = audit, built = Sys.time()
), "checkpoint.rds")

odbcClose(lcon)
dbDisconnect(pgCon)
cat(sprintf("Build complete: %d dates, %d symbols, %d metric rows\n",
            nD, length(futSyms), nrow(metrics)))
