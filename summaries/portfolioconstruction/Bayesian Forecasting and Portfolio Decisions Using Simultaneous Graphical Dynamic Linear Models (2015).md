# Bayesian Forecasting and Portfolio Decisions Using Simultaneous Graphical Dynamic Linear Models (2015)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioChoiceGraphicalModels_GruberWest_2015.pdf>), 17 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Bayesian Forecasting and Portfolio Decisions Using Simultaneous Graphical Dynamic Linear Models
- **Author(s):** Lutz F. Gruber, Mike West
- **Year:** 2015
- **Journal/Venue:** Working paper / Bayesian time-series paper

# 2. Problem statement

The paper asks whether a **simultaneous graphical dynamic linear model (SGDLM)** can deliver better high-dimensional return, volatility, and covariance forecasts for portfolio choice than the traditional Wishart DLM (WDLM), and how those forecast improvements feed into sequential mean-variance and benchmark-neutral portfolio decisions.

# 3. Approach (short)

The method is Bayesian state-space modeling with dynamic graphical sparsity. Each series is modeled as a univariate DLM with its own predictors and a small set of contemporaneous “parent” series; these are recoupled into a sparse multivariate system using variational Bayes and importance sampling. One-step-ahead forecast moments $(p_t,P_t)$ are then fed into standard quadratic portfolio problems such as minimum-variance, target-return, and benchmark-neutral optimization.

# 4. Approach (detailed)

1. **WDLM benchmark**

   The traditional multivariate dynamic linear model uses state evolution with an inverse-Wishart volatility model. In the notation of the paper, the one-step forecast is
   $$
   y_t\mid D_{t-1}\sim T_{r_t}(f_t,Q_t),
   $$
   with state and covariance updated sequentially. The WDLM is statistically coherent but computationally demanding and dense in high dimension.

2. **SGDLM structure**

   For each series $j$, the model is a univariate DLM:
   $$
   y_{j,t}=F_{j,t}^\top \theta_{j,t}+\nu_{j,t},
   $$
   where $F_{j,t}$ includes:

   - external predictors;
   - contemporaneous values of a small parental set of other series.

   The simultaneous parental structure induces a sparse precision representation. Each series evolves with standard DLM state/precision dynamics, so filtering is cheap in decoupled form.

3. **Recoupling and forecasting**

   Because the parental specification links the series contemporaneously, the decoupled analysis must be recoupled to obtain a joint forecast for $y_t$. The paper uses variational Bayes plus importance sampling to recover the joint one-step forecast moments
   $$
   p_t=E(y_t\mid D_{t-1}),\qquad
   P_t=\operatorname{Var}(y_t\mid D_{t-1}).
   $$
   These moments are the only inputs needed for the portfolio decision rules.

4. **Bayesian Hotspot for graph selection**

   The parental sets are selected using what the paper calls the **Bayesian Hotspot**. A WDLM run on training data produces time-varying precision information. The strongest precision links define candidate parents, and only a small number are retained for each series. This yields a sparse dynamic graphical structure that is:

   - data-informed;
   - allowed to change over time;
   - computationally feasible for $m\approx 400$ series.

5. **Portfolio decision rules**

   Once $(p_t,P_t)$ are available, the paper uses standard quadratic portfolio rules.

   **Minimum variance portfolio**
   $$
   \min_{w_t} \; w_t^\top P_t w_t
   \quad\text{s.t.}\quad
   \mathbf 1^\top w_t=1.
   $$

   **Target-return mean-variance portfolio**
   $$
   \min_{w_t} \; w_t^\top P_t w_t
   \quad\text{s.t.}\quad
   \mathbf 1^\top w_t=1,\qquad
   w_t^\top p_t=\tau_t.
   $$

   **Benchmark-neutral portfolio**

   Taking series $1$ as the benchmark, the paper adds
   $$
   w_{1,t}=0,\qquad
   w_t^\top P_{\cdot 1,t}=0,
   $$
   where $P_{\cdot 1,t}$ is the first column of $P_t$. The second constraint enforces zero expected covariance with the benchmark.

