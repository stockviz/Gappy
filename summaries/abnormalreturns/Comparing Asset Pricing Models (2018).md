# Comparing Asset Pricing Models
**Authors:** Francisco Barillas, Jay Shanken
**Year:** 2018
**Journal/Venue:** Journal of Finance

## Problem statement

Barillas and Shanken take up a question that ordinary asset-pricing tests handle badly: once many traded-factor models exist, how should one compare them formally? A classical GRS test or a set of alphas can tell us whether a given model is rejected by a set of test assets. But that is not the same as deciding which model is best among many nested and nonnested alternatives.

The paper therefore reframes model evaluation as Bayesian model comparison over a collection of traded-factor models. The target is not only absolute adequacy but relative support. The empirical problem is to decide, from a menu of candidate factors, which subset gives the best parsimonious pricing model and which factors are redundant.

## Approach (short)

The paper develops:

1. a Bayesian asset-pricing test for the zero-alpha restriction that can be computed in closed form from the usual GRS `F` statistic,
2. a model-comparison procedure for all subset models formed from a candidate set of traded factors,
3. an extension for **categorical factors**, where several factors are alternative versions of the same underlying construct.

The main empirical application uses 10 prominent factors and compares all admissible traded-factor models subject to the restriction that only one version of each category is included. The highest-probability models contain:

- the market factor,
- momentum,
- the monthly updated value factor `HMLm`,
- and the HXZ-style profitability and investment factors.

The paper finds that the standard FF5 and HXZ models are dominated in the relative-comparison sense by models that include momentum and more timely versions of value and profitability.

## Approach (detailed)

### 1. Begin from the standard time-series pricing model

For test-asset excess returns `r_t` and factor returns `f_t`, the usual linear pricing regression is

$$
r_t = \alpha + \beta f_t + \varepsilon_t.
$$

Under an exact traded-factor model, the intercept vector should be zero:

$$
H_0: \alpha = 0.
$$

Classically, one tests this with the Gibbons-Ross-Shanken `F` statistic. Barillas and Shanken's first contribution is to show that, under a Bayesian prior on the magnitude of possible mispricing, the posterior probability of the zero-alpha restriction can be written as a simple function of that same `F` statistic. So the Bayesian test is not a new computational burden layered on top of classical asset pricing; it is an alternative interpretation of the familiar test object.

### 2. The prior is expressed economically through Sharpe-ratio improvements

The paper does not put an arbitrary prior on alphas. Instead it links prior beliefs about `alpha` to the increase in attainable Sharpe ratio under the alternative. Intuitively:

- if the model is false, how much better an investment opportunity set could one obtain by exploiting the nonzero alphas?

This is a very natural prior parameterization in finance. A large prior standard deviation for `alpha` corresponds to allowing large improvements in Sharpe ratio under the alternative. The paper denotes this through a maximum Sharpe-ratio multiple, `Shmax`, relative to the benchmark model.

This is one reason the procedure is attractive. The prior is not just a mathematical convenience; it has a portfolio interpretation.

### 3. Relative model comparison with traded factors

The paper's deepest theoretical point is that when all candidate factors are themselves traded returns, comparing models reduces to evaluating each model's ability to **price the factors left out of the model**.

Suppose a model contains factor subset `f`, while omitted candidate factors are `f*`. Then the model-comparison problem is not driven primarily by test assets. It is driven by whether the included factors span the excluded ones. This leads to a decomposition of the marginal likelihood of a model:

$$
ML
=
ML_U(f \mid Mkt)
\times
ML_R(f^* \mid Mkt, f)
\times
ML_R(r \mid Mkt, f, f^*).
$$

The crucial observation is that in **relative** comparison across models, the test-asset part cancels. So model comparison is effectively based on the ability of each subset model to price excluded factor returns.

This is the exact formalization of redundancy:

- if the omitted factor has zero alpha on the included factors, it is redundant;
- if not, the smaller model is missing something economically relevant.

### 4. Why this differs from standard asset-pricing horse races

A classical exercise often compares models by looking at:

- GRS p-values on a fixed test-asset set,
- average absolute alpha,
- or cross-sectional `R^2`.

Barillas and Shanken argue that these are not enough for model comparison because:

- different models can differ in estimation precision,
- a large p-value may reflect noisy alpha estimates rather than genuine adequacy,
- and pairwise comparisons do not scale cleanly when many models are entertained at once.

Their Bayesian procedure addresses all models simultaneously and yields posterior model probabilities, not just a sequence of accept/reject statements.

### 5. Simultaneous comparison over all subset models

Given a candidate factor set, define a model `M_j` as any admissible subset. Each model receives a prior probability, and Bayes' rule yields the posterior model probability:

$$
P(M_j \mid D)
=
\frac{ML_j \, P(M_j)}
{\sum_\ell ML_\ell \, P(M_\ell)}.
$$

