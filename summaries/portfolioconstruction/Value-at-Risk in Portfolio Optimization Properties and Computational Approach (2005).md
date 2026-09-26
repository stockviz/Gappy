# Value-at-Risk in Portfolio Optimization Properties and Computational Approach (2005)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/covarOptimization_GaivoronskiPflug_2005.pdf>), 28 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

## 1. Metadata

- **Title:** Value-at-Risk in Portfolio Optimization: Properties and Computational Approach
- **Author(s):** Alexei A. Gaivoronski and Georg Pflug
- **Year:** 2005
- **Journal/Venue:** *Journal of Risk*

## 2. Problem statement

The paper asks how to compute portfolios on the mean-Value-at-Risk efficient frontier when VaR is taken seriously as the investor's actual risk criterion. The mathematical difficulty is that sample VaR optimization is nonconvex, nonsmooth, and may have many local minima, so variance- or CVaR-efficient portfolios need not approximate VaR-efficient ones.

## 3. Approach (short)

The method is direct historical-simulation optimization with a custom smoothing scheme. The authors formulate mean-VaR, mean-CVaR, and mean-variance problems using empirical return scenarios, show that empirical VaR has a smooth global component plus a noisy local component, replace VaR by a twice-differentiable smoothed approximation $SV@R$, solve the smoothed problem with standard nonlinear programming, and optionally postprocess locally to improve the true VaR objective.

## 4. Approach (detailed)

1. **Set up the generic mean-risk problem.**

   For asset-return vector $\xi$ and portfolio $x$, solve
   $$
   \min_x R(x^\top \xi)
   $$
   subject to
   $$
   x^\top E[\xi]\ge \mu,\qquad
   x^\top \mathbf 1=1,\qquad
   x\ge 0.
   $$
   The paper compares three choices of $R$: standard deviation, CVaR, and VaR.

2. **Define empirical VaR and CVaR.**

   For lower-tail probability $\alpha$ (confidence $1-\alpha$), sample quantile $Q_\alpha(W)$, and portfolio return $W=x^\top \xi$,
   $$
   VaR(W)=E[W]-Q_\alpha(W),
   $$
   $$
   CVaR(W)=E[W]-C_\alpha(W),
   $$
   where $C_\alpha(W)$ is the lower-tail conditional mean.

3. **Explain why VaR optimization is hard.**

   In scenario form, VaR is a quantile of finitely many affine functions $x^\top \xi^i$. That makes it piecewise-defined, nonsmooth, and nonconvex. Standard convex optimization methods therefore do not apply.

4. **Empirical observation: VaR has two components.**

   By studying one-dimensional slices through the portfolio simplex, the paper finds that sample VaR behaves like:
   - a relatively smooth global component,
   - plus a highly irregular local component created by scenario-order changes.

   This motivates smoothing only the discontinuous ranking mechanism, not the whole portfolio map generically.

5. **Construct the smoothed quantile.**

   Define a family
   $$
   V(\varepsilon,x)=\sum_{i=1}^N c_i^\varepsilon(x)\,x^\top \xi^i,
   $$
   where the weights $c_i^\varepsilon(x)$ are smooth approximations to indicator functions selecting the quantile-defining scenarios. They satisfy:
   - smoothness for $\varepsilon>0$,
   - convergence to the exact quantile as $\varepsilon\to 0$,
   - averaging toward the sample mean as $\varepsilon\to\infty$.

   Thus $SV@R$ preserves the relevant large-scale shape of VaR while filtering out local irregularities.

6. **Optimize the smoothed objective.**

   With $SV@R$ twice continuously differentiable, the mean-VaR problem can be attacked using standard nonlinear programming software. The smoothing parameter $\varepsilon$ trades off fidelity to exact VaR against elimination of spurious local minima.

7. **Postprocess on the true objective.**

   Starting from the minimizer of $SV@R$, the paper identifies the active quantile scenario set and solves a small linear program that locally improves the true VaR objective while staying inside the same scenario-order region.

