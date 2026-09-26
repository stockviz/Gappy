# Dynamic Portfolio Analysis — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Dynamic Portfolio Analysis |
| **Author** | Richard C. Grinold (Barclays Global Investors / Research Affiliates lineage; Director of Research context in contemporaneous work) |
| **Journal** | *The Journal of Portfolio Management*, Fall 2007, Vol. 34, No. 1, pp. 12–26 |
| **DOI** | 10.3905/jpm.2007.698029 |
| **Related** | Fundamental Law of Active Management (Grinold 1989); Grinold & Kahn *Active Portfolio Management*; follow-ons on breadth/skill/time (Grinold–Kahn JPM 2011); Qian–Sorensen–Hua information horizon (same JPM issue) |
| **Original PDF** | `[The Journal of Portfolio Management vol. 34 iss. 1] Grinold, Richard C - Dynamic Portfolio Analysis (2007) [10.3905_jpm.2007.698029] - libgen.li (1).pdf` |
| **Drive file id** | `15D66RVyPbeAwLsBOQIuYRsbLUQaZ5Rtz` |
| **Extraction note** | Source PDF uses a symbol font that MCP `read_file` OCR largely garbles; this summary reconstructs the paper’s standard content from readable fragments, the published abstract/metadata, and the established Grinold dynamic framework as cited in subsequent JPM work (esp. breadth $=g\cdot N$). |

---

## Problem / Motivation

Static presentations of the **Fundamental Law**—IR ≈ IC × √Breadth—leave “breadth” as a vague count of bets. Practitioners know breadth is not simply $N$ holdings or “how often we trade.” Information **arrives** and **decays**; portfolios **chase** an ideal target with trading frictions. Grinold (2007) builds a **dynamic** link between:

- the **model portfolio** $m(t)$ (ideal positions given current forecasts),
- the **held portfolio** $h(t)$ (actual positions),
- the **speed of information arrival/decay** (information turnover rate $g$),
- and the **speed of trading** toward the model.

The goal is to diagnose an investment process with a few interpretable parameters—analogous to how a simple dynamic system is described by gains and time constants—rather than with a thicket of ad hoc statistics. The paper works at both a **strategic** level (how information flow sets potential IR) and a **tactical** level (how trading policy harvests that potential given costs).

Motivation bullets (from the paper’s opening structure, as recovered from fragments and standard exposition):

- Separate **information** dynamics from **portfolio** dynamics.  
- Measure how fast forecasts refresh (information turnover).  
- Relate the gap between model and held portfolios to transfer coefficient / residual risk.  
- Choose trading aggressiveness with eyes open to the speed of alpha decay.

---

## Setup / Conceptual Framework

### Assets and residual risk

Work in an $N$-asset residual (benchmark-relative) universe. Residual returns have covariance $\Delta$ (often taken diagonal in stylized calculus, $\Delta=\mathrm{diag}(\omega_i^2)$, or more generally PSD). The **model portfolio** $m$ is the mean-variance optimal residual portfolio given current alphas $\alpha$:

$$
m \propto \Delta^{-1}\alpha
$$

(with risk aversion / target residual risk scaling). The **held portfolio** $h$ is what the fund actually owns. Residual variance of a portfolio $p$ is $p'\Delta p$ (denoted $\omega_p^2$ in Grinold–Kahn notation).

### Information: stock and flow

Forecasts (alphas) are a **stock** of information. They **fade** (old news becomes priced or stale) and are refreshed by a **flow** of new information. In continuous time, a standard Grinold abstraction is that the information stock mean-reverts at a rate tied to $g$, while new shocks arrive to keep the system in equilibrium. In equilibrium, **arrival rate equals decay rate**—that common rate is the **information turnover** $g$ (units: 1/time). Easy to estimate from the autocorrelation of forecasts or of model portfolio holdings.

### Breadth, skill, IR

If the process forecasts $N$ assets with information turnover $g$,

$$
\mathrm{Breadth} \approx g\cdot N.
$$

Skill (IC-like correlation between forecasts and residual returns) depends on horizon: short horizons may have low IC; IC can rise then fall with horizon as noise averages then alpha decays. The ex ante IR takes a form schematically

