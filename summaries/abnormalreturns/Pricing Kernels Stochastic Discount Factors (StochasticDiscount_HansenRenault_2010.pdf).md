# Pricing Kernels (Stochastic Discount Factors)

**Authors:** Lars Peter Hansen (University of Chicago) & Eric Renault (University of North Carolina / related affiliations as of encyclopedia entry)  
**Publication:** “Pricing Kernels,” in *Encyclopedia of Quantitative Finance* (EQF), John Wiley; PDF metadata CreationDate Feb 17, 2010; ModDate Mar 23, 2010. Related article cross-ref: Stochastic Discount Factors.  
**Source PDF:** `StochasticDiscount_HansenRenault_2010.pdf` (Drive id `0B-6kBz0I0dMsOWZtNE9UdWhzZlk`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_4)  
**Extraction:** `pdftotext -layout` (two-column) + nolayout assist (~6,291–6,398 words source; 10 pages). No OCR required.

---

## 1. Motivation and Scope

Pricing kernels—equivalently, **stochastic discount factors (SDFs)**—represent valuation operators in dynamic stochastic economies. A “kernel” is the mathematical object representing a linear operator; “SDF” stresses risk-adjusted discounting of future payoffs. The terms are used interchangeably. This encyclopedia entry: (i) derives kernel representations from no-arbitrage; (ii) connects kernels to risk-neutral probabilities and martingale measures; (iii) surveys preference-based SDF examples (power, recursive, habit/externalities, incomplete markets, private information, solvency constraints); (iv) treats long-term risk factorizations; (v) develops econometric inference from limited asset menus, including linear beta pricing, GMM, Hansen–Jagannathan distance, and conditional methods.

---

## 2. Representing Prices from No-Arbitrage

### 2.1 Law of one price and no-arbitrage

Follow Ross [49] and Harrison–Kreps [34]. Valuation operators map portfolio payoffs (numeraire amounts across states) to prices. **Law of one price:** identical payoffs ⇒ identical prices. **No-arbitrage:** nonnegative payoffs that are positive with positive conditional probability command strictly positive prices. No-arbitrage implies the law of one price: if $b$ and $c$ share a payoff but $b$ is cheaper, long $b$, short $c$, and buy a strictly positive-payoff portfolio $a$ with the proceeds—zero price, positive payoff.

### 2.2 One-period pricing kernel

Let $\pi_{t,t+1}$ be the date-$t$ valuation operator for date-$t+1$ payoffs in a suitable space $P_{t+1}$, adapted to information $\mathcal{F}_t$. Representation:

$$
\pi_{t,t+1}(p_{t+1})=E(s_{t+1}\,p_{t+1}\mid\mathcal{F}_t). \tag{1}
$$

**Definition 1.** Positive r.v. $s_{t+1}$ is a **pricing kernel** for $\pi_{t,t+1}$ if (1) holds. Existence of a positive kernel ⇒ no-arbitrage.

**Existence routes.**

1. **Conditional Riesz** (Hansen–Richard [30]): $P_{t+1}=$ finite conditional second-moment $\mathcal{F}_{t+1}$-measurable r.v.s; $\pi$ linear and conditionally continuous; no-arbitrage ⇒ kernel.  
2. **Radon–Nikodym:** bounded $\mathcal{F}_{t+1}$ payoffs; absolute continuity of $E\pi$ ⇒ kernel.  

Both typically assume completeness (indicators of $\mathcal{F}_{t+1}$ events attainable). Incomplete menus still admit a Riesz representer $q_{t+1}\in P_{t+1}$:

$$
\pi_{t,t+1}(p_{t+1})=E(q_{t+1}p_{t+1}\mid\mathcal{F}_t), \tag{2}
$$

but $q$ need not be positive; extending the payoff space while preserving no-arbitrage restores a positive (possibly non-unique) kernel.

### 2.3 Stochastic discount processes

**Definition 2.** One-period SDF is $s_{t+1}$; multiperiod SDF compounds:

$$
S_{t+1}=\prod_{j=1}^{t+1}s_j. \tag{3}
$$

Compounding follows from the law of iterated values with interim trading. Date-0 price of $p_{t+1}$:

$$
\pi_{0,t+1}(p_{t+1})=E(S_{t+1}p_{t+1}\mid\mathcal{F}_0). \tag{4}
$$

Discount-bond price: $E(S_{t+1}\mid\mathcal{F}_0)$. Date-$\tau$ price uses the ratio $S_{t+1}/S_\tau$:

$$
\pi_{\tau,t+1}(p_{t+1})=E\!\left(\frac{S_{t+1}}{S_\tau}p_{t+1}\mid\mathcal{F}_\tau\right). \tag{5}
$$

---

## 3. Risk-Neutral Probabilities and Equivalent Martingale Measures

Rewrite one-period pricing as riskless discount times risk-neutral expectation:

$$
\pi_{t,t+1}(p_{t+1})=E(s_{t+1}\mid\mathcal{F}_t)\,\tilde E(p_{t+1}\mid\mathcal{F}_t), \tag{6}
$$

$$
\tilde E(p_{t+1}\mid\mathcal{F}_t)=E\!\left(\frac{s_{t+1}}{E(s_{t+1}\mid\mathcal{F}_t)}\,p_{t+1}\mid\mathcal{F}_t\right). \tag{7}
$$

Factor the SDF path:

$$
S_{t+1}=\bar S_{t+1}\,M_{t+1}, \tag{8}
$$

where $\bar S_{t+1}=\prod_j E(s_j\mid\mathcal{F}_{j-1})$ compounds one-period riskless discounts and $M_{t+1}=S_{t+1}/\bar S_{t+1}$ is a **positive martingale** with unit expectation—defining an equivalent measure change. Then

$$
\pi_{\tau,t+1}(p_{t+1})=\tilde E(\bar S_{t+1}p_{t+1}\mid\mathcal{F}_\tau). \tag{11}
$$

**Insight (Harrison–Kreps, Ross):** dynamic NA pricing ⇔ existence of a positive martingale distorting historical probabilities into risk-neutral ones, preserving equivalence (same null events). This mildy modifies naive “efficient markets ⇒ discounted prices are martingales” by allowing risk compensation via measure change (Rubinstein [50], Lucas [42]). Continuous-time Brownian case: Girsanov drifts absorb risk premia.

Derivative pricing exploits: attainable claims priced by risk-neutral expectation of discounted payoffs under the EMM.

---

## 4. Preference-Based SDF Examples

Economic models identify which undiversifiable risks are priced (often macro shocks) and what determines riskless rates. SDFs encode those risk prices.

### 4.1 Power utility (complete markets, representative agent)

CES $1/\rho$, discount rate $\delta$:

$$
\frac{S_{t+1}}{S_t}=\exp(-\delta)\left(\frac{C_{t+1}}{C_t}\right)^{-\rho}. \tag{12}
$$

Rubinstein–Lucas exchange-economy SDF.

### 4.2 Recursive utility (Epstein–Zin / Kreps–Porteus / Weil)

Double CES recursion separates EIS ($1/\rho$) from risk aversion $\gamma$:

$$
\frac{S_{t+1}}{S_t}=\exp(-\delta)\left(\frac{C_{t+1}}{C_t}\right)^{-\rho}
\left(\frac{U_{t+1}}{R_t(U_{t+1})}\right)^{\rho-\gamma}, \tag{13}
$$

$$
R_t(U_{t+1})=\bigl(E[(U_{t+1})^{1-\gamma}\mid\mathcal{F}_t]\bigr)^{1/(1-\gamma)}. \tag{14}
$$

When $\rho=1$, connects to robustness concerns (Anderson–Hansen–Sargent [6]). Empirical discussions: Hansen et al. handbook chapters [25, 31, 52]; Campbell [11].

### 4.3 Consumption externalities / habits / reference levels

Abel [1], Campbell–Cochrane [12], Menzly–Santos–Veronesi [45]:

$$
\frac{S_{t+1}}{S_t}=\exp(-\delta)\left(\frac{C_{t+1}}{C_t}\right)^{-\rho}\frac{\phi(H_{t+1})}{\phi(H_t)}, \tag{15}
$$

with $H$ a consumption-to-social-stock ratio. Garcia–Renault–Semenov [21] reference-level variant with $H^\eta$ wedge (16). Bakshi–Chen [8]: relative wealth in utility (“spirit of capitalism”).

### 4.4 Incomplete markets (partial risk sharing)

Contracts complete only over aggregate $\sigma\text{-field}\ \mathcal{F}$. With power utility, SDF for aggregate uncertainty uses cross-sectional moments of individual consumption (Constantinides–Duffie [16] class):

$$
\frac{S_{t+1}}{S_t}=\exp(-\delta)\left(\frac{C^a_{t+1}}{C^a_t}\right)^{-\rho}
\frac{E\bigl((C^j_{t+1}/C^a_{t+1})^{-\rho}\mid\mathcal{F}_{t+1}\bigr)}{E\bigl((C^j_t/C^a_t)^{-\rho}\mid\mathcal{F}_t\bigr)}. \tag{17}
$$

### 4.5 Private information

Kocherlakota–Pistaferri [40] from Rogerson’s [47] inverse Euler: SDF uses **$+\rho$** cross-sectional moments (vs $-\rho$ under incomplete markets)—“savings constraints” contrast.

### 4.6 Solvency constraints

Luttmer [43], He–Modest [35], Cochrane–Hansen [14]; limited commitment (Alvarez–Jermann [4], Kehoe–Levine [38], Kocherlakota [39]). With power utility:

$$
\frac{S_{t+1}}{S_t}=\exp(-\delta)\min_j\left(\frac{C^j_{t+1}}{C^j_t}\right)^{-\rho}, \tag{19}
$$

hence SDF $\ge$ aggregate-consumption IMRS (20). The consumer with the **smallest** consumption growth has slack solvency constraint and pins the SDF.

---

## 5. Long-Term Risk Factorizations

Alvarez–Jermann [5], Hansen–Scheinkman [32], Hansen [24] use Markov structure:

$$
S_{t+1}=\exp(-\eta t)\,M_{t+1}\,\frac{\hat f(X_0)}{\hat f(X_{t+1})}, \tag{21}
$$

with multiplicative martingale $M$, constant $\eta>0$, Markov state $X$, positive eigenfunction $\hat f$. Pricing becomes constant discounting plus expectation under the $M$-changed measure (22). Transient components (habit etc.) fit

$$
\frac{S^*_{t+1}}{S^*_t}=\frac{S_{t+1}}{S_t}\frac{f(X_{t+1})}{f(X_t)} \tag{23}
$$

(Bansal–Lehmann [9]); combining yields long-horizon risk-return analysis for cash flows that grow stochastically—central to modern term-structure-of-risk research.

---

## 6. Inferring SDFs from Limited Asset Data

### 6.1 Conditional pricing equation

Observe $n$ payoffs $Y_{t+1}$ with finite conditional second moments, nonsingular $E[Y Y'\mid G_t]$, $G_t\subset\mathcal{F}_t$, prices $Q_t\in G_t$:

$$
E(s_{t+1}Y_{t+1}\mid G_t)=Q_t. \tag{26}
$$

### 6.2 Riesz counterpart (not necessarily positive)

$$
p^*_{t+1}=Y_{t+1}'\bigl(E[Y_{t+1}Y_{t+1}'\mid G_t]\bigr)^{-1}Q_t \tag{27}
$$

satisfies $E(p^*Y\mid G_t)=Q_t$. It is the conditional LS projection of $s_{t+1}$ onto the payoff span; may be negative ⇒ cannot safely price nonlinear derivatives. If a riskless payoff is included, $E(s\mid G_t)=E(p^*\mid G_t)$, and $\mathrm{Vol}(s)\ge\mathrm{Vol}(p^*)$ (HJ bound lineage [28]). Richer derivative spans $H_{t+1}$ yield positive $h^*_{t+1}$ (31)–(32); nonparametric estimators (Aït-Sahalia–Lo [3], Rosenberg–Engle [48]) target such objects.

