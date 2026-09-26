# 1. Metadata

- **Title:** Partial Kelly Portfolios and Shrinkage Estimators
- **Author(s):** Justin K. Rising, Abraham J. Wyner
- **Year:** 2012
- **Journal/Venue:** IEEE ISIT proceedings paper

# 2. Problem statement

The paper asks: **why do fractional Kelly portfolios often outperform full Kelly portfolios in practice, and can this be explained statistically rather than behaviorally?** More precisely, is a partial Kelly rule equivalent to a full Kelly rule computed from a shrinkage estimator of expected returns?

# 3. Approach (short)

The method is quadratic approximation plus statistical decision theory. Rising and Wyner approximate expected log utility by a mean-variance form, show that the approximate Kelly portfolio equals the tangent portfolio, derive a loss-variance characterization of partial Kelly, and then prove that using an $\alpha$-fractional Kelly rule is identical to using a full Kelly rule with the sample mean shrunk toward the risk-free rate.

# 4. Approach (detailed)

1. **Approximate Kelly objective**

   Let risky-asset return vector $R$ have mean $\mu$, covariance $\Sigma$, and risk-free rate $r_f$. For portfolio $w$, total simple return is
   $$
   X_w=r_f+w^\top(R-r_f\mathbf 1).
   $$
   Using a second-order approximation to expected isoelastic utility,
   $$
   \mathbb E[U_\theta(X_w)]
   \approx
   r_f+w^\top(\mu-r_f\mathbf 1)-\frac{\theta}{2}w^\top \Sigma w.
   $$
   For $\theta=1$ this approximates log utility.

2. **Approximate Kelly portfolio**

   Theorem IV.1 shows the approximate Kelly weights are
   $$
   \tilde w^\star=\Sigma^{-1}(\mu-r_f\mathbf 1).
   $$
   Thus the approximate Kelly rule coincides with the tangent/mean-variance efficient portfolio.

3. **Interpret the Sharpe ratio**

   Because the maximal approximate growth is
   $$
   \frac12(\mu-r_f\mathbf 1)^\top \Sigma^{-1}(\mu-r_f\mathbf 1),
   $$
   the paper gives an information-theoretic justification for ranking one-dimensional opportunities by squared Sharpe ratio. This is an approximation, not an exact log-normal identity in complete generality.

4. **Partial Kelly as a growth-variance trade-off**

   Theorem IV.3 states that the $(2\lambda+1)^{-1}$-partial Kelly portfolio minimizes
   $$
   V_1(\tilde w^\star)-V_1(w)+\lambda\,\mathrm{Var}(X_w),
   $$
   where $V_1$ is the quadratic approximation to log growth. So partial Kelly is the optimizer of “approximate growth loss plus variance penalty.”

5. **Introduce estimation**

   In practice $\mu$ and $\Sigma$ are replaced by estimates $\hat\mu,\hat\Sigma$. The approximate Kelly estimator is
   $$
   \hat w^\star=\hat\Sigma^{-1}(\hat\mu-r_f\mathbf 1).
   $$
   The paper argues mean-estimation error is the dominant practical issue.

6. **Main equivalence theorem**

   Theorem V.1 shows that the full Kelly portfolio formed from a shrunk mean
   $$
   \alpha r_f\mathbf 1+(1-\alpha)\hat\mu
   $$
   is exactly identical to the $(1-\alpha)$-partial Kelly portfolio formed from $\hat\mu$. Indeed,
   $$
   \hat\Sigma^{-1}\!\left(\alpha r_f\mathbf 1+(1-\alpha)\hat\mu-r_f\mathbf 1\right)
   =
   (1-\alpha)\hat\Sigma^{-1}(\hat\mu-r_f\mathbf 1).
   $$
   This is an exact algebraic identity.

7. **Optimal shrinkage intensity**

   Theorem V.2 chooses $\alpha$ by minimizing mean-squared error of the shrunk mean estimator. If
   $$
   \alpha^\star=\arg\min_{\alpha\in[0,1]}\mathbb E\|\mu-\alpha r_f\mathbf 1-(1-\alpha)\hat\mu\|^2,
   $$
   then asymptotically
   $$
   \alpha^\star
   =
   \frac{\operatorname{tr}(\Sigma)}{n\|\mu-r_f\mathbf 1\|^2}
   + O(n^{-2}).
   $$
   Plug-in estimation gives a data-dependent fractional Kelly parameter.

8. **Interpretation**

   The paper’s key claim is that partial Kelly works well not because it is inherently more risk efficient in a utility sense, but because it counteracts overaggressive mean estimates. Fractional Kelly is therefore reinterpreted as a shrinkage-estimation device.

# 5. Domain of applicability

The paper applies when expected log utility is well approximated by a quadratic mean-variance form and when the main uncertainty lies in estimating expected returns. The exact algebraic equivalence between shrinkage and partial Kelly is strong. What is approximate is the bridge from Kelly to mean-variance and the asymptotic formula for the optimal shrinkage intensity. The results are therefore most credible in moderate-return, moderate-volatility settings where second-order expansions are informative.
