# Multiperiod Arithmetic Attribution (2004)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioPerformance_Menchero_2004.PDF>), 16 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Multiperiod Arithmetic Attribution
- **Author(s):** Jose Menchero
- **Year:** 2004
- **Journal/Venue:** *Financial Analysts Journal*

# 2. Problem statement

The paper asks: **how should one link single-period arithmetic attribution effects across time so that the multiperiod decomposition remains intuitive, residual free, commutative, metric preserving, and fully linkable?** The mathematical issue is that
$$
R-\bar R \neq \sum_{t=1}^T (R_t-\bar R_t)
$$
because of geometric compounding, yet arithmetic attribution wants to decompose the left-hand side into linked allocation, selection, and interaction effects.

# 3. Approach (short)

The method is constrained linear linking. Menchero starts from the one-period Brinson decomposition, defines linked effects as weighted sums of single-period effects with coefficients $\beta_t$, and then derives the “optimized” coefficients by minimizing deviation from a natural uniform scaling subject to exact residual-free linking. The paper’s contribution is an axiomatic comparison of linking algorithms and an explicit optimized solution.

# 4. Approach (detailed)

1. **Single-period arithmetic attribution**

   For sector $i$ at date $t$, with portfolio weights $w_{it}$, benchmark weights $\bar w_{it}$, portfolio sector returns $r_{it}$, benchmark sector returns $\bar r_{it}$, and total benchmark return $\bar R_t$, define:
   $$
   I_{it}=\bar w_{it}(r_{it}-\bar r_{it}) \quad\text{(issue/selection)},
   $$
   $$
   S_{it}=(w_{it}-\bar w_{it})(\bar r_{it}-\bar R_t) \quad\text{(allocation)},
   $$
   $$
   U_{it}=(w_{it}-\bar w_{it})(r_{it}-\bar r_{it}) \quad\text{(interaction)}.
   $$
   Then
   $$
   R_t-\bar R_t = \sum_i (I_{it}+S_{it}+U_{it}).
   $$

2. **Why multiperiod arithmetic linking is hard**

   Over $T$ periods,
   $$
   1+R=\prod_{t=1}^T (1+R_t),\qquad
   1+\bar R=\prod_{t=1}^T (1+\bar R_t),
   $$
   so the total arithmetic active return is
   $$
   R-\bar R,
   $$
   but in general
   $$
   R-\bar R\ne \sum_{t=1}^T (R_t-\bar R_t).
   $$
   A linking method therefore chooses coefficients $\beta_t$ and sets
   $$
   \hat I_i=\sum_{t=1}^T \beta_t I_{it},\qquad
   \hat S_i=\sum_{t=1}^T \beta_t S_{it},\qquad
   \hat U_i=\sum_{t=1}^T \beta_t U_{it},
   $$
   with the residual-free requirement
   $$
   \sum_{t=1}^T \beta_t (R_t-\bar R_t)=R-\bar R.
   $$

3. **Axioms for a sound arithmetic linking rule**

   Menchero argues a credible linking algorithm should satisfy:
   - intuitiveness;
   - transparency;
   - robustness;
   - residual freedom;
   - commutativity (independence of time ordering);
   - metric preservation (equal relative-performance periods receive equal treatment);
   - full linkability across levels of the attribution hierarchy.

4. **Natural scaling**

   Menchero defines the natural scale by equivalent constant subperiod returns:
   $$
   A=\frac{R-\bar R}{T[(1+R)^{1/T}-(1+\bar R)^{1/T}]}.
   $$
   This is distinct from the potentially unstable ratio of compounded active return to summed periodic active returns. Equal-total-return limits are given below.

5. **Optimized linking coefficients**

   Menchero’s optimized method chooses coefficients closest to the natural scaling $A$ while forcing exact residual freedom:
   $$
   \min_{\beta_1,\dots,\beta_T} \sum_{t=1}^T (\beta_t-A)^2
   \quad\text{s.t.}\quad
   \sum_{t=1}^T \beta_t(R_t-\bar R_t)=R-\bar R.
   $$
   The Lagrange solution is affine in period active return:
   $$
   \beta_t^{Opt}=A+\gamma (R_t-\bar R_t),
   $$
   where $\gamma$ is chosen to satisfy the constraint. This yields a residual-free method that distorts the natural scaling as little as possible.

6. **Comparison with logarithmic linking**

   Menchero contrasts the optimized coefficients with Cariño’s logarithmic coefficients, which depend on the local slope of $\log(1+r)$:
   $$
   \beta_t^{Log}
   \propto
   \frac{\log(1+R_t)-\log(1+\bar R_t)}{R_t-\bar R_t}.
   $$
   The log method is residual free and commutative, but because the coefficients vary with absolute return levels, two periods with equal arithmetic active return can receive different weights. Menchero treats this as a violation of metric preservation.

