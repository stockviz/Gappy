# test-helpers.R — deterministic unit tests for the momentum-crash helpers.
# Run with:  Rscript test-helpers.R   (sources ../helpers.R in this folder)
# Every test asserts a known correct value; a helper that is missing or wrong
# makes the test fail. These functions must be pure (no I/O, no randomness).

src <- "helpers.R"
if (!file.exists(src)) stop("helpers.R not found — expected in this directory")

# --- minimal assertion helpers (no external packages) ----------------------
.check_count <- 0L
fail <- function(msg) stop(sprintf("TEST FAILURE: %s", msg), call. = FALSE)

expect_near <- function(actual, expected, tol = 1e-9, label = "") {
  .check_count <<- .check_count + 1L
  if (length(actual) != length(expected) ||
      any(!is.finite(actual) & is.finite(expected)) ||
      any(is.finite(actual) & !is.finite(expected))) {
    fail(sprintf("%s length/missing mismatch: got [%s], want [%s]",
                 label, paste(actual, collapse = ","), paste(expected, collapse = ",")))
  }
  if (any(abs(actual - expected) > tol, na.rm = TRUE) ||
      any(is.na(actual) != is.na(expected))) {
    fail(sprintf("%s: got [%s], want [%s]",
                 label, paste(actual, collapse = ","), paste(expected, collapse = ",")))
  }
  invisible(TRUE)
}

expect_true <- function(cond, label = "") {
  .check_count <<- .check_count + 1L
  if (!isTRUE(cond)) fail(sprintf("%s: expected TRUE", label))
  invisible(TRUE)
}

# Source the helpers under test. This is the line that FAILS (RED) until
# helpers.R implements every function below.
source(src)

# --- 1. momentum_12_2 -------------------------------------------------------
# Cumulative return from t-12 to t-2 (skip most recent month) is the ranking
# signal. px is oldest->newest. skip=2, lookback=5 for this tiny fixture:
# px = 100, 110, 121, 133.1, 146.41  (10% compounded each step)
# momentum = px[n-skip] / px[n-lookback] - 1 = px[3] / px[0] ... n=5
# n=5, skip=2 -> index 3 (=121), lookback=5 -> index 0 (out of range -> NA)
# So use a longer series for the exact-value check.
px10 <- 100 * 1.10^(0:9)          # 10 prices, 10% each
# n=10, skip=2 -> px[8] = 100*1.1^8 ; lookback=5 -> px[5] = 100*1.1^5
expect_near(momentum_12_2(px10, skip = 2L, lookback = 5L),
            1.1^8 / 1.1^5 - 1, label = "momentum_12_2 exact ratio")

# Too-short series must return NA, never a wrong index.
expect_true(is.na(momentum_12_2(c(100, 110), skip = 2L, lookback = 5L)),
            "momentum_12_2 too-short -> NA")

# --- 2. trailing_cum_return --------------------------------------------------
rets <- c(0.10, -0.20, 0.05, 0.30)
expect_near(trailing_cum_return(rets, 2L),
            (1 + 0.05) * (1 + 0.30) - 1, label = "trailing_cum_return horizon=2")
expect_near(trailing_cum_return(rets, 4L),
            prod(1 + rets) - 1, label = "trailing_cum_return full window")

# --- 3. trailing_variance / trailing_ann_vol ---------------------------------
rv <- c(0.01, -0.02, 0.03, -0.01)
expect_near(trailing_variance(rv, 3L), var(c(-0.02, 0.03, -0.01)),
            label = "trailing_variance horizon=3")
expect_near(trailing_ann_vol(rv, 4L), sd(rv) * sqrt(252),
            label = "trailing_ann_vol full window")

# --- 4. bear_flag ------------------------------------------------------------
# 24-month trailing cumulative return < 0 => bear. Need >= 504 obs.
up <- rep(0.001, 504)                    # positive drift, cum return > 0
down <- c(rep(0.001, 503), -0.60)        # large negative => bear
expect_true(!bear_flag(up, horizon = 504L), "bear_flag up market -> FALSE")
expect_true(bear_flag(down, horizon = 504L), "bear_flag down market -> TRUE")
expect_true(!bear_flag(c(0.001, 0.002), horizon = 504L),
            "bear_flag insufficient data -> FALSE (warm-up, not bear)")

# --- 5. panic_flag -----------------------------------------------------------
expect_true(panic_flag(TRUE, 0.09, 0.05), "panic: bear + high var")
expect_true(!panic_flag(FALSE, 0.09, 0.05), "no panic: bull")
expect_true(!panic_flag(TRUE, 0.02, 0.05), "no panic: low var")

