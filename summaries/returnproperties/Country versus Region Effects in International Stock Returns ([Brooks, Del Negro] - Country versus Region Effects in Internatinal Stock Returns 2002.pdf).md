# Country versus Region Effects in International Stock Returns (Brooks & Del Negro, 2002/2004)

**Bibliographic header**
- **Authors:** Robin Brooks (IMF Research Department) and Marco Del Negro (Federal Reserve Bank of Atlanta)
- **Title:** Country versus Region Effects in International Stock Returns
- **Outlet:** Federal Reserve Bank of Atlanta Working Paper 2002-20b (August 2004 revision); related companion work forthcoming in *Journal of Empirical Finance* on comovement / IT bubble
- **JEL:** G11, G15
- **Keywords:** diversification, risk, international financial markets, industrial structure
- **Sample:** Monthly total USD returns, January 1985–April 2003, **9,679 stocks**, **42** developed and emerging markets, **40** Datastream Level-4 industries
- **Core claim:** Roughly **half** of the return variation conventionally attributed to Heston–Rouwenhorst (HR) country effects is actually region effects; within-region country effects explain the other half. Diversifying across countries *within* Europe delivers about half the risk reduction of diversifying globally across regions.

---

## 1. Problem and Motivation

A central empirical regularity in international portfolio construction is the dominance of **country effects** over industry effects in explaining cross-sectional return variation. This has been documented globally (Griffin & Karolyi 1998), in Western Europe (Heston & Rouwenhorst 1994, 1995), and in emerging markets (Serra 2000). The practical inference drawn by many investors is that the first cut in top-down allocation should be by country (or, later in the literature, by industry once EMU / globalization allegedly shifts the balance).

Brooks and Del Negro ask a sharper question that the standard HR decomposition does not answer: when the HR model attributes a large share of variance to “country,” how much of that is **common regional co-movement** versus **idiosyncratic within-region country shocks**? For a Dutch investor, the decision “diversify within Europe versus diversify globally” hinges exactly on this split. If country effects are mostly Europe-wide, then adding Spain after Germany adds less than adding Japan after Germany.

Related literature had already noted a decline in the relative importance of country effects and a rise in industry effects (Cavaglia, Brightman & Aked 2000; L’Her, Sy & Tnani 2002). Brooks and Del Negro’s companion work argues that much of the late-1990s industry surge was temporary and concentrated in IT-bubble sectors. The present paper abstracts from that debate and instead **disaggregates the country block itself**.

---

## 2. Setup and Data

### Universe
- **9,679** stocks in **42** developed and emerging markets
- Monthly **total returns in USD**, January 1985–April 2003
- Industry classification: **40** Datastream Level-4 industries
- Authors state (citing their forthcoming JEF companion) that the sample is a realistic representation of the global equity market

### Regional taxonomy (MSCI-aligned)
Six regions, splitting each of three geographies into developed vs emerging:
1. Developed Americas (US, Canada)
2. Emerging Americas (Argentina, Brazil, Chile, Colombia, Mexico, Peru)
3. Developed Asia (Australia, Hong Kong, Japan, New Zealand, Singapore)
4. Emerging Asia (Malaysia, South Korea, Thailand, Philippines, Taiwan, India, Indonesia, China)
5. Developed Europe (17 countries including UK, France, Germany, Italy, Nordics, Iberia, Benelux, Greece, Portugal, Luxembourg, etc.)
6. Emerging Europe (South Africa, Turkey, Poland, Czech Republic — note South Africa is grouped here following the authors’ MSCI-style designation in the paper)

This six-region partition is the benchmark; robustness drops Developed Americas (to address US domination) and switches to equal weighting / local currency.

---

## 3. Model and Methods (with formulas)

### Baseline HR model
The classic Heston–Rouwenhorst cross-sectional dummy regression each month:

$$
R_{i,t}=\alpha_t+\sum_{j=1}^{J}\beta_{j,t}I_{ij}+\sum_{k=1}^{K}\gamma_{k,t}C_{ik}+e_{i,t}
$$