7. **Proof logic for the optimized method**

   The proof is straightforward constrained quadratic minimization. Form the Lagrangian
   $$
   \mathcal L(\beta,\lambda)
   =
   \sum_t (\beta_t-A)^2
   +\lambda\left(\sum_t \beta_t(R_t-\bar R_t)-(R-\bar R)\right).
   $$
   First-order conditions imply
   $$
   2(\beta_t-A)+\lambda(R_t-\bar R_t)=0,
   $$
   hence
   $$
   \beta_t=A-\frac{\lambda}{2}(R_t-\bar R_t).
   $$
   Plugging into the constraint determines $\lambda$, giving the optimized coefficients. Because all levels of attribution use the same $\beta_t$, the method is fully linkable.

8. **Why the paper favors the optimized rule**

   The optimized algorithm preserves exact arithmetic attribution while staying as close as possible to the intuitive uniform stretch $A$. Menchero’s examples show that alternative linking rules can create spurious issue-selection or interaction effects simply because returns were high or low in certain periods, not because the manager made different decisions.

# 5. Domain of applicability

The method applies to arithmetic attribution systems built from one-period effects such as Brinson-style allocation/selection/interaction decompositions. It is especially relevant when users insist on arithmetic rather than geometric attribution. The axiomatic case for the optimized rule is strong within that arithmetic framework, but it does not show arithmetic attribution is superior to geometric attribution overall. The results also assume the attribution model itself is appropriate; the paper solves the **linking** problem, not the deeper modeling problem of which one-period effects should exist.


## 6. Correct natural scaling and closed-form coefficients

The scalar $A$ in the optimized method is **not** the ratio of compounded active return to the sum of periodic active returns. That latter ratio is the ad hoc smoothing coefficient criticized in the paper. With $R$ and $B$ denoting the geometrically compounded portfolio and benchmark returns over $T$ subperiods, Menchero's natural scaling is

$$
A=\frac{R-B}{T\left[(1+R)^{1/T}-(1+B)^{1/T}\right]}.
$$

It compares the arithmetic difference in reporting-period returns with the difference in equivalent constant subperiod returns. If $R=B$, the continuous limit is

$$
A=(1+R)^{(T-1)/T}.
$$

For one period $A=1$. Gross portfolio and benchmark returns must be positive for the fractional powers and logarithmic comparisons used here. Degenerate or bankrupt return paths need separate treatment rather than an unguarded evaluation of the formulas.

Let $a_t=r_t-b_t$ be the arithmetic active return in period $t$. Define

$$
C=\frac{R-B-A\sum_t a_t}{\sum_t a_t^2},\qquad
\beta_t=A+C a_t.
$$

Then

$$
\sum_t\beta_t a_t
=A\sum_t a_t+C\sum_t a_t^2=R-B.
$$

These coefficients are the unique Euclidean projection of the constant vector $A\mathbf1$ onto the hyperplane $a^\top\beta=R-B$ when $a\ne0$. If every $a_t=0$, then $R=B$ and no adjustment is needed; the displayed formula for $C$ should not be evaluated as $0/0$. Individual attribution effects can still offset within a zero-active-return period, so their reporting convention should remain explicit.

The mathematical optimality claim is narrow and exact: among coefficients satisfying the residual constraint, these minimize squared deviations from the chosen baseline $A$. It is not a proof that one can recover a unique causal dollar contribution of every investment decision from returns alone. The choice of arithmetic metric, attribution model, and baseline is part of the methodological framework.

## 7. Four properties and the hierarchy they govern

**Residual freedom** requires the reported components to sum exactly to $R-B$. It is necessary for reconciliation, but insufficient for meaning: arbitrarily reallocating a residual can still distort the explanation.

**Commutativity** means permuting the time order of the same single-period return/effect records does not change the linked result. Compounded terminal portfolio and benchmark returns are individually order independent, and the optimized coefficients depend on the collection of active returns rather than on cumulative returns at each date. This property is a choice suited to the paper's arithmetic decision-attribution interpretation; chronological wealth contributions answer a different accounting question.

**Metric preservation** means equal arithmetic active returns receive equal treatment. In the optimized rule $a_t=a_s$ implies $\beta_t=\beta_s$. The claim should not be overstated at the component level: if total active returns differ, two equal individual stock-selection effects can receive different coefficients. The source acknowledges this variation and minimizes its squared size around the natural scale. Exact component equality is obtained in its examples when every total active return is the same.

**Full linkability** concerns aggregation across the attribution hierarchy. If a sector's single-period effect equals the sum of its stock-level effects, using the same $\beta_t$ at all levels preserves that identity after linking. Re-estimating a separate coefficient sequence independently for each sector would generally break the top-down reconciliation. This is not an unrestricted claim that arbitrary separately linked subperiod reports can always be linked again without retaining the underlying information or using a consistent construction.

