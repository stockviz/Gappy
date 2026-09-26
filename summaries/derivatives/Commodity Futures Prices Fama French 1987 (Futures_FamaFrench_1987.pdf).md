# Commodity Futures Prices: Forecast Power, Premiums, and the Theory of Storage (Fama–French 1987) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Commodity Futures Prices: Some Evidence on Forecast Power, Premiums, and the Theory of Storage |
| **Authors** | Eugene F. Fama; Kenneth R. French (University of Chicago) |
| **Outlet** | *Journal of Business*, Vol. 60, No. 1 (January 1987), pp. 55–73 |
| **JSTOR** | https://www.jstor.org/stable/2352947 |
| **Support** | NSF (Fama); Chicago Board of Trade (French) |
| **Sample** | Up to 21 commodities; interest rates Jan 1967–May 1984; futures samples vary by contract (often mid-1960s–1984) |
| **Methods** | Storage-cost regressions; Fama (1984)-style basis split regressions; portfolio average returns |

---

## Problem / Motivation

Two popular views of commodity futures prices:

1. **Theory of storage** (Kaldor 1939; Working 1948; Brennan 1958; Telser 1958): the basis (futures − spot) reflects interest forgone, warehousing costs, and convenience yield on inventory.
2. **Expected premium + forecast** view (Cootner; Dusak; Breeden; Hazuka): futures = expected future spot + expected risk premium (possibly time-varying).

The storage theory is uncontroversial in structure; controversy surrounds whether futures contain expected premiums and/or forecast power for spots. FF argue more powerful statistical tests make storage-cost responses easier to detect than premium/forecast evidence — because basis variation is often tiny relative to realized premium and spot-change noise.

---

## Setup / Data

### Storage identity

Let $F(t,T)$ be futures price at $t$ for delivery at $T$, $S(t)$ spot at $t$. Theory of storage:
$$
F(t,T) - S(t) = S(t)R(t,T) + W(t,T) - C(t,T) \tag{1}
$$
or in relative form:
$$
\frac{F(t,T)-S(t)}{S(t)} = R(t,T) + \frac{W(t,T)-C(t,T)}{S(t)}. \tag{2}
$$
$R$ = interest forgone; $W$ = marginal storage cost; $C$ = marginal convenience yield. Convenience yield: productive value of inventory (input continuity; meeting unexpected demand). Theory predicts $C$ falls as inventories rise.

### Measuring the basis

- Maturities: 1, 3, 6, 12 months.
- Interest rates: beginning-of-month T-bill yields from Salomon Brothers *Analytical Record* (Jan 1967–May 1984).
- Spot proxy: maturing futures price (same commodity, synchronized) — limits sample size but ensures consistency.
- Contract maturity assumption: first trading day of delivery month.
- Metals (Cu, Au, Ag) have supplemental short-dated contracts filling calendar months.

### Commodities (21)

Agricultural: cocoa, coffee, corn, cotton, oats, orange juice, soybeans, soy meal, soy oil, wheat. Wood: lumber, plywood. Animal: broilers, cattle, eggs, hogs, pork bellies. Metals: copper, gold, platinum, silver.

### Basis variability (Table 2 intuition)

6-month basis σ (3-month for cotton): precious metals lowest (gold 2.0%, silver 1.5%, platinum 4.2%); ag mid (corn 4.6% to oats 9.7%); animal products highest (cattle 5.6%; broilers 10.1% to eggs 22.2%). Pattern matches storage theory: low storage-cost / nonseasonal metals → low basis σ; high bulk/perishability livestock → high basis σ.

---

## Model / Methods

### Storage regression

$$
\frac{F(t,T)-S(t)}{S(t)} = \sum_{m=1}^{12} a_m d_m + \beta R(t,T) + e(t,T) \tag{3}
$$
Hypothesis: $\beta=1$ for continuously stored commodities (basis tracks nominal rates one-for-one). Seasonal dummies $d_m$ proxy seasonal convenience-yield variation.

### Forecast / premium split (Fama 1984 approach)

Identity:
$$
F(t,T)-S(t) = \mathbb{E}_t[P(t,T)] + \mathbb{E}_t[S(T)-S(t)] \tag{4}
$$
with expected premium $\mathbb{E}_t[P(t,T)] = F(t,T)-\mathbb{E}_t[S(T)]$.

