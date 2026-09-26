## 1. Metadata

- **Title:** Markowitz Meets Talmud: A Combination of Sophisticated and Naive Diversification Strategies
- **Author(s):** Jim Tu and Guofu Zhou
- **Year:** 2011
- **Journal/Venue:** *Journal of Financial Economics*

## 2. Problem statement

The paper addresses a now-classic empirical puzzle: sophisticated portfolio rules derived from mean-variance theory often underperform the naive $1/N$ rule in finite samples. Tu and Zhou do not interpret this as a refutation of Markowitz theory. Instead they ask a sharper question: if the weakness of sophisticated rules comes from estimation variance, can one optimally combine them with the biased but low-variance $1/N$ rule and thereby recover superior out-of-sample performance?

The paper treats the $1/N$ rule as a shrinkage target and derives theory-based combination rules for four sophisticated portfolios:
- the Markowitz/ML rule,
- the Jorion rule,
- the MacKinlay-Pastor rule,
- the Kan-Zhou rule.

## 3. Approach (short)

The method is optimal combination via bias-variance trade-off under mean-variance utility. The combined portfolio is
$$
w_c=(1-\delta)w_e+\delta w,
$$
where $w_e$ is the naive equal-weight portfolio and $w$ is a sophisticated rule. The authors compute the expected utility loss of this combination relative to the true optimal portfolio, show that the loss is quadratic in $\delta$, and derive the optimal coefficient. For the Markowitz case they obtain a closed-form estimator of $\delta$; for the more complicated rules they derive analogous analytical or approximate estimators. The paper's core idea is that $1/N$ should not be viewed as a rival theory, but as a low-variance shrinkage anchor.

## 4. Approach (detailed)

1. **Set up the mean-variance utility criterion.**

   There are $N$ risky assets with IID multivariate normal excess returns:
   $$
   R_{t+1}\sim \mathcal N(\mu,\Sigma).
   $$
   For a portfolio rule $w$, the next-period excess payoff is $w'R_{t+1}$. With relative risk-aversion coefficient $\gamma$, the mean-variance investor's expected utility is the standard quadratic form in expected return and variance. The benchmark true optimal portfolio is
   $$
   w^*=\frac1\gamma \Sigma^{-1}\mu.
   $$
   Performance is evaluated by expected utility loss relative to $w^*$:
   $$
   L(w^*,w_c)=U(w^*)-E[U(w_c)].
   $$

2. **Define the combination rule.**

   Let
   $$
   w_e=\frac1N \mathbf 1
   $$
   be the naive equal-weight rule and let $w$ be an estimated sophisticated rule. The combined portfolio is
   $$
   w_c=(1-\delta)w_e+\delta w,
   \qquad 0\le \delta\le 1.
   $$
   The parameter $\delta$ governs the bias-variance trade-off:
   - small $\delta$: more bias toward $1/N$, less estimation variance;
   - large $\delta$: closer to the sophisticated rule, less bias if the model is right but more sampling noise.