6. **What is novel mathematically**

   The portfolio optimization itself is standard Markowitz. The novelty is upstream:

   - the sparse simultaneous graphical DLM;
   - the recoupling of decoupled univariate DLMs into a coherent multivariate forecast distribution;
   - dynamic graph selection through the Bayesian Hotspot.

   In short, the paper is not a new portfolio theorem. It is a new forecasting system whose outputs are used in familiar portfolio rules.

7. **Why forecast quality matters more for portfolios than for MSE**

   A subtle but important theme of the paper is that portfolio performance depends far more on the quality of volatility and covariance forecasts than on point forecast MSE alone. The SGDLM’s main advantage over the WDLM is not necessarily lower mean-squared forecast error for returns; it is better characterization of:

   - volatility;
   - co-volatility;
   - adaptivity during regime change.

   Those improvements matter directly in $w_t^\top P_t w_t$.

8. **Proof status**

   The paper does not offer a theorem that SGDLM dominates WDLM in portfolio utility. The contribution is a constructive modeling framework and a case study. The conditional model and local conjugate updates are explicit; joint filtering uses Monte Carlo recoupling and variational approximation, while the portfolio results are empirical.

**Additional mathematical details**

The portfolio layer is fully explicit once the joint predictive moments are available. For example, the minimum-variance problem has the closed-form solution
$$
w_t^{MV}=\frac{P_t^{-1}\mathbf 1}{\mathbf 1^\top P_t^{-1}\mathbf 1},
$$
and the target-return problem is the usual two-fund solution built from $P_t^{-1}\mathbf 1$ and $P_t^{-1}p_t$. So all of the paper’s incremental value lives in improving $p_t$ and especially $P_t$, not in altering Markowitz algebra downstream.

On the modeling side, the key recoupling fact is that the univariate DLMs are conditionally independent only before the simultaneous-parent links are imposed. The SGDLM reconstructs a sparse joint precision matrix from those links, then uses variational Bayes and importance sampling to recover a coherent forecast covariance. The benchmark-neutral constraint is therefore only as good as the recoupled $P_t$: the paper is really a forecast-covariance paper wearing a portfolio-choice wrapper.

# 5. Domain of applicability

- The method applies to **high-dimensional, sequential portfolio problems** where one-step-ahead forecasts are updated frequently.
- It is most useful when cross-series dependence is sparse or approximately sparse.
- The decision layer remains mean-variance and therefore inherits all usual caveats about quadratic utility and estimation error.
- The superiority claim is empirical and case-study based; the proofs support the forecasting machinery, not universal portfolio dominance.


## 6. Source identification and case-study scope

The first author is **Lutz F. Gruber**, not Lars F. Gruber. The local manuscript is dated March 2015. Although its abstract refers to 2007–2014, the detailed data description and results specify training over 2002–2006 and testing from the start of 2007 through **Q3 2013**. The substantive sample description should take precedence over the broader introductory shorthand.

The system contains 401 return series: 400 S&P 500 constituent stocks continuously listed since 2002 plus the S&P 500 index, SPX. VIX and the ten-year Treasury yield, TNX, provide external predictors. Selecting continuously listed stocks makes the universe different from a contemporaneously reconstituted investable S&P 500 universe; the results should be interpreted with that selection condition in mind.

The forecasts concern daily log returns. The portfolio layer uses weighted log-return means and covariances in a mean–variance approximation. A weighted sum of constituent log returns is not generally the exact log return of a discretely rebalanced portfolio, so the displayed quadratic decision criterion is not an exact expected-log-wealth optimizer.

## 7. Simultaneous equations and the determinant correction

Write the univariate equations as

$$
y_{jt}=\mu_{jt}+\sum_{h\in sp(j)}\gamma_{jh,t}y_{ht}+\nu_{jt},
\qquad \nu_{jt}\sim N(0,\lambda_{jt}^{-1}).
$$

With $\Gamma_t$ collecting the parental coefficients and $\Lambda_t=\operatorname{diag}(\lambda_{jt})$, the joint conditional distribution is

$$
y_t=(I-\Gamma_t)^{-1}(\mu_t+\nu_t),
$$

