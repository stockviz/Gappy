# Another Look at the Role of the Industrial Structure of Markets for International Diversification Strategies — Griffin & Karolyi (1998) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Another Look at the Role of the Industrial Structure of Markets for International Diversification Strategies |
| **Authors** | John M. Griffin (Arizona State University); G. Andrew Karolyi (Richard Ivey School of Business, University of Western Ontario) |
| **Version** | September 1997 (working paper / pre-publication); comments welcome |
| **Sample** | Dow Jones World Stock Index; **25 countries**, **66 industries** (+45 sub-industries); **>2,400 stocks**; daily coverage from **31 Dec 1991** through **1 Apr 1995**; primary analysis on **Wednesday-to-Wednesday weekly** USD (and local-currency) continuously compounded returns |
| **Method** | Cross-sectional WLS dummy-variable regressions of country×industry value-weighted index returns each week (Heston–Rouwenhorst / Solnik–de Freitas style), with value-weighted zero-sum constraints on industry and country effects; variance decomposition of pure country vs cumulative industry components; traded vs non-traded goods classification (Bodnar–Gentry 1993); Datastream individual-stock covariance diversification limits (577 stocks, Jan 1993–Apr 1995) |
| **Original PDF** | `Diversification_GriffinKarolyi_1998.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMscDYzSThKY3N2LVk` |
| **Extraction** | `pdftotext -layout`; clean extractable text (~8,320 words of source). |

JEL / related: international diversification, industry vs country factors, Roll (1992), Heston–Rouwenhorst (1994, 1995), Lessard (1974).

---

## Problem / Motivation

Classic evidence (Grubel 1968; Levy–Sarnat 1970; Solnik 1974) shows low cross-country index correlations and large risk-reduction benefits from international diversification. Two competing stories explain *why*:

1. **Country / policy diversity**: monetary/fiscal policy, rates, deficits, growth differ across borders.
2. **Industrial-structure diversity**: countries simply have different industry mixes; a U.S. investor overweight oil/rubber domestically might partially replicate Indonesia exposure without going abroad.

**Lessard (1974)** posed the industry-vs-country question early. **Roll (1992)** revived it with daily data (24 countries, Apr 1988–Mar 1991) and attributed ~**40%** of country-index volatility to industry factors and ~**23%** to FX. **Heston and Rouwenhorst (1994)** showed Roll’s industry extraction *embeds country effects* (no country dummies; industry factors absorb country), and with monthly returns on **7 industries × 12 European countries (1978–1992)** found industrial composition explains **<1%** of national-index volatility differences.

Griffin–Karolyi re-open the debate with a richer dataset—**66 industries**, **25 countries** including Asia-Pacific and emerging markets (Mexico, Thailand, Hong Kong, Malaysia, Indonesia)—asking:

- Does finer industry partitioning resurrect Roll’s industry importance?
- Do **traded-goods** industries (internationally priced inputs/outputs) show larger pure industry factors than **non-traded** (high transport-cost) industries?
- What are the practical diversification limits of country-only vs industry-only vs unrestricted strategies?

---

## Setup and Data

### Dow Jones World Stock Index

Introduced 1993 as investable global benchmarks. Companies assigned to industry codes by line-of-business (revenue-weighted multi-line). Screens for liquidity, foreign access, convertibility, share classes. Indices published daily in WSJ; available in local currency and USD.

**Coverage (Table 1 Panel A — industries per country, companies in parentheses):**

| Country | # industries | Country | # industries |
|---------|-------------|---------|-------------|
| US (713) | 64 | Japan (514) | 54 |
| UK (255) | 53 | France (117) | 42 |
| Canada (129) | 40 | Germany (91) | 35 |
| Australia (75) | 30 | Hong Kong (79) | 29 |
| Malaysia (76) | 24 | Italy (73) | 24 |
| Singapore (51) | 21 | Thailand (70) | 19 |
| Switzerland (59) | 19 | Sweden (40) | 18 |
| Spain (32) | 15 | Denmark (32) | 14 |
| Indonesia (32) | 14 | Austria (22) | 12 |
| New Zealand (17) | 12 | Belgium (36) | 11 |
| Netherlands (30) | 20 | Norway (19) | 7 |
| Finland (27) | 8 | Ireland (11) | 9 |
| Mexico (31) | 9 | | |

