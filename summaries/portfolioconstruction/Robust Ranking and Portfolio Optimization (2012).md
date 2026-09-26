# Robust Ranking and Portfolio Optimization (2012)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioRankingRobustMVO_NguyenLo_2012.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Robust Ranking and Portfolio Optimization
- **Author(s):** Tri-Dung Nguyen, Andrew W. Lo
- **Year:** 2012
- **Journal/Venue:** *European Journal of Operational Research*

# 2. Problem statement

The paper studies portfolio construction when the investor trusts only ordinal information about assets, and even that ranking is uncertain. Formally, there are $n$ objects with ranking vector $R\in\mathcal U(R)\subseteq P(1,\dots,n)$, where $\mathcal U(R)$ is a discrete uncertainty set of admissible rankings. The decision maker chooses $x\in\mathcal P(x)$ to solve the minimax problem
$$
\max_{x\in\mathcal P(x)} \min_{R\in\mathcal U(R)} f(x,R).
$$
The economic question is how to build robust portfolios when exact expected returns are too noisy to estimate, but partial ranking information is available.

# 3. Approach (short)

The method is robust optimization with cutting planes. Nguyen and Lo formulate ranking uncertainty as a discrete adversarial set, solve the resulting minimax problem by constraint generation, and show that when the objective is separable in the ranks the worst-case ranking subproblem reduces to a network-flow/assignment problem. They then apply the framework to long-short portfolio construction using post-earnings-announcement-drift rankings.

# 4. Approach (detailed)

1. **Generic robust ranking formulation**

   Let $R_j\in\{1,\dots,n\}$ denote the rank assigned to object $j$, with $R$ a permutation vector. The robust problem is
   $$
   \max_{x\in\mathcal P(x)} \min_{R\in\mathcal U(R)} f(x,R),
   $$
   where $\mathcal P(x)$ encodes portfolio or decision constraints and $\mathcal U(R)$ encodes uncertainty about the ranking.

   This is a discrete minimax program. The inner problem is combinatorial because the adversary chooses a permutation, not a continuous perturbation.

2. **Constraint generation master problem**

   Start from a finite subset $S^{(k)}\subseteq \mathcal U(R)$. The relaxed master problem is
   $$
   \max_{x,d}\ d
   \quad\text{s.t.}\quad
   d\le f(x,R)\ \forall R\in S^{(k)},\qquad x\in\mathcal P(x).
   $$
   After solving the master, one computes the worst-case ranking
   $$
   R^{worst}=\arg\min_{R\in\mathcal U(R)} f(x^{(k)},R).
   $$
   If $R^{worst}\in S^{(k)}$, the algorithm terminates. Otherwise, add the violated ranking to the scenario set and repeat.

   Proposition 1 proves the stopping rule: the relaxed solution is optimal for the original problem if and only if the newly generated worst-case ranking is already in the active set. This is the standard correctness argument for cutting-plane methods, but here the cuts are indexed by permutations.

3. **Separable worst-case ranking subproblem**

   The crucial structural assumption is separability:
   $$
   f(x,R)=\sum_{i=1}^n g_i(x_i,R_i).
   $$
   Under this condition, the inner adversarial problem is
   $$
   \min_{R\in\mathcal U(R)} \sum_{i=1}^n g_i(x_i,R_i),
   $$
   which is an assignment problem once the ranking uncertainty set has the permutation property. Proposition 2 shows that this can be reformulated as a transportation/network-flow problem:
   - one side of the bipartite graph is assets $i$,
   - the other side is admissible ranks $j$,
   - assigning asset $i$ to rank $j$ carries cost $g_i(x_i,j)$,
   - the permutation constraint is exactly unit flow conservation.

   This is the paper’s main computational insight. The nasty combinatorics survive only in the inner permutation problem, and that problem becomes polynomial-time solvable.

4. **Complexity statement**

   Proposition 3 states that if:
   - $\mathcal P(x)$ is polyhedral, and
   - $f(x,R)$ is separable,

   and $f(x,R)$ is linear in $x$, then the robust ranking problem is polynomial-time solvable via the ellipsoid method, because the separation oracle is polynomial-time. In practice the authors use the much simpler constraint-generation algorithm rather than ellipsoid, but the complexity result clarifies that the model is not intractable by construction.

