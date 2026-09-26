# Growth Optimal Investment in Horse Race Markets with Costs

**Authors:** Garud N. Iyengar, Thomas M. Cover  
**Year:** 2000  
**Journal/Venue:** IEEE Transactions on Information Theory, vol. 46, no. 7, pp. 2675--2683

## Problem statement

Extend the theory of growth-optimal (Kelly) investment in horse race markets to the setting with **proportional transaction costs**. Prior results (Kelly [3], Algoet--Cover [5], Cover [7]) assume frictionless markets; policies designed for that setting can lead to immediate bankruptcy in continuous time with costs (Davis--Norman [9]) and perform poorly in discrete time (Kalai--Blum [10]). The paper seeks: (i) the growth-optimal policy and maximal growth rate for i.i.d. and stationary ergodic horse race markets with proportional costs, and (ii) a universal (distribution-free) policy that achieves the same asymptotic growth rate without knowledge of the underlying distribution.

## Approach (short)

The authors show the conditionally log-optimum policy remains growth-optimal under proportional transaction costs. They derive the optimal portfolio in closed form: it is the frictionless Kelly portfolio corrected toward the "nearest" portfolio on the boundary of a simplex region determined by the cost structure. The growth rate equals the frictionless rate minus a constant penalty $l(\lambda)$. For the universal (individual-sequence) setting, they construct a Cover-style policy that mixes over all stationary Markov strategies, proving it tracks the best hindsight policy to within a polynomial factor.

## Approach (detailed)

### 1. Market model

A horse race market with $m$ assets. At each period exactly one asset ("horse") pays off at odds $o_i$; the others pay nothing. Price relatives are $X_n = o_i e_i$ with probability $p_i$. Transaction costs are proportional: selling \$1 of asset $i$ nets $(1 - \lambda_i)$ dollars; buying \$1 of asset $i$ costs $(1 + \lambda_i)$ dollars. Cash is the intermediary in all trades.

A portfolio $b \in \mathcal{B} = \{b \in \mathbb{R}^m_+ : \sum_i b(i) = 1\}$. When the investor with portfolio $z_n$ (the market-opening portfolio, determined by the previous winner) rebalances to $b_n$, wealth is multiplied by $w(b_n, z_n)$ satisfying

$$1 = w + \sum_{i=1}^{m} \lambda_i |w b_n(i) - z_n(i)|. \tag{1}$$

Compounded wealth after $n$ periods:

$$S_{n} = \prod_{k=1}^{n-1} w(b_k, z_k)\,(b_k^\top X_k). \tag{3}$$

Growth rate:

$$g = \liminf_{n \to \infty} \frac{1}{n} \boldsymbol{E} \log S_n. \tag{4}$$

### 2. Conditionally log-optimum policy (Theorem 1)

Define the policy $\rho^*$: at $n=1$, invest $b_1^* = p$. For $n \geq 2$, given $z_n = e_i$ (asset $i$ won last period), the optimal rebalanced portfolio is

$$b_i^*(j) = \begin{cases} \dfrac{p_i}{p_i + \sum_{\ell \neq i} \frac{1-\lambda_\ell}{1+\lambda_\ell}\, p_\ell}, & j = i, \\[6pt] \dfrac{\frac{1-\lambda_j}{1+\lambda_j}\, p_j}{p_i + \sum_{\ell \neq i} \frac{1-\lambda_j}{1+\lambda_j}\, p_\ell}, & j \neq i. \end{cases} \tag{10}$$

**Interpretation.** The intent is always the same: place sell and buy orders as if there were no costs and accept whatever you get. If asset $i$ wins, keep proportion $p_i$ of it, sell $(1-p_i)$, and invest the proceeds $(1-\lambda_i)(1-p_i)$ in the remaining assets in proportions $(p_1, \ldots, p_{i-1}, p_i, p_{i+1}, \ldots, p_m)$, where each dollar invested in asset $j \neq i$ actually allocates $\gamma_j = (1-\lambda_j)/(1+\lambda_j)$ effective dollars.