with capitalization (or equal) weight constraints so that industry and country effects are deviations from the market:

$$
\sum_j w_{j,t}\beta_{j,t}=0,\qquad\sum_k w_{k,t}\gamma_{k,t}=0.
$$

Here $\alpha_t$ is the capitalization-weighted mean return, $\beta_{j,t}$ pure industry effects, $\gamma_{k,t}$ pure country effects.

### Augmented region / within-region decomposition
Brooks–Del Negro rewrite the country block as region effects $\lambda_s$ plus within-region country effects $\pi_{sk}$:

$$
R_{i,t}=\alpha_t+\sum_{j=1}^{J}\beta_{j,t}I_{ij}+\sum_{s=1}^{S}\lambda_{s,t}M_{is}+\sum_{s=1}^{S}\sum_{k=1}^{K_s}\pi_{sk,t}C_{isk}+e_{i,t}
\tag{1}
$$

Constraints:

$$
\sum_{j=1}^{J}w_j\beta_j=0\tag{2}
$$

$$
\sum_{s=1}^{S}w_s\lambda_s=0\tag{3}
$$

$$
\sum_{k=1}^{K_s}w_{sk}\pi_{sk}=0\quad\text{for each region }s\tag{4}
$$

**Exact nesting property:** Region effects are capitalization-weighted means of the original HR country effects within each region. Within-region country effects are deviations of HR country effects from the regional mean. Equation (1) therefore **exactly partitions** HR country effects into region + within-region components and extracts the same total variation as HR.

### Metrics
1. **Median pairwise correlation** of HR country effects within vs across regions (evidence that region structure is embedded in country effects).
2. **$R^2$ attribution** over time (2-year lagged moving averages): full HR; country-only (industry coefficients set to zero); region-only (within-region and industry set to zero).
3. **Key ratio:**

$$
\text{Region share}=\frac{R^2(\text{region only})}{R^2(\text{region}+\text{within-region country})}
$$

averaged over the full sample, first two years, and last two years, with Delta-method standard errors (Greene 1993) and a normal test of change:

$$
t=\frac{x_2-x_1}{\sqrt{\mathrm{Var}(x_1)+\mathrm{Var}(x_2)}}.
$$

4. **Diversification diagram** (HR 1994 style): average portfolio variance as $N$ goes from 1 to 40, as % of average single-stock variance, for within-country, within-region, and global portfolios.

Estimation each month is **market-cap weighted** in the baseline.

---

## 4. Results with Numbers

### 4.1 Region structure inside HR country effects (Table 1, Panel A)
Median pairwise correlations of HR country effects, September 1993–April 2004 (when all countries are in the panel):

| Scope | All markets | Mature | Emerging |
|---|---:|---:|---:|
| World | **6.79%** | 12.86% | 12.38% |
| Europe | **21.61%** | 25.29% | 16.70% |
| Asia | **15.42%** | 19.76% | 17.84% |
| Americas | **20.16%** | **39.36%** | 30.94% |

Interpretation: global median correlation of country effects is only ~7%, but **within regions** it rises to 15–39%. Americas mature markets (US–Canada) show the strongest co-movement (39%). This is direct evidence that “country” in HR is partly “region.”

### 4.2 Half of “country” is region (Table 1, Panel B)
$R^2$ ratios (region / (region + within-region)), percent:

| Specification | Full sample 1985.1–2003.4 | First 2y | Last 2y | p-value of decline |
|---|---:|---:|---:|---:|
| All markets | **52.30** | 58.95 | 45.85 | **1.14%** |
| Ex-Developed Americas | **47.61** | 53.86 | 42.38 | 3.23% |
| Mature markets | **51.23** | 56.53 | 49.36 | 23.84% |
| Emerging markets | **48.16** | 78.77 | 35.58 | 14.92% |
| USD, equal-weight | **35.53** | 41.02 | 35.21 | 22.08% |
| Local FX, equal-weight | **31.14** | 30.10 | 33.27 | 54.63% |