$$
E[y_t\mid\text{states}]=(I-\Gamma_t)^{-1}\mu_t,
\quad
\Omega_t=(I-\Gamma_t)^\top\Lambda_t(I-\Gamma_t).
$$

The inverse requires nonsingularity of $I-\Gamma_t$. The precision matrix is built from a sparse simultaneous coefficient system; its nonzero pattern need not equal the directed parent pattern one-for-one because multiplication introduces shared-parent terms. The graph is a dependence representation, not evidence that one stock causally drives another.

Conditioning on observed contemporaneous parent values permits cheap univariate normal/gamma updates. However, the full likelihood includes the Jacobian $|I-\Gamma_t|$. The joint posterior is proportional to that determinant times the product of the analytically updated univariate normal/gamma factors. Ignoring it would treat a simultaneous system as independent regressions and generally change the posterior.

The implementation samples the product-form updates and reweights draws by the determinant. It then approximates the recoupled joint posterior by a product of normal/gamma forms for parallel evolution to the next date. This alternation is central: local conjugate updates are analytic; recoupling is Monte Carlo; the factorized propagation is a variational approximation. Describing the entire filter as exact closed-form Bayes would be too strong.

For forecasting, draws of model parameters generate conditional mean vectors and covariance matrices or complete predictive observations. The predictive covariance includes both conditional return risk and uncertainty about the conditional means:

$$
\operatorname{Var}(y_t\mid D_{t-1})
=E[\Sigma_t\mid D_{t-1}]
+\operatorname{Var}((I-\Gamma_t)^{-1}\mu_t\mid D_{t-1}).
$$

This law-of-total-variance identity explains why substituting only a posterior mean residual covariance is not equivalent to the full predictive risk input. Importance-weight concentration and Monte Carlo error can matter particularly when an optimizer uses inverse covariance directions.

## 8. Evolution, graph selection, and actual tuning

Discount factors inflate uncertainty between observations, allowing parameters to move rather than remaining constant. The SGDLM uses separate discounting for residual precisions, external-predictor coefficients, and contemporaneous parental coefficients. In the reported selected models, the precision discount is 0.975, external-state discounts are 0.980 or 0.985, and parental-state discounting is 0.990. These are selected hyperparameters, not estimated structural constants of financial markets.

The Bayesian Hotspot uses a WDLM's simulated precision rows to rank absolute conditional associations. Each univariate series is assigned twenty parents. Graph changes occur **annually** in the case study, while coefficients and volatilities update daily. At the start of a year, the new parent set is selected using the prior informed by data through the preceding year-end. The previous year's data are then re-filtered under the new parent set to construct starting distributions. Thus the reported workflow is more specific than a generic claim that the entire graph is re-selected every day.

For Amazon, an average of 10.7 of the twenty parents change each year; Apple, eBay, Intel, and Microsoft are relatively persistent. Across the full stock universe the average is 11.7 replacements, rising to 13.0 during 2008–2010 versus 10.5 in 2011–2013. These numbers illustrate changing estimated dependence, not a structural causal network.

Five SGDLM specifications and four WDLM specifications are considered. Predictors range from a local level to lagged SPX returns and Treasury yields, changes in returns/yields/VIX, and smoothed momentum differences. The fifth SGDLM substitutes stock-specific momentum for the common market predictor, flexibility not available in the same standard WDLM form. Comparison of that model with a WDLM therefore changes both covariance architecture and predictor flexibility.

Training selects discount factors using forecast behavior and, where forecast differences are marginal, the risk-adjusted performance of one target-return portfolio. The evaluation is consequently decision informed even before the test period. That is sensible for the paper's purpose, but should be recorded when interpreting claims of superiority under a particular loss function.

## 9. The exact decision algebra and neutrality restriction

All equality-constrained minimum-variance rules can be written as

$$
\min_w w^\top P_t w\quad\text{subject to}\quad A_t^\top w=b_t.
$$

If $P_t$ is positive definite and the constraint columns are independent, the solution is

$$
w_t=P_t^{-1}A_t(A_t^\top P_t^{-1}A_t)^{-1}b_t.
$$

