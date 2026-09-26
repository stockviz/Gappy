# A Hidden Markov Model of Momentum
**Authors:** Kent Daniel, Ravi Jagannathan, Soohun Kim
**Year:** 2019
**Journal/Venue:** Working paper

## Problem statement

This file is a duplicate naming variant of the same February 17, 2019 hidden-Markov-model momentum paper that also appears in the source folder under a filename that explicitly includes Kim. The substantive question is the same: **can momentum crashes be explained by a latent market regime in which the short side of the strategy becomes effectively short a call option on the market, and can that regime be filtered in real time well enough to improve implementation?**

The importance of the paper is not just descriptive. It tries to convert the crash mechanism into a monthly state variable that can actually be used.

## Approach (short)

The paper estimates a two-state hidden Markov model using the joint distribution of market returns and momentum returns over 1927:01-2017:12. The baseline strategy is the standard value-weighted `12-2` winner-minus-loser portfolio. The central economic mechanism is that, after severe market declines, the loser portfolio becomes highly levered and option-like, so the momentum strategy inherits the payoff of being short a call on the market. The HMM filters calm versus turbulent states and uses the ex ante turbulent-state probability to time exposure. High turbulent probability forecasts the left tail of momentum and motivates cutting exposure.

## Approach (detailed)

### 1. Define the momentum portfolio in the standard academic way

The paper does not alter the baseline strategy. Each month:

1. rank stocks by cumulative return from `t-12` through `t-2`;
2. form winner and loser deciles;
3. go long the winner decile and short the loser decile.

The use of the standard value-weighted `12-2` WML portfolio matters because the paper wants to explain crash risk in the canonical strategy, not in a custom variant.

### 2. Diagnose the crash problem before modeling it

Over 1927:01-2017:12, the average momentum premium is large, but the return distribution is highly left-skewed and contains a set of enormous crash months. The first methodological claim is therefore that a constant-beta, linear-factor description is inadequate. The tails are too asymmetric and too clustered.

So the paper starts from a stylized fact:

- momentum has high average return,
- but a small number of months dominate the left tail,
- and those months are not randomly scattered.

That clustering is what motivates a latent-state model.

### 3. Explain the crash through the loser leg

The economic story uses Merton's equity-as-an-option logic. After large market declines:

- firms in the loser decile are closer to distress,
- their equity becomes more levered and more convex,
- their payoff starts to resemble a call option on firm value,
- their sensitivity to a market rebound rises sharply.

Because the momentum portfolio is short these losers, WML behaves like it is **short a call option on the market** in precisely those stressed states. When the market rebounds sharply after a drawdown, the short loser book rallies violently and momentum crashes.

That mechanism is the paper's core argument. The HMM is built on top of it, not instead of it.

### 4. Measure the optionality directly before introducing the hidden state

Before estimating the HMM, the paper shows that market exposure is nonlinear. The momentum return is modeled with an augmented Henriksson-Merton style specification:

$$
R_{MOM,t}
=
\alpha+\beta R_{MKT,t}+\beta^+ \max(R_{MKT,t},0)+\varepsilon_t.
$$

The coefficient on the positive-market piece captures the extra sensitivity to rebounds. This term becomes especially strong in states where the loser portfolio has become distressed. The paper also conditions this nonlinearity on observable state variables such as:

- cumulative market return over the prior 36 months,
- realized market volatility over the prior 12 months,
- the return cutoff needed to enter the loser decile.

These observables are used to demonstrate that the option-like interpretation is not just a metaphor.

### 5. Replace ad hoc state partitions with a two-state hidden Markov model

The full model assumes an unobserved regime `S_t` taking two values:

- calm,
- turbulent.

The hidden state follows a persistent first-order Markov chain. Conditional on the state, the momentum return process is allowed to have different:

- intercepts,
- market betas,
- convexity to positive market returns,
- residual variances.

That structure is important. The turbulent state is not defined only by high volatility; it is defined by a different *shape* of the market-momentum relation, especially a more dangerous response to positive market rebounds.

### 6. Estimate the model on joint market and momentum returns

The model is estimated by maximum likelihood using the joint time series of:

- market excess return,
- momentum portfolio return.

Identification comes from state-dependent means, variances, and nonlinear dependence with the market. Rare crash episodes do not contain enough information in average returns alone, so the model relies heavily on the change in covariance structure and rebound convexity.

The estimated turbulent state is characterized by:

- lower conditional expected momentum return,
- more adverse market exposure,
- stronger rebound convexity,
- higher residual variance.

### 7. Filter the ex ante turbulent-state probability

Once parameters are estimated, the implementable object is the filtered probability

$$
\Pr(S_t = \text{turbulent}\mid \mathcal F_{t-1}).
$$

This is the state variable the paper wants the reader to use. Because the Markov state is persistent, a high filtered probability at time `t` is informative about the risk of a crash in `t+1`, not merely a description of the recent past.

### 8. Validate the state by locating crash months

The paper then checks whether the worst momentum crashes actually occur when the ex ante turbulent probability is high. They do. The most negative WML months are heavily concentrated in the top range of filtered turbulent probability.

This is the crucial empirical test. Without it, the HMM would just be a flexible in-sample density fit. With it, the hidden state becomes a meaningful left-tail predictor.

### 9. Turn the filter into a timing overlay

The trading implication is simple:

1. hold the standard WML portfolio when the turbulent probability is low;
2. reduce or eliminate momentum exposure when the turbulent probability is high.

Because the filter is computed with information available at the time, this is a genuine ex ante timing rule. The paper shows that the overlay improves Sharpe ratio and materially attenuates the catastrophic left tail.

### 10. How this duplicate note should be used

Methodologically, this file should be read the same way as [DanielJagannathanKim_2019.md](/Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My%20Drive/library/summaries/momentum/DanielJagannathanKim_2019.md): it is the same underlying HMM paper, and the same implementation logic applies. The reason to retain a separate note is only that this duplicate PDF belonged to the original first-20 requested batch by filename order.

## Domain of applicability

- **Where it works well:** Cross-sectional equity momentum where the short loser leg becomes distressed after market drawdowns.
- **What is implementable:** A monthly hidden-state crash overlay on top of a standard value-weighted WML momentum strategy.
- **Main limitation:** The two-state HMM is intentionally parsimonious; it captures the dominant crash regime, not every possible nonlinear market environment.
- **Why the paper matters:** It gives both a concrete crash mechanism and an implementable real-time filter for that mechanism.
