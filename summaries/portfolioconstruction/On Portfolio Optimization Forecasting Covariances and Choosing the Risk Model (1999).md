# On Portfolio Optimization Forecasting Covariances and Choosing the Risk Model

**Source:** [Portfolio_ChanKarceskiLaknishok_1999.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/Portfolio_ChanKarceskiLaknishok_1999.pdf>)  
**Source coverage:** Risk-model definitions, predictive design, minimum-variance and tracking-error experiments, characteristic matching, and interpretation.

## 1. Metadata

- **Title:** On Portfolio Optimization: Forecasting Covariances and Choosing the Risk Model
- **Author(s):** Louis K. C. Chan, Jason Karceski, Josef Lakonishok
- **Year:** 1999
- **Journal/Venue:** *Review of Financial Studies*

## 2. Problem statement

The paper asks which covariance forecasting models are good enough for practical portfolio optimization. More precisely, it compares alternative estimators of the future covariance matrix $\Sigma_{t+1}$ by asking two linked questions:
$$
\text{(i) how well do they forecast pairwise covariances?}
\qquad
\text{(ii) how well do optimized portfolios based on them perform out of sample?}
$$
The paper studies both global minimum-variance portfolios and benchmark-relative minimum-tracking-error portfolios.

## 3. Approach (short)

The method is out-of-sample empirical comparison of covariance models. Chan, Karceski, and Lakonishok estimate several structured covariance models, including full sample covariance, constant-covariance shrinkage-type models, and increasingly rich factor models, then feed those estimates into constrained optimization problems and compare both statistical forecast errors and realized portfolio risk. The paper’s contribution is practical: it links covariance-model choice to actual optimization performance rather than just fit.

## 4. Approach (detailed)

1. **Optimization objects**

   Two quadratic programs are central.

   - **Minimum variance**
     $$
     \min_w\ w^\top \Sigma w
     $$
     subject to long-only and diversification constraints such as
     $$
     \sum_i w_i=1,\qquad w_i\ge 0,\qquad w_i\le \bar w.
     $$

   - **Minimum tracking-error variance**
     relative to benchmark weights $w_b$:
     $$
     \min_w\ (w-w_b)^\top \Sigma (w-w_b).
     $$

   The paper deliberately abstracts from expected-return estimation in order to isolate the covariance problem.

2. **Full covariance estimator**

   The baseline estimator is the sample covariance matrix
   $$
   \hat\Sigma=\frac{1}{T-1}\sum_{t=1}^T (r_t-\bar r)(r_t-\bar r)^\top.
   $$
   This is flexible but noisy, especially with many stocks relative to the estimation window.

3. **Factor-model estimators**

   Returns are modeled as
   $$
   r_{i,t}=\alpha_i+\sum_{k=1}^K \beta_{ik} f_{k,t}+\varepsilon_{i,t},
   $$
   with factor covariance matrix $\Sigma_f$ and diagonal residual covariance $D$. Then
   $$
   \Sigma \approx B\Sigma_f B^\top + D.
   $$
   The paper considers one-factor, three-factor, four-factor, eight-factor, and ten-factor models. The underlying question is not “which factor model prices assets best,” but “how many common factors are needed to forecast the covariance structure relevant for optimization?”

4. **Constant covariance benchmark**

   The constant-covariance model shrinks pairwise covariances toward a common average level. The point is not economic realism but statistical regularization: since most pairwise covariance estimates are noisy, a strong structure can outperform more flexible estimates out of sample.

5. **Forecast evaluation**

   For each model, the paper compares forecasted covariances with realized covariances over future windows using metrics such as absolute forecast error and correlation between forecasted and realized covariance terms. This is the statistical side of the exercise.

6. **Portfolio evaluation**

   The economically meaningful side is realized risk of optimized portfolios. Each year:
   - estimate the model on a rolling historical window;
   - solve the quadratic program;
   - hold the resulting portfolio over the next year;
   - compute realized volatility or realized tracking-error volatility.

   This complements direct forecast evaluation because optimization can magnify errors in the directions it selects.

