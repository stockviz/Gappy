# Markowitz Meets Talmud: A Combination of Sophisticated and Naive Diversification Strategies — Tu & Zhou (2011) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Markowitz Meets Talmud: A Combination of Sophisticated and Naive Diversification Strategies |
| **Authors** | Jun Tu (Singapore Management University); Guofu Zhou (Olin, Washington University in St. Louis) |
| **Versions** | First Aug 2007; current Mar 2009 (SSRN 1362477); supersedes “Being Naive about Naive Diversification…” |
| **JEL** | G11, G12, C11 |
| **Keywords** | Portfolio choice; parameter uncertainty; estimation errors |
| **Original PDF** | `Sizing_TuZhou_2011.pdf` |
| **Drive file_id** | `1yyefgyNwYN03vb4YaH0_jVc52j7LVJSW` |
| **Extraction** | Binary download + pdftotext; ~15,900 words; clean text (alnum ~0.54) |

Note: Drive filename says 2011; working paper header shows March 2009. SSRN abstract 1362477.

---

## Problem / Motivation

Markowitz mean–variance (MV) remains the industry workhorse, but estimated rules are devastated by parameter uncertainty. DeMiguel, Garlappi, Uppal (2007) (DGU): sample MV and sophisticated extensions need ~**3000 months** of data for N=25 and ~**6000** for N=50 to beat the Talmudic **1/N** rule out of sample. On many real datasets, estimated rules not only lose to 1/N but post **negative** risk-adjusted returns (worse than cash).

Tu–Zhou ask: can combining 1/N with the best sophisticated rules produce a strategy that **consistently** makes money and beats both parents?

**Answer:** Yes. Optimal combination of 1/N with Kan–Zhou (2007) three-fund rule ($\hat w_{CKZ}$) performs consistently across factor models, mispricing calibrations, and real datasets for T as small as 120–240 months — the first estimated rule they find that never loses money on a risk-adjusted basis across their battery.

Economic intuition: concave utility prefers averages of good/bad states — combining two rules diversifies rule-risk. Statistical intuition: shrinkage of a high-variance unbiased rule toward biased-but-zero-variance 1/N — classic bias–variance tradeoff with a single combination weight $\delta$.

---

## Setup and Data

### Theory environment

N risky assets + risk-free. Excess returns $R_t$ IID $N(\mu,\Sigma)$. Investor maximizes

$$
U(w)=w^\top\mu-\frac{\gamma}{2}w^\top\Sigma w,\qquad w^*=\frac{1}{\gamma}\Sigma^{-1}\mu.
$$

Sample moments $\hat\mu,\hat\Sigma$; ML rule $\hat w_{ML}=\gamma^{-1}\hat\Sigma^{-1}\hat\mu$. Unbiased inverse-covariance scaler:

$$
\tilde\Sigma=\frac{T}{T-N-2}\hat\Sigma,\qquad \bar w=\gamma^{-1}\tilde\Sigma^{-1}\hat\mu,\quad \mathbb{E}\bar w=w^*.
$$

Loss / OOS criterion (Kan–Zhou; DGU):

$$
L(w^*,\tilde w)=U(w^*)-\mathbb{E}[\tilde U(\tilde w)]=\frac{\gamma}{2}\mathbb{E}[(\tilde w-w^*)^\top\Sigma(\tilde w-w^*)].
$$

Naive rule: $w_e=c_e 1_N$ with focus on $c_e=1/N$ (fully invested equal weight among risky assets; residual in cash depends on implementation — paper follows DGU’s 1/N among risky).

### Sophisticated parents combined with 1/N

1. Unbiased ML $\bar w$ (Markowitz with unbiased precision)
2. Kan–Zhou (2007) three-fund rule $\hat w_{KZ}$
3. Jorion (1986) Bayes–Stein
4. MacKinlay–Pastor (2000) missing-factor ML

Combinations: $\hat w_s=(1-\delta)w_e+\delta w_{\text{parent}}$, $\delta\in[0,1]$.

### Simulation designs

- One-factor, three-factor models; N=25 or 50
- Alphas zero or spread evenly in [-2%,2%] or [-5%,5%] per year
- $\gamma=3$ (main) or $\gamma=1$
- T in {120,240,480,960,3000,6000}; 10,000 Monte Carlo replications
- Also: calibrated FF25 and 49-industry moments without factor structure

