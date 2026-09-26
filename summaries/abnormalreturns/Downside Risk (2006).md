# Downside Risk
**Authors:** Andrew Ang, Joseph Chen, Yuhang Xing
**Year:** 2006
**Journal/Venue:** Review of Financial Studies

## Problem statement

The CAPM compresses all market covariance into one beta. This paper argues that this is the wrong object if investors care much more about bad market states than good ones. The question is: **is there a priced cross-sectional exposure to market downside states, distinct from ordinary beta, coskewness, upside exposure, volatility, liquidity, and standard characteristics?**

That matters for momentum because momentum crashes are state-contingent: a strategy can look innocuous in unconditional beta and still be very dangerous when the market is already weak.

## Approach (short)

The paper does two things. First, it derives a pricing role for downside beta from Gul's disappointment-aversion preferences. Second, it estimates downside and upside betas from stock returns and asks whether they explain the cross section. The central measure is

$$
\beta_i^-=\frac{\operatorname{cov}(r_i,r_m\mid r_m<\mu_m)}{\operatorname{var}(r_m\mid r_m<\mu_m)},
$$

with the incremental bad-state exposure isolated by relative downside beta, `\beta_i^- - \beta_i`. Empirically, the authors use 12-month horizons, equal-weighted quintile sorts, Fama-MacBeth regressions, and a separate predictive exercise based on lagged downside beta. The main result is that downside beta earns a sizeable premium, about 6 percent per year in the cross section, and that the premium survives standard controls.

## Approach (detailed)

### 1. Start from preferences that care asymmetrically about losses

The theoretical section uses Gul's disappointment-aversion utility. End-of-period certainty-equivalent utility is written as

$$
U(\hat W)=\frac{1}{K}\int_{-\infty}^{\hat W}U(W)\,dF(W)+\frac{A}{K}\int_{\hat W}^{\infty}U(W)\,dF(W),
$$

where `0 < A <= 1` scales how much good outcomes are down-weighted relative to disappointing ones and

$$
K=\Pr(W\le \hat W)+A\Pr(W>\hat W).
$$

If `A = 1`, the model collapses back toward ordinary CRRA preferences. If `A < 1`, the investor penalizes bad realizations more heavily than good ones. That preference twist is what creates a role for downside covariance rather than just unconditional covariance.

The equilibrium is solved in a simple multi-state, multi-asset setting. The point of the calibration is not to match the entire stock market; it is to show that once utility is asymmetric across states, standard beta is no longer a sufficient statistic for expected return.

### 2. Define the risk objects explicitly

The paper distinguishes five related objects:

- ordinary market beta,
- downside beta,
- upside beta,
- relative downside beta,
- relative upside beta.

The ordinary beta is the familiar

$$
\beta_i=\frac{\operatorname{cov}(r_i,r_m)}{\operatorname{var}(r_m)}.
$$

The downside beta is

$$
\beta_i^-=\frac{\operatorname{cov}(r_i,r_m\mid r_m<\mu_m)}{\operatorname{var}(r_m\mid r_m<\mu_m)},
$$

where `\mu_m` is the average market excess return. The upside analog replaces the conditioning event with `r_m > \mu_m`.

The key incremental object is not `\beta^-` alone but

$$
\beta_i^- - \beta_i,
$$

which measures bad-state covariance above and beyond what is already captured by unconditional beta. This is the measure that most directly answers the economic question: if two stocks have the same CAPM beta, does the one that loads more in bad states command a higher expected return?

The paper also keeps coskewness in view:

$$
\text{coskew}_i=
\frac{E[(r_i-\mu_i)(r_m-\mu_m)^2]}
{\sqrt{\operatorname{var}(r_i)}\operatorname{var}(r_m)},
$$

because a natural objection is that downside beta is only a crude proxy for third-moment risk. A large part of the empirical design is built to show that this objection is false.

### 3. Translate the theory into measurable stock characteristics

The empirical work uses CRSP and Compustat-style stock data from July 1963 through December 2001. Risk measures are estimated over 12-month windows, using daily returns inside those windows to estimate:

- `\beta`,
- `\beta^-`,
- `\beta^+`,
- relative downside beta,
- relative upside beta,
- volatility,
- coskewness,
- cokurtosis,
- liquidity beta.

The choice of a 12-month horizon is deliberate. It gives enough daily observations to estimate conditional covariance objects while still letting the paper compare expected return variation across stocks over a medium horizon rather than only in one-month noise.

### 4. Run two different exercises: contemporaneous pricing and ex ante prediction

