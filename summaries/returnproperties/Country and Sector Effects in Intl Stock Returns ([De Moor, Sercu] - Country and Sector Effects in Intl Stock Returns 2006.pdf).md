# Country and Sector Effects in International Stock Returns Revisited (De Moor & Sercu, 2006)

**Bibliographic header**
- **Authors:** Lieven De Moor (European University College Brussels / KU Leuven) and Piet Sercu (KU Leuven)
- **Title:** Country and Sector Effects in International Stock Returns Revisited
- **Series:** AFI 0615; first version 14 Feb 2004; current version **17 Oct 2006**
- **JEL:** G12
- **Keywords:** Sector effects, country effects, risk diversification, small firms
- **Core claim:** Four critiques of Heston–Rouwenhorst (HR) practice: (1) discarding small firms overstates sector importance; (2) unit-exposure assumption is false—using factor×exposure variance tilts further toward countries; (3) ignoring estimation error in exposures also overstates sectors; (4) HR variance rankings need not match mean-variance diversification rankings. Empirically, country remains dominant; Level-4 sector indices can still span better than countries for portfolio risk reduction because **covariances ≠ variances**.

---

## 1. Problem and Motivation

Post-EMU and post-TMT, a wave of papers claimed sector factors had overtaken country factors (Campa–Fernandes 2003; Carrieri–Errunza–Sarkissian 2003; Isakov–Sonney 2002; Baca et al. 2000; Cavaglia et al. 2000; Galati–Tsatsaronis 2003). Others disagreed (Sentana 2002; Rouwenhorst 1999b; Brooks–Del Negro 2003; Gerard–Hillion–de Roon 2003). De Moor and Sercu argue the debate is contaminated by **sample design and metric choice**, not only by economics.

They pose four issues:
1. **Size coverage:** Small caps are more volatile (after country/sector controls) and less exposed to global sector indices. Dropping them inflates sector factors’ apparent importance.
2. **Exposures:** HR assumes unit exposure to own country/sector. Ranking by $\mathrm{Var}(\kappa)$ vs $\mathrm{Var}(\iota)$ can disagree with ranking by stock-return variance generated, $\mathrm{Var}(\gamma\kappa)$ vs $\mathrm{Var}(\delta\iota)$.
3. **Estimation error:** Cross-sectional variance of estimated exposures includes error variance; correcting it further favors countries.
4. **Diversification link:** HR is about variances; diversification is about covariances. An example shows sectors can improve the MV frontier even when country factor variance exceeds sector factor variance.

---

## 2. Data

- Ambition: international, clean, maximal coverage, minimal errors/duplication
- Sources: Datastream Research lists + Dead lists, merged and cleaned
- Geography: North America, LatAm, Japan, Asia ex-Japan, Euro-in, Euro-out, Switzerland, Australasia, South Africa—**39 countries** in broad samples; base case uses **21 OECD** (Korea/Mexico treated non-OECD given late entry)
- Raw list: **44,318** unbalanced USD return series
- Filters: drop dual listings, preferreds, warrants, funds/trusts/holdings; drop mkt cap <\$10M, monthly volume <\$100k, price <\$1; unchanged local price treated as illiquid; drop negative B/M quotes; purge decimal-shift and other Datastream errors
- 36% of stocks lack book values (median cap \$61M vs \$135M for those with books)—small-stock coverage matters
- Sector depth: Level-3 and Level-4 FTSE-style classifications used in different exercises

---

## 3. HR Methodology Reviewed

Return generating process under unit exposures:

$$
R_{j,t}=\omega_t+\kappa_{K(j),t}+\iota_{I(j),t}+\varepsilon_{j,t}\tag{1}
$$

Estimated each month by dummy WLS with zero-sum constraints on weighted country and sector effects. Authors prefer **country×sector portfolio** regressands (balanced panels, less EIV) with weights matched to constraints.

Algebraic interpretation: pure country factor = country index excess over world, corrected for sector-weight imbalances vs world; symmetrically for sectors. Sector imbalance effect in country returns is small when sector weights are close to world weights (OECD + broad sectors).

---

## 4. Base-Case Empirical HR (Table 3)

**Design:** 21 OECD countries; top stocks covering **80%** of each country’s average cap; EW Level-3 country×sector portfolios; 1990–1999; monthly WLS.