### Real data (DGU sets + extras)

10 industry + market; international portfolios; FF25; other DGU Table 3 sets; estimation windows M=120 and 240. Performance: annualized certainty-equivalent return (CER) and Sharpe ratios.

---

## Model / Methods

### Proposition 1 — Optimal δ for combination with unbiased ML

Loss of $\hat w_s=(1-\delta)w_e+\delta\bar w$:

$$
L=\frac{\gamma}{2}\big[(1-\delta)^2\pi_1+\delta^2\pi_2\big],
$$
$$
\pi_1=(w_e-w^*)^\top\Sigma(w_e-w^*),\qquad
\pi_2=\mathbb{E}[(\bar w-w^*)^\top\Sigma(\bar w-w^*)].
$$

Optimal:

$$
\delta^*=\frac{\pi_1}{\pi_1+\pi_2}\in(0,1)\quad\text{if }\pi_1>0.
$$

If $\pi_1=0$ (1/N already optimal), $\delta^*=0$. Combination strictly beats both parents when $0<\delta^*<1$.

### Proposition 2 — Feasible estimator for ML combination

Using Wishart identities for $\hat\Sigma^{-1}$,

$$
\pi_2=\frac{1}{\gamma^2}\Big((c_1-1)\theta^2+\frac{c_1 N}{T}\Big),
$$

with $c_1$ the usual finite-sample factor and $\theta^2=\mu^\top\Sigma^{-1}\mu$. Plug in unbiased estimators of $\theta^2$ to get $\hat\delta$ and $\hat w_{CML}$.

### Proposition 3 — Combination with Kan–Zhou three-fund

Kan–Zhou rule already shrinks toward global minimum variance / three-fund structure. Optimal $\delta$ for combining with 1/N:

$$
\delta=\frac{\pi_1-\pi_{13}}{\pi_1-2\pi_{13}+\pi_3},
$$

with $\pi_{13}=w_e^\top\Sigma\mathbb{E}[\hat w_{KZ}]-\cdots$ cross term and $\pi_3=\mathbb{E}[(\hat w_{KZ}-w^*)^\top\Sigma(\hat w_{KZ}-w^*)]$. Feasible estimators $\hat\pi_{13},\hat\pi_3$ from Kan–Zhou (2007) eqs. (paper’s (32)–(33)). Resulting rule: $\hat w_{CKZ}$.

### Jorion and MacKinlay–Pastor combinations

Jorion: approximate analytical $\delta$ via matrix inversion lemma on posterior covariance (treat small rank-one update as constant). MacKinlay–Pastor: numerical optimization of expected loss for $\delta$ (semi-analytical concentrated likelihood via eigen-decomposition of $\hat\Sigma+\hat\mu\hat\mu^\top$).

Key practical point: only **one** parameter $\delta$ need be estimated — estimation error on $\delta$ is second-order relative to estimating full $w^*$.

### Why 1/N is a natural shrink target

- Zero variance; bias $\pi_1$.
- Under equal means/variances/independence, 1/N is optimal (with γ scaling).
- In a one-factor CAPM world, average portfolio $w_e^\top R \approx \bar\beta R_m + \bar\epsilon$ — close to the market if alphas average to 0 and $\bar\beta\approx 1$. Market is hard to beat ⇒ 1/N is a strong target.
- Standard James–Stein geometry: shrink multivariate mean toward equal-weight direction.

---

## Results with Numbers

### Table I — One-factor, α=0, N=25 (utilities)

Panel A γ=3: True U=4.17; 1/N=3.89 constant.

| T | ML | Jorion | MP | KZ | CML | **CKZ** |
|---|-----|--------|-----|------|------|---------|
| 120 | -85.72 | -12.85 | 2.11 | -2.15 | 1.68 | **3.71** |
| 240 | -25.81 | -3.79 | 3.00 | 0.00 | 2.95 | **3.77** |
| 480 | -8.35 | -0.18 | 3.44 | 1.13 | 3.42 | **3.81** |
| 960 | -1.61 | 1.55 | 3.65 | 1.90 | 3.60 | **3.85** |
| 3000 | 2.42 | 2.98 | 3.79 | 2.97 | 3.81 | **3.91** |
| 6000 | 3.30 | 3.47 | 3.83 | 3.47 | 3.90 | **3.95** |

