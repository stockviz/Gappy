# analyze.R — render charts, gt tables, and findings for the India arm of
# "Momentum Crashes" (Daniel & Moskowitz 2016). Consumes checkpoint.rds written
# by build.R; no DB access. Uses the shared R2 chart/return helpers.
# =============================================================================

source("/mnt/ssd1/stockviz/R2/backtests/common/runtime.R")
source_common("returns")
source_common("charts")

suppressPackageStartupMessages({
  library(data.table)
  library(xts)
  library(PerformanceAnalytics)
  library(tidyverse)
  library(ggthemes)
  library(viridis)
  library(ggrepel)
  library(patchwork)
  library(scales)
  library(gt)
  library(webshot2)
})

options(scipen = 100)
options(stringsAsFactors = FALSE)
pdf(NULL)

OUT_DIR <- "."
cp <- readRDS(file.path(OUT_DIR, "checkpoint.rds"))
series <- cp$series
metrics <- fread(file.path(OUT_DIR, "metrics.csv"))
stateStats <- fread(file.path(OUT_DIR, "state_stats.csv"))
betaRows <- fread(file.path(OUT_DIR, "state_betas.csv"))
crashDays <- fread(file.path(OUT_DIR, "crash_episodes.csv"))
audit <- fread(file.path(OUT_DIR, "data_audit.csv"))
gammaFull <- cp$gammaFull
gamma <- cp$gamma
nPreBear <- cp$nPreBear
TRAIN_END <- cp$params$train_end
POST_START <- cp$params$post_start

arm_names <- c("WML_Static", "WML_CVol", "WML_Panic", "WML_Gate")

# ── 1. Cumulative + drawdown charts (pre / post / full) ─────────────────────
render_chart <- function(window) {
  start <- if (window == "post") as.character(POST_START) else NULL
  end <- if (window == "pre") as.character(TRAIN_END) else NULL
  x <- lapply(series, function(z) slice_returns(z, start, end))
  x <- x[vapply(x, NROW, integer(1)) > 0L]
  plotCumDrawdown(
    x,
    title = sprintf("Momentum crash study (India futures WML) — %s", toupper(window)),
    subtitle = sprintf("long/short top-bottom 20 single-stock futures | 12-2 momentum | 25 bps drag | %s",
                       if (window == "pre") "through 2019-12-31"
                       else if (window == "post") "2020-05-01 onward" else "full window"),
    outPath = file.path(OUT_DIR, paste0("cum_dd_", window, ".png")),
    linetypeBySeries = FALSE,
    exactEnd = FALSE
  )
}

# ── 2. gt metric tables (green = favorable) ─────────────────────────────────
render_table <- function(window) {
  w <- as.character(window)
  d <- metrics[metrics[["window"]] == w, ]
  if (!nrow(d)) return(invisible(NULL))
  show <- d[, .(System = system, N = N, CAGR = CAGR, Vol = Vol,
                Sharpe = Sharpe, MaxDD = -MaxDD, AvgExp = AvgExp)]
  tab <- show |>
    gt() |>
    fmt_number(columns = N, decimals = 0) |>
    fmt_percent(columns = c(CAGR, Vol, MaxDD), decimals = 1) |>
    fmt_number(columns = Sharpe, decimals = 2) |>
    fmt_number(columns = AvgExp, decimals = 2) |>
    sub_missing(columns = AvgExp, missing_text = "—") |>
    # higher is favourable for all three (MaxDD is negated, so "less negative"
    # = higher = greener)
    data_color(columns = c(CAGR, Sharpe, MaxDD),
               palette = c("#E34A33", "#FEE8C8", "#238B45")) |>
    tab_header(
      title = md(sprintf("**Momentum crash study — %s**", toupper(w))),
      subtitle = md("Static WML vs pre-trained CVol / Panic / Gate overlays; NIFTY50 TR for context")) |>
    tab_source_note(source_note = "@StockViz") |>
    opt_table_font(font = list(google_font("Arial"), default_fonts()))
  gtsave(tab, file.path(OUT_DIR, paste0("metrics_", window, ".html")))
  try(gtsave(tab, file.path(OUT_DIR, paste0("metrics_", window, ".png"))), silent = TRUE)
  invisible(tab)
}

for (w in c("pre", "post", "full")) {
  render_chart(w)
  render_table(w)
}

# ── 3. Findings report (numbers read from the artifacts, not console) ───────
fmt_pct <- function(x) ifelse(is.finite(x), sprintf("%.1f%%", 100 * x), "NA")
fmt_num <- function(x) ifelse(is.finite(x), sprintf("%.2f", x), "NA")
fmt_bps <- function(x) ifelse(is.finite(x), sprintf("%.0f", 1e4 * x), "NA")

