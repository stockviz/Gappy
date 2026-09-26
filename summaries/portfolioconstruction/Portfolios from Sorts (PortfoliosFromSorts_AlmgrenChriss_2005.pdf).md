# Portfolios from Sorts — Almgren & Chriss (2005) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Portfolios from Sorts |
| **Authors** | Robert Almgren (University of Toronto, Math/CS & Mathematical Finance); Neil Chriss (SAC Capital Management) |
| **Date** | April 26, 2005 |
| **Type** | Working paper / quantitative methodology (portfolio construction) |
| **Companion** | Longer technical paper Almgren & Chriss (2004), cited as “AC,” with proofs |
| **Themes** | Ordering information, mean-variance with ordinal alphas, centroid portfolios, cone geometry, short-term reversal |
| **Original PDF** | `PortfoliosFromSorts_AlmgrenChriss_2005.pdf` |
| **Drive file id** | `14LpQYTSexViFmcFAAPsEMkeAYieLW888` |
| **Extraction** | `pdftotext` (~7,721 words); text usable |

---

## Problem / Motivation

Modern portfolio theory (Markowitz 1952) needs a **numerical** expected-return vector $r$ and a covariance $V$. In practice, much of the empirical asset-pricing and quant-signal literature delivers **ordering information**—sorts on value, momentum, short-term reversal, quality—without a trustworthy cardinal mapping from signal to expected return. Ad hoc responses (linear score-to-weight schemes, decile long-shorts) either ignore $V$ or invent a cardinal $r$ (e.g., rank z-scores) without economic justification.

Almgren & Chriss ask: **what does “optimal” mean when beliefs are inequalities on expected returns**, and how can one use the full covariance matrix under those beliefs? Their answer: define a preference relation over portfolios that respects every expected-return vector consistent with the sort; characterize efficient portfolios; pick a unique optimum via the **centroid** of the consistent cone; implement as $\max w\cdot c$ s.t. $w'Vw\le\sigma^2$ (i.e., $w\sim V^{-1}c$).

Empirical claim (CRSP 1990–2002, short-term reversal sorts): **optimized centroid** information ratios substantially beat linear, unoptimized centroid, and optimized-linear alternatives—especially for large $n$.

---

## Setup: Ordering Information as a Cone

Universe $S_1,\ldots,S_n$. A **sort** is a set of homogeneous linear inequalities on $r=(r_1,\ldots,r_n)$. Examples:

1. **Single complete sort:** $r_1\ge r_2\ge\cdots\ge r_n$, or equivalently $r_i-r_{i+1}\ge 0$ for $i=1,\ldots,n-1$.
2. **Sector sorts:** complete sorts within each of $k$ sectors; no cross-sector order.
3. **Deciles:** every name in group $g$ beats every name in group $g+1$.
4. **Long/short complete sort:** $r_1\ge\cdots\ge r_\ell\ge 0\ge r_{\ell+1}\ge\cdots\ge r_n$.
5. **Index over/underperform:** $r_j\ge\sum\mu_i r_i$ for $j\le\ell$, and reverse for $j>\ell$, with $\mu$ an index weight vector.
6. **Higher-order sorts:** e.g. $r_1-r_2\ge r_2-r_3$ (larger spreads in the tails).
7. **Multiple incompatible sorts** (value and momentum): cone may force equalities on a subspace; construction still applies.

The set $Q=\{r:\text{all inequalities hold}\}$ is a **cone**. Portfolio $w\in\mathbb{R}^n$ (signed dollars; cash holds the residual). Expected dollar return $w\cdot r$; variance $w\cdot V\cdot w$.

---

## Preference Relation and Fundamental Portfolios

**Economic Assumption 1.** Prefer $w$ to $v$ if $w\cdot r\ge v\cdot r$ for every $r\in Q$.

