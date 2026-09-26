# Improving Mean Variance Optimization through Sparse Hedging Restrictions (2015)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioConstruction_GotoXu_2015.pdf>), 27 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

## 1. Metadata

- **Title:** Improving Mean Variance Optimization through Sparse Hedging Restrictions
- **Author(s):** Shingo Goto and Yan Xu
- **Year:** 2015
- **Journal/Venue:** *Journal of Financial and Quantitative Analysis*

## 2. Problem statement

The paper asks how to estimate the inverse covariance matrix for mean-variance portfolio construction when the sample covariance matrix is badly conditioned. In a Markowitz problem, the weight vector is proportional to $\Sigma^{-1}\mu$ or, for the global minimum-variance portfolio, to $\Sigma^{-1}\mathbf 1$. Thus the object that actually drives portfolio choice is not merely $\Sigma$ but the inverse covariance matrix
$$
\Psi=\Sigma^{-1}.
$$
In finite samples, especially when assets are numerous and correlated, the sample inverse covariance matrix is unstable because each stock is effectively hedged by many nearly collinear other stocks. The paper's question is whether one can estimate $\Psi$ directly in a way that shrinks hedge trades and drops redundant hedges, thereby improving out-of-sample minimum-variance performance.

## 3. Approach (short)

The method is sparse precision-matrix estimation for portfolio optimization. Goto and Xu reinterpret each row of $\Psi$ as a hedge portfolio from a regression of one asset on all others. This makes instability in $\Psi$ a multicollinearity problem in hedge regressions. They then estimate the full precision matrix by penalized quasi-maximum likelihood,
$$
\max_{\Psi\succ 0}\;\log\det\Psi-\operatorname{tr}(\hat S\Psi)-\rho \sum_{i\ne j}|\psi_{ij}|,
$$
using the graphical lasso. The resulting sparse inverse covariance matrix is plugged directly into the global minimum-variance rule. The novelty is not covariance shrinkage in general, but shrinkage and subset selection applied exactly to the hedge-trade object relevant for optimization.

## 4. Approach (detailed)

1. **Reinterpret the inverse covariance matrix economically.**

   Let $\Sigma$ be the covariance matrix of stock returns and $\Psi=\Sigma^{-1}=[\psi_{ij}]$ its inverse. The crucial observation, following Stevens, is that the $i$th row of $\Psi$ encodes how stock $i$ is hedged by the rest of the universe. This turns the abstract precision matrix into a collection of hedge portfolios, which makes the portfolio-construction problem more interpretable.

2. **Write the hedge regression for each stock.**

   For stock $i$, regress its return on the other $N-1$ stocks:
   $$
   r_{i,t}
   =
   \alpha_i+\sum_{k\ne i}\beta_{i\mid k} r_{k,t}+\varepsilon_{i,t}.
   $$
   The residual variance
   $$
   \upsilon_i=\operatorname{Var}(\varepsilon_{i,t})
   $$
   is the unhedgeable risk of stock $i$. The regression coefficients define the tracking portfolio of the other stocks that best hedges stock $i$.

3. **Use the Stevens identity linking hedge regressions to $\Sigma^{-1}$.**

   The paper uses the exact identity
   $$
   \psi_{ij}
   =
   \begin{cases}
   -\beta_{i\mid j}/\upsilon_i, & i\ne j,\\[4pt]
   1/\upsilon_i, & i=j.
   \end{cases}
   $$
   Therefore the $i$th row of $\Psi$ is
   $$
   \Psi(i,\cdot)
   =
   \frac1{\upsilon_i}
   \big(-\beta_{i\mid 1},\dots,-\beta_{i\mid i-1},1,-\beta_{i\mid i+1},\dots,-\beta_{i\mid N}\big).
   $$
   This has a direct portfolio meaning: one unit long stock $i$, short the tracking portfolio of the others, and scaled by inverse residual variance.

4. **Explain why classical estimation fails.**

   Estimating each hedge regression by OLS when predictors are highly collinear produces unstable coefficients $\beta_{i\mid j}$. Since those coefficients are rescaled into $\Psi$, instability in the hedge regressions becomes instability in the mean-variance optimizer itself. The paper's contribution is to regularize the hedge-trade object rather than only the covariance matrix.

