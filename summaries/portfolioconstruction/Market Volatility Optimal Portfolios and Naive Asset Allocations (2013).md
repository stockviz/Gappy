# Market Volatility Optimal Portfolios and Naive Asset Allocations (2013)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioOptimization_CaporinPelizzon_2013.pdf>), 18 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Market Volatility, Optimal Portfolios and Naive Asset Allocations
- **Author(s):** Massimiliano Caporin, Loriana Pelizzon
- **Year:** 2013
- **Journal/Venue:** Chapter in *Rethinking Valuation and Pricing Models*

# 2. Problem statement

The chapter asks when mean-variance portfolio strategies can beat the naive $1/N$ rule out of sample. The precise issue is whether better forecasts of expected returns—using predictability variables or mean reversion—can overcome estimation error strongly enough for optimized portfolios to dominate naive equal weights in Sharpe ratio terms.

# 3. Approach (short)

The method is rolling-window out-of-sample comparison of several mean-variance strategies against $1/N$. Caporin and Pelizzon estimate means using either historical averages, predictive regressions, or VAR(1) mean reversion, combine those with covariance estimates, construct long-only mean-variance portfolios and several constrained or unrestricted global-minimum-variance portfolios, and evaluate performance with the Ledoit-Wolf robust Sharpe-ratio test.

# 4. Approach (detailed)

1. **Portfolio strategies compared**

   The paper considers:
   - naive equal weighting $1/N$,
   - mean-variance optimal portfolios,
   - constrained/global minimum variance variants.

   The point is not to invent a new optimizer, but to isolate when optimized weights contain useful information beyond naive diversification.

2. **Forecasting models for means**

   Three mean models are emphasized:
   - **historical moments**;
   - **predictability model**, using variables such as dividend yield, short rate, term spread, and credit spread;
   - **VAR(1) mean reversion**, allowing portfolio returns or characteristics to revert.

   The authors’ main claim is that mean reversion matters more than generic predictability variables for out-of-sample gains.

3. **Performance criterion**

   For each strategy, the out-of-sample Sharpe ratio is computed and compared to the Sharpe ratio of $1/N$ using the robust Ledoit-Wolf test. Thus the null is not “equal mean return” but “equal Sharpe ratio,” which is the relevant risk-adjusted criterion.

4. **Rolling-window design**

   The analysis is repeated across rolling windows (e.g. 60- and 120-month estimation windows). This matters because the predictability and mean-reversion signal is highly time-varying. A full-sample comparison can mask the fact that some subperiods strongly favor optimization while others do not.

5. **Main empirical finding**

   Mean-variance strategies can outperform $1/N$, but mostly in periods and datasets where mean reversion is strong enough to imply portfolio weights materially different from equal weights. Predictive regressors often add too many noisy parameters and can worsen estimation error. Therefore:
   - mean reversion helps;
   - generic predictability often does not help enough;
   - crisis periods tend to favor $1/N$ or statistical equivalence because estimation error spikes.

6. **Interpretation**

   The chapter argues that what matters is not the in-sample $R^2$ for individual assets per se, but whether the forecasting model generates weights sufficiently different from $1/N$ to matter economically. If the optimal weights are close to equal weights, the optimizer cannot beat the naive benchmark enough to clear the Sharpe-ratio test.

7. **What is exact**

   There is no theorem in the mathematical sense. The exact objects are the mean-variance optimization problem and the Ledoit-Wolf hypothesis test. The substantive claims are empirical.

# 5. Domain of applicability

- The chapter applies to static asset-allocation problems where estimation error in means is the central concern.
- Its results are benchmarked specifically against the $1/N$ puzzle literature and should be read in that context.
- The claim that mean reversion dominates predictability is data- and sample-dependent.
- The contribution is practical: it identifies when optimization is likely worth doing and when it is not.
- The genuine novelty is the conditional answer: portfolio performance depends on the forecasting model, asset universe, estimation window, and market conditions; economically meaningful forecast differences are a diagnostic rather than a proved necessary-and-sufficient condition for outperformance.


