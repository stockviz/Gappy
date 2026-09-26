# Credit Risk Modeling: Theory and Applications — Detailed Quantitative Research Notes

## Bibliographic Header
| Field | Detail |
|------|--------|
| Title | Credit Risk Modeling: Theory and Applications |
| Author | David Lando |
| Year | 2004 |
| Publisher | Princeton University Press (Princeton Series in Finance) |
| Domain | Default modeling, rating migrations, intensity models, corporate bonds, credit derivatives |

## Problem / Motivation
Price and manage default-sensitive claims: corporate bonds, loans, CDS, tranches. Need dynamics of default time $\tau$, recovery, and credit spreads consistent with no-arbitrage and empirically realistic rating transitions and default frequencies.

## Part I — Structural Models
### Merton (1974)
Firm asset $V_t$ follows geometric Brownian motion. Debt face $D$ due at $T$. Equity = call on $V$; default if $V_T<D$. Credit spread from risky debt $B=V-E$. Closed forms via BS. Issues: no default before $T$; predicted spreads too low short-term (same Gatheral Ch.6 jump-to-ruin motivation).

### Black–Cox / first-passage
Default at first hit of barrier. Generates more realistic timing. Analytical formulas under constant barrier; time-dependent barriers harder.

### Capital structure and endogenous default
Leland / Leland–Toft: equityholders optimally default; tax shields vs bankruptcy costs. Spreads and equity vol linked to leverage—bridge to CreditGrades (Gatheral Ch.6).

### Empirical challenges
Calibration of $V$ and $\sigma_V$ from equity; sticky leverage; jump risk needed for short spreads.

## Part II — Intensity / Reduced-Form Models
### Hazard rates
Default intensity $\lambda_t$ such that $P(\tau\in(t,t+dt]|\mathcal F_t)=\lambda_t dt$ on $\{\tau>t\}$. Survival $S_t=\exp(-\int_0^t\lambda)$. Pricing defaultable claim with recovery via discounted risk-neutral expectation including compensators.

### Affine intensity models
$\lambda_t=a+b\cdot X_t$ with affine state $X$ (Duffie–Pan–Singleton). Bond prices exponential-affine; CF methods analogous to Heston.

### Rating-based models
Jarrow–Lando–Turnbull: continuous-time Markov chain on ratings; generator matrix $\Lambda$; default absorbing. Calibrate to history + adjust to match market spreads (risk-neutral generator $\tilde\Lambda$).

### Recovery conventions
Recovery of face, recovery of treasury, recovery of market. Affects CDS–bond basis math.

## Part III — Credit Derivatives & Portfolios
### CDS pricing
Premium leg vs protection leg; par spread $s$ solves equality. Intensity approx $s\approx(1-R)\lambda$ for flat hazard, recovery $R$.

### Portfolio credit risk
Vasicek one-factor Gaussian copula (regulatory legacy); intensity correlation / frailty; Monte Carlo of default times. Tranche pricing (synthetic CDOs): attachment/detachment, expected loss allocation, base correlation smiles—post-2004 literature exploded beyond book but foundations here.

### Empirical estimation
Default frequencies by rating; duration methods; migration matrices (cohort vs continuous-time MLE); noisy rare-event estimation—confidence bands wide for AAA defaults.

## Key Equations
- Merton debt/equity split via BS.
- Survival $E[\exp(-\int\lambda)]$.
- CDS par spread integral formulas.
- Generator $\Lambda$ with $\lambda_{ij}$ transition rates.

## Limitations
2004 vintage: pre-crisis tranche lessons incomplete; counterparty risk / CVA light; liquidity not central; sovereigns limited.

## Practical Takeaways for Quants
1. Structural for economic intuition & capital structure arb; reduced-form for pricing CDS curves.
2. Short-term spreads need jumps or dead-zones—pure diffusion Merton fails (cf. Gatheral).
3. Always specify recovery convention.
4. Risk-neutral vs historical $\Lambda$ differ by large premiums.
5. Portfolio models: correlate defaults carefully; Gaussian copula understates joint extremes.
6. Rare-event estimation: use Bayesian shrinkage across ratings.
7. Joint calibrate bonds+CDS+equity options when possible.

### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


### Implementation Detail Block

For practical deployment, fix an estimation window and freeze a data snapshot with a cryptographic hash. Calibrate all model parameters on that snapshot only. Propagate parameter uncertainty by bootstrap or parametric Monte Carlo into downstream portfolio or derivative decisions. Track out-of-sample performance with precommitted metrics: Sharpe with Newey-West SE, max drawdown, Calmar, turnover, and capacity-adjusted returns. Enforce risk limits that override model suggestions when drawdown or stress CVaR breaches policy. Maintain duality/KKT or convergence diagnostics for every optimization solve. Unit-test special cases: zero positions, single-asset, Black-Scholes limits, cash liability matching. Document trial counts to deflate selection bias. Reconcile model positions to broker blotters daily. Install kill switches on feed staleness and loss thresholds. Review models quarterly for decay in predictive IC or deterioration in hedge effectiveness. When comparing model classes (e.g., local vs stochastic volatility, MV vs resampled, structural vs reduced-form credit), report valuation gaps on a standardized exotic or portfolio battery and allocate model-risk capital to the gap.


## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.

## Extended Intensity Model Mathematics

Compensated default process $M_t=1_{\{\tau\leq t\}}-\int_0^{t\wedge\tau}\lambda_s ds$ is martingale. Price of defaultable zero with zero recovery: $P_t=E[\exp(-\int_t^T(r_s+\lambda_s)ds)|\mathcal F_t]$. With recovery $R$ paid at default: add $E[\int_t^T R_u\exp(-\int_t^u(r+\lambda)) \lambda_u du]$. Cox process: conditional on $\lambda$ path, default is inhomogeneous Poisson. Affine: $\lambda_t=a+b\cdot X_t$, $dX=\kappa(\theta-X)dt+\sigma\sqrt{X}dW$ (CIR intensity)—bond $e^{A(T-t)-B(T-t)X_t}$. Multi-name: joint survival with correlated intensities or copulas on uniform default times $U_i=1-e^{-\int\lambda_i}$.

## Rating Migration Practice

Estimate generator via exposure-weighted MLE on rating histories. Handle withdrawals. Embed sovereign ceilings if needed. Risk-neutralize by minimizing distance of model spreads to market CDS/bond curves subject to $\tilde\Lambda$ having positive off-diagonals and absorbing default. Stress: scale off-diagonal ups/downs separately (downgrade-heavy scenarios).

## CDS–Cash Basis and Trading

Basis = CDS spread − bond z-spread (definitions vary). Negative basis: buy bond + buy protection. Risks: funding, counterparty, cheapest-to-deliver, recovery documentation, pull-to-par. Lando supplies pricing legs; trading needs funding desk overlay.

## Portfolio Credit: Vasicek Large Homogeneous Pool

Conditional default probability $p(M)=\Phi((\Phi^{-1}(p)-\sqrt{\rho}M)/\sqrt{1-\rho})$ given systematic factor $M\sim N(0,1)$. Loss distribution analytically tractable as $N\to\infty$. Tranche expected loss integrals. Limitations: thin tails of Gaussian; replace with t-copula / random recovery / stochastic corr for crisis realism.

## Extended Structural Model Mathematics

Merton: $dV=\mu V dt+\sigma_V V dW$, equity $E=V N(d_1)-De^{-rT}N(d_2)$, debt $B=V-E$, yield spread $y-r=-\frac1T\log(B/D)$. Distance-to-default $\mathrm{DD}=( \log(V/D)+(r-\sigma_V^2/2)T)/(\sigma_V\sqrt{T})$. KMV-style empirical DD uses market equity and liabilities to back out $V,\sigma_V$. Black–Cox barrier $H_t$: default time $\tau=\inf\{t:V_t\leq H_t\}$. For constant $H$, reflection principle formulas give survival probabilities. Leland endogenous barrier from equity maximization with tax rate $\tau_c$ and bankruptcy cost $\alpha$. Practical: calibrate $\sigma_V$ from equity vol via $\sigma_E E=\sigma_V V N(d_1)$; iterate until consistency.