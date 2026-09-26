# High-Risk and Competitive Investment Models

**Authors:** F. Thomas Bruss, Thomas S. Ferguson
**Year:** 2002
**Journal/Venue:** *The Annals of Applied Probability*, Vol. 12, No. 4, pp. 1202--1226

## Problem statement

An investor with initial capital $x_0$ observes $n$ investment opportunities sequentially in random order. At each stage $k$, if the $k$th opportunity is a *record* (relatively best among all seen so far), the investor may allocate any amount $b_k \in [0, x_{k-1}]$ of remaining capital to it. If that record turns out to be the absolute best among all $n$ opportunities, the investment returns $y_k = \beta_k b_k$ with $\beta_k \geq 1$; otherwise the investment is lost entirely. Uninvested capital is preserved (no interest, no depreciation). The objective is to maximize the expected utility of terminal wealth $u_\alpha(x) = (x^\alpha - 1)/\alpha$ for $\alpha \neq 0$, with $u_0(x) = \log x$.

The high-risk, winner-take-all payoff structure is motivated by competitive settings (venture capital, technology races) where only the best opportunity pays off and all others are worthless. The paper treats: (i) the rank-based model (no distributional assumptions on quality, only ordinal comparisons), (ii) the full-information model (opportunity values i.i.d. from a known continuous distribution, WLOG Uniform$(0,1)$), and (iii) the case of an unknown number of opportunities modeled via Pascal processes.

## Approach (short)

Dynamic programming via backward induction on the number of remaining opportunities. The value function $V_k(x, y)$ tracks available capital $x$ and outstanding investment $y$. The Bellman recursion is solved in closed form for the HARA utility family $u_\alpha$ for all $\alpha \leq 1$. The discrete recursion is then passed to a continuous-time limit ($n \to \infty$, $k/n \to t$) via Euler--Cauchy approximation, yielding an ODE for the limiting threshold/proportion function. The unknown-$n$ case is handled by embedding the record process in a Pascal arrival process, which has independent increments and yields explicit solutions.

## Approach (detailed)

### 1. Bellman recursion (rank-based model, fixed $n$)

At stage $k$ (counting from the beginning), the $k$th opportunity is a record with probability $1/k$. Define $V_k(x, y)$ = optimal expected utility of terminal wealth when capital available is $x$, outstanding investment return is $y$, and we are about to observe opportunity $k$. The backward recursion is:

$$V_n(x, y) = \frac{n-1}{n}\,u_\alpha(x + y) + \frac{1}{n}\,u_\alpha(\beta_n x)$$

$$V_k(x, y) = \frac{k-1}{k}\,V_{k+1}(x, y) + \frac{1}{k}\max_{0 \leq b \leq x} V_{k+1}(x - b,\;\beta_k b)$$

for $k = 1, \ldots, n-1$. The first term accounts for the $k$th opportunity not being a record (probability $(k-1)/k$); the second accounts for it being a record (probability $1/k$), in which case the prior investment $y$ is lost and we optimize over the new bet $b$.

### 2. Linear utility ($\alpha = 1$): all-or-nothing policy

With $u_1(x) = x$, the optimization in $b$ is linear, so the optimum is at a boundary: invest everything or nothing.

**Theorem 1.** For $\alpha = 1$:

$$V_k(x, y) = \frac{k-1}{n}\bigl[x + y + c_k x\bigr], \quad k = 2, \ldots, n$$

where $c_n = \beta_n/(n-1)$ and

$$c_k = c_{k+1} + \frac{1}{k-1}\max\{1 + c_{k+1},\;\beta_k\}.$$

The optimal policy is to invest everything in the first record at stage $k$ for which $\beta_k > c_{k+1} + 1$, and nothing otherwise.

*Proof:* Backward induction. The linearity in $b$ forces a bang-bang solution at each stage.

### 3. Asymptotic limit for linear utility

Set $\beta_k = \beta(k/n)$ continuous with $\beta(t) \geq 1$ on $(0, 1]$. The recursion for $c_k$ becomes, after interpolation, an Euler--Cauchy approximation to the ODE:

$$f'(t) = -\frac{1}{t}\max\{1 + f(t),\;\beta(t)\}, \quad f(1) = 0, \quad \lim_{t \to 0+} f(t) = \infty.$$

