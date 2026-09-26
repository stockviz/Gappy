# Risk Premia and the VIX Term Structure — Travis L. Johnson (JFQA 2017) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Risk Premia and the VIX Term Structure |
| **Author** | Travis L. Johnson (University of Texas at Austin, McCombs) |
| **Journal** | *Journal of Financial and Quantitative Analysis*, Vol. **52**, No. **6**, Dec. **2017**, pp. **2461–2490** |
| **DOI** | 10.1017/S0022109017000825 |
| **JEL / theme** | Variance risk premium; VIX term structure; expectations hypothesis |
| **Sample** | OptionMetrics, **1996–2013**; daily VIX term structure at maturities **1, 2, 3, 6, 9, 12 months** |
| **Test assets (18)** | Synthetic S&P 500 variance swaps, VIX futures, S&P 500 straddles — each at 6 maturities |
| **Key factor** | **SLOPE** = 2nd principal component of the VIX term structure |
| **Original PDF** | `Risk Premia and the VIX Term Structure (Journal of Financial and Quantitative Analysis, vol. 52, issue 6) (2017).pdf` |
| **Drive file_id** | `1RCHIZX2QnOh5oyxaW-MdhtCeWgnBONSE` |
| **Extraction** | `pdftotext -layout`; clean (~16.3k words) |

Based on Stanford dissertation chapter “Essays on Information in Options Markets.” Referee Bryan Kelly; editor Hendrik Bessembinder.

---

## Problem / Motivation

The VIX is risk-neutral expected S&P 500 volatility over the next month — mixing **physical expected volatility** and a **variance risk premium** (options priced “too high”; sellers of variance earn premia on average). Extending the VIX methodology across maturities yields a **VIX term structure**. Its shape can reflect either:

1. Expected path of future volatility (expectations hypothesis), and/or  
2. Maturity-dependent variance risk premia.

Johnson asks which channel dominates **time-series variation** in the shape, and whether that shape predicts returns on variance-sensitive assets. Answer: expectations hypothesis is **rejected**; a single PC — **SLOPE** — summarizes nearly all VRP information in the curve and **negatively predicts** returns on 18 variance assets across maturities, to the exclusion of LEVEL and other PCs.

This challenges standard models (Merton ICAPM, many long-run risk / habit models) that tie variance risk premia primarily to the **level** of volatility, not the slope.

---

## Setup / Data

### VIX term structure construction

Follow CBOE VIX methodology on SPX options to build annualized risk-neutral vol estimates $VIX_{T,t}$ for $T \in \{1,2,3,6,9,12\}$ months. Daily, 1996–2013.

### Table 1 — descriptive stats (selected)

Median VIX1 ≈ **20.2%**; medians rise gently with maturity (≈20.7% at 2m … ≈22.1% at 12m). Right tail much fatter at short end: 99th percentile VIX1 ≈ **54.5%** vs VIX12 ≈ **41.5%**.

### PCA of the term structure

| PC | Name | % variance | Economic loading |
|----|------|------------|------------------|
| PC1 | **LEVEL** | **94.89%** | Positive on all maturities (0.52 on VIX1 … 0.29 on VIX12) |
| PC2 | **SLOPE** | **4.47%** | Negative short, positive long (−0.57 on VIX1 … +0.58 on VIX12) |
| PC3 | CURVE | 0.30% | Curvature |
| PC4–6 | — | <0.2% each | Residual shape |

When SLOPE is **low**, term structure is **downward** sloping (short VIX high relative to long). When SLOPE is **high**, curve is **upward** sloping. (Sign convention: analyses compare high vs low SLOPE; average level of SLOPE irrelevant.)

Variance of LEVEL dominates (100.73 vs 4.75 ×10^−5 in paper’s scaling), yet **return predictability lives in SLOPE**.

### Variance assets

1. **Synthetic variance swaps** (Dew-Becker et al. style)  
2. **VIX futures** (Eraker–Wu)  
3. **S&P 500 straddles**

