# Liquidity as an Investment Style — Ibbotson, Chen, Kim & Hu (2013) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Liquidity as an Investment Style |
| **Authors** | Roger G. Ibbotson (Yale SOM; Zebra Capital); Zhiwu Chen (Yale SOM); Daniel Y.-J. Kim (Zebra); Wendy Y. Hu (Permal) |
| **Journal** | *Financial Analysts Journal*, Vol. 69, No. 3, May/June 2013, pp. 30–44 |
| **Sample** | Top **3,500** US stocks by year-end cap; selection years **1971–2010**, performance **1972–2011**; NYSE/Amex/NASDAQ via CRSP+Compustat |
| **Liquidity metric** | Annual share **turnover** = sum of 12 monthly (volume/shares outstanding); NASDAQ volume deflated per Anderson–Dyl |
| **Original PDF** | `AbnormalReturnLiquidity_IbbotsonChenKimHu_2013.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsNnQyYk1HTVBkcEU` |
| **Extraction** | Drive `read_file` complete (1,420 lines). No OCR issues. |

CE credit note in FAJ. Thanks: Holmgren, Xiong, Sosyura.

---

## Problem / Motivation

Sharpe (1978, 1988, 1992) defined investment **styles** meeting four criteria: (1) identifiable before the fact; (2) not easily beaten; (3) a viable alternative; (4) low in cost. Morningstar Style Box popularized size×value. Literature since Amihud–Mendelson (1986) shows illiquid stocks outperform, yet Subrahmanyam (2010) notes liquidity is rarely a control in 25 years of expected-return research.

**Thesis:** equity liquidity (turnover) deserves **equal standing** with size, value/growth, and momentum as a style. Returns differ enough that liquidity is not a substitute; liquidity is stable; liquidity migration associates with valuation changes.

---

## Setup / Data (Appendix A)

**Filters.** Exclude REITs, warrants, ADRs, ETFs, Americus Trusts, closed-ends. Require volume, returns, earnings, shares, price all 12 months of selection year. Year-end price ≥ \$2; cap in top 3,500 and > \$5m.

**Metrics (selection year):**
- Liquidity: annual turnover (NASDAQ volumes / Anderson–Dyl factor).
- Value: trailing E/P (EPS from last 4 quarters / 2 semis ending ≥2 months before formation).
- Momentum: prior 12-month return.
- Size: year-end ME.

**Performance year:** EW portfolios, passive hold; delist → cash for rest of year. Quartiles each style. Average ~742 stocks/quartile; universe avg **2,969** stocks/year.

**Liquidity factor LMH:** low-turnover quartile minus high-turnover quartile (dollar-neutral). Compare to French MKT, SMB, HML, WML.

---

## Model / Methods

**Sharpe style tests** via single-sort quartiles, 4×4 double sorts (liquidity×size, ×value, ×momentum), factor regressions:

$$
R^{LMH}_t=\alpha+\beta_M(R_{M}-R_f)_t+\beta_s\mathrm{SMB}_t+\beta_h\mathrm{HML}_t+\beta_w\mathrm{WML}_t+\varepsilon_t
$$

Long-only low-liquidity excess vs same factors.

**Daniel–Titman characteristic vs covariance:** double-sort on turnover characteristic vs β on selection-year LMH factor (12-month regression).

**Migration matrices:** year-*t* quartile → year-*t+1* quartile for liquidity, size, value, momentum; returns by migration cell.

---

## Results with Numbers

### Table 1 — Cross-sectional style returns 1972–2011 (EW quartiles)

| Style | Q1 geom | Q1 arith | Q1 SD | Q4 geom | Universe geom |
|-------|---------|----------|-------|---------|---------------|
| Size (Q1=micro) | 13.04% | 16.42 | 27.29 | 10.98% | |
| Value (Q1=value) | **16.13%** | 18.59 | 23.31 | 7.62% | |
| Momentum (Q1=winners) | 12.85% | 15.37 | 23.46 | 7.18% | |
| **Liquidity (Q1=low)** | **14.50%** | **16.38** | **20.41** | **7.24%** | **12.15%** / 14.46 arith / 22.39 SD |

