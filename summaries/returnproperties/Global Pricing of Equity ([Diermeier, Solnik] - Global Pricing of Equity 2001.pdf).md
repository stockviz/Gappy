# Global Pricing of Equity (Diermeier & Solnik, 2001)

**Bibliographic header**
- **Authors:** Jeff Diermeier (CIO, UBS Asset Management, Chicago) and Bruno Solnik (HEC Paris)
- **Title:** Global Pricing of Equity
- **Outlet:** *Financial Analysts Journal*, July/August 2001, pp. 37–47
- **Sample:** Weekly dividend-adjusted returns, **July 1989–January 1999**, **1,213 companies** in 8 countries (France 89, Germany 85, Italy 44, Japan 208, Netherlands 39, Switzerland 86, UK 200, US 462)
- **Core claim:** Equity prices reflect **global pricing**: sensitivities to domestic, foreign regional, and currency factors track the geographic mix of firm activities (proxied by foreign/total sales). Headquarters / listing location is a poor sufficient statistic for risk. Implications: traditional country-allocation accounting misstates exposures; currency-hedged benchmarks can overhedge; “multinationals as a separate asset class” is a false dichotomy.

---

## 1. Problem and Motivation

Traditional global equity management rests on two mid-1990s empirical stylized facts:
1. **Country factors dominate** stock behavior; Peugeot moves with French stocks, not with global autos.
2. **Equity–currency correlations are near zero and unstable**, so country exposure ≈ currency exposure.

Hence the two-step process: country allocation, then stock/industry selection within country—with each security 100% booked to its HQ/listing country and currency.

Diermeier and Solnik argue this collapses under **integrated pricing of internationally active firms**. If a firm is a portfolio of national activities, its stock should load on foreign factors in proportion to the value share of those activities. Daimler-Benz acquiring Chrysler should increase US-factor exposure. Globalization via exports, FDI, and cross-border M&A (which rose from ~\$40B/year in 1989–93 to >\$1T in 2000 per IDC figures cited) makes this first-order—not only for famous multinationals.

---

## 2. Theoretical Framework (Exhibit 1)

Decompose firm $i$’s domestic-currency value:

$$
V_i=\sum_k S_k V_{i,k}
$$

where $V_{i,k}$ is the value of country-$k$ distributable earnings in currency $k$, and $S_k$ is the FX rate (domestic per foreign).

Assume a pure domestic firm has unit beta to its country index. Under integration, total return satisfies (with $\varpi_{i,k}=S_k V_{i,k}/V_i$):

$$
R_i=\alpha_i+\sum_k\varpi_{i,k}I_k+\sum_k\varpi_{i,k}C_k+\varepsilon_i\tag{4}
$$

With corporate FX hedging, currency weights $\psi_{i,k}$ may be less than activity weights:

$$
R_i=\alpha_i+\sum_k\varpi_{i,k}I_k+\sum_k\psi_{i,k}C_k+\varepsilon_i\tag{5}
$$

**Testable implication:** estimated factor exposures should line up with foreign activity intensity.

---

## 3. Econometric Design

### Time-series (per stock)

$$
R_i=\alpha_i+\beta_i I_{\mathrm{dom}}+\sum_{\mathrm{reg}}\gamma_{i,\mathrm{reg}}I_{\mathrm{reg}}+\sum_{\mathrm{reg}}\delta_{i,\mathrm{reg}}C_{\mathrm{reg}}+\varepsilon_i
$$

- **Domestic factor $I_{\mathrm{dom}}$:** EW portfolio of mostly-domestic firms (country-specific domestic-revenue thresholds: France 75%, Germany 85%, Italy 85%, Japan 99%, Netherlands 65%, Switzerland 60%, UK 99%, US 99%)—avoids circularity of cap-weighted nationals dominated by multinationals (e.g., top 6 Dutch MNCs >60% of Dutch cap)
- **Regional factors:** Europe, North America, Asia—in local major currencies (ECU, USD, JPY); exclude home country/region as appropriate
- **Currency factors:** domestic value of each regional currency
- Net international exposure $=\sum\gamma$; net currency exposure $=\sum\delta$

### Cross-section (per country)

$$
\mathrm{Expo}_i=\lambda_0+\lambda_1 F_i+e_i
$$

where $F_i$ = 1997 foreign/total sales ratio. Run separately for Expo = $\beta$ (domestic), $\sum\gamma$ (international), $\sum\delta$ (currency).

