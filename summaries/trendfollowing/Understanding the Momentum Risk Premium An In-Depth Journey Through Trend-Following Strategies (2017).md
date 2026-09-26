# Understanding the Momentum Risk Premium: An In-Depth Journey Through Trend-Following Strategies
**Authors:** Paul Jusselin, Edmond Lezmi, Hassan Malongo, Côme Masselin, Thierry Roncalli, Tung-Lam Dao
**Year:** 2017
**Journal/Venue:** SSRN working paper

## Problem statement

Momentum and trend-following are empirically successful across asset classes, but the literature is dominated by backtests. That is not enough for strategic allocation. Institutional allocators need to know what the momentum risk premium *is* mechanically, how its payoff differs from carry and value, how diversification works in a long/short setting, and why momentum both hedges crises and occasionally crashes. The paper asks: **can the single-asset trend-following framework of Bruder and Gaussel be extended to a multivariate setting rich enough to analyze diversification, signal estimation, skewness, and tail-risk management?**

## Approach (short)

The paper models asset returns as a multivariate geometric Brownian motion with a hidden stochastic trend. The optimal trend estimate is an exponentially weighted moving average (EWMA), or in the multivariate case a matrix-valued EWMA. Exposures are proportional to the estimated trend. This yields an exact decomposition of momentum P&L into an option profile and a trading impact. In the single-asset case, the trading-impact term is a transformed noncentral chi-square variable, which explains the positive skewness and the "lose often, win big" character of momentum. In the multivariate case, the trading impact becomes a Gaussian quadratic form. This lets the authors show that time-series momentum is best diversified by *near-zero* correlation, not strongly negative correlation as in long-only portfolios. The rest of the paper connects the model to empirical stylized facts, trend-frequency choice, leverage, and tail-risk management.

## Approach (detailed)

### 1. Hidden trend model and optimal trend estimate

For one asset, the model is
$$
\frac{dS_t}{S_t} = \mu_t\,dt + \sigma\,dW_t,
$$
where $\mu_t$ is an unobserved stochastic trend. Writing $dy_t = dS_t/S_t$, the optimal filter for the trend is
$$
\hat\mu_t
=
\lambda\int_0^t e^{-\lambda(t-u)}\,dy_u + e^{-\lambda t}\hat\mu_0.
$$

So the Kalman filter is exactly an EWMA. The parameter $\lambda$ is the inverse of the effective moving-average duration $\tau$:
$$
\lambda = 1/\tau.
$$

This is already one of the paper's useful implementation messages: the usual practitioner moving average is not arbitrary in the model. It is the optimal filter for a hidden stochastic trend.

### 2. Momentum exposure and exact P&L decomposition

The strategy takes exposure proportional to the estimated trend:
$$
e_t = \alpha \hat\mu_t.
$$
Equivalently, one can write a normalized exposure
$$
e_t = \ell \sqrt{\lambda}\,\hat\mu_t/\sigma^2
$$
to stabilize risk across choices of $\lambda$.

The exact log-P&L over $[0,T]$ is
$$
\ln\frac{V_T}{V_0}
=
\frac{\alpha}{2\lambda}\left(\hat\mu_T^2-\hat\mu_0^2\right)

+ \alpha\sigma^2 \int_0^T
\left[
\frac{\hat\mu_t^2}{\sigma^2}\left(1-\frac{\alpha\sigma^2}{2}\right)
-\frac{\lambda}{2}
\right]dt.
$$

This is the direct analogue of Bruder-Gaussel:

- the first term is the **option profile**,
- the integral is the **trading impact**.

The option profile depends on the square of the estimated trend, not its sign. So a momentum strategy is long trend magnitude. That is why long/short momentum is symmetric with respect to uptrends and downtrends.

### 3. Why momentum has positive skewness

The trading-impact component $g_t$ is shown to be a linear transform of a noncentral chi-square variable. That result is the statistical heart of the paper.

It implies:

- the hit ratio can easily be below 50%,
- the expected gain can still exceed the expected loss,
- skewness is positive,
- kurtosis is high.

In the paper's calibration, if the underlying Sharpe ratio is low, momentum loses more often than it wins. But gains are much larger when they arrive. This formalizes the Potters-Bouchaud intuition in a parametric setting.

The profitability condition also becomes transparent. The expected trading impact depends on
$$
s_t^2 + \lambda/2,
$$
where $s_t$ is the asset's realized Sharpe ratio at the strategy horizon. Momentum likes high *absolute* Sharpe, not merely positive Sharpe, because strong downtrends are just as profitable as strong uptrends.

### 4. Option profile is only second-order; trading impact does most of the work

One subtle result of the paper is that the option profile is not the main driver of long-run performance. It matters for convexity and bounded-loss arguments, but the long-run P&L mostly comes from the trading-impact term. In other words, momentum is not just a long straddle. Its economics are closer to:

- convex exposure to trend magnitude,
- financed or penalized through realized implementation costs.

