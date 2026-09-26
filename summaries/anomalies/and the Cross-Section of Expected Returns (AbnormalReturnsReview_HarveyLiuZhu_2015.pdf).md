# … and the Cross-Section of Expected Returns — Harvey, Liu & Zhu (2016) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | … and the Cross-Section of Expected Returns |
| **Authors** | Campbell R. Harvey (Duke / NBER); Yan Liu (Texas A&M); Heqing Zhu (University of Oklahoma) |
| **Journal** | *The Review of Financial Studies* **29**(1), 5–68, 2016 (Advance Access Oct 9, 2015) |
| **DOI** | 10.1093/rfs/hhv059 |
| **Received / Accepted** | Oct 22, 2014 / Jun 15, 2015 (Editor Andrew Karolyi) |
| **JEL** | C12, C52, G12 |
| **Keywords** | Multiple testing; factor zoo; false discoveries; Bonferroni; Holm; FDR; BHY; data mining; asset pricing |
| **Companion data** | http://faculty.fuqua.duke.edu/~charvey/Factor-List.xlsx |
| **Original PDF** | `AbnormalReturnsReview_HarveyLiuZhu_2015.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsdlYyYm8tUEdsc0k` |
| **Extraction** | `download_file_content` → pdftotext -layout; ~31,584 words clean text. No OCR issues. |

---

## Problem / Motivation

The classical CAPM test of Fama and MacBeth (1973) reported a market-beta *t*-statistic of **2.57**, which comfortably cleared the conventional **2.0** cutoff. In the subsequent forty years, **hundreds** of papers proposed factors to explain the cross-section of expected equity returns. Cochrane (2011) labeled this the “factor zoo.” Once many hypotheses have been tried—and especially once unpublished failures are acknowledged—the usual single-test critical values are no longer valid. A *t* of 2.0 corresponds to a one-test two-sided *p*-value of 5%; with hundreds of trials, the probability of at least one false discovery under the global null rises toward one.

Harvey, Liu, and Zhu (HLZ) ask two related questions: (i) **what hurdle should current research use**, given historical multiplicity; and (ii) **how many published “significant” factors are likely false discoveries**. Their answer is stark: a newly proposed factor today should clear a *t*-statistic of roughly **3.0** (and often higher under family-wise error control), and **most claimed findings in financial economics are likely false** in the Ioannidis (2005) sense.

The paper sits next to McLean and Pontiff (2015) on post-publication decay, Lewellen–Nagel–Shanken (2010) on spurious cross-sectional $R^2$, and the multiple-testing literature in finance (Sullivan–Timmermann–White; Barras–Scaillet–Wermers; Bajgrowicz–Scaillet). HLZ’s distinctive contribution is a **historical catalog of 316 factors**, recommended time-varying cutoffs from 1967 through a projection to **2032**, and a **parametric missing-data model** that estimates the unobserved number of tried factors $M$ jointly with the fraction of true nulls $p_0$.

Two philosophical caveats are stated up front. First, a factor derived from **theory** should face a lower hurdle than a purely empirical discovery—but even theory-based factors should not use *t* = 2.0. Second, the analysis is **unconditional**; a factor that is marginal unconditionally may still matter in particular economic states.

---

## Setup and Data

### Search rules

HLZ do not catalog every asset-pricing paper. Inclusion rules:

1. Papers that **propose and test new factors** (or the first empirical test of a theoretical factor).
2. Different empirical proxies for the same economic risk are both kept (e.g., Kaplan–Zingales vs Whited–Wu financial-constraints indices).
3. Exclude event-study / small-universe corporate-finance papers and theories without empirical content.
4. Focus on top finance, economics, and accounting journals, plus recent SSRN working papers.

Resulting sample: **313 papers**, **316 factors** (some papers propose multiple factors). Working papers are identified but the main historical figures exclude them for the cumulative discovery count; **63 working papers** appear in the broader sample discussion.

### Taxonomy (Table 1)

Factors are classified as **common** (113) vs **characteristics** (202):

