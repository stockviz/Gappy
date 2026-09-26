# Portfolio Management with Drawdown-Based Measures

**Source:** [DrawdownManagement_MolybogaLahelec_2017.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/DrawdownManagement_MolybogaLahelec_2017.pdf>)  
**Source coverage:** Main definitions, block-bootstrap and Euler-contribution method, sampling experiment, institutional simulation, results, and allocation/data-cleaning appendices.

## 1. Metadata

- **Title:** Portfolio Management with Drawdown-Based Measures
- **Author(s):** Marat Molyboga and Christophe L'Ahelec
- **Year:** 2017
- **Journal/Venue:** *Journal of Alternative Investments*

## 2. Problem statement

The paper asks how portfolio construction changes when the relevant risk measure is drawdown rather than variance or return volatility. The specific question is whether one can build a drawdown-based allocation rule that avoids the overfitting and performance-chasing weaknesses of maximum drawdown and conditional expected drawdown while still producing useful out-of-sample portfolios.

## 3. Approach (short)

The method is empirical risk-based portfolio construction using a new drawdown measure. The authors define modified conditional expected drawdown (MCED), compute it by block bootstrap, and compare several portfolio rules based on MDD, CED, and MCED in a large hedge-fund / managed-futures simulation framework with realistic institutional constraints.

## 4. Approach (detailed)

1. **Define the baseline drawdown quantities.**

   For a cumulative-return path $\xi$, maximum drawdown is the largest peak-to-trough decline over the sample path. Goldberg and Mahmoud's conditional expected drawdown is
   $$
   CED_\alpha(\xi)=E[\mu(\xi)\mid \mu(\xi)<DT_\alpha(\xi)],
   $$
   where $\mu(\xi)$ is the random maximum-drawdown variable and $DT_\alpha$ is its tail quantile.

2. **Identify the flaw in plain CED.**

   CED depends on the cumulative-return path, so assets with strong upward drift can mechanically look better even when the diversification benefit comes from path interaction rather than level effects. The authors interpret this as a form of performance chasing.

3. **Construct MCED by demeaning component returns.**

   Let $\tilde\xi_i=\xi_i-\bar\xi_i$ denote demeaned periodic returns of component $i$, accumulated afterward to form a drawdown path, and let $\tilde\xi$ be the portfolio built from those demeaned components. Then define
   $$
   MCED_\alpha(\xi)=E[\mu(\tilde\xi)\mid \mu(\tilde\xi)<DT_\alpha(\tilde\xi)].
   $$
   By removing component means before computing drawdown, MCED preserves the dependence structure that drives diversification while stripping out the trend component that induces performance chasing.

4. **Preserve the Euler-risk-allocation logic.**

   Under the additive-path, positive-homogeneity conventions used for CED-style risk budgeting, it can be used in equal-risk-contribution constructions. Thus the paper can compare:
   - minimum-drawdown style rules,
   - equal-risk rules based on MDD/CED/MCED,
   - the volatility-adjusted benchmark used in the authors' earlier work.

5. **Compute the measure by block bootstrap.**

   Closed-form path-distribution calculations are infeasible, so the paper uses block bootstrap to preserve serial dependence and cross-correlation. The implementation repeatedly resamples return blocks, computes path drawdowns, estimates the tail mean, and averages across simulations.

6. **Embed the measure in a realistic institutional simulation.**

   The empirical framework uses a managed-futures / CTA universe with both live and defunct funds, institutional eligibility filters, portfolio-size constraints, and out-of-sample evaluation. Performance is measured both stand-alone and in a blended 60/40 plus alternatives setting.

7. **Main result.**

   MCED-based equal-risk portfolios dominate other drawdown-based constructions out of sample. They are more stable than MDD and CED and deliver better Sharpe / Calmar behavior among the drawdown family, though they still do not beat the authors' equal-volatility-adjusted benchmark.

## 5. Domain of applicability

- The method applies when path-dependent downside risk, especially peak-to-trough losses, is the relevant institutional concern.
- It is particularly suited to serially dependent return streams such as hedge funds and managed futures, where volatility alone misses path shape.
- The approach is simulation-heavy and depends on bootstrap design choices. The paper does not provide asymptotic distribution theory for the estimator.
- The strongest support is comparative and empirical. The paper does not prove that MCED is universally superior; it shows that removing mean drift improves drawdown-based portfolio construction in the studied environment.


