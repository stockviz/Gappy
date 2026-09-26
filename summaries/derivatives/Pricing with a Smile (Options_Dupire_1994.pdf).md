# Pricing with a Smile

**Author:** Bruno Dupire (Bloomberg)  
**Publication:** Classic reprinted essay (originally early-1990s smile work; collection pagination “11 / Pricing with a Smile”); PDF production stamp 10/08/04. Closely related to Dupire (1993b) “Pricing and Hedging with Smiles” (AFFI / IAFE).  
**Source PDF:** `Options_Dupire_1994.pdf` (Drive id `1YuRVwpGwA8lXJ9kWNAKWB_5AylhudEHX`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_2)  
**OCR:** Not required; clean `pdftotext -layout` extract (~3,283 words of source; 10 pages)

---

## 1. Problem and Motivation

Black–Scholes (1973) maps a European option price to an **implied volatility**. If the model were literally true, that implied vol would be identical for all strikes and maturities. Empirically it is not: implied vols depend strongly on both maturity (term structure) and strike (**smile**/skew).

**Term-structure paradox (Nikkei example).** ATM Nikkei 225 implied vol 20% at six months and 18% at one year cannot both be “the” constant vol of a single GBM. Merton (1973) resolves this by allowing **deterministic time-dependent** volatility $\sigma(t)$. Instantaneous forward variance is recovered so that implied variance equals the quadratic mean of instantaneous variance along the horizon. The SDE becomes

$$
\frac{dS}{S}=r(t)\,dt+\sigma(t)\,dW,
$$

with $r(t)$ the instantaneous forward rate from the yield curve. Some desks already embedded this temporal information in American/path-dependent pricers.

**Smile is harder.** Strike dependence has been attacked with jumps, stochastic volatility, or transaction costs—but those introduce **non-traded risk factors** and destroy **completeness** (unique hedge in the underlying alone). Completeness is “of the highest value”: it underwrites arbitrage pricing and hedging.

**Dupire’s question.** Given arbitrage-free European call prices $C(K,T)$ for all strikes and maturities, does there exist a risk-neutral diffusion

$$
\frac{dS}{S}=r(t)\,dt+\sigma(S,t)\,dW
$$

with **deterministic** local volatility $\sigma(S,t)$ that matches *all* smiles, while remaining a one-factor complete model? If yes, one can price/hedge Americans, barriers, compounds, and other path-dependent claims with a single consistent spot process—and know “which volatility” to use for a barrier.

---

## 2. Conceptual Setup: Densities vs Diffusions

Path-dependent prices ↔ full risk-neutral diffusion of $S$. European prices ↔ risk-neutral **marginal** densities $\varphi_T$ of $S_T$ given $S_0$.

Marginals do **not** uniquely determine a diffusion in general: e.g., a mean-reverting Gaussian and a Gaussian with declining vol can share marginals. **Restriction to risk-neutral (martingale) diffusions removes the ambiguity**: under technical conditions there is a **unique** drift-constrained diffusion compatible with the observed marginals (Figure 1 in the paper). Market European prices are then read as saying the market prices “as if” the spot followed that local-vol diffusion—not as a literal forecast that it will.

With $r=0$ for clarity, the call surface determines the density via Breeden–Litzenberger:

$$
C(K,T)=\int_0^\infty \max(S-K,0)\,\varphi_T(S)\,dS,
\qquad
\varphi_T(K)=\frac{\partial^2 C}{\partial K^2}(K,T).
$$

In practice $C(K,T)$ is smoothly interpolated from sparse quotes.

---

## 3. Model and Methods: Dupire’s Local Volatility Formula

### 3.1 Fokker–Planck inversion (Equation E)

For martingale diffusions $dx=b(x,t)\,dW$, Fokker–Planck applied to the call surface yields Dupire’s equation (paper eq. (E)):

$$
\frac{b^2(K,T)}{2}\,\frac{\partial^2 C}{\partial K^2}=\frac{\partial C}{\partial T}.
$$

Both derivatives are positive by arbitrage (butterfly ⇒ convexity in $K$; calendar ⇒ $\partial_T C>0$ absent dividends in the zero-rate setting). Therefore

$$
b^2(K,T)=\frac{2\,\partial_T C}{\partial_{KK} C},
\qquad
\sigma(S,t)=\frac{b(S,t)}{S}.
$$

Instantaneous local vol at $(S,t)=(K,T)$ is read from neighboring option prices in strike and maturity. Returning to $\mathrm{d}S/S=\sigma(S,t)\,dW$ recovers the desired coefficient.

