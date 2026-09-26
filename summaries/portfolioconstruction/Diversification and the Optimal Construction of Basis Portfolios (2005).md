# Diversification and the Optimal Construction of Basis Portfolios

Bruce N. Lehmann and David M. Modest, *Management Science* 51(4), April 2005, pp. 581–598. DOI: 10.1287/mnsc.1040.0316. [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/LehmannModest_  Diversification and the Optimal Construction of Basis Portfolios_2005.pdf>). This summary covers all eighteen pages, including the theoretical comparison, estimation algorithms, bootstrap design, and empirical tables.

## 1. Question and main result

The paper asks how to convert a latent-factor estimate into a set of traded basis portfolios that actually capture common return variation. Statistical factor estimation and portfolio formation are separate decisions. Even if a factor estimator is consistent as the number of stocks grows, finite-sample errors in loadings can make a nominally factor-pure portfolio poorly diversified.

The preferred combination in the empirical study is maximum-likelihood factor analysis together with the authors' **minimum idiosyncratic risk portfolio** construction. A crucial distinction is that this construction does **not** impose unit loading on the factor being mimicked. It imposes unit investment and zero loading on the other factors, leaving the target factor's loading free. The competing Fama–MacBeth construction imposes a unit target loading and zero other loadings before rescaling. Both minimize residual variance, but under different constraints. Confusing these programs removes the central contribution of the paper.

Their comparison uses the joint significance statistic for mean basis-portfolio returns, equivalently sample size times the squared maximum Sharpe ratio available from the basis set. Bootstrap comparisons quantify the economic and statistical differences among factor estimators, formation rules, cross-section sizes, and numbers of factors. The authors do not establish a universal theorem that maximum-likelihood factor analysis dominates principal components out of sample.

## 2. Approximate factors and diversification

Returns satisfy

$$
R_t=E+B\delta_t+\varepsilon_t,
\qquad E[\delta_t]=E[\varepsilon_t]=0,
\qquad \operatorname{Var}(\delta_t)=I_K,
\qquad E[\varepsilon_t\delta_t^\top]=0,
\qquad \operatorname{Var}(\varepsilon_t)=\Omega.
$$

Here $B$ is $N\times K$ and $\Omega$ is positive definite. Merely writing this decomposition imposes little substantive structure. An approximate factor model additionally bounds the largest eigenvalue of $\Omega$ as $N$ grows. The residuals may be weakly correlated; they need not be mutually independent.

For weights $w$,

$$
R_{p,t}=w^\top E+w^\top B\delta_t+w^\top\varepsilon_t,
\qquad
\operatorname{Var}(w^\top\varepsilon_t)
\le\lambda_{\max}(\Omega)\|w\|_2^2.
$$

Therefore a sequence of portfolios with $\|w\|_2^2\to0$ eliminates residual risk under the eigenvalue bound. A large count of nonzero positions is insufficient: highly offsetting or concentrated weights may leave the squared norm large. Weights of order $1/N$ are one sufficient form of diversification.

When a well-diversified unit-cost portfolio can be made factor-neutral, its limiting return is riskless. The approximate pricing relation is then $E\approx\mathbf1\lambda_0+B\lambda$, with $\lambda_0$ equal to the risk-free return. Existence of such a portfolio depends on the geometry of the loading matrix: a vector of ones that lies approximately in the factor span can prevent a fully invested factor-neutral portfolio. The paper handles the corresponding alternative normalization separately and does not impose exact APT pricing on every individual security.

The residual-diversification condition is also distinct from factor identification. A useful factor basis requires sufficiently different asset sensitivities so that all factors can be distinguished. A universe can be large enough to average away much idiosyncratic noise while still having nearly collinear loading columns and being inadequate for identifying separate factors.

## 3. The unbiased GLS and Fama–MacBeth construction

If the true $B$, $E$, and $\Omega$ were known, the generalized least-squares estimator of the factor realization would be

$$
\widehat\delta_t^{GLS}
=(B^\top\Omega^{-1}B)^{-1}B^\top\Omega^{-1}(R_t-E),
$$

with error covariance $(B^\top\Omega^{-1}B)^{-1}$. A growing smallest eigenvalue of the relevant loading information matrix makes factor-estimation noise vanish.

For factor $j$, the equivalent portfolio program is

