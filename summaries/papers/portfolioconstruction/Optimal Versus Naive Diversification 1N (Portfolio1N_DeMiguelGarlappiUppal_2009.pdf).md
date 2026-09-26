# Optimal Versus Naive Diversification: How Inefficient is the 1/N Portfolio Strategy?

**Authors:** Victor DeMiguel (London Business School), Lorenzo Garlappi (University of Texas at Austin), Raman Uppal (London Business School and CEPR)  
**Publication:** *The Review of Financial Studies*, Vol. 22, No. 5, 2009, pp. 1915–1953  
**JEL:** G11  
**Source PDF:** `Portfolio1N_DeMiguelGarlappiUppal_2009.pdf`  
**Summary prepared:** 2026-09-23 (Scholar batch_2026-09-23_1)  
**OCR:** Not required; clean extract (~19,284 words of source)

---

## 1. Problem and Motivation

Markowitz mean–variance (MV) optimization is the theoretical foundation of portfolio choice, yet its out-of-sample record is notoriously poor. Estimation error in means (Merton 1980) and in covariances (Green–Hollifield 1992; Jagannathan–Ma 2003) produces unstable, extreme weights. A large literature proposes Bayesian shrinkage (Bayes–Stein), moment restrictions (minimum variance), missing-factor models (MacKinlay–Pastor), portfolio constraints, optimal combinations of portfolios (Kan–Zhou three-fund), and robust multi-prior rules.

DeMiguel, Garlappi, and Uppal ask a blunt question: relative to the *naive* $1/N$ rule that simply equal-weights all risky assets and rebalances, do any of these “optimal” rules win out of sample? Their answer, across 14 models and seven empirical datasets, is essentially **no**. None consistently beats $1/N$ on Sharpe ratio, certainty-equivalent (CEQ) return, or turnover. Analytically, the estimation window needed for sample MV to beat $1/N$ on CEQ is about **3,000 months** for 25 assets and **6,000 months** for 50 assets when calibrated to U.S. equity parameters—orders of magnitude longer than the 60–120 months used in practice. The paper is not an advocacy of $1/N$ as first-best; it is a diagnostic that estimation error still dominates the gains from optimization.

---

## 2. Setup and Data

### 2.1 Strategies (Table 1)

| # | Model | Abbreviation |
|---|-------|--------------|
| 0 | $1/N$ with rebalancing (benchmark) | ew / 1/N |
| 1 | Sample-based mean–variance | mv |
| 2 | Bayesian diffuse prior | (not reported; ≈ mv for M=60–120) |
| 3 | Bayes–Stein | bs |
| 4 | Bayesian Data-and-Model | dm |
| 5 | Minimum-variance | min |
| 6 | Value-weighted market | vw |
| 7 | MacKinlay–Pastor missing-factor | mp |
| 8 | MV with shortsale constraints | mv-c |
| 9 | Bayes–Stein with shortsale constraints | bs-c |
| 10 | Min-variance with shortsale constraints | min-c |
| 11 | Min-variance with generalized constraints | g-min-c |
| 12 | Kan–Zhou three-fund | mv-min |
| 13 | Mixture of min-var and $1/N$ | ew-min |
| 14 | Garlappi–Uppal–Wang multi-prior | (not reported; combination of mv & min) |

### 2.2 Datasets (Table 2)

| Dataset | $N$ | Period | Notes |
|---------|-------|--------|-------|
| S&P Sectors | 10+1 | 01/1981–12/2002 | + market |
| Industry | 10+1 | 07/1963–11/2004 | FF industries + mkt |
| International | 8+1 | 01/1970–07/2001 | MSCI countries + world |
| MKT/SMB/HML | 2+1 | 07/1963–11/2004 | factor portfolios |
| FF-1-factor | 20+1 | 07/1963–11/2004 | size-BM (excl. 5 largest) + mkt |
| FF-3-factor | 20+3 | same | + SMB, HML (results ≈ FF-1) |
| FF-4-factor | 20+4 | same | + UMD |
| Simulated | {10,25,50} | 2000 years | calibrated market model |

All returns are monthly excess over 90-day T-bill. Estimation windows $M\in\{60,120\}$ months; rolling out-of-sample evaluation.

### 2.3 Performance metrics

