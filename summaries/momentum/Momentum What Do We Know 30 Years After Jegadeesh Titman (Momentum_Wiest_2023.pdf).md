# Momentum: What Do We Know 30 Years after Jegadeesh and Titman’s Seminal Paper?

**Author:** Tobias Wiest  
**Publication:** *Financial Markets and Portfolio Management* (2023) 37:95–114  
**DOI:** https://doi.org/10.1007/s11408-022-00417-8  
**Accepted:** 20 June 2022; **Published online:** 2 August 2022  
**Source PDF:** `Momentum_Wiest_2023.pdf`  
**Summary prepared:** 2026-09-24 (Scholar batch_2026-09-24_1)  
**OCR:** Not required; clean extract (~9,723 words of source)

---

## 1. Problem and Motivation

Jegadeesh and Titman (1993) documented that buying recent winners and selling recent losers earns positive returns—the **momentum** anomaly—contradicting weak-form EMH (Fama 1970). Thirty years later, momentum is:

- Documented across **equities globally**, **industries**, **factors**, **asset classes** (commodities, FX, bonds, equity indices)—“momentum everywhere” (Asness–Moskowitz–Pedersen and followers; Rouwenhorst; Griffin et al.).
- Implemented by mutual funds, hedge funds, and ETFs.
- Still debated in **origins** (behavioral vs risk) and in **commonality** (stock vs industry vs factor momentum).

Wiest’s survey organizes three strands: (1) **construction and enhancements**, (2) **explanations**, (3) **commonality** (industry and factor momentum). It is a practitioner-useful map of what has survived replication and what remains open.

---

## 2. Construction of Momentum Strategies

### 2.1 Classic cross-sectional momentum (CSMOM)

Formation on past $J$ months (often skip most recent month), hold $K$ months; long high past-return deciles, short low. JT (1993) baseline profits are economically large (order **~1%/month** in early US samples; exact figures vary by sample). Standard modern implementation: **12-2** or **12-1** ranking (skip last month to avoid short-term reversal).

### 2.2 Time-series momentum (TSMOM)

Moskowitz–Ooi–Pedersen (2012): sign of each asset’s own past return; not cross-sectional ranks. Strong in futures across asset classes. Distinct economically (absolute vs relative strength) though correlated in equities.

### 2.3 Residual / “idiosyncratic” momentum

Strip common-factor returns (FF, industry) from past performance; rank on residual returns (e.g., Blitz–Huij–Martens and related). Goal: purify firm-specific continuation, reduce factor crash exposure, improve Sharpe.

### 2.4 Intermediate-horizon refinement (Novy-Marx 2012)

Sort on returns from $t-12$ to $t-7$ rather than $t-12$ to $t-2$. **1927–2010:** intermediate momentum **1.20%/month** vs **0.67%/month** for $t-6$ to $t-2$. Survives FF3 + Carhart controls. Suggests momentum is not homogeneous across the formation window.

### 2.5 Risk-managed / dynamic momentum

- **Barroso–Santa-Clara (2015); Moreira–Muir (2017):** scale positions by inverse realized volatility; Sharpe of momentum roughly **doubles** (paper cites improvement from about **0.45 to 0.90** in the volatility-scaling literature’s canonical illustrations).
- **Daniel–Moskowitz (2016):** momentum **crashes** when markets rebound after bear markets amid high volatility; dynamic strategy scales with **conditional Sharpe**, accounting for negative conditional expected returns in crash states.

### 2.6 Other construction notes

- Skip-month, industry-neutral, rank vs. continuous weights, liquidity screens, and formation lags all matter for implementability.
- Momentum is stronger among **small**, **low-analyst-coverage** stocks (Hong–Lim–Stein 2000)—consistent with slow information diffusion.

---

## 3. Explanations

### 3.1 Behavioral

**Underreaction channel (Hong–Stein 1999):** information diffuses gradually; momentum is incomplete adjustment; later may reverse. Hong–Lim–Stein evidence: momentum concentrated where diffusion is slow (small, neglected firms).

**Overreaction / feedback (Daniel–Hirshleifer–Subrahmanyam 1998; Barberis–Shleifer–Vishny 1998):** overconfidence and biased self-attribution → continued overshooting; predicts long-run reversal. Media/attention momentum profits that reverse long-run fit this story; Chui–Titman–Wei and related work: momentum stronger in high-individualism cultures / high-uncertainty settings favored by overconfident investors.

