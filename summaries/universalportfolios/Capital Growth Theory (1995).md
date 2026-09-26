# Capital Growth Theory

**Authors:** Nils H. Hakansson, William T. Ziemba  
**Year:** 1995  
**Journal/Venue:** Chapter 3 in *Handbooks in Operations Research and Management Science*, Vol. 9 (*Finance*), R. Jarrow, V. Maksimovic, and W.T. Ziemba (eds.), Elsevier

## Problem statement

Characterize the growth-optimal (Kelly) investment strategy in discrete and continuous time: its derivation, asymptotic properties, relationship to expected-utility maximization, conditions under which capital grows or declines, the strategy's connection to other dynamic investment models (including consumption-investment), and the growth-versus-security tradeoff that arises for investors whose risk aversion differs from logarithmic.

## Approach (short)

The paper is a comprehensive survey, not a single-proof article. It derives the growth-optimal portfolio as the myopic maximizer of $E[\ln R_t(x_t)]$, catalogs its properties (almost-sure dominance, no ruin, minimum expected first-passage time), embeds it in the broader CRRA/isoelastic family $u(w) = \frac{1}{\gamma}w^{\gamma}$ ($\gamma < 1$, with $\gamma = 0$ being the Kelly case), characterizes the turnpike/convergence behavior of finite-horizon optimal policies toward the growth-optimal strategy, discusses the consumption-investment extension, and reviews empirical applications to asset allocation, blackjack, horse racing, lotteries, and commodity trading.

## Approach (detailed)

### 1. Setup and wealth dynamics

Perfect capital market, $M_t$ investment opportunities in period $t$, risk-free rate $r_{1t}$, risky returns $r_{it}$ ($i = 2, \dots, M_t$). Portfolio weights $x_{it} \equiv z_{it}/w_{t-1}$. Wealth evolves multiplicatively:

$$w_t = w_{t-1} R_t(x_t) = w_0 \prod_{n=1}^{t} R_n(x_n), \qquad R_t(x_t) \equiv \sum_{i=2}^{M_t}(r_{it} - r_{1t})x_{it} + 1 + r_{1t}.$$

### 2. Regularity conditions (exact)

- (C1) $r_{1t} \geq 0$ for all $t$.
- (C2) $E[r_{it}] \geq \delta + r_{1t}$, $\delta > 0$, for some $i, t$ (favorable game).
- (C3) $E[r_{it}] \leq K$ for all $i, t$ (bounded expected returns).
- (C4) No-easy-money / no-arbitrage: $\Pr\!\bigl(\sum_{i=2}^{M_t}(r_{it}-r_{1t})\theta_i < \delta_1\bigr) > \delta_2 > 0$ for all $t$ and all signed unit vectors $\theta$ with $\theta_i \geq 0$ for $i \notin S_t$ (short-sale-restricted assets).
- (C5) Solvency: $\Pr\{w_t \geq 0\} = 1$ for all $t$.
- Returns $F_t$ are either independent across periods or Markov.

### 3. Growth-optimal (Kelly) strategy

Define the time-averaged log-growth rate

$$G_t(\langle x_t \rangle) \equiv \frac{1}{t}\sum_{n=1}^{t} \ln R_n(x_n).$$

By the law of large numbers, $G_t \to E[G_t]$. Hence $w_t \to 0$ if $E[G_t] \leq \delta < 0$ and $w_t \to \infty$ if $E[G_t] \geq \delta > 0$. The sign of $E[\ln R_n(x_n)]$ -- not $E[R_n] - 1$ -- determines long-run growth or ruin (the multiplicative, not additive, criterion matters).

Under (C1)--(C5) and independence/Markov returns, maximizing the long-run compound growth rate is equivalent to solving **sequentially at each $t$**:

$$\max_{x_t}\; E[\ln R_t(x_t)]. \tag{15}$$

This is also equivalent to maximizing the geometric mean of gross return at each step. Key properties of the solution $\langle x_t^* \rangle$:

- **Almost-sure long-run dominance.** For any other strategy $\langle x_t \rangle$ not converging to $\langle x_t^* \rangle$, $w_t(\langle x_t^*\rangle) / w_t(\langle x_t \rangle) \to \infty$ a.s. (follows from strict concavity of $\ln$ and LLN).
- **No ruin.** $\Pr\{R_t(x_t^*) = 0\} = 0$ -- the strategy never risks total loss.
- **Minimum expected first-passage time** to any wealth level (Breiman 1961).
- **Myopia.** The optimal policy depends only on the current-period return distribution; future distributions are irrelevant. This property extends to Markov returns (Hakansson 1971c). No other dynamic model shares this property except under i.i.d. returns for a small set of utility families.
- **Proportionality.** $z_{it}^* = w_{t-1} x_{it}^*$, i.e., dollar amounts are proportional to beginning-of-period wealth.
- **Implied utility.** The strategy is consistent with logarithmic end-of-period utility only ($u(w) = \ln w$), hence relative risk aversion $q(w) = 1$. It is *not* consistent with quadratic/mean-variance preferences in general.

### 4. Capital growth vs. expected utility -- the "paradox"

Consider the isoelastic (CRRA) family:

$$u(w) = \frac{1}{\gamma} w^{\gamma}, \quad \gamma < 1, \qquad (\gamma = 0 \Leftrightarrow \ln w).$$

Let $\langle x_t(\gamma) \rangle$ solve $\max_{x_t} E\bigl[\frac{1}{\gamma} w_t^{\gamma}\bigr]$ at each $t$. Then for $\gamma \neq 0$, $x_t(\gamma) \neq x_t^*$, yet:

$$E\!\left[\frac{1}{\gamma} w_t(\langle x_t(\gamma)\rangle)^{\gamma}\right] > E\!\left[\frac{1}{\gamma} w_t(\langle x_t^*\rangle)^{\gamma}\right], \quad \gamma \neq 0 \tag{17}$$

even though

$$\Pr\{w_t(\langle x_t(\gamma)\rangle) < w_0 a^t < w_t(\langle x_t^*\rangle)\} \geq 1 - \epsilon, \quad t > T(\epsilon). \tag{18}$$

The Kelly strategy almost surely accumulates more wealth, yet a non-log utility maximizer **correctly** prefers her own strategy in expected-utility terms. For $\gamma < 0$ (more risk-averse than log), the wealth distribution under $\langle x_t(\gamma) \rangle$ has a shorter, thinner lower tail; small adverse moves in that tail dominate the utility calculation at negative powers. For $\gamma > 0$, the (thin) upper tail drives utility. This is the core reason the Kelly criterion is not "universally best" in the EU sense.

### 5. Conditions for positive capital growth (exact)

**Theorem.** In the absence of (C1) and (C2), a necessary and sufficient condition for long-run capital growth to be feasible is that the growth-optimal strategy achieves a positive growth rate, i.e., for some $\epsilon > 0$ and large $T$:

$$E[\ln R_t(x_t^*)] \geq \epsilon, \quad t \geq T. \tag{19}$$

For $\gamma < 0$ in the isoelastic family, growth rates lie between those of the risk-free asset and the Kelly strategy. For $\gamma > 0$, long-run growth may be negative; e.g., $u(w) = w^{1/2}$ (substantial risk aversion since Bernoulli) with a two-asset example can lead to almost-sure ruin despite positive expected return.

### 6. Relationship to finite-horizon dynamic programming (turnpike results)

With terminal utility $U_0(w_0)$ (increasing, concave, $U_0'' < 0$), the Bellman recursion is:

$$U_n(w_n) \equiv \max_{z_n | w_n} E[U_{n-1}(w_{n-1}(z_n))], \quad n = 1, 2, \dots$$

**Isoelastic case.** If $U_0(w) = \frac{1}{\gamma}w^{\gamma}$, $\gamma < 1$, and returns are i.i.d., then $U_n(w_n) = a_n U_0(w_n) + b_n \sim U_0(w_n)$, and the optimal policy is **exactly myopic and proportional**: $z_{in}^* = x_{in}(\gamma) \, w_n$ with $x_{in}(\gamma)$ constant across $n$ (Mossin 1968).

**Hyperbolic absolute risk aversion case.** If returns are independent (not necessarily stationary), interest rates deterministic, and $U_0$ is of the form (22), closed-form solutions exist for the first subcase. The optimal investment is proportional to $w_n + \phi / \prod(1+r_{1k})$ -- i.e., to wealth plus the PV of a floor $\phi$.

