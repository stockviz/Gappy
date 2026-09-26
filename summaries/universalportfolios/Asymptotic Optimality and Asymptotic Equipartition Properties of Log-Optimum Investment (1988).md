# Asymptotic Optimality and Asymptotic Equipartition Properties of Log-Optimum Investment
**Authors:** Paul H. Algoet, Thomas M. Cover
**Year:** 1988
**Journal/Venue:** *Annals of Probability*, Vol. 16, No. 2, pp. 876--898

## Problem statement

Breiman (1960, 1961) proved that the log-optimal (Kelly) portfolio is asymptotically optimal among all strategies when returns $\{X_t\}$ are i.i.d. This paper asks: does log-optimal investment remain asymptotically optimal, and does an asymptotic equipartition property (AEP) hold for capital growth, when the return process is *arbitrarily distributed* --- in particular, when it is non-i.i.d., non-Markov, and possibly nonstationary?

More precisely: if at each period $t$ one selects the portfolio $b_t^*$ that maximizes conditional expected log return given all available past information, does any competing strategy $\{b_t\}$ satisfy
$$\limsup_n n^{-1}\log(S_n / S_n^*) \le 0 \quad \text{a.s.},$$
and does $n^{-1}\log S_n^*$ converge to a deterministic rate when the market is stationary ergodic?

## Approach (short)

The paper proves, without distributional assumptions on the return process, that myopic maximization of conditional expected log return is asymptotically optimal: the ratio $S_n/S_n^*$ of any competitor's wealth to the log-optimal wealth is a nonnegative supermartingale converging a.s., so no strategy can beat log-optimal growth exponentially. Under stationary ergodicity, a sandwich argument between finite-order Markov approximations and the infinite-past portfolio yields an AEP: $n^{-1}\log S_n^* \to \overline{W}_\infty^*$ a.s., the maximum expected log return given the infinite past.

## Approach (detailed)

### 1. Setup and notation

An investor allocates unit capital across $m$ assets at each period $t = 0, 1, \ldots$ via a portfolio vector $b_t \in \mathscr{B} = \{b \in \mathscr{R}_+^m : \sum_j b^j = 1\}$. The return vector is $X_t = (X_t^1, \ldots, X_t^m) \ge 0$, and wealth after $n$ periods is

$$S_n = \prod_{0 \le t < n} (b_t, X_t), \qquad (b, X) = \sum_j b^j X^j.$$

The portfolio $b_t$ is $\mathscr{F}_t$-measurable, where $\mathscr{F}_t = \sigma(X_0, \ldots, X_{t-1})$ encodes the past. No distributional assumptions on $\{X_t\}$ are imposed at this stage.

### 2. Log-optimality: definition and Kuhn--Tucker characterization

**Definition.** A portfolio $b^*$ is *log-optimum* for distribution $P$ of $X$ if

$$E\!\left[\log\!\left(\frac{(b, X)}{(b^*, X)}\right)\right] \le 0, \quad \forall\, b \in \mathscr{B}. \tag{15}$$

Equivalently, $b^*$ attains $w^* = \sup_{b \in \mathscr{B}} E\{\log(b, X)\}$.

**Theorem 1 (KKT conditions, from Bell--Cover 1980).** Let $\alpha(b) = E\{X/(b,X)\}$ be the expected score vector. Then $b^*$ is log-optimum iff the expected score satisfies

$$(b, \alpha^*) = E\!\left[\frac{(b, X)}{(b^*, X)}\right] \le 1, \quad \forall\, b \in \mathscr{B}, \tag{18}$$

where $\alpha^* = \alpha(b^*)$. Equivalently, $\alpha^{*j} \le 1$ for all $j$, with equality when $b^{*j} > 0$.

*Proof sketch.* Convex combination $b_\lambda = \bar\lambda b^* + \lambda b$ gives $(b_\lambda, X)/(b^*, X) = 1 + \lambda Z$ where $Z = (b,X)/(b^*,X) - 1$. The inequality $\log(1+\lambda Z) \ge \lambda(Z \wedge a) - \frac{1}{2}\theta\lambda^2(Z\wedge a)^2$ and dominated convergence show $dw(b_\lambda)/d\lambda|_{\lambda=0+} = E\{Z\} = (b, \alpha^*) - 1 \le 0$. Sufficiency follows from strict concavity of $\log$.

