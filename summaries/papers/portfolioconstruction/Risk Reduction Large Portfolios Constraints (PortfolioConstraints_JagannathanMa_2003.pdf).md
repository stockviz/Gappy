# Risk Reduction in Large Portfolios: Why Imposing the Wrong Constraints Helps

**Authors:** Ravi Jagannathan (Kellogg / NBER) and Tongshu Ma (University of Utah)  
**Publication:** *The Journal of Finance*, Vol. LVIII, No. 4, August 2003, pp. 1651–1683  
**Source PDF:** `PortfolioConstraints_JagannathanMa_2003.pdf`  
**Summary prepared:** 2026-09-23 (Scholar batch_2026-09-23_1)  
**OCR:** Not required; clean `pdftotext -layout` extract (~15,118 words of source)

---

## 1. Problem and Motivation

Mean–variance optimization with sample moments routinely produces portfolios with extreme positive and negative weights. Practitioners therefore impose nonnegativity (no short sales) and often upper bounds on positions. Green and Hollifield (1992) argue that such extreme weights are *not* merely estimation artifacts: when a single factor dominates the covariance structure, the global minimum-variance (GMV) portfolio is constructed by (i) forming well-diversified high-beta and low-beta portfolios and (ii) going long the low-beta portfolio and short the high-beta portfolio to cancel systematic risk. If betas are tightly clustered, step (ii) requires enormous long–short positions *even in population*. Under that logic, no-short-sale constraints are *wrong* in population and should *hurt* efficiency.

Empirically, however, constrained portfolios often *outperform* unconstrained ones out of sample (Frost–Savarino 1988 and others). Jagannathan and Ma reconcile the contradiction. Their key insight: each binding no-short-sale constraint is *equivalent* to reducing the corresponding asset’s estimated covariances with other assets by a Lagrange-multiplier adjustment. Stocks that would receive negative weights are precisely those with high estimated covariances; those high estimates are disproportionately likely to be upward-biased sampling error. The constraint therefore acts as a *shrinkage* operator on the covariance matrix. By the logic of shrinkage estimation, constraints can help even when they are misspecified in population—provided sampling error dominates specification error.

Analogously, upper-bound constraints are equivalent to *increasing* covariances of assets that would otherwise receive extreme positive weights (those with suspiciously low estimated covariances). The paper’s punchline for practitioners: once nonnegativity is imposed, the plain **sample covariance matrix** performs about as well out of sample as factor-model, shrinkage, and daily-data covariance estimators. Sophisticated covariance technology and crude constraints are substitutes, not complements.

---

## 2. Setup and Data

### 2.1 Why focus on global minimum variance?

Sample means are so noisy that tangency portfolios estimated from historical average returns perform poorly out of sample (Jobson–Korkie, Jorion, Michaud, Best–Grauer, Black–Litterman). The GMV portfolio,

$$
\min_w \; w'\Sigma w \quad\text{s.t.}\quad \mathbf{1}'w=1,
$$

avoids using mean estimates entirely and often matches or beats tangency portfolios on out-of-sample Sharpe ratio. The paper therefore centers on GMV (and minimum tracking-error) portfolios, with a secondary look at tangency portfolios.

### 2.2 Covariance estimators compared

1. **Sample covariance** (monthly returns).
2. **One-factor (Sharpe 1963) market model.**
3. **Fama–French three-factor** residual covariance (diagonal or structured).
4. **Ledoit shrinkage** toward a single-index target (Ledoit 1996, 1999).
5. **Daily-return sample covariance**, with and without microstructure corrections.

For each estimator, the authors form both unconstrained and nonnegativity-constrained (and sometimes upper-bounded) optimal portfolios.

### 2.3 Empirical design

- **Universe A:** random samples of **500 stocks**, covariance estimated from past **five years** of monthly returns, portfolios formed at end of April each year 1968–1997, held one year. Out-of-sample excess returns vs one-month T-bill; compare volatility and Sharpe.
- **Universe B:** **25 Fama–French** size/book-to-market portfolios, same formation protocol, 1968–1999.
- **Tracking-error exercises:** minimize $(w-w_b)'\Sigma(w-w_b)$ to track benchmarks with liquid subsets.
- **Simulations:** calibrate factor structure to U.S. equities; vary $N$ and $T$ to map the sampling-vs-specification-error frontier.

