# Parameter Uncertainty in Multiperiod Portfolio Optimization with Transaction Costs (2015)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioConstruction_DemiguelMarinutreraNogales_2015.pdf>), 29 PDF pages.

## Metadata and main result

**Victor DeMiguel, Alberto Martín-Utrera, and Francisco J. Nogales, “Parameter Uncertainty in Multiperiod Portfolio Optimization with Transaction Costs,” *Journal of Financial and Quantitative Analysis* 50(6), December 2015, pp. 1443–1471. DOI: 10.1017/S002210901500054X.** The local source is the complete 29-page article. Its header carries a 2016 copyright, but the issue date is December 2015.

The paper combines estimation risk with a tractable dynamic trading model. Under independent normal excess **price changes**, an infinite discounted mean–variance objective, and a trading-cost matrix proportional to the price-change covariance, the known-parameter optimum adjusts gradually toward a static Markowitz target. If the target is estimated once and then held fixed, the expected utility loss factors exactly into a static estimation-loss term and a dynamic multiplier.

The authors then propose two complementary responses: shrink the target toward cash or a minimum-variance direction, and optimize the speed of adjustment toward that target. The optimal target-combination coefficients at the nominal trading speed coincide with their single-period counterparts. An expanding-window extension is explicitly based on a conjectured approximation, not the same exact factorization. Daily empirical and simulated comparisons suggest benefits from treating trading costs and estimation risk jointly, although several implementation conventions and population-information assumptions qualify the backtests.

## 1. Decision variables, units, and objective

Let $r_{i+1}\in\mathbb R^N$ denote excess price changes, assumed i.i.d. normal with mean $\mu$ and positive definite covariance $\Sigma$. The investor chooses the vector of **numbers of shares** $x_i$, with inherited position $x_{-1}$. These are not fully invested percentage weights. Cash finances residual positions, and the model does not impose a risky-asset budget, long-only constraint, or leverage cap.

Write $\delta=1-\rho\in(0,1)$, where $\rho$ is impatience, and $\Delta x_i=x_i-x_{i-1}$. The exact objective in equation (1) is

$$
U(\{x_i\})=\sum_{i=0}^{\infty}
\left[\delta^{i+1}\left(x_i^\top\mu-\frac\gamma2x_i^\top\Sigma x_i\right)
-\delta^i\frac\lambda2\Delta x_i^\top\Sigma\Delta x_i\right].
$$

Here $\gamma$ is **absolute** risk aversion, and $\lambda$ scales quadratic trading costs. Expected price-change gains and risk enter one date after the decision; the trading cost is paid at the decision date. Equivalently, putting $\widetilde\lambda=\lambda/\delta$, one can factor $\delta^{i+1}$ from both terms and use cost coefficient $\widetilde\lambda/2$ inside the bracket.

This timing convention is material. An expression that discounts the mean but not the contemporaneous risk penalty describes a different problem. Likewise, silently replacing $\widetilde\lambda$ by $\lambda$ in a one-period reduction changes the trading rate.

Quadratic costs represent the total cost of linear price impact: a larger trade has a higher marginal execution cost. The further assumption that impact is proportional to $\Sigma$ is what lets the dynamic problem share the same risk geometry in every direction. A general impact matrix would usually generate different adjustment speeds across directions. Proportional bid–ask costs give no-trade regions rather than this smooth scalar adjustment rule.

## 2. The known-parameter policy

The static unconstrained Markowitz position is

$$
x^M=\frac1\gamma\Sigma^{-1}\mu.
$$

The optimal dynamic policy in the model inherited from Gârleanu and Pedersen is

$$
x_i=(1-\beta)x_{i-1}+\beta x^M,
$$

with

$$
\beta=\frac{\sqrt{(\gamma+\widetilde\lambda\rho)^2+4\gamma\lambda}
-(\gamma+\widetilde\lambda\rho)}{2\lambda}.
$$

For positive $\gamma,\lambda$ and $0<\rho<1$, the rate lies between zero and one. For numerical work, the equivalent rationalized expression

