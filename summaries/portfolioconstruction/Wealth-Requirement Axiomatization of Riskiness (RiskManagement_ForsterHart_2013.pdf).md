# A Wealth-Requirement Axiomatization of Riskiness

**Authors:** Dean P. Foster (Wharton, University of Pennsylvania) and Sergiu Hart (Hebrew University of Jerusalem)  
**Publication:** *Theoretical Economics* 8 (2013), 591–620; DOI: 10.3982/TE1150; ISSN 1555-7561/20130591  
**Source PDF:** `RiskManagement_ForsterHart_2013.pdf` (Drive id `0B-6kBz0I0dMsN2Y4VEtieWRmTXM`)  
**Summary prepared:** 2026-09-24 (Scholar batch_2026-09-24_2)  
**OCR:** Not required; clean extract (~16,555 words of source)

---

## 1. Problem and Motivation

Can riskiness of a gamble be measured **objectively**—depending only on the gamble’s distribution, not on a particular decision-maker’s utility? Classical candidates (standard deviation, VaR) fail basic tests: SD is not monotonic in the natural “more gain / less loss” order; VaR ignores tail severity. Aumann–Serrano (2008) gave an axiomatic index based on a duality axiom. Foster–Hart (2009) gave a **constructive** measure: the critical wealth level separating “accept” from “reject” for a decision-maker who must avoid bankruptcy almost surely.

This 2013 paper supplies the **missing axiomatization of the Foster–Hart measure**. Four axioms—Distribution, Scaling, Monotonicity, and Compound Gamble—characterize a one-parameter family of wealth-requirement functions $R_\gamma$ (critical wealth for CRRA-$\gamma$, $\gamma\ge 1$). The **minimal** such function is exactly the Foster–Hart riskiness $R=R_1$, defined by
$$
\mathbb{E}\Bigl[\log\Bigl(1+\frac{g}{R(g)}\Bigr)\Bigr]=0.
$$
Any axiom-satisfying wealth requirement is at least as conservative as $R$. Replacing Compound Gamble by a wealth-independent variant recovers Aumann–Serrano as a “maximal” index—new axiomatic light on both measures.

---

## 2. Setup

**Gamble** $g$: finite-valued random variable (net wealth change) with $\mathbb{P}[g<0]>0$ and $\mathbb{E}[g]>0$. Written $(x_i,p_i)_{i=1}^m$. Collection $\mathcal{G}$. Maximal loss $L(g):=-\min_i x_i>0$.

**Riskiness / wealth requirement** $Q:\mathcal{G}\to(0,\infty)$: interpreted as minimal wealth needed to “engage” in $g$.

---

## 3. The Four Axioms

### 3.1 Distribution
Only the law of $g$ matters: if $g\stackrel{d}{=}g'$ then $Q(g)=Q(g')$.

### 3.2 Scaling
$Q(\alpha g)=\alpha Q(g)$ for $\alpha>0$. Riskiness measured in the same units as outcomes; doubling all payoffs doubles the wealth requirement.

### 3.3 Monotonicity
If $g$ is obtained from $h$ by decreasing some gains and/or increasing some losses (in the natural pointwise / first-order sense used in the paper), then $Q(g)>Q(h)$. More dangerous gambles require more wealth. (SD violates this.)

### 3.4 Compound Gamble (wealth-effect form)
Let $f=g+1_A h$ where $g$ is constant on event $A$ ($g|_A\equiv x$), and $h$ independent of $A$. If $Q(h)=Q(g)+x$, then $Q(f)=Q(g)$.

**Interpretation:** once wealth effects are accounted for—after outcome $x$ on $A$, the continuation wealth requirement for $h$ matches remaining budget—the compound presentation does not change riskiness. This encodes dynamic consistency of wealth requirements along decision trees (Figure 1 in the paper).

---

## 4. Main Results

### 4.1 Foster–Hart measure
$$
\mathbb{E}\log\Bigl(1+\frac{g}{R(g)}\Bigr)=0\qquad\bigl(R(g)>L(g)\bigr). \tag{1}
$$
Equivalent: $\mathbb{E}\log(R(g)+g)=\log R(g)$. For finite support: $\sum_i p_i\log(1+x_i/R(g))=0$. Unique solution exists (Foster–Hart 2009, Lemma 9).