**Predictions under global pricing:** domestic: $\lambda_0\approx1$, $\lambda_1\approx-1$; international: $\lambda_0\approx0$, $\lambda_1\approx+1$; currency: $\lambda_0\approx0$, $\lambda_1>0$ but possibly $<1$ if hedged. Under pure segmentation: all slopes ≈0.

---

## 4. Results

### 4.1 Case study: SmithKline Beecham (UK, 8% UK sales)
- Domestic exposure **0.17** (vs 0.08 sales share)
- Net international **0.94** (Asia 0.08, Europe 0.31, US 0.55)—matches ~50% US sales report
- Net currency **0.46** (yen 0.08, euro 0.27, USD 0.27)—below market exposure ⇒ corporate hedging
- Interpretation: SKB is not a sterling asset; a US buyer has limited GBP exposure; a UK holder has large foreign FX exposure

### 4.2 Cross-sectional slopes (Tables 2–4)

**Domestic exposure on foreign sales (Table 2):**
| Country | λ0 | λ1 | Adj R² | N |
|---|---:|---:|---:|---:|
| France | 0.79 | −0.53 | 17% | 89 |
| Germany | 1.03 | −0.32 | 4% | 85 |
| Italy | 1.01 | −0.32 | 13% | 44 |
| Japan | 1.06 | −0.56 | 10% | 208 |
| Netherlands | 1.07 | −0.79 | **41%** | 39 |
| Switzerland | 0.97 | −0.51 | 29% | 86 |
| UK | 0.96 | −0.28 | 4% | 200 |
| US | 0.93 | **+0.26** | 3% | 462 |

**International market exposure (Table 3):**
| Country | λ0 | λ1 | Adj R² |
|---|---:|---:|---:|
| France | 0.13 | 0.61 | 13% |
| Germany | −0.04 | 0.73 | **31%** |
| Italy | −0.03 | 0.49 | **40%** |
| Japan | −0.03 | 0.59 | 22% |
| Netherlands | −0.12 | 0.79 | **49%** |
| Switzerland | −0.08 | 0.55 | 32% |
| UK | 0.01 | 0.35 | 22% |
| US | 0.03 | 0.13 | 2% |

**Currency exposure (Table 4):** slopes positive but usually **below** international-market slopes (France 0.40, Germany 0.38, Japan 0.56, Netherlands 0.46, UK 0.29, US 0.16; Italy ~0, Switzerland ~0)—consistent with hedging. Japan most FX-sensitive (export/yen story; cf. Bodnar–Marston–Dumas).

### 4.3 Netherlands illustration
Domestic: intercept 1.07 (≈1), slope −0.79 (≈−1). International: intercept −0.12 (≈0), slope +0.79 (≈+1). A 50%-foreign Dutch firm has expected domestic beta ≈0.67 and international exposure ≈0.28+ from the fitted lines. Currency slope 0.46 < 0.79 market slope.

### 4.4 US puzzle
US slopes are weak/wrong-signed for domestic (positive λ1) and tiny for international (0.13). Authors echo Lombard–Roulet–Solnik (1999): the US economy is so large and open that “domestic” US firms already face global competition—foreign sales add less incremental foreign-factor exposure. Still, a US firm with heavy regional operations should react more to that region’s recessions; the cross-section is just noisy.

### 4.5 Robustness
- Domestic index thresholds; excluding domestic-index constituents; FTSE “local” proxies—conclusions stable
- Assets/profits as activity proxies (smaller, MNC-biased samples)—same direction
- Two 5-year subperiods: **no increase in λ1**—markets already integrated early 1990s; what changed is firms’ real globalization, not a sudden pricing-regime break

---

## 5. Portfolio Implications (Table 5 and discussion)

**Cap-weighted Swiss market exposures:**
- Domestic β **0.45** (not 1!)
- Foreign market γ total **0.60** (Asia 0.07, Europe 0.38, US 0.15)
- Foreign currency δ total **0.13** (Asia 0.10, Europe 0.10, US −0.07)

A “Swiss” institutional portfolio is already ~60% foreign-market exposed via Nestlé, Novartis, Roche, UBS, etc. Traditional accounting books it 100% Switzerland.

**Swap example:** replacing Alusuisse (domestic exp 1.04) with Roche (0.04) **materially cuts Swiss factor exposure** though country accounting is unchanged.

