# Betting against Beta or Demand for Lottery?
**Authors:** Turan G. Bali, Stephen J. Brown, Scott Murray, Yi Tang
**Year:** 2015
**Journal/Venue:** Working paper

## Problem statement

The betting-against-beta anomaly says low-beta stocks earn abnormally high returns and high-beta stocks abnormally low returns. Frazzini-Pedersen explain this with leverage constraints. Bali, Brown, Murray, and Tang argue that a different force may be doing most of the work: demand for lottery-like stocks.

## Approach (short)

The paper measures lottery demand with

$$
MAX_{i,t},
$$

the average of the five highest daily returns for stock `i` in month `t`. It then asks whether the negative alpha of high-minus-low beta portfolios survives after controlling for `MAX`, whether the effect is stronger when lottery demand is concentrated in high-beta stocks, and whether a traded lottery-demand factor (`FMAX`) prices the anomaly.

## Approach (detailed)

### 1. Define the anomaly to be explained

Each month, stocks are sorted into beta deciles. The paper studies the zero-cost high-minus-low beta portfolio:

- long high-beta stocks,
- short low-beta stocks.

Relative to standard factor models, this portfolio has a negative alpha. That is the betting-against-beta puzzle the paper wants to reinterpret.

### 2. Measure lottery demand directly

Following earlier lottery-demand work, the main proxy is:

$$
MAX_{i,t} = \text{average of the five highest daily returns of stock } i \text{ in month } t.
$$

The economic idea is that investors with lottery preferences disproportionately demand stocks with occasional extreme positive payoffs. Such stocks are often high-beta names.

### 3. Use both portfolio sorts and Fama-MacBeth regressions

The empirical design is deliberately redundant:

- univariate beta sorts,
- bivariate sorts on beta and `MAX`,
- Fama-MacBeth regressions of future returns on beta, `MAX`, and controls.

This is important because the paper wants to show that the anomaly is not a fragile sorting artifact.

### 4. Neutralize beta portfolios with respect to lottery demand

The decisive test is:

1. sort on `MAX`,
2. within each `MAX` bucket sort on beta,
3. inspect the high-minus-low beta alpha.

Once the portfolio is neutralized to `MAX`, the abnormal returns to the high-minus-low beta strategy largely disappear. The paper repeats this result using independent bivariate sorts and orthogonalized variables such as `\beta^{\perp MAX}` and `MAX^{\perp \beta}`.

### 5. Build a lottery-demand factor

The paper then forms a traded factor `FMAX` designed to capture the return effect of lottery demand. The exact portfolio construction uses `MAX`-sorted stocks, and the horse race is:

- standard Fama-French-Carhart four-factor model,
- the same model augmented with Pastor-Stambaugh liquidity,
- those models plus `FMAX`.

When `FMAX` is added, the abnormal returns of the beta-sorted strategy and of the Frazzini-Pedersen `BAB` factor are largely explained.

### 6. Isolate the channel through time and by investor clientele

The paper does two additional identification exercises.

First, it studies months when the cross-sectional correlation between beta and lottery demand is especially high. The anomaly is strongest precisely when lottery-demand price pressure falls disproportionately on high-beta stocks.

Second, it sorts by institutional ownership. If the effect is lottery-driven, it should be concentrated where retail demand matters most. That is what the paper finds:

- strong among low-institutional-ownership stocks,
- weak or absent where institutional ownership is high.

### 7. Recover the CAPM relation after stripping out lottery demand

The last step is conceptual. Once lottery demand is removed, the slope of the security market line is no longer anomalously flat. After controlling for `MAX` or `FMAX`, the relation between beta and expected return is close to the market risk premium predicted by the CAPM.

So the paper's claim is not that beta does not matter. It is that the observed low-beta anomaly is a distortion layered on top of the underlying risk-return tradeoff.

## Domain of applicability

- **Where it works well:** Cross-sectional tests of the low-beta anomaly and research on behavioral demand effects.
- **What is implementable:** Beta sorts conditioned on `MAX`, `FMAX` factor construction, and interaction tests using institutional ownership.
- **Main limitation:** `MAX` is a proxy for lottery demand rather than a direct observation of investor utility.
- **Why the paper matters:** It offers a concrete alternative to the leverage-constraint view of betting against beta.
