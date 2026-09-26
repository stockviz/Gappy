# 1. Metadata

- **Title:** The Properties of Equally Weighted Risk Contribution Portfolios
- **Author(s):** Sebastien Maillard, Thierry Roncalli, Jerome Teiletche
- **Year:** 2010
- **Journal/Venue:** *The Journal of Portfolio Management*

# 2. Problem statement

The paper asks what exactly an **equal risk contribution (ERC)** portfolio is, how it differs from equal-weight and minimum-variance portfolios, and what theoretical properties it has. The central question is not “equal weights” but **equal contributions to total portfolio volatility**.

# 3. Approach (short)

The paper defines marginal and total risk contributions under portfolio volatility, imposes equality of total risk contributions across assets, and studies the resulting long-only portfolio. It derives explicit formulas in special cases, shows when ERC coincides with inverse-volatility or equal-weight portfolios, and interprets ERC as a portfolio lying between equal-weight and minimum variance.

# 4. Approach (detailed)

1. **Risk contribution decomposition**

   For portfolio weights $x\in\mathbb R^n$, covariance matrix $\Sigma$, and portfolio volatility
   $$
   \sigma(x)=\sqrt{x^\top \Sigma x},
   $$
   the marginal contribution of asset $i$ to risk is
   $$
   \frac{\partial \sigma(x)}{\partial x_i}
   =
   \frac{(\Sigma x)_i}{\sigma(x)}.
   $$
   The total risk contribution (TRC) of asset $i$ is
   $$
   RC_i(x)=x_i\frac{\partial \sigma(x)}{\partial x_i}
   =\frac{x_i(\Sigma x)_i}{\sigma(x)}.
   $$
   Euler homogeneity gives
   $$
   \sigma(x)=\sum_{i=1}^n RC_i(x).
   $$

2. **Definition of ERC**

   The ERC portfolio is defined by
   $$
   RC_i(x)=RC_j(x)\qquad \forall i,j
   $$
   under the long-only and budget constraints
   $$
   x_i\ge 0,\qquad \sum_i x_i=1.
   $$
   Since the denominator $\sigma(x)$ is common across assets, the condition is equivalent to
   $$
   x_i(\Sigma x)_i=x_j(\Sigma x)_j\qquad \forall i,j.
   $$

3. **Two-asset case**

   Let $x=(w,1-w)$, volatilities $\sigma_1,\sigma_2$, and correlation $\rho$. The TRCs are equal iff
   $$
   w^2\sigma_1^2=(1-w)^2\sigma_2^2.
   $$
   Hence
   $$
   w=\frac{\sigma_2}{\sigma_1+\sigma_2},
   \qquad
   1-w=\frac{\sigma_1}{\sigma_1+\sigma_2}.
   $$
   This is a striking result: in the two-asset case, ERC does **not** depend on the correlation.

4. **Equal-correlation case**

   Suppose all pairwise correlations are equal:
   $$
   \rho_{ij}=\rho,\qquad i\neq j.
   $$
   Then the ERC condition simplifies and implies
   $$
   x_i \sigma_i = x_j \sigma_j\qquad \forall i,j.
   $$
   Therefore
   $$
   x_i^{ERC}\propto \frac1{\sigma_i}.
   $$
   So inverse-volatility weights are an exact ERC solution under equal correlation.

5. **Relation to equal weight and minimum variance**

   - If all volatilities are equal, inverse-volatility weights reduce to equal weight, so ERC = $1/n$.
   - If one seeks the lowest possible volatility without any diversification constraint, the solution is the minimum-variance portfolio.

   ERC lies between these extremes. It prevents the minimum-variance solution from concentrating too much risk in low-volatility assets while still using covariance information, unlike $1/n$.

6. **Optimization interpretation**

   ERC can be characterized as the solution of an optimization problem that penalizes dispersion in risk contributions. One convenient formulation is:
   $$
   \min_x \sum_{i=1}^n\sum_{j=1}^n \big(RC_i(x)-RC_j(x)\big)^2
   $$
   subject to $x\ge 0$ and $\mathbf 1^\top x=1$.

   The paper also shows an alternative interpretation: ERC can be viewed as a minimum-variance portfolio under an implicit diversification constraint that prevents any single asset from dominating total risk.

7. **Uniqueness and existence**

   If $\Sigma$ is positive definite, the ERC solution is unique in the long-only simplex. If $\Sigma$ is singular, multiple portfolios can satisfy the equal-contribution condition. This is one reason the paper restricts attention to well-behaved covariance matrices.

8. **Economic meaning**

   ERC equalizes **risk budgets**, not weights. A high-volatility or highly correlated asset can still appear in the portfolio, but only at a weight low enough that its total contribution to risk matches the others. Hence ERC is best interpreted as a risk-budgeting rule rather than a return-forecasting rule.

9. **Proof logic**

   The main calculations are exact:

   - the TRC formula follows from Euler’s theorem for homogeneous functions;
   - the two-asset solution is obtained by equating the two TRCs and solving a scalar quadratic equation;
   - the equal-correlation result follows by substituting $\Sigma_{ij}=\rho\sigma_i\sigma_j$ into the ERC condition.

   There is no asymptotic machinery here; the content is deterministic portfolio algebra.

**Additional mathematical details**

An important implementation fact, implicit in the paper’s derivations, is that the ERC condition
$$
w_i(\Sigma w)_i = w_j(\Sigma w)_j
\qquad \forall i,j
$$
is equivalent to the KKT condition of the convex program
$$
\min_{w>0,\;\mathbf 1^\top w=1}
\frac12 w^\top \Sigma w - c\sum_{i=1}^N \log w_i
$$
for a suitable constant $c>0$. The logarithmic barrier is what forces strictly positive weights and equalizes total risk contributions at the optimum.

This representation clarifies why ERC sits between minimum variance and equal weight. The quadratic term pulls toward GMV, while the $-\sum \log w_i$ term penalizes concentration. ERC is therefore not just a verbal compromise between the two portfolios; it is the optimizer of a precise convex trade-off between risk minimization and diversification.

# 5. Domain of applicability

- ERC is tailored to settings where **volatility** is the relevant risk measure and long-only implementation matters.
- It is not a return-optimal rule unless one adds extra assumptions linking Sharpe ratios and correlations.
- The method depends heavily on the covariance estimate; unstable covariance input gives unstable risk contributions.
- The claim that ERC is “well diversified” is valid in the specific sense of equalizing total volatility contributions, not in every possible sense of diversification.
