# 1. Metadata

- **Title:** On Using Statistical Factor Models in Optimizing Long-Only Portfolios
- **Author(s):** Patrick Burns
- **Year:** 2003
- **Journal/Venue:** Working paper / technical note (no formal journal venue identifiable from the file)

# 2. Problem statement

The paper asks a narrow implementation question with large practical consequences: **in benchmark-relative long-only portfolio optimization, how should the benchmark enter the covariance matrix, and do statistical factor models outperform sample covariance estimates once the benchmark is handled correctly?** The objective is minimum tracking-error optimization, not alpha maximization.

# 3. Approach (short)

The method is empirical but built around a precise quadratic-form argument. Burns compares rolling out-of-sample realized tracking errors for long-only minimum-tracking-error portfolios built from different covariance estimators, especially statistical factor models. The key design variation is the treatment of the benchmark: include it as another asset, use benchmark-relative returns, or add it mathematically to the covariance matrix. The paper’s central claim is that only the last procedure correctly preserves the benchmark covariances implied by the risk model.

# 4. Approach (detailed)

1. **Optimization target**

   Let $x$ be the portfolio weights on the investable assets and $w_b$ the benchmark weights. Let $V$ be the covariance matrix of asset returns. The tracking-error variance is
   $$
   \operatorname{TE}^2(x)
   =(x-w_b)^\top V (x-w_b)
   =x^\top Vx-2x^\top Vw_b+w_b^\top Vw_b.
   $$
   The optimization problem is therefore
   $$
   \min_x (x-w_b)^\top V (x-w_b)
   $$
   subject to long-only and implementation constraints. In the experiments, portfolios are of size 20 or 50, weights are capped at $10\%$, and there is no expected-return vector.

2. **Three benchmark treatments**

   The paper studies three ways to incorporate the benchmark.

   **(a) Include the benchmark as a separate asset in the return matrix.**

   One appends the benchmark return series and estimates a larger covariance matrix directly.

   **(b) Use benchmark-relative returns.**

   One transforms each asset return to $r_i-r_b$, estimates a covariance matrix of relative returns, and then optimizes with no explicit benchmark asset.

   **(c) Add the benchmark mathematically to the covariance matrix.**

   This is the paper’s preferred construction. If $V$ is the covariance matrix of the benchmark constituents and $w_b$ is the vector of benchmark constituent weights, then
   $$
   c_b = Vw_b
   $$
   is the vector of covariances between each asset and the benchmark, and
   $$
   \sigma_b^2=w_b^\top V w_b
   $$
   is the benchmark variance. Thus the augmented covariance object is not estimated from a separate return series; it is implied by the same covariance model $V$.

   This is exact algebra. Once $V$ is specified, the benchmark covariance structure is already determined by $w_b$. Estimating or regularizing it separately can break that identity. With an unmodified sample covariance and exactly the same observations and linear benchmark returns, the alternative constructions are algebraically equivalent; finite-sample noise alone does not break linear covariance identities.

3. **Why the “mathematical addition” is correct**

   The benchmark-relative objective only depends on $V$ and $w_b$. Expanding the TE objective gives the cross term $x^\top Vw_b$. If one separately fits a restricted factor model, regularizes, or nonlinearly preprocesses benchmark and asset returns, one no longer guarantees consistency between:
   $$
   \operatorname{Cov}(r_i,r_j),\qquad
   \operatorname{Cov}(r_i,r_b),\qquad
   \operatorname{Var}(r_b).
   $$
   But if the benchmark truly is the weighted combination $r_b=w_b^\top r$, then the only internally coherent values are
   $$
   \operatorname{Cov}(r,r_b)=Vw_b,\qquad
   \operatorname{Var}(r_b)=w_b^\top Vw_b.
   $$
   This is the paper’s main mathematical point.