> Half of 66 industries cover ≥9 countries. Small markets (Norway, Finland, Ireland, Mexico) have <10 industries.

**Nine aggregate sectors** (Panel B codes): Basic (B), Consumer Cyclical (C), Consumer Non-cyclical (N), Energy (E), Finance (F), Independent (I), Industrial (D), Technology (T), Utilities (U).

**Traded-goods industries** (Bodnar–Gentry 1993; marked T): e.g. Food, Chemicals, Paper, Steel, Oil secondary/majors, Textiles, Auto manufacturing, Semiconductors, Computers, Pharmaceuticals, Coal, Mining, Precious metals, Tobacco, Cosmetics, Factory equipment, Oil equip & services, Heavy machinery, Office equipment, Software, etc. Non-traded examples: Media, Real estate, Conglomerates, Heavy construction, Plantations, Overseas trading, Banks, Insurance, Retailers, Lodging, Airlines, Utilities (electric/gas/water/telephone), Savings & loans.

### Design tradeoffs vs prior work

| Feature | Roll (1992) | Heston–Rouwenhorst (1994) | Griffin–Karolyi |
|---------|-------------|---------------------------|----------------|
| Frequency | Daily | Monthly | Weekly (primary); daily sensitivity |
| Countries | 24 | 12 Europe | 25 global incl. EM |
| Industries | 7 (implicit) | 7 | 66 + 9 aggregates |
| Unit of analysis | Country indices | Individual stocks | Country×industry VW indices |
| Period | 1988–1991 | 1978–1992 | 1992–1995 |

**Why weekly?** Daily non-synchronous trading across time zones (US last, Japan first) biases down estimated industry comovement—authors argue daily captures ~half of industry-specific variation. Weekly tempers but does not eliminate auto-/cross-covariance dynamics (Hamao–Masulis–Ng; Lin–Engle–Ito; Karolyi–Stulz).

**Index-level vs stock-level regression:** Authors prove (appendix available on request; Kmenta §9.2 / Haitovsky) that WLS on condensed country×industry indices equals WLS on individual stocks when all cross-sectional dispersion in dummies comes from group means—no information loss.

---

## Model / Methods

### Dummy-variable regression (each week)

$$
R_{ic} = \alpha + \sum_{j=1}^{66} \beta_j I_{ij} + \sum_{k=1}^{25} \gamma_k C_{ik} + e_{ic}
$$

where $R_{ic}$ is the return on industry-$i$ value-weighted index in country $c$.

**Identification constraints** (Kennedy 1986; value-weighted):

$$
\sum_{j=1}^{66} w_j \beta_j = 0, \qquad \sum_{k=1}^{25} v_k \gamma_k = 0
$$

with $w_j$, $v_k$ world-market value weights. Then $\hat\alpha$ = return on the **value-weighted world market**; $\hat\beta_j$ = pure industry effect; $\hat\gamma_k$ = pure country effect.

Estimation: **WLS each week**; stack coefficients into time series.

### Variance decomposition

**Country index (e.g. Canada):**

$$
R_{AC} = \hat\alpha + \sum_{i=1}^{66} x_{AC,i}\,\hat\beta_i + \hat\gamma_{AC}
$$

where $x_{AC,i}$ = industry-$i$ weight in Canada’s market. Excess-over-world variation attributed to (i) cumulative industry composition and (ii) pure country effect.

**Industry index (e.g. steel):**

$$
R_{STL} = \hat\alpha + \sum_{j=1}^{25} \phi_{j,STL}\,\hat\gamma_j + \hat\beta_{STL}
$$

**Ratio metric:** variance of pure effect / variance of index excess over world.

### Traded vs non-traded tests

1. Mean/median industry-effect variances by traded/non-traded category (Table 4).
2. Pool industries within category; compute F-tests on equality of variances of pure industry effects and of cumulative country effects (F = 1.59 country; F = 0.79 industry — text states both reject equality).

### Diversification-limit diagnostic (Section 5)

Datastream sample of **577** Dow Jones constituents with continuous prices Jan 1993–Apr 1995. Average local-currency weekly stock variance **21.67 %²**. Limits:

- Same country, different industries → industry-only diversification floor.
- Same industry, different countries → country-only floor.
- Different country *and* industry → unrestricted floor.

Computed separately for 9 broad vs 66 fine industries; traded vs non-traded; G-6 vs emerging.

---

## Empirical / Theoretical Results with Numbers

### Table 2 — Nine broad sectors, weekly USD

**Country side (pure country variance, %²/week; ratio to market excess):**

| Country | Pure country var | Ratio | Cum. industry var | Ratio |
|---------|-----------------|-------|-------------------|-------|
| US | **1.508** | 1.00 | 0.010 | 0.01 |
| Canada | 3.231 | 0.98 | 0.021 | 0.01 |
| **Mexico** | **30.877** | 1.00 | 0.075 | 0.00 |
| Italy | 15.732 | 1.02 | 0.157 | 0.01 |
| Finland | 17.944 | 1.00 | 0.110 | 0.01 |
| Thailand | 19.358 | 1.02 | 0.208 | 0.01 |
| Hong Kong | 12.479 | 1.02 | 0.111 | 0.01 |
| Malaysia | 12.436 | 1.00 | 0.040 | 0.00 |
| Indonesia | 9.900 | 0.99 | 0.042 | 0.00 |
| Japan | 5.875 | 0.99 | 0.017 | 0.00 |
| UK | 2.301 | 0.97 | 0.017 | 0.01 |
| France | 2.986 | 1.01 | 0.006 | 0.00 |
| Germany | 3.741 | 1.08 | 0.050 | 0.01 |
| Netherlands | 1.990 | 1.00 | 0.137 | 0.07 |
| … | … | … | … | … |
| **Mean (Median)** | **8.042 (5.780)** | **1.01 (1.00)** | **0.087 (0.075)** | **0.02 (0.01)** |

Key: Mexico’s pure country variance ≈ **20×** the US. Cumulative industry effects explain on average only **~2%** of country-index excess variance (vs Heston–Rouwenhorst’s **7.1%** in Europe-only).

**Industry-sector side:**

| Sector | Cum. country var | Ratio | Pure industry var | Ratio |
|--------|------------------|-------|-------------------|-------|
| Basic | 0.029 | 0.05 | 0.556 | 0.93 |
| Independent | 1.006 | 0.63 | 0.658 | 0.41 |
| Cyclical | 0.046 | 0.20 | 0.261 | 1.14 |
| **Energy** | 0.458 | 0.24 | **1.614** | 0.86 |
| Finance | 0.177 | 0.18 | 0.741 | 0.75 |
| Industrial | 0.273 | 0.67 | 0.231 | 0.56 |
| Non-cyclical | 0.226 | 0.23 | 0.674 | 0.69 |
| Technology | 0.095 | 0.09 | 0.869 | 0.87 |
| Utilities | 0.166 | 0.22 | 0.732 | 0.96 |
| **Mean** | **0.275** | **0.28** | **0.704** | **0.80** |

Average pure-country variance **8.042** vs average pure-industry **0.704** → ratio **≈12:1**, larger than Heston–Rouwenhorst—driven by emerging-market countries with huge country effects.

### Table 3 — 66 disaggregated industries (summary in text)

- Mean pure **country** variance ≈ **8.02 %²** (nearly identical to Table 2).
- Mean cumulative **industry** variance for country indices ≈ **0.187 %²** → still only **~4%** of country excess variance.
- Mean pure **industry** variance rises to **2.416 %²** (vs 0.704 with 9 sectors).
- Mean cumulative country variance for industry indices ≈ **1.019 %²**.
- Pure country / pure industry ≈ **8.02 / 2.416 ≈ 4:1** — country still dominates, but industry effects are larger with finer partitions.

**Cross-section of industry effects:** Real estate, overseas trading, conglomerates, plantations, factory equipment: pure industry <40% of total industry-index variance. Auto manufacturing, computers, electric utilities, office equipment, semiconductors: almost all variance from pure industry. Some high ratios (health care, pipelines, S&Ls) are estimation artifacts (≤3 countries).

**Local-currency robustness (unreported):** Industry-effect variances nearly identical to USD; country effects smaller once nominal FX stripped—still ~4% industry share of country variance.

