# Optimal Orthogonal Portfolios with Conditioning Information — Ferson & Siegel (2015) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Optimal Orthogonal Portfolios with Conditioning Information |
| **Authors** | Wayne E. Ferson (USC Marshall); Andrew F. Siegel (University of Washington) |
| **Outlet** | *Handbook of Financial Econometrics and Statistics* (Lee & Lee, eds.), Springer, 2015, Ch. 35, pp. 977–1001 |
| **DOI** | 10.1007/978-1-4614-7750-1_35 |
| **Sample (empirical)** | Annual returns **1931–2007**; Ken French size/BTM deciles (small, value, growth VW); Ibbotson/CRSP long government bond; CRSP VW market; Shiller P/D; CRSP T-bill |
| **Themes** | Optimal orthogonal / active portfolio; Hansen–Richard efficiency w.r.t. information; Sharpe-ratio conservation; conditioning instruments |
| **Original PDF** | `OptimalOrthogonalPortfolio_FersonSiegel_2015.pdf` |
| **Drive file id** | `14lb8OsxAHtGJwk_neErPzcaXqDyWitRs` |
| **Extraction** | `pdftotext` (~12,479 words); text usable |

---

## Problem / Motivation

The **optimal orthogonal portfolio** (also: most mispriced portfolio, active portfolio) is the portfolio that, relative to a benchmark $R_p$, maximizes squared alpha per unit of variance. Classically (Roll 1980; Jobson–Korkie 1982; Gibbons–Ross–Shanken 1989; MacKinlay 1995), with **fixed** weights and no conditioning information:

$$
x_c=\arg\max_x\frac{(x'a)^2}{\mathrm{Var}(x'r)},\qquad x_c\propto V^{-1}a,
$$

and $R_c$ is uncorrelated with $R_p$. A combination of $R_c$ and $R_p$ is mean-variance efficient. GRS/Wald tests of $a=0$ rewrite as comparisons of squared Sharpe ratios:

$$
W=T\hat a'[\widehat{\mathrm{Cov}}(\hat a)]^{-1}\hat a=T\frac{\hat S^2(R)-\hat S^2(R_p)}{1+\hat S^2(R_p)}.
$$

**Law of conservation of squared Sharpes (classical):** $S^2(R)=S^2(R_p)+S^2(R_c)$.

Modern asset pricing and quant PM practice use **lagged instruments** $Z_t$ (rates, yields, valuations). Portfolio weights become functions $x(Z_t)$. Ferson–Siegel ask: what is the orthogonal/active portfolio when efficiency is defined **with respect to information $Z$** in the Hansen–Richard (1987) sense—i.e., maximizing **unconditional** mean given unconditional variance among strategies that use $Z$?

This is the right object when a client **cannot see** $Z$ but wants unconditional MV efficiency, while the manager **can** see $Z$ (Ferson–Siegel 2001). Conditionally efficient policies can look unconditionally inefficient to the client (Dybvig–Ross 1985).

---

## Classical Case (Section 35.2) — Quick Recap