For a complete sort, **fundamental portfolios**
$$
e_i=(0,\ldots,0,1,-1,0,\ldots,0)
$$
(buy \$1 of rank $i$, sell \$1 of rank $i+1$) have $e_i\cdot r=r_i-r_{i+1}\ge 0$ for all $r\in Q$. Nonnegative combinations $w_\lambda=\sum\lambda_i e_i$ ($\lambda_i\ge 0$) inherit nonnegative expected return under every consistent $r$.

Any portfolio decomposes as
$$
w=\sum_{i=1}^{n-1}\lambda_i e_i+\gamma\mathbf{1}.
$$
The equal-weight vector $\mathbf{1}$ is **orthogonal to the sort**: for every consistent $r$ with $\mathbf{1}\cdot r\ge 0$ there is another consistent $r'$ (reverse order, flip signs) with $\mathbf{1}\cdot r'\le 0$. Hence preference **ignores** the $\gamma\mathbf{1}$ component.

**Definition (coarse preference).** Write $w-v=\sum\lambda_i e_i+\gamma\mathbf{1}$. Then $w\succeq v$ iff $\lambda_i\ge 0$ for all $i$.

**General structure.** Ordering information induces an orthogonal split into relevant subspace $R$ and irrelevant $R^\perp$; compare only $w_{\mathrm{rel}}$. Mean-variance has the same logic with one-dimensional $R=\mathrm{span}\{r\}$.

---

## Efficient Portfolios

Budget set example: $M=\{w:w\cdot V\cdot w\le\sigma^2\}$. Portfolio $w\in M$ is **efficient** if no $v\in M$ is strictly preferable.

**Characterization (complete sort).** Efficient portfolios are exactly the mean-variance optima for expected returns that are consistent with the sort **and sum to zero**:
$$
r_1\ge\cdots\ge r_n,\quad\sum r_i=0.
$$
Equivalently, with dual basis vectors
$$
E_j=\frac1n\bigl(\underbrace{n-j,\ldots,n-j}_{j},\underbrace{-j,\ldots,-j}_{n-j}\bigr),
$$
satisfying $E_i\cdot e_j=\delta_{ij}$ and $E_i\cdot\mathbf{1}=0$, efficient portfolios are
$$
w\sim V^{-1}\bigl(x_1 E_1+\cdots+x_{n-1}E_{n-1}\bigr),\quad x_i\ge 0. \tag{1}
$$
If $r=Vw$ fails consistency or zero-sum, there exists same-risk $v$ with weakly larger loadings on every fundamental $e_i$.

---

## Optimal (Centroid) Portfolios

Efficiency still leaves a large set. **Modeling assumption:** every expected-return *direction* in $Q$ is equally likely—radially symmetric measure $\mu$ on $Q$.

**Economic Assumption 2 (fine preference).** Prefer $w$ to $v$ if $w_{\mathrm{rel}}$ beats $v_{\mathrm{rel}}$ on a larger $\mu$-measure of $Q$.

**Key theorem (AC):** there exists a vector $c$—the **centroid** (center of mass) of $Q$—such that
$$
w\succeq v\iff w\cdot c\ge v\cdot c.
$$
Hence the risk-constrained optimum is the LP/QP
$$
\max_w\, w\cdot c\quad\text{s.t.}\quad w\cdot V\cdot w\le\sigma^2,
$$
with solution $w\sim V^{-1}c$ (the **centroid optimal portfolio**).

### Centroid shape (complete sort)

For $n=50$, $c$ **overweights extremes and underweights the middle** relative to a linear profile (Figure 1). Analytical approximation (error $\lt 0.5\%$):
$$
c_{j,n}=N^{-1}\!\left(\frac{n+1-j-\alpha}{n-2\alpha+1}\right),\quad\alpha=A-B n^{-\beta},
$$
with $N^{-1}$ the inverse normal CDF, $A=0.4424$, $B=0.1185$, $\beta=0.21$.

Figure 2: sector centroids fix relative extreme sizes across sectors; long/short-with-sign centroid; **decile centroid $\neq$ 10-asset complete-sort centroid**.

---

## Empirical Tests

### Design (historical CRSP)

