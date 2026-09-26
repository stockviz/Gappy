# Are Options on Index Futures Profitable for Risk-Averse Investors? (Constantinides–Czerwonko–Jackwerth–Perrakis 2010) — Detailed Quantitative Research Notes

## Bibliographic Header
| Field | Detail |
|------|--------|
| Title | Are Options on Index Futures Profitable for Risk Averse Investors? Empirical Evidence |
| Authors | George M. Constantinides (Chicago Booth, NBER); Michal Czerwonko (Concordia/McGill); Jens Carsten Jackwerth (Konstanz); Stylianos Perrakis (Concordia) |
| Status | *Journal of Finance* forthcoming (draft July 21, 2010); SSRN 1106962 |
| Original PDF | `AbnormalReturns_Constanides_2010.pdf` (filename spelling “Constanides”) |
| Drive file_id | `0B-6kBz0I0dMsMWo5NWlYQkFxUUE` |
| Option data | CME time-stamped quotes, S&P 500 futures options, Feb 1983 – Jul 2006; 247 monthly sampling dates; 30-calendar-day options |
| Underlying | Nearest S&P 500 futures; index inferred via cost-of-carry; 3-month T-bill from Fed H.15 |
| Return history for bounds | Daily log index returns Jan 1928 – Jan 1983, with forward-looking moment adjustments |
| Transaction costs | 0.5% one-way on index; option bid/ask used directly; one-quote delay before entry |
| Criterion | Second-order stochastic dominance (SSD); Davidson–Duclos (2000, 2006) tests |
| Core claim | Writing American calls on S&P 500 futures that violate Constantinides–Perrakis (2007) upper bounds **SSD-dominates** holding only index+cash, net of costs and spreads; put-bound violations too rare for inference; naïve and Bernardo–Ledoit rules do not systematically SSD-dominate |

## Problem / Motivation
Index options often look “expensive” (steep smirk; costly OTM puts; zero-beta straddle losses — Coval–Shumway; Santa-Clara–Saretto). Prior work often assumes frictionless complete markets and a representative agent (Ait-Sahalia–Lo; Jackwerth; Rosenberg–Engle). Constantinides–Jackwerth–Perrakis (2009) documented bound violations for *European* S&P 500 options but did not prove that trading on those violations raises out-of-sample utility under frictions.

This paper: (i) uses **American futures options** (CME, long clean tape 1983–2006); (ii) identifies violations of **Constantinides–Perrakis (2007)** stochastic-dominance bounds allowing incomplete markets, heterogeneous agents, proportional stock costs, and early exercise; (iii) trades only on observable information with bid/ask and a one-quote delay; (iv) tests whether the option trader’s (OT) wealth path **second-order stochastically dominates** the index trader’s (IT) path — i.e., every risk-averse expected-utility maximizer prefers OT.

## Theory: Constantinides–Perrakis Bounds
Traders hold bond (risk-free total return $R$) and stock/index with deterministic dividend yield $\gamma$ and i.i.d. total return. American call/put on futures with strike $K$, expiry $T$; futures maturity $T_F\ge T$; basis risk $\varepsilon_t$ bounded.

**Reservation write price** of a call: cash proceeds $C$ such that $V^{OT}(x_0+C,y_0)=V^{IT}(x_0,y_0)$. CP (2007) upper bound independent of utility and endowment and of the exercise policy:
$$
C(F_t,S_t,t)=\frac{1+k}{1-k}\max\big\{N(S_t,t),\,F_t-K\big\},
$$
with $N$ defined recursively by risk-neutral-like expectations under the physical measure adjusted for dividends and basis (paper eq. 2). Intuition: if call **bid** exceeds this bound, any trader in the CP class raises expected utility by writing the call.

Put upper bound (with costless futures trading) via put-call type relation (eq. 3). Lower bounds exist but are violated too rarely for inference — paper focuses on **call upper bound** violations (“good sells”).

Key robustness: even if CP assumptions fail, using bound violations as **signals** can still produce SSD; errors make the claim conservative.

## Data and Bound Calibration
- **247** month-end (approx.) dates from Feb 1983–Jul 2006 with 30-day S&P 500 futures options.
- Index tree: $T$-step daily recombining tree calibrated each month to match first four moments of daily index returns.
- Mean log return set to **4% + T-bill** (not estimated) to avoid mean-estimation noise.
- Volatility estimators compared (Table I): (i) unconditional 1928–83 σ; (ii) 90-day historical; (iii) 360-day historical; (iv) ATM IV lagged one day, bias-adjusted (~3% mean error); (v) EGARCH(1,1) with 1928–83 coeffs applied to recent residuals. **Best predictor: adjusted ATM IV; second: 90-day historical.**
- Skewness/kurtosis: trailing 90-day sample.
- Basis risk bound $\varepsilon=0.5\%$ of index (covers 95% of 1990–2002 observations).

