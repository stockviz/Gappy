# Identifying Small Mean Reverting Portfolios — d'Aspremont (2008/2011) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Identifying Small Mean Reverting Portfolios |
| **Author** | Alexandre d'Aspremont — ORFE, Princeton University |
| **Date** | Working paper February 26, 2008; published *Quantitative Finance* **11**(3), 351–364, March 2011 |
| **arXiv** | 0708.3048 |
| **JEL** | C61, C82 |
| **Keywords** | Mean reversion; sparse estimation; convergence trading; momentum trading; covariance selection |
| **Original PDF** | `MeanReversion_Daspremont_2010.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMseDVNZ0N5M1p3b2c` |
| **Extraction** | `download_file_content` (user-Google-drive) → pdftotext; ~8,059 words of clean text. No OCR issues. |

---

## Problem / Motivation

Mean reversion is a classic predictability indicator (Fama–French 1988; Poterba–Summers 1988), easy to detect in univariate series but hard to isolate as **sparse** portfolios in multivariate markets. Classical tools—cointegration (Engle–Granger 1987; Johansen 1988) and Box–Tiao (1977) canonical correlation—produce **dense** portfolios that (i) incur large transaction costs for arb desks, (ii) are hard to interpret economically, and (iii) often oscillate inside bid–ask spreads, so the “stat arb” is economically meaningless.

The paper’s claim: **cardinality-constrained** optimally mean-reverting portfolios solve these problems simultaneously—fewer names ⇒ lower costs and clearer structure; sparsity also tends to widen price range so inefficiencies are more tradeable. All results apply symmetrically to **momentum** (maximize predictability instead of minimizing it).

Asset $S_t^i$, $i=1,\ldots,n$, $t=1,\ldots,m$. Portfolio
$$
P_t=\sum_{i=1}^n x_i S_t^i
$$
is assumed to follow an Ornstein–Uhlenbeck process
$$
dP_t=\lambda(\bar P-P_t)\,dt+\sigma\,dZ_t,\qquad \|x\|=1,\ \mathrm{Card}(x)\le k.
$$
Objective: maximize mean-reversion speed $\lambda$ (or equivalently minimize Box–Tiao predictability) under the cardinality constraint. Contribution: (1) two algorithms—greedy forward selection and SDP relaxation—for sparse generalized eigenproblems; (2) $\ell_1$-penalized covariance selection and LASSO VAR estimation as preprocessing that both stabilizes estimates and clusters assets so sparse search can be restricted to connected components.

---

## Setup and Data

**Model.** Discrete VAR(1):
$$
S_t=S_{t-1}A+Z_t,\qquad Z_t\sim\mathcal N(0,\Sigma)\ \text{iid, independent of }S_{t-1}.
$$
Assets demeaned without loss of generality. Covariance of $S_t$ denoted $\Gamma$.

**Proxy for mean reversion.** Box–Tiao predictability for a portfolio $x$:
$$
\nu(x)=\frac{x^\top A^\top\Gamma A x}{x^\top\Gamma x}.
$$
Small $\nu$ ⇒ noise dominates lagged signal ⇒ strong mean reversion; large $\nu$ ⇒ momentum/predictability. Extremal $\nu$ is a generalized eigenvalue:
$$
\det(\lambda\Gamma-A^\top\Gamma A)=0.
$$
With $\Gamma\succ0$, the least predictable portfolio is $x=\Gamma^{-1/2}z$ where $z$ is the smallest-eigenvector of $\Gamma^{-1/2}A^\top\Gamma A\Gamma^{-1/2}$.

**OLS estimate of $A$:**
$$
\hat A=(S_{t-1}^\top S_{t-1})^{-1}S_{t-1}^\top S_t.
$$
Box–Tiao ranks portfolios by eigenvectors of
$$
(S_t^\top S_t)^{-1/2}(\hat S_t^\top\hat S_t)(S_t^\top S_t)^{-1/2},\quad\hat S_t=S_{t-1}\hat A.
$$

**Johansen link (Bewley et al. 1994).** Writing $\Delta S_t=QS_{t-1}+Z_t$ with $Q=A-I$, cointegrating directions solve
$$
\lambda(S_{t-1}^\top S_{t-1})-(S_{t-1}^\top\Delta S_t(\Delta S_t^\top\Delta S_t)^{-1}\Delta S_t^\top S_{t-1})=0.
$$

