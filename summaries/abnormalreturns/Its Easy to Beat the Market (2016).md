# It's Easy to Beat the Market
**Authors:** Moshe Levy
**Year:** 2016
**Journal/Venue:** Journal of Investment Management

## Problem statement

The market portfolio is widely treated as a benchmark that is hard to beat. Levy challenges that belief directly. His question is not whether there exists a sophisticated active strategy that beats the market, but whether a very large fraction of *randomly generated passive portfolios* already beat it.

## Approach (short)

The paper compares the market portfolio to a large set of random buy-and-hold portfolios. For each random portfolio:

1. draw initial stock weights independently from a uniform distribution on `[0,1]`;
2. normalize them to sum to one;
3. hold the portfolio passively, without rebalancing.

Performance is then compared with the market using Sharpe ratio and terminal wealth.

## Approach (detailed)

### 1. Change the benchmark question

Levy's point is that "beating the market" is usually posed as an active-management question. He recasts it as a benchmark-quality question:

- if most random passive portfolios beat the market,
- then the market is a weak benchmark rather than a uniquely hard target.

### 2. Generate random passive portfolios

The portfolio-construction rule is intentionally simple:

1. choose a stock universe, focusing on the `500` largest stocks to avoid small-cap illiquidity artifacts;
2. draw nonnegative random weights `u_i \sim U[0,1]`;
3. set

$$
w_i = \frac{u_i}{\sum_j u_j};
$$

4. hold the portfolio passively through the sample.

The non-rebalancing choice is crucial. Levy wants pure buy-and-hold portfolios, not repeated resampling of weights that would mechanically mix in timing and turnover effects.

### 3. Compare with the capitalization-weighted market

Each random portfolio is evaluated against the market portfolio on:

- Sharpe ratio,
- terminal value.

The paper then asks for the proportion of random portfolios whose realized performance exceeds that of the market.

### 4. Use a distributional argument rather than a single strategy

This is not one optimized backtest. The empirical object is the distribution of performance across a large ensemble of random passive portfolios. The main result is that:

- about `69%` of random portfolios have higher Sharpe ratios than the market,
- about `67%` end with higher terminal wealth.

That result is intended to show that the market is not sitting near the top of the passive opportunity set.

### 5. Explain why this can happen

A capitalization-weighted index is not chosen to maximize Sharpe ratio. It is the aggregate wealth-weighted portfolio. If firm sizes are extremely dispersed, cap weighting embeds concentration that need not be efficient from a mean-variance or geometric-growth perspective.

So the paper's logic is:

- market weights come from size, not optimization,
- random diversification often dominates that concentration ex post,
- therefore "the market is hard to beat" is an overstated belief.

### 6. What a reader should implement

To reproduce the paper:

1. define a liquid stock universe;
2. generate many random nonnegative weight vectors and normalize them;
3. hold each portfolio passively over the same sample as the market index;
4. compute Sharpe ratios and terminal wealth;
5. compare the empirical distribution to the market's realized performance.

The method is almost embarrassingly simple on purpose.

## Domain of applicability

- **Where it works well:** Critiquing benchmark choice and studying the effect of capitalization concentration.
- **What is implementable:** Monte Carlo generation of passive weight vectors and distributional performance comparison.
- **Main limitation:** The result is ex post and sample dependent; it does not tell you which random portfolio to hold ex ante.
- **Why the paper matters:** It attacks the sanctity of the market benchmark more than it proposes an investable alpha.
