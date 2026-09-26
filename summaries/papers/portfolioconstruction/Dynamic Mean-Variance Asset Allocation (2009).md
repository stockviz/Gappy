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

The method applies to finite-horizon continuous-time portfolio choice with stochastic opportunity sets, no intermediate consumption, and quadratic preferences over terminal wealth. It is especially useful where time inconsistency matters and one wants a policy an investor would actually continue to follow. It is not a general equilibrium model, does not cover nonquadratic preferences, and relies on regularity sufficient for HJB/Feynman-Kac arguments. The explicit results are strongest in the one-risky-asset Markov setting, with extensions handled case by case.
