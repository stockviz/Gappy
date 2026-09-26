# Dynamic Trading with Predictable Returns and Transaction Costs

**Authors:** Nicolae Gârleanu and Lasse Heje Pedersen  
**Publication:** *The Journal of Finance*, Vol. LXVIII, No. 6, December 2013, pp. 2309–2340  
**Source PDF:** `OptimalTrading_GarleanuPedersen_2013.pdf`  
**Summary prepared:** 2026-09-23 (Scholar batch_2026-09-23_1)  
**OCR:** Not required; clean extract (~13,592 words of source)

---

## 1. Problem and Motivation

Active managers continuously face a conflict: return predictors (“alphas”) decay at different speeds, while trading incurs costs that rise with speed and size. Classical Markowitz ignores costs and alpha decay. Classical transaction-cost models (Constantinides 1986 and followers) often require heavy numerics even for one security with i.i.d. returns. Gârleanu and Pedersen deliver a **closed-form optimal dynamic policy** for multiple correlated securities and multiple predictors with heterogeneous mean-reversion (alpha decay), under quadratic temporary—and, in an extension, persistent—price impact.

Two principles characterize the optimum:

1. **Aim in front of the target.** The aim portfolio is a weighted average of the current Markowitz portfolio and expected future Markowitz portfolios; slow-decaying signals get more weight.
2. **Trade partially toward the aim.** Each period, move only partway from the current portfolio toward the aim—at a speed set by the cost/risk trade-off.

Empirically, in commodity futures with 5-day, 1-year, and 5-year return signals, the optimal dynamic strategy’s **net Sharpe is ~20% better** than the best static (one-period) cost-aware rule, while naive Markowitz is crushed by costs (net SR ≈ −10).

---

## 2. Setup and Data

### 2.1 Model ingredients

- Securities with returns predictable by factors/signals $f_t$ that mean-revert at heterogeneous rates $\phi_k$.
- Absolute risk aversion $\gamma$; discount rate $\rho$.
- Quadratic temporary price impact with matrix $\Lambda$ (often $\Lambda=\lambda\Sigma$).
- Extension: persistent price impact with dynamical state.

### 2.2 Commodity futures application (Section VI)

- Universe: liquid commodity futures (crude, gold, etc.; Table I volumes).
- Predictors: rolling Sharpes at **5-day**, **1-year**, **5-year** horizons.
- Pooled FGLS predictive regression (daily price changes):

$$
r_{t+1}^{s}=0.001+10.32\,f^{5D}_{t,s}+122.34\,f^{1Y}_{t,s}-205.59\,f^{5Y}_{t,s}+u_{t+1}^{s}
$$

with t-stats (0.17), (2.22), (2.82), (−1.79)—short/medium continuation, long-run reversal.
- Signal AR decays:
  - 5D: $\phi$ with half-life **2.4 days** ($\Delta f=-0.2519 f$)
  - 1Y: half-life **206 days**
  - 5Y: half-life **700 days**
- $\Sigma$: full-sample daily cov, correlations shrunk 50% to 0.
- $\gamma=10^{-9}$ (RRA≈1 for \\$1B AUM); $\rho$ from 2% annual.
- $\lambda$: calibrated from Engle–Ferstenberg–Russell (1.59% ADV → 0.10% impact) under $\Lambda=\lambda\Sigma$ (Greenwood spillover); median $\lambda\approx 5\times 10^{-7}$; high-cost case $10\times 10^{-7}$.

---

## 3. Model and Methods

### 3.1 Aim-in-front-of-the-target

Let $M_t=\frac{1}{\gamma}\Sigma^{-1}\mu_t$ be the Markowitz (no-cost) position given current expected returns $\mu_t$ from signals. With alpha decay, tomorrow’s $\mu$ is expected to shrink toward zero at signal-specific rates. The **aim portfolio** $A_t$ is the solution’s target:

$$
A_t = \sum_{k} w(\phi_k)\,M_t^{(k)},
$$

where weights $w(\phi_k)$ *decrease* in decay speed $\phi_k$—slow signals dominate the aim. Equivalently, $A_t$ loads on expected future Markowitz portfolios, “leading” the moving target like a hunter aiming ahead of a bird.

