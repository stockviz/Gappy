# Price Momentum and Trading Volume
**Authors:** Charles M. C. Lee, Bhaskaran Swaminathan
**Year:** 2000
**Journal/Venue:** Journal of Finance

## Problem statement

This PDF is a filename variant of the same Lee-Swaminathan paper already summarized in [LeeSwaminathan_2000.md](/Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My%20Drive/library/summaries/momentum/LeeSwaminathan_2000.md). The substantive question is unchanged: **does past trading volume help identify where a stock sits in the momentum cycle and therefore predict both the strength of continuation and the speed of eventual reversal?**

The reason to keep a separate note is that this duplicate PDF belongs to the next filename batch the user asked to process.

## Approach (short)

The paper independently sorts stocks on:

- past returns,
- past trading volume, measured by average daily turnover.

This creates 30 return-by-volume portfolios. The authors then trace both near-term momentum and long-term reversal. High-volume winners and losers show stronger short-run momentum but reverse faster later, while low-volume names behave more like earlier-stage signals. Methodologically, turnover acts as a proxy for the **maturity** of the momentum signal.

## Approach (detailed)

### 1. Use turnover rather than raw volume

The conditioning variable is average daily turnover:

$$
\text{Turnover}_{i,J}
=
\frac{1}{J}\sum_{d\in J}
\frac{\text{shares traded}_{i,d}}{\text{shares outstanding}_{i,d}}.
$$

That makes the measure comparable across firms of very different size and float.

### 2. Form independent price and volume sorts

Each month the paper:

1. sorts stocks into 10 groups by past `J`-month return,
2. sorts them independently into 3 groups by past turnover,
3. forms the 30 intersection portfolios,
4. studies holding periods `K = 3, 6, 9, 12` with the usual skip to reduce microstructure noise.

Because the sorts are independent, the paper can compare:

- low-volume winners versus high-volume winners,
- low-volume losers versus high-volume losers,

instead of treating winners and losers as homogeneous.

### 3. Track the full continuation-to-reversal path

The most important design choice is that the paper follows returns well beyond the initial holding horizon. It shows:

- high-volume winners continue strongly in the near term but reverse sooner,
- high-volume losers continue to underperform but also rebound sooner later,
- low-volume names display slower, more persistent adjustment.

That is why volume is interpreted as a life-cycle variable for momentum.

### 4. Link volume to information and attention

The paper then shows that low-volume firms look more neglected and value-like, while high-volume firms look more glamour-like and more heavily processed by the market. So volume is not only a liquidity proxy; it also measures how far the market has already moved along the information-diffusion cycle.

### 5. Implementation takeaway

A reader implementing the paper would:

1. measure past cumulative return,
2. measure average daily turnover over the same window,
3. independently sort on both,
4. interpret the return signal conditional on the turnover bucket.

High-volume momentum is stronger immediately but more fragile later. Low-volume momentum is weaker immediately but more persistent.

## Domain of applicability

- **Where it works well:** Large equity universes with reliable daily turnover data.
- **What is implementable:** Volume-conditioned momentum signals and long-horizon reversal diagnostics.
- **Main limitation:** Turnover can proxy jointly for information flow, disagreement, liquidity demand, and investor attention rather than one single structural channel.
- **Why the paper matters:** It makes momentum two-dimensional by adding a state variable that changes the meaning of past returns.