**Trading frictions / attention:** explain cross-sectional intensity differences more than the existence of the premium.

### 3.2 Risk-based

Rational compensation for crash risk, growth-option risk, or time-varying risk (examples in survey: Johnson; Sagi–Seasholes; Liu–Zhang; and related). Risk stories struggle with:

- Magnitude and Sharpe after vol-scaling.
- Presence in diverse asset classes.
- Crash timing (Daniel–Moskowitz): losses cluster in recoveries—hard to call “risk” in the usual utility sense without elaborate state dependence.

Wiest’s stance: both literatures offer partial mechanisms; **no consensus origin**.

---

## 4. Commonality: Industry and Factor Momentum

### 4.1 Industry momentum

Moskowitz–Grinblatt (1999): industry momentum accounts for much of stock momentum; buying winning industries / selling losing industries is profitable. Subsequent work debates how much stock-level momentum remains after industry adjustment (residual momentum again).

### 4.2 Factor momentum

Recent literature (Ehsani–Linnainmaa 2022a; Arnott et al. 2021, among those emphasized): **factors themselves** exhibit serial correlation. Key claim reviewed: **factor momentum subsumes stock and industry momentum**—i.e., once you time factors by their own past returns, classic CSMOM and industry MOM add little.

Mechanism sketch: if stock momentum partly reflects time-varying loadings on serially correlated factor returns, then ranking stocks on past returns mechanically picks up factor momentum. Pure firm-specific momentum may be smaller than textbook CSMOM suggests.

### 4.3 Open theoretical gap

Wiest stresses: industry and especially **factor momentum lack a settled theory**. Behavioral and risk models were written for firm-level under/overreaction; they do not automatically explain why *value*, *profitability*, etc., as portfolios, autocorrelate—nor why that autocorrelation would dominate stock-level sorts.

---

## 5. Empirical Anchors Highlighted in the Survey

| Finding | Approximate quantitative content |
|---------|----------------------------------|
| JT-style CSMOM | Robust ~decades; ~1%/month order in classic samples |
| Novy-Marx intermediate | **1.20%/mo** vs **0.67%/mo** (1927–2010) |
| Vol-scaled momentum | Sharpe ~**0.45 → ~0.90** |
| Hong–Lim–Stein | Stronger in small / low coverage |
| Daniel–Moskowitz | Crashes in high-vol recoveries; dynamic scaling helps |
| Factor MOM (EL, Arnott et al.) | Subsumes stock & industry MOM in their specs |
| Asset-class breadth | Equities, industries, factors, futures, FX, commodities |

(Exact table reproductions vary; survey synthesizes rather than re-estimates a single master backtest.)

---

## 6. Limitations of the Survey (and of the Literature)

1. **Survey, not a new horse race.** Does not settle factor-vs-stock momentum with a unified replication.
2. **Publication bias** in cited studies; momentum’s post-discovery attenuation (partial) is discussed in the wider literature (e.g., post-JT performance variation) but not re-estimated here.
3. **Costs and capacity.** Enhancements that raise Sharpe (vol scaling, residual MOM) change turnover and capacity; implementation gap remains.
4. **Theory lag on factor momentum.** Central open issue.
5. **International heterogeneity.** Momentum weaker or historically absent in some markets (Japan often cited); cultural/behavioral explanations contested.

---

## 7. Practical Takeaways for a Quant Investor

1. **Default construction:** 12-2 CSMOM with liquidity filters; consider **intermediate window** (Novy-Marx) as a primary variant.
2. **Always risk-manage:** inverse-vol scaling and/or Daniel–Moskowitz-style crash control—raw momentum’s left tail is the product-killer.
3. **Residualize thoughtfully:** industry- and factor-neutral residual momentum can improve IR and reduce “momentum is just factor timing” contamination—but check that residualization does not erase the premium you intend to harvest.
4. **Monitor factor momentum:** if your “stock momentum” P&L is spanned by timing SMB/HML/MOM/quality, you are running a **factor-timing** book—manage it as such (different capacity, different crowing).
5. **Do not ignore commonality research** when attributing alpha: a multi-strat book with industry MOM + stock MOM + factor MOM may be triple-counting one serial-correlation phenomenon.
6. **Behavioral vs risk:** for portfolio choice, origin matters for crash hedging and for whether premium should survive education/arbitrage; vol-scaling is useful under both interpretations.
7. **Link to trading costs (Ritter / GP):** momentum’s $\phi$ is relatively high (weeks to months); combine Wiest’s construction advice with optimal turnover (20) so enhancements that add turnover (e.g., faster signals) are cost-checked.

