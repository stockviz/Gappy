# helpers.R — pure, deterministic functions for the momentum-crash study.
# No I/O, no randomness, no package dependencies beyond base R. These are the
# testable core; build.R/analyze.R call them. Every function has a purpose
# comment. Signal/market conventions follow Daniel & Moskowitz (2016) as an
# ADAPTATION (see README.md): 12-2 skip-month momentum, 24-month bear
# indicator, 126-day market variance, and a pre-trained mean/variance overlay.

# Purpose: 12-2 momentum — cumulative return from t-12 to t-2 (skip most recent
# month). px is a numeric price vector oldest->newest; the current date is the
# last element. Returns px[n-skip]/px[n-lookback]-1, or NA when too short.
momentum_12_2 <- function(px, skip = 21L, lookback = 252L) {
  px <- as.numeric(px)
  n <- length(px)
  if (n <= lookback || n <= skip || skip >= lookback) return(NA_real_)
  p_end <- px[n - skip]
  p_start <- px[n - lookback]
  if (!is.finite(p_start) || !is.finite(p_end) || p_start <= 0 || p_end <= 0) {
    return(NA_real_)
  }
  p_end / p_start - 1
}

# Purpose: compounded return over the trailing `horizon` observations.
trailing_cum_return <- function(rets, horizon) {
  v <- as.numeric(rets)
  n <- length(v)
  if (n < horizon || horizon < 1L) return(NA_real_)
  prod(1 + v[(n - horizon + 1L):n], na.rm = TRUE) - 1
}

# Purpose: variance of the trailing `horizon` daily returns.
trailing_variance <- function(rets, horizon) {
  v <- as.numeric(rets)
  n <- length(v)
  if (n < horizon || horizon < 2L) return(NA_real_)
  var(v[(n - horizon + 1L):n], na.rm = TRUE)
}

# Purpose: annualized volatility (sd * sqrt(252)) of the trailing window.
trailing_ann_vol <- function(rets, horizon) {
  v <- trailing_variance(rets, horizon)
  if (!is.finite(v)) return(NA_real_)
  sqrt(v) * sqrt(252)
}

# Purpose: calculate market states using the complete index history available
# by each book date; the book's inception must not reset the bear lookback.
market_panic_asof <- function(market_dates, market_returns, book_dates,
                              bear_horizon = 504L, var_horizon = 126L) {
  stopifnot(length(market_dates) == length(market_returns),
            !is.unsorted(market_dates), all(is.finite(market_returns)))
  ix <- findInterval(as.Date(book_dates), as.Date(market_dates))
  bear <- rep(FALSE, length(ix))
  variance <- rep(NA_real_, length(ix))
  for (i in seq_along(ix)) {
    k <- ix[i]
    if (k >= bear_horizon) {
      r <- market_returns[(k - bear_horizon + 1L):k]
      bear[i] <- prod(1 + r) < 1
    }
    if (k >= var_horizon) {
      variance[i] <- stats::var(market_returns[(k - var_horizon + 1L):k])
    }
  }
  list(bear = bear, variance = variance)
}

# Purpose: sort contract observations by symbol, expiry and date before computing
# within-contract returns. SQL result order is not a chronology guarantee.
contract_returns_sorted <- function(rows) {
  rows <- rows[order(rows$SYMBOL, rows$EXPIRY_DT, rows$TIME_STAMP), , drop = FALSE]
  key <- paste(rows$SYMBOL, rows$EXPIRY_DT)
  prior <- c(TRUE, key[-1L] != key[-length(key)])
  rows$ret <- c(NA_real_, rows$PX_CLOSE[-1L] / rows$PX_CLOSE[-nrow(rows)] - 1)
  rows$ret[prior] <- NA_real_
  rows
}

# Purpose: rank only symbols with a positive quote for the selected next-month
# contract at this roll close. Cash history alone does not make a stock future
# historically tradable; never use the all-time union of futures symbols.
rank_tradable_futures <- function(scores, quotes, decision_date, held_expiry,
                                  top_n = 20L) {
  required <- c("SYMBOL", "TIME_STAMP", "EXPIRY_DT", "PX_CLOSE")
  if (!all(required %in% names(quotes))) stop("futures quotes lack required columns")
  if (length(held_expiry) != 1L || is.na(held_expiry)) stop("held expiry unavailable at roll")
  live <- unique(as.character(quotes$SYMBOL[
    !is.na(quotes$SYMBOL) & as.Date(quotes$TIME_STAMP) == as.Date(decision_date) &
      as.Date(quotes$EXPIRY_DT) == as.Date(held_expiry) &
      is.finite(quotes$PX_CLOSE) & quotes$PX_CLOSE > 0]))
  scores <- scores[is.finite(scores) & names(scores) %in% live]
  if (length(scores) < 2L * top_n) {
    stop(sprintf("insufficient tradable futures on %s: %d eligible, need %d",
                 as.character(decision_date), length(scores), 2L * top_n))
  }
  ranked <- names(scores)[order(scores, decreasing = TRUE, na.last = NA)]
  list(long = head(ranked, top_n), short = tail(ranked, top_n),
       n_eligible = length(scores))
}

