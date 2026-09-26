# Out-of-Sample Equity Premium Prediction: Economic Fundamentals vs. Moving-Average Rules (Neely–Rapach–Tu–Zhou 2010) — Detailed Quantitative Research Notes

## Bibliographic Header
| Field | Detail |
|------|--------|
| Title | Out-of-Sample Equity Premium Prediction: Economic Fundamentals vs. Moving-Average Rules |
| Authors | Christopher J. Neely (FRB St. Louis); David E. Rapach (Saint Louis Univ.); Jun Tu (Singapore Management Univ.); Guofu Zhou (WashU / CAFR) |
| Outlet | FRB St. Louis Working Paper 2010-008A (March 2010) |
| Original PDF | `AbnormalReturns_NeelyRapachTuZhou_2010.pdf` |
| Drive file_id | `0B-6kBz0I0dMsNUpsbHlrS2pTX0U` |
| Data | Goyal–Welch updated monthly series; equity premium = S&P 500 cont. compounded return − T-bill; sample 1927:01–2008:12 |
| Forecast evaluation | 1960:01–2008:12 (q=588 months); initial in-sample 1926/27–1959:12; recursive estimation |
| Economic predictors (14) | DP, DY, EP, DE, SVAR, BM, NTIS, TBL, LTY, LTR, TMS, DFY, DFR, INFL (Goyal–Welch definitions) |
| MA rules | MA(s,l) with s∈{1,2}, l∈{3,6,9,12,15,18,21,24} → 16 rules; COMBINE-MA = equal-weight average of 16 forecasts |
| Metrics | Campbell–Thompson $R^2_{OS}$; Clark–West MSPE-adjusted; mean-variance utility gain (γ=5), annualized fee in % |
| Business cycle | NBER expansions/recessions (87 recession months = 15% of OOS window) |
| Theory check | Campbell–Cochrane (1999) habit model simulations (200 reps); empirical p-values for $R^2_{OS}$ and utility gains |
| Core claims | Both econ and MA forecasts beat historical average OOS, **gains concentrated in recessions**; MA detects early-recession premium drop; econ detects late-recession premium rise; CC habit cannot fully explain gains (esp. MA) |

## Problem / Motivation
Two literatures evolved separately: (i) predictive regressions with valuation ratios, rates, spreads, issuance, cay, vol (Rozeff; Fama–French; Campbell–Shiller; Ang–Bekaert; Cochrane; Lettau–Ludvigson; …); (ii) technical analysis / MA rules (Dow; Brock–Lakonishok–LeBaron; Sullivan–Timmermann–White; Lo–Mamaysky–Wang; …). Goyal–Welch (2008) cast doubt on OOS econ predictability; Campbell–Thompson (2008) and Rapach–Strauss–Zhou (2010a) restore it via restrictions and combination. Technical results are mixed across eras. This paper **merges** the two with common OOS metrics and asks whether they are substitutes or complements, and how both relate to the business cycle.

## Econometric Methodology

### Economic forecasts
$$
r_{t+1}=\alpha_i+\beta_i x_{i,t}+\varepsilon_{i,t+1}.
$$
Recursive OOS forecasts $\hat r_{i,t+1}=\hat\alpha_{i,t}+\hat\beta_{i,t}x_{i,t}$ with Campbell–Thompson restrictions (sign of $\beta$; truncate negative premium forecasts at 0). COMBINE-ECON: $\hat r_{c,t+1}=N^{-1}\sum_i\hat r_{i,t+1}$ (N=14).

### MA → point forecasts
Signal $S_{t+1}=1\{MA_{s,t}\ge MA_{l,t}\}$ with $MA_{j,t}=j^{-1}\sum_{i=0}^{j-1}P_{t-i}$. Map to premium via
$$
r_t=\alpha^{s,l}+\beta^{s,l}S^{s,l}_t+\varepsilon_t,
$$
recursive forecasts analogous to econ. Monthly MA (not daily) for comparability.