**Headline:** on average, region effects account for **~52%** of the variation HR attributes to country effects. The result is robust to dropping the US-dominated Developed Americas (still ~48%). Mature and emerging markets look similar (~51% vs ~48%). Equal weighting and local-currency returns lower the region share to the low-30s, but region remains economically large.

The decline in region share from ~59% early to ~46% late is statistically significant for the full sample (p≈1%). For mature markets the decline is insignificant; for emerging markets the point decline is large (79%→36%) but noisy (p≈15%).

### 4.3 Time path of $R^2$ (Figure 1)
- Early sample: region effects alone explain ~**15%** of international return variation.
- Late sample (last two years): region effects alone explain only **5.52%**.
- The well-known decline in HR country effects is **driven largely by the decline in region effects**, not by a collapse of within-region country heterogeneity.

### 4.4 Diversification diagram (Figure 2)
Average portfolio variance as % of average stock variance (value-weighted construction, full sample):
- **Global portfolio:** ~**10%** of average stock variance
- **Within country (across industries):** ~**20%**
- **Within regions (across countries and industries):** ~**15%**

The within-region line sits **roughly halfway** between within-country and global—visual confirmation that region and within-region country effects are of comparable importance. For the average investor, diversifying across countries *inside* a region delivers about half the incremental risk reduction available from going fully global.

---

## 5. Limitations and Caveats

1. **US domination of Developed Americas:** The authors address this by dropping the region; the region share falls only modestly (52%→48%). Still, any six-region taxonomy embeds judgment.
2. **Emerging Europe taxonomy:** Grouping South Africa with Turkey/Poland/Czech is MSCI-style for the paper’s vintage but is economically awkward; results are not shown as sensitive to that single classification choice.
3. **Industry effects sidelined:** The paper’s focus is the country→region split; it does not re-litigate Cavaglia et al.’s industry-vs-country race except via the companion IT-bubble argument in footnotes.
4. **USD denomination:** Equal-weight local-currency specs cut the region share toward ~31%, so FX is not irrelevant—though even then region is large.
5. **Sample ends 2003–2004:** Post-GFC, EMU deepening, and China A-share opening are out of sample; the qualitative “half region / half within-region” claim should be re-estimated on modern data before hard-coding into risk models.
6. **Value vs equal weight:** Cap-weighting emphasizes large names and can inflate regional co-movement through mega-cap multinationals; equal-weight results are weaker on the region share.

---

## 6. Practical Takeaways for a Quant Investor

1. **Do not treat “country residual” in an HR-style risk model as purely sovereign/idiosyncratic.** Roughly half is regional. A Europe country book that is long Italy / short Germany has much less true diversification than a Europe / Asia tilt of similar tracking error.

2. **Risk budgeting:** If your multi-factor model has country factors only, consider an explicit **region factor layer** (Developed Europe, EM Asia, etc.) with country factors constrained to be orthogonal within region—exactly the Brooks–Del Negro nesting. This improves interpretability of active risk and avoids double-counting regional shocks as “stock selection.”

3. **Allocation hierarchy:** For a European allocator, **intra-Europe country diversification ≈ half the benefit of global diversification** on this sample. That is a quantitative input to the “how much home-region bias can I live with” question, not a license for home bias.

4. **Time variation:** Region effects compressed from ~15% to ~5.5% $R^2$ by the early 2000s. Risk models estimated on 1980s–early-1990s data will overstate regional diversification benefits relative to a 2000s (or 2020s) covariance structure. Use expanding or rolling windows.

5. **EM vs DM:** Do not assume EM is “all country, no region.” The region share is statistically similar (~48–51%). EM regional blocs (EM Asia, LatAm) matter for risk the same way developed blocs do.

