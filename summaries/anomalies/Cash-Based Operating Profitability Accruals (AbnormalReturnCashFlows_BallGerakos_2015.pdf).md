# Accruals, Cash Flows, and Operating Profitability — Ball, Gerakos, Linnainmaa & Nikolaev (2015) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Accruals, Cash Flows, and Operating Profitability in the Cross Section of Stock Returns |
| **Authors** | Ray Ball; Joseph Gerakos; Juhani T. Linnainmaa (Booth & NBER); Valeri Nikolaev — University of Chicago Booth School of Business |
| **Date / ID** | April 17, 2015; Working Paper No. 15-12; SSRN abstract **2587199** |
| **JEL** | G11, G12, M41 |
| **Keywords** | Operating profitability; Accruals; Cash flows; Anomalies; Asset pricing |
| **Sample** | CRSP∩Compustat, NYSE/Amex/NASDAQ ordinary commons; **July 1963 – December 2013**; exclude 1-digit SIC 6 financials; accounting lag 6 months |
| **Original PDF** | `AbnormalReturnCashFlows_BallGerakos_2015.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsSVFYV01tLXNyN2M` |
| **Extraction** | Google Drive `read_file` full text (~2,200 lines). Platform `download_file` not available in this subagent; no OCR issues on this PDF. |

Corresponding: Ray.Ball@ChicagoBooth.edu. Ball: Harbor Funds trustee (personal views). No author financial interest. Comments: Easton, Fama.

---

## Problem / Motivation

Profitability positively predicts returns (Novy-Marx 2013; Ball–Gerakos–Linnainmaa–Nikolaev 2014), yet profitability embeds **accruals**. Sloan (1996) shows high accruals predict *low* returns. The accrual anomaly is not explained by FF3, FF5, Novy-Marx GP, or Hou–Xue–Zhang *q*.

This paper’s three claims: (1) **cash-based operating profitability (CbOP)** beats OP, GP, and NI; (2) CbOP **subsumes** accruals; (3) CbOP forecasts returns out to **ten years**, inconsistent with short-lived earnings mispricing.

Quant punchline: adding **only** a CbOP factor to {MKT, SMB, HML, MOM} raises the ex post max Sharpe **more** than adding **both** accruals and accrual-inclusive profitability factors.

Identification analogy to Fama–French (1992): FM slopes on OP and accruals have opposite signs and similar magnitudes, so an OP increase financed purely by accruals nets ~0 expected-return impact—the cash residual is what is priced.

Sloan’s story (investors miss lower accrual persistence) fails a conditional test: if true, accruals should still predict returns given cash profitability. They do not.

---

## Setup / Data

**Returns/accounts.** CRSP monthly; Compustat annual. Delisting: CRSP; missing performance delistings → **−30%**. Match with **6-month lag**. Require ME, B/M, gross profit, AT, current return, prior-year return. Drop financials.

**Operating profitability (OP)** (Ball et al. 2014):
$$\mathrm{OP}_{t}=\frac{\mathrm{Sales}_{t}-\mathrm{COGS}_{t}-\mathrm{SG\&A}_{t}}{\mathrm{AT}_{t-1}}.$$

**CbOP:** OP minus accrual components in OP (ΔAR, Δinventory, Δprepaid, Δdeferred revenue, ΔAP, Δaccrued expenses). Not equal to earnings+D&A, nor GAAP CFO (which is after interest/tax).

**Accruals:** Sloan-style balance-sheet accruals for 1963–; Hribar–Collins CF-statement accruals for ≥1988 robustness.

**Book equity:** SHE + deferred taxes + ITC + PRB − preferred (redemption/liquidation/carrying); DFF fill-ins.

**FM controls:** $\ln(B/M)$, $\ln(ME)$, $r_{t-1}$, $r_{t-12:-2}$. Microcaps: below NYSE 20th %ile ME. June annual rebalance. Trim RHS 1/99, table-consistent.

**Table 1.** Mean OP ≈ **13%** of AT; accruals ≈ **−2.8%**; CbOP ≈ **11.7%**. Correlations: OP–CbOP 0.844/0.804; accruals–OP +0.165/+0.132; accruals–CbOP **−0.253/−0.280**.