| Risk type | Common (113) | Characteristics (202) | Examples |
|-----------|-------------:|----------------------:|----------|
| Financial | 46 | 61 | Market; squared market; idiosyncratic vol; extreme returns |
| Macro | 40 | — | Consumption growth; investment returns |
| Microstructure | 11 | 28 | Liquidity; volume; short-sale / T-cost frictions |
| Behavioral | 3 | 3 | Sentiment; mispricing; analyst dispersion; media |
| Accounting | 8 | 87 | Size, B/M; PE; debt/equity |
| Other | 5 | 24 | Momentum; beliefs; political contributions; intangibles |

The catalog with citations is published as an Excel file (Factor-List.xlsx).

### Why out-of-sample alone is insufficient

McLean–Pontiff show anomaly decay after publication and drop **12 of 97** anomalies they could not even replicate in-sample—implying **100%** decay for those. Hold-out samples inside CRSP are not genuine future out-of-sample tests. Multiple testing yields **immediate** guidance without waiting years for new data.

---

## Model / Methods

### Multiple-testing contingency (Table 2)

For $M$ tests, $R$ rejections:

$$
\begin{array}{c|cc|c}
 & H_0\text{ not rejected} & H_0\text{ rejected} & \text{Total}\\ \hline
H_0\text{ true} & N_{0|a} & N_{0|r} & M_0\\
H_0\text{ false} & N_{1|a} & N_{1|r} & M_1\\ \hline
\text{Total} & M-R & R & M
\end{array}
$$

**Family-wise error rate (FWER):**

$$
\mathrm{FWER}=\Pr(N_{0|r}\ge 1).
$$

**False discovery rate (FDR):**

$$
\mathrm{FDR}=\mathbb{E}\!\left[\frac{N_{0|r}}{R}\,\Big|\,R>0\right]\Pr(R>0).
$$

Hypothetical illustration (Panel A): $M=700$, $R=100$ published “significant,” of which 50 are false; 100 true factors remain unpublished. Type I and Type II errors coexist.

### Three classical adjustments (Table 3)

| Method | Type | Controls |
|--------|------|----------|
| Bonferroni | single-step | FWER |
| Holm (1979) | sequential (step-down) | FWER |
| Benjamini–Hochberg–Yekutieli (BHY) | sequential | FDR (allows dependence) |

**Bonferroni.** Reject if $p_i\le \alpha_w/M$; adjusted $p_i^B=\min[M p_i,1]$.

**Holm.** Order $p_{(1)}\le\cdots\le p_{(M)}$. Let $k$ be the smallest index with

$$
p_{(b)}>\frac{\alpha_w}{M+1-b}.
$$

Reject $H_{(1)},\ldots,H_{(k-1)}$. Adjusted:

$$
p_{(i)}^{H}=\min\Big[\max_{j\le i}\{(M-j+1)p_{(j)}\},1\Big].
$$

**BHY (FDR).** With $c(M)=\sum_{j=1}^{M}1/j$ (harmonic number; handles arbitrary dependence), reject using thresholds

$$
\frac{b\cdot\alpha_d}{M\cdot c(M)}.
$$

### Toy example (Table 4, $M=10$, $\alpha_w=\alpha_d=5\%$)

Raw *t*-stats: 1.99, 2.63, 2.21, 3.43, 2.17, 2.64, 4.56, 5.34, 2.75, 2.49 — **all 10** “significant” under single tests.

| Procedure | Cutoff *p* | # discoveries | Surviving tests |
|-----------|-----------:|-------------:|-----------------|
| Bonferroni | 0.50% | 3 | 4, 7, 8 |
| Holm | 0.60% | 4 | ordered top 4 |
| BHY | 0.85% | 6 | ordered top 6 |

### Historical cutoffs with $M=R$ (published only)

At each date, transform available published *t*-stats to *p*-values, apply Bonferroni / Holm / BHY, map back to normal *t* critical values. Main calibration: $\alpha_w=5\%$ (FWER), $\alpha_d=1\%$ (FDR). Extrapolate factor production at the **2003–2012** rate through **2032**.

