# Asset Growth and the Cross-Section of Stock Returns — Cooper, Gulen & Schill (2008) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Asset Growth and the Cross-Section of Stock Returns |
| **Authors** | Michael J. Cooper (Utah); Huseyin Gulen (Purdue); Michael J. Schill (Virginia Darden) |
| **Journal** | *Journal of Finance*, Vol. LXIII, No. 4, August 2008, pp. 1609–1651 |
| **Sample** | US stocks; portfolio sorts **1968–2003** (formation 1968–2002); accounting from Compustat |
| **Key variable** | Annual total asset growth: \(\mathrm{ASSETG}_t = (A_{t-1}-A_{t-2})/A_{t-2}\) (Compustat item 6) |
| **Original PDF** | `AbnormalReturnsAssetGrowth_CooperGulenSchill_2008.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsbmVfbVdsUFhjMlk` |
| **Extraction** | `pdftotext -layout`; clean text |

Previously circulated as “What best explains the cross-section of stock returns? Exploring the asset growth effect.”

---

## Problem / Motivation

A long event-study literature finds that **asset expansion** events (acquisitions, SEOs, debt issues, bank loans) are followed by low returns, while **contraction** events (spinoffs, repurchases, debt prepayments, dividend initiations) are followed by high returns. Related cross-sectional work links low future returns to capital investment (Titman–Wei–Xie), accruals (Sloan), sales growth (Lakonishok–Shleifer–Vishny), and external financing (Richardson–Sloan; Pontiff–Woodgate).

Cooper–Gulen–Schill argue these are fragments of a more comprehensive **total asset growth** effect. Using the simple year-over-year percentage change in total assets, they show that asset growth is an economically huge and statistically dominant predictor of the cross-section of US returns—surpassing BM, size, momentum, accruals, and competing growth measures in horse races—and that it remains present among large-cap stocks.

Motivation for a quant: if “investment” or “issuance” factors in modern models (FF5 CMA, etc.) work, total asset growth is a foundational empirical cousin; understanding magnitudes, persistence, and risk-vs-mispricing evidence is essential for factor design.

---

## Setup / Data

- Compustat–CRSP merge; annual asset growth from fiscal years ending in calendar \(t-2\) to \(t-1\).
- Portfolios formed end of June year \(t\) (standard FF timing); returns July \(t\)–June \(t+1\).
- Deciles by ASSETG; equal-weighted (EW) and value-weighted (VW).
- Size splits: NYSE 30th/70th ME percentiles → small / medium / large.
- Sample window for main sorts: July 1968–June 2003.
- Controls / competitors: BM, ME, momentum, accruals, sales growth, CAPEX growth, NOA growth, issuance measures, etc. (formulas in Appendix).

Figure 1: time series of mean/median asset growth—procyclical; large cross-sectional dispersion.

---

## Model / Methods

### One-way sorts

Decile portfolios on ASSETG; report raw returns, CAPM/FF3/Carhart alphas, event-time returns Years −1…+5.

### Fama–MacBeth regressions

Monthly cross-sectional regressions of returns on ASSETG and controls, within all-firms and size groups:

\[
r_{i,t+1} = \gamma_{0,t} + \gamma_{1,t}\mathrm{ASSETG}_{i,t} + \gamma_{2,t}'X_{i,t} + \varepsilon_{i,t+1}.
\]

Average \(\bar\gamma_1\) and HAC t-stats.

### Balance-sheet decomposition

Split asset growth into components: cash, current assets ex cash, PPE, other assets; financing side: retained equity, issuance, debt, operating liabilities—to see which margins drive the return effect across size groups.

### Risk vs mispricing

- Factor alphas (large; hard for risk story).
- Characteristics of high vs low growth firms (profitability event-time in Figure 4).
- Interaction with lagged market returns / growth dispersion as overconfidence proxies (Cooper–Gutierrez–Hameed style).

---

## Results with Numbers

### Headline abstract / intro magnitudes

- VW annualized raw returns: low-growth decile ≈ **18%**; high-growth decile ≈ **5%**.
- VW asset-growth spread Sharpe ≈ **1.07** vs BM 0.37, size 0.13, momentum 0.73 over the sample.
- Risk-adjusted low−high spread: ≈ **8%/year VW**; ≈ **20%/year EW**.
- Low growth beats high growth in **71%** of years (VW) and **91%** (EW).