Regressions:
$$
\begin{aligned}
S(T)-S(t) &= a_1 + b_1[F(t,T)-S(t)] + u \qquad (6)\\
F(t,T)-S(T) &= a_2 + b_2[F(t,T)-S(t)] + z \qquad (7)
\end{aligned}
$$
Adding-up: $a_1+a_2=0$, residuals sum to 0, **$b_1+b_2=1$**. Positive $b_1$ ⇒ forecast power; positive $b_2$ ⇒ time-varying expected premiums. Prices in natural logs for these tests. Maturities shown: 2, 6, 10 months.

### Univariate premium tests

Average $F(t,T)-S(T)$ per maturity has almost no power (huge premium variance; sparse maturities). Follow Bodie–Rosansky: form monthly simple returns from shortest contract with ≥1 month to maturity; build EW portfolios (all 21; ag; wood; animal; metals).

---

## Results with Numbers

### Interest-rate tracking (Table 2)

**Metals — strongest storage evidence.** Gold 6-month $\hat\beta\approx 1.07$; 1/3/12-month estimates 0.99–1.06. Interest alone explains **83%** of gold 6-month basis variance; silver ~60%. Platinum and copper weaker $R^2$ but $\hat\beta$ near 1.

**Agricultural & wood:** all $\hat\beta>0$, many near 1, only two >1 SE from 1 — but SE($\hat\beta$)>0.5, so imprecise. Consistent with storage but not conclusive one-for-one proof.

**Animal products:** SE typically >1; estimates compatible with 0 or 1. Basis variation dominated by $W-C$, not $R$.

### Seasonals

No reliable metal seasonals (as expected). Reliable ag seasonals: corn, oats, OJ, soybeans, wheat (corn clearer at 3-month than 6-month). No reliable seasonals: cocoa, coffee, cotton, soy meal, soy oil — interesting given soybean seasonals (processing dampens). **Strongest seasonals: animal products** — broilers, cattle, eggs, pork bellies $R^2\geq 0.19$ in seasonal regs; hogs weaker at 6-month but 1- and 3-month seasonal $R^2$ = 0.47 and 0.72. Lumber/plywood: high storage costs + demand seasonals but no reliable basis seasonals (production more adaptable?).

### Basis σ vs change/premium σ (Table 3, 2-month)

Spot-change and premium σ large and similar across groups (~9–18%). Basis σ small for metals (gold 0.6%, silver 0.5%) vs hogs 7.1%, eggs 13.2%. When basis σ ≪ change/premium σ, regressions (6)–(7) cannot reliably split expected premium vs expected spot change — even though $b_1+b_2=1$ always.

### Forecast power vs premiums (Tables 4–5 scoreboard)

**Type SF (strong forecast, all maturities; no reliable TV premiums):** broilers, eggs, hogs, oats. Change-regression slopes often >4 SE from 0; $R^2$ broilers 0.40–0.42; oats 0.20–0.35.

**Type GF (good forecast, some maturities):** cattle, pork bellies, soybeans, soy meal.

**Type SP (strong TV premiums all maturities):** soy oil, lumber. Evidence weaker than SF forecast evidence (max premium $t$~3.71; $R^2\leq 0.27$).

**Type GP (premiums some maturities):** cocoa, corn, wheat.

**Type F&P:** orange juice, plywood — forecast at long maturities; premiums at short.

**Type W (weak/unreliable):** coffee, copper, cotton (suggestive both); gold, platinum (basis too quiet); silver (bizarre slopes, e.g. 2-month change slope −8.56 — under investigation).

**Scoreboard pattern:** High basis-σ commodities (eggs, hogs, broilers, lumber…) drive identifiable $b_1$ or $b_2$. Storage-cost/seasonal commodities drive forecast power. Low basis-σ metals identify $\beta\approx 1$ in storage regs but fail forecast/premium split.

### Storage costs ↔ forecast power

