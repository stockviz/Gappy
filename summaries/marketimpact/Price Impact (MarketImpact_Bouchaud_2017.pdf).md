# Price Impact

**Authors:** Jean-Philippe Bouchaud (Capital Fund Management)  
**Publication:** Encyclopedia / handbook chapter style entry titled “PRICE IMPACT”; arXiv:0903.2428v1 [q-fin.TR] 13 Mar 2009; this PDF revision dated August 24, 2017 (LaTeX/hyperref build). Related fuller survey: Bouchaud–Farmer–Lillo in *Handbook of Financial Markets: Dynamics and Evolution* (2009).  
**Source PDF:** `MarketImpact_Bouchaud_2017.pdf` (Drive id `1GLYqgq9wGgBh2SVcPgYpVtu-NkUm5vDs`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_4)  
**Extraction:** `pdftotext -layout` OK (~3,708 words source; 11 pages). No OCR required. Summary expands equations and empirical calibrations from the chapter for practitioner use.

---

## 1. Motivation: What Is Price Impact?

Price impact is the correlation between an incoming order (buy or sell) and the subsequent price change. Empirically it is obvious and costly: a trader’s second buy is on average more expensive than the first because of own impact. Monitoring and controlling impact is one of the most active research domains inside trading firms. Two organizing questions: (i) **volume dependence**—do larger trades impact more?; (ii) **temporal behaviour**—is impact immediate and permanent, or lag-dependent?

Conceptually, impact is *not* trivial. A trade is a meeting of buyer and seller—why should price move? Bouchaud distinguishes three mechanisms that all produce positive volume–price correlation but mean different things:

1. **Forecasting / timing.** Agents successfully forecast short-term moves and trade accordingly. Correlation appears even if trades *themselves* do not move prices. Pure noise trades should then have zero impact.  
2. **Private-information revelation.** New private information causes trades; others update valuations. With anonymous markets and inability to separate informed from uninformed, *all* trades impact because each may contain private information (Glosten–Milgrom, Kyle). Impact is then both a friction *and* the channel by which information enters prices.  
3. **Mechanical / statistical.** Completely random order flow still moves prices conditional on an extra buy if the order book is held fixed (Farmer et al. 2005 zero-intelligence models). Impact is then a tautology of supply–demand fluctuations, and “information revelation” can be self-fulfilling even with zero informed traders.

Hasbrouck [2007] emphasizes for (1)–(2): “orders do not impact prices. It is more accurate to say that orders forecast prices.” Distinguishing mechanisms requires studying **volume dependence and temporal structure**, which occupy the rest of the chapter.

---

## 2. Linear Permanent Impact: The Kyle Benchmark

Kyle [1985]: insider + noise traders submit orders; market maker (MM) clears every $\Delta t$. MM’s price adjustment is linear in signed volume $\epsilon v$:

$$
\Delta p = \lambda\,\epsilon v, \tag{1}
$$

with $\lambda$ inversely related to liquidity ($\epsilon=+1$ if buy volume exceeds sell volume in the interval, else $-1$; $v=|v_b-v_s|$). Impact is **permanent**:

$$
p_T = p_0 + \lambda\sum_{n=0}^{N-1}\epsilon_n v_n,\qquad T=N\Delta t. \tag{2}
$$

Huberman–Stanzl [2004] and Farmer [2002]: if impact is permanent, **linearity is required** to preclude manipulation. For $p_t$ to be an unpredictable random walk, trade signs must be serially uncorrelated; Kyle’s insider schedules trades so that $\epsilon_n$ are uncorrelated. **Real markets violate this:** signs are correlated over long horizons (below)—so permanent linear impact is empirically untenable as a literal model.

---

## 3. Measures of Impact

### 3.1 Response function $R(T)$

$$
R(T)=E[(p_T-p_0)\cdot\epsilon_0]-E[p_T-p_0]E[\epsilon_0]. \tag{3}
$$

With negligible drift / no buy–sell asymmetry, only the first term survives. In Kyle with uncorrelated signs:

$$
R(T)=\lambda\,E[v] \tag{4}
$$

—lag-independent. Volume-conditioned response:

$$
R(T,v)=E[(p_T-p_0)\cdot\epsilon_0\mid v_0=v], \tag{5}
$$

equal to $\lambda v$ for all $T$ in Kyle. Both objects depend on aggregation scale $\Delta t$.

### 3.2 Correlation $\rho(T)$ with cumulative signed volume

$$
\rho(T)=\frac{E\bigl[(p_T-p_0)\sum_{n=0}^{N-1}\epsilon_n v_n\bigr]}{\sqrt{E[(p_T-p_0)^2]\,E\bigl[(\sum\epsilon_n v_n)^2\bigr]}}. \tag{6}
$$

Kyle $\Rightarrow\rho=1$. With fluctuating liquidity ($\lambda_t$) or news-driven quote revisions $\eta_n$ uncorrelated with trades,

$$
p_T=p_0+\lambda\sum\epsilon_n v_n+\sum\eta_n, \tag{7}
$$

$\rho$ falls below 1. Empirically, replacing $v_n$ by $v_n^\psi$ with $\psi<1$ often **raises** measured correlation—foreshadowing concave impact.

---

## 4. Empirical Facts: Impact Is Not Kyle

Two time scales matter: elementary aggregation $\Delta t$ and measurement horizon $T$.

### 4.1 Concave volume dependence

Instantaneous impact $R(T=\Delta t,v)$ is **sublinear**, well fit by

$$
R(\Delta t,v)\propto v^{\psi(\Delta t)},\qquad \psi(\Delta t)\le 1. \tag{8}
$$

- Individual trades: $\psi\simeq 0.1$–$0.3$.  
- Aggregation over thousands of trades: $\psi\to 1$, with residual concavity at large $v$ (Hasbrouck–Seppi 2001; Plerou et al. 2002).  
- $\rho(\Delta t)$ rises with $\Delta t$, exceeding **0.5** for daily stock/futures/FX returns (Evans–Lyons 2002 on FX order flow).

Small $\psi$ at trade level ⇒ price changes correlate more with **number of trades** than with volume (Jones–Kaul–Lipson). Interpretation: **discretionary trading**—large market orders submitted only when deep size sits at the best quote, endogenously mitigating impact.

**Own-trade impact** (brokerage data): concave with $\psi$ near **1/2** (Almgren et al. 2005). BARRA market-impact handbook:

$$
R(\Delta t,v)=A\,\sigma\sqrt{\frac{v}{V}}, \tag{9}
$$

with $\sigma$ volatility, $V$ volume per unit time, $A\sim O(1)$. Theoretical motivations in BARRA [1997], Grinold–Kahn [1999], Gabaix et al. [2006].

**Market-cap scaling** (Lillo–Farmer–Mantegna 2003, *Nature*): for single-trade $\Delta t$,

$$
R(\Delta t,v)\approx M^{-0.3}\,F\!\left(M^{0.3}\frac{v}{\bar v}\right), \tag{10}
$$

with $\bar v$ average volume per trade and master function $F$ power-law-like with exponent $\psi$.

### 4.2 Impact cannot be permanent

Signed order flow $\epsilon_n$ shows **long memory**: autocorrelation decays slowly over days (thousands of trades); typically $C(\ell)=E[\epsilon_n\epsilon_{n+\ell}]\sim\ell^{-\gamma}$ with $\gamma\approx 0.5<1$ for stocks (Bouchaud et al. 2009 survey). Cause: outstanding displayed liquidity is tiny relative to institutional size ⇒ trades must be **fragmented** over hours/days/weeks ⇒ persistent sign. Permanent impact (2) would then create **trends** (autocorrelated price changes), contradicting near-unpredictability of returns. Hence permanent Kyle impact is incompatible with persistent flow.

### 4.3 Transient, nonlinear impact model

Reconcile persistent flow with white-ish prices via

$$
p_T=p_{-\infty}+\lambda\sum_{n=-\infty}^{N-1}G(N-n)\,\epsilon_n v_n^{\psi}. \tag{11}
$$

$G(\ell)$ is the lag-dependent impact kernel. One can choose decaying $G$ to offset order-flow autocorrelation and keep price increments close to white noise.