$$
\beta=\frac{2\gamma}{\sqrt{(\gamma+\widetilde\lambda\rho)^2+4\gamma\lambda}
+\gamma+\widetilde\lambda\rho}
$$

avoids subtracting nearby square roots. As trading costs vanish, $\beta\to1$ and the investor moves immediately to the target. Larger costs or impatience slow adjustment; larger absolute risk aversion increases the speed of adjustment toward a smaller target.

A useful derivation starts from the Euler equation

$$
\delta(\mu-\gamma\Sigma x_i)-\lambda\Sigma(x_i-x_{i-1})
+\delta\lambda\Sigma(x_{i+1}-x_i)=0.
$$

Substitution of the constant-rate policy gives

$$
\lambda\beta^2+(\gamma+\lambda\rho/\delta)\beta-\gamma=0.
$$

The positive root is the rate above. This derivation also identifies exactly where proportionality of impact and covariance is used: $\Sigma$ cancels from the common rate equation.

Let $q=1-\beta$. Iteration gives

$$
x_i=q^{i+1}x_{-1}+(1-q^{i+1})x^M,\qquad
\Delta x_i=\beta q^i(x^M-x_{-1}).
$$

The inherited portfolio's influence decays geometrically. There is no forecast decay in this version of the model because expected price changes are constant; this is narrower than the predictable-return model from which the trading framework originates.

## 3. Sampling assumptions and the unusual covariance normalization

The exact finite-sample analysis estimates a target from **one fixed sample** of $T$ observations and uses that target throughout the investor's future life. It is not initially a rolling-refit result.

The estimators are

$$
\widehat\mu=\frac1T\sum_{t=1}^T r_t,\qquad
\widehat\Sigma=\frac1{T-N-2}
\sum_{t=1}^T(r_t-\widehat\mu)(r_t-\widehat\mu)^\top.
$$

The outer product is required; the scalar-square notation in the source is shorthand. The divisor is chosen so that **the inverse covariance estimator** is unbiased under normality, rather than making the covariance estimate itself unbiased. Specifically, if $S$ is the unnormalized scatter matrix,

$$
E[S^{-1}]=\frac{\Sigma^{-1}}{T-N-2},\qquad
E[\widehat\Sigma^{-1}]=\Sigma^{-1}.
$$

Normality also gives independence of sample mean and sample covariance. Hence

$$
\widehat x^M=\gamma^{-1}\widehat\Sigma^{-1}\widehat\mu,
\qquad E[\widehat x^M]=x^M.
$$

Inverse second moments used in the loss formulas require $T>N+4$. Merely having an invertible sample covariance is not enough. As $T$ approaches this threshold, estimation loss and shrinkage become extreme; the formulas should not be extrapolated to $N\ge T$.

The plug-in dynamic investor uses the same nominal $\beta$ as the population policy because, under the proportional-cost assumption, $\beta$ depends only on $(\gamma,\lambda,\rho)$. Parameter estimation affects the target, while the cost and risk scalar parameters are treated as known.

## 4. Static estimation loss

Define

$$
\theta=\mu^\top\Sigma^{-1}\mu,\qquad
c=\frac{(T-N-2)(T-2)}{(T-N-1)(T-N-4)}.
$$

The scalar $\theta$ is the squared population Sharpe ratio of the optimal risky direction at the model's observation frequency. Under the stated sample assumptions, the static utility loss is

$$
L_1(x^M,\widehat x^M)
=\frac1{2\gamma}\left[(c-1)\theta+c\frac NT\right].
$$

One way to see the source of this expression is to use

$$
E[\widehat\Sigma^{-1}\Sigma\widehat\Sigma^{-1}]=c\Sigma^{-1}
$$

and

$$
E[\widehat\mu^\top\widehat\Sigma^{-1}\Sigma
\widehat\Sigma^{-1}\widehat\mu]=c(\theta+N/T).
$$

The first contribution reflects inverse-covariance uncertainty; the $N/T$ term reflects uncertainty about the mean. The formulas use the particular inverse-unbiased normalization above. Copying coefficients derived for an ordinary sample covariance without adjusting that convention would change the result.

Equivalently, completing the square in static utility gives

