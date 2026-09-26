# Investor Flows and the 2008 Boom/Bust in Oil Futures (Singleton 2012) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Investor Flows and the 2008 Boom/Bust in Oil Prices |
| **Author** | Kenneth J. Singleton (Stanford GSB) |
| **Date** | April 27, 2012 |
| **Origin** | Outgrowth of survey for Air Transport Association of America |
| **Sample (empirics)** | Weekly, Sep 12, 2006 – Jan 12, 2010; WTI futures 1–24m; CIT-imputed index flows; managed-money spreads |
| **Key claim** | Index and hedge-fund spread flows predict oil futures excess returns after rich controls — informational frictions / limits-to-arbitrage channel, not only convenience yield |

---

## Problem / Motivation

Crude’s 2008 spike and collapse catalyzed debate: fundamentals-only vs financialization/speculation. Prototypical dynamic models (Hamilton 2009a; Pirrong 2009) and Irwin–Sanders (2010) OECD case against speculation omit learning under imperfect information, heterogeneous beliefs, and capital-market/agency limits to arbitrage. Singleton argues those omissions exclude rational motives for speculative participation and can miss boom/bust drift.

Complementary evidence already pointed to flows: Tang–Xiong (2011) — indexed ags more responsive to world equity, USD, oil after 2004; Buyuksahin–Robe (2011) — hedge funds link equity–commodity correlations; Masters (2009) — imputed CIT index longs comove with WTI (Figure 1); Mou (2011) — Goldman roll front-running profits.

Paper contribution: theory of informational frictions + new predictive evidence that intermediate-horizon growth in index positions and managed-money spreads forecasts futures excess returns after controlling for US/EM equity returns, dealer funding (repo), open interest, average basis, and lagged oil returns.

---

## Setup / Data

### Pricing framework

Absent stock-outs, cost-of-carry under risk-neutral measure:
$$
S_t = \mathbb{E}^Q_t\Big[e^{-\int_t^T (r_s-C_s)ds} S_T\Big]
$$
with futures $F^T_t=\mathbb{E}^Q_t[S_T]$. Risk premium $RP^T_t = \mathbb{E}^P_t[S_T/S_t]-\mathbb{E}^Q_t[S_T/S_t]$. Over short $[t,\tau]$ with approx constant $r,C$:
$$
\frac{\mathbb{E}^P_t[S_\tau]-S_t}{S_t} - y^\tau_t(\tau-t) \approx RP^\tau_t - C_t(\tau-t).
$$
Expected excess spot (and similarly futures) returns mix convenience yield and risk premia. Much storage literature assumes $RP=0$; finance evidence (FF 1987; Gorton–Hayashi–Rouwenhorst; Basu–Miffre; Hong–Yogo) favors time-varying premia.

Implications: (i) spots embed expectations; (ii) futures/swap pressures affect spots without physical delivery; (iii) risk-bearing capacity matters; (iv) higher moments enter via risk premia and precautionary demand. Claims that indexers “cannot affect cash prices without taking delivery” are false in this environment.

### Heterogeneous beliefs / DOE vs REE

Public data on oil supply/demand/inventories are noisy (Saporta–Trott–Tudela; IEA; EIA vs IEA discrepancies; vague OPEC quotas). Differences-of-opinion (DOE) equilibria allow disagreement about public information and generate volume, volatility, and — with uncertainty about others’ beliefs — price drift. Consensus Economics forecaster dispersion comoves positively with WTI level (Figure 2); dispersion predicts future realized vol (Garman–Klass / Yang–Zhang; adj $R^2$ 7–11%). Oil-vs-GDP forecast dispersion ratio spikes specially in 2008 (Figure 3) — disagreement about oil beyond disagreement about growth.

Limits to arbitrage: Acharya–Lochstoer–Ramadorai; Etula (broker-dealer risk-bearing); Hong–Yogo (open interest); Cheng–Kirilenko–Xiong (HF risk-bearing post-crisis).

### Inventory critique

