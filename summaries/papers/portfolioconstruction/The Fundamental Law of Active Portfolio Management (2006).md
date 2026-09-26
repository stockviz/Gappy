## 1. Metadata

- **Title:** The Fundamental Law of Active Portfolio Management
- **Author(s):** Roger Clarke, Harindra de Silva, and Steven Thorley
- **Year:** 2006
- **Journal/Venue:** *Journal of Investment Management*

## 2. Problem statement

The paper asks how to formulate the fundamental law of active management when the residual covariance matrix of security returns is **fully populated**, not diagonal. The goal is to derive exact ex-ante and ex-post formulas for active return, information ratio, transfer coefficient, and noise decomposition that remain valid under a realistic risk model.

## 3. Approach (short)

The method rewrites the active-management problem in covariance-whitened coordinates. Whitening converts the full-covariance problem into an orthogonal one, after which the usual correlation-based intuitions of the fundamental law can be stated exactly. The paper then extends the ex-post decomposition and interprets breadth and alpha generation in this transformed space. The technique is linear algebra plus generalized least squares geometry.

## 4. Approach (detailed)

1. **Start from benchmark-relative mean-variance optimization.**

   Let $\alpha$ be the vector of forecasted residual returns, $\Omega$ the residual covariance matrix, and $w$ the active weights. The unconstrained objective is
   $$
   U = \alpha^\top w - \lambda w^\top \Omega w.
   $$
   The unconstrained optimum is
   $$
   w^*=\frac{\sigma_A}{\sqrt{\alpha^\top \Omega^{-1}\alpha}}\,\Omega^{-1}\alpha,
   $$
   where $\sigma_A$ is the chosen active-risk level.

2. **Derive the exact ex-ante information ratio.**

   Substituting $w^*$ gives
   $$
   IR = \frac{E[R_A]}{\sigma_A}
      = \sqrt{\alpha^\top \Omega^{-1}\alpha}.
   $$
   This is the full-covariance analog of $IC\sqrt{N}$. No diagonal approximation is required.

3. **Whiten the system to recover correlation interpretations.**

   Define transformed objects
   $$
   \tilde\alpha = \Omega^{-1/2}\alpha,\qquad
   \tilde r = \Omega^{-1/2}r,\qquad
   \tilde w = \Omega^{1/2}w.
   $$
   In these coordinates, Euclidean inner products correspond to risk-adjusted covariance inner products in the original space. All the usual "correlation" objects become exact ordinary correlations in whitened space.

4. **Derive the exact ex-post law without constraints.**

   Realized active return is
   $$
   R_A = r^\top w^*.
   $$
   Define the covariance-adjusted realized information coefficient
   $$
   \rho_{\alpha,r}
   = \frac{r^\top\Omega^{-1}\alpha}
          {\sqrt{\alpha^\top\Omega^{-1}\alpha}\sqrt{r^\top\Omega^{-1}r}}
   $$
   and realized dispersion
   $$
   D=\sqrt{\frac{r^\top\Omega^{-1}r}{N}}.
   $$
   Then the realized active return decomposes exactly as
   $$
   R_A = \rho_{\alpha,r}\sqrt{N}\,\sigma_A D.
   $$

5. **Introduce constraints through the transfer coefficient.**

   For actual constrained weights $w$ with the same active-risk level $\sigma_A$, define
   $$
   TC
   = \frac{\alpha^\top w}
          {\sqrt{\alpha^\top\Omega^{-1}\alpha}\sqrt{w^\top\Omega w}}.
   $$
   This is exactly the correlation between $\Omega^{-1/2}\alpha$ and $\Omega^{1/2}w$. The ex-ante expected active return becomes
   $$
   E[R_A] = TC \sqrt{\alpha^\top\Omega^{-1}\alpha}\,\sigma_A.
   $$

6. **Decompose ex-post active return under constraints.**

   Write
   $$
   c = w - TC\,w^*
   $$
   for the "weight not taken" because of constraints. The residual satisfies
   $$
   c^\top \Omega c = (1-TC^2)\sigma_A^2.
   $$
   Let
   $$
   \rho_{c,r}
   = \frac{r^\top c}{\sqrt{c^\top\Omega c}\sqrt{r^\top\Omega^{-1}r}}.
   $$
   Then
   $$
   R_A
   = \Big(TC\,\rho_{\alpha,r}+\sqrt{1-TC^2}\,\rho_{c,r}\Big)\sqrt{N}\,\sigma_A D.
   $$
   Hence signal and constraint-noise contributions are
   $$
   TC\,\rho_{\alpha,r}\sqrt{N}\sigma_A D
   $$
   and
   $$
   \sqrt{1-TC^2}\,\rho_{c,r}\sqrt{N}\sigma_A D.
   $$

7. **Clarify breadth.**

   The paper argues that "breadth" is not primitive under full covariance. The exact quantity driving the unconstrained information ratio is
   $$
   \alpha^\top\Omega^{-1}\alpha.
   $$
   If one insists on writing $IR = IC\sqrt{BR}$, then breadth becomes an **implied** object that depends jointly on the alpha-generation rule and the risk model, not merely on the number of names.

### Proof sketch

The proofs are linear-algebraic. Whitening by $\Omega^{-1/2}$ turns the full-covariance problem into one with identity covariance. The unconstrained optimizer is then aligned with the whitened alpha vector. Ex-post and constrained formulas follow by projecting realized returns and actual weights onto the optimizer direction plus its orthogonal complement. Because whitening preserves inner-product geometry, the resulting formulas are exact.

## 5. Domain of applicability

The method applies to benchmark-relative active management with a full residual covariance matrix and a quadratic objective. It is exact under that framework and therefore strictly stronger than the diagonal-covariance versions of the law. Its limits are those of the underlying model: residual covariance must be the correct risk object, the forecast vector must be well-defined, and implementation frictions beyond linear constraints are not modeled directly. The paper's discussion of breadth is especially important: claims of broad applicability of a scalar breadth parameter are not justified once residual correlations matter.