---

## Model / Methods

**Fama–MacBeth.** Slopes ×100 = monthly returns on orthogonalized characteristic portfolios (Fama 1976 Ch.9). $t \approx SR_{ann}\sqrt{T}$.

**Portfolios.** VW quintiles/deciles; FF3 α as the “pure bet” after hedging MKT/SMB/HML.

**Two-way sorts.** Conditional accrual quintiles within OP or CbOP deciles; average across first sort for neutral accrual hedge.

**Factors.** FF (2015) 2×3: size × (OP or CbOP) at NYSE 30/70 → $\mathrm{RMW}^{OP}$, $\mathrm{RMW}^{CbOP}$. Accruals factor analogously (low−high). SMB averaged across B/M and profitability size splits.

**Diagnostics on 25 size×accruals:** GRS, $A|\hat\alpha|$, $A(|a_i|)/A(|\bar r_i|)$, $A(\hat\alpha^2)/A(\hat\mu^2)$, $A(R^2)$.

**Tangency SRs** for nested opportunity sets.

**Horizons:** FM on lagged signals every 6 months to 10 years; bootstrap Sharpe gaps (1,000 draws).

---

## Results with Numbers

### Table 2 FM (All-but-microcaps)

| Column | Regressors | Key *t* |
|--------|------------|---------|
| (1) | OP (Ball 2014 trim) | OP **8.97** |
| (2) | OP common sample | OP **6.97** |
| (3) | Accruals | **−4.4** |
| (4) | OP+Accruals | both \|*t*\| **rise** |
| (5) | CbOP | **9.84** |
| (6) | CbOP+Accruals | CbOP **7.4**, Acc **0.02** |
| (7) | OP vs CbOP | OP **1.19**, CbOP **5.83** |

OP→CbOP raises strategy Sharpe **>40%** (diff *t*=**4.91**). Microcaps: OP 5.24; Acc −6.41; joint 5.78/−8.43; CbOP **9.5**; Sharpe gain **0.65** (*t*=3.29).

Figure 1: 10y rolling *t*—CbOP > OP generally; accruals negative until ~2008; post-2004 fade shared with momentum.

### Table 3 (CF-statement accruals, post-1988)
Same ranking; lower *t* from shorter *T*; CbOP still subsumes accruals.

### Table 4 VW sorts (1963:07–2013:12)

| Signal | Q H−L FF3 α | *t* | D H−L FF3 α | *t* |
|--------|-------------|-----|-------------|-----|
| OP | +56 bp | 5.81 | +75 bp | 5.99 |
| Accruals | −29 bp | −3.0 | −43 bp | −3.25 |
| CbOP | **+72 bp** | **8.21** | **+90 bp** | **8.5** |

### Table 5 two-way
OP-neutral accrual α **−31 bp** (*t*=−3.62). CbOP-neutral accrual α **−4 bp** (*t*=−0.42).

### Table 6 pricing 25 size×accruals
FF3+RMW^OP **worse** than FF3 (GRS 4.06 vs 3.59; $A|\alpha|$ 0.156 vs 0.115; unexplained disp. 96% vs 71%; var 91% vs 46%). FF3+RMW^CbOP improves intercepts; high-accrual α *t*s insignificant. $A(R^2)$≈90% all models. Benchmark: FF3 on 25 size–B/M GRS **3.52**.

### Table 7 Sharpes
Market 0.39; four-factor **1.07**; +Acc **1.13**; +RMW^OP **1.40**; +RMW^CbOP **1.70**; +CbOP+Acc **1.72**; +OP+Acc **1.58** (< CbOP alone). Factor means: Acc 2.9% (*t* 3.65); OP 3.53% (3.97); CbOP **4.82%** (6.3).

Figure 2 (\$1 from 1963:06): OP \$71.5; Acc \$9.8; CbOP **\$191.9**; MKT excess \$11.0.

### Horizons (Fig 3–4)
OP & CbOP significant to **10y**; accruals ~1y only. CbOP−OP Sharpe gap CI>0 to ~4y. Cumulative monthly slopes ~0.5 over 2y ⇒ 10% CbOP gap → ~5% 2y cumulative return.

