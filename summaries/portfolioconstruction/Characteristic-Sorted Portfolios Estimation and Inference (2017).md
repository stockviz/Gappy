# Characteristic-Sorted Portfolios Estimation and Inference (2017)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/CharacteristicPortfolios_Cattaneo_2017.pdf>), 47 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Characteristic-Sorted Portfolios: Estimation and Inference
- **Author(s):** Matias D. Cattaneo, Richard K. Crump, Max H. Farrell, Ernst Schaumburg
- **Year:** 2017
- **Journal/Venue:** Federal Reserve Bank of New York Staff Report No. 788 (August 2016, revised May 2017)

# 2. Problem statement

The paper asks: **when is portfolio sorting a statistically valid estimator of characteristic-return relations, and how should the number of portfolios be chosen?** Formally, the paper treats portfolio sorts as nonparametric estimators of

$$
\mu(z)=E[R_{it}\mid z_{it}=z]
$$

or, more generally,

$$
R_{it}=\mu(z_{it})+x_{it}^\top \beta_t+\varepsilon_{it},
$$

where $z_{it}$ are sorting characteristics and $x_{it}$ are linear controls. The goal is valid inference for objects such as

$$
\mu(z_H)-\mu(z_L),
$$

and a data-driven rule for the number of portfolios $J_t$.

# 3. Approach (short)

The paper is a nonparametric asymptotic analysis of portfolio sorting with estimated quantile partitions. It builds a general estimator that allows multiple sorting characteristics and linear conditioning variables, derives a pointwise CLT and two valid standard-error estimators, and then develops a higher-order mean-square-error expansion. The higher-order expansion yields an inference-optimal number of portfolios, showing that the common fixed choice of 5 or 10 portfolios is not generally justified.

# 4. Approach (detailed)

## 4.1 Statistical model

The paper’s general model is

$$
R_{it}=\mu(z_{it})+x_{it}^\top \beta_t+\varepsilon_{it},
$$

where:

- $z_{it}\in\mathcal Z\subset\mathbb R^d$ are the characteristics to be sorted on nonparametrically;
- $x_{it}\in\mathbb R^{d_x}$ are controls entering linearly;
- $\mu(\cdot)$ is the object of interest.

The additive separation is important: it allows portfolio sorts to remain nonparametric in $z$ while controlling parametrically for $x$.

## 4.2 Portfolio-sort estimator as a partition estimator

At each date $t$, split each sorting characteristic into $J_t$ quantile bins using empirical quantiles. For $d>1$, the portfolios are Cartesian products of the marginal bins. Let $\hat P_{jt}$ denote the portfolio containing a target point $z$, and $\hat N_{jt}$ the number of assets in that cell.

The date-$t$ estimator is a portfolio average within the cell containing $z$, optionally after controlling for $x_{it}$. Averaging over time yields

$$
\hat\mu(z)=\frac1T\sum_{t=1}^T \hat\mu_t(z).
$$

This is exactly the object used in empirical finance, but the paper interprets it explicitly as a **partition regression estimator with estimated quantile-spaced bins**.

## 4.3 Pointwise CLT

Theorem 1 states that under smoothness, moment, and rate conditions,

$$
V(z)^{-1/2}\big(\hat\mu(z)-\mu(z)\big)=
\sum_{t=1}^T\sum_{i=1}^{n_t}\hat w_{it}(z)\varepsilon_{it}+o_P(1)
\Rightarrow N(0,1),
$$

with variance order

$$
V(z)\asymp \frac{J^d}{nT}.
$$

The weights are

$$
\hat w_{it}(z)=V(z)^{-1/2}
\sum_{j=1}^{J_t^d}\frac{1}{T\hat N_{jt}}
\hat 1_{jt}(z)\hat 1_{jt}(z_{it}),
$$

where $\hat 1_{jt}(\cdot)$ indicates cell membership.

Two points matter:

- the nonparametric variance cost is $J^{d}/(nT)$;
- the smoothing bias is order $J^{-1}$.

