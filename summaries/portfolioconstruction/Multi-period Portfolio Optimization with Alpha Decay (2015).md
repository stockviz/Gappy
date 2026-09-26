# Multi-period Portfolio Optimization with Alpha Decay

**Source:** [MultiPeriodOptimization_SivaramakrishnanVandenbussche_2015.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/MultiPeriodOptimization_SivaramakrishnanVandenbussche_2015.pdf>)  
**Source coverage:** Two-stage formulation, rolling algorithm, synthetic and S&P 500 signal-generation experiments, conclusions, and technical appendix.

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

   Using the specialized objective with risk penalty $\gamma w^\top\Sigma w/2$ and total cost curvature $\delta\Sigma$ (without a second external $\delta$ multiplier),
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

   In both the synthetic example and a larger constrained experiment using engineered forward-return signals, the multi-period model tends to outperform the single-period method when signal persistence differs materially. The gain comes from reducing unnecessary turnover while preserving exposure to persistent alpha.

## 5. Domain of applicability

- The method applies when alpha is naturally decomposed into multiple horizons and transaction costs matter.
- The clean closed-form solution requires quadratic costs and no binding nonconvexities. With realistic constraints the paper relies on numerical optimization rather than proof.
- The framework is short-horizon and approximate. It is not a full dynamic-programming solution to the infinite-horizon problem.
- The empirical claim is specific to alpha-decay environments; if all alpha is very short-lived or very persistent, the multi-period advantage can shrink.


## 6. A two-stage planning approximation, not full stochastic recourse

The source is a draft Axioma research paper dated 19 February 2015. Its central object is a rolling two-stage optimization. The first stage is the trade to execute now; the second describes the trade anticipated after the next rebalance. Only the first decision is implemented. When the next period arrives, signals and holdings are updated and the entire problem is solved again.

The second-stage alpha is represented by its conditional expectation under the assumed decay law. The optimization does not build a full scenario tree whose future holdings depend on every possible future signal realization. It is therefore a certainty-equivalent planning heuristic relative to the general stochastic control problem. Calling it “wait-and-see” expresses the benefit of anticipating later choices, but should not imply that it solves arbitrary state-contingent recourse exactly.

The paper's broad formulation includes roll-forward holdings $(1+r)w_1$, interpreted componentwise when returns differ across assets. Actual normalized portfolio weights require consistent treatment of total wealth and cash; dollar holdings and fractions of wealth must not be mixed. The clean analytic derivation sets the forecast roll-forward return to zero and uses the same covariance matrix at both stages.

## 7. Deriving the closed-form first trade without double-counting costs

Use the following internally consistent normalization:

$$\max_{w_1,w_2}\sum_{j=1}^2
\left[\alpha_j'w_j-\frac\gamma2w_j'\Sigma w_j
-\frac\delta2(w_j-w_{j-1})'\Sigma(w_j-w_{j-1})\right],$$

with $w_0$ fixed and $\alpha_2$ denoting the forecast conditional mean for stage two. Here $\delta\Sigma$ is the transaction-cost curvature. One should not additionally multiply by another $\delta$ after already defining the curvature as $\delta\Sigma$; the paper's general and specialized formulations use different notational normalizations.

The first-order conditions are

$$(\gamma+2\delta)\Sigma w_1-\delta\Sigma w_2
=\alpha_1+\delta\Sigma w_0,$$

$$(\gamma+\delta)\Sigma w_2-\delta\Sigma w_1=\alpha_2.$$

Eliminating $w_2$ gives

$$w_1=\psi\left[\Sigma^{-1}\alpha_1+\delta w_0
+\frac\delta{\gamma+\delta}\Sigma^{-1}\alpha_2\right],$$

$$\psi=\frac{\gamma+\delta}{(\gamma+\delta)^2+\gamma\delta}.$$

This verifies both the denominator and the coefficient on the anticipated future alpha. The present position matters because moving away from it costs money; the future alpha matters because a position opened now can retain value and avoid a later trade. If $\delta=0$, $w_1=\gamma^{-1}\Sigma^{-1}\alpha_1$: without transaction-cost coupling, tomorrow's target does not alter today's solution in this specialized setup.

With $\alpha_1=\lambda_s\alpha_s+\lambda_l\alpha_l$ and $\alpha_2=\sigma_s\lambda_s\alpha_s+\sigma_l\lambda_l\alpha_l$, the effective coefficient on each current component is

$$\lambda_k\left(1+\frac{\delta\sigma_k}{\gamma+\delta}\right).$$

The persistent signal receives the larger relative multiplier when $\sigma_l>\sigma_s$. This is a conditional result about signal weights, not a statement that the longer-lived signal must dominate the final holdings. Its original predictive strength, covariance, current positions, and costs all still matter.

### 7.1 An equivalent single-period problem

For an unrestricted single-period objective with cost coefficient $\bar\delta$, the solution is

$$w^{SPO}=\frac1{\gamma+\bar\delta}\Sigma^{-1}\bar\alpha
+\frac{\bar\delta}{\gamma+\bar\delta}w_0.$$

Matching the coefficient on $w_0$ gives

$$\bar\delta=\frac{\delta(\gamma+\delta)}{\gamma+2\delta}.$$

Matching the alpha terms gives the equivalent component weights

$$\bar\lambda_k=\frac{\gamma+\delta+\delta\sigma_k}{\gamma+2\delta}\lambda_k.$$

Hence the short-to-long coefficient ratio is reduced when the long signal is more persistent. This derivation clarifies that both signal calibration and the cost parameter change. Matching only the alpha ratio generally does not reproduce the first-stage portfolio because it leaves the coefficient on existing holdings wrong.

The equivalence depends on the common risk/cost matrix, zero assumed roll-forward return, quadratic costs, and absence of binding restrictions. With general cost matrices, the adjustment is matrix-valued; with stage-dependent bounds or turnover limits, active constraints make a fixed scalar signal reweighting inadequate. This is why the numerical constrained comparisons add information beyond the unconstrained formula.

## 8. What the experiments are designed to test

The first synthetic example uses ten assets with simulated normal returns, 20% annualized volatility, and pairwise correlation 0.5. Short and long signals are constructed through backward-looking-in-the-generation-procedure EWMAs of future realized returns plus noise, so that their predictive content and persistence can be controlled. The short signal has autoregressive coefficient $2/3$ and the long signal $260/261$. The construction deliberately embeds forecast information in synthetic signals.

The term “backwards” here is crucial: these are engineered signals built from future returns for an optimization experiment. They are not implementable predictors discovered using only past market data. The purpose is to hold alpha quality and decay under control and ask which optimizer uses that information more effectively.

The larger “realistic” backtest likewise builds signals from 24-month forward-looking S&P 500 realized returns plus noise, with short and long half-lives of 0.3 and 6 months, respectively. Thirty signal series are generated by varying noise. Thus “realistic” concerns the asset environment and portfolio constraints, not a claim that the forecasts are available in real time. The original brief summary's description of the result as ordinary out-of-sample strategy evidence would be misleading.

The paper reports signal information ratios defined as annualized mean IC divided by the standard deviation of IC. These are not the realized information ratios of the final portfolios. For the larger example the immediate short-signal figure is 1.81 versus 1.24 for the long signal; one month later the figures are 0.30 and 1.15, respectively. This verifies the intended contrast between stronger immediate information and more persistent information.

The authors vary relative short/long signal weights to produce frontiers for both single- and multi-period methods. Comparing their best observed Sharpe ratios asks whether simple fixed reweighting can reproduce the advantage. The multi-period advantage is more evident under more complex constraints, including turnover and imposed leverage structures. Choosing the best point after observing the frontier is a methodological comparison, not a prospectively validated hyperparameter-selection rule.

## 9. Interpretation of the results and a production translation

The two-stage optimizer generally performs better in the designed experiments because it treats a trade as the start of a position path rather than as a one-period bet. A persistent but weaker signal can justify a larger position when its benefits extend beyond the next rebalance. A transient signal can still be useful for timing or modifying that trade. The method does not mechanically discard fast information.

The source also reports experiments with different assumed roll-forward returns. Using scaled short-term alpha gives similar performance to the zero-return planning assumption in their tests, while using the true future return substantially improves outcomes. The authors explicitly identify the latter as impractical. This is an informative sensitivity experiment: future holdings evolution can matter greatly, but access to the correct future roll-forward return cannot be assumed.

For implementation, forecast each component's persistence using information available before trading, keep alpha and risk horizons consistent, estimate costs in the same position units, and propagate actual holdings between rebalances. The planned second-stage portfolio should be inspected for feasibility and terminal-horizon artifacts, even though it is not executed. A two-stage model can understate costs or overvalue terminal positions if its endpoint treatment does not reflect the intended continuation.

A longer horizon may improve planning but introduces additional forecast error and computational cost. Likewise, adding constraints does not make dynamic programming mathematically impossible; it makes a simple analytic policy and low-dimensional solution less available. The paper chooses mathematical programming as a practical way to handle these constraints, rather than proving that every alternative solution method is invalid.

The main result is a transparent demonstration that alpha persistence changes the economically appropriate signal blend when trading is costly. Its strongest evidence concerns portfolio-construction efficiency under controlled predictive signals. Demonstrating net investment performance would additionally require genuinely prospective forecasts, point-in-time calibration, and realistic costs and constraints.
