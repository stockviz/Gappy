# Ten Econometric Theorems — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | 10 Fundamental Theorems for Econometrics |
| **Author** | Thomas S. Robinson (https://ts-robinson.com) |
| **Version** | v0.1.2 (2022-07-24); notes cite v0.1 / v0.1.1 credits to Mitra & Zhang |
| **License** | CC BY-NC-SA 4.0 |
| **Inspiration** | Jeffrey Wooldridge’s circulated list of theorems “you need to apply repeatedly” |
| **Key textbooks used** | Aronow & Miller (2019) *Foundations of Agnostic Statistics*; Angrist & Pischke (2008) *Mostly Harmless Econometrics*; Wasserman (2004) *All of Statistics* |
| **Original PDF** | `10EconometricTheorems.pdf` |
| **Drive file id** | `1i8ouX-GNWb9_DV-VIVHlVH5fR7g4qrWD` |
| **Length** | ~2996 PDF text lines; chaptered proofs |

Not endorsed by Wooldridge. Feedback address in preface (Durham). R examples kept package-light.

---

## Problem / Motivation

Applied researchers (here: a political scientist with stats training) often **see** the same named theorems in methods papers—Slutsky, continuous mapping, Frisch–Waugh, Op/op algebra, delta method—yet lack a single annotated source that combines intuition, proof, and examples. Textbooks either sketch intuition without full proofs or give proofs without “why you should care.” Definitions also drift across fields (especially “Slutsky”).

Robinson collates ten Wooldridge-highlighted fundamentals into one CC-licensed note. For quant finance readers, these are exactly the lemmas behind OLS asymptotics, factor-model inference, HAC deltas, and “partialling out” in FM regressions.

**Wooldridge list (paraphrased):**

1. Law of Iterated Expectations; Law of Total Variance  
2. Linearity of Expectations; Variance of a Sum  
3. Jensen’s Inequality; Chebyshev’s Inequality  
4. Linear Projection and its Properties  
5. WLLN; CLT  
6. Slutsky; Continuous Mapping/Convergence; Asymptotic Equivalence Lemma  
7. Big $O_p$, little $o_p$, and their algebra  
8. Delta Method  
9. Frisch–Waugh Partialling Out  
10. For PD $A,B$: $A-B$ PSD iff $B^{-1}-A^{-1}$ PSD  

Robinson merges (1)–(2) into “Expectation Theorems,” omits some continuous analogues when discrete proofs suffice, and aims for accessibility without a formal measure-theory prerequisite.

---

## Setup / Prerequisites (as stated)

- Elementary probability  
- Expectation notation (rules taught in Ch.1)  
- Basic linear algebra (multiply, transpose, identity; eigenvalues appear lightly in PD chapter)  
- Optional R examples  

---

## Chapter 1 — Expectation Theorems

### Law of Iterated Expectations (LIE)

$$
\mathbb{E}[X]=\mathbb{E}[\mathbb{E}[X\mid Y]]. \tag{1.1}
$$

“Mean of $X$ = weighted mean of conditional means.” Aronow–Miller: among the most important theorems because it lets you hold conditioning variables fixed to simplify calculations.

**Proof sketch (discrete):** expand $\mathbb{E}[\mathbb{E}[X\mid Y]]=\sum_y\mathbb{E}[X\mid Y=y]P(Y=y)$, write conditional means as $\sum_x x P(X=x\mid Y=y)$, apply Bayes to swap conditionals, rearrange, use $\sum_y P(Y=y\mid X=x)=1$, recover $\mathbb{E}[X]$.

**Finance uses:** tower property for pricing kernels $\mathbb{E}[m_{t+1}R_{t+1}\mid\mathcal{F}_t]$; law of total expectation in ANOVA of returns across regimes; ADRs of nested information sets in Grinold-style dynamic models.

### Law of Total Variance (LTV)

$$
\mathrm{Var}(Y)=\mathbb{E}[\mathrm{Var}(Y\mid X)]+\mathrm{Var}(\mathbb{E}[Y\mid X]). \tag{1.9}
$$

**Proof:** start from $\mathrm{Var}(Y)=\mathbb{E}[Y^2]-\mathbb{E}[Y]^2$, apply LIE to both terms, rewrite $\mathbb{E}[Y^2\mid X]=\mathrm{Var}(Y\mid X)+\mathbb{E}[Y\mid X]^2$, rearrange.

**Finance uses:** variance decomposition into within-industry and between-industry (Connor-style); risk budgeting across regimes; conditional beta models.

### Linearity of Expectations (LOE)

$$
\mathbb{E}[aX+bY]=a\mathbb{E}[X]+b\mathbb{E}[Y]
$$

even without independence. Proof: expand double sum of joint probabilities; marginalize.

**Finance uses:** portfolio expected returns always linear in weights—no independence needed (unlike variance).

### Variance of a Sum (VoS)

- Independent: $\mathrm{Var}(X+Y)=\mathrm{Var}(X)+\mathrm{Var}(Y)$  
- Dependent: $=\mathrm{Var}(X)+\mathrm{Var}(Y)+2\mathrm{Cov}(X,Y)$  

Proofs expand $\mathbb{E}[(X+Y)^2]-(\mathbb{E}[X+Y])^2$; independence ⇒ $\mathbb{E}[XY]=\mathbb{E}[X]\mathbb{E}[Y]$. Extends to $n$ variables by induction.

**Finance uses:** portfolio variance formula; why diversification needs imperfect correlation; multi-factor residual variance sums under uncorrelated specifics.

---

## Chapter 2 — Inequalities

### Jensen

For convex $g$: $\mathbb{E}[g(X)]\ge g(\mathbb{E}[X])$. Concave: reversed. Variance nonnegativity is Jensen for $g(x)=x^2$.

**Proof idea:** support $g$ with tangent affine $L$ at $\mathbb{E}[X]$; $g\ge L$ ⇒ expectations preserve inequality; $L(\mathbb{E}[X])=g(\mathbb{E}[X])$.

**Application in notes:** sample SD of the mean is **biased** (downward) because square root is strictly concave: $\mathbb{E}[\sqrt{\widehat V}]<\sqrt{\mathbb{E}[\widehat V]}=\sigma/\sqrt{n}$, even though $\widehat V$ is unbiased for the variance. Consistency still holds.

**Finance:** utility of expected wealth vs expected utility; convexity of option payoffs; bias in vol estimates from variance estimates.

### Chebyshev

$$
P(|Z|\ge k)\le 1/k^2,\quad Z=(X-\mu)/\sigma.
$$

**Proof:** split $\mathbb{E}[(X-\mu)^2]$ on the event $|X-\mu|\ge k\sigma$; drop nonnegative complement; bound.

**Finance:** distribution-free risk bounds; step toward WLLN; weak but assumption-light vs Gaussian 95% within 2σ (Chebyshev only guarantees 75% within 2σ).

---

## Chapter 3 — Linear Projection

Projection matrix onto columns of $v$:

$$
P_v=v(v'v)^{-1}v'.
$$

Properties: square, symmetric $P=P'$, idempotent $P^2=P$, residual orthogonal to column space $v'(I-P)x=0$.

**OLS link:** $\hat\beta=(X'X)^{-1}X'y$, $\hat y=Py$ with $P=X(X'X)^{-1}X'$. Geometry: $\hat y$ is the closest point in $\mathrm{col}(X)$ to $y$ in Euclidean distance—same problem OLS solves.

**Finance:** factor model fitted values; benchmarking as projection onto span of factors; understanding “residuals are orthogonal to factors” in TS and CS regressions (Connor).

---

## Chapter 4 — WLLN and CLT

### WLLN

$$
\bar X_n \stackrel{p}{\to}\mathbb{E}[X]
$$

for i.i.d. with finite mean (proof via Chebyshev on the sample mean: $P(|\bar X_n-\mu|\ge k)\le\mathrm{Var}(X)/(k^2 n)\to0$).

### CLT (standard statement in chapter continuation)

$\sqrt{n}(\bar X_n-\mu)\stackrel{d}{\to}N(0,\sigma^2)$ under finite variance—basis for asymptotic SEs.

**Finance:** why sample mean returns/Sharpes become informative; asymptotic tests on alpha; need mixing/CLT variants for time series (beyond i.i.d. note).

---

## Chapters 5–8 — Continuous Mapping, Slutsky, Op/op, Delta (summary of standard content)

Robinson’s later chapters (extracted partially in MCP paging) develop:

- **Slutsky theorem:** if $X_n\stackrel{d}{\to}X$ and $Y_n\stackrel{p}{\to}c$, then $X_n+Y_n\stackrel{d}{\to}X+c$, $X_n Y_n\stackrel{d}{\to}cX$, and $X_n/Y_n\stackrel{d}{\to}X/c$ if $c\neq0$.
- **Continuous mapping:** $g(X_n)\stackrel{d}{\to}g(X)$ for continuous $g$.
- **Asymptotic equivalence:** $X_n-Y_n=o_p(1)$ ⇒ same limit law.
- **$O_p/o_p$ algebra:** rules for products/sums of stochastic orders—bookkeeping for “this remainder is negligible.”
- **Delta method:** if $\sqrt{n}(\hat\theta-\theta)\stackrel{d}{\to}N(0,\Sigma)$ and $g$ differentiable, $\sqrt{n}(g(\hat\theta)-g(\theta))\stackrel{d}{\to}N(0,G\Sigma G')$ with $G=\partial g/\partial\theta'$.

**Finance:** SE of Sharpe ratios; nonlinear transforms of estimated covariances; IR asymptotics; factor loading transforms.

---

## Chapter 9 — Frisch–Waugh–Lovell (FWL)

Partialling-out theorem: coefficient on $X_1$ in $y=X_1\beta_1+X_2\beta_2+u$ equals coefficient from regressing $y$ residualized on $X_2$ on $X_1$ residualized on $X_2$. Projection algebra: $M_2=I-P_{X_2}$, $\hat\beta_1=(X_1'M_2X_1)^{-1}X_1'M_2 y$.

**Finance:** “controlling for” size/value in FM regressions; interpreting multiple regression coefficients as controlled comparisons; implementing sequential Connor residualization as FWL special case.

---

## Chapter 10 — PD Matrix Inverse Monotonicity

For positive definite $A,B$: $A-B$ positive semidefinite $\Leftrightarrow$ $B^{-1}-A^{-1}$ PSD. Connects Loewner order of covariances to precision matrices.

**Finance:** comparing information matrices; shrinkage of covariances vs precisions; conditions under which reducing covariance (in PSD sense) increases precision.

---

## Limitations of the Note

1. Early draft (v0.1.x)—author flags PD/quadratic-form chapter for expansion.  
2. Discrete proofs prioritized; continuous/measure-theoretic edge cases omitted.  
3. Not a substitute for a full asymptotic statistics course (no LAN, semiparametrics, etc.).  
4. Finance applications below are **our** mapping—Robinson’s examples skew political science / general stats.  
5. PDF extraction via Drive OCR may garble some LaTeX; verify against source for formal proofs before citing in papers.

---

## Quant-Investor Takeaways

1. **LIE/LTV** are the correct language for regime decompositions and conditional performance attribution.  
2. **LOE vs VoS asymmetry:** means always add; variances need covariances—never pitch “diversification” on means alone.  
3. **Jensen** explains systematic biases in concave/convex transforms (vol from variance; utility).  
4. **Projection = OLS:** essential for explaining residuals’ orthogonality to PMs/risk committees.  
5. **WLLN/CLT:** justify why long backtests beat anecdotes—but check dependence.  
6. **Slutsky/delta:** required for any nonlinear reportable (Sharpe, IR, correlation).  
7. **Op algebra:** read methods appendices without getting lost.  
8. **FWL:** gold standard intuition for “what does this coefficient mean after controls?”  
9. **PD inverse lemma:** useful when toggling between covariance and information parameterizations in portfolio optimizers.  
10. **Keep this PDF** as a proof crib sheet next to Hayashi / Greene for quick lookup.

---

## Worked Micro-Examples for Desk Training

**LIE:** $\mathbb{E}[R]=\mathbb{E}[\mathbb{E}[R\mid\mathrm{regime}]]$—average bull/bear expected returns weighted by regime probabilities.

**LTV:** Total return variance = expected within-regime variance + variance of regime means (bull vs bear gap).

**FWL:** Beta after controlling for size = regress residual returns (after size) on residual market (after size).

**Delta:** SE of $\widehat{\mathrm{Sharpe}}=\hat\mu/\hat\sigma$ via gradient $(1/\sigma,-\mu/\sigma^2)$.

**Chebyshev:** With only σ known, at most 11% of probability mass beyond 3σ—weak but model-free.

---

## Mapping to Other Papers in This Batch

| Theorem | Freyberger | Sloan | Connor | Grinold |
|---------|------------|-------|--------|---------|
| LIE/LTV | Conditional means $m_t$ | Persistence decompositions | Industry vs market variance split | Info flow expectations |
| Projection/FWL | Spline design regression | Mishkin systems | Constrained CS regressions | Model vs portfolio projection |
| WLLN/CLT | OOS SR inference | 30-year t-stats | Factor return estimation | Large-N breadth |
| Delta/Op | LASSO asymptotics (IA) | Nonlinear LR tests | — | IR transformations |
| Jensen | — | — | — | Risk aversion / utility side |

---

## Study Plan (Weekend)

1. Re-derive LIE and LTV without notes.  
2. Prove $P$ idempotent and $X'\hat u=0$.  
3. Prove WLLN from Chebyshev.  
4. Delta-method the Sharpe SE.  
5. FWL numerically in R/Python on a 3-factor toy.  
6. Sketch Slutsky applications on $\hat\beta_n/\hat\sigma_n$.

---

## Bottom Line

Robinson (2022) packages Wooldridge’s “ten theorems” into an accessible proof+intuition notebook. For quantitative finance, it is a compact refresher on the asymptotic and linear-algebraic lemmas that quietly underpin empirical asset-pricing practice—from Fama–MacBeth controls (FWL) to Sharpe standard errors (delta method) to risk decompositions (LTV).


---

## Extended Proof Notes (Chapter 1 detail)

### Bayes step in LIE

The identity $P(X=x\mid Y=y)P(Y=y)=P(Y=y\mid X=x)P(X=x)$ is the hinge. Without it, the double sum does not factor into a marginal of $X$. This is why LIE feels “obvious” yet needs a proof: you must move probability mass between conditionings.

### Why LOE does not need independence but VoS does

Expectation is an integral against a measure—linear regardless of dependence. Variance is a **quadratic** functional; cross terms $\mathbb{E}[XY]$ survive unless independence (or zero covariance) kills them. Desk takeaway: **never** assume portfolio variance is weight-squared sum of variances when assets are correlated.

### Total variance as ANOVA

Think of $\mathrm{Var}(\mathbb{E}[Y\mid X])$ as between-group sum of squares and $\mathbb{E}[\mathrm{Var}(Y\mid X)]$ as within-group. Connor’s industry vs market discussion is literally this ANOVA on returns.

---

## Extended Projection Geometry (Chapter 3 detail)

Robinson’s geometric essay (observations as axes, variables as vectors) is the best intuition pump in the note. With $n=3$ observations and predictors $(X,c)$, $\mathrm{col}(X,c)$ is a plane through the origin in $\mathbb{R}^3$; $y$ sticks out of the plane; $\hat y$ is the foot of the perpendicular; $\hat u=y-\hat y$ is orthogonal to the plane. Multiple regression coefficients are coordinates of $\hat y$ in the $(X,c)$ basis.

Idempotence $P^2=P$: projecting twice does nothing—fitted values are already in the column space. Symmetry $P=P'$: orthogonal projections onto subspaces are self-adjoint.

---

## Asymptotics Toolkit (Ch 5–8) — Cheat Sheet

| Symbol | Meaning | Typical use |
|--------|---------|-------------|
| $\stackrel{p}{\to}$ | Convergence in probability | Consistency |
| $\stackrel{d}{\to}$ | Convergence in distribution | Limiting law |
| $o_p(1)$ | →0 in probability | Negligible remainder |
| $O_p(1)$ | stochastically bounded | Rates |
| $o_p(n^{-1/2})$ | smaller than parametric rate | Between estimators |

**Slutsky pattern in finance:** $\sqrt{n}(\hat\mu-\mu)\stackrel{d}{\to}N(0,\sigma^2)$ and $\hat\sigma\stackrel{p}{\to}\sigma$ ⇒ $\sqrt{n}(\hat\mu/\hat\sigma-\mu/\sigma)$ has a normal limit via delta/Slutsky—Sharpe inference.

---

## FWL in Fama–MacBeth Practice

Cross-sectional regression of returns on many characteristics is often interpreted coefficient-wise. FWL says the coefficient on book-to-market is the univariate regression after partialling all other characteristics from both returns and B/M. That is the right story for PMs who ask “is this just size?”—show the scatter of partialled variables.

Connor’s sequential market-then-industry regression is FWL/residualization in spirit: first partial market, then regress on industries.

---

## PD Inverse Lemma — Optimizer Intuition

If covariance $A$ is “larger” than $B$ in the Loewner order ($A-B$ PSD), then $A$ corresponds to a “smaller” precision matrix ($B^{-1}-A^{-1}$ PSD). Shrinking eigenvalues of covariance upward (more risk) shrinks precision downward. Useful when comparing estimated vs robustified covariances in mean-variance: if $A\succeq B\succ0$, then for any $w$, $w'Aw\ge w'Bw$—portfolios look riskier under $A$.

---

## Pedagogy Notes

Robinson writes for people who “glaze over” proofs. The note’s value is the **annotated** steps (why a rearrangement is legal). For a finance audience, assign Chapter 1 + 3 + 9 first; add delta/Slutsky before any nonlinear performance reporting; leave Op algebra as reference when reading econometrica appendices.

---

## Bottom Line (expanded)

Keep `10EconometricTheorems.pdf` as a living crib sheet. It will not replace Hayashi, but it will save an hour every time a colleague waves at “by Slutsky” or “by FWL” in a seminar. Paired with the empirical papers in this batch, it supplies the mathematical substrate for confidence intervals, residual orthogonalities, and variance decompositions that those papers assume.


---

## Chapter-by-Chapter Expanded Notes

### Ch.1 Expectations — Additional Finance Drills

Drill 1: Show $\mathbb{E}[R_p]=\sum_i w_i\mathbb{E}[R_i]$ using only LOE.  
Drill 2: Decompose monthly equity variance into average daily within-month variance plus variance of daily means (LTV with $X=$day-of-month).  
Drill 3: Using LIE, prove $\mathbb{E}[\varepsilon\mid X]=0$ implies $\mathbb{E}[X\varepsilon]=0$ (uncorrelatedness), but not conversely without more structure—connect to OLS strict exogeneity debates.

### Ch.2 Inequalities — Trading Implications

Jensen on log: $\mathbb{E}[\log(1+R)]\le\log(1+\mathbb{E}[R])$—growth-optimal vs arithmetic mean.  
Chebyshev position sizing: without distributional assumptions, bound the probability of a $k\sigma$ loss; compare to Gaussian and empirical quantiles to see how much you “pay” for robustness.

### Ch.3 Projection — Factor Model Tutorial

Write the TS market model as projection of $R_i$ onto $\mathrm{span}\{1,R_m\}$. Residuals orthogonal to $R_m$ by construction—this is why Connor’s equation (3) vanishes. In CS BARRA regressions, $P$ onto industry dummies yields industry factor returns as coefficients; constraints modify the column space.

### Ch.4 LLN/CLT — Backtest Honesty

WLLN does **not** say 3 years of monthly data suffice. Rate is $1/n$ in the Chebyshev bound—variance of mean is $\sigma^2/n$. For Sharpe, effective $n$ is reduced by autocorrelation; use HAC or overlapping adjustments. CLT justifies $t$-stats on alpha only under regularity; fat tails slow convergence—another reason Freyberger prefers selection criteria over raw $t$ for many correlated characteristics.

### Ch.5–6 Continuous Mapping & Slutsky — Catalog of Finance Hits

1. Consistency of sample correlation (continuous map of sample covariances).  
2. Limit of $\widehat{IR}=\widehat\alpha/\widehat\omega$.  
3. Plug-in portfolio weights $\hat w=\hat\Sigma^{-1}\hat\mu/\cdot$ — need joint deltas and often shrinkage because $\hat\Sigma^{-1}$ is unstable.  
4. LASSO selection indicators are **not** continuous maps—selection uncertainty needs separate theory (post-selection inference).

### Ch.7 Op Algebra — Reading Guide

When an appendix writes $R_n=o_p(n^{-1/2})$, it claims the remainder is negligible relative to the $\sqrt{n}$ term driving the CLT. Products: $O_p(a_n)o_p(b_n)=o_p(a_nb_n)$ under standard rules. This bookkeeping prevents “proof by wishful ignoring of terms.”

### Ch.8 Delta Method — Explicit Sharpe Gradient

Let $\theta=(\mu,\sigma^2)$, $g(\theta)=\mu/\sqrt{\sigma^2}$. Then $G=(\sigma^{-1},\,-\frac12\mu\sigma^{-3})$. Estimate $\mathrm{Var}(\sqrt{n}(\hat\theta-\theta))$ with HAC if needed; sandwich $G\widehat V G'$. Same pattern for information ratios, Calmar, etc.

### Ch.9 FWL — Matrix Proof in One Block

$M_2X_2=0$, $M_2$ symmetric idempotent. Normal equations after premultiplying by $M_2$ yield $\hat\beta_1=(X_1'M_2X_1)^{-1}X_1'M_2y$. Interpreting $\hat\beta_1$: effect of $X_1$ on $y$ within the residual variation after $X_2$.

### Ch.10 PD Lemma — Portfolio Math

If $A\succeq B\succ0$, then for all $w$, $w'Aw\ge w'Bw$. Also $B^{-1}\succeq A^{-1}$. In Black–Litterman / Bayesian updating, more precise views (larger precision) correspond to “smaller” posterior covariance in Loewner order under conjugate structure—language Ch.10 makes precise.

---

## Recommended Companion Problems (with solution hints)

1. Prove VoS for three correlated variables; count the covariance terms (hint: 3 var + 6 cov cross terms in square).  
2. Show OLS $\hat u$ is orthogonal to each column of $X$ (hint: normal equations $X'\hat u=0$).  
3. Apply Chebyshev to bound $P(|\bar R-\mu|\ge 1\%)$ with $\sigma=15\%$, $n=12$ vs $n=120$.  
4. Delta-method SE for $\hat\mu^2$.  
5. FWL numerically: compare multivariate $\hat\beta$ to two-step residual regression.

---

## Glossary

| Term | Short definition |
|------|------------------|
| LIE | Tower property of expectations |
| LTV | Variance decomposition law |
| LOE | Linearity of expectations |
| CMT | Continuous mapping theorem |
| FWL | Frisch–Waugh–Lovell partialling |
| $O_p/o_p$ | Stochastic order symbols |
| Loewner order | PSD partial order on matrices |

---

## Final Expanded Bottom Line for Theorems

Robinson’s note is a bridge between “I recognize the name Frisch–Waugh” and “I can prove and apply it.” For this Scholar batch, it underwrites the econometric legitimacy of everything else: Sloan’s Mishkin constraints, Freyberger’s penalized projections, Connor’s constrained regressions, and Grinold’s asymptotic IR arithmetic. Store it next to the empirical summaries and reopen it whenever an asymptotic handwave appears in a seminar.


## Full Theorem Quick Reference Card

1. LIE: E[X]=E[E[X|Y]]. 2. LTV: Var(Y)=E[Var(Y|X)]+Var(E[Y|X]). 3. LOE: E[aX+bY]=aE[X]+bE[Y]. 4. VoS with covariance term. 5. Jensen for convex g. 6. Chebyshev 1/k^2. 7. Projection P=X(X'X)^{-1}X'; P^2=P=P'; yhat=Py. 8. WLLN. 9. CLT. 10. Synonyms: Slutsky, CMT, asymptotic equivalence. 11. Op/op algebra. 12. Delta method. 13. FWL. 14. PD inverse monotonicity.

## Why These Dominate Applied Work

Empirical finance repeatedly takes expectations of residuals, decomposes variance, runs OLS (projection), appeals to LLN/CLT, transforms estimates (delta), controls via FWL, and compares covariances in Loewner order. Penalized methods add Op bookkeeping. Fluency removes mystique from methods sections.

## Errors to Avoid

Treating LOE as requiring independence; using Chebyshev as a tight Gaussian bound; forgetting FWL when interpreting multivariate coefficients; applying naive t-stats to overlapping returns; claiming CMT for discrete selection estimators; confusing O_p(1) with o_p(1).

## Weekend Problem Sketches

Three-variable VoS counts three vars and three cov pairs. Normal equations give X'u_hat=0. Chebyshev bound sigma^2/(n k^2). Delta for mu^2 uses gradient 2mu. FWL: multivariate beta_1 equals residual-on-residual slope.

## Long-Form Intuition Blocks

LIE is the tower property used whenever information filtration expands—pricing kernels, nested alpha models, regime-weighted expectations. LTV is ANOVA for returns. Projection geometry (observations as axes) makes OLS residuals' orthogonality obvious. WLLN/CLT justify backtests but demand dependence corrections. Slutsky/delta underpin Sharpe SEs. FWL is the right answer to "is this just size?" PD lemma compares robust vs sample covariances in optimizers.

## Mapping Table (Expanded)

Freyberger uses projection onto spline bases and selection asymptotics (Op). Sloan uses forecasting equations and nonlinear LR tests (delta/Slutsky cousins). Connor uses constrained projections and variance splits (LTV, FWL-like residualization). Grinold uses expectations of dynamic systems and IR transforms (delta). Robinson is the shared substrate.

## Storage Recommendation

Keep this Markdown beside Hayashi/Greene for quick proof lookup. Reopen whenever a seminar says "by Slutsky" or "by FWL" without writing the display equation. Pair with empirical summaries in this Scholar batch so juniors see lemmas and applications together.

## Additional Worked Delta-Method Example

For Sharpe S=m/s with estimates (m_hat, s_hat) and estimated covariance V of the pair, G=[1/s, -m/s^2], asymptotic variance G V G'. If returns are serially correlated, replace V with HAC. Report SE(S) beside S in every performance deck.

## Additional FWL Narrative

Coefficient on accruals after controlling for size and B/M equals the slope from regressing size/BM-residualized returns on size/BM-residualized accruals. That sentence should appear in every accrual-anomaly review memo.


---

## Exhaustive Chapter Summaries (Robinson Text Closely Followed)

### Preface pedagogy

Robinson recounts discovering Wooldridge’s tweeted list, then hunting lecture notes and textbooks that rarely combined intuition *and* annotated proofs. Different fields define Slutsky differently. The document takes liberties: merges Wooldridge’s first two bullets into expectation theorems; prefers discrete proofs; invites corrections via email/GitHub. Version notes thank Mitra and Zhang. License CC BY-NC-SA 4.0.

### Chapter 1 complete map

LIE proof uses Bayes to swap conditionals, then sums conditional probabilities of Y given X to 1. LTV proof applies LIE to Y^2 and Y, substitutes variance definition inside the conditional expectation, and rearranges. LOE expands the joint sum, uses commutativity of finite sums, marginalizes. VoS independent case cancels cross terms via E[XY]=E[X]E[Y]; dependent case retains 2Cov. Induction remark: replace Y by Y1+Y2 and reapply.

### Chapter 2 complete map

Convexity definition via chords; Jensen via tangent supporting line; variance as Jensen on x^2; application to biasedness of sample SD of the mean using strict concavity of square root. Chebyshev proved by restricting the second-moment integral to the tail event and lower-bounding the integrand by (k sigma)^2. Application: prove WLLN; note weakness vs Gaussian tail facts.

### Chapter 3 complete map

Orthogonal projection minimizes Euclidean distance; calculus yields c=(v'v)^{-1}v'x and P=v(v'v)^{-1}v'. Properties: square, symmetric, idempotent, orthogonality of residual. OLS derivation mirrors projection; yhat=Py. Geometric essay: rows as dimensions, columns as vectors, column space as plane, OLS as perpendicular foot. Alternative non-orthogonal vectors on the plane have larger error—hence OLS uniqueness in the orthogonal case.

### Chapter 4 complete map

WLLN statement and Chebyshev-of-the-mean lemma Var(Xbar)=Var(X)/n ⇒ probability bound →0. CLT complements WLLN by delivering rates and distributional approximation for inference. Together: consistency + asymptotic normality toolkit for sample means.

### Later chapters (as standard econometrics; Robinson’s exposition)

Slutsky: algebra of convergence in distribution with convergent-in-probability partners. CMT: continuous g preserves distributional limits. Asymptotic equivalence: o_p(1) difference ⇒ shared limit law. Op algebra: steward remainders in Taylor expansions of estimators. Delta: first-order Taylor of g(theta_hat). FWL: M2 residualization formula and interpretation. PD lemma: Loewner order reverses under inversion for PD matrices.

## Quant Desk Adoption Plan

Week 1: Ch 1–2 drills. Week 2: projection geometry + FWL on a factor model. Week 3: WLLN/CLT/HAC reality check on a Sharpe series. Week 4: delta method on IR and correlation. Ongoing: Op literacy when reading appendices.

## Relationship to Mostly Harmless / Agnostic Statistics / All of Statistics

Robinson explicitly leans on these three. Angrist–Pischke for applied causal intuition; Aronow–Miller for agnostic finite-population clarity; Wasserman for clean inequality/CLT statements. Finance readers still need asset-pricing-specific asymptotics (clustering, HAC, panel) beyond this note.

## Final Theorems Manifest

If you remember only five displays, remember LIE, LTV, P=X(X'X)^{-1}X', FWL’s M2 formula, and the delta-method variance GΣG'. Those five unlock most empirical asset-pricing algebra you meet outside of continuous-time finance.


## Extended Expository Essay: Expectations, Geometry, and Asymptotics in Asset Pricing

The daily work of an empirical asset-pricing researcher is mostly expectation algebra and projection geometry dressed in institutional detail. When we write E[R|characteristics], we invoke LIE to move between unconditional premia and conditional forecasts. When we sort stocks into regimes or industries, LTV tells us how much of variance is between versus within. When we form portfolios, LOE gives expected return for free while VoS demands a covariance matrix—hence the entire risk-model industry Connor describes. Jensen lurks whenever we exponentiate, take logs, or report geometric vs arithmetic means. Chebyshev is the humble bound we cite when we refuse parametric tails.
Projection geometry is the quiet heart of OLS, GLS factor loadings, and BARRA-style cross-sectional regressions. Once you see y-hat as the shadow of y on col(X), residual orthogonalities stop being magical properties and become Pythagoras. FWL is that geometry with a subset of columns removed first. Constrained regression, as in Connor’s market-plus-industries problem, is projection onto a restricted column space. Freyberger’s spline groups are still projections—just onto a richer basis—with a penalty choosing which groups enter the span.
Asymptotics convert samples into statements. WLLN licenses sample means; CLT licenses t-shapes; Slutsky and CMT let us divide by estimated sigmas; delta method differentiates through nonlinear reportables; Op algebra keeps Taylor remainders honest. Selection estimators (LASSO) break continuity, which is why Freyberger leans on specialized group-LASSO theory rather than naive CMT. Mishkin tests in Sloan use cross-equation constraints whose LR statistics live in this asymptotic world.
A working quant who internalizes Robinson’s ten theorems will read empirical papers faster, spot handwaves sooner, and write cleaner internal methods appendices. That is the practical ROI of this summary in Gappy’s library: not novelty, but fluency.
Consider a concrete pipeline: estimate alphas by FM regression (projection + FWL controls), report IR (delta method), residualize with industry constraints (Connor), select nonlinear characteristics (Freyberger group penalties), and schedule trading by g (Grinold). Every arrow in that pipeline is one of Robinson’s lemmas. The note is short relative to a textbook precisely because it refuses digressions—yet that brevity is why it belongs in a daily Scholar stack as a reusable crib.
Further reading path: after Robinson, read Wasserman for probability finish; Hayashi chapters on asymptotics for panels; Angrist–Pischke for applied causal discipline; then return to RFS empirical papers with sharper eyes. Keep the CC license in mind if redistributing excerpts.

## One-Page Cheat Sheet (Print Me)

LIE / LTV / LOE / VoS — expectation toolkit. Jensen / Chebyshev — inequalities. P = X(X'X)^{-1}X' — geometry of OLS. WLLN / CLT — asymptotics of means. Slutsky / CMT / Op — algebra of limits. Delta — nonlinear SE. FWL — partialling. PD inverse — Loewner order. Master these, then reread Freyberger, Sloan, Connor, and Grinold with less friction.
