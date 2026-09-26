# The Role of Shorting, Firm Size, and Time on Market Anomalies
**Authors:** Ronen Israel, Tobias J. Moskowitz
**Year:** 2013
**Journal/Venue:** Journal of Financial Economics

## Problem statement

Many anomaly papers report long-short profits, but investors do not always know how much of those profits actually require shorting or whether the effect is concentrated in small, hard-to-trade stocks. This paper asks: **for size, value, and momentum, how much of the premium comes from the long side, how much depends on shorting, how does that vary with firm size, and has it changed over time?**

For momentum, the paper is especially useful because it directly tests two common beliefs:

- momentum is mostly a short-side anomaly,
- momentum is mainly a small-stock phenomenon.

## Approach (short)

The paper studies U.S. equities from 1926/1927 through 2011 and constructs standard portfolios on:

- size,
- value (`BE/ME`),
- momentum (`Ret(2,12)`).

It uses both decile and quintile portfolios, including `5 x 5` dependent sorts on size then value or size then momentum. It compares:

- long-short returns,
- long-only returns,
- short-only returns,
- contributions by size group,
- variation over time and across other asset classes.

The main result for momentum is that profits are present across size groups, about half of the premium comes from the long side, and the common claim that momentum is mainly a small-cap or short-side effect is not robust in the long sample.

## Approach (detailed)

### 1. Use one standard characteristic per anomaly

The paper deliberately avoids exotic definitions. For momentum it uses the classic:

$$
\text{Ret}(2,12),
$$

the past 12-month return skipping the most recent month.

For value it uses `BE/ME`, and for size it uses market capitalization. The point is comparability:

- over time,
- across markets,
- and across the three anomalies.

### 2. Build both simple and size-conditional portfolios

The U.S. equity analysis uses:

- value-weighted and equal-weighted decile portfolios,
- `5 x 5` dependent sorts on size then value,
- `5 x 5` dependent sorts on size then momentum.

Momentum portfolios are formed monthly; size and value portfolios follow the usual annual June convention. The size-conditional sorts are critical because they let the paper ask whether momentum gets stronger or weaker as firm size changes.

### 3. Separate long-short, long-only, and short-only pieces

This is the paper's central methodological contribution. Instead of only reporting:

$$
\text{Winners} - \text{Losers},
$$

it also evaluates:

- the alpha of the long leg alone,
- the alpha of the short leg alone,
- and the fraction of the total premium contributed by each side.

This is the right way to ask whether shorting is economically essential to the anomaly.

### 4. Use a very long U.S. sample

The U.S. momentum sample runs from January 1927 through December 2011. That matters because many earlier claims about the role of size or shorting in momentum came from shorter windows that could have been dominated by particular eras.

The long sample lets the authors test whether those earlier conclusions are robust or just subperiod-specific.

### 5. Evaluate momentum across size quintiles

The paper examines momentum within each size bucket. The result is straightforward:

- momentum exists in every size group,
- it does not reliably decline with size over the full sample,
- there is little evidence that the premium is substantially stronger only among small caps.

This is one of the paper's most direct challenges to the existing narrative.

### 6. Measure the role of shorting across size groups

The paper then asks how the importance of the short leg changes with size. For momentum:

- shorting becomes **less** important as size decreases,
- and more important among larger stocks.

But across all size groups, the evidence does not support the stronger claim that momentum is fundamentally a shorting anomaly.

### 7. Compare long-only implementations

Because many investors cannot short or can short only imperfectly, the paper evaluates long-only versions of value and momentum. The result is practically important:

- long-only momentum still exhibits positive alpha,
- and roughly half of total momentum profits come from the long side.

This makes the strategy much more implementable for constrained investors than the usual anomaly presentation suggests.

### 8. Test time variation and implementation frictions

The paper also studies whether the roles of size and shorting change with:

- trading costs,
- institutional ownership,
- time.

For momentum, the broad answer is no: the size and shorting patterns are fairly stable and much of the apparent time variation is consistent with sampling noise rather than structural change.

### 9. Extend the evidence beyond U.S. equities

The study also examines international equities and other asset classes through the value-and-momentum-everywhere framework. The cross-market evidence again shows that:

- value and momentum often work in both long-short and long-only forms,
- and their long-side contribution is economically important.

This makes the U.S. conclusions less likely to be an artifact of one market.

### 10. What a reader should implement

The paper's implementation lesson is:

1. evaluate anomaly strategies separately on the long and short sides;
2. condition their performance on size;
3. do not assume shorting is where the whole premium lives;
4. test long-only versions explicitly rather than inferring their viability from long-short returns.

For momentum in particular, the evidence says the long book is more important than the literature had often suggested.

## Domain of applicability

- **Where it works well:** Investors or researchers who need to know whether momentum is implementable under short-sale constraints or size constraints.
- **What is implementable:** Long-only and size-conditioned versions of momentum using the standard `Ret(2,12)` signal.
- **Main limitation:** The paper uses intentionally simple characteristic definitions, so it is better for broad benchmarking than for extracting the last basis point from a more specialized signal.
- **Why the paper matters:** It is one of the best papers on what actually makes momentum implementable rather than merely statistically significant.
