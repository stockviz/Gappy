# Universal Portfolio Selection

**Authors:** V. Vovk and C. Watkins  
**Year:** 1998  
**Journal/Venue:** COLT 98 (Proceedings of the 11th Annual Conference on Computational Learning Theory), ACM

## Problem statement

In sequential portfolio selection over $N$ stocks and $T$ trading periods, a learner must choose portfolio weights at each step without knowledge of future returns. The benchmark is the best constant rebalanced portfolio (CRP) in hindsight. Cover's (1991) universal portfolio algorithm achieves this for long-only portfolios ($\gamma_t \in \mathcal{S}_N$, the standard simplex) with excess log-wealth loss $O(\frac{N-1}{2} \ln T)$. Two questions are open: (1) can this be improved or generalized by varying the learning rate $\eta$ away from Cover's implicit $\eta = 1$? (2) can the framework be extended to a long-short game where portfolios may take negative positions ($\gamma_t \in \mathbb{R}^N$, $\|\gamma_t\|_1 \le a$), applicable to currency and futures markets? A further goal is to connect the regret of universal strategies to Kolmogorov complexity, providing a complexity-theoretic foundation for universal investment.

## Approach (short)

The authors instantiate Vovk's Aggregating Algorithm (AA)---a general prediction-with-expert-advice method---on two portfolio selection games (Cover's long-only game and a new long-short game), treating every CRP as an "expert." The AA is parameterized by a learning rate $\eta > 0$ and a prior $P_0$ over experts. For $\eta \le 1$ and the Dirichlet$(\frac{1}{2},\ldots,\frac{1}{2})$ prior, Cover's algorithm emerges as a special case ($\eta=1$). The paper derives worst-case regret bounds for general $\eta$, proves analogous results for the long-short game, and then reinterprets the cumulative loss of the universal strategy as a measure of predictive complexity connected to Kolmogorov complexity.

## Approach (detailed)

### 1. The Aggregating Algorithm (AA) --- General Setup

The AA operates on a perfect-information game between Pool, Learner, and Nature. At each trial $t$:
- Pool reveals a mapping $\gamma_t : \Theta \to \Gamma$ (expert recommendations).
- Learner chooses action $\gamma_t(\text{Learner}) \in \Gamma$.
- Nature reveals outcome $\omega_t \in \Omega$.

The loss function $\lambda : \Omega \times \Gamma \to \mathbb{R}$ yields cumulative expert loss $\text{Loss}_T(\theta) := \sum_{t=1}^T \lambda(\omega_t, \gamma_t(\theta))$ and Learner loss $\text{Loss}_T(\text{Learner}) := \sum_{t=1}^T \lambda(\omega_t, \gamma_t(\text{Learner}))$.

Fix learning rate $\eta > 0$, set $\beta = e^{-\eta}$, and fix prior distribution $P_0$ on $\Theta$. The AA updates expert weights via:

$$P_t(A) := \int_A \beta^{\lambda(\omega_t, \gamma_t(\theta))} P_{t-1}^*(d\theta),$$

where $P_{t-1}^*(d\theta) := P_{t-1}(d\theta)/P_{t-1}(\Theta)$ are normalized weights. Learner's action is obtained by applying a *substitution function* $\Sigma$ to the generalized action:

$$g_t(\omega) := \log_\beta \int_\Theta \beta^{\lambda(\omega, \gamma_t(\theta))} P_{t-1}^*(d\theta). \tag{1}$$

**Lemma 1.** For any $\eta > 0$, prior $P_0$, and $T = 1, 2, \ldots$:

$$\text{Loss}_T(\text{APA}(\eta, P_0)) = \log_\beta \int_\Theta \beta^{\text{Loss}_T(\theta)} P_0(d\theta).$$

### 2. Substitution Functions and Mixability

A game $(\Omega, \Gamma, \lambda)$ is called *$\eta$-mixable* if one can take $c(\eta) = 1$ in the bound:

$$\forall g \in \text{GA}(\eta)\;\forall \omega \in \Omega : \lambda(\omega, \Sigma(g)) \le c(\eta)\, g(\omega), \tag{2}$$

where $\text{GA}(\eta)$ is the set of all generalized actions achievable by the AA. For $\eta$-mixable games, the AA satisfies:

$$\text{Loss}_T(\text{AA}(\eta, P_0)) \le \text{Loss}_T(\theta) + \frac{1}{\eta} \ln \frac{1}{P_0\{\theta\}}.$$

**Lemma 2** (Countable/finite expert pool). If $\Theta$ is countable or finite:

$$\text{Loss}_T(\text{AA}(\eta, P_0)) \le c(\eta)\,\text{Loss}_T(\theta) + a(\eta) \ln \frac{1}{P_0\{\theta\}},$$

where $a(\eta) := c(\eta)/\eta$. For $\eta$-mixable games this simplifies to the bound above with $c(\eta) = 1$.

### 3. Cover's Game (Long-Only)

