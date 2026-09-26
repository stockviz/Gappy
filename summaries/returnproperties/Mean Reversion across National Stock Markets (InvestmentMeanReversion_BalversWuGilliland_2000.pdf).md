# Mean Reversion across National Stock Markets — Balvers, Wu & Gilliland (2000) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Mean Reversion across National Stock Markets and Parametric Contrarian Investment Strategies |
| **Authors** | Ronald Balvers; Yangru Wu; Erik Gilliland |
| **Journal** | *The Journal of Finance*, Vol. LV, No. 2, April 2000, pp. 745–772 (approx.) |
| **Themes** | Cross-country mean reversion, panel unit-root / ADF, SUR, parametric contrarian strategies, half-life |
| **Sample** | MSCI national indexes, 18 countries, annual 1970–1996 (also IFS 1949–1997 robustness) |
| **Original PDF** | `InvestmentMeanReversion_BalversWuGilliland_2000.pdf` |
| **Drive file id** | `0B-6kBz0I0dMsOGwzWG5JcW9zOWM` |
| **Extraction** | `pdftotext` (~13,353 words); text usable |

---

## Problem / Motivation

Fama–French (1988a,b), Poterba–Summers (1988), Cutler–Poterba–Summers (1991) and others document **long-horizon mean reversion** in equity returns, but power is low in short international samples. Univariate ADF tests on 25–30 annual observations rarely reject unit roots even when half-lives are economically meaningful. Cross-country panels can restore power if speeds of reversion are similar.

Balvers–Wu–Gilliland (BWG) test mean reversion of **national equity indexes relative to a reference index** (world or US), avoiding the need to specify a noisy fundamental $P^*$ (dividend-price, etc.). Under their specification, relative prices are stationary if countries share a common trend component and mean-revert at similar speeds. They then build **parametric contrarian** strategies that estimate the panel model recursively and go long high expected-return countries—comparing to buy-and-hold, random-walk-with-drift, and DeBondt–Thaler (1985) nonparametric contrarian rules.

---

## Model and Test Equations

Absolute specification (for intuition):
$$
R^i_{t+1}=a^i-\lambda^i(P^i_t-P^{*i}_t)+e^i_{t+1}
$$
with $\lambda^i>0$ implying pull toward fundamental $P^*$.

**Relative specification** used in estimation (reference index $r$):
$$
R^i_{t+1}-R^r_{t+1}=a_i-\lambda_i(P^i_t-P^r_t)+\sum_{j=1}^{k}\phi_{ji}(R^i_{t+1-j}-R^r_{t+1-j})+v^i_{t+1}. \tag{4}
$$
Null: $\lambda_i=0$ (no mean reversion). Alternative: $\lambda_i>0$. Panel version constrains $\lambda_i=\lambda$ across $i$ and estimates by **SUR** (or OLS robustness), choosing lag $k$ by SBC (find $k=1$).

**Test statistics:** $z_\lambda=T\hat\lambda$ and $t_\lambda=\hat\lambda/\mathrm{se}(\hat\lambda)$. Under the null these are **nonstandard**; p-values from **5,000 Monte Carlo** replications (Appendix). **Median-unbiased** $\lambda$ corrects small-sample upward bias under the alternative; half-life $\ln(1/2)/\ln(1-\lambda)$.

Economic rationale for relative prices: if each country’s log index equals a common integrated component plus a stationary country gap, differences $P^i-P^r$ are stationary even if absolute indexes are I(1). Imposing cointegrating vector $[1,-1]$ is stronger than unrestricted cointegration tests (Kasa 1992 finds cointegration; Richards 1995 finds predictability but not cointegration—BWG argue low power).

---

## Data

- **Primary:** MSCI total-return indexes, annual, **1970–1996**, **18 countries**: AUS, AUT, BEL, CAN, DEN, FRA, GER, HKG, ITA, JPN, NLD, NOR, SIG, SPN, SWE, SWT, UKM, USA, plus World (WLD).
- Dollar returns; robustness in local-currency real returns.
- Annual frequency justified: (1) mean reversion is multi-year; (2) continuous dividend treatment by MSCI vs discrete ex-div prices; (3) power not obviously helped by higher frequency for slow $\lambda$.
- US T-bill (IFS line 60) as risk-free for betas/Sharpes.

### Table I — Summary statistics (1970–1996 annual)