4. **Risk-model estimators**

   The paper focuses on statistical factor models for $V$. Two standard constructions are discussed:

   - maximum likelihood factor analysis;
   - principal-factor methods.

   In the principal-factor implementation, the number of factors $k$ is chosen to explain a target fraction of total variance, using the eigenvalues of the sample covariance matrix. If $\lambda_1\ge \cdots \ge \lambda_N$ are the eigenvalues, choose the smallest $k$ such that
   $$
   \frac{\sum_{j=1}^k \lambda_j}{\sum_{j=1}^N \lambda_j}
   $$
   reaches the desired proportion of explained variability.

   Outliers are treated by winsorization. Let $\mu$ be the median and $\sigma$ a robust scale estimate based on the MAD. Then observations are clipped to $[\mu-c\sigma,\mu+c\sigma]$.

5. **Experimental design**

   - 200 U.S. stocks.
   - Rolling estimation windows of 100 or 250 daily returns.
   - Each optimization is evaluated over the next 60 trading days.
   - Benchmark is artificial, built from the full-sample minimum-variance portfolio of the universe, to isolate covariance-estimation issues.

   The evaluation metric is **realized tracking error**, not in-sample objective value.

6. **Main result**

   The dominant empirical result is:

   - benchmark handling matters more than the choice between factor and sample covariance;
   - adding the benchmark mathematically to the covariance matrix is decisively better than either alternative;
   - factor models outperform sample covariance **only when benchmark treatment is correct**.

   This is consistent with the algebra above. The factor model’s benefit is primarily in estimating $V$. If benchmark covariances are then mis-specified by construction, that benefit is partly destroyed.

7. **What is and is not proved**

   The paper contains no asymptotic theorem. Its “proof” component is exact linear algebra:

   - if $r_b=w_b^\top r$, then the benchmark covariances must equal $Vw_b$;
   - therefore TE optimization should use those implied covariances;
   - alternative model-fitting procedures need not preserve linear aggregation. Ordinary sample covariances on the same unmodified data do preserve it.

   The superiority claim about realized TE is empirical rather than theoretically proved.

**Additional mathematical details**

If the benchmark really is $r_b=w_b^\top r$, then the joint covariance of the asset vector and the benchmark is
$$
\widetilde V=
\begin{pmatrix}
V & Vw_b\\
w_b^\top V & w_b^\top V w_b
\end{pmatrix},
$$
which is automatically positive semidefinite because it is the covariance matrix of $(r^\top,r_b)^\top$. The “add the benchmark mathematically” prescription is exactly the statement that one should use this algebraically implied $\widetilde V$, not re-estimate the last row and column from a separate benchmark series.

That distinction matters because all three benchmark treatments solve the same quadratic program only if they produce the same cross term $x^\top Vw_b$. The paper’s empirical finding can therefore be read as a measurement-error result: factor models help only after the benchmark covariances are imposed in a way that is internally coherent with the estimated $V$.

# 5. Domain of applicability

- The method applies to **benchmark-relative variance minimization** for long-only equity portfolios.
- The benchmark must be representable as a weighted combination of assets in the covariance universe, or at least its constituent weights must be known relative to that universe.
- The benchmark-handling result is quite general: it is about quadratic tracking-error algebra, not specific to statistical factor models.
- The empirical conclusions about factor models are narrower:
  - one data set;
  - one family of long-only constrained optimizations;
  - no expected returns;
  - no turnover penalty.
- The paper supports a stronger claim about **benchmark incorporation** than about the universal superiority of any particular factor estimator.

# 6. Source, date, and model coverage

[Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/Burns_  On Using Statistical Factor Models in Optimizing Long-Only Portfolios.pdf>). The ten-page working paper is dated 6 May 2003. It evaluates principal-factor covariance estimates using Burns Statistics' POP optimization software. Maximum-likelihood factor analysis is discussed as an alternative, but the paper does **not** report a full empirical comparison of maximum-likelihood and principal-factor estimators. Its closing section explicitly proposes such a comparison as further work.

The experiment is about sparse, long-only benchmark replication. Although the author expects lessons to carry over to active portfolios, there are no alpha forecasts, transaction-cost penalties, or long-short optimizations in the reported experiment. These omissions define the scope of the evidence.

# 7. A precise optimization representation