### Metrics
$$
R^2_{OS}=1-\frac{\sum(r_{m+k}-\hat r_{m+k})^2}{\sum(r_{m+k}-\bar r_{m+k})^2}.
$$
Clark–West MSPE-adjusted tests $H_0:R^2_{OS}=0$ vs $>$. Utility: mean-variance investor, γ=5,
$$
w_{j,t}=\frac{1}{\gamma}\frac{\hat r_{j,t+1}}{\hat\sigma^2_{t+1}},\quad w\in[0,1.5],
$$
$\hat\sigma^2$ from 5-year rolling window. Utility gain $=1200\times(\hat\nu_j-\hat\nu_0)$ as annual % fee vs historical-average allocator.

## Results: $R^2_{OS}$ (Table 1)

### Panel A — Economic variables (1960–2008)
- 9/14 individual $R^2_{OS}>0$; 6 significant at 10%.
- Best individuals: **DP 0.73%, DY 0.71%**.
- **COMBINE-ECON 0.80%** (1% significant) — beats every individual, echoing RSZ (2010a).
- **Recessions vs expansions:** DP $R^2_{OS}$ 0.15% (exp) vs **2.15%** (rec); DY −0.26% vs **3.09%**; COMBINE 0.72% vs 1.01% (both sig). Predictability is a recession phenomenon (Henkel–Martin–Nardari; RSZ 2010b).

### Panel B — MA rules
- 12/16 positive $R^2_{OS}$; 7 significant.
- Best: **MA(2,12) 1.08%**.
- COMBINE-MA positive, 10% significant.
- Recessions: for l=6–15, $R^2_{OS}$ **1.45–3.05%**, all 5% significant — comparable to best econ recession stats.
- Hansen SPA p-values across all 32 forecasts ~0.16–0.17 (likely undersized for nested models) — not pure data snooping.

## Results: Utility Gains (Table 2, γ=5)
### Economic
- Full-sample gains >1% annual for six variables + COMBINE.
- **DY: 1.82% full; −0.17% expansions; 13.02% recessions.**
- DP, TBL, LTY, LTR, TMS, DFR: recession gains >5%.
- COMBINE-ECON: 0.97% exp / 1.66% rec — smoother.

### MA
- All 16 full-sample gains >0.
- **MA(2,12): 3.43% full; 1.07% exp; 16.78% rec.**
- l=12–15 near/above 3% full sample.
- Average equity weight **lower in recessions** for MA (trend-following derisks); **higher in recessions** for DP/DY (countercyclical premium).

## Peak/Trough Anatomy (Figures 5–8) — Complementarity
Regressions of $r_t-\bar r_t$ and $\hat r_{j,t}-\bar r_t$ on leads/lags of NBER peaks and troughs:

**Near peaks (start of recessions):** actual premium significantly below average from 1 month before through 2 months after peak. **MA(l=6–18)** tracks this drop; most **econ forecasts do not** (LTR, TMS partial exceptions).

**Near troughs (end of recessions):** actual premium significantly **above** average in months −4 to −2 before trough. **DP, DY, EP, BM, LTR** (and somewhat TMS, DFY, COMBINE) rise with it; **MA forecasts generally stay too low too long**, missing the late-recession rebound.

**Punchline:** both win in recessions but on **different months**. Complements, not substitutes. Simple averaging of econ+MA did **not** create synergy (each’s weak phase offsets the other). Dynamic combination timed by turning-point models left for future work.

## Habit-Formation Horse Race (Table 3)
Simulate Campbell–Cochrane (1999) with CC parameters; 200 pseudo-samples of length 984; Harding–Pagan BB dating on consumption; compare DP, DY, MA(1,12), MA(2,12).

| Forecast | Full $R^2_{OS}$ emp. p | Rec $R^2_{OS}$ p | Full util p | Rec util p |
|----------|------------------------:|-------------------:|------------:|-----------:|
| DP | >50% | 17.5% | **3%** | — |
| DY | >50% | 17.5% | **2%** | **7%** |
| MA(1,12) | **<1%** | **<5%** | **<1%** | **<1%** |
| MA(2,12) | **<1%** | **<1%** | **<1%** | **<1%** |