**Empirical universes (Section 5).**
1. **U.S. swap rates:** maturities 1Y, 2Y, 3Y, 4Y, 5Y, 7Y, 10Y, 30Y; sample **1998–2005**; rolling windows of **200 days**, rolled every **50 days**; illustration figures use **100-day** windows.
2. **FX vs USD:** 44 currencies (Argentina, Australia, Brazil, Canada, Chile, China, Colombia, Czech Republic, Egypt, Eurozone, Finland, Hong Kong, Hungary, India, Indonesia, Israel, Japan, Jordan, Kuwait, Latvia, Lithuania, Malaysia, Mexico, Morocco, New Zealand, Norway, Pakistan, Papua NG, Peru, Philippines, Poland, Romania, Russia, Saudi Arabia, Singapore, South Africa, South Korea, Sri Lanka, Switzerland, Taiwan, Thailand, Turkey, UK, Venezuela), **April 2002–April 2007**. Pip size ~4 digits; key-rate bid–ask ~0.0005.

---

## Model / Methods

### Sparse generalized eigenproblem

Both Box–Tiao and Johansen reduce to
$$
\det(\lambda B-A)=0.
$$
Extremal eigenvalue in variational form:
$$
\lambda_{\max}(A,B)=\max_{x\in\mathbb R^n}\frac{x^\top Ax}{x^\top Bx}.
$$
Sparse version (cardinality $k$):
$$
\begin{aligned}
\max&\quad x^\top Ax/x^\top Bx\\
\text{s.t.}&\quad \mathrm{Card}(x)\le k,\ \|x\|=1.
\end{aligned}
\tag{10}
$$
Natarajan (1995): sparse GEP ≡ subset selection → **NP-hard**. Two approximations:

### Algorithm 1 — Greedy search (§3.1)

- $k=1$: $I_1=\arg\max_i A_{ii}/B_{ii}$.
- Given support $I_k$, solve the dense GEP of size $k$ on that support.
- Add index $i_{k+1}\in I_k^c$ that maximizes the $(k+1)$-dimensional Rayleigh quotient (scan all $n-k$ candidates).
- Cost per $k$: $O(k^2(n-k))$; all cardinalities: $O(n^4)$. Can run forward–backward to improve nesting (optimal supports need not nest).

### Algorithm 2 — Semidefinite relaxation (§3.2)

Lift $X=xx^\top$:
$$
\max\frac{\mathrm{Tr}(AX)}{\mathrm{Tr}(BX)}\quad\text{s.t.}\ \mathrm{Card}(X)\le k^2,\ \mathrm{Tr}(X)=1,\ X\succeq0,\ \mathrm{Rank}(X)=1.
$$
Relax $\mathrm{Card}(X)\le k^2$ via $\mathbf 1^\top|X|\mathbf 1\le k$ (since $\|X\|_F=1$ when $X=xx^\top$, $\mathrm{Tr}X=1$), drop rank:
$$
\max\frac{\mathrm{Tr}(AX)}{\mathrm{Tr}(BX)}\quad\text{s.t.}\ \mathbf 1^\top|X|\mathbf 1\le k,\ \mathrm{Tr}X=1,\ X\succeq0.
\tag{11}
$$
Homogenize $Y=X/\mathrm{Tr}(BX)$, $z=1/\mathrm{Tr}(BX)$:
$$
\begin{aligned}
\max&\ \mathrm{Tr}(AY)\\
\text{s.t.}&\ \mathbf 1^\top|Y|\mathbf 1-kz\le0,\ \mathrm{Tr}(Y)-z=0,\ \mathrm{Tr}(BY)=1,\ Y\succeq0.
\end{aligned}
\tag{12}
$$
SDP solvable by SeDuMi/SDPT3. Dual gives **suboptimality bound**. If $\mathrm{Rank}(Y)=1$, relaxation is tight; else take leading eigenvector of $Y$ and rescale. Costlier than greedy, often better when sequence of supports is non-nested.

### Covariance selection preprocessing (§4.1)

Penalized Gaussian MLE for precision matrix $X=\Gamma^{-1}$:
$$
\max_X\ \log\det X-\mathrm{Tr}(\Sigma X)-\rho\sum_{i,j}|X_{ij}|.
\tag{14}
$$
Zeros in $X$ = conditional independence (graphical model). On U.S. swaps with $\rho=0.1$, the graph clusters by maturity and recovers the curve as a chain (Figure 2).

