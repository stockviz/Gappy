# The Interaction of Value and Momentum Strategies
**Authors:** Clifford S. Asness
**Year:** 1997
**Journal/Venue:** Financial Analysts Journal

## Problem statement

Value and momentum both predict returns, but they are negatively correlated characteristics. This paper asks: **does the strength of a value strategy depend on whether the stock is a winner or loser, and does the strength of a momentum strategy depend on whether the stock is cheap or expensive?**

The point is not merely that both strategies work. It is whether they interact in a systematic way that any adequate explanation must account for.

## Approach (short)

Using NYSE/AMEX/Nasdaq stocks from July 1963 to December 1994, Asness constructs value-weighted quintile portfolios on:

- momentum, measured by `PAST(2,12)`,
- industry-relative value, measured mainly by `log(BV/MV)` and also `D/P`.

He then forms the 25 intersection portfolios from the joint sorts and asks how value performs inside momentum quintiles and how momentum performs inside value quintiles. The main result is asymmetric:

- value works strongly among losers and weakly among winners,
- momentum works strongly among expensive stocks and weakly among cheap stocks.

## Approach (detailed)

### 1. Define the two characteristics carefully

Momentum is measured by:

$$
\text{PAST}(2,12),
$$

the stock's average or cumulative return over the prior 12 months excluding the most recent month.

Value is measured by:

- `log(BV/MV)`,
- and, in robustness tests, dividend yield `D/P`.

Crucially, the value measures are **industry relative**. The paper subtracts the value-weighted industry average from each firm's raw value metric using 49 Fama-French-style industries.

This means the paper is comparing a stock to its industry peers rather than letting cross-industry composition drive the entire result.

### 2. Use value-weighted quintile sorts

Each month, stocks are sorted into quintiles on:

- `PAST(2,12)`,
- industry-relative `log(BV/MV)`,
- and separately on industry-relative `D/P`.

Returns on the resulting portfolios are value weighted, which makes the exercise closer to implementable institutional portfolios than equal-weighted microcap sorts.

### 3. Form the full 25 interaction portfolios

The core empirical object is the `5 x 5` intersection of momentum and value quintiles. For example, one cell contains:

- recent winners that are cheap relative to industry,

while another contains:

- recent losers that are expensive relative to industry.

This allows the paper to test not only whether each characteristic predicts returns on average, but whether its predictive power changes conditional on the other characteristic.

### 4. Evaluate value inside momentum bins

The first key result comes from asking how value behaves among:

- losers,
- middle portfolios,
- winners.

Value works strongly among losers. Sorting on `log(BV/MV)` within the loser quintile produces a large spread in average returns. But value has little power among winners.

That is a very specific pattern, and the paper emphasizes that it is not because the winner quintile lacks dispersion in book-to-market. The dispersion is there; the return premium simply does not show up in the same way.

### 5. Evaluate momentum inside value bins

The reverse exercise is equally important. Momentum works within all value quintiles, but it is **much stronger among expensive stocks** and weaker among cheap stocks.

So momentum is not invariant to valuation. It is particularly powerful when applied to glamour-like stocks.

### 6. Use surfaces rather than one-dimensional spreads

The paper's figures plot the return surface over the `momentum x value` grid. This is a useful methodological move because it makes the interaction visually clear:

- returns climb steeply with value in loser territory,
- returns climb steeply with momentum in expensive territory,
- but the slopes flatten elsewhere.

This is better than reporting a few isolated portfolio spreads because it shows the full joint shape of expected returns.

### 7. Explain why the interaction matters for theory

Any story that says:

- value is just distress risk,
- or momentum is just underreaction,

must now explain the **interaction**. Why should the value premium largely disappear among winners? Why should momentum be strongest among expensive stocks?

The paper does not claim one complete structural answer. It claims that the joint cross section is richer than either standalone anomaly suggests.

### 8. What a reader should implement

The implementable lesson is:

1. compute standard momentum and industry-relative value metrics,
2. form their intersection portfolios,
3. do not assume that value and momentum combine additively,
4. exploit the fact that value is strongest in loser territory and momentum is strongest in expensive territory.

This is an early paper on **conditional factor interaction**, not just factor combination.

## Domain of applicability

- **Where it works well:** Equity cross sections where both value and momentum can be measured consistently and industry controls are available.
- **What is implementable:** Joint value-momentum portfolios or optimizers that account for the fact that each signal's strength depends on the other.
- **Main limitation:** The paper demonstrates the interaction clearly but leaves the deeper structural explanation open.
- **Why the paper matters:** It showed that value and momentum are not separate one-dimensional premiums but interact in a systematic and economically meaningful way.
