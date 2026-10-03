# tests/test_helpers.R
# Purpose: unit-test the pure mechanics of the momentum-crash US study.
# Run with: Rscript tests/test_helpers.R   (from the us/ directory)
# RED: fails when helpers.R is missing or a helper misbehaves.
# GREEN: prints "ALL HELPER TESTS PASSED" and exits 0.

# ---- minimal assertion harness (no external test framework dependency) ----
.PASS <- 0L
.FAIL <- 0L

# Purpose: register one passing assertion.
ok <- function(label) { .PASS <<- .PASS + 1L; cat(sprintf("  PASS %s\n", label)) }

# Purpose: register one failing assertion with an expected/actual message.
bad <- function(label, why) { .FAIL <<- .FAIL + 1L; cat(sprintf("  FAIL %s: %s\n", label, why)) }

# Purpose: assert numeric near-equality with a tolerance.
expect_close <- function(label, actual, expected, tol = 1e-9) {
  if (length(actual) == length(expected) && all(is.finite(actual)) &&
      all(abs(actual - expected) <= tol * (1 + abs(expected)))) ok(label)
  else bad(label, sprintf("expected %s, got %s",
                          paste(round(expected, 8), collapse = ","),
                          paste(round(actual, 8), collapse = ",")))
}

# Purpose: assert exact equality of scalars/strings.
expect_equal <- function(label, actual, expected) {
  if (identical(as.vector(actual), as.vector(expected))) ok(label)
  else bad(label, sprintf("expected %s, got %s",
                          paste(as.character(expected), collapse = ","),
                          paste(as.character(actual), collapse = ",")))
}

if (!file.exists("helpers.R")) {
  cat("helpers.R not found — RED (helpers must exist before tests can run)\n")
  quit(status = 2)
}
source("helpers.R")

# ---- month-end / formation-window calendar arithmetic ----------------------
expect_equal("month_end_dates returns last trading day per month",
             as.character(month_end_dates(as.Date(c("2020-01-02", "2020-01-31",
                                                    "2020-02-03", "2020-02-28",
                                                    "2020-03-31")))),
             c("2020-01-31", "2020-02-28", "2020-03-31"))

# end_of_month across tricky boundaries
expect_equal("end_of_month normalizes mid-month to last day",
             as.character(end_of_month(as.Date("2020-01-15"))), "2020-01-31")
expect_equal("end_of_month leap year February",
             as.character(end_of_month(as.Date("2020-02-10"))), "2020-02-29")
expect_equal("end_of_month non-leap February",
             as.character(end_of_month(as.Date("2019-02-10"))), "2019-02-28")
expect_equal("end_of_month December year wrap",
             as.character(end_of_month(as.Date("2019-12-03"))), "2019-12-31")

# formation_endpoints: decision month M -> (end of M-13, end of M-2)
ep <- formation_endpoints(as.Date("2020-03-31"))
expect_equal("formation window start (M-13) for 2020-03", as.character(ep[1]), "2019-02-28")
expect_equal("formation window end   (M-2)  for 2020-03", as.character(ep[2]), "2020-01-31")

ep <- formation_endpoints(as.Date("2020-01-31"))
expect_equal("formation window start (M-13) for 2020-01", as.character(ep[1]), "2018-12-31")
expect_equal("formation window end   (M-2)  for 2020-01", as.character(ep[2]), "2019-11-30")

ep <- formation_endpoints(as.Date("2008-02-29"))
expect_equal("formation window start (M-13) for 2008-02", as.character(ep[1]), "2007-01-31")
expect_equal("formation window end   (M-2)  for 2008-02", as.character(ep[2]), "2007-12-31")

# ---- 12-2 momentum on a synthetic series -----------------------------------
synth_dates <- seq.Date(as.Date("2018-01-01"), as.Date("2020-03-31"), by = "day")
synth_px <- seq_along(synth_dates) * 1.0  # strictly increasing
mom <- momentum_122(synth_dates, synth_px, as.Date("2020-03-31"))
i2 <- findInterval(as.Date("2020-01-31"), synth_dates)
i13 <- findInterval(as.Date("2019-02-28"), synth_dates)
expect_close("12-2 momentum equals M-2 close / M-13 close - 1", mom, synth_px[i2] / synth_px[i13] - 1)

# insufficient history -> NA
mom_short <- momentum_122(synth_dates[1:30], synth_px[1:30], as.Date("2020-03-31"))
expect_equal("12-2 momentum is NA when history is too short", is.na(mom_short), TRUE)

# ---- equal-count deciles ----------------------------------------------------
x <- seq_len(100)
d <- equal_count_deciles(x)
expect_equal("deciles have 10 levels", sort(unique(d)), 1:10)
expect_equal("decile 1 holds the lowest values", d[1] == 1L && d[50] == 5L && d[100] == 10L, TRUE)
expect_equal("decile bucket sizes are equal", as.integer(table(d)), rep(10L, 10))