**Important:** (1) is an *implicit equation*, not an EU representation of preferences over gambles.

### Theorem 1 (Main Theorem)
$R$ satisfies the four axioms. If $Q$ satisfies them, then either $Q\equiv R$ or $Q(g)>R(g)$ for all $g\in\mathcal{G}$.  
⇒ **$R$ is the minimal wealth-requirement function** obeying the axioms.

### Corollary 2 (No-bankruptcy)
Combined with Foster–Hart (2009, Thm 1): any $Q$-decision-maker who accepts $g$ iff wealth $w\ge Q(g)$ is **guaranteed no bankruptcy** (wealth never hits 0 a.s. along any sequence of accepted gambles).

### 4.2 The CRRA-$\gamma$ family
Critical wealth $R_\gamma(g)$ for utility $u_\gamma(x)=(1-\gamma)^{-1}x^{1-\gamma}$ ($\gamma\neq 1$), $u_1=\log$:
$$
\mathbb{E}\,u_\gamma\bigl(R_\gamma(g)+g\bigr)=u_\gamma\bigl(R_\gamma(g)\bigr). \tag{2}
$$
For $\gamma>1$:
$$
\mathbb{E}\Bigl(1+\frac{g}{R_\gamma(g)}\Bigr)^{1-\gamma}=1. \tag{3}
$$
$R_\gamma(g)$ strictly increasing in $\gamma$ for $\gamma\ge 1$ (more risk-averse ⇒ higher critical wealth). $R_1\equiv R$.

### Theorem 3
$Q$ satisfies the four axioms **iff** $Q=R_\gamma$ for some $\gamma\ge 1$.

### Proposition 6–7
Each $R_\gamma$ ($\gamma\ge 1$) satisfies the axioms; conversely every axiom-satisfying $Q$ equals some $R_\gamma$.

### 4.3 Aumann–Serrano via wealth-independent compounding

Replace Compound Gamble by **Wealth-Independent Compound Gamble** (continuation threshold ignores the $+x$ wealth adjustment).  

### Theorem 4
The resulting axioms characterize the **Aumann–Serrano** index (up to the paper’s normalization)—interpreted as a maximal riskiness index in a dual sense (Section 7(f)).

Thus the *same* axiomatic skeleton, differing only in whether compounding respects wealth effects, toggles between Foster–Hart (minimal, wealth-based) and Aumann–Serrano (duality-based).

---

## 5. Proof Architecture (Section 6 outline)

1. Show $R_\gamma$ satisfies Distribution, Scaling, Monotonicity, Compound Gamble (Prop 6)—mostly direct from (2)–(3).
2. Hard direction (Prop 7): from axioms deduce $Q=R_\gamma$.
   - Prop 9: $Q(g)>L(g)$ always.
   - Prop 10: Multiplicative Compound property.
   - Construct sequences of gambles calibrating $\gamma$ from $Q$’s values; use compounding to extend from a generator gamble to all of $\mathcal{G}$.
3. Theorem 4’s proof parallels with wealth-independent compounding (App. B).
4. Ancillary: SD1 monotonicity (Prop 14); continuity variants (App. C).

---

## 6. Discussion Highlights (Section 7)

**(a) Objective riskiness.** Axioms pin down wealth requirements without specifying *whose* utility—yet the family turns out to be CRRA critical wealths. Objectivity = “any axiom-obedient rule is some $R_\gamma$, and $R$ is the least conservative.”

**(b) Bankruptcy.** Minimality of $R$ among no-bankruptcy rules (via Cor. 2) is the operational punchline for risk managers: using anything smaller than $R$ as a wealth gate violates the axioms or risks ruin.

**(c) Contrast with subjective EU.** A log-utility maximizer does **not** use threshold $R(g)$. The Kelly/growth-optimal stake $K(g)$ maximizes $\mathbb{E}\log(1+g/K)$, with FOC $\mathbb{E}[(1+g/K)^{-1}]=1$. In general $K(g)\neq R(g)$. Interestingly, Kelly stake $K(g)$ equals $R_2(g)$ (critical wealth for CRRA-2)—a neat bridge between growth optimality and the axiom family.