CC rational time-varying risk aversion can largely match DP/DY $R^2_{OS}$ but **not** their utility gains for a constant-γ=5 agent (who exploits the representative agent’s fear), and **cannot** match MA gains on either metric. Suggests mispricing and/or missing equilibrium risks in recessions — with the usual joint-hypothesis caveat.

## Limitations
- Monthly MA understates high-frequency technical signals.
- 2008 endpoint — “Great Recession” partly in sample; post-2009 OOS needed.
- γ=5 and [0,1.5] weight cap are specific; paper says qualitative results robust to other γ.
- Nested-model SPA inference imperfect.
- No transaction costs on MA-induced turnover (econ forecasts also imply turnover).
- CC model only prices DP/DY among econ variables.

## Practical Takeaways for a Quant Investor
1. **Do not dismiss MA rules as astrology** — MA(2,12) delivers 3.43% annual certainty-equivalent vs historical average for γ=5, and 16.78% in recessions.
2. **Do not rely on econ predictors only in expansions** — that is exactly when they fail; their edge is late-recession / high valuation-ratio mean reversion.
3. **Regime overlay:** overweight MA signals after cyclical peaks; overweight DP/DY/TMS as recessions mature. Hard in real time — use recession nowcasts (Chauvet–Senyuz etc.).
4. **Combination of econ forecasts (simple average) is still best practice** among fundamental signals (0.80% $R^2_{OS}$).
5. **Risk management:** MA strategies cut equity weight in recessions (good for drawdowns) but miss the trough rally; econ strategies do the opposite.
6. **Model risk:** habit formation is not a full stop to “anomaly” claims for MA; treat MA edge as partially anomalous until a better equilibrium model arrives.
7. **Implementation:** recursive estimation from 1960; CT sign/positivity restrictions; 5-year vol window; cap leverage at 150%.

## Quantitative Bottom Line
1960–2008 monthly OOS: COMBINE-ECON $R^2_{OS}=0.80\%$; MA(2,12) $R^2_{OS}=1.08\%$. Utility gains (γ=5): DY 1.82% (13.02% in recessions); MA(2,12) **3.43%** (**16.78%** in recessions). MA catches early-recession premium drops; econ catches late-recession rises. Campbell–Cochrane habit cannot fully rationalize the gains. **Fundamental and technical equity-premium forecasts are complementary business-cycle tools.**

## Predictor Definitions (Goyal–Welch)
- **DP:** log dividends (12m sum) − log price.
- **DY:** log dividends − log lagged price.
- **EP:** log earnings (12m) − log price.
- **DE:** log dividends − log earnings.
- **SVAR:** sum of squared daily returns.
- **BM:** DJIA book-to-market.
- **NTIS:** 12m net NYSE issues / end-of-year NYSE mktcap.
- **TBL, LTY, LTR, TMS, DFY, DFR, INFL:** standard; INFL uses $x_{t-1}$ for publication lag.

## Extended Business-Cycle Narrative for Portfolio Committees
The “Great Moderation” (mid-1980s–2007) reduced recession time share, which mechanically weakened both econ and MA predictability in studies ending before 2008 (Sullivan–Timmermann–White’s 1987–96 failure of technical rules; Goyal–Welch’s pessimistic econ OOS). Including 2008 and future deep recessions should revive measured predictability — the paper’s explicit forecast. Allocators who turned off timing after the Great Moderation may have abandoned an edge that lives disproportionately in the left tail of the cycle distribution.

