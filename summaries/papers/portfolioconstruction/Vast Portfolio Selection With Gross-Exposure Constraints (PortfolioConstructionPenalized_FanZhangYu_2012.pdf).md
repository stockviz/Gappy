# Vast Portfolio Selection With Gross-Exposure Constraints — Fan, Zhang & Yu (2012) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Vast Portfolio Selection With Gross-Exposure Constraints |
| **Authors** | Jianqing Fan (Princeton); Jingjin Zhang (McKinsey); Ke Yu (JPMorgan) |
| **Outlet** | *Journal of the American Statistical Association*, June 2012, Vol. 107, No. 498, Theory and Methods, pp. 592–606 |
| **DOI** | 10.1080/01621459.2012.682825 |
| **Funding** | NSF DMS-070433; NIH R01-GM072611 |
| **Empirical** | 100 Fama–French industrial portfolios; 600 stocks from Russell 3000; daily returns; also RiskMetrics EWMA |
| **Themes** | Gross-exposure ($\ell_1$) constraints; error accumulation; Jagannathan–Ma theory; LARS-LASSO path; portfolio tracking |
| **Original PDF** | `PortfolioConstructionPenalized_FanZhangYu_2012.pdf` |
| **Drive file id** | `1Y5-wLsI-bDAM4AcBV8xQY3AUSZMfSZAx` |
| **Extraction** | `pdftotext` (~11,784 words); text usable |

---

## Problem / Motivation

Markowitz MV portfolios are notoriously sensitive to estimation error in $\mu$ and $\Sigma$, especially when $p$ is large. With $p=2000$, $\Sigma$ has >2e6 parameters; with $n\le 400$, elementwise errors $\sim n^{-1/2}$ **accumulate** across the allocation. Empirical MV positions become extreme and out-of-sample risk blows up.

Prior fixes: Stein/Bayes shrinkers for means (Chopra–Ziemba); covariance shrinkers (Ledoit–Wolf); factor covariances (Fan–Fan–Lv); robust optimization (Goldfarb–Iyengar). Jagannathan–Ma (2003) showed that a **wrong** no-short-sale constraint can **help** empirically by regularizing. Fan–Zhang–Yu provide the **theoretical** reason: with a gross-exposure bound $\|w\|_1\le c$, utility/risk errors are controlled by $\|\hat\Sigma-\Sigma\|_\infty$ times $c^2$—**no accumulation in $p$** beyond log factors.

As $c$ goes from 1 (no short) to $\infty$ (unconstrained), the problem nests JM and classical Markowitz. Moderate $c>1$ improves on pure no-short by allowing **some** shorts while keeping error control.

---

## Model: Gross-Exposure Utility / Risk Optimization