With $N=500$, $\Sigma$ has $\approx 125{,}000$ free parameters; ~900 months of CRSP history give <4 observations per parameter—illustrating why sampling error is first-order.

---

## 3. Model and Methods

### 3.1 Constrained GMV and Kuhn–Tucker conditions

The constrained problem is
$$
\begin{align}
\min_w &\quad w'Sw \\
\text{s.t.} &\quad \mathbf{1}'w=1, \\
&\quad w_i\ge 0, \quad i=1,\ldots,N, \\
&\quad w_i\le \bar{w}, \quad i=1,\ldots,N,
\end{align}
$$
where $S$ is an estimated covariance matrix. Kuhn–Tucker conditions involve multipliers $\lambda_i\ge 0$ (nonnegativity) and $\delta_i\ge 0$ (upper bounds) and a multiplier $\lambda_0$ for the budget constraint:

$$
\sum_j S_{ij}w_j - \lambda_i + \delta_i = \lambda_0, \quad
\lambda_i w_i=0, \quad \delta_i(\bar{w}-w_i)=0.
$$

### 3.2 Proposition 1 — Constraints as covariance adjustment

**Proposition 1.** Let $\{w_i,\lambda_i,\delta_i\}$ solve the constrained problem for $S$. Define

$$
\tilde{S} = S + (\delta\mathbf{1}' + \mathbf{1}\delta') - (\lambda\mathbf{1}' + \mathbf{1}\lambda').
$$

Then $\tilde{S}$ is symmetric positive semidefinite, and $w$ is a GMV portfolio of $\tilde{S}$ *without* constraints.

**Interpretation:**

- Binding short-sale constraint on asset $i$ ($\lambda_i>0$) *subtracts* from row/column $i$ of $S$—i.e., shrinks $i$’s covariances toward zero (actually reduces them).
- Binding upper bound ($\delta_i>0$) *adds* to row/column $i$—increasing covariances of assets that looked “too uncorrelated.”

Assets assigned $w_i=0$ are those with high estimated covariances with the rest of the portfolio; shrinking those covariances is exactly what a robust estimator would do if it suspected upward bias.

### 3.3 Proposition 2 — Constrained MLE interpretation

Under i.i.d. normal returns, $S$ is the unconstrained MLE of $\Omega$. The *constrained* MLE imposing that the GMV of $\Omega$ satisfies the weight bounds is intimately related to $\tilde{S}$. Thus the practitioner’s constrained optimizer is not an ad hoc hack; it is close to a principled likelihood adjustment.

### 3.4 Sampling vs specification error trade-off

- If $S$ is noisy (sample cov, large $N/T$), shrinkage from constraints reduces MSE of $\hat{\Omega}$ more than it biases the population GMV ⇒ **constraints help**.
- If $S$ is already shrunk/structured (factor models, Ledoit), additional constraint-induced shrinkage can overshrink ⇒ **constraints hurt slightly**.
- If assets are themselves portfolios (FF25), sampling error is smaller ⇒ constraints help less (and can hurt unconstrained GMV that was already good).

---

## 4. Empirical Results (with Numbers)

### 4.1 Table VIII — 500 random stocks, tangency vs GMV

**Panel A: Tangency portfolios (out-of-sample)**

| Estimator | OOS Mean | OOS Std | OOS Sharpe | Avg short | # long |
|-----------|----------|---------|------------|-----------|--------|
| Sample cov, constrained | 7.11% | 20.12% | 0.35 | 0 | 17.7 |
| One-factor | 22.14% | 226.17% | 0.10 | −533.7% | 177.9 |
| One-factor, constrained | 7.69% | 21.09% | 0.36 | 0 | 27.0 |
| FF3 | −11.97% | 128.16% | −0.09 | −704.3% | 203.3 |
| FF3, constrained | 8.17% | 20.12% | 0.41 | 0 | 23.9 |
| Ledoit | 3.36% | 107.28% | 0.03 | −1194.3% | 217.8 |
| Ledoit, constrained | 7.52% | 20.52% | 0.37 | 0 | 24.8 |
| Equally weighted | 7.95% | 17.54% | **0.45** | 0 | 500 |

