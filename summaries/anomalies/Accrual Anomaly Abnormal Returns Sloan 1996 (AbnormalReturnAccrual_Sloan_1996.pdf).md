# Accrual Anomaly / Abnormal Returns — Sloan (1996) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Do Stock Prices Fully Reflect Information in Accruals and Cash Flows about Future Earnings? |
| **Author** | Richard G. Sloan (University of Pennsylvania) |
| **Journal** | *The Accounting Review*, Vol. 71, No. 3 (July 1996), pp. 289–315 |
| **Stable URL** | JSTOR link in source PDF |
| **JEL / themes** | Accruals, cash flows, earnings persistence, market efficiency, functional fixation |
| **Sample** | 40,679 NYSE/AMEX firm-years, Compustat∩CRSP, fiscal years **1962–1991** |
| **Original PDF** | `AbnormalReturnAccrual_Sloan_1996.pdf` |
| **Drive file id** | `0B-6kBz0I0dMsS1NRZU9EYkhGaXM` |

Dedication / acknowledgments highlight Vic Bernard’s role; submitted Feb 1995, accepted Feb 1996. This paper is the canonical origin of the **accrual anomaly** literature.

---

## Problem / Motivation

Financial statement analysis texts (Graham et al. 1962; Bernstein 1993; Stickney; White et al.; Kieso & Weygandt; analyst newsletters such as O’Glove, Ciesielski, Tice, Murphy, Kellogg) have long argued that **earnings quality** depends on the mix of accruals vs cash flows: accruals involve subjectivity (deferrals, allocations, valuations), so CFO is “less subject to distortion,” and a high CFO/NI ratio signals higher quality income.

Sloan turns that practitioner folklore into **sharp, testable hypotheses** about:

1. **Persistence:** Does accrual-driven earnings mean-revert faster than cash-driven earnings?
2. **Pricing:** Do prices act as if investors **fixate on bottom-line earnings**, failing to discriminate persistence differences?
3. **Trading profits:** Can a long-low-accrual / short-high-accrual strategy earn abnormal returns?
4. **Timing:** Are those returns concentrated around subsequent earnings announcements (as in Bernard–Thomas PEAD logic)?

The paper also speaks to contemporaneous price-response studies (Wilson 1987; Bernard & Stober 1989; Lev & Thiagarajan 1993). Bernard & Stober found no systematic contemporaneous reaction to accrual/cash splits and conjectured the components might not differ in information content. Sloan shows they **do** differ for **future** earnings—but prices only incorporate that difference with a lag, when future earnings surprise.

Relative to Ou & Penman (1989) and Bernard & Thomas (1990):

- Prediction model is **accounting-process based**, not a pure statistical kitchen sink.
- Naive benchmark is **weaker than random walk**: investors may know average earnings persistence, yet still fail to separate components.
- Paper checks whether the **magnitude** of mispricing matches the naive model (Mishkin framework), not only the sign of returns.

---

## Setup / Data

### Universe construction

- Intersection of 1993 Compustat annual industrial + research files and CRSP monthly returns (NYSE/AMEX).
- Drop pre-1962 Compustat (survivorship / missing accrual inputs).
- Drop post-1991 Compustat for tests needing ≥1 year future returns.
- Banks, life insurers, P&C often lack accrual inputs → dropped.
- Path: 71,732 Compustat firm-years (1962–1991) → 53,322 with accruals → 42,120 with CRSP → **40,679** with next-year income.

### Variable definitions