With equal volumes $v_n\equiv v$: if $C(\ell)\sim\ell^{-\gamma}$ with $\gamma<1$, then $G(\ell)$ must decay as $\ell^{-\beta}$ with

$$
\beta=\frac{1-\gamma}{2}
$$

(Bouchaud–Gefen–Potters–Wyart 2004). Permanent $G(\infty)>0$ is compatible with random prices only if $\gamma>1$ (fast sign decorrelation). Measurable response $R$ relates to bare impact $G$ and $C$ by

$$
R(\ell\Delta t)=\lambda v^\psi\Bigg[G(\ell)+\sum_{0<j<\ell}G(\ell-j)C(j)+\sum_{j>0}\big(G(\ell+j)-G(j)\big)C(j)\Bigg]. \tag{12}
$$

Thus **bare** single-trade impact $G$ differs from **observed** $R$, which includes the tendency of trades to repeat in the same direction. Even with decaying $G$, both $R(T)$ and $\rho(T)$ tend to **nonzero limits** as $T\to\infty$ when $\beta=(1-\gamma)/2$.

**No-manipulation condition.** Permanent impact requires $\psi=1$ (Huberman–Stanzl). With transient impact, Gatheral [2008/9] shows $\beta+\psi\ge 1$ precludes dynamic arbitrage—so concave $\psi<1$ is admissible once impact decays.

### 4.4 Surprise-in-order-flow view

If one insists prices are strict random walks, only the **surprise** in flow can impact:

$$
\Delta p_n=\lambda v^\psi\big(\epsilon_n-E[\epsilon_n\mid I_{n-1}]\big). \tag{13}
$$

Uncorrelated $\epsilon\Rightarrow$ Kyle. With correlated signs, predictable component $E[\epsilon_n\mid I_{n-1}]$ is filtered out. Consequence (Gerig 2007): the more likely continuation ($\epsilon_n=\mathrm{sign}(E[\epsilon_n\mid I_{n-1}])$) has **smaller** impact than a reversal—otherwise trends appear. History-dependent asymmetric impact is a live microstructure research topic.

Linear autoregression

$$
E[\epsilon_n\mid I_{n-1}]=\sum_{j=1}^\infty a_j\epsilon_{n-j} \tag{14}
$$

(Hasbrouck VAR [1991] lineage) identifies the surprise model with the transient model via

$$
G(\ell)=1-\sum_{j=1}^{\ell-1}a_j. \tag{15}
$$

---

## 5. Spread and Impact as Two Sides of One Coin

Liquidity providers cannot know tomorrow’s surprise, so they quote

$$
\begin{aligned}
a_n&=p_{n-1}+\lambda v^\psi\big(1-E[\epsilon_n\mid I_{n-1}]\big),\\
b_n&=p_{n-1}+\lambda v^\psi\big(-1-E[\epsilon_n\mid I_{n-1}]\big),
\end{aligned} \tag{16}
$$

ensuring no ex-post regret (Madhavan–Richardson–Roomans 1997). Spread:

$$
S=a_n-b_n=2\lambda v^\psi. \tag{17}
$$

Hence **spread ∝ impact**. Volatility per trade $\sigma_1$ should also scale with spread; Wyart et al. [2008] confirm empirically. Clock-time volatility $\sigma=\sigma_1\sqrt{f}$ with trading frequency $f$.

---

## 6. Limitations and Open Issues

1. Chapter is a **compressed survey**, not a single new dataset paper; numerical exponents ($\psi,\gamma,\beta$) are stylized from the cited literature and vary by venue/era.  
2. Aggregation $\Delta t$ dependence of $\psi$ means “the” impact law is scale-relative—execution algos must match the horizon of the child-order schedule.  
3. Mechanical vs informational decompositions are not uniquely identified from anonymous flow alone (as the conclusion stresses).  
4. Equal-volume simplification in the $G$–$C$–$R$ algebra; volume fluctuations and liquidity fluctuations enrich the picture.  
5. Gatheral’s $\beta+\psi\ge 1$ is a no-dynamic-arbitrage constraint, not a full equilibrium model of $G$.