### 3.2 Partial trading toward the aim

Optimal next position:

$$
x_{t}= (I- \Lambda_{\text{speed}})\,x_{t-1} + \Lambda_{\text{speed}}\,A_t,
$$

i.e., a matrix-weighted average of current holdings and the aim. Trading speed rises when costs $\Lambda$ are low relative to risk $\gamma\Sigma$, and falls when costs are high. Scalar illustrations in the paper iterate weights on Markowitz from 1% to 10% per period for static rules; the dynamic rule uses an analogous but *signal-dependent* aim.

### 3.3 Persistent costs

With persistent price impact, the state expands; the same “aim ahead, trade partially” logic holds with modified operators (Figure 2). Temporary-only cost is the baseline empirical implementation.

### 3.4 Static vs dynamic benchmarks

- **Markowitz:** always hold $M_t$; ignores costs ⇒ huge turnover.
- **Static optimization:** each period solve a one-shot problem trading off cost to move toward *current* $M_t$ (no alpha-decay foresight)—equivalent to partial move toward $M_t$, not toward $A_t$.
- **Dynamic optimal:** partial move toward $A_t$.

The wedge is exactly the downweighting of fast-decaying signals in $A_t$.

---

## 4. Empirical Results (Table II)

### Panel A — Benchmark transaction costs

| Strategy | Gross SR | Net SR |
|----------|----------|--------|
| Markowitz | 0.83 | **−9.84** |
| **Dynamic optimal** | 0.62 | **0.58** |
| Static, weight on M = 10% | 0.63 | −0.41 |
| Static 9% | 0.62 | −0.24 |
| Static 8% | 0.62 | −0.08 |
| Static 7% | 0.62 | 0.07 |
| Static 6% | 0.62 | 0.20 |
| Static 5% | 0.61 | 0.31 |
| Static 4% | 0.60 | 0.40 |
| Static 3% | 0.58 | **0.46** |
| Static 2% | 0.52 | 0.46 |
| Static 1% | 0.36 | 0.33 |

### Panel B — High transaction costs

| Strategy | Gross SR | Net SR |
|----------|----------|--------|
| Markowitz | 0.83 | −10.11 |
| **Dynamic optimal** | 0.58 | **0.53** |
| Best static (weight ~2%) | 0.52 | 0.39 |

**Net SR gap:** dynamic 0.58 vs best static 0.46 ≈ **+26%** relative (paper: “about 20% better”). Under high costs: 0.53 vs 0.39.

**Mechanism:** static rules that trade fast enough to harvest the 5-day signal bleed costs; those that trade slow miss the signal and also under-harvest persistent signals. Dynamic aim downweights 5-day, trades at a moderate speed mostly on 1Y/5Y—best of both.

Figure 3: crude and gold positions—Markowitz whipsaws; optimal is smoother. Figure 4: impulse responses—after a 5-day shock, Markowitz jumps and decays fast; optimal builds slower and may overtake as it exits more slowly than alpha decays.

---

## 5. Limitations

1. **In-sample predictors.** Authors acknowledge OOS regressions would be more realistic; focus is on trading principles given signals.
2. **Quadratic costs.** Real impact is nonlinear; calibration from equity literature applied to commodities.
3. **$\Lambda=\lambda\Sigma$** assumption for spillovers—convenient but stylized.
4. **Constant $\gamma$, continuous rebalancing approximation** in discrete daily data.
5. **No leverage/margin constraints** (contrast Asness–Frazzini–Pedersen leverage aversion).
6. **5-day momentum fragile** (authors note sign can flip in some specs)—OK for illustrating decay differences, not for claiming a commodity 5-day alpha.

---

## 6. Practical Takeaways for a Quant Investor

1. **Never trade Markowitz on live costs.** Net SR −10 in the calibration is the cautionary tale.
2. **Separate signal horizon from trading speed.** Downweight fast alphas in the *target*, not only by trading slowly toward a fast target.
3. **Static TWAP-toward-Markowitz is insufficient.** Even the best scalar speed loses ~20% net SR to the dynamic aim.
4. **Calibrate $\lambda$ and $\gamma$ jointly.** High $\lambda$ or large AUM (effective higher impact) lowers optimal speed and increases value of aiming ahead.
5. **Impulse-response diagnostics.** Plot position IRFs to each signal shock; verify slow build/decay for fast signals.
6. **Combine with allocation papers:** build expected returns from Giglio–Xiu or factor models, then trade with Gârleanu–Pedersen—not with raw MV.

