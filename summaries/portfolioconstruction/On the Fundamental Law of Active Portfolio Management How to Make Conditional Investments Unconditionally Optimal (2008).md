# On the Fundamental Law of Active Portfolio Management How to Make Conditional Investments Unconditionally Optimal (2008)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/ActivePortfolioManagement_Zhou_2008.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

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
   w_U(z)=\frac{\Pi(z)}{\theta}\,\Sigma^{-1}a(z),
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

## 6. Total variance is the missing term

The source is *Journal of Portfolio Management* 35(1), Fall 2008, pp. 12-21. Let $q(z)=a(z)^\top\Sigma^{-1}a(z)$. For any measurable trading rule,

$$
\operatorname{Var}(R_A)=E[w^\top\Sigma w]+\operatorname{Var}(w^\top a).
$$

Averaging the conditionally optimized objective penalizes only the first component. An observer assessing the complete return series also penalizes variation in the conditional expected payoff. This is not parameter uncertainty: it arises even with perfectly known conditional moments. Nor is it intertemporal hedging in a wealth-control problem. It is a one-period managed-return payoff evaluated across the unconditional distribution of information states.

For the conventional linear rule $w_L=\theta^{-1}\Sigma^{-1}a$,

$$
E[R_A]=\frac{E[q]}\theta,\qquad
\operatorname{Var}(R_A)=\frac{E[q]+\operatorname{Var}(q)}{\theta^2},
$$

so its unconditional value added is

$$
V_L=\frac{E[q]-\operatorname{Var}(q)}{2\theta}.
$$

Its average conditional value added is instead $E[q]/(2\theta)$. The difference is exactly $\operatorname{Var}(q)/(2\theta)$. This exposes the mechanism more precisely than saying that extreme signals are intrinsically undesirable.

## 7. Full derivation with the risk-aversion constant retained

Let $m=E[w^\top a]$ and $M(z)=\Sigma+a(z)a(z)^\top$. The unconditional objective is

$$
J(w)=m-\frac\theta2\{E[w^\top M w]-m^2\}.
$$

Vary the entire function $w(z)$. The pointwise first-order condition is

$$
(1+\theta m)a(z)=\theta M(z)w(z).
$$

Thus $w=kM^{-1}a$ with $k=\theta^{-1}+m$. Define

$$
h=E[(1+q)^{-1}],\qquad
E[a^\top M^{-1}a]=E[q/(1+q)]=1-h.
$$

Then $m=k(1-h)$ and $k=1/(\theta h)$. Sherman-Morrison yields

$$
\boxed{w_U(z)=\frac{1}{\theta h(1+q(z))}\Sigma^{-1}a(z)
=\Pi(z)w_L(z).}
$$

The $1/\theta$ factor is essential and was missing in the earlier displayed formula for $w_U$. With this normalization,

$$
E[R_U]=\frac{h^{-1}-1}{\theta},\quad
\operatorname{Var}(R_U)=\frac{h^{-1}-1}{\theta^2},\quad
V_U=\frac{h^{-1}-1}{2\theta}.
$$

Hence the optimal unconditional squared information ratio is $h^{-1}-1$. The objective is concave as a linear functional minus variance of the managed payoff, so the first-order solution is globally optimal on the admissible linear payoff space when the necessary moments exist.

The normalization satisfies $E[\Pi]=1$, but $\Pi$ is inversely related to signal opportunity $q$. Low-opportunity states may receive a multiplier above one and unusually high-opportunity states a multiplier below one. Thus “shrinkage” here is a reallocation of aggressiveness across states, not a uniform reduction in every position.

## 8. Kurtosis result and the scale of the examples

With one standardized signal, write $a(z)=Az$, $E[z^2]=1$, and $c=A^\top\Sigma^{-1}A$. If excess kurtosis is $\kappa$, then $q=cz^2$ and

$$
V_L=\frac{c-(\kappa+2)c^2}{2\theta}.
$$

For a standardized normal signal, $\kappa=0$; for a standardized $t_6$ signal, $\kappa=3$. In the latter case the conventional rule has zero unconditional value added at $c=0.2$ and negative value above it. This comparison holds the risk aversion used by the conditional rule fixed. Re-optimizing a single unconditional scale for that rule would partly reduce the loss, but would still not generally reproduce the optimal nonlinear scaling.

Exhibit 1 reports model-based comparisons with the common factor $1/(2\theta)$ suppressed. For normal signals at $c=0.06$, the reported values are about 0.054 for the optimal rule and 0.046 for the linear rule; at $c=0.14$, about 0.115 and 0.062. For $t_6$ signals at $c=0.14$, they are about 0.105 and 0.042. The numbers are analytical/numerical model illustrations, not realized investment returns or a cost-adjusted backtest.

For multivariate normal signals $z$ and $a=Az$, the eigenvalues of $A^\top\Sigma^{-1}A$ determine the distribution of $q$ and therefore $h$. The source gives an integral representation and discusses simulation as a direct way to compute the normalization. This is an effective-opportunity spectrum, not a count of names multiplied by an assumed independence factor.

## 9. Constraints and application boundaries

Residual returns of all benchmark constituents possess a linear dependence, making the full residual covariance singular. The paper explicitly handles this by eliminating a redundant asset and imposing benchmark-beta neutrality in a reduced coordinate system. Blind inversion of the original residual covariance is therefore inappropriate. More general linear constraints can be represented by a feasible basis and the same derivation applied to reduced conditional alphas and covariance.

The scalar smoothing property relies on a fixed linear opportunity space. State-dependent bounds, long-only restrictions, turnover costs or nonlinear mandate limits may change the portfolio direction as well as its scale. The paper's endnotes identify estimation error in the nonlinear strategy as unresolved. In particular, estimating $h$ from the same sample used to create extreme alphas can itself introduce bias.

A practical investigation should compare the conditional linear rule, an optimally risk-scaled linear rule, and the nonlinear rule at common realized risk; estimate the distribution of $q$ using strictly historical information; and include turnover and leverage diagnostics. The economic question is whether the performance objective actually penalizes predictable variation in conditional returns. If the mandate evaluates conditional rather than unconditional risk, the two objectives are different and neither can be substituted silently for the other.
