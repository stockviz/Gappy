# Risks of Large Portfolios (2015)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/LargePortfolioRisk_FanLiaoShi_2015.pdf>), 21 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Risks of Large Portfolios
- **Author(s):** Jianqing Fan, Yuan Liao, Xiaofeng Shi
- **Year:** 2015
- **Journal/Venue:** *Journal of Econometrics*

# 2. Problem statement

The paper asks: **how accurately can one estimate the risk $w^\top \Sigma w$ of a large portfolio, and can one construct a usable confidence upper bound for the estimation error?** It focuses especially on factor-model-based covariance estimators in the regime where the number of assets is large, potentially larger than the sample size.

# 3. Approach (short)

The paper develops asymptotic inference for estimated portfolio risk under approximate factor models. It studies three covariance estimators: sample covariance, factor-based covariance with known factors, and POET/factor-based covariance with unknown factors. For each, it derives a CLT for the estimated risk and constructs a **high-confidence level upper bound (H-CLUB)** by estimating the long-run variance of the leading stochastic term. The key technical result is that, for diversified portfolios, the extra error from estimating factors and factor loadings is asymptotically negligible.

# 4. Approach (detailed)

1. **Factor-model setup**

   Asset returns satisfy
   $$
   R_t=Bf_t+u_t,
   $$
   with covariance
   $$
   \Sigma=B\,\Sigma_f\,B^\top+\Sigma_u.
   $$
   The portfolio of interest has weights $w=w_T$. The paper studies the risk
   $$
   w^\top \Sigma w
   \quad\text{or}\quad
   R(w)=\sqrt{w^\top \Sigma w}.
   $$

   A central assumption is diversification:
   $$
   w^\top \Sigma_u w
   $$
   is small enough that idiosyncratic components average out. Equal-weight portfolios are the motivating example.

2. **Sample-covariance estimator**

   Let
   $$
   S=\frac1T\sum_{t=1}^T R_tR_t^\top.
   $$
   The estimated risk error has expansion
   $$
   w^\top(S-\Sigma)w
   =
   \frac1T\sum_{t=1}^T Z_{T,t}+R,
   \qquad
   Z_{T,t}=(w^\top R_t)^2-E[(w^\top R_t)^2],
   $$
   where $R$ is negligible if the estimated weights are close enough to the target weights.

   The long-run variance of the leading term is
   $$
   \sigma_T^2=\gamma_T(0)+2\sum_{h\ge 1}\gamma_T(h),
   \qquad
   \gamma_T(h)=\operatorname{Cov}(Z_{T,t},Z_{T,t+h}).
   $$
   It is estimated with a Newey-West/Bartlett estimator:
   $$
   \hat\sigma^2
   =
   \hat\gamma(0)+2\sum_{h=1}^L\Big(1-\frac hL\Big)\hat\gamma(h).
   $$
   The H-CLUB is
   $$
   U_S(\varepsilon)=z_{\varepsilon/2}\frac{\hat\sigma}{\sqrt T}.
   $$

   **Theorem 4.1** proves
   $$
   \frac{\sqrt T\, w^\top(S-\Sigma)w}{\sigma_T}\Rightarrow N(0,1),
   \qquad
   P\!\left(|w^\top(S-\Sigma)w|\le U_S(\varepsilon)\right)\to 1-\varepsilon.
   $$

3. **Known-factor covariance estimator**

   When factors are observed, estimate loadings $B$ and residual covariance $\Sigma_u$, thresholding the latter. The factor-based risk error is driven asymptotically by
   $$
   \frac1T\sum_{t=1}^T \big((w^\top B f_t)^2-E[(w^\top B f_t)^2]\big).
   $$
   This is the crucial insight: because the portfolio is diversified, the idiosyncratic part of the risk-estimation error is asymptotically negligible. The dominant uncertainty comes from the systematic component.

   A corresponding Newey-West estimator produces
   $$
   U_f(\varepsilon)=z_{\varepsilon/2}\frac{\hat\sigma_f}{\sqrt T}.
   $$

   **Theorem 4.2** shows
   $$
   \frac{\sqrt T\, w^\top(\hat\Sigma_f-\Sigma)w}{\sigma_f}\Rightarrow N(0,1),
   \qquad
   P\!\left(|w^\top(\hat\Sigma_f-\Sigma)w|\le U_f(\varepsilon)\right)\to 1-\varepsilon.
   $$

