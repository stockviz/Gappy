# Nonparametric Prediction

**Authors:** Laszlo Gyorfi, Dominik Schafer **Year:** 2003 **Journal/Venue:** Book chapter (Chapter 16), in *Principles of Nonparametric Learning* (or a related edited volume on learning theory)

## Problem statement

Construct **universal prediction rules** for stationary and ergodic time series that are asymptotically optimal without knowledge of the underlying distribution. Three loss functions are treated in parallel:

1. **Squared error** (regression): minimize $L_n(g) = \frac{1}{n}\sum_{i=1}^n (g_i(x_1^i, y_1^{i-1}) - y_i)^2$.
2. **$0$--$1$ loss** (pattern recognition): minimize $L_n(g) = \frac{1}{n}\sum_{i=1}^n I_{\{g_i \neq y_i\}}$ where $y_i \in \{1,\ldots,M\}$.
3. **Log utility** (portfolio selection): maximize the average growth rate $W_n(B) = \frac{1}{n}\sum_{i=1}^n \log \langle b(x_1^{i-1}), x_i \rangle$ over portfolio strategies $B = \{b(\cdot)\}$.

In each case, the data $(X_1,Y_1),(X_2,Y_2),\ldots$ form a stationary and ergodic process with unknown joint distribution, and the goal is Cesaro consistency: matching the performance of the best predictor in hindsight, almost surely, for all processes in the class.

## Approach (short)

Define a doubly-indexed countable family of elementary predictors (experts) $h^{(k,\ell)}$, each a nonparametric nearest-neighbor-style rule parametrized by a pattern length $k$ and a quantization resolution $\ell$. Combine them via exponential weighting on cumulative loss (the "experts" or "aggregating strategies" framework). The combined predictor inherits universal consistency because (a) exponential weighting tracks the best expert up to an $O(n^{-1}\log q_{k,\ell}^{-1})$ penalty, and (b) the expert family is rich enough that for every stationary ergodic process, some expert is asymptotically optimal.

## Approach (detailed)

### 1. Expert construction (common to all three problems)

Fix a nested sequence of finite partitions $\mathcal{P}_\ell = \{A_{\ell,1}, A_{\ell,2},\ldots, m_\ell\}$ of $\mathcal{R}^d$ with quantizer $G_\ell(x) = j$ if $x \in A_{\ell,j}$, satisfying:

- (a) Nesting: every cell of $\mathcal{P}_{\ell+1}$ is a subset of some cell of $\mathcal{P}_\ell$.
- (b) Asymptotic fineness: $\lim_{\ell\to\infty} \max_{j: A_{\ell,j}\cap S \neq \emptyset} \operatorname{diam}(A_{\ell,j}) = 0$ for any bounded $S$.

Similarly define a quantizer $H_\ell$ for the $y$-space (for regression/classification). For each pair $(k,\ell)$ of positive integers, expert $h^{(k,\ell)}$ operates by:

1. Quantize the past: compute $G_\ell(x_{n-k}^{n-1})$ (and $H_\ell(y_{n-k}^{n-1})$ where applicable).
2. Find all past times $i$ with $k < i < n$ where the same quantized pattern of length $k$ appeared.
3. Predict by averaging (regression), majority vote (classification), or log-optimal portfolio (portfolio selection) over those matching episodes.

**Regression expert:**
$$h_n^{(k,\ell)}(x_1^n, y_1^{n-1}) := \frac{\sum_{i \in I_n} y_i}{|I_n|}$$
where $I_n = \{k < i < n : G_\ell(x_{i-k}^i) = G_\ell(x_{n-k}^n) \text{ and } H_\ell(y_{i-k}^{i-1}) = H_\ell(y_{n-k}^{n-1})\}$.