metric_md <- function(window_name) {
  w <- as.character(window_name)
  d <- metrics[metrics[["window"]] == w, ][order(-Sharpe)]
  rows <- vapply(seq_len(nrow(d)), function(i) {
    sprintf("| %s | %d | %s | %s | %s | %s | %s |",
            d$system[i], d$N[i], fmt_pct(d$CAGR[i]), fmt_pct(d$Vol[i]),
            fmt_num(d$Sharpe[i]), fmt_pct(-d$MaxDD[i]), fmt_num(d$AvgExp[i]))
  }, character(1))
  c("| System | N | CAGR | Vol | Sharpe | MaxDD | AvgExp |",
    "|---|---:|---:|---:|---:|---:|---:|", rows)
}

state_md <- function() {
  rows <- vapply(seq_len(nrow(stateStats)), function(i) {
    sprintf("| %s | %d | %s | %s |",
            stateStats$state[i], stateStats$n[i],
            fmt_bps(stateStats$mean_wml[i]), fmt_bps(stateStats$mean_mkt[i]))
  }, character(1))
  c("| State | days | mean WML (bp/d) | mean mkt (bp/d) |",
    "|---|---:|---:|---:|", rows)
}

beta_md <- function() {
  rows <- vapply(seq_len(nrow(betaRows)), function(i) {
    sprintf("| %s | %d | %s | %s | %s |",
            betaRows$state[i], betaRows$n[i], fmt_num(betaRows$beta[i]),
            fmt_bps(betaRows$mean_wml[i]), fmt_bps(betaRows$mean_mkt[i]))
  }, character(1))
  c("| State | days | beta (wml~mkt) | mean WML (bp/d) | mean mkt (bp/d) |",
    "|---|---:|---:|---:|---:|", rows)
}

crash_md <- function() {
  top <- crashDays[order(wml)][1:min(10, nrow(crashDays))]
  rows <- vapply(seq_len(nrow(top)), function(i) {
    sprintf("| %s | %s | %s | %s | %s |",
            as.character(top$date[i]), fmt_pct(top$wml[i]), fmt_pct(top$mkt[i]),
            ifelse(is.na(top$is_bear[i]), "-", as.character(top$is_bear[i])),
            ifelse(is.na(top$panic[i]), "-", as.character(top$panic[i])))
  }, character(1))
  c("| Date | WML | market | bear | panic |",
    "|---|---:|---:|---|---|", rows)
}

# Purpose: describe observed held-contract coverage for each evaluation window.
coverage_md <- function() {
  d <- as.data.table(cp$coverage)
  d <- d[long_held > 0L & short_held > 0L]
  d[, window := fifelse(date <= TRAIN_END, "PRE",
                        fifelse(date >= POST_START, "POST", "gap"))]
  windows <- c("PRE", "POST", "FULL")
  rows <- vapply(windows, function(w) {
    x <- if (w == "FULL") d else d[window == w]
    sprintf("| %s | %d | %.2f/20 | %.2f/20 | %d | %d |",
            w, nrow(x), mean(x$long_live), mean(x$short_live),
            max(x$long_held - x$long_live), max(x$short_held - x$short_live))
  }, character(1))
  c("| Window | Days | Mean live longs | Mean live shorts | Max missing long | Max missing short |",
    "|---|---:|---:|---:|---:|---:|", rows)
}

# Purpose: read a named metric from the just-built CSV, avoiding stale prose.
metric_value <- function(system, window, column) {
  idx <- which(metrics[["system"]] == system & metrics[["window"]] == window)
  if (length(idx) != 1L) stop("metric row missing or duplicated")
  metrics[[column]][idx]
}

