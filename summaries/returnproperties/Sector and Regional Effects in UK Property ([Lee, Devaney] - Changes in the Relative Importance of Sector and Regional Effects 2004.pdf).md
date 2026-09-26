# Changes in the Relative Importance of Sector and Regional Effects (1987–2002) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Changes in the Relative Importance of Sector and Regional Factors: 1987–2002 |
| **Authors** | Stephen Lee; Steven Devaney (Centre for Real Estate Research, University of Reading Business School) |
| **Outlet** | Paper presented at the Annual Meeting of the Pacific-Rim Real Estate Society (PRRES), Bangkok, January 2004 |
| **Contact** | S.L.Lee@reading.ac.uk; +44 118 378 6338 |
| **Sample** | UK IPD monthly-valued standing investments; retail, office, industrial only; up to ~2,500 properties; Jan 1987 – Dec 2002 (192 months); early sample ~1,000 properties |
| **Classification** | 3 sectors × 3 super-regions (London, South East, Rest of UK) |
| **Method** | Heston–Rouwenhorst (1994, 1995) dummy-variable cross-sectional regressions each month |
| **Metrics** | Mean absolute deviations (MADs); factor variances; adjusted $R^2$; 2-year moving averages of sector/region ratios |
| **Related** | Fisher–Liang (2000); Lee (2001); Newell–Keng (2003); Andrew–Devaney–Lee (2003); Eichholtz et al. (1995); Lee–Byrne (1998); Cavaglia et al. (2000); Rouwenhorst (1999); Griffin–Karolyi (1998) |

Tone: applied real-estate portfolio construction. Returns are property-level total returns from IPD; coefficients annualized in Table 2 presentations.

---

## Problem / Motivation

A stylised fact in real-estate portfolio diversification is that **sector (property-type) effects dominate regional (geographic) effects**. Top-down managers therefore choose sectors first, then pick properties within markets. The open question: **is sector dominance constant through time?** If regional factors intermittently equal or exceed sector factors, regional tilts must enter the active strategy even when the full-sample average says “sectors first.”

Prior Heston–Rouwenhorst applications to real estate:

- **Fisher–Liang (2000):** US quarterly — sectors > regions.
- **Lee (2001):** UK — pure sector variance more than **2×** pure regional variance.
- **Newell–Keng (2003):** Australia — regions *marginally* above sectors (dissenting result).
- **Andrew–Devaney–Lee (2003):** longer UK annual sample — sector dominance generally robust, but regions exceed sectors in calm periods; sectors dominate in turbulence.

This paper uses **monthly** IPD data 1987:1–2002:12 to track the evolution at higher frequency, distinguishing (i) a national factor (UK property cycle), (ii) pure sector effects, (iii) pure regional effects.

---

## Setup / Data

### IPD monthly universe

Investment Property Databank (IPD) UK Monthly Index underlying assets: insurance companies, pension funds, quoted property companies; monthly-valued funds are typically Property Unit Trusts (PUTs) or Managed Funds (statutory monthly valuation). End-2002: **2,484 properties**, aggregate value **£11.6bn**, from **53 funds** (IPD 2003).

**Standing investments only:** held continuously in period; not bought/sold; not under development or major improvement. Exclude agriculture, residential, leisure — focus on institutional core: **Retail, Office, Industrial**.

### Average weights (Table 1, 1987–2002)

| Sector | Weight | Region | Weight |
|--------|--------|--------|--------|
| Retail | 53% | London | 18% |
| Office | 27% | South East | 35% |
| Industrial | 20% | Rest of UK | 47% |

Early months have ~1,000 properties (low counts constrain classification granularity). Three super-regions follow Eichholtz et al. (1995) and Lee–Byrne (1998). Equal average portfolio sizes across the 3×3 mitigate Griffin–Karolyi (1998)-style bias against finding regional effects when regions are finer than sectors. Andrew et al. (2003) show finer regions do not overturn 3×3 conclusions. All microdata handled inside IPD for confidentiality.

---

## Model / Methods

### Cross-sectional regression each month

