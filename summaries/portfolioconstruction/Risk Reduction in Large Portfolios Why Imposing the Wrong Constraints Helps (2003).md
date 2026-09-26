# Risk Reduction in Large Portfolios: Why Imposing the Wrong Constraints Helps

**Ravi Jagannathan and Tongshu Ma (2003).** *The Journal of Finance* 58(4), 1651–1683. [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioConstraints_JagannathanMa_2003.pdf>). This summary covers the full 33-page article, including both appendices. It distinguishes the exact portfolio-equivalence result, its statistical interpretation, the simulation evidence, and limitations of the likelihood extension.

## 1. The apparent paradox

A dominant common factor can justify large positive and negative population minimum-variance weights. Form diversified high-beta and low-beta portfolios, short the high-beta portfolio, and buy the low-beta portfolio to remove systematic exposure. When their betas differ only slightly, eliminating market exposure requires very large offsetting positions. Consequently extreme weights need not be caused solely by estimation error.

Nevertheless, prohibiting short sales often lowers the *out-of-sample* variance of an estimated minimum-variance portfolio. The resolution is a bias–variance tradeoff. A constraint may exclude the unknown population optimum while reducing the sampling error of an estimated portfolio by more than the resulting loss. The paper identifies the covariance adjustment implicitly induced by position bounds, then studies when its benefit outweighs its misspecification cost.

Its main focus is the global minimum-variance portfolio (GMV) and minimum tracking-error portfolios. Expected-return estimation is deliberately avoided in the central analysis because historical average returns are particularly noisy. The empirical tangency-portfolio comparison later shows that position constraints alone do not solve that separate problem.

## 2. The optimization problem and multiplier convention

Let \(S\succeq0\) be an estimated covariance matrix and \(w\) a fully invested portfolio. With a common upper bound \(u\), solve

\[
\min_w\;\tfrac12w^TSw,
\qquad \mathbf1^Tw=1,\quad0\le w_i\le u.
\]

The factor one-half merely fixes the multiplier normalization. Using nonnegative lower-bound multipliers \(\lambda_i\), upper-bound multipliers \(d_i\), and a budget multiplier \(\lambda_0\), the KKT conditions are

\[
Sw-\lambda+d=\lambda_0\mathbf1,
\]

\[
\lambda_iw_i=0,\quad d_i(u-w_i)=0,
\quad\lambda_i,d_i\ge0.
\]

Thus \(\lambda^Tw=0\), \(d^Tw=u\mathbf1^Td\), and

\[
w^TSw=\lambda_0-u\mathbf1^Td.
\]

If an implementation uses the objective \(w^TSw\) instead, the bound multipliers are doubled. The adjustment formulas must be scaled consistently; mixing a gradient \(2Sw\) with the paper's unscaled multipliers introduces a factor-of-two error.

The paper's first proposition defines

\[
\boxed{\widetilde S
=S+(d\mathbf1^T+\mathbf1d^T)
 -(\lambda\mathbf1^T+\mathbf1\lambda^T).}
\]

It proves that this matrix is positive semidefinite and that the constrained portfolio is an unconstrained GMV portfolio for \(\widetilde S\), where “unconstrained” retains the budget equality but removes the position bounds.

## 3. Why the covariance transformation works

Multiplying the adjusted matrix by the constrained solution gives

\[
\widetilde Sw
=Sw+d-\lambda+(d^Tw-\lambda^Tw)\mathbf1
=(\lambda_0+u\mathbf1^Td)\mathbf1.
\]

That is the unconstrained first-order condition. Positive semidefiniteness supplies global optimality, including when \(S\) is singular. No inverse is required to establish this proposition; the familiar formula \(S^{-1}\mathbf1/(\mathbf1^TS^{-1}\mathbf1)\) applies only when the appropriate inverse exists.

A useful constructive version of the positive-semidefiniteness argument follows directly from stationarity. Put \(a=\mathbf1^Tx\) and \(v=w^TSw\). Then

\[
x^T\widetilde Sx
=(x-aw)^TS(x-aw)+(2\lambda_0-v)a^2.
\]

Because \(\lambda_0=v+u\mathbf1^Td\), the second coefficient is nonnegative. This also clarifies why the adjustment can be indefinite as a *difference* of matrices while the final adjusted matrix remains a valid covariance matrix.

For no-short constraints alone, \(d=0\), so

\[
\widetilde S_{ij}=S_{ij}-\lambda_i-\lambda_j.
\]

The variance of an excluded stock falls by \(2\lambda_i\); its covariance with another stock falls by \(\lambda_i+\lambda_j\). For an upper bound alone, the direction reverses:

\[
\widetilde S_{ij}=S_{ij}+d_i+d_j.
\]

The adjustment is not entrywise clipping, a fixed shrinkage intensity, or a convex combination with a prespecified target. It is an endogenous row-and-column transformation determined by the active constraints and the estimated covariance geometry.

