# The Shorting Premium and Asset Pricing Anomalies (Drechsler–Drechsler 2014) — Detailed Quantitative Research Notes

## Bibliographic Header
| Field | Detail |
|------|--------|
| Title | The Shorting Premium and Asset Pricing Anomalies |
| Authors | Itamar Drechsler (NYU Stern, NBER); Qingyi (Freda) Drechsler (WRDS) |
| Date | January 2014 working paper (SSRN 2387099) |
| Original PDF | `AbnormalReturns_Drechsler_2014.pdf` |
| Drive file_id | `0B-6kBz0I0dMsN25NbWtkMTdZMjA` |
| Short-fee data | Markit Security Finance (ex-DataExplorers); volume-weighted 30-day average lending fee; coverage >95% of CRSP equities, >85% of US borrow activity |
| Main sample | Jan 2004 – Oct 2012 (after 2002–03 coverage ramp); drop bottom 10% size and bottom 10% price each month (~15% of obs) |
| Long sample | Jan 1980 – Oct 2012 using SIRIO = short interest / institutional ownership as fee proxy |
| Anomalies (7) | B/M (value); momentum; idiosyncratic vol (Ang et al.); composite equity issuance (Daniel–Titman); financial distress (Campbell et al.); max return (Bali et al.); net share issuance (Loughran–Ritter) |
| Core claims | (1) Cheap-minus-expensive-to-short (CME) earns **1.45%/mo gross**, **0.92% net**, **1.55% FF4 α**. (2) Seven major anomalies **vanish** in the 80% of stocks with low short fees and are **amplified** in high-fee stocks. (3) FF4+CME largely prices anomalies in both buckets. |

## Problem / Motivation
Miller (1977): if shorting is prohibited, optimistic owners set the price and stocks can be overpriced. In US equities shorting is not prohibited—it is rented in the stock-loan market at a rebate/fee. Two channels link fees to expected returns: (i) the fee is a cash flow to long owners who lend; (ii) the fee embeds short *demand*, hence disagreement / constrained capital.

Prior fee studies (Geczy–Musto–Reed 2002; Ofek–Richardson–Whitelaw 2004; Cohen–Diether–Malloy 2007) used single-lender data with limited coverage. Markit aggregates >100 lenders, enabling a near-CRSP panel long enough (2004–2012) for expected-return tests.

The paper’s distinctive contribution is not only documenting a large **shorting premium**, but showing that **the cross-section of anomaly profits is almost entirely a high-short-fee phenomenon**, and proposing a risk-based account in which concentrated short sellers require compensation that **raises** (not lowers) prices of hard-to-short names.

## Data and Summary Statistics (Table 1)
Equal-weighted averages by calendar year:

| Year | #Stocks | Mktcap \$m | B/M | IOR% | SIR% | SIRIO% | Fee bps | TBV \$m |
|------|--------:|----------:|----:|-----:|-----:|-------:|--------:|-------:|
| 2004 | 4,023 | 3,991 | 0.58 | 59.2 | 4.4 | 8.0 | 29 | 31 |
| 2005 | 4,257 | 3,926 | 0.51 | 60.1 | 4.4 | 8.3 | 55 | 57 |
| 2006 | 4,247 | 4,123 | 0.52 | 62.2 | 5.2 | 9.0 | 64 | 89 |
| 2007 | 4,275 | 4,414 | 0.51 | 64.6 | 6.2 | 9.9 | 74 | 140 |
| 2008 | 4,131 | 3,839 | 0.59 | 65.0 | 7.3 | 11.3 | **126** | 131 |
| 2009 | 3,892 | 3,033 | 0.99 | 60.6 | 4.9 | 8.4 | 68 | 77 |
| 2010 | 3,708 | 3,817 | 0.84 | 60.1 | 5.0 | 9.4 | 70 | 85 |
| 2011 | 3,598 | 4,532 | 0.69 | 63.2 | 5.0 | 8.8 | 98 | 88 |
| 2012 | 3,421 | 4,810 | 0.77 | 63.1 | 5.1 | 9.1 | 99 | 93 |

Fee and SIRIO peak in 2008. Aggregate dollars on loan peak ~2007 (~\$587B/day implied). IOR stable ~60%. Filters exclude microcaps/penny names but results robust to cutoffs.