5. **Non-uniform uncertainty sets**

   The paper also allows rankings far from a nominal ranking $\bar R$ to be penalized more heavily, by modifying the inner objective to
   $$
   f'(x,R)=f(x,R)+c\|R-\bar R\|_1,
   $$
   or its rankwise equivalent
   $$
   f'(x,R)=\sum_i \bigl(g_i(x_i,R_i)+c|R_i-\bar R_i|\bigr).
   $$
   Proposition 4 shows that the same network-flow representation survives because separability is preserved rank-by-rank.

6. **Portfolio application**

   In the portfolio setting, the ranking substitutes for exact expected returns. Rather than estimate $\mu_i$ directly, the investor uses a rank-based signal and optimizes against the worst ranking consistent with the uncertainty set. The feasible set $\mathcal P(x)$ includes portfolio constraints; the paper discusses both mean-variance-type and Sharpe-ratio-type formulations.

   The practical interpretation is:
   - the rank determines which assets are expected to be “better” or “worse”;
   - the robust optimizer chooses weights that remain acceptable even if the true ordering is the least favorable admissible one.

7. **Empirical design**

   The application uses DJIA stocks and post-earnings-announcement drift to form nominal rankings and uncertainty intervals. The robust portfolios are then compared with nonrobust portfolios. The main empirical finding is not higher raw return but lower realized risk: the robust portfolios damp the damage from ranking error.

8. **Proof sketch of the main results**

   - **Proposition 1:** If the worst ranking for the current $x^{(k)}$ is already in the active set, then the relaxed problem already enforces the true worst-case value at $x^{(k)}$, so $x^{(k)}$ solves the original minimax problem. Conversely, if some omitted ranking is worse, the relaxed optimum is too optimistic.
   - **Proposition 2:** Introduce binary assignment variables $z_{ij}$ indicating whether asset $i$ receives rank $j$. Then
     $$
     \min_{z_{ij}\in\{0,1\}}\sum_{i,j} g_i(x_i,j)z_{ij}
     $$
     subject to
     $$
     \sum_j z_{ij}=1,\qquad \sum_i z_{ij}=1,
     $$
     plus uncertainty-set restrictions, is exactly a transportation problem.
   - **Proposition 3:** Once the inner problem is a polynomial separation oracle, standard robust-optimization complexity results apply.

   These are exact results. The empirical claims about portfolio quality are of course not proved by the theory.

# 5. Domain of applicability

- The framework applies whenever the investor’s information is fundamentally ordinal rather than cardinal, and ranking uncertainty can be encoded as a discrete admissible set.
- It is most natural for cross-sectional long-short equity selection, analyst rankings, or other preference orderings.
- The computational guarantees depend on separability of $f(x,R)$ in the ranks. If the objective couples ranks in a more complex way, the network-flow reduction fails.
- The model is robust to ranking error, not to all forms of return-model misspecification. It deliberately discards cardinal mean information.
- The paper’s true novelty is the assignment/network-flow representation of worst-case ranking generation inside a robust portfolio problem.

# 6. The uncertainty set is a constrained assignment, not independent intervals

The set is $\{R\in\mathcal P(1,\ldots,n):R_i\in Q_i\}$, where $Q_i$ contains the ranks permitted for asset $i$. Even when each $Q_i$ is an interval, asset ranks cannot be selected independently: every rank must be used exactly once. Assigning every asset its worst individual rank generally creates an impossible ranking.

For fixed $x$, solve
$$
\min_z\sum_{i,j}g_i(x,j)z_{ij},\quad
\sum_jz_{ij}=1,\quad\sum_iz_{ij}=1,\quad z_{ij}\geq0,
$$
with prohibited assignments removed. Integrality of the bipartite assignment polytope gives an integral optimum without requiring a general-purpose mixed-integer solver. Feasibility should be checked: nonempty $Q_i$ for each asset does not guarantee a complete matching. The source also extends the flow construction to grouped ranks by changing rank-node capacities.