The frictionless Kelly portfolio $p$ lies in the convex hull of the $\{b_i^*\}$; geometrically, transaction costs push the optimal portfolio from $p$ toward the boundary of the simplex (toward the current holding -- see Fig. 1 in the paper).

### 3. Optimal growth rate

The growth rate under $\rho^*$ is (exact):

$$g^* = \sum_{i=1}^{m} p_i \log(o_i) - H(p) + \sum_{i=1}^{m} p_i(1-p_i) \log\!\left(\frac{1 - \lambda_i}{1 + \lambda_i}\right). \tag{13}$$

Equivalently, $g^* = g_0 + \sum_i p_i(1-p_i)\log\!\bigl(\frac{1-\lambda_i}{1+\lambda_i}\bigr)$, where $g_0 = \sum_i p_i \log(o_i) - H(p)$ is the frictionless growth rate. The loss due to transaction costs is

$$l(\lambda) = \sum_{i=1}^{m} p_i(1 - p_i) \log\!\left(\frac{1+\lambda_i}{1-\lambda_i}\right) \geq 0. \tag{15}$$

For small costs: $l(\lambda) \approx 2\sum_i p_i(1-p_i)\lambda_i$. Note this differs from the continuous-time asymptotic (Iyengar [13], Shreve--Soner [16]).

**Key proof technique (Theorem 1).** In horse race markets, the market-opening portfolio $z_n$ is the same for all policies (it depends only on which horse won, not on the bet). This makes the conditional optimization decompose period-by-period. The KL divergence $D(p \| q) \geq 0$ pins the optimal allocation $q = p$ in (9), yielding the closed-form solution.

### 4. Almost-sure optimality (Theorems 2 and 3)

**Theorem 2.** $\frac{1}{n}\log S_n^* \to g^*$ with probability 1 (law of large numbers for i.i.d. returns).

**Theorem 3.** For any admissible policy $\rho$, $\limsup \frac{1}{n}\log(S_n^\rho / S_n^*) \leq 0$ a.s. Proof uses a supermartingale argument: $M_n = S_n^\rho / S_n^*$ is a nonneg. supermartingale with $\boldsymbol{E}(S_n^\rho / S_n^*) \leq 1$ for all $n$, then Borel--Cantelli.

### 5. Stationary ergodic extension (Theorem 4)

For stationary ergodic (not necessarily i.i.d.) horse race markets with costs, the conditionally log-optimum policy becomes

$$b_n^* = \arg\max_{b \in \mathcal{B}} \boldsymbol{E}\!\left[\log\!\bigl(w(b, z_n)\, b^\top X_n\bigr) \,\Big|\, X_1^{n-1}\right],$$

and the corresponding growth rate is

$$g^* = \boldsymbol{E}\!\left[\log o(X_0)\,\big|\,X_{-\infty}^{-1}\right] - H\!\left(X_0\,\big|\,X_{-\infty}^{-1}\right) - \boldsymbol{E}\!\left[\log\!\frac{1-\lambda(X_0)}{1+\lambda(X_0)}\,(1-\delta(X_0,X_{-1}))\,\bigg|\,X_{-\infty}^{-1}\right] \tag{20}$$

where $\delta(X_0,X_{-1}) = \mathbf{1}[X_0 = X_{-1}]$. The cost penalty vanishes when the same horse wins consecutively (no rebalancing needed).

### 6. Sensitivity to distribution estimation (Theorem 5)

If the investor uses an incorrect distribution estimate $\hat{p}$ instead of the true $p$, the achievable growth rate drops by exactly the relative entropy:

$$\hat{g} = g - D(p \| \hat{p}). \tag{21}$$

The loss does **not** depend on the transaction costs. This is exact, not approximate. Regularity: requires i.i.d. returns.

### 7. Side information (Theorem 6)

With side information $\{Y_k\}$ where $\{(X_k, Y_k)\}$ is i.i.d., the growth rate increases to $g_Y = g + I(X;Y)$, where $I(X;Y)$ is the mutual information. Follows directly from Theorem 5 and $I(X;Y) = D(p(x,y) \| p(x)p(y))$.

