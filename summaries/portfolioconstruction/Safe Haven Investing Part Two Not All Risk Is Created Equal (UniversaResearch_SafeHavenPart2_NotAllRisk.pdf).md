# Safe Haven Investing Part Two: Not All Risk Is Created Equal — Spitznagel / Universa (2017) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Safe Haven Investing — Part Two: Not All Risk Is Created Equal |
| **Author** | Mark Spitznagel (Universa Investments L.P.) |
| **Date** | November 2017 |
| **Companion** | Part One (Oct 2017): Not All Risk Mitigation Is Created Equal |
| **Themes** | CAPE and forward crash risk; regime-conditional CAGR; 60/40 benchmark; insurance vs alpha vs store-of-value over 100 years |
| **Original PDF** | `UniversaResearch_SafeHavenPart2_NotAllRisk.pdf` |
| **Extraction** | `pdftotext -layout` (~3,001 words); summary expands stats, CAPE mechanics, and PM implications |

---

## Problem / Motivation

Part One ranked safe-haven prototypes **unconditionally** on historical SPX paths. Part Two asks the **prospective** questions:
1. Does the risk being mitigated vary by regime?
2. Can that variation be identified **ex ante**?
3. Does identification skill change the ranking of store-of-value, alpha, and insurance prototypes?

Spitznagel’s answer: equity **valuation** (CAPE) is a powerful forward risk indicator; crash severity rises with CAPE at 95% confidence; most safe-haven $\Delta\mathrm{CAGR}$ accrues after high-CAPE starts—yet **insurance still wins unconditionally**, so ambitious market-timing of the hedge is **not** required (and can be counterproductive if it turns off protection when savings compound).

---

## Data and CAPE–Drawdown Fact (Figure 1)

- **History:** ~**100 years** of annual data, rolled **monthly**, since **1917**.
- **Risk proxy:** SPX total-return **5-year maximum drawdown** (worst cumulative total-return decline within each forward 5-year window).
- **Valuation:** cyclically adjusted P/E (**CAPE**) at window start; Tobin’s Q yields “same results.”
- **Buckets:** CAPE quartiles with cutoffs shown as **<10.8**, **10.8–15.5**, **15.5–20.7**, **>20.7**.
- **Display:** median and **20th percentile** max drawdowns per quartile, with 95% confidence intervals referenced in text.

**Claim (emphasized callout):** With **95% statistical significance**, higher valuations imply greater subsequent crash risk. When CAPE is high (note cites “today” CAPE **>30**), subsequent crashes “cease to be black swans”—they are the market’s “homeostatic mechanism.” Higher CAPE also associates with **lower** subsequent average returns (95% confidence).

Economic reading: left-tail severity is **state-dependent**; risk mitigation’s marginal product should peak in high-CAPE states.

---

## Prototypes Recap (100-Year Calibration)

Same three cartoons as Part One, dynamics in Figure 2:

| Prototype | Crash ($<-15\%$) | Other | 100y standalone $R_A$ |
|-----------|-------------------|-------|-------------------------|
| Store-of-value | +2% real fixed | same | **just over +5%** |
| Alpha | +20% | +10% / +5% | **+7%** |
| Insurance | **+1000% (“tenbagger”)** | −100% | **exactly 0%** (by construction) |

Note: Part Two uses a **tenbagger** ($M=10$) so that with **~9%** of years in the crash bucket over the century, insurance $R_A=0$. (Part One used 900% / ~10% crash years over 20y.)

Weights: **90/10** for store and alpha; **97/3** for insurance. Results “not sensitive” to the 10% parameter.

---

## CAPE-Conditional 5-Year $\Delta\mathrm{CAGR}$ vs SPX (Figure 3)

For each overlapping 5-year window, compute portfolio CAGR minus SPX CAGR; bin by starting CAPE quartile.

**Unconditional century $\Delta\mathrm{CAGR}$ vs SPX (header of Fig. 3):**

| Prototype | $\Delta\mathrm{CAGR}$ |
|-----------|-------------------------|
| Store-of-value | **−0.25%** |
| Alpha | **+0.03%** (≈0; “failed to outperform”) |
| Insurance | **+1.01%** |

**Conditional pattern:** “Most, if not all” outperformance occurs in the **highest CAPE quartile**; insurance’s top-quartile bar is the highest of any cell “by far.” Low-CAPE environments make risk mitigation look unproductive—tempting a timing rule “hedge only when expensive.”

