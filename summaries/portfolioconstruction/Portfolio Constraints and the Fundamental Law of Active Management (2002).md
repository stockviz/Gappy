# Portfolio Constraints and the Fundamental Law of Active Management

**Source:** [TransferCoefficient_ClarkeDesilvaThorley_2002.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/TransferCoefficient_ClarkeDesilvaThorley_2002.pdf>)  
**Source coverage:** Full article, numerical construction examples, Monte Carlo diagnostics, and Appendix A; scanned PDF read with OCR.

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


## 6. Deriving the transfer coefficient carefully

Let $x=w_P-w_B$ be active weights, $\alpha$ residual-return forecasts, and $\Sigma$ the residual covariance matrix. The unconstrained mean–variance problem is

$$\max_x\;\alpha'x-\lambda x'\Sigma x.$$

With no budget or other restrictions, the first-order condition gives $x^*=(2\lambda)^{-1}\Sigma^{-1}\alpha$. Under diagonal $\Sigma$, this reduces to $x_i^*=\alpha_i/(2\lambda\sigma_i^2)$. This is the formula behind the paper's risk-adjusted scatterplots: $x_i\sigma_i$ should be proportional to $\alpha_i/\sigma_i$.

The authors explicitly acknowledge that active weights formally sum to zero but suppress that budget condition in the simple derivation. Enforcing it changes the solution to

$$x^*=\frac{1}{2\lambda}\Sigma^{-1}(\alpha-\eta\mathbf1),\qquad
\eta=\frac{\mathbf1'\Sigma^{-1}\alpha}{\mathbf1'\Sigma^{-1}\mathbf1}.$$

Thus the textbook proportionality is exact only without the budget restriction or after the appropriate risk-metric projection of the alpha vector. A large universe may make the simpler approximation useful, but does not logically remove the constraint.

### 6.1 Risk-weighted alignment and attainable return

Write $h_i=x_i\sigma_i$ and $a_i=\alpha_i/\sigma_i$. Then expected active return is $h'a$, and forecast active risk is $\|h\|$ under the diagonal model. The cosine

