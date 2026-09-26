# Momentum and Risk Adjustment
**Authors:** Martin Dudler, Bruno Gmur, Semyon Malamud
**Year:** 2015
**Journal/Venue:** Journal of Alternative Investments

## Problem statement

Standard time-series momentum uses averages or signs of past realized returns. But raw realized returns mix signal and volatility noise. This paper asks: **can one improve time-series momentum by risk-adjusting the returns that enter the signal itself, rather than only scaling the final position?**

The paper's answer is yes, and it proposes a new class of signals called risk-adjusted momentum, or RAMOM.

## Approach (short)

The paper starts from the Moskowitz-Ooi-Pedersen time-series momentum framework and changes one ingredient: instead of forming the signal from raw past returns, it forms it from **past returns divided by realized volatility**.

The volatility estimator is an EWMA:

$$
\sigma_{i,t}^2(\lambda)=\lambda \sigma_{i,t-1}^2(\lambda)+(1-\lambda)r_{i,t}^2.
$$

The risk-adjusted signal averages normalized returns over the lookback window:

$$
R^{RA}_{i,t,h}(\lambda)=\frac{1}{h}\sum_{l=t-h}^{t-1}\frac{r_{i,l,12}}{\sigma_{i,l-1}(\lambda)}.
$$

Positions are then taken according to the sign of that signal and scaled by inverse current volatility, exactly as in risk parity. The paper tests RAMOM against standard TSMOM on 64 liquid futures contracts from 1984 to 2014.

## Approach (detailed)

### 1. Start from the criticism of raw momentum signals

The paper's premise is simple: if returns are highly heteroskedastic, then averaging raw past returns is a noisy estimator of the latent expected-return state. A large raw return in a high-volatility environment may be less informative than a smaller raw return in a calm environment.

So the paper separates two tasks:

- infer the direction of the trend;
- scale the eventual position for risk.

Standard TSMOM mostly addresses the second task. RAMOM tries to improve the first.

### 2. Estimate volatility with an EWMA

For each futures contract `i`, daily volatility is estimated recursively as

$$
\sigma_{i,t}^2(\lambda)=\lambda \sigma_{i,t-1}^2(\lambda)+(1-\lambda)r_{i,t}^2.
$$

The paper distinguishes two uses of volatility:

- `\lambda = 0.94` for position scaling, following RiskMetrics and the risk-parity style of Moskowitz, Ooi, and Pedersen;
- a smaller `\lambda`, typically `0.5`, for signal construction, so that the risk-adjusted signal reacts faster to new information.

This separation is important. The paper is not using one volatility estimate for everything.

### 3. Define the RAMOM signal from normalized returns

The raw TSMOM signal uses the sign of cumulative past returns. RAMOM instead computes the average of **risk-adjusted** past returns:

$$
R^{RA}_{i,t,h}(\lambda)=\frac{1}{h}\sum_{l=t-h}^{t-1}\frac{r_{i,l,12}}{\sigma_{i,l-1}(\lambda)}.
$$

The sign of `R^{RA}` determines the trading direction. Conceptually:

- if recent positive returns were earned in low-volatility conditions, RAMOM strengthens the signal;
- if they were earned in noisy, high-volatility conditions, RAMOM discounts them.

### 4. Keep position scaling comparable to TSMOM

To isolate the effect of the signal rather than the leverage rule, both TSMOM and RAMOM scale positions by inverse current volatility. So the difference between the two strategies is not the final risk target but the way the direction signal is constructed.

Operationally, for a given lookback `k1` and holding horizon `k2`:

- TSMOM takes the sign of raw cumulative return;
- RAMOM takes the sign of the normalized-return average;
- both divide position size by `\sigma_{i,t-1}(0.94)`.

The aggregated strategy is the equal-weighted average of instrument-level returns.

### 5. Use a grid of lookback and holding horizons

The paper does not only test the canonical 12-month/1-month strategy. It studies a grid of `{k1, k2}` pairs, where:

- `k1` is the lookback horizon,
- `k2` is the holding horizon.

This matters because the benefit of signal denoising may differ across short-, medium-, and long-horizon trends.

### 6. Compare against a long-only risk-parity benchmark

Because inverse-volatility scaling itself can generate attractive performance, the paper also constructs a long-only risk-parity benchmark:

$$
r_{i,t}^{RP}=\frac{e^{r_{i,t}}-1}{\sigma_{i,t-1}(0.94)}.
$$

That benchmark answers a key question: how much of the performance comes from directional trend-following and how much from simply levering low-volatility assets?

### 7. Use a large futures universe

The data cover 64 liquid futures contracts across:

- equities,
- bonds,
- commodities,
- currencies.

The main sample runs from January 1984 to January 2014, chosen because by then at least half of the instrument universe is actively traded.

This design makes the evidence cross-asset rather than tied to one market.

### 8. Evaluate abnormal performance relative to TSMOM

To test whether RAMOM contains information beyond TSMOM, the paper runs

$$
R_t^{RAMOM}=\alpha+\beta R_t^{TSMOM}+\varepsilon_t.
$$

The economically relevant object is the zero-TSMOM-beta portfolio:

- long one unit of RAMOM,
- short `\beta` units of TSMOM.

If that residual has a positive Sharpe ratio, RAMOM is not just a repackaged version of the old signal.

### 9. Measure performance in the dimensions that matter to trend followers

The paper reports:

- annualized Sharpe ratios,
- Calmar ratios,
- drawdown behavior,
- and subperiod performance.

This is important because the whole point of RAMOM is not merely higher mean return. It is also better crash behavior and more stable signal extraction.

### 10. Examine volatility dependence directly

RAMOM is built to react faster when volatility is low and to discount periods of elevated noise. The paper therefore studies whether RAMOM's outperformance versus TSMOM is stronger in low-volatility environments and whether part of the alpha is mechanically tied to volatility shocks.

It also estimates versions of the RAMOM-versus-TSMOM regression that hedge volatility exposure, including specifications with changes in VIX, to show that the incremental performance is not only a disguised long-vol or short-vol trade.

### 11. Main empirical conclusion

RAMOM outperforms TSMOM on most lookback/holding combinations:

- higher Sharpe ratios,
- better Calmar ratios,
- smaller drawdowns,
- and positive alpha relative to TSMOM even after beta-matching.

The effect is particularly strong for shorter-horizon momentum and in calmer volatility regimes.

### 12. Interpret the economics

The paper's interpretation is not that raw momentum is wrong. It is that raw momentum uses a noisy estimator of the underlying state. By dividing returns by realized volatility **before** averaging them into a signal, RAMOM removes a portion of variation that reflects changing volatility rather than changing expected return.

That is a signal-extraction claim, not merely a leverage claim.

### 13. What a reader should implement

A faithful implementation is:

1. estimate EWMA volatility for each contract;
2. build raw TSMOM signals from cumulative past returns and RAMOM signals from cumulative normalized returns;
3. scale both strategies by inverse current volatility;
4. average across contracts;
5. evaluate RAMOM both standalone and in a beta-neutral spread against TSMOM.

That beta-neutral spread is the cleanest test of whether the signal improvement is real.

## Domain of applicability

- **Where it works well:** Cross-asset futures trend-following where volatility is strongly time-varying.
- **What is implementable:** Risk-adjusted momentum signals, inverse-volatility position sizing, and RAMOM-minus-TSMOM spread portfolios.
- **Main limitation:** The approach depends on a volatility model and on liquid futures implementation; it is not a frictionless recipe for single-name equities.
- **Why the paper matters:** It upgrades momentum from "trend plus risk scaling" to "trend after denoising the signal itself."