Let $n=200$, $b$ be the full-universe benchmark weights, and $x$ be the investor's holdings. A mathematical statement of the tested portfolio class is

$$
\min_x (x-b)^\top V(x-b)
\quad\text{subject to}\quad
\mathbf1^\top x=1,\quad 0\le x_i\le0.10,\quad
\#\{i:x_i>0\}\le K,
$$

where $K$ is 20 or 50. The cardinality limit is part of the asset-selection problem, not a claim that an ordinary unconstrained quadratic optimizer happens to return exactly that number of holdings. The stated number is an upper bound; portfolios generally reach it. Each rebalance is an independent optimization.

Introducing the benchmark as an extra position gives the augmented matrix

$$
\widetilde V=
\begin{pmatrix}I\\b^\top\end{pmatrix}
V
\begin{pmatrix}I&b\end{pmatrix}.
$$

The augmented holdings $(x^\top,-1)^\top$ have variance equal to tracking-error variance. The matrix is necessarily singular when the benchmark is an exact linear combination of constituents: the vector $(b^\top,-1)^\top$ has zero variance. This is correct economic redundancy, not an estimation defect. An optimizer that insists on strict positive definiteness may perturb the matrix; Burns expects small perturbations to be immaterial. A cleaner implementation can optimize directly in constituent active weights and avoid introducing the redundant variable.

The covariance universe must include every benchmark constituent. If the investable set is a subset, retain the remaining constituents in the risk model so that covariance with the omitted portion of the benchmark is still represented. Adding an unrelated benchmark series is not the same operation as algebraically representing a known constituent portfolio.

# 8. A qualification about the sample-covariance comparison

The source reports differences among the three benchmark treatments even for the sample-variance experiments and attributes them to finite observations. This explanation requires qualification. Suppose $R$ is one return matrix, $r_b=Rb$ with fixed weights, and $S$ is its ordinary centered sample covariance. Covariance is equivariant under linear transformations, hence

$$
\widehat{\operatorname{Cov}}(r,r_b)=Sb,
\qquad
\widehat{\operatorname{Var}}(r_b)=b^\top Sb
$$

exactly, at every sample size. Moreover, if $A=I-\mathbf1b^\top$, benchmark-relative returns have covariance $ASA^\top$. Since $\mathbf1^\top x=1$,

$$
x^\top ASA^\top x=(x-b)^\top S(x-b).
$$

Thus finite-sample estimation error by itself cannot make these algebraically identical calculations different. Nonlinear winsorization performed separately after transformation, differing return definitions or time weights, numerical adjustments, changing benchmark weights, or heuristic optimization can break equivalence. The paper does not isolate which mechanism explains all of its sample-covariance differences. This is a limitation of the empirical attribution, not a reason to discard its advice to maintain consistent benchmark exposures.

For a fitted low-rank factor model, the distinction is much more direct. Factor fitting to the augmented universe or to relative returns need not commute with linear transformation. The residual restrictions of a factor model can also be inconsistent with treating an exact constituent portfolio as a new independently modeled asset. Algebraic augmentation preserves the original model's implied covariance structure by construction.

# 9. Data and evaluation protocol

The source data are daily returns on 200 U.S. equities from January 2, 1996 through November 7, 2002, with no missing observations. The universe combines available large- and small-cap stocks and is not a coherent capitalization index. To obtain a benchmark, the author computes a minimum-variance portfolio from the entire sample. Two additional random-weight benchmarks were used to check patterns, but only the minimum-variance benchmark's results are published.

At each estimation date, the preceding 100 or 250 trading days are used for the usual experiments. Realized tracking error is measured over the following 60 trading days and averaged over 24 evaluation periods. Experiments requiring up to 1,000 observations use only 12 evaluation dates, beginning December 15, 1999 and ending August 5, 2002. Their numerical levels should not be compared directly with the 24-period results as though the test samples were identical.

Using a full-history benchmark creates a look-ahead element in the benchmark design, even though each covariance estimate and portfolio is computed from preceding data. The benchmark is intended to isolate covariance-model behavior, not to constitute a fully implementable historical investment strategy. An important robustness test would use a predetermined real index with point-in-time constituents and weights.