### 3.2 Duality with Black–Scholes PDE

Classical BS PDE (zero rates), for fixed $(K,T)$, differentiating in calendar time $t$ and spot $S$:

$$
-\frac{b^2(S,t)}{2}\frac{\partial^2 C}{\partial S^2}=\frac{\partial C}{\partial t}\qquad\mathrm{(BS)}.
$$

(E) and (BS) are **dual**: (BS) runs backward in $(S,t)$ for one fixed claim; (E) runs **forward** in $(K,T)$ across the strip of calls. (BS) holds for general contingent claims; (E) exploits that call intrinsic value is the second integral of a Dirac mass—“fortunate that the market trades this particular payoff.”

### 3.3 Forward tree / forward induction algorithm

(E) implies a forward pricing algorithm: to price call $(K_0,T_0)$, build a tree **rooted at $(K_0,T_0)$**, expand **backward** to today, feed today’s intrinsic values of immediate-maturity options, then propagate **forward** by discounted expectation until the root premium is collected. Nodes carry **today’s** call values for strike/maturity equal to the node—not future values of a fixed option as in a standard tree (Figure 2).

Discrete construction prefers **forward induction** (Jamshidian 1991; Hull–White 1992), familiar from yield-curve fitting, avoiding heavy stochastic machinery.

**Degrees of freedom.** Many coefficient sets price Europeans; uniqueness needs the **martingale/risk-neutral constraint at each node**. A **trinomial** tree uses connection weights parsimoniously to achieve existence and uniqueness in discrete time; simplistic discretizations may fail.

**Trinomial details.** Equal time steps; price-step/time-step ratio large enough for local variance (CFL-like stability). If smiles are mild, equal steps in $\log S$ work; if the opening guess is too tight, widen it. Weights $w(n,i,j)$ on connections $(n,i)\to(n+1,j)$ with $j\in\{i-1,i,i+1\}$ determine path probabilities for exotics.

**Arrow–Debreu structure.** At step $n$, require correct pricing of all continuous piecewise-linear profiles with breaks at inner nodes (dimension $2n+1$), spanning zero coupon, the asset, and calls/puts struck at nodes. Arrow–Debreu price $A(n,i)$ = price of the claim paying 1 at node $(n,i)$ and 0 at other nodes of the slice—extracted from portfolios of Europeans, spot, and cash.

**Generic weight step:**

1. Compute $w(n,i,i-1)$ from $A(n+1,i-1)$, $A(n,i)$, $A(n,i-1)$, $A(n,i-2)$, and already-known neighboring weights.
2. Compute $w(n,i,i)$ and $w(n,i,i+1)$ from one-step discount factors on cash and spot (backward martingale conditions).

Figure 3 sequences forward AD updates and backward cash/spot constraints so that spanned claims remain correctly priced; some AD profiles need not be imposed explicitly because they are linear combinations of already-fitted instruments.

Alternatively: compute $b$ from continuous (E), then discretize the SDE with recombining binomial (Nelson–Ramaswamy 1990) or trinomial (Hull–White 1990) schemes.

---

## 4. Hedging Results

### 4.1 Model delta

With the full local-vol process, path-dependent claims are priced by Monte Carlo and Americans by DP. Delta = sensitivity to $S_0$ obtained by shifting the initial spot, rebuilding/inferring the process from the same European surface (or its local-vol field), and recomputing price. Delta-hedging works if the spot **actually** follows the inferred diffusion—which it will not, exactly.

### 4.2 Smile-robust (vega) projection hedge

Build a portfolio of Europeans tangential to contingent claim $X$ in the smile coordinates: matching first-order response to perturbations of the implied/local vol manifold $\sigma(K,T)$.

Procedure: bump local vol around $(K_0,T_0)$ → new diffusion → new value of $X$ → sensitivity $\mathrm{Vega}_X(K_0,T_0)$ → equivalent holding of the $(K_0,T_0)$ call. Sweeping all $(K,T)$ yields a continuous portfolio of calls—the projection of $X$ onto the traded European basis. To first order this hedge tracks $X$ even when the market **violates** the forward local vols implied by today’s surface. Rebalance periodically as the surface moves.

This is the conceptual ancestor of modern **vanilla-hedged exotic** risk management: map exotic vega to the liquid strike–maturity grid.

---

## 5. Limitations

