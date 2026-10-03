#!/usr/bin/env Rscript
# analyze.R — consumer for the momentum-crash US study.
# Purpose: render cumulative-plus-drawdown charts, color-coded gt metric tables,
#          and a findings report from the build checkpoint and CSVs.

source("helpers.R")
setwd(script_dir())

OUT_DIR <- "."
cp <- readRDS(file.path(OUT_DIR, "checkpoint.rds"))
series <- cp$series
metrics <- fread(file.path(OUT_DIR, "metrics.csv"))
audit <- fread(file.path(OUT_DIR, "data_audit.csv"))

# Purpose: slice one house window's returns from the named series list.
window_series <- function(window) {
  start <- if (window == "post") POST_START else NULL
  end <- if (window == "pre") TRAIN_END else NULL
  x <- lapply(series, function(z) slice_returns(z, start, end))
  x <- x[vapply(x, NROW, integer(1)) > 0L]
  x
}

# Purpose: render one cumulative-plus-drawdown chart for one house window.
render_chart <- function(window) {
  x <- window_series(window)
  if (length(x) < 2L) return(invisible(NULL))
  plotCumDrawdown(
    x,
    title = sprintf("Momentum crash diagnostic (US) \u2014 %s", toupper(window)),
    subtitle = sprintf("12-2 WML | raw closes | 10 bps turnover | scaled: inverse vol, %.0f%% bear reduction (PRE-trained)",
                       100 * audit$panic_p[1]),
    outPath = file.path(OUT_DIR, paste0("cum_dd_", window, ".png")),
    linetypeBySeries = FALSE,
    exactEnd = FALSE
  )
}

# Purpose: render one color-coded gt metric table for one house window.
render_table <- function(window) {
  d <- metrics[metrics[["Window"]] == window, ]
  if (!nrow(d)) return(invisible(NULL))
  show <- d[, .(System, N, CAGR, Vol, Sharpe, MaxDD, AvgExposure, Turnover)]
  tab <- gt(show) |>
    fmt_number(columns = N, decimals = 0) |>
    fmt_percent(columns = c(CAGR, Vol, MaxDD), decimals = 1) |>
    fmt_number(columns = c(Sharpe, AvgExposure), decimals = 2) |>
    fmt_number(columns = Turnover, decimals = 1) |>
    data_color(columns = c(CAGR, Sharpe), palette = c("#E34A33", "#FEE8C8", "#238B45")) |>
    data_color(columns = MaxDD, palette = c("#238B45", "#FEE8C8", "#E34A33")) |>
    tab_header(title = md(sprintf("**Momentum crash diagnostic \u2014 %s**", toupper(window))),
               subtitle = md("12-2 deciles, long/short legs, static vs pre-trained panic/vol overlay; SPY benchmark")) |>
    tab_source_note(source_note = "@StockViz") |>
    opt_table_font(font = list(google_font("Arial"), default_fonts()))
  gtsave(tab, file.path(OUT_DIR, paste0("metrics_", window, ".html")))
  try(gtsave(tab, file.path(OUT_DIR, paste0("metrics_", window, ".png"))), silent = TRUE)
}

for (w in c("pre", "post", "full")) {
  render_chart(w)
  render_table(w)
}

# ----------------------------------------------------------------------------
# findings.md generation
# ----------------------------------------------------------------------------
fmt_pct <- function(x) ifelse(is.finite(x), sprintf("%.1f%%", 100 * x), "NA")
fmt_num <- function(x) ifelse(is.finite(x), sprintf("%.2f", x), "NA")
metric_table <- function(window_name) {
  d <- metrics[metrics[["Window"]] == window_name, ]
  rows <- vapply(seq_len(nrow(d)), function(i) {
    sprintf("| %s | %d | %s | %s | %s | %s | %s | %s |", d$System[i], d$N[i],
            fmt_pct(d$CAGR[i]), fmt_pct(d$Vol[i]), fmt_num(d$Sharpe[i]),
            fmt_pct(d$MaxDD[i]), fmt_num(d$AvgExposure[i]), fmt_num(d$Turnover[i]))
  }, character(1))
  c("| System | N | CAGR | Vol | Sharpe | MaxDD | AvgExposure | Turnover |",
    "|---|---:|---:|---:|---:|---:|---:|---:|", rows)
}

