# Asset Pricing with Omitted Factors

**Authors:** Stefano Giglio (Yale University, NBER, CEPR) and Dacheng Xiu (University of Chicago)  
**Publication:** *Journal of Political Economy*, 2021, Vol. 129, No. 7; electronically published May 10, 2021  
**Source PDF:** `OmittedFactor_GiglioXiu.pdf`  
**Summary prepared:** 2026-09-23 (Scholar batch_2026-09-23_1)  
**OCR:** Not required; clean extract (~21,159 words of source)

---

## 1. Problem and Motivation

Linear asset pricing models assert that expected excess returns are compensation for exposure to systematic factors:

$$
\mathbb{E}[R_i] = \beta_i'\gamma,
$$

where $\gamma$ collects factor risk premia. When a factor of interest $g_t$ is observable—market, liquidity, intermediary capital, consumption growth—the econometrician wants $\gamma_g$. Two classical estimators dominate practice:

1. **Two-pass cross-sectional regression** (Fama–MacBeth): time-series betas on observed factors, then cross-sectional regression of average returns on betas.
2. **Mimicking-portfolio** projection of $g_t$ onto a set of base assets; risk premium = average excess return of the projection.

Both are **biased when priced factors are omitted** from the model or from the projection span, and when $g_t$ is measured with error. In large cross-sections the bias does not vanish. Giglio and Xiu propose a **three-pass estimator** that recovers the risk premium of an observable factor even when the other factors are unspecified, provided principal components of test-asset returns span the true factor space. A **rotation invariance** result is central: the risk premium of $g_t$ is invariant to how the latent factors are rotated, so PCA’s arbitrary rotation is harmless.

Empirically, on 647 portfolios (1976–2010), two-pass and mimicking estimators swing wildly with controls, while the three-pass estimator delivers tradable-factor premia close to average excess returns and sensible nontradable premia (liquidity, intermediary capital, stockholder consumption)—and correctly prices Novy-Marx “nonsense” factors at ~0.

---

## 2. Setup and Data

### 2.1 Factor model with latent factors and a proxy

True returns:

$$
R_t = \beta v_t + u_t, \qquad \mathbb{E}[u_t|v_t]=0,
$$

with latent factors $v_t\in\mathbb{R}^p$ and risk premia $\gamma=\mathbb{E}[v_t]$ (or equivalently expected returns $\beta\gamma$). The econometrician observes a proxy

$$
g_t = \delta + h'v_t + z_t,
$$

where $z_t$ is measurement error and $h$ loads $g$ on the latent factors. The object of interest is the risk premium of the priced component of $g$, identified via $h'\gamma$ under stated conditions.

### 2.2 Why classical estimators fail

**Omitted-factor bias (two-pass):** If the first pass omits some of $v_t$, betas are misspecified and the cross-sectional price of risk for $g$ inherits omitted-variable bias. Adding some but not all controls changes estimates arbitrarily (MOM example below).

**Measurement-error bias:** Noise in $g_t$ attenuates or distorts cross-sectional prices of risk; weak/noisy factors can appear strongly priced.

**Mimicking-portfolio bias:** Projecting $g$ onto an incomplete basis (e.g., only the market, or only FF3) omits spanning portfolios; projecting onto all $n$ assets is infeasible when $n>T$.

### 2.3 Empirical panel

- **Test assets:** 647 portfolios—U.S. equities sorted on many characteristics, Treasuries, corporate bonds, currencies.
- **Sample:** monthly, **1976–2010** (limited by nonequity data).
- **Tradable factors:** market, SMB, HML, RMW, CMA, MOM, BAB (Frazzini–Pedersen), QMJ (Asness–Frazzini–Pedersen).
- **Nontradable:** IP growth innovations; Ludvigson–Ng macro PCs; Pastor–Stambaugh liquidity; He–Kelly–Manela and Adrian–Etula–Muir intermediary factors; Novy-Marx temperature/sunspot factors; Malloy–Moskowitz–Vissing-Jorgensen aggregate and stockholder consumption.

