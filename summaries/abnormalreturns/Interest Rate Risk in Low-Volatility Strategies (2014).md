# Interest Rate Risk in Low-Volatility Strategies
**Authors:** David Blitz, Bart van der Grient, Pim van Vliet
**Year:** 2014
**Journal/Venue:** White paper

## Problem statement

Low-volatility equity strategies often look "bond-like": they outperform when rates fall and lag when rates rise. The paper asks whether that interest-rate sensitivity is just an incidental by-product or whether it explains the low-volatility premium itself.

## Approach (short)

The note measures the bond sensitivity of:

- a generic low-volatility strategy based on past `3`-year volatility,
- an enhanced low-volatility strategy (`lowvol+`) that also uses valuation and momentum.

It estimates betas to both the equity market and a bond-market proxy, then asks what happens if interest-rate exposure is hedged back to market levels.

## Approach (detailed)

### 1. Define the two low-volatility portfolios

The generic strategy is a plain low-volatility portfolio formed from trailing `3`-year realized volatility. The enhanced strategy, `lowvol+`, keeps the low-volatility core but overlays additional selection dimensions, especially valuation and momentum, to improve the standard low-vol profile.

The distinction matters because the note is really a horse race between:

- low-vol as a naive bond-like equity trade,
- and low-vol as an actively improved defensive equity strategy.

### 2. Measure exposure to both stocks and bonds

The empirical object is not just average return. The paper estimates:

- beta to the equity market portfolio,
- beta to a bond-market portfolio.

For the bond benchmark, the note uses a `50/50` combination of intermediate-term and long-term government bond return series. The goal is to quantify the extent to which low-volatility behaves like a duration trade.

### 3. Run the test on long U.S. history and then on a global sample

The first sample is the U.S. from `1929` to `2010`. The second is a more recent global sample using real-life low-volatility implementations.

That two-sample structure is important:

- the long U.S. sample gives statistical depth,
- the global sample asks whether the effect survives outside one historical market.

### 4. Hedge interest-rate risk to market levels

The key design is a hedging experiment. Once the bond beta of a low-vol strategy is estimated, the paper constructs a hedged version whose interest-rate sensitivity is brought back in line with the market portfolio.

Conceptually, if `\beta^{bond}_{LV}` exceeds `\beta^{bond}_{MKT}`, choose a bond overlay `h` so that

$$
\beta^{bond}_{LV} + h\,\beta^{bond}_{bond\ overlay} = \beta^{bond}_{MKT}.
$$

Then compare the performance of:

- the unhedged low-vol strategy,
- the hedged low-vol strategy,
- the market.

### 5. Interpret what survives the hedge

If low-vol's premium were just disguised duration exposure, the hedge should erase the advantage. The note finds the opposite:

- low-volatility does have positive bond sensitivity,
- but hedging that sensitivity does not explain away the strategy's added value,
- and the active `lowvol+` design carries less interest-rate risk than the generic version.

### 6. Explain why the active variant helps

The note's interpretation is that adding valuation and momentum dilutes the pure "bond-like" sleeve. These extra factors use part of the available risk budget in directions less tied to interest-rate moves, reducing duration exposure without giving up the defensive character of the equity portfolio.

### 7. What a reader should implement

To reproduce the analysis:

1. build a generic low-volatility portfolio from trailing `3`-year realized vol;
2. build an enhanced low-vol portfolio with valuation and momentum overlays;
3. estimate rolling betas to equity and bond benchmarks;
4. add a bond hedge to match the market's bond beta;
5. compare hedged and unhedged performance.

The strategy insight is not "avoid low-vol because of rates." It is "measure the duration exposure explicitly and separate it from the low-vol anomaly itself."

## Domain of applicability

- **Where it works well:** Defensive equity strategies and institutional portfolios that care about hidden duration.
- **What is implementable:** Estimation of bond beta for low-vol sleeves plus explicit bond-hedging overlays.
- **Main limitation:** This is a practitioner note, so the econometrics are simpler than in an academic asset-pricing paper.
- **Why the paper matters:** It shows that low-volatility is partly bond-like, but not reducible to bond exposure.