$$
L_1=\frac\gamma2E[(\widehat x^M-x^M)^\top
\Sigma(\widehat x^M-x^M)].
$$

This risk-weighted target error is the quantity that propagates through the dynamic adjustment path.

## 5. Exact factorization of multiperiod loss

Both true and estimated paths start from the same fixed $x_{-1}$ and use the same rate. Their difference at date $i$ is

$$
\widehat x_i-x_i=(1-q^{i+1})(\widehat x^M-x^M),
$$

and the trade difference is

$$
\Delta\widehat x_i-\Delta x_i=\beta q^i(\widehat x^M-x^M).
$$

Because the target estimator is unbiased, the linear terms in target error vanish when taking expectations. Proposition 1 therefore obtains

$$
L=U(\{x_i\})-E[U(\{\widehat x_i\})]
=L_1(f_{mv}+f_{tc}),
$$

where

$$
f_{mv}=\sum_{i\ge0}\delta^{i+1}(1-q^{i+1})^2
=\frac\delta{1-\delta}-\frac{2\delta q}{1-\delta q}
+\frac{\delta q^2}{1-\delta q^2},
$$

$$
f_{tc}=\frac\lambda\gamma\sum_{i\ge0}\delta^i\beta^2q^{2i}
=\frac\lambda\gamma\frac{\beta^2}{1-\delta q^2}.
$$

These series representations make nonnegativity and economic interpretation clearer than the rational formulas alone. The first term counts how strongly the wrong target affects holdings at successive dates. The second counts the excess cost of trades toward that wrong target.

The loss decomposition uses **estimated risk minus true-policy risk**:

$$
L_{mv}=\frac\gamma2\sum_{i\ge0}\delta^{i+1}
E[\widehat x_i^\top\Sigma\widehat x_i-x_i^\top\Sigma x_i],
$$

$$
L_{tc}=\frac\lambda2\sum_{i\ge0}\delta^i
E[\Delta\widehat x_i^\top\Sigma\Delta\widehat x_i
-\Delta x_i^\top\Sigma\Delta x_i].
$$

Reversing those signs would contradict the positive loss. The source's equivalent second formula uses $\widetilde\lambda\delta^{i+1}$, which is the same as $\lambda\delta^i$.

The independence from the initial portfolio is a consequence of this common-rate, unbiased, fixed-target comparison. It does not mean that initial holdings are irrelevant to optimal trading-rate choice or to all estimation problems.

## 6. Comparative statics and a discount-normalization caveat

The source's calibrated multiperiod figures show lower estimation loss with larger costs, greater impatience, and greater absolute risk aversion. Higher trading costs slow movement toward an estimated target, postponing its error to less heavily weighted dates. Greater impatience has a similar effect. These are statements about the **incremental loss from parameter uncertainty**; they do not imply that adding transaction costs improves the investor's total welfare.

The paper proves transparent monotonicity statements in a one-period example. With objective

$$
\delta\left(x^\top\mu-\frac\gamma2x^\top\Sigma x\right)
-\frac\lambda2(x-x_{-1})^\top\Sigma(x-x_{-1}),
$$

the rate is

$$
\beta_1=\frac\gamma{\gamma+\lambda/\delta}.
$$

For the objective normalized by dividing through by $\delta$, the loss is $\beta_1L_1$. For the discounted objective as written above, the loss is $\delta\beta_1L_1$. Equation (10) in the source gives the former expression following a displayed discounted objective, without explicitly stating that normalization. This distinction does not change the optimizer, but matters when comparing absolute utility-loss levels. The simpler expression $\gamma/(\gamma+\lambda)$ only applies when the cost coefficient already uses the corresponding normalization.

## 7. Shrinking the target: three and four funds

The first policy shrinks the estimated Markowitz target toward zero risky holdings:

$$
\widehat x_i^{3F}=q\widehat x_{i-1}^{3F}+\beta\eta\widehat x^M.
$$

Its three funds are cash, inherited holdings, and the estimated Markowitz direction. The coefficient $\eta$ is the **retained** fraction of the estimated target; smaller $\eta$ means more shrinkage.

