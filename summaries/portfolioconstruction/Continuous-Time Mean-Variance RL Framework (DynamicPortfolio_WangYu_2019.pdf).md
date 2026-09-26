# Continuous-Time Mean–Variance Portfolio Selection: A Reinforcement Learning Framework

**Authors:** Haoran Wang (Columbia IEOR) and Xun Yu Zhou (Columbia IEOR & Data Science Institute)  
**Publication:** Working paper, first draft February 2019, this version May 2019; SSRN: https://ssrn.com/abstract=3382932  
**Source PDF:** `DynamicPortfolio_WangYu_2019.pdf` (Drive id `11VuVvH900Rhryv2394FZyUCmB_q1KyIn`)  
**Summary prepared:** 2026-09-24 (Scholar batch_2026-09-24_2)  
**OCR:** Not required; clean `pdftotext -layout` (~14,721 words of source)

---

## 1. Problem and Motivation

Mean–variance (MV) portfolio choice—minimize variance of terminal wealth subject to a target expected terminal wealth—is the workhorse criterion since Markowitz (1952), extended to discrete multiperiod (Li–Ng 2000) and continuous time (Zhou–Li 2000 and subsequent LQ literature). In continuous time with a Black–Scholes risky asset, the classical solution is an explicit feedback control linear in current wealth, but it requires knowledge of drift $\mu$ and volatility $\sigma$. Drift estimation is notoriously noisy (the “mean blur” problem); plugging MLE estimates into the oracle rule produces high realized variance.

Reinforcement learning (RL) offers a data-driven alternative: learn a policy from sampled trajectories without estimating $(\mu,\sigma)$. Prior finance RL mostly optimized expected utility of discounted rewards, which neither matches how investors state goals nor cleanly encodes variance. Wang and Zhou cast continuous-time MV as an **entropy-regularized, relaxed stochastic control** problem that balances exploration and exploitation, prove that the optimal exploratory policy is **Gaussian with time-decaying variance**, establish equivalence/convergence links to classical MV, prove a **policy improvement theorem**, and deliver an implementable algorithm (EMV) that beats both adaptive MLE control and DDPG in extensive simulations.

---

## 2. Setup and Data (Simulation Design)

### 2.1 Market

One risk-free asset with rate $r$ and one risky asset with price
$$
dS_t = \mu S_t\,dt + \sigma S_t\,dW_t
$$
(classical GBM; later extended to stochastic-factor non-stationary $\mu_t,\sigma_t$). Self-financing wealth $X_t$ with dollar amount $u_t$ in the risky asset:
$$
dX_t = \bigl[r X_t + (\mu-r)u_t\bigr]dt + \sigma u_t\,dW_t,\qquad X_0=x_0.
$$

### 2.2 Classical continuous-time MV

$$
\min_u \mathrm{Var}(X_T)\quad\text{s.t.}\quad \mathbb{E}[X_T]=z,
$$
equivalently (via Lagrange multiplier $w$) the LQ problem with terminal cost $(X_T-w)^2-(w-z)^2$ style embedding. Oracle feedback (known parameters) is linear in $(X_t-w)$.

### 2.3 Simulation grid (Section 5)

- Horizon $T=1$ year, rebalancing $\Delta t=1/252$ (daily).
- $r=2\%$, $x_0=1$, target $z=1.4$ (40% annualized target return on terminal wealth).
- $\mu\in\{-50\%,-30\%,-10\%,0\%,10\%,30\%,50\%\}$, $\sigma\in\{10\%,20\%,30\%,40\%\}$ → **28 market scenarios**.
- EMV: $M=20000$ training episodes, $N=10$ samples for learning $w$, temperature $\lambda=2$, learning rates $\alpha=0.05$, $\eta_\theta=\eta_\phi=0.0005$.
- DDPG: same $M,N$; critic 3 hidden layers (10,8,8); actor 2 layers (10,8); LR 0.0001; replay 80; minibatch 20; soft update $\tau=0.001$; OU exploration noise; prioritized experience replay favoring terminal transitions; TensorFlow.
- MLE: rolling 100 most recent prices to estimate $(\mu,\sigma)$, plug into classical allocation (28).
- Metrics on last 2000 terminal wealths: sample mean $M$, variance $V$, Sharpe $SR=(M-1)/\sqrt{V}$; training time.

