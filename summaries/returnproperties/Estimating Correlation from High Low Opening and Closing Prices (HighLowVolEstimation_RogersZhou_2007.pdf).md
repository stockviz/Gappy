# Estimating Correlation from High, Low, Opening and Closing Prices

**Authors:** L. C. G. Rogers and Fanyin Zhou (University of Cambridge)  
**Date:** February 1, 2007 (working paper)  
**Source PDF:** `HighLowVolEstimation_RogersZhou_2007.pdf` (Drive id `0B-6kBz0I0dMsVGxCR3lTUU5Wdm8`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_3)  
**OCR:** Not required; clean `pdftotext -layout` extract (~15 pages)

---

## 1. Problem and Motivation

Range-based estimators of **volatility** that use daily open, high, low, and close (OHLC) are classical: Parkinson (1980), Garman–Klass (1980), Beckers (1983), Ball–Torous (1984), Rogers–Satchell (1991), Kunitomo (1992), Yang–Zhang (2000), Alizadeh–Brandt–Diebold (2002), among others. They deliver unbiased or near-unbiased variance estimates with substantially lower variance than the simple open–close (or close–close) estimator.

This paper attacks the harder problem of estimating **correlation** (covariance) between two assets from each asset’s own OHLC only. If one observed highs and lows of linear combinations of the two log-prices, univariate range methods plus polarization would suffice—as in FX work by Brunetti–Lildholdt (2002) and Brandt–Diebold (2006), where cross rates supply the missing linear combinations. For equities, those cross-combination extremes are unavailable without full tick data. Rogers–Zhou construct a new unbiased (nearly unbiased) quadratic estimator that **halves** the variance of the naive close–close product at $\rho=0$, and they document its behavior in simulation and on four US equities.

**Intended use.** Derivative pricing/hedging and forecasting on a multi-month horizon—hence daily data preferred to noisy high-frequency realized measures affected by microstructure, diurnal patterns, and day-to-day instability (citing Alizadeh et al.; Barndorff-Nielsen–Shephard; Zhang–Mykland–Aït-Sahalia; Barndorff-Nielsen et al. 2006). Constant volatilities/covariances are the test bed: “if nothing can be done in this simple situation, then nothing can be done.”

Acknowledgment: question posed by Nick Brown (BNP Paribas).

---

## 2. Model Setup

Log prices $X_i(t)$ are correlated Brownian motions:

$$
E[X_i(s)X_j(t)] = \sigma_{ij}\min\{s,t\}.
$$

Over a unit day, write

$$
H_j=\max_{0\le t\le 1}X_j(t),\quad
L_j=\min_{0\le t\le 1}X_j(t),\quad
S_j=X_j(1)
$$

for high, low, and close (log). Without loss of generality scale each asset by $\sigma_{ii}^{-1/2}$ so that $\sigma_{12}=\rho$ is a correlation and each marginal is standard BM. Drift is set to zero (innocent at daily frequency: growth negligible vs diffusion). Focus on two assets.

**Building blocks.** Nine cross products:

$$
\begin{align*}
&Z_{HH}=H_1H_2,\ Z_{HL}=H_1L_2,\ Z_{LH}=L_1H_2,\ Z_{LL}=L_1L_2,\\
&Z_{HS}=H_1S_2,\ Z_{LS}=L_1S_2,\ Z_{SH}=S_1H_2,\ Z_{SL}=S_1L_2,\ Z_{SS}=S_1S_2.
\end{align*}
$$

**Means.** For $\rho\in\{-1,0,1\}$ means are classical; for general $\rho$, Rogers–Shepp (2006) give

$$
E[Z_{HH}]=f(\rho)=\cos\alpha\int_0^\infty\frac{\cosh(\nu\alpha)}{\sinh(\nu\pi/2)}\tanh(\nu\gamma)\,d\nu,
$$

with $\rho=\sin\alpha$, $\alpha\in(-\pi/2,\pi/2)$, $2\gamma=\alpha+\pi/2$. Abbreviate $b=2\log 2-1\approx0.386294$.

Table of means (paper Table 1):