Eight commodities with reliable forecast power for most maturities: five animal (broilers, cattle, eggs, hogs, pork bellies) + oats, soybeans, soy meal — all high storage cost relative to value. Gold/platinum: low storage cost, low basis σ, no forecast power. Of 10 commodities with reliable basis seasonals, 8 show forecast power; of 10 with forecast power, 8 have seasonals.

### Portfolio average returns (Table 6)

Monthly simple returns, shortest deferred contract:

| Portfolio | Obs | Simple M% | SD | $t$ | Cont. comp. M% | $t$ |
|-----------|-----|-----------|-----|------|----------------|-------|
| All 21 | 222 | **0.54** | 4.3 | **1.87** | 0.45 | 1.57 |
| Agricultural | 222 | 0.83 | 5.4 | 2.29 | 0.69 | 1.97 |
| Wood | 177 | −0.23 | 7.5 | −0.42 | −0.51 | −0.91 |
| Animal | 220 | 0.00 | 6.3 | 0.00 | −0.20 | −0.46 |
| Metals | 222 | 0.57 | 8.3 | 1.02 | 0.23 | 0.43 |

Individual highlights (simple): cocoa 1.59% ($t=2.33$), coffee 1.84 (2.13), soy oil 1.91 (2.47), hogs 1.11 (2.06); eggs **−2.01** ($t=-2.56$). Continuously compounded: only eggs reliably nonzero — and negative. Inflation negligible for monthly futures variation (CPI component σ ~0.25% vs futures σ many %).

**Interpretation:** Marginal evidence of normal backwardation at portfolio level; sensitive to simple vs log returns; never strong enough to end the premium debate. Explains decades of controversy.

---

## Limitations

1. Maturing-futures-as-spot truncates samples; no true cash markets for many commodities.
2. Seasonal dummies are crude convenience-yield proxies (no inventory data for many series).
3. Storage-cost $W$ not directly measured — inferred from cross-commodity patterns.
4. Silver anomalies unresolved in-paper.
5. Power problem is structural: high spot uncertainty is why futures markets exist — also why premium tests fail.
6. Sample ends mid-1980s; pre-financialization.
7. Univariate means cannot separate constant premium from zero; regressions need basis variation.

---

## Quant-Investor Takeaways

1. **Trade the storage complex, not a single narrative.** Metals: basis ≈ rate trade / carry. Ags & livestock: basis ≈ seasonal inventory / forecast tool. One risk model does not fit all.

2. **Basis forecast power concentrates where storage is expensive.** Livestock and high-storage ags: $b_1$ large — curve shape predicts spot moves. Do not expect the same from gold.

3. **Time-varying premium evidence is sparse and weaker than forecast evidence.** Soy oil and lumber are the clean SP cases; most commodities are SF/GF or weak. Sorting on basis for “risk premium” (as in Gorton–Rouwenhorst Table 8) is a portfolio strategy that may mix premium and expected spot effects.

4. **Normal backwardation is portfolio-level and fragile.** ~0.5%/month simple EW; $t\approx 1.9$; log means weaker. Size commodity risk premia with humility; diversify across commodities.

5. **Statistical design lesson:** When dependent variable is noisy (premium, ΔS), you need large basis variance to identify slopes. When testing storage, put basis on the LHS — tracks of $R$ and seasonals appear cleanly for metals and seasonal goods respectively.

6. **Implementation:** For carry strategies in metals, hedge rate exposure explicitly. For ag calendar spreads, seasonal dummies / crop-year indicators are first-order. For livestock, expect high basis volatility and forecastable seasonal spot paths.

7. **Research link forward:** French (1986) on detecting spot forecasts; Hazuka (1984) on consumption betas; later inventory papers reconnect $C(t,T)$ to measurable stocks — completing what FF’s seasonal dummies start.


---

## Extended Econometric Discussion

### Why $b_1+b_2=1$ is both a blessing and a curse

The adding-up constraint means the regressions always “explain” 100% of basis variation as some mix of expected premium and expected spot change — including irrational forecast errors (which load on $b_2$) and spot measurement error (which loads on $b_1$). Statistical reliability, not mechanical allocation, is the issue. When $\sigma(\text{basis})$ is 0.6% and $\sigma(\Delta S)$ is 13%, even a true $b_1=1$ is lost in noise.

### Relation to FX and bond basis regressions

