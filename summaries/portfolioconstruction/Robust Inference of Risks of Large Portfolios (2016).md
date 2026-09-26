# Robust Inference of Risks of Large Portfolios

**Source:** [LargePortfolioRobustRisk_FanLiaoShi_2015.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/LargePortfolioRobustRisk_FanLiaoShi_2015.pdf>)  
**Source coverage:** Full local journal article, including estimator regimes, theorem assumptions and proof sketches, random-weight corollary, simulations, and empirical implementation; external supplementary proofs not included.

## 1. Metadata

- **Title:** Robust Inference of Risks of Large Portfolios
- **Author(s):** Jianqing Fan, Fang Han, Han Liu, Byron Vickers
- **Year:** 2016
- **Journal/Venue:** *Journal of Econometrics*

## 2. Problem statement

The paper asks how to do **valid risk inference for large portfolios when returns are heavy-tailed or the factor model is misspecified**. In particular, can one construct a robust version of the H-CLUB of Fan, Liao, and Shi (2015) that still gives reliable confidence bounds for
$$
w^\top(\hat\Sigma-\Sigma)w
$$
using rank-based dependence estimation and explicitly controlled marginal-scale estimation?

## 3. Approach (short)

The method replaces moment-based covariance estimation with robust rank- and quantile-based estimators under an elliptical model. Correlations are estimated via Kendall’s tau, mapped to Pearson correlations through the elliptical identity
$$
\Sigma_{jk}\propto \sin\!\left(\frac{\pi}{2}\tau_{jk}\right),
$$
and marginal scales are estimated robustly. The sampling variability of the resulting risk estimator is handled with a circular block bootstrap, giving a **Robust H-CLUB**. The core theorems prove CLTs and bootstrap validity.

## 4. Approach (detailed)

1. **Elliptical-model foundation**

   The paper works under an elliptical return structure, which makes rank-based dependence estimation feasible. Under ellipticity, Kendall’s tau and Pearson correlation satisfy
   $$
   \rho_{jk}=\sin\!\left(\frac{\pi}{2}\tau_{jk}\right).
   $$
   This is the bridge between robust rank statistics and covariance estimation.

2. **Robust covariance construction**

   Write
   $$
   \Sigma=D R D,
   $$
   where $D=\operatorname{diag}(\sigma_1,\dots,\sigma_d)$ and $R$ is the correlation matrix.

   The robust estimator uses:

   - a rank-based estimator $\hat T=(\hat\tau_{jk})$ of Kendall’s tau;
   - the transformed correlation estimator
     $$
     \hat R = \sin\!\left(\frac{\pi}{2}\hat T\right)
     $$
     entrywise;
   - robust marginal volatility estimators $\hat D$, obtained either from additional data, from known histories, or from data splitting depending on the setting.

   Then
   $$
   \hat\Sigma = \hat D \hat R \hat D.
   $$

3. **Known-volatility case: CLT**

   If $D$ is known, the paper studies
   $$
   w^\top(\hat\Sigma-\Sigma)w.
   $$
   Let $a=Dw$. Expanding the sine transform entrywise around the population tau matrix $T$,
   $$
   w^\top(\hat\Sigma-\Sigma)w
   =
   a^\top \sin\!\left(\frac{\pi}{2}\hat T\right)a
   -a^\top \sin\!\left(\frac{\pi}{2}T\right)a.
   $$
   A Taylor expansion gives
   $$
   A_1
   =
   a^\top
   \left[
   \cos\!\left(\frac{\pi}{2}T\right)\circ
   \frac{\pi}{2}(\hat T-T)
   \right]a
   $$
   plus a second-order remainder $A_2$. The main term $A_1$ is a U-statistic; the remainder is asymptotically negligible.

   **Theorem 3.1** then proves
   $$
   \sqrt T\,\frac{w^\top(\hat\Sigma-\Sigma)w}{\sigma}
   \Rightarrow N(0,1).
   $$