## Cross-Section by Short Fee (Table 2)
Monthly sorts into fee deciles; equal-weighted next-month returns.

**Fee levels:** Deciles 1–8 average fees **≤31 bps** annual — ~80% of names are cheap to short. Decile 9: **78 bps**. Decile 10: **582 bps**. Split 10b (top half of D10): **908 bps**.

**Gross returns:** Flat across D1–D8 (~0.7–0.9%/mo). D10: **−0.71%/mo**. CME (D1−D10): **+1.45%/mo** ($t=4.96$). 1−10b: **+2.13%** ($t=5.81$).

**Net of fees:** CME **0.92%** ($t=3.19$); 1−10b **1.27%** ($t=3.52$). Fees explain only a fraction of the premium — high-fee names underperform even for lenders who collect the fee.

**FF4 α:** CME **1.55%** ($t=7.03$); 1−10b **2.27%** ($t=7.81$). Conventional factors do not price CME; α > mean return.

**Economic mass:** D10 aggregate mktcap ~**\$415B**; D9+D10 ~**\$1.52T**. Not a microcap curiosity.

**Characteristics of expensive names:** higher mom, ivol, maxret, distress, issuance; SIRIO rises from ~6% (D1–D7) to 26.8% (D10) and 34.5% (10b). Avg mktcap D10 ~\$1.27B; 10b ~\$0.93B.

## Theory of the Shorting Premium
Standard short-constraint theory (infinite fee) predicts overpricing from exclusion of pessimists. Here fees are finite yet **net** returns on expensive names remain abysmal — not explained by “can’t short.”

**Proposed mechanism:** marginal sellers of high-fee names are **concentrated short sellers** (hedge funds; Ben-David–Franzoni–Moussawi cite Goldman est. that ~85% of equity shorts through their prime were HF as of Mar 2010). For them, covariance with the expensive-to-short portfolio is systematic risk. They do not short prices down to the representative agent’s valuation; prices stay high so that subsequent low returns compensate short-side risk. **Risk premium raises prices** — opposite the usual long-side logic — because risk sharing is incomplete and shorts are concentrated.

**CME as short-risk factor (Table 3):** Mean 1.45%, vol 3.00%/mo, Sharpe **1.67 gross / 1.06 net**, skew −0.52, kurt 2.05, AC1 0.27. Correlations: CME–MKT **−0.38**, CME–SMB **−0.49**, CME–HML **−0.31**, CME–UMD **+0.50**.

**Common variation:** FF4 residual variance of expensive portfolio 3.02% vs 1.71% cheap; average pairwise residual correlation **61%** vs **38%** — extra common factor among hard-to-short names.

## Unconditional Anomalies 2004–2012 (Table 4)
Long-short (decile 1 − decile 10) monthly:

| Anomaly | L-S ret | t | Net | FF4 α | t | FF4+CME α | t |
|---------|--------:|--:|----:|------:|--:|----------:|--:|
| B/M | 0.54 | 1.40 | 0.46 | 0.44 | 2.20 | **0.62** | 2.53 |
| Mom | 0.02 | 0.04 | −0.06 | 0.18 | 0.58 | 0.07 | 0.19 |
| Ivol | 0.88 | 1.69 | 0.67 | **1.23** | 4.47 | **0.10** | 0.36 |
| CEI | 0.63 | 2.17 | 0.54 | 0.79 | 3.50 | 0.17 | 0.68 |
| Distress | 0.66 | 1.08 | 0.49 | 0.96 | 3.71 | 0.47 | 1.56 |
| Maxret | 0.71 | 1.45 | 0.55 | 1.05 | 4.15 | 0.20 | 0.73 |
| NSI | 0.59 | 2.23 | 0.46 | 0.74 | 3.58 | 0.08 | 0.34 |

Net of fees reduces L-S by ~10–21 bps (largest for ivol) but leaves large residuals. FF4 α significant for 6/7. **FF4+CME kills α** for all but value (value α rises). Short-leg average fees 142–225 bps vs low double-digits on long legs (Panel B) — anomalies’ short legs are precisely the expensive-to-short names.

## Anomalies Conditional on Fees (Table 5) — Main Result
Buckets: **F0** = fee deciles 1–8 (80% of stocks); **F1–F3** = terciles of remaining 20% by fee (F3 = most expensive). Within F0 form anomaly decile L-S; within F1–F3 form tercile L-S.