- Universe: start from 1,000 largest-cap names on 1990-01-19 with $\ge 1{,}000$ prior daily returns for covariance; replace disappearances with largest new eligible names through 2002-12-31; $\sim$3,000 daily dates, $\sim$2,000 distinct names; $\ge 1{,}000$ names each day with 1,000-day history. **No look-ahead.**
- Covariance: trailing 1,000 days.
- Signal: **short-term reversal** (Thorp / Campbell–Grossman–Wang): sort by return over $[t-L-K,t-L]$; most down ranked highest expected return. Baseline $K=5$ days; lags $L=0$ and $L=1$; also $K\in\{10,15,20,25\}$. Daily rebalance.
- Four portfolios (Table 1), each scaled to **unit ex ante risk** under $V$:

| | Linear $\ell$ | Centroid $c$ |
|--|-----------------|----------------|
| Unoptimized | $w\sim\ell$ | $w\sim c$ |
| Optimized | $w\sim V^{-1}\ell$ | $w\sim V^{-1}c$ |

### Results (Table 2, information ratios)

Because ex ante vol is scaled to 1, IR equals average return. Patterns:

1. **Covariance optimization dramatically raises IR** (optimized rows vs unoptimized).
2. **Centroid beats linear**, with or without $V$.
3. **Gains largest for large portfolios** ($n=200,500$).

Illustrative cells ($K=5$, lag 0): for $n=500$, unoptimized linear/centroid IRs $\approx 2.97/3.22$; optimized linear/centroid $\approx 5.82/6.88$. With lag 1 (more realistic), $n=500$, $K=5$: optimized centroid IR $\approx 4.20$ vs optimized linear $\approx 3.55$ vs unoptimized linear $\approx 2.72$. Figure 3: for large $n$, optimized centroid more than **2$\times$** unoptimized linear.

Simulation robustness (order known, random permutations degrade ranks): centroid performance decays only slowly as permutation severity rises—method is not fragile to moderate ranking noise.

---

## Implementation Recipe (Section 6)

1. Define feasible set $M$ (risk, gross/net, position limits, turnover, etc.); include $V$ here.
2. Encode ordering beliefs as homogeneous inequalities → cone $Q$, coarse preference, efficient set.
3. Compute centroid $c$ of $Q$ (analytic approx for complete sorts; Monte Carlo for complex/multiple sorts—see AC).
4. Solve $\max_{w\in M} c\cdot w$ (QP/LP with quadratic risk constraint).

---

## Limitations

- Empirical study uses **short-term reversal**, not value/momentum; magnitudes are strategy-specific.
- Lag-0 results overstate implementable IR; lag-1 is more relevant.
- No explicit transaction-cost optimization in the reported IRs (turnover of daily reversal is high).
- Requires a trustworthy $V$; bad covariance estimates pollute $V^{-1}c$.
- Multiple incompatible sorts need careful cone construction; centroid may lie in a lower-dimensional face.
- Preference axioms are normative; investors with views on cardinal spacings should add higher-order inequalities rather than force a linear score.

---

## Practical Takeaways for a Quant Investor

1. **Stop inventing cardinal alphas from ranks without theory.** If you only trust order, optimize $w\sim V^{-1}c$ with $c$ the centroid of the consistent cone—not $w\sim\mathrm{rank}$ and not $w\sim V^{-1}(\mathrm{rank})$.
2. **Extremes matter:** complete-sort centroids naturally overweight top/bottom ranks vs linear weights—aligns with “tails are more informative” folklore, derived here from symmetry on $Q$.
3. **Covariance is first-order:** moving from $w\sim c$ to $w\sim V^{-1}c$ roughly doubles IR in their reversal tests for large $n$.
4. **Sector-neutral / decile / multi-signal** cases fit the same cone+centroid machinery—do not glue ad hoc subportfolio weights.
5. **Production:** precompute $c$ for your sort type; update $V$ on your usual schedule; solve risk-constrained QP; add TCA as constraints in $M$.
6. **Research hygiene:** when a paper shows a monotonic sort, the implementable portfolio should be evaluated as optimized-centroid (or at least optimized-linear), not equal-weight decile long-short alone.