6. **Implementation check:** When you build “pure country” portfolios à la HR for research or PAA, report both (a) raw country $R^2$ and (b) the region / (region+within) ratio. If (b) is near 50%, your “country” signal is half a regional macro bet.

7. **Link to industry debate:** The paper’s companion view that late-1990s industry dominance was IT-bubble contaminated implies that a simultaneous rise in industry $R^2$ and fall in region $R^2$ can be a single phenomenon (global TMT shock), not proof of permanent structural reordering. Stress-test industry-first allocation rules on ex-TMT samples.

---

## 7. Equations Recap (estimator view)

Monthly WLS/cap-weighted regression of (1) s.t. (2)–(4) yields $\{\hat\alpha_t,\hat\beta_{j,t},\hat\lambda_{s,t},\hat\pi_{sk,t}\}$. Define:

$$
R^2_{\text{region},t}=\frac{\mathrm{Var}\!\left(\sum_s\hat\lambda_{s,t}M_{is}\right)}{\mathrm{Var}(R_{i,t})}
$$

$$
R^2_{\text{country block},t}=\frac{\mathrm{Var}\!\left(\sum_s\hat\lambda_{s,t}M_{is}+\sum_{s,k}\hat\pi_{sk,t}C_{isk}\right)}{\mathrm{Var}(R_{i,t})}
$$

The paper’s central statistic is the time-average of $R^2_{\text{region},t}/R^2_{\text{country block},t}\approx 0.52$.

---

## 8. Bottom Line

Brooks and Del Negro take the HR country effect—long treated as atomic—and split it cleanly into **region** and **within-region country**. Empirically, the split is approximately **50/50** on 1985–2003 global data, robust across DM/EM and to dropping the US-heavy Americas region. The late-sample decline in country importance is largely a decline in **region** importance. For portfolio construction, that means intra-regional country diversification is real but incomplete: you still need cross-regional exposure to capture the other half of the historical country-effect diversification benefit.


---

## 9. Deeper Methodological Notes for Practitioners Replicating HR+Region

### 9.1 Why the nesting matters
Many applied papers estimate country and industry dummies and then *informally* discuss “Europe vs Asia.” Brooks–Del Negro’s contribution is to make that discussion **identifiable and variance-additive**. Because region effects are defined as weighted averages of HR country effects, you never face the collinearity problem of putting both unrestricted country dummies and region dummies in one regression without constraints. The within-region $\pi_{sk}$ are literally orthogonal (in the weighted sense of constraint (4)) to the region factor of that region.

In code, a clean implementation is:
1. Run standard HR → obtain $\hat\gamma_{k,t}$ for each country-month.
2. For each region $s$, set $\hat\lambda_{s,t}=\sum_{k\in s}(w_{k,t}/w_{s,t})\hat\gamma_{k,t}$.
3. Set $\hat\pi_{k,t}=\hat\gamma_{k,t}-\hat\lambda_{s(k),t}$.
4. Verify $\sum_{k\in s}w_{k,t}\hat\pi_{k,t}=0$.

This two-step reconstruction is algebraically identical to estimating (1)–(4) jointly when the same weights are used.

### 9.2 $R^2$ with coefficients zeroed out
The paper’s country-only and region-only $R^2$ lines are **not** from separate regressions that omit industry. They are constructed by taking the full HR (or augmented) fit and setting the unwanted coefficient blocks to zero before computing explained variance. That preserves the same $\alpha_t$ and the same residual definition as the full model, making the lines comparable in Figure 1. Practitioners who instead re-estimate nested regressions without industry will get different numerical $R^2$ paths; the qualitative ranking usually survives, but levels shift.

### 9.3 Delta-method inference on the ratio
Let $r_t=R^2_{\mathrm{reg},t}/R^2_{\mathrm{ctyblock},t}$. The paper averages $r_t$ over windows and uses the Delta method on the monthly ratio’s variance. The terminal-vs-initial test is a two-sample normal test that ignores serial correlation of overlapping two-year windows—so the reported p≈1% for the full-sample decline is best read as “statistically detectable under the paper’s assumptions,” not as a HAC-robust claim. For risk-model monitoring, prefer Newey–West on the monthly ratio series.