## Portfolio Policies
**Index trader (IT):** Constantinides (1986) / Perrakis–Czerwonko (2006) optimal no-trade band with 0.5% proportional costs, σ=0.1856, risk premium 4%, CRRA=2. Band on $y/x$: lower 1.2026, upper 1.5259. Initialize at midpoint $y_0=100{,}000$, $x_0=73{,}300$ ($y/x=1.3642$).

**Option trader (OT):** same stock/bond policy (generally suboptimal for OT — conservative); writes **one** call (or put) per unit index when a violation is observed; American assignment recognized; may not retrade the option.

Utility/risk aversion of IT affects only rebalancing, **not** the bounds or SSD tests.

## Stochastic Dominance Tests
SSD: OT $\succeq_2$ IT iff $\int_{-\infty}^z [F_{IT}-F_{OT}]\ge 0$ for all $z$, strict some $z$.

Tests:
1. **DD (2000):** $H_0: IT\succeq_2 OT$ and converse. Serial correlation of returns −0.03 to 0.10 (insignificant) — OK for DD.
2. **DD (2006):** $H_0:$ OT does not dominate IT, vs $H_A:$ OT $\succeq_2$ IT (and converse). Low power without trimming: trim **10% left tail** always; report **0%, 5%, 10% right-tail** trims. Simulations (online App C) show tests are conservative (under-reject false null).
3. All tests on **annualized arithmetic returns** of OT vs IT wealth.

## Pattern of Violations (Tables II–IV, Figures 1–2)
- Call upper bound violated far more often than put upper bound (call bound tighter).
- Highest **proportion** of violations in moneyness $K/F\in[1.03,1.08]$ (OTM calls).
- Highest **count** in $K/F\in[0.99,1.03]$ (liquidity).
- Violation size: ~5–56% of the bound from liquid to deep OTM ranges.
- Time pattern: violations cluster after large index declines / high IV regimes (Figure 2).
- Characteristics (Table IV): more violations when Baa–Aaa default spread high, futures open interest high, momentum high — “nervous” states.

## Main SSD Results (Table V)
**Call upper-bound writes (Panel A):**
- DD(2000) does **not** reject $OT\succeq_2 IT$ (p>10%).
- DD(2000) **rejects** $IT\succeq_2 OT$ at p<1%.
- DD(2006) with 5% or 10% right trim **rejects** “OT does not dominate IT.”
- Good-sell calls earn **12.3–43.2% average monthly returns** to the writer at the bid (depending on vol estimator); 3 of 4 estimators significant by 9,999-trial bootstrap. By contrast, writing *all* calls at bid averages 7.7%/mo and is insignificant.
- Portfolio-level OT−IT annualized gaps look small because only one call per index unit and many months have no violation — multiply by >2 to get conditional-on-trade gaps; raising to 1.5–2 calls per index (Table VII) lifts OT−IT to **0.46–1.32%** annualized with SSD intact; at 3× SSD fails.

**Put upper-bound writes (Panel B):** few violation months → inconclusive SSD.

**Economic significance:** SSD vanishes only after artificially cutting written-call prices by **10–15%** — violations are not knife-edge.

## Robustness (Section IV)
| Test | Result |
|------|--------|
| Replace S&P 500 with other indices / add HML, SMB, real estate (Table VI) | OT still SSD-dominates modified IT |
| 1.5 or 2 calls per index (Table VII) | Larger OT−IT gaps; SSD holds; fails at 3× |
| Buy-and-hold instead of optimal band (Table VIII) | SSD results unchanged |
| CRRA=10 rebalancing | Unchanged |
| Start at band boundary | Unchanged |
| $\varepsilon=0$ (tighter bounds) | More violations; SSD conclusions intact |
| Risk premium 2% or 6% vs 4% | Call-write SSD as strong as baseline |
| Drop Oct 1987–Apr 1988 | Unchanged |

## Comparison to Naïve and Bernardo–Ledoit Rules (Tables IX–X)
- **Naïve write-all-calls:** weak SSD support.
- **Naïve write-all-puts / buy-all-calls / buy-all-puts:** no SSD.
- Top 10% / 2.5% richest calls: sample too thin to strengthen.
- **Bernardo–Ledoit (2000)** gain-loss ratio bounds: upper-bound results sometimes similar to CP; **lower-bound results “disastrous”** (no SSD; sometimes negative OT excess). Raising gain/loss ratio to 4 does not fix lower bounds. CP bounds dominate BL as a practical signal.

