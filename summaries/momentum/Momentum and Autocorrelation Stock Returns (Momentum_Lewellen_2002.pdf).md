# Momentum and Autocorrelation in Stock Returns — Lewellen (2002) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Momentum and Autocorrelation in Stock Returns |
| **Author** | Jonathan Lewellen (MIT Sloan) |
| **Journal** | *The Review of Financial Studies*, Special 2002, Vol. 15, No. 2, pp. 533–563 |
| **Sample** | CRSP NYSE/AMEX/Nasdaq commons; **Jan 1941–Dec 1999** (ex-Depression); B/M and size-B/M from **May 1963–Dec 1999** (Compustat; 3 years accounting history required) |
| **Portfolios** | Individual stocks; **15 industries** (2-digit SIC); **5/10/15 size**; **5/10 B/M**; **9/16/25 size-B/M**; NYSE breakpoints; primarily **value-weighted** (EW also shown) |
| **Strategy** | Continuous weights $w_{i,t}=\frac{1}{N}(r^k_{i,t-1}-r^k_{m,t-1})$ rescaled to \$1 long / \$1 short; formation on **past 12-month** returns; holding months 1–18 |
| **Original PDF** | `Momentum_Lewellen_2002.pdf` |
| **Drive file_id** | `1C1UiVWc8JaKos6cPGJfwUyxZ8IpLUPOz` |
| **Extraction** | `pdftotext -layout`; clean (~14,733 words source). |

Thanks: French, Hong, Kaul, Richardson, Shanken, Warner, referee; seminars at GMO, MIT, NBER, Alberta, Rochester, SFS.

---

## Problem / Motivation

**Jegadeesh–Titman (1993):** past winners outperform past losers over 3–12 months. Classic figure: top vs bottom 12-month return decile earns **+6.8%** over subsequent six months (t=3.40), 1965–1989. Risk adjustment (CAPM/FF) tends to **accentuate** momentum (Fama–French 1996)—risk should fall after gains if anything, so rational risk stories struggle.

Literature (and behavioral models of Barberis–Shleifer–Vishny 1998, Daniel–Hirshleifer–Subrahmanyam 1998, Hong–Stein 1999) attributes momentum to **firm-specific** underreaction or delayed overreaction. **Moskowitz–Grinblatt (1999)** document industry momentum.

Lewellen shows:
1. **Size and B/M portfolios**—extremely well diversified—have momentum **as strong or stronger** than stocks/industries.
2. Industry, size, and B/M momentum are **mutually distinct** (benchmark-adjusted profits survive).
3. These portfolios are **negatively auto- and cross-serially correlated** at intermediate horizons; **lead-lag > own autocorrelation** creates momentum profits.
4. Preferred explanation: **excess covariance** (prices covary more than dividends), not portfolio-specific underreaction.

A coherent theory must explain why momentum appears in stocks **and** size quintiles but vanishes (or reverses) at the market level—existing behavioral models do not.

---

## Setup and Data

- **Universe:** all CRSP ordinary common equity; Compustat for B/M.
- **Exclusions:** pre-1941 (Depression; JT find momentum weak/negative 1927–1940). Including earlier data “does not alter conclusions.”
- **Industry definition:** 15 portfolios from 2-digit SIC (mostly consecutive codes; some exceptions).
- **Size:** ME previous month; NYSE percentile breakpoints.
- **B/M:** book equity prior fiscal year / ME prior month; book updated with **4-month** lag; require 3 years Compustat history (Kothari–Shanken–Sloan bias control).
- **Double sorts:** independent NYSE quartile/quintile breakpoints.

### Table 1 summary stats (VW monthly %)