7. **Main findings**

   The paper’s main exact empirical claims are:

   - minimum-variance optimization materially reduces absolute risk relative to the tested naive allocations; this does not imply every optimized tracking portfolio beats every simple baseline;
   - for global minimum-variance portfolios, a small number of factors captures most of the useful covariance structure;
   - a three-factor model is generally enough for minimum-variance problems;
   - for tracking-error minimization, more factors matter because the problem is more sensitive to finer covariance distinctions relative to the benchmark.

   Intuitively, minimum-variance optimization mainly needs the dominant common risk structure, whereas tracking error requires distinguishing many smaller relative exposures.

8. **Why tracking-error optimization is harder**

   In minimum-variance optimization, the optimizer mainly seeks low-volatility combinations, so getting the first few covariance eigencomponents roughly right often suffices. In tracking-error problems, the benchmark already strips out much of the common market component. What remains is finer relative covariance structure, so misspecifying factor exposures is more costly.

9. **What is proved versus what is measured**

   The paper contains no theorem proving, for example, that “three factors are sufficient.” That conclusion is empirical. The exact mathematical content is the factor-covariance decomposition and the quadratic optimization problems. The substantive findings are sample-based and out-of-sample validated, not analytically derived.

## 5. Domain of applicability

- The paper applies to practical large-scale equity optimization where covariance estimation error dominates mean-estimation issues.
- Its conclusions are strongest for long-only institutional portfolios with realistic position caps.
- The “three factors suffice” result is tied to minimum-variance problems; it does not generalize automatically to alpha-maximization or more complex utility objectives.
- The empirical findings are historically contingent and depend on the benchmark, universe, and estimation windows.
- The real contribution is methodological: evaluate risk models by optimized out-of-sample portfolio behavior, not by in-sample covariance fit alone.


## 6. Why a covariance forecast should be judged through holdings

A covariance model produces many entries, but the portfolio uses particular linear combinations of them. For fixed weights $w$, forecast-risk error is

$$w'(\hat\Sigma-\Sigma)w.$$

Average entrywise prediction error treats all covariance mistakes alike; optimized portfolio risk emphasizes errors in the directions selected by the optimizer. Selection itself is endogenous to the forecast. An optimizer can load on a direction that looks unusually safe because of estimation error, making its realized risk worse than an entrywise accuracy statistic would suggest.

The paper therefore uses two evaluation layers: direct covariance forecast comparisons and realized risk of portfolios formed from those forecasts. Expected returns are deliberately kept out of the optimization to isolate the second-moment problem. This is a strength for identifying the risk-model question, but it does not establish performance for an alpha-driven optimizer whose holdings may emphasize different directions.