| Country | Mean | SD | $\beta$ vs World |
|---------|------|-----|---------------------|
| AUS | 0.089 | 0.243 | 1.286 |
| AUT | 0.108 | 0.263 | 0.463 |
| BEL | 0.144 | 0.192 | 0.793 |
| CAN | 0.096 | 0.159 | 0.759 |
| DEN | 0.132 | 0.247 | 0.828 |
| FRA | 0.116 | 0.248 | 1.115 |
| GER | 0.113 | 0.228 | 0.755 |
| HKG | 0.193 | 0.425 | 1.887 |
| ITA | 0.058 | 0.307 | 1.229 |
| JPN | 0.140 | 0.285 | 1.321 |
| NLD | 0.153 | 0.162 | 0.880 |
| NOR | 0.126 | 0.355 | 0.371 |
| SIG | 0.141 | 0.359 | 1.523 |
| SPN | 0.093 | 0.277 | 0.742 |
| SWE | 0.153 | 0.218 | 0.856 |
| SWT | 0.127 | 0.202 | 0.874 |
| UKM | 0.126 | 0.272 | 1.312 |
| USA | 0.111 | 0.153 | 0.806 |
| WLD | 0.112 | 0.155 | 1.000 |

Jarque–Bera: normality of excess returns vs world/US not rejected for most countries. Cross-country excess-return correlations: 43/153 significant at 10% despite $T=27$—motivates SUR.

---

## Empirical Results: Mean Reversion Tests

### Table II — Univariate ADF (world and US references)

Critical values (Fuller): 10% 2.63; 5% 3.00; 1% 3.75. With world reference, **only DEN (3.763**) and GER (3.151*)** reject at 5%/1%. With US reference, add **NOR (4.710**)**. Most countries fail to reject—classic low power with $T=28$ prices.

### Table III — Panel SUR tests

| | World ref | US ref |
|--|-----------|--------|
| Point $\hat\lambda$ | 0.274 | 0.292 |
| $z_\lambda$ (p) | 7.407 (0.002) | 7.894 (0.000) |
| $t_\lambda$ (p) | 11.431 (0.044) | 11.277 (0.022) |
| Median-unbiased $\lambda$ | **0.182** | **0.202** |
| 90% CI | [0.110, 0.250] | [0.135, 0.270] |
| **Half-life (years)** | **3.5** | **3.1** |

Panel rejects no-mean-reversion at 1% ($z_\lambda$) / 5% ($t_\lambda$). Cutler et al. (1991) dividend-price based speeds ~0.14–0.16 (half-life 4.0–4.6 years); BWG find **faster** reversion (~1 year shorter half-life), attributed to avoiding misspecified $P^*$.

Reference-index robustness (AUS, GER, JPN as references): half-lives 2.7–3.1 years; conclusions unchanged.

### Table IV — Power comparison (5,000 MC)

Under true $\lambda=0.182$ (bias-adjusted estimate), at 5% nominal size:
- Panel $z_\lambda$ power ≈ **1.000**; panel $t_\lambda$ ≈ **0.980**
- Univariate $z_\lambda$ power ≈ **0.194**; univariate $t_\lambda$ ≈ **0.110**

This explains contradictory univariate vs panel conclusions. Even with $T=70$ (as if sample began 1926), univariate $z_\lambda$ power only 67.2% at 5%—still uncomfortable. $z_\lambda$ generally more powerful than $t_\lambda$.

---

## Robustness (Table V)

World reference unless noted. Median-unbiased $\lambda$ and half-lives:

| Spec | $\hat\lambda$ pt | Med-unb $\lambda$ | Half-life |
|------|-------------------|---------------------|-----------|
| (1) OLS (diagonal Σ) | 0.235 | 0.140 | **4.6y** |
| (2) Drop USA | 0.267 | 0.174 | 3.6y |
| (3) Drop JPN | 0.280 | 0.187 | 3.3y |
| (4) OECD only | 0.241 | 0.143 | 4.5y |
| (5) Drop DEN+GER | 0.251 | 0.145 | 4.1y |
| (6) Local-currency real (US ref) | 0.294 | 0.204 | **3.0y** |
| (7) Post–Bretton Woods | 0.311 | 0.198 | 3.1y |
| (8) IFS 1949–97, 11 countries | 0.140 | 0.090 | **7.3y** |
| (9) IFS + 1973 intercept dummies | 0.291 | 0.195 | 3.2y |

**Key:** FX mean reversion is **not** the whole story—(6) local real returns still mean-revert. Longer IFS sample shows slower unreverted speed unless 1973 break dummies included. Results not driven by US, Japan, non-OECD, or the univariate rejectors.

---

## Parametric Contrarian Strategies (Table VI)

Forecast period starts at one-third sample (first forecast ~1979); evaluate 1979–1996.

| Strategy | Type | Mean ret | $\beta$ vs Wld | Sharpe |
|----------|------|----------|------------------|--------|
| 1 Buy & hold | World | 0.137 | 1.000 | 0.447 |
| | USA | 0.150 | 0.602 | 0.644 |
| | EW 18 | 0.142 | 1.090 | 0.393 |
| **2 Rolling panel ($\lambda$ common)** | **Max1** | **0.207** | 1.336 | 0.485 |
| | Max1−Min1 | **0.090*** | −0.118 | 0.425 |
| | Max3 | 0.198 | 1.256 | 0.549 |
| | Max3−Min3 | **0.084***** | 0.008 | 0.579 |
| 3 RW with drift ($\lambda=0$) | Max1 | 0.093 | 0.814 | 0.066 |
| | Max1−Min1 | −0.036 | −0.407 | −0.120 |
| 4 DeBondt–Thaler 3y | Max1 | 0.135 | 0.983 | 0.329 |
| | Max1−Min1 | 0.061 | −0.137 | 0.230 |

