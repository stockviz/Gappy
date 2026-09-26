# Price and Earnings Momentum: An Explanation Using Return Decomposition
**Authors:** Mike Qinghao Mao, K.C. John Wei
**Year:** 2014
**Journal/Venue:** Journal of Empirical Finance

## Problem statement

Price momentum and earnings momentum are both robust, but they may be driven by different mixtures of fundamental news and discount-rate changes. This paper asks: **if one decomposes realized returns into cash-flow news, discount-rate news, and expected-return components, which component actually generates momentum profits, and why does price momentum reverse more in the long run than earnings momentum?**

The paper's central claim is that persistent cash-flow news is the main driver, while discount-rate news is crucial for time variation and for the loser side of price momentum.

## Approach (short)

Using analyst forecasts and residual-income valuation models, the paper decomposes each stock's monthly realized return into:

- cash-flow news `CFret`,
- discount-rate news `DRret`,
- expected return `Eret`.

For a valuation model `P_t=f(cf_t,dr_t,t)`, realized return is decomposed as

$$
Ret_t = CFret_t + DRret_t + Eret_t.
$$

The paper constructs:

- price momentum deciles on past six-month returns, skipping one month;
- earnings momentum deciles on standardized unexpected earnings;
- equal-weighted hedge portfolios held for six months.

It then tracks the decomposition components during the ranking period, the holding period, and the long-run post-holding period.

## Approach (detailed)

### 1. Start from a valuation identity rather than a VAR

Traditional return decomposition uses a VAR and infers cash-flow news as a residual. Mao and Wei instead follow Chen et al. (2013) and use accounting valuation models with analyst forecasts.

Let stock value be

$$
P_t=f(cf_t,dr_t,t),
$$

where:

- `cf_t` is the expected future earnings path,
- `dr_t` is the implied cost of capital or discount rate,
- `t` is calendar time.

Then realized return from `t-1` to `t` is

$$
Ret_t=\frac{P_t-P_{t-1}}{P_{t-1}}.
$$

The paper rewrites this as the sum of three finite-difference terms:

$$
Ret_t = CFret_t + DRret_t + Eret_t.
$$

### 2. Define the three return components explicitly

Using a midpoint decomposition, the paper constructs:

$$
CFret_t
=
\frac{1}{2P_{t-1}}
\Big(
f(cf_t,dr_t,t)-f(cf_{t-1},dr_t,t)
+
f(cf_t,dr_{t-1},t)-f(cf_{t-1},dr_{t-1},t)
\Big),
$$

$$
DRret_t
=
\frac{1}{2P_{t-1}}
\Big(
f(cf_t,dr_t,t)-f(cf_t,dr_{t-1},t)
+
f(cf_{t-1},dr_t,t)-f(cf_{t-1},dr_{t-1},t)
\Big),
$$

$$
Eret_t
=
\frac{f(cf_{t-1},dr_{t-1},t)-f(cf_{t-1},dr_{t-1},t-1)}{P_{t-1}}.
$$

Interpretation:

- `CFret`: return due to revisions in expected cash flows, holding the discount rate fixed;
- `DRret`: return due to discount-rate changes, holding forecasts fixed;
- `Eret`: the ex ante expected return implied by the discount rate at `t-1`.

This is the paper's defining methodological move.

### 3. Estimate expected returns from four residual-income models

The implied cost of capital is estimated stock by stock using four valuation models:

- Gebhardt et al. (2001),
- Claus and Thomas (2001),
- Ohlson and Juettner-Nauroth (2005),
- Easton (2004).

The paper uses the **median** implied cost of capital across the four models to reduce model-specific measurement noise. Once the implied discount rate is available, the three return components are computed monthly.

### 4. Build the data so the decomposition is actually feasible

The sample is U.S. nonfinancial firms from 1985 to 2010. Data come from:

- I/B/E/S analyst earnings forecasts,
- Compustat accounting data,
- CRSP monthly returns.

Because both `t-1` and `t` forecasts are needed, the paper keeps firms with good analyst-forecast coverage over time. This is a more selective sample than pure CRSP momentum studies, but it is necessary for the decomposition.

### 5. Construct price momentum portfolios in the classic way

At the end of each month:

1. sort stocks into deciles on cumulative return over the past six months;
2. skip one month between formation and holding;
3. go long the winner decile `D10` and short the loser decile `D1`;
4. hold the equal-weighted hedge portfolio for six months.

This yields the standard price-momentum hedge portfolio.

### 6. Construct earnings momentum portfolios with SUE

