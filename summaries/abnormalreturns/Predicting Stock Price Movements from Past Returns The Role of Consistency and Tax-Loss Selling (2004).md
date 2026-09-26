# Predicting Stock Price Movements from Past Returns: The Role of Consistency and Tax-Loss Selling
**Authors:** Mark Grinblatt, Tobias J. Moskowitz
**Year:** 2004
**Journal/Venue:** Journal of Financial Economics

## Problem statement

Grinblatt and Moskowitz revisit the classic relation between past returns and future returns. The literature already knew three stylized facts:

- very short-term reversal,
- intermediate-horizon momentum,
- long-horizon reversal.

Their question is whether these effects are too coarsely measured by cumulative past returns alone. Two additional features may matter:

1. the **consistency** of the past return path,
2. the role of **tax-loss selling** around the turn of the year.

The paper asks whether these two ingredients materially change how past returns forecast future cross-sectional returns.

## Approach (short)

The paper estimates monthly cross-sectional regressions of benchmark-hedged stock returns on lagged-return variables over three horizons:

- one month,
- months `-12` to `-2`,
- months `-36` to `-13`.

For each horizon it augments the usual cumulative-return regressors with:

- interactions for negative past returns,
- dummies for consistent winners and consistent losers,
- and seasonal structure for January, February-November, and December.

The resulting fitted values are then turned into ranked decile strategies. The key empirical findings are:

- **winner consistency** materially strengthens momentum,
- loser consistency matters much less,
- and a large part of January reversals and December loser behavior is linked to tax-loss selling.

## Approach (detailed)

### 1. Use benchmark-hedged returns as the dependent variable

The left-hand-side return is not a raw stock return. It is a stock's return net of a benchmark matched on size, book-to-market, and industry. This is important because the authors want to isolate the incremental predictive content of past-return patterns, not repackage standard characteristic premia.

So the object being forecast is already an abnormal return relative to familiar cross-sectional effects.

### 2. Multiple lag horizons enter the regression simultaneously

The base specification includes cumulative returns over:

- the previous month, `r_{-1:-1}`,
- the intermediate horizon from month `-12` to month `-2`, `r_{-12:-2}`,
- the long horizon from month `-36` to month `-13`, `r_{-36:-13}`.

Negative-return interactions are also included:

$$
r^L_{-t_2:-t_1} = \min(0, r_{-t_2:-t_1}),
$$

which allow winners and losers to have different predictive slopes.

This already nests the usual short-term reversal, momentum, and long-term reversal evidence inside one cross-sectional regression.

### 3. Define consistency explicitly

The major innovation is the consistency dummies.

For the one-year horizon, a stock is a **consistent winner** if monthly returns are positive in at least 8 of the 11 months from `t-12` to `t-2`. A **consistent loser** is analogously defined using negative months. For the three-year horizon, the threshold is chosen analogously, with winners having positive returns in at least 15 of the 23 months from `t-36` to `t-13`.

So the signal is not just the total prior return. It is also whether that return was earned smoothly or erratically.

The monthly cross-sectional regression therefore takes the form

$$
r^*_{t}(j) - R^*_{t}(j)
=
a_t
+ b_{1t} r_{-1:-1}(j)
+ b_{2t} r^L_{-1:-1}(j)
+ g_{1t} r_{-12:-2}(j)
+ g_{2t} r^L_{-12:-2}(j)
+ g_{3t} DCW_{-12:-2}(j)
+ g_{4t} DCL_{-12:-2}(j)
+ d_{1t} r_{-36:-13}(j)
+ d_{2t} r^L_{-36:-13}(j)
+ d_{3t} DCW_{-36:-13}(j)
+ d_{4t} DCL_{-36:-13}(j)
+ \varepsilon_{jt},
$$

with appropriate simplifications for the one-month horizon.

### 4. Winner consistency is economically important

The most striking result is that consistent winners earn significantly higher subsequent returns than otherwise similar winners. The average marginal effect of being a consistent winner is economically large, on the order of several tens of basis points per month.

This is not a trivial restatement of momentum. The regression controls for the cumulative return itself. So the consistency coefficient says:

- among stocks with similar total past returns, the ones that got there through repeated positive months outperform those that got there through a choppier path.

That is a strong refinement of standard momentum.

### 5. Consistent losers do not mirror consistent winners

