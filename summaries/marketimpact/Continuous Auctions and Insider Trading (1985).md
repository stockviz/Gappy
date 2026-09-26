# Continuous Auctions and Insider Trading

**Authors:** Albert S. Kyle  
**Year:** 1985  
**Journal/Venue:** *Econometrica*, Vol. 53, No. 6, pp. 1315--1335

## Problem statement

How does a monopolistic insider optimally exploit private information in a dynamic trading environment with competitive market makers and noise traders? Specifically: at what rate is private information incorporated into prices, what determines the depth and liquidity of the market, and what is the value of the insider's information? The paper seeks to derive these as endogenous consequences of strategic optimization rather than imposing them exogenously.

## Approach (short)

A single risk-neutral insider, knowing the ex post liquidation value of one risky asset, trades against risk-neutral competitive market makers who observe only aggregate order flow (insider + noise traders). Normality of all primitives yields a tractable linear equilibrium. Three nested models are solved: (i) a single-period auction, (ii) a discrete-time sequential auction with $N$ rounds, and (iii) a continuous-time limit as the inter-auction interval $\Delta t \to 0$. The continuous-time equilibrium has constant market depth, Brownian-motion prices, and full information revelation by terminal date.

## Approach (detailed)

### 1. Setup and primitives

- One risky asset with liquidation value $\tilde{v} \sim N(p_0, \Sigma_0)$.
- Noise trader cumulative order: Brownian motion $\tilde{u}(t)$ with instantaneous variance $\sigma_u^2$.
- A single risk-neutral insider observes $\tilde{v}$ (and past prices/own trades); chooses quantity $\tilde{x}$.
- Competitive risk-neutral market makers observe aggregate order flow $\tilde{x} + \tilde{u}$ (not separately), set price equal to $E[\tilde{v} \mid \text{order flow history}]$.

### 2. Single auction equilibrium (Theorem 1)

The insider's trading strategy $X$ and the market makers' pricing rule $P$ are both linear. Equilibrium conditions:

- **Profit maximization:** $E\{\pi(X, P) \mid \tilde{v} = v\} \geq E\{\pi(X', P) \mid \tilde{v} = v\}$ for all alternative strategies $X'$.
- **Market efficiency:** $\tilde{p} = E[\tilde{v} \mid \tilde{x} + \tilde{u}]$.

**Theorem 1 (exact).** There exists a unique linear equilibrium. Define

$$\beta = \left(\frac{\sigma_u^2}{\Sigma_0}\right)^{1/2}, \qquad \lambda = 2\left(\frac{\sigma_u^2}{\Sigma_0}\right)^{-1/2}.$$

The equilibrium is:

$$X(\tilde{v}) = \beta(\tilde{v} - p_0), \qquad P(\tilde{x} + \tilde{u}) = p_0 + \lambda(\tilde{x} + \tilde{u}).$$

*Proof sketch.* Guess linear $P(y) = \mu + \lambda y$ and $X(v) = \alpha + \beta v$. The linear pricing rule makes the insider's objective quadratic in $x$; FOC gives $X(v) = \alpha + \beta v$ with $1/\beta = 2\lambda$ and $\alpha = -\mu\beta$. Market efficiency (projection theorem under normality) pins down $\lambda$ and $\mu$, yielding $\mu = p_0$, $\alpha = -\beta p_0$. Second-order condition $\lambda > 0$ is satisfied.

**Key properties:**

- Post-trade price variance: $\Sigma_1 = \operatorname{var}\{\tilde{v} \mid \tilde{p}\} = \tfrac{1}{2}\Sigma_0$. Exactly half the insider's information is incorporated.
- Market depth $1/\lambda \propto \sigma_u / \Sigma_0^{1/2}$: proportional to noise trading, inversely proportional to prior information asymmetry.
- Expected insider profit: $E(\tilde{\pi}) = \tfrac{1}{2}(\Sigma_0 \sigma_u^2)^{1/2}$.

### 3. Sequential auction equilibrium (Theorem 2)

Trading over $[0, 1]$ is partitioned into $N$ auctions at dates $0 = t_0 < t_1 < \cdots < t_N = 1$. Noise trade at auction $n$: $\Delta\tilde{u}_n \sim N(0, \sigma_u^2 \Delta t_n)$, independent across auctions and of $\tilde{v}$.

**Theorem 2 (exact).** There exists a unique recursive linear equilibrium characterized by constants $\beta_n, \lambda_n, \alpha_n, \delta_n, \Sigma_n$ satisfying:

$$\Delta\tilde{x}_n = \beta_n(\tilde{v} - \tilde{p}_{n-1})\,\Delta t_n, \qquad \Delta\tilde{p}_n = \lambda_n(\Delta\tilde{x}_n + \Delta\tilde{u}_n),$$

with the difference equation system (for $n = 1, \ldots, N$, boundary conditions $\alpha_N = \delta_N = 0$):

$$\alpha_{n-1} = \frac{1}{4\lambda_n(1 - \alpha_n\lambda_n)},$$

$$\delta_{n-1} = \delta_n + \alpha_n\lambda_n^2\sigma_u^2\,\Delta t_n,$$

$$\beta_n\,\Delta t_n = \frac{1 - 2\alpha_n\lambda_n}{2\lambda_n(1 - \alpha_n\lambda_n)},$$

$$\lambda_n = \beta_n\Sigma_n / \sigma_u^2,$$

$$\Sigma_n = (1 - \beta_n\lambda_n\,\Delta t_n)\,\Sigma_{n-1},$$

subject to the second-order condition $\lambda_n(1 - \alpha_n\lambda_n) > 0$.

*Proof structure (three steps):*

1. **Backward induction on the insider's problem.** Starting from $\alpha_N = \delta_N = 0$, show by induction that the insider's expected continuation profit is quadratic: $E\{\tilde{\pi}_n \mid p_1, \ldots, p_{n-1}, v\} = \alpha_{n-1}(v - p_{n-1})^2 + \delta_{n-1}$. The quadratic form rules out mixed strategies and makes linear strategies globally optimal.
2. **Market efficiency (projection theorem).** $\Delta\tilde{p}_n = E\{\tilde{v} - \tilde{p}_{n-1} \mid \Delta\tilde{x}_n + \Delta\tilde{u}_n\}$ under normality pins down $\lambda_n$ and $\Sigma_n$ as functions of $\beta_n$ and $\Sigma_{n-1}$.
3. **Uniqueness.** The combined system (3.15)--(3.19) with boundary condition $\alpha_N = \delta_N = 0$ has a unique solution. Proved by reducing to a cubic equation in $\lambda_n$ (eq. 3.30), showing only the middle root satisfies the second-order condition, then appealing to a scaling argument: if $(\alpha, \delta, \Sigma, \beta, \lambda)$ solve the system for terminal value $\zeta^2 \Sigma_N$, then $(\zeta\alpha, \zeta\delta, \zeta^2\Sigma, \zeta\beta, \zeta^{-1}\lambda)$ solve it for terminal value $\Sigma_N$. Since $\Sigma_N$ is proportional to $\Sigma_0$, uniqueness of $\Sigma_0$ forces a unique solution.

**Key properties:**

- $\Sigma_n$ declines monotonically: information is gradually incorporated.
- If $\sigma_u$ doubles, $\lambda_n$ halves, $\beta_n$ and $\delta_n$ double, $\Sigma_n$ unchanged. More noise trading increases depth and insider profits proportionally without affecting informativeness.
- Expected profits $\propto (\Sigma_0 \sigma_u^2)^{1/2}$, as in the single auction.

### 4. Continuous auction equilibrium (Theorem 3)

Pass to the limit $\Delta t \to 0$. Write the continuous-time analogues:

$$d\pi(t) = [v - p(t) - dp(t)]\,dx(t) = [v - p(t)]\,dx(t),$$
$$dx(t) = \beta(t)[v - p(t)]\,dt,$$
$$dp(t) = \lambda(t)[dx(t) + du(t)].$$

**Theorem 3 (exact).** In the recursive continuous auction equilibrium, $\lambda(t)$ is constant:

$$\lambda(t) = \left(\Sigma_0 / \sigma_u^2\right)^{1/2},$$

and:

$$\Sigma(t) = (1-t)\,\Sigma_0, \qquad \beta(t) = \frac{\sigma_u^2\lambda(t)}{\Sigma(t)} = \frac{\sigma_u\,\Sigma_0^{-1/2}}{1-t},$$

$$\alpha(t) = \tfrac{1}{2}(\sigma_u^2/\Sigma_0)^{1/2}, \quad t \in (0,1), \qquad \delta(t) = \tfrac{1}{2}(\sigma_u^2\Sigma_0)^{1/2}(1-t).$$

*Proof sketch.* Fix an arbitrary $\lambda(\cdot)$ and optimize. The insider's ex ante expected profit is (eq. 4.19):

$$E\{\pi(0)\} = \frac{1}{2}\int_0^1 \lambda(t)\,\sigma_u^2\,dt + \frac{1}{2}\int_0^1 \lambda^{-1}(t)\,d(-\Sigma^*(t)).$$

where $\Sigma^*(t) = E\{[v - p(t)]^2\}$ evolves via $d\Sigma^*/dt = -2\lambda\beta\Sigma^* + \lambda^2\sigma_u^2$. Maximizing over attainable $\Sigma^*(\cdot) \geq 0$ with $\Sigma^*(1) = 0$ (full revelation) shows $\lambda(t)$ must be monotonically nondecreasing (else profitable destabilization). If $\lambda$ ever increases, unbounded profits arise from acquiring a large position on small parcels then liquidating on a flatter supply curve. Hence $\lambda$ is constant. Market efficiency ($\int_0^1 \lambda^2\sigma_u^2\,dt = \Sigma_0$) then pins $\lambda = (\Sigma_0/\sigma_u^2)^{1/2}$. The Kalman filter confirms $\beta(t) = \lambda/\Sigma(t)$ is the correct regression coefficient.

### 5. Convergence (Theorem 4)

**Theorem 4 (exact).** As the mesh $|\Delta t| \to 0$, the sequential auction equilibrium parameters $(\lambda_n, \beta_n, \Sigma_n, \alpha_n, \delta_n)$ converge (uniformly on $[0,1]$ for $\Sigma$ and $\delta$; uniformly on compact subsets of $[0,1)$ for $\lambda$, $\beta$, $\alpha$) to the continuous auction equilibrium of Theorem 3.

*Proof strategy.* The difference equation system is reduced to a single scalar recurrence in $\phi_n = 4\alpha_n^2\Sigma_n/\sigma_u^2$. The recurrence for $\phi_n$ (eq. 5.10--5.11) is analyzed via its cubic; the economically meaningful root satisfies $(\phi_n - \phi_{n-1})/\Delta t_n \to -1$, giving $\phi(t) \to 1-t$ in the limit. From this, $\Sigma(t) = (1-t)\Sigma_0$ and $\lambda(t) = (\Sigma_0/\sigma_u^2)^{1/2}$ are recovered.

## Domain of applicability

**Where the model applies:**

- Single informed trader with monopoly power over private information; results depend critically on the monopoly assumption (competitive insiders would trade more aggressively, revealing information faster).
- Risk-neutral agents throughout. Risk aversion would change both the insider's strategy (inventory effects) and the interpretation of noise trading.
- Gaussian primitives: $\tilde{v}$ normal, noise trading Brownian. The linear equilibrium and closed-form solutions rely entirely on normality; fat tails or discrete signals break the tractability.
- Market orders only; no limit orders, no strategic choice of order type.
- Single asset; no portfolio or cross-asset information leakage.
- Anonymous trading: market makers cannot identify the insider's trades.

**What it delivers for practitioners:**

- The "Kyle lambda" $\lambda = (\Sigma_0/\sigma_u^2)^{1/2}$ as a micro-founded measure of permanent price impact per unit of order flow. Widely used in empirical microstructure.
- Market depth $1/\lambda$ scales as $\sigma_u/\Sigma_0^{1/2}$: more noise trading or less information asymmetry implies deeper markets.
- Constant depth over time in continuous trading: a benchmark against which time-varying depth in real markets can be compared.
- Price follows a Brownian motion with constant volatility $\lambda\sigma_u$, information incorporated linearly in time: $\Sigma(t) = (1-t)\Sigma_0$.
- Insider profits $= \tfrac{1}{2}\Sigma_0^{1/2}\sigma_u$ in the single auction; exactly double ($\Sigma_0^{1/2}\sigma_u$) in continuous trading.
- The model is the foundation for the empirical literature on price impact, informed trading measures (e.g., PIN), and optimal execution (though the latter requires extending to a large uninformed trader rather than an insider).

**Known limitations:**

- Multiple insiders or heterogeneously informed traders require different models (Kyle [5], Back--Cao--Willard 2000).
- The assumption that noise trading is exogenous and independent of prices is strong; endogenizing it (e.g., via hedging demand) changes equilibrium properties.
- Continuous-time equilibrium has a singularity at $t = 1$: $\beta(t) \to \infty$, so the insider trades with infinite intensity just before the terminal date.
- No inventory costs, transaction costs, or discrete tick sizes.