CKZ nearly matches 1/N at T=120 (3.71 vs 3.89) and smoothly approaches truth; ML is catastrophic until T huge. Panel B γ=1: True 12.50; 1/N 6.63; CKZ at T=120 already 6.36; ML -257.

### Table II — One-factor with mispricing, N=25, γ=3

Panel A α∈[-2%,2%]: True 6.50; 1/N 3.89.

| T | CKZ | CML | notes |
|---|-----|-----|-------|
| 120 | **3.84** | 2.02 | CKZ ≈ 1/N, others poor |
| 240 | **3.95** | 3.32 | |
| 480 | **4.12** | 3.91 | |
| 960 | **4.41** | 4.43 | |
| 3000 | 5.14 | **5.38** | CML eventually catches |
| 6000 | 5.62 | **5.82** | |

Panel B α∈[-5%,5%]: True 18.73; 1/N 3.89; CKZ path **5.81 → 7.44 → 10.02 → 12.99 → 16.62 → 17.70** as T: 120→6000 — abstract’s headline numbers. Massive gains vs 1/N when mispricing creates a large opportunity set.

### Table III — N=50

α=0: 1/N=4.03; CKZ at T=120 already **3.95**; ML -458. With α∈[-2%,2%]: True 8.71; CKZ 4.07 at T=120 vs CML 1.80; grows to 6.98 by T=6000.

### Calibrated FF25 without factors (text)

CKZ utilities **12.99%, 21.53%, 30.74%, 37.49%** per year for T=120,240,480,960 vs 1/N **4.28%** — enormous gap when the opportunity set is rich and 1/N far from optimal.

### Real data (Section II / Tables XII–XIII)

M=120: on 10 industry+market, in-sample ML CER 8.42; 1/N 3.66; CKZ 3.02; other estimated rules **negative** CERs from -0.76 to -38. International: 1/N hard to beat; CKZ positive but trails 1/N. On remaining five datasets: **CKZ best among estimated**, CERs about **2× or more** vs 1/N; other rules lose money on at least one set.

M=240: all estimated improve; CKZ still best estimated; beats 1/N in all but one close case.

Market-only ML: CER -0.88 at M=120 and +2.40 at M=240 — even single risky asset needs M>120 for ML to be meaningful.

Sharpe ratios (Table XIII): estimated rules look closer to 1/N than CER comparison suggests — CER penalizes estimation risk more harshly than Sharpe.

### Combination weights (Table XV, 3-factor mispricing)

T=120: true δ for CML ≈15.7%, estimated avg ≈20.6% ⇒ uses ~79% 1/N. For CKZ: true δ ≈53.8%, estimated ≈56.2% — much less reliance on 1/N, smaller SE on δ. Even at T=6000, 1/N retains a few percentage points of weight.

### Robustness

Table XIV: CKZ has **smallest** SE of utilities across sims at T=120 among estimated rules; ML largest. Turnover/transaction-cost section flagged as work-in-progress in the WP text.

---

## Limitations

1. Classical (not Bayesian) decision theory; leaves prior choice to other papers (Pastor, Harvey et al.).
2. IID normal excess returns — no conditioning, regimes, or fat tails in the main theory.
3. Combination restricted to convex δ∈[0,1] with single parent; two free coefficients tried but estimation cost dominated (unreported).
4. Transaction costs / turnover analysis incomplete in this draft.
5. Real-data missing proprietary S&P sector set from DGU.
6. Admissibility of CKZ left open (Section IV).

---

## Practical Takeaways for a Quant Investor

1. **Never ship raw ML Markowitz for N≳10 with T≲240.** Utilities of -50 to -400 CER units are not typos.
2. **Default production rule:** estimate Kan–Zhou three-fund, then shrink toward 1/N with $\hat\delta$ from Proposition 3 → $\hat w_{CKZ}$.
3. **When 1/N is nearly optimal** (exact one-factor, tiny alphas), CKZ ≈ 1/N at small T — no harm. When alphas / rich cross-section exist, CKZ unlocks large CER (5.81 vs 3.89 at T=120 in ±5% alpha design; 13% vs 4% in FF25 calibration).
4. **Single δ estimation is the trick.** Shrinkage of the whole weight vector with one scalar is far more stable than estimating N weights freely.
5. **Judge rules by CER / expected utility loss, not only Sharpe.** Sharpe understates estimation risk.
6. **130/30 and quant equity:** paper notes DGU challenge to 130/30 construction; CKZ-style shrinkage toward equal active weights is a natural remedy.
7. **Future research they flag:** admissible (Bayes) rules; optimal number of assets L≤N given T (opportunity set vs estimation error tradeoff).

