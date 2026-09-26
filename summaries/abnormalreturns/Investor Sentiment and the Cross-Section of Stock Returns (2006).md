# Investor Sentiment and the Cross-Section of Stock Returns
**Authors:** Malcolm Baker, Jeffrey Wurgler
**Year:** 2006
**Journal/Venue:** Journal of Finance

## Problem statement

Baker and Wurgler ask a cross-sectional question about sentiment. If investor sentiment moves prices, it should not affect every stock equally. It should matter most for stocks whose values are especially subjective and difficult to arbitrage:

- small stocks,
- young firms,
- volatile stocks,
- unprofitable firms,
- non-dividend payers,
- extreme growth firms,
- distressed firms.

The paper's goal is therefore not to show merely that "sentiment predicts the market." It is to show that **sentiment conditions the relative returns of speculative versus staid stocks**.

## Approach (short)

The paper constructs a composite sentiment index from six annual proxies:

- closed-end fund discount,
- NYSE share turnover,
- IPO volume,
- IPO first-day returns,
- equity share in total new issues,
- dividend premium.

The authors extract a common component using principal components and also build an orthogonalized version after stripping out macroeconomic conditions. They then sort stocks into sentiment-sensitive and sentiment-insensitive groups and study how future returns differ conditional on beginning-of-period sentiment.

The headline finding is very sharp:

- when sentiment is **low**, speculative, hard-to-arbitrage stocks subsequently earn relatively **high** returns;
- when sentiment is **high**, those same stocks subsequently earn relatively **low** returns.

## Approach (detailed)

### 1. The economic prediction

The paper starts from two channels through which sentiment can affect the cross section.

1. **Sentiment-driven demand varies across securities.** Speculative investors may especially demand stocks with salient "lottery-like" or hard-to-value attributes.
2. **Arbitrage is uneven across securities.** Even if sentiment is generic, it will distort prices more where arbitrage is risky and expensive.

Both channels imply the same empirical prediction: cross-sectional return effects should be strongest among stocks that are difficult to value and difficult to short or hedge.

### 2. Construct sentiment proxies

No single clean sentiment series exists, so the authors collect six practical proxies.

- `CEFD`: closed-end fund discount.
- `TURN`: detrended log NYSE turnover.
- `NIPO`: number of IPOs.
- `RIPO`: average first-day IPO return.
- `S`: equity share in total external finance.
- `P^{D-ND}`: dividend premium, the relative valuation of dividend payers versus nonpayers.

Each proxy is intended to capture some aspect of speculative demand or issuance conditions. Some are lagged because their timing relative to underlying sentiment is believed to differ.

### 3. Extract the common sentiment component with principal components

The raw sentiment index is the first principal component of the appropriately timed proxies. The paper reports the resulting standardized index as

$$
SENTIMENT_t =
-0.241\,CEFD_t
+0.242\,TURN_{t-1}
+0.253\,NIPO_t
+0.257\,RIPO_{t-1}
+0.112\,S_t
-0.283\,P^{D-ND}_{t-1}.
$$

The first principal component explains roughly half of the sample variance across the proxies, which is strong enough to justify interpreting it as a common sentiment factor.

### 4. Orthogonalize sentiment to macro conditions

One potential objection is that the proxies might capture business-cycle conditions rather than sentiment. To address that, the authors regress each proxy on macro variables such as:

- industrial production growth,
- consumption growth,
- employment growth,
- recession indicators,

and then extract the first principal component from the residualized proxies. This yields the orthogonalized sentiment index `SENTIMENT^\perp`.

This is one of the paper's strongest design choices. It makes the later return predictability evidence much harder to dismiss as a disguised business-cycle effect.

### 5. Define sentiment-sensitive stock groups

The paper studies groups chosen ex ante because theory suggests their valuations are more subjective and harder to arbitrage:

- small versus large,
- young versus old,
- high versus low return volatility,
- unprofitable versus profitable,
- non-dividend payers versus payers,
- extreme growth versus middle-growth,
- distressed versus more typical firms.

The groups are formed with annual or monthly rebalancing depending on the characteristic, generally using NYSE breakpoints to keep the sort meanings stable through time.

### 6. Sort evidence conditional on sentiment

The core exercise is simple but powerful. Take a characteristic such as size or age, sort stocks into deciles, and then compare average future returns in periods following:

- positive sentiment,
- negative sentiment.

The results show large sign reversals in the cross section:

- when sentiment is low, small stocks outperform large stocks,
- when sentiment is high, small stocks underperform;
- when sentiment is low, very young stocks outperform old stocks,
- when sentiment is high, they underperform;
- analogous flips appear for high-volatility, unprofitable, non-dividend-paying, extreme-growth, and distressed stocks.

This conditional reversal is the paper's signature empirical result.

### 7. Regress long-short returns on lagged sentiment

The sorts are then formalized with predictive regressions. For a high-minus-low portfolio defined on characteristic `X`, the paper estimates equations of the form

$$
R^{X,High-Low}_t = c + d \, SENTIMENT_{t-1} + u_t,
$$

and variants including factor controls:

$$
R^{X,High-Low}_t = c + d \, SENTIMENT_{t-1} + \beta RMRF_t + sSMB_t + hHML_t + mUMD_t + u_t.
$$

The coefficient `d` measures whether the future spread between sentiment-sensitive and sentiment-insensitive stocks varies with prior sentiment.

The estimated `d` is generally of the predicted sign and remains meaningful even after factor controls.

### 8. Why the interpretation is hard to rationalize with standard risk stories

The authors emphasize that a purely risk-based interpretation would require something quite implausible: in low-sentiment states, older, more stable, profitable, dividend-paying firms would have to become systematically riskier than speculative stocks, and the relation would then reverse in high-sentiment states.

That is not impossible under the joint-hypothesis problem, but it is a strained reading. The paper therefore argues that sentiment combined with limited arbitrage is the more natural interpretation.

### 9. Extreme growth and distress

The paper also goes beyond simple one-dimensional groups and shows that sentiment especially affects firms at extreme ends of growth opportunities and distress. The logic is that both types are hard to value:

- extreme-growth firms have very uncertain distant cash flows,
- distressed firms have option-like, state-contingent payoffs.

These are exactly the cases where sentiment should matter most.

### 10. Why the paper mattered

The paper's importance comes from the combination of three ideas:

1. sentiment is measured with a broad composite index rather than with one ad hoc proxy;
2. the prediction is sharply cross-sectional, not merely market-timing;
3. the empirical patterns line up with ex ante theory about subjectivity of valuation and difficulty of arbitrage.

It therefore turned the sentiment literature from anecdotal bubble talk into a conditional cross-sectional asset-pricing framework.

## Domain of applicability

- **Where it works well:** Rotating between speculative and stable equity segments based on broad sentiment conditions rather than trying to time the entire market with a single sentiment variable.
- **What is implementable:** Construction of raw and macro-orthogonalized sentiment indices, sorting on sentiment-sensitive characteristics, and forecasting high-minus-low portfolio returns with lagged sentiment.
- **Main limitation:** Sentiment is measured at low frequency and the strategy is primarily a conditional cross-sectional overlay, not a high-frequency timing tool.
- **Why the paper matters:** It provided the canonical composite sentiment index and showed that sentiment has a systematic and theoretically structured effect on the cross section of stock returns.