### 8. Universal portfolio with costs (Theorem 7)

**Setting:** Individual sequences (no stochastic assumptions). Restrict to stationary first-order Markov self-financing policies: the portfolio at time $n$ depends only on $z_n$. A policy is equivalently described by $m$ vectors $(b_1^\rho, \ldots, b_m^\rho) \in \mathcal{B}^m$.

**Construction.** The universal policy $\hat{\rho}$ invests $d\rho / \int_{\mathcal{B}^m} d\rho$ in each Markov policy $\rho$, managing each pool separately. Wealth factor at time $k$: $w_k^\rho = w(b^\rho_{z_k}, e_{z_k})$ for rebalancing, $W_k^\rho = b^\rho_{z_k}(j) o_j$ for the payoff when $z_{k+1} = e_j$. The universal wealth is

$$\hat{S}_k = \frac{\int_{\mathcal{B}^m} S_k^\rho\, d\rho}{\int_{\mathcal{B}^m} d\rho}. \tag{26}$$

**Theorem 7.** For all $n > n_{\min}$ and every market sequence $\{x_k\}$,

$$\frac{\hat{S}_n}{S_n^*} \geq \frac{e^{-(1+n_{\min})}}{n^{m(m-1)}}$$

where $n_{\min} = 2\lambda_{\max}/(1-\lambda_{\max})$ and $\lambda_{\max} = \max_i \lambda_i$.

**Consequence:** $(1/n)\log(\hat{S}_n / S_n^*) \to 0$, so the universal policy achieves the same asymptotic growth rate as the best Markov policy in hindsight. The cost of universality is polynomial in $n$ (and hence zero in the exponent).

**Proof sketch.** Fix the best stationary hindsight policy $\rho^*$ and a perturbation $\rho_\alpha = (1-\alpha)\rho^* + \alpha \rho_v$ for arbitrary $v \in \mathcal{B}^m$. Lower-bound the rebalancing wealth factor: $w_n^\alpha \geq (1 - \alpha n_{\min}) w_k^*$. Choose $\alpha = 1/n$. Apply Laplace's method to the integral in (26), lower-bounding $\hat{S}_n$ by integrating over a neighborhood $G$ of $\rho^*$, yielding $\hat{S}_n \geq (1-\alpha)^n (1 - \alpha n_{\min})^n S_n^* \cdot \alpha^{m(m-1)}$.

**Corollary 1.** $\liminf \frac{1}{n}\log(\hat{S}_n / S_n^*) \geq 0$ for every market sequence.

**Corollary 2.** If the market is i.i.d., $(1/n)\log \hat{S}_n \to g^*$ a.s.

**Remark 5.** Extends to first-order Markov (not just i.i.d.) market sequences: the universal policy achieves the best Markov policy growth rate.

## Domain of applicability

- **Market structure.** Horse race markets (exactly one asset pays off per period). A special extreme case of general asset markets; the analysis does not extend directly to general markets because in horse races the market-opening portfolio $z_n$ is policy-independent (a key structural property exploited in proofs).
- **Cost structure.** Proportional (linear) transaction costs, symmetric buy/sell rates. The asymptotic extends to the asymmetric case.
- **Distributional assumptions.** Theorems 1--3, 5--6 require i.i.d. returns. Theorem 4 extends to stationary ergodic. Theorem 7 (universal policy) is distribution-free (individual sequences).
- **Constraint.** $\lambda_{\max} < 1$ required; for Theorem 7, $\lambda_{\max} < 1/2$ gives $n_{\min} < 1$ (result holds for all $n \geq 1$).
- **General markets.** The authors note (Section IV, Remark) that the solution method should extend to general i.i.d. and finite-order Markov markets via suitable coupling arguments (see Iyengar [15]), but this paper does not prove it. The growth rate loss formula $l(\lambda)$ and the distribution-estimation loss result (Theorem 5) are specific to horse races.
- **Practical relevance.** Horse race markets are "erodible asset markets" -- extreme points for asset return distributions. They provide clean information-theoretic structure (entropy/divergence dualities) that motivates but does not directly govern general portfolio theory with costs.
