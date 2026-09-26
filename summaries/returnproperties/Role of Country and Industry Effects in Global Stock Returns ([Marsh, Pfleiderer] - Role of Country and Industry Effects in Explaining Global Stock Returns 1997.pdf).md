# The Role of Country and Industry Effects in Explaining Global Stock Returns (Marsh & Pfleiderer, 1997)

**Bibliographic header**
- **Authors:** Terry Marsh (UC Berkeley Haas) and Paul Pfleiderer (Stanford GSB); empirical help from Indro Fedrigo (Quantal International)
- **Title:** The Role of Country and Industry Effects in Explaining Global Stock Returns
- **Draft:** First June 15, 1997; last revised September 16, 1997 (mimeo)
- **Sample:** **2,839** DJGI stocks continuously listed Jul 10, 1996–Jul 9, 1997; **239** local daily returns; 29 countries; 68 DJGI industries / 9 segments; also MSCI World 38 industries / 22 countries
- **Core claim:** With **heterogeneous loadings** (Model 2), industry explains **20–30%** of country+industry fitted variation in individual stock returns (~7% when a global factor is included)—far above Heston–Rouwenhorst’s <1% for country *index* residuals. Finer industry grids are not better (9 segments ≥ 68 industries; MSCI 38 > DJGI 68). Common-currency measurement raises country share ~15%.

---

## 1. Problem and Motivation

Global indices classify stocks by country and industry because both are believed to matter. Yet HR (1994) conclude industrial specialization explains **<1%** of equally-weighted European *country index* variance, while Roll (1992) finds industry explains ~**40%** of *index* variance under a different design. Marsh–Pfleiderer argue both the **unit-exposure assumption** and the **aggregation level** (index vs stock) distort inference.

They estimate a restricted factor model allowing stock-specific loadings on own-country and own-industry factors, targeting **individual stock** return variation.

---

## 2. Models

**Model 1 (HR-style unit exposures):**
$$
R_{ijkt}=A_i+G_t+I_{jt}+C_{kt}+e_{ijkt}
$$

**Model 2 (heterogeneous loadings):**
$$
R_{ijkt}=A_i+b_{ig}G_t+b_{ij}I_{jt}+c_{ik}C_{kt}+e_{ijkt}
$$

with $b_{ij}=0$ if stock $i\notin$ industry $j$, $c_{ik}=0$ if $i\notin$ country $k$. Normalization: $\mathrm{Var}(I_j)=\mathrm{Var}(C_k)=1$ (no forced orthogonality; estimated factors nearly orthogonal anyway, avg corr ~5.4%).

**Estimation:** iterative least squares—alternate between factor extraction given loadings and loading estimation given factors; converges as a contraction. Portfolio instruments improve first-step IV. Simulations confirm consistency. ML on 2,500–2,800 stocks infeasible.

---

## 3. Main DJGI Results (Local Returns, Country+Industry Only)

### By country (Table 1): % fitted var due to **country** (industry = 100 − country)
Average country share **77.72%** ⇒ industry **22.28%**.

High country: Italy 93.27%, Switzerland 93.00%, Netherlands 89.34%, Denmark 87.50%, Finland 87.46%, Norway 87.24%, Belgium 87.10%, Taiwan 86.90%, Germany 86.23%, Australia 85.85%,...
Low country (high industry): Ireland **30.70%**, South Africa 52.51%, Canada 59.75%, UK 62.45%, US 64.97%.

Ireland’s anomaly: 11 stocks, many London-domiciled international firms (CRH, Smurfit, AIB, Bank of Ireland)—when only country/industry compete, global industry absorbs variation; adding a global factor drops Ireland’s industry share to 6.83%, in line with others.

### By industry (Table 2): country share averages ~70%
Low country / high industry: Precious Metals **35.51%**, Oil Majors 42.68%, Oilfield Equip 43.15%, S&Ls (US) 32.44%, Health Care Providers 35.37%, Semiconductors 53.49%, Industrial Technology 55.82%, Water Utilities 54.79%.
High country / low industry: Lodging 93.98%, Conglomerates 93.02%, Consumer Household 89.84%, Pharmaceuticals 85.34%, Railroads 85.58%.