---

## 10. Connection to the Broader Country-vs-Industry Literature

Place this paper on the timeline:

| Paper | Design | Headline |
|---|---|---|
| Heston–Rouwenhorst 1994/95 | Europe, unit exposures, dummy ANOVA | Country ≫ industry |
| Griffin–Karolyi 1998 | Global, finer industries | Country still dominant; industry larger than HR suggested |
| Cavaglia–Brightman–Aked 2000 | Global, late 1990s | Industry overtakes country |
| Brooks–Del Negro (this WP) | Global 1985–2003, region split of country | Half of “country” is region; region $R^2$ falls over time |
| Brooks–Del Negro (JEF companion) | Same universe | Late industry surge partly IT bubble |

The logical bridge: if HR country effects contain a large regional component, then a *global* industry factor that loads on the same regional business-cycle shocks can appear to “steal” explanatory power from country as markets integrate regionally (EMU, NAFTA, ASEAN trade). Distinguishing **true industry integration** from **regional macro compression** requires exactly the decomposition here.

Quant implication: when your research committee cites Cavaglia et al. to justify an industry-first book, demand a companion Brooks-style region split. If region $R^2$ fell while industry $R^2$ rose one-for-one during 1998–2000, the industry-first case is weaker than headline charts suggest.

---

## 11. Worked Diversification Arithmetic

Suppose average single-stock variance is normalized to 100.
- Within-country diversified portfolio variance ≈ 20
- Within-region diversified ≈ 15
- Global diversified ≈ 10

Incremental variance reduction:
- Country→Region: $20-15=5$ points (25% of the country-level variance, or half of the total 10-point gap from country to global)
- Region→Global: $15-10=5$ points

So the **marginal risk reduction of leaving your home region equals the marginal risk reduction of leaving your home country for the rest of the region**—on average, over this sample. That symmetry is the paper’s portfolio punchline.

For an investor already diversified across Developed Europe, the next unit of risk budget is better spent on Developed Asia or EM Asia than on adding another European peripheral—unless the European peripheral has uncorrelated residual $\pi$ that your optimizer correctly prices. In HR space, that residual is exactly $\hat\pi_{sk,t}$.

---

## 12. Robustness Digests

**Drop Developed Americas.** Concern: US is so large that “Developed Americas region effect” ≈ “US country effect.” Excluding those stocks, region share remains **47.6%** vs **52.3%**. The half-region result is not a US artifact.

**Mature vs emerging.** Mature **51.2%**, emerging **48.2%**. Emerging markets are often caricatured as pure country risk; this paper says their country effects are about as regional as DM country effects. Caveat: Emerging Europe’s early-sample region share (78.8% in first two years) collapses later (35.6%)—integration and sample composition both move.

**Equal weight.** Region share falls to **35.5%** (USD) / **31.1%** (local). Equal weight upweights small markets and small stocks, which are more idiosyncratic (see also De Moor–Sercu 2006 on small-cap sector affinity). Cap-weight results are more relevant for institutional benchmarks; equal-weight results matter for research claiming “typical stock” behavior.

**Local currency.** Moving from USD to local FX under equal weight barely changes the ratio (35.5→31.1) and erases the time decline (p=55%). FX conversion is not the main driver of the region share under cap weights (the paper’s primary design).

---

## 13. What the Paper Does *Not* Say (Avoid Over-Reading)

- It does **not** say industry effects are unimportant. Industry is estimated throughout; the focus is the country block’s internal structure.
- It does **not** provide a forecasting model for region vs country premia—only variance attribution.
- It does **not** optimize portfolios; Figure 2 is an average-variance diversification curve, not a mean-variance frontier (contrast Gerard–Hillion–de Roon spanning tests, and De Moor–Sercu Section 7).
- It does **not** identify *economic* drivers of region effects (trade, monetary unions, common risk appetite). Those are left as interpretation.

