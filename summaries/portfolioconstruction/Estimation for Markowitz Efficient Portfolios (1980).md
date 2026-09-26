# Estimation for Markowitz Efficient Portfolios

**Source:** [BayesianPortfolio_JobsonKorkie_1980.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/BayesianPortfolio_JobsonKorkie_1980.pdf>)  
**Source coverage:** Full article, inverse-Wishart normalization, higher-order approximations, Monte Carlo comparisons, and Fieller-type inference.

## 1. Metadata

- **Title:** Estimation for Markowitz Efficient Portfolios
- **Author(s):** J.D. Jobson, B. Korkie
- **Year:** 1980
- **Journal/Venue:** *Journal of the American Statistical Association*, Applications Section

## 2. Problem statement

The paper studies the **sampling theory of the tangency/efficient risky portfolio** in the Markowitz model with a risk-free asset. Let risky-asset excess returns be i.i.d. multivariate normal with mean vector $p\in\mathbb{R}^N$ and covariance matrix $\Sigma\in\mathbb{R}^{N\times N}$, full rank. The population efficient risky portfolio is
$$
X_m=\frac{\Sigma^{-1}p}{\mathbf e^\top \Sigma^{-1}p},
$$
with mean excess return
$$
\mu_m=\frac{p^\top \Sigma^{-1}p}{\mathbf e^\top \Sigma^{-1}p},
$$
and variance
$$
\sigma_m^2=\frac{p^\top \Sigma^{-1}p}{(\mathbf e^\top \Sigma^{-1}p)^2}.
$$
The question is: **what are the finite-sample expectations, variances, covariances, and asymptotic distributions of the plug-in estimators of $X_m$, $\mu_m$, and $\sigma_m^2$?**

## 3. Approach (short)

The paper is a classical sampling-distribution analysis. It starts from the plug-in estimators based on the sample mean vector and inverse sample covariance matrix, derives exact finite-sample moments for the basic quadratic-form components $a$, $b$, and $F_m$, and then uses Taylor expansions for the ratio estimators $\hat\mu_m=\hat a/\hat b$, $\hat\sigma_m^2=\hat a/\hat b^2$, and $\hat X_m=\hat F_m/\hat b$. The analysis relies on multivariate-normal theory, especially the independence of the sample mean and sample covariance matrix and inverse-Wishart moments. The paper then uses these formulas for approximate inference and checks their accuracy by Monte Carlo simulation.

## 4. Approach (detailed)

1. **Population Markowitz problem**

   Let $\mathbf e$ denote the vector of ones and let $p=\mu^\ast-E_z\mathbf e$ be the vector of risky-asset excess means relative to the risk-free return $E_z$. The tangency risky portfolio solves
   $$
   \min_X X^\top \Sigma X
   \quad\text{s.t.}\quad
   X^\top p=\mu,\qquad X^\top \mathbf e=1.
   $$
   For the particular efficient risky portfolio on the capital market line, the solution is proportional to $\Sigma^{-1}p$. Defining
   $$
   A=\Sigma^{-1},\qquad
   F_m=A p,\qquad
   a=p^\top A p,\qquad
   b=\mathbf e^\top A p,
   $$
   the objects of interest are
   $$
   X_m=\frac{F_m}{b},\qquad
   \mu_m=\frac{a}{b},\qquad
   \sigma_m^2=\frac{a}{b^2}.
   $$
   The paper is therefore fundamentally about ratios of random estimators of $a$, $b$, and $F_m$.

2. **Sampling model and plug-in estimators**

   Observe $T$ i.i.d. excess-return vectors $R_t\sim N(p,\Sigma)$. Let
   $$
   \bar R=r,\qquad
   V=\frac1{T-1}\sum_{t=1}^T (R_t-r)(R_t-r)^\top,\qquad
   W=\frac{T-N-2}{T-1}V^{-1}.
   $$
   The plug-in estimators are
   $$
   \hat a=r^\top W r,\qquad
   \hat b=\mathbf e^\top W r,\qquad
   \hat F_m=Wr,
   $$
   and therefore
   $$
   \hat X_m=\frac{\hat F_m}{\hat b},\qquad
   \hat\mu_m=\frac{\hat a}{\hat b},\qquad
   \hat\sigma_m^2=\frac{\hat a}{\hat b^2}.
   $$