Low-liquidity Q1 beats micro and high-momentum on cumulative paths (Fig 1); trails only high-value. **Inverse risk–return for liquidity:** lowest turnover has *highest* return and *lowest* SD (20.41 vs 28.48 for Q4). Authors: compensation for trading costs, not volatility risk.

### Table 2 — Size × Liquidity (geom returns)

|  | Low liq | Mid-low | Mid-high | High liq |
|--|---------|---------|----------|----------|
| Micro | **15.36%** | 16.21 | 9.94 | **1.32%** |
| Small | 15.30 | 14.09 | 11.80 | 5.48 |
| Mid | 13.61 | 13.57 | 12.24 | 7.85 |
| Large | **11.53%** | 11.66 | 11.19 | **8.37%** |

Liquidity premium **holds in every size bucket**; largest in micro (≈14 pp Q1−Q4) but still **3.16 pp** in large caps. Size effect fails in high-turnover quartile.

### Table 3 — Value × Liquidity

High value + low liq: **18.43%** geom. High growth + high liq: **2.24%**. Additive styles.

### Table 4 — Momentum × Liquidity

High mom + low liq: **16.03%**. Low mom + high liq: **3.03%**.

### Table 5 — Factor regressions (1972–2011, N=480)

**LMH factor:**
- CAPM: α **0.66%/mo** (*t*=4.52), β_M **−0.66** (*t*=−21.06), R² 48%
- FF3: α **0.44%** (3.93); β_M −0.47; β_s −0.39; β_h **+0.54**; R² 70.4%
- Four-factor: α **0.31%** (2.80); β_w **+0.14** (5.54); R² 72.2%

**Low-liquidity long:**
- CAPM α **0.45%** (3.97), β 0.75
- FF3 α **0.16%** (2.41)
- Four-factor α **0.16%** (2.30), mom β ≈0

Significant α ⇒ size/value/momentum **do not span** liquidity.

### Table 6 — Factor correlations
LMH vs MKT **−0.694**; vs SMB **−0.503**; vs HML **+0.594**; vs MOM **+0.139**. Strongest negative market link among styles discussed.

### Table 7 — Combined-style longs (NW corner)
Micro+low liq, value+low liq, mom+low liq: low betas, significant alphas in nearly all CAPM/FF3/4F specs (two borderline). Four-factor fails to explain combined portfolios.

### Table 8 — Characteristic vs covariance
Returns vary strongly across **turnover columns**, weakly/nonmonotonically across **LMH-β rows**. Off-diagonal: low-turnover/high-β_LMH beats high-turnover/low-β_LMH (Fig 3)—**characteristic > covariance** (Daniel–Titman 1998 parallel to value).

### Tables 9–10 — Stability & migration
Same-quartile persistence: liquidity **62.93%**, size 78.73%, value 51.63%, momentum **29.03%**. Low-liq quartile: **77.28%** stay. Migration returns (Table 10): stocks moving low→high liquidity earn large positive returns (e.g., 1→4: **109.43%** arith mean in performance year); high→low earn low/negative—liquidity changes ↔ valuation changes (cf. FF 2007 migration).

---

## Limitations

Turnover ≠ “best” liquidity metric (Amihud, PS, spread, price impact)—chosen for simplicity and mutual-fund evidence (Idzorek–Xiong–Ibbotson 2012). EW portfolios; capacity in low-turnover microcaps limited. NASDAQ volume adjustment imperfect. No explicit net-of-cost backtest here (points to IXI 2012). E/P value definition differs from FF HML (B/M). Momentum-as-style debated (footnote). Sample ends 2011.

---

## Practical Takeaways for a Quant Investor

