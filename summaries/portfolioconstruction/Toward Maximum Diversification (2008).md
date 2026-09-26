# Toward Maximum Diversification (2008)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioSelection_ChouefaityCoignard_2008.pdf>), 13 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

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
for the unrestricted problem with an admissible normalization and invertible risk matrix. The paper then derives geometric properties of the solution, especially equal correlation of all included assets with the MDP.

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

   For the unrestricted interior solution, and on the free support of the basic long-only solution, assets have the same correlation with the MDP; additional binding constraints alter this property. The logic is immediate from the FOCs. Since
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

   For the unrestricted solution, the paper shows that the correlation of a general portfolio $P$ with the MDP is proportional to its diversification ratio. In the notation of the paper,
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


# 6. Constraint qualifications, empirical design, and interpretation

## 6.1 Bibliography and the scope of the closed form

The source is The Journal of Portfolio Management, Fall 2008, pp. 40-51. It combines deterministic covariance algebra with historical U.S. and Eurozone equity comparisons. The formulas involving $\Sigma^{-1}\sigma$ apply to an unrestricted direction with an admissible normalization. The actual empirical strategy has long-only, individual weight, aggregate concentration, and risk-contribution constraints. It is therefore not obtained simply by using the unrestricted formula and clipping negative entries.

For positive individual volatilities, write $D_\sigma=\operatorname{diag}(\sigma)$ and define

$$
s=\frac{D_\sigma w}{\sigma^Tw}.
$$

Then $\mathbf1^Ts=1$ and $D(w)=1/\sqrt{s^TCs}$. This identity is exact when the denominator used for scaling is positive. If $w\ge0$, then $s\ge0$. Arbitrary original weight bounds must also be transformed; they do not disappear merely because the objective becomes a minimum-variance problem in correlation space.

Equivalently, the scale-free long-only problem can be solved as

$$
\min_{y\ge0}\ y^T\Sigma y
\quad\text{s.t.}\quad\sigma^Ty=1,
$$

then normalized to a unit-budget portfolio. Additional constraints that are not homogeneous need the appropriate scaling variable and transformed constraints. These details determine whether the convenient convex reformulation remains faithful to the mandate.

## 6.2 Equal correlations: equality on the support, inequality outside

For the long-only normalized problem, KKT conditions give

$$
2\Sigma y-\lambda\sigma-\nu=0,
\quad\nu\ge0,\quad\nu_i y_i=0.
$$

Thus $\operatorname{Cov}(r_i,r_y)/\sigma_i$ is constant for strictly positive weights, and at least that constant for excluded assets. Included assets have the same correlation with the MDP; excluded assets have no smaller correlation in this basic long-only problem. An excluded asset fails to offer enough marginal diversification to merit inclusion.

With binding upper weight or other exposure restrictions, their multipliers alter this characterization. Equal correlation need not hold for every included asset in the empirically constrained portfolio. Likewise,

$$
\rho(P,MDP)=D(P)/D(MDP)
$$

is an unrestricted first-order-condition identity, not a universal relation for every constrained maximum-diversification solution and every candidate portfolio. In the simple long-only case it holds for portfolios supported on the same unconstrained-in-support assets; additional omitted-asset terms can prevent equality otherwise.

This restriction is important when using the ratio as an attribution measure. The optimizer's mandate changes the geometry, even though the definition of diversification ratio itself remains unchanged.

## 6.3 MDP is not generally equal risk contribution

In the unconstrained interior solution, $\Sigma w$ is proportional to $\sigma$. The contribution of asset $i$ to portfolio variance is then proportional to $w_i\sigma_i$. These contributions need not be equal. They coincide in special structures, including the two-asset or equicorrelation examples where inverse-volatility weights apply.

For two assets with correlation below one, MDP has equal volatility-weighted exposures. With individual volatilities 15% and 30%, this gives weights two thirds and one third. In the source's three-stock example, two banking stocks correlate at 0.9 while each correlates only 0.1 with a pharmaceutical stock; equal individual volatilities then give approximately 25.7%, 25.7%, and 48.6%. The less redundant asset receives more weight even though its standalone volatility is identical.

The numerator $\sum_iw_i\sigma_i$ treats stand-alone volatility as the amount of risk available to diversify. That is a definition, not an axiom that all forms of investment risk must satisfy. The ratio can increase without improving expected return, downside protection, liquidity, or diversification of model errors.

## 6.4 Expected-return assumptions behind Sharpe optimality

If expected excess returns satisfy $\mu=k\sigma$ with $k>0$, maximizing diversification ratio is exactly maximizing Sharpe ratio over the same feasible set. Without this assumption, maximum diversification is a risk-only design criterion whose expected-return performance remains empirical.