# Purpose: stop when missing held-contract returns make the intended
# long/short book materially fictitious. Warm-up days with no holdings are
# excluded; occasional missing daily marks remain zero per house convention.
assert_book_coverage <- function(sim, n_long, n_short,
                                 min_mean_fraction = 0.95, max_missing = 2L) {
  active <- which(sim$n_long_held > 0L & sim$n_short_held > 0L)
  if (!length(active) || any(sim$n_long_held[active] != n_long) ||
      any(sim$n_short_held[active] != n_short)) stop("held-contract coverage: incomplete legs")
  ml <- n_long - sim$n_long_live[active]
  ms <- n_short - sim$n_short_live[active]
  if (any(!is.finite(ml)) || any(!is.finite(ms)) ||
      mean(sim$n_long_live[active]) / n_long < min_mean_fraction ||
      mean(sim$n_short_live[active]) / n_short < min_mean_fraction ||
      any(ml > max_missing) || any(ms > max_missing)) {
    stop(sprintf(paste("held-contract coverage: long %.2f/%d short %.2f/%d;",
                       "max missing long %d short %d (allowed %d)"),
                 mean(sim$n_long_live[active]), n_long,
                 mean(sim$n_short_live[active]), n_short,
                 max(ml), max(ms), max_missing))
  }
  TRUE
}

# Purpose: bear-market flag — TRUE when the trailing 24-month (504-day)
# cumulative market return is negative (Daniel & Moskowitz I_B indicator).
bear_flag <- function(mkt_rets, horizon = 504L) {
  cr <- trailing_cum_return(mkt_rets, horizon)
  if (!is.finite(cr)) return(FALSE)
  cr < 0
}

# Purpose: panic flag — bear market AND elevated ex ante market variance.
# var_threshold is the pre-trained cutoff (pre-period percentile). bear may be
# logical or numeric 0/1; convert with as.integer (never isTRUE(1), which is
# FALSE for numeric 1 — a known silent-bug trap).
panic_flag <- function(bear, mkt_var, var_threshold) {
  b <- as.integer(bear)
  if (length(b) != 1L || is.na(b)) b <- 0L
  b == 1L && is.finite(mkt_var) && mkt_var > var_threshold
}

# Purpose: pre-trained expected WML mean forecast from the bear x variance
# interaction regression: gamma = c(g0, gB, gVar, gInt); bear is 0/1.
# mkt_var is the ex ante market variance (126-day, daily units — see README).
forecast_wml_mean <- function(gamma, bear, mkt_var) {
  b <- as.integer(bear)
  if (length(b) != 1L || is.na(b)) b <- 0L
  if (!is.finite(mkt_var)) return(NA_real_)
  gamma[1] + gamma[2] * b + gamma[3] * mkt_var + gamma[4] * b * mkt_var
}

# Purpose: clip a scalar to [lower, upper].
clip_weight <- function(x, lower = 0, upper = 2) {
  max(lower, min(upper, x))
}

# Purpose: dynamic exposure w_t = clip(c * mu_hat / var_hat, lower, upper),
# the paper's Sharpe-maximizing w ∝ mu/sigma^2 (adaptation; see README).
# Non-finite/insufficient inputs return NEUTRAL (1.0): during warm-up we hold
# full exposure rather than de-risking on no evidence.
dynamic_weight_series <- function(mu_hat, var_hat, c = 1, lower = 0, upper = 2) {
  n <- length(mu_hat)
  out <- rep(NA_real_, n)
  for (i in seq_len(n)) {
    if (!is.finite(mu_hat[i]) || !is.finite(var_hat[i]) || var_hat[i] <= 0) {
      out[i] <- 1
      next
    }
    out[i] <- clip_weight(c * mu_hat[i] / var_hat[i], lower, upper)
  }
  out
}

# Purpose: constant-volatility scaling w_t = min(target_vol / vol_hat, cap).
# Non-finite vol returns NEUTRAL (1.0) for the same warm-up reason.
cvol_weight_series <- function(vol_hat, target_vol, cap = 2) {
  n <- length(vol_hat)
  out <- rep(NA_real_, n)
  for (i in seq_len(n)) {
    if (!is.finite(vol_hat[i]) || vol_hat[i] <= 0) { out[i] <- 1; next }
    out[i] <- min(target_vol / vol_hat[i], cap)
  }
  out
}

# Purpose: causal one-day lag of a target series. y[i] = x[i-1], y[1] = init,
# so a target known at close t-1 applies to return t (no lookahead).
lag_effective <- function(x, init = 1) {
  x <- as.numeric(x)
  c(init, x[-length(x)])
}

# Purpose: WML gross return = long-leg return minus short-leg raw return.
# Shorting a loser profits when its price falls, so R_WML = R_long - R_short.
wml_from_legs <- function(long_ret, short_ret) {
  as.numeric(long_ret) - as.numeric(short_ret)
}

