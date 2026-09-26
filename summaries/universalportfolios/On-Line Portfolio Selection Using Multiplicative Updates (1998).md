# On-Line Portfolio Selection Using Multiplicative Updates

**Authors:** David P. Helmbold, Robert E. Schapire, Yoram Singer, Manfred K. Warmuth
**Year:** 1998
**Journal/Venue:** Mathematical Finance, Vol. 8, No. 4, pp. 325--347

## Problem statement

Design an on-line portfolio selection algorithm that (i) achieves asymptotically the same growth rate as the best constant-rebalanced portfolio (BCRP) chosen in hindsight, i.e. is *universal* in the sense of Cover (1991), while (ii) requiring only $O(N)$ time and storage per trading period ($N$ = number of stocks), versus the $O(N^c)$ or exponential cost of Cover's algorithm and the Cover--Ordentlich (1996) generalization. No statistical assumptions on price relatives are made.

## Approach (short)

Adapt the Kivinen--Warmuth (1997) multiplicative-update framework for on-line linear regression to the portfolio setting. At each period, update the portfolio weight vector by an exponentiated-gradient (EG) step that approximately maximizes log-wealth penalized by relative entropy to the current weights. Prove universality via a potential-function argument, and handle unknown horizon and unknown volatility ratio with a "doubling trick" staging scheme.

## Approach (detailed)

### Setup and notation

1. $N$ stocks, price-relative vector $\mathbf{x}^t = (x_1^t, \ldots, x_N^t)$ on day $t$ (ratio of next-day opening to current opening). Portfolio $\mathbf{w} \in \Delta^{N-1}$ (simplex). Daily wealth factor $\mathbf{w} \cdot \mathbf{x}^t$. Cumulative wealth of an on-line sequence $\{w^t\}$:

$$S_T(\{\mathbf{w}^t\}, \{\mathbf{x}^t\}) = \prod_{t=1}^T \mathbf{w}^t \cdot \mathbf{x}^t.$$

2. Best constant-rebalanced portfolio: $\mathbf{w}^\star = \arg\max_{\mathbf{w}} \sum_{t=1}^T \log(\mathbf{w} \cdot \mathbf{x}^t)$. Benchmark is $\text{LS}_T^\star = \frac{1}{T}\sum_t \log(\mathbf{w}^\star \cdot \mathbf{x}^t)$.

3. Universality definition: an algorithm producing $\{\mathbf{w}^t\}$ is universal if $\lim_{T\to\infty} \max_{\{\mathbf{x}^t\}} [\text{LS}^\star - \text{LS}_T] \le 0$.

### The EG($\eta$) update

4. Objective per step -- find $\mathbf{w}^{t+1}$ approximately maximizing:

$$F(\mathbf{w}^{t+1}) = \eta \log(\mathbf{w}^{t+1} \cdot \mathbf{x}^t) - D_{\text{RE}}(\mathbf{w}^{t+1} \| \mathbf{w}^t),$$

where $D_{\text{RE}}(\mathbf{u}\|\mathbf{v}) = \sum_i u_i \log(u_i/v_i)$ is the relative entropy (KL divergence) and $\eta > 0$ is the learning rate. The first term rewards wealth growth if the current price-relative were repeated; the second penalizes deviation from $\mathbf{w}^t$.

5. Exact maximization of $F$ requires solving a nonlinear system each period. Instead, linearize the log-wealth term around $\mathbf{w}^{t+1} = \mathbf{w}^t$ (first-order Taylor), add a Lagrange multiplier for the simplex constraint, and set partial derivatives to zero. This yields the **EG($\eta$) update** (approximate, closed-form):

$$w_i^{t+1} = \frac{w_i^t \exp\!\bigl(\eta\, x_i^t / (\mathbf{w}^t \cdot \mathbf{x}^t)\bigr)}{\sum_{j=1}^N w_j^t \exp\!\bigl(\eta\, x_j^t / (\mathbf{w}^t \cdot \mathbf{x}^t)\bigr)}.$$