### Panel A — Raw L-S returns (%/mo)
| Bucket | B/M | Mom | Ivol | CEI | Distress | Maxret | NSI |
|--------|----:|----:|-----:|----:|---------:|-------:|----:|
| F0 | 0.12 | −0.25 | **−0.04** | 0.25 | 0.01 | 0.03 | 0.16 |
| F1 | 0.24 | 0.21 | 0.70 | 0.30 | 0.25 | 0.51 | −0.19 |
| F2 | 0.69 | −0.14 | 0.79 | 0.48 | 0.81 | 0.79 | 0.53 |
| F3 | 0.96 | 0.84 | **1.85** | 1.18 | 1.18 | 1.45 | 0.87 |
| F3−F0 | 0.84* | 1.09 | **1.89*** | 0.93* | 1.16* | **1.42*** | 0.71* |

In F0 (80% of names, even larger share of mktcap): **no anomaly is significant**; ivol is −4 bps vs unconditional +88 bps. In F3: ivol **1.85%** ($t=3.77$); all others large; even mom (unconditionally dead) is +84 bps.

### Panel B — FF4 α
Same pattern: F0 alphas small (only CEI significant at 0.38, $t=2.07$); F3 alphas **0.81–1.99%** with strong t-stats except mom ($t=1.48$). F3−F0 α spreads large and significant.

### Panel C — FF4 + CME α
| Bucket | B/M | Mom | Ivol | CEI | Distress | Maxret | NSI |
|--------|----:|----:|-----:|----:|---------:|-------:|----:|
| F0 | 0.18 | −0.01 | −0.27 | 0.04 | 0.13 | 0.08 | 0.00 |
| F3 | **1.44*** | 0.82 | **0.38** | 0.79 | −0.05 | 0.24 | 0.31 |
| F3−F0 | 1.26** | 0.83 | 0.65 | 0.75 | −0.18 | 0.17 | 0.31 |

Adding CME collapses high-fee anomaly alphas: ivol F3 α from **1.99** ($t=4.31$) to **0.38** ($t=0.78$). Six of seven anomalies are insignificant across all fee buckets under FF4+CME. **Exception: high-fee value**, whose α increases. F3−F0 α differences become insignificant except value.

**Joint interpretation:** (i) frictions tied to high short fees are necessary for large anomaly profits; (ii) CME exposure prices those profits as short-side risk compensation.

## Long Sample via SIRIO (1980–2012)
SIRIO = SIR / IOR proxies fee. Table 6: CME(SIRIO) mean **1.48%** ($t=5.85$), FF4 α **1.54%** ($t=8.83$); 1−10b **1.88%** / α **1.96%**. Table 7: vol 4.99%/mo, corr with MKT −0.55, SMB −0.55, HML +0.47, UMD +0.19.

Table 8 unconditional L-S (1980–2012): all seven anomalies significant raw; FF4 α large except mom; FF4+CME shrinks most (value α → 0.05; ivol 1.34 → 0.19; distress 1.40 → 0.26) though CEI, maxret, NSI retain some significance.

Table 9 conditional on SIRIO: F0 anomalies **are** significant in the long sample (unlike fee sample)—proxy noise—but F3 still much larger (ivol F3 **2.24%**, $t=7.38$). FF4+CME again compresses F3 alphas and F3−F0 spreads (except ivol/maxret retain some CME-adjusted edge).

## Relation to Literature
Builds on Jones–Lamont; Ofek–Richardson–Whitelaw; Cohen–Diether–Malloy; Boehmer–Jones–Zhang; Diether–Malloy–Scherbina; Chen–Hong–Stein breadth; Nagel IO; Hanson–Sunderam short interest. Distinct from Stambaugh–Yu–Yuan sentiment/short-leg papers and Avramov et al. credit-risk concentration by using **direct fees**, documenting the **shorting premium itself**, and testing an explicit **CME factor model**. Compatible with Geczy–Musto–Reed / Battalio–Schultz / Ljungqvist–Qian skepticism about fees *alone* blocking arb — because the paper’s premium is mostly **risk**, not fee drag.