### Missing-data / correlation model (Section 4)

Published factors under-count tried tests. HLZ posit a latent panel of $M$ strategies over $N=240$ months (20 years; conservative choice):

- With probability $p_0$, strategy $i$ is a true null ($\mu_i=0$).
- Else $\mu_i$ is drawn from an exponential distribution with mean $\lambda$ (monthly).
- Returns within a period have pairwise correlation $\rho$; *t*-statistics $T_i=\hat\mu_i/(\hat\sigma_i/\sqrt{N})$.

A fraction $r$ of borderline “*t* between 1.96 and 2.57” tests are assumed missing (publication bias). Baseline $r=1/2$; robustness $r=2/3$. Parameters $(\lambda,p_0,M)$ are estimated by matching sample quantiles of observed *t*-stats via a GMM-style distance $D(\cdot)$; $\rho$ is calibrated on a grid.

Threshold *t* for target FWER/FDR is then found by simulation (5,000 draws) under the estimated DGP.

---

## Results (with numbers)

### Historical benchmarks (Figure 3 narrative)

- **Bonferroni** implied *t*: starts at **1.96**, rises to **3.78** by **2012**, projects to **4.00** by **2032** (single-test *p* = 0.02% and 0.01%).
- **Holm** tracks Bonferroni from below (slightly more powerful); differences small.
- **BHY (FDR 1%)**: non-monotonic historically; stabilizes near **3.39** (*p* ≈ 0.07%) after 2010; **2.78** in 2012 if $\alpha_d=5\%$ (and **2.81** in 2032).
- Headline recommendation under published-only multiplicity: minimum threshold ≈ **2.8** for 5%-style significance once FDR is controlled at 5%; **~3.4** under FDR 1%; **~3.8** under FWER 5%.

Selected famous factors marked on Figure 3:

| Factor | Source | Outcome vs adjustments |
|--------|--------|------------------------|
| MKT (beta) | Fama–MacBeth 1973 | Significant across all |
| HML, MOM | FF 1992; Carhart 1997 | Significant across all |
| DCG, SRV | Yogo 2006; Adrian–Rosenberg 2008 | Significant across all |
| EP, LIQ, CVOL | Basu; Pastor–Stambaugh; Boguth–Kuehn | Sometimes significant |
| SMB, DEF, IVOL, LRV | various | Often fail stricter hurdles |

### Homogeneous subsample (post-2000, Fama–MacBeth, ≥1970–1995 coverage, ≥FF3 controls): **124 factors**

| Method | Threshold *t* (2012) |
|--------|---------------------:|
| Bonferroni 5% | 3.54 |
| Holm 5% | 3.20 |
| BHY 1% | 3.23 |
| BHY 5% | 2.67 |

Still far above 1.96. Haircutting to **113 common factors** only: Holm *t* = **3.29** vs **3.64** at 316 factors—message unchanged.

### Correlation model estimates (Table 5)

Baseline $r=1/2$, standardized annual vol = **15%**:

| $\rho$ | $p_0$ | $\lambda$ (%/mo) | $M$ | FWER 5% *t* | FWER 1% *t* | FDR 5% *t* | FDR 1% *t* |
|--------:|--------:|-------------------:|------:|------------:|------------:|-----------:|-----------:|
| 0.0 | 0.396 | 0.550 | 1,297 | 3.89 | 4.28 | 2.16 | 2.88 |
| 0.2 | 0.444 | 0.555 | 1,378 | 3.91 | 4.30 | 2.27 | 2.95 |
| 0.4 | 0.485 | 0.554 | 1,477 | 3.81 | 4.23 | 2.34 | 3.05 |
| 0.6 | 0.601 | 0.555 | 1,775 | 3.67 | 4.15 | 2.43 | 3.09 |
| 0.8 | 0.840 | 0.560 | 3,110 | 3.35 | 3.89 | 2.59 | 3.25 |

