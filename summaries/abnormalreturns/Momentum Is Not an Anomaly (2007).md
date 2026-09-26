# Momentum Is Not an Anomaly
**Authors:** Robert F. Dittmar, Gautam Kaul, Qin Lei
**Year:** 2007
**Journal/Venue:** Working paper

## Problem statement

The standard anomaly interpretation of momentum says that prices underreact or continue to overreact to firm-specific news, so the idiosyncratic component of stock returns exhibits positive serial dependence. This paper challenges that directly. It asks: **does momentum really come from continuation in firm-specific returns, or can it be explained entirely by cross-sectional differences in expected returns and systematic risks without invoking idiosyncratic mispricing?**

The paper's main methodological ambition is to answer that question without relying on a potentially misspecified expected-return model.

## Approach (short)

Instead of decomposing returns into "expected" and "unexpected" parts using an asset-pricing model, the paper derives predictions based on how momentum profits should change when stocks are grouped into **base portfolios** of increasing size. If momentum is driven by idiosyncratic continuation, profits should shrink roughly at rate `1/n` as `n` stocks are combined into each base portfolio because diversification washes out firm-specific serial dependence. If momentum is driven by cross-sectional differences in expected returns and systematic risks, profits should remain relatively stable. The evidence favors the second view.

## Approach (detailed)

### 1. Avoid model-based expected-return decompositions

The paper's starting point is that most anomaly arguments require a model of expected returns. One first estimates expected return, then labels the residual "idiosyncratic," and then asks whether that residual has continuation. But if the expected-return model is wrong, the residual interpretation is wrong too.

Dittmar, Kaul, and Lei therefore look for predictions that are invariant to the exact model of expected returns.

### 2. Start from the standard momentum-weighting formula

The usual momentum strategy ranks securities by ranking-period returns and goes long winners and short losers in the holding period. In the paper's notation the weight is built from each asset's deviation from the cross-sectional mean ranking-period return. That representation lets expected momentum profit be written as a sum of:

- terms involving cross-sectional differences in mean returns,
- terms involving cross-sectional differences in factor loadings,
- and terms involving serial covariance in firm-specific returns.

The whole argument then turns on how those terms behave when stocks are aggregated.

### 3. Form base portfolios of size `n`

The key design is to combine securities into **base portfolios** of size `n` and then run momentum on those portfolios rather than on individual stocks. The implementation is:

1. partition the stock universe into groups of `n` stocks;
2. compute the return on each base portfolio;
3. rank the base portfolios by past return;
4. apply the momentum strategy to the ranked portfolios;
5. vary `n` from 1 upward.

This turns the source-of-profit question into a scaling test.

### 4. Derive the anomaly benchmark: profits should shrink like `1/n`

If momentum truly comes from continuation in firm-specific return components, diversification kills it. Once `n` stocks are combined into one base portfolio:

- the own-product terms from each stock's idiosyncratic continuation are diluted;
- cross-stock idiosyncratic terms average out because they are orthogonal;
- expected momentum profits should fall roughly at the rate `1/n`.

This is the clean anomaly prediction. If the firm-specific continuation story is right, sizable base portfolios should rapidly destroy momentum.

### 5. Derive the rational benchmark: profits can stay stable

If momentum instead arises from cross-sectional differences in expected returns and risks, aggregation behaves very differently. In that case:

- as own-product terms are diluted,
- cross-products within base portfolios grow in importance,
- and when portfolios are formed by ranking on past returns, those cross-products preserve the information about high- versus low-mean-return securities.

So under the rational view, momentum profits need not fall much as `n` increases, especially when base portfolios are formed from adjacent ranked stocks.

This is the core theoretical insight of the paper.

### 6. Compare rank-formed and randomly formed base portfolios

The authors consider two distinct ways of constructing the base portfolios.

**Random grouping.** Stocks are assigned randomly to base portfolios. Under both the anomaly and rational views, momentum profits should then tend to fall with `1/n`, because the economically relevant cross-products are not preserved by the grouping.

**Rank-based grouping.** Stocks are first ordered by past performance and then adjacent names are combined. This is the crucial construction. If past return partly reflects cross-sectional differences in mean returns and risk, rank-based grouping preserves that structure.

The contrast between these two grouping procedures is the paper's main identification device.

### 7. Track own-products and cross-products explicitly

The paper does not stop at portfolio returns. It decomposes the mechanics into:

- weighted own-products of ranking-period and holding-period returns,
- weighted cross-products within base portfolios,
- unweighted cross-products,
- and their behavior as `n` grows.

This matters because the paper is not just saying "profits survive aggregation." It shows *which algebraic terms survive* and why that survival is consistent with cross-sectional expected-return dispersion rather than firm-specific continuation.

### 8. Examine both raw and scaled momentum profits

Because raw profits can shrink mechanically when returns are averaged into larger portfolios, the paper also studies scaled momentum profits. Those are useful for checking whether the source-of-profit interpretation changes once simple scale effects are normalized out.

The scaled results continue to reject the firm-specific continuation view. Momentum does not disappear at the rate the anomaly view predicts.

### 9. What the paper actually proves

The evidence supports two claims:

- the pattern of momentum profits across increasing base-portfolio size is inconsistent with idiosyncratic continuation as the main source of profits;
- the pattern is consistent with cross-sectional differences in expected returns and systematic risk.

The paper is careful here. It does not claim to identify the exact expected-return model. It claims that one need not invoke firm-specific momentum to explain the data.

## Domain of applicability

- **Where it works well:** Situations where an anomaly interpretation depends on a claim about idiosyncratic continuation that should wash out under diversification.
- **What is implementable:** The portfolio-size scaling test can be reused for other signals when different theories imply different behavior under aggregation.
- **Main limitation:** Showing consistency with cross-sectional expected-return differences is not the same as fully specifying what those differences are.
- **Why the paper matters:** It attacks the anomaly interpretation at its identification core rather than by debating which expected-return model is "right."
