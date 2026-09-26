# Performance Attribution and the Fundamental Law

**Source:** [PerformanceAttributionActivePortfolioManagement_ClarkeDesilvaThorley_2005.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PerformanceAttributionActivePortfolioManagement_ClarkeDesilvaThorley_2005.pdf>)  
**Source coverage:** Full article, including regression construction, historical tables, and qualifications on the variance decomposition; scanned PDF read with OCR.

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

   For each date, regress realized security returns on the factor exposures to estimate factor payoffs. Prefer generalized least squares: scale returns and regressors by inverse residual standard deviation, equivalent to objective weights proportional to inverse residual variance.

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


## 6. From attribution identities to a signal diagnostic

The distinction between *relative return* and *active return* is essential. Relative return is the actual portfolio return less the benchmark return. In this paper, active return is the part remaining after removing the market and other factors the manager did not attempt to forecast. A market-beta mismatch can therefore contribute to relative return without demonstrating security-selection skill. The decomposition is designed to keep these claims separate.

Let $x=w_P-w_B$, let $X$ contain the unforecasted factor exposures, and let $r=R-X\hat f$ denote the return residuals. A cross-sectional regression of $r$ on the forecast vector $\alpha$ gives

$$r=\hat v\alpha+\hat\varepsilon.$$

Multiplying by the actual active holdings produces

$$x'R=x'X\hat f+\hat v x'\alpha+x'\hat\varepsilon.$$

These are, respectively, unforecasted-factor, signal, and residual contributions. This equality follows from the regression residual definition and holds for the fitted cross-section. It does not require the fundamental-law approximation to be exact. If an intercept is included, its portfolio contribution must also be accounted for; a common intercept vanishes when active weights sum to zero.

The regression must use the same forecast scores that entered construction, the holdings fixed before the return period, and contemporaneously known factor exposures. Replacing the forecast by a later revised score would convert an attribution system into a hindsight exercise. With heteroskedastic residuals, scaling observations by $1/\sigma_i$ corresponds to least-squares objective weights $1/\sigma_i^2$. These two uses of “weight” should not be confused.

### 6.1 The geometric interpretation

Under a diagonal residual covariance approximation, define risk-scaled holdings $h_i=x_i\sigma_i$, risk-adjusted forecasts $a_i=\alpha_i/\sigma_i$, and standardized realized returns $z_i=r_i/\sigma_i$. Then

$$R_A=h'z,\qquad \sigma_A=\|h\|.$$

After the centering approximations used by the paper, the transfer coefficient measures alignment between $h$ and $a$. Normalize the vectors, and resolve the holdings direction into a component parallel to the forecast and an orthogonal remainder:

$$\hat h=TC\,\hat a+\sqrt{1-TC^2}\,\hat c.$$

The return on $\hat a$ measures whether the signal worked; the return on $\hat c$ measures whether the deviations from its intended positions happened to help. A constraint can therefore improve performance in a particular month even though it reduces expected signal capture. Calling the latter component “noise” is an economic interpretation under a zero-expected-payoff assumption, not proof that every binding restriction lacks investment value.

The realized decomposition contains the cross-sectional return-dispersion factor $D$. A month of unusually dispersed residual returns magnifies both signal and noise contributions. Omitting $D$ confuses unusually large opportunity or noise realizations with changes in the manager's positions or skill.

## 7. What the historical exercise actually establishes

The case study uses 108 monthly periods, April 1995–March 2004, with the S&P 500 as benchmark and investment universe. Forecasts combine momentum, measured using prior-year returns excluding the latest month, and value, represented by book-to-market. The optimizer uses period-specific Barra covariance estimates and an annualized relative-risk ceiling of 5%. Additional restrictions control beta, size, nonlinear size, sectors, individual active weights, and turnover. The individual active-weight bound is 3%, and monthly turnover is limited to 15% after initial construction.

“Neutral” exposures are narrow intervals, rather than exact equalities. Small nonzero marketwide-factor contributions are consequently consistent with the stated portfolio policy. Moreover, the 5% relative-risk ceiling is not the same as the residual active risk entering the law: some forecast risk comes from imperfect factor neutrality.

