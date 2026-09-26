# Do Investors Overvalue Firms with Bloated Balance Sheets? — Hirshleifer, Hou, Teoh & Zhang (2004) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Do investors overvalue firms with bloated balance sheets? |
| **Authors** | David Hirshleifer; Kewei Hou; Siew Hong Teoh; Yinglei Zhang — Fisher College of Business, Ohio State |
| **Journal** | *Journal of Accounting and Economics* 38 (2004) 297–331 |
| **Received / Accepted** | 3 Mar 2003 / 13 Oct 2004; online 25 Dec 2004 |
| **DOI** | 10.1016/j.jacceco.2004.10.002 |
| **Sample** | NYSE/Amex/NASDAQ ∩ Compustat∩CRSP; **July 1964 – December 2002** (462 months); up to **1,625,570** firm-months with NOA, accruals, size, B/M |
| **Original PDF** | `AbnormalReturnsAccrual_Hirshleifer_2004.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsRXBNRHJYMVkxV2M` |
| **Extraction** | Drive `read_file` (~1,601 lines). Clean text; some PDF ligature artifacts. |

Corresponding: Siew Hong Teoh. Conference trail: JAE 2003 Kellogg; NBER BF 2004; AAA 2004; EFA Maastricht 2004.

---

## Problem / Motivation

Limited attention (Fiske–Taylor; Libby et al.; Hirshleifer–Teoh 2003) implies investors overweight salient earnings and underweight less salient cash information. **Net operating assets (NOA)** equals cumulative operating income minus cumulative free cash flow—the balance-sheet measure of “bloat”:
$$
\mathrm{NOA}_T=\sum_{t=0}^{T}\mathrm{Operating\ Income}_t-\sum_{t=0}^{T}\mathrm{Free\ Cash\ Flow}_t.
$$
Equivalently,
$$
\mathrm{NOA}_T=\sum \mathrm{Operating\ Accruals}_t+\sum \mathrm{Investment}_t.
$$
High scaled NOA signals unsustainable past accounting performance. If investors neglect that signal, high-NOA firms are overpriced and earn low subsequent abnormal returns—the **sustainability effect**.

NOA is a more complete mispricing proxy than single-period accruals (Sloan 1996) or one-year operating/investing accruals (Richardson et al.; Fairfield–Whisenant–Yohn) because it accumulates the full history of accounting-vs-cash deviations.

Earnings management (Barton–Simko 2002) is allowed but not required.

---

## Setup / Measurement

**Scaled NOA:**
$$
\mathrm{NOA}_t=\frac{\mathrm{Operating\ Assets}_t-\mathrm{Operating\ Liabilities}_t}{\mathrm{AT}_{t-1}}.
$$
Operating assets/liabilities exclude financial items (detailed in Table 1 notes of the paper).

**Accruals, earnings, cash flows** scaled by beginning total assets (Sloan-style).

**Returns:** monthly; ≥4-month gap after fiscal year-end before using NOA. Characteristic benchmarks: Daniel–Grinblatt–Titman–Wermers 125 size×B/M×momentum portfolios (EW vs EW, VW vs VW). Also CAPM, FF3, Carhart-4 alphas on hedge returns.

**Table 1 NOA deciles:** median NOA from ~0.26 (D1) to ~1.45 (D10) of lagged assets; mean NOA path 0.247 → 1.596 across deciles. Earnings rise with NOA (median 0% → 13.6%); accruals −9.1% → +13.4% median; cash flows non-monotonic but D10 especially low CFO. Extreme deciles smaller/growth-tilted; M&A more common in high NOA (robustness drops |M&A|>10% AT).

**Table 2 correlations:** NOA persistent (Spearman with lag 0.620); positively related to accruals (0.324 Spearman); mixed Pearson/Spearman with earnings/CFO due to outliers—trim aligns signs.

**Table 3 industries:** extremes over-weight durables, computers, retail, services; D1 heavy pharma/financials; D10 heavier extractive/utilities. Industry-demeaned NOA still works (see also Zhang 2004).

---

## Results with Numbers

### Earnings/return dynamics (Figure 1)
High-NOA firms: rising earnings into ranking year, then **decline**. Low-NOA: mirror image. Raw returns: high NOA earns ~**45%** in year −1 then **<5%** in year +1; low NOA switches from poor to strong. Gap persists to year +5.

### Table 4 — Abnormal returns by NOA decile

**EW characteristic-adjusted:**
| Horizon | Hedge L−H | *t* |
|---------|-----------|-----|
| t+1 | **1.24%/mo** | **10.31** |
| t+2 | **0.83%** | **7.66** |
| t+3 | **0.57%** | **5.44** |