Therefore, for asymptotic normality one needs the bias to be negligible after normalization:

$$
\sqrt{\frac{nT}{J^d}}\cdot J^{-1}\to 0,
$$

equivalently

$$
\frac{nT}{J^{d+2}}\to 0.
$$

This is the paper’s undersmoothing condition.

## 4.4 Why high-minus-low spreads are easy

If $z_H$ and $z_L$ lie in different portfolios, then under the paper’s residual orthogonality and sampling assumptions their leading estimation errors are asymptotically uncorrelated; nonoverlap eliminates the within-observation cross-products:

$$
\hat 1_{jt}(z_H)\hat 1_{jt}(z_L)\equiv 0.
$$

Hence for the common object $\mu(z_H)-\mu(z_L)$,

$$
\frac{\hat\mu(z_H)-\hat\mu(z_L)-(\mu(z_H)-\mu(z_L))}
{\sqrt{\hat V(z_H)+\hat V(z_L)}}
\Rightarrow N(0,1).
$$

This explains why spread-portfolio inference reduces to adding the two variances.

## 4.5 Valid standard errors

Theorem 2 proves consistency of two variance estimators.

**Fama-MacBeth-type estimator**

$$
\hat V_{FM}(z)=\frac1{T^2}\sum_{t=1}^T\big(\hat\mu_t(z)-\hat\mu(z)\big)^2.
$$

**Plug-in estimator**

$$
\hat V_{PI}(z)=
\frac1{T^2}
\sum_{t=1}^T
\sum_{j=1}^{J_t^d}
\sum_{i=1}^{n_t}
\frac{1}{\hat N_{jt}^2}
\hat 1_{jt}(z)\hat 1_{jt}(z_{it})\hat\varepsilon_{it}^2 .
$$

The result is

$$
\frac{nT}{J^d}\big(\hat V_{FM}(z)-V(z)\big)\to_P 0,
\qquad
\frac{nT}{J^d}\big(\hat V_{PI}(z)-V(z)\big)\to_P 0.
$$

The contribution here is not merely proposing the estimators; it is proving that the standard Fama-MacBeth practice is actually valid in this nonparametric sorting setting.

## 4.6 Higher-order MSE expansion

Theorem 3 gives the spread-estimator expansion below; the tractable higher-order constants use the known-quantile simplification identified in footnote 7 and the appendix:

$$
\begin{aligned}
& E\!\left[
\big(
\hat\mu(z_H)-\hat\mu(z_L)-(\mu(z_H)-\mu(z_L))
\big)^2
\,\middle|\, Z,X
\right] \\
&\quad =V^{(1)}\frac{J^d}{nT}
+V^{(2)}\frac{J^{2d}}{n^2T}
+\frac{B^2}{J^2} \\
&\qquad +O_P\!\left(\frac1{nT}\right)
+o_P\!\left(J^{-2}+\frac{J^{2d}}{n^2T}\right).
\end{aligned}
$$

Interpretation:

- $J^d/(nT)$: first-order variance;
- $J^{2d}/(n^2T)$: higher-order variance;
- $J^{-2}$: squared bias.

## 4.7 Optimal number of portfolios

The inference-oriented optimal $J_t$ balances the higher-order variance and squared bias, not the first-order variance. The resulting rule is

$$
J_t^\star=
\left\lfloor
\left(
\frac{\bar B^2\, n_t^2\, T}{d\,\bar V^{(2)}}
\right)^{1/(2d+2)}
\right\rfloor.
$$

A feasible rule minimizes a sample analogue of

$$
\widehat{MSE}(J)=
\hat V^{(2)}\frac{J^{2d}}{n^2T}
+\frac{\hat B^2}{J^2}.
$$

The key message is that the optimal number of portfolios is **data dependent** and can be much larger than 10.

## 4.8 Proof logic

The proofs follow the standard nonparametric pattern, but adapted to a finance-specific estimator:

- show the partition estimator admits a linear representation with estimated-quantile indicators;
- control the extra randomness induced by estimated quantiles;
- derive the variance from within-cell averaging;
- show the bias is $O(J^{-1})$ using smoothness of $\mu(\cdot)$;
- prove the Fama-MacBeth and plug-in estimators recover the same leading variance;
- derive the MSE expansion by keeping the second-order variance term rather than stopping at the CLT.

**Additional mathematical details**

For a univariate sort, if $P_{jt}$ denotes the $j$-th estimated quantile cell at date $t$ and $N_{jt}$ its occupancy, then the basic estimator can be written as

$$
\hat\mu(z)=
\frac1T\sum_{t=1}^T\sum_{j=1}^{J_t}
1\{z\in P_{jt}\}
\frac1{N_{jt}}
\sum_{i=1}^{n_t}1\{z_{it}\in P_{jt}\}R_{it}.
$$

The proof of Theorem 1 decomposes $\hat\mu(z)-\mu(z)$ into a within-cell sampling fluctuation of order $(J^d/(nT))^{1/2}$, a smoothing bias of order $J^{-1}$, and an extra remainder from using estimated quantiles instead of fixed partitions. The last term is shown to be asymptotically negligible under Assumptions 1-4.

This is why the higher-order MSE expansion is the real design result:

$$
\operatorname{MSE}\{\hat\mu(z)\}=
V^{(1)}\frac{J^d}{nT}
+V^{(2)}\frac{J^{2d}}{n^2T}
+\frac{B^2}{J^2}
+o(\cdot).
$$

The usual practice of fixing $J=5$ or $10$ ignores both the bias term and the second-order variance term, which is exactly the behavior the paper proves is not generally inference-optimal.

# 5. Domain of applicability

- The results apply to **portfolio-sorting estimators** with one or a few continuous characteristics and large cross sections.
- The curse of dimensionality is real: with $d$ sorting characteristics, variance scales with $J^d$ and empty/near-empty cells become a serious issue.
- The paper explicitly shows that standard practice with a fixed $J\in\{5,10\}$ is not generally justified.
- The proofs support multi-characteristic sorting only when rate conditions keep cells nonempty. In practice, this sharply limits $d$.
- The framework is strongest for inference on characteristic spreads and partial means; it says less about welfare, trading costs, or optimal factor construction once one moves outside the portfolio-sort estimator itself.

## Precise estimand and interpretation of a portfolio sort

The checked document is Federal Reserve Bank of New York Staff Report 788, originally August 2016 and revised May 2017, rather than a separately verified final journal version. Its purpose is statistical inference on a characteristic–return relationship. It does not solve a utility-maximizing allocation problem or claim that its selected portfolio count maximizes an investor's net return.

The principal estimand is $\mu(z)$ at a **fixed characteristic value**. As the cross-sectional distribution shifts, the portfolio containing that value can change rank. This differs from always taking, for example, the fifth decile, whose characteristic values vary over time. For an extreme high-minus-low spread, the two procedures coincide when the fixed evaluation points remain in the extreme cells. For interior points they are generally different. This distinction is essential when interpreting the smooth estimated curves produced by averaging differently located step functions across dates.

A difference $\mu(z_H)-\mu(z_L)$ tests equality at two selected points. A significant difference does not establish monotonicity everywhere between those points. The paper also discusses shape restrictions and other linear functionals, but its basic two-point test is not a full shape test. Similarly, a nonzero characteristic spread is not automatically a risk-adjusted anomaly under a specified asset-pricing model.

With controls, the target is the nonparametric component in the maintained additive model

$$
E[R_{it}\mid z_{it},x_{it},\mathcal F_t]=\mu(z_{it})+x_{it}^\top\beta_t.
$$

The coefficients on controls can vary over time. The function $\mu$ is held fixed in the main treatment; an arbitrary time-varying relationship is not covered by simply calling the estimator a time average. A control that is a deterministic function of the sorting characteristics creates identification problems because its effect cannot be separated from an unrestricted $\mu$. The assumptions require nondegenerate variation in controls after conditioning on the sort variables.

## Computation as a partially linear regression

