# Universal Portfolios with Side Information

**Authors:** Thomas M. Cover, Erik Ordentlich
**Year:** 1996
**Journal/Venue:** IEEE Transactions on Information Theory, Vol. 42, No. 2

## Problem statement

Given an arbitrary sequence of $m$-stock price relatives $x_1, x_2, \ldots, x_n \in \mathbb{R}^m_+$ and an associated sequence of side-information states $y_1, \ldots, y_n \in \mathcal{Y} = \{1, \ldots, k\}$, exhibit a sequential investment algorithm whose per-period exponential growth rate of wealth matches, to first order in the exponent, that of the best *state-constant rebalanced portfolio* chosen with full hindsight---uniformly over all sequences $(x^n, y^n)$, with no distributional assumptions whatsoever.

A state-constant rebalanced portfolio assigns a fixed portfolio $b(y) \in B$ (the simplex) to each side-information state $y$, giving $k(m-1)$ degrees of freedom. The benchmark wealth is $S_n^*(x^n | y^n) = \max_{b(\cdot) \in B^k} \prod_{i=1}^n b(y_i)^t x_i$. The goal is an individual-sequence minimax-regret guarantee: the ratio $S_n^*(x^n|y^n) / \hat{S}_n(x^n|y^n)$ grows at most polynomially in $n$, so the log-wealth gap is $o(n)$.

## Approach (short)

Define the $\mu$-weighted universal portfolio with side information as a performance-weighted Bayesian mixture over all state-constant rebalanced portfolios, run independently on each subsequence selected by the side-information state. The analysis reduces bounding the wealth ratio to bounding the worst-case redundancy of a $\mu$-mixture code for i.i.d. sources---a classical quantity in universal data compression. For both the uniform and Dirichlet$(1/2, \ldots, 1/2)$ weighting measures, this redundancy is bounded in closed form, yielding polynomial (in $n$) worst-case wealth ratios that hold for every individual sequence.

## Approach (detailed)

### 1. Setup and notation

- Price relatives: $x_i \in \mathbb{R}^m_+$, with $x_{ij}$ the closing/opening price ratio for stock $j$ on day $i$.
- Portfolio: $b \in B = \{b \in \mathbb{R}^m : \sum b_j = 1, \, b_j \ge 0\}$. A constant rebalanced portfolio uses the same $b$ every period; wealth after $n$ periods is $S_n(b, x^n) = \prod_{i=1}^n b^t x_i$.
- Side information: $y_i \in \mathcal{Y} = \{1, \ldots, k\}$ available at the start of period $i$. A state-constant rebalanced portfolio uses portfolio $b(y_i)$ at time $i$, achieving wealth $S_n(b(\cdot), x^n | y^n) = \prod_{i=1}^n b(y_i)^t x_i$.
- Best in hindsight: $b^*(\cdot) = \arg\max_{b(\cdot) \in B^k} S_n(b(\cdot), x^n | y^n)$, wealth $S_n^*(x^n|y^n)$.
- Degrees of freedom: $d = k(m-1)$.

### 2. The $\mu$-weighted universal portfolio (no side information, $k=1$)

Choose a probability measure $\mu$ on $B$ with $\int_B d\mu(b) = 1$. The sequential portfolio at time $i$ is

$$\hat{b}_i = \hat{b}_i(x^{i-1}) = \frac{\int_B b \, S_{i-1}(b, x^{i-1}) \, d\mu(b)}{\int_B S_{i-1}(b, x^{i-1}) \, d\mu(b)},$$

i.e., a performance-weighted posterior mean under $\mu$. The resulting wealth telescopes:

$$\hat{S}_n(x^n) = \int_B S_n(b, x^n) \, d\mu(b).$$

This is *Definition 1* (Cover, 1991). The portfolio is a Bayesian mixture over CRPs, and the wealth equals the marginal likelihood.

### 3. Extension to side information

**Definition 2.** Run a separate $\mu$-weighted universal portfolio on each subsequence $\{x_i : y_i = r\}$ for $r = 1, \ldots, k$. At time $i$ with $y_i = r$, the portfolio is

$$\hat{b}_i(y) = \frac{\int_B b \, S_{i-1}(b|y) \, d\mu(b)}{\int_B S_{i-1}(b|y) \, d\mu(b)}, \quad y \in \mathcal{Y},$$