## 8. Why residual-free alternatives can disagree economically

Cariño's logarithmic coefficients take the form $\beta_t=k_t/k$, where

$$
k_t=\frac{\log(1+r_t)-\log(1+b_t)}{r_t-b_t},\qquad
k=\frac{\log(1+R)-\log(1+B)}{R-B}.
$$

The equal-return limits use the derivative of the logarithm. This method is residual free, commutative, and compatible with hierarchical summation. However, $k_t$ changes with absolute return levels even when $r_t-b_t$ is unchanged. In the arithmetic framework, low-return periods can receive larger scaling coefficients solely because the logarithm is steeper there.

The paper's second three-period example holds active return at 40 basis points in every period while changing total portfolio returns from 0.8% to 11.6% to 17.2%. A large-cap sector produces selection effects of −2.00%, +0.20%, and +2.00%. The optimized coefficient is about 1.200 throughout, so linked selection is +0.24%. The logarithmic coefficients are approximately 1.303, 1.177, and 1.120, producing −0.13%. The altered sign is caused by linking weights associated with returns elsewhere in the portfolio, not a change in the specified large-cap selection decisions.

Compounded notional-portfolio methods build hypothetical return series for allocation or selection and compound those series separately. The resulting totals can reconcile, but a nonlinear cross term can create an interaction contribution even when the original interaction effect is zero in every sector and period. In the paper's first example, optimized and logarithmic methods report 1.20% allocation, 0.24% selection, and zero interaction, summing to 1.44%. The notional method instead reports 1.15%, 0.19%, and 0.09%. Menchero's objection is specifically that the positive interaction is generated by the linking construction despite being absent from the manager's modeled decisions.

Recursive methods use accumulated wealth factors. Mirabelli's and Frongello's schemes can reconcile the total and aggregate across sectors, but the source classifies them as neither commutative nor metric preserving. The article gives an example in which cumulative portfolio and benchmark returns begin at 10% and 20%. A subsequent portfolio return of 10%, compared with 9.5% for the benchmark, improves the period's relative performance but changes cumulative arithmetic active return from −10% to −10.4%. Assigning the full cumulative deterioration to that period's decisions yields a negative contribution despite positive periodic active return. The example highlights the difference between a wealth-accounting increment and the decision effect the paper seeks to preserve.

## 9. The smoothing failure and the appendix's evidence

The ad hoc coefficient

$$
Q=\frac{R-B}{\sum_t a_t}
$$

can become enormous when the denominator nearly cancels, and can be negative when compounded and summed active returns have different signs. Both defects are material even though the final arithmetic total reconciles exactly.

In the source's two-period illustration, portfolio return is 10% in both periods, while benchmark returns are 5.1% and 15.0%. The periodic active returns sum to −0.1%, but compounded active return is +0.135%; hence $Q=-1.35$. Positive selection effects of 6.9% and 2.0% become a linked selection of −12.015%, while negative allocation effects become +12.150%. The optimized coefficients, about 1.124 and 1.075, instead give selection +9.906% and allocation −9.771%, preserving the decision signs in this example while still summing to +0.135%.

Appendix A motivates $A$ by its one-period and infinitesimal-subperiod limits and by numerical simulations. In the fixed-reporting-period limit, its natural scale tends to

$$
\frac{R-B}{\log(1+R)-\log(1+B)},
$$

which also appears in the logarithmic method. The argument is a limiting calculation for increasingly small return increments; it should not be generalized without checking the behavior of the return path and quadratic-variation terms in a different continuous-time stochastic model.

The simulation uses twelve monthly periods, benchmark mean about 1% and volatility about 5.8% per month, and portfolio returns correlated to produce annualized tracking error of 4%. Experiments with 100,000 replications per scaling parameter support a minimum of average squared adjustment near the proposed baseline. A separate million-replication exercise finds sign reversal for the ad hoc scaling in roughly 2% of cases. That figure is conditional on the simulation design, not an estimated universal frequency for all investment accounts.

## 10. Implementation and interpretation

An implementation should first reconcile the single-period attribution, then compute compounded returns, use stable equal-return limits, calculate one sequence of optimized coefficients, and apply it consistently to every component and hierarchy level. Floating-point tolerances should distinguish a genuinely zero vector of active returns from a nearly cancelling sum; the latter is precisely where the ad hoc ratio fails.

This article provides worked examples and simulations of attribution behavior, not a backtest of a trading strategy. Its criterion of accuracy is internal consistency with a specified arithmetic interpretation. Different one-period decision models, geometric relative performance, cash-flow accounting, multicurrency conventions, and intraperiod trading require corresponding modeling choices before any linking formula can be evaluated.