## Limitations
- Fee sample is short (2004–12) and crisis-heavy; long-sample SIRIO is noisy.
- Equal-weighted portfolios; value-weight may attenuate (though mktcap of high-fee names is still large).
- CME is constructed from the same fee sorts that define buckets — some mechanical linkage, though anomaly sorts are separate characteristics.
- Value anomaly’s failure under CME is unresolved.
- Does not identify *why* concentrated shorts don’t attract more capital (balance-sheet, prime-broker limits, mandate constraints).

## Practical Takeaways for a Quant Investor
1. **Screen anomaly shorts for borrow cost and SIRIO.** If the short leg is not in the top fee/SIRIO quintile, expected L-S is near zero (fee sample) or much smaller (SIRIO sample).
2. **Budget stock-loan spend explicitly.** Net CME is still ~11% annualized — paying fees does not erase the premium.
3. **Add a short-risk factor (CME or SIRIO-CME) to anomaly attribution.** Large chunks of ivol, maxret, distress, issuance α are CME loadings, not “pure” mispricing.
4. **Capacity:** \$0.4–1.5T high-fee complex means the phenomenon is tradeable but crowded; HF dominance of short stock implies crowded-short crash risk (CME–MKT corr −0.38).
5. **Low-fee universe (~80% of names):** do not expect textbook anomaly spreads; alpha research should condition on lendable supply.
6. **Risk management:** residual corr 61% among expensive names ⇒ short books in hard-to-borrow names have a hidden common factor beyond FF4.

## Quantitative Bottom Line
CME earns **1.45%/mo gross**, **0.92% net**, **1.55% FF4 α** (2004–12). Seven flagship anomalies are absent in low-fee stocks and extreme in high-fee stocks (ivol F3 1.85% vs F0 −0.04%). FF4+CME prices six of seven. SIRIO extension 1980–2012 replicates CME ~1.48%/mo. **Anomaly profits and the shorting premium are the same phenomenon viewed from two angles: compensation for concentrated short risk.**


## Detailed Walkthrough of Net Return Construction
For each stock-month, net return = gross CRSP return + (30-day VW average short fee converted to monthly). For a long-short portfolio, net L-S = (gross long − gross short) − (fee on short − fee earned on long if lent). Empirically the short leg’s fee dominates, so net L-S < gross L-S by 10–21 bps/mo across anomalies (Table 4). The striking fact is that even after this correction, CME remains 0.92%/mo — lenders who both own and lend D10 still underperform D1 by ~11% annualized. That cannot be “fee as cash flow”; it requires a risk or preference story for why owners hold unlent or why shorts demand excess compensation.

## Implementation Notes for a Stock-Loan–Aware Book
- **Signal:** end-of-month Markit 30-day VW fee (or SIRIO if Markit unavailable).
- **CME portfolio:** long D1 fee, short D10 fee; equal-weight; monthly rebalance; apply size/price filters.
- **Anomaly overlay:** compute characteristic L-S only inside fee/SIRIO buckets; size positions by bucket liquidity and locate borrow early for F3 shorts.
- **Risk model:** add CME as a fifth factor alongside MKT/SMB/HML/UMD; monitor β_CME of every anomaly sleeve.
- **Capacity / crowding:** track aggregate TBV and fee dispersion; rising equal-weighted fee (Table 1) signals crowded hard-to-borrow complex.
- **Crisis behavior:** 2008 fees spiked to 126 bps EW; SIRIO to 11.3% — expect CME volatility and short-squeeze risk to spike with funding stress (consistent with negative CME–MKT correlation).

## Equations Summary
Predictive content of fees:
$$
\mathbb{E}_t[R_{i,t+1}] = a + b\cdot \mathrm{Fee}_{i,t} + \varepsilon_{i,t+1},\quad b<0.
$$
CME factor:
$$
\mathrm{CME}_{t+1}=R^{\text{cheap}}_{t+1}-R^{\text{expensive}}_{t+1}.
$$
Pricing model:
$$
\mathbb{E}[R_i]-R_f=\beta_{i,MKT}\lambda_{MKT}+\beta_{i,SMB}\lambda_{SMB}+\beta_{i,HML}\lambda_{HML}+\beta_{i,UMD}\lambda_{UMD}+\beta_{i,CME}\lambda_{CME}.
$$
Empirically $\lambda_{CME}$ is large and absorbs anomaly α when $\beta_{i,CME}$ is high (short legs).