## 6. Drawdown conventions and the object being averaged

The source writes drawdowns as negative peak-to-trough changes and therefore averages a **left** tail. Many implementations instead report losses as positive numbers. With an additive cumulative return path $S_t=\sum_{k\le t}r_k$, define the positive maximum drawdown

$$D(r)=\max_{0\le s\le t\le H}(S_s-S_t).$$

Under this convention a tail-drawdown measure averages the largest $D$ values, or an upper tail. The inequalities in the source's formulas reverse when switching signs. A numerical implementation should choose one convention throughout, including marginal contributions and the interpretation of confidence levels.

CED concerns the distribution of **maximum drawdown across paths**. Conditional drawdown measures that average drawdowns at many dates within a path use a different distribution. The two objects should not be treated as synonyms merely because both are described as tail averages. The horizon used to generate each path also matters: maximum drawdown generally increases as the window becomes longer.

The component demeaning step applies to periodic returns before forming the cumulative path:

$$\tilde r_{i,t}=r_{i,t}-\bar r_i,\qquad
\tilde S_{p,t}=\sum_{k\le t}\sum_iw_i\tilde r_{i,k}.$$

Subtracting a single constant from an already cumulative path merely shifts the path vertically and leaves its drawdowns unchanged. It would not perform the modification proposed in the paper. With fixed weights, component demeaning and portfolio demeaning commute, but the component construction also makes the marginal-risk calculation explicit.

MCED removes sample average performance from the drawdown criterion. An asset with an unusually favorable estimated drift can otherwise appear safe because its cumulative path slopes upward. Demeaning focuses attention on fluctuations and cross-asset path interaction. It intentionally discards expected-return information; if that information were reliably estimated and economically relevant, discarding it could also have a cost.

## 7. Bootstrap estimation and marginal contributions

The paper uses 200 bootstrap scenarios per risk calculation. Each scenario resamples **blocks of joint cross-sectional observations**, preserving contemporaneous dependence among funds and within-block serial dependence. Resampling each fund independently would destroy the diversification structure that the portfolio risk measure is meant to capture.

For each scenario, compute the portfolio cumulative path and its maximum drawdown. Identify the relevant worst-tail scenarios and average their drawdowns. The 90% confidence-level choices in the allocation appendix correspond to a tail containing the most adverse 10% under the positive-loss convention. With only 200 scenarios, the empirical tail may contain only around twenty observations, making Monte Carlo stability and tie handling material.

At a path with a unique worst peak-to-trough interval $(s^*,t^*)$, the derivative of positive drawdown with respect to $w_i$ is the component's cumulative loss over that same **portfolio** interval:

$$\frac{\partial D_p}{\partial w_i}
=S_{i,s^*}-S_{i,t^*}.$$

It is not the constituent's own maximum drawdown, which may occur at different dates. Averaging such contributions over the relevant tail scenarios yields the marginal tail-drawdown contribution under suitable regularity. For MCED, use the demeaned component paths.

For a differentiable positively homogeneous degree-one risk functional $\rho$,

$$\rho(w)=\sum_iw_i\frac{\partial\rho}{\partial w_i}.$$

The equal-risk construction targets equal **total risk contributions**, $w_i\partial_i\rho$, not equal marginal derivatives and not equal contributions to expected return. Ties in worst intervals or empirical quantiles can make the objective nonsmooth, so practical computation may require consistent subgradient or optimization conventions.

The homogeneity argument belongs to additive cumulative return or profit paths with linear portfolio aggregation. Percentage drawdowns of compounded wealth need not be homogeneous in portfolio weights or leverage in the same way. Although the source describes CED/MCED as coherent, one should not automatically import every property of a cash-translation-invariant monetary risk measure on terminal payoffs: drawdown is a path functional, and a vertical cash shift of an entire path does not reduce drawdown by that cash amount. Euler allocation follows from the relevant homogeneity, not from terminology alone.

## 8. The sampling-error experiment