Interpretation triad: (1) local vs global nature of industry; (2) industry-factor volatility; (3) classification homogeneity (Precious Metals vs Conglomerates).

### Two-way (Table 3): Precious Metals example
Australia PM country share **79.37%** vs Canada 12.65%, South Africa 32.04%, US 14.14%. Australian gold stocks load ~2.5× less on the PM industry factor than US peers (Figure 1); they load more on the Australia country factor (Figure 2)—possibly because ~30% of Australian stocks are resource-related, making the country factor resource-like (though corr(Australia, PM) only 7.4% without global factor; 44% with global factor).

**Unit exposures would be badly wrong here.**

---

## 4. Classification Sensitivity

### DJGI 9 segments vs 68 industries (Tables 4–5)
Average country share with 9 segments: **70.39%** ⇒ industry **29.61%** — *higher* industry share than with 68 industries (22.28%). Broader classification explains more fitted variation. Cross-country correlation of country shares under the two schemes: 77% (rank 70%).

With global factor included: industry share of cty+ind is 10.54% (9-seg) vs 9.40% (68-ind); of cty+ind+global, 5.45% vs 6.68%. **More industry classes ≠ more explanatory power**—classifications are noisy.

### MSCI 38 industries (Table 6)
Average country share **62.84%** ⇒ industry **37.16%** > DJGI 68’s 22.28%. Partly fewer/emerging-heavier countries in DJGI extras (Indonesia, Mexico, Philippines, Korea, Taiwan, Thailand have high country shares; South Africa offsets). Also MSCI’s 60%-per-industry construction may yield cleaner industry baskets.

Gold Mines under MSCI: Australia country share 91.91% vs Canada/US >99% industry—same Australia anomaly as DJGI PM.

---

## 5. Adding a Global Factor (Tables 8–9)

Model: $R=b_{ig}G_t+b_{ij}I_{jt}+c_{ik}C_{kt}+e$.

Average across countries:
- Country / (Country+Ind): **90.60%** (industry 9.40% of cty+ind)
- Country / (Cty+Ind+Global): **58.98%**
- Industry / (Cty+Ind+Global): **6.68%**

Global factor steals from industry more than from country on average—especially in global industries (Media −27.3 pp industry share, Industrial Tech, Semis, Forest Products, Building Materials, Retail, Textiles, Electronics, Precious Metals, Steel, Chemicals). Local industries (Electric Utilities, S&Ls, Pipelines, Plantations, Brokers, Software, Health Care Providers, Secondary Oil) see industry share hold up or rise relatively.

US and Canada retain high industry contributions even with global (~20% of three-factor fitted). Italy/Switzerland remain country-heavy.

---

## 6. Comparison to Dummy (Model 1) Estimates

Repeating HR dummies on DJGI daily data: ratio of avg industry-factor variance to country-factor variance ≈ **16.96%** (medians ~37–38% if using mean effects—paper prefers variance ratio). Close to Model 2’s 22.8% industry share of cty+ind fitted var.

Why HR’s published <1%? **Aggregation:** within a country index, industry factors diversify while country factors do not. Toy formula with N=7 equal industries, orthogonal factors:

$$
\frac{\sigma_C^2}{\sigma_C^2+\sigma_I^2/N}\approx 99.3\%
$$

country share of index variance—even when industry matters a lot at stock level. With 20% inter-industry correlation, industry’s index share rises only to ~4%. **HR’s <1% is an index-level arithmetic result, not a stock-level irrelevance result.**

Second-step regression of stock returns on Model-1 factors: cross-sectional SD of industry loadings **0.963** vs country loadings **0.457**—more industry heterogeneity, so Model 1’s unit restriction damages industry measurement more, accentuating apparent country dominance.

---

## 7. Currency

Measuring all returns in a common currency (USD or DEM) rather than local increases the country share of fitted variation by about **15%**—because FX is a common multiplier within country. This contradicts HR’s claim that currency cannot explain large country effects (their index-level industry share was already ~0, so currency had nothing to whittle).

