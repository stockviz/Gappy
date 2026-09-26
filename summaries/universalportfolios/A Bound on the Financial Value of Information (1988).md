# A Bound on the Financial Value of Information

**Authors:** Andrew R. Barron, Thomas M. Cover
**Year:** 1988
**Journal/Venue:** IEEE Transactions on Information Theory, vol. 34, no. 5, September 1988

## Problem statement

Quantify precisely the maximum increase in the doubling rate (exponential growth rate of wealth) that side information $Y$ can provide about stock returns $X$ in the log-optimal investment framework. The paper asks: what is the tightest universal bound on $\Delta = W(X|Y) - W(X)$, the gain in doubling rate from side information, and how does wealth growth degrade when the investor uses an incorrect market distribution?

## Approach (short)

The paper links log-optimal portfolio theory (Kelly/Breiman/Cover) to information-theoretic divergence measures. It proves two clean inequalities: (i) the wealth loss from using a wrong distribution $G$ in place of the true $F$ is bounded above by $D(F\|G)$, the Kullback-Leibler divergence; (ii) the doubling-rate gain from side information is bounded above by the mutual information $I(X;Y)$. It then extends these to the sequential (online) setting, showing that consistent density estimators yield asymptotically optimal growth.

## Approach (detailed)

### 1. Setup and doubling rate

Stock vector $X \geq 0$, $X \in \mathbb{R}^m$, with $X_i$ the price-relative of stock $i$. Portfolio $b \in B = \{b \in \mathbb{R}^m : b_i \geq 0,\; \sum b_i = 1\}$. Wealth factor from a single period: $S = b'X$. The doubling rate (log base 2) under distribution $F$ is

$$W(X) = \max_{b \in B} \int \log b'x \, dF(x). \tag{2}$$

The maximizer $b^* = b^*(F)$ is characterized by the Kuhn-Tucker conditions

$$E\!\left[\frac{X_i}{b^{*\prime}X}\right] = 1 \;\text{ if } b_i^* > 0, \qquad \leq 1 \;\text{ if } b_i^* = 0. \tag{3}$$

With i.i.d. returns, $n$-period wealth $S_n^* = \prod_{i=1}^n b^{*\prime}X_i$ grows as $2^{nW}$ a.s. by the SLLN for products, and no other portfolio achieves a higher exponent (Breiman; Algoet and Cover).

### 2. Side information and the information gain $\Delta$

With side information $Y$, the conditional doubling rate is

$$W(X|Y) = \max_{b(y)} \iint \log b'(y)\,x \, dF(x,y), \tag{6}$$

where $b^*(y) = b^*(F_{X|y})$. The information increment is

$$\Delta = W(X|Y) - W(X). \tag{10}$$

Kelly's horse-race result ($\Delta = I$ exactly) is the special case motivating the general bound.

### 3. Theorem 1: wealth loss from wrong distribution

Let $b^*(F)$ and $b^*(G)$ be log-optimal portfolios under the true and incorrect distributions. Define the wealth loss

$$\Delta W(F,G) = W(b^*(F), F) - W(b^*(G), F). \tag{16}$$

**Theorem 1.** $\;0 \leq \Delta W(F,G) \leq D(F\|G).$

*Proof sketch.* The lower bound $0 \leq \Delta W$ is immediate from optimality of $b^*(F)$. For the upper bound, let $S_1^* = b^*(F)'X$ and $S_2 = b^*(G)'X$. On $A = \{x : S_2 > 0,\; f(x) > 0\}$,

$$\Delta W = \int_A \log \frac{S_1^*}{S_2}\,dF = \int_A \log\!\left(\frac{S_1^*}{S_2}\cdot\frac{g}{g}\right)dF = \int_A \log\frac{S_1^*}{S_2}\cdot\frac{g}{f}\,dF + D(F\|G).$$