The second policy adds an estimated minimum-variance direction,

$$
\widehat x^{Min}=\frac1\gamma\widehat\Sigma^{-1}\mathbf1,
$$

and trades toward

$$
\widehat x^C=\varsigma_1\widehat x^M+\varsigma_2\widehat x^{Min},
\qquad
\widehat x_i^{4F}=q\widehat x_{i-1}^{4F}+\beta\widehat x^C.
$$

The extra direction depends on covariance but not expected-return estimates. It is not a unit-budget minimum-variance portfolio: the normalized version would divide $\widehat\Sigma^{-1}\mathbf1$ by $\mathbf1^\top\widehat\Sigma^{-1}\mathbf1$. The paper deliberately uses an unnormalized direction, scaled by $1/\gamma$, and lets $\varsigma_2$ determine its amount.

Define

$$
\mu_g=\frac{\mu^\top\Sigma^{-1}\mathbf1}
{\mathbf1^\top\Sigma^{-1}\mathbf1},\qquad
\Psi^2=\theta-\frac{(\mu^\top\Sigma^{-1}\mathbf1)^2}
{\mathbf1^\top\Sigma^{-1}\mathbf1}\ge0.
$$

At the nominal trading rate, Proposition 2 gives

$$
\eta=c^{-1}\frac\theta{\theta+N/T},
$$

$$
\varsigma_1=c^{-1}\frac{\Psi^2}{\Psi^2+N/T},\qquad
\varsigma_2=c^{-1}\frac{N/T}{\Psi^2+N/T}\mu_g.
$$

These coefficients contain population quantities and are therefore oracle shrinkage coefficients. An implementable rule must estimate them. The paper's empirical study uses additional shrinkage estimates of means and covariance to reduce noise in this calibration.

The parameter $\Psi^2$ measures the component of mean dispersion orthogonal to the common-mean direction in the precision geometry. If that component is small relative to $N/T$, the estimated Markowitz-specific component receives little weight. These coefficients are not necessarily convex mixing fractions summing to one: the second target has an arbitrary scale and cash absorbs the remaining financing.

## 8. Why the target coefficients match the static ones

For a fixed random target $\widehat x^C$, the expected dynamic utility can be expanded in its mean, its covariance-weighted second moment, and cross terms with $x_{-1}$. The nominal trading-rate equation makes the cross coefficient with the inherited portfolio cancel. It also equates the relevant linear and quadratic exposure multipliers.

More explicitly, at the nominal $\beta$,

$$
H=f_{mv}+f_{tc}
=\frac\delta{1-\delta}-\frac{\delta q}{1-\delta q}.
$$

Up to terms independent of target choice, expected dynamic utility is therefore

$$
H\left\{E[\widehat x^C]^\top\mu
-\frac\gamma2E[(\widehat x^C)^\top\Sigma\widehat x^C]\right\}.
$$

Because $H>0$, maximizing over the target-combination coefficients is the same problem as maximizing static expected utility. This provides an algebraic interpretation of the identities the appendix reports as numerically verified. It explains both the equality with the static shrinkage coefficients and the absence of $(\lambda,\rho)$ from those coefficients.

The result is conditional on holding the trading rate at its nominal value and on the fixed-estimation-window model. It is not a theorem that transaction costs never affect optimal shrinkage in other models, with changing estimates, with constraints, or under joint choice of a different policy class.

A further qualification concerns the paper's corollary that the minimum-variance coefficient is always positive. The displayed formula shows

$$
\operatorname{sign}(\varsigma_2)=\operatorname{sign}(\mu_g).
$$

Thus positive mixing requires a positive expected excess payoff of that direction. If $\mu_g=0$, the coefficient is zero; if $\mu_g<0$, it is negative. The unconditional positivity claim should not be generalized beyond the implicit positive-return case. Similarly, $\Psi^2$ can equal zero in a degenerate common-mean configuration, even though the main statement emphasizes the strict-positive case.

## 9. Shrinking the speed of trading is a separate decision