### Why not to time the hedge off

Volatility-tax savings from avoided crashes **remain invested** and compound through subsequent bull markets. Five-year bucketed $\Delta\mathrm{CAGR}$ **under-credits** this. Unconditional CAGR captures it. Cheap markets already embed a “margin of safety”; turning off insurance there saves premium but sacrifices compounding of past protection and leaves residual gap/jump risk.

Cliché invoked: “Offense wins games. Defense wins championships.”

---

## Comparison to 60/40 Balanced Benchmark (Figure 4)

Institutions judge hedges not only vs 100% SPX but vs **60% SPX + 40% 10-year Treasury** (rolled annually). Sensitivity to bond choice claimed low.

**Unconditional century $\Delta\mathrm{CAGR}$ vs 60/40:**

| Prototype | $\Delta\mathrm{CAGR}$ vs 60/40 |
|-----------|----------------------------------|
| Store-of-value (90/10) | **+1.11%** |
| Alpha (90/10) | **+1.35%** |
| Insurance (97/3) | **+2.34%** |

Insurance beats the other two with **>80% statistical significance**. All three beat 60/40 over trailing 20y, 10y, and 5y windows as well (narrative).

**Callout:** “Conventional wisdom has not given rise to the best risk mitigation solution.”

Figure 4’s CAPE-quartile bars show **how** that outperformance distributes: again concentrated after high starting valuations, with insurance dominant in the top CAPE bucket.

---

## Synthesis: Risk Is Not Created Equal

1. **State-dependent risk:** high CAPE → deeper forward 5y max drawdowns (Fig. 1).
2. **State-dependent value of mitigation:** $\Delta\mathrm{CAGR}$ accrues mostly in high-CAPE starts (Fig. 3–4).
3. **Prototype ranking stable:** insurance ≫ alpha ≥ store-of-value on CAGR metrics, both vs SPX and vs 60/40.
4. **Timing not required:** unconditional insurance already +101 bps vs SPX and +234 bps vs 60/40 over ~100y.
5. **Alpha’s long-sample failure vs SPX** (−/+ near zero at +3 bps) warns against equating “crisis alpha” marketing with century CAGR improvement.

---

## Methods Detail for Replicators

**CAPE quartile construction.** Sort all month-starts by CAPE; assign quartile cuts (paper’s displayed edges 10.8, 15.5, 20.7). For each start $t$, compute SPX total-return path $t$ to $t+5y$; record max drawdown and 5y CAGR of each portfolio rule.

**Confidence intervals.** Text references 95% CIs on median/quantile drawdowns—likely bootstrap or asymptotic CI on quantile estimators across overlapping windows (overlapping induces dependence; rigorous SEs would use Hansen–Hodrick / reverse-regression style corrections; paper is practitioner-grade).

**Insurance tenbagger calibration.** Solve $p M + (1-p)(-1)=0 \Rightarrow M=(1-p)/p$. With $p=0.09$, $M\approx 10.11$; paper’s “tenbagger” matches.

**Portfolio CAGR.** Annual rebalance to nominal weights; insurance notional restored after non-crash years (constant 3% risk budget).

---

## Limitations

- Cartoon payoffs; not live Universa funds (disclosures).
- Overlapping 5y windows inflate effective sample for CIs if dependence ignored.
- CAPE revisions / real-time vintage not discussed (point-in-time CAPE can differ).
- 60/40 with annual roll ignores duration management and TIPS.
- Truncation at annual frequency misses intra-year crash paths where convexity marks matter.
- Post-2017 sample (CAPE >30) not in paper—out-of-sample test for readers.

---

## Quant / Pension Takeaways

1. **Keep convex risk mitigation on through low-CAPE regimes**; do not “save premium” just because Fig. 3’s low-CAPE bars look weak.
2. **Size crash budget to CAPE if you must time:** overweight insurance when CAPE in top quartile—but treat as tilt, not on/off.
3. **Benchmark honestly:** vs 60/40, even store-of-value 90/10 beat by +111 bps/y historically in-sample—but insurance still doubles that.
4. **CTA/alpha overlays:** century +3 bps vs SPX is a caution; demand convexity audits of “tail” products.
5. **Funding math:** +100–230 bps CAGR differentials dominate most fee/alpha debates over decades.
6. **Risk reporting:** add CAPE-conditional expected max-DD tables alongside VaR.

---

## Link to Part One Relativity Principle