5. **Formulate the sparse precision-matrix estimator.**

   Instead of estimating each hedge regression separately and then stitching them together, the paper estimates the full inverse covariance matrix in one step by penalized quasi-maximum likelihood:
   $$
   \hat\Psi_\rho
   =
   \arg\max_{\Psi\succ 0}
   \left\{
   \log\det(\Psi)-\operatorname{tr}(\hat S\Psi)
   -
   \rho \sum_{i\ne j}|\psi_{ij}|
   \right\},
   $$
   where $\hat S$ is the sample covariance matrix and $\rho\ge 0$ is the regularization parameter.

   Each term has a clear role:
   - $\log\det\Psi-\operatorname{tr}(\hat S\Psi)$ is the Gaussian precision-matrix likelihood;
   - the $\ell_1$ penalty shrinks off-diagonal entries toward zero;
   - zeros in off-diagonal entries mean zero partial linear correlation; under Gaussian returns they also mean conditional independence. Economically, they remove a marginal linear hedging contribution after controlling for the rest of the universe.

6. **Connect the graphical lasso to hedge-trade shrinkage.**

   The graphical lasso is equivalent to a family of coupled lasso problems. The paper's economic interpretation is:
   - shrink the size of each hedge trade,
   - let candidate hedge assets compete to enter the hedge for stock $i$,
   - soft-threshold marginal hedge contributions,
   - set many off-diagonal precision elements exactly to zero.

   This is better aligned with the optimization problem than shrinking $\Sigma$ itself, because the GMV portfolio uses $\Psi$ directly.

