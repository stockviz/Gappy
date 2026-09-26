# Using Out-of-Sample Errors in Portfolio Optimization

**Pedro Barroso (April 2016 version; first version December 2015).** Preliminary working paper, SSRN abstract 2771664. [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioOptimization_Barroso.pdf>). This summary covers all 45 PDF pages, including seven tables, three figures, and the stated experimental design. The manuscript is a proposed empirical correction method, not a general proof of improved portfolio performance.

## 1. The idea: learn how historical inputs fail

Standard rolling portfolio optimization repeatedly estimates means and covariances from a historical window, chooses weights, observes subsequent performance, and starts again. Barroso asks whether the accumulated record of past input-estimation errors contains information that should change the next estimates.

The proposed **Galton correction** estimates a cross-sectional linear mapping from a historical input to its subsequently observed counterpart. Separate mappings are learned for means, variances, and correlations. Their intercepts and slopes are averaged using only error realizations that would already be observable at the current decision date. The resulting corrected moments are supplied to otherwise conventional global minimum-variance and mean–variance portfolio formulas.

The distinctive feature is calibration to *future realized moments* rather than an assumed fixed shrinkage target or a prior distribution over parameters. The correction is usually shrinkage-like in the sample, but is not constrained to have a slope between zero and one. In particular, the mean-return slope for individual stocks is negative. The method is therefore more general than merely multiplying historical means by a positive shrinkage coefficient.

The strongest reported benefit is risk calibration: the corrected covariance gives much more realistic forecasts of the realized risk of optimized portfolios. Return improvements also occur, especially for characteristic-sorted portfolios with more persistent expected-return differences.

## 2. Forecast labels, historical windows, and information timing

Let \(X_{H,t,j}\) be an input estimated from the preceding \(H\) monthly observations at date \(t\). Here \(j\) indexes an individual stock for means or variances, and a stock pair for correlations or covariances. Let \(X_{E,t,j}\) be the same statistic computed over the following \(E\) months.

For the individual-stock experiments,

\[
H=60,\qquad E=12.
\]

At each historical origin \(s\), estimate the cross-sectional regression

\[
X_{E,s,j}=g_{0,s}+g_{1,s}X_{H,s,j}+\epsilon_{s,j}.
\]

The label on the left is available only at \(s+E\). Therefore a decision at \(t\) can use regressions through origin \(t-E\), not through \(t\). With expanding averages of all such completed regressions,

\[
\widehat X_{G,t,j}
=\overline g_{0,t-E}+\overline g_{1,t-E}X_{H,t,j}.
\]

The paper uses an initial learning period \(L=120\) months. The first fully formed strategy return is therefore indexed by

\[
H+L+E+1=193.
\]

This is a training-history requirement for the correction model, not a requirement that every current stock have 193 months of returns. Once the correction is learned from comparable assets, a new eligible asset needs the rolling estimation history \(H\).

The lag is indispensable. A regression at origin \(t\) uses the next year's returns as its label; feeding its coefficient into the portfolio at \(t\) would leak future information. The procedure also needs to store which labels have matured, since each month's overlapping 12-month outcome is a different training observation.

The target \(X_E\) is itself a noisy statistic from a short future window, not the unobservable true parameter. The method learns the average mapping to that noisy future realization. Its interpretation as correction of a true structural parameter is therefore conditional on the relationship between realized moments, estimation noise, and the evolving return process.

## 3. The evidence motivating the correction

The first diagnostic figure examines factor-model inputs, including residual variances, correlations, alphas, and betas. The main implemented strategy then takes an agnostic sample-moment route without imposing a factor model. The factor illustration should not be mistaken for the risk model used in the central performance tables.

For individual stocks, Table 1 reports the following average Fama–MacBeth slopes, using 60-month historical and 12-month future estimates:

