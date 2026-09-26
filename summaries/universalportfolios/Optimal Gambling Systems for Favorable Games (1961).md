# Optimal Gambling Systems for Favorable Games
**Authors:** Leo Breiman
**Year:** 1961
**Journal/Venue:** Proceedings of the Fourth Berkeley Symposium on Mathematical Statistics and Probability

## Problem statement

Given a sequence of independent repetitions of a favorable game (one admitting a strategy under which wealth $S_n \to \infty$ a.s.), how should a gambler allocate fractions of current wealth across the available bets? The paper asks this under two asymptotic criteria simultaneously: (i) minimize the expected time $ET(x)$ to reach a target fortune $x$ as $x \to \infty$; (ii) maximize the asymptotic growth rate, i.e., the magnitude of $S_n$. A secondary question addresses the finite-horizon coin-toss case: maximize $P\{S_n \geq y \mid S_0 = x\}$ for fixed $n$.

## Approach (short)

Breiman identifies a unique (up to payoff-equivalence) constant-fraction strategy $\Lambda^*$ that maximizes $E[\log V_n]$ -- equivalently, the expected log-growth per round -- and proves it is asymptotically optimal under both the time-minimization and magnitude-maximization criteria. The key insight, anticipated by Kelly (1956), is that log-wealth is an additive process whose drift is controlled by $W(\bar{\lambda}) = \sum_i p_i \log\!\bigl(\sum_{j \in A_i} \lambda_j o_j\bigr)$; maximizing $W$ over the simplex yields $\Lambda^*$. The paper then shows that any strategy not asymptotically close to $\Lambda^*$ is infinitely worse in the growth-rate sense, and that in the finite coin-toss problem $\Lambda^*$ is uniformly close to the optimum.

## Approach (detailed)

### Setup and notation

1. A random variable $X$ takes values in $I = \{1, \dots, s\}$ with $P\{X = i\} = p_i$. A class $\mathcal{C}$ of subsets $A_1, \dots, A_r$ partitions $I$ (with $\bigcup_j A_j = I$), and positive odds $(o_1, \dots, o_r)$ are attached to each $A_j$. Betting amounts $\beta_1, \dots, \beta_r$ on the events $\{X \in A_j\}$ return $\sum_{i \in A_j} \beta_j o_j$ when $X = i$.

2. A **strategy** $\Lambda$ specifies, after observing the history $R_n = (X_1, \dots, X_n)$, the fractions $\bar{\lambda}^{(n+1)} = (\lambda_1^{(n+1)}, \dots, \lambda_r^{(n+1)})$ of current wealth wagered on each $A_j$, with $\sum_{j=1}^{r} \lambda_j^{(n+1)} = 1$, $\lambda_j \geq 0$. Wealth evolves multiplicatively:

$$S_{n+1} = V_{n+1} S_n, \qquad V_n = \sum_{i \in A_j} \lambda_j^{(n)} o_j \;\text{ when } X_n = j.$$

3. Define the **growth-rate function** on the simplex $\mathfrak{F} = \{\bar{\lambda} : \lambda_j \geq 0,\; \sum \lambda_j = 1\}$:

$$W(\bar{\lambda}) = \sum_{i} p_i \log\!\Bigl(\sum_{j:\, i \in A_j} \lambda_j o_j\Bigr).$$

Set $W = \max_{\bar{\lambda} \in \mathfrak{F}} W(\bar{\lambda})$. The strategy $\Lambda^*$ uses the constant (history-independent) allocation $\bar{\lambda}^*$ achieving this maximum at every round.

### Key structural results (Section 2)

4. **Proposition 1 (Essential uniqueness).** If $\bar{\lambda}^{(1)}, \bar{\lambda}^{(2)} \in \mathfrak{F}$ both attain $W$, then for every $i$ they produce the same payoff: $\sum_{j:\, i \in A_j} \lambda_j^{(1)} o_j = \sum_{j:\, i \in A_j} \lambda_j^{(2)} o_j$. Proof is immediate from strict concavity of $\log$: if $\bar{\lambda} = \alpha \bar{\lambda}^{(1)} + \beta \bar{\lambda}^{(2)}$ with $\alpha + \beta = 1$, then $W(\bar{\lambda}) \leq W$ with equality iff the payoffs coincide state by state.

