# Facts and Fantasies about Commodity Futures — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Facts and Fantasies about Commodity Futures |
| **Authors** | Gary Gorton (Wharton / NBER); K. Geert Rouwenhorst (Yale SOM) |
| **Outlet** | NBER Working Paper No. 10595 (June 2004; revised March 2006) |
| **JEL** | G13, G11 |
| **Sample** | Equally-weighted collateralized commodity futures index, July 1959 – December 2004 (≈45.5 years); CRB + LME data |
| **Support** | Research assistance Dimitry Gupalo, Missaka Warusawitharana; AIG Financial Products; LME (Michael Crowe); CRB (Chris Lown) |
| **Related** | Bodie–Rosansky (1980); Fama–French (1987); Greer (2000); Keynes (1930) normal backwardation |

Tone: asset-class stylized facts for long-horizon investors. All returns fully collateralized unless noted. Arithmetic averages annualized by $\times 12$ on monthly means.

---

## Problem / Motivation

Commodity futures remain poorly understood relative to stocks and bonds despite >100 years of U.S. trading (and much older Asian rice futures). Distinctive features include: (1) they are derivatives, not claims on long-lived corporations; (2) short-maturity claims on real assets; (3) pronounced seasonality in levels and volatilities for many commodities; (4) historically thin public data (CRSP and Ibbotson lack commodity futures series; commercial indices are short or unreproducible).

Economic function differs from equities/bonds. Corporate securities raise external capital; investors bear long-horizon cash-flow risk concentrated in bad times. Commodity futures transfer short-term price risk from hedgers (producers/consumers) to speculators. Inventory links current and expected future scarcity, connecting spot and futures, but commodities differ sharply in storability and role as input vs intermediate goods.

Core investor questions the paper addresses with a long, diversified index:

1. Can futures earn positive returns when spot prices fall?
2. How do spot vs futures returns compare?
3. What are commodity futures returns vs stocks and bonds? Risk?
4. Do futures hedge inflation?
5. Do they diversify other asset classes?

Prior work often used short samples and few commodities. Diversification at the portfolio level reduces noise that obscures risk premia in individual contracts (cf. Bodie–Rosansky).

---

## Setup / Data

### Index construction

- **Source:** Commodities Research Bureau daily prices from 1959; append LME metals.
- **Weighting:** Equally weighted; monthly rebalance to equal dollar weights, fully collateralized with T-bills.
- **Contract choice:** Nearest contract that will not expire in the holding month; roll before expiration month. Rolling itself is not a return source (daily mark-to-market → zero value at day-end).
- **Exchange selection:** One exchange per commodity (liquidity), avoiding double-counting.
- **Survivorship:** CRB mainly covers surviving or long-lived contracts. Unlike equities (bankruptcy truncates left tails), futures fail for lack of volume; bias direction vs equity survivorship is ambiguous.
- **Spot proxy:** Interpolate between nearby futures; LME cash ask used for metals.

Commodity entry dates span Copper/Cotton/Cocoa/Wheat/Corn/Soy complex/Oats (1959) through Electricity (2003), totaling 36 series in Appendix 1 (energy late: Heating Oil 1978, Crude 1983, Nat Gas 1990).

### Return definition (leverage control)

Futures require no initial cash (margin aside). For asset-class comparison, assume **full collateralization**: if futures price is $F=\$25$, invest \$25 in T-bills. Total return ≈ futures price change + T-bill interest, scaled by initial \$25.

Expected futures payoff is the risk premium:
$$
\mathbb{E}[\text{payoff}] = F_t - \mathbb{E}_t[S_T] \quad\text{(sign convention: long earns if } F_t < \mathbb{E}_t[S_T]\text{)}.
$$
Realized payoff = risk premium + unexpected spot surprise. Expected trends in spot are embedded in $F_t$ and are **not** a return source for passive long futures.

Keynes–Hicks **normal backwardation**: producers hedge by selling futures; speculators demand $F_t < \mathbb{E}_t[S_T]$, so longs earn a premium as $F$ rises toward expected spot.