**Portfolio expert:** for each quantized string $s$ of length $k$,
$$b^{(k,\ell)}(x_1^{n-1}, s) = \arg\max_b \sum_{\{k < i < n:\, G_\ell(x_{i-k}^{i-1})=s\}} \log\langle b, x_i\rangle$$
i.e., the empirical log-optimal portfolio conditional on the quantized context $s$. Then $h^{(k,\ell)}(x_1^{n-1}) = b^{(k,\ell)}(x_1^{n-1}, G_\ell(x_{n-k}^{n-1}))$.

### 2. Expert aggregation

**Squared error (Lemma 1).** Let $\{q_k\}$ be a probability distribution on the experts with $q_k > 0$ for all $k$. Define weights

$$w_{t,k} = q_k \, e^{-(t-1)L_{t-1}(\tilde{h}_k)/c}, \qquad c \geq 8B^2,$$

normalized to $v_{t,k} = w_{t,k}/\sum_i w_{t,i}$. The combined predictor

$$\tilde{g}_t(y_1^{t-1}) = \sum_{k=1}^\infty v_{t,k}\,\tilde{h}_k(y_1^{t-1})$$

satisfies, for every $n \geq 1$:

$$L_n(\tilde{g}) \leq \inf_k \left( L_n(\tilde{h}_k) - \frac{c\ln q_k}{n} \right).$$

This is exact (not approximate). The penalty $c\ln q_k / n \to 0$ as $n\to\infty$.

**$0$--$1$ loss (Lemma 2, after Cesa-Bianchi).** For $N$ experts, define randomized classifier weights $\tilde{w}_t(k) = e^{-\sqrt{8\ln N / n}\,L_{t-1}(\tilde{h}^{(k)})}$. The randomized combined classifier satisfies:

$$\mathbf{E}\, L_n(\tilde{g}) \leq \min_{k=1,\ldots,N} L_n(\tilde{h}^{(k)}) + \sqrt{\frac{\ln N}{2n}}.$$

Since a countably infinite expert set is needed, this is applied with a growing truncation: use $N = N_n$ experts with $N_n \to \infty$, $\ln N_n / n \to 0$.

**Log utility (portfolio selection).** The combined portfolio strategy weights experts by accumulated capital:

$$b(x_1^{n-1}) := \frac{\sum_{k,\ell} q_{k,\ell}\, S_{n-1}(H^{(k,\ell)})\, h^{(k,\ell)}(x_1^{n-1})}{\sum_{k,\ell} q_{k,\ell}\, S_{n-1}(H^{(k,\ell)})},$$

where $S_n(H^{(k,\ell)})$ is the capital accumulated by expert $H^{(k,\ell)}$ after $n$ days. The investor's total capital decomposes as $S_n(B) = \sum_{k,\ell} q_{k,\ell}\, S_n(H^{(k,\ell)})$.

### 3. Universal consistency results

**Theorem 1 (Regression).** If the quantizers $G_\ell$ and $H_\ell$ are asymptotically fine and $\mathbf{P}\{Y_i \in [-B,B]\} = 1$, the combined predictor $g$ is universally Cesaro consistent:

$$\lim_{n\to\infty} \frac{1}{n}\sum_{i=1}^n (g_i(X_{i+1}, D_i) - Y_{i+1})^2 = L^* \quad \text{a.s.}$$

for all stationary and ergodic processes, where $L^* = \lim_{n\to\infty}\min_g \mathbf{E}\{(g(X_{n+1},D_n) - Y_{n+1})^2\}$.

**Theorem 2 (Portfolio selection).** Under the same partition conditions and the integrability condition $\mathbf{E}\{|\log X^{(j)}|\} < \infty$ for $j = 1,\ldots,d$, the combined strategy $B$ is universal:

$$\lim_{n\to\infty} \frac{1}{n}\log S_n(B) = W^* \quad \text{a.s.}$$

where $W^* = \mathbf{E}\left\{\max_{b(\cdot)} \mathbf{E}\{\log\langle b(X_{-\infty}^{-1}), X_0\rangle \mid X_{-\infty}^{-1}\}\right\}$ is the maximal growth rate (Algoet and Cover).

### 4. Proof machinery (Theorem 2 sketch)

