# 1. Metadata

- **Title:** Online Portfolio Selection: A Survey
- **Author(s):** Bin Li, Steven C. H. Hoi
- **Year:** 2013
- **Journal/Venue:** *ACM Computing Surveys* preprint / survey article

# 2. Problem statement

The paper asks a classification-and-synthesis question: **how should the online portfolio selection literature be organized algorithmically, what update rules define the main methods, and how do those methods relate to capital-growth theory?**

# 3. Approach (short)

The article is a comprehensive survey from an online-learning viewpoint. It formalizes online portfolio selection as sequential decision-making with rebalancing, then groups algorithms into benchmarks, Follow-the-Winner, Follow-the-Loser, Pattern-Matching, and Meta-Learning classes. The contribution is structural understanding rather than a new optimization theorem.

# 4. Approach (detailed)

1. **Formal online portfolio model**

   There are $m$ assets and $n$ periods. At period $t$, the investor chooses
   $$
   b_t\in\Delta_m,
   $$
   then observes price relatives $x_t\in\mathbb R_+^m$. Wealth evolves as
   $$
   S_n = S_0\prod_{t=1}^n b_t^\top x_t.
   $$
   The natural objective is cumulative log wealth,
   $$
   \log\frac{S_n}{S_0}=\sum_{t=1}^n \log(b_t^\top x_t).
   $$

2. **Benchmark class**

   The survey begins with Buy-and-Hold, Best Stock, Constant Rebalanced Portfolios, and Universal Portfolios. These are not merely examples; they provide comparison standards and motivate regret or competitive-ratio analysis.

3. **Follow-the-Winner**

   These algorithms move capital toward assets or experts that have recently performed well. The survey places in this class:
   - Universal Portfolio / Aggregating-type algorithms;
   - Exponential Gradient:
     $$
     b_{t+1,i}\propto b_{t,i}\exp\!\left(\eta \frac{x_{t,i}}{b_t^\top x_t}\right);
     $$
   - Follow-the-Leader / Follow-the-Regularized-Leader variants.

   The common logic is to approximate or compete with the best CRP or best expert in hindsight.

4. **Follow-the-Loser**

   These algorithms implement mean reversion. Capital is shifted away from assets that have just risen and toward recent losers. Examples surveyed include Anticor, Passive-Aggressive Mean Reversion, Confidence-Weighted Mean Reversion, and robust median-reversion variants. The article emphasizes that this is economically opposite to momentum but often effective empirically.

5. **Pattern-Matching**

   These methods estimate a predictive conditional distribution of future returns by selecting historical windows similar to the current one, then solve a portfolio problem on that empirical conditional law. The survey decomposes them into:
   - sample-selection rule;
   - portfolio-optimization rule.

   Kernel, histogram, nearest-neighbor, semi-log-optimal, Markowitz-type, and GV-type strategies are all presented as combinations of these two modules.

6. **Meta-learning**

   The survey then covers algorithms that combine underlying portfolio rules rather than choosing one. This includes Aggregating Algorithm variants, universalization methods, Online Gradient Updates, Online Newton Updates, and switching/leading-history methods. The generic form is to update expert weights based on past loss and combine portfolios accordingly.

7. **Connection to capital-growth theory**

   A distinctive section of the survey reconnects the algorithmic literature to Kelly/Cover growth-optimality. For instance, the best CRP in an i.i.d. market solves
   $$
   b^\star\in \arg\max_{b\in\Delta_m}\mathbb E[\log(b^\top X)],
   $$
   and universal portfolios aim to match its growth without knowing the distribution. Pattern-matching methods can likewise be read as estimating the conditional law of $X_{t+1}$ and then applying a local log-growth optimizer.

8. **What is proved versus what is catalogued**

   The survey itself proves essentially no new master theorem. Its role is to collect theorems from the literature: competitive-regret bounds for universal/exponential-gradient methods, universal-consistency results for nonparametric log-optimal rules, and empirical comparisons across algorithm classes. Its real contribution is organizational.

# 5. Domain of applicability

The article is applicable as a map of the online portfolio selection literature up to roughly 2013. It is strongest when the reader wants algorithm classes, update rules, and conceptual links to capital-growth theory. Because it is a survey, broad claims about “state of the art” are time-stamped, and several empirical conclusions depend on frictionless backtest conventions. The theoretical guarantees it cites vary widely across classes: regret bounds for some methods, asymptotic consistency for others, and only empirical success for many.
