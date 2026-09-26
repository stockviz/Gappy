# Risk-Return Analysis of Dynamic Investment Strategies
**Authors:** Benjamin Bruder, Nicolas Gaussel
**Year:** 2011
**Journal/Venue:** SSRN working paper / Lyxor Asset Management research note

## Problem statement

Many hedge-fund-style strategies are dynamic, nonlinear, and path-dependent. Comparing them with Sharpe ratios or ordinary factor regressions is therefore conceptually weak: a strategy that looks smooth may in fact be short convexity, while one that loses often may be harvesting valuable convexity. Bruder and Gaussel ask: **can a broad class of dynamic trading strategies be decomposed into a static payoff component plus a volatility-dependent implementation component, in a way that makes their economic character transparent?** They then apply that framework to directional, contrarian, and trend-following strategies.

## Approach (short)

The paper studies any self-financing strategy that holds $f(S_t)$ units of a single asset with price $S_t$. A direct application of Ito's lemma shows that terminal wealth equals a static "option profile" $F(S_T)-F(S_0)$, where $F' = f$, plus a "trading impact" term proportional to $-\frac12\int f'(S_t)S_t^2\sigma_t^2dt$. Convex profiles come with negative trading impact; concave profiles come with positive trading impact. The authors then show that a trend-following rule built from an exponential moving average (EMA) of returns generates a convex option profile in the *estimated trend* and a trading impact governed by the squared realized Sharpe ratio. This explains why trend followers lose often, win big, and have positive skewness.

## Approach (detailed)

### 1. General decomposition: option profile plus trading impact

The starting point is a frictionless diffusion
$$
\frac{dS_t}{S_t} = \mu_t\,dt + \sigma_t\,dW_t
$$
and a strategy that holds $f(S_t)$ units of the asset, so wealth evolves as
$$
dX_t = f(S_t)\,dS_t.
$$

Define
$$
F(S) = \int^S f(x)\,dx.
$$
Applying Ito's lemma to $F(S_t)$ yields the paper's master equation:
$$
X_T - X_0 = F(S_T)-F(S_0) - \frac12\int_0^T f'(S_t)S_t^2\sigma_t^2\,dt.
$$

The interpretation is immediate:

- $F(S_T)-F(S_0)$ is the strategy's **option profile**,
- $-\frac12\int f'(S_t)S_t^2\sigma_t^2dt$ is the **trading impact**.

This decomposition is robust: it does not require Black-Scholes specifically, only enough regularity for Ito's formula. It also explains the taxonomy of dynamic strategies:

- if $f'(S)>0$, the strategy buys more after rises and sells after falls, so trading impact is negative and the embedded payoff is convex;
- if $f'(S)<0$, the strategy trades against moves, so trading impact is positive and the embedded payoff is concave.

That is the structural distinction between trend following and contrarian trading.

### 2. Why this matters economically

The sign of trading impact determines the distributional shape of returns.

- Concave strategies have many small gains and rare large losses.
- Convex strategies have many small losses and rare large gains.

So a smooth realized return path is not automatically attractive. In this framework, it may simply mean the manager is harvesting positive trading impact by selling convexity. The paper makes this point explicitly with stop-loss overlays, profit-taking overlays, and averaging-down strategies.

### 3. Stop-losses are not free insurance

The stop-loss example is important because it already shows how naive intuition fails. A rule that exits when price falls below a barrier seems cheaper than buying a put. But the decomposition shows the stop-loss has a put-like option profile plus a negative trading-impact term generated near the barrier. In a risk-neutral world, the average trading impact equals the price of the put. The economic lesson is: **dynamic protection is not free; it just pays in realized gamma costs rather than upfront premium.**

### 4. Toy model of trend following

Before introducing the continuous-time model, the paper studies a binomial toy strategy: start long after an initial uptrend and exit after the first negative return. The distribution is already revealing:

- loss probability is high,
- gains are rarer,
- upside is much larger than downside.

This is the discrete analogue of a convex payoff with negative trading impact. The point of the toy model is not realism; it is to make the asymmetry visible before the full derivation.

### 5. Trend estimation via EMA and Markowitz sizing

