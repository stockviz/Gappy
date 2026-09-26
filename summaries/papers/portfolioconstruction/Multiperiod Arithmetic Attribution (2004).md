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

   A natural first idea is to multiply every period’s effects by the same factor
   $$
   A=\frac{R-\bar R}{\sum_{t=1}^T (R_t-\bar R_t)},
   $$
   so that linked effects are uniformly “stretched.” This is intuitive and metric preserving, but by itself can fail robustness or exact consistency in edge cases.

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
