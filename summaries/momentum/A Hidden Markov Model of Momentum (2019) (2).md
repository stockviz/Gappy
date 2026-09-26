# A Hidden Markov Model of Momentum
**Authors:** Kent Daniel, Ravi Jagannathan, Soohun Kim
**Year:** 2019
**Journal/Venue:** Working paper

## Problem statement

This PDF is another filename variant of the same February 17, 2019 hidden-Markov-model momentum paper already summarized in [DanielJagannathanKim_2019.md](/Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My%20Drive/library/summaries/momentum/DanielJagannathanKim_2019.md) and [DanielJagannathan_2019.md](/Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My%20Drive/library/summaries/momentum/DanielJagannathan_2019.md). The substantive question is unchanged: **can momentum crashes be explained by a latent turbulent regime in which the short loser book becomes effectively short a call option on the market, and can that regime be filtered in real time well enough to time exposure?**

## Approach (short)

The paper estimates a two-state hidden Markov model on the joint behavior of market returns and the standard value-weighted `12-2` momentum strategy. The mechanism is that after large market declines the loser portfolio becomes highly levered and convex, so a rebound makes the momentum strategy behave like it is short a call on the market. The filtered turbulent-state probability is then used as an ex ante timing overlay to reduce exposure when crash risk is high.

## Approach (detailed)

### 1. Keep the baseline strategy standard

Each month:

1. rank stocks by cumulative return from `t-12` through `t-2`,
2. form winner and loser deciles,
3. go long winners and short losers.

The paper wants to explain the crash behavior of the canonical momentum factor, not of a custom strategy.

### 2. Explain the crash through the short loser leg

After severe market declines, loser firms are closer to distress, so their equity becomes more option-like. Their rebound exposure to the market becomes strongly convex. Because momentum is short these names, the whole strategy behaves like a **short call** on the market in bad states.

This is the economic mechanism the whole paper is built around. The hidden-state model is useful only if it captures that option-like loser-leg behavior.

### 3. Measure nonlinear market exposure directly

Before fitting the HMM, the paper estimates nonlinear market exposure with a specification of the form:

$$
R_{MOM,t}=\alpha+\beta R_{MKT,t}+\beta^+\max(R_{MKT,t},0)+\varepsilon_t.
$$

The positive-market piece captures the rebound convexity that becomes especially dangerous after drawdowns.

The paper also conditions this nonlinearity on observables such as:

- cumulative market return over the prior 36 months,
- realized market volatility over the prior 12 months,
- the return cutoff required to enter the loser decile.

These observables are used to show that the convexity interpretation is economically grounded before the latent-state model is imposed.

### 4. Estimate a two-state hidden Markov model

The unobserved state is either:

- calm,
- turbulent.

Conditional on the state, the momentum return process has different:

- intercepts,
- market betas,
- convexity,
- residual variances.

The model is estimated by maximum likelihood on the joint market-and-momentum time series. The turbulent state is identified not just by higher variance, but by a different *shape* of the market-momentum relation: lower conditional mean, more adverse market exposure, and much stronger rebound convexity.

### 5. Filter the turbulent-state probability

The implementable object is:

$$
\Pr(S_t=\text{turbulent}\mid \mathcal F_{t-1}).
$$

Because the hidden state is persistent, high values of this filtered probability forecast the left tail of momentum rather than merely redescribing recent data.

### 6. Use the probability as a timing overlay

The strategy implication is:

- keep exposure when the turbulent probability is low,
- cut or remove exposure when it is high.

The empirical claim is that this overlay avoids many crash months and improves risk-adjusted performance. The paper validates the filter by showing that the worst momentum crash months are disproportionately concentrated in periods when the ex ante turbulent-state probability is already high.

### 7. Why this duplicate note exists

This note is retained only because the PDF appeared in the next filename batch requested by the user. Methodologically it should be read the same way as the two other 2019 HMM notes already in the folder.

## Domain of applicability

- **Where it works well:** Cross-sectional equity momentum with a distressed short loser leg.
- **What is implementable:** A hidden-state crash overlay on top of standard WML.
- **Main limitation:** The same underlying paper is already summarized elsewhere in the folder.
- **Why the paper matters:** It remains one of the cleanest papers linking momentum crash mechanics to a real-time state variable.
