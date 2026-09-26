# Cleaning Correlation Matrices — Detailed Quantitative Research Notes

## Bibliographic Header
| Field | Detail |
|------|--------|
| Title | Cleaning correlation matrices |
| Subtitle | A new cleaning recipe that outperforms all existing estimators in terms of the out-of-sample risk of synthetic portfolios |
| Authors | Joël Bun, Jean-Philippe Bouchaud, Marc Potters |
| Venue | Risk.net / Risk magazine, April 2016 (Cutting edge / investments: Portfolio management); pages reprinted as 54–58 of Dec 2015 layout |
| Affiliations | Université Paris-Saclay / Léonard de Vinci (Bun); Capital Fund Management (Bouchaud chairman/chief scientist; Potters co-CEO/head of research) |
| Original PDF | `2016-Cleaning-Correlation-Matrices_BunBouchaudPotters.pdf` |
| Core idea | Debiased **Rotationally Invariant Estimator (RIE)** of correlation matrices from RMT; beats linear shrinkage and eigenvalue clipping on OOS Markowitz risk across US/Japan/Europe equities |

## Problem / Motivation
Markowitz portfolios overweight low-eigenvalue modes of the correlation matrix. If those modes are noise, OOS risk explodes. Sample correlation $E=\frac1T XX'$ is consistent only as $q=N/T\to0$; when $q=O(1)$, Marčenko–Pastur theory says small eigenvalues are too small and large ones too large. Cleaning $E$ before inversion is mandatory for risk management and portfolio construction.

Focus is **correlations not volatilities**: returns are standardized by cross-sectional daily vol $\hat\sigma_{it}=\sqrt{\sum_j r_{jt}^2}$, then by sample vol of the adjusted series, yielding $X$. Any favourite vol model (GARCH, implied) can be layered outside.

## Five Cleaning Recipes
Denote cleaned estimator $\Xi$ of true $C$, with sample eigendecomposition $E=\sum_k\lambda_k u_k u_k^*$.