---

## 7. Quantitative Takeaways for Execution and Research

1. **Do not use permanent linear Kyle impact for high-frequency execution cost models** when signs are long-memory; you will invent fictitious trends and mis-estimate cost.  
2. **Default working law for metaorders:** square-root impact $R\sim\sigma\sqrt{v/V}$ ($\psi\approx 1/2$), as in BARRA/Almgren/Grinold–Kahn—consistent with own-trade studies.  
3. **Trade-level impact is nearly volume-insensitive** ($\psi\sim 0.1$–$0.3$); conditioning on displayed depth (discretionary trading) is first-order. Prefer models that emphasize **trade count** and participation rate over raw shares.  
4. **Cap-scaling:** smaller $M$ ⇒ larger impact at fixed $v/\bar v$; Lillo et al. master curve with $M^{-0.3}$ is a practical cross-sectional normalizer.  
5. **Separate bare $G$ from observed $R$.** A buy following buys should show *smaller* incremental impact (surprise view); measuring only $R$ without conditioning on predicted sign confounds liquidity and predictability.  
6. **Calibrate decay:** with $\gamma\approx 0.5$, theory wants $\beta\approx 0.25$; check Gatheral $\beta+\psi\ge 1$ (e.g., $\psi=0.5,\beta=0.5$ works; $\psi=0.5,\beta=0.25$ is on the boundary/risky).  
7. **Spread as impact gauge:** $S\approx 2\lambda v^\psi$ links posted spread to expected adverse impact; Wyart-style $\sigma_1\sim S$ is a sanity check for venue quality.  
8. **Daily aggregation:** linearized permanent models may be acceptable *after* averaging to ~daily horizons when effective $\psi\to 1$ and $\rho>0.5$—as the conclusion notes—for coarser portfolio-trading P&L attribution, not for child-order scheduling.  
9. **Agent-based models** that hard-code linear permanent impact will misrepresent both price discovery and cost; prefer transient concave specifications.  
10. **Philosophical punchline for PMs:** in anonymous electronic markets, informed and uninformed trades with similar execution style have the **same statistical impact**—so noise trading contributes to volatility even as impact remains the channel for private information.

---

## 8. Conclusion

Bouchaud’s chapter replaces the intuitive Kyle picture—linear, permanent, informationally justified impact—with the empirical synthesis of the 1990s–2000s microstructure literature: impact is **concave in volume** and **transient in time**, the latter required by long-memory order flow if prices are to remain nearly unpredictable. Spread and impact are dual; surprise conditioning reconciles predictability of flow with unpredictability of returns. For quantitative trading, the operational legacy is the square-root metaorder law, the $G$–$C$–$R$ algebra for propagator models, and the warning that “orders forecast prices” and “orders move prices” are observationally entangled in anonymous markets.

---

## 9. Worked Propagator Example and Calibration Sketch

### 9.1 From sign autocorrelation to $G$

Suppose empirically $C(\ell)\approx C_0\,\ell^{-0.5}$ for lags from a few trades to several thousand (the stock-market stylized fact cited via Bouchaud et al. 2009). The theory then requires $\beta=(1-0.5)/2=0.25$, so $G(\ell)\propto\ell^{-0.25}$ (plus possible short-lag cutoffs). The observed response $R(\ell)$ in equation (12) is *not* $G(\ell)$: the middle sum $\sum_{j<\ell}G(\ell-j)C(j)$ adds the expected continuation of same-sign flow, so $R$ typically **rises** at short lags even when bare $G$ decays. Practitioners fitting “impact curves” on raw $R(T)$ without deconvolving $C$ will overstate permanence.

Hasbrouck-style VAR coefficients $a_j$ estimated from signed trades give an equivalent route: $G(\ell)=1-\sum_{j<\ell}a_j$. If the $a_j$ sum toward 1 slowly, $G$ decays slowly—matching long-memory $C$. If a desk’s flow is more mean-reverting than the market average (e.g., two-sided market making), its own $a_j$ differ and its effective $G$ should be re-estimated on own fills, not copied from lit-market averages.

### 9.2 Square-root law: units and participation