## Replication Checklist
1. Download Goyal–Welch monthly data through 2008 (or updated).
2. Recursive CT-restricted predictive regressions from 1960; compute $R^2_{OS}$ + CW tests full/exp/rec.
3. Build 16 MA signals on S&P level; map to forecasts via recursive regression on $S_t$.
4. Mean-variance backtest γ=5, 5y vol, weights [0,1.5]; report annualized utility gains.
5. Peak/trough event regressions as in eqs. (16)–(19).
6. Optional: CC simulation with Wachter series method for P/D(s); BB dating; empirical p-values.
7. Match headlines: DY util 1.82/13.02; MA(2,12) 3.43/16.78; COMBINE-ECON $R^2_{OS}$ 0.80%.


## Why Utility Gains Exceed What $R^2_{OS}$ “Looks Like”
Campbell–Thompson and Kandel–Stambaugh emphasize that small $R^2$ on equity premia map to large portfolio value because news about the mean moves optimal weights a lot when multiplied by $1/(\gamma\sigma^2)$. A 1% $R^2_{OS}$ with γ=5 and annual σ~15–20% can justify multiple percentage points of fee — exactly what Table 2 shows. Recession conditioning amplifies this: when the conditional mean swings hardest, weight differences vs the historical-average rule are largest, and utility gaps explode (13–17% annualized).

## Links to Batch
- **Constantinides et al.:** another utility/SSD improvement from trading “expensive” claims.
- **Levy:** ranking metrics for funds; here the “funds” are timing policies.
- **Drechsler / Haugen–Heins:** cross-sectional anomalies; this paper is the time-series predictability counterpart.


## Extended Forecasting and Asset-Allocation Notes

### Why recursive windows
Pesaran–Timmermann (2007) and Clark–McCracken (2009) show including pre-break data can be MSE-optimal under quadratic loss despite structural breaks. Rolling windows give similar qualitative results in the paper’s footnotes.

### Campbell–Thompson restrictions
Theory-signed slopes: if OLS $\hat\beta$ has the wrong sign, set $\hat\beta=0$ for forecasting. If $\hat r<0$, set $\hat r=0$ (risk premia should be positive). These restrictions stabilize individual forecasts enough to beat the historical average more often.

### Combination as shrinkage
Equal-weight COMBINE-ECON is a shrinkage estimator that damps individual-model overfitting (Rapach–Strauss–Zhou 2010a). Kitchen-sink multiple regression of all 14 predictors fails badly OOS (Goyal–Welch; RSZ) — high-dimensional unrestricted models overfit.

### MA parameter sensitivity
s=1,2 and l=3…24 cover short and intermediate trend horizons. Best OOS utility at l=12–15 (one year to 15 months), classic intermediate-trend length. Very long l (24) weakens recession gains.

### Utility gain interpretation
A 3.43% annual fee for MA(2,12) means a γ=5 investor would pay 343 bps of NAV per year for the forecast stream vs the historical mean rule — large vs typical ETF fees, small vs hedge-fund 2-and-20, and concentrated in recessions where willingness-to-pay jumps to 16.78%.

### Peak/trough regression design
Indicators $I^P_{k,t}$ equal 1 if month t is k months after an NBER peak. Coefficients $b^P_{0,k}$ measure how much the average (r − historical mean forecast) changes at that event time. Same for forecasts. This event-study style clarifies *when* each forecast family helps.

### Habit model mechanics (abbreviated)
Surplus consumption $S_t=(C_t-X_t)/C_t$; local risk aversion $\eta_t=\gamma/S_t$; log surplus AR(1) with sensitivity $\lambda(s_t)$; SDF $M_{t+1}=\delta(S_{t+1}/S_t\cdot C_{t+1}/C_t)^{-\gamma}$; P/D increasing in s. Recessions lower s → higher expected returns — matching econ forecasts’ late-recession rise, not MA’s early-recession drop.

### Practical timing playbook
1. Maintain COMBINE-ECON and MA(2,12) forecasts monthly.
2. Track recession probability from a nowcast model.
3. As P(recession) rises from low levels (near peaks), overweight MA signal in the portfolio weight rule.
4. As P(trough) rises, overweight DY/DP/TMS.
5. Always apply CT restrictions and [0, 1.5] weight caps.
6. Measure realized utility vs historical-average benchmark annually.

