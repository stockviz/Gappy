# Including Trading Costs in Portfolio Optimization (Street Smart Issue 30)

**Authors:** George Sofianos; Samer Takriti; Ingrid Tierens  
**Institution:** Goldman Sachs Equity Execution Strategies (not Global Investment Research)  
**Publication:** *Street Smart*, Issue 30, United States, 5 December 2007  
**Tools:** Axioma Portfolio™ integrated with Goldman Sachs Shortfall Model (AP+GSSM)  
**Source PDF:** `TransactionCosts_GoldmanSachs_2008.pdf`  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_1)  
**OCR:** Not required; clean extract (~3,715 words of source)

---

## 1. Problem and Motivation

Portfolio optimization conventionally maximizes expected return for given risk using (i) the initial portfolio, (ii) a variance–covariance / risk-model matrix, and (iii) expected alphas—often subject to exposure, industry, and tax constraints. **Trading-cost estimates are typically omitted** from the optimizer and applied, if at all, as an after-the-fact haircut. Sofianos, Takriti, and Tierens show that this practice systematically produces **gross-return-optimal** portfolios that are **net-return-suboptimal**, especially when the alpha signal concentrates in high-cost names (small-caps).

Goldman Sachs licensed its **Goldman Sachs Shortfall Model (GSSM)** to Axioma; Axioma integrated GSSM into Axioma Portfolio to offer **AP+GSSM**. The note uses this integrated tool on a stylized three-stock rebalancing problem (“AlphaMax”) to quantify how large the net-return loss from ignoring t-costs can be—**70 bps** in the headline example—and to illustrate the correct net-return efficient frontier.

---

## 2. The AlphaMax Stylized Portfolio

### 2.1 Setup

- **Portfolio NAV:** \\$250 million.  
- **Objective:** rebalance to maximize expected return subject to **total risk ≤ 55%** (annualized).  
- **Initial portfolio (point A):** equal weights 33.3% / 33.3% / 33.3%.  
- **Initial expected net return:** 3.0% at **25%** portfolio risk.

### 2.2 Stock characteristics (Exhibit 2)

| Stock | Role | Price | ADV (shares) | Total risk | Weight | Exp. alpha |
|-------|------|-------|--------------|------------|--------|------------|
| IBM | Large-cap | \\$120 | 7,000,000 | 18% | 33.3% | 1% |
| WFMI | Mid-cap | \\$50 | 2,500,000 | 36% | 33.3% | 2% |
| CMOS | Small-cap | \\$3 | 900,000 | 63% | 33.3% | 6% |

Risk figures are annualized market + stock-specific risk from Axioma’s US risk model. Alphas are **hypothetical** for illustration. The CMOS holding is deliberately extreme (~25% of CMOS market cap) to magnify t-cost effects.

Initial portfolio expected alpha = $0.333\times(1\%+2\%+6\%) = 3\%$.

---

## 3. Optimization Ignoring Trading Costs

Without t-costs, the only penalty for loading on CMOS is its **63%** risk contribution. The optimizer therefore builds a **gross-return frontier** (Exhibit 3, solid line AC). Under the 55% risk cap, the chosen portfolio (point **C**) is:

- **87% CMOS / 13% WFMI / 0% IBM**  
- **Expected gross return 5.5%** at 55% risk.

After subtracting the GSSM-estimated cost of the rebalancing trades, the **expected net return of C is only 2.7%**—**below** the initial 3.0%, despite a massive risk increase from 25% → 55%. The net-return curve along this gross-optimal path **declines** as risk rises—opposite to the manager’s intent.

**Economic diagnosis:** the optimizer treats CMOS’s 6% alpha as free to scale; in reality, buying enough CMOS to reach 87% weight incurs enormous shortfall, wiping out the alpha gain and then some.

---

## 4. Optimization Including Trading Costs (AP+GSSM)

### 4.1 Rebalancing cost surface (Exhibit 4)

GSSM expected shortfall (bps) for each name as a function of the risk target / associated trade:

- To reach **40%** portfolio risk, CMOS weight rises from 33% → **53%**; expected CMOS shortfall ≈ **284 bps**.  
- IBM and WFMI trades are far cheaper (tens of bps).  
- Horizon assumption in the exhibit: **one-day** execution.