Regression: $r_t=a+b r_{pt}+u_t$. Efficiency of $r_p$ (with given zero-beta) iff $a=0$. Most mispriced portfolio maximizes $(x'a)^2/\mathrm{Var}(x'r)$. Properties: orthogonality $\mathrm{Cov}(x_c'r,r_p)=0$; Sharpe additivity; geometric interpretation of GRS as distance from frontier.

---

## Conditional Setting (Section 35.3)

Assets $R_{t+1}$, instruments $Z_t$. Portfolio $x(Z_t)'R_{t+1}$ with $x(Z)'1=1$ a.s. (when no RF). The Hansen–Richard frontier is the unconditional mean–SD frontier of all such managed portfolios. Proposition 1 (HR Corollary 3.1): $R_p$ is minimum-variance efficient w.r.t. $Z$ iff for all admissible $x(Z)$,

$$
\mathrm{Var}(R_p)\le\mathrm{Var}(x(Z)'R)\quad\text{whenever}\quad\mathbb{E}[R_p]=\mathbb{E}[x(Z)'R],
$$

equivalently $\mathbb{E}[x'R]=g_0+g_1\mathrm{Cov}(x'R,R_p)$ for constants $g_0,g_1$.

Ferson–Siegel (2001) gave closed forms for efficient-w.r.t.- $Z$ weights with no RF and with **constant** RF. This chapter **adds** the case of a **conditionally risk-free** rate $R_f(Z)$ known at $t$ (in $Z$) but unconditionally risky.

---

## Main Results (Section 35.4)

**Definition.** Optimal orthogonal portfolio $R_c$ w.r.t. benchmark $R_p$ and info $Z$ maximizes $a_c^2/s_c^2$ where

$$
a_c=m_c-\bigl[g_0+(m_p-g_0)s_{cp}/s_p^2\bigr]
$$

is the unconditional alpha vs $R_p$ at zero-beta $g_0$.

**Proposition 2 (weights).** Closed forms in three cases:

1. **No RF:** weights sum to 1 conditionally; involve $L(Z)=[m(Z)m(Z)'+\Sigma_e(Z)]^{-1}$ and constants $a,b,c$ from FS frontier algebra; form

$$
x_c(Z)=A\cdot(\cdots)+B x_p.
$$

2. **Conditional or constant RF:**

$$
x_c(Z)=A\bigl[(c+1)m_s+b-R_f\bigr]Q\bigl(m(Z)-R_f 1\bigr)+B x_p,
$$

with

$$
Q=\bigl[(m(Z)-R_f1)(m(Z)-R_f1)'+\Sigma_e(Z)\bigr]^{-1},
$$

$$
A=\frac{(m_s-g_0)/s_s^2}{(m_s-g_0)/s_s^2-(m_p-g_0)/s_p^2},\quad
B=1-A\text{ (up to sign convention in text)}.
$$

**Proposition 3.** $R_c$ is a **fixed** linear combination of the efficient-w.r.t.- $Z$ portfolio $R_s$ and the benchmark $R_p$:

$$
R_c=\frac{s_p^2 R_s-s_{ps}R_p}{s_p^2-s_{ps}}=A R_s+B R_p,\quad A+B=1.
$$

Thus $R_c$ is the normalized residual from projecting $R_s$ on $R_p$—hence orthogonal to $R_p$. Active management interpretation: tilt from $x_p$ toward $x_s(Z)$ using dynamic $x_c(Z)$.

**Proposition 4 — Law of conservation of squared Sharpes (with $Z$):**

$$
S_s^2=S_p^2+S_c^2.
$$

Therefore FS (2009)-style tests of efficiency w.r.t. $Z$ have the same Sharpe-gap interpretation as classical GRS: the numerator is the orthogonal portfolio’s squared Sharpe.

---

## Empirical Examples (Section 35.5)

**Assets:** VW small, value, growth (French); long government bond; market = CRSP VW. **RF:** 1-month T-bill; sample average **3.8%/yr** used as fixed $g_0$. **$Z$:** lagged T-bill return (1-year lag) and log Shiller P/D. **Returns:** discrete annual, **1931–2007**.

Three implementations:

| Case | RF treatment | Instruments |
|------|--------------|-------------|
| Fixed RF | Constant $g_0=3.8\%$; no T-bill in $Z$; target $m_s=$ market mean | Lagged P/D only |
| No RF | No cash holding; $g_0=3.8\%$ picks frontier point | Lagged T-bill + P/D |
| Varying RF | Trade subsequent T-bill as if conditionally RF (corr with lag = 0.92) | Lagged T-bill + P/D |

### Table 35.1 Panel A — Headline numbers

| Asset / portfolio | CAPM $\alpha$ (%/yr) | $\sigma_u$ | Info ratio $a/\sigma_u$ | Avg weight in Fixed $R_c$ | Avg $x_c$ Fixed RF | Avg $x_c$ No RF | Avg $x_c$ Varying RF |
|-------------------|------------------------|--------------|-------------------------|----------------------------|---------------------|------------------|------------------------|
| Market | 0 | 0 | 0 | −1.260 | 0.179 | −0.210 | 0.308 |
| Small | 3.95 | 25.5 | 0.155 | 0.353 | −0.262 | 0.133 | 0.097 |
| Value | 3.14 | 17.8 | 0.177 | 0.345 | 0.137 | 0.079 | 0.142 |
| Growth | −1.00 | 8.3 | −0.121 | 0.155 | 0.028 | 0.098 | 0.020 |
| Bonds | 1.66 | 9.1 | 0.183 | 1.410 | 0.918 | 0.900 | 0.432 |
| Fixed $R_c$ | **4.66** | **16.5** | **0.282** | 1.000 | | | |
| $x_c(Z)$ Fixed RF | **8.66** | 25.5 | **0.340** | | | | |
| $x_c(Z)$ No RF | 3.12 | 10.5 | **0.297** | | | | |
| $x_c(Z)$ Varying RF | **8.77** | **9.2** | **0.955** | | | | |

**Messages:**

- Fixed-weight active IR 0.282 already beats any single sleeve.
- Conditioning without cash helps modestly (IR 0.297–0.340).
- **Time-varying cash (market timing)** jumps IR to **0.955**—~3× fixed-weight.
- All active solutions **tilt hard into bonds** (avg weight 43–141%).
- Fixed $R_c$ shorts the market −126%; dynamic no-RF shorts only −21% on average—more implementable.
- Growth gets small **positive** weight despite negative CAPM alpha (correlation structure).

### Combination weights into efficient $R_s$

- Fixed RF: $x_s=0.60 x_c+0.40 x_p$
- No RF: $x_s=0.23 x_c+0.77 x_p$
- Varying RF: $x_s=0.44 x_c+0.56 x_p$

### Table 35.1 Panel B — Squared Sharpes

| | $S^2(R_p)$ | $S^2(R_c)$ | Sum |
|--|--------------|--------------|-----|
| Fixed $R_c$ | 0.189 | 0.079 | 0.267 |
| Fixed RF + $Z$ | 0.189 | 0.115 | 0.304 |
| No RF + $Z$ | 0.189 | 0.088 | 0.277 |
| Varying RF + $Z$ | 0.182 | **0.909** | **1.191** |

Market squared Sharpe ~0.19; with timing, orthogonal portfolio squared Sharpe **0.909** dominates—graphically, the tested market is far inside the Hansen–Richard frontier when cash timing is allowed.

### Weight paths (Figs. 35.1–35.2)

No-RF and varying-RF $x_c(Z)$ weights vary **smoothly** over 1931–2007 (tradable). Fixed-RF (P/D only) weights are noisy—authors omit the plot. From mid-1990s, no-RF market weight in $x_c$ falls toward −50%, implying overall efficient portfolio market weight $\approx 0.23(-0.50)+0.77\approx 66\%$.

---

## Methodology Notes (Appendix 2)

Parametric bootstrap for inference on nonlinear functions of ML estimates: evaluate functions at ML parameters; bootstrap from fitted conditional moments. Regression + ML + GMM all appear. Analytical results also interpret Wald / multivariate $F$ tests in asset-pricing research.

---

## Conclusions

1. Optimal orthogonal portfolios **extend** cleanly to Hansen–Richard efficiency with $Z$.
2. Weights are dynamic closed forms; $R_c$ remains the residual of $R_s$ on $R_p$.
3. Squared-Sharpe conservation survives—foundation for conditional efficiency tests.
4. Empirically, a standard stock index is **far from efficient** when portfolios may trade on lagged rates and dividend yields; **bond tilts** and especially **cash timing** drive the inefficiency gap.
5. Dynamic orthogonal portfolios achieve higher IRs with **less extreme average weights** than fixed-weight $R_c$.

---

## Limitations

- Annual frequency; weak power for some predictors; P/D alone is weak (matches noisy fixed-RF weights).
- “Conditional RF” proxies next year’s T-bill with lag (corr 0.92)—not truly risk-free under inflation.
- No transaction costs, short-sale fees, or leverage limits in the empirical IR.
- In-sample conditional moments; real-time estimation error would shrink the 0.955 IR.
- Handbook chapter: empirical example is illustrative, not a horse race of all predictors.

---

## Practical Takeaways for a Quant Investor

1. **Active portfolio = residual of your information-efficient portfolio on the benchmark.** Build $R_s(Z)$ first; $R_c$ is mechanical.
2. **Report $S_c^2$** as the economic distance from efficiency—friendlier than raw GRS.
3. **Cash timing dominates security selection** in this annual example (IR 0.955 vs ~0.3). If your “alpha” is mostly rate timing, label it honestly.
4. **Bond overlays** are first-order when the zero-beta is a T-bill average and equities are the tested benchmark.
5. **Prefer dynamic $x_c(Z)$ over static $V^{-1}a$** for implementability (milder average weights, smoother paths when instruments have signal).
6. **Client vs manager information asymmetry** is the conceptual justification for optimizing unconditional moments with $Z$—aligns PM incentives with what the client can verify.

---

## Equation Sheet

Classical: $x_c\propto V^{-1}a$, $S^2(R)=S^2(R_p)+S^2(R_c)$.

With $Z$: $R_c=A R_s+B R_p$, $S_s^2=S_p^2+S_c^2$.

IR: $a/\sigma_u$; for orthogonal portfolios $\sigma_u=\sigma_{\mathrm{total}}$.

### Methodological note

The quantitative content above is drawn from the paper's equations, tables, and stated calibrations. Where figures are described without exact digitized coordinates, magnitudes are taken from the authors' prose annotations (e.g., 'about 11% of wealth'). For implementation, recompute closed forms rather than reading numbers off plots.
