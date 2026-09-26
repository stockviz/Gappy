# Portfolio Choice Problems (2010)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioChoice_Brandt_2010_survey.pdf>), 68 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

## Bibliographic identity and scope

Michael W. Brandt, **“Portfolio Choice Problems,”** chapter 5 in *Handbook of Financial Econometrics* (2010), pp. 269–336. The local source is the complete 68-page chapter, including its references. It is a methodological survey with worked illustrations, rather than a new backtest proposing one universally superior strategy.

Its organizing question is how an economically specified portfolio problem becomes an estimable investment rule. Three procedures that can look similar computationally answer different questions:

| Procedure | Object estimated or chosen | Treatment of uncertainty |
|---|---|---|
| Plug-in estimation | The optimal portfolio of a hypothetical investor who knows the true return process | Estimate process parameters, map them into weights, and quantify sampling error |
| Bayesian decision theory | The action of an investor who does not know the true process | Integrate uncertain parameters and possibly models into a predictive distribution before optimizing |
| Direct policy estimation | A portfolio rule or its first-order conditions | Estimate the decision rule using returns and observable conditioning information, without a complete return model |

Brandt does not establish that one route dominates all others. His central point is that portfolio construction is an econometric decision problem: optimizing accurately against poorly estimated inputs can still give a poor decision. Conversely, a statistically biased estimator can be economically preferable if its reduction in estimation variance is sufficiently large.

## 1. The basic portfolio problem and its constraints

Let $r_{t+1}$ denote **excess** returns of $N$ risky assets, and $R^f_t$ the gross risk-free return. A vector $x_t$ gives fractions of current wealth in risky assets; the remaining fraction $1-\mathbf1^\top x_t$ is in cash. In the unrestricted mean–variance problem,

$$
\max_x\;x^\top\mu-\frac{\gamma}{2}x^\top\Sigma x,
\qquad x^*=\frac1\gamma\Sigma^{-1}\mu,
$$

provided $\Sigma$ is positive definite. This formula allows borrowing and short sales. It is not the solution of the fully invested risky-only problem with $\mathbf1^\top x=1$, nor does it automatically respect nonnegative wealth in a discrete-time model with unbounded return support.

For risky-only frontier portfolios, define

$$
A=\mathbf1^\top\Sigma^{-1}\mu,\quad
B=\mu^\top\Sigma^{-1}\mu,\quad
C=\mathbf1^\top\Sigma^{-1}\mathbf1,\quad D=BC-A^2.
$$

When $D>0$, minimizing variance subject to budget one and target mean $m$ gives

$$
w(m)=\frac{B\Sigma^{-1}\mathbf1-A\Sigma^{-1}\mu}{D}
+\frac{C\Sigma^{-1}\mu-A\Sigma^{-1}\mathbf1}{D}\,m.
$$

This affine representation makes the separation result explicit: every frontier portfolio is a combination of two fixed vectors. With cash available, the risky tangency direction is $\Sigma^{-1}\mu$, normalized to budget one only if $\mathbf1^\top\Sigma^{-1}\mu\ne0$. Risk aversion then governs the amount allocated to that direction.

Mean–variance preferences should also be distinguished from arbitrary expected utility. An exact mean–variance representation requires appropriate preferences/distributional structure; otherwise it is an approximation. Quadratic utility is one familiar special case, and exponential utility with normally distributed wealth is another. A first-order condition from one formulation should not silently be applied to another.

## 2. Dynamic choice: the relevant objective is terminal wealth

The chapter's baseline dynamic investor maximizes $E_t[u(W_{t+\tau})]$, with self-financing wealth

$$
W_{s+1}=W_s\bigl(R^f_s+x_s^\top r_{s+1}\bigr),\qquad W_s\ge0.
$$

The state $z_s$ describes investment opportunities, and the return/state process is assumed Markov in the selected state. A correct terminal-wealth Bellman equation is

$$
V_t(W,z)=\max_{x\in\mathcal A_t(W,z)}
E_t\left[V_{t+1}\bigl(W(R^f_t+x^\top r_{t+1}),z_{t+1}\bigr)\right],
\qquad V_T(W,z)=u(W).
$$