- Assumes a pure diffusion (no jumps); real short-dated skew often needs jumps/SV.
- Needs a full smooth arbitrage-free $C(K,T)$ surface; sparse/noisy quotes make $\partial_{KK}C$ unstable—local vol extraction is an ill-posed inverse problem in practice.
- Unique local vol matches **marginals**, not smile **dynamics**; sticky-strike vs sticky-delta vs regime shifts are outside the 1994 essay’s scope.
- Zero-rate exposition; dividends and rates need the standard extensions (forward prices, duals).
- Completeness holds inside the local-vol world; model risk remains when the true world is SV.

---

## 6. Practical Takeaways for a Quant Investor

1. **Local vol is the unique one-factor diffusion calibrated to the entire European surface**—use it as the baseline complete-model engine for barriers, cliquets (with caution), Americans, and path-dependent exotics when you refuse unspanned stochastic vol.
2. **Extract $\sigma_{\mathrm{loc}}(K,T)=\sqrt{2\partial_T C/\partial_{KK}C}/K$** only from arbitrage-free smoothed surfaces; regularize butterflies and calendars explicitly.
3. **Price exotics on the forward local-vol tree / PDE**, not by plugging “the” BS vol of a matching European.
4. **Hedge exotics with a strip of vanillas** (Dupire’s vega projection), not with spot delta alone; rebalance as the smile moves.
5. **Interpret, don’t literalize:** markets price Europeans *as if* local vol; spot will violate it—hence robust vanilla overlays.
6. **Still use SV/jumps** when the risk is forward smile dynamics (e.g., forward-starting options); local vol alone mis-represents those.
7. **Nikkei-style term structure** is the easy Merton $\sigma(t)$ case; the essay’s contribution is the strike dimension without quitting completeness.

---

## 7. Equation Sheet

$$
\varphi_T(K)=\partial_{KK}C,\qquad
\frac{b^2(K,T)}{2}\partial_{KK}C=\partial_T C,\qquad
\sigma_{\mathrm{loc}}(K,T)=\frac{b(K,T)}{K},
$$

$$
\mathrm{(BS)}\quad -\frac{b^2(S,t)}{2}\partial_{SS}C=\partial_t C,
\qquad
\frac{dS}{S}=r(t)dt+\sigma(S,t)dW.
$$

---

## 8. Expanded Implementation Notes for Desks

**Surface construction.** Collect liquid vanillas across expiries; imply BS vols; interpolate in strike with a parameterization that enforces $\partial_{KK}C>0$ (e.g., spline on total variance with convexity constraints, or SVI-like forms in modern practice). Differentiate calendars carefully near short expiries where $\partial_T C$ is noisy.

**PDE vs tree.** Many modern implementations solve the forward Dupire PDE for $C(K,T)$ or the Fokker–Planck equation for density, then price exotics with a backward PDE using $\sigma_{\mathrm{loc}}(S,t)$. The essay’s trinomial forward-induction view is equivalent in spirit and useful pedagogically: martingale constraints ↔ Arrow–Debreu fitting.

**Barrier example.** A knock-out’s price depends on hitting probabilities along paths—not only on the terminal density. Two models with the same Europeans can disagree on barriers if one is local vol and one is SV; Dupire fixes the local-vol answer uniquely among diffusions. Whether that is the *desired* answer is a model-risk choice: local vol tends to generate particular sticky-strike-like dynamics historically associated with underestimating forward skew for some products.

**Compound option.** Needs the law of $S$ at the compound’s intermediate date and the conditional future smile; local vol supplies both from today’s strip.

**Book integration.** The conclusion’s key institutional claim: once exotics are mapped to vanilla vega buckets across $(K,T)$, they sit in the same risk system as the vanilla book—essential for dealer inventory and hedges.

**Historical placement.** Dupire (1992, 1993a) on stochastic vol completeness; Dupire (1993b) conference version of smiles; Black–Scholes (1973); Merton (1973); Hull–White (1990, 1992); Jamshidian (1991); Nelson–Ramaswamy (1990). The essay is the canonical short exposition of local volatility.

---

## 9. Arbitrage Constraints and Numerical Stability

Butterfly arbitrage requires $C$ convex in $K$; calendar arbitrage (in the zero-rate non-dividend case) requires non-decreasing discounted calls in $T$. Violations make $b^2<0$ in (E). Hence any industrial Dupire engine is mostly a **surface cleaning** engine: detect negative densities, flatten bad butterflies, enforce monotonicity of total variance in $T$ for fixed $K$ where appropriate, and only then evaluate $\sigma_{\mathrm{loc}}$.

