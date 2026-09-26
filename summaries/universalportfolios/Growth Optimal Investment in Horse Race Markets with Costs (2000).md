# Growth Optimal Investment in Horse Race Markets with Costs

**Authors:** Garud N. Iyengar, Thomas M. Cover
**Year:** 2000
**Journal/Venue:** IEEE Transactions on Information Theory, vol. 46, no. 7, November 2000

## Problem statement

Extend the theory of growth-optimal (Kelly) investment to horse race markets with proportional transaction costs. Prior work (Kelly, Breiman, Algoet--Cover) established that the conditionally log-optimum policy maximizes the asymptotic growth rate in frictionless markets, and Cover (1991) constructed a universal portfolio that achieves the same growth rate without knowing the distribution. Policies designed for frictionless markets fail catastrophically when costs are introduced (immediate bankruptcy in continuous time; severe degradation in discrete time). The paper asks: (i) what is the growth-optimal policy and achievable growth rate when each transaction incurs a proportional cost $\lambda_i$ on asset $i$, and (ii) does a universal (distribution-free) policy exist that matches this rate?

## Approach (short)

The authors solve (i) exactly in the i.i.d. horse race setting by showing the conditionally log-optimum policy remains growth-optimal, deriving its explicit form and the growth rate in closed form. For (ii), they construct a universal policy by integrating over the simplex of all stationary Markov strategies and show its wealth tracks the best hindsight wealth to within a polynomial factor, preserving the asymptotic growth rate.

## Approach (detailed)

### Setup and wealth dynamics

1. A horse race market has $m$ assets. In each period exactly one asset pays off at odds $o_i$; the others pay zero. Price relatives are $X_n = o_i e_i$ with probability $p_i$. Transaction costs are proportional: selling \$1 of asset $i$ nets $(1-\lambda_i)$ dollars; buying \$1 of asset $i$ costs $(1+\lambda_i)$ dollars.

2. Portfolio $b \in \mathcal{B} = \{b \in \mathbb{R}^m_+ : \sum_i b(i) = 1\}$. After the $i$-th asset wins, the investor's wealth is concentrated in asset $i$ (portfolio $z_n = e_i$). Rebalancing from $z_n$ to a new portfolio $b_n$ shrinks wealth by a factor $w(b_n, z_n)$ defined implicitly by
$$1 = w + \sum_{i=1}^{m} \lambda_i |w b_n(i) - z_n(i)|.$$
This is the unique nonneg. solution equating initial wealth to final wealth plus total transaction cost.

3. Compounded wealth after $n$ periods:
$$S_n = \prod_{k=1}^{n-1} w(b_k, z_k)\, (b_k^t X_k).$$
The growth rate to be maximized:
$$g = \liminf_{n\to\infty} \frac{1}{n} \boldsymbol{E}\log S_n.$$

### Optimal policy and growth rate (Theorem 1)

4. The conditionally log-optimum policy $\rho^*$ is defined by
$$b_n^* = \arg\max_{b \in \mathcal{B}} \boldsymbol{E}\!\left[\log\!\big(w(b, z_n)\, b^t X\big) \;\big|\; z_n\right].$$
When $z_n = e_i$ (asset $i$ won last period), the optimal portfolio is:
$$b_i^*(j) = \begin{cases} \dfrac{p_i}{p_i + \sum_{\ell \ne i} \frac{1-\lambda_\ell}{1+\lambda_\ell}\, p_\ell}, & j = i, \\[8pt] \dfrac{\frac{1-\lambda_j}{1+\lambda_j}\, p_j}{p_i + \sum_{\ell \ne i} \frac{1-\lambda_j}{1+\lambda_j}\, p_\ell}, & j \ne i. \end{cases}$$
At $n=1$ (free initial allocation), $b_1^* = p$.

5. The policy has a clean operational interpretation: if asset $i$ wins, keep proportion $p_i$ of wealth in asset $i$, sell $(1-p_i)$, and distribute proceeds into the remaining assets proportionally to $\gamma_j p_j$ where $\gamma_j = (1-\lambda_j)/(1+\lambda_j)$. The intent is always the same as in the frictionless case -- place sell-and-buy orders as if there were no costs and accept whatever you get.

