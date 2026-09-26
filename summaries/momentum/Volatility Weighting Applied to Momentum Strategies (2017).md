# Volatility Weighting Applied to Momentum Strategies
**Authors:** Johan du Plessis, Winfried G. Hallerbach
**Year:** 2017
**Journal/Venue:** Journal of Alternative Investments

## Problem statement

Many momentum papers show that volatility scaling improves Sharpe ratios, but they often treat the improvement as an empirical fact. This paper asks: **when should volatility weighting improve a momentum strategy on theoretical grounds, which kind of weighting matters, and does the effect work for both time-series and cross-sectional momentum?**

The paper is therefore about risk management as a redesign of the signal and of the position-sizing rule.

## Approach (short)

The authors study two main forms of volatility weighting:

- weighting the **entire strategy** by its own predicted volatility;
- weighting the **underlying assets** by their own volatilities, which is equivalent to using normalized returns.

They derive simple Sharpe-ratio conditions for both approaches and then test them on 49 U.S. industry portfolios from July 1969 to December 2012 using:

- a signed time-series momentum strategy;
- a quantile cross-sectional momentum strategy;
- and, for the cross-sectional case, a new **dispersion weighting** that treats cross-sectional return dispersion like volatility.

## Approach (detailed)

### 1. Define momentum in directional rather than rank-only terms

The paper begins with a generic **signed** momentum rule. For a time-series strategy, let the trading sign be `S_t = sign(r_{t-1})` or, more generally, the sign of the formation-period return. The realized strategy return is

$$
r_t^T = S_t r_t.
$$

For the cross-sectional analogue, replace the asset's own lagged return with the deviation of its lagged return from the contemporaneous cross-sectional mean.

This unifies time-series and cross-sectional momentum as forecasting rules about the sign of future returns or relative returns.

### 2. Derive expected return and variance from success and failure probabilities

Let:

- `p` = probability the sign prediction is correct;
- `q` = probability the sign prediction is incorrect.

Then the signed strategy has

$$
E[r_t^T] = (p-q)E[r_t],
$$

and

$$
\operatorname{Var}(r_t^T)
=
(p+q)\operatorname{Var}(r_t)
+
\big(p+q-(p-q)^2\big)\big(E[r_t]\big)^2.
$$

This is the paper's first methodological contribution. It isolates exactly how sign accuracy enters the payoff distribution of a momentum rule.

### 3. Model strategy returns as a function of conditional volatility

For own-volatility weighting, the paper assumes the strategy return process

$$
r_t = \alpha + \gamma \sigma_t + \varepsilon_t \sigma_t,
$$

where:

- `\sigma_t` is predictable conditional volatility,
- `\alpha` is the component of expected return unrelated to volatility,
- `\gamma \sigma_t` is the component of expected return that covaries with volatility,
- `\varepsilon_t` has conditional mean zero and unit variance.

This is the central reduced form. The sign of `\gamma` tells us whether higher volatility is associated with lower or higher expected returns.

### 4. Weight the whole strategy by its own volatility

The volatility-weighted strategy is

$$
r_t^*=\frac{r_t}{\sigma_t}=\frac{\alpha}{\sigma_t}+\gamma+\varepsilon_t.
$$

The point is not just lower variance. Dividing by `\sigma_t` changes both numerator and denominator of the Sharpe ratio. The paper derives closed-form Sharpe expressions for `r_t` and `r_t^*` and then characterizes when weighting helps.

There are two distinct channels:

- **volatility stabilizing**: reducing variation in realized variance mechanically improves the aggregate volatility of the strategy;
- **volatility timing**: if expected return is negatively related to volatility (`\gamma < 0`), the weighted strategy also raises the numerator of the Sharpe ratio.

The paper derives parameter restrictions, summarized through a threshold `\Lambda`, under which the weighted strategy's Sharpe ratio exceeds the unweighted strategy's Sharpe ratio.

### 5. Weight individual assets instead of the whole strategy

The second weighting scheme normalizes each asset return by its own volatility before feeding it into the momentum signal. For time-series momentum this means:

- form the signal on `r_t / \sigma_t` rather than on raw `r_t`.

This changes the signal itself, not only the portfolio scale. The paper shows that if normalized returns preserve or improve the probability of a correct sign prediction, then the Sharpe ratio of the signed strategy can improve materially.

This is important because it distinguishes:

- risk management at the **portfolio** level,
- from signal denoising at the **asset** level.

### 6. Extend the idea to cross-sectional momentum through dispersion weighting

For cross-sectional momentum, the analog of volatility is the dispersion of returns around the cross-sectional mean. The paper therefore introduces **dispersion weighting**:

- compute deviations from the cross-sectional mean;
- treat the cross-sectional dispersion as a predictable scale parameter;
- normalize deviations by that dispersion.

So the cross-sectional signal becomes a bet on relative return after standardizing by cross-sectional volatility.

### 7. Implement the tests on U.S. industries

The empirical sample is the 49 Fama-French U.S. industry portfolios. The paper studies two formation windows:

- one month;
- 12 months.

All strategies hold for one month.

The implemented strategies are:

- **signed time-series strategy**: invest `1/N` in each industry, long if its formation return is positive and short if negative;
- **quantile cross-sectional strategy**: long the top quartile of industries by formation return and short the bottom quartile;
- equal-weighted industry market as a benchmark.

### 8. Estimate volatility in a way that can actually be used

Ex ante volatility is estimated from daily data using an EWMA with persistence parameter `0.9836`, scaled by 21 to obtain the monthly measure. That same forecasting machinery is used for:

- strategy-level volatility,
- asset-level volatility,
- and cross-sectional dispersion where needed.

The paper first checks whether strategy volatility is predictable with AR(1) regressions of realized volatility. It is.

### 9. Test whether return-volatility dependence has the right sign

Before claiming volatility weighting should help, the paper estimates regressions implied by the structural form

$$
\frac{r_t}{\sigma_t}=\gamma+\frac{\alpha}{\sigma_t}+\varepsilon_t.
$$

This lets the authors estimate the empirical sign and magnitude of `\gamma` and determine whether the sufficient conditions for Sharpe-ratio improvement are likely to hold in the data.

That is a key methodological step: the paper does not just say "weighting worked." It asks whether the strategy's return-volatility relation looked like the theory says it should.

### 10. Compare three distinct implementations

The empirical comparisons are:

- unweighted strategy,
- strategy weighted by its own volatility,
- strategy run on normalized returns,
- and, for the cross-sectional case, dispersion weighting.

Performance is evaluated with:

- mean return,
- standard deviation,
- skewness and kurtosis proxies,
- Sharpe ratio,
- and drawdown statistics.

### 11. Main implementation conclusions

The results show:

- weighting by own volatility usually improves Sharpe ratios and reduces kurtosis;
- using normalized returns also improves Sharpe ratios;
- dispersion weighting can improve cross-sectional momentum even when the direct return-volatility relation is not strongly negative, because the stabilizing channel alone can help.

The paper is especially clear that not every improvement is "timing." Some of it is simply the convexity benefit from stabilizing variance.

### 12. What a reader should implement

A faithful implementation is:

1. choose a signed TS or quantile XS momentum rule;
2. estimate ex ante volatility or dispersion with an EWMA from daily data;
3. either divide the whole strategy return by predicted strategy volatility, or normalize asset-level returns before signal construction;
4. evaluate whether the strategy's expected return comoves negatively or positively with volatility;
5. attribute any Sharpe-ratio gain separately to timing and smoothing.

That separation of channels is the paper's real methodological contribution.

## Domain of applicability

- **Where it works well:** Momentum strategies where volatility is predictable and where one wants to distinguish signal improvement from pure risk scaling.
- **What is implementable:** Strategy-level volatility targeting, asset-level normalized-return signals, and cross-sectional dispersion weighting.
- **Main limitation:** The empirical tests use industry portfolios, so the paper is best read as a clean laboratory for weighting design rather than as the final word on single-stock implementation.
- **Why the paper matters:** It gives a coherent theory for why volatility weighting can help momentum instead of treating the result as a black-box empirical trick.