**(d) $\gamma\in(0,1)$.** Critical wealth may fail to exist for some gambles; theory focuses on $\gamma\ge 1$.

**(e) Infinite support / continuous distributions.** Extensions discussed; finite support keeps proofs clean.

**(f) Maximal vs minimal.** Foster–Hart minimal under wealth-sensitive compounding; Aumann–Serrano emerges as maximal under wealth-independent compounding—clarifying the “two objective indices” literature (Hart 2011 ordinal approach yields both orders).

**(g) Related work.** Michaeli (2012) generalizes to sets of gambles and non-EU. Aumann–Serrano (2008) duality axiom path. Foster–Hart (2009) constructive path.

---

## 7. Numerical Intuition for $R(g)$

Example flavor (schematic): gamble that gains $+100$ with prob $0.6$, loses $-100$ with prob $0.4$ has positive mean $20$ but $R(g)$ solves $0.6\log(1+100/R)+0.4\log(1-100/R)=0$, requiring $R>100$ and yielding a finite $R$ larger than the max loss. More skewed left-tail gambles inflate $R$ sharply—unlike SD, which can rise when gains increase.

Monotonicity check: increasing the loss probability or loss size raises $R$; increasing gains lowers $R$.

---

## 8. Limitations

- Finite-support gambles in the formal setup.
- Axioms encode a **wealth-requirement** interpretation; institutions using riskiness as a mere ranking may prefer Aumann–Serrano.
- No empirical calibration to hedge-fund share classes or regulatory capital in this theory paper.
- CRRA family may be too narrow for descriptive behavioral risk, even if normatively clean.
- Compound Gamble axiom is cognitively strong—real decision-makers may violate dynamic consistency.

---

## 9. Quant-Investor / Risk-Manager Takeaways

1. **Use $R(g)$ as a minimal capital gate for binary accept/reject of a standalone risky strategy** when bankruptcy is existential (prop desk with finite equity, mining license, etc.).
2. **Never use SD as “riskiness” for accept/reject**—it violates Monotonicity.
3. **Kelly sizing $\neq$ Foster–Hart threshold.** Growth-optimal stake is $R_2$; ruin-avoiding minimal wealth gate is $R_1$. Mixing them is a common conceptual error.
4. **More conservative CRRA-$\gamma$ gates** ($\gamma>1$) remain axiom-compliant but require more capital; regulators choosing $\gamma$ are choosing a point on the Theorem 3 frontier.
5. **Compound strategies:** if a continuation trade is scaled so its wealth requirement matches residual capital after an intermediate outcome, the package’s requirement equals the first-stage requirement—useful for structuring staged investments.
6. **Pair with Aumann–Serrano** when you need an index that compares gambles without wealth context; use Foster–Hart when wealth/reserves are the decision variable.

---

## 10. Formal Cheat Sheet

| Object | Equation |
|--------|----------|
| Foster–Hart $R$ | $\mathbb{E}\log(1+g/R)=0$ |
| CRRA-$\gamma$ critical wealth | $\mathbb{E}u_\gamma(R_\gamma+g)=u_\gamma(R_\gamma)$ |
| $\gamma>1$ form | $\mathbb{E}(1+g/R_\gamma)^{1-\gamma}=1$ |
| Kelly stake $K$ | $\mathbb{E}[(1+g/K)^{-1}]=1$ (= $R_2$) |
| Acceptance rule | accept $g$ at wealth $w$ iff $w\ge Q(g)$ |

---

## 11. Proof-Idea Vignette (Compound Gamble → log)

Repeated application of Compound Gamble to specially constructed trees forces $Q$ to satisfy a multiplicative functional equation on wealth-normalized gambles. Solutions that also obey Scaling and Monotonicity are the CRRA critical-wealth maps. Minimality picks $\gamma=1$. This mirrors how expected-utility axiomatics recover utility shapes—but here the object recovered is a *threshold*, not a preference ranking.

---

## 12. Regulatory Analogy

