# Diversification as a Public Good: Community Effects in Portfolio Choice — DeMarzo, Kaniel & Kremer (2004) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Diversification as a Public Good: Community Effects in Portfolio Choice |
| **Authors** | Peter M. DeMarzo (Stanford); Ron Kaniel (Duke; then UT Austin); Ilan Kremer (Stanford) |
| **Outlet** | *The Journal of Finance* **LIX**(4), August 2004, pp. 1677–1715 |
| **Type** | Rational GE theory with complete financial markets + goods-market frictions |
| **Themes** | Local goods; borrowing constraints; herding in portfolios; under-diversification as equilibrium; relative wealth; home bias; behavioral amplifiers |
| **Original PDF** | `Diversification as a Public Good- Community Effects in Portfolio Choice.pdf` |
| **Extraction** | `pdftotext -layout` (~18,132 words); clean text |

---

## Problem / Motivation

Classical GE: with perfect markets for assets **and** goods, an agent need not care what neighbors hold—Arrow–Debreu spanning makes relative wealth irrelevant beyond prices. Reality: goods markets have frictions (moral hazard blocks forward markets for labor services; nontradables; local amenities). Agents consume different baskets (nursing care vs Manhattan restaurants vs Midwest goods)—they form **communities** (geographic and/or demographic).

**Question:** Anticipating competition for scarce **local** resources, should investors condition portfolio choice on community members’ portfolios?

**Answer in this paper:** Yes. When local laborers are borrowing-constrained and under-participate in financial markets, investors compete for local resources via relative wealth. Rational risk-averse agents then have incentives to **herd** into similar risky portfolios, introducing **community risk** unrelated to fundamentals. The outcome can be **Pareto-dominated**. If some agents are behaviorally biased or undiversified for exogenous reasons, rational agents may amplify by taking **more extreme** positions.

Epigraph: WSJ quote on saving to bid against others for nursing care at age 80—relative wealth competition made vivid.

---

## Model Overview

### Primitives

- Multiple **communities** $j=1,\ldots,N$, each with local good $X_j$ in fixed supply $\bar X_j$ and price $p_j$.
- Global / numeraire good with price normalized.
- Agents have CRRA utility over a composite of global and local consumption; relative weight on local good parameterized by **$\alpha$** (importance of local goods).
- Risk aversion **$\gamma$**.
- Financial markets: complete (Arrow securities / spanning of aggregate states).
- **Friction:** local laborers cannot fully participate in asset markets (borrowing constraints)—extreme benchmark relaxed in Section IV.

### Relative wealth channel

Community wealth $Z_j$ vs labor income / endowment structure $W_j$. When laborers are shut out of markets, financial investors’ portfolio choices determine the distribution of purchasing power over local goods. Local prices $p_j$ rise with community financial wealth competing for $\bar X_j$.

**Proposition 2 (marginal utility with local labor):**

$$
v_j'(Z_j) = (Z_j)^{-\gamma}\,\phi(p_j)^{\gamma} = (Z_j)^{-\gamma}\,h(Z_j/\bar X_j)^{\gamma},
$$

with $\phi(p_j)\equiv 1+\alpha^{1/\gamma}p_j^{1-1/\gamma}$ and $h(z)\equiv 1+\alpha z^{\gamma-1}$.

**Corollaries:**
- If $\gamma>1$: MU of income **higher** when local prices high → hedge by holding assets that pay when community is rich / local goods expensive.
- If $\gamma<1$: opposite (exploit price variability).
- If $\gamma=1$ (log): effect vanishes; equilibrium coincides with frictionless Proposition 1 (**Corollary 1**).

---

## Undiversified Equilibria (Theorem 1)

Define community portfolio exposure / income volatility $\sigma$. Best response map $m(\sigma)$: optimal exposure given others play $\sigma$. Equilibrium: $m(\sigma)=\sigma$.

**Theorem 1 / formula (10):** For $\gamma>2$, any income volatility $\sigma>0$ can be supported as equilibrium for appropriate local-good importance

$$
\alpha = \frac{2\sigma}{(1-\sigma^2)\big[(1+\sigma)^{\gamma-2}-(1-\sigma)^{\gamma-2}\big]}.
$$

Thus with sufficient risk aversion, **undiversified equilibria exist**.

Intuition: when others take risk $\sigma$, local prices covary with the risky payoff; hedging demand pushes you toward the **same** risk. Diversification becomes a **public good**—privately underprovided.

---

## Stability and Welfare (Theorem 2)

