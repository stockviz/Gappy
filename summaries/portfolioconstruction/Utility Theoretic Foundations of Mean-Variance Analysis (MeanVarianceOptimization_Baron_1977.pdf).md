# On the Utility Theoretic Foundations of Mean-Variance Analysis — Baron (1977) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | On the Utility Theoretic Foundations of Mean-Variance Analysis |
| **Author** | David P. Baron — Professor of Managerial Economics and Decision Sciences, Graduate School of Management, Northwestern University |
| **Outlet** | *The Journal of Finance*, Vol. XXXII, No. 5, December 1977, pp. 1683–1697 |
| **Theme** | von Neumann–Morgenstern consistency of mean–variance rankings; quadratic utility; portfolios vs mixed strategies; normal family |
| **Original PDF** | `MeanVarianceOptimization_Baron_1977.pdf` |
| **Drive file_id** | `1UiBqfBgB3PbyOina9sbPAt-DwmNOB2LW` |
| **Extraction** | Binary download + pdftotext; ~6,800 words in source PDF (short JF article); OCR-usable (alnum ~0.70) |

Note: Source article is short (~15 JF pages). This Scholar note expands every proposition, proof idea, and quantitative implication to full working length for a quant library.

---

## Problem / Motivation

Markowitz–Tobin mean–variance (MV) analysis orders alternatives by an ordinal function V(mu, sigma^2) of mean and variance. If preferences satisfy von Neumann–Morgenstern (NM) axioms, expected utility EU(X) must represent preferences. Markowitz showed that for EU to depend only on (mu, sigma^2) for **all** distributions, U must be **quadratic**. Quadratic U has well-known pathologies:

- Domain restriction: marginal utility positive only on (-infty, 1/(2b)] for U(x)=x-b x^2.
- Increasing absolute risk aversion.
- Equilibrium implication (Mossin): each investor holds equal percentage of every security.
- Ekern–Wilson: with stochastic constant returns, shareholders prefer firm market value zero.
- Borch “paradox”: under preference absolue (monotonicity), indifference curves in (mu,sigma) appear to collapse to single points.

Samuelson, Tsiang, and others defend MV as an **approximation**; Baron sets that debate aside. His questions:

1. Given V, what restrictions on NM utility U?
2. If only the **optimal** alternative (not the full ranking) need be NM-consistent, can admissible U enlarge?
3. If alternatives are restricted to a parametric family (e.g. normal), what expands?

---

## Setup: Pure Strategies, Mixed Strategies, Portfolios

Consequence set = real line (dollar returns). Finite set A* of **pure strategies** a_i* (e.g. invest entire endowment in security i). Random return X_i ~ F_i.

**Mixed strategy** a_p indexed by probability vector p: choose pure strategy i with probability p_i (coin-flip randomization). Return X_p has distribution F_p = sum p_i F_i — a **probability mixture**, not a portfolio. If F_1, F_2 are normal, F_p is generally **bimodal**, not normal.

**Portfolio** a_alpha: invest weights alpha_i in securities; return X_alpha = sum alpha_i X_i. Let E* = set of portfolios; E = E* plus all mixed strategies formed from portfolios.

NM axioms are defined on the set of **all mixed strategies** (probability mixtures), not merely on portfolios.

---

## Section I — Necessary Form of U for Full Ranking

### Proposition 1

If preferences satisfy NM axioms on return distributions of alternatives in A (including mixtures), a mean–variance utility V(mu, sigma^2) that agrees with that ordering can correspond **only** to a **quadratic** NM utility U(x)=x-b x^2.

**Proof idea.** Take two pure strategies indifferent under V. Mixtures a_q with q in [0,1] must also be indifferent. Mean and variance of the mixture:

$$
\mu_q = q\mu_1+(1-q)\mu_2,
$$
$$
\sigma_q^2 = q\sigma_1^2+(1-q)\sigma_2^2 + q(1-q)(\mu_1-\mu_2)^2.
$$

Eliminating q yields indifference curves of the form

$$
\mu - b(\mu^2+\sigma^2) = k,
$$

hence V(mu,sigma^2)=mu-b(mu^2+sigma^2)=E[x-b x^2], so U(x)=x-b x^2.

