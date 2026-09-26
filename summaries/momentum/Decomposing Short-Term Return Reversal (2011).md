# Decomposing Short-Term Return Reversal
**Authors:** Zhi Da, Qianqiu Liu, Ernst Schaumburg
**Year:** 2011
**Journal/Venue:** Federal Reserve Bank of New York Staff Report

## Problem statement

The standard one-month reversal strategy buys last month's losers and sells last month's winners. That strategy is profitable, but raw prior returns are mixtures of very different economic components:

- industry continuation,
- expected-return differences across firms,
- genuine cash-flow news,
- and residual nonfundamental price pressure.

This paper asks: **which component actually drives short-term reversal once prior returns are decomposed carefully enough?**

That question matters because a reversal strategy should only bet against the part of price movement that is likely to mean-revert quickly.

## Approach (short)

The paper decomposes the profit to the standard short-term reversal strategy into four pieces:

1. across-industry momentum,
2. within-industry variation in expected returns,
3. within-industry cash-flow news,
4. a residual discount-rate or nonfundamental component.

Expected returns are estimated from rolling Fama-French three-factor exposures. Cash-flow news is measured directly from analyst forecast revisions. The remaining component is interpreted broadly as firm-specific discount-rate news and nonfundamental return innovation. The paper finds that this residual component is the true driver of reversal, and a strategy that sorts on it has roughly triple the alpha of the standard raw-return reversal.

## Approach (detailed)

### 1. Start from the linear one-month reversal strategy

The benchmark is the standard contrarian rule implemented monthly:

1. rank stocks by month `t-1` return;
2. buy the losers and sell the winners in month `t`;
3. hold for one month.

In the paper's linear notation the reversal weight is proportional to minus the stock's deviation from the cross-sectional mean lagged return. That representation matters because it allows the profit to be decomposed algebraically instead of only through portfolio sorts.

### 2. Separate across-industry from within-industry reversal

The first decomposition uses industry averages. Let the lagged return of stock `i` in industry `j` be split into:

$$
r_{i,t-1} = r_{j,t-1} + \tilde r_{i,t-1},
$$

where `r_{j,t-1}` is the cross-sectional average return of industry `j` and `\tilde r_{i,t-1}` is the within-industry deviation.

The reversal profit can then be written as:

$$
\pi_t^{rev}
=
\sum_j \frac{N_j}{N}\pi_{j,t}
+ \Omega_{m,t},
$$

where:

- `\pi_{j,t}` is the within-industry reversal profit,
- `\Omega_{m,t}` is the across-industry component.

This is already informative. Since industries display momentum, not reversal, the across-industry term is expected to be negative on average. That means naive reversal is fighting a continuation component it should not be betting against.

### 3. Decompose within-industry reversal into expected return, cash-flow news, and residual news

The paper then uses a Campbell-Shiller style decomposition for each stock's within-industry return innovation:

$$
\tilde r_{i,t}
=
\mu_{i,t}
+ CF_{i,t}
+ DR_{i,t},
$$

where:

- `\mu_{i,t}` is the expected-return component,
- `CF_{i,t}` is firm-specific cash-flow news,
- `DR_{i,t}` is the residual discount-rate or nonfundamental component.

Substituting this into the within-industry reversal profit yields three within-industry pieces:

- `\Omega^\mu_t`,
- `\Omega^{CF}_t`,
- `\Omega^{DR}_t`.

Combining that with the across-industry term gives the full four-part decomposition:

1. across-industry momentum `\Omega_{m,t}`,
2. within-industry expected-return dispersion `\Omega^\mu_t`,
3. within-industry cash-flow-news reaction `\Omega^{CF}_t`,
4. within-industry residual discount-rate/news component `\Omega^{DR}_t`.

### 4. Make the decomposition empirical rather than purely theoretical

The paper's real contribution is that each term is made measurable at monthly frequency.

**Expected returns.** These are estimated from rolling Fama-French three-factor betas. The expected-return term is included because if some stocks simply have higher conditional expected returns, a raw reversal sort will confound that cross-sectional dispersion with actual mean reversion.

**Cash-flow news.** This is measured directly from monthly revisions in analyst consensus earnings forecasts, following the Da-Warachka approach. That is the key practical innovation. Most return-news decompositions are hard to implement in real time at monthly horizons; analyst revisions give the authors a tractable proxy for changes in expected fundamentals.

**Residual component.** Whatever is left after removing the industry effect, expected return, and cash-flow news becomes the residual `DR` component. The paper interprets it broadly as firm-specific non-cash-flow return innovation, which may reflect mispricing, liquidity shocks, or sentiment.

### 5. Show what actually reverses

The decomposition delivers a sharp answer.

- The across-industry piece is negative because industries exhibit continuation.
- The expected-return component is tiny.
- The cash-flow component is positive but not dominant.
- The residual component is large and positive.

So short-term reversal is not mainly "stocks overreact to all news." It is mainly reversal in the nonfundamental part of very recent price moves.

### 6. Convert the decomposition into a tradable strategy

The paper then moves from the linear decomposition to an implementable decile strategy:

1. within each industry, compute prior-month residual `DR` for each stock;
2. sort stocks into deciles on that residual;
3. buy the most negative-residual decile;
4. short the most positive-residual decile;
5. hold for one month.

Compared with the standard raw-return reversal strategy, this residual-based strategy is dramatically stronger. In the staff report sample:

- the standard reversal strategy has a three-factor alpha of about 0.33% per month and is statistically weak;
- the `DR`-based reversal strategy is about three times larger and highly significant.

That is the core empirical result.

### 7. Use the decomposition to separate long-side and short-side economics

Because the residual is designed to isolate nonfundamental movement, the improved strategy is also a better laboratory for mechanism tests. The authors show that:

- the **long side**, buying recent residual losers, behaves like liquidity provision after temporary price pressure and fire sales;
- the **short side**, selling recent residual winners, is more consistent with sentiment-driven overpricing and short-sale constraints.

That asymmetry is important. The same WML reversal trade is not driven by one symmetric force.

### 8. Why the paper matters methodologically

The paper is stronger than a better backtest because the logic is cumulative:

1. standard reversal is contaminated by industry momentum;
2. some recent price moves are justified by fundamentals;
3. only the residual nonfundamental component should mean-revert quickly;
4. the strategy gets stronger exactly when that component is isolated.

So the paper turns reversal from a raw empirical regularity into a decomposed signal.

## Domain of applicability

- **Where it works well:** Large equity universes with industry classifications, factor data, and analyst-revision data.
- **What is implementable:** A monthly within-industry reversal signal based on residual `DR` news.
- **Main limitation:** The residual is intentionally broad. It isolates "not industry, not expected return, not cash-flow news," but does not uniquely identify one structural channel without additional tests.
- **Why the paper matters:** It shows that the correct short-term reversal trade is not loser-minus-winner in raw returns, but loser-minus-winner in the residual nonfundamental component of recent returns.
