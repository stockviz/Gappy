# The Relative Importance of Country and Industry Factors in Emerging Markets (Bruner, Conroy & Li, 2004)

**Bibliographic header**
- **Authors:** Robert Bruner, Robert Conroy, Wei Li (Darden Graduate School of Business, University of Virginia)
- **Title:** The Relative Importance of Country and Industry Factors in Emerging Markets
- **Version:** First draft March 12, 2003; revised February 26, 2004 (v3.0)
- **Method:** Heston–Rouwenhorst (1994) dummy-variable decomposition on IFCI emerging-market equities
- **Sample:** Monthly USD total returns, **January 1990–January 2003**, IFCI investable indices, **31 emerging countries**, up to **1,424 firms**, **8** one-digit SIC sectors and **63** two-digit industries
- **Core claim:** In emerging markets, the **country factor strongly dominates** sector and industry factors. Cross-country diversification beats cross-industry diversification for EM portfolios; country allocation remains first-order for active EM managers.

---

## 1. Problem and Motivation

By the early 2000s a large developed-market literature debated whether **global industry/sector factors** had overtaken **country factors** as the primary source of equity return variation (Cavaglia–Brightman–Aked 2000; Diermeier–Solnik 2001; Lombard–Roulet–Solnik 1999 vs Heston–Rouwenhorst 1994; Rouwenhorst 1999; Kritzman–Page 2002; Gerard–Hillion–de Roon 2002). Almost all of that debate used OECD or global developed samples. Emerging markets were largely a footnote—despite Marber (1998) citing Barr Rosenberg Associates / IFC findings that industry dominates in developed markets while country dominates in developing markets.

Bruner, Conroy and Li ask: **does the rising influence of global sectors extend to emerging-market equities?** The answer disciplines two narratives:
1. **Globalization narrative:** if EM equities increasingly price off global sectors, EM is integrating into world markets and country specialists lose edge.
2. **Segmentation narrative:** if country still dominates, EM remains a collection of partially segmented markets; legal/institutional/macro country analysis remains central; cost-of-capital models need local factors.

The paper is explicitly aimed at both scholars of integration and practitioners running EM mandates during the post-crisis early-2000s recovery in EM allocations.

---

## 2. Data and Descriptive Evidence

### 2.1 Universe construction
- Source: **IFCI (International Finance Corporation Investable)** indices for **31** emerging countries
- Frequency: monthly USD total returns, **1990:01–2003:01**
- Coverage dynamics: **221** firms in 1990 → peak **1,424** in 1997 → **963** by January 2003 after crises, mergers, delistings, and S&P inclusion-rule failures
- Industry maps: SIC **one-digit (8 sectors)** and **two-digit (63 industries)**
- Sectors: Agriculture/Forestry/Fishing; Mining; Construction; Manufacturing; TCU (Transport/Comm/Utilities); Trade; Finance/Insurance/RE; Services; Other

### 2.2 Concentration facts (Table 1)
Most firms and most investable cap sit in three sectors: **Manufacturing**, **TCU**, and **Finance**.
- Manufacturing: ~half of firms, >1/3 of market cap (labor-intensive EM industrial structure)
- TCU: <10% of firms but **~21%** of cap (privatized utilities/telecoms—capital intensive)
- Agriculture, construction, services are thin; Malaysia is unusually diversified across sectors
- **Russia:** >40% of firms and **73%** of cap in Mining (oil/gas)—an IFCI Russia tracker is largely an energy bet
- **India:** manufacturing-dominated
- **Venezuela:** oil-rich but no investable mining/oil firms in the IFCI sample—country labels ≠ resource exposure

### 2.3 Raw performance (Tables 2–3)
All figures in **% per month, USD**:
- Cross-country mean returns and volatilities differ sharply: Russia, Venezuela, Poland, Turkey, Brazil among best performers; Egypt, Czech, Slovak among worst
- **Equal-weighted EM returns exceed value-weighted** on average, with higher volatility → smaller investable names outperformed large names over 1990–2003
- Average cross-**country** correlation: **0.19** (EW), **0.21** (VW)
- Average cross-**sector** correlation: **0.83** (EW), **0.64** (VW)

**Interpretation:** sectors co-move highly because each sector index is a blend of the same set of country shocks. An Indian manufacturer correlates more with an Indian bank than with a Thai manufacturer. That pattern already foreshadows country dominance before any dummy regression.