Rewrite BARRA (9) as

$$
\frac{R}{\sigma}=\;A\sqrt{\frac{v}{V}}=A\sqrt{\pi},
$$

where $\pi=v/V$ is the participation rate over the execution window. If $A\approx 1$, a 10% participation metaorder expects about $0.32\,\sigma$ of adverse move over the window; 1% participation expects $\sim 0.1\,\sigma$. This scaling is why slicing reduces cost roughly with the square root of pace, not linearly—central to VWAP/TWAP vs. opportunistic liquidity-seeking tradeoffs. Concavity also implies that **one** large child order costs more than **many** small ones totaling the same size *only if* timing and information leakage are held fixed; in practice, stretching duration increases timing risk ($\sigma\sqrt{T}$), so optimal schedules balance impact against timing (Almgren–Chriss lineage, referenced via Almgren et al. 2005 Risk paper).

### 9.3 Why $\psi$ rises with $\Delta t$

At trade level, discretionary conditioning on book depth flattens volume dependence (small $\psi$). Over longer $\Delta t$, many trades aggregate, conditioning averages out, and the signed net flow behaves more like Kyle’s $\epsilon v$ with $\psi\to 1$. Daily $\rho>0.5$ for stocks/futures/FX (Evans–Lyons) means a large fraction of daily return variance is statistically associated with same-day signed flow—useful for TCA at the day scale, dangerous if extrapolated to claim permanent mechanical impact of each child order.

### 9.4 Cap scaling intuition

Equation (10)’s $M^{-0.3}$ prefactor and $M^{0.3}$ inside $F$ say that a trade that is a fixed fraction of advanced volume impacts more for smaller-cap names, but there is a universal shape once size is normalized. Cross-sectional TCA systems should normalize by both $\sigma$ and a liquidity scale ($\bar v$ or ADV) and allow a residual cap exponent near $-0.3$ rather than assuming one global basis-point-per-megashare number.

### 9.5 Asymmetric impact: buy after buy vs buy after sell

Under (13), expected impact of a buy when $E[\epsilon\mid I]>0$ already is $\lambda v^\psi(1-E[\epsilon\mid I])$, smaller than the unconditional $\lambda v^\psi$. A sell in that state has impact $\lambda v^\psi(-1-E[\epsilon\mid I])$ with large magnitude on the downside of the mid. Empirically this appears as reduced continuation impact and larger reversal impact. Execution algos that ignore predicted sign (e.g., from own parent-order schedule, which *is* highly predictable) will mis-forecast incremental cost of the next child.

### 9.6 Linking to limit-order adverse selection

Equation (17) says posted spread must compensate expected adverse impact of the next market order. Venues with tighter spreads must either enjoy lower $\lambda$ (deeper effective liquidity), lower typical $v^\psi$, or accept losses to informed flow. The Wyart et al. finding that volatility per trade tracks spread is the empirical counterpart: you cannot have wide random-walk volatility per trade with tiny spreads without MM losses. For venue routing, compare $S/\sigma_1$ across markets as a normalized adverse-selection metric.

### 9.7 Agent-based and econophysics implications

Zero-intelligence order-book models (Farmer–Patelli–Zovko 2005) generate mechanical impact without any information—supporting mechanism (3). Gabaix et al. (2006) link institutional trading and square-root-like impact to excess volatility. Gatheral’s no-dynamic-arbitrage criterion constrains admissible $(G,\psi)$ pairs used in pricing temporary vs permanent impact in optimal execution. Huberman–Stanzl show that *permanent* nonlinear impact invites manipulation—hence the empirical turn to transient kernels is not only statistical but no-arbitrage consistent.

### 9.8 Research program suggestions implied by the chapter

1. Estimate $C(\ell)$, fit $a_j$, build $G(\ell)$, verify that residuals $p_t-\sum G*\epsilon v^\psi$ are close to white.  
2. Test Gatheral $\beta+\psi\ge 1$ on each asset class.  
3. Compare own-metaorder $\psi$ (often ~1/2) to lit-market aggregated $\psi(\Delta t)$.  
4. Condition $R$ on predicted sign to measure asymmetric impact.  
5. Re-fit Lillo master curve across modern fragmented equity markets (dark + lit).  
6. Track whether $\gamma$ (sign memory) shortened with higher HFT—and whether $\beta$ adjusted as theory predicts.

