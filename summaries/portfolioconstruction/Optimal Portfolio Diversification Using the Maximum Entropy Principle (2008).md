# Optimal Portfolio Diversification Using the Maximum Entropy Principle

**Source:** [EntropyPortfolio_Bera_2008.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/EntropyPortfolio_Bera_2008.pdf>)  
**Source coverage:** Entropy and cross-entropy derivations, resampled utility-threshold procedure, signed-weight GCE construction, and empirical comparison tables.

## 1. Metadata

- **Title:** Optimal Portfolio Diversification Using the Maximum Entropy Principle
- **Author(s):** Anil K. Bera, Sung Y. Park
- **Year:** 2008
- **Journal/Venue:** *Econometric Reviews*, 27(4–6), 484–512

## 2. Problem statement

The paper asks whether portfolio construction can be formulated as an **entropy-projection problem** rather than a mean-variance problem. More precisely: given estimated means and covariances, can one choose portfolio weights by minimizing deviation from a diversified prior (typically equal weight) subject to moment or utility constraints, thereby reducing the error-maximization problem of Markowitz optimization?

## 3. Approach (short)

The method replaces the quadratic objective of Markowitz optimization with Shannon entropy or Kullback-Leibler cross-entropy. In the long-only case, weights are treated like probabilities. The portfolio is chosen as the maximum-entropy or minimum-cross-entropy distribution satisfying return/risk constraints. For cases with shorting, generalized cross-entropy (GCE) is used by representing weights through probability masses on support points.

## 4. Approach (detailed)

1. **Markowitz benchmark**

   The starting point is the standard efficient-set problem
   $$
   \min_w \; w^\top \Sigma w
   \quad\text{s.t.}\quad
   w^\top m=\mu_0,\qquad
   \mathbf 1^\top w=1.
   $$
   With
   $$
   A=\mathbf 1^\top \Sigma^{-1} m,\quad
   B=m^\top \Sigma^{-1} m,\quad
   C=\mathbf 1^\top \Sigma^{-1}\mathbf 1,\quad
   D=BC-A^2,
   $$
   the standard solution and frontier are
   $$
   \hat w
   =
   \lambda \Sigma^{-1}m+\gamma \Sigma^{-1}\mathbf 1,
   \qquad
   \sigma^2(\mu_0)=\frac{C\mu_0^2-2A\mu_0+B}{D}.
   $$
   The paper’s critique is the familiar one: because $\hat w$ responds aggressively to errors in $m$ and $\Sigma$, the resulting portfolios are often unstable and under-diversified.

2. **Maximum-entropy long-only formulation**

   Treat portfolio weights $w_i$ as probabilities:
   $$
   w_i\ge 0,\qquad \sum_{i=1}^N w_i=1.
   $$
   If only a target expected return $\mu_0$ is imposed, the paper proposes
   $$
   \max_w -\sum_{i=1}^N w_i\ln w_i
   $$
   subject to
   $$
   \sum_{i=1}^N \hat m_i w_i=\mu_0,\qquad
   \sum_{i=1}^N w_i=1.
   $$
   The Lagrangian is
   $$
   \mathcal L(w,\lambda,\nu)
   =
   -\sum_i w_i\ln w_i
   -\lambda\Big(\sum_i \hat m_i w_i-\mu_0\Big)
   -\nu\Big(\sum_i w_i-1\Big).
   $$
   FOCs give
   $$
   -(1+\ln w_i)-\lambda \hat m_i-\nu=0
   \quad\Rightarrow\quad
   w_i=\frac{\exp(-\lambda \hat m_i)}{\Psi(\lambda)},
   $$
   where
   $$
   \Psi(\lambda)=\sum_{j=1}^N \exp(-\lambda \hat m_j).
   $$
   Thus the entropy-optimal portfolio is an exponential tilt of the equal-weight prior.

3. **Cross-entropy interpretation**

   Since
   $$
   CE(w,q)=\sum_{i=1}^N w_i\ln\frac{w_i}{q_i},
   $$
   choosing $q_i=1/N$ implies
   $$
   CE(w,q)=\sum_i w_i\ln w_i + \ln N.
   $$
   Therefore maximizing Shannon entropy is exactly the same as minimizing cross-entropy relative to the equal-weight portfolio. This is the paper’s core interpretation:

   - the optimized portfolio should remain as close as possible to a diversified prior;
   - constraints encode the investor’s information or preferences.