| Input | Average slope | t-statistic against zero | Average cross-sectional R² |
|---|---:|---:|---:|
| Covariance | 0.37 | 10.03 | 4.16% |
| Correlation | 0.23 | 21.44 | 1.59% |
| Variance | 0.58 | 11.07 | 13.24% |
| Mean return | −0.18 | −4.83 | 2.14% |

Inference on average coefficients uses Newey–West standard errors with 12 lags. The correlation slope is clearly positive but far below one: neither unchanged historical correlation nor total replacement by one common correlation captures the average relationship. Variances are more persistent than correlations. Mean returns show reversal in this particular individual-stock sample.

The number of pairwise covariance observations is very large, averaging roughly 3.3 million per cross-sectional regression and reaching about 6.6 million. This supplies information about an average correction, but the pairwise observations are dependent because many pairs share stocks and common shocks. A large pair count is not equivalent to that many independent observations, and the low R² values show how much individual uncertainty remains.

The comparison is descriptive rather than a law of asset returns. A slope below one can arise even with constant underlying correlations because extreme sample estimates regress toward their common mean. It does not require a literal break in the population parameter when the historical window ends. Conversely, actual nonstationarity can also contribute.

The factor illustration's caption uses a 24-month subsequent window, while the main nonfactor figure and estimation method use 12 months. This difference should be preserved in a replication rather than treating every figure as the same experiment.

## 4. Constructing a corrected covariance matrix

The implementation corrects pairwise correlations and individual variances separately. Let \(v_{G,t}\) be the vector of corrected variances, clipped to be strictly positive at machine precision, and let \(R_{G,t}\) be the matrix of corrected off-diagonal correlations with diagonal entries reset to one. Then

\[
\boxed{\Sigma_{G,t}
=\operatorname{diag}(v_{G,t})^{1/2}
R_{G,t}
\operatorname{diag}(v_{G,t})^{1/2}.}
\]

The manuscript denotes its variance vector by \(\sigma_G\), but it is a vector of variances in this equation, not standard deviations. This explains the square-root factors. Mean forecasts are corrected using their own coefficient history, giving \(\mu_{G,t}\).

Correcting covariances directly is examined diagnostically, but the implemented covariance assembly uses corrected correlations and variances. Those are different procedures: separately corrected components do not generally equal the output of an affine regression on each covariance.

A mathematical qualification absent from the short summary is that pairwise corrections need not automatically produce a positive-semidefinite correlation matrix. If a common affine map \(a+b\rho\) is applied to every off-diagonal element of a historical correlation matrix \(R\), then

\[
R_G=bR+a\mathbf1\mathbf1^T+(1-a-b)I.
\]

Sufficient conditions for positive semidefiniteness are \(a\ge0\), \(b\ge0\), and \(a+b\le1\), though these are not necessary. The unconstrained regression does not guarantee them. Clipping individual variances above zero does not repair an indefinite \(R_G\); even keeping every correlation in \([-1,1]\) is insufficient.

A production implementation must inspect eigenvalues and conditioning, and specify any coefficient constraints or nearest-correlation repair explicitly. Such a repair would be an additional implementation choice, not a step documented in this preliminary manuscript. The paper does not supply a general positive-definiteness theorem for its correction.

## 5. Portfolio formulas and normalization

The global minimum-variance allocation is

\[
w_G^{GMV}=\frac{\Sigma_G^{-1}\mathbf1}
{\mathbf1^T\Sigma_G^{-1}\mathbf1}.
\]

The stated mean–variance risky-portfolio direction is \(\Sigma_G^{-1}\mu_G\), with the familiar normalization

\[
w_G^{MV}=\frac{\Sigma_G^{-1}\mu_G}
{\mathbf1^T\Sigma_G^{-1}\mu_G}.
\]

For a tangency interpretation, means must be excess means relative to the chosen risk-free asset. A footnote says the empirical implementation actually divides by the **absolute value** of the denominator to avoid reversing the sign of the risky direction when its sum is negative.

