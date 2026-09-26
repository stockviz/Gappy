# Presidential Address: Discount Rates
**Authors:** John H. Cochrane
**Year:** 2011
**Journal/Venue:** Journal of Finance

## Problem statement

This is a survey paper, but it has a very clear methodological agenda. Cochrane argues that the main fact modern asset pricing must explain is not just that expected returns are high on average, but that they **vary a lot over time and across assets**. The central empirical question is therefore:

**How much of price variation reflects changing expected cash flows, and how much reflects changing discount rates?**

His claim is that, for aggregate equity at least, most variation in price-dividend ratios reflects discount-rate variation, not cash-flow variation.

## Approach (short)

The paper organizes the literature around predictive regressions and the Campbell-Shiller log-linear present-value identity. It studies three linked objects:

1. return forecasts from the dividend-price ratio,
2. dividend-growth forecasts from the dividend-price ratio,
3. the implied decomposition of price-dividend variation.

The key identity is

$$
d p_t = \sum_{j=1}^{\infty}\rho^{j-1} r_{t+j} - \sum_{j=1}^{\infty}\rho^{j-1}\Delta d_{t+j},
$$

so once one estimates long-run return and dividend-growth predictability, one can attribute movements in valuation ratios to discount rates or cash flows. Cochrane's reading of the evidence is that almost all of the action is discount-rate variation.

## Approach (detailed)

### 1. Start from predictive regressions in valuation ratios

The first empirical object is the classic forecasting regression:

$$
R_{t\rightarrow t+k}=a+b\,\frac{D_t}{P_t}+\varepsilon_{t+k},
$$

or in logs, forecasts of long-horizon returns from the dividend-price ratio `dp_t`.

This is not a side result. It is the entry point for the whole paper, because if dividend yields forecast returns, then prices move not only because expected dividends change, but also because expected returns change.

### 2. Use the Campbell-Shiller log-linear identity

The paper formalizes the decomposition with the Campbell-Shiller approximation:

$$
r_{t+1}=\kappa-\rho\,dp_{t+1}+dp_t+\Delta d_{t+1},
$$

and, after demeaning,

$$
r_{t+1}=-\rho\,dp_{t+1}+dp_t+\Delta d_{t+1}.
$$

Iterating forward and ruling out rational bubbles gives the present-value identity

$$
dp_t=\sum_{j=1}^{\infty}\rho^{j-1}r_{t+j}-\sum_{j=1}^{\infty}\rho^{j-1}\Delta d_{t+j}.
$$

This identity is the paper's core methodological device. It converts questions about prices into questions about future returns and future dividend growth.

### 3. Estimate long-run return, dividend-growth, and valuation-ratio regressions jointly

For a finite horizon `k`, Cochrane studies:

$$
\sum_{j=1}^{k}\rho^{j-1}r_{t+j}=a_r+b_r^{(k)}dp_t+\varepsilon^r_{t+k},
$$

$$
\sum_{j=1}^{k}\rho^{j-1}\Delta d_{t+j}=a_d+b_{\Delta d}^{(k)}dp_t+\varepsilon^d_{t+k},
$$

$$
dp_{t+k}=a_{dp}+b_{dp}^{(k)}dp_t+\varepsilon^{dp}_{t+k}.
$$

The present-value identity imposes the coefficient restriction

$$
1 \approx b_r^{(k)}-b_{\Delta d}^{(k)}+\rho^k b_{dp}^{(k)}.
$$

That restriction is important because it prevents the decomposition from being a loose verbal story. The three regressions must fit together algebraically.

### 4. Infer discount-rate variation from the long-run coefficients

The logic is:

- if `dp_t` forecasts future dividend growth, then price variation is largely cash-flow news;
- if `dp_t` forecasts future returns, then price variation is largely discount-rate news.

Cochrane's reading of the evidence is that:

- long-horizon return coefficients are large,
- long-horizon dividend-growth coefficients are small,
- and the persistence of `dp_t` completes the identity.

Hence, most variation in valuation ratios is attributed to changing expected returns.

This is the paper's strongest empirical conclusion.

### 5. Use VARs as a decomposition engine

The paper also discusses estimating one-year or multivariate VARs and then using the VAR dynamics to infer long-run return and dividend-growth coefficients. This is not just for convenience. A VAR gives:

- a disciplined way to infer long-run forecasts from short-run state dynamics,
- an internally consistent variance decomposition,
- and impulse-response plots that show whether a shock to `dp_t` primarily changes expected future returns or expected future cash flows.

This is why the paper treats "discount-rate news" as a measurable object rather than a vague residual.

### 6. Extend the same logic to the cross section

The second half of the paper argues that the cross section has undergone a similar reinterpretation. Many so-called anomalies are now read as evidence that expected returns vary across portfolios and factors. In that sense:

- value, momentum, profitability, investment, carry, and many other patterns
- are all statements about discount rates, expected returns, and risk premia.

Methodologically, the paper encourages the reader to translate characteristic-based evidence into an expected-return language:

$$
E_t[R_{i,t+1}]
$$

is the object to explain, and prices follow from discounting expected cash flows at those time-varying, asset-varying rates.

### 7. Why this changes how one should analyze asset-pricing evidence

The paper's practical contribution is to force three questions whenever a price ratio moves:

1. does it forecast future cash-flow growth?
2. does it forecast future returns?
3. do the answers satisfy the present-value identity?

Likewise in the cross section:

1. is a characteristic standing in for expected return?
2. is a proposed factor explaining expected return variation or only covariance patterns?
3. is the pricing story consistent with the level and time variation of discount rates implied by the data?

That methodology is the real content of the paper.

## Domain of applicability

- **Where it works well:** Aggregate equity and bond valuation work, present-value decompositions, and factor-pricing problems where expected returns vary over time.
- **What is implementable:** Predictive regressions, Campbell-Shiller decompositions, and VAR-based discount-rate-news calculations.
- **Main limitation:** The decomposition is only as good as the forecasting system; small-sample persistence and horizon issues can make inference difficult.
- **Why the paper matters:** It reframes a large part of modern finance around one claim: most variation in prices and valuation ratios is best understood as variation in discount rates.
