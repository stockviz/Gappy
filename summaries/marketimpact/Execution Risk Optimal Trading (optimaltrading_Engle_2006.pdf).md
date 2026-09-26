# Execution Risk — Engle & Ferstenberg (2006) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Execution Risk |
| **Authors** | Robert Engle (NYU Stern & NBER); Robert Ferstenberg (Morgan Stanley) |
| **Outlet** | NBER Working Paper **12165**, April 2006; http://www.nber.org/papers/w12165 |
| **JEL** | G2 |
| **Nature** | Theoretical / optimal execution unifying portfolio choice and trading-cost risk; Almgren–Chriss dynamics; liquidity-risk measure |
| **Original PDF** | `optimaltrading_Engle_2006.pdf` (**filename** says “optimal trading”; content title is **Execution Risk**) |
| **Drive file_id** | `1KVZMfZBT8qyB5gGiuR5ucZ6xmMm6UCY3` |
| **Extraction** | `pdftotext -layout`; clean (~7,763 words source). |

Disclaimer: authors’ private opinion; not necessarily Morgan Stanley or NBER policy. Comments: Pedersen; MS microstructure conference; GSAM; Rotman; NYU QFE.

---

## Problem / Motivation

Portfolio theory (Markowitz 1952) trades off risk and return for **holdings**. Execution literature (Almgren–Chriss 1999/2000; Almgren 2003; Grinold–Kahn 1999; Obizhaeva–Wang 2005; Bertsimas–Lo 1998) trades off expected cost vs cost variance for **trades**, often with a separate risk-aversion λ*.

Questions Engle–Ferstenberg answer:
1. Should execution use the **same** risk aversion as investment?
2. Do execution risks across names/times average out?
3. Does optimal trading depend on **other** portfolio holdings?
4. Should execution risks be **hedged** with non-order assets (e.g., futures)?

**Core claim:** investment and execution are **one** mean-variance problem with a **single** λ. Under standard assumptions, optimal execution of a target trade is independent of static holdings when targets are themselves MV-optimal; yet optimal programs may trade **hedge assets** not in the order. Dynamics with reversals/continuations change trajectories. The apparatus yields a natural **liquidity risk** measure (quantile / expected shortfall of liquidation P&L).

---

## Setup: Two Problems → One

### Portfolio problem
$$
\max \sum_{t=1}^T \big(\mathbb{E}(y_t)-\lambda\,V(y_t)\big)
$$
Dollar formulation equivalent to returns. Dynamic solutions: Merton; Constantinides; Colacito–Engle.

### Trading problem (implementation shortfall / arrival-price)
Position $x_t$ (shares); trade $\Delta x_t$; transaction price $\tilde p_t$; mid $p_t$; arrival $p_0$:
$$
TC=\sum_{t=1}^T \Delta x_t'(\tilde p_t-p_0)
$$
Also: $TC\%=TC/[(x_T-x_0)'p_0]$. Decomposition into spread vs impact:
$$
TC=\sum\Delta x_t'(\tilde p_t-p_t)+\sum(x_T-x_{t-1})'\Delta p_t
$$
Optimize $\min \mathbb{E}(TC)+\lambda^* V(TC)$.

### Unified accounting
Portfolio value $y_t=x_t'p_t+c_t$; $\Delta c_t=-\Delta x_t'\tilde p_t$ (zero rates, no dividends). Then
$$
\Delta y_t=x_{t-1}'\Delta p_t-\Delta x_t'(\tilde p_t-p_t)
$$
and the key identity:
$$
y_T-y_0=x_T'(p_T-p_0)-TC
$$

**Proposition 1.** Optimal MV trade trajectory solves
$$
\max_{\{x_t\}} \mathbb{E}\big(x_T'(p_T-p_0)-TC\big)-\lambda\,V\big(x_T'(p_T-p_0)-TC\big)
$$
Same λ as investment. Not variance sum—**covariances** between TC and capital gains matter.

**Two-step approximation** when holding period $T_2\gg T$: (i) choose target $x_T$ for investment window; (ii) take $x_T$ as given and optimize path $\{x_1..x_{T-1}\}$. Matches institutional order→broker workflow. Frequent traders / liquidity asset-pricing (Amihud–Mendelson; O’Hara; Easley–Hvidkjaer–O’Hara; Acharya–Pedersen) need joint optimization.

---

## Sharpe Ratio Implications

$$
SR=\frac{\mathbb{E}[x_T'(p_T-p_0)]-\mathbb{E}[TC]-r_f y_0 T}{\sqrt{T\cdot V(x_T'(p_T-p_0)-TC)}}
$$
with
$$
V(gain-TC)=V(gain)+V(TC)-2\mathrm{Cov}(gain,TC)
$$
**Sign of Cov:** buys—high TC when prices rise (also high portfolio gain) → Cov reduces net risk; sells—opposite, Cov raises risk.