where $S_i(b|y) = \prod_{j \le i : y_j = y} b^t x_j$. The total wealth factors as

$$\hat{S}_n(x^n | y^n) = \prod_{r=1}^k \int_B S_n(b|r) \, d\mu(b).$$

This factorization is the key structural observation: side information decomposes the problem into $k$ independent universal portfolio sub-problems.

### 4. Core bound (Lemma 2)

For any $\mu$ on $B$,

$$\frac{S_n^*(x^n)}{\hat{S}_n(x^n)} \le \max_{j^n} \frac{\prod_{i=1}^n b^*_{j_i}}{\int_B \prod_{i=1}^n b_{j_i} \, d\mu(b)},$$

where $j^n = (j_1, \ldots, j_n) \in \{1, \ldots, m\}^n$ indexes which stock is "selected" at each time. The proof rewrites both $S_n^*$ and $\hat{S}_n$ as sums over index sequences and applies the max-ratio-of-sums $\le$ max-of-ratios inequality (Lemma 1: $\sum \alpha_i / \sum \beta_i \le \max_i \alpha_i/\beta_i$). This ratio is precisely the *pointwise redundancy* of the $\mu$-mixture code relative to the best i.i.d. code on $m$ symbols---a classical object in universal source coding.

### 5. Main theorems (uniform bounds, all sequences)

**Theorem 1** ($\mu$ = uniform on $B$, no side information):

$$\frac{S_n^*(x^n)}{\hat{S}_n(x^n)} \le \binom{n+m-1}{m-1} \le (n+1)^{m-1}.$$

*Proof sketch.* The denominator of Lemma 2's ratio evaluates in closed form for the uniform distribution on the simplex: $\int_B \prod b_{j_i} \, d\mu(b) = 1 / \binom{n+m-1}{m-1} \cdot T(\nu_1, \ldots, \nu_m)$, where $T$ counts the number of type sequences with the same composition. The numerator $\prod b^*_{j_i} = \prod \nu_r^{n\nu_r}$, which is at most $2^{-nH(\nu)}$ when $b^* = (\nu_1, \ldots, \nu_m)$. The type-counting bound $T \le 2^{nH}$ makes the ratio collapse to $\binom{n+m-1}{m-1}$.

**Theorem 2** ($\mu$ = Dirichlet$(1/2, \ldots, 1/2)$, no side information):

$$\frac{S_n^*(x^n)}{\hat{S}_n(x^n)} \le \frac{\Gamma(1/2) \, \Gamma(n + m/2)}{\Gamma(m/2) \, \Gamma(n + 1/2)} \le 2(n+1)^{(m-1)/2}.$$

The Dirichlet$(1/2)$ weighting gives a factor of roughly $\sqrt{n+1}$ per degree of freedom instead of $(n+1)$---a tighter worst case. The proof uses Lemma 5 (bounding the ratio $2^{-nH}/D(n_1, \ldots, n_m)$ where $D$ involves Gamma functions from the Dirichlet integral) and Lemma 4 (Schur convexity of $\prod x_r^{x_r}/\Gamma(x_r + 1/2)$ maximized at a corner).

**Theorem 3** (side information, $k \ge 1$):

For the uniform $\mu$:

$$\frac{S_n^*(x^n|y^n)}{\hat{S}_n(x^n|y^n)} \le \prod_{r=1}^k (n_r(y^n) + 1)^{m-1} \le (n+1)^{k(m-1)}.$$

For Dirichlet$(1/2)$:

$$\frac{S_n^*(x^n|y^n)}{\hat{S}_n(x^n|y^n)} \le 2^k \prod_{r=1}^k (n_r(y^n) + 1)^{(m-1)/2} \le 2^k (n+1)^{k(m-1)/2},$$

where $n_r(y^n) = \sum_{i=1}^n \mathbf{1}(y_i = r)$. The proof applies Theorems 1 and 2 to each subsequence, then multiplies the bounds. This yields

$$W_n^*(x^n|y^n) - \hat{W}_n(x^n|y^n) \le \frac{d}{2n} \log(n+1) + \frac{k}{n} \log 2,$$

with $d = k(m-1)$, which is $O((d/n)\log n) \to 0$.

### 6. Connection to universal data compression