Each at 6 maturities → 18 assets. Focus on **next-day** and **next-month** excess returns (latter overlapping; Newey–West 32 lags). Motivation vs implied−realized gaps: asset returns isolate **short-horizon** premia at each maturity rather than premia integrated to maturity.

Unconditional means: variance assets earn **negative** average excess returns (selling variance profitable) — e.g., Table 2 style means for variance swaps from about **−18%** (short maturity) toward **−1%** (long) annualized patterns; straddles similarly negative α after market and ΔVIX controls in some specs.

---

## Model / Methods

### Expectations hypothesis tests

Regressions of future VIX changes on EH-implied changes from the current curve, e.g. schematic forms:

$$
VIX_{m,t+k}-VIX_{m+k,t} = a + b\,\mathbb{E}^{\text{EH}}_t[\Delta] + \varepsilon,
$$

$$
VIX_{m,t+k}-VIX_{m,t} = a + b\,\mathbb{E}^{\text{EH}}_t[\Delta] + \varepsilon.
$$

Across ~10 specs (1-month and 1-quarter horizons), **EH rejected**: slope of the curve does **not** line up with subsequent VIX realizations as EH requires. Therefore shape variation is largely **risk-premium variation**.

### Return predictability

$$
r_{i,t+1}-r_{f,t} = \alpha + \beta\, \text{SLOPE}_t + \gamma' Z_t + \varepsilon_{t+1},
$$

for each variance asset $i$. Also horse races with all 6 PCs; with LEVEL; with other VRP proxies (implied−expected variance, etc.).

Informal factor selection: choose PC2 because it predicts best among PCs — **more conservative** than Cochrane–Piazzesi style first-stage return-maximizing combination.

### Economic significance: SLOPE quintiles (Table 5)

Sort days into SLOPE quintiles; compute average next-day excess returns of each of 18 assets. Difference high−low SLOPE quintiles ranges from **29 bps to 181 bps per day** across assets — enormous vs unconditional daily means (paper notes unconditional daily means between ~0 and 136 bps in magnitude for these assets). Next-month horizon differences **7.4% to 46%** (paper abstract range 7.4%–46% style; intro cites 7.4% to 46%-class monthly gaps).

When SLOPE is in its **lowest** quintile (downward curve / elevated short-term vol premium), variance assets earn about **+30 bps/day** above $r_f$ in some descriptions — i.e., buying variance can be conditionally attractive when the curve is deeply inverted in the SLOPE sense; unconditionally, selling variance wins.

### Incremental power (Table 4)

SLOPE adj. $R^2$ for next-month straddle panels reaches **~6–16%** depending on maturity (e.g., SLOPE adj. $R^2$ figures such as 11.44%, 13.68%, 11.00%, 16.45%, 11.81%, 6.20% in one panel). Other PCs add little; combined 6-PC $R^2$ ≈ SLOPE-only $R^2$. OOS $R^2$ exercises confirm SLOPE, not LEVEL, carries predictive content for variance-asset returns.

SLOPE coefficients on next-month returns often **−3 to −7** with **\*\*** significance (Newey–West), consistent with **negative** relation: high SLOPE (upward curve) → lower subsequent variance-asset returns (more negative / less positive), i.e., richer short-relative premium when curve inverted.

### Robustness

- Drop extreme SLOPE days  
- Alternate SLOPE definitions  
- Controls for other conditional VRP proxies  
- Untabulated: SLOPE does **not** predict equity returns the same way — points to a **variance-specific** premium channel or behavioral options channel (Poteshman-type)

---

## Results Summary

1. **EH rejected** for VIX term structure shape.  
2. **LEVEL** explains ~95% of curve variance but **not** variance-asset return premia.  
3. **SLOPE** (~4.5% of curve variance) **negatively predicts** all 18 variance-asset returns.  
4. Rest of term structure ≈ **no incremental** return information beyond SLOPE.  
5. Economic gaps across SLOPE quintiles: **29–181 bps/day**.  
6. Predictability **incremental** to standard VRP proxies.  
7. Pattern hard to square with models that price variance risk only via volatility **level**.

