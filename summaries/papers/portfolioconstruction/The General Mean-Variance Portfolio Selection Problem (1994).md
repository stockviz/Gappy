## 1. Metadata

- **Title:** The General Mean-Variance Portfolio Selection Problem
- **Author(s):** Harry M. Markowitz
- **Year:** 1994
- **Journal/Venue:** *Philosophical Transactions of the Royal Society A*

## 2. Problem statement

Markowitz asks for the general solution of mean-variance portfolio choice when the investor faces arbitrary linear equality/inequality constraints, possible no-short-sale restrictions, and a covariance matrix that may be only positive semidefinite. The problem is to characterize:

1. feasibility,
2. the full efficient $(E,V)$ set,
3. and a complete nonredundant set of efficient portfolios.

## 3. Approach (short)

The paper gives a geometric/KKT treatment of constrained quadratic optimization and explains the critical-line algorithm in its most general form. The method belongs to quadratic programming under linear constraints, with the efficient frontier assembled from finitely many active-set regions. On each region the portfolio weights are affine in a scalar parameter, so the frontier is piecewise parabolic.

## 4. Approach (detailed)

1. **State the general problem.**

   Let returns $r\in\mathbb{R}^n$ have mean $\mu$ and covariance matrix $C\succeq 0$. A portfolio $x\in\mathbb{R}^n$ has mean and variance
   $$
   E=\mu^\top x,\qquad V=x^\top Cx.
   $$
   Feasible portfolios satisfy
   $$
   Ax=b,\qquad x\ge 0,
   $$
   after converting general linear inequalities and sign-unrestricted variables into standard form via slack variables and variable splitting.

2. **Define efficiency correctly.**

   A feasible $(E,V)$ pair is inefficient if there exists another feasible pair $(E_1,V_1)$ with
   $$
   E_1\ge E,\quad V_1\le V,
   $$
   and at least one strict inequality. Efficient points are the Pareto frontier of the feasible mean-variance set.

3. **Fix an active set and solve the KKT system.**

   Let $IN$ denote the assets with positive weights and $OUT$ those at zero weight. For a fixed active set, the KKT first-order conditions become a linear system in the weights and multipliers. Consequently the portfolio on that active set is affine in a scalar frontier parameter (Markowitz uses a parameter tied to the expected-return constraint):
   $$
   x(\lambda)=x^{(0)}+\lambda x^{(1)}.
   $$
   Because
   $$
   E(\lambda)=\mu^\top x(\lambda)
   $$
   is affine and
   $$
   V(\lambda)=x(\lambda)^\top Cx(\lambda)
   $$
   is quadratic, each active-set segment traces a parabola in $(E,V)$-space.

4. **Assemble the frontier from critical lines.**

   Starting from the highest-return feasible basis, follow the current active-set solution until either:

   - an in-asset weight hits zero, or
   - an out-asset Kuhn-Tucker multiplier hits zero.

   At that breakpoint, exactly one asset enters or leaves the active set in the nondegenerate case. The next segment is computed from the new KKT system. Repeating this gives a finite sequence of adjacent critical lines.

5. **Explain the geometry.**

   The paper's central exact result is:

   - excluding the exceptional case of unbounded $E$ with singular $C$, the efficient set in $(E,V)$-space is **piecewise parabolic** with finitely many pieces;
   - there exists a complete nonredundant set of efficient portfolios that is **piecewise linear** in the frontier parameter.

6. **Handle singular covariance matrices.**

   If $C$ is singular, efficient portfolios for a given $(E,V)$ need not be unique. This is not a pathology for the algorithm: slack variables and exogenous assets naturally create singularity. The critical-line construction still works because it tracks active sets and multipliers, not invertibility of the unrestricted covariance matrix alone.

7. **Address degeneracy and cycling.**

   Degeneracy occurs when multiple weights or multipliers hit zero simultaneously. Markowitz discusses anti-cycling logic analogous to perturbation methods in linear programming: one can conceptually add lexicographic perturbations to $b$ and $\mu$ to select a unique path through active sets. In practice, finite-precision roundoff is the relevant implementation issue.

### Proof sketch

For a fixed active set, the feasible KKT conditions are linear, so $x(\lambda)$ is affine in the frontier parameter $\lambda$. Therefore $E(\lambda)$ is affine and $V(\lambda)$ quadratic, giving parabolic frontier pieces. Because there are finitely many active sets, only finitely many pieces can arise. Breakpoints occur only when an active-set feasibility or complementary-slackness inequality binds. Hence the efficient frontier is a finite union of parabolic arcs, and the associated portfolio path is piecewise linear.

## 5. Domain of applicability

The method applies to single-period mean-variance optimization with linear constraints, no-short constraints, exogenous assets, turnover-like linear restrictions, and positive semidefinite covariance matrices. It does not by itself solve estimation error, dynamic rebalancing, nonlinear trading costs, or nonquadratic preferences. The proof support is strongest for the static quadratic program; broader claims about practical numerical robustness depend on implementation quality and conditioning.
