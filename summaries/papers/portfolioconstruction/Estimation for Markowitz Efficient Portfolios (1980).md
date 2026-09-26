# 1. Metadata

- **Title:** Estimation for Markowitz Efficient Portfolios
- **Author(s):** J.D. Jobson, B. Korkie
- **Year:** 1980
- **Journal/Venue:** *Journal of the American Statistical Association*, Applications Section

# 2. Problem statement

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

# 3. Approach (short)

The paper is a classical sampling-distribution analysis. It starts from the plug-in estimators based on the sample mean vector and inverse sample covariance matrix, derives exact finite-sample moments for the basic quadratic-form components $a$, $b$, and $F_m$, and then uses Taylor expansions for the ratio estimators $\hat\mu_m=\hat a/\hat b$, $\hat\sigma_m^2=\hat a/\hat b^2$, and $\hat X_m=\hat F_m/\hat b$. The analysis relies on multivariate-normal theory, especially the independence of the sample mean and sample covariance matrix and inverse-Wishart moments. The paper then uses these formulas for approximate inference and checks their accuracy by Monte Carlo simulation.

# 4. Approach (detailed)

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
   S=\frac1T\sum_{t=1}^T (R_t-r)(R_t-r)^\top,\qquad
   W=S^{-1}.
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

   Under multivariate normality, the sample mean $r$ and sample covariance $S$ are independent. This is the structural fact that makes the derivations tractable. Since $W=S^{-1}$ has inverse-Wishart-type moments, one can evaluate moments of
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

   Exact finite-sample moments of $\hat\mu_m,\hat\sigma_m^2,\hat X_m$ are not convenient because they are ratios. The paper therefore expands the maps
   $$
   g_1(a,b)=\frac ab,\qquad
   g_2(a,b)=\frac a{b^2},\qquad
   g_{3,j}(F_{m,j},b)=\frac{F_{m,j}}b
   $$
   around $(a,b,F_m)$.

   The generic second-order expansions are
   $$
   E\!\left[\frac{\hat a}{\hat b}\right]
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
   These are the formulas actually used for $\hat\mu_m$, $\hat\sigma_m^2$, and $\hat X_m$.

6. **Asymptotic distributions**

   The paper then derives asymptotic normality for the basic estimators and, by smooth transformation, for the ratios. The logic is standard:

   - $r$ satisfies a multivariate CLT;
   - $S$ and therefore $W$ are asymptotically normal after appropriate rescaling;
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

   The paper stresses that inferential quality is governed by the denominator $\hat b$. If $b$ is small, then the coefficient of variation of $\hat b$ is large and ratio approximations degrade. This is why the authors repeatedly relate the quality of the normal/Taylor approximations to sample size $T$ relative to $1/b^2$. In economic terms, $b=\mathbf e^\top\Sigma^{-1}p$ is proportional to the signal that separates the tangency portfolio from the global minimum-variance object; weak mean premia make the ratios statistically unstable.

8. **Proof sketch of the core results**

   The paper’s exact results are not “black box” asymptotics; they are algebra from normal-Wishart structure.

   - For unbiasedness of $\hat b$ and $\hat F_m$: independence and linearity suffice.
   - For the bias of $\hat a$: expand $r^\top Wr$ as $\operatorname{tr}(Wr r^\top)$, take expectations, and use $E[rr^\top]=pp^\top+\Sigma/T$.
   - For ratio estimators: the paper does not claim exact finite-sample ratio distributions; it explicitly separates exact primitive moments from Taylor approximations for the ratios.
   - For asymptotic normality: use the joint asymptotics of $(r,S)$ and a delta-method argument.

**Additional mathematical details**

The exact-versus-approximate distinction is sharper than many later retellings suggest. The paper obtains exact inverse-Wishart moments for $\hat a$, $\hat b$, and $\hat F_m$, but once the portfolio objects are written as ratios,
$$
\hat\mu_m=\frac{\hat a}{\hat b},\qquad
\hat\sigma_m^2=\frac{\hat a}{\hat b^2},\qquad
\hat X_m=\frac{\hat F_m}{\hat b},
$$
the analysis switches to second-order Taylor expansions and asymptotic normal approximations. That is why the denominator $b=\mathbf e^\top \Sigma^{-1}p$ plays such a dominant role: if $b$ is small, the ratio estimators inherit a Fieller-Creasy-type instability, and the Gaussian approximation can be poor even when the primitive estimators are well behaved.

The Monte Carlo section is therefore doing real identification work. It verifies that the approximation error is governed much more by $T$ relative to $1/b^2$ than by $T$ alone. Economically, the paper is saying that weak aggregate mean premia make classical plug-in tangency weights statistically fragile even under an exactly correct Gaussian model.

# 5. Domain of applicability

- The theory applies to **unconstrained Markowitz tangency-portfolio estimation with a risk-free asset**.
- The exact formulas rely on **i.i.d. multivariate normal returns** and **full-rank $\Sigma$**.
- The asymptotic approximations are credible only when $T$ is large enough relative to $N$ and, more subtly, when $b=\mathbf e^\top\Sigma^{-1}p$ is not too small.
- The paper does **not** cover no-short constraints, turnover constraints, Bayesian shrinkage, or model misspecification.
- Its strongest result is not “optimization works”; it is narrower: **if one uses classical plug-in Markowitz tangency weights, here is the sampling theory of those estimators**. The broader economic usefulness of those weights is left outside the proofs.