Stylized oil example (Weiser 2003 adaptation): $S_t=30$, $\mathbb{E}[S_T]=27$, $F_t=25$. Risk premium \$2. If $S_T=27$, spot investor loses \$3; futures long gains \$2. If $S_T=26$, realized futures gain \$1 = premium \$2 − surprise −\$1.

---

## Model / Methods

### Spot vs futures: cost of carry (Appendix 2)

No-arbitrage upper bound (long cash-and-carry):
$$
F_{t,T} \le e^{r(T-t)}(S_t + w),
$$
where $w$ is net storage cost. Equality need not hold: shorting the commodity is hard (stock-outs disrupt production), so low $F$ / high $S$ need not be arbitraged. Convenience yield and seasonal inventory dynamics loosen the financial-futures cost-of-carry link.

### Index return formulas (Appendix 1)

For $N$ commodities, $R_{it}$ = 1 + collateralized return of $i$ in month $t$:

- Monthly-rebalanced arithmetic: $AR = \frac{1}{NT}\sum_t\sum_i R_{it}$
- Monthly-rebalanced geometric: $GR = \Big(\prod_t\big(\frac{1}{N}\sum_i R_{it}\big)\Big)^{1/T}$
- Buy-and-hold variants (no monthly rebalance) as in Roll (1983) / Blume–Stambaugh.

Annualization: subtract 1, $\times 1200$.

### Basis trading (information in the curve)

Basis slope between index contract $F_1$ and next $F_2$:
$$
\text{Basis} = \frac{F_1-F_2}{F_1}\times\frac{365}{T_2-T_1}.
$$
Each month sort into High vs Low basis halves; equal-weight; rebalance. Excess vs EW index and High−Low tested with $t$-stats.

### Business-cycle phases

NBER peaks/troughs; split expansion and recession into equal-length Early/Late halves (Vrugt-style). Compare average returns of stocks, bonds, commodities by phase (descriptive; not a tradable strategy because dating is ex post).

### Inflation decomposition

Unexpected inflation ≈ CPI − ex ante T-bill (constant real rate assumption; Fama–Schwert). Change in expected inflation ≈ change in nominal rate. Correlations at monthly, quarterly, 1-year, 5-year overlapping horizons; Newey–West significance.

### International and equity-substitute tests

UK/Japan: convert EW commodity index to GBP/JPY, deflate by local CPI; compare to MSCI local equity and IMF long government bonds (from ~1970). Commodity-producing equities: match 17 commodities to 4-digit SIC pure-ish plays; EW stock index vs futures (1962–2003).

---

## Results with Numbers

### Spot vs collateralized futures (Table 1; Figures 2a–2b)

Inflation-adjusted: futures far outperform spot. Spot ignores storage/insurance → upper bound on physical holding returns. Log scale shows high correlation of short-run moves but divergent trends (futures accrue T-bill + premium; expected spot trends stripped out).

| Average return % p.a. | Monthly rebal | Annual rebal | Buy & hold |
|----------------------|---------------|--------------|------------|
| Futures arithmetic | 10.69 | 11.97 | 11.46 |
| Spot arithmetic | 8.42 | 7.51 | 4.64 |
| Futures geometric | 9.98 | 11.18 | 10.31 |
| Spot geometric | 7.66 | 6.66 | 3.47 |
| Inflation | ~4.13–4.14 | | |

Buy-and-hold spot geometric 3.47% < inflation ≈4.15% — consistent with Prebisch–Singer long-run real commodity price decline. Rebalancing affects spot more than futures (seasonal mean reversion in spots). Futures averages robust across rebalancing rules; paper focuses thereafter on monthly-rebalanced EW futures.

### Risk premium vs stocks and bonds (Table 2; Figure 3)

Sample July 1959 – Dec 2004; excess (not inflation-adjusted) annualized monthly:

| | Commodity Futures | Stocks (S&P) | Bonds (Ibbotson corp) |
|--|-------------------|--------------|------------------------|
| Average excess | **5.23%** | 5.65% | 2.22% |
| Stdev | 12.10% | 14.85% | 8.47% |
| $t$-stat | **2.92** | 2.57 | 1.77 |
| Sharpe | **0.43** | 0.38 | 0.26 |
| % months > 0 | 55 | 57 | 54 |

