# Momentum and Post-Earnings-Announcement Drift Anomalies: The Role of Liquidity Risk
**Authors:** Ronnie Sadka
**Year:** 2006
**Journal/Venue:** Journal of Financial Economics

## Problem statement

Momentum and post-earnings-announcement drift are short-lived, high-turnover anomalies, so liquidity is an obvious candidate explanation. But "liquidity" is not one object. Sadka asks: **which component of liquidity risk, if any, actually prices momentum and PEAD portfolios?**

The paper's key move is to decompose price impact into informational and noninformational components before constructing market-wide liquidity factors.

## Approach (short)

The paper estimates stock-level price impact using the Glosten-Harris trade-impact model and decomposes it into:

- fixed/transitory components,
- variable/permanent components.

It then constructs market-wide liquidity innovations from cross-sectional averages of these components and asks which one explains expected returns on 25 momentum portfolios and 25 standardized-unexpected-earnings portfolios. The answer is the **variable permanent** component of price impact, which proxies for the informational part of liquidity risk.

## Approach (detailed)

### 1. Decompose price impact at the stock level

The starting point is the Glosten-Harris framework:

$$
\Delta p_t = a + C D_t + \lambda D_t V_t + \bar C D_t + \bar\lambda D_t V_t + y_t,
$$

with buyer/seller indicators and trade size entering so that price impact can be decomposed into:

- fixed versus variable components,
- permanent versus transitory components.

The paper's interpretation is:

- **variable permanent** price impact is the informational component,
- **fixed transitory** price impact is more noninformational or inventory-like.

### 2. Estimate the components monthly across stocks

Using intraday NYSE data, the paper estimates these price-impact components stock by stock and month by month. The price impacts are scaled by beginning-of-month price, and aggregate market measures are formed as **equal-weighted cross-sectional averages**.

This produces market-wide series for the different liquidity components.

### 3. Convert liquidity levels into liquidity-risk factors

Because predictable changes in macro variables should not command a premium, the paper uses **innovations**, not raw liquidity levels. Aggregate liquidity series are therefore fitted with time-series models:

- the fixed component is modeled as a random walk,
- the variable component is modeled with an ARIMA specification.

The residuals from these models are the liquidity factors:

- `LIQ(C)` for the fixed component,
- `LIQ(\lambda)` for the variable component.

The paper flips signs so that negative shocks correspond to worsening market liquidity.

### 4. Construct anomaly portfolios designed to be sensitive to liquidity

The test assets are two `5 x 5` sets of portfolios:

- 25 momentum portfolios,
- 25 PEAD portfolios.

The momentum portfolios are formed from past 12-month returns excluding the most recent month. Stocks are equally weighted and portfolios are rebalanced monthly.

The PEAD portfolios are formed from **standardized unexpected earnings**:

$$
SUE_{i,t}=\frac{E_{i,q}-E_{i,q-4}-c_{i,t}}{s_{i,t}},
$$

where the numerator compares the latest quarterly earnings to the same quarter a year earlier, adjusted for a drift term `c_{i,t}`, and the denominator is the historical standard deviation over the prior eight quarters.

These portfolios are natural test assets because both anomalies involve short-horizon continuation in settings where liquidity frictions could plausibly matter.

### 5. Estimate liquidity loadings and price the cross section

For each portfolio, the paper estimates loadings on:

- the market factor,
- Fama-French size and value factors,
- and the nontraded liquidity factors.

Then it runs cross-sectional pricing tests in the Fama-MacBeth spirit and also generalized method of moments tests to assess whether the liquidity factors earn premia.

### 6. Distinguish the informational from the noninformational component

This is the core methodological result. The **variable permanent** liquidity factor is the one that matters. The fixed/transitory component does not explain the anomaly portfolios nearly as well.

So it is not generic illiquidity that prices momentum and PEAD. It is the component associated with **information-related price impact**.

### 7. Quantify how much of momentum and PEAD it explains

The paper reports that the variable-permanent liquidity-risk factor explains a substantial fraction of the cross-sectional variation in expected returns on both momentum and PEAD portfolios. The exact percentages vary by specification, but the central message is that liquidity risk is economically important and cannot be dismissed as a small side correction.

### 8. What a reader should implement

A faithful implementation of Sadka's methodology is:

1. estimate stock-level Glosten-Harris price-impact components from intraday trades,
2. separate variable/permanent from fixed/transitory effects,
3. aggregate those components to the market level,
4. extract innovations using fitted time-series models,
5. estimate portfolio loadings on the resulting liquidity factors,
6. test whether those factors price momentum and PEAD portfolios.

That is much more granular than simply adding the Pastor-Stambaugh factor and calling it a liquidity test.

## Domain of applicability

- **Where it works well:** Asset-pricing tests where the researcher wants to separate informational liquidity risk from noninformational trading frictions.
- **What is implementable:** Nontraded liquidity factors built from intraday price-impact decompositions.
- **Main limitation:** The construction requires high-quality intraday trade and quote data and is much more data-intensive than standard monthly-factor approaches.
- **Why the paper matters:** It shows that the liquidity channel relevant for momentum is specifically the informational, permanent component of price impact.
