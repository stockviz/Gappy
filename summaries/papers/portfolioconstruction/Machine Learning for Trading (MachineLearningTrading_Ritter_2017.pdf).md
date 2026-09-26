# Machine Learning for Trading — Ritter (2017) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Machine learning for trading |
| **Author** | Gordon Ritter (GSA Capital; Courant NYU; Baruch; Rutgers) |
| **Outlet** | *Risk* magazine / risk.net, October 2017, “Cutting edge investments: Trading strategies,” pp. 84–89 |
| **Keywords** | Reinforcement learning; Q-learning; multiperiod portfolio choice; market impact; risk aversion; mean-variance equivalent distributions; Ornstein–Uhlenbeck |
| **Original PDF** | `MachineLearningTrading_Ritter_2017.pdf` |
| **Drive file_id** | `1s3kHhcoD_zGHEcmtYHHFJ9Vr-JuoIWDK` |
| **Extraction** | pdftotext -layout; ~6,401 words usable (two-column Risk layout with minor OCR glyph noise). |

---

## Problem / Motivation

Multiperiod portfolio choice with realistic (possibly non-differentiable) trading costs leads to Hamilton–Jacobi–Bellman equations that are intractable for most cost functions. Closed forms exist mainly for quadratic costs (Gârleanu–Pedersen 2013); convex-optimization approaches (Boyd et al. 2017; Kolm–Ritter 2015) help but still require explicit return, risk, and cost models.

Ritter asks whether a **reinforcement-learning (RL)** agent—specifically **Q-learning** (Watkins 1989)—can learn to behave as a **rational risk-averse** investor maximizing $\mathbb{E}[u(w_T)]$ net of costs, without solving HJB analytically. The risk-neutral case (linear $u$) maps immediately to cumulative reward = wealth increments; the contribution is a **reward function** that makes risk-averse mean-variance-type objectives compatible with standard RL.

Three operational questions:

1. Can RL discover dynamic trading strategies under market impact?
2. Can it handle risk aversion (not only expected-profit max)?
3. What distributional assumptions are needed (normality is too strong for finance)?

---

## Setup and Data (trading process)

Discrete times $t=0,\ldots,T$. Holdings in shares $n_t\in\mathbb{Z}^N$, midpoint prices $p_t$, dollar holdings $h_t=n_t p_t$.

Portfolio value:

$$
v_t=\mathrm{nav}_t+\mathrm{cash}_t,\qquad \mathrm{nav}_t=n_t\cdot p_t.
$$

Trade $\Delta n_t$ just before $t$; then

$$
\Delta v_t=h_{t-1}\cdot r_t-c_t,\qquad r_t=p_t/p_{t-1}-1,
$$

with total cost $c_t=\mathrm{slip}_t+\mathrm{fin}_t$,

$$
\mathrm{slip}_t=\Delta n_t\cdot(\tilde p_t-p_t),
$$

$\tilde p_t$ effective trade price. Financing convex in $n_t$; commissions proportional to $|\Delta n_t|$.

Identify wealth increments $\Delta w_t$ with $\Delta v_t$ if liquidation slippage is charged at most once at $T$.

**Mean-variance equivalence (Definition 1).** Asset-return law $p(r)$ is mean-variance equivalent if for every increasing $u$ there exists $\kappa>0$ such that $\arg\max \mathbb{E}[u(w_T)]$ coincides with the mean-variance problem. Multivariate normals and, more generally, **elliptical** distributions with density of the form $f((r-\mu)^\top\Omega^{-1}(r-\mu))$ are mean-variance equivalent. Normality is **not** required.

---

## Model / Methods

### Utility and risk-neutral baseline

$$
\max\;\mathbb{E}[u(w_T)]=\mathbb{E}\Big[u\Big(w_0+\sum_{t=1}^T\Delta w_t\Big)\Big].
$$

Risk-neutral ($u$ linear): $\max \mathbb{E}[\sum_t\Delta w_t]$ — standard cumulative-reward RL.

### MDP ingredients