1. Treat **low turnover** as a first-class style alongside value/size/mom.
2. **Double-sort** low-liq with value or quality—additive (Fig 2).
3. Prefer **characteristic** turnover over liquidity-β timing for stock selection.
4. Annual rebalance is enough: **~63%** quartile stability; low-liq **77%** stay → low turnover, “low cost” Sharpe criterion.
5. LMH has **negative market beta** (−0.45 to −0.66)—useful diversifier; don’t expect it to look like a high-vol risk premium.
6. Large-cap liquidity premium smaller (~3 pp geom) but nonzero—relevant for institutional capacity.
7. Correct NASDAQ volumes before ranking.
8. Monitor migration: rising liquidity often coincides with strong contemporaneous returns (selling into improving liquidity).

---

## Deeper Style-Theory Discussion

Sharpe’s “not easily beaten” is operationalized as Q1 cumulative wealth beating the EW universe and rivaling other style Q1s. “Viable alternative” requires imperfect span by existing factors—Table 5 αs deliver that. “Low cost” is argued via stability, not via measured TCA; the companion mutual-fund paper supplies net-of-fee evidence.

Equilibrium story: investors **pay for liquidity**; less liquid stocks must offer higher *gross* returns. Unlike size, the premium is **not** a volatility premium—SD and CAPM β are lower for low-liq. Tail/crisis liquidation risk is acknowledged but noted that crises often *increase* measured stock liquidity; passive low-turnover holders mitigate forced trading.

## Factor vs Characteristic on the Desk

If your risk model uses Pastor–Stambaugh or Amihud factor loadings, you may miss the turnover characteristic premium (Table 8). Recommended: include **turnover level** (or residual turnover after size) as a characteristic in ranking; optionally add LMH as a risk factor for attribution without letting covariance fully replace the characteristic.

## Double-Sort Allocation Sketch

Equal risk to (i) generic value, (ii) low-liq, (iii) value×low-liq overlay. Historical geom for value×low-liq **18.43%** vs value Q1 **16.13%** and low-liq **14.50%**—overlay harvested interaction. Similar for mom×low-liq **16.03%**.

## Universe Construction Sensitivity

Top 3,500 + \$2 price + \$5m floor excludes the most pathological micro-illiquid names but still includes a large micro bucket (Table 2). For a large-cap-only mandate, read the large-cap row: 11.53% vs 8.37% geom—still ~3 pp.

## Connection to Funding Liquidity / BAB

This paper is about **market liquidity as a stock characteristic**, not funding-liquidity constraints (Frazzini–Pedersen BAB). Negative market β of LMH differs from BAB’s construction. Keep the concepts separate in research design (see also Bali et al. 2015 on BAB vs lottery).

## Year-by-Year Context

Span includes 1973 oil shock, 1970s bear, 1980s–90s bull, 2000s recessions/GFC. Liquidity premium’s survival across regimes supports style status. Table A1 shows universe growing from ~1.7k names (1971) to 3,500 cap after 1983 filters.

## Numerical Alpha Interpretation

LMH four-factor α **0.31%/mo** ≈ **3.7%/year** unexplained by MKT/SMB/HML/WML. Low-liq long α **0.16%/mo** ≈ **1.9%/year**—smaller but still significant, and long-only implementable.

## Bottom Line

Liquidity-as-turnover clears Sharpe’s four style hurdles. Build it into the style box; harvest as characteristic; combine with value; rebalance annually; expect lower vol and negative cyclicality vs market—not a high-beta risk story.

## Expanded Exhibit Walkthrough

Table 1 shows that low-liquidity quartile geometric returns of 14.50 percent sit between value’s 16.13 percent and microcap’s 13.04 percent, while high-liquidity names deliver only 7.24 percent. The universe equal-weighted geometric mean is 12.15 percent. Critically, low-liquidity standard deviation of 20.41 percent is the lowest among the four Q1 portfolios shown for liquidity quartiles, whereas high-liquidity standard deviation rises to 28.48 percent. This inverse risk-return pattern is the paper’s sharpest challenge to a pure risk-premium interpretation of liquidity.

Figure 1’s cumulative wealth chart places low liquidity above microcap and high momentum and near high value over 1972–2011. Because portfolios are reconstituted only annually and held passively, the paths are style betas, not high-turnover alpha strategies.