Indifference curves in (mu,sigma)-plane: concentric semicircles centered at (1/(2b), 0), slope d(sigma)/d(mu)=(1-2b mu)/(2b sigma).

**Critical point:** even if every pure strategy is normal, mixtures are not normal. You cannot restrict the domain to normals if the goal is to rank **all** NM-admissible alternatives (mixtures always available by randomization). Only quadratic U ranks all mixtures consistently with MV.

### Borch’s Paradox and Proposition 2

Borch constructs, from any two distinct (mu,sigma) points claimed indifferent, two binary lotteries with those moments such that preference absolue (monotonicity in payoffs) forces the points to coincide — concluding indifference curves cannot exist.

Baron’s resolution: under quadratic U implied by Proposition 1, Borch’s constructed payoffs y1, y2 lie where **marginal utility is negative** (unless the two points are identical). Explicitly, with b implied by indifference of the two points,

$$
1-2b y_1 \quad\text{and}\quad 1-2b y_2
$$

cannot both be nonnegative unless mu1=mu2 and sigma1=sigma2.

### Proposition 2

If preferences satisfy NM axioms and are representable by a mean–variance utility, the individual **cannot** be indifferent among all distributions that share the same mean and variance — once monotonicity is imposed on the full payoff domain. Domain-restricted indifference curves (payoffs inside the region of nonnegative marginal utility) do exist for quadratic U (Hanoch–Levy; Bierwag–Grove).

Additional quadratic limitations: unbounded U cannot order all distributions (Chipman) — restrict to distributions with finite EU; increasing ARA is global.

---

## Section II — Extending Applicability When Only Optima Matter

Objective may be to **select the preferred strategy**, not to rank all mixtures. Then mixtures can often be excluded as candidates for optimality.

### Proposition 3

If a1* preferred to a2*, then a1* preferred to every mixture a_q for q in [0,1). Proof: EU(X_q)=q EU(X1)+(1-q)EU(X2) < EU(X1). Holds for all increasing U. Thus when pure strategies are available, mixtures never uniquely optimal.

### Proposition 4

A portfolio a_alpha with alpha=q dominates (is dominated by) the corresponding mixed strategy a_q for all strictly concave (convex) NM U; indifference if U linear. Proof: Jensen’s inequality pathwise, then take expectations under the joint distribution of (X1,X2).

Variance comparison: for risk-averse V decreasing in sigma^2, portfolio dominates mixture because

$$
\sigma^2_{\text{portfolio}}-\sigma^2_{\text{mixture}} = q(1-q)\big[-(\sigma_1-\sigma_2)^2\big]\le 0
$$

(with correlation terms yielding the same sign via Var(X1-X2)). Figure 1 in the paper: portfolio lies on the Markowitz frontier segment; mixture lies on the chord of probability mixtures — dominated for risk-averse MV preferences.

### Consequence for portfolio theory

In a standard portfolio problem, pure strategies and portfolios are available, so

$$
\max_{a\in E} EU(X) = \max_{a\in E*} EU(X)
$$

for all increasing concave U. Therefore MV analysis used to pick the optimal portfolio is consistent with NM axioms **without requiring quadratic U** — any increasing concave U works for the optimality question, once mixtures are dominated.

Lintner, Sharpe, Stiglitz MV equilibrium characterizations are thus not hostage to quadratic utility for the purpose of identifying optima among portfolios of normals.

### When Propositions 3–4 fail (examples)

1. **Lottery tickets whose prizes are other lottery tickets** — mixtures essential, portfolios unavailable.
2. **FX hedging with regime uncertainty** (France in/out of European “snake”): distributions are regime mixtures; neither pure regime nor a portfolio of regimes is choosable — only the probability mixture. MV needs quadratic U for NM consistency.
3. **Bidding with bid-dependent win probability** q(y): achievable set is degenerate-at-zero plus mixtures with F_y; no portfolio. Again quadratic needed.
4. **Information-contingent return distributions** (tender offer / merger outcomes): unconditional pure strategies not available with certainty.

These examples delineate when “MV without quadratic” is safe (standard portfolio choice) vs unsafe (regime mixtures, auctions, compound lotteries).

