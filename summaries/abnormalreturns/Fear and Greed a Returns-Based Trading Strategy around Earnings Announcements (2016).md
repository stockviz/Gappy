# Fear and Greed: a Returns-Based Trading Strategy around Earnings Announcements
**Authors:** Ivo Ph. Jansen, Andrei L. Nikiforov
**Year:** 2016
**Journal/Venue:** Journal of Portfolio Management

## Problem statement

Jansen and Nikiforov ask whether extreme stock-price moves in the week before an earnings announcement are partly sentiment-driven and therefore likely to reverse when the announcement arrives. The paper is built around a sharp institutional idea:

- right before scheduled earnings releases, information asymmetry is high,
- uninformed investors may overinterpret sharp price moves as signals of inside information,
- fear and greed can therefore push prices too far,
- and the earnings release itself serves as a public "reality check."

The question is whether this logic can be turned into an implementable short-horizon trading strategy.

## Approach (short)

The paper defines a contrarian event strategy:

1. identify stocks with extreme abnormal returns over days `-5` to `-1` relative to the earnings announcement date,
2. on day `0`, go long the extreme pre-announcement losers and short the extreme pre-announcement winners,
3. hold through day `+1`.

The screen uses several cutoffs for "extreme," notably `5%`, `10%`, and `15%` abnormal return thresholds in the pre-announcement window. Performance is measured with buy-and-hold abnormal returns (`BHAR`) in the `(0,+1)` holding window relative to size benchmarks, with robustness checks using market-model and Fama-French adjustments.

The core result is economically large: for the `10%` screen, the two-day reversal is about `1.3%` before costs and remains positive after conservative transaction-cost assumptions.

## Approach (detailed)

### 1. Why anchor the trade to earnings announcements?

The paper's contribution is not a generic one-week reversal strategy. It is a reversal strategy **conditioned on a known information event**. The authors argue that earnings announcements are the natural anchor because:

- the announcement date is known in advance,
- information asymmetry rises before the release,
- and the release injects fundamental information that can correct sentiment-driven price moves.

This is crucial. The strategy is designed to harvest reversals only when a public signal is about to arrive and potentially discipline pre-event speculation.

### 2. Screen window and holding window

The signal is defined on the week before the announcement:

- **screen window:** day `-5` through day `-1`,
- **holding window:** day `0` through day `+1`.

These exact windows are important. The authors later show that extending the holding window to `+10` weakens performance, and extending the screen window back to `-7`, `-10`, or `-20` also weakens the strategy. So the economic action is concentrated in a narrow pre-announcement and immediate-post-announcement interval.

### 3. Identify extreme abnormal returns before the announcement

For each earnings event, the paper computes abnormal returns over the pre-announcement screen window and classifies observations as extreme using thresholds such as:

- less than `-5%` or greater than `+5%`,
- less than `-10%` or greater than `+10%`,
- less than `-15%` or greater than `+15%`.

The `10%` threshold is the central case.

The trading rule is then:

- **long** stocks with extreme negative pre-announcement abnormal returns,
- **short** stocks with extreme positive pre-announcement abnormal returns.

This is a pure contrarian rule. It does not try to infer whether the news will be good or bad. It assumes only that the pre-announcement move is too large relative to fundamentals on average.

### 4. Abnormal-return measurement

The main performance metric is buy-and-hold abnormal return over days `(0,+1)`:

$$
BHAR_{(0,+1)} = \prod_{t=0}^{1}(1+r_t) - \prod_{t=0}^{1}(1+r^{bench}_t).
$$

The main benchmark is size-adjusted return, motivated by the fact that size is a strong determinant of event-window abnormal returns. The authors also check robustness using:

- a market-model benchmark,
- and Fama-French style adjustments.

The qualitative results are similar across these methods.

### 5. Main findings

Using the `10%` cutoff, the paper finds:

- large negative pre-announcement abnormal returns for the long side,
- large positive pre-announcement abnormal returns for the short side,
- and a combined `(0,+1)` reversal of about `1.3%`.

Annualized mechanically, this is very large, though the annualization should not be mistaken for a scalable every-day strategy. The more relevant fact is that the two-day event-window reversal is economically meaningful and statistically strong.

### 6. Why the interpretation is not just generic short-term reversal

The authors run an important placebo-style comparison. They look at comparable non-earnings-announcement dates in the same fiscal quarter and find that reversals around the actual earnings date are about `60%` larger than around those other dates.

This is key for interpretation. It suggests the strategy is not merely exploiting generic one-week overreaction. The earnings announcement itself is doing work as a corrective event.

### 7. Robustness across environments

The paper checks the strategy across:

- years,
- bull versus bear market conditions,
- firm-size terciles,
- liquidity terciles.

The strategy remains broadly profitable in these partitions. That helps because one might otherwise suspect the result is driven by a small illiquid subsample or one unusual market phase.

### 8. Transaction costs

The authors also examine the strategy net of conservative transaction-cost assumptions for the post-2000 period and still find positive abnormal returns, around `0.76%` over the two-day window. Since the strategy is short-horizon and event-driven, this check is essential. Without it, the gross reversal would be hard to interpret economically.

### 9. Design choices that sharpen the interpretation

Several design details are doing real work:

1. the event date is known in advance, so the strategy is implementable;
2. the screen window is short, isolating the final pre-announcement period of maximal uncertainty;
3. the holding window is even shorter, focusing on the immediate correction;
4. robustness to moving day `-1` between screen and holding windows addresses possible information leakage;
5. comparison to other pre-quarter dates helps distinguish event-linked correction from ordinary reversal.

This is why the paper is more than a slogan about fear and greed. It is a tightly specified event study with a trading interpretation.

### 10. What the result means

The paper's interpretation is that pre-announcement extreme moves often reflect the market's attempt to infer information from price changes themselves when little public information is otherwise available. Some of that inference is excessive. When the actual earnings release arrives, prices partially reverse.

So the paper is related to both:

- short-term reversal,
- and post-earnings-announcement research.

But it is identical to neither. It uses the scheduled earnings event as the point where sentiment-driven mispricing is most likely to be corrected.

## Domain of applicability

- **Where it works well:** Short-horizon event trading around scheduled earnings announcements, especially when one wants a rule that is implementable from a known event calendar.
- **What is implementable:** A contrarian long-short strategy using pre-announcement abnormal returns over days `-5` to `-1`, entry on day `0`, exit on day `+1`, and size-adjusted or factor-adjusted abnormal-return evaluation.
- **Main limitation:** The strategy is turnover-heavy, event-dependent, and sensitive to execution and borrow costs on the short side.
- **Why the paper matters:** It shows that the earnings announcement can be used as a scheduled reality check for short-term sentiment-driven price extremes, making a classic behavioral story operational in a tightly defined trading rule.
