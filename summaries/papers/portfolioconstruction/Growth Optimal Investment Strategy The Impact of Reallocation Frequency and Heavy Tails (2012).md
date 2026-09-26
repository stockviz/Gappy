# 1. Metadata

- **Title:** Growth Optimal Investment Strategy: The Impact of Reallocation Frequency and Heavy Tails
- **Author(s):** Günter Bamberg, Andreas Neuhierl
- **Year:** 2012
- **Journal/Venue:** *German Economic Review*

# 2. Problem statement

The paper asks two precise questions about maximum-expected-log (MEL) investment: **how does the optimal risky share depend on the reallocation frequency, and how does the answer change when log returns are heavy-tailed rather than light-tailed?**

# 3. Approach (short)

The method is direct expected-log optimization in a two-asset economy. The investor allocates a fraction $a$ to a risky asset and $1-a$ to a risk-free asset, maximizes $\mathbb E[r(a)]$, and compares the optimizer across return horizons and distributional families. The analysis is mostly exact in the two-asset setting and comparative-static in spirit.

# 4. Approach (detailed)

1. **Two-asset MEL setup**

   Let $r$ be the risky asset log return and $r_f$ the risk-free log return. If $a$ is the risky share, portfolio log return is
   $$
   r(a)=\log\!\big(ae^r+(1-a)e^{r_f}\big).
   $$
   The MEL portfolio solves
   $$
   a^\star = \arg\max_{0\le a\le 1}\mathbb E[r(a)].
   $$
   Since $r(a)$ is concave in $a$, the optimizer is unique.

2. **Reallocation frequency matters**

   If the basic period is changed, the optimization problem changes because one is now maximizing expected log return over a different buy-and-hold interval. The paper’s examples show that the annual optimizer need not equal the semiannual optimizer. The logic is elementary but important:
   $$
   a^\star(\Delta t)\neq a^\star(2\Delta t)
   $$
   in general, because compounding and interim non-rebalancing alter the return distribution of the portfolio.

3. **Illustrative dichotomous example**

   In the two-state gross-return example,
   $$
   \mathbb P(e^r=2)=\mathbb P(e^r=0.25)=\frac12,
   $$
   the authors compute $a^\star$ explicitly for a given $e^{r_f}$. When the basic period is doubled, the distribution of the cumulated risky return changes by convolution, and the optimal share shifts. This proves by example that “the Kelly fraction” is not invariant to the trading/rebalancing interval.

4. **Heavy-tailed log returns**

   The paper then studies how $a^\star$ changes when $r$ is drawn from heavier-tailed families rather than a normal law. The qualitative result is that heavier tails lower the MEL risky allocation because the lower tail of $e^r$ is more damaging to expected log growth. For the same mean and scale, the Kelly/MEL rule is more conservative under heavy-tailed log returns.

5. **Why the heavy-tail effect goes this way**

   Expected log wealth is particularly sensitive to downside mass because $\log$ is sharply concave near zero wealth multipliers. A mean-preserving spread in gross returns lowers $\mathbb E[\log(\cdot)]$. Thus, for fixed location, increasing tail risk tends to reduce the optimal exposure to the risky asset.

6. **Exact and approximate elements**

   Exact:
   - the MEL optimization problem in the two-asset model;
   - the uniqueness result from concavity;
   - the period-dependence examples.

   Comparative-static / model-based:
   - the heavy-tail conclusions depend on the parametric family used to represent tails and on holding fixed comparable moments or location parameters.

# 5. Domain of applicability

The paper applies to two-asset maximum-expected-log allocation with periodic rebalancing. Its strongest message is conceptual: the Kelly/MEL allocation is period-specific and distribution-specific, not a timeless scalar “fraction.” The results are less general in multi-asset settings and say little about estimation risk or transaction costs. The heavy-tail findings are informative, but they rely on how the tail family is parameterized; they are not a fully general theorem covering all distributions with “more tail risk.”