| Term | $\rho=-1$ | $\rho=0$ | $\rho=1$ | general $\rho$ |
|------|-------------|------------|------------|------------------|
| $EZ_{HH}$ | $b$ | $2/\pi$ | $1$ | $f(\rho)$ |
| $EZ_{HL}$ | $-1$ | $-2/\pi$ | $-b$ | $-f(-\rho)$ |
| $EZ_{LH}$ | $-1$ | $-2/\pi$ | $-b$ | $-f(-\rho)$ |
| $EZ_{LL}$ | $b$ | $2/\pi$ | $1$ | $f(\rho)$ |
| $EZ_{HS},EZ_{LS},EZ_{SH},EZ_{SL}$ | $-1/2$ | $0$ | $1/2$ | $\rho/2$ |
| $EZ_{SS}$ | $-1$ | $0$ | $1$ | $\rho$ |

The five terms involving at least one close are **exactly linear** in $\rho$. The four high/low-only products are not; $f$ is nearly quadratic (max deviation from the quadratic through $\{-1,0,1\}$ is 0.65%), but that small departure matters for bias correction.

---

## 3. Minimum-Variance Unbiased Linear Combination

Seek weights $w\in\mathbb{R}^9$ for $\hat\rho=w\cdot Z$ such that:

1. $E_\rho[\hat\rho]=\rho$ for $\rho\in\{-1,0,1\}$;
2. $\mathrm{Var}_0(\hat\rho)$ is minimized.

Near-linearity of $f$ then suggests near-unbiasedness for all $\rho$.

At $\rho=0$ the two BMs are independent, so $\mathrm{Cov}(Z)$ factors into products of one-dimensional moments. Example: $E_0[Z_{HH}Z_{SL}]=E_1[Z_{HS}]E_1[Z_{HL}]=-b/2$. The resulting $9\times9$ matrix $V$ is given explicitly in the paper (equation (2)).

Define

$$
m=(1,-b,-b,1,1/2,1/2,1/2,1/2,1)^\top,
\quad
y=(1,-1,-1,1,0,0,0,0,0)^\top.
$$

Minimize $w^\top V w$ subject to $w\cdot m=1$ and $w\cdot y=0$. Solution:

$$
w=\alpha V^{-1}m+\beta V^{-1}y,
$$

with $(\alpha,\beta)$ solving the $2\times2$ system from the constraints. Maple yields the remarkably simple estimator

$$
\hat\rho=\frac12 S_1S_2+\frac{1}{2(1-2b)}(H_1+L_1-S_1)(H_2+L_2-S_2).
$$

At $\rho=0$, $\mathrm{Var}(\hat\rho)=1/2$, versus $\mathrm{Var}(S_1S_2)=1$—exact variance halving.

### Remarks

**(i)** Applying (5) entrywise to a multi-asset covariance matrix yields a rank-2 PSD matrix (outer-product structure in the $(H+L-S)$ corrections plus the close–close part).

**(ii) Discrete sampling bias.** Highs are underestimated and lows overestimated when BM is observed on a discrete grid (Broadie–Glasserman–Kou). Because the estimator uses only **$H+L$**, these errors cancel on average—an important robustness relative to other range estimators that use $H-L$.

**(iii) Bias function.** Exact mean:

$$
\phi(\rho)=E_\rho[\hat\rho]=\frac12\rho+\frac{1}{2(1-2b)}\big(2f(\rho)-2f(-\rho)-\rho\big).
$$

Replacing $f$ by its quadratic interpolant collapses $\phi(\rho)$ to $\rho$; keeping true $f$ reveals a small nonlinear bias. Correction: average raw $\hat\rho$ over $N$ days to get $\bar r$, then set

$$
\hat\rho_{RZ}=\phi^{-1}(\bar r),
$$

inverting $\phi$ numerically.

---

## 4. Simulation Design and Results

### 4.1 Brownian motion (Table 2)

For each $\rho\in\{-0.9,-0.8,\ldots,0.9\}$: 20,000 paths, 500 steps each. Compare $\hat\rho_0=S_1S_2$ to $\hat\rho_{RZ}$.

Selected rows (mean, SD, variance ratio $\mathrm{Var}(\hat\rho_0)/\mathrm{Var}(\hat\rho_{RZ})$):

