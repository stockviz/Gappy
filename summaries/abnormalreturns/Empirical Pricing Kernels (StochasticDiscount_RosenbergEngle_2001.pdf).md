# Empirical Pricing Kernels

**Authors:** Joshua V. Rosenberg (Federal Reserve Bank of New York); Robert F. Engle (Stern School of Business, New York University)  
**Date:** August 2001 (Journal of Financial Economics vintage)  
**JEL:** G12, G13, C50  
**Keywords:** Pricing kernels; Risk aversion; Derivatives; Hedging  
**Sample:** Monthly S&P 500 index options, 1991–1995; asymmetric GARCH on longer S&P history  
**Source PDF:** `StochasticDiscount_RosenbergEngle_2001.pdf`  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_1)  
**OCR:** Not required; clean extract (~10,655 words of source)

---

## 1. Problem and Motivation

The asset pricing kernel (stochastic discount factor) $M_t$ prices any payoff via

$$
P_t = E_t[M_t X_{t+1}]. \tag{1}
$$

In consumption-based models, $M_t = e^{-\rho}(C_{t+1}/C_t)^{-\gamma}$ under power utility; Arrow–Pratt relative risk aversion is

$$
\gamma_t = -C_{t+1} M_t'(C_{t+1}) / M_t(C_{t+1}). \tag{2}
$$

Aggregate consumption is measured with substantial error (Ermini; Wilcox; Slesnick; Ferson–Harvey seasonal adjustment; Breeden–Gibbons–Litzenberger time aggregation), weakening GMM tests (Hansen–Singleton 1982, 1983; Hansen–Jagannathan 1991 bounds; Chapman 1997 polynomials).

Ait-Sahalia–Lo (2000) and Jackwerth (2000) estimate kernels / risk-aversion functions from options plus historical return histograms, avoiding consumption data—but they:

- use **equal-weighted four-year** histograms that mishandle volatility dynamics (1987 crash abruptly exits the window in 1991);  
- average state prices over long samples, detecting only low-frequency time variation;  
- misfit individual dates when risk aversion and probabilities deviate from sample averages.

Rosenberg–Engle estimate a **monthly empirical pricing kernel (EPK)**—the preference function that best fits the cross-section of S&P 500 option prices given a **forward-looking** stochastic-volatility return density. They document **counter-cyclical risk aversion** and show that **time-varying** kernel hedge ratios outperform time-invariant ones.

---

## 2. Theory — Projections onto Return States

General kernel $M_t(Z_t,Z_{t+1})$. Project onto asset payoff $X_{t+1}$:

$$
P_t = E_t[M_t^*(X_{t+1}) X_{t+1}], \quad M_t^*(X_{t+1}) = E_t[M_t(Z_t,Z_{t+1})\mid X_{t+1}]. \tag{4}
$$

$M_t^*$ prices any claim on $X$ exactly as $M$ does. Projected risk aversion:

$$
\gamma_t^* = -X_{t+1} M_t^{*\prime}(X_{t+1}) / M_t^*(X_{t+1}). \tag{5}
$$

High $\gamma_t^*$ ⇔ steeply negatively sloping kernel ⇔ strong demand for payoffs in bad return states (crash insurance).

For equity-index options with finite horizon and index ≈ wealth (Rubinstein 1976; Brown–Gibbons 1985), the projection onto index returns is the economically relevant object.

---

## 3. Estimation Strategy

### 3.1 Criterion

For options with payoffs $g_i(r_{t+1})$,

$$
P_{i,t} = \int M_t^*(r)\, g_i(r)\, f_t(r)\, dr. \tag{6}
$$

With parametric kernel $M^*(r;\theta_t)$ and estimated density $\hat f_t$, choose

$$
\hat\theta_t = \arg\min_{\theta} \sum_{i=1}^{L} \bigl(P_{i,t} - \hat P_{i,t}(\theta)\bigr)^2 \tag{8}
$$

