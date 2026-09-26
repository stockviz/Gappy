# Measuring the Efficiency of Portfolio Construction (Transfer Coefficient)

**Author:** MSCI Barra Analytics Research (practitioner note)  
**Publication:** MSCI Barra Analytics Research, December 2008 (document date / © 2009 MSCI Barra)  
**Source PDF:** `TransferCoefficient_Barra_2008.pdf` (Drive id `0B-6kBz0I0dMseEVyR19NS3lOS0k`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_3)  
**OCR:** Not required; clean `pdftotext -layout` extract (~7 pages research note + disclaimer)

---

## 1. Bibliographic Context and Problem Statement

This short MSCI Barra Analytics Research note addresses a practical question that quantitative active managers confront daily: once forecasts (alphas) exist, how much of that information is actually expressed in the portfolio after constraints, transactions costs, and construction inefficiencies intervene? The proposed gauge is the **transfer coefficient (TC)**—a scalar between 0 and 1 (in well-behaved cases) that measures the information efficiency of portfolio construction.

The note sits squarely inside the Grinold–Kahn active-management framework (*Active Portfolio Management*, 2nd ed., 1999). It is operational rather than theoretical: it reviews several TC definitions used in practice, proves (or recalls) when they coincide, and then shows with June 2008 Barra USE3 style-factor tilts and Alphabuilder signals that simplified TC formulas can be badly misleading when alphas are *not* residual to the risk-model factors. The recommended fallback—always—is the ratio of ex-ante information ratios of the actual versus unconstrained optimal portfolio.

Typical frictions that drive TC below one include:

- Position-size bounds and industry/style exposure limits.
- The deeply entrenched **long-only** constraint.
- Transactions costs (easy to understand, hard to measure).
- Suboptimal return–risk tradeoffs in the optimizer (“inefficiencies”).

The managerial goal is to quantify the opportunity cost of these impediments in units of foregone information ratio.

---

## 2. Motivation: From Thought to Portfolio

Managers strive to build portfolios that reflect their insights. In the active framework the natural figure of merit is the **ex-ante information ratio**

$$
\mathrm{IR} = \frac{\alpha^\top h_A}{\sigma_A},
$$

the forecast active return divided by forecast active risk. Other things equal, the manager wants to maximize IR. Constraints and costs create *slippage* between the unconstrained IR-maximizing book and the book that can actually be held. The TC is designed to measure that slippage.

The unconstrained active optimization problem is written (equation (1) in the note; layout slightly corrupted in the PDF extract, but the intent is the standard mean–variance active objective)

$$
\max_{h_A} \;\; \alpha^\top h_A - \frac{\lambda}{2}\, h_A^\top \Sigma h_A,
$$

where:

- $h_A = h_P - h_B$ is the vector of **active weights** (portfolio minus benchmark),
- $\alpha$ is the vector of forecast residual returns (alphas), assumed **benchmark-neutral** ($\alpha^\top h_B = 0$),
- $\Sigma$ is the asset covariance matrix,
- $\lambda$ is residual-risk aversion.

The IR of the unconstrained optimum $P^*$ is denoted $\mathrm{IR}_{P^*}$. Any constrained (or cost-aware, or otherwise suboptimal) portfolio $P$ has $\mathrm{IR}_P \le \mathrm{IR}_{P^*}$. The simplest TC is their ratio.

---

## 3. Four Definitions of the Transfer Coefficient

### 3.1 Definition 1(A): IR ratio

$$
\mathrm{TC} = \frac{\mathrm{IR}_P}{\mathrm{IR}_{P^*}}.
$$

If ideas are perfectly transferred, $\mathrm{TC}=1$. Constraints, costs, or construction inefficiencies push TC below one. This is the definition the note ultimately endorses as always valid.

### 3.2 Definition 1(B): Forecast correlation of active returns

$$
\mathrm{TC} = \rho_{A,A^*} = \mathrm{corr}(r_A, r_{A^*}).
$$