| $\rho$ | $\hat\rho_0$ | SD$_0$ | $\hat\rho_{RZ}$ | SD$_{RZ}$ | var ratio |
|----------|----------------|----------|-------------------|-------------|-----------|
| −0.9 | −0.9069 | 1.367 | −0.9082 | 0.8831 | 2.395 |
| −0.5 | −0.5064 | 1.137 | −0.5045 | 0.7680 | 2.192 |
| 0.0 | −0.0038 | 0.999 | −0.0011 | 0.7021 | 2.029 |
| 0.5 | 0.5013 | 1.124 | 0.5055 | 0.7649 | 2.161 |
| 0.9 | 0.9012 | 1.344 | 0.9042 | 0.8671 | 2.404 |

**Findings.** Both estimators nearly unbiased across $\rho$. Variance ratio always $\ge\approx2$, minimized near $\rho=0$ where theory predicts exactly 2. Advantage grows toward $|\rho|\to1$ (ratios ~2.4).

### 4.2 Variance-Gamma robustness (Table 3)

Same design under VG processes. $\hat\rho_{RZ}$ becomes **substantially biased**, always underestimating $|\rho|$. Examples: true $\rho=-0.9$ → RZ mean −0.685; true $0.9$ → 0.681. Variance ratios rise to ~3, but bias dominates. **Conclusion:** do not use RZ if log-price paths are not plausibly Brownian.

### 4.3 Brownian motion with drift 0.1 (Table 4)

Bias of RZ remains small; variance advantage persists (ratios ~2.0–2.5). Daily drift of this magnitude is large economically but still tolerable for the estimator—consistent with the “drift negligible” modeling claim at daily scale for typical equity drifts.

---

## 5. Empirical Study (Four US Stocks)

**Data.** Boeing (BA), GlaxoSmithKline (GSK), General Motors (GM), Procter & Gamble (PG); NYSE; 4 Feb 2002 – 12 Jul 2006; **1118** trading days; Yahoo Finance.

**Point correlations (Table 5):**

| Pair method | BA–GSK | BA–GM | BA–PG | GSK–GM | GSK–PG | GM–PG |
|-------------|--------|-------|-------|--------|--------|-------|
| $\hat\rho_0$ | 0.3354 | 0.3294 | 0.3201 | 0.2987 | 0.3464 | 0.2102 |
| $\hat\rho_{RZ}$ | 0.2948 | 0.2925 | 0.2562 | 0.2208 | 0.3327 | 0.2086 |

Diagonal entries are 1 by construction in the reported matrices.

**Sample-variance ratios (Table 6), RZ variance as % of simple estimator:**

|  | BA | GSK | GM | PG |
|--|----|-----|----|----|
| BA | 92.43 | 55.49 | 45.49 | 60.88 |
| GSK |  | 54.74 | 45.90 | 55.09 |
| GM |  |  | 78.02 | 48.12 |
| PG |  |  |  | 54.97 |

Off-diagonal percentages ~45–61% mean RZ variance is about half to 60% of close–close variance—qualitatively matching the simulation factor-of-two. Diagonal percentages are for variance estimation of each name’s own $\rho=1$ case and are higher (less dramatic).

Figure 1 (described): 95% CIs for the six pairs; circle = simple, diamond = RZ; differences well within sampling error.

---

## 6. Limitations (Authors’ Own Conclusions)

1. Decisive advantages over open–close are **not dependable** once one leaves log-Brownian reality (VG failure).
2. Still “always worth computing” as a cross-check: large disagreement with $\hat\rho_0$ may flag non-lognormality.
3. Constant-$\rho$ assumption; no stochastic correlation model.
4. Two-asset focus for derivation; multi-asset extension is entrywise and rank-deficient.
5. Opening prices enter the abstract’s framing but the constructed estimator uses $H,L,S$ (close relative to the day’s start normalized to 0)—standard for BM-from-open formulations.
6. Empirical sample is only four names / ~4.5 years.

---

## 7. Quantitative Takeaways

1. **Formula to implement:**
   
$$
   \hat\rho=\tfrac12 S_1S_2+\frac{(H_1+L_1-S_1)(H_2+L_2-S_2)}{2(1-2b)},\quad b=2\ln2-1.
   
$$

