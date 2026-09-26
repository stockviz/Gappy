# Bad News Travels Slowly: Size, Analyst Coverage, and the Profitability of Momentum Strategies
**Authors:** Harrison Hong, Terence Lim, Jeremy C. Stein
**Year:** 2000
**Journal/Venue:** Journal of Finance

## Problem statement

The Hong-Stein gradual-information-diffusion model says momentum should be strongest where information spreads slowly. This paper asks how to operationalize that prediction in the cross section. The key question is: **does momentum become stronger among stocks with slower information diffusion, proxied by firm size and analyst coverage, and is the effect especially pronounced for bad news?**

The paper is therefore a direct empirical test of a specific mechanism, not a generic correlation exercise.

## Approach (short)

The authors use two proxies for information diffusion:

- firm size,
- residual analyst coverage.

Momentum is constructed from past six-month winners and losers and then examined within size groups and within analyst-coverage groups. Analyst coverage is orthogonalized to size via monthly cross-sectional regressions of `log(1 + analysts)` on size and related controls. The results show:

- excluding the tiniest names, momentum falls with size,
- holding size fixed, momentum is stronger for low residual-coverage stocks,
- the low-coverage effect is much stronger for past losers than for past winners.

## Approach (detailed)

### 1. Start from a mechanism, not just a sorting variable

The paper's theory is the gradual-information-diffusion model of Hong and Stein (1999). In that model, firm-specific information reaches investors only slowly. If that is true, one should be able to find momentum precisely where information diffusion is slowest.

The empirical challenge is to proxy for the speed of diffusion. The paper uses:

- **firm size** as a broad proxy,
- **analyst coverage** as a more direct proxy for how much information processing the stock receives.

### 2. Define the baseline momentum strategy

The return-sorting methodology is close to Jegadeesh-Titman, but the paper often works with **30/30 portfolios** rather than only deciles:

- past six-month losers in the bottom 30%,
- past six-month winners in the top 30%,
- monthly rebalancing,
- future holding-period returns over the next six months.

The paper refers to this as the `P3 - P1` winners-minus-losers strategy in some tables.

The point of using the same basic momentum signal throughout is to isolate how its profitability changes when the information-diffusion proxies change.

### 3. Measure analyst coverage and residualize it

Raw analyst coverage is strongly correlated with size, so it cannot be used naively. The paper obtains monthly analyst counts from I/B/E/S, then estimates monthly cross-sectional regressions of:

$$
\log(1+\text{Analysts}_{i,t})
$$

on variables that primarily capture size and exchange effects, with the baseline specification using:

- log size,
- a Nasdaq dummy.

The residual from this regression is **residual analyst coverage**. That residual is the key conditioning variable:

- negative residual = less coverage than a stock of that size would normally receive,
- positive residual = more coverage than expected for that size.

This is a clean design choice. It makes coverage informative *conditional on size* rather than simply duplicating a size sort.

### 4. Examine momentum across size deciles

The first test sorts stocks into size classes and computes momentum within each size bucket. The paper finds a nonmonotonic pattern:

- among the extremely smallest stocks, momentum is weak or even negative, likely because market-making frictions and reversals dominate;
- after that extreme tail, momentum peaks in smaller stocks and then declines sharply as size increases.

So the information-diffusion story is not "smaller is always better." It is "once microstructure distortions are left behind, slower-diffusing stocks exhibit stronger momentum."

### 5. Examine momentum across residual-coverage groups

The second and more important test sorts stocks independently by residual analyst coverage, typically into:

- low coverage,
- medium coverage,
- high coverage.

Then momentum is measured inside these groups. The central finding is that low residual-coverage stocks exhibit substantially stronger momentum than high residual-coverage stocks.

Because coverage has already been residualized, this is not just a size effect in disguise.

### 6. Combine size and coverage to test the interaction explicitly

The most convincing tests are double sorts:

1. sort into size classes;
2. within each size class, sort into low, medium, and high residual-coverage groups;
3. compute momentum within each cell.

This shows that the coverage effect is strongest precisely where the information-diffusion story predicts it should be:

- among smaller stocks where diffusion frictions are more plausible,
- and weakens among the largest stocks where information is already widely processed.

### 7. Separate winners from losers

The paper then looks at the two sides of momentum separately. This is one of its best empirical choices.

The low-coverage effect is much more pronounced for **past losers** than for past winners. That means bad news travels especially slowly. In practical terms:

- low-coverage losers keep underperforming for longer,
- high-coverage losers bottom out sooner.

This asymmetry is exactly what the title emphasizes and is one of the strongest pieces of evidence for the diffusion mechanism.

### 8. Study the entire post-formation return path

The authors do not stop at one holding-period average. They track cumulative beta-adjusted returns out to roughly 36 months after formation for low-coverage and high-coverage portfolios.

The return path shows:

- high-coverage momentum flattens out relatively quickly;
- low-coverage momentum persists much longer.

This dynamic shape is important because it matches the theory directly: slow diffusion should lengthen the adjustment process, not just increase month-1 alpha.

### 9. Add stock-level serial-correlation tests

The paper also runs Fama-MacBeth-style cross-sectional regressions of individual-stock serial correlation on:

- log analyst coverage,
- log size,
- and interactions.

These tests complement the portfolio results by showing that lower coverage and smaller size are associated with more positive return autocorrelation at the stock level.

### 10. What the paper actually establishes

Methodologically, the paper's contribution is to turn "slow diffusion" into an observable cross-sectional design:

1. measure momentum conventionally;
2. residualize analyst coverage against size;
3. sort momentum profitability by that residual;
4. isolate the loser side;
5. track how long the continuation lasts.

That sequence is why the evidence is stronger than a simple statement that "small or neglected stocks have more momentum."

## Domain of applicability

- **Where it works well:** Equity universes with analyst-coverage data and enough cross-sectional depth to separate size from information-attention effects.
- **What is implementable:** Momentum signals conditioned on residual analyst coverage, with special caution on the loser side where slow diffusion of bad news is strongest.
- **Main limitation:** Analyst coverage is not a perfect measure of information diffusion and can still embed other frictions such as shorting difficulty and attention effects.
- **Why the paper matters:** It remains one of the cleanest empirical tests of a specific momentum mechanism rather than a reduced-form anomaly description.