Intuition: the more closely the constrained active return tracks the unconstrained optimal active return, the higher the TC. The note states that Definitions 1(A) and 1(B) are **equivalent**, because the information in $\alpha$ is embedded in $P^*$'s weights:

$$
\frac{\mathrm{IR}_P}{\mathrm{IR}_{P^*}} = \rho_{A,A^*}.
$$

### 3.3 Definition 2: Cross-sectional correlation of risk-adjusted alphas and active weights

Let $\Sigma^{-1/2}\alpha$ be risk-adjusted alphas and $\Sigma^{1/2}h_A$ risk-adjusted active weights. Then

$$
\mathrm{TC} = \mathrm{corr}\!\big(\Sigma^{-1/2}\alpha,\; \Sigma^{1/2}h_A\big).
$$

(The PDF typesetting of equation (6) is garbled; the verbal statement and the subsequent algebra make the intended objects clear.)

Starting from $h_A^* = \frac{1}{\lambda}\Sigma^{-1}\alpha$ (solution of the unconstrained problem), rewrite the return-correlation definition:

$$
\mathrm{corr}(r_A,r_{A^*})
  = \frac{h_A^\top\Sigma h_A^*}
         {\sqrt{h_A^\top\Sigma h_A}\,\sqrt{h_A^{*\top}\Sigma h_A^*}}
  = \frac{h_A^\top\Sigma^{1/2}\,\Sigma^{-1/2}\alpha}
         {\sqrt{h_A^\top\Sigma h_A}\,\sqrt{\alpha^\top\Sigma^{-1}\alpha}},
$$

which is exactly the correlation between risk-adjusted active weights and risk-adjusted alphas **when both have zero means**. Under that mean-zero condition, Definition 2 coincides with Definitions 1(A)–1(B).

### 3.4 Definition 3: Clarke–de Silva–Thorley (2002) residual form

Assume a factor covariance structure

$$
\Sigma = XFX^\top + \Delta,
$$

with $X$ asset exposures, $F$ factor covariances, and $\Delta = \mathrm{diag}(\sigma_{sp,i}^2)$ specific variances. If alphas are **risk-adjusted orthogonal** to factors,

$$
X^\top\Delta^{-1}\alpha = 0,
$$

and the active portfolio is **factor-neutral** in the same metric,

$$
X^\top\Delta^{-1}h_A = 0,
$$

then asset covariances effectively drop out of the TC calculation and equation (6) collapses to the popular form

$$
\mathrm{TC}
  = \mathrm{corr}\!\Big(\tfrac{\alpha_i}{\sigma_{sp,i}},\; \sigma_{sp,i}\, h_{A,i}\Big).
$$

This is the Clarke–de Silva–Thorley (FAJ Sep/Oct 2002) definition that became industry standard, originally under a single-factor market orthogonality assumption.

### 3.5 Definition 4: Unadjusted alpha–weight correlation

Some managers simplify further:

$$
\mathrm{TC} = \mathrm{corr}(\alpha, h_A),
$$

with **no risk adjustment**. The note treats this as the weakest and most fragile definition.

---

## 4. When Definitions Agree—and When They Do Not

**Key analytical claim.** When a manager’s alphas *are* orthogonal to risk factors (in the risk-adjusted sense above), Definitions 1–3 produce similar—and sometimes identical—results. Definition 4 can still diverge because it ignores risk.

**Key practical claim.** Many real portfolios are tilted toward one or several systematic factors. In that case Definitions 3 and 4 can be **severely misleading**, even for *unconstrained* portfolios that should have $\mathrm{TC}=1$ by construction.

The note illustrates with portfolios as of **June 2008**, benchmarked to the **S&P 500**, targeting **2% active risk**, using:

- Style factors from the Barra U.S. Equity long-term model (**USE3L**).
- Alpha signals from **Barra Alphabuilder**.

Risk input: USE3L. Four TC formulas are computed side by side.

### 4.1 Table 1 — Unconstrained portfolios (should have TC = 1)

For USE3 style-factor tilts (Volatility, Momentum, Size, Size Nonlinearity, Trading Activity, Growth, Earnings Yield, Value, Earnings Variability, Leverage, Currency Sensitivity, Yield):