subject to pricing the risk-free bond: $B_t = E_t[M^*(r;\theta_t)]$.

### 3.2 Kernel specifications

1. **Power:** $M^*(r) \propto (1+r)^{-\theta_{1,t}}$ (constant RRA = $\theta_{1,t}$ in the projected sense).  
2. **Orthogonal polynomial (4 parameters)** on moneyness domain $[-10\%,+10\%]$; outside, kernel frozen at boundary values—flexible shape, can generate Jackwerth-style negative risk-aversion regions.

### 3.3 Return density — asymmetric GARCH

Nested tests: ARCH(1), GARCH(1,1), asymmetric GARCH(1,1). Likelihood-ratio: GARCH ≫ ARCH ($p<0.0001$); asymmetry parameter $\delta$ has robust $t=2.41$. Asymmetric GARCH passes Ljung–Box on standardized residuals ($p=0.74$) and ARCH-LM on squares ($p=0.70$). Standardized innovations: skewness **−0.36**, excess kurtosis **4.26**. Empirical frequencies of <−5σ and <−10σ events are orders of magnitude above Gaussian (6/10,000 and 3/10,000).

Each month: simulate **200,000** paths under asymmetric GARCH to build the one-month density $f_t$. June examples (1991–95) of annualized σ: 15.55%, 13.03%, 11.74%, 9.98%, 10.88%; skewness ≈ −0.36 to −0.47; kurtosis ≈ 5.06 to 5.73. Conditional vol over the long sample ranges from **6.75% to 112.86%** (peak around Oct 1987), SD of vol **6.36%**.

---

## 4. EPK Estimates (1991–1995)

### 4.1 Fit quality (Table 5)

| Spec | Avg pricing-error SD | Min | Max |
|------|----------------------|-----|-----|
| Orthogonal polynomial | **\\$0.09** | \\$0.03 | \\$0.24 |
| Power | \\$0.63 | \\$0.28 | \\$1.34 |

Polynomial wins on in-sample option fit.

### 4.2 Shape

Power kernels: negatively sloped, declining marginal utility across S&P return states; slope (risk aversion) varies month to month (Figure 4).  
Polynomial kernels: **higher** state price per unit probability on large negative returns (crash insurance), lower on large positive returns; volatile left-tail pricing; some evidence of **increasing** marginal utility for small positive returns (Figure 5)—echoing Ait-Sahalia–Lo and Jackwerth.

Average polynomial absolute risk aversion is **negative from about −4% to +2%** returns and rises for returns > −4%, matching Jackwerth’s post-crash qualitative findings. Power kernels **cannot** produce negative ARA (ARA = $\theta_1/(1+r)$ when $\theta_1>0$); over 1991–95 $\theta_1$ stays positive—declining but positive ARA.

### 4.3 Empirical risk aversion time series (Table 6)

Using power exponent $\theta_{1,t}$ as ERA:

- **Mean 7.36**; **range 2.26–12.55**  
- Autocorrelation $\rho=0.45$ (persistent, mean-reverting)  
- Figure 7 shows clear cyclical swings

---

## 5. Counter-Cyclical Risk Aversion (Table 7)

Regress ERA on business-condition changes (percent) plus lag ERA and ATM implied−objective vol spread.

**Credit spread** (Moody’s Baa − 30y Treasury): multiple-regression coefficient **+9.95** (significant); univariate $\rho=0.50$ ($p=0.0004$). A **1 bp** widening raises ERA by **0.0995**.

**Term slope** (30y − 3m Treasury): univariate $\rho=-0.36$ ($p=0.0129$); negative as expected for a pro-cyclical indicator (not always significant in the kitchen-sink regression).

Lagged ERA and vol spread also significant (persistence; risk-aversion markup in implied vol). Signs on short-rate changes, S&P returns, and consumption growth are consistent with counter-cyclicality even when insignificant.