### 6.3 Linear beta / factor pricing

$$
Q_t=E\bigl((\lambda_t\cdot z_{t+1}+\alpha_t)Y_{t+1}\mid G_t\bigr) \tag{33}
$$

implies conditional mean–beta representations (34)–(35). Special cases: CAPM (market factor); conditional Fama–French [19] with size and value factors. If factors are in the payoff span and a conditional riskless asset exists, $p^*=\lambda\cdot z+\alpha$ (36).

**Estimation.** Degenerate $G_t$, excess returns, i.i.d. normal ⇒ ML and LR tests (Gibbons–Ross–Shanken [22]). Relax via **GMM** (Hansen [23]; MacKinlay–Richardson [44]; Jagannathan–Skoulakis–Wang [37] handbook treatment)—handles heteroskedasticity and dependence; unified testing of conditional linear beta models.

### 6.4 Misspecification: Hansen–Jagannathan [29]

Choosing $(\lambda,\alpha)$ to minimize maximum pricing error on unit-second-moment payoffs ≡ least-squares problem (37) finding $v_{t+1}$ close to $\lambda\cdot z+\alpha$ while pricing correctly. Produces the HJ distance as a misspecification metric.

### 6.5 Other econometric themes

- Reduce conditional moments to unconditional via instruments; or estimate conditional moments nonparametrically (Ai–Chen [2]; Antoine–Bonnal–Renault [7] conditional continuously-updated GMM).  
- Continuously updated GMM (Hansen–Heaton–Yaron [27]) links to empirical likelihood / entropy estimators.  
- Gallant–Hansen–Tauchen [20]: flexible dynamics for conditional moments of payoffs to infer IMRS volatility.  
- Hansen–Singleton [33]: classic GMM on nonlinear RE models.  
- Hansen–Heaton–Luttmer [26]: econometric evaluation of asset pricing models.

---

## 7. Limitations (as an encyclopedia entry)

1. Survey density: many models cited with little empirical calibration inside the entry itself.  
2. Two-column PDF extraction requires care with equation numbering.  
3. Continuous-time treated briefly (Girsanov pointer).  
4. No single “preferred” SDF—deliberately pluralistic.  
5. Implementation details of GMM/HJ tests deferred to handbook chapters.

---

## 8. Quantitative Takeaways for Researchers and Quants

1. **SDF is the lingua franca** linking NA pricing, preferences, and econometrics—estimate $E(m R^e)=0$ before arguing about behavioral anomalies.  
2. **EMM / risk-neutral measure** is the engineering face of the same object; derivative desks and empiricists share a foundation.  
3. **Preference menu matters for long-run risk:** power vs EZ vs habit change both $\eta$ and transient $f(X)$ factors in (21)–(24)—horizon-dependent risk premia are first-order (Hansen–Scheinkman).  
4. **Incomplete markets vs private info** flip the sign of cross-sectional consumption moments in the SDF ($-\rho$ vs $+\rho$)—testable with distributional data.  
5. **Solvency/min-IMRS SDFs** imply the tightest discounter dominates—useful for disaster and commitment models.  
6. **Never confuse $p^*$ with a positive SDF** when pricing options; project onto a richer payoff span or impose positivity.  
7. **HJ distance** is the disciplined misspecification metric when factors are proxies.  
8. **GMM > naive ML** once returns are heteroskedastic/dependent—standard in modern cross-sectional tests.  
9. **Conditional information $G_t\subset\mathcal{F}_t$** means econometric SDFs are coarser than agents’; bounds still informative.  
10. **Linear beta models are SDF special cases**—CAPM/FF3 live inside (33)–(36), clarifying what GRS and GMM actually test.

---

## 9. Conclusion

