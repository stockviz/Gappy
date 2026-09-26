# The Risk Parity Approach to Asset Allocation

**Source:** [RiskParityPortfolios_Callan_2009.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/RiskParityPortfolios_Callan_2009.pdf>)  
**Source coverage:** all substantive pages of the February 2010 report, including portfolio tables, historical assumptions, and practical considerations.

## 1. Metadata

- **Title:** The Risk Parity Approach to Asset Allocation
- **Author(s):** Callan Investments Institute
- **Year:** 2010
- **Journal/Venue:** Institutional research report

## 2. Problem statement

The paper asks whether **risk parity** is an efficient way to construct institutional policy portfolios once leverage is allowed. More precisely: if a portfolio is chosen so that each asset class contributes equally to total portfolio risk, how does that portfolio compare to the mean-variance efficient frontier and to the capital-allocation line available to a levered investor?

## 3. Approach (short)

The method is static multi-asset allocation analysis. The report constructs a risk-parity portfolio using long-run capital-market assumptions, compares it with mean-variance efficient portfolios built from the same inputs, and then studies levered versions via the capital-allocation line. The core analytical point is that a levered risk-parity portfolio can reach a desired expected return, but it need not be the most efficient portfolio at that return because its Sharpe ratio can be below that of the tangency portfolio.

## 4. Approach (detailed)

1. **Risk contributions**

   Let portfolio volatility be
   $$
   \sigma(w)=\sqrt{w^\top \Sigma w}.
   $$
   The marginal risk contribution of asset $i$ is
   $$
   MRC_i(w)=\frac{(\Sigma w)_i}{\sigma(w)},
   $$
   and the total risk contribution is
   $$
   RC_i(w)=w_i\,MRC_i(w)=\frac{w_i(\Sigma w)_i}{\sigma(w)}.
   $$
   The standard Euler equal-risk-contribution formulation chooses $w^{RP}$ such that
   $$
   RC_i(w^{RP}) = RC_j(w^{RP})
   \qquad \forall i,j.
   $$

2. **Unlevered risk parity**

   Because low-volatility assets receive higher capital weights, the unlevered RP portfolio typically holds a large fixed-income allocation and therefore has lower expected return than a typical institutional return target. The report’s long-run assumptions produce exactly this result.

3. **Leverage and the risk-parity line**

   If leverage $\lambda$ is applied to the unlevered RP portfolio relative to cash, expected return and volatility become
   $$
   E[R^\lambda] = r_f + \lambda(E[R^{RP}]-r_f),
   \qquad
   \sigma^\lambda = \lambda \sigma(R^{RP}).
   $$
   This traces a straight line through cash and $w^{RP}$, analogous to a capital-allocation line. The report calls this the risk-parity line.

4. **Comparison with mean-variance efficiency**

   The efficient frontier is generated from the same $(\mu,\Sigma)$ inputs by solving
   $$
   \min_w \; w^\top \Sigma w
   \qquad \text{s.t.} \qquad
   \mathbf 1^\top w=1,\quad \mu^\top w = \bar \mu.
   $$
   The tangency portfolio $w^T$ maximizes the Sharpe ratio
   $$
   \max_w \frac{\mu^\top w-r_f}{\sqrt{w^\top \Sigma w}}.
   $$
   Its capital-allocation line is steeper than the RP line whenever
   $$
   SR(w^T) > SR(w^{RP}).
   $$
   The report’s central analytical claim is that this inequality generally holds in the calibration used.

5. **Why RP is still interesting**

   RP changes the composition of risk even when it does not maximize Sharpe ratio. Relative to typical equity-dominated institutional portfolios, it shifts risk toward fixed income and other diversifying asset classes. The report therefore treats RP less as the unique optimizer and more as a rule that changes the distribution of risk contributions.

6. **Leverage requirement**

   To reach a target expected return $\bar \mu$, leverage must satisfy
   $$
   \lambda = \frac{\bar \mu-r_f}{E[R^{RP}]-r_f}.
   $$
   The report finds that realistic target returns imply substantial leverage, on the order of roughly $40\%$ to $60\%$ in the calibration. This makes financing cost a first-order issue.