One must not add $u(W_{t+1})$ at every date unless repeated wealth utility is actually the intended preference specification. Intermediate consumption is a separate extension with consumption in both utility and the budget constraint.

For interior choices, the terminal-wealth Euler condition is

$$
E_t[V_{W,t+1}(W_{t+1},z_{t+1})r_{t+1}]=0.
$$

With CRRA utility $u(W)=W^{1-\gamma}/(1-\gamma)$, homogeneity allows

$$
V(\tau,W,z)=\frac{W^{1-\gamma}}{1-\gamma}\psi(\tau,z),\qquad \psi(0,z)=1,
$$

and the portfolio condition becomes

$$
E_t[(R^f_t+x_t^\top r_{t+1})^{-\gamma}
\psi(\tau-1,z_{t+1})r_{t+1}]=0.
$$

The continuation factor $\psi$ is the source of hedging demand. A security is valuable partly because its payoff arrives in states in which future investment opportunities are unattractive. This differs from simply choosing a longer return estimation window.

For clarity about signs, when $\gamma>1$ the factor $1/(1-\gamma)$ is negative; one cannot remove it from a maximization and keep the same maximization direction. The original expected utility formulation avoids that pitfall.

## 3. Continuous-time decomposition and when myopia is valid

Let risky excess price changes have instantaneous mean $\mu$ and covariance $\Sigma$, and let $C$ be the $N\times K$ instantaneous covariance between risky returns and innovations in the opportunity state. The continuous-time first-order condition yields

$$
x^*=-\frac{V_W}{WV_{WW}}\Sigma^{-1}\mu
-\frac1{WV_{WW}}\Sigma^{-1}C V_{Wz}.
$$

The first term is myopic demand, scaled by the investor's local relative risk tolerance. The second is intertemporal hedging demand. Writing the covariance directly as $C$ avoids orientation ambiguities in Brownian loading matrices. Under CRRA homogeneity this becomes

$$
x^*=\frac1\gamma\Sigma^{-1}\mu
+\frac1\gamma\Sigma^{-1}C\nabla_z\log\psi.
$$

The state-hedging portfolios $\Sigma^{-1}C$ project opportunity-set shocks on traded returns. Their usefulness depends jointly on their tradability and on the sensitivity of future marginal utility to those shocks.

The survey identifies three important settings in which hedging demand disappears: constant investment opportunities; opportunity changes that cannot be hedged using the available assets; and logarithmic utility. In the CRRA discrete-time case, suitable conditional independence factors the Euler condition into the myopic return condition and a continuation expectation. In the diffusion representation, zero covariance with state innovations eliminates the hedging term. With log utility, log terminal wealth is the sum of log one-period gross returns, so an adapted sequence of one-period log-optimal decisions solves the frictionless problem.

These conclusions depend on the modeled state and the admissible strategy set. Transaction costs, borrowing constraints, labor income, and other state variables can change the problem. “Returns are predictable” alone is not sufficient to establish the size or sign of hedging demand.

## 4. The dividend-yield example: assumptions and actual magnitudes

The worked dynamic example uses quarterly real CRSP value-weighted stock returns and a 90-day Treasury rate over April 1952–December 1996. A homoscedastic VAR relates log stock returns and log dividend yield to the lagged log dividend yield. The reported return slope is 0.0568 with standard error 0.0249; dividend-yield persistence is 0.9514. The return equation has $R^2=2.3\%$, while the dividend-yield equation has $R^2=89.3\%$. Return innovations and dividend-yield innovations are strongly negatively correlated.

Treating these estimated parameters as the truth, and using relative risk aversion five, the source reports the following conditional stock allocations:

- At the median dividend yield of 3.5%, the allocation rises from 58% for one quarter to 66% for one year, 96% for five years, and 100% beyond six years in the numerical example.
- One-quarter stock weights are 23%, 58%, and 87% at the 25th, 50th, and 75th percentiles of dividend yield, respectively.
- At the median yield, dynamic investment improves the annual certainty-equivalent rate over repeated myopic investment by about 2 basis points at one year, 30 basis points at five years, and 57 basis points at ten years.
- The corresponding willingness to surrender current wealth is less than 0.1%, about 1.5%, and about 5.9% at those horizons.