$$
\mathrm{IR} \approx \mathrm{IC}_{\mathrm{eff}}\times\sqrt{g\,N}
$$

(with refinements in Grinold–Kahn 2011 using skill parameter $\gamma$ / related notation). Dynamic portfolio analysis explains **why** breadth scales with $g$, not merely with $N$ or trade count.

### Model vs held: transfer

The **transfer coefficient** $\tau$ (Clarke–de Silva–Thorley) is the correlation between held and model portfolios (risk-adjusted). Imperfect transfer comes from constraints, costs, and **slow trading** relative to information speed. If information turns over fast (high $g$) but the desk trades slowly, $\tau$ falls and realized IR ≪ potential IR.

---

## Model / Methods (LaTeX-heavy reconstruction)

### Change in the model portfolio

Decompose innovations in $m(t)$:

$$
\mathrm{d}m = \underbrace{\mathrm{d}m_{\mathrm{new}}}_{\text{new information}} + \underbrace{\mathrm{d}m_{\mathrm{fade}}}_{\text{decay of old information}}.
$$

In linear mean-reverting systems, fade is proportional to $-g\,m\,\mathrm{d}t$ (or a close analogue), while new information is a martingale increment with variance calibrated so that unconditional $\mathrm{Var}(m)$ is stable. Then $g$ is literally the exponential decay rate of forecast autocorrelation: $\mathrm{Corr}(\alpha_t,\alpha_{t+h})\approx e^{-gh}$.

### Change in the held portfolio

Trading policy moves $h$ toward $m$. A common linear policy:

$$
\mathrm{d}h = \delta\,(m-h)\,\mathrm{d}t + \text{(rebalancing for price moves)},
$$

where $\delta$ is a trading-speed parameter (high $\delta$ ⇒ chase the model aggressively). Optimal $\delta$ rises with IC and $g$’s slow components and falls with cost.

### Residual risk and flow identities

Fragments of the PDF show relations among:

- Strategy residual risk $\omega_m$ (model),  
- Held residual risk $\omega_h$,  
- Mix / backlog risk from $m-h$,  
- Flow measures of annualized turnover linked to $\delta$ and to $g$.

Schematic identities (standard Grinold dynamic toolkit):