The unrestricted minimum-variance formula $\Sigma^{-1}\mathbf1/(\mathbf1'\Sigma^{-1}\mathbf1)$ is not the algorithm used in the central constrained tests. There are 250 stocks and only 60 monthly observations for estimation, so the raw historical covariance is singular. Long-only and upper-weight constraints make the feasible set compact and allow a finite solution to the quadratic program without an ordinary inverse. They do not by themselves guarantee a unique solution or eliminate estimation noise.

## 7. The data and the model menu

Each April the authors select 250 domestic NYSE/AMEX stocks after excluding the smallest 20% using NYSE capitalization breakpoints and stocks priced below $5. Models use the preceding 60 months of returns. Covariance forecasts are assessed against realized covariances over disjoint subsequent 12- and 36-month windows. Annual portfolio-formation experiments produce realized return series over 1973–1997.

The source compares several kinds of structure:

- A full historical covariance model retains individual pair estimates and their sampling noise.
- Strict factor models represent covariance as $B\Sigma_fB'+D$, with mutually uncorrelated specific returns in $D$.
- A constant-covariance model replaces off-diagonal pair estimates with their common mean.
- A constant-correlation-type specification makes covariance proportional to the product of individual volatilities.
- Composite forecasts combine information from alternative specifications rather than insisting one model contains all useful structure.

Constant covariance and constant correlation are different. The latter allows a high-volatility pair to have a larger covariance even when all correlations are the same. The source finds that the relative stability of individual variance information makes this distinction useful.

The one-factor model uses the market. The three-factor model adds size and book-to-market; the four-factor version adds momentum. Broader models include dividend yield, cash-flow yield, term and default premiums, and additional beta and long-horizon return factors. These factors are evaluated as predictors of covariation. Explaining covariance and pricing expected returns are related research questions, but neither logically establishes the other.

The treatment of individual variances is also important. Portfolio comparisons hold a regression-adjusted variance forecast convention fixed across covariance models in the main table. Otherwise one could incorrectly attribute better portfolio performance to a factor structure when it actually came from better diagonal variance estimates.

## 8. Minimum variance: large gains from optimization, small differences among models

The introductory perfect-foresight exercise finds annualized volatility of about 6.85% for an optimized portfolio, against 16.62% for an equally weighted portfolio of the same 250 stocks. It uses future covariance information and therefore measures a hypothetical opportunity, not attainable historical forecasting performance.

Using only historical covariance estimates raises optimized realized volatility to about 12.94%. Optimization still reduces risk in the tested long-only, 2%-position-cap setting, but much of the perfect-information gain disappears. This comparison makes covariance forecasting economically consequential even though covariance is easier to estimate than expected return.

The three-factor model gives volatility about 12.66%, close to the full covariance model's 12.94%. A composite model reaches roughly 12.59%. The paper also highlights strong performance of a simple model based on common correlation and individual volatilities. Thus the message is not that one factor model wins by a large margin. Under this objective and feasible set, many models find similar low-risk holdings.

Long-only minimum-variance portfolios cannot generally eliminate the market component because most stocks have positive market exposure. They tend instead toward low-beta, low-volatility stocks and associated characteristics. Once several models identify this broad direction, adding fine covariance distinctions yields limited benefit. Constraints and the investable universe help explain the similarity of results.

The accompanying Sharpe and return observations are outcomes of the sample, not guarantees that minimizing volatility maximizes expected utility or Sharpe ratio. Levering a minimum-variance portfolio to a common volatility further requires assumptions about expected returns, financing, and feasible leverage that are outside the core covariance comparison.

## 9. Tracking error is a different decision problem

For a benchmark return $r_B$ that need not be exactly replicable by the eligible assets,

$$\operatorname{Var}(w'r-r_B)=w'\Sigma w-2w'c_B+\sigma_B^2,$$

where $c_B=\operatorname{Cov}(r,r_B)$. Writing this as $(w-w_B)'\Sigma(w-w_B)$ requires the benchmark to be represented in the same return universe. Otherwise benchmark covariance and exposures must be estimated separately. This matters in the source because the optimized portfolio uses a random stock subset while the benchmark is the S&P 500.

If the portfolio can approximately match the benchmark's market loading, much of the largest common risk component cancels. Remaining style and other factor mismatches then become comparatively important. More factors can therefore help distinguish tracking strategies even when they barely affect absolute minimum-variance results. The paper presents this as a conditional opportunity for finer modeling, not as a theorem that tracking error is always harder to minimize.

The empirical evidence also warns against overstating optimization's advantage. In the S&P 500 tracking exercise, a value-weighted portfolio of the eligible stocks has tracking-error volatility about 3.04%, lower than several optimized models; a richer factor specification is around 4.01%. Large-stock composition already resembles the benchmark and can outperform estimated loading matches. The superiority of value weighting is benchmark-dependent: the paper reports that it performs much worse when the comparison benchmark is an equally weighted random-stock portfolio.

The authors investigate matching observable stock attributes as another route to tracking. Estimated factor loadings contain noise and can make small stocks appear to mimic large benchmark constituents. Characteristics such as capitalization can serve as stable anchors. This does not imply that characteristics always replace covariances, but it shows that the form in which risk information enters construction matters.

## 10. Interpretation and implementation lessons

A model should be selected for the portfolio task it must support. Absolute risk minimization, index tracking, and alpha implementation use different combinations of the same covariance entries. The source's “three factors are adequate” conclusion belongs to its constrained minimum-variance experiments; it is not a general bound on the dimension of financial risk.

For an analogous study, keep universes, point-in-time data, constraints, rebalance dates, and variance forecasts comparable. Include simple allocation baselines as well as richer risk models. Separate hypothetical perfect-information portfolios from forecast-based portfolios. Evaluate realized portfolio risk and exposure drift in addition to entrywise error, and account for uncertainty when comparing small differences in sample volatilities.

The paper's historical results are strongest for the specified institutional equity setting. They do not resolve high-frequency covariance estimation, unstable factor exposures in later markets, nonlinear instruments, or portfolio costs. Their lasting methodological contribution is to connect forecast quality to the actual decisions induced by optimization, while showing that additional model complexity is useful only when it improves those decisions.