That convention deserves attention. If the denominator is negative, absolute normalization makes the risky weights sum to −1, not +1. A full investor portfolio then needs an explicit cash position to satisfy its wealth budget. If the denominator is near zero, either signed or absolute normalization can create enormous gross exposures. The absolute value preserves direction; it does not cap leverage, stabilize the inverse, or normalize risk.

The paper imposes no portfolio-weight constraints and does not use stock characteristics in the individual-stock optimization. It compares the corrected method with historical sample moments, Elton–Gruber constant correlation, and equal weighting. The constant-correlation estimate retains historical variances and replaces off-diagonal correlations by their cross-sectional mean. Its GMV and MV versions use the same respective formulas.

These deliberately plain benchmarks isolate the potential value of corrected inputs. They are not an exhaustive contest against all covariance shrinkage, Bayesian mean estimation, norm constraints, or directly parameterized portfolio policies discussed in the literature.

## 6. Individual-stock experiment and an eligibility limitation

The monthly CRSP source data are described as covering March 1950–December 2010. Each year the author selects the 50 largest eligible firms by market capitalization, keeps that universe for 12 months, and updates portfolio weights monthly using rolling 60-month estimates. The main text and risk tables identify 526 out-of-sample months from April 1966 through January 2010.

A consequential qualification is that eligibility requires a complete return history over both the preceding 60 months **and the subsequent 12 months**. That future-history requirement is not known at the portfolio-selection date. Although correction coefficients are properly lagged, the universe selection therefore contains a survivorship or look-ahead element. It weakens the claim that the entire experiment is implementable using only information available in real time. A faithful replication should reproduce it first, then test an investable version that handles delistings and future missing data without excluding stocks in advance.

The manuscript contains some date and counting inconsistencies. Table 2's caption mentions a broader sample period rather than the 526-month traded period specified in the main text and Table 3. It also describes 43 annual universes even though 526 months contains 43 full years plus a partial year. These details require reconciliation from data or code before exact numerical replication; they do not change the basic correction algorithm.

No transaction-cost, short-borrow, market-impact, or margin model is included in the reported comparison. Very large gross positions in the unconstrained benchmark strategies make these omissions especially important when interpreting investability.

## 7. Main return and risk results

Table 2 gives annualized standard deviations in percentage points and the following Sharpe ratios:

| Strategy | Realized volatility | Sharpe ratio |
|---|---:|---:|
| Equal weight | 16.05 | 0.29 |
| Historical GMV | 26.50 | 0.19 |
| Historical MV | 15,105.21 | −0.14 |
| Constant-correlation GMV | 15.38 | 0.45 |
| Constant-correlation MV | 1,224.86 | −0.15 |
| Galton GMV | 12.71 | 0.48 |
| Galton MV | 18.68 | 0.43 |

The extreme MV values are what the preliminary manuscript reports. They indicate severe instability of unrestricted estimated tangency directions and normalization, rather than ordinary unlevered equity volatility. They should not be generalized to all mean–variance implementations with practical exposure constraints.

The corrected GMV performs better than corrected MV for individual stocks, consistent with weak or reversing historical mean information. Constant-correlation GMV already performs quite well, so the incremental corrected-GMV Sharpe improvement over that comparator is modest, 0.48 versus 0.45, despite a larger improvement over equal weighting.

Table 3 directly compares anticipated and realized risk:

| Strategy | Ex-ante volatility | Realized volatility |
|---|---:|---:|
| Historical GMV | 3.60 | 26.50 |
| Constant-correlation GMV | 8.85 | 15.38 |
| Galton GMV | 15.24 | 12.71 |
| Historical MV | 133.52 | 15,105.21 |
| Constant-correlation MV | 172.95 | 1,224.86 |
| Galton MV | 18.20 | 18.68 |

Thus the corrected GMV is somewhat conservative on this aggregate measure, while corrected MV is close to realized volatility. The historical GMV's risk is over seven times its estimate; the historical MV's is roughly 113 times its estimate. These are descriptive results for the particular strategies and chosen risk aggregation, not a universal bias factor for the sample covariance matrix.

