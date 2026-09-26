# Contrarian Investment, Extrapolation, and Risk
**Authors:** Josef Lakonishok, Andrei Shleifer, Robert W. Vishny
**Year:** 1994
**Journal/Venue:** Journal of Finance

## Problem statement

Value strategies buy stocks with low prices relative to fundamentals; glamour strategies buy stocks with high past growth and high valuations. Lakonishok, Shleifer, and Vishny ask whether value wins because it is riskier or because investors systematically extrapolate past growth too far and overpay for glamour.

## Approach (short)

The paper forms annual equal-weighted portfolios using both valuation multiples and growth histories:

- value proxies: high `B/M`, high `C/P`, high `E/P`;
- glamour proxies: low valuation multiples and high past sales growth.

Portfolios are formed each April and held for up to five years. The paper compares future returns, size-adjusted returns, and fundamental performance to see whether value's outperformance comes from risk or from expectation errors.

## Approach (detailed)

### 1. Define value and glamour using both price ratios and growth

LSV insist that glamour has two ingredients:

- strong past growth,
- high expected future growth embedded in price.

They proxy expected growth with low profitability-to-price ratios such as:

- book-to-market,
- cash-flow-to-price,
- earnings-to-price,

and they proxy past growth primarily with sales growth.

So glamour means:

- low `B/M`, low `C/P`, or low `E/P`,
- plus high past growth in sales.

Value is the opposite configuration.

### 2. Use annual formation dates chosen for data availability

Portfolios are formed every April starting in 1968. April is deliberate: it makes prior fiscal-year accounting data available at formation. The sample covers NYSE and AMEX firms with CRSP and Compustat data.

Within each portfolio:

- stocks are equally weighted,
- buy-and-hold returns are tracked for Years `+1` through `+5`.

This long holding horizon is central because the paper is testing slow mean reversion in expectations, not a one-month reaction pattern.

### 3. Start with one-variable value strategies

The simplest tests sort stocks on one variable at a time:

- `B/M`,
- `C/P`,
- `E/P`,
- past sales growth.

The strategy is always contrarian:

- buy the cheap, low-expectation, low-past-growth side;
- sell or underweight the expensive, high-expectation, high-past-growth side.

The paper shows these one-variable value strategies earn higher future returns and higher size-adjusted returns.

### 4. Build the two-dimensional glamour-versus-value classification

The stronger design combines:

- past growth,
- and expected growth implied by valuation.

The paper argues that the most overvalued stocks are those with both:

- high past sales growth,
- and expensive current multiples.

Hence the sharpest contrarian strategy is:

1. identify high-past-growth/high-expectation glamour stocks;
2. identify low-past-growth/low-expectation value stocks;
3. compare their long-run subsequent returns.

This is the paper's core test of the extrapolation story.

### 5. Compare returns over multiple post-formation years

Returns are tracked for `+1` to `+5` years after formation. This horizon matters because the mechanism is gradual disappointment:

- glamour stocks are priced for unrealistically strong growth,
- value stocks are priced for persistent weakness,
- realized fundamentals disappoint the former and exceed the very low expectations for the latter.

The paper repeatedly shows that value continues to dominate over these multi-year windows.

### 6. Check whether value is just riskier

The risk-based alternative would predict that value firms should show systematically worse states of nature or worse realized fundamentals commensurate with their higher returns. The paper argues the evidence goes the other way:

- value stocks are not obviously worse on standard risk metrics,
- their future earnings and sales do not justify the degree of discount,
- and the return premium is too closely tied to expectation reversal.

So the behavioral content is not hand-wavy. It is an expectations test.

### 7. The implementable logic

A reader can reproduce the paper by:

1. collecting April formation-date accounting and price data;
2. computing `B/M`, `C/P`, `E/P`, and past sales-growth ranks;
3. forming equal-weighted deciles or extreme groups on each measure;
4. defining glamour as expensive plus high past growth and value as cheap plus low past growth;
5. holding for `1` to `5` years and comparing both raw and size-adjusted returns.

The method is deliberately simple because the paper's claim is that the premium survives without optimization tricks.

## Domain of applicability

- **Where it works well:** Long-horizon value investing and any research on expectation extrapolation.
- **What is implementable:** Annual rebalancing into cheap/expensive portfolios using fundamental-price ratios and past sales growth.
- **Main limitation:** The holding horizon is long, so implementation can be slow and capital-intensive.
- **Why the paper matters:** It is the classic statement that value works because the market extrapolates glamour too far, not because value is obviously more dangerous.