The positive stock hedge arises because a positive stock return tends to lower dividend yield and worsen future opportunities. Extra stock exposure pays when those opportunities deteriorate. The horizon effect is therefore a covariance-and-preferences result, not a general rule that stocks are always safer over longer horizons.

Brandt explicitly warns that dividend-yield predictability weakened in the later sample and uses the older period for illustration. These numbers are calibrated examples, not current recommended allocations or evidence of executable net trading returns.

## 5. A continuous-time policy can be inadmissible in discrete time

The chapter gives a useful counterexample to indiscriminate transfer of diffusion formulas. With log utility, annual risk premium 5.7%, and volatility 16.1%, the continuous-time risky fraction is

$$
x^*=0.057/0.161^2\simeq2.20.
$$

Continuous rebalancing preserves positive wealth under the diffusion assumptions. Holding the same leveraged position across a finite interval with lognormal stock prices is different: the gross stock return can be arbitrarily close to zero, and a sufficiently poor realization makes repayment of borrowing impossible. Thus the policy violates the discrete-time no-bankruptcy requirement even when the probability is extremely small. The source quotes a quarterly probability of roughly $1.3\times10^{-9}$ in this example.

For the lognormal cash-and-stock setup, an unrestricted diffusion solution above 100% is therefore not automatically an admissible discrete-time allocation. Rare-event insurance, jumps, limited liability, margin rules, or a different utility domain must be modeled explicitly if they are intended to reconcile the formulations.

## 6. Extensions that change the state or objective

The theoretical survey is broader than mean–variance optimization:

- **Preferences:** HARA utility includes CRRA, CARA, log, and quadratic cases. Recursive Epstein–Zin–Weil preferences separate risk aversion from intertemporal substitution. Subsistence, habits, disappointment, ambiguity, and benchmark or shortfall objectives alter the portfolio problem rather than merely changing an input estimate.
- **Consumption:** Add utility of the consumption stream and reduce investable wealth by consumption. Under the homothetic CRRA structure, the consumption policy helps recover the value function through the envelope condition. Consumption generally shortens the effective investment horizon and changes hedging demand.
- **Complete markets:** The martingale approach replaces a dynamic trading problem with a static choice of state-contingent terminal payoffs and then recovers a replicating strategy. Extensions to incomplete markets require additional duality arguments; market completeness is not a harmless computational convenience.
- **Horizon:** Infinite-horizon stationarity can eliminate explicit time dependence, but convergence from finite horizons requires conditions. The chapter cites HARA examples in which long-horizon problems become ill-defined.
- **Frictions:** Proportional trading costs require inherited holdings as state variables; taxation can require acquisition cost bases. A return-only state is then insufficient.
- **Background risks:** Labor income, entrepreneurial income, and housing matter through their joint distribution with traded returns and their evolution over the life cycle.

These extensions explain why a computationally simple risky-weight formula can be economically incomplete even when its algebra is correct.

## 7. Plug-in estimation and propagation of error

Write the optimal portfolio as $x(\phi,z,\theta)$, where $\phi$ contains preference parameters and $\theta$ specifies the return process. If

$$
\sqrt T(\widehat\theta-\theta)\Rightarrow N(0,V_\theta),
$$

then, under differentiability and regularity,

$$
\sqrt T(\widehat x-x^*)\Rightarrow
N(0,D_\theta x\,V_\theta\,D_\theta x^\top).
$$

For mean–variance weights, a useful differential is

$$
dx=\frac1\gamma\Sigma^{-1}d\mu
-\Sigma^{-1}(d\Sigma)x.
$$

This displays both sources of uncertainty and the amplification from small covariance eigenvalues. In a dynamic program, $D_\theta x_t$ must include indirect dependence through all subsequent policies and continuation values. Treating each backward step as estimated without error omits that propagation.

The source also discusses a special unbiased Gaussian estimator. If $S=\sum_{t=1}^T(r_t-\bar r)(r_t-\bar r)^\top$, then for normal independent returns and $T>N+2$,

$$
E[S^{-1}]=\frac{\Sigma^{-1}}{T-N-2}.
$$