Interpretation:

- $\lambda\approx 0.55\%$ per month ⇒ **~6.6%** annual mean for true factors ⇒ Sharpe ≈ **0.44** annual (0.13 monthly) at 15% vol.
- At $\rho=0$: $M\approx 1{,}297$ trials, about **60%** true discoveries among the latent population of non-nulls; at $\rho=0.6$: $M\approx 1{,}775$, only ~**40%** non-null.
- Across $\rho$, controlling **FWER at 5%** generally needs *t* ≈ **3.9**; controlling **FDR at 1%** needs *t* ≈ **3.0**.

More missing tests ($r=2/3$) pushes FWER-5% thresholds to **4.06–4.17** at low $\rho$.

### How large is $\rho$?

- Optimized distance $D$ minimized near $\rho=0.2$.
- S&P Capital IQ (~400 U.S. equity factors, 1985–2014): average pairwise correlation ≈ **0.15**.
- External: McLean–Pontiff ≈ 0.05; Green–Hand–Zhang accounting factors 0.06–0.20; mutual-fund excess returns near 0–0.09.
- Authors’ judgment: neighborhood of **0.20**.

### False-discovery counts among published “significant” factors

Of **296 published significant factors**:

| Rule | False discoveries |
|------|------------------:|
| Bonferroni | 158 |
| Holm | 142 |
| BHY 1% | 132 |
| BHY 5% | 80 |

This aligns with PCA evidence that only ~**five** statistical common factors drive equity time-series variation (Ahn–Horenstein–Wang 2012)—inconsistent with hundreds of economically distinct priced factors.

### Why the hurdle must rise over time

Three reasons (Conclusion): (1) low-hanging fruit already picked—discovery rate of *true* factors likely fell; (2) data are finite (CRSP is not the LHC); (3) computational cost of mining collapsed, so priors on tried factors are weaker than in the 1980s when data work was expensive.

---

## Limitations

1. **Publication / hidden-tests bias** still understates $M$; cutoffs are therefore **lower bounds** on the true hurdles.
2. **Theory vs empirics**: paper does not operationalize a quantitative discount for theory-based factors.
3. **Unconditional** tests ignore state dependence and conditional risk premia.
4. **Dependence**: positive correlation among similar factors can make FWER procedures overly conservative (higher Type II); authors address via the $\rho$-model and the Capital IQ calibration.
5. **Heterogeneous samples and methods** across papers; robustness subsample (124 Fama–MacBeth factors) softens but does not eliminate thresholds.
6. **Working papers** and replication culture: finance rarely publishes replications, biasing the literature toward “new” factors.
7. Bayesian / hierarchical selection is discussed but not implemented at full scale because of missing tried factors and high dimension.

---

## Practical Takeaways for a Quant Investor

1. **Raise the bar.** Treat a long-short factor with in-sample *t* ≈ 2.0–2.5 as **not evidence**. Target *t* ≥ **3.0** as a minimum screen for newly proposed signals; prefer **3.5–4.0** if the signal is purely empirical, highly correlated with existing factors, or comes from a large search.
2. **Count your own trials.** If your research desk tested $M$ characteristics this year, apply Bonferroni/Holm/BHY to the full vector of *p*-values—not only the winners that make the investment committee memo.
3. **Expect false discoveries.** Even among *published* significant factors, HLZ’s adjustments imply **27–53%** are false (80–158 of 296). Capacity, costs, and post-publication decay (McLean–Pontiff) will erode the survivors further.
4. **Correlation does not save you.** Realistic $\rho\sim 0.2$ still leaves FWER-5% hurdles near **3.9**. Only near-perfect correlation would restore *t* = 1.96—and that is not the empirical factor zoo.
5. **Theory and economic priors still matter—but not enough to restore *t* = 2.** Prefer signals with structural stories, multi-asset confirmation (Asness et al.), and out-of-sample live track records; still demand elevated *t*.
6. **Portfolio construction implication.** A “100-factor” risk model or alpha engine is statistically untenable. Shrink aggressively toward a small set of well-identified factors (value, momentum, quality/profitability, low-risk, liquidity) whose *t*-stats clear HLZ hurdles across decades.
7. **Research process redesign.** Pre-register hypotheses where feasible; keep a graveyard of failed tests; report FDR-adjusted significance; budget research time for **replication** of existing factors under current market microstructure, not only novelty.
8. **Live monitoring.** A factor that cleared *t* = 3 historically can fail going forward as capital crowds it (HLZ cite crowding research). Combine elevated in-sample hurdles with continuous out-of-sample and capacity-aware monitoring.
9. **Cross-domain lesson.** The same multiplicity critique applies to return *prediction* (Welch–Goyal), capital structure (Frank–Goyal), and “alternative data” alpha searches—anywhere many predictors are tried against limited overlapping samples.
10. **Bottom line.** HLZ’s operational rule for 2015+ research—and still the right default for a 2020s quant book—is: **no new factor without *t* > 3**, and treat a large fraction of the inherited factor library as provisional until it survives multiple-testing, costs, and live decay.

