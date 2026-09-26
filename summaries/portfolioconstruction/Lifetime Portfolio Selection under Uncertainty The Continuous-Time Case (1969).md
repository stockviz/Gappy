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

   For $U(C)=\log C$, the finite-horizon propensity to consume with the paper's bequest parameter is
   $$
   \frac{C^*(t)}{W(t)}=\frac{\rho}{1+(\rho\varepsilon-1)e^{-\rho(T-t)}}.
   $$
   The formula $1/(T-t+\varepsilon)$ is the additional zero-discount limit, not the general log-utility result. With no bequest and positive discounting, it is $\rho/[1-e^{-\rho(T-t)}]$.

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

   This is an exact analytic solution within the Brownian-return model. The closed-form solution is exact within the stated diffusion and interior-control assumptions; the paper motivates the diffusion model by a continuous-time limit. Feasibility and infinite-horizon transversality still require checking.

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

# 6. Source and the distinction between rates and returns

[Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/IniversalPortfolios_Merton_1969.pdf>). *The Review of Economics and Statistics* 51(3), August 1969, pp. 247–257; the local file includes a JSTOR cover and all eleven article pages. The source filename contains “IniversalPortfolios,” but the paper is Merton's original consumption and portfolio-choice article.

Merton's risky price follows geometric Brownian motion. In modern notation,

$$
\frac{dS_t}{S_t}=a\,dt+\sigma\,dB_t,
\qquad
 d\log S_t=(a-\tfrac12\sigma^2)dt+\sigma\,dB_t.
$$

The arithmetic instantaneous drift $a$ is therefore not the drift of log price. Omitting the Itô correction would alter both the budget equation and the portfolio rule. The Brownian increment has variance proportional to $dt$, so the second-order term in the value-function expansion survives even when higher-order terms vanish.

Consumption $C_t$ is a flow per unit time; wealth $W_t$ is a stock. The source imposes positive initial wealth and feasibility of consumption and wealth. It treats regular interior portfolio solutions and explicitly permits borrowing and short positions. Nonnegative total wealth does not by itself imply every risky weight lies between zero and one.

# 7. Dynamic programming in risk-tolerance form

The instantaneous portfolio condition can be expressed using indirect absolute risk tolerance,

$$
\mathcal T(W,t)=-\frac{I_W}{I_{WW}},
\qquad
w^*W=\frac{a-r}{\sigma^2}\mathcal T(W,t).
$$

This formula is more general than the constant-share result. It says the optimal risky dollar holding equals the mean-to-variance tradeoff times the risk tolerance of the remaining lifetime problem. Consumption utility curvature and indirect wealth curvature coincide in a simple proportional way only for special preferences and boundary conditions.

For a concave candidate value function, the risky-control part of the HJB is a concave quadratic and the consumption-control part is concave under concave utility. The cross derivative with respect to consumption and the risky holding is zero in this formulation. Consequently the first-order conditions identify the pointwise maximum. Global optimality additionally requires the candidate to meet the terminal condition, admissibility, and the conditions that justify taking expectations of the stochastic terms.

An economic feature of this derivation is that the variance penalty arises from the curvature of lifetime utility, not from imposing a mean-variance objective externally. Diffusion scaling makes only local first and second moments enter the generator, even though the objective is expected utility of an entire consumption path.

# 8. Solving the finite-horizon CRRA equation

Write $\eta=1-\gamma>0$ for relative risk aversion and define the squared instantaneous Sharpe ratio

$$
\theta^2=\frac{(a-r)^2}{\sigma^2}.
$$

For the paper's homothetic bequest convention,

$$
B(W,T)=e^{-\rho T}\frac{\varepsilon^{\eta}W^{1-\eta}}{1-\eta},
$$

the value-function coefficient satisfies

$$
b'(t)=\left[\rho-\gamma\left(r+\frac{\theta^2}{2\eta}\right)\right]b(t)
-\eta b(t)^{-\gamma/\eta},\qquad b(T)=\varepsilon^{\eta}.
$$

The transformation $h=b^{1/\eta}$ linearizes the equation:

$$
h'(t)=\nu h(t)-1,
\qquad
\nu=\frac{\rho-\gamma(r+\theta^2/(2\eta))}{\eta},
\qquad h(T)=\varepsilon.
$$

Its solution has the useful integral representation

$$
h(t)=\int_t^T e^{-\nu(s-t)}ds+\varepsilon e^{-\nu(T-t)}.
$$

Thus $h(t)>0$ before the horizon for every finite real $\nu$ when $\varepsilon\ge0$, and the consumption propensity is $1/h(t)$. For $\nu\ne0$,

$$
h(t)=\frac{1+(\nu\varepsilon-1)e^{-\nu(T-t)}}{\nu};
$$

for $\nu=0$, $h(t)=T-t+\varepsilon$. This derivation identifies exactly what the auxiliary constant in the original formula means and why finite-horizon feasibility does not require $\nu>0$.

The bequest function is economically restrictive. It shares the same homogeneity as consumption utility. A nonhomothetic terminal objective can change wealth risk tolerance and create age-dependent portfolio choices even with constant return opportunities. The constant risky share is therefore a joint consequence of returns and preferences, including terminal preferences.

# 9. The terminal singularity and expected wealth dynamics

With zero bequest, $h(t)$ tends to zero as $t$ approaches $T$, and $C_t/W_t$ diverges approximately like $1/(T-t)$. Merton emphasizes that this does **not** imply an infinite level of consumption. Wealth is being exhausted at the same time. A finite rate of wealth depletion proportional to wealth could never consume a strictly positive stock completely at a finite date; the growing propensity is how the no-bequest terminal condition is met.

Under the optimal fixed risky share, let