Finite-difference estimates of $\partial_{KK}C$ amplify quote noise. Practical remedies consistent with the essay’s “smooth interpolation from a few points”: fit a parametric vol surface, compute $C$ analytically from that surface, then differentiate the fit—not the raw quotes. The forward tree’s need for a sufficiently wide opening is the discrete analogue of CFL stability: too-narrow trinomial grids cannot host the local variance demanded by steep smiles.

**Risk-neutral discrete fitting** as uniqueness device deserves emphasis. Without node-by-node martingale constraints, many weight configurations match a finite set of Europeans (same under-determination as continuous non-martingale diffusions sharing marginals). Imposing correct pricing of cash and spot one step ahead at each node pins down the trinomial weights together with AD matching—Dupire’s discrete completeness program.

**Hedging P&L attribution.** Spot delta under local vol plus vanilla projection hedge yields a residual attributable to (i) jump moves, (ii) higher-order smile moves, (iii) discretization. The essay’s first-order tangential portfolio is the theoretical justification for reporting exotic risk in vanilla vega buckets—a practice now standard on derivatives desks.

---

## 10. Derivation Sketch of Equation (E) and Breeden–Litzenberger

Start from $C(K,T)=\mathbb{E}[(S_T-K)^+]$ under the risk-neutral measure (zero rates). Differentiating twice under the integral gives $\partial_{KK}C=\varphi_T(K)$. The Fokker–Planck (forward Kolmogorov) equation for the density of a driftless diffusion $dS=b(S,t)dW$ reads

$$
\partial_t \varphi = \tfrac12 \partial_{SS}\big(b^2(S,t)\varphi\big).
$$

Integrating the forward equation against the call payoff and integrating by parts (boundary terms vanish under suitable growth) produces $\partial_T C=\tfrac12 b^2(K,T)\partial_{KK}C$, which is (E). Solving for $b$ yields local vol. With nonzero rates/dividends the modern formula replaces $C$ by undiscounted calls on the forward and inserts discount factors—same logic.

**Why uniqueness among risk-neutral diffusions?** Drift is pinned by the numeraire ($r-q$ in the equity measure). Diffusion coefficient is then pinned by the density’s dynamics via Fokker–Planck. Without the drift constraint, one can reshuffle probability flow while preserving marginals (e.g., via mean reversion vs time-dependent vol). Figure 1’s Venn diagram—Processes compatible with smiles ⊃ Diffusions ⊃ Risk-neutral processes → unique sought diffusion—is the essay’s conceptual core.

**Forward vs backward pricing.** Backward BS PDE: fix claim $(K,T)$, solve for $C(S,t)$ on $t\le T$. Forward equation (E): fix today $(S_0,0)$, solve for the whole strip $C(K,T)$. Once $b$ is known, exotics that are not simple European functionals need either (i) simulation of the SDE or (ii) a backward PDE/tree with local vol coefficients. Dupire’s “forward tree rooted at $(K,T)$” is a clever way to compute many Europeans at once; exotics still need pathwise machinery.

**Arrow–Debreu numerical recipe (expanded).** Suppose nodes at step $n$ have known AD prices $A(n,\cdot)$ from the European strip. Moving to $n+1$:

- Forward: $A(n+1,j)=\sum_i A(n,i)w(n,i,j)$ (discounted if $r\neq 0$).
- Martingale on cash: $\sum_j w(n,i,j)DF = 1$ (local discount).
- Martingale on spot: $\sum_j w(n,i,j)DF\cdot S_{n+1,j}=S_{n,i}$.

Together with one forward identity tying a new AD node to predecessors, these close the system for the three trinomial weights. The essay’s ordering (Figure 3) avoids an underdetermined linear solve by sweeping left-to-right and reusing previously fixed weights.

**Robust hedge as Gateaux derivative in smile space.** Let $X(\sigma(\cdot,\cdot))$ be exotic value as functional of the local-vol field. The Gateaux derivative in direction $\mathbf{1}_{(K_0,T_0)}$ is $\mathrm{Vega}_X(K_0,T_0)$. The matching European call has vega $\mathrm{Vega}_C(K_0,T_0)$; holding $\mathrm{Vega}_X/\mathrm{Vega}_C$ calls replicates the first-order smile sensitivity. In discrete trading buckets this is the vanilla ladder hedge. Residual second-order (volga/vanna across buckets) motivates periodic rebalancing—as Dupire notes.