1. **OOS Sharpe:** $\widehat{\mu}_k/\widehat{\sigma}_k$ of strategy $k$’s excess returns; Jobson–Korkie (1981) tests vs $1/N$.
2. **CEQ:** $\widehat{\mu}_k-\frac{\gamma}{2}\widehat{\sigma}_k^2$ for a mean–variance investor (γ calibrated in paper).
3. **Turnover:** average absolute weight change per rebalance—proxy for trading cost.

In-sample MV Sharpe (using full sample) is reported as an upper bound on diversification gains absent estimation error.


---

## 3. Model and Methods

### 3.1 Sample mean–variance

With excess-return mean $\hat{\mu}$ and covariance $\hat{\Sigma}$ estimated on window $M$,
$$
w_{\text{mv}} = \frac{1}{\gamma}\hat{\Sigma}^{-1}\hat{\mu}
$$
(or the fully invested projection). Extreme weights are the rule, not the exception.

### 3.2 Bayes–Stein shrinkage

Shrink $\hat{\mu}$ toward the minimum-variance portfolio’s mean (Jorion):
$$
\hat{\mu}_{\text{BS}} = (1-\hat{w})\hat{\mu} + \hat{w}\hat{\mu}_{\text{min}}\mathbf{1},
$$
with $\hat{w}$ the standard Stein weight depending on $N$, $M$, and estimated Sharpe.

### 3.3 Minimum variance and constraints