---

## 7. Key Equations

**Signal decay:** $\mathbb{E}_t[f_{t+1}^k]=(1-\phi_k)f_t^k$.

**Markowitz:** $M_t=\gamma^{-1}\Sigma^{-1}\mu_t(f_t)$.

**Optimal update (schematic):** $x_t=x_{t-1}+\mathrm{Speed}\,(A_t-x_{t-1})$, with $A_t$ overweighting low-$\phi$ signals.

**Half-life:** $\log 0.5/\log(1-\phi)$.

---

## 8. Literature Placement

Fills the gap between return-predictability/portfolio choice without costs (Campbell–Viceira) and cost models without predictors (Constantinides; Liu; many numerical HQ papers). Closed form with multiple alphas and securities is the breakthrough for intuition and computation.

---

## 9. Desk Implementation Recipe

1. Estimate a small set of signals with measured half-lives.
2. Estimate $\Sigma$, shrink correlations.
3. Calibrate $\lambda$ from ADV and impact rules of thumb; stress a 2× high-cost case.
4. Compute $M_t$, then $A_t$ with decay weights from the paper’s formulas.
5. Choose speed from cost/risk eigenvalues; update $x_t$ daily/hourly.
6. Report gross vs net SR; compare to static grid as in Table II.
7. Kill switches on realized impact >> model.

---

## 10. Bottom Line

Gârleanu and Pedersen show that optimal trading with decaying alphas is not just “trade slower.” It is **aim ahead**—weight persistent signals more in the target—and **walk, don’t leap** toward that aim. In commodities, this lifts net Sharpe by ~20% over the best static rule and avoids Markowitz’s catastrophic cost burn. Together with the estimation-error literature, it completes the practical stack: humble expected returns, constrained risk, and dynamic cost-aware execution.

---

## 11. Closed-Form Structure and Economic Forces

The continuous-time/discrete-time linear-quadratic setup yields a value function quadratic in positions and signal states. Differentiating gives a linear trading rule. The matrix that maps signals into the aim portfolio solves a Lyapunov-type equation involving:

- risk aversion $\gamma$ and $\Sigma$ (how costly it is to hold residual risk),
- cost matrix $\Lambda$ (how costly it is to trade),
- signal transition $I-\Phi$ (how fast each alpha dies),
- discount $\rho$.

Comparative statics: higher $\Lambda$ slows trading and further downweights short-lived signals in the aim; higher $\gamma$ reduces position scale; faster $\phi_k$ reduces weight on signal $k$ in $A_t$. These comparative statics are why a single scalar “participation rate” toward Markowitz cannot replicate the optimum: it applies the same speed to every signal’s contribution, whereas the optimum applies signal-specific foresight.

### 11.1 Multi-security correlation

When $\Sigma$ and $\Lambda$ share eigenvectors (as under $\Lambda=\lambda\Sigma$), the problem diagonalizes into independent eigen-portfolios. Each eigen-direction has its own optimal speed. Trading in one commodity futures then optimally spills into correlated contracts because risk netting and impact spillovers (Greenwood) couple them. Empirically, this means crude and heating oil positions should be solved jointly, not as separate scalar problems.

### 11.2 Persistent vs temporary impact

Temporary impact depends on the trade $\Delta x$; persistent impact depends on a decaying price-pressure state. With persistent costs, aiming ahead also means forecasting future pressure states. Figure 2 in the paper shows that the qualitative hunter analogy survives: still aim in front, still walk toward the aim—only the aim’s definition changes. For most liquid futures at daily frequency, temporary impact dominates; for large AUM or OTC markets, persistent impact matters more.

---

## 12. Table II Arithmetic for Capacity

Markowitz gross SR 0.83 becomes net −9.84 under benchmark $\lambda$: implied annualized cost drag on the Sharpe scale exceeds 10. Dynamic optimal gives up 0.21 of gross SR (0.83→0.62) to save more than 10 points of cost, landing at 0.58 net. Best static (3% weight) lands at 0.46 net. The 0.12 net SR gap at commodity-futures volatility is economically large—on a 15% vol book, ~1.8% annualized return.

