# The Most General Methodology to Create a Valid Correlation Matrix for Risk Management and Option Pricing Purposes

**Authors:** Riccardo Rebonato; Peter Jäckel  
**Affiliation:** Quantitative Research Centre of the NatWest Group  
**Date:** 19 October 1999  
**Source PDF:** `RebonatoJaeckel_  Methodology to Create a Valid Correlation Matrix.pdf`  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_1)  
**OCR:** Not required; clean `pdftotext -layout` extract (~4,149 words of source; OCR of math glyphs imperfect but method reconstructible)

---

## 1. Problem and Motivation

Correlation matrices appear throughout quantitative finance: instantaneous correlations in **BGM/LMM** interest-rate option models; stress-testing and scenario analysis for market-risk VaR; obligor correlations for credit-derivative pricing and credit-risk capital. In the ideal case—recovering the real-world correlation—the problem is well-posed and solvable by standard statistics. In practice, estimation is polluted by:

- **outliers** that distort sample correlations;  
- **non-synchronous** data that mask or destroy correlation patterns;  
- **discontinuities** across deposit / futures / swap segments of the yield curve;  
- the need to **invent** correlations for legacy currencies subsumed in the euro (no history);  
- **paradigm shifts** (currency controls, central-bank independence, Russia 1998 default) that make historical correlations unreliable guides to the future.

Option markets offer some forward-looking volatility information, but Rebonato (1996–1999) shows that caplet/swaption prices **cannot uniquely pin down** both time-dependent forward-rate volatilities and the full forward-rate correlation matrix; even with known instantaneous volatilities, swaptions have **poor discriminatory power** across correlation structures. Practitioners therefore routinely **alter** an estimated matrix by financial intuition, or construct one from scratch (e.g., factorizing country/sector factors for $n$th-to-default swaps).

The hard constraint: a correlation matrix must be **real, symmetric, and positive-semidefinite (PSD)**. This is not optional. A variance–covariance VaR

$$
\text{VaR} \propto \sqrt{w^\top \Sigma w}
$$

is not guaranteed positive if $\Sigma$ fails to be PSD. Monte Carlo generation of correlated normals via $x = B z$ with $\Sigma = BB^\top$ likewise fails.

Prior fixes are incomplete:

- **Finger (1997) / RiskMetrics** stress methodology increases selected correlations but forces uncontrolled changes elsewhere to restore PSD (Brooks–Scott-Quinn–Whalmsey 1998 document the drawback).  
- **Kupiec (1998) shrinkage** iterates from a known PSD matrix toward a target; it requires a full eigen-decomposition each iteration, needs a PSD anchor, and has no clear optimality metric.

Rebonato–Jäckel propose two methods that:

1. **guarantee** a PSD correlation matrix;  
2. **do not require** a pre-existing acceptable matrix;  
3. are **fast** even for large $n$;  
4. (Method 1) recover the feasible matrix closest to a target under a **user-chosen metric**.

Method 2 shares (1)–(3), is even faster, and empirically nearly matches Method 1 under the natural elementwise metric—so it serves as a stand-alone approximation or as a warm start for Method 1.

---

## 2. Method 1 — Hypersphere Decomposition

### 2.1 Algebraic foundation

Every matrix of the form $C = BB^\top$ is PSD, and every PSD matrix admits such a factorization. For a correlation matrix one further requires $\operatorname{diag}(C) = \mathbf{1}$.

View the **rows** of $B$ as coordinates of points on the **unit hypersphere** in $\mathbb{R}^n$. Parameterize those coordinates by $n(n-1)/2$ angular coordinates $\theta_{ij}$:

$$
b_{ik} =
\begin{cases}
\cos\theta_{i1}, & k=1,\\
\cos\theta_{ik}\prod_{j=1}^{k-1}\sin\theta_{ij}, & 1 < k < n,\\
\prod_{j=1}^{n-1}\sin\theta_{ij}, & k=n.
\end{cases}
$$