---

## Appendix Notes (selected)

- Online Appendix B details the sampling of *t*-statistics.
- Table 6 (multi-page) lists the full factor taxonomy with citations; companion Excel includes URLs.
- Higgs-boson analogy: particle physics often requires *t* > 5; finance’s limited data make analogous control even more important, not less.
- Related follow-ups by Harvey–Liu develop sequential testing and factor redundancy frameworks (cited as 2014a–c working papers in the text).

---

*Summary prepared for Giuseppe Paleologo Scholar daily batch_2026-09-23_2. Paleologo-style quantitative notes: equations, tabled coefficients, and operational hurdles retained; no hand-waving on multiplicity.*

---

## Extended Discussion of Multiple Testing Theory

### Why FWER vs FDR matters for a trading desk

Family-wise error rate asks: “What is the probability that **at least one** false factor enters my library?” That is the right criterion when a single false discovery is costly—e.g., when each accepted factor is funded with dedicated risk capital, or when a risk model treats every factor as a priced source of return. False discovery rate asks: “What **fraction** of my accepted factors are expected to be false?” That is closer to the problem of a multi-strategy book that can tolerate some duds if the portfolio of signals remains profitable.

HLZ refuse to pick a single philosophy. They report both. For FWER at 5%, historical Bonferroni/Holm cutoffs climb into the high 3s by 2012. For FDR at 1%, BHY stabilizes near 3.4; at FDR 5%, near 2.8. A pragmatic desk rule consistent with the paper is:

- **Core risk premia** (few slots, large AUM): use FWER-style hurdles (*t* ≳ 3.5–4).
- **Satellite / experimental alphas** (many slots, small AUM each): use FDR-style hurdles (*t* ≳ 2.8–3.0) **and** explicit capacity/cost filters.

### Mathematical detail: Bonferroni underestimates power under dependence

If $M_0$ of $M$ nulls are true and tests are arbitrary dependent, Bonferroni guarantees

$$
\mathrm{FWER}\le \frac{M_0}{M}\alpha_w\le\alpha_w.
$$

When $\rho\to 1$, the effective number of independent tests collapses to 1, so Bonferroni is extremely conservative. HLZ’s Table 5 shows this quantitatively: at $\rho=0.8$, FWER-5% *t* falls from ~3.9 to **3.35**, still far above 1.96. Empirically $\rho\approx 0.2$, so conservatism is real but not enough to resurrect the classical cutoff.

### Holm as a uniformly more powerful FWER procedure

Holm’s step-down test never rejects fewer hypotheses than Bonferroni for the same $\alpha_w$ under the usual conditions, and is still valid under arbitrary dependence. In the Table 4 toy example, Holm recovers 4 discoveries vs Bonferroni’s 3. In the historical factor sample, Holm *t* tracks Bonferroni within a few tenths. For implementation, order the absolute *t*-statistics descending, convert to two-sided normal *p*-values, and walk down until the Holm inequality fails.

