## 1. Metadata

- **Title:** Global Portfolio Optimization
- **Author(s):** Fischer Black and Robert Litterman
- **Year:** 1992
- **Journal/Venue:** *Financial Analysts Journal*

## 2. Problem statement

The paper asks how to make global mean-variance optimization usable in practice when investors have strong views on only a small number of assets and weak or no views on the rest. The precise problem is to generate a full vector of expected excess returns for a large global opportunity set without producing unstable, corner-solution portfolios.

## 3. Approach (short)

The method combines equilibrium-implied expected returns with investor views and confidence levels. Conceptually, it is a shrinkage/Bayesian blending procedure: start from CAPM-consistent equilibrium returns as the neutral prior, then tilt them toward the investor's absolute or relative views in proportion to confidence. The resulting expected-return vector is then fed into a standard optimizer.

## 4. Approach (detailed)

1. **Recognize the failure mode of naive MVO.**

   Standard mean-variance optimization requires an expected excess return for every asset and currency. Small errors in those means produce extreme long-short and corner portfolios. The paper's starting claim is that the optimizer is not the real problem; the unstable input vector of means is.

2. **Use equilibrium as the neutral starting point.**

   Let $w^{mkt}$ denote world market-cap weights and $\Sigma$ the covariance matrix of excess returns. The neutral expected returns are the ones consistent with holding $w^{mkt}$ in equilibrium:
   $$
   \pi = \delta \Sigma w^{mkt},
   $$
   where $\delta$ is the representative risk-aversion coefficient. In the article this is presented economically, not with later compact Bayesian notation, but this is the modern equivalent.

3. **Encode views.**

   Suppose the investor has $K$ views, such as:
   - asset $i$ will outperform by $q_k$,
   - asset $i$ will outperform asset $j$ by $q_k$.

   In modern matrix notation,
   $$
   P\mu = q,
   $$
   where each row of $P$ picks out the assets involved in one view.

4. **Attach confidence to each view.**

   Views should not be imposed as hard constraints. The innovation of the paper is to let confidence determine how far the posterior mean departs from equilibrium. In modern Gaussian notation this becomes
   $$
   \mu^{BL}
   =
   \left[(\tau\Sigma)^{-1}+P^\top \Omega^{-1}P\right]^{-1}
   \left[(\tau\Sigma)^{-1}\pi + P^\top \Omega^{-1} q\right],
   $$
   where $\Omega$ is the covariance matrix of view errors and $\tau\Sigma$ scales prior uncertainty.

   The original article conveys the same logic verbally and graphically: lower confidence leaves returns close to equilibrium; higher confidence moves them toward the investor's stated views.

5. **Re-optimize using the blended means.**

   The final portfolio solves a standard mean-variance problem with:
   - covariance matrix $\Sigma$,
   - expected-return vector $\mu^{BL}$.

   Relative to naive optimization, the solution stays close to the equilibrium portfolio unless there is strong, high-confidence information to justify a departure.

6. **Interpret the method economically.**

   The paper's core idea is not "Bayesian statistics" for its own sake. It is a portfolio-construction rule:
   - equilibrium supplies the missing expected returns for assets on which the investor has no opinion,
   - views enter only where the investor actually has information,
   - confidence controls the magnitude of the tilt.

7. **What is exact and what is later formalization.**

   The paper itself is mainly practitioner-theoretic exposition; it does not present the now-standard posterior formula in full matrix detail. The exact contribution of the article is the equilibrium-plus-views construction with confidence-weighted blending. The closed-form posterior expression above is the mathematically equivalent later formulation that makes implementation precise.

## 5. Domain of applicability

- The method applies when one has a reliable covariance model and only sparse expected-return information.
- It is especially useful in benchmark-relative and global allocation settings where equilibrium weights are meaningful and no-view assets are numerous.
- The equilibrium prior inherits CAPM-style assumptions. If market weights are badly distorted or if equilibrium returns are not a sensible neutral point, the prior can mislead.
- Confidence calibration is critical. The article is conceptually clear about this but less operational than later formalizations; actual implementation requires choosing $\tau$ and $\Omega$.
- The paper justifies shrinkage toward equilibrium, not arbitrary posterior engineering. Claims of universal superiority depend on the quality of the covariance model, benchmark, and view specification.