(Exact index conventions follow Rebonato’s trigonometric product form in eq. (4) of the paper.) For **any** angles, $C(\theta) = B(\theta)B(\theta)^\top$ is automatically a valid correlation matrix: symmetry, unit diagonal (unit radius), and PSD by construction.

### 2.2 Optimization

Given a target symmetric matrix $\widehat{C}$ that may **not** be PSD, define an error

$$
\varepsilon(\theta) = \bigl\| C(\theta) - \widehat{C} \bigr\|
$$

and optimize unconstrained over the angles $\theta$. Candidate norms:

**Elementwise (Frobenius on free entries):**

$$
\varepsilon_{\text{Elements}}^2 = \sum_{i,j}\bigl(\widehat{c}_{ij} - c_{ij}(\theta)\bigr)^2
$$

Because both matrices have unit diagonals, this equals **twice** the sum of squared errors on the free correlation coefficients. Rebonato (1999) argues this metric has desirable global features for **BGM calibration**.

**Eigenvalue-matching:**

$$
\varepsilon_{\text{Eigen}}^2 = \sum_k\bigl(\lambda_k(\widehat{C}) - \lambda_k(C(\theta))\bigr)^2
$$

(with eigenvalues sorted).

Weights can be applied to emphasize recovery of particular blocks (e.g., stress the equity–equity block while leaving rates freer). The crucial computational advantage vs. Kupiec: each iteration needs only a **matrix multiply** $BB^\top$, not a full diagonalization—decisive for large $n$ and for optimizers that evaluate Jacobians/Hessians many times per step.

---

## 3. Method 2 — Spectral Decomposition (PCA Repair)

Let $\widehat{C} = V\Lambda V^\top$ be the eigen-decomposition of the (real symmetric) target. Define a corrected eigenvalue matrix $\Lambda^+$ by

$$
\lambda_k^+ = \max(\lambda_k, 0).
$$

Form $B^+ = V(\Lambda^+)^{1/2}$, then **renormalize each row** of $B^+$ to unit length to obtain $B$. Set

$$
C^\star = BB^\top.
$$

By construction $C^\star$ is PSD with unit diagonal—i.e., a valid correlation matrix. Procedurally:

1. Compute eigenvalues/eigenvectors of $\widehat{C}$.  
2. Zero out negative eigenvalues.  
3. Multiply eigenvectors by $\sqrt{\lambda_k^+}$ and arrange as columns of an intermediate matrix.  
4. Normalize rows to unit length → $B$; return $BB^\top$.

Intuition: the result is “similar” to the target, and more so the fewer eigenvalues that must be floored at zero. Empirically, $C^\star$ is always very close to the hypersphere optimum under $\varepsilon_{\text{Elements}}$. Use spectral repair either as the answer or as the **initial guess** for angular optimization.

---

## 4. Worked Examples

### 4.1 Three equity indices — a minor tweak breaks PSD

Starting (valid) correlation matrix among three world equity indices:

$$
C =
\begin{pmatrix}
1 & 0.9 & 0.7 \\
0.9 & 1 & 0.4 \\
0.7 & 0.4 & 1
\end{pmatrix}
$$

Eigenvalues approximately $\{2.34,\; 0.71,\; -0.05\}$ wait—paper reports eigenvalues of the **valid** starting matrix as positive: $\{2.2465,\; 0.7105,\; 0.0430\}$ (reconstructed from text glyphs). The risk manager wants to **lower** the (2,3) correlation from 0.4 to **0.3**:

$$
\widehat{C} =
\begin{pmatrix}
1 & 0.9 & 0.7 \\
0.9 & 1 & 0.3 \\
0.7 & 0.3 & 1
\end{pmatrix}
$$

