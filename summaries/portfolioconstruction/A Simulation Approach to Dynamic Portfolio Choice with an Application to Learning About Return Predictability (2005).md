# A Simulation Approach to Dynamic Portfolio Choice with an Application to Learning About Return Predictability

**Source:** [Portfolio_Goyal_2005.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/Portfolio_Goyal_2005.pdf>)  
**Source coverage:** Method sections, Taylor formulas, CRRA specialization, numerical accuracy experiments, and learning application.

## 1. Metadata

- **Title:** A Simulation Approach to Dynamic Portfolio Choice with an Application to Learning About Return Predictability
- **Author(s):** Michael W. Brandt, Amit Goyal, Pedro Santa-Clara, Jonathan R. Stroud
- **Year:** 2005
- **Journal/Venue:** *Review of Financial Studies*

## 2. Problem statement

The paper studies discrete-time dynamic portfolio choice with many state variables, potentially non-Gaussian returns, learning, and other frictions. The formal problem is to choose portfolio weights $x_t$ (and possibly consumption) to maximize
$$
V_t(W_t,Z_t)=\max_{x_t} E_t\bigl[V_{t+1}(W_{t+1},Z_{t+1})\bigr],
$$
where $W_t$ is wealth and $Z_t$ is a high-dimensional state vector. The question is how to solve such problems numerically when state-space discretization becomes infeasible.

## 3. Approach (short)

The method is simulation-based dynamic programming with regression approximation of conditional expectations. The authors simulate many paths of returns and state variables, work backward through time, approximate the value function locally by a Taylor expansion, and estimate the conditional moments entering the first-order conditions by cross-sectional regressions across simulated paths. This is essentially least-squares Monte Carlo adapted to portfolio choice.

## 4. Approach (detailed)

1. **Dynamic program**

   Wealth evolves as
   $$
   W_{t+1}=W_t\bigl(R_f + x_t^\top R^e_{t+1}\bigr)
   $$
   in the no-consumption case, where $R^e_{t+1}$ are excess returns and $Z_{t+1}$ follows a possibly nonlinear, path-dependent law. The exact Bellman problem is
   $$
   V_t(W_t,Z_t)=\max_{x_t} E_t\!\left[V_{t+1}(W_{t+1},Z_{t+1})\right].
   $$
   Direct grid methods fail when $Z_t$ is high-dimensional.

2. **Taylor expansion of the continuation value**

   The authors approximate $V_{t+1}(W_{t+1},Z_{t+1})$ as a Taylor series in the portfolio payoff $W_t x_t^\top R^e_{t+1}$. The second-order approximation yields a closed-form approximate policy:
   $$
   x_t \approx -\Bigl(E_t[B_{t+1}]W_t\Bigr)^{-1}E_t[A_{t+1}],
   $$
   where $A_{t+1}$ and $B_{t+1}$ collect terms involving first and second derivatives of the value function and return moments.

   The fourth-order approximation adds skewness and kurtosis terms:
   $$
   x_t \approx -\bigl(E_t[B_{t+1}]W_t\bigr)^{-1}
   \Bigl(E_t[A_{t+1}] + E_t[C_{t+1}(x_t)]W_t^2 + E_t[D_{t+1}(x_t)]W_t^3\Bigr).
   $$
   Because $x_t$ appears on both sides, one solves by fixed-point iteration starting from the second-order solution.

3. **Simulation step**

   Simulate $M$ sample paths of $(R^e_{t+1},Z_{t+1})$ from:
   - an estimated data-generating process,
   - a bootstrap,
   - or a posterior predictive law if parameter uncertainty/learning is included.

   The flexibility of the method comes from this step: no Gaussianity or low-dimensional Markov restriction is required.

4. **Regression approximation of conditional expectations**

   For any random quantity $y_{t+1}$ needed in the approximate FOCs, write
   $$
   E_t[y_{t+1}] \approx \phi(Z_t)^\top \beta_t,
   $$
   where $\phi(Z_t)$ is a vector of basis functions, typically polynomial functions of the state variables. Estimate $\beta_t$ by cross-sectional OLS across the $M$ simulated paths at time $t$:
   $$
   y_{t+1}^{(m)} = \phi(Z_t^{(m)})^\top \beta_t + \varepsilon_t^{(m)}.
   $$
   The fitted values then approximate the conditional expectations entering the policy formula.

5. **Backward recursion**

   Starting from terminal utility $u(W_T)$, proceed backward:
   1. at $t=T-1$, compute approximate optimal $x_{T-1}$ from the regression-estimated moments;
   2. use the implied future policies to construct and regress the continuation quantities needed at the preceding date;
   3. iterate backward to $t=0$.

   This avoids state-space grids. The conditional-expectation operator is learned statistically from simulated paths.