**VW characteristic-adjusted t+1:** hedge **0.69%/mo** (*t*=5.24).

Raw EW hedge t+1: **1.48%** (*t*=8.45). CAPM/FF3/Carhart intercepts on hedges remain highly significant (EW Carhart t+1 α **1.26%**, *t*=10.08; VW Carhart **0.61%**, *t*=4.70).

**Sharpe ratios (EW char-adj hedge):** t+1 **1.66**; t+2 **1.23**; t+3 **0.88**. VW: 0.84 / 0.70 / 0.60. Benchmarks over sample: MKT 0.36, SMB 0.22, HML 0.48, MOM 0.77.

Short side stronger: high-NOA adj returns −0.73/−0.54/−0.30% vs low-NOA +0.51/+0.29/+0.27% in years 1–3. But long-only in bottom five NOA deciles still profitable—unlike pure accruals long-only in this sample.

NOA hedge beats operating-accruals hedge by ~**88%** in year 1 and ~**138%** in year 3 (EW). Profitable in **35/38** years; strongest 1999 but robust to dropping 1999; remains strong in 2000 downturn. Beats accruals in 28/38 years EW; dominates accruals in 2000–2002 when accruals lost money.

### Fama–MacBeth controls
NOA remains highly significant after size, B/M, monthly reversal, momentum, long-run reversal, and **current accruals**. Financing decomposition: Equity, Debt, and −Cash components of NOA all predict returns—financing invested in operating assets (not held as cash) drives overoptimism. Robust to excluding equity issuance >10% AT and M&A >10% AT (not new-issues puzzle alone).

### Flow vs stock
NOA survives controls for last three years’ operating accruals sum and for latest ΔNOA (Fairfield et al.). When NOA enters, ΔNOA loses significance—**cumulative** bloat matters, not only the latest change. Cumulative investment (NOA’s orthogonal piece vs cumulative accruals) contributes.

### Mishkin test (Table 8; 1965–2000; 130,468 firm-years after filters)
Forecast equation vs pricing equation for Earnings_{t+1}:
- Rational weight on NOA $g_2=−0.004$ (*t*=−0.57) ≈0
- Market weight $g_2^*=0.043$ (*t*=3.10) **too positive**
- Efficiency test $g_2=g_2^*$: *t*=**4.18**; fails in 28/36 years
- Accruals overweighting marginal once NOA included (*t*=1.82)
- Cash flows underweighted (*t*=−4.18)

Investors treat NOA as if it forecasts higher earnings when the rational weight is ~0—direct evidence of overoptimism about sustainability.

---

## Limitations

Characteristic adjustment debates (risk vs mispricing). Mishkin needs trimming in some years (sensitivity noted; Kothari–Sabino–Zach concerns). NOA construction requires careful operating vs financial classification. Short-side locates for high-NOA names. Sample ends 2002—post-period decay possible after publication. Industry composition varies; use industry adjustment for some mandates. Interaction of NOA with single-year accruals nonlinear (left for future work in paper).

---

## Practical Takeaways for a Quant Investor

1. Trade **scaled NOA** as a multi-year sustainability / bloat factor—stronger and longer-lived than Sloan accruals.
2. EW hedge SR **1.66** in year 1 is exceptional; VW still SR **0.84**.
3. Prefer NOA over ΔNOA or single-year accruals when forced to choose one balance-sheet signal.
4. Long-only: underweight top NOA deciles / overweight bottom five—works without shorting.
5. Not subsumed by issuance or M&A screens—keep those as separate overlays if desired.
6. Combine with CbOP (Ball et al. 2015): NOA is stock/cumulative; CbOP is cash operating flow—likely complementary.
7. Monitor annual profitability of NOA hedge (35/38 years historically); 1999 was huge but not sole driver.
8. Accounting policy angle: make cumulative cash vs earnings deviations more salient (authors’ disclosure recommendation).

---

## Mechanism Detail

High NOA can come from high cumulative accruals (e.g., lingering receivables, low deferred revenue) and/or high cumulative investment (empire building, replacement of obsolete assets, capitalization of soft spending). Investors who fixate on earnings miss the incremental bad news in weak cumulative FCF. Equation (2) splits NOA into (earnings before Dep − CFO) + (Investment − Depreciation)—both pieces are accounting-vs-cash wedges. Selecting on high NOA loads both dark sides relative to optimistic investor forecasts.

## Relation to Accrual Anomaly

Sloan accruals ≈ one period’s operating accrual flow. NOA ≈ capitalized history of accruals + investment. Empirically NOA hedge ≫ accruals hedge and lasts through year 3. FM tests show incremental power. Mishkin shows NOA overweighting is not just accruals overweighting.

## Desk Recipe

