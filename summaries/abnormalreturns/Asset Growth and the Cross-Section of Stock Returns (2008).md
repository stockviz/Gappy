# Asset Growth and the Cross-Section of Stock Returns
**Authors:** Michael J. Cooper, Huseyin Gulen, Michael J. Schill
**Year:** 2008
**Journal/Venue:** Journal of Finance

## Problem statement

Many long-run event studies show that firms expanding assets aggressively later earn low returns, while firms shrinking assets later earn high returns. This paper asks whether those seemingly separate findings are all manifestations of one broader phenomenon: **total asset growth as a negative predictor of future stock returns**.

The key issue is whether one should look at isolated components such as equity issuance, debt issuance, accruals, or capital expenditures, or instead treat the entire balance-sheet expansion as the signal.

## Approach (short)

The paper defines annual asset growth as

$$
ASSETG_t=\frac{Assets_t-Assets_{t-1}}{Assets_{t-1}},
$$

sorts firms each June into deciles on this measure, and tracks returns from July of year `t` to June of `t+1`. It then compares the predictive power of `ASSETG` with book-to-market, size, past returns, accruals, capital investment, and other growth variables in Fama-MacBeth regressions. Finally, it decomposes total asset growth into investment-side and financing-side components to see which parts are most responsible for the effect.

The main finding is that low asset growth firms strongly outperform high asset growth firms, and that total asset growth is more informative than any single subcomponent.

## Approach (detailed)

### 1. Define the core signal at the whole-balance-sheet level

The central variable is

$$
ASSETG_t=\frac{Assets_t-Assets_{t-1}}{Assets_{t-1}},
$$

where total assets are Compustat item 6. The paper deliberately uses the whole-balance-sheet percentage change rather than a narrower investment measure. The argument is that any economically meaningful expansion or contraction must show up in total assets, regardless of whether it came through inventories, PPE, acquisitions, equity finance, debt finance, or operating-liability adjustment.

### 2. Use annual June portfolio formation with the standard accounting lag

The portfolio design is:

1. measure firm asset growth using the most recent fiscal-year information available by June of year `t`;
2. sort all eligible firms into deciles on `ASSETG` at the end of June;
3. hold the portfolios from July of year `t` to June of year `t+1`.

The sample begins with June 1968 formations and runs through 2003. The paper reports both value-weighted and equal-weighted returns.

This timing matters because it removes look-ahead bias and makes the signal directly implementable as an annual rebalance strategy.

### 3. Compare decile returns and risk-adjusted alphas

The benchmark trading strategy is:

- long the lowest asset-growth decile;
- short the highest asset-growth decile.

The paper reports economically large spreads in raw and risk-adjusted returns. The low-growth decile earns much higher returns than the high-growth decile, and the spread remains strong after CAPM and Fama-French style risk adjustment.

The design also checks whether the effect is a microcap artifact by splitting firms into three size groups using the 30th and 70th NYSE market-equity breakpoints. The effect weakens with size but remains strong even among large firms, which is crucial for credibility.

### 4. Study the long-horizon return path

The paper does not stop at year 1. It tracks post-formation abnormal returns for up to five years. This is methodologically useful because it distinguishes:

- a short-lived correction,
- from a medium-horizon mispricing pattern.

The asset-growth effect persists beyond the first year, which makes it look more like a slow capitalization error than a one-month microstructure artifact.

### 5. Run horse-race regressions against standard cross-sectional predictors

The paper then estimates annual cross-sectional stock-return regressions that include:

- `ASSETG`,
- book-to-market,
- firm size,
- short-horizon lagged returns,
- long-horizon lagged returns,
- accruals,
- abnormal capital investment,
- and other growth variables.

In the paper's notation, related variables include:

- `BHRET6`: the buy-and-hold return from January to June of year `t`,
- `BHRET36`: the buy-and-hold return from July `t-3` to June `t`,
- `CI`: Titman-Wei-Xie's abnormal capital investment measure,
- `NOA`: Hirshleifer et al.'s net operating assets,
- `ACCRUALS`,
- `ISSUANCE`,
- and long-horizon growth ranks such as `5YASSETG`.

The main horse-race result is that `ASSETG` remains strongly negative and often dominates the alternatives statistically. This is one of the paper's strongest claims: total asset growth is not just correlated with known anomalies; it compresses information from many of them.

### 6. Decompose asset growth on the investment side

The investment-side decomposition writes total asset growth as the sum of changes in:

- cash,
- noncash current assets,
- property, plant, and equipment,
- other assets.

Operationally, the paper defines:

- `ΔCash =` change in Compustat item 1,
- `ΔCurAsst = Δ(item 4 - item 1)`,
- `ΔPPE = Δ(item 8)`,
- `ΔOthAssets = ΔTotalAssets - ΔCash - ΔCurAsst - ΔPPE`.

Each component is scaled by lagged total assets and entered into cross-sectional regressions.

The results show that the most important investment-side sources of the effect are growth in noncash current assets and growth in PPE. That means the anomaly is not driven by idle cash accumulation alone; it is tied to operating-asset expansion.

### 7. Decompose asset growth on the financing side

The financing-side decomposition writes total asset growth as growth in:

- retained earnings,
- stock financing,
- debt financing,
- operating liabilities.

The paper defines the components as:

- `ΔRE = Δ(Compustat 36)`,
- `ΔStock = Δ(Compustat 130 + 60 + 38 - 36)`,
- `ΔDebt = Δ(Compustat 9 + 34)`,
- `ΔOpLiab = ΔTotalAssets - ΔRE - ΔStock - ΔDebt`.

Again, each is scaled by lagged total assets.

The financing decomposition matters because it shows where the expansion came from. The paper finds that debt and stock financing are especially important, with debt more important among small and medium firms and stock financing more important among large firms.

### 8. Use auxiliary tests to distinguish risk from mispricing

The paper runs several mechanism checks:

- earnings-announcement-day tests,
- subsample tests during the 1984-1989 hostile takeover period,
- regressions linking the effect to lagged market states,
- and comparisons to investment-based risk stories.

The earnings-announcement-day evidence is especially important. Low-growth firms experience positive abnormal returns around earnings announcements, while high-growth firms experience negative abnormal returns. That pattern is consistent with expectational errors: the market is surprised in the direction implied by prior asset growth.

The takeover-period test also matters. If stronger governance reduces overinvestment, then the mispricing should weaken when hostile takeovers are more credible. The paper finds exactly that.

### 9. What a reader should implement

A faithful implementation needs:

1. annual Compustat asset data and CRSP returns;
2. June rebalancing with a fiscal-year reporting lag;
3. decile sorts on `ASSETG`;
4. factor-adjusted return measurement;
5. annual cross-sectional regressions with standard controls;
6. decompositions of asset growth into both investment-side and financing-side components.

The central practical lesson is that the signal is broad:

$$
ASSETG
$$

works well precisely because it aggregates many related expansion channels.

## Domain of applicability

- **Where it works well:** Broad equity universes with reliable annual accounting data.
- **What is implementable:** Annual low-asset-growth minus high-asset-growth portfolios, either standalone or as part of a composite mispricing model.
- **Main limitation:** Asset growth is reduced form. It is excellent for prediction, but by itself it does not tell you whether the economic driver is overinvestment, investor extrapolation, or an equilibrium investment-return link.
- **Why the paper matters:** It shows that the right state variable is often total balance-sheet expansion, not any single capital market or accounting subcomponent.
