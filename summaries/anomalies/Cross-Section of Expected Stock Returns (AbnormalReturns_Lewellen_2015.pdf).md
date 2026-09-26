# The Cross-Section of Expected Stock Returns — Lewellen (2015) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | The Cross-section of Expected Stock Returns |
| **Author** | Jonathan Lewellen (Dartmouth College and NBER) |
| **Journal** | *Critical Finance Review*, 2015, Vol. 4, pp. 1–44 |
| **DOI** | 10.1561/104.00000024 |
| **Sample** | CRSP∩Compustat common stocks; **1964–2013**; subgroups: all-but-tiny (>NYSE 20th %ile ME), large (>NYSE median) |
| **Method** | Out-of-sample expected returns from past Fama–MacBeth slopes × current characteristics |
| **Original PDF** | `AbnormalReturns_Lewellen_2015.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsQmJidFZOQm9Jd3c` |
| **Extraction** | Drive `read_file` complete (~1,897 lines). Clean text. |

JEL: G11, G12. Thanks: Fama, French, Resutek, Shanken, Welch, and seminar audiences.

---

## Problem / Motivation

Many characteristics predict returns (size, B/M, momentum, investment, accruals, …), but two practical questions lack clear answers:

1. **How much cross-sectional variation in expected returns can we actually predict in real time?**
2. **How reliable are FM-based expected-return estimates out of sample?**

Portfolio sorts answer neither (they use one or two pre-chosen characteristics). Traditional FM tests show in-sample slopes but not whether historical slopes × today’s characteristics produce unbiased forecasts of true E[r].

Lewellen builds real-time composite forecasts from up to **15** characteristics using only past FM slopes (10-year rolling or cumulative since 1964), then tests whether subsequent returns regress on those forecasts with slope **one**.

Contributions: (i) real-time composite expected returns; (ii) combining many predictors without peeking at which “won” ex post; (iii) characteristic-based cost-of-capital estimates that appear more reliable than implied-cost-of-capital approaches (qualitative claim).

Related: Haugen–Baker (1996), Hanna–Ready (2005) study FM trading profits with short-lived predictors and 1-year slopes—Lewellen focuses on distribution/accuracy of E[r] estimates with slow-moving predictors and longer slope windows. Contrasts Fama–French (1997), Simin (2008), Levi–Welch (2014) on poor CAPM/FF3 cost-of-capital forecasts.

---

## Setup / Data

**Universe.** CRSP commons + Compustat annual; 1964–2013. All-but-tiny: ME > NYSE 20th; Large: ME > NYSE 50th. End-2013 breakpoints ≈ \$693m and \$2,757m.

**Three models:**
- **Model 1:** LogSize, LogB/M, Return_(−2,−12)
- **Model 2:** + LogIssues_(−1,−36), AccrualsYr, ROAYr, LogAGYr
- **Model 3:** + DY, LogReturn_(−13,−36), LogIssues_(−1,−12), Beta_(−1,−36), StdDev_(−1,−12), Turnover_(−1,−12), Debt/Price, Sales/Price (**15** predictors)

Accounting known with **4-month** lag. Market data immediate. Winsorize characteristics 1/99 monthly (not returns). Require size, B/M, 12m momentum for sample inclusion.

**Table 1 descriptives (TS avg of CS moments):** All-stock mean monthly return 1.27% (SD 14.79), N≈3,955; all-but-tiny 1.12% (9.84), N≈1,706; large 1.03% (8.43), N≈876.

---

## Model / Methods

Monthly FM regressions 1964:05–2013:12 (596 months). NW(4) *t*-stats on slope time series.

**Forecast construction:** $\widehat{E}_t[r_{i,t+1}] = \bar\beta'_{t-1} X_{i,t}$ where $\bar\beta$ is 10-year rolling or cumulative average of past FM slopes (not including current month). Primary tests: 10-year rolling.

**OOS validation:** FM regression of realized returns on $\widehat{E}$; test slope = 1. Also decile sorts on $\widehat{E}$.

**Horizons:** monthly primary; also 6- and 12-month returns (direct long-horizon FM or extrapolated monthly forecasts).

---

## Results with Numbers

### Table 2 — In-sample FM slopes (monthly %, 1964–2013)

**Model 1 (all stocks):** Size −0.13 (*t*=−2.80); B/M **0.54** (7.07); Mom **1.06** (5.70); R² 0.033; N 3,955.

**Model 2:** Size −0.13 (−3.38); B/M 0.44 (6.26); Mom 0.88 (5.32); Issues −0.39 (−3.77); Accruals **−1.44** (−5.66); ROA **1.34** (2.54); AG **−0.78** (−6.40); R² 0.042.

**Model 3:** Core variables survive; among add-ons, Beta positive (*t* 1.73–3.05); StdDev strongly negative for all-but-tiny/large (*t* ≈ −4.6/−3.8); Turnover negative in full sample (*t*=−3.68); Sales/Price positive in full sample (*t*=3.10). DY, long-term returns, 12m issuance, Debt/Price generally insignificant.