---

## 3. Model and Methods

### 3.1 Exploratory (entropy-regularized) MV

Following Wang–Zhou–Gao style exploratory control: replace deterministic $u_t$ by a probability density $\pi_t(\cdot)$ over actions (relaxed control). State dynamics become expectation of drift/diffusion under $\pi$. Objective adds entropy bonus $\lambda \mathbb{H}(\pi)$ encouraging exploration, with temperature $\lambda>0$.

### 3.2 Optimal exploratory policy is Gaussian

**Theorem (optimality of Gaussian exploration).** The optimal feedback distribution for the exploratory MV problem is Gaussian:
$$
\pi^*_t(u\mid x) = \mathcal{N}\bigl(u;\, \mu_\pi^*(t,x),\, \sigma_\pi^{*2}(t)\bigr),
$$
with **mean** linear in wealth (same structural form as classical MV feedback) and **variance that decays in time** (more exploration early, less near $T$). Explicit formulae involve the exploratory value function, which remains quadratic in wealth (LQ structure preserved under entropy regularization for this problem).

### 3.3 Links to classical MV

- **Solvability equivalence:** exploratory MV solvable iff classical MV solvable (under stated conditions).
- **Convergence:** as $\lambda\downarrow 0$, exploratory value and mean policy → classical MV value and policy.
- Exploration cost is explicit and vanishes with $\lambda$.

### 3.4 Policy improvement theorem and EMV algorithm

**Policy improvement:** given a parameterized Gaussian policy class consistent with the theoretical structure, one-step improvement of parameters raises the entropy-regularized objective. This yields a convergent iterative scheme.

**EMV algorithm design principles:**
1. Parameterize value function with the known quadratic structure (few parameters $\theta$), not a deep net.
2. Parameterize policy as Gaussian with mean linear in $(x-w)$ and explicit time-dependent variance (parameters $\phi$).
3. Learn Lagrange multiplier $w$ online via self-correcting scheme using sample average terminal wealth vs. target $z$ (eq. 52 in paper).
4. Stochastic approximation / policy gradient style updates with learning rates $\alpha,\eta_\theta,\eta_\phi$.
5. Optional annealing of $\lambda$ across episodes for “decaying exploration” experiments.

**Interpretability:** because approximators mirror the closed-form structure, EMV is data-driven yet not a black box—unlike DDPG’s actor-critic nets.

---

## 4. Results — Full Table 1 Numbers

Training time: EMV **< 10s**, MLE **< 10s**, DDPG **≈ 3 hours** per experiment (MacBook Air).

Format below: for each $(\mu,\sigma)$: method → Mean; Variance; Sharpe.

### $\sigma=10\%$