\* /\*\*: Max−Min significance at 5%/1%.

**Interpretation:**
- Rolling parametric Max1 earns **20.7%**, beating world (13.7%), EW (14.2%), and even ex-post best single-country buy-and-hold (HKG 19.9% over the period). Premium vs world 7.0% ($t=1.37$, one-sided $p=0.094$).
- Max1−Min1 earns **9.0%** ($t=1.80$, $p=0.044$).
- Random-walk strategy (pick recent winners) **underperforms**—consistent with mean reversion, not momentum at these horizons.
- DeBondt–Thaler Max1−Min1 **6.1%** < parametric 9.0%; Max1 13.5% is 7.2% below parametric ($t=1.29$, $p=0.107$).
- Full-sample (look-ahead) parameters would give Max1 23.3% and Max1−Min1 20.5% ($t=3.33$)—shows economic magnitude if $\lambda$ known; rolling is the honest test.

**Figures 1–2:** for every forecast start year $t_0\in[1974,1992]$, rolling parametric Max1 beats DT, RW, and world B&H; Max1−Min1 beats DT for all but three starts; premium over DT typically **6–10%** (range 3.8–11.5% for Max1).

**Risk:** Max1 $\beta=1.336$ vs world—not market-neutral; Max1−Min1 $\beta\approx 0$. US B&H Sharpe (0.644) still exceeds Max1 Sharpe (0.485) because Max1 is more volatile—highlights return vs risk-adjusted distinction.

**Implementation frictions discussed:** at most one switch/year; Max1 needs no short; MSCI names are liquid large caps; early Japan capital controls noted but Figures 1–2 show later-period strength.

---

## Limitations

- Annual $T=27$ still small; panel power helps but cross-sectional dependence / SUR Σ estimation is delicate (hence OLS robustness with slower $\lambda$).
- Imposed $[1,-1]$ cointegrating vector may be wrong for some pairs.
- Dollar returns mix equity and FX; local-real robustness helps but investment for a dollar-based LP still faces FX.
- Strategy results: few forecast points (18); Max1 significance vs world only marginal (10% one-sided).
- No full TCA model; emerging-market investability evolved over the sample.
- Half-life estimates sensitive to bias correction and sample (IFS 7.3y vs MSCI 3.5y).

---

## Practical Takeaways for a Quant Investor

1. **Cross-country equity mean reversion is real in panels** with half-life ~**3–4 years** (median-unbiased $\lambda\approx 0.14$–$0.20$ on MSCI)—use as a slow tactical signal, not a monthly factor.
2. **Do not trust country-by-country ADF** in short samples; pool with common $\lambda$ (or hierarchical shrinkage).
3. **Parametric contrarian > nonparametric DT** at the country-index level in this sample—estimate $\lambda$ and forecasts explicitly.
4. **Long Max1** needs no short and switched slowly—operationally friendlier than Max−Min, but carries $\beta>1$.
5. **RW/momentum at 3-year horizons loses**—horizon matters; do not confuse with 12-month momentum.
6. **Risk:** report Sharpe and $\beta$; raw outperformance ≠ higher Sharpe vs US.
7. **FX:** verify in local real terms before attributing to equity mean reversion alone.
8. **Update:** re-estimate on post-1996 data before deploying; structural change (IFS dummies) matters for long samples.

---

## Key Equations Quick Reference

| Object | Formula |
|--------|---------|
| Relative ADF panel | Eq. (4) above |
| Half-life | $\ln(1/2)/\ln(1-\lambda)$ |
| $z_\lambda$ | $T\hat\lambda$ |
| Strategy | Rolling estimate of (4) → forecast relative returns → hold Max1 / long-short Max−Min |

---

## Extended Discussion: Why Relative Prices?

Specifying $P^{*i}$ as dividend-price or earnings-price invites measurement error and structural change in payout policy. Differencing against a reference index differences out a common nonstationary component under the maintained assumption that countries share a global stochastic trend in ex-dividend wealth. The cost is: if a country permanently diverges (nationalization, hyperinflation, secular decline), relative stationarity fails. BWG’s panel rejection and strategy profits suggest the assumption is empirically useful for developed MSCI markets over 1970–1996.

### SUR vs OLS

