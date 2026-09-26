# The Earnings-Price Anomaly
**Authors:** Ray Ball
**Year:** 1992
**Journal/Venue:** Journal of Accounting and Economics

## Problem statement

This is a review paper about a specific class of anomalies: publicly available accounting information predicts future abnormal returns. Ball's objective is not to introduce a new strategy, but to clarify what exactly has to be explained when current earnings or financial statement ratios forecast future returns.

The paper argues that there are two distinct versions of the anomaly:

1. **post-earnings-announcement drift**, where the market underreacts to current earnings news;
2. **fundamental-analysis anomalies**, where accounting variables predict future earnings and, through that channel, future abnormal returns.

## Approach (short)

Ball reviews the anomaly through the lens of implementable trading rules and then evaluates possible explanations. The two workhorse designs are:

1. quarterly earnings-surprise sorts that generate drift after announcements;
2. the Ou-Penman LOGIT approach that predicts future annual EPS changes from financial statement variables and trades on the predicted probability.

He then asks whether the apparent abnormal returns can be explained by benchmark error, beta instability, size, bid-ask effects, transaction costs, taxes, or genuine underreaction.

## Approach (detailed)

### 1. Clarify what counts as an earnings-price anomaly

Ball defines the anomaly as the situation in which current accounting information about future earnings predicts future abnormal returns. In practice, that can happen in two ways:

- current earnings surprises predict a continuing return drift;
- accounting ratios predict future earnings, and therefore prices should move before those future earnings are announced, but do not move fully.

This distinction matters because the empirical design and the possible explanation differ across the two cases.

### 2. Treat post-earnings-announcement drift as a concrete trading rule

The first major evidence block is the Bernard-Thomas line of work. The representative implementation is:

1. sort firms each quarter into deciles by standardized earnings surprise;
2. go long the top-decile earnings performers;
3. go short the bottom-decile earnings performers;
4. measure abnormal returns after the announcement.

Ball emphasizes the empirical magnitudes documented in that literature:

- about `+4.19%` average abnormal return over the roughly 60 trading days after announcement for the long-short portfolio;
- continued drift out to roughly 180 days;
- and a particularly important pattern in which a meaningful part of the abnormal return recurs at the **next four quarterly earnings announcements**.

The last fact is central. The drift pattern follows the seasonal autocorrelation of quarterly earnings changes. That means the anomaly is not just sluggish reaction to one announcement. It is linked to the market not fully understanding the time-series behavior of earnings.

### 3. Show the implied forecasting model behind PEAD

Ball interprets Bernard and Thomas as showing that investors behave as if quarterly earnings follow a **seasonal random walk**, while the actual earnings process has more structure. The market underweights the implication of today's earnings surprise for the next several seasonal quarters.

So the implementable logic is:

$$
E[\Delta EPS_{t+4k}\mid \text{today's surprise}]
$$

is not fully capitalized at the announcement date. The abnormal return then reappears when the subsequent earnings announcements force the market to update again.

### 4. Treat the Ou-Penman anomaly as a prediction-and-trading system

The second major evidence block is Ou and Penman's annual-report strategy. The implementation Ball summarizes is:

1. take a large set of public financial statement variables;
2. estimate a LOGIT model predicting whether annual EPS will increase one year ahead;
3. compute the predicted probability `Pr` of an earnings increase;
4. rank firms on `Pr`;
5. form a zero-investment strategy that is long firms with high predicted probability and short firms with low predicted probability.

Ball notes that Ou and Penman choose the accounting variables for their ability to predict future earnings, not because of a strong structural theory for each variable. The method is therefore explicitly predictive:

$$
Pr(\Delta EPS_{t+1}>0 \mid X_t),
$$

where `X_t` is the vector of accounting variables.

The paper reports sizable out-of-sample abnormal returns from this strategy, over horizons extending beyond the one-year forecast window.

### 5. Use the anomaly evidence to separate two classes of explanation

Ball then structures the debate into two broad explanations.

**A. Market underreaction / information-processing frictions**

This is the straightforward behavioral or limited-processing interpretation:

- accounting information is public,
- but costly to process,
- so prices respond only gradually.

This explanation naturally fits both PEAD and the fundamental-analysis anomalies.

**B. Errors in estimating abnormal returns**

Ball takes this possibility seriously and reviews a long list of ways the apparent anomaly could be overstated:

- misspecified CAPM benchmarks,
- beta instability around earnings announcements,
- endogenous beta changes,
- size-related benchmark problems,
- bid-ask bounce and microstructure effects,
- transaction costs and taxes.

This methodological section is the point of the paper. One should not infer market inefficiency from a predictive return pattern until the abnormal-return measurement problem is under control.

### 6. Evaluate the benchmark-error story against the data

Ball's conclusion is not that benchmark error is irrelevant. It is that benchmark error does not plausibly explain the full magnitude or structure of the evidence.

In particular, benchmark problems do not naturally explain:

- the seasonal pattern of return drift across the next four earnings announcements;
- the consistency of the phenomenon across time;
- and the link from accounting variables to future earnings and then to future returns.

So the paper does not claim to close the debate, but it raises the bar for a pure risk-measurement explanation.

### 7. What a reader should implement

The review leaves behind two implementable designs.

**Quarterly PEAD**

1. compute standardized earnings surprises;
2. form announcement-quarter deciles;
3. long winners, short losers;
4. track returns over days `1-60`, `61-180`, and around the next four earnings announcements.

**Annual fundamental-analysis strategy**

1. estimate a LOGIT model for next-year EPS increases from accounting variables;
2. score firms by predicted probability;
3. long high-`Pr`, short low-`Pr`;
4. evaluate abnormal returns over one to three subsequent years.

The review's methodological message is that both designs should always be tested against:

- alternative abnormal-return benchmarks,
- time-varying beta concerns,
- size and liquidity effects,
- and realistic implementation frictions.

## Domain of applicability

- **Where it works well:** Any setting where accounting information is public and repeatedly released on a schedule.
- **What is implementable:** PEAD strategies and fundamental-analysis prediction models using financial statement data.
- **Main limitation:** The review is deliberately agnostic on a single definitive structural explanation; it is a map of the anomaly and its measurement problems, not a final model.
- **Why the paper matters:** It organizes earnings-based return predictability into a clear methodological framework and shows what must be explained before one can claim either inefficiency or rational pricing.
