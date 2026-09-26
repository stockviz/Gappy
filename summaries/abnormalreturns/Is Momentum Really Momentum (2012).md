# Is Momentum Really Momentum?
**Authors:** Robert Novy-Marx
**Year:** 2012
**Journal/Venue:** Journal of Financial Economics

## Problem statement

Standard equity momentum is usually thought of as continuation in **recent** past returns. Novy-Marx asks whether that description is even correct. His question is: **does the profitability of conventional momentum strategies really come from recent continuation, or does it come mainly from returns earned at intermediate horizons farther back in time?**

This is a methodological challenge to the way the signal itself is defined.

## Approach (short)

The paper decomposes past performance into:

- **recent past returns** `r_{6,2}`,
- **intermediate-horizon past returns** `r_{12,7}`.

Using CRSP/Compustat-style U.S. equity data from 1927-2010, it compares the predictive power of those two variables in:

- Fama-MacBeth regressions,
- univariate and double-sorted momentum portfolios,
- spanning tests,
- subsample and size-quintile analyses,
- and extensions to international equity indexes, commodities, and currencies.

The central result is that what the literature calls momentum is driven much more by **intermediate-horizon** past performance than by very recent past performance.

## Approach (detailed)

### 1. Split past return into two separate signals

The paper's central design move is to decompose cumulative past return into:

- `r_{6,2}`: recent performance over months `t-6` through `t-2`,
- `r_{12,7}`: intermediate-horizon performance over months `t-12` through `t-7`.

This is not just a notation trick. It creates two independent candidate signals:

- a recent-return component,
- an intermediate-return component.

If conventional momentum were really about near-term continuation, `r_{6,2}` should dominate. The paper shows it does not.

### 2. Begin with the term structure of return predictability

The paper first studies how average future returns vary with past performance measured over different horizons. That term-structure exercise shows that predictive power is strongest for the intermediate part of the past year, not for the most recent months.

This already weakens the usual interpretation of momentum as a short-run continuation phenomenon.

### 3. Run Fama-MacBeth regressions of returns on both signals

The first main empirical test is a monthly Fama-MacBeth regression of returns on:

- `r_{12,7}`,
- `r_{6,2}`,
- past one-month return `r_{1,0}`,
- size,
- book-to-market.

Independent variables are winsorized each month, and the full sample runs from January 1927 through December 2010.

The key result is that the coefficient on `r_{12,7}` is consistently large and significant, while the coefficient on `r_{6,2}` is much weaker and much less stable across subsamples.

### 4. Compare actual winner-minus-loser portfolios based on each component

The second core test constructs direct long-short portfolios:

- `MOM12,7`: winners minus losers based on intermediate-horizon returns,
- `MOM6,2`: winners minus losers based on recent returns.

Winners and losers are typically the upper and lower deciles using NYSE breakpoints, and the paper reports both value- and equal-weighted results.

The striking finding is that `MOM12,7` outperforms `MOM6,2` and does so much more consistently through time.

### 5. Use double sorts to ask whether recent-return momentum survives once intermediate returns are held fixed

This is the most convincing design in the paper. The authors:

1. sort on `r_{12,7}`,
2. within those bins sort on `r_{6,2}`,
3. and then reverse the sorting order.

If recent returns are the true driver, they should remain powerful after controlling for intermediate returns. Instead:

- intermediate-return spreads remain strong within recent-return buckets,
- recent-return spreads shrink sharply once intermediate-return buckets are held fixed.

This shows that standard `12-2` style momentum owes much more to `12-7` than to `6-2`.

### 6. Use time-series spanning tests

The paper then asks whether recent-return momentum contains information **beyond** intermediate-return momentum. Time-series regressions show that:

- `MOM6,2` has little or no alpha once `MOM12,7` is included,
- `MOM12,7` retains alpha relative to conventional recent-return strategies and standard factors.

This turns the conceptual claim into a factor-spanning claim: intermediate-horizon momentum spans much of what conventional momentum is doing.

### 7. Check stability through time and by size

The paper studies:

- rolling 10-year Fama-MacBeth coefficients,
- early versus late subsamples,
- size-quintile implementations.

The intermediate-horizon signal remains much more stable than the recent-return signal. This is especially important because recent-return predictability swings around the sample, while the intermediate-horizon relation is far more durable.

### 8. Test competing explanations

Novy-Marx then confronts several popular stories:

- the 12-month effect,
- earnings momentum,
- capital gains overhang,
- disposition effects,
- other underreaction stories based mainly on recent returns.

The argument is not that these channels never matter. It is that none of them naturally generates the observed term structure in which the **middle of the prior year** dominates the most recent months.

### 9. Extend the result beyond U.S. equities

The paper goes on to test momentum in:

- international equity indexes,
- commodity futures,
- currency strategies.

The same broad pattern appears repeatedly: intermediate-horizon past performance is often more informative than recent performance.

That extension matters because it weakens the chance that the result is a peculiarity of U.S. stock microstructure.

### 10. What a reader should implement

The paper's implementation lesson is very concrete:

1. stop treating all past-year return information as one signal;
2. isolate the intermediate window `t-12` through `t-7`;
3. build long-short portfolios directly on that window;
4. use recent-return information mainly as a control or refinement, not as the main driver.

In practice, the paper argues that properly designed momentum strategies can be materially improved by emphasizing intermediate-horizon returns.

## Domain of applicability

- **Where it works well:** Equity momentum research and implementation, especially when the practitioner can choose the exact lookback decomposition instead of inheriting the conventional `12-2` heuristic.
- **What is implementable:** Intermediate-horizon winner-minus-loser portfolios based on `r_{12,7}`, plus double-sort diagnostics that hold `r_{6,2}` fixed.
- **Main limitation:** The paper decisively redefines the signal, but it leaves the ultimate structural explanation of why intermediate-horizon returns dominate as an open problem.
- **Why the paper matters:** It changes the object called "momentum" from recent continuation to a signal driven primarily by the middle of the prior year.
