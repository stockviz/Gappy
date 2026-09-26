# Demystifying Momentum: Time-Series and Cross-Sectional Momentum, Volatility and Dispersion
**Authors:** Johan du Plessis
**Year:** 2013
**Journal/Venue:** MSc thesis, University of Amsterdam / Robeco

## Problem statement

Momentum is not one strategy but a family of strategies. The thesis asks four connected questions:

1. what is the exact difference between cross-sectional and time-series momentum,
2. where do the profits of each come from mathematically,
3. when does volatility weighting improve them,
4. how do both families relate to cross-sectional dispersion and market volatility?

The point is not only to compare backtests. The thesis tries to write the strategies in a common notation, decompose their expected returns, and then test those decompositions in and out of sample.

## Approach (short)

The thesis studies a taxonomy of momentum strategies on two datasets:

- 49 Fama-French industry portfolios, in sample July 1969 to June 1994 and out of sample July 1994 to December 2012;
- a multi-asset allocation dataset, in sample January 1979 to December 2002 and out of sample December 2002 to April 2013.

It defines explicit portfolio weights for quantile, signed, linear, and volatility-normalized versions of both cross-sectional and time-series momentum. The theoretical chapters show that cross-sectional and time-series momentum depend on different covariance structures. The empirical chapters then compare Sharpe ratios, long and short leg behavior, decomposition terms, local versus global trend, and the effect of volatility normalization and dispersion weighting.

## Approach (detailed)

### 1. Define a full strategy taxonomy instead of one canonical trade

The thesis starts by listing seven strategy types. Let `r_{i,t-j,t}` be asset `i`'s return over the formation window ending at time `t`, and let `\bar r_{t-j,t}` be the cross-sectional mean.

The strategies are:

- quantile cross-sectional (`qxs`),
- unscaled linear cross-sectional (`ulxs`),
- scaled linear cross-sectional (`slxs`),
- signed cross-sectional (`sxs`),
- signed time-series (`sts`),
- unscaled linear time-series (`ults`),
- scaled linear time-series (`slts`).

This taxonomy matters because the thesis wants a common language that includes the standard academic stock strategy, the Moskowitz-Ooi-Pedersen time-series trend rule, and linear variants that are easier to decompose analytically.

### 2. Write the implementable portfolio weights explicitly

For the key strategies, the thesis gives exact weights.

**Quantile cross-sectional momentum**

Rank assets on formation-period return, buy the top quantile, sell the bottom quantile. If each quantile contains `n_t` assets,

$$
w_{i,t}=\frac{1}{n_t}\mathbf 1\{\operatorname{rank}(r_{i,t-j,t})>N_t-n_t\}
-\frac{1}{n_t}\mathbf 1\{\operatorname{rank}(r_{i,t-j,t})\le n_t\}.
$$

**Unscaled linear cross-sectional momentum**

$$
w_{i,t}=\frac{1}{N_t}(r_{i,t-j,t}-\bar r_{t-j,t}).
$$

This is the Lewellen-style linear relative-strength rule.

**Scaled linear cross-sectional momentum**

$$
w_{i,t}=\frac{2}{N_t}(r_{i,t-j,t}-\bar r_{t-j,t})
\left[\sum_{k\in N_t}\lvert r_{k,t-j,t}-\bar r_{t-j,t}\rvert\right]^{-1},
$$

so each leg has unit gross exposure.

**Signed time-series momentum**

$$
w_{i,t}=\frac{\operatorname{sign}(r_{i,t-j,t})}{N_t}.
$$

**Unscaled linear time-series momentum**

$$
w_{i,t}=\frac{1}{N_t}r_{i,t-j,t}.
$$

**Scaled linear time-series momentum**

$$
w_{i,t}=\frac{1}{N_t}r_{i,t-j,t}
\left[\sum_{k\in N_t}\lvert r_{k,t-j,t}\rvert\right]^{-1}.
$$

These formulas are one of the thesis's most useful contributions because they make the strategy family precise and directly comparable.

### 3. Distinguish local and global time-series momentum

The thesis also separates:

- **local** time-series momentum: each asset trades on its own past return sign or magnitude;
- **global** time-series momentum: all assets trade on the same market-level trend signal.

That distinction matters because global time-series momentum can mechanically overlap with the cross-sectional component of returns, whereas local time-series momentum is closer to a pure own-autocorrelation trade.

### 4. Decompose where the profits come from

The theoretical core of the thesis is the decomposition of expected returns for the linear strategies.

The main message is:

- **time-series momentum** loads mainly on each asset's own serial dependence and mean return,
- **cross-sectional momentum** depends on own autocovariances, cross-serial covariances across assets, and cross-sectional dispersion in expected returns.

This is why the two families can behave very differently even in the same universe. A market can have strong own continuation but little relative-strength structure, or vice versa.