### Table 4 — Traded vs non-traded

| | Traded goods | Non-traded |
|--|--------------|------------|
| Mean (median) pure industry var | **2.764 (1.988)** %² | **2.189 (1.596)** %² |
| Share of total industry-index var | **~85%** | **~70%** |
| Mean (median) cum. country var | **0.751 (0.727)** (~15%) | **1.194 (0.849)** (~30%) |

Of five highest pure-industry ratios (>99%): all but one (electric utilities) are traded. Of five lowest (<45%): all but one (factory equipment) are non-traded. F-tests reject equality of variances across categories.

### Diversification limits (Figures 1a–1b; Datastream 577 stocks)

| Strategy | Broad 9 industries | Fine 66 industries |
|----------|--------------------|--------------------|
| Within-country, across industries | **21.9%** of avg stock var | **21.75%** |
| Within-industry, across countries | **8.4%** | **8.14%** |
| Unrestricted (diff country & industry) | **7.06%** | **7.11%** |

Interpretation: **country diversification within an industry nearly achieves the global floor**; industry diversification within a country leaves residual variance ~3× higher (~22% vs ~7%).

**Traded-goods / G-6 nuance (unreported tables):** In G-6 (US, JP, UK, FR, DE, CA), pure country diversification *within traded-goods industries* floors at **10.9%** vs unrestricted **6.4%**—so industry tilt toward tradables *does* impair diversification. Non-traded: almost no difference between same-industry and cross-industry cross-country covariances.

---

## Limitations

1. **Short sample (1992–1995):** precise weekly estimates but limited ability to study time-varying integration (Harvey; Bekaert–Harvey; Longin–Solnik).
2. **Weekly non-synchronicity residual:** still imperfect for Asia–Europe–US.
3. **Index investability screens:** may underweight illiquid names that matter for true country risk.
4. **Traded/non-traded classification:** Bodnar–Gentry mapping is judgmental; some industries (electric utilities) behave like tradables in the data.
5. **Diversification diagnostic uses only 577 stocks** with continuous histories—survivorship / liquidity bias.
6. **Currency risk premium:** local-currency returns still embed real FX risk (Dumas–Solnik); neither USD nor local isolates “pure” equity factors.
7. **Emerging-market country effects dominate averages**—Europe-only samples look different (Heston–Rouwenhorst 1995 conjecture confirmed).

---

## Practical Takeaways for a Quant Investor

1. **Country first, industry second for global equity risk budgeting.** Pure country variance ≈ 4–12× pure industry variance depending on industry granularity. A country-neutral global industry book does *not* replicate a country-diversified book.
2. **Industrial composition of country indices explains ≤4% of their excess variance**—you cannot “fake” international diversification with domestic industry tilts (Roll’s 40% claim does not survive country controls).
3. **Traded-goods / commodity / tech industries are the exception:** pure industry factors can exceed 85–99% of index variance. Overweighting oil ADRs, global resources mutual funds, semis, or autos abroad *without* country diversification leaves substantial industry common-factor risk. G-6 traded-goods within-industry diversification floor **10.9%** vs unrestricted **6.4%**.
4. **Non-traded / domestic-service industries** (real estate, media, construction, conglomerates): country dominates; international expansion within the same industry still diversifies almost as well as cross-industry.
5. **EM country risk is order-of-magnitude larger** (Mexico 30.9 %²/week vs US 1.5)—any global risk model that treats country factors as homogeneous will mis-size EM.
6. **Implementation:** prefer value-weighted world as the intercept benchmark; use WLS with market-cap constraints; prefer weekly over daily for cross-market industry studies; classify industries by tradability when sizing industry vs country risk budgets.
7. **Risk model design:** a global fundamental risk model should retain strong country factors even with 60+ industries; industry factors should be more important for tradable sectors.

---

## Equations Quick Reference

$$
R_{ic}=\alpha+\sum_j\beta_j I_{ij}+\sum_k\gamma_k C_{ik}+e_{ic},\quad \sum w_j\beta_j=0,\ \sum v_k\gamma_k=0
$$

