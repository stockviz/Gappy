# Do Industries Explain Momentum?
**Authors:** Tobias J. Moskowitz, Mark Grinblatt
**Year:** 1999
**Journal/Venue:** Journal of Finance

## Problem statement

The original stock-momentum evidence is ambiguous about the level at which continuation occurs. A stock can look like a momentum winner because:

- its own firm-specific news is diffusing slowly,
- its industry is in a common continuation phase,
- or both.

This paper asks the identification question directly: **if one removes the industry component from stock returns, how much of conventional stock momentum remains?**

That is a structural question, not just a robustness check. If most momentum is industry-level, then the usual "stock momentum" strategy is partly misnamed.

## Approach (short)

The paper builds 20 value-weighted industry portfolios from CRSP and COMPUSTAT, studies momentum directly on those industry portfolios, and then reruns standard stock-momentum strategies after subtracting each stock's own-industry return.

The central methodological result is that industry momentum is itself strong, and once that common industry component is removed, the stock-level momentum premium becomes much smaller. Random pseudo-industries do not produce the same result, so the finding is not a mechanical aggregation artifact.

## Approach (detailed)

### 1. Construct tradable industry portfolios first

The authors begin by classifying U.S. stocks into 20 industries and forming monthly **value-weighted** industry portfolio returns. Value weighting is important because:

- it makes the test closer to an implementable industry strategy;
- it reduces the role of microstructure noise from tiny firms;
- and it makes the comparison with stock momentum conservative.

The sample runs from July 1963 to July 1995. Industry returns are studied both raw and after standard characteristic adjustments so the paper can distinguish industry continuation from size or value effects.

### 2. Define industry momentum exactly

Let `IM(L,H)` denote an industry momentum strategy with `L`-month ranking period and `H`-month holding period. The implementation mirrors the classic stock strategy:

1. compute each industry's cumulative return over the last `L` months;
2. rank industries by those lagged returns;
3. buy the winner industries and short the loser industries, using 30% breakpoints rather than deciles;
4. hold for `H` months with overlapping portfolios.

This makes the industry test directly comparable to Jegadeesh-Titman style momentum.

The paper studies many `L/H` pairs, but two are most important:

- standard medium-horizon designs such as `6/6`;
- short-horizon `1/1`, where industry continuation turns out to be particularly strong.

### 3. Compare the level of profits, not just the sign

The paper is careful about construction differences. Industry portfolios are value weighted and use coarse breakpoints, whereas classic stock momentum often uses equal weighting and deciles. So the right question is not whether the magnitudes match line by line. The right question is whether diversified industry portfolios generate economically meaningful continuation.

They do. In the baseline `6/6` design the monthly return to industry momentum is about 0.43%, which is too large to dismiss as a sideshow.

### 4. Remove the industry component from stock returns

The main experiment defines an industry-adjusted stock return

$$
r_{i,t}^{adj} = r_{i,t} - r_{ind(i),t},
$$

where `r_{ind(i),t}` is the value-weighted return of stock `i`'s industry in month `t`.

The authors then rerun the standard stock momentum strategy:

1. rank stocks by raw six-month returns and hold for six months;
2. rank stocks by industry-adjusted six-month returns and hold for six months;
3. compare the winner-minus-loser spread.

This is the core identification device. If raw stock momentum survives intact after the subtraction, then momentum is mostly firm specific. If it shrinks sharply, then common industry continuation was doing much of the work.

### 5. Show that the stock premium collapses after adjustment

That is exactly what happens. The conventional stock-momentum premium becomes small once industry returns are removed, especially after size and book-to-market controls. The economic logic is simple:

- many stocks classified as "winners" are just members of winning industries;
- many "losers" are just members of losing industries.

Once the common industry piece is stripped out, much less continuation is left at the individual-stock level.

### 6. Use random-industry placebo tests

The natural objection is that any grouping of stocks could manufacture apparent common continuation. The paper handles this with placebo portfolios:

1. randomly assign stocks to pseudo-industries;
2. form value-weighted returns for those random groups;
3. rerun the same industry-momentum and adjustment exercises.

The placebo industries do not reproduce the results. This is important because it rules out the purely statistical story that aggregation alone creates industry momentum.

### 7. Distinguish short-horizon industry continuation from stale-price lead-lag

Industry momentum is especially strong at the `1/1` horizon, which raises an obvious concern about nonsynchronous trading and stale-price effects. The paper addresses this by:

- using value-weighted industry returns,
- examining subsamples by firm size and trading activity,
- and considering skipped-month variants.

The effect survives these checks, so the authors argue that industry momentum is not simply a microstructure artifact.

### 8. Examine which side of the trade matters

The paper does not only study the zero-cost spread. It also breaks the result into:

- winners versus middle,
- middle versus losers,
- winners versus losers.

For industries, much of the continuation is on the **long side**: buying recent winning industries is particularly effective. That differs from some stock-level momentum evidence where the loser leg is more fragile.

### 9. Confirm the result in cross-sectional regressions

To show that the result is not an artifact of portfolio sorts, the authors run Fama-MacBeth regressions using:

- stock-level lagged returns,
- industry-level lagged returns,
- and standard controls.

When the industry variable enters, the stock-level momentum term weakens materially. This is the regression analogue of the industry-adjusted sort.

### 10. What the paper actually proves

The paper's logic is cumulative:

1. actual industries display momentum;
2. random industries do not;
3. removing industry returns sharply weakens stock momentum;
4. cross-sectional regressions tell the same story.

So the paper does not say "firm-specific continuation is zero." It says that a substantial share of measured stock momentum is inherited from industry continuation.

## Domain of applicability

- **Where it works well:** Broad equity universes with credible industry classifications and enough names per industry to estimate value-weighted group returns cleanly.
- **What is implementable:** Both legs are implementable. One can trade industry momentum directly or residualize stock momentum against own-industry returns before ranking stocks.
- **Main limitation:** The paper is strongest about industry structure in U.S. equities. It does not show that industry is the only commonality channel; later work extends the logic to factors.
- **Why the paper matters:** It changes the unit of analysis. Before calling a signal "stock momentum," one should first check whether the continuation is really living at the industry level.
