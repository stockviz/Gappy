# Parametric Portfolio Policies: Exploiting Characteristics in the Cross-Section of Equity Returns — Brandt, Santa-Clara & Valkanov (2009) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Parametric Portfolio Policies: Exploiting Characteristics in the Cross-Section of Equity Returns |
| **Authors** | Michael W. Brandt (Fuqua, Duke; NBER); Pedro Santa-Clara (UCLA Anderson; Universidade Nova de Lisboa; NBER); Rossen Valkanov (Rady, UCSD) |
| **Outlet** | *Review of Financial Studies* Advance Access published February 13, 2009; doi:10.1093/rfs/hhp003 |
| **JEL** | G11, G12 |
| **Sample** | CRSP–Compustat merged; characteristics from 1964; performance stats **Jan 1974 – Dec 2002**; OOS telescoping from 1974 |
| **Utility** | Power (CRRA) with relative risk aversion **γ=5** (base); also vary γ |
| **Characteristics** | Size (me), book-to-market (btm), momentum (mom = lagged 1-year return) |
| **Original PDF** | `ParametricPortfolios_BrandtSantaclaraValkanov_2009.pdf` |
| **Drive file_id** | `15g1LQd_mytv_eUtpYxSDddx5qzZS3Z1Q` |
| **Extraction** | Binary download + pdftotext; ~17,600 words; clean |

---

## Problem / Motivation

Firm characteristics (size, B/M, lagged return) relate to expected returns, variances, and covariances (Fama–French 1996; Chan–Karceski–Lakonishok 1998). Exploiting this in Markowitz form requires modeling N means and N(N+1)/2 covariances as functions of characteristics — econometrically brutal, PSD constraints hard, results noisy (Michaud 1989). Industry responds with shrinkage, factor covariances, Black–Litterman, constraints (Jobson–Korkie, Frost–Savarino, Jorion, Chan–Karceski–Lakonishok, Pastor, Jagannathan–Ma, Ledoit–Wolf) — heavy infrastructure (BARRA et al.), rarely used outside quant shops.

**Proposal:** Parameterize each stock’s weight as a function of its characteristics; estimate the few policy coefficients by maximizing the investor’s **average realized utility** over history. Bypass distributional modeling entirely; optimize the object of interest (weights).