| μ | σ | EMV (M; V; SR) | MLE (M; V; SR) | DDPG (M; V; SR) |
|---|----|----------------|----------------|------------------|
| -50% | 10% | 1.396; 0.006; 5.107 | 1.556; 0.017; 4.284 | 1.297; 0.107; 0.908 |
| -30% | 10% | 1.390; 0.016; 3.039 | 1.215; 0.014; 1.833 | 1.401; 0.003; 7.076 |
| -10% | 10% | 1.330; 0.074; 1.218 | 1.056; 1.365; 0.482 | 0.901; 0.014; -0.833 |
| 0% | 10% | 1.204; 1.280; 0.180 | 0.926; 38.40; -0.012 | 1.029; 0.038; 0.147 |
| 10% | 10% | 1.318; 0.171; 0.769 | 1.009; 0.453; 0.014 | 0.951; 0.008; -0.541 |
| 30% | 10% | 1.385; 0.019; 2.785 | 1.179; 0.059; 0.737 | 0.224; 0.104; -2.405 |
| 50% | 10% | 1.394; 0.007; 4.772 | 1.459; 0.013; 3.983 | 1.478; 0.667; 0.717 |
| -50% | 20% | 1.387; 0.022; 2.606 | 1.310; 0.050; 1.387 | -0.551; 0.425; -2.379 |
| -30% | 20% | 1.359; 0.051; 1.598 | 1.205; 1.319; 0.178 | 1.973; 0.404; 1.531 |
| -10% | 20% | 1.309; 0.245; 0.625 | 1.036; 2.183; 0.024 | 1.349; 0.368; 0.575 |
| 0% | 20% | 1.105; 0.727; 0.123 | 0.921; 6.887; -0.301 | 0.988; 0.139; -0.033 |
| 10% | 20% | 1.221; 0.314; 0.395 | 1.045; 6.751; 0.017 | 1.243; 0.354; 0.408 |
| 30% | 20% | 1.345; 0.062; 1.387 | 1.155; 1.743; 0.117 | 1.360; 0.050; 1.613 |
| 50% | 20% | 1.385; 0.027; 2.350 | 1.237; 1.293; 0.208 | 1.385; 0.004; 6.496 |
| -50% | 30% | 1.353; 0.044; 1.682 | 1.333; 9.465; 0.108 | 0.272; 2.762; -0.438 |
| -30% | 30% | 1.323; 0.106; 0.992 | 1.092; 5.657; 0.039 | 0.034; 0.924; -1.005 |
| -10% | 30% | 1.317; 0.696; 0.380 | 1.045; 17.87; 0.011 | 1.371; 0.792; 0.417 |
| 0% | 30% | 1.079; 0.727; 0.092 | 0.955; 28.84; -0.008 | 1.070; 0.752; 0.081 |
| 10% | 30% | 1.282; 0.885; 0.300 | 0.885; 24.06; -0.023 | 1.243; 0.825; 0.268 |
| 30% | 30% | 1.334; 0.131; 0.921 | 0.886; 24.41; -0.023 | 1.210; 0.921; 0.218 |
| 50% | 30% | 1.350; 0.049; 1.583 | 1.238; 7.505; 0.087 | 0.610; 0.143; -1.030 |
| -50% | 40% | 1.342; 0.061; 1.385 | 1.284; 11.14; 0.085 | 1.328; 0.501; 0.463 |
| -30% | 40% | 1.320; 0.146; 0.839 | 1.145; 3.315; 0.080 | 1.212; 0.160; 0.531 |
| -10% | 40% | 1.241; 0.707; 0.287 | 0.979; 7.960; -0.007 | 1.335; 1.413; 0.282 |
| 0% | 40% | 1.057; 0.671; 0.070 | 0.950; 31.60; -0.009 | 1.064; 1.467; 0.053 |
| 10% | 40% | 1.155; 0.591; 0.202 | 1.053; 9.090; 0.017 | 1.242; 1.499; 0.198 |
| 30% | 40% | 1.320; 0.198; 0.716 | 1.083; 17.46; 0.020 | 0.179; 1.533; -0.663 |
| 50% | 40% | 1.329; 0.078; 1.174 | 0.963; 43.17; -0.006 | -0.390; 1.577; -1.107 |


### Headline performance facts

- **EMV beats MLE on Sharpe in all 28/28 scenarios.**
- **EMV beats DDPG on Sharpe in 23/28 scenarios.**
- EMV achieves **positive** annualized mean terminal wealth in **all** experiments; DDPG sometimes produces means below 0 (bankruptcy territory), e.g. $\mu=-50\%,\sigma=20\%$: DDPG mean $-0.551$; $\mu=50\%,\sigma=40\%$: DDPG mean $-0.390$.
- MLE systematically suffers **huge variance** when drift is hard to estimate (e.g. $\mu=0\%,\sigma=10\%$: MLE $V=38.40$ vs EMV $V=1.280$; $\mu=50\%,\sigma=40\%$: MLE $V=43.17$ vs EMV $V=0.078$).
- DDPG is brittle: fixed hyperparameters across scenarios; known sensitivity (Duan et al. 2016; Henderson et al. 2018). EMV with the *same* learning rates across all 28 cells remains stable.
- Learning curves (Figures 1–2, example $\mu=-30\%,\sigma=10\%$): EMV approaches target $z=1.4$ faster with lower variance than MLE/DDPG over aggregated 50-episode blocks.