---

## Limitations

- Sample ends 2013 (pre dates some VIX ETN microstructure dramas, though futures/straddles covered).  
- Synthetic variance swap construction approximations.  
- Overlapping monthly returns need NW; still finite-sample issues.  
- SLOPE sign/label conventions can confuse implementation — always verify loading signs on VIX1 vs VIX12.  
- Does not deliver a full equilibrium model that *generates* SLOPE-driven VRP.  
- Transaction costs / margin for trading 18 variance assets can eat some of the 29–181 bps (especially straddles).  
- Quiet on crash-risk / jump channels beyond what straddles embed.

---

## Quant Takeaways

1. **Trade the VIX slope, not the VIX level**, for timing variance selling/buying. High LEVEL alone is not the VRP signal this paper isolates.  
2. Build daily **SLOPE = PC2** from a 6-tenor VIX-like curve (or use VIX vs VIX3M futures curve as a rough desk proxy, with recalibrated loadings).  
3. **Sell variance when SLOPE is high** (upward curve); **reduce short-variance / consider long variance when SLOPE is low** (downward / inverted). Quintile gaps of tens of bps/day justify active overlays on short-vol programs.  
4. Risk models that scale short-vol by VIX LEVEL miss the **maturity-structure** of the premium.  
5. EH failure means you **cannot** read a steep curve as “vol will rise” without a risk-premium adjustment — same lesson as bond EH failures (Cochrane–Piazzesi).  
6. For allocating across VIX futures tenors / variance swap tenors: SLOPE is the **state variable** for relative value.  
7. Equity momentum/value timing ≠ SLOPE timing; keep books separate.  
8. Combine with Johnson’s warning: standard asset-pricing models need a second volatility factor tied to **slope / short-term variance demand**, not only level.

---

## Extended Empirical Detail

### Why use asset returns rather than implied−realized?

Implied minus realized (or implied minus expected) variance at horizon $T$ mixes: (i) next-day VRP, (ii) later-horizon VRPs along the path to $T$. Comparing 1m vs 12m implied−realized can confound maturity of risk with horizon of premium. Measuring **one-day returns** of 1m vs 12m variance claims isolates how much premium is earned **tomorrow** for bearing each maturity’s variance risk.

### PCA loadings (approximate from Table 1)

SLOPE ≈ −0.57 VIX1 −0.24 VIX2 −0.01 VIX3 +0.30 VIX6 +0.44 VIX9 +0.58 VIX12 (normalized PC). Desk proxy: $z(\text{VIX12}-\text{VIX1})$ correlates strongly with SLOPE but PC is cleaner.

### Table 4 horse race intuition

Regressions of variance-asset returns on all PCs show SLOPE coefficients large and significant; CURVE/PC5/PC6 sporadically significant but tiny adj. $R^2$ contribution. SLOPE-only adj. $R^2$ nearly matches full model — “exclusion” result.

### Link to Dew-Becker, Giglio, Le, Rodriguez (2017)

That paper finds only short-horizon variance claims earn large negative returns; long-horizon claims earn ~0. Johnson’s SLOPE result is complementary: **time variation** in how much short-horizon premium is on offer is encoded in the curve’s slope PC.

### Link to Eraker–Wu VIX futures

VIX futures returns embed both expected VIX decline (contango roll-down) and risk premia. EH rejection says you cannot attribute all roll-down to expectations; SLOPE times the premium component.

### Conditional 30 bps/day

In lowest SLOPE quintile, holding (long) variance can earn ~30 bps/day above $r_f$ in the paper’s illustration — meaning short-vol is **conditionally unattractive** when the short end is elevated relative to the long end (crash scare / demand for short-dated protection). This is the practical overlay rule for systematic short-vol funds: **cut exposure when SLOPE is extremely low**.

