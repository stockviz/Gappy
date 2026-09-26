# Partial Kelly Portfolios and Shrinkage Estimators (2012)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_RisingWyner_2012.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

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

## 6. The approximation has two distinct steps

The paper's market has i.i.d. returns, an invertible covariance matrix, a riskless asset, unrestricted shorting and borrowing, and no transaction costs. The risky weights need not sum to one: the residual weight belongs to cash. This financing convention is essential for the scalar fractional-Kelly interpretation. In a fully invested risky-only universe, multiplying all risky weights by a fraction breaks the budget constraint unless a cash asset is explicitly introduced.

There are two approximations between discrete-time expected log wealth and the displayed quadratic program. First, Taylor expansion gives

$$
E\log(1+X)=E[X]-\tfrac12E[X^2]+O(E|X|^3).
$$

Second, the paper replaces the second raw moment with the variance, dropping $(E[X])^2$. These steps are reasonable for sufficiently small one-period returns with controlled higher moments; neither is an identity for arbitrary discrete-time returns. Small *unlevered* returns are insufficient if an estimated optimizer takes enough leverage to make portfolio returns large or to permit bankruptcy. The log objective requires $1+X_w>0$ almost surely, whereas the unconstrained quadratic problem does not enforce that domain.

For an unbounded Gaussian distribution of simple returns, any nonzero exposure can put positive probability on negative terminal wealth. Consequently, the assertion in the source that normal returns make the inverse-covariance Kelly rule exact must be interpreted in the continuous-time diffusion setting, or as the familiar quadratic approximation. Gaussian simple returns by themselves do not resolve the logarithm's domain problem. The summary uses “approximate Kelly” consistently for the discrete-time optimization.

## 7. A useful loss identity and its statistical meaning

Put $m=\mu-r_f\mathbf1$ and let $w_K=\Sigma^{-1}m$ denote the quadratic optimum. Completing the square gives

$$
V_1(w)=r_f+\tfrac12m^\top\Sigma^{-1}m
-\tfrac12(w-w_K)^\top\Sigma(w-w_K).
$$

Therefore the approximate lost growth from an estimated or constrained allocation is

$$
L(w_K,w)=\tfrac12\|w-w_K\|_\Sigma^2.
$$

This identity explains why a visually small weight error can be expensive along a high-risk direction and why a large weight error can be inexpensive along a low-risk direction. It also identifies the economically relevant estimation loss: it is a covariance-weighted error in portfolio space, rather than unweighted mean-squared error in raw return forecasts.

If covariance is known and $\widehat m=m+e$, the plug-in position is $\widehat w_K=w_K+\Sigma^{-1}e$. Its lost growth is exactly $\tfrac12e^\top\Sigma^{-1}e$ within the approximation. For an unbiased sample mean from $n$ independent observations, $E[ee^\top]=\Sigma/n$, so expected lost growth is $k/(2n)$, where $k$ is the number of risky assets. This last expression is a direct calculation illustrating the paper's mechanism; it is not an additional empirical result reported in the proceedings paper. It makes the relevant dimensional burden explicit even when the risk model is perfect.

For a known opportunity set and a chosen fraction $f$,

$$
V_1(fw_K)-r_f=(f-\tfrac12f^2)S^2,
\qquad \operatorname{Var}(X_{fw_K})=f^2S^2,
\quad S^2=m^\top\Sigma^{-1}m.
$$

Thus half Kelly retains three quarters of the optimal excess growth in this quadratic model and one quarter of its variance. Volatility itself falls by one half. The source's introductory use of “volatility” for a quantity scaling as $f^2$ should be read as variance. These are useful distinctions when comparing performance at a common risk target: a reduction in risk alone does not establish improved forecasting or a larger Sharpe ratio.

## 8. Correct derivation of the variance-penalty result

For the objective in Theorem IV.3,

$$
J(w)=V_1(w_K)-V_1(w)+\lambda w^\top\Sigma w,
$$

the derivative is

$$
\nabla J(w)=-m+(1+2\lambda)\Sigma w.
$$

Hence $w=(1+2\lambda)^{-1}w_K$, with positive-definite Hessian $(1+2\lambda)\Sigma$ for $\lambda>-1/2$. The source's displayed derivative has a sign/coefficient typo, although the theorem's fractional-Kelly answer is correct. For an ordinary nonnegative variance penalty, $\lambda\ge0$ and the fraction lies in $(0,1]$.

