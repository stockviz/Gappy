# The Cost of Achieving the Best Portfolio in Hindsight

**Authors:** Erik Ordentlich, Thomas M. Cover  
**Year:** 1998 (manuscript dated November 1997)  
**Journal/Venue:** Working paper / Stanford University (portions presented at CIFER 96, COLT 96, IMS 96)

## Problem statement

Consider a market with $m$ assets over $n$ trading periods. A non-anticipating investment strategy selects portfolio $\mathbf{b}_i \in \mathcal{B}$ on day $i$ using only past price-relatives $\mathbf{x}^{i-1}$. The benchmark is the best constant rebalanced portfolio (CRP) in hindsight:

$$S_n^*(\mathbf{x}^n) = \max_{\mathbf{b} \in \mathcal{B}} \prod_{i=1}^n \mathbf{b}^t \mathbf{x}_i,$$

where $\mathcal{B} = \{\mathbf{b} \in \mathbb{R}_+^m : \sum b_j = 1\}$.

The question: what is the largest worst-case ratio $\hat{S}_n(\mathbf{x}^n) / S_n^*(\mathbf{x}^n)$ achievable by any non-anticipating strategy, uniformly over all price-relative sequences $\mathbf{x}^n$? This is a minimax problem with no distributional assumptions on prices.

A secondary question: what is the no-arbitrage price of a derivative security -- the "hindsight allocation option" -- that pays $S_n^*(\mathbf{x}^n)$ at maturity?

## Approach (short)

The problem is cast as a two-player zero-sum game between investor and adversarial nature. The authors solve the max-min problem exactly: the optimal ratio $V_n$ is expressed in closed form via Shannon entropy, decays only polynomially in $n$ (like $n^{-(m-1)/2}$), and is achieved by a specific non-anticipating strategy related to Dirichlet-weighted universal portfolios. The result connects to universal data compression (pointwise redundancy). Separate pricing of the hindsight allocation option in binomial-lattice and geometric Brownian motion models confirms the $O(\sqrt{n})$ cost behavior.

## Approach (detailed)

### 1. Setup and notation

Price-relatives $\mathbf{x}_1, \ldots, \mathbf{x}_n \in \mathbb{R}_+^m$, where $x_{ij}$ is the return factor of asset $j$ on day $i$. A CRP $\mathbf{b}$ achieves wealth $S_n(\mathbf{x}^n, \mathbf{b}) = \prod_{i=1}^n \mathbf{b}^t \mathbf{x}_i$. The investor's wealth under a non-anticipating strategy $\hat{\mathbf{b}}$ is $\hat{S}_n(\mathbf{x}^n) = \prod_{i=1}^n \hat{\mathbf{b}}_i^t(\mathbf{x}^{i-1}) \mathbf{x}_i$.

### 2. Main result (Theorem 1 -- Max-min ratio, exact)

For $m$ assets and all $n$:

$$\max_{\hat{\mathbf{b}}} \min_{\mathbf{x}^n} \frac{\hat{S}_n(\mathbf{x}^n)}{S_n^*(\mathbf{x}^n)} = V_n,$$

where

$$V_n = \left[\sum_{n_1 + \cdots + n_m = n} \binom{n}{n_1, \ldots, n_m} 2^{-n H(n_1/n, \ldots, n_m/n)}\right]^{-1},$$

and $H(p_1, \ldots, p_m) = -\sum p_j \log p_j$ is Shannon entropy (log base 2).

**Special case $m = 2$:**

$$V_n = \left(\sum_{k=0}^n \binom{n}{k} \left(\frac{k}{n}\right)^k \left(\frac{n-k}{n}\right)^{n-k}\right)^{-1}.$$

### 3. Asymptotics of $V_n$ (Lemma 3, exact asymptotic)

$$V_n \sim \frac{\Gamma(m/2)}{\sqrt{\pi}} \left(\frac{2}{n}\right)^{(m-1)/2},$$

in the sense that the ratio converges to 1. For $m = 2$: $V_n \sim \sqrt{2/(\pi n)}$. Bounds: $1/(2\sqrt{n+1}) \le V_n \le 2/\sqrt{n+1}$ for $m = 2$.

