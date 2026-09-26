# Portfolio Diversification and Value at Risk under Thick-Tailedness — Ibragimov (2009) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Portfolio diversification and value at risk under thick-tailedness |
| **Author** | Rustam Ibragimov — Department of Economics, Harvard University (Littauer Center) |
| **Outlet** | *Quantitative Finance*, Vol. 9, No. 5, August 2009, pp. 565–580 |
| **DOI** | 10.1080/14697680802629384 |
| **Submitted / accepted** | 28 Feb 2007 / 10 Nov 2008; published online 18 Jun 2009 |
| **Origin** | Part of Yale PhD dissertation (March 2005); earlier circulating titles 2003–2005 on robustness of economic models to heavy-tailedness |
| **Keywords** | Value at risk; Heavy-tailed risks; Portfolios; Diversification; Risk bounds; Coherent measures of risk |
| **Original PDF** | `PortfolioHeavyTails_Ibragimov_2009.pdf` |
| **Drive file_id** | `1cBdioPbp9ZLbHucIlMGqeQqiIjYYUdyj` |
| **Extraction** | Binary download + `pdftotext -layout`; ~16,900 words; Taylor & Francis two-column; alnum ratio ~0.32 due to running headers — text usable |

Email: ribragim@fas.harvard.edu.

---

## Problem / Motivation

Classical portfolio folklore: diversification reduces risk. Under Gaussian or thin-tailed risks, equal-weight portfolios have lower VaR than concentrated ones. Empirically, many financial and economic series are **power-law heavy-tailed**: $\mathbb{P}(|X|>x)\asymp x^{-\alpha}$ with tail index $\alpha>0$. Moments $\mathbb{E}|X|^p$ exist only for $p<\alpha$.

Documented $\alpha$ ranges (paper’s literature survey):

- Mandelbrot (1963): cotton daily changes $\alpha\approx 1.7$ (infinite variance).
- Equity/index studies: Jansen–de Vries $\alpha\in[3,5]$; Loretan–Phillips $\approx[2,5]$; McCulloch $\approx[1.5,5]$; Rachev–Mittnik $\approx[0.9,5]$.
- Stable fits with $\alpha\in(1,2)$ for some indices; others have $\alpha>2$ or semi-heavy tails (hyperbolic, truncated stable).
- Operational losses, FX (e.g. Bulgarian lev/USD), technological-innovation returns, earthquake economic losses: $\alpha$ can be **≤1** (infinite mean). Seismic theory: loss tails $\alpha\in[0.6,1.5]$. Gabaix et al.: stock-return $\alpha\approx 3$, volume $\approx 1.5$, trades $\approx 3.4$; mutual-fund sizes $\alpha\approx 1$ (Zipf).

**Key theoretical punchline.** Diversification **reduces** VaR when risks are only **moderately** heavy-tailed (finite mean, convolutions of stables with $\alpha>1$, plus log-concave noise). Diversification **increases** VaR when risks are **extremely** heavy-tailed (infinite mean, convolutions of stables with $\alpha<1$). At the Cauchy boundary $\alpha=1$, VaR is **invariant** to portfolio weights (given fixed sum of weights).

Expected utility is often unavailable under infinite means; coherent spectral risk measures / expected shortfall also require finite first moments. VaR remains defined without moment restrictions — hence the natural criterion here. (Ibragimov–Walden 2007 link VaR comparisons to EU when utility becomes convex in the far loss region / limited liability.)

---

## Setup: Distribution Classes and VaR

### Stable laws $S_\alpha(\sigma,\beta,\mu)$

Characteristic function (paper’s parameterization):

$$
\mathbb{E}e^{ixX}=
\begin{cases}
\exp\!\big(i\mu x-\sigma^\alpha|x|^\alpha(1-i\beta\,\mathrm{sign}(x)\tan(\pi\alpha/2))\big), & \alpha\neq 1,\\
\exp\!\big(i\mu x-\sigma|x|(1+i\beta\frac{2}{\pi}\mathrm{sign}(x)\ln|x|)\big), & \alpha=1.
\end{cases}
$$

