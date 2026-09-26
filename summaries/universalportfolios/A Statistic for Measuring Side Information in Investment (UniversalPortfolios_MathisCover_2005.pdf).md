# A Statistic for Measuring the Influence of Side Information in Investment

**Authors:** Charles Mathis; Thomas M. Cover (Electrical Engineering and Statistics, Stanford University)  
**Publication:** Conference/short paper format (NSF grant CCR-0311633 acknowledged); cites Cover (1991), Cover–Ordentlich (1996), Ordentlich–Cover (1998). Drive filename `UniversalPortfolios_MathisCover_2005.pdf`  
**Source PDF:** `UniversalPortfolios_MathisCover_2005.pdf` (Drive id `1al370BEFymz1RKa4hByDU0ENtx90xtPu`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_2)  
**OCR:** Not required; clean `pdftotext -layout` extract (~1,271 words of source; 2 pages)

---

## 1. Problem and Motivation

Side information—macro regimes, signals, states $s_i\in\{1,\ldots,d\}$—can raise the asymptotic growth rate of wealth in Cover-style universal portfolio theory. Practitioners and theorists face a sharper question: **when is the side information useful, and when is it illusory?** Many dependence tests exist, but Mathis and Cover argue none simultaneously (i) speak directly to *financial* value, (ii) avoid arbitrary quantization of the return vector $x_n$, (iii) avoid distributional assumptions on $x_n$, and (iv) deliver a distribution-free null under a clear permutation model.

Their proposal: compare hindsight-optimal **constant-rebalanced** wealth **without** side information to hindsight-optimal **state-dependent** constant-rebalanced wealth **with** side information. If even perfect hindsight cannot extract incremental wealth from the state sequence, causal use of that side information never can. Under the null that all permutations of the observed state sequence are equally likely (states independent of the market path in the permutation sense), the log wealth ratio is asymptotically half a $\chi^2$ with $(d-1)(m-1)$ degrees of freedom—**independent of the particular stock sequence and of the state marginals**.

---

## 2. Setup and Notation

### 2.1 Market and portfolios

Let $x_1,\ldots,x_n\in\mathbb{R}^m_+$ be vectors of **price relatives** (close/open) for $m$ stocks. Portfolio $b=(b_1,\ldots,b_m)$ with $\sum_{j=1}^m b_j=1$, $b_j\ge 0$ in the usual simplex setting. Day-$i$ wealth relative $b^\top x_i$. Constant-rebalanced wealth:

$$
S_n(b,x^n)=\prod_{i=1}^n b^\top x_i.
$$

Hindsight-best constant-rebalanced portfolio (CRP):

$$
S_n^*(x^n)=\max_b S_n(b,x^n).
$$

### 2.2 Universal portfolios achieve $S_n^*$ to first order in the exponent

Cover’s universal portfolio $\hat b_i(\cdot)$ (Cover 1991; Cover–Ordentlich 1996; Ordentlich–Cover 1998) is causal and satisfies, for $m=2$,

$$
\frac{\hat S_n(x^n)}{S_n^*(x^n)}\ge \frac{1}{2\sqrt{n+1}}
$$

for all $n$ and all sequences—so $S_n^*$ is a fair yardstick of what is “reasonably achievable” on the realized path.

### 2.3 Side information

State sequence $s^n=(s_1,\ldots,s_n)$, $s_i\in\{1,\ldots,d\}$, generated arbitrarily, possibly dependent on $x^n$. Hindsight-best **state-dependent** CRP:

$$
S_n^{**}=\max_{b(\cdot)}\prod_{i=1}^n b(s_i)^\top x_i.
$$

This factors as the product of best CRPs on each subsequence $\{i:s_i=k\}$:

$$
S_n^{**}=S_{n,1}^*\,S_{n,2}^*\cdots S_{n,d}^*,
\qquad
S_{n,k}^*=\max_b\prod_{i:s_i=k}b^\top x_i.
$$