# Purpose: per-day gross turnover from an exposure series (sum |dw|, first day
# measured against zero). Used to charge the 25 bps drag on exposure changes.
turnover_from_weights <- function(w) {
  w <- as.numeric(w)
  n <- length(w)
  if (n == 0L) return(numeric())
  out <- c(abs(w[1]), rep(NA_real_, n - 1L))
  if (n > 1L) out[2:n] <- abs(diff(w))
  out
}

# Purpose: full long-short momentum simulation (the core engine). Pure and
# deterministic. Positions are selected at each roll date and apply from the
# NEXT day; the overlay weight w_target is known at close i and applies from
# day i+1 (causal one-day lag). Per-name weights are +w/N (long) and -w/N
# (short); turnover is sum |dw| across all names, so both monthly rotation and
# overlay de-risking are costed at the 25 bps drag.
#
# Args:
#   ret_mat      numeric matrix [n_days x n_symbols] of contract-safe returns.
#   dates        Date vector length n_days aligned to ret_mat rows.
#   roll_keys    character dates (subset of dates) on which rebalancing occurs.
#   long_by_roll named list keyed by date-string -> symbol vector (top N).
#   short_by_roll named list keyed by date-string -> symbol vector (bottom N).
#   w_target     numeric length n_days; overlay target at close i (lagged inside).
#   drag         per-unit turnover cost (0.0025 = 25 bps).
#   n_long,n_short equal-weight name counts per leg.
#
# Returns a list of length-n_days vectors: leg_long, leg_short, wml_gross
# (= leg_long - leg_short, the unscaled 1x spread), gross, turnover, net,
# w_eff, n_long_held, n_short_held.
simulate_wml <- function(ret_mat, dates, roll_keys, long_by_roll, short_by_roll,
                         w_target, drag = 0.0025, n_long = 20L, n_short = 20L) {
  n_days <- length(dates)
  if (nrow(ret_mat) != n_days) stop("ret_mat rows must equal length(dates)")
  syms <- colnames(ret_mat)
  sym_idx <- setNames(seq_along(syms), syms)
  date_char <- as.character(dates)
  # causal lag: target known at close i-1 applies to return i
  w_eff <- lag_effective(w_target, init = 1)

  leg_long <- numeric(n_days)
  leg_short <- numeric(n_days)
  gross <- numeric(n_days)
  turnover <- numeric(n_days)
  net <- numeric(n_days)
  n_long_held <- integer(n_days)
  n_short_held <- integer(n_days)
  n_long_live <- integer(n_days)
  n_short_live <- integer(n_days)

  holdings_long <- character()
  holdings_short <- character()
  w_prev <- numeric(length(syms))

  for (i in seq_len(n_days)) {
    we <- w_eff[i]
    # current weights from holdings set at the prior roll
    w_cur <- numeric(length(syms))
    if (length(holdings_long)) {
      idx <- sym_idx[holdings_long]; idx <- idx[!is.na(idx)]
      if (length(idx)) w_cur[idx] <- we / n_long
    }
    if (length(holdings_short)) {
      idx <- sym_idx[holdings_short]; idx <- idx[!is.na(idx)]
      if (length(idx)) w_cur[idx] <- w_cur[idx] - we / n_short
    }
    # leg returns today (equal-weight over the FULL leg size; a held name with
    # a missing return — suspended/delisted — earns 0 and does NOT shrink the
    # denominator, matching the anchor engine). NA only when the leg is empty.
    has_long <- length(holdings_long) > 0L
    has_short <- length(holdings_short) > 0L
    lr <- if (has_long) sum(ret_mat[i, holdings_long], na.rm = TRUE) / n_long else NA_real_
    sr <- if (has_short) sum(ret_mat[i, holdings_short], na.rm = TRUE) / n_short else NA_real_
    leg_long[i] <- lr
    leg_short[i] <- sr
    has_pos <- has_long || has_short
    gross[i] <- if (has_pos) sum(w_cur * ret_mat[i, ], na.rm = TRUE) else NA_real_
    turnover[i] <- sum(abs(w_cur - w_prev))
    net[i] <- if (has_pos) gross[i] - drag * turnover[i] else NA_real_
    n_long_held[i] <- length(holdings_long)
    n_short_held[i] <- length(holdings_short)
    n_long_live[i] <- if (has_long) sum(is.finite(ret_mat[i, holdings_long])) else 0L
    n_short_live[i] <- if (has_short) sum(is.finite(ret_mat[i, holdings_short])) else 0L

    # rebalance at the close: new positions apply from the next day
    if (date_char[i] %in% roll_keys) {
      nl <- long_by_roll[[date_char[i]]]
      ns <- short_by_roll[[date_char[i]]]
      holdings_long <- if (is.null(nl)) character() else nl
      holdings_short <- if (is.null(ns)) character() else ns
    }
    w_prev <- w_cur
  }

  list(leg_long = leg_long, leg_short = leg_short,
       wml_gross = leg_long - leg_short, gross = gross,
       turnover = turnover, net = net, w_eff = w_eff,
       n_long_held = n_long_held, n_short_held = n_short_held,
       n_long_live = n_long_live, n_short_live = n_short_live)
}
