# Universal Portfolios
**Authors:** Thomas M. Cover
**Year:** 1996 (working paper dated October 23, 1996; published in *Mathematical Finance*, 1(1), 1991)
**Journal/Venue:** Mathematical Finance

## Problem statement

Given an arbitrary (deterministic, adversarial) sequence of price-relative vectors $\mathbf{x}_1, \mathbf{x}_2, \ldots, \mathbf{x}_n \in \mathbb{R}^m_+$, construct a sequential (nonanticipating) portfolio strategy $\hat{\mathbf{b}}_k$ whose compound wealth

$$\hat{S}_n = \prod_{k=1}^n \hat{\mathbf{b}}_k^t \mathbf{x}_k$$

matches, to first order in the exponent, the wealth of the best constant rebalanced portfolio chosen with full hindsight:

$$S_n^* = \max_{\mathbf{b} \in B} \prod_{i=1}^n \mathbf{b}^t \mathbf{x}_i, \qquad B = \left\{\mathbf{b} \in \mathbb{R}^m : b_i \ge 0,\; \sum_i b_i = 1\right\}.$$

The benchmark $S_n^*$ dominates every buy-and-hold strategy, the value-line index (geometric mean of stock wealths), and the DJIA-style arithmetic mean, often by an exponential factor. The question is whether a causal strategy can track this clairvoyant benchmark without any statistical model of returns.

## Approach (short)

The universal portfolio at each period is a performance-weighted average over all constant rebalanced portfolios: allocate capital uniformly across the simplex $B$, let each "virtual manager" $\mathbf{b}$ compound independently, and at time $k$ form $\hat{\mathbf{b}}_k$ as the wealth-weighted mean of $\mathbf{b}$ over $B$. The resulting compound wealth $\hat{S}_n$ telescopes into $\int_B S_n(\mathbf{b})\,d\mathbf{b} / \int_B d\mathbf{b}$, i.e., the average of the hindsight wealth function. Laplace's method then shows the integral concentrates near the maximizer $\mathbf{b}^*$, yielding $\hat{S}_n / S_n^* \sim (2\pi/n)^{(m-1)/2} (m-1)! / |J_n^*|^{1/2}$, so the ratio is only polynomially small -- the exponential growth rates coincide.

## Approach (detailed)

### 1. Setup and notation

- $\mathbf{x}_i = (x_{i1}, \ldots, x_{im})^t$: vector of price relatives (closing/opening) on day $i$.
- Portfolio $\mathbf{b} \in B$ (the simplex). Wealth factor from portfolio $\mathbf{b}$ over $n$ periods: $S_n(\mathbf{b}) = \prod_{i=1}^n \mathbf{b}^t \mathbf{x}_i$.
- Target: $S_n^* = \max_{\mathbf{b} \in B} S_n(\mathbf{b}) = e^{n W^*(F_n)}$, where $W(\mathbf{b}, F) = \int \ln \mathbf{b}^t \mathbf{x}\, dF(\mathbf{x})$ and $F_n$ is the empirical distribution of $\mathbf{x}_1, \ldots, \mathbf{x}_n$.

### 2. The universal portfolio algorithm

$$\hat{\mathbf{b}}_1 = \left(\tfrac{1}{m}, \ldots, \tfrac{1}{m}\right), \qquad \hat{\mathbf{b}}_{k+1} = \frac{\int_B \mathbf{b}\, S_k(\mathbf{b})\, d\mathbf{b}}{\int_B S_k(\mathbf{b})\, d\mathbf{b}}.$$

At each step, $\hat{\mathbf{b}}_{k+1}$ is the posterior mean of $\mathbf{b}$ under a uniform prior on $B$, updated by the likelihood $S_k(\mathbf{b})$. This is formally a Bayesian predictive strategy with respect to log-wealth, but no probabilistic model on $\mathbf{x}$ is assumed.

### 3. Key identity (Lemma 1)

The telescoping property yields:

$$\hat{S}_n = \prod_{k=1}^n \hat{\mathbf{b}}_k^t \mathbf{x}_k = \frac{\int_B S_n(\mathbf{b})\, d\mathbf{b}}{\int_B d\mathbf{b}}.$$

**Proof:** $\hat{\mathbf{b}}_k^t \mathbf{x}_k = \int_B \mathbf{b}^t \mathbf{x}_k S_{k-1}(\mathbf{b})\,d\mathbf{b} / \int_B S_{k-1}(\mathbf{b})\,d\mathbf{b} = \int_B S_k(\mathbf{b})\,d\mathbf{b} / \int_B S_{k-1}(\mathbf{b})\,d\mathbf{b}$. The product telescopes.

This identity is the linchpin: $\hat{S}_n$ equals the simplex-average of the hindsight wealth function, reducing the sequential problem to a static integral.

### 4. Elementary dominance properties