### 2.4 Nondegeneracy

$x^n$ has **full dimension** if the convex hull of $\{x_1,\ldots,x_n\}$ strictly contains a positive ray $\lambda\mathbf{1}$. $x^n$ is **nondegenerate w.r.t. $s^n$** if every state-induced subsequence is full-dimensional. These ensure each maximizing portfolio is finite in every component (truly $m$ assets, interior optimum).

### 2.5 Null hypothesis (permutation independence)

Treating $x^n$ as a fixed individual sequence, ordinary stochastic independence of $s^n$ would be vacuous. The economically relevant null is: **all permutations of $s^n$ are equally likely**—i.e., the time-ordering of states is random given the multiset of state counts $n_k=\#\{i:s_i=k\}$. This is a permutation (randomization) test null: side information timing carries no information about the market path.

---

## 3. The Statistic and Main Theorem

### 3.1 Wealth ratio

$$
T_n^*=\frac{S_n^{**}}{S_n^*}\ge 1,
$$

since the max over piecewise-constant (state-dependent) portfolios dominates the max over constant portfolios.

### 3.2 Theorem 1

For any nondegenerate stock sequence $x^n$ and state sequence drawn uniformly from permutations of a sequence with counts $n_k$,

$$
\ln T_n^*\;\xrightarrow{d}\;\tfrac12\,\chi^2_{(d-1)(m-1)}
\quad\text{as }n\to\infty,\; n_k\to\infty\ \forall k.
$$

Equivalently, $T_n^*$ is approximately $\exp(\tfrac12 X)$ for $X\sim\chi^2_{(d-1)(m-1)}$. Critically, the **limiting law does not depend on $x^n$ or on the state frequencies**—only on dimensions $d$ and $m$, given the permutation null and nondegeneracy.

### 3.3 Use as a test

Compute p-value $\mathbb{P}(S^{**}/S^*\ge \text{observed}\mid \text{null})$ from the $\chi^2$ tail (or from exact permutation Monte Carlo in small samples). Accept useful side information when the wealth ratio exceeds the appropriate $\chi^2$ quantile. Degrees of freedom $(d-1)(m-1)$ match the free parameters in choosing $d$ portfolios in $\mathbb{R}^m$ subject to each living on the simplex relative to a single baseline CRP (roughly $(m-1)$ free weights per state, minus sharing across states).

---

## 4. Empirical/Practical Content of the Paper

The paper is theoretical: no market backtest table. Its “empirical” content is the **distribution-free guarantee**: the same critical values apply to any market path. For illustration of calibration:

| $d$ states | $m$ stocks | df $(d-1)(m-1)$ | 95% χ² quantile | Critical $\ln T^*$ | Critical $T^*$ |
|--------------|--------------|-------------------|-----------------|---------------------|-----------------|
| 2 | 2 | 1 | 3.84 | 1.92 | ≈6.82 |
| 2 | 5 | 4 | 9.49 | 4.74 | ≈114 |
| 5 | 2 | 4 | 9.49 | 4.74 | ≈114 |
| 5 | 10 | 36 | 51.0 | 25.5 | ≈1.2×10¹¹ |

So with many states and stocks, hindsight *always* inflates $S^{**}/S^*$ enormously under the null; naive “state-dependent CRP beat CRP by 100×” is meaningless without the χ² correction. With $d=m=2$, needing $T^*\gtrsim 7$ at 5% is a harsh bar—side information must truly reorder wealth.

---

## 5. Connection to Universal Portfolios with Side Information

Cover–Ordentlich (1996) construct causal universal portfolios that track the best state-dependent CRP. Mathis–Cover complements that literature with a **pre-test**: before deploying a side-information universal portfolio, verify that even the hindsight state-dependent CRP significantly beats the hindsight CRP under the permutation null. If not, the side information is illusory for growth-rate purposes.

---

## 6. Limitations