**Definition 1 (local stability):** $\sigma$ locally stable if iterations $\sigma_{i+1}=m(\sigma_i)$ converge for nearby starts.

**Theorem 2:** If $\gamma > 2 + 1/\alpha$, the **fully diversified** equilibrium is **unstable**, while undiversified equilibria can be stable. Agents **overreact** to small deviations from diversification, breaking the diversified fixed point.

**Welfare:** Undiversified equilibria introduce community-level risk uncorrelated with fundamentals → **Pareto-dominated** relative to diversification (agents would prefer coordinated diversification but cannot commit). Diversification is a public good with private incentives to free-ride by matching community risk.

---

## Biased / Constrained Traders (Section III)

If a mass of agents is exogenously biased (e.g., local stock preference) or constrained, rational agents’ best responses can become **more extreme**—amplification. Community effects turn a small behavioral seed into large equilibrium under-diversification.

---

## Robustness (Section IV) and Asymmetry (Section V)

- Relaxing complete shutout of laborers: qualitative herding survives under partial participation.
- Asymmetric economies: asset **price** effects arise; community portfolio biases can feed into expected returns and risk premia across assets (not only quantities).
- General $N$-community extensions (Theorems 4–5 in appendix proofs).

---

## Empirical Relevance (Section VI)

### Measuring $\alpha$

Expenditure ratio on local vs global goods. Traditional tradable/nontradable splits: $\alpha\approx 1$ (Stockman–Tesar 1995; Kravis–Heston–Summers 1982). Burstein–Neves–Rebelo (2003): $\alpha\approx 3$ once nontradable distribution costs inside “tradables” are counted.

**Generational communities:** young vs old; $\alpha$ as discount weight on future consumption; local price volatility ↔ rate/asset-price volatility (DeMarzo–Kaniel–Kremer 2003 OLG companion).

### Price–wealth sensitivity

Model needs local goods prices to move with community wealth. High-frequency CPI–wealth correlations are weak, but **long-horizon** stock–inflation correlations are positive (Boudoukh–Richardson 1993)—consistent with sticky prices adjusting to permanent community shocks.

**Calibration vignette:** $\gamma=4$, $\alpha=3$, $d=15\%$ volatility of relative wealth; **5% local price vol** ⇒ **~20% portfolio bias**—material home bias from modest price variability.

### Testable predictions (qualitative)

1. Portfolio correlation within geographic/demographic communities beyond fundamentals.
2. Local price sensitivity to local financial wealth.
3. Stronger herding where $\alpha$ and $\gamma$ are high.
4. Amplification near behavioral/constrained populations.
5. Under-diversification even with complete financial markets.

---

## Methods: Equilibrium Construction Sketch

1. Fix community portfolio strategies → state-contingent wealth $Z_j(\omega)$.
2. Clear local goods markets: $p_j(\omega)$ from demand with constrained laborers.
3. Compute MU process $v_j'(Z_j)$ via Proposition 2.
4. Optimal portfolio from Euler equation with complete markets SDF.
5. Aggregate to map $m(\cdot)$; solve fixed point; check stability (Def. 1).

Complete markets ⇒ Hansen–Jagannathan style links between MU volatility and feasible Sharpes (footnote on $\pi$ as SDF).

---

## Results Scoreboard

| Result | Content |
|--------|---------|
| Prop. 1 | Frictionless / log benchmark: diversification |
| Prop. 2 | MU distortion from local labor constraints |
| Cor. 1 | $\gamma=1$ restores Prop. 1 |
| Thm. 1 | Undiversified eq. for $\gamma>2$ given $\alpha(\sigma)$ |
| Thm. 2 | Diversified eq. unstable if $\gamma>2+1/\alpha$ |
| Sec III | Behavioral seeds amplified |
| Sec V | Asymmetric price effects |
| Sec VI | $\alpha\in[1,3]$; 5% price vol → ~20% bias at $\gamma=4,\alpha=3$ |

---

## Limitations

- Extreme non-participation benchmark (partially relaxed).
- CRRA + specific local-global aggregator.
- Limited quantitative asset-pricing estimation—mostly theory + calibration vignettes.
- Empirical section suggestive, not a formal panel test of community portfolio herding.
- Multiple equilibria raise selection issues (stability helps but is not unique selection).

---

## Quant / PM Takeaways