---

## Limitations

Balance-sheet accrual noise (M&A); post-1988 CF robustness shortens sample. Ex post tangency overstates net SR. Post-2004 attenuation (crowding/structural). Accruals still useful for contracting, not E[r]. Working-paper vintage—confirm against JFE published tables. Drive text extraction lossy on layout—spot-check digits. Microcap capacity limits.

---

## Practical Takeaways for a Quant Investor

1. Replace GP/OP/NI with **CbOP** in US equity multi-factor.
2. Drop standalone accrual sleeve once CbOP is live (SR 1.70→1.72).
3. Prefer RMW^CbOP over FF5 RMW if you must price accrual portfolios.
4. Annual June rebalance; multi-year horizon signal—low turnover.
5. Live monitor: 10y rolling FM *t* (Fig 1); de-risk when *t*→0 with momentum.
6. Exclude financials; 6m lag; NYSE breaks; VW for capacity; −30% delist rule.
7. Prefer CF-statement accruals when building CbOP post-1988.
8. Industry-relative CbOP for long-only constrained books (extension).

---

## Extended Economics: Opposite Slopes

When $b_{OP}\approx -c_{Acc}$ in FM, a shock raising OP one-for-one with accruals implies $\Delta E[r]\approx 0$. CbOP = OP − Acc_OP isolates priced cash variation—the accounting analogue of collapsing two leverages into B/M (FF 1992).

Column (4)’s rising \|*t*\| is omitted-variable bias with opposing loadings; column (6)’s accrual collapse is the fingerprint that cash is the priced piece.

## Relation to Desai / Cheng–Thomas / Foerster

Desai et al.: accruals as value via CFO/P. Cheng–Thomas: abnormal accruals incremental to CFO/P. This paper controls B/M and still subsumes accruals with **unlevered cash OP**—not value in disguise. Foerster et al. stress FCF; here the object is operating cash profitability linked explicitly to Sloan.

## Tangency Arithmetic

Four-factor SR 1.07 → +Acc +0.06 → +OP +0.33 → +CbOP **+0.63**. Marginal CbOP ≈ 10× Acc and ~2× OP. Joint OP+Acc = 1.58 < 1.70: six-portfolio map **destroys** information CbOP preserves as a characteristic.

## Implementation Pitfalls

Wrong accrual subset vs OP; deflate by contemporaneous AT; include banks; monthly rebalance of annual data; skip delisting imputation; confuse CbOP with CFO or FCFF; use equal-weight α for capacity sizing.

## Replication Checklist

CRSP+Compustat; Shumway −30%; DFF BE; OP & CbOP per Appendix; 6m lag; June 30 VW; FM trim 1/99; NYSE 30/70 factors; report All-but-micro + Micro FM; bootstrap Sharpe diffs; GRS on 25 size×accruals.

## Sector / Risk-Model Notes

No industry adjustment in baseline. For Barra-like models, swap earnings-yield/ROE with CbOP to cut residual in accrual books. Expect high marginal IR vs MKT/SMB/HML/MOM (Table 7).

## Falsification

Accruals significant | CbOP would revive Sloan persistence mispricing—rejected. CbOP dead after 24m would fit overreaction—rejected by 10y results.

## Quality Nest

AFP quality, Novy-Marx GP, Ball OP, CbOP: move to the **cash end**. Composites mixing “low accruals” with “high profit” either double-count CbOP or inefficiently mix opposing signs—Table 7’s lesson.

## Path Dependence & Crowding

\$191.9 terminal wealth includes pre-fade decades. Sizing on full-sample SR in 2005 would disappoint. Use expanding/rolling FM *t* as health check.

## Statistical Power

*T*≈606 months. Decile α *t*=8.5 implies large α and/or low residual vol. Bootstrap addresses correlated-strategy Sharpe comparison; uplift *t*=4.91 survives.

## Library Indexing

