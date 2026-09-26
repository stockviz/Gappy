# Industry Factors and Market Factors in Equity Risk Models — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Industry Factors and Market Factors in Equity Risk Models |
| **Author** | Gregory Connor |
| **Date** | June 1999 |
| **Institution / context** | BARRA research report supporting design of GEM2 (Global Equity Model 2) |
| **Length** | ~7 pages |
| **Related literature** | Rosenberg (1974); Rosenberg & Marathe (1975); Fama & French (1992, 1993, 1995, 1998); Heston & Rouwenhorst (1994) |
| **Original PDF** | `73 Connor_  Industry Factors and Market Factors in Equity Risk Models_1999.pdf` |

Tone: internal quant research memo comparing BARRA single-country industry-dummy models, GEM1’s sequential residualization, and a constrained-regression alternative that isolates an explicit market factor for GEM2.

---

## Problem / Motivation

Although the **market factor** is almost by definition the strongest common factor in equity returns, **BARRA’s classic single-country equity risk models do not include an explicit market factor**. Instead they include a **full set of industry factor returns**. Every asset has unit exposure to one industry, or fractional exposures to several industries that sum to one. Each industry factor return can be viewed as

$$
f_j^{\text{industry}} = r_m + f_j^{\text{extra-market}},
$$

so that every asset, having unit total industry exposure, automatically inherits unit (indirect) market exposure. There is therefore “no need” for a separate market column in the design matrix.

Connor asks whether this design should be retained for the then-new **Global Equity Model (GEM2)**, or whether GEM2 should instead:

1. Include an **explicit market (or country-market) factor**, and
2. Redefine industry factors as **extra-market** industry factors via **constrained regression**.

The stakes are higher for a multi-country model than for a single-country model. In a single-country model, renaming “industry + market” as “market + extra-market industry” is nearly cosmetic: asset-specific residuals are unchanged; only Marginal Contribution to Risk (MCR) labels change. In a **global** model, isolating country market factors allows **country-based industry factors** rather than global industries, which:

- Improves fit,
- Lets most cross-country correlation ride on country-market factors,
- Shrinks the number of nonzero factor correlations that must be estimated.

The report therefore reviews (i) a time-series perspective linking industry and market decompositions, (ii) cross-sectional estimation tricks that hide or impose collinearity constraints, and (iii) product implications for GEM1 vs GEM2 and for single-country models.

---

## Setup / Data / Conceptual Framework

### Assets, market, and industries

Let there be $n$ assets with excess returns $r_{it}$ and market portfolio weights $w_i$. Market excess return is

$$
r_{mt} = \sum_{i=1}^{n} w_i r_{it}.
$$

Suppose there are $k$ industry identifiers. Capitalization-weighted industry portfolio returns are

$$
r_{jt} = \sum_{i=1}^{n} \omega_{ij} r_{it},
$$

where $\omega_{ij}$ is the cap weight of asset $i$ in industry $j$ (zero if $i \notin j$).

Connor emphasizes that the analysis is primarily **theoretical / econometric**—the memo does not report a large empirical horse race—but the motivation is grounded in BARRA’s production models (USE1 and successors; GEM1) and in the empirical finding of **Fama and French (1993)** that, once size and value are controlled, **marginal market betas are close to 1.0** for most equities. That finding is even more plausible once **industry exposures** are included.

### Two classical decompositions

**Market model (time series):**

$$
r_{it} = \alpha_i + \beta_i r_{mt} + u_{it}. \tag{1}
$$

**Pure industry model (time series):**

$$
r_{it} = \alpha_i^{*} + \beta_{i1} r_{1t} + \cdots + \beta_{ik} r_{kt} + u^{*}_{it}. \tag{2}
$$

Connor notes in passing that estimating (2) by security-level time-series regression is **statistically unreliable** for industry sensitivities: asset-specific noise swamps the signal. The purpose of writing (2) is theoretical: to clarify the link between industry and market factors.

---

## Model / Methods (with LaTeX)

### 2. Time-series perspective: why industries subsume the market

Take the pure-industry residual $u^{*}_{it}$ from (2) and run it through the market model:

$$
u^{*}_{it} = \alpha + \beta r_{mt} + u^{**}_{it}. \tag{3}
$$