The thesis repeatedly uses these decomposition terms in later tables, so the empirical sections are not just backtests; they are tests of the analytical source of profits.

### 5. Study volatility weighting in two different ways

The thesis is careful about what "volatility weighting" means. It distinguishes:

1. scaling the whole strategy by its own ex ante volatility;
2. scaling each underlying asset by its own ex ante volatility, which the thesis calls using **normalised returns**.

The second form is especially important. Under normalised returns, both the ranking signal and the portfolio weights are based on returns divided by ex ante volatility. That changes not only position size but also which assets enter the long and short books.

For the empirical work, ex ante volatilities are estimated with EWMA procedures:

- for industry data, daily volatility with an EWMA parameter around `lambda = 0.9836` and an effective history around 61 days;
- for the multi-asset dataset, weekly volatility with an EWMA parameter around `lambda = 0.97`, roughly `33 1/3` weeks effective history.

Initial estimates use the first 21 trading days for the industry sample and the first 52 weeks for the multi-asset sample.

### 6. Ask why volatility weighting should work, not only whether it works

The theoretical chapters argue that volatility weighting can improve Sharpe ratio when expected returns do not rise proportionally with volatility and when volatility timing matters. The thesis also studies the effect on skewness and kurtosis, not just mean and variance.

Empirically, the thesis finds that volatility normalization often:

- improves Sharpe ratios,
- reduces the variability of volatility,
- improves profit-to-loss ratios,
- and often reduces the negative impact of volatility spikes on momentum.

This is especially relevant because the thesis does not treat volatility weighting as a free lunch. It tests whether the gains come from better risk budgeting, volatility timing, or a change in signal composition.

### 7. Use two complementary datasets and explicit in-sample / holdout splits

The industry sample and the multi-asset sample serve different roles.

**49 industry portfolios**

- monthly frequency,
- in sample from July 1969 to June 1994,
- holdout from July 1994 to December 2012.

**Multi-asset allocation dataset**

- weekly frequency,
- in sample from January 1979 to December 2002,
- holdout from December 2002 to April 2013.

This design matters because the thesis is not just interested in historical explanation. It wants to know which transformations survive outside the calibration window.

### 8. Analyze long and short legs, prediction accuracy, and scenario structure

The empirical chapters do more than compare total strategy returns. They break strategies into:

- long and short leg returns,
- prediction accuracy,
- profits conditional on signals agreeing or opposing each other,
- local versus global trend exposures.

That matters because many apparent improvements in momentum come from avoiding one bad side of the book rather than from making both sides better.

### 9. Bring dispersion into the picture

A separate block of the thesis studies cross-sectional dispersion. Intuitively, cross-sectional momentum should like dispersion because it bets on relative spread. Yet the empirical relation is often weak or negative. The thesis studies this puzzle by examining:

- regressions of momentum returns on dispersion measures,
- AR(1) forecasts of dispersion,
- strategies weighted by actual or forecast dispersion,
- the relation between dispersion and market volatility.

The key conclusion is that the *level* of dispersion is not the whole story. A large part of the strange empirical relation between cross-sectional momentum and dispersion reflects the volatility component embedded in dispersion itself. Once returns are normalized by ex ante volatility, dispersion becomes less erratic and the link to momentum behaves more sensibly.

### 10. Compare unweighted and normalized-return implementations directly

A practical strength of the thesis is that it does not simply report better Sharpe ratios after normalization. It compares:

- portfolio composition,
- decomposition terms,
- long-short asymmetries,
- regression intercepts of weighted strategies on unweighted strategies,
- out-of-sample behavior.

That sequence lets the reader see whether normalization adds alpha or merely repackages the same strategy at lower risk.

### 11. What a reader should implement

The thesis is best used as a design manual. A faithful implementation would:

1. code the strategy weights explicitly for the cross-sectional and time-series variants;
2. decide whether the objective is local trend, global trend, or relative strength;
3. estimate ex ante volatility with a clearly specified EWMA procedure;
4. test both raw-return and normalized-return versions;
5. decompose performance into own-autocovariance, cross-serial structure, and expected-return dispersion;
6. monitor dispersion and its volatility component separately;
7. verify the conclusions in a holdout sample.

This is a much richer methodological program than simply running one winner-minus-loser backtest.

## Domain of applicability

- **Where it works well:** Research or implementation programs comparing trend-following and relative-strength signals across industries or asset classes.
- **What is implementable:** The thesis gives explicit weight formulas, volatility-normalization rules, and a reusable framework for separating cross-sectional from time-series momentum.
- **Main limitation:** Because it is a broad synthesis thesis, it spreads attention across several adjacent questions rather than proving one narrow theorem.
- **Why the paper matters:** It turns momentum from a loosely defined anomaly into a family of precisely specified strategies with clear decomposition logic.
