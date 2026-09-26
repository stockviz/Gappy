# Time-Varying Liquidity and Momentum Profits
**Authors:** Doron Avramov, Si Cheng, Allaudeen Hameed
**Year:** 2016
**Journal/Venue:** Journal of Financial and Quantitative Analysis

## Problem statement

If liquidity relaxes arbitrage constraints, one might expect momentum to be strongest when markets are illiquid and hard to arbitrage away. This paper asks whether that intuition is right. The question is: **how do aggregate market-liquidity states affect the profitability of price momentum and earnings momentum?**

The surprising answer is the opposite of the naive arbitrage story.

## Approach (short)

The paper constructs standard price momentum on U.S. stocks from 1928-2011 using:

- prior 11-month returns from `t-12` to `t-2`,
- a skip of month `t-1`,
- decile sorts,
- value-weighted winner and loser portfolios.

It then measures aggregate market illiquidity using the Amihud market-wide illiquidity index and tests whether lagged illiquidity predicts subsequent momentum payoffs, controlling for down-market states, market volatility, factor exposures, sentiment, macro variables, and liquidity-risk factors such as Pastor-Stambaugh and Sadka. It repeats similar tests for earnings momentum and in international samples. The key result is that momentum profits are **larger after liquid market states**, not illiquid ones.

## Approach (detailed)

### 1. Define momentum in the standard Daniel-Moskowitz style

At the start of each month `t`, all eligible common stocks are sorted into deciles based on returns from months `t-12` through `t-2`, skipping the most recent month to avoid short-term reversal. The top and bottom deciles are the winner and loser portfolios, and the monthly momentum payoff is:

$$
WML_t = R^{winner}_t - R^{loser}_t.
$$

The portfolios are value weighted and the NYSE alone is used for breakpoints, which prevents extreme Nasdaq volatility from dominating the decile boundaries.

### 2. Measure liquidity at both the portfolio and market level

At the stock level, the paper uses the Amihud illiquidity measure:

$$
ILLIQ_{i,t} =
\frac{1}{n}\sum_{d=1}^n \frac{|R_{i,d}|}{P_{i,d}N_{i,d}},
$$

where the denominator uses price times shares traded. The larger the price move for a given trading volume, the less liquid the stock.

The aggregate market illiquidity state `MKTILLIQ` is the value-weighted average of stock-level Amihud illiquidity.

### 3. Show the key cross-sectional asymmetry inside the momentum trade

The loser portfolio is much more illiquid than the winner portfolio. This matters because a market-wide liquidity state can affect the long and short legs differently:

- winners are relatively liquid,
- losers are relatively illiquid.

If illiquid losers earn especially high future returns after illiquid states, that compresses or even kills the winner-minus-loser spread.

This is the paper's key economic mechanism.

### 4. Run predictive regressions of momentum on lagged market states

The main tests regress next month's momentum payoff on lagged:

- market illiquidity `MKTILLIQ`,
- down-market-state indicators `DOWN`,
- market volatility `MKTVOL`.

The central coefficient is on `MKTILLIQ`. Contrary to the usual arbitrage intuition, it is strongly **negative**:

- high market illiquidity today predicts weak momentum tomorrow,
- low market illiquidity today predicts strong momentum tomorrow.

### 5. Decompose the effect into winner and loser legs

The paper repeats the predictive regressions using winner and loser returns separately. It finds that market illiquidity reduces the spread mostly by boosting the future return of loser stocks more than that of winners. Because losers are much more illiquid, the cross-sectional illiquidity premium is especially important for them when aggregate market illiquidity is high.

This is the mechanism behind the negative relation between market illiquidity and momentum profits.

### 6. Control for standard competing state variables

The authors do not stop at one predictor. They control for:

- down-market states from prior market returns,
- market volatility,
- investor sentiment,
- cross-sectional return dispersion,
- macro variables,
- Pastor-Stambaugh liquidity risk,
- Sadka liquidity risk.

In joint models, `MKTILLIQ` remains the dominant predictor, while the predictive power of the other state variables weakens materially.

### 7. Apply the same logic to earnings momentum

The paper then shows that the same aggregate liquidity state also predicts **earnings momentum**. That is important because it suggests the liquidity-state effect is not peculiar to one specific return-sorting anomaly.

### 8. Extend the evidence internationally

International tests on Japan and Eurozone markets show a similar pattern: conditioning on aggregate market illiquidity reveals momentum profits, and the state of market liquidity remains the strongest of the competing state variables.

### 9. What a reader should implement

A faithful implementation is:

1. build standard winner and loser deciles from lagged 11-month returns skipping one month;
2. compute aggregate market illiquidity from stock-level Amihud measures;
3. condition expected momentum exposure on that lagged state;
4. examine the winner and loser legs separately to see how the state works through the cross-sectional liquidity premium.

The practical lesson is not "avoid momentum in illiquid stocks" but "avoid or scale down momentum after **illiquid market states**."

## Domain of applicability

- **Where it works well:** Equity momentum and earnings-momentum strategies where the market-wide state of liquidity can be estimated reliably.
- **What is implementable:** A market-state overlay that conditions momentum exposure on lagged aggregate illiquidity.
- **Main limitation:** The mechanism is reduced form; it identifies when momentum is weak, but not one uniquely structural behavioral or rational explanation for why.
- **Why the paper matters:** It overturns the simple view that momentum should be strongest when arbitrage is hardest.