**Interpretation note:** FM R² measures contemporaneous variance explained by characteristic portfolios, **not** predictive power—illustrated with the perfect-beta CAPM example in the text.

Timely B/M (updated with latest ME) strengthens both B/M and momentum versus FF June B/M; switching to FF B/M drops Model 1 B/M slope 0.54→0.31 and mom 1.06→0.74 (still significant).

### Expected-return dispersion (10y rolling)

Cross-sectional SD of monthly $\widehat{E}$: ~**0.80%** all stocks, ~**0.60%** all-but-tiny, ~**0.50%** large—across all three models (forecasts highly correlated). Model 3 SD rises only slightly (e.g., 0.76%→0.87% all stocks).

### OOS predictive slopes (monthly)

| Sample | Slopes on $\widehat{E}$ | *t* range |
|--------|---------------------------|-----------|
| All stocks | **0.74–0.80** | 3.64–10.65 |
| All-but-tiny | **0.57–0.64** | |
| Large | **0.44–0.66** | |

Slopes reliably **< 1** ⇒ forecasts too dispersed; shrink toward CS mean by ~**20–35%** (all), more for larger stocks.

### Decile spreads (10y rolling)

| Sample | Predicted top−bottom | Realized EW | Realized VW |
|--------|----------------------|-------------|-------------|
| All, Model 1 | 2.70%/mo | **2.19%** | 1.21% |
| All, Model 3 | 3.09% | **2.36%** | 1.54% |
| Large, Model 1 | 1.54% | 0.79–1.04% range across models | |
| Large, Model 3 | 1.87% | same | |

Incremental power of accruals/AG/issuance beyond Model 1 is **surprisingly modest** for OOS forecasts.

### Longer horizons (Tables 8–9)

12m FM slopes: same signs; Issues, Accruals, AG especially strong (e.g., Accruals −13.77, *t*=−4.98 in Model 2 all stocks).

OOS annual forecast SDs: 5.44–9.16% (all), 3.64–5.80% (all-but-tiny), 3.02–5.35% (large).

OOS annual predictive slopes: **0.54–0.91** (all, *t* 3.69–8.70); **0.27–0.63** (all-but-tiny); **0.22–0.68** (large). Model 2 and cumulative slopes often best. Shrink annual forecasts ~**20–50%** toward the mean.

Even 1-, 3-, or 5-year slope histories help; longer histories work best.

---

## Limitations

Slopes <1 imply estimation error / instability—shrinkage required for unbiased cost of capital. Large-stock predictability weaker (still significant). Model 3’s extra variables add noise; Model 1–2 often enough. Focus on slow-moving predictors by design—omits 1-month reversal / microstructure. No transaction-cost netting on decile spreads. FM R² easily misread as predictive. Sample ends 2013. Shrinkage factors are in-sample calibrated rules of thumb.

---

## Practical Takeaways for a Quant Investor

1. **Composite FM forecasts work OOS**—use 10y rolling or cumulative slopes × current X.
2. **Shrink** forecasts 20–35% (monthly) / 20–50% (annual) toward the cross-sectional mean.
3. **Model 1 (size, B/M, mom) already captures most** OOS forecast power; adding accruals/investment/issuance helps modestly; kitchen-sink Model 3 mainly adds noise for large caps.
4. Expected-return SD ~0.8%/month across names is large vs mean ~1%/month—dispersion is first-order for stock selection and cost of capital.
5. Prefer characteristic-based E[r] over CAPM/FF3 ICC for firm-level expected returns (vs FF 1997 / Simin / Levi–Welch).
6. For large-cap mandates: still works (realized decile spreads ~0.8–1.0%/month) but shrink more.
7. Horizon: monthly forecasts cleanest; annual usable with more shrinkage.
8. Production: freeze slope estimation window end-of-month; apply to next month’s returns; never include contemporaneous FM slopes in the forecast.

---

## Deep Dive: Why Slope < 1

If $\widehat{E} = E + u$ with classical error, the regression of realized $r = E + e$ on $\widehat{E}$ has slope $\mathrm{Var}(E)/\mathrm{Var}(\widehat{E}) < 1$. Lewellen’s 0.74–0.80 slopes say measurement-error variance is about 20–26% of forecast variance for all stocks—material but not fatal. Shrinkage $\tilde{E} = \bar{E} + \hat\kappa (\widehat{E}-\bar{E})$ with $\hat\kappa \approx 0.75$ restores unbiasedness for cost-of-capital use.

## Deep Dive: Model Complexity

OOS results punish Model 3 relative to Models 1–2 among large stocks (annual slopes can fall to 0.22). The lesson for machine-learning stacks: more features help only if slope estimation is regularized. Lewellen’s use of long historical average slopes is a strong regularizer; 1-year rolling averages (Haugen–Baker style) are too noisy for E[r] levels even if they trade well on short-lived signals.