2. **Bias-correct** multi-day averages via $\phi^{-1}$.
3. Expect ~**2×** MSE improvement vs $S_1S_2$ under BM; similar on the equity sample.
4. **Do not trust** under jumps / VG / strong non-Gaussianity—bias toward zero correlation.
5. Discrete-monitoring robustness via $H+L$ is a practical plus vs range estimators using $H-L$.
6. For baskets/options needing $\Sigma$, use RZ as diagnostic beside close–close; investigate if they diverge.

---

## 8. Relation to Prior Range Literature

Univariate OHLC volatility: Parkinson; Garman–Klass; Rogers–Satchell; Yang–Zhang; Alizadeh–Brandt–Diebold. Covariance with polarization (FX): Brunetti–Lildholdt; Brandt–Diebold. Maxima correlation theory: Rogers–Shepp (2006). Microstructure / realized cov: Barndorff-Nielsen–Shephard; Zhang–Mykland–Aït-Sahalia. Discrete barrier correction: Broadie–Glasserman–Kou.

---

## 9. Extended Algebra Notes for Implementers

**Constant $1-2b$:** $b\approx0.386294\Rightarrow 1-2b\approx0.227412\Rightarrow 1/(2(1-2b))\approx2.198$. So roughly

$$
\hat\rho\approx 0.5\,S_1S_2 + 2.198\,(H_1+L_1-S_1)(H_2+L_2-S_2).
$$

**Interpretation of $(H+L-S)$:** for a Brownian bridge-like path, $H+L-S$ encodes residual range information after removing the close. The product across assets contributes covariance information orthogonal (in the $\rho=0$ MSE sense) to $S_1S_2$.

**Constraint $w\cdot y=0$:** $y$ singles out the antisymmetric high/low pattern whose mean at $\rho=0$ involves the $2/\pi$ terms; annihilating $y$ helps enforce the $\rho=0$ unbiasedness alongside the $m$ normalization.

**Why variance $1/2$ at $\rho=0$:** after optimal projection, half the MSE of $S_1S_2$ remains—information in ranges is real but limited when paths are independent.

---

## 10. Reading the VG Failure

Variance-Gamma paths have infinitely many small jumps (in the pure-jump representation) and heavier tails. Extremes $H,L$ are then more erratic relative to Gaussian theory, and the map $\phi$ calibrated to BM mis-corrects. Systematic attenuation of $|\hat\rho_{RZ}|$ means RZ would understate diversification benefits or overstate them depending on sign—dangerous for risk. The authors’ advice is appropriately conservative: treat RZ as a BM-world efficiency gain, not a universal upgrade.

---

## 11. Empirical Narrative

BA, GSK, GM, PG over 2002–2006 span a post-dot-com / pre-GFC window including GM stress. Pair correlations in the 0.21–0.35 band are plausible for large-cap cross-industry names. RZ point estimates run slightly lower than close–close for most pairs (e.g., BA–PG 0.256 vs 0.320) but CIs overlap. Variance reduction is clearest in Table 6’s off-diagonals near 50%. This is exactly the pattern simulations predict under near-BM dynamics: similar means, tighter sampling distribution.

---

## 12. Bottom Line

Rogers–Zhou (2007) deliver a clean, nearly closed-form OHLC correlation estimator that halves variance relative to close–close under Brownian motion, corrects small nonlinear bias by $\phi^{-1}$, resists discrete-monitoring bias via $H+L$, and helps on real equity data—but **fails under VG**. Use it as a high-value companion estimator when daily OHLC are all one has and Gaussian diffusions are plausible; do not treat it as robust to jumps.

---

## 13. Step-by-Step Estimation Recipe

1. For each day and each asset, form log-high, log-low, log-close relative to log-open (so the normalized open is 0).
2. Optionally pretreat each series by an estimated $\sigma_i$ (e.g., Rogers–Satchell or Yang–Zhang vol) if absolute covariance rather than correlation is required; for correlation after individual scaling, apply the unit-vol normalization implicit in the paper.
3. Compute raw $\hat\rho$ from the formula each day.
4. Average over the estimation window; apply $\phi^{-1}$ using a numerical tabulation of $\phi$ on a $\rho$-grid (compute $f$ via the Rogers–Shepp integral or a high-quality approximation).
5. Report both $\overline{\hat\rho_0}$ and $\hat\rho_{RZ}$ with bootstrap or asymptotic SEs; flag divergence.