---

## Key Formulas

| Object | Formula |
|--------|---------|
| Complete sort | $r_1\ge\cdots\ge r_n$ |
| Fundamental portfolio | $e_i$ long $i$ short $i+1$ |
| Efficient set | $w\sim V^{-1}(\sum x_j E_j)$, $x_j\ge 0$ |
| Centroid approx | $c_{j,n}=N^{-1}((n+1-j-\alpha)/(n-2\alpha+1))$, $\alpha=0.4424-0.1185\,n^{-0.21}$ |
| Optimum | $w\sim V^{-1}c$ s.t. risk (and other) constraints |

---

## Extended Discussion: Why the Centroid Overweights Tails

Under radial symmetry on the cone $Q=\{r:r_1\ge\cdots\ge r_n\}$, the “typical” consistent return vector is not linear in rank. Order-statistics geometry for Gaussian (or elliptically contoured) directions intersecting the cone yields spacings that are larger in the tails—the same reason normal scores / van der Waerden scores overweight extremes. The paper’s $\alpha$ adjustment calibrates finite-$n$ bias so that the inverse-normal formula matches the true centroid within 0.5%. For a quant, this means: **if your optimizer uses rank or percentile as a fake alpha, you are under-weighting the names your sort is most confident about** relative to the symmetry-optimal benchmark.

### Relation to Standard Quant Practice

Common pipeline: signal → cross-sectional z-score → winsorize → $w\propto V^{-1}z$ (or risk-parity / multifactor). Almgren–Chriss says: if $z$ is only a monotone transform of a rank, replace $z$ by $c$ (or by a higher-order-sort centroid if you believe in tail spacings). If you truly believe cardinal values (calibrated expected returns from a structural model), use those as $r$ and classical mean-variance—the cone machinery is for when cardinality is not credible.

### Sector and Multi-Sort Geometry

Sector sorts: $Q$ is a product of within-sector order cones; centroid has within-sector tail overweight and **endogenous** relative scale across sectors (Figure 2, top)—no need to manually set sector risk budgets to equalize “alpha strength.” Multiple incompatible sorts: $Q$ may shrink toward a subspace where conflicting inequalities force equalities; Monte Carlo integration over the resulting cone is the practical tool (details in AC 2004).

### Empirical Design Critiques and Responses

- *Why reversal?* Isolates ordering methodology from alpha-model estimation; signal is unambiguous and previously documented (Thorp; Campbell–Grossman–Wang 1993).
- *Look-ahead?* Replacement rule uses only past returns for eligibility; covariance uses trailing windows.
- *Multiple testing across $n,K,L$?* Qualitative dominance of optimized centroid is stable across the grid in Table 2, not a single-cell fluke.
- *Costs?* Daily reversal IR will compress sharply under realistic TCA; the **ranking of methods** (centroid vs linear, optimized vs not) is the object of interest, not the absolute IR level.

### Numerical Algorithms

Complete-sort $c$: evaluate inverse-normal formula. General $Q$: sample directions uniformly on the sphere (or use MCMC on the cone), average the consistent samples, project to relevant subspace. Optimization: any QP solver for $\max c'w$ s.t. $w'Vw\le\sigma^2$ plus linear constraints (gross, net, box, factor-neutrality). Factor-neutrality constraints sit in $M$ and do not change the definition of $c$.

### Connection to Robust Optimization

Centroid optimization is related in spirit to maximin / robust portfolio choice over an uncertainty set for $r$, but here the uncertainty set is a cone of directions and the preference is measure-theoretic (Assumption 2), not worst-case. Worst-case over $Q\cap\{\|r\|=1\}$ would typically push toward a vertex (pure adjacent pairs $e_i$), not the centroid. The paper’s economic assumption is therefore milder and more “Bayesian under flat priors on directions” than pure robust-maximin.

### Takeaways Recap for Implementation Teams

