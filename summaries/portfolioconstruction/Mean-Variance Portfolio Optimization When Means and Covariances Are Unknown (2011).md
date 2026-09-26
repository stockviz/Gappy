# Mean-Variance Portfolio Optimization When Means and Covariances Are Unknown (2011)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/MVOPortfolioOptimization_LaiXinChen_2011.pdf>), 26 PDF pages.

## Metadata and contribution

**Tze Leung Lai, Haipeng Xing, and Zehao Chen (2011), “Mean–Variance Portfolio Optimization When Means and Covariances Are Unknown,” *The Annals of Applied Statistics* 5(2A), 798–823. DOI: 10.1214/10-AOAS422.** The local PDF contains all 26 published pages. The source filename abbreviates Xing as “Xin”; the author name in the paper is **Xing**.

The paper studies the performance of a portfolio **decision rule estimated from data**, rather than only the optimum when population means and covariances are known. Its main device converts an ex ante mean–variance optimization over such random rules into a family of posterior quadratic programs indexed by a scalar. It then develops a nonparametric empirical Bayes implementation, a bootstrap evaluation scheme, and time-series extensions.

The distinction between conditional and ex ante risk is central. Merely saying “replace the sample covariance with a posterior predictive covariance” does not describe the full method. For fixed observed data, ordinary conditional mean–variance optimization is already a quadratic program. The paper's extra scalar is needed because it evaluates a rule across the random training samples that generate its weights.

## 1. Why the usual estimated frontier can mislead

For known mean vector $\mu$ and covariance $\Sigma$, a fully invested frontier portfolio solves

$$
\min_w w^\top\Sigma w
\quad\text{subject to}\quad w^\top\mu=\mu^*,\quad
\mathbf1^\top w=1,
$$

with $w\ge0$ added for no short selling. Without that last restriction, the solution follows from the two equality multipliers and combinations of $\Sigma^{-1}\mu$ and $\Sigma^{-1}\mathbf1$.

Replacing $(\mu,\Sigma)$ with estimates changes the statistical problem. An equality $w^\top\widehat\mu=\mu^*$ only guarantees an estimated target return; it does not guarantee that the true mean equals the target. With long-only constraints, even the estimated target may be infeasible if it lies outside the convex hull of the estimated asset means. Estimation of $\Sigma$ also need not imply accurate estimation of $\Sigma^{-1}$, particularly near small eigenvalues.

The authors review three responses: factor models to reduce covariance dimension; Bayesian or other shrinkage of means and covariances; and bootstrap averaging of optimized weights. Their criticism is that these can improve input estimation while retaining an objective that overlooks the randomness of the estimated rule. They propose changing the optimization criterion itself. This is the paper's explanation of an important part of the “Markowitz enigma,” not a proof that all failures of estimated portfolios have one cause.

## 2. The random decision rule and the two layers of uncertainty

Let $R_n=(r_1,\ldots,r_n)$ be the training data, and let $w=w(R_n)$ be a measurable allocation rule. The next return is $r_{n+1}$, and the scalar portfolio return is $W=w(R_n)^\top r_{n+1}$. For risk penalty $\lambda>0$, the objective is

$$
J(w)=E[W]-\lambda\operatorname{Var}(W).
$$

In the Bayesian formulation, outer expectations include parameter uncertainty, the training sample, and the future return. In the frequentist assessment, parameters are fixed and training-sample/future-return randomness remains. Either way, the allocation is random before the training sample is observed.

Define conditional predictive moments

$$
\mu_n=E[r_{n+1}\mid R_n],\qquad
V_n=E[r_{n+1}r_{n+1}^\top\mid R_n],\qquad
\Sigma_n=V_n-\mu_n\mu_n^\top.
$$

Then

$$
E[W]=E[w^\top\mu_n],\qquad
E[W^2]=E[w^\top V_nw],
$$

and the law of total variance gives

$$
\operatorname{Var}(W)=E[w^\top\Sigma_nw]
+\operatorname{Var}(w^\top\mu_n).
$$

The second term captures variation of the rule's conditional mean return across possible training samples. It is not the same as the uncertainty of an individual future return conditional on the data.