4. **Unknown factors and POET**

   When factors are unobserved, the covariance estimator is based on principal components (POET):
   $$
   \hat\Sigma_{P,\hat K}=\sum_{j=1}^{\hat K}\hat\lambda_j \hat\xi_j\hat\xi_j^\top+\hat\Omega.
   $$
   The nontrivial technical issue is whether factor estimation error changes the distribution of estimated risk.

   Under the paper’s diversification, dependence, and joint growth assumptions, latent-factor estimation is asymptotically negligible. An associated inverse-covariance consistency rate is
   $$
   \|\hat\Sigma_{P,\hat K}^{-1}-\Sigma^{-1}\|
   =
   O_P\!\left(
   s_N\left(\frac{\log N}{T}+\frac1N\right)^{1/2-q/2}
   \right),
   $$
   so the extra $1/N$ term from latent-factor estimation vanishes as dimension grows.

   **Theorem 4.3** proves
   $$
   \frac{\sqrt T\, w^\top(\hat\Sigma_{P,\hat K}-\Sigma)w}{\sigma_f}\Rightarrow N(0,1),
   $$
   i.e. the same limit as in the observed-factor case. Hence the price of not knowing the factors is asymptotically negligible for risk estimation.

5. **Comparison with sample covariance**

   **Theorem 4.4** compares asymptotic variances and shows the factor-based estimator has slightly smaller asymptotic variance than the sample-covariance estimator. But the paper is explicit: the main gain is not a dramatic variance reduction. The main gain is that factor structure makes the high-dimensional covariance estimation problem manageable and the H-CLUB much tighter than crude matrix-norm bounds.

6. **Why H-CLUB matters**

   A naive error bound would use
   $$
   |w^\top(\hat\Sigma-\Sigma)w|
   \le \|w\|_1^2 \|\hat\Sigma-\Sigma\|_{\max},
   $$
   but in high dimensions this is often much too loose. H-CLUB instead uses the actual stochastic fluctuation scale, which is $T^{-1/2}$, and therefore yields empirically usable uncertainty quantification.

7. **Proof logic**

   The proofs all follow the same template:

   - expand $w^\top(\hat\Sigma-\Sigma)w$ into a leading weakly dependent sum plus remainder;
   - show the remainder is $o_P(T^{-1/2})$;
   - estimate the long-run variance with a Bartlett/Newey-West truncation;
   - apply a mixing CLT (the paper cites Peligrad-type results).

   The genuinely novel part is proving that factor estimation, thresholding, and even latent-factor recovery do not change the leading term for diversified portfolios.

**Additional mathematical details**

The main technical reduction is a decomposition of the risk-estimation error into a factor-driven leading term plus a remainder from estimating the high-dimensional covariance structure. In the approximate-factor model $R_t=B f_t+u_t$,
$$
w^\top(\hat\Sigma-\Sigma)w
=
w^\top B(\hat\Sigma_f-\Sigma_f)B^\top w
+w^\top(\hat\Sigma_u-\Sigma_u)w
+\text{factor-loading remainders}.
$$
Under the paper’s explicit diversification and growth-rate conditions, including bounded gross exposure and sufficiently fast vanishing weighted residual risk, the last two terms are negligible relative to the CLT scale $\sigma_f/\sqrt T$. That is why the same asymptotic variance $\sigma_f^2$ governs both the known-factor and estimated-factor procedures.

This also clarifies what H-CLUB is and is not. The quantity
$$
U(\tau)=z_{\tau/2}\frac{\hat\sigma}{\sqrt T}
$$
is an asymptotic confidence half-width for the scalar error $w^\top(\hat\Sigma-\Sigma)w$; it is not a matrix-norm bound on $\hat\Sigma-\Sigma$. The paper’s contribution is precisely that portfolio-level risk can be estimated much more sharply than the full covariance matrix can.