Tags: `profitability`, `accruals`, `CbOP`, `Fama-MacBeth`, `RMW`, `Sharpe`, `subsumption`, `1963-2013`, `US`. Related: Sloan 1996; Ball et al. 2014; Novy-Marx 2013; FF 2015; Hirshleifer et al. 2004 NOA.

## Monthly α to Annual IR Sketch

90 bp/month × 12 = 10.8%/year FF3 α on VW decile H−L. If long–short residual vol ~10–12% ann., IR ~0.9–1.1 before costs—exceptional for an annual fundamental signal. Haircut for IS bias, costs, and post-2004 fade before allocating risk budget.

## Why Accrual-Inclusive RMW Worsens Accrual Pricing

Accruals and OP are positively correlated, but return loadings oppose. A factor long high OP therefore **partially longs high accruals**, leaving a more severe short-accrual residual anomaly—exactly Table 2(4) and Table 6 Panel C. Purging accruals from the profitability leg removes that contamination.

## Cash Timing, Growth, and Payment Shocks

Section 2: accruals absorb payment shocks and WC investment for growth. CbOP retains payment-shock and growth-cash information that OP smooths away. That retained variation appears to be return-relevant—possibly risk (cash needs, distress) or continued mispricing of cash vs accruals. Ten-year persistence leans toward risk/slow expected-return determinants over pure announcement errors.

## Bottom Line

The accrual anomaly and the profitability premium are one object: **cash operating profitability**. Trade CbOP; do not pay for a separate accrual factor once CbOP is in the opportunity set. Expected SR contribution exceeds adding OP and accruals jointly, with cleaner economics and long-horizon stability.


## Section-by-Section Empirical Walkthrough

### Fama–MacBeth columns as orthogonal portfolios
Each average slope is the mean return on a portfolio that is long the part of the characteristic orthogonal to all other regressors in that month’s cross-section (Fama 1976). Therefore comparing *t*-statistics across columns is comparing Sharpes of well-defined self-financing strategies. When column (5)’s CbOP *t*=9.84 exceeds column (2)’s OP *t*=6.97, the investor who could only trade one orthogonalized signal would strictly prefer CbOP. The bootstrap test that the implied Sharpe difference is positive (*t*=4.91) is the formal statement of that preference.

### Why joint OP+accruals inflate both t-stats
OP and accruals are positively correlated (+0.165 Pearson). Their return loadings have opposite signs. Omitting one biases the other’s slope toward zero (classical attenuation from correlated omitted variables with opposite effects). Including both removes the bias and \|*t*\| rises—exactly column (4). This is also why FF5’s RMW (accrual-inclusive profitability) worsens pricing of accrual-sorted portfolios: the profitability factor is contaminated with accrual exposure of the wrong sign relative to the anomaly.

### Portfolio sort vs FM consistency
Table 4’s VW decile FF3 α of 90 bp/month (*t*=8.5) for CbOP and −43 bp (*t*=−3.25) for accruals line up in ranking with FM *t*-stats. The two-way sorts in Table 5 are the nonparametric analogue of columns (4) and (6): OP-neutral accrual hedge remains −31 bp; CbOP-neutral accrual hedge dies at −4 bp. For a desk that distrusts FM linearity and winsorization, Table 5 is the decision-relevant exhibit.

### Factor spanning and GRS
GRS rejects all models for 25 size×accruals portfolios, but that is not the right bar—FF3 is also rejected for 25 size–B/M (GRS 3.52). The relevant comparison is relative: RMW^CbOP brings the accrual panel in line with how well FF3 fits value, whereas RMW^OP makes things worse. Average R²≈90% shows common factor covariance is fine; discrimination is all in intercepts.

### Opportunity-set math for CIOs
Moving from four-factor SR 1.07 to 1.70 by adding RMW^CbOP is an enormous expansion of the efficient frontier. The near-zero incremental value of accruals once CbOP is present (1.70→1.72) should end arguments about running a separate accrual book “for diversification.” Diversification was already harvested inside CbOP.

### Horizon evidence and mispricing vs risk
Figure 3’s ten-year predictive power for CbOP and OP, with accruals dying after ~1 year, is the paper’s sharpest knife against announcement-window mispricing. Limits to arbitrage and attention gaps do not plausibly last a decade; expected-return determinants (cash productivity, risk) can. Panel E’s Sharpe-gap confidence interval above zero for four years says a multi-year investor should still prefer CbOP to OP even after signal staleness.

