# Optimal Turnover, Liquidity, and Autocorrelation

**Authors:** Bastien Baldacci, Jerome Benveniste, and Gordon Ritter  
**Date:** January 26, 2022 (SSRN abstract 4018447)  
**Source PDF:** `OptimalTrading_RitterBaldacciBenveniste_2022.pdf`  
**Summary prepared:** 2026-09-24 (Scholar batch_2026-09-24_1)  
**OCR:** Not required; clean extract (~3,630 words; 11-page theory paper)

---

## 1. Problem and Motivation

Institutional active managers live inside a triangle: (i) **alpha autocorrelation / half-life**, (ii) **liquidity / market impact**, (iii) **risk aversion**. Grinold’s fundamental law $\mathrm{IR}\approx\mathrm{IC}\sqrt{N}$ is silent on all three of the *trading* dimensions that dominate real P&L: it always prefers higher turnover because independent bets over time increase $N$, with no cost term and no liquidity input.

Baldacci, Benveniste, and Ritter work in continuous time with **linear price impact** (Kyle $\lambda$) and a mean–quadratic-variation objective, and deliver:

1. **Theorem 1** — a very general optimal-trading result for *any* square-integrable forecast process $\mu_t$ (not just Markov jump-diffusions), generalizing Gârleanu–Pedersen (2016) and encompassing Almgren–Chriss (2001) execution as a special case.
2. An explicit **steady-state optimal turnover** formula (Eq. 20) for Ornstein–Uhlenbeck (OU) alphas:

$$
\text{optimal turnover}=\gamma\sqrt{\frac{\phi}{\gamma}+1},
$$

with $\gamma=\sqrt{\kappa\sigma^2/\lambda}$, $\phi$ = OU mean-reversion speed.
3. A matching **steady-state information ratio** (Eq. 23), plus a residual-asset argument that restores a Grinold-like $\sqrt{N}$ aggregation once factor risk is hedged.

The authors are explicit about the modeling compromise: empirics favor **square-root** impact (Tóth et al. 2011), but linear/quadratic cost yields closed forms that serve as heuristics, approximations, and bounds—the same justification Gârleanu–Pedersen (2013) give.

---

## 2. Setup

### 2.1 Steady-state turnover definition

Holdings $x_t$ in dollars. Steady-state turnover:

$$
\lim_{t\to\infty}\frac{E|\dot x_t|}{E|x_t|}. \tag{1}
$$

Units: inverse time (fraction of book traded per unit time).

### 2.2 Objective (multi-asset)

For adapted processes $x$ with $x(0)=x_0$,

$$
\max_x\; E\int_0^\infty\Bigl(\mu_t\cdot x_t - \tfrac12 \dot x_t\cdot\Lambda\dot x_t - \tfrac{\kappa}{2}x_t\cdot\Omega x_t\Bigr)dt. \tag{2}
$$

- $\mu_t$: expected excess-return forecast process (in $H$, mean-square integrable adapted processes).
- $\Lambda\succ 0$: market-impact matrix (linear impact ⇒ quadratic cost).
- $\Omega\succ 0$: quadratic co-variation of asset returns (risk).
- $\kappa>0$: absolute risk aversion.
- **No discounting** in the baseline theorem (extension remarks cover truncation).

Hilbert-space notation: $\langle x,y\rangle=E\int_0^\infty x_t\cdot y_t\,dt$. Sobolev space $A$: differentiable adapted processes with derivative in $H$.

### 2.3 Single-asset specialization

Scalars $\lambda$ (Kyle lambda), $\sigma^2$ (variance rate):

$$
\sup_x E\int_0^\infty\Bigl(\mu_t x_t - \tfrac{\kappa\sigma^2}{2}x_t^2 - \tfrac{\lambda}{2}\dot x_t^2\Bigr)dt. \tag{14}
$$

---

## 3. Theorem 1 — General Quadratic-Cost Optimum

**Theorem 1.** For $\mu\in H$, $\Omega,\Lambda\succ 0$, $\kappa>0$, unique optimum exists and solves the stochastically forced ODE

$$
\dot x_t = -\Gamma x_t + b_t, \tag{3}
$$

with rate matrix