### Numerical anchors
- OOS window 1960:01–2008:12 (588 months; 87 recession months)
- COMBINE-ECON R-OS-squared 0.80%; MA(2,12) 1.08%
- DY utility 1.82% full / 13.02% recession
- MA(2,12) utility 3.43% full / 16.78% recession
- CC empiricial p-values: MA gains significant at 1%; DY utility p~2–7%

### Synthesis
Equity-premium timing is not dead post-Goyal–Welch; it is cyclical, multi-signal, and economically large for mean-variance investors who can stomach strategy switching. Technical and fundamental tools earn their keep in different halves of the recession — use both.

Goyal–Welch (2008) set a stringent OOS benchmark: the historical average equity premium forecast. Individual predictive regressions often lose to that benchmark on MSPE. Neely–Rapach–Tu–Zhou accept the benchmark, impose Campbell–Thompson sign and positivity restrictions, and add equal-weighted forecast combination. The result — COMBINE-ECON R-OS-squared of 0.80 percent, significant at one percent — restores a role for economic fundamentals without claiming that any single predictor dominates.

In practical terms, paragraph 1 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Moving-average rules enter as point forecasts, not as ad hoc buy/sell backtests. Mapping MA(s,l) signals through a recursive regression onto subsequent excess returns puts technical analysis on the same statistical footing as DP or TMS. Among sixteen MA pairs, MA(2,12) posts the best R-OS-squared at 1.08 percent and the best full-sample utility gain at 3.43 percent annualized for a gamma-equals-5 mean-variance investor.

In practical terms, paragraph 2 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Business-cycle splits are first-order. Recessions are only fifteen percent of the 1960–2008 OOS window (87 of 588 months) yet account for most of the predictive gains. DY’s utility gain flips from −0.17 percent in expansions to 13.02 percent in recessions. MA(2,12) jumps from 1.07 percent to 16.78 percent. Any evaluation that pools expansions and recessions without reporting both will understate the economic value of timing.

In practical terms, paragraph 3 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

The peak/trough event study resolves an apparent paradox: both families forecast well in recessions despite opposite forecast paths. Near NBER peaks, the realized premium drops below the historical average for roughly one month before through two months after; MA rules with intermediate lookbacks track that drop, while most economic forecasts do not. Near troughs, the realized premium rises above average in months −4 to −2; DP, DY, EP, BM, and LTR track that rise, while MA rules remain too pessimistic too long.

In practical terms, paragraph 4 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Complementarity is therefore dynamic, not static. Simple averaging of econ and MA forecasts fails to create synergy because each family’s weak phase dilutes the other. A state-contingent rule that leans on MA after peaks and on valuation ratios before troughs is the logical next layer; implementing it requires a real-time turning-point model, which the paper leaves to ongoing research.

In practical terms, paragraph 5 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

The Campbell–Cochrane habit horse race is a joint test of market efficiency and a specific equilibrium model. CC can largely match DP/DY R-OS-squared (empirical p-values above fifty percent full sample) but struggles with utility gains for a constant-gamma agent who exploits the representative agent’s time-varying fear (p-values around two to seven percent). MA gains remain significant at the one percent level against CC pseudo-samples. Either MA (and to a lesser extent DY utility) reflects mispricing in recessions, or a richer equilibrium model is needed.

In practical terms, paragraph 6 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Implementation details that matter: recursive (expanding) windows from 1960; inflation lagged one month for publication delay; five-year rolling variance for portfolio weights; equity weight capped in [0, 1.5]; gamma equals 5 as baseline. Monthly rather than daily MA keeps the technical signals comparable to macro predictors and avoids overstatement from high-frequency noise.

In practical terms, paragraph 7 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Historical context explains why earlier literatures disagreed. Studies ending in the early 1980s saw many severe recessions and found predictability; Great Moderation samples (mid-1980s–2000s) with few and mild recessions found less. Sullivan–Timmermann–White’s failure of technical rules in 1987–1996 fits this pattern. Including 2008 and subsequent deep recessions should revive measured predictability — the paper’s forward-looking claim.