Consequently defining $\widehat\Sigma=S/(T-N-2)$ makes $\widehat\Sigma^{-1}$ unbiased. Independence of $\bar r$ and $S$ then makes $\gamma^{-1}\widehat\Sigma^{-1}\bar r$ unbiased. This is an inverse-moment correction, not the usual unbiased covariance estimator $S/(T-1)$. The reciprocal in the inverse-Wishart expectation is essential; the source footnote's printed expression should not be copied literally.

For a single asset under independent normal sampling, a first-order approximation gives

$$
\operatorname{Var}(\widehat x)\simeq
(x^*)^2\left\{\frac{\operatorname{Var}(\widehat\mu)}{\mu^2}
+\frac{\operatorname{Var}(\widehat\sigma^2)}{\sigma^4}\right\}.
$$

The covariance term vanishes here because of normality and the independence of the sample mean and variance. Outside that setting it must generally be restored. Persistent conditional heteroskedasticity and fat tails can make second-moment uncertainty substantial, so “only means matter” is not a universal conclusion.

**Units caveat:** the source's illustrative calculation describes ten years of monthly data but inserts annual mean/volatility values and $T=120$ into an unadjusted standard-error calculation, obtaining a weight standard error near 14%. That number should not be reused without a consistent return frequency. With annual mean 6%, annual volatility 15%, risk aversion five, and 120 independent monthly observations, converting mean and variance to monthly units gives approximately 42.7% for the first-order weight standard error, while the true weight remains 53.3%. This is an explanatory correction to the numerical illustration, not an additional empirical result.

## 8. Evaluate errors in units of investor welfare

Let $CE(x)=x^\top\mu-\gamma x^\top\Sigma x/2$, and let $x^*$ be its unrestricted optimum. Completing the square gives the exact identity

$$
CE(x^*)-CE(\widehat x)
=\frac\gamma2(\widehat x-x^*)^\top\Sigma(\widehat x-x^*).
$$

Taking the sampling expectation produces

$$
E[CE(x^*)-CE(\widehat x)]
=\frac\gamma2\left\{\operatorname{tr}\bigl[\Sigma\operatorname{Cov}(\widehat x)\bigr]
+b^\top\Sigma b\right\},\quad b=E[\widehat x]-x^*.
$$

The chapter's covariance-only approximation suppresses the bias contribution under its local/unbiased approximation. Consistency alone does not make finite-sample bias vanish. This fuller form shows precisely how shrinkage can help: a small increase in squared bias may be more than offset by lower covariance-weighted estimation variance.

The quadratic loss also explains why an appreciable weight error can have a relatively small local utility cost. But a local approximation does not guarantee small finite-sample losses when estimated portfolios are extreme or a utility-domain constraint is violated.

## 9. What the finite-sample illustrations actually show

The chapter repeats a Jobson–Korkie-style experiment using ten industry portfolios. Historical moments are treated as population truth; for each sample size, 250 independent normal return samples generate estimated portfolios. Their performance is then evaluated against the fixed true moments. This separates estimation error from realized out-of-sample return noise.

With 25, 50, 100, and 150 observations, the estimated frontiers are dispersed and economically inferior to the true frontier. Nonnegative-weight constraints help but do not remove the problem. In the illustrated unconstrained case with 150 observations, the estimated tangency portfolios have average Sharpe ratio 0.42, with 25th and 75th percentiles 0.37 and 0.48, against a reported true ratio around 0.61. The source's illustrative sample tangency portfolio assigns 82% to nondurables and −48% to manufacturing.

A separate shrinkage table reports:

| Observations | Known covariance: sample means | Known covariance: shrunk means | Estimated covariance: sample means | Estimated covariance: shrunk means |
|---:|---:|---:|---:|---:|
| 25 | 0.190 | 0.428 | 0.169 | 0.270 |
| 50 | 0.236 | 0.446 | 0.223 | 0.371 |
| 100 | 0.313 | 0.477 | 0.298 | 0.443 |
| 150 | 0.362 | 0.495 | 0.348 | 0.473 |
| 250 | 0.418 | 0.512 | 0.411 | 0.501 |

The true ratio in this table is 0.624. The table and earlier plot are separate illustrations and should not be forced into one identical numerical experiment. Neither demonstrates a universal live-trading Sharpe improvement: normality, the calibration, and the simulated sample design are part of the result.