A clean test of covariance calibration alone would also evaluate alternative covariance forecasts on the **same fixed sequence of portfolio weights**. Here each method supplies both its own weights and its own risk forecast, so differences combine improved inputs, different exposures, and reduced optimizer instability.

## 8. Tail-hit calibration and its interpretation

The paper computes tail thresholds using ex-ante volatility and a normal-distribution assumption, then records how often realized portfolio returns cross those thresholds. This is not the same as a nonparametric historical-simulation VaR procedure, even though the text discusses broader historical-risk-estimation concerns.

At the nominal 1% lower-tail threshold, the main experiment reports:

| Strategy | Observed lower-tail hit rate |
|---|---:|
| Historical GMV | 28.72% |
| Constant-correlation GMV | 5.93% |
| Galton GMV | 1.52% |
| Historical MV | 39.67% |
| Constant-correlation MV | 15.35% |
| Galton MV | 1.33% |

The corrected forecasts are much better calibrated in this comparison. Some upper-tail and 10% lower-tail hit rates are below target, consistent with conservative risk forecasts in parts of the distribution. Failure to reject a nominal hit rate in 526 months is not proof of exact calibration; a 1% event has only about five expected observations in such a sample.

The displayed test focuses on unconditional frequencies. It does not establish independence of exceedances, correct conditional coverage through stress regimes, or accurate expected shortfall. A covariance correction cannot by itself make portfolio returns Gaussian. The larger random-universe exercise still finds statistically significant residual underestimation of the extreme left tail.

## 9. Random-universe robustness exercise

The author generates 1,000 sequences of 50-stock universes, drawing from the 500 largest firms and refreshing the universe every year. Each sequence uses the same historical time span and the actual subsequent stock returns; this is resampling across stock selections, not simulating 1,000 independent market histories or assuming multivariate-normal returns.

Average Sharpe ratios in Table 4 are 0.33 for equal weight, 0.24 for historical GMV, 0.34 for constant-correlation GMV, 0.40 for corrected GMV, and 0.36 for corrected MV. Historical and constant-correlation MV remain near zero. Corrected GMV beats equal weighting in 85% of sequences, while corrected MV does so in 63%.

Relative to 0.33, the corrected-GMV improvement is approximately 21% and the corrected-MV improvement approximately 9%. The text reverses these percentage labels in one sentence; the table's ratios make the intended arithmetic clear.

Expected versus realized volatilities average 16.21% versus 14.21% for corrected GMV and 18.99% versus 19.72% for corrected MV. In every simulated stock selection, corrected-GMV realized volatility is below its estimated value according to the table, whereas corrected-MV realized volatility exceeds its estimate in about 80.2% of sequences. A small average discrepancy does not imply that forecast errors are symmetrically distributed or equally reliable for every selection.

Average nominal-1% lower-tail hit rates are 1.40% for corrected GMV and 1.80% for corrected MV, both statistically above target in the reported tests. Historical GMV and MV give 14.58% and 21.76%, and constant-correlation GMV and MV give 5.30% and 8.06%. The correction greatly reduces, but does not eliminate, tail miscalibration.

The 526,000 strategy-month observations share market dates and many stocks across replications. They are not independent evidence equivalent to 43,833 new years of returns. Reported significance from repeated stock selection should therefore be distinguished from robustness to new macroeconomic histories or structural breaks.

## 10. Characteristic-sorted portfolios require different corrections

The second application uses four sets of 25 Kenneth French portfolios: size–value, operating profitability–investment, size–beta, and size–momentum. Historical moments are estimated over 120 months, with a separate 120-month initial correction-learning period and future 12-month labels.

The persistence patterns differ markedly from individual stocks. Mean-return slopes are 0.38 for size–value, 0.30 for profitability–investment, 0.23 for size–beta, and 0.69 for size–momentum. The first, second, and fourth are significantly positive, while the size–beta slope is not significantly above zero. Size–beta risk estimates are especially persistent: covariance, correlation, and variance slopes are approximately 0.99, 0.98, and 1.00.