# --- 6. forecast_wml_mean (gamma interaction regression prediction) ----------
gamma <- c(0.001, -0.001, -0.05, -0.20)   # g0, gB, gVar, gInt
# bear=0 -> g0 + gVar*var ; bear=1 -> g0 + gB + gVar*var + gInt*var
expect_near(forecast_wml_mean(gamma, 0, 0.02),
            0.001 - 0.05 * 0.02, label = "forecast bull")
expect_near(forecast_wml_mean(gamma, 1, 0.02),
            0.001 - 0.001 - 0.05 * 0.02 - 0.20 * 0.02, label = "forecast bear panic")

# --- 7. clip_weight / dynamic / cvol weight series ---------------------------
expect_near(clip_weight(3, 0, 2), 2, label = "clip upper")
expect_near(clip_weight(-1, 0, 2), 0, label = "clip lower")
expect_near(clip_weight(1.5, 0, 2), 1.5, label = "clip within")

mu <- c(0.002, 0.0005, -0.001)
varhat <- c(0.0004, 0.0004, 0.0004)
# w = clip(c * mu / var, 0, 2) with c = 0.2
expect_near(dynamic_weight_series(mu, varhat, c = 0.2, lower = 0, upper = 2),
            c(clip_weight(0.2*0.002/0.0004,0,2),
              clip_weight(0.2*0.0005/0.0004,0,2),
              clip_weight(0.2*-0.001/0.0004,0,2)),
            label = "dynamic_weight_series")

vol <- c(0.10, 0.20, 0.40)
expect_near(cvol_weight_series(vol, target_vol = 0.20, cap = 2),
            c(2, 1, 0.5), label = "cvol_weight_series")

# --- 8. lag_effective (causal one-day lag) -----------------------------------
x <- c(0.5, 0.8, 0.0, 1.0)
expect_near(lag_effective(x, init = 1), c(1.0, 0.5, 0.8, 0.0),
            label = "lag_effective causal shift")

# --- 9. wml_from_legs --------------------------------------------------------
lr <- c(0.01, -0.02, 0.03)
sr <- c(0.005, 0.01, -0.01)
expect_near(wml_from_legs(lr, sr), lr - sr, label = "wml = long - short")

# --- 10. turnover_from_weights ----------------------------------------------
w <- c(1.0, 1.0, 0.5, 0.5)
expect_near(turnover_from_weights(w), c(1.0, 0.0, 0.5, 0.0),
            label = "turnover_from_weights per-day")

# --- 11. simulate_wml (core long-short engine) ------------------------------
# 3 symbols, 4 days, 1 long + 1 short, static weight, drag 25 bps.
m <- matrix(c(NA,  NA,  NA,
              0.10, 0.05, 0.20,
             -0.10, 0.00, 0.05,
              0.05, 0.00,-0.05), nrow = 4, byrow = TRUE,
            dimnames = list(c("d1","d2","d3","d4"), c("A","B","C")))
dd <- as.Date(c("2020-01-01","2020-01-02","2020-01-03","2020-01-04"))
lby <- list("2020-01-02" = c("A")); sby <- list("2020-01-02" = c("C"))
sim <- simulate_wml(m, dd, "2020-01-02", lby, sby, w_target = c(1,1,1,1),
                    drag = 0.0025, n_long = 1L, n_short = 1L)
expect_near(sim$leg_long,  c(NA, NA, -0.10, 0.05), label = "sim leg_long")
expect_near(sim$leg_short, c(NA, NA,  0.05,-0.05), label = "sim leg_short")
expect_near(sim$wml_gross, c(NA, NA, -0.15, 0.10), label = "sim wml_gross")
expect_near(sim$gross,     c(NA, NA, -0.15, 0.10), label = "sim gross (static)")
expect_near(sim$turnover,  c(0, 0,  2.00, 0.00), label = "sim turnover")
expect_near(sim$net,       c(NA, NA, -0.15 - 0.0025*2, 0.10),
            label = "sim net (static)")
expect_near(sim$w_eff,     c(1, 1, 1, 1), label = "sim w_eff static")

# overlay: de-risk to zero at close d2 -> effective from d4.
sim2 <- simulate_wml(m, dd, "2020-01-02", lby, sby, w_target = c(1,1,0,0),
                     drag = 0.0025, n_long = 1L, n_short = 1L)
expect_near(sim2$w_eff,     c(1, 1, 1, 0), label = "sim overlay w_eff lag")
expect_near(sim2$wml_gross, c(NA, NA, -0.15, 0.10), label = "sim overlay wml unscaled")
expect_near(sim2$gross,     c(NA, NA, -0.15, 0.00), label = "sim overlay gross")
expect_near(sim2$turnover,  c(0, 0,  2.00, 2.00), label = "sim overlay turnover")
expect_near(sim2$net,       c(NA, NA, -0.15 - 0.0025*2, -0.0025*2),
            label = "sim overlay net")