This matters because it explains why leverage and realized volatility are so important. If volatility rises without a commensurate increase in trend strength, gamma costs dominate and performance deteriorates.

### 5. Multivariate extension

For $n$ assets, the model becomes
$$
\frac{dS_t}{S_t} = \mu_t\,dt + \sigma\,dW_t,
$$
with covariance matrix $\Sigma$ for returns and $\Gamma$ for trends. The momentum portfolio is
$$
\frac{dV_t}{V_t} = e_t^\top \frac{dS_t}{S_t},
\qquad
e_t = A\hat\mu_t,
$$
where $A$ is the allocation matrix.

The optimal filter is now matrix-valued:
$$
\hat\mu_t = \int_0^t e^{-(t-u)\Lambda}\Lambda\,dy_u + e^{-t\Lambda}\hat\mu_0,
\qquad
\Lambda = \Upsilon_\infty \Sigma^{-1}.
$$

The log-P&L decomposition becomes
$$
\ln\frac{V_T}{V_0}
=
\frac12\hat\mu_T^\top A^\top \Lambda^{-1}\hat\mu_T
- \frac12\hat\mu_0^\top A^\top \Lambda^{-1}\hat\mu_0

+\int_0^T
\left[
\hat\mu_t^\top A^\top \left(I-\frac12\Sigma A\right)\hat\mu_t
- \frac12\operatorname{tr}(A^\top\Sigma\Lambda)
\right]dt.
$$

This is exactly the multivariate analogue of option profile plus trading impact.

### 6. Diversification is different in long/short momentum

In a long-only portfolio, negative correlation is ideal. In time-series momentum, that intuition breaks.

The paper shows:

- if assets are uncorrelated, diversification reduces volatility, skewness, and kurtosis of the trading-impact term;
- if assets are perfectly positively or negatively correlated, the long/short structure often collapses them into the *same underlying trend bet*.

Hence the best diversification for momentum is often around **zero correlation**, not maximally negative correlation.

That is one of the paper's most important practical contributions. A time-series momentum allocator should not simply import long-only diversification heuristics.

### 7. Trend frequency is tied to the signal-to-noise ratio

Because $\lambda = \sigma/\gamma$ in the underlying model, the optimal moving-average speed depends on the ratio of asset volatility to trend volatility.

- If short-term noise dominates, use a longer average.
- If the trend changes rapidly relative to noise, use a shorter average.

The empirical conclusion is also reassuring: misspecifying the moving-average horizon moderately is not disastrous. A 3-month instead of 4-month, or 6-month instead of 4-month filter, produces only modest losses in efficiency. What matters much more is avoiding gross mismatch between the signal horizon and the actual trend duration.

### 8. Tail risk, leverage, and the 2008 example

The paper treats two risks as central.

1. **Trend reversal risk.** Momentum crashes when previously strong trends reverse abruptly.
2. **Leverage risk.** If scaling is too aggressive, gamma costs can overwhelm the strategy even when the directional idea is right.

The paper explicitly links this to Daniel-Moskowitz-style momentum crashes and to CPPI-type leverage pathologies. The strategy's ruin probability is still lower than for value/carry, but it is not negligible if the leverage multiplier is chosen poorly.

The 2008 example is used to make the point that momentum performance is not "just short equities". The strategy benefited at least as much from long fixed-income trends with contained volatility as from equity shorts. The correct state variable is realized Sharpe at the strategy horizon, not raw direction.

### 9. Portfolio-construction implications

The paper repeatedly contrasts momentum with carry and value.

- Carry and value are largely concave, negative-skew premia.
- Momentum is convex and positive-skew.

Therefore, a strategic allocator should think in payoff space, not only in correlation space. Mixing convex momentum with concave premia is the right way to manage skewness at the portfolio level.

## Domain of applicability

- **Where it works well:** The paper is strongest as a structural model of time-series momentum. It explains shape, signal estimation, diversification, and the role of leverage in a unified framework.
- **What is implementable:** An implementable version is straightforward: estimate trends with EWMA or matrix EWMA, size exposures linearly with estimated trend, prefer assets with high absolute realized Sharpe at the relevant horizon, and diversify across largely independent trends.
- **Main limitations:** The model is continuous-time Gaussian and uses hidden linear trends. That makes the mathematics tractable but understates jumps, market-impact effects, and regime changes. Cross-sectional momentum crashes and crowding are only partially captured.
- **What the paper does not claim:** It does not claim momentum is always a free hedge. It explicitly says volatility increases without corresponding trend strength can hurt because the strategy is effectively short the short-horizon variance needed to maintain the position.
- **What is genuinely novel:** The multivariate extension is the main contribution. In particular, the Gaussian-quadratic-form characterization of multi-asset P&L and the conclusion that zero correlation is often the best diversification point for time-series momentum are genuinely useful results that do not fall out of standard long-only portfolio theory.
