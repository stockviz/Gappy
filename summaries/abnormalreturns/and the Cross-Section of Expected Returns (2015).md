# ... and the Cross-Section of Expected Returns
**Authors:** Campbell R. Harvey, Yan Liu, Heqing Zhu
**Year:** 2015
**Journal/Venue:** Review of Financial Studies

## Problem statement

Harvey, Liu, and Zhu ask what significance threshold should be required for a new factor claim in a field where hundreds of factors have already been proposed and many more unsuccessful ones were likely tried and never published. The paper is motivated by a clear statistical problem: the traditional finance rule of thumb, `|t| >= 1.96`, treats each factor paper as if it were testing one isolated hypothesis. That is indefensible once the literature becomes a large-scale multiple-testing exercise.

The paper therefore reframes the factor zoo as a false-discovery problem. The task is not to explain why any one named factor seems significant in its original paper. The task is to determine what level of evidence is needed after accounting for:

- the very large number of attempted factors,
- publication bias toward positive and novel results,
- and the asymmetry between observed successful factors and unobserved failed candidates.

## Approach (short)

The authors compile a historical catalogue of 316 published factors and then apply standard multiple-testing logic to derive new significance thresholds for future claims. They develop the argument in a frequentist framework using:

- Bonferroni adjustment,
- Holm step-down adjustment,
- Benjamini-Hochberg-Yekutieli (BHY) false-discovery-rate adjustment.

The paper tracks how the implied benchmark t-statistic changes over time as more factors are discovered. Its operational conclusion is that the profession should require something like `t > 3`, not `t > 2`, before treating a new factor as genuinely interesting.

## Approach (detailed)

### 1. The paper starts by redefining the empirical object

The literature had been speaking loosely about "anomalies" and "factors," but Harvey-Liu-Zhu impose a more concrete population view. They compile **316 published factors**, grouped into a taxonomy, while emphasizing that this is almost surely an undercount of the true number of attempts. The hidden population includes:

- factors tried and discarded,
- insignificant variations never written up,
- and predictors reported only as failed robustness checks.

This missing-data point is crucial. If only published successes are observed, then naive use of published t-statistics necessarily exaggerates reliability.

### 2. Frequentist framing is chosen because the missing-data problem is severe

The paper explicitly discusses Bayesian approaches to multiple testing and model selection. But it argues that unobserved failed tests make a clean Bayesian implementation difficult. In practice, one does not observe the full set of tried models, only the small subset that survived publication. The authors therefore choose a frequentist approach designed to remain informative despite this partial observability.

That choice is pragmatic rather than philosophical. The point is to obtain usable thresholds under realistic publication bias.

### 3. False positives and false discoveries are separated carefully

The paper distinguishes two error concepts.

#### 3.1 Family-wise error rate

The family-wise error rate (FWER) is the probability of making even one false discovery:

$$
FWER = \Pr(V \ge 1),
$$

where `V` is the number of false rejections.

This criterion is very strict. If the literature has tested hundreds of factors, keeping FWER at 5% requires extremely small p-values.

#### 3.2 False discovery rate

The false discovery rate (FDR) is the expected proportion of false discoveries among all discoveries:

$$
FDR = E\!\left[\frac{V}{R}\right],
$$

with the usual convention when `R = 0`. This is less stringent than FWER because it allows some false discoveries as long as they remain a small fraction of the total.

The paper is explicit that neither criterion is "the truth." They correspond to different tolerances for false positives in a large research program.

### 4. Adjustment procedures are presented as implementable decision rules

The paper then walks through the main multiple-testing procedures.

#### 4.1 Bonferroni

If `M` hypotheses were tested, Bonferroni requires a p-value below `alpha / M`. This controls FWER conservatively under very weak dependence assumptions. It is easy to compute but can be extremely harsh when `M` is large.

#### 4.2 Holm

Holm's procedure orders the p-values and compares the `b`-th smallest p-value to `alpha / (M + 1 - b)`. It is a step-down rule:

1. order the p-values,
2. start from the smallest,
3. reject while each ordered p-value stays below its cutoff,
4. stop at the first failure.

Holm also controls FWER and is uniformly at least as powerful as Bonferroni.