7. **Derive the portfolio rule from the sparse optimizer.**

   The out-of-sample focus is the risky-asset global minimum-variance portfolio:
   $$
   w^{GMV}
   =
   \frac{\Psi\mathbf 1}{\mathbf 1'\Psi\mathbf 1}.
   $$
   Replacing $\Psi$ by $\hat\Psi_\rho$ gives
   $$
   \hat w^{GMV-\hat\Psi_\rho}
   =
   \frac{\hat\Psi_\rho\mathbf 1}{\mathbf 1'\hat\Psi_\rho\mathbf 1}.
   $$
   In the reported experiments, regularizing the hedge relationships produces milder positions and lower turnover than the sample-inverse-covariance GMV rule; these are empirical findings rather than an algebraic guarantee.

8. **State the prediction-based tuning logic.**

   The regularization parameter $\rho$ is selected in training data by predictive likelihood. This matters because the paper is not choosing $\rho$ by in-sample variance minimization, which would simply overfit. Instead it picks the amount of sparsity that best predicts covariance structure in the future and then holds the resulting rule fixed during the out-of-sample test window.

9. **Explain why this differs from Ledoit-Wolf or Jagannathan-Ma.**

   The paper compares against:
   - equal weighting,
   - sample GMV,
   - Jagannathan-Ma no-short-sale GMV,
   - Ledoit-Wolf shrunk covariance GMV,
   - an industry-factor covariance model.

   The conceptual difference is that Ledoit-Wolf regularizes $\Sigma$ and then inverts it, while Goto-Xu regularize the inverse directly. Jagannathan-Ma constrain portfolio weights, while Goto-Xu constrain the hedge relations implicit in $\Psi$. The authors' claim is not that the sparse precision estimator dominates all shrinkage ideas in all settings, but that it targets the object most directly tied to the optimizer.

10. **Proof sketch of the hedge-portfolio identity.**

   The identity between hedge regressions and the precision matrix is the core theoretical device. Partition the covariance matrix so that asset $i$ is isolated from the others. The conditional mean coefficient of asset $i$ on the remaining assets is
   $$
   \beta_i = \Sigma_{-i,-i}^{-1}\Sigma_{-i,i},
   $$
   while the conditional variance is
   $$
   \upsilon_i=\Sigma_{ii}-\Sigma_{i,-i}\Sigma_{-i,-i}^{-1}\Sigma_{-i,i}.
   $$
   By block-matrix inversion, the inverse covariance matrix has diagonal block $1/\upsilon_i$ and off-diagonal block $-\beta_i/\upsilon_i$, which yields the formula above. So the precision matrix is literally the scaled collection of conditional hedge coefficients.

11. **Implementation recipe.**

   To reproduce the method:
   1. estimate the sample covariance matrix $\hat S$ over a rolling training window;
   2. solve the penalized precision-matrix problem with graphical lasso for a grid of $\rho$;
   3. choose $\rho$ by predictive likelihood in the training set;
   4. form the GMV portfolio
      $$
      \hat w_t=\frac{\hat\Psi_{\rho,t}\mathbf 1}{\mathbf 1'\hat\Psi_{\rho,t}\mathbf 1};
      $$
   5. hold for one period and record out-of-sample variance, Sharpe ratio, turnover, and CER net of trading costs;
   6. roll the window and repeat.

## 5. Domain of applicability

The method applies to minimum-variance portfolio construction when the cross section is moderately large and the sample covariance matrix is unstable or nearly singular. It is especially natural when the portfolio problem is really a hedging problem and when sparsity of hedge relations is economically plausible.

Its limitations are clear. The paper's main results concern GMV portfolios, so expected-return forecasting is largely sidestepped. If mean forecasts are central, one still needs a separate model for $\mu$. The approach also depends on a Gaussian/quasi-Gaussian precision-matrix estimation framework and on the idea that many conditional hedge relations are weak enough to be thresholded away. In markets where the true covariance inverse is dense, too much sparsity can bias the hedge structure. Finally, the method is not a full transaction-cost model; lower turnover is an empirical consequence of sparser hedges, not an explicit market-impact optimization.


## Source-specific mathematical clarifications

The source is the December 2015 issue of *JFQA*, volume 50(6), pp. 1415–1441, DOI 10.1017/S0022109015000526; its copyright line is 2016. The paper's likelihood normalization is $T/2$ times the log determinant minus trace, with a penalty $\rho\sum_{i\ne j}|\psi_{ij}|$. After dividing by $T/2$, the normalized penalty is $\lambda=2\rho/T$. This scaling matters when reproducing the reported tuning values in software: a parameter named `rho` in a graphical-lasso package need not use the printed likelihood's units.

The regression identity is a linear-projection identity and does not require normal returns. A zero off-diagonal precision entry says that two returns have zero **partial linear correlation**, or that one does not enter the other's population linear hedge after controlling for the remaining assets. It implies conditional independence under a multivariate Gaussian distribution, not under an arbitrary non-Gaussian return law. Calling the criterion quasi-likelihood makes precisely this distinction useful.

The conditional-variance interpretation of $\upsilon_i$ also needs qualification outside the Gaussian model: it is the unconditional variance of the best linear projection's residual. Conditional variances need not be constant, and the conditional mean need not equal its linear projection. The algebraic identity still holds when the covariance matrix is positive definite.

Sparsity belongs to the **hedge network**. It does not imply a sparse covariance matrix, nor does it force most final portfolio weights to zero. The GMV weight of asset $i$ is proportional to the entire row sum $\sum_j\psi_{ij}$, which generally remains nonzero even if many off-diagonal entries vanish. Indeed, the sparse estimator often produces a broader final portfolio than the long-only GMV benchmark, whose solution concentrates in a few assets. Sparse conditional hedges and sparse security holdings are different design choices.

A useful derivation from the normalized criterion is its first-order condition:
$$
\hat\Psi^{-1}-S-\lambda\Gamma=0,
$$
where $\Gamma_{ii}=0$ because the diagonal is unpenalized, $\Gamma_{ij}=\operatorname{sign}(\hat\psi_{ij})$ for nonzero off-diagonal entries, and $\Gamma_{ij}\in[-1,1]$ at a zero. Thus the fitted covariance $W=\hat\Psi^{-1}$ has the sample diagonal and differs from $S$ by bounded off-diagonal adjustments. This is an explanatory KKT derivation of the estimator. It shows why the procedure can also be interpreted as covariance regularization, despite being formulated in the precision matrix.

In the diagonal limit, the fully invested GMV portfolio becomes inverse-variance weighted, not equal weighted. At intermediate penalties, hedge relations are selected jointly subject to symmetry and positive definiteness. Running separate lasso regressions and assembling the rows independently does not automatically produce either property. The graphical-lasso algorithm solves coupled block problems, updating a covariance block $W_{11}$ and a lasso coefficient vector; its appendix maps those coefficients back into hedge portfolios. The claimed computational tractability comes from this convex structure, not from enumerating all possible sparse graphs.

The article's eigenvalue argument explains its motivation. If $\Sigma=U\Lambda U^\top$, the directions with large covariance eigenvalues become small-eigenvalue directions in $\Sigma^{-1}$. A factor model that explains most total return variance can therefore leave the optimizer sensitive to poorly estimated small-variance directions. This is a reason to assess a risk model by its portfolio consequences; it does not prove that factor models are generally inferior.

## Exact empirical protocol

The tests use monthly returns and a rolling 120-month estimation window, followed by a one-month holding period. The data comprise 100 size/book-to-market portfolios, 48 industry portfolios, their 148-asset combination, 133 international portfolios from 15 developed markets, and 100 separate random sets of 100 individual NYSE/AMEX stocks. The ratios $N/T$ range from 0.40 to 1.23. Ordinary sample-covariance inversion is unavailable for the 148- and 133-asset sets with 120 observations; those are reported as unavailable, rather than silently replaced by a pseudoinverse investment rule.

The regularization parameter is selected from an initial **120-month training period of predictive evaluation**, using a grid with increments of 0.1, and then kept fixed during the subsequent test period. Each predictive evaluation itself uses rolling historical covariance estimates. The three U.S. portfolio datasets train over July 1973–June 1983 and test over July 1983–December 2010, giving 330 test months. International portfolios train over January 1985–December 1994 and test over January 1995–December 2010, giving 192 months. Individual-stock portfolios train over January 1983–December 1992 and test over January 1993–December 2010, giving 216 months. The covariance matrix is re-estimated each month even though the penalty stays fixed.

For individual stocks, the January 1983 selection requires a price of at least $5 and a preceding 120-month return record. Missing returns in the test period are replaced by value-weighted market returns, following the cited benchmark implementation. This is an important reconstruction detail: the experiment is not a continuously refreshed, fully realistic delisting-and-replacement portfolio. It studies a particular historically selected universe and missing-data convention.

The selected penalty values are 1.7, 1.3, 1.9 and 0.8 for the first four datasets, and an average of 5.9 for individual-stock samples, in the authors' convention. Average fractions of zero off-diagonal entries are 45.0%, 32.2%, 47.1%, 44.0% and 32.4%, respectively. The precision estimates remain far from diagonal. The experiment removes a meaningful fraction of unreliable links while retaining many conditional hedges.

The Ledoit–Wolf comparator shrinks toward constant correlation. The industry comparator, used only for individual stocks, assigns stocks to 30 industry groups and uses covariances of their industry portfolios off the diagonal, while retaining individual sample variances on the diagonal. These implementation choices matter: the article explicitly does not claim dominance over every shrinkage target, industry model, window length or portfolio-constraint specification.

## Risk results and statistical comparisons

Table 4 reports the following monthly return variances, in squared percentage-point units:

| Universe | Sparse precision | Sample inverse | Equal weight | Long-only sample GMV | Ledoit–Wolf | Industry model |
|---|---:|---:|---:|---:|---:|---:|
| 100 size/value portfolios | 13.30 | 65.30 | 25.43 | 58.57 | 21.98 | — |
| 48 industries | 12.45 | 17.59 | 22.88 | 16.22 | 13.15 | — |
| Combined 148 portfolios | 10.70 | unavailable | 24.12 | 16.43 | 12.74 | — |
| 133 international portfolios | 15.25 | unavailable | 29.56 | 23.64 | 15.92 | — |
| Individual stocks, average | 10.10 | 19.44 | 23.79 | 13.40 | 11.36 | 11.01 |

The sparse method has the lowest point estimate in all five sets. Its improvement over Ledoit–Wolf is statistically significant for size/value portfolios and individual stocks, but not for the other three datasets. The authors use a stationary block bootstrap with data-selected expected block length to test differences in **standard deviations**. A lower point estimate is not automatically a statistically distinguishable improvement.

Within the 100 individual-stock replications, sparse precision beats sample inversion and equal weighting on realized variance in all 100 runs, and beats long-only GMV, Ledoit–Wolf and the industry model in 95 runs each. These are repeated overlapping historical portfolio experiments, not 100 independent market histories. More selected sparsity is associated with larger improvements over sample inversion: the reported regression slope is 0.112 with a $t$-statistic of 3.30, but the explanatory $R^2$ is only 10%. This supports the proposed mechanism without isolating a causal effect of increasing the penalty.

Numerical conditioning improves greatly. For 100 size/value portfolios, the mean condition number declines from 84,463 for the sample matrix to 881 for the sparse estimate. For individual stocks it is 321 for sparse precision and 568 for the industry model. The Ledoit–Wolf value is 709 in Table 3, although the adjacent prose prints 769; the table is the appropriate precise reference. Good conditioning supports numerical and statistical stability but is not itself proof of superior economic performance.

## Return, trading and welfare results

The risk result is stronger than a universal return-performance claim. For individual stocks, monthly Sharpe ratios are 0.147 for sparse precision and 0.181 for equal weighting. Equal weighting has a higher Sharpe ratio in 88 of the 100 stock samples. The sparse portfolio has a higher Sharpe than the other optimized competitors on average, but the authors caution that mean-return uncertainty makes such comparisons difficult. They use the Ledoit–Wolf studentized circular block bootstrap for Sharpe differences, accounting for dependence and nonnormality.

The optimized weight distributions illustrate the reduction in extreme hedges. In pooled individual-stock results, sample-GMV positions reach about +2,772% and −2,836%; sparse-precision positions range approximately from −7.5% to +31.5%. These are pooled extremes, not gross-exposure constraints imposed by the method. A future application can still require explicit leverage, concentration and borrow limits.

Turnover is calculated using drifted pre-rebalancing positions. For individual stocks, average monthly turnover is 0.160 for sparse precision, 5.220 for sample GMV, 0.033 for equal weights, 0.109 for long-only GMV, 0.319 for Ledoit–Wolf and 0.281 for the industry model. Sparse precision therefore trades much less than sample inversion, but more than equal weighting or long-only GMV. It also has **higher** turnover than Ledoit–Wolf in the international dataset: 0.886 versus 0.534. Lower turnover is an empirical tendency under this design, not an optimization constraint or universal consequence of sparsity.

Economic comparisons use annualized mean–variance certainty equivalents,
$$
CE=\hat\mu-\frac\gamma2\hat\sigma^2-0.005\times12\times\text{monthly turnover},\qquad \gamma=5.
$$
The 50-basis-point cost is applied per unit traded, with the source's turnover convention. These are quadratic certainty-equivalent measures, not exact certainty equivalents for every possible utility function. Sparse precision delivers 4.17%, −0.19%, 4.11%, 2.92% and 1.54% across the five datasets. It beats the reported Ledoit–Wolf implementation in each case, but equal weighting achieves 3.27% for individual stocks and long-only GMV achieves 2.08% for industries. Thus the lowest-variance method does not always provide the highest cost-adjusted utility.

The no-short-sale extension further tests the hedging interpretation. Adding nonnegativity to the sparse-risk-model portfolio makes its variance close to that of sample-based long-only GMV and removes much of the original advantage. This indicates that successful short hedge positions drive an important part of the result. A constrained implementation must solve a quadratic program using the covariance implied by the precision estimate; the unconstrained row-sum formula no longer applies.

## Replication priorities and limitations

Predictive Gaussian likelihood evaluates the full fitted covariance, whereas GMV performance evaluates a specific direction. Their rankings can differ. For example, sparse precision loses to Ledoit–Wolf on predictive likelihood for international assets even though it attains a slightly lower portfolio variance. The reported likelihood evaluation demeans returns with the test-period mean; this is an ex-post covariance scoring convention and should not be mistaken for an implementable expected-return forecast.

A faithful replication should state return units, likelihood/penalty scaling, diagonal-penalty treatment, training/test separation, missing-return handling, solver tolerance and transaction-cost convention. Out-of-sample tuning must remain nested within information available at each decision date. The paper fixes the initial penalty for computational simplicity; it notes that updating it once midway improves results, but does not present a fully adaptive tuning policy as the baseline.

The contribution is an economically interpretable application of sparse precision estimation to portfolio hedging, supported by extensive historical comparisons. It does not establish a universal sparse true graph, eliminate expected-return error, incorporate nonlinear market impact or borrowing fees, or prove future domination. Its practical lesson is to regularize the conditional hedge relationships that inversion would otherwise exaggerate and to judge the resulting estimator by both risk and trading consequences.