At each date form the matrix $B_t$ of cell indicators and regress returns jointly on $B_t$ and $X_t$. With all cell indicators present, do not add a redundant intercept. By the Frisch–Waugh–Lovell identity,

$$
\hat\beta_t=(X_t^\top M_{B_t}X_t)^{-1}X_t^\top M_{B_t}R_t,
\qquad M_{B_t}=I-B_t(B_t^\top B_t)^{-1}B_t^\top.
$$

The fitted cell intercept is the cell mean of $R_{it}-x_{it}^\top\hat\beta_t$. Average the intercept for the cell containing the desired $z$ over time. This is an implementable interpretation of the more elaborate indicator notation.

This procedure differs from regressing the **characteristic** on controls and sorting its residuals. Residual sorting corresponds to a model such as $R=\mu(z-x^\top\gamma)+\epsilon$, rather than $R=\mu(z)+x^\top\beta+\epsilon$. The two impose different relationships between characteristics, controls and returns; they are not interchangeable implementations of the same adjustment.

Independent double sorts use Cartesian products of marginal quantile bins. If each of $d$ characteristics has $J_t$ bins, there are $J_t^d$ potential cells. Marginally balanced bins do not imply balanced intersections, particularly with correlated characteristics. Conditional sorts instead subdivide within preceding cells and avoid empty cells by construction, but compare different characteristic ranges. The article's example is credit ratings within size groups: the highest rating group among small firms can have lower ratings than the lowest group among large firms. Conditional ranks therefore answer a different question.

An additive nonparametric model, $\sum_{\ell=1}^d\mu_\ell(z_\ell)$, can reduce the dimensionality burden at the cost of ruling out unrestricted interactions. Including some variables as linear or polynomial controls makes a related tradeoff. None of these strategies removes the need to specify what comparisons are economically meaningful.

## Assumptions behind the normal approximation

The sampling framework makes observations within each date conditionally i.i.d. given a common information field $\mathcal F_t$. It allows common shocks, conditional heteroskedasticity and lagged-return characteristics. The support is a time-invariant product of compact intervals, with density regularity ensuring nonnegligible cell probabilities. The regression function is continuously differentiable. Controls have suitable tail behavior, smooth conditional means and a nonsingular conditional covariance after the nonparametric component is removed.

The panel is allowed to be unbalanced but its cross-sectional sizes grow proportionally: $n_t=\kappa_t n$ with $\kappa_t$ uniformly bounded away from zero. Correspondingly $J_t$ has a common asymptotic order $J$. The central restrictions are

$$
\frac{J^d\log^2(\max\{J^d,T\})}{n}\to0,
\qquad
\frac{\sqrt{nT}}{J^{d/2+1}}\to0,
$$

with $T/n\to0$ when linear controls are included. The first ensures enough observations per cell uniformly over dates. The second makes the $O(J^{-1})$ smoothing bias negligible relative to the standard error.

For intuition, let $T\asymp n^B$ and $J\asymp n^A$. Ignoring logarithms, admissible exponents satisfy

$$
\frac{1+B}{d+2}<A<\frac1d,
$$

so feasibility requires $Bd<2$. If the time dimension grows nearly as fast as the cross section, even two sorting characteristics are near the boundary of what the theory supports. More observations through time reduce sampling error without automatically eliminating the within-cell approximation bias, which explains why a long time series can make a fixed coarse sort problematic.

The asymptotic proof decomposes the error into smoothing bias, a weighted residual sum, error from estimated control coefficients, and a negligible event where cell or regression inverses fail. The martingale central limit argument concerns the **weighted residual innovations**, not raw stock returns. Accordingly, the paper's accommodation of serially predictable returns does not validate unadjusted standard errors for arbitrary serially correlated residuals or omitted common return factors. In a new application one must check that the information and dependence assumptions used in the proof match the data design.

The leading variance follows from squared averaging weights:

$$
V(z)=\frac1{T^2}\sum_t\sum_j\frac{1\{z\in P_{jt}\}}{N_{jt}^2}
\sum_{i:z_{it}\in P_{jt}}\operatorname{Var}(\epsilon_{it}\mid\text{conditioning information}),
$$