This result is a preference statement given known parameters. The shrinkage theorem is a different statement about parameter estimation. They can produce the same numerical portfolio while supplying different economic explanations. A risk-averse investor can rationally use partial Kelly even with known parameters; a log-utility investor can use partial Kelly relative to a noisy plug-in rule because the rule exaggerates the opportunity set. The paper's evidence supports the importance of the second mechanism, not the impossibility of the first.

## 9. The exact shrinkage coefficient before asymptotic expansion

For a fixed target $r_f\mathbf1$ and an unbiased sample mean, define $b=\|m\|_2^2$ and $v=\operatorname{tr}(\Sigma)/n$. The squared Euclidean estimation loss of the shrunk mean is

$$
E\|\alpha r_f\mathbf1+(1-\alpha)\widehat\mu-\mu\|_2^2
=\alpha^2b+(1-\alpha)^2v.
$$

Differentiating yields

$$
\alpha^*=\frac{v}{b+v}
=\frac{\operatorname{tr}(\Sigma)}{n\|m\|_2^2+\operatorname{tr}(\Sigma)}.
$$

This finite-sample expression is in the proof of Theorem V.2; the theorem emphasizes its $1/n$ expansion. The expansion is informative when $b$ is fixed and positive as $n$ grows. It is unreliable when the true excess-mean vector is close to zero, precisely when shrinkage can be strongest. A literal plug-in of the leading term may exceed one and should be clipped to the admitted interval, or replaced by an estimator based on the bounded exact expression. Consistency alone does not make the plug-in intensity optimal in a small sample.

There is a further distinction between the chosen statistical loss and portfolio loss. The theorem minimizes ordinary Euclidean mean error. In contrast, the completed-square identity weights forecast error by $\Sigma^{-1}$. The two criteria coincide only under appropriate scaling or special covariance structures. Changing the units of individual assets changes an unweighted Euclidean criterion. Thus the paper provides a principled shrinkage-based Kelly fraction, but does not prove that this fraction maximizes realized expected log growth under every return model or covariance estimator.

## 10. What the numerical evidence establishes

Figure 1 uses S&P 500 component stocks that traded continuously under the same ticker from January 1, 1999 through December 31, 2010. It compares realized log-growth averages with their quadratic counterparts at the individual-stock level. The largest discrepancy is associated with Pier One, whose price nearly quadrupled on March 23, 2009. The reported maximum absolute discrepancy is approximately $8\times10^{-4}$; excluding that outlier, mean absolute discrepancy is approximately $3.9\times10^{-6}$. This supports the approximation for many daily large-cap observations, while visibly identifying a failure mode for large jumps. It does not validate a highly leveraged portfolio's log expansion.

Figure 2 uses 1,000 simulation trials involving portfolios of 25 randomly selected stocks. It compares an improved-mean/sample-covariance portfolio with a sample-mean/true-covariance portfolio, measuring approximate growth lost through estimation. The former performs substantially better in the reported comparison. This is evidence that controlling mean error can matter more than having an oracle covariance matrix in that design. It is neither an executable historical backtest with trading costs nor a universal ranking of mean and covariance estimation errors.

## 11. Implementation and research use

A practical implementation should first specify the return horizon, cash rate, and admissible leverage; estimate mean and covariance on a strictly past sample; compute an intensity with an explicitly chosen loss; solve the linear system rather than explicitly forming a numerical inverse; and evaluate the resulting fraction under the true financed portfolio-return formula. A stable or regularized covariance estimator can be combined with mean shrinkage, but then the contribution of each regularizer should be evaluated separately.

For a meaningful comparison, include sample Kelly, fractional Kelly, shrinkage Kelly, and risk-matched controls. Measure realized log growth, drawdown, bankruptcy/domain violations, turnover and net costs, not just arithmetic Sharpe ratio. Roll or refit the intensity without using future data. The paper leaves covariance-shrinkage design and the analogous relationship for gambling with non-negligible higher moments as open problems. Its narrow durable contribution is the exact algebraic mapping between scalar shrinkage of excess means and scalar shrinkage of approximate Kelly exposures.