$$TC_{\rm geom}=\frac{h'a}{\|h\|\|a\|}$$

gives the exact geometric identity $\alpha'x=TC_{\rm geom}\sigma_A\|a\|$. The paper reports a Pearson correlation across securities as its operational TC, relying on small-mean/centering approximations to connect correlation to this cosine. This distinction matters for highly concentrated, small, or unusually tilted universes.

If forecasts are calibrated so that the norm of the risk-adjusted alpha vector is approximately $IC\sqrt N$, then

$$IR\approx TC\,IC\sqrt N.$$

The information coefficient describes the predictive signal; TC describes how faithfully that signal enters holdings; breadth describes independent opportunities. Security count approximates breadth only under the residual independence and calibration assumptions. Five hundred highly correlated raw returns do not supply five hundred independent bets.

A covariance-aware geometric construction could instead use $h=\Sigma^{1/2}x$ and $a=\Sigma^{-1/2}\alpha$. That preserves the inner-product identity, but does not by itself establish the paper's simple statistical $IC\sqrt N$ calibration. It also does not validate the covariance estimate used for whitening.

## 7. Constraint interactions in the numerical examples

The paper illustrates construction using an S&P 500 universe and a common forecast vector. At 5% forecast tracking error, the long-only restriction produces TC about 0.58. The directly calculated expected active return is 4.2%, or expected IR 0.84, against a theoretical unconstrained IR of 1.50. The ratio is close to the TC approximation. This is a conditional optimization illustration, not an observed long-run net return comparison.

A no-short-sales restriction imposes $x_i\ge-w_{B,i}$. Small benchmark constituents therefore offer very little capacity for negative active positions, even when their forecasts are strongly unfavorable. Positive active weights have no symmetric bound. In the example, this asymmetry creates a small-cap bias. Adding market-cap neutrality reduces TC further, to about 0.47, and concentrates much of the active management in the largest benchmark names. Constraints can interact to create a new concentration problem while eliminating an unwanted factor exposure.

The cost of a restriction depends on the desired risk level. With 2% tracking error, the example's TC is about 0.73 under long-only and 0.67 after adding capitalization neutrality. At 8% tracking error, these decline to about 0.48 and 0.37. Scaling the unconstrained positions upward eventually pushes more negative positions against their benchmark-weight floors. Expected information ratio consequently need not remain constant as an active mandate takes more risk.

Turnover restrictions create a different distortion. Starting from benchmark holdings, unrestricted construction requires 129% turnover in the long–short case and 73% in the long-only case under the source's turnover convention. A 50% turnover ceiling in an otherwise unrestricted construction gives TC about 0.73; a 25% ceiling gives about 0.49. The optimizer reserves trading capacity for stronger forecasts and leaves many weak-signal stocks untouched. These numbers depend critically on the initial holdings. They cannot be interpreted as universal steady-state costs of annual turnover limits.

A combined example with long-only, capitalization neutrality, dividend-yield neutrality, and a turnover restriction produces TC about 0.31. This corresponds to losing roughly 69% of the model's unconstrained *gross expected information ratio*, not 69% of investor welfare. Some restrictions may save transaction costs, limit model error, or enforce economically valuable exposures that are outside the objective used in this calculation.

## 8. Ex post performance and the role of constraint noise

In risk-scaled coordinates, decompose the normalized holdings direction into a forecast-aligned direction and an orthogonal constraint direction. The realized performance correlation is approximately

$$\rho_{h,z}\approx TC\,\rho_{a,z}
+\sqrt{1-TC^2}\,\rho_{c,z},$$

where $z_i=r_i/\sigma_i$. The realized active return then follows from multiplying by $\sigma_A\sqrt N D$, with $D$ the cross-sectional standard deviation of standardized residual returns. The first correlation records signal success; the second records whether construction deviations happened to be rewarded.

This explains why positive realized IC need not imply positive portfolio return. At low TC, a large part of the holdings direction lies outside the intended forecast direction. Conversely, constraints can rescue a portfolio in a month when its ranking system fails. Neither outcome contradicts the ex ante loss of expected signal capture.

The familiar $TC^2$ signal variance share requires more assumptions than this vector decomposition. In the paper's simplified model, the realized correlation terms are independent, each with approximate variance $1/N$, while TC and the risk scale are fixed. Under these conditions the variance of the forecast contribution is proportional to $TC^2$, and that of the orthogonal component to $1-TC^2$. Time-varying IC, common residual shocks, changing holdings, or dependence on dispersion can invalidate that simple share calculation. For TC 0.30, the complementary share is **91%**, since $1-0.30^2=0.91$; the source's nearby prose contains an arithmetic inconsistency.

### 8.1 What the Monte Carlo experiment tests

The authors generate 10,000 annual return realizations with IC 0.067 and security risk parameters from the example. For the long-only portfolio TC is 0.578. The generalized law predicts mean active return about 4.3%; the simulation produces about 4.2% with active volatility about 4.9%. The simulated IR is roughly 0.86, close to the predicted fraction of the unconstrained IR. Explained and actual active returns have correlation exceeding 99%, and regressing realized performance coefficients on realized IC gives $R^2$ about 0.332, close to $0.578^2\approx0.334$.

These results check internal accuracy in a deliberately controlled experiment. They do not test whether the assumed IC can be estimated prospectively, whether the model survives regime changes, or whether short positions are available at the assumed cost. The authors do not claim a general approximation-error bound for other benchmarks.

One simulation realization has IC 0.075, stronger than the assumed average, but realized active return about −0.4% because the constraint coefficient is unfavorable. Another has IC −0.020 but positive realized return around 3.2% because the constraints happen to help. These examples explain the diagnostic value more directly than the average information-ratio formula.

## 9. Implications for mandate design and monitoring

For an existing portfolio, calculate TC with the forecasts and risk estimates available when positions were chosen. Track it across risk targets and rebalance dates. To assess a proposed constraint, rerun construction both with and without it at comparable risk, recording expected return, TC, turnover, concentration, factor exposure, and estimated costs. Because restrictions interact, their marginal effects depend on which other restrictions remain in place.

A low TC can indicate that an otherwise promising signal is poorly matched to a mandate. It can also indicate deliberate protection against forecasting error. A high TC says that holdings express the supplied forecast efficiently; it says nothing about whether that forecast is right. The framework is therefore most useful as a bridge between research, construction, and attribution, accompanied by an independent assessment of forecast quality, covariance error, and net implementation costs.