There is also a separate posterior predictive decomposition. In an i.i.d. conditional model,

$$
\Sigma_n=E[\Sigma\mid R_n]+\operatorname{Cov}(\mu\mid R_n).
$$

Thus using $E[\Sigma\mid R_n]$ alone misses uncertainty about the mean even at fixed observed data; using the full $\Sigma_n$ but optimizing separately at each data realization does not in general solve the paper's ex ante objective. Keeping these two distinctions separate is essential for interpreting the method.

## 3. The scalar transformation and its proof

The difficulty is the squared expectation in

$$
J(w)=E[W]-\lambda E[W^2]+\lambda(E[W])^2.
$$

Unlike expected utility, this is not simply an expectation of a fixed reward that can be optimized independently conditional on every training sample.

Suppose an optimum $w_B$ exists, and let $m_B=E[W_B]$ and $\eta_B=1+2\lambda m_B$. For any competing $W$, write $m=E[W]$, $q=E[W^2]$. Direct algebra gives

$$
J(w)-J(w_B)
=\eta_B(m-m_B)-\lambda(q-q_B)+\lambda(m-m_B)^2.
$$

Since the left side is nonpositive at the optimum, $w_B$ minimizes

$$
\lambda E[W^2]-\eta_BE[W].
$$

The unknown $\eta_B$ is handled by defining a family

$$
w(\eta)\in\arg\min_w\{\lambda E[(w^\top r_{n+1})^2]
-\eta E[w^\top r_{n+1}]\}
$$

and selecting the member that maximizes the **original** objective $J(w(\eta))$. Conditional expectation now works because the transformed reward is linear in first and second moments.

The proof establishes that an attained global optimum belongs to the family. It does not imply that any stationary fixed point of $\eta=1+2\lambda E[W(\eta)]$ is automatically a global optimum. A numerical search must still evaluate the original criterion and handle boundaries, constraints, and possible nonattainment.

## 4. The inner quadratic program

For each fixed $\eta$, the pointwise posterior problem is

$$
\min_w\;\lambda w^\top V_nw-\eta w^\top\mu_n
\quad\text{subject to}\quad \mathbf1^\top w=1,\quad w\ge0.
$$

Because $V_n$ is a raw second-moment matrix, it is positive semidefinite. This yields a convex quadratic program; positive definiteness on feasible directions gives strict convexity and uniqueness. Lower bounds $w\ge w_0$ allow limited shorts, and other linear exposure bounds can be incorporated. One must distinguish convex quadratic constraints from arbitrary quadratic constraints, which need not preserve convexity.

Using $\Sigma_n$ in place of $V_n$ would solve a different transformed problem. The $\mu_n\mu_n^\top$ contribution is required by $E[W^2]$, even though variance is ultimately what the outer criterion penalizes.

Without short-sale limits and with invertible $V_n$, define

$$
A_n=\mu_n^\top V_n^{-1}\mathbf1,\qquad
B_n=\mu_n^\top V_n^{-1}\mu_n,\qquad
C_n=\mathbf1^\top V_n^{-1}\mathbf1.
$$

The Lagrange multiplier calculation gives

$$
w(\eta)=\frac{V_n^{-1}\mathbf1}{C_n}
+\frac{\eta}{2\lambda}V_n^{-1}
\left(\mu_n-\frac{A_n}{C_n}\mathbf1\right).
$$

The second vector sums to zero, so the budget constraint holds for every $\eta$. This is a two-direction representation, but the directions themselves depend on the training data. Numerically, solve linear systems rather than explicitly invert $V_n$.

## 5. Outer optimization and a useful algebra check

The criterion used to choose $\eta$ is

$$
C(\eta)=E[w(\eta)^\top\mu_n]
+\lambda\{E[w(\eta)^\top\mu_n]\}^2
-\lambda E[w(\eta)^\top V_nw(\eta)].
$$

The source proposes Brent's scalar search. With bounded feasible weights and finite second moments the economic objective is bounded, although the selected weights can change active constraints as $\eta$ changes. A search should bracket the relevant region and compare endpoints or limiting active sets where appropriate.

There is a printed-algebra issue worth isolating. In the unconstrained closed form, let