Separability is in **the uncertain ranks**, so $g_i$ may depend on the whole decision vector $x$, not only $x_i$. Polynomial solvability of the entire robust problem additionally requires an appropriate tractable master. In the source's Proposition 3, $f$ must be linear in $x$ and $\mathcal P(x)$ polyhedral. A separable rank oracle alone does not make arbitrary nonconvex portfolio constraints tractable.

The master gives an upper bound $d_k$ on the maximin objective, while the oracle at $x_k$ gives the feasible policy's true worst-case value $\ell_k$. A robust numerical stopping test is $d_k-\ell_k\leq\varepsilon$. Reappearance of a stored worst-case ranking is sufficient for exact termination. With ties, a new but equally binding ranking can exist at an optimum, so literal membership is not a necessary condition independent of the oracle's tie-breaking. The objective-gap test expresses the actual certificate more reliably than checking scenario identities.

# 7. Portfolio objectives and conservatism

Model I maximizes the worst weighted rank subject to portfolio normalization and position restrictions. Model II bounds $x^\top\Sigma x$ and maximizes the same rank reward. Its homogeneous reformulation resembles a maximum-Sharpe problem. The numerator is a **rank score**, however, not a forecast in return units. A monotone rank-to-return mapping is an additional assumption, and rescaling such a mapping affects economic interpretation even when rank ordering is unchanged.

The penalty $c\|R-\bar R\|_1$ enters with a positive sign in the adversary's minimization. Larger $c$ makes distant rankings less attractive to the adversary and generally reduces conservatism relative to the nominal ranking. It is not a penalty on the investor's own weight turnover. The source suggests cross-validation for this parameter. Only validation using information available at the decision date can support a deployable rule.

The covariance matrix remains an estimated input in Model II. Robustifying rank uncertainty does not protect against its estimation error, liquidity shocks or misspecified risk factors. Additional constraints can be added to the master while preserving the ranking oracle, provided the master remains solvable.

# 8. Computational and empirical results

The 100-asset, rank-width-20 example requires 264 generated rankings, despite a crude combinatorial count on the order of $20^{100}$. Reported total runtime is 1,360 seconds on the specified 2.67 GHz Xeon machine using Matlab, SeDuMi and Matlog. Average oracle time is $0.88$ seconds and average master time $4.27$ seconds. These measurements support practicality for that formulation and hardware; the worst-case polynomial statement belongs to the ellipsoid/separation argument, not to a proven polynomial iteration bound for this simple cut-generation implementation.

The empirical sample contains **14 selected DJIA stocks**, from 2000–2007, after exclusions for earnings calendars, missing information and corporate changes. Earnings data come from IBES and stock returns from CRSP. Nominal ranks use standardized earnings surprises; positions are formed after quarterly announcements and held for the subsequent quarter. The restricted and retrospectively filtered universe limits generalization and makes point-in-time membership and corporate-action handling important for replication.

Table 3 reports Model I's nonrobust mean return $-4.75\%$, volatility $28.59\%$ and Sharpe $-0.1661$. Rank uncertainty of one position gives $3.52\%,21.62\%,0.1630$; two positions give $9.06\%,17.44\%,0.5194$. Model II's nonrobust figures are $22.21\%,33.90\%,0.6553$; its two-position robust version gives $22.27\%,33.05\%,0.6739$. Risk falls across reported robust variants, while changes in mean and Sharpe are not monotone or uniformly large.

Table 4 deliberately moves the uncertainty set toward or away from **future realized ranks** to illustrate information quality. Its “good information” Sharpe $1.0224$ and “bad information” Sharpe $0.3459$ are sensitivity experiments, not feasible real-time enhancements to the baseline $0.6512$. They demonstrate that robust optimization cannot rescue a badly centered uncertainty set.

# 9. Reproduction priorities

Preserve the rank orientation consistently, build feasible rank sets, check assignment feasibility, and retain the oracle's adverse scenarios for audit. Record master/oracle gaps and solver tolerances. Reconstruct earnings announcement timestamps and available consensus estimates before building quarterly signals; avoid confusing fiscal-quarter labels with information-release dates. Finally compare turnover, gross exposure, financing and trading costs alongside reported mean and volatility. The contribution is a tractable treatment of uncertain ordinal information; profitability depends on whether that information and its uncertainty sets are useful in the actual investable universe.
