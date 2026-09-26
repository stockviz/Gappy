# Searching the Factor Zoo

**Authors:** Soosung Hwang and Alexandre Rubesam  
**Version:** March 2018 (SSRN: https://ssrn.com/abstract=3100811)  
**Note on filename:** Drive file is named `AbnormalReturnsReview_Hwang_2018.pdf` but the paper title is *Searching the Factor Zoo*.  
**Source PDF:** `AbnormalReturnsReview_Hwang_2018.pdf`  
**Summary prepared:** 2026-09-24 (Scholar batch_2026-09-24_1)  
**OCR:** Not required; clean extract (~18,770 words of source)

---

## 1. Problem and Motivation

Harvey, Liu, and Zhu (2016) and Cochrane (2011) popularized the “factor zoo”: hundreds of published factors, most from the last two decades. It is implausible that all are independent priced risks; many are redundant, many are data-mined. Existing responses—multiple-testing thresholds (Harvey et al.), model comparison on small factor menus (Barillas–Shanken 2017), and horse races of characteristics (Green et al. 2017; Feng et al. 2017)—still typically either (i) test factors one-at-a-time against a pre-specified baseline or (ii) use **portfolios** as test assets, which reintroduces the Lo–MacKinlay / Berk / Lewellen–Nagel–Shanken sorting bias.

Hwang and Rubesam propose a **Bayesian variable-selection** attack on the full model space $2^K$ for large $K$, applied primarily to **individual stocks** (thousands), with $K$ up to **83** candidate factors. Core empirical claims:

1. Only a **handful** of factors (often $\le 5$–6) matter for individual stock returns in any given period.
2. The **only** factor consistently selected across sub-periods is the **market excess return**.
3. Other selected factors are **not** the usual FF3/FF5/HXZ/CZ suspects; they are often short-term reversal, earnings-announcement, and related characteristics—and they **rotate over time**.
4. When the same method is applied to characteristic-sorted **portfolios**, the method “finds” factors related to the sorting variable—exactly the bias the individual-stock design avoids.

---

## 2. Setup and Data

### 2.1 Candidate factors ($K\approx 83$)

- Market: excess market return (Sharpe 1964).
- 82 **tradable** long-short factors from firm characteristics in the literature (accruals, momentum variants, profitability, investment, earnings surprise, analyst activity, liquidity, etc.—in the spirit of Green–Hand–Zhang / Harvey taxonomies).

### 2.2 Test assets

**Primary:** all available non-microcap individual stocks (and separately microcaps), US equities, various windows spanning **1980–2016**.

Example counts (three long sub-periods, Table 3 setup):

| Period | Non-microcap stocks $N$ | Candidate factors $K$ |
|--------|---------------------------|-------------------------|
| Jan 1980 – Dec 1991 | 807 | 75 |
| Jan 1992 – Dec 2003 | 893 | 81 |
| Jan 2004 – Dec 2016 | 967 | 83 |

Also: five shorter sub-periods with a reduced factor menu; microcap panels; and **20 sets of portfolios** (univariate sorts, bivariate sorts, 49 industries)—about **300 portfolios** total—for the bias demonstration.

### 2.3 Model

Seemingly Unrelated Regressions (SUR) / multivariate regression: for assets $i=1,\ldots,N$,

$$
r_i = X\beta_i + e_i,
$$

with $X$ the $T\times K$ factor matrix, contemporaneous correlation across $e_i$ (Zellner SUR), no residual autocorrelation assumed. Variable selection introduces latent inclusion indicators $\gamma_j\in\{0,1\}$ for each factor $j$. Non-hierarchical prior: regression coefficients’ prior independent of $\gamma$. Gibbs sampler explores the posterior over $\gamma$ (and thus over models). Computational contribution: scalable enough for large $N$ and $K\sim 80$ where naive $2^{83}$ enumeration is impossible ($\sim 10^{25}$ models).

Prior inclusion probability baseline discussed around **0.5** for marginal posterior comparisons in the text.

---

## 3. Methods — Bayesian Variable Selection in SUR

### 3.1 Why Bayesian model exploration?

Classical tests fix a null model and ask whether factor $j$ helps. With a zoo, the null is arbitrary, and sequential testing multiplies false discoveries. The Bayesian approach targets the **posterior mass on models** $p(\gamma\mid\text{data})$, reporting:

- Highest posterior probability models.
- Marginal posterior inclusion probabilities for each factor.
- Time variation across sub-periods.

### 3.2 Individual stocks vs portfolios

Individual stocks: $N>T$ often; SUR with selection remains feasible under the paper’s Gibbs scheme. Portfolios: $N$ small, but sorting induces mechanical alignment between left-hand-side and candidate factors—used as a **stress test** of the method’s tendency to pick sorting-related factors.

### 3.3 Intercept interpretation

Inclusion of an intercept in high-posterior models is read as **mispricing / model failure**: if factors price stocks, intercept should drop out. Empirically, for individual stocks in many windows, intercept is **not** selected—high-posterior models appear to “price” the cross-section without alpha. In some later windows and for portfolios, intercept reappears (model inadequacy).

---

## 4. Empirical Results

### 4.1 Three long sub-periods, full factor set (Table 3 narrative)

Across 1980–91, 1992–2003, 2004–16:

- Models with **fewer than 5 factors** generally dominate despite $2^{75}$–$2^{83}$ possible models.
- **No single model** (and no non-market factor) is stable across all three periods.
- Only **13 factors** are ever selected across the three periods, including: `mkt`, `aeavol` (abnormal earnings announcement volume), `chmom` (change in 6-month momentum), `chanalyst` (change in analyst coverage), `ear` (earnings announcement return), `ep`, `herf` (industry sales concentration), `mom1m`, `ms` (Mohanram score), `pctacc`, `tb`, etc.
- Marginal posterior $>0.5$ is rare outside the market and occasional companions (e.g., `chmom` in early sample).

**Period color:**

- **1980–1991:** Best models include market + `chmom`; posterior on best model moderate; other models add `mom1m` and/or `ms`; marginals $>0.5$ only for market and `chmom`.
- **1992–2003:** Best model often **market alone** with posterior **0.64**; runners-up add `aeavol` or `pctacc` with low mass—**low model uncertainty**.
- **2004–2016:** More uncertainty; best model posterior **0.24** includes intercept + market + `herf` + `mom1m`; second (**0.20**) drops intercept, adds `chanalyst`. Presence of intercept ⇒ weaker pricing success in this window.

### 4.2 Five shorter sub-periods, reduced factor set (Table 4)

Non-microcap stocks; $\le 4$ factors in best models; only **10** factors ever selected: `mkt`, `aeavol`, `bm`, `chmom`, `ear`, `mom1m`, `mve_ia`, `pchsale_pchrect`, `pctacc`, `sue`. Only six have marginal posterior $>0.5$ in some window: `mkt`, `chmom`, `ear`, `mom1m`, `mve_ia`, `sue`.

| Window | Best model sketch | Posterior (approx.) |
|--------|-------------------|---------------------|
| Early (Panel A) | `mkt` + `chmom` | Dominant single model |
| Jul 1987 – Dec 1994 (B) | Add `ear` + `mom1m` | Still concentrated |
| Jan 1995 – Jun 2002 (C) | **`mkt` only** | **0.44**; alts add `pctacc` / `mom1m` / `aeavol` |
| Jul 2002 – Dec 2009 (D) | `mkt` + `sue` | **0.44**; alts `bm` or `pchsale_pchrect` |
| Jan 2010 – Dec 2016 (E) | `mkt` + (`mom1m` / `mve_ia` / `sue`) | 0.36 / 0.28 / 0.24 — higher uncertainty |

**Only consistent factor: market excess return.**

### 4.3 Microcaps (Table 5)

Fewer factors ever selected (**6**). Similar names (`chmom`, `ear`, …). Striking episode: **Jan 1995 – Jun 2002** (tech bubble), top models with combined posterior **0.88** **omit the market**, loading instead on `aeavol` and `chanalyst`. Interpretation: microcap tech prices were hypersensitive to announcement/analyst news and less to the broad market during the bubble—an economically plausible, period-specific breakdown of market dominance.

### 4.4 Portfolios as test assets (Table 6) — the bias demo

When LHS portfolios are sorted on a characteristic $C$, high-posterior models **include factors related to $C$**:

- Size-sorted portfolios → `mve_ia` selected.
- BM-sorted → `bm` selected.
- Operating profitability → `roic` (correlated with ROE factor).
- 25 FF size–BM → `mve_ia` + `lev` (leverage correlated ~0.70 with BM).

Best-model posteriors range from **~0.10** (long-term reversal portfolios) to **~0.57** (OP portfolios); double-sorts ~**0.2**. Intercept often absent even over long $T=444$ months—models look “successful” in a way that **mirrors the sort**, exactly the circularity Lewellen–Nagel–Shanken / Lo–MacKinlay warn about.

**Implication:** portfolio-based Bayesian (or classical) factor searches can look decisive while merely rediscovering the sorting variable. Individual-stock search is the paper’s proposed antidote.

### 4.5 Contrast with Barillas–Shanken and others

Barillas–Shanken (2017) favor a six-factor model (market, investment, profitability, size, BM, momentum) on a different statistical design and smaller menus. Harvey et al. / Feng et al. also elevate the market as primary. Hwang–Rubesam’s distinctive punchline: once **all** zoo factors compete **simultaneously** on **stocks**, the zoo collapses to market + a rotating cast of **non-standard** companions—not FF5.

---

## 5. Limitations

1. **Linear beta / SUR assumptions.** No conditional betas, no nonlinearities, no time-varying $\gamma$ within a sub-period (only across discrete windows).
2. **Tradable factor construction.** Factor quality depends on sorting conventions, lags, and microcaps treatment; results could shift with alternative recipes.
3. **Prior sensitivity.** Authors claim robustness to prior specs on betas, but inclusion priors still influence small-posterior comparisons.
4. **Computational approximation.** Gibbs explores; does not certify global posterior mode in $2^{83}$ space.
5. **US equities only.** International zoo may differ.
6. **No transaction costs / investability.** Selection is statistical, not a tradable multi-factor portfolio recipe.
7. **Filename mismatch** in the Drive library (`AbnormalReturnsReview_*`) can confuse retrieval; content is factor-zoo selection, not a generic abnormal-returns survey.

---

## 6. Practical Takeaways for a Quant Investor

1. **Do not treat the published zoo as a menu of independent alphas.** Simultaneous selection says most are redundant or spurious for stock-level returns.
2. **Market beta is non-negotiable.** Any “alternative risk premia” book that is quietly long market will dominate naive attribution; neutralize carefully.
3. **Be suspicious of FF5-style certainty.** In this design, SMB/HML/RMW/CMA/UMD are **not** the stably selected companions of the market.
4. **Expect factor rotation.** `chmom`, `sue`, `ear`, `mom1m`, `aeavol` appear episodically. A static multi-factor risk model may be wrong in both directions—overfitting the past zoo and missing the current companions.
5. **Never validate factors only on sorted portfolios of the same characteristics.** Table 6 is a concrete existence proof of circular confirmation.
6. **Short-term and earnings-related signals show up more than classical L/S style factors** in stock-level selection—consistent with a world where a lot of published “factors” are transformed microstructure / earnings effects.
7. **Model uncertainty is itself a risk input.** Periods with flat posteriors across several models (2010–16) argue for Bayesian model averaging or shrinkage across factor sets rather than a hard pick.
8. **Microcap regimes can break market dominance** (1995–2002 result). Capacity-constrained anomaly harvesting in microcaps is a different statistical planet.

---

## 7. Method Detail for Implementers

### 7.1 What to report from a replication

For each window: top-10 models by posterior; marginal inclusion probabilities; intercept inclusion rate; pairwise factor co-inclusion. Track whether FF factors ever clear 0.5 marginals when the full zoo is present (paper says they generally do not for stocks).

### 7.2 Relation to multiple testing

Harvey–Liu–Zhu raise t-statistic hurdles. Hwang–Rubesam instead spread posterior mass over models. A factor can have a large classical t in a bivariate regression yet near-zero marginal posterior once correlated competitors enter—**partial correlation / redundancy** is first-class.

### 7.3 SUR vs equation-by-equation selection

SUR borrows strength via residual correlation across stocks. If residual cross-section dependence is strong (market days), selection can differ from running $N$ independent spike-and-slab regressions. Practitioners approximating with pooled or stacked LASSO should check sensitivity to cross-sectional residual modeling.

---

## 8. Selected Quantitative Anchors (Quick List)

- Zoo size in study: **83** factors (82 + market).
- Model space: up to $2^{83}$ (astronomical); posterior concentrates on $<5$-factor models.
- Non-microcap $N$: **807 / 893 / 967** in three long windows.
- Best-model posteriors: examples **0.64** (market alone, 1992–2003), **0.44** (several mid windows), **0.24** (2004–16 best).
- Factors with marginal $>0.5$ in shorter-window design: at most **6** names.
- Portfolio best-model posteriors: **0.10–0.57** depending on sort.
- Tech-bubble microcaps: top-two models **0.88** combined, **without** market.

---

## 9. Connections

- Cochrane (2011) “zoo” rhetoric → this paper’s empirical pruning.
- Harvey–Liu–Zhu (2016): multiple testing; complementary.
- Barillas–Shanken (2017): Bayesian relative model probs on small menus; different conclusion (six-factor).
- Green–Hand–Zhang; McLean–Pontiff: characteristic / post-publication decay literature.
- Fama–French 3/5; Hou–Xue–Zhang; Chen–Zhang: standard models **not** selected as the stock-level companions here.
- Lo–MacKinlay (1990); Lewellen–Nagel–Shanken (2010): portfolio-sort bias—Table 6 operationalizes the warning inside a Bayesian selector.

---

## 10. Bottom Line

Hwang and Rubesam’s Bayesian SUR variable selection on ~83 factors and thousands of stocks delivers a severe pruning of the factor zoo: **the market is the only robust factor; everything else is sparse, unstable, and usually not FF5.** Portfolio-based searches that “confirm” classical factors are shown to be contaminated by sorting. For quant investors, the rational response is humility on static multi-factor dogma, rigorous neutralization of market exposure, and ongoing, simultaneous model selection (or averaging) rather than accretion of every new anomaly into the risk model.

---

## 11. Factor Taxonomy of Those That Actually Appear

From the individual-stock results, the recurring non-market names cluster as:

1. **Short-horizon return / reversal / momentum change:** `mom1m`, `chmom`.
2. **Earnings-announcement complex:** `ear`, `aeavol`, `sue`, `pctacc`.
3. **Analyst / attention:** `chanalyst`.
4. **Occasional valuation / size / structure:** `bm`, `ep`, `mve_ia`, `herf`, `pchsale_pchrect`.

What is conspicuous by rarity: canonical `SMB`, `HML`, `RMW`, `CMA`, `UMD` as stable selected factors when the full zoo competes. That does **not** prove those premia are zero in portfolio sorts; it says they are not needed to explain **individual** stock return panels once richer competitors enter.

---

## 12. Implications for Risk Model Vendors and Barra-style Users

Industry risk models often include dozens of style factors motivated by the zoo. Hwang–Rubesam caution that many styles may be **redundant** for return *explanation* at the stock level even if they help **risk forecasting** (volatility/covariance). Separate two jobs:

- **Risk ($\Omega$):** extra factors can still reduce residual variance and improve TC math (Clarke).
- **Pricing / alpha attribution:** sparse, time-varying selection is enough; do not confuse a useful risk factor with a priced premium.

A practical hybrid: keep a rich risk factor set for $\Omega$, but run a Hwang-style selector (or elastic net with cross-sectional SUR residuals) to decide which factors enter **performance attribution** narratives.

---

## 13. Time-Variation and Regime Stories

| Regime | Statistical pattern | Economic reading |
|--------|---------------------|------------------|
| 1992–2003 non-micro | Market-only posterior 0.64 | Strong CAPM-like period for large stocks |
| 1995–2002 micro | Market dropped; `aeavol`+`chanalyst` | Bubble attention pricing |
| 2002–2009 | `mkt`+`sue` | Post-bubble earnings focus |
| 2010–2016 | Flat posteriors among `mom1m`/`mve_ia`/`sue` | Model uncertainty / factor crowding era |
| 2004–2016 long window | Intercept reappears | Harder to price stocks with static linear factors |

For allocators: when intercept posterior rises, either add missing factors, allow nonlinearities, or reduce confidence in linear multi-factor alpha models.

---

## 14. Replication Recipe (Quant Research)

1. Build monthly stock excess returns; apply liquidity/microcap filters as in paper.
2. Construct 80+ characteristic portfolios as long-short factors with standard lags (avoid look-ahead).
3. Split into adjacent ~7–12 year windows (and shorter ~7 year windows).
4. Run Bayesian indicator selection in a multivariate regression / SUR with spike-slab or MCMC as in paper; record marginal inclusion probs.
5. Benchmark against: (a) FF5 only, (b) LASSO, (c) forward stepwise—compare sparsity and stability.
6. Repeat on sorted portfolios to verify Table-6-style circularity appears.
7. Publish inclusion heatmaps over time; treat unstable factors as trading signals (alpha) rather than risk factors if they are sparse and rotating.

---

## 15. Critiques One Might Raise (and Responses)

**Critique:** Sub-period splits are arbitrary; results cherry-pick instability.  
**Response:** Instability appears across multiple partitions (3 long, 5 short); the market’s dominance is the stable finding.

**Critique:** Bayesian priors drive sparsity.  
**Response:** Authors claim robustness; still, readers should vary inclusion priors. Extreme sparsity priors would only strengthen the “handful of factors” conclusion.

**Critique:** Individual stocks are noisy, so tests lack power—hence only market survives.  
**Response:** That is partly the point vs. portfolio sorts that manufacture power by aligning with factors. Also, earnings-related factors *do* survive in some windows, so power is not uniformly zero.

**Critique:** Tradable factor returns on the RHS while stocks on the LHS is a strange pricing equation.  
**Response:** It is a linear projection / selection exercise, not a full equilibrium SDF proof. Interpret as “which long-short dimensions span stock returns?”

---

## 16. Extended Bottom Line for Portfolio Construction

If you currently run a “kitchen sink” multi-factor alpha with 50+ z-scores, this paper argues for aggressive **dimensionality reduction with time-aware reselection**. Keep market (and your risk model) always on; treat remaining factors as a sparse, re-estimated set. Validate on stocks or on **holdout characteristics** portfolios—not on the same sorts that define the factors. That single process change would eliminate a large fraction of spurious factor proliferation in production research.

---

## 17. Detailed Window-by-Window Narrative (Non-Micro, Short Windows)

**Panel A (earliest short window):** Posterior concentrates on `mkt+chmom`. Change in 6-month momentum is the first “extra” factor the selector likes historically—distinct from classical 12-1 momentum.

**Panel B (1987–1994):** Earnings announcement return (`ear`) and 1-month momentum (`mom1m`) join. This is an **earnings + short-term return** cluster, not HML/SMB.

**Panel C (1995–2002):** Market alone at posterior **0.44**. Accruals, 1-month momentum, abnormal earnings volume appear only in lower-probability models. Mid-sample simplicity.

**Panel D (2002–2009):** `mkt+sue` at **0.44**. Post-crisis / post-bubble accounting surprise matters; BM and sales–receivables change are substitutes in runner-up models.

**Panel E (2010–2016):** Three models with posteriors **0.36, 0.28, 0.24**—genuine model uncertainty. Mixes of `mom1m`, industry-adjusted size, and `sue` on top of market. Matches practitioner intuition that the 2010s saw crowded, unstable style performance.

---

## 18. What “Handful of Factors” Means Numerically

Even when $K=83$, the effective posterior-supported set per window is typically size **1–4**. Union across windows still only ~**10–13** unique factors ever selected. That is a **>85% kill rate** on the candidate zoo for stock-level explanation. Multiple-testing corrected classical screens often still leave dozens of “significant” factors because they do not force simultaneous competition.

---

## 19. Investment Policy Recommendations (Concrete)

1. **Risk parity / multi-style books:** Recalibrate assuming only market is a reliable priced factor in stock panels; treat other styles as alpha overlays with explicit decay monitoring.
2. **Research pipeline:** Require any new factor to raise marginal posterior in a zoo-level selector, not just a t-stat vs FF5.
3. **Attribution:** Prefer sparse Bayesian attributions over kitchen-sink OLS with 50 factors (overfit narrative risk).
4. **Product design:** Smart-beta products keyed to FF5 dimensions may still have demand, but do not equate product popularity with stock-level pricing necessity.
5. **Microcap funds:** Monitor attention/announcement factors; do not assume CAPM beta dominates in bubble-like regimes.

---

## 20. Final Synthesis

*Searching the Factor Zoo* replaces folklore (“many factors are real”) with a simultaneous-selection fact pattern: **market always; others rarely and unstably; classical multi-factor heroes seldom make the cut; portfolio sorts flatter their own factors.** Quant investors should rebuild research gates and attribution around that sparsity.

---

## 21. SUR Gibbs — Intuitive Picture for Non-Bayesians

Think of each factor as a light switch $\gamma_j$. The sampler flips switches on and off, each time refitting factor loadings for all stocks under the SUR residual covariance. Switches that persistently improve the multivariate likelihood stay on (high marginal posterior). Because stocks’ residuals covary, a factor that only fits a few odd portfolios but not the broad stock panel gets little credit—unlike portfolio sorts where those odd portfolios *are* the LHS.

---

## 22. False Discovery vs Redundancy

Two reasons a published factor dies in this horse race:

1. **False discovery:** it never helped; multiple testing artifact.
2. **Redundancy:** it helped marginally alone but is spanned by `chmom`/`sue`/`ear`/market.

Hwang–Rubesam’s simultaneous selection attacks both. Classical “significant vs FF5” tests primarily attack (1) relative to a fixed baseline and miss (2) when the real competitors are outside FF5.

---

## 23. Numbers Recap Table

| Metric | Value |
|--------|-------|
| Candidate factors | up to 83 |
| Non-micro $N$ (3 windows) | 807, 893, 967 |
| Typical best-model size | $\le 4$–5 factors |
| Unique factors ever selected (short-window design) | ~10 |
| Market-only posterior example | 0.64 (1992–2003) |
| High uncertainty posteriors example | 0.36 / 0.28 / 0.24 (2010–16) |
| Microcap bubble combined posterior without market | 0.88 |
| Portfolio best-model posterior range | ~0.10–0.57 |

---

## 24. Closing

The factor zoo, searched properly on stocks, is mostly empty aside from the market gate and a rotating handful of short-horizon/earnings-related dimensions. Build research and risk processes that assume sparsity and instability—not an ever-growing totem pole of styles.

---

## 25. Worked Example: How a New Factor Should Be Evaluated Internally

Suppose research proposes “intangible-adjusted BM.” Under old protocol: sort portfolios, show FF5 alpha, publish. Under Hwang–Rubesam protocol:

1. Add the factor to the 83+ zoo.
2. Re-run selector on 2010–2016 and 2002–2009 stock panels.
3. Require marginal posterior $\ge 0.5$ in at least one window **and** non-trivial improvement in best-model posterior odds vs nested models without it.
4. Show it is not merely a rename of `bm`/`ep`/`roic` (check co-inclusion and pairwise correlations).
5. Only then allocate production risk budget.

This gate alone would have blocked dozens of zoo entries.

---

## 26. Link to Machine-Learning Factor Models

ML pricing papers (autoencoders, IPCA, etc.) also find low-dimensional structure. Hwang–Rubesam is a discrete, interpretable cousin: dimension is a subset of known factors, not latent components. A synthesis: use ML to suggest candidates, then Bayesian selection to decide which known factors survive alongside them on stock panels.

---

## 27. Closing Numbers and Mandate

Kill rate on zoo candidates for stock-level models: **>85%** never selected. Survival set: market + episodic earnings/short-horizon factors. Mandate for quants: sparse, simultaneous, stock-based selection as a standing research control.

---

## 28. Appendix: Candidate Factor Abbreviations Appearing in Results

| Code | Meaning (as used in paper) |
|------|----------------------------|
| mkt | Market excess return |
| chmom | Change in 6-month momentum |
| mom1m | 1-month momentum / short-term return |
| ear | Earnings announcement return |
| aeavol | Abnormal earnings announcement volume |
| sue | Standardized unexpected earnings |
| pctacc | Percent accruals |
| chanalyst | Change in analyst coverage |
| bm | Book-to-market |
| ep | Earnings-to-price |
| mve_ia | Industry-adjusted size |
| herf | Industry sales concentration |
| pchsale_pchrect | Δsales − Δreceivables |
| ms | Mohanram financial-statement score |
| roic | Return on invested capital |
| lev | Leverage |

---

## 29. Executive Mandate (5 Bullets)

1. Run zoo-level simultaneous selection on stocks each year.  
2. Always keep market; treat other inclusions as provisional.  
3. Ban portfolio-sort-only validation for new factors.  
4. Prefer sparse attribution narratives.  
5. Expect and budget for factor rotation.