Replace linear rank weights with centroid weights; always run through $V^{-1}$ unless risk is constrained elsewhere; extend to sector/decile/multi-signal via cone construction; treat absolute IRs from daily reversal as upper bounds before costs; document $A,B,\beta$ coefficients if using the analytic approx; for production multi-sort books, invest in Monte Carlo centroid estimation as a shared library function.

### Final Assessment

Almgren & Chriss (2005) supply the missing optimality theory for the ubiquitous “portfolio from a sort.” The operational rule $w\sim V^{-1}c$ with $c$ the cone centroid is simple, covariance-aware, and empirically dominant over linear alternatives in their reversal laboratory. For any quant process that begins with a ranking, this paper should be the default reference for how to turn that ranking into weights.


---

## Detailed Table 2 Walkthrough (Information Ratios)

Table 2 reports IRs for reversal periods $K\in\{5,10,15,20,25\}$ days, portfolio sizes $n\in\{25,50,100,200,500\}$, and lags $L\in\{0,1\}$. Each cell is a $2\times 2$ block: rows = {unoptimized, optimized}; columns = {linear, centroid}.

**Lag 0, $K=5$ (upper box, first pair of columns):**
- $n=25$: unopt 2.50 / 2.47; opt 3.21 / 3.20
- $n=50$: unopt 2.88 / 2.95; opt 3.53 / 3.99
- $n=100$: unopt 3.18 / 3.20; opt 4.26 / 4.76
- $n=200$: unopt 3.04 / 3.20; opt 4.96 / 5.87
- $n=500$: unopt 2.97 / 3.22; opt 5.82 / 6.88

**Lag 1, $K=5$ (lower box):**
- $n=25$: unopt 2.32 / 2.32; opt 2.39 / 2.41
- $n=50$: unopt 2.91 / 2.97; opt 2.58 / 2.89
- $n=100$: unopt 3.25 / 3.15; opt 3.07 / 3.30
- $n=200$: unopt 3.25 / 3.22; opt 3.70 / 4.13
- $n=500$: unopt 2.72 / 2.84; opt 3.55 / 4.20

Interpretation: (i) optimization ($\times V^{-1}$) is the primary IR driver at large $n$; (ii) centroid adds a further consistent lift, growing with $n$; (iii) lag-1 halves some of the fantasy IR but preserves method ranking; (iv) longer reversal windows $K$ generally lower IR (signal decay), yet centroid/optimized dominance persists across the grid.

### Economics of Assumption 1 vs Assumption 2

Assumption 1 (coarse) only ranks portfolios when one dominates on *all* consistent $r$—a partial order with many incomparable pairs. Assumption 2 (fine) uses the measure $\mu$ to break ties, yielding a complete preorder represented by linear scoring with $c$. Without Assumption 2, the efficient set is large and the investor still needs a selection rule; the centroid is that rule under directional symmetry. If the investor has a non-symmetric prior (e.g., more weight on near-linear profiles), replace $\mu$ and recompute the center of mass—methodology unchanged.

### Covariance Estimation Choices in the Empirical Study

Trailing 1,000-day sample covariance on ~1,000 names is noisy ($T\approx N$). Yet optimized portfolios still crush unoptimized ones, suggesting that even a crude $V$ carries useful relative-variance and correlation information for reversal books. In production, shrink $V$ (Ledoit–Wolf), use factor covariances, or impose sector blocks—the Almgren–Chriss theory is agnostic about how $V$ is built, as long as risk constraints use that same $V$.

### Higher-Order Sorts as Soft Cardinal Views

Belief $r_1-r_2\ge r_2-r_3$ encodes “convex spacings at the top” without specifying magnitudes. The resulting cone is narrower than the complete-sort cone; its centroid puts even more weight on extremes. This is the right way to express “I trust top-decile separations more than middle-decile separations” without fabricating basis-point alphas.

### Multiple Signals (Value + Momentum)

When sorts conflict, $Q$ may only contain vectors with many equalities (degenerate). The relevant subspace shrinks; the centroid still exists. Practically: (1) form inequalities for each signal; (2) Monte Carlo sample from the intersection cone; (3) average to get $c$; (4) optimize $w\sim V^{-1}c$ with neutrality constraints. Alternative: build separate centroids and combine via a prior on signal strength—but that reintroduces cardinality. The pure cone intersection is the coherent “I believe both sorts simultaneously” object.