3. **Key distributional device**

   Under multivariate normality, the sample mean $r$ and sample covariance $V$ are independent. This is the structural fact that makes the derivations tractable. The scaled inverse $W=((T-N-2)/(T-1))V^{-1}$ has inverse-Wishart-type moments, allowing evaluation of
   $$
   r^\top W r,\qquad \mathbf e^\top Wr,\qquad Wr.
   $$
   The paper first works with these “primitive” objects before touching the ratios.

4. **Exact finite-sample moments for $\hat a,\hat b,\hat F_m$**

   The exact results emphasized by the paper are:
   $$
   E[\hat b]=b,\qquad E[\hat F_m]=F_m,\qquad E[\hat a]=a+\frac NT.
   $$
   Thus $\hat b$ and $\hat F_m$ are unbiased, while $\hat a$ has upward bias $N/T$.

   The proof strategy is direct:

   - use $E[r]=p$ and $E[rr^\top]=pp^\top+\Sigma/T$;
   - exploit independence of $r$ and $W$;
   - evaluate $E[W]$, $E[W\otimes W]$, and related inverse-Wishart moments.

   For example,
   $$
   E[\hat a]=E[r^\top Wr]
   =\operatorname{tr}\!\big(E[rr^\top]E[W]\big),
   $$
   and the inverse-Wishart moment identities imply the bias term $N/T$. The paper also derives exact formulas for
   $$
   \operatorname{Var}(\hat a),\quad
   \operatorname{Var}(\hat b),\quad
   \operatorname{Cov}(\hat a,\hat b),\quad
   \operatorname{Cov}(\hat F_{m,j},\hat b),\quad
   \operatorname{Cov}(\hat F_{m,j},\hat F_{m,k}),
   $$
   for arbitrary $N$. These are exact under the Gaussian model.

5. **Second-order Taylor approximation for ratio estimators**

   The nonlinear ratio statistics can have severe denominator-driven tails; the source studies formal Taylor and asymptotic approximations rather than supplying general exact finite ratio moments. The paper therefore expands the maps
   $$
   g_1(a,b)=\frac ab,\qquad
   g_2(a,b)=\frac a{b^2},\qquad
   g_{3,j}(F_{m,j},b)=\frac{F_{m,j}}b
   $$
   around $(a,b,F_m)$.

   The generic second-order expansions are
   $$
   E\!\left[\frac{\hat a-N/T}{\hat b}\right]
   \approx
   \frac ab
   -\frac{\operatorname{Cov}(\hat a,\hat b)}{b^2}
   +\frac{a\,\operatorname{Var}(\hat b)}{b^3},
   $$
   $$
   \operatorname{Var}\!\left(\frac{\hat a}{\hat b}\right)
   \approx
   \frac{\operatorname{Var}(\hat a)}{b^2}
   +\frac{a^2\operatorname{Var}(\hat b)}{b^4}
   -\frac{2a\,\operatorname{Cov}(\hat a,\hat b)}{b^3},
   $$
   and similarly, for each coordinate $j$,
   $$
   E\!\left[\frac{\hat F_{m,j}}{\hat b}\right]
   \approx
   \frac{F_{m,j}}b
   -\frac{\operatorname{Cov}(\hat F_{m,j},\hat b)}{b^2}
   +\frac{F_{m,j}\operatorname{Var}(\hat b)}{b^3},
   $$
   $$
   \operatorname{Var}\!\left(\frac{\hat F_{m,j}}{\hat b}\right)
   \approx
   \frac{\operatorname{Var}(\hat F_{m,j})}{b^2}
   +\frac{F_{m,j}^2\operatorname{Var}(\hat b)}{b^4}
   -\frac{2F_{m,j}\operatorname{Cov}(\hat F_{m,j},\hat b)}{b^3}.
   $$
   These are leading delta-method terms illustrating the behavior of the portfolio ratios. The source also develops higher-order expressions; the displayed formulas do not reproduce all of those terms.

