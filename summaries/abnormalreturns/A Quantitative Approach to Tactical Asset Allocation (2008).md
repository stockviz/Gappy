# A Quantitative Approach to Tactical Asset Allocation
**Authors:** Mebane T. Faber
**Year:** 2008
**Journal/Venue:** Journal of Wealth Management / working paper

## Problem statement

Faber asks whether a very simple price-based timing rule can materially improve the risk-adjusted performance of asset classes relative to passive buy-and-hold. The paper is explicitly tactical rather than structural: it does not attempt to explain expected returns from fundamentals, but to determine whether long-run drawdowns can be reduced with a stable trend-following filter.

## Approach (short)

The rule is a one-line moving-average timing model:

1. compute the `10`-month simple moving average of the monthly price;
2. hold the asset when `Price_t > SMA_{10,t}`;
3. move to cash or T-bills when `Price_t < SMA_{10,t}`.

The paper tests this on U.S. equities since 1900, and from 1973 onward on multiple asset classes, then in an equal-weighted tactical-asset-allocation portfolio.

## Approach (detailed)

### 1. Define the exact signal

The timing model is:

$$
Signal_t=
\begin{cases}
1 & \text{if } P_t > SMA_{10,t},\\
0 & \text{if } P_t < SMA_{10,t}.
\end{cases}
$$

Operationally:

- buy when the monthly closing price is above the `10`-month SMA;
- sell and move to cash when the monthly closing price is below the `10`-month SMA.

The paper notes the equivalence between a `10`-month SMA on monthly data and a `200`-day SMA on daily data, but implements the monthly rule to keep turnover low and replication simple.

### 2. Specify the execution protocol

The strategy is intentionally mechanical:

- signals are evaluated monthly at the close;
- trades occur at the close on the signal date;
- the system is always either fully invested in the risky asset or fully in cash/T-bills;
- no leverage is required in the baseline strategy.

This matters because the paper's claim is not that trend following works with complex optimization. It is that a naive, easy-to-implement filter already changes the drawdown profile a lot.

### 3. Test the rule asset by asset

The rule is first tested on U.S. equities over a long historical sample, then from 1973 onward on:

- U.S. equities,
- EAFE equities,
- commodities,
- REITs,
- 10-year Treasuries.

For each asset, the paper compares:

- annualized return,
- volatility,
- Sharpe ratio,
- maximum drawdown,
- percentage of time invested,
- turnover.

The consistent pattern is lower volatility and much smaller drawdowns, often with similar or better returns.

### 4. Build a tactical multi-asset portfolio

The paper then forms an equal-weighted portfolio of the five asset classes. The tactical portfolio applies the same asset-level rule separately to each sleeve:

$$
w_{i,t}=
\begin{cases}
1/N & \text{if asset } i \text{ is above its SMA},\\
0 & \text{otherwise},
\end{cases}
$$

with the inactive portion allocated to T-bills.

This design is important because it avoids using cross-asset forecasts. Each asset is timed on its own trend, and diversification comes from combining the independently timed sleeves.

### 5. Check robustness to SMA length

Faber does not present the `10`-month choice as a knife-edge optimum. He explicitly compares nearby windows, roughly `6` to `12` months, and finds similar results. That robustness check is methodologically central: it argues the result is a broad trend-following effect, not parameter mining around one exact horizon.

### 6. Interpret the rule

The paper's interpretation is pragmatic:

- the rule sacrifices part of roaring bull markets;
- but it exits sustained downtrends and thereby avoids catastrophic drawdowns.

So the benefit should be understood less as pure return enhancement and more as **return smoothing through crash avoidance**.

### 7. What a reader should implement

1. monthly total-return index levels for each asset class;
2. `10`-month SMA on end-of-month prices;
3. binary invested/cash signal by asset;
4. optional equal-weighted combination across sleeves;
5. transaction-cost and turnover checks.

## Domain of applicability

- **Where it works well:** Liquid asset-class futures or indices with persistent medium-horizon trends.
- **What is implementable:** A monthly trend-following overlay on long-only portfolios.
- **Main limitation:** It is a reduced-form timing rule; it can whipsaw badly in sideways markets.
- **Why the paper matters:** It popularized a very simple multi-asset trend rule that is easy to replicate and hard to dismiss as overfit.