Closed densities only for: Gaussian $\alpha=2$; Cauchy $\alpha=1,\beta=0$; Lévy $\alpha=1/2,\beta=1$ (and reflections/shifts). For $\alpha\in(0,2)$, power tails; $\mathbb{E}|X|^p<\infty$ iff $p<\alpha$. Strictly stable i.i.d. closed under linear combinations:

$$
\sum_{i=1}^n c_i X_i \;\stackrel{d}{=}\;\Big(\sum_i c_i^\alpha\Big)^{1/\alpha} X_1\qquad (c_i\ge 0,\;\sum c_i\neq 0).
$$

### Convolution classes

- $\overline{\mathrm{CS}}(r)$: convolutions of symmetric stables with indices in $(r,2]$ (overbar = indices **above** threshold $r$).
- $\underline{\mathrm{CS}}(r)$: convolutions of symmetric stables with indices in $(0,r)$.
- $\mathrm{LC}$: symmetric **log-concave** densities (normal, uniform, exponential, Gamma shape ≥1, Beta with both params ≥1, Weibull shape ≥1, …). Log-concave ⇒ at most exponential tails; all power moments finite; closed under convolution.
- $\mathrm{CSLC}$: convolutions of $\mathrm{LC}$ with $\overline{\mathrm{CS}}(1)$ — **moderately heavy-tailed**, finite means.
- Extremely heavy-tailed working class: $\underline{\mathrm{CS}}(1)$ — infinite means.

Cauchy $S_1(\sigma,0,0)$ sits on the boundary between $\overline{\mathrm{CS}}(1)$ and $\underline{\mathrm{CS}}(1)$. Normal sits on the boundary between $\mathrm{LC}$ and $\overline{\mathrm{CS}}(2)$.

### Value at risk

For loss probability $q\in(0,1)$,

$$
\mathrm{VaR}_q(X)=\inf\{z\in\mathbb{R}:\mathbb{P}(X>z)\le q\}
$$

(upper quantile; paper’s sign convention treats $X$ as the P&L/risk r.v. being portfolio-linearly combined). Positive homogeneity: $\mathrm{VaR}_q(cX)=c\,\mathrm{VaR}_q(X)$ for $c>0$. Translation equivariance and monotonicity hold; **subadditivity/convexity fail in general** — VaR is not coherent (Artzner et al.). Paper’s diversification theorems imply when diversification reduces or increases VaR, which speaks directly to when subadditivity holds or fails for linear portfolios.

Portfolio: $Z_w=\sum_{i=1}^n w_i X_i$, weights in the simplex-related set $I_n=\{w\in\mathbb{R}_+^n:\sum w_i=1\}$ (also analyzed on $\mathbb{R}_+^n$ more generally). Extremes: $w^*=(1/n,\ldots,1/n)$ most diversified; $w^\circ=(1,0,\ldots,0)$ least diversified (single name).

### Majorization formalization of diversification

Vector $a$ is majorized by $b$, written $a\prec b$, if partial sums of ordered components satisfy $\sum_{i=1}^k a_{[i]}\le\sum_{i=1}^k b_{[i]}$ for $k=1,\ldots,n-1$ and total sums equal. Then $a$ is **less diverse** than $b$. Paper’s convention for portfolios: if $v\prec w$, portfolio with weights $v$ is interpreted as **more diversified** than that with $w$ (equal weights most diversified among $I_n$).

Schur-convex / Schur-concave functions preserve / reverse majorization. Example: $\phi(w)=\sum w_i^2$ and $\sum w_i^\rho$ for $\rho>1$ are strictly Schur-convex; for $\rho<1$ strictly Schur-concave.

---

## Main Theorems

### Theorem 4.1 (Moderate heavy tails — diversification helps)

Let $q\in(0,1/2)$ and $X_i$ i.i.d. with $X_i\sim\mathrm{CSLC}$ (finite mean, moderately heavy). Then:

**(i)** $\mathrm{VaR}_q(Z_v)<\mathrm{VaR}_q(Z_w)$ whenever $v\prec w$ and $v$ is not a permutation of $w$. Equivalently, $w\mapsto\mathrm{VaR}_q(Z_w)$ is **strictly Schur-convex** on $\mathbb{R}_+^n$.

**(ii)** In particular, for all $w\in I_n$ not equal/permute to $w^*$ or $w^\circ$,

