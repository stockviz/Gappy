# 02 Momentum Crash Prediction — US

Source paper: `../../../summaries/momentum/Momentum Crashes (2016).md` (Daniel & Moskowitz, 2016, JFE).

Status: executed.

## What this study is

A true long-short diagnostic of the momentum-crash mechanism on US equities, plus a causal pre-trained panic/vol overlay.

The paper's mechanism: winner-minus-loser (12-2) momentum crashes in **panic states** — after deep market declines, at high market volatility, and on sharp rebounds — and the crash is driven by the **short loser leg**, which behaves like a written call on the market.

## Systems

- `SPY` — price-only buy-and-hold benchmark (no dividend reinvestment, matching the price-only stock data).
- `WML_Long` — top momentum decile, equal-weight (static long leg).
- `WML_Short` — bottom momentum decile shown **long** (static short leg; an up-move is the losers rallying = the crash mechanism).
- `WML` — long minus short (static).
- `WML_Scaled` — the WML book scaled by a **pre-trained panic/vol overlay**: inverse-vol targeting × `(1 − panic_p · I[bear])`.

## Implementation

- **Universe**: historical S&P 500 constituents (`SP500_CONSTITUENTS`, `INDEX_NAME='SPX'`), latest snapshot `PERIOD <= decision date` (point-in-time as-of decision). Snapshots run 2008-01-31 → 2026-08-31.
- **Prices**: `StockVizUs2.BHAV_EQ_TD.C` — raw unadjusted close (price-only; no adjusted-close column exists). A >50% single-day close move is treated as a corporate action and dropped.
- **Signal**: 12-2 momentum = cumulative return over months t-12 through t-2 (one-month skip), equal-count deciles; top decile long, bottom decile short.
- **Timing**: month-end close decision applied from the next trading day (causal). Missing holding-period returns marked stale (zero), not a delisting model.
- **Costs**: 10 bps per leg on absolute weight turnover (both legs), plus 10 bps on daily overlay-exposure changes for the scaled arm.

## Panic overlay (simple adaptation, not the paper's dynamic arm)

The paper's two observable conditioning variables (verified against the primary PDF):

- **bear indicator**: negative cumulative PAST TWO-YEAR market return (~504 trading days; not a running drawdown);
- **market variance**: variance of the preceding 126 daily market returns.

`WML_Scaled` uses these two variables only. `sigma_bar` (mean PRE-window realized vol) and `panic_p` are fitted through 2019-12-31. The small grid selects `panic_p` on net Sharpe after book and exposure-turnover costs. The full SPY price history supplies the bear-state lookback before the first S&P 500 book. The paper's dynamic arm (mean forecast from `bear × variance` plus GJR-GARCH variance) is not reproduced.

## Windows

PRE ends 2019-12-31; POST begins 2020-05-01. The 2020 gap (Jan–Apr) is excluded from parameter fitting but present in FULL.

## Key results (raw close, price-only)

| Window | Static WML Sharpe / MaxDD | Scaled WML Sharpe / MaxDD |
|---|---|---|
| PRE | −0.15 / 80.7% | 0.35 / 37.9% |
| POST | 0.05 / 53.7% | 0.12 / 43.3% |
| FULL | −0.02 / 84.3% | 0.31 / 48.8% |

Static WML is weak on this S&P 500 price-only panel. The PRE-selected overlay raises full-period Sharpe from -0.02 to 0.31 and lowers MaxDD from 84.3% to 48.8%; POST CAGR remains negative. The selected `panic_p = 1.0` is a grid boundary (full shutdown in bear states), not evidence of a stable optimum. Do not infer the original paper's short-loser rebound mechanism from aggregate leg CAGR alone.

## Files

- `helpers.R` — pure, unit-tested mechanics (calendar/12-2 momentum/deciles/turnover/overlay/DB helpers).
- `tests/test_helpers.R` — deterministic helper tests (35 assertions).
- `build.R` — producer: loads data, forms deciles, simulates, writes checkpoint + CSVs.
- `analyze.R` — consumer: renders charts + gt tables + `findings.md`.
- `probe.R` — one-off schema probe (columns, date coverage, SPY presence).
- Artifacts: `checkpoint.rds`, `daily_returns.csv`, `positions_monthly.csv`, `features_monthly.csv`, `decisions_audit.csv`, `exposure_audit.csv`, `data_audit.csv`, `panic_grid.csv`, `metrics.csv`, `metrics_{pre,post,full}.{html,png}`, `cum_dd_{pre,post,full}.png`, `findings.md`.

## Reproduce

```bash
cd backtests/02-momentum-crash-prediction/us
Rscript tests/test_helpers.R   # 35 passing assertions
Rscript build.R                # writes checkpoint + CSVs (reads StockVizUs2)
Rscript analyze.R              # renders charts, tables, findings.md
```