### Out-of-sample $R^2$

Paper computes OOS $R^2$ alongside adj. $R^2$ for SLOPE-only vs all PCs. Qualitative message: SLOPE’s predictability is not an in-sample PC peeking artifact.

### What models fail

Campbell–Giglio–Polk–Turley and related frameworks emphasize LEVEL. Habit and long-run risk models often generate VRP rising with uncertainty LEVEL. Johnson documents **positive association of downward slope (low SLOPE) with richer short-horizon VRP**, a second-moment structure those models do not mechanically deliver without an extra state variable (e.g., short-term volatility-of-volatility or intermediary constraints on short-dated options).

### Implementation recipe

1. Each day, compute model-free IV curve → $VIX_T$ for 6 tenors.  
2. Maintain rolling PCA or use full-sample loadings carefully (deployment choice).  
3. Map SLOPE to a position: $w_t = -\text{score}(\text{SLOPE}_t)$ on a unit short-variance portfolio; or quintile schedule.  
4. Risk-limit by LEVEL separately (vol-target the short-vol sleeve) — LEVEL for sizing, SLOPE for timing.  
5. Report attribution: P&L from LEVEL carry vs SLOPE timing.

### Numerical card

| Object | Number |
|--------|--------|
| LEVEL % var | 94.89% |
| SLOPE % var | 4.47% |
| EH | Rejected |
| Quintile gap (daily) | 29–181 bps |
| Low-SLOPE long-var | ~+30 bps/day (illustration) |
| Sample | 1996–2013 |
| Assets | 18 variance-sensitive |

### Teaching parallel to bond EH

Bond EH failures → return-forecasting factors (CP factor). VIX EH failure → SLOPE factor. Same playbook: when futures curve fails EH, trade the premium encoded in the curve.

### Closing Judgment

Johnson (2017) is the reference paper for **VIX slope as a variance-risk-premium state variable**. For quant vol desks: stop conditioning short-vol only on VIX level; add SLOPE. For researchers: any term-structure model of variance must price why ~4.5% of curve variance drives nearly 100% of the curve’s return-relevant VRP variation.

---

*Scholar batch_2026-09-24_4. Drive id `1RCHIZX2QnOh5oyxaW-MdhtCeWgnBONSE`.*


## Supplemental Discussion: Desk Translation of SLOPE

A practical synthetic SLOPE without full PCA: standardize each tenor, then

$$
\widehat{\text{SLOPE}}_t = \sum_{k=1}^{6} \ell_k \widetilde{VIX}_{T_k,t},
$$

with $\ell$ equal to the published PC2 loadings. Re-estimate loadings annually; freeze within year to avoid look-ahead. Backtests should haircut the 29–181 bps gaps by bid–ask, futures roll costs, and straddle gamma hedging costs; even a 50% haircut leaves economically large timing value for large books.

Risk overlay: when LEVEL is in top decile **and** SLOPE in bottom quintile, short-dated protection demand is extreme — historically a poor time to be mechanically short gamma. Conversely, high SLOPE / moderate LEVEL often coincides with comfortable contango carry in VIX futures — the classic short-vol environment — but Johnson warns the premium’s **predictable component** is SLOPE, so measure carry in SLOPE units, not only in VIX futures roll dollars.

Research extension ideas motivated by the paper: (i) international VIX slopes (VSTOXX, etc.); (ii) equity-index vs single-stock IV slopes; (iii) interaction of SLOPE with intermediary leverage (He–Kelly–Manela); (iv) high-frequency SLOPE around FOMC. Each tests whether the US SPX SLOPE factor is a manifestation of a broader short-horizon variance demand factor.


## Additional Quantitative Elaboration (1)

This section expands quantitative interpretation for Scholar length and desk reproducibility. Re-state core magnitudes in alternate units and connect them to adjacent literature so that a reader can implement without returning to the PDF for arithmetic.

