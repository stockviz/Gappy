## 1. Metadata

- **Title:** Portfolio Optimization with Linear and Fixed Transaction Costs
- **Author(s):** Miguel Sousa Lobo, Maryam Fazel, and Stephen Boyd
- **Year:** 2006
- **Journal/Venue:** *Annals of Operations Research*

## 2. Problem statement

The paper studies single-period portfolio selection with realistic transaction costs. The precise problem is to maximize expected end-of-period wealth (or equivalently minimize cost for a target return) subject to risk and portfolio constraints when transaction costs may contain:

1. linear bid-ask or proportional terms,
2. fixed ticket costs,
3. and convex risk constraints such as variance and shortfall limits.

The key difficulty is that fixed costs make the problem nonconvex and combinatorial.

## 3. Approach (short)

The method separates the convex and nonconvex parts. With linear costs and convex constraints, the problem is cast as a convex program, often a second-order cone program (SOCP). With fixed costs, the authors derive a convex-envelope relaxation that provides an upper bound and an iterative reweighted-convex heuristic that provides a sparse feasible portfolio and a lower bound. The class of techniques is convex optimization plus relaxation/heuristics for mixed-integer structure.

## 4. Approach (detailed)

1. **Set up the self-financing portfolio problem.**

   Let current holdings be $w$, trades be $x$, and post-trade portfolio be $w+x$. If $a$ is the random vector of gross asset returns, then terminal wealth is
   $$
   W = a^\top (w+x).
   $$
   The self-financing constraint is
   $$
   \mathbf{1}^\top x + \phi(x)\le 0,
   $$
   where $\phi(x)$ is total transaction cost.

2. **Convex case: linear transaction costs.**

   If
   $$
   \phi_i(x_i)=\alpha_i^+ x_i^+ + \alpha_i^- x_i^-,
   $$
   or symmetrically $\phi_i(x_i)=\alpha_i |x_i|$, then the portfolio problem
   $$
   \max_x \; \bar a^\top (w+x)
   $$
   subject to the self-financing condition and convex risk constraints is convex.

   Examples of convex constraints:

   - diversification or box constraints,
   - short-sale constraints,
   - variance bounds
     $$
     (w+x)^\top \Sigma (w+x)\le \sigma^2,
     $$
   - shortfall probability constraints under elliptical/Gaussian modeling.

   Many such problems can be written as SOCPs and solved globally and efficiently.

3. **Nonconvex case: fixed plus linear costs.**

   With ticket costs,
   $$
   \phi_i(x_i)=
   \begin{cases}
   0, & x_i=0,\\
   \beta_i+\alpha_i|x_i|, & x_i\neq 0,
   \end{cases}
   $$
   the problem is nonconvex because activating a trade incurs a discontinuous cost. Exact solution would require enumerating subsets of active trades or using branch-and-bound / mixed-integer methods.

4. **Convex-envelope relaxation.**

   Suppose bounds $-\ell_i\le x_i \le u_i$ are known. The convex envelope of the fixed-cost term over this interval is
   $$
   \phi_i^{ce}(x_i)=
   \begin{cases}
   \dfrac{\beta_i}{u_i}x_i + \alpha_i x_i, & x_i\ge 0,\\[6pt]
   -\dfrac{\beta_i}{\ell_i}x_i + \alpha_i x_i, & x_i\le 0.
   \end{cases}
   $$
   Replacing $\phi_i$ by $\phi_i^{ce}$ enlarges the feasible set and yields a convex optimization problem. Its optimal value is therefore an **upper bound** on the true optimum of the original maximization problem.

5. **Iterative reweighted heuristic.**

   Starting from the relaxed solution $x^{(0)}$, define at iteration $k$
   $$
   \phi_i^{(k)}(x_i)=\left(\frac{\beta_i}{|x_i^{(k-1)}|+\delta}+\alpha_i\right)|x_i|,
   $$
   with small $\delta>0$. Then solve the resulting convex program and iterate until convergence.

   Interpretation:

   - if the previous iterate traded little in asset $i$, the effective slope is high, discouraging future use;
   - if the previous iterate traded a lot, the fixed cost is spread over a larger trade size, making further use cheaper.

   This induces sparsity and typically converges to a small active trade set.

6. **Bounding logic.**

   The relaxation gives an upper bound, the heuristic gives a feasible portfolio (hence a lower bound), and the numerical gap is often small. If needed, the pair can be embedded inside branch-and-bound.

### Proof sketch

The exact convex case follows from standard convexity: linear cost plus convex risk constraints preserve convex feasible sets. The convex-envelope result is exact because the convex envelope is the largest convex underestimator on the bounded interval, so replacing $\phi_i$ by $\phi_i^{ce}$ relaxes the problem but preserves computational tractability. The heuristic is not proved globally optimal; it is justified as a reweighted-$\ell_1$-type approximation to the sparse trade activation structure induced by fixed costs.

## 5. Domain of applicability

The framework applies to single-period portfolio optimization with known first and second moments and with convex risk constraints. It is strongest for proportional costs and still useful with fixed ticket costs because of the bound-plus-heuristic architecture. It does not solve genuinely dynamic execution, nonlinear market impact, learning about return moments, or strategic price feedback. The branch-and-bound exact approach also scales poorly when the active-set combinatorics become very large.