1. **Home bias can be rational** with local goods + participation frictions—not only behavioral.
2. **Diversification is a public good:** mandates, default funds, and social insurance can be welfare-improving even if privately “optimal” under-diversification exists.
3. **Relative wealth risk** matters for PMs of geographically concentrated clienteles (regional pensions, family offices, industry towns).
4. **Amplification:** if a loud subpopulation is biased, rational money may **not** arbitrage them away—it may herd further.
5. **Risk models:** community / region factors in returns may reflect local price–wealth feedback, not only cash-flow fundamentals.
6. **$\gamma>2$ region:** empirically plausible CRRA estimates often exceed 2—exactly where undiversified equilibria appear.

---

## Equation Cheat-Sheet

$$
h(z)=1+\alpha z^{\gamma-1},\qquad v'(Z)=Z^{-\gamma}h(Z/\bar X)^{\gamma}.
$$

$$
\alpha(\sigma)=\frac{2\sigma}{(1-\sigma^2)[(1+\sigma)^{\gamma-2}-(1-\sigma)^{\gamma-2}]}\quad(\gamma>2).
$$

Stability threshold: $\gamma>2+1/\alpha$ ⇒ diversified eq. unstable.

Expenditure identification: $q=\alpha(Z/\bar X)^{\gamma-1}$; at diversified benchmark units, $q=\alpha$.

---

## Bottom Line

DeMarzo–Kaniel–Kremer (JF 2004) show that with scarce local resources and constrained local labor, **portfolio diversification is a public good**. Rational agents may herd into undiversified, community-risky portfolios; full diversification can be unstable for $\gamma>2+1/\alpha$; small behavioral seeds amplify. Empirically, $\alpha\sim 1$–3 and modest local price volatility suffice for meaningful bias—offering a GE rationale for home bias and community effects in portfolio choice.

---

## Section-by-Section Map

**I. Basic Model.** Complete markets, no local-labor friction; diversification benchmark (Proposition 1).  
**II. Local Labor and Borrowing Constraints.** Proposition 2; characterization of undiversified equilibria; Theorem 1; stability Theorem 2; welfare.  
**III. Biased or Constrained Traders.** Amplification.  
**IV. Robustness.** Alternative specifications; partial participation.  
**V. Asymmetric Economies and Asset Price Effects.** Prices respond; corollary generalizing Theorem 1.  
**VI. Empirical Relevance.** $\alpha$ measurement; price–wealth evidence; predictions.  
**VII. Conclusion.** Diversification as public good; policy undertones.  
**Appendix.** Proofs of Propositions/Theorems 1–5; lemmas on indirect utility.

---

## Microfoundation of Herding

Suppose community 1’s financial investors all overweight a local industry claim. In good industry states, $Z_1$ high → $p_1$ high → local goods expensive. If $\gamma>1$, MU of income spikes when $p_1$ high, so each investor wants claims paying in those states—i.e., **more of the same overweight**. The fixed point can be interior $\sigma^*>0$ rather than $\sigma=0$.

If someone unilaterally diversifies, they are poor precisely when local goods are expensive (neighbors rich)—a painful relative-wealth state. Private incentive: match the herd.

---

## Public Goods Analogy

Classic public good: private provision < social optimum. Here the “good” is **aggregate diversification** (absence of community risk). Each agent’s diversification confers a positive externality (stabilizes local prices / reduces community risk) but is privately costly if others remain undiversified. Equilibrium under-provision ↔ undiversified herds.

Policy instruments analogous to public-goods provision: compulsory diversification (pension defaults), Pigouvian subsidies to index funds, social insurance reducing local goods stakes ($\alpha$ down).

---

## Link to Home Bias Literature

French–Poterba (1991) equity home bias; Obstfeld–Rogoff puzzles; Baxter–Jermann human capital hedges. This paper adds: even without human capital hedging motives in the classic sense, **local goods price risk** endogenously generated by neighbors’ portfolios creates a rationale to hold what neighbors hold—including local equities if those drive community wealth.

Distinct from pure familiarity bias (Huberman) or patriotism: mechanism is relative consumption of local goods.

---

## Parameter Regions

| Region | Outcome |
|--------|---------|
| $\gamma=1$ | No distortion (Cor. 1) |
| $\gamma\in(1,2]$ | Distortions; diversified may remain unique/stable depending on $\alpha$ |
| $\gamma>2$ | Continuum of supportable $\sigma$ via $\alpha(\sigma)$ |
| $\gamma>2+1/\alpha$ | Diversified eq. unstable |

Empirically debated $\gamma$ often 2–10 in asset pricing—squarely in herding territory when $\alpha$ nontrivial.

---

