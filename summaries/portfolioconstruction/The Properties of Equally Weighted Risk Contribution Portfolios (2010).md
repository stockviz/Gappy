# The Properties of Equally Weighted Risk Contribution Portfolios (2010)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioDiversification_Maillard_2010.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

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

   - Under the equal-correlation assumption, equal volatilities reduce inverse-volatility weights to equal weight, so ERC = $1/n$. Equal volatilities alone are insufficient when correlations differ.
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
\min_{y>0}
\frac12 y^\top \Sigma y - c\sum_{i=1}^N \log y_i
$$
for any constant $c>0$, followed by normalization $w=y/(\mathbf1^\top y)$. The absence of a budget constraint during this solve is essential; see Section 6.

This representation clarifies why ERC sits between minimum variance and equal weight. The quadratic term pulls toward GMV, while the $-\sum \log w_i$ term penalizes concentration. ERC is therefore not just a verbal compromise between the two portfolios; it is the optimizer of a precise convex trade-off between risk minimization and diversification.

# 5. Domain of applicability

- ERC is tailored to settings where **volatility** is the relevant risk measure and long-only implementation matters.
- It is not a return-optimal rule unless one adds extra assumptions linking Sharpe ratios and correlations.
- The method depends heavily on the covariance estimate; unstable covariance input gives unstable risk contributions.
- The claim that ERC is “well diversified” is valid in the specific sense of equalizing total volatility contributions, not in every possible sense of diversification.

## 6. Correct convex formulation and uniqueness

The published paper is *Journal of Portfolio Management* 36(4), Summer 2010, pp. 60-70. Appendix A minimizes volatility over positive **unnormalized** holdings with a lower bound on $\sum_i\log y_i$, and normalizes afterward. An equivalent convenient implementation is

$$
y^*=\arg\min_{y>0}\left\{\tfrac12y^\top\Sigma y-b\sum_i\log y_i\right\},\qquad
w=\frac{y^*}{\mathbf1^\top y^*},\quad b>0.
$$

The first-order equations are $y_i(\Sigma y)_i=b$ for every $i$. Normalization changes every contribution by the same factor, preserving equality. Positive-definite covariance makes the objective strictly convex and coercive; the log term excludes the boundary. Thus a unique positive solution exists, and its normalized weights do not depend on the arbitrary scale $b$.

Adding $\mathbf1^\top y=1$ *inside* this penalized problem generally introduces a multiplier $\nu$, giving $y_i(\Sigma y)_i=b-\nu y_i$, which does not equalize contributions unless the parameters are specially calibrated. The earlier shortcut that treated any simplex-constrained log barrier as ERC is therefore incorrect. The paper's budget-constrained representation instead uses the particular diversification-constraint level associated with the ERC solution.

The Hessian of the unconstrained positive-holdings formulation is

$$
\Sigma+b\operatorname{diag}(y_i^{-2})\succ0.
$$

This supplies a straightforward numerical route and an objective stopping criterion. A replication should verify $w_i(\Sigma w)_i/(w^\top\Sigma w)=1/n$ directly after solving. Small changes in an optimizer's objective are not themselves evidence that risk budgets are equal.

## 7. Three different equalities and a precise volatility ordering

Equal weighting sets $w_i=w_j$. An interior minimum-variance solution equalizes marginal volatility contributions. ERC equalizes weight times marginal contribution. For a long-only minimum-variance solution, KKT conditions imply equal marginal risk only across assets with positive weights; excluded assets can have larger marginal risk. Under the same covariance matrix and long-only budget constraint, the paper proves

$$
\sigma_{\rm MV}\le\sigma_{\rm ERC}\le\sigma_{1/n}.
$$

The proof considers minimum variance subject to $\sum_i\log w_i\ge c$. At $c=-\infty$ this is minimum variance; at $c=-n\log n$, Jensen's inequality leaves only equal weight. Tightening the diversification constraint cannot decrease the optimal variance, and the ERC allocation corresponds to an intermediate level of $c$. This ordering is an ex-ante statement using one common covariance matrix. It does not imply an unconditional ordering of future realized risks under estimation error or changing markets.

Equal individual volatilities alone do not imply equal weights solve ERC. Correlation row structure also matters. At equal weights and equal volatilities, risk contributions are proportional to the row sums of the correlation matrix; ERC requires those sums to agree. Equal correlation is a sufficient symmetry condition. In general, the source's inverse-beta expression $w_i=1/(n\beta_i)$ is implicit because $\beta_i$ is beta to the very portfolio being solved for.

ERC is a maximum-Sharpe allocation under the special combination of constant pairwise correlation and equal individual Sharpe ratios. Without those assumptions, it should be treated as a risk-budgeting choice. Equal ex-ante component budgets do not establish equal factor risk or equal contributions to every tail event.

## 8. The four-asset example and empirical study

With asset volatilities of 10%, 20%, 30% and 40% and constant correlation, ERC weights are 48%, 24%, 16% and 12%. Minimum variance is much more concentrated: at 50% correlation it invests entirely in the lowest-volatility asset; at zero correlation, weights are approximately 70.2%, 17.6%, 7.8% and 4.4%. This illustrates how inverse volatility and inverse variance lead to different allocations even before heterogeneous correlations are considered.

For a second example, assets 1 and 2 have correlation 0.8, assets 3 and 4 have correlation -0.5, and the other cross correlations are zero. The reported ERC weights are approximately 38.4%, 19.2%, 24.3% and 18.2%, with rounding accounting for the total. Portfolio volatility is 10.3%, between 8.6% for minimum variance and 11.5% for equal weighting. Equal weight puts about 47.2% of total risk in asset 4; ERC assigns 25% to each asset.

The historical illustration uses eight agricultural commodity series with descriptive data from January 1979-March 2008. Portfolios rebalance monthly; risk estimates use a rolling year of daily returns. The study compares compound return, volatility, Sharpe ratio using the federal funds rate, VaR, short-horizon and maximum drawdowns, weight/risk-contribution concentration, and turnover.

The paper reports Sharpe ratios of 0.27 for equal weight, 0.74 for minimum variance, and 0.49 for ERC. Average reported turnover is 4.90% for minimum variance and 1.86% for ERC. Minimum variance benefits heavily from live cattle being both low risk and high return in the sample; roughly 40% of its average capital allocation lies there. ERC's advantage in that comparison is broader participation and more stable weights, not the largest historical Sharpe ratio. The source's zero turnover statistic for the equal-weight rule reflects its reporting convention and should not be interpreted as a claim that maintaining equal weights in real markets requires no trading.

## 9. Reproduction and portfolio-management implications

Use a positive-definite covariance estimate, solve for positive holdings, normalize, and recalculate all marginal and total contributions independently. Compare ERC with inverse volatility, equal weight, and constrained minimum variance on the same return sample and at a common leverage convention. If asset weights are capped after the ERC solve, budgets will generally no longer be equal; bounds belong inside an explicitly modified allocation problem.

The asset partition is a modeling choice. Splitting one economic exposure into several highly similar funds gives it several nominal budgets and can alter the allocation without adding economic diversification. A factor-level or hierarchical budget is a distinct specification, not something automatically supplied by asset-level ERC. Likewise, leveraging ERC to match an equity benchmark introduces funding and drawdown risks absent from the unlevered comparison.

The source emphasizes covariance-based diversification without expected-return estimates. It still depends on covariance estimation, can rebalance in stressed markets, and does not establish universal net outperformance. Its most durable results are the risk-budget equations, the positive-holdings convex representation, the special-case formulas, and the exact ex-ante volatility ordering.