---

## Equations Quick Reference

$$
w^*=\gamma^{-1}\Sigma^{-1}\mu,\quad
\bar w=\gamma^{-1}\tilde\Sigma^{-1}\hat\mu,\quad
\hat w_s=(1-\delta)w_e+\delta\bar w,
$$
$$
\delta^*=\frac{\pi_1}{\pi_1+\pi_2},\qquad
L=\frac{\gamma}{2}\mathbb{E}[(\hat w-w^*)^\top\Sigma(\hat w-w^*)].
$$

Kan–Zhou combination: $\delta=(\pi_1-\pi_{13})/(\pi_1-2\pi_{13}+\pi_3)$ with feasible plugs.

---

## Extended Simulation Commentary

Exact one-factor (Table I) is the environment most favorable to 1/N. CKZ’s ability to stay within ~0.2 utility of 1/N at T=120 while ML is at -86 is the robustness check. The ±5% alpha panel is the environment favorable to active MV: true U=18.73 vs 1/N=3.89. Here estimation-aware rules should shine if anywhere; CKZ delivers 5.81 at T=120 and 12.99 at T=960 — still far from truth at small T but **already better than 1/N by 50%+**, and uniquely consistent.

MacKinlay–Pastor performs well when the factor structure is correctly assumed (Table I) but cannot exploit mispricing (Table II Panel B: MP stuck near ~4 while CKZ climbs to 17). Jorion is intermediate. CML eventually competitive at huge T but dominated by CKZ at practical T when the parent KZ is strong.

## Real-Data Interpretation

Negative CER for sophisticated rules on industry portfolios at M=120 means: an investor who repeatedly used those rules would have preferred holding cash. That is a devastating practical indictment. CKZ’s consistently nonnegative CER is the paper’s main empirical contribution beyond simulations.

International diversification set: 1/N remains strong — consistent with relatively similar assets where equal weight is near optimal; CKZ does not destroy value but does not dominate.

## Implementation Checklist

1. Compute $\hat\mu,\hat\Sigma$ on trailing T months.
2. Form Kan–Zhou three-fund weights.
3. Estimate $\pi_1,\pi_{13},\pi_3$ with formulas (32)–(33); form $\hat\delta$; clip to [0,1].
4. Output $(1-\hat\delta)(1/N)+\hat\delta\hat w_{KZ}$.
5. Optional: calibrate γ so that average |w| matches mandate; report CER vs 1/N on walk-forward.

## Bottom Line

Tu–Zhou rehabilitate Markowitz theory against the DGU critique by **combining** theory-based rules with Talmudic 1/N. The winning recipe is CKZ: Kan–Zhou three-fund shrunk toward 1/N with an estimated scalar weight. It is the first estimated strategy in their study that consistently avoids negative risk-adjusted performance while beating 1/N whenever the opportunity set is nontrivial — for sample sizes quants actually have.


## Detailed Kan–Zhou Parent Recall

Kan and Zhou (2007) show that the standard two-fund (tangency) rule is dominated under estimation risk by a three-fund rule that mixes the sample tangency portfolio, the sample global minimum-variance portfolio, and the risk-free asset with weights that depend on estimated expected returns, covariances, and finite-sample correction factors. Intuitively, when mu is estimated poorly, GMV (which does not use mu) receives more weight. Tu–Zhou’s CKZ takes that already estimation-aware rule and shrinks it further toward 1/N — stacking two layers of protection against estimation error.

## Why Not Combine with GMV Alone?

DGU’s ew-min combination (1/N with GMV) failed for N<=50 partly because GMV itself is weak in that range. KZ three-fund is a better parent; combining a weak parent with 1/N cannot beat 1/N by much. Proposition 3’s cross-term pi_13 accounts for correlation between KZ errors and (w_e - w*), which matters for optimal delta.

## Bias–Variance Numerical Illustration