5. **Proposition 2.** When the $A_j$ are disjoint, $\lambda_j^* = P\{X \in A_j\}$ regardless of the odds. (Kelly betting.)

6. **Proposition 3 (Favorability criterion).** A game is favorable (i.e., admits a strategy with $S_n \to \infty$ a.s.) if and only if $W > 0$. Proof: under $\Lambda^*$, $\log S_n^* = \sum_1^n W_k^*$ with $E[W_k^*] = W$; the SLLN gives $S_n^* \to \infty$ a.s. iff $W > 0$. Conversely, if some $\Lambda$ achieves $S_n \to \infty$ a.s., then the ratio result of Section 4 forces $W \geq 0$, and $W = 0$ leads to a contradiction via the law of the iterated logarithm.

### Asymptotic time minimization (Section 3)

7. Define $T(x) = \min\{n : S_n \geq x\}$ under strategy $\Lambda$, and $T^*(x)$ for $\Lambda^*$.

8. **Theorem 1.** If the $W_k^*$ are nonlattice, then for any strategy $\Lambda$:

$$\lim_{x \to \infty} \bigl[ET(x) - ET^*(x)\bigr] = \frac{1}{W} \sum_{k=1}^{\infty} (W - E[W_k \mid R_{k-1}])$$

and there exists a constant $\alpha$ independent of $\Lambda$ and $x$ such that $ET^*(x) - ET(x) \leq \alpha$.

   The RHS is nonneg (zero iff $\Lambda \equiv \Lambda^*$ in the payoff sense), so $\Lambda^*$ has the smallest expected hitting time to any level, up to a bounded constant. The nonlattice condition is generic: for the coin-toss game with rational $p$, the lattice set is countable and consists only of irrationals.

9. **Proof sketch.** The argument rests on an identity close to Wald's:

$$EN(y) = \frac{1}{W} E\!\Biggl\{\sum_{k=1}^{N} \bigl[W - E(W_k \mid R_{k-1})\bigr]\Biggr\} + \frac{1}{W} E\!\Biggl[\sum_{k=1}^{N} W_k\Biggr],$$