$$
\mathrm{VaR}_q(Z_{w^*})\;<\;\mathrm{VaR}_q(Z_w)\;<\;\mathrm{VaR}_q(Z_{w^\circ}).
$$

**Gaussian example.** $X_i\sim S_2(\sigma,0,0)$ i.i.d. ⇒ $Z_{w^*}\stackrel{d}{=}n^{-1/2}X_1$, so $\mathrm{VaR}_q(Z_{w^*})=n^{-1/2}\mathrm{VaR}_q(X_1)<\mathrm{VaR}_q(Z_{w^\circ})$.

### Theorem 4.2 (Extreme heavy tails — diversification hurts)

Let $q\in(0,1/2)$ and $X_i$ i.i.d. with $X_i\sim\underline{\mathrm{CS}}(1)$ (infinite mean). Then:

**(i)** $\mathrm{VaR}_q(Z_v)>\mathrm{VaR}_q(Z_w)$ whenever $v\prec w$ and $v$ not a permutation of $w$. Equivalently, $w\mapsto\mathrm{VaR}_q(Z_w)$ is **strictly Schur-concave** on $\mathbb{R}_+^n$.

**(ii)** In particular,

$$
\mathrm{VaR}_q(Z_{w^\circ})\;<\;\mathrm{VaR}_q(Z_w)\;<\;\mathrm{VaR}_q(Z_{w^*}).
$$

**Lévy example intuition.** For one-sided Lévy $\alpha=1/2$, scaling gives $\mathrm{VaR}_q(Z_{w^*})=n\,\mathrm{VaR}_q(X_1)$ in the equal-weight case relative to the concentrated portfolio in the paper’s illustration — diversification multiplies VaR by $n$.

### Boundary $\alpha=1$ (Cauchy)

For i.i.d. symmetric Cauchy, convolution property with $\alpha=1$ gives $Z_w\stackrel{d}{=}X_1$ whenever $\sum w_i=1$. Hence $\mathrm{VaR}_q(Z_w)=\mathrm{VaR}_q(X_1)$ **independent of $w$**. VaR is simultaneously Schur-convex and Schur-concave (flat in majorization). Diversification neither helps nor hurts VaR.

### Sharp bounds (Remark 1 / Appendix C)

Among portfolios with given majorization constraints / fixed $\sum w_i$, Theorems C.1–C.2 and C.5 give sharp VaR bounds for skewed and heterogeneous stables. Under heterogeneity, **$p$-majorization** extensions help formalize diversification when risks are not IID.

### Dependence extensions (Section 5)

Results extend to convolutions of vectors with joint **$\alpha$-symmetric** distributions: characteristic function $\psi\big((\sum|t_i|^\alpha)^{1/\alpha}\big)$. Includes:

- Common-shock models affecting all names,
- Spherical distributions ($\alpha=2$): Kotz, multinormal, logistic, multivariate $t$, normal mixtures, multivariate $\alpha$-stable spherical laws.

Same dichotomy: diversification helps when the $\alpha$-symmetry index $>1$; reverses when $<1$. Truncation arguments (Ibragimov–Walden 2007; Ibragimov et al. 2009): conclusions persist for **bounded** risks obtained by truncating stables/$\alpha$-symmetric laws on a sufficiently large interval — relevant for limited-liability payoffs.

### Coherency implications (Remark 4)

Because diversification can **increase** VaR under extreme thick tails, VaR violates the diversification theorem / subadditivity in those regimes in a strong, majorization-monotone way. This is sharper than generic counterexamples: the failure is systematic for the entire class $\underline{\mathrm{CS}}(1)$. Conversely, within $\mathrm{CSLC}$, majorization-monotone VaR reduction aligns with the economic diversification principle even though VaR is still not always coherent in full generality.

---

## Proof Architecture (for quant readers)