### Structured VAR (§4.2)

**Endogenous noise** $Z_t\sim\mathcal N(0,\sigma I)$: $\Gamma=A^\top\Gamma A+\sigma I$ ⇒ $A^\top A=I-\sigma\Gamma^{-1}$. If graph of $\Gamma$ is chordal, Cholesky of permuted $\Gamma$ shares the zero pattern of the upper triangle (Wermuth 1980). Gilbert (1994): graph of $\Gamma^{-1}$ is intersection graph of $A$; **disconnected $\Gamma$ ⇒ disconnected $A$ along the same clusters**.

**Exogenous noise:** columnwise LASSO
$$
a_i=\arg\min_x\|S_t^i-S_{t-1}x\|_2^2+\gamma\|x\|_1.
\tag{15}
$$

### Key structural lemma (§4.3)

If penalized $\Gamma$ and $A^\top\Gamma A$ share identical block-diagonal clusters, Gilbert (1994, Thm 6.1) implies **optimally (un)predictable portfolios live inside a single cluster**. Practical pipeline for large $n$: set $\rho$ large enough to split the graph; run sparse GEP only inside clusters.

### Trading appendix — OU estimation and optimal control

Integrate OU over $\Delta t$:
$$
P_t=\bar P+e^{-\lambda\Delta t}(P_{t-\Delta t}-\bar P)+\sigma\int_{t-\Delta t}^t e^{\lambda(s-t)}\,dZ_s.
$$
Estimators:
$$
\hat\mu=\frac1N\sum P_t,\quad
\hat\lambda=-\frac1{\Delta t}\log\!\left(\frac{\sum(P_t-\hat\mu)(P_{t-1}-\hat\mu)}{\sum(P_t-\hat\mu)^2}\right),
$$
and analogous $\hat\sigma$. Half-life $\tau=\log2/\lambda$.

Frictionless log-utility allocation (Jurek–Yang 2006):
$$
N_t=\frac{\lambda(\bar P-P_t)-rP_t}{\sigma^2}W_t.
$$
With proportional fund flows $dF=f\,d\Pi+\sigma_f dZ^{(2)}$:
$$
N_t=\frac{\lambda(\bar P-P_t)-rP_t}{\sigma^2(1+f)}W_t.
$$
Steady-state leverage bound at confidence $N(\alpha)$:
$$
M=\frac{\alpha(\lambda+r)}{(1+f)\sigma\sqrt{2\lambda}}\quad(\bar P=0).
$$

---

## Empirical / Theoretical Results with Numbers

### Dense Box–Tiao on swaps (Table 1, Figure 1)

100 days of U.S. swap data; 8 maturities. Dense canonical portfolios ranked by predictability:

| # swaps | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|--------|---|---|---|---|---|---|---|---|
| Mean reversion $\lambda$ | 0.58 | 8.61 | 16.48 | 38.59 | 84.55 | 174.82 | 184.83 | **238.11** |
| $p$-value | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | **0.51** |
| Volatility | 0.21 | 0.28 | 0.34 | 0.14 | 0.10 | 0.09 | 0.07 | 0.07 |

$\lambda=238$ on the densest portfolio ⇒ half-life $\approx\log2/238\approx 0.3$ day—too fast for daily data, hence insignificant $p$. Dense highly mean-reverting books are statistically but not economically meaningful.

### Sparse greedy on same window (Figure 6)

For target cardinalities $k=1,\ldots,8$, reported $\lambda$ under each subplot include approximately: $k=1:\ \lambda\approx0$; $k=2:\ 35$; $k=3:\ 128$; $k=4:\ 178$; $k=5:\ 213$; $k=6:\ 247$; $k=7:\ 252$; $k=8:\ 252$. Most of the dense $\lambda\approx252$ is recovered by $k\approx5$–6 names.

### Greedy vs SDP (Figure 5)

- Left: $\lambda$ vs cardinality—SDP occasionally better, **greedy more reliable** on this dataset; both agree at $k=1$ and $k=n$.
- Right: CPU vs $n$; producing full cardinality path $k=1..100$ for $n=100$ took **~1 min 40 s**.

