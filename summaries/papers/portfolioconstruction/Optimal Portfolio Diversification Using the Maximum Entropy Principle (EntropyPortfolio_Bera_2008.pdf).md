# Optimal Portfolio Diversification Using the Maximum Entropy Principle — Bera & Park (2008) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Optimal Portfolio Diversification Using the Maximum Entropy Principle |
| **Authors** | Anil K. Bera (UIUC); Sung Y. Park (Xiamen University / WISE) |
| **Outlet** | *Econometric Reviews*, 27(4–6):484–512, 2008 |
| **DOI** | 10.1080/07474930801960394 |
| **JEL** | C15, C44, G11 |
| **Sample** | 8 MSCI country equity indices, USD month-end, **Dec 1969 – Jul 2005** ($T=428$): USA, Canada, Italy, France, Japan, UK, Switzerland, Germany |
| **Themes** | Cross-entropy / maxent portfolio weights; shrinkage toward EQ or MinVar; GCE for shorts; resampled moments; OOS Sharpe & CEQ |
| **Original PDF** | `EntropyPortfolio_Bera_2008.pdf` |
| **Drive file id** | `1OGhQHnw8mwCtNG6qJ6w4plou3HFoq9Ux` |
| **Extraction** | `pdftotext` (~11,245 words); text usable |

---

## Problem / Motivation

Classical Markowitz MV portfolios from sample moments are (i) **concentrated** on a few names (anti-diversification) and (ii) **poor out of sample**. Root cause: estimation error in $\mu,\Sigma$ (Jobson–Korkie 1980). Shrinkage of moments (Frost–Savarino; Jorion 1986; Ledoit–Wolf) helps but requires priors and does not let the manager name an arbitrary **weight target**.

Bera–Park shrink **weights directly** via **Kullback–Leibler / cross-entropy** toward a target portfolio $q$ (e.g., $1/N$ or minimum-variance weights), subject to moment constraints that encode **imprecise** sample means/covariances via resampling confidence intervals.

Advantages claimed:

1. Direct shrinkage of $p$ toward manager-relevant $q$ (cap-weighted, EQ, MinVar, …).
2. ME probabilities $\Rightarrow$ automatic **long-only**; GCE allows shorts with support $[l,u]$.
3. Constraints extract information from noisy $\hat\mu,\hat\Sigma$ without pretending they are exact.

---

## Cross-Entropy Objective

$$
\mathrm{KLIC}(p,q)=\sum_{i=1}^N p_i\ln(p_i/q_i).
$$

Minimizing KLIC s.t. constraints yields $p$ nearest to $q$ in CE. If $q=(1/N,\ldots,1/N)$, this is equivalent (up to sign) to maximizing Shannon entropy—maximum diversification toward EQ.

---

## Constraints from Resampled Moments

Rather than hard $\sum p_i\hat\mu_i=\mu^*$ equality, they form a **confidence interval** for maximized expected utility (or mean-variance utility) via bootstrap/MC, then impose inequality side conditions. The interval width = degree of distrust in sample moments. Quantile parameter $r$ (e.g., 0.1, 0.2, 0.5, 0.8, 0.9) indexes how tightly the CE portfolio is forced toward the MV utility level—**higher $r$** = more faith in sample moments = closer to MV; **lower $r$** = more shrinkage toward $q$.

CE1: $q=$ EQ. CE2: $q=$ MinVar weights. GCE analogues CEs1, CEs2 allow negative weights.

---

## Generalized Cross-Entropy (Section 4)

For shorts, replace point masses with distributions over a support $[l,u]$ for each weight (Golan et al. GCE). Support must be wide enough to nest unconstrained MV weights when desired. GCE recovers CE when support is $[0,1]$ appropriately normalized.

---

## Empirical Design

**Data (Table 1):** Monthly % means ~0.77–1.19; variances ~20–53; correlations—US–Canada 0.73; US–Italy 0.30; Switzerland–Germany 0.69, etc.