## Equilibrium Interpretation
Segmented markets: mutual funds buy OTM puts as insurance; speculative buyers bid up OTM calls; dealers inflate quotes (Gârleanu–Pedersen–Poteshman 2009). Small agents can write good-sell calls and improve SSD utility; large hedge funds may be constrained by margins and depth (Santa-Clara–Saretto 2009), so overpricing persists.

## Limitations
- One call per index unit understates scalable economic value (addressed partly in Table VII).
- Focus on 30-day options; longer tenors untested.
- SSD tests need trimming for power; authors show conservatism via simulation.
- Bounds use physical-measure trees — sensitive to vol estimator, though conclusions robust across estimators.
- Filename/Drive PDF is the 2010 draft; verify against published JF version for final table numbering.

## Practical Takeaways for a Quant Investor
1. **Signal:** each day/month, recompute CP call upper bound from a four-moment calibrated tree using adjusted ATM IV (or 90-day hist vol); flag calls with **bid > bound**.
2. **Trade:** sell those calls (or deltas via futures), sit in index+cash band; account for early exercise.
3. **Expect:** SSD improvement for risk-averse agents; writer returns on selected calls 12–43%/mo vs 7.7% for unfiltered writing.
4. **Do not:** indiscriminately short all OTM puts expecting SSD — paper finds insufficient put-bound violations; naïve put writing fails SSD.
5. **Sizing:** 1–2 short calls per index unit; beyond ~3× SSD evidence breaks.
6. **Risk:** violations cluster in high-IV post-drop regimes — margin and gap risk spike exactly when signals fire.
7. **Edge vs heuristics:** percentile “sell rich” and BL bounds are inferior identifiers of utility-improving trades.

## Quantitative Bottom Line
Over 1983–2006 CME S&P 500 futures options, writing calls that breach Constantinides–Perrakis upper bounds produces wealth paths that **second-order stochastically dominate** index+cash paths for risk-averse investors, net of 0.5% index costs and option bid/ask, with one-quote delay. Selected calls return **12.3–43.2%/mo** to writers. Results robust to vol estimator, portfolio composition, rebalancing, basis risk, and risk-premium assumptions. Naïve and Bernardo–Ledoit alternatives do not systematically deliver SSD. **Index call overpricing is not just a smile artifact — it is a tradable, utility-improving opportunity for constrained risk-averse agents.**

## Replication Checklist
1. Build daily SPX return history 1928–2006; T-bills; CME options/futures tape.
2. Each sample date: estimate moments; calibrate m-branch tree; backward-induce $N(S,t)$ and call upper bound.
3. Scan bids; if bid > bound after one-quote delay, record short call in OT book.
4. Simulate IT and OT wealth with 0.5% costs and no-trade band (or buy-and-hold).
5. Run DD(2000)/DD(2006) on annualized returns with 10% left / {0,5,10}% right trims.
6. Match: call violations ≫ put; OT SSD over IT for calls; writer monthly returns in teens to forties percent on selected names.

## Extended Discussion: Why SSD Matters More Than Mean-Variance Here
Option overlays create non-normal wealth increments (asymmetric, jump-like when assigned). Mean-variance can mis-rank such policies. SSD is the right incomplete-markets criterion: if OT $\succeq_2$ IT, **every** concave increasing $U$ has $\mathbb{E}[U(W_{OT})]\ge\mathbb{E}[U(W_{IT})]$. That is a far stronger statement than “Sharpe improved” or “average return up,” and it matches the paper’s heterogeneous-agent, incomplete-market theory.

## Links to Other Batch Papers
- **Levy (2017):** ranking under constraints — here the “fund” is IT vs OT policy.
- **Neely et al. (2010):** predictability and utility gains for mean-variance investors in equities; this paper is the options-market SSD analogue.
- **Drechsler (2014):** expensive options ↔ hard-to-short / high-demand states; related friction complex.


## Volatility Estimator Horse Race (Operational Detail)
Adjusted ATM IV wins on forecast MSE for realized vol to expiry (Table I). Operational recipe: take previous day’s ATM IV, subtract the expanding-window mean (IV − realized) bias (~3%), feed into the tree as the second moment; graft 90-day skewness/kurtosis; set mean to 4%+Tbill. Historical 90-day is the fallback when IV markets are closed or unreliable. EGARCH helps in persistent vol regimes but does not dominate IV. Unconditional 1928–83 σ is too slow and generates noisier signals.