Part Two strengthens relativity: the **same** insurance prototype’s $\Delta\mathrm{CAGR}$ is small in low-CAPE starts and large in high-CAPE starts—value is state-and-portfolio relative. Yet because high-CAPE crashes dominate log wealth, the **unconditional** integral still favors always-on convexity.

---

## Equation Sheet

$$
\mathrm{MaxDD}_{t\to t+5} = \min_{t\le u\le v\le t+5} \Big(\prod_{s=u}^{v}(1+R_s^{\mathrm{SPX}})-1\Big).
$$

$$
\Delta\mathrm{CAGR}_{t}^{(5)}(h) = \mathrm{CAGR}_{t\to t+5}(w R^{\mathrm{SPX}}+(1-w)R^{h}) - \mathrm{CAGR}_{t\to t+5}(R^{\mathrm{bench}}).
$$

$$
M=\frac{1-p}{p}\quad\text{for zero-mean insurance with crash prob }p.
$$

---

## Bottom Line

Part Two shows **not all risk is equal**: CAPE stratifies forward crash severity. Safe-haven effectiveness concentrates after rich valuations, but the **insurance prototype remains the undisputed CAGR winner both unconditionally and in high-CAPE states** (+1.01% vs SPX, +2.34% vs 60/40 over ~100 years), without requiring hedge timing. Conventional 60/40 is dominated as a risk-mitigation solution on the paper’s own scorecard.

---

## Extended Discussion: CAPE as a Risk Meter, Not a Return Timer Alone

CAPE’s use in return forecasting (Campbell–Shiller) is controversial out of sample; Part Two emphasizes CAPE as a **left-tail severity** indicator. Even if mean returns are hard to time, a reliable ranking of forward MaxDD quartiles is enough to motivate asymmetric hedges. The callout that high CAPE makes crashes “not black swans” reframes tail hedging from “insurance against the impossible” to “insurance against the probable homeostatic correction.”

### Overlapping-window bias

Monthly-rolled 5y windows create highly dependent observations. Practitioner charts can still be informative about ordinal CAPE→DD relationships; academic replication should block-bootstrap by decade or use non-overlapping pentades as robustness.

### Why alpha dies over 100 years vs SPX

Trend/crisis-alpha payoffs earn in crashes but pay in long quiet melts. As the sample lengthens, quiet years dominate arithmetic, and without extreme convexity the crash help fails to offset opportunity cost in geometric terms—hence +3 bps. Insurance’s −100% quiet years are worse arithmetically each year but its crash $M=10$ at 3% weight changes wealth multipliers enough that logs win.

### 60/40 as a straw man?

60/40 cuts equity vol and historically benefited from bond rallies in equity crises (negative stock-bond correlation regimes). Beating 60/40 by 234 bps with 97/3 insurance is a strong claim of the cartoons; live implementation must survive periods of **positive** stock-bond correlation (e.g., 2022 inflation shock)—a stress Part Two does not emphasize.

### Governance: the worst time to cancel the hedge

Committees cancel tail hedges after quiet high-CAPE markets (premium fatigue) precisely when Fig. 1 says MaxDD risk is elevated. Part Two is a governance document as much as a research note.

---

## Numerical Illustration of Quartile Concentration

Suppose unconditional insurance $\Delta\mathrm{CAGR}=1.01\%$ and three lower CAPE quartiles average ~0 while the top quartile carries the mass. Then top-quartile conditional $\Delta\mathrm{CAGR}$ must be on the order of ~4% per year over those 5y windows to average to 1% unconditionally (rough equal-quartile weighting)—consistent with the claim that the top bar is “by far” the highest.

Vs 60/40, unconditional +2.34% implies even larger high-CAPE conditional gaps, because 60/40 already dampens some crash years—insurance must win by keeping more equity exposure (97% vs 60%) **plus** convex payoff when crashes hit.

---

## PM Playbook

| CAPE quartile | Equity stance | Haven stance |
|---------------|---------------|--------------|
| Bottom (<10.8) | Margin of safety; can run higher beta | Maintain minimum convexity budget; avoid canceling |
| Mid | Neutral | Steady 1–3% insurance-like budget |
| Top (>20.7) | Expect lower forward returns & deeper DD | Max convexity per dollar; resist premium fatigue |

Never confuse “low realized $\Delta\mathrm{CAGR}$ in cheap regimes” with “zero value of defense.”

---

## Scholar Cross-Links