The paper separates two questions:

1. **Contemporaneous pricing:** do stocks with higher realized downside exposure over a 12-month window earn higher average returns over that same window?
2. **Predictive pricing:** does past downside beta forecast future returns because past downside beta forecasts future downside exposure?

The first exercise is about whether downside beta is a priced state variable at all. The second asks whether the measure is stable enough to be usable.

### 5. Portfolio sorts make the pricing relation visible

The authors form equal-weighted quintile portfolios sorted on realized risk characteristics. For the contemporaneous tests:

1. compute each stock's realized downside beta over the relevant 12-month interval;
2. sort stocks into quintiles from low to high `\beta^-`;
3. compute the average 12-month excess return in each quintile;
4. examine the `Q5 - Q1` spread.

They repeat this for `\beta`, `\beta^-`, `\beta^+`, relative downside beta, relative upside beta, and combinations that control one characteristic for another.

The core pattern is strong:

- high downside-beta stocks earn substantially higher average returns than low downside-beta stocks;
- sorting on unconditional beta is much weaker;
- sorting on relative downside beta preserves the pattern, so the effect is not just ordinary beta in disguise.

### 6. Fama-MacBeth regressions test whether the premium survives controls

The main cross-sectional regressions are Fama-MacBeth regressions of 12-month excess returns on realized characteristics measured over the same 12-month horizon. Because the regressions are run monthly with overlapping 12-month holding periods, the reported standard errors use 12 Newey-West lags.

The specification layers in controls progressively:

- market beta,
- downside beta and upside beta,
- size and book-to-market,
- past 12-month return,
- realized volatility,
- coskewness,
- cokurtosis,
- Pastor-Stambaugh liquidity beta.

This matters because a downside-beta premium is only interesting if it remains after horse races against the obvious competitors. The paper shows exactly that:

- downside beta enters positively and significantly;
- upside beta is negative or much weaker;
- the downside-beta coefficient remains economically meaningful after coskewness and liquidity controls.

The coefficient magnitudes imply a reward to downside beta of roughly 6 percent per year.

### 7. Separate downside beta from coskewness rather than assuming one subsumes the other

To make the distinction operational, the paper does double sorts. For example:

1. sort stocks into coskewness quintiles;
2. inside each coskewness quintile, sort again on downside beta;
3. average the second-sort portfolios across the first-sort buckets.

That produces downside-beta portfolios with near-identical coskewness exposure. The return spread across the downside-beta buckets remains large. The reverse exercise, sorting on coskewness inside downside-beta buckets, is much weaker. So downside beta is not just a relabeled coskewness effect.

### 8. The predictive exercise asks whether lagged downside beta is implementable

The paper then shifts from realized `\beta^-` to **past** `\beta^-`. Here the procedure is:

1. estimate downside beta from daily returns over the previous 12 months;
2. sort stocks monthly on that lagged measure;
3. examine next-period returns and future downside-beta realizations.

The predictive relation is weaker than the contemporaneous relation but still strong across most of the cross section. The main failure case is the extreme-volatility segment. For the most volatile names, past downside beta is noisy and does not map cleanly into future downside exposure.

The authors handle this explicitly by first sorting on volatility, excluding the highest-volatility bucket, and then sorting the remainder on past downside beta. Outside that top-volatility tail, lagged downside beta predicts both future downside beta and future returns much better.

### 9. What the paper actually establishes

Methodologically, the paper does not just say "bad times matter." It shows how to make that idea operational:

1. write down a preference structure where downside states have extra marginal utility consequences;
2. define conditional covariance objects that correspond to those states;
3. estimate them on stock-level data;
4. test them against ordinary beta, coskewness, liquidity, and characteristics;
5. check whether the lagged measure forecasts future exposure well enough to be useful.

That sequence is what makes the paper implementable rather than merely intuitive.

## Domain of applicability

- **Where it works well:** Cross-sectional equity pricing, risk diagnostics for state-dependent strategies, and any setting where left-tail market covariance is more relevant than unconditional beta.
- **What is implementable:** Estimate downside beta and relative downside beta on rolling windows, sort or regress future returns on those measures, and explicitly exclude the most volatile names if the goal is prediction rather than description.
- **Main limitation:** Conditional beta estimates are noisy, especially in extreme-volatility stocks, so the predictive version works better after removing the noisiest tail.
- **Why the paper matters:** It gives a clean recipe for measuring bad-state covariance directly instead of pretending unconditional beta is enough.