$$
\Gamma=(\kappa\Lambda^{-1}\Omega)^{1/2} \tag{4}
$$

and

$$
b_t=\int_t^\infty e^{\Gamma(t-s)}\Lambda^{-1}E_t\mu_s\,ds. \tag{5}
$$

### 3.1 Proof architecture (convex analysis)

Rewrite $x=Ku$ with $(Ku)_t=\int_0^t u_s ds$. The problem becomes a convex program over $u$:

$$
\max_u\;\langle Ku,\mu\rangle -\tfrac12\langle u,\Lambda u\rangle -\tfrac{\kappa}{2}\langle Ku,\Omega Ku\rangle.
$$

Stationarity: $K^*\mu - \Lambda u - \kappa K^*\Omega Ku=0$, where $(K^*v)_t=\int_t^\infty E_t v_s\,ds$. Differentiating the conditional form yields the second-order linear ODE

$$
\frac{d^2}{dt^2}x_t^{t_0}=\kappa\Lambda^{-1}\Omega\,x_t^{t_0}-\Lambda^{-1}E_{t_0}\mu_t,
$$

solved by the variation-of-parameters formula that reduces to (3)–(5).

### 3.2 Remarks

- **Unbounded objective / stationary $\mu$:** if $E\int\|\mu\|^2=\infty$, truncate $\mu^K=1_{s<K}\mu_s$ and pass $K\to\infty$; under a mild exponential-moment condition on $E_t\mu_s$, $x^K\to x$ in mean-square on compact intervals.
- **Matrix square root:** $\Gamma=\kappa\Lambda^{-1/2}(\Lambda^{-1/2}\Omega\Lambda^{-1/2})^{1/2}\Lambda^{1/2}$ so only PSD symmetric roots are taken.
- **Recovery of GP (2016):** for Markov predictors and zero discounting, $\bar M_{\text{rate}}=\Gamma$, and the aim portfolio matches GP equation (12):

$$
\bar M^{\text{aim}}=\Gamma\int_t^\infty e^{\Gamma(t-s)}E_t[(\kappa\Omega)^{-1}\mu_s]\,ds.
$$

- **Almgren–Chriss:** finite-horizon execution with $\mu$ encoding a scheduled liquidation is nested.

Interpretation: **trade partially toward an aim** that is an exponentially weighted path of expected future Markowitz portfolios—the continuous-time analogue of Gârleanu–Pedersen’s “aim in front of the target.”

---

## 4. OU Alphas: Optimal Turnover and IR

### 4.1 Single-asset corollary

$$
\dot x_t=-\gamma x_t+m_t,\qquad \gamma=\sqrt{\frac{\kappa\sigma^2}{\lambda}},\qquad
m_t=\lambda^{-1}\int_t^\infty e^{-\gamma(s-t)}E_t\mu_s\,ds. \tag{15--17}
$$

### 4.2 OU forecast

$$
d\mu_t=-\phi\mu_t\,dt+\nu\,dW. \tag{18}
$$

Half-life $=\ln 2/\phi$. Then $E_t m_s=e^{-(\gamma+\phi)(s-t)}m_t$, and Gaussian-process calculations give:

**Optimal steady-state turnover (central formula):**

$$
\text{optimal turnover}=\gamma\sqrt{\frac{\phi}{\gamma}+1}. \tag{20}
$$

Equivalently

$$
\sqrt{\frac{\sigma}{\lambda}\Bigl(\phi\sqrt{\kappa\lambda}+\kappa\sigma\Bigr)}\quad\text{(paper’s intro display)}.
$$

**Steady-state IR (net of quadratic costs):**

$$
IR=\frac{\nu}{2\sigma}\sqrt{\frac{\gamma}{\phi(\phi+2\gamma)}}. \tag{23}
$$

(Equivalent form in the paper: $IR=\nu/(2\sigma)\cdot\sqrt{\gamma/[\phi(\phi+2\gamma)]}$.)

Also:

$$
m_t=\lambda^{-1}(\gamma+\phi)^{-1}\mu_t, \tag{21}
$$

$$
E[x_t\mu_t]=\lambda(\gamma+\phi)h(t)\quad\text{with }h\text{ from the GP variance calculation.} \tag{22}
$$

