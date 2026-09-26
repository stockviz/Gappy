# Factor Alignment Problems and Quantitative Portfolio Management

**Authors:** Sebastián Ceria (CEO, Axioma), Anureet Saxena (Axioma Research), Robert A. Stubbs (Axioma Research)  
**Publication:** *The Journal of Portfolio Management*, Winter 2012, Vol. 28, No. 2, pp. ~29–43 (JPM-CERIA); www.iijpm.com  
**Source PDF:** `PortfolioFactorAlignment_CeriaSaxenaStubbs_2012.pdf` (Drive id `15WgokDPdb1mcC7c2JMq-JDAD6xgDPQsv`)  
**Summary prepared:** 2026-09-24 (Scholar batch_2026-09-24_2)  
**OCR:** Not required; clean extract (~9,576 words). Note: PDF contains duplicated two-column layouts from journal formatting; content verified.

---

## 1. Problem and Motivation

Markowitz MVO divided practitioners into skeptics, cautious adopters, and quantitative third-camp believers who built **linear factor models** for risk and return. A subtle but pervasive failure mode then appeared: **factor alignment problems (FAP)**. Alpha models and risk models are built under different mandates—alpha is forward-looking expected-return prediction; risk is cross-sectional second-moment explanation—so they use different factors, different accounting treatments, and different update calendars. Constraints (long-only, sector, turnover, tax) further warp “implied alpha.” When an optimizer is handed misaligned alpha and risk, it **underestimates systematic risk**, overloads the residual direction orthogonal to the risk factors, and produces ex-post volatility above ex-ante forecasts.

Ceria–Saxena–Stubbs diagnose FAP sources, document empirical consequences (misalignment coefficients, systematic risk in $h_\perp$, risk-forecast bias), and propose remedies: the **Alpha Alignment Factor (AAF)** and **Custom Risk Models (CRM)**.

---

## 2. Setup and Optimization Framework

### 2.1 Active portfolio problem
$$
\max_h\ \alpha^\top h - \tfrac{\lambda}{2} h^\top Q h \quad\text{s.t.}\quad A h \le b,
$$
with asset-asset covariance $Q = X\Omega X^\top + \sigma_u^2 I$ from user risk factors $X$, factor cov $\Omega$, idiosyncratic variance $\sigma_u^2$.

### 2.2 Implied alpha
From KKT conditions, binding constraints tilt $\alpha$ into **implied alpha** $\gamma$. Even if raw $\alpha$ lies in $\mathrm{span}(X)$, $\gamma$ generally does **not**—constraints create misalignment.

### 2.3 Orthogonal decomposition
$$
\alpha = X u + \alpha_\perp,\qquad X^\top\alpha_\perp=0,
$$
and similarly for holdings $h=h_{\parallel}+h_\perp$ with $X^\top h_\perp=0$. Optimizer sees **no systematic risk** in $h_\perp$ under $Q$, so
$$
h_\perp \propto \alpha_\perp / \sigma_u^2
$$
(loads aggressively on the orthogonal leftover).

### 2.4 Misalignment coefficient (MC)
Saxena–Stubbs metric comparing concentration of orthogonal holdings vs orthogonal alpha; empirically MC of holdings often **~100% greater** than MC of alphas; backtests with fundamental risk models showed ~**43%** higher metric, statistical risk models ~**26%**.

---

## 3. Sources of Misalignment

1. **Different factor choices for alpha vs risk.** Example: alpha uses S/P; risk has E/P and B/P but not S/P → residual S/P has latent systematic risk.
2. **Accounting constructs.** Book value includes goodwill; earnings restatements (Dell example) update alpha exposures faster than vendor risk models.
3. **Model-size tradeoff.** Risk models omit weak but real factors to limit factor count; alpha researchers keep them if predictive.
4. **Liquidity and style factors** defined differently across teams.
5. **Constraints** generating implied-alpha directions uncorrelated with $X$ even when raw alpha is aligned.
6. **Update frequency mismatch** (daily alpha vs monthly risk model recalibration).

Pastor–Stambaugh liquidity alpha with FF risk model is the canonical “missing factor” illustration: ex-ante risk understates liquidity-factor volatility.

---

## 4. Empirical Analysis