The source also optimizes the rate $\beta$, keeping the selected target-combination structure. This section is economically important: shrinking the target controls the eventual exposure, while shrinking the rate controls how aggressively the investor moves away from inherited holdings in response to noisy information.

An implementation can evaluate the expected utility for any candidate $\beta$ directly from

$$
\widehat x_i=q^{i+1}x_{-1}+(1-q^{i+1})\widehat x^C,
\qquad
\Delta\widehat x_i=\beta q^i(\widehat x^C-x_{-1}).
$$

Set $m_C=E[\widehat x^C]$ and $Q_C=E[(\widehat x^C)^\top\Sigma\widehat x^C]$. Define

$$
S_0=\frac\delta{1-\delta},\quad S_1=\frac{\delta q}{1-\delta q},\quad
S_2=\frac{\delta q^2}{1-\delta q^2},\quad
K=\frac{\lambda\beta^2}{1-\delta q^2}.
$$

Then the full objective is

$$
\begin{aligned}
E[U]={}&S_1x_{-1}^\top\mu+(S_0-S_1)m_C^\top\mu\\
&-\frac\gamma2\{S_2x_{-1}^\top\Sigma x_{-1}
+(S_0-2S_1+S_2)Q_C
+2(S_1-S_2)x_{-1}^\top\Sigma m_C\}\\
&-\frac K2\{Q_C+x_{-1}^\top\Sigma x_{-1}
-2x_{-1}^\top\Sigma m_C\}.
\end{aligned}
$$

This is an explicit equivalent form derived from the source's policy and discounted objective, and can be optimized in one dimension over an admissible rate interval. Under the normal model,

$$
Q_C=\frac c{\gamma^2}\left[
\varsigma_1^2(\theta+N/T)+\varsigma_2^2\mathbf1^\top\Sigma^{-1}\mathbf1
+2\varsigma_1\varsigma_2\mu^\top\Sigma^{-1}\mathbf1\right].
$$

The main-text version of Proposition 3 includes a factor two in the inherited-target cross term; the appendix's compressed display (A-22) omits it. The direct expansion above makes that factor explicit and is preferable for a reproducible implementation.

Rate shrinkage is most valuable when inherited holdings are already good. If they were exactly the true Markowitz position and that fact were known, no trading would be necessary. The estimated rate rule tries to avoid moving rapidly from a good starting position toward a noisy replacement. In the paper's calibrated example, reducing the rate can cut relative loss by more than 15% at an initial position equal to 0.1 times the true Markowitz target. The benefit depends on the starting point and estimated target, not merely the sample size.

## 10. Expanding samples: what is conjectured

When estimates are updated with $T+i$ observations, the target changes every date. The intended recursion is

$$
\widehat x_i=q\widehat x_{i-1}+\beta\widehat x_i^M.
$$

Equation (23) in the source places $q^{i+1}$ on the preceding holding, inconsistent with the policy used elsewhere. The power belongs to the closed-form coefficient on the **initial** position after iteration, not to each one-step recursion.

The fixed-target factorization no longer works because expected risk and costs contain cross moments of targets estimated from overlapping samples. The challenging quantity is

$$
B_{h,h+j}=E[\widehat\mu_h^\top\widehat\Sigma_h^{-1}
\Sigma\widehat\Sigma_{h+j}^{-1}\widehat\mu_{h+j}].
$$

The authors propose

$$
B_{h,h+j}\approx(1-\pi_{h,h+j})\theta+\pi_{h,h+j}B_{h,h},
\qquad
\pi_{h,h+j}=\frac{T+h-N}{T+h+j-N},
$$

with

$$
B_{h,h}=c_h\left(\theta+\frac N{T+h}\right),\quad
c_h=\frac{(T+h-2)(T+h-N-2)}{(T+h-N-1)(T+h-N-4)}.
$$

This has the correct same-sample endpoint at $j=0$ and approaches the population value as the later sample grows. The paper reports approximation error below 0.1% in its simulation checks. It labels the result **Conjecture 1**, and the details of the resulting optimal-coefficient calculation are omitted for space.

