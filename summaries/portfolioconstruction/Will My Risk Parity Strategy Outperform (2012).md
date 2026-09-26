# Will My Risk Parity Strategy Outperform

**Source:** [PortfolioLeverage_AndersonBianchiGoldberg_2012.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioLeverage_AndersonBianchiGoldberg_2012.pdf>)  
**Source coverage:** strategy definitions, main comparisons, Table 1, statistical discussion, and Appendices A-E.

## 1. Metadata

- **Title:** Will My Risk Parity Strategy Outperform?
- **Author(s):** Robert M. Anderson, Stephen W. Bianchi, Lisa R. Goldberg
- **Year:** 2012
- **Journal/Venue:** *Financial Analysts Journal* (forthcoming status in file)

## 2. Problem statement

The paper asks whether risk-parity strategies, especially levered risk parity, actually outperform standard benchmarks once one accounts for sample-period choice, financing costs, and turnover. The precise comparison is between four strategies built from U.S. equities and U.S. Treasuries:
$$
\text{value weighted},\quad 60/40,\quad \text{unlevered risk parity},\quad \text{levered risk parity}.
$$

## 3. Approach (short)

The method is historical backtesting with economically disciplined implementation details. The authors specify exact monthly rebalancing formulas for unlevered and levered risk parity, compute realized returns over long samples and subperiods, and examine how borrowing spreads and turnover-induced trading costs alter ranking. The novelty is not a new optimizer but a careful decomposition of why the usual frictionless levered-risk-parity story can fail in practice.

## 4. Approach (detailed)

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
   For these two long-only asset classes it equalizes Euler risk contributions even with nonzero correlation; that special identity does not hold for arbitrary multi-asset covariance matrices.

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

   The weights and leverage rule are explicitly specified. The historical friction and turnover calculations follow the source's accounting assumptions; reproducing them is distinct from building a complete self-financing cash-and-borrowing ledger. The conclusion that risk parity “does not dominate” is empirical, not theorem-based.

8. **Contribution relative to the literature**

   The paper pushes back on the low-beta/leverage-aversion narrative by showing that the practical version of levered risk parity is highly sensitive to implementation details. Unlevered risk parity has the strongest Sharpe ratio in their sample, but that is a different claim from saying levered risk parity dominates institutional benchmarks.

## 5. Domain of applicability

- The paper applies to multi-asset allocation strategies that use leverage and volatility targeting.
- Its conclusions are strongest for historically backtested U.S. stock/bond data with monthly rebalancing and realistic financing assumptions.
- The formulas generalize, but the performance ranking does not automatically transport to broader universes or futures-based implementations.
- The key limitation is that the study is still backtest-based and therefore sample dependent.
- The genuinely useful contribution is the explicit separation of inverse-volatility weighting, dynamic leverage, borrowing spreads, and turnover.


## 6. Data and a strategy definition that can be implemented sequentially

The local paper compares four policies using CRSP monthly US equity and Treasury data over 1926-2010. The stock series includes dividends; the Treasury aggregate weights available individual bond returns by face value outstanding. The value-weighted benchmark combines the stock-market capitalization and Treasury face-value aggregates. It is therefore a specified stock/bond market proxy, not a generic 60/40 benchmark or the entire world wealth portfolio.

The risk-parity weights use only trailing 36-month volatilities, with monthly rebalancing. In a two-asset long-only portfolio, inverse volatility gives equal Euler risk contributions even when the assets are correlated: subtracting the two contributions cancels the covariance terms, leaving $w_1^2\sigma_1^2-w_2^2\sigma_2^2$. This special result does not extend to arbitrary multi-asset correlation matrices.

The investable leverage rule compares trailing realized volatility of the *historical unlevered strategy returns* with that of the value-weighted benchmark. It is not necessarily the same as computing today's fixed holdings against a current covariance matrix. With $\ell_t$ the exposure multiplier,
$$
r_{L,t}=\ell_t r_{U,t}-(\ell_t-1)r_{b,t}.
$$
Matching historical volatilities at each date does not force future realized volatility to match. Indeed, over the long sample the reported volatility is 16.25% for levered parity and 15.04% for the value-weighted portfolio in the base case.

The source distinguishes this conditional rule from a full-sample-scaled inverse-volatility strategy. A constant coefficient $k$ multiplying each asset's inverse volatility can be chosen to match a benchmark's realized volatility over the entire backtest, but selecting $k$ that way uses future information. Moreover, a constant $k$ on inverse volatilities is **not** constant total leverage: total exposure still varies as the asset volatilities change. The paper's criticism concerns this calibration and implementation distinction, not the algebraic validity of a normalized historical comparison.

## 7. The frictions are explicit assumptions, not directly observed historical trades

There are three principal scenarios:

| Scenario | Financing | Turnover charge |
|---|---|---|
| Base | 90-day Treasury-bill rate | zero |
| Funding adjustment | three-month Eurodollar deposit rate from 1971; T-bills plus 60 bp before 1971 | zero |
| Funding plus trading | same as preceding row | 1% per traded unit in 1926-1955; 0.5% in 1956-1970; 0.1% in 1971-2010 |