6. **Asymptotic distributions**

   The paper then derives asymptotic normality for the basic estimators and, by smooth transformation, for the ratios. The logic is standard:

   - $r$ satisfies a multivariate CLT;
   - $V$ and therefore $W$ are asymptotically normal after appropriate rescaling;
   - the maps $(r,W)\mapsto (\hat a,\hat b,\hat F_m)$ and then $(\hat a,\hat b,\hat F_m)\mapsto (\hat\mu_m,\hat\sigma_m^2,\hat X_m)$ are differentiable on the relevant domain $b\neq0$.

   Hence
   $$
   \sqrt T
   \begin{pmatrix}
   \hat\mu_m-\mu_m\\
   \hat\sigma_m^2-\sigma_m^2\\
   \hat X_m-X_m
   \end{pmatrix}
   \Rightarrow
   N(0,\Omega)
   $$
   for a covariance matrix $\Omega$ implied by the moments of $(\hat a,\hat b,\hat F_m)$.

7. **Inference and why the denominator matters**

   The paper stresses that inferential quality is governed by the denominator $\hat b$. If $b$ is small, then the coefficient of variation of $\hat b$ is large and ratio approximations degrade. This is why the authors repeatedly relate the quality of the normal/Taylor approximations to sample size $T$ relative to $1/b^2$. Economically, $b=\mathbf e^\top\Sigma^{-1}p$ is the net-investment normalization of the unnormalized risky direction. Small $b$ can reflect weak premia or cancellation between positive and negative components despite a substantial squared Sharpe ratio. Normalizing that direction to weights summing to one then produces large, unstable positions.

8. **Proof sketch of the core results**

   The paper’s exact results are not “black box” asymptotics; they are algebra from normal-Wishart structure.

   - For unbiasedness of $\hat b$ and $\hat F_m$: independence and linearity suffice.
   - For the bias of $\hat a$: expand $r^\top Wr$ as $\operatorname{tr}(Wr r^\top)$, take expectations, and use $E[rr^\top]=pp^\top+\Sigma/T$.
   - For ratio estimators: the paper does not claim exact finite-sample ratio distributions; it explicitly separates exact primitive moments from Taylor approximations for the ratios.
   - For asymptotic normality: use the joint asymptotics of $(r,V)$ and a delta-method argument.

**Additional mathematical details**

The exact-versus-approximate distinction is sharper than many later retellings suggest. The paper obtains exact inverse-Wishart moments for $\hat a$, $\hat b$, and $\hat F_m$, but once the portfolio objects are written as ratios,
$$
\hat\mu_m=\frac{\hat a}{\hat b},\qquad
\hat\sigma_m^2=\frac{\hat a}{\hat b^2},\qquad
\hat X_m=\frac{\hat F_m}{\hat b},
$$
the analysis switches to second-order Taylor expansions and asymptotic normal approximations. That is why the denominator $b=\mathbf e^\top \Sigma^{-1}p$ plays such a dominant role: if $b$ is small, the ratio estimators inherit a Fieller-Creasy-type instability, and the Gaussian approximation can be poor even when the primitive estimators are well behaved.

The Monte Carlo section is therefore doing real identification work. It verifies that the approximation error is governed much more by $T$ relative to $1/b^2$ than by $T$ alone. Economically, the paper shows that a small net-investment normalization can make classical plug-in tangency weights statistically fragile even under an exactly correct Gaussian model; this need not mean the underlying risky direction has little signal.

## 5. Domain of applicability

- The theory applies to **unconstrained Markowitz tangency-portfolio estimation with a risk-free asset**.
- The exact formulas rely on **i.i.d. multivariate normal returns** and **full-rank $\Sigma$**.
- The asymptotic approximations are credible only when $T$ is large enough relative to $N$ and, more subtly, when $b=\mathbf e^\top\Sigma^{-1}p$ is not too small.
- The paper does **not** cover no-short constraints, turnover constraints, Bayesian shrinkage, or model misspecification.
- Its strongest result is not “optimization works”; it is narrower: **if one uses classical plug-in Markowitz tangency weights, here is the sampling theory of those estimators**. The broader economic usefulness of those weights is left outside the proofs.