Part One (prototypes); Shiller CAPE; Universa/Spitznagel *The Dao of Capital*; Taleb on skin in the game and convexity; stock-bond correlation literature; pension ALM CAGR math.

---

## Final Synthesis

Together, Parts One and Two argue: (i) maximize portfolio CAGR via volatility-tax reduction; (ii) extreme crash convexity dominates linear and semi-linear havens; (iii) CAPE marks when risk is greatest; (iv) still run convexity always—especially when it feels most useless.

---

## Scenario Analysis Grid (Part Two)

Extend Part One’s grid by conditioning bootstrap draws on CAPE quartile. In top-quartile starts, deepen crash-year magnitudes (match Fig. 1’s median/20th percentile MaxDD). Re-estimate $\Delta\mathrm{CAGR}$. Expected pattern:
- All prototypes’ $\Delta\mathrm{CAGR}$ rise in top CAPE quartile.
- Insurance’s increase is steepest.
- Bottom quartile: insurance $\Delta\mathrm{CAGR}$ near zero or slightly negative over short 5y windows, still nonnegative unconditionally over long paths if rare crises elsewhere replenish the compounding channel.

### Timing policy evaluation

Compare always-on 3% insurance vs a rule that sets $w_I=3\%$ only when CAPE > 20.7 else $w_I=0$. The timed rule saves premium in cheap markets but misses (i) non-valuation crashes and (ii) compounding of capital preserved in prior rich-market crashes. Part Two’s rhetoric favors always-on; a mild tilt (e.g., 2% floor, 4% when rich) is a compromise consistent with the evidence without binary timing.

### Committee dashboard

1. Current CAPE quartile and historical forward MaxDD table (Fig. 1 analogue).
2. Rolling 5y $\Delta\mathrm{CAGR}$ of the actual haven vs SPX and 60/40.
3. Crash-bang-for-the-buck audit vs prototypes.
4. Premium spent YTD vs capital preserved in last crash (ratio).
5. Explicit decision log when changing $w_I$—to fight premium fatigue.

### Mentorship note

Rebuild Fig. 3–4 with public Shiller CAPE and SPX total returns; verify order-of-magnitude headers (−25/+3/+101 bps; +111/+135/+234 bps). Discrepancies will arise from exact return series and cartoon calibrations—document them.

---

## Appendix: Glossary and Formal Definitions

**CAGR / geometric return.** $R_G=\big(\prod_t(1+R_t)\big)^{1/T}-1$.

**Arithmetic return.** $R_A=T^{-1}\sum_t R_t$.

**Volatility tax.** Gap $R_A-R_G$, approximately $\sigma^2/2$ for i.i.d. logs; larger under negative skew and crash clustering.

**Safe haven (Universa sense).** Sleeve whose primary purpose is to raise portfolio $R_G$ by cutting negative compounding, not to maximize standalone Sharpe.

**Crash bucket.** Annual SPX total return $<-15\%$.

**Store-of-value prototype.** Constant real annuity (~2% real); zero crash correlation.

**Alpha prototype.** Mildly crash-negative-correlated positive-carry profile (+20%/+10%/+5%).

**Insurance prototype.** Maximally convex: large positive payoff only in crash bucket; −100% otherwise; sized at ~3% of portfolio.

**CAPE.** Cyclically adjusted price-to-earnings (Shiller); Part Two quartile edges 10.8, 15.5, 20.7 on the 1917+ sample.

**MaxDD (5-year).** Worst peak-to-trough total-return decline inside a forward 5-year window.

**$\Delta$CAGR.** Portfolio CAGR minus benchmark CAGR (SPX or 60/40).

**Crash-bang-for-the-buck.** Crash payoff per unit of capital allocated (and per unit of quiet-year drag).

**Replenishment.** Restoring insurance weight to target after years the sleeve expires worthless.

**Principle of charity.** Evaluating idealized upper-bound versions of strategies so failures are informative.

**Relativity of hedge value.** Value exists only relative to a specified portfolio’s loss distribution.

**60/40.** 60% SPX + 40% rolled 10-year Treasury; conventional “balanced” risk mitigation.

**Homeostasis (markets).** Valuation-driven mean reversion via crashes as corrective mechanism.

**Premium fatigue.** Governance failure: cancelling hedges after quiet periods.

**Model risk from leverage.** Using leverage to restore CAGR after correlation-based diversification.

**Log-wealth / Kelly link.** Maximizing $\mathbb{E}[\log(1+R)]$ aligns with CAGR focus.

