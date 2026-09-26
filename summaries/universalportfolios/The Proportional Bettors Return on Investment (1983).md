# The Proportional Bettor's Return on Investment
**Authors:** S. N. Ethier, S. Tavare  **Year:** 1983  **Journal/Venue:** *Journal of Applied Probability* **20**, 563--573

## Problem statement

A bettor with advantage $p > 1/2$ repeatedly plays a favorable game, wagering a fixed proportion $f \in (0,1]$ of current wealth each round. The *return on investment* (ROI) is net gain divided by total amount wagered:
$$R_n = \frac{F_n - F_0}{f \sum_{k=0}^{n-1} F_k}.$$
What is the asymptotic distribution of $R_n$ as $n \to \infty$? In particular, how does the ROI under optimal (Kelly) proportional betting compare to that under constant (flat) betting, and what happens as the edge $\varepsilon = 2p - 1 \to 0^+$?

## Approach (short)

The authors show that $R_n$ converges in distribution to a random variable $R \in (0,1)$ a.s., establish that $\mathbf{E}R < \mathbf{E}X_1$ (proportional betting yields lower expected ROI than flat betting), and then parameterize the edge as $\varepsilon \to 0^+$ with betting fraction $f = \alpha f^*(\varepsilon)$ ($\alpha \in (0,2)$, $f^*$ the Kelly fraction) to prove that the ratio $R^\alpha(\varepsilon)/\mathbf{E}X_1(\varepsilon)$ converges in distribution to a $\text{Gamma}(2/\alpha - 1,\; 2/\alpha)$, which at $\alpha = 1$ (Kelly) reduces to $\text{Exponential}(2)$.

## Approach (detailed)

### Setup and definitions

1. **Game model.** i.i.d. random variables $X_1, X_2, \ldots$ taking values in $[-1, \infty)$ (generalized from $\{-1,+1\}$), with $0 < \mathbf{E}X_1 < \infty$. The bettor wagers fraction $f \in (0,1]$ of current fortune each trial:
$$F_n = F_0 \prod_{i=1}^{n}(1 + f X_i).$$

2. **Exponential growth rate.**
$$G_p(f) = \mathbf{E}\log(1 + f X_1).$$
The Kelly fraction $f^* = \arg\max_f G_p(f)$, i.e. $f^* = 2p - 1$ in the $\pm 1$ case. Condition throughout: $G_p(f) > 0$, ensuring $F_n \to \infty$ a.s.

3. **Return on investment.**
$$R_n = \frac{F_n - F_0}{f \sum_{k=0}^{n-1} F_k}, \qquad R = \frac{1}{f \sum_{k=1}^{\infty}(F_0 / F_k)}.$$

### Proposition 2.1 -- Asymptotic distribution of $R$

Let $X_1, X_2, \ldots$ be i.i.d. $[-1,\infty)$-valued with $0 < \mathbf{E}X_1 < \infty$, and $f \in (0,1]$ with $\mathbf{E}\log(1 + fX_1) > 0$. Then:

- **(a)** $0 < R < \text{ess\,sup}\, X_1$ a.s.
- **(b)** $R_n \xrightarrow{d} R$ as $n \to \infty$.
- **(c)** There exists $R'$ (independent of $X_1$, equal in distribution to $R$) such that the distributional fixed-point equation holds:
$$R = \frac{(1 + fX_1)\, R'}{1 + fR'}.$$
- **(d)** $\mathbf{E}R < \mathbf{E}X_1$.

**Proof sketch for (b).** By time-reversal: $R_n \stackrel{d}{=} [1 - (F_0/F_n)] / [f \sum_{k=1}^{n}(F_0/F_k)]$. Since $F_0/F_n \to 0$ a.s. (from $G_p(f)>0$) and $\sum(F_0/F_k)$ converges a.s. by the root test (using $\lim (F_0/F_k)^{1/k} = e^{-G_p(f)} < 1$), the limit is $R$ as defined by (1.7).