The remaining integral is $\leq \log \int_A (S_1^*/S_2)(g/f)\,dF$. The KT conditions for $b^*(G)$ under $G$ give $E_G[X_i / (b^*(G)'X)] \leq 1$, so $\int (S_1^*/S_2)\,dG \leq 1$ (by linearity in $b^*(F)$). Hence that term $\leq 0$, yielding $\Delta W \leq D(F\|G)$.

**Corollary.** Working with the normalized return $\tilde{F}$ (distribution of $X/\sum X_i$), $\Delta W(F,G) \leq D(\tilde{F}\|\tilde{G})$.

### 4. Theorem 2: information bound on $\Delta$

**Theorem 2.** $\;0 \leq \Delta \leq I(X;Y).$

*Proof.* For each $y$, apply Theorem 1 with $F = F_{X|y}$ (true conditional) and $G = F_X$ (marginal, i.e., ignoring $Y$):

$$0 \leq E\!\left[\log \frac{b^{**\prime}X}{b^{*\prime}X}\;\Big|\;Y = y\right] \leq D(F_{X|y}\|F_X).$$

Taking expectation over $Y$: $0 \leq \Delta \leq \int D(F_{X|y}\|F_X)\,dP_Y = I(X;Y).$

This is the central result. Each bit of mutual information between market and side information adds at most one bit to the doubling rate (one additional doubling per period).

### 5. Sequential estimation (Theorems 3 and 4)

For a sequence $X_1, X_2, \ldots$ i.i.d. $\sim P$ with unknown density $p$: if a sequence of estimators $\hat{P}_i$ satisfies

$$\frac{1}{n}\sum_{i=1}^n E\,D(P\|\hat{P}_i) \to 0, \tag{30/32}$$

then the sequential portfolio $\hat{b}_i = b^*(\hat{P}_i)$ achieves

$$\frac{1}{n}E\log \frac{S_n^*}{\hat{S}_n} \to 0, \tag{31}$$

and moreover $\hat{S}_n = S_n^* \cdot 2^{n\,o(1)}$ in probability (Theorem 4). Thus consistent density estimation in average KL sense is sufficient for asymptotically log-optimal growth.

### 6. Horse-race example (Section VII)

$P(X = O_i e_i) = p_i$, $i = 1,\ldots,m$ (horse race with odds $O_i$). Then $W(X) = \sum p_i \log O_i - H(X)$ and $b^* = p$ (proportional betting). Without side info: $\Delta = 0$ iff $Y$ is independent of $X$; with side info of known joint: $\Delta = I(X;Y)$ exactly. The bound is tight.

A second example shows the bound can be slack: $X = (1,1/2)$ or $(1,3/4)$ equi-probably, $Y = X$. Here $\Delta = 0$ (first stock dominates, side info is useless for portfolio choice) but $I(X;Y) = H(X) = 1$ bit.

## Domain of applicability

**Where it applies:**
- Any i.i.d. market with finitely many or continuously distributed price-relatives, provided $D(F\|G) < \infty$.
- Gives an operational meaning to mutual information in finance: bits of information translate to bits of doubling rate, with the inequality $\Delta \leq I$ serving as a universal ceiling.
- The sequential result (Theorem 4) is practically significant: it says you do not need to know $F$; consistent nonparametric density estimation suffices for asymptotic optimality.

**Where it breaks or is limited:**
- The bound $\Delta \leq I$ can be very loose. Side information that is statistically dependent on $X$ but irrelevant to the portfolio decision (as in the second example) produces $I > 0$ but $\Delta = 0$. The bound does not distinguish "portfolio-relevant" from "portfolio-irrelevant" information.
- I.i.d. assumption throughout. Extension to dependent sequences requires the ergodic theory of Algoet and Cover (1988); the clean $D(F\|G)$ bound does not transfer verbatim.
- Log-optimal criterion only. The results say nothing about finite-horizon utility, drawdown, or risk-adjusted performance. The doubling rate is the right criterion only for an investor with log utility and infinite horizon.
- Transaction costs are absent. Rebalancing to $b^*$ each period is assumed frictionless.
- The sequential convergence rate is unspecified beyond $o(1)$; finite-sample regret bounds require further work (later addressed by Cover's universal portfolio, 1991).
- The KL divergence $D(F\|G)$ can be infinite (e.g., if $G$ assigns zero probability to events in the support of $F$), in which case the bound is vacuous. The authors note this and restrict to $F \ll G$.
