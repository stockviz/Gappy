# Price Momentum and Trading Volume
**Authors:** Charles M. C. Lee, Bhaskaran Swaminathan
**Year:** 2000
**Journal/Venue:** Journal of Finance

## Problem statement

Classic momentum sorts use only past returns. Lee and Swaminathan ask whether that misses an important state variable: **how much has the market already traded on the move?** Their question is therefore: can past trading volume help identify where a stock sits in the momentum life cycle and predict not only continuation, but also the speed of eventual reversal?

The paper's claim is not simply that volume forecasts returns. It is that volume conditions the interpretation of past returns.

## Approach (short)

The paper independently sorts NYSE/AMEX stocks on past returns and past trading volume, measured by average daily turnover, producing 30 intersection portfolios. It then tracks both medium-horizon continuation and long-horizon reversal. High-volume winners and high-volume losers generate stronger near-term momentum but reverse faster later, while low-volume names behave more like earlier-stage, neglected stocks.

Methodologically, volume becomes a proxy for the **maturity of a momentum signal**.

## Approach (detailed)

### 1. Define the sample and the volume measure carefully

The main sample contains NYSE and AMEX stocks. Nasdaq is excluded from the baseline analysis because historical turnover data are less comparable and many Nasdaq names were harder to trade. A separate holdout exercise is later used for Nasdaq.

The key conditioning variable is average daily turnover over the formation window:

$$
\text{Volume}_{i,J}
=
\frac{1}{J}\sum_{d \in J}
\frac{\text{shares traded}_{i,d}}{\text{shares outstanding}_{i,d}}.
$$

This is crucial. The paper does not use raw share volume. It uses a size-scaled turnover measure so that "heavily traded" means heavy relative to the stock's float.

### 2. Form independent return and volume sorts

At each month the authors independently rank all eligible stocks:

1. into 10 portfolios by past `J`-month return;
2. into 3 portfolios by past `J`-month turnover.

This creates 30 price-momentum-by-volume portfolios. The paper studies `J = 3, 6, 9, 12` and holding periods `K = 3, 6, 9, 12`, with a one-week or one-month gap between signal measurement and portfolio formation to reduce bid-ask bounce and short-term reversal contamination.

Because the sorts are independent, the design distinguishes:

- high-volume winners,
- low-volume winners,
- high-volume losers,
- low-volume losers,

rather than treating all winners or all losers as one object.

### 3. Measure both short-run continuation and long-run reversal

This is one of the paper's strongest design choices. Returns are tracked not only during the first holding year but also through years 2 to 5 after formation. That allows the authors to ask two separate questions:

- where is momentum strongest initially?
- where does reversal appear first?

The results show that volume is informative about both.

### 4. Show how volume conditions the momentum spread

In the first post-formation year, the winner-minus-loser spread is strongest among **high-volume** stocks. That happens because:

- high-volume winners continue strongly,
- and high-volume losers continue to underperform.

But those same high-volume extreme portfolios reverse earlier and more sharply in later years. The implication is dynamic:

- high volume marks a later stage of the return cycle;
- low volume marks an earlier, less fully recognized stage.

### 5. Use long-horizon return paths to identify the life cycle

The paper's most important methodological move is to interpret volume through the **shape** of the entire return path:

- high-volume winners are closer to exhaustion and hence reverse sooner;
- high-volume losers rebound sooner as well;
- low-volume winners and losers show slower, more persistent adjustment.

This is why the paper tracks returns through five post-formation years instead of stopping at the standard 6- or 12-month horizon.

### 6. Link volume to firm characteristics and earnings news

The authors then examine what low- and high-volume firms look like economically. Low-volume stocks tend to display more value-like and neglected-stock characteristics and, importantly, more positive future earnings surprises than the market seems to expect. High-volume stocks look more glamour-like and more fully recognized.

So volume is not treated as a purely mechanical liquidity proxy. It is also a proxy for how much investor attention and information processing the stock has already received.

### 7. Use risk-adjustment and robustness checks

The paper then asks whether the effect is just illiquidity or size in disguise. It runs:

- Fama-French three-factor adjustments,
- controls for size and price,
- subsample tests among the largest 50% of NYSE/AMEX firms,
- and a holdout replication on Nasdaq stocks.

The volume-conditioned momentum pattern survives. This matters because the low-volume-minus-high-volume effect alone could have been interpreted as an illiquidity premium, but the interaction with past returns contains additional information.

### 8. The implementable signal the paper leaves behind

The paper's signal is not "buy low volume." It is:

1. measure `J`-month cumulative return;
2. measure `J`-month average daily turnover;
3. independently sort on both;
4. condition the interpretation of the return signal on the turnover bucket.

If one wants the strongest near-term momentum, one tilts toward high-volume winners versus high-volume losers. If one wants a signal that is earlier in the diffusion process and slower to reverse, one looks at low-volume names.

That is the paper's practical contribution: volume changes what a momentum ranking means.

## Domain of applicability

- **Where it works well:** Large equity universes with reliable daily turnover data and enough names to support 10-by-3 independent sorts.
- **What is implementable:** Volume-conditioned momentum portfolios, long-horizon reversal diagnostics, and state-dependent ranking rules that distinguish early-cycle from late-cycle momentum.
- **Main limitation:** Turnover can reflect several forces at once: attention, disagreement, liquidity demand, and information arrival. The paper identifies the joint predictive content, not a single structural channel.
- **Why the paper matters:** It upgrades momentum from a one-dimensional past-return sort into a two-dimensional signal in which past volume identifies the stage of the continuation-versus-reversal cycle.