### 3. Decomposition of expected log return

Fix a reference portfolio $\beta$ with all $\beta^j > 0$. Define the scaled return $U = X/(\beta, X)$ living on the simplex $\mathscr{U}$, and let $Q$ be the distribution of $U$ induced by $P$. Then

$$w^*(P) = r(P) + w^*(Q), \tag{24}$$

where $r(P) = E_P\{\log(\beta, X)\}$ is a reference level depending only on $P$ (and affine in $P$), and $w^*(Q) = \sup_b E_Q\{\log(b, U)\} \ge 0$ depends on $P$ only through the marginal $Q$. This decomposition separates the inherent market return from the portfolio selection problem.

**Theorem 2.** The function $w^*(Q)$ is convex, bounded between 0 and $\max_j(-\log\beta^j)$, and uniformly continuous on $\mathscr{Q}$ (weak topology). The set of log-optimum portfolios $B^*(Q)$ is a nonempty compact convex subset of $\mathscr{B}$; a measurable selection $b^*(Q) \in B^*(Q)$ exists for all $Q$.

**Theorem 3.** The graph $\mathrm{Gr}(B^*) = \{(Q, b^*): b^* \in B^*(Q)\}$ is closed in $\mathscr{Q} \times \mathscr{B}$. Any selection $Q \mapsto b^*(Q)$ is continuous at every $Q$ where $B^*(Q)$ is a singleton.

### 4. Martingale properties (Theorem 4)

Let $\{\bar{\mathscr{F}}_t\}_{0 \le t < \infty}$ be an increasing sequence of sub-$\sigma$-fields with limit $\bar{\mathscr{F}}_\infty \subseteq \mathscr{F}$, and let $\bar{P}_t$ be a regular conditional distribution of $X$ given $\bar{\mathscr{F}}_t$. Key results:

**(a)** $\bar{P}_t \to \bar{P}_\infty$ weakly a.s.

**(b)** The log-optimum portfolio $\bar{b}_t^* = b^*(\bar{P}_t)$ is $\bar{\mathscr{F}}_t$-measurable, $(\bar{b}_t^*, X) \to (\bar{b}_\infty^*, X)$ a.s., and $\log(\bar{b}_t^*, X) \to \log(\bar{b}_\infty^*, X)$ a.s.

**(c)** The maximum conditional expected log return $\bar{w}_t^* = w^*(\bar{P}_t) = \sup_{b} \mathbf{E}\{\log(b,X)|\bar{\mathscr{F}}_t\}$ satisfies

$$\bar{w}_t^* \to \bar{w}_\infty^* \quad \text{a.s. (and in } L^1 \text{ if } \bar{W}_\infty^* < \infty). \tag{29}$$

**(d)** $\bar{W}_t^* = \mathbf{E}\{\bar{w}_t^*\} \nearrow \bar{W}_\infty^*$.

Furthermore, $\{\bar{w}_t^*, \bar{\mathscr{F}}_t\}$ is a submartingale. The proof uses Levy's martingale convergence theorem applied to the decomposition $\bar{w}_t^* = \bar{r}_t + w^*(\bar{Q}_t)$, where $\bar{r}_t$ is a martingale and $w^*(\bar{Q}_t)$ is lower semicontinuous and nonnegative.

### 5. Asymptotic optimality principle (Theorem 5)

**Theorem 5.** Let $\{X_t\}_{0 \le t < \infty}$ be defined on a perfect probability space. Let $S_n^* = \prod_{0 \le t < n}(b_t^*, X_t)$ (log-optimum) and $S_n = \prod_{0 \le t < n}(b_t, X_t)$ (any competing strategy). Then $\{S_n/S_n^*, \mathscr{F}_n\}_{0 \le n < \infty}$ is a nonnegative supermartingale converging a.s. to a random variable $Y$ with $\mathbf{E}\{Y\} \le 1$, and

$$\limsup_n n^{-1}\log(S_n/S_n^*) \le 0 \quad \text{a.s.} \tag{39}$$

*Thus $S_n < \exp(n\varepsilon)S_n^*$ eventually for every $\varepsilon > 0$: no strategy can exceed log-optimal growth by an amount growing exponentially.*

