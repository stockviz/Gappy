# An Optimal Betting Strategy for Repeated Games

**Authors:** Gary Gottlieb (New York University)
**Year:** 1985 (received April 1984, revised November 1984)
**Journal/Venue:** *Journal of Applied Probability*, Vol. 22, pp. 787--795

## Problem statement

A gambler faces an infinite sequence of i.i.d. wagers with positive mean $\mu = EX_1 > 0$ and variance $\sigma^2 = \text{Var}\, X_1$. Each trial returns $t + tX_n$ on a bet of $t$. The gambler chooses a *proportional betting strategy* $\beta = (\beta_n)_{n \geq 1}$, where $\beta_n$ is the fraction of current wealth wagered on trial $n$, producing the wealth process

$$W_0^\beta = 1, \qquad W_n^\beta = \prod_{i=1}^n (1 + \beta_i X_i), \quad n \geq 1.$$

The Kelly criterion selects $\beta^*$ maximizing $E\log(1+\beta X_1)$, which yields $\beta^* \approx \mu/\sigma^2$ for small $\mu$. Gottlieb poses a *different* optimality criterion: given an interval $(a,b)$ with $a < 1 < b$ and a probability threshold $p \in [0,1]$, find the strategy $\beta$ that **minimizes the expected first-exit time** $E(T^\beta)$ from the interval, subject to the constraint that the probability of hitting the upper boundary $b$ before the lower boundary $a$ is at least $p$:

$$T^\beta = \inf\{t > 0 : W_t^\beta \notin (a,b)\}, \qquad P(W_{T^\beta}^\beta \geq b) \geq p.$$

The motivation: the Kelly bettor never wants wealth to drop below a floor; the constraint on $p$ enforces a minimum probability of "winning" (reaching $b$) versus "ruin" (reaching $a$).

## Approach (short)

The discrete-time proportional betting problem is approximated by a continuous-time diffusion. The log-wealth process under a proportional strategy $f(x) = (\mu/\sigma^2)(1 + \rho x^{-1})$ becomes a diffusion whose first-exit time from $(a,b)$ is computed in closed form via the scale function and speed measure (Karlin and Taylor, 1981). The free parameter $\rho$ is pinned by the boundary-hitting probability constraint $P(Y'_{\tau'} = b) = p$, yielding an explicit optimal strategy and expected exit time.

## Approach (detailed)

### 1. Setup and diffusion approximation

Assume the betting fraction on trial $n$ is a continuous function of current wealth: $\beta_{n+1}(X_1, \ldots, X_n) = f(W_n^\beta)$. Compute conditional moments of the wealth increment:

$$E(W_{n+1}^\beta - W_n^\beta \mid W_n^\beta) = f(W_n^\beta)\, W_n^\beta\, \mu,$$
$$\text{Var}(W_{n+1}^\beta - W_n^\beta \mid W_n^\beta) = f'(W_n^\beta)^2 (W_n^\beta)^2\, \sigma^2.$$

*Typo note: the paper writes $f'(W_n^\beta)$ in (1.3) but means $f(W_n^\beta)$; the square on $f$ is on the function value, not the derivative.*

Define the diffusion $\{Y^f(t), t \geq 0\}$ with $Y^f(0) = 1$ satisfying

$$dY^f = f(Y^f)\,\mu\, Y^f\, dt + \sigma\, f(Y^f)\, Y^f\, dB(t).$$

This is the continuous-time approximation to $\{W_n^\beta\}$; one time unit of $Y^f$ corresponds to one wager in the discrete process.

### 2. Reduction to a stochastic control problem

Let $\tau^f = \inf\{t \geq 0 : Y^f(t) = a \text{ or } b\}$. Define:

- $C(p) = \{f : (a,b) \to \mathbb{R} : f \text{ continuous},\; P(\tau^f < \infty) = 1,\; P(Y^f(\tau^f) = b) = p\},$
- $C^*(p) = C(p) \cap \{f : f(x) \geq 0 \text{ for all } x \in (a,b)\}.$

**Problem I.** If $C^*(p) \neq \varnothing$, find $f \in C^*(p)$ minimizing $E(\tau^f)$. Find the set of $p$ for which $C^*(p) = \varnothing$.

### 3. Auxiliary free-boundary problem (Problem II)

Introduce the penalized value function

$$u(x) = \sup_{f \text{ continuous}} E_x[g(Y^f(\tau^f)) - \lambda \tau^f],$$

where $g(a) = 0$, $g(b) = 1$, $\lambda > 0$ is a Lagrange multiplier. **Lemma 1** establishes that the optimal control for Problem II (unconstrained, with penalty $\lambda$ on time) is also optimal for Problem I, provided $f \in C^*(p)$.

**Lemma 2.** $u''(x) < 0$ for $x \in (a,b)$ (strict concavity), proved by a perturbation argument using Brownian motion hitting probabilities (Karlin and Taylor, 1981, p. 205).

### 4. HJB equation and solution