**Completeness vs realism.** Completeness is why local vol beat early jump/SV attempts for *hedging pedagogy* in 1993–94. Empirically, equity index skew dynamics often need stochastic vol (Dupire’s own 1992/1993a work). The essay’s conclusion is carefully modest: the market prices Europeans *as if* local vol; use that for consistent exotic pricing and vanilla-integrated risk, not as a physical law.

**Checklist for a local-vol production system.** (1) Arbitrage-free surface. (2) Stable $\sigma_{\mathrm{loc}}$. (3) PDE/MC engine. (4) Vanilla vega map for each exotic. (5) Daily P&L explain: delta, vanilla-hedge, residual. (6) Model-risk overlay for products sensitive to forward smile (use SV comparison). This checklist is the operational reading of Sections “A New Way to Compute Price,” “Hedging,” and “Conclusion.”

---

## 11. Worked Conceptual Examples

**Example 1 — Barrier knock-out.** European calls at all $K,T$ fix $\varphi_T$ and, under local vol, the full diffusion. A down-and-out call’s value equals discounted expected payoff on paths that never hit the barrier. Local vol supplies path probabilities via the SDE $dS/S=r\,dt+\sigma_{\mathrm{loc}}(S,t)dW$. Using a single BS vol (e.g., ATM or barrier-matching European) generally misprices because the barrier contract depends on local behavior near the barrier level—precisely $\sigma_{\mathrm{loc}}(B,t)$—not on an average implied vol.

**Example 2 — Compound option.** A call-on-call needs the distribution of $S$ at the compound exercise date and the then-prevailing option surface. Local vol evolves the surface deterministically as a function of spot (sticky local-vol dynamics). That may understate future skew uncertainty; Dupire’s robust vanilla hedge still protects first-order against surface shocks even when the local-vol dynamics are wrong.

**Example 3 — Nikkei term structure only.** If smile were flat in strike but 20% at 6M and 18% at 12M, Merton $\sigma(t)$ suffices: solve $\int_0^{0.5}\sigma(t)^2dt=0.20^2\cdot 0.5$ and $\int_0^{1}\sigma(t)^2dt=0.18^2\cdot 1$ for piecewise constant forwards. Dupire reduces to this when $\partial_{KK}$ structure is BS-like with only $T$-dependent implied vol.

**Example 4 — Ill-posed extraction.** Two neighboring strikes with almost collinear call prices make $\partial_{KK}C\approx 0^+$ and blow up $\sigma_{\mathrm{loc}}$. Market makers must smooth; otherwise local vol spikes are numerical artifacts, not tradable beliefs. The essay’s casual phrase “smooth interpolation from a few points” is the entire job of a vol surface team.

**Example 5 — Book integration.** An exotic desk long a reverse knock-in and short a strip of vanillas chosen by Dupire vega projection should see residual P&L mostly from unhedged second-order smile moves and jumps. Spot delta alone would leave large unexplained P&L whenever the smile flexes—exactly the failure completeness-without-vanilla-hedges would produce in a non-local-vol world.

## 12. Positioning Relative to Stochastic Volatility

Dupire footnotes completeness issues for SV (1992, 1993a). SV adds at least one factor; unless that factor is traded (or diversified), markets are incomplete and uniqueness of hedge fails. Local vol keeps one Brownian motion, restores uniqueness, and fits today’s Europeans exactly (given a clean surface). The cost is unrealistic smile *dynamics*. Modern practice often uses local-stochastic-vol hybrids: a stochastic vol backbone deformed by a local-vol factor so that Europeans still match—spiritually Dupire’s program plus dynamic flexibility. The 1994 essay remains the clearest short derivation of why Europeans determine a unique diffusion coefficient once drift is fixed.

---

## 13. Extended Quant Desk Playbook (Grounded in the Essay)

**Surface ingestion.** Each morning, ingest the European board, imply BS vols, fit an arbitrage-free total-variance surface. Reject calendars and butterflies that violate the positivity needed for (E). This is the industrial form of Dupire’s “smooth interpolation from a few points.”

**Local-vol build.** Compute $\sigma_{\mathrm{loc}}(K,T)=\sqrt{2\partial_T C/\partial_{KK}C}/K$ on a dense grid in strike–maturity space; floor and cap extreme spikes; optionally solve a forward PDE for $C$ with unknown $b$ until Europeans match—equivalent calibration.

**Exotic pricing.** For barriers, Asians, compounds, Americans: run PDE or MC under $dS/S=r\,dt+\sigma_{\mathrm{loc}}(S,t)dW$. Do **not** substitute a single implied vol.