This is a true simultaneous model-comparison exercise. It aggregates the evidence from all omitted-factor regressions rather than testing one model at a time.

### 6. Categorical factors: avoid double-counting different versions of the same idea

The empirical factor literature often contains multiple versions of the same underlying construct:

- size: `SMB` versus `ME`,
- profitability: `RMW` versus `ROE`,
- investment: `CMA` versus `IA`,
- value: `HML` versus `HMLm`.

Treating all versions symmetrically would overfit because two highly correlated versions of the same factor family could crowd out parsimonious models. So the paper introduces **categorical factors**:

- a model may include at most one version from each category,
- posterior probabilities are averaged over the alternative versions within that category.

This is a very practical contribution. It stops model comparison from becoming a contest among near-duplicates of the same economic idea.

### 7. Empirical factor menu

The main application uses 10 prominent factors:

- `Mkt`,
- `HML`,
- `SMB`,
- `UMD`,
- `RMW`,
- `CMA`,
- `ME`,
- `IA`,
- `ROE`,
- `HMLm`.

Here:

- `UMD` is momentum,
- `HMLm` is the Asness-Frazzini monthly updated value factor,
- `ROE` and `IA` are the Hou-Xue-Zhang profitability and investment factors.

The sample runs from 1972 to 2015.

### 8. Prior calibration

The benchmark prior uses a Sharpe-ratio multiple of `1.5` relative to the market. Interpreted economically, the prior says that with all six categories included, the expected maximum Sharpe ratio is only modestly larger than that of the market. The authors describe this as a prior with a risk-based tilt because it assigns relatively little mass to extremely large mispricing opportunities.

They then examine larger multiples, which correspond to priors more sympathetic to large departures from efficiency.

### 9. Main model-comparison result

The highest-probability model in the full 10-factor analysis is:

$$
\{ Mkt,\ SMB,\ ROE,\ IA,\ HMLm,\ UMD \}.
$$

Several close competitors differ only by:

- replacing `SMB` with `ME`,
- replacing `IA` with `CMA`,
- or omitting size entirely.

The main empirical message is robust:

- momentum matters,
- the more timely value factor `HMLm` matters,
- the HXZ-style profitability factor `ROE` matters strongly,
- and the FF5 and baseline HXZ models are not the dominant parsimonious models.

### 10. Why `HMLm` changes the redundancy conclusions

One of the paper's most interesting results is that older redundancy claims about value and momentum depend on which value factor is used.

Using the monthly updated `HMLm`, the paper finds strong evidence that value is **not** redundant. The Bayesian redundancy test for `HMLm` on the other top factors drives the posterior probability of redundancy toward zero for reasonable Sharpe-ratio multiples.

For momentum, the conclusion is subtle:

- in the best model including `HMLm`, momentum is not redundant;
- but if `HMLm` is omitted, the evidence can favor treating `UMD` as redundant.

So the relation between value and momentum is not generic. It depends on whether value is measured with stale or timely price information.

### 11. Out-of-sample performance

The paper does not stop at in-sample model probabilities. It also checks out-of-sample performance using rolling estimation windows and model selection over an estimation sample followed by performance evaluation in the remaining data.

The high-probability models perform well out of sample, which supports the idea that the Bayesian comparison is not merely overfitting in sample. At the same time, the authors note that FF5 and HXZ can also perform reasonably well out of sample, so the evidence is stronger on **relative ranking** than on the claim that one model is universally decisive.

### 12. Absolute versus relative adequacy

An important distinction in the paper is:

- a model can be the best **relative** model among those considered,
- yet still fail as an exact **absolute** pricing model.

The six-factor top model is indeed strongly rejected by classical absolute tests on some portfolio sets. But when the null is relaxed to allow small pricing errors, the Bayesian support becomes much less hostile. This is why the authors later discuss **approximate** models as more plausible than exact zero-alpha models.

### 13. The contribution in one sentence

Barillas and Shanken turn factor-model evaluation from a collection of separate adequacy tests into a coherent Bayesian model-selection problem over a traded-factor universe. The key operational idea is that, for traded factors, the question "is factor X redundant?" is answered by whether the included model prices the excluded factor set, not just by whether one test-asset set happens to deliver a low alpha.

## Domain of applicability

- **Where it works well:** Comparing many traded-factor models when the main question is parsimony and redundancy rather than only whether one chosen model passes a classical alpha test.
- **What is implementable:** A Bayesian model-comparison workflow using GRS-based Bayes factors, posterior model probabilities across all admissible factor subsets, and categorical-factor averaging when several factors are variants of the same underlying concept.
- **Main limitation:** The framework is tailored to traded factors; the simplifications rely on the factor returns themselves being investable and usable on the left-hand side of redundancy tests.
- **Why the paper matters:** It provides one of the cleanest formal answers to the factor-zoo question: not which model survives one test set, but which parsimonious traded-factor model receives the most support once all relevant alternatives are compared simultaneously.