| Pattern | Def 1 | Def 2 | Def 3 | Def 4 |
|---------|-------|-------|-------|-------|
| All style factors | **1.00** | **1.00** | **0.57–0.85** | **0.46–0.75** |

Concrete Def-3 / Def-4 pairs from the table include:

- Volatility: Def3 = 0.57, Def4 = 0.46  
- Momentum: 0.61 / 0.46  
- Size: 0.82 / 0.73  
- Size Nonlinearity: 0.78 / 0.63  
- Trading Activity: 0.70 / 0.63  
- Growth: 0.84 / 0.71  
- Earnings Yield: 0.78 / 0.58  
- Value: 0.73 / 0.54  
- Earnings Variability: 0.74 / 0.57  
- Leverage: 0.82 / 0.67  
- Currency Sensitivity: 0.85 / 0.75  
- Yield: 0.72 / 0.68  

For Alphabuilder signals (Cash Plowback, Dividend Discount, Estimated Revision, Estimated Change, Relative Strength, Neglect, Normalized E/P, Residual Reversal, Sector Momentum, Earning Momentum, Predicted E/P):

- Def 1 and Def 2 remain **1.00**.
- Def 3 ranges roughly **0.82–0.97**.
- Def 4 ranges roughly **0.71–0.92**.

**Interpretation.** Definitions 3 and 4 fall well below 1 even though there are *no constraints*, because alphas are **not** orthogonal to risk-factor exposures—the assumptions behind Definition 3 are violated. Definition 4 additionally ignores risk, so it drifts further.

### 4.2 Table 2 — Long-only constrained portfolios

Adding a simple long-only constraint, Def 1 and Def 2 still mostly agree but can diverge slightly when cross-sectional means of $\Sigma^{1/2}h_A$ and $\Sigma^{-1/2}\alpha$ are no longer zero.

Selected USE3 style results (Def1 / Def2 / Def3 / Def4):

- Volatility: **0.65 / 0.82 / 0.44 / 0.37**
- Momentum: **0.93 / 0.93 / 0.54 / 0.41**
- Size: **0.73 / 0.74 / 0.52 / 0.46**
- Size Nonlinearity: **0.23 / 0.24 / 0.19 / 0.12**
- Trading Activity: **0.72 / 0.78 / 0.53 / 0.48**
- Growth: **0.82 / 0.82 / 0.70 / 0.60**
- Earnings Yield: **0.73 / 0.73 / 0.52 / 0.33**
- Value: **0.80 / 0.80 / 0.63 / 0.45**
- Earnings Variability: **0.91 / 0.91 / 0.69 / 0.52**
- Leverage: **0.92 / 0.92 / 0.77 / 0.62**
- Currency Sensitivity: **0.66 / 0.67 / 0.56 / 0.47**
- Yield: **0.81 / 0.82 / 0.62 / 0.59**

Alphabuilder long-only examples:

- Cash Plowback: 0.80 / 0.80 / 0.74 / 0.56  
- Dividend Discount: 0.71 / 0.72 / 0.69 / 0.59  
- Estimated Revision: 0.69 / 0.69 / 0.64 / 0.50  
- Relative Strength: 0.86 / 0.86 / 0.79 / 0.70  
- Neglect: 0.98 / 0.98 / 0.94 / 0.92  
- Normalized E/P: **0.25 / 0.25 / 0.24 / 0.11**  
- Sector Momentum: 0.97 / 0.97 / 0.82 / 0.70  
- Predicted E/P: 0.85 / 0.86 / 0.80 / 0.64  

**Interpretation.**

1. Large disparities across definitions persist under long-only.
2. Factor identity matters: Size Nonlinearity TC collapses to ~0.23 under long-only (Def 1), while Momentum retains ~0.93—long-only bites very differently across factors.
3. If a portfolio’s factor exposures change over time, a manager using a fragile TC definition can see large apparent TC swings that are artifacts of the measure, not of construction quality.

---

## 5. Data / Experimental Setup (as Reported)

