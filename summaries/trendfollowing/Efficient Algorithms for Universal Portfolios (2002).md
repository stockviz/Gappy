# Efficient Algorithms for Universal Portfolios

**Authors:** Adam Kalai, Santosh Vempala **Year:** 2002 **Journal/Venue:** Journal of Machine Learning Research, 3, 423--440

## Problem statement

Cover's UNIVERSAL portfolio algorithm (Cover, 1991) achieves total wealth equal to the performance-weighted average over all constant rebalanced portfolios (CRPs) on the simplex. It is known (Cover and Ordentlich, 1996) that UNIVERSAL's performance ratio relative to the best CRP in hindsight satisfies

$$\frac{\text{Performance of UNIVERSAL}}{\text{Performance of best CRP}} \ge \frac{1}{(t+1)^{n-1}},$$

where $n$ is the number of stocks and $t$ the number of trading days. The per-period ratio $(1/(t+1)^{n-1})^{1/t} \to 1$, so the algorithm is asymptotically competitive. However, all known implementations are exponential in $n$: direct quadrature over the $(n-1)$-simplex $\Delta$ costs $\Theta(t^{n-1})$ per day, and naive uniform Monte Carlo (Blum and Kalai, 1999) also requires $\Omega(t^{n-1})$ samples in the worst case because the performance-weighted distribution $\rho_t$ can concentrate on a vanishing fraction of the simplex.

The paper asks: can one implement UNIVERSAL in time polynomial in $n$, $t$, $1/\epsilon$, and $\log(1/\eta)$, while achieving at least $(1-\epsilon)$ times its wealth with probability at least $1-\eta$?

## Approach (short)

Replace uniform sampling with importance sampling from $\rho_t$ (the performance-weighted distribution over CRPs). Sampling from $\rho_t$ reduces to sampling a log-concave density on a convex body, which is achieved in polynomial time via the Metropolis-type random walk of Frieze and Kannan (1999) on a discretized simplex. A damped variant $Q_t$ of the wealth function $P_t$ handles boundary effects.

## Approach (detailed)

### Setup and notation

1. A market has $n$ stocks over $T$ days. Day-$i$ price relatives are $\vec{x}_i \in \mathbb{R}^n_+$. A portfolio $\vec{b} \in \Delta$ (the $(n-1)$-simplex) yields daily return $\vec{b}\cdot\vec{x}_i$. The CRP wealth after $t$ days is $P_t(\vec{b}) = \prod_{i=1}^{t} \vec{b}\cdot\vec{x}_i$.

2. UNIVERSAL sets portfolio weights at time $t$ via:
$$u_t^j = \frac{\int_\Delta v^j\, P_t(\vec{v})\,d\mu(\vec{v})}{\int_\Delta P_t(\vec{v})\,d\mu(\vec{v})},$$
where $\mu$ is the uniform measure on $\Delta$. Equivalently, $u_t^j = \mathbb{E}_{\vec{v}\sim\rho_t}[v^j]$ under the performance-weighted distribution $d\rho_t(\vec{b}) \propto P_t(\vec{b})\,d\mu(\vec{b})$.

### Key idea: non-uniform sampling

3. Naive uniform sampling needs $\Omega(t^{n-1})$ draws because most of the $\rho_t$-mass can concentrate in a small region. Instead, sample directly from $\rho_t$. Since $P_t$ is log-concave (the log is a sum of concave functions $\log(\vec{b}\cdot\vec{x}_i)$), $\rho_t$ is a log-concave distribution on a convex body -- exactly the setting where Frieze--Kannan random walks are efficient.

### The R-UNIVERSAL algorithm

4. **Damped wealth function.** To handle the simplex boundary (where $P_t$ can vary wildly within a single grid cell), define
$$Q_t(\vec{b}) = P_t(\vec{b})\,\min\!\left\{\exp\!\left(\frac{b^n - 2\delta_0}{n\delta}\right),\,1\right\},$$
where $\delta_0$ is a minimum-coordinate threshold and $\delta$ is the grid spacing. $Q_t$ equals $P_t$ in the interior and decays exponentially near the boundary of the $n$-th coordinate. $Q_t$ remains log-concave (product of log-concave functions). It is evaluable in $O(nt)$.

5. **Discretization.** Restrict to the shrunken simplex $\Delta' = \{\vec{v}\in\Delta \mid v^j \ge \delta_0,\; j=1,\ldots,n\}$. Tile $\Delta'$ with cubes of side $\delta$. Let $C'$ be the set of cube centers inside $\Delta'$.

6. **Metropolis walk on the grid.** The algorithm R-UNIVERSAL$(\delta_0,\delta,m,S)$ runs $m$ independent random walks, each of $S$ steps, starting from $(1/n,\ldots,1/n)$. At each step:
   - Pick a random coordinate $j \in \{1,\ldots,n-1\}$.
   - Propose moving $r^j \mapsto r^j + X\delta$, $r^n \mapsto r^n - X\delta$, where $X\in\{-1,+1\}$ uniformly, provided the new point stays in $\Delta'$.
   - Accept with probability $\min(1, x/y)$ where $x = Q_t(\text{current})$, $y = Q_t(\text{proposed})$.

   The stationary distribution is $\pi_t(\vec{x}) \propto Q_t(\vec{x})$ over $C'$, which approximates $\rho_t$.