---

## 8. Construction Playbook (Operational)

**Step A — Signal**  
Past return $R_{t-12,t-2}$ or intermediate $R_{t-12,t-7}$; optionally residualize vs FF5+industry.

**Step B — Portfolio**  
Decile or rank-weighted long-short; neutralize β, industry, and intended style exposures if claiming “pure” momentum.

**Step C — Risk**  
Target vol via trailing realized vol scaler; cap leverage in high-vol states; optional conditional expected-return overlay (Daniel–Moskowitz).

**Step D — Overlay diagnostics**  
Regress CSMOM returns on factor-momentum returns; if $\alpha\approx 0$, reclassify product.

**Step E — Capacity**  
Estimate $\phi$ from signal AR; apply Ritter/GP turnover targets; stress microcap dependence (Hong–Stein channel).

---

## 9. Behavioral vs Risk — Decision Matrix for Allocators

| If you believe… | Then you should… |
|-----------------|------------------|
| Underreaction / slow diffusion | Favor residual MOM in neglected names; expect decay as coverage improves |
| Overreaction / feedback | Expect long-run reversal; fade extreme formation winners at long horizons |
| Crash risk priced | Treat raw MOM as writing put-like payoffs; pay for dynamic hedging |
| Factor MOM is primitive | Time factors directly; de-emphasize stock sorts |

---

## 10. Connections to This Batch’s Other Papers

- **Clarke et al.:** momentum scores → alphas via full-$\Omega$ Grinold map; measure TC of long-only MOM implementations (often low because losers cannot be shorted enough).
- **Ritter et al.:** momentum half-lives feed $\phi$ in turnover formula (20).
- **Hwang–Rubesam:** `mom1m` / `chmom` appear in Bayesian selectors episodically—consistent with short-horizon return factors mattering intermittently at stock level, while classical UMD is not a stable pricing factor in their zoo race.
- **Nguyen–Lo:** ranking uncertainty (e.g., noisy past-return ranks) motivates robust portfolio construction around MOM ranks.

---

## 11. Research Frontier (as of survey)

1. Microfoundation of **factor momentum**.
2. How much of CSMOM is **factor timing** vs **idiosyncratic continuation** under mutually consistent definitions.
3. Optimal combination of TSMOM and CSMOM under costs.
4. Momentum in **corporate bonds / options / crypto** (expanding “everywhere”).
5. Interaction with **ESG constraints** and long-only TC.

---

## 12. Bottom Line

Thirty years on, momentum is **empirically alive**, **constructibly improvable** (intermediate formation, residualization, vol scaling, crash control), and **conceptually unsettled**—especially once industry and factor momentum enter. The practical quant stance: harvest a risk-managed, preferably residualized momentum sleeve; measure its overlap with factor momentum; and size it with cost-aware turnover rules. Treat “why does it exist?” as open, but treat “does a naive unscaled CSMOM blow up?” as closed—yes, unless you manage the crash.

---

## 13. Deep Dive: Volatility Scaling Mechanics

Let $r_t$ be the return of a unit-gross momentum portfolio. Realized variance estimator $v_t^2=\sum_{i=1}^{63} r_{t-i}^2$ (approx. 3 months). Scaled position $x_t = \sigma_{\text{target}} / v_t$. Then scaled returns $x_t r_{t+1}$ have more stable vol and historically higher Sharpe because momentum’s variance spikes coincide with poor conditional returns (crash states). Barroso–Santa-Clara emphasize that a large part of momentum’s unattractiveness is **volatility clustering**, not negative mean.

Daniel–Moskowitz go further: estimate conditional expected return $\mu_t$ that turns **negative** in high-vol post-bear markets; optimal weight $\propto \mu_t / \sigma_t^2$. When $\mu_t<0$, the strategy can flip or flatten—avoiding the crash month that wipes years of premium.

