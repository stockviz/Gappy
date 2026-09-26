# 1. Metadata

- **Title:** Optimal Leverage from Non-Ergodicity
- **Author(s):** Ole Peters
- **Year:** 2010
- **Journal/Venue:** Published article / preprint version in the file

# 2. Problem statement

The paper asks how leverage should be chosen when one distinguishes between **ensemble-average** and **time-average** growth in multiplicative wealth dynamics. The precise question is: **for a self-financing levered portfolio following geometric Brownian motion, what leverage maximizes the time-average growth rate, and why does this differ from the leverage suggested by expected-return calculations?**

# 3. Approach (short)

The method is stochastic calculus plus ergodicity analysis. Peters models levered portfolios as geometric Brownian motions, computes both the ensemble-average growth rate and the time-average growth rate, and shows that only the latter is relevant for a single realized wealth path over time. Ito’s lemma yields a concave time-average growth function with a finite maximizing leverage, which is exactly the continuous-time Kelly rule.

# 4. Approach (detailed)

1. **Levered geometric Brownian motion**

   Suppose an excess-return opportunity has drift $\mu$ and volatility $\sigma$. A self-financing levered portfolio with leverage $l$ has return process
   $$
   \frac{dW_t}{W_t} = l\mu\,dt + l\sigma\,dB_t.
   $$
   This is the continuous-time analogue of repeatedly betting a fraction $l$ on the risky opportunity.

2. **Ensemble-average growth**

   The expected infinitesimal return of wealth is
   $$
   E\!\left[\frac{dW_t}{W_t}\right] = l\mu\,dt.
   $$
   This quantity grows linearly in leverage and therefore never penalizes excessive leverage on its own.

3. **Time-average growth**

   Apply Itô’s lemma to $\log W_t$:
   $$
   d\log W_t = \left(l\mu - \frac12 l^2\sigma^2\right)dt + l\sigma\,dB_t.
   $$
   Hence the time-average growth rate is
   $$
   g(l)= l\mu - \frac12 l^2\sigma^2.
   $$
   This is the relevant long-run growth rate of a single investor’s realized wealth path.

4. **Optimal leverage**

   Maximizing $g(l)$ gives
   $$
   g'(l)=\mu-l\sigma^2=0
   \quad\Rightarrow\quad
   l^\star = \frac{\mu}{\sigma^2}.
   $$
   This is the optimal leverage. The critical leverage at which time-average growth falls to zero is
   $$
   l_{crit} = \frac{2\mu}{\sigma^2}.
   $$
   Beyond this point, expected wealth may still rise in ensemble average while the typical time-path shrinks.

5. **Interpretation**

   The quadratic penalty $-\tfrac12 l^2\sigma^2$ is the non-ergodicity correction. Ensemble averages ignore the pathwise compounding cost of volatility; time averages do not.

6. **Relation to Kelly and mean-variance**

   The result is a continuous-time Kelly rule. It also picks a point on the efficient frontier, but unlike mean-variance theory it does not rely on an externally chosen utility parameter. The leverage follows from the time-average growth criterion itself.

7. **Proof logic**

   The proof is one line of Itô calculus plus one line of optimization:

   - compute $d\log W_t$;
   - identify the drift as time-average growth;
   - maximize the drift with respect to $l$.

   The conceptual contribution is not algebraic difficulty but the insistence that the correct average for a multiplicative process is the time average, not the ensemble average.

# 5. Domain of applicability

- The result applies to **self-financing portfolios with geometric-Brownian-like multiplicative dynamics**.
- It is strongest as a critique of naive expected-return reasoning under leverage.
- The exact formulas rely on the GBM model. With jump risk, borrowing frictions, or drawdown constraints, the optimal leverage changes.
- The paper’s broad claim is about non-ergodicity; the explicit leverage formula is model-specific.