SIRIO proxy:
$$
\mathrm{SIRIO}_{i,t}=\frac{\mathrm{ShortInterest}_{i,t}}{\mathrm{InstitutionalOwnership}_{i,t}}.
$$

## Extended Discussion: Why Value Survives CME
Value’s FF4+CME α in F3 is 1.44% ($t=3.12$), larger than under FF4 alone. Possible reasons: (i) value’s short leg (growth/glamour) overlaps only partially with high-fee names; (ii) HML already correlates −0.31 with CME, so double-counting adjustments behave differently; (iii) value may embed cash-flow / duration risks orthogonal to shorting risk. Practical implication: do **not** dismiss value as “just short-risk” in the way one can for ivol/maxret/issuance.

## Statistical Power Caveats
Fee sample $N=106$ months. CME $t=4.96$ on raw mean is strong; anomaly F3 t-stats rely on large point estimates. Multiple anomalies tested — the coherent pattern across seven characteristics and the CME pricing result reduce data-mining concern, but out-of-sample post-2012 fee data (not in paper) should be checked before production use.

## Closing Synthesis for Paleologo-Style Practice
Treat stock-loan marks as first-class citizens in the signal library. The shorting premium is larger than HML or SMB in this sample and interacts so violently with standard anomalies that any backtest ignoring borrow cost and lendable supply is describing a market that portfolio managers cannot actually trade. FF4+CME should be on the attribution dashboard next to the usual four factors. The theoretical punchline — risk premia that *raise* prices when risk is concentrated on the short side — belongs in every risk-model discussion alongside the usual long-side premia.



## Full Empirical Protocol (Replication Grade)

### Sample construction
1. Start with Markit Security Finance daily loan observations matched to CRSP via CUSIP/SEDOL.
2. Restrict to common stocks with non-missing CRSP returns; begin analysis January 2004 when coverage becomes near-universal and daily.
3. Each month-end, compute the trailing 30-day volume-weighted average lending fee (Markit’s reported VW average).
4. Drop stocks below the 10th percentile of NYSE/CRSP market equity or below the 10th percentile of share price that month (~15% of stock-months). Do **not** use a fixed \$5 price screen — 2008–09 would otherwise drop large financials (e.g. Citigroup) mechanically.
5. Merge Compustat book equity for B/M; compute momentum as prior 12-month return (skip recent month if following JT convention — paper uses prior twelve months as stated); ivol as residual volatility from FF-style regression; CEI per Daniel–Titman; distress per Campbell–Hilscher–Szilagyi; maxret as maximum daily return in prior month (Bali–Cakici–Whitelaw); NSI as net share issuance.

### Portfolio sorts
- **Univariate fee deciles:** sort on month-t fee; hold equal-weighted portfolios through month t+1; rebalance monthly.
- **CME:** long decile 1, short decile 10 (and separately 1−10b where 10b is the upper half of decile 10 by fee).
- **Net returns:** add monthly fee income to each stock’s return (fee/12 approximately, using the 30-day VW fee as the rate).
- **Fee buckets for interactions:** F0 = deciles 1–8; sort remaining 20% into terciles F1, F2, F3. Within F0, anomaly decile L-S; within F1–F3, anomaly tercile L-S (to keep enough names per bin).
- **SIRIO long sample:** replace fee with short interest / 13F institutional ownership; sample Jan 1980–Oct 2012; same filters and bucket logic.

### Factor regressions
$$
R_{p,t}-R_{f,t}= \alpha + \beta_{MKT}MKT_t+\beta_{SMB}SMB_t+\beta_{HML}HML_t+\beta_{UMD}UMD_t+\beta_{CME}CME_t+\varepsilon_t.
$$
Report α and Newey–West or OLS t-stats as in the paper (paper’s t-stats on CME mean use conventional SE; α t-stats are from time-series regressions). When CME is the test portfolio, omit β_CME.

### Characteristic diagnostics
At formation, record equal-weighted averages of mktcap, B/M, mom, ivol, CEI, distress, maxret, NSI, SIRIO, and fee within each fee decile (Table 2). Confirm monotonicity of anomaly-hostile characteristics toward D10.