1. Each month, take latest NOA with ≥4 months since FYE.
2. Scale by lagged AT; rank into deciles (NYSE breaks optional).
3. Long D1–D2, short D9–D10 (or long-only underweight D10).
4. Characteristic-neutralize or factor-hedge size/B/M/mom.
5. Hold with annual fundamental refresh; expect multi-year decay path (1.24 → 0.83 → 0.57% monthly).
6. QA targets: EW char-adj hedge t+1 ≈ 1.24% (*t*≈10); SR≈1.66.

## Scholar Tags

`NOA`, `balance-sheet-bloat`, `sustainability-effect`, `limited-attention`, `accruals`, `Mishkin`, `1964-2002`, `JAE`.

## Expanded Table 4 Numerical Tour

Equal-weighted raw returns decline almost monotonically from 1.79 percent per month in the lowest NOA decile to 0.31 percent in the highest in year t+1. Characteristic-adjusted returns fall from plus 0.51 percent to minus 0.73 percent. The hedge of 1.24 percent with t-statistic 10.31 is among the strongest monthly anomaly hedges in the accounting literature. Value-weighted adjusted hedges of 0.69 percent (t equals 5.24) show the effect survives capacity weighting, though attenuated. Factor-model intercepts on the hedge—CAPM 1.27 percent, three-factor 1.34 percent, four-factor 1.26 percent for EW adjusted—demonstrate that loadings on MKT/SMB/HML/MOM do not explain the profitability. The pattern repeats at t+2 and t+3 with slopes decaying but remaining highly significant, matching the sustainability story’s multi-year correction path rather than a one-quarter PEAD-style burst.

Year-by-year EW profits are positive in thirty-five of thirty-eight years, with pre-1973 the main weak period and 1999 the strongest—yet removing 1999 leaves the conclusion intact, and 2000’s bear market still shows strong NOA profits while accruals strategies failed. That crisis performance is particularly relevant for allocators worried that bloat strategies are bull-market artifacts.

## Mishkin Economics

The near-zero rational weight on NOA for one-year-ahead earnings reflects offsetting forces: high-NOA firms are high-earnings firms cross-sectionally, but they experience earnings declines time-series-wise after the ranking date. Investors’ weight of plus 0.043 ignores the sustainability decline and treats NOA as good news. The efficiency rejection with t equals 4.18, failing in twenty-eight of thirty-six years, is stronger than the residual accruals inefficiency once NOA is in the system. This is the cleanest direct test that the return predictability connects to earnings-expectation errors, not only to abstract risk.

## Financing Identity Insight

Because NOA equals equity issuance plus net debt minus cash (operating side = financing side), the predictive power of NOA can be read as: external finance predicts low returns mainly when it is deployed into operating assets rather than parked in cash. That refines the new-issues puzzle and links to investment-based anomalies (Titman–Wei–Xie; Cooper–Gulen–Schill asset growth) under a single balance-sheet umbrella.

## Portfolio Construction Notes for Long-Only Mandates

Significant positive abnormal returns in the five lowest NOA portfolios in years t+1 and t+2 imply that a long-only manager can harvest much of the effect by excluding high-NOA names and overweighting low-NOA names without shorting. Combined with industry neutralization, this becomes a practical “anti-bloat” quality screen. Pairing with cash-based operating profitability (Ball et al. 2015) and composite FM expected returns (Lewellen 2015) yields a coherent accounting-based expected-return stack: flow cash profitability, stock cumulative bloat, and multi-characteristic FM composites.

## Limitations Expanded

Scaling choice (lagged AT vs other deflators) is tested as robust in the paper but should be re-validated in each dataset. Operating versus financial asset classification errors can mis-measure NOA for complex holdcos and financial subsidiaries—another reason some desks industry-adjust or exclude financials. The Mishkin test’s trimming, while necessary for estimator stability in a few years, invites debate; triangulate with the portfolio and FM evidence that need no trimming. Post-2002 out-of-sample performance is an open empirical question for the Scholar pipeline’s later refresh.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.


### Additional synthesis paragraph
The sustainability effect says that balance sheets accumulate the history of earnings–cash deviations, and limited-attention investors do not fully use that history. Empirically, scaled NOA delivers monthly characteristic-adjusted hedges of 1.24 percent, 0.83 percent, and 0.57 percent over the first three years with Sharpe ratios that beat the market, SMB, HML, and even momentum in year one. It dominates the accruals anomaly in magnitude, horizon, and early-2000s performance. Mishkin tests confirm the mechanism runs through overoptimistic earnings expectations. For quantitative investors, NOA belongs in the core accounting anomaly set alongside Sloan accruals and cash-based operating profitability, implemented with a four-month reporting lag, characteristic neutralization, and a multi-year holding mindset.