Fama (1984a,b) used the same split for forward FX and bond term premia. Commodity application inherits the same power geometry: quiet bases (metals, like some FX pairs with strong rate links) identify carry/rate structure; volatile bases identify forecast components.

### Practical backtest implications

If you run a naı̈ve regression of subsequent futures returns on basis across all commodities pooled, you mix SF commodities (where basis predicts spots, and futures returns ≈ spots near expiry) with SP commodities (where basis predicts premium). Prefer stratified tests by storage-cost group, or portfolio sorts with industry/sector controls.

### Continuously compounded vs simple returns

Jensen’s inequality: with monthly σ≈4% on the EW portfolio, $\mathbb{E}[r]-\mathbb{E}[\ln(1+r)]\approx \sigma^2/2$ on the order of 0.08–0.10% per month — enough to move $t$-stats from 1.87 to 1.57. Reporting both is mandatory for commodity premium claims.

### What FF would say to a 2000s indexer

Index investors harvesting “roll yield” are partly harvesting the average basis. FF warn that basis variation is mostly expected spot change for many commodities — so roll yield is not pure risk premium. Gorton–Rouwenhorst’s long-sample High−Low still works, but attribution needs the FF split mindset.

---

## Section-by-Section Teaching Notes

**§II.A–C:** Teach eqs (1)–(2); show Table 2 σ ordering; assign students to match commodities to storage-cost ranks.

**§II.D:** Estimate (3); test $\beta=1$; F-test seasonals. Gold as poster child; hogs as seasonal poster child.

**§III.A:** Derive $b_1+b_2=1$; discuss measurement-error biases.

**§III.B:** Classify commodities into SF/GF/SP/GP/F&P/W using t-stats and $R^2$.

**§III.C:** Link storage costs and seasonals to forecast power — the intellectual climax.

**§III.D / Table 6:** Portfolio means; discuss why controversy persists.

**§IV:** Summary contrast: storage tracks easier to find than premium/forecast tracks.

---

## Numerical Example: Gold vs Eggs

Gold 2-month basis σ = 0.6%; spot-change σ = 13.1%; premium σ = 13.2%. Interest explains most of the tiny basis. You can trade gold calendar spreads as nearly pure rate + tiny convenience, but you cannot statistically detect whether the 0.6% basis is premium or expected ΔS.

Eggs 2-month basis σ = 13.2%; change σ = 16.3%; premium σ = 12.6%. Basis is same order as outcomes — regressions can speak. Seasonals huge; forecast power strong; average simple return −2.01%/month ($t=-2.56$) — a caution that “commodities earn premia” is not commodity-by-commodity true.

---

## Conclusion

Fama and French deliver the classic dual-view empirics of commodity futures. Storage theory leaves clear fingerprints on the basis — especially rate tracking in metals and seasonals in livestock/ags. The premium/forecast decomposition is identified only when basis variance is large, and even then forecast power is the more common finding; portfolio-level normal backwardation is only marginal. For quants, the paper is both a methods template (basis regressions with adding-up) and a warning label on over-interpreting roll yield as pure risk premium.


---

## Comprehensive Replication Playbook

### Data construction checklist

1. Collect settlement futures for standard contract months listed in FF Table 1 structure (sample periods differ by commodity).
2. Define spot on date $t$ as the futures expiring in the current month (first trading day convention for maturity).
3. Build relative basis $[F(t,T)-S(t)]/S(t)$ for $T-t \in \{1,3,6,12\}$ months when both prices exist.
4. Merge beginning-of-month T-bill yields matching horizon $T-t$ from Salomon (or modern CRSP T-bill files as substitute).
5. For forecast/premium regs, use log prices: $f=\ln F$, $s=\ln S$.

### Regression diagnostics FF would expect

- Report Newey–West or Hansen–Hodrick SEs when overlapping horizons (6- and 12-month bases overlapping monthly).
- Always publish $b_1$ and $b_2$ even though they sum to 1 — readers want both t-stats.
- Stratify results by metal / ag / wood / animal — pooled estimates obscure the storage-cost gradient.
- For seasonals, report F-test that all $a_m$ equal, not just individual months.

### Trading interpretation matrix