**Proof sketch for (c).** Define $R'$ from $X_2, X_3, \ldots$ exactly as $R$ is defined from $X_1, X_2, \ldots$. Then $1/R = (1/(1+fX_1))(f + 1/R')$, which is equivalent to the fixed-point equation.

**Proof of (d).** By (c), $R \leq (1+fX_1)/f$, so $\mathbf{E}R < \infty$. Since $\Psi(r) = r/(1+fr)$ is strictly concave, Jensen's inequality gives $\mathbf{E}R = \mathbf{E}[(1+fX_1)\Psi(R)] < \Psi(\mathbf{E}R)(1 + f\mathbf{E}X_1)$, yielding $\mathbf{E}R < \mathbf{E}X_1$.

### Proposition 2.2 -- Generalization to non-i.i.d. trials (conditional convergence)

If $(X_{1n}, \ldots, X_{mn}) \xrightarrow{d} (X_m, \ldots, X_1)$ as $n \to \infty$ for each $m$, and a uniform integrability condition $\mathbf{E}(F_0/F_{mn})^u \leq \mathbf{E}(F_0/F_m)^u$ holds for $0 < u < 1$, then $R_{mn} \xrightarrow{d} R$. Corollary 2.3 specializes this to the case where the empirical frequencies of outcomes converge to the true probabilities (law of large numbers conditioning).

### Theorem 3.2 -- Limiting distribution as edge vanishes

**Setup.** Let $X_1(\varepsilon)$ be $[-1, M]$-valued with $\mathbf{E}X_1(\varepsilon) = m_1(\varepsilon) > 0$, $\text{Var}(X_1(\varepsilon)) = m_2(\varepsilon)$, $X_1(\varepsilon) \xrightarrow{d} X_1(0)$ as $\varepsilon \to 0^+$, and $\mathbf{E}X_1(0) = 0$, $m_2(0) > 0$. Fix $\alpha \in (0, 2)$. Set $f = \alpha f^*(\varepsilon)$ where $f^*(\varepsilon)$ is the Kelly fraction for edge $\varepsilon$. Define $R^\alpha(\varepsilon)$ accordingly. Then as $\varepsilon \to 0^+$:

$$\frac{R^\alpha(\varepsilon)}{\mathbf{E}X_1(\varepsilon)} \xrightarrow{d}\; \text{Gamma}\!\left(\frac{2}{\alpha} - 1,\; \frac{2}{\alpha}\right),$$

where $\text{Gamma}(\theta, \lambda)$ has density $\Gamma(\theta)^{-1}\lambda^\theta x^{\theta-1}e^{-\lambda x}$ on $(0,\infty)$. Moreover, uniform integrability holds, so moments converge:
$$\lim_{\varepsilon \to 0^+} \frac{\mathbf{E}R^\alpha(\varepsilon)}{\mathbf{E}X_1(\varepsilon)} = 1 - \frac{\alpha}{2}.$$

**Special case $\alpha = 1$ (Kelly).** $R^1(\varepsilon)/\mathbf{E}X_1(\varepsilon) \xrightarrow{d} \text{Exponential}(2)$ with $\lim \mathbf{E}R^1/\mathbf{E}X_1 = 1/2$. This formalizes Wong (1981): Kelly betting yields about half the expected ROI of flat betting.

**Proof strategy.** 

1. **Lemma 3.1** establishes that $f^*(\varepsilon) = m_1(\varepsilon)/m_2(\varepsilon)(1 + o(1))$ as $\varepsilon \to 0^+$, and that $G_\varepsilon(\alpha f^*(\varepsilon)) = \alpha f^* m_1(1 - \frac{1}{2}\alpha + o(1))$.

2. **Moment recursion.** Let $\mu_n(\varepsilon) = \mathbf{E}[R^\alpha(\varepsilon)]^n$. Using Proposition 2.1(c) and the inequality $(x+c)^\delta \leq x^\delta + \delta c x^{\delta-1}$ for suitable bounds, the authors show:
$$\frac{\mu_{n+1}/m_1^{n+1}}{\mu_n/m_1^n} \to 1 + \frac{(n-1)}{2}\alpha \quad \text{as } \varepsilon \to 0^+.$$