### In- vs out-of-sample swap tradeoff (Figure 7, Table 2)

Rolling 200-day estimation, 50-day steps, 1998–2005. Out-of-sample $\lambda$ measured on the **next** 200 days. Sparse portfolios retain substantial OOS mean reversion; dense books do not dominate. OOS **price range** (max−min in bp) is **broader for sparse** portfolios—key for clearing bid–ask.

Table 2 (optimal swap weights by maturity × cardinality) shows concentration on the **belly** (3Y–5Y):

| Maturity | $k=1$ | $k=2$ | $k=3$ | $k=4$ | $k=5$ | $k=6$ | $k=7$ | $k=8$ |
|----------|---------|---------|---------|---------|---------|---------|---------|---------|
| 1Y | 0 | 0 | 0 | −0.041 | −0.037 | 0.036 | −0.013 | 0.001 |
| 2Y | 0 | 0 | 0 | 0 | 0 | 0 | −0.102 | 0.117 |
| 3Y | 0 | 0 | −0.288 | 0.433 | 0.419 | −0.437 | 0.547 | −0.495 |
| 4Y | 0 | −0.714 | 0.806 | −0.803 | −0.802 | 0.809 | −0.767 | 0.702 |
| 5Y | **1.000** | 0.700 | −0.517 | 0.408 | 0.424 | −0.389 | 0.317 | −0.427 |
| 7Y | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0.219 |
| 10Y | 0 | 0 | 0 | 0 | 0 | −0.031 | 0.025 | −0.130 |
| 30Y | 0 | 0 | 0 | 0 | −0.007 | 0.016 | −0.008 | 0.014 |

Single-name optimum is pure **5Y**; two-name is long 5Y / short 4Y butterfly-like; higher $k$ builds curvature/butterfly structures along the curve.

### FX + covariance selection (Figures 8–9)

Covariance selection on 44 FX rates isolates a **cluster of 14** rates. On that cluster:
- Sparse GEP with **penalized** $\Gamma$ ($\rho=0.01$) and LASSO-$A$ (zero out **20%** of coefficients) **beats unpenalized** OOS $\lambda$.
- Sparse portfolios again show **higher OOS mean reversion** than dense ones ⇒ sparsity helps prediction, not just cost.
- Sparse portfolios again have **broader price range**.

### Convergence trading (Figure 10)

Estimate on 100 days; trade next **50 days**. Frictionless OOS Sharpe looks attractive vs cardinality, but a **1 bp bid–ask** is enough to **wipe out** the apparent inefficiency in liquid U.S. swaps—consistent with the paper’s warning that dense ultra-fast mean-reverters trade inside spreads.

---

## Limitations

1. Sparse GEP is NP-hard; greedy has **no dual bound** (unlike SDP).
2. Consistency of variable selection under sparsity is left open (Amini–Wainwright 2008 on sparse PCA cited as suggestive).
3. OU / Box–Tiao predictability is a **proxy**, not a structural half-life estimator under microstructure noise.
4. Swap results: 1 bp friction kills Sharpe—economic value in ultra-liquid rates is limited; FX and less liquid curves are the more natural habitat.
5. Sample windows (100–200 days) are short relative to structural breaks in rates/FX regimes (1998–2005 includes LTCM aftermath, 2002–07 includes carry boom).
6. Momentum dual is mathematically identical but not separately backtested with the same intensity.

---

## Practical Takeaways for a Quant Investor

1. **Don’t trade the densest cointegrating vector.** Prefer $k\ll n$ sparse books; on swaps most of $\lambda$ arrives by $k\approx5$.
2. **Pipeline:** covariance selection ($\rho$ large enough to disconnect) → restrict sparse GEP to clusters → OU half-life and range check → size with Jurek–Yang / leverage bound $M$.
3. **Penalize estimation.** Graphical lasso + LASSO-VAR both stabilize and improve **OOS** mean reversion on FX.
4. **Sparsity widens range.** Use min–max range (bp) as a screen alongside $\lambda$; reject books that live inside typical bid–ask.
5. **Friction reality check.** In swaps, 1 bp spread nullifies convergence Sharpes; budget costs explicitly.
6. **Symmetric momentum search.** Same code with max instead of min predictability—useful for curve momentum sleeves.
7. **Interpretability.** Table 2-style weights recover economically meaningful curve butterflies—risk-manage as rates-curve factor exposures, not generic equity-style stat arb.