SUR uses cross-country residual correlations (43 significant pairwise correlations) to improve efficiency, but estimating an $18\times 18$ covariance from ~28 observations is noisy. OLS panel (Table V col 1) still rejects strongly but cuts median-unbiased $\lambda$ from 0.182 to 0.140 (half-life 4.6y). Practical recommendation: report both; shrink the residual covariance (e.g., identity mixture) if deploying live.

### Monte Carlo Design (Appendix intuition)

Under the null $\lambda=0$, simulate panel paths with estimated intercepts and innovation covariance; recompute $z_\lambda,t_\lambda$ to get critical values / p-values. Under the alternative, simulate with $\lambda>0$ to estimate median bias and power. 5,000 replications stabilize tails.

### Link to Other Literatures

- **PPP / real exchange rates:** Abuaf–Jorion, Wu—mean reversion in FX at low frequency; BWG’s local-real robustness says equity results are not pure FX.
- **Cointegration:** Kasa (1992) supportive; Richards (1995) not—BWG side with power explanations.
- **Contrarian:** DeBondt–Thaler firm-level; Richards international indexes; BWG add parametric structure.
- **Present-value:** mean reversion consistent with time-varying expected returns / slow discount-rate adjustment across countries.

### Investor Process Sketch

1. Maintain annual (or overlapping monthly) panel of country total-return indexes in investor currency and in local real terms.
2. Estimate eq. (4) with pooled $\lambda$, country intercepts, SBC lags; bias-correct $\lambda$.
3. Forecast next-period relative returns; form Max3 / Min3 portfolios with position caps.
4. Hedge unwanted FX if mandate is equity-only; control $\beta$ vs MSCI World via overlay.
5. Re-estimate each year; expect holding periods of multiple years (half-life 3–4).
6. Benchmark vs World and vs DT 3-year contrarian; track turnover (should be low).

### Numerical Example of Half-Life

For $\lambda=0.182$: fraction of gap closed per year = 18.2%; remaining gap after $h$ years $(1-0.182)^h$; set equal to 0.5 → $h=\ln 0.5/\ln 0.818\approx 3.45$ years. After 7 years, ~75% of a shock has mean-reverted. Tactical country allocation should think in **multi-year** correction windows.

### Final Assessment

BWG (2000) is a clean demonstration that **panel methods uncover cross-country equity mean reversion that univariate tests miss**, with economically interpretable half-lives (~3.5 years) and **parametric contrarian strategies that beat buy-and-hold, random-walk, and DeBondt–Thaler benchmarks** over 1979–1996. For a global equity quant, it justifies slow country-value / mean-reversion tilts with pooled estimation discipline—and warns against reading country ADF non-rejections as evidence against mean reversion.


### Additional Quantitative Detail from the Trading-Strategy Section

The rolling regression uses OLS early on because SUR needs $T\ge N$ for a positive-definite innovation covariance; once enough history accumulates, SUR becomes feasible, but the paper sticks with OLS for the strategy to keep the early-sample pipeline consistent. Forecasts are one-year ahead relative returns from the estimated panel; Max1 picks the single highest forecast, Max3 averages the top three. Min portfolios defined symmetrically for long-short books.

Significance for Max−Min uses $t=\bar R/(\hat\sigma/\sqrt{T-t_0})$. With only ~18 annual forecast points, standard errors are large—hence marginal p-values even for economically large premia. Investors should treat the 9% Max1−Min1 as **suggestive and directionally robust across $t_0$** (Figures 1–2) rather than a precise expected edge.

Beta of Max1 at 1.336 implies substantial world-market exposure; a portable-alpha implementation would short world futures against Max1 to isolate the mean-reversion component. The near-zero beta of Max1−Min1 makes it the cleaner test asset for “pure” country mean reversion.

Comparison to Hong Kong’s 19.9% ex-post buy-and-hold is rhetorical: Max1 beat the *ex post* best constant country allocation without knowing which country would win—stronger than beating the world average alone.

Capital controls and investability: Japan before mid-1970s; various EM restrictions. Strategy profits remaining when forecasts start in the 1980s–1990s (Figures 1–2) mitigate this concern for modern application to liquid developed markets. Extending to emerging markets requires checking investability, custody, and index replication costs.

Overall library value: pairs with country-allocation chapters in Ang *Asset Management* and with panel unit-root econometrics; primary numbers to remember—**$\lambda_{\mathrm{MU}}\approx 0.18$, half-life $\approx 3.5$y, rolling Max1 20.7% vs world 13.7%, Max1−Min1 9.0%**.


---

## Source Evidence Appendix — Balvers, Wu & Gilliland (2000)

The following curated excerpts preserve quantitative statements from the extracted PDF text for auditability and completeness of the research notes.

### Excerpt 1

```
using weekly data; Kim, Nelson, and Startz ~1991! argue that the mean
reversion results are only detectable in prewar data; and Richardson and
Stock ~1989! and Richardson ~1993! report that correcting for small-sample
bias problems may reverse the Fama and French ~1988a! and Poterba and
```