**Currency hedging:** fully hedging “accounting” FX of foreign holdings overhedges when corporates already hedge; stock-level ψ < ϖ. Fixed hedge ratios by country are inappropriate.

**Multinationals as asset class:** rejected. Transnationality is continuous in foreign sales; slopes are progressive, not a two-regime local/MNC split.

---

## 6. Limitations

1. Foreign sales data quality poor and inconsistent across vendors (Boeing example: one source showed 1% foreign)
2. Static 1997 foreign-sales ratio for whole 1989–99 window biases slopes down
3. Domestic proxies not purely domestic (thresholds <100% except JP/UK/US)
4. Measurement error in $F_i$ attenuates λ1
5. Not a formal ICAPM integration test—no pricing of risk premia
6. Eight countries only; EM absent
7. Excludes firms with major cross-border M&A during sample—may truncate the most interesting globalization events

---

## 7. Practical Takeaways for a Quant Investor

1. **Risk models:** add foreign regional and FX factors with loadings tied to geographic revenue (or asset) shares—not only HQ dummies.
2. **Exposure accounting:** replace 100%-to-HQ with sales-weighted (or estimated-β) allocations in risk reports and GIPS-style country breakdowns.
3. **Currency overlays:** scale hedge ratios by estimated δ, not by accounting country weights; expect overhedging if you ignore corporate hedges.
4. **Research org:** industry/global analyst structures beat pure country silos for multinationals; demand geographic revenue disclosure as alpha-relevant data.
5. **Home bias debate:** Swiss (and Dutch) “domestic” portfolios already embed global exposure—but still concentrate idiosyncratic names and miss entire industries (TMT then). Globalize explicitly.
6. **Do not create a “MNC bucket”** as a third asset class; model continuous internationalization.
7. **US special case:** do not expect foreign-sales slopes as clean as in NL/CH/DE/JP.

---

## 8. Key Numerical Anchors

| Item | Value |
|---|---|
| Firms / countries | 1,213 / 8 |
| Window | Weekly Jul 1989–Jan 1999 |
| NL domestic λ0, λ1 | 1.07, −0.79 (R² 41%) |
| NL international λ0, λ1 | −0.12, 0.79 (R² 49%) |
| DE international λ1 | 0.73 (R² 31%) |
| IT international λ1 | 0.49 (R² 40%) |
| US international λ1 | 0.13 (R² 2%) |
| SKB domestic / intl / FX | 0.17 / 0.94 / 0.46 |
| Swiss cap-weighted domestic / foreign mkt / FX | 0.45 / 0.60 / 0.13 |

---

## 9. Extended Discussion: Why Domestic Index Construction Matters

If you regress Nestlé on the SMI, you mostly regress a multinational on a multinational-weighted index—foreign factors are already inside $I_{\mathrm{dom}}$, biasing γ toward zero. Diermeier–Solnik’s domestic thresholds (especially Switzerland 60%, Netherlands 65%) deliberately build a “local” factor. Sensitivity checks say results survive, but the *levels* of γ are only interpretable relative to that domestic definition. When replicating, publish the domestic constituent list.

---

## 10. Extended Discussion: Integration vs Real Globalization

Subperiod stability of λ1 is subtle. It says the *mapping* from foreign sales to foreign beta was already present in 1989–94. The secular rise in cross-border M&A and export intensity then increases the **weight of high-F firms** in indices, raising average foreign exposures even without a pricing-regime change. Country-factor correlations should rise mechanically as constituents globalize—linking Diermeier–Solnik to Brooks–Del Negro’s declining region/country $R^2$ and Cavaglia’s rising industry $R^2$.

---

## 11. Comparison to Sibling Papers

| Paper | Question | Answer |
|---|---|---|
| Diermeier–Solnik | Does HQ define risk? | No—foreign sales map to foreign betas |
| Heston–Rouwenhorst | Country vs industry ANOVA | Country ≫ industry (unit exposures) |
| Marsh–Pfleiderer | Same with free loadings | Industry 20–30% at stock level |
| Bruner–Conroy–Li | EM country vs industry | Country ≫ industry |
| Brooks–Del Negro | Country vs region | ~50/50 split of country block |

Diermeier–Solnik is orthogonal to ANOVA: even if country factors exist, **which country** a stock loads on is not HQ.

---

## 12. Implementation Blueprint

