# 1. Metadata

- **Title:** Portfolio Decomposition
- **Author(s):** Dieter Vandenbussche
- **Year:** 2006
- **Journal/Venue:** Technical note / white paper

# 2. Problem statement

The paper asks an implementation-attribution question: **given a constrained optimized portfolio and the corresponding unconstrained mean-variance portfolio, how can the difference be decomposed into additive contributions from individual constraints and objective terms?** The goal is not to solve the optimization problem itself but to allocate “unrealized alpha” and holdings distortion to specific constraints.

# 3. Approach (short)

The method is KKT-based decomposition. Starting from the first-order conditions of a differentiable constrained portfolio optimization problem, the paper rewrites the stationarity equation so that the implied-alpha vector, the holdings vector, and the expected-return shortfall each decompose into sums of terms associated with the objective and each active constraint. This turns dual multipliers into interpretable attribution objects.

# 4. Approach (detailed)

1. **Generic optimization problem**

   The paper considers a broad differentiable problem of the form
   $$
   \max_w \;
   \alpha^\top w - \frac{1}{2r} w^\top Q w
   + \sum_{j\in O} f_j(w)
   $$
   subject to
   $$
   g_i(w)\le 0,\qquad i\in C,
   $$
   where:

   - $\alpha$ is the forecast alpha vector;
   - $Q$ is the active-risk matrix;
   - $r$ is a risk-tolerance scalar;
   - $f_j$ are differentiable objective add-ons;
   - $g_i$ are differentiable constraints.

   The unconstrained mean-variance active portfolio is
   $$
   w^{MV}= r Q^{-1}\alpha.
   $$

2. **KKT stationarity**

   Let $w^\star$ be the constrained optimum and $\lambda_i\ge 0$ the dual multipliers. The first-order condition is
   $$
   \alpha + \sum_{j\in O}\nabla f_j(w^\star)
   - \sum_{i\in C}\lambda_i \nabla g_i(w^\star)
   - \frac{1}{r}Qw^\star = 0.
   $$
   Rearranging,
   $$
   \frac{1}{r}Qw^\star
   =
   \alpha + \sum_{j\in O}\nabla f_j(w^\star)
   - \sum_{i\in C}\lambda_i \nabla g_i(w^\star).
   $$
   The left-hand side is interpreted as the **implied alpha** consistent with the realized constrained portfolio.

3. **Implied-alpha decomposition**

   Define
   $$
   \alpha^{imp} := \frac{1}{r}Qw^\star.
   $$
   Then
   $$
   \alpha^{imp}
   =
   \alpha
   + \sum_{j\in O}\nabla f_j(w^\star)
   - \sum_{i\in C}\lambda_i \nabla g_i(w^\star).
   $$
   Each term on the right is attributable to a specific objective or constraint. This is the implied-alpha decomposition.

4. **Holdings decomposition**

   Premultiplying by $rQ^{-1}$ gives
   $$
   w^\star
   =
   rQ^{-1}\alpha
   + \sum_{j\in O} rQ^{-1}\nabla f_j(w^\star)
   - \sum_{i\in C}\lambda_i rQ^{-1}\nabla g_i(w^\star).
   $$
   Hence
   $$
   w^\star = w^{MV} + \sum_{j\in O} w_j + \sum_{i\in C} w_i,
   $$
   where the attributable portfolio for a constraint $i$ is
   $$
   w_i = -\lambda_i rQ^{-1}\nabla g_i(w^\star).
   $$
   This is the paper’s main constructive result: the deviation from the ideal MV portfolio is the sum of portfolios caused by each active constraint/objective.

5. **Returns decomposition**

   If the expected active return of a portfolio $u$ is $\alpha^\top u$, then the difference between the unconstrained and constrained expected returns can be decomposed by applying $\alpha^\top$ to the holdings decomposition. This produces an additive return shortfall attributable to each constraint group.

6. **Transfer coefficient link**

   Let $y=rQ^{-1}\alpha$ denote the unconstrained ideal active holdings. The transfer coefficient is
   $$
   TC(w)=\frac{w^\top Q y}{\sqrt{w^\top Q w}\sqrt{y^\top Q y}},
   $$
   i.e. the cosine between implemented and ideal portfolios in the $Q$-metric. The return decomposition can therefore be interpreted as a decomposition of implementation inefficiency relative to the ideal active portfolio.

7. **Why the decomposition works**

   The proof is exact KKT algebra. The only substantive assumptions are differentiability and existence of dual multipliers. Once the stationarity condition is written, every decomposition follows by linear transformation:

   - identity map for implied alpha;
   - $rQ^{-1}$ for holdings;
   - $\alpha^\top$ for expected return.

8. **Limits**

   Nondifferentiable constraints, such as gross-exposure or total-short constraints, complicate the analysis because gradients are replaced by subgradients or set-valued KKT terms. The paper notes this and treats the smooth case as the clean theoretical base.

# 5. Domain of applicability

- The decomposition applies to **differentiable constrained portfolio optimizations**.
- It is especially useful for active equity optimizers with many exposure, bound, and turnover constraints.
- The results are exact in the smooth case; nondifferentiable constraints require extensions beyond the note’s core derivation.
- The decomposition is interpretive rather than causal: it attributes the constrained optimum to KKT forces, not to economically independent “effects.”