### Pseudo-Code

```
input: ranks or inequality list, covariance V, risk cap sigma2, optional constraints A w <= b
Q <- cone_from_inequalities(inequalities)
c <- centroid(Q)   # analytic or Monte Carlo
solve: max c'w  s.t. w' V w <= sigma2, A w <= b
output: w_star
```

### Comparison to Mean-Variance with Rank Z-Scores

Rank z-score $z_j=\Phi^{-1}((j-0.5)/n)$ is close to the paper’s $c_{j,n}$ but lacks the $\alpha$ finite-sample offset and lacks the general-cone extension. For complete sorts, using inverse-normal scores with the paper’s $\alpha$ is an excellent approximation; for sector/decile/multi-sort, z-scores on pooled ranks are **not** the centroid and can mis-scale blocks.

### Risk-Budgeting View

Because $w\sim V^{-1}c$, names that are high-centroid and low residual variance (after hedging correlating names) receive large weight. Two equally top-ranked names can receive very different weights if one is a high-vol idiosyncratic bet and the other is cheap residual risk—this is desired. Decile long-shorts that ignore $V$ overweight noisy small names; Almgren–Chriss systematically avoids that when $V$ is realistic.

### Transaction Costs and Turnover

Daily reversal with $L=0$ is not a production strategy net of costs. Extending $M$ with turnover penalties $\|w-w_{\mathrm{prior}}\|_1\le\tau$ or TCA quadratic terms keeps the same $c$ and changes only the feasible set—preference theory unchanged. Expected result: IR gap between methods shrinks but optimized centroid should remain preferred if $V$ and $c$ are stable day-to-day.

### What This Paper Is Not

Not a new alpha; not a covariance estimator; not a TCA model; not a full Bayesian expected-return model. It is a **bridge from ordinal beliefs to mean-variance geometry**. That bridge is the contribution.

### Library Relevance for Gappy / Quant Process

Any systematic book that sorts on signal scores should document whether weights are equal-weight deciles, linear in rank, inverse-vol, or $V^{-1}c$. This paper argues for the last, with $c$ theory-consistent. It also explains why “just use the ranks as alphas” is incomplete: without zero-sum/consistency restrictions and without centroid selection, the portfolio need not be efficient under the paper’s preference relation.

### Summary Paragraph

Almgren & Chriss replace cardinal expected returns with a cone of consistent orderings, define efficiency via dominance on that cone, and select a unique optimum using the cone centroid $c$, yielding $w\sim V^{-1}c$. Empirical reversal tests on CRSP 1990–2002 show large IR gains from both optimization and centroid versus linear weights, especially at $n=200$–$500$. The framework extends to sectors, deciles, sign constraints, index relative performance, higher-order spacings, and multiple sorts. For implementation teams, the durable rule is: **encode views as inequalities, compute $c$, optimize against $V$ inside $M$.**


### Recap of Core Quantitative Messages

1. Beliefs = homogeneous inequalities on $r$ → cone $Q$.
2. Fundamental portfolios $e_i$; preference ignores $\mathbf{1}$ component.
3. Efficient set ≡ MV-optimal for zero-sum consistent $r$ ≡ $w\sim V^{-1}(\sum x_j E_j)$, $x_j\ge 0$.
4. Centroid $c$ of $Q$ represents fine preference; optimum $w\sim V^{-1}c$.
5. Complete-sort approx: $c_{j,n}=N^{-1}((n+1-j-\alpha)/(n-2\alpha+1))$, $\alpha=0.4424-0.1185 n^{-0.21}$; overweights tails.
6. CRSP 1990–2002 reversal lab: optimized centroid IR dominates linear/unoptimized; e.g. lag-0 $n=500$ $K=5$: 6.88 vs 2.97 unopt linear; lag-1: 4.20 vs 2.72.
7. Extends to sectors, deciles, sign constraints, index relative, higher-order spacings, multi-sorts.
8. Production: encode inequalities → $c$ → QP in $M$ including $V$ and TCA/turnover.