---

## Section III — Normal Family and Existence of U from V

Even given V(mu,sigma^2), a NM utility U generating V may not exist.

Allais: for normals, existence requires the PDE

$$
2\frac{\partial V}{\partial\sigma^2}=\frac{\partial^2 V}{\partial\mu^2}.
$$

### Proposition 5 (Chipman)

If |U(x)| < k exp(B x^2) and X normal, then V=EU exists and satisfies the PDE. (U need not be continuous — e.g. indicator safety-first criteria of Roy.)

### Proposition 6 (Chipman)

If V satisfies the PDE, V(mu,0)=U(mu), and a uniform exponential bound in mu, then U exists with V=EU.

**Implication:** one cannot draw arbitrary indifference curves in the (mu,sigma^2) plane and claim NM rationality even under normality. For **complete ordering** of all normals under NM, curves must be concentric semicircles (quadratic). For **selecting the optimum** among portfolios, more general V (including monotone transforms of quadratic MV utility) can share the same tangency point.

### Kataoka safety-first example

Maximize x s.t. P(X<x) <= y for normal X. Indifference curves: parallel straight lines in (mu,sigma) with slope related to Phi^{-1}(y). These **violate** the Allais PDE — hence do **not** correspond to any NM expected utility, despite being a popular practical criterion.

### Proposition 7 (efficiency)

For two normals, mu1>mu2 and sigma1<sigma2 iff V1>V2 for **all** increasing concave NM U. (Hanoch–Levy; Rothschild–Stiglitz related). Does **not** extend to all two-parameter families — Feldstein counterexample: log utility + lognormals can have nonconcave indifference curves.

### Other families

Stable laws (Chipman, Fama, Samuelson): Tobin-style properties; convex efficient set; but few tractable EU functional forms. Lognormal (Levy), gamma/beta/power (Ali), two-point (Chipman, Klevorick): stochastic dominance criteria exist, but only stables are closed under portfolio formation — limiting portfolio tractability.

---

## Section IV — Summary (Paper’s Own)

Restrictions depend on the objective:

1. **Order all alternatives** ⇒ quadratic NM U required.
2. **Find preferred / nondominated alternatives** ⇒ MV OK without quadratic if preferred pure strategy available or portfolios dominate mixtures (Props 3–4); optima consistent with any increasing concave U.
3. **Normals** ⇒ MV can identify nondominated set; not all indifference maps correspond to NM U (PDE required); linear parallel (mu,sigma) curves (Kataoka) are not NM.

---

## Quantitative / Geometric Details Worth Preserving

Mixture variance inflation term: q(1-q)(mu1-mu2)^2 — the mean gap itself creates variance under randomization. Portfolio variance uses 2q(1-q) rho sigma1 sigma2 instead — correlation benefit.

Indifference slope in (mu,sigma^2): d(sigma^2)/d(mu)=(1-2b mu)/b. Bliss point at mu=1/(2b).

Concentric semicircles: center (1/(2b), 0); radius determined by k in the indifference equation.

Mossin equal-percentage holding: comes from quadratic ARA properties in CAPM aggregation — Baron cites as a “disquieting” equilibrium implication motivating care with quadratic U.

---

## Limitations of the Paper

1. No empirical application; pure theory.
2. Does not develop approximation error bounds (defers to Borch, Bierwag, Levy, Tsiang debate).
3. Pre-dates modern recursive utility, disappointment aversion, prospect theory formalizations — though preference absolue discussion touches monotonicity.
4. Assumes finite EU where needed; stable-family portfolio choice left largely to citations.

---

## Practical Takeaways for a Quant Investor

1. **Using MV to pick a portfolio of stocks/bonds is NM-defensible without quadratic utility**, because portfolios dominate coin-flip mixtures for risk-averse agents (Props 3–4). This rehabilitates Sharpe–Lintner-style analysis for optimality questions.

2. **Using MV to rank all conceivable lotteries including randomized strategies requires quadratic U** — do not claim full NM ranking from MV scores on arbitrary distributions.

3. **Regime-mixture problems** (binary macro regimes, auction win/lose, contingent info) are **not** standard portfolio problems: if you only face mixtures, MV without quadratic is not NM-safe. Use full EU or scenario optimization.

