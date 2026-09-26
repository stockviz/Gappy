# Bayesian Selection of Asset Pricing Factors
**Authors:** Soosung Hwang, Andreas Rubesam
**Year:** 2018
**Journal/Venue:** Journal of Empirical Finance

## Problem statement

Hwang and Rubesam ask a direct model-selection question: if the literature has already proposed dozens of candidate factors, which of them actually belong in an empirical asset-pricing model once factor uncertainty is treated explicitly? Their answer is deliberately different from the usual factor-horse-race on characteristic-sorted portfolios. They argue that portfolio tests are contaminated because the portfolios are built from characteristics that are themselves closely related to the candidate factors.

The paper therefore moves the factor-selection problem to a much harder object: large panels of individual stock returns. The goal is to determine, from a universe of 83 candidate factors, which small subset is actually needed to explain returns in a Bayesian model-selection framework.

## Approach (short)

The paper writes the return system as a seemingly unrelated regressions (SUR) model with common regressors and then extends the Kuo-Mallick Bayesian variable-selection method to that multivariate setting. A binary inclusion vector `gamma` determines which factors are active. Posterior model probabilities are computed with Gibbs sampling across the enormous model space.

Empirically, the paper tests:

- non-microcap individual stocks,
- microcap stocks,
- and characteristic-sorted portfolios.

The headline result is that only the market factor is consistently selected over time. A small number of other factors appear episodically, but the standard named models such as FF3, FF5, q-factor, or HXZ do not emerge as stable winners in stock-level tests.

## Approach (detailed)

### 1. Start from a SUR representation of the factor model

For asset `i`, the return equation is written as

$$
r_i = X \beta_i + \varepsilon_i,
$$

where `X` contains the candidate factors and possibly an intercept, and the disturbances are correlated across assets:

$$
\tilde{\varepsilon} \sim N(0, \Sigma \otimes I_T).
$$

Stacking all assets gives a standard SUR system. This matters because factor selection is inherently multivariate: the same candidate factor is being asked to explain many assets at once, while cross-equation residual correlation is allowed.

The paper reviews Bayesian estimation of the SUR model first, because the variable-selection step is built directly on that foundation.

### 2. Introduce model uncertainty explicitly with inclusion indicators

The key methodological object is the inclusion vector

$$
\gamma = (\gamma_1,\ldots,\gamma_K), \qquad \gamma_j \in \{0,1\},
$$

where `\gamma_j = 1` means factor `j` is included and `\gamma_j = 0` means it is excluded. Given `K` candidate factors, the model space has `2^K` possible subsets.

For each factor the paper assigns an equal prior inclusion probability, typically `0.5`, so the procedure does not favor a priori the canonical models from the literature. This is important. The exercise is not "compare FF5 to HXZ." It is "search the entire admissible subset space and let the posterior decide."

### 3. Extend Kuo-Mallick variable selection to the SUR environment

The paper's technical contribution is to take the Kuo-Mallick binary-variable-selection logic, originally used in simpler regression settings, and generalize it to the SUR model with common regressors. Conditional on the inclusion vector `gamma`, the system is just a restricted SUR with the corresponding columns of `X` active.

The posterior simulation then alternates over:

- factor loadings,
- the residual covariance matrix `Sigma`,
- and the inclusion indicators `gamma`.

Because the full model is large, the paper uses Gibbs sampling to traverse the posterior. This is the computational device that makes the model-selection problem feasible despite the huge candidate space.

### 4. Empirical Bayes prior for factor sensitivities

For the factor sensitivities `beta_i`, the paper uses an empirical Bayes prior centered at the OLS estimate:

$$
\beta_i \sim N\!\left((X'X)^{-1}X'r_i,\; c_i (X'X)^{-1}\right).
$$

This is a pragmatic choice. It stabilizes estimation in a large system without forcing the coefficients toward zero or toward a named benchmark model. The resulting posterior model probabilities can then be interpreted as a compromise between fit and parsimony.

### 5. Why individual stocks, not only portfolios

The paper strongly objects to evaluating factor models only on portfolios formed by size, book-to-market, profitability, momentum, and similar characteristics. The reason is mechanical: if a portfolio is built on a characteristic, a factor related to that characteristic is likely to look successful by construction.

That is why the main analysis uses individual stocks, especially non-microcaps. The authors view these tests as less contaminated by the portfolio-formation criterion and therefore more informative about true factor necessity.

### 6. Factor universe and estimation design

The empirical universe includes:

- 83 candidate factors drawn from the literature,
- an intercept treated as a candidate "factor" as well,
- several sub-sample analyses to allow for time variation.

The main stock-level analyses are done for three long subsamples and then for five shorter subsamples. The shorter windows are important because a fixed linear factor model estimated over a long period can spuriously require more factors if the true factor structure changes over time.

### 7. Main stock-level findings: only the market factor is stable

For non-microcap stocks, the striking result is that high-probability models are very small. Across subsamples they typically contain fewer than five factors, often far fewer. And among the 80-plus candidates, only the market excess return is selected consistently across time.

Other factors appear only episodically. The important ones include:

- `chmom`: change in 6-month momentum,
- `mom1m`: one-month momentum / short-term reversal related return,
- `aeavol`: abnormal earnings announcement volume,
- `ear`: earnings announcement return,
- `chanalyst`: change in number of analysts covering the stock,
- `herf`: industry concentration,
- `sue`: unexpected quarterly earnings,
- `pctacc`: percent accruals,
- and a few related signals such as industry-adjusted size or sales-minus-receivables changes.

This is the substantive message: the factor structure that best explains individual stocks is sparse and time-varying, and it does not look like the standard textbook named models.

### 8. Role of the intercept

The intercept is diagnostically important in this paper. If the posterior often selects an intercept, that is evidence the included factors are not fully explaining average stock returns.

In the three long-subperiod analysis, the intercept enters in the final period, which the authors interpret as evidence that a fixed long-window factor set is missing something. But when they move to five shorter subperiods with a reduced candidate set, the intercept is no longer selected. Their interpretation is that some of the earlier "mispricing" signal was really model instability over time rather than a need for a permanently larger factor set.

### 9. Shorter subperiods reduce model uncertainty

The five-subperiod analysis is a key robustness check. Relative to the longer windows:

- fewer factors are ever selected,
- the selected models are smaller,
- the intercept disappears,
- and the set of useful factors changes across periods.

The market factor remains the only stable component. Other factors rotate in and out:

- early periods emphasize `chmom`,
- 1987-1994 adds `ear` and `mom1m`,
- 1995-2002 is close to a pure-market model,
- 2002-2009 brings in `sue`,
- 2010-2016 gives weight to `mom1m`, industry-adjusted size, and earnings-surprise variables.

This is strong evidence against the view that the same fixed list of factor portfolios is always the right model.

### 10. Microcaps are different

The paper also isolates microcap stocks. The selected factors differ again, and the results are even more idiosyncratic. In the late-1990s technology-bubble window, the two top models for microcaps exclude the market factor entirely and instead emphasize:

- abnormal earnings announcement volume,
- change in analyst coverage.

The authors interpret this as consistent with speculative, information-sensitive microcap behavior during the bubble period. More generally, the selected factors for microcaps are not the standard broad risk factors and are fewer in number than one might expect from the published literature.

### 11. Portfolio tests confirm the authors' warning

When the same methodology is applied to characteristic-sorted portfolios, the selected factors tend to line up mechanically with the portfolio-formation variables:

- size portfolios call for a size-related factor,
- book-to-market portfolios call for a value-related factor,
- profitability portfolios call for a profitability-related factor,
- and so on.

The paper treats this as evidence that portfolio-based factor success can be overstated. High posterior probabilities and zero intercepts on such portfolios do not necessarily mean the factor model has genuine stock-level explanatory power.

### 12. What the paper actually contributes

The paper contributes both a method and a conclusion.

Methodologically, it shows how to perform Bayesian variable selection in a multivariate stock-return system with correlated residuals. That matters because most factor-selection exercises either:

- compare a handful of hand-picked models,
- or rely on test portfolios that already encode the candidate signals.

Substantively, it concludes that the stable factor structure is much smaller and less canonical than the literature suggests. The market factor survives. Most other factors are episodic, and the popular named models are not robust winners in stock-level Bayesian selection.

## Domain of applicability

- **Where it works well:** Selecting among many candidate traded or characteristic-based factors when model uncertainty is the central problem.
- **What is implementable:** A SUR-based Bayesian variable-selection workflow with inclusion indicators, Gibbs sampling, stock-level test assets, and posterior model probabilities rather than informal factor horse races.
- **Main limitation:** Results are sensitive to the candidate factor menu, the prior structure, and the assumption that a sparse linear factor model is the right approximation within each subsample.
- **Why the paper matters:** It is one of the clearest attempts to ask the factor-selection question directly, on individual stocks, without letting characteristic-sorted portfolios decide the answer in advance.