A particularly interesting asymmetry is that loser consistency matters much less. The authors speculate that tax-loss trading may be masking or offsetting whatever pure consistency effect might otherwise show up among losers.

This asymmetry is important because it argues against a simplistic mechanical interpretation in which consistency is just a proxy for lower volatility or a smoother signal-to-noise ratio. Something economically distinct is happening.

### 6. Seasonal decomposition: January, February-November, December

The paper then splits the cross-sectional relation by season. This is not cosmetic. It is central to identifying tax-loss selling.

The authors estimate different seasonal coefficient sets for:

- January,
- February-November,
- December.

This reveals several key facts:

- momentum is strong outside January,
- January shows the familiar reversal pattern,
- December exhibits strong persistence among losing stocks,
- and these seasonalities look very different across winners and losers.

### 7. Interpretation via tax-loss selling

Tax-loss selling predicts that losing stocks are sold heavily in December for tax reasons, depressing their prices, and then rebound in January when the selling pressure subsides. The paper finds exactly the sort of pattern one would expect:

- losing stocks have especially poor December performance,
- then sharp January rebound,
- with stronger effects in high-tax years and among stocks more susceptible to tax trading.

This is much stronger than the traditional January-effect literature because the paper also looks at December and explicitly conditions on tax regimes.

### 8. Tax regimes and ownership splits

To push the identification further, the paper compares high-tax and low-tax years and also looks across taxable versus institutional ownership categories. The turn-of-the-year profitability of the tax-related strategies is concentrated where tax-loss selling should be strongest.

That gives the paper a more causal flavor than a generic seasonality study. The January effect is not treated as a mysterious calendar anomaly; it is tied to a mechanism.

### 9. Turn the regressions into trading rules

The authors do not leave the results as coefficient tables. They use the time-series average regression coefficients to score stocks each month and sort them into deciles, with decile 10 having the highest predicted abnormal return.

This allows the economic magnitude to be assessed directly. The fitted-value ranking strategies generate substantial long-short profits. The paper also runs versions that:

- exclude the short-term reversal coefficients,
- use only one-year variables,
- use only three-year variables,
- or ignore the consistency dummies.

These comparisons show that consistency is not a marginal embellishment. It materially improves the strategy.

### 10. Economic significance of consistency

The paper then decomposes the top and bottom deciles further into subportfolios based on winner consistency. This is one of the best parts of the paper, because it makes the abstract coefficient tangible.

Within the top predicted-return decile:

- consistent winners strongly outperform non-consistent winners.

Within the relevant loser deciles:

- the picture is dominated much more by tax-related December and January effects than by a symmetric consistency phenomenon.

### 11. What this does to the standard momentum/reversal story

The paper shows that the usual horizon taxonomy is incomplete.

- Short-term reversal is still there.
- Intermediate-horizon momentum is still there.
- Long-horizon reversal is still there, especially in January.

But those effects are materially sharpened or reinterpreted once one adds:

- path consistency,
- loser/winner asymmetry,
- and tax-seasonal structure.

In particular, long-term reversal is not a uniform calendar-free effect; much of it is concentrated in January and linked to the prior December's tax-driven pressure.

### 12. Why the paper mattered

The paper mattered because it did not merely add another past-return variable. It showed that **how** a return was earned matters. A smooth sequence of positive months conveys more predictive information than the same total return delivered by a few jumps. And it showed that the turn-of-the-year patterns in losers line up closely with tax-loss trading.

That combination made the past-return literature much more structured:

- momentum is partly about consistency,
- reversal is partly about tax-seasonality,
- and the path and context of returns matter nearly as much as the level.

## Domain of applicability

- **Where it works well:** Equity return-forecasting and anomaly-construction settings where one wants to refine momentum and reversal signals rather than rely on simple cumulative past returns.
- **What is implementable:** Monthly cross-sectional regressions on benchmark-hedged returns using short-, intermediate-, and long-horizon return variables, negative-return interactions, consistency dummies, and seasonal coefficient sets, followed by decile ranking on fitted expected returns.
- **Main limitation:** The signal is more parameterized than a simple momentum sort and therefore more exposed to estimation noise and implementation complexity.
- **Why the paper matters:** It showed that winner consistency and tax-loss selling materially reshape the classic momentum/reversal picture, making past returns a much richer state variable than their cumulative total alone.