---

## 8. Limitations

1. Only one year of daily data (1996–97)—TMT bubble not yet peaked; short window
2. Survivorship: continuous DJGI membership required
3. Classification restrictions (zero foreign industry/country loadings) still strong—Fedrigo–Marsh–Pfleiderer (1996) argue noisy classifications may warrant dropping them
4. Incomplete Section 6 hypothesis test note in draft (“Use bootstrap…”)—paper is a mimeo
5. Local vs USD comparison mentioned as “~15% (Table)” without full table in extract—treat as authors’ stated magnitude

---

## 9. Practical Takeaways for a Quant Investor

1. **Do not cite HR <1% to kill industry risk at the stock level.** For stock selection and optimized portfolios, industry is 20–30% of cty+ind fitted variance (7% with global).
2. **Allow heterogeneous industry/country betas** in risk models—unit loadings bias inference and miss cases like Australia vs US gold.
3. **Prefer coarser, cleaner industry schemas** for risk factors; 68-leaf trees add noise. Monitor MSCI/GICS schemes by explanatory power, not leaf count.
4. **Separate global factor** before declaring industry effects—otherwise global gets mislabeled as industry in globalized sectors.
5. **Currency:** common-currency risk models will show larger country factors; be consistent between estimation currency and mandate currency.
6. **Index investors vs stock pickers:** HR’s index result is relevant to country-index fund allocators; Marsh–Pfleiderer is relevant to everyone else.
7. **Ireland/MNC caution:** small countries dominated by multinationals will show fake industry importance without a global factor.

---

## 10. Key Numerical Anchors

| Quantity | Value |
|---|---|
| Stocks / days | 2,839 / 239 |
| Countries (DJGI) | 29 |
| Industry share of cty+ind (68) | **22.28%** |
| Industry share (9 segments) | **29.61%** |
| Industry share (MSCI 38) | **37.16%** |
| Industry share of 3-factor fitted | **6.68%** |
| Model-1 variance ratio ind/cty | **16.96%** |
| Avg country share Table 1 | **77.72%** |
| Ireland country share (2-factor) | 30.70% |
| Italy country share | 93.27% |
| Precious Metals country share | 35.51% |
| Conglomerates country share | 93.02% |
| Common-currency boost to country | **~15%** |
| SD of Model-1 industry vs country loadings | 0.963 vs 0.457 |

---

## 11. Extended Discussion: Why Aggregation Misleads CIOs

A CIO reading HR 1994 hears “industry doesn’t matter for international diversification.” That statement is about **the variance of country index residuals after removing industry mix**. It is the right statement for “should I care about Germany’s industry composition when predicting the German index?” It is the wrong statement for “should my global stock optimizer have industry factors?” Marsh–Pfleiderer quantify the gap: same dummy technology, stock-level industry share ~17%, index-level ~1%. Always ask: **stock or index?**

---

## 12. Extended Discussion: Noisy Classifications

Examples from the paper: Internet/software/hardware lumped together; HP entering photography while classifications lag; conglomerates; dual-listed Irish names; Degussa/Johnson Matthey/Sumitomo labeled Precious Metals despite diversified operations. Each noise source attenuates measured industry effects under fine grids. The finding that 9 segments beat 68 industries is a direct indictment of naive granularity.

Modern GICS 11/24/69/158 hierarchies should be validated by out-of-sample fitted-variance contributions, not assumed better when deeper.

---

## 13. Extended Discussion: Estimation Technology vs HR

HR: period-by-period cross-sectional OLS with unit loadings and zero-sum constraints—fast, transparent, delivers pure country/industry portfolio returns.

Marsh–Pfleiderer: iterative LS with free loadings—better fit to stock-level second moments, no direct “pure portfolio return” interpretation without rescaling.

For **performance attribution**, HR pure portfolios remain convenient. For **risk forecasting of individual names**, Marsh–Pfleiderer loadings are conceptually superior. Many commercial risk models (BARRA-style) already allow heterogeneous loadings—this paper is their academic justification in the country/industry debate.

---

## 14. Table 8 Country Highlights with Global Factor