under the orthogonality conditions of the asymptotic representation. This produces $V(z)\asymp J^d/(nT)$. The weight-based expression is also the clearest way to implement the plug-in estimator without confusing a variance of an average with a within-cell second moment. Residuals should subtract the fitted function at the observation's own characteristic, as well as its control component.

Nonoverlapping cells remove cross-products only under these residual covariance assumptions. Disjoint holdings alone do not make two actual investment portfolios uncorrelated: both can have exposure to the same market shock. The theorem's sum-of-variances formula is a property of its statistical model and leading estimation errors.

## Why the two optimal portfolio counts differ

The expansion separates leading variance, higher-order variance, squared bias and a control-estimation component that does not depend on $J$. For inference, the Gaussian approximation already accounts for the leading variance. The proposed rule minimizes the remaining leading distortion,

$$
\bar V^{(2)}\frac{J^{2d}}{n^2T}+\frac{\bar B^2}{J^2}.
$$

Differentiation gives $J^{2d+2}=\bar B^2n^2T/(d\bar V^{(2)})$. This is **inference-targeted MSE optimality**; it is not a theorem of exact finite-sample coverage-error minimization, maximum test power among all tests, or optimal trading profitability.

For point estimation, retain the leading variance instead:

$$
\bar V^{(1)}\frac{J^d}{nT}+\frac{\bar B^2}{J^2},
\qquad
J_t^{PE}\asymp(n_tT)^{1/(d+2)}.
$$

In one dimension the testing rate is $n_t^{1/2}T^{1/4}$, whereas the point-estimation rate is $n_t^{1/3}T^{1/3}$. Their ratio is proportional to $(n_t^2/T)^{1/12}$, apart from constants. This explains why a large equity cross section can support many more bins for testing than for factor construction. It does not suggest imposing 200 portfolios in every sample.

A significant qualification is in the source's footnote 7 and higher-order proof: the convenient higher-order constants are derived using **known quantiles** to simplify the expansion. The first-order results explicitly allow estimated quantiles; the paper argues that estimating them changes higher-order constants rather than the relevant rates. The feasible tuning rule therefore uses a tractable approximation for those constants. It should not be described as an exact finite-sample optimization accounting for every effect of empirical breakpoints.

The leading bias constant can also be small or vanish for a special target or regression shape. The displayed closed-form rule presumes the relevant constants are nonzero. A mechanically applied formula can behave poorly when the estimated derivative or higher-order variance is unstable.

## The actual feasible tuning procedure

The empirical appendix sets $n=\max_tn_t$ and searches over the portfolio count $J$ at the largest cross section, with an upper grid limit of 400. Other counts scale as

$$
J_t=J(n_t/n)^{1/(d+1)},
$$

subject to integer implementation. The estimated squared bias uses a pilot derivative multiplied by the within-cell average displacement from each evaluation point. The derivative is estimated by averaging local regression slopes based on the 40 closest observations, including ties, at each date. The higher-order variance term uses a Fama–MacBeth-style dispersion calculation of specially scaled portfolio means.

This is more specific than choosing a fixed multiple of a power of the sample size. It incorporates local slope, conditional return variability, panel imbalance, the chosen high/low evaluation points and controls. Since those estimates depend on $J$, the authors search over a grid. Their alternative direct plug-in use of the closed-form expression produces considerably larger counts in their applications.

The theoretical exposition uses equal weighting for clarity; the empirical results use **value-weighted portfolios based on lagged market equity**. A replication must adapt the weighting and residual calculations consistently, rather than combine unweighted formulas with value-weighted returns without checking the resulting variance.

## Empirical sample and findings

The application uses monthly CRSP common shares, share codes 10 or 11, listed on NYSE, AMEX or Nasdaq from January 1926 through December 2015. Delisting returns follow the cited Shumway-based procedure. Quotes substitute for missing closing prices when constructing market equity, and zero shares outstanding generate missing values. The cross section grows from roughly 500 stocks to nearly 8,000 in the late 1990s, then falls to around 4,000; AMEX and Nasdaq entry generate discrete jumps.