6. The optimal growth rate (exact, i.i.d. case):
$$g^* = \underbrace{\sum_{i=1}^m p_i \log(o_i) - H(p)}_{g_0\text{ (frictionless)}} + \sum_{i=1}^m p_i(1-p_i)\log\!\left(\frac{1-\lambda_i}{1+\lambda_i}\right).$$
The loss due to transaction costs is
$$\ell(\lambda) = \sum_{i=1}^m p_i(1-p_i)\log\!\left(\frac{1-\lambda_i}{1+\lambda_i}\right) \le 0,$$
which for small $\lambda_i$ satisfies $\ell(\lambda) \approx -2\sum_i p_i(1-p_i)\lambda_i$. The duality between growth rate and entropy $H(p)$ from the frictionless theory is preserved: costs simply shift the growth rate by a constant.

**Proof sketch (Theorem 1).** Condition on $z_n = e_i$. The self-financing constraint forces the post-cost wealth distribution across assets to have the form of selling fraction $(1-q_i)$ of the winning asset and distributing proceeds. The one-step expected log-wealth decomposes as $\sum p_j \log(o_j) - H(p) - D(p\|q) + \sum_{j\ne i} p_j \log\!\tfrac{1-\lambda_i}{1+\lambda_j}$, where $D(p\|q)$ is the KL divergence. Since $D(p\|q)\ge 0$ with equality iff $q=p$, the optimal $q_i = p_i$, yielding the stated policy and growth rate.

### Optimality theorems (i.i.d. case)

7. **Theorem 2 (a.s. optimality).** $\frac{1}{n}\log S_n^* \to g^*$ with probability 1. Proof is via the law of large numbers applied to i.i.d. terms $\log(w(b_i^*, e_i) b_i^*(j) o_j)$ weighted by empirical frequencies.

8. **Theorem 3 (dominance).** For any admissible policy $\rho$,
$$\limsup_{n\to\infty} \frac{1}{n}\log\frac{S_n^\rho}{S_n^*} \le 0, \quad \text{w.p.\ 1.}$$
Proof: show $\boldsymbol{E}(S_n^\rho / S_n^*) \le 1$ for all $n$ (supermartingale argument), then apply Borel--Cantelli via Markov's inequality.

### Effect of misspecified distribution (Theorem 5)

9. If the investor uses an incorrect distribution estimate $\hat{p}$ instead of the true $p$, the achieved growth rate drops to
$$\hat{g} = g^* - D(p\|\hat{p}).$$
The penalty is the KL divergence $D(p\|\hat{p})$ and does **not** depend on the transaction costs $\lambda_i$. This is exact, not approximate.

### Side information (Theorem 6)

10. With side information $Y_k$ (where $(X_k, Y_k)$ are i.i.d.), the achievable growth rate is $g_Y = g^* + I(X;Y)$, where $I(X;Y)$ is the mutual information.

### Stationary ergodic extension (Theorem 4)

11. For a stationary ergodic horse race $\{X_n : -\infty < n < \infty\}$, the conditionally log-optimum policy becomes
$$b_n^* = \arg\max_{b\in\mathcal{B}} \boldsymbol{E}\!\left[\log\!\big(w(b,z_n)\,b^t X_n\big) \;\big|\; X_1^{n-1}\right],$$
and the maximum growth rate is
$$g^* = \boldsymbol{E}\!\left[\log o(X_0)\,\big|\,X_{-\infty}^{-1}\right] - H\!\left(X_0\,\big|\,X_{-\infty}^{-1}\right) - \boldsymbol{E}\!\left[\log\frac{1-\lambda(X_0)}{1+\lambda(X_0)}\big(1-\delta(X_0,X_{-1})\big)\;\bigg|\;X_{-\infty}^{-1}\right]$$
where $\delta(X_0,X_{-1})=1$ if $X_0 = X_{-1}$ and $0$ otherwise.

### Universal portfolio with costs (Theorem 7)