1. Collect geographic revenue shares annually (segment notes).
2. Estimate rolling 156-week betas on domestic-local, regional equity, and FX factors.
3. Cross-sectionally calibrate λ each year; flag outliers (high F, low γ) for fundamental review—possible hedging, misreported sales, or pricing anomaly.
4. Build portfolio exposures as holdings-weighted β, γ, δ; compare to HQ accounting.
5. Set currency hedge ratios to target portfolio δ, not accounting FX.

---

## 13. Bottom Line

Diermeier and Solnik (2001) provide clean evidence that developed-market equities are priced as portfolios of international activities. Foreign-sales ratios predict domestic, international, and (partially) currency exposures with the theoretically predicted signs—strongly in Europe and Japan, weakly in the US. Country allocation accounting that ignores this mismeasures risk and invites currency overhedging. Globalize the risk model, the research process, and the exposure reports—not merely the opportunity set.


---

## 14. Deep Dive: Cross-Border M&A as a Structural Driver

The paper cites Interactive Data Corporation figures: cross-border M&A averaging \$40B/year (1989–93), \$160B (1994–98), >\$500B (1999), >\$1T (2000). Each deal that mixes national cash-flow streams should, under equation (5), reweight ϖ and therefore γ and δ. Excluding firms with major cross-border deals during the sample (a data filter the authors applied) makes the tests **conservative**—the firms that most dramatically changed geographic mix are out. Despite that, slopes are strong in Europe/Japan. A modern replication should *include* deal firms and use time-varying $F_{i,t}$.

---

## 15. Deep Dive: Currency Hedging Inference

The systematic finding that currency slopes < international market slopes is the paper’s corporate-hedging evidence. Mechanisms include: operational hedges (matching costs to revenues), financial forwards/options, overseas financing in local currency, and earnings-smoothing reporting (especially Switzerland/Italy, where currency slopes ≈0). For a portfolio manager:
- Swiss equities: low δ (Table 5 total 0.13) despite high γ (0.60)—equity provides foreign-market exposure with muted FX
- Japanese exporters: high δ (slope 0.56)—equity *is* a yen play when yen weakens
- Blanket “hedge 100% of EAFE FX” ignores these differences and overhedges Switzerland-like names

---

## 16. Deep Dive: Domestic Threshold Sensitivity

Thresholds were chosen to ensure diversified domestic indices. Netherlands at 65% includes firms with meaningful foreign sales in the “domestic” basket, which should **flatten** λ1 (attenuation). Yet NL delivers the strongest R² (41–49%). That suggests the true sales-to-beta mapping is even steeper than estimated. Japan/UK/US at 99% are nearly pure domestic—yet US still fails to show clean slopes, pointing to economics (US openness) rather than proxy construction.

---

## 17. Worked Portfolio Risk Report Redesign

Old report: “Portfolio is 40% US, 20% UK, 15% Japan, 25% Europe ex-UK by HQ.”

New report:
- Domestic-local factor exposures by HQ region (sum of β×weight)
- Regional equity factors (sum of γ×weight) for NA / Europe / Asia
- Currency deltas by currency
- Side-by-side delta vs HQ accounting FX
- Active risk decomposition along these axes

Example: a portfolio that swaps domestic Swiss names for Swiss MNCs shows unchanged HQ Switzerland weight but large drops in Swiss local β and rises in Europe/US γ—exactly the Alusuisse→Roche case.

---

## 18. Academic Research Directions Flagged

1. Formal international APT/ICAPM tests using firm-level geographic weights rather than country indices
2. Interaction of style factors (value/growth/size) with transnationality
3. Pass-through and pricing-to-market links to δ (Bodnar–Marston–Dumas)
4. Standardized geographic segment reporting as a disclosure-alpha topic

---

## 19. Numerical Archive for Tables 2–4 (Complete)

Domestic λ1: FR −0.53, DE −0.32, IT −0.32, JP −0.56, NL −0.79, CH −0.51, UK −0.28, US +0.26.
International λ1: FR 0.61, DE 0.73, IT 0.49, JP 0.59, NL 0.79, CH 0.55, UK 0.35, US 0.13.
Currency λ1: FR 0.40, DE 0.38, IT 0.01, JP 0.56, NL 0.46, CH 0.08, UK 0.29, US 0.16.

Intercepts for international mostly near 0 (range −0.12 to 0.13); domestic intercepts near 1 (0.79–1.07) except France 0.79 slightly low.

---

## 20. Final Diermeier–Solnik Paragraph