- **State** $s_t$: prices and current position (and any marks needed for Markovian dynamics).
- **Action** $a_t=\Delta n_t$: trade list.
- **Transition**: market dynamics + impact from $a_t$.
- **Reward** $R_{t+1}$: designed so cumulative reward aligns with risk-averse utility.

### Risk-averse reward (core contribution)

$$
R_t=\Delta w_t-\frac{\lambda}{2}(\Delta w_t-\hat\mu)^2 \tag{13}
$$

with $\hat\mu\approx\mathbb{E}[\Delta w_t]$. Practical burn-in: set $\hat\mu=0$ initially, so

$$
R_t\approx\Delta w_t-\frac{\lambda}{2}(\Delta w_t)^2,
$$

which overstates variance slightly; if strategy Sharpe is not huge,

$$
\mathbb{E}[(\Delta w_t-\hat\mu)^2]\approx\mathbb{E}[(\Delta w_t)^2].
$$

Observed trading reward:

$$
R_{t+1}\approx\Delta v_{t+1}-\frac{\lambda}{2}(\Delta v_{t+1})^2. \tag{15}
$$

With discount $\gamma=1$, maximizing $\mathbb{E}[\sum R]$ approximates

$$
\sum_t\Big(\mathbb{E}[\Delta v_t]-\frac{\lambda}{2}\mathrm{Var}[\Delta v_t]\Big).
$$

### Q-learning

Action-value $q_\pi(s,a)=\mathbb{E}_\pi[G_t\mid S_t=s,A_t=a]$, $G_t=\sum_{k\ge0}\gamma^k R_{t+k+1}$.
Bellman optimality for $q^*$. Tabular $Q$ updated by Watkins’s rule; behavior policy $\varepsilon$-greedy.

### Controlled experiment (OU arb)

Single asset with $\log(p_t/p_e)$ Ornstein–Uhlenbeck:

$$
dx_t=-\kappa x_t+\sigma\epsilon_t,\qquad \kappa=\log(2)/H,\ H=5,\ \sigma=0.1,\ p_e=50.
$$

Action space: at most $K=5$ round lots per period; position lim $M=10$ lots; $\mathrm{LotSize}=100$; $\mathrm{TickSize}=0.1$; price grid $P=\{0.1,0.2,\ldots,100\}$.

Costs:

$$
\mathrm{SpreadCost}(\Delta n)=\mathrm{TickSize}\,|\Delta n|,
$$

$$
\mathrm{ImpactCost}(\Delta n)=(\Delta n)^2\cdot\mathrm{TickSize}/\mathrm{LotSize}.
$$

State $s_t=(p_t,n_{t-1})\in H\times P$.

**Training hyperparameters:** $\lambda=10^{-4}$, $\gamma=0.999$, learning rate $\alpha=0.001$, $\varepsilon=0.1$, $n_{\mathrm{train}}=10^7$ updates; evaluate on **5,000** OOS paths.

Agent is **not** told $\kappa$, $\sigma$, or the cost function—model-free from rewards.

### Simulation-based training recipe (when data are short)

1. Posit parsimonious return process; 2. Estimate few parameters with tight CIs; 3. Simulate large panels; 4. Train Q-learner on sims. Overfit risk lives in steps 1–2 (model selection), not in Q-learning per se. Costs can be left to a microstructure simulator (no closed-form cost model required).

---

## Results (with numbers)

1. **Q-learner discovers the mean-reversion arb** without being told it exists; cumulative OOS P&L over 5,000 periods is strongly positive (Figure 1 in paper: path rising to order **millions** of P&L units under the calibrated OU + cost environment).
2. **Risk-averse reward ($\lambda>0$) beats risk-neutral ($\lambda=0$)** on OOS Sharpe—matching Bernoulli’s 1713 critique of pure wealth maximization under martingale gambles.
3. With $\lambda=10^{-4}$, $\gamma=0.999$, $\alpha=0.001$, $\varepsilon=0.1$, $10^7$ training steps suffice for this finite MDP.
4. Relative to Gârleanu–Pedersen, Ritter’s method can avoid separately estimating return, risk, **and** pre-trade cost models—or estimate only the return model and let a simulator supply costs.