# 10. Magnitudes of the reported tracking errors

The table below selects the 50 percent explained-variance factor models from Table 1 and the sample-covariance results from Table 2. Values are the paper's average realized tracking errors in percent.

| Maximum holdings | Estimation observations | Factor: benchmark in returns | Factor: relative returns | Factor: algebraic benchmark | Sample: algebraic benchmark |
|---|---:|---:|---:|---:|---:|
| 20 | 250 | 6.86 | 4.52 | 2.12 | 2.27 |
| 20 | 100 | 7.66 | 5.87 | 2.25 | 3.02 |
| 50 | 250 | 5.75 | 3.99 | 1.05 | 1.09 |
| 50 | 100 | 6.45 | 5.23 | 1.07 | 1.71 |

The largest differences concern benchmark treatment. Conditional on algebraic benchmark construction, the factor-model gain over sample covariance is more modest with 250 observations and much larger with 100 observations. The latter case has fewer observations than assets and illustrates the value of imposing structure on a noisy covariance estimate.

At 250 observations and 20 holdings, increasing explained variance from 20 to 90 percent improves the separately included benchmark result from 7.99 to 4.83, and the relative-return result from 5.87 to 3.76. The algebraic benchmark result instead stays close to 2.1–2.2. Adding factors partly repairs benchmark covariance errors in the first two procedures; it is not strong evidence that the same large factor count is optimal in a coherently constructed model.

The author suggests approximately one-half explained variance as a reasonable default, but does not establish a universal optimum. With the benchmark added algebraically, changing factor count often has little effect for 50-stock portfolios. The longer-window tests are noisy and do not reveal a reliable monotonic rule for choosing explained variance as a function of sample size.

# 11. Factor estimation, robustification, and recency weights

The principal-factor procedure starts from scaled eigenvectors of the sample covariance matrix. The paper compares zero, one, ten, and one hundred iterations. When the explained-variance target and iteration count are both high, out-of-sample tracking error can deteriorate, especially with only 100 observations. For example, with 50 holdings, 100 observations, and a 90 percent target, tracking error rises from about 1.06 at zero iterations to 1.31 at ten iterations. More numerical convergence in a noisy model is not automatically better statistical estimation.

Winsorization uses the sample median and the consistently scaled MAD,

$$
\widehat\sigma=1.4826\operatorname{median}_t|r_t-\operatorname{median}_s r_s|.
$$

Critical values from 1 through 4 and infinity are compared. Results are nearly unchanged in this data set: with 50 holdings, tracking errors remain around 1.05–1.08 across the displayed cases. Burns interprets this as little evidence that ordinary heavy tails harmed these factor estimates, while retaining winsorization as protection against unadjusted splits or other gross data errors. It does not show that clipping economically real extreme returns is harmless in every risk model.

Recency weighting is linear, with the oldest observation receiving one-third the weight of the newest. This is not exponential EWMA weighting. Across both short and extended estimation windows, its effect is small. In the 1,000-observation, 20-holding case, sample covariance slightly beats the factor model on the published average, but that reversal is driven by one unusually favorable final evaluation period. Dropping it restores the factor-model advantage. This sensitivity emphasizes the limited number of test periods.

# 12. What a practitioner should carry forward

Maintain one coherent model of asset and benchmark risk. Benchmark covariance is a consequence of constituent exposures under that model, not an independent set of parameters to fit without constraints. Evaluate risk estimators on the realized portfolios they produce, because entrywise covariance accuracy and realized tracking error are different objectives.

The empirical design also suggests where additional work is needed: real index constituents, missing and nonsynchronous returns, point-in-time membership, turnover and execution costs, active alpha objectives, and repeated independent evaluation samples. The paper does not quantify statistical significance across all estimator choices, nor does it establish a general optimal factor count. Its strongest transferable result is the consistency requirement for benchmark construction; its estimator rankings remain conditional on the data, sparse long-only portfolio class, and implementation used.