### Excerpt 2

```
that returns are negatively autocorrelated at certain horizons. Mean reversion thus implies
that returns are predictable based on lagged prices. Conversely, predictability of returns based
on lagged prices need not imply mean reversion. For example, predictable explosive processes
are not mean reverting. The more general predictability of international stock prices based on
```

### Excerpt 3

```
that returns are predictable based on lagged prices. Conversely, predictability of returns based
on lagged prices need not imply mean reversion. For example, predictable explosive processes
are not mean reverting. The more general predictability of international stock prices based on
attributes other than price history has received growing attention. For instance, Ferson and
```

### Excerpt 4

```
attributes other than price history has received growing attention. For instance, Ferson and
Harvey ~1993, 1998! use a conditional beta pricing model to explain the predictability of inter-
national equity returns. Cutler, Poterba, and Summers ~1991! employ the dividend-price ratio
to predict international equity returns.
```

### Excerpt 5

```
market compared to the world should be fully reversed over time. Given an
estimated half-life of three to three and one-half years in our data, this
country’s stock market should experience an expected total returns surplus,
relative to the world index, of five percent over the next three to three and
```

### Excerpt 6

```
nary least squares ~OLS! regression of equation ~3! can be run and the
t-statistic for l 5 0 can be used to test for the null hypothesis of no mean

   5
```

### Excerpt 7

```
is avoided.
   Table I presents some summary statistics for our data set. We compute,
for each country, the average returns, standard errors of returns, and a sim-
ple beta with the world index ~the U.S. Treasury bill rate, from International
```

### Excerpt 8

```
for each country, the average returns, standard errors of returns, and a sim-
ple beta with the world index ~the U.S. Treasury bill rate, from International
Financial Statistics line 60, is used as a proxy for the risk-free rate!. These
statistics vary from highs of a 19.3 percent mean return, 42.5 percent stan-
```

### Excerpt 9

```
statistics vary from highs of a 19.3 percent mean return, 42.5 percent stan-
dard error, and beta of 1.89, all for Hong Kong, to lows of a 5.8 percent mean
return ~Italy!, 15.3 percent standard error ~United States! and beta of 0.37
~Norway!. The Jarque and Bera ~1980! test indicates that the hypothesis
```

### Excerpt 10

```
dard error, and beta of 1.89, all for Hong Kong, to lows of a 5.8 percent mean
return ~Italy!, 15.3 percent standard error ~United States! and beta of 0.37
~Norway!. The Jarque and Bera ~1980! test indicates that the hypothesis
that returns relative to the world or the United States follow a normal dis-
```

### Excerpt 11

```
The correlations of the country indexes’ excess returns in dollar terms rel-
ative to the world index return ~not shown! vary from 0.79 between Ger-
many and Switzerland to 20.73 between the United States and Japan. Some
of these point estimates are quite large in magnitude. In terms of statistical
```

### Excerpt 12

```
ative to the world index return ~not shown! vary from 0.79 between Ger-
many and Switzerland to 20.73 between the United States and Japan. Some
of these point estimates are quite large in magnitude. In terms of statistical
significance, among the total of 153 correlations, 43 are significantly differ-
```

### Excerpt 13

```
Table I
          Summary Statistics of National Stock Index Returns
Summary statistics are reported for the annual returns data from Morgan Stanley Capital
```

### Excerpt 14

```
Summary statistics are reported for the annual returns data from Morgan Stanley Capital
International over the period 1970 to 1996. In computing the betas, the U.S. Treasury bill rate
is used as the risk-free rate of return. The test for normality of the excess returns of a country
index relative to a reference index is by Jarque and Bera ~1980!. The test statistic follows the
```

### Excerpt 15

```
AUS           0.089        0.243            1.286               0.760                   1.446
AUT           0.108        0.263            0.463               4.175                   2.010
BEL           0.144        0.192            0.793              12.607**                 0.156
```

### Excerpt 16

```
AUS           0.089        0.243            1.286               0.760                   1.446
AUT           0.108        0.263            0.463               4.175                   2.010
BEL           0.144        0.192            0.793              12.607**                 0.156
CAN           0.096        0.159            0.759               2.535                   1.404
```

### Excerpt 17

```
AUT           0.108        0.263            0.463               4.175                   2.010
BEL           0.144        0.192            0.793              12.607**                 0.156
CAN           0.096        0.159            0.759               2.535                   1.404
DEN           0.132        0.247            0.828               0.117                   0.048
```

### Excerpt 18

```
BEL           0.144        0.192            0.793              12.607**                 0.156
CAN           0.096        0.159            0.759               2.535                   1.404
DEN           0.132        0.247            0.828               0.117                   0.048
FRA           0.116        0.248            1.115               0.569                   0.308
```

### Excerpt 19