The ratio in Lemma 2 is exactly the worst-case redundancy of the $\mu$-mixture code for i.i.d. sources over an $m$-ary alphabet. When $b$ is viewed as a probability vector, $\prod b^*_{j_i}$ is the likelihood under the best i.i.d. source and $\int \prod b_{j_i} \, d\mu(b)$ is the marginal under the mixture. The paper shows that for both the uniform and Dirichlet$(1/2)$ weightings, the $\mu$-mixture codes are pointwise universal for i.i.d. sources, and the investment bounds inherit this universality. The Dirichlet$(1/2)$ case corresponds to the Jeffreys prior and yields the Krichevsky--Trofimov estimator, whose redundancy bounds are known to be essentially tight.

### 7. Combining expert opinion

A useful corollary: given $m'$ experts each recommending a portfolio $b_i^{(r)}$ at time $i$, augment the market vector to $\tilde{x}_i = (x_i, b_i^{(1)t} x_i, \ldots, b_i^{(m')t} x_i)$ and apply the universal portfolio to $m + m'$ "stocks." The resulting strategy asymptotically matches the best CRP over both the original stocks and the experts. Since the best CRP over a set usually strictly outperforms every constituent, this exponentially outperforms all individual experts.

### 8. Efficient computation (Section VI)

For $m = 2$ stocks and Dirichlet$(1/2, 1/2)$, define $Q_n(l) = X_n(l) \, C_n(l)$ where $X_n(l) = \sum_{j^n \in T_n(l)} \prod x_{ij_i}$ sums wealth over all index sequences of type $l$ (i.e., $l$ ones and $n-l$ twos), and $C_n(l)$ is the Dirichlet weight for that type. Both satisfy simple two-term recursions:

$$Q_n(l) = x_{n1} \frac{l - 1/2}{n} Q_{n-1}(l-1) + x_{n2} \frac{n - l - 1/2}{n} Q_{n-1}(l),$$

with $Q_0(0) = 1$. Then $\hat{S}_n(x^n) = \sum_{l=0}^n Q_n(l)$, computable in $O(n^2)$ time (or $O(n^{m-1})$ for general $m$). The portfolio weights at time $n$ are also expressible via $Q_{n-1}$.

## Domain of applicability

**Where it applies:**

- The results are *individual-sequence* bounds: they hold for every $(x^n, y^n)$ with no distributional assumptions on price relatives or side information. This is the paper's main strength---it sidesteps all stationarity, ergodicity, or moment conditions.
- The benchmark (best state-constant rebalanced portfolio) is meaningful whenever rebalancing is costless and the relevant comparison class is parametric portfolios conditioned on a discrete signal.
- The side-information framework is genuinely flexible: $y_i$ can depend on the entire past $(x_1, \ldots, x_n)$, so it subsumes any causal signal.

**Where it breaks:**

- **Transaction costs.** The entire framework assumes costless rebalancing. The best CRP in hindsight may not even be achievable net of costs, and the universal portfolio itself rebalances every period. The authors acknowledge this explicitly and offer no resolution.
- **Curse of dimensionality.** The regret bound grows as $d \log n / n$ with $d = k(m-1)$. For large $k$ (many side-information states) or large $m$ (many stocks), convergence is extremely slow. The wealth ratio bound is $O(n^{k(m-1)/2})$ for the Dirichlet weighting---polynomial, but the exponent can be enormous. This is the standard bias-variance tradeoff in nonparametric methods: a richer comparison class yields a higher target but slower tracking.
- **Benchmark strength.** The best CRP is a weak benchmark in realistic markets. It cannot time the market, shift regimes, or concentrate. In strongly trending or regime-switching markets, the best CRP may itself perform poorly, and matching it is not impressive.
- **Continuous price relatives.** The bounds are stated for arbitrary $x_i \in \mathbb{R}^m_+$ with no boundedness assumptions, which is correct. However, the practical rate of convergence depends on the effective dimension, and with continuous prices the logarithmic regret $O((d/n)\log n)$ can be slow for moderate $n$.
- **Side-information discreteness.** The side information must be discrete with finitely many states. Continuous side information would require discretization, reintroducing the curse of dimensionality.
- **No claims about finite-sample profitability.** The results are asymptotic in character ($o(n)$ regret). For any finite $n$, the polynomial factor can be large, and the universal portfolio may significantly underperform.