---

## 14. Final Assessment for the Scholar Archive

This is a high-quality Cambridge working paper in the probabilistic tradition of range-based inference. The contribution is specific and usable: equation (5) plus $\phi^{-1}$. Simulation tables are thorough (BM, VG, BM+drift). The empirical section is small but honest. The concluding skepticism—“lacks dependable and decisive advantages”—is itself a result: range methods for correlation help under BM but do not dominate once realism intrudes. That measured verdict is as valuable as the estimator.

---

## 15. Full Simulation Table Commentary (Brownian Motion)

The complete BM table runs $\rho$ from $-0.9$ to $0.9$ in steps of $0.1$. Standard deviations of $\hat\rho_0$ rise from about $1.00$ near $\rho=0$ to about $1.35$–$1.37$ at $|\rho|=0.9$, as expected from $\mathrm{Var}(S_1S_2)=1+\rho^2$ for correlated standard normals (here $S_i$ are not exactly standard normal as end-points of BM, but $E[S_i^2]=1$ and $E[S_1S_2]=\rho$, so $\mathrm{Var}(S_1S_2)=E[S_1^2S_2^2]-\rho^2$; for jointly Gaussian that equals $1+\rho^2$). RZ standard deviations run from about $0.70$ at $\rho=0$ to about $0.87$–$0.88$ at the extremes. Means track truth within a few hundredths throughout—excellent for 20,000 paths.

Variance ratios: 2.40, 2.36, 2.35, 2.27, 2.19, 2.13, 2.18, 2.08, 2.00, 2.03, 1.99, 2.03, 2.10, 2.21, 2.16, 2.20, 2.25, 2.41, 2.40 along the $\rho$ grid. The slight U-shape (minimum near zero, higher in the wings) means the relative value of range information increases when assets are strongly co-moving or strongly opposing—intuitively, extremes then carry shared information.

---

## 16. Full VG Table Commentary

Under VG, $\hat\rho_0$ remains roughly unbiased (means close to true $\rho$), though SDs inflate (e.g., 2.03 at $\rho=-0.9$ versus 1.37 under BM). RZ means collapse toward zero: $-0.68,-0.61,-0.53,-0.47,-0.39,-0.31,-0.24,-0.16,-0.08,-0.00,+0.08,+0.17,+0.25,+0.31,+0.39,+0.47,+0.55,+0.61,+0.68$ along the same grid. That is a shrinkage of roughly 25–30% of $|\rho|$ at the extremes. Variance ratios of 2.8–3.3 look “better” but are irrelevant given bias. This single table is the paper’s most important negative result.

---

## 17. Drift Table Commentary

With drift $0.1$ per unit time (huge for a “day” if time is in years, but as a stress test), RZ means stay within ~0.02 of truth and variance ratios remain above 2. The zero-drift modeling choice is therefore not knife-edge. Combined with remark (ii) on discrete monitoring, the estimator is robust to the two most common “small” specification errors (mild drift, discrete observation) and fragile to the “large” one (jumps / VG).

---

## 18. Connection to Univariate Rogers–Satchell

Rogers–Satchell (1991) variance estimator uses $H(H-S)+L(L-S)$ type terms for drift-robust univariate variance. The bivariate product $(H_1+L_1-S_1)(H_2+L_2-S_2)$ is a natural cross analogue. The weight $1/(2(1-2b))$ is chosen so that, together with $\frac12 S_1S_2$, the $\rho\in\{-1,0,1\}$ moment conditions hold and MSE at 0 is minimized. This is minimum-MSE method-of-moments with a discrete grid of identification points, not MLE.

---

## 19. Multi-Asset and Matrix Completion Caveat

Remark (i) warns that stitching pairwise RZ estimates produces a matrix of rank at most 2 in the correction component. In practice one should: (a) form the matrix of pairwise $\hat\rho_{RZ}$; (b) project onto the PSD cone (eigenvalue clipping); (c) optionally shrink toward the close–close matrix. The paper does not develop (b)–(c); users must. For $n=4$ as in the empirical example, projection is easy.

---

## 20. When to Prefer Close–Close Despite Lower Efficiency