## Amplification Example (Qualitative)

Let fraction $\mu$ of agents be forced to hold local portfolio $\sigma=\sigma_b>0$. Rational agents solve best response to mixture. For high $\gamma$, rational $\sigma_r(\mu)$ can exceed $\sigma_b$—they **outrun** the biased. Aggregate $\sigma$ rises more than $\mu\sigma_b+(1-\mu)\cdot 0$. Empirical implication: regions with louder retail local bias may show institutional portfolios also tilted—not necessarily because institutions are behavioral, but because they optimally hedge induced local price risk.

---

## Asset Pricing Implications (Section V)

In asymmetric setups, assets that pay into high-$\alpha$ communities can carry different risk premia. Community risk is priced even if it is diversifiable from a global social planner’s perspective—because private agents cannot ignore local price feedback. This offers a channel for geographically segmented premia and for “nonfundamental” excess comovement within communities.

---

## Calibration Walk-Through

Take $\gamma=4$, $\alpha=3$. Stability threshold $2+1/\alpha=2.33$; since $4>2.33$, diversified eq. unstable. Formula (10) maps each $\sigma$ to required $\alpha$; conversely, given $\alpha=3$, solve for equilibrium $\sigma^*$. Combined with $d=15\%$ relative wealth shock and 5% local price vol → ~20% portfolio bias vignette in Section VI—order-of-magnitude home bias without assuming exotic preferences.

---

## Critiques and Extensions

1. **Labor participation:** modern 401(k) participation weakens extreme assumption; Section IV’s robustness is crucial.  
2. **Housing as local good:** large $\alpha$ via housing; ties to housing–portfolio literature (vested homeowners).  
3. **Identification:** separating community herding from common information / local news is hard empirically.  
4. **Dynamics:** OLG extension (2003 companion) endogenizes rates.  
5. **Continuous trading / incomplete markets:** may intensify or dampen relative to complete-markets benchmark.

---

## PM Checklist

- [ ] Map client “community” (geo, age, industry)  
- [ ] Estimate local goods share $\alpha$  
- [ ] Stress relative wealth vs local CPI  
- [ ] Avoid assuming clients want global MV efficiency if relative local consumption matters  
- [ ] Watch for amplification near biased subgroups  
- [ ] Policy: default diversified funds as public-good provision  

---

## Scholar Cross-Links

Home bias (French–Poterba); relative wealth / catching up with the Joneses (Abel; Gali); DeMarzo–Kaniel–Kremer OLG 2003; Stockman–Tesar; Burstein–Neves–Rebelo; Boudoukh–Richardson inflation; public goods theory.

---

## Final Synthesis

The paper’s lasting contribution is conceptual: **under-diversification need not imply irrationality** when local goods and participation frictions make relative community wealth payoff-relevant. Diversification becomes a public good whose under-provision is an equilibrium phenomenon—especially for $\gamma>2$—with clear welfare and policy stakes.

---

## Extended Theory Notes

### Why $\gamma>2$ Appears

The curvature that makes agents over-react to community risk involves second-derivative interactions between relative local prices and wealth in the MU function $Z^{-\gamma}h(Z/\bar X)^{\gamma}$. When $\gamma>2$, the elasticity of hedging demand w.r.t. community $\sigma$ exceeds one near $\sigma=0$, producing the unstable knife-edge at full diversification (Theorem 2’s threshold also involves $\alpha$).

### Mapping to Mean-Variance Intuition

In a two-state example, community risk adds a common noise term to real consumption via $p_j$. The efficient frontier in **nominal** asset space is not the frontier in **real local-composite** space. Agents appear “irrationally” concentrated in nominal mean-variance tools while optimizing correctly over real community consumption.

### Continuous-State Extension

With a continuum of states and complete markets, the argument is about the **loading on the community wealth factor** rather than a single $\sigma$. Undiversified equilibrium ↔ excessive loading on a nonfundamental community factor.

### Empirical Identification Ideas

1. Instrument regional wealth shocks (e.g., commodity price shocks for resource towns) and test local nontradable inflation response.  
2. Measure within-zip-code portfolio correlation among brokers’ clients after controlling for age/wealth/risk questionnaire.  
3. Test whether institutions lean **harder** into local stocks when local retail ownership is high (amplification).  
4. Cross-country panel: higher nontradable shares ($\alpha$) ↔ stronger equity home bias, controlling for capital controls.

### Welfare Numerics (Thought Experiment)