## 10. Three ways of regularizing a plug-in problem

**Shrinkage** replaces unstable estimates with a compromise, for example

$$
\widehat\mu_s=\delta\mu_0+(1-\delta)\widehat\mu,\qquad
\widehat\Sigma_s=\delta S_0+(1-\delta)\widehat\Sigma.
$$

The direction and intensity matter. Shrinking a covariance toward a positive definite target with positive weight can restore invertibility when the sample covariance is singular. A loss-optimal shrinkage factor for covariance entries need not be optimal for investor welfare. Shrinking weights themselves toward a benchmark is another possibility; proportional changes to both mean and covariance can cancel in $\Sigma^{-1}\mu$, leaving the portfolio unchanged.

**Factor models** impose $\Sigma=B\Sigma_f B^\top+D$, with a usually diagonal residual covariance $D$. They reduce dimension but can miss correlated residual risks. The chapter counts 3,515 return-model coefficients for 500 assets and five correlated factors, versus over 125,000 distinct unrestricted covariance terms. Economic, characteristic-based, and statistical factors trade interpretability against flexibility. The reported literature does not identify one factor specification as uniformly best.

**Constraints** truncate unstable positions and can act as implicit regularization. The Jagannathan–Ma interpretation connects binding lower/upper bounds in minimum variance to a modified covariance matrix derived from the multipliers. However, a large long-short position need not indicate poor diversification: offsetting systematic exposures can rationally require such positions when the model is known. Constraints may help against estimation error while reducing the true unconstrained opportunity set. Both effects belong in the comparison.

## 11. Bayesian inference about weights is not Bayesian choice of weights

A Bayesian can estimate $\theta$, transform each posterior draw into $x^*(\theta)$, and describe the posterior distribution of the hypothetical known-parameter optimum. This remains inference about an optimal weight.

A decision maker instead chooses **one action** against the predictive return distribution:

$$
p(r\mid Y)=\int p(r\mid\theta)p(\theta\mid Y)\,d\theta,
\qquad
x_B\in\arg\max_x\int u(R^f+x^\top r)p(r\mid Y)\,dr.
$$

In general,

$$
\arg\max_x E_{\theta\mid Y}[U(x,\theta)]
\ne E_{\theta\mid Y}[\arg\max_x U(x,\theta)].
$$

The same posterior therefore supports two different calculations. Averaging optimal portfolios is not a substitute for optimizing posterior expected utility.

With one normal risky return, known variance $\sigma^2$, and a flat mean prior, the posterior mean is $\bar r$ and posterior mean variance is $\sigma^2/T$. Predictive return variance is consequently $\sigma^2+\sigma^2/T$. Under mean–variance utility with the same posterior mean, this additional variance reduces the optimal risky weight. That restricted example does not prove that every Bayesian portfolio is more conservative: informative priors can raise expected returns, change cross-asset hedges, or increase exposure.

If volatility is also uncertain, normal scale mixtures generate Student tails. Care is needed with Student scale versus variance: with the standard noninformative normal model and sample variance $s^2$, predictive scale squared is $(1+1/T)s^2$, while predictive variance multiplies that by $(T-1)/(T-3)$ when $T>3$. The source's notation labels a scale-like quantity “variance”; implementations must resolve that convention rather than copy it.

## 12. Informative priors and economic views

For $\mu\sim N(m_0,\tau^2)$ with known observation variance $\sigma^2$, posterior precision adds:

$$
v_\mu=(\tau^{-2}+T\sigma^{-2})^{-1},\qquad
m_\mu=v_\mu(\tau^{-2}m_0+T\sigma^{-2}\bar r).
$$

The predictive distribution is $N(m_\mu,\sigma^2+v_\mu)$. This is shrinkage with a probabilistic interpretation: stronger prior precision receives more weight, and posterior parameter variance is retained in prediction.

For mixed estimation, let a prior mean vector have distribution $\mu\sim N(m_0,\Lambda)$, and let views satisfy $v=P\mu+\varepsilon$, $\varepsilon\sim N(0,\Omega)$, independently of prior uncertainty. Then