Commodity futures risk premium ≈ equity premium, >2× bond premium, statistically significant. Aligns with portfolio-level Bodie–Rosansky (~9.5% excess 1950–76) and Fama–French EW 0.45%/month continuously compounded ($t=1.57$, 1966–84). Arithmetic mean matches finance risk-aversion definition (vs geometric/log tests of Kolb, Erb–Harvey).

Inflation-adjusted cumulative wealth: futures ≈ stocks over 45 years; both beat bonds. Futures won in 1970s; stocks in 1990s.

### Distribution (Table 3; Figure 4)

Monthly % returns:

| | Futures | Stocks | Bonds |
|--|---------|--------|-------|
| Mean | 0.89 | 0.93 | 0.64 |
| Stdev | 3.47 | 4.27 | 2.45 |
| Skewness | **+0.71** | −0.34 | +0.37 |
| Kurtosis | 4.53 | 1.81 | 3.56 |

Positive skew for commodities vs negative for equities → equity left-tail VaR worse: 5% empirical tail −6.34% (equities) vs −4.10% (commodities).

### Correlations with stocks, bonds, inflation (Table 4)

Overlapping horizons; * = 5% NW significant:

| Horizon | Stocks | Bonds | Inflation |
|---------|--------|-------|-----------|
| Monthly | 0.05 | −0.14* | 0.01 |
| Quarterly | −0.06 | −0.27* | 0.14 |
| 1-year | −0.10 | −0.30* | 0.29* |
| 5-year | **−0.42*** | −0.25* | **0.45*** |

Diversification strengthens at longer horizons. Inflation hedge property clearer at 1–5 years.

### Crash diversification (Figures 5a–5b)

- Bottom 5% equity months: equities avg −8.98%/mo; commodities **+1.03%** (above unconditional 0.89%).
- Bottom 1% equity months: equities −13.87%; commodities **+2.36%**.
- Symmetry: when commodities in bottom 5% (1%), equities avg −0.99% (−4.10%).

### Inflation correlations (Tables 5–6)

Stocks/bonds negatively correlated with inflation; commodities positive, increasing with horizon. Drivers: unexpected inflation and revisions to expected inflation.

Quarterly correlations:

| | Inflation | Δ Expected Infl. | Unexpected Infl. |
|--|-----------|------------------|------------------|
| Stocks | −0.19* | −0.10* | −0.23* |
| Bonds | −0.22* | **−0.51*** | −0.35* |
| Futures | 0.14 | **0.22*** | **0.25*** |

Residualizing on unexpected inflation only partly explains negative stock/bond–futures correlations (quarterly stock corr rises −0.06→0; bonds −0.27→−0.20). Business-cycle channel remains.

### Business cycle (Table 7)

| Phase | Stocks | Bonds | Commodity Futures |
|-------|--------|-------|-------------------|
| Expansion | 13.29% | 6.74% | 11.84% |
| — early | 16.30% | 9.98% | 6.76% |
| — late | 10.40% | 3.63% | **16.71%** |
| Recession | 0.51% | 12.59% | 1.05% |
| — early | **−18.64%** | −3.88% | **+3.74%** |
| — late | 19.69% | 29.07% | −1.63% |

Unique claim: commodities help diversify **systematic** business-cycle risk—especially Early Recession when stocks/bonds suffer. Late Expansion / Early Recession: commodities outperform when stocks/bonds below average.

### Basis portfolios (Table 8)

High − Low basis annualized excess vs each other: **10.04%** (stdev 13.16%, $t=5.15$, Sharpe 0.76). High−EW: +4.87% ($t=4.94$); Low−EW: −5.17% ($t=-5.26$). High beats EW/Low in ~60% of months. Basis Sharpe ≈ 2× EW index Sharpe — basis carries risk-premium information (cross-sectional and/or time-series).

### International (Figures 7–8)

1970–Sep 2004 local-currency CPI-deflated: UK and Japan investors see futures performance similar to local equities, ahead of local bonds, and ahead of local inflation. Rankings match U.S. experience — not a U.S.-only artifact.

### Commodity equities ≠ futures (Figure 9)

1962–2003: futures cumulative >> matched commodity-company stocks. Correlation futures–producer stocks only **0.40**; producer stocks–S&P **0.57**. Producer equities behave more like equities than like commodity futures — **not** a substitute.