**World factor variance:** $\mathrm{Var}(\omega)=16.52$ (percent² per month).

**Country factors (cross-country average):**
- $\mathrm{Var}(\kappa)=$ **28.40**
- Share of excess country variance due to pure country ≈ **98%**
- Sector imbalance effect share ≈ **1.98%** (avg imbalance variance 0.41)

**Sector factors (cross-sector average):**
- $\mathrm{Var}(\iota)=$ **8.48**
- Pure sector share of excess sector variance ≈ **88.64%**
- Country imbalance effect share ≈ **16.06%** (avg 1.05)

**Ratio:** country/sector factor variance ≈ **28.40/8.48 = 3.35**. Country dominates.

Notable cells: Greece country variance **154.08**; Canada sector-imbalance share **10.44%** (specialized mix); IT, Resources, Utilities have highest sector-specific variances (17.97, 26.15, 18.24); Basic Industries has **43.73%** of excess variance from country imbalance (geographic concentration).

---

## 5. Role of Small Stocks (Tables 1, 2, 4)

### Fact 1: Small caps more volatile after controls
Cross-section regression of stock-level monthly USD return SDs (top vs bottom size quintile) on size indicators + 39 country + 34 Level-4 sector dummies:

$$
\sigma_j=a+b_{S(j)}+\text{country dummies}+\text{sector dummies}+\varepsilon
$$

Estimate: $a=13.30$ ($t=130$), $b_1=0.57$ ($t=11.89$) ⇒ small−large gap = **1.14%/mo** in SD.

Naive country-by-country comparison without controls found the small>large pattern in only 21/39 countries—controls are essential.

### Fact 2: Small caps weakly tied to world sectors
Form 39×34×2 country/sector/size portfolios (~1400 nonempty). Time-series regress each on its world sector index; then cross-section the $\beta$, $t(\beta)$, $R^2$ on size+country+sector dummies.

Results (Table 2): relative to grand mean, small caps have $\Delta\beta=-0.28$ (vs large), $t$-stat gap **3.76** (small $t$≈0.83 vs large ≈4.59), $R^2$ drops from ~0.17 (large) to ~0 (small).

### Consequence for HR (Table 4)
Including all stocks vs 80%-cap base case:
- Sector factor variance: **8.48 → 8.02**
- Country factor variance: **28.40 → 28.34** (flat)
- Ratio: **3.35 → 3.53** (more country-tilted)

**Ignoring small stocks overstates sector importance.**

---

## 6. Role of Exposures (Fama–MacBeth style)

Unit exposures rejected: Wald test that each portfolio’s country exposure equals its sector exposure gives $\chi^2=3353$, p=0.00.

Procedure:
1. Use HR factors as first-pass
2. Time-series OLS for exposures $\beta_j,\gamma_j,\delta_j$ (still zero to foreign countries/sectors)
3. Cross-section regress returns on estimated exposures to get second-pass factors
4. Compare $\mathrm{Var}(\kappa)$ vs $\mathrm{Var}(\gamma\kappa)$ style metrics

Second-pass factors correlate **0.994** with HR factors—factors themselves barely change—but **factor-generated variances** change a lot:

| Metric | Country | Sector | Ratio |
|---|---:|---:|---:|
| Base Var(factor) | 28.40 | 8.48 | 3.35 |
| + small stocks | 28.34 | 8.02 | 3.53 |
| Var(exposure×factor) | 25.48 | 2.95 | **8.63** |
| + estimation-error correction | 24.36 | 2.23 | **10.92** |

Ignoring exposure heterogeneity **overstates sectors** (ratio 3.35 vs 8.63). Country exposures are more dispersed across stocks than sector exposures, so country shocks transmit more strongly into individual returns.

---

## 7. Estimation Error Correction

Stacked variance decomposition (equation 17) relates $\mathrm{Var}(\gamma\kappa)$ to moments of exposures and factors. Observed $\widehat{\mathrm{Var}}(\hat\gamma)$ is inflated by $\mathbb{E}[\mathrm{SE}(\hat\gamma)^2]$. Correcting:

$$
\widehat{\mathrm{Var}}(\gamma)=\widehat{\mathrm{Var}}(\hat\gamma)-\mathbb{E}[\mathrm{SE}(\hat\gamma)^2]
$$