### BHY and the harmonic penalty

The Yekutieli refinement replaces the Benjamini–Hochberg threshold $b\alpha_d/M$ with $b\alpha_d/(M\,c(M))$ where $c(M)=H_M\approx \ln M+\gamma$. For $M=316$, $c(M)\approx 6.3$, a material tightening. This is why BHY(1%) lands near *t* = 3.39 rather than something closer to 2.5. If a researcher naively applies BH without the dependence correction while factors are positively correlated, FDR control can fail; BHY is the safer default for the factor zoo.

---

## Deeper Results: Time Path of Discoveries and Selected Factors

### Cumulative discovery path (Figure 2)

Factor discoveries accelerate after the mid-1990s and especially after 2003. HLZ’s green solid curve (published factors only) is nearly linear in the last decade of the sample; the dotted extrapolation to 2032 assumes that rate continues. Working papers (63 in sample) are excluded from Figure 2’s main cumulative count but would only raise multiplicity further.

### Interpreting selected *t*-stats on Figure 3

- **Market beta (Fama–MacBeth 1973, *t* ≈ 2.57 historically):** survives modern hurdles largely because it was proposed early, when $M$ was small; re-evaluated today against the full zoo it is still significant under HLZ’s markers, but the *original* decision to accept it at *t* = 2.57 would not meet 2012 cutoffs if it were proposed for the first time in 2012.
- **HML and MOM:** large *t*-stats; survive all adjustments. These are the canonical examples of factors that remain credible after multiplicity correction.
- **Liquidity (Pastor–Stambaugh), earnings yield, consumption volatility:** sit near the boundary—sometimes in, sometimes out—depending on FWER vs FDR and the exact sample.
- **Idiosyncratic volatility, default likelihood, long-run volatility:** often fail. A desk that traded IVOL as a “priced factor” solely because Ang et al. (2006) reported significance under classical criteria would be exactly the Ioannidis problem HLZ warn about.

### Missing-data economics

The estimate $M\in[1{,}300,\,1{,}800]$ at realistic $\rho$ says the published literature is roughly a **4–6×** undercount of tried factors relative to the 316 catalogued. Combined with $p_0\in[0.4,\,0.6]$, the latent null fraction is large. The exponential mean $\lambda=0.55\%$/month for true factors is economically modest: **6.6%** annualized before costs—consistent with many “anomaly” papers’ gross long-short spreads, and a reminder that **net** of shorting costs, market impact, and crowding, true-factor Sharpe ratios of 0.44 are not free lunch.

### Robustness of $N=240$

Choosing twenty years of monthly data is conservative: longer $N$ would inflate non-null *t*-stats and make it easier to declare significance under the alternative, which would **lower** estimated thresholds. HLZ report that changing $N$ mainly rescales $\lambda$, leaving threshold *t*-stats nearly unchanged—useful for practitioners who worry about sample-length sensitivity.

---

## Connection to Related Literatures (Quant Interpretation)

1. **McLean–Pontiff (2015):** post-publication decay is the *time-series* manifestation of the same selection bias HLZ attack *cross-sectionally*. If 58% of alpha disappears after publication, that is consistent with a large false-discovery share plus crowding on true discoveries.
2. **Lewellen–Nagel–Shanken (2010):** high cross-sectional $R^2$ is almost automatic when factors are correlated with characteristics; HLZ add that even the *t*-stats on those factors are inflated by multiplicity.
3. **Green–Hand–Zhang; Subrahmanyam surveys:** document the sprawl of predictors; HLZ supply the statistical correction.
4. **Medical multiple testing (Ioannidis 2005):** HLZ explicitly import the “most findings are false” conclusion. The analogy is intentional and should be taken seriously by PMs who treat every FAJ/JFQA anomaly as investable.
5. **Principal components (Ahn–Horenstein–Wang):** ~5 statistical factors in returns vs 300+ proposed priced factors—an independent red flag that the zoo is overfit.

---

## Implementation Playbook (Desk Checklist)