4. **Circular block bootstrap and Robust H-CLUB**

   Because dependence is serial, the long-run variance is estimated by a circular block bootstrap rather than a closed-form Newey-West calculation. The bootstrap generates blocks of returns, recomputes $\hat\Sigma$, and estimates
   $$
   \hat\sigma^2.
   $$
   The Robust H-CLUB is then
   $$
   U(\gamma)=\Phi^{-1}(1-\gamma/2)\frac{\hat\sigma}{\sqrt T}.
   $$
   **Theorem 3.2** proves bootstrap consistency:
   $$
   \hat\sigma^2=\sigma^2(1+o_P(1)),
   $$
   hence
   $$
   P\!\left(w^\top\Sigma w \in [w^\top\hat\Sigma w-U(\gamma),\,w^\top\hat\Sigma w+U(\gamma)]\right)\to 1-\gamma.
   $$

5. **Unknown volatility cases**

   The paper treats two increasingly realistic cases.

   - **Theorems 3.3 and 3.4:** unknown volatilities, but additional data available to estimate marginal scales robustly.
   - **Theorems 3.5 and 3.6:** unknown marginal volatilities with only the main sample available, handled through data splitting.

   In both cases, the extra scale-estimation error is shown to be asymptotically negligible under growth, mixing, and tail conditions. Thus the same robust interval logic survives.

6. **Why robustness is gained**

   The nonrobust H-CLUB of the 2015 paper effectively depends on moment-based covariance estimation and weak assumptions on fourth moments. Here the first-order term is driven by rank statistics and quantile/robust scale estimators. These reduce sensitivity to extreme observations and avoid requiring a correctly specified factor structure, while retaining the elliptical model and the scale-estimation assumptions.

   The bootstrap also avoids committing to a brittle analytic long-run variance formula for the robust estimator.

7. **Proof logic**

   The proof of Theorem 3.1 is the key:

   - linearize the sine transformation using Taylor expansion;
   - show the quadratic remainder $A_2$ is $o_P(T^{-1/2})$;
   - identify the leading linear term as a U-statistic built from Kendall’s tau;
   - apply U-statistic CLTs under mixing.

   The bootstrap theorem then follows by proving that the block bootstrap consistently reproduces the leading U-statistic variance.

8. **Relation to the 2015 H-CLUB paper**

   Conceptually, this paper is not just a small extension. The 2015 paper says: if the model is approximately correct and moments behave, H-CLUB works. The 2016 paper says: even when returns are heavy-tailed and moment methods are unreliable, one can still obtain a valid confidence upper bound by estimating dependence robustly and using bootstrap inference.

**Additional mathematical details**

The robust covariance estimator rests on the elliptical identity
$$
\Sigma = D R D,
$$
where $D$ is the diagonal matrix of marginal scales and $R$ is the correlation matrix. Under ellipticity,
$$
R_{jk}=\sin\!\left(\frac{\pi}{2}\tau_{jk}\right),
$$
with $\tau_{jk}$ the population Kendall’s tau between assets $j$ and $k$. The paper therefore estimates $R$ by plugging sample Kendall’s taus into the sine map and estimates $D$ by robust marginal scale estimators. This changes the dependence estimator to rank statistics; unknown-scale theory still requires additional moments, including the stated $4+\epsilon$ condition.

The uncertainty assessment is then handled by circular block bootstrap rather than an explicit long-run variance formula. That is important because the scalar object of interest is still
$$
w^\top(\hat\Sigma^{\,rob}-\Sigma)w,
$$
but its dependence structure is inherited from a nonsmooth rank-based estimator. The bootstrap is doing real technical work here: it consistently approximates the sampling law of that scalar statistic under mixing and heavy tails without requiring the analyst to estimate a large fourth-order influence-function variance by hand.

## 5. Domain of applicability

- The theory applies to **large portfolios under heavy tails**, especially when an **elliptical dependence structure** is plausible.
- Robustness is strongest for covariance/risk inference, not necessarily for full portfolio optimization with many additional constraints.
- The results still require:
  - serial mixing conditions,
  - dimensional growth restrictions,
  - enough sample size for block bootstrap and robust scale estimation.
- The paper’s claims are stronger about **coverage of risk-error intervals** than about general superiority of robust covariance estimates in all downstream tasks.