lines <- c(
  "# Momentum Crashes (Daniel & Moskowitz 2016) — India futures WML adaptation",
  "",
  "Status: executed exploratory adaptation.",
  "",
  "## What the labels mean",
  "",
  "WML is winner-minus-loser: buy the strongest past performers and short the",
  "weakest. Here both legs trade single-stock futures; adjusted equity closes",
  "only form the 12-2 ranking (roughly one year of momentum, skipping the most",
  "recent month). Gross WML is the winner futures return minus the loser futures",
  "return. Net WML also deducts turnover costs. A loser rally hurts the short.",
  "",
  "`WML_Static` holds full exposure. `WML_CVol` targets a fixed volatility;",
  "`WML_Gate` goes flat in a two-year bear market with high recent variance;",
  "`WML_Panic` scales exposure using a PRE-fitted return/variance forecast",
  "(variance-only expected return here because the PRE bear sample is thin).",
  "`NIFTY50_TR` is the NIFTY 50 total-return market reference, not a WML leg.",
  "",
  "PRE ends 2019-12-31; POST starts 2020-05-01; FULL also includes the",
  "intervening gap. CAGR is annualized compounded return, Vol annualized",
  "volatility, Sharpe annualized return divided by volatility, and MaxDD the",
  "largest peak-to-trough loss (shown negative here). AvgExp is average book",
  "size: 0 is flat and 1 is the standard book. Turnover is the sum of absolute",
  "portfolio-weight changes, not a trade count; strategy metrics include its",
  "modeled cost. The state tables use gross WML before costs. One bp is 0.01",
  "percentage point; their mean daily bp are not annualized returns.",
  "",
  "## Paper mapping (and what is NOT a literal reproduction)",
  "",
  "The source paper shows that momentum crashes concentrate in panic states — a",
  "negative trailing 24-month market return (the bear indicator I_B) combined with",
  "high ex ante market variance (126-day) — and, crucially, that WML loses most on",
  "bear-market UP days (losers behave like calls, so the short-loser leg is a written",
  "call on the rebound). Its dynamic arm scales exposure by a pre-trained",
  "mean/variance forecast (w proportional to mu_hat / sigma2_hat).",
  "",
  "This India arm is an ADAPTATION, differing from the paper on purpose:",
  "",
  "- **Momentum**: 12-2 skip-month computed on adjusted cash prices in trading days",
  "  (skip 21d, look back 252d) instead of CRSP value-weighted deciles.",
  "- **Book**: long top-20 / short bottom-20 equal-weight single-stock futures",
  "  (`StockViz.dbo.BHAV_EQ_FUT`, `OPTION_TYP='XX'`, `STRIKE_PR=0`) for BOTH",
  "  legs. No cash stock is shorted. Adjusted cash closes from",
  "  `StockVizDyn.eod_adjusted_nse` are used only to rank the 12-2 signal.",
  "  This is not the paper's value-weighted CRSP deciles.",
  "- **Bear indicator**: trailing 24-month (504 trading-day) cumulative NIFTY 50 TR",
  "  return < 0 — the paper's bear definition on an Indian market proxy, NOT a running drawdown.",
  "- **Market variance**: trailing 126-day variance of daily NIFTY 50 TR returns.",
  "- **Overlay**: a pre-trained mean/variance scalar and a binary gate. This is NOT",
  "  the paper's GJR-GARCH conditional-variance model; the simple gate and the",
  "  variance-only forecast are explicitly labelled approximations.",
  "- **No beta hedge**: conditional market beta is estimated as a diagnostic only;",
  "  it is never used to size a hedge (the task forbids future-beta hedging).",
  "",
  "## Data audit",
  sprintf("- Universe: %s", audit$asset_class[1]),
  sprintf("- Dates: %s to %s; %d days; %d futures symbols; %d rolls.",
          audit$first_date[1], audit$last_date[1], audit$n_dates[1],
          audit$n_symbols[1], audit$n_rolls[1]),
  sprintf("- Bear days (24m cum return < 0): %d; panic days (bear & high var): %d.",
          audit$bear_days[1], audit$panic_days[1]),
  sprintf("- PRE bear days: %d; minimum required to fit the interaction: %d.",
          nPreBear, cp$params$min_pre_bear),
  "- Roll selection uses only stocks with a positive next-contract futures close",
  "  on that roll date, plus an adjusted cash-price 12-2 score available then.",
  "  The historical futures universe is not built from all-time symbol membership.",
  sprintf("- Minimum quoted names at a roll: %d; minimum with usable scores: %d.",
          audit$min_quoted_at_roll[1], audit$min_rankable_at_roll[1]),
  "",
  "Actual quoted positions, not intended positions, by leg:",
  "",
  coverage_md(),
  "",
  "A build fails if either leg averages below 95% quoted returns or any day",
  "has more than two missing held returns. Isolated missing daily marks count as",
  "zero at the intended fixed leg weight; `holding_coverage.csv` shows each day.",
  "",
  "## Pre-training limitation (central result)",
  "",
  "The full PRE regression is `WML = g0 + gB * bear + gVar * variance +",
  "gInt * bear * variance`. Its coefficients are estimable, but the PRE sample",
  sprintf("contains only %d bear days (gB = %.3f; gInt = %.1f). The protocol requires",
          nPreBear, gammaFull[2], gammaFull[4]),
  sprintf("at least %d bear observations before using the interaction. The Panic arm",
          cp$params$min_pre_bear),
  sprintf("therefore uses the PRE variance-only forecast `mu = %.5f %+.5f * variance`",
          gamma[1], gamma[3]),
  "and a trailing WML variance. This fallback is not the paper's conditional",
  "mean model. The fixed binary Gate exits when bear AND variance exceeds the",
  "PRE 80th percentile. Neither arm uses POST returns for parameter selection.",
  "",
  "## Crash diagnostic (attribution, not a hedge)",
  "",
  "State-conditional daily means of the unscaled static WML:",
  "",
  state_md(),
  "",
  "Descriptive within-state contemporaneous WML beta (not an ex-ante hedge):",
  "",
  beta_md(),
  "",
  "Worst WML days (top 10):",
  "",
  crash_md(),
  "",
  sprintf("In the corrected sample, bear-up WML averages %s bp/day and bear-down",
          fmt_bps(betaRows$mean_wml[betaRows$state == "bear_up"])),
  sprintf("WML averages %s bp/day. The within-bear-up beta is %s, so the",
          fmt_bps(betaRows$mean_wml[betaRows$state == "bear_down"]),
          fmt_num(betaRows$beta[betaRows$state == "bear_up"])),
  "rebound-day loss is descriptive, not proof of the paper's short-loser",
  "written-call mechanism. Several worst days are outside the bear state.",
  "",
  "## Results",
  "",
  "### PRE (through 2019-12-31)",
  metric_md("pre"),
  "",
  "![PRE cumulative return and drawdown](cum_dd_pre.png)",
  "",
  "### POST (from 2020-05-01)",
  metric_md("post"),
  "",
  "![POST cumulative return and drawdown](cum_dd_post.png)",
  "",
  "### FULL",
  metric_md("full"),
  "",
  "![FULL cumulative return and drawdown](cum_dd_full.png)",
  "",
  "## Interpretation",
  "",
  "The earlier all-time futures-universe run was INVALID: it selected future F&O",
  "listings and contracts that had already stopped trading. Its missing returns",
  "were silently zero-marked. All metrics and charts above were rebuilt from",
  "roll-date eligible, quoted contracts; do not compare the invalid series as",
  "a strategy candidate.",
  "",
  sprintf("- Static WML POST CAGR %s, Sharpe %s, MaxDD %s; the corrected book is",
          fmt_pct(metric_value("WML_Static", "post", "CAGR")),
          fmt_num(metric_value("WML_Static", "post", "Sharpe")),
          fmt_pct(-metric_value("WML_Static", "post", "MaxDD"))),
  "  still weak, but the old run overstated the evidence of failure.",
  sprintf("- The Gate reduces POST MaxDD from %s to %s, and POST CAGR is %s.",
          fmt_pct(-metric_value("WML_Static", "post", "MaxDD")),
          fmt_pct(-metric_value("WML_Gate", "post", "MaxDD")),
          fmt_pct(metric_value("WML_Gate", "post", "CAGR"))),
  sprintf("- The variance-only Panic fallback has POST CAGR %s and Sharpe %s;",
          fmt_pct(metric_value("WML_Panic", "post", "CAGR")),
          fmt_num(metric_value("WML_Panic", "post", "Sharpe"))),
  "  this is an exploratory timing result, not a test of the paper's dynamic rule.",
  "  With only 28 PRE bear days, conditional crash prediction remains underpowered.",
  "",
  "## Limitations",
  "",
  "- Not a literal reproduction: 12-2 is a trading-day approximation of monthly",
  "  deciles, and the overlay is not the paper's GJR-GARCH model.",
  "- The corporate-action exclusion uses ex-dates no later than each decision,",
  "  but adjusted cash prices may incorporate later back-adjustments; their",
  "  point-in-time adjustment provenance has not been established.",
  "- Lot sizes, margin funding, borrow fees, and spreads are not modelled; drag is",
  "  a flat 25 bps on gross turnover.",
  sprintf("- With only %d PRE bear days, the interaction is too thin for the",
          nPreBear),
  sprintf("  %d-observation exploratory guard. The paper's headline dynamic model is not tested.",
          cp$params$min_pre_bear)
)
writeLines(lines, file.path(OUT_DIR, "findings.md"))
cat(sprintf("Analysis complete: %d metric rows, %d charts\n",
            nrow(metrics), 3L))