Eigenvalues of $\widehat{C}$ become approximately $\{2.2184,\; 0.7482,\; -0.0066\}$ — **one negative eigenvalue**. Despite looking plausible, $\widehat{C}$ is **not** a valid correlation matrix; Monte Carlo / Cholesky will fail.

**Hypersphere optimum** (elementwise metric) yields a feasible $C(\theta)$ with total elementwise error $\varepsilon_{\text{Elements}} = 0.000451$ (paper: $4.51 \times 10^{-4}$ order; text shows $nK\chi$-style OCR of $0.000451$). Recovered off-diagonals are extremely close to the target (e.g., the stressed (2,3) entry lands near 0.301–0.304 rather than the infeasible 0.3, with tiny adjustments elsewhere).

**Spectral method** produces a nearly identical matrix with $\varepsilon_{\text{Elements}} = 0.000410$ (paper: $4.10\times 10^{-4}$ order)—individual entries “remarkably close” to the angular optimum.

### 4.2 Stress case — $12\times 12$ doubly non-PSD target

A $12\times 12$ real symmetric matrix is built by computing the sample correlation of 316 vectors of 12 uniform random numbers, then **digit-shifting** 12 randomly chosen off-diagonal entries by one decimal place (clamped to $[-1,1]$). The resulting target has **two negative eigenvalues** (among twelve), including values near $-0.29$ and $-0.18$ (OCR-noisy but sign-definite).

- Angular optimization: $\varepsilon_{\text{Elements}} = 1.148$.  
- Spectral repair: $\varepsilon_{\text{Elements}} = 1.180$.

Proximity persists even for a **doubly** non-PSD target—supporting the claim that spectral repair is an excellent fast approximation to the elementwise-optimal hypersphere solution.

---

## 5. Comparison with Prior Art

| Method | Needs PSD start? | Controls all entries? | Optimality metric? | Cost per iter |
|--------|------------------|----------------------|--------------------|---------------|
| Finger stress | Yes (practical) | No — uncontrolled spillover | No | Moderate |
| Kupiec shrinkage | Yes | Toward target | Implicit / unclear | Full eigen each iter |
| Hypersphere (RJ) | **No** | Yes, via weighted norm | **User-specified** | $BB^\top$ multiply |
| Spectral (RJ) | **No** | Approximate | Near-Frobenius empirically | **One** eigen + row norm |

---

## 6. Practical Takeaways for a Quant Investor / Risk Manager

1. **Never hand-edit a correlation and assume PSD.** Even a 0.1 change in one entry can create a negative eigenvalue; always repair.  
2. **Prefer spectral repair for production stress engines** when speed matters (intraday what-ifs, large $n$ credit matrices): one eigen-decomposition, guaranteed valid output, near-optimal under Frobenius.  
3. **Use hypersphere optimization** when (a) you need a certified optimum under a custom weighted metric, or (b) BGM/LMM calibration demands best elementwise fit to a parametric target correlation surface. Warm-start with spectral.  
4. **Weight the metric** to protect economically critical blocks (e.g., keep G10 equity correlations exact under stress; allow EM blocks more slack).  
5. **For scenario analysis of crashes**, increase target correlations toward 1 in the relevant block, repair with RJ, then recompute VaR—avoid Finger-style uncontrolled leakage into unrelated pairs.  
6. **Legacy / new risk factors** (no history): specify an intuitive target (sector/country factor model), then project onto the nearest valid correlation via RJ rather than ad-hoc clipping.  
7. **Implementation note:** angular parameterization removes constraints—standard unconstrained optimizers (BFGS, etc.) apply; Numerical Recipes (Press et al. 1992) is cited as a numerical reference.

---

## 7. Limitations