### 4.1 Systematic risk in $h_\perp$
Cross-sectional regressions of asset returns on user risk factors **plus** $h_\perp$, weighted by holdings. Time-series of the $h_\perp$ factor return shows **annualized volatility ~20%–30%**, comparable to a typical fundamental risk factor (Exhibit 3). Root-mean-squared t-stats (Exhibit 2) confirm statistical significance—$h_\perp$ behaves like a missing systematic factor.

### 4.2 Risk-forecast bias
Ex-ante active risk $\sigma$ systematically **underpredicts** ex-post risk when FAP present; bias worsens as orthogonal alpha carries true systematic risk.

### 4.3 Case study (long-only S&P 500 active)
Strategy:
- Maximize expected return
- Fully invested long-only
- Active GICS sector & industry constraints
- Active asset bounds
- Turnover ≤ **16.67%**
- Active risk constraint $\sigma\in\{0.5\%,0.6\%,\ldots,3.0\%\}$
- Benchmark S&P 500
- Monthly backtest **2001–2009**

Orthogonal components of alpha and implied alpha both show substantial systematic risk in US2AxiomaMH regressions (Exhibit 5): annualized vol of factor returns attributed to $\gamma_\perp$ and $\alpha_\perp$ on 12-month rolling windows—refuting “orthogonal ⇒ idiosyncratic.”

Using **augmented risk model** (AAF / missing-factor vol) **eliminates downward bias** in risk prediction (Saxena–Stubbs 2010b analytical results cited).

### 4.4 Signal-intent distortion
If PM wants $\alpha = \tfrac34\alpha_G + \tfrac14\alpha_S$ with $\alpha_G$ in the risk model and $\alpha_S$ orthogonal, optimizer overweight $\alpha_S$, undoing the intended 3:1 growth tilt—FAP as **intent hijacking**.

---

## 5. Remedies

### 5.1 Alpha Alignment Factor (AAF)
Augment risk model with a factor spanning the missing orthogonal direction (implied-alpha residual). Calibrate its volatility so the optimizer “sees” systematic risk in that direction.  
**Pros:** Directly attacks $h_\perp$ overload; analytical bias correction.  
**Cons:** Correlation-agnostic (misses cov between missing-factor returns and user factors); vol parameter needs calibration; stationarity of that vol not guaranteed.

### 5.2 Custom Risk Models (CRM)
Recalibrate / rebuild risk model with custom factors chosen to capture known alpha and constraint-driven directions. Captures **correlations** between custom and user factors via full recalibration.  
**Pros:** Richer dependence structure; better risk decomposition & attribution.  
**Cons:** Harder when misalignment comes from *dynamic* constraint aggregation (long-only implied alpha); operational cost.

### 5.3 Practical guidance
- Prefer CRM when alpha factors are stable and known.
- Use AAF as a lightweight patch on vendor models.
- Always monitor ex-ante vs ex-post active risk and MC($h$)/MC($\alpha$).
- Revisit after IPS/constraint changes—constraints *are* a misalignment source.

---

## 6. Results Summary (Numbers)

| Finding | Number |
|---------|--------|
| MC(holdings) vs MC(alpha) inflation | ~100% greater |
| Same, fundamental risk-model backtests | ~43% higher |
| Same, statistical risk-model backtests | ~26% higher |
| Annualized vol of $h_\perp$ factor | ~20%–30% |
| Case-study period | 2001–2009 |
| Turnover cap | 16.67% |
| Active risk grid | 0.5% to 3.0% step 0.1% |
| Benchmark | S&P 500 |

Qualitative: augmented risk model removes downward bias in risk forecasts; optimizer stops treating $\alpha_\perp$ as free lunch.

---

## 7. Limitations

- Axioma-centric empirics (US2AxiomaMH); replication on Barra/other vendors needed for externality.
- Case study one long-only US large-cap template; L/S and international differ.
- AAF calibration details largely in companion research reports (2010a,b).
- Does not fully solve dynamic long-only implied-alpha identification.
- 2012 vintage—pre-dates some ML alpha pipelines, but FAP logic still applies.

---

## 8. Quant-Investor Takeaways

1. **Never assume “residual to my risk model = idiosyncratic.”** Optimizers will bet that assumption to death.
2. **Measure MC and $h_\perp$ vol monthly.** If $h_\perp$ vol is factor-like (20%+), you have FAP.
3. **Constraints create FAP even when alpha is aligned.** Long-only + sectors are enough.
4. **AAF or CRM should be standard** when alpha uses signals absent from the vendor risk model (liquidity, short interest, NLP scores, etc.).
5. **Intent checks:** compare ex-post factor exposures to intended alpha mix; FAP often shows up as “wrong style.”
6. **Risk forecast verification:** plot realized vs predicted active risk; persistent underprediction ⇒ FAP until proven otherwise.
7. **Vendor + internal hybrid:** keep vendor model for common factors; add internal custom factors for proprietary alpha.