Initialize $\mathbf{w}^1 = (1/N, \ldots, 1/N)$. Cost: $O(N)$ per period.

### Main regret bound (Theorem 4.1)

6. **Regularity condition:** $x_i^t \ge r > 0$ for all $i, t$, and $\max_i x_i^t = 1$ for all $t$ (WLOG after rescaling; $r$ is a lower bound on the ratio of worst to best daily price relative).

7. For any comparator portfolio $\mathbf{u} \in \Delta^{N-1}$:

$$\sum_{t=1}^T \log(\mathbf{w}^t \cdot \mathbf{x}^t) \;\ge\; \sum_{t=1}^T \log(\mathbf{u} \cdot \mathbf{x}^t) - \frac{D_{\text{RE}}(\mathbf{u}\|\mathbf{w}^1)}{\eta} - \frac{\eta T}{8r^2}.$$

With uniform initialization and $\eta = 2r\sqrt{2\log N / T}$:

$$\sum_{t=1}^T \log(\mathbf{w}^t \cdot \mathbf{x}^t) \;\ge\; \sum_{t=1}^T \log(\mathbf{u} \cdot \mathbf{x}^t) - \frac{\sqrt{2T\log N}}{2r}.$$

Regret is $O(\sqrt{T \log N}/r)$, so normalized regret $\to 0$ at rate $O(\sqrt{\log N / T}/r)$.

### Proof sketch (Theorem 4.1)

8. Define the potential drop $\Delta_t = D_{\text{RE}}(\mathbf{u}\|\mathbf{w}^{t+1}) - D_{\text{RE}}(\mathbf{u}\|\mathbf{w}^t)$. Substituting the EG update:

$$\Delta_t = -\eta \frac{\mathbf{u} \cdot \mathbf{x}^t}{\mathbf{w}^t \cdot \mathbf{x}^t} + \log Z_t.$$

9. Bound $\log Z_t$ using the inequality $\log(1 - \alpha(1 - e^x)) \le \alpha x + x^2/8$ (valid for $\alpha \in [0,1]$, all $x \in \mathbb{R}$) and the fact that $x_i^t \in [0,1]$ implies $\beta^x \le 1 - (1-\beta)x$ for $\beta > 0$. This gives $\log Z_t \le \eta + \eta^2/(8(\mathbf{w}^t \cdot \mathbf{x}^t)^2)$.

10. Combine with $1 - e^x \le -x$ to get $\Delta_t \le -\eta \log(\mathbf{u}\cdot\mathbf{x}^t / \mathbf{w}^t\cdot\mathbf{x}^t) + \eta^2/(8r^2)$. Telescope over $t=1,\ldots,T$ and use $D_{\text{RE}}(\mathbf{u}\|\mathbf{w}^{T+1}) \ge 0$.

### Removing dependence on $r$ and $T$: the $\widetilde{\text{EG}}(\alpha, \eta)$ variant

11. When no lower bound $r$ on price relatives is available, mix the price relatives with a uniform component:

$$\tilde{x}_i^t = (1 - \alpha/N)\,x_i^t + \alpha/N, \qquad \hat{\mathbf{w}}^t = (1-\alpha)\mathbf{w}^t + (\alpha/N)\mathbf{1}.$$

Update using $\tilde{\mathbf{x}}^t$; invest using $\hat{\mathbf{w}}^t$. Now the effective lower bound is $\alpha/N$.

12. **Theorem 4.2.** For $\alpha \in (0, 1/2]$, $\eta > 0$:

$$\sum_{t=1}^T \log(\hat{\mathbf{w}}^t \cdot \mathbf{x}^t) \;\ge\; \sum_{t=1}^T \log(\mathbf{u}\cdot\mathbf{x}^t) - 2\alpha T - \frac{D_{\text{RE}}(\mathbf{u}\|\mathbf{w}^1)}{\eta} - \frac{\eta T}{8(\alpha/N)^2}.$$

