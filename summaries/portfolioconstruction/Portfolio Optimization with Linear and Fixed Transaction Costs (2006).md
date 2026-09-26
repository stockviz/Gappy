# Portfolio Optimization with Linear and Fixed Transaction Costs (2006)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/portfoliooptimization_BoydFazelSusalobo_2006.pdf>), 25 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

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
   -\dfrac{\beta_i}{\ell_i}x_i - \alpha_i x_i, & x_i\le 0.
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

   The relaxation gives an upper bound, the heuristic, after exact-cost feasibility repair, gives a feasible portfolio (hence a lower bound), and the numerical gap is often small. If needed, the pair can be embedded inside branch-and-bound.

### Proof sketch

The exact convex case follows from standard convexity: linear cost plus convex risk constraints preserve convex feasible sets. The convex-envelope result is exact because the convex envelope is the largest convex underestimator on the bounded interval, so replacing $\phi_i$ by $\phi_i^{ce}$ relaxes the problem but preserves computational tractability. The heuristic is not proved globally optimal; it is justified as a reweighted-$\ell_1$-type approximation to the sparse trade activation structure induced by fixed costs.

## 5. Domain of applicability

The framework applies to single-period portfolio optimization with known first and second moments and with convex risk constraints. It is strongest for proportional costs and still useful with fixed ticket costs because of the bound-plus-heuristic architecture. It does not solve genuinely dynamic execution, nonlinear market impact, learning about return moments, or strategic price feedback. The branch-and-bound exact approach also scales poorly when the active-set combinatorics become very large.


## 6. Units, budget accounting, and convexity

The decision variables are dollar trades, not normalized post-cost weights. The initial holdings are $w$, the trades are $x$, and the investable holdings after costs are $h=w+x$. If starting wealth is normalized to one, then $\mathbf1^\top h$ is generally below one because costs consume wealth. Renormalizing $h$ to sum to one without changing the budget would artificially replace spent capital.

The exact self-financing equation is $\mathbf1^\top x+\phi(x)=0$. The paper uses its inequality version to obtain a convex feasible set when $\phi$ is convex. Equivalence to equality at the optimum depends on being able to deploy unused wealth beneficially while satisfying the remaining constraints. A nonnegative-cost function and positive expected gross returns motivate this in the intended setting; arbitrary additional caps or prohibitions on cash can make the issue nontrivial. An implementation should explicitly include the funding or cash asset and verify the economic budget.

Proportional buy and sell costs can differ. Writing $x=x^+-x^-$ with nonnegative components makes the costs $\alpha^{+\top}x^++\alpha^{-\top}x^-$. The resulting optimization is convex, although maximizing expected terminal wealth is conventionally described as concave maximization because the linear objective is both convex and concave. The method does not require a diagonal or one-factor covariance matrix.

Risk constraints use the covariance of **gross asset returns** to calculate the variance of terminal dollar wealth. A positive-semidefinite matrix is sufficient for the norm representation $\|\Sigma^{1/2}h\|_2\le\sigma_{\max}$. A risk-free asset produces a zero covariance row and column; a matrix inverse cannot then be used indiscriminately even though a square root and the cone representation remain valid.

## 7. Less obvious convex portfolio constraints

The paper shows that limiting the largest $r$ positions is convex. If $h_{[i]}$ denotes the $i$th largest holding, the restriction

$$
\sum_{i=1}^{r}h_{[i]}\le\gamma\mathbf1^\top h
$$

can be imposed with auxiliary variables $t$ and $y_i$:

$$
rt+\sum_i y_i\le\gamma\mathbf1^\top h,
\qquad y_i\ge h_i-t,\quad y_i\ge0.
$$

This avoids explicitly enumerating every subset of $r$ assets. The identity follows from the linear-programming dual of maximizing $\sum_i h_i z_i$ subject to $0\le z_i\le1$ and $\sum_i z_i=r$. The same idea can apply to concentrations across asset classes. It controls the sum of the largest holdings; it is not a constraint requiring at most $r$ nonzero positions.

Bounds on individual short positions and on total short exposure also have simple linear epigraph representations. For example, $\sum_i(-h_i)^+\le S$ is implemented using $s_i\ge-h_i$, $s_i\ge0$, and $\sum_i s_i\le S$. Care is needed with collateral constraints expressed as ratios of positive and negative holdings: their convex representation depends on the complete budget and exposure structure, rather than on treating a difference of two arbitrary convex functions as automatically convex.

## 8. Probability constraints and distributional assumptions

When returns are jointly Gaussian, terminal wealth has mean $m=\bar a^\top h$ and standard deviation $s=\|\Sigma^{1/2}h\|_2$. For confidence $\eta\ge1/2$,

$$
\Pr(W\ge W_{\mathrm{low}})\ge\eta
\quad\Longleftrightarrow\quad
\Phi^{-1}(\eta)s\le m-W_{\mathrm{low}}.
$$

This is a second-order cone constraint because the normal quantile is nonnegative. Multiple loss levels and confidence levels can be included simultaneously. Maximizing the lower wealth threshold with fixed confidence is also convex. Maximizing confidence itself can be handled through a sequence of feasibility problems, using bisection; it is not the same single convex problem with a variable normal quantile.

