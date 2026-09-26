# Price Manipulation and Quasi-Arbitrage

**Authors:** Gur Huberman, Werner Stanzl  
**Year:** 2004  
**Journal/Venue:** *Econometrica*, Vol. 72, No. 4, pp. 1247--1275

## Problem statement

In markets where trades move prices and execution prices are uncertain at the time orders are submitted, what functional forms of the price-impact and price-update functions are consistent with the absence of price manipulation and quasi-arbitrage? The paper characterizes the set of admissible impact functions that prevent a trader -- uninformed about asset value but knowledgeable about the price-volume relation -- from constructing round-trip trading strategies with infinite expected profits or infinite Sharpe ratios.

## Approach (short)

The authors decompose the trade-to-price map into a *price-impact function* $P$ (temporary + permanent effect on the transaction price) and a *price-update function* $U$ (permanent effect on future quotes). They define quasi-arbitrage as a sequence of round-trip trades whose Sharpe ratio diverges to $\infty$, then derive necessary and sufficient conditions on $P$ and $U$ for its absence. The central result: under time-independence, only *linear* price-update functions rule out quasi-arbitrage; the temporary component is pinned down by a relationship to $U$. Under time-dependence (linear slopes varying across periods), the no-manipulation condition becomes positive semidefiniteness of a structured matrix of liquidity parameters.

## Approach (detailed)

**1. Price dynamics.** A single asset is traded at times $n\Delta_N$, $n=1,\dots,N$, $\Delta_N = 1/N$. The trader submits $q_{n,N}$; a noise "trading crowd" adds $\eta_{n,N}$; public news is $\varepsilon_{n,N}$ (i.i.d., zero mean). The price process is:

$$\tilde{p}_{n,N} = \tilde{p}_{n-1,N} + U_{n-1,N}(q_{n-1,N}+\eta_{n-1,N}) + \varepsilon_{n,N},$$
$$p_{n,N} = \tilde{p}_{n,N} + P_{n,N}(q_{n,N}+\eta_{n,N}),$$

where $\tilde{p}_{n,N}$ is the pre-trade quote, $p_{n,N}$ the transaction price, $U_{n,N}$ the price-update (permanent) function, and $P_{n,N}$ the price-impact (permanent + temporary) function. Both are deterministic functions of total order flow $q_{n,N}+\eta_{n,N}$. The temporary impact is $P_{n,N} - U_{n,N}$.

**2. Round-trip trades and profit.** A round-trip trade $q^{0,N}=\{q_{n,N}\}$ satisfies $\sum_{n=1}^N q_{n,N}=0$. Its profit is:

$$\pi(q^{0,N}) \equiv -\sum_{n=1}^N p_{n,N}\, q_{n,N} - c(T(q^{0,N})),$$

where $c(k)$ is a fixed transaction cost proportional to $k^e$, $e<2$.

**3. Key definitions (exact).**

- *Price manipulation*: a round-trip trade $q^{0,N}$ with $\mathbb{E}[\pi(q^{0,N})]>0$.
- *Unbounded price manipulation*: a sequence $\{q_m^{0,N}\}$ with $\lim_{m\to\infty}\mathbb{E}[\pi(q_m^{0,N})]=\infty$.
- *Quasi-arbitrage*: a sequence $\{q_m^{0,N}\}$ with $\lim_{m\to\infty}\mathbb{E}[\pi(q_m^{0,N})]/\operatorname{Std}[\pi(q_m^{0,N})]=\infty$ (Sharpe ratio $\to\infty$).
- *Weak viability*: optimal demand exists. *Strong viability*: optimal demand exists and is uniquely zero.
- Weak viability $\Rightarrow$ no quasi-arbitrage. Under the paper's conditions the converse also holds.

**4. Market classifications.** Three nested markets impose progressively more structure:

- $\mathcal{M}$: expected impact/update functions $\hat{P}_{n,N}$, $\hat{U}_{n,N}$ exist $\forall n,N$; trader may choose $\Delta_N$. Purchases have nonneg expected update; sales nonpositive.
- $\mathcal{M}_1 \subset \mathcal{M}$: same, plus $\hat{U}_{n,N}(q)\geq -\hat{U}_{n,N}(-q)$ for $q\geq 0$ (buys have weakly larger permanent impact than sells).
- $\mathcal{M}_2$: additionally, variances $V_P(q,n,N)$, $V_U(q,n,N)$, $\sigma_\varepsilon^2(N)$ exist, grow at controlled rates $O(N^{a(q,n)})$, $a,b<1$, $d<1$, and $\sigma_\varepsilon^2(N)=O(N^d)$.

**5. Time-independent case (Section 3): necessity of linearity.**  
Set $P_{n,N}=P$, $U_{n,N}=U$ $\forall n,N$.

