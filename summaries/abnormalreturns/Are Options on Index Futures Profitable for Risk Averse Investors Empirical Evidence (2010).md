# Are Options on Index Futures Profitable for Risk Averse Investors? Empirical Evidence
**Authors:** George M. Constantinides, Michal Czerwonko, Jens Carsten Jackwerth, Stylianos Perrakis
**Year:** 2010
**Journal/Venue:** Journal of Finance

## Problem statement

Many papers show that some index options look expensive or cheap relative to models. Constantinides, Czerwonko, Jackwerth, and Perrakis ask a sharper question: can one identify option mispricing in a way that is robust to investor preferences and then show that trading on those violations improves the portfolio of any risk-averse investor?

## Approach (short)

The paper uses stochastic-dominance bounds from Constantinides-Perrakis (2007) to identify American options on S&P 500 futures that are "good sells" or "good buys." It then tests, fully out of sample, whether writing options whose market prices violate the upper bound improves the return distribution of an investor who holds the index and cash.

## Approach (detailed)

### 1. Treat the bound as a signal, not as the final proof

The paper first computes upper and lower reservation-price bounds for American calls and puts on index futures. A bid price above the call upper bound identifies a potential "good sell" call. But the paper does **not** stop there. The true claim is established in a second stage by out-of-sample stochastic-dominance tests on realized portfolio returns.

### 2. Define the option trader and index trader portfolios

There are two benchmark investors:

- `IT`: an index trader who holds only the market index and the risk-free asset;
- `OT`: an otherwise identical investor who also writes or buys the option when a bound violation occurs.

The option writer's initial wealth changes by the option premium, and the portfolio is then dynamically rebalanced in the underlying index and cash.

### 3. Use preference-robust option bounds

The relevant object is the reservation write price. If the observed call bid exceeds that reservation price, then any risk-averse investor can improve expected utility by writing the call. The paper emphasizes that the upper bound is:

- independent of a specific utility function,
- independent of the investor's initial endowment,
- derived under minimal restrictions on the return distribution.

Without transaction costs, the call upper bound takes the familiar max form involving intrinsic value and the continuation bound; with transaction costs it is adjusted multiplicatively. The exact closed form is less important than the implementation rule:

1. estimate the state-price-relevant return tree from information available at time `t`;
2. compute the bound at time `t`;
3. trade only if the market price violates it.

### 4. Calibrate the return tree only with time-`t` information

The paper uses daily S&P 500 index returns and a calibrated tree for the daily return distribution. Bounds are computed recursively backward through that tree. This is important because the test is genuinely out of sample:

- no future information enters the signal,
- the bound is estimated with contemporaneously available data only.

### 5. Rebalance the underlying portfolio with transaction costs

The investor is not assumed to frictionlessly delta hedge every instant. Instead, with proportional transaction costs, the optimal policy is a no-trade-region rule: trade only when the ratio of stock to bond holdings exits lower and upper boundaries. The paper derives those boundaries from a CRRA optimization and then applies the same type of policy to both the option trader and the pure index trader.

### 6. Evaluate by second-order stochastic dominance

The decisive comparison is not mean return, alpha, or Sharpe. The paper tests whether the realized out-of-sample returns of the option trader's portfolio second-order stochastically dominate those of the benchmark index trader:

- if yes, every risk-averse investor prefers the option-trading policy;
- if no, the bound violation was only a loose statistical curiosity.

The paper uses formal stochastic-dominance tests on the realized return distributions.

### 7. Focus on the call upper bound because that is where the power is

Empirically:

- call bid prices frequently violate the upper bound,
- put upper-bound and lower-bound violations are much rarer.

So the economically relevant strategy is:

1. identify calls whose bid exceeds the upper bound;
2. write those calls;
3. rebalance the index-cash portfolio under the prescribed no-trade rule.

The paper finds that these "good sell" call strategies improve expected utility net of bid-ask spreads and costs.

## Domain of applicability

- **Where it works well:** Index options on liquid underlyings where one can estimate return distributions and implement disciplined option-writing rules.
- **What is implementable:** Compute stochastic-dominance option bounds, trade only on violations, and evaluate the resulting portfolio by dominance rather than mean-variance alone.
- **Main limitation:** The method is demanding because it requires option-by-option bound computation and realistic treatment of trading frictions.
- **Why the paper matters:** It turns option mispricing into a preference-robust portfolio-improvement test.
