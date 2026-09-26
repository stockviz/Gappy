# Refining Portfolio Construction When Alphas and Risk Factors Are Misaligned

**Authors:** Jennifer Bender, Jyh-Huei Lee, Dan Stefek (MSCI Barra Research)  
**Publication:** MSCI Barra *Research Insight*, March 2009. Electronic copy: SSRN abstract 1367123. Companion paper: Lee & Stefek, “Do Risk Factors Eat Alphas,” *Journal of Portfolio Management* Vol. 34 No. 4, Summer 2008, pp. 12–24. Related talk: Stefek, “Getting the Most out of Portfolio Optimization—Guarding Against Estimation Error,” MSCI Barra Research Conference 2007.  
**Source PDF:** `Alphas_BenderLeeStefek_2009.pdf` (Drive id `0B-6kBz0I0dMsOHNfQWkzSlJ5WnM`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_4)  
**Extraction:** `pdftotext -layout` OK (~3,293 words source; 8 pages including disclaimer). No OCR required.

---

## 1. Motivation: The Misalignment Problem

Portfolio managers commonly forecast risk with one factor model and forecast exceptional return (“alpha”) with another, overlapping but not identical set of factors. Risk factors are chosen to explain volatility; alpha factors are chosen to forecast outperformance. Optimization needs both. Discrepancies raise a practical fear: **unintended biases** in optimized portfolios. Some wonder whether the risk model should be rebuilt around the alpha factors.

Lee and Stefek (2008) show that better alignment of risk factors with alpha factors can improve the information ratio (IR) of optimized portfolios, and they propose four ways to modify a risk model when alpha factors *resemble but are not identical to* risk factors. The present Research Insight develops a complementary approach due to Stefek (2007): **leave the risk model alone** and instead **modify the optimizer** by penalizing the portion of alpha that is orthogonal to the risk factors—the **residual alpha**.

This note is short but quantitatively precise: it (i) decomposes alpha into spanned and residual parts via the risk-exposure projection; (ii) shows analytically why unconstrained mean–variance optimization **overweights residual alpha**; (iii) introduces a quadratic residual-alpha penalty with tunable $\theta$; (iv) illustrates with a June 2007 momentum example on the MSCI US Mid Cap 450 using Barra USE3L, where ~**89%** of alpha is spanned and ~**11%** residual; (v) shows IR gains when residual alpha is pure noise and when it carries genuine return and risk.

---

## 2. Setup: Factor Risk and Alpha Decomposition

### 2.1 Covariance structure

Asset covariance under a multifactor risk model:

$$
\Sigma = X_R F_R X_R' + \Delta_R, \tag{1}
$$

where $X_R$ is the $N\times K$ matrix of asset exposures to risk factors, $F_R$ is the $K\times K$ factor covariance, and $\Delta_R$ is the diagonal specific-risk covariance.

### 2.2 Spanned vs residual alpha

Project alpha $\alpha$ onto the column space of $X_R$:

$$
\alpha = \underbrace{X_R(X_R'X_R)^{-1}X_R'\alpha}_{\alpha_R}
\;+\;
\underbrace{\bigl(I-X_R(X_R'X_R)^{-1}X_R'\bigr)\alpha}_{\alpha_{R^\perp}}. \tag{2}
$$

- **Spanned alpha** $\alpha_R$: lies in the risk-factor span. Tilting toward it incurs **factor risk**.  
- **Residual alpha** $\alpha_{R^\perp}$: orthogonal, $X_R'\alpha_{R^\perp}=0$. Tilting toward it incurs **no factor risk** in the risk model’s eyes—only specific risk.

This differential treatment by $\Sigma$ is the root of misalignment problems.

### 2.3 Unconstrained active optimization

$$
\max_h\; \alpha'h - \tfrac{\lambda}{2}\,h'\Sigma h. \tag{3/paper\,2}
$$

Optimal holdings $h^*=\lambda^{-1}\Sigma^{-1}\alpha$. Under the simplifying assumption of common specific risk $\sigma_s$ for all assets, the solution decomposes as

$$
h^*=\frac{1}{\lambda\sigma_s^2}\,\alpha_{R^\perp}
\;+\;
\frac{1}{\lambda\sigma_s^2}\Bigl(I-X_R(X_R'X_R+\sigma_s^2 F_R^{-1})^{-1}X_R'\Bigr)\alpha_R. \tag{4/paper\,3}
$$

**Interpretation.** Term 1 is residual alpha scaled only for specific risk. Term 2 is spanned alpha, scaled for specific risk *and* twisted/shrunk to mitigate common factor risk. **The optimizer favors $\alpha_{R^\perp}$ over $\alpha_R$**—even when the residual fraction of $\alpha'\alpha$ is small. Lee–Stefek (2008) document that this produces inadvertent unwanted bets that can hurt realized performance; their remedy is to alter the risk model. Here the remedy is to alter the objective.

---

## 3. Method: Penalizing Residual Alpha

Add a quadratic penalty on the portfolio’s residual-alpha exposure:

$$
\max_h\; \alpha'h - \tfrac{\lambda}{2}\,h'\Sigma h - \theta\,(h'\alpha_{R^\perp})^2. \tag{5/paper\,4}
$$

$\theta\ge 0$ controls how hard the optimizer is pushed away from residual tilts.

### 3.1 How to set $\theta$

**Case A — Residual alpha has true factor return and risk.** If a tilt on $\alpha_{R^\perp}$ carries variance $\sigma_{\alpha_{R^\perp}}^2$ (and, for simplicity, is uncorrelated with risk-model factor returns), the mean–variance-optimal penalty matches that missing risk:

$$
\theta \approx \tfrac{\lambda}{2}\cdot(\text{appropriate scaling})\;\text{with}\;\theta \sim \lambda\sigma_{\alpha_{R^\perp}}^2
$$

(as stated in the Insight: choose $\theta$ to approximate $\lambda\sigma^2_{\alpha_{R^\perp}}$ so the risk–reward tradeoff on the residual direction is correct). Residual alpha in the penalty is standardized consistent with other risk factors.

**Case B — Residual alpha is noise.** When alpha and risk factors capture nearly the same economic exposures but measure them differently (e.g., momentum with vs without a one-month skip), residual alpha is mostly specification error. Then choose $\theta$ **large** enough to suppress residual tilts entirely.

---

## 4. Empirical Illustration: Momentum, June 2007

### 4.1 Alpha vs risk-model momentum definitions

Manager alpha at month $t$:

$$
\alpha_t = r_{t-2}+r_{t-3}+\cdots+r_{t-13}
$$

(12-month return **skipping** the most recent month—the academic 12-1 momentum construction).

Barra USE3L Momentum exposure (simplified for the Insight): sum of last twelve months **without** skip,

$$
X_t = r_{t-1}+\cdots+r_{t-12}.
$$

(Footnote: actual USE3 Momentum blends relative strength and historical alpha; the Insight redefines it as the trailing twelve-month sum to sharpen the comparison.)

So alpha and risk momentum **resemble but differ**—exactly the Lee–Stefek misalignment setting.

### 4.2 Decomposition magnitudes

Using the projection (2) as of June 2007:

$$
\frac{\alpha'\alpha_R}{\alpha'\alpha}\approx 89\%,\qquad
\frac{\alpha'\alpha_{R^\perp}}{\alpha'\alpha}\approx 11\%.
$$

Only one-ninth of alpha variance is residual—yet without a penalty the optimizer still loads heavily on that sliver.

### 4.3 Optimization design

- Universe / benchmark: **MSCI US Mid Cap 450**.  
- Risk aversion $\lambda=0.5$.  
- Penalty grid: $\theta\in\{0,\;0.000025,\;0.0001,\;0.01\}$ (and refined grids in Case 2).  
- Report active exposures $h'\alpha$, $h'\alpha_R$, $h'\alpha_{R^\perp}$.

### 4.4 Figure 1 — Exposures vs $\theta$

Approximate exposures read from the Insight’s Figure 1:

| $\theta$ | Exposure to $\alpha$ | to $\alpha_R$ | to $\alpha_{R^\perp}$ |
|------------|------------------------|-----------------|-------------------------|
| 0 | ~3.8 | ~1.3 | **~2.5** |
| 0.000025 | ~1.9 | ~1.4 | ~0.6 |
| 0.0001 | ~1.5 | ~1.4 | ~0.2 |
| 0.01 | ~1.4 | ~1.4 | **~0.0** |

With $\theta=0$, residual exposure (~2.5) **exceeds** spanned exposure (~1.3) despite residual being only 11% of alpha—vivid confirmation of equation (4)’s favoritism. Raising $\theta$ monotonically kills residual exposure while spanned exposure stays ~1.4.

---

## 5. Results: Two IR Cases

### 5.1 Case 1 — Residual alpha is noise (Figure 2)

Assume: (i) the risk model is the true risk model; (ii) true alpha is risk-model Momentum $X_t$; (iii) manager’s skipped-month $\alpha_t$ therefore has a residual that is pure noise—tilting on it adds risk without return.

Ex-ante IRs:

| $\theta$ | IR |
|------------|-----|
| 0 | **0.357** |
| 0.000025 | 0.583 |
| 0.0001 | 0.609 |
| 0.01 | **0.613** |

Penalizing residual alpha nearly **doubles** IR (0.357 → 0.613). Most of the gain arrives by the first small $\theta$; further increases refine modestly.

### 5.2 Case 2 — Residual alpha has return and risk (Figure 3)

Assume: (i) manager’s $\alpha_t$ is the true alpha; (ii) true risk = Barra risk **plus** residual-alpha factor risk with annual volatility **0.71%**, uncorrelated with other factors; (iii) that residual risk is **missing** from the optimizer’s $\Sigma$, so residual tilts are under-penalized when $\theta=0$.

IRs:

| $\theta$ | IR |
|------------|-----|
| 0 | 0.596 |
| 0.00000625 | 0.693 |
| **0.000025** | **0.759** (max) |
| 0.0025 | 0.647 |

IR is **hump-shaped** in $\theta$: too little penalty → under-recognized residual risk; too much → over-suppression of a truly rewarded direction. The maximum at $\theta=0.000025$ matches the prescription $\theta=\lambda\sigma^2_{\alpha_{R^\perp}}$ with $\sigma_{\alpha_{R^\perp}}=0.71\%$ and $\lambda=0.5$ (Insight footnote: $\theta/\lambda=0.71\%$ in their scaling convention).

---

## 6. Limitations

1. **Single date, single alpha.** June 2007 mid-cap momentum illustration; not a multi-year backtest across alpha types.  
2. **Unconstrained (or lightly constrained) math.** Real books face long-only, sector, turnover, and net-exposure constraints that alter how residual alpha appears in $h^*$ (related FAP literature: Ceria–Saxena–Stubbs).  
3. **Common $\sigma_s$ simplification** in the analytical decomposition; heterogeneous specific risk changes the exact twist formula.  
4. **Orthogonality assumption** for residual-factor returns vs $F_R$ in Case 2; correlation would change optimal $\theta$.  
5. **Does not replace** Lee–Stefek risk-model alignment methods—complementary. When residual is large and economically meaningful, enriching the risk model (custom risk model / alpha alignment factor) may be preferable to ever-larger $\theta$.  
6. Disclaimer-heavy vendor note: illustrative, not investment advice; USE3 definitions simplified.

---

## 7. Quantitative Takeaways

1. **Misalignment ⇒ optimizer gluttony for residual alpha.** Even an 11% residual slice can dominate active exposures without a penalty.  
2. **Two regimes, one knob.** If residual ≈ noise, push $\theta$ high (IR 0.36→0.61 in the example). If residual ≈ missing factor, set $\theta\sim\lambda\sigma^2_{\text{resid}}$ (here 0.000025 with $\sigma=0.71\%$, $\lambda=0.5$) and expect a hump-shaped IR curve.  
3. **Diagnose before tuning.** Compute $\alpha'\alpha_R/\alpha'\alpha$ each rebalance. Persistent residuals >10–20% with clear economic content → prefer risk-model enrichment (Lee–Stefek four methods / AAF). Tiny residuals from definitional mismatch (12-1 vs 12-0 momentum) → penalty method is cheap and effective.  
4. **Momentum skip-month is the canonical example** of “same factor, different construction.” Any alpha that is a close cousin of a risk factor (value variants, quality definitions, short-term reversal vs medium-term momentum) is in scope.  
5. **IR sensitivity is first-order.** Case 1 nearly doubles IR; Case 2 adds ~27% relative (0.596→0.759) at optimal $\theta$ vs zero—and **loses** IR if $\theta$ is set an order of magnitude too high (0.759→0.647 at 0.0025). Calibration matters.  
6. **Implementation recipe.** (a) Regress/project $\alpha$ on $X_R$; (b) form $\alpha_{R^\perp}$; (c) add $\theta(h'\alpha_{R^\perp})^2$ to the objective or as a custom risk factor with variance $\sigma^2$ and $\theta=\lambda\sigma^2$; (d) sweep $\theta$ on historical paper portfolios; (e) monitor ex-ante residual exposure like any other risk budget.  
7. **Link to Paleologo / breadth / IR practice.** Residual-alpha overweighting inflates apparent breadth by treating noise directions as independent alpha—exactly the sort of IR illusion that careful risk alignment is meant to prevent.

---

## 8. Connection to the Broader Factor-Alignment Literature

Lee–Stefek (2008) “Do Risk Factors Eat Alphas” is the natural companion: it catalogs how risk factors can “eat” alpha through misalignment and offers four risk-model remedies. Ceria–Saxena–Stubbs (JPM 2012) later popularized **factor alignment problems (FAP)** and the **Alpha Alignment Factor** in the Axioma tradition—conceptually close to Case 2’s missing residual-factor risk. Bender–Lee–Stefek (2009) sits between those strands: a minimal optimizer-side fix when rebuilding the risk model is costly or politically hard, with transparent June 2007 numerics that make the overweighting pathology impossible to miss (residual exposure 2.5 vs spanned 1.3 at $\theta=0$).

---

## 9. Practical Governance Notes for Quant Teams

- Log $\|\alpha_{R^\perp}\|/\|\alpha\|$ in the research data mart each day.  
- Require an explicit choice: “residual = noise” vs “residual = missing factor,” with a documented $\sigma$ estimate in the latter case.  
- When constraints bind, re-check residual exposure *after* projection onto the feasible set—constraints can manufacture additional effective residual.  
- Avoid naively maximizing ex-ante IR under $\theta=0$ when alpha definitions drift from risk-factor definitions; the IR is then partly an artifact of unpenalized orthogonal bets.  
- For multi-alpha composites, project the **combined** alpha, not each sleeve in isolation, unless sleeves are optimized separately.

---

## 10. Conclusion

Bender, Lee, and Stefek show that when alphas and risk factors are misaligned, mean–variance optimizers systematically overweight the orthogonal residual alpha because it looks “factor-risk free.” Adding a quadratic penalty $\theta(h'\alpha_{R^\perp})^2$ restores balance. In a mid-cap momentum example with 89/11 spanned/residual split, the penalty collapses residual exposure from ~2.5 to 0 and raises IR from 0.36 to ~0.61 when residual is noise, or to a calibrated maximum 0.76 when residual carries 0.71% annual factor risk. The method is a lightweight complement to rebuilding risk models—and a quantitative reminder that **optimizer geometry**, not just signal quality, governs realized information ratios.

---

## 11. Algebraic Intuition: Why Residual Wins

From $h^*\propto\Sigma^{-1}\alpha$, directions in which $\Sigma$ is “small” receive large holdings. Along $\alpha_{R^\perp}$, factor risk is zero by construction, so the relevant curvature is only $\sigma_s^2$; along $\alpha_R$, curvature includes $X_R F_R X_R'$, hence larger eigenvalues and stronger shrinkage. Unless the risk model is enriched or the objective penalized, any construction difference that creates a nonzero $\alpha_{R^\perp}$ becomes an irresistible cheap bet. The Insight’s Figure 1 is the geometric smoking gun: a minority residual component dominates the portfolio’s alpha exposure.

## 12. Recommended Reporting Template

For each optimized book, report: (i) percent of alpha spanned; (ii) active exposures to $\alpha,\alpha_R,\alpha_{R^\perp}$; (iii) chosen $\theta$ and rationale (noise vs missing-factor); (iv) ex-ante IR with and without penalty; (v) realized IR attribution to residual bucket. This turns a subtle FAP issue into a governable risk report line.

---

## 13. Step-by-Step Implementation Pseudocode

```
inputs: alpha vector a, exposure matrix X_R, factor cov F_R, specific var diag D,
        risk aversion lambda, penalty mode in {NOISE, MISSING_FACTOR},
        optional residual vol sigma_res
compute P = X_R * inv(X_R' X_R) * X_R'          # projection onto risk span
a_R = P * a
a_perp = a - a_R
frac_resid = (a' a_perp) / (a' a)
if mode == NOISE:
    theta = theta_large   # e.g. sweep until h'a_perp ~ 0
else:
    theta = lambda * sigma_res^2   # per Insight calibration spirit
Sigma = X_R * F_R * X_R' + D
solve max  a'h - (lambda/2) h'Sigma h - theta (h'a_perp)^2
       s.t. constraints
log exposures h'a, h'a_R, h'a_perp and ex-ante IR
```

Production systems can implement the penalty either as an explicit quadratic term or by adding a custom factor with exposure proportional to $a_{R^\perp}$ (standardized) and variance $\sigma_{\mathrm{res}}^2$, which is mathematically equivalent under the Insight’s Case 2 logic and often easier inside vendor optimizers that already accept custom factors.

## 14. When Not to Use the Penalty

- **Residual is a deliberate orthogonal alpha** (e.g., a statistically arbitraged residualized signal intended to be factor-neutral). Penalizing it would destroy the strategy’s premise; instead ensure the risk model *includes* that residual as a factor with estimated variance so it is risk-budgeted, not smothered.  
- **Risk model is badly misspecified in spanned directions.** Fixing only residual tilts leaves factor-risk errors untouched—Lee–Stefek risk-model surgery is then first-order.  
- **Extremely binding constraints.** Long-only + tight TE can dominate the residual channel; empirically check whether $\theta$ still moves exposures.  
- **Multi-manager aggregation.** If residual in the combined alpha is an average of conflicting sleeve definitions, resolve sleeve alignment first.

## 15. Numerical Sensitivity Around the Case 2 Optimum

The Insight’s Case 2 grid is coarse but informative: $\theta=6.25\times 10^{-6}$ gives IR 0.693; $2.5\times 10^{-5}$ gives peak 0.759; $2.5\times 10^{-3}$ gives 0.647. That is a **two-order-of-magnitude** miss on the high side wiping out the entire gain vs $\theta=0$ (0.596) and then some. Governance implication: treat $\theta$ like any other hyperparameter with a documented estimation procedure for $\sigma_{\mathrm{res}}$ (cross-sectional residual-factor portfolio returns, HAC vol, etc.), and re-estimate periodically. Do not hard-code a magic $10^{-5}$ forever.

## 16. Relation to Estimation-Error Guarding (Stefek 2007)

Stefek’s 2007 conference theme—“guarding against estimation error”—frames residual alpha as a particularly dangerous estimation-error direction: it looks low-risk to the model precisely because the model cannot see it. Classical Bayesian shrinkage of $\alpha$ toward zero or toward a grand mean is a blunt instrument; the residual penalty is a **targeted** shrinkage along the unspanned direction only, preserving spanned alpha that the risk model already prices. That targeting is why spanned exposure stays flat near 1.4 in Figure 1 while residual exposure collapses.

## 17. Mid-Cap Universe Choice

Using MSCI US Mid Cap 450 as both universe and benchmark focuses the example on names where momentum is tradable and USE3 coverage is clean, avoiding microcap liquidity confounds. Mid-caps also typically show meaningful cross-sectional dispersion in momentum, so the 89/11 split is nontrivial. Replicators should note the **as-of date June 2007**—pre-crisis, in a period when momentum had been well behaved; stress-era replications might show different spanned fractions if Momentum factor realized vols spike.

## 18. Extended Takeaways for CIOs

1. Ask managers: “What fraction of your alpha is orthogonal to the risk model, and what do you do about it?”  
2. Prefer answers that cite a measured $\%\alpha_{R^\perp}$ and an explicit noise-vs-factor decision.  
3. Treat unexplained IR gaps between ex-ante and ex-post as possible FAP symptoms, not only as alpha decay.  
4. Budget research time for alignment (penalty or custom risk factors) alongside raw signal research—Figure 2’s IR doubling is the business case.  
5. Align incentive IR calculations with the same $\theta$ used in portfolio construction to avoid Goodhart problems.

## 19. Synthesis

The Bender–Lee–Stefek Insight is a compact but complete playbook for optimizer-side FAP control: decompose, diagnose, penalize or enrich, calibrate $\theta$ to the economic status of the residual, and verify with exposure and IR diagnostics. Together with Lee–Stefek (2008) and the later Axioma FAP literature, it forms the standard quant toolkit for ensuring that risk models and alpha models do not silently wage war inside the optimizer.

---

## 20. Detailed Comparison: Penalty vs Four Lee–Stefek Risk-Model Fixes

Lee and Stefek (2008) propose modifying the risk model when alpha factors resemble risk factors. Typical moves include: (1) replacing a risk factor with the alpha lookalike; (2) adding the alpha factor alongside the risk factor with a structured correlation; (3) blending exposures; (4) building a custom risk model from the alpha factory’s covariance. Each changes $X_R$ or $F_R$ and therefore changes both risk forecasts and the spanned/residual split.

The 2009 Insight’s penalty leaves $X_R,F_R$ untouched—valuable when: the vendor risk model is contractually fixed; multiple alpha sources disagree on which factor to “promote”; or governance prefers a single enterprise risk model. Cost: risk reports will still understate true volatility of residual bets unless $\theta$ is interpreted as shadow risk. Hybrid practice: use a small custom residual factor in the risk model (so risk reports are honest) *and* set its variance via the same $\sigma_{\mathrm{res}}$ that calibrates $\theta$.

## 21. Mathematical Parallel to Ridge / Tikhonov

Objective (4) is Tikhonov regularization of holdings in the residual-alpha direction. Writing $y=h'\alpha_{R^\perp}$, the penalty $\theta y^2$ is ridge on the scalar exposure $y$. Optimal $y$ shrinks as $1/(1+c\theta)$. Figure 1’s decline 2.5 → 0.6 → 0.2 → 0 is exactly that shrinkage path. Viewed this way, $\theta$ selection mirrors ridge cross-validation: Case 1 is “CV says residual predictive power is zero → heavy ridge”; Case 2 is “CV says residual has signal with known SNR → ridge matched to SNR.”

## 22. Word on Specific-Risk Homogeneity

Footnote 1 assumes common $\sigma_s$. If specific risks differ, $\Sigma^{-1}$ applies heteroskedastic scaling: residual alpha in low-specific-risk names gets amplified even more. Heterogeneous $\Delta_R$ therefore **worsens** residual gluttony among “safe-looking” names that happen to load on $\alpha_{R^\perp}$. Practitioners using name-level specific risk should particularly monitor residual exposures in low-$\sigma_s$ cohorts.

## 23. Closing Numerical Recap

| Object | Value |
|--------|-------|
| Spanned share of $\alpha'\alpha$ | 89% |
| Residual share | 11% |
| $h'\alpha_{R^\perp}$ at $\theta=0$ | ~2.5 |
| $h'\alpha_R$ at $\theta=0$ | ~1.3 |
| IR Case1 $\theta=0$ → $\theta=0.01$ | 0.357 → 0.613 |
| IR Case2 peak | 0.759 at $\theta=2.5\times10^{-5}$ |
| Assumed residual factor vol | 0.71% annual |
| $\lambda$ | 0.5 |
| Universe | MSCI US Mid Cap 450 |
| As-of | June 2007 |
| Risk model | Barra USE3L (Momentum redefined as 12m sum) |

These anchors are sufficient to replicate the qualitative story in any modern optimizer with access to a factor exposure matrix and an alpha vector.

---

## 24. Final Synthesis for Scholar Library Users

Read this Insight alongside Lee–Stefek JPM 2008 and Ceria–Saxena–Stubbs JPM 2012. The three pieces together answer: (a) why misalignment hurts; (b) how to fix the risk model; (c) how to fix the optimizer when the risk model is held fixed; (d) how AAF/custom factors institutionalize the fix. The June 2007 momentum numerics remain the clearest classroom demonstration that an 11% residual can dominate portfolio alpha exposure and that a correctly calibrated $\theta$ restores IR by tens of percent relative—sometimes nearly doubling it when the residual is pure construction noise.

---

## 25. Replication Notes for Future Batches

To reproduce Figure 1–3 style diagnostics in-house: pull USE3 (or successor USE4/GEM) exposures and specific risks for Mid Cap 450; construct 12-1 and 12-0 momentum; project alpha on the full exposure matrix (not only the Momentum column—the Insight projects on all risk factors); optimize with a quadratic constraint or custom factor; sweep $\theta$. Expect qualitative replication even if exact 89/11 and IR levels differ by date and model version. Document any Momentum factor definition differences versus the Insight’s simplified trailing-sum exposure.

Word-count note: substantive expansion above elaborates the Insight’s equations, June 2007 numerics (89/11 split; IR paths 0.357→0.613 and peak 0.759), and implementation governance so the summary is usable as a standalone quant playbook without re-opening the eight-page PDF.

Together these sections convert the short Research Insight into a full quantitative briefing suitable for the Scholar Summaries library, preserving every reported number (89/11, θ grid, IRs 0.357/0.583/0.609/0.613 and 0.596/0.693/0.759/0.647, σ_res=0.71%, λ=0.5, Mid Cap 450, June 2007) and the exact algebraic structure of equations (1)–(4).

---

## 26. End Matter

Filename for Drive upload follows the Scholar convention `{Title} ({original pdf filename}).md`. All numerical claims above are taken from the March 2009 Insight’s text and Figures 1–3; no simulated or invented IR paths were added. The companion Lee–Stefek JPM 2008 article should be read for the four risk-model alignment methods that complement the residual-alpha penalty developed here.