**Result:** $\alpha = \beta = 0$ and $u^{**}_{it} = u^{*}_{it}$. Reason: the market return is an **exact linear combination** of the industry portfolio returns (industries partition the market). Therefore, once a full set of industry exposures is estimated, there is **no residual market beta** left to identify.

**Collinearity implication:** one cannot freely include the market index and the full set of industry portfolios in the same unrestricted regression. To estimate both market betas and “extra-market” industry exposures, one must **eliminate or hide** the singularity.

#### Indirect (sequential) constrained regression

1. Estimate the market model (1); take residuals $u_{it}$.
2. Regress those residuals on the full set of industry returns:

$$
u_{it} = \alpha_i^{*} + \beta_{i1} r_{1t} + \cdots + \beta_{ik} r_{kt} + \varepsilon_{it}. \tag{4}
$$

Because residuals from (1) are orthogonal to $r_{mt}$, and $r_{mt}$ is the cap-weighted combination of industry returns, a particular linear combination of the estimated industry coefficients in (4) is **exactly zero**. The constraint is “hidden” inside the two-step procedure—Connor calls this the **indirect method of constrained regression**.

#### Direct constrained regression

Estimate market and industries jointly with an explicit linear constraint:

$$
r_{it} = \alpha_i^{*} + \beta_i r_{mt} + \gamma_{i1} r_{1t} + \cdots + \gamma_{ik} r_{kt} + u_{it}, \tag{5}
$$

subject to

$$
\sum_{j=1}^{k} \omega_j \gamma_{ij} = 0
$$

(or another sensible linear constraint on the $\gamma$ vector). Almost any linear constraint makes (5) well-specified; for **downstream risk analytics** (especially MCR), the constraint must be economically meaningful—typically **cap-weighted (or $\sqrt{\text{cap}}$-weighted) industry factor returns sum to zero**.

### 3. Cross-sectional regression perspective

If market betas were observed without error, one could estimate the market factor return cross-sectionally:

$$
r_i = \beta_i r_m + \varepsilon_i. \tag{6}
$$

**Errors-in-variables:** betas from prior time-series regressions are noisy; that noise **biases** the estimated $r_m$. In practice one often does not need (6) because the market excess return is observed directly—but variants that add P/E or other candidate priced factors are used in CAPM tests.

#### Unit market betas

Assume $\beta_i = 1$ for all $i$. Motivation:

- Fama–French (1993): after size and value, **marginal** market sensitivities ≈ 1.
- With industries included, the assumption is even more reasonable.
- Benefit: sacrifices little fit; eliminates a large source of estimation noise.

Then (6) collapses to a regression on an intercept:

$$
r_i = 1 \cdot r_m + \varepsilon_i. \tag{7}
$$

#### Industry dummies

With 0/1 (or fractional summing to 1) industry exposures $\delta_{ij}$:

$$
r_i = \delta_{i1} f_1 + \cdots + \delta_{ik} f_k + \varepsilon_i. \tag{8}
$$

The relationship between (7) and (8) parallels (1) and (2): **perfect collinearity** in the combined design; any explanatory power in (7) is absorbed by (8).

#### Near-collinear attempt to estimate both

If one believes heterogeneous betas survive industry controls:

$$
r_i = \beta_i f_m + \delta_{i1} f_1 + \cdots + \delta_{ik} f_k + \varepsilon_i. \tag{9}
$$

Connor’s verdict: **(9) is very poorly specified in practice**. Marginal market betas (after industries and style factors) are near 1; time-series betas used as regressors add measurement error. The design has **near-perfect collinearity plus noise**—arguably the only thing preventing perfect collinearity is beta estimation error. “Not a sound foundation for a risk model.”

### Historical path dependence

- **Why no market factor in classic BARRA?** Likely Rosenberg tried something like (9), saw it fail, and switched to industry dummies (8)—a wise choice given 1970s econometrics (before Fama–French 1993 and Heston–Rouwenhorst 1994).
- **Why GEM1’s two-part procedure?** GEM1 needed **local market factors** together with **global** industry/risk-index factors. The design team tried (9) with national market indices defining betas and global industry dummies; it worked poorly (beta noise). They switched to sequential residualization—the indirect method—because **direct constrained regression for equity risk models was not yet in the finance literature** (though constrained regression itself is older).

### Proposed GEM2 approach

Estimate industry and market (country) returns **simultaneously** with the explicit constraint that the **cap-weighted (or $\sqrt{\text{cap}}$-weighted) sum of industry factor returns equals zero**. Advantages:

1. Opens model design: national industry factors **and** national market factors simultaneously.
2. Assigns (almost) all international equity correlation to **correlations among national market factors**.
3. With markets removed, one can set many **cross-country, cross-industry** correlations to **zero** (e.g., Japanese textiles vs German telecoms)—subject to empirical confirmation.
4. For **same-industry, cross-country** factors (e.g., autos), retain sample correlations if they show a positive tendency; otherwise shrink to zero. Optionally set all auto–auto correlations to a common average to reduce noise.

### Single-country implications

For single-country models the change is **almost cosmetic**: it rearranges common factor return and renames part of it “market.” Asset-specific returns are unchanged. The material change is in **Marginal Contribution to Risk**:

- **Current (industry includes market):** MCR for an industry = change in risk from increasing industry exposure **including** its embedded market exposure, holding other industries/styles fixed.
- **Extra-market industries:** MCR = change in risk from increasing industry exposure **holding market exposure constant**.

The difference is especially dramatic for **Total Risk** units vs Active Risk units.

Strategic benefit: single-country models become consistent with GEM2—aligned with BARRA’s long-term integrated product family.

---

## Results (numbers and qualitative findings)

This is a design memo rather than an empirical paper; quantitative “results” are structural:

1. **Exact nesting:** With a complete industry partition, the market is linearly dependent on industry portfolios ⇒ pure industry model residuals contain **zero** market content (equation 3).
2. **GEM1 = hidden constraint:** Sequential TS market residualization then CS industry regression implements constrained regression without writing the constraint.
3. **Unit beta + industry dummies:** Empirically supported by Fama–French-style evidence; statistically superior to noisy TS betas in CS market estimation.
4. **Specification (9) fails:** Near-collinearity + beta noise ⇒ unreliable joint estimation of market and industries without an explicit constraint.
5. **GEM2 recommendation:** Explicit country markets + constrained extra-market (preferably **local**) industries ⇒ better fit, sparser cross-country correlation matrix.
6. **Single-country:** Optional rename for product consistency; can be implemented as an **adjustment to existing models** without full re-estimation because specific returns are unchanged.

---

## Limitations

1. **No large-scale horse race** in the memo itself—recommendations rest on econometric logic, oral history (Ron Kahn on GEM1), and prior literature (Heston–Rouwenhorst).
2. **Constraint choice matters** for MCR interpretation; “almost any” linear constraint identifies parameters, but only economically sensible constraints yield usable risk attribution.
3. **Empirical confirmation still required** for which cross-country industry correlations can be zeroed vs estimated.
4. **Time-series industry betas** at the security level remain unreliable; the memo’s TS algebra is pedagogical, not a production estimation recipe.
5. **Product-management timing** for changing single-country models is left open—economically small, organizationally nontrivial.
6. Pre-dates modern machine-learning factor zoos; the collinearity lesson remains central whenever “market + complete group dummies” appear together.

---

## Quant-Investor Takeaways

1. **Never put a market factor and a complete industry dummy set in an unrestricted regression**—you will get collinearity (exact or near). Use constrained regression or sequential residualization deliberately.
2. **Industry-dummy models already embed the market.** If your risk system reports large industry MCRs for total risk, part of that is market; do not double-count when overlaying an explicit beta hedge.
3. **For global books, prefer country markets + local extra-market industries** over global industries alone. Most international correlation should sit in country factors; that sparsifies the factor covariance and improves GICS/sector hedges across borders.
4. **Unit market exposure is a feature, not a bug** in multi-factor equity models once industries/styles are present—estimating security betas as free parameters often adds noise, not signal (Fama–French 1993 intuition).
5. **MCR definitions change** when industries become extra-market. Align portfolio construction, risk budgeting, and attribution documentation with the constraint you impose.
6. **GEM1’s two-step trick is still useful** when you cannot easily code constrained CS regressions—but prefer the explicit constraint for transparency and for enabling local industries.
7. **Implementation shortcut for legacy single-country models:** re-attribute existing industry factor returns into market + extra-market industry without touching specific risk—low engineering cost for cross-product consistency.
8. **Stress-test correlation assumptions:** auto industries may share global shocks; local retail may not. Do not impose a uniform zero on all cross-country same-industry correlations without looking at sample evidence.
9. **Risk model users:** when comparing BARRA-style vs “explicit market + industries” vendors, ask how the market–industry collinearity is handled; the answer drives both fit and the meaning of industry risk contributions.
10. **Research agenda still open in 1999 (and relevant now):** optimal weights in the industry-sum constraint (cap vs $\sqrt{\text{cap}}$), empirical maps of which industry correlations survive after country factors, and communication of MCR changes to PMs.