---

## Source Evidence Appendix — Almgren & Chriss (2005)

The following curated excerpts preserve quantitative statements from the extracted PDF text for auditability and completeness of the research notes.

### Excerpt 1

```
where N −1 (·) is the inverse cumulative normal distribution and A = 0.4424,
B = 0.1185 and β = 0.21. This construction is somewhat reminiscent of
“normal scores,” but we provide a precise characterization of the offset α
```

### Excerpt 2

```
where N −1 (·) is the inverse cumulative normal distribution and A = 0.4424,
B = 0.1185 and β = 0.21. This construction is somewhat reminiscent of
“normal scores,” but we provide a precise characterization of the offset α
as well as a framework that extends to more general scenarios.
```

### Excerpt 3

```
in practice? And is it robust enough to give good performance in the pres-
ence of the ranking errors that are inevitable in real situations? We answer
these questions with two series of empirical tests:
    • We use historical returns data from the CRSP data set to implement
```

### Excerpt 4

```
implemented the following day). Portfolios are rebalanced daily.
    On each date t we form four different portfolios (Table 1):
  1. The unoptimized linear portfolio takes weights w ∼ `, where ` is a
     linear vector that is long the highest-ranked assets and short the
```

### Excerpt 5

```
Table 1: The four portfolios compared in the empirical test. The layout
matches the results shown in Table 2.
```

### Excerpt 6

```
Table 1: The four portfolios compared in the empirical test. The layout
matches the results shown in Table 2.

  2. The unoptimized centroid portfolio takes the weights to be the centroid
```

### Excerpt 7

```
to the estimated covariance matrix V.
    Figure 3 and Table 2 show the results, across a range of portfolio sizes
(note that since portfolio volatility has been scaled to one, information ra-
tio is equivalent to average return). Three points are immediately evident:
```

### Excerpt 8

```
of stocks       5            10             15           20          25
             2.50 2.47    2.36 2.40      1.72 1.75   1.42 1.45    1.59 1.61
    25
             3.21 3.20    2.37 2.50      1.84 1.95   1.69 1.93    1.63 1.79
```

### Excerpt 9

```
25
             3.21 3.20    2.37 2.50      1.84 1.95   1.69 1.93    1.63 1.79
             2.88 2.95    2.92 3.10      2.39 2.52   2.07 2.16    2.06 2.14
    50
```

### Excerpt 10

```
3.21 3.20    2.37 2.50      1.84 1.95   1.69 1.93    1.63 1.79
             2.88 2.95    2.92 3.10      2.39 2.52   2.07 2.16    2.06 2.14
    50
             3.53 3.99    3.26 3.63      3.03 3.35   2.93 3.30    2.79 3.07
```

### Excerpt 11

```
50
             3.53 3.99    3.26 3.63      3.03 3.35   2.93 3.30    2.79 3.07
             3.18 3.20    2.98 3.12      2.46 2.61   2.09 2.17    2.17 2.19
    100
```

### Excerpt 12

```
3.53 3.99    3.26 3.63      3.03 3.35   2.93 3.30    2.79 3.07
             3.18 3.20    2.98 3.12      2.46 2.61   2.09 2.17    2.17 2.19
    100
             4.26 4.76    3.65 4.09      3.54 3.95   3.19 3.73    3.10 3.43
```

### Excerpt 13

```
100
             4.26 4.76    3.65 4.09      3.54 3.95   3.19 3.73    3.10 3.43
             3.04 3.20    2.64 2.83      2.40 2.54   2.05 2.20    2.17 2.27
    200
```

### Excerpt 14

```
4.26 4.76    3.65 4.09      3.54 3.95   3.19 3.73    3.10 3.43
             3.04 3.20    2.64 2.83      2.40 2.54   2.05 2.20    2.17 2.27
    200
             4.96 5.87    3.81 4.61      3.83 4.51   3.37 4.18    3.08 3.75
```