1. **IID stable case:** closure under convolution + positive homogeneity of VaR reduce portfolio VaR comparisons to comparing Schur-convex/concave functions of weights $w\mapsto(\sum w_i^\alpha)^{1/\alpha}$. For $\alpha>1$ this map is Schur-convex-type in the relevant sense; for $\alpha<1$ Schur-concave-type.
2. **Transfer to convolutions:** unimodality and VaR comparison lemmas for symmetric unimodal laws (Appendix A: Zolotarev, Dharmadhikari–Joag-Dev, etc.) extend inequalities from pure stables to convolutions of stables with different indices and to mixtures with log-concave noise ($\mathrm{CSLC}$).
3. **Dependence:** $\alpha$-symmetric c.f. structure preserves the same homogeneous scaling in an appropriate norm, so majorization arguments carry through.
4. **Skew / heterogeneity (Appendix C):** one-sided stables, non-identical scales $\sigma_i$, and ordered majorization variants; sharp bounds when scales are majorized.

---

## Empirical / Calibration Implications (no simulation tables in paper — theory paper)

Although there are no Monte Carlo tables, the literature survey implies operational regimes:

| Tail index regime | Moments | Diversification vs VaR | Portfolio implication |
|-------------------|---------|------------------------|----------------------|
| $\alpha>2$ (finite variance) | All ≤2 | Helps (Theorem 4.1 via CSLC / LC) | Standard diversification |
| $1<\alpha\le 2$ (infinite var, finite mean) | Mean yes, var no | Helps | Diversify; mean–variance theory invalid but VaR diversification OK |
| $\alpha=1$ (Cauchy) | Mean no | Neutral | Weights irrelevant for VaR given $\sum w_i$ |
| $\alpha<1$ (infinite mean) | None ≥1 | **Hurts** | **Concentration reduces VaR**; equal weight worst |

**Caveat on estimation.** Hill / log-log rank-size estimators are biased upward for infinite-variance stables in typical sample sizes (McCulloch 1997; Weron 2001; Borak et al.; Gabaix–Ibragimov). Point estimate $\hat\alpha>1$ does **not** safely rule out true $\alpha<1$; similarly $\hat\alpha>2$ does not safely rule out infinite variance. For operational risk and catastrophe books where theory suggests $\alpha<1$, do not assume diversification is VaR-reducing.

---

## Limitations

1. Theory paper — no asset-pricing / return-forecasting exercise; no estimated $\alpha$ on a specific portfolio in the main text.
2. Primary theorems: i.i.d. or exchangeable convolution structure; heterogeneity handled in appendix with extra majorization tools.
3. VaR at $q\in(0,1/2)$ (loss side); coherence critique is about subadditivity, not about elicitation.
4. Expected shortfall not analyzed as primary criterion (requires finite means — unavailable precisely when diversification reverses).
5. Static one-period portfolios; no dynamic rebalancing, no serial dependence beyond the cross-sectional $\alpha$-symmetric dependence.

---

## Practical Takeaways for a Quant Investor / Risk Manager

1. **Diagnose the tail index before preaching diversification.** For liquid equity factors with $\alpha\approx 3$, diversification remains VaR-friendly. For operational risk, catastrophe reinsurance, litigation books, or innovation-payoff portfolios with $\alpha\lesssim 1$, **equal-weight diversification can maximize VaR** — prefer concentration or structured hedges.

2. **Cauchy boundary is a useful stress.** If portfolio VaR is roughly invariant to weights in stress models, you may be near $\alpha=1$ dynamics; optimization on VaR is then ill-posed / flat.

3. **Do not use ES/spectral risk as a workaround for $\alpha<1$.** Those require finite means; the infinite-mean world is exactly where diversification reverses for VaR.

4. **Common shocks / multivariate $t$ / spherical dependence do not overturn the dichotomy.** If the $\alpha$-symmetry index is $<1$, diversification still hurts VaR. Multivariate $t$ with low d.f. is still in the “helps” region if means exist, but extremes behave like power laws with $\alpha=\nu$.

5. **Truncated / limited-liability payoffs:** results survive truncation on large intervals — limited liability does not automatically restore diversification benefits under extreme thick tails.

6. **Majorization as a design language.** When comparing overlay books, ask whether weight vector $v$ is majorized by $w$; under moderate tails, VaR should be lower for $v$. This is a model-free comparative static once the tail class is known.

7. **Link to Prospect Theory / limited liability:** Ibragimov–Walden note that EU comparisons can align with these VaR non-diversification results when utility is convex in deep losses — i.e., agents may rationally prefer concentration.

---

## Equations Quick Reference