8. **Compare efficient frontiers.**

   The main substantive result is that the mean-VaR efficient frontier can differ materially from both the mean-CVaR and mean-variance frontiers. Therefore a VaR-constrained investor should optimize VaR directly rather than use CVaR or variance as a proxy.

## 5. Domain of applicability

- The method applies to historical-simulation portfolio choice with finitely many scenarios and long-only constraints.
- It is designed for investors who genuinely use VaR as their target criterion. If the investor instead cares about coherence or tail expectation, the paper itself shows CVaR may be preferable conceptually.
- The smoothing method is heuristic in the sense that it targets the empirically observed global shape of VaR; it does not prove global optimization of the original nonconvex problem in all cases.
- The paper's computational argument is strongest in moderate- to large-scale scenario problems where direct mixed-integer or exhaustive nonconvex search is impractical.


## 6. Source conventions: confidence, centering, and quantile ties

The local manuscript identifies the publication as *Journal of Risk* 7(2), Winter 2004–2005, pp. 1–31; the local PDF itself contains 28 pages. It studies sample-based portfolio choice rather than a parametric Gaussian VaR formula.

The source uses $\alpha$ for the **lower-tail probability**, usually 0.05 or 0.01. Confidence is $1-\alpha$, not $\alpha$. Its definition

$$
Q_\alpha(W)=\inf\{u:F_W(u)>\alpha\}
$$

uses a strict inequality. With equally weighted observations, the sample quantile is the $(\lfloor\alpha N\rfloor+1)$st smallest return. At an exact probability-grid point this can differ from another software package's default quantile, particularly one that interpolates between order statistics. Reproduction requires matching that convention.

The article defines mean-centered deviations, $\operatorname{VaR}(W)=E[W]-Q_\alpha(W)$ and $\operatorname{CVaR}(W)=E[W]-C_\alpha(W)$. These differ from a cash-loss convention such as $-Q_\alpha(W)$. Adding a constant to all returns leaves the centered quantity unchanged. This makes the source's criterion more naturally a downside **deviation** from mean return; properties of monetary coherent risk measures should not be transferred without accounting for the centering.

For a discrete sample the lower-tail average must include a fractional amount of the probability mass at the quantile to attain exactly tail probability $\alpha$. Merely averaging all observations below or equal to the quantile can overcount tied outcomes. An equivalent reliable formula is

$$
C_\alpha(W)=\sup_a\left\{a-\frac1\alpha E[(a-W)^+]\right\}.
$$

Thus centered CVaR is obtained by minimizing

$$
x^\top e-a+\frac1{\alpha N}\sum_i z_i,
\qquad z_i\ge a-x^\top\xi^i,\quad z_i\ge0.
$$

The source's intermediate displayed expression around equation (8) has a sign/order inconsistency, while its subsequent LP uses the lower-tail shortfall direction. The formula above states the consistent lower-return-tail construction.

## 7. The mean term cannot always be dropped

The original centered VaR objective is

$$
x^\top e-Q_\alpha(x^\top\xi)
$$

subject to $x^\top e\ge\mu$, full investment, and no short selling. If the expected-return constraint is imposed as equality, the mean term is constant and minimizing VaR is exactly equivalent to maximizing the lower quantile. With only an inequality, that equivalence is not automatic.

The paper drops the mean term in its computational formulations under an additional stated economic assumption about the risk–return ordering of efficient portfolios. For a general feasible set, a rigorous implementation should retain $x^\top e$ or explicitly impose the intended fixed-mean equality before making that simplification. Otherwise maximizing a quantile may choose a different mean–risk tradeoff from minimizing deviation about the mean.

This detail matters for interpreting the efficient frontiers. Each frontier is generated by varying a return requirement and solving a particular optimization problem; it is not an intrinsic curve independent of the chosen return convention, sample, or inequality treatment.

## 8. Why the sample quantile is difficult to optimize