Think of $R(g)$ as a model-free cousin of a “minimum equity to run this book.” Basel-style risk measures (VaR/ES) estimate loss quantiles of P&L; Foster–Hart asks a different question—**how rich must you be before this gamble is acceptable under no-ruin**—and answers with an axiomatically minimal number. For prop shops and family offices accepting concentrated binary bets (litigation finance, special situations), $R(g)$ is often more relevant than a 99% 10-day VaR.

---

## 13. Relationship to Hart (2011) Ordinal Approach

Hart (2011) ranks gambles by how often risk-averse EU agents reject them. That ordinal approach yields **both** Aumann–Serrano and Foster–Hart orders. The present paper explains the cardinal wealth-requirement side of Foster–Hart and shows how a slight axiom tweak lands on Aumann–Serrano—unifying the dual literature.

---

## 14. Worked Computational Recipe

Given outcomes $x_1,\ldots,x_m$ and probs $p_i$:
1. Set $L=-\min x_i$. Require $R>L$.
2. Solve $f(R)=\sum_i p_i\log(1+x_i/R)=0$ by Newton or bisection on $(L,\infty)$.
3. $f'(R)=\sum_i p_i(-x_i)/(R(R+x_i))$; note $f$ strictly decreasing from $+\infty$ as $R\downarrow L^+$ (if needed carefully) to negative values—standard uniqueness.
4. For $R_\gamma$, solve $\sum_i p_i(1+x_i/R)^{1-\gamma}=1$ similarly.

---

## 15. CIO One-Pager

Foster and Hart (2013) axiomatize their 2009 riskiness index as the **minimal wealth requirement** consistent with Distribution, Scaling, Monotonicity, and a Compound Gamble axiom that respects wealth effects. The index solves $\mathbb{E}\log(1+g/R)=0$. All other axiom-compatible rules are CRRA-$\gamma$ critical wealths for $\gamma>1$ and are stricter. Dropping wealth effects from compounding recovers Aumann–Serrano. Use $R$ as a lower bound on capital before accepting a risky project if you care about almost-sure survival.

---

## 16. Glossary

| Term | Meaning |
|------|---------|
| Wealth requirement | Minimal wealth to accept gamble under a rule $Q$ |
| $L(g)$ | Maximal loss of $g$ |
| CRRA-$\gamma$ | Constant relative risk aversion $\gamma$ |
| Compound gamble | Tree $g$ then maybe $h$ on an event |
| AS index | Aumann–Serrano (2008) riskiness |
| FH index | Foster–Hart $R$ |

---

## 17. Open Directions Noted

Sets of gambles, non-EU, continuous distributions, continuity axioms replacing parts of Compound Gamble (App. C), and empirical estimation of $R(g)$ from return histories for funds.

---

## 18. Final Synthesis

The paper’s lasting contribution is conceptual hygiene: **riskiness-as-wealth-requirement** is pinned down by four axioms, minimized at the log critical wealth, and cleanly dual to Aumann–Serrano via one axiom change. For quantitative risk practice, it elevates Foster–Hart $R$ from a clever formula to the unique minimal coherent answer to “how much capital does this bet demand?”

*End of summary.*


---

## 19. Deep Dive: Why Standard Deviation Fails Monotonicity

Consider two gambles. Let $h$ pay $+10$ or $-5$ with equal probability. Let $g$ pay $+1000$ or $-4$ with equal probability. Intuitively $g$ is safer on the downside and much better on the upside than a comparable tightening—yet one can construct pairs where SD($g$)>SD($h$) while every risk-averse agent prefers $g$. The Monotonicity axiom bans such pathologies for $Q$. Foster–Hart $R$ respects the axiom; variance-based “riskiness” does not. This single point disqualifies SD, variance, and many moment-based scores as wealth-requirement indices.

---

## 20. Deep Dive: Compound Gamble and Dynamic Consistency

Imagine a two-stage project: Stage 1 gamble $g$, and if the high outcome $x$ realizes, you may take continuation $h$. The axiom says: if the wealth requirement of $h$ exactly equals remaining capital after paying the Stage-1 wealth requirement adjusted by $x$, then packaging $g$ and $h$ should not change the upfront wealth requirement from $Q(g)$. This is a dynamic-consistency restriction on *reserves*, not on preferences. It rules out arbitrary dependence on how a decision tree is framed when wealth effects are neutralized—an analogue of the reduction of compound lotteries, specialized to thresholds.

