## 1. Metadata

- **Title:** On the Fundamental Law of Active Portfolio Management: How to Make Conditional Investments Unconditionally Optimal
- **Author(s):** Guofu Zhou
- **Year:** 2008
- **Journal/Venue:** *Journal of Portfolio Management*

## 2. Problem statement

The paper asks whether the standard fundamental-law trading rule, which is conditionally optimal period by period, is also optimal for the **unconditional** long-run objective by which managers are usually evaluated. Formally: given signals $z$ and conditional alphas $a(z)$, what trading rule maximizes the unconditional mean-variance value added
$$
V_u = E[R_A]-\frac{\theta}{2}\operatorname{Var}(R_A),
$$
rather than the conditional objective optimized by the usual linear rule?

## 3. Approach (short)

Zhou formulates active management as conditional mean-variance optimization with observable signals, then solves a variational problem for the unconditional objective. The resulting strategy is a nonlinear shrinkage/smoothing of the usual linear rule. The method is continuous-state stochastic optimization over trading rules, with closed-form algebra in the unconstrained case and an exact reduction of the constrained zero-beta case to the same structure.

## 4. Approach (detailed)

1. **Set up the conditional model.**

   Let benchmark-relative active return be generated from asset-level conditional alphas $a(z)$ and residual covariance matrix $\Sigma$. For portfolio weights $w(z)$,
   $$
   \mu_A(z)=w(z)^\top a(z),\qquad
   \sigma_A^2(z)=w(z)^\top \Sigma w(z).
   $$

2. **Recover the usual fundamental-law rule.**

   The standard rule solves, pointwise in $z$,
   $$
   \max_{w(z)} \; \mu_A(z)-\frac{\theta}{2}\sigma_A^2(z).
   $$
   The first-order condition gives the familiar linear strategy
   $$
   w_L(z)=\frac{1}{\theta}\Sigma^{-1}a(z).
   $$
   Its conditional information ratio is
   $$
   IR(z)=\sqrt{a(z)^\top \Sigma^{-1}a(z)}.
   $$
   The fundamental law then values the rule through the expected conditional quadratic form.

3. **Pose the unconditional problem explicitly.**

   Long-run evaluation uses
   $$
   V_u = E[w(z)^\top a(z)] - \frac{\theta}{2}\operatorname{Var}(w(z)^\top R),
   $$
   not the conditional objective. Because $w_L(z)$ is chosen conditionally, it need not maximize $V_u$.

4. **Solve the variational problem.**

   Zhou shows that the unconditional optimizer is
   $$
   w_U(z)=k\big(a(z)a(z)^\top+\Sigma\big)^{-1}a(z),
   $$
   where $k$ is a constant chosen from the unconditional objective. Using the Sherman-Morrison formula,
   $$
   w_U(z)=\Pi(z)\,\Sigma^{-1}a(z),
   $$
   with
   $$
   \Pi(z)
   = \frac{1}{\big(1+a(z)^\top\Sigma^{-1}a(z)\big)\,E\!\left[\frac{1}{1+a(z)^\top\Sigma^{-1}a(z)}\right]}.
   $$
   Thus the optimal rule is a **smoothed** version of the linear rule: it scales down aggressive bets when signals are unusually large relative to their long-run distribution.

5. **Characterize unconditional value added.**

   In the one-signal case $a(z)=Az$, Zhou obtains explicit formulas showing that unconditional value added under the smoothed rule exceeds that under the linear rule, with the gap increasing in the volatility and kurtosis of the signal.

6. **Show the role of kurtosis.**

   For the linear rule, the unconditional value added deteriorates with excess kurtosis because rare extreme signals induce disproportionately large positions. In the one-factor case the paper derives explicit dependence of the linear-rule objective on signal kurtosis. High-kurtosis signals can drive unconditional value added close to zero or negative even though the conditional rule remains optimal period by period.

7. **Extend to the constrained active-management case.**

   With the usual active-management constraints — full benchmark neutrality and zero benchmark beta — Zhou shows the problem can be transformed into the same unconstrained form on the residualized space. Hence the same smoothing logic applies.

### Proof sketch

The conditional linear rule comes from a standard quadratic first-order condition. The unconditional rule comes from maximizing $E[w^\top a] - (\theta/2)\operatorname{Var}(w^\top R)$ over functions $w(\cdot)$; the optimizer lies on the conditional mean-variance frontier and can be expressed in rank-one-updated form. The Sherman-Morrison identity gives the explicit shrinkage factor $\Pi(z)$. Because $\Pi(z)$ decreases when $a(z)^\top\Sigma^{-1}a(z)$ is large, the rule smooths the conditional bets exactly where unconditional evaluation penalizes them most.

## 5. Domain of applicability

The method applies when managers use conditional alpha forecasts and are evaluated on unconditional long-run risk-adjusted performance. It is most compelling when signals are volatile or heavy-tailed, because that is where the linear conditional rule can fail badly. The paper is less informative if signals are nearly homoskedastic and Gaussian, or if evaluation itself is truly conditional rather than unconditional. The broader practical claim is narrower than it might appear: the contribution is not a new law of active management, but a correction to the standard law when the objective is unconditional.
