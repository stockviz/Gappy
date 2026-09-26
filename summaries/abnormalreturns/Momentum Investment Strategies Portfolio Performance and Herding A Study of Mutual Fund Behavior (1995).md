# Momentum Investment Strategies, Portfolio Performance, and Herding: A Study of Mutual Fund Behavior
**Authors:** Mark Grinblatt, Sheridan Titman, Russ Wermers
**Year:** 1995
**Journal/Venue:** American Economic Review

## Problem statement

Momentum is often discussed as a property of prices, but that leaves open a more basic question: **who is actually trading in a momentum-like way, and does that behavior reflect skill or blind crowding?**

This paper addresses that by moving from return sorts to holdings data. The object of study is not winner-minus-loser portfolio performance directly, but the actual trading behavior of mutual funds.

## Approach (short)

Using a large panel of actively managed U.S. equity mutual funds over 1975-1984, observed through quarterly portfolio holdings and returns, the paper measures whether funds systematically buy stocks that have recently performed well and whether many funds buy the same stocks simultaneously. It then relates those trading patterns to subsequent fund performance.

The core result is asymmetric: most funds buy recent winners, few systematically dump recent losers, stronger momentum-oriented funds perform better, and the evidence for pure herding is much weaker than the evidence for momentum trading itself.

## Approach (detailed)

### 1. Work from holdings rather than inferred factor loadings

The methodological advantage of the paper is immediate. Instead of inferring "momentum exposure" from fund returns, the authors use quarterly holdings to observe how positions actually change from one quarter to the next.

That allows them to ask:

- which stocks a fund actively increased,
- which stocks it reduced,
- and what those stocks had done before the trade.

This is much cleaner than regressing fund returns on a momentum factor because it isolates trading direction.

### 2. Infer active trades from changes in portfolio weights

The key construction is to distinguish **active** changes in holdings from changes caused mechanically by price movements. A stock's weight can rise even if the manager did nothing, simply because the stock itself went up. So the implementable procedure is:

1. take the fund's portfolio weights at quarter `t-1`;
2. let those weights drift passively using the realized stock returns within the quarter;
3. compare the passive end-of-quarter weights with the actual reported weights at quarter `t`;
4. interpret the difference as an active buy or sell.

This passive-drift adjustment is essential. Without it, a fund would look like it bought winners simply because it held them through their rise.

### 3. Measure momentum trading at the fund level

Once active trades are inferred, the paper relates them to lagged stock returns. A fund's momentum tendency is positive if it actively increases positions in stocks that were recent winners and/or reduces positions in recent losers.

Operationally, the fund-level statistic is a weighted average of lagged stock returns using the inferred active trade sizes as weights. The sign of the measure tells whether the fund is chasing recent strength or moving against it.

This is the paper's central behavioral variable.

### 4. Split the behavior into buy-side and sell-side components

The paper is careful not to collapse all trading into one scalar. A long-only manager can express momentum mainly through purchases, not through symmetrical long-short behavior. So the authors decompose the effect into:

- buying recent winners,
- selling recent losers.

The empirical asymmetry is strong:

- buying winners is widespread,
- selling losers is much less systematic.

This is important because it shows that institutional momentum in delegated long-only capital is mostly a **buy-side tilt toward strength**, not a fully symmetric reversal of the loser book.

### 5. Relate momentum trading to fund performance

The next step is to ask whether momentum-trading funds are simply chasing noise or whether the behavior is associated with better results. The implementation is:

1. compute each fund's momentum-trading statistic over time;
2. sort funds by that statistic;
3. compare subsequent fund performance across the sorts.

Funds with stronger momentum tendencies perform better on average. Methodologically, this matters because it weakens the interpretation that the observed behavior is merely irrational return chasing.

### 6. Build a separate herding statistic

The paper distinguishes momentum trading from herding. A fund can buy winners because it independently interprets information well. Herding requires that many funds buy or sell the same stock at the same time more than would be expected by chance.

The herding test therefore looks at the cross-fund imbalance in buys versus sells for each stock after controlling for the expected overall buy fraction. This is conceptually similar to later Lakonishok-Shleifer-Vishny style measures: a stock is herded into if the realized fraction of buyers is unusually far from the expected fraction.

That statistic is then averaged across stocks and funds to see whether synchronized trading is pervasive.

### 7. Show that herding is weaker than momentum trading

The paper's empirical separation is one of its most useful contributions:

- the holdings data clearly show momentum-oriented trading,
- but the same data do not show that funds are simply moving as one crowd.

This means the institutional behavior is better described as correlated use of recent-return information than as indiscriminate copycat buying.

### 8. What a reader should implement

A faithful replication requires:

1. quarterly fund holdings and fund returns;
2. stock returns over the same interval;
3. passive-drift-adjusted active trade estimates;
4. a fund-level momentum statistic that weights lagged stock returns by active buys and sells;
5. a stock-level herding statistic based on the cross-sectional imbalance of fund trades;
6. portfolio or regression tests relating those measures to subsequent fund performance.

This is not a stock-momentum paper in the usual sense. It is a methodology for measuring momentum behavior directly from delegated portfolios.

## Domain of applicability

- **Where it works well:** Any setting with periodic holdings disclosure, especially long-only active equity management.
- **What is implementable:** The active-trade and herding measures can be reused for mutual funds, hedge funds with filings, or institutional ownership databases.
- **Main limitation:** Quarterly disclosures are coarse and miss intra-quarter timing; they also make short-horizon implementation noisy.
- **Why the paper matters:** It shows that momentum is not just a property of return sorts. It is a measurable institutional trading style, and its buy-side component is associated with better fund performance.