---

*Summary prepared for Giuseppe Paleologo’s Scholar library, 2026-09-22. Source: Drive PDF `MeanReversion_Daspremont_2010.pdf` (file_id `0B-6kBz0I0dMseDVNZ0N5M1p3b2c`).*


---

## Extended Technical Notes (Box–Tiao, Johansen, Complexity)

### Predictability as variance ratio

For the univariate AR(1) $S_t=S_{t-1}A+Z_t$,
$$
\mathbb E[S_t^2]=\mathbb E[(S_{t-1}A)^2]+\mathbb E[Z_t^2]\implies \sigma_t^2=\sigma_{t-1}^2+\Sigma,
$$
and Box–Tiao define
$$
\nu=\frac{\sigma_{t-1}^2}{\sigma_t^2}.
$$
When $\nu\to0$, innovations dominate and the series is nearly white noise (fast mean reversion in the OU limit). When $\nu\to1$, the process is nearly deterministic given the lag (strong momentum / near unit root). The multivariate portfolio extension replaces scalar variances by quadratic forms $x^\top\Gamma x$ and $x^\top A^\top\Gamma A x$.

### Relation to OU $\lambda$

Discretizing $dP=\lambda(\bar P-P)dt+\sigma dZ$ at step $\Delta t$ yields AR(1) coefficient $e^{-\lambda\Delta t}$. Box–Tiao $\nu$ is monotone in that coefficient for Gaussian OU, so ranking by $\nu$ ranks by $\lambda$. Half-life $\tau=\log 2/\lambda$: for Table 1’s $\lambda=238$ (daily), $\tau\approx0.003$ years $\approx1$ day, matching the paper’s comment that daily sampling cannot identify such fast reversion ($p=0.51$).

### Johansen as first-difference CCA

Johansen’s reduced-rank regression on $\Delta S_t=Q S_{t-1}+Z_t$ is rewritten by Bewley et al. as a CCA between levels and differences. Empirically both bases are similar on rates curves; the paper’s sparse algorithms apply equally because both are GEPs of the form $\det(\lambda B-A)=0$.

### Complexity and nesting

Greedy forces $I_k\subset I_{k+1}$. Optimal sparse eigenvectors need not nest (classic subset-selection pathology). Forward–backward sweeps partially mitigate. SDP does not impose nesting and supplies a dual upper bound on $\lambda_{\max}$ under cardinality—useful for certifying near-optimality when Rank$(Y)>1$.

### Sparse PCA ancestry

The SDP (11)–(12) extends d’Aspremont–El Ghaoui–Jordan–Lanckriet (2007) sparse PCA: replace $\mathrm{Tr}(AX)$ maximization under $\|X\|_1\le k$ with a *ratio* of traces. Homogenization to an SDP is the same trick used in sparse Rayleigh quotients.

---

## Extended Empirical Commentary

### Why swaps concentrate on 3Y–5Y

U.S. swap PCA is well known: level / slope / curvature. Dense Box–Tiao’s most mean-reverting portfolios are high-frequency curvature residuals with tiny volatility (Table 1: vol 0.07 at $k=8$). Sparse solutions in Table 2 recover **interpretable butterflies** (e.g., $k=2$: −0.714×4Y + 0.700×5Y) that still achieve $\lambda$ in the 30–180 range—fast enough for convergence trading, slow enough to clear 1 bp spreads more often than the $\lambda=238$ dense book.

### Rolling OOS design

200-day estimate / next 200-day evaluate, stepped every 50 days over 1998–2005, averages across overlapping windows. This is intentionally short-memory: rates mean-reversion structure changes with Fed cycles. The paper’s qualitative finding—sparse ≥ dense OOS $\lambda$, sparse > dense range—is the actionable result, not a single point estimate of $\lambda(k)$.

### FX cluster of 14

Covariance selection is doing unsupervised “which crosses co-move idiosyncratically.” Emerging and pegged rates often form separate components; the 14-rate island is where sparse mean-reversion search is most fruitful. Penalizing $A$ (zero 20% of VAR links) further improves OOS $\lambda$, suggesting that dense OLS VAR overfits cross-rate lead–lags.

### Convergence trading and the 1 bp result