The trend-following model uses an exponentially weighted moving average of past returns:
$$
\hat\mu_t = \frac{1}{\tau}\sum_{i=0}^n e^{-i\delta t/\tau}\frac{S_{t-i\delta t}-S_{t-(i+1)\delta t}}{S_{t-(i+1)\delta t}},
$$
which in continuous time becomes
$$
d\hat\mu_t = -\frac{1}{\tau}\hat\mu_t\,dt + \frac{1}{\tau}\frac{dS_t}{S_t}.
$$

The investor treats $\hat\mu_t$ as the best estimate of drift and applies a Markowitz-Merton rule:
$$
e_t = m\frac{\hat\mu_t}{\sigma^2},
$$
where $e_t$ is exposure to the risky asset and $m$ is a risk-tolerance parameter.

This rule is implementable:

1. estimate trend with an EMA,
2. scale exposure linearly with the estimate,
3. divide by variance to control risk.

### 6. Exact decomposition of trend-following P&L

Substituting the trend dynamics into the wealth equation gives the paper's key result:
$$
\ln\frac{X_T}{X_0}
=
m\left[
\frac{\tau}{2\sigma^2}\left(\hat\mu_T^2-\hat\mu_0^2\right)

+\int_0^T
\left(
\frac{\hat\mu_t^2}{\sigma^2}\left(1-\frac{m}{2}\right)
-\frac{1}{2\tau}
\right)dt
\right].
$$

This has exactly the promised decomposition.

**Option profile**
$$
\frac{m\tau}{2\sigma^2}\left(\hat\mu_T^2-\hat\mu_0^2\right).
$$

This is convex in the estimated trend. It is symmetric in the sign of the trend because a long/short trend strategy likes *magnitude* of trend, not direction.

**Trading impact**
$$
m\int_0^T
\left(
\frac{\hat\mu_t^2}{\sigma^2}\left(1-\frac{m}{2}\right)
-\frac{1}{2\tau}
\right)dt.
$$

This is driven by the squared realized Sharpe ratio of the underlying at the strategy horizon.

### 7. Profitability threshold and bounded losses

The decomposition immediately gives a necessary condition for the long-run component to be positive:
$$
|\text{Sharpe}| > \frac{1}{\sqrt{2\tau}}.
$$

For a six-month EMA, the annualized Sharpe must exceed roughly 1 in absolute value. This explains why trend following is hard:

- in noisy, trendless markets, the strategy bleeds through trading impact;
- in sustained trends, the squared-trend term dominates and gains become large.

The worst case is also transparent. When measured trend collapses to zero, the long-run trading-impact loss is bounded. In the paper's calibration, the maximum annualized loss from this component is of order the strategy's target volatility. So the model produces bounded recurring pain and unbounded upside in strong trends.

### 8. Positive skewness and the "lose often, win big" pattern

Under a Gaussian model for the underlying, the estimated trend is approximately Gaussian, but the long-run P&L depends on its square. That makes the return distribution strongly asymmetric. The paper shows:

- probability of loss exceeds probability of gain in low-drift environments,
- average gain is much larger than average loss,
- skewness is positive.

This is the structural reason trend followers look bad in ordinary periods and excellent in crises or persistent directional markets.

## Domain of applicability

- **Where it works well:** The framework is excellent for classifying dynamic strategies by convexity. It explains, in one equation, why stop-losses, contrarian overlays, CPPI-like rules, and EMA trend followers have the return shapes they do.
- **What is implementable:** The trend-following rule is fully implementable from the summary: estimate an EMA trend, size exposure as $e_t \propto \hat\mu_t/\sigma^2$, and understand ex ante that performance comes from persistent realized Sharpe at the signal horizon.
- **Main limitations:** The model is single-asset, frictionless, and continuous-time. It assumes the relevant state variable is price alone and takes volatility as exogenous. Real managed futures programs are multi-asset, diversified, subject to costs, and usually cap leverage.
- **What the paper does not solve:** It does not prove that the chosen EMA horizon is optimal in practice, nor does it incorporate estimation error in volatility, transaction costs, or cross-asset interactions.
- **What is genuinely novel:** The exact decomposition of any price-based dynamic strategy into an option profile plus trading impact is the paper's central contribution. For trend following specifically, the payoff-in-trend derivation makes precise a claim that was often only described qualitatively: trend followers are long convexity, and they pay for it through realized whipsaw losses.