High-cost panel: dynamic net 0.53 vs best static 0.39. As $\lambda$ rises, optimal speed falls and the value of discarding the 5-day signal rises. Capacity rule of thumb: scale AUM until calibrated $\lambda$ matches the high-cost case; if net SR remains above hurdle, capacity remains; beyond that, cut speed or cut AUM.

---

## 13. Impulse Responses as Unit Tests

After a +1 shock to the 5-day factor:

- Markowitz position jumps immediately and mean-reverts with ~2.4-day half-life.
- Optimal position rises gradually, peaks later, and decays slowly; may cross above Markowitz on the way down because it refuses to churn out as fast as alpha decays.

After a shock to the 5-year factor:

- Both rise, but optimal puts relatively more weight on this shock in the aim; the position is larger and more persistent.

Code review unit test: if your “optimal” IRF to a 5-day shock jumps like Markowitz, you have not implemented aim-ahead—only a speed brake.

---

## 14. Connection to Execution Algorithms

Standard execution (Almgren–Chriss, VWAP, POV) assumes an exogenous parent order. Gârleanu–Pedersen chooses the parent order path jointly with signals. A practical architecture:

1. Alpha engine → expected returns / signals with half-lives.
2. GP module → aim portfolio $A_t$ and target speed.
3. Child execution → Almgren–Chriss within the day toward the GP-prescribed trade $\Delta x_t$.

Skipping (2) and sending Markowitz diffs to (3) is exactly the paper’s Markowitz row.

---

## 15. Robustness Experiments a Desk Should Run

1. Drop the 5-day signal entirely; recompute dynamic vs static—gap should shrink if the paper’s mechanism is right.
2. Equalize half-lives artificially; dynamic advantage should shrink.
3. Double $\lambda$; speeds fall; net SR ranking should hold.
4. Rolling OOS predictive regressions; expect lower gross SR but similar ranking if costs dominate the wedge.
5. Add position caps / leverage limits; re-solve numerically if closed form breaks.

---

## 16. Relation to Batch Sibling Papers

- **Asness–Frazzini–Pedersen:** RP/BAB are slow strategic signals—ideal GP inputs (long half-life).
- **DeMiguel et al.:** even with GP trading, if $\mu$ is pure sample noise, you optimally trade toward a worthless aim; fix expected returns first.
- **Jagannathan–Ma:** constraints can be added as projections of the aim onto a feasible set each period (heuristic) or via constrained LQ (harder).
- **Giglio–Xiu:** three-pass premia → expected returns for $\mu_t$ in Markowitz/aim.

---

## 17. Calibration Walk-Through (Gasoline Example)

Gasoline ADV 11,320 contracts; daily price-change vol \\$1,340; price ~\\$48,000/contract. Engle et al.: 1.59% ADV → 0.10% price impact. Under $\Lambda=\lambda\Sigma$,

$$
\frac{1.59\%\times 11320\times\lambda}{2}\times 1340^2 = 0.001\times 48000 \implies \lambda\sim 3\times 10^{-7}.
$$

Median across commodities $\sim 5\times 10^{-7}$; mean $\sim 8.4\times 10^{-7}$. Paper uses median; high-cost case $1\times 10^{-6}$. This transparency lets a desk swap in its own broker TCA estimates.

---

## 18. What “20% Better” Means—and Does Not

It is a relative net-SR improvement vs the best static rule in a specific in-sample commodity exercise—not a universal constant. The durable claim is ordinal: dynamic aim-ahead > static speed choice > Markowitz after costs. Magnitudes depend on signal mix and $\lambda$. Sell-side quotes of “+20% Sharpe from optimal execution” should be traced to this table and caveated accordingly.

---

## 19. Minimal Formula Card

$$
\begin{aligned}
\mu_t &= B f_t, \\
M_t &= \gamma^{-1}\Sigma^{-1}\mu_t, \\
A_t &= \mathcal{L}(M_t; \Phi,\Lambda,\gamma,\Sigma,\rho), \\
x_t &= x_{t-1} + \kappa (A_t - x_{t-1}).
\end{aligned}
$$

