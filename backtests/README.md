# Backtest queue

This directory mirrors the feasible-paper queue from `../backtestable-papers.md`.
Each study has market-specific folders so data assumptions and results do not get mixed.

## Folder layout

- `01-time-series-momentum-volatility-scaling/`
  - `india/` — NIFTY total-return indices and MCX futures where the continuous-series audit passes.
  - `us/` — US ETF proxies available in `BHAV_EQ_TD`.
  - `crypto/` — BTCUSDT and ETHUSDT dailyized from the validated Binance hourly table.
- `02-momentum-crash-prediction/`
  - `india/`, `us/`
- `03-online-portfolio-selection/`
  - `india/`, `us/`
- `04-drawdown-semi-markov-control/`
  - `india/`, `us/`
- `05-commodity-futures-trend-roll-yield/`
  - `india/`, `us/`
- `06-short-term-reversal-pairs/`
  - `india/`, `us/`
- `07-option-data-audit/`
  - `india/`, `us/`

The first and second studies have executed India and US arms (the first also includes crypto). Studies 03–07 remain empty shells and are not claims that those studies have run.

## House conventions

- Signal information available at close t earns the return on the next applicable trading day.
- Parameters are selected only on the permitted training/validation data.
- Named PRE ends on 2019-12-31; named POST begins on 2020-05-01. A study with a later data start emits only available windows.
- Report CAGR, annualized volatility, Sharpe, MaxDD, average exposure, turnover, and observation counts.
- Every cumulative chart must contain stacked cumulative and drawdown panels, end labels with CAGR/Sharpe, drawdown labels, viridis colors, economist theme, and `@StockViz` caption.
- Results are exploratory adaptations unless the source market, instruments, data, and execution rules match the paper.