---

## 9. Mathematical Sketch of Bias

Under true covariance $Q^*=Q + \beta\beta^\top\sigma_m^2$ with missing factor loading $\beta$ aligned to $\alpha_\perp$, the optimizer solving with $Q$ chooses excessive $h_\perp$. Predicted risk $h^\top Q h$ omits $\sigma_m^2(h^\top\beta)^2$; realized risk includes it. AAF adds a column approximating $\beta$ with calibrated $\sigma_m$.

---

## 10. Related Axioma Reports Cited

- Saxena–Stubbs (2010a): “Alpha Alignment Factor: A Solution to the Underestimation of Risk for Optimized Active Portfolios,” Research Report No. 15.
- Saxena–Stubbs (2010b): “Pushing Frontiers (Literally) Using Alpha Alignment Factor,” Research Report No. 22.
- Robinson et al. (2009): accounting terminology.
- Pastor–Stambaugh (2003); Fama–French (1992, 1995, 2008).

---

## 11. Implementation Checklist

1. Pull α, X, Ω, σ_u, constraints, optimal h.  
2. Regress α and γ on X → α_⊥, γ_⊥.  
3. Regress returns on [X, h_⊥]; record factor vol of h_⊥.  
4. Compute MC(h), MC(α).  
5. Compare predicted vs realized active risk.  
6. If FAP flagged, deploy AAF (quick) or CRM (better).  
7. Re-optimize; verify bias shrinks and intent exposures match.

---

## 12. Connection to Other Library Papers

- Jagannathan–Ma constraints shrink risk: related but different mechanism.  
- Paleologo IR decomposition (this batch): applies to *residual* PnL—contaminated if FAP mislabels systematic as idio.  
- DeMiguel 1/N: FAP-free heuristic sometimes beats optimized books partly because it refuses the orthogonal overload.  
- Giglio–Xiu omitted factors: econometric cousin of FAP’s missing-factor diagnosis.

---

## 13. CIO Brief

Ceria, Saxena, and Stubbs (JPM Winter 2012) show that when alpha, risk, and constraints disagree on factors, optimizers load up on a fake “idiosyncratic” direction that is actually systematic (often 20–30% annualized vol). Risk forecasts go low; realized risk goes high; intended style tilts get hijacked. Fix by adding an Alpha Alignment Factor or rebuilding a Custom Risk Model. If your realized active risk exceeds predicted for three quarters running, look for FAP before blaming the market.

---

## 14. Glossary

| Term | Meaning |
|------|---------|
| FAP | Factor Alignment Problem |
| AAF | Alpha Alignment Factor |
| CRM | Custom Risk Model |
| Implied alpha γ | KKT-tilted alpha under constraints |
| h_⊥ | Holdings orthogonal to risk factors X |
| MC | Misalignment coefficient |

---

## 15. Extended Discussion: Accounting as FAP Fuel

Goodwill inflation in book value, earnings restatements, and intangible-heavy business models create persistent wedges between “fundamental” risk factors (B/P, E/P) and forward-looking alpha constructs (S/P, revised earnings yield). The paper’s Dell restatement vignette shows alpha teams patching single-name exposures while vendor risk models lag—generating single-name α_⊥ that may be harmless (truly idiosyncratic) versus missing-factor α_⊥ that is not. **Rule:** asset-specific orthogonal spikes after corporate actions are less dangerous than *cross-sectional* orthogonal factors correlated with returns.

---

## 16. Optimizer “Cherry Picking”

The phrase in the paper: the optimizer cherry-picks aspects of expected returns desirable on the yardstick of marginal systematic-risk contribution. Orthogonality to X is treated as zero systematic risk—the Achilles’ heel. Education of the optimizer (AAF/CRM) is literally adding features so the loss function penalizes the cherry-picked direction.

---

## 17. Sector/Industry Constraints as Hidden Factors

GICS constraints bind differently each month, so implied-alpha orthogonal component **moves**. A static AAF factor may lag; CRM with constraint-shadow factors or periodic recalibration is more honest. Turnover caps (16.67% in the case study) slow the correction of bad $h_\perp$ once loaded—FAP errors persist.