$$
a_*=r+\frac{(a-r)^2}{\eta\sigma^2},
\qquad \sigma_*^2=\frac{(a-r)^2}{\eta^2\sigma^2},
\qquad V(t)=C_t/W_t.
$$

Wealth follows

$$
\frac{dW_t}{W_t}=[a_*-V(t)]dt+\sigma_*dB_t.
$$

Since $V$ is deterministic here, expected wealth satisfies

$$
\frac{dE[W_t]}{dt}=[a_*-V(t)]E[W_t].
$$

For the zero-bequest case $V'(t)>0$, so expected proportional wealth growth declines with age. If $a_*>V(0)$, expected wealth initially accumulates, reaches a peak when $V(t)=a_*$, then declines. If $a_*\le V(0)$, expected decumulation begins immediately. This generates “hump saving” without a labor-income or retirement profile. It is a statement about conditional drift and expected paths, not monotonicity of each realized Brownian wealth path.

# 10. Infinite horizon and transversality

After defining the time-stationary value $J(W)=e^{\rho t}I(W,t)$, the HJB becomes an ordinary differential equation:

$$
0=\max_{C,w}\left\{U(C)-\rho J+J_W([r+w(a-r)]W-C)
+\frac12J_{WW}\sigma^2w^2W^2\right\}.
$$

The stationary CRRA candidate has $C^*=\nu W$ and the same risky share. Unlike the finite-horizon case, a positive stationary propensity and finite value are substantive restrictions. The relevant CRRA combination is

$$
\rho>\gamma\left(r+\frac{\theta^2}{2\eta}\right),
$$

which is equivalent to $\nu>0$ for this candidate. The source additionally discusses sufficient restrictions on discounting and a transversality condition to exclude extraneous ODE solutions. One should not identify every formal solution of the HJB with an admissible optimum or carry the finite-horizon formula to infinity when the limiting integral does not converge.

For log utility, the infinite-horizon rule is particularly simple: $C^*=\rho W$ and $w^*=(a-r)/\sigma^2$. The consumption propensity is independent of investment opportunities, while the risky allocation still responds to them. This two-way separation is stronger than the generic CRRA result, where the risky share is independent of consumption but the consumption propensity depends on the opportunity set.

# 11. Comparative statics and the multi-asset extension

The risky share rises with excess drift and falls with variance and relative risk aversion when excess drift is positive. A negative excess drift produces a short risky position in the unconstrained model. With one risky asset and an imposed interval $0\le w\le1$, the local portfolio optimum is clipped to the interval, but consumption and the value coefficient should be recomputed for the constrained opportunity set.

In the paper's consumption comparative statics, improving investment opportunities creates both a substitution effect toward future consumption and a wealth effect toward current consumption. For $\eta<1$, the substitution effect dominates in the illustrated comparison; for $\eta>1$, the wealth effect dominates; for log utility they cancel. These statements refer to the specified comparison of investment opportunities and preferences, not to an unconditional prediction that richer investors consume less.

For $n$ risky assets with drift vector $a$ and positive-definite instantaneous covariance $\Sigma$, write $m=a-r\mathbf1$. Then

$$
w^*=\frac1\eta\Sigma^{-1}m,
\qquad
\Theta^2=m^\top\Sigma^{-1}m,
$$

and replace $\theta^2$ by $\Theta^2$ in the CRRA consumption coefficient. Investors with different CRRA coefficients hold the same risky direction at different scales, together with the riskless asset. The covariance matrix contains instantaneous arithmetic-return covariances; using a covariance estimated over a different time unit without scaling the drifts and discount rate consistently changes the answer.

# 12. CARA solution and its feasibility qualification

For exponential consumption utility $U(C)=-e^{-qC}/q$ with $q>0$, the infinite-horizon interior solution given in the source is

$$
C^*(W)=rW+\frac{\rho-r+\theta^2/2}{qr},
\qquad
w^*W=\frac{a-r}{qr\sigma^2},
$$

under the nonzero positive-rate setting of these formulas. The indirect value has exponential wealth curvature $qr$, so its absolute wealth risk tolerance is $1/(qr)$. It is not simply $1/q$: $q$ describes curvature with respect to a consumption flow, while lifetime wealth must finance that flow.

The risky dollar amount is independent of wealth and the consumption function is affine. Thus the risky fraction falls as wealth rises. These are interior formulas and need care near the boundary of the feasible set. Constant risky dollar exposure makes wealth arithmetic-diffusion-like and can bring it near zero; the affine consumption rule can also violate a consumption restriction for some parameters or states. The formulas should not be advertised as a globally feasible positive-wealth strategy under every constraint in a realistic household problem. Boundary constraints require a separately solved control problem.

# 13. Applicability, extensions, and implementation

This is an analytic theory paper, with no data calibration or investment backtest. Its closed forms are useful for unit-testing numerical dynamic-programming solvers and for distinguishing preference effects from opportunity-set effects. A numerical implementation should recover the constant CRRA share, the exact finite-horizon consumption propensity, the log-utility limits, and the terminal exhaustion behavior.

Merton explicitly discusses extending drifts and volatilities to functions of prices, wealth, and time. The value function then needs additional state variables and mixed derivatives, and the simple separation is lost. His diffusion-generator argument requires higher conditional moments to vanish faster than $dt$; finite-activity jumps generally contribute additional terms and do not satisfy the same reduction. Stochastic interest rates, labor income, costs, discrete trading, and borrowing restrictions all change the economic problem.

The durable result is therefore not that every investor should maintain a constant stock percentage. It is that constant opportunity sets combined with homothetic preferences and compatible terminal utility produce a lifetime wealth risk tolerance proportional to wealth. Continuous-time dynamic programming then turns that structural property into a constant-proportion portfolio rule and an explicitly horizon-dependent consumption rule.
