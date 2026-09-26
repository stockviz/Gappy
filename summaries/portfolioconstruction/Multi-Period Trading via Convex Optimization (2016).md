# Multi-Period Trading via Convex Optimization (2016)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/MultiPeriodOptimization_BoydBussetiDiamondKoh.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

## 1. Metadata

- **Title:** Multi-Period Trading via Convex Optimization
- **Author(s):** Stephen Boyd, Enzo Busseti, Steven Diamond, Ronald N. Kahn, Kwangmoo Koh, Peter Nystrup, and Jan Speth
- **Year:** 2016
- **Journal/Venue:** *Foundations and Trends in Optimization*

## 2. Problem statement

The paper asks how to turn forecasts of returns, risks, volumes, and costs into implementable single-period and multi-period trading decisions for large portfolios under realistic convex constraints. The mathematical problem is to choose trades over time that maximize risk-adjusted realized portfolio performance net of transaction and holding costs, while respecting self-financing and portfolio constraints.

## 3. Approach (short)

The method is convex optimization with model predictive control. The authors formulate a normalized portfolio-trading model, write a single-period trading problem that trades off expected return, risk, transaction cost, and holding cost, and then extend it to a multi-period look-ahead problem in which only the first-period trade is executed. The framework is explicitly designed for large practical portfolios and convex solvers.

## 4. Approach (detailed)

1. **Model holdings, trades, and self-financing.**

   Let $w_t$ be normalized pre-trade portfolio weights and $z_t$ normalized trades. The post-trade portfolio is
   $$
   w_t^+ = w_t + z_t.
   $$
   Self-financing requires
   $$
   \mathbf 1^\top z_t + \phi_t^{trade}(z_t)+\phi_t^{hold}(w_t+z_t)=0,
   $$
   where $\phi_t^{trade}$ is transaction cost and $\phi_t^{hold}$ is holding cost (for example short-borrow cost).

2. **Write the single-period problem.**

   With return forecast $\hat r_t$ and risk penalty $\psi_t(\cdot)$, choose $z_t$ to solve
   $$
   \max_{z_t}\ \hat r_t^\top z_t - \hat\phi_t^{trade}(z_t)-\hat\phi_t^{hold}(w_t+z_t)-\gamma_t \psi_t(w_t+z_t)
   $$
   subject to:
   - trading constraints $z_t\in \mathcal Z_t$,
   - holding constraints $w_t+z_t\in \mathcal W_t$,
   - the self-financing equation above.

   Convexity requires the affine self-financing approximation or a justified convex relaxation; the nonlinear equality as written is not generally convex.

3. **Specify practical convex cost models.**

   The paper allows several transaction-cost forms, including linear and $3/2$-power approximations motivated by market impact. Holding costs can capture financing and shorting costs. Risk can be:
   - quadratic factor-model risk,
   - active risk relative to a benchmark,
   - forecast-error-adjusted risk.

4. **Show how active and excess-return objectives fit the same template.**

   Whether the manager cares about absolute return, excess return over cash, or active return relative to a benchmark, the optimization reduces to the same trade-selection problem once constants not depending on $z_t$ are dropped.

5. **Extend to multi-period optimization.**

   For look-ahead horizon $H$, solve
   $$
   \max_{z_t,\dots,z_{t+H-1}} \sum_{\tau=t}^{t+H-1}
   \left[
   \hat r_{\tau|t}^\top(w_\tau+z_\tau)
   -\hat\phi_\tau^{trade}(z_\tau)
   -\hat\phi_\tau^{hold}(w_\tau+z_\tau)
   -\gamma_\tau \psi_\tau(w_\tau+z_\tau)
   \right]
   $$
   subject to portfolio dynamics and per-period constraints. Only $z_t$ is executed; at $t+1$ the problem is re-solved with updated forecasts. This is the model predictive control step.

6. **Interpret the approximation.**

   Full dynamic programming is intractable in realistic dimensions. The paper's multi-period method approximates dynamic programming by planning over a finite horizon with forecasted future quantities and rolling the optimization forward. The novelty is practical tractability, not exact Bellman optimality.

7. **Implementation consequences.**

   The framework is designed so that real-world problems with thousands of assets remain convex and therefore solvable quickly. This allows:
   - frequent re-optimization,
   - backtest hyperparameter search,
   - realistic embedding of constraints, costs, and benchmarks.

## 5. Domain of applicability

- The framework applies broadly to institutional trading and portfolio rebalancing problems that can be expressed with convex costs and convex constraints.
- Its strength is engineering practicality, not a theorem that the resulting policy is globally optimal under full information.
- Nonconvex frictions such as fixed trading fees, discrete lot constraints, or certain tax rules fall outside the clean convex theory.
- Forecast quality is taken as exogenous. The paper explicitly does not solve the prediction problem; it solves the exploitation problem conditional on forecasts.

## 6. Accounting and the actual convex approximations

The local copy is volume 3(1), labeled 2016 with copyright 2017, DOI 10.1561/2400000023. It includes both an exact trading-accounting model and simplified optimization models. Those layers must be kept distinct.