d_na <- equal_count_deciles(c(1, 2, NA, 3, 4, 5))
expect_equal("deciles skip non-finite and return NA for them", sum(is.na(d_na)), 1L)
d5 <- equal_count_deciles(1:5)
expect_equal("deciles of 5 values are all assigned", sum(is.na(d5)), 0L)
expect_equal("deciles are monotonic in value", all(diff(d5) >= 0), TRUE)
expect_equal("deciles of <2 finite values are all NA",
             all(is.na(equal_count_deciles(c(NA_real_, NA_real_)))), TRUE)
expect_equal("deciles of a single value are all NA",
             all(is.na(equal_count_deciles(3))), TRUE)

# ---- weight turnover ---------------------------------------------------------
new_w <- c(A = 0.5, B = 0.5)
old_w <- c(B = 0.5, C = 0.5)
expect_close("weight turnover equals sum of absolute weight changes",
             weight_turnover(new_w, old_w), 1.0)
expect_close("weight turnover is zero when unchanged", weight_turnover(new_w, new_w), 0.0)

# ---- rolling realized vol ----------------------------------------------------
set.seed(1)
r <- rnorm(300, 0, 0.01)
rv <- rolling_realized_vol(r, window = 126)
expect_equal("rolling vol has NA warm-up", sum(is.na(rv[1:125])), 125L)
expect_close("rolling vol matches windowed sd*sqrt(252) at the end",
             rv[300], sd(r[(300 - 126 + 1):300]) * sqrt(252))

# ---- panic exposure builder (fixed params) -----------------------------------
bear <- as.numeric(trailing_compound_return(r, 504) < 0)
exp1 <- build_panic_exposure(r, sigma_bar = 0.15, panic_p = 0.0, vol_window = 126,
                             bear_window = 504, max_lev = 2.0)
expect_equal("exposure is non-negative", all(exp1[is.finite(exp1)] >= 0), TRUE)
expect_equal("exposure capped at max_lev", all(exp1[is.finite(exp1)] <= 2.0 + 1e-12), TRUE)

exp2 <- build_panic_exposure(r, sigma_bar = 0.15, panic_p = 0.5, vol_window = 126,
                             bear_window = 504, max_lev = 2.0)
reduced <- exp2 < exp1 & exp1 > 0
expect_equal("panic gate reduces exposure in bear states", any(reduced, na.rm = TRUE), TRUE)
expect_equal("panic_p=0 and panic_p=0.5 agree in non-bear states",
             all(exp2[!bear] == exp1[!bear], na.rm = TRUE), TRUE)

# ---- split guard on 12-2 momentum --------------------------------------------
synth_px_jump <- synth_px
j <- which(synth_dates == as.Date("2019-06-15"))
synth_px_jump[j] <- synth_px_jump[j] * 1.6          # 60% jump inside the window
mom_guard <- momentum_122(synth_dates, synth_px_jump, as.Date("2020-03-31"), max_move = 0.5)
expect_equal("12-2 momentum split guard returns NA", is.na(mom_guard), TRUE)
mom_noguard <- momentum_122(synth_dates, synth_px_jump, as.Date("2020-03-31"), max_move = Inf)
expect_equal("12-2 momentum without guard returns a finite value", is.finite(mom_noguard), TRUE)

# ---- pre-training fitter ------------------------------------------------------
set.seed(2)
r2 <- rnorm(400, 0, 0.01)
w2 <- rnorm(400, 0, 0.005)
fit <- fit_panic_params(w2, r2)
expect_equal("fit returns finite sigma_bar", is.finite(fit$sigma_bar), TRUE)
expect_equal("fit panic_p is inside the grid", fit$panic_p %in% PANIC_GRID, TRUE)
expect_equal("fit grid has one row per grid point", nrow(fit$grid) == length(PANIC_GRID), TRUE)

# PRE fitting must score the actual net strategy, including book turnover and
# exposure changes; a gross-return selector can reward an untradeable arm.
fit_net <- fit_panic_params(w2, r2, vol_window = 10L, bear_window = 20L,
                            grid = c(0, 1), drag = 0.01,
                            turnover = rep(1, length(w2)))
e0 <- build_panic_exposure(r2, fit_net$sigma_bar, 0, 10L, 20L, MAX_LEVERAGE)
ef0 <- c(0, e0[-length(e0)])
expected0 <- annualized_sharpe(ef0 * w2 - 0.01 * (ef0 + c(0, abs(diff(ef0)))))
expect_close("pre selector scores net returns including both turnover costs",
             fit_net$grid$sharpe[1], expected0)

# ---- summary -----------------------------------------------------------------
cat(sprintf("\n%d passed, %d failed\n", .PASS, .FAIL))
if (.FAIL > 0L) quit(status = 1)
cat("ALL HELPER TESTS PASSED\n")
