# Universal Schemes for Prediction, Gambling and Portfolio Selection
**Authors:** Paul H. Algoet
**Year:** 1992
**Journal/Venue:** *The Annals of Probability*, Vol. 20, No. 2, pp. 901--941

## Problem statement

Consider a stationary ergodic market with unknown distribution. A gambler (or investor) observes a sequence of outcomes and must place bets (or select portfolios) using only past data, without knowledge of the underlying probability law. Three nested problems are posed:

1. **Universal gambling** (Problem 1): Find a computable betting scheme $\hat{P}(j_t | j^t)$ on a finite-valued stationary ergodic process $\{J_t\}$ such that compounded wealth grows at the same limiting rate as if the true conditional probabilities $P(j_t | J^-)$ were known:
$$\frac{1}{n}\log\bigl[m^n \hat{P}(J^n)\bigr] \to \bigl[\log m - H(J|J^-)\bigr] \quad \text{a.s.}$$

2. **Universal prediction** (Problem 2): Find a computable function $\hat{P}(j | j^{-t})$ that consistently estimates the conditional distribution of the next outcome given the past, i.e., $\hat{P}(j|J^{-t}) \to P(j|J^-)$ a.s. for all $j$, for any stationary ergodic $\{J_t\}$.

3. **Universal portfolio selection** (Problem 3): Find a nonanticipating portfolio strategy $\{\hat{b}_t\}$ for a stationary ergodic market $\{X_t\}$ with unknown distribution such that compounded capital $\hat{S}_n = \prod_{0 \le t < n}(\hat{b}_t, X_t)$ grows at the maximum rate $W(X|X^-)$ a.s.

The paper asks whether these three problems can be solved without any distributional knowledge, and what the structural connections among them are.

## Approach (short)