```
CAN           0.096        0.159            0.759               2.535                   1.404
DEN           0.132        0.247            0.828               0.117                   0.048
FRA           0.116        0.248            1.115               0.569                   0.308
GER           0.113        0.228            0.755               2.055                   2.053
```

### Excerpt 20

```
DEN           0.132        0.247            0.828               0.117                   0.048
FRA           0.116        0.248            1.115               0.569                   0.308
GER           0.113        0.228            0.755               2.055                   2.053
HKG           0.193        0.425            1.887               0.583                   0.188
```

### Excerpt 21

```
FRA           0.116        0.248            1.115               0.569                   0.308
GER           0.113        0.228            0.755               2.055                   2.053
HKG           0.193        0.425            1.887               0.583                   0.188
ITA           0.058        0.307            1.229               1.160                   1.662
```

### Excerpt 22

```
GER           0.113        0.228            0.755               2.055                   2.053
HKG           0.193        0.425            1.887               0.583                   0.188
ITA           0.058        0.307            1.229               1.160                   1.662
JPN           0.140        0.285            1.321               1.378                   0.784
```

### Excerpt 23

```
HKG           0.193        0.425            1.887               0.583                   0.188
ITA           0.058        0.307            1.229               1.160                   1.662
JPN           0.140        0.285            1.321               1.378                   0.784
NLD           0.153        0.162            0.880               2.972                   1.581
```

### Excerpt 24

```
ITA           0.058        0.307            1.229               1.160                   1.662
JPN           0.140        0.285            1.321               1.378                   0.784
NLD           0.153        0.162            0.880               2.972                   1.581
NOR           0.126        0.355            0.371               6.938*                  5.284
```

### Excerpt 25

```
JPN           0.140        0.285            1.321               1.378                   0.784
NLD           0.153        0.162            0.880               2.972                   1.581
NOR           0.126        0.355            0.371               6.938*                  5.284
SIG           0.141        0.359            1.523               4.856                   3.938
```

### Excerpt 26

```
NLD           0.153        0.162            0.880               2.972                   1.581
NOR           0.126        0.355            0.371               6.938*                  5.284
SIG           0.141        0.359            1.523               4.856                   3.938
SPN           0.093        0.277            0.742               0.743                   0.111
```

### Excerpt 27

```
NOR           0.126        0.355            0.371               6.938*                  5.284
SIG           0.141        0.359            1.523               4.856                   3.938
SPN           0.093        0.277            0.742               0.743                   0.111
SWE           0.153        0.218            0.856               0.254                   1.377
```

### Excerpt 28

```
SIG           0.141        0.359            1.523               4.856                   3.938
SPN           0.093        0.277            0.742               0.743                   0.111
SWE           0.153        0.218            0.856               0.254                   1.377
SWT           0.127        0.202            0.874               0.032                   0.608
```

### Excerpt 29

```
SPN           0.093        0.277            0.742               0.743                   0.111
SWE           0.153        0.218            0.856               0.254                   1.377
SWT           0.127        0.202            0.874               0.032                   0.608
UKM           0.126        0.272            1.312               0.831                   1.619
```

### Excerpt 30

```
SWE           0.153        0.218            0.856               0.254                   1.377
SWT           0.127        0.202            0.874               0.032                   0.608
UKM           0.126        0.272            1.312               0.831                   1.619
USA           0.111        0.153            0.806               0.949
```

### Excerpt 31

```
SWT           0.127        0.202            0.874               0.032                   0.608
UKM           0.126        0.272            1.312               0.831                   1.619
USA           0.111        0.153            0.806               0.949
WLD           0.112        0.155            1.000
```

### Excerpt 32

```
UKM           0.126        0.272            1.312               0.831                   1.619
USA           0.111        0.153            0.806               0.949
WLD           0.112        0.155            1.000
```

### Excerpt 33

```
USA           0.111        0.153            0.806               0.949
WLD           0.112        0.155            1.000

* and ** denote statistical significance at the 5 and 1 percent levels, respectively.
```

### Excerpt 34

```
the lag length, k, to be equal to T 103 , or three for our sample with 28 price
observations. Table II reports the test results where all indexes are ex-
pressed in U.S. dollar terms, with the world index and the U.S. index serv-
ing as reference indexes. Critical values are obtained from Fuller ~1976!. It
```

### Excerpt 35

```
distribution using Monte Carlo simulation and compute the associated
p-values, as described in the Appendix.
   Table III reports the panel-test results. The point estimates of l are quite
sizable and the null hypothesis of no mean reversion can be rejected at the
```

### Excerpt 36

```
p-values, as described in the Appendix.
   Table III reports the panel-test results. The point estimates of l are quite
sizable and the null hypothesis of no mean reversion can be rejected at the
1 percent significance level based on the z l test using either reference index.
```

### Excerpt 37

```
Table II
Augmented Dickey–Fuller Tests for Mean Reversion of Stock Indexes
Single-equation augmented Dickey–Fuller test results are reported for mean reversion in stock
```

