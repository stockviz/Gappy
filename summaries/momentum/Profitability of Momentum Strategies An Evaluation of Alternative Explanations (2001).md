# Profitability of Momentum Strategies: An Evaluation of Alternative Explanations
**Authors:** Narasimhan Jegadeesh, Sheridan Titman
**Year:** 2001
**Journal/Venue:** Journal of Finance

## Problem statement

After the original 1993 paper, two major questions remained:

1. were the original momentum profits a data-mined accident,
2. and which broad class of explanation fits the full return path better: persistent expected-return differences, delayed overreaction, or some hybrid?

This paper addresses both by extending the sample and by looking carefully at what happens **after** the initial momentum holding period.

## Approach (short)

The paper reconstructs the standard six-month ranking / six-month holding momentum strategy on a broader 1965-1998 sample, with special attention to the out-of-sample 1990-1998 period. Stocks priced below `$5` and the smallest NYSE size-decile firms are removed to reduce microstructure contamination. The authors then:

1. test whether momentum remains profitable in the 1990s,
2. decompose performance by long and short side,
3. trace the strategy's post-formation returns for up to 60 months,
4. compare the resulting path to the predictions of Conrad-Kaul and behavioral delayed-overreaction stories.

The main result is that momentum clearly survives out of sample, but the longer-horizon post-holding pattern shows eventual reversal inconsistent with a pure unconditional-drift explanation.

## Approach (detailed)

### 1. Build an out-of-sample test of the original strategy

The first methodological move is straightforward but important: the authors rerun the original momentum design on data that extend beyond the original study period.

The baseline sample:

- includes NYSE, AMEX, and Nasdaq stocks,
- excludes stocks below `$5`,
- excludes the smallest NYSE market-cap decile.

These exclusions are important because they reduce the chance that the out-of-sample evidence is driven by tiny illiquid stocks or bid-ask bounce.

### 2. Use the standard momentum construction

The core strategy remains the canonical winner-minus-loser portfolio:

1. rank on the previous six months of returns,
2. form winner and loser portfolios,
3. hold for six months with overlapping vintages,
4. compute monthly strategy returns.

The authors also separate small and large stocks and examine January versus non-January payoffs, because these are places where alternative explanations often differ.

### 3. Check whether the anomaly survives the 1990s

The out-of-sample test is the first substantive result. Over 1990-1998, momentum returns look remarkably similar to the 1965-1989 evidence. That weakens the pure data-snooping objection.

This is methodologically valuable because it shifts the literature from "is momentum real?" to "what explains it?"

### 4. Compare long and short side behavior

The paper again checks whether profits come mostly from winners or losers. It finds that both sides matter. This is useful because some implementation-based objections, such as short-sale cost stories, would suggest that the short side should disappear or weaken disproportionately.

### 5. Use post-holding returns to discriminate among theories

This is the core of the paper. The authors explicitly compare three broad views:

- **underreaction / delayed overreaction** models,
- **Conrad-Kaul style unconditional drift differences**,
- **risk-based stories tied to factor exposures**.

To do this, they examine the returns of momentum portfolios for as long as **60 months after formation**. The logic is:

- if momentum only reflects cross-sectional differences in unconditional expected returns, the post-holding returns should not systematically reverse;
- if momentum partly reflects overreaction that unfolds slowly, then the post-holding returns should eventually turn negative.

### 6. Plot cumulative profits over the full event window

The event-time methodology is especially important. The paper tracks cumulative profits from formation through the first 12 months and then through months 13-60. The result is:

- significant positive profits in the first 12 months,
- followed by later negative returns that unwind a meaningful portion of the initial gains.

This shape is inconsistent with the strongest form of the unconditional-drift explanation.

### 7. Risk-adjust the post-holding returns

The authors do not stop at raw returns. They adjust the post-holding performance using Fama-French factor models and also examine the January effect separately. The reversal remains visible, although the magnitude depends on:

- sample composition,
- horizon,
- and whether the returns are risk-adjusted.

That nuance is one of the paper's strengths. It does not overclaim more than the data support.

### 8. Compare subperiods and size groups

The paper checks whether the post-holding reversal is stable across:

- 1965-1981 versus 1982-1998,
- large versus small firms,
- January versus non-January months.

Momentum itself is fairly stable in the first year across subperiods. The longer-run reversal is more variable, but it remains strong enough overall to reject the cleanest unconditional-drift story.

### 9. What the paper actually establishes

The methodological contribution is not the basic momentum construction, which was already known. It is the **post-holding-period test** as a theory discriminator.

The paper shows:

1. the original momentum finding was not a sample-specific accident;
2. looking only at the first 6 to 12 months is insufficient for interpretation;
3. the full event-time path is more consistent with some eventual correction than with a pure constant-drift explanation.

That made the paper central in shifting the literature from discovery to explanation.

## Domain of applicability

- **Where it works well:** Equity momentum research where the goal is to understand not only the holding-period alpha but also the full life cycle of the signal.
- **What is implementable:** The paper's main reusable method is event-time tracking of winner-minus-loser portfolios out to 60 months after formation.
- **Main limitation:** Post-holding reversal is sensitive to sample composition and risk adjustment, so the evidence supports behavioral-style corrections but not in a completely knife-edge way.
- **Why the paper matters:** It is one of the strongest demonstrations that interpreting momentum requires looking beyond the initial holding window.