## 6. Inference for portfolio variance, not an unrestricted covariance guarantee

The source is the 2016 *Journal of Econometrics* article by Fan, Han, Liu, and Vickers, despite the local filename referring to the earlier Fan–Liao–Shi work. Its inferential target is the scalar portfolio variance $v(w)=w'\Sigma w$. The paper defines portfolio risk as its square root, but the principal confidence interval is stated for **variance**.

For an interval $[L,U]$ covering a nonnegative variance, an associated volatility interval is $[\sqrt{\max(0,L)},\sqrt{\max(0,U)}]$ when the endpoints are meaningful. An additive variance-error bound should not be reported directly in annualized volatility units. Annualization also requires a justified temporal aggregation convention; multiplying daily variance by a trading-day count assumes away relevant serial covariance of portfolio returns.

The method avoids the excessively conservative uniform bound

$$|w'(\hat\Sigma-\Sigma)w|
\le\|w\|_1^2\|\hat\Sigma-\Sigma\|_{\max}$$

by estimating uncertainty in the particular scalar direction $w$. This gains precision but changes the scope of the guarantee. A pointwise interval for a portfolio is not a simultaneous guarantee over every portfolio searched by an optimizer.

## 7. What the elliptical assumption buys, and what it does not

For continuous elliptical returns with a well-defined covariance, Kendall's tau identifies Pearson correlation through $\rho_{jk}=\sin(\pi\tau_{jk}/2)$. Rank comparisons are bounded and are less sensitive to a few extreme magnitudes than sample covariance. But the identity is a structural model assumption: outside the relevant elliptical class, the sine transform need not equal the Pearson correlation one is trying to estimate.

Thus robustness to heavy tails and some contamination is not robustness to arbitrary distributional misspecification. Elliptical laws can have nonexistent variances, in which case the covariance-risk target itself is undefined. The known-scale dependence estimation is less demanding on tails, but unknown-scale theory imposes additional moment and quantile-regularity conditions.

The source estimates marginal scales through median absolute deviations (MADs), exploiting the fact that their ratio to standard deviation is common across coordinates under ellipticity. The displayed construction uses

$$\hat D_{jj}=\widehat{MAD}_j
\frac{\hat\sigma_1}{\widehat{MAD}_1}.$$

The anchor $\hat\sigma_1$ is an ordinary sample standard deviation in the theoretical specification. Accordingly the entire method is not composed exclusively of bounded-influence statistics. The paper suggests averaging scale ratios across coordinates and mentions robust alternatives for estimating the common factor. The normalization is necessary because MAD is not numerically equal to standard deviation, and the normal-distribution conversion constant is not correct for every elliptical radial distribution.

## 8. The three information regimes are genuinely different

**Known marginal scales.** Estimate the correlation matrix from the main sample and form $D\hat RD$. This isolates the uncertainty in dependence. Treating fitted GARCH scales as known can be a practical approximation, but it is not justified merely by calling the fitted model parametric; actual scale-estimation error must be small enough for the approximation.

**Additional historical data.** Use a longer marginal history of length $T_h$ to estimate scales, while using the more recent joint sample of length $T$ for correlations. The histories can overlap. The theoretical premise is that marginal distributions remain stable over the longer history even if joint dependence is only locally stationary. Growth conditions make scale error negligible at the correlation-inference rate.

**No additional history.** Estimate scales using all $T$ observations but correlations using a shorter terminal subsequence of length $T_s\asymp T^{1-\delta}$. This is not an ordinary disjoint half-sample split. The scale estimate uses the larger dataset, including the subsequence. The asymptotic rate becomes $\sqrt{T_s}$ and the confidence width uses $T_s$, not $T$.

The point of the smaller correlation sample is to make the scale uncertainty of lower order relative to the dependence estimator. It sacrifices some efficiency to obtain the theorem. The paper also tests using the full sample for both pieces and reports useful empirical performance, but that practical variant should not be silently presented as identical to the proved split-sample result.

## 9. Linearization, exposure control, and the bootstrap

