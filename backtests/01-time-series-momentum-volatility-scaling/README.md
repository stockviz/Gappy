# Time-series momentum and volatility scaling

Source paper: `../../summaries/abnormalreturns/Time Series Momentum (2012).md` (Moskowitz, Ooi, and Pedersen, 2012).

Status: executed exploratory adaptation on India, US, and crypto data.

## Implemented rule

- 252-observed-day own-return sign signal.
- Monthly close decision.
- Signal at close t applies to return t+1.
- `TSMOM_Fixed`: sign only.
- `TSMOM_VolScaled`: sign × min(3, 40% / trailing 63-day annualized volatility).
- Costs: India 25 bps, US ETF proxies 10 bps, crypto 5 bps per average absolute exposure change.
- Named PRE ends 2019-12-31; named POST begins 2020-05-01.

## Market folders

- `india/`: NIFTY 50 TR, MIDCAP 150 TR, MIDCAP SELECT TR, SMALLCAP 250 TR, and GOLD/SILVER/CRUDEOIL/COPPER MCX series. MCX returns are calculated within a held contract; roll-boundary returns are set to zero instead of crossing expiries.
- `us/`: SPY, QQQ, IWM, TLT, GLD, and DBC ETF proxies. This is not a literal replication of the paper's futures universe.
- `crypto/`: BTCUSDT and ETHUSDT, dailyized from complete UTC days in the validated hourly Binance table.

Each market folder contains:

- `build.R`, `analyze.R`, build/analyze logs;
- `checkpoint.rds`;
- `daily_returns.csv`, `exposures.csv`, `signals.csv`, `data_audit.csv`;
- `metrics.csv` plus `metrics_{pre,post,full}.{html,png}`;
- `cum_dd_{pre,post,full}.png`;
- `findings.md` — consolidated strategy-level report in the strategy folder;
- `market_findings.md` — regenerated market-local analysis report;

The charts use the shared R2 cumulative-plus-drawdown helper with end labels, viridis colors, economist theme, and `@StockViz` caption. The metric tables color CAGR and Sharpe positively and lower MaxDD positively.

## Limitations

The source paper studied liquid futures and also used CFTC positioning data. The current run uses validated proxies and does not reproduce the positioning analysis. The India MCX arm omits roll P&L at the boundary by construction, so it should be treated as a conservative mechanism test rather than a final futures result.