### 13.1 Quant implementation caveats

- Scaling uses **ex-ante** vol only.
- Target vol must respect leverage limits and prime-broker constraints.
- Scaling raises turnover when vol is jumpy → feed Ritter $\phi,\lambda$ checks.
- In long-only mandates, crash control is asymmetric: you cannot short winners enough; TC falls in the states you most need to trade.

---

## 14. Residual Momentum — Specification Choices

1. **Regression window** for residuals (e.g., 36 months FF3): too short → noisy residuals; too long → stale loadings.
2. **Factor set:** industry-only vs FF5 vs statistical PCA. Broader factor sets push the strategy toward “pure idiosyncratic,” which may shrink the premium if factor momentum was the engine.
3. **Rank on residual return vs residual IR:** risk-adjusting the formation signal is a cousin of vol scaling.

Diagnostic: correlate residual-MOM returns with CSMOM and with factor-MOM. Ideal “idiosyncratic” sleeve shows low correlation with factor-MOM and positive mean.

---

## 15. Time-Series vs Cross-Sectional — When to Prefer Which

| | CSMOM | TSMOM |
|--|-------|-------|
| Signal | Relative ranks | Own past sign/magnitude |
| Natural domain | Large cross-sections (stocks) | Futures / small $N$ asset-class books |
| Market exposure | Often near neutral (L/S) | Can be strongly directional |
| Crash type | Momentum crash (DM) | Trend-following whipsaw |
| Blend | Common in equity L/S | CTA / macro |

Many multi-strat platforms run **both** and then discover high correlation in risk-on/off transitions—risk systems should model a shared “trend” factor.

---

## 16. Geographic and Asset-Class Notes

Rouwenhorst (Europe/EM), Griffin et al., and Asness–Moskowitz–Pedersen document international and multi-asset momentum. Japan is the famous weak equity CSMOM case—useful as a falsification laboratory for behavioral stories tied to individualism (Chui–Titman–Wei). Multi-asset TSMOM has been more consistently “everywhere” than equity CSMOM.

---

## 17. Crowding and Post-Publication

After JT (1993) and retail/ETF adoption, capacity and crowding debates intensified. Survey does not re-estimate decay curves, but practitioners should:

- Track short interest and MOM ETF AUM.
- Compare gross vs net of borrow for losers.
- Watch factor-MOM crowding (everyone timing the same styles).

---

## 18. Extended FAQ

**Q: Is momentum “dead”?**  
A: Unscaled CSMOM has experienced long flat/poor spells; risk-managed versions remain more resilient in the literature Wiest reviews. Death claims often ignore construction.

**Q: Should we replace stock MOM with factor MOM?**  
A: Test subsumption on your universe. If factor MOM spans stock MOM, trade the more liquid, lower-cost representation.

**Q: How does this interact with value?**  
A: Classic negative correlation MOM–value underpins multi-style diversification; factor-momentum timing can disrupt that correlation structure when styles themselves trend.

---

## 19. Summary Metrics Cheat Sheet

- Intermediate MOM ≈ **1.20%/mo** vs recent-half **0.67%/mo** (NM 1927–2010).
- Vol scaling ≈ **Sharpe 0.45 → 0.90**.
- HLS: stronger in small/low coverage.
- EL/Arnott: factor MOM subsumption claim—verify in-house.

---

## 20. Final Word

Wiest’s 2023 survey is the right 30-year field guide: construct carefully, risk-manage aggressively, and take commonality research seriously enough to avoid paying three times for one serial-correlation trade.

---

## 21. Industry Momentum — Implementation Sketch

Moskowitz–Grinblatt: rank industries by past returns; long top industries, short bottom. Relative to stock CSMOM:

- Fewer names → higher idiosyncratic industry risk unless diversified across regions.
- Lower turnover if industry membership is sticky.
- Often explains a large fraction of stock MOM covariance.

Combine: industry-neutral stock MOM + industry MOM overlay, with collinearity monitored.

---

## 22. Factor Momentum — Implementation Sketch

For each factor $f$ with return $R_{f,t}$, signal $s_{f,t}=R_{f,t-12:t-1}$ (or similar). Position $w_{f,t}\propto s_{f,t}$ subject to vol targeting. Portfolio of timed factors is “factor momentum.”