3. **Derive the loss as a quadratic in $\delta$.**

   For the Markowitz/ML case, the paper shows
   $$
   L(w^*,w_c)=(1-\delta)^2\pi_1+\delta^2\pi_2,
   $$
   where
   $$
   \pi_1=(w_e-w^*)'\Sigma (w_e-w^*),
   \qquad
   \pi_2=E[(w-w^*)'\Sigma (w-w^*)].
   $$
   This decomposition is the entire logic of the paper:
   - $\pi_1$ is the loss from biasing toward $1/N$,
   - $\pi_2$ is the loss from estimation noise in the sophisticated rule.

4. **Solve for the optimal population combination weight.**

   Since the loss is quadratic, the minimizer is explicit:
   $$
   \delta^*=\frac{\pi_1}{\pi_1+\pi_2}.
   $$
   If $\pi_1>0$, then $0<\delta^*<1$ and the combined rule strictly dominates both constituents:
   $$
   L(w^*,w_c)<\min\{L(w^*,w_e),\,L(w^*,w)\}.
   $$
   This is Proposition 1. The proof is elementary: minimize the quadratic in $\delta$ and substitute the optimizer back into the loss.

5. **Estimate $\delta$ for the Markowitz/ML rule.**

   The estimated Markowitz rule is based on sample mean and covariance. The paper uses an unbiasedly scaled version of the ML rule,
   $$
   w=\frac1\gamma \tilde\Sigma^{-1}\hat\mu,
   $$
   with the finite-sample scaling chosen to improve the raw ML estimator. Proposition 2 then derives an explicit plug-in estimator of $\delta^*$ under $T>N+4$. The exact algebra uses sample estimates of
   $$
   \theta=\mu'\Sigma^{-1}\mu
   $$
   and finite-sample correction constants. The substantive point is that the optimal shrinkage weight can be estimated directly from the data rather than chosen ad hoc.

6. **Extend the logic to the Kan-Zhou portfolio.**

   Kan and Zhou's rule already shrinks the estimated tangency portfolio toward more stable components. Tu and Zhou combine even this improved rule with $1/N$:
   $$
   w_c^{KZ}=(1-\delta_{KZ})w_e+\delta_{KZ}w_{KZ}.
   $$
   Proposition 3 gives an estimated optimal $\delta_{KZ}$. Conceptually, this is second-stage shrinkage:
   - first shrink the unstable Markowitz rule toward a more stable three-fund structure;
   - then shrink that sophisticated rule toward the ultra-stable naive rule.

7. **Extend to Jorion's Bayes-Stein rule.**

   For Jorion's rule
   $$
   w_{PJ},
   $$
   the optimal population combination weight still has the same general form, but the required moments are too complicated to evaluate exactly in closed form. The paper therefore derives an approximation to the optimal coefficient $\delta_J$ and implements
   $$
   w_{CPJ}=(1-\delta_J)w_e+\delta_J w_{PJ}.
   $$
   The point is that Bayes-Stein shrinkage and $1/N$ shrinkage attack different sources of instability and can be layered.

8. **Extend to the MacKinlay-Pastor latent-factor rule.**

   MacKinlay and Pastor estimate expected returns through a latent-factor structure before solving the portfolio problem. Tu and Zhou again combine that rule with $1/N$:
   $$
   w_{CMP}=(1-\delta_M)w_e+\delta_M w_{MP}.
   $$
   Because exact population moments are hard to derive, the paper uses a jackknife estimator for the moments entering $\delta_M$. This makes the procedure operational even when analytical expectations are unavailable.

9. **Explain the theoretical contribution.**

   The paper's substantive theoretical claim is not that $1/N$ is optimal. It is that naive diversification is a valid shrinkage target because it has essentially zero estimation variance. The correct way to compare $1/N$ with sophisticated rules is therefore not winner-take-all. Once the expected-utility loss is written as a bias-variance quadratic, the existence of a strictly dominating combination is immediate whenever the sophisticated rule is noisy enough and $1/N$ is not accidentally equal to the true optimum.

10. **Proof sketch of Proposition 1.**

   Using
   $$
   w_c-w^*=(1-\delta)(w_e-w^*)+\delta(w-w^*),
   $$
   and the fact that the sophisticated estimator is centered in the relevant finite-sample sense while $w_e$ is fixed, the expected utility loss simplifies to
   $$
   (1-\delta)^2\pi_1+\delta^2\pi_2.
   $$
   Differentiating with respect to $\delta$ gives
   $$
   -2(1-\delta)\pi_1+2\delta\pi_2=0,
   $$
   hence
   $$
   \delta^*=\frac{\pi_1}{\pi_1+\pi_2}.
   $$
   Since the quadratic is strictly convex for $\pi_1,\pi_2>0$, this is the unique minimizer and yields strict dominance over each endpoint.

11. **Implementation recipe.**

   To reproduce the method:
   1. estimate the sophisticated rule $w$ on the training sample;
   2. set $w_e=\mathbf 1/N$;
   3. estimate the moments needed for $\delta$ using the paper's closed-form formulas or approximation/jackknife, depending on the sophisticated rule;
   4. construct
      $$
      w_c=(1-\hat\delta)w_e+\hat\delta w;
      $$
   5. evaluate out-of-sample certainty-equivalent return, Sharpe ratio, and turnover.

12. **Interpret the empirical result methodologically.**

   The empirical finding that combinations often beat both $1/N$ and the raw sophisticated rules should not be read as "theory plus naivety works." The exact claim is sharper:
   - theory gives direction through $w$;
   - naive diversification gives regularization through $w_e$;
   - the optimal mixture is data-dependent and can be solved from the utility-loss criterion.

## 5. Domain of applicability

The method applies when the investor uses Markowitz-type portfolio rules in finite samples and wants a disciplined way to regularize them. It is especially useful when the sophisticated rule is sensitive to estimation error, the asset dimension is moderate relative to sample size, and the equal-weight rule is feasible.

Its limits come from the assumptions used to derive the coefficients: IID normal returns, mean-variance utility, and finite-sample moment formulas. If the sophisticated rule is heavily constrained, benchmark-relative, or nonlinear, the exact $\delta$ formulas need not apply. The $1/N$ rule is also only a sensible target when the investable universe is relatively homogeneous; if assets differ radically in risk, liquidity, or mandate relevance, equal weighting may be a poor anchor even if it is low variance.