**Competitors:** MV, Empirical Bayes (Jorion), Bayes diffuse prior (BDP), MinVar, EQ, Michaud Resampled (RS); with/without shorts (GCE versions marked “s”).

**Scheme:** Rolling windows $W\in\{24,48,60,120\}$; form weights; hold one month; roll. Evaluate **in-sample** and **out-of-sample** Sharpe and CEQ with risk aversion $\eta=0.10$ (also checked 0.07, 0.17, 0.51, 1—qualitatively similar).

$$
\mathrm{CEQ}=p'm-\frac{\eta}{2}p'\Sigma p.
$$

---

## Headline Results (Tables 2–3, $\eta=0.10$)

### Common patterns

1. **In-sample:** MV (and MVs with shorts) dominate SR/CEQ—as expected (optimized on same moments).
2. **Out-of-sample:** MVs often **worst**; EQ beats MVs—classic DeMiguel–Garlappi–Uppal / Jorion lesson.
3. **Short-sale constraints help** MV, EB, MinVar OOS (Frost–Savarino; JM).
4. **CE1/CE2:** in-sample SR/CEQ rise monotonically in $r$ toward MV; nest between $\{EQ,\mathrm{MinVar}\}$ and MV.

### Small window $W=24$ (high estimation error; $W/N=3$)

- EQ OOS competitive; CE1 mid-$r$ strong: e.g. CE1($r=0.5$) OOS CEQ **0.0722** second-best among models.
- CE2 (shrink to MinVar) disappoints OOS when moments are very noisy—EQ is the better target.

### Larger windows $W=60,120$

- Moments more precise $\Rightarrow$ MV OOS improves.
- **CE2** shines: at $W=60$, CE2($r=0.5$) best OOS SR/CEQ; CEQ gap vs EB = $0.3193-0.3024=0.0169$.
- At $W=120$, CE2($r=0.2$) best; gap vs EB shrinks to 0.0052 (less need to shrink).
- Michaud RS good when $W$ small (diversifying); weaker when $W$ large; RSs with shorts ≈ bad MVs.

### Weight stability (Figure 6)

US weights under CE1 much **smoother** than raw MV over the OOS path—lower turnover implication.

---

## Interpretation

| Situation | Preferred CE recipe |
|-----------|---------------------|
| Small $W/N$ (noisy $\Sigma$) | CE1 toward EQ, moderate $r$ |
| Large $W/N$ (stable $\Sigma$) | CE2 toward MinVar, low-to-mid $r$ |
| Need shorts | GCE with wide support; don’t expect OOS miracles from unconstrained MV |

Entropy methods ≈ flexible shrinkage **in weight space**, nesting EQ and MinVar targets without Bayesian predictive densities.

---

## Limitations

- $N=8$ countries—not “vast $p$”; Fan-style gross-exposure theory is the large-$p$ complement.
- Choice of $r$ and resample quantiles is discretionary.
- GCE support $[l,u]$ is another tuning knob.
- Monthly international indices; FX embedded in USD returns.
- CEQ uses fixed $\eta$; no utility of higher moments / drawdowns.

---

## Practical Takeaways

1. **Shrink weights, not only moments**—especially when the PM has a policy benchmark $q$.
2. **Match target $q$ to sample size:** EQ when $W/N$ small; MinVar when covariance is trustworthy.
3. **Use $r$ as a confidence dial** between diversified prior and MV fit; report a grid, not a single point.
4. **Long-only ME is the default** institutional constraint; open GCE only with explicit short budgets.
5. **Monitor weight paths**—CE’s value shows up as stability/turnover, not only SR dots.
6. Pair with Fan et al. gross-exposure if $N$ is hundreds of stocks.

---

## Equation Sheet

$\min_p\sum p_i\ln(p_i/q_i)$ s.t. budget, and resampled utility inequalities indexed by $r$.

Shannon maxent $\Leftrightarrow$ CE with $q=1/N$.

### Methodological note

Numbers are taken from the paper's tables and theorems. Recompute on current data before trading.