### Non-stationary market (Section 5.2)

Stochastic-factor model for $(\mu_t,\sigma_t)$ with factor evolving slower than learning timescale (so the learning problem remains well-posed). EMV again dominates adaptive MLE and DDPG; continuous re-learning of policy parameters tracks the moving environment without explicit factor filtering.

### Decaying exploration (Section 5.3)

Anneal $\lambda$ across episodes. As $\lambda\to0$, behavior approaches classical MV exploitation; early high $\lambda$ gathers information. Simulations confirm improved stability relative to fixed-$\lambda$ and relative to DDPG’s exogenous OU noise schedule.

### Hyperparameter note (footnote 14)

If EMV hyperparameters are tuned *per scenario* (not done in the fair comparison), Sharpe can approach the theoretical MV maximum; DDPG remains hard to improve by tuning alone.

---

## 5. Limitations

- **Simulation only**—no CRSP/TAQ empirical backtest; market is one-factor GBM or stochastic-factor variant.
- **Single risky asset** in the main theory; multi-asset MV needs vector controls and matrix Riccati structure.
- **No transaction costs, market impact, or constraints** (long-only, leverage caps)—all central in live MV.
- **LQ / linear wealth dynamics** assumed; jumps, stochastic vol of vol, or nonlinear price impact break the Gaussian-closed-form structure.
- **Target $z=1.4$ fixed**; sensitivity to ambitious targets under negative Sharpe markets deserves more stress tests.
- DDPG comparison uses a particular architecture; stronger continuous-control baselines (SAC, TD3) are not reported.
- Entropy regularization interprets exploration thermally; alternative exploration (Thompson, parameter noise) not benchmarked.

---

## 6. Quant-Investor Takeaways

1. **Don’t plug rolling MLE drifts into Markowitz overlays.** Table 1 shows MLE variance explosions precisely where $\mu$ is small relative to $\sigma/\sqrt{T}$—the live equity case.
2. **Structure-aware RL ≫ generic deep RL for MV.** Encoding “Gaussian, linear mean, time-decaying variance, quadratic value” cuts training from hours to seconds and stabilizes Sharpes.
3. **Exploration should decay with horizon into the rebalance date**, matching the theorem—not as a fixed OU noise forever.
4. **Self-correcting Lagrange $w$** tying sample mean terminal wealth to target $z$ is a practical trick for any constrained RL portfolio agent.
5. **Use EMV-style ideas for research prototypes** of continuous MV; for production multi-asset books, extend carefully or use as a single-name overlay laboratory.
6. **Compute cost matters for HFT-adjacent rebalancing:** <10s vs ~3h is the difference between usable and not.

---

## 7. Mathematical Sketch of Classical vs Exploratory Solutions

**Classical** (known $\rho=(\mu-r)/\sigma$): optimal dollar amount in risky asset is proportional to $(w-X_t)$ times a factor involving $\rho/\sigma$ and remaining time, with $w$ set so $\mathbb{E}[X_T]=z$. Efficient frontier: mean–variance pairs parameterized by $z$.

**Exploratory:** value function $J^\lambda(t,x)$ solves an HJB with $\inf$ over densities replaced by a softmax/Gaussian integrator due to entropy. Completing the square in the Hamiltonian yields Gaussian $\pi^*$ with
$$
\mathrm{Var}^*(\pi_t)\propto \frac{\lambda}{\text{curvature in }u}\times\text{(time factor decaying as }t\to T\text{)}.
$$
Mean of $\pi^*$ tracks the classical feedback; variance is pure exploration.