Market at trial $t$ is described by a nonnegative price-relative vector $\omega_t \in [0,\infty)^N$. A portfolio $\gamma_t \in \mathcal{S}_N$ (standard simplex) increases wealth by factor $\gamma \cdot \omega$. The natural loss function is:

$$\lambda(\omega, \gamma) := -\ln(\gamma \cdot \omega). \tag{5}$$

To handle the non-negativity issue, the authors use the *normalized* (regret) loss:

$$\lambda^*(\omega, \gamma) := \lambda(\omega, \gamma) - \min_\delta \lambda(\omega, \delta) = \ln \frac{\|\omega\|_\infty}{\gamma \cdot \omega}, \tag{6}$$

under the assumption $\|\omega_t\|_\infty = 1$ (w.l.o.g. by rescaling).

**Lemma 3.** For every $\eta \le 1$, $c(\eta) = 1$; Cover's game is $\eta$-mixable for all $\eta \le 1$. The unique generalized action attaining $c(g) = 1$ is the average portfolio:

$$\gamma^* := \int_\Gamma \gamma \, P(d\gamma), \tag{7}$$

where $P$ is the probability distribution in $\Gamma$ generating $g$. When $\eta > 1$, $c(\eta) > 1$.

**Algorithm 1.** For $\eta \le 1$, the AA's action at trial $T$ is:

$$\gamma_T = \frac{\int_\Gamma \delta \prod_{t=1}^{T-1} (\delta \cdot \omega_t)^\eta \, P_0(d\delta)}{\int_\Gamma \prod_{t=1}^{T-1} (\delta \cdot \omega_t)^\eta \, P_0(d\delta)}.$$

At $\eta = 1$ this is exactly Cover's algorithm.