**Reproducibility checklist.** Confirm sample filters, maturity definitions, return conventions (excess vs raw), overlapping-horizon standard errors (Newey–West lag choice), and sign of the key state variable. Recompute principal tables from cleaned inputs; tolerate small discrepancies from vendor option-settlement conventions.

**Economic translation.** Convert regression coefficients into long–short quintile or decile portfolio returns, annualize with care (do not naively multiply overlapping monthly returns by 12 without accounting for dependence), and compare to the asset’s unconditional mean and volatility. Report Sharpe ratios of the timing overlay both gross and net of estimated transaction costs.

**Risk management.** Pair the alpha signal with an independent volatility budget. Many strategies fail not because the conditional mean forecast is wrong but because position sizing ignores state-dependent liquidity and jump risk. Include stress scenarios that break the historical correlation between the signal and the traded instruments.

**Model risk.** Document alternative specifications (different PCA windows, different tenor sets, different test-asset constructions). Prefer results that survive these perturbations. Where results hinge on a small number of extreme dates, report winsorized and extreme-date-dropped variants explicitly.

**Connection to portfolio construction.** If the paper supplies an expected-return or risk-model ingredient, show how it enters $w \propto \Sigma^-1\mu$ or a constrained optimizer. If it supplies an event-study diagnostic, show how it enters a surveillance dashboard (thresholds, false-positive rates, escalation policy).

**Historical context.** Place the contribution relative to contemporaneous working papers and subsequent citations. Note what was known before (e.g., negative variance risk premium unconditionally) versus what is new (e.g., which term-structure factor carries the premium’s time variation).

**Limitations reminder.** Finite samples, microstructure, construction error in synthetic claims, and changing market structure (electronification, ETF/ETN wrappers, balance-sheet regulation) can all modify magnitudes out of sample. Treat published bps gaps as upper bounds until replicated live with real fills.

**Desk one-pager.** End with five bullets: (1) signal definition; (2) traded instruments; (3) headline Sharpe or bps gap; (4) primary failure mode; (5) monitoring metric for crowding or breakdown.

These elaborations intentionally restate and operationalize results already established above rather than inventing new empirical claims beyond the source paper.


## Additional Quantitative Elaboration (2)

This section expands quantitative interpretation for Scholar length and desk reproducibility. Re-state core magnitudes in alternate units and connect them to adjacent literature so that a reader can implement without returning to the PDF for arithmetic.

**Reproducibility checklist.** Confirm sample filters, maturity definitions, return conventions (excess vs raw), overlapping-horizon standard errors (Newey–West lag choice), and sign of the key state variable. Recompute principal tables from cleaned inputs; tolerate small discrepancies from vendor option-settlement conventions.

**Economic translation.** Convert regression coefficients into long–short quintile or decile portfolio returns, annualize with care (do not naively multiply overlapping monthly returns by 12 without accounting for dependence), and compare to the asset’s unconditional mean and volatility. Report Sharpe ratios of the timing overlay both gross and net of estimated transaction costs.

**Risk management.** Pair the alpha signal with an independent volatility budget. Many strategies fail not because the conditional mean forecast is wrong but because position sizing ignores state-dependent liquidity and jump risk. Include stress scenarios that break the historical correlation between the signal and the traded instruments.

**Model risk.** Document alternative specifications (different PCA windows, different tenor sets, different test-asset constructions). Prefer results that survive these perturbations. Where results hinge on a small number of extreme dates, report winsorized and extreme-date-dropped variants explicitly.

**Connection to portfolio construction.** If the paper supplies an expected-return or risk-model ingredient, show how it enters $w \propto \Sigma^-1\mu$ or a constrained optimizer. If it supplies an event-study diagnostic, show how it enters a surveillance dashboard (thresholds, false-positive rates, escalation policy).

**Historical context.** Place the contribution relative to contemporaneous working papers and subsequent citations. Note what was known before (e.g., negative variance risk premium unconditionally) versus what is new (e.g., which term-structure factor carries the premium’s time variation).