| Step | Action | HLZ link |
|------|--------|----------|
| 1 | Maintain a research log of **all** tested signals, including failures | Missing $M$ |
| 2 | At promotion-to-production, compute Bonferroni/Holm/BHY on the **full** log | Tables 3–4 |
| 3 | Require *t* ≥ 3.0 (FDR-ish) or ≥ 3.5 (FWER-ish) on the **longest clean sample** | Fig 3, Table 5 |
| 4 | Haircut *t* for signals correlated >0.5 with existing book factors | $\rho$ discussion |
| 5 | Demand multi-asset or international confirmation where possible | Asness et al. cite |
| 6 | Budget live OOS and capacity tests; do not equate in-sample *t* with deployable alpha | Limits section |
| 7 | Revisit legacy factors annually under current cutoffs | Rising hurdles |
| 8 | Prefer sparse risk models; cull factors that fail HLZ thresholds | PCA inconsistency |

### Numerical example for an internal research pipeline

Suppose a team tested **200** signals in 2025. The 5% Bonferroni cutoff is $\alpha/M=0.00025$, i.e. two-sided normal *t* ≈ **3.67**. If the best signal has *t* = 3.2, it **fails** Bonferroni/Holm at 5% FWER even though it would be a career-making result under classical criteria. Under BHY with FDR 5% the cutoff is lower, but the team should still ask whether funding 10 “significant” signals with expected 1–2 false discoveries is acceptable given correlated downside in a crisis.

---

## Detailed Limitations Expanded

**Sample construction subjectivity.** Journal selection and “first paper only” rules are judgment calls. Including every follow-up on the size effect would inflate dependence and $M$; excluding them understates tried tests. HLZ argue their catalog is still a lower bound.

**t-distribution vs normal.** Mapping *p*-values back through $N(0,1)$ is accurate for large $N$ but slightly anti-conservative for short samples.

**One-sided vs two-sided.** Asset pricing tests are often one-sided (expected premium > 0). One-sided *p*-values would change cutoffs; HLZ work in the two-sided classical testing tradition standard in the literature they critique.

**Economic magnitude vs statistical significance.** A factor can clear *t* = 3 and still be untradeable (microcaps, low capacity). HLZ are silent on costs; combine with Novy-Marx–Velikov-type liquidity screens.

**Conditional and nonlinear factors.** Machine-learning signals with many tuneable hyperparameters face an even more severe multiplicity problem than the 316 linear factors HLZ count. The *t* > 3 rule is a **floor**, not a ceiling, for high-dimensional methods.

---

## Concise Equation Sheet

**Single-test null:** $T_i \xrightarrow{d} N(0,1)$ under $H_{0i}:\mu_i=0$.

**Bonferroni critical *t*:** $t^*_{\mathrm{Bonf}}=z_{1-\alpha_w/(2M)}$ (two-sided).

**Holm:** reject ordered hypotheses while $p_{(b)}\le \alpha_w/(M+1-b)$.

**BHY:** reject while $p_{(b)}\le b\alpha_d/(M\,c(M))$, $c(M)=\sum_{j=1}^M 1/j$.

**Latent mean model:** $\mu_i=0$ w.p. $p_0$; else $\mu_i\sim\mathrm{Exp}(\lambda)$ (mean $\lambda$).

**Annualized true-factor mean:** $12\lambda \approx 6.6\%$ at $\hat\lambda=0.55\%$.

**Sharpe:** $12\lambda / (0.15\sqrt{12})$ wait carefully: monthly Sharpe $\lambda/(\sigma_m)$ with $\sigma_m=0.15/\sqrt{12}\approx0.0433$ ⇒ $\mathrm{SR}_m\approx0.127$, $\mathrm{SR}_a\approx0.44$.

---

## Final Synthesis

