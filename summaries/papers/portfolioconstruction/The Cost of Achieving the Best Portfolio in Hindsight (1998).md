# 1. Metadata

- **Title:** The Cost of Achieving the Best Portfolio in Hindsight
- **Author(s):** Erik Ordentlich, Thomas M. Cover
- **Year:** 1998
- **Journal/Venue:** *Mathematics of Operations Research* / working-paper version dated 1997

# 2. Problem statement

Fix $m$ assets and horizon $n$. Let
$$
S_n^\star(x^n)=\max_{b\in\Delta_m}\prod_{t=1}^n b^\top x_t
$$
be the wealth of the best constant rebalanced portfolio (CRP) in hindsight. The paper asks: **what is the largest guaranteed fraction of $S_n^\star$ that any nonanticipating strategy can secure uniformly over all market sequences, and what strategy attains it?**

# 3. Approach (short)

The method is adversarial game theory plus combinatorial entropy bounds. Ordentlich and Cover cast the problem as a max-min game between the investor and the market, identify the exact value of the game, show that Cover’s universal-style strategy attains it, and interpret the value both as the universalization cost of matching the hindsight CRP and as the price of a hindsight-allocation derivative.

# 4. Approach (detailed)

1. **Benchmark and guaranteed-performance ratio**

   For a market path $x^n=(x_1,\dots,x_n)$, the best hindsight CRP earns
   $$
   S_n^\star(x^n)=\max_{b\in\Delta_m}\prod_{t=1}^n b^\top x_t.
   $$
   A nonanticipating strategy $\hat b_t(x^{t-1})$ earns
   $$
   \hat S_n(x^n)=\prod_{t=1}^n \hat b_t^\top x_t.
   $$
   The object is the worst-case ratio
   $$
   \inf_{x^n}\frac{\hat S_n(x^n)}{S_n^\star(x^n)}.
   $$
   The optimal guarantee is the supremum over all strategies of this infimum.

2. **Exact value of the game**

   The main theorem identifies the game value as
   $$
   V_n
   =
   \left(
   \sum_{\substack{n_1+\cdots+n_m=n\\ n_i\ge 0}}
   \binom{n}{n_1,\dots,n_m}
   \prod_{i=1}^m \left(\frac{n_i}{n}\right)^{n_i}
   \right)^{-1}.
   $$
   Equivalently, using entropy,
   $$
   V_n^{-1}
   =
   \sum_{n_1+\cdots+n_m=n}
   e^{-nH(n_1/n,\dots,n_m/n)}
   \binom{n}{n_1,\dots,n_m}.
   $$
   This is exact, not asymptotic.

3. **Construct the optimal strategy**

   The strategy is a universal mixture over CRPs: average terminal wealth over all constant rebalanced portfolios and use the wealth-weighted posterior mean portfolio at each date. In continuous form this is the universal-portfolio strategy
   $$
   \hat S_n=\int_{\Delta_m} S_n(b)\,d\pi(b)
   $$
   with a suitable prior $\pi$, and the corresponding next-period allocation is the normalized wealth-weighted average of $b$ under the posterior induced by $S_n(b)$.

4. **Why the worst case reduces to Kelly sequences**

   The minimax argument shows it suffices to consider extreme market paths that at each date place all return on a single asset. Then the relevant statistic of the path is the count vector $(n_1,\dots,n_m)$ of how often each asset is the winner. For such a path the hindsight-CRP wealth is
   $$
   S_n^\star
   =
   \max_{b\in\Delta_m}\prod_{i=1}^m b_i^{n_i}
   =
   \prod_{i=1}^m \left(\frac{n_i}{n}\right)^{n_i},
   $$
   by the multinomial maximum achieved at $b_i=n_i/n$.

5. **Proof sketch of the value**

   The proof has two directions.

   - **Upper bound:** for any strategy, sum its wealth over all Kelly sequences with the same count vector structure. Since total wealth allocated across all such paths cannot exceed one unit times the number of paths, averaging arguments imply the strategy cannot guarantee more than $V_n$.

   - **Lower bound / attainability:** the universal mixture allocates initial capital across all CRPs. On each Kelly sequence, the wealth of the mixture is exactly the average of $S_n(b)$ over the simplex. Evaluating this integral yields the same combinatorial expression above, showing the strategy attains $V_n$.

   This establishes the max-min ratio exactly.

6. **Asymptotics**

   Stirling approximation implies
   $$
   V_n \asymp n^{-(m-1)/2}
   $$
   up to constants depending on $m$. Therefore
   $$
   \frac{1}{n}\log V_n \to 0.
   $$
   So the cost of universality is only polynomial in $n$, whereas $S_n^\star$ is typically exponential in $n$. This is the precise asymptotic sense in which universal strategies match the hindsight CRP growth rate.

7. **Derivative-security interpretation**

   The paper also interprets $S_n^\star$ as the payoff of a “hindsight allocation option.” The exact quantity $1/V_n$ is then the minimal superhedging cost of delivering that payoff pathwise. This turns the universal-portfolio guarantee into an option-pricing statement.

# 5. Domain of applicability

The theorem applies in frictionless markets with no transaction costs, continuous divisibility, and comparison against the class of constant rebalanced portfolios. It is strongest in adversarial or model-free settings because the guarantee is pathwise. It does **not** say a strategy can match the best fully dynamic hindsight strategy; the benchmark is deliberately restricted to CRPs. The option-pricing interpretation is exact only in the idealized frictionless framework. In practical markets, rebalancing costs and leverage limits can easily dominate the polynomial universalization cost.