Budget and target-return columns are $\mathbf1$ and $p_t$. Benchmark neutrality adds the benchmark unit vector, enforcing zero direct holding, and the benchmark covariance column, enforcing $\operatorname{Cov}(w_t^\top y_t,y_{1t}\mid D_{t-1})=0$. This is zero **predicted covariance** conditional on the model. It is not a guarantee of zero realized correlation over the backtest.

The six rules use annual target values of 10%, 15%, or estimated benchmark mean plus 5%, converted to daily values by dividing by 252; each has a version with benchmark neutrality. The adaptive target is based on the modeled benchmark mean, not its future realized return. An expected-return inequality is equivalent to an equality only when the constraint binds; if the unconstrained minimum-variance portfolio already exceeds a lower target, forcing equality can change the solution. The source uses equality-style target rules in its comparisons.

Short selling is allowed. No gross-leverage, borrow-availability, or security-specific market-impact model is supplied in these basic rules. Their feasible sets are therefore broader than many institutional mandates. In practice the small matrix $A_t^\top P_t^{-1}A_t$ also needs conditioning checks: nearly redundant mean, benchmark, or budget constraints can magnify numerical and forecast errors.

## 10. What improves empirically

The WDLM actually has slightly lower aggregate point-forecast MSE in the reported comparisons. For the 2007–2013 test period, the aggregate MSE entries are around $0.63\times10^{-3}$ for WDLMs and $0.63$–$0.65\times10^{-3}$ for SGDLMs. Correlations of forecasts and realized stock returns vary across specifications, with the strongest SGDLM entries reaching about 7.2%. The argument for SGDLM therefore cannot be reduced to uniform superiority on every forecast statistic.

The authors report substantial improvements in volatility and co-volatility adaptation. WDLM volatility estimates tend to be high and slow to adjust; SGDLM estimates track the realized-volatility summaries more closely. The portfolio exercise shows that changes in multivariate risk forecasts can matter even when point-forecast MSE barely changes.

For the adaptive target rule, model SGDLM 4 has annualized mean about 11.76%, volatility 13.75%, and realized SPX correlation 38.92%. Adding neutrality produces about 13.36% mean, 14.45% volatility, and correlation 17.49%. Thus neutrality reduces realized correlation materially but does not make it zero. The corresponding ratios of mean to volatility are approximately 0.86 and 0.92; the table reports this ratio directly, so it should not automatically be relabeled a risk-free-rate-adjusted Sharpe ratio.

The source's wealth illustration takes $1,000 to about $2,300 using SGDLM 4 under the adaptive target, versus about $1,070 using WDLM 2. With neutrality, those figures become approximately $2,575 and $1,089. The passive S&P 500 comparison ends near $1,238. The article accounts for **20 basis points of traded volume** in its trading-cost assumption, assumes no bid–ask spread beyond that charge, allows short sales, and assumes trades execute at daily closing prices. These are modeled net results under a specific cost convention, not frictionless results and not a complete execution study.

Annual target misses remain common: several SGDLM strategies miss in three of seven labeled years, and some miss more often. An optimization constraint on forecast mean is not a promise that realized annual returns meet the target. The tables provide no universal dominance theorem or comprehensive sampling uncertainty for every strategy comparison.

## 11. Practical contribution and remaining limits

The reported GPU implementation processes a roughly 400-series iteration in less than ten seconds on a 2014-era GPU-enabled desktop with modest model dimensions. This is evidence of feasibility at the time, not a current hardware benchmark. The recurring computational work includes simulation, determinant calculation, predictive moment aggregation, filtering, and portfolio optimization; annual graph changes also require re-filtering.

A reproducible extension should preserve the information timing, specify how closing-price execution and costs are handled, report gross exposures and turnover, and assess forecasts under both statistical and portfolio losses. It should compare alternative risk estimators on a contemporaneously investable universe and assess the sensitivity to parent-set size and discount factors. These are implications of the source's design rather than experiments already performed in the manuscript.

The paper's contribution is a workable high-dimensional Bayesian forecasting and decision system with sparse simultaneous dependence and strong case-study results. Its utility variants matter, but the underlying constrained quadratic optimization remains standard. The empirical lesson is that forecast evaluation should reflect the eventual decision; the strongest claim supported here is conditional on this universe, period, tuning procedure, and cost/execution model.