Earnings momentum is based on standardized unexpected earnings:

$$
SUE_{i,t}=\frac{e_{iq}-e_{iq-4}}{\sigma_{i,t}},
$$

where:

- `e_{iq}` is the most recent quarterly EPS,
- `e_{iq-4}` is EPS from the same quarter a year earlier,
- `\sigma_{i,t}` is the volatility of that annual EPS change over the prior eight quarters.

Stocks are sorted into deciles by SUE, and the equal-weighted `D10-D1` portfolio is held for six months.

### 7. State what rational and behavioral theories predict in decomposition terms

The paper translates competing theories into decomposition restrictions.

**Conrad-Kaul style rational explanation**

- momentum profits come from cross-sectional dispersion in expected returns;
- therefore `Eret` should explain the hedge-portfolio spread during the holding period;
- `CFret` and `DRret` should not have systematic winner-loser differences.

**Johnson-style rational explanation**

- recent growth shocks raise risk for winners;
- that implies a negative `DRret` during ranking as discount rates rise for winners;
- and a positive expected-return spread during holding.

**Behavioral explanations**

- underreaction to fundamentals implies persistent `CFret`;
- overconfidence / biased beliefs may show up in `CFret`, `DRret`, or both;
- long-run reversal can occur if discount-rate news mean reverts.

This translation from theory to decomposition objects is one of the paper's best features.

### 8. Measure the ranking-period and holding-period dynamics of each component

The paper computes monthly average `Ret`, `CFret`, `DRret`, and `Eret`:

- during the six months before portfolio formation,
- during the six holding months after formation,
- and in longer post-holding horizons.

This lets the authors answer not only "what explains the average hedge return?" but also "what path of news created the strategy in the first place?"

### 9. Main result for price momentum: persistent CF news dominates

For price momentum, winners have persistently higher cash-flow news than losers both:

- before formation,
- and during the holding period.

That is the main source of the hedge return. At the same time:

- winners tend to experience positive `DRret` in the sorting period, meaning discount rates fell for them;
- that makes winners appear to have lower ex ante expected returns than losers.

So the strategy is not simply buying high-expected-return stocks. Instead, it is mostly harvesting slow incorporation of cash-flow news.

### 10. Show why losers matter disproportionately through discount-rate news

The paper finds that discount-rate news, especially on the loser side, is important for the **time-series variation** in momentum profitability. Temporary DR shocks can make losers look extremely bad in the ranking period and then reverse around or after formation.

This helps explain why:

- sorting-period total returns can be very large,
- while holding-period hedge returns are much smaller,
- and why price momentum has stronger long-run reversal.

### 11. Compare price momentum with earnings momentum

The same decomposition is then applied to earnings momentum. The comparison is crucial:

- both strategies rely on positive `CFret`;
- price momentum loads more heavily on `DRret` during portfolio formation;
- earnings momentum is more directly tied to fundamental CF news and less to discount-rate noise.

This is why earnings momentum exhibits weaker long-run reversal than price momentum. DR news mean reverts more than CF news.

### 12. Use Fama-MacBeth regressions to connect pre-ranking components to post-ranking components

The paper also runs monthly Fama-MacBeth regressions in which post-ranking return components are predicted from pre-ranking components. This is the formal cross-sectional test of whether lagged CF news or lagged DR news better explains subsequent momentum profitability.

Those regressions reinforce the visual and portfolio evidence:

- lagged CF news predicts subsequent continuation more strongly;
- DR news is more relevant for short-horizon timing and loser reversals.

### 13. What a reader should implement

A faithful implementation is:

1. estimate implied costs of capital from several residual-income models using analyst forecasts;
2. compute `CFret`, `DRret`, and `Eret` monthly for each stock;
3. form price-momentum and SUE-momentum deciles and six-month hedge portfolios;
4. track decomposition components through ranking, holding, and long-run post-holding periods;
5. use Fama-MacBeth regressions to test whether lagged components forecast future hedge returns.

That reproduces the paper's whole logic.

## Domain of applicability

- **Where it works well:** Researchers who want to separate fundamental underreaction from discount-rate dynamics in price and earnings momentum.
- **What is implementable:** Analyst-forecast-based return decomposition combined with classic price- and earnings-momentum portfolio sorts.
- **Main limitation:** The method requires rich forecast data and relies on residual-income valuation models, so it is more data-intensive and more model-dependent than standard CRSP-only momentum tests.
- **Why the paper matters:** It is one of the clearest papers showing that momentum profits are mostly about persistent cash-flow news, not just about loading on high expected returns.
