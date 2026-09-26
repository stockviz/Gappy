# Portfolio Theory

**Source:** [Portfolio_Cochrane_2007.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/Portfolio_Cochrane_2007.pdf>)  
**Source coverage:** Core payoff-space, incomplete-market, dynamic-programming, estimation-risk, and concluding sections reviewed; source is an unfinished lecture-note draft and its numerical examples were not independently reproduced.

## 1. Metadata

- **Title:** Portfolio Theory
- **Author(s):** John H. Cochrane
- **Year:** 2007
- **Journal/Venue:** Lecture notes / manuscript

## 2. Problem statement

The notes ask the canonical question of asset allocation in its most general form: **given contingent-claim prices or, equivalently, a stochastic discount factor $m$, what payoff or portfolio solves an investor’s utility-maximization problem, and how do the standard mean-variance formulas emerge as approximations or special cases?** The problem is solved in both payoff space and portfolio-weight space, and then extended to dynamic settings with forecastable returns.

## 3. Approach (short)

The method is intertemporal asset-pricing plus optimization. Cochrane formulates portfolio choice first as a problem over final payoffs $x$, using the pricing identity $p=E(mx)$, which makes first-order conditions simple. He then maps the solution back into portfolio weights, derives the mean-variance frontier as a quadratic approximation, and connects dynamic portfolio choice to choosing managed portfolios or contingent claims.

## 4. Approach (detailed)