Unconstrained tangency portfolios are disasters: shorts of 500–1200% of NAV, OOS vols of 100–200%, Sharpes near zero or negative. Constraints restore sanity. Even then, **no tangency beats equal-weight Sharpe 0.45**.

**Panel B: Global minimum-variance (out-of-sample)**

| Estimator | OOS Mean | OOS Std | OOS Sharpe | Avg short | # long |
|-----------|----------|---------|------------|-----------|--------|
| Sample cov, constrained | 6.83% | **12.43%** | **0.55** | 0 | 24.0 |
| One-factor | 7.42% | 11.67% | 0.64 | −51.0% | 268.0 |
| One-factor, constrained | 6.11% | 12.61% | 0.48 | 0 | 39.0 |
| FF3 | 6.46% | 11.33% | 0.57 | −63.9% | 283.5 |
| FF3, constrained | 6.08% | 12.38% | 0.49 | 0 | 39.7 |
| Ledoit | 6.45% | 10.72% | 0.60 | −81.0% | 283.1 |
| Ledoit, constrained | 6.20% | 12.29% | 0.50 | 0 | 39.2 |
| Equally weighted | 7.95% | 17.54% | 0.45 | 0 | 500 |

Highlights:

- Constrained sample-cov GMV: vol **12.43%** vs EW **17.54%** (factor 1.4× reduction), Sharpe **0.55** vs EW **0.45**.
- Unconstrained factor/Ledoit GMVs achieve slightly higher Sharpes (0.57–0.64) but with 50–80% short notional—hard to implement.
- **Once constrained, sample cov (Sharpe 0.55) matches or beats constrained factor/Ledoit (0.48–0.50).** This is the paper’s famous practical result.
- Constrained GMV holds only **~24–40 stocks** out of 500—highly concentrated vs EW.

In-sample vs OOS optimism is extreme for unconstrained tangency (in-sample Sharpes of 8–9 vs OOS ~0).

### 4.2 Table IX — 25 FF portfolios

With only 25 assets, sample $S$ is nonsingular and means are estimated more precisely (portfolio averages).

**GMV out-of-sample Sharpes:** unconstrained sample 0.60, FF3 0.72, Ledoit 0.61; constrained versions ~0.45–0.46; EW 0.41. Here unconstrained structured estimators win on Sharpe *if shorts are allowed* (avg short 150–480%). Constrained tangency Sharpes (~0.50–0.51) beat constrained GMV (~0.46) but differences are not statistically significant—still not enough mean information to prefer tangency confidently.

### 4.3 Daily data and microstructure

When shorts are allowed, daily sample covariance performs best among unconstrained estimators. Microstructure corrections suggested in the literature do **not** improve OOS performance—an underappreciated negative result. Daily data helps more for *tracking-error* minimization than for GMV.

### 4.4 Simulations

Monte Carlo calibrated to U.S. equity factor structure confirms: with large $N$ and moderate $T$, nonnegativity constraints substantially reduce OOS variance of GMV even when the true GMV has large shorts. When $N$ is small or $T$ is large, constraints start to hurt. The empirical 500-stock / 60-month design sits firmly in the “constraints help” region.

### 4.5 Upper bounds

Given nonnegativity, adding upper bounds does **not** significantly improve OOS performance. Most of the shrinkage benefit is from the short-sale constraint.

---

## 5. Limitations

1. **Concentration risk.** Constrained GMV holds ~24 names. A few idiosyncratic disasters can dominate; EW is more robust to single-name failure. The authors flag this as open.
2. **No transaction costs / taxes.** Annual reconstitution of a 24-stock book still turns over; costs could erode the vol advantage.
3. **Short-sale costs ignored for unconstrained.** Comparing constrained Sharpe 0.55 to unconstrained Ledoit 0.60 without borrow fees favors unconstrained.
4. **Sample ends 1997/1999.** Pre-decimalization, pre-ETF, different shorting regime.
5. **Focus on variance.** Investors care about downside, liquidity, and factor exposures; GMV can load on low-vol / quality inadvertently.
6. **Equivalence is local.** Proposition 1 characterizes the constrained solution; it does not say arbitrary shrinkage targets are optimal.

---

## 6. Practical Takeaways for a Quant Investor