## 4. The shrinkage interpretation and its limits

A stock with unusually high estimated covariances tends to contribute excessively to portfolio risk and may receive a negative unconstrained weight. If its long-only constraint binds, its row and column are reduced in the implied covariance matrix. A stock with unusually low estimated covariances may attract an unusually large positive allocation; an upper bound raises its implied covariances.

The statistical intuition is a selection effect: optimization tends to exploit extreme estimation errors. High observed covariances selected for shorting may contain positive errors, while unusually attractive low covariance estimates may contain negative errors. Moving those estimates toward less extreme values can improve the realized portfolio.

This reasoning does not mean the sample covariance estimator is unconditionally biased upward, that every large covariance is erroneous, or that all individual entries move closer to their true values. Some are genuinely large. Constraints then introduce specification error. The exact algebra proves optimizer equivalence, while an out-of-sample improvement requires a statistical argument or empirical evidence about this tradeoff.

The authors explicitly decline to claim that \(\widetilde S\) is generally a superior covariance estimator to Ledoit shrinkage. A matrix can be useful for one portfolio decision without minimizing covariance-estimation loss for every purpose.

In a 500-stock illustration with 132 monthly observations from 1990–2000, the range of row-average sample covariances falls from about \(52.13\times10^{-4}\) to \(44.41\times10^{-4}\) after the long-only adjustment. Adjustments are related to, but far from identical to, those of the Ledoit estimator. For example, the regression of individual-element adjustments on the corresponding Ledoit adjustments has a low adjusted \(R^2\), about 0.023, despite high statistical significance in the very large cross section. Similar direction should not be confused with near equality of the estimators.

## 5. Likelihood interpretation: conditions and an upper-bound qualification

For iid multivariate normal observations, profiling out the mean gives

\[
\ell(\Omega)=\text{constant}
-\frac T2\{\log\det\Omega+\operatorname{tr}(S\Omega^{-1})\},
\]

where \(S\) uses the maximum-likelihood normalization \(1/T\). Let \(K=\Omega^{-1}\). The requirement that unconstrained GMV weights be nonnegative becomes \(K\mathbf1\ge0\); the upper bound becomes

\[
K\mathbf1\le u(\mathbf1^TK\mathbf1)\mathbf1.
\]

These are linear restrictions on the precision matrix. Maximizing \(\log\det K-\operatorname{tr}(SK)\) over the positive-definite feasible set is a concave optimization problem. For the **no-short-only case**, its KKT conditions reproduce the covariance adjustment \(S-\lambda\mathbf1^T-\mathbf1\lambda^T\), when the resulting matrix is nonsingular. This gives a genuine constrained-MLE interpretation, not just a heuristic resemblance to shrinkage.

The supplied article states a broader likelihood equivalence for upper bounds as well. However, its Appendix A differentiation omits the common term generated by the normalization \(\mathbf1^TK\mathbf1\) in the upper-bound constraints. Direct differentiation gives, in the multiplier convention above, the corrected covariance

\[
\boxed{\widehat\Omega
=\widetilde S-2u(\mathbf1^Td)\mathbf1\mathbf1^T.}
\]

Indeed,

\[
\widehat\Omega w=(w^TSw)\mathbf1,
\]

and

\[
x^T\widehat\Omega x
=(x-(\mathbf1^Tx)w)^TS(x-(\mathbf1^Tx)w)
 +(\mathbf1^Tx)^2w^TSw\ge0.
\]

When \(S\) is positive definite, this supplies a positive-definite covariance and the precision-matrix KKT conditions. Adding or subtracting a multiple of \(\mathbf1\mathbf1^T\) changes the variance of every fully invested portfolio by the same constant, so it leaves the GMV optimizer unchanged. The correction therefore preserves Proposition 1's portfolio equivalence while qualifying the claim that *the identical adjusted matrix* is the upper-bound-constrained MLE.

For a small diagnostic example, take \(S=\operatorname{diag}(1,4)\) and \(u=0.6\). The constrained portfolio is \((0.6,0.4)\), with upper multiplier \(d=(1,0)\). The paper's portfolio-equivalent matrix is

\[
\widetilde S=\begin{pmatrix}3&1\\1&4\end{pmatrix},
\]

whereas the precision-constrained likelihood solution is

\[
\widehat\Omega=\begin{pmatrix}1.8&-0.2\\-0.2&2.8\end{pmatrix}
=\widetilde S-1.2\mathbf1\mathbf1^T.
\]

Both have the stated GMV weights, but they are different likelihood candidates. This qualification is a direct algebraic check of the source, not an additional empirical result.

Nonsingularity is also consequential. The main 500-stock, 60-month empirical sample covariance is singular, and a low-rank row-and-column adjustment generally remains singular. The optimization-equivalence proposition still applies, but its positive-definite Gaussian likelihood interpretation cannot simply be asserted for that high-dimensional case.