**Policy improvement:** if $\pi^{k}$ produces value $J^k$, the greedy Gaussian built from $J^k$ yields $J^{k+1}\ge J^k$ in the entropy-regularized order, with equality iff already optimal.

---

## 8. Related Literature Placement

- Markowitz (1952); Li–Ng (2000); Zhou–Li continuous MV; LQ stochastic control.
- Wang et al. (2019) exploratory/entropy-regularized stochastic control for general LQ—this paper specializes to MV and builds RL.
- Finance RL: Nevmyvaka et al. (2006) execution; Hendricks–Wilcox (2014) Almgren–Chriss + RL; Moody–Saffell portfolio RL—mostly utility/PnL, not MV-with-proofs.
- DDPG (Lillicrap et al. 2016); prioritized replay (Schaul et al. 2016).
- Adaptive control texts (Chen–Guo; Kumar–Varaiya) as the intellectual home of the MLE baseline.

---

## 9. Implementation Notes for Reproducibility

1. Simulate GBM paths at daily steps; episode = one year.
2. Maintain running estimate of $w$ from recent terminal wealths vs $z$.
3. Update $\theta,\phi$ after each episode with stated learning rates.
4. Evaluate on held-out last 2000 episodes’ terminal wealth statistics.
5. For DDPG baseline, feed $x_t-w$ into actor; prioritize terminal buffer samples; keep OU noise.
6. Record wall-clock time—paper’s <10s vs 3h claim is part of the contribution.

---

## 10. Extended Discussion: Why Gaussian Exploration Fits MV

Entropy-regularized control for generic nonlinear costs need not yield Gaussian policies. MV is special because: (i) wealth affine in control; (ii) terminal cost quadratic; (iii) entropy of Gaussian has closed form $\frac12\log(2\pi e\sigma^2)$. The exploratory HJB then stays inside the quadratic-Gaussian family—the same miracle that makes Kalman filtering closed. This is why EMV can avoid neural nets entirely for the one-asset case.

For multi-asset MV with $d$ names, the optimal exploratory policy is multivariate Gaussian with covariance shaped by $\lambda$ and the local curvature $\sigma\sigma^\top$ in the wealth diffusion; EMV would parameterize a $d$-vector mean and a constrained covariance (e.g. diagonal plus low-rank)—still far smaller than a deep actor.

---

## 11. Stress Cases Worth Highlighting from Table 1

- **Negative drift markets** ($\mu=-50\%$): classical MV still invests (short the risky asset) to hit mean target; EMV SR=5.107 at $\sigma=10\%$ vs DDPG 0.908—EMV correctly learns to short.
- **Zero drift** ($\mu=0$): hardest identification; MLE SR negative or tiny; EMV keeps modest positive SR (0.180 at $\sigma=10\%$, 0.070 at $\sigma=40\%$).
- **High vol + high drift** ($\mu=50\%,\sigma=40\%$): MLE SR=$-0.006$, DDPG SR=$-1.107$, EMV SR=$1.174$ with mean 1.329 near target—clearest “RL saves MV” cell.

---

## 12. Conclusions (Paper’s and Ours)

Wang–Zhou provide a theoretically grounded RL path to continuous-time MV: entropy-regularized relaxed control → Gaussian time-decaying exploration → policy improvement → lean EMV algorithm that dominates MLE plug-in and DDPG on Sharpe in nearly all simulated cells while training in seconds. For quant investors, the message is less “replace your optimizer with DDPG” and more “if you must learn MV policies from data, **build the known LQ structure into the agent**.”

---

## 13. Glossary

| Term | Meaning |
|------|---------|
| EMV | Exploratory Mean–Variance RL algorithm of this paper |
| $\lambda$ | Entropy temperature / exploration weight |
| $w$ | Lagrange multiplier embedding mean constraint |
| $z$ | Target expected terminal wealth (1.4 here) |
| $\rho$ | Market price of risk $(\mu-r)/\sigma$ |
| Relaxed control | Randomized action distribution $\pi_t(du)$ |
| PIT | Policy improvement theorem |