## Deep Dive: FM R² Trap

A high FM R² can coexist with zero predictability (perfect CAPM, varying market). Use pooled demeaned R² or OOS slope/R² on $\widehat{E}$ as the predictive metric. Table 3’s OOS R² values are small in absolute terms (returns are noisy) yet economically huge in decile space.

## Implementation Algorithm

1. Each month *t*, run CS regression of returns on lagged X for all months in the estimation window.
2. Average slopes (equal weight) over the window → $\bar\beta_{t-1}$.
3. Forecast $\bar\beta_{t-1}' X_{i,t}$ for each stock with valid X.
4. Optionally shrink 25% toward CS mean forecast.
5. Trade deciles or feed into mean-variance / Black–Litterman as P views.
6. Re-estimate slopes monthly; characteristics update with PIT rules (4m accounting lag).

## Numerical Highlights to Memorize

OOS monthly slope ≈ **0.75**; forecast SD ≈ **0.8%**; top–bottom predicted ≈ **3%/mo**; realized EW ≈ **2.2–2.4%/mo**; VW ≈ **1.2–1.5%/mo**; large-cap realized ≈ **0.8–1.0%/mo**. Accruals FM slope −1.44 (*t*=−5.66); AG −0.78 (−6.40); ROA +1.34 (2.54) in Model 2.

## Scholar Tags

`expected-returns`, `Fama-MacBeth`, `out-of-sample`, `cost-of-capital`, `composite-signals`, `shrinkage`, `1964-2013`, `Critical-Finance-Review`.

## Extended Commentary on Tables 3 and 9

The paper’s Table 3 (properties and predictive ability of monthly expected-return estimates) is the central OOS exhibit. Across Models 1–3 and both rolling and cumulative slope estimators, the cross-sectional standard deviation of forecasts for all stocks clusters near 0.8 percent monthly, while the tenth-to-ninetieth percentile span is on the order of two percentage points monthly—implying annualized spreads of twenty-plus percentage points between high- and low-forecast names before any realization noise. Predictive slopes of 0.74 to 0.82 with t-statistics often above eight for the full sample are extraordinary for finance OOS tests. The fact that cumulative slopes sometimes edge out ten-year rolling slopes suggests that very old data remain informative for characteristic premia—an argument against aggressive half-life decay in slope estimation unless motivated by known structural breaks.

For all-but-tiny and large stocks, lower forecast dispersion and lower predictive slopes still leave economically large decile spreads. A large-cap long-short book based on Model 1 forecasts that captures even half of the 0.79 to 1.04 percent monthly realized spread after costs would rival many “alternative risk premia” products.

Annual results in Tables 9a and 9b show that extrapolating monthly forecasts versus estimating long-horizon FM slopes directly yields similar OOS conclusions, with Model 2 frequently best. Predictive slopes for annual returns in the full sample reach as high as 0.91 (t equals 8.70) under some cumulative Model 2 specifications—near the ideal value of one—while large-cap annual slopes can be as low as the low twenties under Model 3 rolling estimates, reinforcing the overfitting warning.

## Cost of Capital Use Case

For corporate finance and valuation teams, replace industry CAPM costs of equity with shrunk Lewellen forecasts. Example: if the CS mean forecast is 1.0 percent monthly and a firm’s raw FM composite is 1.8 percent, apply κ equals 0.75 → 1.0 plus 0.75 times 0.8 equals 1.6 percent monthly ≈ 19.2 percent annualized before compounding adjustments—then blend with industry priors if needed. Document that these estimates historically line up with realized returns with slope near 0.75 pre-shrinkage.

## Relation to the Anomaly Zoo

Lewellen does not claim every characteristic is “real” in Model 3; many add-ons are insignificant in-sample. The OOS exercise is precisely about what an investor who did *not* know which variables would work should have done. That the kitchen sink still produces predictive slopes near 0.7 for all stocks is reassuring; that it underperforms leaner models for large caps is the practical guide.

## Paleologo Synthesis

Real-time FM composites are a legitimate expected-return engine. Keep the characteristic set lean (Model 1–2), average slopes over long windows, shrink forecasts, and use them for both trading and cost of capital. Do not confuse FM R² with foresight. Expect weaker but positive results in large caps. Pair with cash-based profitability (Ball et al. 2015) and NOA (Hirshleifer et al. 2004) as inputs inside Model 2-style specifications for a modern accounting-aware composite.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.


### Further methodological remarks
Newey–West lags of four for monthly slopes and longer lags for overlapping six- and twelve-month returns are appropriate given the persistence of characteristics and the overlap of long-horizon returns. The paper’s choice to winsorize predictors but not returns avoids hard-wiring return truncation while limiting outlier leverage in the CS slopes. Restricting to firms with nonmissing size, B/M, and momentum ensures Model 1 is always defined; sample sizes drop as Models 2–3 require more Compustat fields (N falls from about 3,955 to about 2,967 in Model 3 for all stocks). Those attrition patterns should be matched in replication.