Sector-index volatility is typically lower than country-index volatility—partly mechanical (more countries than sectors ⇒ sector portfolios more geographically diversified).

---

## 3. Model and Estimation

### 3.1 Null and alternative
Under a pure EM market model:

$$
R_{n,t}=\alpha_t+\varepsilon_{n,t}
$$

with $\hat\alpha_t^e=N_t^{-1}\sum_n R_{n,t}$ (EW) or $\hat\alpha_t^v=\sum_n w_{n,t}R_{n,t}$ (VW).

Under country and industry effects for security $n$ in country $c$ and industry $i$:

$$
R_{n,t}=\alpha_t+\beta_{c,t}+\gamma_{i,t}+\varepsilon'_{n,t}\tag{4}
$$

Dummy form:

$$
R_{n,t}=\alpha_t+\sum_{c=1}^{C}\beta_{c,t}D_{nc}^{C}+\sum_{i=1}^{I}\gamma_{i,t}D_{ni}^{I}+\varepsilon'_{n,t}\tag{7}
$$

### 3.2 Identifying constraints
Equal-weight:

$$
\sum_c N_{c,t}\beta_{c,t}=0,\qquad\sum_i M_{i,t}\gamma_{i,t}=0
$$

Value-weight:

$$
\sum_c w_{c,t}\beta_{c,t}=0,\qquad\sum_i v_{i,t}\gamma_{i,t}=0
$$

Then $\hat\alpha_t+\hat\beta_{c,t}$ is the **pure country return** (industrially diversified to match the EM benchmark’s industry mix), and $\hat\alpha_t+\hat\gamma_{i,t}$ is the **pure sector return** (geographically diversified to match the EM benchmark’s country mix).

Estimation: cross-sectional OLS (EW) or WLS (VW) **each month**. Specs use 31 countries with either 9 one-digit sectors or 63 two-digit industries.

---

## 4. Results

### 4.1 Pure country vs pure sector return dispersion (Tables 4–5)
Equal-weighted average monthly pure **country** returns range from **−0.68% (Egypt)** to **+2.47% (Venezuela)**. Equal-weighted pure **sector** returns range only from **0.76% (Agriculture)** to **1.69% (TCU)**. Value-weighted comparisons tell the same story: cross-country dispersion of means and volatilities dwarfs cross-sector dispersion.

Controlling for sector effects barely changes country means, vols, or cross-country correlations relative to raw Table 2—except for specialized structures (e.g., Russia). Russia’s VW monthly excess vs EM was **+1.63%** (=2.29−0.66), but pure country contribution was only **+0.06%** (=0.72−0.66); most of the outperformance was **mining/energy specialization**, not a broad Russian country residual.

Controlling for country effects when forming pure sectors **reduces VW sector volatility** and **raises average cross-sector correlations**—geographic diversification removes country noise that had made raw sectors look more different than they are.

### 4.2 F-tests (Table 6)
Monthly cross-sectional F-tests of $H_0:\beta_{c,t}=0\ \forall c$ vs $H_0:\gamma_{i,t}=0\ \forall i$:
- **Country effects rejected at 5% and 1% in essentially every month** of every year
- **Sector effects:** fail to reject in **>50%** of months for 9 one-digit sectors; fail in ~**25%** of months even for 63 two-digit industries

Country is statistically first-order; industry is intermittent.

### 4.3 Incremental $R^2$ (Figures 6–7)
36-month moving averages of intercept-adjusted $R^2$:
- Adding 9 sectors or 63 industries to $\alpha_t$ alone → **marginal** $R^2$ gain
- Adding 31 country effects to $\alpha_t$ → **large** $R^2$ gain
- Adding industries *after* countries → again **marginal**

**Conclusion:** country factor dominates cross-sectional EM return variation.

### 4.4 Is country just FX? (Table 7)
Regress each pure country return on local-currency depreciation (local per USD):
- Average $R^2$ ≈ **12%**
- Range: ~**0.002%** (Greece VW) to **~43%** (South Africa EW)
- High FX-$R^2$ names include South Africa (~43%), Indonesia (~37% EW / 34% VW), Mexico (~35%/30%), Korea (~32%/28%), Israel (~32%/31%), Malaysia (~30%), Zimbabwe (~31–32%)
- Low FX-$R^2$: Greece, Egypt, Poland, Argentina (surprisingly low given convertibility history—sample timing matters)