# 5. Domain of applicability

- The paper applies to **large portfolios** under **approximate factor structure** and **weak temporal dependence**.
- It is strongest for **diversified portfolios**; if $w$ is concentrated, the idiosyncratic terms need not vanish.
- The latent-factor negligibility result depends on a high-dimensional regime where $N$ is large enough relative to $T$.
- The theory is about **risk estimation**, not the optimality of the portfolio weights themselves.
- The paper’s inference claims are mathematically stronger than any claim about portfolio construction welfare or out-of-sample utility.


## Detailed reading of the assumptions and statistical target

The local source is the published article in *Journal of Econometrics* 186 (2015), pp. 367–387, DOI 10.1016/j.jeconom.2015.02.015. Its inferential target deserves particular care. For an estimated weight vector $\hat w$, the relevant error is
$$
\hat w^\top(\hat\Sigma-\Sigma)\hat w.
$$
The population comparison uses the **same portfolio** on both sides. The confidence calculation does not compare the estimated portfolio with an unattainable population-optimal portfolio. Nor does it automatically give a prediction interval for next month's realized variance. Those distinctions matter when this method is added to an optimizer or evaluated with a future realized covariance proxy.

For fixed $w$ and zero-mean observations, the sample-covariance identity is exact:
$$
w^\top(S-\Sigma)w=T^{-1}\sum_t\{(w^\top R_t)^2-E(w^\top R_t)^2\}.
$$
There is no high-dimensional matrix remainder in this identity. Difficulty enters through serial dependence, the changing portfolio as $N,T$ increase, estimation of its long-run variance, and use of data-dependent weights. The sample-covariance inference can be justified directly from assumptions on portfolio returns; it does not intrinsically require a factor estimator.

For factor-based inference the article imposes considerably more than a large number of holdings. The factor dimension is fixed. Factor and idiosyncratic **processes** are independent, have zero means and exponentially controlled tails, and satisfy strong mixing and covariance-summability conditions. Factor covariance is nonsingular; residual covariance has bounded eigenvalues; loadings are bounded. Approximate sparsity is measured by
$$
s_N=\max_i\sum_j|\Sigma_{u,ij}|^q,\qquad 0\le q<1,
$$
with $s_N$ growing slowly relative to both $N$ and $T$. For latent factors, eigenvalues of $B^\top B/N$ remain bounded away from zero and infinity: factors must be pervasive enough to be recovered from the cross section.

The latent-factor central limit theorem also uses a condition of the form $\sigma_f^2 N/T\to\infty$. If the long-run factor variance is bounded away from zero, this is stronger than merely observing $N>T$ in one dataset. The truncation lag must satisfy additional restrictions involving both dimensions. Hence the claim that unknown factors cost nothing asymptotically is a theorem in a particular joint growth regime, not a universal finite-sample property of PCA.

Diversification concerns residual risk relative to the scale of systematic-risk fluctuations. Bounded gross exposure $\|w\|_1=O(1)$ is useful but insufficient by itself. The paper imposes explicit shrinking bounds on $w^\top\Sigma_u w$ involving $s_N,N,T,q$ and $\sigma_f$. Its one-factor, sparse-residual illustration requires the ratio of idiosyncratic to factor risk to be smaller than quantities such as $1/\sqrt{\log N}$ and $\sqrt{N/T}$. Equal weights can satisfy such restrictions when average factor exposure remains nonzero and residual covariance is well behaved. A market-neutral portfolio with $w^\top B=0$ does not satisfy the same nondegenerate factor-dominant regime merely because it contains many assets.

Estimated weights require their own rate conditions. Assumption 4.7 controls $\|\hat w-w\|_1$ relative to long-run variances and logarithmic tail factors. It is not enough simply to say that the optimizer is consistent. In particular, an unstable high-dimensional optimizer or one selected from a very large collection of candidates may fail the stated plug-in conditions. The article does not establish simultaneous coverage after unrestricted strategy search.