12. The universal policy $\hat{\rho}$ is constructed by integrating over all stationary first-order Markov policies: policy $\rho$ is described by $m$ portfolio vectors $(b_1^\rho, \ldots, b_m^\rho) \in \mathcal{B}^m$, one for each possible previous winner. The universal policy invests $d\rho / \int_{\mathcal{B}^m} d\rho$ in each such policy and manages pools separately. The resulting wealth and portfolio at time $k$:
$$\hat{S}_k = \frac{\int_{\mathcal{B}^m} S_k^\rho\, d\rho}{\int_{\mathcal{B}^m} d\rho}, \qquad \hat{b}_k = \frac{\int_{\mathcal{B}^m} w_k^\rho\, S_k^\rho\, b_k^\rho\, d\rho}{\int_{\mathcal{B}^m} w_k^\rho\, S_k^\rho\, d\rho}.$$
This is nonanticipating and self-financing.

13. **Theorem 7 (tracking bound).** Let $S_n^*$ be the best hindsight wealth and $\hat{S}_n$ the universal policy wealth. For all $n > n_{\min}$ and every market sequence,
$$\frac{\hat{S}_n}{S_n^*} \ge \frac{e^{-(1+n_{\min})}}{n^{m(m-1)}}$$
where $n_{\min} = 2\lambda_{\max}/(1-\lambda_{\max})$ and $\lambda_{\max} = \max_i \lambda_i$. The cost of universality is only polynomial in $n$ (i.e., subexponential), so $\frac{1}{n}\log(\hat{S}_n/S_n^*) \to 0$. The universal policy achieves the optimal growth rate without knowing the market distribution.

**Proof sketch (Theorem 7).** Fix the best hindsight policy $\rho^*$ and a perturbation $\rho_\alpha = (1-\alpha)\rho^* + \alpha \rho_v$ for a fixed direction $v$. The key steps: (a) bound the one-step repositioning cost $w_n^\alpha \ge (1-\alpha n_{\min}) w_k^*$ using convexity of the cost function; (b) bound the one-step return $W_n^\alpha \ge (1-\alpha)W_k^*$; (c) combine to get $S_n^\alpha \ge (1-\alpha n_{\min})^n (1-\alpha)^n S_n^*$; (d) use Laplace's method on the integral $\hat{S}_n = \int S_n^\rho\, d\rho / \int d\rho$ with $\alpha = 1/n$ to extract a polynomial lower bound; (e) the ratio of volumes contributes the $n^{-m(m-1)}$ factor.

14. **Corollary 1.** The universal policy asymptotically dominates all hindsight-optimal policies:
$$\liminf_{n\to\infty} \frac{1}{n}\log\frac{\hat{S}_n}{S_n^*} \ge 0 \quad \text{for every market sequence.}$$

15. **Corollary 2.** If the market is i.i.d. with maximum achievable growth rate $g$, then $\frac{1}{n}\log \hat{S}_n \to g$ w.p.\ 1.

**Remark 5.** The result extends to first-order Markov markets: $\hat{\rho}$ achieves the maximal growth rate corresponding to the best Markov policy.

## Domain of applicability

- **Exact results (Theorems 1--6):** Require horse race structure (exactly one asset pays off per period; losers pay zero). Returns can be i.i.d. or stationary ergodic. Transaction costs must be proportional and symmetric around cash. The growth rate decomposition and the KL-divergence penalty for misspecification are exact.
- **Universal portfolio (Theorem 7):** Requires horse race structure; holds for arbitrary individual sequences (no distributional assumption). The policy class is restricted to stationary first-order Markov; the bound holds for $\lambda_{\max} < 1$ (and is tightest when $\lambda_{\max} < 1/2$, ensuring $n_{\min} < 1$).
- **General markets:** The proofs exploit the fact that in horse races, the market-opening portfolio $z_n$ is the same for all policies (it depends only on which horse won, not on the investor's holdings). This fails in general markets. The authors state the general i.i.d. discrete-time case is treated in Iyengar (2000, ref [15]) using Markov decision theory.
- **Continuous time:** The small-cost asymptotic $\ell(\lambda) \approx -2\sum p_i(1-p_i)\lambda_i$ differs from continuous-time results (Iyengar [13], Akian et al. [14]), where costs enter as $O(\lambda^{2/3})$ due to the different optimal rebalancing frequency.