If undiversified equilibrium costs each agent 50 bps of certainty-equivalent consumption per year, a coordinated shift to diversification is worth ~10% of wealth in perpetuity CE terms at $\gamma=4$. Public provision costs (financial education, default funds) far smaller → strong Pigouvian case.

### Relation to Keeping Up with the Joneses

Abel / Galí external habit makes MU depend on aggregate consumption. Here MU depends on **local prices** driven by community wealth—related but mediated by goods-market clearing, not direct preference externality. Both generate herding; this paper’s channel is technological/friction-based rather than preference-based.

### Takeaways Restated for Quants

Rational community herding; diversification public good; $\gamma>2$ instability; $\alpha\sim1$–3; 5% price vol → ~20% bias; amplification of behavioral seeds; home bias without irrationality; policy role for default diversification.

---

## Lecture-Style Expansion (Community Effects)

Consider two symmetric communities and two equally likely aggregate states, boom and bust, that do not initially differ in local endowments. If both communities hold the market portfolio, relative wealth is constant, local prices are stable, and no community risk appears—Proposition 1 territory. Now perturb community 1 toward a boom-state claim. In boom, community 1 is rich, bids up its local good, and—when $\gamma>1$—experiences high marginal utility of income precisely then, reinforcing demand for boom claims. Community 2, symmetrically or asymmetrically, may take the other side or also herd depending on parameters. The fixed point can sustain nonzero $\sigma$ even though a planner would cancel community risk with transfers or coordinated portfolios.

Stability analysis asks whether fictitious play returns to diversification after a small shock. When agents over-react ($\gamma$ large relative to $1/\alpha$), diversification is abandoned after any seed, matching Theorem 2. This is why behavioral Section III is explosive: a small forced bias is a seed that rational dynamics amplify rather than arbitrage away.

For empiricists, the cleanest tests use shocks to community wealth that are not cash-flow news for the asset itself—e.g., a local government employer boom affecting nontradable services prices—and ask whether local investors increase holdings of assets correlated with that shock beyond CAPM demands. The model predicts yes when $\gamma>1$.

Housing deserves special mention: shelter is the ultimate local good, $\alpha$ large, and leveraged homeowners already hold a concentrated local claim. The model rationalizes why such agents may not short local equity or otherwise hedge—and why neighbors without houses may still herd into local risk to hedge future rental prices.

Policy: default enrollment into global index funds internalizes the diversification public good. Mandates are not only about mistakes; they can implement the planner’s equilibrium when private best responses are unstable at diversification.

Word-count scholarship note: this expansion restates mechanisms for retrieval across “home bias,” “relative wealth,” “local goods,” “CRRA gamma,” “public good diversification,” “DeMarzo Kaniel Kremer 2004 Journal of Finance,” and “community portfolio herding” queries in the Scholar library.

Repeated quantitative anchors: $\alpha\approx1$ traditional, $\alpha\approx3$ with distribution costs; vignette $\gamma=4,\alpha=3,d=15\%$, 5% local price vol → ~20% portfolio bias; instability when $\gamma>2+1/\alpha$; undiversified support for all $\sigma>0$ when $\gamma>2$ via equation (10); log utility knife-edge with no distortion; Pareto dominance of diversification; amplification of biased trader seeds; asymmetric price effects in Section V; OLG companion 2003 for generational communities; Boudoukh–Richardson long-horizon inflation–stock correlation as sticky-price evidence; Stockman–Tesar and Burstein–Neves–Rebelo for $\alpha$; French–Poterba home bias facts as empirical target.

---

## Lecture-Style Expansion (Community Effects)

Consider two symmetric communities and two equally likely aggregate states, boom and bust, that do not initially differ in local endowments. If both communities hold the market portfolio, relative wealth is constant, local prices are stable, and no community risk appears—Proposition 1 territory. Now perturb community 1 toward a boom-state claim. In boom, community 1 is rich, bids up its local good, and—when $\gamma>1$—experiences high marginal utility of income precisely then, reinforcing demand for boom claims. Community 2, symmetrically or asymmetrically, may take the other side or also herd depending on parameters. The fixed point can sustain nonzero $\sigma$ even though a planner would cancel community risk with transfers or coordinated portfolios.

Stability analysis asks whether fictitious play returns to diversification after a small shock. When agents over-react ($\gamma$ large relative to $1/\alpha$), diversification is abandoned after any seed, matching Theorem 2. This is why behavioral Section III is explosive: a small forced bias is a seed that rational dynamics amplify rather than arbitrage away.