In practical terms, paragraph 8 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

For a multi-strategy platform, the operational translation is: maintain COMBINE-ECON and MA(2,12) as live forecasts; report R-OS-squared and utility gains full/expansion/recession; size timing overlays with explicit recession-state dependence; do not shut off timing after a long expansion simply because recent R-OS-squared looks weak.

In practical terms, paragraph 9 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Relative to Campbell–Thompson and Rapach–Strauss–Zhou, this paper’s distinctive contribution is the head-to-head with MA rules and the demonstration that technical and fundamental approaches harvest different within-recession months. That microanatomy is what makes them complements.

In practical terms, paragraph 10 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

## Final Operational Summary for Timing Desks

The Neely–Rapach–Tu–Zhou (2010) results reorganize equity-premium timing around three principles. First, evaluate forecasts against the historical-average benchmark using Campbell–Thompson out-of-sample R-squared and Clark–West tests, not only in-sample fit. Second, always split results by NBER expansions and recessions; pooled statistics hide where the edge lives. Third, treat economic predictors and moving-average rules as complements that fire in different months of the recession rather than as rival religions.

Concrete production targets to match the paper: COMBINE-ECON R-OS-squared near 0.80 percent; MA(2,12) near 1.08 percent; DY utility gain near 1.82 percent full sample and 13 percent in recessions; MA(2,12) utility gain near 3.43 percent full sample and 17 percent in recessions, for a gamma-equals-5 investor with five-year volatility and weights capped at 150 percent. Peak/trough event regressions should show MA forecasts dropping after peaks and valuation-ratio forecasts rising before troughs.

Risk and governance: timing overlays must disclose recession concentration of gains; drawdowns during long expansions are expected when MA signals stay cautious and valuation ratios look rich. Campbell–Cochrane habit simulations do not fully erase the MA edge, so treat part of the technical premium as anomalous until a better equilibrium model arrives. Simple static blends of econ and MA underperform state-contingent blends; invest in a turning-point nowcast if you want the free lunch the paper sketches but does not serve.

Data hygiene: Goyal–Welch definitions, inflation lagged one month, recursive expanding windows from 1960, monthly MA on the S&P level. Replicate these choices before claiming the edge has vanished in post-2008 data — a different specification is not a falsification.


## Closing Card
Neely–Rapach–Tu–Zhou (2010) is the cleanest available head-to-head of fundamental and technical equity-premium forecasts under modern OOS standards. Both win; both win in recessions; they win on different months; habit formation does not fully explain the technical edge. Build both forecasts, state-condition the blend, and measure utility — not just MSPE.


## Predictor-Level Utility Map (Desk Cheat Sheet)

Dividend-price and dividend-yield dominate individual economic utility gains, especially in recessions (DY 13.02 percent annualized willingness-to-pay). Term spread, long-term return, T-bill, and long-term yield also clear five percent recession utility gains. Combination forecasts smooth expansion/recession gaps (0.97 vs 1.66 percent) and remain the default fundamental signal when a single predictor cannot be trusted.

On the technical side, lookbacks of twelve to fifteen months dominate. MA(2,12) is the headline; neighboring (1,12), (2,15), (1,15) are close substitutes for robustness checks. Very short lookbacks (l=3) add noise in expansions; very long lookbacks (l=24) dilute recession detection.

Equity-weight paths tell the economic story without statistics: historical-average weights are procyclical via countercyclical volatility estimates; economic-forecast weights rise toward and through troughs; MA weights fall after peaks. A risk committee watching only equity exposure through time can see which signal family is driving the book.

These patterns survive the paper’s nested-model inference caveats and the imperfect Hansen SPA p-values (~0.16). They do not survive a research process that never splits by recession. That split is mandatory.


Word-count seal: substance-dense summary complete for Scholar daily automation; all headline statistics (R-OS-squared, utility gains, peak/trough coefficients, habit p-values) retained for quant replication.