- Asymptotic in $n$ and all $n_k$; small samples need permutation Monte Carlo.
- CRP universe (constant mix within state)—not optimal dynamic trading inside days.
- Long-only simplex as in classical Cover setting; extensions to shorts/leverage need analogous geometry.
- States assumed discrete and given; continuous signals require quantization (which reintroduces analyst choice the paper sought to avoid for $x_n$).
- Null is permutation of states vs fixed $x^n$; alternatives with causal dependence structures may need different critical values.
- No transaction costs, no estimation of finite-sample bias of $\max_b$.

---

## 7. Practical Takeaways for a Quant Investor

1. **Hindsight state splits always look good**—correct with $\tfrac12\chi^2_{(d-1)(m-1)}$ before claiming a regime variable helps.
2. **Use as a gate for alternative data:** treat proposed labels (VIX regime, Fed week, earnings season) as $s_i$; require significant $T_n^*$ before building state-dependent CRPs or universal portfolios.
3. **df inflation is the enemy of fine partitions:** 10 states × 50 stocks ⇒ df=441; almost any split “works” in raw wealth ratio space.
4. **Prefer coarse, economically motivated states** with large $n_k$ so the asymptotic applies and the test has power against real alternatives.
5. **Still deploy Cover–Ordentlich-style causal trackers** only after the test passes; the universal portfolio closes the gap to $S^{**}$ at $O(\log n)$ regret rates in the classical theory.
6. **Individual-sequence philosophy:** results hold pathwise for each $x^n$ under permutation of $s^n$—aligned with worst-case universal portfolio thinking, not iid return assumptions.

---

## 8. Expanded Mathematical Discussion

### 8.1 Why $\tfrac12\chi^2$?

At a growth-optimal CRP, the gradient of log-wealth vanishes and the Hessian of $\sum_i\log(b^\top x_i)$ behaves like a covariance of returns in portfolio coordinates. Splitting into $d$ states adds $(d-1)(m-1)$ free parameters. Under the null, the likelihood-ratio (wealth-ratio) statistic for nested exponential families / multinomial-type portfolio models yields the classical $\chi^2$ LR law; the factor $\tfrac12$ appears because $\ln(S^{**}/S^*)$ is half the usual LR in the local quadratic approximation (analogous to $\ln\Lambda\to\tfrac12\chi^2$ relationships in Gaussian LR tests). The paper states the limit theorem; this paragraph records the standard statistical intuition consistent with that statement.

### 8.2 Relation to $S_n^*$ as benchmark

Because universal portfolios track $S_n^*$ within a polynomial factor, a causal investor who passes the Mathis–Cover test can aim at $S^{**}$ with side-information universal methods and still interpret significance on the same scale as the hindsight ratio.

### 8.3 Nondegeneracy failures

If one state subsequence lies on a lower-dimensional face (e.g., one stock never traded that days), $S_{n,k}^*$ may jump to a corner and the χ² approximation fails. In practice, merge rare states or drop barren assets within-state.

### 8.4 Algorithmic recipe

1. Compute $S_n^*=\max_b\prod_i b^\top x_i$ (convex optimization on the simplex).
2. For each $k$, compute $S_{n,k}^*$ on $\{i:s_i=k\}$; set $S^{**}=\prod_k S_{n,k}^*$.
3. $T^*=S^{**}/S^*$, $L=\ln T^*$.
4. p-value = $\mathbb{P}(\tfrac12\chi^2_{\mathrm{df}}\ge L)= \mathbb{P}(\chi^2_{\mathrm{df}}\ge 2L)$.
5. Optional: exact permutation test sampling random reshuffles of $s^n$.

### 8.5 Quant research hygiene

Any backtest that slices history by a signal and re-optimizes weights inside slices must report Mathis–Cover-style adjusted significance. Otherwise “regime-dependent momentum” and similar narratives overfit timing labels. The paper’s contribution is precisely a **growth-rate-native** significance test for that hygiene problem.

---

## 9. Detailed Comparison with Standard Dependence Tests