1. **Constraints are covariance shrinkage.** Do not think of no-short rules as pure mandate friction; they encode a statistical correction. If your optimizer already uses aggressive Ledoit/factor shrinkage, stacking hard constraints may overshrink.
2. **Sample cov + no shorts ≈ fancy cov + no shorts.** For long-only equity books, invest engineering effort in risk *limits*, liquidity, and alphas—not in ever-fancier $\hat{\Sigma}$—once nonnegativity is on.
3. **Prefer GMV to sample tangency.** Until you have a strong prior on means (Black–Litterman, Pastor–Stambaugh), optimize risk, not sample Sharpe.
4. **Monitor concentration.** Cap single-name and sector weights *after* seeing the constrained GMV, or use upper bounds despite the paper’s muted findings—operational robustness matters.
5. **Daily cov for index replication.** If the mandate is tracking error with a liquid subset, daily data helps; microstructure “corrections” may not.
6. **When to allow shorts.** If you can short efficiently and $N$ is modest (e.g., industry portfolios, futures), unconstrained structured GMV can win (Table IX). For 500-name equity, practical answer is long-only.

---

## 7. Key Equations

**Covariance adjustment:**

$$
\tilde{S}=S+(\delta\mathbf{1}'+\mathbf{1}\delta')-(\lambda\mathbf{1}'+\mathbf{1}\lambda').
$$

**GMV (unconstrained):**