$$
\min_w\frac12w^\top\Omega w
\quad\text{subject to}\quad B^\top w=e_j.
$$

Its Lagrangian condition gives $\Omega w=B\ell$; substituting the constraint yields

$$
w_j^{FM}=\Omega^{-1}B(B^\top\Omega^{-1}B)^{-1}e_j.
$$

These are the paper's unbiased minimum-residual-variance factor mimickers, called Fama–MacBeth portfolios. The paper subsequently rescales raw-return portfolios to cost one dollar for comparison. That rescaling generally changes the target loading away from one; it is important to distinguish the initial identification convention from the traded portfolio's unit-cost normalization.

When the factors are known and parameters measured accurately, using cross-sectional loading information improves factor tracking. The difficulty is that in practice the optimizer sees estimated loadings, and extreme measured sensitivities can reflect errors rather than valuable factor exposure.

## 4. The alternative minimum idiosyncratic risk portfolio

For the portfolio associated with factor $j$, replace the target-loading constraint by a budget constraint:

$$
\min_w\frac12w^\top\Omega w
\quad\text{subject to}\quad
\mathbf1^\top w=1,\qquad b_k^\top w=0\quad(k\ne j).
$$

Let $B_j^*$ be $B$ with column $j$ replaced by $\mathbf1$. Then

$$
w_j^{MIRP}=\Omega^{-1}B_j^*
[(B_j^*)^\top\Omega^{-1}B_j^*]^{-1}e_j.
$$

The target loading $b_j^\top w_j^{MIRP}$ is endogenous. For latent factors, whose units are arbitrary, an exactly prescribed target scale need not be valuable. Correlation with the target common variation and low contamination can matter more than unbiased estimation in an arbitrary factor normalization.

The one-factor, homoskedastic example is especially transparent. If $\Omega=\sigma_\varepsilon^2I$, the FM rule has weights proportional to the estimated beta vector, whereas MIRP is equal weighting. MIRP ignores estimated beta differences and gains robustness; FM uses them and can gain efficiency if they are real. This is a bias-variance comparison, not an argument that loading information is always worthless.

With several factors, MIRP still uses estimated loadings on the **other** factors to achieve neutrality. It is therefore not immune to all loading estimation error. The one-factor example's immunity arises because its only remaining constraint is the budget constraint.

## 5. How estimation error can reverse the ranking

The paper develops a one-factor illustration with true loadings $\beta$ and measured loadings $b=\beta+v$, where the error has covariance $\Sigma_v$. It simplifies the analysis by taking measurement errors independent of subsequent factors and residuals and treating the cross-sectional average error as negligible. Those assumptions make the mechanism visible; they are not literally exact when loadings and portfolio returns are estimated from the same sample.

For the equal-weight MIRP,

$$
R_t^{MIRP}=\overline E+\overline\beta\delta_t+\overline\varepsilon_t,
$$

and

$$
\operatorname{Corr}(R_t^{MIRP},\delta_t)^2
=\frac{\overline\beta^2\sigma_\delta^2}
{\overline\beta^2\sigma_\delta^2+\sigma_\varepsilon^2/N}.
$$

With error-free loadings, the FM portfolio's squared correlation is

$$
\frac{\beta^\top\beta\,\sigma_\delta^2}
{\beta^\top\beta\,\sigma_\delta^2+\sigma_\varepsilon^2},
$$

which is at least as large, since $\beta^\top\beta\ge N\overline\beta^2$. Real cross-sectional variation in beta is useful information.

When the portfolio is built on noisy $b$, however, its variance contains extra terms involving $\beta^\top\Sigma_v\beta$, $E^\top\Sigma_vE$, and $\sigma_\varepsilon^2\operatorname{tr}(\Sigma_v)$. These terms reduce factor correlation. In an OLS illustration $\Sigma_v$ is approximately $\sigma_\varepsilon^2I/(T\sigma_\delta^2)$, so short histories and large idiosyncratic noise can make estimated differences unhelpful. The paper gives an explicit inequality for the reversal; its economic content is that the information in genuine beta dispersion must outweigh the noise introduced by using estimated beta dispersion.

The scale of a latent factor itself is arbitrary. Purely rescaling a portfolio cannot change its correlation or Sharpe ratio. Thus large numerical weights caused only by a scale convention should not be mistaken for a scale-invariant performance failure. What matters economically is residual contamination relative to target exposure and the portfolio subspace generated by the constraints. The paper's unit-cost comparisons and differing formation constraints address that broader issue.