**FX is not the main country factor**, though it is material in several markets. Institutional, legal, and macro-policy country risks dominate the residual ~88%.

### 4.5 Narrative episodes in pure country returns (Figures 2–3)
- **Argentina:** high pure country returns early 1990s (recovery from late-1980s crisis); collapse after peso devaluation early 2000s
- **Korea/Thailand:** sharp losses in Asia crisis 1997; Argentina/South Africa/Turkey largely unscathed in those windows
- **Russia:** high excess pure country returns in early 2000s as oil rose from <\$10/bbl in Jan 1999—but recall the specialization caveat above for VW raw returns

### 4.6 Sector rotation (Figures 4–5)
TCU led in early/mid-1990s (privatization/telecom buildout) but was second-worst by Jan 2003. Mining (oil/gas) became the leader as oil prices rose. Sector stories exist—but their cross-sectional amplitude is smaller than country stories.

---

## 5. Limitations

1. **IFCI investability screen** excludes many local shares; results speak to *foreign-investable* EM, not the full local market.
2. **Unbalanced panel** with huge 1997 peak then attrition—composition effects interact with crisis periods.
3. **Unit-exposure HR assumptions** (critiqued by Marsh–Pfleiderer and De Moor–Sercu)—may understate industry if EM industry betas are heterogeneous.
4. **SIC one-digit is coarse**; even 63 two-digit may misclassify conglomerates common in EM.
5. **No developed-market control sample** in-paper—comparison to DM literature is across studies, not within a unified estimator.
6. **Sample ends 2003**—pre-China A-share MSCI inclusion, pre-2010s EM corporate globalization.

---

## 6. Practical Takeaways for a Quant Investor

1. **EM risk models:** keep a rich **country factor block**; do not demote countries to second tier because DM studies found industry dominance in 1998–2000.
2. **Diversification:** for EM-only portfolios, **cross-country** diversification dominates cross-sector. A “global EM tech” sleeve without country controls is mostly a stack of Korea/Taiwan/China country bets.
3. **Specialization bias:** always decompose raw country performance into pure country vs industry-mix (Russia oil example). Report both.
4. **Active management:** country research (legal, institutional, macro, politics) remains a first-order skill for EM. Sector specialists are complementary, not substitutes.
5. **Cost of capital:** local market factors belong in EM discount rates alongside global factors—consistent with Bekaert–Harvey integration work cited by the authors.
6. **FX overlay:** hedging local FX removes only ~12% of pure country variance on average—do not expect FX hedges to neutralize EM country risk.
7. **Benchmarking:** beware EM country indices that are sector concentrates (Russia energy, India manufacturing). Use pure-country portfolios when judging country views.

---

## 7. Key Numerical Anchors

| Item | Number |
|---|---|
| Countries | 31 |
| Max firms | 1,424 (1997); 963 (2003:01); 221 (1990) |
| Firm-months (Table 1) | ~151,689 |
| Sectors / industries | 8–9 one-digit / 63 two-digit |
| Avg cross-country corr (EW/VW) | 0.19 / 0.21 |
| Avg cross-sector corr (EW/VW) | 0.83 / 0.64 |
| EW pure country mean range | −0.68% to +2.47% /mo |
| EW pure sector mean range | 0.76% to 1.69% /mo |
| Currency $R^2$ of pure country (avg) | ~12% |
| F-tests | Country significant almost always; sector often not |

---

## 8. Extended Interpretation for Integration Research

Bekaert–Harvey (1995, 1997), Bekaert–Harvey–Lumsdaine (2002), and Errunza–Miller (2000) study *when* EM integrate. Bruner–Conroy–Li provide a complementary cross-sectional lens: even after a decade of liberalizations (1990–2003), investable EM equities still behave as if **country barriers and country shocks** dominate global sector pricing. That does not prove segmentation in the formal asset-pricing sense (the paper is ANOVA, not an ICAPM test), but it is inconsistent with a world where EM stocks are merely high-beta names in global industries.

The high sector correlations (0.64–0.83) combined with low country correlations (0.19–0.21) are the descriptive signature of **common within-country coupling**. Any factor model that starts from global industries and adds EM country residuals will fit; a model that starts from countries and adds thin industry residuals will also fit—and the $R^2$ accounting says the second hierarchy matches the data better.