Mutual information, Granger causality, and correlation tests between quantized $x_i$ and $s_i$ answer different questions. They can declare dependence that is **financially worthless** (e.g., states that correlate with volatility but not with growth-optimal portfolio drift) or miss dependence that is **financially crucial** but nonlinear in ways the chosen test statistic ignores. Mathis–Cover’s $T_n^*$ answers only: does state-dependent CRP growth beat CRP growth by more than chance under permutation? That is the right question for Cover-style investors and a useful screen for broader quant research.

**Example narrative.** Suppose $m=2$ (stock vs cash-like asset) and $d=2$ (Fed hike week vs other). Hindsight CRP puts weight $b^*$ on the stock. State-dependent CRPs choose $b_1^*,b_2^*$. If hike weeks merely reshuffle identical returns, $T^*\approx 1$ up to χ² noise. If hike weeks systematically favor cash, $S^{**}/S^*$ grows exponentially in $n$ and will reject the null.

**Ties to Ordentlich–Cover (1998).** The cost of achieving the best portfolio in hindsight (polynomial factors) justifies using $S^*$ and $S^{**}$ as targets rather than unreachable genie portfolios with fully dynamic hindsight weights each day.

**NSF CCR-0311633** acknowledges the information-theoretic lineage: portfolios as codes for sequences, wealth as probability, side information as a training sequence—Cover’s standard dictionary.

---

## 10. Full Worked Numerical Prototype (Illustrative Geometry)

Consider $m=2$ assets and $n=200$ days with $d=2$ states and $n_1=n_2=100$. Under the null, $\ln T^*\sim\tfrac12\chi^2_1$. Suppose optimization yields $S_n^*=e^{12}$ (log-wealth 12) and state-dependent product $S^{**}=e^{12.8}$. Then $\ln T^*=0.8$, $2\ln T^*=1.6$, and $\mathbb{P}(\chi^2_1\ge 1.6)\approx 0.21$—**not** significant. A researcher who only reported “+80% relative hindsight wealth with regimes” would overclaim. If instead $\ln T^*=3.0$, $2\ln T^*=6.0$, p≈0.014—pass a 5% test.

For $d=5$, $m=10$, df=36. Even $\ln T^*=10$ ($T^*\approx 22026$) gives $2\ln T^*=20$ vs $\chi^2_{36}$ mean 36—**still insignificant**. This arithmetic is the paper’s practical punchline: raw wealth ratios without df correction are meaningless in moderate dimension.

## 11. Optimization Notes for $S_n^*$ and $S_{n,k}^*$

Maximizing $\sum_i\log(b^\top x_i)$ over the simplex is a standard convex program (concave objective). Interior solutions satisfy $\sum_i x_{i,j}/(b^\top x_i)=\lambda$ for active assets. When a state has few observations, the optimum may sit on a vertex—flag nondegeneracy failures. Numerically, use exponentiated gradient or projected Newton; refuse to report $T^*$ if any $n_k$ is tiny.

## 12. Research Program Uses

1. **Feature selection for portfolio policies:** screen candidate discrete features with Mathis–Cover before RL/policy search.
2. **Regime variable validation:** VIX quintiles, credit-spread regimes, calendar effects.
3. **Avoiding p-hacking in “state-dependent Markowitz”:** any paper that re-estimates weights by state should publish $T^*$ and χ² p-values.
4. **Bridge to universal portfolios:** if test passes, deploy Cover–Ordentlich side-information universal portfolio to track $S^{**}$ causally.

## 13. Philosophical Remarks (Individual Sequences)

Cover’s school treats the market path as an arbitrary sequence, not a draw from a stochastic process. Significance is defined via randomization of the *label* sequence $s^n$. This matches adversarial/online learning intuitions and avoids brittle iid assumptions. For quant shops that distrust return distributional models but trust strategy geometry, the test is unusually well aligned.

## 14. Relationship Among Cited Works

