# Universal Portfolios
**Authors:** Thomas M. Cover
**Year:** 1991 (received January 1990, revised July 1990)
**Journal/Venue:** *Mathematical Finance*, Vol. 1, No. 1, 1--29

## Problem statement

Given an arbitrary (nonrandom, adversarial) sequence of stock price relatives $\mathbf{x}_1, \mathbf{x}_2, \ldots, \mathbf{x}_n \in \mathbb{R}^m_+$, construct a sequential, nonanticipating portfolio strategy $\hat{\mathbf{b}}_k$ (depending only on $\mathbf{x}_1, \ldots, \mathbf{x}_{k-1}$) whose wealth $\hat{S}_n = \prod_{k=1}^n \hat{\mathbf{b}}_k' \mathbf{x}_k$ grows at the same exponential rate as $S_n^* = \max_{\mathbf{b} \in B} \prod_{i=1}^n \mathbf{b}'\mathbf{x}_i$, the wealth of the best constant rebalanced portfolio chosen in hindsight. No statistical assumptions on the market sequence are made.

## Approach (short)

Cover constructs the "universal portfolio" by performance-weighting: at each step the portfolio is the wealth-weighted average of all constant rebalanced portfolios over the simplex $B$. This is equivalent to allocating an infinitesimal endowment $d\mathbf{b}/\!\int_B d\mathbf{b}$ to each fixed-mix manager $\mathbf{b}$ and pooling at each period. Via Laplace's method on the resulting integral, Cover shows the ratio $\hat{S}_n / S_n^*$ decays only polynomially in $n$ (not exponentially), so the two strategies share the same asymptotic growth rate for every bounded price sequence.

## Approach (detailed)

### 1. Setup and target

- $\mathbf{x}_i = (x_{i1}, \ldots, x_{im})' \geq 0$: vector of price relatives on day $i$.
- $\mathbf{b} = (b_1, \ldots, b_m)' \in B = \{\mathbf{b} \in \mathbb{R}^m : b_j \geq 0, \sum b_j = 1\}$: constant rebalanced portfolio (daily rebalance to fixed weights).
- Wealth of $\mathbf{b}$ after $n$ periods:
$$S_n(\mathbf{b}) = \prod_{i=1}^n \mathbf{b}'\mathbf{x}_i.$$
- Target:
$$S_n^* = \max_{\mathbf{b} \in B} S_n(\mathbf{b}) = e^{n W^*(F_n)},$$
where $W(\mathbf{b}, F) = \int \ln \mathbf{b}'\mathbf{x}\, dF(\mathbf{x})$, $W^*(F) = \max_{\mathbf{b}} W(\mathbf{b}, F)$, and $F_n$ is the empirical distribution of $\mathbf{x}_1, \ldots, \mathbf{x}_n$.
- $S_n^*$ exceeds the best stock, the geometric mean of all stocks, and the value-line index (Propositions 2.1--2.5).

### 2. The universal portfolio strategy

The algorithm is a performance-weighted average over $B$:
$$\hat{\mathbf{b}}_1 = \left(\tfrac{1}{m}, \ldots, \tfrac{1}{m}\right), \qquad \hat{\mathbf{b}}_{k+1} = \frac{\int_B \mathbf{b}\, S_k(\mathbf{b})\, d\mathbf{b}}{\int_B S_k(\mathbf{b})\, d\mathbf{b}},$$
where $S_k(\mathbf{b}) = \prod_{i=1}^k \mathbf{b}'\mathbf{x}_i$.

**Key identity (Lemma 2.5).** The resulting wealth telescopes:
$$\hat{S}_n = \prod_{k=1}^n \hat{\mathbf{b}}_k' \mathbf{x}_k = \frac{\int_B S_n(\mathbf{b})\, d\mathbf{b}}{\int_B d\mathbf{b}} = E_{\mathbf{b}} S_n(\mathbf{b}),$$
i.e., $\hat{S}_n$ is the average wealth over uniformly drawn $\mathbf{b}$.

This immediately gives $\hat{S}_n \geq \bigl(\prod_{j=1}^m S_n(\mathbf{e}_j)\bigr)^{1/m}$ (dominates the value-line index) by Jensen's inequality, and $\hat{S}_n$ is invariant under permutations of the sequence (Proposition 2.6).

### 3. Why it works -- Laplace's method intuition (Section 3)