The vector includes a cash asset. If $v_t$ is wealth before trading and $u_t$ dollar trades, then $z_t=u_t/v_t$. Costs are fractions of pre-trade wealth. Exact self-financing implies that the sum of post-trade weights, still normalized by *pre-trade* wealth, is less than one by the paid costs. After investment,
$$
R_t^p=r_t^\top(w_t+z_t)-\phi_t^{\rm trade}(z_t)-\phi_t^{\rm hold}(w_t+z_t),\quad
w_{t+1}=\frac{(1+r_t)\circ(w_t+z_t)}{1+R_t^p}.
$$
The cash trade in simulation is recomputed from **realized** costs. Forecast costs used to optimize need not equal realized costs, so a cash-related holding constraint can differ slightly from its planned value even if the risky-asset trades execute exactly.

An equality of a general convex nonlinear cost function to zero is not a convex constraint. Thus the exact self-financing equation displayed earlier does not by itself establish convexity. The practical simplified problem replaces it by $\mathbf1^\top z_t=0$, retaining cost penalties in the objective. Its resulting small cash discrepancy is settled by the simulator. The text also discusses conditions under which a self-financing inequality relaxation is tight; such conditions must be checked if using that alternative.

## 7. Correct multi-period objective and dynamics

In a single-period problem, $\widehat r_t^\top w_t$ is constant and can be dropped. In a multi-period plan, future $w_\tau$ depends on earlier chosen trades, so it is **not** constant. The correct look-ahead objective is
$$
\max\sum_{\tau=t}^{t+H-1}\left[\widehat r_{\tau|t}^\top(w_\tau+z_\tau)-\gamma_\tau\psi_\tau(w_\tau+z_\tau)-\widehat\phi_\tau^{\rm trade}(z_\tau)-\widehat\phi_\tau^{\rm hold}(w_\tau+z_\tau)\right].
$$
Using only $\widehat r_\tau^\top z_\tau$ at all future dates would omit the forecast return earned by positions carried forward. The source propagates planned weights by $w_{\tau+1}=w_\tau+z_\tau$, with $\mathbf1^\top z_\tau=0$. It neglects return-driven drift and cost-induced wealth shrinkage **in planned dynamics**, while including both returns and costs in the objective. Exact realized dynamics remain in the backtest.

Only the first trade is executed. Future decisions are a plan, not a state-contingent strategy responding to every possible future signal. This is why the method remains convex and computationally manageable, and why it is an approximation to stochastic dynamic programming. Summed per-period variances equal total variance only under appropriate lack of serial covariance; otherwise those terms are interpretable as local risk penalties.

Terminal portfolio constraints can force the plan back to cash or a benchmark and thereby account for exit costs. They are planning devices, not a commitment to liquidate on that date. A horizon that is too short or a poorly chosen terminal condition can distort the first trade, especially for slow signals and illiquid assets.

## 8. Convex building blocks and their economic units

A typical impact model is $\sum_i a_i|z_i|+b_i|z_i|^{3/2}$, with coefficients depending on spread, volatility, volume and portfolio value. It distinguishes linear spread/commission costs from convex size-dependent impact. Short holding costs use positive-part functions of negative positions. These models are approximations to execution economics; their coefficients should not be treated as arbitrary regularization constants when reporting realized net performance.

The factor risk model $\Sigma=F\Sigma_fF^\top+D$ evaluates variance as factor exposure risk plus idiosyncratic risk. Explicitly exposing this structure to the solver can reduce the dominant linear algebra from dense $O(n^3)$ to approximately $O(nk^2)$ when $k\ll n$. Positive semidefiniteness is required for convexity. Worst-case risk over several covariance scenarios remains convex because it is the maximum of convex quadratics.

Forecast uncertainty can be penalized through support functions of uncertainty sets. For example independent mean-error bounds $|\delta_i|\leq\rho_i$ produce the worst-case return adjustment $-\sum_i\rho_i|w_i|$. This penalizes uncertain positions, whereas transaction costs penalize changes from current positions. They can have similar norms and very different economic effects.

## 9. What the numerical examples do and do not demonstrate

The examples use a $100$ million portfolio, leverage limit three and a factor covariance model with 15 factors. Return forecasts are deliberately synthetic: noise is added to **realized future returns** and then scaled. The source explicitly says these are not usable real-time forecasts. Typical forecast sign agreement is around $54\%$. Their purpose is to compare how optimization uses a given signal quality, not to document an alpha discovery.

The multi-period example additionally receives a forecast for tomorrow and holds that forecast unchanged when tomorrow arrives. Its superior risk-return frontier is largely explained by this extra advance information. It is not a controlled demonstration that adding a horizon alone improves performance with identical information.

The examples search risk, trading and holding-cost multipliers over many backtests. The resulting Pareto frontier describes the sampled parameter search, without an independent future-period guarantee. The reported single-thread simulation takes roughly $0.25$ seconds per day, including about $0.15$ seconds in optimization, or approximately five minutes for a five-year backtest on the authors' setup.

The associated CVXPortfolio architecture separates forecasts, cost/risk objects, constraints, policy and simulator. For reproduction, preserve this separation: calibrate economic cost estimates independently, use aversion multipliers to study policy behavior, and assess realized returns with the simulator's accounting. Constraints, forecast timestamps, corporate actions, borrow availability and liquidity limits matter as much as the solver's convergence. Convex optimality certifies the chosen approximate decision problem, not the correctness of its forecasts or the attainable trading performance.