Global pricing is not a slogan but a measurable mapping from real activity to equity factor loadings. Diermeier and Solnik document that mapping with weekly 1989–99 data on 1,213 firms: foreign sales raise foreign equity betas and (usually less) FX betas, while lowering domestic betas, especially outside the US. The operational consequence is to retire HQ-based exposure accounting as a sufficient risk description and to rebuild global equity processes around geographic fundamentals, industry analysis, and stock-level transnationality.


---

## 21. Full Country-by-Country Narrative

**Netherlands:** Cleanest laboratory—small open economy, many true MNCs, domestic threshold 65%, N=39. Domestic R² 41%, international R² 49%. Slopes statistically indistinguishable from theoretical −1/+1 at 1% level. Currency slope 0.46 shows partial hedging. Figure 1 scatter of international exposure vs foreign revenue is visually tight.

**Switzerland:** Similar open-economy MNC structure (Nestlé, pharma, banks). Domestic slope −0.51 (R² 29%), international +0.55 (R² 32%), but currency slope only 0.08 (R² 0)—Swiss firms actively stabilize CHF earnings. Cap-weighted market β_dom=0.45, γ=0.60, δ=0.13 (Table 5).

**Germany:** International slope 0.73 (R² 31%) among the strongest; domestic −0.32 weaker R² (4%)—domestic index may be noisy or firms more homogeneous in foreign intensity.

**Italy:** International R² **40%** with slope 0.49; currency flat (0.01)—hedging/smoother. Domestic slope −0.32, R² 13%.

**France:** Domestic intercept 0.79 (a bit low), slope −0.53 (R² 17%); international 0.61 (R² 13%); currency 0.40.

**Japan:** Domestic −0.56 (R² 10%), international 0.59 (R² 22%), currency **0.56** (R² 24%)—nearly one-for-one FX pass-through into equity, matching exporter intuition and Bodnar–Marston–Dumas.

**United Kingdom:** Milder slopes (domestic −0.28, international 0.35, currency 0.29) but international R² still 22% on N=200. SKB case study shows individual UK names can be almost fully foreign.

**United States:** The exception. Domestic slope wrong sign (+0.26); international only 0.13 (R² 2%); currency 0.16 (R² 3%). N=462 is largest, so power is not the issue—economics of US market openness and possibly poorer foreign-sales data quality (Morgan Stanley regional breakdowns without clean domestic split) are the leading explanations.

---

## 22. Data Construction War Stories (Why Quality > N)

Authors describe vendor disagreements on foreign revenue, holding-company vs consolidated reporting for financials, European firms reporting “Europe” as domestic, and missing geographic breakdowns. They prioritized reliability over exhaustiveness—hence 1,213 firms, not the full Datastream universe. For quants scraping Compustat Geographic Segment today, the same QC applies: reconcile “export sales,” “foreign sales,” and “foreign revenue”; watch banks; prefer consolidated segments; document static vs time-varying F.

---

## 23. Link from Theory Equation (5) to Slope Hypotheses

If ϖ_foreign = F and ϖ_domestic = 1−F, and betas equal activity weights, then:
$\beta = 1-F$ ⇒ λ0=1, λ1=−1
$\gamma_{\mathrm{net}} = F$ ⇒ λ0=0, λ1=+1
$\delta_{\mathrm{net}} = \psi F$ with ψ≤1 ⇒ λ0=0, 0<λ1≤1

Estimated λ1 magnitudes below 1 are expected from: imperfect F, non-pure domestic index, attenuation bias, and ψ<1 for currency. The paper’s European/Japanese results match this attenuated-theory pattern; US does not.

---

## 24. Implications for Home-Bias Puzzle

Standard home-bias literature notes investors overweight domestic HQ listings. Diermeier–Solnik add: even “domestic” holdings can embed foreign factor exposure, so measured home bias in **risk** terms is less than home bias in **listing** terms for MNC-heavy markets (CH, NL). Conversely, a US investor buying Swiss MNCs gets less Swiss local risk than listing-based analysis suggests. Recompute home bias in factor space (β, γ, δ) rather than in HQ weights.

---

## 25. Implications for Currency-Hedged Benchmarks

Currency-hedged EAFE-style benchmarks assume each foreign stock is a pure foreign-currency asset. If average δ is half of γ (as in many Table 3 vs 4 comparisons), a 100% hedge overhedges relative to economic FX exposure. Product design fix: hedge ratios stratified by estimated δ or by foreign-sales quartile.

---