The heuristic discussion of upper and lower covariance bounds should not be read as a general theorem that the Markowitz portfolio minimizes variance over all positions; it does not. Expected utility optimality and minimum variance at a particular constraint are different statements. The expanding-window extension rests on the conjectured cross-moment approximation and the reported calibration, not on a fully supplied general proof.

A rolling fixed-length sample is another distinct case: $T$ is constant but estimates change. The empirical study applies the fixed-window shrinkage formulas repeatedly in that setting. The original exact lifetime loss factorization remains a once-estimated-target result, not an exact rolling-window performance identity.

## 11. Empirical design and calibration

The base case uses daily observations, $T=500$, absolute risk aversion $\gamma=10^{-8}$, cost parameter $\lambda=3\times10^{-7}$, and impatience $\rho=1-\exp(-0.1/260)$. The risk-aversion coefficient is interpreted as relative risk aversion one for a manager with $100 million. This is a holdings-and-dollar-gains model, so scaling capital and units matters for both risk and impact.

Two simulated universes have 25 and 50 assets, initial prices one, independent normal price changes, mean parameters drawn from the stated 5–12% annual range, and diagonal covariance parameters drawn from the stated uniform range. These simulations satisfy the structural assumptions by construction.

Four empirical data sets are used:

- **Com:** 15 commodity futures, using three-month maturities, with contract multipliers applied; the table includes industrial metals, energy, soft commodities, gold, and silver.
- **48IndP:** 48 industry portfolios from the Fama–French data library.
- **100FF:** 100 size/book-to-market portfolios.
- **SP100:** 100 stocks selected randomly at the beginning of each year from S&P 500 constituents.

Daily data run from July 7, 2004 to September 19, 2012, except the individual-stock data end December 31, 2011. Equity total returns are converted into synthetic price changes starting from unit prices. This construction should be distinguished from directly optimizing percentage returns or maintaining constant dollar exposures.

The paper compares eight policies: static sample Markowitz; static cash-shrunk and minimum-variance-shrunk targets; the unshrunk dynamic policy; dynamic three- and four-fund shrinkage; the four-fund policy with optimized rate; and a four-fund expanding-window policy. The first seven use rolling samples, while the last uses expanding data. Shrinkage parameters are recalculated monthly to reduce computational burden; they are estimated using shrinkage mean and covariance inputs.

The word “static” refers to the form of the one-period target that ignores costs; in the empirical evaluation such targets are repeatedly estimated and implemented. It should not be confused with a portfolio that is literally bought once and never updated during the full test sample.

## 12. Reported out-of-sample results

For the cash starting position, Table 2 reports the following annualized Sharpe ratios after the paper's modeled costs:

| Policy | Simulated 25 | Simulated 50 | Commodities | 48 industries | 100 size/value | 100 stocks |
|---|---:|---:|---:|---:|---:|---:|
| Static sample Markowitz | −0.266 | −0.345 | −0.459 | −0.672 | −1.435 | −0.985 |
| Unshrunk dynamic | 0.150 | 0.297 | 0.056 | 0.503 | 0.209 | −0.107 |
| Dynamic three-fund | 0.193 | 0.319 | 0.242 | 0.525 | 0.314 | 0.367 |
| Dynamic four-fund | 0.766 | 0.773 | 0.893 | 0.529 | 0.355 | 0.390 |
| Four-fund expanding | 0.948 | 0.872 | 0.803 | 0.702 | 0.360 | 0.271 |

Rate optimization matches the nominal four-fund ratios to the displayed precision when starting from cash. The pattern supports both slowing costly adjustments and reducing estimation-sensitive target exposure. The benefit of adding the minimum-variance direction is particularly large in the simulated and commodity examples; it is smaller in the industry portfolios.

Starting instead from the population Markowitz position, the nominal four-fund ratios across those six data sets are 0.774, 0.765, 0.886, 0.536, 0.351, and 0.392. Rate optimization raises them to 0.932, 0.897, 0.962, 0.766, 0.374, and 0.547. This is consistent with preserving a favorable inherited allocation, but the initial condition is an informative benchmark, not something an investor can know exactly in practice.