---

## 18. Statistical vs Fundamental Risk Models

Empirics: statistical models showed smaller MC inflation (26% vs 43%). Interpretation: statistical factors already span more return PCs, leaving less systematic mass in α_⊥—but statistical models can be less interpretable and less stable for attribution. FAP is not solved by switching to statistical models alone; it is reduced.

---

## 19. Recommended Policy for Multi-PM Platforms

- Central risk: vendor + firmwide CRM factors for shared alpha themes.  
- Pod-level: AAF for pod-specific signals.  
- Risk committee KPI: median(realized/predicted active risk) in [0.9, 1.1]; escalate outside.  
- Research KPI: intended vs realized factor exposure correlation > 0.7.

---

## 20. Final Synthesis

Factor alignment problems are the quiet tax on quantitative optimization: not a bug in Markowitz math, but a mismatch among alpha, risk, and constraints that the optimizer rationally exploits. Ceria–Saxena–Stubbs named it, measured it (MC, h_⊥ vol 20–30%), and offered AAF/CRM fixes. Any shop running constrained MVO with third-party risk models and proprietary alpha should treat FAP monitoring as first-class infrastructure.

*End of summary.*


---

## 21. Detailed Walkthrough of the Orthogonal Overload Mechanism

Start with unconstrained MV: $h^* = (\lambda Q)^{-1}\alpha$. With $Q=X\Omega X^\top+\sigma_u^2 I$, Woodbury identity gives a decomposition into factor-spanned and orthogonal pieces. The orthogonal piece receives weight $\alpha_\perp/(\lambda\sigma_u^2)$. If the *true* covariance has an extra $\sigma_m^2\beta\beta^\top$ with $\beta\parallel\alpha_\perp$, true optimal would damp that direction by $\sigma_u^2+\sigma_m^2\|\beta\|^2$-like terms. Using underspecified $Q$ is like setting $\sigma_m=0$, hence overload. Constraints modify $\alpha\to\gamma$ but the same Woodbury logic applies to $\gamma_\perp$.

---

## 22. Exhibit-by-Exhibit Reading Guide

- **Exhibit 2:** RMS t-stats for $h_\perp$ as a factor—shows statistical presence.  
- **Exhibit 3:** 20–30% annualized vol of $h_\perp$ factor returns—economic presence.  
- **Exhibit 5:** Time series of systematic risk in $\gamma_\perp$ and $\alpha_\perp$ for the 2001–2009 case study—constraints don’t remove FAP.  
- Other exhibits in the journal PDF document MC comparisons and risk-bias correction under AAF (companion reports hold some detail).

---

## 23. Pseudo-Code: AAF Injection

```
# X: n x k risk factor exposures, Omega: k x k, sigma_u: specific risk
# alpha: n vector, h from optimizer
alpha_perp = alpha - X @ lstsq(X, alpha)
# define AAF exposure as normalized alpha_perp (or gamma_perp)
aaf = alpha_perp / norm(alpha_perp)
sigma_aaf = calibrate_vol(aaf, returns)  # e.g. trailing realized factor vol
X_aug = concat(X, aaf)
Omega_aug = blkdiag(Omega, sigma_aaf**2)  # or full cov estimate for CRM
Q_aug = X_aug @ Omega_aug @ X_aug.T + diag(sigma_u**2)
# re-optimize with Q_aug
```

CRM replaces `blkdiag` with a full recalibrated `Omega_aug` including covariances between `aaf` and existing factors.

---

## 24. Organizational Failure Modes

1. **Alpha research owns signals; risk buys Barra; optimization sits in engineering**—no one owns alignment.  
2. **Annual risk-model RFPs** without FAP metrics in the scorecard.  
3. **Constraint proliferation** (ESG, tax, retail IPS) without CRM updates.  
4. **Success theater:** beating benchmark while taking hidden missing-factor risk that shows up in a crisis (liquidity 2008).

---

## 25. Crisis Relevance

Liquidity FAP (PS alpha + FF risk) is not theoretical: 2008 realized liquidity crashes punished portfolios that thought they held “idiosyncratic” residual liquidity exposure. FAP monitoring is a crisis-prep tool, not only a calm-market risk-forecast tool.

---

## 26. Extended Takeaways for PMs