$$
R_{\text{country}}=\hat\alpha+\sum_i x_i\hat\beta_i+\hat\gamma,\qquad
R_{\text{industry}}=\hat\alpha+\sum_j\phi_j\hat\gamma_j+\hat\beta
$$

Variance share ≈ $\mathrm{Var}(\text{pure})/[\mathrm{Var}(\text{pure})+\mathrm{Var}(\text{cumulative other})]$.


---

## Extended Discussion of Related Literature and Identification

### Roll (1992) vs Heston–Rouwenhorst (1994) identification failure

Roll posits three forces behind country-index variation: (1) index-construction / diversification differences across countries, (2) industrial composition, (3) real and nominal FX. He estimates industry factors via Fama–MacBeth-style cross-sections assuming each country’s return is a mix of seven industry factors plus idiosyncratic noise *independent across countries*. Because country effects are omitted, estimated “industry” factors absorb country shocks. Heston–Rouwenhorst replicate Roll’s procedure on their European sample and obtain spuriously negative industry-portfolio correlations—smoking-gun evidence of contamination.

Griffin–Karolyi’s dual dummy structure with value-weighted zero-sum constraints is the clean identification: every return is exactly one country and one industry; the world market is the intercept; pure effects are orthogonal (by construction of WLS residuals) to all dummies.

### Why emerging markets change the conclusion

Heston–Rouwenhorst (1995 JPM follow-up) conjectured that samples outside Europe would raise the country-effect share. Griffin–Karolyi confirm: Mexico (30.9), Thailand (19.4), Finland (17.9), Italy (15.7), Hong Kong (12.5), Malaysia (12.4) dominate the cross-section. The mean pure-country variance of 8.04 %²/week is not a G-7 number—it is an EM-inclusive average. A Europe-only or G-7-only risk budget would look closer to Heston–Rouwenhorst’s milder country dominance.

### Economic mechanism for traded goods

From Dornbusch (1973, 1987) open-economy macro and Adler–Dumas / Levi corporate FX exposure: for tradables, the exchange rate is the relative price of domestic vs foreign goods, so FX and global commodity shocks jointly move cash flows of firms in the same industry worldwide. Coal is the textbook case—homogenous internationally traded input/output; supply/demand shocks hit all producers. For non-tradables (high transport costs), local demand, regulation, and national business cycles dominate—hence larger country factors. Empirical FX-exposure studies (Bodnar–Gentry 1993; Allayannis 1996; Williamson 1996 auto industry) motivate the classification and predict exactly the Table 4 pattern.

### Integration and correlation trends

The paper situates itself in the rising-integration literature (Harvey 1991; Chan–Karolyi–Stulz 1992; Bekaert–Harvey 1995; Dumas–Solnik 1995; DeSantis–Gerard; Longin–Solnik 1995; Errunza–Hogan–Hung). Even if average correlations rise with liberalization and trade, *relative* industry vs country importance need not shift one-for-one because market caps and firm entry/exit also change. Short 1992–95 window is therefore both a feature (recent, post-liberalization) and a limitation (cannot estimate slow structural change).

---

## Full Country Variance Table Commentary

Reading Table 2 left panel carefully:

- **Low country-effect cluster (developed, large, diversified):** US 1.51, Netherlands 1.99, UK 2.30, France 2.99, Switzerland 3.16, Belgium 3.17, Canada 3.23, Germany 3.74. These are the markets where a global industry model has the best chance of mattering relative to country.
- **Mid cluster:** Austria 4.46, Australia 5.50, NZ 5.20, Denmark 5.64, Ireland 5.78, Japan 5.88, Norway 6.41, Sweden 6.92, Spain 7.04, Singapore 7.44.
- **High / EM / peripheral:** Indonesia 9.90, Malaysia 12.44, Hong Kong 12.48, Italy 15.73, Finland 17.94, Thailand 19.36, Mexico 30.88.

Netherlands’ cumulative industry ratio (0.07) and Switzerland’s (0.06) are the highest among countries—consistent with concentrated industrial structure (e.g., Dutch energy/chemicals; Swiss pharma/financials)—yet still single-digit shares.

On the industry side of Table 2, **Energy** has the largest pure industry variance (1.614) and Independent the largest cumulative country share (0.63)—Independents (conglomerates, overseas trading, plantations) are geographically concentrated and poorly diversified.