### 4.3 Numerical rule of thumb (paper’s example)

Parameters:

| Parameter | Value | Meaning |
|-----------|-------|---------|
| $\kappa$ | $10^{-6}$ | Absolute risk aversion |
| $\sigma$ | $0.01$/day | ~16% annualized vol if $\sqrt{252}\times 1\%$ |
| $\lambda$ | 10 bp per 1% of ADV | Kyle lambda |
| ADV | \$10M | Liquidity scale |
| $\Rightarrow\gamma$ | **0.1 / day** | Trading-speed rate |
| $\phi$ | 0.2 / day | Half-life $\approx\ln2/0.2\approx 3.5$ days |
| $\phi/\gamma$ | 2 | — |
| **Optimal turnover** | $\gamma\sqrt{3}\approx\mathbf{17.3\%/day}$ | Fraction of book |
| **IR** | $\approx 0.5\,\nu/\sigma$ | When $\phi/\gamma=2$ |

This is the desk-ready heuristic: once you estimate signal half-life ($\phi$), asset vol, impact $\lambda$, and risk aversion, (20) tells you the **turnover you should want**. If your strategy’s realized turnover is far above (20), you are overtrading relative to linear-impact optimum; far below, you are leaving alpha on the table.

### 4.4 Multi-asset / residual-asset Grinold restoration

For $N$ **statistically independent** assets with similar $(\phi,\lambda,\sigma)$, multiply (23) by $\sqrt{N}$. In equities, raw names are correlated; the paper’s fix is to trade **residual assets**—stock plus factor hedges that zero common-factor exposure under a Ross (1976) / multi-factor covariance. If the factor model is well specified, residuals are approximately independent, and

$$
IR_{\text{book}}\approx\sqrt{N_{\text{residual}}}\cdot IR_{\text{single}}
$$

becomes a **cost-aware fundamental law**: IC-like signal strength enters through $\nu$, breadth through $N_{\text{residual}}$, and liquidity/risk aversion through $\gamma(\kappa,\lambda,\sigma)$.

---

## 5. Theoretical Results Summary

| Result | Content |
|--------|---------|
| Theorem 1 | Optimal $\dot x=-\Gamma x+b$ for general $\mu\in H$ |
| Corollary 2 | Scalar reduction $\gamma=\sqrt{\kappa\sigma^2/\lambda}$ |
| Eq. (20) | OU optimal turnover $\gamma\sqrt{\phi/\gamma+1}$ |
| Eq. (23) | OU steady-state IR |
| Residual-$\sqrt{N}$ | Cost-aware FLAM under factor neutrality |

Comparative statics from (20)–(23):

- Higher $\phi$ (faster alpha decay) ⇒ **higher** optimal turnover (must trade faster to monetize fleeting signal) but **lower** IR for fixed $\nu$.
- Higher $\lambda$ (worse liquidity) ⇒ lower $\gamma$ ⇒ lower turnover and lower IR.
- Higher $\kappa$ ⇒ higher $\gamma$ ⇒ more aggressive trading toward aim, higher turnover.
- Higher $\sigma$ raises $\gamma$ but also risk in the IR denominator—net effect on IR is nuanced via (23).

---

## 6. Limitations

1. **Linear impact only.** Square-root impact is empirically preferred for large child orders; (20) is a heuristic/bound, not a calibrated microstructural law.
2. **Quadratic variation risk.** No drawdown constraints, no higher-moment risk, no bankruptcy.
3. **Single OU factor.** Real books have multi-horizon signals (as in GP 2013); Theorem 1 covers that via general $\mu_t$, but the simple turnover formula (20) is OU-specific.
4. **No temporary/permanent impact split** beyond the Kyle linear term; no maker–taker microstructure.
5. **Parameter estimation.** $\lambda$, $\phi$, $\nu$, $\kappa$ must be estimated; errors map nonlinearly into turnover targets.
6. **Infinite horizon / no discounting** baseline; practitioners with finite mandates need the truncation construction in Remark 1.

---

## 7. Practical Takeaways for a Quant Investor