### Table II — Year-1 monthly returns

**EW:** Decile 1 (low growth) **1.99%/mo**; Decile 10 (high) **0.26%/mo**; spread **−1.73%/mo** (\(t=-8.45\)), perfectly monotonic across deciles.

**VW:** Decile 1 **1.48%**; Decile 10 **0.43%**; spread **−1.05%/mo** (\(t=-5.04\)).

### Persistence (Years 1–5)

Cumulative Year-1-to-5 spread high−low: **−87.99%** EW (\(t=-8.63\)); **−49.67%** VW (\(t=-4.25\)). Figure 2 shows event-time mean returns: preranking, high growth had *higher* returns (extrapolation fuel); postranking, pattern reverses for years 1–5.

### Three-factor alphas (Year 1)

| Universe | EW α spread (high−low) | VW α spread |
|----------|------------------------|-------------|
| All | −1.63%/mo (\(t=-8.33\)) | −0.70%/mo (\(t=-3.84\)) |
| Small | −1.77% (\(t=-9.12\)) | −1.14% (\(t=-6.46\)) |
| Medium | −0.60% (\(t=-2.85\)) | −0.55% (\(t=-2.45\)) |
| Large | −0.86% (\(t=-3.12\)) | −0.81% (\(t=-2.91\)) |

**Present in large caps**—not a microcap artifact. Five-year average monthly α spreads remain significant (EW −0.73%, \(t=-10.96\); VW −0.39%, \(t=-2.73\)).

Carhart four-factor: EW −1.48% (\(t=-7.45\)); VW −0.60% (\(t=-2.84\)); large-firm VW −0.63% (\(t=-2.13\)).

### Time-series consistency (Figure 3)

EW low−high annual Year-1 spread negative in only 3 of 35 years (1984, 1985, 1996), and only mildly (−1%, −5%, −2%). Remarkable consistency.

### Not just SEO/acquisition effects

Dropping IPO/SEO/acquisition firm-years (Thomson) still leaves large α spreads; large-firm VW α spread ≈ −0.92%/mo (\(t=-3.72\)).

### Fama–MacBeth (Table III narrative)

ASSETG coefficient highly significant; in horse races with BM, size, momentum, accruals, sales growth, etc., asset growth retains large t-stats—often the strongest among growth-related predictors. Example cited: with sales growth, ASSETG remains powerful; standalone Model 1 all-firms t-stat on asset growth on the order of **−7.4**.

### Decomposition (Tables IV–V)

Different components matter by size:

- Among larger firms, growth financed via equity issuance / external finance plays a larger role.
- Among smaller firms, operating asset growth margins and other components weigh differently.
- Total ASSETG dominates individual pieces—supporting the “comprehensive growth” thesis.
- Issuance effects are partially subsumed by ASSETG but not always fully; asset growth provides a partial explanation of equity issuance/repurchase anomalies.

### Conclusion magnitudes (Section IV)

Low asset growth firms: subsequent annualized risk-adjusted returns ≈ **+9.1%**; high growth ≈ **−10.4%**; spread ≈ **19.5%/year** (EW-style summary). Cap-weighted spread still **8.4%/year**. Authors judge results **most consistent with overextrapolation of past growth** (mispricing), while noting risk-based investment theories (e.g., q-theory / real options) as alternative frames used elsewhere in the literature.

### Overconfidence interaction

Spread in growth rates between high and low deciles regresses positively on lagged 36-month market returns (\(t=4.80\)). Asset-growth return spread regresses on lagged growth-rate dispersion (\(t=2.17\)). Interpretation: after market booms, growth dispersion widens as managers invest aggressively; mispricing and return spreads enlarge—consistent with overconfidence dynamics.

---

## Limitations / Critical Assessment

1. **Risk vs mispricing not settled**: large FF3/Carhart alphas challenge static factor risk stories, but conditional ICAPM / investment-based models (Zhang, Liu–Whited–Zhang, FF5 CMA) rationalize investment effects. Paper leans behavioral.
2. **Overlaps with profitability and accruals**: later literature (Ball–Gerakos, Houseman, Fama–French investment factor) refines related signals; ASSETG remains highly correlated with CMA-like constructs.
3. **International out-of-sample**: paper is US-centric; subsequent work tests asset growth globally with mixed but often confirming evidence.
4. **Accounting distortion**: total assets affected by M&A accounting, leases, write-downs—noise that may attenuate or bias.
5. **Long-horizon returns**: five-year cumulative spreads are huge; overlapping horizons complicate inference (authors use appropriate methods for alphas).