$$
w_{\text{GMV}}=\frac{S^{-1}\mathbf{1}}{\mathbf{1}'S^{-1}\mathbf{1}}.
$$

**Tracking-error twin:** replace $S$ by the covariance of residual returns to the benchmark, or minimize $(w-w_b)'S(w-w_b)$.

---

## 8. Deeper Intuition: Which Covariances Get Shrunk?

Suppose asset $j$ has spuriously high sample correlations with many peers because of a few outlier months. Unconstrained GMV will short $j$ heavily to “hedge” those peers. The nonnegativity constraint binds, $\lambda_j>0$, and $\tilde{S}$ reduces $j$’s covariances—exactly undoing the outlier-driven estimates. Conversely, a stock with spuriously *low* covariances gets a huge long weight; an upper bound increases its $\tilde{S}$ entries, pulling the weight down. The procedure is data-dependent shrinkage targeted where the optimizer is most aggressive—more surgical than shrinking all correlations toward a constant.

### 8.1 Relation to Ledoit–Wolf

Ledoit shrinkage pulls $S$ toward a structured target $F$ with intensity $\alpha$:

$$
S_{\text{LW}}=(1-\alpha)S+\alpha F.
$$

Constraint-induced $\tilde{S}$ is a *different* shrinkage: sparse, asymmetric in effect (only rows with binding constraints move), and defined implicitly by optimality conditions. Empirically they are substitutes: using both adds little.

### 8.2 Green–Hollifield revisited

Green–Hollifield are right that *population* GMV can have large shorts under a dominant factor. Jagannathan–Ma show that with estimated $S$, the sampling-error channel dominates for large cross-sections. Simulations verify both statements can be true simultaneously: true GMV has shorts, yet constrained estimated GMV has lower OOS risk than unconstrained estimated GMV.

---

## 9. Numbers to Remember

| Object | Value |
|--------|-------|
| 500-stock constrained sample GMV OOS vol | 12.43% |
| 500-stock EW OOS vol | 17.54% |
| Vol ratio EW / constrained GMV | ~1.41 |
| Constrained sample GMV Sharpe | 0.55 |
| EW Sharpe | 0.45 |
| Typical #names in constrained GMV | 24–40 |
| Unconstrained FF3 tangency avg short | −704% of NAV |
| FF25 unconstrained FF3 GMV Sharpe | 0.72 (with −252% short) |

---

## 10. Connection to Sibling Papers

- **DeMiguel–Garlappi–Uppal (2009):** use Jagannathan–Ma constrained min-variance as one of 14 rules; it is the *best* optimizer vs $1/N$ on Sharpe but still rarely statistically beats $1/N$. Constraints help but do not eliminate estimation error in means.
- **Asness–Frazzini–Pedersen (2012):** different constraint (leverage aversion of *other* agents) also reshapes optimal portfolios toward safer assets.
- **Giglio–Xiu:** high-dimensional factor methods for risk premia; complementary high-dimensional theme.

---

## 11. Implementation Notes for a Risk Desk

**Long-only equity GMV recipe:**

1. Estimate $S$ monthly sample cov on 60 months (or LW shrink with $\alpha$ chosen by Ledoit–Wolf formula).
2. Solve QP: $\min w'Sw$ s.t. $1'w=1$, $w\ge 0$, optional $w\le \bar{w}$ (e.g., 3–5%).
3. Apply liquidity screens *before* optimization (ADV filters), not only after.
4. Rebalance quarterly/semiannually; penalize turnover with $\lambda_{\text{TC}}\|w-w_{\text{old}}\|_1$ if needed.
5. Report ex ante $\sqrt{w'Sw}$, effective $N=1/\sum w_i^2$, and sector exposures.
6. Paper benchmark: beat EW vol by ~20–30% without sacrificing Sharpe; if you cannot, the constraint/estimator combo is mis-tuned.

**What not to do:** unconstrained tangency on 500 names with sample means—Table VIII is the cautionary exhibit (Sharpes 0.03–0.10 with triple-digit volatility).

---

## 12. Theoretical Appendix Sketch

From KT conditions, for each $i$,

$$
(Sw)_i = \lambda_0 + \lambda_i - \delta_i.
$$

In vector form $Sw = \lambda_0\mathbf{1} + \lambda - \delta$. Constructing $\tilde{S}$ as in Proposition 1 yields $\tilde{S}w = c\mathbf{1}$ for some $c$, the first-order condition for unconstrained GMV of $\tilde{S}$. Positive semidefiniteness follows from the geometry of the constrained quadratic program. The MLE connection (Proposition 2) shows that among all covariance matrices whose GMV lies in the constrained set, $\tilde{S}$ is distinguished as a constrained-likelihood stationary point when returns are Gaussian.

---

## 13. Bottom Line

Jagannathan and Ma show that “wrong” nonnegativity constraints help because they shrink the covariance entries the optimizer most abuses. With constraints in place, sample covariance matches factor and shrinkage estimators for long-only GMV of large equity universes: ~12.4% OOS vol vs 17.5% for equal weight, Sharpe 0.55 vs 0.45, using only ~24 names. Unconstrained optimizers that short hundreds of percent of NAV look better only before costs and operational constraints. For a quant building long-only risk portfolios, the paper is permission to keep $\hat{\Sigma}$ simple—and a warning that sophistication without constraints is often false precision.

---

## 14. Historical Context and Why the Result Surprised

Before this paper, the dominant academic prescriptions for covariance estimation in large $N$ were: impose factor structure (Sharpe; Rosenberg; Fama–French), shrink (Ledoit), or use higher-frequency data. Constraints were viewed as *institutional frictions* that move the solution away from the efficient frontier. Green and Hollifield fortified that view by showing extreme weights could be optimal in population. Jagannathan–Ma flipped the narrative: in the empirically relevant $N/T$ regime, constraints are a *feature* of estimation, not merely a bug of institutions. The result legitimized the industry practice of long-only optimization and explained why vendors’ “optimized” long-only books often beat textbook MV with shorts.

### 14.1 Link to Bayesian and robust optimization

Robust mean–variance (e.g., Garlappi–Uppal–Wang) and Bayesian priors on $\Sigma$ also rein in extreme weights. Constraint-as-shrinkage is a frequentist cousin: instead of placing an explicit prior, the feasible set truncates the estimator. Empirically, DeMiguel et al. (2009) find that constrained rules dominate unconstrained Bayesian rules on their datasets—consistent with Jagannathan–Ma’s message that the constraint channel is powerful relative to other error-mitigation devices.

### 14.2 Minimum tracking error: practical notes

Indexers who replicate a broad benchmark with a liquid subset solve

$$
\min_w (w-w_b)'S(w-w_b) \quad\text{s.t.}\quad w\ge 0,\; \mathbf{1}'w=1.
$$

The same Proposition-1 logic applies to the residual covariance. Daily $S$ helps because tracking error is about short-horizon co-movement; microstructure noise that biases variance estimates may matter less for relative positions among liquid names. The paper’s finding that microstructure “corrections” fail to help is a reminder to validate any bias correction out of sample rather than by in-sample likelihood.

---

## 15. Verdict for Portfolio Construction Policy

| Mandate | Recommended estimator | Constraints | Benchmark |
|---------|----------------------|-------------|-----------|
| Long-only equity risk reduction | Sample or LW cov | $w\ge 0$, mild caps | Beat EW vol; Sharpe ≥ EW |
| Long–short with good borrow | FF3 or LW | None or mild | Watch short notional |
| Index primary / sample secondary | Daily cov | Nonnegativity + TE budget | TE vs full index |
| Means matter (rare) | Black–Litterman / Bayesian | Soft | Tangency only with priors |

The lasting slogan: **imposing the wrong constraints helps when sampling error is the dominant enemy.** In modern high-dimensional equity optimization, it usually is.

---

## 16. Extended Empirical Discussion

### 16.1 Year-by-year formation protocol

At each end-of-April date $t$ from 1968 to 1997, the authors:

1. Draw (or fix) a universe of 500 CRSP stocks with complete monthly history over $[t-60,t]$.
2. Estimate each candidate $\hat{\Sigma}_t$ on those 60 months.
3. Solve constrained and unconstrained GMV (and tangency) problems.
4. Hold the resulting weights from May of year $t$ through April of $t+1$.
5. Record the realized annual excess return over the T-bill.

This annual decision frequency matches institutional rebalance cycles and avoids overstating turnover relative to monthly optimization papers. The OOS means and standard deviations in Tables VIII–IX are computed from the time series of these annual excess returns; Sharpes are mean/std of that annual series (not $\sqrt{12}$ times monthly).

### 16.2 Why equal-weight is a tough benchmark

Equal-weight 500 stocks earns OOS Sharpe 0.45 with vol 17.54%. It requires no covariance estimate, diversifies idiosyncrasy maximally among the 500, and implicitly tilts toward smaller names within the draw. Beating it on *both* vol and Sharpe with only 24 names (constrained sample GMV: vol 12.43%, Sharpe 0.55) is a strong result: the optimizer successfully identifies a low-vol subset without destroying risk-adjusted return. The cost is concentration and potential fragility to name-specific shocks.

### 16.3 Tangency portfolio autopsy

Unconstrained tangency with FF3 inputs shows in-sample mean 185.99% and Sharpe 9.19—pure fiction from overfitting means and cov jointly. OOS: mean −11.97%, vol 128%, Sharpe −0.09, average short 704% of NAV. This single row of Table VIII should be taped above every intern’s desk. Constraints bring tangency OOS Sharpe to ~0.35–0.41—still below EW 0.45. Message: fixing $\Sigma$ is not enough when $\mu$ is sample means; you must replace $\mu$ with an economically disciplined estimator.

### 16.4 FF25 contrast

On 25 portfolios, unconstrained FF3 GMV reaches OOS Sharpe 0.72 with “only” 252% short notional—more palatable for a hedge fund than 704% tangency shorts, but still a levered long–short book. Constrained GMV Sharpe falls to 0.46, near EW 0.41. So the paper is *not* claiming constraints always dominate; it claims they dominate when $N$ is large and shorts are expensive/impossible. Mandate design should follow the $N$ and shorting regime.

### 16.5 Simulation design (Section II)

The Monte Carlo draws returns from a calibrated one-factor or multi-factor model matching empirical eigenvalue decay of U.S. equities. For each $(N,T)$, compare MSE of unconstrained vs constrained GMV variance forecasts and realized OOS variance. Findings:

- For $N=500$, $T=60$, constraints cut OOS variance sharply even when true GMV has large negatives.
- As $T/N$ grows, the advantage shrinks and eventually reverses.
- When the factor structure is weak (flatter eigenvalues), constraints help less because extreme weights are less endemic.

These simulations are why the authors can claim the result is not an accident of one CRSP path.

---

## 17. Mathematical Details Worth Coding

Given active set $\mathcal{A}=\{i:w_i>0\}$ and binding upper set $\mathcal{U}=\{i:w_i=\bar{w}\}$, the solution on free variables satisfies a reduced GMV system. Equivalently, one may iterate:

1. Solve unconstrained GMV on current active set.
2. Drop names with negative weights; freeze names breaching $\bar{w}$.
3. Repeat to convergence (standard active-set QP).

The implied $\lambda_i,\delta_i$ recover $\tilde{S}$. For risk reports, publish both $w'Sw$ and $w'\tilde{S}w$ (they match at optimum for the constrained problem’s FOCs) and the vector of covariance adjustments $\lambda_i-\delta_i$ as a diagnostic of which names the constraint “distrusts.”

### 17.1 Condition number perspective

Sample $S$ for $N=500$, $T=60$ is singular or near-singular (rank at most 59). Unconstrained GMV is then undefined or numerically unstable without pseudoinverse hacks that amplify noise. Nonnegativity plus budget makes the problem well-posed even when $S$ is singular—another practical reason constraints “help.” Factor and LW estimators restore full rank; constraints and regularization are again substitutes.

---

## 18. Critiques and Subsequent Literature

Subsequent work (DeMiguel et al. 2009; Tu–Zhou; Kirby–Ostdiek) stresses that even constrained GMV may not beat $1/N$ once turnover and realistic frictions enter. Jagannathan–Ma’s EW comparison already shows constrained GMV winning on Sharpe in their 500-stock design, but DeMiguel’s multi-dataset horse race is less kind. The right synthesis: constraints are necessary, not sufficient; $1/N$ remains a brutal benchmark when $N$ is small or assets are already portfolios.

Ledoit–Wolf and nonlinear shrinkage have improved unconstrained $\hat{\Sigma}$ since 2003. A modern replication should ask whether LW-nonlinear + long-only still leaves sample+long-only equivalent. The paper’s qualitative message—constraints encode shrinkage—remains intact even if the horse race among estimators updates.

---

## 19. Checklist for Replicating Table VIII

1. CRSP monthly residuals; adjust for delisting returns.
2. Each April, filter stocks with 60 valid months and reasonable price/ADV.
3. Build $S$, one-factor, FF3 residual cov, Ledoit toward one-factor.
4. Solve QPs with a production solver (OSQP, Mosek); verify KT residuals.
5. Compute OOS annual excess returns; Newey–West if using monthly holding-period returns instead.
6. Report mean, std, Sharpe, average $\sum_i|\min(w_i,0)|$, and average count of $w_i>0$.

Tolerance: constrained sample GMV vol should land near low teens; if you see 8% or 20%, the universe filter or annualization is wrong.

---

## 20. Final Synthesis

Jagannathan and Ma elevate a folk practice—long-only constraints—into a statistical theory of covariance shrinkage. The empirical payoff in large equity universes is a ~30% reduction in volatility versus equal weight with improved Sharpe, using the humble sample covariance. For quants, the paper reframes optimizer constraints as part of the estimation strategy and warns that unconstrained mean–variance with sample moments is operationally and statistically indefensible at large $N$.

---

## 21. Quantitative Appendix for the Desk

Define the out-of-sample variance ratio

$$
VR = \frac{\widehat{\mathrm{Var}}(r^{\text{EW}})}{\widehat{\mathrm{Var}}(r^{\text{GMV+}})}.
$$

Table VIII implies $VR \approx (17.54/12.43)^2 \approx 1.99$—constrained GMV halves variance vs equal weight in this design. The Sharpe ratio improvement $0.55/0.45-1\approx 22\%$ is smaller because mean returns are similar (6.83% vs 7.95%); almost all of the gain is risk reduction, consistent with the paper’s title.

For unconstrained factor GMV, Sharpe can exceed 0.60, but the *implementable* comparison must net borrow fees. If short rebate haircut is 100 bps on 60% short notional, annual drag is ~0.6%, which on a 6.5% mean and 11% vol cuts Sharpe by roughly 0.05—enough to close much of the gap vs constrained sample GMV. This arithmetic supports the authors’ practical conclusion even when raw unconstrained Sharpes look higher.

Upper-bound constraints, once nonnegativity binds, add little because the long-only GMV already concentrates in ~24–40 names; the problematic “too low covariance” assets are fewer once shorts are banned. If a mandate requires max 2% per name, effective $N$ rises and vol benefits shrink toward EW—trade robustness for efficiency explicitly.

The paper’s Monte Carlo guidance: if $T < N$, always constrain; if $T \gg N$ and shorts are cheap, relax. Most equity stock-selection books live in the first regime.

In short: treat long-only constraints as statistical regularization, keep covariance estimators simple under that mandate, and reserve unconstrained factor models for markets where shorting is cheap and $N/T$ is moderate. That is the operational distillation of Jagannathan and Ma (2003).
