# An Algorithm for Maximizing Expected Log Investment Return
**Authors:** Thomas M. Cover
**Year:** 1984
**Journal/Venue:** IEEE Transactions on Information Theory, Vol. IT-30, No. 2

## Problem statement

Given $m$ stocks with random return vector $X \geq 0$ drawn from a known distribution $F(x)$, $x \in \mathbb{R}^m$, find the log-optimal portfolio

$$b^* = \arg\max_{b \in B} W(b), \qquad W(b) = E \ln b'X,$$

where $B = \{b \in \mathbb{R}^m : b \geq 0,\; \sum_i b_i = 1\}$ is the simplex. The paper provides an iterative algorithm that converges to $b^*$, proves monotonicity and convergence, and supplies computable upper bounds on $W^* - W(b)$.

## Approach (short)

Cover proposes a multiplicative gradient-ascent algorithm on the simplex: at each step the current portfolio $b$ is replaced by $b'$ whose $i$-th component is $b_i' = b_i \, \alpha_i(b)$, where $\alpha_i(b) = E[X_i / b'X]$ is the expected portfolio-relative return of asset $i$. This is the natural "Arimoto--Blahut" iteration transplanted from rate-distortion/channel-capacity computation to log-optimal portfolios. Monotonicity of the expected log return along the iterates is proved via Jensen's inequality and the KL divergence, and convergence to $b^*$ is established through the Kuhn--Tucker conditions and a compactness argument on the simplex.

## Approach (detailed)

### 1. Setup and optimality conditions

The objective is $W(b) = E \ln b'X$ over $b \in B$. The gradient is

$$\alpha_i(b) = \frac{\partial W}{\partial b_i} = E\!\left[\frac{X_i}{b'X}\right], \qquad i = 1,\dots,m. \tag{1.2}$$

By concavity of $W$ and the simplex constraint, the Kuhn--Tucker conditions for $b^*$ are:

- $\alpha_i(b) = 1$ whenever $b_i > 0$, (3.1)
- $\alpha_i(b) \leq 1$ whenever $b_i = 0$. (3.2)

Uniqueness of $b^*$ holds when $X$ has full-dimensional support.

### 2. The algorithm

Initialize $b^0 > 0$ (strictly interior to $B$). Update recursively:

$$b_i^{n+1} = b_i^n \, \alpha_i(b^n), \qquad i = 1,\dots,m. \tag{1.3}$$

The iterate stays in $B$ because $\sum_i b_i^{n+1} = \sum_i b_i^n E[X_i / b^{n\prime}X] = E[1] = 1$ (by linearity and the definition of the portfolio return). This is a multiplicative weights update where each asset weight is rescaled by its expected relative return under the current portfolio.

### 3. Monotonicity (Theorem 1)

Define the one-step updated portfolio $b_i' = b_i \, E[X_i / b'X]$ and the mixing variables $Y_i(b) = X_i / b'X$, which satisfy $\sum_i b_i Y_i(b) = 1$ a.s. and $b_i Y_i(b) \geq 0$. Then:

$$W(b') - W(b) = E \ln \frac{b'_i X}{b'X} = E \ln \sum_i b_i' Y_i(b).$$

Applying Jensen's inequality to the concave $\ln$, but in the "wrong" direction (the mixture weights $b_i Y_i$ are random), Cover instead uses:

$$W(b') - W(b) \geq \sum_i b_i' \ln(b_i'/b_i) = D(b' \| b) \geq 0, \tag{2.5/2.7}$$

where $D(\cdot \| \cdot)$ is the KL divergence. The key intermediate step applies Jensen to the concavity of $\ln$:

$$E\!\left[\sum_i b_i Y_i(b) \ln (EY_i(b)) \frac{b_i}{b_i}\right] \geq \sum_i b_i' \ln(b_i'/b_i).$$

Equality holds iff $b' = b$, i.e., $b$ already satisfies the first Kuhn--Tucker condition on its support. So $W_n = W(b^n)$ is strictly increasing until $b^n$ is optimal.

**Theorem 2 (ratio monotonicity):** Letting $S_n = b^{n\prime} X$, we also have $E[S_{n+1}/S_n] \geq 1$, proved via Jensen applied to the conditional expectation of the ratio.

### 4. Convergence (Theorem 3)

The argument proceeds in several stages:

**(a) Accumulation-point structure.** Since $\{b^n\} \subset B$ (compact), the set $\bar{B}$ of accumulation points is nonempty, compact, and connected (Lemma 1). Connectedness follows because $D(b^{n+1}\|b^n) \leq W_{n+1} - W_n \to 0$ forces $\|b^{n+1} - b^n\| \to 0$; any open cutset of $\bar{B}$ would be crossed infinitely often, contradiction.

**(b) Continuity of the gradient.** Under $-\infty < W^* < \infty$ (which requires $P(X=0)=0$), the components $\alpha_i(b)$ are continuous extended-real-valued functions on $B$ (Lemma 2, proved via Fatou's lemma and dominated convergence).

**(c) Stability implies optimality.** Any accumulation point $\hat{b}$ satisfies $W(\hat{b}) = \lim W_n$ (by continuity of $W$) and $\Delta(\hat{b}) = 0$ where $\Delta(b) = W(b') - W(b)$. By Theorem 1, $\Delta(\hat{b}) \geq \sum \hat{b}_i' \ln(\hat{b}_i'/\hat{b}_i) \geq 0$, so $\hat{b}' = \hat{b}$, meaning $\hat{b}$ is stable, hence satisfies the first Kuhn--Tucker condition on its support.

**(d) Second Kuhn--Tucker condition.** For assets with $\hat{b}_i = 0$: project $b^n$ onto the minimal linear subspace $L$ supporting $X$, and use connectedness of $\bar{B}$ plus the face structure of $B$ to show all accumulation points project to the same point $\hat{b}_L$. This forces $\alpha_i(\hat{b}) \leq 1$ for all $i$, completing both KT conditions.

**(e) Conclusion.** Both KT conditions hold at every accumulation point, so every accumulation point is optimal. If $X$ has full support, $b^*$ is unique, and $b^n \to b^*$.

**Regularity condition:** $b^0 > 0$ (componentwise) is required; otherwise iterates remain confined to a face of $B$. The distribution must satisfy $W^* > -\infty$, equivalently $P(X = 0) = 0$.

### 5. Upper bounds on sub-optimality (Theorem 4)

For any $b \in B$:

$$W^* - W(b) \leq \max_i \; E\!\left[\frac{X_i}{b'X}\right] - 1 = \max_i \ln \alpha_i(b^n). \tag{5.1--5.2}$$

The lower bound is trivial ($W(b) \leq W^*$). The upper bound follows from $W^* = E \ln b^{*\prime}X = E \ln S^* = E \ln(S^*/S(b)) + E \ln S(b)$, then bounding $E \ln(S^*/S(b)) \leq \ln E(S^*/S(b)) = \ln \sum b_i^* E(X_i/S(b)) \leq \ln \max_i \alpha_i(b)$.

This provides a practical stopping criterion: terminate when $\max_i \ln \alpha_i(b^n) \leq \varepsilon$.

**Remark.** The KT conditions require $\max_i \alpha_i(b) = 1$ at optimality, so this upper bound converges to zero as $b^n \to b^*$.

## Domain of applicability

**Where it applies:**
- Any finite number of assets $m$ with known joint distribution $F$ of returns, provided $P(X = 0) = 0$ and $W^* > -\infty$.
- The algorithm is distribution-free in the sense that only the expectations $E[X_i / b'X]$ are needed, which can be computed by Monte Carlo if $F$ is known but analytically intractable.
- Directly analogous to Arimoto--Blahut in information theory; the paper explicitly notes this connection. The novelty is the transplant to portfolio theory and the convergence proof adapted to the simplex/KT structure.

**Where it breaks or is limited:**
- The distribution $F$ must be fully known. This is not an adaptive or online algorithm (Cover's later "universal portfolios" work, 1991, addresses the sequential/distribution-free setting -- a very different paper despite the similar theme).
- Each iteration requires computing $m$ expectations $E[X_i / b'X]$, which in general demands numerical integration or Monte Carlo. For high-dimensional $X$ or complex distributions this can be expensive.
- Convergence is proved but no rate is given. The KL-divergence lower bound $W_{n+1} - W_n \geq D(b^{n+1}\|b^n)$ guarantees monotonicity but does not directly yield geometric or polynomial convergence rates.
- The strict interiority condition $b^0 > 0$ is essential; if any component starts at zero it stays at zero, so the algorithm cannot discover that an omitted asset belongs in the optimal portfolio.
- The log-utility assumption is baked in. The algorithm does not extend to general concave utilities without modification (the multiplicative structure is specific to $\ln$).
- Transaction costs, constraints on positions, and multi-period rebalancing are entirely absent.

**What is genuinely novel vs. known:** The log-optimal portfolio criterion and its KT conditions were well established (Kelly 1956, Breiman 1961, Bell--Cover 1980). The algorithmic contribution is the multiplicative update (1.3) and its convergence theory, which is new in the portfolio context but structurally identical to Arimoto (1972) and Blahut (1972) for channel capacity / rate-distortion. Cover's contribution is recognizing the isomorphism and providing the full convergence proof with the upper-bound stopping criterion in the portfolio setting.