- **Date:** June 2008 snapshot.
- **Benchmark:** S&P 500.
- **Active-risk target:** 2%.
- **Risk model:** Barra USE3L (U.S. Equity V3 long-term).
- **Alpha sources:** USE3 style-factor tilts; Barra Alphabuilder signals (details referred to the USE3 Risk Model Handbook and Alphabuilder Handbook).
- **Constraint experiment:** unconstrained vs long-only.
- **TC computation:** four definitions in parallel as listed above.

The note does not report a multi-period backtest, transaction-cost simulation, or out-of-sample IR realization; it is a **cross-sectional diagnostic** on how TC *definitions* behave for factor-tilt and signal portfolios.

---

## 6. Models and Equivalence Algebra (Compressed Restatement)

Collecting the logical chain:

1. Unconstrained optimum: $h_A^* \propto \Sigma^{-1}\alpha$.
2. $\mathrm{IR}_P / \mathrm{IR}_{P^*} = \mathrm{corr}(r_A,r_{A^*})$ (Defs 1A ≡ 1B).
3. That correlation equals $\mathrm{corr}(\Sigma^{-1/2}\alpha,\Sigma^{1/2}h_A)$ when those vectors are mean-zero (Def 2).
4. Under factor-residual alphas and factor-neutral active holdings, $\Sigma$ can be replaced by $\Delta$ and Def 2 becomes the Clarke–de Silva–Thorley residual correlation (Def 3).
5. Dropping risk adjustment entirely yields Def 4.

**Failure mode of Def 3:** if $X^\top\Delta^{-1}\alpha \ne 0$ (alphas load on factors), the reduction to specific-risk correlation is invalid, and Def 3 no longer equals the IR ratio—even when the portfolio is unconstrained and the true TC should be 1.

**Failure mode of Def 2 vs Def 1 under constraints:** long-only (and other binding constraints) can induce nonzero cross-sectional means in the risk-adjusted vectors, so Def 2 need not equal Def 1 exactly (Table 2 Volatility: 0.65 vs 0.82).

---

## 7. Results Summary

| Setting | Def 1 (IR ratio) | Def 2 | Def 3 | Def 4 |
|---------|------------------|-------|-------|-------|
| Unconstrained factor tilts | Always 1.00 | Always 1.00 | Often 0.6–0.85 | Often 0.5–0.75 |
| Unconstrained Alphabuilder | Always 1.00 | Always 1.00 | Often 0.9–0.97 | Often 0.7–0.9 |
| Long-only factor tilts | 0.23–0.93 | close to Def1 (sometimes higher) | systematically lower | lowest |
| Long-only Alphabuilder | 0.25–0.98 | ≈ Def1 | lower | lowest |

The note’s “basic lesson”: **a TC measure whose assumptions are not met may be misleading.** Fortunately, the standard TC—the ratio of ex-ante IR of the actual portfolio to that of the unconstrained optimal portfolio—**works all the time**.

---

## 8. Limitations (as Implied by the Note Itself)

- Single-date illustration (June 2008); no time-series stability analysis of TC.
- No transactions-cost-aware TC; costs mentioned conceptually but not quantified in the tables.
- Equivalence proofs sketched rather than fully formalized; PDF equation layout is imperfect.
- Factor and Alphabuilder results depend on Barra proprietary models; external replication requires those models.
- Definition 2’s mean-zero assumption is not always checked formally—only noted when long-only causes Def1/Def2 gaps.
- The note does not connect TC to the Fundamental Law identity $\mathrm{IR} \approx \mathrm{TC}\cdot\mathrm{IC}\cdot\sqrt{\mathrm{Breadth}}$ beyond the IR-ratio interpretation (Clarke–de Silva–Thorley is cited for Def 3).

---

## 9. Quantitative / Practitioner Takeaways