## 6. Why a mean-return statistic can rank factor bases

For a set of $K$ basis portfolios, write approximately

$$
R_{p,t}=B_p(\lambda+\delta_t)+\varepsilon_{p,t}.
$$

If the residual mean and factor-residual sample covariance are negligible, but residual variance is not, then

$$
\overline R_p\approx B_p\widehat\lambda,
\qquad
S_p\approx B_pS_\delta B_p^\top+S_{\varepsilon_p}.
$$

The statistic

$$
Q_p=T\overline R_p^\top S_p^{-1}\overline R_p
$$

is approximately

$$
T\widehat\lambda^\top
\left[S_\delta+(B_p^\top S_{\varepsilon_p}^{-1}B_p)^{-1}\right]^{-1}
\widehat\lambda.
$$

It is bounded above, within this approximation, by the factor-only value $T\widehat\lambda^\top S_\delta^{-1}\widehat\lambda$. Reducing contamination increases the attainable signal-to-noise ratio in priced directions. The statistic is invariant to nonsingular changes of basis, so arbitrary factor units do not determine the ranking.

This is a heuristic grounded in the approximate model and diversification assumptions, not a pointwise identity for every estimated factor panel. If residual average returns are material or the weights exploit the same residual realizations used in evaluation, the interpretation weakens. A factor with zero price of risk can also be important for covariance modeling without contributing much to this pricing-based criterion. The criterion ranks recovery of priced common variation, not every possible notion of factor-estimation accuracy.

## 7. Connection to asset-pricing tests

The paper relates the basis statistic to the increase in squared sample Sharpe ratio obtained by adding individual securities to the basis portfolios. Under the relevant linear-algebra and covariance conventions,

$$
Q_{\alpha}=T\left[
(\overline R-\mathbf1\lambda_0)^\top S^{-1}
(\overline R-\mathbf1\lambda_0)
-\overline R_p^\top S_p^{-1}\overline R_p
\right].
$$

An imperfect basis lowers the second term and thereby raises the apparent pricing-error statistic, potentially making a correct factor-pricing model look rejected. This is why the economic magnitude of differences in $Q_p$ matters beyond the ranking of portfolios.

For illustration, the source notes that a 15-degree-of-freedom chi-square statistic near its five-percent critical value of 24.996 would have a p-value near 0.0025 after an upward shift of ten. This demonstrates sensitivity to an imperfect basis; it does not establish that every historical rejection of APT is erroneous.

The in-sample squared Sharpe ratio is upward biased, and statistics from competing methods applied to the same sample are dependent. The paper therefore uses paired bootstrap comparisons rather than pretending that the two statistics are independent chi-square draws.

## 8. Factor estimators compared

The empirical covariance representation is $\Sigma=BB^\top+D$ for maximum-likelihood factor analysis, with diagonal, security-specific residual variances. Under iid Gaussian returns its covariance log likelihood, omitting constants, is

$$
-\frac T2\left[\log|\Sigma|+\operatorname{tr}(S\Sigma^{-1})\right].
$$

The estimation restriction is stronger than the approximate-factor theory's permission for weak residual correlations. The distinction is deliberate: a tractable finite-sample estimator needs additional structure.

The three estimation variants are:

- **PC OLS:** principal-component loadings, with common residual variance in portfolio formation. This paired with FM formation is the usual asymptotic-principal-components approach, up to normalization.
- **PC WLS:** the same principal-component loadings, but security-specific residual variances computed from the diagonal of $S-B^{PC}(B^{PC})^\top$ and used in forming portfolios.
- **Maximum likelihood:** jointly iterated loading and diagonal residual-variance estimates, then used in portfolio formation.

The likelihood algorithm uses a modified EM scheme: estimate conditional factor scores given loadings and residual variances, update the parameters by regression, then accelerate convergence by analytically updating loadings conditional on residual variance. Principal-component estimates provide natural starting values. The paper's point is not merely that inverse-variance weighting helps; it tests whether joint estimation of loadings and residual variances adds value beyond applying weights to unchanged PC loadings.

## 9. Data and bootstrap design

The study uses daily CRSP returns in eight nonoverlapping five-year periods from 1963–1967 through 1998–2002. Each period retains continuously listed stocks, producing between 954 and 3,156 securities. This balanced-panel choice introduces potential selection bias, which the authors explicitly do not resolve.