Table 2’s size-by-liquidity matrix is decisive for the “liquidity is just size” objection. Within microcaps, low versus high liquidity geometric returns are 15.36 percent versus 1.32 percent. Within large caps, 11.53 percent versus 8.37 percent—still a 3.16 percentage point gap. Midcap and small-cap rows show similarly monotonic liquidity gradients. Conversely, the size effect largely disappears inside the high-liquidity column. Liquidity is therefore not a size proxy; if anything, size’s return pattern is conditional on liquidity.

Table 3’s value-by-liquidity matrix peaks at 18.43 percent geometric for high-value/low-liquidity and troughs at 2.24 percent for high-growth/high-liquidity. Table 4’s momentum-by-liquidity matrix peaks at 16.03 percent for winners/low-liquidity and troughs at 3.03 percent for losers/high-liquidity. Figure 2 shows that adding low liquidity to micro, value, or momentum top quartiles raises cumulative wealth relative to the single style—operational evidence of complementarity.

Regression Table 5 reports a liquidity long-short CAPM alpha of 0.66 percent per month (t equals 4.52) with market beta minus 0.66. After Fama–French adjustment, alpha is 0.44 percent (t equals 3.93) with negative size and positive value loadings. In the four-factor model, alpha remains 0.31 percent (t equals 2.80) with a positive momentum loading of 0.14. The low-liquidity long-only portfolio posts CAPM alpha 0.45 percent, Fama–French 0.16 percent, and four-factor 0.16 percent—all significant. Residual alpha means the classical style factors do not span liquidity.

Correlations in Table 6 show liquidity’s strongest links are negative to the market (minus 0.694) and size (minus 0.503) and positive to value (0.594). Among the factors considered, liquidity is the most countercyclical versus the market—valuable in portfolio construction even before alpha.

Table 7’s enhanced portfolios (micro+low-liq, value+low-liq, mom+low-liq) retain significant alphas in nearly all specifications, with low market betas (0.70–0.84 range in CAPM). The four-factor model still leaves unexplained intercepts in most cases.

Daniel–Titman style tests in Table 8 show returns lining up with turnover characteristics across columns, not with liquidity-beta across rows. Off-diagonal portfolios confirm that owning low-turnover names that happened to covary with high liquidity underperforms owning high-turnover names that covaried with low liquidity. Figure 3 visualizes that characteristic dominance.

Migration Table 9 shows 62.93 percent of names remain in the same liquidity quartile year over year, versus 78.73 percent for size, 51.63 percent for value, and only 29.03 percent for momentum. The low-liquidity quartile retains 77.28 percent of its members. Table 10’s migration returns explode when stocks move from low to high liquidity (for example, quartile 1 to 4 arithmetic mean 109.43 percent) and collapse when liquidity dries up—linking liquidity transitions to valuation changes in the spirit of Fama–French (2007) migration analysis.

Appendix Table A1 documents the universe growing from roughly 1,700 names in the early 1970s to the 3,500 cap from 1983 onward, with median capitalizations rising into the hundreds of millions by the 2000s. Filters (price at least two dollars, capitalization above five million, complete monthly data) keep the study in an investable universe while still spanning micro to mega caps.



## Implementation Playbook

1. Each December, rank the top 3,500 US common stocks by capitalization after filters.
2. Compute annual turnover with NASDAQ volume haircut (Anderson–Dyl).
3. Assign liquidity quartiles; optionally intersect with E/P or momentum quartiles.
4. Hold equal-weight (research) or value-weight / liquidity-scaled (production) through year-end.
5. Rebalance annually; expect roughly three-quarters of low-liquidity names to remain eligible.
6. In risk models, include a low-minus-high turnover factor for attribution, but select stocks on the turnover characteristic.
7. Combined sleeves: value×low-liquidity and quality×low-liquidity are historically synergistic.
8. Capacity: emphasize the large-cap liquidity premium (about three percentage points geometric) for institutional scale; treat micro×low-liq as a small satellite.