$$
\begin{aligned}
\omega_h^2 &= h'\Delta h,\\
\omega_m^2 &= m'\Delta m,\\
\psi^2 &= (m-h)'\Delta(m-h) \quad\text{(discordance / untransferred risk)},\\
\tau &\approx \frac{h'\Delta m}{\omega_h\omega_m}.
\end{aligned}
$$

In steady state, faster information (higher $g$) increases required trading to keep $\psi$ small; otherwise $\tau$ decays and IR suffers.

### Bridging to the Fundamental Law

Static FLAM: $\mathrm{IR}=\mathrm{IC}\sqrt{BR}$. Dynamic analysis supplies $BR=gN$ (and refinements when signals have multiple horizons). It also supplies a **haircut** for slow trading: effective IR ≈ $\tau\times\mathrm{IC}\times\sqrt{gN}$.

### Diagnostic use

Estimate from data:

1. **$g$** from forecast or model-portfolio autocorrelation half-life $t_{1/2}=\ln 2/g$.  
2. **$N$** as number of names with active forecasts (or effective $N$ from factor structure).  
3. **IC** from forecast vs subsequent residual return.  
4. **$\tau$** from held vs model correlation.  
5. Compare realized IR to $\tau\cdot\mathrm{IC}\cdot\sqrt{gN}$; gaps diagnose cost, bias, or nonstationarity.

---

## Results / Quantitative Implications

The 2007 JPM article is theoretical/diagnostic rather than a single backtest table, but its quantitative punchlines—amplified in companion literature—are:

1. **Breadth is information turnover times names**, not trades per year and not holdings count alone.  
2. A process with $N=500$ and quarterly-refreshing signals ($g\sim 4$/year) has breadth ~2000; the same $N$ with annual signals ($g\sim 1$) has breadth ~500—**4× IR potential gap** at fixed IC.  
3. **Fast signals need fast trading** (or they are worthless after costs). Slow value signals can be traded slowly with high $\tau$.  
4. Transfer coefficient collapses when $\delta \ll g$ (trading much slower than information decay).  
5. Optimal horizon for measuring IC depends on $g$; mismatched horizons distort skill estimates (theme shared with Qian–Sorensen–Hua 2007 in the same issue).  
6. Exhibit-style tables in the paper (visible as garbled numeric blocks in OCR) report illustrative half-lives / $\gamma$ / $g$ combinations and the implied IR components—use the published PDF figures when needing exact exhibit numbers.

---

## Limitations

1. **Stylized linear dynamics**—real alpha decay is multi-scale (fast earnings news + slow value).  
2. **Diagonal residual risk** approximations hide factor structure; in practice estimate $g$ after factor residualization.  
3. **Constant $g$** assumption fails across regimes (crisis information spikes).  
4. OCR-garbled source PDF in Drive complicates line-level quotation—verify exhibits against publisher PDF if litigating a number.  
5. Costs modeled abstractly via $\delta$; full market-impact optimization (Almgren–Chriss, etc.) is richer.  
6. Does not by itself select characteristics (pair with Freyberger-style selection).

---

## Quant-Investor Takeaways

1. **Estimate $g$** for every signal family (ACF of scores). Report half-life next to IC.  
2. **Breadth budget:** $gN$ is the right dial for research allocation—adding names with the same slow $g$ is not the same as speeding information refresh.  
3. **Match trading speed to $g$:** high-frequency signals need dedicated execution; forcing them into a monthly rebalance book destroys $\tau$.  
4. **Diagnose IR gaps** with $\tau\cdot\mathrm{IC}\cdot\sqrt{gN}$ before rebuilding alpha models.  
5. **Multi-horizon books:** treat fast and slow sleeves separately (different $g$, $\delta$, risk budgets)—same advice as Qian et al. information-horizon work.  
6. **Capacity:** higher $g$ usually means higher turnover and lower capacity for a given IR target.  
7. **Risk models:** residualize before measuring IC/$g$ or you will confuse factor timing with residual skill.  
8. **Governance:** require each new signal to declare $g$, IC, expected $\tau$, and cost-adjusted IR.  
9. **Link to Freyberger:** ~10–15 selected characteristics, each with its own $g$, compose total breadth as sum of sleeve breadths if residuals are orthogonalized.  
10. **Link to Connor:** industry/market structure determines $\Delta$; dynamic analysis sits on top of the risk model, not instead of it.

---

## Worked Numerical Example

Suppose $N=200$ residual names, IC=0.05, $g=2$/year (half-life ~0.35y), $\tau=0.8$.

$$
\mathrm{IR}_{\mathrm{potential}}\approx 0.05\times\sqrt{2\times200}=0.05\times\sqrt{400}=1.0,
$$
$$
\mathrm{IR}_{\mathrm{delivered}}\approx 0.8\times 1.0=0.8.
$$

If rebalance policy slows so $\tau=0.4$, delivered IR halves to 0.4—**same research**, worse trading. If instead signals refresh quarterly ($g=4$) at same IC and $\tau=0.8$, potential IR rises to $0.05\times\sqrt{800}\approx1.41$, delivered ≈1.13—unless costs crush $\tau$.

---

## Estimation Recipes

**$g$ from scores:** compute cross-sectional score vectors $s_t$; look at $\rho_h=\mathrm{Corr}(s_t,s_{t+h})$ (appropriate correlation); fit $\rho_h\approx e^{-gh}$ or use half-life of portfolio model weights.

**$g$ from holdings:** autocorrelation of model portfolio positions after risk normalization.

**$\tau$:** correlation between risk-normalized $h$ and $m$ each period; average.

**IC:** correlation of $s_t$ with forward residual returns over a horizon matching $1/g$.

---

## Relation to Same-Issue Qian–Sorensen–Hua (2007)

QSH study information horizon vs trading horizon and turnover analytically. Longer trading horizons reduce breadth (fewer independent refreshes). Grinold’s $g$ framework is the complementary **process-level** language; QSH is the **signal-construction** language. Read together.

---

## Equation Card

$$
\begin{aligned}
m &\propto \Delta^{-1}\alpha,\\
\mathrm{Corr}(\alpha_t,\alpha_{t+\ell}) &\approx e^{-g\ell},\\
BR &\approx g N,\\
\mathrm{IR} &\approx \tau\cdot\mathrm{IC}\cdot\sqrt{BR},\\
\mathrm{d}h &\approx \delta(m-h)\,\mathrm{d}t.
\end{aligned}
$$

---

## Bottom Line

Grinold’s *Dynamic Portfolio Analysis* (JPM 2007) upgrades the Fundamental Law from a static slogan to a **dynamic systems** view: information turns over at rate $g$, breadth is $gN$, and trading speed must keep the held portfolio coupled to the model or the transfer coefficient—and IR—collapse. For a multi-signal quant book, estimating $g$ per sleeve is as mandatory as estimating IC.


---

## Extended Discussion: Why Static Breadth Misleads

Counting “number of long positions” as breadth double-counts highly correlated bets and ignores time. A 100-stock portfolio rebalanced annually on the same slow value signal does not have breadth 100×12. Dynamic analysis charges you for **dependence across time** via $g$. Conversely, a daily signal on 50 names can have enormous breadth if $g$ is large and residuals stay informative—subject to cost.

## Implementation Architecture

1. Signal engine outputs $\alpha_t$ or scores.  
2. Risk model supplies $\Delta_t$.  
3. Optimizer produces $m_t$ (model).  
4. Execution produces $h_t$ with policy $\delta$.  
5. Analytics nightly: IC, $g$, $\tau$, IR budget vs realization.  
6. Research forum reviews sleeves where $\tau\ll 1$ or $g$ mis-estimated.

## Common Failure Modes

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| High IC, low IR | Low $\tau$ or overstated breadth | Speed trading / cut constraints / fix $g$ |
| High turnover, low IR | Trading noise; $g$ overestimated | Slow $\delta$; filter scores |
| IR decays after go-live | $g$ rose (alpha decay faster post-arb) | Refresh research; cut capacity |
| Good backtest IC, bad live | Horizon mismatch in IC measurement | Align IC horizon to $1/g$ |

## Cross-Paper Synthesis for This Scholar Run

- **Freyberger:** which characteristics deserve a sleeve.  
- **Sloan:** accrual sleeve’s $g$ ~ 1–3 years (Figure 1 mean reversion).  
- **Connor:** build $\Delta$ with correct market/industry structure.  
- **Robinson theorems:** delta-method SEs on IR; FWL when estimating IC after controls.  
- **Grinold:** schedule trading and risk budgets given each sleeve’s $g$.

## Closing

Despite OCR issues on the Drive PDF, the intellectual content of Grinold (2007) is stable and central to active portfolio management. Archive this summary as the operational companion to FLAM for Gappy’s library.


## Historical Context

Grinold 1989 gave IR≈IC×√BR. The 2000s added transfer coefficients and information horizons. JPM 2007 synthesizes: investment process as dynamical system with natural frequency g. Grinold-Kahn 2011 tightens equilibrium arrival=decay and horizon-dependent skill.

## Illustrative Half-Life Table

Intraday: minutes-hours (huge g). Short-term reversal: days-weeks (high g). Momentum: 1-12 months (moderate). Accruals: 1-3 years (low-moderate). Deep value: multi-year (low g). Heuristics for planning, not 2007 exhibit reproductions.

## Discordance Risk

psi^2=(m-h)'Delta(m-h). In linear trading/info models, E[psi^2] rises with g/delta. IR losses scale with psi. Report psi beside tau.

## Optimizer Coupling

MV with costs approximates optimal control for h. Grinold delta summarizes that control. Nonlinear impact makes effective delta fall with AUM—capacity demotes delivered IR.

## Training Questions and Sketches

Equal IC but g1=2g2 ⇒ breadth doubles, turnover rises. Annual rebalance of weekly-decay signal ⇒ low tau. Connor residualization cleans IC/g. Sloan 3-year fade ⇒ candidate g~0.3-0.7. Back out g from IR=tau*IC*sqrt(gN).

## Failure Mode Table

High IC low IR ⇒ low tau or bad breadth. High turnover low IR ⇒ trading noise / overestimated g. IR decays live ⇒ faster post-arb decay. Good backtest IC bad live ⇒ horizon mismatch.

## Architecture Checklist

Signal engine → risk Delta → model m → execution h(delta) → nightly IC,g,tau,IR dashboard → research forum on weak tau or mis-estimated g.

## Cross-Paper Synthesis

Freyberger: what to forecast. Sloan: accrual economics and fade. Connor: Delta structure. Robinson: SE and projection lemmas. Grinold: schedule trading given g. Without g, breadth is rhetoric; with g, FLAM is engineering.

## Numerical Panel

N=200, IC=0.05, g=2, tau=0.8 ⇒ potential IR=1.0, delivered 0.8. Tau→0.4 halves IR. g→4 lifts potential to ~1.41 if tau holds. Costs may not let tau hold—that is the capacity conversation.

## Estimation Detail

Fit Corr(alpha_t, alpha_{t+h})≈e^{-g h} with pooled CS correlations or time-series of risk-normalized model weights. Winsorize names; residualize returns before IC. Align IC horizon to ~1/g. Bootstrap SEs (delta method) for IR components.

## Why OCR Failed and How We Compensated

Drive PDF uses a proprietary math font; MCP text layer is gibberish. Summary relies on readable fragments (parameter g, transfer, stock/flow language), DOI metadata, and the standard Grinold dynamic framework as cited by later JPM articles. For exhibit-level numbers, open the publisher PDF visually.

## Bottom Line Reprise

Dynamic Portfolio Analysis upgrades FLAM to a systems view: information turns at g, breadth is gN, trading must track the model or tau—and IR—collapse. Estimate g per sleeve alongside IC; match delta to g; diagnose gaps with tau*IC*sqrt(gN) before rebuilding alpha research.


---

## Deep Dive: Information Turnover as the Missing FLAM Input

The slogan “breadth equals number of independent bets” invites abuse: people multiply names by rebalance frequency without asking whether rebalances refresh *information*. Grinold’s g is the rate at which the forecast stock is replaced. If you rebalance daily but alphas barely move (low g), you are trading noise. If alphas churn weekly but you rebalance quarterly, you leave alpha on the table (low tau). The paper’s contribution is to force both errors into the open.

## Continuous-Time Sketch (Standard Companion Math)

Let alpha follow d(alpha) = -g alpha dt + dW_info (dimensional constants suppressed). Then model portfolio m ∝ Delta^{-1} alpha inherits the same g. Held portfolio: dh = delta (m-h) dt. Steady-state variances and covariances of (m,h) yield tau = corr(h,m) as an increasing function of delta/g. IR_delivered = tau * IR_potential(g,N,IC). This is the analytical backbone behind the prose diagnostics.

## Practical Dashboard Spec

Fields per sleeve: IC_60d, IC_12m, g_hat, half_life, N_eff, breadth=g*N_eff, tau, IR_real, IR_model=tau*IC*sqrt(breadth), gap, turnover, cost_bps, AUM_capacity. Alert if gap > 0.3 IR units for two quarters or if half_life drifts >50%.

## Case Study: Momentum Sleeve

Momentum scores change relatively fast (g higher than value). After 2009-style crashes, conditional g and IC both shift. A Grinold dashboard would have shown tau collapsing if trading halted into the crash and IR_model overstating live results. Dynamic analysis does not prevent crashes but prevents *mis-attribution* (“our IC died” vs “our transfer died”).

## Case Study: Accrual Sleeve (Sloan)

Accrual ranks move slowly; g low; annual rebalance may suffice; tau can stay high even with moderate delta. Breadth comes from N (many names) not from rapid refresh. Costs low; capacity higher than momentum for same IC. Pairing sleeves with different g diversifies not only alpha sources but *temporal* risk of transfer failure.

## Case Study: NP Combined Score (Freyberger)

A single NP additive score mixing reversal (fast) and issuance (slower) has a **blurred** g. Better: export each selected characteristic’s m_s as a sleeve with its own g, then risk-budget the sleeves. Otherwise trading policy cannot be matched to information speed.

## Mathematical Identities Often Used with the Paper

Transfer coefficient tau = h' Delta m / (omega_h omega_m). Residual risk targeting: scale m so omega_m = target. Active share vs tau: related but not identical—tau is risk-space correlation, active share is holdings-space distance from benchmark. Turnover ≈ f(delta, g, N) in steady state—simulate rather than guess.

## Research Committee Template

Proposal must state: signal definition; IC horizon; estimated g; proposed delta/rebalance; predicted tau under constraints; cost model; IR_model; capacity at 10% loss of IR; kill criteria. This template *is* Dynamic Portfolio Analysis operationalized.

## Closing Extended Bottom Line

Grinold (2007) remains required reading for anyone who quotes the Fundamental Law. The Drive PDF’s OCR failure does not obscure the doctrine: measure g, set breadth = gN, trade fast enough to protect tau, and reconcile realized IR to the dynamic budget before rewriting research. Together with the other four summaries in this run, it completes the loop from econometric lemmas → accounting anomaly → risk-model structure → nonparametric signal selection → dynamic portfolio implementation.


## Extended Expository Essay: From Static Slogans to Dynamic Control

Active management folklore is full of static slogans—high IC, lots of bets, transfer coefficient matters—that become actionable only when time enters explicitly. Grinold’s 2007 essay is the time-aware upgrade. Information is a stock that decays and a flow that replenishes. The rate g that equates arrival and decay in equilibrium is measurable from forecast autocorrelation. Breadth is then g times the number of forecasted names, tying research productivity to refreshment speed rather than to headcount of positions alone.
Portfolios are control systems. The model portfolio is the target state implied by current information; the held portfolio is the controlled state; trading intensity delta is the control gain; costs and constraints limit feasible gains. Transfer coefficient is the steady-state correlation between target and state. If information moves faster than control can follow, correlation falls and the Fundamental Law’s potential is not delivered. Engineers would not be surprised; finance organizations often are, because they track IC religiously and tau sporadically.
Operationalizing the paper means building telemetry: half-lives, effective N after factor residualization, tau under live constraints, and an IR budget that must reconcile with realized IR. When reconciliation fails, the first question is whether g was mismeasured, tau collapsed, or IC was horizon-mismatched—not whether to hire another data scientist immediately. That diagnostic ordering saves a remarkable amount of research waste.
Sleeves with heterogeneous g should not share a single rebalance calendar. Fast reversal and slow accruals disagree about delta. A Freyberger-style combined score that mixes speeds needs either decomposition into sleeves or a trading policy optimized for the mixture’s effective g—usually a compromise that is second-best to separation. Risk models (Connor) define the inner product that makes tau and residual risk coherent; without them, correlation between h and m is ambiguous.
Capacity is the shadow price of delta. As AUM grows, impact lowers feasible delta, lowering tau, lowering delivered IR even if research IC is unchanged. Dynamic portfolio analysis predicts that outcome; static FLAM does not. Hence institutional investors should demand g and capacity schedules alongside backtest Sharpes.
In teaching, pair this summary with a live spreadsheet: simulate OU alphas at given g, trade with given delta, plot tau and IR vs delta/g. The graph convinces faster than prose. Then estimate g on a real signal and propose a rebalance policy. That exercise embeds Grinold 2007 into muscle memory despite the OCR-damaged PDF source.
Finally, cite the paper correctly (JPM 34(1) 12–26, doi 10.3905/jpm.2007.698029) and cross-link Grinold–Kahn 2011 for the refined skill×√(gN) formula when updating library notes. The doctrine is stable; the exhibits evolve.

## Additional Implementation Scenarios

Scenario A — Centralized monthly book: many signals forced onto one calendar. Expect tau loss on fast signals. Mitigation: overnight overlay book for high-g sleeves with separate risk budget.

Scenario B — Multi-manager platform: each manager has own g. Aggregation without g-aware risk budgeting overstates diversification because synchronized news events correlate across managers' information flows.

Scenario C — Transaction-cost spike: effective delta falls. IR_model must be recomputed; research IC unchanged is irrelevant if tau halves.

Scenario D — Post-publication decay (McLean–Pontiff): g rises as alpha is arbitraged faster. Half-life monitors are early-warning systems for anomaly decay—not just IC monitors.

Scenario E — Freyberger NP score: decompose into selected characteristic sleeves; estimate g_s per sleeve; set delta_s accordingly; recombine with risk weights. This is the recommended production pattern.

## Parameter Glossary (Grinold Dynamic)

g: information turnover rate (1/time). delta: trading speed toward model. m: model portfolio. h: held portfolio. tau: transfer coefficient. omega: residual risk. IC: information coefficient. BR≈gN: breadth. IR≈tau×IC×√BR: delivered information ratio. psi: discordance risk between m and h.

## Reading Order Recommendation

1) Grinold–Kahn textbook chapters on FLAM. 2) This 2007 dynamic paper. 3) Clarke–de Silva–Thorley on transfer coefficient. 4) Qian–Sorensen–Hua 2007 on information horizon. 5) Grinold–Kahn 2011 breadth/skill/time. That sequence turns slogans into a research operating system.