3. **Moment identification.** The recursion $\nu_{n+1} = (1 + \frac{n-1}{2}\alpha)\,\nu_n$ with $\nu_1 = 1 - \alpha/2$ uniquely determines the moments of $\text{Gamma}(2/\alpha - 1, 2/\alpha)$.

4. **Tightness and weak convergence.** Uniform integrability of $(R^\alpha/\mathbf{E}X_1)^{-\delta}$ for small $\delta > 0$ (proved via moment bounds on $F_0/F_k$ terms) ensures tightness. Any subsequential weak limit $U$ satisfies the Laplace transform of $\text{Gamma}(\theta, \lambda)$ by the moment recursion (3.6), hence $U$ is uniquely $\text{Gamma}(2/\alpha - 1, 2/\alpha)$.

**Alternative proof (Remark 3.3).** For the $\pm 1$ case, the inverse $V = (R^\alpha/\mathbf{E}X_1)^{-1}$ satisfies a second-order ODE for its Laplace transform $\phi$:
$$\tfrac{1}{2}\alpha t\,\phi''(t) + (\alpha - 1)\phi'(t) - \phi(t) = 0, \quad t > 0,$$
with $\phi(0^+) = 1$, $\phi$ monotone decreasing. The solution is expressed in terms of the modified Bessel function $K_\theta$ of order $\theta = 2/\alpha - 1$, confirming $1/V \sim \text{Gamma}(\theta, \lambda)$.

### Key quantitative consequence

$$h(\alpha) \equiv \lim_{\varepsilon \to 0^+} \mathbf{P}\{R^\alpha(\varepsilon)/\mathbf{E}X_1(\varepsilon) > 1\}$$
gives the asymptotic probability that proportional betting beats flat betting in ROI. Computed values: $h(0^+) = 1/3$, $h(1) = e^{-2} \approx 0.135$, $h(2^-) = 0$. The function $h$ is believed to be monotone decreasing on $(0,2)$.

## Domain of applicability

**Where it applies.** Any repeated favorable game with i.i.d. bounded outcomes and positive edge where the bettor uses fixed-fraction sizing. The key results (Proposition 2.1) extend to $[-1, \infty)$-valued outcomes provided $\mathbf{E}X_1 < \infty$ and $G_p(f) > 0$. The asymptotic Gamma limit (Theorem 3.2) requires boundedness ($X_1 \in [-1, M]$) and the small-edge regime.

**Where it breaks.**

- **Non-i.i.d. outcomes.** The basic convergence (Proposition 2.1) assumes i.i.d. trials. Proposition 2.2 relaxes this to exchangeability-like conditions, but serial dependence (as in card counting or momentum strategies) is not covered.
- **Blackjack and real gambling.** The authors explicitly note (Section 1) that blackjack violates independence, stationarity, and the $X_1 \geq -1$ bound (due to doubling down, splitting). The qualitative message likely survives, but the exact distributional results do not apply.
- **Unbounded outcomes.** Theorem 3.2 requires $X_1(\varepsilon) \in [-1, M]$. For heavy-tailed return distributions (e.g., lognormal, Pareto), the Gamma limit may fail.
- **Finite horizon.** All results are asymptotic ($n \to \infty$). The rate of convergence is not characterized; for finite $n$ the distribution of $R_n$ may differ substantially.
- **Overbetting ($\alpha \geq 2$).** The Gamma shape parameter $\theta = 2/\alpha - 1$ is non-positive for $\alpha \geq 2$, and the result explicitly excludes this range. Overbetting by a factor of 2 or more relative to Kelly is not treated.
- **Transaction costs, discrete lot sizes, wealth constraints.** Not modeled. In practice these erode the proportional bettor's advantage further.
- **Overclaiming risk.** The statement $\mathbf{E}R \approx \frac{1}{2}\mathbf{E}X_1$ for Kelly betting is exact only in the limit $\varepsilon \to 0^+$. For finite edge the ratio can differ; the authors do not bound the approximation error.