---

## Practical Takeaways for a Quant Investor

1. **Total asset growth is a first-class characteristic**—not merely a proxy for SEOs. Use \(\Delta A/A\) (or industry-adjusted) as a core negative signal.
2. **Expect ~0.7–1.0%/mo VW FF3 alpha** on low−high in historical US sample; EW much larger but less implementable.
3. **Do not ignore large caps**—effect survives NYSE large group (~0.8%/mo VW α).
4. **Persist for years**—rebalance annually may still capture multi-year alpha; signal is slow-moving.
5. **Combine carefully with value, momentum, ivol, issuance**—multivariate FM weights (Lewellen) beat picking one “winner.”
6. **Watch procyclicality**: growth dispersion and the premium widen after strong markets—risk of crowded shorts on high-growth into regime shifts.
7. **Factor mapping**: close to FF investment factor (CMA); if already trading CMA, measure incremental alpha of raw ASSETG or components.

---

## Equations Desk Card

\[
\mathrm{ASSETG}_{i,t}=\frac{\mathrm{AT}_{i,t-1}-\mathrm{AT}_{i,t-2}}{\mathrm{AT}_{i,t-2}}
\]

\[
E[r_{\mathrm{low}}-r_{\mathrm{high}}]\approx 0.70\%\ \mathrm{VW\ FF3\ \alpha/mo\ (Year\ 1)}
\]

\[
\mathrm{Sharpe}(r_{\mathrm{low}}-r_{\mathrm{high}})^{\mathrm{VW, ann}}\approx 1.07\ \mathrm{(sample)}
\]

---

## Extended Narrative: Why Total Assets?

Component anomalies (CAPEX, accruals, shares outstanding growth, net external finance) each capture a slice of investment/financing. Total assets aggregate the balance sheet identity:

\[
\Delta \mathrm{Assets} = \Delta \mathrm{Liabilities} + \Delta \mathrm{Equity}.
\]

Any expansion—whether inventory build, capex, cash raised from issuance, or acquisition accounting—shows up in \(\Delta A\). That comprehensiveness is why ASSETG wins horse races: it is a sufficient statistic for many correlated corporate actions that the market appears to overprice.

Fairfield–Whisenant–Yohn (growth in NOA) and Hirshleifer et al. (balance-sheet bloat) are close relatives; Cooper et al. show total asset growth is still incremental and often stronger.

---

## Event-Time Profitability (Figure 4)

High growth firms show high operating margins around the sorting year that subsequently mean-revert; low growth firms look worse fundamentally preranking then improve relatively. If investors naively extrapolate growth and margins, they overpay for high ASSETG names—matching the return reversal. This is the behavioral narrative. Risk-based narratives emphasize that high investment occurs when discount rates are low (q-theory), so high ASSETG rationally predicts low subsequent returns—also consistent with the sign. Distinguishing requires tests the paper only partly provides (e.g., overconfidence interactions lean behavioral).

---

## Size Heterogeneity

Alphas largest for small stocks but **economically large for large stocks**. Decomposition suggests financing channels (issuance) matter more for big firms’ growth-return link, while operating asset growth matters more for small firms. Implementation: do not use a one-size component; either trade total ASSETG everywhere or use size-conditioned component weights.

---

## Robustness Battery (paper)

- Price filters ($3, $5); AT > $10m.
- March fiscal-year sorts vs June.
- Exclude SEO/IPO/acquisition years.
- Carhart four-factor.
- Subperiod alphas (Panel D of Table II style).
- Multiple growth controls in FM.

Inferences unchanged: high growth → low future returns.

---

## Relation to Modern Factors

Fama–French (2015) CMA (conservative-minus-aggressive investment) operationalizes a related idea using asset growth in their definition of investment. Cooper–Gulen–Schill (2008) is key prior evidence that such a factor should work and that magnitudes are large. Hou–Xue–Zhang q-factor investment similarly. For attribution, measure whether a proprietary ASSETG signal adds alpha beyond CMA.

---

## Numerical Digest