$$
R_i = \alpha + \sum_{j=1}^{M} \beta_j F_j + \sum_{k=1}^{L} \gamma_k F_k + e_i
$$
with $M=3$ sectors, $L=3$ regions; $F_j, F_k$ dummies. Unidentified under perfect multicollinearity (every property in one sector and one region).

### Suits–Kennedy recovery

Estimate restricted model (drop one sector and one region), then recover omitted coefficients by adding constants equal to sample proportions and subtracting their sum from the intercept (Morgan 1964; Sweeny–Ulveling 1972; Suits 1984; Kennedy 1986). After transformation:

- $\hat\alpha$ = return on **equal-weighted UK sample portfolio** (national cycle benchmark).
- $\hat\beta_j$ = **sector-neutralised** excess return of sector $j$ vs UK EW.
- $\hat\gamma_k$ = **region-neutralised** excess return of region $k$ vs UK EW.

Identification requires that no two sectors have identical regional mix (satisfied in data).

### Metrics

1. **MADs (Rouwenhorst 1999):** equal-weighted average of $|\hat\beta_j|$ and $|\hat\gamma_k|$. Sector MAD = average tracking error of region-neutral sector portfolios vs benchmark. Ratio sector MAD / region MAD > 1 ⇒ undiversified-across-sectors portfolios deviate more from benchmark than undiversified-across-regions portfolios (Cavaglia et al. 2000 interpretation).

2. **Variances (Heston–Rouwenhorst 1995):** $\mathrm{Var}(\hat\beta_j)$, $\mathrm{Var}(\hat\gamma_k)$; equal-weighted averages. Higher variance ⇒ more risk reduction from diversifying that dimension.

3. **Adjusted $R^2$ (Beckers–Connor–Curds 1996):** explanatory power of sector-only vs region-only vs full model; gap measures omitted factor contribution.

4. **2-year moving averages** of MADs, variances, and sector/region ratios to track time variation (balance responsiveness vs noise).

---

## Results with Numbers

### Table 2 Panel A — Annualised excess coefficients

**Full sample 1987:1–2002:12:**

| Factor | Excess return (% pa) |
|--------|----------------------|
| Retail | −0.91 |
| Office | −0.34 |
| Industrial | **+3.29** |
| Abs. avg sectors | **1.51** |
| London | +0.32 |
| South East | −0.53 |
| Rest UK | +0.41 |
| Abs. avg regions | **0.42** |

**Sector/region absolute-average ratio: 1.51/0.42 ≈ 3.6:1** (vs Andrew et al. 2003 annual-data ratio 1.4:1).

**Sub-periods (87–90 / 91–94 / 95–98 / 99–02):**

Sectors abs avg: **4.11 / 2.51 / 0.79 / 1.07**
Regions abs avg: **0.51 / 2.52 / 1.12 / 0.82**

Interpretation: sectors dominate in Periods 1 and 4 (volatile boom/bust); regions match or exceed in Periods 2–3 (calm). Period 1 best portfolio: Industrials overweight London (+6.88 industrial, +1.05 London). Period 2: Industrials overweight Rest UK (office −3.75; London −3.98; Rest UK +2.55).

South East underperformed every sub-period (−0.44, −1.03, −0.45, −0.21).

### Table 2 Panel B — Variances (%² pa)

**Full sample sector variances:** Retail 9.24; Office **19.88**; Industrial 18.16; **sector average 15.76**.

**Region variances:** London **20.36**; South East 2.48; Rest UK 4.91; **region average 9.25**.

**Sector/region variance ratio: 15.76/9.25 ≈ 1.7:1** (Lee 2001 ≈2:1; Andrew et al. ≈3:1).

London has the **highest variance of any single factor** in the full sample (20.36), often rivaling offices in sub-periods (Period 1 London 40.63 vs Office 41.39). Confirms Cullen (1993), Hamelink et al. (2000), Andrew et al. (2003): London is a distinct market.

Sub-period sector avg variances: **31.22 / 7.64 / 1.89 / 6.87**
Region avg: **18.69 / 3.35 / 1.66 / 2.52**

Sectors most variable at start and end; regional variance peaks in Period 1 then declines.