### Individual commodity appendix (Appendix 3 highlights)

EW index: arith 10.69%, geom 9.98%, σ 12.04%, skew 0.71. Pairwise avg corr with others ≈0.39. Energy late-sample arithmetic means high (Crude 20.67%, Unleaded 24.29%, Propane 30.25%) but with huge σ and short histories. Many softs/grains: high kurtosis (Oats kurtosis 28.72; Soy Meal 21.18). Diversification across heterogeneous commodities is first-order.

---

## Limitations

1. **Survivorship / selection:** Failed contracts omitted; exchange chosen by liquidity.
2. **Equal weights:** Differs from production/liquidity-weighted GSCI/DJ-AIG; embeds monthly contrarian rebalance (helps more for spots).
3. **Nearby-only:** Front-end roll; term-structure risk premia beyond nearby not studied except via basis sort.
4. **Business-cycle dating:** Ex post NBER; not a trading rule.
5. **Inflation model:** Constant real rate → T-bill as expected inflation is crude.
6. **Sample end 2004:** Pre-dates full financialization boom; later literature (Tang–Xiong, Singleton) studies index flows.
7. **SIC matching:** Firms are multi-line; imperfect pure plays.
8. **Collateral = T-bills:** Foreign investors may collateralize in local bills; FX embedded in international comparisons.

---

## Quant-Investor Takeaways

1. **Asset-class premium is real at portfolio level.** ~5% excess, Sharpe ~0.43, $t\approx 3$ over 45 years — comparable to equities, with lower σ and positive skew. Individual-contract premia are noisy (echo Fama–French 1987).

2. **Do not confuse spot with futures.** Long-run real spot underperforms inflation; fully collateralized futures compound T-bill + premium. Falling spots can coexist with positive futures returns (normal backwardation / risk premium).

3. **Diversifier, especially at horizon and in stress.** Negative corr with stocks/bonds grows with horizon; historically positive in equity left-tail months; Early Recession cushion.

4. **Inflation dual:** Positive corr with unexpected inflation and Δ expected inflation — opposite stocks/bonds. Partial but not full explanation of negative cross-asset corr.

5. **Curve / basis is a premium signal.** High-minus-low basis ~10% with Sharpe 0.76 — actionable relative-value / timing overlay on a passive EW or production-weighted book.

6. **Producer equities are equity beta, not commodity beta.** Correlation structure rejects the “buy miners instead of futures” shortcut.

7. **Implementation:** Full collateralization for benchmarking; watch roll calendar, sector concentration if using liquidity weights (energy domination in GSCI), and rebalancing frequency. Equal weight historically rewarded diversification across poorly correlated contracts.

8. **Research agenda:** Why is the premium paid (hedging pressure vs inventory/CAPM vs scarcity)? How stable post-financialization? Gorton–Hayashi–Rouwenhorst and later flow papers continue the thread.

---

*Word-target substance notes: equations for carry, basis, index returns; Tables 1–8 and Appendix 3 magnitudes preserved; business-cycle and inflation channels spelled out for portfolio construction.*


---

## Extended Discussion: Mechanics and Investor Myths

### Myth 1 — “Commodities only pay if spot prices rise”

Section 2’s decomposition falsifies this. The futures price embeds $\mathbb{E}_t[S_T]$. Only the wedge $F_t - \mathbb{E}_t[S_T]$ (plus unexpected $S_T$ surprises) drives futures P&L for a passive long. Empirically, the EW collateralized futures geometric return (~10% p.a. nominal) far exceeds inflation-adjusted spot performance. An investor who bought a basket of physical commodities and paid storage would have underperformed even the interpolated spot index (itself an upper bound).

### Myth 2 — “Futures are too risky vs equities”

Unconditional monthly σ: futures 3.47% vs equities 4.27%. Annualized index σ ~12% vs S&P ~15%. Left-tail: equity 5% month −6.34% vs futures −4.10%. Positive skew (0.71) vs equity negative skew (−0.34) matters for compounded wealth and for CPPI / drawdown-sensitive mandates. Portfolio risk contribution is further reduced by negative correlation with equities/bonds at quarterly+ horizons.

