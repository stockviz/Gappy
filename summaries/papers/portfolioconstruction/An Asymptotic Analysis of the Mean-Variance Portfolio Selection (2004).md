# 1. Metadata

- **Title:** An Asymptotic Analysis of the Mean-Variance Portfolio Selection
- **Author(s):** György Ottucsák, István Vajda
- **Year:** 2004
- **Journal/Venue:** *Statistics & Decisions*

# 2. Problem statement

The paper asks: **how much asymptotic growth does a risk-aware Markowitz-type strategy sacrifice relative to the log-optimal strategy in stationary ergodic markets, and can a nonparametric kernel-based version recover the same asymptotic benchmark without knowing the data-generating law?**

# 3. Approach (short)

The method is asymptotic growth analysis under stationarity and ergodicity. Ottucsák and Vajda define a multiperiod Markowitz-type objective using conditional first and second moments of one-period portfolio excess returns, derive lower bounds on its asymptotic growth relative to the log-optimal benchmark, and then build a kernel-based empirical version by mixing local experts.

# 4. Approach (detailed)

1. **Dynamic Markowitz-type criterion**

   Let $X_n\in\mathbb R_+^d$ be the return vector. The paper considers a one-step conditional objective of the form
   $$
   \max_{b\in\Delta_d}
   \left\{
   (1-2\lambda)\,\mathbb E[\langle b,X_0\rangle-1\mid \mathcal F_{-1}]
   -
   \lambda\,\mathbb E[(\langle b,X_0\rangle-1)^2\mid \mathcal F_{-1}]
   + \text{normalization term}
   \right\},
   $$
   with $\lambda$ a risk-aversion parameter. This is the sequential analogue of mean-variance optimization.

2. **Compare with the log-optimal benchmark**

   Let
   $$
   W^\star
   =
   \sup_B \liminf_{n\to\infty}\frac1n\log S_n(B)
   $$
   denote the optimal asymptotic growth rate. Under the bounded-return assumption
   $$
   a\le X_n^{(j)}\le a^{-1}
   \qquad (0<a<1),
   $$
   the paper proves a lower bound for the growth rate of the Markowitz-type strategy:
   $$
   \liminf_{n\to\infty}\frac1n\log \bar S_{n,\lambda}
   \ge
   W^\star - \text{explicit penalty terms depending on }\lambda \text{ and conditional moments}.
   $$
   The exact bound is cumbersome, but the point is quantitative: risk aversion lowers growth by a controlled amount.

3. **Interpretation of the bound**

   The penalty terms involve conditional first and second moments of $X_0^{(m)}-1$ weighted by the predictive sigma-field. Hence the difference between log-optimal and Markowitz-type growth is driven by the second-order approximation error induced by replacing log utility with a risk-penalized quadratic criterion.

4. **Kernel-based empirical strategy**

   Since the conditional laws are unknown, the paper constructs experts indexed by window length $k$ and radius $\ell$. For matched past windows $J_n$, the expert solves the empirical analogue
   $$
   \arg\max_{b\in\Delta_d}
   \left[
   (1-2\lambda)\sum_{i\in J_n}(\langle b,X_i\rangle-1)
   -
   \lambda\sum_{i\in J_n}(\langle b,X_i\rangle-1)^2
   +
   \frac{\lambda}{|J_n|}
   \left(\sum_{i\in J_n}(\langle b,X_i\rangle-1)\right)^2
   \right].
   $$
   The overall strategy is a positive-weight mixture over experts.

5. **Main empirical-theory theorem**

   The kernel-based Markowitz-type strategy satisfies the same asymptotic lower bound as the infeasible full-information strategy:
   $$
   \liminf_{n\to\infty}\frac1n\log \bar S_{n,\lambda}
   \ge
   W^\star - \text{same penalty}.
   $$
   Thus the data-driven rule asymptotically loses no extra growth beyond the Markowitz-vs-log-optimal approximation itself.

6. **Proof sketch**

   The proof combines:
   - ergodic convergence of matched-window empirical criteria to conditional expectations;
   - continuity of maximizers in the underlying conditional law;
   - wealth-mixture lower bounds ensuring the aggregate tracks the best expert asymptotically.

   The lower bound in the full-information case comes from bounding $\log z$ below by a quadratic function of $z-1$, which converts log growth into a mean-variance-style criterion plus remainder terms.

# 5. Domain of applicability

The method applies to long-only sequential investment under stationary ergodic returns and bounded price relatives. It is useful when one wants a computationally simpler risk-aware proxy for the log-optimal strategy. The exact asymptotic guarantee is not equality with $W^\star$ but a lower bound below it, unless $\lambda$ and the remainder terms make the gap negligible. The framework also excludes transaction costs and relies heavily on asymptotics; in finite samples the kernel tuning problem can be severe.