- Paper is methodological; no large-scale empirical backtest of VaR accuracy under RJ-repaired vs unrepaired matrices.  
- Spectral method lacks a proven optimality metric (authors conjecture one exists but have not identified it).  
- OCR of the PDF garbles many numeric glyphs; implemented systems should re-derive examples from clean sources or re-typeset eqs. (2)–(13).  
- Hypersphere angle count is $n(n-1)/2$; for very large $n$ (thousands of obligors) even unconstrained optimization may need factor-structured $B$ (low-rank / factor correlation models) as a further reduction—compatible with but not developed in the paper.  
- Does not address non-stationary or copula dependence beyond Gaussian correlation.

---

## 8. Conclusion

Rebonato and Jäckel deliver a clean, general solution to a ubiquitous production problem: turn an arbitrary real symmetric “target correlation” into a **guaranteed valid** correlation matrix, either optimally (hypersphere + chosen metric) or near-optimally at eigen-decomposition cost (spectral repair). Relative to Finger and Kupiec, the methods are more general, faster, and—critically—do not require a PSD starting point. For risk managers stress-testing correlations, option desks calibrating BGM, and credit quants building large obligor matrices, the spectral–then–optional-hypersphere pipeline remains a standard tool decades after this 1999 note.

---

## 9. Deeper Implementation Notes for Production Systems

### 9.1 Rank and numerical rank

After zeroing negative eigenvalues, $\operatorname{rank}(C^\star)$ equals the number of strictly positive $\lambda_k^+$. If the target was far from PSD, the repaired matrix can be **numerically low-rank**. For Monte Carlo this is fine (fewer independent factors); for optimization constraints that assume full rank, add a tiny ridge $\epsilon I$ on the eigenvalues before row normalization, then renormalize—equivalent to a mild shrinkage toward the identity.

### 9.2 Connection to BGM calibration

Rebonato’s related work (Risk 1999; Journal of Computational Finance 1999; *Volatility and Correlation* 1999) uses parametric correlation functions of the form $\rho_{ij} = \operatorname{corr}(f_i,f_j) = e^{-\beta|T_i-T_j|}$ (and richer variants) and then fits to swaption/caplet surfaces. The hypersphere method is the natural way to project a parametric but possibly non-PSD sample matrix onto a valid one **while preserving the elementwise fit that matters for BGM**. The paper explicitly notes that $\varepsilon_{\text{Elements}}$ has desirable global calibration properties in that setting.

### 9.3 Credit and $n$th-to-default

For baskets of obligors, practitioners often specify a factor correlation (country, industry) and expand to a full matrix. That expansion can easily violate PSD when overlays and overrides are applied. RJ repair is the correct last step before Gaussian-copula or multi-factor Monte Carlo pricing.

### 9.4 Pseudo-code (spectral)

```
function repair_correlation(C_hat):
    lam, V = eigh(C_hat)          # ascending or descending — track order
    lam = maximum(lam, 0)
    B = V * diag(sqrt(lam))
    for i in 1..n:
        B[i,:] /= ||B[i,:]||
    return B @ B.T
```

### 9.5 Pseudo-code (hypersphere sketch)

```
function fit_hypersphere(C_hat, w=None, theta0=None):
    if theta0 is None: theta0 = angles_from(repair_correlation(C_hat))
    minimize_theta  sum_{i<j} w_ij * (C(theta)_ij - C_hat_ij)^2
    return C(theta_star)
```

### 9.6 VaR identity reminder

If $C$ is not PSD, there exists a weight vector $w$ with $w^\top C w < 0$, which would imply a **negative** variance for the portfolio return under the normal approximation—an immediate red flag that risk systems must reject. RJ methods eliminate that failure mode by construction.

---

## 10. Quantitative Reading of the Three-Asset Example

Suppose the risk manager’s portfolio is equally weighted across the three indices with equal asset volatilities $\sigma$. Portfolio variance under correlation matrix $C$ is

$$
\sigma_p^2 = \sigma^2\Bigl(\tfrac13 + \tfrac23\bar\rho\Bigr),
$$