**Dimensionality:** Traditional path — N + N(N+1)/2 moments (plus higher moments for non-quadratic utility). For N=100, >5,000 second moments and >300,000 third moments. Parametric policy — estimate **K coefficients** (K=#characteristics), independent of N and of preference beyond the utility used in the criterion.

Related: Brandt (1999), Aït-Sahalia–Brandt (2001) nonparametric policies for stocks/bonds/cash; Brandt–Santa-Clara (2006) JF — policy as function of **macro** predictors for few asset classes. This paper: **same coefficients across stocks**, function of **stock-specific** characteristics — the large-N stock-selection problem.

---

## Setup and Data

**Universe:** All CRSP–Compustat stocks with valid characteristics; N_t time-varying (method handles this automatically — nontrivial in classical Markowitz, Stambaugh 1997).

**Characteristics x_{i,t}:** market equity (me), book-to-market (btm), 12-month lagged return (mom). Cross-sectionally standardized each date to mean 0, variance 1 → $\hat x_{i,t}$. Stationarity of cross-sectional distribution; deviations from benchmark sum to 0 automatically when benchmark weights used as intercept.

**Benchmark $\bar w_{i,t}$:** value-weighted market (base case).

**Risk-free:** 1-month T-bill. Term spread (10y–1y) used when allowing time-varying coefficients.

**Sample:** Characteristics from Jan 1964; reported stats Jan 1974–Dec 2002 (first 10 years reserved for initial OOS estimation). Average rf ≈ 0.061 annualized.

**Optimization:** Maximize sample average CRRA utility of portfolio return; γ=5 base.

---

## Model / Methods

### Linear policy (base)

$$
w_{i,t}=\bar w_{i,t}+\frac{1}{N_t}\theta^\top \hat x_{i,t}.
$$

Coefficients θ constant across assets and time. 1/N_t normalization: doubling N without changing characteristic distribution does not double aggressiveness.

Unconditional problem:

$$
\max_\theta\;\mathbb{E}\big[u\big(\textstyle\sum_i f(x_{i,t};\theta)\,r_{i,t+1}\big)\big],
$$

estimated by

$$
\max_\theta\;\frac{1}{T}\sum_{t=0}^{T-1}u\Big(\sum_{i=1}^{N_t}\Big(\bar w_{i,t}+\frac{1}{N_t}\theta^\top\hat x_{i,t}\Big)r_{i,t+1}\Big).
$$

Low-dimensional nonlinear optimization; analytic gradient/Hessian for common u and linear policy.

### Nesting long–short factors

If characteristics are quantile indicators (+1 top 30%, −1 bottom 30%, 0 else), linear policy ≈ static allocation to market + SMB/HML/WML-style long–short legs (eq. 10 discussion). Unlike FF double sorts, stocks get weight proportional to characteristic, not to market cap within bucket.

### Inference

Maximum expected utility estimator; asymptotic / bootstrap SEs for θ; Wald test θ=0. Paper prefers **1000 bootstrap** SEs (slightly conservative vs analytic).

### Extensions

- **Long-only:** truncate negative weights / renormalize, or use nonlinear policy ensuring positivity.
- **Time-varying θ:** θ_t = θ_0 + θ_1 z_t with z=term spread.
- **Transaction costs:** linear costs; optional no-trade band policy — skip rebalancing when implied trade below threshold; can cut turnover ~50% with small CE loss.
- **Alternative normalizations:** industry-demean characteristics (Asness–Porter–Stevens); residualize characteristics on other firm variables via cross-sectional regression.

### Decomposition

Optimal portfolio = market + long–short hedge fund. Hedge return r_h = q(r_h+ − r_h−) with leverage q. Empirically long side beats market; short side ≈ market — can replace short stock book with short futures.

---

## Results with Numbers

### Table 1 — Base linear policy, γ=5, 1974–2002

| Coefficient | In-sample | OOS avg |
|-------------|-----------|---------|
| θ_me | **−1.451** (0.548) | −1.124 (0.709) |
| θ_btm | **+3.606** (0.921) | +3.611 (1.110) |
| θ_mom | **+1.772** (0.743) | +3.057 (0.914) |
| Wald/LRT p | 0.000 | 0.005 |

Signs: overweight small, value, winners — consistent with anomaly literature. B/M has largest |θ|.

**Weight distribution (IS):** |w|×100 avg 0.083 vs VW 0.023; max 3.485% vs VW 3.678%; min −0.216%; sum of negative weights **−1.279** (long book ~228%); fraction short **47.2%**; turnover **0.990**/year vs VW 0.097, EW 0.142.

**Performance (annualized, IS):**

| | VW | EW | PPP |
|--|-----|-----|-----|
| CE | 0.064 | 0.069 | **0.175** |
| Mean ret | 0.139 | 0.180 | **0.262** |
| Vol | 0.169 | 0.205 | 0.188 |
| Sharpe | 0.438 | 0.564 | **1.048** |
| α (mkt) | — | — | **0.174** |
| β | — | — | 0.311 |
| σ(ε) | — | — | 0.181 |
| IR | — | — | **0.960** |

CE gain vs market ≈ **11.1 percentage points** (0.175−0.064). FF3 α ≈9%; four-factor α ≈2.5% — loads on size/value/momentum as intended.

**OOS:** CE **0.118**; Sharpe **0.941**; α 0.177; IR 0.829. CE still ~5.4 pp above market (0.118−0.064). Momentum θ rises OOS; size weaker.

**Portfolio characteristics (avg standardized):** PPP me −0.337, btm **+3.553**, mom **+1.623** vs VW me +2.118, btm −0.418, mom +0.016 — strong value and momentum tilts, mild small-cap.

**Hedge decomposition:** avg hedge return 12.27%; long leg 20.79%; short leg 14.01%; market 11.96%; unlevered long–short 6.78%; leverage q≈**173%**.

### Table 2 — Optimize over FF-style long–short factors

Similar signs; IS CE 0.129, OOS CE 0.095 — worse than characteristic-linear PPP (Table 1) because FF legs value-weight within buckets whereas PPP weights by characteristic intensity.

### Table 3 — Long-only

Short-sale constraints bind hard. Performance gap vs unconstrained Table 1 is large (significant utility cost). Fraction not held in long-only ≈ fraction shorted in unconstrained — similar “active share” but without short alpha. Long-only still beats VW but gives up much of the hedge-fund-like IR.

### Table 4 — Time-varying coefficients (term spread)

Allowing θ(tsp) improves both IS and OOS vs constant θ. Business-cycle dependence of characteristic premia is economically useful.

### Table 5 — Varying risk aversion

Higher γ: size and momentum become less appealing; **value retains importance**. Certainty equivalents decline with γ as expected; rankings across policies stable.

### Tables 6–7 — Transaction costs and no-trade band

Linear costs erode CE; policy coefficients shrink in magnitude (less aggressive). No-trade boundary policy: turnover down by up to **~50%** with only marginal CE deterioration — key practical extension.

---

## Limitations

1. Characteristics pre-chosen from known anomalies — snooping bias partially admitted for OOS (coefficients estimated OOS but characteristics selected with full-sample knowledge).
2. CRRA myopic one-period; no intermediate consumption / hedging of characteristic-risk premia dynamics beyond term-spread extension.
3. Linear policy restrictive; nonlinear/quantile policies only partially explored.
4. 1974–2002 sample; post-2002 factor crowding not covered.
5. Long-only cost is first-order — many real mandates cannot access Table 1 performance.
6. Statistical inference assumes ergodicity of the characteristic–return relationship.

---

## Practical Takeaways for a Quant Investor

1. **Do not estimate 300,000 moments.** Estimate 3 (or K) policy coefficients by maximizing average CRRA utility of the parameterized portfolio.
2. **Expected signs and magnitudes (γ=5):** θ_btm ≈ +3.6 dominates; θ_mom ≈ +1.8; θ_me ≈ −1.5. One-SD higher B/M raises active weight by 3.6/N_t.
3. **Implementability:** turnover ~100%/year; max weight ~3.5%; not a pathological corner solution. Recreate as index + 130/170-style long–short sleeve (q≈1.73).
4. **OOS CE +5.4 pp vs market** with telescoping estimation — robust relative to EW (DGU’s robust benchmark).
5. **Shorting matters:** long-only surrenders a large fraction of the gains; if constrained, expect much lower IR.
6. **Costs:** use no-trade bands; expect ~50% turnover cut with small CE loss.
7. **Risk aversion:** value tilt is the most robust across γ; momentum/size more γ-sensitive.
8. **Industry-neutral characteristics** recommended to cut risk from industry exposures (Asness et al.).
9. **Sibling papers:** Brandt–Santa-Clara (2006) for macro TAA with same philosophy; combine both in a multi-asset system.

---

## Equations Quick Reference

$$
w_{i,t}=\bar w_{i,t}+\frac{1}{N_t}\theta^\top\hat x_{i,t},\qquad
\max_\theta\frac1T\sum_t u\Big(\sum_i w_{i,t}(\theta)\,r_{i,t+1}\Big).
$$

CRRA: $u(r)=(1-\gamma)^{-1}(1+r)^{1-\gamma}$ (or log for γ=1).

Active portfolio ≈ q(long−short) atop market; empirically q≈1.73, IR≈0.96 IS / 0.83 OOS.

---

## Methodology Deep Dive

Constant θ across stocks: two stocks with the same (standardized) characteristics get the same active weight regardless of their individual return histories — characteristics assumed to span all relevant conditional moments. Constant θ through time: conditional optimal coefficients equal unconditional ones under the maintained stationarity — justifies maximizing historical average utility.

Benchmark intercept: policy is an **active overlay**; θ=0 recovers the market. Testing θ=0 is a joint test that characteristics do not improve CRRA utility vs holding the market.

Standardization: without it, raw me drifts with inflation/market levels and would dominate θ. Cross-sectional z-scores each month keep units comparable and ensure sum of active weights is zero.

1/N_t factor: if Nt doubles by splitting every firm in two with identical characteristics, without 1/N_t the same θ would double every active position’s dollar impact relative to the universe — wrong. With 1/N_t, active notional scales correctly.

### Statistical View

The estimator is an M-estimator with criterion equal to average utility. FOCs: average of u'(r_p) * (partial r_p / partial θ) = 0. Partial r_p / partial θ_k = N_t^{-1} sum_i \hat x_{i,k,t} r_{i,t+1}. Hence FOC equates utility-weighted covariances of characteristics with returns to zero at the optimum — a utility-gradient version of “characteristics are priced.”

Bootstrap: resample months (or blocks) to capture time-series dependence in evaluating SEs of θ and of CE.

---

## Table-by-Table Practical Reading

Table 1: headline — unconstrained characteristic policy works IS and OOS.
Table 2: factor-mimicking alternative — similar but weaker than characteristic weighting.
Table 3: long-only — large utility haircut; still useful vs VW.
Table 4: macro-timed θ — further gains; term structure matters for characteristic premia.
Table 5: γ sensitivity — value survives; size/mom fade as γ rises.
Table 6: costs — coefficients shrink; CE falls but policy remains positive-alpha.
Table 7: no-trade band — engineering fix for turnover.

Figure 2: portfolio characteristic exposures stable through time — not a few outlier months.

---

## Implementation Blueprint

1. Each month: compute me, btm, mom; winsorize; cross-sectional z-score; optionally industry-demean.
2. With expanding window from 1964 (or trailing 10y+), numerically maximize average CRRA(γ) utility over θ.
3. Form weights w = w_mkt + θ·x_hat / N; apply long-only projection if required; apply no-trade band vs last month’s weights.
4. Trade; record; once per year (or month) re-estimate θ.
5. Report CE, SR, IR vs VW/EW; monitor average portfolio characteristics.

## Bottom Line

Brandt–Santa-Clara–Valkanov (2009) is the definitive “optimize policies, not moments” paper for equity characteristics. With three coefficients and CRRA γ=5, the policy delivers IS Sharpe ~1.05 and OOS Sharpe ~0.94 on the CRSP–Compustat universe (1974–2002), CE gains of ~11 pp IS / ~5 pp OOS vs the market, without extreme single-name weights. Value is the largest and most robust tilt; shorting and cost-aware no-trade rules are first-order for capturing the paper’s headline performance in live trading.


## Additional Quantitative Details from Tables 2–7 Narrative

Table 2 FF factors: theta_me -0.310 (0.211), theta_btm 0.667 (0.319), theta_mom 0.506 (0.186); IS CE 0.129, SR 0.847, IR 0.729; OOS CE 0.095, SR 0.805, IR 0.721. Turnover 0.328 IS vs 0.990 for characteristic PPP — lower turnover but also lower CE. Cap-weighting within legs dilutes characteristic intensity relative to Table 1.

Long-only Table 3: comparison with Table 1 shows the unconstrained portfolio’s short fraction (~47%) roughly matches the fraction of names omitted in long-only — same breadth of bets, different sign structure. Utility loss from forbidding shorts is described as large; alpha and IR fall materially.

Time-varying coefficients (Table 4): both IS and OOS improve when theta depends on term spread — characteristic payoffs are business-cycle dependent (consistent with Fama–French 1989 business-conditions evidence).

Risk aversion (Table 5): as gamma rises, optimal |theta_me| and |theta_mom| fall faster than |theta_btm|. Value is not only the largest tilt at gamma=5 but the most robust to risk aversion. Certainty equivalents decline with gamma; relative ranking of PPP vs VW persists.

Transaction costs (Table 6): including costs from the start of optimization shrinks theta toward zero (less trading of momentum especially). CE net of costs remains above VW for moderate cost assumptions.

No-trade band (Table 7): define a band around target weights; trade only when target exits band. Turnover reductions up to 50% with small CE loss — matches industry practice of rebalance thresholds.

## Snooping and Robustness Honesty

Authors note OOS coefficient estimation does not undo characteristic selection snooping. A fully honest OOS would require choosing characteristics in real time without knowledge of post-1974 performance. Size/value/momentum were already known by the 1980s–90s literature, so 1974–2002 OOS is partially contaminated. Still, the exercise disciplines coefficient magnitudes and shows stability.

## Link to Grinold–Kahn / Active Management

IR 0.96 IS / 0.83 OOS with breadth equal to number of independent characteristic bets (roughly 3, not N). Fundamental law: IR ≈ IC * sqrt(breadth). High IR with breadth 3 implies very high IC for the parametric combination — consistent with optimizing the combination for utility rather than naive equal-IC blending.

## What Success Looks Like in Production

A live implementation matching Table 1 would show: annual turnover near 100% before bands (~50% after); average short book ~100–130% of NAV; portfolio B/M about 3+ cross-sectional SDs above median; mom ~1.5–3 SDs; size mildly negative; realized SR near 0.9–1.0 pre-cost in a 1974–2002-like regime. Post-2008 factor volatilities and crowding may lower IR — re-estimate theta; do not freeze 2002 coefficients.


## Additional Quantitative Details from Tables 2–7 Narrative

Table 2 FF factors: theta_me -0.310 (0.211), theta_btm 0.667 (0.319), theta_mom 0.506 (0.186); IS CE 0.129, SR 0.847, IR 0.729; OOS CE 0.095, SR 0.805, IR 0.721. Turnover 0.328 IS vs 0.990 for characteristic PPP — lower turnover but also lower CE. Cap-weighting within legs dilutes characteristic intensity relative to Table 1.

Long-only Table 3: comparison with Table 1 shows the unconstrained portfolio’s short fraction (~47%) roughly matches the fraction of names omitted in long-only — same breadth of bets, different sign structure. Utility loss from forbidding shorts is described as large; alpha and IR fall materially.

Time-varying coefficients (Table 4): both IS and OOS improve when theta depends on term spread — characteristic payoffs are business-cycle dependent (consistent with Fama–French 1989 business-conditions evidence).

Risk aversion (Table 5): as gamma rises, optimal |theta_me| and |theta_mom| fall faster than |theta_btm|. Value is not only the largest tilt at gamma=5 but the most robust to risk aversion. Certainty equivalents decline with gamma; relative ranking of PPP vs VW persists.

Transaction costs (Table 6): including costs from the start of optimization shrinks theta toward zero (less trading of momentum especially). CE net of costs remains above VW for moderate cost assumptions.

No-trade band (Table 7): define a band around target weights; trade only when target exits band. Turnover reductions up to 50% with small CE loss — matches industry practice of rebalance thresholds.

## Snooping and Robustness Honesty

Authors note OOS coefficient estimation does not undo characteristic selection snooping. A fully honest OOS would require choosing characteristics in real time without knowledge of post-1974 performance. Size/value/momentum were already known by the 1980s–90s literature, so 1974–2002 OOS is partially contaminated. Still, the exercise disciplines coefficient magnitudes and shows stability.

## Link to Grinold–Kahn / Active Management

IR 0.96 IS / 0.83 OOS with breadth equal to number of independent characteristic bets (roughly 3, not N). Fundamental law: IR ≈ IC * sqrt(breadth). High IR with breadth 3 implies very high IC for the parametric combination — consistent with optimizing the combination for utility rather than naive equal-IC blending.

## What Success Looks Like in Production

A live implementation matching Table 1 would show: annual turnover near 100% before bands (~50% after); average short book ~100–130% of NAV; portfolio B/M about 3+ cross-sectional SDs above median; mom ~1.5–3 SDs; size mildly negative; realized SR near 0.9–1.0 pre-cost in a 1974–2002-like regime. Post-2008 factor volatilities and crowding may lower IR — re-estimate theta; do not freeze 2002 coefficients.


## Additional Quantitative Details from Tables 2–7 Narrative

Table 2 FF factors: theta_me -0.310 (0.211), theta_btm 0.667 (0.319), theta_mom 0.506 (0.186); IS CE 0.129, SR 0.847, IR 0.729; OOS CE 0.095, SR 0.805, IR 0.721. Turnover 0.328 IS vs 0.990 for characteristic PPP — lower turnover but also lower CE. Cap-weighting within legs dilutes characteristic intensity relative to Table 1.

Long-only Table 3: comparison with Table 1 shows the unconstrained portfolio’s short fraction (~47%) roughly matches the fraction of names omitted in long-only — same breadth of bets, different sign structure. Utility loss from forbidding shorts is described as large; alpha and IR fall materially.

Time-varying coefficients (Table 4): both IS and OOS improve when theta depends on term spread — characteristic payoffs are business-cycle dependent (consistent with Fama–French 1989 business-conditions evidence).

Risk aversion (Table 5): as gamma rises, optimal |theta_me| and |theta_mom| fall faster than |theta_btm|. Value is not only the largest tilt at gamma=5 but the most robust to risk aversion. Certainty equivalents decline with gamma; relative ranking of PPP vs VW persists.

Transaction costs (Table 6): including costs from the start of optimization shrinks theta toward zero (less trading of momentum especially). CE net of costs remains above VW for moderate cost assumptions.

No-trade band (Table 7): define a band around target weights; trade only when target exits band. Turnover reductions up to 50% with small CE loss — matches industry practice of rebalance thresholds.

## Snooping and Robustness Honesty

Authors note OOS coefficient estimation does not undo characteristic selection snooping. A fully honest OOS would require choosing characteristics in real time without knowledge of post-1974 performance. Size/value/momentum were already known by the 1980s–90s literature, so 1974–2002 OOS is partially contaminated. Still, the exercise disciplines coefficient magnitudes and shows stability.

## Link to Grinold–Kahn / Active Management

IR 0.96 IS / 0.83 OOS with breadth equal to number of independent characteristic bets (roughly 3, not N). Fundamental law: IR ≈ IC * sqrt(breadth). High IR with breadth 3 implies very high IC for the parametric combination — consistent with optimizing the combination for utility rather than naive equal-IC blending.

## What Success Looks Like in Production

A live implementation matching Table 1 would show: annual turnover near 100% before bands (~50% after); average short book ~100–130% of NAV; portfolio B/M about 3+ cross-sectional SDs above median; mom ~1.5–3 SDs; size mildly negative; realized SR near 0.9–1.0 pre-cost in a 1974–2002-like regime. Post-2008 factor volatilities and crowding may lower IR — re-estimate theta; do not freeze 2002 coefficients.


## Additional Quantitative Details from Tables 2–7 Narrative

Table 2 FF factors: theta_me -0.310 (0.211), theta_btm 0.667 (0.319), theta_mom 0.506 (0.186); IS CE 0.129, SR 0.847, IR 0.729; OOS CE 0.095, SR 0.805, IR 0.721. Turnover 0.328 IS vs 0.990 for characteristic PPP — lower turnover but also lower CE. Cap-weighting within legs dilutes characteristic intensity relative to Table 1.

Long-only Table 3: comparison with Table 1 shows the unconstrained portfolio’s short fraction (~47%) roughly matches the fraction of names omitted in long-only — same breadth of bets, different sign structure. Utility loss from forbidding shorts is described as large; alpha and IR fall materially.

Time-varying coefficients (Table 4): both IS and OOS improve when theta depends on term spread — characteristic payoffs are business-cycle dependent (consistent with Fama–French 1989 business-conditions evidence).

Risk aversion (Table 5): as gamma rises, optimal |theta_me| and |theta_mom| fall faster than |theta_btm|. Value is not only the largest tilt at gamma=5 but the most robust to risk aversion. Certainty equivalents decline with gamma; relative ranking of PPP vs VW persists.

Transaction costs (Table 6): including costs from the start of optimization shrinks theta toward zero (less trading of momentum especially). CE net of costs remains above VW for moderate cost assumptions.

No-trade band (Table 7): define a band around target weights; trade only when target exits band. Turnover reductions up to 50% with small CE loss — matches industry practice of rebalance thresholds.

## Snooping and Robustness Honesty

Authors note OOS coefficient estimation does not undo characteristic selection snooping. A fully honest OOS would require choosing characteristics in real time without knowledge of post-1974 performance. Size/value/momentum were already known by the 1980s–90s literature, so 1974–2002 OOS is partially contaminated. Still, the exercise disciplines coefficient magnitudes and shows stability.

## Link to Grinold–Kahn / Active Management

IR 0.96 IS / 0.83 OOS with breadth equal to number of independent characteristic bets (roughly 3, not N). Fundamental law: IR ≈ IC * sqrt(breadth). High IR with breadth 3 implies very high IC for the parametric combination — consistent with optimizing the combination for utility rather than naive equal-IC blending.

## What Success Looks Like in Production

A live implementation matching Table 1 would show: annual turnover near 100% before bands (~50% after); average short book ~100–130% of NAV; portfolio B/M about 3+ cross-sectional SDs above median; mom ~1.5–3 SDs; size mildly negative; realized SR near 0.9–1.0 pre-cost in a 1974–2002-like regime. Post-2008 factor volatilities and crowding may lower IR — re-estimate theta; do not freeze 2002 coefficients.


## Additional Quantitative Details from Tables 2–7 Narrative

Table 2 FF factors: theta_me -0.310 (0.211), theta_btm 0.667 (0.319), theta_mom 0.506 (0.186); IS CE 0.129, SR 0.847, IR 0.729; OOS CE 0.095, SR 0.805, IR 0.721. Turnover 0.328 IS vs 0.990 for characteristic PPP — lower turnover but also lower CE. Cap-weighting within legs dilutes characteristic intensity relative to Table 1.

Long-only Table 3: comparison with Table 1 shows the unconstrained portfolio’s short fraction (~47%) roughly matches the fraction of names omitted in long-only — same breadth of bets, different sign structure. Utility loss from forbidding shorts is described as large; alpha and IR fall materially.

Time-varying coefficients (Table 4): both IS and OOS improve when theta depends on term spread — characteristic payoffs are business-cycle dependent (consistent with Fama–French 1989 business-conditions evidence).

Risk aversion (Table 5): as gamma rises, optimal |theta_me| and |theta_mom| fall faster than |theta_btm|. Value is not only the largest tilt at gamma=5 but the most robust to risk aversion. Certainty equivalents decline with gamma; relative ranking of PPP vs VW persists.

Transaction costs (Table 6): including costs from the start of optimization shrinks theta toward zero (less trading of momentum especially). CE net of costs remains above VW for moderate cost assumptions.

No-trade band (Table 7): define a band around target weights; trade only when target exits band. Turnover reductions up to 50% with small CE loss — matches industry practice of rebalance thresholds.

## Snooping and Robustness Honesty

Authors note OOS coefficient estimation does not undo characteristic selection snooping. A fully honest OOS would require choosing characteristics in real time without knowledge of post-1974 performance. Size/value/momentum were already known by the 1980s–90s literature, so 1974–2002 OOS is partially contaminated. Still, the exercise disciplines coefficient magnitudes and shows stability.

## Link to Grinold–Kahn / Active Management

IR 0.96 IS / 0.83 OOS with breadth equal to number of independent characteristic bets (roughly 3, not N). Fundamental law: IR ≈ IC * sqrt(breadth). High IR with breadth 3 implies very high IC for the parametric combination — consistent with optimizing the combination for utility rather than naive equal-IC blending.

## What Success Looks Like in Production

A live implementation matching Table 1 would show: annual turnover near 100% before bands (~50% after); average short book ~100–130% of NAV; portfolio B/M about 3+ cross-sectional SDs above median; mom ~1.5–3 SDs; size mildly negative; realized SR near 0.9–1.0 pre-cost in a 1974–2002-like regime. Post-2008 factor volatilities and crowding may lower IR — re-estimate theta; do not freeze 2002 coefficients.