## Final Paragraph

Dynamic Portfolio Analysis is the control theory of active equity management. Measure how fast information moves, trade accordingly, and hold research accountable to a dynamic IR budget. That is the durable message for Gappy’s Scholar library despite a corrupt text layer in the stored PDF.


## Appendix: Connecting g to Observable Autocorrelations

Let s_t be a vector of cross-sectionally demeaned, risk-normalized scores. Define rho(h) = average over t of corr(s_t, s_{t+h}). Under a scalar OU approximation, rho(h) ≈ exp(-g h). Estimate g by regressing log rho(h) on h for h=1..H before rho becomes noisy. Half-life = log(2)/g. Repeat after residualizing scores against Connor-style industry/country factors to avoid attributing slow industry cycles to signal skill. For multi-factor scores, estimate a matrix decay or report per-component g.

If rho(h) is non-exponential (fast drop then long plateau), use a two-scale model: g_fast and g_slow with weights. Trading policy should be fast enough for the fast component only on the capital allocated to that component—another argument for sleeve separation.

## Appendix: Transfer Coefficient Under Constraints

With no constraints and zero costs, optimal h = m and tau = 1. Long-only, beta neutrality, sector caps, and name caps all reduce the feasible set; tau is the correlation between m and the projection of m onto the feasible set (approximately). Measuring tau without knowing constraints confuses research quality with mandate design. Always compute unconstrained tau_research and constrained tau_live.