7. **Portfolio computation.** The day-$t$ portfolio is the coordinate-wise average of the $m$ endpoint samples.

### Analysis

8. **Theorem 2 (main guarantee, approximate).** There exists a constant $A$ such that for all $\epsilon, \eta > 0$, setting
$$\delta_0 \le \frac{\epsilon}{8nT(n+T)^2}, \qquad \delta\log\frac{1}{\delta} = \frac{\epsilon\,\delta_0}{A(n+T)^2},$$
$$m \ge \frac{64T^2(n+T)\ln(nT/\eta)}{\epsilon^2}, \qquad S \ge \frac{An}{\delta^2}\log\frac{n+T}{\epsilon\delta},$$
R-UNIVERSAL achieves at least $(1-\epsilon)$ times the wealth of UNIVERSAL, with probability $\ge 1-\eta$. All parameters are polynomial in $n$, $T$, $1/\epsilon$, $\log(1/\eta)$.

9. **Runtime.** Day-$t$ cost is $O(mSnt)$, which is polynomial in $n,t,1/\epsilon,\log(1/\eta)$. (Compare $\Theta(t^{n-1})$ for exact UNIVERSAL.)

### Proof architecture

10. **$P_t$ and $Q_t$ are log-concave** (Lemma 9). For $P_t$: $\log P_t(\vec{b}) = \sum_i \log(\vec{b}\cdot\vec{x}_i)$ is concave. For $Q_t$: the damping factor $\exp((b^n-2\delta_0)/(n\delta))$ is log-linear, and $\min$ of two log-concave functions is log-concave.

11. **Mean of $\rho_t$ is interior** (Corollary 6). Each component satisfies $u_t^j \ge 1/(n+t)$, proved via Lemma 5: a simplex shrunken by factor $(1-z)$ retains $\rho_t$-mass $\ge (1-z)^{t+n-1}$.

12. **Approximation suffices** (Theorem 4). If the random walk's empirical distribution $\tilde{\pi}_t$ satisfies $\sum_{x\in C'} |\tilde{\pi}_t(x) - \pi_t(x)| \le \epsilon/(4T(n+T))$, then with $m \ge 64T^2(n+T)\ln(nT/\eta)/\epsilon^2$ samples, R-UNIVERSAL achieves $(1-\epsilon)$ times UNIVERSAL's wealth w.p. $\ge 1-\eta$. The proof combines Lemma 7 (grid discretization error $\le (1+\delta/\delta_0)^T$), Lemma 8 ($E_{\pi_t}[v^j] \ge (1-\epsilon/(2T))\,u_t^j$), and multiplicative Chernoff bounds over $nT$ stock-day pairs.

13. **Mixing time** (Theorem 11, via Frieze--Kannan Theorem 3). After $s \ge \frac{An}{\delta^2}\log\frac{n+T}{\epsilon\delta}$ steps, the walk's distribution $p_s$ satisfies $\sum_{x\in C'} |p_s(x) - \pi_t(x)| \le \epsilon/(4T(n+T))$. The bound on $\pi_{1/2}$ (mass on boundary cubes) is controlled by the exponential damping in $Q_t$, giving $\pi_{1/2} \le \delta^{A(n+t)^2/(n\epsilon)}\,e^{1/2}$, which is negligible.

## Domain of applicability

- **Number of assets.** The algorithm's advantage over exact UNIVERSAL is in the regime where $n$ is large enough to make $\Theta(t^{n-1})$ infeasible. For small $n$ (e.g., $n=2$), exact computation is cheaper.
- **Benchmark.** Competes with best CRP in hindsight, not best single stock. Performance guarantee is worst-case (adversarial price sequences), not distributional.
- **Transaction costs.** Not addressed. Constant rebalancing generates trading costs that may dominate the sub-polynomial regret. The authors note no efficient implementation is known for the transaction-cost variant (Blum and Kalai, 1999).
- **Price relatives assumed nonneg.** The framework requires nonneg price relatives (no short selling, no zero prices in practice for log-concavity of $P_t$).
- **Dirichlet UNIVERSAL.** This paper handles only uniform ($\mu$) prior on $\Delta$, not the Dirichlet$(1/2,\ldots,1/2)$ variant of Cover and Ordentlich (1996a), which has a tighter performance ratio of $2\sqrt{1/(t+1)^{n-1}}$.
- **Non-financial applications.** The same algorithm applies to any setting where UNIVERSAL is used (e.g., data compression, language modeling) since the computational bottleneck -- integrating a log-concave function over a simplex -- is the same.
- **Practical caveats.** The polynomial constants are large; practical speedups (starting near the $P_t$ mode, variable step sizes, lazy evaluation of $Q_t$) are discussed but lack theoretical guarantees.