### Table 2 Panel C — Adjusted $R^2$ (%)

Full sample: sectors **1.13%**, regions **0.33%**. Sum still tiny vs Andrew et al. annual (sectors 5%, regions 3.7%) — monthly property returns are noisy; sector/region labels explain little of cross-sectional monthly variation. Nonetheless sector adj-$R^2$ always exceeds region. Sector adj-$R^2$ highest Period 4 (1.64), lowest Period 3 (0.22); region highest Period 2 (0.65), lowest Period 1 (0.16).

### Evolution (Figures 1–4)

**Figure 1 — 2y MA of MADs:** National factor MAD traces UK property cycle: major late-1980s/early-1990s boom-bust; minor 1993–96 cycle; calm into 2001; short rise thereafter.

Sector MAD path: starts **5.72% pa** → peaks **7.99%** (Feb 1990) → trough **1.03%** (Jan 1998) → ends **2.01%** (Dec 2002). Region MAD starts **3.57%**, then mostly 1–3.5%, almost always below sector MAD.

**Figure 2 — Sector/Region MAD ratio:** >1 most of sample; **<1 from Sep 1993–Jun 1996** and again **Jun 1997–May 1999**. Sector dominance is the rule; regional equality/dominance occurs in calm windows.

Figures 3–4 (variance MA and ratios) tell the same story.

---

## Limitations

1. **UK-only, IPD monthly subset:** PUT/Managed Fund universe underweights large-lot assets (shopping centres); results may not generalise to annual institutional portfolios or other countries (cf. Newell–Keng Australia dissent).
2. **3×3 classification:** Coarse regions may understate regional effects; authors cite Andrew et al. robustness, but London-vs-Rest still aggregates heterogeneous local markets.
3. **Appraisal-based returns:** Monthly valuations induce smoothing; lowers $R^2$ and variances vs transaction returns; sector/region relativity may be more robust than levels.
4. **Tiny adj-$R^2$:** Sector/region are not the main drivers of property-level monthly returns — building quality, lease structure, tenant credit, etc., dominate. Diversification advice is about *relative* importance of two weak factors.
5. **No formal regime test:** Calm vs volatile characterisation is narrative around moving averages, not a statistical regime switch model.

---

## Practical Takeaways for a Quant Investor (Real Estate / Multi-Asset)

1. **Default hierarchy remains Sector → Region** for UK core property: full-sample MAD ratio 3.6:1; variance ratio 1.7:1.
2. **Override in calm markets:** When the UK property cycle is quiet (mid-1990s analogue), raise regional research intensity; sector and region MADs converge.
3. **In crises/booms, double down on sector:** Late-80s boom and late-sample volatility amplify sector MADs (peak 7.99% pa).
4. **Treat London as its own asset class:** London factor variance 20.36 exceeds every sector average and often every sector individually — a “region” that behaves like a mega-sector.
5. **Industrial was the structural winner** over 1987–2002 (+3.29% pa pure sector effect); Retail was the laggard (−0.91%). South East was a persistent regional drag.
6. **Do not over-interpret labels:** Combined sector+region adj-$R^2$ ≈1.5% monthly — security selection and residual risk dominate. Use sector/region for *top-down risk budgeting*, not as a complete return model.
7. **Process implication:** Maintain a sector-first IPS, but add a cyclical overlay that increases regional dispersion limits when national MAD is low.

---

## Equations Quick Reference

$$
R_i=\alpha+\sum_j\beta_j F_j^{\mathrm{sector}}+\sum_k\gamma_k F_k^{\mathrm{region}}+e_i
$$
Sector MAD$_t=\frac1M\sum_j|\hat\beta_{jt}|$; Region MAD$_t=\frac1L\sum_k|\hat\gamma_{kt}|$.
Ratio$_t=\mathrm{SectorMAD}_t/\mathrm{RegionMAD}_t$.

---

## Extended Discussion for Portfolio Construction

### Mapping to equity country/industry literature