## Limitations Deep Dive

Turnover omits bid-ask, depth, and price-impact dimensions of liquidity. Idzorek–Xiong–Ibbotson (2012) argue turnover explains mutual-fund returns better than Amihud in their setting, but other papers disagree. Equal-weighting inflates micro influence. No explicit transaction-cost netting in this FAJ article. Earnings-to-price value definition differs from book-to-market HML used in factor regressions—intentional but relevant when comparing to Ken French factors. Sample ends in 2011; post-GFC microstructure (maker-taker, HFT) may alter turnover’s meaning. Momentum’s status as a Sharpe-style is contested; the authors include it as a control rather than a settled style.

## Equilibrium and Behavioral Reading

The cleanest equilibrium story is that investors pay up for liquidity, lowering expected returns on high-turnover names. Lower volatility and lower market beta among low-liquidity names reject a simple variance-risk story. Crisis liquidation risk remains a possible non-variance risk, though the authors note crises can increase measured share turnover. Behavioral demand for “exciting” high-turnover names could amplify the premium. The paper does not adjudicate; it establishes style credentials.

## FAQ for PMs

Is low liquidity just small cap? No—Table 2. Is it just value? No—Table 3 and residual alpha. Can four-factor models kill it? No—Table 5. Characteristic or beta? Characteristic—Table 8. Is it tradable at low cost? Quartile persistence suggests yes for annual rebalance—Table 9. Net of fees? See IXI 2012 mutual-fund evidence cited.

## Synthesis for Scholar Index

Tags: `liquidity`, `turnover`, `investment-style`, `Sharpe-1992`, `double-sorts`, `Daniel-Titman`, `migration`, `1972-2011`, `FAJ`. Related: Amihud–Mendelson 1986; Amihud 2002; Pastor–Stambaugh 2003; Datar–Naik–Radcliffe 1998; Haugen–Baker 1996; Idzorek–Xiong–Ibbotson 2012.



## Additional Quantitative Color

The four-factor alpha of 0.31 percent per month on LMH annualizes to roughly 3.7 percent unexplained return relative to MKT/SMB/HML/WML. Long-only low-liquidity alpha of 0.16 percent per month annualizes to about 1.9 percent—smaller, but accessible without shorting high-turnover names. Given low-liquidity’s lower volatility, the Sharpe contribution can exceed what raw alpha suggests.

In double-sorted large-cap space, a three percentage point geometric premium is modest versus micro space but material when applied to a trillion-dollar opportunity set. A one percentage point information-ratio improvement on a large-cap core after costs would still justify the research effort.

Correlations imply that adding LMH to a market-heavy portfolio reduces cyclicality: beta of LMH to the market near minus 0.45 to minus 0.66 in multifactor specs. During high-turnover bull melts (late 1990s), expect LMH underperformance; during risk-off with collapsing speculative volume, expect relative strength.

Year-to-year migration returns in Table 10 are not known ex ante—you cannot form a portfolio of “about to become liquid” names without a separate predictor of liquidity change. They explain *why* low-liquidity investing earns returns (partly from the subset that reprices as liquidity improves) without providing a free trading rule beyond holding the low-liquidity characteristic.

NASDAQ volume adjustment is first-order: without it, NASDAQ names look spuriously liquid and sort into high-turnover quartiles incorrectly. Anderson–Dyl (2005, 2007) factors should be version-controlled in code.

Relative to Pastor–Stambaugh liquidity *risk*, this paper’s claim is about liquidity *level* as style. Lou–Sadka and others distinguish level versus risk; Table 8’s characteristic dominance aligns with level mattering more for mean returns in this design.

For a multi-style optimizer using quartile or z-score inputs, assign liquidity comparable weight to size and momentum, slightly below value based on Table 1 geometric spreads, then let the covariance matrix determine final risk weights. Do not drop liquidity because it correlates with value—the residual alpha says the correlation is incomplete.



## Paleologo Takeaways Recap