## 6. Simulation design: controlling population misspecification

The simulation assumes two uncorrelated unit-variance factors. First-factor betas have cross-sectional mean one and standard deviation \(s_\beta\), varied from zero to 0.4. When there is beta dispersion, the second-factor betas have mean zero and standard deviation 0.2. Residual variances are drawn cross-sectionally from a lognormal distribution with parameters 0.8 and 0.7 and held fixed over time. At \(s_\beta=0.4\), the calibration approximately matches features of the first two empirical factors for NYSE stocks.

The number of stocks ranges from 30 to 300. Sample lengths include 60 observations and values from \(N+30\) to \(N+210\). For each configuration, the authors estimate a sample covariance and a one-factor covariance, construct constrained and unconstrained portfolios, then evaluate their risks using the known population covariance. They average over ten replications, a relatively small simulation count by modern standards.

Population short interest makes the “wrongness” of long-only constraints explicit. With 300 assets, total short positions are about 204% of wealth at first-factor beta dispersion 0.1, about 131% at dispersion 0.2, and about 53% at dispersion 0.4. There is no premise that the true optimum is close to long-only.

At \(N=300,T=360,s_\beta=0.4\), imposing long-only constraints on the sample-covariance portfolio reduces ex-post standard deviation by about 25% relative to the unconstrained sample-covariance portfolio. Imposing the one-factor structure gives about 59.2% reduction; combining it with long-only constraints gives about 27.2%. In this configuration the already structured estimator benefits from shorting, so adding long-only restrictions is costly.

With population covariance known, the long-only restriction at the same \(N,s_\beta\) increases standard deviation by about 79.4% relative to the unrestricted optimum. This is the central reconciliation: a constraint that is materially wrong in population can still improve a much noisier estimated portfolio.

The benefit recedes as sample size rises. Table IV's illustrative crossover at \(N=300\) is about 450 observations for beta dispersions 0.2, 0.3, and 0.4; at \(N=60\), it is about 150. These are calibration-dependent simulation cutoffs, not universal sample-size rules. When betas are identical, population long-only constraints are correct, but little diversification beyond equal weighting is available, and estimation noise can still make optimized portfolios worse than equal weighting.

## 7. Empirical portfolio construction

Each April the study randomly selects 500 eligible NYSE/AMEX domestic common stocks, subject to price, size, and five years of return-history requirements. It estimates covariance from the preceding 60 months, or daily returns over the same period, then holds the resulting portfolio for a year and records monthly returns.

The methodology text describes selection dates from April 1968 to April 1998 and postformation returns through April 1999. Several table captions instead end the formation period in 1997. This internal date discrepancy should be retained when documenting a replication, rather than silently resolved from the summary.

Three weight regimes are compared: unrestricted; nonnegative; and nonnegative with a 2% cap per stock. The monthly sample covariance is singular, so its ordinary unrestricted inverse-based portfolio is not included alongside the two bounded versions. This is important when interpreting statements that constraints improve the monthly sample-covariance portfolio: the article does not report a directly comparable ordinary inverse-based unrestricted 500-by-500 monthly sample portfolio in the main table.

Estimators include the sample covariance, a market one-factor model, Ledoit shrinkage toward that one-factor model, the Fama–French three-factor model, and Connor–Korajczyk factor models. Daily versions and microstructure corrections are also examined. Missing daily stock returns are replaced by the equal-weighted market return, a consequential data-processing choice for replication.

The tracking objective is variance of returns relative to the S&P 500. Since \(\mathbf1^Tw=1\), it is equivalent to applying the same GMV machinery to asset returns net of the benchmark. It minimizes tracking-error *variance*, not expected squared tracking deviation including its squared mean, and does not by itself impose a zero expected active return.

## 8. Actual minimum-variance results

Annualized out-of-sample standard deviations in Table V are:

| Covariance estimate | Unrestricted | Long-only | Long-only, 2% cap |
|---|---:|---:|---:|
| Monthly sample | Not reported: singular | 12.43% | 12.85% |
| Monthly one-factor | 11.69% | 12.62% | 12.50% |
| Monthly Ledoit | 10.76% | 12.29% | 12.43% |
| Monthly Fama–French | 11.35% | 12.38% | 12.53% |
| Daily sample | 10.64% | 12.34% | 12.28% |

Once long-only restrictions are present, total-risk differences among these estimators become small. This is the main empirical result. It does **not** mean long-only constraints always lower risk: the table shows higher risk when they are imposed on the structured or daily unrestricted estimators. The unrestricted daily sample portfolio also has total short positions exceeding 122% of wealth, so the lower realized variance comes with substantial gross exposures.