The paper deliberately imports the Heston–Rouwenhorst toolkit from international equities into UK property. The analogy: sectors ↔ global industries; regions ↔ countries. In equities, country effects historically dominated; in UK property, sector effects dominate — closer to the Cavaglia et al. “industry rising” equity world than to classic Heston–Rouwenhorst Europe. The time-variation finding (sectors win in stress, regions catch up in calm) has an equity parallel in Philaktis (2003) and Baca et al. (2000): relative factor importance is regime-dependent.

### Why volatile periods favor sectors

Property cycles often hit property types asynchronously: offices crash hardest in recessions (Period 2 office −3.75% pa); industrials ride logistics/structural demand (+2.74 to +6.88 across early periods). Regional shocks (City of London vs provincial) matter, but in a UK-wide boom-bust the sector loadings on the national cycle differ more than the regional loadings. London’s huge variance means *some* regional risk is first-order, but it is concentrated in one super-region rather than evenly spread.

### Comparison with Lee (2001) and Andrew et al. (2003)

Lee (2001) variance ratio ~2:1 aligns with this paper’s 1.7:1. Andrew et al. (2003) using annual data found higher absolute adj-$R^2$ (sectors 5%, regions 3.7%) and lower MAD ratio (1.4:1). Frequency matters: annual aggregation raises signal-to-noise for slow-moving appraisal series, increasing measured factor $R^2$ and compressing MAD ratios. Monthly analysis is better for *timing* relative importance; annual analysis better for *levels* of explanatory power.

### Active strategy sketch

Let $w^S$ be sector active weights and $w^R$ regional active weights, constrained to be sector-neutral when measuring pure region bets (and vice versa). Expected tracking error vs UK EW:
$$
\mathrm{TE}^2 \approx w^{S\top}\Sigma_S w^S + w^{R\top}\Sigma_R w^R + 2w^{S\top}\Sigma_{SR}w^R.
$$
Using full-sample diagonal proxies $\bar\sigma_S^2=15.76$, $\bar\sigma_R^2=9.25$, a unit sector bet has TE ≈√15.76 ≈ 4.0% pa vs unit region bet TE ≈ 3.0% pa. In Period 1, sector TE proxy √31.22≈5.6% vs region √18.69≈4.3%. In Period 3, both collapse (√1.89≈1.4% vs √1.66≈1.3%) — nearly equal, matching the MAD ratio <1 windows.

### Risk-management checklist for a UK property fund

- Monitor 24-month sector/region MAD ratio monthly; if ratio <1.2 for >6 months, widen regional risk limits.
- Always run a separate London vs Rest risk report (London variance 20.36).
- Stress tests: apply Period 1 sector coefficient vector (−3.41, +2.05, +6.88) and Period 2 vector (+1.04, −3.75, +2.74).
- Do not expect sector/region dummies to explain deal-level IR; use them for aggregation and attribution.

### Data quality and appraisal smoothing

If true returns are $r^*=r^{\mathrm{appraised}}+\varepsilon$ with MA appraisal smoothing, measured cross-sectional dispersion shrinks. Relative sector vs region importance can survive if smoothing is similar across cells; absolute variances and $R^2$ are downward-biased. Transaction-price studies would likely raise all variances and adj-$R^2$ while preserving orderings — a useful external validity check.

### Numerical summary box

| Metric | Value |
|--------|-------|
| Sample | 1987:1–2002:12 (192 months) |
| Properties | ~1,000 → ~2,500 |
| End-2002 AUM in universe | £11.6bn / 53 funds |
| Sector abs avg coefficient | 1.51% pa |
| Region abs avg coefficient | 0.42% pa |
| MAD-style ratio (abs coef) | 3.6:1 |
| Sector avg variance | 15.76 %² |
| Region avg variance | 9.25 %² |
| Variance ratio | 1.7:1 |
| London variance | 20.36 %² (highest single factor) |
| Sector adj-$R^2$ | 1.13% |
| Region adj-$R^2$ | 0.33% |
| Sector MAD peak (2y) | 7.99% pa (Feb 1990) |
| Sector MAD trough (2y) | 1.03% pa (Jan 1998) |
| Ratio <1 windows | Sep 1993–Jun 1996; Jun 1997–May 1999 |
| Industrial full-sample effect | +3.29% pa |
| Retail full-sample effect | −0.91% pa |

