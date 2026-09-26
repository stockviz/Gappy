# Time-series momentum and volatility scaling

Status: executed exploratory adaptation.

## Paper mapping

The source paper is Moskowitz, Ooi, and Pedersen (2012), `Time Series Momentum`. The literal signal is the sign of the prior 12-month return, applied to the next holding period. This implementation uses a 252-observed-day signal, monthly close decisions, a one-trading-day causal lag, and a 40% annualized volatility target for the scaled arm.

This report covers: India: NIFTY TR + MCX contract-safe roll-boundary returns.
The India arm combines NIFTY total-return indices with MCX contracts. MCX returns are contract-safe within each held expiry; the roll-boundary return is set to zero rather than crossing contracts. The US arm uses ETF proxies because the current US database does not provide the paper's original multi-asset futures panel. The crypto arm dailyizes validated BTCUSDT and ETHUSDT hourly bars into complete UTC days.

## Data audit
- Asset class: India: NIFTY TR + MCX contract-safe roll-boundary returns
- Dates: 1999-06-30 to 2026-09-25; 7459 dates; 8 assets.
- Missing price cells: 12429; zero-return cells: 914.
- Fixed-signal turnover: 17.25 average-exposure units; volatility-scaled turnover: 49.77.

## Causality and costs

The target exposure is computed from information through the month-end close and shifted one trading day before it earns returns. Costs are charged on average absolute exposure changes: 25 bps for India, 10 bps for US ETFs, and 5 bps for crypto. The 40% target is capped at 3x exposure. No parameter was selected on the named post period.

## Results

The benchmark is equal-weight buy-and-hold across the same available asset panel. The fixed arm uses the paper's sign signal without volatility scaling. The scaled arm targets 40% annualized volatility and is capped at 3x exposure.

### PRE

| System | N | CAGR | Vol | Sharpe | MaxDD |
|---|---:|---:|---:|---:|---:|
| B_H | 5706 | 6.7% | 16.7% | 0.47 | 50.7% |
| TSMOM_Fixed | 2377 | 3.0% | 16.6% | 0.26 | 39.5% |
| TSMOM_VolScaled | 2377 | 5.6% | 32.7% | 0.33 | 70.6% |

![PRE cumulative return and drawdown](cum_dd_pre.png)

### POST

| System | N | CAGR | Vol | Sharpe | MaxDD |
|---|---:|---:|---:|---:|---:|
| B_H | 1653 | 26.7% | 13.0% | 1.89 | 11.3% |
| TSMOM_Fixed | 1308 | 5.2% | 17.3% | 0.38 | 27.6% |
| TSMOM_VolScaled | 1308 | 13.2% | 24.9% | 0.62 | 41.9% |

![POST cumulative return and drawdown](cum_dd_post.png)

### FULL

| System | N | CAGR | Vol | Sharpe | MaxDD |
|---|---:|---:|---:|---:|---:|
| B_H | 7443 | 9.8% | 16.3% | 0.66 | 50.7% |
| TSMOM_Fixed | 3769 | 4.9% | 17.7% | 0.36 | 39.5% |
| TSMOM_VolScaled | 3769 | 9.7% | 30.6% | 0.46 | 70.6% |

![FULL cumulative return and drawdown](cum_dd_full.png)

In each window, read the volatility-scaled arm together with its drawdown and turnover. A higher CAGR or Sharpe is not sufficient if it comes from materially higher leverage or a worse drawdown.

## Limitations

- The India MCX arm omits roll P&L at the contract boundary; its reported returns are deliberately conservative and are not a substitute for a fully marked roll adjustment.
- The US arm is an ETF adaptation, not a futures replication.
- The crypto arm is a daily adaptation of hourly data and is not directly comparable to the original futures sample.
- The paper's CFTC-position analysis is not reproduced because the required point-in-time positioning data is not in this estate.
- This is a first-pass mechanism test, not a deployable strategy or a literal replication.