1. **Replace “more turnover ⇒ more IR” with (20).** Build a dashboard: estimated $\phi$ per signal sleeve, $\lambda(\text{name})$, $\sigma$, desk $\kappa$ ⇒ target turnover band.
2. **Example calibration workflow.**
   - Half-life 3.5 days ⇒ $\phi\approx 0.2$/day.
   - Fit Kyle $\lambda$ from VWAP shortfall vs. participation (or vendor TCA).
   - Set $\kappa$ from max active-risk budget / typical book size.
   - Compute $\gamma$ and (20); compare to actual two-way turnover.
3. **IR budgeting with (23).** Before launching a sleeve, estimate $\nu/\sigma$ (signal vol over asset vol) and expected net IR; reject sleeves with model IR below hurdle after costs.
4. **Use residual space for $\sqrt{N}$.** Quote capacity and IR in factor-neutral residual units; otherwise Grinold aggregation overstates breadth.
5. **Bridge to GP (2013).** Theorem 1 is the continuous-time, zero-discount, general-$\mu$ parent of GP’s aim/partial-trading rules. Multi-horizon signals: apply Theorem 1’s $b_t$ integral with $E_t\mu_s$ from the joint predictive system; do not naively sum single-OU turnovers.
6. **Square-root impact overlay.** Treat (20) as a **lower bound on patience** when true impact is concave: if linear-impact optimum already says “slow down,” square-root impact usually says slow down more for large clips.
7. **Execution desk link.** Almgren–Chriss liquidation is the $\mu$-scheduled special case; the same $\Gamma$ machinery prices the option to “wait for alpha” vs. “finish the order.”

---

## 8. Relation to Grinold and to Gârleanu–Pedersen

Grinold: $\mathrm{IR}\approx\mathrm{IC}\sqrt{N}$—no $\lambda$, no $\phi$, no $\kappa$.  
GP (2013, 2016): dynamic trading with costs; Markov predictors; discrete or continuous time with discounting.  
This paper: (i) strips Markov/discounting assumptions in Theorem 1; (ii) extracts the **scalar observables** managers actually argue about—turnover and steady-state IR—in closed form for OU; (iii) reconnects to Grinold via residual $\sqrt{N}$.

The intellectual progression for a desk:

$$
\text{Grinold IR} \;\rightarrow\; \text{CST/Clarke full-}\Omega\text{ IR/TC} \;\rightarrow\; \text{GP dynamic aim} \;\rightarrow\; \text{Ritter et al. turnover (20)}.
$$

---

## 9. Extended Discussion of Equation (20)

Rewrite

$$
\tau^*=\gamma\sqrt{1+\phi/\gamma}=\sqrt{\gamma(\gamma+\phi)}.
$$

So optimal turnover is the geometric mean of the trading-speed rate $\gamma$ and the “aim-update rate” $\gamma+\phi$. When $\phi\ll\gamma$ (slow alpha, fast trading capacity), $\tau^*\approx\gamma$: you trade at the friction-limited speed, and the book closely tracks the aim. When $\phi\gg\gamma$ (fast alpha, slow trading capacity), $\tau^*\approx\sqrt{\gamma\phi}$: turnover grows only with the square root of signal urgency—you **cannot** fully monetize fast signals in illiquid names, and IR (23) collapses accordingly.

This is the quantitative version of a qualitative truth every PM knows: **high-frequency alpha in a small-cap book is mostly worthless once impact is priced**.

---

## 10. Worked Micro-Example Variations

Hold $\gamma=0.1$/day fixed:

| $\phi$ (1/day) | Half-life | $\phi/\gamma$ | Turnover $\tau^*$ | Comment |
|------------------|-----------|-----------------|--------------------|---------|
| 0.05 | ~14 days | 0.5 | $0.1\sqrt{1.5}\approx 12.2\%$/day | Patient signal |
| 0.2 | ~3.5 days | 2 | **17.3%**/day | Paper base case |
| 0.5 | ~1.4 days | 5 | $0.1\sqrt{6}\approx 24.5\%$/day | Fast signal |
| 1.0 | ~0.7 days | 10 | $0.1\sqrt{11}\approx 33.2\%$/day | Intraday-ish |

