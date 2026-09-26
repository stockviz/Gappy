source("../common.R")

OUT_DIR <- "."
cp <- readRDS(file.path(OUT_DIR, "checkpoint.rds"))
series <- cp$series
metrics <- fread(file.path(OUT_DIR, "metrics.csv"))

# Purpose: render one cumulative-plus-drawdown chart for one house window.
render_chart <- function(window) {
  start <- if (window == "post") as.Date(POST_START) else NULL
  end <- if (window == "pre") as.Date(TRAIN_END) else NULL
  x <- lapply(series, function(z) slice_returns(z, start, end))
  x <- x[vapply(x, NROW, integer(1)) > 0L]
  if (length(x) < 2L) return(invisible(NULL))
  plotCumDrawdown(
    x,
    title = sprintf("Time-series momentum and volatility scaling — %s", toupper(window)),
    subtitle = "Fixed 252-day sign signal versus 40% volatility-scaled signal; signal at close t applies to return t+1",
    outPath = file.path(OUT_DIR, paste0("cum_dd_", window, ".png")),
    linetypeBySeries = FALSE,
    exactEnd = FALSE
  )
}

# Purpose: render color-coded house metric tables for one window.
render_table <- function(window) {
  w <- as.character(window)
  d <- metrics[metrics[["window"]] == w, ]
  if (!nrow(d)) return(invisible(NULL))
  show <- d[, .(System = system, N, CAGR, Vol, Sharpe, MaxDD)]
  tab <- gt(show) |>
    fmt_number(columns = N, decimals = 0) |>
    fmt_percent(columns = c(CAGR, Vol, MaxDD), decimals = 1) |>
    fmt_number(columns = Sharpe, decimals = 2) |>
    data_color(columns = c(CAGR, Sharpe), palette = c("#FEE8C8", "#E34A33", "#238B45")) |>
    data_color(columns = MaxDD, palette = c("#238B45", "#FEE8C8", "#E34A33")) |>
    tab_header(title = md(sprintf("**Time-series momentum — %s**", toupper(window))),
               subtitle = md("CAGR, annualized volatility, Sharpe, and maximum drawdown")) |>
    tab_source_note(source_note = "@StockViz") |>
    opt_table_font(font = list(google_font("Arial"), default_fonts()))
  gtsave(tab, file.path(OUT_DIR, paste0("metrics_", window, ".html")))
  try(gtsave(tab, file.path(OUT_DIR, paste0("metrics_", window, ".png"))), silent = TRUE)
}

for (w in c("pre", "post", "full")) {
  render_chart(w)
  render_table(w)
}

# Purpose: write a findings report from the final metrics and data audit artifacts.
audit <- fread(file.path(OUT_DIR, "data_audit.csv"))
fmt_pct <- function(x) ifelse(is.finite(x), sprintf("%.1f%%", 100 * x), "NA")
fmt_num <- function(x) ifelse(is.finite(x), sprintf("%.2f", x), "NA")
metric_table <- function(window_name) {
  w <- as.character(window_name)
  d <- metrics[metrics[["window"]] == w, ]
  rows <- vapply(seq_len(nrow(d)), function(i) {
    sprintf("| %s | %d | %s | %s | %s | %s |", d$system[i], d$N[i],
            fmt_pct(d$CAGR[i]), fmt_pct(d$Vol[i]), fmt_num(d$Sharpe[i]),
            fmt_pct(d$MaxDD[i]))
  }, character(1))
  c("| System | N | CAGR | Vol | Sharpe | MaxDD |", "|---|---:|---:|---:|---:|---:|", rows)
}
asset_label <- cp$result$asset_class
lines <- c(
  "# Time-series momentum and volatility scaling",
  "",
  "Status: executed exploratory adaptation.",
  "",
  "## Paper mapping",
  "",
  "The source paper is Moskowitz, Ooi, and Pedersen (2012), `Time Series Momentum`. The literal signal is the sign of the prior 12-month return, applied to the next holding period. This implementation uses a 252-observed-day signal, monthly close decisions, a one-trading-day causal lag, and a 40% annualized volatility target for the scaled arm.",
  "",
  sprintf("This report covers: %s.", asset_label),
  "The India arm combines NIFTY total-return indices with MCX contracts. MCX returns are contract-safe within each held expiry; the roll-boundary return is set to zero rather than crossing contracts. The US arm uses ETF proxies because the current US database does not provide the paper's original multi-asset futures panel. The crypto arm dailyizes validated BTCUSDT and ETHUSDT hourly bars into complete UTC days.",
  "",
  "## Data audit",
  sprintf("- Asset class: %s", audit$asset_class[1]),
  sprintf("- Dates: %s to %s; %d dates; %d assets.", audit$first_date[1], audit$last_date[1], audit$n_dates[1], audit$n_assets[1]),
  sprintf("- Missing price cells: %d; zero-return cells: %d.", audit$missing_price_cells[1], audit$zero_return_cells[1]),
  sprintf("- Fixed-signal turnover: %.2f average-exposure units; volatility-scaled turnover: %.2f.", audit$fixed_turnover[1], audit$scaled_turnover[1]),
  "",
  "## Causality and costs",
  "",
  "The target exposure is computed from information through the month-end close and shifted one trading day before it earns returns. Costs are charged on average absolute exposure changes: 25 bps for India, 10 bps for US ETFs, and 5 bps for crypto. The 40% target is capped at 3x exposure. No parameter was selected on the named post period.",
  "",
  "## Results",
  "",
  "The benchmark is equal-weight buy-and-hold across the same available asset panel. The fixed arm uses the paper's sign signal without volatility scaling. The scaled arm targets 40% annualized volatility and is capped at 3x exposure.",
  "",
  "### PRE",
  "",
  metric_table("pre"),
  "",
  "![PRE cumulative return and drawdown](cum_dd_pre.png)",
  "",
  "### POST",
  "",
  metric_table("post"),
  "",
  "![POST cumulative return and drawdown](cum_dd_post.png)",
  "",
  "### FULL",
  "",
  metric_table("full"),
  "",
  "![FULL cumulative return and drawdown](cum_dd_full.png)",
  "",
  "In each window, read the volatility-scaled arm together with its drawdown and turnover. A higher CAGR or Sharpe is not sufficient if it comes from materially higher leverage or a worse drawdown.",
  "",
  "## Limitations",
  "",
  "- The India MCX arm omits roll P&L at the contract boundary; its reported returns are deliberately conservative and are not a substitute for a fully marked roll adjustment.",
  "- The US arm is an ETF adaptation, not a futures replication.",
  "- The crypto arm is a daily adaptation of hourly data and is not directly comparable to the original futures sample.",
  "- The paper's CFTC-position analysis is not reproduced because the required point-in-time positioning data is not in this estate.",
  "- This is a first-pass mechanism test, not a deployable strategy or a literal replication."
)
writeLines(lines, file.path(OUT_DIR, "market_findings.md"))
cat(sprintf("Analysis complete: %d metric rows\n", nrow(metrics)))
