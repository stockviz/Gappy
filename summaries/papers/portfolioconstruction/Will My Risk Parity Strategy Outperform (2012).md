# 1. Metadata

- **Title:** Will My Risk Parity Strategy Outperform?
- **Author(s):** Robert M. Anderson, Stephen W. Bianchi, Lisa R. Goldberg
- **Year:** 2012
- **Journal/Venue:** *Financial Analysts Journal* (forthcoming status in file)

# 2. Problem statement

The paper asks whether risk-parity strategies, especially levered risk parity, actually outperform standard benchmarks once one accounts for sample-period choice, financing costs, and turnover. The precise comparison is between four strategies built from U.S. equities and U.S. Treasuries:
$$
\text{value weighted},\quad 60/40,\quad \text{unlevered risk parity},\quad \text{levered risk parity}.
$$

# 3. Approach (short)

The method is historical backtesting with economically disciplined implementation details. The authors specify exact monthly rebalancing formulas for unlevered and levered risk parity, compute realized returns over long samples and subperiods, and examine how borrowing spreads and turnover-induced trading costs alter ranking. The novelty is not a new optimizer but a careful decomposition of why the usual frictionless levered-risk-parity story can fail in practice.

# 4. Approach (detailed)

1. **Unlevered risk parity**

   Asset-class volatility is estimated from a trailing 36-month window:
   $$
   \hat\sigma_{i,t}=\operatorname{std}(r_{i,t-36},\dots,r_{i,t-1}).
   $$
   Unlevered risk-parity weights are inverse-volatility weights:
   $$
   w_{u,i,t}=\delta_t \hat\sigma_{i,t}^{-1},
   \qquad
   \delta_t=\left(\sum_i \hat\sigma_{i,t}^{-1}\right)^{-1}.
   $$
   This equalizes ex ante volatility contributions across the asset classes in the diagonal/two-asset setting.

2. **Levered risk parity**

   Estimate trailing volatility of the unlevered RP portfolio, $\hat\sigma_{u,t}$, and of the value-weighted benchmark, $\hat\sigma_{v,t}$. Set the leverage ratio
   $$
   \ell_t=\frac{\hat\sigma_{v,t}}{\hat\sigma_{u,t}}.
   $$
   Then levered RP weights are
   $$
   w_{l,i,t}=\ell_t\, w_{u,i,t}.
   $$
   The period return includes financing cost on the borrowed amount:
   $$
   r_{l,t}=\sum_i w_{u,i,t}r_{i,t}
   +\sum_i (\ell_t-1)w_{u,i,t}(r_{i,t}-r_{b,t}),
   $$
   where $r_{b,t}$ is the borrowing rate.

3. **Turnover and trading cost measurement**

   If $w_{i,t-1}$ are weights before price moves, post-return weights are
   $$
   \tilde w_{i,t}=\frac{(1+r_{i,t})w_{i,t-1}}{\sum_j (1+r_{j,t})w_{j,t-1}}.
   $$
   Portfolio turnover is
   $$
   x_t=\sum_j |\tilde w_{j,t}-w_{j,t}|,
   $$
   and trading cost is
   $$
   c_t=x_t z_t,
   $$
   with $z_t$ a per-unit trading cost. Because leverage varies through time, turnover for levered RP can be materially larger than for the unlevered strategy.

4. **Evaluation metrics**

   The paper compares:
   - excess return,
   - realized Sharpe ratio,
   - alpha relative to the market benchmark,
   - subperiod cumulative returns.

   The point is not only average performance but whether outperformance survives realistic frictions and long subperiods.

5. **Three main findings**

   - **Sample-period sensitivity:** even over decades, ranking is sensitive to start and end dates.
   - **Financing/trading costs:** borrowing spreads and turnover can reverse the ranking of levered RP against simpler strategies.
   - **Statistical significance is not economic dominance:** a positive long-run average premium does not guarantee outperformance over realistic investor horizons.

6. **Sharpe-ratio logic with leverage**

   If borrowing is above the risk-free rate, leverage bends the capital market line. A levered version of a portfolio need not preserve the unlevered Sharpe ratio:
   $$
   S_L < S_U
   $$
   once financing is charged above $r_f$. This is central to the paper’s criticism of frictionless levered-risk-parity extrapolations.

7. **What is exact**

   The weight formulas, leverage rule, turnover accounting, and the implied friction-adjusted return calculations are exact given the chosen implementation. The conclusion that risk parity “does not dominate” is empirical, not theorem-based.

8. **Contribution relative to the literature**

   The paper pushes back on the low-beta/leverage-aversion narrative by showing that the practical version of levered risk parity is highly sensitive to implementation details. Unlevered risk parity has the strongest Sharpe ratio in their sample, but that is a different claim from saying levered risk parity dominates institutional benchmarks.

# 5. Domain of applicability

- The paper applies to multi-asset allocation strategies that use leverage and volatility targeting.
- Its conclusions are strongest for historically backtested U.S. stock/bond data with monthly rebalancing and realistic financing assumptions.
- The formulas generalize, but the performance ranking does not automatically transport to broader universes or futures-based implementations.
- The key limitation is that the study is still backtest-based and therefore sample dependent.
- The genuinely useful contribution is the explicit separation of inverse-volatility weighting, dynamic leverage, borrowing spreads, and turnover.
