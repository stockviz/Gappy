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

   Let $\tilde\xi_i=\xi_i-\bar\xi_i$ be the demeaned return path of component $i$, and let $\tilde\xi$ be the portfolio built from those demeaned components. Then define
   $$
   MCED_\alpha(\xi)=E[\mu(\tilde\xi)\mid \mu(\tilde\xi)<DT_\alpha(\tilde\xi)].
   $$
   By removing component means before computing drawdown, MCED preserves the dependence structure that drives diversification while stripping out the trend component that induces performance chasing.

4. **Preserve the Euler-risk-allocation logic.**

   Because MCED inherits the coherence / homogeneity structure used for CED-style risk budgeting, it can be used in equal-risk-contribution constructions. Thus the paper can compare:
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