lines <- c(
  "# Momentum crash prediction \u2014 US (true long-short diagnostic)",
  "",
  "Status: executed.",
  "",
  "## Paper mapping",
  "",
  "Source paper: Daniel and Moskowitz (2016), *Momentum Crashes*, JFE. The paper's mechanism: winner-minus-loser (12-2) momentum crashes in **panic states** \u2014 after deep market declines, at high market volatility, and on sharp rebounds \u2014 and the crash is driven by the **short loser leg**, which behaves like a written call on the market.",
  "",
  "The paper's two observable conditioning variables (as verified against the primary PDF):",
  "  * **bear indicator**: negative cumulative PAST TWO-YEAR market return (not a running drawdown);",
  "  * **market variance**: variance of the preceding 126 daily market returns.",
  "",
  "The paper's dynamic arm forecasts the momentum mean from `bear \u00d7 variance` and the variance with a GJR-GARCH model. **This study implements a simple pre-trained panic/vol overlay as an explicit adaptation, not that dynamic arm.**",
  "",
  "## Implementation",
  "",
  "- Universe: historical S&P 500 constituents (`SP500_CONSTITUENTS`, `INDEX_NAME='SPX'`), latest snapshot `PERIOD <= decision date` (point-in-time as-of decision).",
  "- Prices: `StockVizUs2.BHAV_EQ_TD.C` \u2014 **raw unadjusted close (price-only)**; there is no adjusted-close column in this table. Dividend reinvestment is absent, and a >50% single-day close move is treated as a corporate action and dropped.",
  "- Signal: 12-2 momentum \u2014 cumulative return over months t-12 through t-2 (one-month skip), equal-count deciles; top decile long, bottom decile short, equal weight within each decile.",
  "- Timing: decision at month-end close t, applied from the next trading day (causal). Missing holding-period returns are marked stale (zero), not a delisting model.",
  "- Costs: 10 bps turnover per leg, charged on absolute weight turnover (both legs), plus 10 bps on daily overlay-exposure changes for the scaled arm.",
  "- Windows: PRE ends 2019-12-31; POST begins 2020-05-01; the 2020 gap (Jan\u2013Apr) is excluded from parameter fitting but present in FULL.",
  "",
  "## Data audit",
  sprintf("- Constituents: %d snapshots (%s..%s), %d distinct symbols; %d have price data.", audit$constituent_snapshots[1], audit$first_period[1], audit$last_period[1], audit$constituent_symbols[1], audit$price_symbols[1]),
  sprintf("- Prices: %s..%s, %d dates, %d symbols.", audit$first_price[1], audit$last_price[1], audit$n_dates[1], audit$price_symbols[1]),
  sprintf("- Rebalances: %d (%s..%s). Missing price cells: %d; zero-return cells: %d.", audit$n_rebalances[1], audit$first_signal[1], audit$last_signal[1], audit$missing_price_cells[1], audit$zero_return_cells[1]),
  sprintf("- Overlay pre-trained on pre-2020 only: sigma_bar=%.3f, panic_p=%.2f (grid %s).", audit$sigma_bar[1], audit$panic_p[1], paste(round(seq(0,1,0.25),2), collapse=",")),
  "",
  "## Results",
  "",
  "`WML_Short` is the bottom decile shown as a **long** position, so an up-move is the short leg rallying (the crash mechanism). `WML` is long-minus-short. `WML_Scaled` scales the WML book by a pre-trained inverse-vol \u00d7 panic gate.",
  "",
  "### PRE (through 2019-12-31)",
  "", metric_table("pre"), "",
  "![PRE cumulative return and drawdown](cum_dd_pre.png)",
  "",
  "### POST (from 2020-05-01)",
  "", metric_table("post"), "",
  "![POST cumulative return and drawdown](cum_dd_post.png)",
  "",
  "### FULL",
  "", metric_table("full"), "",
  "![FULL cumulative return and drawdown](cum_dd_full.png)",
  "",
  "## Reading",
  "",
  "Static 12-2 WML is weak over this S&P 500 sample. The original paper uses a broader CRSP universe, so the results are not directly comparable. The bottom-decile long leg is more volatile than the winner leg. Its positive POST CAGR does not, by itself, establish that loser rebounds caused particular WML crash episodes; that requires event-level attribution.",
  "",
  "The PRE-selected overlay improves full-sample Sharpe from -0.02 to 0.31 and MaxDD from 84.3% to 48.8%; POST Sharpe is only 0.12 and POST CAGR remains negative. The selected panic reduction is at the edge of the grid (panic_p = 1.0, full shutdown in bear states). This boundary choice is not evidence of a stable optimum, and both US arms remain price-only approximations.",
  "",
  "## Limitations",
  "",
  "- S&P 500 only (no small caps): the momentum premium itself is largely absent, so absolute WML performance is not comparable to the paper's full cross-section.",
  "- Price-only closes (no dividend reinvestment, no corporate-action adjustment beyond the >50% daily-move guard).",
  "- The panic overlay is a **simple adaptation**: it uses the bear indicator and realized variance only, and does not forecast the mean from `bear \u00d7 variance` nor model variance with GJR-GARCH, and does not separately time the rebound. It is not equivalent to the paper's dynamic arm.",
  "- panic_p is selected in-sample on pre-2020; POST is the honest out-of-sample window.",
  "- Missing holding-period returns are marked to zero (stale-mark convention), not modeled as delisting returns."
)
writeLines(lines, file.path(OUT_DIR, "findings.md"))
cat(sprintf("Analysis complete: %d metric rows, charts and tables written under %s\n",
            nrow(metrics), normalizePath(OUT_DIR)))