### Cumulative wealth realism
Figure 2’s \$191.9 vs \$11 is an in-sample compounded α+residual path from decile H−L regressions—not a live NAV. Haircuts: (i) IS tangency and α estimation; (ii) trading costs on annual rebalance; (iii) short-leg locate; (iv) post-2004 fade. Even with a 50% haircut, CbOP remains first-tier among accounting anomalies.

### Microcaps
Panel B shows the same subsumption in microcaps with even larger accrual *t* (−6.41 standalone, −8.43 with OP). Capacity-constrained managers should not dismiss the anomaly as micro-only: All-but-microcaps deliver CbOP *t*=9.84 and VW portfolio αs that under-weight micros by construction.


## Detailed Construction Algorithm for Production

1. **Universe each June:** CRSP shares codes 10/11; exchanges NYSE/Amex/NASDAQ; drop SIC 6000–6999; require ME, BE, AT, Sale, COGS, XSGA (treat missing XSGA per paper Appendix), and WC balance-sheet items used in accruals.
2. **Delisting:** merge CRSP dlret; if missing and dlstcd in performance-related set, set −30%.
3. **OP:** (Sale − COGS − XSGA)/AT_{t−1}. Confirm SG&A treatment matches Ball et al. (2014) (sometimes COGS already includes items).
4. **Accrual components in OP:** compute ΔRECT, ΔINVT, ΔXPP, ΔDRC/ΔDRLT, ΔAP, ΔXACC (item names illustrative—use paper Appendix).
5. **CbOP:** OP − signed accrual components (signs per Appendix).
6. **Accruals (Sloan BS):** standard WC accrual formula for anomaly comparisons.
7. **Lag:** assign year-t fundamentals to returns from July t+1 through June t+2.
8. **FM monthly:** regress month *m* returns on latest lagged characteristics + controls; winsorize predictors 1/99 within the estimation sample used for that table.
9. **Factors:** each June, NYSE median ME; NYSE 30th/70th CbOP; six VW portfolios; RMW = average robust − average weak; SMB blend.
10. **QA:** replicate Table 1 means (OP~13%, Acc~−2.8%, CbOP~11.7%) and Table 4 decile α *t*≈8.5 before trusting a new implementation.

## Risk Management Overlay

- **Beta:** CbOP long–short often has nontrivial factor loadings; trade with MKT/SMB/HML hedges if the mandate is market-neutral.
- **Crowding gauge:** rolling 10y FM *t* on CbOP (Figure 1). Below ~2 for several years → cut risk budget.
- **Event exposure:** BS accruals spike in M&A years—optional screen dropping |ΔAT| or acquisition flags >10% AT (compare Hirshleifer et al. NOA robustness).
- **Correlation to quality:** expect high correlation with composite quality; optimize jointly to avoid oversize.

## Comparison Table for Factor Selection Committees

| Candidate | FM *t* (All-but-micro) | VW decile FF3 α | Subsumes accruals? | 10y horizon? | Four-factor + factor SR |
|-----------|----------------------|-----------------|--------------------|--------------|-------------------------|
| Accruals | −4.4 | −43 bp | n/a | No (~1y) | 1.13 |
| OP | 6.97 | +75 bp | No | Yes | 1.40 |
| CbOP | **9.84** | **+90 bp** | **Yes** | **Yes** | **1.70** |

## Author Intent vs Practitioner Use

Authors argue against Sloan’s differential-persistence behavioral story as the *primary* driver once cash profitability is controlled. Practitioners need not resolve the risk vs mispricing debate to use the signal: the return prediction is robust, long-lived, and improves MV efficiency. If mispricing, expect partial decay with popularity (already visible post-2004). If risk, expect persistence but possible drawdowns when cash-poor firms outperform in recoveries.

## Links to NOA / Balance-Sheet Bloat