4. **Adding a risk constraint**

   To include risk, the paper proposes
   $$
   \max_w -w^\top \ln w
   $$
   subject to
   $$
   w^\top \hat m \ge \mu_0,\qquad
   w^\top \hat\Sigma w \le \sigma_0^2,\qquad
   w\ge 0,\qquad
   \mathbf 1^\top w=1.
   $$
   This is no longer analytically closed form because of the quadratic inequality
   $$
   w^\top \hat\Sigma w \le \sigma_0^2.
   $$
   But it remains a well-defined convex feasibility/optimization problem. Relative to Markowitz, the crucial change is that the objective penalizes concentration directly rather than rewarding sample-mean extremes.

5. **General cross-entropy formulation**

   The paper then generalizes from equal-weight priors to arbitrary priors $q$, motivated by Bayes-Stein shrinkage or prior beliefs:
   $$
   \min_w \sum_i w_i \ln\frac{w_i}{q_i}
   $$
   subject to investor constraints. If $q$ is itself a shrinkage portfolio, the method compounds two stabilizations:

   - shrinkage through $q$;
   - disciplined projection through the CE objective.

6. **Generalized cross-entropy with shorting**

   The long-only entropy formulation works because $w$ is a probability vector. If shorting is allowed, weights are no longer nonnegative and do not sum to one in a probability sense. The paper therefore uses generalized cross-entropy (GCE).

   Represent each weight $w_i$ on a discrete support $z_{i1},\dots,z_{iK}$:
   $$
   w_i=\sum_{k=1}^K p_{ik} z_{ik},
   \qquad p_{ik}\ge 0,\qquad \sum_{k=1}^K p_{ik}=1.
   $$
   Then choose the probability masses $p_{ik}$ by minimizing
   $$
   \sum_{i=1}^N\sum_{k=1}^K p_{ik}\ln\frac{p_{ik}}{q_{ik}}
   $$
   subject to the portfolio constraints translated into the support representation. This makes entropy regularization meaningful for signed weights through an auxiliary probability representation; it does not by itself remove nonconvex constraints.

7. **Economic interpretation**

   The entropy objective is a diversification device. Markowitz optimization chooses the portfolio most favorable to the sample moments. Entropy chooses the least informative deviation from a diversified prior that still satisfies the constraints. In modern language, this is a regularized inverse problem.

8. **Proof/algebra**

   The exact mathematics in the paper is the exponential-family derivation above. The long-only solution follows directly from the Lagrange FOCs. The cross-entropy interpretation is an identity. The stronger claims about out-of-sample performance are empirical rather than proved from first principles.

**Additional mathematical details**

The central convex program is
$$
\min_{w_i\ge 0}\sum_{i=1}^N w_i\log\frac{w_i}{q_i}
$$
subject to
$$
\mathbf 1^\top w=1,\qquad
\mu^\top w=\mu_0,
$$
and, when imposed, a risk restriction such as $w^\top \Sigma w\le \sigma_0^2$. Here $q$ is a prior weight vector, typically $q_i=1/N$. Without the quadratic variance restriction, the KKT conditions imply an exponential tilt of the prior:
$$
w_i \propto q_i \exp(-\lambda_1-\lambda_2 \mu_i).
$$
With the variance restriction, closed form is generally lost, but the problem remains convex in the long-only case and retains the same shrinkage-to-prior interpretation.

For portfolios that allow shorting, the paper’s generalized cross-entropy device rewrites each weight as a discrete support expansion,
$$
w_i=\sum_{m=1}^M p_{im} z_{im},\qquad p_{im}\ge 0,\qquad \sum_m p_{im}=1,
$$
and then minimizes cross-entropy in the probabilities $p_{im}$. This converts a signed-weight problem back into a probability problem, which is why the entropy formalism can still be used after the long-only probability analogy breaks down.

## 5. Domain of applicability

- The method applies naturally to **long-only** portfolios and more generally to settings where weights can be represented through support probabilities.
- It is strongest when the investor wants an explicit **diversification prior** and expects substantial estimation noise in $(m,\Sigma)$.
- Results depend on:
  - the choice of prior $q$,
  - the support grid in GCE,
  - the chosen return/risk constraints.