**Interpretation:** supports habit models (Campbell 1996; Campbell–Cochrane 1999): surplus consumption ratio high in expansions ⇒ low RRA; recessions compress surplus ⇒ high RRA. Also rationalizes Fama–French (1989) cyclical risk premia via preference shocks, not only cash-flow news.

---

## 6. Hedging Tests (Section 6)

### 6.1 Design

Hedge a **\\$100** OTM S&P put (moneyness closest to **−3%**, not above −3%) with:

- ATM put (moneyness closest to 0, |m|≤1%), and/or  
- S&P 500 index portfolio.

Sample: options with **16–24 days** to expiry; **243** observations after screens. Time-invariant kernels use average parameters from 53 monthly EPK dates. Time-varying kernels forecast next-day $\theta$ with AR(1)-style models on 133 consecutive-day pairs; for power $\theta_{1,t+1}$: intercept 2.26, slope 0.69, adj. $R^2=50\%$; mean forecast 7.49 (SD 1.87). Hedge ratios from one-day index bumps priced under forecast kernel + 200k GARCH paths. Compare hedge-portfolio SDs; Diebold–Mariano-style t-tests on squared error differentials with Newey–West SEs.

### 6.2 Results (Table 11)

Time-varying kernels improve hedges by **~1–3%** in volatility vs time-invariant; significant in 3/6 cases, marginal in 1.

**Best performer: EPK power** with ATM put hedge — hedge-portfolio SD **\\$11.10**/day vs **\\$11.21** for time-invariant power ($t=2.82$).

Using S&P only: EPK power SD **\\$12.11** vs time-invariant **\\$12.41**.

Using both instruments: EPK power still best at **\\$11.29**, but dual-instrument hedges underperform ATM-only—consistent with estimation error in hedge ratios outweighing diversification of instruments.

**Power beats polynomial on hedging** despite worse in-sample pricing fit—overfitting caution for flexible kernels.

---

## 7. Practical Takeaways for a Quant Investor

1. **Do not price or hedge index options with a constant pricing kernel**; ERA swings from ~2 to ~12 monthly.  
2. **Build densities with asymmetric GARCH (or better SV), not rolling histograms**; left-tail probabilities are far above Gaussian.  
3. **Monitor credit spreads and curve slope as ERA indicators**; 1 bp Baa widening ≈ +0.1 ERA in this sample.  
4. **Prefer parsimonious (power) kernels for hedging** even if polynomials fit smiles better—out-of-sample hedge SD is the tie-breaker.  
5. **ATM puts hedge OTM puts better than the index** in this design; adding the index can hurt when ratios are estimated with noise.  
6. **Crash-insurance demand is time-varying**: polynomial EPKs show volatile state prices on large negative returns—relevant for skew-trading risk management.  
7. **Habit / surplus-consumption signals** belong in equity risk-premium and vol-of-vol dashboards alongside pure macro predictors (ties to Ferson’s semi-strong theme).

---

## 8. Limitations

- Five-year option window (1991–95); pre-LTCM, pre-GFC.  
- S&P 500 only; projection may miss non-equity state variables.  
- Parametric kernels; nonparametrics could differ day by day.  
- Hedging sample tied to liquid one-month strikes; deep OTM / long-dated claims untested.  
- Measurement of “objective” density still model-dependent (GARCH).  
- Orthogonal polynomials constrained outside ±10% moneyness.

---

## 9. Extended Quantitative Notes

### 9.1 Why histogram SPDs mislead

Under GARCH, a 1987-size shock should raise **current** conditional vol for months, not vanish discontinuously after four years. Using $\hat f_t$ from asymmetric GARCH, the denominator of state-price density $M=q/f$ is correctly conditioned, so estimated $M$ (and $\gamma^*$) are not polluted by stale crash density.

### 9.2 Bond-pricing constraint

Enforcing $B_t=E_t[M^*]$ pins down the level (time preference / scaling) so that remaining parameters identify risk aversion shape—critical when comparing ERA across months.