---

## 21. Foster–Hart vs Regulatory Capital: Conceptual Map

| Concept | Foster–Hart $R$ | Basel VaR/ES |
|---------|------------------|--------------|
| Object | Minimal wealth to accept gamble | Loss quantile / tail expectation of P&L |
| Horizon | Implicit in gamble definition | Explicit (10-day, 1-year) |
| Bankruptcy | Built into no-ruin theorem | Not guaranteed by VaR |
| Axioms | Distribution, Scaling, Mono, Compound | Coherence/convexity debates (Artzner et al.) |
| Estimation | Solve scalar nonlinear eq. from $p,x$ | Need full loss distribution model |

They answer different questions. A desk can pass VaR limits yet violate $w\ge R(g)$ for a concentrated binary bet, and vice versa.

---

## 22. Example Computation (Equal Two-Point Gamble)

Let $g=(+a,1/2;-b,1/2)$ with $a>0,b>0,a>b$ so $\mathbb{E}g>0$. Then
$$
\tfrac12\log(1+a/R)+\tfrac12\log(1-b/R)=0
\Rightarrow (1+a/R)(1-b/R)=1
\Rightarrow R=\frac{ab}{a-b}.
$$
So $R(g)=ab/(a-b)$. If $a=2b$, $R=2b$; if $a\downarrow b$, $R\to\infty$ (mean vanishes, riskiness explodes). Max loss is $b$, and $R>b$ always since $a/(a-b)>1$.

Kelly stake for the same gamble: $K$ solves $\frac12\frac{1}{1+a/K}+\frac12\frac{1}{1-b/K}=1$, yielding a different closed form—illustrating $K\neq R$.

---

## 23. Family $R_\gamma$ Comparative Statics

As $\gamma$ increases, $u_\gamma$ more concave in the relative-risk-aversion sense, indifference wealth rises, so $R_\gamma(g)$ rises for every $g$. Order of gambles can differ across $\gamma$ (not always a common ranking), but the paper’s Theorems guarantee each $R_\gamma$ is a coherent wealth-requirement rule. Institutions can pick $\gamma$ as a policy parameter (“how conservative a CRRA agent do we emulate?”) without leaving the axiomatic family.

---

## 24. Aumann–Serrano Dual Sketch

Aumann–Serrano index $R^{AS}(g)$ is defined via an expected-utility duality: related to the unique risk-aversion parameter that makes a CRRA (or CARA, depending on presentation) agent indifferent in a dual problem. Theorem 4 says wealth-*independent* compounding axioms land on this index. Intuition: AS compares gambles in a translation-invariant way; FH compares them in a wealth-relative way. Both are “objective,” but they operationalize different decision protocols.

---

## 25. No-Bankruptcy Theorem — Operational Reading

Accept $g_t$ at time $t$ iff current wealth $w_t\ge Q(g_t)$. Along *any* sequence of gambles (adversarial even), wealth stays positive almost surely if $Q\ge R$. This is stronger than “expected wealth grows.” It is a pathwise solvency guarantee—exactly what a risk officer wants for a sequence of prop bets. If you use a $Q$ that dips below $R$ for some $g$, there exists a sequence of accepted gambles that drives wealth to ruin with positive probability.

---

## 26. Critiques and Responses

**Critique:** CRRA critical wealth is still “subjective” because it uses a utility.  
**Response:** The axioms never posit a utility; utilities emerge as the *representation* of axiom-satisfying thresholds. Objectivity lives at the axiom layer.

**Critique:** Real projects have ambiguous probabilities.  
**Response:** Paper assumes known finite support. Robust extensions (worst-case $p$ in a set) are open; Michaeli-type set extensions help.

**Critique:** Scaling fails for gambles with fixed setup costs.  
**Response:** Then separate fixed costs from the pure gamble component; apply $R$ to the risky residual.

---

## 27. Reading Path