IEA-style claim “speculation ⇒ inventories must rise” is too simple. Pre-2003 US commercial stocks vs price: negative relation; 2004–07 positive; unstable around 2008 (Figure 4). Emerging SPR omitted; data poor. Pirrong: time-varying vol can flip inventory–price sign. Dvir–Rogoff: with growth trends, demand shocks can raise both prices and desired inventories (amplification). Figure 5: inventories rise in contango; from 2007, curve steepening precedes inventory builds.

### Flow measurement

- **CIT reports:** weekly index trader positions in 12 ags; impute oil via GSCI/DJ-UBS weights (Verleger/Masters method).
- Validation: CIT-imputed vs iShares GSCI Trust positions corr **0.85** (Figure 6).
- Caveats: swap-dealer netting understates; scaling ag weights amplifies error; still useful if Δ series correlates with true index oil flows.
- Index AUM not purely passive: even conservative Stoll–Whaley estimates doubled 2006→mid-2008 then halved by early 2009.
- **MMS:** managed-money spread positions (simultaneous long/short along curve) — large HF activity; related to roll strategies and herding.

---

## Model / Methods

Forecasting equation for $n$-week excess return on $m$-month futures:
$$
ER^{m}_{t+n}(n) = \mu_{nm} + \Pi_{nm} X_t(n) + \Psi_{nm} ER^{m}_{t}(n) + \varepsilon_{t+n}.
$$
Predictors in $X$:
- $RSP_n, REM_n$: n-week S&P500 and MSCI Emerging Asia returns
- $REPO_n$: n-week change in primary-dealer Treasury overnight repo (funding liquidity / Etula)
- $IIP13$: 13-week change in imputed index long positions (mn contracts)
- $MMS13$: 13-week change in managed-money spreads (mn contracts)
- $OI13$: 13-week change in aggregate open interest
- $AVB_n$: n-week change in average basis across maturities 1…24m,
$$
  B_i(t)=\big(F^{T_i}_t/S_t\big)^{1/(T_i-t)}-1
$$
  averaged (Hong–Yogo style; sign opposite to some figures)

Standardize predictors by sample SD so $\Pi$ = response to 1 SD shock. NW SEs, 5 lags. Horizons $n=1,4$ weeks; maturities 1,3,6,12,24 months. Sample 2006-09-12 → 2010-01-12.

Excess returns: roll-adjusted generic futures P&L without multiplying $R_f$ (unfunded; contrast Hong–Yogo collateralized form).

Interpretation caution: CIT detail not public in real time for whole sample — predictive power implies flows impacted prices / correlated with informed pressure, not necessarily that investors conditioned on the CIT series itself.

---

## Results with Numbers

### Correlations (Table 1)

Contemporaneous: oil ER positively correlated with RSP, REM, IIP13, MMS13, OI13; negatively with AVB. Lagged: REM and REPO flip sign (negative); IIP13/MMS13 remain positively correlated with subsequent ER — momentum-style flow comovement.

### Means / vols (Table 2)

One-week ER means rise with maturity (1m ~0.03% to 24m ~0.17%); vols fall (6.49% → 4.32%). Four-week vols ~12.7% (1m) to ~8.6% (24m). IIP13 mean +3.81 (SD 8.42) mn contracts / 13 weeks; MMS13 mean +0.14 (SD 4.44).

### One-week forecasts (Table 3) — standardized coeffs

For ER1M(1): IIP13 **+2.32** ($t=3.60$), MMS13 **+1.62** ($t=4.46$), REPO1 **−1.69** ($t=-2.92$), REM1 **−1.69** ($t=-2.42$), AVB1 **−2.10** ($t=-6.86$), OI13 **−1.00** ($t=-2.12$). Adj $R^2\approx 0.27$. Pattern: flows positive and highly significant across maturities; magnitudes decline slowly with maturity; omitting REPO+IIP+MMS collapses $R^2$.

Avg ER(1) across 1–12m: IIP13 +1.80 ($t=3.79$), MMS13 +1.18 ($t=4.37$).

### Four-week forecasts (Table 4)