Figure 10’s frictionless Sharpe vs $k$ would tempt a risk-budgeting allocator. Adding 1 bp round-trip (conservative for on-the-run swaps, optimistic for off-the-run) flattens Sharpes near zero. Interpretation for a multi-strat book: **capacity and cost dominate $\lambda$** in G10 rates; deploy the same machinery on EM FX, basis, or less liquid IRS tenors where spreads are 2–10 bp but $\lambda$ remains moderate.

### Numerical benchmark

Full greedy path for $n=100$ in ~100 seconds (2008-era laptop/SDP stack). For modern desks, $n$ in the low hundreds (single-curve tenors + a few related curves) is trivial; for equity universes $n\sim10^3$, **must** use covariance-selection clustering first.

---

## Literature Placement (Quant Desk View)

| Strand | Papers cited | Role here |
|--------|--------------|-----------|
| Predictability / mean reversion | Fama–French 1988; Poterba–Summers 1988 | Motivation |
| Cointegration | Engle–Granger 1987; Johansen 1988/91; Alexander 1999 | Dense baselines |
| Canonical analysis | Box–Tiao 1977; Bewley et al. 1994 | Core GEP |
| Optimal arb trading | Kim–Omberg 1996; Campbell–Viceira 1999; Wachter 2002; Liu–Longstaff 2004; Jurek–Yang 2006; Gatev–Goetzmann–Rouwenhorst 2006 | Trading layer |
| Leverage / liquidity | Grossman–Vila 1992; Xiong 2001; LTCM 1998 | Risk constraints |
| Sparsity | Tibshirani LASSO 1996; Chen–Donoho–Saunders 2001; Candes–Tao; Banerjee–El Ghaoui–d’Aspremont covariance selection | Estimation + algorithms |

Pairs trading (Gatev et al.) is the $k=2$ special case with distance or cointegration pre-screening; this paper systematizes **$k$-sparse** selection via GEP rather than combinatorial pair enumeration.

---

## Replication Checklist for a Desk

1. Build demeaned level series $S_t$ (swap rates in percent, or log FX).
2. Estimate $\hat A$ OLS and $\hat\Gamma$; optionally replace with graphical lasso $\rho\in\{0.01,0.1\}$ and LASSO-$A$ with $\gamma$ targeting 10–30% zeros.
3. Form $A\leftarrow \hat A^\top\hat\Gamma\hat A$, $B\leftarrow\hat\Gamma$ (for min predictability / max mean reversion).
4. Run greedy for $k=1..K_{\max}$; optionally SDP at selected $k$ for dual gap.
5. For each $k$, estimate OU $(\hat\lambda,\hat\sigma,\hat{\bar P})$; compute half-life and in-sample range.
6. Paper-trade with Jurek–Yang sizing; stress 1–5 bp costs; record OOS Sharpe and hit rate of mean-reversion trades.
7. Risk: map sparse weights to DV01 / PCA factor exposures; enforce leverage bound $M$.

---

## Equations Quick Reference

**OU portfolio:** $dP_t=\lambda(\bar P-P_t)dt+\sigma dZ_t$, $P_t=x^\top S_t$.

**Predictability:** $\nu(x)=x^\top A^\top\Gamma A x\,/\,x^\top\Gamma x$.

**GEP:** $\det(\lambda\Gamma-A^\top\Gamma A)=0$.

**Sparse program:** $\max x^\top Ax/x^\top Bx$ s.t. $\mathrm{Card}(x)\le k$, $\|x\|=1$.

**Covariance selection:** $\max\log\det X-\mathrm{Tr}(\Sigma X)-\rho\|X\|_1$.

**LASSO VAR column:** $\min\|S_t^i-S_{t-1}x\|_2^2+\gamma\|x\|_1$.

**Half-life:** $\tau=\log2/\lambda$.

**Log-utility holding:** $N_t=[\lambda(\bar P-P_t)-rP_t]/\sigma^2\cdot W_t$.

---

## Additional Interpretation for Multi-Strat Allocators

Sparse mean-reversion extraction is best thought of as a **feature discovery** layer upstream of a convergence engine, not as a stand-alone alpha. In a rates RV book it replaces ad-hoc butterfly enumeration; in FX it replaces exhaustive pair grids; in equity stat-arb it can sit on residual PCA factors after market/sector neutralization—though the paper’s empirics are rates/FX only.