| Quantity | Value |
|----------|-------|
| VW low-growth ann. raw return | ~18% |
| VW high-growth ann. raw return | ~5% |
| VW spread Sharpe | 1.07 |
| EW Year-1 spread | −1.73%/mo (t=−8.45) |
| VW Year-1 spread | −1.05%/mo (t=−5.04) |
| EW FF3 α spread | −1.63%/mo |
| VW FF3 α spread | −0.70%/mo |
| Large VW FF3 α spread | −0.81%/mo (t=−2.91) |
| 5-year cum. EW spread | −88% |
| 5-year cum. VW spread | −50% |
| Years low>high (EW) | 32/35 |
| Risk-adj. ann. spread (concl.) | ~8.4% VW; ~19.5% EW-style |

---

## Bottom Line

Annual total asset growth is a powerful, persistent, large-cap-relevant negative predictor of US equity returns. Low-minus-high spreads deliver Sharpe ratios historically competitive with or stronger than HML and momentum on a VW basis, with FF3/Carhart alphas that remain highly significant. The effect aggregates and often dominates related investment and financing anomalies. Whether interpreted as overextrapolation or rational investment-return tradeoff, the characteristic belongs in any serious cross-sectional expected-return model.


---

## Fama–MacBeth Interpretation Notes

When ASSETG enters alone, the slope is strongly negative. Adding BM, size, and momentum reduces but does not eliminate it. Adding accruals and sales growth—closest cousins—still leaves ASSETG significant, implying incremental information in the comprehensive total. t-statistics below −5 to −7 in monthly FM (all firms) are in the same league as momentum’s classic strength, which is why the authors claim dominance “in terms of t-statistics” among the listed competitors.

Within small, medium, and large partitions, significance patterns shift but the negative sign is stable. For portfolio construction, estimate FM slopes in expanding windows (Lewellen 2015 style) rather than relying only on sorts.

---

## Implementation Checklist

1. Data: Compustat AT; careful fiscal-year alignment; June formation.
2. Filters: exclude financials if desired (paper’s Appendix practices); price/size screens for live trading.
3. Neutralization: industry-adjust ASSETG to reduce sector bets (not the paper’s baseline but good practice).
4. Horizon: annual rebalance matches signal speed; monthly FM can still use latest ASSETG.
5. Risk: monitor correlation to CMA, SMB, and profitability; hedge unintended exposures.
6. Capacity: VW large-cap sleeve is the scalable cut; EW small-cap sleeve is academic alpha.

---

## Critique from a 2026 Vantage Point

Post-publication, asset growth / investment became a standard factor. Some attenuation in live factor returns is debated (as with most anomalies). Accruals and profitability refinements interact. Nonetheless the 1968–2003 magnitudes in Cooper et al. remain the classic benchmark citation for the raw strength of the effect. Pair with Ang et al. (ivol) and Daniel–Moskowitz (momentum crashes) when building a multi-anomaly risk+alpha system: high asset growth firms are often the same crowded longs that subsequently deliver low returns when investment boom sentiment reverses.

---

## Closing

Cooper, Gulen, and Schill elevate firm asset growth from an accounting identity to a central cross-sectional predictor. The quantitative case—monotone deciles, multi-year persistence, large-cap survival, and FM dominance—is among the cleanest in the anomalies literature.


---

## Full Quantitative Walkthrough

### Motivation in corporate-finance language

Efficient markets should capitalize capital expenditures, M&A, and financing at unbiased present values. The event-study trail of post-SEO, post-acquisition, and post-debt-issue underperformance—and the mirror-image outperformance after repurchases and spinoffs—suggests systematic bias. Cooper–Gulen–Schill’s wager is that a single firm-year growth rate in total assets captures the common component more effectively than studying each event in isolation.

### Construction details

Fiscal year \(t-1\) total assets vs \(t-2\); portfolio assignment at June \(t\) using ME for VW weights and NYSE breakpoints for size groups. This timing ensures accounting information is public (annual reports for firms with December FYE are out by June; the paper discusses non-December FYE conventions via standard Compustat date alignment).

Asset growth distribution: right-skewed; high-growth decile includes firms roughly doubling assets; low-growth decile includes substantial asset shrinkers (divestitures, write-downs, distress). Both tails contribute to the spread (not only the high-growth short leg).

### Table II raw returns—economic scale