| Commodity type | Storage regression message | Split regression message | Trader implication |
|----------------|----------------------------|--------------------------|---------------------|
| Gold, silver | $\beta\approx 1$, high $R^2$ on rates | Cannot split premium vs ΔS | Calendar spreads ≈ rate + tiny CY |
| Corn, wheat, soybeans | Seasonals matter; β noisy | Often forecast power | Crop-year spreads; harvest calendar |
| Hogs, eggs, broilers | Seasonals dominate | Strong forecast power | Livestock calendar spreads; hedge timing |
| Lumber, soy oil | Mixed | TV premiums (SP) | Candidate premium-harvest spreads |
| Copper, coffee, cotton | Intermediate | Weak identification | Need more data / inventories |

### Connection to modern term-structure models

Casassus–Collin-Dufresne and related affine commodity models parameterize convenience yield as mean-reverting latent state — a continuous-time cousin of FF’s $C(t,T)$. FF’s finding that metals track rates validates the interest component; their seasonal dummies are reduced-form stand-ins for seasonal CY in ags. A modern quant should estimate CY from the curve *and* from inventory when available (EIA, USDA) rather than dummies alone.

### Why individual average premiums fail

Table 3: premium σ often 10–18% for a 2-month horizon. Detecting a 1% expected premium needs hundreds of non-overlapping observations for conventional t-stats — but each commodity has far fewer 2-month non-overlapping spells than calendar months. Portfolio formation averages idiosyncratic noise; that is why Bodie–Rosansky / FF portfolio means are the right battleground for the Keynesian hypothesis.

### Detailed walkthrough of equation (4) vs (2)

Suppose pre-harvest wheat: inventories low, CY high, so (2) ⇒ negative basis (backwardation in market jargon). Equivalently in (4): market expects spot to fall when harvest arrives, so $\mathbb{E}[\Delta S]<0$, possibly with small premium. Same economics, two languages. FF’s regressions ask which language statistically fits time-series variation. For wheat they find GP (premiums at some maturities) plus seasonal storage evidence — mixed attribution.

### Animal products deep dive

Bessant (1982) documents production and demand seasonals. Bulk + perishability ⇒ storage costly ⇒ large expected seasonal spot swings ⇒ large basis seasonals ⇒ forecast power in (6). This is the cleanest confirmation of storage theory’s predictive content for *expected spot changes*. It does *not* say livestock futures are great unconditional risk-premium assets — Table 6 animal portfolio mean is ~0.

### Metals deep dive

Low σ(basis)/σ(ΔS) is not a failure of futures markets; it is evidence that inventories buffer shocks so expected price changes stay small. Gold’s 83% $R^2$ on rates is among the cleanest carry identities in all of empirical finance. Silver’s pathological split-regression slopes may reflect mint/industrial dual demand, changing contract specs, or outliers in a low-basis-variance environment — treat silver calendar-spread research with extra robustness checks.

### Wood products puzzle

High storage costs and construction seasonality suggest seasonals, but FF find unreliable seasonal coefficients for lumber/plywood while still finding SP (lumber) and F&P (plywood). Interpretation: supply can ramp with demand more elastically than livestock herds, muting seasonal CY; remaining basis variation may lean toward time-varying risk premia (housing cycle risk).

### Portfolio construction for a “FF-aware” commodity book

1. Bucket contracts into Metal / Seasonal-Ag / Livestock / Soft / Energy (energy mostly post-FF).
2. Risk model: shared industrial factor + bucket seasonal factors + rates for metals.
3. Alpha model: basis × bucket interaction — expect higher forecast-based signals in livestock/ags; premium-based signals only where SP evidence exists.
4. Shrinkage: pool premium estimates toward portfolio mean (0.54% simple) with commodity-specific credibility weights based on basis σ.

### Historical controversy map

- Keynes/Hicks: normal backwardation as institutional hypothesis.
- Working: emphasized storage; skeptical of simple risk-premium stories.
- Telser vs Cootner: classic debate.
- Dusak (1973): CAPM betas near 0 for some futures — challenge to equity-style premia.
- Bodie–Rosansky (1980): portfolio evidence for positive returns.
- FF (1987): storage clearer than premia; portfolio premia marginal.
- Gorton–Rouwenhorst (2004/06): long-sample EW premia significant.
- Financialization literature: flows and correlations change the game.