$$
\max_w \mathbb{E}[U(w'R)]\quad\text{s.t.}\quad w'1=1,\ \|w\|_1\le c,\ Aw=a.
$$

Long/short splits: $w^+=( \|w\|_1+1)/2$, $w^-=(\|w\|_1-1)/2$. For CARA-normal, equivalent to

$$
\max_w\ w'\mu-\lambda w'\Sigma w.
$$

**Error bound (utility):**

$$
\bigl|M(\hat\mu,\hat\Sigma)-M(\mu,\Sigma)\bigr|\le \|\hat\mu-\mu\|_\infty\|w\|_1+\lambda\|\hat\Sigma-\Sigma\|_\infty\|w\|_1^2.
$$

**Risk minimization focus** (means hard to estimate):

$$
\min_{w'1=1,\ \|w\|_1\le c} w'\Sigma w.
$$

With $\|w\|_1=1$ (no short), $|R(w,\hat\Sigma)-R(w,\Sigma)|\le\|\hat\Sigma-\Sigma\|_\infty$—JM’s mathematics.

---

## Theory

**Theorem 1.** Let $a_n=\|\hat\Sigma-\Sigma\|_\infty$, $w_{\mathrm{opt}}$ theoretical optimal, $\hat w_{\mathrm{opt}}$ empirical optimal under the same $c$. Then

$$
|R(w_{\mathrm{opt}})-R_n(\hat w_{\mathrm{opt}})|\le a_n c^2,\quad
|R(\hat w_{\mathrm{opt}})-R_n(\hat w_{\mathrm{opt}})|\le a_n c^2,\quad
|R(\hat w_{\mathrm{opt}})-R(w_{\mathrm{opt}})|\le 2a_n c^2,
$$

and $\mathbb{E}[R_n(\hat w_{\mathrm{opt}})]\le R(w_{\mathrm{opt}})\le R(\hat w_{\mathrm{opt}})$.

**Oracle ≈ actual risk** when $c$ moderate and $\hat\Sigma$ not terrible—**without** assumptions on $\hat\Sigma$ beyond the max-norm error.

**Theorem 2.** Under mild conditions, $\|S_n-\Sigma\|_\infty=O_p(\sqrt{(\log p)/n})$. Portfolio size enters only **logarithmically**.

**Theorem 3.** Elementwise sub-exponential tails $\Rightarrow$ $\|\hat\Sigma-\Sigma\|_\infty=O_p((\log p)^a/\sqrt n)$.

**Theorem 4 (equivalence to covariance regularization).** Constrained problem $\Leftrightarrow$ unconstrained MV on

$$
\tilde\Sigma_c=\hat\Sigma+\lambda_1(\tilde g 1'+1\tilde g'),
$$

the JM-style interpretation: $\ell_1$ constraint = covariance shrinkage along the subgradient of $\|w\|_1$.

---

## Choosing $c$

Data-driven risk profile: train on $n-m$, evaluate

$$
R(c;n-m,m)=m^{-1}\sum_{t=n-m+1}^n (\hat w_c'R_t)^2,
$$

optionally average over $K$ blocks (Fan–Yao). Pick $c$ minimizing estimated OOS risk.

---

## Link to Regression / LARS-LASSO (Section 3)

Risk minimization $\Leftrightarrow$ regression: set $Y=R_p$, $X_j=R_p-R_j$, then

$$
\mathrm{Var}(w'R)=\min_b\mathbb{E}(Y-w^{*'}X-b)^2.
$$

Gross-exposure on $w$ ≈ $\ell_1$ bound on $w^*$. LARS-LASSO delivers the **entire path** $w^*(d)$. Approximate path for (2.6): solve no-short ($c=1$) as $Y$, then LARS; map $c=d+|1-1'w^*(d)|$. Figure 1: approximate path tracks exact QP closely; stock count rises with $c$; empirical vs actual risk diverge when $c$ large / $n$ small.

**Tracking:** $Y$ = index to track; path trades off tracking error, #names, and short percentage.

---

## Simulations (Section 4)

Fama–French 3-factor calibrated economy (Table 1 factor moments); idiosyncratic $t_6$ noise; $p$ large; $n=252$ or $756$.

**Findings:**

- No-short optimal is **not diversified enough**; risk falls sharply as $c$ rises from 1 toward ~2, then flattens.
- Example prose: at $c=2$ (~18 stocks in one design), risk drops from ~8.1% to ~4.9%.
- With sample cov and loose $c$, empirical risk << actual risk (overfitting).
- Factor-cov estimator keeps actual and empirical risks aligned farther out on $c$.
- Portfolio **improvement** of a 200-name equal-weight book via (3.3): modifying a few weights (LARS) cuts risk notably; factor cov needs fewer modifications than sample cov for same risk cut.

Unconstrained Markowitz with $n=252$, $p=200$ can show **zero empirical risk** (singular fits) while true risk remains large—gross exposure prevents this fantasy.

---

## Empirical Study (Section 5)

### 5.1 Fama–French 100 industrial portfolios

Daily returns; estimate $\Sigma$ by (i) sample cov, (ii) FF3 factor, (iii) RiskMetrics $\lambda=0.97$, using prior 12 months. Table 2 (representative rows from text):

| Strategy | Return | Risk | Sharpe-like | notes |
|----------|--------|------|-------------|-------|
| Exact $c=2$ | ~20.55 | 7.56 | 2.28 | ~15 long / 12 short names (one panel) |
| Approx $c=2$, $Y=$NS | ~21.16 | 7.89 | 2.26 | close to exact |
| Equal weight | 10.86 | 16.33 | 0.46 | 100 names |
| No-short | lower diversification | — | — | picks ~6 assets—too concentrated |

Sharpe ratios **peak near $c\approx 2.5$**. CRSP VW underperforms optimized constrained portfolios on this industrial set in the authors’ windows. Beyond moderate $c$, sample-cov and RiskMetrics risks deteriorate; factor model more stable.

### 5.2 Russell 3000 subsample (600 stocks)

Jan 2 onward study window (paper: Russell constituents). Table 3 style results:

| $c$ | Risk metric (as reported) | #long | #short |
|-------|---------------------------|-------|--------|
| 2 | 8.20 | 123 | 67 |
| 6 | 10.51 | 242 | 201 |
| 8 | 12.20 | 267 | 235 |
| No short | 9.08 | 54 | 0 |

Loose $c$ again hurts when $\Sigma$ is hard to estimate at $p=600$. Optimal no-short uses only ~54 names; $c=2$ (50% short notional in the $w^-=(c-1)/2$ sense) improves risk vs no-short in several estimators—echoing JM but with a **controlled** short budget.

---

## Conclusions

Gross-exposure constraints are a **practical continuum** between no-short and unconstrained MV. Theory: risk/utility error $\le O(a_n c^2)$ with $a_n\sim\sqrt{(\log p)/n}$. Practice: pick moderate $c$ (often ~2–3) by OOS risk profiles; use LARS path for tracking and approximate solutions; prefer factor cov when $p/n$ large. No-short helps but is not enough—**some** shorting, tightly budgeted, improves risk.

---

## Limitations

- Risk-only focus sidesteps $\mu$ estimation—appropriate for risk desks, incomplete for total-return mandates.
- $c$ still a tuning parameter; data-driven choice needs enough OOS blocks.
- LARS approximation depends on choice of $Y$.
- Empirical windows and 600-stock random subset may not generalize to all regimes.
- No explicit transaction costs in optimization (turnover rises with $c$ and re-estimation frequency).

---

## Practical Takeaways

1. **Never run unconstrained MV at $p\gtrsim n$.** Use $\|w\|_1\le c$ with $c\sim 2$–3 as default.
2. **JM no-short is a boundary point**, not the optimum; allowing ~50% short notional ($c=2$) often cuts risk and raises Sharpe.
3. **Monitor $c\mapsto$ OOS risk** each rebalance; stop where the curve flattens or rises.
4. **Factor or shrink $\Sigma$** if you must push $c$ higher.
5. **LARS path = multi-use tool:** risk min, index tracking, and portfolio improvement from a legacy book.
6. **Report gross exposure** $c$ alongside volatility—governance-friendly.

---

## Equation Sheet

$\min w'\Sigma w$ s.t. $w'1=1$, $\|w\|_1\le c$.

Error: $|R(\hat w)-R(w_{\mathrm{opt}})|\le 2\|\hat\Sigma-\Sigma\|_\infty c^2$.

Regularized cov: $\tilde\Sigma=\hat\Sigma+\lambda(g1'+1g')$.

### Methodological note

Numbers are taken from the paper's tables and theorems. Recompute on current data before trading.
