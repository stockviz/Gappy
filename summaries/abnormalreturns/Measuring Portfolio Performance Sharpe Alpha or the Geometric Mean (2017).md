# Measuring Portfolio Performance: Sharpe, Alpha, or the Geometric Mean?
**Authors:** Moshe Levy
**Year:** 2017
**Journal/Venue:** Journal of Investment Management

## Problem statement

Sharpe ratio is optimal under CAPM-style assumptions, and alpha is widely used in practice. Levy asks which single-number performance measure is best aligned with investor utility once one uses realistic borrowing conditions and actual fund return distributions.

## Approach (short)

The paper compares three measures:

- Sharpe ratio,
- Fama-French five-factor alpha,
- geometric mean (`GM`).

For each fund, it computes the expected utility of an investor who can lever or de-lever the fund subject to realistic borrowing constraints, then checks which summary statistic best reproduces the utility ranking across funds.

## Approach (detailed)

### 1. Define the benchmark performance measures

The three candidates are:

- Sharpe ratio,
- alpha,
- geometric mean

with

$$
GM = \left(\prod_{t=1}^T (1+r_t)\right)^{1/T}-1.
$$

The question is not which one sounds theoretically elegant, but which one preserves the ordering of funds by investor welfare.

### 2. Define the true objective as expected utility with leverage choice

For each fund, the investor chooses the leverage `x` that maximizes expected utility. Under realistic financing:

- borrowing is limited,
- borrowing and lending rates differ,
- the investor can combine the fund with the risk-free asset only within those limits.

This makes the "true" ranking the ranking by:

$$
\max_x E[U(W_T(x))].
$$

The performance measures are then judged by how well they approximate that ranking.

### 3. Compare rankings under unrealistic and realistic financing

The paper first verifies the textbook case:

- with unlimited borrowing at the lending rate,
- Sharpe ratio tracks expected utility almost perfectly,
- even when empirical return distributions are not exactly normal.

Then it moves to the realistic case:

- borrowing capped around `100%`,
- borrowing rate above lending rate.

Under that setup, Sharpe ratio deteriorates sharply as a ranking statistic.

### 4. Evaluate the measures by rank correlation and choice errors

The paper uses three diagnostics:

- rank correlation with expected utility,
- probability of choosing the wrong fund from a menu of funds,
- certainty-equivalent loss from that wrong choice.

These are stronger diagnostics than simply correlating each measure with average return.

### 5. Why geometric mean wins

The geometric mean performs best because it naturally incorporates compounding and is less dependent on the unrealistic leverage logic that makes Sharpe ratio universally optimal in the CAPM world. Under i.i.d. returns it is also horizon invariant:

$$
GM_H = (1+GM)^H - 1
$$

in ranking terms, so the one-period geometric mean preserves the ordering across horizons.

### 6. Why alpha does badly

Alpha is not a comprehensive performance measure because it depends on the benchmark model and does not map cleanly into investor utility even in the stylized cases. In the realistic-borrowing experiments it performs worse than both Sharpe and geometric mean.

### 7. What a reader should implement

To reproduce the paper:

1. collect fund return histories;
2. specify a utility function and realistic borrowing/lending constraints;
3. compute each fund's maximal expected utility over leverage choices;
4. compute Sharpe ratio, multi-factor alpha, and geometric mean;
5. compare rank correlation and certainty-equivalent losses.

The main practical recommendation is: if one insists on a single summary number under realistic investor constraints, `GM` is often superior.

## Domain of applicability

- **Where it works well:** Fund ranking, portfolio evaluation, and any setting where leverage is limited or borrowing is expensive.
- **What is implementable:** Geometric-mean ranking or direct utility-based evaluation.
- **Main limitation:** The exact superiority of `GM` depends on the investor setting, though the paper finds the result robust across many cases.
- **Why the paper matters:** It reframes the performance-measure problem around utility rather than inherited convention.
