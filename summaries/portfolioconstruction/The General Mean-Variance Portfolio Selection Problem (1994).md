# The General Mean-Variance Portfolio Selection Problem (1994)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/MeanVariancePortfolioOptimization_Markowitz_1994.pdf>), 8 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

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

   - excluding feasible problems that have no efficient portfolios (possible with unbounded $E$ and singular $C$), the efficient set in $(E,V)$-space is **piecewise parabolic** with finitely many pieces;
   - there exists a complete nonredundant set of efficient portfolios that is **piecewise linear** in the frontier parameter.

6. **Handle singular covariance matrices.**

   If $C$ is singular, efficient portfolios for a given $(E,V)$ need not be unique. This is not a pathology for the algorithm: slack variables and exogenous assets naturally create singularity. The critical-line construction still works because it tracks active sets and multipliers, not invertibility of the unrestricted covariance matrix alone.

7. **Address degeneracy and cycling.**

   Degeneracy occurs when multiple weights or multipliers hit zero simultaneously. Markowitz discusses anti-cycling logic analogous to perturbation methods in linear programming: one can conceptually add lexicographic perturbations to $b$ and $\mu$ to select a unique path through active sets. In practice, finite-precision roundoff is the relevant implementation issue.

### Proof sketch

For a fixed active set, the feasible KKT conditions are linear, so $x(\lambda)$ is affine in the frontier parameter $\lambda$. Therefore $E(\lambda)$ is affine and $V(\lambda)$ quadratic, giving parabolic frontier pieces. Because there are finitely many active sets, only finitely many pieces can arise. Breakpoints occur only when an active-set feasibility or complementary-slackness inequality binds. Hence the efficient frontier is a finite union of parabolic arcs, and the associated portfolio path is piecewise linear.

## 5. Domain of applicability

The method applies to single-period mean-variance optimization with linear constraints, no-short constraints, exogenous assets, turnover-like linear restrictions, and positive semidefinite covariance matrices. It does not by itself solve estimation error, dynamic rebalancing, nonlinear trading costs, or nonquadratic preferences. The proof support is strongest for the static quadratic program; broader claims about practical numerical robustness depend on implementation quality and conditioning.


## 6. Full formulation and geometric meaning

The source is the 1994 Royal Society article, volume 347, pp. 543-549, together with the printed discussion. Harry M. Markowitz is the article's author; the additional names in the archive cover page are discussants. The article is short and programmatic: it states the general solution and outlines the algorithm, referring to Markowitz's earlier work for detailed development. It does not contain a new empirical comparison of optimized portfolios.

### 6.1 Why standard form is genuinely general

The feasible set $\{x:Ax=b,x\ge0\}$ can express general linear equalities, inequalities, and unrestricted positions. An inequality $a^Tx\le c$ becomes $a^Tx+s=c$ with slack $s\ge0$. An unrestricted holding can be represented as $x_j=x_j^+-x_j^-$ with both parts nonnegative. Upper and lower bounds, industry limits, and turnover restrictions can similarly be represented using auxiliary variables.

This conversion does not create new economic risk. A slack variable has zero return and zero covariance with all investments. Its introduction makes the enlarged covariance matrix singular even when the covariance of the original securities was positive definite. Therefore requiring $C\succ0$ would exclude routine linear modeling transformations, not just pathological financial examples. Positive semidefiniteness is the appropriate general assumption.

An exogenous asset with fixed holdings can represent nonfinancial income or another random endowment. Its covariance with tradable securities affects the optimal hedge. If total payoff is $x^Tr+Y$, the variance contains

$$
\operatorname{Var}(x^Tr+Y)=x^TCx+2x^T\operatorname{Cov}(r,Y)+\operatorname{Var}(Y).
$$

The cross term shifts the portfolio even though $Y$ itself cannot be chosen. Markowitz uses this device to connect static mean-variance analysis with a local approximation to a dynamic problem containing state variables. It is not a claim that all dynamic hedging problems are solved exactly by one static frontier.

### 6.2 Efficient pairs versus efficient portfolios

An efficient mean-variance pair is a point in two-dimensional outcome space. An efficient portfolio is a vector mapping to that point. When $C$ is singular, distinct holdings vectors can have the same mean and variance. A **complete, nonredundant set** selects one representative portfolio for each efficient outcome pair. This is the object that the portfolio path supplies; it need not enumerate every economically equivalent holdings vector.

A particularly important boundary case is the minimum-variance set. Suppose multiple portfolios achieve the same minimum variance but have different means. Only the one or ones with the largest mean are efficient. Merely solving a variance minimization problem and accepting whichever optimum the solver returns can therefore produce a dominated portfolio.

The paper also warns that naive formulations of “maximizes mean at its variance and minimizes variance at its mean” can be inadequate without the proper weak/strict Pareto convention. The correct dominance definition allows one criterion to remain equal while the other improves.

### 6.3 Scalarization and the critical-line system

Use the scalarized problem

$$
\min_{x\ge0,\ Ax=b}\left\{\tfrac12x^TCx-\lambda\mu^Tx\right\},
\qquad \lambda\ge0.
$$

For equality multipliers $\nu$ and nonnegativity multipliers $\eta\ge0$, its KKT conditions are

$$
Cx+A^T\nu-\lambda\mu-\eta=0,
\quad Ax=b,
\quad x\ge0,
\quad \eta\ge0,
\quad x_i\eta_i=0.
$$

For a fixed set $I$ of in-variables, $x_{I^c}=0$ and $\eta_I=0$. If the reduced saddle-point matrix is nonsingular,