Hansen and Renault’s EQF entry is the canonical compact map of pricing-kernel theory: from Riesz/NA representations and equivalent martingale measures, through the modern preference zoo and long-term risk factorizations, to GMM/HJ econometrics with limited asset menus. For quantitative finance practice, it licenses a unified workflow—write the pricing equation $E(s_{t+1}Y_{t+1}\mid G_t)=Q_t$, choose a parametric or linear-factor $s$, estimate by GMM, diagnose with HJ distance—while keeping clear which economic restrictions (complete markets, habits, solvency, private info) are being imposed on the kernel.

---

## 10. Extended Discussion: From Kernel to Practice

### 10.1 Why positivity matters operationally

A signed $p^*$ that prices the observed basis may assign negative state prices to some regions of the return distribution, implying arb if those contingent claims were marketed. Option desks that “calibrate an SDF” from equity returns alone without positivity or option span data risk exactly this. Rosenberg–Engle empirical pricing kernels and Aït-Sahalia–Lo state-price densities impose positivity by working with richer derivative information.

### 10.2 Factor models as linear SDFs

Writing $s_{t+1}=a_t-b_t'f_{t+1}$ recovers beta pricing. The econometric question is whether a low-dimensional $f$ (market, SMB, HML, momentum, liquidity, …) spans the conditional mean of excess returns. GRS tests efficiency of a given portfolio; GMM extends to conditional and misspecified settings. Hansen–Renault place these tests inside the kernel framework so that “alpha” is literally a pricing error $E(s R^e)\neq 0$.

### 10.3 Long-run risk without EZ alphabet soup

Even without committing to Epstein–Zin parameters, the factorization (21) says any SDF with Markov structure has a dominant long-run decay rate $\eta$ and a martingale component driving permanent measure change. Bond market and equity yield research that measures persistence of marginal utility (Alvarez–Jermann 2005) is estimating $\eta$ and properties of $M$. Quant macro-finance researchers should estimate these objects alongside short-run habit wedges.

### 10.4 Checklist for empirical SDF papers

1. State the information sets $\mathcal{F}_t$ vs $G_t$.  
2. Write the exact conditional moment restrictions.  
3. Choose parametric family (power, EZ, linear factor, …) or nonparametric target ($h^*$).  
4. Estimate by GMM / CU-GMM / EL; report HJ distance.  
5. Test positivity or report frequency of negative fitted kernels.  
6. For long-horizon claims, implement (21)–(24) or analogous continuous-time operators.  
7. Relate rejection to which economic friction (habits, incomplete markets, solvency) might restore pricing.

---

## 11. Worked Hierarchy of SDFs (Pedagogical Ladder)

**Level 0 — Accounting identity.** If a complete-market positive kernel exists, $p_t=E(s_{t+1}p_{t+1}\mid\mathcal{F}_t)$ for all attainable payoffs.

**Level 1 — Risk-neutral rewrite.** $p_t=E(s_{t+1}\mid\mathcal{F}_t)\,\tilde E(p_{t+1}\mid\mathcal{F}_t)$. Estimate discount and measure change separately (bonds vs equity options).

**Level 2 — Linear factor SDF.** $s=a-b'f$. Test $E(s R^e)=0$ with GMM; report cross-sectional $R^2$ and HJ distance.

**Level 3 — Consumption SDF.** Replace $s$ with $e^{-\delta}(C_{t+1}/C_t)^{-\rho}$ or EZ formula (13). Confront equity premium / risk-free rate puzzles; possibly add habits (15).

**Level 4 — Frictions.** Move to incomplete markets (17), private info (18), or solvency min-IMRS (19). Use cross-sectional consumption moments.

**Level 5 — Long-term operators.** Estimate $\eta$, martingale $M$, eigenfunction $\hat f$ for horizon-dependent pricing (21)–(24).

Each level nests the previous as a special case or approximation; empirical rejection at level $k$ suggests climbing to $k+1$ rather than abandoning the SDF framework.

## 12. Hansen–Jagannathan Bound in Operational Form

