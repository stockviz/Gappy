# Momentum Crashes (Daniel & Moskowitz 2016) — India

Source paper: `../../../summaries/momentum/Momentum Crashes (AbnormalReturnsMomentum_DanielMoskowitz_2016.pdf).md` (Daniel & Moskowitz, *Journal of Financial Economics* 2016).

Status: executed exploratory adaptation on India single-stock futures.

## Implemented rule

- **Book**: true long-short momentum — long top-20 / short bottom-20 equal-weight single-stock futures, ranked by 12-2 momentum (skip 21 trading days, look back 252 trading days) computed from `StockVizDyn.eod_adjusted_nse.c` adjusted cash-equity closes. At each roll, only symbols with a positive quote for the next held contract at that close enter the ranking. Both long and short P&L come from `StockViz.dbo.BHAV_EQ_FUT` (`OPTION_TYP='XX'`, `STRIKE_PR=0`) within-contract returns; no cash stock is shorted.
- **Execution**: monthly roll 5 business days before expiry; contract-safe within-contract daily returns (never across an expiry); 25 bps drag on gross turnover; 1-day causal lag.
- **Crash diagnostic**: the paper's bear definition on the NIFTY 50 TR proxy: trailing 24-month (504 trading-day) cumulative return < 0 (NOT a running drawdown); ex ante market variance = trailing 126-day variance. The index history starts before the futures book so the first two years of market information are retained. State-conditional means and contemporaneous betas are descriptive, not a traded hedge or proof of a written-call mechanism.
- **Pre-trained panic overlay** (parameters selected on PRE through 2019-12-31 only, applied untouched to POST from 2020-05-01):
  - `WML_Static` — constant 1.0 exposure.
  - `WML_CVol` — constant-volatility scaling (target = PRE realized vol, cap 2).
  - `WML_Panic` — dynamic weight `clip(c * mu_hat / sigma2_hat, 0, 2)` with a pre-trained mean forecast.
  - `WML_Gate` — binary shutdown when bear AND market variance > PRE 80th percentile.

## Tradability audit and central limitation

An earlier version ranked every symbol ever seen in `BHAV_EQ_FUT`. That admitted names before their futures listing and after expiry; it silently zero-marked most selected returns. Those metrics were invalid. The corrected producer filters on each roll's actually quoted next contract, saves `roll_eligibility.csv` and `holding_coverage.csv`, and stops unless each leg averages at least 95% quoted returns with no day missing more than two of its 20 positions. Do not quote results from the older files or compare them as a strategy variant.

India's PRE window (2015-09 to 2019-12) contains 28 bear days. The interaction is mathematically estimable, but its coefficient is unstable with so few observations; this exploratory implementation requires at least 63 PRE bear observations before using it. The Panic arm therefore uses a PRE variance-only mean forecast, not the paper's conditional-mean model. See the regenerated metrics and findings for the corrected POST outcome.

## Files

- `helpers.R` — pure, deterministic functions (12-2 momentum, bear/variance instruments, dynamic/cvol weights, the long-short simulator). No I/O.
- `test-helpers.R` — deterministic helper tests (46 checks). Run with `Rscript test-helpers.R`.
- `verify-quotes.R` — independent integration audit against the historical futures table; run `Rscript verify-quotes.R` after every build. It checks all selected long and short names against the quoted next contract on each roll close and checks effective daily return coverage.
- `build.R` — data loading, contract-safe futures returns, 12-2 ranking, pre-training, simulation, and all CSV/RDS artifacts. Run with `Rscript build.R` (writes `build.log`).
- `analyze.R` — cumulative+drawdown charts, color-coded gt metric tables, and `findings.md`. Run with `Rscript analyze.R` (writes `analyze.log`).
- `checkpoint.rds` — full intermediate state.
- `daily_returns.csv` — per-arm daily net returns + NIFTY 50 TR.
- `legs_daily.csv` — long-leg / short-leg / unscaled WML daily returns (the diagnostic series).
- `positions_daily.csv` — effective long and short holdings each day.
- `roll_eligibility.csv` — contract expiry and point-in-time quoted/rankable names on each decision close.
- `holding_coverage.csv` — intended and actually quoted held futures by leg, daily; the build enforces minimum coverage.
- `panic_daily.csv` — bear flag, market variance, panic flag, and the three overlay weight targets.
- `turnover_daily.csv` — per-arm daily gross turnover.
- `metrics.csv` (+ `metrics_{pre,post,full}.csv`) — CAGR / Vol / Sharpe / MaxDD / AvgExp / turnover per arm × window.
- `cum_dd_{pre,post,full}.png` — stacked cumulative + drawdown charts with end labels.
- `metrics_{pre,post,full}.html/.png` — gt tables (green = favorable; MaxDD is shown negative, so less-negative = greener).
- `crash_episodes.csv`, `state_stats.csv`, `state_betas.csv` — crash diagnostic tables.
- `data_audit.csv` — coverage and pre-training parameters.

## Limitations

- Not a literal reproduction: 12-2 is a trading-day approximation of monthly CRSP value-weighted deciles; the book is top/bottom-20 futures, not deciles; the overlay is not the paper's GJR-GARCH conditional-variance model.
- The corporate-action exclusion uses only ex-dates on or before each decision; adjusted cash prices may incorporate later back-adjustments and their point-in-time provenance is unverified.
- Lot sizes, margin funding, borrow fees, and spreads are not modelled.
- The bear × variance mean forecast is too thin to use under the 63-observation guard, and the paper's GJR-GARCH variance model is absent. Neither the paper's headline dynamic rule nor its short-convexity mechanism is established by this study.