The paper constructs universal schemes for all three problems using a single device: mixing over parametric families. For gambling, a universal prediction scheme (such as Ornstein's) is regularized by blending with a uniform bet; countably many such blended schemes, indexed by the regularization parameter $\lambda_k \nearrow 1$, are combined via a bookkeeping argument (splitting capital into accounts) to achieve the optimal growth rate. For portfolio selection, the same architecture applies: empirical estimates of the conditional distribution of returns are used to select log-optimum portfolios, which are then regularized and combined across growing memory depths. The key theoretical tools are the asymptotic optimality principle (AOP) of Algoet and Cover (1988) and Breiman's generalized ergodic theorem.

## Approach (detailed)

### 1. Framework and optimality benchmark

Let $\{J_t\}$ take values in $\{1, \ldots, m\}$ with distribution $P$ on the $m$-ary sequence space. A gambling scheme $Q(j_t | j^t)$ assigns conditional bets; compounded wealth after $n$ rounds is $S_n = m^n Q(J^n)$ where $Q(J^n) = \prod_{0 \le t < n} Q(J_t | J^t)$. The ratio $Q(J^n)/P(J^n)$ is a nonnegative supermartingale with $E\{Q(J^n)/P(J^n)\} \le 1$, since $\sum_{j_t} Q(j_t|j^t) \le 1$.

**Lemma 2 (Algoet--Cover).** If $\{S_n\}$ and $\{S_n^*\}$ are positive random variables with $E\{S_n/S_n^*\} \le 1$ for all $n$, then
$$\limsup_n \frac{1}{n}\log\frac{S_n}{S_n^*} \le 0 \quad \text{a.s.}$$

*Proof.* Markov's inequality gives $P(n^{-1}\log(S_n/S_n^*) \ge \varepsilon) \le e^{-n\varepsilon}$; Borel--Cantelli closes. $\square$

If $\{J_t\}$ is stationary ergodic, the Shannon--McMillan--Breiman theorem gives the benchmark: $(1/n)\log[m^n P(J^n)] \to \log m - H(J|J^-)$ a.s., where $H(J|J^-) = E\{-\log P(J|J^-)\}$ is the conditional entropy rate.

### 2. Universal gambling via regularized prediction

**Definition.** For any betting scheme $Q$ and $0 \le \lambda < 1$, define the regularized scheme
$$Q^\lambda(j) = (1-\lambda)\frac{1}{m} + \lambda Q(j), \quad 1 \le j \le m. \tag{19}$$

This ensures a minimum bet of $(1-\lambda)/m$ on every outcome, preventing bankruptcy.

**Theorem 1.** Let $\hat{P}(j|j^{-t})$ be Ornstein's universal prediction scheme. If $\{J_t\}$ is stationary ergodic with distribution $P$, then the growth exponent of the regularized scheme $\hat{P}^\lambda$ is
$$\frac{1}{n}\log\bigl[m^n \hat{P}^\lambda(J^n)\bigr] \to \bigl[\log m - H^\lambda(J|J^-)\bigr] \quad \text{a.s.}, \tag{21}$$
where $H^\lambda(J|J^-) = E\{-\log P^\lambda(J|J^-)\}$.

*Proof sketch.* The random variables $\hat{g}_t^\lambda = -\log \hat{P}^\lambda(J|J^{-t})$ are bounded (between 0 and $\log[m/(1-\lambda)]$) and converge a.s. to $g^\lambda = -\log P^\lambda(J|J^-)$. Breiman's extended ergodic theorem yields $(1/n)\sum \hat{g}_t^\lambda \circ T^t \to E\{g^\lambda\}$ a.s. $\square$

Note $H^\lambda(J|J^-) \to H(J|J^-)$ as $\lambda \nearrow 1$ (eq. 23), so the maximum growth rate is approached to within $\varepsilon = \log(1/\lambda)$.

**Theorem 2 (Universal gambling scheme).** There exists a gambling scheme $\hat{P}(j_t|j^t)$ that is universal: for any stationary ergodic $\{J_t\}$,
$$\frac{1}{n}\log\bigl[m^n \hat{P}(J^n)\bigr] \to \bigl[\log m - H(J|J^-)\bigr] \quad \text{a.s.} \tag{24}$$

*Proof.* Divide initial wealth into countably many accounts indexed by $k$, with weights $\mu_k > 0$, $\sum_k \mu_k = 1$. Manage account $k$ according to strategy $Q^{\lambda_k}$ with $\lambda_k \nearrow 1$. By Theorem 1, each account grows at rate $\log m - H^{\lambda_k}(J|J^-)$. Total wealth $m^n \hat{P}(J^n) = \sum_k \mu_k [m^n Q^{\lambda_k}(J^n)]$ satisfies $\hat{S}_n \ge \mu_k \hat{S}_n^{\lambda_k}$ for all $k$, so
$$\liminf_n \frac{1}{n}\log \hat{S}_n \ge \sup_k \bigl[\log m - H^{\lambda_k}(J|J^-)\bigr] = \log m - H(J|J^-).$$
The reverse inequality follows from the supermartingale upper bound (Lemma 2). $\square$

**Remark 1.** A universal gambling scheme can be constructed *without* a universal prediction scheme, using instead empirical frequency estimates $\hat{P}_t(j|J^{-k})$ of the block conditional $P(j|J^{-k})$, with the specific form:
$$\hat{P}_t(j|J^{-k}) = \frac{\delta_{j_0}(j) + c_t(j|J^{-k})}{1 + c_t(J^{-k})},$$
where $c_t(j|J^{-k})$ counts past occurrences of symbol $j$ following the block $J^{-k}$, with an arbitrary default $j_0$.

### 3. Connection to universal modeling and data compression

**Modeling schemes.** A modeling scheme $Q(j^n)$ assigns a subprobability to each sequence $j^n$, with $\sum_{j^n} Q(j^n) \le 1$. It is equivalent to assigning codeword length $l(j^n) = \lceil -\log_2 Q(j^n) \rceil$ via the Kraft inequality.

**Theorem 3 (ML structure).** For a structure function $f$ defining contexts $z_t = f(j^t)$, the modeling scheme minimizing $-\log Q(j^n)$ (equivalently, maximizing likelihood) sets $Q(j|z) = \hat{P}_n(j|z) = c_n(j|z)/c_n(z)$, the empirical conditional distribution. The minimum per-symbol codeword length equals the empirical conditional entropy $\hat{H}^{(n)}(J|Z)$.

**Theorem 4.** For any modeling scheme $Q(j^n)$ and any random process $\{J_t\}$ with distribution $P$,
$$\limsup_n \frac{1}{n}\log\frac{Q(J^n)}{P(J^n)} \le 0 \quad \text{a.s.}$$
This is a direct consequence of Lemma 2. It implies the entropy rate is a lower bound on the noiseless compressibility of a stationary ergodic source (Corollary 1).

**Theorem 5 (Universal modeling scheme exists).** Mixing $k$-th order Markov modeling schemes $Q_k(j^n)$ with weights $\mu_k > 0$ yields a universal modeling scheme: $-(1/n)\log Q(J^n) \to H(J|J^-)$ a.s.

The paper observes that universal gambling, universal modeling, and universal data compression are essentially equivalent: any universal gambling scheme defines a universal modeling scheme (and vice versa), and universal compression algorithms (Ziv--Lempel, arithmetic coding) yield universal gambling schemes.

### 4. The Ziv--Lempel algorithm as a universal gambling scheme

**Theorem 6.** The gambling scheme $\hat{P}(j|J^n)$ derived from Rissanen's interpretation of the Ziv--Lempel incremental parsing algorithm is universal. Specifically, the Ziv--Lempel tree $T_n$ partitions the past into contexts $z_n = f(J^n)$. In the completed tree $\bar{T}_n$, the number of leaves in subtrees rooted at $z_n$ and its $j$-th child are:
$$\gamma_n(z_n) = 1 + (m-1)(c_n(z_n)+1), \quad \gamma_n(j|z_n) = 1 + (m-1)(c_n(j|z_n)+1).$$
The bet is proportional to the leaf count:
$$\hat{P}(j|J^n) = \frac{\gamma_n(j|z_n)}{\gamma_n(z_n)} = \frac{m + (m-1)c_n(j|z_n)}{m + (m-1)c_n(z_n)}. \tag{54}$$

*Proof.* The upper bound $-(1/n)\log \hat{P}(J^n) \le H(J|J^-)$ a.s. follows from Corollary 1 (Kraft inequality plus AOP). For the matching lower bound, the product over phrases telescopes: $\hat{P}(J^n) \ge \prod_{i=1}^{\nu_n}[1+(m-1)i]^{-1}$, giving $-\log \hat{P}(J^n) = \log \nu_n! + \mathscr{O}(\nu_n \log \nu_n)$. Since Wyner--Ziv (1990) and Cover--Thomas (1991) show $\log \nu_n! = \mathscr{O}(\nu_n \log \nu_n)$ and $\limsup (1/n)\log \nu_n! \le H(J|J^-)$ a.s., both bounds match. $\square$

### 5. Universal portfolio selection

**Setup.** The market is modeled by return vectors $X_t = (X_t^1, \ldots, X_t^m) \ge 0$ with $P(X_t = 0) = 0$ a.s. A portfolio $b_t \in \mathscr{B}$ (unit simplex) yields single-period return $(b_t, X_t) = \sum_j b_t^j X_t^j$. Compounded capital: $S_n = \prod_{0 \le t < n}(b_t, X_t)$.

**Log-optimum benchmark.** A portfolio $b^*$ is log-optimum for $P$ if $E\{\log(b,X)/(b^*,X)\} \le 0$ for all $b \in \mathscr{B}$ (Kuhn--Tucker conditions, Bell--Cover 1980). The maximum growth exponent is $W(P) = E\{\log(b^*, X)\}$. With dependent returns, the conditionally log-optimum portfolio $b_t^*$ maximizes $E\{\log(b, X_t)|X^t\}$. The AOP (eq. 60) holds without distributional assumptions:
$$\text{AOP:} \quad \limsup_n \frac{1}{n}\log\frac{S_n}{S_n^*} \le 0 \quad \text{a.s.}$$

**AEP for portfolios.** If the market is stationary ergodic, $n^{-1}\log S_n^* \to W(X|X^-)$ a.s., the maximum growth exponent given the infinite past (eq. 68), by a sandwich between $k$-past and infinite-past log-optimum strategies.

**Theorem 7 (Universal portfolio selection with prediction).** If the market is safe (i.e., $E\{\log X^j\} > -\infty$ for all $j$) and $\hat{P}(dx_t|X^t)$ is an estimate converging weakly a.s. to $P(dx|X^-)$, then the portfolio $\hat{b}_t^*$ that is log-optimum for $\hat{P}$ yields
$$\frac{1}{n}\log \hat{S}_n^* \to W(X|X^-) \quad \text{a.s.} \tag{73}$$

*Proof.* Since $\hat{P}(dx|X^{-t}) \to P(dx|X^-)$ weakly a.s., any accumulation point of $\{\hat{b}_t^*\}$ is log-optimum for $P(dx|X^-)$ (by continuity results from Algoet--Cover 1988a). The AEP gives the upper bound; Breiman's extended ergodic theorem applied to $\hat{g}_t = \log(\hat{b}_t^*, X) \to g = \log(\bar{b}^*, X)$ a.s. gives the lower bound. $\square$

**Theorem 8 (Regularized universal portfolio).** For a market with unknown stationary ergodic distribution, fix $\beta$ with $\beta^j > 0$ for all $j$, and set $\hat{b}_t^{*\lambda} = (1-\lambda)\beta + \lambda \hat{b}_t^*$. Then
$$\frac{1}{n}\log \hat{S}_n^\lambda \to W^\lambda(X|X^-) \quad \text{a.s.}, \tag{77}$$
where $W^\lambda(X|X^-) = E\{\log(\bar{b}^{*\lambda}, X)\}$ and $\bar{b}^{*\lambda} = (1-\lambda)\beta + \lambda\bar{b}^*$. Since $W^\lambda \nearrow W$ as $\lambda \nearrow 1$, the gap is at most $\varepsilon = -\log\lambda$.

**Theorem 9 (Main result: universal portfolio selection).** There exists a nonanticipating portfolio strategy $\{\hat{b}_t\}$ such that for any stationary ergodic market $\{X_t\}$ with unknown distribution,
$$\frac{1}{n}\log \hat{S}_n \to W(X|X^-) \quad \text{a.s.} \tag{79}$$

*Proof.* Bookkeeping argument identical to Theorem 2: split capital into countably many accounts indexed by $k$, each managed by $\{\hat{b}_t^{*\lambda_k}\}$ with $\lambda_k \nearrow 1$. Total capital dominates each account, so $\liminf \ge \sup_k W^{\lambda_k} = W(X|X^-)$. The AOP gives $\limsup \le W(X|X^-)$. $\square$

**Section 4.3 (Simpler approach).** An alternative universal portfolio scheme avoids prediction entirely. For each $k \ge 0$, fix a finite subfield $\mathscr{F}^{-k}$ of $\sigma(X^{-k})$, and construct empirical estimates $\hat{P}_s(dx|\mathscr{F}^{-t})$ of $P(dx|\mathscr{F}^{-t})$ based on past data $X^{-k-s}$, which converge weakly a.s. as $s \to \infty$ by the ergodic theorem. The log-optimum portfolio for $\hat{P}_s$ and the regularization/bookkeeping construction yield universality.

**Remark 4 (Cover 1991).** Cover's universal portfolio, which averages wealth over all constant portfolios $b \in \mathscr{B}$ with respect to Lebesgue measure ($\hat{S}_n = \int_\mathscr{B} S_n(b)\,db / \int_\mathscr{B} db$), makes no statistical assumptions on $\{X_t\}$ (not even stationarity) but achieves only the weaker benchmark: the maximum growth rate achievable by *constant rebalancing* to a fixed portfolio. Algoet's scheme achieves the strictly stronger benchmark $W(X|X^-)$, which allows time-varying portfolios depending on the infinite past, but requires stationary ergodicity.

### 6. Universal prediction scheme (Section 5)

**Ornstein's algorithm (finite $\mathscr{X}$, Theorem 10).** The algorithm generates estimates $\hat{P}_k = \hat{P}_{s_k}(\cdot|J^{-\sigma_k})$ that converge a.s. to $P(\cdot|J^-)$. It works in phases $k = 1, 2, \ldots$: in each phase, it searches for the smallest time $n$ and certificate $(s_i)_{0 \le i \le K}$ such that all empirical estimates $\hat{P}_{s_i}(\cdot|J^{-t})$ for $s_0 \le t \le s_{i-1}$ are well-defined, within $\varepsilon/2$ of $P(\cdot|J^-)$, and within $\varepsilon_k$ of each other. The stopping time $\sigma_k$ grows, and the estimate $\hat{P}_k$ is the empirical distribution at that stopping time.

**Generalization to Polish spaces (Section 5.2, Theorem 11).** When $\{X_t\}$ takes values in a Polish space $\mathscr{X}$, Ornstein's algorithm is adapted by replacing pointwise convergence of probabilities with weak convergence. Empirical estimates take the form
$$\hat{P}_s(dx|\mathscr{F}^{-t}) = \frac{\delta_{\xi_0}(dx) + \sum_{\tau \in I_s^{-t}} \delta_{X_{-\tau}}(dx)}{1 + \|I_s^{-t}\|}, \tag{101}$$
where $I_s^{-t} = \{\tau: 1 \le \tau \le s,\; T^{-\tau}\omega \text{ and } \omega \text{ belong to the same atom of } \mathscr{F}^{-t}\}$. A convergence-determining sequence of bounded continuous functions $\{h_\kappa\}$ replaces sup-norm closeness. Lemma 5 (the Polish-space generalization of Lemma 3) establishes that certificates exist a.s., and Lemma 6 bounds the probability of "bad" events $B_{\alpha K}^l(h)$ exponentially in $l$: $P\{B_{\alpha K}^l(h)\} \le (1 - \alpha/(\max - \min))^l$.

## Domain of applicability

**Where it applies:**

- All three universality results (gambling, prediction, portfolio selection) hold for any stationary ergodic source or market with unknown distribution, over a finite alphabet (gambling/prediction) or $\mathbb{R}_+^m$-valued returns (portfolios). The prediction result generalizes to Polish-valued stationary ergodic processes.
- The portfolio result (Theorem 9) achieves the strongest possible benchmark, $W(X|X^-)$, which is the growth rate of an investor with full knowledge of the conditional distribution given the infinite past.
- The gambling/compression equivalence holds for finite alphabets and extends the Ziv--Lempel algorithm's optimality from individual sequences to the probabilistic (stationary ergodic) setting.

**Where it breaks or requires caution:**

- *Stationarity and ergodicity are essential.* The universality results do not hold for nonstationary processes. Without ergodicity, the growth rate converges but depends on the invariant $\sigma$-field (not a constant).
- *Computability.* Ornstein's prediction scheme is computable but requires unbounded memory and computation per step (searching for certificates over growing time horizons). The Ziv--Lempel-based gambling scheme is more practical but is specific to finite alphabets.
- *No finite-sample rates.* Convergence is purely asymptotic. The paper gives no quantitative bounds on how fast $n^{-1}\log \hat{S}_n$ approaches $W(X|X^-)$.
- *Safe market assumption.* The portfolio universality (Theorem 7) requires $E\{\log X^j\} > -\infty$ for all $j$. Markets where stocks can go to zero with positive probability require the regularization $\hat{b}_t^{*\lambda} = (1-\lambda)\beta + \lambda\hat{b}_t^*$ to avoid bankruptcy, at a cost of $\varepsilon = -\log\lambda$ in growth rate.
- *Long-only simplex constraint.* Portfolios are constrained to $\mathscr{B}$ (no shorting, no leverage). Extensions to unconstrained portfolio spaces are not addressed.
- *The benchmark $W(X|X^-)$ exceeds the constant-rebalancing benchmark* achieved by Cover (1991), but Cover's result is assumption-free (no stationarity needed). The two results are complementary, not nested.
- *Prediction vs. gambling independence.* A key insight is that universal gambling does *not* require universal prediction (Remark 1, Theorem 2 proof). Empirical frequency counting suffices for gambling, bypassing the harder prediction problem. However, universal portfolio selection with time-varying log-optimum portfolios does require consistent estimation of the conditional distribution (Theorem 7).