The integrated optimizer balances **alpha vs risk vs t-cost** at each frontier point.

### 4.2 True net-return frontier (Exhibit 5)

Solid line **AB** is the net-return efficient frontier. Key features:

- At the initial portfolio, gross = net (no trade).  
- As the portfolio moves away from A, the **wedge** between gross (dotted AD) and net equals expected rebalancing shortfall.  
- Beyond **~40% risk**, incremental t-costs **exceed** incremental alpha; net return **falls**. Portfolios above 40% risk are therefore **not** on the efficient frontier.  
- **Optimal point B:** expected **net return 3.4%** at **40%** risk, with weights roughly **53% CMOS / 47% large+mid** (Exhibit 1 pie: 53% / 47% split on the t-cost-aware choice; detailed mid/large split in exhibits).

### 4.3 Same-risk comparison (Exhibit 6)

Even at the **same** 40% risk level:

- T-cost-aware optimization: CMOS weight **53%**, net return **3.4%**.  
- T-cost-blind optimization: CMOS weight **59%**, net return **3.3%**.  
- Difference: **10 bps** of net return from inferior construction at identical risk—because the blind optimizer overweights the expensive name.

### 4.4 Headline loss (Exhibit 1)

Under AlphaMax’s actual objective (max return, risk ≤ 55%):

| Policy | Chosen point | Risk | Gross | Net | CMOS weight |
|--------|--------------|------|-------|-----|-------------|
| Ignore t-costs | C | 55% | 5.5% | **2.7%** | 87% |
| Include t-costs | B | 40% | 4.1% | **3.4%** | 53% |
| Initial | A | 25% | 3.0% | 3.0% | 33% |

**Ignoring t-costs reduces expected net return by 70 bps** (3.4% − 2.7%) relative to the correct optimum, while also selecting much higher risk.

---

## 5. The Goldman Sachs Shortfall Model (Appendix)

### 5.1 Shortfall definition

For **buys:** $(\text{execution price} - \text{arrival mid})/\text{arrival mid}$, in bps.  
For **sells:** opposite sign. **Excludes commissions** (indirect costs only: market impact + opportunity cost of delay). Direct costs (commissions, borrow) should be added separately in a complete optimizer.

### 5.2 Model structure

Non-linear regressions of realized shortfall on **seven** factors:

1. Order size (\$).  
2. Intra-day execution horizon (e.g., 09:30–12:30).  
3. Market-cap bucket (large > \\$7.5bn; mid; small < \\$1bn).  
4. Listing venue (NYSE vs NASDAQ).  
5. Average bid–ask quoted spread (bps) over the horizon.  
6. Average dollar volume over the horizon.  
7. Average price volatility (intraday range / average price).

**Estimation:** re-estimated **monthly** on a rolling **nine-month** window of Goldman Sachs all-day and intra-day market orders. Estimates therefore reflect **actual** execution costs of similar orders—including the average short-term alpha embedded in the flow—not hypothetical tick-data impact models.

**Market-state inputs:** average spread, volume, and volatility over the prior **21 trading days**, rolling daily—so forecasts adapt to changing liquidity.

**Volume-time, not clock-time:** multi-day horizons are handled by interacting with more cumulative volume (e.g., 100k shares over two days ≈ twice the volume interaction of one day). Time-of-day matters: a 2-hour order at 09:30 differs from the same order at 12:00 because of intraday volume and spread patterns.

**Reliability boundary:** few sample orders exceed **25% of ADV**; estimates above 25% ADV are increasingly unreliable and likely **understate** cost. Model use avoided above **50% of ADV**.

---

## 6. When Ignoring T-Costs Is More vs Less Dangerous

- **Passive / index portfolios:** stock weights are already capitalization-mediated; expensive small-caps have small weights by construction. Ignoring t-costs in *rebalance* optimization is less critical (though still relevant for turnover and cash equitization).  
- **Strong-view active portfolios** with pronounced **small-cap tilts**—the AlphaMax case—face the largest net-return destruction from gross-only optimization.  
- Historical barriers to inclusion: (i) optimizers lacked access to execution-data-calibrated t-cost models; (ii) t-cost functions are **non-linear** and hard to embed. AP+GSSM addresses both.

