## 1. Metadata

- **Title:** Dynamic Portfolio Optimization with Ambiguity Aversion
- **Author(s):** Jinqing Zhang, Zeyu Jin, and Yunbi An
- **Year:** 2017
- **Journal/Venue:** *Journal of Banking & Finance*

## 2. Problem statement

The paper asks how dynamic portfolio choice with transaction costs changes when the investor is ambiguity averse about both expected returns and the dynamics of return predictors. The specific objective is to derive a closed-form robust trading rule within the Gârleanu-Pedersen dynamic rebalancing framework and to explain how ambiguity aversion alters the target portfolio and the speed of trading.

## 3. Approach (short)

The method starts from a linear predictive-return model with quadratic transaction costs and introduces ambiguity through distortions to the conditional laws of return shocks and predictor shocks, constrained by relative entropy. Robust control is then used to solve the max-min problem. The result is a partially-adjusting trading rule toward a robust aim portfolio, with new terms absent from the non-robust model.

## 4. Approach (detailed)

1. **Baseline predictive model.**

   Excess returns satisfy
   $$
   r_{t+1}=Bf_t + u_{t+1},
   $$
   and predictors evolve as
   $$
   f_{t+1}=\Delta f_t + v_{t+1}.
   $$
   Portfolio rebalancing from $x_{t-1}$ to $x_t$ incurs quadratic transaction costs
   $$
   TC_t = \frac{1}{2}(x_t-x_{t-1})^\top \Lambda (x_t-x_{t-1}).
   $$

2. **Model ambiguity explicitly.**

   Estimation errors in returns and predictor dynamics are represented by distorted conditional means:
   $$
   e_{u,t+1}=E_t^{\sim}(u_{t+1}),\qquad
   e_{v,t+1}=E_t^{\sim}(v_{t+1}),
   $$
   induced by a change of probability measure. The size of the distortion is constrained by relative entropy, producing ellipsoidal ambiguity sets.

3. **Solve the robust control problem.**

   The investor chooses $x_t$ to maximize worst-case discounted risk-adjusted returns net of transaction costs. The robust Bellman recursion preserves quadratic value-function form, so the optimal policy remains affine.

4. **Partial adjustment toward a robust aim portfolio.**

   The optimal robust policy has the familiar structure
   $$
   x_t^* = x_{t-1} + \Gamma_t\big(\text{aim}_t - x_{t-1}\big),
   $$
   where $\Gamma_t$ depends on transaction costs, risk aversion, and ambiguity aversion. Ambiguity aversion makes the investor trade more conservatively overall but can also increase the speed of adjustment toward a safer target.

5. **Characterize the robust aim portfolio.**

   As in Gârleanu-Pedersen, the aim portfolio is a weighted average of the current Markowitz portfolio and future target portfolios. But with ambiguity aversion it also incorporates a penalty for estimation-error exposure:

   - less weight on highly volatile predictors,
   - less weight on securities with large, costly existing positions,
   - and hence lower expected loss from misestimated signals.

6. **Three trading principles.**

   The robust strategy obeys:

   1. trade partially toward an aim portfolio;
   2. aim in front of the future target, as in the GP model;
   3. additionally, aim to reduce expected loss from estimation error.

   The third is the novel ambiguity-driven channel.

### Proof sketch

The proof uses change-of-measure methods to express ambiguity through distorted conditional Gaussian shocks. Relative entropy constraints imply worst-case distortions linear in the shocks. Plugging these into the dynamic programming problem preserves quadratic structure, allowing the Bellman equation to be solved in closed form. The partial-adjustment rule then follows from the first-order conditions.

## 5. Domain of applicability

The method applies to dynamic trading problems with linear return predictability, quadratic transaction costs, Gaussian shock structure, and ambiguity represented by relative entropy balls. It is especially relevant where predictor estimation error is economically important. It is less informative outside this linear-quadratic-Gaussian structure, and the closed form depends heavily on those assumptions. The paper's empirical claims are therefore best read as evidence for that class of robust timing models, not for ambiguity aversion in complete generality.