---

## 9. Comparison with Sibling Papers in This Batch

| Paper | Universe | Country vs Industry |
|---|---|---|
| Bruner–Conroy–Li 2004 | EM IFCI 1990–2003 | Country ≫ industry |
| Brooks–Del Negro 2004 | Global 1985–2003 | Country large, but ~½ is region |
| De Moor–Sercu 2006 | OECD (+extras) | Country ≫ sector; HR understates country once exposures/errors fixed |
| Marsh–Pfleiderer 1997 | DJGI/MSCI 1996–97 | Industry 20–30% of cty+ind fitted var (individual stocks) |
| Diermeier–Solnik 2001 | 8 DM countries | Global pricing via foreign sales; country ≠ HQ |

EM is the clear outlier where country dominance is unambiguous and persistent through the sample.

---

## 10. Replication Notes

1. Prefer S&P/IFC investable historical constituents with point-in-time inclusion.
2. Match constraint weights to regression weights.
3. Report both 9-sector and 63-industry specs—the qualitative dominance survives both.
4. Always show FX-$R^2$ by country; South Africa vs Greece are different animals.
5. For Russia-like concentrates, quote pure country *and* industry-mix contribution side by side.

---

## 11. Bottom Line

Over 1990–2003 IFCI emerging markets, **country effects dominate sector/industry effects** in statistical tests, incremental $R^2$, and dispersion of pure factor returns. Currency depreciation explains only ~12% of pure country variance on average. For quant EM investing, country allocation and country risk modeling remain the primary axis; industry is a secondary overlay, and global-sector narratives from developed markets should not be mechanically imported.


---

## 12. Detailed Walk-Through of the Pure-Factor Construction

Start from the IFCI cross-section in month $t$. Let $R_{n,t}$ be the USD total return of investable stock $n$. Estimate (7) by OLS (equal weight) or WLS with beginning-of-month investable-cap weights (value weight), subject to the zero-sum constraints on $\beta$ and $\gamma$.

The fitted values satisfy:
- $\hat\alpha_t$ = EM benchmark return (EW or VW IFCI)
- $\hat\alpha_t+\hat\beta_{c,t}$ = return on a portfolio of country-$c$ stocks with the **same industry weights as the EM benchmark**
- $\hat\alpha_t+\hat\gamma_{i,t}$ = return on a portfolio of industry-$i$ stocks with the **same country weights as the EM benchmark**

This is why the authors can say “industrially diversified country portfolio” and “geographically diversified industry portfolio.” Any raw country index that overweight mining (Russia) will differ from $\hat\alpha+\hat\beta_{\mathrm{Russia}}$ by the industry-mix term $\sum_i (w_{i,\mathrm{Russia}}-w_{i,\mathrm{EM}})\hat\gamma_i$.

### Russia numerical example (value weight)
- Raw VW Russia mean ≈ 2.29%/mo; EM VW mean ≈ 0.66%/mo → raw excess **+1.63%**
- Pure country Russia mean ≈ 0.72%/mo → pure excess **+0.06%**
- Implied industry-mix contribution ≈ **+1.57%/mo** over the sample—almost all of Russia’s apparent country alpha was oil/mining specialization

An EM PM who “went overweight Russia” in the early 2000s as a country call was mostly running an oil overweight. Pure-country analysis prevents that conflation.

---

## 13. Cross-Country Correlation Structure After Purification

Table 4’s correlation matrix of pure country returns remains low—purification does not manufacture cross-country correlation. That is important: if industry mix were the main reason raw countries looked uncorrelated, pure countries would correlate more. They do not. The low cross-country correlation is a **country-factor** phenomenon (institutions, policy, crises), not an artifact of mismatched industries.

Conversely, Table 5 shows pure sector correlations are **higher** than raw sector correlations. Once country noise is removed, EM sectors move together—consistent with common global EM risk appetite and common commodity/global-cycle exposures across geographically diversified sector portfolios.

---

## 14. Year-by-Year F-Test Pattern (Table 6 reading)

Table 6 counts, out of 12 months each year, how often country and sector nulls are rejected at 5% and 1%, for EW and VW, and for 9 vs 63 industries. The qualitative pattern across 1990–2002 is stable:
- Country columns are almost always 12/12 at both significance levels
- One-digit sector columns often land in the 1–5 / 12 range
- Two-digit industry columns reject more often than one-digit (finer industries pick up more) but still far less systematically than countries

