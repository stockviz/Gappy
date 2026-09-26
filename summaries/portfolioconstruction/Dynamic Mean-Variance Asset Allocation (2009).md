# Dynamic Mean-Variance Asset Allocation (2009)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/DynamicMeanVariancePortfolioOptimization.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

## 1. Metadata

- **Title:** Dynamic Mean-Variance Asset Allocation
- **Author(s):** Suleyman Basak and Georgy Chabakauri
- **Year:** 2009
- **Journal/Venue:** *Review of Financial Studies* (the working-paper version in the library is dated 2009)

## 2. Problem statement

The paper studies dynamic mean-variance portfolio choice in continuous time when investment opportunities are stochastic. The central problem is time inconsistency: a policy that is mean-variance optimal at date 0 need not remain optimal when re-evaluated later. The authors ask for the **time-consistent** dynamic policy and compare it with the standard pre-commitment solution.

## 3. Approach (short)

The method is dynamic programming built on a recursive representation of the mean-variance objective. By decomposing variance over time, the authors identify the extra term that makes the criterion time inconsistent and then solve the resulting HJB problem. The class of techniques is stochastic control in continuous time, with a comparison to martingale methods for the pre-commitment benchmark.

## 4. Approach (detailed)

1. **Set up the continuous-time economy.**

   The risky asset follows
   $$
   \frac{dS_t}{S_t} = \mu(S_t,X_t,t)\,dt + \sigma(S_t,X_t,t)\,dw_t,
   $$
   and the state variable obeys
   $$
   dX_t = m(X_t,t)\,dt + \nu(X_t,t)\,dw_t^X,
   $$
   with correlation $\rho$ between $w$ and $w^X$. Wealth evolves as
   $$
   dW_t = [rW_t + \theta_t(\mu_t-r)]dt + \theta_t \sigma_t dw_t.
   $$

2. **Write the mean-variance objective.**

   At time $t$, the investor evaluates
   $$
   U_t = E_t[W_T] - \frac{\gamma}{2}\operatorname{Var}_t(W_T).
   $$

3. **Recover the recursive form of the objective.**

   Using the law of total variance,
   $$
   \operatorname{Var}_t(W_T)
   = E_t[\operatorname{Var}_{t+\tau}(W_T)]
   + \operatorname{Var}_t(E_{t+\tau}[W_T]).
   $$
   Therefore
   $$
   U_t
   = E_t[U_{t+\tau}]
   - \frac{\gamma}{2}\operatorname{Var}_t(E_{t+\tau}[W_T]).
   $$
   The second term is the time-consistency adjustment absent from standard expected-utility control.

4. **Define anticipated portfolio gains.**

   Let
   $$
   f(S_t,X_t,t)
   = E_t\!\left[\int_t^T \theta_s^*(\mu_s-r)e^{r(T-s)}\,ds\right],
   $$
   the expected discounted gains from future stock investment under the optimal policy.

5. **Derive the time-consistent optimal policy.**

   The optimal stock position is the sum of a myopic demand and hedging terms involving the sensitivities of $f$:
   $$
   \theta_t^*
   = \frac{\mu_t-r}{\gamma\sigma_t^2}e^{-r(T-t)}
   \;+\; \text{hedging terms depending on } \partial f/\partial S,\; \partial f/\partial X.
   $$
   The key economic point is that hedging demand now depends on the covariance between instantaneous stock returns and anticipated future portfolio gains.

6. **Introduce the hedge-neutral measure.**

   The anticipated gains admit the representation
   $$
   f(S_t,X_t,t)
   = E_t^*\!\left[\int_t^T \frac{1}{\gamma}\left(\frac{\mu_s-r}{\sigma_s}\right)^2 ds\right],
   $$
   under a hedge-neutral measure $P^*$ that absorbs the intertemporal hedging effects into the drift adjustment.

7. **Compare with the pre-commitment solution.**

   The pre-commitment investor solves the date-0 static problem
   $$
   \max_{W_T} E_0[W_T]-\frac{\gamma}{2}\operatorname{Var}_0(W_T)
   $$
   subject to the budget constraint. In complete markets, martingale methods give a state-price-density characterization of the optimal terminal wealth. The time-consistent and pre-commitment policies coincide only in special knife-edge cases and can differ substantially over long horizons.

### Proof sketch

The main proof step is the recursive identity for $U_t$, obtained from the law of total variance. Once this is written, the problem becomes amenable to HJB methods. The optimal control is characterized through the value function and the anticipated-gains function $f$, yielding a myopic term plus hedging demands. The hedge-neutral representation follows from the Feynman-Kac theorem after changing measure to absorb the state-variable hedge component.

## 5. Domain of applicability

The method applies to finite-horizon continuous-time portfolio choice with stochastic opportunity sets, no intermediate consumption, and a mean-variance criterion over terminal wealth (which is not ordinary expected quadratic utility). It is especially useful where time inconsistency matters and one wants a policy an investor would actually continue to follow. It is not a general equilibrium model, does not cover nonquadratic preferences, and relies on regularity sufficient for HJB/Feynman-Kac arguments. The explicit results are strongest in the one-risky-asset Markov setting, with extensions handled case by case.

## 6. The full policy and a reproducible derivation

