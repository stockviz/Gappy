# PE Ratios, Earnings Expectations, and Abnormal Returns
**Authors:** April Klein, James Rosenfeld
**Year:** 1991
**Journal/Venue:** Journal of Financial Research

## Problem statement

The classic low-`PE` effect says cheap stocks outperform. Klein and Rosenfeld ask whether that effect is homogeneous across all low-`PE` stocks or whether it is concentrated in the subset with *low expected earnings* as measured by analysts. In other words: is the anomaly really about price-to-earnings alone, or about price-to-earnings plus investor expectations?

## Approach (short)

The paper combines CRSP returns with IBES analyst forecasts. Each December it forms quartile portfolios on:

- `PE` = price on December 16 divided by prior fiscal-year EPS,
- `EEPS` = median analyst forecast of current-year EPS.

It then studies market-model-adjusted monthly abnormal returns from the following January to November, both for `PE` portfolios, `EEPS` portfolios, and the `4 x 4` intersections of the two.

## Approach (detailed)

### 1. Build a sample where expectations are observable

The sample consists of stocks followed by major brokerage analysts with at least three annual earnings estimates in the IBES database, matched to CRSP returns. The design deliberately restricts to names where a market expectation of earnings is directly observable.

### 2. Form the `PE` portfolios exactly

In the first set of tests, stocks are ranked into quartiles based on:

$$
PE = \frac{\text{Price on December 16}}{\text{reported EPS for the previous fiscal year}}.
$$

The first portfolio is the lowest `PE` quartile. After formation on December 16, the paper computes market-model-adjusted monthly abnormal returns from January through November of the following year and then cumulative abnormal returns (`CARs`) over subperiods such as January-March and January-November.

### 3. Form the expectations portfolios separately

The second design ranks stocks by `EEPS`, the median analyst forecast for current fiscal-year earnings. Again, the paper forms quartiles and computes abnormal returns over the same following-year window.

This is important because the authors want to separate:

- stocks that are statistically cheap,
- from stocks that the market explicitly expects to have weak earnings.

### 4. Interact valuation and expectations

The core test is the intersection sort. Stocks are grouped into the `4 x 4` cross of:

- `PE` quartile,
- `EEPS` quartile.

This asks whether low `PE` stocks earn abnormal returns uniformly or whether the effect is strongest for stocks that are both:

- low `PE`,
- low expected earnings.

That is what the paper finds.

### 5. Measure the timing of the abnormal return

The monthly abnormal-return profile matters. The strongest gains show up in January. For the low-`PE` / low-`EEPS` group, the paper reports especially large January abnormal returns, larger than for low-`PE` stocks considered alone.

The authors then run a parallel experiment with September 16 as the formation date and study October returns. This produces an October effect in the same group, which they interpret as linked to downward revisions in analysts' annual earnings forecasts between September 16 and November 16.

### 6. Use the market model as the adjustment benchmark

The returns are not raw. The paper computes market-model-adjusted abnormal returns, so the excess performance is intended to be orthogonal to simple market exposure.

The method is:

1. estimate the market model for each stock;
2. compute monthly abnormal return in the event month;
3. average across stocks in the portfolio;
4. cumulate across months to get `CAR`.

That makes the paper an event-timing and expectations paper, not just a characteristic-sort paper.

### 7. What a reader should implement

To reproduce the paper:

1. collect CRSP monthly returns and December 16 prices;
2. merge with IBES median annual EPS forecasts;
3. form quartiles on lagged `PE` and `EEPS`;
4. compute market-model-adjusted abnormal returns for January-November;
5. repeat with September 16 formation to study the October channel;
6. compare single sorts with the `PE x EEPS` intersections.

The operative signal is the interaction: low `PE` is most powerful when the stock is also one the market expects little from.

## Domain of applicability

- **Where it works well:** Equity anomalies where analyst expectations can be merged with valuation ratios.
- **What is implementable:** Seasonal/event studies of low-`PE` portfolios conditioned on analyst earnings expectations.
- **Main limitation:** The sample is restricted to analyst-followed names, so it is not a universal cross section.
- **Why the paper matters:** It shows that the low-`PE` effect is sharper when valuation is combined with an explicit expectations measure.