**Primary hedge.** Spot delta from finite difference on $S_0$ with surface held fixed or rebuilt consistently.

**Secondary hedge (essay’s distinctive contribution).** Bump each vanilla bucket, reprice exotic, form vega ratios, trade the matching European strip. Rebalance when bucket exposures drift.

**P&L explain.** Decompose into delta, vanilla-hedge, residual. Persistent residual correlated with jump events ⇒ escalate to SV/jump models (Dupire’s own completeness papers).

**Governance.** Document that exotic marks assume the unique risk-neutral diffusion calibrated to vanillas; model risk committee must approve products whose value is sensitive to forward smile not spanned by that assumption.

**Why completeness mattered historically.** In the early 1990s, many smile models destroyed the BS hedging paradigm. Dupire restored a one-factor complete world that still fitted the smile—hence “Pricing with a Smile” as a manifesto for arbitrage desks.

**Rates and dividends.** Replace $S$ by the forward $F_t=S_te^{(r-q)(T-t)}$ in the usual way; apply Dupire in forward coordinates; translate local vol back to spot coordinates. The essay’s zero-rate exposition is pedagogical, not a limitation of the method.

**Discrete vs continuous.** Trinomial forward induction and continuous formula (E) are two views of one object. Use continuous formula for analytics and PDE coefficients; use discrete AD fitting when embedding in existing tree infrastructure for callable/path-dependent rates–equity hybrids.

**Final essay sentence, operationalized.** “Fully integrated into a book of standard European options” means: every exotic carries a European vega vector in the same risk system as vanillas, updated as $\sigma_{\mathrm{loc}}$ and the surface move. That integration is the institutional payoff of the mathematics in (E).

## 14. Additional Formulae and Discrete Algorithm Pseudo-code

Given market calls $C^{\mathrm{mkt}}(K_j,T_\ell)$:
1. Interpolate to smooth $C(K,T)$.
2. For each grid node $(K,T)$: $b^2(K,T)=2 C_T/C_{KK}$; $\sigma_{\mathrm{loc}}=b/K$.
3. Simulate or PDE-solve exotics with that $\sigma_{\mathrm{loc}}$.
4. For hedge bucket $u=(K_u,T_u)$: $\sigma_{\mathrm{loc}}\leftarrow\sigma_{\mathrm{loc}}+\varepsilon 1_u$; reprice exotic and call $u$; set $w_u=\partial_\varepsilon X/\partial_\varepsilon C_u$.
5. Hold $\sum_u w_u$ units of call $u$ plus delta in spot.

Trinomial step (essay):
```
for n in 0..N-1:
  for i in nodes:
    solve w(n,i,i-1) from AD forward identity using known neighbors
    solve w(n,i,i), w(n,i,i+1) from cash & spot martingale constraints
  update A(n+1, ·) from A(n,·) and weights
```
Existence requires wide enough opening; uniqueness comes from martingale constraints + AD matching—the discrete echo of “unique risk-neutral diffusion.”

---

## 15. Historical and Pedagogical Significance

“Pricing with a Smile” is one of the most cited short expositions in derivatives. Its achievement is conceptual compression: Breeden–Litzenberger densities, Fokker–Planck inversion, BS duality, forward trees, and smile-robust hedging in ten pages. For a quant investor who will never code a trinomial AD engine, the lasting lessons are: (1) Europeans determine a unique local-vol diffusion under risk-neutrality; (2) use that diffusion to mark path-dependent books consistently; (3) hedge exotics with vanillas mapped by vega projection; (4) never confuse fitting today’s smile with knowing tomorrow’s smile dynamics. Those four points are necessary and sufficient as an executive reading of Dupire (1994).

---

## 16. Concise Executive Recap

Dupire shows that a complete one-factor diffusion with deterministic local volatility $\sigma(S,t)$ can be read off the European call surface via $b^2=2\partial_T C/\partial_{KK}C$, uniquely among risk-neutral diffusions. That process prices path-dependent and American claims consistently with vanillas and supports a first-order hedge by a continuum of Europeans. Completeness is preserved; smile dynamics remain a model risk. For quant investors: calibrate local vol from a clean surface, mark exotics accordingly, hedge with vanilla vega maps, and escalate to SV when forward smile risk dominates.

**Word-count note:** Summary expanded from full 10-page essay including all displayed equations (E), (BS), Arrow–Debreu weight algorithm, and hedging construction.