The wealth ratio penalty is polynomial, so the exponential growth rate of $\hat{S}_n$ matches $S_n^*$:

$$\liminf_{n \to \infty} \frac{1}{n} \log \frac{\hat{S}_n}{S_n^*} \ge 0,$$

uniformly over all sequences. The worst-case growth-rate loss is only $((m-1)/2)(\log n)/n$.

### 4. Optimal strategy construction (for $m = 2$, exact)

Define a probability measure $w(j^n)$ on binary sequences $j^n \in \{1,2\}^n$:

$$w(j^n) = V_n \left(\frac{n_1(j^n)}{n}\right)^{n_1(j^n)} \left(\frac{n_2(j^n)}{n}\right)^{n_2(j^n)},$$

where $n_r(j^n) = \sum_{i=1}^n I(j_i = r)$. The optimal portfolio at time $l$ allocates to asset 1:

$$\hat{b}_{l1}(\mathbf{x}^{l-1}) = \frac{\sum_{j^{l-1}} w(j^{l-1}, 1) \prod_{i=1}^{l-1} x_{ij_i}}{\sum_{j^{l-1}} w(j^{l-1}) \prod_{i=1}^{l-1} x_{ij_i}},$$

with $\hat{b}_{11} = w(1)$, $\hat{b}_{12} = w(2)$. Generalizes to $m > 2$ straightforwardly. This strategy depends on the horizon $n$.

**Alternative (extremal strategy) interpretation:** Partition initial wealth into $2^n$ piles, one per binary sequence $j^n$, with pile $j^n$ receiving fraction $w(j^n)$. Pile $j^n$ invests entirely in asset $j_i$ on day $i$. The aggregate wealth telescopes to $\hat{S}_n(\mathbf{x}^n) = V_n \sum_k (k/n)^k ((n-k)/n)^{n-k} X(k)$, where $X(k)$ collects the product of price-relatives for all sequences with exactly $k$ ones.

### 5. Proof sketch of Theorem 1

**Lower bound ($\ge V_n$):** The explicit strategy achieves, for any $\mathbf{x}^n$:

$$\frac{\hat{S}_n(\mathbf{x}^n)}{S_n^*(\mathbf{x}^n)} \ge V_n \min_{0 \le k \le n} \frac{(k/n)^k ((n-k)/n)^{n-k}}{b^{*k}(1-b^*)^{n-k}} \ge V_n,$$

using Lemma 1 (weighted-average $\ge$ minimum-ratio) and the identity $(k/n)^k ((n-k)/n)^{n-k} = \max_{b} b^k(1-b)^{n-k}$.

**Upper bound ($\le V_n$):** Construct extremal price sequences $\mathbf{x}^n(j^n)$ with $\mathbf{x}_i(j_i) = (1,0)^t$ or $(0,1)^t$. On this family, any non-anticipating strategy satisfies $\sum_{\mathbf{x}^n \in \mathcal{K}} \hat{S}_n(\mathbf{x}^n) = 1$ (a budget identity). Since $\sum_{\mathbf{x}^n \in \mathcal{K}} S_n^*(\mathbf{x}^n) = 1/V_n$, the minimum ratio over $\mathcal{K}$ is $\le V_n$ by an averaging argument.

### 6. Game-theoretic formulation (Theorem 2, exact)

Allowing mixed strategies for both players, the game value equals $V_n$ and the investor's optimal strategy is pure (the strategy above). Nature's optimal mixed strategy randomizes over the extremal 0-1 sequences $\mathcal{K}$ according to $w(j^n)$. Extends to concave payoff transformations $\phi$: game value becomes $\phi(V_n)$ (Theorem 3).

### 7. Connection to information theory

$-\log V_n$ equals the solution to the min-max pointwise redundancy problem in universal data compression (Shtarkov 1987). Worst-case portfolio performance is bounded by worst-case data compression redundancy.

### 8. Dirichlet-weighted universal portfolio (infinite-horizon, approximate)

The Dirichlet$(1/2, \ldots, 1/2)$-weighted universal portfolio $\hat{\mathbf{b}}^D$ of Cover (1991) is an infinite-horizon strategy achieving:

$$\min_{\mathbf{x}^n} \frac{\hat{S}_n^D(\mathbf{x}^n)}{S_n^*(\mathbf{x}^n)} \ge \frac{1}{\sqrt{2\pi}} V_n.$$

Thus it is within a constant factor $\sqrt{2\pi}$ of optimal, without knowing $n$. The portfolio at time $i$:

$$\hat{\mathbf{b}}_i^D(\mathbf{x}^{i-1}) = \frac{\int_{\mathcal{B}} \mathbf{b}\, S_{i-1}(\mathbf{b}, \mathbf{x}^{i-1})\, d\mu(\mathbf{b})}{\int_{\mathcal{B}} S_{i-1}(\mathbf{b}, \mathbf{x}^{i-1})\, d\mu(\mathbf{b})},$$

where $\mu$ is the Dirichlet$(1/2, \ldots, 1/2)$ prior on $\mathcal{B}$.

### 9. Computational complexity

Naive implementation of the optimal strategy requires tracking $m^n$ sequences. Using the sufficient statistic $(n_1, \ldots, n_m)$ (the type), computation at time $l$ requires only $O(l^{m-1})$ quantities $X_{l-1}(k)$, updated via simple recursions:

$$X_l(k) = x_{l1} X_{l-1}(k-1) + x_{l2} X_{l-1}(k), \quad (m = 2).$$

Polynomial in $l$ for fixed $m$.

### 10. Hindsight allocation option pricing

Define the hindsight allocation option as a derivative paying $S_n^*(\mathbf{x}^n)$ at time $n$. The universal-portfolio bound gives an upper bound $\bar{H}_n = 1/V_n \sim c\sqrt{n}$ on its price, valid model-free.

**Binomial lattice ($m = 2$):** Stock takes values $1+u$ or $1+d$ each period, bond grows at $1+r$, with $u > r > d$. Risk-neutral probability $p_u = (r-d)/(u-d)$. The no-arbitrage price $H_n$ satisfies $H_n \sim c\sqrt{n}$, matching $\bar{H}_n$ up to a model-dependent constant. The dominant terms in $H_n$ are identical in form to those in $1/V_n$.

**Geometric Brownian motion:** Stock follows $dX_t = \mu X_t\,dt + \sigma X_t\,dB_t$, bond at rate $r$. The best CRP in hindsight at time $T$ has stock weight $b_T^* = \max(0, \min(1, \frac{1}{2} + \frac{(1/T)\log(X_T/X_0) - r}{\sigma^2}))$. The no-arbitrage price of the hindsight allocation option is computed exactly:

$$H_{0,T} = 1 + \sqrt{\frac{\sigma^2 T}{2\pi}}.$$

This grows as $\sigma \sqrt{T}$ -- the cost of hindsight is a "premium for volatility." If the payoff is redefined as excess return over the bond ($S_T^* - e^{rT}$), the price is simply $\sqrt{\sigma^2 T / (2\pi)}$.

## Domain of applicability

- **Distribution-free setting:** The max-min result (Theorems 1--3) holds for arbitrary price-relative sequences with no stochastic assumptions. Prices can be adversarial; the bound is the tightest possible.
- **Asset count:** Exact for any finite $m$; computationally feasible for moderate $m$ (complexity $O(n^{m-1})$ per step). Impractical for large $m$.
- **Horizon dependence:** The optimal strategy requires knowledge of $n$. The Dirichlet-weighted universal portfolio removes this at a constant-factor cost ($\sqrt{2\pi}$).
- **Market frictions:** No transaction costs, no short-selling (portfolios in the simplex), no leverage. The CRP benchmark assumes costless daily rebalancing.
- **Benchmark class:** Results are relative to CRPs only -- not the best dynamic strategy. CRPs include buy-and-hold of individual assets as special cases, so the benchmark dominates the best single asset.
- **Hindsight option pricing:** The binomial and GBM results require specific market models (complete markets, one stock + one bond). The model-free upper bound $1/V_n$ applies universally but may be loose for low-volatility markets.
- **Practical relevance:** The polynomial cost of universality ($\sim n^{-(m-1)/2}$) is negligible relative to exponentially growing wealth, making universal portfolios viable for long horizons. Real markets, being less volatile than the adversarial worst case, should yield better-than-worst-case performance.