Allocate mass $d\mathbf{b}/\!\int_B d\mathbf{b}$ to each manager $\mathbf{b}$, who compounds at exponential rate $W(\mathbf{b}, F_n)$. The pool's wealth is $E_\mathbf{b}\, e^{nW(\mathbf{b}, F_n)}$. Under smoothness at the maximum, Laplace's method gives:
$$\int_B e^{nW(\mathbf{b}, F_n)}\, d\mathbf{b} \sim e^{nW^*} \cdot \frac{(2\pi/n)^{(m-1)/2}}{|J^*|^{1/2}},$$
so $\hat{S}_n / S_n^*$ decays only as $n^{-(m-1)/2}$ times constants -- the exponential rates match.

### 4. Sensitivity matrix

The curvature of $\ln S_n(\mathbf{b})$ at its maximum $\mathbf{b}^* = \mathbf{b}^*(F_n)$ is captured by the $(m-1) \times (m-1)$ sensitivity matrix:
$$J_{ij}(\mathbf{b}) = \int \frac{(x_i - x_m)(x_j - x_m)}{(\mathbf{b}'\mathbf{x})^2}\, dF(\mathbf{x}), \qquad 1 \leq i, j \leq m-1,$$
evaluated at $\mathbf{b}^*$ to give $J^* = J(\mathbf{b}^*(F_n))$.

$J^*$ is nonneg-definite; it is positive definite iff all stocks are *strictly active* (i.e., $b_i^* > 0$ for all $i$ and $\mathbf{b}^*$ uniquely achieves $W^*$). The determinant $|J^*|$ governs the second-order behavior.

### 5. Two-asset case -- exact bounds (Section 5, Theorem 5.1)

For $m = 2$, write $\mathbf{b} = (b, 1-b)$. Define relative range $\tau_n$ and volatility index:
$$\tau_n = 2^{1/3}\!\left(\frac{\max x_{ij}}{\min x_{ij}} - 1\right), \qquad J_n = \frac{1}{n}\sum_{i=1}^n \frac{(x_{i1} - x_{i2})^2}{(b_n^* x_{i1} + (1 - b_n^*) x_{i2})^2}.$$

**Theorem 5.1.** For any bounded sequence $\mathbf{x}_1, \mathbf{x}_2, \ldots \in \mathbb{R}^2_+$, any $0 < \varepsilon < 1$, any $n$, with $a_n = \min\{b_n^*, 1 - b_n^*, 3J_n/\tau_n^3\}$:
$$\frac{\hat{S}_n}{S_n^*} \geq \sqrt{\frac{2\pi}{nJ_n(1+\varepsilon)}} - \frac{2}{\varepsilon(1+\varepsilon)a_n J_n n}\exp\!\left\{-\frac{\varepsilon^2(1+\varepsilon)a_n J_n n}{2}\right\}.$$

This is a finite-sample bound, valid for every sequence.

**Theorem 5.2 (asymptotic).** Under mild conditions ($b_n^*$ bounded away from 0 and 1, $\tau_n$ bounded, $J_n$ bounded below):
$$\liminf_{n \to \infty} \frac{\hat{S}_n / S_n^*}{\sqrt{2\pi / nJ_n}} \geq 1.$$

**Theorem 5.3 (tightness).** Along subsequences where $W_n(\mathbf{b})$ converges to a smooth limit $W(\mathbf{b})$ with interior maximum:
$$\hat{S}_n / S_n^* \sim \sqrt{2\pi / nJ_n}.$$

The proof proceeds by Taylor-expanding $W_n(\mathbf{b})$ around $b_n^*$, substituting $u = \sqrt{n}(b - b_n^*)$, bounding the cubic remainder using $\tau_n$, and approximating the resulting Gaussian integral.

### 6. General $m$-asset case (Section 6, Theorem 6.1)

**Theorem 6.1.** Suppose $\mathbf{x}_i \in [a, c]^m$, $0 < a \leq c < \infty$, and along a subsequence $W_n(\mathbf{b}) \nearrow W(\mathbf{b})$ for $\mathbf{b} \in B$, $J_n^* \to J^*$, $\mathbf{b}_n^* \to \mathbf{b}^*$ in the interior of $B$. Then:
$$\frac{\hat{S}_n}{S_n^*} \sim \left(\sqrt{\frac{2\pi}{n}}\right)^{m-1} \frac{(m-1)!}{|J^*|^{1/2}}.$$

The proof uses the same Laplace method on the $(m-1)$-dimensional simplex: reparametrize $\mathbf{b}$ via $\mathbf{c} = (c_1, \ldots, c_{m-1})$, expand $W_n(\mathbf{c})$ to third order around $\mathbf{c}^*$, substitute $\mathbf{u} = \sqrt{n}(\mathbf{c} - \mathbf{c}^*)$, bound the cubic remainder using the range bound $|X_i - X_m| \leq 2c$ and $S(\tilde{\mathbf{c}})^3 \geq a^3$, then evaluate the Gaussian integral. The $(m-1)!$ factor arises from $\operatorname{Vol}(B) = 1/(m-1)!$.

### 7. Stochastic markets (Section 7)

When $\mathbf{X}_i \overset{\text{i.i.d.}}{\sim} F$, the law of large numbers gives $S_n(\mathbf{b}) = \exp\{n(E\ln \mathbf{b}'\mathbf{X} + o_p(1))\}$. The log-optimal portfolio $\mathbf{b}^*(F)$ achieves maximal growth rate $W^*(F)$, and by Breiman (1961), no other strategy can beat it a.s. asymptotically.

**Theorem 7.1.** If $\mathbf{X}_i \overset{\text{i.i.d.}}{\sim} F$, $\mathbf{b}^*(F)$ unique and in $\operatorname{int}(B)$, then $\frac{1}{n}\ln \hat{S}_n \to W^*(F)$ a.s. The universal portfolio essentially learns $F$ without knowing it.

### 8. Generalized universal portfolio (Section 9)

If $\mathbf{b}^*$ lies on a $k$-face of the simplex (only $k < m$ stocks active), replace the uniform measure on $B$ with:
$$\mu = \frac{1}{2^m - 1} \sum_{S \neq \varnothing} \mu_S,$$
where $\mu_S$ is uniform on the face $B(S) = \{\mathbf{b}: b_i = 0 \text{ for } i \notin S, \sum b_i = 1\}$. Then:
$$\frac{\hat{S}_n}{S_n^*} \sim \frac{(k-1)!}{2^m - 1} \left(\frac{2\pi}{n}\right)^{(k-1)/2} |J_n^{(k)}(F_n)|^{1/2},$$
where $J_n^{(k)}$ is the $k \times k$ sensitivity restricted to the active stocks.

## Domain of applicability

**Where it works well:**
- The result is worst-case (minimax-flavored): no distributional assumptions on $\{\mathbf{x}_i\}$.
- The benchmark $S_n^*$ is strong -- it beats the best stock, the value-line index, and any convex combination of buy-and-hold strategies.
- The finite-sample bounds (Theorem 5.1) are nonasymptotic and constructive.
- Volatile, mean-reverting pairs with interior $\mathbf{b}^*$ yield large gains from rebalancing, making $S_n^* \gg \max_j S_n(\mathbf{e}_j)$. The examples (Iroquois/Kin Ark, Commercial Metals/Kin Ark) confirm this.

**Where it breaks or is limited:**
- **Polynomial cost in $m$.** Each additional asset costs a factor of $1/\sqrt{n}$ in the ratio $\hat{S}_n/S_n^*$. For large $m$, the wealth penalty is $O(n^{-(m-1)/2})$ -- catastrophic for realistic stock universes. Cover acknowledges this implicitly in Section 9 by reducing to the active set.
- **Transaction costs are ignored.** The strategy rebalances every period. Daily rebalancing of a many-stock portfolio generates turnover that can dominate the rebalancing premium. Cover's Section 10 suggests trading only when holdings diverge sufficiently, but provides no formal bound incorporating costs.
- **The benchmark $S_n^*$ is itself suboptimal.** It is restricted to constant-mix strategies. Any time-varying strategy that adapts to regime changes or momentum is outside the comparison class. The universal portfolio cannot beat a trending market that rewards buy-and-hold in a single stock, except through the rebalancing effect.
- **The sensitivity $J^*$ must be bounded away from zero.** If the optimal CRP is at a vertex ($\mathbf{b}^* = \mathbf{e}_j$), the Laplace approximation degenerates and the bounds do not apply without the generalized construction of Section 9.
- **Computational cost.** The exact integral $\int_B S_n(\mathbf{b})\,d\mathbf{b}$ over the $(m-1)$-simplex becomes intractable for $m$ beyond small values. Cover uses a 21-point grid for $m = 2$. For general $m$, Monte Carlo or sequential approximations are needed.
- **i.i.d. stochastic result (Theorem 7.1) requires interior optimum.** If $\mathbf{b}^*(F)$ is on the boundary, the stated convergence may fail without the Section 9 generalization.

**What is genuinely novel:**
- The idea of competing with the best CRP *without any statistical model* -- a departure from both the Markowitz/Sharpe tradition (which assumes known or estimated distributions) and the Kelly/Breiman tradition (which assumes i.i.d. or ergodic markets). The intellectual lineage is closer to Robbins (1951) compound decision theory and Blackwell's approachability.
- The explicit finite-sample lower bound on $\hat{S}_n/S_n^*$ via Laplace approximation with controlled remainder.
- The recognition that the performance-weighted average (a Bayesian mixture with uniform prior on $B$) yields exact telescoping of the wealth product.