Harvey, Liu, and Zhu replace the casual *t* > 2 culture of empirical asset pricing with a coherent multiple-testing discipline. Whether one prefers FWER or FDR, whether one believes 316 or 1,500 factors were tried, and whether pairwise correlations are 0.05 or 0.20, the qualitative conclusion is invariant: **classical significance thresholds are far too lenient**, a *t*-statistic of **3.0** is a defensible modern minimum, and a large share of the published factor zoo would not survive honest multiplicity control. For a quant investor, the paper is less a rejection of factor investing than a demand for **statistical hygiene**: fewer factors, higher hurdles, logged failures, and continuous skepticism toward newly mined signals.

---

## Closing Remarks for Quant Research Governance

HLZ should change how research committees approve factors. A useful governance artifact is a one-page “multiplicity card” attached to every new signal proposal: (i) number of related tests run in the last 24 months by the proposing team; (ii) Bonferroni and BHY adjusted *p*-values; (iii) correlation of the candidate with each live book factor; (iv) gross and net *t*-stats after a standardized transaction-cost model; (v) whether the signal was pre-registered or mined. Signals that clear gross *t* = 3 but fail net *t* = 2 after costs are research curiosities, not portfolio holdings. Signals that clear only because the team omitted fifty failed cousins from the denominator are governance failures. The paper’s deepest contribution is not any single cutoff number but the insistence that **the unit of inference is the research program, not the individual regression**.

---

## Worked Multiplicity Examples for Internal Use

### Example A — Single new signal, large historical library

A PM proposes a “new” quality signal with in-sample *t* = 2.9 on 1975–2024. The firm already has 80 live or shelved equity signals. Even ignoring unpublished fails, Bonferroni at 5% with $M=81$ requires *p* ≤ 0.05/81 ≈ 0.000617 ⇒ *t* ≈ 3.42. The signal **fails**. Holm may be slightly softer if many existing signals have large *p*-values, but a *t* = 2.9 discovery against an 80-signal library is not FWER-safe.

### Example B — FDR budgeting

Same firm willing to accept FDR = 5% among promoted signals. With BHY and $c(M)\approx H_{80}\approx 5.0$, thresholds loosen. Suppose ordered *p*-values of candidates; BHY may accept *t* ≈ 2.8–3.0 signals. The firm should simultaneously cap the number of promoted signals so that 5% of the book is an acceptable dud rate in risk terms.

### Example C — Correlation haircut

Signal corr 0.6 with existing value-quality composite. Effective independent trials are fewer, but the incremental alpha is also thinner. HLZ’s $\rho$-grid shows FWER hurdles fall only modestly until $\rho$ is extreme. Haircut the *t* by treating the residualized signal (orthogonal to the book) as the object of inference—usually the right compromise.

### Example D — Theory credit

A consumption-CAPM factor motivated by an equilibrium model prints *t* = 2.6. HLZ say theory deserves a lower hurdle than pure mining, but not *t* = 2.0. A reasonable governance band: theory-based **2.6–2.8** minimum; empirical-mined **3.0–3.5**; mined-in-large-search **≥ 3.5–4.0**.

### Historical cutoff table (approximate, from paper narrative)

| Year | Bonferroni *t* | Holm *t* | BHY 1% *t* | BHY 5% *t* |
|------|---------------:|---------:|-----------:|-----------:|
| Early (1960s–70s) | ~1.96–2.2 | ~1.96–2.2 | ~2.0–2.5 | ~1.96–2.2 |
| ~2000 | mid 3s | mid 3s | ~3.0–3.3 | ~2.5–2.8 |
| 2012 | 3.78 | ~3.6–3.7 | 3.39 | 2.78 |
| 2032 (proj.) | 4.00 | ~3.8–3.9 | ~3.4 | 2.81 |

### False-discovery arithmetic

296 published significant factors; 158 fail Bonferroni ⇒ implied true-discovery count 138 under that rule. If each “true” factor has annualized mean 6.6% at 15% vol (Sharpe 0.44) **before** costs and crowding, and McLean–Pontiff-type decay removes ~50% post-publication, net deployable premia are scarce. This is why sparse factor investing survives HLZ while kitchen-sink factor investing does not.