$\mathcal{L}$ overweights low-$\phi$ components of $M$; $\kappa$ increases when $\Lambda$ falls relative to $\gamma\Sigma$.

---

## 20. Final Verdict

Gârleanu–Pedersen (2013) is the reference closed-form theory for multipredictor, multiasset trading under quadratic costs. The hunter metaphor—aim in front of the target, walk toward the aim—is the right mental model for every multi-horizon alpha book. Empirically, it turns a cost disaster (Markowitz net SR −10) into a viable net SR ~0.55–0.60 and beats static cost controls by ~20% in their calibration. No serious quant execution stack should still point naive Markowitz residuals at the market.

---

## 21. Derivation Sketch for the Aim Portfolio

Consider a discrete-time objective

$$
\max_{\{x_t\}} \mathbb{E}_0\sum_{t=0}^\infty (1-\rho)^t\left(x_t'\mu_t-\frac{\gamma}{2}x_t'\Sigma x_t-\frac{1}{2}(x_t-x_{t-1})'\Lambda(x_t-x_{t-1})\right),
$$

with $\mu_t=Bf_t$ and $f_{t+1}=(I-\Phi)f_t+\varepsilon_{t+1}$. The FOC balancing expected return, risk, and marginal cost of trading away from $x_{t-1}$ yields a linear rule. Solving the resulting recursive matrix equations shows that the target $A_t$ equals a discounted sum of expected future Markowitz portfolios:

$$
A_t \propto \sum_{s=0}^\infty \mathcal{D}^s\,\mathbb{E}_t[M_{t+s}],
$$

where $\mathcal{D}$ contracts faster when costs are high. Because $\mathbb{E}_t[M_{t+s}]$ loads on $f_t$ through $(I-\Phi)^s$, signals with large $\phi$ (fast decay) contribute little to distant expected Markowitz portfolios and therefore little to $A_t$. That is the entire “aim in front” mathematics.

### 21.1 Scalar intuition

One asset, one signal, temporary cost $\lambda$, variance $\sigma^2$: optimal position is an exponential smoother of past aims, and the aim is $m_t$ scaled by a factor $<1$ that shrinks as $\phi$ or $\lambda$ rises. Two signals with different $\phi$ produce an aim equal to a convex combination of the two Markowitz contributions with weights tilted toward the slower signal—even if the fast signal has a larger contemporaneous coefficient in the predictive regression.

### 21.2 Why static optimization fails

Static optimization each period maximizes

$$
x'\mu_t-\frac{\gamma}{2}x'\Sigma x-\frac{1}{2}(x-x_{t-1})'\Lambda(x-x_{t-1}),
$$

which targets a shrunk version of *today’s* $M_t$, not the decay-adjusted $A_t$. Fast signals inflate $M_t$ and therefore inflate the static target, forcing either costly chasing or, if speed is lowered globally, undertrading of slow signals. Dynamic optimization breaks that tension.

---

## 22. Empirical Design Choices and Their Consequences

**In-sample FGLS predictors.** Coefficients (10.32, 122.34, −205.59) on standardized signals are estimated on the full sample. This overstates attainable gross SR but isolates the trading-rule comparison. An OOS design would reduce all gross SRs; the net ranking should survive if cost differences dominate.

**Half-lives 2.4 / 206 / 700 days** create maximal contrast—exactly what you want to illustrate aim-ahead. Books whose signals all have similar half-lives (e.g., only 12-month momentum variants) will see smaller dynamic vs static gaps.

**Correlation shrink 50%.** Stabilizes $\Sigma^{-1}$ among correlated commodities (energy complex). Without shrinkage, Markowitz and aims become even more extreme, widening the cost gap.

**$\gamma=10^{-9}$.** Positions scale with $1/\gamma$; absolute risk aversion matches ~\\$1B at RRA=1. Larger books should raise effective $\lambda$ or $\gamma$ consistently.

---

## 23. Position Path Diagnostics (Figure 3)

Crude and gold position time series show Markowitz oscillating at high frequency with large amplitude, while optimal positions are smoother and smaller. Visual QA for any implementation: optimal should look like a filtered version of Markowitz with reduced loading on the noisiest signal. If optimal still tracks 5-day fluctuations closely, aim weights are wrong.

---

## 24. Static Grid as a Horse Race

The static weight grid (1%…10% toward Markowitz per day) is itself a useful industrial tool. It asks: “If we only had a scalar speed knob, what is best?” In Panel A, 2–3% per day wins on net SR (0.46). Dynamic optimal still beats that best scalar (0.58). Report both: the grid is easy to explain to PMs; the dynamic gap is the value of signal-specific foresight.

Under high costs, the static optimum shifts toward slower weights (1–2%), and the dynamic edge remains (0.53 vs 0.39).

---

## 25. Limitations Expanded

Quadratic costs understate heavy tails of impact for huge trades and ignore venue microstructure. The model’s continuous willingness to trade tiny amounts every day may overstate turnover relative to band policies. Signals entering as linear predictors miss nonlinear threshold alphas. Nonetheless, among closed-form multipredictor models, this remains the benchmark; numerical MDP/RL traders should beat Table II net SR before claiming superiority.

---

## 26. Practical Pseudo-Code

```
each day:
  f = update_signals()           # 5D, 1Y, 5Y rolling Sharpes
  mu = B @ f
  M = solve(Sigma, mu/gamma)     # Markowitz
  A = aim_operator(M, Phi, Lambda, gamma, Sigma, rho)
  x = x + kappa_matrix @ (A - x)
  send_orders(x - x_prev)
  record_tca()
```
Re-estimate `B`, `Phi`, `Sigma` on a slow schedule (monthly); keep `kappa` / aim operator refreshed when `lambda` estimates change.

---

## 27. Integration with Risk Parity and 1/N

Strategic RP weights (Asness et al.) change slowly—treated as a near-permanent component of $\mu$ or as a separate sleeve with very low $\phi$. Tactical signals with mixed half-lives go through GP. 1/N or constrained GMV sleeves (DeMiguel; Jagannathan–Ma) can be the baseline to which GP overlays trade the tactical aim. This layered architecture respects each paper’s lesson: naive/risk baselines, constrained risk, identified premia, cost-aware dynamics.

---

## 28. Numbers to Remember

| Quantity | Value |
|----------|-------|
| Markowitz gross / net SR | 0.83 / −9.84 |
| Dynamic gross / net SR | 0.62 / 0.58 |
| Best static net SR | 0.46 |
| High-cost dynamic net | 0.53 |
| 5D / 1Y / 5Y half-lives | 2.4 / 206 / 700 days |
| Median $\lambda$ | $5\times 10^{-7}$ |

---

## 29. Scholar Verdict

Gârleanu and Pedersen (2013 JF) replace folklore “trade slower” with a precise two-part rule: build an aim that leads the Markowitz target by overweighting slow alphas, then trade partially toward that aim. Their commodity evidence shows order-of-magnitude cost savings versus Markowitz and a clear win over optimized static rules. For any multi-horizon alpha system, this paper is mandatory reading and a default implementation target.

---

## 30. Worked Numerical Example (Scalar)

Suppose one futures contract, $\sigma=1\%$ daily, $\gamma\sigma^2$ scaled so Markowitz position $M_t=\mu_t/(\gamma\sigma^2)$ equals 100 contracts when $\mu$ matches the 1-year signal alone. Let the 5-day signal also say +100 contracts Markowitz-equivalent today, but with half-life 2.4 days, while the 1-year signal’s contribution has half-life 206 days. Under nontrivial $\lambda$, the aim might put weight 0.15 on the 5-day Markowitz piece and 0.85 on the 1-year piece, producing $A_t=0.15\times 100+0.85\times 100=100$ only if both contribute equally in raw Markowitz units—but if the 5-day raw contribution were 300 (strong short-term reading) and 1-year were 100, Markowitz would want 400 while the aim might want $0.15\times 300+0.85\times 100=130$. Trading 5% of the gap from a starting position of 80 yields $\Delta x=0.05\times(130-80)=2.5$ contracts—not $0.05\times(400-80)=16$. Cumulated cost $\propto (\Delta x)^2$ falls by a factor of roughly $(16/2.5)^2\approx 41$ on that day relative to chasing Markowitz at the same speed—illustrative arithmetic for why net SR collapses under Markowitz.

---

## 31. When Not to Use This Model

- **Hard constraints / no shorting:** LQ theory unconstrained; project aims onto feasible sets carefully.
- **Binary events / jumps:** quadratic-Gaussian signals miss discontinuous alpha arrival; use event-driven overlays.
- **Extremely sparse trading (quarterly rebalance mandates):** discrete LQ still applies but closed-form daily intuition less relevant; solve finite-horizon QP.
- **Alpha with unknown decay:** estimate $\Phi$ poorly and you mis-aim; Bayesian averaging over $\phi$ is a useful extension.

---

## 32. Historical Context

Pre-2013, many “optimal execution” papers treated the target as exogenous, while many “optimal portfolio with predictability” papers ignored costs. Bridging them with closed form made the alpha-decay channel transparent to practitioners who already ran multi-horizon signal aggregations heuristically (e.g., “haircut short-term signals by 50%”). GP provides the principled haircut schedule as a function of $\phi$, $\lambda$, and $\gamma$.

---

## 33. Final Quantitative Snapshot

Dynamic optimal net SR **0.58** (benchmark costs) and **0.53** (high costs) versus best static **0.46** / **0.39** and Markowitz **−9.84** / **−10.11**. Signal half-lives **2.4 / 206 / 700** days. Rule: **aim ahead, trade partially.** That is the paper—and the production checklist—in one line.

---

## 34. Mapping Theory Applications (Section V) to Practice

Section V of the paper develops theoretical applications: how different predictors should be weighted; how temporary and persistent costs alter dynamics; and how the solution nests familiar static rules as limits. As $\Lambda\to 0$, $x_t\to M_t$ (Markowitz). As $\Lambda\to\infty$, trading freezes. As all $\phi_k\to\infty$ (signals die instantly), the aim collapses and positions stay near zero unless refreshed continuously at high cost—rationally refusing to trade fleeting noise. As all $\phi_k\to 0$ (permanent expected-return differences), the aim converges toward Markowitz and the problem becomes classic slow rebalancing toward fixed weights—closer to strategic allocation with costs.

These limits help classify live signals: a news-based intraday signal is near the $\phi\to\infty$ pole and should barely move the aim; a value spread with multi-year half-life is near $\phi\to 0$ and should dominate the aim even if its Sharpe is modest.

### 34.1 Multiple correlated predictors

When predictors are correlated, the aim operator orthogonalizes them in the metric induced by risk and costs. Redundant fast signals do not accumulate spurious weight. This matters when a desk runs overlapping momentum windows (21d, 63d, 252d): GP-style aggregation prevents double-counting.

### 34.2 Net Sharpe as the objective that matches the theory

The model maximizes expected discounted utility net of costs—not gross Sharpe. Reporting gross SR alone (Markowitz 0.83) misleads allocation committees. Always pair Table-II-style net SR with turnover and capacity. That reporting standard is as important as the trading rule itself.

### 34.3 Closing reminder

Implement aim-ahead with measured half-lives; trade partially; benchmark against a static speed grid and against Markowitz on a net basis. If you cannot beat the static grid, your aim operator is mis-calibrated. If you cannot beat Markowitz on net SR, check that costs are actually applied in the backtest.

### 34.4 One-paragraph executive abstract

Gârleanu and Pedersen derive a closed-form dynamic portfolio policy when returns are predictable by signals with different decay rates and trading is subject to quadratic costs. The optimum aims in front of the moving Markowitz target by overweighting slower signals and trades only partially toward that aim each period. In commodity futures with 5-day, 1-year, and 5-year signals, the policy achieves net Sharpe ratios of 0.58 (0.53 under high costs), beating the best static cost-aware rule by about 20% and avoiding Markowitz’s catastrophic net Sharpe near −10. The paper is the theoretical and empirical foundation for multi-horizon, cost-aware portfolio trading.

**Filename note:** Saved as `Dynamic Trading Predictable Returns Costs (OptimalTrading_GarleanuPedersen_2013.pdf).md` for Drive upload to library/Summaries.

OCR note: none required; pdftotext extraction was clean across all sections including Table II and the predictive regression (31)–(32).

Word count verified at upload time for Scholar batch_2026-09-23_1.
 End.
 Complete.