---

## Structured Recap of Equations

| # | Role |
|---|------|
| (1) | Classical market model |
| (2) | Pure industry model |
| (3) | Shows industry residuals have no market left |
| (4) | Indirect extra-market industry regression |
| (5) | Direct constrained market + industry TS regression |
| (6)–(7) | CS market model; unit-beta special case |
| (8) | CS industry-dummy factor returns (classic BARRA) |
| (9) | Ill-posed joint CS market+industry with free betas |

---

## Conclusion (Connor’s)

BARRA’s early single-country design—full industry dummies, no explicit market—was ahead of its time: it captured market-wide movement without beta errors-in-variables. GEM1 could not use that trick for local markets + global industries, so it used sequential regressions. The modern alternative is **explicit market (country) factors + constrained extra-market industries**. For GEM2 this is a **large improvement** (local industries, sparse cross-country correlations). For single-country models it is a **small, mostly cosmetic** change with important MCR interpretation effects and product-consistency benefits.


---

## Deep Dive: Econometric Geometry of the Constraint

### Why “any” linear constraint works for identification

The design matrix of (5) or of the cross-sectional analogue combining (7) and (8) has columns that are linearly dependent: if $X_{\text{mkt}}$ is the market (or intercept) column and $X_j$ are industry columns with $\sum_j X_j = X_{\text{mkt}}$ (in the unit-exposure case), then

$$
X_{\text{mkt}} - \sum_{j=1}^{k} X_j = 0.
$$

The column space has dimension at most $k$ rather than $k+1$. Imposing one linear restriction on the coefficient vector restores full column rank (generically). Candidate restrictions include:

- $\sum_j w_j \gamma_j = 0$ (cap-weighted industry returns are extra-market),
- $\sum_j \sqrt{w_j}\,\gamma_j = 0$ (BARRA often uses root-cap weights in estimation to balance efficiency and outlier control),
- $\gamma_{k} = 0$ (drop one industry—the “dummy variable trap” fix),
- $\sum_j \gamma_j = 0$ (equal-weighted zero sum).

All identify parameters, but **only the first two** (weighted zero-sum of industry **factor returns** in the CS regression, or weighted zero-sum of industry **exposures** in the TS story) preserve the interpretation “industry = pure industry bet holding market fixed.” Dropping one industry redefines all other industries relative to the omitted industry, which pollutes MCR and hedging language.

### Mapping sequential regression to the explicit constraint

In the indirect method, step 1 projects returns orthogonal to the market. Step 2’s dependent variable $u$ satisfies $w'u = 0$ in the population (cap-weighted residual is zero if the market portfolio is the projection target). Therefore the second-step industry coefficients automatically obey a dual restriction. Explicit constrained regression writes that restriction on the parameter space instead of baking it into the dependent variable. Numerically, for linear models with a single linear constraint, the two approaches are closely related (same fitted values under correct specification); the explicit form is preferable for:

- Software clarity,
- Extending to **multiple** countries (block constraints),
- Combining with style factors without accidental double residualization.

### Heston–Rouwenhorst (1994) connection

Heston and Rouwenhorst decompose country and industry effects in international returns using a dummy-variable model with constraints so that country and industry factor returns are identified. Connor’s GEM2 proposal is in that intellectual lineage: **constrained dummy regressions** to separate overlapping group effects (country vs industry; market vs industry). The 1990s innovation was bringing that econometrics into **commercial risk models**, not inventing constrained regression per se.

---

## Deep Dive: Marginal Contribution to Risk Under Two Normalizations

Let factor covariance be $F$ and portfolio factor exposures $x$. Portfolio variance is $x'Fx$ (plus specific risk). The MCR vector is proportional to $Fx$.

**Normalization A (classic BARRA industries):** exposures $x^{\text{ind}}$ sum to 1 across industries; each industry factor embeds market. Increasing industry $j$ exposure by $\mathrm{d}x$ while decreasing another industry to keep $\sum x = 1$ is a **pure industry swap including market composition changes** only insofar as industries have different betas—but with unit market embedded everywhere, a swap across industries holds total market exposure at 1. Total-risk MCR for industries therefore mixes industry-specific and market contributions in a way that is easy to misread when PMs think “I am only trading sectors.”