---

## 14. Implementation Checklist for a Multi-Asset Risk Team

1. **Data:** Align country membership to a stable MSCI-like developed/emerging flag; document reclassifications (Greece, Korea, etc.).
2. **Weights:** Match the constraint weights to the regression weights (cap or equal)—inconsistency silently biases $\lambda$ vs $\pi$.
3. **Reporting:** Monthly dashboard with (i) HR country $R^2$, (ii) region $R^2$, (iii) region share ratio, (iv) median within-region country-effect correlation.
4. **Stress:** Recompute around EMU launch (1999), Asia crisis (1997–98), and TMT peak (2000). Expect region $R^2$ spikes in crises that are regional, industry $R^2$ spikes in TMT.
5. **Overlay:** Map active country bets to region-neutral + within-region. Charge risk differently: region bets against a global macro budget; within-region against a country-selection budget.
6. **EM books:** Apply the same six-region (or updated) taxonomy—do not run “flat” 20-country EM models without a regional layer.

---

## 15. Numerical Anchors to Remember

- Stocks: **9,679**; countries: **42**; industries: **40**; regions: **6**
- Sample: **1985:01–2003:04** (correlations from **1993:09**)
- Median HR country-effect correlation: world **6.8%** vs within-region **15–39%**
- Region share of country-block $R^2$: **~52%** (full), **~48%** ex-Dev. Americas
- Region-only $R^2$: **~15%** early → **5.52%** late
- Diversification curve: country **20%** / region **15%** / global **10%** of average stock variance
- Equal-weight region share: **~31–36%**

---

## 16. Synthesis for Giuseppe Paleologo–Style Use

As a quant investor, treat Brooks–Del Negro as a **constraint design paper** more than a return-prediction paper. It tells you how to structure the country block of a fundamental risk model so that estimated factors correspond to economically distinct bets. The 50/50 split is an empirical calibration from 1985–2003, not a universal constant—but the *nesting* is always valid. Re-estimate the ratio on your live universe quarterly; use the live ratio to set the relative risk budgets of regional overlays versus country selection. If your current ratio is 0.35 rather than 0.52, your world is more about within-region idiosyncrasy than theirs was—and your Europe-only diversification is worth less than their Figure 2 suggests.


---

## 17. Extended Discussion of Table 1 Correlations

The median pairwise correlation matrix of HR country effects is the paper’s cleanest “existence proof” for region structure. A median world correlation of 6.8% says that the typical pair of country pure returns is nearly uncorrelated—consistent with the classical case for international diversification. Yet conditioning on region membership multiplies that correlation by roughly **3× to 6×**.

Americas mature markets at **39.4%** deserve special comment. With only two markets (US, Canada), the “median pairwise” is simply the US–Canada correlation of HR country effects. That high number validates the concern that Developed Americas is almost a US factor—but the robustness row that drops Developed Americas still finds a **47.6%** region share globally, so the paper’s headline does not hinge on US–Canada.

Europe’s mature-market median of **25.3%** is the EMU-relevant statistic. Even before full monetary union effects fully appear in the sample’s early years, Western European country effects already co-move far above the world baseline. Emerging Europe’s **16.7%** is lower, reflecting greater policy and institutional heterogeneity (Turkey, South Africa, Poland, Czech).

Asia sits in between (**15.4%** all, **19.8%** mature, **17.8%** emerging). Japan’s weight in Developed Asia means the developed-Asia region effect is partly a Japan factor plus Australia/HK/Singapore/NZ satellites—analogous to the US issue in the Americas. The paper does not run an ex-Japan robustness for Asia; a practitioner should.

---

## 18. How This Changes an Active EMU Book