The source contrasts three return structures. MDP is supported by equal standalone Sharpe ratios, $\mu_i/\sigma_i=k$. The minimum-variance portfolio is supported as a tangency solution by equal expected excess returns, where the relevant conditions hold. A CAPM market portfolio uses $\mu_i\propto\sigma_i\rho_{i,M}$. The difference between MDP's implied return structure and the CAPM structure is the pricing of correlation with the market.

The authors suggest that markets may price standalone volatility more accurately than correlation, but explicitly acknowledge that their discussion is not a complete equilibrium model. Historical outperformance does not establish that $\mu\propto\sigma$ is a population law.

## 6.5 Reconstructing the backtest

The source uses S&P 500 and Dow Jones Euro Stoxx Large Cap data from December 1990 to February 2008. It estimates covariance from 250 daily observations, recomputes portfolios at month ends, and begins the reported performance comparison in December 1991. Securities with fewer than 250 prior daily observations are excluded from a month's optimization.

The portfolios are long-only. Individual contributions to risk are capped at 4%, individual weights at 10%, and the total of positions exceeding 5% is constrained below 40% under the stated UCITS III framework. These rules are historical experiment specifications, not a statement of current investment regulation. The paper compares MDP, minimum variance, equal weight, and market capitalization benchmarks on each regional universe.

The reported full-period figures are:

| Region/strategy | Annualized return | Volatility | Sharpe |
|---|---:|---:|---:|
| Eurozone MDP | 17.9% | 13.9% | 0.96 |
| Eurozone market cap | 11.3% | 17.9% | 0.37 |
| Eurozone minimum variance | 16.1% | 13.3% | 0.87 |
| Eurozone equal weight | 14.0% | 18.1% | 0.52 |
| U.S. MDP | 12.7% | 12.7% | 0.66 |
| U.S. market cap | 9.6% | 13.4% | 0.39 |
| U.S. minimum variance | 10.1% | 9.9% | 0.59 |
| U.S. equal weight | 12.0% | 14.3% | 0.54 |

The U.S. subperiods matter: MDP lagged the benchmark's Sharpe during 1992-2000 but substantially exceeded it during 2001-2008. The headline full-period dominance is therefore not uniform superiority in every market regime.

## 6.6 Factor attribution and robustness illustrations

The authors run three-factor regressions using market, value, and size proxies. Full-period Eurozone MDP monthly intercept is about 0.50%, with a $t$-statistic of 4.14; the U.S. intercept is about 0.26%, with a $t$-statistic of 1.83. Multiplying by twelve produces the article's roughly 6.0% and 3.1% annualized intercepts. These are regression alphas under those factor definitions, not model-free measures of skill.

MDP has lower market beta and nontrivial size exposures. The broader Eurozone ERA model attribution over April 1999-February 2008 assigns a substantial part of active return to the residual category. The source itself notes that residual performance can include omitted common factors and changing exposures, not merely stock-specific forecasting skill.

Randomly excluding one third of securities in three subset exercises yields similar performance, and the source reports roughly 30-60 stocks held in MDP. This suggests some substitutability among names carrying similar diversification exposures. It does not establish a universal theorem of holdings stability. A small change in covariance can still cause a large change among equivalent or near-equivalent holdings.

The reported diversification ratio is roughly 1.5 times the benchmark's over the illustrated Eurozone sample. This is an ex ante risk-model ratio, not a guaranteed multiplier of realized return or Sharpe.

## 6.7 Practical limitations and useful implementation checks

Risk-only optimization still estimates $N(N-1)/2$ correlations. Small eigenvalues can amplify covariance noise, especially with shorts. The paper recommends positivity and weight bounds as stabilizers and observes relatively similar results under alternative estimation choices. Such observations do not eliminate parameter uncertainty or establish that all covariance estimators are interchangeable.

A reproducible implementation should specify point-in-time index membership, corporate-action-adjusted returns, treatment of delistings, exact risk-contribution definitions, solver tolerances, and all constraint transformations. Performance should be compared after turnover and liquidity costs. A monthly optimizer holding a relatively concentrated subset can trade materially when correlations change; the source's reported return table alone is insufficient to quantify net capacity.

Useful diagnostics include the achieved ratio, active constraints, correlation of each asset with the portfolio, excluded assets' KKT inequalities, factor exposures, and stability under covariance perturbations. These separate the mathematical diversification objective from the economic desirability of its resulting portfolio. The central contribution is an explicit, tractable definition of maximum diversification, supported by historical examples, with Sharpe optimality conditional on a specific expected-return structure.