### Myth 3 — “Buy commodity stocks for commodity exposure”

Figure 9 is decisive: corr(futures, producer stocks)=0.40 < corr(producer stocks, S&P)=0.57. Equity claims embed operating leverage, financial leverage, hedging policies of the firm, and equity risk premia. A gold miner is a gold option plus equity factor loadings — not a substitute for gold futures collateralized return.

### Myth 4 — “Contango means you lose money”

Market jargon “backwardation/contango” (basis vs current spot) ≠ Keynesian normal backwardation (futures vs expected future spot). A market can be in contango ($F>S$) yet still offer a positive risk premium if $F<\mathbb{E}[S_T]$. The High-basis portfolio outperformance shows that *more* backwardated (higher basis) contracts historically earned more — consistent with basis proxying required premium and/or expected spot declines that are not fully priced.

### Portfolio construction recipe (practical)

Let $r_{c,t}$ be EW collateralized futures excess, $r_{e,t}$ equity excess, $r_{b,t}$ bond excess. Historical moments suggest a mean-variance investor with moderate risk aversion places nontrivial weight on $r_c$ because:

$$
\mu_c \approx \mu_e,\quad \sigma_c < \sigma_e,\quad \rho_{c,e}<0 \text{ at annual+ horizons},\quad \rho_{c,\pi}>0.
$$

A simple three-asset annual rebalance using 1959–2004 moments would allocate material capital to commodities for both return and inflation/recession hedges. Tactical overlay: overweight High-basis half (Table 8). Risk manage energy concentration if switching to production weights.

### Connection to later literature

Gorton–Rouwenhorst established the long-sample asset-class facts that underpinned the mid-2000s institutional allocation wave. Subsequent work (Erb–Harvey on rebalancing/yield decomposition; Gorton–Hayashi–Rouwenhorst on inventory; Tang–Xiong and Singleton on financialization) qualifies stability of correlations and the role of index flows — but does not erase the 1959–2004 stylized facts. For a quant building a multi-asset risk model, treat commodities as a distinct block with inflation and cycle loadings rather than as “another equity.”

### Numerical diligence checklist for replication

- Use nearest non-expiring contract; roll on last business day of prior month.
- Collateralize at futures price notional with 30-day T-bill total return (Ibbotson).
- Equal weight across *available* contracts each month (expanding universe).
- Annualize monthly means $\times 12$; report both arithmetic and geometric.
- For basis: annualize slope with day-count between expiries; sort monthly.
- For cycle: map NBER dates; split peak-to-trough and trough-to-peak into equal month counts.

### Sector intuition from Appendix 3

Industrial metals and energy (when present) often show high arithmetic means and high σ. Grains show harvest-driven skew/kurtosis. Animal products: heterogeneous (Live Cattle relatively well-behaved σ≈18%; Pork Bellies σ≈36%). Softs (Sugar σ≈45%, Coffee ≈40%) dominate tail risk. Equal weighting mechanically caps any single blow-up’s portfolio impact — a feature, not a bug, for asset-class measurement.

### Bond comparison nuance

Bond excess premium only 2.22% ($t=1.77$) with σ 8.47% — lower Sharpe (0.26). Commodities’ negative bond correlation (−0.14 to −0.30) helps duration-heavy LDI portfolios that otherwise suffer in inflation surprises (bond corr with Δ expected inflation −0.51).

### Equity crash convexity

The +1% to +2% commodity returns in equity left tails are not options; they are historical averages over few observations (especially 1% tails ≈6 months). Still, the sign pattern matches the negative correlation and cycle story. Sizing commodity sleeves for “crisis alpha” should use haircut expectations and account for 2008-style episodes where financialization correlated commodities with equities more than in the 1959–2004 average (see Singleton summary companion note).

---

## Conclusion

Gorton and Rouwenhorst replace folklore with a 45-year EW collateralized futures laboratory. The central fantasies dispelled: (i) spot trends drive futures returns; (ii) commodities are strictly riskier than equities; (iii) producer stocks substitute for futures; (iv) contango precludes positive expected returns. The central facts established: equity-like premium, better skew, negative corr with stocks/bonds especially at long horizons, positive inflation linkage, Early Recession ballast, and basis as a premium signal. For quantitative allocators, commodity futures belong in the strategic policy portfolio; for researchers, the results challenge equity-centric asset pricing to explain a large, business-cycle-linked premium in an asset class that does not raise corporate capital.