The long-only monthly sample portfolio holds about 24 stocks on average and has a reported maximum weight around 18.4%. Adding the cap increases holdings to about 60. The long-only daily sample portfolio holds about 65 stocks. Equal weighting across all 500 gives 17.48% volatility; a random equal-weighted 25-stock portfolio gives 17.78%. Thus the low risk of the selected sparse GMV portfolio is not reproduced merely by holding any 25 names.

The 2% cap generally produces little additional variance improvement once nonnegativity is imposed. It may still have value for concentration, operational, or tail-risk reasons, which are separate from the sample variance criterion.

## 9. Tracking error and the limits of the headline equivalence

Monthly sample covariance with long-only constraints produces annualized tracking-error volatility of 3.36%, close to monthly Ledoit's 3.34%. The long-only one-factor model is considerably worse at 5.04%, and the Fama–French version is about 4.39%. Removing the dominant common component through benchmark subtraction makes the simple one-factor approximation less useful.

Daily sample covariance produces 2.94% unrestricted tracking error and 2.78% long-only. Therefore daily data do provide a meaningful improvement over monthly sample covariance for tracking, even though their incremental benefit for constrained total-risk minimization is small. The paper's detailed findings are more nuanced than saying monthly and daily estimates perform identically for every objective.

The 500-stock value-weighted portfolio has tracking error of 2.37%, lower than the reported optimized alternatives. This is plausible for tracking a capitalization-weighted benchmark and is an important comparator. Optimization does not dominate all simple benchmarks in the experiment.

The article tests differences in mean and mean-squared returns relative to the long-only monthly sample portfolio. Mean differences are generally insignificant. Treating mean-square differences as evidence about variance is supported by that finding, but absence of significance is not proof of identical means or risk. Many comparisons share a common benchmark and historical sample.

## 10. Expected returns remain a separate estimation problem

For the 500-stock experiment, Table VIII shows out-of-sample tangency Sharpe ratios around 0.35–0.41 for constrained monthly estimators, versus 0.45 for equal weighting. Corresponding GMV ratios are around 0.48–0.55 for the constrained estimators and up to about 0.64 for an unrestricted one-factor GMV portfolio.

Unrestricted tangency portfolios can be extreme: the Fama–French covariance version has average short interest around 704% and an out-of-sample Sharpe ratio around −0.09, despite a very high in-sample ratio. The Ledoit version has short interest around 1,194% and an out-of-sample Sharpe ratio around 0.03. Improving covariance estimation does not neutralize noisy mean estimates that the tangency optimizer amplifies.

For 25 Fama–French size/book-to-market portfolios, constrained tangency portfolios slightly outperform constrained GMV portfolios in reported Sharpe ratios, but the differences are not statistically significant. The source therefore supports a conditional empirical preference for GMV in a large cross section, not a theorem that ignoring expected returns is always optimal.

## 11. Daily covariance estimation and microstructure

Appendix B distinguishes estimation of an underlying instantaneous or “true” covariance from estimation of monthly covariance using daily returns. For stationary daily log returns and a month of \(m\) days,

\[
\Sigma_m=m\Gamma_0+
\sum_{j=1}^{m-1}(m-j)(\Gamma_j+\Gamma_j^T),
\]

where \(\Gamma_j\) is a daily lag covariance. The experiment sets \(m=21\). Simply adding estimated lead/lag pairwise covariances without compatible variance adjustments can produce an indefinite matrix, as can the discussed CHMSW construction.

The proposed estimator uses demeaned daily-return matrices and zero-padded lagged matrices, with common normalization, to implement the triangular weighting. This is a Bartlett/Newey–West-type positive-semidefinite construction. Factor exposures can then be estimated from similarly aggregated factor and asset covariances.

These corrections make relatively little difference to the reported out-of-sample portfolio risks. That historical observation does not make positive semidefiniteness optional or show that nonsynchronous trading is irrelevant in every universe.

## 12. Implementation implications

A practical replication should compare the estimated portfolio's realized risk across covariance estimators *and* constraint sets, using the same formation dates and eligible universe. Inspect multiplier magnitudes to identify which assets are being materially reinterpreted by the bounds. Verify the adjusted-covariance KKT identity numerically, with consistent objective normalization; singular matrices should be handled through convex optimization rather than an unjustified inverse.

Select bounds with attention to the bias–variance tradeoff, concentration, and implementation. A good constraint for a noisy sample estimator may unnecessarily damage a more accurate structured estimate. Evaluate turnover, borrow costs, gross leverage, and tail concentration separately: the paper's main tables are risk comparisons, not a complete transaction-cost-adjusted investment analysis.

The durable result is that portfolio constraints are part of statistical regularization as well as investment policy. Their economic plausibility and their statistical usefulness are distinct questions. The article demonstrates both the benefit of wrong constraints under substantial estimation error and the circumstances in which sufficiently accurate covariance information makes those same constraints costly.