1. **Prefer Def 1 (IR ratio)** as the operational TC. It does not rely on factor orthogonality or mean-zero risk-adjusted vectors.
2. **Def 1(B) (active-return correlation)** is theoretically equivalent to Def 1(A) and is a useful diagnostic of how closely the constrained book tracks the unconstrained optimum.
3. **Def 3 (Clarke residual correlation)** is appropriate only when alphas are residual to the risk model *and* the active book is factor-neutral in the $\Delta^{-1}$ metric. For systematic factor tilts it can report TC ≪ 1 for unconstrained portfolios—an absurdity.
4. **Def 4 (raw corr($\alpha,h_A$))** should be avoided for risk-aware construction.
5. **Long-only is highly factor-dependent:** Size Nonlinearity TC ≈ 0.23 vs Momentum ≈ 0.93 at 2% active risk in the June 2008 example—construction efficiency diagnostics must be read *by signal*, not as a single shop-wide number.
6. **Time-varying factor exposures** can induce spurious TC volatility if a fragile definition is used; Def 1 avoids that channel.
7. **Implementation checklist:** compute unconstrained $P^*$, compute ex-ante $\mathrm{IR}_P$ and $\mathrm{IR}_{P^*}$ in the same risk model, report $\mathrm{TC}=\mathrm{IR}_P/\mathrm{IR}_{P^*}$; optionally report Def 2 as a cross-check and flag large Def1–Def2 gaps as evidence of nonzero risk-adjusted means or numerical issues.
8. **Link to process improvement:** TC below one identifies *where* information is lost (constraint shadow prices, cost model, optimizer settings). Raising TC is often cheaper than raising IC.

---

## 10. Relation to Adjacent Literature (Cited in Note)

- Grinold & Kahn (1999): active optimization and IR framework.
- Clarke, de Silva & Thorley (2002), *FAJ*: portfolio constraints and the Fundamental Law; origin of the residual TC formula.
- MSCI Barra USE3 Risk Model Handbook; Alphabuilder Handbook: factor/signal definitions used in the tables.

---

## 11. Bottom Line

The transfer coefficient is a widely used ex-ante measure of portfolio-construction effectiveness. Multiple formulas circulate. They coincide under residual/factor-neutral conditions, but **factor-tilt portfolios break the simplified formulas**, sometimes dramatically. The robust definition is the ratio of ex-ante information ratios of the implemented portfolio to the unconstrained optimal portfolio. In the June 2008 Barra examples, that ratio correctly equals 1.00 for unconstrained books and correctly falls (e.g., to 0.23–0.93 across style factors) once long-only binds—whereas Definitions 3 and 4 can understate efficiency even without constraints.

---

## 12. Extended Walkthrough of the Active Optimization Link

Within the Grinold–Kahn setting the unconstrained first-order condition for (1) is

$$
\alpha - \lambda \Sigma h_A^* = 0 \quad\Rightarrow\quad h_A^* = \frac{1}{\lambda}\Sigma^{-1}\alpha.
$$

Active variance at the optimum is

$$
\sigma_{A^*}^2 = h_A^{*\top}\Sigma h_A^* = \frac{1}{\lambda^2}\alpha^\top\Sigma^{-1}\alpha,
$$

so

$$
\mathrm{IR}_{P^*} = \frac{\alpha^\top h_A^*}{\sigma_{A^*}} = \sqrt{\alpha^\top\Sigma^{-1}\alpha}.
$$

(The risk-aversion $\lambda$ scales position size and cancels in the IR.) For an arbitrary feasible active book $h_A$,

$$
\mathrm{IR}_P = \frac{\alpha^\top h_A}{\sqrt{h_A^\top\Sigma h_A}}.
$$

Their ratio is exactly Definition 1(A). Substituting $h_A^*$ into the correlation formula for active returns $r_A = h_A^\top\tilde r$ (with $\mathrm{Cov}(\tilde r)=\Sigma$) recovers Definition 1(B). Thus the IR-ratio and the forecast active-return correlation are two faces of the same quantity whenever the risk model used to define IR is also the covariance used in the correlation.

This equivalence is why MSCI Barra can treat Definitions 1(A) and 1(B) as interchangeable in the empirical tables (footnote 4: “Definitions 1A and 1B in the prior section were shown to be equivalent”).

---

## 13. Risk-Adjusted Cross-Sectional Correlation in Detail