### 9.9 What the three mechanisms imply for “alpha”

If mechanism (1) dominates, your own uninformed flow should show little lasting impact beyond mechanical book effects; if (2) dominates, all anonymous flow looks alike and your noise still moves prices; if (3) dominates, impact is a statistical book property and information content is secondary. Anonymous modern markets make (1) hard to exploit for identification, so desks should operationally assume (2)+(3): **budget impact as a cost for all flow**, and treat informational price discovery as a coupled equilibrium outcome, not a free lunch from “informed” labels.

### 9.10 Compression for PMs

- Child-order scale: expect flat-ish volume impact, condition on depth, expect sign autocorrelation.  
- Parent-order / daily scale: expect near square-root cost in participation, $\rho$ large.  
- Modeling: propagator $G*\epsilon v^\psi$ with $\psi\approx 0.5$, $\beta\approx(1-\gamma)/2$, not Kyle permanent linear.  
- Risk: impact decay does *not* mean costs vanish—$R(\infty)$ can stay positive even when $G(\infty)=0$.

---

## 10. Extended Conclusion

The lasting message of Bouchaud’s price-impact synthesis is humility about mechanism and precision about measurement. Correlation between signed order flow and returns is strong and economically central to both TCA and price discovery, but the Kyle idealization—linearity, permanence, uncorrelated signs—fails on all three empirical fronts at trading timescales. Concave, transient, history-dependent impact, tightly linked to the bid–ask spread and to long-memory order flow, is the empirically relevant object. Quantitative researchers should estimate propagators, respect Gatheral-type constraints, normalize by volatility and liquidity, and stop treating “permanent linear impact” as a harmless modeling convenience for anything finer than coarse daily attribution.

---

## 11. Glossary of Symbols and Typical Magnitudes

| Symbol | Meaning | Typical equity magnitude (order of) |
|--------|---------|--------------------------------------|
| $\lambda$ | Kyle liquidity inverse | venue-/name-specific; absorbed into $A\sigma/\sqrt{V}$ |
| $\psi$ | volume exponent | 0.1–0.3 (trade); ~0.5 (metaorder); →1 (daily agg.) |
| $\gamma$ | sign-ACF exponent | ~0.5 (slow decay) |
| $\beta$ | impact-decay exponent | ~(1−γ)/2 ≈ 0.25 if γ=0.5 |
| $\rho(\Delta t)$ | return–flow correlation | rises with $\Delta t$; >0.5 daily |
| $A$ | BARRA prefactor | O(1) |
| $M^{-0.3}$ | cap scaling | smaller caps → larger impact |

These magnitudes are **stylized** from the cited literature as reported in the chapter; any production system must re-estimate on its venue, epoch, and order-type mix.

## 12. Relation to Execution-Cost Systems

Production execution-cost models (broker TCA, BARRA MIM, IS algorithms) implicitly choose points in the $(\psi,G)$ space. A system that charges linear permanent impact on each fill will: (a) over-penalize large child orders relative to empirical concave laws; (b) ignore the reduction in incremental impact when the parent’s sign is already predictable; (c) double-count trend when signs are persistent. A system that uses square-root participation with a transient decay kernel aligned to measured $C(\ell)$ will better match Almgren-style empirical fits and Gatheral’s no-arbitrage region. The chapter’s contribution is to give the **microstructure rationale** for why those engineering choices are not ad hoc—they are the unique region consistent with long-memory flow and roughly efficient prices.

---

## 13. Detailed Walkthrough of Equation (12)

Equation (12) is the workhorse identity linking observable response $R$ to bare propagator $G$ and sign autocorrelation $C$. Fix volumes equal for clarity. The three brackets mean:

1. **$G(\ell)$** — direct remaining impact of the trade at lag 0 after $\ell$ steps.  
2. **$\sum_{0<j<\ell} G(\ell-j)C(j)$** — expected impact from intervening same-sign trades that tend to follow the initial trade because of persistence $C(j)>0$.  
3. **$\sum_{j>0}[G(\ell+j)-G(j)]C(j)$** — adjustment for the fact that trades *before* time 0 (correlated with $\epsilon_0$) leave residual impact that evolves between 0 and $\ell$.

If $G$ decays and $C$ is positive long-memory, term (2) can dominate early $R$, producing the empirically common pattern of $R(\ell)$ rising or flattening even while bare impact mean-reverts. Fitting a “permanent impact” to $R(\infty)$ without this decomposition attributes to permanence what is really **expected future flow**. That error inflates estimated permanent impact coefficients in reduced-form regressions of returns on concurrent signed volume.

## 14. Continuous-Time and Mathematical Finance Contact

Although the chapter is discrete-time in notation, the same logic contacts continuous-time market-impact models used in optimal execution (Gatheral’s dynamic-arbitrage paper; related Obizhaeva–Wang, Alfonsi–Fruth–Schied, etc., not all cited here). The requirement $\beta+\psi\ge 1$ is the discrete analogue of conditions preventing round-trip profits from stroking the impact kernel. Huberman–Stanzl’s linearity result remains the permanent-impact benchmark that continuous-time models recover when temporary impact vanishes. Bouchaud’s survey thus sits between econophysics empirics and mathematical-finance execution theory.

## 15. Final Practitioner Checklist

1. Estimate sign ACF $C(\ell)$ on your fills and on lit prints; record $\gamma$.  
2. Build predicted sign $E[\epsilon\mid I]$ (own schedule is highly informative).  
3. Fit concave $\psi$ on metaorders (~0.5) separately from trade-level $\psi$.  
4. Deconvolve $G$ from $R$ using (12) or VAR route (14)–(15).  
5. Verify $\beta+\psi\ge 1$; if violated, your cost model admits fictional arb.  
6. Normalize by $\sigma$ and ADV; optionally apply $M^{-0.3}$ style cap residual.  
7. Cross-check $S\approx 2\lambda v^\psi$ and $\sigma_1\sim S$ across venues.  
8. Use linear permanent impact only for coarse ≥ daily attribution, never for child scheduling.  
9. Budget impact for *all* anonymous flow; do not assume zero impact for “noise” labels.  
10. Re-estimate after major microstructure regime shifts (tick size, fee regimes, HFT share).

---

## 16. Bibliographic Bridge to the 2009 Handbook Chapter

Readers needing proofs, figures, and multi-market panels should follow the in-text pointer to Bouchaud, Farmer, and Lillo (2009), “How markets slowly digest changes in supply and demand,” in *Handbook of Financial Markets: Dynamics and Evolution*. The 2017 PDF summarized here is a compact encyclopedia-style distillation of that program plus the 2004 QF “fluctuations and response” propagator paper. Empirical anchors repeatedly cited—Almgren et al. Risk 2005; Lillo–Farmer–Mantegna Nature 2003; Evans–Lyons JPE 2002; Hasbrouck–Seppi JFE 2001; Plerou et al. PRE 2002; Wyart et al. QF 2008; Jones–Kaul–Lipson RFS 1994; Madhavan–Richardson–Roomans RFS 1997—form the minimum reading list for a desk rebuilding its market-impact stack on modern data. The conceptual fork between Hasbrouck’s “orders forecast prices” and mechanical order-book impact remains the right framing question whenever a new venue or order type appears: measure $\psi(\Delta t)$, $C(\ell)$, $G(\ell)$, and $S$ vs $\sigma_1$ before importing a legacy Kyle coefficient.

In short: concave, transient, history-dependent impact is the empirically relevant object; Kyle linearity-plus-permanence is a coarse limiting description at best. Execution research, TCA, and agent-based market models should be rebuilt around propagators $G$, exponents $\psi$ and $\beta$, and the duality between spread and adverse impact rather than around a single permanent $\lambda$.

This summary preserves the chapter’s emphasis that volume dependence and temporal structure—not just the existence of a positive trade–return correlation—are what discriminate among forecasting, informational, and mechanical theories of impact, and what discipline empirically grounded execution models.
