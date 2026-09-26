# 1. Metadata

- **Title:** Multi-period Portfolio Selection with Drawdown Control
- **Author(s):** Peter Nystrup, Stephen Boyd, Erik Lindström, Henrik Madsen
- **Year:** 2018
- **Journal/Venue:** *Annals of Operations Research* (published online 2018; journal issue 2019)

# 2. Problem statement

The paper asks how to solve a realistic dynamic asset-allocation problem: **choose daily portfolio trades over a multi-period horizon to maximize forecasted risk-adjusted return net of transaction and holding costs, while keeping realized drawdowns under control.** The technical challenge is to combine:

- multi-period return and covariance forecasts;
- convex trading and holding frictions;
- a drawdown-sensitive control rule;
- a tractable optimization method.

# 3. Approach (short)

The method is model predictive control (MPC) with regime-switching forecasts. A hidden Markov model with time-varying parameters generates multi-step forecasts of means and covariances. At each decision date, the investor solves a deterministic convex approximation to the multi-period stochastic control problem over a finite horizon and executes only the first trade. Drawdown control enters through a state-dependent risk-aversion parameter that rises as realized drawdown approaches a limit.

# 4. Approach (detailed)

1. **Portfolio state and trades**

   Let $w_t\in\mathbb R^{n+1}$ be current portfolio weights, including cash, with
   $$
   \mathbf 1^\top w_t = 1.
   $$
   Trades move the portfolio to $w_{t+1},\dots,w_{t+H}$ over the planning horizon $H$.

2. **Stochastic control objective**

   The ideal objective is to maximize discounted risk-adjusted expected returns net of costs:
   $$
   \max E_t\sum_{\tau=t}^{t+H-1}
   \Big(
   \hat \mu_\tau^\top w_\tau
   - \gamma_\tau \psi_\tau(w_\tau)
   - \phi^{trade}_\tau(w_{\tau+1}-w_\tau)
   - \phi^{hold}_\tau(w_\tau)
   \Big),
   $$
   where $\hat \mu_\tau$ and $\hat \Sigma_\tau$ are forecast moments.

3. **Mean-variance risk term**

   The baseline risk term is quadratic:
   $$
   \psi_\tau(w_\tau)=w_\tau^\top \hat \Sigma_\tau w_\tau.
   $$
   When returns are conditionally independent given the forecasts, this corresponds to a multi-period mean-variance criterion.

4. **Transaction and holding costs**

   The paper uses convex cost functions such as elastic-net penalties:
   $$
   \phi^{trade}(z)=\kappa_1^\top |z| + \kappa_2^\top z^2,
   $$
   $$
   \phi^{hold}(w)=\rho_1^\top |w| + \rho_2^\top w^2.
   $$
   These capture proportional cost, temporary price impact, and penalties on leverage or short positions. With convex constraints, the resulting MPC problem is a convex program.

5. **MPC approximation**

   Instead of solving the full stochastic dynamic program, MPC replaces future unknowns by forecasts and solves a deterministic optimization problem for $w_{t+1},\dots,w_{t+H}$. Only the first trade is implemented, then the procedure is repeated the next day with new forecasts. This is suboptimal relative to exact dynamic programming but computationally tractable and adaptive to new information.

6. **Drawdown state and control rule**

   Let
   $$
   M_t = \max_{s\le t} V_s,\qquad
   D_t = 1-\frac{V_t}{M_t}
   $$
   denote the running maximum wealth and current drawdown. Rather than impose a hard nonconvex drawdown constraint, the paper uses a **reactive** rule that makes risk aversion rise as drawdown worsens:
   $$
   \gamma_t = \frac{\gamma_0}{D_{\max}-D_t+\varepsilon},
   $$
   where $D_{\max}$ is the maximum acceptable drawdown and $\varepsilon>0$ prevents blow-up at the boundary. Thus risky allocations are scaled down mechanically when realized losses approach the drawdown limit.

7. **Forecast model**

   Forecasts come from a multivariate hidden Markov model with time-varying parameters. Regime probabilities are updated recursively, and conditional means/covariances are formed from state probabilities and state-specific Gaussian moments. Exponential forgetting is used so older data receive less weight.

8. **Why the algorithm is implementable**

   The key computational point is separability:

   - the HMM produces forecast moments;
   - the optimization consumes only those moments and convex cost parameters;
   - the dynamic problem is handled by repeated receding-horizon resolution instead of a full Bellman recursion.

9. **Proof status**

   The convexity of the MPC subproblem is exact under quadratic risk and convex costs. The paper does not prove global optimality of MPC relative to the full stochastic dynamic program. Its theoretical claim is narrower:

   - the subproblem is convex and solvable;
   - drawdown control can be encoded via state-dependent $\gamma_t$;
   - in backtests this materially reduces maximum drawdown with limited sacrifice of return.

# 5. Domain of applicability

- The method applies to **dynamic multi-asset allocation** with regularly updated forecasts.
- It is most natural when portfolio managers already use scenario or regime forecasts and face meaningful transaction costs.
- Drawdown control is reactive rather than exact: it does not impose a hard almost-sure drawdown bound.
- The method’s effectiveness depends heavily on the quality of the mean/covariance forecasts and on the stability of the regime model.
