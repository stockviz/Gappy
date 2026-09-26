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

   then the robust ranking problem is polynomial-time solvable via the ellipsoid method, because the separation oracle is polynomial-time. In practice the authors use the much simpler constraint-generation algorithm rather than ellipsoid, but the complexity result clarifies that the model is not intractable by construction.

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