### 9.3 Hedge-ratio construction

Three scenarios for $S_{t+1}$; reprice puts under $E_t[M_{t+1}^*]$ and GARCH density; finite-difference delta/cross-gamma style ratios for ATM put and index. This nests Black–Scholes delta when $M^*$ is log-linear and density lognormal, but generalizes to arbitrary kernels (extension of Engle-style kernel hedges).

### 9.4 Economic size of ERA variation

Mean ERA 7.36 with range 2.26–12.55 implies the marginal rate of substitution between a −10% and +10% return state can swing dramatically month to month—enough to move OTM put prices by dollars per contract, consistent with Table 5’s pricing errors when a constant kernel is imposed.

### 9.5 Link to implied–objective vol spread

Significant positive loading of ERA on ATM implied−GARCH vol spread means part of the famous “vol risk premium” is preference-driven counter-cyclical risk aversion, not only jump-risk or intermediary constraints—though those channels are complements, not rivals.

---

## 10. Relation to Companion Literatures

- **Hansen–Jagannathan:** bounds on mean–SD of $M$; EPK gives a full functional form on equity states.  
- **Ait-Sahalia–Lo / Jackwerth:** cross-sectional SPD methods; RE add dynamics + SV densities + hedge tests.  
- **Campbell–Cochrane habits:** theoretical counter-cyclical RRA; RE provide option-market confirmation via ERA–credit correlation 0.50.  
- **Fama–French 1989:** cyclical premia; RE suggest preference channel.

---

## 11. Implementation Blueprint

**Monthly production job:**

1. Update asymmetric GARCH on S&P returns through $t$.  
2. Simulate 200k one-month paths → $\hat f_t$.  
3. Collect liquid one-month SPX options; mid quotes; filter.  
4. Fit power and polynomial EPKs with bond constraint.  
5. Record $\theta_{1,t}$, credit spread, term slope, implied−objective vol.  
6. Forecast $\theta_{t+1}$ with AR model; publish hedge ratios for OTM book.  
7. Exception alert if $\theta_{1,t}>10$ or credit-spread residual ERA >2σ.

---

## 12. Conclusion

Rosenberg and Engle replace consumption-based and long-window average kernels with a **monthly empirical pricing kernel** disciplined by option cross-sections and asymmetric-GARCH densities. Over 1991–1995, projected risk aversion averages **7.36**, swings between **2.3 and 12.6**, correlates **+0.50** with credit spreads, and improves OTM put hedges by a statistically detectable margin when allowed to vary. Flexible polynomials fit prices best; **power kernels hedge best**. For quant investors, the paper is both a methodology to extract preference shocks from options and a warning that constant-kernel risk systems mis-hedge whenever risk aversion moves with the cycle—which, the evidence says, is most of the time.

---

## 13. Detailed Hedging Performance Matrix (Narrative Reconstruction of Table 11)

| Kernel | Instruments | Hedge portfolio SD | vs time-invariant |
|--------|-------------|--------------------|-------------------|
| EPK power | ATM put | **\\$11.10** | better ($t=2.82$) |
| TI power | ATM put | \\$11.21 | baseline |
| EPK power | S&P only | \\$12.11 | better than TI \\$12.41 |
| EPK power | ATM + S&P | \\$11.29 | best among dual; still > ATM-only |
| Polynomial variants | various | higher SDs | power wins 5/6 pairwise at 5% |

Improvement magnitude **1–3%** of hedge SD looks modest until annualized over a continuous options book: shaving ~1% off daily hedge error compounds into material P&L variance reduction for market makers.

---

## 14. Why Power Beats Polynomial in Hedges

Polynomials use four free shape parameters monthly; estimation noise in higher-order coefficients injects noise into finite-difference hedge ratios. Power’s single curvature parameter $\theta_1$ is estimated more precisely and forecasts with 50% adj. $R^2$. Bias–variance trade-off favors power for **derivatives of the price function** (hedges) even when levels (prices) favor polynomials—classic in nonparametric hedging.