For February 2004 the long-only portfolio returned 95 basis points against 138 for the benchmark, a 43-basis-point shortfall. The regression attributes +57 basis points to the signal, −109 to the residual component, and +9 to other factors. The signal's realized IC was positive, 0.078. A conclusion that the ranking model failed because the portfolio underperformed would therefore be incorrect within this attribution model. The month's TC was 0.383, so the forecast-aligned direction carried multiplier 0.383 and the orthogonal direction approximately 0.924.

The fundamental-law calculation reproduces the signal contribution:

$$0.078\times0.383\times\sqrt{500}\times1.03\%\times0.833
\approx57\text{ basis points}.$$

The corresponding residual formula is also close to the regression result. Across the sample, discrepancies between the approximate law and regression attribution are around one or two basis points per month. This is evidence of useful numerical accuracy in this setting, not a general error bound for other universes or risk models.

### 7.1 Removing the long-only restriction

The comparison portfolio uses the same forecasts and other restrictions but allows short sales. Average TC rises from 0.475 to 0.740. Average monthly signal contribution rises from 22 to 41 basis points, while average ex ante residual active risk rises from 114 to 128 basis points. Average relative returns are about 17 and 44 basis points respectively. These figures describe the particular historical construction and attribution exercise; they do not include a general implementability guarantee.

The long–short portfolio is much more extended than a conventional 130/30 mandate: average long exposure is about 200% and short exposure about 100%, with substantial time variation. Its financing, borrow, trading, and operational requirements therefore matter when translating the example into a mandate. The exercise isolates information transfer more cleanly than it measures net investable advantage.

For the long-only portfolio, plugging average IC and TC into the law gives monthly IR $0.020(0.475)\sqrt{500}\approx0.21$. The authors compare this with mean *signal contribution* divided by average *forecast active risk*, $22/114\approx0.19$. That is not the usual realized information ratio computed from total realized active returns and their sample standard deviation. The analogous long–short comparison is approximately 0.33 versus $41/128\approx0.32$.

## 8. Why the variance-share prediction is less successful

A common shorthand says that signal accounts for $TC^2$ of performance variance. It requires equal variances of the realized signal and constraint correlations, zero covariance between them, and sufficiently stable scaling quantities. Cross-sectional orthogonality of holdings directions alone does not establish these time-series conditions.

For the long-only portfolio, average TC squared is about 23%, whereas the reported ratio of signal variance to the sum of signal and noise variances is about 44%. For the long–short portfolio the analogous values are about 55% and 75%. These ratios are not automatically a full variance decomposition of total relative return when covariance terms and other factors are present.

The source identifies substantial instability in the realized IC. With 500 independent observations and a fixed population relationship, the rough sampling standard deviation is $1/\sqrt{500}\approx0.045$. Observed IC standard deviation is 0.079, compared with 0.057 for the constraint coefficient. The forecasting relationship varies over time more than the simple stationary approximation allows. TC, active risk, and dispersion also vary. Taking products of their separate time averages cannot, in general, reproduce the average of the period-by-period product.

Forecast risk itself is imperfect: realized monthly relative volatility is about 187 basis points for the long-only example despite an optimizer ceiling of 144 basis points. Thus even an excellent accounting match between the regression and fundamental-law formulas does not validate the risk forecast.

## 9. How to use the paper

A practical implementation should save forecasts, risk estimates, holdings, benchmark weights, factor exposures, and constraints at each rebalance. For every subsequent return period, calculate the exact regression attribution first and then the fundamental-law diagnostic. Differences between them are a diagnostic of centering, covariance, and estimation approximations. Report total relative return separately from residual active return, and show trading and financing costs separately where available.

The useful decision is not simply whether to maximize TC. A turnover limit can reduce gross information transfer while improving net results; a factor restriction can remove a risk the alpha model never intended to forecast. TC explains the fidelity of implementation conditional on a forecast and risk model. It neither measures forecast validity nor resolves the economic trade-off between gross alpha, costs, capacity, and mandate objectives.