### Excerpt 38

```
where i 5 1, . . . , N. The superscript r denotes a reference index series. The null hypothesis is H 0 :
li 5 0 and the alternative hypothesis is H 1 : li . 0. The table reports the t-statistic defined as
lZ i0s~ lZ i !, where lZ i is the OLS estimate of li and s~ lZ i ! is the standard error of lZ i . The critical
values are obtained from Fuller ~1976!.
```

### Excerpt 39

```
Country                               World Reference Index                             U.S. Reference Index
AUS                                            1.667                                              2.562
AUT                                            1.784                                              2.327
BEL                                            1.354                                              1.750
```

### Excerpt 40

```
AUS                                            1.667                                              2.562
AUT                                            1.784                                              2.327
BEL                                            1.354                                              1.750
CAN                                            0.705                                             20.116
```

### Excerpt 41

```
AUT                                            1.784                                              2.327
BEL                                            1.354                                              1.750
CAN                                            0.705                                             20.116
DEN                                            3.763**                                            3.854**
```

### Excerpt 42

```
BEL                                            1.354                                              1.750
CAN                                            0.705                                             20.116
DEN                                            3.763**                                            3.854**
FRA                                            1.740                                              2.194
```

### Excerpt 43

```
CAN                                            0.705                                             20.116
DEN                                            3.763**                                            3.854**
FRA                                            1.740                                              2.194
GER                                            3.151*                                             3.569*
```

### Excerpt 44

```
DEN                                            3.763**                                            3.854**
FRA                                            1.740                                              2.194
GER                                            3.151*                                             3.569*
HKG                                            0.162                                              0.582
```

### Excerpt 45

```
FRA                                            1.740                                              2.194
GER                                            3.151*                                             3.569*
HKG                                            0.162                                              0.582
ITA                                            2.005                                              1.837
```

### Excerpt 46

```
GER                                            3.151*                                             3.569*
HKG                                            0.162                                              0.582
ITA                                            2.005                                              1.837
JPN                                            1.322                                              1.403
```

### Excerpt 47

```
HKG                                            0.162                                              0.582
ITA                                            2.005                                              1.837
JPN                                            1.322                                              1.403
NLD                                           20.307                                              1.222
```

### Excerpt 48

```
ITA                                            2.005                                              1.837
JPN                                            1.322                                              1.403
NLD                                           20.307                                              1.222
NOR                                            2.949                                              4.710**
```

### Excerpt 49

```
JPN                                            1.322                                              1.403
NLD                                           20.307                                              1.222
NOR                                            2.949                                              4.710**
SIG                                            2.177                                              1.796
```

### Excerpt 50

```
NLD                                           20.307                                              1.222
NOR                                            2.949                                              4.710**
SIG                                            2.177                                              1.796
SPN                                            1.863                                              2.083
```

### Excerpt 51

```
NOR                                            2.949                                              4.710**
SIG                                            2.177                                              1.796
SPN                                            1.863                                              2.083
SWE                                            0.754                                              1.490
```

### Excerpt 52

```
SIG                                            2.177                                              1.796
SPN                                            1.863                                              2.083
SWE                                            0.754                                              1.490
SWT                                            2.103                                              2.928
```

### Excerpt 53

```
SPN                                            1.863                                              2.083
SWE                                            0.754                                              1.490
SWT                                            2.103                                              2.928
UKM                                            1.244                                              1.408
```

### Excerpt 54

```
SWE                                            0.754                                              1.490
SWT                                            2.103                                              2.928
UKM                                            1.244                                              1.408
USA                                            1.888
```

### Excerpt 55

```
SWT                                            2.103                                              2.928
UKM                                            1.244                                              1.408
USA                                            1.888
Critical values
```

### Excerpt 56

```
UKM                                            1.244                                              1.408
USA                                            1.888
Critical values
  10 percent                                     2.63                                             2.63
```

### Excerpt 57

```
Critical values
  10 percent                                     2.63                                             2.63
   5 percent                                     3.00                                             3.00
   1 percent                                     3.75                                             3.75
```

### Excerpt 58

```
10 percent                                     2.63                                             2.63
   5 percent                                     3.00                                             3.00
   1 percent                                     3.75                                             3.75
```

### Excerpt 59

```
5 percent                                     3.00                                             3.00
   1 percent                                     3.75                                             3.75

* and ** denote statistical significance at the 5 and 1 percent levels, respectively.
```

### Excerpt 60

```
cent level. These results are in sharp contrast with those from the single-
equation test reported in Table II, where the null hypothesis of no mean
reversion can be rejected only for two to three countries, and demonstrate
the gains in power from pooling the data.
```

### Excerpt 61

```
Table III
              Panel Tests for Mean Reversion of Stock Prices
Panel-based estimation results are reported for stock price indexes relative to a reference index.
```

