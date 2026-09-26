# Tail Risk in Momentum Strategy Returns
**Authors:** Kent Daniel, Ravi Jagannathan, Soohun Kim
**Year:** 2012
**Journal/Venue:** Working paper

## Problem statement

Momentum has historically generated high average returns with little unconditional systematic risk, yet it also experiences extremely severe losses. Those losses are too frequent and too clustered to be dismissed as Gaussian bad luck. This paper asks: **can the tail risk in momentum returns be captured by a simple latent-state model, and can that model identify the bad states well enough to improve implementation?**

This is an early version of the later HMM momentum-crash work, but it already contains the full core idea: momentum risk is primarily a regime problem.

## Approach (short)

The paper estimates a two-state hidden Markov model in which the market alternates between:

- a calm state,
- a turbulent state.

The joint distribution of market and momentum returns differs across these states, especially in volatility and market sensitivity. The ex-ante probability of the turbulent state is high in essentially all of the severe momentum crash months. A strategy that moves to the risk-free asset when the turbulent-state probability is high materially improves the momentum strategy's Sharpe ratio.

## Approach (detailed)

### 1. Begin with the actual tail event frequency

In the 1929-2010 sample the standard `12-2` momentum portfolio suffers 13 monthly losses greater than 20%. That frequency is far too high for a stationary Gaussian view of momentum returns. So the paper takes the left tail as structural evidence that the strategy is switching between distinct regimes.

### 2. Define the momentum portfolio and its nonlinear market exposure

The baseline portfolio is the standard decile `WML` strategy:

1. rank stocks by cumulative return from `t-12` through `t-2`,
2. go long the winner decile,
3. short the loser decile.

The paper then studies market sensitivity using augmented market-model specifications in which momentum's beta can differ:

- across calm and turbulent states,
- and between up and down markets.

This is the precursor to the later written-call interpretation of the loser leg.

### 3. Introduce the two-state hidden Markov model

Let the unobserved state `S_t` be either:

- calm (`C`),
- turbulent (`T`).

`S_t` follows a first-order Markov chain with persistent transition probabilities. Conditional on `S_t`, the joint distribution of market and momentum returns has different:

- means,
- variances,
- covariances,
- and effective market betas.

The point of the HMM is not just to fit volatility clustering. It is to let the **entire joint return environment** change when the market enters the crash-prone regime.

### 4. Estimate the state mainly through second moments

Because crash months are rare, the paper does not try to identify turbulent states from means alone. Instead it uses the way market and momentum returns co-move:

- higher volatility,
- more adverse covariance with the market,
- more negative skewness in the momentum portfolio.

This is a practical identification choice. Second moments are much more informative than first moments about the regime before the actual crash has happened.

### 5. Show the hidden state corresponds to crash-prone rebound conditions

In the turbulent state:

- momentum has much worse market exposure,
- the up-market beta becomes especially adverse,
- and the distribution of returns becomes far more negatively skewed.

This is economically consistent with the idea that after deep market declines the loser leg behaves like a distressed, highly levered call option on firm value. The momentum portfolio, which is short that loser leg, is therefore extremely vulnerable to a rebound.

### 6. Filter the ex ante turbulent-state probability

The implementable output of the model is the filtered probability

$$
Pr(S_t = T \mid \mathcal F_{t-1}),
$$

the probability that the coming month is turbulent based only on information available through the prior month.

This is the risk signal. Because the states are persistent, high turbulent probability is informative about future crash risk rather than just retrospective classification.

### 7. Validate the signal on the worst months

The paper's strongest empirical result is that essentially all of the severe momentum crash months occur when the ex ante turbulent-state probability is high. In the large-loss months, the model typically assigns turbulent-state probabilities above roughly 70%.

That means the HMM is not merely fitting average volatility. It is selectively locating the actual months investors care about.

### 8. Compare against simpler volatility timing

The paper contrasts the HMM with simpler approaches such as volatility-based timing or GARCH-style classification. The HMM performs better because it is more selective:

- it classifies fewer months as dangerous,
- while still capturing most of the severe tail events.

That selectivity is essential. A crash model that exits too often destroys the mean return of the strategy.

### 9. Turn the state estimate into a timing rule

The trading overlay is:

1. estimate the HMM recursively;
2. compute the ex ante turbulent probability;
3. move to the risk-free asset, or sharply cut exposure, when that probability exceeds a threshold;
4. otherwise hold the standard momentum strategy.

This rule improves Sharpe ratio materially because it gives up exposure mainly when the conditional expected payoff is poor and the left tail is acute.

## Domain of applicability

- **Where it works well:** Cross-sectional momentum strategies with infrequent but severe crash losses.
- **What is implementable:** A hidden-state overlay that exits or scales down momentum when the estimated turbulent-state probability is high.
- **Main limitation:** The two-state model is intentionally parsimonious and cannot capture every nuance of changing market regimes.
- **Why the paper matters:** It is one of the clearest early demonstrations that the main risk in momentum is not average beta but latent crash-state exposure.