---

## 7. Practical Takeaways for a Quant Investor

1. **Optimize net of expected shortfall**, not gross alpha. Build the frontier in net-return space.  
2. **Expect the net frontier to peak and then fall** as risk/turnover rises—unlike textbook gross frontiers. The risk limit that maximizes net return may be **interior** to the formal risk budget (here 40% vs 55% allowed).  
3. **High-alpha ≠ high net alpha** when alpha lives in low-ADV names; size positions with the cost curve (Exhibit 4) in mind.  
4. **Same-risk ≠ same portfolio:** even at identical risk targets, t-cost-aware vs blind optimizers choose different weights (53% vs 59% CMOS) and different net returns.  
5. **Use empirical shortfall models** calibrated to live order flow (cap, venue, spread, ADV, vol, horizon, time-of-day), refreshed on rolling windows.  
6. **Respect ADV caps:** treat >25% ADV forecasts as lower bounds on cost; avoid >50% ADV model use.  
7. **Add direct costs** (commission, borrow, taxes) on top of GSSM-style shortfall for a complete net objective.  
8. **Stylization warning:** AlphaMax is extreme by design; real-world losses from ignoring t-costs are typically smaller but **same-signed**—and grow with active share in illiquid names.

---

## 8. Quantitative Sensitivity Notes

- **70 bps** headline gap = difference between correctly chosen B (3.4% net) and disaster choice C (2.7% net) under a 55% risk budget.  
- **10 bps** construction gap at matched 40% risk shows pure benefit of including costs in the objective even without changing the risk target.  
- **284 bps** CMOS shortfall to reach 53% weight illustrates why a 6% alpha can be more than half-consumed by a single rebalance in an illiquid name.  
- Portfolio size **\\$250m** with CMOS at \\$3 and ADV 900k shares implies that aggressive CMOS buys are large fractions of ADV—precisely the region where impact is non-linear.

---

## 9. Limitations

- Three-stock toy universe; no sectors, factors, or transaction-cost scaling across hundreds of names.  
- Alphas are illustrative, not estimated.  
- One-day horizon in main exhibits; multi-day schedules would lower shortfall but raise timing risk.  
- Shortfall excludes commissions and financing.  
- No out-of-sample test across many rebalance dates; single scenario narrative.  
- Disclaimer: Sales & Trading material, not GIR research; not a recommendation.

---

## 10. Extended Discussion — Embedding Non-Linear Shortfall in Optimizers

GSSM’s non-linearity (impact rising faster than linear in size / ADV) means the joint objective

$$
\max_w \;\; \alpha^\top w - \lambda\, w^\top \Sigma w - \underbrace{\mathrm{Shortfall}(w - w_0)}_{\text{non-linear}}
$$

is no longer a simple quadratic program. Practical approaches used in vendor integrations include:

- **Piecewise-linear / quadratic approximations** of shortfall along each name’s participation path;  
- **Sequential quadratic programming** with GSSM callbacks;  
- **Grid search along risk targets** (as in the note’s frontier construction), solving a constrained problem at each risk level.

AP+GSSM’s value is that the non-linear shortfall surface is **pre-calibrated** and **callable** inside Axioma’s solver, removing the need for each PM team to rebuild impact models.

Participation-rate intuition: if CMOS ADV is 900k shares and the manager needs to buy tens of millions of dollars at \\$3/share, required shares easily exceed 25% ADV on a one-day horizon—hence the 284 bps shortfall at the 40% risk point. Stretching to multi-day execution reduces GSSM shortfall (more volume interaction) but exposes the trade to adverse drift equal to the information content of the alpha signal—exactly the impact-vs-timing trade-off Almgren–Chriss-type frameworks formalize. GSSM’s volume-time design lets the optimizer explore that trade-off by changing the horizon input.

---

## 11. Governance Implications

CIOs should require that any “optimized” active rebalance report:

1. Gross expected alpha of the proposed book;  
2. GSSM- (or equivalent-) expected shortfall of the transition;  
3. Net expected alpha;  
4. The net-efficient alternative at the same or lower risk;  
5. ADV participation rates for the top 10 cost contributors.

Without (2)–(4), investment committees systematically ratify type-C portfolios: high gross, high risk, low net.

---