### Excerpt 62

```
Z is the
standard error of l.  Z The p-values are computed from 5,000 Monte Carlo replications. The median-
unbiased estimate of l is the estimate of l corrected for small-sample bias. The small-sample
bias under the alternative hypothesis that l . 0, as well as its 90 percent confidence interval,
```

### Excerpt 63

```
bias under the alternative hypothesis that l . 0, as well as its 90 percent confidence interval,
are estimated from Monte Carlo simulation with 5,000 replications. The half-life is calculated
as ln~102!0ln~1 2 l!, where l takes the median-unbiased estimate.
```

### Excerpt 64

```
World Reference Index                U.S. Reference Index
Point estimate of l                                        0.274                               0.292
zl                                                         7.407                               7.894
p-value                                                    0.002                               0.000
```

### Excerpt 65

```
Point estimate of l                                        0.274                               0.292
zl                                                         7.407                               7.894
p-value                                                    0.002                               0.000
tl                                                        11.431                              11.277
```

### Excerpt 66

```
zl                                                         7.407                               7.894
p-value                                                    0.002                               0.000
tl                                                        11.431                              11.277
p-value                                                    0.044                               0.022
```

### Excerpt 67

```
p-value                                                    0.002                               0.000
tl                                                        11.431                              11.277
p-value                                                    0.044                               0.022
Median-unbiased estimate of l                              0.182                               0.202
```

### Excerpt 68

```
tl                                                        11.431                              11.277
p-value                                                    0.044                               0.022
Median-unbiased estimate of l                              0.182                               0.202
90 percent confidence interval of l                   @0.110, 0.250#                      @0.135, 0.270#
```

### Excerpt 69

```
p-value                                                    0.044                               0.022
Median-unbiased estimate of l                              0.182                               0.202
90 percent confidence interval of l                   @0.110, 0.250#                      @0.135, 0.270#
Implied half-life ~years!                                  3.5                                 3.1
```

### Excerpt 70

```
Median-unbiased estimate of l                              0.182                               0.202
90 percent confidence interval of l                   @0.110, 0.250#                      @0.135, 0.270#
Implied half-life ~years!                                  3.5                                 3.1
```

### Excerpt 71

```
90 percent confidence interval of l                   @0.110, 0.250#                      @0.135, 0.270#
Implied half-life ~years!                                  3.5                                 3.1
```

### Excerpt 72

```
ulation described in the Appendix. The calculated median-unbiased esti-
mates of l equal 0.182 for the world reference index with a 90 percent
confidence interval of ~0.110, 0.250!, and equal 0.202 for the U.S. reference
index with a 90 percent confidence interval of ~0.135, 0.270!. These median-
```

### Excerpt 73

```
mates of l equal 0.182 for the world reference index with a 90 percent
confidence interval of ~0.110, 0.250!, and equal 0.202 for the U.S. reference
index with a 90 percent confidence interval of ~0.135, 0.270!. These median-
unbiased estimates of l imply a half-life of 3.5 years for the world reference
```

### Excerpt 74

```
confidence interval of ~0.110, 0.250!, and equal 0.202 for the U.S. reference
index with a 90 percent confidence interval of ~0.135, 0.270!. These median-
unbiased estimates of l imply a half-life of 3.5 years for the world reference
index case and 3.1 years for the U.S. reference index case.10
```

### Excerpt 75

```
index with a 90 percent confidence interval of ~0.135, 0.270!. These median-
unbiased estimates of l imply a half-life of 3.5 years for the world reference
index case and 3.1 years for the U.S. reference index case.10
  It is interesting to compare our results with those of Cutler et al. ~1991!,
```

### Excerpt 76

```
the logarithm of the dividend-price ratio as the fundamental Pt*i. They find
a speed of reversion of 0.14 on average, below our estimates of 0.27 and 0.29.
When the speeds of reversion are constrained to be equal across all 13 coun-
tries, they obtain a value of 0.16. Their estimates of the speed of reversion
```

### Excerpt 77

```
When the speeds of reversion are constrained to be equal across all 13 coun-
tries, they obtain a value of 0.16. Their estimates of the speed of reversion
imply a half-life between 4.0 and 4.6 years. We find stronger evidence of
```

### Excerpt 78

```
tries, they obtain a value of 0.16. Their estimates of the speed of reversion
imply a half-life between 4.0 and 4.6 years. We find stronger evidence of

  10
```

### Excerpt 79

```
and Japan!, one from each geographical region, and find that the test results are robust, with
a half-life of 3.1 years when Australia is the reference index and 2.7 years when the other two
countries are the reference indexes. Detailed results are available from the authors upon request.
```

### Excerpt 80

```
mean reversion in this study with a half-life roughly one year shorter, which
we believe results partly from the fact that we estimate our equation ~4!
rather than equation ~1!, thereby avoiding the need for the necessarily im-
```