The study uses a stationary bootstrap with 1,000 resamples and average block size five to test differences relative to the dynamic four-fund rule. Many incremental rate-shrinkage and expanding-window differences have large $p$-values. Higher point estimates should therefore not be described as uniformly statistically established improvements. For example, under the cash start, the difference between nominal four-fund and unshrunk dynamic is not significant for the 48 industry portfolios at conventional levels ($p=0.538$).

Expanding samples generally help in the stationary simulations and some portfolio data, but worsen commodity and individual-stock results in the base case. The authors suggest that structural change may explain that difference. This is an interpretation of comparative results, not a direct test identifying structural breaks as the cause.

Robustness checks vary costs by a factor of ten upward and downward and use windows of 250 and 750 observations. Ignoring costs becomes particularly damaging at high impact, and shorter windows make estimated static targets more unstable. The broad advantage of joint cost/estimation treatment persists, but the rankings among shrinkage variants are not uniform: for instance, rate optimization slightly lowers the commodity ratio with $T=250$.

## 13. Evaluation conventions that matter for reproduction

The empirical cost-adjusted gains are printed as

$$
R_{i+1}^{k}=(\widehat x_i^k)^\top r_{i+1}
-\widetilde\lambda(\Delta\widehat x_i^k)^\top\Sigma\Delta\widehat x_i^k.
$$

Unlike the original utility's impact term, this equation (30) has no factor $1/2$, and uses the timing-adjusted $\widetilde\lambda$. Reproducing the tables requires following their evaluation convention; interpreting the results economically requires noting its difference from the optimization objective. This is a source convention/inconsistency to resolve against code, rather than silently treating both formulas as identical.

For simulated costs the population covariance is used. For empirical cost evaluation the covariance is estimated from the **entire data set**. Likewise, the empirical “true Markowitz” starting portfolio is constructed using the full sample. Thus these parts of the evaluation use information beyond a decision date. The former is an ex post cost-calibration assumption and the latter an oracle initial condition; neither should be presented as a fully prospective implementation.

The metric is the Sharpe ratio of dollar gains after modeled costs, not directly realized CRRA utility, a wealth-growth rate, or the infinite-horizon objective. The article's proof concerns expected mean–variance utility, whereas the performance table evaluates a related but different criterion.

A live implementation would also need a cost model calibrated to contemporaneous liquidity and contract units, margin and leverage limits, financing and borrowing terms, realistic futures rolling, and a treatment of corporate actions and changing stock membership. These additions can materially change the scalar-rate solution. The paper's theoretical and empirical results should be understood within its own quadratic-cost specification.

## 14. Implementation sequence and practical interpretation

A faithful baseline implementation first aligns price-change units, contract multipliers, risk aversion, covariance, and impact parameters. It then verifies $T>N+4$ for the exact inverse-Wishart formulas, computes inverse-unbiased target estimates with linear solves, and estimates the population quantities entering the shrinkage coefficients. The nominal rate can be computed from the rationalized expression above.

The next step is to choose between a cash-shrunk target and the two-direction target, keeping the coefficient convention consistent with the unnormalized minimum-variance direction. A fixed-target reproduction should estimate once; rolling or expanding implementations must be separately identified. If optimizing speed, evaluate the full expected-utility expansion with its correct cross terms and include the zero-trading boundary. Record both target changes and executed trades, because they answer different questions about statistical instability and transaction costs.

Testing should check the zero-cost limit, the zero-trading limit, the budget/financing convention, covariance conditioning, and the difference between model costs and reported costs. For empirical comparisons, use the same starting information and cost calibration for every strategy, and distinguish prospective policies from the full-sample oracle start. Report gains, risk, dollar turnover, gross exposure, and cost sensitivity alongside the Sharpe ratio.

The paper's most useful conclusion is that estimation regularization and gradual trading address different parts of the same decision. A noisy target can remain poor even when reached slowly, and a well-shrunk target can remain expensive if the investor moves to it immediately. Their clean analytical separation is exact only in the normal, fixed-sample, unconstrained, covariance-proportional quadratic-cost model. The rate-optimization and expanding-sample sections explain why that separation should not be treated as universal.