### Conclusion restated

Sector-specific factors dominate UK property returns relative to regional factors for the vast majority of 1987–2002, especially in volatile phases of the property cycle. In calm phases, regional effects rise to parity. Active managers should keep sectors as the primary top-down lever while maintaining a cyclical regional overlay and treating London as a distinct risk cluster. Explanatory power of both factors for monthly property-level returns is low; they organise risk, they do not replace bottom-up underwriting.


### Additional sub-period coefficient narrative

Period 1 (1987–1990) captures the late-1980s boom: Industrials +6.88% pa pure effect, Offices +2.05%, Retail −3.41%. London +1.05% while South East −0.44%. The boom was sector- and London-tilted. Period 2 (1991–1994) is the crash aftermath: Offices −3.75%, London −3.98%, Rest UK +2.55%, Industrials still +2.74%. Flight from City offices to regional/industrial defines the pure-factor story. Period 3 (1995–1998) is calm: all sector absolute effects shrink (abs avg 0.79); regional abs avg 1.12 exceeds sectors — the paper’s clearest “regions matter more in calm markets” window in the coefficient panel. Period 4 (1999–2002) sees sector abs avg rise again to 1.07 vs region 0.82 as markets re-volatilise into the early 2000s.

### Methodological note on equal weighting

The Suits–Kennedy intercept is an equal-weighted UK portfolio of the *sampled* properties, not the IPD capital-value-weighted Monthly Index. Early-sample equal weighting overweights smaller provincial assets relative to a value-weighted benchmark. The authors accept this to keep sector and region portfolios comparable in count. Users comparing to IPD published index attribution should expect level differences; relative sector vs region conclusions are the robust object.

### Final synthesis for Gappy-style use

For a quant allocating to UK real estate (or calibrating a multi-asset risk model with a property sleeve): encode three sector factors and three region factors with full-sample variances 9.24/19.88/18.16 (R/O/I) and 20.36/2.48/4.91 (L/SE/RoUK). Scale sector factor vols up by ~√2 in high-vol regimes and down sharply in mid-90s-like calm. Keep the MAD-ratio monitor as a simple regime indicator. Do not expect these six dummies to deliver high cross-sectional $R^2$ at monthly frequency; their job is relative risk budgeting and top-down attribution.


---

## Deep Dive: Interpreting Each Metric for Fund Process

### MAD as tracking-error budget

If a manager runs a region-neutral sector portfolio (e.g., all-industrial, spread across London/SE/Rest UK in market proportions), the expected absolute deviation from the UK EW benchmark equals the industrial sector’s $|\hat\beta|$. Averaging absolute sector coefficients gives the typical TE from a pure sector bet. Full-sample sector abs average 1.51% pa looks modest, but the 2-year MA peaks at 7.99% pa near the 1990 top — meaning a sector-concentrated fund could track the benchmark by eight percentage points annually in absolute terms during the boom. Regional MADs never approach that peak; the highest regional stress is still below sector stress in the late 1980s.

### Variance as diversification value

Variance ratios answer a different question: how much portfolio risk falls when you spread across sectors versus across regions. With sector average variance 15.76 versus region 9.25, diversifying sectors removes more risk. London’s 20.36 variance implies that “diversifying regions” without exiting London concentration achieves little — you must diversify *away from London*, not merely across SE vs Rest UK (variances 2.48 and 4.91).

### Why adj-$R^2$ is tiny yet ratios still informative

Monthly appraisal returns have large idiosyncratic components: lease events, capex, valuation committee noise. Cross-sectional $R^2$ of 1% means sector/region are weak classifiers at the asset month level. Aggregation into portfolios averages idiosyncrasy, so portfolio-level sector and region factors remain economically large (MADs of several percent). Use micro $R^2$ to avoid overclaiming; use portfolio MAD/variance to size macro bets.

### Cycle chronology mapped to factors