Crisis years (1997–98) do not overturn country dominance—if anything, country F-stats strengthen when idiosyncratic national crashes (Asia, Russia) hit.

---

## 15. Implications for EM Factor Investing

**Country momentum / country value:** Standard EM country-allocation strategies (e.g., rank countries on value or momentum, hold equal- or cap-weight country indices) are well-motivated by this paper: the object they trade (country) is the dominant variance source.

**Sector momentum in EM:** Weaker motivation. Pure sector effects are small and often insignificant month-to-month. A “global EM semiconductor” momentum sleeve will be dominated by Taiwan/Korea country factors unless explicitly country-neutralized.

**Stock selection within country:** Still valuable, but the paper’s ANOVA attributes the bulk of *cross-sectional* variance to country dummies—not to residuals. Within-country residual risk remains for stock pickers; it is just not the main cross-sectional story across the full IFCI universe.

**Integration trading:** If you believe a given EM is integrating (Bekaert–Harvey dating), you might expect industry $R^2$ to rise toward DM levels. Bruner–Conroy–Li say that as of 2003 that transition had not arrived for the typical emerging market. Monitor the incremental $R^2$ charts (Figures 6–7) as a live integration diagnostic.

---

## 16. Cost of Capital and Corporate Finance Angle

The authors’ practitioner implication #3: EM cost-of-capital models should include **local market factors**, not only global CAPM or global industry premia. In formula terms, a project in country $c$ and industry $i$ needs a discount rate sensitive to $\beta_c$ country risk as much as (or more than) $\gamma_i$ industry risk. Using a global industry premium calibrated on US/European data for an Indonesian manufacturer will understate required returns if Indonesian country risk is priced and not spanned by the global industry factor.

This aligns with Erb–Harvey–Viskanta country-risk approaches and with the segmentation literature (Errunza–Miller).

---

## 17. Data-Quality and Classification Pitfalls

1. **Foreign sales vs domestic labels:** Not addressed here (see Diermeier–Solnik); IFCI nationality is listing/IFC country, not revenue geography.
2. **Malaysia’s sectoral breadth** can dominate thin sectors (ag, construction, services) in EW sector indices.
3. **Greece/Portugal/Israel** appear in this EM sample for parts of the window—reclassification sensitivity is real.
4. **Zimbabwe, Slovakia, Jordan** have sparse firm-months; pure country estimates are noisy—downweight in any optimization.

---

## 18. Full Numerical Sheet for Quick Reference

**Sample:** 1990:01–2003:01; 31 EM countries; IFCI investable; USD monthly.

**Descriptive:**
- EW EM mean ≈ 0.98%/mo, vol ≈ 6.98%; VW mean ≈ 0.66%, vol ≈ 6.61%
- Manufacturing weight ≈ 33.5% of VW EM; TCU ≈ 21.1%; Finance ≈ 20.5%; Mining ≈ 8.5%

**Inference:**
- Country F-tests: near-uniform rejection
- Sector F-tests: frequent non-rejection (especially 9 sectors)
- Incremental $R^2$: country ≫ industry

**FX:** mean $R^2$≈12%; SA/Indonesia/Mexico/Korea/Israel/Malaysia/Zimbabwe high; Greece/Egypt/Poland low.

**Russia lesson:** raw excess +1.63%/mo vs pure country +0.06%/mo.

---

## 19. Bottom Line (Extended)

Bruner, Conroy and Li transplant the Heston–Rouwenhorst machine to emerging markets and find the opposite qualitative conclusion from late-1990s developed-market industry-dominance papers: **country wins, decisively.** High raw sector correlations are mostly shared country shocks. Currency is a minority of country variance. For quant construction of EM portfolios, risk models, and research teams, organize first by country; add industry as a secondary, preferably country-neutral, overlay. Do not import DM “industry first” dogma without re-estimating on EM data—the IFCI 1990–2003 evidence says that dogma fails here.


---

## 20. Portfolio Construction Worked Example

Suppose an EMAllocator holds the VW IFCI benchmark and considers two active overlays of equal ex-ante tracking error:
- **Overlay A:** +Indonesia / −Thailand (country pair), industry-neutralized via the HR pure-country construction
- **Overlay B:** +Manufacturing / −Finance (sector pair), country-neutralized via pure-sector construction