EW −1.73%/mo ≈ −20.8%/year simple; VW −1.05%/mo ≈ −12.6%/year simple on the high−low difference. After FF3, VW α ≈ −0.70%/mo ≈ −8.4%/year—matching the conclusion’s “still large and significant 8.4% per year” VW figure. Sharpe 1.07 on the VW spread is extraordinary relative to HML’s 0.37 in-sample—partly because asset growth was not yet a popular, arbitraged factor over 1968–2003.

### Monotonicity

Perfect monotonicity of Year-1 EW returns across all ten deciles is rare among anomalies and strengthens confidence that the sort captures a genuine ordered characteristic effect rather than two extreme micros.

### Event-time Year −1 vs Year +1

Preranking, high-growth firms had *higher* returns—investors who buy growth after seeing high past returns and high asset expansion are extrapolating. Postranking reversal lasting five years suggests slow correction—compatible with limited attention and with q-theory’s multi-year investment planning, depending on taste.

### Alphas by size—the large-cap result

Many anomalies fade in the top NYSE size tercile. Asset growth’s VW large-cap FF3 α spread of −0.81%/mo (\(t=-2.91\)) is therefore pivotal for institutional implementability. Medium-cap results (−0.55% VW) similarly matter for mid-cap mandates.

### Exclusion of issuance/M&A events

Skeptics claim ASSETG is “just SEOs and acquisitions.” Removing those firm-years still leaves large α. Interpretation: organic growth and broader balance-sheet expansion are also mispriced (or rationally linked to low discount rates), not only headline corporate events.

### FM horse races

Typical specification battle:

- Model with ASSETG alone: large negative slope.
- Add ln(ME), ln(BM), past returns: ASSETG survives.
- Add accruals, Δsales, Capex/Assets, NOA growth: ASSETG often retains the largest |t|.
- Size-group FM: small-firm ASSETG t-stats enormous; large-firm still significant in key models.

This is why the authors say asset growth “emerges as” the leading predictor among the set they consider.

### Balance-sheet decomposition economics

Financing side: equity issuance growth predicts low returns (Pontiff–Woodgate); debt growth weaker/mixed; retained earnings growth related to profitability. Asset side: growth in current operating assets and PPE both matter. The paper’s finding that **relative importance shifts by size** is subtle and under-cited: a one-factor ASSETG may be optimal for simplicity, but a size-conditioned component model can improve information ratios in a multi-sleeve book.

### Behavioral vs rational

**Behavioral package:** extrapolative expectations (LSV), overconfidence after market gains (widening growth dispersion), slow earnings-growth mean reversion.

**Rational package:** q-theory—firms invest more when costs of capital are low; high investment forecasts low returns. Cochrane’s presidential address (also in this batch) emphasizes discount-rate variation as the organizing principle—asset growth fits that worldview if investment responds to discount rates.

Cooper et al. highlight behavioral evidence (overconfidence regressions) but cannot reject rational models. For portfolio choice, the sign and magnitude matter more than the label; for equilibrium risk models, the distinction matters.

### Interaction with other batch papers

- vs Ang et al.: high growth may coincide with high ivol; check double sorts.
- vs Moskowitz–Grinblatt: industry-level investment cycles could create industry momentum overlapping asset growth—industry-adjust ASSETG.
- vs Daniel–Moskowitz: high-growth shorts are not the same as momentum shorts, but both can crash when sentiment rebounds—risk-manage jointly.
- vs Cochrane 2011: discount-rate lens rationalizes why investment and expected returns comove.

### Trading protocol

Annual characteristic update each June; hold twelve months; VW within deciles or use continuous Z-score of ASSETG in an optimizer with constraints on sector, beta, and CMA residual. Expected annualized VW spread alpha ~6–10% historical before costs; apply cost models differentiated by size.

### Statistical caveats

Overlapping five-year returns require Newey–West or Hansen–Hodrick adjustments (authors use GMM delta-method for extreme-decile α differences). Multiple testing across many growth definitions is a concern historically, but total AT growth is a natural, pre-specified comprehensive measure—less suspicious than a mined ratio.

### Numerical digest (repeat for desk)

EW Year-1 high−low: −1.73%/mo; VW: −1.05%/mo; VW FF3 α: −0.70%/mo; large VW FF3 α: −0.81%/mo; 5-year cum EW: −88%; VW spread Sharpe: 1.07; beat rate EW: 91% of years.

### Bottom line expanded

Treat total asset growth as a core negative expected-return characteristic with rare large-cap strength and multi-year persistence. Use it either as a stand-alone sleeve or as the empirical ancestor of CMA, ensuring incremental value after controlling for modern investment factors.