- **Cover 1991:** introduces universal portfolios tracking $S_n^*$.
- **Cover–Ordentlich 1996:** adds side information; tracks best $b(s)$.
- **Ordentlich–Cover 1998:** cost of achieving hindsight best portfolio.
- **Mathis–Cover (this paper):** statistical test for whether side information moves $S^{**}$ vs $S^*$ beyond chance.

Together they form a pipeline: test → causal universal tracking → regret bounds.

## 15. Limitations Revisited for Practitioners

Transaction costs can erase the growth gap even when $T^*$ is significant in frictionless CRP wealth. Liquidity and borrow constraints shrink the simplex. Intraday information is ignored. Still, as a **screen**, the test is cheap and theory-native. Prefer it over reporting state-conditioned Sharpes without multiple-testing correction.

## 16. Summary Paragraph

Mathis and Cover deliver a distribution-free, finance-native test for the value of discrete side information in investment: the hindsight CRP wealth ratio $S^{**}/S^*$, judged against $\exp(\tfrac12\chi^2_{(d-1)(m-1)})$. It operationalizes the slogan “if you can’t win with perfect hindsight side information, you never can,” and supplies critical values independent of the market path—exactly what universal-portfolio theory needed to police illusory signals.

---

## 17. Extended Implications for Modern Quant Research

Although only two pages, Mathis–Cover sits at the intersection of information theory, online learning, and empirical asset pricing hygiene.

**Multiple testing.** Every alternative-data vendor ships discrete tags. Without a df-aware wealth-ratio test, research teams will “find” state-dependent edges proportional to $(d-1)(m-1)$. Mandating $T_n^*$ reports is cheaper than full step-down FDR on trading rules and directly targets growth-rate claims.

**Relation to hierarchical risk parity / regime overlays.** Many overlays re-estimate weights when a classifier flips. Mathis–Cover asks whether the classifier’s hindsight partition improves CRP growth beyond chance. If not, the overlay is theater.

**Continuous signals.** For continuous side information $y_i$, one must quantize to $d$ bins. The test then nests a quantization choice: too many bins inflate df and destroy power; too few bins miss dependence. Cross-validate $d$ with held-out periods or penalize df explicitly.

**Shorting and leverage.** If the action space is not the probability simplex but a leveraged long–short set, redefine $S_n(b,x^n)$ over that set and re-derive an analogous LR statistic; the χ² df become the dimension of the parameter manifold difference between global and state-wise optimizers. The paper’s logic survives; the exact df formula needs re-computation.

**Transaction costs.** Define $S$ with proportional costs inside the product; the inequality $S^{**}\ge S^*$ may fail if state-dependent rebalancing trades more. Then the test should use cost-adjusted wealth—otherwise “significant” side information may be untradeable.

**Finite-sample practice.** For $n<500$ or uneven $n_k$, prefer permutation Monte Carlo: reshuffle $s^n$, recompute $T^*$, rank the observed $T^*$ among null draws. Use the χ² approximation as a quick filter only.

**Teaching use.** The paper is an excellent homework: give students daily relative prices and a fake state; have them optimize CRPs and compute p-values; then reveal the states were random permutations—half will have “found” something before correction.

**Bottom line.** Side information in investment is not “any dependence.” It is incremental growth vs the best constant mix. Mathis–Cover give the exact nonparametric yardstick for that claim in the Cover universe, with critical values $\mathbb{P}(\chi^2_{(d-1)(m-1)}\ge 2\ln(S^{**}/S^*))$.

---

## 18. Line-by-Line Restatement of the Paper’s Logic

**Abstract restated.** Side information can raise wealth growth. Usefulness vs illusion is tested by comparing hindsight best CRP wealth on the full sequence to hindsight best CRP wealth on state-wise subsequences. If hindsight cannot profit from states, causal methods cannot either. Under permutation null, $\ln(S^{**}/S^*)\to\tfrac12\chi^2_{(d-1)(m-1)}$, independent of the stock path and of state marginals. Accept side information when the wealth ratio clears the χ² quantile.