where $N(y) = \min\{n : W_1 + \cdots + W_n \geq y\}$. The second term is handled by renewal theory (Proposition 4, using Blackwell's extension of the renewal theorem to nonlattice distributions). Propositions 5--8 establish that $F_y(\xi)$, the overshoot distribution of $\sum W_k - y$, converges to a continuous limit $F^*(\xi)$, using a coupling argument and Wald's identity to control the tail. The first term converges by dominated convergence (the conditional deviations $W - E(W_k \mid R_{k-1})$ are bounded by $\max_j \log o_j - \min_j \log o_j$).

### Asymptotic magnitude (Section 4)

10. **Theorem 2.** For any strategy $\Lambda$ such that $\lim_n S_n / S_n^*$ exists a.s., we have $E[\lim_n S_n / S_n^*] \leq 1$.

    This says no strategy can beat $\Lambda^*$ in expectation even after conditioning on the ratio existing.

11. **Theorem 3.** If $\Lambda$ is a **nonterminating** strategy (no allocation ever sends all wealth to a losing outcome), then a.s.:

$$\sum_{k=1}^{\infty} \bigl[W - E(W_k \mid R_{k-1})\bigr] = \infty \iff \lim_n \frac{S_n^*}{S_n} = \infty.$$

    In words: any persistent deviation from $\Lambda^*$ causes $\Lambda^*$ to become infinitely richer relative to $\Lambda$; conversely, if the cumulative deviation is finite, the ratio $S_n^*/S_n$ converges to a finite limit. Proof uses a supermartingale construction: $S_n / S_n^*$ is a nonneg supermartingale (by the conditional Jensen inequality $E[V_n / V_n^* \mid R_{n-1}] \leq 1$), so $\lim_n S_n / S_n^*$ exists a.s. The divergence/convergence dichotomy follows from the martingale convergence theorem applied to $U_n = \log(S_n^{(M)} / S_n)$ for a truncated strategy $\Lambda_M$.

12. **Corollary 1.** If for some $\Lambda$ the sum $\sum_1^\infty [W - E(W_k \mid R_{k-1})] = \infty$ with positive probability $\gamma > 0$, then for every $\epsilon > 0$ there exists a strategy $\hat{\Lambda}$ with $\varlimsup S_n / \hat{S}_n = 0$ and $\varliminf S_n / \hat{S}_n \leq 1$ except on a set of probability at most $\epsilon$. (One can mimic $\Lambda$ on a large-probability set and switch to $\Lambda^*$ elsewhere.)

### Finite-horizon coin toss (Section 5)

13. For $n$ fixed, $p > 1/2$, $0 < \xi < 1$, find the strategy maximizing $\phi_n(\xi) = \sup_\Lambda P\{S_n \geq 1 \mid S_0 = \xi\}$. The Bellman equation is:

$$\hat{\phi}_n(\xi) = \sup_{0 \leq z \leq \xi} \bigl[p\, \hat{\phi}_{n-1}(\xi + z) + q\, \hat{\phi}_{n-1}(\xi - z)\bigr],$$

with $\hat{\phi}_0(\xi) = \mathbf{1}_{\{\xi \geq 1\}}$. Breiman shows the solution partitions $[0,1]$ into $2^n$ intervals with lengths proportional to the binomial coefficients $\binom{n}{k}$; the optimal value function is the corresponding partial sum of the ranked binomial probabilities.

14. **Theorem 4.** $\lim_n \sup_\xi |\phi_n(\xi) - \phi_n^*(\xi)| = 0$, where $\phi_n^*$ is the value under $\Lambda^*$ (bet fraction $p - q$ every round). Proof uses the CLT and Blackwell--Hodges tail estimates. In the coin-toss game $\Lambda^*$ is therefore uniformly asymptotically optimal even for the finite-horizon max-probability criterion.

15. An open conjecture is stated for the finite expected-time problem: there exists a threshold $\xi_0 \in (0,1)$ such that the optimal strategy bets to reach fortune 1 whenever current wealth $\geq \xi_0$, and uses $\Lambda^*$ otherwise.

## Domain of applicability

**Where it applies.**
- IID repeated games with known probability distribution and fixed odds. The central object $W(\bar{\lambda})$ and the optimality of $\Lambda^*$ carry over directly to any setting where returns are iid and the investor chooses portfolio weights on a simplex (this is the bridge to the Kelly criterion in finance).
- The time-minimization result (Theorem 1) requires the nonlattice condition on $W_k^*$, which holds generically but can fail for specially chosen odds/probabilities.

**Where it breaks or requires caution.**
- **IID assumption is critical.** The entire machinery (SLLN for $\log S_n^*$, renewal theory for the overshoot, Wald's identity) depends on independence across rounds. Serial dependence invalidates the results as stated; extensions require ergodic theory (Algoet--Cover 1988).
- **Known distribution.** $\Lambda^*$ requires knowledge of $(p_1, \dots, p_s)$. Estimation error can cause the plug-in Kelly bet to overbet, leading to ruin in finite samples. The paper does not address estimation.
- **Divisibility and frictionlessness.** Wealth is assumed infinitely divisible; no transaction costs, no discrete lot sizes.
- **Log-optimality vs. utility.** $\Lambda^*$ maximizes expected log-growth, not expected utility for general $u$. The magnitude result (Theorem 2) says $\Lambda^*$ cannot be beaten on average in the ratio sense, but for a risk-averse agent with finite horizon the Kelly fraction may be too aggressive. Breiman does not overclaim here -- the criteria are clearly stated -- but practitioners routinely misapply the result to settings where the long-run a.s. dominance is irrelevant.
- **Finite-horizon results are limited to the binary (coin-toss) game.** The dynamic-programming analysis of Section 5 does not extend easily to $s > 2$ outcomes.
- The paper acknowledges that Dubins and Savage (1956) independently developed the fractional-betting framework for unfavorable and fair games; the novelty here is the systematic treatment of favorable games under the two asymptotic criteria and the identification of $\Lambda^*$ via the growth-rate function $W$.