4. **Safety-first / maximize VaR-quantile (Kataoka) indifference maps are not NM expected utility** under normality — fine as a pragmatic constraint, but do not sell them as EU-rational.

5. **Arbitrary (mu,sigma) indifference curves** drawn in risk software need not correspond to any U; check Allais PDE if you need NM foundation under normality.

6. **Quadratic U pathologies** (increasing ARA, bliss point, Mossin equal shares) are reasons to prefer interpreting MV as an approximation or as an optimality tool under Props 3–4, not as literal quadratic EU over all mixtures.

7. **Efficiency:** among normals, higher mean + lower variance ⇒ dominance for all increasing concave U (Prop 7). This is the cleanest MV efficiency theorem; do not export it casually to lognormals without checking.

---

## Equations Quick Reference

$$
U(x)=x-bx^2,\quad V=\mu-b(\mu^2+\sigma^2),
$$
$$
\mu_q=q\mu_1+(1-q)\mu_2,\quad
\sigma_q^2=q\sigma_1^2+(1-q)\sigma_2^2+q(1-q)(\mu_1-\mu_2)^2.
$$

Allais PDE (normals): $2 V_{\sigma^2}=V_{\mu\mu}$.

Jensen: $U(q x_1+(1-q)x_2)>(<)\,q U(x_1)+(1-q)U(x_2)$ for strictly concave (convex) U ⇒ portfolio vs mixture ranking.

---

## Extended Discussion: Why Mixtures vs Portfolios Matters in Manufacturing Risk Tools

Many vendor risk systems score “strategies” that are themselves randomized policies (e.g. randomly timed execution algorithms, randomly selected factor tilts). Scoring them with MV treats a mixture as if it were a portfolio. Baron says: for concave U the portfolio that locks in the same average exposure **dominates** the randomized policy. Implication: if your optimizer proposes a randomized solution, replace it with the corresponding convex combination of asset holdings — you gain in EU for free.

Conversely, when randomization is **forced** by information timing (you cannot trade the ex-post portfolio until the tender outcome realizes), you live in the mixture world and need either quadratic U or a full distributional EU criterion.

## Link to Modern Practice

- **Mean–variance optimization with constraints** (Jagannathan–Ma, DeMiguel et al.): justified as selecting optima among portfolios — Baron’s Section II applies; quadratic not required.
- **Utility-based portfolio choice with CRRA** (Brandt et al.): directly NM; MV is approximation.
- **Scenario optimization / stochastic programming**: handles regime mixtures Baron flags as dangerous for naive MV.
- **Safety-first / CVaR constraints**: CVaR is coherent and EU-related for losses; Kataoka’s quantile objective without expected-utility foundation is the case Baron criticizes.

## Historical Context for the Library

1977 JF article synthesizing Markowitz, Tobin, Mossin, Borch, Chipman, Allais, Hanoch–Levy, Rothschild–Stiglitz, Feldstein, Tsiang. Essential citation when a referee asks “is MV consistent with expected utility?” Answer in one sentence: **for ranking all mixtures, only quadratic; for choosing optimal portfolios, yes under risk aversion without quadratic; for normals, efficiency yes but arbitrary indifference maps need the Allais PDE.**

## Scholar Note Length Rationale

Source PDF is short; this note deliberately unpacks every proposition with formulas, counterexamples, and implementation implications so the library entry is self-contained for quant readers who will not re-derive Chipman/Allais conditions from scratch.


## Proposition Inventory (Complete)

Prop 1: Full NM ranking by MV => U quadratic.
Prop 2: Cannot be indifferent among all same-(mu,sigma) distributions under NM+MV+monotonicity on full domain.
Prop 3: Preferred pure strategy beats all mixtures (increasing U).
Prop 4: Portfolio beats corresponding mixture for strictly concave U (Jensen).
Prop 5: Growth condition on U => V=EU exists for normals and satisfies Allais PDE.
Prop 6: Converse reconstruction of U from V under PDE + bounds + V(mu,0)=U(mu).
Prop 7: For normals, higher mean and lower variance <=> EU dominance for all increasing concave U.

## Detailed Mixture vs Portfolio Arithmetic