## Covariance estimation and confidence-bound construction

With observed factors, estimate loadings by regression, compute residuals, and threshold their sample covariance. Thresholds scale with estimated residual standard deviations and $\sqrt{\log N/T}$. With latent factors, POET removes the leading sample principal components and thresholds the remaining covariance; the threshold scale also includes a $1/\sqrt N$ term reflecting factor recovery. Keep the residual diagonal. Generalized thresholding can use hard or correctly signed soft thresholding. For negative covariance entries, soft thresholding means $\operatorname{sign}(z)(|z|-\tau)_+$, not an unsigned positive-part operation.

Thresholded covariance estimates require attention to positive definiteness. A sufficiently conservative threshold constant supports the paper's theoretical conclusions, but an arbitrary finite-sample threshold choice need not yield a usable positive-definite matrix. This matters when the same estimator is inverted for portfolio formation, although inversion is not required just to evaluate $w^\top\hat\Sigma w$.

To construct the bound, form squared portfolio returns for the sample estimator, or squared estimated systematic portfolio returns for the factor estimator. Estimate their autocovariances and apply the Bartlett weights. If $\hat v=w^\top\hat\Sigma w$, the variance interval is approximately
$$
[\hat v-U,\hat v+U],\qquad
U=z_{\varepsilon/2}\hat\sigma/\sqrt T,
$$
where $z_{\varepsilon/2}$ is the positive upper-tail standard-normal quantile. Although called an upper bound, H-CLUB bounds an **absolute error** with asymptotic probability $1-\varepsilon$; it is not a deterministic worst-case bound.

For volatility, the delta method gives an approximate half-width $U/(2\sqrt{\hat v})$ when variance stays away from zero. One can instead map the endpoints of a variance interval through the monotone square-root function, truncating the lower endpoint at zero. The interval's underlying asymptotic validity still depends on the original assumptions. Confusing a variance standard error with a volatility standard error introduces a factor-of-two error in relative terms:
$$
\frac{\operatorname{SE}(\sqrt{\hat v})}{\sqrt v}
\simeq\frac{\operatorname{SE}(\hat v)}{2v}.
$$
The simulation's RE2 measure uses this volatility interpretation.

Bandwidth choice is material. The paper discusses a plug-in lag rule proportional to $1.447T^{1/3}(s_1/s_0)^{2/3}$, with pilot autocovariance estimates, rather than treating the lag as a free tuning parameter without consequences. It recommends sensitivity checks. The asymptotic conditions require the lag to grow slowly; a familiar sufficient form when the long-run variance is nondegenerate is $L^3=o(T)$, with further restrictions in the latent-factor case. Squared-return dependence can persist after ordinary return autocorrelations have become small.

## Why factor structure does not eliminate systematic sampling uncertainty

Write $s_t=w^\top Bf_t$ and $e_t=w^\top u_t$. Then
$$
(w^\top R_t)^2=s_t^2+2s_te_t+e_t^2.
$$
Under the process-independence and zero-mean conditions, variances of sums decompose into the variance of $\sum s_t^2$, the variance of $\sum e_t^2$, and the variance of $2\sum s_te_t$. The factor estimator removes the latter nuisance contributions asymptotically for diversified portfolios. It still must estimate systematic variance from only $T$ time observations. Adding assets improves factor recovery and residual diversification; it does not create additional independent observations of the market's time-series variance.

This explains why the factor estimator can have a somewhat smaller asymptotic variance while the improvement over the sample estimator is modest for an already diversified portfolio. The striking improvement is relative to a **uniform entrywise covariance bound**, which protects against worst-case alignment of every covariance error. For a specified portfolio, random errors partially cancel. An inverse-covariance consistency rate helps assess construction of weights, but is not itself a proof of the scalar-risk CLT. The proofs additionally control loading errors, weighted residual risk, PCA rotation errors, and the consistency of the long-run variance estimator.

## Simulation design and numerical findings