PCA eigenvalues suggest **$\hat{p}=7$** factors (sharp drop after the 7th eigenvalue); cross-sectional $R^2$ of seven PCs ≈ **59%** (vs ~73% for FF3 on the smaller 25-portfolio cross-section). Robustness to $\check{p}\ge 7$ is documented in the online appendix.

---

## 3. Three-Pass Methodology

### 3.1 The three steps

**Pass 1 — PCA.** From demeaned returns $\tilde{R}$, extract the top $p$ principal components $\hat{v}_t$ (rotation of true $v_t$). Bai–Ng / Bai theory: if factors are strong, $\hat{v}$ consistently recovers the factor space as $n,T\to\infty$.

**Pass 2 — Two-pass on PCs.** Estimate risk premia $\hat{\gamma}$ of the PCs via cross-sectional regression of average returns on PC betas (or the compact algebraic form in the paper). Because PCs span the factor space, this $\hat{\gamma}$ prices the cross-section under the model.

**Pass 3 — Map $g$ into the factor space.** Time-series regress $g_t$ on $\hat{v}_t$ to estimate loadings $\hat{h}$ (and purge measurement error $z_t$). The risk-premium estimator is

$$
\hat{\gamma}_g = \hat{h}'\hat{\gamma}.
$$

Compactly, the paper gives a matrix formula for $\hat{\gamma}_g$ in terms of $R$ and $g$ that implements all three passes.

### 3.2 Rotation invariance

If $\hat{v}_t = H v_t$ for invertible $H$, PC risk premia and loadings transform as $\gamma \mapsto H\gamma$ and $h\mapsto H^{-T}h$ (up to conventions), leaving $h'\gamma$ invariant. Hence PCA’s unidentified rotation does not contaminate $\gamma_g$. This is the paper’s conceptual punchline: **you need the whole factor space, not the “right” rotation or the “right” named controls.**

### 3.3 Interpretation duality

- **PC-augmented two-pass:** equivalently, run Fama–MacBeth with $g_t$ plus enough PCs as controls—the PCs soak up omitted factors.
- **Invariant mimicking portfolio:** equivalently, build a mimicking portfolio in the PC-spanned space; as $n\to\infty$, differences vs classical mimicking vanish when the projection basis spans.

### 3.4 Inference

The authors derive asymptotic variance for $\hat{\gamma}_g$ under large-$n$, large-$T$ sequences, with Newey–West-type estimators for serial correlation in factors and errors. They also provide a test for weak factors / measurement error via the time-series $R^2$ of $g$ on PCs ($R_g^2$). Low $R_g^2$ ⇒ $g$ is mostly noise relative to the asset-pricing factor space ⇒ three-pass correctly drives $\hat{\gamma}_g$ toward zero (unlike two-pass, which can spuriously price noise).

### 3.5 Ridge connection

A ridge estimator is consistent in related high-dimensional settings, but PCA is preferred when factors are strong: it separates signal eigenvalues from noise more efficiently. Online appendix compares estimators.

---

## 4. Empirical Results (with Numbers)

### 4.1 Motivating example: Momentum

| Estimator | MOM risk premium (bps/month) |
|-----------|------------------------------|
| Average excess return (tradable truth) | **69** (SE 24) |
| Two-pass, no controls | **2201** (absurd) |
| Two-pass, + market | 20 (insignificant) |
| Two-pass, + FF3 | 71 |
| Mimicking onto market | −25 |
| Mimicking onto FF3 | −221 (significant wrong sign) |
| **Three-pass (p=7)** | **49** (significant, near 69) |

Lesson: classical estimates are **order-of-magnitude and even sign sensitive** to controls; three-pass lands near the tradable benchmark.

### 4.2 Patterns across Table B1 (summary of authors’ discussion)

**Two-pass:** Extreme sensitivity to controls; Novy-Marx nonsense factors often show huge significant premia (measurement-error / weak-factor pathology).

**Mimicking:** Sign flips across projection bases (e.g., BAB and CMA negative vs market, positive vs FF3). Infeasible to project onto all 647 assets ($n>T$).