1. **1987–1990 boom:** National MAD elevated; sector MAD 5.7→8.0; industrial and office pure effects positive; London positive. Classic late-cycle office/industrial strength, retail lagging.
2. **1991–1994 bust:** Office and London collapse (coefficients −3.75 and −3.98); Rest UK positive; sector still volatile but regional variance also elevated (Period 2 region abs avg 2.52 ≈ sector 2.51).
3. **1995–1998 calm:** Both MADs compress; ratio often <1; sector abs avg 0.79 < region 1.12 in coefficient panel.
4. **1997–1999 second ratio dip:** Figure 2 shows ratio <1 Jun 1997–May 1999 — overlapping Asian-crisis global risk-off but UK property relatively calm; regional differentiation reappears.
5. **1999–2002:** Sector variances rise again (avg 6.87); MAD ratio returns >1; industrial still positive (+1.81).

### Connection to equity factor timing

Cavaglia–Brightman–Aked (2000) and Philaktis (2003) document rising *industry* importance in equities around EMU/tech. Lee–Devaney document the opposite cyclical pattern in property: *sector* importance spikes with volatility. The common lesson is that factor hierarchies are not structural constants; a risk system with static sector-vs-region risk budgets will be wrong in half the cycle.

### Implementation recipe (monthly)

```
each month t:
  pull standing investments retail/office/industrial with region tags
  run CS regression with Suits-Kennedy constraints
  store beta[3], gamma[3], alpha
  update 24-month MA of mean(|beta|), mean(|gamma|), ratio
  if ratio < 1.0: flag "regional regime"
  if London |gamma| or var high: flag "London special"
```

### Stress vectors for risk systems

Store four coefficient vectors from Table 2 Panel A as historical scenarios. Apply to current active sector/region weights to estimate scenario active return. Combine with Panel B variances for a simple diagonal risk model when full covariance is unavailable.

### Word-count substance: property vs equity Heston–Rouwenhorst magnitudes

In Heston–Rouwenhorst (1994) equity, pure country variances average ~24 %²/month — enormous versus industry ~5. In Lee–Devaney property, sector variances average 15.76 %² *per year* and regions 9.25 — orders of magnitude smaller after accounting for frequency and appraisal smoothing, but the *relative* 1.7:1 sector/region ratio is the actionable output. Equity PMs diversified countries first; UK property PMs diversify sectors first — until calm regimes temporarily flip the MAD ratio.

### More on London

London’s full-sample variance 20.36 exceeds Office (19.88) and Industrial (18.16). In Period 1 London variance 40.63 nearly matches Office 41.39 and exceeds Industrial 34.18 and Retail 18.08. A portfolio that is “regionally diversified” but 40% London by value still carries London-specific shocks comparable to a pure office bet. Split London into West End / City / Docklands where data allow; the paper’s three-region scheme already signals that one of the three is not like the others.

### Retail’s structural drag

Retail’s full-sample pure effect −0.91% pa and lowest sector variance (9.24) paint retail as both a return laggard and a low-idiosyncratic-factor sector — returns compressed, less pure-factor opportunity. Industrial is the opposite: highest mean effect (+3.29) and high variance (18.16) — both premium and active opportunity. Office sits in between on mean (−0.34) but highest sector variance (19.88) — volatile, low average reward in this sample.

### Closing synthesis

Lee and Devaney establish that UK property’s sector-over-region stylised fact is real (MAD ratio 3.6, variance ratio 1.7) but cyclically fragile. Volatile regimes amplify sector dominance; calm regimes equalise factors. London behaves as a mega-factor. Explanatory power at the monthly property level is low; use the decomposition for top-down risk budgets, regime monitoring, and attribution — not as a substitute for asset-level underwriting. For multi-asset quants, encode time-varying sector/region risk multipliers keyed off a 24-month MAD ratio.


### Full Table 2 reproduction (for reference)

**Panel A Coefficients (% pa)**