---

## 15. Credit-Spread Sensitivity — Portfolio Analogy

If a desk’s crash-put inventory is marked with a kernel at ERA=7.36, a 10 bp Baa widening that lifts ERA by ~1.0 (using the 9.95 coefficient per percentage point ⇒ 0.995 per 10 bp) steepens the kernel enough to raise OTM put values and change deltas materially. Risk systems that freeze $M$ will understate both the mark-to-market and the hedge ratios exactly when credit stress hits—procyclical under-hedging.

---

## 16. Final Synthesis

The empirical pricing kernel program delivers:

1. A **workable estimator** of $M_t^*(r)$ from options + SV densities.  
2. Evidence that **risk aversion is counter-cyclical** and persistent.  
3. Proof that **time variation improves hedges**.  
4. A caution that **best price fit ≠ best hedge kernel**.

That quartet remains core infrastructure for equity-derivatives quants, volatility-risk-premium researchers, and macro-finance empiricists linking preferences to observables.

---

## 17. Full Empirical Timeline and Data Construction

Option data: S&P 500 index options, monthly estimation dates 1991–1995 (53 monthly cross-sections for EPK fitting). Hedging uses intervening dates with 16–24 days to expiration (243 hedge observations; 133 consecutive-day pairs for AR forecasting of kernel parameters).

GARCH estimation uses a longer daily S&P history including the 1987 crash—necessary so that the conditional vol process knows about crash-sized moves. An indicator for the 1991–95 EPK window inside the GARCH mean/variance equations is insignificant once asymmetry is allowed, suggesting the SV dynamics are stable enough to export densities into the option sample.

Screening of options follows liquidity and maturity filters detailed in the paper’s data section (Section 4): focus on one-month claims for EPK estimation so that the pricing kernel horizon matches the density horizon, avoiding calendar-spread contamination of $M^*$.

---

## 18. Asymmetric GARCH Specification (Operational Form)

The preferred conditional variance takes the schematic form

$$
\sigma_{t|t-1}^2 = \omega + \alpha \varepsilon_{t-1}^2 + \beta \sigma_{t-1|t-2}^2 + \delta \varepsilon_{t-1}^2 1_{\{\varepsilon_{t-1}<0\}},
$$

i.e., GARCH(1,1) plus a leverage/asymmetry term ($\delta>0$ amplifies variance after negative shocks). Robust $t=2.41$ on $\delta$ rejects symmetry. Standardized residuals $\varepsilon_t/\sigma_{t|t-1}$ feed an empirical innovation density with fat left tails used in the Monte Carlo: each simulated path draws a standardized residual from the historical pool (filtered historical simulation) or a smoothed version, scaled by the forward iterated $\sigma$.

Annualized vol forecasts over the long sample span 6.75%–112.86%: the upper extreme is the 1987-filtered conditional vol, illustrating why histogram methods that equally weight four calm years misstate crash probabilities after volatility clusters fade.

---

## 19. Pricing-Error Economics

Average polynomial pricing-error SD of \\$0.09 on index options is small relative to typical mid-market bid–ask and to power’s \\$0.63. That gap shows the smile/skew contains shape information beyond constant RRA—exactly the Jackwerth negative-ARA region and left-tail state-price spikes. Yet when those extra shape parameters are filtered into hedge ratios, out-of-sample hedge variance rises. Production recommendation: **mark books with polynomials (or nonparametrics); hedge with power or with Bayesian-shrunk shape parameters.**

Minimum polynomial error SD \\$0.03 vs maximum \\$0.24 also shows date-by-date variation in how well a four-parameter family spans the smile—on high-error dates, richer kernels or jump-augmented densities may be required.

---

## 20. Counter-Cyclicality — Multivariate vs Univariate

