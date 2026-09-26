# Unpacking Price Momentum: The Need for Speed
**Authors:** Nomura Global Quantitative Research
**Year:** 2009
**Journal/Venue:** Nomura practitioner research note

## Problem statement

This note asks a narrower but practically important question than most academic momentum papers: **how much of momentum's efficacy depends not on the signal definition itself, but on the exact rebalance schedule?**

The motivation is empirical. Around the tech bubble and again during the 2008-2009 crisis, the same momentum idea behaved very differently depending on whether portfolios were rebalanced quarterly, monthly, at month-end, or mid-month.

## Approach (short)

The note studies Russell 1000 long-short portfolios built from:

- **one-year momentum**: long top 100, short bottom 100 on trailing one-year return excluding the most recent month;
- **one-month momentum / reversal**: long bottom 100, short top 100 on the prior month.

It then varies only the rebalance schedule:

- quarterly,
- monthly end-of-month,
- monthly mid-month.

The main finding is that the required "speed" of rebalancing increased materially after about 2000. One-year momentum that worked under quarterly rebalancing before 2000 needed more frequent rebalancing later, and in crisis periods even the sign of one-month momentum could flip between reversal and continuation depending on whether rebalancing occurred mid-month or at month-end.

## Approach (detailed)

### 1. Hold the universe fixed

The paper uses the Russell 1000 universe throughout. That keeps the cross section stable and isolates the thing the note cares about: **timing of refresh**, not broad universe changes.

### 2. Define one-year momentum in the standard way

The one-year signal is:

- trailing one-year return,
- excluding the most recent month.

So the signal is effectively the classic `12-1` or `12-2` style momentum input. The portfolio each rebalance date is:

- long the top 100 stocks,
- short the bottom 100 stocks,
- equal-dollar long-short.

### 3. Compare quarterly and monthly rebalancing

The first experiment is simple: take the same one-year signal and compare:

- quarterly rebalancing,
- monthly rebalancing.

The note shows that quarterly rebalancing worked well before roughly 2000 but lost much of its efficacy afterward, while monthly rebalancing remained viable, though weaker than in the pre-2000 era.

The interpretation is that the **half-life of the signal shortened**. Information or crowd behavior was being arbitraged away faster, so stale positions lost value sooner.

### 4. Compare month-end and mid-month rebalancing

The second experiment keeps monthly frequency but changes the **calendar position** of the rebalance:

- end-of-month,
- mid-month.

This turns out to matter materially. In several periods, especially after 2000, mid-month rebalancing outperformed end-of-month rebalancing. The note interprets this as evidence that factor efficacy itself has become more time-sensitive and that crowded calendar conventions can dilute or distort a signal.

### 5. Reexamine one-month momentum as reversal versus continuation

The most interesting diagnostic in the note is for one-month momentum. One-month past return is usually treated as a **reversal** signal:

- buy last month's losers,
- short last month's winners.

The note uses exactly that construction on the Russell 1000, again with top and bottom 100 stocks, and then asks whether the signal behaves as reversal or continuation under different rebalance dates.

During much of the 2007-2008 crisis:

- end-of-month rebalancing made one-month momentum look like **continuation**,
- mid-month rebalancing made it look like **reversal**.

So the same raw signal changed sign depending only on when it was harvested.

### 6. Use crisis episodes as natural experiments

The note emphasizes two episodes:

- the tech bubble and crash,
- the 2008-2009 crisis.

These episodes show that rebalance timing is most consequential when the market's cross-sectional adjustment speed changes abruptly. In those periods, factor efficacy can migrate within the month, so a mechanically fixed rebalance date can turn an otherwise sound signal into a stale one.

### 7. What the note is actually teaching

This is not a theory note about why momentum exists. It is a note about **implementation decay**. Its methodological message is:

1. define the signal as usual,
2. vary only the rebalance schedule,
3. interpret performance changes as evidence about the signal's current half-life.

That makes rebalance-date sensitivity a diagnostic for how quickly the market is digesting the information the signal is trying to exploit.

## Domain of applicability

- **Where it works well:** Large-cap quantitative equity implementations where the signal can be refreshed at different calendar frequencies.
- **What is implementable:** Side-by-side testing of quarterly, monthly, month-end, and mid-month rebalancing for the same factor signal.
- **Main limitation:** The note is a practitioner diagnostic rather than a full structural model, so it documents the need for speed more clearly than it explains its ultimate cause.
- **Why the paper matters:** It shows that rebalance timing is not an execution detail but part of the signal definition itself.
