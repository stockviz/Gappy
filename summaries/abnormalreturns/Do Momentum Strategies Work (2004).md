# Do Momentum Strategies Work?
**Authors:** Stanley G. Eakins, Stanley R. Stansell
**Year:** 2004
**Journal/Venue:** Journal of Investing

## Problem statement

Most momentum papers study individual stocks or industry portfolios. Eakins and Stansell instead ask the allocator's question: **if an investor had only public sector funds or sector indexes, could a simple momentum rotation rule have beaten broad market benchmarks on a risk-adjusted basis, and what ranking/holding schedule would have worked best?**

This is a practical implementation paper. The object being designed is not an anomaly test but an executable sector-rotation rule.

## Approach (short)

The paper studies 19 sector indexes/funds from December 1995 to December 2001 and applies seven deterministic momentum rules of the form `L/H`, where `L` is the lookback window used for ranking and `H` is the holding period. The strategy buys the top-ranked sector, or the top `k` sectors, and compares the realized return, volatility, and Sharpe ratio to the S&P 500, Dow, Wilshire 5000, and an equal-weighted sector basket.

The strongest in-sample performer is the `6L1H` rule, but the paper also shows that the outperformance is heavily tied to the internet sector and to the unusual late-1990s sample.

## Approach (detailed)

### 1. Define the investable universe

The paper uses 19 sector series:

- 18 S&P 1500 sector or industry-group indexes,
- and the Wilshire REIT index.

Monthly returns are observed from December 1995 through December 2001. The sample is intentionally chosen to correspond to the period in which a reasonably broad sector menu was available to ordinary investors.

### 2. Specify the ranking and holding rules explicitly

The notation is transparent:

- `L` = lookback period over which momentum is measured,
- `H` = time the chosen sector portfolio is held before re-ranking.

The seven strategies are:

- `1L1H`
- `3L1H`
- `6L1H`
- `12L1H`
- `3L3H`
- `6L3H`
- `6L6H`

For example, `6L1H` is implemented as follows:

1. at the end of month `t`, compute each sector's compounded return from `t-6` to `t-1`;
2. rank the 19 sectors by that return;
3. buy the top-ranked sector at the start of month `t+1`;
4. hold for one month;
5. repeat at the next month-end.

For `3L3H`, `6L3H`, and `6L6H`, the ranking rule is the same but the selected sector is held for three or six months before rebalancing.

### 3. Use a deliberately simple portfolio-construction rule

The baseline strategy always holds the single best-ranked sector. There is:

- no shorting,
- no leverage,
- no risk model,
- and no transaction-cost optimization.

This simplicity is central to the paper. The authors are testing whether public information alone could have supported a practical sector-rotation strategy.

### 4. Evaluate the strategy the way an allocator would

Each rule is compared with:

- the S&P 500,
- the Dow Jones Industrial Average,
- the Wilshire 5000,
- and an equal-weighted monthly rebalanced basket of the 19 sectors.

The performance statistics are:

- cumulative return,
- annualized return,
- annualized standard deviation,
- Sharpe ratio.

The Sharpe ratio is computed with the three-month Treasury bill as the risk-free rate. So the evaluation metric is not factor alpha; it is total return per unit of total risk.

### 5. Vary the number of sectors held

The paper then asks whether momentum benefits from diversification across several top-ranked sectors. The extension is mechanical:

1. rank sectors by the chosen `L/H` rule;
2. hold the top `k` sectors equally weighted;
3. let `k` run from 1 to 18;
4. compare the change in return, volatility, and Sharpe ratio.

This is useful because it exposes the actual diversification trade-off:

- increasing `k` reduces volatility,
- but it also dilutes exposure to the strongest recent winner.

In this sample the dilution often dominates, especially for longer lookback rules.

### 6. Stress-test the result by removing the internet sector

The most important robustness check is to rerun the strategies after excluding the internet sector. The method is the same, but the dominant bubble-era winner is removed from the ranking universe.

This matters because the sample's extreme returns are concentrated in 1998-1999, and many of the most successful momentum paths repeatedly selected internet-related exposures. The paper shows that once this sector is removed, the spectacular headline performance weakens materially.

### 7. What the backtest is really capturing

The best in-sample rule is `6L1H`, which earns the highest Sharpe ratio and annualized return. That suggests a specific design lesson:

- one month is too short for signal estimation,
- twelve months is already stale in this sample,
- a six-month formation window with frequent re-ranking was the sweet spot.

But this is sample specific. The paper is explicit enough for the reader to see why: the strategy wins by repeatedly concentrating in the sectors that were in the strongest bubble regime.

### 8. What a reader should implement

A faithful implementation is straightforward:

1. collect monthly sector total returns;
2. compute compounded `L`-month returns for each sector;
3. rank sectors each rebalance date;
4. hold the top `k` sectors equally weighted for `H` months;
5. benchmark against passive alternatives using annualized return, volatility, and Sharpe ratio;
6. rerun the exercise after removing dominant sectors to test how concentrated the result really is.

This is one of the cleanest examples of a long-only sector-momentum rotation template.

## Domain of applicability

- **Where it works well:** Long-only sector allocation with a small menu of investable sector indexes or ETFs.
- **What is implementable:** The exact backtest is trivial to code from monthly total-return data.
- **Main limitation:** The evidence comes from a short and exceptional sample dominated by the technology and internet boom.
- **Why the paper matters:** It translates momentum from academic stock sorts into a portfolio rule an allocator could actually have followed.