The reported out-of-sample Sharpe ratios are:

| Test assets | Equal weight | Historical GMV | Historical MV | Galton GMV | Galton MV |
|---|---:|---:|---:|---:|---:|
| Size–value | 0.58 | 0.86 | −0.11 | 0.84 | 1.01 |
| Profitability–investment | 0.58 | 0.89 | 0.68 | 0.97 | 0.98 |
| Size–beta | 0.59 | 0.69 | 0.06 | 0.70 | 0.75 |
| Size–momentum | 0.54 | 0.95 | 1.29 | 0.95 | 1.37 |

Corrected MV has the highest reported Sharpe ratio in each panel, but its incremental gain over historical MV is small for momentum, where historical means already contain useful cross-sectional information. Corrected GMV does not beat historical GMV in every panel: size–value is 0.84 versus 0.86, and momentum is tied at the reported precision. The correction is flexible, not uniformly dominant.

Risk calibration also remains imperfect. Size–momentum corrected MV has expected volatility 33.01% and realized volatility 45.60%, an approximately 38% understatement, despite its strong Sharpe ratio. This is much less extreme than the constant-correlation MV failure in that panel, but it qualifies a broad claim that corrected risk is always close to realized risk.

Characteristic-sorted portfolios embed economic information and diversification in their construction. Their favorable results should not be treated as an identical experiment on raw individual stocks. They demonstrate that a useful correction must adapt to the asset universe rather than applying one universal mean-reversion coefficient.

## 11. Why the approach can work, and what it does not prove

Optimized portfolios exploit estimated differences. If extreme sample inputs are systematically less extreme in subsequent data, the optimizer magnifies precisely the components that require correction. Learning the historical mapping can damp that amplification and provide more credible ex-ante opportunity sets. The paper's December 2009 frontier illustration makes this visible: historical moments imply a GMV risk near 2.38% and an attainable Sharpe ratio near 10.98, whereas corrected moments give a much more modest estimated Sharpe ratio around 0.62.

The correction's intercept acts like a learned cross-sectional level and its slope controls persistence, separately for each input. It can approximate conventional shrinkage when the mapping has a positive slope below one, but it is not automatically a Bayesian posterior, minimax solution, or optimal covariance estimator under a stated loss function.

Expanding-average coefficients become stable with a long record, but they can adapt slowly to structural changes. Forecast horizons are fixed at one year even though portfolios rebalance monthly. The method assumes enough similarity across stocks or portfolios to transfer the learned mapping. Pairwise correlation dependence, noisy future labels, matrix definiteness, and changing asset composition remain statistical and numerical concerns.

The paper intentionally avoids more elaborate corrections and does not establish that the chosen linear map, expanding window, or learning length is optimal. Its conclusions are evidence for using past forecast errors as an additional input, not proof that this particular correction dominates all regularization approaches.

## 12. Replication and useful extensions

A rigorous implementation should preserve the full as-of-date record: historical moment estimates, completion dates of future labels, cross-sectional regression coefficients, expanding averages available at each trade, and portfolio weights before observing the next return. Validate covariance eigenvalues, inspect the normalization denominator, and report gross leverage and turnover alongside returns.

For an investable follow-up, remove future-history eligibility filters; include delisting returns, financing, borrow and trading costs; compare with covariance and mean shrinkage benchmarks under common exposure constraints; and test each risk forecast on common portfolio exposures. Any positive-definite repair or slope restriction should be recorded as an extension rather than silently attributed to the original paper.

Evaluate both investment performance and forecast calibration. A higher Sharpe ratio does not ensure that a risk budget is respected, while a conservative covariance forecast can improve sizing even if it does not maximize returns. Barroso's main contribution is to connect those two tasks through a simple observation: the past record of how optimization inputs failed is information that the next optimization can use.