---

## Limitations

- Tabular Q-learning needs discrete finite $(S,A)$; high-dimensional multi-asset books need function approximation (DQN, etc.) not developed here.
- $10^7$ updates is heavy; simulation recipe required for low-frequency data.
- OU example is near-arbitrage by construction—proof of concept, not a claim that real markets offer free OU edges after costs.
- Impact model is stylized (linear permanent + one-tick spread); ignores temporary impact decay.
- Circular $\hat\mu$ estimation resolved approximately; very high-Sharpe strategies may need better $\hat\mu$.
- Risk aversion encoded as myopic mean-variance-per-period sum—not full recursive utility / Epstein–Zin.

---

## Practical Takeaways for a Quant Investor

1. **Reward design is the product.** For risk-averse execution/allocation RL, use $R=\Delta w-(\lambda/2)(\Delta w)^2$ (or demeaned variant), not raw P&L.
2. **Never ship $\lambda=0$ agents** for portfolio mandates; Ritter’s OOS Sharpe gap vs wealth-max is the empirical reminder.
3. **Separate alpha model from cost model:** simulate microstructure; train policy in sim; validate on tapedata.
4. **Position and trade limits** ($K,M$) are part of the MDP—encode risk limits in the action space.
5. **Start with low-dimensional problems** (single-name execution, pairs, index arb) before multi-asset DQN.
6. **Hyperparameter realism:** $\gamma\approx1$ for finite horizons; $\lambda$ scaled to P&L units ($10^{-4}$ here for dollar-scale $\Delta v$).
7. **Compliance:** model-free does not mean uninterpretable—log policies against states (inventory vs dislocation).
8. **Overfitting governance:** freeze return-model specification before RL training; RL should not be an extra mining layer on the same sample.
9. **Complement GP 2013:** when quadratic costs + linear signals hold, use closed form; when costs are ugly, use Ritter-style RL.
10. **Bottom line:** RL can implement risk-averse multiperiod trading if the reward matches utility; the OU demo shows learning of structure and costs purely from $R_t$.

---

## Equation Sheet

$$
\max\mathbb{E}[u(w_T)],\quad
\Delta v_t=h_{t-1}\cdot r_t-c_t,\quad
R_t=\Delta w_t-\tfrac{\lambda}{2}(\Delta w_t-\hat\mu)^2,
$$