Industry share of three-factor fitted var: South Korea **26.77%**, US **20.24%**, Canada **20.81%**, Thailand 15.06%, Austria 11.79% vs Netherlands 1.02%, Australia 1.07%, Spain 1.72%, Hong Kong 1.91%. The US/Canada/Korea results say industry risk is first-order for the world’s largest markets’ stocks—even after global and country factors.

---

## 15. Reconciliation with Roll (1992)

Roll found ~40% industry explanation for index returns using industry-weight regressions without a separate global factor—industry factors likely absorbed global variation. Marsh–Pfleiderer’s three-factor industry share (6.68%) is much lower once global is separated; their two-factor industry share (22–37% depending on schema) sits between HR index results and Roll. The reconciliation is: **global contamination + aggregation level + loading restrictions** jointly explain the literature’s dispersion.

---

## 16. Bottom Line

Marsh and Pfleiderer (1997) rehabilitate industry effects for **individual global stocks** under heterogeneous loadings: roughly one-quarter of country-plus-industry fitted variation (one-fifteenth of three-factor fitted variation). They show HR’s <1% is an index-diversification artifact, that finer industry grids fail, and that common-currency measurement boosts country shares ~15%. For quant practice: use industry factors with free betas at the stock level; do not over-refine classifications; always separate a global factor before celebrating industry risk.


---

## 17. Complete Table 1 Country Roster (Country Share of Fitted Var)

Australia 85.85; Austria 72.55; Belgium 87.10; Canada 59.75; Denmark 87.50; Finland 87.46; France 82.57; Germany 86.23; Hong Kong 78.90; Indonesia 76.60; Ireland 30.70; Italy 93.27; Japan 82.99; Malaysia 78.40; Mexico 78.87; Netherlands 89.34; New Zealand 83.64; Norway 87.24; Philippines 79.50; Singapore 78.62; South Africa 52.51; South Korea 74.17; Spain 83.14; Sweden 81.71; Switzerland 93.00; Taiwan 86.90; Thailand 67.86; United Kingdom 62.45; United States 64.97. Mean **77.72%**.

---

## 18. Complete Table 4 (9-Segment) Country Shares

Australia 80.17; Austria 71.38; Belgium 71.87; Canada **39.34**; Denmark **34.53**; Finland 81.70; France 75.44; Germany 80.88; Hong Kong 75.76; Indonesia 73.71; Ireland 29.06; Italy 92.52; Japan 80.71; Malaysia 76.55; Mexico 75.83; Netherlands 85.73; New Zealand 74.20; Norway 81.22; Philippines 78.13; Singapore 70.77; South Africa **29.86**; South Korea 74.00; Spain 78.15; Sweden 78.19; Switzerland 86.29; Taiwan 84.64; Thailand 81.16; UK **50.65**; US **48.91**. Mean country share **70.39%** ⇒ industry **29.61%**.

Note Canada, Denmark, South Africa, UK, US drop sharply vs 68-industry Table 1—these markets’ stocks sit in better-measured broad segments (gold, etc.), so coarse industry captures more.

---

## 19. Table 5 Segment-Level Country Shares (9 Segments)

Basic Materials 67.83; Consumer Cyclical 64.57; Energy **57.29**; Financial 67.07; Industrial 68.15; Independents 79.48; Consumer Non-cyclical 63.68; Technology **58.94**; Utilities 59.79. Energy and Technology show the most industry (least country)—intuitive for globalized sectors.

---

## 20. Iterative Estimation Recipe for Replication

1. Initialize loadings $b_{ij}, c_{ik}$ (e.g., 1 for membership, 0 else, or IV via industry/country portfolio returns).
2. Given loadings, LS-extract factors $I_{jt}, C_{kt}$ each day from the cross-section of residualized returns.
3. Rescale factors to unit variance.
4. Given factors, LS-estimate loadings stock by stock (time-series).
5. Iterate to convergence.
6. Compute for each stock $V^C = c_{ik}^2/(b_{ij}^2+c_{ik}^2)$ (unit-var factors); average within country or industry.