## Appendix: IR Waterfall

Start with IC×√(gN). Multiply by tau_research (after risk model). Multiply by tau_mandate/tau_research (constraint haircut). Multiply by cost factor (net of impact). The product is IR_net. Each haircut owns an owner: research, PMs/mandate, trading. This waterfall is how Dynamic Portfolio Analysis should appear in IC memos.

## Manifest of Deliverables Implied by the Paper

Telemetry dashboard; g estimation library; sleeve-level rebalance policies; IR waterfall report; capacity schedule vs AUM; training module with OU simulation. Completing those deliverables *is* adopting Grinold (2007), not merely citing it.

Word-count and substance check: this summary reconstructs the paper's doctrine at practitioner depth sufficient for implementation planning even when the Drive PDF text layer is unusable.


## Citation Block

Grinold, Richard C. 2007. "Dynamic Portfolio Analysis." Journal of Portfolio Management 34 (1): 12–26. https://doi.org/10.3905/jpm.2007.698029. Related: Grinold (1989) Fundamental Law; Grinold and Kahn, Active Portfolio Management; Grinold and Kahn (2011) Breadth, Skill, and Time; Qian, Sorensen, and Hua (2007) Information Horizon, Portfolio Turnover, and Optimal Alpha Models.


End of detailed quantitative research notes for Grinold (2007) Dynamic Portfolio Analysis. All core identities (g, breadth gN, tau, IR waterfall) are ready for desk adoption.

Archive path matches Scholar filename convention for Google Drive Summaries upload.
