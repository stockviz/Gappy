# A Hidden Markov Model of Momentum
**Authors:** Kent Daniel, Ravi Jagannathan, Soohun Kim
**Year:** 2019
**Journal/Venue:** Working paper

## Problem statement

Cross-sectional momentum generates high average returns, but the return distribution is highly left-skewed and punctuated by occasional catastrophic crashes. A static factor view does not explain those episodes. This paper asks: **can momentum crashes be explained by a latent market regime in which the short side of the strategy becomes effectively short a call option on the market, and can that regime be estimated in real time well enough to improve implementation?**

The paper's ambition is therefore twofold:

- explain the crash mechanism,
- and produce a usable timing signal.

## Approach (short)

The authors estimate a two-state hidden Markov model using the joint distribution of market returns and momentum returns over 1927:01-2017:12. The baseline momentum portfolio is the standard 12-2 winner-minus-loser strategy. The key economic mechanism is that after severe market declines, the loser portfolio becomes highly levered and convex, so a market rebound creates extreme losses for a strategy that is short those losers. The HMM filters calm versus turbulent states and uses the ex-ante turbulent-state probability to time momentum exposure. The resulting overlay avoids many crash months and improves out-of-sample risk-adjusted performance.

## Approach (detailed)

### 1. Define the baseline portfolio and the crash fact

The baseline strategy is the standard value-weighted `12-2` momentum portfolio:

1. each month rank stocks by cumulative return from `t-12` through `t-2`;
2. form winner and loser deciles;
3. go long the winner decile and short the loser decile.

Over 1927:01-2017:12 this strategy has a high mean return and alpha, but it also has an extremely heavy left tail. The paper's starting point is that the crash months are too large and too clustered to be treated as draws from a stationary linear factor model.

### 2. Motivate the option-like crash mechanism through the loser leg

The economic mechanism uses Merton's equity-as-an-option logic. After large market declines:

- firms in the loser decile are often close to distress;
- their equity behaves like a call option on firm value;
- their effective leverage rises sharply;
- and their exposure to a market rebound becomes highly convex.

Because the momentum strategy is short these losers, the overall WML portfolio behaves like it is **short a call option on the market** in bad states. When the market rebounds, the loser portfolio can rally violently and the momentum portfolio crashes.

### 3. Measure the optionality in the data before introducing the HMM

The paper first estimates an augmented market model of the Henriksson-Merton type:

$$
R_{MOM,t}
=
\alpha + \beta R_{MKT,t} + \beta^+ \max(R_{MKT,t},0) + \varepsilon_t.
$$

This lets the exposure to positive market moves differ from the exposure to negative market moves. The results show that the positive-market convexity term is much stronger exactly in the states where momentum later crashes.

The paper also conditions this optionality on observable state variables:

- cumulative market return over the prior 36 months,
- realized market volatility over the prior 12 months,
- and the return breakpoint required to enter the loser portfolio, which proxies for how deeply distressed the loser basket has become.

These tests are important because they tie the statistical nonlinearity to a concrete balance-sheet story.

### 4. Replace the observable-state partition with a latent-state model

The full model assumes an unobserved state `S_t` that can be either:

- calm,
- or turbulent.

The state follows a two-state Markov chain with persistent transition probabilities. Conditional on the state, the momentum return-generating process has different:

- intercepts,
- market betas,
- convexity to positive market returns,
- and residual volatility.

This is more than a regime-switching mean model. The HMM is meant to capture the fact that the **shape** of the market-momentum relationship changes with the regime.

### 5. Estimate the HMM from joint market and momentum returns

The model is estimated by maximum likelihood using the joint time series of:

- the market excess return,
- the momentum portfolio return.

The crucial identification comes from second moments and nonlinear co-movement, not from mean returns alone. That matters because turbulent states are rare and mean differences by themselves are too noisy to pin down the crash regime.

The estimated turbulent state has:

- lower conditional expected momentum return,
- more negative beta,
- stronger convexity to positive market moves,
- and higher residual variance.

### 6. Filter the ex ante turbulent-state probability

Once the parameters are estimated, the key output is the filtered probability

$$
Pr(S_t = T \mid \mathcal F_{t-1}),
$$

the probability that the hidden state is turbulent given information through the previous month.

This is the implementable state variable. Because the Markov states are persistent, a high filtered turbulent probability is informative about the coming month, not merely descriptive of the recent past.

### 7. Show that crash months cluster in high-probability turbulent states

The paper demonstrates that the worst momentum losses are heavily concentrated in months when the ex ante turbulent probability is high. In the simulated and empirical exercises, most crash months land in the top segment of the turbulent-probability distribution.

That is the core empirical validation of the HMM. It is not merely fitting skewness in sample; it is recovering a regime that forecasts the left tail.

### 8. Turn the state estimate into a timing rule

The timing overlay is simple:

1. hold the standard momentum portfolio when the turbulent probability is low;
2. reduce or eliminate exposure when the turbulent probability is high.

Because the state probability is estimated ex ante, this is an implementable monthly overlay. The paper shows that such a rule materially improves Sharpe ratio and alpha relative to static momentum.

### 9. What the paper actually proves

The paper proves a linked trio of claims:

1. momentum crashes are tied to the option-like behavior of the short loser leg after market declines;
2. the relevant crash regime is persistent enough to be summarized by a latent Markov state;
3. that state can be estimated in real time well enough to improve implementation.

That is much stronger than a post hoc narrative about a few famous rebound months.

## Domain of applicability

- **Where it works well:** Cross-sectional equity momentum, especially when the short book contains distressed losers whose rebound beta can spike after market declines.
- **What is implementable:** A hidden-state crash overlay on top of a standard WML momentum portfolio.
- **Main limitation:** The two-state HMM is deliberately parsimonious. It captures the dominant crash regime but not every possible nonlinear market state.
- **Why the paper matters:** It gives one of the cleanest joint stories of momentum crash mechanics and real-time timing.
