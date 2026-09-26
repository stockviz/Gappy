## 1. Metadata

- **Title:** Performance Attribution and the Fundamental Law
- **Author(s):** Roger Clarke, Harindra de Silva, and Steven Thorley
- **Year:** 2005
- **Journal/Venue:** *Financial Analysts Journal*

## 2. Problem statement

The paper asks how to connect a manager's security-ranking signal to realized benchmark-relative performance in a way that is operational for attribution. The specific problem is to decompose active return into:

1. marketwide factor effects,
2. signal success,
3. and noise induced by portfolio constraints,

using a framework consistent with the fundamental law of active management.

## 3. Approach (short)

The method combines a regression-based performance-attribution system with the Clarke-de Silva-Thorley extension of the fundamental law. First, regress realized security returns on nonforecasted factors to strip out marketwide effects. Then regress residual returns on the manager's forecasts. Finally, use the ex-ante and ex-post fundamental-law identities to split realized active return into signal and noise terms. This is factor attribution plus cross-sectional law-of-active-management algebra.

## 4. Approach (detailed)

1. **Set up the security-return model.**

   For each security $i$,
   $$
   R_i = R_M \beta_i + \sum_{k=1}^K F_k \delta_{ki} + r_i,
   $$
   where $R_M$ is the market factor, $F_k$ are other nonforecasted marketwide factor payoffs, and $r_i$ is the active residual the manager is trying to forecast.

2. **Write portfolio relative return.**

   With active weights $\Delta w_i = w_{Pi}-w_{Bi}$,
   $$
   AR = \sum_i \Delta w_i R_i.
   $$
   Substituting the factor model yields
   $$
   AR = R_M(\beta_P-\beta_B)+\sum_{k=1}^K F_k \sum_i \Delta w_i \delta_{ki} + R_A,
   $$
   where
   $$
   R_A = \sum_i \Delta w_i r_i
   $$
   is active return net of nonforecasted factors.

3. **Estimate factor contributions.**

   For each date, regress realized security returns on the factor exposures to estimate factor payoffs. Prefer generalized least squares, with weights proportional to inverse residual risk, to reflect heteroskedasticity.

4. **Estimate signal payoff.**

   Regress the active residuals $r_i$ on the manager's forecast scores $\alpha_i$:
   $$
   r_i = v \alpha_i + \varepsilon_i.
   $$
   This maps the ranking system into realized payoff for that period.

5. **Connect attribution to the fundamental law.**

   Use the ex-ante law
   $$
   E[IR_A] \approx IC \cdot TC \cdot \sqrt{N}
   $$
   and the ex-post law
   $$
   R_A \approx \rho_{IC}\,TC\,\sqrt{N}\,\sigma_A D
   + \rho_C\,\sqrt{1-TC^2}\,\sqrt{N}\,\sigma_A D,
   $$
   where $IC$ is expected information coefficient, $TC$ transfer coefficient, $\rho_{IC}$ realized information coefficient, $\rho_C$ realized constraint-noise coefficient, and $D$ realized residual-dispersion.

6. **Interpret realized performance.**

   The contribution attributable to the ranking signal is
   $$
   \rho_{IC} \, TC \, \sqrt{N}\,\sigma_A D,
   $$
   while the contribution attributable to implementation noise is
   $$
   \rho_C \, \sqrt{1-TC^2}\,\sqrt{N}\,\sigma_A D.
   $$
   Thus even when the signal works, realized portfolio performance can be poor if $TC$ is low.

7. **Empirical illustration.**

   Using long-only and long-short S&P 500 portfolios, the paper shows that long-short implementation raises $TC$, so more realized variance is attributed to signal and less to constraint noise. The method is intended as a practical attribution language for portfolio managers and clients.

### Proof sketch

The decomposition is algebraic. Factor attribution comes from substituting the security-level factor model into the active-return identity. The signal/noise split then follows from the ex-post fundamental law, which writes realized active return as a component aligned with the forecasted cross-section and an orthogonal component produced by constraints.

## 5. Domain of applicability

The method applies when:

- benchmark-relative active weights are observable,
- forecast scores exist,
- nonforecasted factor exposures can be measured,
- and residual-return attribution is meaningful.

The paper inherits the limitations of the underlying fundamental-law approximation, especially the diagonal residual-covariance assumption from the 2002 framework. It is strongest as a performance-attribution discipline, not as a full structural theory of portfolio choice under correlated residual risk.