The Hamilton--Jacobi--Bellman equation for Problem II:

$$\lambda = \sup_{y} \left\{\tfrac{1}{2}\sigma^2 y^2 x^2 u''(x) + \mu y x\, u'(x)\right\}.$$

Maximizing over $y$ (the control, i.e., $f(x)$):

$$(2.5) \qquad y^* = -\frac{\mu}{\sigma^2 x} \cdot \frac{u'(x)}{u''(x)}.$$

Substituting back and setting $\lambda' = -2\lambda\sigma^2/\mu^2$ yields the ODE

$$\lambda' u''(x) = (u'(x))^2,$$

with general solution $u(x) = -\lambda' \ln(x + \rho) + k_1$. Hence:

$$(2.8)\quad u'(x) = \frac{-\lambda'}{x+\rho}, \qquad (2.9)\quad u''(x) = \frac{\lambda'}{(x+\rho)^2}.$$

**Theorem 1.** The optimal control for Problem II is

$$f(x) = \frac{\mu}{\sigma^2}(1 + \rho x^{-1}),$$

where $\rho$ is a constant determined by the boundary conditions.

### 5. Pinning $\rho$ via the probability constraint

Under control $f(x) = (\mu/\sigma^2)(1+\rho x^{-1})$, $Y^f$ is a diffusion with scale density $s(x) = (x+\rho)^{-2}$. The hitting probability is

$$R(x) = P_x(Y^f_{\tau^f} = b) = \frac{(b+\rho)(x-a)}{(b-a)(x+\rho)}.$$

Setting $R(1) = p$ and solving:

$$(2.12)\qquad \rho = \frac{b(1-a) - p(b-a)}{p(a-b) - (a-1)}.$$

**Theorem 2.** For $p \in (p_0, 1]$ with $p_0 = (1-a)/(b-a)$, the optimal control for Problem I is $f(x) = (\mu/\sigma^2)(1+\rho x^{-1})$ with $\rho$ given by (2.12). For $p \leq p_0$, $C^*(p) = \varnothing$.

The threshold $p_0$ is the hitting probability of a *pure drift* process (no control needed to achieve it); one cannot demand less than $p_0$ while constraining $f \geq 0$.

### 6. Expected exit time

**Theorem 3.** For $p \in (p_0, 1)$, the minimal expected exit time starting at $x = 1$ is

$$M(1,p) = \frac{2\sigma^2}{\mu^2}\left\{-\ln(1+\rho) + \frac{c}{1+\rho} + d\right\},$$

where

$$c = \frac{\ln\!\left(\frac{a+\rho}{b+\rho}\right)(a+\rho)(b+\rho)}{b-a}, \qquad d = \ln(b+\rho) - \frac{c}{b+\rho}.$$

**Corollary 1** ($p = 1$, certainty of winning): $\rho = -a$, and

$$M(1,1) = \frac{2\sigma^2}{\mu^2}\ln\!\left(\frac{b-a}{1-a}\right).$$

### 7. Comparison with fixed proportional (Kelly-type) strategies

For a fixed proportion $v(x) = \gamma\mu/\sigma^2$ (constant Kelly fraction scaled by $\gamma$), the exit time $\hat{M}(1,p)$ is computed via (2.22). Tables 2.1--2.2 show $\hat{M}/M$ ratios: the optimal state-dependent strategy is always faster, with the gap widening as $p \to 1$ (where $\hat{M}/M \to \infty$). Near $p = p_0$ the two strategies are similar because little probability constraint is active.

## Domain of applicability

- **Diffusion approximation.** Valid when $\sigma^2 \gg \mu$ (equivalently $\mu/\sigma^2$ small), so that many small bets accumulate before boundaries are hit. The motivating example is craps ($\mu = 0.014$, $\sigma^2 \approx 1$). For games with large edge-to-variance ratio, the approximation degrades.

- **Bounded, i.i.d. returns.** The wager distribution is i.i.d. with finite variance. Serial correlation, heavy tails, or time-varying odds are outside scope.

- **Continuous, non-negative controls.** The strategy $f$ must be continuous and non-negative (no short-selling of the wager). The non-negativity constraint $f \geq 0$ is what creates the threshold $p_0$; relaxing it would change the feasible set.

- **Known parameters.** $\mu$ and $\sigma^2$ are assumed known exactly. No estimation error or learning is considered.

- **Single asset / single wager.** No portfolio structure; the gambler faces a single repeated bet. Extension to multiple simultaneous wagers is not addressed.

- **Practical relevance.** The optimal strategy $f(x) = (\mu/\sigma^2)(1+\rho x^{-1})$ bets *more aggressively* as wealth approaches the lower boundary $a$ (since $\rho > 0$ for $p > p_0$). This is intuitive: to maintain the probability of reaching $b$, the gambler must take larger risks when behind. But it also means the strategy is anti-mean-reverting in wealth, which may be unacceptable in practice for risk management reasons despite being theoretically optimal for this criterion.