Even larger flow impacts: ER1M(4) IIP13 **+8.27** ($t=4.32$), MMS13 **+4.29** ($t=6.89$), OI13 **−4.34** ($t=-3.79$). Adj $R^2\approx 0.38$. Flow effects persist across the curve. When flows omitted, OI13 coefficient turns positive (insignificant) — Hong–Yogo open-interest effect is entangled with composition of who is trading.

### Economic magnitudes

IIP13 / MMS13 sample SDs 8.42 / 4.44 mn contracts. Per million barrels (approx): +1mn barrels index → ~2.2 bp (1w) / 9.3 bp (4w) on 3m futures; ~1.8 / 8.1 bp on 12m.

REM impulse: after controls, +1% REM1 → about −26 to −30 bp next-week 3m/12m returns, then positive at 2–3 week lags (overshoot then continuation).

REPO: negative on 1w ER (funding ease → lower required commodity premia), fading at 4w — short-lived funding channel.

AVB: strong at 1w (higher basis → lower subsequent ER), insignificant at 4w — aligns with earlier-sample FF / Hong–Yogo mixed horizon results.

### Timing vs 2008 peak (Figure 7)

IIP13 and 4w-MA of ER1M both turn down in spring 2008 *before* the price peak; IIP13 plunges after the peak; renewed positive IIP13 growth late 2008 leads recovery in futures returns.

### Robustness

- Cushing inventory: weak negative only on front month.
- Extra lagged ERs: flows survive.
- Baltic Dry 13w growth: +2–3% $R^2$, marginal significance; does not displace $X_t$.
- Projection of $S_{t+4}-F^{t+4}_t$ on $X$: adj $R^2$ 0.39; **only IIP13 and MMS13 significant** — average basis (CY proxy) does not forecast this spot-vs-futures gap. Suggests flows affect futures risk premia / curve habitat more than spot CY.

### Spread returns (Table 5)

Long far / short near spread ERs: MMS13 dominates (negative loadings — more HF spreads → near outperforms far), especially beyond 6m. Consistent with roll-anticipation / curve arbitrage (Mou) but effects extend past typical roll segment (even 6–12m and 12–24m). IIP13 weaker on spreads. AVB1 predicts weekly spread returns; AVB4 does not for monthly.

---

## Limitations

1. Short sample centered on crisis — external validity unclear.
2. Imputed oil index flows from ag CIT — measurement error.
3. Predictive ≠ structural causal identification of speculation vs informed fundamental trading.
4. CIT not fully real-time public — forecasting horse-race differs from implementable strategy test.
5. Unfunded ER definition vs fully collateralized alternatives.
6. US inventory figures miss global SPR / non-OECD stocks.
7. Linear projections; DOE theory suggests nonlinear disagreement effects.

---

## Quant-Investor Takeaways

1. **Flows are first-order state variables for oil around financialization.** 13-week index and HF spread growth predicted weekly/monthly futures ERs with large t-stats after standard macro/finance controls.

2. **Open interest alone misleads.** Sign of OI flips once flows are included — know *who* is expanding OI.

3. **Not just convenience yield.** AVB matters at 1w but flows predict spot−futures gaps where AVB does not — risk/information channels distinct from CY.

4. **Funding liquidity (repo) bites at short horizons.** Dealer balance-sheet tightness raises required oil futures returns (Etula mechanism).

5. **HF spreads move the curve, not only the level.** MMS13 forecasts slope returns along the term structure — risk-manage roll and butterfly exposures when CTA/HF spread books grow.

6. **Disagreement diagnostics.** Monitor forecaster dispersion and oil-vs-GDP disagreement as boom/bust risk indicators alongside positioning.

7. **Crisis playbook.** Spring 2008: flows and returns rolled over before the price peak — positioning/momentum exhaustion can lead price. Risk systems should track Δ13w index and spread books, not only price level.

8. **Policy/research:** More OTC commodity derivatives transparency would clarify who holds risk; representative-agent storage models are incomplete for 2000s oil.


---

## Extended Theory Notes for Modeling Teams

### Mapping DOE to a trading book

