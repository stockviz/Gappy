# Growth Optimal Investment Strategy The Impact of Reallocation Frequency and Heavy Tails (2012)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_BambergNeuhierl_2011.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

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
   The objective is concave in $a$, and strictly concave for a nondegenerate risky payoff; the latter condition ensures uniqueness.

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

## 6. Exact first-order condition and the symmetry result

The library copy appears in *German Economic Review* 13(2), pp. 228-240, with a 2011 copyright date; the summary filename uses the journal-year convention 2012. Put $Y=e^{r-r_f}$. The objective, after removing the cash return, is

$$
g(a)=E\log(1-a+aY).
$$

For an interior allocation,

$$
g'(a)=E\frac{Y-1}{1-a+aY},\qquad
g''(a)=-E\frac{(Y-1)^2}{(1-a+aY)^2}\le0.
$$

Strict concavity requires a nondegenerate opportunity, $P(Y\ne1)>0$; concavity alone does not imply uniqueness in the degenerate all-cash-equivalent case. For $a$ bounded away from zero and one, the derivative is bounded even when some moments of $Y$ are infinite, making interior root finding much more stable than estimating the arithmetic mean of the gross return.

At $a=1/2$,

$$
g'(1/2)=2E\left[\tanh\left(\frac{r-r_f}{2}\right)\right].
$$

If log returns have a distribution symmetric around $\mu=r_f$, oddness of the hyperbolic tangent gives zero derivative and the optimum is exactly one half. If the symmetric distribution is shifted to $\mu>r_f$, monotonicity gives a positive derivative at one half and hence $a^*>1/2$ (possibly the upper boundary). This remains true however heavy the tails are, within the stated finite-log-expectation setting. It is the strongest qualification to the headline “heavier tails imply a smaller risky share.”

A spread in log returns is not the same as a mean-preserving spread in gross returns. Exponentiation changes arithmetic moments and can make them infinite. Therefore the paper's comparisons should not be read as holding every economically relevant moment fixed. The lower-tail intuition is useful, but the precise result depends on the location, scale and shape comparison.

## 7. Rebalancing-frequency calculation

For equal probabilities of gross risky return 2 and 0.25, and cash gross return 1.05, the one-period first-order condition produces

$$
a^*=\frac{1.05(1.125-1.05)}{(2-1.05)(1.05-0.25)}
\approx0.1036.
$$

Over two independent periods without interim rebalancing, risky gross returns become 4, 0.5 and 1/16 with probabilities 1/4, 1/2 and 1/4; cash becomes $1.05^2$. Optimizing this new buy-and-hold payoff yields approximately 0.0813. It is not equivalent to compounding the one-period rebalanced portfolio, since the latter restores the target allocation between observations.

The paper explicitly warns against inferring monotonicity from this example. Other distributions can make the optimal initial risky weight increase when the rebalancing interval lengthens. The valid conclusion is horizon dependence, not a universal direction of the effect. Comparisons of asymptotic growth must use a common calendar horizon; a per-period growth rate changes units when the period changes.

## 8. Distribution experiments and what they compare

The normal benchmark uses log-return mean 0.06, standard deviation 0.3 and cash log return 0.03, giving a numerically optimal risky share of 0.8378. The paper then varies parameters of Laplace, power-Laplace, Student-t and symmetric stable distributions. In the reported Student-t table, the risky share rises from about 0.66 at three degrees of freedom toward 0.83 at high degrees of freedom. In the stable table, it rises from about 0.58 at stability index 1.1 to 0.84 at index 2.

These are parametric illustrations, not fitted estimates of an actual equity-index allocation. The stable family includes infinite-variance cases, so “same volatility” is not even a well-defined common normalization throughout that comparison. The source also notes that a normal distribution with substantially larger standard deviation can produce a similarly conservative allocation, showing that a particular Kelly fraction does not identify the tail model.

For many heavy-tailed log-return laws, $E[e^r]=\infty$ even though $E|r|<\infty$. The arithmetic expected return, variance, and some conventional mean-variance calculations then fail, while expected log portfolio wealth can remain finite for long-only allocations. For $0<a<1$, the cash component bounds the log payoff below, and its upper growth is at most a constant plus $r^+$. This is a specific robustness of the log objective's integrability, not proof that all tail-based risk measures are harmless.

## 9. Costs and application limits

Appendix A.2 considers a proportional charge $\tau$ on the risky amount invested. It replaces $r$ by $r-c$ with $c=-\log(1-\tau)$, approximately $\tau$ for small costs. This is a simple adjustment for the modeled purchase cost. A repeated strategy with costs on actual changes in holdings requires tracking pretrade weights and distinguishing purchases from sales; charging every period on the entire risky allocation is a different model. The appendix does not solve a general dynamic no-trade-band problem.

For replication, specify the return convention, horizon, positivity constraints and distribution scaling first; numerically evaluate the bounded interior derivative; check endpoint cases; and compare growth per unit calendar time. Estimation uncertainty in the tail model and the log-return location may dominate the differences between stylized distributions. The paper's contribution is to make those modeling choices visible and to show that growth-optimal allocation is sensitive to rebalancing and distribution assumptions even in a two-asset economy.