The Gaussian assumption is essential to the exact probability interpretation. The article explicitly recognizes skewness and heavy tails. Its alternative based only on first and second moments replaces the normal quantile by the conservative Chebyshev factor $(1-\eta)^{-1/2}$. This is a sufficient distribution-free bound, not an exact characterization of the probability. One should not silently retain a Gaussian quantile when claiming robustness to all distributions with the specified moments.

## 9. The relaxation certificate and the sign of selling costs

For symmetric fixed-plus-linear costs and finite positive trade bounds $-\ell_i\le x_i\le u_i$, the correct convex envelope is

$$
\phi_i^{ce}(x_i)=
\begin{cases}
(\beta_i/u_i+\alpha_i)x_i,&x_i\ge0,\\
-(\beta_i/\ell_i+\alpha_i)x_i,&x_i\le0.
\end{cases}
$$

Both fixed and proportional contributions are nonnegative on a sale. A formula with $+\alpha_i x_i$ on the negative branch has the wrong sign. The envelope touches the true cost at zero and at each bound and lies below it between those points. Consequently, its solution usually underpays the actual fixed fees and is **not** an executable solution of the original budget constraint.

The relaxed optimum provides an upper bound for expected-wealth maximization. In a cost-minimization formulation, the corresponding relaxed objective provides a lower bound. The direction of a certificate follows the optimization orientation, not the word “relaxation” alone.

Tight trade bounds improve the envelope. If $\Sigma$ is positive definite and $h^\top\Sigma h\le\sigma^2$, then the ellipsoid alone implies

$$
-\sigma\sqrt{(\Sigma^{-1})_{ii}}-w_i
\le x_i\le
\sigma\sqrt{(\Sigma^{-1})_{ii}}-w_i.
$$

These are derived by maximizing or minimizing a coordinate over the risk ellipsoid. They require an invertible covariance matrix; a cash direction or another null direction may be unbounded by variance alone. Budget, short-sale, and concentration limits can supply tighter valid bounds.

## 10. Heuristic feasibility and what convergence means

At each iteration the algorithm amortizes the fixed fee over the previous trade magnitude, using slope $\alpha_i+\beta_i/(|x_i^{k-1}|+\delta)$. Small trades become expensive in the next solve, often driving them to zero. The sparsity is in **trades**, not necessarily in final holdings: an existing diversified portfolio can retain many untouched positions.

A stationary iterate with positive $\delta$ is only approximately consistent with true fixed costs. For a nonzero trade,

$$
\frac{\beta_i|x_i|}{|x_i|+\delta}<\beta_i.
$$

The discrepancy can matter when several trades are of order $\delta$. Thresholding tiny trades and evaluating exact fees are therefore required before describing the result as feasible. The paper suggests a final convex solve with the selected support fixed and the exact fixed fees charged. Once that solution satisfies the original constraints, its objective is a legitimate lower bound for the maximization problem. Combining it with the initial envelope bound produces an instance-specific optimality gap.

Appendix B proves a convergence property for the version that successively reweights a **cost objective** over a compact convex set. For nonnegative variables it uses the descent function $\prod_i(x_i+\delta)$, or equivalently $\sum_i\log(x_i+\delta)$, and the arithmetic–geometric mean inequality to establish diminishing successive differences. The appendix explicitly says the proof is harder when reweighting a constraint, as in the main expected-wealth formulation. It should not be cited as a proof of global optimality or of convergence of every possible variant. Matching first-order conditions with a concave log surrogate identifies the heuristic's local nature; first-order stationarity alone is not a general global or local minimum certificate for arbitrary nonconvex problems.

## 11. Numerical experiments and their meaning

The source estimates moments from one year of daily prices for the first 100 S&P 500 stocks alphabetically by ticker with complete data from 9 January 1998 to 8 January 1999, then scales them to a 20-day holding period. The authors explicitly use this simple estimation method to demonstrate the optimizer, not to establish a superior return model.

The proportional-cost example contains 100 stocks and cash, with 1% buy/sell costs, a zero-cost cash asset, individual shorting limits, and two probability constraints: wealth below 0.9 may occur with at most 20% probability, and wealth below 0.7 with at most 3%. The tighter disaster constraint binds in the illustrated solution. Historical computation time of roughly three minutes for a 202-variable SOCP is a fact about the software and hardware then used, not a present-day performance benchmark.

For ten stocks plus cash, exhaustive search allows comparison with the actual global optimum. The heuristic nearly coincides with that optimum and costs roughly one-thousandth as much computation in the example. For 100 stocks plus cash, exhaustive search is omitted; the close upper and lower bounds establish that a large unobserved improvement is impossible within the fitted optimization instance. Typical convergence is reported in about four iterations or fewer. None of these observations is a worst-case guarantee.

The source also treats index tracking using expected squared tracking difference,

$$
\mathbb E[(a^\top(h-v))^2]
=(h-v)^\top(\Sigma+\bar a\bar a^\top)(h-v).
$$

This includes the squared mean tracking difference and is not identical to tracking-error variance alone. The same relaxation/heuristic architecture applies when sparse trading is desired. Dynamic decisions about delaying a trade, stochastic future opportunities, and execution over time remain separate, more difficult problems; the article closes by identifying them as extensions.