$$
\mathbb{P}(|X|>x)\asymp x^{-\alpha},\quad
\sum c_i X_i \stackrel{d}{=} \Big(\sum c_i^\alpha\Big)^{1/\alpha}X_1\ \ (\text{i.i.d. strictly stable}).
$$

$$
\mathrm{VaR}_q(Z_w)\ \text{Schur-convex in }w\ \text{on CSLC};\quad
\text{Schur-concave on }\underline{\mathrm{CS}}(1);\quad
\text{flat on Cauchy }(\alpha=1).
$$

Majorization: $v\prec w$ ⇒ $v$ more diversified ⇒ lower VaR (Thm 4.1) or higher VaR (Thm 4.2).


---

## Extended Discussion of Heavy-Tailedness Evidence

Mandelbrot cotton example (alpha approx 1.7) already sits in infinite-variance but finite-mean region: Theorem 4.1 still says diversify for VaR. The dangerous region for the folklore is alpha<1, documented for:

- Some FX and market-time processes (Rachev-Mittnik),
- Operational loss severities (Neslehova et al.),
- Returns to technological innovations (Scherer et al.; Silverberg-Verspagen) with alpha considerably less than one,
- Earthquake and natural-disaster economic losses with alpha in [0.6, 1.5] from physical power laws for magnitudes (Ibragimov et al. 2009).

Cross-country similarity of tail exponents (Lux; Guillaume et al.; Gabaix et al.) suggests the qualitative dichotomy is not a US-equity curiosity.

Gabaix et al. mechanism — large institutions with Zipf size distribution generate return tails with alpha approx 3 — places liquid equities firmly in the diversification-helps region for VaR, consistent with industry practice. The paper's value is marking the boundary where that practice fails.

## Coherent Risk Measures vs VaR — Precise Tension

Artzner-Delbaen-Eber-Heath coherency axioms: translation invariance, subadditivity, positive homogeneity, monotonicity. VaR fails subadditivity in general. Expected shortfall ES_q = E[X | X > VaR_q(X)] is coherent but needs E|X|<infinity. Spectral risk measures inherit the same requirement. Therefore:

- When alpha>1 (Theorem 4.1 world): both VaR diversification and ES are available; ES preferred for coherency.
- When alpha<1 (Theorem 4.2 world): ES is infinite/undefined; VaR remains finite and says do not diversify. Using ES as a fix is impossible; using Gaussian VaR is misleading.

Acerbi-Tasche critiques of VaR are correct in the moderate-tail world but incomplete for infinite-mean risks — this paper fills that gap with majorization.

## Majorization Pre-Ordering — Worked Portfolio Comparisons

For n=3, w*=(1/3,1/3,1/3) is majorized by (1/2,1/2,0) which is majorized by (1,0,0)=w_circ. Theorem 4.1 implies VaR(Z_w*) < VaR(Z_(1/2,1/2,0)) < VaR(Z_w_circ). Theorem 4.2 reverses all inequalities. Adding a fourth independent risk and moving to equal 1/4 weights further reduces VaR under 4.1 and further increases it under 4.2 — formalizing "adding names" as majorization refinement.

When some weights are zero, majorization still compares portfolios with different effective n. This matters for long-short books with sparse active weights.

## Dependence: Common Shocks

Typical common-shock model: X_i = Y_0 + Y_i with Y_j independent stables. The vector (X_1,...,X_n) then lies in an alpha-symmetric / convolution class. Diversification theorems apply to idiosyncratic parts with the same alpha-dichotomy; a dominant common shock with alpha<1 can make portfolio VaR behave like the common factor regardless of weights — concentration vs diversification becomes secondary to factor exposure management.

Multivariate t_nu (spherical) has tail index nu: for nu>1 means exist and diversification helps VaR; for nu<=1 means fail. Equity applications typically use nu in [3,8] — still Theorem 4.1 territory — but stress calibrations with nu<1 flip the advice.

## Skewness and Heterogeneity (Appendix C Summary)

One-sided stables (beta = +/-1, alpha<1) model pure loss severities. Heterogeneous scales sigma_1 >= ... >= sigma_n interact with weight majorization: allocating more weight to thinner-tailed names can dominate equal weight even under extreme tails. Theorems C.1-C.5 provide sharp VaR bounds; p-majorization is proposed for formalizing diversification when risks are non-exchangeable.