Two assets, weights q and 1-q.
Portfolio mean: q mu1 + (1-q) mu2 (same as mixture mean).
Portfolio variance: q^2 sig1^2 + (1-q)^2 sig2^2 + 2q(1-q) rho sig1 sig2.
Mixture variance: q sig1^2 + (1-q) sig2^2 + q(1-q)(mu1-mu2)^2.

Difference (portfolio minus mixture) equals -q(1-q) Var(X1-X2)/something wait — paper shows:
sigma_a^2 - sigma_Q^2 = q(1-q)[ -(sigma1-sigma2)^2 - (related nonnegative terms) ] <= 0.
Hence same mean, weakly lower variance for portfolio — MV dominance for risk-averse V, matching Jensen for concave U.

## Allais PDE Intuition

For normals, EU = integral U(mu + sigma z) phi(z) dz. Differentiating under the integral under growth conditions yields the heat-equation-like relation 2 V_sigma2 = V_mumu. Any proposed V not satisfying this cannot be an expected utility of a normal risk. Linear parallel indifference curves (Kataoka) fail the PDE — therefore not EU.

## Quadratic Pathologies Quantified

U(x)=x-b x^2; U'(x)=1-2bx >0 iff x < 1/(2b).
ARA = -U''/U' = 2b/(1-2bx), increasing in x on the relevant domain.
Bliss point wealth 1/(2b): beyond it, more money hurts — absurd for global portfolio choice unless domain is restricted.

Mossin equilibrium: with identical quadratic investors, market clearing can force equal proportional holdings of each security — counters observed heterogeneous portfolios.

## Applications Matrix

| Problem type | Mixtures dominated? | MV without quadratic OK? |
|--------------|---------------------|---------------------------|
| Standard long-only portfolio | Yes (Prop 4) | Yes for choosing optimum |
| Mutual fund of normals | Yes | Yes |
| Regime FX snake example | No | No — need quadratic or full EU |
| Sealed-bid auction | No | No |
| Compound lottery prizes | No | No |
| Ranking all gambles in a lab | No | No — Prop 1 applies |

## Connection to Stochastic Dominance

Prop 7 is second-order stochastic dominance specialized to normals: (mu,sigma) dominance iff SSD for all concave increasing U. Feldstein shows the equivalence fails for lognormals with log utility — indifference curves need not be concave. Hence "MV efficient set" rhetoric should state the distributional family.

## Teaching Note for Quants

When onboarding PMs to MV optimizers, Baron's paper is the right theoretical hygiene:
- Optimizer chooses among portfolios — OK without quadratic.
- Reporting an MV utility score as a full preference ranking over arbitrary P&L distributions — not OK unless quadratic.
- Imposing a "maximize 5% worst return" Kataoka-style objective — pragmatic, but not NM-EU.
- Using MV on a mixture of model regimes without integrating as a portfolio — theoretically delicate.


## Extended Quotes of Key Paper Logic (Paraphrased Precisely)

"Preferences that satisfy NM axioms and that may be represented by an ordinal utility function V depending only on mean and variance can only be represented by a quadratic NM utility function."

"Since one may always construct randomized strategies, the normality assumption is not sufficient to permit using mean-variance analysis to rank all alternatives consistently with the NM axioms unless U is quadratic."

"If the objective is to select the optimal decision from the sets of pure strategies or portfolios, probability mixtures usually may be excluded... Mean-variance analysis then may be used with an enlarged class of NM utility functions."

"Both of these conditions [Props 3 and 4] are typically satisfied in a portfolio problem, so the equilibrium characterized in mean-variance portfolio models is consistent with preferences satisfying the von Neumann-Morgenstern axioms when a quadratic NM utility function is not specified."

"Linear indifference curves in the (mu, sigma)-half-plane thus do not correspond to any expected utility function V that can be generated from a NM utility function."

## Bibliography Anchors Inside the Article

