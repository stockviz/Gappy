# Returns to Buying Winners and Selling Losers: Implications for Stock Market Efficiency
**Authors:** Narasimhan Jegadeesh, Sheridan Titman
**Year:** 1993
**Journal/Venue:** Journal of Finance

## Problem statement

This is the canonical momentum paper. Its question is simple and foundational: **do stocks that performed well over the past several months continue to outperform, and do past losers continue to underperform, strongly enough to generate a profitable zero-cost strategy after reasonable portfolio-formation controls?**

The paper matters because it turns a vague impression of continuation into a precise family of implementable trading rules.

## Approach (short)

The paper studies NYSE/AMEX stocks over 1965-1989 and evaluates a grid of `J/K` momentum strategies:

- formation periods `J = 3, 6, 9, 12` months,
- holding periods `K = 3, 6, 9, 12` months.

At each formation date, stocks are ranked on their cumulative return over the prior `J` months, assigned to deciles, and the strategy buys the winner decile and shorts the loser decile. A short gap is inserted between ranking and holding to reduce microstructure contamination, and overlapping portfolios are used so the strategy has one return observation each month. The main result is that intermediate-horizon winner-minus-loser strategies earn about 1 percent per month over the first post-formation year.

## Approach (detailed)

### 1. Define a family of strategies, not one backtest

The paper's design is unusually systematic. Instead of choosing a single lookback and a single holding horizon, it evaluates a whole matrix of strategies:

- `J` months of ranking information,
- `K` months of holding.

The standard values are `J, K in {3, 6, 9, 12}`.

This matters because the paper is trying to identify the **horizon structure** of continuation, not merely to report one profitable trading rule.

### 2. Construct winner and loser portfolios from deciles

At each formation date:

1. compute each stock's cumulative return over the past `J` months;
2. rank stocks by that past return;
3. place them into deciles;
4. define the top decile as winners and the bottom decile as losers;
5. buy winners and short losers.

The paper examines both equal- and value-weighted implementations in various tables, but the decile winner-minus-loser structure is the core object.

### 3. Insert a gap between ranking and holding

The authors leave a short gap between the end of the ranking period and the start of the holding period. The purpose is to attenuate:

- bid-ask bounce,
- very short-term reversal,
- microstructure effects that can masquerade as continuation or contrarian profits.

This is one of the methodological choices that made the strategy credible rather than a pure data artifact.

### 4. Use overlapping portfolios so returns are observed monthly

If the holding period is longer than one month, the paper still reports a monthly strategy return by averaging across all active vintages. So a `6/6` strategy has six overlapping portfolios at any time, each initiated in a different month.

This overlapping-portfolio design is what later momentum papers also adopt. It makes different `J/K` strategies comparable and avoids sparse, nonmonthly return series.

### 5. Test the entire `J/K` grid to map the term structure

The paper then computes average monthly profits for each `J/K` pair. The main pattern is robust:

- past winners continue to outperform,
- past losers continue to underperform,
- the winner-minus-loser spread is economically large for intermediate horizons.

The best-known finding is the roughly 1 percent per month profit for strategies based on past 3- to 12-month returns and held for 3 to 12 months.

### 6. Separate the source of the spread

The paper does not treat WML as a black box. It looks at the long and short sides separately to show that:

- winners keep earning above-average returns,
- losers keep earning below-average returns.

That matters because a strategy driven only by the short side would invite a different interpretation than one driven by both sides. The paper's evidence is that continuation exists in both directions.

### 7. Track returns after the initial holding period

The paper also studies the path of returns after the main holding window. This is methodologically important because it distinguishes:

- temporary continuation,
- delayed overreaction,
- and longer-run mean reversion.

The pattern is continuation over the first post-formation year followed by later weakening and eventual reversal at longer horizons. That dynamic shape becomes central to later interpretations of momentum.

### 8. Use the results to frame an efficiency question

The title's reference to market efficiency is deliberate. The strategy is too simple to dismiss easily:

- rank on past returns,
- buy winners,
- short losers,
- rebalance mechanically.

So the methodology is not only portfolio construction; it is an empirical challenge to the view that past price information should be useless once obvious microstructure distortions are removed.

### 9. What a reader should implement

A faithful implementation of the paper is:

1. choose `J` and `K` in `{3, 6, 9, 12}`;
2. compute cumulative `J`-month returns;
3. sort eligible stocks into deciles;
4. buy the top decile and short the bottom decile;
5. insert the short skip between ranking and holding;
6. maintain `K` overlapping vintages and average their month-`t` payoffs.

That is the design that later momentum literature either adopts directly or modifies explicitly.

## Domain of applicability

- **Where it works well:** Large equity universes with enough names for stable decile sorts and reasonably low implementation frictions.
- **What is implementable:** The classic `J/K` cross-sectional winner-minus-loser momentum strategy with overlapping portfolios.
- **Main limitation:** The paper identifies the anomaly, but it does not by itself settle whether the source is underreaction, risk, lead-lag effects, or some other mechanism.
- **Why the paper matters:** It is the paper that turned momentum into a standardized, reproducible empirical object.