(and analogously for covariances) pushes the ratio from **8.63 to 10.92**. Sector exposures are estimated less precisely (sector factors less volatile ⇒ weaker identification), so raw $\mathrm{Var}(\hat\delta\iota)$ was particularly inflated.

---

## 8. HR vs Diversification (Section 7, Figure 6)

Mean-variance frontiers, March 1992–Dec 1999, balanced sample:
- 10 EW Level-3 sector indices
- 34 EW Level-4 sector indices
- 39 country indices

Spanning tests (Huberman–Kandel style):
- Level-4 sectors **not spanned** by 39 countries: Wald **293.67**, p=0.00
- Countries **not spanned** by Level-3 sectors: Wald **70.45**, p=0.00

Graphically, the Level-4 sector frontier lies left of the country frontier—**better risk reduction**—even though HR says country factor variance ≫ sector factor variance.

**Resolution:** HR ranks diagonal variance components; diversification cares about the full covariance matrix. Many country indices co-move in crises; finely sliced sectors can provide lower correlations and more assets. Number of indices also matters (34 vs 10).

IT-sector volatility did **not** alone drive the spanning result (individual intercepts inspected).

---

## 9. Limitations

1. Base case is OECD 1990s—EM inclusion changes country dominance (as Bruner et al. show).
2. Still imposes zero exposure to foreign countries/sectors (like Brooks–Del Negro CFA-style restrictions); Warnock–Cai evidence of foreign exposure via sales is acknowledged but not fully modeled.
3. Two-pass FM ignores first-pass uncertainty except via the SE correction in Section 6.
4. Spanning tests use EW indices—value-weight frontiers could differ.
5. No transaction costs / short-sale constraints in MV analysis.

---

## 10. Practical Takeaways for a Quant Investor

1. **Do not drop small caps** when estimating country vs sector importance for a broad investable universe; doing so biases toward “industry first.”
2. **Risk attribution:** prefer $\mathrm{Var}(\beta_i f_t)$ style contributions over raw factor variances when exposures are heterogeneous.
3. **HR ≠ allocation rule:** even if country factors are more volatile, a sector-based risk-parity or MV sleeve can still improve the frontier—test spanning on your own building blocks.
4. **Research org:** EMU-era shift to sector teams is not automatically validated by HR variance ratios; run both HR and spanning diagnostics.
5. **Estimation hygiene:** correct exposure variances for SE² before declaring sector renaissance.
6. **Metric checklist:** always report (a) Var(factor), (b) Var(exposure×factor), (c) error-corrected (b), (d) MV spanning—four numbers, one paper’s lesson.

---

## 11. Key Numerical Anchors

| Quantity | Value |
|---|---|
| Raw series before filters | 44,318 |
| Base-case countries | 21 OECD |
| Base Var(ω), Var(κ), Var(ι) | 16.52, **28.40**, **8.48** |
| Base ratio κ/ι | **3.35** |
| Small−large SD gap (controlled) | **1.14%/mo** |
| Small vs large sector β gap | **−0.28** |
| Ratio after exposures | **8.63** |
| Ratio after error correction | **10.92** |
| Spanning Wald L4 on countries | **293.67** (p=0) |
| Greece Var(κ) | 154.08 |
| Resources Var(ι) | 26.15 |

---

## 12. Extended Discussion: Why Exposures Favor Countries

Intuition: many stocks are “local” in operations (high country beta, low global sector beta)—especially small caps (Section 4). Sector indices, being global, pull in stocks with heterogeneous and often weak sector affinities. When you multiply a moderate sector factor shock by a small $\delta_j$, contribution to $R_j$ is tiny; when you multiply a large country shock by a large $\gamma_j$, contribution is large. HR’s unit-exposure world forces every stock to absorb the full sector factor, inflating apparent sector importance relative to the exposure-aware metric.

Marsh–Pfleiderer (1997) make a related point with free loadings under classification restrictions; De Moor–Sercu quantify how much the ratio moves (3.35→8.63→10.92).

---

## 13. Extended Discussion: Diversification Paradox

Solnik (1977) already asked whether variance components imply diversification recipes. De Moor–Sercu’s Figure 6 is the modern quantitative answer: **no**. A manager who reads Table 3 and concludes “maximize country diversification, ignore sectors” may leave Sharpe on the table relative to a Level-4 sector allocation—especially if the country set is highly correlated in the left tail.

