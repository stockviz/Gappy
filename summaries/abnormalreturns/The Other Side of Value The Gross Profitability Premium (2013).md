# The Other Side of Value: The Gross Profitability Premium
**Authors:** Robert Novy-Marx
**Year:** 2013
**Journal/Venue:** Journal of Financial Economics

## Problem statement

Novy-Marx asks whether a very simple accounting measure of operating productivity predicts stock returns as strongly as traditional value measures. The paper's motivating claim is that value investing has always had two sides:

- price paid for assets,
- quality or productivity of those assets.

Traditional value strategies emphasize the first side and often ignore the second. The paper therefore studies whether gross profitability is a separate cross-sectional return predictor and whether incorporating it improves value strategies by helping distinguish bargains from value traps.

## Approach (short)

The core signal is gross profitability:

$$
GP/A = \frac{REVT - COGS}{AT},
$$

that is, revenues minus cost of goods sold, scaled by book assets.

The paper:

1. forms portfolios on `GP/A`,
2. compares the return spread to classic book-to-market sorts,
3. runs double sorts and regressions combining profitability with value,
4. compares gross profitability to other earnings-based profitability measures,
5. and examines whether profitability explains other anomalies.

The main conclusion is that gross profitability has predictive power comparable to value, works even among large caps, and materially improves value investing.

## Approach (detailed)

### 1. Why gross profits instead of earnings?

The paper's conceptual move is to go higher up the income statement. Bottom-line earnings are contaminated by:

- financing choices,
- SG&A spending,
- R&D and other discretionary expenditures,
- and accounting conventions that do not directly measure productive efficiency.

Gross profits are closer to the raw productivity of the firm's assets. That is why the paper defines

$$
GP/A = \frac{\text{Revenue} - \text{COGS}}{\text{Total Assets}},
$$

and scales by **book assets**, not market value. Scaling by market value would mechanically blend profitability with valuation and undermine the attempt to separate "quality" from "cheapness."

### 2. Portfolio construction

The sample excludes financial firms and uses standard CRSP-COMPUSTAT data. Firms are sorted on gross profitability, generally with NYSE-based breakpoints and value-weighted portfolio returns. The canonical long-short profitability factor is:

- long high `GP/A` firms,
- short low `GP/A` firms.

The paper then compares the magnitude and persistence of this spread with the corresponding classic value spread based on book-to-market.

### 3. Gross profitability is as strong as value

This is the first headline result. The return spread from sorting on gross profitability is economically and statistically similar to the value premium. That is what makes the paper provocative. Profitability is not a weak secondary screen layered on top of value. It is a first-order style dimension in its own right.

### 4. Gross profitability beats alternative profitability measures

The paper also runs a horse race across profitability concepts, comparing gross profitability to:

- bottom-line earnings-based profitability,
- cash-flow-based measures,
- and other accounting profitability ratios.

Gross profitability dominates because it is closest to pure operating performance while being relatively insulated from capital-structure and accounting-policy noise.

### 5. Combine profitability with value

The paper then performs independent sorts on:

- gross profitability,
- book-to-market.

This reveals the economic role of profitability in value investing:

- cheap firms with high profitability do especially well,
- cheap firms with low profitability are often value traps,
- expensive but highly profitable firms can still outperform their less profitable peers.

So profitability is not merely an alternative to value. It refines value.

### 6. Large-cap relevance

One reason the paper had so much impact is that the effect is not confined to microcaps. Gross profitability has strong predictive power in the large-cap universe as well. This is important because many anomalies weaken sharply once one moves away from small illiquid names. Gross profitability does not die so easily.

### 7. Double-sort and regression evidence

The paper uses both sorts and regressions to show that profitability and value each retain predictive content when the other is controlled for. That is, the profitability premium is not merely a noisy relabeling of book-to-market, and vice versa.

This is essential for the interpretation. If profitability were just a hidden value measure, its contribution should disappear once value is included. The paper shows that it does not.

### 8. Relation to other anomalies

Novy-Marx also shows that gross profitability helps explain a surprisingly wide range of return patterns that had previously been treated as separate anomalies. The interpretation is that several signals are really exposing a common firm-quality dimension.

This is part of the paper's importance: it suggests that the anomaly zoo may be more structured than it looks, with profitability serving as one of the organizing axes.

### 9. Why this is "the other side of value"

The paper's title is not rhetoric. Traditional value sorts buy cheap firms regardless of whether the underlying business is strong or weak. Gross profitability adds the missing quality dimension. A stock is attractive not just because it is cheap, but because it is productive relative to its assets and not fully priced for that productivity.

That logic directly suggests implementable strategies:

1. compute `GP/A`,
2. rank firms by profitability,
3. combine profitability ranks with book-to-market ranks,
4. favor firms that are both profitable and cheap.

### 10. Why the paper mattered

The paper effectively launched profitability as a major style dimension in empirical asset pricing. It also changed value-investing practice by showing that a simple productivity measure could help distinguish cheap good businesses from cheap bad businesses.

## Domain of applicability

- **Where it works well:** Broad equity universes with standard accounting data, especially when the goal is to improve traditional value strategies rather than replace them.
- **What is implementable:** Construction of gross-profitability sorts using `GP/A = (REVT - COGS)/AT`, long-short profitability factors, and composite value-plus-profitability rankings or double sorts.
- **Main limitation:** Gross profitability is still an accounting variable and will miss important dimensions of intangible investment and franchise quality not captured on the balance sheet.
- **Why the paper matters:** It established gross profitability as a powerful and investable predictor of returns, and showed that profitability is not a side note to value but one of its missing dimensions.
