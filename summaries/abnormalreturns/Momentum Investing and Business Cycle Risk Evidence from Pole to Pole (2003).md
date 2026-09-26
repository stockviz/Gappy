# Momentum Investing and Business Cycle Risk: Evidence from Pole to Pole
**Authors:** John M. Griffin, Xiuqing Ji, J. Spencer Martin
**Year:** 2003
**Journal/Venue:** Journal of Finance

## Problem statement

One rational explanation for momentum is that winner-minus-loser returns compensate investors for macroeconomic or business-cycle risk. This paper asks whether that story survives a broad international test. The precise question is: **do standard unconditional macro factors, conditional macro forecasting models, or business-cycle state classifications explain international momentum profits across a large cross section of countries?**

The paper is designed as a falsification exercise. If standard macro-risk explanations are right, they should work especially well when tested across many countries rather than only one market.

## Approach (short)

The paper constructs momentum strategies in 40 countries using the standard `6/6` design with a one-month skip:

1. rank stocks on months `t-7` through `t-2`,
2. buy the top 20 percent and short the bottom 20 percent,
3. hold for months `t` through `t+5`,
4. maintain six overlapping vintages.

It then applies three tests. First, it estimates unconditional Chen-Roll-Ross style macro-factor models in the subset of markets with the necessary macro data. Second, it runs conditional forecasting models in the spirit of Chordia and Shivakumar using rolling 60-month windows of lagged macro instruments. Third, it tests whether momentum profits differ across good and bad macro states and whether they reverse after the holding period. The paper finds that conventional macro-risk models explain very little of international momentum, while long-run reversal is widespread.

## Approach (detailed)

### 1. Construct the same momentum trade country by country

For each country, the paper uses a classic relative-strength strategy:

1. form ranking-period returns over the previous 6 months;
2. skip one month to avoid short-term microstructure and reversal contamination;
3. define winners as the top 20 percent of stocks and losers as the bottom 20 percent;
4. hold the winner-minus-loser position for 6 months;
5. rebalance monthly, so six overlapping vintages are simultaneously active.

Because many countries do not have enough stocks to form deciles, the paper uses top and bottom quintiles or 20 percent groups rather than strict deciles outside the largest markets. Returns are measured in local currency.

This construction is important because the paper is testing the rational explanation of the standard momentum anomaly, not a tailored international strategy.

### 2. Start by documenting that momentum is broadly present

Before any risk modeling, the authors show that the `6/6` strategy is profitable in many of the 40 countries and at the regional level. That establishes the object that needs to be explained. They also examine whether profits come from winners, losers, or both by comparing each side to the local market index.

This preliminary step matters because the explanatory models are evaluated against actual country-level momentum series, not against pooled cross sections only.

### 3. Test the unconditional macro-risk story in the Chen-Roll-Ross framework

The first family of tests asks whether momentum profits load on standard macroeconomic factors. In the subset of 17 markets with the required data, the paper constructs monthly country-specific versions of the Chen et al. style factors:

- unexpected inflation (`UI`),
- changes in expected inflation (`DEI`),
- term spread (`UTS`),
- growth in industrial production (`MP`).

The default-risk premium factor used in some U.S. settings is harder to build internationally, so the feasible country set is smaller and the factor set is adjusted accordingly.

The idea is straightforward: if momentum is compensation for macroeconomic risk, winner-minus-loser returns should be significantly related to these factor innovations. The paper runs factor-model tests in that spirit and finds very weak exposure patterns. Standard macro shocks do not line up with the international momentum premium in an economically convincing way.

### 4. Test the conditional macro-risk story with rolling forecasting regressions

The second family of tests is more sympathetic to the risk-based view. Maybe momentum is not explained by contemporaneous macro shocks, but by *time-varying expected returns* forecast by lagged macro instruments.

The paper therefore uses a Chordia-Shivakumar style design. For each country `j`, it estimates rolling regressions over the prior 60 months:

$$
WML_{j,t} = \alpha_j + \beta_{1,j} DIV_{j,t-1} + \beta_{2,j} TERM_{j,t-1} + \beta_{3,j} YLD_{j,t-1} + \varepsilon_{j,t},
$$

with at least 12 observations required in the window. The lagged instruments include country-level variables such as:

