# 1. Metadata

- **Title:** Optimal Portfolio Diversification Using the Maximum Entropy Principle
- **Author(s):** Anil K. Bera, Sung Y. Park
- **Year:** 2008
- **Journal/Venue:** Journal venue not cleanly identifiable from the extracted file; the article is a published journal paper

# 2. Problem statement

The paper asks whether portfolio construction can be formulated as an **entropy-projection problem** rather than a mean-variance problem. More precisely: given estimated means and covariances, can one choose portfolio weights by minimizing deviation from a diversified prior (typically equal weight) subject to moment or utility constraints, thereby reducing the error-maximization problem of Markowitz optimization?

# 3. Approach (short)

The method replaces the quadratic objective of Markowitz optimization with Shannon entropy or Kullback-Leibler cross-entropy. In the long-only case, weights are treated like probabilities. The portfolio is chosen as the maximum-entropy or minimum-cross-entropy distribution satisfying return/risk constraints. For cases with shorting, generalized cross-entropy (GCE) is used by representing weights through probability masses on support points.

# 4. Approach (detailed)

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
   subject to the portfolio constraints translated into the support representation. This converts a potentially nonconvex direct weight-selection problem into an entropy projection over probabilities.

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

# 5. Domain of applicability

- The method applies naturally to **long-only** portfolios and more generally to settings where weights can be represented through support probabilities.
- It is strongest when the investor wants an explicit **diversification prior** and expects substantial estimation noise in $(m,\Sigma)$.
- Results depend on:
  - the choice of prior $q$,
  - the support grid in GCE,
  - the chosen return/risk constraints.
- The paper does not prove that entropy dominates Markowitz for all utility functions. It proves only that entropy construction is a coherent constrained projection and documents empirical robustness.
