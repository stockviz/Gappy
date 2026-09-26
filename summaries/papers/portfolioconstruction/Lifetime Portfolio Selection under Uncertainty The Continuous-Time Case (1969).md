# 1. Metadata

- **Title:** Lifetime Portfolio Selection under Uncertainty: The Continuous-Time Case
- **Author(s):** Robert C. Merton
- **Year:** 1969
- **Journal/Venue:** *Review of Economics and Statistics*

# 2. Problem statement

The paper solves the joint consumption-portfolio problem for an investor in continuous time whose wealth evolves stochastically because asset returns are diffusions. The objective is to maximize expected discounted utility of consumption plus terminal bequest:
$$
\max_{\{C(t),w(t)\}} E\left[\int_0^T e^{-\rho t}U(C(t))\,dt + B(W(T),T)\right],
$$
subject to a stochastic budget equation. The mathematical question is to characterize the optimal consumption rate and risky-asset share as feedback rules in wealth and time.

# 3. Approach (short)

The method is continuous-time dynamic programming. Merton writes the wealth dynamics as an Itô process, defines the indirect utility $I(W,t)$, derives the Hamilton-Jacobi-Bellman equation, and solves it explicitly for isoelastic (constant relative risk aversion) and constant absolute risk aversion utility. The paper’s lasting contribution is the separation of the portfolio rule from wealth under CRRA and the derivation of the constant risky share.

# 4. Approach (detailed)

1. **Wealth dynamics**

   With one riskless asset at rate $r$, one risky asset with drift $a$ and volatility $\sigma$, consumption $C(t)$, and risky share $w(t)$, wealth satisfies
   $$
   dW(t)=\bigl([w(t)(a-r)+r]W(t)-C(t)\bigr)\,dt + w(t)\sigma W(t)\,dB_t.
   $$
   This is the continuous-time limit of the discrete budget equation with Brownian return shocks.

2. **Value function and HJB**

   Define
   $$
   I(W,t)=\max E_t\left[\int_t^T e^{-\rho s}U(C(s))\,ds + B(W(T),T)\right].
   $$
   Dynamic programming yields the HJB equation
   $$
   0=\max_{C,w}\left\{e^{-\rho t}U(C)+I_t + I_W\bigl([w(a-r)+r]W-C\bigr)
   +\frac12 I_{WW}\sigma^2 w^2 W^2\right\}.
   $$

3. **First-order conditions**

   For an interior optimum,
   $$
   e^{-\rho t}U'(C)=I_W,
   $$
   and
   $$
   (a-r)I_W + I_{WW}\sigma^2 wW = 0.
   $$
   Hence
   $$
   w^*(t)= -\,\frac{(a-r)I_W}{\sigma^2 W I_{WW}}.
   $$
   The sign and magnitude of the risky share are therefore governed by the curvature of the indirect utility.

4. **CRRA/isoelastic utility**

   For
   $$
   U(C)=\frac{C^\gamma}{\gamma},\qquad \gamma<1,\ \gamma\ne 0,
   $$
   Merton guesses a homothetic value function
   $$
   I(W,t)=\frac{1}{\gamma}e^{-\rho t}b(t)W^\gamma.
   $$
   Substituting into the HJB reduces the PDE to an ODE for $b(t)$. The first-order conditions become
   $$
   C^*(t)=b(t)^{1/(\gamma-1)}W(t),
   $$
   and
   $$
   w^*(t)=\frac{a-r}{(1-\gamma)\sigma^2}.
   $$
   The risky share is constant: it depends on the Sharpe ratio and relative risk aversion, but not on wealth or time.

5. **Consumption rule**

   Solving the ODE for $b(t)$ gives
   $$
   C^*(t)=\frac{\nu}{1+(\nu\varepsilon-1)e^{\nu(t-T)}}\,W(t)
   $$
   for an auxiliary constant $\nu$ determined by preferences and investment opportunities. With zero bequest weight, the marginal propensity to consume rises as $t\to T$.

6. **Log-utility limit**

   When $\gamma\to 0$, $U(C)=\log C$, the same logic yields
   $$
   C^*(t)=\frac{1}{T-t+\varepsilon}\,W(t)
   $$
   in the no-bequest limit, while the risky share remains the appropriate limit of the CRRA formula.

7. **Constant absolute risk aversion**

   For exponential utility, Merton shows that the optimal risky **dollar amount** is constant rather than the risky share:
   $$
   w^*(t)W(t)=\text{constant}.
   $$
   Thus the portfolio rule scales differently:
   - with CRRA, a fixed fraction of wealth is invested in the risky asset;
   - with CARA, a fixed dollar amount is invested in the risky asset.

8. **Proof structure**

   The exact solution relies on:
   1. the HJB equation;
   2. a homothetic guess for $I(W,t)$ under isoelastic utility;
   3. substitution reducing the PDE to an ODE;
   4. verification that the candidate satisfies the HJB and boundary condition.

   This is an exact analytic solution within the Brownian-return model. No approximation is used.

9. **Economic interpretation**

   The portfolio rule
   $$
   w^*=\frac{a-r}{(1-\gamma)\sigma^2}
   $$
   is the continuous-time analogue of the static mean-variance tangency demand: excess drift over variance, scaled by risk tolerance. The dynamic problem adds consumption but, under CRRA, does not add a hedging component because the investment opportunity set is constant.

# 5. Domain of applicability

- The exact closed-form results apply to constant investment opportunities and the utility classes solved explicitly.
- With stochastic opportunity sets, additional hedging demands generally appear and the constant-share rule no longer holds.
- The model is frictionless and excludes labor income, transaction costs, borrowing constraints, and jumps.
- The paper’s major result is exact but narrow: it shows why constant-proportion investing is optimal in a very specific continuous-time environment.
- The novel contribution is the HJB solution of the joint lifetime consumption-portfolio problem in continuous time.