The control $\theta_t$ is a **dollar position**, not a fraction of current wealth. With constant absolute mean-variance risk aversion, the source proves that both the anticipated-gains function and the optimal dollar position are independent of current wealth. Adding a dollar to current wealth adds $e^{r(T-t)}$ to terminal wealth and changes no conditional variance. Accordingly,
$$
J(W,S,X,t)=We^{r(T-t)}+\widetilde J(S,X,t).
$$
This additive structure makes the otherwise nonlinear mean-variance problem tractable.

Applying Itô's formula to $f$ gives Brownian exposure $\sigma S f_S\,dw+\nu f_X\,dw^X$. The variance of the sum of future-gains innovations and terminalized current investment is the quadratic expression
$$
\operatorname{Var}_t[df+d(We^{r(T-t)})].
$$
Differentiating the local objective with respect to $\theta$ produces the complete formula
$$
\theta_t^*=e^{-r(T-t)}\left[\frac{\mu_t-r}{\gamma\sigma_t^2}-S_tf_S-\frac{\rho\nu_t}{\sigma_t}f_X\right].
$$
The hedge is negative when stock returns covary positively with revisions to expected future investment gains. Exposure to an asset that performs poorly when future opportunities improve can hedge those opportunities, potentially making the hedging component positive.

Define $\lambda_t=(\mu_t-r)/\sigma_t$. Under the hedge-neutral measure,
$$
dw_t^*=dw_t+\lambda_tdt,\quad dw_t^{X,*}=dw_t^X+\rho\lambda_tdt,
$$
so $S$ has drift $rS$ and $X$ has drift $m-\rho\nu\lambda$. The gains function solves a **linear** backward PDE,
$$
f_t+rSf_S+(m-\rho\nu\lambda)f_X+
\tfrac12\sigma^2S^2f_{SS}+\tfrac12\nu^2f_{XX}+\rho\sigma S\nu f_{SX}
+\lambda^2/\gamma=0,\qquad f(T)=0.
$$
The Feynman-Kac representation in the initial summary follows from this PDE. The equivalent measure changes the drift along traded Brownian risk while leaving orthogonal untraded risk unpriced. It coincides here with the minimal martingale measure. In incomplete markets it is a particular risk-neutral measure, not the unique arbitrage-pricing measure for every claim.

## 7. Time consistency is an equilibrium across decision dates

The variance decomposition does not restore ordinary Bellman optimality for the original date-zero objective over all future controls. At time $t$, the investor optimizes over the next short interval while taking the future selves' equilibrium behavior as given. The resulting policy is dynamically credible but generally has lower date-zero mean-variance utility than a feasible policy supported by binding precommitment.

Mean-variance preferences are also not simply expected quadratic utility. In general,
$$
E[W]-\tfrac\gamma2\operatorname{Var}(W)
=E[W-\tfrac\gamma2W^2]+\tfrac\gamma2(EW)^2,
$$
and the final term depends on the policy. Replacing this criterion with a fixed quadratic utility removes the central source of time inconsistency and changes the problem.

For a constant Sharpe ratio $\lambda$, $f=\lambda^2(T-t)/\gamma$ is deterministic, so all hedging sensitivities vanish. The time-consistent policy is
$$
\theta_t^*=\frac{\mu-r}{\gamma\sigma^2}e^{-r(T-t)}.
$$
Integrating terminalized wealth gives expected gain $\lambda^2(T-t)/\gamma$ and conditional terminal variance $\lambda^2(T-t)/\gamma^2$. Thus the continuation value above bond-only wealth is $\lambda^2(T-t)/(2\gamma)$. This calculation is a useful unit and sign check for a numerical implementation.

In the complete-market precommitment problem, let $\xi_T$ be the state-price density and $E\xi_T=e^{-rT}$. The source obtains
$$
\widehat W_T=W_0e^{rT}+\frac{e^{2rT}E\xi_T^2}{\gamma}-\frac{e^{rT}\xi_T}{\gamma}.
$$
Its dependence on state prices is affine, whereas the time-consistent constant-opportunity terminal wealth depends on $-\log\xi_T$. Even constant opportunities do not make the two investment policies identical. Their agreement occurs in the degenerate zero-price-of-risk case; short horizons merely make their difference small.

## 8. Quantitative implications and implementation

The paper develops analytical applications with changing investment opportunities and extensions to multiple stocks, discrete time, and stochastic rates. Its quantitative exercises are model-based comparisons, not a historical alpha backtest. Horizon effects are not uniformly positive: the terminal-wealth discount factor decreases the myopic dollar demand at longer horizons, while the hedge can rise or fall depending on opportunity dynamics. A zero correlation with an external factor removes that factor's direct hedge, but does not eliminate hedging driven by stock-price-dependent opportunities.

A numerical implementation estimates the dynamics of $S$ and $X$, solves the linear PDE for $f$, differentiates its solution, and evaluates the formula for $\theta$. Monte Carlo under the hedge-neutral measure can replace the PDE, with derivatives estimated through suitable sensitivity methods. Such an implementation must check moment existence and whether the stochastic exponential defining the measure is a true martingale. The source explicitly assumes regularity and explains that full general verification is technically involved.

The portfolio can be leveraged or short and there is no hard wealth floor. Dollar positions independent of wealth can become large as a fraction of wealth after losses. Adding positivity, leverage, turnover, or transaction-cost constraints changes the optimization and generally destroys the displayed closed form. Similarly, the constant-rate/no-consumption assumptions support the separability argument; the source's stochastic-rate extension uses a different numeraire and should not be implemented by merely replacing $r$ with the current short rate.