Add global factor by allowing $b_{ig}$ unrestricted for all i; renormalize all factor variances to 1.

---

## 21. Why Simulations Reject Forced Orthogonality

Imposing identity covariance on factors is an over-identifying restriction. Even when true, simulations show freer estimation (unit variances only) recovers parameters better. Empirically, unrestricted factors show low correlations (~5.4% average country–industry), so the economic cost of not imposing orthogonality is small and the statistical benefit positive.

---

## 22. Stock-Picker vs Index-Allocator Decision Matrix

| Decision | Relevant metric | Marsh–Pfleiderer guidance |
|---|---|---|
| Build stock-level risk model | Industry share of stock fitted var | 22–37% (2-factor); ~7% (3-factor) |
| Allocate across country index funds | Industry share of index var | ~1% (HR arithmetic) |
| Choose industry classification depth | Explanatory power by schema | Prefer 9-seg or MSCI 38 over DJGI 68 |
| Hedge FX | Change in country share local→USD | ~+15% country |
| Treat Ireland-like markets | Check MNC intensity | Need global factor |

---

## 23. Precious Metals Deep Dive as Methodological Exhibit

Seven Australian PM names (Ashton, Great Central, Newcrest, Normandy, Plutonic, RGC, Sons of Gwalia) vs six US (Amax Gold, Battle Mountain, Hecla, Homestake, Handy & Harman, Newmont) have comparable counts and caps, yet US loadings on the PM factor average ~2.5× Australia’s. Model 1 would force equality and mis-attribute Australian residual variance to country or error. Any fundamental risk model that assigns a single “Gold” beta to all gold names fails this exhibit. Allow $b_{i,\mathrm{PM}}$ to vary; optionally add a resource-country interaction for Australia.

---

## 24. Media Industry Global-Factor Theft

Media’s industry share of cty+ind falls **27.33 points** when global is added (from 33.93% to 6.60%). With 17 countries represented in DJGI Media, the “industry factor” without a global factor was largely a global equity factor concentrated in media names. This is the cleanest warning against two-factor industry celebration.

---

## 25. Connection to Commercial Risk Models

BARRA/Axioma/RiskMetrics-style models already use heterogeneous loadings on country and industry factors plus a market factor—the Marsh–Pfleiderer world. HR is closer to a pure ANOVA attribution tool. The 1997 mimeo is best read as academic confirmation that commercial practice (free loadings) is right for stock-level risk, and that HR’s headline number should not be used to turn industry factors off.

---

## 26. Final Marsh–Pfleiderer Synthesis

Industry matters for individual global stocks—about 20–30% of country-plus-industry fitted variation with free loadings, about 7% once a global factor is present. HR’s <1% describes country indices, not stocks. Classification granularity beyond a modest number of industries adds noise. Common-currency measurement inflates country shares by ~15%. Build risk models accordingly: free betas, coarse industries, explicit global factor, currency-consistent returns.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.


### Additional quantitative notes (Marsh–Pfleiderer)
Under Model 2 without a global factor, industry’s share of country-plus-industry fitted variation is 22.28% (DJGI 68), 29.61% (DJGI 9), and 37.16% (MSCI 38). With a global factor, industry’s share of three-factor fitted variation averages 6.68% on DJGI 68, with country taking 58.98% and global the residual of the fitted part. Model-1 dummy variance ratios give industry/country ≈ 16.96%, close to Model 2’s 22% stock-level industry share and far from HR’s index-level <1%. The aggregation formula with N=7 equal orthogonal industries and the paper’s σ_C, σ_I yields 99.3% country share of index variance—mechanical reconciliation. Loading SDs 0.963 (industry) vs 0.457 (country) under second-step regressions on Model-1 factors show why unit-exposure restrictions hurt industry measurement more. Ireland’s 30.7% country share (2-factor) normalizing to 6.83% industry under 3-factor, and Media’s 27-point industry-share drop when global is added, are the leading diagnostics for MNC contamination and global-factor leakage. Common-currency measurement lifts country share by ~15%. Continuous membership in DJGI over 239 local days from July 1996 to July 1997 defines the 2,839-stock balanced panel.