---

## Deep Dive: Normal Backwardation vs Measured Premia

Keynes (1930, p. 144) required that the forward price, even if above the present spot, “must fall below the anticipated future spot price by at least the amount of normal backwardation.” Empirically, individual-commodity tests (Gray 1961; Dusak 1973; Jagannathan 1985; Bessembinder 1992; Kolb 1992) were mixed precisely because futures price noise swamps the mean. Gorton–Rouwenhorst’s contribution is power through diversification: an EW portfolio’s arithmetic excess of 5.23% with $t=2.92$ is hard to dismiss as sampling error.

Measurement subtlety: arithmetic mean of excess returns answers “what is the average rate at which futures prices rise over the life of the average contract?” Geometric or log means ask whether a log-utility investor holding 100% in futures would have been better off — embedding risk aversion into the null. The paper correctly privileges arithmetic means for risk-premium measurement in the finance sense (credit to Ingersoll’s clarification in footnote 16).

Relative to Bodie–Rosansky’s 9.5% excess (1950–76, quarterly EW), the 5.23% over 1959–2004 is lower but still equity-like. Fama–French’s 0.45%/month continuously compounded EW ($t=1.57$) sits between: large economically, borderline statistically — exactly the “persistence of the debate” FF emphasize. Extending the sample and emphasizing arithmetic means strengthens the Keynesian case at the index level.

## Deep Dive: Why Negative Equity Correlation?

Two partial mechanisms:

1. **Inflation channel.** Equities and especially bonds are short unexpected inflation; commodities are long. Residualizing on unexpected inflation reduces but does not eliminate negative corr — so inflation is part, not all.

2. **Business-cycle channel.** Early recession: demand destruction hits equities; commodities can still reflect prior scarcity, inventory draws, or monetary/inflation dynamics. Late recession: equities discount recovery; commodity returns fade. Late expansion: commodities run hot (16.71%) as capacity constrains.

A third, inventory-theoretic channel (developed more in later Gorton–Hayashi–Rouwenhorst work): low inventories → high convenience yield → high expected futures returns, often coinciding with stress in other markets. The 1959–2004 paper documents the reduced-form correlations; structural identification is left open.

## Deep Dive: Rebalancing and the “Commodity Yield” Debate

Erb–Harvey later stressed that much of commodity index return can be attributed to diversification return (rebalancing) rather than average backwardation. Gorton–Rouwenhorst anticipate this: Table 1 shows monthly vs buy-and-hold futures arithmetic means are close (10.69 vs 11.46), while spot is highly sensitive (8.42 vs 4.64). For futures, rebalancing is second-order; for spots, first-order. Annual rebalancing actually *raises* futures arithmetic mean to 11.97% (Jegadeesh–Titman-style average across calendar months). Diversification return exists but does not invent the risk premium: buy-and-hold futures still deliver ~11% arithmetic / ~10% geometric.

## Implementation Notes for Systematic Mandates

**Benchmark choice.** EW maximizes “average commodity” interpretation and historical diversification; production-weighted (GSCI-like) maximizes dollar economy exposure but concentrates energy. Liquidity-weighted hybrids (DJ-AIG/BCOM) sit in between. Historical Sharpe and corr facts are strongest for EW; live products rarely are pure EW.

**Roll methodology.** Paper uses front-end roll avoiding delivery month. Modern indices specify roll windows (e.g., 5-day) and may hold further contracts (enhanced roll / constant maturity) to reduce congestion — relevant post-Mou (2011) Goldman-roll literature.

**Collateral.** T-bill collateral was near zero after 2008; “collateral yield” vanished. Risk premium estimation should still use futures excess (price return), reporting collateral separately. Funding via repo/treasury bills remains the right conceptual benchmark.

**Risk model.** Assign commodities a block with: (i) inflation surprise loading; (ii) growth/cycle loading opposite equities in early recession; (iii) sector factors (energy, metals, ag, livestock); (iv) basis/term-structure factor. Avoid naively applying equity industry factors to futures.