**Three-pass:**
- Tradable factors: estimates **economically and statistically close to average excess returns**.
- Significant nontradable premia: **Pastor–Stambaugh liquidity**, **both intermediary-capital factors**, **Ludvigson–Ng macro PC1**, **stockholder consumption** (Malloy–Moskowitz–Vissing-Jorgensen).
- Insignificant / ~0: Novy-Marx temperature and sunspot factors (correctly diagnosed as weak).
- IP growth: marginally significant but tiny (**~21 bps**).
- Contrast with literature: authors note a **market risk premium** estimate that differs from some prior two-pass findings—because omitted-factor bias is purged.

### 4.3 Factor strength

$R_g^2$ of each $g$ on seven PCs varies widely. High for traded equity factors; low for nonsense factors. Three-pass uses this automatically: weak $g$ cannot load on $\hat{v}$, so $\hat{h}'\hat{\gamma}\approx 0$.

### 4.4 Cross-sectional fit

Seven PCs: CS $R^2$ 59%. Ten / thirteen PCs: 66% / 68%. Useful fit on a **much larger** cross-section than the usual 25 FF portfolios, with only four more factors than FF3’s three.

---

## 5. Limitations

1. **Strong-factor assumption.** PCA recovery requires pervasive factors. Weak true factors may be missed; then invariance fails.
2. **Choice of $p$.** Eigenvalue / information criteria help, but underselecting $p$ reintroduces omission bias. Authors recommend $\check{p}\ge\hat{p}$ and show robustness.
3. **Balanced panel 1976–2010.** Modern factors and post-2010 data need re-estimation.
4. **Zero-beta rate** set to observed T-bill; alternative zero-beta estimation is a separate literature.
5. **Statistical vs economic identification.** Spanning the statistical factor space ≠ naming the equilibrium SDF; interpretation of nontradable premia still needs theory.
6. **Computational / data.** Results rely on a large, curated 647-portfolio panel; replication burden is nontrivial.

---

## 6. Practical Takeaways for a Quant Investor

1. **Never estimate a factor premium with naked two-pass on a favorite factor.** Always control for a rich latent span—or use three-pass.
2. **Tradable factors:** prefer average excess returns as the premium; use three-pass as a consistency check. Large gaps signal omitted-factor problems in your cross-section.
3. **Nontradable factors (liquidity, intermediary, consumption):** three-pass is the right default; expect liquidity and intermediary factors to show through; be skeptical of exotic macro factors that fail $R_g^2$.
4. **Factor zoo hygiene:** run Novy-Marx-style placebo factors through three-pass; they should be ~0. If your pipeline prices sunspots, the pipeline is wrong.
5. **Risk models:** the same PCA span that identifies premia is a candidate covariance / risk model for portfolio construction (link to Jagannathan–Ma / DeMiguel agendas).
6. **Reporting standard:** publish $\hat{\gamma}_g$, SE, $R_g^2$, and $\hat{p}$ alongside any claimed factor premium.

---

## 7. Key Equations

**Proxy:** $g_t=\delta+h'v_t+z_t$.

**Three-pass premium:** $\hat{\gamma}_g=\hat{h}'\hat{\gamma}_{\text{PC}}$.

**Invariance:** $h'\gamma=(H^{-T}h)'(H\gamma)$.