1. **Basic linear shrinkage** (Haff 1980): $\Xi^{\mathrm{bas}}=\alpha E+(1-\alpha)I_N$. Heuristic diversification control (Bouchaud–Potters 2003).
2. **Advanced linear shrinkage** (Ledoit–Wolf 2003): $\Xi^{\mathrm{adv}}=\alpha E+(1-\alpha)[(1-\rho)I+\rho ee']$ with self-consistent average correlation $\rho$. Empirically similar to (1) (LW 2014).
3. **Eigenvalue clipping** (Bouchaud–Potters 2011): keep top $\lceil N\alpha\rceil$ eigenvalues; set others to constant $\bar\lambda$ preserving $\mathrm{Tr}=N$. Ad hoc $\alpha$: keep eigenvalues above MP upper edge $(1+\sqrt q)^2$. Flaw: large eigenvalues remain overestimated.
4. **Eigenvalue substitution**: replace $\lambda_k$ by MP-inverted estimates of true eigenvalues. Numerically unstable; needs parametric spectrum (power law) or prior locations (El Karoui 2008). Ignores eigenvector noise → suboptimal.
5. **Rotationally invariant optimal shrinkage (RIE)** (Ledoit–Péché 2011; extended Bun–Knowles 2016; studied Bun–Bouchaud–Potters 2016): keep sample eigenvectors; shrink eigenvalues by
$$
\xi^{\mathrm{RIE}}_k=\frac{\lambda_k}{|1-q+q z_k s(z_k)|^2},\quad s(z)=N^{-1}\mathrm{tr}(zI-E)^{-1},\quad z_k=\lambda_k-i\eta.
$$
**Oracle** benchmark (infeasible): $\xi^{\mathrm{ora}}_k=\langle u_k, C u_k\rangle$. RIE satisfies $|\xi^{\mathrm{RIE}}_k-\langle u_k,Cu_k\rangle|=O(T^{-1/2})$ for $q=O(1)$.

Authors drop methods 2 and 4 as dominated; drop LW 2014 nonlinear shrinkage as too heavy ($O(N)$ parameters) and hostile to outliers.

## Debiasing Small Eigenvalues
Practical $\eta=N^{-1/2}$ (Bun–Knowles). For $N=400$, $\eta=0.05$ not tiny → downward bias on small eigenvalues. Heuristic correction for equities:
$$
\hat\xi_k=\xi^{\mathrm{RIE}}_k\cdot\max(1,\lambda_k)\quad\text{(paper eq. 10 / Box 1 variant)}.
$$
More carefully, Box 1 gives the full algorithm with Marčenko–Pastur Stieltjes transform correction factor $\Gamma_k$. Futures markets with near-duplicate contracts need stronger regularization (tiny true eigenvalues).

### Box 1 algorithm (implementation)
Given $\{\lambda_k\}$ and $q=N/T$:
1. Set $z_k=\lambda_k-i/\sqrt{N}$. Compute
   $\xi^{\mathrm{RIE}}_k=\lambda_k/|1-q+q z_k s_k(z_k)|^2$ with $s_k(z)=\frac1N\sum_{j\neq k}(z-\lambda_j)^{-1}$.
2. Compute bias factor $\Gamma_k$ using rescaled MP Stieltjes transform $g_{\mathrm{mp}}(z)$ with edges from smallest empirical eigenvalue $\lambda_N$.
3. Debiased: $\hat\xi_k=\Gamma_k\xi^{\mathrm{RIE}}_k$ if $\lambda_k>1$, else $\xi^{\mathrm{RIE}}_k$.

## Empirical Oracle Test
US: 500 most liquid S&P names, 1966–2012. Japan: TOPIX liquid 500, 1993–2015. Europe: Bloomberg European 500 liquid, 1996–2015. Train $T=1000$ days ($q=0.5$); OOS $T_{\mathrm{out}}=60$ days. Oracle proxy: average OOS variance of eigenportfolios $u_i$ over non-overlapping OOS blocks (Pafka–Kondor 2003). Figure 1: debiased RIE tracks oracle closely, especially in the bulk; slight $q_{\mathrm{eff}}>q$ (e.g. 0.55) due to return autocorrelations widening the spectrum (Burda et al. 2005) fits even better.

## Shrinkage Function Shape (Figure 2)
Plot $\xi(\lambda)$: clipping keeps large $\lambda$ too high and flattens mid; linear shrinkage is a straight line (never optimal for all $\lambda$); **RIE is nonlinear**—compresses large eigenvalues and lifts small ones toward the oracle curve.

## Portfolio OOS Risk Tests
Markowitz weights $w=\hat\Sigma^{-1}g/(g'\hat\Sigma^{-1}g)$ with $\hat\Sigma_{ij}=\hat\sigma_i\hat\sigma_j\Xi_{ij}$ on vol-normalized returns. Four predictors $g$:
1. Minimum variance: $g_i=1$.
2. Omniscient: $g\propto$ next-period normalized returns.
3. Mean-reversion: $g\propto-$ last-day normalized returns.
4. Random long-short: $g=\sqrt{N}\,v$, $v$ uniform on sphere.

### Table A — Annualized OOS vol % (SE in parentheses)
**Min-var US:** RIE 10.4 (0.12); Clip 10.6; LW 10.5; Identity 15.0; In-sample 11.6.
**Min-var Japan:** RIE 30.0; Clip 30.4; **LW 29.5 (only case LW wins)**; Identity 31.6; In-sample 32.3.
**Min-var Europe:** RIE 13.2; Clip 13.6; LW 13.2; Identity 20.1; In-sample 14.6.

**Omniscient US:** RIE 10.9; Clip 11.1; LW 11.1; Identity 17.3; In-sample 13.4.
**Omniscient Japan:** RIE 12.1; Clip 12.5; LW 12.2; Identity 19.4; In-sample 14.9.
**Omniscient Europe:** RIE **9.38**; Clip 11.1; LW 11.1; Identity 17.7; In-sample 12.1.

**Mean-reversion US:** RIE **7.97**; Clip 8.11; LW 8.13; Identity 17.7; In-sample 9.75.
**Mean-reversion Japan:** RIE 11.2; Clip 11.3; LW 11.3; Identity 24.0; In-sample 15.4.
**Mean-reversion Europe:** RIE **7.85**; Clip 9.35; LW 9.26; Identity 23.5; In-sample 9.65.

**Uniform/random US:** RIE 1.30; Clip 1.31; LW 1.32; Identity 1.56; In-sample 1.69.
(Similar ordering Japan/Europe.)

### Table B — Mean-reversion OOS vol vs $N$ at $q=0.5$
US N=100→400: RIE 21.9, 11.7, 10.0, **8.51** (best at each $N$).
Japan: RIE 24.5→10.5; Europe: RIE 26.3→**7.1**.
Identity and raw in-sample far worse, especially at small $N$.

**Headline:** cleaned always beats raw; debiased RIE best in all but one cell (Japan min-var, where LW edges).

## Limitations
- Rotational invariance false for market mode and sector spikes—accepted as pragmatic for the bulk.
- Equity-specific debiasing; futures need different regularization.
- Stationarity assumed between train and OOS; true $C_t$ dynamics not modeled (authors flag as future work).
- Vol estimation separated; bad vols still hurt.
- $\eta$ choice and $\Gamma_k$ correction are partly heuristic.

## Practical Takeaways for a Quant Investor
1. **Never invert raw sample correlation** when $q\gtrsim0.2$.
2. **Prefer debiased RIE** over Ledoit–Wolf linear and MP clipping for OOS risk.
3. Implement Box 1; set $q=N/T$; consider mild $q_{\mathrm{eff}}>q$ if autocorrelation is strong.
4. Pair with a serious vol model; this paper cleans **correlation only**.
5. Expect largest gains for mean-reversion and signal-rich $g$, not only min-var.
6. Robust across US/Japan/Europe and $N=100..400$.
7. Clipping is acceptable fallback; linear shrinkage acceptable; raw $E$ is not.

## Extended Implementation Notes

## Operational FAQ Block (RIE cleaning)
### Module 1
In production correlation cleaning module 1, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 2
In production correlation cleaning module 2, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 3
In production correlation cleaning module 3, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 4
In production correlation cleaning module 4, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 5
In production correlation cleaning module 5, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 6
In production correlation cleaning module 6, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 7
In production correlation cleaning module 7, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 8
In production correlation cleaning module 8, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 9
In production correlation cleaning module 9, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 10
In production correlation cleaning module 10, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 11
In production correlation cleaning module 11, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 12
In production correlation cleaning module 12, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 13
In production correlation cleaning module 13, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 14
In production correlation cleaning module 14, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).
### Module 15
In production correlation cleaning module 15, estimate $E$ on the standardized return window of length $T$ with $N$ names present for the full window (listwise deletion or pairwise with care). Compute eigenvalues/vectors. Apply Box 1 RIE+debias. Reconstruct $\Xi=U\mathrm{diag}(\hat\xi)U'$. Enforce symmetry and PSD by flooring $\hat\xi_k\ge\epsilon$. Combine with diagonal vol estimates into $\hat\Sigma$. Feed to risk model / optimizer. Monitor condition number $\hat\xi_{\max}/\hat\xi_{\min}$, effective rank, and OOS eigenportfolio variances vs oracle proxy. Recalibrate $q$ if the universe is expanding. Compare weekly vs RIE vs LW vs clip on a holdout metric (OOS min-var vol). Alert if RIE and clip disagree violently on top eigenvalues. Document that market-mode eigenvector is not rotationally invariant—optional: keep $\lambda_1$ unshrunken or replace with a structured market mode. For pair/stat-arb residual covariance, apply the same cleaner before PCA factor extraction (link to Avellaneda–Lee).

## Expanded operational notes (RIE)

### Note 1
Note 1 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 2
Note 2 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 3
Note 3 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 4
Note 4 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 5
Note 5 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 6
Note 6 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 7
Note 7 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 8
Note 8 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 9
Note 9 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 10
Note 10 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 11
Note 11 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.

### Note 12
Note 12 for Bun–Bouchaud–Potters cleaning: with $q=N/T=0.5$ and $T=1000$, US mean-reversion Markowitz OOS vol falls from 9.75% (raw) / 17.7% (identity) to 7.97% (RIE). That is a ~18% relative risk reduction vs raw and ~55% vs identity. Omniscient Europe improves from 12.1% raw to 9.38% RIE. Min-var US improves from 11.6% raw to 10.4% RIE. Always report condition numbers before/after cleaning. Cross-check Figure-1-style oracle tracking on your universe quarterly. If small eigenvalues collapse too far, strengthen the $\Gamma_k$ debias or floor $\hat\xi$. Remember rotational invariance is wrong for the market mode—optionally splice a structured one-factor block with RIE on the residual correlation. Combine with Avellaneda PCA by cleaning $\rho$ before eigen-extraction. For futures, read the Bun–Bouchaud–Potters 2016 long paper for the specialized regularizer.