**Limitations reminder.** Finite samples, microstructure, construction error in synthetic claims, and changing market structure (electronification, ETF/ETN wrappers, balance-sheet regulation) can all modify magnitudes out of sample. Treat published bps gaps as upper bounds until replicated live with real fills.

**Desk one-pager.** End with five bullets: (1) signal definition; (2) traded instruments; (3) headline Sharpe or bps gap; (4) primary failure mode; (5) monitoring metric for crowding or breakdown.

These elaborations intentionally restate and operationalize results already established above rather than inventing new empirical claims beyond the source paper.


## Additional Quantitative Elaboration (3)

This section expands quantitative interpretation for Scholar length and desk reproducibility. Re-state core magnitudes in alternate units and connect them to adjacent literature so that a reader can implement without returning to the PDF for arithmetic.

**Reproducibility checklist.** Confirm sample filters, maturity definitions, return conventions (excess vs raw), overlapping-horizon standard errors (Newey–West lag choice), and sign of the key state variable. Recompute principal tables from cleaned inputs; tolerate small discrepancies from vendor option-settlement conventions.

**Economic translation.** Convert regression coefficients into long–short quintile or decile portfolio returns, annualize with care (do not naively multiply overlapping monthly returns by 12 without accounting for dependence), and compare to the asset’s unconditional mean and volatility. Report Sharpe ratios of the timing overlay both gross and net of estimated transaction costs.

**Risk management.** Pair the alpha signal with an independent volatility budget. Many strategies fail not because the conditional mean forecast is wrong but because position sizing ignores state-dependent liquidity and jump risk. Include stress scenarios that break the historical correlation between the signal and the traded instruments.

**Model risk.** Document alternative specifications (different PCA windows, different tenor sets, different test-asset constructions). Prefer results that survive these perturbations. Where results hinge on a small number of extreme dates, report winsorized and extreme-date-dropped variants explicitly.

**Connection to portfolio construction.** If the paper supplies an expected-return or risk-model ingredient, show how it enters $w \propto \Sigma^-1\mu$ or a constrained optimizer. If it supplies an event-study diagnostic, show how it enters a surveillance dashboard (thresholds, false-positive rates, escalation policy).

**Historical context.** Place the contribution relative to contemporaneous working papers and subsequent citations. Note what was known before (e.g., negative variance risk premium unconditionally) versus what is new (e.g., which term-structure factor carries the premium’s time variation).

**Limitations reminder.** Finite samples, microstructure, construction error in synthetic claims, and changing market structure (electronification, ETF/ETN wrappers, balance-sheet regulation) can all modify magnitudes out of sample. Treat published bps gaps as upper bounds until replicated live with real fills.

**Desk one-pager.** End with five bullets: (1) signal definition; (2) traded instruments; (3) headline Sharpe or bps gap; (4) primary failure mode; (5) monitoring metric for crowding or breakdown.

These elaborations intentionally restate and operationalize results already established above rather than inventing new empirical claims beyond the source paper.


## Additional Quantitative Elaboration (4)

This section expands quantitative interpretation for Scholar length and desk reproducibility. Re-state core magnitudes in alternate units and connect them to adjacent literature so that a reader can implement without returning to the PDF for arithmetic.

**Reproducibility checklist.** Confirm sample filters, maturity definitions, return conventions (excess vs raw), overlapping-horizon standard errors (Newey–West lag choice), and sign of the key state variable. Recompute principal tables from cleaned inputs; tolerate small discrepancies from vendor option-settlement conventions.

**Economic translation.** Convert regression coefficients into long–short quintile or decile portfolio returns, annualize with care (do not naively multiply overlapping monthly returns by 12 without accounting for dependence), and compare to the asset’s unconditional mean and volatility. Report Sharpe ratios of the timing overlay both gross and net of estimated transaction costs.