**Weak-factor diagnostic:** $R_g^2=\mathrm{Var}(\hat{h}'\hat{v})/\mathrm{Var}(g)$.

---

## 8. Theory Sketch for Quants

Large-$n$ PCA consistency (Bai 2003) delivers $\|\hat{v}-Hv\|=o_p(1)$ under pervasiveness. The cross-sectional regression of $\bar{R}$ on $\hat{\beta}$ recovers $H\gamma$. The time-series regression of $g$ on $\hat{v}$ recovers $H^{-T}h$ (plus noise that averages out). The product converges to $h'\gamma$. Measurement error $z_t$ is orthogonal to $\hat{v}$ asymptotically if $z$ is idiosyncratic, hence does not bias $\hat{h}$ beyond standard TS regression noise—unlike two-pass, where measurement error in a *named* factor used as the sole regressor biases the price of risk.

Omitted *observable* controls are irrelevant because PCs already span. Omitted *latent* dimensions (too small $p$) re-create classical bias—hence err on more PCs.

---

## 9. Relation to Sibling Papers

| Paper | Link |
|-------|------|
| Asness–Frazzini–Pedersen | BAB/QMJ appear as tradable factors in the empirical set |
| Jagannathan–Ma / DeMiguel | high-dimensional $\Sigma$ and allocation; Giglio–Xiu is the pricing dual |
| Gârleanu–Pedersen 2013 | trading predictable returns; factor premia enter expected-return forecasts |

---

## 10. Replication Checklist

1. Assemble 647-portfolio monthly excess returns 1976–2010.
2. Eigenvalue plot → choose $p=7$.
3. Implement three-pass matrix estimator; Newey–West SEs.
4. Match MOM: three-pass ~49 bp vs mean 69 bp; two-pass without controls absurdly large.
5. Confirm Novy-Marx factors ≈0; liquidity/intermediary significant.
6. Vary $p\in\{5,\ldots,13\}$; check stability of $\hat{\gamma}_g$.

---

## 11. Bottom Line

Giglio and Xiu solve a first-order identification problem in empirical asset pricing: omitted factors and measurement error wreck classical risk-premia estimators. Their three-pass method—PCA span, price the PCs, map $g$ into that span—exploits rotation invariance to deliver consistent premia without naming every control. Empirically it restores sanity to the factor zoo: tradable premia match averages, economically motivated nontradables show up, and nonsense factors do not. For quants estimating or stress-testing factor premia, three-pass (or PC-augmented two-pass) should replace unaugmented Fama–MacBeth as the default.

---

## 12. Additional Discussion: Omitted Factors in Production Risk Systems

Production risk systems often regress portfolio returns on a handful of named factors (FF5+MOM+liquidity) and treat residuals as idiosyncratic. Giglio–Xiu imply that if the named set does not span the statistical factor space of the trading universe, both risk forecasts and “alpha” attributions are polluted. A practical hybrid:

1. Each period, extract $p$ PCs from the investable universe (or from a large characteristic-managed panel).
2. Estimate risk premia for PCs (pass 2) to get a model-implied expected-return vector.
3. For any fundamental factor $g$ used in research (e.g., an intermediary-capital proxy), report three-pass $\hat{\gamma}_g$ rather than a raw FF-style loading premium.
4. Feed the PC-based expected returns into a *constrained* optimizer (Jagannathan–Ma / DeMiguel lessons), not into raw MV.

This pipeline separates **spanning** (PCA) from **interpretation** (mapping $g$ to PCs) and from **implementation** (constrained, cost-aware portfolios).

### 12.1 Why two-pass exploded on MOM

Without controls, the cross-sectional regression attributes to MOM beta any priced variation correlated with MOM betas in the 647 portfolios—including exposures to other latent factors. The 2201 bp estimate is the smoking gun of omitted-variable bias in high dimensions. Adding FF3 partially absorbs the omitted span (estimate falls to 71 bp), but only a full statistical span (PCs) stabilizes the number near the tradable mean. Mimicking onto FF3 *over-corrects* (negative premium), showing that incomplete bases can bias either direction.

### 12.2 Nontradable factors: what “significant” means for trading

A significant three-pass premium on liquidity or intermediary capital does **not** automatically yield a trading strategy: the factor is not a return. One must build a mimicking portfolio in the PC space (which the theory supplies) and then trade that mimic subject to costs (Gârleanu–Pedersen). The premium identifies that the mimic should earn positive expected return; trading friction determines whether it survives net.

### 12.3 Placebo discipline

Any research pipeline that can be fed sunspot counts and produce a “significant” premium is unsafe. Three-pass’s ~0 result on Novy-Marx placebos is as important as its positive results on liquidity: it shows specificity. Mandate that every new factor pass the placebo battery under the same estimator.

### 12.4 Connection to SDF estimation

Rotational indeterminacy of latent factors is old news in APT. The contribution is showing that **a scalar functional**—the premium of a defined proxy $g$—is rotation-invariant and estimable. This is analogous to identifying an impulse response in VARs with latent shocks: the whole shock space is recovered, then a mapping from observables pins a direction.

### 12.5 Sample and external validity

1976–2010 includes the Great Moderation, the tech boom/bust, and the GFC—rich variation in intermediary and liquidity factors. Post-2020 markets (meme stocks, retail options, balance-sheet policy) may shift PC structure; re-estimate $\hat{p}$ and premia rather than freeze 2010 values. The *method* travels; the *point estimates* need refresh.

### 12.6 Final operational rule

**If you report a factor risk premium, report three-pass (or equivalent PC-augmented) estimates with $R_g^2$ and $\hat{p}$.** Unaugmented two-pass numbers are not comparable across papers that use different accidental controls—and that non-comparability has wasted enormous empirical effort in the factor literature.

---

## Extended Technical Notes

### A. Large-n asymptotics intuition

In classical fixed-n asset pricing, adding test assets eventually exhausts independent pricing restrictions. In the Giglio–Xiu large-n regime, each additional characteristic-managed portfolio contributes new beta information that helps pin down the factor space. Consistency of PCA requires that the factors be strong: the covariance contribution of each factor grows with n. Characteristic-sorted portfolios are designed precisely to load on systematic themes, so the 647-portfolio panel is an ideal environment. Weak factors that affect only a few assets will not be recovered—and their risk premia are not the object this estimator claims to deliver.

### B. Relationship between gamma and expected returns

Given betas $\beta$ on latent factors with premium vector $\gamma$, expected excess returns are $\beta\gamma$. For a tradable factor that equals a portfolio return, the premium must equal the portfolio’s expected excess return under correct specification. This is the paper’s internal validity check: three-pass estimates for market, SMB, HML, MOM, BAB, QMJ should line up with sample means. Classical estimators’ failures on this check (wrong signs, wild magnitudes) diagnose bias more convincingly than any simulation.

### C. Step-by-step MOM calculation narrative

1. Compute seven PCs of the 647 demeaned return series.
2. Regress each portfolio’s returns on the seven PCs; collect betas; cross-sectionally regress average returns on those betas → $\hat{\gamma}_{\text{PC}}$.
3. Regress MOM on the seven PCs → $\hat{h}$.
4. $\hat{\gamma}_{\text{MOM}}=\hat{h}'\hat{\gamma}_{\text{PC}}\approx 49$ bp.
5. Compare to mean MOM excess return 69 bp—same order, same sign, overlapping confidence regions given SE 24 bp on the mean.

The two-pass path without controls jumps to 2201 bp because MOM betas in the cross-section proxy for multiple omitted priced directions. Adding FF3 collapses the estimate toward 71 bp by partially spanning those directions—but “partially” is not good enough for invariance.

### D. Mimicking-portfolio geometry

The mimicking portfolio solves $\min_w\mathrm{Var}(g-w'R)$ or projects $g$ onto a basis $B_t$. If $B_t$ is the market alone, the mimic is essentially a scaled market; any premium in $g$ orthogonal to the market is lost, and any market premium is attributed to $g$. If $B_t$ is FF3, the span improves but remains incomplete relative to seven statistical factors. If $B_t$ is all 647 portfolios, the projection is in-sample perfect when n>T is not binding—but n>T makes the Gram matrix singular. PCA basis of dimension 7 is the Goldilocks span: low-dimensional, statistically grounded, and feasible.

### E. Inference and HAC

Factors and returns are serially correlated. The paper’s Newey–West-style estimators for the asymptotic variance of $\hat{\gamma}_g$ account for dependence in both the PC premia estimation error and the loading estimation error, including cross terms. In practice, use a lag length that scales with T (e.g., common rules of thumb) and report sensitivity. For tradable factors, a useful reality check is whether three-pass SEs are in the same ballpark as $\sigma/\sqrt{T}$ SEs on the mean return.

### F. Choosing p in production

Eigenvalue scree plots, Onatski tests, Bai–Ng ICs, and the paper’s own appendix estimator can disagree on the margin. A robust approach: compute $\hat{\gamma}_g(p)$ for p from 3 to 15 and plot. If the premium stabilizes for $p\ge 7$, use the plateau. If it never stabilizes, the factor may be weak or the panel insufficient. The paper’s online appendix showing robustness for $\check{p}\ge 7$ is the template for this sensitivity graphic.

### G. Macro and intermediary factors: economic reading

Significant three-pass premia on intermediary capital and liquidity align with theories where leverage-constrained intermediaries price assets (He–Kelly–Manela; Adrian–Etula–Muir; Brunnermeier–Pedersen). Stockholder consumption premium aligning better than aggregate consumption matches limited-participation theory (Malloy–Moskowitz–Vissing-Jorgensen). IP growth’s tiny premium suggests production-based factors need careful measurement to load on the asset-pricing span. Novy-Marx placebos’ zero premia under three-pass—while significant under naive two-pass—show how omitted-factor bias manufactures false narratives.

### H. What this changes in the factor literature

Many published “prices of risk” are not invariant objects; they are artifacts of control choice. Meta-analyses that pool two-pass estimates across papers without aligning controls are pooling incompatible estimands. Three-pass provides a comparable estimand: the premium of g given a statistical span of returns. Referees and quants should demand this comparability.

### I. Implementation pseudocode

```
R = demean(returns_n_by_T)
U, S, Vt = svd(R)
Vhat = first_p_right_singular_vectors  # factors T-by-p
betas = OLS(R on Vhat)
gamma_pc = OLS(mean(R) on betas)
h = OLS(g on Vhat)
gamma_g = h @ gamma_pc
SE = HAC_formula(from paper)
```

Normalize PC scales consistently with the paper’s conventions (often $\hat{v}\hat{v}'/T=I$).

### J. Portfolio construction link

Suppose three-pass says liquidity has a large premium. Build the PC-space mimic $w\propto\mathrm{Cov}(R,g)$ projected through the PC filter, then trade with Gârleanu–Pedersen dynamic costs. Do not dump raw $\hat{\gamma}_g$ into a static MV optimizer with sample $\Sigma$—DeMiguel et al. warn against that last step.

### K. Limitations revisited with mitigation

| Limitation | Mitigation |
|------------|------------|
| Weak factors | Report $R_g^2$; don’t claim premia for weak g |
| Wrong p | Sensitivity band over p |
| Structural breaks | Rolling three-pass estimates |
| Interpretation | Pair with an equilibrium story |
| Data intensity | Use public characteristic libraries; document panel |

### L. Teaching summary (one paragraph)

Omitted factors bias classical risk-premia estimators; PCA recovers the factor space; rotation invariance lets you price any observable proxy without naming the other factors; empirically this fixes absurd two-pass numbers and kills placebo factors while preserving liquidity and intermediary premia. That paragraph is the paper.

### M. Quantitative anchors to memorize

- Panel: 647 portfolios, 1976–2010 monthly.
- $\hat{p}=7$; CS $R^2\approx 59\%$.
- MOM mean 69 bp; three-pass 49 bp; two-pass no control 2201 bp.
- Nonsense factors ≈0 under three-pass.
- Liquidity, intermediary, stockholder consumption: significant.

### N. Closing synthesis for Scholar notes

Giglio and Xiu (2021 JPE) belong on the short list of methodological papers that change how empirical asset pricing should be done day to day. Together with the portfolio-constraint and 1/N literatures, they push quants toward high-dimensional humility: span the return space statistically, impose economic structure only where it identifies invariant objects, and never confuse a Fama–MacBeth coefficient under accidental controls with a risk premium.

### O. Detailed comparison with Fama–MacBeth practice

Standard Fama–MacBeth implementations in industry often include: (i) market only; (ii) FF3; (iii) FF5; (iv) FF5+MOM; (v) a kitchen sink of 10 named factors. Each produces a different “premium” for, say, a proprietary quality factor. Three-pass says the right kitchen sink is the PC span of returns—not an ever-growing list of named factors that still may omit something and that introduce multicollinearity among themselves. Named factors remain useful for *interpretation* after mapping into the PC space (pass 3), not as the exclusive first-pass controls.

### P. Measurement error algebra

If $g=h'v+z$ with $z$ classical noise, OLS of $g$ on $v$ is unbiased for $h$ in population. Two-pass that uses $g$ *as if* it were $v_1$ without accounting for $z$ and without other factors suffers attenuation and omitted-variable bias simultaneously. Three-pass separates these layers: PCs estimate $v$, then $g$ on PCs estimates $h$, then $h'\gamma$ prices only the systematic part of $g$. This is why placebos with low systematic content die.

### Q. Open research directions noted by the paper’s agenda

Combining three-pass with time-varying betas and premia; dealing with unbalanced panels; integrating characteristics as in IPCA (Kelly–Pruitt–Su) while preserving invariant premium functionals; and formalizing multiple-testing across many $g$ candidates under a shared PC span. Quants can adopt the static estimator now while tracking this frontier.

### R. Final checklist before claiming a premium

1. Compute three-pass $\hat{\gamma}_g$ with HAC SE.
2. Report $R_g^2$ and $\hat{p}$.
3. Show sensitivity to $p$.
4. Run two placebo factors through the same code.
5. If tradable, compare to average excess return.
6. Only then discuss economic magnitude and trading implications.

### S. Worked intuition with two latent factors

Suppose true $v=(v_1,v_2)'$ with premia $\gamma=(6\%,2\%)$ annualized, and $g=v_1+z$. Three-pass recovers $\gamma_g=6\%$. Two-pass using only $g$ confounds $v_2$ whenever betas on $g$ correlate with betas on $v_2$. If that correlation is 0.5 in the cross-section and $v_2$ is omitted, the contamination in the estimated price of risk is first-order. PCA recovers both factors; regression of $g$ on PCs loads only on the first; the second factor’s premium is still used to fit expected returns but does not leak into $\gamma_g$. This toy algebra is the entire paper.

### T. Scholar-note verdict

Giglio–Xiu (2021) is required methodology for anyone estimating factor risk premia in large cross-sections. Pair it with constrained portfolio construction and cost-aware trading to move from premium identification to implementable strategies without reintroducing the estimation sins documented by Jagannathan–Ma and DeMiguel–Garlappi–Uppal.

---

## 13. Why Rotation Invariance Matters Operationally

Named factor models invite endless debate: “Should we control for RMW? For BAB? For a custom quality factor?” Each control changes the estimated premium of the factor under study. Rotation invariance says the debate is misplaced if what you need is the premium of a defined proxy $g$: recover *any* basis that spans the same space, then map $g$ into it. PCA is the default basis because it is identified from returns alone. Competing bases (IPCA characteristics-based factors, fundamental factors) are valid if they span; three-pass still applies with those factors replacing PCs in passes 1–2.

### 13.1 Errors when span is incomplete

If you use only three PCs when seven are needed, you recreate omitted-factor bias inside three-pass. That is why the paper emphasizes $\check{p}\ge\hat{p}$ and shows eigenvalue evidence for seven. Underselection is more dangerous than overselection: extra PCs mostly add noise that pass 3 downweights via small $\hat{h}$.

### 13.2 Tradable vs nontradable workflow

| Factor type | Primary premium estimator | Role of three-pass |
|-------------|---------------------------|--------------------|
| Tradable (MKT, HML, MOM, BAB) | Mean excess return | Consistency check; diagnose bad panels |
| Nontradable (liquidity, intermediary, consumption) | Three-pass | Primary estimator |
| Suspicious / placebo | Three-pass | Should be ~0 |

### 13.3 Link to alpha claims

Hedge-fund “alpha” versus a deficient factor model is often omitted-factor beta. Three-pass thinking: project the fund’s returns onto a rich PC span of the investable universe; residual mean is a tougher alpha claim. This is closer to the paper’s spirit than regressing on FF3 alone.

### 13.4 Numerical anchors (repeat for memory)

647 portfolios; 1976–2010; $p=7$; CS $R^2=59\%$; MOM 69 bp mean vs 49 bp three-pass vs 2201 bp naive two-pass; placebos ≈0; liquidity & intermediary significant.

### 13.5 Closing

Asset pricing with omitted factors is not a niche econometric complaint—it is the default state of empirical work. Giglio and Xiu give the fix: span, price, map. Use it.