Size is the cross-sectionally standardized logarithm of lagged market capitalization. Momentum compounds months $t-12$ through $t-2$ and excludes observations with missing returns in that window. Industry momentum uses 38 SIC-based industries and weights firm momentum by market capitalizations lagged 13 months, avoiding contamination from the momentum-period price changes. Momentum graphs begin in 1927 after constructing lagged returns even where summary tables label the broad sample 1926–2015.

For size, the estimated relation is declining and convex in the all-stock sample: most of the strong effect comes from the smallest firms. At standardized evaluation points $z_H=1.96$ and $z_L=-1.96$, the high-minus-low monthly differences and $t$-statistics are:

| Sample | High-minus-low return | $t$-statistic |
|---|---:|---:|
| 1926–2015 | −3.17% | −6.45 |
| 1967–2015 | −3.69% | −6.46 |
| 1980–2015 | −3.46% | −5.46 |

These points are standard-normal quantile **values applied to a standardized characteristic**; they are not guaranteed to be the empirical 2.5th and 97.5th percentiles of size. Moving inward to approximately ±1.28 changes the latest-period spread to +0.16% with $t=0.36$. Conventional deciles give −0.62% with $t=-1.49$ in 1980–2015. The result is therefore sensitive to which portion of the characteristic distribution defines the comparison. It does not resurrect an equally strong size effect across all small firms.

Restricting to NYSE changes the recent relationship toward an inverted-U shape and removes the robust extreme-small-stock conclusion. The required portfolio counts for the full size sample range roughly from 50 to 250 across dates, depending on the subsample. Counts in a smaller universe need not always be smaller because the bias and variance constants change too.

For momentum, the shape is increasing and concave. At ±1.96, the full-sample high-minus-low return is 2.44% per month with $t=5.25$, compared with 3.09% and $t=4.15$ for 1980–2015. In the latest period, the high and low estimates are 1.50% and −1.59%; the low estimate has $t=-2.45$. Standard deciles instead report a low-portfolio estimate of −0.18% with $t=-0.36$. Finer local comparisons reveal that the losing-stock side is more negative than coarse deciles suggest.

Including industry momentum, its square and cube as linear controls preserves a significant high-minus-low spread in every reported comparison. For example, the 1980–2015 extreme-point spread becomes 3.36% with $t=2.74$. The point spread can rise even as its significance falls because uncertainty also changes. This supports a distinct individual-momentum association under the specified controls, not a universal assertion that all industry-related explanations have been ruled out.

Uncontrolled momentum selects considerably fewer portfolios than size, often peaking near 55. Adding industry controls can raise the selected count substantially. The source interprets this as a change in the bias–variance tradeoff after controls absorb variation. These empirical differences are the main evidence that conventional fixed quintiles or deciles should not be treated as invariant statistical defaults.

## Limits for research and implementation

The historical curves and tests use the available sample to choose a statistical tuning parameter. They are not a fully chronological trading backtest of a rule whose tuning is known at each historical date. The very small-stock and losing-stock endpoints may face liquidity, borrow, bid–ask and delisting issues; the paper does not calculate net investable profits at the reported monthly spreads.

The asymptotic confidence statements are pointwise. Examining many characteristics, endpoints, subsamples or shapes adds selection and multiple-testing questions that a single reported $t$-statistic does not solve. Estimated-beta sorting introduces a first-stage measurement problem and is explicitly left for further work. The procedure also does not explain why a characteristic commands a return premium—risk, mispricing and institutional frictions remain separate economic hypotheses.

The central contribution is to make the portfolio count a statistical tuning choice tied to a stated estimand. A careful application records whether it targets fixed characteristic values or ranks, whether it estimates a factor or tests a relation, which controls and weights define the comparison, and whether panel dimensions and dependence meet the required conditions. Those choices determine what the apparently simple sort can validly say.