**General turnpike convergence.** Under mild conditions on $U_0$ and independent (possibly nonstationary) returns (Hakansson 1974; Leland 1972; Huberman and Ross 1983):

$$u_n(w_n) \to \frac{1}{\gamma} w_n^{\gamma}, \qquad z_{in}^*(w_n) \to x_{in}^*(\gamma) \, w_n,$$

as horizon $n \to \infty$. In words: regardless of the terminal utility function, the induced utility converges to an isoelastic function and the optimal policy converges to the corresponding myopic CRRA policy. The growth-optimal strategy ($\gamma = 0$) is one member of this convergent family.

### 7. Consumption-investment extension

With consumption $c_t$ and labor income $y_t$, wealth evolves as:

$$w_t = \sum_{i=2}^{M_t}(r_{it} - r_{1t})z_{it} + (1+r_{1t})(w_{t-1} - c_t) + y_t.$$

Under additive, time-separable, isoelastic period utility $u_t(c_t) = \frac{1}{\gamma}c_t^{\gamma}$ and deterministic income/interest rates, the optimal consumption and investment are both proportional to $w_{t-1} + Y_{t-1}$ (wealth plus PV of future labor income). At $\gamma = 0$, the consumer-investor employs the growth-optimal strategy on invested funds.

### 8. Growth vs. security tradeoffs

Fractional Kelly strategies -- stationary mixtures $(1-f)\,\text{cash} + f\,x_t^*$, $0 < f < 1$ -- trade growth for security. Six measures are analyzed (MacLean, Ziemba & Blazenko 1992): expected wealth, compound growth rate, first-passage time, probability of reaching a target, probability of staying above a path, and probability of doubling before halving. These tradeoffs are generally not efficient (do not maximize security for a given growth level) but are easily computable.

In continuous time with diffusion returns, optimal portfolios are mean-variance efficient instantaneously (Samuelson 1970), and the fractional Kelly strategies are efficient in the growth-security sense when wealth is lognormal (Li 1993).

### 9. Applications reviewed

- **Asset allocation.** Empirical distribution of past $n$ periods used to estimate the joint return distribution; solve (15) for various $\gamma$. Grauer & Hakansson (1982--1994) show the growth-optimal strategy outperformed in long backtests on U.S. and global assets (e.g., 27% annual compound return, 1970--1986, with leverage and quarterly rebalancing). MV approximation to the power function is adequate at quarterly frequency but poor at annual frequency for risk-averse investors (Grauer & Hakansson 1993).
- **Blackjack, horse racing, lotteries, commodity trading.** In each case, a positive-expectation subsystem is identified and the Kelly or fractional Kelly criterion is applied to size bets. Optimal wagers range from $>50\%$ of wealth (commodity turn-of-year effect) to $<10^{-6}$ (lotteries).

## Domain of applicability

- **Core assumptions.** Multiplicative reinvestment without intermediate consumption or withdrawals; no transaction costs or taxes; no price impact; returns independent or Markov across periods. The strategy requires estimation of the full joint return distribution (all moments, not just first two).
- **Where it works well.** Long-horizon investors with repeated reinvestment who can tolerate high short-run volatility (relative risk aversion near 1). Asset allocation at quarterly or higher frequency with moderate leverage. Favorable repeated gambles (sports betting, blackjack) where edge is known.
- **Where it breaks down or requires modification.** (i) Investors more risk-averse than $\log$ ($\gamma < 0$, which is the empirical majority) should use fractional Kelly or the CRRA policy for their $\gamma$. (ii) Transaction costs, illiquidity, and price impact require multi-stage stochastic programming extensions; myopia no longer holds. (iii) Non-Markov return dynamics weaken the myopia property (though Algoet & Cover 1988 show basic properties survive under arbitrary processes). (iv) Consumption, income streams, and liabilities shift the effective wealth base to $w + Y$ and complicate the closed-form solutions. (v) The strategy is not mean-variance efficient except approximately for short rebalancing intervals or symmetric returns; it is incompatible with quadratic utility.