- The paper does not prove that entropy dominates Markowitz for all utility functions. It proves only that entropy construction is a coherent constrained projection and documents empirical robustness.


## 6. The main contribution goes beyond a target-return entropy problem

The paper appeared in **Econometric Reviews 27(4–6), 484–512 (2008)**. Its distinctive proposal combines direct shrinkage of portfolio weights with a **resampling-calibrated utility threshold**. The simple target-mean exponential tilt is a preliminary motivation, not the full empirical method.

Let the sample mean–variance score be

$$Q(w)=w'\hat m-\frac\lambda2w'\hat\Sigma w.$$

The general construction is

$$\min_{w\ge0,\;\mathbf1'w=1}D_{KL}(w\|q)
\quad\text{subject to}\quad Q(w)\ge\tau.$$

The reference portfolio $q$ represents the desired prior allocation. The utility threshold $\tau$ determines how much departure from the sample optimum is acceptable in light of estimation imprecision. Rather than adjusting moments first and then solving a conventional optimizer, the method chooses the least departure from a selected allocation that still satisfies the required sample utility.

If $q$ itself satisfies the threshold, it is the solution because KL divergence is minimized at zero. If the threshold approaches the maximum feasible sample utility and that optimum is unique, the feasible set contracts toward the conventional mean–variance solution. Between these cases, the procedure traces a utility-versus-deviation trade-off. It is not generally a straight-line weighted average of $q$ and the Markowitz portfolio.

### 6.1 How resampling sets the threshold

The algorithm repeatedly resamples a return history, computes moments from each resample, and optimizes the corresponding mean–variance problem. Denote the resulting portfolio by $\check w_b$. It then evaluates **each of those portfolios using the original sample moments**:

$$\xi_b=\check w_b'\hat m-\frac\lambda2\check w_b'\hat\Sigma\check w_b.$$

The threshold is an empirical quantile, $\tau=\hat G^{-1}(r)$, of these scores. This distinction between optimizing on resampled inputs and evaluating on common original inputs is central. Evaluating each portfolio only on the same resample that selected it would produce a different distribution and a different procedure.

A lower quantile loosens the required score and permits more movement toward the reference allocation. In the authors' interpretation this corresponds to less confidence in the moment estimates and greater concern about estimation uncertainty. A higher quantile restricts shrinkage more strongly. The resampled score distribution is a calibration device; it is not automatically a frequentist confidence interval with guaranteed coverage for an unknown true optimal utility without additional justification.

Resampling assumes that its generating mechanism adequately represents relevant uncertainty. An iid bootstrap does not preserve arbitrary serial dependence or structural breaks. Increasing the number of resamples improves numerical precision conditional on the empirical distribution, but does not repair a poor model of the data-generating process.

## 7. Convexity, priors, and useful first-order conditions

With $\hat\Sigma$ positive semidefinite, $Q(w)$ is concave. Its superlevel set $Q(w)\ge\tau$ is convex. The KL objective is convex and strictly convex on the positive simplex when the reference weights are positive. Therefore the long-only problem is a convex optimization problem, with a unique feasible minimizer under standard conditions.

The source sometimes motivates the preliminary mean/volatility restrictions through a kinked Leontief utility. That does not make the explicitly constrained entropy program intrinsically nonsmooth or intractable: a positive-semidefinite quadratic risk inequality and a linear return constraint can be handled directly by convex optimization. It is unnecessary to optimize the kinked utility representation itself.

For an interior solution with active utility threshold and multiplier $\eta\ge0$, the KKT condition is

$$\log(w_i/q_i)+1-\eta[\hat m_i-\lambda(\hat\Sigma w)_i]+\nu=0.$$

Hence

$$w_i\propto q_i\exp\{\eta[\hat m_i-\lambda(\hat\Sigma w)_i]\}.$$

This is an implicit relation because marginal risk depends on the entire portfolio. It clarifies the economic trade-off but is not the simple explicit exponential tilt obtained when only a linear mean constraint is imposed.

KL divergence is asymmetric and is not a Euclidean distance. Locally around a positive reference allocation,

$$D_{KL}(q+\Delta\|q)\approx\frac12\sum_i\frac{\Delta_i^2}{q_i},\qquad
\mathbf1'\Delta=0.$$

Small reference positions receive a larger local relative penalty for the same absolute adjustment. This helps explain the form of regularization. A zero reference weight is more consequential: finite KL divergence generally forbids positive allocation to that asset. Prior support must therefore be chosen deliberately, especially if a minimum-variance reference portfolio contains zero positions.

## 8. Signed portfolios and the generalized cross-entropy representation

The ordinary entropy analogy requires nonnegative weights summing to one. For signed holdings, the paper represents each weight as the expectation of a finite support variable:

$$w_i=\sum_k z_kp_{ik},\qquad p_{ik}\ge0,\quad\sum_kp_{ik}=1.$$

Portfolio budget and utility restrictions are imposed on the implied $w$. Cross-entropy is then minimized over the artificial probabilities $p_{ik}$ relative to prior support probabilities $q_{ik}$. These probabilities describe a representation of a signed decision variable; they are not probabilities that asset returns will realize particular values.

The support imposes bounds: each weight lies in the convex hull of the selected support points. Wider supports allow more extreme positions and change the regularization. The method does not create unrestricted shorting for free. Moreover, multiple probability vectors can map to the same weight; entropy chooses among these representations, so the support and prior probabilities influence the implicit preference over holdings.

The source discusses constructing prior support probabilities by maximum entropy subject to reproducing a desired reference weight. This is more structured than choosing arbitrary masses, but it does not eliminate the need to select a support or validate its economic implications.

A signed-weight Markowitz problem with linear constraints and a positive-semidefinite covariance matrix is already convex. The GCE representation makes entropy applicable to signed variables; it does not generally “convert a nonconvex signed portfolio problem into a convex one.” Convexity of the transformed problem depends on the original constraints and their expression through the linear support map.

## 9. Empirical evidence and its interpretation

The application uses eight international equity indices, monthly US-dollar returns from December 1969 through July 2005, and 428 observations. The prose country list in the source omits one name despite repeatedly specifying eight indices; the table, rather than that incomplete list, should guide exact replication. The comparison includes conventional mean–variance, empirical Bayes, diffuse-prior Bayes, minimum variance, equal weight, resampled portfolios, and entropy variants with equal-weight or minimum-variance references.

Rolling estimation windows of 24, 48, 60, and 120 months probe sensitivity to sample size. The short windows are especially informative because moment-estimation noise is large relative to eight assets. The reported results favor the equal-weight-reference entropy method in several small-sample comparisons, while the minimum-variance-reference version performs well with longer windows. The source also reports cases where other resampling approaches outperform a particular entropy choice. There is no single method that uniformly wins for every window, prior, and quantile.

Plots of the US allocation show that entropy shrinkage can stabilize weights relative to conventional sample optimization. The lower-threshold versions move more toward the chosen reference and can vary less through time. That mechanism is distinct from an explicit transaction-cost penalty: more stable weights may reduce turnover, but the method does not by itself optimize the actual cost of trading from yesterday's holdings.

The reported performance measures include Sharpe ratios and mean–variance certainty-equivalent scores. These are model- and calibration-dependent summaries, not proof of expected-utility dominance for arbitrary investors. The source's discussion of elliptical returns should also be read carefully: mean–variance ordering can be sufficient under appropriate elliptical location-scale structure and preferences, but arbitrary expected utility is not literally equal to a quadratic score for every utility function and elliptical distribution. Moments must exist for the variance-based analysis.

## 10. What to retain for portfolio construction

The method offers a clear separation between a reference allocation and the evidence needed to depart from it. Its two main design choices are the reference portfolio and the acceptable sample-utility threshold. Resampling supplies a way to calibrate the latter, while KL divergence supplies a principled geometry for the former.

It remains sensitive to the same underlying data quality that motivates it. A misspecified prior can stabilize the wrong allocation, a too-demanding threshold can restore the noisy sample optimum, and a very loose threshold can disregard useful information. For signed portfolios, support choice adds another material parameter. A practical evaluation should vary these choices prospectively, report gross and net performance, and compare against the reference portfolio itself. The contribution is a coherent and empirically illustrated regularization method, not a distribution-free guarantee that entropy diversification outperforms risk-based optimization.