#### 4.3 BHY

For false-discovery-rate control under general dependence, the paper uses Benjamini-Hochberg-Yekutieli. Ordered p-values are compared to

$$
\frac{b}{M \, c(M)} \alpha,
\qquad
c(M)=\sum_{j=1}^{M} \frac{1}{j}.
$$

This is a step-up rule: start from the largest ordered p-value that satisfies the inequality, then declare all smaller ones significant as well.

The BHY procedure is central to the paper because it delivers thresholds that are more realistic for a mature factor literature than FWER rules, while still acknowledging multiplicity.

### 5. Publication bias enters in two ways

The paper identifies two different publication biases.

1. **Nonresult bias:** insignificant factors are rarely published.
2. **Novelty bias:** journals prefer new factors over replications that might show the original evidence is weak.

These distort the observed factor list. The published record is therefore not just a filtered set of true signals. It is also a filtered set of what happened to clear conventional thresholds in a search-heavy environment.

### 6. From p-values to benchmark t-statistics

The authors then convert the multiple-testing adjustments into a time series of benchmark t-statistics. The logic is:

1. collect the available published factor t-statistics at each date,
2. translate them into p-values,
3. apply Bonferroni, Holm, and BHY,
4. convert the resulting benchmark p-values back into two-sided t-statistics using the normal approximation.

This produces a historical curve for the "required" t-statistic as the literature grows.

### 7. The main numerical conclusions

The thresholds rise sharply over time.

- **Bonferroni** starts near `1.96` and reaches about `3.78` by 2012, rising to roughly `4.00` by 2032 under a continuation forecast.
- **Holm** is slightly less stringent than Bonferroni but tracks it closely.
- **BHY** behaves differently: it is not monotone and stabilizes at roughly `3.39` when FDR is controlled at 1%.

If the BHY false-discovery rate is set to 5% instead of 1%, the implied threshold is about `2.78` by 2012 and remains around `2.8`.

This leads to the paper's practical recommendation: the profession should not view `t = 2` as persuasive evidence for a new factor. A minimum threshold around `2.8`, and preferably closer to `3`, is more defensible.

### 8. Why this is not just a statistical curiosity

The point is not that every factor below these cutoffs is false. The point is that the prior burden of proof has changed because the field has changed. When only a few factors had been proposed, `1.96` was less absurd. In a world with hundreds of published factors and many hidden failures, it becomes much too easy to manufacture "significance."

This is the paper's biggest conceptual contribution. It treats the factor literature as an evolving research process, not as a stack of unrelated one-off tests.

### 9. A cleaner subsample still gives demanding cutoffs

To address concerns that factor tests differ in sample period and methodology, the authors study a cleaner subset of 124 factors:

- published no earlier than 2000,
- using Fama-MacBeth style tests,
- with at least the Fama-French three factors as controls,
- and with substantial historical coverage.

Even there the thresholds remain high:

- Bonferroni about `3.54`,
- Holm about `3.20`,
- BHY about `3.23` at 1% FDR and `2.67` at 5% FDR.

So the main message does not depend on the most heterogeneous early literature.

### 10. The paper's methodological contribution

The contribution is not merely "there are many factors." That was already obvious. The paper's real contribution is to specify a decision rule for future research:

1. treat the factor literature as a multiple-testing environment,
2. acknowledge hidden unsuccessful searches,
3. distinguish FWER from FDR depending the user's tolerance for false positives,
4. and demand materially higher t-statistics before believing a new factor.

In practice, this changes how one should read anomaly papers. A reported `t = 2.1` is no longer mildly persuasive. In a post-factor-zoo world it is barely a starting point.

## Domain of applicability

- **Where it works well:** Evaluating new factor or anomaly claims in a literature already saturated with historical searches.
- **What is implementable:** Bonferroni, Holm, and BHY decision rules applied to a catalogue of existing discoveries, with benchmark t-statistics updated over time as the literature grows.
- **Main limitation:** The full number of tried factors is unobservable, so any benchmark remains an informed approximation rather than an exact correction.
- **Why the paper matters:** It reset empirical standards in asset pricing by showing that the old `t = 1.96` convention is too weak for a mature factor-discovery environment.