$$
C_\mu=(\Lambda^{-1}+P^\top\Omega^{-1}P)^{-1},\qquad
m_\mu=C_\mu(\Lambda^{-1}m_0+P^\top\Omega^{-1}v).
$$

Under known conditional return covariance $\Sigma$, the predictive return covariance is **$\Sigma+C_\mu$**. The local source's equations (3.50)–(3.51) contain inconsistent inverse notation and a precision-combination expression for predictive variance. The expressions above follow directly from Gaussian updating and the law of total variance and correct those printed formulas.

Black–Litterman supplies an economic center for this prior by reverse optimization:

$$
\mu_{\mathrm{equil}}=\gamma\Sigma w_{\mathrm{market}},\qquad
\Lambda=\lambda\Sigma.
$$

The matrix $P$ permits absolute or relative views on a subset of asset combinations; $\Omega$ states uncertainty and dependence among views. The equilibrium center depends on aggregate risk aversion and a chosen covariance model, so it is not an independently observed vector of true expected returns.

The chapter's six size/book-to-market portfolio example uses January 1983–December 2003 returns and December 2003 capitalization weights. The implied and historical risk premia are negatively correlated across portfolios, with correlation −0.83. This illustrates how mixing an economic prior and historical means can shrink cross-sectional dispersion substantially. It does not validate the equilibrium prior against an external truth.

Other examples place a prior around zero predictive slope or around zero pricing-model alpha. In Connor's predictive-slope representation, the retained fraction of an OLS slope is $T/(T+1/\rho)$, where $\rho$ approximates the prior expected predictive $R^2$ at low predictability. At expected $R^2$ of 1%, this retains about 38% for $T=60$ and 55% for $T=120$. The size of the prior matters economically, even when a slope is conventionally statistically significant.

## 13. Parameter uncertainty, learning, and model uncertainty

In an independent one-period normal example, predictive variance inflation is small once $T$ is moderate. This observation does not extend automatically to long-horizon predictable returns. The same unknown parameter affects many future periods, so uncertainty about cumulative expected returns can grow faster than ordinary return noise. Learning changes the state and may change the hedging problem; it cannot be represented solely by adding one constant variance penalty.

With competing models $M_j$, Bayesian model averaging forms

$$
p(r\mid Y)=\sum_j p(M_j\mid Y)\int p(r\mid\theta_j,M_j)
 p(\theta_j\mid Y,M_j)\,d\theta_j.
$$

Noncentral moments average directly. Central covariance also includes the dispersion of model-specific means:

$$
\operatorname{Cov}(r\mid Y)=\sum_j q_j\Sigma_j
+\sum_j q_j(m_j-\bar m)(m_j-\bar m)^\top.
$$

This second term is why averaging covariance matrices alone understates predictive risk when models disagree about expected returns.

The difficulty is both computational and conceptual. Fifteen optional regressors generate $2^{15}=32,768$ models. Uniform prior mass over these models assigns only one part in 32,768 to the no-predictability model; it is not neutral about predictability as an economic hypothesis. Closely related predictors can also multiply representation of one forecasting story. The candidate set excludes all unlisted models, and posterior probabilities remain conditional on that exclusion.

## 14. Direct estimation through managed portfolios

For a policy $x_t=\Theta z_t$, define managed excess returns $\widetilde r_{t+1}=z_t\otimes r_{t+1}$. The algebraic identity

$$
x_t^\top r_{t+1}=\operatorname{vec}(\Theta)^\top\widetilde r_{t+1}
$$

turns estimation of a fixed coefficient vector into allocation across an expanded set of assets. For an **unconditional** mean–variance objective over these managed returns,

$$
\widetilde x^*=\frac1\gamma\operatorname{Var}(\widetilde r)^{-1}E[\widetilde r].
$$

This requires no full model for the conditional evolution of returns and state variables, although it still requires adequate estimation of managed-return moments. The source's equation (4.7) should have the mean of the expanded return vector on its right side; an unexpanded $N$-vector has the wrong dimension.

There is an important qualification to the source's conditioning argument. Unconditional variance obeys

$$
\operatorname{Var}(X)=E[\operatorname{Var}(X\mid z)]+
\operatorname{Var}(E[X\mid z]).
$$

