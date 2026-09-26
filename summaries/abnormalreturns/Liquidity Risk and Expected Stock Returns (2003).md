# Liquidity Risk and Expected Stock Returns
**Authors:** Lubos Pastor, Robert F. Stambaugh
**Year:** 2003
**Journal/Venue:** Journal of Political Economy

## Problem statement

This is not a momentum paper in the narrow sense, but it is foundational for later momentum-and-liquidity papers. The question is: **do stocks that covary more negatively with aggregate market liquidity shocks earn higher expected returns, and how can such a market-wide liquidity risk factor be estimated from trading data?**

The paper matters for momentum because later work often uses the Pastor-Stambaugh liquidity factor either as a control or as a candidate explanation for momentum profits.

## Approach (short)

The paper first estimates stock-level liquidity from daily return reversals induced by signed volume. For stock `i` in month `t`, a daily regression of next-day excess return on today's excess return and signed order flow produces a monthly liquidity coefficient `\gamma_{i,t}`. A market-wide liquidity measure is then formed by aggregating these stock-level coefficients across stocks and extracting innovations from that aggregate series. Finally, expected-return tests ask whether stocks with higher exposure to those liquidity innovations earn higher average returns.

## Approach (detailed)

### 1. Measure liquidity through return reversal from order flow

The paper's key stock-level idea is that illiquidity reveals itself when order flow pushes prices away from fundamental value and those price effects subsequently reverse. At the daily level, for each stock and month, the authors estimate a regression of next-day excess return on:

- the stock's current excess return,
- a signed-volume term.

The signed-volume term takes today's volume and multiplies it by the sign of today's excess return. The slope on that term, usually denoted `\gamma_{i,t}`, captures how strongly prices reverse after signed order flow.

More negative reversal after order flow corresponds to greater illiquidity.

### 2. Convert stock-level liquidity into a market-wide liquidity state

Once monthly `\gamma_{i,t}` values are estimated for many stocks, the paper constructs an **aggregate liquidity measure** by taking a cross-sectional average of those stock-level liquidity estimates.

That aggregate series is persistent, so the priced object is not its level but its **unexpected innovation**. The paper therefore models aggregate liquidity dynamically and extracts innovations to use as the market-wide liquidity shock.

This is methodologically important: asset pricing should reward exposure to unexpected liquidity deterioration, not to the predictable part of a slow-moving liquidity series.

### 3. Estimate each stock's exposure to aggregate liquidity shocks

The next step is to compute a **liquidity beta**. For each stock or portfolio, the authors estimate how returns comove with innovations in aggregate liquidity, controlling for standard return factors.

So the empirical object is not "illiquid stock" but "stock whose return performs poorly when market-wide liquidity unexpectedly dries up."

That distinction is central. The paper is about **systematic** liquidity risk rather than merely high trading costs at the individual-stock level.

### 4. Test whether liquidity beta is priced

The paper then forms portfolios and cross-sectional tests that sort assets by liquidity-risk exposure and examine whether higher liquidity-beta assets earn higher average returns.

The logic is standard asset pricing:

- if a stock suffers when aggregate liquidity worsens unexpectedly,
- it is undesirable to hold in bad states,
- so it should command a higher expected return.

The results support that prediction.

### 5. Why this matters for momentum research

Momentum strategies often have meaningful liquidity exposure:

- winners are usually easier to trade,
- losers are often less liquid,
- and turnover is high, making implementation sensitive to market-wide liquidity conditions.

Later momentum papers therefore use the Pastor-Stambaugh factor in two ways:

1. as a risk factor that might explain part of momentum,
2. as a control to show that some momentum effect survives even after accounting for systematic liquidity risk.

### 6. What a reader should implement

A faithful implementation of the paper involves:

1. daily stock-level regressions that estimate monthly liquidity from signed-volume-induced return reversal;
2. construction of an aggregate liquidity series from the cross section of those estimates;
3. extraction of unexpected innovations from that aggregate series;
4. time-series estimation of each asset's liquidity beta;
5. cross-sectional tests of whether that beta is priced.

This workflow is what made the Pastor-Stambaugh liquidity factor so widely reusable.

## Domain of applicability

- **Where it works well:** Equity asset-pricing studies where market-wide liquidity shocks are a plausible state variable.
- **What is implementable:** A nontraded liquidity factor based on aggregate innovations in stock-level price-impact reversal measures.
- **Main limitation:** The factor is estimated rather than directly traded, and its construction requires high-quality daily volume and return data.
- **Why the paper matters:** It created the benchmark systematic-liquidity-risk measure that later momentum and anomaly papers repeatedly test against.