$$
a_n=A_n/C_n,\qquad d_n=B_n-A_n^2/C_n,\qquad
k=\eta/(2\lambda).
$$

The two relevant conditional moments simplify to

$$
w^\top\mu_n=a_n+kd_n,\qquad
w^\top V_nw=C_n^{-1}+k^2d_n.
$$

Consequently, writing $a=E[a_n]$, $d=E[d_n]$, and $c=E[C_n^{-1}]$, the stated criterion (3.8) gives

$$
C(\eta)=a+\lambda a^2-\lambda c
+\eta d\left(\frac1{2\lambda}+a\right)
+\frac{\eta^2}{4\lambda}(d^2-d).
$$

The expansion printed after equation (3.8) instead places some expectations inside products or squares differently. Those operations are not interchangeable for random training data. The expression above is an explanatory derivation from (3.8); implementations should evaluate (3.8) directly or use an independently checked expansion, rather than import the printed polynomial uncritically. In regular predictive-moment settings with $0<d<1$, this checked quadratic is concave. Degenerate cases, missing moments, and unrestricted directions still require an existence check.

## 6. Bayesian and empirical Bayes moment models

The conjugate illustration uses

$$
\mu\mid\Sigma\sim N(\nu,\Sigma/\kappa),\qquad
\Sigma\sim IW_m(\Psi,n_0).
$$

The posterior mean of $\mu$ is a weighted average of the prior mean and sample mean, with weights $\kappa/(n+\kappa)$ and $n/(n+\kappa)$. The posterior covariance estimate combines prior scale, sample dispersion, and a between-prior-and-sample mean term. Posterior prediction then also includes residual uncertainty about $\mu$.

Hyperparameters may be estimated from the training data, possibly using a factor structure. This is empirical Bayes, not a fully specified subjective prior. The optimization requires only predictive first and second moments; that computational economy does not make the choice or estimation of those moments irrelevant. A factor model or shrinkage target can therefore complement the stochastic optimization method.

The nonparametric empirical Bayes variant, **NPEB**, uses the empirical distribution of the observed return vectors as the working sampling distribution. Its raw moment estimates are

$$
\widehat\mu_n=\frac1n\sum_t r_t,\qquad
\widehat V_n=\frac1n\sum_t r_tr_t^\top.
$$

This is not merely the ordinary sample-covariance Markowitz portfolio: the rule comes from the transformed objective and $\eta$ is selected to account for variation of the estimated rule across samples.

## 7. What the bootstrap must estimate

For fixed population $(\mu,\Sigma)$ and an estimated rule $w_n$, frequentist evaluation uses

$$
E_{\mu,\Sigma}[w_n^\top r_{n+1}]=E[w_n^\top\mu],
$$

$$
\operatorname{Var}_{\mu,\Sigma}(w_n^\top r_{n+1})
=E[w_n^\top\Sigma w_n]+\operatorname{Var}(w_n^\top\mu).
$$

Bootstrap samples mimic the randomness in the training data. For each candidate scalar, refit the rule on each resample, then aggregate its return moments under the working data-generating distribution. The second expression requires both average conditional risk and variation in conditional mean. Holding the fitted weights fixed for all resamples would omit the principal estimation-risk effect.

This differs from Michaud-style resampling, which averages optimized weight vectors across resamples and then evaluates that average portfolio. NPEB uses resampling to evaluate and select an allocation rule. Averaging decisions and optimizing their sampling-distribution performance are distinct operations.

For dependent or conditionally heteroskedastic data, naive independent resampling of raw observations can be inappropriate. The paper instead models conditional means and volatilities, then resamples whole cross-sectional innovation vectors after checking their approximate time independence. Resampling each asset independently would destroy the covariance information needed for portfolio risk.

## 8. Simulation design and measured results

The first simulation has four assets, six annual observations in the training sample, no short selling, and normal/inverse-Wishart prior parameters stated in the paper. It studies both integrated Bayesian reward and frequentist reward at three parameter draws from that prior. Every reported result is based on 500 simulations. Comparators are the known-parameter oracle, the Bayes rule, sample plug-in optimization, and NPEB. If a sample covariance causes numerical trouble, the plug-in implementation adds $0.005I$.