Table 7’s kitchen-sink regression leaves credit spread as the standout cyclical indicator, while term slope shows up more cleanly in univariate correlation. Multicollinearity among macro indicators is expected (curves flatten when recessions loom and credit widens jointly). For a parsimonious ERA nowcast, a two-variable model—lagged ERA + credit-spread change—captures persistence and cyclicality with less overfitting than the full kitchen sink. The vol-spread term additionally anchors ERA to the options market’s own risk-aversion markup.

Consumption growth’s weak showing, despite its theoretical centrality, is consistent with the paper’s premise that NIPA consumption is a poor empirical stand-in for marginal utility—motivating the entire EPK approach.

---

## 21. Hedge Design Subtleties

OTM put moneyness target of −3% is close enough to ATM to ensure overlapping liquidity but far enough to embed skew/kernel convexity. Using 16–24 DTE rather than exact 30-day options increases sample size for hedge tests while staying near the EPK horizon. Excluding dates without next-day prices avoids noisy marks.

The result that ATM+index dual hedges lose to ATM-only is a useful warning for desk practice: **more instruments help only if hedge ratios are known;** with estimated ratios, ATM puts already span most of the OTM put’s kernel-sensitive risk, and the index adds delta noise.

---

## 22. Connecting EPK to Stationary Distortion and RN Densities

Risk-neutral density $q_t(r)$ from options and physical density $f_t(r)$ from GARCH give

$$
M_t^*(r) = e^{-r_f} \frac{q_t(r)}{f_t(r)}
$$

(up to discrete-time analogs). EPK estimation is essentially a parametric projection of that ratio. Errors in $f_t$ (e.g., thin tails) force $M^*$ to compensate by overstating left-tail state prices—the bias RE avoid relative to four-year histograms. Errors in $q_t$ (microstructure, weight on far OTM) matter less when many strikes enter the least-squares criterion (8).

---

## 23. Numbers Dashboard for Quants

| Object | Estimate |
|--------|----------|
| EPK sample | monthly 1991–1995 (53 dates) |
| Mean ERA $\theta_1$ | 7.36 |
| ERA range | 2.26 – 12.55 |
| ERA AR(1) ρ | 0.45 |
| Corr(ERA, credit spread) | 0.50 (p=0.0004) |
| Corr(ERA, term slope) | −0.36 (p=0.0129) |
| Credit coeff (per percentage point) | 9.95 |
| Poly pricing-error SD | \\$0.09 avg |
| Power pricing-error SD | \\$0.63 avg |
| MC paths per density | 200,000 |
| Hedge obs | 243 |
| Best hedge SD | \\$11.10 (EPK power, ATM) |
| TI power ATM hedge SD | \\$11.21 |
| DM-style t (EPK vs TI power, ATM) | 2.82 |
| GARCH asymmetry robust t | 2.41 |
| Std innov skew / excess kurtosis | −0.36 / 4.26 |
| Cond vol range (long sample) | 6.75% – 112.86% |

---

## 24. Closing Assessment

Rosenberg–Engle (2001) remains a landmark because it operationalizes a **time-series of pricing kernels** rather than a single average kernel, ties the series to macro credit conditions, and validates the dynamics through hedging P&L—not only in-sample smile fits. For a Scholar library, it is the natural stochastic-discount-factor companion to Ferson’s predictability survey and to option-based risk-aversion work by Jackwerth and Aït-Sahalia–Lo.

---

## 25. One-Paragraph Executive Takeaway

Estimate a monthly equity-projected pricing kernel from SPX options and asymmetric-GARCH densities; expect relative risk aversion near 7 but ranging from roughly 2 to 13; treat credit-spread widenings as risk-aversion shocks of about 0.1 ERA per basis point; mark with flexible kernels but hedge OTM puts with a time-varying power kernel against ATM puts—and you will outperform constant-kernel hedges by a statistically reliable though modest margin while aligning preference estimates with habit-model counter-cyclicality.