*Claim 1 (symmetry):* $\hat{U}(q)=-\hat{U}(-q)$. If violated, buy $q$ for $m$ periods then sell $q$ for $m$ periods; expected profit from (5) is $O(m^2)$ while std is $O(m^\theta)$, $\theta<2$.

*Claim 2 (continuity):* $\hat{U}$ is continuous except possibly at the origin. A jump at $q$ enables buying near $q$ and selling at $q$ to exploit the discontinuity.

*Claim 3 (linearity):* If $\hat{U}(q)>\hat{U}(1)q$ for some $q$, buy $q$ in $m$ periods, sell 1 share in each of $mq$ periods ($mq$ integer). Expected profit is $O(m^2 q[\hat{U}(q)-\hat{U}(1)q])$; std is $O(m^\theta)$. Hence $\hat{U}(q)=\hat{U}(1)q$ for all rational $q$, extending to all reals by continuity.

*Claim 4:* $U$ is linear. Define residual $R_U(q)\equiv U(q)-\hat{U}(q)$. Normality of $\eta_{1,N}$ and the integral equation $\int R_U(q+\eta)\,d\mathbb{P}=0$ for all $q$ yields $R_U=0$ $L(\mathbf{R})$-a.e. via a Fourier-transform argument (convolution of $R_U$ with a Gaussian kernel equals zero $\Rightarrow$ the Fourier transform of $R_U$ vanishes).

> **Proposition 1 (exact).** Suppose any trade size is allowed and either (i) $\mathbb{P}[\eta_{1,N}=0]=1$ or (ii) crowd trades are normally distributed. Then NoPM in $\mathcal{M}$ requires $U$ to be linear with nonneg slope, $L(\mathbf{R})$-a.e. This linearity is also implied by NoUM in $\mathcal{M}_1$ and by NoQA in $\mathcal{M}_2$.

> **Theorem 1.** NoPM $\Rightarrow$ $U$ quasi-linear. Quasi-linearity of $U$ is equivalent to each of: NoUM in $\mathcal{M}_1$ and NoQA in $\mathcal{M}_2$.

Here *quasi-linear* means $f(y)=\lambda y + R_f(y)$, $\lambda\geq 0$, where the residual $R_f$ satisfies $\mathbb{E}_{n,N}[R_f(\tilde{q}_{n,N}+\eta_{n,N})]=0$ for every $\mathcal{G}_{n\Delta_N}^{(N)}$-measurable $\tilde{q}_{n,N}$. Under normality of $\eta$, quasi-linearity $\Leftrightarrow$ linearity a.e.

**6. Conditions on the price-impact function $P$.**

> **Proposition 2.** If NoPM or NoUM holds and $c(k)\propto k^a$, $a<1$, then (i) $\hat{P}(q)-\hat{P}(-q)\geq \hat{U}(q)$ for $q\geq 0$ (expected spread $\geq$ expected permanent impact), and (ii) $\hat{P}\neq 0$ when $\hat{U}\neq 0$.

> **Proposition 3 (sufficiency).** Let $U$ be linear with nonneg slope, crowd trades Normal. If $P(q)\geq U(q)/2$ and $P(-q)=-P(q)$ for $q\geq 0$, then NoPM--NoQA all hold. (The key observation: $q^{0,N}=0$ uniquely maximizes $\mathbb{E}[\pi]$ when $P=U/2=\lambda x/2$.)

> **Proposition 4 (equivalence).** Under the conditions of Prop 3 with Normal crowd: linearity of $U$ (nonneg slope, a.e.) $\Leftrightarrow$ NoPM in $\mathcal{M}$ $\Leftrightarrow$ NoUM in $\mathcal{M}_1$ $\Leftrightarrow$ NoQA in $\mathcal{M}_2$.

**7. Strong viability (Corollary 1).** Under Prop 4 conditions: NoQA in $\mathcal{M}_2$ $\Leftrightarrow$ strong viability of $\mathcal{M}_2$. For a risk-neutral trader, strong viability of $\mathcal{M}_1$ $\Leftrightarrow$ NoUM in $\mathcal{M}_1$.

**8. Time-dependent case (Section 4).** Allow linear but time-varying slopes: $U_{n,N}(q)=\lambda_{n,N} q$, $P_{n,N}(q)=\mu_{n,N} q$, with $\mu_{1,N}=\lambda_{1,N}\geq 0$.

> **Theorem 2 (exact).** Fix $\Delta_N$. For all sufficiently large $\tilde{p}_{0,N}$, NoPM in $\mathcal{M}(\Delta_N)$ $\Leftrightarrow$ the matrix $\Lambda_N$ is positive semidefinite, where