Definition 2 reframes the same object as a **cross-sectional** correlation. Empirically this is attractive because risk systems already produce residual alphas and residual holdings. Algebraically:

$$
\mathrm{corr}(r_A,r_{A^*})
  = \frac{h_A^\top\Sigma h_A^*}{\|h_A\|_{\Sigma}\,\|h_A^*\|_{\Sigma}}
  = \frac{(\Sigma^{1/2}h_A)^\top(\Sigma^{-1/2}\alpha)}{\|\Sigma^{1/2}h_A\|_2\,\|\Sigma^{-1/2}\alpha\|_2},
$$

using $h_A^*\propto\Sigma^{-1}\alpha$. If one interprets the vectors $\Sigma^{1/2}h_A$ and $\Sigma^{-1/2}\alpha$ as samples of a bivariate distribution across assets, the Pearson correlation coincides with the above **only if** both vectors are demeaned (or already have mean zero). Under unconstrained optimization with benchmark-neutral alphas, means are typically near zero. Under long-only, the active book is skewed (many zeros at the short boundary; a few large underweights where the benchmark is large), so means need not vanish—explaining Table 2’s Volatility gap (Def1 = 0.65 vs Def2 = 0.82).

**Practical check:** when reporting Def 2, also report the cross-sectional means of the two risk-adjusted vectors. Large means → prefer Def 1.

---

## 14. Factor Orthogonality and the Collapse to Specific Risk

Start from $\Sigma = XFX^\top + \Delta$. The Woodbury / partitioned-inverse structure of factor models implies that if both $\alpha$ and $h_A$ are orthogonal to the columns of $X$ in the $\Delta^{-1}$ inner product, then the quadratic forms that enter IR and correlations reduce to specific-risk quantities:

$$
\alpha^\top\Sigma^{-1}\alpha \;\approx\; \alpha^\top\Delta^{-1}\alpha,
\qquad
h_A^\top\Sigma h_A \;\approx\; h_A^\top\Delta h_A,
$$

and cross terms similarly. Definition 3 is exactly that reduction written as

$$
\mathrm{corr}\Big(\frac{\alpha_i}{\sigma_{sp,i}},\, \sigma_{sp,i}h_{A,i}\Big).
$$

Clarke–de Silva–Thorley (2002) originally imposed orthogonality to a **single** market factor. Barra’s note generalizes the caveat: if alphas are *style* or *industry* tilts by design, orthogonality fails and Def 3 ceases to be a TC.

In Table 1, Volatility and Momentum show the largest Def3 shortfalls (0.57 and 0.61) among major styles—consistent with those factors being highly intertwined with the risk model’s own volatility and momentum factors, so “alpha” is largely systematic.

---

## 15. Reading the Long-Only Results as Constraint Shadow Prices

Although the note does not publish optimizer shadow prices, the Def-1 column of Table 2 is itself a sufficient statistic for long-only damage:

- Signals that are naturally long large-cap liquid names (Neglect TC = 0.98, Sector Momentum = 0.97) barely feel long-only at 2% active risk.
- Signals that want concentrated short exposure in names the benchmark holds heavily (Normalized E/P TC = 0.25; Size Nonlinearity = 0.23) are crippled.

This is exactly the Fundamental Law intuition that **TC captures the fraction of breadth/IC that survives constraints**. A shop running Normalized E/P in a long-only S&P 500 sleeve at 2% active risk should expect to realize only about a quarter of unconstrained IR—unless it relaxes the benchmark, raises active risk, or moves to a long–short vehicle.

Def 3 and Def 4 compress these already-low numbers further (Normalized E/P Def4 = 0.11), which would incorrectly suggest nearly total information destruction.

---

## 16. Implications for TC Monitoring Dashboards

A production TC dashboard consistent with the note would:

1. Always show **Def 1** (and optionally Def 1(B)) by strategy / sleeve / desk.
2. Show Def 3 only with a binary flag: “alphas residual? Y/N”; if N, gray out Def 3.
3. Attribute ΔTC day-over-day into: constraint binding changes, alpha–factor correlation changes, risk-model updates, and optimizer setting changes.
4. Pair TC with ex-ante IR and with predicted factor exposures so that a TC drop coincident with a new intentional factor bet is not misread as a construction bug.
5. For long-only books, report TC **by signal** (as in Table 2) rather than a single blended number.

---

## 17. What the Note Does *Not* Claim

- It does not claim Def 1 equals realized (ex-post) IR ratios.
- It does not optimize TC; it audits it.
- It does not derive the Fundamental Law identity; it cites Clarke–de Silva–Thorley for the residual definition.
- It does not study turnover or cost-adjusted TC (costs are named as a TC driver but not measured in the tables).
- It does not recommend a minimum acceptable TC; the tables are diagnostic.

---

## 18. Concise Equation Sheet for Implementers

| Symbol | Meaning |
|--------|---------|
| $h_A=h_P-h_B$ | Active weights |
| $\alpha$ | Benchmark-neutral alphas |
| $\Sigma=XFX^\top+\Delta$ | Factor risk model |
| $h_A^*=\lambda^{-1}\Sigma^{-1}\alpha$ | Unconstrained optimum |
| $\mathrm{IR}_P=\alpha^\top h_A/\sigma_A$ | Ex-ante IR |
| TC Def1 | $\mathrm{IR}_P/\mathrm{IR}_{P^*}$ |
| TC Def1B | $\mathrm{corr}(r_A,r_{A^*})$ |
| TC Def2 | $\mathrm{corr}(\Sigma^{-1/2}\alpha,\Sigma^{1/2}h_A)$ (mean-zero) |
| TC Def3 | $\mathrm{corr}(\alpha_i/\sigma_{sp,i},\,\sigma_{sp,i}h_{A,i})$ under residual/neutral |
| TC Def4 | $\mathrm{corr}(\alpha,h_A)$ — avoid |

---

## 19. Final Assessment

For a seven-page practitioner note, the empirical content is dense: two full tables spanning twelve USE3 styles and eleven Alphabuilder signals, under both unconstrained and long-only regimes. The theoretical content is a careful reconciliation of four TC formulas used in the industry. The actionable conclusion is unambiguous—**use the IR-ratio TC**—and is supported by clear counterexamples where popular shortcuts fail. Quantitative researchers implementing Fundamental-Law diagnostics should treat Def 3 as a special case, not the default.

---

## 20. Worked Numerical Illustration from Table 2 (Momentum vs Size Nonlinearity)

Consider two long-only style tilts at 2% active risk versus S&P 500 in June 2008.

**Momentum (Def1 TC = 0.93).** Almost all of the unconstrained IR survives long-only. Active positions demanded by a pure momentum tilt are largely achievable without shorting: winners can be overweighted and losers underweighted down toward zero without needing true shorts beyond the benchmark’s holdings. The residual gap (7% IR loss) is the typical long-only “short-budget” friction.

**Size Nonlinearity (Def1 TC = 0.23).** Only about one-quarter of unconstrained IR survives. A size-nonlinearity bet often wants exposures that conflict with capitalization-weighted benchmark holdings—precisely where long-only binds hardest. Def3 (0.19) and Def4 (0.12) would make the situation look even worse and could trigger false alarms about optimizer failure when the real issue is the interaction of the *signal geometry* with the long-only cone.

**Normalized E/P Alphabuilder (Def1 TC = 0.25)** tells the same story on the signal side: valuation signals that require shorting expensive benchmark heavyweights lose most of their transfer under long-only at low active risk.

These contrasts are the note’s most important empirical message for product design: **vehicle choice (long-only vs long–short) and active-risk budget are first-order TC determinants**, and they interact with signal identity.

---

## 21. Closing Synthesis

MSCI Barra’s December 2008 note is best read as a standards document for TC computation. It rehabilitates the IR-ratio definition, demotes residual and unadjusted correlations to conditional special cases, and supplies June 2008 evidence that the demotion is not pedantic. Implementers who already compute unconstrained and constrained ex-ante IRs can report TC at near-zero marginal cost—and should.