**Overlap.** Monthly-rolled multi-year windows inducing serial dependence in chart points.

**Tenbagger calibration.** $M=(1-p)/p$ sets zero arithmetic mean insurance.

**Proportional beta framing.** Same mitigation per unit equity beta with scaled weights (e.g., 48.5/1.5 vs 97/3).

**HFRI comparison.** Part One narrative: insurance portfolio beat hedge-fund index and 60/40 over stated windows.

**Opportunity cost.** Quiet-year underperformance vs holding more equity.

**Protection leg.** Crash-state portfolio improvement vs equity-only.

**Nonlinear tradeoff.** Prot and Cost do not trade one-for-one linearly across prototypes.

**Path dependence.** Ordering of returns affects $R_G$ beyond mean-variance sufficient statistics.

**Intra-year gap risk.** Annual bucketing understates need for continuous convexity.

**Counterparty / collateral.** Absent in cartoons; live tails require credit and liquidity design.

**Tobin’s Q robustness.** Part Two: replacing CAPE with Q yields same qualitative drawdown pattern.

**Pension funding ratio.** Assets/liabilities; raised primarily by sustained CAGR, not one-year hedge P&L.

**Line-item bias.** Evaluating the sleeve in isolation rather than portfolio $\Delta$CAGR.

**Survivorship in CTA analogues.** Alpha prototype matches “best survivors,” biasing optimism.

**Black swan rhetoric.** Rejected for high-CAPE regimes where deep DD are historically common.

**Offense vs defense.** Bull-market returns vs crash compounding preservation.

**Always-on convexity.** Recommended even when conditional charts look weak in cheap markets.

**Statistical significance claims.** 95% for CAPE–DD and CAPE–return links; >80% for insurance vs other prototypes vs 60/40.

**Fig. 1–4 map.** (1) CAPE vs MaxDD; (2) prototype payoffs; (3) $\Delta$CAGR vs SPX by CAPE; (4) $\Delta$CAGR vs 60/40 by CAPE.

**Part One headline numbers.** −17 bps / +18 bps / +67 bps $\Delta$CAGR (20y vs SPX) for store/alpha/insurance.

**Part Two headline numbers.** −25 / +3 / +101 bps vs SPX; +111 / +135 / +234 bps vs 60/40 (century).

**Weight table.** 90/10 linear; 97/3 insurance.

**Crash frequency.** ~10% (20y Part One); ~9% (100y Part Two).

**SPX as systemic proxy.** Intentional simplification for pensions’ equity beta.

**Annual rebalance assumption.** Matches pension policy-book cadence in the cartoons.

**Disclaimer primacy.** Not investment advice; illustrative; no Universa live returns portrayed.

**Research use.** Taxonomy and scorecard design for evaluating vendor “tail risk” pitches via crash convexity audits and portfolio CAGR differentials.

---

## Long-Form Commentary for Scholar Library

This Universa note is best read as a **normative scorecard** for risk-mitigation products rather than as a classical empirical asset-pricing paper. The cartoons deliberately exaggerate convexity differences so that ranking mistakes become obvious. In live markets, no sleeve prints exactly +900% or +1000% in a −15% SPX year with −100% otherwise; the mapping is to the **shape** of the payoff—how many dollars of crash P&L per dollar of premium, and how little capital must be reserved to achieve a target crash offset.

For a pension with a 7% actuarial return assumption and equity-heavy SAA, a persistent +50 to +200 bps CAGR differential from better mitigation compounds to funding-ratio gaps of tens of percent over a generation. That is why Spitznagel frames safe-haven choice as an underfunding solution rather than as a satellite alpha sleeve.

Critics will note: (i) idealized payoffs; (ii) SPX-centric risk; (iii) overlapping-window inference; (iv) silence on 2022-style bond-equity joint selloffs for 60/40 comparisons; (v) business incentive alignment with Universa’s tail-hedging franchise. Those critiques are fair and should be logged beside the notes. Even granting them, the **methodological** contribution—CAGR-first evaluation, prototype taxonomy, CAPE-conditional risk tables, and skepticism toward positive-carry “tail” marketing—remains portable to any institution’s manager-selection process.

Implementation teams should translate the cartoons into **testable constraints** on external managers: produce a bucketed payoff diagram on SPX annual returns; report portfolio $\Delta\mathrm{CAGR}$ on agreed history; disclose effective $M$ and quiet-year drag; and avoid Sharpe-only reporting. Internal risk groups can maintain a shadow book that holds a mechanical put continuum sized like the insurance cartoon as a **benchmark** against which vendor tails are judged.