**Industries (avg # firms ~65–601):** mean returns 0.99% (natural resources) to 1.39% (services); σ from 3.46% (utilities/telecom) to 6.08% (services). Avg industry N ≈ **231**.

**Size deciles:** small 1.48% (σ 6.78, N≈1557) → large 1.06% (σ 3.97, N≈139). Avg decile N ≈ **347**.

**16 size-B/M (1963–99):** means 0.92–1.59%; small-low σ 7.22; avg cell N ≈ **199** (most >63; many >100).

**Implication:** firm-specific noise is diversified away—macro factors drive these portfolio returns.

---

## Model / Methods

### Momentum portfolio weight
$$
w_{i,t}=\frac{1}{N}\big(r^k_{i,t-1}-r^k_{m,t-1}\big)
$$
with $k=12$ months, $m$ = equal-weighted index. Weights sum to 0; rescale to \$1 long/\$1 short.

**Why not deciles?** (i) works with 5–25 portfolios; (ii) Lo–MacKinlay (1990) link from profits to autocovariance structure.

### Lo–MacKinlay profit decomposition
With mean $\mu$ and autocovariance matrix $\Gamma$:
$$
\mathbb{E}[\pi_t]=\frac{1}{N}\mathrm{tr}(\Gamma)-\frac{1}{N^2}\mathbf{1}'\Gamma\mathbf{1}+\sigma^2_\mu
$$
Three sources: (1) positive own autocovariance; (2) negative cross-serial covariance; (3) cross-sectional dispersion in unconditional means $\sigma^2_\mu$.

Equivalent view with market-adjusted returns $s_{i,t}=r_{i,t}-r_{m,t}$:
$$
\mathbb{E}[\pi_t]=\frac{1}{N}\sum_i\mathrm{cov}(s_{i,t-1},s_{i,t})+\sigma^2_\mu
$$
So momentum ⇔ positive autocovariance of **asset-specific** returns—but that can arise from underreaction **or** excess covariance.

### Price components
$$
p_t=q_t+z_t,\quad q_t=\mu+q_{t-1}+\eta_t,\quad r_t=\mu+\eta_t+\Delta z_t
$$
($q$: permanent / dividend news; $z$: transitory / expected-return news.)

### Models generating momentum
1. **Constant expected returns:** $\mathbb{E}[\pi]=\sigma^2_\mu$ only (small).
2. **Underreaction:** $z_t=-\rho\eta_t-\rho^2\eta_{t-1}-\cdots$, $0<\rho<1$ → positive auto- and cross-serial cov proportional to $\Sigma=\mathrm{cov}(\eta)$; profits positive.
3. **Overreaction / excess covariance:** dividend shocks idiosyncratic ($\Sigma=\sigma^2_\eta I$) but investors treat news as partly common → temporary price component induces **negative** autocorrelations yet **momentum** via stronger negative cross-serial terms.
4. **Time-varying market risk premium:** common discount-rate shocks → excess return covariance vs dividends; same qualitative pattern.

---

## Results with Numbers

### Table 2 — Raw momentum profits (% per month, \$1 long/\$1 short), formation 12m

**Individual stocks (1941–99):** month 1: 0.500 (t=3.08); m3: 0.800 (5.03); m5: 0.451 (3.06); then fades; negative from m11. **First-6-month cumulative ≈ 3.55%** (t=4.02).

**15 industries VW:** m1 0.741 (6.62); 6m cum **3.04%** (t=4.75). EW: m1 1.005 (8.76); 6m cum **3.65%** (t=5.62). Significant ~7–9 months then contrarian.

**5 size VW:** m1 0.509 (4.65); profits stay positive through m17 (0.288, t=2.64). 6m cum **2.56%** (t=4.16). EW 6m **3.02%** (t=4.16).

**15 size VW:** similar; 6m strong; persists.

**5 B/M VW (1963–99):** m1 0.419 (3.22); 6m cum **2.14%**-ish pattern. EW much stronger: m1 0.822 (6.49); 6m **4.61%** (t=5.97).

**10 B/M EW:** m1 0.925 (7.08).

**9 size-B/M VW:** m1 0.807 (5.47); 6m cum **3.23%** (t=4.18). EW 6m **3.93%** (t=4.93).

**25 size-B/M VW:** m1 0.799 (5.60); similar pattern.

**Sharpe:** t / √T; t=4 ⇒ SR≈**0.15** full sample, **0.19** post-1963 (CRSP VW market SR ≈0.18 over 1941–99).

**Persistence contrast:** size/B/M momentum decays slowly (often significant to 18m); stock/industry show reversals after ~1 year.

### Table 3 — Benchmark-adjusted (same weights)

| Strategy | 6m-style message | Example stats |
|----------|------------------|---------------|
| Stocks industry-adj | Still strong | 6m cum **2.90%** (t=3.71) vs raw 3.55% |
| Stocks size-B/M-adj | Stronger | 6m cum **3.69%** (t=4.69) |
| Industries size-adj | Intact | VW m1 0.660 (6.37) |
| Size industry-adj | Intact / stronger t | VW 5-size m1 0.453 (4.72) |
| Size-B/M industry-adj | Intact | VW 25 m1 0.711 (6.41) |

**Conclusion:** firm, industry, and size-B/M momentum are **separate components**. Macro momentum is new relative to firm-specific narrative.

### Autocorrelation patterns (Section 3; annual→monthly)

Corr(industry annual return, return 2 months later) avg **−0.005**, declines to **−0.064** by month 10, then rises. Size/B/M similar, bottoming near **−0.070** by month 10–11. **Cross-serial correlations more negative than own autos** → momentum via lead-lag channel (Lo–MacKinlay term 2).

### Against portfolio-specific underreaction
- Size quintile 5 (largest, least “idiosyncratic”) is **not** the most negatively autocorrelated—second *closest to zero*.
- Large–small lead-lag too big for pure market-reversal story.
- **FF3 absorbs much serial correlation in size/B/M** (not industries)—consistent with common-factor / excess-covariance view for characteristic portfolios.

---

## Limitations

1. Does not fully explain **individual-stock** momentum mechanism.
2. Excess covariance vs underreaction under-identified from correlations alone—argument is economic plausibility + FF3 absorption.
3. B/M sample shorter (from 1963)—handicaps t-stats vs full-sample size/industry.
4. Continuous-weight strategy differs from JT deciles—magnitudes not directly comparable to 6.8%/6m decile gap.
5. Pre-1941 excluded; international evidence cited only via others (Asness–Liew–Stevens; Bhojraj–Swaminathan).
6. No transaction-cost / shorting-cost netting.

---

## Practical Takeaways for a Quant Investor

1. **Momentum is not only a stock-selection anomaly**—it is also a **macro / characteristic-portfolio** anomaly. Size and value *portfolios* trend.
2. Running momentum only on residuals after industry neutralization still leaves alpha (Table 3)—and vice versa; **stack** industry and residual-stock momentum.
3. **Negative portfolio autocorrelation with positive momentum** is not a contradiction—it flags **cross-serial / excess covariance** structure. Risk models that shrink correlations too hard may miss this.
4. Behavioral stories needing underreaction to *firm* news are incomplete for size/B/M momentum; prefer models with **discount-rate common shocks** or **contagious overreaction**.
5. Characteristic momentum **persists longer** (~18m) than stock momentum (~7–9m then reverse)—horizon calibration should differ by sleeve.
6. EW characteristic momentum >> VW for B/M—small/cheap names drive much of the premium; capacity and costs matter.
7. Sharpe of simple characteristic momentum comparable to market (SR~0.15–0.19)—meaningful as standalone sleeve.
8. FF3 may “explain” serial correlation of size/B/M without eliminating industry momentum—**industry momentum needs its own factor**.

---

## Equations Quick Reference

$$
w_{i,t}=\frac{1}{N}(r_{i,t-1}-r_{m,t-1}),\quad
\mathbb{E}[\pi]=\frac{\mathrm{tr}(\Gamma)}{N}-\frac{\mathbf{1}'\Gamma\mathbf{1}}{N^2}+\sigma^2_\mu
$$

$$
p=q+z,\quad r=\mu+\eta+\Delta z
$$

Underreaction autocovariance: $\mathrm{cov}(r_t,r_{t-1})=\rho\frac{1-\rho}{1+\rho}\Sigma$.

---

## Extended Discussion: Why Excess Covariance Fits

If investors over-infer commonality from firm-specific news, a good return on stock i raises j’s price too much; subsequent correction makes corr$(r_{i,t}, r_{j,t+1})$ negative. Own series also mean-revert (negative auto). Momentum long the past relative winner still wins because **others** are predicted to do worse (cross term dominates). Time-varying equity premium produces analogous excess comovement via discount rates (Campbell 1991 news decomposition).

Portfolio-specific underreaction would predict: more idiosyncratic portfolios → more positive auto; largest stocks → strongest negative auto from macro overreaction. Data reject that ordering.

## Replication Checklist

1. Build VW industry/size/B/M portfolios monthly 1941–99 (B/M from 1963).
2. Compute 12m formation excess vs EW market; assign continuous weights; rescale.
3. Track returns months 1..18; Newey–West or JT overlapping t-stats for cumulatives.
4. Repeat with industry-/size-/B/M-adjusted stock returns.
5. Estimate corr(12m portfolio return, future monthly returns) and cross-serial matrix; compare diagonal vs off-diagonal.
6. Regress portfolio returns on FF3; inspect residual autos.

## Numerical Summary Box

| Object | Number |
|--------|--------|
| Stock 6m cum momentum | 3.55% (t=4.02) |
| Industry VW 6m cum | 3.04% (t=4.75) |
| Size5 VW 6m cum | 2.56% (t=4.16) |
| BM10 VW / EW 6m | ~2.14% / 4.61% |
| 25 size-B/M VW 6m | 3.23% (t=4.18) |
| Auto corr trough (ann→m10) | ≈ −0.06 to −0.07 |
| Implied SR at t=4 | 0.15–0.19 |
| Avg stocks/size decile | ~347 |

## Closing Synthesis

Lewellen (2002 RFS) reframes momentum as a **multi-layer** phenomenon: stocks, industries, and especially diversified size/B/M portfolios all trend, separately. Combined with **negative** auto- and cross-serial correlations, the evidence favors **excess covariance** over simple firm-underreaction for the portfolio layer. For a quant: build momentum at multiple layers, don’t over-interpret residual autocorrelation as “behavioral underreaction,” and allow characteristic portfolios to carry trend following with longer holding horizons than single-name momentum.


## Table 2 Month-by-Month Texture (Selected)

For implementation calendars, note the **odd-month** reporting pattern in Table 2. Individual stocks peak early (m3=0.80%) then flip negative by m11 (−0.33%, t=−2.61). Industries VW still positive at m7 (0.327%, t=3.07) but near zero by m11. Size portfolios remain positive at m17. This motivates **time-varying holding rules**: shorter for stock/industry sleeves, longer for size/value trend sleeves.

## Relation to Chordia–Shivakumar and International Momentum

Lewellen footnotes macroeconomic momentum relatives: Chordia–Shivakumar (2002) business-cycle expected-return variation; Asness–Liew–Stevens and Bhojraj–Swaminathan international index momentum. His contribution is domestic characteristic portfolios with autocovariance anatomy—not a horse race against macro predictors.

## Risk-Management Angle

Because size/B/M momentum is macro, stress it with **factor-crash** scenarios (momentum crash literature post-dates but is relevant): when market rebounds from distress, losers outperform winners violently. Excess-covariance view predicts synchronized portfolio reversals when discount-rate shocks flip.

## Word on Behavioral Models

BSV / DHS / HS were “motivated in part” by firm-specific interpretation. Lewellen does not claim they are false for stocks; he claims they are **incomplete** for the portfolio facts. A unified model needs mechanism that generates excess covariance among characteristics without requiring investors to underreact to size news while overreacting to market news—an awkward pairing.

## Gappy-Style Bottom Line

Momentum profits in well-diversified characteristic portfolios, negative intermediate-horizon autocorrelations, and stronger cross-serial than own effects jointly reject a pure firm-underreaction account for that layer. Build multi-layer momentum; diagnose with Lo–MacKinlay decompositions; treat excess covariance as a first-class modeling ingredient in return-forecast and risk systems.


---

---

## Autocorrelation Evidence in Detail (Tables 5–7)

### Table 5 — Slope of monthly return on lagged annual return

Estimates are **uniformly negative beyond month 1**. Month-1 anomalies reflect weekly lead-lag (Lo–MacKinlay 1990); JT (1995) argue weekly lead-lag has little effect on momentum profits.

**Size quintiles (avg slopes):** m1 +0.003; m3 −0.011; m5 −0.009; m7 −0.011; m9 −0.014; m11 −0.016; m13 −0.016; then less negative. Big stocks: m1 0.000, m9 −0.015, m11 −0.018, m13 −0.019—**not** the most negative, contradicting “most macro → most reversal” underreaction story. Wald tests significant early (χ² 27.0 at m1, 20.1 at m3).

**Industries avg:** m1 +0.004 → trough **−0.017 at m13** (near −0.016 at m11). Shipping most negative (m11 −0.028). Food/tobacco least mean-reverting early.

**Size-B/M avg (1963–99):** m1 −0.002; trough **−0.018 at m13**.

**Economic magnitude:** Annual σ ≈ 20–25%. Slope −0.01 ⇒ 2σ annual move ⇒ **40–50 bp** change in next month’s expected return. Cumulative slopes: size −0.043 (6m) / **−0.135 (12m)**; industry −0.023 / **−0.104**; size-B/M −0.044 / **−0.112**.

U-shape in autos vs steadily declining momentum profits: cross-serial structure, not own persistence, drives profits.

### Table 6 — Lo–MacKinlay decomposition (Auto / Cross / Means)

**Industry portfolios (selected months):**

| Month | Auto | Cross | Means | Total |
|-------|------|-------|-------|-------|
| 1 | 2.49 | 0.85 | 0.15 | 3.49 |
| 3 | −2.51 | **4.80** | 0.14 | 2.43 |
| 5 | −2.59 | 4.18 | 0.14 | 1.73 |
| 7 | −2.99 | 4.34 | 0.13 | 1.48 |
| 9 | −4.22 | 5.08 | 0.13 | 0.99 |
| 11 | −5.91 | 5.92 | 0.12 | 0.13 |
| 13 | −6.70 | 5.92 | 0.12 | −0.66 |

After m1, **Auto always reduces profits**; **Cross always positive and larger**—momentum survives despite negative autocorrelations. Means contribute only **0.11–0.15**—contradicts Conrad–Kaul (1998) claim that unconditional means dominate (their stock-level estimates are noisy; see JT 2001 critique).

**5 size:** similar Cross dominance (m3 Cross 5.11 vs Auto −3.99); totals stay positive longer.

**9 size-B/M:** m1 already Cross-dominated (2.72 vs Auto −0.09); totals positive through m17 region.

Bootstrap SEs smaller than LM asymptotic SEs; GARCH robustness changes SEs <5%. Small-sample bias ≈ −0.50 Auto / +0.41 Cross for industry/size; −0.77 / +0.66 for size-B/M—does not overturn signs.

### Table 7 — Market-adjusted returns

Market-adjusted returns (= portfolio − CRSP VW) are **positively autocorrelated**: avg **0.08** size, **0.06** B/M, **0.02** industry. Cross-serial patterns largely mirror contemporaneous correlations (Boudoukh–Richardson–Whitelaw 1994 restriction), but Section 3.1 argues lead-lag among size portfolios exceeds what market reversals alone imply.

### FF3 absorption
Fama–French three-factor model absorbs much serial correlation in **size and B/M** portfolios but **not industries**—industry momentum needs a separate factor layer; characteristic momentum partly reflects common-factor dynamics consistent with excess covariance via discount-rate news.

---

## Models of Excess Covariance (Section 2 detail)

**Overreaction model:** dividend shocks idiosyncratic $\mathrm{cov}(\eta)=\sigma^2_\eta I$, but investors believe news about i informs j. Temporary price component has positive off-diagonals → excess covariance. First-order autocovariance matrix has **negative diagonal and more negative off-diagonals** → own autos negative, cross-serial more negative → momentum profits positive via Cross term.

**Time-varying risk premium:** common expected-return shocks move all prices together beyond dividend covariance; same qualitative autocovariance pattern.

Both predict: negative autos, stronger negative cross-serial, persistent market-adjusted returns, momentum—matching Tables 2, 5, 6, 7.

---

## Implementation Notes for Multi-Layer Momentum

1. **Stock residual momentum:** neutralize industry and/or size-B/M; expect ~2.9–3.7% / 6m (Table 3).
2. **Industry momentum:** 12m formation, hold ~6–9m; cut before reversal year.
3. **Size/value portfolio trend:** hold longer (up to 18m); EW > VW especially for B/M.
4. **Diagnostics:** always run LM Auto/Cross/Means split; if Auto>0 and Cross≈0, underreaction story fits better; if Auto<0 and Cross>>0, excess covariance.
5. **Risk:** momentum crashes when Cross flips (synchronized loser rebound)—stress with market reversal scenarios.
6. **Do not** infer “underreaction” solely from positive autocovariance of market-adjusted returns—equation (7) identity.

## Closing Synthesis (expanded)

Lewellen (2002) establishes momentum as a **macro as well as micro** anomaly. Diversified size and B/M portfolios trend as strongly as stocks; industry, size, and B/M layers are distinct. Intermediate-horizon autocorrelations are negative; cross-serial correlations drive profits (Table 6). Excess covariance—whether from contagious overreaction or time-varying risk premia—fits better than portfolio-specific underreaction for the characteristic layer. Build multi-layer momentum with layer-specific horizons; diagnose with Lo–MacKinlay decompositions; incorporate excess covariance into both signal and risk systems.


---

## Source-Anchored Deep Dive (from extracted PDF text)

### Source-anchored note

> This article studies momentum in stock returns, focusing on the role of industry, size, and book-to-market (B/M) factors. Size and B/M portfolios exhibit momentum as strong as that in individual stocks and industries. The size and B/M portfolios are well diversiﬁed, so momentum cannot be attributed to ﬁrm- or industry-speciﬁc returns. Further, industry, size, and B/M portfolios are negatively autocorrelated and cross-serially correlated over intermediate horizons. The evidence suggests that stocks covary “too strongly” with

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> returns, contrary to the intuition that risk should actually decline. Empirically Jegadeesh and Titman ﬁnd that risk adjustment tends to accentuate rather than explain momentum [see also Fama and French (1996)]. This article further studies momentum in stock returns, focusing on the role of industry, size, and book-to-market (B/M) factors. The literature generally attributes momentum to ﬁrm-speciﬁc returns. It argues that investors either

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> vidual ﬁrms in their tests; they ﬁnd that the best-performing stocks in the I thank Ken French, Harrison Hong, Aditya Kaul, Matt Richardson, Jay Shanken, Jerry Warner, an anony- mous referee, and workshop participants at Grantham, Mayo, Van Otterloo & Co., MIT, NBER, Univer- sity of Alberta, University of Rochester, and the SFS Conference on Market Frictions and Behavioral Finance for helpful comments and suggestions. Address correspondence to Jonathan Lewellen, Department of Finance, Sloan School of Management, MIT, 50 Memorial Dr., E52-436, Cambridge, MA 02142, or e-mail:

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> or industries. Moreover, size and B/M momentum is distinct from industry momentum in that neither subsumes the other. These results are informative. They show, ﬁrst, that momentum is robust and pervasive. It shows up in stocks and many types of portfolios, typi- cally with very high signiﬁcance (t-statistics > 4 are common). More impor- tantly, the evidence shows that momentum cannot be attributed solely to

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> stocks and size quintiles, but vanishes at the market level (if anything, market returns show signs of reversals). Existing behavioral models do not explain The second set of tests focuses on the autocorrelation patterns in returns. It is well known that momentum is not the same as positive autocorrelation: momentum is a cross-sectional result (winners beat losers), while autocor- relation is a time-series phenomenon (a stock’s past and future returns are

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> Empirically I ﬁnd that lead-lag relations among stocks play an important role. The tests focus on industry, size, and B/M portfolios because auto- correlations are difﬁcult to estimate for individual stocks. All three sets of portfolios are negatively auto- and cross-serially correlated. To be speciﬁc, I estimate the correlation between annual returns and future monthly returns for up to 18 months in the future. From 1941 to 1999, the correlation between

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> together with negative autocorrelation, if investors underreact to portfolio- speciﬁc news but overreact to macroeconomic events. Second, I show that excess covariance among stocks could produce a similar result, where “excess covariance” means, loosely, that prices covary more strongly than dividends. I present two models to illustrate how excess covariance can generate momen- tum. In the ﬁrst model, investors mistakenly believe that news about one ﬁrm

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> momentum. Most simply, it seems unlikely that investors would underreact to size- or B/M-related news, but overreact to market news. I emphasize, again, that the size and B/M portfolios are quite broad—5, 10, or 15 port- folios. News about these portfolios, like news about the overall market, is appropriately deﬁned as macroeconomic. Thus a story in which investors react differently to idiosyncratic and macroeconomic news cannot explain

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> lag relations among large and small stocks are too large to be explained by market reversals. Finally, I show that the Fama and French (1993) three-factor model absorbs much of the serial correlation in size and B/M portfolios (but not industries). Overall the evidence suggests that excess covariance among portfolios explains industry, size, and B/M momentum. The remainder of the article is organized as follows. Section 1 estab-

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> for Research in Security Prices (CRSP) database. The B/M portfolios require accounting data, so they are restricted to stocks on Compustat (the full CRSP sample is used for all other tests). The analysis considers the period 1941– 1999, although Compustat restricts B/M portfolios to May 1963–December 1999. I exclude the pre-1941 data primarily to avoid the Depression era. Also, Jegadeesh and Titman (1993) ﬁnd that momentum is negligible, or

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> 15 industry portfolios, 5, 10, or 15 size and B/M portfolios, and 9, 16, or 25 size-B/M portfolios. Industries are based on two-digit SIC codes as reported by CRSP; they typically contain ﬁrms in consecutive two-digit codes, but some exceptions were made. Size portfolios are based on the market value of equity in the previous month. B/M portfolios are based on the ratio of book equity in the previous ﬁscal year to market equity in the previous month.

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> only the industry portfolios, size deciles, and 16 size-B/M portfolios. The table reveals two important facts. First, there is considerable cross-sectional variation in the portfolios. Average monthly returns range from 0.99% to 1.39% for the industries, 1.06% to 1.48% for the size portfolios, and 0.92% to 1.59% for the size-B/M portfolios. Standard deviations range from 3.46% for utilities up to 7.22% for small, low-B/M stocks. Second, the portfolios

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).