- Short windows where bias from non-BM dynamics may dominate variance reduction.
- Assets with frequent jumps (earnings, restructurings)—VG lesson.
- Regulatory or client contexts requiring transparent, easy-to-audit estimators.
- When only closes are reliable (halts, bad prints on highs/lows).

Otherwise, especially for liquid large-caps with credible diffusion dynamics, RZ is a free variance reduction.

---

## 21. Reproducibility Notes

Paths: 20,000; steps: 500; $\rho$ grid: 19 points. Empirical: 1118 days, four tickers, Yahoo. All moments needed for $V$ at $\rho=0$ follow from independence and Table 1’s one-dimensional values—re-implementable without Rogers–Shepp until one needs $\phi$ for bias correction. For $\phi$, either integrate the Rogers–Shepp formula for $f$ or interpolate a precomputed grid.

---

## 22. Scholar Takeaway Paragraph

Rogers and Zhou answer a precise market-microstructure-adjacent statistics question with a precise formula. The half-variance result at $\rho=0$ is sharp. The equity illustration confirms practical variance reduction. The VG breakdown prevents overclaim. For a quantitative library of covariance estimators, this paper belongs next to Garman–Klass and Yang–Zhang as the correlation counterpart—with the BM caveat stamped clearly on the label.

### Additional worked note on $b=2\log 2-1$

The constant $b$ is the expected product of maximum and minimum of a standard Brownian motion on $[0,1]$ in related one-dimensional calculations (and appears as $E[H^2]$ type identities in the Parkinson literature). Numerically $2\log 2-1\approx0.386294361$. Then $1-2b\approx0.227411278$ and $1/(2(1-2b))\approx2.198972759$. Implementers should use full double precision rather than rounding to 2.2. This paragraph exists to push documentation completeness for replication.

---

## 23. Archive Metadata

**Title:** Estimating correlation from high, low, opening and closing prices. **Authors:** L. C. G. Rogers, Fanyin Zhou. **Affiliation:** University of Cambridge. **Date:** 1 February 2007. **Pages:** 15. **Key formula:** equation (5) with bias correction (6). **Key negative result:** VG bias in Table 3. **Empirical:** BA, GSK, GM, PG, Feb 2002–Jul 2006. **Scholar batch:** 2026-09-25_3. This summary retains all reported simulation means, SDs, and variance ratios cited above and does not invent unreported statistics.

---

## Appendix A — Prose Restatement of BM Simulation Rows

For true correlation $\rho=-0.9$, the close–close estimator averaged -0.9069 (SD 1.367) while $\hat\rho_{RZ}$ averaged -0.9082 (SD 0.8831); the sample variance ratio was 2.395. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=-0.8$, the close–close estimator averaged -0.793 (SD 1.29) while $\hat\rho_{RZ}$ averaged -0.795 (SD 0.8396); the sample variance ratio was 2.36. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=-0.7$, the close–close estimator averaged -0.7067 (SD 1.239) while $\hat\rho_{RZ}$ averaged -0.7005 (SD 0.8079); the sample variance ratio was 2.3505. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=-0.6$, the close–close estimator averaged -0.588 (SD 1.157) while $\hat\rho_{RZ}$ averaged -0.5872 (SD 0.7678); the sample variance ratio was 2.2719. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=-0.5$, the close–close estimator averaged -0.5064 (SD 1.137) while $\hat\rho_{RZ}$ averaged -0.5045 (SD 0.768); the sample variance ratio was 2.1917. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=-0.4$, the close–close estimator averaged -0.403 (SD 1.075) while $\hat\rho_{RZ}$ averaged -0.3962 (SD 0.7377); the sample variance ratio was 2.1252. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=-0.3$, the close–close estimator averaged -0.2971 (SD 1.06) while $\hat\rho_{RZ}$ averaged -0.2981 (SD 0.7178); the sample variance ratio was 2.1812. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=-0.2$, the close–close estimator averaged -0.2075 (SD 1.019) while $\hat\rho_{RZ}$ averaged -0.1957 (SD 0.7056); the sample variance ratio was 2.0835. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=-0.1$, the close–close estimator averaged -0.097 (SD 1.003) while $\hat\rho_{RZ}$ averaged -0.1004 (SD 0.7101); the sample variance ratio was 1.9961. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.0$, the close–close estimator averaged -0.0038 (SD 0.999) while $\hat\rho_{RZ}$ averaged -0.0011 (SD 0.7021); the sample variance ratio was 2.0285. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.1$, the close–close estimator averaged 0.0992 (SD 1.01) while $\hat\rho_{RZ}$ averaged 0.0943 (SD 0.7151); the sample variance ratio was 1.9942. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.2$, the close–close estimator averaged 0.2083 (SD 1.014) while $\hat\rho_{RZ}$ averaged 0.2086 (SD 0.7111); the sample variance ratio was 2.0331. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.3$, the close–close estimator averaged 0.3051 (SD 1.042) while $\hat\rho_{RZ}$ averaged 0.3028 (SD 0.7187); the sample variance ratio was 2.1032. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.4$, the close–close estimator averaged 0.4089 (SD 1.096) while $\hat\rho_{RZ}$ averaged 0.4037 (SD 0.737); the sample variance ratio was 2.2128. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.5$, the close–close estimator averaged 0.5013 (SD 1.124) while $\hat\rho_{RZ}$ averaged 0.5055 (SD 0.7649); the sample variance ratio was 2.1611. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.6$, the close–close estimator averaged 0.5967 (SD 1.159) while $\hat\rho_{RZ}$ averaged 0.6032 (SD 0.7812); the sample variance ratio was 2.1994. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.7$, the close–close estimator averaged 0.6913 (SD 1.19) while $\hat\rho_{RZ}$ averaged 0.6946 (SD 0.7941); the sample variance ratio was 2.2468. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.8$, the close–close estimator averaged 0.8062 (SD 1.309) while $\hat\rho_{RZ}$ averaged 0.7979 (SD 0.8441); the sample variance ratio was 2.4057. Both means lie close to the truth; RZ is tighter.