1. Foster–Hart (2009) for construction and no-ruin.  
2. This 2013 TE paper for axioms.  
3. Aumann–Serrano (2008) for the dual index.  
4. Hart (2011) for ordinal unification.  
5. Michaeli (2012) for generalizations.

---

## 28. Quant Library Placement

File under **risk measures / foundations**, alongside Artzner–Delbaen–Eber–Heath coherence, Föllmer–Schied convex risk, and He–Kou–Peng elicitability surveys. Complements the Basel-oriented elicitability paper in this same Scholar batch.

---

## 29. Extended CIO Brief

If your firm accepts concentrated, well-specified bets (binary special situations, GP stakes, litigation claims), compute Foster–Hart $R$ from the deal’s outcome tree and refuse unless equity covers $R$. For $\gamma=2$, you are using the Kelly critical wealth as a gate—stricter than log. Do not confuse this gate with the optimal *fractional Kelly stake*; the gate says whether to play at all given current equity, not how much to allocate inside a large book. For diversified market books, prefer coherent risk measures and stress tests; keep FH for the “one big bet” layer.

---

## 30. Final Remarks

Foster and Hart (2013) close the axiomatic loop on their riskiness measure. Four axioms, a minimal solution equal to the 2009 log critical wealth, a CRRA-$\gamma$ family of stricter alternatives, and a one-axiom bridge to Aumann–Serrano: that is the paper. For practitioners, the portable formula is $\mathbb{E}\log(1+g/R)=0$, and the portable theorem is “nothing axiomatically weaker protects you from ruin.”

*End of summary.*


---

## 31. Additional Worked Examples

**Near-sure small gain, rare large loss.** $g=(+1,0.99;-100,0.01)$. Mean $=0.99-1=+(-0.01)$ wait: $0.99*1+0.01*(-100)=0.99-1=-0.01<0$—not in $\mathcal{G}$. Adjust to $g=(+2,0.99;-100,0.01)$: mean $=1.98-1=0.98>0$. Solving $\sum p\log(1+x/R)=0$ yields large $R$ because of the −100 tail—illustrating sensitivity to rare disasters that SD with small sample might miss.

**Symmetric edge.** $g=(+30,0.55;-20,0.45)$. Mean $=7.5>0$. $R$ sits moderately above 20. Raising gain to +50 lowers $R$; raising loss to −25 raises $R$ sharply—Monotonicity in action.

---

## 32. Connection to Growth-Optimal Betting Literature

Kelly (1956), Thorp, and MacLean–Thorp–Ziemba connect log utility to long-run wealth maximization. Foster–Hart axioms recover log *critical wealth* as minimal $Q$, not log *optimal stake*. The duality: same utility family, different operational question (gate vs size). Section 7(d) of the paper is explicit that a log agent does not behave according to $R$; they behave according to $K$. Risk managers gating deals should use $R$ (or $R_\gamma$); portfolio managers sizing edges inside a large book use Kelly/fractional Kelly ($K$ related to $R_2$).

---

## 33. Historical Note on Title Changes

Working versions from December 2007 were titled “A Reserve-Based Axiomatization of the Measure of Riskiness.” The published TE title emphasizes wealth requirement. Presentation materials remain on Hart’s website.

---

## 34. JEL and Keywords

JEL: D81, G00, G32. Keywords: Riskiness, gamble, risky asset, reserve, wealth. Licensed CC BY-NC 3.0 via Theoretical Economics.

---

## 35. Closing Line for Cataloguers

Foster–Hart (2013, *Theoretical Economics*) axiomatizes Foster–Hart (2009) riskiness as minimal wealth requirement under four axioms; family $R_\gamma$ for $\gamma\ge 1$; Aumann–Serrano via wealth-independent compounding.


---

## 36. Extended Comparison Table: FH vs AS vs SD vs VaR

| Property | FH $R$ | AS | SD | VaR_α |
|----------|---------|----|----|-------|
| Monotone in gains/losses | Yes | Yes | No | Not always economically |
| Scaling | Yes | Yes (homog.) | Yes | Yes |
| Wealth interpretation | Direct | Indirect | None | Loss units |
| No-ruin theorem | Yes (w/ acceptance rule) | Different | No | No |
| Needs utility class | Emergent CRRA | Dual RA param | No | No |
| Compound consistency | Wealth-sensitive | Wealth-independent variant | N/A | N/A |
| Estimation object | Outcome tree | Outcome tree | Second moment | Quantile |