Hold $\phi=0.2$, vary liquidity via $\gamma$:

| $\gamma$ | $\tau^*$ | Interpretation |
|------------|-----------|----------------|
| 0.05 | $0.05\sqrt{5}\approx 11.2\%$ | More patient / less liquid |
| 0.1 | 17.3% | Base |
| 0.2 | $0.2\sqrt{2}\approx 28.3\%$ | More liquid / higher $\kappa$ |

---

## 11. Bottom Line

Baldacci–Benveniste–Ritter (2022) give the cleanest available **closed-form map** from $(\phi,\lambda,\sigma,\kappa)$ to optimal turnover and net IR under linear impact. Theorem 1 is the general engine; Equation (20) is the pocket formula. For quant investors, the actionable discipline is: estimate half-lives and Kyle lambdas, compute $\tau^*$, and treat large deviations of realized turnover from $\tau^*$ as a first-order research bug—not a badge of “high conviction activity.”

---

## 12. Derivation Sketch: From OU to Turnover (20)

Under the scalar ODE $\dot x=-\gamma x+m_t$ with $E_t m_s=e^{-\theta(s-t)}m_t$ and $\theta=\gamma+\phi$, the stationary process $(x_t,m_t)$ is Gaussian. Matching second moments:

1. From $\dot x=-\gamma x+m$, in steady state $E\dot x=0\Rightarrow Em=\gamma Ex$ (means; for OU centered at 0, work with variances).
2. Itô/ODE variance calculation for the linear filter yields a constant $h=E[x_t m_t]$ in steady state.
3. Turnover definition uses $E|\dot x|/E|x|$. For zero-mean jointly Gaussian $(x,\dot x)$, $E|x|=\sqrt{2\mathrm{Var}(x)/\pi}$ and similarly for $\dot x$, so the $\sqrt{2/\pi}$ factors cancel and

$$
\frac{E|\dot x|}{E|x|}=\sqrt{\frac{\mathrm{Var}(\dot x)}{\mathrm{Var}(x)}}.
$$

4. From $\dot x=-\gamma x+m$ and the exponential-decay structure, $\mathrm{Var}(\dot x)/\mathrm{Var}(x)=\gamma(\gamma+\phi)=\gamma^2(1+\phi/\gamma)$, hence

$$
\tau^*=\gamma\sqrt{1+\phi/\gamma}.
$$

This Gaussian absolute-moment cancellation is why the paper can move freely between $L^1$ turnover (1) and $L^2$ calculations.

### 12.1 IR derivation outline

Net expected P&L rate: $E[x\mu-(\lambda/2)\dot x^2]$. Risk in the denominator: $\sqrt{E[\sigma^2 x^2]}$. Using $m=\lambda^{-1}(\gamma+\phi)^{-1}\mu$ to eliminate $\mu$, and substituting steady-state moments, produces

$$
IR=\frac{\nu}{2\sigma}\sqrt{\frac{\gamma}{\phi(\phi+2\gamma)}}.
$$

When $\phi=2\gamma$, $IR=\nu/(8\gamma\sigma)\approx 0.5\nu/\sigma$ as stated—signal-to-asset vol ratio sets the scale; $\gamma$ in the denominator shows that *more aggressive trading capacity* (higher $\gamma$) does **not** linearly buy IR, because you also scale up cost and risk.

---

## 13. Mapping Theorem 1 to Discrete-Time GP Practice

Gârleanu–Pedersen discrete-time recursion (schematic):

$$
x_t=(I-\Lambda_{\text{speed}})x_{t-1}+\Lambda_{\text{speed}}A_t,
$$

with aim $A_t$ overweighting slow signals. Continuum limit with quadratic costs → ODE (3). Practical recipe:

1. Estimate multi-signal state space for $\mu_t$ (VAR / Kalman).
2. Compute $E_t\mu_s$ for $s>t$ from the state transition.
3. Numerically integrate (5) for $b_t$ (or use matrix-closed forms when $\mu$ is Markov linear).
4. Step $\dot x=-\Gamma x+b$ at the decision frequency; $\Gamma=(\kappa\Lambda^{-1}\Omega)^{1/2}$.
5. Compare implied turnover to (20) sleeve-by-sleeve as a sanity check when each sleeve is approximately OU.