**Earnings** = operating income after depreciation (Compustat #178), excluding extraordinary items, discontinued ops, special items, non-operating income—so cash/accrual split is unambiguous for continuing operations.

**Accruals** (balance-sheet approach; SFAS 95 only covers last 4 years of sample):

$$
\text{Accruals} = (\Delta CA - \Delta\text{Cash}) - (\Delta CL - \Delta STD - \Delta TP) - \text{Dep}
$$

where $\Delta CA$=#4, $\Delta$Cash=#1, $\Delta CL$=#5, $\Delta STD$=#34 (debt in current liabilities), $\Delta TP$=#71 (taxes payable), Dep=#14.

Rationale: exclude financing (STD) and tax accruals inconsistent with pretax operating earnings definition.

**Cash flows** = Earnings − Accruals (not CFO from the cash flow statement for most of the sample).

**Scaling:** all three by **average total assets** (#6), so

$$
\text{Earnings}_t = \frac{\text{OIAD}_t}{\overline{TA}_t},\quad
\text{Accrual component}_t = \frac{\text{Accruals}_t}{\overline{TA}_t},\quad
\text{Cash component}_t = \frac{\text{OIAD}_t - \text{Accruals}_t}{\overline{TA}_t}.
$$

Average TA preferred over market equity (itself return-predictive) or net operating assets (can be negative).

### Returns

- Cumulation starts **4 months after fiscal year-end** (Alford et al. 1994: statements almost always public).
- Annual buy-hold returns for years $t+1,t+2,t+3$; delisting returns included; missing liquidation/forced delist → −100%.
- **Size-adjusted returns:** raw buy-hold minus CRSP size-decile value-weighted portfolio (NYSE/AMEX), membership by ME at start of calendar year of cumulation.
- **Jensen alphas** (Ibbotson 1975 event-time): for December FY firms only ($N=24{,}209$),

$$
(R_{p,t} - R_{f,t}) = \alpha_p + \beta_p (R_{m,t} - R_{f,t}) + e_{p,t},
$$

estimated with 30 annual observations per portfolio×horizon; $R_f$ from T-bills; $R_m$ equal-weighted NYSE/AMEX with dividends.

---

## Hypotheses

**H1 (persistence):** Persistence of current earnings performance is **decreasing** in the accrual component and **increasing** in the cash flow component.

Formally, relative to

$$
\text{Earnings}_{t+1} = \alpha_0 + \alpha_1 \text{Earnings}_t + v_{t+1}, \tag{4}
$$

the unrestricted model is

$$
\text{Earnings}_{t+1} = \gamma_0 + \gamma_1 \text{Accruals}_t + \gamma_2 \text{Cash Flows}_t + v_{t+1}, \tag{5}
$$

with prediction $\gamma_1 < \gamma_2$.

**H2(i) (naive fixation in prices):** Earnings expectations embedded in prices fail to reflect fully higher persistence of cash flows and lower persistence of accruals.

**H2(ii) (trading rule):** Long low-accrual stocks, short high-accrual stocks → positive abnormal returns.

**H2(iii) (announcement clustering):** Those abnormal returns cluster around subsequent earnings announcement windows.

Naive model allows prices to know **average** persistence $\alpha_1$ but sets $\gamma_1'=\gamma_2'$ in the pricing equation (fixation on total earnings).

---

## Model / Methods

### Persistence tests

Estimate (4)–(5) pooled and by **two-digit SIC** industry; also replace variables by **annual decile ranks** (1…10) to blunt outliers. Test $\gamma_1=\gamma_2$ with $F$-tests; industry-level sign tests for $\gamma_1<\gamma_2$.

### Mishkin (1983) rational expectations tests

Market efficiency: $E[r_{t+1} - z_{t+1}\mid \phi_t]=0$. With value-relevant $X=$ earnings,

$$
(r_{t+1}-z_{t+1}\mid\phi_t) = \beta\big(X_{t+1}-X_{t+1}^e\big) + e_{t+1}.
$$

**System A (total earnings):**

$$
\begin{aligned}
\text{Earnings}_{t+1} &= a_0 + a_1\text{Earnings}_t + v_{t+1},\\
AR_{t+1} &= \beta\big(\text{Earnings}_{t+1} - a_0 - a_1^*\text{Earnings}_t\big) + e_{t+1}.
\end{aligned}
$$

Efficiency ⇒ $a_1=a_1^*$.

**System B (components):**

$$
\begin{aligned}
\text{Earnings}_{t+1} &= \gamma_0 + \gamma_1\text{Accruals}_t + \gamma_2\text{CF}_t + v,\\
AR_{t+1} &= \beta\big(\text{Earnings}_{t+1} - \gamma_0 - \gamma_1^*\text{Accruals}_t - \gamma_2^*\text{CF}_t\big) + e.
\end{aligned}
$$

Efficiency ⇒ $\gamma_1=\gamma_1^*$ and $\gamma_2=\gamma_2^*$. Naive fixation ⇒ $\gamma_1^*=\gamma_2^*$ (≈ average persistence).

Estimation: iterative weighted nonlinear least squares (≈ FIML; better than two-step generated regressors). Likelihood ratio:

$$
2n\log(\text{SSR}^c/\text{SSR}^u) \sim \chi^2(q).
$$

Abnormal return $AR$ = size-adjusted return; cumulation as above.

### Portfolio / FM tests for H2(ii)

Annual decile sort on accruals; equal-weighted portfolio size-adjusted returns and Jensen alphas for $t+1,t+2,t+3$; hedge = long lowest − short highest. Fama–MacBeth cross-sections of returns on accruals, accrual components, and controls (size, B/M, beta, E/P).

### Announcement-window tests for H2(iii)

Aggregate four quarterly announcement windows in year $t+1$: each is **3 trading days** starting 2 days before Compustat earnings date (Bernard–Thomas convention). Non-announcement period ≈ 242 days. Compare hedge returns in vs out of windows.

---

## Results (with numbers)

### Descriptive (Table 1)

Strong **negative** relation accruals↔cash flows; **positive** relation accruals↔earnings.

| Accrual decile | Mean CF | Mean Earnings |
|----------------|---------|---------------|
| Lowest | 0.22 | 0.07 |
| Highest | 0.00 | 0.15 |

Rank corr(accruals, CF) ≈ −0.53; rank corr(accruals, accruals/earnings) ≈ 0.94 ⇒ sorting on accruals sorts on **relative** accrual intensity.

**Risk proxies:** U-shaped betas (1.25 at low accruals, 0.86 at decile 4, 1.23 at high). Hedge long1–short10 has beta ≈ 0.02. Size also U-shaped (extremes smaller). Net size exposure of hedge ≈ negligible.

**Accrual components:** Most cross-sectional variation from **current assets** (means −0.08 to +0.21), not current liabilities (−0.03 to −0.03) or depreciation (−0.06 to −0.03). Variation driven especially by receivables and inventory (industry-dependent). Sorting on aggregate accruals isolates cases where CA changes **without** proportionate CL changes (growing firms usually raise both).

### H1 — Persistence (Tables 2–3, Figure 1)

**Table 2 (earnings on lagged earnings):**

- Pooled $\alpha_1 = 0.841$ ($t$ vs 0 enormous; $t$ vs 1 = −57.47 using Dickey–Fuller critical values).
- Industry mean $\alpha_1 = 0.773$ (IQR 0.708–0.863).
- Rank regressions: pooled 0.783; industry mean 0.768.

So ROA-like operating earnings persist ~0.8, slowly mean-reverting.

**Table 3 (components):**

- Pooled: $\gamma_1=0.765$ (accruals), $\gamma_2=0.855$ (cash); $F=614.01$ rejects equality.
- Industry: $\gamma_1<\gamma_2$ in **86%** of industries (sign test rejects equality).
- Ranks: $\gamma_1=0.565$, $\gamma_2=0.838$; $F=4894$; $\gamma_1<\gamma_2$ in **99%** of industries.

**Figure 1:** Extreme earnings portfolios revert slowly (incomplete by year +5). Extreme **accrual** portfolios revert mostly in year +1, done by ~+3. Extreme **cash flow** portfolios revert slowly like total earnings.

⇒ **H1 strongly supported.**

### H2(i) — Mishkin tests (Tables 4–5)

**Table 4 (total earnings):** $a_1=0.841$, $a_1^*=0.840$; LR = 0.007 (p=0.933). Prices correctly embed **average** annual earnings persistence. (No annual PEAD of Bernard–Thomas type.)

**Table 5 (components), actual values:**

- Forecasting: $\gamma_1=0.765$, $\gamma_2=0.855$ (same as OLS).
- Pricing: $\gamma_1^*=0.911$, $\gamma_2^*=0.826$ — **weights accruals too heavily, cash too lightly**.
- LR = 180.91 (p≈0) rejects efficiency.
- Fixation benchmark would set both pricing weights ≈ 0.841; data violate that too—investors overweight accruals even relative to average persistence.

**Ranks:** still reject efficiency; $\gamma_1=0.565$ vs $\gamma_1^*=0.675$; $\gamma_2=0.838$ vs $\gamma_2^*=0.747$ — partial anticipation of lower accrual persistence, but not enough.

⇒ **H2(i) supported**; magnitude vs pure fixation is specification-sensitive.

### H2(ii) — Trading profits (Table 6, Figure 2)

**Size-adjusted hedge (low−high accruals):**

| Horizon | Low | High | Hedge | t(hedge) |
|---------|-----|------|-------|----------|
| t+1 | +4.9% | −5.5% | **+10.4%** | 4.71 |
| t+2 | +1.6% | −3.2% | **+4.8%** | 3.15 |
| t+3 | +0.7% | −2.2% | +2.9% | 1.64 |

**Jensen alpha hedges:** 10.4% (t≈4.42), 4.8% (t=2.41), 3.8% (t=1.62) for years 1–3.

Years 4–10: insignificant—consistent with Figure 1 (earnings implications fade after ~3 years).

**Figure 2:** Hedge positive in **28/30** years; exceptions 1966 (−19.5%) and 1981 (−2.2%). Stability argues against simple risk stories.

**Table 7 FM regressions:** Accruals significantly negative for future returns; incremental to size, B/M, beta, E/P. Components: current asset accruals most powerful; current liability component adds in multivariate specs even though it varies little univariately—because joint CA/CL captures disproportionate WC changes.

⇒ **H2(ii) supported economically and statistically.**

### H2(iii) — Announcement clustering

Paper’s design matches Bernard–Thomas: if mispricing corrects when earnings news arrives, abnormal returns should concentrate in the 12 announcement days vs ~242 non-announcement days. Sloan reports (in the sections following Table 7) that a substantial fraction of the accrual strategy’s returns accrues around subsequent earnings announcements—consistent with delayed incorporation of predictable earnings changes—paralleling ~40% clustering in Bernard–Thomas PEAD. (Exact split percentages in the PDF’s later tables continue this theme; the economic message is that the anomaly is tied to **earnings news**, not only to slow discount-rate drift.)

---

## Interpretation and Links to Theory

1. **Functional fixation / earnings fixation:** Investors treat \$1 of accrual earnings like \$1 of cash earnings in forecasting, despite different persistence.
2. **Not a pure risk story:** U-shaped beta/size cancel in the hedge; FM controls don’t kill the effect; 28/30 positive years.
3. **Reconciliation with Bernard–Stober:** Contemporaneous reactions can look weak even when components differ for **future** earnings if prices are slow to learn.
4. **Accrual anomaly industry:** This paper launched a literature (Xie; Fairfield et al.; Richardson et al.; Hirshleifer & Teoh; Green–Hand–Soliman decay debates; etc.) on whether the anomaly is mispricing, risk, or investment/growth q-theory.

---

## Limitations

1. **Balance-sheet accruals** ≠ modern CFO-statement accruals; measurement error possible (Hribar–Collins later critique).
2. **NYSE/AMEX only**; no Nasdaq in this vintage—microcap dynamics underrepresented.
3. **Equal-weighted** portfolio sorts; value-weighted magnitudes typically smaller (later work).
4. **Mishkin tests** sensitive to omitted forecasting variables (though Mishkin argues constraints remain valid tests of efficiency even with omitted predictors).
5. **Operating earnings** exclude specials—anomaly in specials/write-offs is a separate object.
6. Sample ends 1991; post-publication decay (Green–Hand–Soliman; LCA) is outside scope.
7. Transaction costs, short-leg constraints, and mark-to-market funding not modeled in 1996 tests.
8. Jensen alphas use EW market index and December FY only—robustness across RF models limited to CAPM-era toolkit (pre-FF3 in the paper’s main tables).

---

## Quant-Investor Takeaways

1. **Signal:** Prefer **low accruals / high cash** within earnings; classic implementation = annual decile on BS accruals / average TA, rebalance after filings (+4 months).
2. **Expected gross edge (historical Sloan sample):** ~**10%** size-adjusted hedge in year 1, ~5% in year 2, fading by year 3.
3. **Do not ignore the short leg:** High-accrual names contribute large negative alphas (−5.5% year 1); long-only “quality” captures only part.
4. **Earnings-announcement timing:** Overweight liquidity around subsequent print dates if trading the anomaly—returns are news-linked.
5. **Controls:** Accrual effect is **incremental** to value, size, beta, E/P in Sloan’s FM tests—still combine with a multifactor risk model today.
6. **Definition hygiene:** Match accrual definition to your data vendor (BS vs SCF). Document treatment of STD, taxes, depreciation.
7. **Industry awareness:** Persistence gap $\gamma_1<\gamma_2$ holds in ~86–99% of industries—but WC composition (AR vs inventory) differs; industry-neutralize if capacity allows.
8. **Risk monitoring:** Extremes are smaller and higher-beta univariately; the **hedge** is approximately beta- and size-neutral—monitor residual factor exposures (investment, growth, low-vol) that later literature emphasizes.
9. **Research process:** Mishkin-style tests are a template for any “component persistence ≠ pricing weights” anomaly (gross profit vs accruals; R&D; etc.).
10. **Post-1996 realism:** Expect smaller net Sharpe after costs and after anomaly arbitrage; still a core **earnings quality** feature for fundamental quants and forensic screens.

---

## Equation Sheet

$$
\begin{aligned}
\text{Accruals} &= (\Delta CA-\Delta Cash)-(\Delta CL-\Delta STD-\Delta TP)-\text{Dep},\\
\text{Earnings}_{t+1} &= \alpha_0+\alpha_1\text{Earnings}_t+v_{t+1},\\
\text{Earnings}_{t+1} &= \gamma_0+\gamma_1\text{Accruals}_t+\gamma_2\text{CF}_t+v_{t+1},\quad\gamma_1<\gamma_2,\\
AR_{t+1} &= \beta(\text{Earnings}_{t+1}-\mathbb{E}^*[\text{Earnings}_{t+1}\mid\phi_t])+e_{t+1}.
\end{aligned}
$$

Efficiency requires pricing weights $\gamma^*$ match forecasting $\gamma$; fixation sets $\gamma_1^*=\gamma_2^*$.

---

## Bottom Line

Sloan (1996) shows that **accrual earnings are less persistent than cash earnings**, that **prices overweight accruals and underweight cash**, and that a simple accrual sort earns ~**10%** abnormal hedge returns in the following year, fading over three years and linked to subsequent earnings news. It is foundational for earnings-quality investing and for the broader program of testing whether market prices respect accounting process information.


---

## Worked Numerical Example (Illustrative)

Suppose Firm L (low accrual) and Firm H (high accrual) both report Earnings = 0.12 on average assets.

- Firm L: Accruals = −0.05, CF = 0.17.
- Firm H: Accruals = +0.08, CF = 0.04.

Using pooled persistence $\gamma_1=0.765$, $\gamma_2=0.855$ (ignore intercepts for a gap calculation):

$$
\mathbb{E}[E_{t+1}\mid L]-\mathbb{E}[E_{t+1}\mid H]
\approx 0.765(-0.05-0.08)+0.855(0.17-0.04)
= 0.765(-0.13)+0.855(0.13)
\approx 0.0117.
$$

If prices instead apply a single weight 0.84 to total earnings, they forecast the **same** $E_{t+1}$ for L and H. The ~1.2 pp ROA gap, capitalized by an earnings response coefficient $\beta$ on the order of the Mishkin $\beta$ estimates, rationalizes mid-single-digit to double-digit return differentials—same order of magnitude as the 10% hedge.

---

## Portfolio Construction Notes for Implementing Sloan (1996)

1. **Universe:** Non-financials with valid BS accruals; apply liquidity and price filters appropriate to your mandate (Sloan’s NYSE/AMEX universe was already somewhat liquid vs modern microcaps).
2. **Signal date:** FY-end + 4 months (or actual filing date + lag if you have point-in-time).
3. **Sort:** Deciles on Accruals/AvgTA within each year (or within sector).
4. **Weights:** EW historically; VW or risk-parity for institutional realism; constrain ADV.
5. **Holding period:** 12 months primary; optionally taper years 2–3.
6. **Risk overlay:** Neutralize market, size, value; watch investment/ROA correlations in modern data.
7. **Event overlay:** Optional boost around expected earnings dates for names still held.
8. **Short availability:** High-accrual shorts may be hard-to-borrow—model locate fees.

---

## Relation to Later Accrual Decomposition Literature

Sloan’s aggregate accrual is approximately **change in non-cash WC minus depreciation**. Later work splits:

- Working capital accruals vs long-term operating accruals (Richardson et al.),
- Discretionary vs nondiscretionary (Jones / modified Jones)—Sloan deliberately does **not** require a discretionary model; total accruals suffice for the persistence ranking,
- Percent accruals vs dollar accruals,
- Cash-based accruals from the SCF (Hribar–Collins).

For a quant library, keep Sloan’s definition as the **baseline replication**, then layer refinements as separate signals and test incremental IR.

---

## Statistical Power and Sample Design Reflections

- 30 annual hedge observations → t-stats on the order of 4–5 for a 10% mean with plausible vol are achievable; Sloan’s design is powered for year-1 effects, marginal for year-3.
- Industry-level persistence tests (86–99% of industries) are as persuasive as pooled $F$-stats because they address heterogeneity.
- Rank regressions shrinking $\gamma_1$ to ~0.56 show outliers inflate accrual persistence in raw data—but the **gap** $\gamma_2-\gamma_1$ remains large.

---

## Mishkin Framework as a Reusable Template

For any characteristic $S$ hypothesized to split earnings persistence:

1. Estimate $E_{t+1}=\gamma_0+\gamma_S S_t+\gamma_R R_t+v$ where $R$ is the remainder of earnings.
2. Embed in return equation with pricing weights $\gamma^*$.
3. Test $\gamma=\gamma^*$.
4. If rejected in the direction of fixation on total $E$, build a portfolio on $S$.

This is the intellectual bridge from Sloan to many “quality” and “earnings composition” signals.

---

## Compliance / Academic Integrity Note for Internal Use

This summary is for Gappy’s private research library notes. The JSTOR PDF carries publisher terms; do not redistribute the PDF. The quantitative results cited are from the published article for research summarization.


---

## Section-by-Section Walkthrough of the Published Article

### Abstract and Framing

The abstract states three claims: (i) persistence of earnings depends on the relative magnitudes of cash and accrual components; (ii) prices act as if investors fixate on earnings; (iii) high (low) accrual firms earn negative (positive) future abnormal returns concentrated around future earnings announcements. Those three claims map 1:1 onto H1, H2(i)–(iii).

### Section I — Introduction

Sloan positions the paper against two literatures simultaneously: (a) financial statement analysis pedagogy that already “knows” accruals are lower quality, and (b) market-efficiency tests that use naive earnings expectations (Ou–Penman; Bernard–Thomas). The contribution is to import the FSA folklore into a Mishkin-style test and a trading-rule test with magnitude discipline.

He carefully notes that Wilson / Bernard–Stober / Lev–Thiagarajan examined **contemporaneous** price responses to cash vs accrual news and often found weak differences. Sloan’s twist: even if contemporaneous reactions are muted, **future** returns can still reveal mispricing if investors only learn when subsequent earnings print.

### Section II — Hypothesis Development

The intellectual core is the claim that accrual earnings are less likely to recur. Graham’s “earnings power” adjustments (reserves, unusual depreciation, inventory methods) are reinterpreted as statements about **persistence parameters**. Bernstein’s quote on CFO vs NI is reproduced almost as a verbal statement of $\gamma_1<\gamma_2$.

H2’s naive model is explicitly weaker than random walk: prices may set $a_1^*=a_1\approx0.84$ correctly (Table 4 confirms this!) while still setting $\gamma_1^*=\gamma_2^*$. That nuance is why Table 4’s non-rejection is not a contradiction of Table 5’s rejection—it is the point.

### Section III — Measurement

The BS accrual formula became the industry standard citation for a generation. Choices that matter in replication:

- Exclude STD from $\Delta CL$ (financing).
- Exclude taxes payable (earnings definition is pretax operating).
- Deflate by average TA not ME.
- Start returns at FY+4 months.
- −100% for missing adverse delists.

Each choice can move the hedge a few hundred bps; document them.

### Section IV — Empirical Analysis (extended commentary)

**Table 1 Panel C** is under-cited relative to Panels A–B. It shows that a “sort on accruals” is not the same as a “sort on inventory+AR growth,” because CL moves with CA in growing firms. The accrual sort finds **disproportionate** WC changes—precisely where accounting discretion and over-investment concerns bite.

**Figure 1** is the best teaching graphic in the paper: three mean-reversion speeds for the same earnings scale. Any internal training deck on earnings quality should reproduce it.

**Table 4 vs Table 5** together are a masterclass in specification: efficiency can hold for a coarse information set (total earnings) and fail for a refined one (components). This is the right way to talk about “the market is efficient with respect to X but not Y.”

**Table 6’s 10.4%** became a folklore number. For modern expectation-setting: that is **gross, EW, mid-cap-heavy 1962–1991**. Translate via your cost model and VW constraint before promising PMs anything.

**Figure 2’s 28/30** positive years is the best single argument Sloan offers against risk. Risk premia that flip sign twice in 30 years while maintaining a 10% mean are possible but uncomfortable for risk stories without a clear state variable.

**Table 7 Panel C** anticipates the “is it just value?” critique: accruals survive B/M, size, beta, E/P. Later FF investment factor work reopens this, but Sloan already ran the 1992-style controls.

### Section V — Conclusion (as published)

Sloan concludes that stock prices do not fully reflect accrual/cash information about future earnings, with economic magnitudes large enough for a viable research anomaly. He links this to naive fixation rather than to a claim that accruals are useless—accruals are highly useful for **forecasting**, which is why failing to use them is costly.

---

## Replication Blueprint (Stepwise)

1. Pull Compustat annual items 1,4,5,6,14,34,71,178 for 1962–1991 (or your update window).
2. Compute accruals, earnings, CF as above; require non-missing next-year earnings for persistence tests.
3. Merge CRSP monthly; compute FY+4m to +16m (+28m, +40m) buy-holds with delisting handling.
4. Assign CRSP size deciles; subtract size-portfolio returns.
5. Estimate Tables 2–5; reproduce $\alpha_1\approx0.84$, $\gamma_1\approx0.77$, $\gamma_2\approx0.86$.
6. Annual accrual deciles; Table 6 hedges; aim for year-1 hedge order **high single / low double digits** historically.
7. FM regressions with FF-style controls.
8. Optional: announcement-window split.

**Acceptance criteria for a “pass” replication:** sign and rough magnitude of year-1 hedge; $\gamma_1<\gamma_2$; Mishkin rejection on components; non-rejection on total earnings.

---

## Sensitivity Analyses Worth Running Internally

| Knob | What to try | Why |
|------|-------------|-----|
| Deflator | Avg TA vs end-of-year TA vs sales | Scale effects |
| Accrual def | BS vs SCF operating accruals | Hribar–Collins |
| Weights | EW vs VW vs risk parity | Capacity |
| Neutralization | Sector, industry, FF5 | Risk |
| Universe | NYSE only vs all-exchanges | Microcaps |
| Lag | +4m vs actual filing +1d | PIT |
| Winsorization | 1/99 vs ranks | Outliers |
| Holding | 3m/6m/12m | Turnover |

---

## Connection to Forecasting and Fundamental Analysis

Sloan formalizes why quality screens that downweight accrual-heavy earnings improve earnings forecasts. In a simple combination forecast:

$$
\hat{E}_{t+1} = \hat\gamma_0 + \hat\gamma_1 A_t + \hat\gamma_2 C_t
$$

beats

$$
\hat{E}_{t+1} = \hat\alpha_0 + \hat\alpha_1 E_t
$$

out of sample when $\gamma_1\neq\gamma_2$. The trading rule is the capital-markets dual of that forecast improvement under incomplete incorporation.

For a fundamental book: map Sloan to adjustments—strip inventory builds that lack order backing, fade receivable spikes, treat depreciation policy changes as persistence shocks.

---

## Risk-Model Perspective

In a Connor/BARRA-style fundamental risk model, accruals may load on **growth, value, and residual volatility** factors. After neutralizing those, a residual accrual alpha may remain (Sloan Table 7 suggests yes vs 1992-era controls). Treat “accrual quality” as an alpha factor with its own half-life (~1–3 years per Figure 1) when setting information turnover in a Grinold-style dynamic framework.

---

## Teaching Notes / Interview Questions

1. Why exclude STD from accruals?
2. Why does Table 4’s efficiency non-rejection not salvage Table 5?
3. Why is the hedge approximately size- and beta-neutral despite U-shapes?
4. What does 28/30 positive years imply for risk-based explanations?
5. How would SFAS 95 SCF accruals change measurement after 1988?
6. Link to Bernard–Thomas: what is analogous to AR(1) seasonal PEAD here?

---

## Extended Numerical Decomposition of the 10.4% Hedge

Year-1 size-adjusted: low decile +4.9%, high −5.5%. Asymmetry: the short leg contributes slightly more than half. Jensen alphas: low +3.9%, high −6.4% (year 1)—CAPM adjustment hits high-accrual firms harder (they have high betas in Table 1). That is a reminder to report **both** size-adjusted and beta-adjusted results when communicating.

Year-2 and year-3 decay path: 10.4 → 4.8 → 2.9 (size-adj hedges) roughly halves then halves again—consistent with earnings gap closing by year 3 in Figure 1.

---

## How This Paper Should Sit in Gappy’s Summaries Library

Filename and short title emphasize **Accrual Anomaly / Sloan 1996**. Cross-link to:

- Freyberger et al. (nonparametric characteristic selection—OA often not selected once conditioned),
- Quality/profitability factors,
- Earnings fixation behavioral literature,
- Mishkin-test methodology notes (Ten Econometric Theorems’ projection/FWL material supports the econometrics stack).

---

## Glossary

| Term | Meaning in Sloan |
|------|------------------|
| Accruals | BS operating accruals / Avg TA |
| Cash flows | Earnings − Accruals (not SCF CFO) |
| Persistence | Slope in earnings forecasting regression |
| Fixation | Pricing weights ignore component persistence differences |
| Mishkin test | Cross-equation constraints on forecasting vs pricing |
| Hedge | Long lowest accrual decile, short highest |

---

## Final Expanded Bottom Line

For quantitative investors, Sloan (1996) remains the reference specification for the accrual anomaly: **define operating accruals from the balance sheet, scale by assets, sort, wait until information is public, and harvest a historically large, earnings-news-linked return differential that matches a clear persistence story.** Everything later in the literature—decay, risk explanations, SCF measurement, investment factors—is a conversation that starts here. The paper’s methodological contribution (Mishkin tests applied to earnings components) is as important as the trading-rule headline number.