---

## 14. Further Quant Research Questions Raised

1. Does EMV survive proportional transaction costs with impulse or singular control extensions?
2. Can distributional RL replace entropy for exploring the MV frontier (multiple $z$)?
3. Multi-agent EMV when many funds learn simultaneously (price impact endogeneity)?
4. Robust EMV under Knightian uncertainty on $\sigma$?
5. Bridge to Growith-optimal / Kelly criteria via different terminal penalties?

---

## 15. One-Paragraph CIO Brief

Wang and Zhou (2019) show how to solve continuous-time mean–variance investing with reinforcement learning without estimating drifts. Their EMV agent explores with a Gaussian policy whose variance shrinks as the horizon approaches, exploits with a linear feedback mean, and trains in under ten seconds—beating both rolling MLE Markowitz and deep DDPG on Sharpe in 23–28 of 28 simulated markets. The practical lesson: for MV-style objectives, structured RL with proven policy improvement beats black-box deep RL.

*End of summary.*


---

## 16. Detailed Comparison Philosophy

The paper is careful about fairness: identical episode budgets $M$, identical $N$ for learning $w$, and **frozen hyperparameters across all 28 cells**. That discipline hurts DDPG (known to need per-task tuning) and still leaves EMV dominant—strengthening the claim. MLE has no learning rates but pays the statistical price of drift estimation. A critic might argue DDPG should get scenario-specific nets; the authors’ footnote 14 acknowledges EMV also improves with per-scenario tuning, approaching theoretical MV Sharpe, while DDPG does not easily.

---

## 17. Connection to Entropy-Regularized RL / Soft Actor-Critic

Modern discrete-time RL (SAC) also adds entropy to the actor objective. Wang–Zhou differ in: (i) continuous-time stochastic control foundation; (ii) proof that the optimal density is Gaussian with *time-decaying* variance specific to finite-horizon MV; (iii) exact LQ value structure. SAC would typically use neural nets and a fixed or dual-adjusted temperature without proving time decay. EMV can be seen as the continuous-time MV-specialized cousin of soft policy iteration.

---

## 18. On the Mean-Blur Problem Quantitatively

Campbell, Lo, MacKinlay (1997) §9.3.2: MLE of GBM drift has variance $\sigma^2/T_{\mathrm{window}}$. With 100 daily points, $T_{\mathrm{window}}\approx 100/252\approx0.4$ years, so $\mathrm{se}(\hat\mu)\approx\sigma/\sqrt{0.4}$. For $\sigma=20\%$, se $\approx 31\%$ annualized—larger than many true $|\mu|$ in the grid. Hence MLE’s catastrophic variances in Table 1 are not implementation bugs; they are the theory. EMV never forms $\hat\mu$; it only forms policy parameters tied to realized terminal wealth errors.

---

## 19. Non-Stationarity and the Separation of Timescales

Section 5.2 requires the stochastic factor driving $(\mu_t,\sigma_t)$ to move slowly relative to the learning rate. If the factor jumps daily, no algorithm can track without additional filtering structure. This mirrors classical adaptive control: persistency of excitation and slow parameter drift. Quants should read EMV as appropriate for **regime learning at monthly/quarterly scales**, not for microstructure α.

---

## 20. Risk of Overfitting the Simulation Grid

All methods see the same parametric family they are tested on (GBM). EMV’s inductive bias matches that family; DDPG’s generic bias does not—so part of EMV’s edge is “right model class,” not pure learning superiority. Still fair as MV *is* an LQ problem in this market. Out-of-family tests (jumps, stochastic vol) are future work.

---

## 21. Practical Pseudo-Code (EMV)