**Proof.** The ratio $S_n/S_n^* = \prod_{t<n}(b_t, X_t)/(b_t^*, X_t)$ is a nonnegative supermartingale by the KKT condition $\mathbf{E}\{(b_t, X_t)/(b_t^*, X_t)|\mathscr{F}_t\} \le 1$. It converges a.s. to $Y \ge 0$ with $\mathbf{E}\{Y\} \le 1$. Markov's inequality and Borel--Cantelli give $(39)$: for $r_n = e^{n\varepsilon}$, $\mathbf{P}\{S_n/S_n^* \ge r_n\} \le r_n^{-1}$, which is summable.

The maximal inequality for nonneg. supermartingales also yields the finite-sample bound

$$\mathbf{P}\!\left\{\sup_n S_n/S_n^* \ge \lambda\right\} \le 1/\lambda. \tag{40}$$

### 6. Asymptotic equipartition property (Theorems 6--8)

**Theorem 6 (AEP, stationary ergodic case).** If $\{X_t\}$ is stationary ergodic, then under the log-optimum strategy,

$$n^{-1}\log S_n^* \to \overline{W}_\infty^* = W^*(X_0 | X_{-1}, X_{-2}, \ldots) \quad \text{a.s.}, \tag{42}$$

where $\overline{W}_\infty^* = \lim_t W^*(X_0 | X_{-1}, \ldots, X_{-t})$ is the maximum expected log return given the infinite past.

**Proof (sandwich argument).** Define $k$-th order Markov approximation portfolios $b_t^{(k)}$ that are log-optimum given only $(X_{t-k}, \ldots, X_{t-1})$, and infinite-past portfolios $b_t^{(\infty)}$ log-optimum given $(\ldots, X_{t-2}, X_{t-1})$. The corresponding capital growths satisfy, by the asymptotic optimality principle (Theorem 5),

$$\limsup_n n^{-1}\log(S_n^{(k)}/S_n^*) \le 0 \quad \text{and} \quad \limsup_n n^{-1}\log(S_n^*/S_n^{(\infty)}) \le 0 \quad \text{a.s.}$$

By the ergodic theorem, $n^{-1}\log S_n^{(k)} \to W_k^*$ and $n^{-1}\log S_n^{(\infty)} \to \overline{W}_\infty^*$ a.s. Thus

$$W_k^* \le \liminf_n n^{-1}\log S_n^* \le \limsup_n n^{-1}\log S_n^* \le \overline{W}_\infty^* \quad \text{a.s.} \tag{52}$$

Since $W_k^* \nearrow \overline{W}_\infty^*$ as $k \to \infty$ (Theorem 4), the sandwich closes.

**Theorem 7 (AEP with integrability condition).** If the market is stationary ergodic and $\mathbf{E}\{\log(\beta, X_0)|\bar{\mathscr{F}}_\infty\}$ belongs to $L\log L$, then the *hypothetical* capital $\hat{S}_n^* = \prod \exp[\mathbf{E}\{\log(b_t^*, X_t)|\mathscr{F}_t\}]$ also satisfies an AEP: $n^{-1}\log \hat{S}_n^* \to \overline{W}_\infty^*$ a.s. and in $L^1$.

**Theorem 8 (stationary, not necessarily ergodic).** If the market is (merely) stationary, the same AEP holds:
$$n^{-1}\log S_n^* \to \mathbf{E}\{\log(\bar{b}_\infty^*, X_0)|\mathscr{J}\} \quad \text{a.s.},$$
where $\mathscr{J}$ is the invariant $\sigma$-field. This extends to asymptotically mean stationary markets provided $n^{-1}\log S_{k_n}^* \to 0$ a.s. for some $k_n/n \to 0$.

### 7. Connection to information theory (Section 8)

In the horse-race market (exactly one stock pays off), the scaled return $U$ is an extreme point of $\mathscr{U}$. If horse $j$ wins with probability $q^j$, the log-optimum portfolio bets proportionally: $b^j = q^j$ (Kelly criterion). The maximum expected log return of the scaled outcome equals the KL divergence from the reference portfolio to the true probabilities:

$$w^*(Q) = D(q \| \beta) = \sum_j q^j \log(q^j / \beta^j). \tag{58}$$

