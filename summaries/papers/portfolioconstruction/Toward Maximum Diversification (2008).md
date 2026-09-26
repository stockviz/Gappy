# 1. Metadata

- **Title:** Toward Maximum Diversification
- **Author(s):** Yves Choueifaty, Yves Coignard
- **Year:** 2008
- **Journal/Venue:** *The Journal of Portfolio Management*

# 2. Problem statement

The paper asks how to define and solve a portfolio optimization problem whose objective is **diversification itself**, rather than expected return, minimum variance, or mean-variance efficiency. The proposed answer is the **Most Diversified Portfolio (MDP)**, defined as the portfolio maximizing the diversification ratio
$$
D(w)=\frac{w^\top \sigma}{\sqrt{w^\top \Sigma w}},
$$
where $\sigma=(\sigma_1,\dots,\sigma_N)^\top$ is the vector of individual volatilities and $\Sigma$ is the covariance matrix.

# 3. Approach (short)

The paper rewrites the diversification problem in a “synthetic asset” space where every asset has unit volatility. In that space, maximizing the diversification ratio becomes a minimum-variance problem over the correlation matrix. This yields a closed-form characterization of the MDP:
$$
w^{MDP}\propto \Sigma^{-1}\sigma
$$
under invertibility. The paper then derives geometric properties of the solution, especially equal correlation of all included assets with the MDP.

# 4. Approach (detailed)

1. **Diversification ratio**

   The central definition is
   $$
   D(w)=\frac{\sum_{i=1}^N w_i \sigma_i}{\sqrt{w^\top \Sigma w}}.
   $$
   The numerator is the weighted average of stand-alone volatilities; the denominator is portfolio volatility. If all assets are perfectly correlated, then the two coincide and $D(w)=1$. Diversification corresponds to making the denominator small relative to the numerator.

2. **Synthetic-asset transformation**

   Let $C$ be the correlation matrix and $D_\sigma=\operatorname{diag}(\sigma_1,\dots,\sigma_N)$, so
   $$
   \Sigma=D_\sigma C D_\sigma.
   $$
   Define synthetic unit-volatility assets, or equivalently rescaled exposures, by moving from $w$ to weights $s$ over unit-volatility assets:
   $$
   s_i \propto w_i \sigma_i,
   \qquad \sum_i s_i=1.
   $$
   In this space, portfolio volatility is
   $$
   \sqrt{s^\top C s}.
   $$
   Since the numerator of the diversification ratio is just the scaling used to normalize $s$, maximizing $D(w)$ is equivalent to
   $$
   \min_s s^\top C s
   \quad\text{s.t.}\quad
   \mathbf 1^\top s=1.
   $$
   This is the paper’s main reduction: **maximum diversification is minimum variance on equal-volatility synthetic assets**.

3. **Closed-form solution**

   Solve the quadratic program
   $$
   \min_s s^\top C s
   \quad\text{s.t.}\quad
   \mathbf 1^\top s=1.
   $$
   If $C$ is invertible, the first-order condition is
   $$
   2Cs-\lambda \mathbf 1=0,
   $$
   hence
   $$
   s^\star \propto C^{-1}\mathbf 1.
   $$
   Returning to original asset weights gives
   $$
   w^{MDP}\propto D_\sigma^{-1} C^{-1}\mathbf 1.
   $$
   Since $\Sigma^{-1}=D_\sigma^{-1} C^{-1} D_\sigma^{-1}$, this is equivalently
   $$
   w^{MDP}\propto \Sigma^{-1}\sigma.
   $$
   After normalization,
   $$
   w^{MDP}=\frac{\Sigma^{-1}\sigma}{\mathbf 1^\top \Sigma^{-1}\sigma}.
   $$