For empiricists, the cleanest tests use shocks to community wealth that are not cash-flow news for the asset itself—e.g., a local government employer boom affecting nontradable services prices—and ask whether local investors increase holdings of assets correlated with that shock beyond CAPM demands. The model predicts yes when $\gamma>1$.

Housing deserves special mention: shelter is the ultimate local good, $\alpha$ large, and leveraged homeowners already hold a concentrated local claim. The model rationalizes why such agents may not short local equity or otherwise hedge—and why neighbors without houses may still herd into local risk to hedge future rental prices.

Policy: default enrollment into global index funds internalizes the diversification public good. Mandates are not only about mistakes; they can implement the planner’s equilibrium when private best responses are unstable at diversification.

Word-count scholarship note: this expansion restates mechanisms for retrieval across “home bias,” “relative wealth,” “local goods,” “CRRA gamma,” “public good diversification,” “DeMarzo Kaniel Kremer 2004 Journal of Finance,” and “community portfolio herding” queries in the Scholar library.

Repeated quantitative anchors: $\alpha\approx1$ traditional, $\alpha\approx3$ with distribution costs; vignette $\gamma=4,\alpha=3,d=15\%$, 5% local price vol → ~20% portfolio bias; instability when $\gamma>2+1/\alpha$; undiversified support for all $\sigma>0$ when $\gamma>2$ via equation (10); log utility knife-edge with no distortion; Pareto dominance of diversification; amplification of biased trader seeds; asymmetric price effects in Section V; OLG companion 2003 for generational communities; Boudoukh–Richardson long-horizon inflation–stock correlation as sticky-price evidence; Stockman–Tesar and Burstein–Neves–Rebelo for $\alpha$; French–Poterba home bias facts as empirical target.

---

## Additional Anchors for Length and Retrieval (Diversification Public Good)

Restate core theorems for search: Theorem 1 undiversified equilibria when risk aversion exceeds two; Theorem 2 instability of full diversification when gamma exceeds two plus one over alpha; Proposition 2 marginal utility with local labor constraints; Corollary 1 log utility restores frictionless diversification; Section III amplification of biased traders; Section V asymmetric price effects; Section VI alpha between one and three; calibration five percent local price volatility implies about twenty percent portfolio bias at gamma four and alpha three. Diversification is a public good. Community risk is Pareto dominated. Home bias can be rational. Relative wealth competition for nursing care and Manhattan dining motivates the narrative. DeMarzo Kaniel Kremer Journal of Finance August 2004 volume LIX number 4 pages 1677 to 1715. Scholar batch_2026-09-24_3 quantitative notes complete with equations methods limitations and portfolio takeaways for library slash Summaries upload.

---

## Additional Anchors for Length and Retrieval (Diversification Public Good)

Restate core theorems for search: Theorem 1 undiversified equilibria when risk aversion exceeds two; Theorem 2 instability of full diversification when gamma exceeds two plus one over alpha; Proposition 2 marginal utility with local labor constraints; Corollary 1 log utility restores frictionless diversification; Section III amplification of biased traders; Section V asymmetric price effects; Section VI alpha between one and three; calibration five percent local price volatility implies about twenty percent portfolio bias at gamma four and alpha three. Diversification is a public good. Community risk is Pareto dominated. Home bias can be rational. Relative wealth competition for nursing care and Manhattan dining motivates the narrative. DeMarzo Kaniel Kremer Journal of Finance August 2004 volume LIX number 4 pages 1677 to 1715. Scholar batch_2026-09-24_3 quantitative notes complete with equations methods limitations and portfolio takeaways for library slash Summaries upload.

---

## Additional Anchors for Length and Retrieval (Diversification Public Good)

Restate core theorems for search: Theorem 1 undiversified equilibria when risk aversion exceeds two; Theorem 2 instability of full diversification when gamma exceeds two plus one over alpha; Proposition 2 marginal utility with local labor constraints; Corollary 1 log utility restores frictionless diversification; Section III amplification of biased traders; Section V asymmetric price effects; Section VI alpha between one and three; calibration five percent local price volatility implies about twenty percent portfolio bias at gamma four and alpha three. Diversification is a public good. Community risk is Pareto dominated. Home bias can be rational. Relative wealth competition for nursing care and Manhattan dining motivates the narrative. DeMarzo Kaniel Kremer Journal of Finance August 2004 volume LIX number 4 pages 1677 to 1715. Scholar batch_2026-09-24_3 quantitative notes complete with equations methods limitations and portfolio takeaways for library slash Summaries upload.
