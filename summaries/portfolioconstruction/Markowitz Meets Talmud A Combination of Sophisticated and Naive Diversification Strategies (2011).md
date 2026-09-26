# Markowitz Meets Talmud A Combination of Sophisticated and Naive Diversification Strategies (2011)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioConstruction_TuZhou_2011.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

## 1. Metadata

- **Title:** Markowitz Meets Talmud: A Combination of Sophisticated and Naive Diversification Strategies
- **Author(s):** Jun Tu and Guofu Zhou
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
   L(w^*,w_c)=\frac{\gamma}{2}[(1-\delta)^2\pi_1+\delta^2\pi_2],
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

## 6. Exact loss geometry and why feasible combinations have weaker guarantees

For $U(w)=w^\top\mu-\gamma w^\top\Sigma w/2$, completing the square gives
$$
U(w^*)-U(w)=\frac\gamma2(w-w^*)^\top\Sigma(w-w^*).
$$
The loss expressions above omit this common positive $\gamma/2$ factor when defining the $\pi$ quantities as squared distances. It does not affect the optimal combination coefficient. Unbiasedness is essential to eliminating the cross term in the simple Markowitz combination.

For a general estimated rule $\widehat w$, define $A=\|w_e-w^*\|_\Sigma^2$, $B=E\|\widehat w-w^*\|_\Sigma^2$, and $C=(w_e-w^*)^\top\Sigma E[\widehat w-w^*]$. Then
$$
\frac2\gamma L(\delta)=(1-\delta)^2A+2\delta(1-\delta)C+\delta^2B,
\quad
\delta_{\rm unc}^*=\frac{A-C}{A+B-2C}.
$$
The constrained coefficient is its projection onto $[0,1]$ when the denominator is positive. Only when $C=0$ does this reduce to $A/(A+B)$. The Kan–Zhou, Jorion and MacKinlay–Pastor extensions must handle their bias cross terms; a generic arbitrary rule need not have an interior combination dominating both endpoints.

For the ML covariance convention $\widehat\Sigma=T^{-1}\sum_t(R_t-\widehat\mu)(R_t-\widehat\mu)^\top$, the unbiased risky-weight estimator is
$$
\widehat w=\frac{T-N-2}{\gamma T}\widehat\Sigma^{-1}\widehat\mu.
$$
This convention matters: using an unbiased covariance with divisor $T-1$ and the same scaling introduces another finite-sample error. The condition $T>N+4$ ensures the required second inverse-Wishart moment exists; invertibility alone is weaker.

The weights describe risky allocations plus a residual risk-free holding. Their sum need not be one. Renormalizing the sophisticated risky weights to sum to one produces a different estimator and invalidates these utility-loss formulas. Equal weighting has zero *estimation variance* because it is fixed; it still has market risk and turnover when maintained through time.

## 7. What the reported experiments actually show

The simulations use 10,000 samples, often with 25 assets, investor risk aversion three, one- or three-factor return models, and different sample lengths. In the three-factor experiment with annual pricing errors evenly spanning $-2\%$ to $2\%$ and 120 observations, annual utility percentages for ML, Jorion, MacKinlay–Pastor and Kan–Zhou are $-81.09,-7.85,1.78,1.61$. Their estimated combinations yield $3.84,5.79,1.86,5.09$, versus $3.85$ for equal weighting. Thus the combination benefit is substantial, but two combinations still do not beat equal weighting in that example.

Table 5 isolates coefficient estimation. At $T=120$, the ML oracle coefficient is $15.74\%$, while its estimated average is $20.56\%$. The MacKinlay–Pastor oracle coefficient is $28.50\%$, while the jackknife estimate averages $97.02\%$. This discrepancy explains the weak improvement from that estimated combination and motivates the separately considered 50/50 combination. Estimating one coefficient can still be difficult; dimensional reduction is not a guarantee of negligible estimation error.

The real-data analysis uses seven asset sets and rolling windows of 120 or 240 months, applying each month's estimated portfolio to the next month. It reports annualized certainty equivalents at risk aversion three. With 120 months in the 11-asset industry set, equal weighting delivers $3.66\%$, while ML is $-38.18\%$; the Jorion, MacKinlay–Pastor and Kan–Zhou combinations give $3.15\%,2.21\%,3.02\%$. Equal weighting remains difficult to beat in this and the international set. In the 28-asset Fama–French-plus-factors set, the Kan–Zhou combination gives $19.36\%$ versus $5.51\%$ for equal weighting. Results therefore vary materially with opportunity set.

The full-sample ML benchmark in Table 6 is explicitly infeasible for contemporaneous trading and is included to illustrate estimation loss. It must not be counted as an implementable out-of-sample strategy. Certainty equivalents are utility statistics, not compounded returns or guaranteed yields. The paper's comparisons also do not supply a universal net-of-cost dominance result.

## 8. Implementation implications

Use a consistent excess-return frequency, covariance divisor and risk-aversion scale; compute the rule-specific coefficient estimator; impose the intended $[0,1]$ restriction; and carry the residual cash exposure explicitly. Validate the complete rolling procedure, including coefficient estimation, rather than selecting the best mixture using future returns. Report utility, Sharpe ratio, turnover and leverage separately: optimizing expected utility with parameter uncertainty is not identical to maximizing expected realized Sharpe ratio.

The main lesson is a decision-theoretic decomposition of error, not a universal endorsement of equal weights. Another fixed, economically justified anchor can enter the same geometry, but a data-dependent anchor introduces covariance between estimation errors. That covariance must be included rather than borrowing the paper's zero-cross-term proof.