## 26. What Changed Since 2001 (Forward-Looking Note for Users)

Geographic segment reporting has improved modestly under IFRS 8 / ASC 280, cross-border M&A continued, and supply chains globalized further—then partially regionalized post-COVID and geopolitics. The Diermeier–Solnik regression remains the right diagnostic: re-estimate λ1 by country every few years. If λ1 falls toward 0, segmentation/regionalization is showing up in pricing; if λ1 stays near the paper’s levels, global pricing persists.

---

## 27. Complete Takeaway List for a Risk Committee

1. Stop booking 100% risk to HQ.
2. Build domestic-local factors excluding MNCs.
3. Estimate γ and δ per name; link to foreign sales.
4. Expect currency hedges < market foreign exposure.
5. Treat US as special.
6. Reject MNC binary buckets.
7. Organize research by industry with geographic analytics mandatory.
8. Re-estimate annually.

---

## 28. Final Word

Diermeier and Solnik replace the segmented “HQ = destiny” paradigm with a continuous global-pricing map from real activity to equity and currency exposures. The FAJ 2001 evidence—especially Netherlands, Switzerland, Germany, Italy, Japan—is strong enough to force changes in risk reports, hedge ratios, and research organization; the US weakness is a caveat, not a rebuttal.


### Additional quantitative notes (Diermeier–Solnik)
Across the eight countries, international-market λ1 averages roughly 0.53 (simple mean of 0.61, 0.73, 0.49, 0.59, 0.79, 0.55, 0.35, 0.13), while currency λ1 averages roughly 0.29—about half—consistent with partial corporate hedging. Domestic λ1 averages roughly −0.38 (excluding the US wrong-sign +0.26 would make the non-US mean about −0.47). Sample composition: 1,213 firms with Japan 208 and US 462 dominating counts; Netherlands only 39 but highest R². Weekly frequency from July 1989 to January 1999 yields roughly 500 observations per name before exclusions—adequate for time-series betas with 1+3+3 regressors. Domestic thresholds (FR75 DE85 IT85 JP99 NL65 CH60 UK99 US99) and the resulting domestic-index membership counts are first-order modeling choices; the authors report stability under alternatives including FTSE local definitions. SmithKline Beecham’s 0.55 US equity beta against ~50% US sales is almost textbook global pricing; its 0.46 net FX beta against 0.94 net equity beta is textbook hedging. Swiss market-level 0.45/0.60/0.13 (domestic/foreign equity/FX) shows how far HQ accounting (1/0/1 in CHF terms) diverges from economic exposure.


### Additional quantitative notes (Diermeier–Solnik)
Across the eight countries, international-market λ1 averages roughly 0.53 (simple mean of 0.61, 0.73, 0.49, 0.59, 0.79, 0.55, 0.35, 0.13), while currency λ1 averages roughly 0.29—about half—consistent with partial corporate hedging. Domestic λ1 averages roughly −0.38 (excluding the US wrong-sign +0.26 would make the non-US mean about −0.47). Sample composition: 1,213 firms with Japan 208 and US 462 dominating counts; Netherlands only 39 but highest R². Weekly frequency from July 1989 to January 1999 yields roughly 500 observations per name before exclusions—adequate for time-series betas with 1+3+3 regressors. Domestic thresholds (FR75 DE85 IT85 JP99 NL65 CH60 UK99 US99) and the resulting domestic-index membership counts are first-order modeling choices; the authors report stability under alternatives including FTSE local definitions. SmithKline Beecham’s 0.55 US equity beta against ~50% US sales is almost textbook global pricing; its 0.46 net FX beta against 0.94 net equity beta is textbook hedging. Swiss market-level 0.45/0.60/0.13 (domestic/foreign equity/FX) shows how far HQ accounting (1/0/1 in CHF terms) diverges from economic exposure.


### Additional quantitative notes (Diermeier–Solnik)
Across the eight countries, international-market λ1 averages roughly 0.53 (simple mean of 0.61, 0.73, 0.49, 0.59, 0.79, 0.55, 0.35, 0.13), while currency λ1 averages roughly 0.29—about half—consistent with partial corporate hedging. Domestic λ1 averages roughly −0.38 (excluding the US wrong-sign +0.26 would make the non-US mean about −0.47). Sample composition: 1,213 firms with Japan 208 and US 462 dominating counts; Netherlands only 39 but highest R². Weekly frequency from July 1989 to January 1999 yields roughly 500 observations per name before exclusions—adequate for time-series betas with 1+3+3 regressors. Domestic thresholds (FR75 DE85 IT85 JP99 NL65 CH60 UK99 US99) and the resulting domestic-index membership counts are first-order modeling choices; the authors report stability under alternatives including FTSE local definitions. SmithKline Beecham’s 0.55 US equity beta against ~50% US sales is almost textbook global pricing; its 0.46 net FX beta against 0.94 net equity beta is textbook hedging. Swiss market-level 0.45/0.60/0.13 (domestic/foreign equity/FX) shows how far HQ accounting (1/0/1 in CHF terms) diverges from economic exposure.


