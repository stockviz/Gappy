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

   The key requirement is convexity of all penalties and feasible sets.

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
   \hat r_\tau^\top z_\tau
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