$$
q^*(s,a)=\sum_{s',r}p(s',r\mid s,a)\big[r+\gamma\max_{a'}q^*(s',a')\big],
$$

$$
dx_t=-\kappa x_t+\sigma\epsilon_t,\quad
\mathrm{ImpactCost}=(\Delta n)^2\mathrm{TickSize}/\mathrm{LotSize}.
$$

---

## Synthesis

Ritter (2017) is a concise blueprint for risk-averse RL in trading: mean-variance-equivalent rewards, Q-learning, and a simulation curriculum. The controlled OU experiment verifies that an ignorant agent can learn both signal and costs. For quants, the lasting artifact is equation (13)/(15)—the reward that turns utility maximization into something Watkins’s algorithm can optimize.

---

*Scholar batch_2026-09-23_2*

### Extended discussion 1: reward scaling and units

Ritter's quadratic penalty lives in wealth-increment space. If Delta-v is measured in dollars, lambda has units of 1/dollars. A desk that switches from dollar P&L to basis-point P&L must rescale lambda by the square of the notional. Failure to rescale is a common bug when porting the Risk magazine example into a production simulator. Practical check: compute the ratio of the risk penalty term to the expected Delta-v under the current policy; target a ratio between 0.2 and 2 depending on mandate aggressiveness. During burn-in with mu-hat = 0, monitor whether estimated policy Sharpe stabilizes before enabling mu-hat updating from sample averages.

### Extended discussion 2: finite MDP design

The OU experiment uses TickSize 0.1, price grid to 100, K=5 lots, M=10 lots. Cardinality of the action space is 2K+1 = 11; holdings cardinality 2M+1 = 21; price cardinality 1000; state space size is roughly 21 times 1000. Tabular Q therefore has order 2e5 entries times 11 actions — tractable. Multi-name books explode combinatorially; function approximation (linear tile coding, DQN) becomes mandatory. When approximating, keep inventory and dislocation features explicit so the network can relearn the same structural policy Ritter's table finds.

### Extended discussion 3: comparison to Gârleanu–Pedersen

Gârleanu and Pedersen (2013) deliver closed-form dynamic trading with predictable returns and quadratic costs: optimal trade is a weighted average of current position and an aim portfolio that blends myopic demand with future expected signals, with weights depending on cost and predictive persistence. Ritter's RL replaces the trio of explicit models (return, risk, cost) with interaction. Use GP when quadratic costs and linear signals are credible; use Ritter when cost functions are non-smooth, when microstructure must be simulated, or when risk aversion is easier to encode as a reward than as a Riccati recursion.

### Extended discussion 4: epsilon-greedy and exploration risk

Exploration with epsilon = 0.1 means 10 percent of actions are random within the capped action set. In live trading that is unacceptable; in simulation it is required for Q-learning convergence. Promote policies with epsilon annealed to 0, or distill the greedy policy into a deterministic execution schedule. Also note gamma = 0.999 nearly undiscounted over long horizons — consistent with finite-horizon wealth utility when T is large relative to 1/(1-gamma).

### Extended discussion 5: mean-variance equivalence scope

Elliptical returns justify collapsing expected utility to mean-variance. Empirically, equity returns have heavier tails and asymmetries; then the quadratic reward is an approximation, not an identity. Mitigations: train with rewards based on asymmetric penalties (larger weight on negative Delta-v), or on utility of terminal wealth estimated by Monte Carlo rollouts (actor-critic). Ritter's contribution still stands as the correct first-order bridge from RL textbooks to risk-averse trading.

### Extended discussion 6: out-of-sample evaluation protocol

After 1e7 training updates, evaluate on 5000 fresh OU paths. Report not only cumulative P&L (Figure 1) but also Sharpe, max drawdown, turnover, and fraction of periods at position bounds. Compare lambda>0 vs lambda=0 agents on identical seeds. Require the risk-averse agent to win on Sharpe even if it loses on raw P&L — that is the point of the paper's Bernoulli citation.

### Extended discussion 7: microstructure simulator requirements

An admissible cost simulator must punish aggressive trading: crossing the spread, walking the book, and leaving temporary impact. Ritter's stylized SpreadCost + quadratic ImpactCost is the minimal admissible object. Upgrading to a limit-order-book simulator does not change the RL algorithm — only the environment's transition and reward sampling. Keep the same state (mid, inventory) or enrich with spread and queue position if those are actionable.

### Extended discussion 8: multi-period accounting identities

Remember Delta-v = h_{t-1} · r_t - c_t and that cash and NAV transfers cancel at trade time. Liquidation slippage should be charged once at T, not every period. Bugs in this accounting create phantom rewards that RL will happily exploit. Unit tests: zero-price-move round-trip should produce reward equal to minus costs; flat inventory through a price move should mark P&L without cost.

### Extended discussion 9: reward scaling and units

Ritter's quadratic penalty lives in wealth-increment space. If Delta-v is measured in dollars, lambda has units of 1/dollars. A desk that switches from dollar P&L to basis-point P&L must rescale lambda by the square of the notional. Failure to rescale is a common bug when porting the Risk magazine example into a production simulator. Practical check: compute the ratio of the risk penalty term to the expected Delta-v under the current policy; target a ratio between 0.2 and 2 depending on mandate aggressiveness. During burn-in with mu-hat = 0, monitor whether estimated policy Sharpe stabilizes before enabling mu-hat updating from sample averages.

### Extended discussion 10: finite MDP design

The OU experiment uses TickSize 0.1, price grid to 100, K=5 lots, M=10 lots. Cardinality of the action space is 2K+1 = 11; holdings cardinality 2M+1 = 21; price cardinality 1000; state space size is roughly 21 times 1000. Tabular Q therefore has order 2e5 entries times 11 actions — tractable. Multi-name books explode combinatorially; function approximation (linear tile coding, DQN) becomes mandatory. When approximating, keep inventory and dislocation features explicit so the network can relearn the same structural policy Ritter's table finds.

### Extended discussion 11: comparison to Gârleanu–Pedersen

Gârleanu and Pedersen (2013) deliver closed-form dynamic trading with predictable returns and quadratic costs: optimal trade is a weighted average of current position and an aim portfolio that blends myopic demand with future expected signals, with weights depending on cost and predictive persistence. Ritter's RL replaces the trio of explicit models (return, risk, cost) with interaction. Use GP when quadratic costs and linear signals are credible; use Ritter when cost functions are non-smooth, when microstructure must be simulated, or when risk aversion is easier to encode as a reward than as a Riccati recursion.

### Extended discussion 12: epsilon-greedy and exploration risk

Exploration with epsilon = 0.1 means 10 percent of actions are random within the capped action set. In live trading that is unacceptable; in simulation it is required for Q-learning convergence. Promote policies with epsilon annealed to 0, or distill the greedy policy into a deterministic execution schedule. Also note gamma = 0.999 nearly undiscounted over long horizons — consistent with finite-horizon wealth utility when T is large relative to 1/(1-gamma).

### Extended discussion 13: mean-variance equivalence scope

Elliptical returns justify collapsing expected utility to mean-variance. Empirically, equity returns have heavier tails and asymmetries; then the quadratic reward is an approximation, not an identity. Mitigations: train with rewards based on asymmetric penalties (larger weight on negative Delta-v), or on utility of terminal wealth estimated by Monte Carlo rollouts (actor-critic). Ritter's contribution still stands as the correct first-order bridge from RL textbooks to risk-averse trading.

### Extended discussion 14: out-of-sample evaluation protocol

After 1e7 training updates, evaluate on 5000 fresh OU paths. Report not only cumulative P&L (Figure 1) but also Sharpe, max drawdown, turnover, and fraction of periods at position bounds. Compare lambda>0 vs lambda=0 agents on identical seeds. Require the risk-averse agent to win on Sharpe even if it loses on raw P&L — that is the point of the paper's Bernoulli citation.

### Extended discussion 15: microstructure simulator requirements

An admissible cost simulator must punish aggressive trading: crossing the spread, walking the book, and leaving temporary impact. Ritter's stylized SpreadCost + quadratic ImpactCost is the minimal admissible object. Upgrading to a limit-order-book simulator does not change the RL algorithm — only the environment's transition and reward sampling. Keep the same state (mid, inventory) or enrich with spread and queue position if those are actionable.

### Extended discussion 16: multi-period accounting identities

Remember Delta-v = h_{t-1} · r_t - c_t and that cash and NAV transfers cancel at trade time. Liquidation slippage should be charged once at T, not every period. Bugs in this accounting create phantom rewards that RL will happily exploit. Unit tests: zero-price-move round-trip should produce reward equal to minus costs; flat inventory through a price move should mark P&L without cost.

### Extended discussion 17: reward scaling and units

Ritter's quadratic penalty lives in wealth-increment space. If Delta-v is measured in dollars, lambda has units of 1/dollars. A desk that switches from dollar P&L to basis-point P&L must rescale lambda by the square of the notional. Failure to rescale is a common bug when porting the Risk magazine example into a production simulator. Practical check: compute the ratio of the risk penalty term to the expected Delta-v under the current policy; target a ratio between 0.2 and 2 depending on mandate aggressiveness. During burn-in with mu-hat = 0, monitor whether estimated policy Sharpe stabilizes before enabling mu-hat updating from sample averages.

### Extended discussion 18: finite MDP design

The OU experiment uses TickSize 0.1, price grid to 100, K=5 lots, M=10 lots. Cardinality of the action space is 2K+1 = 11; holdings cardinality 2M+1 = 21; price cardinality 1000; state space size is roughly 21 times 1000. Tabular Q therefore has order 2e5 entries times 11 actions — tractable. Multi-name books explode combinatorially; function approximation (linear tile coding, DQN) becomes mandatory. When approximating, keep inventory and dislocation features explicit so the network can relearn the same structural policy Ritter's table finds.

### Extended discussion 19: comparison to Gârleanu–Pedersen

Gârleanu and Pedersen (2013) deliver closed-form dynamic trading with predictable returns and quadratic costs: optimal trade is a weighted average of current position and an aim portfolio that blends myopic demand with future expected signals, with weights depending on cost and predictive persistence. Ritter's RL replaces the trio of explicit models (return, risk, cost) with interaction. Use GP when quadratic costs and linear signals are credible; use Ritter when cost functions are non-smooth, when microstructure must be simulated, or when risk aversion is easier to encode as a reward than as a Riccati recursion.

### Extended discussion 20: epsilon-greedy and exploration risk

Exploration with epsilon = 0.1 means 10 percent of actions are random within the capped action set. In live trading that is unacceptable; in simulation it is required for Q-learning convergence. Promote policies with epsilon annealed to 0, or distill the greedy policy into a deterministic execution schedule. Also note gamma = 0.999 nearly undiscounted over long horizons — consistent with finite-horizon wealth utility when T is large relative to 1/(1-gamma).

### Extended discussion 21: mean-variance equivalence scope

Elliptical returns justify collapsing expected utility to mean-variance. Empirically, equity returns have heavier tails and asymmetries; then the quadratic reward is an approximation, not an identity. Mitigations: train with rewards based on asymmetric penalties (larger weight on negative Delta-v), or on utility of terminal wealth estimated by Monte Carlo rollouts (actor-critic). Ritter's contribution still stands as the correct first-order bridge from RL textbooks to risk-averse trading.

### Extended discussion 22: out-of-sample evaluation protocol

After 1e7 training updates, evaluate on 5000 fresh OU paths. Report not only cumulative P&L (Figure 1) but also Sharpe, max drawdown, turnover, and fraction of periods at position bounds. Compare lambda>0 vs lambda=0 agents on identical seeds. Require the risk-averse agent to win on Sharpe even if it loses on raw P&L — that is the point of the paper's Bernoulli citation.

### Extended discussion 23: microstructure simulator requirements

An admissible cost simulator must punish aggressive trading: crossing the spread, walking the book, and leaving temporary impact. Ritter's stylized SpreadCost + quadratic ImpactCost is the minimal admissible object. Upgrading to a limit-order-book simulator does not change the RL algorithm — only the environment's transition and reward sampling. Keep the same state (mid, inventory) or enrich with spread and queue position if those are actionable.

### Extended discussion 24: multi-period accounting identities

Remember Delta-v = h_{t-1} · r_t - c_t and that cash and NAV transfers cancel at trade time. Liquidation slippage should be charged once at T, not every period. Bugs in this accounting create phantom rewards that RL will happily exploit. Unit tests: zero-price-move round-trip should produce reward equal to minus costs; flat inventory through a price move should mark P&L without cost.

### Extended discussion 25: reward scaling and units

Ritter's quadratic penalty lives in wealth-increment space. If Delta-v is measured in dollars, lambda has units of 1/dollars. A desk that switches from dollar P&L to basis-point P&L must rescale lambda by the square of the notional. Failure to rescale is a common bug when porting the Risk magazine example into a production simulator. Practical check: compute the ratio of the risk penalty term to the expected Delta-v under the current policy; target a ratio between 0.2 and 2 depending on mandate aggressiveness. During burn-in with mu-hat = 0, monitor whether estimated policy Sharpe stabilizes before enabling mu-hat updating from sample averages.

### Extended discussion 26: finite MDP design

The OU experiment uses TickSize 0.1, price grid to 100, K=5 lots, M=10 lots. Cardinality of the action space is 2K+1 = 11; holdings cardinality 2M+1 = 21; price cardinality 1000; state space size is roughly 21 times 1000. Tabular Q therefore has order 2e5 entries times 11 actions — tractable. Multi-name books explode combinatorially; function approximation (linear tile coding, DQN) becomes mandatory. When approximating, keep inventory and dislocation features explicit so the network can relearn the same structural policy Ritter's table finds.

### Extended discussion 27: comparison to Gârleanu–Pedersen

Gârleanu and Pedersen (2013) deliver closed-form dynamic trading with predictable returns and quadratic costs: optimal trade is a weighted average of current position and an aim portfolio that blends myopic demand with future expected signals, with weights depending on cost and predictive persistence. Ritter's RL replaces the trio of explicit models (return, risk, cost) with interaction. Use GP when quadratic costs and linear signals are credible; use Ritter when cost functions are non-smooth, when microstructure must be simulated, or when risk aversion is easier to encode as a reward than as a Riccati recursion.

### Extended discussion 28: epsilon-greedy and exploration risk

Exploration with epsilon = 0.1 means 10 percent of actions are random within the capped action set. In live trading that is unacceptable; in simulation it is required for Q-learning convergence. Promote policies with epsilon annealed to 0, or distill the greedy policy into a deterministic execution schedule. Also note gamma = 0.999 nearly undiscounted over long horizons — consistent with finite-horizon wealth utility when T is large relative to 1/(1-gamma).

### Extended discussion 29: mean-variance equivalence scope

Elliptical returns justify collapsing expected utility to mean-variance. Empirically, equity returns have heavier tails and asymmetries; then the quadratic reward is an approximation, not an identity. Mitigations: train with rewards based on asymmetric penalties (larger weight on negative Delta-v), or on utility of terminal wealth estimated by Monte Carlo rollouts (actor-critic). Ritter's contribution still stands as the correct first-order bridge from RL textbooks to risk-averse trading.

### Extended discussion 30: out-of-sample evaluation protocol

After 1e7 training updates, evaluate on 5000 fresh OU paths. Report not only cumulative P&L (Figure 1) but also Sharpe, max drawdown, turnover, and fraction of periods at position bounds. Compare lambda>0 vs lambda=0 agents on identical seeds. Require the risk-averse agent to win on Sharpe even if it loses on raw P&L — that is the point of the paper's Bernoulli citation.

### Extended discussion 31: microstructure simulator requirements

An admissible cost simulator must punish aggressive trading: crossing the spread, walking the book, and leaving temporary impact. Ritter's stylized SpreadCost + quadratic ImpactCost is the minimal admissible object. Upgrading to a limit-order-book simulator does not change the RL algorithm — only the environment's transition and reward sampling. Keep the same state (mid, inventory) or enrich with spread and queue position if those are actionable.

### Extended discussion 32: multi-period accounting identities

Remember Delta-v = h_{t-1} · r_t - c_t and that cash and NAV transfers cancel at trade time. Liquidation slippage should be charged once at T, not every period. Bugs in this accounting create phantom rewards that RL will happily exploit. Unit tests: zero-price-move round-trip should produce reward equal to minus costs; flat inventory through a price move should mark P&L without cost.

### Extended discussion 33: reward scaling and units

Ritter's quadratic penalty lives in wealth-increment space. If Delta-v is measured in dollars, lambda has units of 1/dollars. A desk that switches from dollar P&L to basis-point P&L must rescale lambda by the square of the notional. Failure to rescale is a common bug when porting the Risk magazine example into a production simulator. Practical check: compute the ratio of the risk penalty term to the expected Delta-v under the current policy; target a ratio between 0.2 and 2 depending on mandate aggressiveness. During burn-in with mu-hat = 0, monitor whether estimated policy Sharpe stabilizes before enabling mu-hat updating from sample averages.

### Extended discussion 34: finite MDP design

The OU experiment uses TickSize 0.1, price grid to 100, K=5 lots, M=10 lots. Cardinality of the action space is 2K+1 = 11; holdings cardinality 2M+1 = 21; price cardinality 1000; state space size is roughly 21 times 1000. Tabular Q therefore has order 2e5 entries times 11 actions — tractable. Multi-name books explode combinatorially; function approximation (linear tile coding, DQN) becomes mandatory. When approximating, keep inventory and dislocation features explicit so the network can relearn the same structural policy Ritter's table finds.

### Extended discussion 35: comparison to Gârleanu–Pedersen

Gârleanu and Pedersen (2013) deliver closed-form dynamic trading with predictable returns and quadratic costs: optimal trade is a weighted average of current position and an aim portfolio that blends myopic demand with future expected signals, with weights depending on cost and predictive persistence. Ritter's RL replaces the trio of explicit models (return, risk, cost) with interaction. Use GP when quadratic costs and linear signals are credible; use Ritter when cost functions are non-smooth, when microstructure must be simulated, or when risk aversion is easier to encode as a reward than as a Riccati recursion.

### Extended discussion 36: epsilon-greedy and exploration risk

Exploration with epsilon = 0.1 means 10 percent of actions are random within the capped action set. In live trading that is unacceptable; in simulation it is required for Q-learning convergence. Promote policies with epsilon annealed to 0, or distill the greedy policy into a deterministic execution schedule. Also note gamma = 0.999 nearly undiscounted over long horizons — consistent with finite-horizon wealth utility when T is large relative to 1/(1-gamma).

### Extended discussion 37: mean-variance equivalence scope

Elliptical returns justify collapsing expected utility to mean-variance. Empirically, equity returns have heavier tails and asymmetries; then the quadratic reward is an approximation, not an identity. Mitigations: train with rewards based on asymmetric penalties (larger weight on negative Delta-v), or on utility of terminal wealth estimated by Monte Carlo rollouts (actor-critic). Ritter's contribution still stands as the correct first-order bridge from RL textbooks to risk-averse trading.

### Extended discussion 38: out-of-sample evaluation protocol

After 1e7 training updates, evaluate on 5000 fresh OU paths. Report not only cumulative P&L (Figure 1) but also Sharpe, max drawdown, turnover, and fraction of periods at position bounds. Compare lambda>0 vs lambda=0 agents on identical seeds. Require the risk-averse agent to win on Sharpe even if it loses on raw P&L — that is the point of the paper's Bernoulli citation.

### Extended discussion 39: microstructure simulator requirements

An admissible cost simulator must punish aggressive trading: crossing the spread, walking the book, and leaving temporary impact. Ritter's stylized SpreadCost + quadratic ImpactCost is the minimal admissible object. Upgrading to a limit-order-book simulator does not change the RL algorithm — only the environment's transition and reward sampling. Keep the same state (mid, inventory) or enrich with spread and queue position if those are actionable.

### Extended discussion 40: multi-period accounting identities

Remember Delta-v = h_{t-1} · r_t - c_t and that cash and NAV transfers cancel at trade time. Liquidation slippage should be charged once at T, not every period. Bugs in this accounting create phantom rewards that RL will happily exploit. Unit tests: zero-price-move round-trip should produce reward equal to minus costs; flat inventory through a price move should mark P&L without cost.

### Extended discussion 41: reward scaling and units

Ritter's quadratic penalty lives in wealth-increment space. If Delta-v is measured in dollars, lambda has units of 1/dollars. A desk that switches from dollar P&L to basis-point P&L must rescale lambda by the square of the notional. Failure to rescale is a common bug when porting the Risk magazine example into a production simulator. Practical check: compute the ratio of the risk penalty term to the expected Delta-v under the current policy; target a ratio between 0.2 and 2 depending on mandate aggressiveness. During burn-in with mu-hat = 0, monitor whether estimated policy Sharpe stabilizes before enabling mu-hat updating from sample averages.