For the Bayesian scenario, Table 1 reports:

| Risk penalty | Oracle reward | Bayes reward | NPEB reward | Plug-in reward |
|---:|---:|---:|---:|---:|
| 1 | 0.0328 | 0.0324 | 0.0324 | 0.0317 |
| 5 | 0.0267 | 0.0262 | 0.0262 | 0.0189 |
| 10 | 0.0190 | 0.0184 | 0.0183 | 0.0067 |

These are mean-minus-variance rewards under the specified simulation, not Sharpe ratios. The gap grows with the risk penalty in this experiment. At the three fixed parameter values, NPEB also generally tracks the Bayesian rule closely and loses considerably less reward than the plug-in method.

A second experiment adds two assets with low information ratios and negative correlations, with six assets and eight training observations. It finds little aggregate benefit from the additions in this calibration. The authors use this to motivate screening inferior assets when shorts are disallowed. It does **not** prove that low-return or low-ratio assets should always be discarded: hedge value depends on the full covariance structure and the investor's constraints.

Figure 1 evaluates “actual” frontiers from repeated training samples against known simulation truth. NPEB lies relatively close to the oracle, with resampled, covariance-shrinkage, and plug-in portfolios farther away in the displayed calibration. Target-return methods need a fallback when their estimated target is infeasible; the penalized NPEB problem stays well-defined on the long-only simplex.

## 9. Information-ratio tuning changes the decision criterion

The paper proposes selecting $\lambda$ by a bootstrap estimate of

$$
IR(\lambda)=\frac{E[w_\lambda^\top r-r_0]}
{\sqrt{\operatorname{Var}(w_\lambda^\top r-r_0)}}.
$$

If the benchmark is risky, the denominator is tracking-error volatility, including covariance with the benchmark. If it is risk-free, the familiar Sharpe interpretation applies. The $\eta$ search optimizes mean–variance performance for a given $\lambda$; an outer grid over $\lambda$ then selects the estimated best information ratio.

This makes $\lambda$ a tuned strategy parameter rather than a fixed investor preference. It also introduces another layer of selection uncertainty. An implementation should keep all such selection inside the training window and evaluate the chosen policy on future observations, rather than quote the highest in-sample bootstrap ratio as an achieved investment result.

## 10. Time-series extensions

A flexible conditional mean model is

$$
r_{i,t}=\beta_i^\top x_{i,t-1}+\epsilon_{i,t},\qquad
\epsilon_{i,t}=s_{i,t-1}(\gamma_i)z_{i,t}.
$$

Predictors can include lagged returns, lagged market information, and economically motivated variables. Conditional volatility may follow a GARCH recursion. The individual mean and volatility models reduce parameter burden, while the covariance of the vector $z_t$ retains cross-asset dependence.

The fitted predictive raw second moment has the form

$$
\widehat V_n=\widehat\mu_n\widehat\mu_n^\top
+\operatorname{diag}(\widehat s_n)\widehat\Sigma_z
\operatorname{diag}(\widehat s_n).
$$

The raw return bootstrap is replaced with resampling of fitted innovation vectors. This is a forecast model, not a guarantee that residuals are independent or stationary. Residual autocorrelation, volatility misspecification, cross-sectional covariance estimation, and parameter-estimation uncertainty remain empirical questions. The mathematical reduction survives if appropriate predictive moments can be supplied.

## 11. Empirical design: universe, timing, and benchmarks

The empirical study uses CRSP monthly data from January 1985 through December 2009. Each month from January 1995 through December 2009, it selects the 50 largest-cap stocks among those with complete prices over the preceding 120 months. The strategy uses that rolling ten-year window to construct the next month's portfolio, giving 180 test months.

The complete-history requirement selects seasoned firms and changes the universe; the paper does not test an unconstrained all-stock universe. Eligibility is described using preceding observations rather than knowledge of future survival. The study deliberately uses past return data without company-specific fundamental analysis or subjective priors.