---

## Methodological Notes for Replication

1. **Return definition:** weekly continuously compounded USD (and local) returns, Wednesday close to Wednesday close.
2. **WLS weights:** proportional to index market caps (country×industry cell caps).
3. **Missing cells:** many country–industry pairs empty (Table 1); regression uses available cells only each week—degrees of freedom vary.
4. **Finer vs coarser industries:** re-estimate (1) replacing 66 industry dummies with 9 sector dummies; compare variance ratios.
5. **Diversification covariances:** for stocks $i,j$, average $\mathrm{Cov}(r_i,r_j)/\overline{\mathrm{Var}}$ conditional on same/different country and same/different industry membership.

### Pseudo-code for weekly estimation

```
for each Wednesday t:
    build panel of R_{ic,t} for all non-empty (i,c)
    run WLS of R on industry dummies + country dummies
         s.t. sum_j w_j beta_j = 0, sum_k v_k gamma_k = 0
    store alpha_t, beta_{j,t}, gamma_{k,t}
then:
    for each country c: Var(gamma_c), Var(sum_i x_{c,i} beta_i)
    for each industry j: Var(beta_j), Var(sum_k phi_{k,j} gamma_k)
```

---

## Quant Investor Checklist (Operational)

| Decision | Implication from paper |
|----------|------------------------|
| Global equity risk model | Keep country factors as first-order; do not replace with industries |
| Industry tilt in EM | Country risk still dominates; industry overlay is secondary |
| Commodity / energy / tech global book | Size industry factor risk explicitly; within-industry cross-country diversification incomplete |
| Domestic “international” proxies (ADRs, sector ETFs) | Poor substitute for true country diversification except insofar as they load on non-domestic country factors |
| Currency hedging | Local-currency analysis shrinks country variances but does not resurrect industry’s role for country indices |
| Horizon | Weekly factor estimates; daily overstates independence across regions |

---

## Connection to Subsequent Literature (context for the reader)

This paper sits in the lineage that later produced **Cavaglia–Brightman–Aked**, **Baca–Garbe–Weiss**, **Phylaktis–Xia**, and the industry-vs-country debate of the 2000s (some finding rising industry importance post-euro / post-IT). Griffin–Karolyi’s 1992–95 snapshot is an early-1990s baseline: country still wins overall; tradability is the key cross-sectional modifier. For a quant building a 2020s risk model, treat their ratios as historical calibration points, not immutable constants—but the *identification method* (dual dummies + value-weighted constraints + tradability split) remains best practice.

---

## Numerical Summary Box

| Metric | Value |
|--------|-------|
| Sample | Jan 1992 – Apr 1995, weekly, 25 countries, 66 industries |
| Mean pure country var (9 sectors) | 8.042 %²/week |
| Mean cum. industry var (country indices) | 0.087 %² (~2% share) |
| Mean pure industry var (9 sectors) | 0.704 %² |
| Country:Industry variance ratio (9 sectors) | ~12:1 |
| Same with 66 industries | country 8.02; industry 2.416; ratio ~4:1 |
| Industry share of country excess var (66) | ~4% |
| Traded pure industry mean | 2.764 (85% of total) |
| Non-traded pure industry mean | 2.189 (70% of total) |
| Diversification floor within country | ~22% of avg stock var |
| Diversification floor within industry across countries | ~8.1–8.4% |
| Unrestricted floor | ~7.1% |
| G-6 traded within-industry floor | 10.9% vs unrestricted 6.4% |
| Mexico / US pure country var | 30.88 / 1.51 ≈ 20× |

---

## Closing Synthesis

Griffin and Karolyi deliver a clean negative answer to Roll’s industry-composition conjecture and a nuanced positive answer on *when* industry matters: **tradable goods**. For country indices that investors actually hold (MSCI/FTSE country ETFs), industrial structure is a rounding error (≤4%). For a portfolio concentrated in global oil, mining, autos, or semiconductors, industry factors are first-order and country diversification within those industries is incomplete. The practical mandate for a quant multi-asset or global equity process is therefore **hierarchical**: allocate across countries first; within countries (or within a global industry book), manage industry exposures with tradability-aware factor models; never assume domestic industry tilts substitute for international diversification.