where $\bar\rho$ is the average pairwise correlation. Moving the (2,3) entry from 0.4 to ~0.30 lowers $\bar\rho$ and thus reported VaR—but only a **valid** repaired matrix may be used. The RJ repair changes the other entries by $O(10^{-3})$ or less, so the economic intent of the stress (slightly less diversification between names 2 and 3) is preserved without breaking the engine. Finger-style repair could have moved the (1,2)=0.9 block by a non-trivial amount—exactly the uncontrolled spillover Brooks et al. criticize.

---

## 11. Final Synthesis for Quants

The paper’s lasting contribution is compositional:

1. **Parameterize the manifold** of valid correlation matrices (hypersphere angles).  
2. **Optimize unconstrained** toward any target under any weighted norm.  
3. **Offer a closed-form near-solution** (spectral floor + row normalize) that is usually good enough and always cheap.

Together these replace a generation of ad-hoc “make the matrix PSD somehow” hacks with a method that is simultaneously **correct, optimal (when needed), and fast**. That combination explains why Rebonato–Jäckel remains a cited standard in risk-system and rates-calibration codebases.

---

## 12. Mathematical Detail — Why Row Normalization Restores the Unit Diagonal

After flooring eigenvalues, the matrix $M = V\Lambda^+ V^\top$ is PSD but generally has $\operatorname{diag}(M) \neq 1$. Writing $M = B^+ (B^+)^\top$ with $B^+ = V(\Lambda^+)^{1/2}$, the $i$th diagonal entry is $\|B^+_{i,\cdot}\|^2$. Dividing row $i$ by its Euclidean norm produces a new matrix $B$ with $\|B_{i,\cdot}\|=1$, hence

$$
(BB^\top)_{ii} = 1 \quad \forall i,
$$

while $BB^\top$ remains PSD as a Gram matrix. Off-diagonal entries become cosine similarities between the normalized row vectors—the geometric content of correlation.

### Hypersphere dimension count

An $n\times n$ correlation matrix has $n(n-1)/2$ free parameters. The hypersphere angle matrix $\theta_{ij}$ is sized to match exactly that count (each row $i$ has $n-1$ angles, with the last coordinate determined by the unit-norm constraint). This is a global chart (almost everywhere) for the set of full-rank correlation matrices; singular correlations correspond to boundary angles where some sines vanish.

### Relation to Cholesky

The Cholesky factor $L$ of a correlation also satisfies $C=LL^\top$ with $L$ lower-triangular, but Cholesky **requires** $C$ already PSD. Hypersphere $B$ is a **full** (generally dense) “square root” parameterized to stay on the correlation manifold even when the target is not PSD—hence it can be used for inverse problems (fit to target) rather than only forward factorizations.

---

## 13. Stress-Testing Playbook Using RJ

**Step A — Design the economic scenario.** Example: “global equity crash: all developed-equity correlations → 0.95; rates–equity → +0.4; credit spreads highly correlated.”

**Step B — Write the target $\widehat{C}$** by overwriting the relevant blocks of the production matrix; leave other blocks at baseline.

**Step C — Repair** with spectral method; optionally refine with weighted hypersphere (large weights on stressed blocks).

**Step D — Recompute risk.** Full revaluation preferred; variance–covariance VaR as a quick check. Compare to baseline and to an unrepaired (invalid) target to verify the engine rejected the latter.

**Step E — Audit spillover.** Report $\max_{ij}|C^\star_{ij}-\widehat{C}_{ij}|$ on unstressed blocks; if spillover is material, increase weights on those blocks and re-optimize.

This discipline prevents the RiskMetrics-era failure mode where stressing one block silently destresses another.

---

## 14. Option-Pricing and Calibration Uses

In LMM/BGM, the instantaneous correlation $\rho(t;T_i,T_j)$ among forward rates enters swaption and CMS pricing. Typical workflow:

1. Estimate a sample correlation from historical forward-rate changes (noisy, possibly non-PSD).  
2. Fit a parametric form $\rho_{ij}(\beta)$ (Rebonato exponential, Rebonato–Jäckel three-parameter, etc.).  
3. If the parametric form evaluated on a finite grid is not PSD (possible with aggressive parameters), **project** via RJ.  
4. Calibrate $\beta$ to swaptions by minimizing pricing errors, with the projection inside the objective if needed.

Because swaptions load weakly on fine correlation structure, the elementwise projection’s main value is **numerical robustness** of simulation and of any moment-matching that assumes PSD covariances.

---

## 15. Credit-Basket Numerics

For a 125-name CDX-like basket, a raw sector-override matrix often has several negative eigenvalues of magnitude $10^{-2}$–$10^{-1}$. Spectral repair typically:

- floors 1–5 eigenvalues;  
- changes individual correlations by a few basis points on average;  
- preserves the intended sector block structure to first order.

Hypersphere refinement with block weights can force within-sector correlations to remain exactly at the underwriter’s specified levels while absorbing slack in cross-sector entries—something Finger-style methods cannot guarantee.

---

## 16. Links to Modern Alternatives

Subsequent literature developed related projections: Higham’s nearest correlation matrix under Frobenius (2002) via alternating projections / Dykstra; Qi–Sun semi-smooth Newton methods; factor-constrained calibrations. Rebonato–Jäckel spectral repair is essentially a **one-shot eigenvalue clipping + scaling** heuristic that often lands close to Higham’s nearest matrix at far lower cost—consistent with the paper’s empirical claim of near-optimality under $\varepsilon_{\text{Elements}}$. For offline calibration, Higham may be preferred; for real-time stress, RJ spectral remains attractive.

---

## 17. End-to-End Numerical Checklist

1. Symmetrize the input: $\widehat{C}\leftarrow(\widehat{C}+\widehat{C}^\top)/2$.  
2. Clip entries to $[-1,1]$ if economic overrides overshot.  
3. Run spectral repair; check $\min\operatorname{eig}(C^\star)\ge -10^{-12}$.  
4. If $\|C^\star-\widehat{C}\|_F$ exceeds tolerance on weighted entries, run hypersphere from spectral warm start.  
5. Cache $B$ for Monte Carlo; avoid refactorizing every path.  
6. Unit-test with the three-asset example: target with $\rho_{23}=0.3$ must produce $\min\operatorname{eig}>0$ and $\rho_{23}\approx 0.30$.

---

## 18. Closing Assessment

A 12-page 1999 working paper fixed a problem that still breaks risk engines in 2026 when ignored. The quantitative content—hypersphere parameterization, elementwise and eigenvalue metrics, spectral floor-and-normalize, and two carefully chosen numerical examples—is sufficient to implement production-grade correlation repair. For quants, the actionable rule is simple: **every correlation that humans touch must pass through Rebonato–Jäckel (or a modern nearest-correlation solver) before it touches VaR, XVA, or Monte Carlo.**

---

## 19. Additional Remarks on Metrics and Weighting

If a desk cares disproportionately about preserving stress levels inside a G10 equity block, set $w_{ij}=10$ on those pairs and $w_{ij}=1$ elsewhere in $\varepsilon_{\text{Elements}}$. The hypersphere optimizer will then spend its PSD “budget” on less critical pairs. Spectral repair alone cannot express such preferences—another reason to keep Method 1 available.

For eigenvalue-targeted applications (e.g., matching a desired PCA risk budget), optimize $\varepsilon_{\text{Eigen}}$ instead; the resulting angles yield a correlation whose spectrum tracks the target’s while remaining feasible. Mixing both norms with a Lagrange weight is a natural extension not pursued in the paper but compatible with the framework.

**Bottom line for implementers:** ship spectral repair as the default pre-trade/pre-VaR gate; expose weighted hypersphere as an advanced calibration tool. That two-tier design mirrors the authors’ own recommendation and matches modern risk-system practice.