- dividend yield,
- term spread,
- short-rate or yield measures.

The model is then used to generate predicted momentum profits country by country and compare them to realized profits.

This is a demanding test. If the conditional business-cycle story is correct, predicted and realized country momentum profits should line up meaningfully. The paper shows that they do not.

### 5. Compare observed and model-implied momentum across countries

One useful visualization regresses or plots average observed momentum profits against average model-predicted momentum profits for each country. If the model worked, points would line up near the 45-degree line and the countries with high average momentum would be the same countries where the macro model predicts high momentum.

Instead, the fit is poor. The model-implied profits do not explain the cross-country pattern of realized momentum returns.

This is one of the strongest pieces of evidence because it shows the failure at the country level, not only in an aggregate panel.

### 6. Examine business-cycle states directly

The paper then leaves the factor-model framework and asks a simpler state-based question. If momentum is a macro-risk premium, it should behave differently in:

- good versus bad GDP-growth states,
- up versus down aggregate stock-market states,
- expansions versus recessions.

The paper classifies states using GDP growth, market movements, and, in some replications, NBER-style recession dating where relevant. It then tabulates average momentum returns inside each state.

The critical finding is that momentum profits are generally positive in both good and bad states. That is hard to reconcile with a standard premium for bearing business-cycle risk. A genuine macro-risk premium should pay off especially for enduring pain in bad states, not appear similarly profitable across both sides of the cycle.

### 7. Check whether skipping one month is driving the result

Because some earlier studies used no skip between formation and holding periods, the paper explicitly compares skipped and unskipped implementations. The skip is important:

- without the skip, microstructure and very short-term reversal contaminate the strategy;
- with the skip, the relation to the conditional business-cycle story weakens even further.

This is methodologically important because some apparent support for the risk view can be sensitive to that one-month design choice.

### 8. Study post-holding-period reversal

The paper then asks what happens **after** the standard 6-month holding period. For each momentum portfolio formed at time `t`, it tracks cumulative returns not only over `t` through `t+5`, but also over three further nonoverlapping 6-month windows:

- `t+6` through `t+11`,
- `t+12` through `t+17`,
- `t+18` through `t+23`.

This is a crucial discriminant:

- many behavioral stories allow momentum followed by later reversal;
- a simple rational risk premium based on persistent expected-return differences is much less comfortable with sharp unwinds.

The paper finds strong evidence of long-run reversal internationally.

### 9. Separate January from the rest of the year

Because tax-loss selling and seasonality could contaminate reversal evidence, the paper also splits the post-holding returns into:

- January,
- non-January months.

January contributes, but reversal is not confined to it. That matters because it weakens the objection that the post-momentum unwind is just a single-month tax effect.

### 10. What the paper actually rules out

The contribution is not that **all** rational stories fail. It is that the leading *standard* macro-risk implementations fail:

1. unconditional Chen et al. style factor models,
2. conditional forecasting models based on lagged macro instruments,
3. simple good-state / bad-state business-cycle interpretations.

At the same time, the widespread long-run reversal evidence pushes the reader toward explanations with underreaction followed by eventual correction, or at least toward richer nonlinear risk stories than the standard business-cycle models provide.

### 11. What a reader should implement

A faithful implementation of the paper's method is:

1. build `6/6` momentum with a one-month skip country by country;
2. maintain overlapping monthly vintages;
3. estimate country-level unconditional macro-factor exposures where data exist;
4. estimate rolling 60-month conditional momentum forecasts from lagged macro instruments;
5. compare realized and predicted country momentum;
6. tabulate profits by GDP and market states;
7. follow each momentum portfolio beyond the holding period to test for long-run reversal.

This is not a trading manual so much as a diagnostic protocol for ruling out standard macro-risk explanations.

## Domain of applicability

- **Where it works well:** International equity momentum and any attempt to explain it with conventional macroeconomic state variables.
- **What is implementable:** A country-by-country diagnostic framework combining unconditional factor tests, conditional forecasting tests, state sorting, and long-run reversal tracking.
- **Main limitation:** The paper rejects standard macro specifications, but it does not exhaust every nonlinear or disaster-risk model one could write down.
- **Why the paper matters:** It is one of the clearest large-sample demonstrations that standard business-cycle risk is too weak an explanation for international momentum.
