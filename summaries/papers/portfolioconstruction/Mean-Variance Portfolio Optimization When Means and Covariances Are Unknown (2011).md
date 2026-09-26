## 1. Metadata

- **Title:** Mean-Variance Portfolio Optimization When Means and Covariances Are Unknown
- **Author(s):** Tze Leung Lai, Haipeng Xing, and Zehao Chen
- **Year:** 2011
- **Journal/Venue:** *Annals of Applied Statistics*

## 2. Problem statement

The paper asks how to implement Markowitz portfolio choice when both $\mu$ and $\Sigma$ are unknown and must be inferred from historical data. The central question is not "how do we estimate $\mu$ and $\Sigma$ better?" but "how should portfolio choice itself change once parameter uncertainty is recognized as part of the risk?"

## 3. Approach (short)

The method is Bayesian posterior-predictive portfolio choice cast as a stochastic optimization problem. Instead of plugging estimates into the classical efficient frontier, the paper optimizes the predictive objective
$$
E(w^\top r_{n+1}) - \lambda \operatorname{Var}(w^\top r_{n+1})
$$
under the posterior distribution of future returns. A key technical trick converts this nonstandard problem into a family of standard quadratic programs indexed by an auxiliary scalar $\eta$. The paper then extends the method to empirical Bayes, bootstrap approximation, and information-ratio tuning.

## 4. Approach (detailed)

1. **Start from the predictive objective.**

   Given data $R_n=(r_1,\dots,r_n)$, choose weights $w$ to maximize
   $$
   \max_w \left\{E(w^\top r_{n+1}) - \lambda \operatorname{Var}(w^\top r_{n+1})\right\}.
   $$
   This differs from plug-in Markowitz because the expectation and variance are taken under the **posterior predictive** law of $r_{n+1}$, not under fixed estimated parameters.

2. **Identify the nonstandard feature.**

   Writing $W=w^\top r_{n+1}$,
   $$
   E(W)-\lambda \operatorname{Var}(W)
   = E(W)-\lambda E(W^2)+\lambda [E(W)]^2.
   $$
   The last term makes the problem nonstandard for direct stochastic optimization.

3. **Introduce the auxiliary parameter $\eta$.**

   Let $W_B$ denote the optimal predictive portfolio payoff and define
   $$
   \eta = 1 + 2\lambda E(W_B).
   $$
   The paper shows that solving the original problem is equivalent to solving
   $$
   w(\eta)=\arg\min_w \left\{\lambda E[(w^\top r_{n+1})^2]-\eta E(w^\top r_{n+1})\right\},
   $$
   and then choosing $\eta$ to maximize the original mean-variance objective.

4. **Reduce to posterior moments.**

   Let
   $$
   \mu_n = E(r_{n+1}\mid R_n),\qquad
   V_n = E(r_{n+1}r_{n+1}^\top\mid R_n).
   $$
   Then
   $$
   E(w^\top r_{n+1}) = E(w^\top \mu_n),\qquad
   E[(w^\top r_{n+1})^2]=E(w^\top V_n w).
   $$
   With short-sales constraints,
   $$
   w(\eta)=\arg\min_{w^\top\mathbf 1 =1,\; w\ge 0}
   \left\{\lambda w^\top V_n w - \eta w^\top \mu_n\right\}.
   $$

5. **Closed form without short-sale constraints.**

   If short sales are unconstrained,
   $$
   w(\eta)
   = \frac{1}{C_n}V_n^{-1}\mathbf 1
   + \frac{\eta}{2\lambda}V_n^{-1}\mu_n
   - \frac{A_n\eta}{2\lambda C_n}V_n^{-1}\mathbf 1,
   $$
   where
   $$
   A_n=\mu_n^\top V_n^{-1}\mathbf 1,\qquad
   B_n=\mu_n^\top V_n^{-1}\mu_n,\qquad
   C_n=\mathbf 1^\top V_n^{-1}\mathbf 1.
   $$
   One then optimizes over $\eta$, e.g. numerically.

6. **Empirical Bayes / bootstrap implementation.**

   The paper emphasizes that the theory requires only the posterior predictive law. In practice, one can estimate this through:

   - parametric Bayesian models,
   - empirical Bayes priors,
   - nonparametric bootstrap approximations to the predictive criterion.

7. **Tune $\lambda$ by information ratio.**

   Since practitioners often care about
   $$
   \frac{\mu-\mu_0}{\sigma_e},
   $$
   the paper proposes selecting $\lambda$ to maximize an estimated information ratio, often using bootstrap approximations.

### Proof sketch

The core proof is the $\eta$-transformation. By completing the square in the mean term, the original objective can be rewritten so that the optimizer is characterized by a family of quadratic objectives indexed by $\eta$. Conditional on $\eta$, the problem is a standard quadratic program in posterior moments $(\mu_n,V_n)$. The original optimum is recovered by choosing the $\eta$ that maximizes the predictive mean-variance reward.

## 5. Domain of applicability

The approach applies to one-period portfolio choice under parameter uncertainty when the investor has, or is willing to approximate, a posterior predictive distribution for future returns. It is more general than i.i.d. Gaussian plug-in Markowitz, and it extends naturally to factor and time-series forecasting models. It does not by itself solve multiperiod trading with transaction costs or model misspecification outside the predictive family being entertained. Its practical success depends on the quality of the predictive model used to generate $(\mu_n,V_n)$.