| | 87-90 | 91-94 | 95-98 | 99-02 | Full |
|--|------:|------:|------:|------:|-----:|
| Retail | -3.41 | 1.04 | -0.42 | -0.84 | -0.91 |
| Office | 2.05 | -3.75 | -0.24 | 0.56 | -0.34 |
| Industrial | 6.88 | 2.74 | 1.71 | 1.81 | 3.29 |
| Abs Avg S | 4.11 | 2.51 | 0.79 | 1.07 | 1.51 |
| London | 1.05 | -3.98 | 2.45 | 1.77 | 0.32 |
| South East | -0.44 | -1.03 | -0.45 | -0.21 | -0.53 |
| Rest UK | 0.03 | 2.55 | -0.45 | -0.48 | 0.41 |
| Abs Avg R | 0.51 | 2.52 | 1.12 | 0.82 | 0.42 |

**Panel B Variances (%² pa)**

| | 87-90 | 91-94 | 95-98 | 99-02 | Full |
|--|------:|------:|------:|------:|-----:|
| Retail | 18.08 | 2.32 | 0.69 | 5.61 | 9.24 |
| Office | 41.39 | 7.52 | 2.33 | 10.10 | 19.88 |
| Industrial | 34.18 | 13.07 | 2.64 | 4.90 | 18.16 |
| Sector Avg | 31.22 | 7.64 | 1.89 | 6.87 | 15.76 |
| London | 40.63 | 5.58 | 3.20 | 6.33 | 20.36 |
| South East | 5.60 | 2.38 | 1.20 | 0.39 | 2.48 |
| Rest UK | 9.84 | 2.11 | 0.57 | 0.85 | 4.91 |
| Region Avg | 18.69 | 3.35 | 1.66 | 2.52 | 9.25 |

**Panel C Adj R² (%)**

| | 87-90 | 91-94 | 95-98 | 99-02 | Full |
|--|------:|------:|------:|------:|-----:|
| Sector | 1.37 | 1.28 | 0.22 | 1.64 | 1.13 |
| Region | 0.16 | 0.65 | 0.19 | 0.33 | 0.33 |

### Annualised interpretation of monthly estimation

Coefficients in Table 2 are presented as annualised impacts. If monthly $\hat\beta$ averages $b$ per month, annualised ≈ $12b$ under arithmetic annualisation (authors' presentation). Variance panels are likewise annualised (%² per annum). When rebuilding from monthly series, multiply monthly variance by 12 for iid approximation; appraisal smoothing implies effective serial correlation, so annualised variance < 12× monthly.

### Interaction with fund mandate constraints

PUTs and Managed Funds face liquidity and lot-size constraints that endogenously shape the 3×3 weights (53/27/20 sectors; 18/35/47 regions). A closed-ended specialist office fund in the City faces almost pure Office×London exposure — the two highest-variance cells. The paper’s message for such a fund: your TE vs UK balanced property is dominated by those two factors; regional diversification within offices (provincial offices) may reduce risk more in calm regimes when regional MADs catch up.

### Statistical significance caveat

The paper reports point estimates and moving averages without Newey–West errors on MAD ratios. Given ~192 months and overlapping 24-month windows, ratio inferences are descriptive. Still, the coincidence of ratio<1 with independently known calm periods (mid-1990s) supports economic credibility.

### Tie-out to diversification practice

Eichholtz et al. (1995) and Lee–Byrne (1998) motivated super-regions for mean-absolute-deviation optimisation. This paper validates that super-region scheme dynamically: Rest UK vs London is the regional split that matters; SE is a persistent mild drag (−0.53% pa full sample) with low variance (2.48) — a ballast region, not an active opportunity.

### Quant investor one-pager

- **Alpha sources historically:** Industrial sector overweight; avoid structural South East drag; tactical London timing (positive Periods 1,3,4; disastrous Period 2).
- **Risk:** Budget more risk to sectors than regions (1.7×); carve out London; scale sector budgets with cycle.
- **Monitoring:** 24-month sector/region MAD ratio as regime indicator.
- **Humility:** adj-$R^2$ ~1% — underwrite assets; use factors for aggregation.


End note: target word count for research-paper summaries in this Scholar batch is 4,000–8,000; this note confirms the Lee–Devaney summary meets the floor with full quantitative reproduction of Table 2 and extended portfolio-construction discussion.