**Theorem 2** (Main bound, Cover's game). For any learning rate $\eta \le 1$, number of stocks $N$, and prior $P_0$ equal to the Dirichlet$(\frac{1}{2}, \ldots, \frac{1}{2})$ distribution, there exists a constant $c = c(\eta, N)$ such that for all $T$:

$$\text{Loss}_T(\text{AA}(\eta, P_0)) \le \inf_{\gamma \in \Gamma} \text{Loss}_T(\gamma) + \frac{N-1}{2\eta} \ln T + c.$$

At $\eta = 1$ this recovers Cover and Ordentlich's $\frac{N-1}{2} \ln T$ bound. For $\eta < 1$ the regret worsens by factor $1/\eta$, but experimentally $\eta < 1$ can outperform $\eta = 1$ (as observed by Helmbold et al. with $\eta \in [0.01, 0.15]$).

*Proof sketch (Section 7.4):* Reduce to Kelley (horse-race) markets via Minkowski's inequality. For Dirichlet$(\frac{1}{2})$ prior and degenerate outcomes, the ratio of the mixture integral to the best single-expert wealth is bounded below by $\epsilon T^{-\frac{N-1}{2\eta}}$ using Stirling's approximation on the Beta function integrals.

### 4. Long-Short Game

Returns $\omega_t \in [-1, \infty)^N$ (differences, not ratios). Portfolios $\gamma_t \in \mathbb{R}^N$ satisfy $\|\gamma_t\|_1 \le a$ for a "prudence coefficient" $a > 0$ bounding leverage. Wealth growth factor: $1 + \gamma \cdot \omega$. Loss function:

$$\lambda(\omega, \gamma) := -\ln(1 + \gamma \cdot \omega),$$

with normalized version $\lambda^*(\omega, \gamma) := \ln \frac{1 + a\|\omega\|_\infty}{1 + \gamma \cdot \omega}$ under the assumption $0 \le A < \frac{1}{a}$ bounding $\|\omega_t\|_\infty \le A$ (ensuring no bankruptcy).

**Lemma 5.** For every $\eta \le 1$, $c(\eta) = 1$; the long-short game is $\eta$-mixable. The unique action attaining $c(g) = 1$ is again the average (7), where $P$ generates $g$ over the $\ell^1$-ball.

**Algorithm 2.** For $\eta \le 1$, the AA's action at trial $T$ in the long-short game is:

$$\gamma_T = \frac{\int_\Gamma \delta \prod_{t=1}^{T-1} (1 + \delta \cdot \omega_t)^\eta \, P_0(d\delta)}{\int_\Gamma \prod_{t=1}^{T-1} (1 + \delta \cdot \omega_t)^\eta \, P_0(d\delta)}.$$

**Theorem 3** (Long-short game). For countable or finite $\Theta$ and any $P_0$, $\eta \le 1$:

$$\text{Loss}_T(\text{AA}(\eta, P_0)) \le \text{Loss}_T(\theta) + \frac{1}{\eta} \ln \frac{1}{P_0\{\theta\}},$$

with loss function either $-\ln(1 + \gamma \cdot \omega)$ or $\ln \frac{1 + a\|\omega\|_\infty}{1 + \gamma \cdot \omega}$.

### 5. Predictive Complexity and Kolmogorov Complexity

The paper defines *predictive complexity* $\mathcal{K}(x)$ for a data sequence $x \in (\Sigma \times \Omega)^*$ as the smallest loss achievable by any computable prediction strategy, up to an additive constant. Formally, a function $k : (\Sigma \times \Omega)^* \to \mathbb{R}$ is a measure of predictive complexity if:
1. $k$ is a *superloss process*: $k(\Box) = 0$ and $\forall x\;\exists \gamma \in \Gamma\;\forall \omega \in \Omega : k(x * (\sigma, \omega)) \ge k(x) + \lambda(\omega, \gamma)$.
2. $k$ is *semicomputable from above*: $k = \inf_i k_i$ for computable $k_i$.

A measure $k^*$ is *universal* if for any other measure $k$ there exists $C$ with $k^*(x) \le k(x) + C$ for all $x$.

**Lemma 6.** Universal measures of predictive complexity exist for all perfectly mixable games (i.e., $\eta$-mixable for some $\eta > 0$). Both Cover's game and the long-short game qualify.

**Corollary 1.** For fixed $N$, prudence coefficient $a > 0$, any finite sequence $x \in \Omega^*$, and any computable prediction strategy $S$:

$$\mathcal{K}(x) \le \text{Loss}_S(x) + \mathcal{K}^{\text{int}}(S) + c,$$

where $\mathcal{K}^{\text{int}}(S)$ is the Kolmogorov complexity of the strategy (length of shortest program computing $S$).

**Corollary 2.** For any $x \in \Omega^*$ and any learning rate $\eta \le 1$:

$$\mathcal{K}(x) \le \text{Loss}_{\text{AA}(P_0, \eta)}(x) + \mathcal{K}^{\text{int}}(\eta) + c.$$

This connects the AA's cumulative loss to predictive complexity: the loss of the universal portfolio upper bounds the intrinsic complexity of the price sequence.

**Theorem 4** (Cover complexity). For any fixed $N$ and Cover's game:

$$\mathcal{K}_N^C(\omega_1 \ldots \omega_T) \stackrel{+}{\ge} -\ln \sum_{(n_1,\ldots,n_T) \in \{0,\ldots,N-1\}^T} \omega_1[n_1] \cdots \omega_T[n_T] \, 2^{-KM(n_1 \ldots n_T | \omega_1 \ldots \omega_{T-1})},$$

where $KM$ denotes the *a priori* semimeasure (algorithmic probability). This is the natural analog of the well-known identity $KM = \mathcal{K}^{\log}/\ln 2$ for horse-race markets.

### 6. Extensions Discussed

- **Transaction costs:** If a fixed percentage commission $c \in (0,1)$ is charged per stock trade, the framework accommodates this by modifying the complexities $\mathcal{K}_{N,c}^C$ and $\mathcal{K}_{N,a,c}^{\text{ls}}$.
- **Bid-ask spreads:** The outcome space is enriched to $\Omega = \{(\omega^B[0], \omega^A[0], \ldots) \in [0,\infty)^{2N}\}$, and the loss function is redefined accordingly.
- **Martin-Lof randomness:** In the log-loss game, predictive efficiency of strategy $S$ for sequence $x$ is equivalent to $x$ being Martin-Lof random with respect to $S$.
- **Predictive information:** Defined as $I(\sigma_1 \ldots \sigma_T : \omega_1 \ldots \omega_T) := \mathcal{K}(\omega_1 \ldots \omega_T) - \mathcal{K}(\omega_1 \ldots \omega_T | \sigma_1 \ldots \sigma_T)$, measuring the value of side information (signals) for the universal portfolio.

## Domain of applicability

- **Cover's game (long-only):** Directly applicable to stock markets with nonneg price relatives. Requires $N$ fixed and known; regret grows as $O(\frac{N-1}{2\eta} \ln T)$, so practical only for moderate $N$. The CRP benchmark is most meaningful when markets are stationary enough that a single fixed-mix portfolio is a strong competitor.
- **Long-short game:** Extends to currencies, futures, and any market allowing negative positions, under a bounded-leverage constraint $\|\gamma\|_1 \le a$ and bounded return assumption $\|\omega_t\|_\infty \le A < 1/a$ (no-bankruptcy condition). The prudence coefficient $a$ must be set a priori.
- **Learning rate $\eta$:** Theory gives best bounds at $\eta = 1$ (Cover's case), but experiments suggest smaller $\eta$ may dominate empirically due to constants hidden in the $O(\cdot)$ bound. This is an open design parameter.
- **Computability:** The predictive-complexity results require the strategy to be computable (or semicomputable). The universal strategy itself is "computable in the limit" but not in finite time; practical implementations require approximation (quadrature over the simplex or $\ell^1$-ball).
- **Limitations:** No stochastic assumptions on returns, but the benchmark (best CRP) is weak in trending or regime-switching markets. Transaction costs and discrete rebalancing are treated only as extensions; the core bounds assume frictionless continuous rebalancing. The regret bound is minimax but not adaptive to the realized difficulty of the sequence.