$$\Lambda_N \equiv \begin{bmatrix} 2\mu_{2,N} & \lambda_{2,N} & \lambda_{2,N} & \cdots & \lambda_{2,N}\\ \lambda_{2,N} & 2\mu_{3,N} & \lambda_{3,N} & \cdots & \lambda_{3,N}\\ \lambda_{2,N} & \lambda_{3,N} & 2\mu_{4,N} & \cdots & \lambda_{4,N}\\ \vdots & \vdots & \vdots & \ddots & \vdots\\ \lambda_{2,N} & \lambda_{3,N} & \lambda_{4,N} & \cdots & 2\mu_{N,N} \end{bmatrix}.$$

Testing PSD is $O(N)$ via the recursion:

$$\det \Lambda_{j,N} = 2(\mu_{j,N}+\mu_{j-1,N}-\lambda_{j-1,N})\det\Lambda_{j-1,N} - (2\mu_{j-1,N}-\lambda_{j-1,N})^2\det\Lambda_{j-2,N},$$

with $\det\Lambda_{1,N}=2\mu_{2,N}$ and $\det\Lambda_{2,N}=4\mu_{2,N}\mu_{3,N}-\lambda_{2,N}^2$.

Interpretation: when $\lambda_{n,N}=\mu_{n,N}$ (purely permanent impact), PSD of $\Lambda_N$ means liquidity cannot increase too fast over time. If it did, a trader could buy in illiquid early periods, wait for liquidity to improve, then sell at lower cost.

**9. Application to Kyle (1985) model.** In Kyle's equilibrium, price evolves as $p_{n,N}=p_{n-1,N}+\lambda_{n,N}(q_{n,N}+\eta_{n,N})$ with no temporary component and $\varepsilon_{n,N}=0$. The slopes $\lambda_{n,N}$ are endogenous but nearly constant for large $N$. Apply Theorem 2: for any $\Delta_N$, Kyle's slopes are almost constant, hence $\Lambda_N$ is PSD and price manipulation is infeasible. Consequently Kyle's equilibrium is strongly viable.

> **Proposition 5.** If $\{U_{n,N}\}$ are symmetric, monotone ($U_{n,N}(x)\leq U_{n-1,N}(x)$ for $x\geq 0$), and $\eta_{n,N}$ Normal, then NoUM in $\mathcal{M}_1$ implies $\hat{U}_{n,N}$ converge pointwise to a linear function on any $(\tau, 1-\tau)$, $0<\tau<1/2$, as $N\to\infty$.

**10. Multiple assets (Section 5).** Replace scalars with $K$-vectors. All single-asset results carry over. The slope $\lambda$ becomes a PSD matrix. Cross-price impacts must be *symmetric*: the impact of trading asset $i$ on asset $j$'s price equals the impact of trading $j$ on $i$'s price. Asymmetric cross-price impacts enable price manipulation (demonstrated via a two-asset example).

**11. Gain-loss ratio (Section 6).** Define $\operatorname{GLR}[z]\equiv\mathbb{E}[z^+]/\mathbb{E}[z^-]$. In market $\mathcal{M}_1^*$ (variance conditions on negative parts of impact), the absence of "great deals" ($\operatorname{GLR}\to\infty$) is equivalent to NoQA in $\mathcal{M}_2$. All linearity results for $U$ apply unchanged when "no quasi-arbitrage" is replaced by "no infinite gain-loss ratio."

## Domain of applicability

- **Model scope:** Markets with competitive liquidity providers who set prices as deterministic functions of aggregate order flow. Covers market-order-only venues; does not address limit orders.
- **Regularity conditions required:** (a) Crowd trades $\eta_{n,N}$ are i.i.d. with zero mean; the strongest results (exact linearity, not just quasi-linearity) require $\eta$ Normal. (b) Public news $\varepsilon_{n,N}$ i.i.d., zero mean. (c) Variance growth conditions for $\mathcal{M}_2$: $V_P$, $V_U = O(N^{a})$ with $a<1$; $\sigma_\varepsilon^2 = O(N^d)$, $d<1$. (d) Fixed costs $c(k)=O(k^e)$, $e<2$.
- **What it justifies:** The linearity assumption in Kyle (1985) and in optimal-execution models (Bertsimas--Lo 1998, Huberman--Stanzl 2002). Empirical papers finding nonlinear price-update functions either evidence quasi-arbitrage opportunities, time-dependent impact, or identification problems.
- **What it does not cover:** Limit orders and their interaction with market orders; stochastic or state-dependent liquidity beyond the time-varying linear case; price impact that depends on the *sequence* of past trades (path-dependence beyond what $\Lambda_N$ captures); risk-averse traders (the viability results use mean/std utility, not general expected utility).
- **Practical implication for execution:** If one's empirical impact model is nonlinear and time-independent, the framework says either (i) quasi-arbitrage exists (the model is misspecified from an equilibrium standpoint) or (ii) the time-independence assumption is wrong. This provides a structural consistency check for any fitted impact model used in execution cost analysis.