7. **Financing and practical frictions**

   The theoretical comparison assumes borrowing at a known cost. Once borrowing cost rises, the RP line rotates downward:
   $$
   E[R^\lambda] = r_f + \lambda(E[R^{RP}]-r_f)-(\lambda-1)c_{borrow},
   $$
   so the advantage of levered RP deteriorates rapidly.

8. **Proof status**

   There is no theorem beyond the standard properties of the efficient frontier and capital-allocation lines. The report’s logic is:

   - define the report's risk-parity allocation through its stated cash-replacement risk-contribution convention;
   - derive its Sharpe ratio from the assumed $(\mu,\Sigma)$;
   - compare its capital-allocation line to that of the tangency portfolio;
   - study how much leverage is required to hit institutional return targets.

   The result that levered RP is generally below the CAL of the tangency portfolio is exact once the calibrated Sharpe ratios are fixed.

## 5. Domain of applicability

- The analysis applies to **multi-asset policy allocation** with a levered investor.
- It is strongest when the decision problem is at the strategic-asset-allocation level and leverage is genuinely available.
- The report does not prove that RP is optimal; it shows that RP is a particular risk-allocation rule that may be attractive for governance or diversification reasons but is not generally mean-variance efficient.
- Sensitivity to expected returns, correlations, and financing costs is a central limitation.


## 6. Source definition and the numerical forward-looking comparison

The PDF filename ends in 2009, but the report itself is dated **February 2010**. Its authorship is corporate, Callan Associates. It compares allocation rules under a common set of assumptions, then separately examines a historical scenario with perfect foresight. Those are two distinct exercises.

The familiar Euler contribution formula in the overview is useful background, but Callan's footnote states a more specific operational rule: find the portfolio for which replacing any asset-class allocation with cash produces the same reduction in total portfolio risk. A finite removal is not generally identical to an infinitesimal Euler contribution. If cash has zero covariance, removing holding $w_i$ changes variance by
$$
\sigma^2(w)-\sigma^2(w-w_ie_i)=2w_i(\Sigma w)_i-w_i^2\Sigma_{ii}.
$$
Equalizing this finite change need not equalize $w_i(\Sigma w)_i$. A faithful replication should implement or clarify the report's stated removal-based convention, rather than silently substitute a modern ERC solver. The source recognizes that risk parity was not a uniquely standardized methodology.

The forward-looking analysis uses US equities, non-US equities, real estate, commodities, and fixed income. Its risk-parity capital weights are approximately 10%, 9%, 11%, 12%, and 58%, respectively. The resulting expected return is 6.68% and volatility 6.50%. The larger commodity weight than equity weight reflects diversification as well as standalone volatility; an inverse-volatility rule alone cannot reproduce the entire argument.

At an 8.25% return target, the unlevered mean-variance frontier portfolio instead holds roughly 37% US equity, 15% non-US equity, 8% real estate, 3% commodities, and 37% fixed income, with volatility 9.72%. The equity categories account for about 70% of its risk. This is the specific equity-concentration problem that motivates the report; it is not a theorem that all optimized portfolios are equity-dominated.

With a common borrowing/lending rate of 3%, the maximum-Sharpe risky mix has return 6.50%, volatility 5.70%, and Sharpe about 0.61. It is more bond-heavy than the parity portfolio, at about 72% fixed income. Scaling it to 150% invested exposure, with debt equal to 50% of equity, gives the 8.25% target at volatility around 8.54%. The parity portfolio has Sharpe about 0.57 and requires approximately 143% risky exposure to reach the target, with volatility about 9.27%; the exhibit rounds the borrowing fraction to roughly 40%.

There are two separate conclusions. Allowing leverage enlarges the opportunity set and can improve on an unlevered frontier portfolio. Within that enlarged set, risk parity is not the same as the maximum-Sharpe portfolio. Moreover, the lower borrowing requirement of parity can matter if funding costs increase with debt, so the frictionless Sharpe ordering need not settle a constrained real-world choice.

## 7. Leverage arithmetic and funding sensitivity