## Connection to Other Economic Models in the Dissertation

Ibragimov (2005) applies the same majorization-of-linear-combinations technology to: efficiency of linear estimators under heavy tails; firm growth when firms invest in market information; multiproduct monopolist bundling; inheritance models in evolutionary theory. Meta-conclusion across models: implications are robust to moderate heavy tails but reverse under extreme heavy tails. Portfolio VaR is one instance of a general robustness boundary at alpha=1.

## Quant Risk-System Design Implications

1. Maintain a tail-index monitoring dashboard (Hill with bias corrections; Gabaix-Ibragimov rank-size; stable MLE) by book.
2. Flag books with hat-alpha < 1.5 for "diversification may not reduce VaR" review; below 1.2 escalate.
3. For flagged books, optimize concentration constraints differently: minimum name caps may increase VaR — replace with scenario ES on truncated models or structured reinsurance.
4. In CCA / operational risk AMA capital, beware regulatory preferences for diversification credits when severity alpha<1.
5. For multi-strategy hedge funds: treating strategy returns as underline-CS(1) risks rationalizes running fewer, more concentrated strategies from a VaR perspective — opposite of PR marketing.

## Stable Scaling Arithmetic for Desk Quants

If X_i IID strictly stable with index alpha and scale sigma, and w in the simplex, then
Z_w = sum w_i X_i  =^d  (sum w_i^alpha)^{1/alpha} X_1.
Hence VaR_q(Z_w) = (sum w_i^alpha)^{1/alpha} VaR_q(X_1).

Define psi_alpha(w) = (sum w_i^alpha)^{1/alpha}. Then:
- alpha>1: psi_alpha is Schur-convex on the simplex (diversification lowers psi and VaR);
- alpha<1: psi_alpha is Schur-concave (diversification raises psi and VaR);
- alpha=1: psi_1(w)=sum w_i=1 (flat).

For equal weights, psi_alpha(w*) = n^{1/alpha - 1}. Relative to concentrated VaR:
- alpha=2: factor n^{-1/2} (classical sqrt-N rule);
- alpha=1.5: factor n^{-1/3};
- alpha=0.5: factor n^{+1} (diversification multiplies VaR by n).

This single formula is the operational heart of Theorems 4.1-4.2 in the pure stable case; convolutions extend it qualitatively.

## Unimodality Lemmas (Appendix A Role)

Proofs use: symmetric unimodal densities closed under convolution in relevant classes; VaR comparisons for unimodal symmetric r.v.s (Propositions A.2-A.7 citing Zolotarev, Dharmadhikari-Joag-Dev, Marshall-Olkin). These transfer inequalities from pure stables to CSLC. Log-concave pooling with stables of alpha>1 works because both classes produce symmetric unimodal convolutions with the right Schur geometry.

## What the Paper Does Not Claim

It does not claim mean-variance optimization is valid for alpha in (1,2) — variances are infinite. It claims only VaR comparisons under majorization. It does not provide estimators of alpha. It does not solve dynamic portfolio choice. It does not assert that investors should maximize VaR. The normative content is comparative: given VaR as the risk yardstick, diversification is or is not desirable depending on the tail class.

## Final Synthesis

Ibragimov (2009) replaces the slogan "diversification reduces risk" with a sharp, majorization-based dichotomy keyed to the tail index relative to one. For a quant investor: keep diversifying liquid factor books; stop assuming diversification helps for infinite-mean operational, catastrophe, and innovation exposures; treat Cauchy as the knife-edge where portfolio construction cannot improve VaR. The mathematical content (Schur-convexity of VaR in weights) is the right language for writing risk-policy rules that branch on estimated tail thickness.


## Section-by-Section Map

Section 1: objectives, literature on heavy tails, extensions preview, organization.
Section 2: notation — symmetric densities, log-concave class LC, stable laws, convolution classes CS-bar(r), CS-underline(r), CSLC; moment properties; nesting of classes; Cauchy/normal as boundaries.
Section 3: VaR definition, coherency axioms a1-a4, failure of subadditivity, positive homogeneity used repeatedly.
Section 4: majorization definition, diversification interpretation, Theorems 4.1 and 4.2, Cauchy neutrality, Remarks on bounds and coherency.
Section 5: alpha-symmetric and spherical dependence, common shocks, multivariate t.
Section 6: concluding remarks.
Appendices A-C: unimodality/VaR lemmas, proofs, skew/heterogeneity extensions.