---

## Additional Empirical Texture (Cooper–Gulen–Schill)

### Subperiod stability

The paper reports subperiod three-factor alphas (Table II panels). Qualitatively, the asset-growth effect is not confined to a single decade: both early and late sample windows show negative high-minus-low alphas, with some variation in magnitude. The 35-year annual beat rate (especially EW 32/35) is more persuasive than any single subperiod t-stat.

### Relation to accruals and NOA

Sloan accruals and Fairfield–Whisenant–Yohn NOA growth are nested in the broader investment/financing complex. When ASSETG and accruals enter together, both can be significant, but ASSETG’s comprehensive nature often yields the larger |t|. Practitioners who already trade accruals should still test incremental ASSETG (or PPE growth + current operating asset growth).

### Relation to share issuance

Pontiff–Woodgate growth in shares outstanding is closely related on the financing side. Cooper et al. show issuance helps explain part of the effect especially among large firms, yet ASSETG retains explanatory power—organic asset expansion matters too.

### q-theory mapping

In investment-based asset pricing, the first-order condition links investment to marginal q and expected returns. High investment (high ASSETG) occurs when expected returns (discount rates) are low. This rationalizes the sign without behavioral extrapolation. The paper’s overconfidence tests (growth dispersion after market booms) are offered as behavioral corroboration but are also compatible with rational investment responses to temporarily low discount rates (see Cochrane 2011 discussion of investment–price comovement).

### Portfolio optimization note

If using mean-variance optimization with characteristic-based expected returns, set

\[
\mu_i = \bar\mu + \hat\gamma_{\mathrm{ASSETG}} Z(\mathrm{ASSETG}_i) + \cdots
\]

with \(\hat\gamma_{\mathrm{ASSETG}}<0\) estimated from FM. Constrain annual turnover because ASSETG is sticky.

### Transaction costs

Annual rebalance VW large-cap ASSETG strategy has moderate turnover relative to monthly ivol or momentum. Costs are unlikely to erase the historical ~8%/yr VW α, though live factor decay remains an empirical question.

### Risk management

High-growth shorts can suffer if the market enters a prolonged growth-stock bull regime (e.g., episodes where high ASSETG coincides with high profitability and stays overpriced longer). Combine with profitability quality filters (novy-marx / FF RMW) to avoid shorting high-growth high-quality compounders indiscriminately—or accept that pure ASSETG will sometimes short winners.

### Data QA

Watch for Compustat restatements, fiscal-year changes, and merger-related AT jumps. Winsorize ASSETG at 1/99 before FM regressions; for sorts, large positive outliers naturally sit in decile 10.

### Teaching summary for juniors

Buy firms shrinking assets; short firms growing assets quickly; rebalance each June; prefer VW; expect multi-year hold benefits; do not confuse with SEO-only effects; correlate with CMA but check incremental alpha.


---

## Extended Comparison Table (Growth Anomalies)

| Signal | Typical sign for future returns | Horizon | Large-cap? | Notes |
|--------|----------------------------------|---------|------------|-------|
| Total asset growth (CGS) | Negative | 1–5 yrs | Yes | Comprehensive |
| Accruals (Sloan) | Negative | 1 yr | Partial | Earnings quality |
| NOA growth (FWY) | Negative | 1 yr | Partial | Operating assets |
| Capex growth (TWX) | Negative | 1–3 yrs | Mixed | Real investment |
| Share growth (PW) | Negative | 1–3 yrs | Yes | Financing |
| Sales growth (LSV) | Negative | 1–5 yrs | Mixed | Glamour |

CGS’s claim is that ASSETG sits at the top of this table on t-stat and nesting grounds.

### Monte Carlo / multiple testing remark

Even if many growth definitions were tried historically, percentage change in total assets is the most natural aggregative measure—an a priori reasonable hypothesis rather than an obscure ratio. That does not eliminate data-mining concerns for the *literature as a whole*, but it strengthens ASSETG relative to exotic accounting constructs.

### Final Cooper numerical mantra

−1.73%/mo EW, −1.05%/mo VW raw Year-1; −0.70%/mo VW FF3; −0.81%/mo large VW FF3; Sharpe 1.07 VW spread; 5-year cum −50% VW; 91% of EW years positive spread.


---