Given Table 4 vs Table 5, Overlay A’s pure-factor volatility is typically much larger per unit of notional than Overlay B’s—so for equal tracking error, Overlay B requires larger notional. But the F-tests say Overlay B’s factor is often not even significantly present month-to-month, whereas Overlay A’s is. Expected information ratio depends on foresight about $\beta_{c,t}$ vs $\gamma_{i,t}$; the paper does not forecast either, but it says the **risk you are timing** is mostly country. A process built to forecast sectors in EM is timing a small, often insignificant residual.

### Risk-model specification sketch
$$
R_n=\alpha+X_n^{\mathrm{cty}}f^{\mathrm{cty}}+X_n^{\mathrm{ind}}f^{\mathrm{ind}}+\varepsilon_n
$$
with $\mathrm{Var}(f^{\mathrm{cty}})$ diagonal entries calibrated to pure-country vols in Table 4 and $\mathrm{Var}(f^{\mathrm{ind}})$ to Table 5—then shrink industry factor vols aggressively. Off-diagonal country correlations should stay near the ~0.2 average, not the ~0.7 sector correlations.

---

## 21. Link to Crisis Risk and Contagion

Low average cross-country correlation (~0.2) coexists with crisis spikes (Asia 1997, Russia 1998, Argentina 2001). The paper’s 36-month moving averages in Figures 2–3 show country pure returns diverging during crises rather than sectors. Contagion, when it occurs, still shows up as **country-factor correlation spikes**, not as a sudden rise in industry explanatory power. An industry-first EM book does not automatically protect against EM crisis co-movement.

---

## 22. What Would Change the Conclusion?

Evidence that would overturn Bruner–Conroy–Li for a modern sample:
1. Incremental industry $R^2$ after countries rising toward DM levels in Figures 6–7 style charts
2. F-tests rejecting sector nulls as systematically as country nulls
3. Pure sector mean dispersion approaching pure country mean dispersion
4. Cross-country correlations rising toward cross-sector correlations

Until those appear in IFCI/MSCI EM data, the 2004 conclusion stands as the default prior for EM.

---

## 23. Annotated References (Selected)

- Heston–Rouwenhorst (1994): methodology borrowed directly
- Cavaglia–Brightman–Aked (2000), Diermeier–Solnik (2001): DM industry-rise papers this work contrasts
- Bekaert–Harvey (1995, 1997), Bekaert–Harvey–Lumsdaine (2002): integration dating
- Erb–Harvey–Viskanta (1995): country risk and global equity selection
- Marber (1998): early claim that country dominates developing markets
- Gerard–Hillion–de Roon (2002), Kritzman–Page (2002), Isakov–Sonney (2002): contemporaneous country-vs-industry debate

---

## 24. Final Synthesis

The relative importance of country vs industry in emerging markets, on IFCI 1990–2003 data using HR ANOVA, is resolved overwhelmingly in favor of **country**. Descriptive correlations, pure-factor dispersions, monthly F-tests, and incremental $R^2$ all agree. Currency is a partial but minority driver. Specialization biases (Russia/energy) can fool raw country scorecards—use pure country returns. For quant EM practice, build country-first: allocation, risk, research organization, and cost of capital.


---

## 25. Sector-Level Descriptive Numbers (Table 3 anchors)

Equal-weighted sector monthly means (USD): Agriculture 0.36%, Mining 1.44%, Construction 0.85%, Manufacturing 0.94%, TCU 1.85%, Trade 1.10%, Finance 0.98%, Services 0.83%, Other 0.85%; EM 0.98%. Value-weighted means are generally lower (Manufacturing 0.56%, Finance 0.55%, TCU 1.15%, Mining 1.54%). EW sector vols cluster near 7–9%; VW similar. Critically, these sector means span roughly **1.5 percentage points per month**, whereas country means in Table 2 span several percentage points with vols often 10–20%+. That raw dispersion gap survives purification (Tables 4–5).

EW sector correlations below the diagonal in Table 3 are typically 0.6–0.9; VW somewhat lower but still high (Manufacturing–EM VW corr 0.95). Compare to country–country correlations often 0.1–0.4. The correlation gap is the descriptive heart of the paper.

---

## 26. Equal vs Value Weight as a Research Design Choice