The dual momentum formulation (maximize $\nu$) is immediately useful for **curve momentum** and **FX carry-momentum hybrids**: same estimated $A,\Gamma$, flip the objective. Because greedy/SDP already produce the full cardinality path, one can allocate budget across a few sparse mean-reversion sleeves and a few sparse momentum sleeves with controlled overlap via the covariance-selection graph.

Finally, the paper’s insistence on **range** as a co-equal metric with $\lambda$ deserves process status: any candidate book with annualized $\lambda$ implying half-life < 2 days *and* range < 2× typical bid–ask should be auto-rejected regardless of in-sample t-stats.

---

## Connection to Modern Sparse Stat-Arb Practice (2010s–2020s)

Subsequent industry practice largely confirmed the paper’s agenda even when not citing it directly:

- **Residual spreads with $k$-sparse loadings** on sector-neutral equity books mimic greedy cardinality paths.
- **Graphical lasso** on residual covariance is now standard before pair/basket search (exactly §4.3’s preprocess).
- **SDP / convex relaxations** for sparse PCA and sparse GEP appear in quant research stacks; dual gaps used as “how much $\lambda$ am I leaving on the table?”
- **Cost-aware backtests** (Figure 10’s moral) are mandatory: many published dense cointegration Sharpes collapse under realistic fees.

What remains less common—and where the paper still adds edge—is the **joint** use of sparse GEP *with* penalized VAR structure to enforce that optimal baskets live inside conditional-dependence clusters. Desks that only do distance pairs or cointegration screens without graphical clustering waste compute on cross-cluster combinations that theory says cannot be optimal under block-diagonal $\Gamma$.

---

## Detailed Walkthrough of Figure 1 vs Figure 6

Figure 1 (dense): eight portfolios, all names active, $\lambda$ from 0.58 (near random walk / level) to 238 (noise-like). Economically, the first few look like level/slope factors; the last look like microstructure.

Figure 6 (sparse greedy): at each $k$, only $k$ tenors enter. Visually, sparse paths still mean-revert but with larger amplitude. The $\lambda$ sequence $\{0,35,128,178,213,247,252,252\}$ shows **diminishing returns after $k=5$**—a classic elbow for choosing operating cardinality.

Comparing Table 1 dense $\lambda=84.55$ at “5 swaps” (but dense weights on all 8) vs sparse $k=5$ $\lambda=213$: sparsity *increases* measured mean reversion relative to a dense 5-factor-like combination because the dense method spreads weight into near-collinear tenors that dilute the residual’s reversion. This is the quantitative heart of the paper’s claim that sparsity is not merely a cost regularizer but can improve the objective.

---

## Risk-Management Overlay

Even with sparse $x$, the OU trading rule $N_t\propto(\bar P-P_t)$ is a classic **short-vol / convergence** profile: stable PnL until a structural break shifts $\bar P$ or kills $\lambda$. Combine with:

- Hard stop if $|P_t-\bar P|>c\cdot\sigma/\sqrt{2\lambda}$ (e.g., $c=3$).
- Recalibrate $\lambda,\bar P$ on rolling windows matching the paper (200 days).
- Leverage cap $M$ from (20) with $\alpha$ corresponding to 95–99% Gaussian, then fatten for jumps.
- Cluster-level gross and net DV01 limits so one rates island cannot sink the fund.

---

## Summary Verdict

d’Aspremont (2008/2011) turns Box–Tiao/Johansen into a **cardinality-constrained sparse GEP**, supplies greedy and SDP solvers, and shows that $\ell_1$ covariance/VAR penalties both stabilize and structurally restrict the search. Empirically, on U.S. swaps (1998–2005) and a 14-rate FX island (2002–2007), sparse portfolios match or beat dense ones on OOS mean reversion and dominate on tradable range; yet 1 bp costs erase swap convergence Sharpes. For a quant investor: use as a basket-construction engine with mandatory cost and range filters, not as a frictionless Sharpe factory.



## Quant Investor FAQ

**Q: Is this pairs trading?** A: Pairs are the $k=2$ case. The contribution is principled selection of $k$-asset baskets via sparse GEP rather than enumerating pairs by distance or Engle–Granger $p$-values.

**Q: Long-only?** A: No—weights in Table 2 are signed. Mean-reverting curve butterflies are naturally long/short. Long-only cardinality constraints would need a different (harder) formulation.

