## 1. Metadata

- **Title:** Multi-period Portfolio Optimization with Alpha Decay
- **Author(s):** Kartik Sivaramakrishnan, Vishv Jeet, and Dieter Vandenbussche
- **Year:** 2015
- **Journal/Venue:** Axioma research paper

## 2. Problem statement

The paper asks how a portfolio optimizer should trade off a strong but fast-decaying alpha signal against a weaker but more persistent alpha signal. The specific mathematical problem is to determine whether a simple two-stage multi-period optimization can improve on single-period Markowitz optimization when alpha has multiple decay horizons and realistic trading constraints.

## 3. Approach (short)

The method is rolling-horizon multi-period optimization. The authors formulate a two-stage objective with risk and transaction costs in each stage, model the forecast alpha as the sum of short- and long-horizon components, solve the first-stage portfolio repeatedly through time, and compare the resulting backtest with a single-period optimizer. In the unconstrained quadratic-cost case they derive the first-stage solution in closed form.

## 4. Approach (detailed)

1. **Write the two-stage objective.**

   The portfolio chooses first-stage holdings $w_1$ and second-stage holdings $w_2$:
   $$
   \max\ \alpha_1^\top w_1-\delta\,TC(\Delta w_1)-\gamma w_1^\top \Sigma w_1
   +E[\alpha_2]^\top w_2-\delta\,TC(\Delta w_2)-\gamma w_2^\top \Sigma w_2,
   $$
   subject to
   $$
   w_1=w_0+\Delta w_1,\qquad
   w_2=(1+r)w_1+\Delta w_2,
   $$
   and stage-specific constraints $w_1\in C_1$, $w_2\in C_2$.

2. **Model alpha decay.**

   The first-stage alpha is
   $$
   \alpha_1=\lambda_s \alpha_s + \lambda_l \alpha_l,
   $$
   where:
   - $\alpha_s$ is strong but decays quickly,
   - $\alpha_l$ is weaker but persistent.

   The second-stage expected alpha is
   $$
   E[\alpha_2]=\sigma_s \lambda_s \alpha_s + \sigma_l \lambda_l \alpha_l,
   $$
   with $\sigma_s<\sigma_l$ because the long signal decays more slowly.

3. **Interpret the economic trade-off.**

   A single-period optimizer chases current alpha. That means it overweights $\alpha_s$, which raises turnover. The multi-period rule internalizes the fact that next period's optimizer will still "see" the slow alpha but not much of the fast alpha.

4. **Derive the unconstrained quadratic-cost solution.**

   Under
   $$
   TC(\Delta w)=\frac12 \Delta w^\top \Lambda \Delta w,\qquad \Lambda=\delta \Sigma,
   $$
   the technical appendix derives
   $$
   w_1
   = a\Sigma^{-1}\alpha_1 + a\delta w_0 + a\frac{\delta}{\delta+\gamma}\Sigma^{-1}E[\alpha_2],
   $$
   where
   $$
   a=\frac{\gamma+\delta}{(\gamma+\delta)^2+\delta\gamma}.
   $$
   So the first-stage portfolio is a nonnegative combination of:
   - the current portfolio $w_0$,
   - the stage-1 Markowitz target,
   - the stage-2 expected Markowitz target.

5. **Recover the first-stage MPO solution from an adjusted SPO problem.**

   The appendix then shows that there exists a single-period problem with modified transaction-cost parameter $\bar\delta$ and modified alpha weights $(\bar\lambda_s,\bar\lambda_l)$ that reproduces the first-stage multi-period solution. The comparative statics imply
   $$
   \frac{\bar\lambda_s}{\bar\lambda_l}<\frac{\lambda_s}{\lambda_l},
   $$
   so the equivalent single-period rule must upweight the long-lived signal relative to the short-lived one.

6. **Implement in rolling horizon.**

   In each backtest period:
   - estimate the short and long alpha components,
   - solve the two-stage optimization,
   - execute only the first-stage portfolio,
   - roll forward with realized returns,
   - re-solve next period.

7. **Empirical result.**

   On both a simulated example and a large realistic strategy, the multi-period model tends to outperform the single-period one out of sample when signal half-lives differ materially. The gain comes from reducing unnecessary turnover while preserving exposure to persistent alpha.

## 5. Domain of applicability

- The method applies when alpha is naturally decomposed into multiple horizons and transaction costs matter.
- The clean closed-form solution requires quadratic costs and no binding nonconvexities. With realistic constraints the paper relies on numerical optimization rather than proof.
- The framework is short-horizon and approximate. It is not a full dynamic-programming solution to the infinite-horizon problem.
- The empirical claim is specific to alpha-decay environments; if all alpha is very short-lived or very persistent, the multi-period advantage can shrink.