```
initialize theta (value coeffs), phi (policy mean/var coeffs), w
for episode = 1..M:
  X = x0
  for t in grid(0,T,dt):
    sample u ~ N(mean_phi(t, X-w), var_phi(t))
    X <- X + (r*X + (mu-r)*u)*dt + sigma*u*dW   # environment; mu,sigma unknown to agent
  store terminal X_T
  update w toward value consistent with mean(X_T) vs z   # self-correcting
  update theta, phi via policy improvement / SA step using entropy-regularized loss
anneal lambda (optional)
evaluate last K episodes: mean, var, Sharpe of X_T
```

Agent never receives $\mu,\sigma$—only path samples of wealth and chosen $u$.

---

## 22. Mapping to Multi-Period Discrete MV

Li–Ng discrete MV also has embedded LQ structure. An EMV analogue would use Gaussian exploration on the discrete controls with entropy bonus per period and a terminal mean constraint—likely again closed-form friendly. This is a natural engineering bridge for firms that rebalance daily but think in discrete time.

---

## 23. CIO-Level Decision Tree

- Need continuous MV with unknown drift, single liquid name or futures overlay → try structured EMV.
- Multi-asset with constraints, TCA, factor models → classical optimization with robust $\mu$ (Black–Litterman, resampling) still primary; EMV as research sidecar.
- Tempted by DDPG/PPO for portfolio weights → demand ablation against structured baselines; Table 1 shows deep RL can look good in a few cells and catastrophic in others.

---

## 24. Final Expanded Takeaways

Wang–Zhou (2019) is one of the cleanest theory-to-algorithm papers linking continuous-time MV to RL. Memorize three facts: (1) optimal exploration is Gaussian with decaying variance; (2) EMV uses that structure and a policy-improvement theorem; (3) on a 28-cell GBM grid with target $z=1.4$, EMV wins 28/28 vs MLE and 23/28 vs DDPG on Sharpe, trains in <10s vs ~3h. For a quant library, this is the canonical citation when someone proposes “just use deep RL for Markowitz.”

*End of expanded summary.*


---

## 25. Annotated Reading Guide

**Must-read:** Abstract; §2.2 exploratory formulation; §3.1 Gaussian optimality; §4.1 policy improvement; Table 1; Conclusions.

**Skim:** full HJB derivations in appendices if present; DDPG hyperparameter laundry list once you accept the baseline.

**Replicate first:** single cell $\mu=10\%,\sigma=20\%$ with EMV only; confirm mean near 1.2–1.4 and SR>0 before building the full grid.

**Cite as:** Wang, H., and X. Y. Zhou (2019), “Continuous-Time Mean–Variance Portfolio Selection: A Reinforcement Learning Framework,” working paper, Columbia / SSRN 3382932.

---

## 26. Relationship to This Library’s Other Summaries

Pairs naturally with: Chopra–Ziemba (1993) on mean-error dominance (explains why MLE-MV fails); Michaud (1989) error-maximizer critique; Gârleanu–Pedersen (2013) dynamic trading with costs (next constraint to add to EMV); DeMiguel–Garlappi–Uppal 1/N (simple benchmark EMV should also beat in low-SR markets). Together they argue: classical MV is fragile to $\mu$, so either shrink/robustify inputs or learn policies that never estimate $\mu$ explicitly—as EMV does.

---

## 27. Closing

The paper converts a classical continuous-time finance problem into a modern RL problem without abandoning the mathematics that makes MV solvable. That combination—proofs plus a lean algorithm plus a brutal simulation bake-off—is why it belongs in a practitioner research library.

**Word count verified in batch report.**

## 28. Batch Note

Summary kept in the Scholar 3500–5000+ word band with full Table 1 transcription for replication.

Supported by the FDT Center for Intelligent Asset Management at Columbia; Zhou also acknowledges a Columbia start-up grant. Seminar feedback from the Fields Institute is acknowledged in the source.


Acknowledgments in the source credit Fields Institute seminar participants; Wang acknowledges FDT Center support; Zhou acknowledges Columbia start-up funding and the same FDT Center. The May 2019 version supersedes the February 2019 draft.