$$
\begin{bmatrix}C_{II}&A_I^T\\ A_I&0\end{bmatrix}
\begin{bmatrix}x_I\\\nu\end{bmatrix}
=
\begin{bmatrix}\lambda\mu_I\\b\end{bmatrix}.
$$

Thus $x_I=p_I+\lambda q_I$ and $\nu=u_I+\lambda v_I$. Reduced gradients on out-variables are also affine in $\lambda$. These formulas make a critical line a computable object, not just a geometric metaphor.

The nonsingularity required here is that of the constrained KKT matrix, not of the whole covariance matrix. The source's construction arranges the relevant basis so that the appropriate systems remain nonsingular in the nondegenerate path, despite singular $C$.

### 6.4 Deriving parabolic frontier pieces

On one active-set segment,

$$
E(\lambda)=\mu^Tp+\lambda\mu^Tq,
$$

$$
V(\lambda)=p^TCp+2\lambda p^TCq+\lambda^2q^TCq.
$$

When $\mu^Tq\ne0$, eliminating $\lambda$ gives a quadratic relation between variance and expected return. When a segment degenerates or mean is constant, the result may reduce to a point or a limiting line. The paper explicitly allows such degenerate pieces in its terminology. “Parabolic” here refers to $(E,V)$ coordinates; replacing variance by standard deviation changes the visual shape.

The efficient segment is the interval where all in-weights and out-multipliers remain nonnegative, with a positive trade-off parameter. Most possible active sets yield critical lines with no efficient segment. Enumerating every combination is unnecessary; the algorithm follows adjacent feasible segments.

### 6.5 Initialization, breakpoints, and finite termination

When feasible mean is bounded above and the maximum-mean portfolio is unique and nondegenerate, a linear program finds that starting point. Its basis variables form the first in-set. For sufficiently large $\lambda$, the solution remains at this highest-return corner. Decreasing $\lambda$ eventually makes an out-multiplier zero, allowing a new variable to enter.

On subsequent segments there are two candidate events: an in-weight reaches zero and leaves, or an out-multiplier reaches zero and enters. Compute every admissible breakpoint from the affine formulas and select the next one along the decreasing-$\lambda$ path. Update the active set and continue to the efficient minimum-variance endpoint.

In the nondegenerate case only one event happens at a time, and no in-set repeats. Together with finiteness of the number of sets, this gives finite termination. The source does not claim that arbitrary tie breaking is proved safe for every degenerate instance. That issue is treated separately through perturbation arguments.

### 6.6 Feasibility, unbounded means, and the exceptional case

A linear-programming phase-I procedure determines feasibility and can remove redundant equality rows. Phase II identifies whether maximum expected return is bounded and whether its optimum is unique or degenerate. These are part of solving the *general* problem, not housekeeping to be assumed away.

There exist feasible models with **no efficient portfolios**. An example is a feasible direction $d$ with $Cd=0$ and $\mu^Td>0$ that can be added indefinitely: expected return improves without increasing variance. Every feasible portfolio is dominated. Singular covariance and unbounded attainable mean make this possible, but do not imply it in every case.

This distinction corrects an overbroad reading of the earlier summary. The paper does not exclude every model with unbounded mean and singular covariance. It excludes the case with no efficient portfolio from its frontier description, then discusses how the remaining unbounded problems can be handled. Conceptually imposing a large return cap allows the active-set sequence to stabilize; the original solution can include an unbounded efficient line/parabolic segment.

### 6.7 Degeneracy and numerical precision

Multiple simultaneous entering/leaving events can cause zero-length steps. Analogously to simplex anti-cycling methods, one can conceptually perturb right-hand sides and expected returns by ordered powers of a small positive number. For sufficiently small perturbations the active-set sequence is stable, and its limiting solution describes the original problem. Symbolic lexicographic logic avoids actually adding tiny floating-point numbers.

Markowitz is explicit about the difference between exact arithmetic and numerical implementation. The theoretical invertibility and optimality guarantees assume exact calculations. Floating-point roundoff can cause failures even when the mathematical problem is well-posed. Scaling or an equivalent reformulation often remedies these failures in his reported experience, but that empirical observation is not a numerical error bound.

A practical implementation should test primal residuals $Ax-b$, dual residuals, complementarity, and nonnegativity tolerances at each breakpoint. Very small eigenvalues, almost redundant constraints, and nearly tied expected returns are reasons to assess conditioning before trusting a large change in holdings. Replacing the algorithm with a generic quadratic solver may compute individual frontier points reliably, but does not automatically reconstruct the complete efficient path or resolve duplicate minimum-variance outcomes.

### 6.8 What the printed discussion adds

The discussion asks how transaction costs can be incorporated. Markowitz states that proportional costs can be represented exactly in the framework; affine costs that are not simply proportional receive an approximate treatment in cited work. This is not a claim that arbitrary fixed ticket costs or nonlinear market impact are convex quadratic programs. The structure of the cost model decides the formulation.

Other discussants challenge the usefulness of mean-variance models with poor return data, skewness, kurtosis, and emerging-market histories. These comments reinforce a separation already implicit in the article: an exact optimization algorithm solves the stated estimated problem, but does not certify that the estimated means, covariance, or investor objective are economically adequate.

For a research or production system, the article's contribution is the complete geometry of the constrained static frontier. Forecast estimation, stability under input perturbations, and realized implementation costs remain separate layers. The critical-line representation is especially useful for sensitivity analysis because it exposes the intervals over which the active constraint structure is unchanged and the precise events that make portfolio weights change direction.