Every scenario return $x^\top\xi^i$ is affine in the weights. On a region of the simplex where their ordering remains unchanged, the quantile equals one of those affine functions. As the weights cross a boundary where two scenarios exchange ranks, the active quantile scenario changes. The empirical quantile is therefore continuous and piecewise affine, but generally nonsmooth and nonconvex.

The difficult feature is not a discontinuous quantile value at every ranking change; it is the changing affine pieces and their slopes. At the maximum or minimum order statistic special convexity or concavity can occur, but an interior quantile is generally neither. A local optimum can exploit a particular historical rank configuration without capturing a stable distributional property.

The source's “global smooth component plus local noise” description is an empirical observation from slices through sample objectives. It is not a universal decomposition theorem or a proof that every VaR landscape has only one economically relevant basin. Smoothing may remove unhelpful small-scale features, but it may also change a genuinely important feature of the objective.

## 9. The appendix's smoothing construction

The appendix treats a general order statistic $F(k,x)$, the $(k+1)$st **largest** of smooth functions $f_i(x)$. To translate a lower return quantile into that notation, one must use the corresponding complementary rank or negate returns and adjust the optimization sign.

For a candidate $i$, each subset $\Lambda$ of $k$ other indices represents the condition that those $k$ functions lie above $f_i$, and the remaining functions lie below it. Products of inequality indicators identify where $f_i$ is the selected order statistic. Summing those products gives a nonnegative weight $c_i(x)$; normalizing by $\sum_i c_i(x)$ handles ties, because several functions may attain the same order-statistic value.

Replace each step indicator by a smooth function $\varphi_\epsilon(z)$ that equals one for nonpositive arguments, tends to zero for positive arguments as $\epsilon\downarrow0$, and stays bounded away from zero on the nonpositive half-line. The smooth coefficients are

$$
c_i^\epsilon(x)=\sum_{|\Lambda|=k}
\prod_{j\in\Lambda}\varphi_\epsilon(f_i-f_j)
\prod_{j\notin\Lambda,\,j\ne i}\varphi_\epsilon(f_j-f_i),
$$

and

$$
F_\epsilon(k,x)=\frac{\sum_i c_i^\epsilon(x)f_i(x)}
{\sum_i c_i^\epsilon(x)}.
$$

Theorem 2 establishes twice-continuous differentiability for positive smoothing and pointwise convergence to the order statistic under its conditions. The denominator stays positive because at least one ordering-consistent term remains positive. Pointwise objective convergence alone is not a proof that the output of an arbitrary local nonlinear solver converges to the global optimizer of the original problem.

For computation, the paper chooses a compact transition spline with $\varphi_\epsilon(z)=0$ beyond $\epsilon$. Only scenarios whose values lie within $\epsilon$ of the selected order statistic can contribute. This has two benefits: fewer active terms in ordinary instances and an intuitive smoothing scale measured in return units. Scaling returns from decimals to percent requires scaling $\epsilon$ accordingly.

The apparently combinatorial sums of products are evaluated recursively through elementary-symmetric-sum calculations. Theorem 5 bounds additional arithmetic operations by $N^3+12N^2+3N$, after the $f_i(x)$ have already been computed. This is polynomial overhead, not a linear-time guarantee; computing scenario returns itself costs order $Nn$. The authors expect substantially smaller work when only a small neighborhood of the quantile is active. The theorem's count is for objective evaluation, not a bound on the number of nonlinear-optimization iterations.

## 10. Optimization and the postprocessing sign issue

The smoothed problem is handled using MATLAB `fmincon`, with `linprog` for a final ordering-region improvement. The source describes the result as a global or good local solution of the smooth problem; no global certificate is generally produced.

Fix the current quantile scenario $j$ and a set $\Lambda$ of $\lfloor\alpha N\rfloor$ scenarios below it. Linear inequalities can preserve this order region:

$$
x^\top(\xi^i-\xi^j)\le0\quad(i\in\Lambda),\qquad
x^\top(\xi^i-\xi^j)\ge0\quad(i\notin\Lambda).
$$