If a riskless return $R^f$ is observed and excess returns $R^e$ have conditional mean $\mu$ and covariance $\Sigma$, any SDF $s$ with $E(s)=1/R^f$ that prices the assets must satisfy

$$
\frac{\sigma(s)}{E(s)}\ge \sqrt{\mu'\Sigma^{-1}\mu},
$$

the maximal Sharpe ratio. Empirically high Sharpe ratios force high SDF volatility—hence the equity-premium puzzle for smooth power-utility kernels. Habit, EZ long-run risk, disasters, and incomplete markets are all ways to raise $\sigma(s)$ without absurd $\rho$. The encyclopedia’s projection argument ($p^*$ volatility lower-bounds $s$ volatility) is the finite-asset version of this logic.

## 13. GMM Recipe Tied to Equation (26)

Moment vector for excess returns with instruments $z_t\in G_t$:

$$
g_{t+1}(\theta)=z_t\otimes \bigl(s_{t+1}(\theta)\,R^e_{t+1}\bigr).
$$

Minimize $g'Wg$ with identity, optimal, or continuously updated $W(\theta)$. Conditional CU-GMM (Antoine et al.) avoids ad hoc instrument choice by working directly with conditional moments. For linear factor models, $\theta=(a,b)$ or $(\alpha,\lambda)$; for EZ, $\theta=(\delta,\rho,\gamma)$ plus consumption dynamics parameters.

## 14. Mapping Named Models to Equation Numbers

| Model | Eq. | Key feature |
|-------|-----|-------------|
| Power utility | (12) | Single curvature $\rho$ |
| Epstein–Zin recursive | (13)–(14) | Separates EIS and risk aversion |
| Habit / catching up | (15) | Social stock wedge $\phi(H)$ |
| Reference utility | (16) | $H^\eta$ multiplier |
| Incomplete markets | (17) | Cross-section $-\rho$ moments |
| Private information | (18) | Cross-section $+\rho$ moments |
| Solvency / limited commitment | (19)–(20) | Min IMRS across agents |
| Long-term factorization | (21)–(24) | $\eta$, martingale $M$, transient $f$ |
| Linear beta / CAPM / FF | (33)–(36) | $s=\alpha+\lambda\cdot z$ |
| HJ misspecification | (37) | Min distance to pricing kernel |

## 15. Implications for Quant Equity Research

Even “atheoretical” multi-factor equity models live in Level 2. When a new factor is proposed, Hansen–Renault say the right tests are: Does $E[(a-b'f)R^e]=0$ hold conditionally? What is the HJ distance vs nested models? Is the implied $s$ often negative? Does the factor help price long-horizon claims (Level 5) or only one-period crosses? This elevates factor fishing into disciplined SDF evaluation.

## 16. Continuous-Time Pointer

Under Brownian information, Girsanov says the risk-neutral measure adds drifts $\mu^{\mathbb Q}=\mu^{\mathbb P}-\sigma\lambda$ with market prices of risk $\lambda$ encoded in the SDF’s diffusion loadings. The encyclopedia defers details to option-pricing econometrics entries, but the discrete constructions (6)–(11) are the exact analogues.

## 17. Acknowledgments and Related EQF Entries

The entry thanks Jarda Borovička. Related EQF articles flagged: Arrow–Debreu Prices; Complete Markets; Fixed Mix Strategy; Fundamental Theorem of Asset Pricing; Stochastic Discount Factors; Econometrics of Option Pricing; Entropy-based Estimation; Factor Models.

## 18. Bottom Line

Pricing kernels are not a single formula but a **representation theorem plus a research program**: represent prices as conditional expectations of payoff × kernel; identify kernels from preferences and frictions; estimate and test with GMM/HJ using limited asset menus; extend to long horizons via Markov operator factorizations. Hansen and Renault’s 2010 EQF article remains the shortest path into that program for quantitative researchers.

---

## 19. Detailed Walkthrough: From No-Arbitrage to Equation (1)

Start with a candidate price functional $\pi_{t,t+1}$ that is linear in payoffs conditional on $\mathcal{F}_t$. Linearity encodes the law of one price (portfolios add). Continuity in an $L^2$ topology plus the Riesz theorem yields a unique $q_{t+1}$ in the payoff space such that $\pi(p)=E(q p\mid\mathcal{F}_t)$. Strict positivity of $\pi$ on positive payoffs (no-arbitrage) forces $q>0$ a.s. when the space is rich enough—hence $s_{t+1}=q_{t+1}$ is a pricing kernel. If the traded payoff space is not rich, $q$ may leave the positive cone; extending markets or taking the Hansen–Richard approach restores a positive kernel that prices the original menu and possibly more.

This logic is why “existence of an SDF” and “no-arbitrage” are paired in teaching: one direction is immediate from (1); the converse needs function-space hypotheses spelled out in the entry’s Riesz and Radon–Nikodym bullets.

## 20. Multi-Period Consistency and the Martingale $M$

Once one-period kernels $s_j$ exist for each date, compounding $S_{t+1}=\prod s_j$ is not automatic without interim trading: one needs the law of iterated values so that pricing from 0 to $t+1$ coincides with pricing 0→1→…→$t+1$. That consistency produces the martingale property of $M_{t+1}=S_{t+1}/\bar S_{t+1}$ after stripping riskless discount factors. Equivalence of the changed measure across horizons is exactly the statement that conditional probabilities nested by the filtration remain coherent—an operational requirement for term-structure and option books that mark on a single risk-neutral engine.

## 21. Preference Parameters and Empirical Targets

| Parameter | Role | Empirical tension |
|-----------|------|-------------------|
| $\delta$ | Time preference | Level of real rate |
| $\rho$ | Inverse EIS (power) / EIS separator (EZ) | Bond risk vs equity |
| $\gamma$ | Risk aversion (EZ) | Equity premium |
| Habit $\phi$ | Surplus-consumption sensitivity | Countercyclical Sharpe |
| $\eta$ in (21) | Long-run discount | Persistent risk prices |

The encyclopedia does not resolve puzzles but shows where each parameter sits in the SDF—essential for interpreting structural estimation papers.

## 22. Incomplete Markets Numerics Intuition

Suppose idiosyncratic consumption growth variance rises in recessions. Then the cross-sectional moment $E[(C^j/C^a)^{-\rho}\mid\mathcal{F}]$ in (17) becomes more volatile, raising SDF volatility and risk premia without large $\rho$. Constantinides–Duffie formalize this; Hansen–Renault place it in the kernel taxonomy so empiricists know which moment of the consumption distribution identifies the mechanism.

## 23. Solvency Constraint Sharpness

Equation (19)’s $\min_j$ operator is extreme: one constrained agent pins the SDF. Empirically this predicts that SDF path tracks the lower envelope of consumption growth across groups (e.g., by wealth quintile)—a testable alternative to representative-agent power utility. Alvarez–Jermann and Chien–Lustig explore default punishments that motivate such constraints.

## 24. What “Related Article: Stochastic Discount Factors” Signals

EQF splits conceptual load: “Pricing Kernels” (this entry) emphasizes representation, preferences, and econometrics; the sister “Stochastic Discount Factors” entry likely stresses applications and examples. Readers should consult both. The authors’ joint presence (Hansen’s econometric SDF tradition; Renault’s econometric and reference-utility work) explains the balanced theory/estimation coverage.

## 25. Scholar-Use Summary Box

- **Type:** Encyclopedia survey (theory + econometrics).  
- **Core equations:** (1), (3)–(8), (12)–(21), (26)–(37).  
- **Tools to implement:** GMM on $E(s R^e\otimes z)=0$; HJ distance; optional CU-GMM.  
- **Do not:** treat linear projection $p^*$ as a state-price density for options without positivity.  
- **Do:** nest factor models inside SDF tests; report measure-change martingales for multi-period claims.

## 26. Final Emphasis

The entry’s lasting pedagogical contribution is the demonstration that apparently disparate topics—arbitrage-free pricing, recursive utility, habit externalities, limited commitment, GMM factor tests, and long-horizon operator methods—are chapters of one book whose central character is the pricing kernel $s_{t+1}$. Quantitative researchers who keep that unity in view waste less time translating between “risk-neutral,” “beta,” and “consumption-based” dialects and ship cleaner empirical designs.

Additional reference anchors repeatedly used above include Harrison–Kreps 1979, Hansen–Richard 1987, Hansen–Jagannathan 1991/1997, Hansen–Scheinkman 2009, Epstein–Zin 1989, Campbell–Cochrane 1999, Constantinides–Duffie 1996, and Alvarez–Jermann 2000/2005— the minimal bibliographic skeleton for any Scholar follow-up on SDF econometrics.

---

## 27. Extended Econometric Notes

**Instruments and conditioning.** When $G_t$ is nontrivial, multiplying (26) by instruments $z_t\in G_t$ and taking unconditional expectations yields a continuum of moments; in practice a finite instrument list (constant, lagged returns, dividend yields, consumption growth) is used. Weak instruments bias GMM toward OLS-like behavior—another reason Antoine et al.’s conditional CU-GMM is attractive.

**Finite-sample CU-GMM.** Hansen–Heaton–Yaron (1996) document that two-step GMM can be badly sized; continuously updated GMM improves behavior and connects to empirical likelihood. For SDF work with monthly equity data and $T\sim 500$–$1000$, prefer CU or EL over naive two-step with estimated optimal weights.

**HJ distance computation.** Project candidate SDF factors onto the return space; compute the second-moment distance between the SDF and the nearest exact pricing kernel in that space. Report the distance, its $p$-value under correct specification, and comparisons across nested factor sets (CAPM ⊂ FF3 ⊂ FF3+UMD, etc.).

**Positivity diagnostics.** After estimating linear $s=a-b'f$, report the fraction of periods with $s_t<0$. High negative rates signal that the linear factor approximation is a local pricing tool only, not a state-price density.

**Long-horizon claims.** To implement (21), estimate a Markov state (e.g., VAR in consumption growth, surplus consumption, or PCA of yields), solve an eigenfunction problem for $\hat f$, and back out $\eta$ and martingale increments—Hansen–Scheinkman (2009) is the technical reference.

## 28. Classroom Problem Set Seeds

1. Derive (6)–(7) from (1).  
2. Show that (12) prices the equity claim $C_{t+1}$ in a pure exchange Lucas tree.  
3. Prove that if $s>0$ a.s. then $\pi$ satisfies no-arbitrage.  
4. Given excess returns and a candidate factor, write the GMM moment vector and HJ objective.  
5. Explain why private-information SDF (18) uses $+\rho$ moments while incomplete-markets SDF (17) uses $-\rho$.

## 29. Closing Bibliographic Spine

Harrison–Kreps (1979); Hansen–Richard (1987); Hansen (1982 GMM); Hansen–Jagannathan (1991, 1997); Hansen–Scheinkman (2009); Epstein–Zin (1989); Campbell–Cochrane (1999); Constantinides–Duffie (1996); Alvarez–Jermann (2000, 2005); Gibbons–Ross–Shanken (1989); Hansen–Singleton (1982). These twelve references plus the EQF entry itself form a self-contained SDF curriculum for quant researchers.

---

## 30. One-Paragraph Executive Abstract

Pricing kernels (SDFs) represent no-arbitrage valuation as conditional expectation of payoff times a positive random discount factor; equivalently, as riskless discounting under an equivalent martingale measure. Hansen and Renault survey existence via Riesz/Radon–Nikodym, preference-based kernels (power, Epstein–Zin, habits, incomplete markets, private information, solvency constraints), long-term Markov factorizations, and econometric recovery via projections, linear beta models, GMM, and Hansen–Jagannathan distance—providing the standard map from theory to estimation for quantitative asset pricing.