Therefore maximizing each conditional mean–variance criterion does not, merely by taking expectations, imply maximization of the unconditional mean–variance criterion with the same coefficient. The extra variance of conditional means changes the objective. The managed-return identity is exact; a claimed equivalence of optimization problems additionally requires a compatible objective and policy assumptions. Expected-utility formulations can use iterated expectations when the correctly specified common policy is pointwise optimal, but an arbitrary restricted parametric policy only solves its chosen unconditional problem.

For multiple periods, the chapter introduces timing portfolios. A two-period compounded excess return contains two first-order exposure terms plus the product of two risky excess returns. Dropping that product gives a convenient static optimization over timing portfolios. This is an approximation: high leverage, long holding periods, or large return realizations can make compounding economically material. Multi-period mean–variance commitment and dynamically reoptimized expected utility are also different objectives.

## 15. Large cross sections and nonparametric policies

The characteristic-based policy of Brandt, Santa-Clara, and Valkanov is

$$
w_{i,t}=\bar w_{i,t}+\frac1{N_t}\theta^\top\widehat y_{i,t},
$$

where standardized characteristics have zero cross-sectional mean and unit scale. The active weights sum to zero, so total weight remains one if the benchmark is fully invested. The $1/N_t$ factor prevents the strategy becoming mechanically more aggressive as the universe expands. A small $\theta$ can govern thousands of holdings.

Estimate $\theta$ by maximizing average realized utility of the resulting portfolio's **gross** returns or wealth, with explicit positivity where CRRA utility requires it. Characteristics can affect means, covariances, and tail behavior without estimating each channel separately. Constant coefficients are nevertheless a substantive pooling restriction. Standardizing every date does not by itself prove stationarity of the full characteristic distribution or the optimality of a time-invariant policy. Nonlinear transformations, macroeconomic interactions, and long-only maps expand the class at the cost of more estimation complexity.

The nonparametric alternative estimates conditional Euler equations locally. For state $z$, one solves a kernel-weighted sample condition of the form

$$
\sum_t K_h(z_t-z)u'(R^f_t+x^\top r_{t+1})r_{t+1}=0.
$$

A normalized kernel regression consistently estimates the conditional expectation under suitable dependence, smoothing, support, and identification assumptions. An unnormalized kernel numerator converges to the conditional moment multiplied by the state density; at positive density its zero is the same. This distinction matters when interpreting the chapter's displayed normalization, even though it does not change the root.

The effective convergence scale is $\sqrt{Th^K}$ rather than $\sqrt T$, with smoothing bias also relevant. At sparse states and high state dimension, local information disappears. Brandt describes single-index reductions $z^\top\beta$ chosen for economic utility loss, and local-polynomial alternatives. They replace one form of specification risk with dimension reduction and smoothing choices; they do not eliminate the need for statistical validation.

## 16. Implementation implications and limits of the survey

A practical implementation suggested by the chapter starts by fixing the investor's objective, timing, information set, and admissibility conditions. Next decide whether the task is inference about a theoretical optimum or an actual decision under uncertainty. That determines whether to propagate parameter draws into weights or integrate them into predictive utility.

All returns, means, covariances, horizons, and utility parameters must use a consistent frequency. For dynamic problems, holdings, tax bases, posterior parameters, or background wealth may be necessary state variables. A numerical Bellman solver should verify terminal conditions, positivity, policy interpolation, and sensitivity to state-grid boundaries. A direct-policy estimator should use only information available at each decision date, retain a feasible utility domain, and estimate transaction costs from trades relative to drifted previous holdings.

Evaluation should use genuine future observations or a simulation whose truth is explicitly stated, with tuning inside the training period. Report certainty equivalents alongside return, risk, leverage, turnover, constraint violations, and sensitivity to priors or policy complexity. A portfolio with attractive estimated utility but unstable borrowing or unacceptable tail losses is not validated by the first-order condition alone.

The chapter offers an unusually useful map connecting finance theory and statistical decisions, but it is not a complete production specification. Its numerical illustrations are historical and stylized; many reviewed results assume normality, stationarity, frictionless trading, or correct functional form. Several displayed formulas require the corrections identified above. Its durable contribution is the distinction between **solving a known model**, **estimating its solution**, and **choosing a decision when the model is uncertain**.
