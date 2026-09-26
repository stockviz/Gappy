# Tail Protection for Long Investors: Trend Convexity at Work
**Authors:** Tung-Lam Dao, Thanh-Thai Nguyen, Clément Deremble, Yannick Lempérière, Jean-Philippe Bouchaud, Marc Potters
**Year:** 2016
**Journal/Venue:** SSRN working paper

## Problem statement

CTA returns are widely said to be convex and "long volatility", but the usual evidence is weak: a naive scatter of monthly CTA returns against equity returns shows only a barely visible parabola. The paper asks a sharper question: **what is the exact mechanism that makes trend-following convex, on what time scale should that convexity be measured, and how does diversification change the result?** A secondary question is whether the option analogy can be made exact rather than metaphorical.

## Approach (short)

The paper shows that a single-asset trend-following strategy earns the difference between a long-horizon realized variance and a short-horizon realized variance. For a simple trend signal, the aggregated P&L is literally proportional to
$$
\text{long-term variance} - \text{short-term variance}.
$$
For EMA-based trend rules, a closely related exact formula holds after smoothing. This implies a quadratic or V-shaped payoff in the trend signal, hence positive convexity and positive skewness. The authors then calibrate a simple diversified futures trend model to the SG CTA Index and find that the relevant trend horizon is about 180 trading days; once performance is aggregated on the matching horizon, CTA convexity becomes visible. Finally, they show that a portfolio of strangles delivers the same exposure to long-horizon variance as a trend strategy, while hedging the options swaps long-term variance for short-term variance, clarifying the option connection.

## Approach (detailed)

### 1. Trend as a bet on the slope of the signature plot

The paper starts from a stationary additive price process
$$
S_t = S_0 + \sum_{u \le t} D_u
$$
with autocovariance $C(|u-v|) = \mathbb{E}[D_u D_v]$. The realized variance at horizon $\tau$ is
$$
\sigma^2(\tau) = \frac{1}{\tau}\mathbb{E}(S_{t+\tau}-S_t)^2
=
\sigma^2 + \frac{2}{\tau}\sum_{u=1}^{\tau}(\tau-u)C(u).
$$

So:

- positive autocorrelation raises long-horizon variance above short-horizon variance,
- negative autocorrelation lowers it.

That observation already suggests why trend following works: it monetizes positive autocorrelation by going long the upward slope of the signature plot.

### 2. Toy trend strategy: exact variance-spread formula

The paper's cleanest derivation uses a toy rule with position
$$
\Pi_t = \lambda (S_t - S_0),
$$
so the strategy is long when price is above its initial level and short when below. The one-period gain is
$$
G_t = \Pi_{t-1}D_t.
$$
Summing over $t=1,\dots,T$ gives
$$
G_T = \frac{\lambda}{2}\left[(S_T-S_0)^2 - \sum_{t=1}^T D_t^2\right].
$$

Taking expectations,
$$
\mathbb{E}G_T = \frac{\lambda T}{2}\left[\sigma^2(T)-\sigma^2(1)\right].
$$

This is the paper's central identity. Trend-following does not need a mysterious economic story at this stage. It simply earns when long-term realized variance exceeds short-term realized variance.

The implementable interpretation is equally clear:

1. choose a horizon $T$ over which you define trend,
2. scale position with the magnitude of that trend,
3. expect gains when variance accumulates at that horizon faster than it does at the rebalancing horizon.

### 3. Risk-managed EMA trend following

Real CTAs do not trade the toy rule. They use filtered, volatility-normalized signals. So the authors define normalized returns
$$
R_t = D_t/\sigma_{t-1}
$$
and an EMA trend signal $L_\tau[R_t]$. The position is
$$
\Pi_t = \lambda \tau \frac{L_\tau[R_t]}{\sigma_t}.
$$

