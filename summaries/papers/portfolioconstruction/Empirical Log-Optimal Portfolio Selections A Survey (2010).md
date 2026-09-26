# 1. Metadata

- **Title:** Empirical Log-Optimal Portfolio Selections: A Survey
- **Author(s):** László Györfi, György Ottucsák
- **Year:** 2010
- **Journal/Venue:** survey / monograph-style paper

# 2. Problem statement

The paper surveys a precise family of problems: **how should one construct static, log-optimal, semi-log-optimal, and kernel-based empirical portfolio rules under memoryless and stationary ergodic market models, and what asymptotic guarantees are available?**

# 3. Approach (short)

The article is a structured survey rather than a single new theorem. It begins from static and constant-rebalanced portfolios, develops log-optimal and semi-log-optimal strategies for i.i.d. markets, then moves to stationary ergodic markets and data-driven nonparametric portfolio rules. The organizing device is the asymptotic growth rate $n^{-1}\log S_n$.

# 4. Approach (detailed)

1. **Notation and return representation**

   Prices $s_n$ are transformed into return vectors
   $$
   x_n^{(j)}=\frac{s_n^{(j)}}{s_{n-1}^{(j)}}, \qquad x_n\in\mathbb R_+^d.
   $$
   A portfolio vector lies in
   $$
   \Delta_d=\{b\ge 0,\ \sum_{j=1}^d b^{(j)}=1\}.
   $$

2. **Static and constantly rebalanced portfolios**

   A CRP with weight $b$ has wealth
   $$
   S_n(b)=\prod_{i=1}^n \langle b,x_i\rangle.
   $$
   Its asymptotic growth rate is
   $$
   W(b)=\lim_{n\to\infty}\frac1n\log S_n(b),
   $$
   when the limit exists.

3. **Log-optimal portfolio for memoryless markets**

   For i.i.d. returns $X_i$, the best CRP solves
   $$
   b^\star \in \arg\max_{b\in\Delta_d} \mathbb E[\log\langle b,X_1\rangle].
   $$
   This is the classical Kelly/Cover object. The survey reviews why its achieved growth equals the maximal long-run growth rate among CRPs.

4. **Semi-log-optimal approximation**

   The survey then introduces the semi-log-optimal rule, replacing $\log z$ by its quadratic approximation around $z=1$:
   $$
   \log z \approx (z-1)-\frac12(z-1)^2.
   $$
   Hence the semi-log portfolio solves
   $$
   \bar b^\star
   \in
   \arg\max_{b\in\Delta_d}
   \left\{
   \mathbb E[\langle b,X\rangle-1]
   -
   \frac12 \mathbb E[(\langle b,X\rangle-1)^2]
   \right\}.
   $$
   The survey stresses two advantages: easier computation and dependence only on low-order moments.

5. **Stationary ergodic markets and universal consistency**

   The survey defines universal consistency of a data-driven strategy $B$ by
   $$
   \lim_{n\to\infty}\frac1n\log S_n(B)=W^\star
   \quad\text{a.s.}
   $$
   for every process in the target class. It reviews Algoet’s existence theorem and the kernel-based constructions of Györfi, Lugosi, and Udina.

6. **Kernel-based empirical strategies**

   The empirical rule uses a family of experts indexed by window length $k$ and bandwidth/radius $\ell$. Each expert matches the current past to similar historical windows and optimizes a local criterion on the matched sample. For the kernel log-optimal strategy the criterion is empirical average log return; for the semi-log variant it is the semi-log objective. The aggregate portfolio is a wealth-weighted mixture of experts.

7. **Main surveyed theorem**

   The survey reports that kernel-based log-optimal and semi-log-optimal strategies are universally consistent for all stationary ergodic return processes satisfying
   $$
   \mathbb E|\log X^{(j)}|<\infty.
   $$
   The proof ingredients are ergodic theorems, conditional distribution approximation, and expert aggregation. The survey itself is mainly expository here.

8. **Numerical evidence**

   A large part of the survey compares log-optimal and semi-log-optimal algorithms on NYSE data. The main empirical point is not a theorem but a computational one: semi-log optimization often delivers growth close to the log-optimal version at materially lower computational cost.

# 5. Domain of applicability

The survey covers long-only, frictionless sequential rebalancing under log-growth objectives. Its theoretical results are strongest for i.i.d. or stationary ergodic markets with integrability. The semi-log approximation is computationally attractive but is not an exact representation of log utility. The broadest “universal consistency” claims remain asymptotic and model-class dependent, so they should not be read as finite-sample robustness guarantees in real markets with costs and structural breaks.