$$
w_{\text{min}}=\frac{\hat{\Sigma}^{-1}\mathbf{1}}{\mathbf{1}'\hat{\Sigma}^{-1}\mathbf{1}},
$$
plus variants with $w\ge 0$ (Jagannathan–Ma) and generalized bound constraints. Min-variance avoids mean estimation error entirely.

### 3.4 MacKinlay–Pastor (2000)

Allows a missing factor; restricts mispricing to be “small,” which shrinks the covariance structure used in optimization.

### 3.5 Kan–Zhou (2007) three-fund

Optimal combination of sample tangency, minimum-variance, and risk-free—analytically accounting for estimation error in finite samples.

### 3.6 Analytical critical window length

The authors derive the estimation-window length $M^*$ such that expected CEQ of sample MV exceeds CEQ of $1/N$. $M^*$ increases in $N$ and decreases in the gap between true MV Sharpe and $1/N$ Sharpe. Calibrated to U.S. equities:
$$
M^*\approx 3000 \text{ months for } N=25, \qquad M^*\approx 6000 \text{ for } N=50.
$$
That is 250–500 *years* of stationary data—an impossibility. This closed-form result is the paper’s sharpest theoretical contribution.

### 3.7 Extreme two-asset illustration

True means both 8%, vols 20%, correlation 0.99 ⇒ optimal weights 50/50. Misestimate one mean as 9%: MV recommends **635% / −535%**. Tiny mean errors explode when assets are highly correlated—the practical pathology of MV.


---

## 4. Empirical Results (with Numbers)

### 4.1 Table 3 — Monthly OOS Sharpe ratios (selected)

| Strategy | S&P sec N=11 | Industry N=11 | Int’l N=9 | MKT/SMB/HML N=3 | FF-1 N=21 | FF-4 N=24 |
|----------|--------------|---------------|----------|-----------------|-----------|-----------|
| **1/N** | **0.1876** | **0.1353** | **0.1277** | **0.2240** | **0.1623** | **0.1753** |
| mv (in-sample) | 0.3848 | 0.2124 | 0.2090 | 0.2851 | 0.5098 | 0.5364 |
| mv (OOS) | 0.0794 | 0.0679 | −0.0332 | 0.2186 | 0.0128 | 0.1841 |
| bs | 0.0811 | 0.0719 | −0.0297 | 0.2536 | 0.0138 | 0.1791 |
| min | 0.0820 | 0.1554 | 0.1490 | 0.2493 | 0.2778 | −0.0183 |
| min-c | 0.0834 | 0.1425 | 0.1501 | 0.2493 | 0.1546 | **0.3580** |
| g-min-c | 0.1371 | 0.1451 | 0.1429 | 0.2467 | 0.1615 | 0.3028 |
| ew-min | 0.1208 | 0.1576 | 0.1407 | 0.2503 | 0.2608 | −0.0161 |

Parentheses in the paper are Jobson–Korkie p-values for difference vs $1/N$.

**Facts:**

- In-sample MV Sharpe is often 2–3× $1/N$ (e.g., 0.38 vs 0.19 on S&P sectors; 0.54 vs 0.18 on FF-4)—large *potential* gains.
- OOS sample MV collapses: 0.079 vs 0.188 on sectors; **−0.033** vs 0.128 internationally.
- Bayes–Stein barely improves on sample MV.
- Best optimizer on Sharpe is typically **constrained min-variance (min-c / g-min-c)**—consistent with Jagannathan–Ma.
- Even min-c is statistically superior to $1/N$ in **only one** of seven datasets (FF-4-factor, Sharpe 0.358 vs 0.175, p≈0.00). Elsewhere p-values are large.

### 4.2 CEQ and turnover (Tables 4–5, qualitative with key points)

- CEQ: no strategy is statistically superior to $1/N$ on *any* dataset at conventional significance in the authors’ tests.
- Turnover: $1/N$ has the lowest turnover by construction (only rebalancing drift). Optimizing models, especially unconstrained MV/BS, turn over several times more per month—so after realistic costs their underperformance worsens.
- Constrained policies cut turnover vs unconstrained but still exceed $1/N$.

### 4.3 Simulation results

Simulated markets calibrated so true MV Sharpe exceeds $1/N$ Sharpe:

- Optimizers beat $1/N$ only when $M$ is very large, $N$ is small, and the true Sharpe gap is wide.
- For $N=25$ and $N=50$ with realistic Sharpe gaps, required $M$ matches the analytical 3000–6000-month ballpark.
- Constrained and Bayesian rules reduce but do not eliminate the required-window problem.

### 4.4 When does optimization win?

The paper’s synthesis: optimizers need **(i)** long estimation windows, **(ii)** large true Sharpe advantage of MV over $1/N$, and **(iii)** small $N$. Condition (iii) matters because fewer parameters mean less estimation error *and* because $1/N$ diversifies less effectively when $N$ is tiny. Factor-portfolio datasets with $N=3$ are the friendliest to optimization—and even there wins are marginal.


---

## 5. Limitations

1. **$1/N$ on what universe?** Equal-weighting 25 FF portfolios is not the same as equal-weighting 500 stocks; results depend on the menu. If the menu is itself optimized (factor portfolios), $1/N$ inherits structure.
2. **No transaction-cost-optimized rules.** Turnover is reported but strategies are not cost-aware (contrast Gârleanu–Pedersen 2013).
3. **Stationarity assumed** in analytics and simulations; breaks, rare disasters, and regime shifts hurt optimizers more.
4. **γ and CEQ calibration** affect rankings modestly; Sharpe rankings are primary.
5. **Post-2004 data** (paper samples end ~2001–2004) include crises that may further punish high-turnover rules.
6. **Not a proof that $1/N$ is optimal**—only that listed competitors fail OOS. Better priors, ML forecasts, or economic restrictions might still win.

---

## 6. Practical Takeaways for a Quant Investor

1. **Default benchmark is $1/N$, not MSCI VW.** Any “optimal” allocation must beat equal weight on risk-adjusted return *after costs*.
2. **If you optimize, drop the means first.** Constrained min-variance is the least bad optimizer—never sample tangency.
3. **Small-$N$ problems only.** Optimizing across 3–10 liquid futures or asset classes can work; optimizing across 50 stocks on sample moments will not without strong structure.
4. **Required history is fantasy.** If your backtest uses 5–10 years to estimate MV with $N=25$, you are in the zone where theory predicts $1/N$ wins—believe the theory.
5. **Mixture rules.** ew-min (blend min-var and $1/N$) is a pragmatic compromise: some risk optimization, limited estimation damage.
6. **Turnover kills.** A strategy with Sharpe equal to $1/N$ but 10× turnover loses after costs. Report net Sharpes.
7. **Strategic vs tactical.** The paper is about *cross-sectional* allocation among a fixed menu. It does not kill factor timing or alpha models with economic signal structures—but it does kill naive MV overlays on those signals without shrinkage and cost control.

---

## 7. Key Equations

**Critical window (schematic):** $M^*=M^*(N, SR_{\text{mv}}, SR_{1/N})$ with $\partial M^*/\partial N>0$, $\partial M^*/\partial(SR_{\text{mv}}-SR_{1/N})<0$.

**CEQ:** $\text{CEQ}_k=\hat{\mu}_k-\frac{\gamma}{2}\hat{\sigma}_k^2$.

**Jobson–Korkie test** for $\Delta SR=0$ between strategies (with Memmel correction as used in the literature).

**$1/N$ weights:** $w_i=1/N$ each rebalance date.

---

## 8. Deeper Discussion of Why Bayesian Methods Disappoint

Bayes–Stein and Data-and-Model approaches should, in principle, dominate sample MV. Empirically they do—but only slightly, and not enough to beat $1/N$. Reasons:

- Stein shrinkage helps means but leaves noisy $\hat{\Sigma}$ and still permits extreme weights when correlations are high.
- Diffuse Bayesian predictive distributions with $M\approx N$ remain diffuse; posterior portfolio weights inherit that uncertainty as large OOS volatility.
- When the true MV advantage over $1/N$ is modest (typical among industry portfolios), even a perfect Bayesian who knows the prior family needs huge $M$ to detect it.

Kan–Zhou’s three-fund rule, designed explicitly for estimation error, also fails to dominate consistently—showing the problem is deep, not just “people forgot to use Bayes.”

### 8.1 Jagannathan–Ma connection

min-c is the best Sharpe competitor, validating Jagannathan–Ma: constraints help. But DeMiguel et al. show that “help” ≠ “beat $1/N$ statistically.” Constraints are necessary hygiene; they are not a license to claim optimization victory.

### 8.2 Value-weighted vs $1/N$

VW underperforms $1/N$ on several datasets (e.g., sectors Sharpe 0.144 vs 0.188) because VW concentrates in large caps. $1/N$’s implicit small-size tilt can be a confounding “alpha.” A fair test for a large-cap mandate might constrain the universe to large caps before equal-weighting. The paper’s broader point survives: among rules that do not use economically motivated expected-return views, naive diversification is hard to beat.


---

## 9. Simulation Design Details

The market-model simulation generates factor and residual returns with calibrated $\beta$, idiosyncratic vols, and risk premia so that the population MV Sharpe and $1/N$ Sharpe match U.S. historical magnitudes. For each $(N,M)$, many paths are drawn; OOS CEQ and Sharpe distributions are compared. Heatmaps (in the paper) show a frontier: above a critical $M(N)$, MV wins in expectation; below, $1/N$ wins. Real-world $(N,M)=(25,60)$ or $(50,120)$ sit deep in the $1/N$-wins region unless the true Sharpe gap is unrealistically large (e.g., if assets include a truly unpriced factor you can short—i.e., if the menu embeds large alpha).

This clarifies when optimization *should* work: portable-alpha books with high IR signals and small $N$, not strategic allocation across 30 similar equity sectors.

---

## 10. Replication Checklist

1. Build excess-return panels for the seven datasets (Ken French; MSCI; Wessels sectors).
2. Rolling windows $M=60$ and $M=120$; hold one month; roll forward.
3. Implement all 14 rules; for constrained QPs use a reliable solver.
4. Compute Sharpe, CEQ (γ=1 and γ=2 as sensitivity), turnover.
5. Jobson–Korkie p-values vs $1/N$.
6. Match Table 3 first row (1/N Sharpes) as a data checksum: sectors ~0.19, industry ~0.14, international ~0.13, FF-1 ~0.16.

---

## 11. Implications for Machine-Learning Allocators

Modern ML expected-return models reduce mean error but can *increase* overfitting. The paper’s logic still applies: the optimizer amplifies whatever noise remains in $\hat{\mu}$ when $\hat{\Sigma}$ is ill-conditioned. Pairing ML signals with:

- strong covariance shrinkage or factor structure,
- position caps / long-only,
- turnover penalties (Gârleanu–Pedersen),
- and an explicit $1/N$ or EW-min benchmark,

is the right industrial response. “Neural net + raw MV” is a repeat of 0.079 vs 0.188.

---

## 12. Relation to Sibling Papers

| Paper | Link |
|-------|------|
| Jagannathan–Ma 2003 | min-c is their rule; best of the optimizers here |
| Asness–Frazzini–Pedersen 2012 | RP is risk-space diversification; still must beat simple benchmarks OOS |
| Gârleanu–Pedersen 2013 | how to trade *when* you have predictors—cost-aware dynamic policy |
| Giglio–Xiu | high-dimensional factor recovery—helps $\Sigma$ and risk premia, not a free pass on MV |

---

## 13. Extended Numerical Walk-Through (S&P Sectors)

- Potential gain: in-sample MV SR 0.3848 vs 1/N 0.1876 ⇒ +0.20 monthly SR if means/cov known.
- Realized: OOS MV SR 0.0794 ⇒ *worse* than 1/N by 0.11.
- Estimation-error destruction: 0.3848 → 0.0794, a loss of 0.30 SR—larger than the entire potential diversification gain.
- Constrained MV (mv-c): 0.0892—still far below 1/N.
- g-min-c: 0.1371—closer but p=0.08, not a clear win.
- Conclusion on this dataset: do not optimize; equal-weight sectors (or use views not based on sample means).

International dataset is harsher: OOS MV SR negative. Cross-country mean differences estimated on 60 months are noise dominated.

FF-4-factor is the exception: min-c SR 0.358 vs 1/N 0.175 with p=0.00. Why? The menu includes momentum (UMD) and other factors with persistent return differences; min-variance with constraints may tilt toward stable low-vol combinations that harvest some of that structure without estimating means. Even here, CEQ significance fails, and turnover exceeds 1/N.

---

## 14. Bottom Line

DeMiguel, Garlappi, and Uppal deliver the definitive horse race of their era: among standard optimizers, **none consistently beats $1/N$** out of sample on Sharpe, CEQ, or turnover. The analytical critical estimation window—thousands of months—explains why. For a quant investor, $1/N$ (or risk-parity-style naive diversification) is the correct null; constrained minimum variance is the least bad alternative when optimization is mandatory; sample mean–variance is unacceptable. There remain “miles to go” before optimal diversification’s theoretical gains are harvestable in realistic samples.


---

## 15. Methodological Notes on Out-of-Sample Design

The rolling-window design avoids look-ahead but induces overlapping estimation error across adjacent months. Jobson–Korkie statistics as implemented remain standard in this literature. An alternative is to use non-overlapping annual rebalances (as in Jagannathan–Ma); DeMiguel et al. prefer monthly to increase power. Sensitivity checks in the paper (different $M$, γ) do not overturn the main ranking.

Trimming extreme weights (e.g., winsorizing $w_i$ at ±50%) is *not* among the 14 rules; it would likely improve unconstrained MV but is philosophically a form of constraint already covered by mv-c / g-min-c.

Missing-factor model (mp) performs unevenly (sectors SR 0.186—almost tying 1/N with p=0.44; industry 0.053 with p=0.04 against it). When the missing-factor restriction is misspecified relative to the true data-generating process, it can hurt more than help—another warning against fragile structural assumptions.

Data-and-Model Bayesian (dm) with $\sigma_\alpha=1\%$ monthly prior on mispricing similarly fails to dominate. Tighter priors might help but then the method converges to an almost dogmatic model portfolio—i.e., success would come from the prior, not from learning $\mu$ from data.

---

## 16. What Would Change the Conclusion?

Optimization could beat $1/N$ if:

1. **True alpha is large and persistent** (high IR signals), so $SR_{\text{mv}}-SR_{1/N}$ is huge and $M^*$ falls into the available sample.
2. **$N$ is tiny** (2–5 assets), e.g., stock/bond/commodity strategic mix with shrunk moments.
3. **Means are replaced by economics** (Black–Litterman equilibrium + views; risk premia from Giglio–Xiu-style estimators), not sample averages.
4. **Costs are modeled in the objective** and trading is slowed optimally.
5. **Covariance is dominated by a stable factor model** with $N$ large but effective dimension small—and weights are constrained.

The paper’s negative result is therefore best read as: *sample-moment MV and its close cousins lose to $1/N$*. It is not a nihilistic claim that all portfolio theory is useless.

---

## 17. Desk Policy One-Pager

| Situation | Policy |
|-----------|--------|
| Strategic allocation, $N\le 10$ asset classes | Risk parity or constrained min-var; benchmark 1/N and 60/40 |
| Sector allocation, $N\sim 10$ | Default 1/N; tilt only with explicit views |
| Stock selection, $N\sim 100+$ | Long-only constrained risk model + alpha; never sample MV |
| Factor portfolio mix, $N\sim 3–5$ | Light optimization OK; still report 1/N |
| Any optimizer | Publish OOS Sharpe, CEQ, turnover vs 1/N with JK p-values |

---

## 18. Final Verdict

The phrase “miles to go” in the abstract is earned. Until estimation windows, signal quality, or economic restrictions fundamentally change the $M^*(N)$ calculus, naive diversification remains the surprisingly strong baseline. Quants should spend less time polishing sample MV and more time on better expected-return *views*, cost-aware trading, and honest benchmarking against $1/N$.


---

## 19. Full Sharpe Matrix Commentary

Reading Table 3 column by column clarifies when optimization has any hope.

**S&P Sectors (N=11).** 1/N SR=0.1876. Every unconstrained optimizer is worse (mv 0.079, bs 0.081, min 0.082). Constrained rules improve (g-min-c 0.137) but remain below 1/N. The in-sample MV SR of 0.385 shows the *illusion* of diversification gains that estimation error completely erases.

**Industry (N=11).** 1/N=0.1353. Here unconstrained min (0.155) and ew-min (0.158) slightly exceed 1/N, but JK p-values are 0.30 and 0.21—noise. mv and bs remain near 0.07.

**International (N=9).** 1/N=0.1277. Sample MV goes negative (−0.033). Country expected returns estimated on 5–10 years are dominated by whatever local bull/bear market fell in-sample. Constrained min (~0.15) looks better but insignificant (p=0.16).

**MKT/SMB/HML (N=3).** Friendliest environment: 1/N=0.224. bs reaches 0.254 (p=0.25), min 0.249 (p=0.23). Small N helps, yet still no statistical victory.

**FF-1-factor (N=21).** 1/N=0.1623. Unconstrained min hits 0.278 (p=0.01)—one of the few significant *improvements*—but on FF-4 the same unconstrained min collapses to −0.018, showing fragility. Constrained min-c on FF-1 is only 0.155 (below 1/N).

**FF-4-factor (N=24).** 1/N=0.1753. min-c 0.358 (p=0.00) and g-min-c 0.303 (p=0.00) are the paper’s clearest optimizer wins on Sharpe. Presence of UMD and richer factor structure likely helps risk-based rules. CEQ tests still fail to show significance, and turnover remains higher than 1/N.

Pattern: **wins are rare, dataset-specific, and concentrated in constrained risk-based rules**—never in sample MV.

---

## 20. Certainty Equivalent and Risk Aversion

CEQ = μ − (γ/2)σ² converts performance into a utility metric. For investors with high γ, reducing variance matters more; min-variance rules should look better. Even then, the paper finds no consistent CEQ dominance over 1/N. Interpretation: the OOS variance reduction from optimizers is either small or accompanied by mean degradation that offsets utility gains. 1/N’s diversification, while naive in theory, delivers a competitive μ–σ pair without estimation damage.

---

## 21. Turnover Arithmetic Example

Suppose 1/N turns over 2% of NAV per month (drift rebalance) and constrained MV turns over 20%. At 20 bps one-way cost, monthly cost drag is 0.004% vs 0.04% (about 0.5% vs 5% annualized). A strategy needing +0.05 OOS Sharpe to justify itself before costs may need +0.15 after costs. None of the Table 3 optimizers clear that bar reliably. Cost-aware dynamic policies (Gârleanu–Pedersen) are the logical next layer once a signal exists; they are not a rescue for sample MV.

---

## 22. Analytical Derivation Intuition for M*

Expected CEQ of sample MV equals true MV CEQ minus a penalty term that grows with $N/M$ (estimation noise in $\hat{\mu}$ and $\hat{\Sigma}^{-1}$). Expected CEQ of 1/N equals the population CEQ of equal weights (no estimation penalty). Setting them equal and solving for $M$ yields $M^*$ linear in $N$ to leading order when means dominate the error—hence 3000 vs 6000 months when $N$ doubles from 25 to 50. If idiosyncratic variance is high and correlations low, 1/N’s population CEQ rises and $M^*$ grows further. If a few assets have huge true alpha, $M^*$ shrinks—optimization pays when the menu embeds large, stable return differences known to the econometrician only through long samples.

---

## 23. Historical Impact

This paper became a standard citation for humility in portfolio optimization and a staple referee comment (“please compare to 1/N”). It shifted industry and academic practice toward: (i) reporting 1/N benchmarks, (ii) preferring risk-based to mean-based rules, (iii) combining naive and optimized portfolios (Tu–Zhou “three-fund” / combination strategies). Pairing it with Jagannathan–Ma and Kan–Zhou gives a coherent 2000s toolkit: constrain, shrink, combine, and still expect 1/N to be hard to beat.

---

## 24. Closing

DeMiguel, Garlappi, and Uppal quantify how far practice sits from Markowitz theory under estimation error. The numbers—critical windows of thousands of months, OOS MV Sharpes collapsing from 0.38 to 0.08, and only sporadic constrained-min-variance victories—should govern any proposal to “optimize” a cross-section from sample moments alone.


---

## Additional Discussion

Out-of-sample stability across subperiods deserves explicit attention. Splitting the evaluation window into early and late halves and recomputing Sharpe ratios, CEQ, and turnover for each strategy reveals whether any apparent victory over 1/N is period-specific. In practice, many optimizers that look acceptable over a full sample fail in one of the halves, especially around regime shifts in volatility or correlation. A discipline worth adopting is to require that a candidate rule beat 1/N in both halves on at least one risk-adjusted metric before promoting it to production capital.

Cross-validation for portfolio rules differs from supervised learning because labels (future returns) are weak and highly noisy. Still, a rolling scheme that chooses hyperparameters—shrinkage intensity, constraint bounds, mixture weights between 1/N and minimum variance—on a validation segment and freezes them for the next test segment can reduce researcher degrees of freedom. DeMiguel, Garlappi, and Uppal essentially evaluate fixed rules; adding a meta-layer of selection without careful nesting would overstate performance. Nested walk-forward evaluation is the correct industrial analogue of their horse race.

From a governance perspective, investment committees often demand an 'optimized' policy because equal weighting appears unsophisticated. The right response is to show Table-3-style evidence: in-sample MV looks brilliant, out-of-sample MV fails, and 1/N or constrained risk parity survives. Framing 1/N as a robust Bayesian limit under diffuse priors on means can help committees accept simplicity. When political constraints require optimization theater, implementing constrained minimum variance with a hard 1/N fallback when estimated Sharpe gaps are insignificant is a defensible compromise.

Transaction costs, market impact, and short-sale fees widen the advantage of low-turnover naive rules. Even if an optimizer matches 1/N on gross Sharpe, net Sharpe typically favors 1/N unless the optimizer explicitly penalizes turnover. Combining the lessons of this paper with dynamic trading models that aim in front of the target and trade partially toward it is the modern synthesis: use economic signals for direction, but respect estimation error and costs in the mapping to positions.

Asset-menu construction is itself a form of optimization. Choosing ten industries rather than five hundred stocks embeds massive dimension reduction before 1/N is applied. Critics sometimes argue that 1/N 'wins' only because the menu is pre-diversified. That critique has bite for FF factor portfolios, but the paper also studies sector and international menus where 1/N still prevails. The practical lesson is dual: care about the menu, and still benchmark allocation rules within that menu against equal weight.

Statistical power is limited: with a few hundred overlapping monthly OOS returns, Jobson–Korkie tests rarely reject equality even when point estimates differ by 0.05 Sharpe. Absence of significance cuts both ways—one cannot claim optimizers are significantly worse in every cell either. The authors therefore emphasize consistency of signs and economic magnitudes across datasets, not only p-values. For decision-making, consistent underperformance of sample MV is enough to abandon it; inconsistent small edges for constrained min-variance are enough to treat it as optional, not mandatory.

Finally, pedagogy: this paper should be taught immediately after Markowitz. Students who see only the in-sample frontier leave with false confidence. Pairing the efficient-frontier diagram with Table 3's OOS collapse inoculates against optimizer worship. The analytical M* formula then explains the collapse quantitatively. Together they form one of the most important cautionary results in empirical finance.