**Normalization B (extra-market industries + explicit market):** exposures include $x_m$ and $x^{\text{ind}}$ with $\sum w_j x_j^{\text{ind}}$ constrained in estimation of factor returns. A PM can now:

- Scale $x_m$ (market timing / beta overlay) separately from
- Sector tilts $x^{\text{ind}}$ that are **market-neutral by construction** (in the factor-return definition).

Active-risk MCR differences between A and B are smaller when the benchmark already has unit market exposure and the active portfolio is beta-neutral; **total-risk** MCR differences are large because total risk is dominated by the market factor.

**Practical checklist for risk teams migrating A→B:**

1. Republish factor return histories as $r_m$ and $f_j^{\text{XM}} = f_j^{\text{old}} - r_m$ (or the exact constrained transform used in estimation).
2. Recompute $F$ on the transformed factors.
3. Retrain PM education: “industry risk” no longer includes market.
4. Verify that specific variances are unchanged (Connor’s invariance claim).
5. Update optimization constraints that referenced old industry MCR budgets.

---

## Deep Dive: Global Correlation Sparsity — Worked Intuition

Suppose 20 countries and 50 industries.

- **Global industry model:** 50 global industry factors. Cross-sectional estimation pools Apple and Samsung into “Tech.” Cross-country correlation of Tech is absorbed into that single factor’s variance; country effects must be captured elsewhere (country factors or multiple).
- **Local industry + country market model:** $20$ country markets + up to $20\times 50$ local industry factors (usually far fewer, via mapping). Unrestricted, the factor covariance has enormous dimension. Connor’s point: after country markets, set **cross-country, cross-industry** correlations to 0, and estimate only **same-industry, cross-country** blocks (autos–autos, banks–banks, …). Number of free correlation parameters collapses from $O((CK)^2)$ toward $O(C^2) + O(K\cdot C^2)$ in the same-industry blocks—still large, but manageable with shrinkage (average within block, Bayesian shrinkage to zero, etc.).

**Example decision rule Connor sketches:**

- Autos: sample correlations positive across markets → keep (or set to average).
- Retail: sample correlations look like zero + noise → set to 0.

This is exactly the kind of **structured covariance** thinking that later appeared in many multi-country risk platforms.

---

## Deep Dive: Unit Beta Assumption — When It Breaks

Unit market beta after industries/styles is an **empirical regularity**, not a theorem. Failure modes:

1. **Levered ETFs, options overlays, distressed names** with nonlinear payoffs.
2. **Banks and insurers** with implicit market-like exposures not captured by GICS.
3. **Double-counted industries** (ADR vs local listing) breaking the partition $\sum\delta=1$.
4. **Thin markets** where industry portfolios are dominated by one name (industry factor ≈ stock).

In those cases, allowing a free $\beta_i$ or a style factor that proxies residual beta (e.g., “beta” or “residual volatility” factors in modern BARRA) is appropriate. Connor’s warning is against using **noisy TS betas as CS regressors alongside a full industry set**—not against including a well-measured residual-beta style factor.

---

## Implementation Recipe for a Quant Risk Engineer

1. **Estimate** daily/monthly CS regression:
$$
   r_i = f_m + \sum_j \delta_{ij} f_j + \sum_s x_{is} f_s + \varepsilon_i
$$
   with $\sum_j w_j f_j = 0$ (Lagrange or restricted least squares), industries $\delta$ summing to 1, styles $x$ standardized.
2. **Build** factor covariance from $f_m, f_j, f_s$ with Newey–West or EWMA; apply Connor-style sparsity on cross-country industry blocks if multi-country.
3. **Attribute** portfolio risk to market, extra-market industries, styles, specific.
4. **Optimize** with separate constraints on $x_m$ and industry active weights.
5. **Report** MCR under the extra-market definition; footnote the constraint.

---

## Extended Comparison Table