### Numbers to match (acceptance tests)
- D10 mean fee ≈ 582 bps; 10b ≈ 908 bps.
- CME gross 1.45% (t≈4.96), net 0.92% (t≈3.19), FF4 α 1.55% (t≈7.03).
- Ivol unconditional L-S ≈ 0.88%; F0 ≈ −0.04%; F3 ≈ 1.85%.
- Ivol F3 FF4 α ≈ 1.99% → FF4+CME α ≈ 0.38%.
- SIRIO CME ≈ 1.48%, FF4 α ≈ 1.54%.

If a replication misses these by more than ~20% relative, check: (i) fee definition (30-day VW vs last-day), (ii) equal vs value weight, (iii) microcap filter, (iv) whether financials/utilities are excluded (paper does not specially exclude them beyond size/price).

## Economic Magnitudes Annualized
| Strategy | Monthly | Annualized (×12) | Sharpe (approx) |
|----------|--------:|-----------------:|----------------:|
| CME gross | 1.45% | 17.4% | 1.67 |
| CME net | 0.92% | 11.0% | 1.06 |
| CME FF4 α | 1.55% | 18.6% | — |
| 1−10b gross | 2.13% | 25.6% | — |
| Ivol F3 L-S | 1.85% | 22.2% | — |
| Ivol F0 L-S | −0.04% | −0.5% | — |

These are equal-weighted, post-filter. Value-weighted CME is not the paper’s headline but economically important for capacity estimates; the \$415B D10 mass suggests tens of billions of potential short notional before self-impact, subject to locate availability.

## Interaction with Sentiment and Crowding
Stambaugh–Yu–Yuan (2012) find anomaly short legs stronger after high sentiment. Drechsler–Drechsler’s mechanism is complementary: high-fee names *are* the short legs, and CME risk is the priced factor. A synthesis: sentiment shocks increase short demand → fees rise → concentrated shorts demand more premium → CME realizes positively when shorts are repaid. Negative CME–MKT correlation (−0.38) means crowded-short unwind risk materializes in up markets — classic short-squeeze beta.

## What This Changes in a Production Alpha System
1. **Feature store:** ingest daily Markit fees and 13F-based SIRIO; lag appropriately for point-in-time.
2. **Research template:** every new anomaly candidate must be tested inside F0 vs F3; publish both.
3. **Transaction cost model:** stock-loan fees enter the net alpha identity on day one, not as an afterthought.
4. **Risk:** CME factor in the daily risk model; limit aggregate β_CME of the book.
5. **Capacity:** scale F3 shorts by lendable quantity (IOR × shares) not just ADV.
6. **Reporting:** split PnL into “low-fee anomaly” vs “short-premium” buckets for IC / investor letters.

## Open Questions Post-2014
- Does CME survive 2013–2025 including the 2021 meme-stock squeezes?
- Is CME priced in bonds, options, or international equities?
- Can one build a tradable CME future/swap from security-lend indices?
- Interaction with options-implied borrow (synthetic vs actual).
- Machine-learning anomaly zoos: do they also collapse in F0?

## Scholar Cross-Links
Pairs naturally with: Asquith–Pathak–Ritter / Nagel (IO); Cohen–Diether–Malloy (loan demand); Hanson–Sunderam; Stambaugh–Yu–Yuan; Avramov et al.; and the Haugen–Heins low-risk evidence (expensive-to-short names are high-ivol/high-beta).


## Extended Factor and Anomaly Atlas

### CME factor moments to remember
Mean 1.45% monthly, vol 3.00%, Sharpe 1.67 gross. AC1 0.27 (high but comparable to other factors in 2004–12). Negative market beta (−0.38) = shorts hurt in rallies. Positive UMD corr (0.50) = expensive-to-short names often look like losers on momentum dimensions too (bimodal mom in fee sorts).

### Anomaly-by-anomaly fee profile (Table 4 Panel B)
Short-leg average fees: ivol 225 bps, distress 209, maxret 185, mom 173, nsi 164, B/M 149, CEI 142. Long legs often 27–81 bps. The ordering matches which anomalies CME prices best (ivol, maxret, issuance) vs value (survives).

### F0 vs F3 in words
F0 is eighty percent of the stock universe and more of market cap. Finding *zero* significant anomaly returns there in 2004–12 is a major negative result for anyone running anomaly books in large-cap liquid names without a hard-to-borrow overlay. F3 is where the textbook backtests earn their t-stats — and where locate fail rates and fee drag live.