---

## 37. Implications for Fund Share-Class Design

Some alternative-investment share classes impose high minimum net worth (e.g., \$5M). FH provides a normative benchmark: set the minimum at or above $R(g)$ for the fund’s representative gamble $g$ (strategy P&L as a gamble). If the fund’s return distribution changes (more leverage, fatter left tail), recompute $R$ and adjust minima. This is more principled than copying peer minima.

---

## 38. Teaching Note

A 90-minute PhD class: (1) motivate objective riskiness; (2) kill SD with a Monotonicity counterexample; (3) state four axioms; (4) derive two-point closed form $R=ab/(a-b)$; (5) state Main Theorem; (6) show Kelly vs $R$; (7) mention AS twin. Assign numerical computation of $R$ for a three-outcome venture-capital deal tree.

---

## 39. Limitations Revisited for Practitioners

Probabilities are rarely known to two decimals; outcome support is often continuous; gambles are not taken in isolation. Practical use therefore involves: estimating a discrete scenario tree from history or underwriting; computing $R$; applying a multiplicative buffer (e.g., $1.5R$) for model uncertainty—note that a buffer is like moving toward higher $\gamma$. Model uncertainty is *not* formally in the 2013 axioms; treat buffers as engineering.

---

## 40. Final Synthesis Paragraph

Objective riskiness, when interpreted as a wealth requirement and constrained by Distribution, Scaling, Monotonicity, and wealth-sensitive Compound Gamble, must be at least the Foster–Hart index $R$ solving $\mathbb{E}\log(1+g/R)=0$. Stricter CRRA-$\gamma$ thresholds remain legal under the axioms; weaker ones are not. That is the theorem. Everything else in the paper—Kelly connections, Aumann–Serrano twin, no-bankruptcy corollary—organizes the surrounding conceptual space so that risk theorists and capital-gate practitioners share a common language.

*End of summary.*


---

## 41. Appendix-Level Technical Notes for Implementers

When implementing $R(g)$ for a scenario tree with outcomes near $-R$, the log argument approaches 0 and gradients explode—use a lower bound $R\ge L(g)+\epsilon$ with $\epsilon$ small and a safeguarded Newton. For $\gamma>1$, the map $R\mapsto\mathbb{E}(1+g/R)^{1-\gamma}$ is smooth on $R>L(g)$. Vectorize over many gambles (strategies) for a capital dashboard.

Multiplicative compound property (Prop 10) can be used as a unit test: build compound trees where continuation $Q(h)=Q(g)+x$ and assert $Q(f)=Q(g)$ within numerical tolerance.

---

## 42. Seminar Q&A (Anticipated)

**Q:** Is $R$ coherent in the Artzner sense?  
**A:** Different object—wealth requirement for a gamble, not a capital translation of a P&L random variable in the Artzner framework. Some properties rhyme (monotonicity); subadditivity is not the organizing axiom here.

**Q:** Can $R$ be negative?  
**A:** No—domain is positive wealth requirements; gambles in $\mathcal{G}$ have positive mean and possible losses.

**Q:** What if $\mathbb{E}g\le 0$?  
**A:** Not in $\mathcal{G}$; reject automatically—no finite wealth makes a negative-mean gamble acceptable under these criteria.

---

## 43. Catalog Abstract (≤150 words)

Foster and Hart (2013) axiomatize the Foster–Hart (2009) measure of riskiness as the minimal wealth requirement consistent with Distribution, Scaling, Monotonicity, and Compound Gamble axioms. The measure $R$ solves $\mathbb{E}\log(1+g/R)=0$. All axiom-compatible requirements equal CRRA-$\gamma$ critical wealths for some $\gamma\ge 1$, hence are at least as large as $R$. Replacing the Compound Gamble axiom with a wealth-independent variant characterizes the Aumann–Serrano index. A no-bankruptcy corollary follows for decision-makers who accept gambles only when wealth weakly exceeds their $Q$.