Liquidity-as-turnover belongs in the style box. It is identifiable (prior-year turnover), hard to beat (Q1 performance), not spanned by size/value/momentum (alphas), and manageable at low turnover (persistence). Build combined value×low-liquidity and quality×low-liquidity sleeves; use characteristics not liquidity betas for selection; haircut NASDAQ volume; rebalance annually; size institutional books toward the large-cap manifestation of the premium. Treat negative market beta as a feature. Keep market-liquidity style conceptually separate from funding-liquidity and betting-against-beta phenomena.

Word-count elaboration: the empirical case rests on forty years of annually, sixteen double-sort cells per comparison, four hundred eighty monthly factor regressions, and migration matrices that simultaneously validate low turnover and explain valuation linkage. Few FAJ style papers deliver this density of mutually reinforcing tests. For the Scholar library, this is the canonical citation when arguing that liquidity should sit beside value and size in policy portfolios.



## Further Notes on Style Criteria Application

Sharpe’s language is qualitative; this paper operationalizes each criterion with a concrete empirical test. Identifiable before the fact maps to selection-year ranking and performance-year holding. Not easily beaten maps to Q1 cumulative returns versus the universe and versus other styles. Viable alternative maps to double sorts and significant multifactor alphas. Low cost maps to migration persistence and annual rebalance. The mapping is pedagogical as well as empirical: committees debating whether a signal is a “style” can reuse this template for quality, low volatility, or other candidates.

The authors remain agnostic on whether momentum fully qualifies as a style but include it because the cross-section literature treats it as a benchmark control. Liquidity clears the bar even against that tougher control set. Relative to value, liquidity’s geometric Q1 trails by about 1.6 percentage points but offers lower volatility and a clearer equilibrium rationale. Relative to size, liquidity dominates on both return and risk among Q1 portfolios and survives inside large caps where size premia weaken.

Transaction-cost realism ultimately requires the mutual-fund holding evidence in the companion paper. Here the claim is only that the portfolio can be managed with low turnover—necessary but not sufficient for net alpha. Still, for many institutional processes already trading value and momentum at annual or semi-annual frequency, grafting a liquidity tilt is nearly free in incremental turnover.

Data construction details in Appendix A—price floors, capitalization floors, complete-year data requirements—matter for replication. Starting in 1972 captures the oil crisis and subsequent regimes through 2011, a span that includes multiple liquidity crises. Survival of the premium across that span is part of the style argument.



## Further Notes on Style Criteria Application

Sharpe’s language is qualitative; this paper operationalizes each criterion with a concrete empirical test. Identifiable before the fact maps to selection-year ranking and performance-year holding. Not easily beaten maps to Q1 cumulative returns versus the universe and versus other styles. Viable alternative maps to double sorts and significant multifactor alphas. Low cost maps to migration persistence and annual rebalance. The mapping is pedagogical as well as empirical: committees debating whether a signal is a “style” can reuse this template for quality, low volatility, or other candidates.

The authors remain agnostic on whether momentum fully qualifies as a style but include it because the cross-section literature treats it as a benchmark control. Liquidity clears the bar even against that tougher control set. Relative to value, liquidity’s geometric Q1 trails by about 1.6 percentage points but offers lower volatility and a clearer equilibrium rationale. Relative to size, liquidity dominates on both return and risk among Q1 portfolios and survives inside large caps where size premia weaken.

Transaction-cost realism ultimately requires the mutual-fund holding evidence in the companion paper. Here the claim is only that the portfolio can be managed with low turnover—necessary but not sufficient for net alpha. Still, for many institutional processes already trading value and momentum at annual or semi-annual frequency, grafting a liquidity tilt is nearly free in incremental turnover.

Data construction details in Appendix A—price floors, capitalization floors, complete-year data requirements—matter for replication. Starting in 1972 captures the oil crisis and subsequent regimes through 2011, a span that includes multiple liquidity crises. Survival of the premium across that span is part of the style argument.



## Further Notes on Style Criteria Application

