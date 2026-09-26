# Is Momentum an Echo?
**Authors:** Amit Goyal, Sunil Wahal
**Year:** 2015
**Journal/Venue:** Journal of Financial and Quantitative Analysis

## Problem statement

Novy-Marx argues that momentum is driven more by returns from months `t-12` to `t-7` than by the more recent `t-6` to `t-2` window, suggesting an "echo" in returns. This paper asks: **is that echo a genuine, general feature of momentum, or is it a U.S.-specific artifact driven by the usual short-term reversal around month `-2`?**

The paper is important because the answer changes how one should build momentum signals. If the echo is real, then intermediate-horizon returns deserve far more weight than the recent window.

## Approach (short)

The paper studies stocks in 37 non-U.S. countries from 1980 to 2010, plus a variety of regional and pooled international portfolios. It compares:

- **IR** momentum, formed on returns from months `-12` to `-7`;
- **RR** momentum, formed on returns from months `-6` to `-2`.

It runs:

- country-level and aggregated WML portfolio tests,
- independent double-sorts on IR and RR,
- Fama-MacBeth regressions controlling for size, book-to-market, and month `-1` return,
- and a full return-response / bootstrap analysis of the term structure of lagged-return predictability.

The central result is that outside the U.S. there is no robust evidence that IR beats RR. In the U.S., the apparent echo is largely a carryover of short-term reversal from month `-2`.

## Approach (detailed)

### 1. Separate "intermediate" and "recent" momentum explicitly

The paper's basic design is to split the conventional 12-month formation window into two subwindows:

- `IR`: months `-12` to `-7`,
- `RR`: months `-6` to `-2`.

This is a direct test of whether medium-horizon returns predict the future better than more recent returns once one excludes the most recent month.

### 2. Build the international stock sample carefully

The data cover 37 countries from 1980 to 2010. The paper requires at least 100 stocks in a country-month to build country-specific momentum portfolios, which keeps the within-country sorts reasonably diversified.

It also aggregates countries in several ways to address power concerns:

- developed markets,
- emerging markets,
- Americas excluding the U.S.,
- Asia,
- Europe,
- pooled international portfolios,
- pooled ex-country portfolios.

This matters because a null result at the country level could otherwise be dismissed as weak power.

### 3. Benchmark momentum in the usual way first

Before splitting the formation window, the paper constructs the standard momentum portfolio in each country:

- sort on returns from months `-12` to `-2`,
- value weight within country,
- use quintiles rather than deciles for most international tests,
- form winner-minus-loser portfolios and estimate CAPM and local 3-factor alphas when feasible.

This confirms that conventional momentum exists internationally in the expected places, so the paper is not failing to find momentum altogether.

### 4. Compare IR and RR portfolios directly

The core test then sorts stocks separately by:

- IR returns,
- RR returns.

Within each country-month, stocks are assigned to IR and RR quintiles, and the paper forms:

- `IR(WML)` portfolios,
- `RR(WML)` portfolios,
- and their return difference.

If the echo is real, `IR(WML)` should outperform `RR(WML)` consistently.

### 5. Use several aggregation schemes so the result is not a construction artifact

The paper reports results for:

- equal-weighted country aggregates,
- value-weighted country aggregates,
- pooled stock-level portfolios,
- pooled portfolios using returns in excess of local-country returns.

This is a methodological strength. A genuine echo should survive more than one portfolio-construction choice.

### 6. Hold one horizon constant with independent double-sorts

Single sorts cannot tell whether IR outperforms RR because of its own information or because it is correlated with RR. The paper therefore independently sorts on both horizons and examines "mirror" strategies.

For example:

- within a given RR loser bin, construct IR-based WML;
- compare it to the corresponding RR-based WML within the analogous IR bin.

This is a sharper test of whether intermediate-horizon information is genuinely stronger after holding recent information fixed.

### 7. Run Fama-MacBeth regressions that control for standard characteristics

Portfolio tests alone do not control for size, book-to-market, or short-term reversal. So the paper estimates monthly cross-sectional regressions of future returns on:

- IR,
- RR,
- size,
- book-to-market,
- prior month return.

This is the cleanest way to test whether IR has more marginal predictive power than RR.

Internationally, the answer is generally no.

### 8. Examine the full term structure of lagged-return predictability

The paper then moves away from the arbitrary IR/RR split and estimates return-response regressions in the spirit of Jegadeesh and Heston-Sadka:

- regress current returns on each of the prior 12 monthly lagged returns;
- aggregate coefficients over candidate intermediate and recent windows.

This allows the authors to ask whether the apparent IR > RR result survives when one considers all possible window definitions rather than only the Novy-Marx split.

### 9. Use Romano-Wolf bootstrap to account for data-snooping across many definitions

Because many overlapping window definitions can be tried, naive t-statistics are not enough. The paper therefore uses a Romano-Wolf bootstrap, which generalizes White's reality-check logic, to assess whether any apparent IR superiority is statistically robust after accounting for the search across strategies.

This is a strong methodological point. It treats the "echo" not as a single hypothesis but as a family of related horizon-partition hypotheses.

### 10. Show that month `-2` drives much of the U.S. result

The most important forensic step is to strip out month `-2`. The paper constructs:

- IR using months `-12` to `-8`,
- RR using months `-7` to `-3`.

Once month `-2` is removed from the recent window, the IR advantage in the U.S. becomes much smaller and statistically weak.

So the paper's interpretation is that the U.S. "echo" is largely the arithmetic consequence of recent-window contamination by short-term reversal near month `-2`, not a separate intermediate-horizon continuation phenomenon.

### 11. Main empirical conclusion

The results line up across methods:

- no robust IR advantage in 37 non-U.S. countries,
- no robust IR advantage in developed/emerging/region aggregates,
- no robust IR advantage in double-sorts,
- no robust IR advantage in Fama-MacBeth regressions,
- U.S. advantage attenuates materially when month `-2` is excluded.

That is why the paper concludes there is no general "echo."

### 12. What a reader should implement

A faithful implementation is:

1. compute standard momentum and confirm it exists in the sample;
2. split the formation window into IR and RR;
3. compare IR(WML) and RR(WML) within countries and in pooled international portfolios;
4. run independent double-sorts to hold one horizon constant;
5. estimate Fama-MacBeth regressions of future return on IR and RR together;
6. examine the full monthly-lag coefficient profile and bootstrap over alternative horizon splits;
7. test whether excluding month `-2` collapses the result.

That last step is the decisive one in this paper.

## Domain of applicability

- **Where it works well:** Researchers deciding whether intermediate-horizon momentum deserves to replace or dominate the conventional recent-minus-one-month specification.
- **What is implementable:** International IR and RR momentum portfolios, mirror double-sorts, and term-structure regressions of lagged-return predictability.
- **Main limitation:** The conclusion is about the existence of a general echo, not about whether some intermediate-horizon variants can still be useful in particular U.S. samples.
- **Why the paper matters:** It is the cleanest international refutation of the claim that momentum is fundamentally an "echo" effect.