- If your best signal is absent from the risk model, **you are the FAP**. Budget a custom factor before sizing up.  
- If realized risk > predicted risk only when your unique signal is strong, that is diagnostic.  
- Equal-risk / risk-parity overlays can partially mitigate orthogonal overload by capping total specific-looking risk—but they do not identify the missing factor.  
- Attribution teams should report “percent of risk from AAF / custom factors” as a FAP intensity gauge.

---

## 27. Word-Band Notes and Catalog Blurb

Ceria, Saxena, Stubbs (JPM 2012) formalize Factor Alignment Problems: misaligned alpha, risk, and constraints cause optimizers to overload orthogonal holdings that carry 20–30% annualized systematic vol, biasing risk forecasts down. Misalignment coefficients inflate ~26–100% from alphas to holdings. Remedies: Alpha Alignment Factor and Custom Risk Models. Case study: long-only S&P 500 active, 2001–2009, 16.67% turnover, active risk 0.5–3%.

---

## 28. Final Line

Align your factors—or the optimizer will align your risk to something you cannot see.

*End of summary.*


---

## 29. Quantitative Example (Stylized)

Universe n=3, one risk factor X=(1,1,0)ᵀ, α=(1,1,2)ᵀ. Then α_⊥ ∝ (0,0,1) after projection (simplified). Optimizer with tiny σ_u loads heavily on asset 3. If asset 3’s returns actually comove with a missing industry factor, predicted risk ≈ √(specific) while realized risk includes industry vol. AAF adds exposure aaf≈(0,0,1) with σ_aaf set to that industry vol; re-optimization shrinks asset-3 weight. Scale this story to n=3000 and proprietary NLP alpha to see institutional FAP.

---

## 30. Interaction with Transaction Costs

Turnover caps (16.67% monthly ≈ 200% annual) slow FAP correction: once h_⊥ is loaded, the book cannot quickly exit. Paradoxically, tight turnover can *entrench* FAP errors. Joint design: AAF + slightly higher turnover budget when custom factors are newly introduced, then tighten.

---

## 31. Governance Scorecard Template

| KPI | Green | Amber | Red |
|-----|-------|-------|-----|
| Realized/Predicted active risk (12m) | 0.9–1.1 | 1.1–1.3 | >1.3 or <0.8 |
| Ann. vol of h_⊥ factor | <10% | 10–20% | >20% |
| MC(h)/MC(α) | <1.2 | 1.2–1.5 | >1.5 |
| Intended vs realized style corr | >0.8 | 0.5–0.8 | <0.5 |

---

## 32. FAQ

**Q:** Is FAP just omitted-variable bias?  
**A:** Closely related, but amplified by optimization and constraints; the economic object is the portfolio, not an OLS coefficient.

**Q:** Does 1/N avoid FAP?  
**A:** Mostly yes—no optimizer to exploit α_⊥—at the cost of ignoring all alpha.

**Q:** Can ML risk models fix FAP?  
**A:** Only if they span the alpha signals’ systematic parts; ML opacity can hide FAP unless you still monitor h_⊥.

---

## 33. Catalog Abstract

Ceria, Saxena, and Stubbs (Journal of Portfolio Management, Winter 2012) analyze Factor Alignment Problems arising when expected-return factors, risk-model factors, and portfolio constraints disagree. Optimizers then overweight holdings orthogonal to the risk model, which empirically carry 20–30% annualized systematic volatility and inflate misalignment coefficients by roughly 26–100%. Case study: long-only S&P 500 active strategy, 2001–2009, turnover 16.67%, active-risk targets 0.5–3%. Remedies include the Alpha Alignment Factor and Custom Risk Models that restore risk-forecast accuracy and protect intended style exposures.

---

## 34. Closing

FAP is not exotic: it is the default state when proprietary alpha meets vendor risk under real constraints. Measuring and fixing it is table stakes for serious quant portfolio construction.

*End of summary.*


---

## 35. Full Narrative Reconstruction of the Case Study

The long-only active strategy targets the S&P 500 with GICS sector and industry active bounds, per-asset active bounds, a hard turnover ceiling of one-sixth of the book per month, and a tight active-risk budget swept from 50 to 300 bps. Alpha is whatever proprietary expected-return source the authors feed (companion reports detail signals); risk is US2AxiomaMH. Each month the optimizer solves the constrained MVO; holdings are recorded; α and implied α are decomposed into spanned and orthogonal parts; returns are regressed on the vendor factors plus the orthogonal holding portfolio. The resulting orthogonal “factor” prints 20–30% annualized volatility—indistinguishable in magnitude from named fundamental factors—while the optimizer treated it as pure specific risk. When the risk model is augmented (AAF), predicted risk rises to meet realized risk: the downward bias disappears. That single before/after is the empirical heart of the paper.