## Basis Risk and Early Exercise
Futures options are American; assignment risk is material for ITM calls near expiry. The OT policy assumes the trader may be assigned and pays $F_t-K$ in cash, reducing the bond account. The CP upper bound is valid **independent of the exercise policy**, which is why it is usable without solving a full game against the holder. Basis risk bound 0.5% widens the feasible set slightly via the $(1+k)/(1-k)$ and $N(\cdot)$ channels; setting $\varepsilon=0$ tightens bounds and increases violation counts without overturning SSD.

## Margin and Scalability Caveats for Practitioners
SSD at 1–2 short calls per index unit does not imply a hedge fund can short unlimited notional. Santa-Clara–Saretto constraints (margin, depth) likely explain persistence. A practical book should: (i) cap short call notional at a fraction of NAV; (ii) pre-locate margin at the clearing firm; (iii) stress OT wealth under 1987-style gaps; (iv) avoid scaling into the exact post-crash months without separate risk limits — even though excluding crash months does not remove the SSD result.

## Final Scholar Notes
Drive PDF extractable (3430 lines). Filename typo “Constanides” preserved in original-PDF parenthetical per Scholar naming rule.


## Extended Methodology Notes for Desk Replication

### Tree calibration
Each month, build a recombining tree with m branches per node and T steps equal to trading days to expiry. Choose branch spacing and risk-neutral-style physical probabilities to match mean (4%+Tbill), variance (from chosen estimator), skewness, and kurtosis of daily log returns. Online Appendix B of the paper details the moment-matching algebra. Backward induction computes N(S,t) and hence the call upper bound including the (1+k)/(1-k) transaction-cost multiplier.

### Quote handling
CME time-stamped quotes; require exchange minimum size (20 contracts). Apply one-quote delay: after observing a violating bid, wait for the next quote before assuming fills at that bid. This reduces look-ahead from stale quotes.

### SSD test implementation
Use Davidson’s 2007 algorithm for DD(2006). Annualize monthly wealth returns arithmetically for the test sample. Left-trim 10% of paired outcomes always. Report right-trim 0/5/10%. Serial correlation of IT/OT returns is economically zero in the paper’s samples, validating the i.i.d.-friendly DD assumptions. Nolte (2008) supports DD(2006) under GARCH.

### Economic magnification arithmetic
Suppose violations occur in n of N months and conditional annualized OT-IT gap is x%. Table V reports n/(n+m) * x style averages including zero-gap months. With n < N/2 typically, multiply table gaps by >2 for conditional-on-signal economics. Further multiply by contracts-per-index (Table VII) for sized books.

### Why puts disappoint as signals
Put upper bound is weaker (higher) than call upper bound (Figure 1), so fewer put bids breach it. Literature’s “rich put” narrative (Bondarenko; Driessen–Maenhout) may still hold via straddles/strangles triggered by *call* violations (online App D), but pure put-upper-bound writes lack power here.

### Comparison with Constantinides–Jackwerth–Perrakis (2009)
CJP2009 documented European index option bound violations with a parametric price process. This 2010 paper’s advance is the **out-of-sample SSD trading test** under frictions, American futures options, and nonparametric trees — addressing model misspecification and “violation ≠ profitable trade” critiques.

### Operational risk checklist
- Gap risk on written calls after limit-down opens
- Early assignment on ITM American calls
- Margin spikes when VIX jumps (exactly when signals cluster)
- Basis risk if hedging with cash index vs futures
- Capacity: one-to-two calls per index unit before SSD evidence fades

### Numerical anchors
- 247 sample dates, 1983–2006
- Index cost 0.5% one way; CRRA=2 band y/x in [1.20, 1.53]
- Writer returns on good-sell calls 12.3–43.2%/mo
- Unfiltered call writing 7.7%/mo (insignificant)
- SSD survives 10–15% artificial price haircut only barely
- 1.5–2.0 calls/index: OT-IT +0.46–1.32% ann. with SSD; 3.0 fails

### Synthesis
For a risk-averse investor already holding the market, selectively writing CP-upper-bound-violating S&P futures calls is a utility-improving overlay, not a casino. The result is nonparametric in preferences (any concave U) and robust across vol estimators. That is rarer and more valuable than a high backtest Sharpe on a naked short-option book.

The Constantinides–Perrakis upper bound on American futures calls is deliberately constructed so that it does not require knowledge of the trader’s utility function or of the option holder’s exercise policy. That independence is what makes the bound operational: a desk can compute it from an estimated physical return tree and a transaction-cost parameter without solving a game against the holder. Empirically, the (1+k)/(1−k) multiplier with k=0.005 raises the bound by only about one percent relative to the frictionless case, confirming the paper’s claim that index trading costs have a second-order effect on the write bound because both IT and OT are evaluated under the same low-turnover index policy.