---

## 14. Capacity and ADV Scaling

Kyle $\lambda$ often scales as $\lambda\propto\sigma/\text{ADV}$ (price impact per dollar). Then

$$
\gamma=\sqrt{\kappa\sigma^2/\lambda}\propto\sqrt{\kappa\,\sigma\cdot\text{ADV}}.
$$

Doubling ADV (more liquid name) raises $\gamma$ like $\sqrt{2}$, raising optimal turnover and IR. Doubling AUM at fixed ADV is equivalent to worsening effective $\lambda$ in dollar units—capacity bites through (20) automatically. This is the right way to answer “how much capital can this signal take?”: solve for AUM such that model IR (23) still clears the hurdle after the AUM-dependent $\lambda$.

### 14.1 Example capacity thought experiment

Base case: ADV \$10M, $\gamma=0.1$, $\tau^*=17.3\%$/day, IR $\approx 0.5\nu/\sigma$.  
If AUM in the name’s residual book is \$5M (50% of ADV as typical position scale—aggressive), impact parameters worsen; if $\lambda$ doubles, $\gamma$ falls by $\sqrt{2}$ to $\approx 0.071$, $\tau^*\approx 0.071\sqrt{1+0.2/0.071}\approx 13.3\%$/day, and IR drops via (23). Report that IR-vs-AUM curve next to any new signal pitch.

---

## 15. Failure Modes When Using (20) Blindly

1. **Misestimated half-life.** Using formation-period length as half-life is wrong; estimate $\phi$ from AR(1) on the *forecast* series, not on returns.
2. **Alpha already includes costs.** If $\mu_t$ is a net-of-cost forecast, you double-count $\lambda$.
3. **Correlated multi-name book without residualization.** Applying scalar (20) name-by-name ignores cross-impact and cross-risk; use matrix $\Gamma$ from Theorem 1.
4. **Square-root impact world.** For participation rates $\gg 1\%$, linear $\lambda$ understates cost convexity at low rates and overstates at high rates differently than $\sqrt{\cdot}$; re-optimize numerically.
5. **Changing $\phi$ through time.** Crisis periods: $\phi$ rises (alphas die faster) and $\lambda$ rises (liquidity worsens)—both push IR down; turnover target from (20) may rise or fall depending on which effect dominates $\phi/\gamma$.

---

## 16. Links to Clarke et al. Fundamental Law