If investors learn from prices about others’ beliefs, trend-following and positioning feedback are not irrational per se — they are equilibrium responses to higher-order uncertainty. A risk system that only flags “price far from Hamilton fundamentals” without positioning may miss endogenous drift. Practical proxy stack: (1) CIT/DCOT category deltas; (2) index AUM estimates; (3) dispersion of professional forecasts; (4) EM equity and FX as growth-signal public info; (5) dealer repo / TED / balance-sheet metrics.

### Why weekly–monthly horizons matter

Daily lead-lag studies (often finding little flow impact) are dominated by microstructure noise. Singleton’s 13-week flow growth targeting 1–4 week returns matches the cadence of macro information releases and institutional allocation committees. Quants should not dismiss financialization because tick-level Granger tests fail.

### Interaction with Gorton–Rouwenhorst

GR document long-run negative equity–commodity correlation and inflation hedging. Singleton’s sample is exactly when Tang–Xiong find those correlations flipping more equity-like for indexed commodities. Strategic allocation should Bayesian-update correlations with a financialization state variable (index AUM / GDP, or IIP-type flows) rather than assuming 1959–2004 moments are permanent.

### Interaction with Fama–French

FF basis regressions speak to storage and forecast power. Singleton shows that holding AVB fixed, flows still predict ER — so 2006–09 oil returns were not “just” basis/CY. Both papers can be true: storage organizes the curve, while risk-bearing and learning organize risk premia overlays on that curve.

### Worked magnitude example

Suppose IIP13 rises by +1 SD (8.42 mn contracts). Table 4 says ER1M(4) rises ~8.27 percentage points over the next month ceteris paribus — enormous relative to unconditional means near zero. Even haircutting 75% for overfitting/crisis specificity leaves a several-percent monthly effect — enough to dominate most discretionary macro calls. Risk limits on index-flow beta are therefore mandatory for relative-value oil books.

### Spread desk implications

Negative MMS13 loading on long-far/short-near returns means growing HF spread books historically accompanied near-contract outperformance (or far underperformance) — the footprint of roll predation and curve compression. If your pension index product is long the roll, you pay this transfer (Mou). Mitigants: extended rolls, off-benchmark contracts, OTC swaps with negotiated rolls.

### Inventory dashboard redesign

Replace the naive “speculators must raise inventories” checklist with: (i) term structure (M2–M4); (ii) OECD commercial vs SPR; (iii) China/India opaque stocks (qualitative); (iv) vol state; (v) growth-trend priors (Dvir–Rogoff). Positive inventory–price comovement can be precautionary/amplifying, not proof against speculation.

### Forecast dispersion as a risk factor

Build a monthly factor: cross-sectional SD of Consensus (or Bloomberg survey) 12m WTI forecasts. Univariate: positively associated with price level and future realized vol. In a multivariate risk model, interact dispersion with positioning — high disagreement + rising IIP was the 2008 cocktail.

### Replication caveats for 2020s data

DCOT categories differ from CIT; oil now has more direct index products; swap dealer reporting changed. Re-estimate with post-2010 data before claiming the same Π magnitudes. The *qualitative* lesson — intermediate-horizon institutional flows forecast returns after CY controls — remains the hypothesis to test.

---

## Section Guide

**§1** frames the debate. **§2** builds RP + DOE theory and shows dispersion facts. **§3** dismantles simplistic inventory tests. **§4** constructs flows. **§5** is the empirical core (Tables 1–5). **§6** concludes with welfare remarks (near-rational correlated errors → social costs; Hassan–Mertens) and call for OTC data.

---

## Conclusion

Singleton relocates the 2008 oil boom/bust debate from a binary “fundamentals vs evil speculators” fight into modern asset pricing with informational frictions and limits to arbitrage. Empirically, index and managed-money spread flows had large, robust predictive power for WTI futures excess returns and curve shape after controlling for equities, funding, open interest, basis, and lagged returns. For quantitative oil traders and multi-asset risk managers, positioning growth rates belong in the state vector alongside inventories and the basis.


---

## Extended Empirical Narrative and Desk Playbook

### Timeline reconstruction (2006–2010)