## 6. Exact allocation problem and admissible portfolios

This is chapter 25 of *Rethinking Valuation and Pricing Models*, pp. 411–428. The source's mean–variance strategies are **long-only**, not unconstrained long–short allocations. Its unrestricted case belongs to the global-minimum-variance group. That distinction materially limits how its results should be transferred to active long–short portfolios.

The inputs are forecasts of monthly **log returns**. If $\mu$ and $\Sigma$ denote their conditional mean and covariance, the chapter uses the approximation

$$
\widetilde\mu_p=w^\top\mu+
\frac12 w^\top\bigl(\operatorname{diag}(\Sigma)-\Sigma w\bigr),
\qquad \sigma_p^2=w^\top\Sigma w.
$$

The extra term reflects the difference between the weighted average of constituent log returns and portfolio log return. Omitting it changes the optimization. The objective with risk-aversion parameter $RA$ is

$$
\max_{w\ge0,\;\mathbf1^\top w=1}
\left\{\widetilde\mu_p-\frac{RA}{2}\sigma_p^2\right\},
$$

which can be rearranged as

$$
\max_w\ w^\top\left[\mu+\frac12\operatorname{diag}(\Sigma)\right]
-\frac{RA+1}{2}w^\top\Sigma w.
$$

This rearrangement is exact for the chapter's approximating objective; the log-return aggregation itself is an approximation. It clarifies that replacing the problem by the usual simple-return mean–variance formula while keeping the same $RA$ is not innocuous.

The eight risk-aversion values are $1,2,3,5,8,15,20,50$. The remaining strategies are an unrestricted global-minimum-variance portfolio, a long-only minimum-variance portfolio (GMVB), a version with an additional 50% position cap (GMVB50), a version with a 33% cap (GMVB33), and equal weighting. There are therefore thirteen allocation rules in the comparison. A minimum-variance rule removes the direct use of the mean forecast from the optimization, but it need not be independent of the forecasting model because covariance is estimated from that model's residuals.

## 7. Forecasting and the source of model risk

The historical-moments model estimates returns from the estimation window without predictive covariates. Predictive regressions use dividend yield, the short rate, the term spread, and the credit spread, either individually or in combinations. A first-order vector autoregression models dependence on lagged portfolio returns; the augmented specification adds predictors to that dynamic system.

A VAR can translate return dynamics into conditional mean differences that affect weights. Adding macro-financial regressors can improve fitted explanatory power while also increasing the number of coefficients to estimate. The relevant object is the realized utility or Sharpe ratio of the resulting portfolio, not the forecasting regression's in-sample fit alone. The chapter's weak predictability results illustrate this distinction rather than establishing a general theorem that predictors are useless.

Estimated covariances depend on model residuals. Comparing two minimum-variance portfolios formed under different mean models therefore changes more than the mean forecast that the optimizer ignores. The residual covariance matrix can change too. An attribution of performance solely to expected-return prediction needs to hold the covariance estimator fixed, which is not the same experiment as every model comparison in this chapter.

## 8. Data, rolling estimation, and performance evaluation

The monthly sample runs from April 1953 through December 2010, comprising 693 observations. The principal universes are five industry portfolios and six portfolios formed from size crossed with book-to-market, short-term reversal, momentum, or long-term reversal. The underlying sorting signals use prior returns over different windows: prior month for short reversal, months 2–12 for momentum, and months 13–60 for long reversal. Robustness exercises expand the universes to ten industries and 25 sorted portfolios.

The main estimation window is 60 months; a 120-month window is also examined. Rolling estimation produces 633 and 573 out-of-sample months respectively. At each decision date the forecasts and portfolio weights are re-estimated from the specified historical window. This is materially different from estimating the model once on the full sample and reporting fitted portfolio performance.

The chapter then evaluates Sharpe ratios both over the full out-of-sample interval and over rolling performance windows of 60 or 120 months. These evaluation windows are distinct from the windows used to estimate portfolio inputs. A five-year estimation history and a five-year performance comparison have different roles, even when their lengths coincide.