Conversely, a manager who reads only the spanning tests and concludes “countries are dead” ignores that pure country variance is still 3× sector variance under HR and 10× under error-corrected exposure metrics—country shocks still dominate **individual stock** risk.

**Both diagnostics are required.**

---

## 14. Comparison Within This Batch

| Paper | Main methodological twist | Country vs Sector |
|---|---|---|
| De Moor–Sercu | Small caps, exposures, EIV, spanning | Country dominates variance; sectors can win MV |
| Brooks–Del Negro | Split country into region | Half of country is region |
| Bruner–Conroy–Li | EM IFCI sample | Country ≫ industry in EM |
| Marsh–Pfleiderer | Free loadings on classified factors | Industry 20–30% of cty+ind at stock level |
| Diermeier–Solnik | Foreign-sales identification | Global pricing; HQ≠risk |

---

## 15. Replication Checklist

1. Clean Datastream (or Compustat XpressFeed) with dead lists to avoid survivorship.
2. Apply liquidity/price/cap filters exactly; document remaining N.
3. Build country×sector portfolios before HR regressions.
4. Match WLS weights to zero-sum constraint weights.
5. Report Table-4 style four-row robustness (base / small / exposures / EIV).
6. Run spanning on the same sample window as HR.

---

## 16. Bottom Line

De Moor and Sercu rehabilitate **country dominance** in international equity variance once small stocks, non-unit exposures, and exposure measurement error are respected—pushing the country/sector variance ratio from ~3.3 to ~11. Simultaneously, they warn that HR rankings are not portfolio prescriptions: Level-4 sectors can improve mean-variance frontiers via covariance structure. The sophisticated quant posture is dual: model stock-level risk with strong country factors; construct portfolios with explicit sector diversification tests.


---

## 17. Full Table 3 Country Variance Roster (ppm²)

Australia 18.47; Germany 15.97; Belgium 12.26; Canada 14.87; Denmark 13.95; Spain 20.29; Finland 40.74; France 14.56; **Greece 154.08**; Ireland 15.01; Italy 37.98; Japan 48.38; Netherlands 14.57; Norway 32.34; New Zealand 31.00; Austria 26.72; Portugal 23.70; Sweden 28.17; Switzerland 12.09; UK 12.10; US 9.16. Cross-country average **28.40**.

Sector imbalance shares notable above 3%: Canada 10.44%, Australia 4.52%, Spain 4.96%, Ireland 3.68%, Italy 2.84%, Portugal 2.05%. Most large markets (US, UK, France, Germany, Japan) have imbalance shares <1%—they are diversified enough that pure country ≈ excess country.

---

## 18. Full Table 3 Sector Variance Roster

Basic Industries 2.09 (but country-imbalance share 43.73%!); Cyclical Consumer Goods 2.10; Cyclical Services 1.10; General Industries 1.35; **IT 17.97**; Non-cyclical Consumer 3.94; Non-cyclical Services 4.75; **Resources 26.15**; Financials 7.10; **Utilities 18.24**. Average **8.48**.

Resources and Utilities look “country-like” in volatility; Basic Industries is the clearest case where geography (country imbalance) drives the sector index.

---

## 19. Algebra of Imbalance Effects

Country return decomposition:

$$
CR_k=\omega+\kappa_k+\sum_i\left(\frac{n_{i,k}}{N_k}-w_i\right)\iota_i
$$

Sector imbalance effect = variance of the last sum. Analogously for sectors with country imbalances. Empirically $w_I\approx0.19$, $w_C\approx0.16$ (differential-weight norms), so the gap between country-imbalance effect in sectors (1.05) and sector-imbalance effect in countries (0.41) is mostly from $\mathrm{Var}(\kappa)\gg\mathrm{Var}(\iota)$, not from weight differentials.

---

## 20. Why Confirmatory Factor Analysis Alternatives Matter

Brooks–Del Negro (2003) estimate free own-country/own-sector exposures via EM. De Moor–Sercu’s FM two-pass is a transparent alternative that (a) starts from familiar HR factors, (b) allows diagnostic comparison of Var(factor) vs Var(exposure×factor), (c) works on portfolios to limit EIV. The near-unit correlation (0.994) between first- and second-pass factors reassures that the HR *factors* are robust; the *metric* is what changes the ranking intensity.