---

## Worked Example: Interpreting a Country Index

Suppose Canada’s weekly excess return over the world is +2%. Using equation (5):

$$
R_{AC}-\hat\alpha = \underbrace{\sum_i x_{AC,i}\hat\beta_i}_{\text{industry mix}} + \underbrace{\hat\gamma_{AC}}_{\text{pure Canada}}
$$

If Canada is overweight mining, non-ferrous metals, and forest products relative to the world, the industry-mix term is positive when those global industry factors rally. Table 2 says that for Canada the variance of the industry-mix term is only **0.021** vs pure country **3.231**—so roughly **99%** of Canada’s excess volatility is “being Canada,” not “being a mining-heavy index.” A U.S. investor who loads domestic mining stocks to “get Canada exposure” captures the small industry-mix piece and misses the dominant country piece.

Conversely, for the global semiconductor industry index, almost all variation is $\hat\beta_{\text{semi}}$; the country-mix term (US + Japan + Korea weights) is secondary. Hedging a semi overweight with a country-neutral basket still leaves the industry factor.

## Worked Example: Diversification Arithmetic

Average stock weekly variance = 21.67 %². Unrestricted covariance floor ≈ 0.071 × 21.67 ≈ **1.54 %²**. Within-country floor ≈ 0.219 × 21.67 ≈ **4.75 %²**. Within-industry cross-country ≈ 0.084 × 21.67 ≈ **1.82 %²**.

Relative to holding one stock:
- Country diversification within an industry removes ~**(21.67−1.82)/21.67 ≈ 91.6%** of variance.
- Industry diversification within a country removes ~**(21.67−4.75)/21.67 ≈ 78.1%**.
- Full global diversification removes ~**92.9%**.

The incremental gain from adding industry diversification on top of country diversification is only ~**(1.82−1.54)/21.67 ≈ 1.3 percentage points** of average-stock variance—tiny. The incremental gain from adding country diversification on top of industry diversification is ~**(4.75−1.54)/21.67 ≈ 14.8 points**—large.

## Sensitivity: Equal- vs Value-Weight Mentality

Although the paper estimates on value-weighted indices (appropriate for market-cap benchmarks), the Datastream diversification diagnostic is closer to equal-weight stock picking. Active quants running equal-weight or risk-parity country books should expect *larger* country effects in equal-weighted EM portfolios (Mexico/Thailand single-stocks dominate). Value-weight global indices dilute EM country shocks by cap.

## Data Quality and Industry Assignment

Dow Jones revenue-weighted multi-line assignment is more economically coherent than primary-SIC alone, but:
- Conglomerates and “Independent” sector are residual categories with high country contamination.
- Banks/insurance classified non-traded yet are highly globally correlated via rates and credit—classification is about goods trade, not financial linkages.
- Software/semiconductors with only 3–5 countries have noisy $\hat\beta$—shrink industry factors toward sector aggregates for thin industries.

## Relation to Currency Overlay

USD analysis = unhedged US investor. Local-currency = hedged against *nominal* FX. Pure country variances fall under local currency but industry’s share of country-index variance stays ~4%. Conclusion for hedged investors: country equity factors remain dominant; currency overlay is a separate decision that does not resurrect the industry-composition story for country indices.

## Summary Paragraph for Investment Committee

> Griffin and Karolyi (1998), using Dow Jones World Stock Index weekly returns for 25 countries and 66 industries (1992–1995), show that industrial composition explains only ~2–4% of the variance of country index returns in excess of the world market. Pure country factor variances average ~8%² per week versus pure industry ~0.7–2.4%² depending on aggregation. Country-to-industry variance ratios are ~12:1 (9 sectors) to ~4:1 (66 industries). Traded-goods industries (energy, autos, semis, pharmaceuticals) are the exception, with industry factors explaining ~85% of their index variance versus ~70% for non-tradables. Diversification diagnostics on 577 stocks confirm that cross-country diversification within industries nearly achieves the global risk floor (~8% of average stock variance vs ~7% unrestricted), whereas within-country industry diversification leaves ~22%. For portfolio construction: prioritize country diversification; treat global industry concentration in tradables as a distinct risk; do not use domestic industry tilts as a substitute for international exposure.