Stocks are randomly reordered, then models use the first 250, the first 750, or all stocks. The authors examine 5, 10, and 15 factors and nine combinations of factor estimation and portfolio formation. They do not claim these are estimates of the true number of factors.

For each five-year period, 50 bootstrap samples resample daily cross-sectional return observations with replacement. The complete estimation and formation calculations are repeated, yielding 408 actual and simulated samples across the eight periods. Resampling dates together preserves contemporaneous cross-stock dependence but an iid daily bootstrap does not preserve serial dependence. The choice of 50 replications is justified for the reported means, variances, and fractions; the authors state it would be inadequate for precise tail-area estimation.

The tables report average ratios of squared Sharpe ratios, average differences in $Q$, and the fraction of bootstrap comparisons favoring one method. These fractions are empirical comparison frequencies, not posterior probabilities that one method is true or guaranteed superior in future data.

## 10. Actual results and their qualifications

MIRP formation dominates its FM counterpart in the reported paired comparisons. In 20 of 27 parameter combinations, the average squared-Sharpe-ratio improvement exceeds 100 percent; the smallest improvement is 59 percent. Only three comparisons have favorable bootstrap fractions below 90 percent, and all three exceed 85 percent. The smallest mean difference in the chi-square statistic is 15.64, a substantial shift for the asset-pricing-test interpretation.

Maximum-likelihood estimation helps primarily when combined with MIRP formation. It can perform **worse** than principal components when combined with FM portfolios. Thus the empirical conclusion concerns an estimator-and-formation pair; there is no unconditional ranking of estimators independent of portfolio construction.

For all stocks, the directly calculated mean $Q$ improvement of maximum-likelihood MIRP over PC-OLS FM is 43.82, 54.09, and 55.30 for 5, 10, and 15 factors, with reported standard errors 9.01, 9.92, and 10.30. Favorable bootstrap fractions are 0.831, 0.858, and 0.843, respectively. These are separate pairwise calculations, not ratios reconstructed from aggregate table entries.

PC WLS offers no clear gain over PC OLS in large cross-sections and sometimes slightly worsens the comparison. This supports the interpretation that improved **joint estimation** of loadings and residual variances matters more than simply reweighting PC loadings by an estimated diagonal.

Expanding from 250 to 750 stocks generally improves basis performance, with larger gains for MIRP. Moving from 750 to all stocks yields substantial additional improvement mainly for MIRP. More securities alone do not fully cure a formation procedure that reacts poorly to estimated sensitivities.

## 11. Raw returns, excess returns, and factor-neutral portfolios

The paper separately constructs sample factor-neutral portfolios and subtracts their returns to form zero-investment bases. In the one-factor homoskedastic case, both methods' excess-return weights are proportional to $\beta-\overline\beta\mathbf1$. They therefore generate the same scale-invariant chi-square statistic, even when their raw unit-cost portfolios differ.

A sample factor-neutral stock portfolio is not literally a risk-free asset. Its residual volatility can be much larger than Treasury-bill volatility, so subtracting its return adds noise. The authors conclude that using an observed risk-free return can yield better excess-return bases than estimating a synthetic riskless stock portfolio. Neutrality to estimated common factors does not eliminate residual or estimation risk.

## 12. Implementation and limitations

A practical reproduction should implement FM and MIRP as distinct equality-constrained quadratic programs and verify budget, target, and other-factor exposures explicitly. Solve the small constraint-system linear equations rather than forming full inverses. Inspect conditioning of the loading information matrix, residual-variance positivity, portfolio squared norms, gross exposures, and sensitivity to normalization.

The source is primarily a statistical and asset-pricing comparison, not an implementable net-return backtest. Loadings and basis portfolios are evaluated within five-year samples; continuous listing, daily microstructure effects, shorting, financing, turnover, and trading costs are material limits. The bootstrap does not remove model misspecification or create independent future performance evidence.

The strongest lesson is to evaluate the entire route from estimated factor structure to traded basis. A statistically attractive loading estimate can still produce a fragile portfolio if the formation constraints demand too much precision from noisy cross-sectional differences. Relaxing an arbitrary target loading while retaining diversification and neutrality can be economically more valuable than insisting on unbiased recovery in the chosen latent-factor units.