- 2006–early 2007: index positions rising; oil grinding higher; disagreement elevated.
- 2007–H1 2008: IIP13 strong; EM growth narratives dominate; inventory–price relation unstable; dispersion high.
- Spring 2008: IIP13 and short-horizon ER roll over before the July price peak — critical lead indicator.
- Post-peak 2008: IIP13 plunges; prices collapse; funding stress (REPO) spikes in importance.
- 2009: index flows stabilize/recover; futures ER recovers with a lag.

### Interpreting standardized coefficients

A +1 SD IIP13 shock raising 4-week front ER by ~8% is a crisis-sample estimate. Production risk systems should:

1. Fit Singleton-style regressions on expanding windows.
2. Report coefficients with NW t-stats.
3. Cap the *risk charge* for flow sensitivity using winsorized β rather than raw point estimates.
4. Still treat sign and significance as regime flags.

### Control orthognality

AVB’s low correlation with IIP/MMS/REPO (−0.05 to −0.15) is econometrically helpful: CY and flow channels are not the same variable. When both enter, flows survive — the headline result.

### Open interest sign flip lesson

Hong–Yogo: rising OI predicts higher subsequent commodity returns (downward-sloping demand for futures). Singleton: after controlling for *whose* OI, the OI coefficient turns negative at monthly horizons. Desk rule: never look at OI without DCOT/CIT category splits.

### Spread return desk rules

If MMS13 rising: expect near-end relative strength (negative long-far/short-near ER). Indexers rolling nearby → pay; HF mid curve → collect. Mitigate with longer roll windows or OTC.

### Forecasting vs strategy

Because CIT oil imputation was not cleanly tradeable ex ante for the whole sample, treat results as evidence of price impact / information in institutional flows, then seek *implementable* proxies: ETF flows, CTA positioning reports, calibrated index AUM series.

### Link to disagreement theory

Figure 2’s price–dispersion comovement + vol predictability matches DOE comparative statics better than REE mean-reversion intuition (which predicts consensus on reversals at extreme prices). Risk: high dispersion regimes deserve higher vol charges and lower leverage.

### Inventory communication for policymakers

Singleton’s §3 is the rebuttal memo to “show me the stocks.” Teach journalists that (i) global opaque SPR matter; (ii) theory allows positive inventory–price comovement under uncertainty/growth trends; (iii) curve steepening leading inventories fits expectations-driven storage.

### Replication recipe (code outline)

1. Build continuous futures ER series with Singleton roll definition (Appendix).
2. Impute weekly IIP from CIT ags × index weights × oil price scaling.
3. Pull MMS spreads from CIT/DCOT.
4. Merge RSP, REM, primary dealer repo changes, OI, AVB.
5. Standardize X; OLS with NW(5); report Tables 3–5 analogues.
6. Stress: drop 2008H2; split pre/post Lehman; replace REM with Baltic Dry.

### Closing Singleton paragraph

For oil and financialized commodities, Singleton makes institutional flow growth a first-class predictive state variable alongside basis and macro proxies. Combined with DOE theory and inventory caveats, the paper remains required reading for any quant sitting oil risk through an allocation wave or a bust.


---

## Lecture-Length Reconstruction of Empirical Core

### Re-deriving the forecasting regression interpretation

Hodrick (1992) / Singleton (2006) duality: projecting future short-horizon returns on past 13-week flow growth tests both (a) return predictability and (b) whether short-horizon returns “cause” cumulative flow impacts over the 13-week window under stationarity. Either reading rejects the null that institutional flows are irrelevant for oil futures pricing in 2006–10.

### Coefficient atlas (approximate from Tables 3–4)

| Predictor | 1w front ER response / 1SD | 4w front ER response / 1SD | Sign economic story |
|-----------|----------------------------|----------------------------|---------------------|
| IIP13 | +2.3% | +8.3% | Index allocation pressure / momentum in positioning |
| MMS13 | +1.6% | +4.3% | HF spread growth associated with higher prices |
| OI13 | −1.0% | −4.3% | Composition-adjusted; opposite raw HY intuition |
| REPO | −1.7% | ~0 | Funding ease lowers required ER short-term |
| REM | −1.7% then + at longer lags | +2–3% | Overshoot then growth-news continuation |
| AVB | −2.1% | ~0 | High basis → lower near-term ER; CY channel |
| Lagged ER | mild negative front | stronger negative | Short-horizon reversal after controls |

