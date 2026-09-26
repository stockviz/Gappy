# Factor Momentum and the Momentum Factor
**Author:** Sina Ehsani
**Year:** 2017
**Journal/Venue:** Working paper

## Problem statement

Momentum is usually studied at the stock level. This paper asks a more structural question: **what if the real continuation is in anomaly and factor returns themselves, and stock momentum is partly an aggregation of that factor autocovariance?**

That question has two parts:

- is there momentum in factor returns in both time-series and cross-sectional form?
- if yes, how much of the equity momentum factor can be traced to factor autocovariance rather than purely firm-specific continuation?

## Approach (short)

The paper treats established anomaly portfolios as test assets and forms:

- time-series momentum on factors,
- cross-sectional momentum on factors,
- and conditional versions of factor returns based on their own lagged performance.

It then decomposes factor-momentum profits with Lo-MacKinlay-style identities and embeds equity momentum in a linear factor model. The key cross-sectional identity is

$$
E[\pi_t^{XS}]
=
\frac{1}{F}\operatorname{Tr}(\Omega_T)
-
\frac{1}{F^2}\big(\mathbf 1' \Omega_T \mathbf 1-\operatorname{Tr}(\Omega_T)\big)
+
\sigma_\mu^2,
$$

and the stock-level factor-model identity is

$$
E[\pi_t^{Mom}]
=
\sum_f \operatorname{Cov}(r_{-T}^f,r_t^f)\sigma_{\beta_f}^2
+
\sum_{f\neq g}\operatorname{Cov}(r_{-T}^f,r_t^g)\operatorname{Cov}(\beta^g,\beta^f)
+
\frac{1}{N}\sum_s \operatorname{Cov}(\varepsilon_{s,-T},\varepsilon_{s,t})
+
\sigma_\eta^2.
$$

These formulas let the paper show that factor autocovariance is a major source of both factor momentum and equity momentum.

## Approach (detailed)

### 1. Treat anomaly portfolios as the primitive assets

The paper does not begin with stocks. It begins with a wide set of well-known anomaly factors and factor-like spreads, largely from the U.S. and global equity literature, over 1963 to 2015.

This is a deliberate design choice. Because each factor is already a diversified long-short portfolio, any momentum found here is hard to dismiss as a purely firm-specific or microcap effect.

### 2. Define time-series momentum on factors

For each factor `f`, let `r_{-T}^f` denote its average return over the previous 12 months. The winner time-series strategy invests only in factors with positive prior returns, while the diversified TS strategy goes long positive-prior factors and short negative-prior factors:

$$
TS(t)=\frac{1}{F}\sum_{f=1}^F \operatorname{sgn}(r_{-T}^f)\, r_t^f.
$$

This is the factor-level analogue of time-series momentum in futures.

### 3. Define cross-sectional momentum on factors

The paper also forms a factor-level relative-strength strategy. Let `\bar r_{-T}` be the average past return across factors. Then the diversified XS strategy is

$$
XS(t)=\frac{1}{F}\sum_{f=1}^F \operatorname{sgn}(r_{-T}^f-\bar r_{-T})\, r_t^f.
$$

So TS conditions on whether the factor beat zero; XS conditions on whether it beat other factors.

### 4. Use overlapping portfolios across many `{k,h}` horizons

For both TS and XS, the paper evaluates many formation/holding pairs using the Jegadeesh-Titman overlapping-vintage method. At month `t`, the return on a `{k,h}` strategy is the average across the `h` still-active portfolios formed in the recent past.

This matters because the shape of factor continuation is a horizon question, not just a one-horizon question.

### 5. Show that short-horizon factor momentum is strongest

The data show:

- TS and XS factor momentum are both positive and significant;
- the strongest performance often appears at `{1,1}` or `{12,1}`;
- one-month holding periods are the most profitable because autocorrelation weakens at longer horizons.

That horizon pattern becomes important later, when the paper studies crashes and time-varying autocorrelation.

### 6. Decompose cross-sectional factor momentum explicitly

For the linear cross-sectional weighting rule

$$
\pi_t^f=(r_{-T}^f-\bar r_{-T})r_t^f,
$$

the expected profit of the factor-level XS strategy is

$$
E[\pi_t^{XS}]
=
\frac{1}{F}\operatorname{Tr}(\Omega_T)
-
\frac{1}{F^2}\big(\mathbf 1' \Omega_T \mathbf 1-\operatorname{Tr}(\Omega_T)\big)
+
\sigma_\mu^2,
$$

where:

- `\Omega_T` is the lag-`T` autocovariance matrix of factor returns,
- `\operatorname{Tr}(\Omega_T)` is the sum of factor own-autocovariances,
- the second term captures cross-covariances across factors,
- `\sigma_\mu^2` is the cross-sectional variance of mean factor returns.

The main finding is that the own-autocovariance term dominates. Cross-covariance is often positive and therefore subtracts from XS profitability.

### 7. Decompose time-series factor momentum

For the TS strategy, the expected profit simplifies to

$$
E[\pi_t^{TS}]
=
\frac{1}{F}\sum_{f=1}^F \operatorname{Cov}(r_{-T}^f,r_t^f)
+
\frac{1}{F}\sum_{f=1}^F (\mu^f)^2.
$$

This shows that TS profits come from:

- factor autocorrelation,
- and mean factor premia.

Empirically, the autocorrelation term does most of the work. The better performance of TS relative to XS arises partly because TS does not pay the negative cross-covariance tax that XS does.

### 8. Push the decomposition down to the long and short legs

Each factor is itself a spread between a High portfolio and a Low portfolio. The paper substitutes `r^f = r_H^f - r_L^f` into the TS decomposition and obtains a portfolio-level identity in which profits come from:

- autocovariance of the High leg,
- autocovariance of the Low leg,
- lead-lag between High and Low,
- and mean-return differences.

The striking empirical result is that the **short leg** is the most persistent component. Positive autocovariance in the Low portfolio and negative lead-lag from past High returns to future Low returns are major contributors. This is one of the paper's most concrete results.

### 9. Show that Fama-MacBeth slopes are persistent too

The paper then switches from factor returns to the first-stage slopes from monthly Fama-MacBeth regressions on firm characteristics. Let

$$
r_{i,t}=\alpha_t+\sum_c \gamma_{c,t} X_{c,i,t-1}+\varepsilon_{i,t}.
$$

It studies whether the slope coefficients `\gamma_{c,t}` themselves are autocorrelated. They are. Regressing current slopes on their own 12-month averages shows continuation in the price of characteristics.

This links factor momentum to another object that asset-pricing researchers use constantly: the time series of characteristic premia.

### 10. Embed stock momentum in a linear factor model

Now the paper connects factor momentum to the Carhart UMD factor. Assume stock excess returns follow

$$
R_{s,t}=\sum_{f=1}^F \beta_s^f r_t^f+\varepsilon_{s,t}.
$$

Applying the stock-level cross-sectional momentum identity to this factor model yields

$$
E[\pi_t^{Mom}]
=
\sum_f \operatorname{Cov}(r_{-T}^f,r_t^f)\sigma_{\beta_f}^2
+
\sum_{f\neq g}\operatorname{Cov}(r_{-T}^f,r_t^g)\operatorname{Cov}(\beta^g,\beta^f)
+
\frac{1}{N}\sum_s \operatorname{Cov}(\varepsilon_{s,-T},\varepsilon_{s,t})
+
\sigma_\eta^2.
$$

This is the paper's main structural result. Stock momentum can come from:

- factor autocovariance,
- factor lead-lag cross-covariance,
- residual autocovariance,
- cross-sectional differences in mean stock returns.

The factor-autocovariance term is the paper's focus.

### 11. Construct autocovariance-conditioned factor returns

To take the theory to the data, the paper defines a factor's autocovariance-conditioned return as

$$
r_{-T}^f \times r_t^f,
$$

where `r_{-T}^f` is the factor's trailing 12-month average return, excluding the most recent month. These conditioned returns are then correlated with UMD.

This is one of the cleanest implementation steps in the paper. Raw factor returns are only weakly related to UMD, but autocovariance-conditioned factor returns are strongly related to UMD.

### 12. Build an aggregate factor-autocorrelation index and link it to crashes

The paper then measures a time-varying aggregate autocorrelation index by averaging factor autocorrelations across factors. When that index turns negative across many factors at once:

- UMD becomes more volatile,
- skewness worsens,
- and crashes occur.

So the paper interprets momentum crashes as periods of **widespread negative factor autocorrelation**, not just as isolated events in the stock-level winner-minus-loser book.

It also estimates crash-probability regressions in which lower aggregate factor autocorrelation raises the likelihood of a UMD crash.

### 13. Show that a composite conditioned-factor portfolio spans momentum deciles well

Finally, the paper forms a diversified portfolio of past-return-conditioned anomalies and adds it to standard factor models. That composite factor improves the pricing of decile portfolios sorted on momentum and can accommodate much of the UMD premium.

Methodologically, this is how the paper turns "factor autocovariance matters" into a tradable spanning object.

### 14. What a reader should implement

A faithful implementation is:

1. assemble a diversified panel of anomaly/factor returns;
2. compute TS and XS factor-momentum strategies using trailing 12-month averages;
3. decompose profits using the XS and TS identities above;
4. drill into factor long and short legs to locate which portfolio side carries the persistence;
5. compute autocovariance-conditioned factor returns `r_{-T}^f r_t^f`;
6. correlate and span UMD with those conditioned returns;
7. monitor an aggregate factor-autocorrelation index as a crash-state variable.

That workflow reproduces the paper's logic from start to finish.

## Domain of applicability

- **Where it works well:** Researchers or allocators studying whether stock momentum is partly a reflection of common factor continuation rather than only firm-level continuation.
- **What is implementable:** Factor TS and XS momentum portfolios, conditioned-factor composites, and aggregate factor-autocorrelation crash indicators.
- **Main limitation:** The exact quantitative decomposition depends on the chosen factor universe and on the assumed factor model for stocks.
- **Why the paper matters:** It gives a concrete algebraic bridge from factor autocovariance to the equity momentum factor and its crashes.