- **Exceeds best stock:** $S_n^* \ge \max_j S_n(\mathbf{e}_j)$ (simplex max $\ge$ vertex max).
- **Exceeds value line:** $\hat{S}_n \ge \left(\prod_{j=1}^m S_n(\mathbf{e}_j)\right)^{1/m}$ (two applications of Jensen's inequality).
- **Exceeds DJIA:** $S_n^* \ge \sum_j \alpha_j S_n(\mathbf{e}_j)$ for any convex combination $\alpha$.
- **Permutation invariance:** Both $S_n^*$ and $\hat{S}_n$ are invariant to the ordering of $\mathbf{x}_1, \ldots, \mathbf{x}_n$.

### 5. Sensitivity matrix and curvature

The sensitivity matrix $J(\mathbf{b})$ of the market w.r.t. distribution $F$ is the $(m-1) \times (m-1)$ matrix

$$J_{ij}(\mathbf{b}) = \int \frac{(x_i - x_m)(x_j - x_m)}{(\mathbf{b}^t \mathbf{x})^2}\, dF(\mathbf{x}), \quad 1 \le i, j \le m-1.$$

Equivalently, $J^* = -\nabla^2 W(\mathbf{b}^*, F_n)$ (the negative Hessian of log-growth at the optimum). It is p.s.d. in general and p.d. when all stocks are strictly active. $J_n = |J_n^*|$ (the determinant) governs the second-order behavior of $\hat{S}_n / S_n^*$; it acts as a volatility index measuring the curvature of the log-growth function at its peak.

### 6. Main results for $m = 2$ assets

**Theorem 1 (finite-sample lower bound).** For any $\mathbf{x}_1, \mathbf{x}_2, \ldots \in \mathbb{R}^2_+$, any $0 < \epsilon < 1$, and any $n$:

$$\frac{\hat{S}_n}{S_n^*} \ge \sqrt{\frac{2\pi}{n J_n (1+\epsilon)}} - \frac{2}{\epsilon(1+\epsilon) a_n J_n n}\, e^{-\epsilon^2 (1+\epsilon) a_n J_n n / 2},$$

where $a_n = \min\{b_n^*, 1 - b_n^*, 3J_n / \tau_n^3\}$ and $\tau_n = 2^{1/3}(\max\{x_{ij}\}/\min\{x_{ij}\} - 1)$ is the relative range.

**Proof sketch.** Write $\hat{S}_n = \int_0^1 e^{n W_n(b)}\,db$. Expand $W_n(b)$ to third order about the maximizer $b_n^*$: the first-order term vanishes by optimality, the second-order term gives $-\frac{1}{2}J_n(b - b_n^*)^2$, and the third derivative is bounded by $\tau_n^3$. Substitute $u = \sqrt{n}(b - b_n^*)$ and compare the integral to the Gaussian $\int e^{-\frac{1}{2}J_n(1+\epsilon)u^2}\,du$, controlling the cubic remainder via the condition $|u| \le 3\sqrt{n}J_n/\tau_n^3$. Standard normal tail bounds yield the explicit lower bound.

**Theorem 2 (asymptotic lower bound).** Under mild regularity ($\delta \le b_n^* \le 1 - \delta$, $\tau_n \le \tau < \infty$, $J_n \ge J > 0$ along a subsequence):

$$\liminf_{n \to \infty} \frac{\hat{S}_n / S_n^*}{\sqrt{2\pi / n J_n}} \ge 1.$$

**Theorem 3 (tightness).** If $W_n(b) \to W(b)$ satisfying strict concavity, bounded third derivative, and interior maximizer, then along the convergent subsequence:

$$\frac{\hat{S}_n}{S_n^*} \sim \sqrt{\frac{2\pi}{n J_n}}.$$

This is exact: the upper bound follows from Laplace's method applied to $\int_0^1 e^{nW(b)}\,db$.

### 7. Main result for $m$ assets (Theorem 4)

Under: (i) all stocks strictly active, (ii) full rank ($\mathbf{x}_1, \ldots, \mathbf{x}_n$ span $\mathbb{R}^m$), (iii) $\mathbf{b}_n^*(F_n) \to \mathbf{b}^* \in \mathrm{int}(B)$, (iv) $W_n(\mathbf{b}) \nearrow W(\mathbf{b})$ strictly concave with bounded third partials and $J_n^* \to J^*$:

$$\frac{\hat{S}_n}{S_n^*} \sim \left(\sqrt{\frac{2\pi}{n}}\right)^{m-1} \frac{(m-1)!}{|J^*|^{1/2}}.$$

**Proof outline.** Parametrize $B$ by the first $m-1$ weights via $C = \{(c_1, \ldots, c_{m-1}) : c_i \ge 0, \sum c_i \le 1\}$ with $\mathrm{Vol}(C) = 1/(m-1)!$. Write $\hat{S}_n = (m-1)! \int_C S_n(\mathbf{c})\,d\mathbf{c}$. Expand $S_n(\mathbf{c}) = e^{nW_n(\mathbf{c})}$ about $\mathbf{c}^*$: the gradient vanishes, the Hessian is $-J_n^*$, and the cubic term is bounded by $(8b^3/a^3)(\sum|u_i|)^3$ after the substitution $\mathbf{u} = \sqrt{n}(\mathbf{c} - \mathbf{c}^*)$. The resulting $(m-1)$-dimensional Gaussian integral gives the $(2\pi/n)^{(m-1)/2} / |J_n^*|^{1/2}$ factor. The upper bound again follows by Laplace.

**Corollary (first-order universality).** $\frac{1}{n}\ln \hat{S}_n - \frac{1}{n}\ln S_n^* \to 0$ for every bounded sequence, since the ratio is $O(n^{-(m-1)/2})$, which is polynomial.

### 8. Stochastic markets (Section 7)

When $\mathbf{X}_i \stackrel{\text{i.i.d.}}{\sim} F$, the SLLN gives $S_n(\mathbf{b}) = e^{n(W(\mathbf{b}, F) + o_P(1))}$, and Breiman (1961) shows $\overline{\lim}\, \frac{1}{n}\ln S_n \le W^*(F)$ a.s. for any sequential strategy. Hence $\mathbf{b}^*(F)$ is asymptotically optimal. Theorem 5: if $\mathbf{b}^*(F)$ is unique and interior, then $\frac{1}{n}\ln \hat{S}_n \to W^*(F)$ a.s. The universal portfolio learns the unknown $F$ without modeling it.

### 9. Generalization to inactive stocks (Section 9)

When $\mathbf{b}_n^*$ lies on a $k$-face of the simplex (only $k < m$ stocks active), replace the uniform prior on $B$ with a mixture $\mu = \frac{1}{2^m - 1}\sum_{S \ne \varnothing} \mu_S$ placing uniform mass on every face $B(S)$. The resulting asymptotics become:

$$\frac{\hat{S}_n}{S_n^*} \sim \frac{(k-1)!}{2^m - 1} \left(\frac{2\pi}{n}\right)^{(k-1)/2} \frac{1}{|J_n^{(k)}(F_n)|^{1/2}},$$

where $J_n^{(k)}$ is the $k \times k$ sensitivity matrix restricted to active stocks.

### 10. Numerical examples (Section 8)

For two volatile NYSE stocks (Iroquois Brands, Kin Ark, 22 years daily data ending 1985): individual stock growth factors 8.9 and 4.1, but $S_n^* = 73.6$ and $\hat{S}_n = 38.7$. The universal portfolio captures the rebalancing premium without knowing $\mathbf{b}^* = (0.55, 0.45)$ in advance. For low-volatility pairs (IBM, Coca-Cola), $\hat{S}_n$ barely exceeds individual stocks, consistent with small $J_n$. A four-stock margin example yields $\hat{S}_n = 98.4$ vs $S_n^* = 262.4$.

## Domain of applicability

**Where it works:**
- Any bounded, adversarial price-relative sequence. No distributional assumptions needed for the finite-sample bound (Theorem 1) or the first-order exponent result.
- Strongest gains when the best CRP has multiple strictly active stocks and the curvature $J_n$ is bounded away from zero -- i.e., volatile, mean-reverting (in the cross-section) pairs.

**Where it breaks or is limited:**
- **Transaction costs are ignored.** The portfolio $\hat{\mathbf{b}}_k$ changes every period. In practice, constant rebalancing itself incurs turnover proportional to volatility. Cover acknowledges this but offers no formal treatment. For realistic spreads, the rebalancing premium can easily be consumed by costs.
- **The benchmark $S_n^*$ itself may not be impressive.** If stocks move in lockstep (high correlation, low $J_n$), the best CRP barely beats buy-and-hold, and the universal portfolio provides no edge.
- **Polynomial wealth loss.** The ratio $\hat{S}_n / S_n^*$ decays as $n^{-(m-1)/2}$. For large $m$ (many assets), this polynomial penalty is severe in finite samples -- the strategy needs exponentially long horizons to overcome the curse of dimensionality on the simplex.
- **CRP is a weak benchmark relative to adaptive strategies.** The best CRP is fixed over the entire sample. It does not capture regime changes, momentum, or time-varying opportunities. Strategies that adapt to structural breaks can dominate $S_n^*$ on realistic data.
- **Computational cost.** The integral over $B$ is $(m-1)$-dimensional. For $m > 4$, brute-force discretization is infeasible; Monte Carlo or more structured approximations are needed.
- **No short sales or leverage** in the base formulation (the simplex constraint). The margin extension in Section 8 is ad hoc.
- **Regularity conditions for the sharp asymptotic (Theorem 4)** require: all stocks strictly active, full rank, interior convergence of $\mathbf{b}_n^*$, and convergence of $W_n$ to a strictly concave limit with bounded third derivatives. These can fail for degenerate markets.

**What is genuinely novel:** The core contribution is the identification that a performance-weighted Bayesian mixture over constant rebalanced portfolios -- a construction from information theory (compound sequential Bayes, Robbins 1951) -- yields a sequential strategy whose wealth is the simplex average of the hindsight wealth function (Lemma 1). This telescoping identity, combined with Laplace's method, gives sharp finite-sample and asymptotic bounds in a completely model-free (individual-sequence) setting. The idea of competing with the best fixed action in hindsight (here the best CRP) later became central to online learning and regret theory (Cesa-Bianchi and Lugosi). Cover's paper is the foundational reference for the "universal prediction" paradigm in portfolio selection.