Optimizing $\alpha = (N^2 \log N/(8T))^{1/4}$, $\eta = \sqrt{8\alpha^2 \log N/(N^2 T)}$, gives regret $O((N^2 \log N)^{1/4} \cdot T^{3/4})$.

13. **Doubling trick (Corollary 4.3).** Run in stages of geometrically increasing length ($2^i N^2 \log N$ days in stage $i$). At each stage start, reinitialize to uniform weights and reset $\alpha, \eta$ as in Theorem 4.2 using the stage length for $T$. This staged $\widetilde{\text{EG}}$ is a universal portfolio algorithm (no foreknowledge of $T$ required). Normalized regret:

$$\text{LS}^\star - \text{LS}_T \;\le\; \frac{6N^2 \log N \bigl(1 + (T/(2N^2 \log N))^{3/4}\bigr)}{T} \;\to\; 0.$$

### Convergence rate comparison

14. Cover--Ordentlich (1996): regret $O(N \log T / T)$ -- better dependence on $T$ but exponential computation in $N$. EG($\eta$) with known $r$: regret $O(\sqrt{\log N / T} / r)$ -- better dependence on $N$ (logarithmic vs. linear). $\widetilde{\text{EG}}$: regret $O((N^2 \log N / T)^{1/4})$ -- worse in $T$ but still universal, and $O(N)$ computation.

### Side information

15. Following Cover--Ordentlich (1996), side information $y^t \in \{1, \ldots, K\}$ is handled by maintaining $K$ independent EG instances, one per side-information state. Each instance updates only on days with matching $y^t$. The constant-rebalanced comparator becomes $\mathbf{w}^\star(\cdot): \{1,\ldots,K\} \to \Delta^{N-1}$. Universality extends by additivity of log-wealth across the partition.

### Experiments (NYSE, 22-year period)

16. 36 stocks, subsets of size 2--24. EG($\eta$) with $\eta = 0.05$ consistently achieves wealth close to BCRP (typically 95--99% of BCRP wealth), and *exceeds* Cover's universal portfolio in all tested cases, despite the latter's superior worst-case bound. The Exact EG($\eta$) (solving the full nonlinear system) gives nearly identical wealth at much higher cost. Learning rates $\eta \in [0.01, 0.15]$ all perform well; performance degrades for $\eta > 0.20$.

17. Computation: EG($\eta$) runs in seconds for $N = 24$; Cover's universal portfolio (grid approximation) takes hours for $N = 9$ and is infeasible beyond.

## Domain of applicability

- **Strongest regime:** Moderate number of assets with bounded cross-sectional volatility ratio ($r$ not too small), so EG($\eta$) applies with $O(\sqrt{\log N / T})$ regret. This is the practical case for equity portfolios with daily rebalancing.
- **Scales gracefully in $N$:** $O(N)$ per period vs. exponential for Cover's algorithm. Advantage grows with portfolio size.
- **No distributional assumptions** on price relatives -- worst-case, individual-sequence guarantee.
- **Ignores transaction costs.** The BCRP comparator itself requires full daily rebalancing; in practice, costs erode the BCRP advantage and the algorithm's tracking of it. The paper notes this as the main open limitation.
- **Stationarity assumption implicit in the comparator class:** competing against a single BCRP assumes the best fixed-mix does not change. Non-stationary markets (regime shifts) weaken the relevance of the BCRP benchmark. Singer (1998) extends to switching portfolios.
- **Side information** extension is straightforward but partitions data, reducing effective sample size per state. Different learning rates per partition may be needed.
- **Learning rate $\eta$** is a free parameter in practice. The theoretically optimal $\eta$ depends on $r$ and $T$; in experiments, $\eta \approx 0.05$ works robustly across stock pairs.