1. **Choose payoffs, not weights**

   In a complete one-period market, the investor chooses a payoff $x$ rather than weights:
   $$
   \max_x E[u(x)]
   \qquad \text{s.t.} \qquad E[mx]\le W_0.
   $$
   The Lagrangian is
   $$
   \mathcal L = E[u(x)]-\lambda(E[mx]-W_0),
   $$
   and the first-order condition is
   $$
   u'(x(s))=\lambda m(s).
   $$
   Therefore the optimal payoff is
   $$
   x^\star(s) = (u')^{-1}(\lambda m(s)).
   $$
   This is the cleanest version of portfolio theory in the notes: optimal portfolios load heavily in states with low state prices and lightly in states with high state prices.

2. **Power utility and payoff shape**

   For CRRA utility $u(x)=x^{1-\gamma}/(1-\gamma)$,
   $$
   x^\star \propto m^{-1/\gamma}.
   $$
   The optimal payoff is therefore a nonlinear claim on the discount factor, not just a static stock-bond mix. This is a central conceptual point of the notes: solving in payoff space often makes the problem trivial, whereas the same solution looks complicated in security-weight space.

3. **Recover the mean-variance approximation**

   Mean-variance analysis arises from a quadratic or local approximation to expected utility. If $R_p$ is a gross return near 1, then
   $$
   E[u(R_p)] \approx u(E[R_p]) + \frac12 u''(E[R_p])\operatorname{Var}(R_p),
   $$
   which yields the standard objective
   $$
   \max_w \; E[R_p]-\frac{\gamma}{2}\operatorname{Var}(R_p),
   \qquad R_p = r_f + w^\top (R-r_f\mathbf 1).
   $$
   Writing $\mu=E[R-r_f\mathbf 1]$ and $\Sigma=\operatorname{Var}(R-r_f\mathbf 1)$, the first-order condition gives
   $$
   w^\star = \frac{1}{\gamma}\Sigma^{-1}\mu.
   $$
   This is the standard tangency-demand formula.

4. **Frontier geometry**

   The notes rederive the mean-variance frontier and two-fund theorem. Under the standard unconstrained setup with a risk-free asset, any efficient portfolio can be represented as a combination of:

   - the risk-free asset; and
   - one tangency portfolio of risky assets.

   Equivalently, in the risky-only problem, all frontier portfolios lie in the span of $\Sigma^{-1}\mathbf 1$ and $\Sigma^{-1}\mu$. This is standard quadratic programming, but Cochrane’s emphasis is that it is only a local/approximate representation of the more general payoff-choice problem.

5. **Relative-to-market portfolios**

   The notes then decompose portfolios relative to the market portfolio and factor/beta representations. In essence, once one has
   $$
   E[R_i-r_f] = \beta_i \lambda,
   $$
   the portfolio problem can be re-expressed in terms of exposures to priced risk factors and deviations from the market portfolio. This connects standard portfolio choice to linear factor pricing.

6. **Bayesian and estimation issues**

   One reason practical portfolios differ wildly from textbook formulas is that
   $$
   w^\star = \frac{1}{\gamma}\Sigma^{-1}\mu
   $$
   is highly sensitive to estimation error. The notes discuss “wacky weights” and Bayesian/shrinkage approaches precisely because the unconstrained quadratic solution is ill-conditioned when $\mu$ is estimated noisily.

7. **Dynamic portfolios**

   The dynamic problem is conceptually reduced to the same payoff logic: a dynamic strategy is just a claim with a state-contingent payoff. Thus dynamic portfolio choice can be read as static portfolio choice over managed portfolios or contingent claims. When returns are forecastable, state variables enter both the investment opportunity set and the SDF, and the optimal policy inherits hedging motives against changes in state variables.

8. **Proof logic**

   The notes contain several derivations, but the backbone is:

   - use the budget set $E[mx]\le W_0$;
   - derive $u'(x)=\lambda m$;
   - map that payoff back into portfolios if the market is complete;
   - obtain mean-variance formulas by quadratic approximation in return space;
   - extend to dynamics by enlarging the span of attainable payoffs.

   The exact result is the payoff FOC $u'(x)=\lambda m$. Mean-variance formulas are approximations or special cases built on top of that exact pricing relation.

## 5. Domain of applicability

- The notes treat complete and incomplete markets, with explicit attainable-payoff restrictions in the latter.
- The exact payoff-space solution requires knowledge of attainable contingent claims or an equivalent market-completeness representation.
- Mean-variance formulas are only exact under special conditions and otherwise serve as approximations.
- The notes are strongest as a conceptual unification of portfolio theory and asset-pricing theory; they are not a new empirical portfolio-construction method.


## 6. Exact payoff choice, normalization, and outside income

The source is Cochrane's February 2007 draft of lecture notes, first drafted in 2003. It contains substantial derivations as well as unfinished sections and explicit numerical puzzles. It should be read as a conceptual treatment, not as a fully polished theorem-and-empirical-results paper.

The basic economic object is consumption, not the account statement. If the investor has outside income $e$ and buys payoff $x$, consumption is $c=x+e$. In complete markets the problem is

$$
\max_x E[u(x+e)]\quad\text{subject to }E[mx]=W,
$$

and $x^*=(u')^{-1}(\lambda m)-e$. The subtraction is fundamental: labor income, private business income, and other endowments already create state-dependent exposure. A securities portfolio that looks inefficient alone may be desirable when combined with those exposures.

For power utility and no outside income, the budget-normalized solution is

$$
x^*=W\frac{m^{-1/\gamma}}{E[m^{1-1/\gamma}]},
$$

assuming the denominator is finite and the payoff is attainable. Risk aversion controls the curvature of the payoff against the discount factor. The scalar denominator is economically important because it pays for the desired contingent claims. A proportionality statement alone does not determine the size of the investment.

With a fixed subsistence requirement $h$ at the terminal date and deterministic interest rate, the investor first finances $h$ with a bond. Only $W-he^{-rT}$ is available for the usual discretionary power-utility payoff. This requires sufficient wealth to fund the floor. The demand for nonlinear claims or put-like protection arises from the consumption objective; it is not an independent assertion that options generate superior risk-adjusted returns.

## 7. Incomplete markets: the missing step in the simple formula

Let $\mathcal X$ be the linear space of attainable payoffs, equipped with inner product $E[xy]$. Under the notes' square-integrability and law-of-one-price setup, there is a unique pricing payoff $x^*\in\mathcal X$ satisfying $p(x)=E[x^*x]$ for every $x\in\mathcal X$. For a finite payoff basis $z$ with price vector $p$, one representation is

$$
x^*=p^\top E[zz^\top]^{-1}z.
$$

All other SDFs can be written $m=x^*+\epsilon$ with $E[\epsilon x]=0$ for all attainable $x$. The pricing payoff in the traded span need not be positive state by state, even when a positive SDF exists outside that span.

For arbitrary nonlinear utility, one cannot pick any such $m$, invert marginal utility, and declare the resulting payoff feasible. One must find an SDF for which $(u')^{-1}(\lambda m)-e\in\mathcal X$. Equivalently, optimal marginal utility divided by the multiplier is an SDF that prices every attainable perturbation. The identity characterizes the answer but can leave a difficult nonlinear spanning problem to solve.

This distinguishes two sources of complexity: uncertainty over the correct return distribution and incompleteness of the securities available to express a desired payoff. More accurate estimation does not make an unspanned claim tradable. Additional options may expand the attainable nonlinear functions without completing the market with respect to every economic shock.

## 8. Quadratic utility gives a projection solution

For $u(c)=-\tfrac12(c_b-c)^2$, possibly with stochastic bliss point $c_b$, marginal utility is linear. Define the payoff projections $\widehat c_b=\operatorname{proj}(c_b\mid\mathcal X)$ and $\widehat e=\operatorname{proj}(e\mid\mathcal X)$. Projecting the first-order condition gives

$$
x=\widehat c_b-\widehat e-\lambda x^*.
$$

Let $R^*=x^*/p(x^*)$, a unit-price return with minimum second moment in the attainable space. The budget constraint yields

$$
x=\widehat c_b-\widehat e-
[p(\widehat c_b)-p(\widehat e)-W]R^*.
$$

This is an exact formula for the specified quadratic problem. It separates the replicable part of desired consumption, the hedge for outside income, and the adjustment for available wealth. Residual unspanned income risk remains; the formula does not eliminate it.

The minimum-second-moment return is not automatically the global minimum-variance return. It minimizes $E[R^2]$ and lies on the lower portion of the usual mean-variance frontier. Confusing the two would change both the pricing interpretation and the signs in this decomposition. Quadratic utility also has an economic limitation: above the bliss point marginal utility becomes negative, and absolute risk aversion rises as wealth approaches that point. Its local usefulness does not justify treating it as globally realistic.

## 9. Two-fund statements and why a traded portfolio can differ from the market

With common beliefs, the appropriate utility restrictions, and no heterogeneous outside-income or state risks, efficient holdings can be expressed using a risk-free asset and a common risky portfolio. The source repeatedly stresses the qualifications. If investors differ in nontraded endowments, their total desired consumption portfolios can share a frontier while their **traded asset portfolios** differ substantially.

In the quadratic illustration, first choose the efficient total payoff including the mimicking portfolio for outside income, then subtract the income exposure already owned. Safe outside income resembles an existing bond holding. Risky income correlated with an industry can motivate an offsetting industry exposure. These are model implications about insurance, not automatically executable recommendations; actual shorting restrictions and income nontradability matter.

Expressing holdings relative to aggregate holdings adds another insight: deviation from the market should depend on how the investor differs from the average investor. Aggregate outside-income hedges and individual outside-income hedges both enter. The market portfolio of **total wealth**, including income claims, is not generally the observed stock index.

A factor with zero pricing premium can still be useful for hedging an investor's income. A priced factor and a useful insurance instrument answer different questions. This distinction is central to Cochrane's concluding argument for studying hedging portfolios rather than only searching for alpha.

## 10. Payoff shape and dynamic implementation

In the complete constant-parameter stock-and-bond diffusion, the optimal fraction is

$$
\alpha=\frac{\mu-r}{\gamma\sigma^2}.
$$

Continuous rebalancing implements terminal wealth

$$
W_T=W_0\exp\left[(1-\alpha)(r+\tfrac12\alpha\sigma^2)T\right]
\left(\frac{S_T}{S_0}\right)^\alpha.
$$

This is a power payoff on the stock. Holding a constant fraction through time produces a nonlinear terminal payoff; it is not equivalent to buying an initial stock-and-bond allocation and leaving the shares untouched. A suitable option portfolio can implement the same payoff in a complete frictionless model. The payoff approach identifies the economic target, while dynamic programming identifies one trading implementation.

In this particular i.i.d. diffusion with CRRA terminal utility, the fraction is independent of horizon. Longer time alone does not imply that stocks become less risky for the investor's objective. Changing income, constraints, preferences, or return predictability can change that conclusion.

For consumption over time, the first-order conditions become $\beta^t u'(c_t)=\lambda m_t$ or $e^{-\rho t}u'(c_t)=\lambda m_t$ in continuous time. The object purchased is now a stream of date-and-state contingent payouts. A normalized payout divided by its initial price is a **yield stream**, not a one-period gross return. In the long-run quadratic analogy, a real perpetuity is the constant-consumption instrument; a short nominal cash account does not serve the same purpose for every long-horizon objective.

## 11. Dynamic state variables and hedging demand

Let $V(W,y,t)$ be the value function, $\Sigma=\sigma\sigma^\top$ the instantaneous risky-return covariance, and $C=\sigma\sigma_y^\top$ the covariance rate between returns and state-variable innovations. The portfolio first-order condition yields

$$
\alpha=-\frac{V_W}{WV_{WW}}\Sigma^{-1}(\mu-r\mathbf1)
-\frac1{WV_{WW}}\Sigma^{-1}C V_{Wy}.
$$

The first term is instantaneous mean-variance demand, scaled by the value function's relative **risk tolerance**, $-V_W/(WV_{WW})$. The reciprocal is relative risk aversion; the draft occasionally labels the tolerance itself as risk aversion. The second term hedges shocks that change marginal value of wealth. Its sign depends on both return-state covariance and the relevant value-function derivatives.

The regression matrix $\Sigma^{-1}C$ constructs portfolios that mimic state innovations. This creates multi-fund representations and links portfolio choice to the ICAPM. It does not solve the value function: without $V_{Wy}$ and $V_{WW}$, the formula is a characterization, not a fully specified allocation.

Forecastable returns can change current speculative demand and generate hedging demand at the same time. If state innovations contain unspanned shocks, setting their SDF loading to zero by convenience is not generally valid for power utility. Attainability still has to be imposed. The notes' time-varying-mean section explicitly encounters this difficulty rather than supplying a universal closed-form solution.

## 12. Estimation risk, predictive distributions, and shrinkage

The “wacky weights” examples use a market-timing regression on dividend yield and a cross-section of 25 Fama–French portfolios plus three factors. Plugging estimated means and covariances into the optimizer produces extreme timing recommendations or large offsetting long and short positions. These examples are diagnostics of estimation sensitivity, not demonstrations of achievable prospective Sharpe ratios.

A useful mechanism is a nearly redundant pair of assets: the estimated covariance matrix says their spread is almost riskless, while small mean-estimation differences suggest it earns a premium. Inverting that matrix magnifies the apparent opportunity. Position limits can reduce the damage but do not prove the estimated opportunity is real.

Bayesian analysis integrates over parameter uncertainty:

$$
p(R_{t+1}\mid D)=\int p(R_{t+1}\mid\theta)p(\theta\mid D)d\theta.
$$

If return noise has variance $\sigma^2$ and the posterior mean parameter has variance $s_\mu^2$, the one-period predictive variance is $\sigma^2+s_\mu^2$. This variance adjustment is distinct from shrinking the posterior mean toward a prior. With an uncertain constant drift over horizon $h$, accumulated drift uncertainty contributes $h^2s_\mu^2$, whereas diffusion noise contributes $h\sigma^2$. Their horizon scaling differs.

The notes' fixed-fraction, no-learning CRRA calculation gives

$$
\alpha=\frac{\bar\mu-r}{\gamma\sigma^2+(\gamma-1)s_\mu^2h}.
$$

When $s_\mu^2=\sigma^2/T$, the algebraically consistent factorization is

$$
\alpha=\frac{\bar\mu-r}{\gamma\sigma^2[1+((\gamma-1)/\gamma)(h/T)]}.
$$

The draft's second version of equation (82) drops the division by $\gamma$ inside the bracket and is inconsistent with the line immediately above it. The unfactored formula avoids that error. For $\gamma>1$, uncertainty reduces risky demand and the effect grows with horizon. For log utility it vanishes in this fixed-fraction expected-log calculation. For $\gamma<1$, one must check well-posedness rather than mechanically extrapolating a positive risk penalty. Learning and adaptive future allocations are deliberately omitted here.

To combine a normal prior $\alpha\sim N(\alpha_p,v_p)$ with an independent noisy estimate $\widehat\alpha$ of variance $v_s$, posterior mean is

$$
\widetilde\alpha=\frac{\widehat\alpha/v_s+\alpha_p/v_p}{1/v_s+1/v_p}.
$$

A zero-alpha prior discounts weakly estimated anomalies most strongly. The vector version adds precision matrices. Covariance regularization addresses a different instability: diagonal enhancement or factor structure suppresses spurious nearly riskless combinations. Predictive uncertainty, prior mean shrinkage, covariance shrinkage, and future learning should not be collapsed into one undifferentiated “Bayesian” adjustment.

## 13. Internal checks on numerical illustrations

A few draft formulas require algebraic care. For a tangency direction $v=\Sigma^{-1}\mu$, matching portfolio volatility to $\sigma_M$ requires multiplier $\sigma_M/\sqrt{\mu^\top\Sigma^{-1}\mu}$. The printed expression in the cross-sectional illustration uses a variance ratio without the square root; as written, it does not generally deliver the claimed variance. This summary treats the accompanying plots as the author's illustrative calculations, not as independently reproduced results.

Similarly, under independent annual diffusion shocks, ten-year return-noise standard deviation scales as $\sqrt{10}\sigma$, while uncertainty in a fixed annual drift scales as $10s_\mu$. The draft's surrounding numerical prose includes a linear-in-time scaling for volatility that is inconsistent with its own stated principle. The mathematical distinction remains sound after correcting the arithmetic.

The notes openly mark unresolved comparisons with earlier numerical results and include unfinished sections. These features reinforce the need to verify constants and normalizations before using the equations as production code.

## 14. Economic limitations and the consumption consistency check

The average investor must hold the aggregate market. An allocation attractive for one investor cannot be universal advice to every investor at unchanged prices. Differences in income, preferences, beliefs, constraints, and exposure to state variables determine who should be on the other side of a trade. A return pattern may disappear as capital responds, compensate an overlooked risk, or be difficult to exploit because of trading frictions.

The notes also insist that the portfolio and consumption prescriptions belong to the same model. In the constant-opportunity CRRA consumption problem, consumption is proportional to wealth. A recommended equity fraction therefore implies substantial consumption volatility. Accepting the asset allocation while rejecting the implied consumption behavior is evidence that the model needs modification; changing the model can change the portfolio advice too.

The overall contribution is a useful separation of economic choice from financial implementation. First specify the desired consumption payoff given prices, income, and preferences. Then establish attainability and choose an implementation. Finally account for uncertainty in the inputs. The compact SDF first-order condition is powerful precisely when its feasibility, normalization, and preference assumptions remain visible.