### Teaching problem set ideas

1. Replicate gold and hog versions of (3) on modern data (2000–2024). Does gold still track rates one-for-one in ZIRP/NIRP regimes?
2. Replicate (6)–(7) for natural gas (high storage-cost seasonality) — does it classify as SF?
3. Compare simple vs log portfolio means monthly 1985–2024; how did $t$-stats evolve?
4. Add inventory data to replace seasonal dummies for crude and copper; test incremental $R^2$.

### Limitations revisited with modern eyes

Missing energy complex is material: crude, heating oil, nat gas dominate today’s indices and have strong seasonal storage economics. FF’s livestock lessons likely transfer to energy seasonals; their metal lessons transfer to gold. Softs (coffee, cocoa) remain statistically awkward — high jump risk, climate shocks, basis identification weak.

### Quant checklist summarizing FF

- [ ] Separately estimate storage-track and premium/forecast-track models
- [ ] Never infer premium from basis without checking $b_2$ significance
- [ ] Use portfolio means for unconditional premium claims
- [ ] Expect forecast power where storage is costly and seasonal
- [ ] Treat metals as rate-sensitive carry, not forecast machines
- [ ] Report simple and continuously compounded statistics
- [ ] Haircut any single-commodity premium estimate by its Table-3 noise

### Extended conclusion for FF

The paper’s lasting gift is methodological clarity: two observationally related but statistically asymmetric empirical programs. Putting the basis on the left makes storage economics visible; putting realized premiums and spot changes on the left often yields inconclusive splits precisely because futures exist for volatile spots. Normal backwardation survives as a fragile portfolio-level tendency, not a sharp law. Quants who ignore this asymmetry will mis-attribute roll yield, overtrade metal forecast signals, and undertrade livestock seasonal forecasts.


Additional note: When implementing Fama–French basis regressions in production research code, enforce the adding-up constraint in seemingly unrelated regressions (SUR) so that estimated $b_1+b_2=1$ exactly each maturity, and bootstrap commodity-clustered confidence intervals to address cross-commodity residual correlation induced by macro shocks. This does not create identification where basis variance is insufficient, but it prevents incoherent reporting across the paired equations (6) and (7).


---

## Full Quantitative Restatement of Main Findings

Across 21 commodities, the theory of storage organizes the cross-section of basis volatilities and the time-series response of bases to interest rates and seasonal dummies. Precious metals exhibit the lowest basis standard deviations and the most precise one-for-one interest-rate coefficients (gold interest-only $R^2$ of 0.83 at six months). Agricultural commodities show intermediate basis volatility and reliable harvest-linked seasonals for corn, oats, orange juice, soybeans, and wheat. Animal products show the largest basis volatilities and the strongest seasonal $R^2$, consistent with high storage costs relative to value. Wood products are a partial exception: costly to store and seasonally demanded, yet without reliable seasonal dummy significance.

The alternative decomposition of the basis into expected premium plus expected spot change is statistically identified primarily when basis variance is large. Consequently, forecast power concentrates in broilers, eggs, hogs, oats (strong across maturities) and in cattle, pork bellies, soybeans, and soy meal (good for most maturities). Time-varying expected premiums are reliably detected for soy oil and lumber across maturities, with weaker maturity-specific evidence for cocoa, corn, and wheat. Orange juice and plywood show forecast power at long horizons and premiums at short horizons. Coffee, copper, cotton, gold, platinum, and silver generally yield weak or pathological split-regression estimates.

Unconditional average premiums for individual commodities are almost never significant despite economically large point estimates, because monthly return standard deviations often exceed 10%. Combining contracts into an equally weighted portfolio of all commodities produces a mean simple return of 0.54% per month ($t=1.87$) and a continuously compounded mean of 0.45% ($t=1.57$). The agricultural sub-portfolio is stronger ($t\approx 2$); wood, animal, and metal sub-portfolios are not. These results leave normal backwardation as a plausible but statistically fragile portfolio-level phenomenon — precisely why the debate persisted from Keynes through the mid-1980s and beyond.

