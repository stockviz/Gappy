# Growth Optimal Investment in Horse Race Markets with Costs

**Authors:** Garud N. Iyengar, Thomas M. Cover
**Year:** 2000
**Journal/Venue:** IEEE Transactions on Information Theory, vol. 46, no. 7

## Problem statement

Characterize growth-optimal investment and universal portfolios in horse race markets with proportional transaction costs. Prior work (Kelly, Algoet--Cover, Cover's universal portfolios) assumes frictionless markets; policies designed for that setting can cause immediate bankruptcy in continuous time with costs, and perform poorly in discrete time. The paper asks: (1) what is the growth-optimal policy when the distribution is known? (2) does a distribution-free universal policy exist that matches the best hindsight policy's growth rate?

## Approach (short)

The authors show that conditionally log-optimum investment remains growth-optimal under proportional costs, with the growth rate reduced by a closed-form cost penalty involving the entropy-like term $\sum p_i(1-p_i)\log\!\bigl(\frac{1-\lambda_i}{1+\lambda_i}\bigr)$. They then construct a universal policy by integrating over all stationary Markov strategies (the Cover-style "buy-and-hold the experts" construction), proving it tracks the best hindsight constant-rebalanced strategy to within a polynomial factor.

## Approach (detailed)

**Setup.** A horse race market has $m$ assets; in each period exactly one asset $i$ pays off $o_i$ for 1, the rest pay nothing, with $\boldsymbol{P}(X_n = o_i e_i) = p_i$. Proportional transaction costs: selling \$1 of asset $i$ nets $(1-\lambda_i)$; buying \$1 costs $(1+\lambda_i)$. Cash is the intermediary for all trades. Portfolio $b \in \mathcal{B} = \{b \in \mathbb{R}^m_+ : \sum b(i)=1\}$.

1. **Wealth dynamics with costs.** Rebalancing from opening portfolio $z_n$ to target $b_n$ incurs a cost captured by the factor $w(b_n, z_n) \leq 1$ solving
$$1 = w + \sum_{i=1}^{m} \lambda_i |w\, b_n(i) - z_n(i)|.$$
Compounded wealth after $n$ periods:
$$S_{n+1} = w(b_n, z_n)\,(b_n^\top X_n)\, S_n, \qquad S_n = \prod_{k=1}^{n-1} w(b_k, z_k)\,(b_k^\top X_k).$$
The growth rate is $g = \liminf_{n\to\infty} \frac{1}{n}\boldsymbol{E}\log S_n$.

2. **Log-optimum policy $\rho^*$ (Theorem 1, exact).** The conditionally log-optimum policy at time $n$ chooses
$$b_n^* = \arg\max_{b \in \mathcal{B}} \boldsymbol{E}\!\bigl[\log\bigl(w(b,z_n)\,b^\top X_n\bigr)\,\big|\,z_n\bigr].$$
When $z_n = e_i$ (asset $i$ won), the optimal portfolio is given in closed form:
$$b_i^*(j) = \begin{cases} \dfrac{p_i}{p_i + \sum_{\ell \neq i}\frac{1-\lambda_\ell}{1+\lambda_\ell}\,p_\ell}, & j = i,\\[6pt] \dfrac{\frac{1-\lambda_j}{1+\lambda_j}\,p_j}{p_i + \sum_{\ell \neq i}\frac{1-\lambda_\ell}{1+\lambda_\ell}\,p_\ell}, & j \neq i. \end{cases}$$
Operational interpretation: place sell and buy orders as if there were no costs (proportional to $p$), then accept whatever you get. The frictionless portfolio $p$ lies in the convex hull of the $\{b_i^*\}$.

3. **Optimal growth rate (exact).** The growth rate under $\rho^*$ decomposes as
$$g^* = \underbrace{\sum_{i=1}^m p_i \log(o_i) - H(p)}_{g_0\text{ (frictionless)}} + \sum_{i=1}^m p_i(1-p_i)\log\!\Bigl(\frac{1-\lambda_i}{1+\lambda_i}\Bigr).$$
The second term $l(\lambda) = \sum p_i(1-p_i)\log\!\bigl(\frac{1-\lambda_i}{1+\lambda_i}\bigr) \leq 0$ is the cost of transaction friction. For small $\lambda_i$: $l(\lambda) \approx -2\sum p_i(1-p_i)\lambda_i$.

4. **Almost-sure optimality (Theorem 2).** Under i.i.d. returns, $\frac{1}{n}\log S_n^* \to g^*$ with probability 1 (law of large numbers over transition pairs $(e_i, e_j)$).

5. **Dominance over all policies (Theorem 3).** For any admissible policy $\rho$,
$$\limsup_{n\to\infty} \frac{1}{n}\log\!\Bigl(\frac{S_n^\rho}{S_n^*}\Bigr) \leq 0, \qquad \text{w.p.\ 1}.$$
Proof sketch: show $\boldsymbol{E}(S_n^\rho / S_n^*) \leq 1$ for all $n$ using the conditional optimality of $b_n^*$ and a supermartingale argument; then apply Borel--Cantelli / Markov's inequality.

6. **Extension to stationary ergodic markets (Theorem 4).** For ergodic (not necessarily i.i.d.) horse races, the same log-optimum structure holds with conditional probabilities replacing marginal ones; the growth rate acquires conditional entropy and a $\delta(X_0, X_{-1})$ indicator that turns off transaction costs when consecutive winners coincide.

7. **Effect of distribution misspecification (Theorem 5).** If the investor uses estimate $\hat{p}$ instead of true $p$, the achieved growth rate is $\hat{g} = g - D(p \| \hat{p})$, where $D(\cdot\|\cdot)$ is KL divergence. The loss is independent of the transaction cost parameters -- it depends only on the distributional error.

8. **Side information (Theorem 6).** With side information $Y$, the growth rate increases by $I(X;Y)$, the mutual information, exactly as in the frictionless case.

9. **Universal policy $\hat{\rho}$ (Section III, Theorem 7, exact up to polynomial factor).** Setting: individual sequences (no distributional assumptions), stationary first-order Markov self-financing policies. Any policy $\rho$ is described by $m$ portfolio vectors $(b_1^\rho, \ldots, b_m^\rho) \in \mathcal{B}^m$. The universal policy integrates uniformly over all such strategies:
$$\hat{S}_k = \frac{\int_{\mathcal{B}^m} S_k^\rho\, d\rho}{\int_{\mathcal{B}^m} d\rho}, \qquad \hat{b}_k = \frac{\int_{\mathcal{B}^m} w_k^\rho\, S_k^\rho\, b_k^\rho\, d\rho}{\int_{\mathcal{B}^m} w_k^\rho\, S_k^\rho\, d\rho}.$$
Main bound: for all $n > n_{\min}$ and every market sequence,
$$\frac{\hat{S}_n}{S_n^*} \geq \frac{e^{-(1+n_{\min})}}{n^{m(m-1)}},$$
where $n_{\min} = 2\lambda_{\max}/(1 - \lambda_{\max})$ and $\lambda_{\max} = \max_i \lambda_i$. Hence $(1/n)\log(\hat{S}_n / S_n^*) \to 0$: the cost of universality is only polynomial in $n$ and does not affect the asymptotic growth rate.

    Proof strategy: fix the best hindsight policy with horizon $n$, denoted $\rho_n^*$. Construct a mixture policy $\rho_\alpha = (1-\alpha)\rho^* + \alpha \rho_v$ for arbitrary $v$. Lower-bound the one-step wealth factor $w_n^\alpha \geq (1 - \alpha n_{\min}) w_k^*$ using concavity of the repositioning factor. Then $S_n^\alpha \geq (1-\alpha n_{\min})^n (1-\alpha)^n S_n^*$. Set $\alpha = 1/n$; integrate via Laplace-type lower bound over a neighborhood $G$ of $\rho_n^*$, picking up a volume factor $\alpha^{m(m-1)}$ from the simplex parameterization.

10. **Corollaries.** (Corollary 1) The universal policy tracks the best hindsight Markov policy on every sequence: $\liminf \frac{1}{n}\log(\hat{S}_n / S_n^*) \geq 0$. (Corollary 2) On i.i.d. markets, the universal policy achieves the maximum growth rate $g$ with probability 1. (Remark 5) Result extends to first-order Markov markets.

    Regularity conditions: $\lambda_{\max} < \frac{1}{2}$ ensures $n_{\min} < 1$ and the bound holds for all $n \geq 1$.

## Domain of applicability

- **Market structure:** Horse race (erodible asset) markets -- exactly one asset pays off per period, the rest lose everything. This is an extreme point of the general asset return distribution.
- **Costs:** Proportional (linear) transaction costs, symmetric between buys and sells. Cash as intermediary. Does not cover fixed costs, market impact, or bid-ask spreads with asymmetric structure.
- **Distributional scope:** Theorems 1--3: i.i.d. price relatives. Theorem 4: stationary ergodic. Theorems 5--6: i.i.d. with misspecification / side information. Section III (universal portfolios): fully adversarial individual sequences, no distributional assumptions.
- **Policy class for universality:** Stationary first-order Markov, self-financing. The universal policy itself is non-stationary and non-Markov.
- **Limitations acknowledged by authors:** The proof that log-optimum investment is growth-optimal does not extend directly to general markets (where the opening portfolio depends on the policy). The solution for general i.i.d. markets with costs is deferred to Iyengar [15]. The growth rate loss from misspecification (Theorem 5) is also specific to horse races.
- **Asymptotic nature:** The polynomial tracking bound means finite-sample wealth ratios can be far from 1; the result is purely about growth rates. The small-cost approximation $l(\lambda) \approx -2\sum p_i(1-p_i)\lambda_i$ differs from continuous-time results (Davis--Norman, Shreve--Soner).
