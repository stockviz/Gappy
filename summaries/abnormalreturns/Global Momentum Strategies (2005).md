# Global Momentum Strategies
**Authors:** John M. Griffin, Xiuqing Ji, J. Spencer Martin
**Year:** 2005
**Journal/Venue:** Journal of Portfolio Management

## Problem statement

Momentum is well documented country by country, but investors do not trade countries in isolation. This paper asks three connected questions: **how large are price and earnings momentum profits around the world, how correlated are those strategies across markets, and can global combinations of them deliver diversification and implementation advantages over country-specific momentum trades?**

The paper is not just another international replication. Its methodological contribution is to move from "does momentum exist in country `j`?" to "how should a global investor combine momentum signals across countries and across signal types?"

## Approach (short)

Using Datastream international equities and CRSP for the United States, the authors build country-level **price momentum** and **earnings momentum** strategies across roughly 40 markets. Price momentum follows the classic `6/6` design with a one-month skip:

1. rank on the previous 6 months,
2. skip one month,
3. hold winners minus losers for 6 months,
4. use top and bottom 20% portfolios,
5. maintain six overlapping vintages.

Earnings momentum uses six-month changes in the consensus one-year earnings forecast scaled by price. The paper studies profits by country and region, correlations across strategies, state dependence, and the performance of global portfolios that combine country strategies and combine price with earnings momentum.

## Approach (detailed)

### 1. Build a broad international stock universe

The sample uses CRSP for U.S. stocks and Datastream for non-U.S. equities, covering 39 non-U.S. countries plus the United States. Coverage for price momentum is available for most countries by the mid-1990s, while earnings-momentum coverage starts later because it requires analyst forecast data.

The paper is careful about data quality and cleans extreme monthly returns and repeated stale values. This matters because international equity data can otherwise generate spurious continuation from recording problems.

### 2. Define price momentum in the standard way

For price momentum, the paper follows the same design as Griffin, Ji, and Martin (2003):

1. use a **6-month ranking period**,
2. use a **6-month holding period**,
3. **skip one month** between ranking and holding to reduce microstructure contamination,
4. sort stocks into the top and bottom **20%** rather than deciles because some countries are too small for finer partitions,
5. rebalance monthly so that **six overlapping vintages** are active at any time.

Returns are annualized after computing the monthly strategy payoffs.

This is important because the paper wants comparability across countries and across its own earlier international momentum work.

### 3. Define earnings momentum separately from price momentum

The earnings-momentum signal is not based on realized returns. Over a six-month formation window, the authors compute the change in the **consensus one-year earnings forecast**, scaled by the stock price at the end of the window:

- positive large revision = earnings winner,
- negative large revision = earnings loser.

Stocks are then ranked on this scaled revision measure and held for the next six months. The same top/bottom 20% structure is used.

That scaling by price matters because it turns forecast revisions into something comparable across stocks and markets.

### 4. Compare price and earnings momentum across countries and regions

The first set of tests tabulates winner-minus-loser profits:

- country by country,
- region by region,
- for both price momentum and earnings momentum.

The paper finds broad positive price momentum outside Asia and substantial earnings momentum in many markets as well. Regional time series are built as equal-weighted averages of the country strategies inside each region.

This design lets the reader see not just whether momentum exists internationally, but where it is strong, weak, or unstable.

### 5. Ask whether price and earnings momentum are the same signal

The next methodological step is a cross-classification:

1. sort on earnings momentum,
2. examine price momentum inside low, medium, and high earnings-momentum groups;
3. then reverse the exercise and test earnings momentum inside price-momentum groups.

If the two signals were the same phenomenon under different labels, one should eliminate the other. That is not what the paper finds. Price momentum remains profitable inside earnings-momentum groups, and earnings momentum remains profitable inside price-momentum groups.

That is the core result of the interaction tests: the two signals are related, but not redundant.

### 6. Constrain one signal to avoid mechanical overlap with the other

To make the independence test tougher, the authors also construct **constrained earnings-momentum strategies** that exclude stocks already in the extreme price-momentum bins. The point is to avoid a trivial result driven by the same securities appearing on both sides of the two sorts.

Even with this restriction, earnings momentum remains informative. That strengthens the conclusion that global investors should not collapse both signals into one generic "momentum" factor.

### 7. Measure correlations, especially in bad times

The paper then studies the correlations:

- across country price-momentum strategies,
- across country earnings-momentum strategies,
- between momentum strategies and local market returns,
- and conditional on down-market states.

A key empirical result is that momentum-strategy correlations across countries are much lower than market-index correlations. In down markets, market correlations rise sharply, but momentum-strategy correlations rise much less.

This is the main diversification result: global momentum diversifies better than the underlying equity indices.

### 8. Examine state dependence using market returns and GDP growth

The strategy returns are also conditioned on:

- positive versus negative market-return states,
- positive versus negative GDP-growth states.

Price and earnings momentum are both generally positive in a variety of states, though their magnitudes vary. The point is less to produce a formal macro model and more to show how global momentum behaves when markets and economies are stressed.

### 9. Construct global momentum portfolios explicitly

The paper then moves from diagnostics to implementation. It studies:

- **global price momentum** portfolios that combine country price-momentum strategies,
- **global earnings momentum** portfolios,
- and combined **price-plus-earnings** momentum portfolios.

The global strategies are typically equal-weighted across countries or regions. Because country strategy correlations are relatively low, especially compared with equity-market correlations, the globally diversified momentum portfolios are less volatile than a U.S.-only or region-only implementation.

This is the paper's most practical contribution. It turns international evidence into an actual asset-allocation recommendation.

### 10. What the paper actually proves

Methodologically, the paper establishes four points:

1. price momentum and earnings momentum can both be built consistently across countries;
2. they are related but not redundant;
3. country-level momentum strategies comove much less than the underlying stock markets;
4. global combinations of momentum signals therefore offer both higher breadth and better diversification.

That is why the paper is best read as a **portfolio-construction** paper rather than only as another anomaly paper.

## Domain of applicability

- **Where it works well:** Global equity universes with enough country breadth and analyst-forecast coverage to build both price and earnings momentum.
- **What is implementable:** A global momentum program using country-level `6/6` price momentum, six-month earnings revision momentum, and combinations of the two.
- **Main limitation:** Earnings momentum is constrained by analyst-data availability and is naturally less comparable across markets than pure price momentum.
- **Why the paper matters:** It shows how to move from isolated country evidence to a genuinely global momentum allocation framework.