The authors generate 1,000 synthetic datasets, each with five independent standard-normal return series of 36 months. Symmetry makes 20% in each asset the natural population reference in their exercise. They optimize MDD, CED, and MCED and compare estimated weights with that reference.

The reported standard deviation of weight errors is 12.20% for MCED, versus 17.39% for CED and 17.07% for MDD. About 94.14% of MCED errors fall within the study's ±20% band, versus roughly 87% for the other measures. These are errors in estimated allocation, not confidence intervals for drawdown itself.

The result illustrates sensitivity to noisy sample means in a deliberately symmetric zero-mean environment. It does not prove that demeaning is preferable when assets have stable, different expected returns, nor does it establish an asymptotic distribution for the MCED optimizer. The standard-normal setting also differs from the serially dependent, fat-tailed motivation for the applied bootstrap.

## 9. The institutional allocation experiment

After cleaning and filtering the BarclayHedge data, the final pool contains 1,997 funds: 613 live and 1,384 defunct. Including failed funds addresses one major source of survivorship bias. The authors also address backfill/incubation issues, remove inappropriate records, and restrict attention to direct investments with returns net of fees. Such procedures reduce known biases but cannot guarantee that voluntary-reporting data contain no residual selection effects.

The allocation simulation runs from January 1999 to June 2015. At each month end, eligibility uses a 36-month return history with a reporting lag; at the initial December 1998 decision, returns are available only through November. The bottom AUM quintile among eligible funds is excluded. Each simulation initially selects five funds at random, then applies every allocation rule to that same opportunity set. Funds that liquidate or cease to qualify are replaced from the updated eligible pool, and the portfolios are rebalanced monthly.

Using the same selected funds for competing weighting rules helps isolate the allocation effect from manager selection. The 1,000 simulations explore alternative feasible fund combinations within one historical market period. They are not 1,000 independent realizations of twenty years of financial history.

The tested rules include minimum historical MDD, minimum CED, minimum MCED, CED risk parity, MCED risk parity, equal notional weights, inverse-volatility weights (EVA), and random allocation. EVA has weights proportional to $1/\sigma_i$. It is not generally equal Euler volatility contribution when correlations differ.

### 9.1 Results in their proper scale

For standalone CTA portfolios, average Sharpe is about 0.339 for MCED equal-risk, higher than roughly 0.286–0.296 for the other drawdown methods, 0.308 for random allocations, and 0.326 for equal weight. EVA is slightly higher at about 0.347. MCED equal-risk's average Calmar is about 0.163, compared with EVA's 0.166. Thus the paper's preferred drawdown construction improves on its drawdown competitors but does not displace the simple inverse-volatility benchmark.

For the blended test, 10% of an initial 60/40 stock–bond allocation is replaced by the CTA portfolio. The original Sharpe is 0.365; blended averages range from about 0.390 to 0.404, with MCED equal-risk near 0.400. The original Calmar is 0.088, rising to about 0.101 for the MCED blend. These results reflect both the historical diversification benefit of CTAs and the weighting method; they should not all be attributed to MCED.

The Calmar convention in the source uses annualized excess return divided by maximum drawdown. When reproducing comparisons, use the same numerator convention and drawdown definition rather than substituting a differently defined database statistic.

## 10. Practical interpretation

Drawdown optimization is unusually sensitive to path length, dependence, and a small set of adverse intervals. Demeaning can reduce one source of instability, but cannot create unobserved crises or guarantee that resampled blocks describe future drawdowns. Block length, scenario count, return cleaning, and replacement rules are consequential modeling choices.

For a prospective use, calculate risk and contributions from a common set of joint scenarios, verify that the intended additive/compounded convention supports the optimization, and compare net turnover with simple alternatives. Assess both standalone risk and contribution to the investor's existing portfolio. A portfolio with a low standalone drawdown may offer less diversification than another portfolio with a less attractive individual path.

The paper offers a specific refinement of drawdown allocation: remove estimated drift, average adverse path maxima, and budget the resulting contributions. Its empirical comparison is encouraging within managed futures, while its strongest practical caution is that even this improved drawdown approach only narrowly approaches a much simpler volatility-adjusted allocation in the tested sample.