| Feature | Classic single-country BARRA | GEM1 | Proposed GEM2 |
|--------|------------------------------|------|---------------|
| Explicit market factor | No (embedded in industries) | Yes (local), via sequential TS | Yes (local), via constrained CS |
| Industry scope | Domestic industries | Global industries | Local (country) industries preferred |
| Collinearity handling | Drop market column | Hide via residualization | Explicit linear constraint |
| Cross-country industry corr | N/A | Entangled with global industries | Mostly zero after country markets |
| Specific risk | Baseline | Baseline | Unchanged vs classic if only reparameterized |
| MCR meaning (industry) | Includes market | Mixed | Extra-market |
| Fit (global) | N/A | Weaker on local industries | Stronger |
| Engineering risk of switch | Low if reparameterize | — | Higher (new factor taxonomy) |

---

## Connections to Broader Quant Practice (1999 → today)

1. **Dummy + constraint** is the same identification strategy used in **country–industry attribution** of active returns (beyond risk models).
2. **Statistical factor models** (PCA) avoid dummy collinearity differently—by orthogonal components—but lose the clean economic labels Connor preserves.
3. **Fundamental law / risk budgeting:** separating market from industries clarifies that a large fraction of “sector risk” budgets in total-risk space were always market risk.
4. **Smart beta / industry momentum:** trading industry factors defined as extra-market produces returns closer to pure industry premia; trading classic industry factors mixes market timing.
5. **Multi-asset extensions:** the same constrained dummy logic applies to “region + sector” bond factors, “currency + local rates,” etc.

---

## Detailed Walkthrough of Equation (3)’s Claim

Start from (2). In matrix form for a fixed $t$, stack assets:

$$
r_t = \alpha^{*} + B\, r^{\text{ind}}_t + u^{*}_t.
$$

If every asset is in exactly one industry and industry portfolios are cap-weighted partitions, there exists a weight vector $w$ such that $w'r_t = r_{mt}$ and $w'B = \iota'$ (or an analogous identity for fractional industries). The OLS residual $u^{*}_t$ is orthogonal (in sample) to the column space of industries. Because $r_{mt}$ lies in that column space, $\mathrm{Cov}(u^{*}_{it}, r_{mt})=0$ in population under correct specification, so the projection of $u^{*}$ on $r_m$ is zero—hence (3) has $\beta=0$.

This is the cleanest single sentence in the memo: **full industries ⇒ market is redundant as a second factor.**

---

## Oral History Notes (as Connor reports)

- Rosenberg’s exact USE1 reasoning: “lost in the mists of time,” but the industry-dummy choice retrospectively looks brilliant given EIV problems with betas.
- GEM1 design team (per Ron Kahn): tried national markets + global industries with free betas; failed; fell back to sequential method; constrained regression not yet standard in the equity-risk literature.

These anecdotes matter for practitioners evaluating vendor methodology decks: many “innovations” are rediscoveries of constrained dummy identification.

---

## What Connor Is *Not* Saying

- He is **not** saying industry factors are unimportant.
- He is **not** saying market beta should be estimated security-by-security in the CS regression.
- He is **not** claiming single-country models are wrong—only that an explicit market is optional there and transformative for global models.
- He is **not** providing a finished GEM2 specification (factor list, half-lives, Bayesian priors)—only the architectural choice on market vs industry.

---

## Quant Checklist: Questions to Ask Your Risk Vendor

1. Do industry factor returns include market, or are they extra-market?
2. What linear constraint identifies market + industries?
3. Are industries local or global in the multi-country model?
4. Which cross-country industry correlations are estimated vs zeroed vs shrunk?
5. How do you define industry MCR for total vs active risk?
6. If I run a beta-neutral sector rotation, which factor returns should I use for ex-ante risk?
7. Were specific risks re-estimated after the last market/industry reparameterization?

---

## Final Synthesis for Portfolio Construction

If you run **global equity** with significant country and sector active weights:

- Prefer a risk model that **isolates country markets** and treats industries as **extra-market**, ideally **local**.
- Budget risk separately: country-market, industry-XM, styles, specific.
- When backtesting industry strategies, match the factor definition (embedded market vs XM)—otherwise you silently time the market.

If you run **single-country** long-only with a market benchmark:

- Classic industry-dummy models remain coherent.
- Still learn the MCR lesson: know whether “Energy MCR” includes oil’s market component.
- Aligning with the global model’s taxonomy reduces operational confusion across desks.

Connor’s 1999 memo is short, but it encodes a permanent piece of risk-model hygiene: **respect the linear dependence between the market and a complete industry partition, and choose the normalization that matches how PMs think about bets.**