# --- 12. simulate_wml NA-dilution (suspended name must not shrink the mean) ---
m2 <- matrix(c(NA,  NA,  NA,  NA,
               0.10, NA,  0.20, NA,
              -0.10, 0.10, 0.05,-0.05,
               0.05, NA,  0.00, 0.00), nrow = 4, byrow = TRUE,
             dimnames = list(c("d1","d2","d3","d4"), c("A","B","C","D")))
lby2 <- list("2020-01-02" = c("A","B")); sby2 <- list("2020-01-02" = c("C","D"))
sim3 <- simulate_wml(m2, dd, "2020-01-02", lby2, sby2, w_target = c(1,1,1,1),
                     drag = 0.0, n_long = 2L, n_short = 2L)
# day3: long=(A,B)=(-0.10,0.10)/2=0 ; short=(C,D)=(0.05,-0.05)/2=0
# day4: long=(A=0.05, B=NA->0)/2=0.025 ; short=(C=0,D=0)/2=0
expect_near(sim3$leg_long, c(NA, NA, 0.0, 0.025), label = "sim NA-dilution leg_long")
expect_near(sim3$wml_gross, c(NA, NA, 0.0, 0.025), label = "sim NA-dilution wml")

# Market state uses all observed index history, including dates before the
# futures book starts. A 2016 bear must not be hidden by a 2015 book start.
md <- as.Date("2020-01-01") + 0:5
mr <- c(0, -0.2, 0, 0, 0, 0)
state <- market_panic_asof(md, mr, md[4:6], bear_horizon = 3L, var_horizon = 3L)
expect_true(state$bear[1], "pre-book index history enters bear window")
expect_near(state$variance[1], var(mr[2:4]), label = "market variance as of close")

# SQL rows can arrive in any order. Returns must be chronological within each
# contract; never divide a price by a future observation.
f <- data.frame(SYMBOL = c("A", "A", "A", "A"),
                EXPIRY_DT = as.Date(c("2020-02-27", "2020-02-27", "2020-01-30", "2020-01-30")),
                TIME_STAMP = as.Date(c("2020-02-05", "2020-02-04", "2020-01-03", "2020-01-02")),
                PX_CLOSE = c(110, 100, 105, 100))
fr <- contract_returns_sorted(f)
expect_near(fr$ret, c(NA, 0.05, NA, 0.10), label = "sorted within-contract returns")

# Rank only symbols with a real quote for the NEXT held contract on the
# decision close. Future additions, expired names, and current-month-only
# contracts must not enter the historical book even if their cash prices exist.
rd <- as.Date("2020-01-23")
next_expiry <- as.Date("2020-02-27")
quotes <- data.frame(
  SYMBOL = c("A", "B", "C", "D", "FUTURE", "EXPIRED", "WRONG_EXPIRY", "BAD_PRICE"),
  TIME_STAMP = as.Date(c(rep("2020-01-23", 4), "2020-02-01", "2019-12-31",
                         "2020-01-23", "2020-01-23")),
  EXPIRY_DT = as.Date(c(rep("2020-02-27", 6), "2020-01-30", "2020-02-27")),
  PX_CLOSE = c(rep(100, 7), 0), stringsAsFactors = FALSE)
score <- c(A = 0.8, B = 0.6, C = -0.1, D = -0.4, FUTURE = 8,
           EXPIRED = -8, WRONG_EXPIRY = 7, BAD_PRICE = -7)
book <- rank_tradable_futures(score, quotes, rd, next_expiry, top_n = 2L)
expect_true(identical(book$long, c("A", "B")), "no future member in winner book")
expect_true(identical(book$short, c("C", "D")), "no expired member in loser book")
expect_near(book$n_eligible, 4, label = "four live next-contract names")

# Missing effective returns are measured for BOTH legs; ordinary one-day gaps
# may be marked to zero, but a mostly fictitious book must fail a hard guard.
expect_near(sim3$n_long_live, c(0, 0, 2, 1), label = "observed long contracts")
expect_near(sim3$n_short_live, c(0, 0, 2, 2), label = "observed short contracts")
expect_true(isTRUE(assert_book_coverage(sim, n_long = 1L, n_short = 1L,
                                        min_mean_fraction = 1, max_missing = 0L)),
            "fully quoted book accepted")
coverage_error <- tryCatch({
  assert_book_coverage(sim3, n_long = 2L, n_short = 2L,
                       min_mean_fraction = 0.9, max_missing = 1L)
  FALSE
}, error = function(e) grepl("held-contract coverage", conditionMessage(e)))
expect_true(coverage_error, "missing held-contract coverage rejects a broken book")

cat(sprintf("OK — %d checks passed\n", .check_count))