### Excerpt 15

```
200
             4.96 5.87    3.81 4.61      3.83 4.51   3.37 4.18    3.08 3.75
             2.97 3.22    2.40 2.72      2.11 2.37   1.91 2.19    1.93 2.16
    500
```

### Excerpt 16

```
4.96 5.87    3.81 4.61      3.83 4.51   3.37 4.18    3.08 3.75
             2.97 3.22    2.40 2.72      2.11 2.37   1.91 2.19    1.93 2.16
    500
             5.82 6.88    4.33 5.38      4.31 5.25   4.44 5.40    4.31 5.10
```

### Excerpt 17

```
500
             5.82 6.88    4.33 5.38      4.31 5.25   4.44 5.40    4.31 5.10
```

### Excerpt 18

```
2.32 2.32    2.10 2.15      1.61 1.61   1.20 1.24    1.46 1.46
    25
             2.39 2.41    1.84 1.86      1.35 1.40   1.25 1.43    1.35 1.48
```

### Excerpt 19

```
25
             2.39 2.41    1.84 1.86      1.35 1.40   1.25 1.43    1.35 1.48
             2.91 2.97    2.80 2.96      2.29 2.37   1.85 1.90    1.93 1.97
    50
```

### Excerpt 20

```
2.39 2.41    1.84 1.86      1.35 1.40   1.25 1.43    1.35 1.48
             2.91 2.97    2.80 2.96      2.29 2.37   1.85 1.90    1.93 1.97
    50
             2.58 2.89    2.52 2.85      2.46 2.65   2.32 2.54    2.30 2.48
```

### Excerpt 21

```
50
             2.58 2.89    2.52 2.85      2.46 2.65   2.32 2.54    2.30 2.48
             3.25 3.15    2.77 2.84      2.29 2.38   1.81 1.85    1.95 1.94
    100
```

### Excerpt 22

```
2.58 2.89    2.52 2.85      2.46 2.65   2.32 2.54    2.30 2.48
             3.25 3.15    2.77 2.84      2.29 2.38   1.81 1.85    1.95 1.94
    100
             3.07 3.30    2.47 2.83      2.62 3.02   2.34 2.87    2.38 2.68
```

### Excerpt 23

```
100
             3.07 3.30    2.47 2.83      2.62 3.02   2.34 2.87    2.38 2.68
             3.25 3.22    2.41 2.49      2.11 2.18   1.67 1.76    1.80 1.89
    200
```

### Excerpt 24

```
3.07 3.30    2.47 2.83      2.62 3.02   2.34 2.87    2.38 2.68
             3.25 3.22    2.41 2.49      2.11 2.18   1.67 1.76    1.80 1.89
    200
             3.70 4.13    2.70 3.17      2.73 3.27   2.32 3.01    2.16 2.70
```

### Excerpt 25

```
200
             3.70 4.13    2.70 3.17      2.73 3.27   2.32 3.01    2.16 2.70
             2.72 2.84    1.95 2.15      1.60 1.81   1.36 1.59    1.37 1.60
    500
```

### Excerpt 26

```
3.70 4.13    2.70 3.17      2.73 3.27   2.32 3.01    2.16 2.70
             2.72 2.84    1.95 2.15      1.60 1.81   1.36 1.59    1.37 1.60
    500
             3.55 4.20    2.27 2.95      2.47 3.19   2.74 3.46    2.71 3.30
```

### Excerpt 27

```
500
             3.55 4.20    2.27 2.95      2.47 3.19   2.74 3.46    2.71 3.30
```

### Excerpt 28

```
Table 2: Information ratios for the four strategies considered in this paper,
for varying lag, reversal period, and portfolio size. Upper box is lag of
zero days; lower box is lag of one day. Within each box, the layout is as
```

### Excerpt 29

```
zero days; lower box is lag of one day. Within each box, the layout is as
in Table 1: the left column is based on the linear portfolio, the right on the
centroid; the upper row is the unoptimized portfolios and the lower row
is the optimized portfolios.
```