**Mis-specified frontiers:**
1. Pure Markowitz (ignore TC entirely)
2. Cost-Adjusted Markowitz (subtract $\mathbb{E}[TC]$, ignore $V(TC)$)
3. True frontier (full objective)

Ordering of frontiers: Pure ≥ Cost-Adjusted ≥ True. Portfolios optimal under 1 or 2 lie **inside** the true frontier—planning error, not just ex-post disappointment.

---

## Distributional Assumptions and Solutions

**A.1:** $V_0(\tilde p_t-p_t|\{x\})=0$, $\mathbb{E}_0(\tilde p_t-p_t|\{x\})=\tau_t$ (instantaneous cost known given path).

**A.2:** $V_0(\Delta p_t|\{x\})=\Omega$, $\mathbb{E}_0(\Delta p_t|\{x\})=\mu+\pi_t$ (trades shift means, not conditional covariance).

Then:
$$
V(x_T'(p_T-p_0))=T\,x_T'\Omega x_T,\quad
V(TC)=\sum_t(x_T-x_{t-1})'\Omega(x_T-x_{t-1}),\quad
\mathrm{Cov}=\sum_t x_T'\Omega(x_T-x_{t-1})
$$
Net risk collapses to path of holdings:
$$
V(x_T'(p_T-p_0)-TC)=\sum_t x_{t-1}'\Omega x_{t-1}
$$

**Proposition 2.** Under A.1–A.2, optimize
$$
\max\sum_t\Big[x_{t-1}'(\mu+\pi_t)-\Delta x_t'\tau_t-\lambda\,x_{t-1}'\Omega x_{t-1}\Big]
$$

**A.3 (optimal target):** $x_T=\frac{1}{2\lambda}\Omega^{-1}\mu$.

**Proposition 3.** Under A.1–A.3, objective becomes
$$
\max\sum_t\Big[x_{t-1}'\pi_t-\Delta x_t'\tau_t+\lambda x_T'\Omega x_T-\lambda(x_T-x_{t-1})'\Omega(x_T-x_{t-1})\Big]
$$
**No longer depends on μ directly**—only on target $x_T$. Risk = variance of unfinished-trade TC. Buys and sells have symmetric risk as liquidations **regardless of other holdings**. Risk = distance from optimum each period.

---

## Almgren–Chriss Dynamics

**A.1.a:** $\tilde p_t-p_t=\mathrm{T}\,\Delta x_t$ (temporary impact matrix T).

**A.2.a:** $\Delta p_t=\Pi\Delta x_t+\mu+\varepsilon_t$, $\varepsilon\sim(0,\Omega)$ (permanent impact Π).

Huberman–Stanzel (2004): permanent impact must be time-invariant linear (no arb); temporary unrestricted.

$$
\mathbb{E}(TC)=\sum_t\big\{\Delta x_t'\mathrm{T}\Delta x_t+(x_T-x_{t-1})'(\mu+\Pi\Delta x_t)\big\}
$$
$$
V(TC)=\sum_t(x_T-x_{t-1})'\Omega(x_T-x_{t-1})
$$

Quadratic program → **closed form** trajectories.

**Proposition 4.** If permanent impact of traded on non-traded assets is zero (Π block-diagonal) and A.3 holds, **fixed holdings during the trade do not affect optimal execution of the traded names**. Surprising given Cov(TC, portfolio): for optimal targets, expected-return offset cancels the risk Cov effect.

### Three-period closed form
Holdings at 0 and T given; optimize midpoint $x_t$:
$$
x_t=\tfrac12(\Pi+2\mathrm{T}+\lambda\Omega)^{-1}\big[(\Pi+2\mathrm{T})x_0+(\Pi+2\mathrm{T}+2\lambda\Omega)x_T\big]
$$
- **Risk-neutral (λ=0):** half the trade by half time (classic).
- **Risk-averse:** advance trades—midpoint closer to $x_T$ than to $x_0$ (front-load). Holds for non-zero terminal positions, not only liquidations.

### Hedge trades in asset 2
Even if $x_{2,0}=x_{2,T}$, optimal path may trade asset 2 when Ω has cross terms:
$$
x_{2,t}=x_{2,T}-(\Pi_{22}+2\mathrm{T}_{22}+\lambda\Omega_{22})^{-1}\lambda\Omega_{12}(x_{1,t}-x_{1,T})
$$
For positive correlation: when buying asset 1 (so $x_{1,t}<x_{1,T}$), **also buy asset 2 then sell back**—unfinished book is long 2 / short relative 1 → hedges. If λ large or T₂≈0, hedge ratio → **beta of 2 on 1**. Implication: use **futures** as cheap hedge during equity execution.

**Simulation (20 periods):** risk-neutral flat pace; risk-averse front-loads; with second asset, primary trade **less aggressive**; higher cov ⇒ larger temporary hedge positions (Figures 1–2).

---

## Reversals and Continuations (Section VI)

Lag polynomials:
$$
\tilde p_t=p_t+\mathrm{T}(L)\Delta x_t,\qquad \Delta p_t=\Pi(L)\Delta x_t+\mu+\varepsilon_t
$$
- Transitory **continuation:** past buys keep $\tilde p$ elevated → continued program pays more.
- Permanent **continuation:** lagged Π>0 adds drift.
- Permanent **reversal:** lagged Π<0—buy into rising price that later drops (especially costly).

**Proposition 5.** Extend objective to $T_1\ge T+q$ with Π(L), T(L); still LQ closed form. Same λ for trade and investment.

**Simulation comparative statics (Figure 3):** permanent reversal → less aggressive; transitory continuation → less aggressive; transitory reversal → **more** early trades (even with permanent reversal)—coefficients matter.

---

## Liquidity Risk (Section VII)

Mark-to-market $y_0=p_0'x_0+c_0$ is not cash. Liquidating to $x_T=0$ yields random $y_T=c_T$ via TC distribution. Aggressive liquidation: high mean cost, low variance; slow: low mean, wide outcomes.

**Parallel to market-risk VaR:**
- Market risk: 1% quantile of 10-day marked P&L holding fixed.
- Liquidity risk: 1% quantile of cash after **optimal** liquidation over ~10 days.

Liquidity risk ≶ market risk: selling down reduces exposure (↓ risk) but directional impact cost may dominate. Because optimal paths **front-load**, extending allowed time often adds little—except for very large positions.

Prefer **expected shortfall** of liquidation cost beyond 99% quantile (McNeil et al.) over pure quantile.

Drivers: impact parameters (τ, π), Ω (vols/correlations). Impacts rise with volatility → liquidity risk **more than proportional** to vol. Crisis: counterparties share liquidity stress → inflate impact parameters (“liquidity black holes,” Persaud 2003) and recompute.

---

## Limitations

1. Theory paper—illustrative Excel sims, not large-scale empirical calibration.
2. A.1–A.2 rule out stochastic instantaneous costs and trade-dependent Ω (vol spike from trading).
3. Linear permanent impact may fail for huge metaorders.
4. Separation $T_2\gg T$ fails for high-turnover strategies.
5. Single λ mean-variance ignores higher moments / discontinuous liquidity.

---

## Practical Takeaways for a Quant Investor / Trader

1. **Use the same λ** in PMS and execution algos—splitting them is incoherent.
2. **Include TC variance and Cov(TC, gain)** in ex-ante SR; else realized SR disappoints and allocations are suboptimal.
3. **Front-load** when risk-averse; risk-neutral = even pace.
4. **Hedge unfinished execution** with cheap correlated instruments (index futures); hedge size ≈ beta × remaining; unwind as primary completes.
5. Static book doesn’t change primary path if Π block-diagonal and targets MV-optimal (Prop 4)—but **dynamic hedges still help**.
6. Estimate lag structure of impact; if permanent reversals exist, slow down; if transitory reversals, speed up.
7. Report **liquidity risk** as ES of optimal-liquidation TC alongside market VaR; stress by inflating impact in crisis scenarios.
8. Buys vs sells: asymmetric net risk via Cov—don’t symmetrize schedules naively.

## Equations Quick Reference

$$
y_T-y_0=x_T'(p_T-p_0)-TC
$$
$$
x_T=\tfrac1{2\lambda}\Omega^{-1}\mu\quad(A.3)
$$
$$
x_t=\tfrac12(\Pi+2T+\lambda\Omega)^{-1}[(\Pi+2T)x_0+(\Pi+2T+2\lambda\Omega)x_T]
$$

## Numerical / Qualitative Summary Box

| Result | Content |
|--------|---------|
| Single λ | Investment = execution risk aversion |
| Risk-neutral pace | 50% done at midpoint |
| Risk-averse pace | Front-loaded |
| Prop 4 | Fixed holdings irrelevant if Π block-diag + A.3 |
| Hedge rule | Temporary long (short) correlated asset when buying (selling) primary |
| Liquidity risk | ES/quantile of optimal liquidation TC |
| Crisis add-on | Inflate T, Π; recompute |

## Closing Synthesis

Engle–Ferstenberg (NBER 12165) unify portfolio choice and optimal execution under one mean-variance λ. With Almgren–Chriss impacts, paths are closed-form LQ: front-load under risk aversion; hedge with futures; ignore static holdings under block-diagonal permanent impact when targets are optimal. Reversal/continuation lags reshape schedules. Liquidity risk is the tail of liquidation TC under the optimal policy—natural complement to market VaR for a quant risk system.


---

## Institutional Mapping

**PM desk:** solves for $x_T$ using expected returns and Ω (possibly relative to benchmark). **Trading desk / algo:** receives $x_T-x_0$ parent order, estimates T, Π, short-horizon Ω, chooses schedule. Engle–Ferstenberg say both desks must share λ and the true objective—handing “minimize VWAP variance” with a different implicit λ breaks optimality.

**TCA implication:** evaluate algos on $\mathbb{E}[TC]+\lambda V(TC)$ with λ matched to fund, not on arrival-price mean alone.

**Multi-asset programs:** when rebalancing many names, solve joint LQ with full Π, T, Ω—cross impacts and hedges matter. Basket futures / ETF overlays implement asset-2 hedge cheaply.

## Worked Three-Period Intuition (scalar)

Suppose $x_0=0$, $x_T=Q>0$ (buy Q). Risk-neutral: $x_{mid}=Q/2$. As λ↑ or Ω↑ or T↓, $x_{mid}$ rises toward Q—more shares bought early to cut exposure time. Temporary impact T raises effective cost of fast trading, pulling back from extreme front-loading. Permanent Π interacts with remaining inventory in the objective.

## Connection to Broader Liquidity Asset Pricing

If many investors optimize jointly (not two-step), $x_T$ itself depends on expected TC and impact—liquidity enters equilibrium prices (Amihud–Mendelson 1986; Acharya–Pedersen 2005). Engle–Ferstenberg provide the micro foundation for that channel from the execution side.

## Replication / Calibration Agenda for a Desk

1. Estimate temporary and permanent impact (square-root or linear) by name and by volume regime.
2. Estimate short-horizon Ω (intraday or daily).
3. Fix fund λ from historical risk tolerance / utility calibration.
4. Solve discrete LQ schedule; compare to arrival, VWAP, POV baselines on $\mathbb{E}+\lambda V$.
5. Add one futures hedge; measure residual variance of unfinished program.
6. Build liquidation ES dashboard; stress Π, T ×2/×5 for crisis.

## Filename Note

Drive file `optimaltrading_Engle_2006.pdf` is NBER WP 12165 **Execution Risk**—index under execution/liquidity risk, not a generic “optimal trading” survey.


---

## Source-Anchored Deep Dive (from extracted PDF text)

### Source-anchored note

> The authors are indebted to Lasse Pedersen and participants in the Morgan Stanley Market Microstructure conference, Goldman Sachs Asset Management, Rotman School at University of Toronto and NYU QFE Seminar for helpful comments. This paper is the private opinion of the authors and does not necessarily reflect policy or research of Morgan Stanley. The views expressed herein are those of the author(s) and do not necessarily reflect the views of the National Bureau of Economic Research. ©2006 by Robert Engle and Robert Ferstenberg. All rights reserved. Short sections of text, not to exceed

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> two paragraphs, may be quoted without explicit permission provided that full credit, including © notice, Transaction costs in trading involve both risk and return. The return is associated with the cost of immediate execution and the risk is a result of price movements during a more gradual trading. The paper shows that the trade-off between risk and return in optimal execution should reflect the same risk preferences as in ordinary investment. The paper develops models of the joint optimization of positions and trades, and shows conditions under which optimal execution does not depend upon the

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> other holdings in the portfolio. Optimal execution however may involve trades in assets other than those listed in the order; these can hedge the trading risks. The implications of the model for trading with reversals and continuations are developed. The model implies a natural measure of liquidity Department of Finance, Stern School of Business The trade-off between risk and return is the central feature of both academic and practitioner finance. Financial managers must decide which risks to take and how much

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> to take. This involves measuring the risks and modeling the relation between risk and return. This setting is the classic framework for optimal portfolio construction pioneered by Markowitz(1952) and now incorporated in all textbooks. Although much attention has been paid to the cost of trading, little has been devoted to the risks of trading. Analysis has typically focused on the costs of executing a single trade or, in some cases, a sequence of trades. In a series of papers, Almgren and

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> Chriss(1999)(2000) and Almgren(2003) and Grinold and Kahn (1999), and most recently Obizhaeva and Wang(2005) developed models to focus on the risk of as well the mean What is this risk? There are many ways to execute a trade and these have different outcomes. For example, a small buy order submitted as a market order will most likely execute at the asking price. If it is submitted as a limit order at a lower price the execution will be uncertain. If it does not execute and is converted to a market order

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> at a later time or to another limit order the ultimate price at which the order is executed will be a random variable. This random variable can be thought of as having both a mean and a confidence interval. In a mean variance framework, often we consider the mean to be the expected cost while the variance is the measure of the risk of this transaction. More generally for large trades, the customer can either execute these immediately by sending them to a block desk or other intermediary who will take on the

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> risk, or executing a sequence of smaller trades. These might be planned and executed by a floor broker, by an in-house trader, an institutional trader, or by an algorithmic trading system. The ultimate execution will be a random variable primarily because some portions of the trade will be executed after prices have moved. The delay in trading introduces price risk due to price movements beyond that which can be anticipated as a natural response to the trade itself. Different trading strategies will have different

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> probability distributions of the costs and thus customers will need to choose the trading This paper addresses the relation between the risk return trade-off that is well understood for investment and the risk return trade-off that arises in execution. For example, would it be sensible to trade in a risk neutral fashion when a portfolio is managed very conservatively? Will execution risk on different names and at different times, average out to zero? Should the transaction strategy depend on what else is in the

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> portfolio? Should execution risks be hedged? In this paper we will integrate the portfolio decision and the execution decision into a single problem to show how to optimize these choices jointly. In this way we will answer the four questions posed above and many others. The paper initially introduces the theoretical optimization problems in section II and synthesizes them into one problem in section III. Section IV discusses the

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> implications of trading strategy on the Sharpe Ratio. A specific assumption is made on price dynamics in Section V leading to specific solutions for the optimal trades. This section also shows the role of non-traded assets. Section VI introduces more sophisticated dynamics allowing reversals. Section VII uses this apparatus to discuss measures of liquidity risk and section VIII concludes. The classic portfolio problem in its simplest form seeks portfolios with minimum

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> variances that attain at least a specific expected return. If y is the portfolio value, the min V ( y )                                      (1) In this expression, the mechanism for creating the portfolio is not explicitly indicated, nor is the time period specified. Let us suppose that the portfolio is evaluated over the period (0,T) and that we define the dollar returns on each period t=0,1,…,T. The dollar return on the full period is the sum of the dollar returns on the individual periods. Furthermore,

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> the variance of the sum is the sum of the variances of the individual periods, at least if there is no autocorrelation in returns. The problem can then be formulated as min                       V ( yt )                  (2) By varying the required return, the entire efficient frontier can be mapped out. The optimal point on this frontier depends upon the tolerance for risk of the investor. If we define the coefficient of risk aversion to be λ, then the solution obtained in one step is:

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> Generally this problem is defined in returns but this dollar-based formulation is equivalent. If there is a collection of assets available with known mean and covariance matrix, then the solution to this problem yields an optimal portfolio. Often this problem is reformulated relative to a benchmark. Thus the value of the portfolio at each point in time as well as the price of each asset at each point in time is measured relative to the benchmark portfolio. This will not affect anything in the subsequent analysis.

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> Treating each of the sub periods separately could then solve this problem; however, this would not in general be optimal. Better solutions involve forecasts and dynamic programming or hedge portfolios. See inter alia Merton(1973), Constantinides(1986), Colacito and Engle(2004). The classic trading problem is conveniently formulated with the "implementation shortfall" of Perold(1988). This is now often described as measuring trading costs

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> relative to an arrival price benchmark. See for example Chan and Lakonishok(1995), Grinold and Kahn(1999), Almgren and Chriss(1999)(2000) Bertismas and Lo(1998) If a large position is sold in a sequence of small trades, each part will trade at potentially a different price. The average price can be compared with the arrival price to determine the shortfall. Let the position measured in shares at the end of time period t be xt so that the trade is the change in x. Let the transaction price at the end of time period t

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> be p t and the fair market value measured perhaps by the midquote be pt . The price at the time the order was submitted is p0, so the transaction cost in dollars is given by TC =              ∆x t ' ( p t − p 0 ) .                      (4) Since in the liquidation example, the change in position is negative, a transaction price below the arrival price corresponds to positive transaction costs. If on the other hand the trade is a purchase, then the trades will be positive and if the executed price rises the

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).
