# Momentum and Mean Reversion Across National Equity Markets
**Authors:** Ronald J. Balvers, Yangru Wu
**Year:** 2006
**Journal/Venue:** Journal of Empirical Finance

## Problem statement

Momentum and mean reversion are usually studied in separate literatures, almost as if they were different species of predictability. But that is unsatisfactory. If short-run continuation and long-run reversal are both present, then estimating one while omitting the other will bias both the strength and duration of the effects. This paper asks: **can national equity returns be modeled in a way that nests both momentum and mean reversion, and does a strategy that combines the two outperform pure momentum and pure contrarian rules?**

This is important because the real portfolio problem is not choosing which literature to believe. It is deciding how to weight continuation versus reversal when they point in opposite directions.

## Approach (short)

The paper studies monthly returns on 18 developed-country equity markets and models each country's relative return as the sum of:

- a global component that can contain the permanent shock,
- a country-specific transitory component that can exhibit both momentum and mean reversion.

This yields an explicit expected-return decomposition into a momentum term and a mean-reversion term. Trading on the combined forecast outperforms pure momentum and pure mean-reversion strategies, even after standard risk adjustments and transaction costs.

## Approach (detailed)

### 1. Write the price index as global permanent plus local transitory

The structural assumption is that only global shocks have permanent effects on national equity indexes. Country-specific deviations are transitory. Formally, the log price index is written as a product of:

- a world component with permanent shocks,
- a country-specific component that can wander in the short run but must eventually revert.

That makes mean reversion natural in **relative** country performance, not necessarily in absolute local-currency price levels.

### 2. Allow the transitory component to have both reversion and continuation

The country-specific component `x_t^i` is then specified so that it can contain both:

- autoregressive pullback toward equilibrium,
- and lagged-return continuation.

In the paper's notation this takes the form

$$
x_t^i = \lambda_i + d_i x_{t-1}^i + \sum_{j=1}^J q_{ij} r_{t-j}^i + \eta_t^i,
$$

where:

- `d_i < 1` governs mean reversion,
- the `q_{ij}` coefficients capture momentum over the last `J` months,
- and `\eta_t^i` is the idiosyncratic shock.

This is the core modeling move. Momentum and mean reversion enter one state equation rather than being estimated in separate predictive regressions.

### 3. Derive an expected-return decomposition

From the structural model, excess country return can be written as:

$$
r_t^i - \beta_i r_t^w = MRV_t^i + MOM_t^i + \varepsilon_t^i,
$$

where:

- `MRV_t^i` is the mean-reversion component,
- `MOM_t^i` is the continuation component,
- `r_t^w` is the world market return,
- and `\varepsilon_t^i` is the residual shock.

This is the paper's main payoff. Instead of saying vaguely that both effects are present, the model produces a country-by-country monthly forecast from each source.

### 4. Show analytically why partial models are biased

The paper then studies misspecification. If the true process contains both components:

- estimating mean reversion without momentum biases the speed of reversion downward and makes the half-life look longer;
- estimating momentum without mean reversion biases the momentum coefficient downward and can even shorten the inferred momentum horizon.

This is one of the paper's strongest contributions. It explains why separate literatures can report apparently conflicting horizons even when they are looking at the same underlying process.

### 5. Estimate the model by maximum likelihood on 18 MSCI country indexes

The empirical application uses monthly MSCI returns for 18 developed countries from December 1969 to December 1999. The baseline model uses:

- one-month holding periods,
- momentum lags up to 12 months,
- pooled or restricted versions of some parameters to keep estimation tractable.

The parameters are estimated by maximum likelihood. Once estimated, the model gives for each country and month:

- the expected return coming from mean reversion,
- the expected return coming from momentum,
- the total conditional expected return.

### 6. Trade the conditional forecast directly

The strategy is not a simple equal-weighted sort on past returns. Each month:

1. compute the model-implied conditional expected return for every country;
2. buy the market or markets with the highest forecast;
3. short the markets with the lowest forecast;
4. hold for one month and repeat.

The paper compares this combined strategy with:

- a pure momentum rule,
- and a pure mean-reversion rule.

The combined rule outperforms both, with reported monthly excess returns in the 1.1% to 1.7% range before various adjustments.

### 7. Quantify the interaction between the two forecasts

The estimated momentum and mean-reversion components are materially negatively correlated. Economically this means:

- a market that has recently run up may still have short-run continuation left;
- but the same run-up also moves it farther from long-run relative equilibrium.

The trading problem is therefore not binary. One needs the net conditional forecast after both forces are accounted for.

### 8. Interpret the persistence correctly

A useful result of the joint specification is that:

- momentum lasts longer than a pure-momentum model would suggest,
- while mean reversion acts faster than a pure-contrarian model would suggest.

Those statements are not contradictory. They reflect the fact that each partial model is trying to absorb variation that belongs to the omitted component.

### 9. What a reader should implement

A faithful implementation is:

1. take monthly country equity returns and a world benchmark return;
2. estimate a state equation for country-specific deviations that contains both autoregressive reversion and lagged-return continuation;
3. compute the separate `MRV` and `MOM` expected-return terms each month;
4. rank countries by the combined conditional forecast;
5. trade the highest against the lowest forecast with a one-month horizon;
6. compare the realized performance with pure momentum and pure contrarian variants.

The important lesson is not to blend two signals heuristically. It is to estimate them jointly from a model that respects both.

## Domain of applicability

- **Where it works well:** Cross-country equity allocation, relative-value asset allocation, and any setting where long-run anchors and short-run continuation plausibly coexist.
- **What is implementable:** A country-rotation strategy that explicitly combines continuation and reversal rather than choosing one horizon and ignoring the other.
- **Main limitation:** The model is stylized and index-level. It is not a micro-founded explanation of firm-level momentum.
- **Why the paper matters:** It provides one of the clearest frameworks for combining momentum and mean reversion without double counting or biasing either one.