Two benchmark settings are considered. First, the benchmark is the capitalization-weighted portfolio of those same 50 stocks. Active weights $\widetilde w=w-w_B$ sum to zero, with constraints $0\le w_i\le0.1$. Second, the S&P 500 is the benchmark, and each asset's return is modeled relative to it. In the latter experiment individual weights may be as low as −5%, so it is not a long-only comparison.

The plotted cumulative excess return is the **sum** $\sum_t e_t$, not compounded terminal wealth. The reported annual information ratio is $\sqrt{12}\bar e/s_e$; serial dependence can affect the interpretation of this square-root annualization.

## 12. Results and qualifications of the historical comparison

In the active long-only experiment, plug-in and shrinkage target problems are feasible in only 80–92 of 180 months for annual target excess returns of 1–3%. The baseline fallback holds the value-weighted benchmark when the target problem is infeasible. This leads to small realized active returns and risks, and information ratios can obscure the small dollar-scale benefit.

For example, at target excess return 1.5%, Table 3(a) reports annualized excess means and volatilities of approximately:

| Method | Mean excess return | Excess volatility |
|---|---:|---:|
| Plug-in | 0.2% | 0.73% |
| Covariance shrinkage | 0.4% | 0.66% |
| Resampled | 0.1% | 0.38% |
| NPEB, matched $\lambda=2$ | 4.6% | 13% |

NPEB therefore takes much more active risk in this comparison. Its higher mean should not be described as a like-for-like improvement at identical tracking error. The paper also reports an alternative fallback based on the ten highest historical means; that fallback performs poorly, with annualized excess means around −16% to −17%.

Table 3(b) restricts evaluation to months where the target-constrained comparators are feasible and reports very high NPEB information ratios, around 3.0–4.0. This is a selected subset of test months, not the full chronological investment experience. One printed final NPEB volatility in that table appears inconsistent with the accompanying stated ratio range; these exceptional numbers should be checked against the original implementation before being reused.

For S&P-relative forecasting, the study compares an AR(1) excess-return model with a stochastic regression using lagged stock excess returns and lagged S&P return plus GARCH volatility. It tunes $\lambda$ over $\{2^j:j=-3,\ldots,6\}$ in the training sample. The reported information ratios are 0.370 for NPEB-AR and 1.169 for NPEB-SRG. At target mean 1.5%, comparator ratios are 0.527 for plug-in, 0.352 for covariance shrinkage, and 0.618 for resampling. Thus the simpler NPEB-AR variant does not beat every comparator on this measure.

Table 4 also prints unusually large average excess returns for the NPEB variants, including 0.915 for SRG. The source presents these as realized summary statistics, not a guaranteed return, and its cumulative chart is additive. Their scale, leverage, return construction, and reproduction deserve scrutiny rather than conversion into an unqualified claim of attainable investment performance. The provided paper does not establish performance after realistic financing, shorting, and transaction costs.

The comparison of SHW raw and excess returns gives Ljung–Box $p$-values of 0.001 and 0.267. Failure to reject autocorrelation after benchmark subtraction is evidence about that diagnostic; it does not establish independent identically distributed innovations or absence of all forms of nonstationarity.

## 13. Reproduction and boundaries of the contribution

A faithful implementation must represent the policy as a function of training data, specify the outer probability law, preserve the distinction between raw second moment and covariance, and re-estimate weights inside each bootstrap replicate. It should verify budget and box constraints, positive semidefiniteness, solver residuals, scalar-search stability, and the sensitivity of tuning results to bootstrap noise. Costs, borrowing, and short availability should be applied to actual trades and positions if net investment performance is the objective.

The method is single-period decision-rule optimization repeated through time; a time-series predictor does not by itself make it a dynamic multiperiod utility problem. It does not provide no-trade regions, optimal execution, tax management, or distributionally robust protection against an omitted crisis regime. Factor modeling, regularization, or priors remain necessary when predictive moments are hard to estimate.

The strongest theoretical contribution is the separation of two tasks: **construct a conditional action by a convex quadratic program**, then **evaluate and select the entire estimated rule under the appropriate ex ante risk criterion**. The simulation and historical studies illustrate that distinction, while their assumptions, feasibility fallbacks, and reported numerical anomalies limit claims of general empirical dominance.