## Worked Numerical Illustration (Pure Stable)

Suppose VaR_0.01(X_1)=100 for a single name, alpha=1.5, n=25 equal weight.
psi = 25^{1/1.5 - 1} = 25^{-1/3} approx 0.34.
Portfolio VaR approx 34 vs 100 concentrated — diversification helps.

Same with alpha=0.75, n=25:
psi = 25^{1/0.75 - 1} = 25^{1/3} approx 2.92.
Portfolio VaR approx 292 vs 100 concentrated — diversification nearly triples VaR.

Same with alpha=1 (Cauchy): psi=1, VaR=100 regardless of n.

These arithmetic examples are what a risk committee can put on a slide; Theorems 4.1-4.2 say the same geometry holds for the wider convolution classes, not only pure stables.

## Remark on Preference Convexity in Losses

Footnote linkage to Prospect Theory: if utility is convex in the domain of large losses (Kahneman-Tversky) or if limited liability truncates gains to the firm while losses are socialized, expected-utility agents may prefer non-diversified exposures for the same mathematical reasons VaR rises with diversification under alpha<1. Truncation results cited in the paper show the VaR ranking survives bounded support when the truncation window is wide enough.

## Conclusion for Scholar Library

This paper is the canonical reference for when the diversification principle fails under thick tails. Cite Theorems 4.1-4.2 and the alpha=1 boundary; use the psi_alpha(w)=(sum w_i^alpha)^{1/alpha} formula for quick comparative statics; monitor tail indices by book before granting diversification capital relief.


## Additional Formal Statements

Definition (majorization): For a,b in R^n_+, a precedes b (a majorized by b) when sum_{i=1}^k a_[i] <= sum_{i=1}^k b_[i] for k=1..n-1 and total sums equal, with a_[1]>=...>=a_[n] the decreasing rearrangement.

Definition (Schur-convex): phi is Schur-convex if a majorized by b implies phi(a)<=phi(b). Strictly Schur-convex if inequality strict when a is not a permutation of b.

Portfolio reading: among weight vectors in the simplex, equal weight is majorized by every other weight vector (most diversified). Single-name weight majorizes every other (least diversified).

Theorem 4.1 restated for practitioners: Under CSLC risks and q in (0,1/2), VaR_q is strictly Schur-convex in portfolio weights. Diversifying (moving toward equal weight in the majorization order) strictly reduces VaR.

Theorem 4.2 restated: Under underline-CS(1) risks and q in (0,1/2), VaR_q is strictly Schur-concave in weights. Diversifying strictly increases VaR.

Cauchy knife-edge: VaR_q(Z_w)=VaR_q(X_1) for all w with sum w_i=1.

Homogeneous scaling formula for IID strictly stable risks:
VaR_q(sum w_i X_i) = (sum w_i^alpha)^{1/alpha} VaR_q(X_1).
Equal-weight multiplier relative to single name: n^{1/alpha - 1}.

Case table:
alpha=2: n^{-0.5}; alpha=1.5: n^{-1/3}; alpha=1: n^{0}=1; alpha=0.5: n^{+1}.


## Desk Implementation Notes

1. Estimate alpha per risk class with multiple estimators; report a range.
2. If upper end of range < 1, disable diversification capital credits in internal models.
3. If range straddles 1, run both Theorem 4.1 and 4.2 comparative statics as stress.
4. For spherical t_nu models, set nu as the effective alpha; require nu>1 for mean-based optimization.
5. When building operational-risk LDA, severity distributions with alpha<1 imply that "adding more business lines" can raise VaR — model explicitly before accepting diversification benefits in AMA.
6. Catastrophe reinsurance: if ceded losses have alpha<1, a more diversified book of cat perils can have higher VaR than a concentrated book — matches some practitioner folklore about "correlation 1 in the tail" but here it is about tail index not correlation.
7. Equity long-short: alpha approx 3 world — standard diversification applies; the paper is not an excuse to run 5-name portfolios in liquid equity.