The sine transformation has a bounded second derivative. Under suitable uniform concentration of Kendall estimates, its quadratic remainder is controlled by the squared maximum tau error times the portfolio's gross exposure. This is why bounded $\|w\|_1$ is central: a long–short portfolio with exploding gross exposure can amplify many small dependence errors.

In the known-scale theorem, the assumptions include bounded gross exposure and covariance entries, a nonvanishing asymptotic variance, suitable polynomial $\phi$-mixing, and $\log d=o(\sqrt T)$. The dimension can be large, but it is not unrestricted relative to sample size. The unknown-scale results add conditions; the source explicitly notes a requirement for marginal moments of order $4+\epsilon$ in that setting. The original shorthand that this procedure avoids fourth moments without qualification is therefore too strong.

The first-order term is a weighted U-statistic built from pairwise sign comparisons. A Hoeffding-type projection supplies its leading time-series component, and mixing conditions support a central limit theorem. The asymptotic variance includes temporal dependence. An iid bootstrap would fail to reproduce that dependence in general.

The circular block bootstrap extends the series periodically, draws blocks of consecutive **joint return vectors**, and reconstructs a bootstrap sequence. It recalculates the rank-based correlation estimator while holding the separately estimated scale matrix fixed, reflecting the theoretical assumption that scale uncertainty is negligible. The bootstrap standard deviation of the scalar risk estimate gives

$$U(\gamma)=\Phi^{-1}(1-\gamma/2)\frac{\hat\sigma}{\sqrt{T_{\rm eff}}},$$

with $T_{\rm eff}=T$ or $T_s$ as appropriate. The quantile is the upper standard-normal quantile $1-\gamma/2$. This makes the sign and confidence convention explicit.

Block length must grow while remaining short relative to the full sample under the relevant theory. Finite-sample sensitivity is still worth examining; weak dependence does not make every block size equally valid. The bootstrap does not automatically protect against structural breaks or dependence outside the assumptions.

## 10. Estimated weights and positive-definite repair

The paper does address random estimated weights, but under a strong additional concentration condition controlling coordinatewise relative errors around a target $w$. Its corollary is not a blanket guarantee for any portfolio selected by a high-dimensional optimizer using the same observations. Coordinates near zero, changing active sets, and unstable weight estimates require particular care when attempting to apply that relative-error condition.

The elementwise sine-transformed tau matrix is not guaranteed to be positive definite in finite samples. This can create problems for minimum-variance optimization. In the empirical section the authors apply Higham's positive-definite repair when necessary. The repair is an implementation modification; its statistical effect should not be assumed negligible without checking the size of the perturbation. Risk inference for a fixed scalar and optimization over a repaired covariance matrix are related but distinct tasks.

The empirical optimization also displays an exact gross-exposure condition $\|w\|_1=c$. For $c>1$, this equality specifies a nonconvex set in general. A cap $\|w\|_1\le c$ is a different, convex restriction and cannot be silently substituted when reproducing reported results.

## 11. Numerical evidence and practical use

The simulations study heavy tails, noise contamination, and Gaussian comparisons. Robust H-CLUB generally gives more useful coverage than the original moment-based procedure in the adverse settings, while the uniform maximum-entry bound is much more conservative. Known scales yield appreciably tighter inference, confirming that scale estimation remains economically relevant even when the theoretical construction makes it asymptotically negligible.

The historical application uses 100 size/book-to-market portfolios from July 2008 through June 2012. Covariance estimates use the preceding 63 daily observations for each 21-day holding period; the additional-history variant uses 84 days for marginal information. Strategies include equal weight and minimum variance at different gross exposures. The holding-period realized covariance is an evaluation proxy estimated from only 21 observations, not the unobservable exact population covariance. Empirical interval comparisons must therefore be interpreted with that sampling noise in mind.

The strongest practical use is to report uncertainty around a specified portfolio's covariance risk rather than treating a point forecast as exact. Record the information regime, effective sample size, scale normalization, elliptical assumption, bootstrap design, and whether holdings were estimated from the same data. The method substantially relaxes some tail and factor-model requirements, while retaining explicit distributional, exposure, dependence, and rate conditions. Full proofs are referred by the article to supplementary material; the local article provides theorem statements and proof sketches.