Hirshleifer–Hou–Teoh–Zhang (2004) NOA is cumulative earnings−FCF. CbOP is a *flow* cash operating measure. Both say “cash vs accruals matters.” NOA is stock/cumulative and predicts years ahead via sustainability; CbOP is a cleaned profitability flow that subsumes the accrual *flow* anomaly. A combined research agenda: orthogonalize CbOP to ΔNOA / NOA and test incremental IR.

## Closing Checklist for Scholar Library

- [x] Bibliographic identifiers and Drive id
- [x] Sample filters and dates
- [x] Formulas for OP/CbOP
- [x] Table 2–7 key numbers and *t*-stats
- [x] Sharpe opportunity-set results
- [x] Horizon evidence
- [x] Implementation algorithm
- [x] Limitations and crowding
- [x] Related papers for graph linking


## Additional Quantitative Notes from End Matter

The paper emphasizes that cash-based operating profitability contains information about profitability, payment shocks, and growth jointly—because removing accruals re-introduces timing variation that accrual accounting removed. That re-introduced variation is precisely what lines up with expected returns. From a forecasting perspective, the sum of monthly FM slopes over a two-year window on the order of 0.5 (as discussed in the long-horizon section) means a standardized CbOP difference of 10 percentage points of assets maps into roughly 5 percentage points of cumulative return over two years before controls’ dynamics are considered. That elasticity is large relative to typical accounting-anomaly payoffs.

When constructing the accruals factor for Table 7, the authors use low-minus-high accruals with the same 2×3 size intersect as profitability factors, and they are careful about which SMB goes into which model (average of B/M-based and characteristic-based SMBs). Replicators who casually use Ken French’s SMB with a homemade RMW will misstate alphas. Follow the paper’s SMB blending rule when claiming to match Table 6–7.

The cumulative return chart’s methodology—compounding alphas plus residuals from Table 4 H−L decile regressions—means the path is the return of a strategy that each month earns the FF3 α plus the residual not spanned by MKT/SMB/HML. It is closer to an “alpha wealth index” than to raw H−L excess returns. CIOs comparing to a market excess index (\$11) should remember the market line is excess return compounded, while strategy lines are α+e compounded; still, the ordering OP < market-ish < CbOP is informative.

On the accrual anomaly literature cited (Fama–French 2006, Hirshleifer–Hou–Teoh 2009, Polk–Sapienza, Hirshleifer–Jiang, Li–Zhang, Hirshleifer–Teoh–Yu, Lewellen 2011, Stambaugh–Yu–Yuan, Avramov et al., Novy-Marx, Hou–Xue–Zhang, FF 2015): the contribution here is not another demonstration that accruals work, but that they are **nested** by cash operating profitability. That nesting claim is stronger than “both are significant” and should change how research catalogs list anomalies.

For international extension (not in paper): expect CbOP to travel better than BS accruals where accounting standards differ in WC definitions, but verify CF-statement availability. Emerging markets with weak accrual accounting may show smaller OP−CbOP gaps.

Training note for junior quants: do not test “cash flow” as earnings+depreciation and claim to refute this paper—that measure still embeds accruals and is not CbOP.


## Paleologo-Style Synthesis Paragraphs

If you maintain a stacked anomaly book, replace the accrual sleeve and the standard profitability sleeve with a single CbOP sleeve, then re-optimize against MKT/SMB/HML/MOM. The paper’s Table 7 is literally that experiment in frictionless form. The SR gap between 1.58 (OP+Acc) and 1.70 (CbOP) is the cost of using the wrong basis for the same accounting information.

If your process is long-only constrained, implement CbOP as a rank score within industries, neutralize β and size, and expect a smaller but still positive IR. The VW evidence says the signal is not only a microcap artifact. The 3–4 year Sharpe-gap confidence interval vs OP says patience is required; this is not a quarterly rebalancing alpha.

If you sell a multi-factor risk model to clients, add a CbOP factor and test whether accrual-factor loadings collapse. Table 6 Panel D says they should. Clients running accrual strategies will otherwise double-count.

If you are skeptical of anomalies post-publication, Figure 1 is your friend: the fade is real and coincides with momentum’s fade. Position as a modest risk-budget line item with a kill switch on rolling *t*, not as a 1990s-sized allocation.