Clarke–de Silva–Thorley give ex-ante IR $=\mathrm{TC}\sqrt{\alpha'\Omega^{-1}\alpha}$ **ignoring costs**. Ritter et al. give the dynamic, cost-aware IR (23). A coherent stack:

1. Build cost-aware aim / traded alpha via Theorem 1 (or GP).
2. Feed that $\alpha$ into Clarke’s full-$\Omega$ optimizer with constraints → TC.
3. Report both frictionless Clarke IR and Ritter steady-state IR; the gap is the combined cost+constraint tax.

---

## 17. References Context (Selected)

- Almgren–Chriss (2001): optimal execution; nested in Theorem 1.
- Almgren et al. (2005): empirical equity impact.
- Gârleanu–Pedersen (2013 JF, 2016 JET): dynamic trading with frictions; Markov case.
- Kyle (1985): $\lambda$ definition.
- Tóth et al. (2011 PRX): square-root impact.
- Cartea–Jaimungal–Ricci / Guéant: HFT and market-making books in the same LQ family.
- Lehalle–Neuman (2019): signals in optimal trading.
- Grinold (1989): classical FLAM to which (23)+$\sqrt{N}$ is the modern reply.

---

## 18. Desk Checklist

- [ ] Estimate $\phi$ per signal (AR on forecast).
- [ ] Estimate $\lambda$ per name (TCA regression).
- [ ] Set $\kappa$ from risk budget / NAV.
- [ ] Compute $\gamma$, $\tau^*$ (20), model IR (23).
- [ ] Compare $\tau^*$ to realized two-sided turnover.
- [ ] Residualize for $\sqrt{N}$ aggregation.
- [ ] Stress: $\lambda\times 2$, $\phi\times 2$, crisis vol.
- [ ] Document where square-root impact would change decisions.

---

## 19. Bottom Line (Extended)

The paper’s gift is compression: a general Hilbert-space theorem plus two scalar formulas a PM can tattoo on a whiteboard—**(20)** for turnover and **(23)** for IR. Everything else (multi-asset $\Gamma$, residual $\sqrt{N}$, GP nesting) is about applying those ideas without lying about correlation or liquidity. If your process cannot state $\phi$ and $\lambda$, you cannot state a rational turnover; if you cannot state a rational turnover, your IR targets are fiction.

---

## 20. Continuous-Time vs Discrete Trading Frequency

Suppose the desk rebalances only daily. Interpreting (20) with a daily time unit means $\tau^*$ is the expected fraction of book turned per day. If the true decision frequency is hourly, redefine $\phi,\gamma,\sigma,\lambda$ in hourly units; $\tau^*$ then answers “fraction per hour.” Inconsistency between estimation frequency and trading frequency is a common way to get absurd $\tau^*$ (e.g., 200%/day). Always state the time unit next to $\phi$ and $\gamma$.

### 20.1 Intraday signals

For signals with half-life of hours, $\phi$ large in daily units. Linear-impact (20) will demand very high turnover; in practice square-root impact and exchange constraints dominate—use Theorem 1 as a qualitative warning that the signal is in the “hard to monetize” region rather than as a literal child-order scheduler.

### 20.2 Slow signals (months)

Value, quality, defensive: $\phi$ small. Then $\tau^*\approx\gamma$, and the binding constraint is usually TC / mandate (Clarke), not (20). Still compute (20): if realized turnover $\gg\gamma$, you are churning a slow signal—classic IR destruction.

---

## 21. Estimating Each Input

**$\phi$:** Fit AR(1) to the out-of-sample forecast time series (not to returns). If forecast is a z-score, AR on the z-score. For multi-horizon blends, either (a) use Theorem 1 with the full state, or (b) report $\tau^*$ per component.

**$\nu$:** Innovation vol of the OU (residual std of AR). Together $\nu/\sqrt{2\phi}$ is stationary alpha vol.

**$\sigma$:** Same return horizon as the ODE time unit; use residual vol if trading residuals.

**$\lambda$:** Regress implementation shortfall on signed participation; slope is Kyle $\lambda$. Vendors: use temporary impact coefficient consistent with linear model. Convert % price per % ADV into dollar impact per dollar traded squared carefully.

**$\kappa$:** Back out from $\gamma$ if you have a target trading speed, or from utility calibration ($\kappa\approx\lambda_U / \text{NAV}$ style conversions). Document the choice; IR (23) is sensitive to it.

---

## 22. Sensitivity Table for IR (23)

Fix $\nu/\sigma=1$ (strong signal). IR as function of $\phi/\gamma$:

| $\phi/\gamma$ | $IR/( \nu/\sigma)$ factor $\frac12\sqrt{\gamma/[\phi(\phi+2\gamma)]}\cdot\sigma/\nu$ wait—use formula |
|---|---|
| 0.5 | $\frac12\sqrt{1/[0.5\gamma\cdot 2.5\gamma]}=\frac12\sqrt{1/(1.25\gamma^2)}=\frac{1}{2\gamma\sqrt{1.25}}$ |
| 2 | $\frac12\sqrt{1/[2\gamma\cdot 4\gamma]}=\frac12\sqrt{1/(8\gamma^2)}=1/(4\sqrt{2}\,\gamma)$ relative structure |

Point: for fixed $\gamma$, slower mean reversion (smaller $\phi$) raises IR—patient alpha is more valuable under costs. Fast alpha needs either better liquidity (higher $\gamma$) or acceptance of lower IR.

---

## 23. Philosophical Note on “Activity”

Many organizations reward turnover as a proxy for “using the risk budget.” Equation (20) reframes activity as a **derived** quantity. The primitives are beliefs ($\phi,\nu$), markets ($\lambda,\sigma$), and preferences ($\kappa$). PMs who cannot name those primitives but defend a turnover target are cargo-culting execution.

---

## 24. Final Synthesis

Theorem 1 generalizes optimal trading under quadratic costs to arbitrary square-integrable forecasts. Specializing to OU alphas yields the memorable pair:

$$
\tau^*=\gamma\sqrt{1+\phi/\gamma},\qquad IR=\frac{\nu}{2\sigma}\sqrt{\frac{\gamma}{\phi(\phi+2\gamma)}},
$$

with $\gamma=\sqrt{\kappa\sigma^2/\lambda}$. Residual-asset $\sqrt{N}$ restores a cost-aware fundamental law. Use the formulas as governance tools: every strategy must show $\phi$, $\lambda$, $\tau^*$, and model IR before it scales.

---

## 25. Comparison Table: Turnover Rules of Thumb

| Rule | Formula / Idea | Uses $\phi$? | Uses $\lambda$? | Notes |
|------|----------------|----------------|-------------------|-------|
| Grinold FLAM | Maximize turnover to raise $N$ | No | No | Systematically overtrades |
| Fixed calendar | Rebalance monthly/quarterly | No | Implicit | Ignores signal speed |
| GP partial rate | Matrix speed from $\Lambda,\Sigma,\kappa$ | Via aim | Yes | Needs full system |
| **Ritter (20)** | $\gamma\sqrt{1+\phi/\gamma}$ | **Yes** | **Yes** | Best scalar OU heuristic |
| Square-root num. | Solve HJB / NLP | Yes | Nonlinear | Accurate for large clips |

---

## 26. Multi-Signal Worked Story

Suppose two OU signals on the same residual asset: fast $\phi_f=0.5$/day, slow $\phi_s=0.05$/day, equal $\nu$. Theorem 1 says the aim $b_t$ integrates both conditional paths with kernel $e^{-\gamma(s-t)}$. The fast signal’s contribution to aim is heavily discounted in the integral; the slow signal dominates holdings. Naive application of (20) separately might suggest trading the fast sleeve at $\tau_f^*=\gamma\sqrt{1+0.5/\gamma}$ and the slow at $\tau_s^*=\gamma\sqrt{1+0.05/\gamma}$—but the optimal book is **not** the sum of two independently traded OU strategies when they share the same $x_t$ and cost $\lambda\dot x^2$. Share one position process; allocate aim weights by the GP/Theorem-1 integral. This is exactly why GP (2013) emphasize “aim in front” with heterogeneous decay.

---

## 27. Unit Consistency Appendix

Let time unit be **days**. Then:

- $\sigma$: daily return std (e.g., 0.01).
- $\phi,\gamma,\tau^*$: 1/day.
- $\lambda$: such that $\lambda\dot x^2$ has units of (return × dollars)/time if $x$ is dollars—calibrate carefully to the objective’s units.
- $\kappa$: 1/(dollars × return) style absolute risk aversion.

If $x$ is measured in **shares** or **% of NAV**, redefine $\lambda,\kappa,\sigma$ consistently. Most desk errors in applying (20) are unit errors, not math errors.

---

## 28. Closing Restatement

Optimal turnover is not a cultural preference; it is $\gamma\sqrt{1+\phi/\gamma}$. Optimal IR under OU linear impact is (23). Theorem 1 justifies both as projections of a general LQ optimum. Build the estimation pipeline for $(\phi,\lambda,\sigma,\kappa)$; then governance is comparing realized turnover and realized IR to these targets every month.

---

## 29. One-Page Executive Summary for CIO

**Question:** How much should we turn over given signal speed and liquidity?  
**Answer:** Estimate half-life $\Rightarrow\phi$, impact $\Rightarrow\lambda$, vol $\sigma$, risk aversion $\kappa$. Set $\gamma=\sqrt{\kappa\sigma^2/\lambda}$ and target turnover $\gamma\sqrt{1+\phi/\gamma}$.  
**Question:** What IR is fair after costs?  
**Answer:** For OU alphas, $IR=(\nu/(2\sigma))\sqrt{\gamma/[\phi(\phi+2\gamma)]}$; scale by $\sqrt{N}$ only in residual space.  
**Governance:** Strategies whose realized turnover exceeds target by $>50\%$ without a documented $\phi$ increase are overtrading.
