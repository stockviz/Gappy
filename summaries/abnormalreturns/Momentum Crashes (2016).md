# Momentum Crashes
**Authors:** Kent Daniel, Tobias J. Moskowitz
**Year:** 2016
**Journal/Venue:** Journal of Financial Economics

## Problem statement

Momentum is one of the strongest return premia in finance, yet it occasionally experiences spectacular crashes. Those crashes are big enough that any serious user of the strategy needs to know:

- when they happen,
- why they happen,
- and whether they can be forecast.

This paper asks exactly that: **what causes momentum crashes, and can the strategy be dynamically managed using conditional information about those crash states?**

## Approach (short)

The paper studies standard winner-minus-loser momentum across equities and other asset classes and shows that crashes occur in **panic states**:

- after large market declines,
- when market volatility is high,
- and when the market rebounds sharply.

The short side, especially the loser portfolio, drives these crashes because its beta rises dramatically in those states and behaves like a written call option on the market. Using conditional forecasts of momentum's mean and variance, the authors build a dynamic strategy that more than doubles the Sharpe ratio of the static strategy and materially increases alpha.

## Approach (detailed)

### 1. Define the baseline portfolio and the crash episodes

The benchmark is the standard `12-2` equity momentum strategy:

1. rank stocks on returns from `t-12` through `t-2`;
2. form deciles;
3. go long the top decile and short the bottom decile.

The paper then studies the worst realized episodes, especially 1932 and 2009, not as anecdotes but as states from which the mechanism can be inferred.

### 2. Show that the loser leg is the real source of crash risk

The defining empirical fact is that the crash is driven by the **short loser portfolio**. After severe market declines:

- the loser decile is populated by financially distressed, high-beta firms;
- the winner decile contains relatively defensive names;
- a sharp market rebound causes the loser decile to rally far more than the winner decile.

This is why momentum crashes are not symmetric drawdowns. They are short-book explosions.

### 3. Estimate time-varying betas from daily data

The paper estimates rolling market exposure using daily regressions over 126 trading days with ten daily lags of the market return. This gives ex ante measures of conditional beta for winners and losers separately.

The results are striking:

- loser betas can rise above 3 and even 4 or 5 after deep drawdowns;
- winner betas remain far lower;
- the spread in beta is largest exactly when momentum subsequently crashes.

So the strategy's market neutrality is an illusion of unconditional averaging.

### 4. Identify the option-like exposure directly

The paper then estimates asymmetric up-market and down-market betas using Henriksson-Merton style specifications. In bear or panic states, the up-market beta of the momentum portfolio becomes far more negative than its down-market beta. This asymmetry is driven by the losers.

That is the empirical signature of a portfolio that is effectively **short a call option on the market**: it does not gain much when the market falls further, but it loses heavily when the market rebounds.

### 5. Define panic states with observable conditioning variables

Crash-prone states are summarized by variables that measure:

- cumulative recent market decline,
- high conditional market volatility,
- and rebound conditions after a bear market.

These variables forecast not only higher crash risk, but also lower conditional expected momentum returns. That is a crucial distinction. Panic states are not just high-volatility states; they are low-expected-return, high-left-tail states for momentum.

### 6. Show why ex post hedging is not a valid solution

The paper reexamines beta hedging and shows that hedging with **future realized beta** makes hedging look far better than it really is. The reason is that realized beta is positively correlated with the realized market rebound in crash states. So ex post hedges benefit from information unavailable at the time of trading.

This is an important methodological warning. The paper rules out a common but misleading response to momentum crashes.

### 7. Derive the dynamic strategy from conditional mean and variance forecasts

The dynamic strategy comes from maximizing unconditional Sharpe ratio. If `\mu_t` and `\sigma_t^2` are the conditional mean and variance of momentum, then the optimal exposure is proportional to the conditional Sharpe ratio:

$$
w_t \propto \frac{\mu_t}{\sigma_t^2}.
$$

This is richer than simple volatility targeting. A constant-volatility strategy only reacts to `\sigma_t`; the Daniel-Moskowitz strategy also reacts to time variation in expected return.

Empirically:

- `\mu_t` is forecast using the panic-state variables,
- `\sigma_t^2` is forecast with a GJR-GARCH type specification.

### 8. Compare static, constant-volatility, and fully dynamic momentum

The paper then compares three implementations:

- static momentum,
- constant-volatility scaled momentum,
- fully dynamic momentum using conditional mean and variance.

The fully dynamic strategy wins. Its Sharpe ratio and alpha are materially higher than both alternatives, and the gain comes from more than just smoothing volatility: it comes from explicitly reducing exposure when expected payoff is poor and the portfolio is short convexity.

### 9. Extend the crash logic across markets and asset classes

The paper repeats the analysis in multiple equity markets and several asset classes. The same qualitative pattern appears:

- crashes are state dependent,
- they are tied to the loser or short leg,
- and dynamic timing improves performance broadly.

That breadth is important because it suggests the mechanism is not a one-sample curiosity of U.S. equities.

### 10. What a reader should implement

A faithful implementation is:

1. run a standard momentum book;
2. estimate conditional expected return from panic-state variables;
3. estimate conditional variance separately;
4. scale the momentum exposure by the conditional Sharpe ratio rather than by inverse volatility alone;
5. monitor the short loser leg explicitly, since that is where the crash risk lives;
6. do not rely on ex post hedging studies as evidence that live hedging is easy.

The paper's practical lesson is that momentum should be run as a **state-dependent short-convexity trade**, not as a fixed factor exposure.

## Domain of applicability

- **Where it works well:** Cross-sectional momentum strategies whose short books become distressed after deep market drawdowns.
- **What is implementable:** Dynamic weighting of momentum based on panic-state indicators and conditional moment forecasts.
- **Main limitation:** The deeper source of the option-like behavior is clearest in equities and more reduced-form in some other asset classes.
- **Why the paper matters:** It is the central paper on why momentum crashes, when they happen, and how to mitigate them without abandoning the premium.
