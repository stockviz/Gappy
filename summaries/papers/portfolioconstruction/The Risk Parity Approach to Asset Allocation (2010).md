# 1. Metadata

- **Title:** The Risk Parity Approach to Asset Allocation
- **Author(s):** Callan Investments Institute
- **Year:** 2010
- **Journal/Venue:** Institutional research report

# 2. Problem statement

The paper asks whether **risk parity** is an efficient way to construct institutional policy portfolios once leverage is allowed. More precisely: if a portfolio is chosen so that each asset class contributes equally to total portfolio risk, how does that portfolio compare to the mean-variance efficient frontier and to the capital-allocation line available to a levered investor?

# 3. Approach (short)

The method is static multi-asset allocation analysis. The report constructs a risk-parity portfolio using long-run capital-market assumptions, compares it with mean-variance efficient portfolios built from the same inputs, and then studies levered versions via the capital-allocation line. The core analytical point is that a levered risk-parity portfolio can reach a desired expected return, but it need not be the most efficient portfolio at that return because its Sharpe ratio can be below that of the tangency portfolio.

# 4. Approach (detailed)

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
   Risk parity chooses $w^{RP}$ such that
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
   E[R^\lambda] = r_f + \lambda(E[R^{RP}]-r_f-c_{borrow}),
   $$
   so the advantage of levered RP deteriorates rapidly.

8. **Proof status**

   There is no theorem beyond the standard properties of the efficient frontier and capital-allocation lines. The report’s logic is:

   - define RP through equal risk contributions;
   - derive its Sharpe ratio from the assumed $(\mu,\Sigma)$;
   - compare its capital-allocation line to that of the tangency portfolio;
   - study how much leverage is required to hit institutional return targets.

   The result that levered RP is generally below the CAL of the tangency portfolio is exact once the calibrated Sharpe ratios are fixed.

# 5. Domain of applicability

- The analysis applies to **multi-asset policy allocation** with a levered investor.
- It is strongest when the decision problem is at the strategic-asset-allocation level and leverage is genuinely available.
- The report does not prove that RP is optimal; it shows that RP is a particular risk-allocation rule that may be attractive for governance or diversification reasons but is not generally mean-variance efficient.
- Sensitivity to expected returns, correlations, and financing costs is a central limitation.
