# Execution Costs

**Authors:** Robert Almgren **Year:** 2008 **Journal/Venue:** Encyclopedia of Quantitative Finance (Wiley)

## Problem statement

Characterize, measure, and model the indirect costs of trading equity portfolios -- specifically market impact and price volatility effects -- relative to the *arrival price* benchmark (the quoted mid-price at order release). The cost so measured is the *implementation shortfall* (Perold 1988). The paper asks three linked questions in reverse chronological order of a trade's life cycle: (1) how to report realized costs post-trade, (2) how to schedule execution optimally given a cost model, and (3) how to build a pre-trade cost model from historical data.

## Approach (short)

Decomposes implementation shortfall into a *permanent* component (information content / net supply-demand shift) and a *temporary* component (liquidity premium paid during execution). Proposes a specific parametric regression model for each component, calibrated on observed prices at three timestamps ($S_{\text{pre}}, S_{\text{exec}}, S_{\text{post}}$). Embeds the cost model in a mean-variance optimal execution framework (Almgren-Chriss 2000) to determine trade schedules, and outlines post-trade reporting methodology.

## Approach (detailed)

1. **Benchmark and cost definition.** Execution cost of a completed buy order is
   $$C = S_{\text{exec}} - S_{\text{pre}},$$
   where $S_{\text{pre}}$ is the bid-ask midpoint just before the first execution and $S_{\text{exec}}$ is the realized average execution price. Sign convention: positive cost = loss of value. For portfolio transactions, costs are aggregated as a suitably weighted average of individual trade costs.

2. **Post-trade reporting.** Realized cost is reported relative to multiple benchmarks (arrival price, VWAP, closing price) and aggregated across trades. Key practical points:
   - Weight individual costs by dollar value (if costs in basis points) or by share count (if in cents/share) so the aggregate is representative.
   - Report standard deviation of costs weighted by trade size as a significance check on the mean.
   - Aggregation should be indifferent to arbitrary subdivision of blocks; arrival-price benchmarks can violate this (VWAP and fixed-time benchmarks do not).
   - Valuation of unexecuted shares is inherently ambiguous; no clean rule exists.

3. **Optimal trading / scheduling.** Given a cost model, the execution problem is a mean-variance trade-off:
   - *Trading fast*: reduces exposure to adverse drift and volatility (opportunity cost, price risk) but increases instantaneous market impact.
   - *Trading slow*: lowers market impact but raises timing risk and opportunity cost from short-term alpha decay.
   - Optimal trajectories (Almgren and Chriss 2000) are front-loaded: trade aggressively early, then decelerate (Figure 1 in the paper). The exact analytic form depends on urgency; the key summary statistic is the *effective duration* $T_{\text{eff}}$, the time at which a linear approximation to the trajectory would finish.
   - For portfolios, inter-asset correlations and factor-neutrality constraints enter the schedule.

4. **Pre-trade cost model -- permanent impact.** Define permanent impact $I$ and temporary impact $J$ via three observed prices (for a buy):
   $$I = \log \frac{S_{\text{post}}}{S_{\text{pre}}} \approx \frac{S_{\text{post}} - S_{\text{pre}}}{S_{\text{pre}}}, \qquad J = \log \frac{S_{\text{exec}}}{S_{\text{pre}}} \approx \frac{S_{\text{exec}} - S_{\text{pre}}}{S_{\text{pre}}}.$$
   (Signs reversed for sells; log approximations valid when price moves are a few percent.)

   Permanent impact is modeled as linear in normalized trade size:
   $$I = \gamma\,\sigma\,\frac{X}{V} + \langle\text{noise}\rangle,$$
   where $X$ = shares traded, $V$ = daily volume, $\sigma$ = daily volatility, $\gamma$ = universal dimensionless constant. Normalizing by $\sigma$ expresses impact as a fraction of typical daily price movement; normalizing by $V$ expresses order size as a fraction of daily flow. Linearity in $X/V$ is empirically approximate and theoretically convenient but not definitively established.

5. **Pre-trade cost model -- temporary impact.** Temporary impact is the additional premium over a pro-rated share of permanent impact:
   $$J = \frac{I}{2} + \eta\,\sigma\left(\frac{X}{VT}\right)^{\beta} + \langle\text{noise}\rangle,$$
   where $T$ = effective duration of the trade (fraction of trading day), $X/(VT)$ = *participation rate* (fraction of market flow consumed by the order), $\eta$ = dimensionless coefficient, $\beta$ = concavity exponent. The factor $I/2$ reflects that, on average, half the permanent impact is paid by the trade itself (the other half is post-trade).

6. **Calibration procedure (Almgren et al. 2005).** Two-step regression on a large sample of US equity trades:
   - **Step 1:** Regress $I$ on $\sigma\, X/V$ to test linearity and estimate $\gamma$.
   - **Step 2:** Regress $J - I/2$ on $\sigma\,(X/(VT))^{\beta}$ to estimate $\beta$ and $\eta$.
   - Residual analysis verifies that volatility adequately explains error-term magnitude.
   - Empirical result: $\beta \approx 0.6$, consistent with earlier square-root models (Barra 1997). Predicted costs for trades of a few percent of daily volume executed over several hours are on the order of tens of basis points.

7. **Model limitations acknowledged explicitly:**
   - $R^2$ of the regression is very low (a few percent) because single-trade noise from market volatility dominates. The model predicts *expected* cost, not individual-trade cost.
   - Disentangling alpha from impact is inherently difficult (endogeneity: the trade may be triggered by anticipated price movement).
   - Behavior differs between small and large trades; a model calibrated on small trades performs poorly out of sample on large trades.

## Domain of applicability

- **Asset class:** Equity markets (single stocks). The framework is conceptually portable to other asset classes but calibration data and microstructure details differ substantially.
- **Order size regime:** Moderate orders -- a few percent of daily volume or less. The linear permanent impact and power-law temporary impact are empirical fits in this regime; extrapolation to very large or very small orders is unreliable.
- **Time horizon:** Intraday to multi-day executions. The effective-duration parameterization assumes the trade is a material fraction of a day's activity.
- **Use cases:** Pre-trade cost estimation, optimal execution scheduling (via embedding in mean-variance framework), post-trade cost attribution, and integration of transaction costs into portfolio construction (turnover penalization, alpha-cost trade-off).
- **Key caveat:** The model should be recalibrated periodically to the user's own trading data and market conditions. Low $R^2$ means it is a tool for expected-cost budgeting, not for evaluating any single trade's outcome.