The deep accounting point—accruals exist to improve performance measurement for contracting—remains intact. The asset-pricing point is different: the market’s expected-return kernel cares about cash operating outcomes more than accrual-smoothed ones. Those two statements are compatible.


## Expanded Numerical Commentary on Every Major Exhibit

Table 1’s mean operating profitability of roughly thirteen percent of assets, combined with mean accruals of minus two point eight percent, produces mean cash-based operating profitability near eleven point seven percent. The gap between OP and CbOP at the mean is therefore about one point three percentage points of assets, but the economically important object is the cross-sectional distribution: the negative correlation between accruals and CbOP (Pearson minus zero point two five three) implies that firms scoring well on accrual-inflated profitability systematically score poorly on cash profitability. That is the statistical seed of subsumption.

In All-but-microcaps Fama–MacBeth regressions, the stand-alone operating profitability t-statistic of six point nine seven corresponds to a powerful but incomplete signal. Accruals alone deliver a t-statistic of minus four point four, confirming Sloan. Entered jointly, both strengthen, which is the opposite of what you would expect if they were proxies for the same latent factor with the same sign. Cash-based operating profitability alone jumps to nine point eight four. With accruals, cash-based operating profitability remains at seven point four while accruals collapse to zero point zero two. The horse race leaves operating profitability at one point one nine and cash-based operating profitability at five point eight three. These six numbers are the core empirical claim of the paper; everything else is robustness and economic translation.

Microcaps repeat the pattern with even starker accrual t-statistics (minus six point four one alone, minus eight point four three with operating profitability) and cash-based operating profitability at nine point five. The bootstrap Sharpe gain of zero point six five (t equals three point two nine) from switching microcap profitability definitions shows the improvement is not an All-but-micro curiosity.

Value-weighted portfolio sorts translate the regression evidence into implementable books. Operating profitability’s high-minus-low decile three-factor alpha of seventy-five basis points per month (t equals five point nine nine) is already large. Accruals contribute minus forty-three basis points (t equals minus three point two five). Cash-based operating profitability reaches ninety basis points (t equals eight point five). Annualized, ninety basis points monthly is ten point eight percent of three-factor alpha before costs—an extraordinary figure for an annually refreshed accounting signal.

Two-way sorts settle the nesting debate without relying on linear FM assumptions. Sorting first on operating profitability and then on accruals leaves a profitability-neutral accrual alpha of minus thirty-one basis points (t equals minus three point six two). Sorting first on cash-based operating profitability leaves minus four basis points (t equals minus zero point four two). An allocator who already runs cash-based operating profitability does not need a separate accrual overlay.

On the twenty-five size-by-accruals portfolios, augmenting the three-factor model with an operating-profitability RMW factor increases the GRS statistic from three point five nine to four point zero six and raises average absolute alpha from zero point one one five to zero point one five six. The fraction of cross-sectional expected-return dispersion left unexplained rises from seventy-one percent to ninety-six percent. Replacing that factor with cash-based operating profitability RMW reverses the damage and brings high-accrual alphas below conventional significance. Average R-squared near ninety percent across models shows that the models agree on covariances; they disagree on intercepts.

Ex post maximum Sharpe ratios make the CIO case. The market alone offers zero point three nine. The traditional four factors reach one point zero seven. Accruals add only six hundredths. Operating profitability adds thirty-three hundredths to one point four zero. Cash-based operating profitability adds sixty-three hundredths to one point seven zero. Adding accruals on top of cash-based operating profitability adds a trivial two hundredths. Adding operating profitability and accruals together reaches only one point five eight—twelve hundredths short of cash-based operating profitability alone. That shortfall is the quantitative proof that the six-portfolio factor construction loses information relative to the cash-based characteristic.

Average annualized factor returns reinforce the ranking: accruals two point nine percent (t equals three point six five), operating profitability three point five three percent (t equals three point nine seven), cash-based operating profitability four point eight two percent (t equals six point three). Cumulative wealth paths from June nineteen sixty-three to December twenty thirteen turn one dollar into seventy-one point five dollars for operating profitability, nine point eight for accruals, one hundred ninety-one point nine for cash-based operating profitability, and eleven for market excess—ordering that matches the Sharpe ranking.