6. **CRRA simplification**

   For CRRA utility,
   $$
   u(W)=\frac{W^{1-\gamma}}{1-\gamma},
   $$
   homotheticity simplifies the policy because wealth factors out. The second-order approximate policy becomes
   $$
   x_t \approx \frac{R_f}{\gamma}
   \Bigl(E_t[c_{t+1}(Z_{t+1})R^e_{t+1}R_{t+1}^{e\top}]\Bigr)^{-1}
   E_t[c_{t+1}(Z_{t+1})R^e_{t+1}],
   $$
   where $c_{t+1}$ is the continuation-value scaling factor. This makes the relation between dynamic hedging and conditional moments transparent.

7. **Learning extension**

   To incorporate parameter uncertainty, augment the state vector with posterior beliefs. Then
   $$
   Z_t = (\text{economic predictors}, \text{posterior moments of parameters}),
   $$
   and simulate Bayesian updating jointly with returns. The method therefore handles learning simply by enlarging the simulated state vector; this is exactly where grid methods collapse.

8. **Proof status**

   The paper is largely numerical/methodological. What is exact:
   - the Bellman recursion;
   - the Taylor-expanded FOCs conditional on the chosen truncation order;
   - the regression identity used to approximate conditional expectations.

   What is approximate:
   - truncating at second or fourth order;
   - projecting conditional expectations onto a finite basis $\phi(Z_t)$;
   - finite-$M$ Monte Carlo estimation.

   The authors benchmark approximation errors and show when higher Taylor order, richer regression bases, and larger simulations improve the tested solutions.

## 5. Domain of applicability

- The method applies to dynamic portfolio problems with many state variables, nonstandard return dynamics, learning, and constraints for which closed forms or low-dimensional PDEs are unavailable.
- It is strongest when simulation of the state dynamics is easy but direct value-function computation is hard.
- Accuracy depends on the chosen Taylor order, basis functions, and simulation size. Extreme nonlinearity or poor basis choice can degrade results.
- The method is not a proof that dynamic portfolio choice is easy; it is a practical numerical scheme.
- Its genuinely novel contribution is the least-squares Monte Carlo style evaluation of dynamic portfolio FOCs in a high-dimensional state environment.


## 6. The numerical method in implementable notation

Let $R$ denote next-period excess returns and let $\bar W=W_tR_f$. Expand the next-period continuation value with respect to wealth at $\bar W$, holding its state argument fixed. Define

