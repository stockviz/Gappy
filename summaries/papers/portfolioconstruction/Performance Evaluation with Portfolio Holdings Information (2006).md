# 1. Metadata

- **Title:** Performance Evaluation with Portfolio Holdings Information
- **Author(s):** Russ Wermers
- **Year:** 2006
- **Journal/Venue:** *North American Journal of Economics and Finance*

# 2. Problem statement

The paper asks how portfolio holdings can improve manager evaluation: **can one use the actual security weights held by a manager to construct better performance measures and attributions than standard returns-based alpha, especially in the presence of Roll’s benchmark-choice problem?**

# 3. Approach (short)

The paper is a survey of holdings-based performance measurement. It reviews self-benchmarking covariance-style measures, dynamic benchmark construction from lagged holdings, characteristic-based benchmarks such as DGTW, and conditional extensions that strip out public-information effects. The common idea is to evaluate performance at the security-holdings level rather than only from aggregate fund returns.

# 4. Approach (detailed)

1. **Why returns-based alpha is problematic**

   Returns-based performance measures use regressions of fund returns on benchmark returns. Roll’s critique implies that rankings can change when the benchmark changes if the benchmark is not mean-variance efficient. This motivates a holdings-level alternative.

2. **Grinblatt-Titman logic**

   A holdings-based measure asks whether the manager overweights securities that subsequently outperform. In stylized form, if $w_{j,t-1}$ is the portfolio weight on stock $j$ and $R_{j,t}$ its realized return, then a covariance-style performance measure is based on
   $$
   \sum_j w_{j,t-1} R_{j,t},
   $$
   compared against a benchmark formed from expected or lagged weights rather than a fixed external index.

3. **Self-benchmarking**

   The Copeland-Mayers / Grinblatt-Titman approach forms a “homemade” dynamic benchmark from the manager’s own lagged holdings. The idea is that if weights are informative and the manager has skill, current holdings should forecast future returns better than stale or expected holdings do.

4. **Characteristic-based benchmarks**

   Daniel, Grinblatt, Titman, and Wermers (DGTW) match each held stock to a portfolio of stocks with similar characteristics (size, book-to-market, momentum). If stock $j$ has benchmark return $R_{j,t}^{bench}$, then the characteristic-selectivity measure aggregates
   $$
   \sum_j w_{j,t-1}\big(R_{j,t}-R_{j,t}^{bench}\big).
   $$
   This security-level benchmarking is more precise than comparing the whole fund to a broad market index.

5. **Decomposition**

   Holdings-based measures can be decomposed into:

   - characteristic selectivity;
   - style or timing components;
   - industry bets;
   - residual stock-picking skill.

   Because the decomposition is additive across securities or groups, it provides much richer attribution than a single regression alpha.

6. **Conditional extensions**

   Conditional holdings-based methods use instruments $Z_{t-1}$ to form conditional expected weights $E[w_{j,t-1}\mid Z_{t-1}]$. The residual
   $$
   w_{j,t-1} - E[w_{j,t-1}\mid Z_{t-1}]
   $$
   isolates active deviations from publicly predictable positions. This separates skill from mechanical exposure to conditioning information.

7. **What is actually proved**

   The paper is a survey, so its contribution is organizational rather than theorem-producing. The core logical claim is that holdings-based methods mitigate benchmark misspecification because they benchmark at the security level and can use evolving, manager-specific benchmark portfolios rather than a static index proxy.

# 5. Domain of applicability

- The methods apply to **active-manager performance measurement** when holdings data are available.
- They are especially useful for mutual funds and institutional equity portfolios with disclosed positions.
- Holdings-based measures still require benchmark design choices, especially for characteristic matching and expected weights; they do not eliminate all model dependence.
- The paper is broader than a single estimator and should be read as a survey map of the holdings-based literature.