**Capacity and crowding.** 1959–2004 precedes massive index AUM. Capacity constraints and roll crowding (Singleton; Mou) can compress the very premia documented here. Monitor open interest, index weights, and High−Low basis spread stability.

## Statistical Appendix: Interpreting Skew and Kurtosis

Index kurtosis 4.53 (excess ~1.5 vs normal 3) indicates fat tails, but right-skew means fat right rather than left. For options overlays, selling commodity upside is dangerous; buying commodity downside hedges is historically cheaper than equity puts on a stand-alone basis — though correlation instability in crises can spoil the hedge (2008). Position-level kurtosis (Appendix 3) warns against concentrated single-name futures (Nickel kurtosis 28.96; Propane 36).

## Linking Table 8 to FF (1987)

Fama–French find basis more informative about future *spot changes* than about premia for many commodities (especially high-storage-cost animal products). Gorton–Rouwenhorst’s High−Low result says that *across* commodities and time, sorting on basis still earns ~10%. Reconciliation: FF emphasize time-series forecast regressions per commodity with limited power; GR emphasize cross-sectional portfolio sorts with 45 years. Both can be true: basis mixes expected spot change and expected premium (their eq. 4 identity); which component dominates varies by commodity and method.

## Final Synthesis for CIOs

Allocate a strategic commodity futures sleeve (fully collateralized or unfunded overlay) sized to risk budget — historically 5–15% of a multi-asset fund depending on inflation views. Prefer diversified indices or EW custom baskets; add a modest basis tilt if governance allows. Do not replace with equity “proxies.” Re-estimate correlations on rolling windows post-2004; keep the long-history prior that commodities can hedge equity and inflation even if recent samples look equity-like due to financialization.


---

## Reference Cross-Walk for Practitioners

Key citations to keep on the desk when implementing: Keynes (1930) and Hicks (1939) for normal backwardation theory; Working (1948, 1949), Brennan (1958), Telser (1958) for storage/convenience yield; Bodie–Rosansky (1980) for early portfolio evidence; Fama–French (1987) for basis forecast vs premium split; Black (1976) for futures pricing foundations; Erb–Harvey (2005/2006) for strategic/tactical commodity value and rebalancing; Greer (2000) for index nature; Weiser (2003) and Vrugt (2003) for cycle phasing; Prebisch (1950) and Singer (1950) for long-run real spot trends. Appendix mathematics on cash-and-carry bounds should be coded as inequality constraints in any internal arb monitor, remembering that commodity markets routinely violate tight financial-style equality because of stock-out optionality and convenience yield.

Operationally, a monthly research memo tracking (1) EW vs production-weighted excess returns, (2) High−Low basis spread, (3) rolling 36-month correlations with S&P and Treasuries, and (4) inflation-surprise betas keeps the Gorton–Rouwenhorst facts alive in a live risk committee process rather than as a static 2004 PDF.


---

## Appendix-Style Worked Numerical Example

Suppose an equally weighted basket of 20 commodity futures, each fully collateralized. Month-t futures price changes average +0.40% across names while T-bills return 0.25%. The collateralized basket return is approximately 0.65% for the month (ignoring cross terms). Annualizing the arithmetic mean by $\times 12$ yields 7.8% total return; subtracting bill return isolates an excess near 4.8%, in the neighborhood of Table 2’s 5.23% sample estimate. If in the same month the S&P loses 3% and unexpected inflation prints hot, the commodity sleeve’s dual role — positive absolute contribution plus positive inflation beta — improves multi-asset surplus volatility. Rebalancing back to equal weights after a month where energy rallied 10% and grains fell 5% mechanically trims energy and adds grains, embedding the mild contrarian policy whose futures impact Table 1 showed to be small relative to the spot case.


---

## Comprehensive Formula Sheet and Numerical Worked Examples

### Collateralized futures return (single name, one month)

Let $F_{t}$ be the futures price used at month-start, $F_{t+1}$ the price of the same contract (or rolled contract per rule) at month-end, and $r_{f,t}$ the T-bill total return over the month. Full collateralization:
$$
R_{t+1}^{\text{coll}} = \frac{F_{t+1}-F_{t}}{F_{t}} + r_{f,t}.
$$
Excess return used in Table 2 is $R^{\text{coll}}-r_f = (F_{t+1}-F_t)/F_t$.