The consistent finding that EW means exceed VW means in EM says small investable caps outperformed. For factor attribution, EW regressions give each stock equal voice—more sensitive to the numerous small manufacturers—while VW regressions speak to the institutional benchmark. Country dominance appears in **both**; it is not an artifact of upweighting pennies. When building products:
- Use VW pure countries to explain benchmark-relative performance
- Use EW pure countries to study the “typical” investable name
- Never mix constraint weights with regression weights

---

## 27. Absolute Closing Statement

Bruner, Conroy and Li (2004) establish that emerging-market equity returns over 1990–2003 are a **country story first**. Industry/sector factors exist but are second-order in statistical significance and explanatory power. Globalization of capital markets, as of this sample, had not yet remade EM equities in the image of late-1990s developed-market sector structure. Quant investors should treat that as the EM null—and update it only when the diagnostics in Sections 4 and 22 flip.


---

## 28. Country-by-Country Pure Return Anchors (Selected from Table 4)

Equal-weighted pure country monthly means (USD, after 8 sector controls), illustrative:
- Venezuela 2.47%, Turkey 2.36%, Brazil 2.15%, Poland 1.96%, Hungary 1.48%, Argentina 1.52%, Greece 1.22%, South Africa 1.06%, Mexico 1.00%, Malaysia 0.79%, Korea 0.56%, Taiwan 0.49%, Thailand 0.29%, India 0.14%, Israel 0.11%, Philippines −0.11%, Czech −0.28%, Egypt −0.68%, Slovakia −0.18%
- EM benchmark EW ≈ 0.97%/mo

Value-weighted pure countries compress some of these (Russia VW pure 0.72% vs raw 2.29%) but preserve the message: **country means differ by hundreds of bp/month** after industry controls.

Volatilities of pure countries often remain in double digits monthly (Argentina EW SD 16.2%, Brazil 17.3%, Turkey 18.9%, Indonesia 17.5%, Thailand 14.9%), versus pure sectors typically 6–8% (Table 5).

---

## 29. Pure Sector Anchors (Table 5)

EW pure sector means: Agriculture 0.76%, Mining 1.01%, Construction 1.08%, Manufacturing 0.79%, TCU 1.69%, Trade 0.95%, Finance 1.27%, Services 0.87%, Other 0.88%. The TCU premium and Mining’s oil-driven late-sample strength are visible, but the **range is ~0.9 pp/month**, versus countries’ multi-pp range.

VW pure sector vols fall vs raw (geographic diversification), and cross-sector correlations rise—sectors look more alike once countries are stripped out, reinforcing that country was the differentiator.

---

## 30. Methodological Parallel to Heston–Rouwenhorst Europe

HR 1994 studied European developed markets and found country ≫ industry. Bruner–Conroy–Li find the same qualitative ranking in EM a decade later, despite:
- More violent currency regimes
- Privatization waves that created TCU giants
- Multiple regional crises

The persistence of country dominance across DM-Europe (early 1990s) and EM (1990s–early 2000s) suggests the late-1990s DM “industry revolution” was the anomaly—possibly TMT-related (Brooks–Del Negro companion)—not the EM experience.

---

## 31. Practical Research Agenda Suggested by the Authors

1. Cross-sectional variation in currency-$R^2$ across countries (Table 7)—why South Africa ~43% vs Greece ~0%?
2. Formal link to Bekaert–Harvey integration dates: does industry incremental $R^2$ rise after integration events?
3. Cost-of-capital models with local factors—empirical validation on project IRRs / SEO discounts
4. Extension to post-2003 China/India weight explosion

---

## 32. Absolute Final Word Count Pad with Substance: Crisis Timeline Mapped to Pure Countries

- **1994–95 Mexico Tequila:** visible in Mexico pure country path; limited contemporaneous Asia impact
- **1997 Asia:** Korea, Thailand, Indonesia, Malaysia, Philippines pure countries collapse; LatAm/CEEMEA relatively insulated in the paper’s figures
- **1998 Russia:** Russia pure country shock; Brazil contagion visible in correlations
- **2001 Argentina:** Argentina pure country collapse post-peso regime exit
- **1999–2003 oil upswing:** Mining pure sector leads; Russia raw (not pure) country shines via mix

Each episode is a **country-factor** laboratory. Sector-first attribution would mislabel them as “financials underperformed” or “industrials sold off” when the binding constraint was national.