**Theorem 2.** The limiting optimal policy invests all capital in the first record after time $t^*$ where $\beta(t^*) = 1 + f(t^*)$. The limiting value per unit capital is $V_0 = x\,(1 + f(t_0))\,t_0$ where $t_0$ is the boundary point between two regimes of the ODE.

*Example (constant $\beta$):* $t_0 = e^{-(\beta - 1)/\beta}$, optimal expected reward $= \beta\,e^{-(\beta - 1)/\beta}\,x$. For $\beta = 2$: reward $\approx 1.2131\,x$.

*Example (simple interest, $\beta(t) = 1 + (1-t)p$):* Invest in the first record after $t_0$ satisfying $-(1+p)\log(t_0) = 2(1-t_0)p$, provided $p > 1$.

### 4. Log utility ($\alpha = 0$): Kelly betting

The concavity of $\log$ yields an interior optimum -- a *proportional* investment system (Kelly criterion applied to records).

**Theorem 3.** The optimal investment at stage $k$ in a record opportunity is the proportion

$$a_k = \left(\frac{k\beta_k - n}{n(\beta_k - 1)}\right)^+$$

of remaining capital. The value function is:

$$V_k(x, y) = \frac{k-1}{n}\log(x+y) + \frac{n-k+1}{n}\log(x) + c_k$$

where $c_k$ satisfies a forward recursion involving $a_k$ (no backward computation needed -- a remarkable structural simplification).

**Theorem 4 (asymptotic).** As $n \to \infty$ with $k/n \to t$, $a_k \to a(t)$ where:

$$a(t) = \begin{cases} \frac{t\beta(t) - 1}{\beta(t) - 1}, & \text{if } t\beta(t) > 1,\\[4pt] 0, & \text{if } t\beta(t) \leq 1. \end{cases}$$

The limiting value function satisfies an ODE with $f(1) = 0$:

$$f'(t) = \begin{cases} 0, & \text{if } t\beta(t) \leq 1,\\[4pt] -\frac{1}{t}\bigl[\log\beta(t) - (1-t)\log(\beta(t)-1) + t\log(t) + (1-t)\log(1-t)\bigr], & \text{if } t\beta(t) > 1. \end{cases}$$

*Example (constant $\beta$):* Invest proportion $(t\beta - 1)/(\beta - 1)$ in each record after time $1/\beta$.

### 5. General $\alpha < 1$, $\alpha \neq 0$: proportional system

**Theorem 5.** The optimal policy is again proportional. At a record at stage $k$, invest the fraction

$$\frac{1 - \theta_k}{1 + (\beta_k - 1)\theta_k}$$

of remaining capital, where $\theta_k = \bigl(c_{k+1}/(\beta_k - 1)\bigr)^{1/(1-\alpha)}$, provided $\beta_k - 1 > c_{k+1}$ (otherwise do not invest). The $c_k$ satisfy the recursion:

$$c_k = c_{k+1} + \frac{1}{k-1}\begin{cases} 1 + c_{k+1}, & \text{if } \beta_k - 1 \leq c_{k+1},\\[4pt] \beta_k^\alpha\bigl(1 + (\beta_k - 1)\theta_k\bigr)^{1-\alpha}, & \text{if } \beta_k - 1 > c_{k+1}. \end{cases}$$

**Theorem 6 (asymptotic).** As $n \to \infty$, the recursion converges (Euler--Cauchy) to the ODE (4.7) with boundary $f(1) = 0$. The investment proportion at time $t$ is $(1 - \theta(t))/(1 + (\beta(t)-1)\theta(t))$ where $\theta(t) = (f(t)/(\beta(t)-1))^{1/(1-\alpha)}$.

Dependence on $\alpha$: As $\alpha$ decreases (more risk-averse), the investor invests smaller fractions over a wider range of arrival times. At $\alpha = -1$, the investor hedges by investing small amounts even at unfavorable odds ($t < 0.5$).

### 6. Full-information model

Opportunity values $U_1, \ldots, U_n$ are i.i.d. Uniform$(0,1)$. Let $k$ now count stages to go.

**Theorem 7 ($\alpha = 1$).** $V_k(x, y, z) = z^k(x + y) + x\,c_k(z)$ where $c_0(z) = 0$ and