In practical terms, paragraph 1 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Across 247 monthly dates from February 1983 through July 2006, the CME tape supplies a cleaner laboratory than OptionMetrics end-of-day quotes or the truncated Berkeley Options Database. The sample spans the 1987 crash, the 1998 LTCM/Russia episode, the dot-com boom and bust, and the mid-2000s carry regime — precisely the events missing from shorter option panels. Violations of the call upper bound cluster after large index declines, when implied volatility is elevated and the physical tree’s second moment, even when proxied by adjusted ATM IV, cannot rationalize observed call bids.

In practical terms, paragraph 2 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Moneyness patterns matter for execution. The highest violation *rate* occurs in the 1.03–1.08 K/F bucket (moderately OTM calls), where the bound is tight relative to the smile. The highest violation *count* occurs in 0.99–1.03, where liquidity is deepest. Average violation sizes grow from roughly five percent of the bound in liquid strikes toward fifty-plus percent in deeper OTM strikes, so a liquidity-aware desk may prefer the numerous mild violations near ATM to the sparse extreme ones further OTM.

In practical terms, paragraph 3 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

The SSD evidence is the paper’s claim to fame. Davidson–Duclos (2000) rejects IT dominating OT for call writes at well under one percent, while failing to reject OT dominating IT. Davidson–Duclos (2006), with ten percent left trimming and five or ten percent right trimming, rejects the null that OT does not dominate IT. Right-tail trimming is delicate because IT tends to outperform OT when the index rallies hard (written calls lose); the authors’ simulations show that even with trimming the test remains conservative, so rejections are not artifacts.

In practical terms, paragraph 4 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Writer returns of 12.3 to 43.2 percent per month on selected good-sell calls sound extravagant until one recalls these are option returns on notional that is a small fraction of the index position. The portfolio-level OT minus IT annualized gaps in Table V look modest precisely because the paper writes only one call per index unit and includes all no-trade months as zeros. Scaling to 1.5–2.0 calls per index raises annualized OT−IT gaps into the 0.46–1.32 percent range while preserving SSD; at 3.0 the SSD evidence breaks, giving a practical capacity ceiling.

In practical terms, paragraph 5 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Robustness to portfolio composition (Table VI) is unusually strong for an options paper: replacing the S&P 500 with other indices, or adding HML, SMB, and real-estate overlays, still leaves OT SSD-dominant. That undercuts the objection that the result is an artifact of a narrow two-asset trader class. Buy-and-hold rebalancing (Table VIII) and CRRA=10 bands leave results unchanged, confirming that the no-trade region is wide enough that fine details of rebalancing do not drive SSD.

In practical terms, paragraph 6 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

The failure of naïve write-all-calls/puts and of Bernardo–Ledoit bounds to systematically deliver SSD is important rhetorically. It shows that “options look expensive” is not enough; the CP bound supplies a selective filter that converts a noisy impression into a utility-improving policy. Lower-bound BL results are described as “disastrous,” warning against treating every theoretical bound as a trading signal without an out-of-sample dominance test.

In practical terms, paragraph 7 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Equilibrium segmentation — mutual funds demanding puts, speculators demanding calls, dealers intermediating with balance-sheet costs (Gârleanu–Pedersen–Poteshman), and large short-option books hitting margin walls (Santa-Clara–Saretto) — rationalizes persistence. A small risk-averse agent can harvest good-sell calls without eliminating the mispricing. For a quant overlay book, that is the opportunity set: sized modestly, rules-based, SSD-validated.

In practical terms, paragraph 8 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Operationally, recompute the bound daily or at each quote update using adjusted ATM IV as the preferred second moment, graft 90-day skewness and kurtosis, set the mean to four percent plus the T-bill, and flag bids above the bound after a one-quote delay. Hedge with the underlying futures; manage early assignment; stress margins at crash IV. Expect signals to cluster exactly when risk budgets feel most uncomfortable — that is when the edge is largest and when discipline matters most.

In practical terms, paragraph 9 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Relative to Constantinides–Jackwerth–Perrakis (2009), the advance is not merely documenting violations but proving that trading them improves every risk-averse agent’s expected utility under realistic frictions. That is a higher bar than significant average returns or Sharpe ratios, and the paper clears it for call upper-bound writes over a 23-year CME sample.

In practical terms, paragraph 10 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.