### Index aggregation

With $N_t$ names live in month $t$:
$$
R_{t+1}^{\text{EW}} = \frac{1}{N_t}\sum_{i=1}^{N_t} R_{i,t+1}^{\text{coll}}.
$$
Annualized arithmetic mean: $12\times \overline{R^{\text{EW}}}$. Geometric: $\big(\prod (1+R_t^{\text{EW}})\big)^{12/T}-1$.

### Worked example matching Table 2 order of magnitude

Suppose over 546 months the average monthly futures price return is 0.436% and average monthly bill return is 0.45%. Then average collateralized monthly total return is 0.886% ≈ Table 3’s 0.89%. Excess average 0.436% × 12 = 5.23% — exactly Table 2’s commodity futures average excess. Equity excess 5.65% corresponds to ~0.471% per month. Bond excess 2.22% ≈ 0.185% per month. This arithmetic closes the loop between Tables 2 and 3.

### Correlation horizon effect — statistical intuition

Let monthly corr $\rho_1$ be near 0 (Table 4: 0.05 with stocks). If returns have slow-moving common components with opposite signs (inflation, cycle), overlapping annual sums amplify that common component’s contribution to covariance relative to idiosyncratic monthly noise, pushing $\rho_{12}$ more negative (−0.10) and $\rho_{60}$ to −0.42. This is why strategic allocators should not size commodity hedges using daily/monthly correlations alone.

### Early recession arithmetic

Table 7 early recession: stocks −18.64% annualized, commodities +3.74%. A 60/40 stock/bond portfolio with a 10% commodity overlay (funded by trimming stocks) replaces some −18.64% exposure with +3.74% exposure during that phase — material pathwise stabilization even though unconditional total-sample means of stocks and commodities are similar (~13% vs 12% in expansions).

### Basis portfolio economics

High−Low 10.04% with σ 13.16% ⇒ Sharpe 0.76. Relative to EW index Sharpe 0.43, the long-short basis book is “alpha-like” in a multi-factor commodity risk model. Implementation: each month rank by annualized nearby slope; long top half, short bottom half, dollar neutrality on notionals, collateralize both legs. Capacity limited by liquidity in thin ags; energy-heavy universes need liquidity screens.

### Inflation beta sketch

Regress quarterly excess returns on unexpected inflation $UI$. Table 6 correlations: stocks −0.23, bonds −0.35, futures +0.25. If $\sigma_{UI}$ is small relative to asset σ, betas are $\rho\sigma_i/\sigma_{UI}$. Even modest positive commodity–UI correlation provides hedge value because bonds’ strongly negative UI beta hurts 60/40 portfolios precisely when inflation surprises.

### International confirmation meaning

UK/Japan local-currency real performance resembling US rankings implies the commodity futures premium is not merely a dollar-credit or US equity factor residual. Foreign LDI investors can treat US-exchange commodities as real assets with local-inflation outperformance historically — subject to FX translation overlays.

### Producer equity substitute test

Corr 0.40 with futures vs 0.57 with S&P means in a regression of producer-stock returns on S&P and EW futures, S&P wins. Energy equity ≠ oil futures; gold miner ≠ gold futures. Use futures (or swaps/ETPs with futures backing) for commodity beta.

### Risk-management dashboard inspired by GR

1. Trailing 36m corr(EW commodities, S&P) and corr(..., Treasuries)
2. Trailing inflation-surprise beta
3. High−Low basis spread level and 12m performance
4. Sector HHI of the live product (warn if energy > 40–50%)
5. Skew/kurtosis of monthly sleeve returns vs equities

### Final GR synthesis paragraph

Taken as a whole, Gorton and Rouwenhorst replace marketing slogans with a reproducible 1959–2004 laboratory: equity-like premium, better skew than equities, negative long-horizon equity/bond correlations, positive inflation linkage, early-recession ballast, informative basis, international robustness, and rejection of producer stocks as substitutes. Every subsequent commodity allocation memo should start from these moments — then stress-test how financialization (Singleton) revises the correlation block.