1. **Lower bound via Jensen.** $W_n(B) = \frac{1}{n}\log\left(\sum_{k,\ell} q_{k,\ell}\,S_n(H^{(k,\ell)})\right) \geq \sup_{k,\ell}\left(W_n(H^{(k,\ell)}) + \frac{\log q_{k,\ell}}{n}\right)$, so $\liminf W_n(B) \geq \sup_{k,\ell} \liminf W_n(H^{(k,\ell)})$.

2. **Breiman's generalized ergodic theorem (Lemma 3).** For a stationary ergodic process $Z = \{Z_i\}_{-\infty}^\infty$ with left shift $T$, if $f_i(Z) \to f(Z)$ a.s. and $\mathbf{E}\sup_i|f_i(Z)| < \infty$, then $\frac{1}{n}\sum_{i=1}^n f_i(T^i Z) \to \mathbf{E} f(Z)$ a.s.

3. **Algoet--Cover theorem (Theorem 3).** (a) If distributions $\mathbf{Q}_n \to \mathbf{Q}_\infty$ weakly on $(0,\infty)^d$, then log-optimal portfolios $b_n \to b^*$ for $\mathbf{Q}_\infty$-a.e. return vector. (b) For increasing $\sigma$-fields $\mathcal{F}_k \nearrow \mathcal{F}_\infty$, $\mathbf{E}\left\{\max_b \mathbf{E}[\log\langle b,X\rangle|\mathcal{F}_k]\right\} \nearrow \mathbf{E}\left\{\max_b \mathbf{E}[\log\langle b,X\rangle|\mathcal{F}_\infty]\right\}$.

4. **Assembly.** By the ergodic theorem, the empirical conditional distribution $\mathbf{P}_{j,s}^{(k,\ell)}$ converges weakly to $\mathbf{P}_{X_0|G_\ell(X_{-k}^{-1})=s}$ a.s. By Theorem 3(a), each elementary portfolio converges to the conditionally log-optimal portfolio, so $W_n(H^{(k,\ell)}) \to \epsilon_{k,\ell} := \mathbf{E}\{\max_{b(\cdot)} \mathbf{E}[\log\langle b, X_0\rangle | G_\ell(X_{-k}^{-1})]\}$ a.s. (via Lemma 3). By nestedness of partitions and Theorem 3(b), $\sup_{k,\ell}\epsilon_{k,\ell} = W^*$. Combining with step 1 gives $\liminf W_n(B) \geq W^*$. The reverse inequality $\limsup \frac{1}{n}\log S_n \leq W^*$ holds for any strategy (Algoet), completing the proof.

## Domain of applicability

**Assumptions and scope:**
- The data-generating process must be **stationary and ergodic**. No parametric or mixing-rate assumptions are needed, but stationarity is essential.
- **Bounded outputs** ($|Y| \leq B$) for squared-error regression; **finite label set** for classification; **finite log-moment** ($\mathbf{E}|\log X^{(j)}| < \infty$) for portfolio selection.
- The convergence is **Cesaro** (time-averaged), not pointwise at each step. This is the strongest achievable mode for the general stationary ergodic class.
- Convergence rates are not provided (and generically cannot be, since no rate is uniform over all ergodic processes).

**Practical considerations:**
- The expert family is countably infinite and the aggregation weights are computed over all $(k,\ell)$. In practice, one must truncate to a finite grid of $(k,\ell)$ values, losing theoretical universality but retaining a large nonparametric class.
- The partition-based pattern matching is a form of context-tree or quantized nearest-neighbor prediction. Performance depends critically on the quantization design, especially in high-dimensional return spaces ($d$ large).
- For portfolio selection, the method extends Cover's (1991) universal portfolio idea from i.i.d. returns to the full stationary ergodic class, but at the cost of requiring the empirical log-optimal portfolio within each quantized context cell --- a nontrivial optimization subproblem.
- No transaction costs, short-selling constraints, or other market frictions are modeled. The portfolio vector $b$ is a probability distribution (long-only, fully invested).