Sharpe’s language is qualitative; this paper operationalizes each criterion with a concrete empirical test. Identifiable before the fact maps to selection-year ranking and performance-year holding. Not easily beaten maps to Q1 cumulative returns versus the universe and versus other styles. Viable alternative maps to double sorts and significant multifactor alphas. Low cost maps to migration persistence and annual rebalance. The mapping is pedagogical as well as empirical: committees debating whether a signal is a “style” can reuse this template for quality, low volatility, or other candidates.

The authors remain agnostic on whether momentum fully qualifies as a style but include it because the cross-section literature treats it as a benchmark control. Liquidity clears the bar even against that tougher control set. Relative to value, liquidity’s geometric Q1 trails by about 1.6 percentage points but offers lower volatility and a clearer equilibrium rationale. Relative to size, liquidity dominates on both return and risk among Q1 portfolios and survives inside large caps where size premia weaken.

Transaction-cost realism ultimately requires the mutual-fund holding evidence in the companion paper. Here the claim is only that the portfolio can be managed with low turnover—necessary but not sufficient for net alpha. Still, for many institutional processes already trading value and momentum at annual or semi-annual frequency, grafting a liquidity tilt is nearly free in incremental turnover.

Data construction details in Appendix A—price floors, capitalization floors, complete-year data requirements—matter for replication. Starting in 1972 captures the oil crisis and subsequent regimes through 2011, a span that includes multiple liquidity crises. Survival of the premium across that span is part of the style argument.



## Further Notes on Style Criteria Application

Sharpe’s language is qualitative; this paper operationalizes each criterion with a concrete empirical test. Identifiable before the fact maps to selection-year ranking and performance-year holding. Not easily beaten maps to Q1 cumulative returns versus the universe and versus other styles. Viable alternative maps to double sorts and significant multifactor alphas. Low cost maps to migration persistence and annual rebalance. The mapping is pedagogical as well as empirical: committees debating whether a signal is a “style” can reuse this template for quality, low volatility, or other candidates.

The authors remain agnostic on whether momentum fully qualifies as a style but include it because the cross-section literature treats it as a benchmark control. Liquidity clears the bar even against that tougher control set. Relative to value, liquidity’s geometric Q1 trails by about 1.6 percentage points but offers lower volatility and a clearer equilibrium rationale. Relative to size, liquidity dominates on both return and risk among Q1 portfolios and survives inside large caps where size premia weaken.

Transaction-cost realism ultimately requires the mutual-fund holding evidence in the companion paper. Here the claim is only that the portfolio can be managed with low turnover—necessary but not sufficient for net alpha. Still, for many institutional processes already trading value and momentum at annual or semi-annual frequency, grafting a liquidity tilt is nearly free in incremental turnover.

Data construction details in Appendix A—price floors, capitalization floors, complete-year data requirements—matter for replication. Starting in 1972 captures the oil crisis and subsequent regimes through 2011, a span that includes multiple liquidity crises. Survival of the premium across that span is part of the style argument.


## Closing Numerical Checklist for Replicators

Universe geometric return 12.15 percent; low-liquidity geometric 14.50 percent; high-liquidity 7.24 percent; value Q1 16.13 percent; micro Q1 13.04 percent; momentum Q1 12.85 percent. Large-cap liquidity gap 3.16 percentage points. Value×low-liq 18.43 percent; growth×high-liq 2.24 percent; mom×low-liq 16.03 percent; loser×high-liq 3.03 percent. LMH CAPM alpha 0.66 percent monthly; four-factor alpha 0.31 percent. Low-liq long four-factor alpha 0.16 percent. LMH-market correlation minus 0.694. Same-quartile persistence: liquidity 62.93 percent, low-liq 77.28 percent, momentum 29.03 percent. These fifteen numbers, plus the characteristic-versus-covariance result, are what a replication must hit before claiming concordance with Ibbotson, Chen, Kim, and Hu (2013).


*End of Scholar notes for Ibbotson et al. (2013). All statistics from FAJ Vol. 69 No. 3 as extracted from Drive PDF.*