Subsumption test:

$$
R_{\text{CSMOM},t}=a+b R_{\text{FactorMOM},t}+e_t.
$$

If $a\approx 0$ and $R^2$ high, stock MOM is largely factor timing. Wiest highlights Ehsani–Linnainmaa and Arnott et al. as finding strong subsumption—**replicate on your factors and universe before retiring stock MOM**.

---

## 23. Behavioral Predictions Checklist

| Prediction | Empirical status in survey |
|------------|----------------------------|
| Stronger in small/neglected | Supported (HLS) |
| Long-run reversal after overreaction | Mixed/partial |
| Stronger in high-individualism cultures | Supported in cited work |
| Media-driven MOM reverses | Supported in cited work |
| Pure risk premium, no behavioral | Contested |

---

## 24. Risk-Based Predictions Checklist

| Prediction | Status |
|------------|--------|
| MOM pays for crash risk | Crashes exist but timing challenges rational story |
| MOM loads on growth options / procyclical risks | Some support in cited papers |
| Survives as compensation after costs | Depends on construction |

---

## 25. Putting It Together — Recommended Production Stack

1. Signal: intermediate residual momentum (NM window + FF/industry residualization).
2. Portfolio: rank-weighted L/S with β and industry caps.
3. Risk: target-vol scaling + DM crash overlay.
4. Overlay: separate small-budget factor-MOM book; orthogonalize vs (1).
5. Costs: Ritter/GP turnover target from estimated $\phi$.
6. Governance: monthly subsumption and crowing dashboard.

---

## 26. Final Expanded Bottom Line

After 30 years, momentum remains the premier EMH challenge, but the modern quant does not trade 1993 JT raw. Trade a **risk-managed, residualized, cost-aware** variant; test whether you are actually trading **factor momentum**; and keep the theoretical humility Wiest recommends—especially on why factors themselves trend.

---

## 27. Chronology of Landmark Papers (Survey Backbone)

| Year | Paper | Contribution |
|------|-------|--------------|
| 1993 | Jegadeesh–Titman | CSMOM documented |
| 1998 | DHS; BSV | Behavioral over/underreaction models |
| 1999 | Hong–Stein; Moskowitz–Grinblatt | Diffusion; industry MOM |
| 2000 | Hong–Lim–Stein | Small/neglected intensity |
| 2012 | Moskowitz–Ooi–Pedersen; Novy-Marx | TSMOM; intermediate horizon |
| 2015–17 | Barroso–Santa-Clara; Moreira–Muir | Vol scaling |
| 2016 | Daniel–Moskowitz | Crash dynamics |
| 2021–22 | Arnott et al.; Ehsani–Linnainmaa | Factor MOM / subsumption |
| 2023 | Wiest | This synthesis |

---

## 28. Position Sizing Example

Gross MOM book target vol 10% annual. Trailing realized vol of unscaled MOM = 25%. Scale = 10/25 = 0.4. If DM conditional μ turns negative, scale → 0. Crash month with −30% unscaled becomes −12% at scale 0.4—still painful but not wipeout. Pair with formation on intermediate residual returns to reduce baseline crash beta.

---

## 29. Crowding Indicators to Watch

- Momentum ETF AUM and flows  
- Average short locate fees on loser decile  
- Correlation of CSMOM with a generic 12-2 futures TSMOM factor  
- Performance in the week after large MOM rebalances (predicted price pressure)

---

## 30. Glossary

**CSMOM:** cross-sectional momentum. **TSMOM:** time-series momentum. **Residual MOM:** rank on factor-adjusted past returns. **Factor MOM:** time series momentum applied to factor portfolios. **Formation/skip:** months used to rank; skip avoids microstructure reversal. **Crash:** concentrated MOM losses in high-vol recoveries.

---

## 31. Final Mandate

Build risk-managed residual momentum; test factor-MOM subsumption; size with cost-aware turnover; never ship raw JT 1993 as a standalone retail product without crash control.

---

## 32. Detailed Crash Anatomy (Daniel–Moskowitz)

Momentum crashes cluster when:

1. Market has been in a bear state (lagged 24-month market return low).
2. Market volatility is elevated.
3. Market rebounds sharply (positive concurrent market return).