$$A_t=E_t[V_W(\bar W,Z_{t+1})R],\qquad
B_t=E_t[V_{WW}(\bar W,Z_{t+1})RR'].$$

The second-order objective, after discarding the term independent of the portfolio, is

$$W_tx'A_t+\tfrac12W_t^2x'B_tx.$$

Its interior solution satisfies $A_t+W_tB_tx=0$, hence $x=-W_t^{-1}B_t^{-1}A_t$. Because a concave continuation value has $V_{WW}<0$, $B_t$ is negative semidefinite. A unique interior policy requires appropriate nonsingularity. In code one solves a linear system rather than explicitly forming an inverse.

The matrix involves **second moments**, not merely a return covariance matrix. It also weights those moments by marginal curvature at the next state. Likewise, the linear term is a marginal-utility-weighted mean. These terms are the mechanism through which a dynamic problem differs from applying a static mean–variance optimizer to the current predictive distribution.

For a fourth-order expansion, the approximate first-order condition is

$$0=A_t+W_tB_tx
+\frac{W_t^2}{2}E_t[V_{WWW}(x'R)^2R]
+\frac{W_t^3}{6}E_t[V_{WWWW}(x'R)^3R].$$

All derivatives are evaluated at the same expansion wealth and next-period state. The source starts from the second-order solution and iterates the implicit equation. This is a practical numerical prescription, not a global convergence theorem for arbitrary utility, return distributions, or constraints. A fourth-degree approximation can be unreliable away from its expansion point, and feasibility and local optimality must still be checked.

### 6.1 The CRRA specialization and the risk-free factor

With $V_{t+1}(W,Z)=W^{1-\gamma}c_{t+1}(Z)/(1-\gamma)$, wealth factors out. Substituting its derivatives into the second-order solution gives

$$x_t^{(2)}=\frac{R_f}{\gamma}
\left[E_t(c_{t+1}RR')\right]^{-1}E_t(c_{t+1}R).$$

Here $R_f$ is the gross risk-free return. It disappears only under a normalization that sets it to one. This factor matters when comparing formulas written in gross, excess, or discounted return units. The continuation multiplier $c_{t+1}$ carries the value of future investment opportunities; setting it to one gives the terminal one-period approximation.

Under the paper's sufficient conditional-independence condition, returns and the relevant changes in future opportunities separate inside the expectation, and dynamic and myopic choices coincide. Otherwise the continuation multiplier changes the policy. Predictability alone does not determine the sign of hedging demand; its interaction with return innovations and future opportunity values does.

## 7. Simulation, conditioning, and backward induction

The simulated observations are paths, not a single time-series regression. At each date, the method estimates conditional expectations using a cross-section of paths at that date. For a target $Y_{t+1}^{(m)}$, the fitted conditional expectation is

$$\widehat E_t[Y\mid Z_t=z]=\phi(z)'\hat\beta_t,$$

where $\hat\beta_t$ comes from regressing simulated future quantities on functions of current states. Future returns and utility derivatives belong on the dependent-variable side. Only information known at date $t$ belongs among the conditioning variables.

A concrete implementation proceeds as follows:

1. Specify or estimate a joint law for returns, economic states, and any belief updates. Simulate many paths under that law.
2. At the final decision date, evaluate the utility derivatives and return products required by the selected Taylor order. Fit their conditional expectations across paths.
3. Solve the approximate portfolio problem at each relevant current state, imposing any constraints included in the model.
4. Move backward, using already computed future policies to construct the continuation quantities and their derivatives required at the preceding date.
5. Evaluate the resulting policy on fresh simulations and compare its utility with benchmarks or a more accurate solution where available.

The method's defining feature is regression of the moments entering the portfolio problem, rather than a requirement to approximate the whole value function on a Cartesian state grid. The short description of backward recursion should be read in that sense. General preferences introduce endogenous wealth dependence; CRRA makes the implementation especially simple by removing wealth from portfolio weights.

A path-dependent law is admissible if the simulated state or recorded information is sufficient for the conditioning problem. The phrase “no low-dimensional Markov restriction” does not mean that a regression can ignore relevant history. One must include an adequate state representation or relevant history features, and the required basis may still become large.

## 8. Parameter uncertainty is different from learning

The application studies stock-index allocation when dividend yield predicts returns. Three distinct problems must be separated. A plug-in investor treats estimated parameters as true. A parameter-uncertainty investor integrates over uncertain parameters. A learning investor additionally anticipates that future observations will update beliefs and change future policies.

The posterior state contains information about the return-predictability equation, the predictor's dynamics, and second moments. A simulated learning path must draw a data-generating parameter consistently and update beliefs as observations arrive. Redrawing unrelated parameters independently each period would generally describe a different economic model. Likewise, conditioning a portfolio directly on the latent simulated true parameter would give the investor information unavailable in the stated problem.

Belief uncertainty changes predictive risk, while learning changes the covariance between current returns and future opportunities. In the source's calibration, favorable stock-return innovations raise assessments of future expected returns. Stocks then tend to pay well precisely when future investment opportunities also improve. They provide a poor hedge against deteriorating opportunities, inducing a negative learning-related hedging demand. This can dominate the positive hedging demand associated with dividend-yield predictability under known parameters.

The result is economically consequential: adding a dynamic optimization layer to a misspecified no-learning model need not improve investor welfare. The source finds cases where the no-learning dynamic policy moves farther from the correct learning policy than a myopic rule does. The sign and magnitude depend on the calibration and which parameters are learned; the paper does not claim a universally negative hedging demand under Bayesian learning.

## 9. Accuracy evidence and limitations

The authors separate Taylor-truncation error from simulation and regression error by starting with simple problems that admit accurate numerical benchmarks. In the iid example, second-order utility approximation produces very small annualized certainty-equivalent losses at monthly horizons, roughly 0.12–0.48 basis points, but losses can reach about 57 basis points at annual horizons. Fourth-order approximation performs substantially better in the tested cases, with the largest reported annual-horizon loss around 20 basis points.

Longer holding periods spread the wealth distribution farther from the expansion point. The effect of greater risk aversion is not purely a curvature effect: a more risk-averse investor chooses less risky exposure, which can improve the quality of the local approximation despite more curvature in utility. The reported comparisons also calibrate different holding-period distributions separately; differences across those calibrations should not be confused with a violation of an iid horizon-irrelevance theorem under a common consistently scaled model.

For predictable returns, the paper compares the simulation method with state discretization, linear versus quadratic conditioning bases, and different simulation counts. These checks address different sources of error. Increasing simulation count reduces sampling noise but does not repair a deficient basis; adding basis terms does not repair an inaccurate return model; increasing Taylor order does not guarantee well-behaved optimization in extreme tails.

For implementation, validation should include conditional-moment fit, matrix conditioning, constraint feasibility, positive wealth where utility requires it, first-order-condition residuals, and out-of-sample simulated utility. Economic utility loss is often a better accuracy measure than raw weight differences, since a relatively flat objective can tolerate noticeable changes in holdings. The paper establishes flexibility and useful accuracy in its examples, not immunity to dimensionality, approximation bias, or estimation risk.