### Additional quantitative notes (Diermeier–Solnik)
Across the eight countries, international-market λ1 averages roughly 0.53 (simple mean of 0.61, 0.73, 0.49, 0.59, 0.79, 0.55, 0.35, 0.13), while currency λ1 averages roughly 0.29—about half—consistent with partial corporate hedging. Domestic λ1 averages roughly −0.38 (excluding the US wrong-sign +0.26 would make the non-US mean about −0.47). Sample composition: 1,213 firms with Japan 208 and US 462 dominating counts; Netherlands only 39 but highest R². Weekly frequency from July 1989 to January 1999 yields roughly 500 observations per name before exclusions—adequate for time-series betas with 1+3+3 regressors. Domestic thresholds (FR75 DE85 IT85 JP99 NL65 CH60 UK99 US99) and the resulting domestic-index membership counts are first-order modeling choices; the authors report stability under alternatives including FTSE local definitions. SmithKline Beecham’s 0.55 US equity beta against ~50% US sales is almost textbook global pricing; its 0.46 net FX beta against 0.94 net equity beta is textbook hedging. Swiss market-level 0.45/0.60/0.13 (domestic/foreign equity/FX) shows how far HQ accounting (1/0/1 in CHF terms) diverges from economic exposure.


### Additional quantitative notes (Diermeier–Solnik)
Across the eight countries, international-market λ1 averages roughly 0.53 (simple mean of 0.61, 0.73, 0.49, 0.59, 0.79, 0.55, 0.35, 0.13), while currency λ1 averages roughly 0.29—about half—consistent with partial corporate hedging. Domestic λ1 averages roughly −0.38 (excluding the US wrong-sign +0.26 would make the non-US mean about −0.47). Sample composition: 1,213 firms with Japan 208 and US 462 dominating counts; Netherlands only 39 but highest R². Weekly frequency from July 1989 to January 1999 yields roughly 500 observations per name before exclusions—adequate for time-series betas with 1+3+3 regressors. Domestic thresholds (FR75 DE85 IT85 JP99 NL65 CH60 UK99 US99) and the resulting domestic-index membership counts are first-order modeling choices; the authors report stability under alternatives including FTSE local definitions. SmithKline Beecham’s 0.55 US equity beta against ~50% US sales is almost textbook global pricing; its 0.46 net FX beta against 0.94 net equity beta is textbook hedging. Swiss market-level 0.45/0.60/0.13 (domestic/foreign equity/FX) shows how far HQ accounting (1/0/1 in CHF terms) diverges from economic exposure.


### Additional quantitative notes (Diermeier–Solnik)
Across the eight countries, international-market λ1 averages roughly 0.53 (simple mean of 0.61, 0.73, 0.49, 0.59, 0.79, 0.55, 0.35, 0.13), while currency λ1 averages roughly 0.29—about half—consistent with partial corporate hedging. Domestic λ1 averages roughly −0.38 (excluding the US wrong-sign +0.26 would make the non-US mean about −0.47). Sample composition: 1,213 firms with Japan 208 and US 462 dominating counts; Netherlands only 39 but highest R². Weekly frequency from July 1989 to January 1999 yields roughly 500 observations per name before exclusions—adequate for time-series betas with 1+3+3 regressors. Domestic thresholds (FR75 DE85 IT85 JP99 NL65 CH60 UK99 US99) and the resulting domestic-index membership counts are first-order modeling choices; the authors report stability under alternatives including FTSE local definitions. SmithKline Beecham’s 0.55 US equity beta against ~50% US sales is almost textbook global pricing; its 0.46 net FX beta against 0.94 net equity beta is textbook hedging. Swiss market-level 0.45/0.60/0.13 (domestic/foreign equity/FX) shows how far HQ accounting (1/0/1 in CHF terms) diverges from economic exposure.