For this rule they derive an exact discrete identity for a smoothed P&L:
$$
L_{\tau'}[G_t]
=
\frac{\lambda\tau}{\tau-1}
\left(
\tau L_{2\tau}^2[R_t] - L_{\tau'}[R_t^2]
\right),
\qquad
\tau' \approx \tau/2.
$$

So even for a realistic EMA rule, smoothed trend-following P&L is again:

- a long-term variance term,
- minus a short-term variance term.

If short-term variance has been normalized to roughly one, the conditional expected aggregated P&L given the trend signal $T_t = \sqrt{\tau}L_\tau[R_t]$ becomes
$$
\mathbb{E}[G\mid T] = \Upsilon(\tau)(T^2-1).
$$

That is the exact source of convexity. If $T$ is large in absolute value, the strategy makes money whether the move was up or down. If $T$ is near zero, the strategy tends to lose because realized noise dominates the signal.

### 4. Capped positions and why the smile can become V-shaped

If instead of a linear position one caps aggressively and uses only the sign of the trend, the conditional payoff becomes approximately
$$
\mathbb{E}[G\mid T] \propto |T| - \sqrt{2/\pi}.
$$

So the qualitative shape survives:

- linear sizing gives a parabola,
- hard capping gives a V-shape,
- intermediate saturation interpolates between them.

This is useful operationally: convexity is not tied to one exact signal transform. It is a generic consequence of trading in the direction of an existing move.

### 5. Why positive skewness follows mechanically

At the strategy horizon, the trend signal is approximately Gaussian by aggregation. The P&L is then approximately a shifted chi-square object because it depends on $T^2$. Therefore:

- gains are rare and large,
- losses are frequent and limited,
- skewness is positive even if unconditional expected return is small.

The paper emphasizes an important point also made by Potters and Bouchaud elsewhere: a trend strategy can have positive convexity and positive skewness even if the underlying itself is an unbiased random walk. Average profitability and shape are distinct questions.

### 6. Reconstructing the SG CTA Index

The multi-asset empirical exercise uses a broad liquid futures set across:

- commodities,
- stock indices,
- currencies,
- short rates,
- government bonds.

The authors apply the simple trend rule cross-sectionally, equalize risk across assets, add realistic management and incentive fees, and compare the result to the SG CTA Index. They fit only two substantive objects:

1. the scaling of risk,
2. the trend horizon $\tau$.

The correlation with the index peaks above 80% for a trend horizon around 180 trading days. This is important for two reasons:

- it says a very large fraction of CTA industry returns is still captured by a simple time-series trend rule,
- it identifies the correct horizon on which convexity should be measured.

When the authors aggregate CTA performance on roughly $\tau' \approx 90$ days and compare it to an S&P trend signal at $\tau \approx 180$ days, the convexity is much clearer than in naive monthly charts. The $R^2$ of the quadratic fit rises from about 0.02 to about 0.18.

### 7. Diversification reduces single-asset convexity but creates a hedge for risk parity

A diversified CTA is not just a single-asset trend bet. Diversification dilutes convexity with respect to any one benchmark, especially the S&P 500. The authors therefore introduce a risk-managed long-only diversified portfolio,
$$
G_t^{RP} = \sum_k \omega_k R_{k,t},
$$
essentially a risk-parity proxy built from the same futures universe.

Using Jensen-type convexity arguments, they derive a lower bound:
$$
\mathbb{E}[G^{CTA}\mid T^{RP}] \ge \Upsilon(\tau)\left((T^{RP})^2-1\right).
$$

So the CTA portfolio is provably convex with respect to the diversified risk-parity proxy, even if convexity against equities alone looks weaker. This is an important practical correction to the common habit of evaluating CTAs only against stock-market crashes.

### 8. Exact option connection: naked strangles and hedging

The options section is the cleanest part of the paper conceptually. Consider a continuum of equally weighted strangles around the spot. The terminal payoff of that static option portfolio is
$$
\frac12 (S_T-S_0)^2
$$
minus an upfront premium proportional to implied volatility.

That is the same long-horizon variance object that appeared in the toy trend model. The difference is what is paid for it:

- the option portfolio pays *implied* volatility upfront,
- the trend strategy pays *realized short-term* volatility through repeated rebalancing.

If you delta-hedge the strangle portfolio, the hedge P&L is
$$
\frac12\sum_{t=1}^T D_t^2 - \frac12 (S_T-S_0)^2,
$$
which exactly swaps long-term variance for short-term variance. Adding hedge plus option gives a variance-swap-like payoff. This makes the trend-option link precise: trend following is a cheap way of acquiring long-horizon variance exposure, financed by bearing short-horizon realized-variance costs.

## Domain of applicability

- **Where it works well:** The paper is strongest when explaining *shape* rather than forecasting alpha. It gives an exact mechanical explanation for convexity, skewness, and the crisis-hedging behavior of trend programs.
- **What is implementable:** You can implement the paper's logic by volatility-normalizing returns, computing an EMA trend over about the relevant horizon, sizing exposure proportionally to that signal, and evaluating performance on the matching aggregation window rather than monthly by default.
- **Main limitations:** The core derivations use an additive price process and simple stylized rules. The CTA replication is deliberately coarse: equal-risk weights, one dominant horizon, simple fee assumptions. Gap risk below the rebalancing horizon is explicitly not hedged.
- **What the paper does not claim:** It does not claim CTAs are perfect equity tail hedges. It claims they are convex to large *diversified* market moves at the horizon their models actually use.
- **What is genuinely novel:** The paper's main contribution is to turn the slogan "trend following is long vol" into an exact statement: trend-following P&L is long long-term realized variance and short short-term realized variance. The risk-parity lower-bound argument and the exact strangle/hedging interpretation are the strongest new pieces.