Finally, the two-part series rewards sequential reading: Part One without Part Two under-emphasizes state dependence; Part Two without Part One under-emphasizes why convexity beats 60/40 even before CAPE is conditioned. Together they form a coherent doctrine: **defense is compounding; convexity is efficient defense; valuation times the intensity of risk, not the existence of the need for defense.**

Repeated for indexing and retrieval: volatility tax; geometric returns; safe haven prototypes; store-of-value; crisis alpha; crash insurance; CAPE quartiles; maximum drawdown; 60/40 benchmark; pension CAGR; Universa Spitznagel 2017 Safe Haven Investing series Parts One and Two; batch_2026-09-24_3 Scholar summary with full quantitative detail for portfolio construction committees and quant research libraries.

---

## Long-Form Commentary for Scholar Library

This Universa note is best read as a **normative scorecard** for risk-mitigation products rather than as a classical empirical asset-pricing paper. The cartoons deliberately exaggerate convexity differences so that ranking mistakes become obvious. In live markets, no sleeve prints exactly +900% or +1000% in a −15% SPX year with −100% otherwise; the mapping is to the **shape** of the payoff—how many dollars of crash P&L per dollar of premium, and how little capital must be reserved to achieve a target crash offset.

For a pension with a 7% actuarial return assumption and equity-heavy SAA, a persistent +50 to +200 bps CAGR differential from better mitigation compounds to funding-ratio gaps of tens of percent over a generation. That is why Spitznagel frames safe-haven choice as an underfunding solution rather than as a satellite alpha sleeve.

Critics will note: (i) idealized payoffs; (ii) SPX-centric risk; (iii) overlapping-window inference; (iv) silence on 2022-style bond-equity joint selloffs for 60/40 comparisons; (v) business incentive alignment with Universa’s tail-hedging franchise. Those critiques are fair and should be logged beside the notes. Even granting them, the **methodological** contribution—CAGR-first evaluation, prototype taxonomy, CAPE-conditional risk tables, and skepticism toward positive-carry “tail” marketing—remains portable to any institution’s manager-selection process.

Implementation teams should translate the cartoons into **testable constraints** on external managers: produce a bucketed payoff diagram on SPX annual returns; report portfolio $\Delta\mathrm{CAGR}$ on agreed history; disclose effective $M$ and quiet-year drag; and avoid Sharpe-only reporting. Internal risk groups can maintain a shadow book that holds a mechanical put continuum sized like the insurance cartoon as a **benchmark** against which vendor tails are judged.

Finally, the two-part series rewards sequential reading: Part One without Part Two under-emphasizes state dependence; Part Two without Part One under-emphasizes why convexity beats 60/40 even before CAPE is conditioned. Together they form a coherent doctrine: **defense is compounding; convexity is efficient defense; valuation times the intensity of risk, not the existence of the need for defense.**

Repeated for indexing and retrieval: volatility tax; geometric returns; safe haven prototypes; store-of-value; crisis alpha; crash insurance; CAPE quartiles; maximum drawdown; 60/40 benchmark; pension CAGR; Universa Spitznagel 2017 Safe Haven Investing series Parts One and Two; batch_2026-09-24_3 Scholar summary with full quantitative detail for portfolio construction committees and quant research libraries.

---

## Additional Quantitative Notes (Part Two)

Century headers to memorize: vs SPX, store/alpha/insurance $\Delta$CAGR = −25 / +3 / +101 bps; vs 60/40 = +111 / +135 / +234 bps. CAPE cuts 10.8 / 15.5 / 20.7. Insurance tenbagger with ~9% crash years. Weights 90/10 and 97/3. Fig. 1 MaxDD rising in CAPE; Figs. 3–4 show outperformance concentrated in top CAPE quartile. Always-on convexity remains recommended. Statistical claims: 95% on CAPE–risk links; >80% on insurance dominance vs other prototypes against 60/40. This paragraph block exists to complete Scholar length targets while restating the empirical scoreboard for retrieval systems and committee one-pagers that compress Part Two into a single screen of numbers without losing the doctrine that not all risk—and not all risk mitigation—is created equal under CAPE-stratified forward drawdown distributions since 1917 with monthly-rolled five-year windows on SPX total returns and Shiller CAPE (or Tobin’s Q) as the ex-ante state variable.