## Proof Sketch Expanded

Step A: For IID strictly stable, Z_w =^d (sum w_i^alpha)^{1/alpha} X_1 by the c.f. product and definition of stability. VaR inherits the scale factor by positive homogeneity.

Step B: The map w |-> (sum w_i^alpha)^{1/alpha} on the simplex is Schur-convex for alpha>1 and Schur-concave for alpha<1 (Marshall-Olkin). Compose with increasing scale-to-VaR map.

Step C: For convolutions of stables with different alphas all >1, use that sums of independent symmetric unimodal r.v.s remain symmetric unimodal (Appendix A), and VaR comparison lemmas (Props A.2-A.7) allow transferring inequalities when scales are ordered by majorization-type relations.

Step D: CSLC adds log-concave noise. Log-concave densities are strongly unimodal; convolution with alpha>1 stables stays in the "diversification helps" geometry (Remark 2).

Step E: alpha-symmetric vectors have c.f. psi( (sum |t_i|^alpha)^{1/alpha} ). Linear forms inherit alpha-norm scaling analogous to Step A, yielding the same Schur geometry for the alpha-norm of weights.

Step F: Heterogeneous scales require weighted majorization / p-majorization (Appendix C) to keep sharp bounds.


## Frequently Asked Questions

Q: Does infinite variance alone reverse diversification?
A: No. Need infinite mean (alpha<=1). For alpha in (1,2), variance infinite but Theorem 4.1 still says diversify for VaR.

Q: Is this about correlation?
A: No. Even independent risks reverse diversification under alpha<1. Dependence (common shocks) can reinforce or dominate but is not the mechanism.

Q: Should we abandon mean-variance?
A: MV already assumes finite variance. This paper is about VaR under possibly infinite variance/mean. Separate issue.

Q: Does subadditivity of ES save diversification for alpha<1?
A: ES is infinite when means are infinite. No.

Q: Are equity returns in the danger zone?
A: Typical estimates alpha in 3-5 for equities — safe for Theorem 4.1. Danger zone is operational risk, cat losses, some FX, innovation payoffs.

Q: What about truncated stables?
A: Paper cites results that rankings survive truncation on large intervals — limited liability does not automatically restore diversification benefits.


## Frequently Asked Questions

Q: Does infinite variance alone reverse diversification?
A: No. Need infinite mean (alpha<=1). For alpha in (1,2), variance infinite but Theorem 4.1 still says diversify for VaR.

Q: Is this about correlation?
A: No. Even independent risks reverse diversification under alpha<1. Dependence (common shocks) can reinforce or dominate but is not the mechanism.

Q: Should we abandon mean-variance?
A: MV already assumes finite variance. This paper is about VaR under possibly infinite variance/mean. Separate issue.

Q: Does subadditivity of ES save diversification for alpha<1?
A: ES is infinite when means are infinite. No.

Q: Are equity returns in the danger zone?
A: Typical estimates alpha in 3-5 for equities — safe for Theorem 4.1. Danger zone is operational risk, cat losses, some FX, innovation payoffs.

Q: What about truncated stables?
A: Paper cites results that rankings survive truncation on large intervals — limited liability does not automatically restore diversification benefits.


## Frequently Asked Questions

Q: Does infinite variance alone reverse diversification?
A: No. Need infinite mean (alpha<=1). For alpha in (1,2), variance infinite but Theorem 4.1 still says diversify for VaR.

Q: Is this about correlation?
A: No. Even independent risks reverse diversification under alpha<1. Dependence (common shocks) can reinforce or dominate but is not the mechanism.

Q: Should we abandon mean-variance?
A: MV already assumes finite variance. This paper is about VaR under possibly infinite variance/mean. Separate issue.

Q: Does subadditivity of ES save diversification for alpha<1?
A: ES is infinite when means are infinite. No.

Q: Are equity returns in the danger zone?
A: Typical estimates alpha in 3-5 for equities — safe for Theorem 4.1. Danger zone is operational risk, cat losses, some FX, innovation payoffs.

Q: What about truncated stables?
A: Paper cites results that rankings survive truncation on large intervals — limited liability does not automatically restore diversification benefits.