## 12. Conclusion

Including trading costs in portfolio optimization is not a cosmetic refinement; in the Goldman Sachs / Axioma demonstration it flips the decision from a 55%-risk, 87% small-cap, **2.7% net** disaster to a 40%-risk, 53% small-cap, **3.4% net** optimum—a **70 bp** net improvement. The mechanism is transparent: non-linear shortfall in low-liquidity names must enter the objective, or the optimizer will harvest phantom gross alpha. For quant PMs running active, high-turnover, or small-cap-tilted strategies, AP+GSSM-style integration of empirical shortfall models is first-order infrastructure, not a nice-to-have.

---

## 13. Mapping to Standard Transaction-Cost Notation

Let $x$ be the vector of share trades, $V$ the vector of ADVs, $\sigma$ intraday vols, $s$ spreads. A generic shortfall model looks like

$$
\mathbb{E}[\text{Shortfall}_i] = a\cdot s_i + b\cdot \sigma_i \,\mathrm{sgn}(x_i)\left|\frac{x_i}{V_i}\right|^\gamma + \text{timing terms},
$$

with $\gamma \in (0.5, 1.5)$ typical. GSSM is a richer non-linear regression in seven factors, but the qualitative message is identical: **marginal cost rises with participation**, so optimal active weights are capped well below gross-alpha-optimal weights. The AlphaMax 87% → 53% CMOS reduction is the portfolio-level manifestation of that rising marginal cost curve.

---

## 14. Net Frontier Geometry — Why It Bends Down

Along a gross-efficient path, expected alpha increases roughly concave-down in risk, while expected shortfall increases **convex** in the size of the move from $w_0$ (because of super-linear impact). Their difference—net expected return—therefore has an interior maximum. In AlphaMax that maximum is at 40% risk / 3.4% net. Blind managers who read only the gross frontier keep walking to the risk budget boundary and down the net hill.

---

## 15. Final Quant Checklist

- Replace $\max \alpha^\top w$ with $\max \alpha^\top w - \mathbb{E}[\mathrm{Shortfall}(w-w_0)]$.  
- Trace net frontiers; pick the net peak, not the risk-budget corner.  
- Monitor participation; flag >25% ADV.  
- Refresh cost parameters monthly on live executions.  
- Report the 70 bp-style counterfactual whenever proposing aggressive illiquid tilts.

---

## 16. Detailed Walkthrough of Exhibit 1 Pies

Exhibit 1 annotates three portfolios on the risk–return plane:

- **A (initial):** 33/33/33 large/mid/small, 25% risk, 3% net.  
- **B (t-cost aware):** approximately 10% residual large-cap ideas + mid-cap balance with **53% small-cap**, 40% risk, **3.4% net** (gross ~4.1%, implying ~70 bps of shortfall on the transition from A to B).  
- **C (t-cost blind):** **87% small-cap / 13% mid / 0% large**, 55% risk, 5.5% gross but only **2.7% net** (implying ~280 bps of shortfall—consistent with Exhibit 4’s CMOS cost curve at high participation).

The 70 bp net gap (3.4 vs 2.7) is the paper’s single most important quantitative claim for PMs.

---

## 17. Risk Model and Correlation Caveats

Even in a three-name universe the frontier is not linear in risk unless cross-correlations are zero (footnote 6). Axioma’s US risk model supplies total risks (18%, 36%, 63%) and the covariances among IBM, WFMI, and CMOS; the optimizer’s 55% and 40% portfolio-risk points already embed those covariances. Adding GSSM does not replace the risk model—it adds a third pillar alongside alpha and risk.

---

## 18. Execution Scheduling as a Second Optimization Layer

Once target weights are set net of GSSM one-day costs, a second-layer schedule can split child orders across days to reduce participation below 25% ADV. Because GSSM is volume-time based, feeding a two-day horizon back into AP+GSSM should raise the net frontier (lower shortfall for the same alpha). The trade-off is alpha decay: if CMOS’s 6% expected alpha is front-loaded, waiting two days erodes the signal. A joint optimizer over weights **and** horizons is the natural extension; the note stops at fixed one-day horizon for clarity.

---

## 19. Comparison with Academic TC-Aware Optimization

