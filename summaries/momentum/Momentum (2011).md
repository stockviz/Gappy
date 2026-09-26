# Momentum
**Authors:** Narasimhan Jegadeesh, Sheridan Titman
**Year:** 2011
**Journal/Venue:** Annual Review of Financial Economics

## Problem statement

This is a review paper, but it is organized around an implementable question: **what exactly is the canonical momentum strategy, what empirical facts about price and earnings momentum are robust, and which explanations remain viable once one separates cross-sectional expected-return dispersion, common-factor effects, and delayed reaction to firm-specific information?**

Relative to later surveys, this review is anchored more tightly to the original Jegadeesh-Titman framework and to the interaction between price momentum and earnings momentum.

## Approach (short)

The paper reviews the literature in five linked blocks:

- the canonical `J/K` price-momentum strategy,
- possible sources of momentum profits,
- industry momentum,
- behavioral explanations and cross-sectional determinants,
- the interaction between earnings momentum and return momentum,
- and recent time variation in momentum profits, especially the 2009 crash.

Its methodological value lies in the way it keeps returning to the same implementation objects:

- decile sorts on past `J`-month returns held for `K` months,
- risk-adjusted alphas,
- industry-adjusted tests,
- SUE and forecast-revision portfolios,
- and time-series predictors of aggregate momentum profitability.

## Approach (detailed)

### 1. Re-state the canonical Jegadeesh-Titman strategy

The review starts from the original cross-sectional momentum construction:

1. rank stocks at the beginning of month `t` by their returns over the past `J` months;
2. form 10 equally weighted decile portfolios;
3. define the top decile as winners and the bottom decile as losers;
4. hold the spread portfolio for `K` months, often skipping the very recent period to avoid short-term reversal contamination.

The canonical case is the medium-horizon `J/K` strategy with formation and holding windows between three and 12 months.

This is the baseline object for the entire review.

### 2. Distinguish momentum from known short- and long-horizon reversals

The paper emphasizes that momentum sits between two contrarian regions:

- very short-horizon reversals at one week to one month;
- long-horizon reversals over three to five years.

That term-structure view matters because it already implies that any theory must explain why returns continue over intermediate horizons but reverse outside them.

### 3. Review the three possible sources of momentum profits

The paper repeatedly returns to the decomposition logic from the original JT work. Momentum profits can come from:

- delayed reaction to firm-specific information;
- cross-sectional dispersion in unconditional expected returns;
- serial covariance in common-factor returns or common-factor reactions.

Methodologically, this is the review's central filter. Every explanation is judged by which component it is supposed to generate.

### 4. Note what standard risk adjustments do and do not explain

The review summarizes the familiar empirical tests:

- CAPM adjustment,
- Fama-French three-factor adjustment,
- and related benchmark alphas.

These models do not eliminate momentum profits. So the paper treats simple cross-sectional risk compensation as insufficient, even though more elaborate time-varying-risk stories remain logically possible.

### 5. Explain how delayed reaction to common factors can also create momentum

The paper is careful not to equate momentum only with delayed reaction to firm-specific news. If stocks react to common factors with different speeds, then current factor realizations can forecast subsequent cross-sectional payoffs.

This is the lead-lag interpretation:

- stocks with high contemporaneous beta also have large lagged beta,
- so a large market or common-factor move at `t-1` induces a continuation in relative returns at `t`.

The paper reviews why the original JT evidence did not support this as the whole story, but it treats the mechanism seriously.

### 6. Summarize industry momentum as a common-component test

The review next turns to Moskowitz-Grinblatt. Industry momentum is implemented by:

- forming value-weighted industry portfolios,
- ranking stocks or industries using past industry returns,
- and comparing the true industry strategy with random-industry replacement strategies.

The methodological point is that if industry continuation explains stock momentum, replacing stock identities within winner and loser industries should preserve much of the effect. The literature finds that industry structure matters materially, though it does not exhaust the stock-level effect in all implementations.

### 7. Organize behavioral models by the information-processing friction they impose

The review then covers the major behavioral frameworks:

- Barberis-Shleifer-Vishny: conservatism and representativeness;
- Daniel-Hirshleifer-Subrahmanyam: overconfidence and self-attribution;
- Hong-Stein: slow information diffusion with heterogeneous investors;
- anchoring-related evidence such as the 52-week high;
- other cross-sectional determinants tied to limits to arbitrage, attention, or sentiment.

This is not just a literature list. Each model implies a different state variable to monitor:

- earnings surprises,
- consistent news streaks,
- investor sentiment,
- or information-diffusion frictions.

### 8. Tie cross-sectional determinants back to the models

The review summarizes evidence that momentum is stronger in settings where behavioral underreaction should be more severe, such as:

- growth stocks rather than value stocks,
- more difficult-to-value firms,
- settings with stronger information frictions,
- and environments where sentiment or overconfidence is likely to be elevated.

So the review treats cross-sectional heterogeneity as a direct test of theory, not merely as a style observation.

### 9. Review earnings momentum with an explicit signal definition

The earnings-momentum literature uses **standardized unexpected earnings**:

$$
SUE=\frac{\text{Quarterly earnings}-\text{Expected quarterly earnings}}{\text{Std. dev. of quarterly earnings}}.
$$

In practice, the expectation is usually based on a seasonal random walk with drift or on analyst forecast changes. The review also discusses forecast-revision strategies built from revisions in analyst expectations.

The point is that earnings momentum is implemented on a signal tied directly to fundamentals, not on past returns.

### 10. Use two-way sorts to test whether earnings and price momentum are the same effect

The review gives special attention to Chan et al. (1996, 2000). Their two-way analysis:

1. sorts stocks by past six-month returns;
2. independently sorts them by SUE or by analyst forecast revisions;
3. examines the nine resulting portfolios.

The result is that price momentum and earnings momentum both retain predictive power when the other is held fixed. So neither fully subsumes the other. Methodologically, this is one of the strongest pieces of evidence that "momentum" is not one scalar phenomenon.

### 11. Update the evidence through 2009 and study the crash

The review then leaves pure survey mode and computes recent momentum performance directly. The strategy examined is:

- six-month ranking,
- six-month holding,
- one-month skip between ranking and holding,
- overlapping extreme decile portfolios,
- excluding the smallest NYSE size decile and stocks below \$5.

From 1990 to 2009 the strategy remains profitable overall, but it suffers a very large loss in 2009.

### 12. Explain 2009 with beta and time-series predictors

The review links the 2009 crash to the old decomposition intuition: after severe market declines, winners tend to be low-beta and losers high-beta, so a strong rebound hurts the long-winner/short-loser portfolio.

It then examines time-series predictors of aggregate momentum profitability, especially:

- lagged three-year market return,
- cross-sectional return dispersion `RD`.

The review estimates regressions of monthly momentum returns on standardized predictor values and shows that these signals, together with the portfolio beta, explain a large part of the 2009 loss.

### 13. What a reader should implement

A faithful implementation of the review's core methodology is:

1. build the canonical `J/K` momentum portfolios with decile sorts and skipped recent month when appropriate;
2. test alternative explanations by isolating factor exposure, industry structure, and firm-specific information effects;
3. construct SUE and forecast-revision portfolios separately from price momentum;
4. use independent two-way sorts to determine whether price and earnings momentum subsume each other;
5. monitor aggregate predictors of momentum profitability such as lagged market state, dispersion, and conditional beta.

That is the operational reading of the review.

## Domain of applicability

- **Where it works well:** Readers who want the classic momentum literature organized around implementable portfolio constructions and theory tests rather than around isolated papers.
- **What is implementable:** J/K decile momentum, earnings-momentum portfolios based on SUE or forecast revisions, two-way sorts, and time-varying aggregate crash diagnostics.
- **Main limitation:** As a 2011 review, it predates later work on factor momentum, volatility-managed momentum, and hidden-state crash overlays.
- **Why the paper matters:** It is still one of the best high-level maps of how price momentum, earnings momentum, and time-varying aggregate momentum fit together.