Consider an EMU equity long/short book with country overlays. Pre-Brooks intuition: country overlays are high-Sharpe expressions of local macro views. Post-Brooks: a large fraction of every EMU country overlay is a **common Developed Europe** factor. If you are long Spain and long Italy versus short France and short Germany, the within-region $\pi$ bets may partially cancel the regional $\lambda$, but if you are simply long periphery versus short core without neutralizing the region, you are running a regional (or “risk-on Europe”) factor with a country costume.

Operational fix:
- Estimate $\hat\lambda_{\text{DevEurope},t}$ and $\hat\pi_{k,t}$ weekly.
- Attribute PnL of country overlays to $\lambda$ vs $\pi$.
- Risk-limit $\lambda$ separately (often against a global equity or European equity futures hedge).
- Evaluate country specialists on $\pi$-only residual performance.

---

## 19. Relationship to Currency

Under equal weighting, switching from USD to local currency barely moves the region share (35.5%→31.1%) and eliminates the significant time decline. That pattern suggests:
1. Cap-weighted USD results embed some common-currency (dollar) co-movement across regions.
2. The *economic* region structure in local returns is still large (~31%).
3. FX is a second-order contributor to the *ratio*, even if FX matters for absolute country variance (as Bruner–Conroy–Li also find for EM, where currency explains ~12% of pure country variance on average).

For a USD-based LP reporting risk in dollars, use the USD cap-weight numbers. For a local-liability European pension, lean on local-currency equal- or cap-weight variants.

---

## 20. Final Quantitative Summary Box

| Quantity | Value |
|---|---|
| N stocks | 9,679 |
| N countries | 42 |
| N industries (DS L4) | 40 |
| N regions | 6 |
| Sample | 1985:01–2003:04 |
| Region share of country-block $R^2$ | **52.3%** |
| Same, ex-Dev. Americas | **47.6%** |
| Mature / Emerging region shares | **51.2% / 48.2%** |
| Early vs late region share | **59.0% → 45.9%** (p≈1%) |
| Region-only $R^2$ early vs late | **~15% → 5.52%** |
| Median corr HR country effects (world) | **6.8%** |
| Median corr within Europe / Asia / Americas | **21.6% / 15.4% / 20.2%** |
| Diversification: cty / region / global var ratio | **20% / 15% / 10%** of avg stock var |

**One-sentence takeaway:** About half of what the literature calls “country effects” is regional co-movement; intra-regional diversification therefore buys only about half of the classical international diversification benefit.


---

## 21. References Cited in the Paper (Annotated)

- **Heston & Rouwenhorst (1994, JFE; 1995, JPM):** Foundational ANOVA dummy methodology; European evidence that industrial structure does not explain most of the country diversification benefit.
- **Griffin & Karolyi (1998):** Global sample; country still dominates but industry matters more than early European estimates suggested once industries are finely defined.
- **Serra (2000, Emerging Markets Review):** Country vs industry in EM—country dominates (consistent with Bruner–Conroy–Li 2004).
- **Cavaglia, Brightman & Aked (2000, FAJ):** Industry overtakes country in late 1990s—the claim Brooks–Del Negro partially qualify via their IT-bubble companion paper.
- **L’Her, Sy & Tnani (2002, JPM):** Document declining country loadings in portfolio management practice.
- **Greene (1993):** Delta-method reference for ratio inference.
- **Brooks & Del Negro (forthcoming JEF):** Rise in comovement—market integration or IT bubble?

Together these citations frame the paper as a *refinement* of HR rather than a rejection: keep the dummy technology, add an economically motivated region layer, and re-interpret half of the country variance.


---

## 22. Closing Note on Measurement Frequency and Horizon

All estimation is monthly. Region effects that appear as 52% of the country block at a monthly horizon could look different at daily or quarterly horizons: high-frequency co-movement is often more global/regional, while low-frequency variation can be more country-fiscal. The diversification diagram (Figure 2) is a full-sample average-variance curve, so it inherits the full-sample 50/50 average rather than the late-sample 46% region share. Live risk systems should recompute Figure-2-style curves on rolling five-year windows to track whether intra-regional diversification is gaining or losing efficacy.