For applied work, the operational summary is: (1) estimate storage-track models with basis on the left-hand side; (2) estimate forecast/premium-track models only where basis variance warrants; (3) shrink commodity-level premium estimates toward diversified portfolio means; (4) align trading signals with the storage-cost gradient — seasonal forecast signals in livestock and grain markets, rate-linked carry in precious metals, and skepticism toward one-size-fits-all roll-yield narratives.


### Closing practitioner paragraph

A commodity desk that internalizes Fama and French will stop asking only “is the market in backwardation?” and start asking “for this commodity, is basis variation mostly expected spot change, mostly premium, or mostly noise relative to outcomes?” The answer differs for gold versus hogs. That single clarification prevents countless mis-specified carry strategies and aligns research effort with where statistical power actually lives. Combined with Gorton–Rouwenhorst’s long-sample index facts, FF supplies the micro structure beneath the macro asset-class premium: diversified portfolios can show Keynesian premia even when most individual contracts cannot, and storage economics — not a universal risk-premium story — organizes which contracts reveal forecast power in the curve.


---

## Extended Empirical Atlas and Practitioner Mapping

### Maturity structure of inference

FF’s strongest storage-track results use 6-month bases for cross-commodity comparison (3-month for cotton). Forecast/premium splits emphasize 2-, 6-, and 10-month horizons where samples are largest. When building a modern research pipeline, pre-register which horizon is primary to avoid fishing across 1–12 months.

### Interest-rate coefficient precision gradient

Metals: SE small enough to reject $\beta=0$ and often to be within 1 SE of 1. Ags/wood: point estimates near 1 but SE>0.5 — 95% intervals cover both 0 and 1. Livestock: SE>1 — uninformative for the rate channel. Power is a property of $\sigma(\text{basis})/\sigma(\text{residual})$, which tracks storage costs.

### Seasonal F-tests as CY detectors

Rejecting equality of monthly dummies is FF’s inventory-free CY test. Replication on 2000–2024 natural gas and gasoline should strongly reject — energy seasonals are the post-1987 extension of FF’s livestock lesson.

### Scoreboard as trading universe filter

- SF/GF names: prioritize calendar-spread strategies keyed to crop/herd calendars; expect basis → spot forecast.
- SP names: prioritize premium-harvesting signals; still verify out of sample.
- W names: do not force split regressions; use storage-track or portfolio sorts instead.
- Silver: quarantine until microstructure cleaned.

### Table 6 portfolio means — Bayesian prior for commodity ER

Use 0.54%/month simple (≈6.5%/year) as a prior mean for diversified nearby futures excess before bills, with standard error ~0.29%/month ($4.3/\sqrt{222}$). Continuously compounded prior 0.45%/month. Haircut 25–50% for post-sample optimism and financialization regime shifts.

### Individual names with $t>2$ simple returns

Cocoa, coffee, soy oil, hogs (positive); eggs (negative). Any single-name premium strategy lives or dies by whether these results replicate — history says usually not. Prefer portfolios.

### Inflation footnote importance

Fama–Schwert CPI component σ ≤0.62% monthly vs futures σ often >10% implies near-term futures variation is real/relative, not nominal inflation. Long-horizon inflation hedging (GR) is a different frequency phenomenon.

### SUR estimation note

Estimate (6) and (7) jointly with constraint $b_1+b_2=1$. Cross-equation residual correlation is −1 by construction in population if only measurement partitions the basis; in samples with overlapping horizons, use Hansen–Hodrick / NW carefully.

### Pedagogical bridge to GR Table 8

FF: basis variation often expected ΔS. GR: sorting on basis still earns 10% High−Low. Synthesis: expected ΔS that is not fully priced, time-varying premia concentrated in high-basis names, and cross-sectional differences in average premia can coexist. Attribution requires instrumenting with inventories (storage) vs hedging-pressure / volatility state (premium).

### Closing FF atlas paragraph

Fama and French remain the micro-foundation chapter beneath every commodity curve trade. Their dual-track methodology — storage regressions with basis on the left; forecast/premium regressions with outcomes on the left — should be coded as standard library functions in any commodity research stack, stratified by storage-cost bucket, and never collapsed into a single “roll yield equals risk premium” slogan.