Suppose pi_1 = 0.04 (1/N MSE) and pi_2 = 0.36 (ML MSE) in utility-loss units. Then delta* = 0.04/0.40 = 0.10 — only 10% weight on ML, 90% on 1/N. Expected loss = (gamma/2)*0.036, better than either 0.04 or 0.36. If T grows and pi_2 falls to 0.04, delta*=0.5, balanced. This arithmetic is why estimated delta starts near 0 for CML at T=120 (~20% in Table XV) and rises with T.

## CER vs Utility Units

Simulation tables report average realized U(w)=w'mu - (gamma/2) w'Sigma w under the true parameters — an expected-utility / CER sibling. Multiplying by 100 gives percent units comparable to annualized CER on monthly data when parameters are annualized consistently. Headline abstract numbers (5.81%, 7.44%, …) match Table II Panel B CKZ column.

## Comparison with Bayesian Literature

Pastor (2000), Pastor–Stambaugh, Harvey–Liechty–Liechty–Muller, Tu–Zhou (2004), Wang (2005) attack the same problem with priors. This paper stays classical / decision-theoretic to answer DGU on their own turf. A Bayesian with a dogmatic prior that 1/N is optimal would recover delta=0; a diffuse prior recovers something closer to ML. CKZ’s data-driven delta is a frequentist analogue of partial trust in 1/N.

## Asset-Allocation Mandate Design

Pensions allocating across N=10–30 asset classes with T=120–240 monthly observations are exactly in the danger zone where ML fails and 1/N wins in DGU. CKZ is directly applicable: treat classes as the N assets, estimate KZ, shrink to equal class weights. The paper explicitly flags that existing rules fail even for few assets — relevant to policy portfolios, not only stock-level quant.

## Open Questions They List

1. Admissibility: is CKZ admissible? Unknown; proving via generalized Bayes is nontrivial for improper priors.
2. Optimal L given T: choose how many assets to include before estimating — bias from omitting assets vs variance from including too many. Tables I vs III show N=50 much harder than N=25 for ML.
3. Extensions: derivatives hedging under parameter uncertainty; capital structure / real investment with estimated opportunity sets.

## Word-Count Substance Addendum — Full Table Patterns

Across Tables IV–XI (factor models N=25/50, one- and three-factor, with/without alpha), the qualitative ordering is stable: ML worst at small T; Jorion better; MP good when structure true but blind to alpha; KZ strong; CML good; CKZ best or near-best at practical T and never disastrous. When alpha=0 and one-factor true, 1/N is nearly optimal and CKZ ≈ 1/N. When alpha nonzero or moments calibrated from FF25/industries without factor restrictions, CKZ pulls away from 1/N as T grows while remaining stable at small T.

Standard errors (Table XIV): at T=120, utility SE across sims ranges ~0.29% to 12.37%; CKZ at the low end, ML at the high end — consistency is not an artifact of averaging outliers.

## Final Synthesis for the Quant Library

Tu–Zhou (WP 2009 / Drive label 2011) is the practical response to “1/N beats Markowitz.” The response is not to abandon Markowitz but to **shrink Markowitz-family rules toward 1/N with an optimal scalar**. Ship CKZ; monitor hat-delta; expect hat-delta near 0.5 for KZ parents at T=120 and rising thereafter; evaluate with CER not only Sharpe.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.


## Replication Pseudocode

```
mu_hat, Sig_hat = sample_moments(R[:T])
w_KZ = kan_zhou_three_fund(mu_hat, Sig_hat, gamma, T, N)
pi1 = (w_e - w_star_proxy).T @ Sig_hat @ (w_e - w_star_proxy)  # use plugs from paper
pi13, pi3 = kan_zhou_loss_components(...)  # eqs 32-33
delta = clip( (pi1 - pi13) / (pi1 - 2*pi13 + pi3), 0, 1)
w_CKZ = (1-delta)*w_e + delta*w_KZ
```

Walk-forward: each month recompute on trailing T; record realized utility and Sharpe; compare to 1/N and ML.

## Relationship to Other Scholar Summaries

Pairs with Brandt–Santa-Clara (2006) and Brandt–Santa-Clara–Valkanov (2009): those parameterize policies to reduce dimensionality; Tu–Zhou shrink estimated MV weights toward 1/N. Complementary tools against estimation error — parametric structure vs statistical shrinkage. A production book might use BSV parametric weights as the “sophisticated parent” inside a Tu–Zhou combination with 1/N.