Academic formulations (e.g., Gârleanu–Pedersen dynamic trading with linear-quadratic costs; Almgren–Chriss) emphasize continuous-time optimal paths. Street Smart’s contribution is complementary and practitioner-facing: **use an empirically calibrated, broker-data shortfall surface inside a commercial mean–variance optimizer**, and show a concrete 70 bp failure mode when you do not. For multi-period academic models, GSSM can supply the calibrated cost coefficients that theory often leaves as free parameters.

---

## 20. Conclusion Revisited with Numbers

AlphaMax begins at (risk, net) = (25%, 3.0%). The correct t-cost-aware move is to (40%, 3.4%) with CMOS at 53%. The incorrect gross-only move is to (55%, 2.7%) with CMOS at 87%. Gross return at the wrong point looks excellent (5.5%)—which is exactly why governance must demand net reporting. Integrating GSSM into Axioma makes that governance feasible at production scale. For quant investors: **never green-light a rebalance on gross efficient-frontier plots alone.**

---

## 21. Worked Cost Arithmetic for CMOS

Suppose CMOS trades at \\$3 with ADV 900,000 shares (~\\$2.7m ADV). Raising the CMOS weight from 33.3% to 53% on a \\$250m book requires buying

$$
0.20 \times 250\text{m} = \$50\text{m} \approx 16.7\text{m shares} \approx 18.5\times\text{ADV}.
$$

Even spread over several days, daily participation remains large; on a forced one-day horizon the order is far beyond GSSM’s 25–50% ADV comfort zone—hence Exhibit 4’s **284 bps** shortfall is directionally inevitable. Haircutting the 6% alpha by 2.84% leaves only ~3.16% gross-of-other-costs alpha on the incremental CMOS slice—insufficient to justify extreme concentration once risk is also penalized.

For the blind 87% CMOS target, incremental weight from 33% is 54 percentage points → ~\\$135m notional → ~50× ADV—an order that no realistic shortfall model would price cheaply. The 2.7% net outcome is the portfolio-level aggregation of that mistake.

---

## 22. Mid- and Large-Cap Contrasts

IBM: ADV 7m shares at \\$120 ≈ \\$840m ADV. Trimming IBM from 33% to 0% on a \\$250m book is ~\\$83m ≈ 0.1× ADV—cheap. WFMI sits in between. The optimizer that ignores costs still dumps IBM entirely (Exhibit 3: 0% IBM at point C) because IBM’s 1% alpha looks dominated; the t-cost-aware optimizer may retain some IBM as “cheap risk ballast,” improving net outcomes. Exhibit 6’s 53% vs 59% CMOS comparison at 40% risk shows exactly this: cost-aware construction substitutes cheaper risk sources for expensive ones at the same total risk.

---

## 23. Implications for Multi-Name Active Books

Scale the lesson to a 500-name active book with a small-cap overweight:

1. Sort names by (alpha / GSSM_marginal_cost_at_target_weight).  
2. Feed that net signal into the optimizer, or equivalently subtract expected shortfall inside the objective.  
3. Cap participation per name per day; spill residual trades across days with alpha-decay adjustments.  
4. Re-resolve the frontier weekly as 21-day liquidity inputs roll.

Managers who instead scale positions with raw alpha will systematically oversize the right tail of the cost distribution—the AlphaMax error in production clothing.

---

## 24. Final Numbers Recap

| Quantity | Value |
|----------|-------|
| Portfolio size | \\$250m |
| Risk budget | ≤ 55% |
| Initial (A) | 25% risk, 3.0% net, 33% CMOS |
| Optimal with TC (B) | 40% risk, 3.4% net, 53% CMOS |
| Pseudo-optimal without TC (C) | 55% risk, 2.7% net, 87% CMOS |
| Net loss from ignoring TC | **70 bps** |
| Matched-risk construction loss | **10 bps** |
| CMOS shortfall to reach 53% | **284 bps** |
| GSSM factors | 7 (size, horizon, cap, venue, spread, volume, vol) |
| GSSM calibration | monthly, rolling 9 months of GS executions |
| Liquidity lookback | 21 trading days |
| Model caution zone | >25% ADV (unreliable); avoid >50% ADV |

These figures should be enough for a quant PM to explain to an IC why t-costs belong **inside** the optimizer.
