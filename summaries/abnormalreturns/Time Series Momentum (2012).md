# Time Series Momentum
**Authors:** Tobias J. Moskowitz, Yao Hua Ooi, Lasse Heje Pedersen
**Year:** 2012
**Journal/Venue:** Journal of Financial Economics

## Problem statement

Cross-sectional momentum ranks assets against each other. This paper asks whether an even simpler effect exists: **does an asset's own past return predict its own future return across many liquid futures markets?**

That question matters because if the answer is yes, then momentum is not just a relative-value cross-sectional phenomenon. It is also a directional trend phenomenon at the level of individual assets.

## Approach (short)

The paper studies 58 liquid futures contracts across equities, bonds, currencies, and commodities over more than 25 years. For each instrument, it tests whether the sign of the past 12-month excess return predicts the next month's excess return. The benchmark time-series momentum strategy for contract `s` is:

$$
r^{TSMOM,s}_{t,t+1}
=
\operatorname{sign}(r^s_{t-12,t})\frac{40\%}{\sigma_t^s} r^s_{t,t+1},
$$

and the diversified strategy averages these contract-level positions across instruments. The paper then relates TSMOM to cross-sectional momentum and decomposes both strategies into mean, auto-covariance, and cross-serial-covariance components.

## Approach (detailed)

### 1. Define time-series momentum at the asset level

The basic question is whether:

$$
\operatorname{sign}(r^s_{t-h,t})
$$

helps predict `r^s_{t,t+1}` for the same asset `s`.

The paper studies pooled predictive regressions across instruments and horizons, but the central signal is the **past 12-month excess return** of each contract.

### 2. Work in liquid futures so positions are directly implementable

The sample consists of 58 liquid futures contracts from multiple asset classes:

- stock index futures,
- government bond futures,
- currency futures,
- commodity futures.

This matters because futures make long and short exposure symmetric and comparably implementable across very different markets.

### 3. Scale positions by ex ante volatility

The benchmark contract-level strategy is volatility scaled:

$$
r^{TSMOM,s}_{t,t+1}
=
\operatorname{sign}(r^s_{t-12,t})
\frac{40\%}{\sigma_t^s}
r^s_{t,t+1}.
$$

So the sign of the past 12-month return chooses the direction, and `40% / \sigma_t^s` scales the position so that each contract contributes comparable risk.

This is important. The paper is not just testing a sign rule; it is testing a **risk-normalized trend rule**.

### 4. Maintain nonoverlapping strategy returns even when holding periods exceed one month

When the paper studies multi-month holding periods, it follows the Jegadeesh-Titman overlapping-vintage logic so that each date still yields one strategy return. This keeps the return series comparable across horizons and avoids sparse observations.

### 5. Document the horizon pattern of predictability

Pooled regressions show:

- positive continuation over roughly the first 12 months,
- weaker reversals at longer horizons.

The sign-regression version is especially useful because it strips the signal down to trend direction rather than requiring exact magnitude forecasts.

### 6. Build the diversified TSMOM factor

The diversified portfolio is just the equal-weighted average of the contract-level TSMOM returns across the available instruments. This yields a time-series momentum factor with:

- strong average return,
- substantial alpha relative to broad market and Fama-French-style factors,
- and low conventional market beta.

### 7. Relate TSMOM to cross-sectional momentum

The paper then asks how time-series momentum differs from cross-sectional momentum. Cross-sectional momentum uses weights based on assets' deviations from the cross-sectional mean. Time-series momentum uses each asset's own past return only.

To connect the two, the paper decomposes expected returns. For time-series momentum, with linear weights proportional to lagged own returns:

$$
E(r^{TS}_{t,t+1})
=
\frac{\operatorname{tr}(\Omega)}{N}

+ \frac{m'm}{N},
$$

where the dominant term is the **auto-covariance** of each asset with its own future return.

By contrast, cross-sectional momentum includes:

- the same auto-covariance piece,
- plus cross-serial covariance terms,
- plus mean-return-dispersion terms.

This decomposition is the paper's conceptual bridge between trend-following and relative-strength momentum.

### 8. Show that TSMOM is not just cross-sectional momentum in disguise

Time-series regressions of TSMOM on cross-sectional momentum factors show significant overlap but also large residual alpha. So time-series momentum shares a component with cross-sectional momentum, but it is not fully spanned by it.

### 9. Bring in trader positions

Using CFTC position data, the paper studies speculators and hedgers around trend signals. The empirical picture is:

- speculators tend to be positioned with the trend,
- hedgers take the opposite side,
- speculators appear to profit from time-series momentum at the expense of hedgers.

This is not the paper's core pricing result, but it helps connect the factor to actual market participants.

### 10. What a reader should implement

A faithful implementation is:

1. compute each contract's cumulative excess return over the previous 12 months;
2. set the position sign equal to the sign of that return;
3. scale by inverse ex ante volatility;
4. hold for one month and average across contracts;
5. optionally compare to cross-sectional momentum using the decomposition terms.

That is the benchmark trend-following strategy the paper leaves behind.

## Domain of applicability

- **Where it works well:** Liquid futures markets across asset classes.
- **What is implementable:** A volatility-scaled 12-month sign strategy, equal-weighted across contracts.
- **Main limitation:** The strategy depends on reliable volatility estimation and on futures-market implementation assumptions that do not map one-for-one into cash equities.
- **Why the paper matters:** It established time-series momentum as a first-class phenomenon, not merely a variant of cross-sectional momentum.
