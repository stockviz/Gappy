## 1. Metadata

- **Title:** Portfolio Constraints and the Fundamental Law of Active Management
- **Author(s):** Roger Clarke, Harindra de Silva, and Steven Thorley
- **Year:** 2002
- **Journal/Venue:** *Financial Analysts Journal*

## 2. Problem statement

The paper asks how portfolio constraints modify the fundamental law of active management. In particular: if a manager has cross-sectional forecasting skill, but cannot translate that signal fully into portfolio weights because of long-only, neutrality, turnover, and other constraints, how should expected information ratio and realized active return be decomposed into **signal** and **constraint-induced noise**?

## 3. Approach (short)

The paper extends Grinold's fundamental law under a diagonal residual-covariance approximation. It defines a **transfer coefficient** measuring how closely actual active weights reflect risk-adjusted forecasts, derives an ex-ante law $IR \approx TC \cdot IC \sqrt{N}$, and gives an ex-post return decomposition that separates realized signal from realized noise. The approach is optimization plus cross-sectional correlation algebra.

## 4. Approach (detailed)

1. **Work with residual security returns.**

   Let $r_i$ be security $i$'s residual return, i.e. the part orthogonal to the benchmark and other nonforecasted factors. Let $\alpha_i$ be the forecast of $r_i$, $\sigma_i$ its residual volatility, and $\Delta w_i$ the active weight relative to benchmark.

2. **Define the active portfolio return.**

   The active return is
   $$
   R_A = \sum_{i=1}^N \Delta w_i r_i.
   $$
   Under the diagonal-covariance approximation, unconstrained mean-variance optimization implies
   $$
   \Delta w_i^* \propto \frac{\alpha_i}{\sigma_i^2}.
   $$

3. **Define the information coefficient and transfer coefficient.**

   The ex-ante information coefficient is the expected cross-sectional correlation
   $$
   IC = \mathrm{Corr}\!\left(\frac{\alpha_i}{\sigma_i},\frac{r_i}{\sigma_i}\right).
   $$
   The transfer coefficient is
   $$
   TC = \mathrm{Corr}\!\left(\Delta w_i \sigma_i,\frac{\alpha_i}{\sigma_i}\right),
   $$
   i.e. the correlation between risk-weighted positions and risk-adjusted forecasts. Without binding constraints, $TC=1$.

4. **Derive the generalized ex-ante fundamental law.**

   Under the paper's assumptions,
   $$
   IR \approx TC \cdot IC \cdot \sqrt{N},
   $$
   where $IR=E[R_A]/\sigma_A$ and $N$ is breadth. Constraints reduce expected value added exactly through the multiplicative factor $TC$.

5. **Derive the ex-post decomposition.**

   Let $\rho_{IC}$ be the realized information coefficient, $\rho_C$ the realized correlation between "weight not taken" because of constraints and realized returns, and $D$ the realized dispersion of risk-adjusted residual returns. Then
   $$
   R_A \approx \rho_{IC}\,TC\,\sqrt{N}\,\sigma_A D
   + \rho_C\,\sqrt{1-TC^2}\,\sqrt{N}\,\sigma_A D.
   $$
   The first term is the realized signal contribution; the second is constraint-induced noise.

6. **Interpret the variance split.**

   If the dispersion of $\rho_{IC}$ and $\rho_C$ is comparable through time, then only a fraction
   $$
   TC^2
   $$
   of realized active-return variance is attributable to signal success; the remaining
   $$
   1-TC^2
   $$
   is attributable to noise from implementation constraints.

7. **Use Monte Carlo and portfolio examples.**

   The paper illustrates the formulas with S&P 500-based examples. Long-only constraints sharply reduce $TC$, and multiple neutrality constraints lower it further. The point is not only lower expected information ratio, but a noisier realized link between forecast quality and portfolio performance.

### Proof sketch

Given diagonal residual covariance, the unconstrained optimal active weights are proportional to $\alpha_i/\sigma_i^2$. The ex-ante law follows by correlating actual risk-weighted weights with risk-adjusted forecasts and scaling by breadth. The ex-post formula follows by decomposing actual weights into the forecast-aligned part plus an orthogonal "constraint mismatch" component, then projecting realized active return onto those two directions.

## 5. Domain of applicability

The paper applies to benchmark-relative active management when residual returns are the right object and the residual covariance matrix can be approximated as diagonal. The formulas are only approximate under general cross-correlation. That is the paper's main limitation: breadth, IC, and TC are analytically convenient here because cross-security residual interactions are suppressed. The authors' broader practical claims should therefore be read as diagonal-model heuristics, not exact statements for full risk models.