Let $L$ denote risky assets divided by investor equity, so the borrowed amount is $L-1$ when $L>1$. If the underlying risky mix has expected return $\mu_P$, volatility $\sigma_P$, and the borrowing rate is $r_b$, then
$$
\mu_L=L\mu_P-(L-1)r_b,\qquad \sigma_L=L\sigma_P,
$$
assuming deterministic financing and no extra costs. To reach target $\mu_*$,
$$
L=\frac{\mu_*-r_b}{\mu_P-r_b}.
$$
The formula requires a positive spread $\mu_P-r_b$ for increasing leverage to raise expected return. A small denominator makes the required exposure very sensitive to assumptions. If $r_b=r_f+s$, the spread charge is $(L-1)s$, not $Ls$. This distinction corrects the earlier shorthand that charged the borrowing premium to the investor's own capital as well.

The leverage label “40%-60%” in the report means debt of roughly 0.4-0.6 times equity, or gross risky exposure around 1.4-1.6 times equity. It does not mean investing only 40%-60% of wealth in risky assets. Loan duration, collateral terms, derivative margin, and the ability to maintain funding through stress affect whether the static line is attainable.

The weights of a parity allocation may be obtained without expected returns, but choosing leverage to meet an expected-return target still requires expected returns and a funding forecast. Risk parity therefore does not eliminate mean uncertainty from the whole policy decision; it moves part of it into the leverage choice.

## 8. Historical exercise: hindsight, rebalancing, and peer risk

The historical analysis covers the 20 years ending September 30, 2009. It derives the input return, volatility, and correlation estimates from that full period, effectively granting the allocator perfect foresight at inception. The report explicitly uses this device to compare frameworks holding input estimation error aside. These results must not be described as an out-of-sample backtest.

The proxies include Russell 3000, MSCI EAFE, NCREIF real estate, the Goldman Sachs commodity index, and the Barclays Capital Aggregate bond index. Financing is one-month LIBOR plus 50 basis points, and portfolios rebalance quarterly without transaction costs. Treating the real-estate allocation as frictionlessly rebalanced is acknowledged as unrealistic; appraisal-based low volatility and low measured correlations also overstate the ease of obtaining diversification.

The period strongly favors fixed income relative to non-US equities, and its correlations differ from the forward-looking assumptions. In the hindsight allocation, the two mean-variance portfolios exclude non-US equity. The parity portfolio retains it because its rule does not condition capital weights on the realized mean-return ranking. To attain the same 8.25% historical compound return, the report uses about 50% debt for the optimized levered policy and 55% for parity.

The reported historical Sharpe ratios are approximately 0.73 for the levered optimal policy, 0.63 for parity, and 0.35 for the unlevered efficient policy, versus 0.30 for the median fund sponsor. Yet the path matters. Over the ten years ending September 1999, the unlevered efficient policy returns 12.41% annually, compared with 8.80% for levered parity. Over the following decade, those figures reverse to 4.25% and 7.72%. The same twenty-year endpoint therefore hides a prolonged period in which the strategy with lower eventual volatility would have looked unattractive against peers.

Callan treats this as a governance problem. A policy has to survive changes in trustees, staff, advisers, and market narratives. A financing-heavy, low-equity-risk allocation that trails a conventional peer group for many years may be abandoned before its diversification benefit appears. This is not captured by the static variance objective, but it directly affects realized policy performance.

## 9. What a practitioner can take from the report

Separate the risk-allocation rule from the decision to permit leverage. Compare alternative risky mixes under identical forecasts, constraints, and financing curves. Evaluate rate shocks and equity rallies as well as equity crashes; a large levered bond allocation replaces some equity risk with duration and funding risk. Specify both an asset portfolio and a financing portfolio, including counterparty concentration, refinancing dates, liquidity, collateral, and crisis actions.

Do not infer that the historical parity result proves superiority under future return expectations. The historical exercise is especially dependent on a strong bond period, low measured real-estate risk, quarterly costless rebalancing, and full-sample calibration. Conversely, the fact that a parity portfolio lies below a modeled frontier does not establish that an estimated tangency portfolio will win out of sample: the comparison assumes its input means and covariances are known. The report's strongest point is the need to evaluate diversification, leverage, funding, and institutional persistence as a joint policy.