4. **Special cases**

   - If all correlations are equal, $C=(1-\rho)I+\rho \mathbf 1\mathbf 1^\top$, then
     $$
     C^{-1}\mathbf 1 \propto \mathbf 1,
     $$
     so
     $$
     w_i^{MDP}\propto \frac{1}{\sigma_i}.
     $$
     Thus inverse-volatility weighting is a special case of the MDP.

   - If, in addition, all volatilities are equal, the MDP becomes equal weight.

5. **Geometric property: equal correlation to the MDP**

   One of the paper’s most important characterizations is that every asset with positive weight in the MDP has the same correlation with the MDP. The logic is immediate from the FOCs. Since
   $$
   s^\star \propto C^{-1}\mathbf 1,
   $$
   we have
   $$
   Cs^\star = \kappa \mathbf 1
   $$
   for some scalar $\kappa$. But the $i$-th element of $Cs^\star$ is proportional to the covariance between synthetic asset $i$ and the synthetic MDP. Because both the synthetic assets and the synthetic MDP are scaled to unit-volatility objects, this means every included asset has the same correlation with the MDP.

   In original-space notation this yields the interpretation that the MDP is the portfolio to which all included assets have equal “diversifying relevance.”

6. **Relation between correlation and diversification ratio**

   The paper further shows that the correlation of a general portfolio $P$ with the MDP is proportional to its diversification ratio. In the notation of the paper,
   $$
   \rho(P,MDP)=\frac{D(P)}{D(MDP)}.
   $$
   This follows from substituting $w^{MDP}\propto \Sigma^{-1}\sigma$ into the definition of correlation and simplifying:
   $$
   \rho(P,MDP)
   =
   \frac{w_P^\top \Sigma w^{MDP}}{\sigma_P \sigma_{MDP}}
   \propto
   \frac{w_P^\top \sigma}{\sigma_P}
   =D(P).
   $$
   Hence the MDP is the direction in portfolio space against which diversification can be measured by simple correlation.

7. **Proof structure**

   The mathematics is exact and simple:

   - rewrite $\Sigma$ as $D_\sigma C D_\sigma$;
   - normalize by total volatility-weighted exposure to move to the synthetic space;
   - solve a standard minimum-variance problem in $C$;
   - map back to original weights.

   There is no asymptotic approximation here; the core results are deterministic linear algebra.

**Additional mathematical details**

The unconstrained problem is especially transparent. Because $D(w)$ is homogeneous of degree zero, one may normalize by $w^\top \sigma = 1$ and solve
$$
\min_w \; w^\top \Sigma w
\qquad\text{s.t.}\qquad
w^\top \sigma = 1.
$$
The Lagrangian condition $2\Sigma w-\lambda \sigma=0$ gives
$$
w^\star=\frac{\Sigma^{-1}\sigma}{\sigma^\top \Sigma^{-1}\sigma},
\qquad
D(w^\star)=\sqrt{\sigma^\top \Sigma^{-1}\sigma}.
$$
So the paper’s headline formula is the exact optimizer of a scale-normalized quadratic program, not a heuristic diversification recipe.

Writing $\Sigma=\operatorname{diag}(\sigma)C\operatorname{diag}(\sigma)$ and $x=\operatorname{diag}(\sigma)w$, one gets
$$
D(w)=\frac{\mathbf 1^\top x}{\sqrt{x^\top Cx}}.
$$
In the transformed unit-volatility space, the MDP is therefore the minimum-variance portfolio with respect to the correlation matrix $C$. The long-only case replaces the closed form by KKT conditions, but the geometry is unchanged.

# 5. Domain of applicability

- The method applies whenever portfolio risk is summarized by **volatility** and one is willing to define diversification through the ratio $D(w)$.
- The clean closed form requires invertibility of the correlation matrix $C$ (equivalently, enough non-collinearity in the covariance matrix).
- The paper is strongest for **long-only diversification design**. Once expected returns, constraints, leverage, or transaction costs matter, MDP is only one candidate risk-allocation rule among many.
- The broader claim that MDP is the “best diversified” portfolio is definition-dependent: it is true relative to the diversification ratio, not relative to all possible notions of diversification.