Losers (distressed, high-beta short legs) bounce more than winners, so L/S MOM loses on both sides. Dynamic strategy that forecasts this state reduces exposure *before* the rebound month. Static vol scaling helps but may not fully capture the **sign** change in expected MOM return—hence DM’s conditional μ overlay.

### 32.1 Long-only implication

In 130/30 or long-only, the short-leg bounce cannot be harvested as a short profit; crash mitigation is mostly about cutting winner overweight into the rebound—hard psychologically and often TC-constrained.

---

## 33. Intermediate Momentum — Economic Reading

Novy-Marx: months $t-12$ to $t-7$ outperform $t-6$ to $t-2$. Interpretation candidates:

- Echoes of earnings announcement drift and seasonal information release.
- Underreaction that completes by month $t-7$, with later months noisier.
- Statistical artifact of particular sample decades—still, the survey treats it as a first-line construction upgrade.

Production test: split formation into early and late halves; allocate risk to the better half rather than the conventional 12-2 blob.

---

## 34. “Momentum Everywhere” Capacity Ranking (Heuristic)

| Domain | Capacity | Notes |
|--------|----------|-------|
| Large-cap equity CSMOM | Medium | Crowded, borrow costs on losers |
| Industry MOM | Medium-high | Fewer names, liquid futures proxies sometimes |
| Factor MOM | High (futures/swaps on styles) | Crowding rising |
| Commodity/FX TSMOM | Medium | Dependent on futures liquidity |
| Microcap CSMOM | Low | HLS effect strong but capacity tiny |

---

## 35. Replication Snippet for Subsumption

Monthly: build CSMOM 12-2; build factor-MOM on FF5+momentum itself (careful with circularity—use lagged factor returns). OLS $\alpha$ with NW HAC. If $\alpha$ insignificant and information ratio of residual small, reallocate budget from stock MOM to factor MOM.

---

## 36. Closing Paragraph

Wiest’s survey earns its place on a quant desk bookshelf: it compresses three decades into construction upgrades you should already have shipped, explanations you should not overclaim, and a commonality agenda—factor momentum—that may redefine what “stock momentum” even means.

---

## 37. Sector and Factor Neutrality Trade-offs

Imposing industry neutrality on CSMOM reduces overlap with industry MOM but can lower gross returns if industry continuation is desired. Similarly, neutralizing value/size may remove the very factor-MOM channel EL/Arnott emphasize. Decide *ex ante* whether the product mandate is "pure idiosyncratic momentum" or "harvest all continuation including styles." Wiest’s commonality section exists precisely so PMs stop accidentally mixing these mandates.

---

## 38. Performance Reporting Template

Report for any MOM sleeve: gross/net Sharpe, max drawdown, crash-month returns (list), correlation to market and to a factor-MOM basket, average turnover, borrow cost, capacity estimate at 10% ADV participation, and Novy-Marx early-vs-late formation split returns. This template alone would have prevented many 2009-style postmortems.

---

## 39. Teaching Use

For junior quants: implement JT 12-2, add skip-month, add vol scaling, add residualization, add DM overlay—one enhancement per week—and watch Sharpe and drawdowns evolve. Then run the subsumption regression. That sequence teaches the survey faster than reading alone.

---

## 40. Ultimate Takeaway

Momentum is not one number; it is a **family** of continuation strategies. Thirty years after JT, the edge goes to desks that specify *which* family member they run, manage its crash, and know whether it is secretly factor timing.

---

## 41. Note on Open Access and Citation

Wiest (2023) is published open access under Springer FMPM. Cite as: Wiest, T. Momentum: what do we know 30 years after Jegadeesh and Titman’s seminal paper? *Financial Markets and Portfolio Management* 37, 95–114 (2023). For internal libraries, pair this survey with JT (1993) primary text and Daniel–Moskowitz (2016) on crashes.

---

## 42. Cross-Asset Correlation Warning

Equity CSMOM and futures TSMOM often correlate positively in global risk-on continuations and jointly fail in sharp reversals (e.g., 2009, certain 2020 windows). Multi-asset “momentum everywhere” books need a shared risk factor for “trend” rather than treating sleeves as independent in risk models—otherwise leverage sneaks up on the aggregator.

*End of summary.*
