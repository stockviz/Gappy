# Price Reversals in Global Equity Markets
**Authors:** Bernd Scherer
**Year:** 2015
**Journal/Venue:** Capital IQ / practitioner research note

## Problem statement

The paper studies whether medium-horizon reversal effects are present across global equity markets and whether they can be implemented in a portfolio-construction framework. The question is not only whether reversals exist, but whether they survive realistic cross-country portfolio formation.

## Approach (short)

The note builds global cross-sectional reversal portfolios by ranking stocks on prior underperformance or outperformance and then taking the opposite side:

- buy prior losers,
- sell prior winners,

with the implementation done across international equity universes rather than within a single national market. The analysis emphasizes portfolio spreads, diversification, and practical construction rather than a formal equilibrium model.

## Approach (detailed)

### 1. Treat reversal as a cross-sectional ranking signal

The basic signal is the standard contrarian one:

$$
ReversalSignal_i = -PastReturn_i,
$$

usually measured over a medium horizon long enough to avoid one-month bid-ask bounce, but short enough that long-run deep-value reversion is not the only mechanism at work.

The paper's objective is to test the signal globally rather than only in U.S. equities.

### 2. Rank internationally and form long-short portfolios

The implementable design is:

1. define the global stock universe;
2. compute prior-horizon returns for each stock;
3. rank stocks from worst to best performers;
4. form a long portfolio of prior losers and a short portfolio of prior winners;
5. aggregate across countries to assess whether the effect is diversified rather than country-specific.

This matters because an international reversal strategy can, in principle, harvest the anomaly while diversifying away a large amount of country-specific noise.

### 3. Study the payoff shape rather than only the mean spread

As a practitioner note, the paper's real contribution is portfolio interpretation:

- reversal tends to do best after crowded trends have gone too far;
- it can be painful during persistent momentum episodes;
- and it benefits from broad cross-sectional breadth across markets.

So the paper treats reversal as one sleeve in a diversified anomaly portfolio rather than a standalone equilibrium statement.

### 4. What a reader should implement

1. a broad global stock universe;
2. a lagged-return reversal rank;
3. country- and sector-aware portfolio construction;
4. long-short loser-minus-winner implementation with diversification controls.

## Domain of applicability

- **Where it works well:** Broad global stock universes where reversal can be diversified across countries.
- **What is implementable:** International contrarian long-short portfolios.
- **Main limitation:** The note is practitioner-oriented and lighter on formal econometrics than the academic reversal papers.
- **Why the paper matters:** It reframes reversal as a global portfolio-construction tool rather than a U.S.-only anomaly.