Within it, the lower quantile is $x^\top\xi^j$. For the negative-quantile objective, the correct local problem **maximizes** $x^\top\xi^j$; for centered VaR it minimizes $x^\top(e-\xi^j)$. The local PDF's equation (16) instead prints minimization of $x^\top\xi^j$, which is inconsistent with its earlier minimization of $-V(x)$. That displayed sign should not be copied into an implementation.

Remaining within a fixed ordering cell can improve the objective from the starting point, but it does not establish local optimality across adjacent cells, much less global optimality. Enumerating active scenarios and below-quantile subsets leads back to a combinatorial problem. The source acknowledges occasional cases in which its computed VaR solution is worse than the variance- or CVaR-optimized comparator, direct evidence that the method is heuristic rather than a certified global solver.

## 11. Experiments and concrete results

The first illustrations use a 36-stock NYSE data set beginning in July 1962. One Ford–HP comparison uses 500 observations of ten-day returns at 95% confidence. Substituting the CVaR optimum for the VaR optimum raises VaR by about 7.9% in that example and changes expected return by about 30.3% under the paper's relative-error convention. Other stock-pair examples differ in magnitude and even in the direction of the return change.

The larger study uses sixteen US-dollar indices: equity and bond indices for the United States, United Kingdom, Italy, Japan, Russia, Argentina, Brazil, and Mexico. Data run from 19 January 1999 to 15 May 2002; dropping dates with missing emerging-market information leaves 829 complete trading days. This period includes the Argentine crisis and a turbulent equity market, but remains a relatively short and historically specific sample.

The detailed daily-return experiment uses 250-day estimation windows and 579 rolling frontiers for each risk criterion. Feasible target means are chosen from a grid from zero to 0.8% daily with spacing 0.004%, yielding 35,459 optimization instances per risk measure. The high target grid is a device for mapping feasible frontiers; it is not a claim that those daily means are realistic forward forecasts.

In sample, VaR improvement over the CVaR allocation exceeds 10% in 43.69% of cases, and improvement over the variance allocation exceeds 10% in 57.67%. The mean average frontier distances in VaR space are 7.98% versus CVaR and 9.76% versus standard deviation. Averaging each frontier's **largest** relative gap yields 30.81% and 30.44%. These latter figures are not the average improvement at an arbitrary target return; they first select the worst difference on each frontier.

The out-of-sample study holds portfolios for one to sixty subsequent trading days, collects returns across rolling formation dates, and evaluates their empirical VaR. Table 5 reports average advantages of 4.5% over CVaR and 1.6% over standard deviation, with maxima of 9.8% and 7.1% over the reported target range. The prose also mentions up to 17% in another experiment and fund-management improvements of 14–20%, but details of those additional fund experiments are available only on request rather than fully documented in the local article.

Overlapping formation and holding windows create dependence. The article reports comparative empirical risk values, not a complete inferential test establishing a stable population improvement. Sample-optimal VaR can also overfit the few observations near a tail quantile, particularly with a short estimation window.

## 12. Interpretation for portfolio construction

The result is criterion specific: optimizing a tail quantile can produce a different portfolio from optimizing the average of the tail or overall variance. Under special distributional structures, such as jointly Gaussian returns at a fixed mean, those criteria can share the same minimum-variance solution up to monotone transformations. The empirical differences therefore do not mean the frontiers must always differ.

A lower VaR does not imply smaller losses beyond the quantile, greater expected utility, or better overall investment performance. The paper's recommendation applies to an investor whose chosen constraint or objective is explicitly VaR. It does not establish VaR as normatively superior to CVaR or variance.

Implementation should retain a consistent sign convention, tail probability, treatment of mean centering and ties, and smoothing scale. Exact empirical VaR should be reevaluated at the final portfolio, alongside sensitivity to starting points and smoothing parameters. Transaction costs, estimation uncertainty, market impact, and changing asset availability are separate from the mathematical smoothing problem and are not resolved by its favorable numerical behavior.