Statistical comparison uses the Ledoit–Wolf robust Sharpe-ratio procedure, with 1,000 bootstrap replications and a six-month block length. Blocks accommodate temporal dependence that an independent-observation bootstrap would ignore. The source reports directional preference conventions: low reported probability values favor the optimized strategy and high values favor equal weighting. Its thresholds below 10% and above 90% should not be described as two separate rejections of a conventional two-sided null with ordinary p-values. The meaning follows the direction used in the chapter's comparison.

Rolling windows overlap heavily. Frequencies of favorable windows describe how often the test favors a strategy within that dependent sequence; they are not counts of independent successful experiments. Repeated inspection across models, universes, risk-aversion values, and windows also means a few isolated significant results should not be treated as decisive evidence without considering the breadth of the comparison.

## 9. Findings with their actual qualifications

The industry universe provides comparatively little evidence that optimized allocations reliably dominate $1/N$. In several size-based sorted universes, mean–variance portfolios fare better, particularly when return dynamics are modeled with a VAR. The distinction is empirical and depends on both the asset universe and the estimation/evaluation design. It does not support a universal statement that all optimized portfolios beat equal weighting when their weights differ.

The fraction of comparisons favoring mean–variance rules can change substantially by model. In one 60-month-window tabulation for size–book-to-market portfolios, the preference frequencies are approximately 10.98% for sample moments, 13.76% for predictive regressions, and 35.89% for mean-reversion specifications. For the momentum universe, the corresponding figures are 19.86%, 16.90%, and 31.36%. With a 120-month window, the reported momentum mean-reversion frequency rises to 61.87%. These are table-specific percentages of comparisons; they are not annual return percentages or universal probabilities of outperformance.

Reported explanatory power is modest. For example, the relevant fitted $R^2$ ranges include roughly 3.50–5.93% for book-to-market portfolios and 2.52–6.31% for industries. Yet a low return-forecasting $R^2$ can coexist with a useful allocation signal, while a statistically visible predictor can fail to improve portfolio performance. Covariance, constraints, parameter uncertainty, and the direction of predicted mean differences mediate the connection.

The augmented VAR does not uniformly improve on the simpler VAR. More conditioning information carries an estimation cost. Similarly, the more heavily constrained minimum-variance portfolios can resemble equal weighting closely; failure to distinguish their Sharpe ratios is unsurprising when their realized exposures are similar. The paper provides an empirical account of these tradeoffs rather than a ranking guaranteed to hold in future data.

## 10. Volatility regimes and economic interpretation

To study market conditions, the authors estimate a two-state Markov-switching model for the market factor over January 1960–December 2010. High-volatility periods identify crisis-like episodes, including the late-sample interval beginning in November 2007. This is a statistical regime classification. Unless one explicitly uses probabilities filtered only from information available at each date, a retrospective classification is not automatically an implementable trading signal.

During crisis periods the comparisons frequently yield no significant difference between strategies, or favor equal weights in particular cases. A lack of significance can reflect noisy realized returns and reduced effective information as well as similar true performance. It is therefore too strong to infer that crises make optimization intrinsically useless or that the strategies have identical population Sharpe ratios.

One diagnostic is whether the expected returns implied by equal weighting resemble the forecasts that drive the optimizer. For the chapter's interior long-only solution, the first-order conditions imply, up to a common budget multiplier,

$$
\mu+\frac12\operatorname{diag}(\Sigma)
=(RA+1)\Sigma w+c\mathbf1.
$$

At $w=\mathbf1/N$, this describes the forecast configuration under which equal weights satisfy the interior conditions. Bounds require the corresponding inequality conditions. This calculation helps explain why a forecast model may or may not produce a materially different allocation; it is not a demonstrated profitable rule for switching between optimization and $1/N$.

For practice, the chapter supports evaluating forecasting and portfolio construction together, checking several realistic sample lengths, and reporting conditional as well as pooled performance. Its results should not be presented as transaction-cost-adjusted evidence for a high-turnover live strategy. The paper's portfolio universes, historical period, estimated regimes, and Sharpe-based criterion delimit the conclusion.