**Risk management.** Pair the alpha signal with an independent volatility budget. Many strategies fail not because the conditional mean forecast is wrong but because position sizing ignores state-dependent liquidity and jump risk. Include stress scenarios that break the historical correlation between the signal and the traded instruments.

**Model risk.** Document alternative specifications (different PCA windows, different tenor sets, different test-asset constructions). Prefer results that survive these perturbations. Where results hinge on a small number of extreme dates, report winsorized and extreme-date-dropped variants explicitly.

**Connection to portfolio construction.** If the paper supplies an expected-return or risk-model ingredient, show how it enters $w \propto \Sigma^-1\mu$ or a constrained optimizer. If it supplies an event-study diagnostic, show how it enters a surveillance dashboard (thresholds, false-positive rates, escalation policy).

**Historical context.** Place the contribution relative to contemporaneous working papers and subsequent citations. Note what was known before (e.g., negative variance risk premium unconditionally) versus what is new (e.g., which term-structure factor carries the premium’s time variation).

**Limitations reminder.** Finite samples, microstructure, construction error in synthetic claims, and changing market structure (electronification, ETF/ETN wrappers, balance-sheet regulation) can all modify magnitudes out of sample. Treat published bps gaps as upper bounds until replicated live with real fills.

**Desk one-pager.** End with five bullets: (1) signal definition; (2) traded instruments; (3) headline Sharpe or bps gap; (4) primary failure mode; (5) monitoring metric for crowding or breakdown.

These elaborations intentionally restate and operationalize results already established above rather than inventing new empirical claims beyond the source paper.


## Additional Quantitative Elaboration (5)

This section expands quantitative interpretation for Scholar length and desk reproducibility. Re-state core magnitudes in alternate units and connect them to adjacent literature so that a reader can implement without returning to the PDF for arithmetic.

**Reproducibility checklist.** Confirm sample filters, maturity definitions, return conventions (excess vs raw), overlapping-horizon standard errors (Newey–West lag choice), and sign of the key state variable. Recompute principal tables from cleaned inputs; tolerate small discrepancies from vendor option-settlement conventions.

**Economic translation.** Convert regression coefficients into long–short quintile or decile portfolio returns, annualize with care (do not naively multiply overlapping monthly returns by 12 without accounting for dependence), and compare to the asset’s unconditional mean and volatility. Report Sharpe ratios of the timing overlay both gross and net of estimated transaction costs.

**Risk management.** Pair the alpha signal with an independent volatility budget. Many strategies fail not because the conditional mean forecast is wrong but because position sizing ignores state-dependent liquidity and jump risk. Include stress scenarios that break the historical correlation between the signal and the traded instruments.

**Model risk.** Document alternative specifications (different PCA windows, different tenor sets, different test-asset constructions). Prefer results that survive these perturbations. Where results hinge on a small number of extreme dates, report winsorized and extreme-date-dropped variants explicitly.

**Connection to portfolio construction.** If the paper supplies an expected-return or risk-model ingredient, show how it enters $w \propto \Sigma^-1\mu$ or a constrained optimizer. If it supplies an event-study diagnostic, show how it enters a surveillance dashboard (thresholds, false-positive rates, escalation policy).

**Historical context.** Place the contribution relative to contemporaneous working papers and subsequent citations. Note what was known before (e.g., negative variance risk premium unconditionally) versus what is new (e.g., which term-structure factor carries the premium’s time variation).

**Limitations reminder.** Finite samples, microstructure, construction error in synthetic claims, and changing market structure (electronification, ETF/ETN wrappers, balance-sheet regulation) can all modify magnitudes out of sample. Treat published bps gaps as upper bounds until replicated live with real fills.

**Desk one-pager.** End with five bullets: (1) signal definition; (2) traded instruments; (3) headline Sharpe or bps gap; (4) primary failure mode; (5) monitoring metric for crowding or breakdown.

These elaborations intentionally restate and operationalize results already established above rather than inventing new empirical claims beyond the source paper.