---

## 21. Small-Stock Channel, Quantitatively

Two channels when adding small caps to sector indices:
1. Average exposure to the sector falls → less return variance attributed to sector
2. Sector index itself becomes more diversified with low-affinity names → $\mathrm{Var}(\iota)$ falls

Both move the HR ratio toward countries. Country indices already embed small-cap local noise as part of $\kappa$, so adding small caps does not dilute country factors the same way.

For a mega-cap-only world (MSCI World large), sector importance will look higher—consistent with Cavaglia et al.–style findings on large-cap global samples. Know your universe.

---

## 22. Spanning Test Equations

$$
R_x = A + B R_y + E
$$

Test $A=0$. Equivalent to testing whether max Sharpe of $x\cup y$ exceeds max Sharpe of $y$. Significant A for Level-4 on countries means adding fine sectors improves the opportunity set beyond countries alone—even though each sector factor is less volatile than each country factor.

---

## 23. Practitioner Decision Tree

1. Estimating stock-level risk for position sizing / optimization constraints? → Use exposure-aware country-heavy model (ratio ~9–11).
2. Choosing top-down allocation keys for a global developed fund? → Run spanning on your actual instruments; do not trust Var(κ)/Var(ι) alone.
3. Building an EM fund? → Defer to Bruner–Conroy–Li; country first.
4. Debating research department reorganization to sectors? → Require both HR and spanning evidence on *your* coverage; EMU alone is not decisive (Rouwenhorst 1999b).

---

## 24. Numerical Summary Box Expanded

| Step | Country var | Sector var | Ratio |
|---|---:|---:|---:|
| Base HR OECD | 28.40 | 8.48 | 3.35 |
| + all stocks (small) | 28.34 | 8.02 | 3.53 |
| Exposure×factor | 25.48 | 2.95 | 8.63 |
| Error-corrected | 24.36 | 2.23 | 10.92 |
| World factor var | 16.52 | — | — |
| Sector imbalance in cty (avg share) | — | — | 1.98% |
| Country imbalance in sector (avg share) | — | — | 16.06% |

---

## 25. Bottom Line Restated

De Moor & Sercu (2006) show that standard HR implementations **understate country importance** by ignoring small caps, exposure dispersion, and exposure estimation error—and simultaneously that **HR cannot dictate diversification architecture** because covariances can favor sectors. The paper is required reading before any investment committee vote on “country vs sector” organization.


---

## 26. Dataset Geography Weights (Figure 1 reading)

The cleaned stock list is heavily tilted to the US (~37.5% of names in the figure’s distribution), with Japan (~9.3%), UK (~8.4%), and a long tail of smaller markets. Equal-weighted country mean monthly returns (Figure 2) are highest for some EM names (Argentina ~4.4% in the figure’s scale—note these are raw EW country indices over long samples with crises and recoveries). EW country vols (Figure 3) show Argentina ~26%, Brazil ~20%, with DM vols typically 5–8%. Skewness and excess kurtosis figures document fat tails and asymmetry—another reason MV spanning on monthly data can favor finer grids that isolate jump-prone names.

These descriptives justify the paper’s insistence on coverage: a US-heavy, large-cap-only sample will not speak for “international stock returns” writ large.

---

## 27. Formal Statement of Factor-Generated Variance

For country factors:

$$
\mathrm{Var}(\gamma\kappa)=\frac{1}{NT}\sum_{k}\sum_{j\in k}\sum_t\big(\gamma_{j,k}\kappa_{k,t}-\overline{\gamma\kappa}\big)^2
$$

This stacks across assets and time. Relative to $\mathrm{Var}(\kappa)$, it rises when mean-square exposures are large or when high-variance countries also have dispersed exposures. Empirically that description fits countries better than sectors—hence the jump from ratio 3.35 to 8.63.

---

## 28. Error Correction Formulas in Practice

$$
\widehat{\mathrm{Var}}(\gamma)=\widehat{\mathrm{Var}}(\hat\gamma)-\mathbb{E}_j[\mathrm{SE}(\hat\gamma_j)^2]
$$

$$
\widehat{\mathrm{cov}}(\gamma,\kappa)=\widehat{\mathrm{cov}}(\hat\gamma,\kappa)-\widehat{\mathrm{cov}}(\mathrm{SE}(\hat\gamma)^2\text{-terms},\kappa)
$$