$$c_k(z) = z\,c_{k-1}(z) + \int_z^1 \max\{u^{k-1} + c_{k-1}(u),\;u^{k-1}\beta_k\}\,du.$$

Invest everything in a record of value $U_k = u$ iff $c_{k-1}(u) < u^{k-1}(\beta_k - 1)$.

**Theorem 8 ($\alpha = 0$).** With log utility, the optimal proportion in a record of value $u$ with $k$ stages to go is $a_k(u) = (u^{k-1}\beta_k - 1)^+ / (\beta_k - 1)$ when $u^{k-1}\beta_k > 1$, zero otherwise. For constant $\beta$, the cutoff values $z_k$ satisfy $\sum_{j=1}^{k-1} (z_k^{-j} - 1)/j = (\beta - 1)/\beta$.

The full-information model approximately doubles the return compared to the rank-based model (for $\beta = 2$: $\approx 1.4276\,x$ vs. $\approx 1.2131\,x$).

### 7. Unknown number of opportunities: Pascal processes

When $n$ is unknown, the counting process $N(t)$ on $[0, T]$ is modeled as a Pascal process -- defined by the property that $N(t) \mid N(s)$ (for $s < t$) is Pascal (negative binomial) distributed. This arises from: (a) a geometric prior on $N$, or (b) an exponential prior on the Poisson rate.

Key structural property: the record process of a Pascal process is Poisson with intensity $\lambda(t) = \varphi'(t)/\varphi(t)$, where $\varphi(t)$ is the parameter function satisfying $\int_t^T \lambda(s)\,ds = -\log \varphi(t)$. Records have independent increments, so the optimal policy is stationary (no updating needed).

**Theorem 9.** For linear utility with Pascal arrivals and continuous reward $\beta(t)$, invest all capital in the first record at time $t$ satisfying $\beta(t)\varphi(t) \geq r(t)$, where $r(t)$ solves

$$r'(t) = -\lambda(t)\bigl(\beta(t)\varphi(t) - r(t)\bigr)^+, \quad r(T) = 1.$$

The optimal reward per unit capital is $r(0)$.

*Example (constant $\beta$):* $r(t) = (1 - \beta \log \varphi(t))\,\varphi(t)$, and the threshold time is $t^* = \varphi^{-1}(e^{-(\beta-1)/\beta})$.

*Robustness (Section 6.5):* With very weak information (exponential prior on rate $\lambda$ with mean $1/a$), $\varphi(t) = (t + a)/(T + a)$. For $\beta = 2$, the optimal reward $r(0) = 2e^{-1/2} \approx 1.2131$ is independent of $a$ for $0 \leq a \leq 12e^{-1/2}/(1 - e^{-1/2}) \approx 18.5$. The optimal waiting time $t^*$ depends on $a$ but $r(t^*)$ is flat, making the strategy robust to misspecification of the arrival rate.

## Domain of applicability

- **Winner-take-all competitions:** venture capital targeting a single technology race, patent contests, competitive bidding for exclusive contracts -- settings where the best opportunity captures the entire payoff and losing bets are worthless.
- **Sequential screening with partial commitment:** situations where an investor observes opportunities one-by-one, can split capital across multiple bets, but only the single best pays off. Distinct from standard portfolio theory (where diversification reduces risk) because here diversification across opportunities has no hedging benefit for realized payoffs -- only for the probability of hitting the winner.
- **Rank-based vs. full-information trade-off:** rank-based model applies when only ordinal comparisons are feasible (common in competitive environments with secrecy barriers); full-information model applies when quality is observable and its distribution is known. The rank-based model is more robust to distributional misspecification.
- **Limitations:** (i) No discounting or interest on uninvested capital (by assumption). (ii) Lost investments are total losses -- no partial recovery. (iii) The model is single-pass: each opportunity is seen once. (iv) The proportional investment result depends on the HARA form of $u_\alpha$; other utility families may not yield proportional policies. (v) Continuous-time asymptotics require $\beta(\cdot)$ continuous and $\geq 1$ on $(0, 1]$.
- **Pascal process extension** handles unknown $n$ gracefully but requires the geometric-prior structure (or equivalent) for tractability. The solution is robust to the prior hyperparameter but not to the choice of prior family.
