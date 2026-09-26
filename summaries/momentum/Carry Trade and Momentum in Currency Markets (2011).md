# Carry Trade and Momentum in Currency Markets
**Authors:** Craig Burnside, Martin Eichenbaum, Sergio Rebelo
**Year:** 2011
**Journal/Venue:** Annual Review of Financial Economics

## Problem statement

This is a review paper focused on currencies, but it is directly relevant because it treats currency momentum as a distinct speculative strategy. The question is: **how should one define carry and currency momentum strategies, what are their empirical payoffs, and do standard risk-based or rare-disaster explanations plausibly account for those payoffs?**

## Approach (short)

The paper first defines the payoff to an individual-currency carry trade and an individual-currency momentum trade against the U.S. dollar. It then studies:

- equally weighted carry portfolios,
- equally weighted momentum portfolios,
- and a 50/50 combination of the two,

over 20 major currencies from 1976 to 2010. The paper reviews three explanation classes:

- standard risk-factor pricing,
- rare-disaster / peso problems using options data,
- price-pressure explanations.

The authors conclude that conventional risk factors struggle to explain the profits and that the peso-disaster story fits carry better than it fits momentum.

## Approach (detailed)

### 1. Define the excess return to a currency position

Let `S_t` be the spot exchange rate in USD per foreign currency unit and let `i_t` and `i_t^*` be the domestic and foreign risk-free rates. The payoff to taking a long position in foreign currency is:

$$
z^L_{t+1}=(1+i_t^*)\frac{S_{t+1}}{S_t}-(1+i_t).
$$

This is the building block for both carry and momentum strategies.

### 2. Define the carry trade from interest-rate differentials

The carry trade is:

- long high-interest-rate currencies,
- short low-interest-rate currencies.

At the individual-currency level, the payoff is:

$$
z^C_{t+1}=\operatorname{sign}(i_t^*-i_t)\, z^L_{t+1}.
$$

The paper also shows the equivalent forward-contract representation, using the forward premium or discount relative to the USD:

$$
z^F_{t+1}=\operatorname{sign}(F_t-S_t)\,(F_t-S_{t+1}),
$$

so the implementation can be written either in spot-plus-borrowing language or directly as a forward-position payoff.

### 3. Define currency momentum as own-sign continuation

Currency momentum is defined as trading each currency according to the sign of its own previous-period payoff:

$$
z^M_{t+1}=\operatorname{sign}(z^L_t)\, z^L_{t+1}.
$$

The paper follows the literature in using the **previous month's return** as the momentum signal. This is an own-history sign rule, not a cross-sectional winner-minus-loser sort.

That distinction matters. In this survey, currency momentum is methodologically much closer to time-series momentum than to the Jegadeesh-Titman stock sort. A reader implementing the paper should therefore think in terms of per-currency directional signals rather than cross-currency ranking buckets.

### 4. Build equally weighted portfolios across currencies

The paper studies:

- the equally weighted carry portfolio,
- the equally weighted momentum portfolio,
- and a 50/50 combination.

The total bet size is normalized to one USD. The large gain from diversification is itself an important empirical result:

- individual-currency Sharpe ratios are meaningful,
- but portfolio Sharpe ratios are much higher because the strategies diversify across currencies.

### 5. Document the payoff properties

Over 1976-2010, both strategies earn high average excess returns. The review reports:

- mean returns,
- standard deviations,
- Sharpe ratios,
- skewness and kurtosis,
- correlation between carry and momentum.

This empirical section is not just descriptive. It frames the later explanation tests by showing that the profits are too large and too stable to be waved away as a small-sample curiosity.

### 6. Ask whether standard risk factors can explain the payoffs

The paper reviews factor-pricing tests using both:

- standard stochastic discount factor logic,
- and currency-specific factors designed to price carry portfolios.

The important methodological point is that a factor that prices carry does not automatically price momentum. The review argues that currency momentum remains hard to explain even when one uses more tailored currency risk factors.

### 7. Examine rare-disaster / peso-problem explanations

The paper then turns to options-based evidence. If carry and momentum profits compensate investors for rare disasters, option prices should help reveal the implied disaster state. The authors review hedged and unhedged strategy payoffs and ask:

- what disaster payoff would be required,
- whether that disaster resembles observed crisis episodes,
- and whether the same disaster can explain both carry and momentum.

Their conclusion is that the peso-problem interpretation is not equally persuasive for momentum. In particular, the episodes that hurt carry are not the same episodes that hurt momentum.

### 8. Consider price pressure as an alternative

The review ends with a price-pressure interpretation. The idea is that currency strategies may earn profits partly because temporary order-flow pressure moves prices away from fundamentals. This is presented as a promising but not fully settled alternative to standard risk stories.

### 9. What a reader should implement

The paper itself is a review, but the methodology it leaves behind is clear:

1. define currency carry and momentum at the single-currency level;
2. diversify them into equally weighted portfolios;
3. test them against both generic and currency-specific factor models;
4. use options to ask what disaster state would actually be required to rationalize the payoffs.

## Domain of applicability

- **Where it works well:** Currency strategies and cross-asset comparisons of carry and time-series momentum.
- **What is implementable:** Equally weighted currency carry and own-sign momentum portfolios versus the USD.
- **Main limitation:** As a review, it synthesizes and evaluates evidence rather than estimating one new model from scratch.
- **Why the paper matters:** It is one of the clearest methodological overviews of how carry and currency momentum should be defined and judged.