**Q: Intraday?** A: Empirics are daily. $\lambda=238$ already breaks daily identification; intraday would require microstructure-robust covariance and careful treatment of bid–ask bounce (which inflates apparent mean reversion).

**Q: Equities?** A: Theory applies; use residual returns after factor neutralization, then covariance selection on residuals, then sparse GEP. Expect capacity and short-locate to bind before mathematics does.

**Q: How to choose $\rho,\gamma,k$?** A: Cross-validate on OOS half-life and net Sharpe after costs; paper’s figures suggest elbows near $k=5$ on an 8-tenor curve and $\rho=0.01$–$0.1$ depending on whether you want soft shrinkage or hard clustering.

**Q: SDP or greedy?** A: Start with greedy for the full path; certify a few operating $k$ with SDP dual gaps. If gap is large, run forward–backward greedy or local swaps of support indices.

---

## Closing Quantitative Snapshot

| Object | Number |
|--------|--------|
| Swap maturities | 8 (1Y–30Y) |
| Swap sample | 1998–2005 |
| Roll window / step | 200 days / 50 days |
| Dense max $\lambda$ | 238.11 ($p=0.51$) |
| Sparse $k=5$ illustrative $\lambda$ | ~213 |
| FX universe | 44 USD crosses |
| FX sample | Apr 2002–Apr 2007 |
| FX cluster after cov-select | 14 rates |
| Cov-select $\rho$ (swaps graph) | 0.1 |
| Cov-select $\rho$ (FX) | 0.01 |
| LASSO zero fraction (FX $A$) | 20% |
| Greedy $n=100$ full path runtime | ~100 s |
| Cost that kills swap Sharpes | 1 bp |

These figures are the operational memory a desk should retain from the paper.


## Worked Numerical Intuition (Synthetic)

Suppose two tenors with true dynamics where the spread $P=S^{(5Y)}-S^{(4Y)}$ is OU with $\lambda=50$ (half-life $\approx3.5$ trading days) and each tenor also loads on a slow level factor. Dense Box–Tiao on $\{4Y,5Y,10Y,30Y\}$ will mix level into the “most mean-reverting” portfolio, shrinking apparent range and pushing $\lambda$ up into the noise region. Greedy $k=2$ recovers approximately the pure spread, preserving range and delivering tradeable $\lambda$. Adding a third tenor helps only if it contributes residual curvature not spanned by the butterfly; Table 2’s small 30Y weights at $k=5$ show that contribution is marginal on U.S. swaps.

This intuition scales: **cardinality is a statistical regularizer against factor contamination**, not only a transaction-cost regularizer. That is why sparse books can win on OOS predictability even before costs.

## Final Desk Policy Suggestion

Codify three gates before a sparse mean-reversion sleeve goes live: (i) dual gap or forward–backward stability of support across adjacent windows; (ii) OOS half-life between 3 and 60 trading days; (iii) expected range > 3× round-trip cost at intended size. Papers that optimize only in-sample $\lambda$ without these gates systematically overstate realizable edge—Figure 10 is the existence proof in G10 swaps.

## One-page cheat sheet for PM meetings

Sparse mean-reverting portfolios via Box-Tiao GEP with Card(x)<=k. Algorithms: greedy O(n^4) and SDP relaxation with dual bound. Preprocess with graphical lasso and LASSO-VAR so optimal baskets live in conditional-dependence clusters. Swaps 1998-2005 and FX 2002-2007: sparse matches dense on OOS lambda, wins on range; 1bp kills swap Sharpes. Operate at k near the elbow (~5 on an 8-tenor curve); reject half-lives under ~2 days or ranges inside 3x bid-ask. Momentum is the same code with maximized predictability. Cite: d Aspremont, Quant Finance 2011, arXiv 0708.3048.

The operational message is unambiguous: sparsity is both a cost control and a statistical regularizer against factor contamination in canonical decompositions. Implement greedy cardinality paths with covariance-selection clustering, certify with SDP dual gaps where feasible, and never promote a sleeve that fails the half-life and range gates after realistic transaction costs. That discipline converts the paper from a convex-optimization curiosity into a production basket engine for rates and FX relative-value books.
 End of summary.
 Prepared 2026-09-22 for Scholar batch_2026-09-22_4.