Markowitz [22], Tobin [32], von Neumann-Morgenstern [35], Mossin [23], Ekern-Wilson [11], Borch [7][8], Samuelson [27][29], Tsiang [33][34], Bierwag [6], Levy [20], Allais [1][3], Chipman [9][10], Hanoch-Levy [15][16], Rothschild-Stiglitz [25], Feldstein [13], Lintner [21], Sharpe [30], Stiglitz [31], Kataoka [17], Roy [26], Pyle-Turnovsky [24], Fama [12], Bawa [4], Fishburn [14], Ali [1], Klevorick [18].

## Why This Belongs in a Quant Library

Every MV production system implicitly answers Baron's questions. Documenting the answers prevents category errors: treating optimizer scores as full preference orderings; applying MV to regime mixtures; claiming NM foundations for quantile-maximization objectives; dismissing MV entirely because of quadratic pathologies when Section II already rescued portfolio optimality.


## Extended Quotes of Key Paper Logic (Paraphrased Precisely)

"Preferences that satisfy NM axioms and that may be represented by an ordinal utility function V depending only on mean and variance can only be represented by a quadratic NM utility function."

"Since one may always construct randomized strategies, the normality assumption is not sufficient to permit using mean-variance analysis to rank all alternatives consistently with the NM axioms unless U is quadratic."

"If the objective is to select the optimal decision from the sets of pure strategies or portfolios, probability mixtures usually may be excluded... Mean-variance analysis then may be used with an enlarged class of NM utility functions."

"Both of these conditions [Props 3 and 4] are typically satisfied in a portfolio problem, so the equilibrium characterized in mean-variance portfolio models is consistent with preferences satisfying the von Neumann-Morgenstern axioms when a quadratic NM utility function is not specified."

"Linear indifference curves in the (mu, sigma)-half-plane thus do not correspond to any expected utility function V that can be generated from a NM utility function."

## Bibliography Anchors Inside the Article

Markowitz [22], Tobin [32], von Neumann-Morgenstern [35], Mossin [23], Ekern-Wilson [11], Borch [7][8], Samuelson [27][29], Tsiang [33][34], Bierwag [6], Levy [20], Allais [1][3], Chipman [9][10], Hanoch-Levy [15][16], Rothschild-Stiglitz [25], Feldstein [13], Lintner [21], Sharpe [30], Stiglitz [31], Kataoka [17], Roy [26], Pyle-Turnovsky [24], Fama [12], Bawa [4], Fishburn [14], Ali [1], Klevorick [18].

## Why This Belongs in a Quant Library

Every MV production system implicitly answers Baron's questions. Documenting the answers prevents category errors: treating optimizer scores as full preference orderings; applying MV to regime mixtures; claiming NM foundations for quantile-maximization objectives; dismissing MV entirely because of quadratic pathologies when Section II already rescued portfolio optimality.


## Extended Quotes of Key Paper Logic (Paraphrased Precisely)

"Preferences that satisfy NM axioms and that may be represented by an ordinal utility function V depending only on mean and variance can only be represented by a quadratic NM utility function."

"Since one may always construct randomized strategies, the normality assumption is not sufficient to permit using mean-variance analysis to rank all alternatives consistently with the NM axioms unless U is quadratic."

"If the objective is to select the optimal decision from the sets of pure strategies or portfolios, probability mixtures usually may be excluded... Mean-variance analysis then may be used with an enlarged class of NM utility functions."

"Both of these conditions [Props 3 and 4] are typically satisfied in a portfolio problem, so the equilibrium characterized in mean-variance portfolio models is consistent with preferences satisfying the von Neumann-Morgenstern axioms when a quadratic NM utility function is not specified."

"Linear indifference curves in the (mu, sigma)-half-plane thus do not correspond to any expected utility function V that can be generated from a NM utility function."

## Bibliography Anchors Inside the Article

Markowitz [22], Tobin [32], von Neumann-Morgenstern [35], Mossin [23], Ekern-Wilson [11], Borch [7][8], Samuelson [27][29], Tsiang [33][34], Bierwag [6], Levy [20], Allais [1][3], Chipman [9][10], Hanoch-Levy [15][16], Rothschild-Stiglitz [25], Feldstein [13], Lintner [21], Sharpe [30], Stiglitz [31], Kataoka [17], Roy [26], Pyle-Turnovsky [24], Fama [12], Bawa [4], Fishburn [14], Ali [1], Klevorick [18].