(as in equations 18–19). After correction, sector-generated variance falls from 2.95 to 2.23 (about 24%), while country-generated falls only from 25.48 to 24.36 (about 4%). Differential precision is the story.

---

## 29. Connection to Marsh–Pfleiderer (1997)

Marsh–Pfleiderer estimate free loadings with classification restrictions via iterative least squares on DJGI stocks and find industry explains 20–30% of country+industry fitted variation at the **individual stock** level—far above HR’s <1% for **country index** residuals. De Moor–Sercu cite Marsh–Pfleiderer and push further: even starting from HR factors, moving to exposure-aware metrics multiplies the country/sector ratio. Both papers agree that unit-exposure ANOVA understates the role of heterogeneous loadings; they differ in estimation technology (iterative factor LS vs FM two-pass).

---

## 30. EMU and the Policy Debate

Goldman Sachs / Watson Wyatt survey evidence (Brookes 1999) that 65% of managers planned sector-based European organization is the institutional backdrop. De Moor–Sercu’s message to that debate: EMU may raise sector importance relative to *within-Europe* countries, but (a) small-cap local factors remain, (b) exposure-aware metrics still favor countries in broad samples, (c) you still need spanning tests before rewriting the allocation playbook. Galati–Tsatsaronis’s claim that country factors became insignificant post-euro is not supported by this paper’s OECD 1990s base case—and the authors note robustness to periods in the broader literature without conceding insignificance.

---

## 31. What “No Necessary Link” Really Means for CIOs

Suppose HR says $\mathrm{Var}(\kappa)>\mathrm{Var}(\iota)$. Valid inferences:
- A typical stock’s return variance owes more to its country shock than its sector shock (especially under exposure-aware metrics).
- Diversifying across countries *within a sector* likely reduces risk more than diversifying across sectors *within a country*.

Invalid inference:
- “Therefore the global MV frontier is optimized by country allocation first.”

The invalid step jumps from diagonal variance components to the full covariance matrix of indices. Figure 6 + spanning tests falsify that jump for 1992–99 EW indices.

---

## 32. Extended Bottom Line with Implementation

Implement three parallel reports in any global equity risk committee:
1. **HR dashboard** (Var ω, κ, ι and imbalance shares)—update monthly
2. **Exposure-aware dashboard** (Var(γ rem κ), error-corrected)—update monthly on portfolios
3. **Spanning dashboard** (sector indices vs country indices Sharpe / GRS-style tests)—update quarterly

Act on disagreements: if (1) and (2) say country but (3) says sectors improve the frontier, allow sector sleeves with country-factor hedges. That is the De Moor–Sercu synthesis in one operating rule.

**Word-target substance complete for De Moor–Sercu:** country dominates stock-level variance under corrected metrics (ratio ~11); sectors can still win allocation spanning; small caps and exposures are first-order methodology, not footnotes.


---

## 33. Detailed Reading of the Four Issues as an Audit Program

When an external manager claims “we switched to sector allocation because Cavaglia et al. showed industry dominates,” audit with De Moor–Sercu’s four questions:

**Q1 Size:** What is the cap coverage of their study universe? If top 80% only, re-estimate with small caps; expect sector importance to fall.

**Q2 Exposures:** Do they rank Var(factor) or Var(βf)? Demand the latter.

**Q3 Error:** Are exposure variances corrected for SE²? If not, sector-generated variance is upward-biased.

**Q4 Spanning:** Did they test whether sector portfolios improve the MV frontier relative to countries on *their* instruments? If HR variance ratios were their only evidence, the allocation conclusion is a non sequitur.

Failing any of Q1–Q3 biases the narrative toward sectors; failing Q4 misuses HR as a portfolio theorem.

---

## 34. Interaction with EMU Timeline

Hardouvelis et al. (2002) and Emiris (2002) document rising common European factors as EMU became certain. That is compatible with Brooks–Del Negro region effects and with declining within-Europe country $\pi$. It does **not** automatically validate global sector dominance on a 39-country universe including Asia and the Americas. De Moor–Sercu’s OECD base case still finds Var(κ)=28.4 vs Var(ι)=8.5 in the 1990s. EMU is a regional integration shock, not a proof that country factors worldwide are dead.

---

## 35. Mathematical Appendix: Why Ratio Can Flip