## 6. The inverse-covariance normalization is essential

The source does **not** use an uncorrected inverse sample covariance in its exact unbiasedness statements. Let

$$V=\frac1{T-1}\sum_{t=1}^T(R_t-\bar R)(R_t-\bar R)',\qquad
W=\frac{T-N-2}{T-1}V^{-1}.$$

Under the iid Gaussian model, $(T-1)V$ has a Wishart distribution with $T-1$ degrees of freedom. The expectation of its inverse exists for $T>N+2$, and the multiplier above ensures $E[W]=\Sigma^{-1}$. The second inverse-Wishart moments used in the variance formulas require the stronger condition $T>N+4$.

If instead one defines $S=T^{-1}\sum(R_t-\bar R)(R_t-\bar R)'$ and uses $S^{-1}$ without correction, then

$$E[S^{-1}]=\frac{T}{T-N-2}\Sigma^{-1},$$

so the exact primitive expectations stated earlier would be false under that convention. The correction reconciles the moment formulas with the estimator actually studied in the paper.

Multiplying the entire inverse covariance by a positive scalar cancels from the normalized weights $Wr/(\mathbf1'Wr)$ and the ratio $\hat a/\hat b$. It does **not** cancel from $\hat a/\hat b^2$, which has one inverse-covariance factor in its numerator and two in its denominator. Hence the paper's estimated variance is a particular statistical estimator, not simply the unadjusted in-sample variance computed from whatever covariance normalization happens to be used.

### 6.1 The upward bias in estimated squared Sharpe ratio

With the corrected $W$ and independence of $W$ and $r$,

$$E[r'Wr]=\operatorname{tr}\left[\Sigma^{-1}
\left(pp'+\frac\Sigma T\right)\right]
=p'\Sigma^{-1}p+\frac NT.$$

The population quantity $a=p'\Sigma^{-1}p$ is the squared maximum Sharpe ratio when unrestricted risky directions and a risk-free asset are available. The $N/T$ term captures the tendency to find apparent opportunities by optimizing over a noisy sample mean. Even when true expected excess returns are zero, the estimated quadratic form is positive on average. This is a selection effect under a perfectly specified Gaussian model, not evidence of true predictive skill.

Subtracting $N/T$ removes this primitive mean bias, but does not make every resulting ratio unbiased. The denominator remains random and correlated with the numerator. A bias-corrected estimate of $a$ may also be negative in a sample even though its population counterpart is nonnegative; unbiasedness is not the same as respecting all parameter-space restrictions.

## 7. A more precise account of the ratio approximations

The paper carries higher-order Taylor terms and uses an approximate joint normal distribution for primitive estimators to express higher moments through means and covariances. The compact delta-method formulas above are useful leading terms, not the complete higher-order expressions printed in the source.

For example, put $m_a=E\hat a=a+N/T$. Expanding around $(m_a,b)$ gives

$$E\left[\frac{\hat a}{\hat b}\right]\approx
\frac{m_a}{b}-\frac{\operatorname{Cov}(\hat a,\hat b)}{b^2}
+\frac{m_a\operatorname{Var}(\hat b)}{b^3}.$$

For the bias-corrected numerator $\hat a-N/T$, replace $m_a$ by $a$. Omitting the numerator bias while using the uncorrected numerator mixes two estimators. Similarly,

$$E\left[\frac{\hat a}{\hat b^2}\right]\approx
\frac{m_a}{b^2}-\frac{2\operatorname{Cov}(\hat a,\hat b)}{b^3}
+\frac{3m_a\operatorname{Var}(\hat b)}{b^4}.$$

The factors two and three follow from derivatives of $a/b^2$. Higher-order terms can improve numerical approximation in moderately large samples, but become uninformative if the denominator is frequently close to zero.

There is an even stronger caution than “no convenient closed form.” Ratios with a continuously distributed denominator that can approach zero can lack ordinary finite moments, even when numerator and denominator separately have finite moments. For these portfolio ratios, exceptional degeneracies aside, tail behavior near $\hat b=0$ can invalidate a literal interpretation of formal Taylor “moments.” Finite Monte Carlo means and variances do not establish existence of the corresponding exact population moments. The paper's approximate-moment calculations should therefore be read as local distributional approximations, especially in regimes where the denominator is well separated from zero.

## 8. What the denominator measures

The vector $F=\Sigma^{-1}p$ is the unnormalized tangency direction, while $b=\mathbf1'F$ is the normalization required to make its risky weights sum to one. A small $b$ can arise because positive and negative components of $F$ nearly cancel. The direction may still have substantial expected payoff and risk. Thus a small denominator is not equivalent to every individual expected excess return being small.

The instability partly reflects the choice to normalize a risky direction to unit net investment. An investor's total allocation can instead be represented directly in risky dollar positions plus the risk-free asset; some apparent explosions in normalized risky weights are avoided by keeping the scale choice separate. That does not remove estimation error in $F$, but clarifies which instability is statistical and which is induced by normalization.

A useful scale-invariant diagnostic is the coefficient of variation

$$CV(\hat b)=\frac{\sqrt{\operatorname{Var}(\hat b)}}{|b|}.$$

The source also uses comparisons involving $T$ and $1/b^2$ in its numerical calibration. A universal sample-size rule stated only in terms of $1/b^2$ would depend on the units used for returns. The coefficient of variation incorporates covariance and units consistently and better captures the underlying requirement that denominator noise be small relative to its mean.

## 9. Simulation and inference

The simulation population consists of twenty stocks, with Gaussian means and covariances calibrated from 313 monthly observations on stocks continuously listed on the NYSE during December 1949–December 1975. The experiment compares simulated properties across sample sizes with exact primitive moments, higher-order approximations for ratios, and asymptotic formulas. It is a controlled sampling experiment around a fixed calibration, not a prospective stock-selection backtest.

The primitive estimators behave much better than the normalized portfolio statistics. At small sample sizes, a few realizations with denominators near zero produce enormous simulated ratio variances and instability across repetitions. Increasing the assumed risk-free return in the calibration reduces $b$ from about 0.084 to 0.029 and greatly worsens the finite-sample approximation at the same $T$. This isolates a source of fragility that cannot be diagnosed by the number of observations alone.

The paper relates inference to the Fieller–Creasy problem. Rather than assume a ratio itself is nearly normal, consider a candidate parameter $q$ and the linear combination $\hat a-q\hat b$, whose variance depends on $q$. A Fieller-type confidence set can be formed by inverting inequalities of the form

$$(\hat a-q\hat b)^2\le z^2
[\widehat{\operatorname{Var}}(\hat a)+q^2\widehat{\operatorname{Var}}(\hat b)
-2q\widehat{\operatorname{Cov}}(\hat a,\hat b)].$$

When the denominator is weakly identified away from zero, such sets can be unbounded or disconnected. That is meaningful evidence of weak normalization, not a numerical defect to hide by forcing a conventional finite interval. The source's empirical normality checks remain conditional on its finite simulation design and approximations.

## 10. Lessons for portfolio estimation

The paper separates three questions often conflated in practice: whether the moments of returns are estimated well, whether the unnormalized optimal direction is estimated well, and whether a nonlinear normalized portfolio statistic has stable sampling behavior. Success on the first two does not ensure success on the third.

The results do not prescribe a particular shrinkage estimator or constrained optimizer. They explain why such regularization may be useful and why reporting only estimated efficient weights or an in-sample frontier can be misleading. A practical application should state covariance normalization, degrees of freedom, position conventions, and the stability of the tangency normalization. It should also distinguish fixed-$N$ asymptotics from regimes where the number of assets grows with sample size. Serial dependence, heavy tails, changing moments, and constraints fall outside the exact normal–Wishart calculations and require separate treatment.