**Section I summary expanded.** Price relatives $x_{ij}$; portfolio constraint $\sum_j b_j=1$; wealth $S_n(b,x^n)=\prod_i b^\top x_i$; $S_n^*=\max_b S_n$. Universal portfolio $\hat S_n$ tracks $S_n^*$ within $1/(2\sqrt{n+1})$ for $m=2$. Side information $s_i\in\{1,\ldots,d\}$ yields $S_n^{**}=\max_{b(\cdot)}\prod_i b(s_i)^\top x_i=\prod_{k=1}^d S_{n,k}^*$. Full dimension and nondegeneracy defined via convex hull containing a ray $\lambda\mathbf{1}$. Independence for the null = uniform over permutations of $s^n$ with fixed counts $n_k$. Statistic $T_n^*=S_n^{**}/S_n^*\ge 1$. Theorem 1: $\ln T_n^*\to_d \tfrac12\chi^2_{(d-1)(m-1)}$ as $n,n_k\to\infty$. Meaning: nonparametric significance via permutation test; p-value = probability random side information with same marginal frequencies does as well.

**Acknowledgment.** NSF CCR-0311633.

**References restated.** Cover MF 1991; Cover–Ordentlich IEEE IT 1996; Ordentlich–Cover MOR 1998.

## 19. Parameter Dimension Heuristic

A single CRP has $m-1$ free weights. $d$ independent CRPs have $d(m-1)$ free weights. Nested comparison against one shared CRP leaves $(d-1)(m-1)$ incremental parameters—matching the χ² df. This nested-model accounting is why finer state partitions and larger universes demand exponentially larger wealth ratios before significance.

## 20. Causal vs Hindsight Asymmetry

The paper’s slogan is one-sided: failure of hindsight side information ⇒ failure of causal use. Success of hindsight does **not** imply a causal strategy wins after costs—only that the information is not *a priori* worthless. Universal portfolio theory then supplies causal trackers with regret bounds relative to $S^{**}$. Mathis–Cover is the entry gate; Cover–Ordentlich is the deployment engine.

## 21. Quant Implementation Snippet (Pseudocode)

```
Input: X[n,m] price relatives, s[n] states in 1..d
S_star = max_{b in simplex} prod_i (b · X[i])
S_ss = 1
for k in 1..d:
  idx = {i : s[i]==k}
  assert full_dimension(X[idx])
  S_ss *= max_b prod_{i in idx} (b · X[i])
T = S_ss / S_star
L = log(T)
df = (d-1)*(m-1)
pval = chi2_sf(2*L, df)   # P(chi2_df >= 2L)
# optional: permute s many times, empirical pval
```

## 22. Closing Statement

For universal-portfolio and growth-optimal investors, Mathis and Cover replace vague “signal dependence” talk with a single number $T_n^*$ and a universal null. That is the paper’s entire deliverable—and it is sufficient to police a large class of regime-overlay claims.

---

## 23. Degrees-of-Freedom Table for Common Cases

| d | m | df | χ²_0.95 | min ln T* for 5% | min T* |
|---|---|---|---------|------------------|--------|
| 2 | 2 | 1 | 3.841 | 1.921 | 6.82 |
| 2 | 3 | 2 | 5.991 | 2.996 | 20.0 |
| 3 | 3 | 4 | 9.488 | 4.744 | 115 |
| 4 | 5 | 12 | 21.03 | 10.51 | 3.7e4 |
| 10 | 10 | 81 | 103.0 | 51.5 | 2.3e22 |

These thresholds follow directly from Theorem 1’s $\ln T^*\sim\tfrac12\chi^2_{\mathrm{df}}$ and illustrate why fine regime grids almost never clear classical significance on raw wealth ratios alone. Always report df beside $T^*$.

**Source length note:** 2-page theory paper (~1,271 words extracted); summary elaborates all definitions, Theorem 1, universal-portfolio links, and implementation without adding external empirical results.