### SIRIO construction pitfalls
Institutional ownership from 13F is quarterly and lagged; short interest is bi-monthly/monthly depending on era. Align carefully. SIRIO is a noisy fee proxy — F0 anomalies remain significant in 1980–2012 even though they vanish with true fees in 2004–12. Prefer Markit when available.

### Risk-management implications
A market-neutral anomaly book that is secretly short a CME-like factor will show FF4 alpha that disappears when CME is added. Before declaring “pure alpha,” regress the book on CME. If β_CME ≈ 1 and α vanishes, you are harvesting the shorting premium, not a new anomaly — which is fine if intentional and sized for short-squeeze risk.

### Numerical anchors (repeat)
CME 1.45/0.92/1.55; 1−10b 2.13/1.27/2.27; ivol F0 −0.04 vs F3 1.85; ivol F3 FF4 α 1.99 → FF4+CME α 0.38; SIRIO CME 1.48 / α 1.54.

### Synthesis
Short fees are not a microstructure footnote. They define where cross-sectional predictability lives and supply a priced factor that rationalizes most of that predictability as short-side risk compensation.

Markit’s multi-lender coverage is the empirical breakthrough relative to single-prime studies. With over ninety-five percent of CRSP names and over eighty-five percent of US borrow activity represented, fee sorts become trustworthy cross-sectional signals rather than selected-lender artifacts. Beginning in 2004 avoids the early sample’s large-cap bias and monthly frequency.

In practical terms, paragraph 1 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

The fee distribution is extremely skewed: eighty percent of names cost less than about thirty-one basis points per year to borrow, while decile ten averages 582 basis points and the top half of decile ten averages 908. That skewness is why equal-weighted anomaly backtests can look fabulous while value-weighted implementable books in liquid names look mediocre — the profits sit in the expensive tail.

In practical terms, paragraph 2 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Net-of-fee CME at 0.92 percent per month is the paper’s most underappreciated number. It says that an investor who owns expensive-to-short names and lends them out still underperforms cheap-to-short names by roughly eleven percent annualized. Cash-flow-from-lending cannot explain the shorting premium; a risk or preference story is required.

In practical terms, paragraph 3 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

The concentrated-short theory flips the usual risk-premium sign. When marginal price-setters are net short and undiversified in that short, they demand expected returns that keep prices high. Incomplete risk sharing, not infinite shorting fees, is the friction. Goldman’s estimate that hedge funds accounted for about eighty-five percent of equity shorts through their prime (circa 2010) supports the concentration premise.

In practical terms, paragraph 4 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Table 5’s F0 versus F3 contrast should change how anomaly research is written. Reporting only unconditional L-S returns conceals that the entire effect may live in the top fee quintile. Mandating F0/F3 splits in internal research memos would eliminate a large class of non-implementable “anomalies.”

In practical terms, paragraph 5 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

CME’s factor correlations — negative with MKT and SMB, positive with UMD — imply that a short-anomaly book is a crowded, high-beta-to-squeeze position. Risk systems that omit CME will attribute short-premium harvest to “alpha” until the first sustained rally in hard-to-borrow names.

In practical terms, paragraph 6 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

SIRIO extends the sample to 1980 at the cost of noise. The qualitative CME result survives (1.48 percent mean, 1.54 percent FF4 alpha), but F0 anomalies no longer vanish — a reminder that proxy error can resurrect spurious predictability in the “cheap” bucket. Prefer hard fees when both exist.

In practical terms, paragraph 7 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Value’s refusal to be priced by CME is a genuine puzzle inside the paper. High-fee value’s FF4+CME alpha is 1.44 percent with a t-statistic of 3.12. Desks should not shrink value as aggressively as ivol or maxret when residualizing against CME.

In practical terms, paragraph 8 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Annualized, equal-weighted CME is about 17 percent gross and 11 percent net with a Sharpe near 1.7/1.1. Those magnitudes rival or exceed classical factor premia in this sample. Ignoring stock-loan marks in a 2004–2012 anomaly study is therefore not a small omission.

In practical terms, paragraph 9 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Production checklist: ingest Markit 30-day VW fees point-in-time; build CME; split every anomaly by fee bucket; put CME in the risk model; size F3 shorts by lendable quantity; report net-of-fee performance. That is the operational content of Drechsler–Drechsler (2014).

In practical terms, paragraph 10 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.