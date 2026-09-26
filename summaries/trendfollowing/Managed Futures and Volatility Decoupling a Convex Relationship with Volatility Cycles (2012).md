# Managed Futures and Volatility: Decoupling a "Convex" Relationship with Volatility Cycles
**Authors:** Kathryn M. Kaminski
**Year:** 2012
**Journal/Venue:** Alpha K Capital white paper

## Problem statement

Managed futures are often described as "long volatility" because they tend to perform well in crises and their payoff against equities looks convex. But that label failed badly as a guide in 2010 and 2011, when volatility rose and managed futures did not always deliver the protection allocators expected. Kaminski's question is: **what does "long volatility" actually mean for managed futures, and under what volatility regimes does the label hold or fail?**

## Approach (short)

The paper replaces the static label "long volatility" with a regime-based framework built on **volatility cycles**. Negative volatility cycles begin with bad shocks, de-leveraging, fear, and persistent trends; positive volatility cycles begin with good shocks, exuberance, run-ups, and then sharp reversals. Managed futures profit strongly in the first regime because synchronized deleveraging creates trends that CTAs can ride. They can lose in the second regime because fast reversals punish leveraged trend systems. Empirically, managed futures are only weakly positively correlated with changes in volatility overall, but perform very well during rising-volatility episodes triggered by negative equity events and poorly during rising-volatility episodes triggered by positive equity events.

## Approach (detailed)

### 1. Behavioral definition of volatility cycles

The note's organizing device is behavioral rather than option-theoretic.

**Negative volatility cycle**

1. A bad surprise hits markets.
2. Investors perceive threat.
3. They scramble to cut risk, de-lever, and dump exposures.
4. Trends become persistent because many players act in the same direction.
5. Volatility rises sharply and remains high while investors stay traumatized.

**Positive volatility cycle**

1. A good surprise generates confidence and risk-seeking.
2. Prices run up as investors chase performance.
3. Leverage and hidden risks build beneath the surface.
4. Reversal eventually arrives, often abruptly.
5. The reversal can even seed a later negative volatility cycle.

This distinction matters because the same headline observation, "volatility rose", hides very different market microeconomics.

### 2. Clarifying what "long volatility" can mean

Kaminski separates several concepts that are often conflated.

- **Pure-play long volatility:** directly long volatility futures, variance swaps, or similar instruments. This should have a large positive correlation with changes in volatility.
- **Pure-play short volatility:** the opposite.
- **Convex long-volatility strategy:** a strategy that performs well in extreme events because its payoff is convex, even if it is not mechanically long a volatility contract.
- **Concave short-volatility strategy:** a strategy with frequent small gains and episodic large losses, often through leverage, liquidity mismatch, or hidden short-option exposure.

Managed futures belong in the third category, not the first. That is the paper's first correction to common allocator language.

### 3. Why equities are structurally short volatility

The note argues that equities are negatively correlated with changes in volatility because investors' risk preferences are state dependent. Losses increase fear, shrink risk appetite, and raise volatility further. This is presented as a behavioral rather than purely balance-sheet explanation of the well-known inverse equity-volatility relationship.

That matters because many hedge fund strategies inherit an equity-like short-volatility bias through liquidity, credit, leverage, or crowded carry. Managed futures, being exchange-traded and liquid, start from a cleaner base but are not immune to volatility-related losses.

### 4. Managed futures are only weakly long volatility on average

A central empirical point is that the overall correlation between managed futures and changes in volatility is only slightly positive, around 7%, whereas equity markets are strongly negative against volatility. If managed futures were a pure-play long-volatility trade, that number should be much larger.

So the average correlation already says: something conditional is going on.

### 5. Conditioning on volatility breakouts

The paper then conditions on months when volatility breaks upward relative to its recent history. Over January 1990 to January 2012, the sample contains 51 such months. Kaminski splits them into two groups:

- breakouts triggered by **negative** equity returns,
- breakouts triggered by **positive** equity returns.

The contrast is stark:

- when rising volatility follows negative equity events, managed futures post strong positive returns;
- when rising volatility follows positive equity events, managed futures often post negative returns.

This is the empirical core of the paper. Managed futures are not generically long volatility. They are **long volatility in threat-driven, trend-producing crises** and can be **effectively short volatility in exuberance-driven reversal episodes**.

### 6. Crisis alpha as the mechanism

The paper explains the good regime in terms of "crisis alpha". In major equity drawdowns, many investors share the same hidden risks:

- liquidity risk,
- credit/counterparty risk,
- leverage risk.

When those risks surface, everyone responds together. Synchronized behavior generates persistent trends across asset classes, and managed futures are one of the few strategies structurally able to exploit them rather than being forced sellers.

This is why the note treats 2007-2008 as the canonical managed-futures environment:

- hidden risks were large,
- deleveraging was synchronized,
- cross-asset trends were strong,
- CTAs captured the move.

### 7. Why 2010 and 2011 were different

The disappointing managed-futures performance in the Flash Crash and the 2011 euro-area turmoil is used to stress the regime point.

Kaminski gives several reasons:

1. Investors were still psychologically scarred by 2008, so risk preferences had already adjusted.
2. Hidden risks had been partially reduced; managed futures no longer held as large a competitive advantage.
3. The later shocks were smaller than the 2008 collapse.
4. The episodes involved faster reversals and more "positive-cycle" dynamics, which hurt levered trend systems.

This is where the note places managed futures' hidden short-volatility element: when the market whips violently rather than trending persistently, the same convex system can bleed from leverage and false reversals.

### 8. Main practical takeaway

The note's main portfolio-construction message is not "buy managed futures because they are long vol." It is:

- use managed futures when you want exposure to breakdowns in market efficiency and synchronized deleveraging,
- do not treat them as a generic substitute for a pure long-volatility program,
- understand that the strategy's efficacy depends on whether volatility expansion is associated with persistent trends or with quick reversals.

## Domain of applicability

- **Where it works well:** The framework is useful for allocator diagnostics. It explains why the same CTA program can look brilliant in one high-vol regime and disappointing in another.
- **What is actually supported empirically:** The empirical claim is conditional and descriptive. Managed futures perform well when volatility rises because markets are under threat and trend persistence appears. They can struggle when volatility rises during positive-cycle reversals.
- **Main limitations:** This is a white paper, not a formal econometric study. The volatility-breakout classification is heuristic, the sample is relatively small, and the behavioral narrative is suggestive rather than proved.
- **What it does not prove:** It does not derive a tradable rule for identifying volatility-cycle regime changes in real time. It also does not show that every managed-futures program shares the same regime sensitivity.
- **What is genuinely novel:** The paper's contribution is the decomposition of the generic "long volatility" label into two regimes. That is a real improvement over the usual allocator shorthand because it matches the lived fact that CTA protection is strong in some turbulent episodes and weak in others.