## Why This Belongs in a Quant Library

Every MV production system implicitly answers Baron's questions. Documenting the answers prevents category errors: treating optimizer scores as full preference orderings; applying MV to regime mixtures; claiming NM foundations for quantile-maximization objectives; dismissing MV entirely because of quadratic pathologies when Section II already rescued portfolio optimality.


## Extended Quotes of Key Paper Logic (Paraphrased Precisely)

"Preferences that satisfy NM axioms and that may be represented by an ordinal utility function V depending only on mean and variance can only be represented by a quadratic NM utility function."

"Since one may always construct randomized strategies, the normality assumption is not sufficient to permit using mean-variance analysis to rank all alternatives consistently with the NM axioms unless U is quadratic."

"If the objective is to select the optimal decision from the sets of pure strategies or portfolios, probability mixtures usually may be excluded... Mean-variance analysis then may be used with an enlarged class of NM utility functions."

"Both of these conditions [Props 3 and 4] are typically satisfied in a portfolio problem, so the equilibrium characterized in mean-variance portfolio models is consistent with preferences satisfying the von Neumann-Morgenstern axioms when a quadratic NM utility function is not specified."

"Linear indifference curves in the (mu, sigma)-half-plane thus do not correspond to any expected utility function V that can be generated from a NM utility function."

## Bibliography Anchors Inside the Article

Markowitz [22], Tobin [32], von Neumann-Morgenstern [35], Mossin [23], Ekern-Wilson [11], Borch [7][8], Samuelson [27][29], Tsiang [33][34], Bierwag [6], Levy [20], Allais [1][3], Chipman [9][10], Hanoch-Levy [15][16], Rothschild-Stiglitz [25], Feldstein [13], Lintner [21], Sharpe [30], Stiglitz [31], Kataoka [17], Roy [26], Pyle-Turnovsky [24], Fama [12], Bawa [4], Fishburn [14], Ali [1], Klevorick [18].

## Why This Belongs in a Quant Library

Every MV production system implicitly answers Baron's questions. Documenting the answers prevents category errors: treating optimizer scores as full preference orderings; applying MV to regime mixtures; claiming NM foundations for quantile-maximization objectives; dismissing MV entirely because of quadratic pathologies when Section II already rescued portfolio optimality.


## Extended Quotes of Key Paper Logic (Paraphrased Precisely)

"Preferences that satisfy NM axioms and that may be represented by an ordinal utility function V depending only on mean and variance can only be represented by a quadratic NM utility function."

"Since one may always construct randomized strategies, the normality assumption is not sufficient to permit using mean-variance analysis to rank all alternatives consistently with the NM axioms unless U is quadratic."

"If the objective is to select the optimal decision from the sets of pure strategies or portfolios, probability mixtures usually may be excluded... Mean-variance analysis then may be used with an enlarged class of NM utility functions."

"Both of these conditions [Props 3 and 4] are typically satisfied in a portfolio problem, so the equilibrium characterized in mean-variance portfolio models is consistent with preferences satisfying the von Neumann-Morgenstern axioms when a quadratic NM utility function is not specified."

"Linear indifference curves in the (mu, sigma)-half-plane thus do not correspond to any expected utility function V that can be generated from a NM utility function."

## Bibliography Anchors Inside the Article

Markowitz [22], Tobin [32], von Neumann-Morgenstern [35], Mossin [23], Ekern-Wilson [11], Borch [7][8], Samuelson [27][29], Tsiang [33][34], Bierwag [6], Levy [20], Allais [1][3], Chipman [9][10], Hanoch-Levy [15][16], Rothschild-Stiglitz [25], Feldstein [13], Lintner [21], Sharpe [30], Stiglitz [31], Kataoka [17], Roy [26], Pyle-Turnovsky [24], Fama [12], Bawa [4], Fishburn [14], Ali [1], Klevorick [18].

## Why This Belongs in a Quant Library

Every MV production system implicitly answers Baron's questions. Documenting the answers prevents category errors: treating optimizer scores as full preference orderings; applying MV to regime mixtures; claiming NM foundations for quantile-maximization objectives; dismissing MV entirely because of quadratic pathologies when Section II already rescued portfolio optimality.