The simulation is calibrated using the 100 largest S&P stocks as of June 29, 2012 and roughly 1,000 daily observations from July 2008 through June 2012, together with three Fama–French factors. Simulated factors follow a first-order vector autoregression; loadings and sparse idiosyncratic covariances are calibrated to the observed panel. The authors generate many model/portfolio combinations rather than reporting one favorable optimized portfolio. Their main configurations include dimensions from 20 to 600 and gross exposure levels $c=\|w\|_1$.

For a fully invested portfolio, long and short magnitudes satisfy
$$
L-S=1,\quad L+S=c,
\quad L=(c+1)/2,\quad S=(c-1)/2.
$$
Thus $c=1.6$ corresponds to a 130/30 portfolio. These identities clarify the exposure scale; they do not make every method of randomly drawing signed weights uniform on the constrained set.

Diversification substantially reduces residual risk as the cross section grows, with much of the reduction attained by around 150 assets in the reported calibration. At $T=300$, the crude max-entry error bound divided by H-CLUB is approximately 4.18 for POET at $c=1$, 10.83 at $c=1.6$, and 17.06 at $c=2$. The crude bound deteriorates quickly with gross exposure because it carries the factor $\|w\|_1^2$. H-CLUB uses the portfolio's observed fluctuation scale instead.

Reported relative standard errors of volatility are about 4.8–4.9% with 200 observations and 3.46–3.50% with 400 observations, depending on the estimator. These are calibration-specific sampling-uncertainty measures, not universal statements that any portfolio's risk is known to that accuracy after a specified number of months. Coverage experiments compare realized absolute covariance-estimation errors against bounds at different nominal levels. Comparing only an average bound with an average error would not establish coverage; the simulation's exceedance frequencies are the relevant diagnostic.

Overestimating the factor count from three to seven has limited impact in the experiments. This offers evidence of robustness to moderate overfitting in that setup, not a theorem that choosing too few factors or missing an important nonpervasive factor is harmless.

## Empirical application and its interpretation

The empirical panel contains 100 portfolios sorted on size and book-to-market, over July 2008–June 2012. Despite occasional loose terminology in the article, these are not simply 100 industry portfolios. Covariance estimates use a rolling preceding year of daily observations; portfolios are updated monthly. The study considers equal weights and global minimum-variance portfolios at gross exposure levels 1 and 1.6. The risk proxy for the following month uses roughly 21 daily observations.

For equal weights, Table 9 reports average annualized volatility near 20.81%, average absolute risk-estimation error near 11.18 percentage points and a sample-covariance bound near 11.37 points. The corresponding factor and POET figures are similar. For the sample-based minimum-variance portfolio at gross exposure 1, average realized risk is around 14.38%, error 7.00 points and bound 7.44 points; at gross exposure 1.6 the figures are around 11.58%, 4.69 points and 5.17 points. These numbers illustrate how the calculation behaves through a volatile historical period.

They should not be read as clean estimates of coverage against a known population covariance. A short future realized covariance is itself noisy, and its difference from a past-window estimator includes possible changes in the risk process. The theoretical target is population variance under the stipulated stationary process, whereas this backtest uses future realized variance as a proxy. This also explains why the empirical errors can be much larger than the simulation's relative sampling standard errors. The paper evaluates risk measurement, not a net-of-cost return advantage from the portfolio strategy.

## Practical use and boundaries

A defensible application would retain the chosen portfolio's exact weights, record the covariance method, factor specification and sample window, calculate squared portfolio or systematic returns, inspect their serial dependence, estimate the HAC variance, and report both the risk estimate and its uncertainty. Repeating the calculation across plausible HAC lags and factor counts is more informative than displaying a highly precise single number. Any selected gross-exposure restriction should be distinguished from a requirement that exposure equal a particular value; equality at $c>1$ is not the usual convex exposure-cap constraint.

The bound quantifies uncertainty in a quadratic risk estimate under a statistical model. It does not provide a VaR limit, a drawdown guarantee, insurance against regime change, or protection against a poor expected-return forecast. Its central contribution is narrower and useful: even when a full covariance matrix is hard to estimate, the risk of a specified diversified portfolio can admit a tractable, much sharper scalar confidence calculation.