Long-horizon Fama–MacBeth slopes show operating profitability and cash-based operating profitability remaining positive for ten years, while accruals fade after about one year. Differences in Sharpe ratios between cash-based and standard operating profitability stay significantly positive for about four years. The sum of monthly slopes over two years near one half implies that a ten-percentage-point gap in cash-based operating profitability maps into roughly five percentage points of cumulative return over two years. That elasticity, combined with decade-long predictability, is difficult to reconcile with short-horizon earnings-fixation stories and easier to reconcile with persistent expected-return differences tied to cash productivity.

Rolling ten-year t-statistics warn that the post-two thousand four decade attenuated cash-based operating profitability, accruals, and momentum together. Live implementations should treat rolling t-statistics as a risk-budget input, not ignore the full-sample t-statistic of nine point eight four as if it were a constant of nature.

Taken together, the exhibits say: redefine profitability as cash-based operating profitability; drop the separate accrual factor; prefer cash-based RMW in empirical asset-pricing models; rebalance annually; monitor crowding; and expect the largest gains relative to standard four-factor portfolios among the accounting styles tested in this working paper.


## Practitioner FAQ

**Q: Is CbOP just CFO / Assets?**
A: No. GAAP CFO is after interest and taxes and includes items outside the operating profitability perimeter. CbOP starts from OP (sales − COGS − SG&A) and removes only the WC accrual components inside that perimeter, then scales by lagged assets.

**Q: Can I use earnings + depreciation?**
A: That measure still embeds accruals. It will not replicate Table 2 column (5)–(7).

**Q: Does this kill the accrual anomaly?**
A: It nests it. Accruals remain useful descriptively and for earnings-quality analysis, but they do not add expected-return forecast power once CbOP is controlled.

**Q: Long-only?**
A: Use CbOP ranks within industry, neutralize major risk factors, and size by liquidity. Expect lower IR than the VW H−L academic portfolio but still positive based on the distribution of alphas across deciles (not only extremes).

**Q: International?**
A: Out of scope for this paper. Prioritize markets with clean WC disclosure and CF statements.

**Q: How does this relate to FF5?**
A: FF5 RMW uses accrual-inclusive operating profitability. This paper says that choice worsens accrual portfolio pricing. A cash-based RMW is the consistent repair.

**Q: Turnover?**
A: Annual. Signal persistence is multi-year.

**Q: What killed performance after 2004?**
A: Unknown—crowding, regime change, or power. Same pattern hits momentum. Use rolling tests.

## Extended Limitation Discussion

Beyond the bullet list above, note that winsorization and trimming choices can move FM t-statistics by meaningful amounts; the authors’ table-consistent trimming is best practice. Value-weighting hides microcap contribution in portfolio tests, which is desirable for capacity but means EW academic results elsewhere in the literature are not comparable without adjustment. The −30% delisting rule matters disproportionately for the short legs of accrual and weak-profitability strategies; omitting it inflates paper alphas relative to live short books. Finally, the working-paper draft may differ slightly from the eventual journal version in sample end date or variable definitions—always pin the replication to a specific DOI when moving to production.


## Mapping to a Modern Quant Stack

In a typical 2020s equity platform one would: (1) land fundamentals in a point-in-time database with restatement handling; (2) compute OP and CbOP with PIT identifiers; (3) apply exchange-specific breakpoints; (4) feed CbOP into a cross-sectional forecast combiner (see Lewellen 2015 FM composite forecasts); (5) optimize with transaction costs and risk model constraints; (6) attribute PnL to a CbOP factor mimicking portfolio built à la Table 7. The academic H−L decile is a research diagnostic, not the production portfolio.

Interaction with machine-learning return predictors: CbOP should be included as a candidate feature; if a nonlinear model loads heavily on raw accruals and OP separately, distill those features into CbOP to reduce collinearity and improve interpretability. Interaction with short-interest or institutional-ownership signals may improve the behavioral timing of any residual mispricing component without changing the baseline that CbOP is the right profitability definition.