Setting $\beta = (1/m, \ldots, 1/m)$ gives $w^*(Q) = \log m - \mathscr{H}(q)$, where $\mathscr{H}(q)$ is Shannon entropy. The AEP for capital growth then reduces to the Shannon--McMillan--Breiman theorem. More generally, if densities $q/p$ are taken with respect to a stationary ergodic reference, the growth rate of the likelihood ratio is bounded by the relative entropy rate, and the AEP for investment generalizes the generalized Shannon--McMillan--Breiman theorem.

**Theorem 9.** $w^*(Q)$ is monotonically decreasing in the Choquet (dilation) order on the space of distributions on $\mathscr{U}$. Less dispersed returns yield higher maximum expected log return, and the bounds

$$0 \le \min_j(-\log q^j) = h^*(\delta_\mu) \le h^*(Q) = \log m - w^*(Q) \le h^*(\pi_\mu) = \mathscr{H}(q) \tag{62--63}$$

interpolate between the concentrated and maximally dilated cases.

## Domain of applicability

**Where it applies:**

- Arbitrary (non-i.i.d., non-Markov, nonstationary) return processes for the asymptotic optimality principle (Theorem 5). This is the paper's strongest and most general result.
- Stationary ergodic markets for the AEP (Theorem 6). Extends to merely stationary (Theorem 8) and asymptotically mean stationary (Section 7) markets.
- Any finite number of assets $m$.
- The only structural requirement is a perfect probability space (needed for regular conditional distributions).

**Where it breaks or requires caution:**

- *Log utility is essential.* The asymptotic optimality is specific to the growth-rate criterion $n^{-1}\log S_n$. It does not extend to other utility functions without additional arguments (cf. Samuelson's (1971) critique of maximizing geometric mean for finite horizons).
- *Nonnegative returns assumed.* The framework requires $X^j \ge 0$ (gross returns). This excludes direct modeling of strategies with unbounded losses, short-selling, or leverage beyond the long-only simplex.
- *No borrowing.* Portfolios lie in the unit simplex $\mathscr{B}$. The results do not cover leveraged or short portfolios.
- *Conditional distribution must be known* for the log-optimal portfolio to be computed. The paper characterizes what is optimal given knowledge of the true conditional distribution $P_t$. In practice, this distribution is unknown and must be estimated, so the theorems describe an *ideal benchmark* rather than a directly implementable strategy.
- *Rate of convergence is unspecified.* Theorem 5 shows $n^{-1}\log(S_n/S_n^*) \to 0$ a.s. but gives no finite-$n$ rates. The bound $\mathbf{P}\{\sup_n S_n/S_n^* \ge \lambda\} \le 1/\lambda$ is distribution-free but loose.
- *The AEP requires stationarity (or asymptotic mean stationarity).* For genuinely nonstationary markets, the growth rate need not converge to a constant. The asymptotic optimality principle still holds, but there is no ergodic limit to converge to.
- *The connection to the Shannon--McMillan--Breiman theorem* is exact only in the horse-race (one-hot return) case. For general continuous-valued returns, the parallel is structural rather than a literal reduction.

**What is genuinely novel vs. known technique:**

- Breiman (1960, 1961) established asymptotic optimality and the AEP for i.i.d. returns. This paper removes the i.i.d. assumption entirely for asymptotic optimality, and replaces it with stationary ergodicity for the AEP. This is the core contribution.
- The supermartingale structure of $S_n/S_n^*$ and its use via Borel--Cantelli was implicit in the i.i.d. case; making it the central proof device for the general case is clean and effective.
- The sandwich argument for the AEP (bounding the log-optimal growth between $k$-th order Markov and infinite-past strategies, then letting $k \to \infty$) is the main technical innovation, drawing on the companion paper Algoet and Cover (1988) for the generalized Shannon--McMillan--Breiman theorem.
- The KKT conditions (Theorem 1) are from Bell and Cover (1980). The topological results on $w^*(Q)$ and measurable selection of $b^*(Q)$ (Theorems 2--3) are new but use standard tools (Berge's theorem, Kuratowski--Ryll-Nardzewski).
- The information-theoretic interpretation (Section 8) and the Choquet-order monotonicity (Theorem 9) provide elegant connections but are secondary to the main results.