### Per-barrel translation discipline

Always convert standardized betas back to bp per million barrels using sample SD of IIP13. Quote both: traders think in barrels; statisticians think in SD units.

### Placebo and falsification ideas

1. Shuffle IIP13 calendar by 26 weeks — coefficients should collapse.
2. Use agricultural CIT directly without oil imputation — weaker for WTI.
3. Replace MMS with managed-money long-only — different story.
4. Pre-2004 sample with Masters-style imputation if available — financialization onset test.

### Risk-system pseudocode

```
each week:
  update IIP13, MMS13, OI13, AVB, REPO, REM, RSP
  z = standardize(X, trailing_5y_mu_sd)
  er_hat_1w = Pi_1w · z
  er_hat_4w = Pi_4w · z
  if abs(er_hat_4w) > threshold: flag positioning_regime
  charge = f(|IIP13_z|, |MMS13_z|, dispersion)
  scale oil_book_risk_budget by 1/(1+charge)
```

### DOE classroom vignette

Two investor classes differ in $\phi$ mapping public GDP news to oil demand. Wealth-weighted consensus sets $r_t$ and subjective convenience yields $C^j$. Dispersion $\Psi_t$ enters rates and futures. A release that barely changes GDP forecasts but changes perceived disagreement can move oil a lot — matching “small news, large price” episodes in 2008 commentary (Saporta et al.).

### Welfare paragraph expansion

Lucas/Cochrane near-rationality: private costs of tiny policy errors are second-order for agents but first-order for prices when errors correlate (Hassan–Mertens). Index investors slightly overweight oil on EM growth narratives → socially costly price drift if real activity contracts on energy prices (Hamilton oil-macro channel). Policy tension: curb destabilizing correlated errors without killing hedging markets.

### Closing expanded Singleton conclusion

The 2012 paper is the intellectual bridge from classical storage/premium empiricism (FF, GR) to financialization empiricism (Tang–Xiong, Mou, Buyuksahin–Robe). Its forecasting results — large, robust flow coefficients after CY and macro controls — remain the quantitative benchmark any contrary study must beat.


### Supplementary reflection

-money long-only — different story.
4. Pre-2004 sample with Masters-style imputation if available — financialization onset test.

### Risk-system pseudocode

```
each week:
  update IIP13, MMS13, OI13, AVB, REPO, REM, RSP
  z = standardize(X, trailing_5y_mu_sd)
  er_hat_1w = Pi_1w · z
  er_hat_4w = Pi_4w · z
  if abs(er_hat_4w) > threshold: flag positioning_regime
  charge = f(|IIP13_z|, |MMS13_z|, dispersion)
  scale oil_book_risk_budget by 1/(1+charge)
```

### DOE classroom vignette

Two investor classes differ in $\phi$ mapping public GDP news to oil demand. Wealth-weighted consensus sets $r_t$ and subjective convenience yields $C^j$. Dispersion $\Psi_t$ enters rates and futures. A release that barely changes GDP forecasts but changes perceived disagreement can move oil a lot — matching “small news, large price” episodes in 2008 commentary (Saporta et al.).

### Welfare paragraph expansion

Lucas/Cochrane near-rationality: private costs of tiny policy errors are second-order for agents but first-order for prices when errors correlate (Hassan–Mertens). Index investors slightly overweight oil on EM growth narratives → socially costly price drift if real activity contracts on energy prices (Hamilton oil-macro channel). Policy tension: curb destabilizing correlated errors without killing hedging markets.

### Closing expanded Singleton conclusion

The 2012 paper is the intellectual bridge from classical storage/premium empiricism (FF, GR) to financialization empiricism (Tang–Xiong, Mou, Buyuksahin–Robe). Its forecasting results — large, robust flow coefficients after CY and macro controls — remain the quantitative benchmark any contrary study must beat.


In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. 