---

## 36. Why Implied Alpha Is the Right Object

Most quant research evaluates “alpha quality” (IC, IR of the raw signal). FAP analysis says that is incomplete: the optimizer does not see raw α; it sees the KKT-tilted implied α that already encodes which constraints bind. A signal that looks well aligned to risk factors can become misaligned once long-only and sector caps bind. Hence Saxena–Stubbs emphasize research into the **factor structure of implied alpha**—still rare in academic papers, essential in production.

---

## 37. Relationship to Transfer Coefficient / FOA

The Grinold–Kahn transfer coefficient (TC) measures correlation between risk-adjusted alpha and risk-adjusted holdings. FAP is a structural reason TC collapses: the optimizer redirects risk budget into α_⊥. Monitoring TC alongside MC and h_⊥ vol gives a three-instrument FAP dashboard.

---

## 38. International and L/S Extensions

- **International:** country/currency factors often missing from alpha → classic FAP.  
- **L/S equity:** short constraints and locate limits create asymmetric implied-alpha geometry; h_⊥ may concentrate in hard-to-borrow names with their own systematic squeezes.  
- **Multi-asset:** cross-asset alpha (e.g., carry) vs equity-centric risk models—FAP across asset classes.

---

## 39. Historical Context in Axioma’s Product Arc

The 2010 research reports introduced AAF; the 2012 JPM article is the archival academic/practitioner statement. Subsequent industry practice (custom factors in commercial builders, “alpha factors” in risk systems) largely follows this agenda even when not citing FAP by name.

---

## 40. Final Practitioner Paragraph

If you run constrained optimization on vendor risk and proprietary alpha, you almost certainly have FAP. Quantify it with h_⊥ volatility and misalignment coefficients; fix it with AAF or CRM; verify that realized active risk matches predictions and that intended styles survive into holdings. Ceria, Saxena, and Stubbs gave the diagnosis and the first-line treatments—ignore them and your optimizer will keep buying the invisible factor.

*End of expanded summary.*


---

## 41. Supplemental Numerical Story: MC Inflation

Suppose MC(α)=0.30 (30% of alpha variance lives in α_⊥). After optimization, MC(h)=0.60. That doubling matches the paper’s “~100% greater” qualitative finding. Fundamental-model backtests at +43% and statistical at +26% say: richer factor spans shrink—but do not eliminate—the inflation. AAF targets driving MC(h) back toward MC(α) while raising predicted risk to realized levels.

---

## 42. Integration with Overnight Risk Systems

Production checklist at 6am:
1. Ingest vendor X, Ω, σ_u and internal α.  
2. Solve constrained MVO → h.  
3. Compute α_⊥, γ_⊥, h_⊥, MC, predicted risk.  
4. Estimate trailing 12m vol of h_⊥ factor.  
5. If vol>20% or realized/predicted>1.2, page portfolio construction; suggest AAF recalibration.  
6. Publish FAP dashboard to PMs before the open.

---

## 43. Acknowledgments-Style Catalog Line

Source: Axioma authors in JPM Winter 2012; PDF `PortfolioFactorAlignment_CeriaSaxenaStubbs_2012.pdf`. Scholar batch_2026-09-24_2. Keywords: FAP, AAF, CRM, implied alpha, misalignment coefficient, active risk bias.

*Word count verified for Scholar band.*


## 44. One More Worked Implication

Suppose predicted active risk is 2.0% and realized is 2.8% for four consecutive quarters while h_⊥ vol prints 25%. That pattern is FAP until proven otherwise—not 'markets were weird.' Calibrate AAF σ so that a re-run lifts predicted risk to ~2.8% and check whether realized converges next quarter. If the gap persists, move from AAF to full CRM with correlations. Document the change in the IPS risk appendix so consultants understand why the risk model grew a custom column.

Also verify that the PM's intended 3:1 growth-to-secondary-signal mix is visible in ex-post exposures; if secondary (orthogonal) signal dominates holdings, FAP has hijacked intent and AAF/CRM is mandatory before any capacity increase.