The pre-1971 spread is extrapolated. Modern liquid Treasury futures did not exist throughout the historical period, so the study cannot observe the actual cost of implementing a futures-financed parity policy in 1926. The authors use available rates and sensitivity analysis rather than presenting the financing path as historical fact.

The average conditional leverage multiplier is about 3.55. One spike in 1965 reflects very low measured bond volatility together with high equity weight and volatility in the benchmark. This matters twice: borrowing spread is charged to a large debt base, and changing leverage creates turnover in addition to the trades required to restore relative stock/bond weights.

Appendix C measures drifted *unlevered* weights and explicitly computes levered turnover as
$$
x_t=\sum_i\left|\widetilde w_{U,i,t}\ell_{t-1}-w_{U,i,t}\ell_t\right|,
\qquad c_t=z_tx_t.
$$
This is the stated convention to reproduce the paper. The generic fully invested weight-drift formula should not be applied blindly to risky weights whose sum exceeds one: a complete self-financing account also contains borrowing, and normalization by equity differs from normalization by gross risky assets. A production implementation should reconcile the debt/cash leg and P&L explicitly before treating this approximate historical turnover model as exact accounting.

## 8. Quantitative results and the choice of performance measure

Table 1 reports annualized arithmetic excess returns and volatility, with the following central entries:

| Strategy / scenario | Excess return | Volatility | Sharpe |
|---|---:|---:|---:|
| Value weighted, base | 4.03% | 15.04% | 0.27 |
| 60/40, base | 4.77% | 11.67% | 0.41 |
| Unlevered parity, base | 2.21% | 4.24% | 0.52 |
| Levered parity, base | 6.87% | 16.25% | 0.42 |
| Levered parity, funding adjustment | 5.06% | 16.29% | 0.31 |
| Levered parity, funding plus trading | 4.15% | 16.29% | 0.25 |
| 60/40, funding plus trading | 4.66% | 11.67% | 0.40 |

The frictionless levered strategy earns 2.10 percentage points more arithmetic excess return than 60/40, with reported one-sided bootstrap probability 0.03. Its benchmark-adjusted alpha advantage is 1.81 points with probability 0.06. Financing reduces the arithmetic-return advantage to 0.29 points, and adding turnover reverses it to -0.51 points. Those latter differences are not statistically persuasive in this sample.

Cumulative wealth gives a different ranking in some scenarios because it compounds returns. With funding adjustments but no trading charge, levered parity can have the higher arithmetic mean while 60/40 finishes with more compounded wealth. The paper explicitly explains this apparent discrepancy. Higher arithmetic average plus higher volatility does not guarantee higher geometric growth.

Results vary across 1926-1945, 1946-1982, 1983-2000, and 2001-2010. The 37-year postwar interval is especially unfavorable for the parity variants relative to the conventional portfolios; the early turbulent period and final decade are more favorable. A long full-sample average does not eliminate multi-decade regime dependence.

### Sharpe invariance has a narrow scope

With **constant** leverage $L>1$, deterministic rates, and no turnover cost,
$$
SR_L=SR_U-\frac{L-1}{L}\frac{r_b-r_f}{\sigma_U}.
$$
At equal borrowing and lending rates this preserves Sharpe. But the paper's leverage is dynamic. The product $L_tr_{U,t}$ has covariance effects and a different distribution, so even the frictionless strategy need not share the unlevered policy's Sharpe ratio. This is why its base-case Sharpe is 0.42 rather than 0.52. Financing spread is an additional degradation, not the only reason the ratios differ.

## 9. Uncertainty, robustness checks, and interpretation

The bootstrap uses 10,000 resamples of monthly observations. The reported probability for a mean is the fraction of resampled means at or below zero. Alpha uncertainty is computed by resampling fitted regression residuals, regenerating strategy returns, and estimating the regression again. These are directional bootstrap tail probabilities under the stated resampling scheme; they should not be silently recast as two-sided tests from a different null distribution.

To illustrate practical uncertainty, the authors retain the favorable frictionless return differential and resample paired strategy returns. The estimated probability that 60/40 nevertheless beats levered parity is 26.8% over 20 years and 17.5% over 50 years. Those percentages are conditional bootstrap illustrations, not forward-looking probability forecasts. Resampling individual months treats the historical distribution as reusable and does not preserve long regime sequences or all serial dependence.

The authors examine annual rather than monthly rebalancing and pre-1971 financing spreads from 25 to 125 basis points. The broad message survives, but changing a small historical funding assumption materially changes the premium. Negative skew and high kurtosis in the levered portfolio also suggest possible forced-deleveraging costs; those costs are discussed but not fully modeled.

A sound replication should preserve the distinctions among allocation weights, volatility scaling, funding, and trading. It should report arithmetic returns, compound growth, tail behavior, and uncertainty together. It should also fix leverage ceilings, collateral and margin policies, and stress-period financing terms before testing. The paper demonstrates that a favorable frictionless backtest is insufficient to establish implementable dominance. It does not prove that risk parity must underperform, and its two-asset US historical results do not automatically transfer to a diversified futures implementation.