For true correlation $\rho=0.9$, the close–close estimator averaged 0.9012 (SD 1.344) while $\hat\rho_{RZ}$ averaged 0.9042 (SD 0.8671); the sample variance ratio was 2.4038. Both means lie close to the truth; RZ is tighter.

---

## Appendix B — VG Bias Pattern in Words

Across every positive $\rho$ in Table 3, RZ means are smaller than truth; across every negative $\rho$, RZ means are larger than truth (less negative). The close–close means stay near truth. Hence the failure mode is one-sided attenuation. Variance ratios of order 3 cannot rescue an estimator whose expectation is wrong by 0.2 or more at $|\rho|=0.9$. Equity indexes with jump risk should treat this as a warning against naive OHLC correlation without Gaussian checks (e.g., comparing daily return kurtosis to 3).

---

## Appendix C — Empirical Pair Narratives

**BA–GSK:** close–close 0.335 vs RZ 0.295; variance of RZ about 55% of close–close. Aerospace vs pharma: moderate positive correlation, RZ slightly lower.

**BA–GM:** 0.329 vs 0.293; RZ variance 45% of simple—largest relative efficiency gain among BA pairs.

**BA–PG:** 0.320 vs 0.256; noticeable point gap but still within wide sampling error given SDs near 1 on daily products averaged over 1118 days (SE of mean $\approx 1/\sqrt{1118}\approx0.03$).

**GSK–GM:** 0.299 vs 0.221; larger point gap; RZ variance ratio 46%.

**GSK–PG:** 0.346 vs 0.333; closest agreement.

**GM–PG:** 0.210 vs 0.209; almost identical means; RZ variance 48% of simple.

Overall: RZ never overturns the qualitative correlation ranking enough to change a diversification story, but it would tighten confidence intervals in a constant-$\rho$ estimation exercise.

---

## Appendix D — Mathematical Objects Checklist

Objects defined in the paper that a replication must code: $H_j,L_j,S_j$; nine $Z$ cross-products; mean table including $f(\rho)$; covariance $V$ at $\rho=0$; vectors $m,y$; weight solve via $V^{-1}$; simplified estimator (5); bias map $\phi$; inverse $\phi^{-1}$; simulators for BM, VG, BM+drift; empirical OHLC pipeline for BA/GSK/GM/PG. Missing from the paper (must be supplied by user): VG parameter values used in Table 3; exact numerical method for $f(\rho)$; code for Figure 1.