From (17), $\mathrm{Var}(\gamma\kappa)$ depends on $\mathbb{E}(\gamma^2)\mathrm{Var}(\kappa)$, $\mathrm{Var}(\gamma)\mathbb{E}(\kappa^2)$, and cross moments. Even if $\mathrm{Var}(\kappa)<\mathrm{Var}(\iota)$ (not the case here), country-generated variance could dominate if $\mathbb{E}(\gamma^2)\gg\mathbb{E}(\delta^2)$. Empirically both $\mathrm{Var}(\kappa)>\mathrm{Var}(\iota)$ *and* exposure second moments favor countries—so every step from base HR to error-corrected exposure metrics moves the same direction (ratio ↑).

---

## 36. Final De Moor–Sercu Synthesis Paragraph

The paper is a methodological and empirical corrective. Methodologically, it separates four conflated questions (coverage, exposures, measurement error, diversification link). Empirically, on carefully cleaned 1990s OECD data, country-specific variance exceeds sector-specific variance by 3× under HR and by ~11× under error-corrected exposure-aware metrics; yet Level-4 sectors are not spanned by countries in MV tests. The quant investor’s job is to hold both truths: **price stock risk with strong country factors; build portfolios with explicit sector-covariance optimization.**


---

## 37. Cleaning Rules as a Replicability Spec

Exact filters used: remove ADRs/GDRs/identical shares/preferreds/warrants/certificates/differential-voting duplicates; remove nameless and one-day error shares; remove funds/trusts/investment cos/financial holdings; drop month-end observations with cap <\$10,000,000, monthly volume <\$100,000, or price <\$1; if volume missing, treat unchanged local-currency price as illiquid and drop both adjacent returns; drop negative book-to-market quotes; manually purge decimal-shift errors, anomalous first prices, returns inconsistent with cap/price/dividends, pre-IPO and post-delisting quotes, typos, and mishandled offerings. After filters, 36% of remaining names lack book values (median cap \$60.9M vs \$135.1M)—proof that book-data requirements would reintroduce large-cap bias the paper fights.

Any replication that uses only Worldscope “complete fundamentals” stocks will recreate the sector-overstatement problem Issue 1 warns about.

---

## 38. Closing Sentence

De Moor and Sercu (2006) leave the country-versus-sector debate with a sharper toolkit and a dual conclusion: under corrected metrics country shocks dominate stock-level variance, yet sector indices can still improve mean-variance frontiers—so measure carefully, and do not confuse ANOVA rankings with portfolio theorems.


### Additional quantitative notes (De Moor–Sercu)
The base-case pure world variance of 16.52 sits between average country (28.40) and average sector (8.48), underscoring that after removing the world factor both dimensions still matter—but unequally. Canada’s 10.44% sector-imbalance share flags resource specialization; Basic Industries’ 43.73% country-imbalance share flags geographic concentration of materials. When we move to exposure-aware metrics, sector-generated variance collapses from 8.48 to 2.95 (then 2.23 after SE correction) while country-generated variance only eases from 28.40 to 25.48 (then 24.36). That asymmetric compression is the empirical content of Issues 2 and 3. Spanning Wald statistics 293.67 and 70.45 (both p=0) are the empirical content of Issue 4: Level-4 sectors improve the opportunity set versus countries, and countries improve it versus Level-3 sectors. Number of building blocks and correlation structure—not only diagonal factor variances—govern diversification.


### Additional quantitative notes (De Moor–Sercu)
The base-case pure world variance of 16.52 sits between average country (28.40) and average sector (8.48), underscoring that after removing the world factor both dimensions still matter—but unequally. Canada’s 10.44% sector-imbalance share flags resource specialization; Basic Industries’ 43.73% country-imbalance share flags geographic concentration of materials. When we move to exposure-aware metrics, sector-generated variance collapses from 8.48 to 2.95 (then 2.23 after SE correction) while country-generated variance only eases from 28.40 to 25.48 (then 24.36). That asymmetric compression is the empirical content of Issues 2 and 3. Spanning Wald statistics 293.67 and 70.45 (both p=0) are the empirical content of Issue 4: Level-4 sectors improve the opportunity set versus countries, and countries improve it versus Level-3 sectors. Number of building blocks and correlation structure—not only diagonal factor variances—govern diversification.
