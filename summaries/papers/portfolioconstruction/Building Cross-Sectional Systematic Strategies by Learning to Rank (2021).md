# 1. Metadata

- **Title:** Building Cross-Sectional Systematic Strategies by Learning to Rank
- **Author(s):** Daniel Poh, Bryan Lim, Stefan Zohren, Stephen Roberts
- **Year:** 2021
- **Journal/Venue:** *The Journal of Financial Data Science*

# 2. Problem statement

The paper asks whether cross-sectional portfolio construction should use ranking-specific machine-learning objectives rather than standard pointwise prediction losses. In a cross-sectional momentum strategy, the investor ultimately needs an ordering of assets, not accurate mean-squared forecasts of each return. The problem is therefore to learn a ranking function that maximizes trading performance by better identifying the top and bottom assets at each rebalance.

# 3. Approach (short)

The method imports learning-to-rank (LTR) from information retrieval into portfolio construction. Each rebalance date is treated as a query, assets are documents, and next-period decile labels are relevance scores. The paper compares pointwise baselines with pairwise and listwise LTR models—RankNet, LambdaMART, ListNet, and ListMLE—and evaluates how improved ranking quality translates into long-short momentum performance.

# 4. Approach (detailed)

1. **Cross-sectional momentum setup**

   At each rebalance $b_i$, the universe is $e_i=\{e_i^{(1)},\dots,e_i^{(n_i)}\}$. Each asset has feature vector
   $$
   u_i^{(j)}=\phi(b_i,e_i^{(j)}),
   $$
   and is assigned a next-period decile label
   $$
   \delta_{i+1}^{(j)}\in\{D_1,\dots,D_{10}\}.
   $$
   The learning problem is to infer a score function $g$ so that sorting $g(u_i^{(j)})$ ranks assets by future relative return.

2. **Why pointwise regression is misaligned**

   Standard models minimize mean-squared forecast error
   $$
   \min_f \sum (y-\hat y)^2,
   $$
   but cross-sectional strategies care only about order. A regression model can forecast levels reasonably yet still order assets poorly at the tails, which is exactly where long-short portfolio formation is determined.

3. **Learning-to-rank formulations**

   - **Pairwise:** learn which of two assets should rank higher.
   - **Listwise:** learn the ranking of the whole cross-section directly.

   The paper highlights four LTR algorithms:
   - **RankNet:** neural net trained on pairwise cross-entropy loss.
   - **LambdaMART:** boosted trees using LambdaRank-style gradients targeted at ranking metrics.
   - **ListNet:** listwise cross-entropy between softmax-normalized true and predicted score lists.
   - **ListMLE:** listwise maximum-likelihood objective over permutations.

4. **Ranking metric**

   Portfolio quality is tied to top- and bottom-tail accuracy, so the paper uses normalized discounted cumulative gain,
   $$
   \text{NDCG}@k,
   $$
   especially at $k=100$, matching the size of each long and short sleeve. This is better aligned with portfolio construction than global MSE because it emphasizes the top-ranked names actually traded.

5. **Portfolio construction**

   Given model scores $g(u_m)$ at rebalance $m$, assets are sorted and the top/bottom sets are used to form long-short portfolios. The paper also studies decile portfolios to show that better ranking sharpens the return spread across deciles.

6. **Empirical result**

   All LTR models outperform pointwise baselines in ranking quality, and that carries through to trading performance. The paper reports materially higher NDCG@100 values and approximately threefold Sharpe-ratio improvements in the momentum case study for the best LTR models relative to the simpler baselines.

7. **Why the improvement is economically meaningful**

   The decile analysis is important. Better rank learning steepens the monotonic relation between predicted rank and realized decile return, so the long-minus-short spread widens. The argument is not simply “machine learning works,” but that a ranking-consistent loss is the right objective for a ranking-based portfolio.

8. **What is exact and what is empirical**

   - The mapping from rebalances to queries and assets to documents is exact as a reformulation.
   - The definition of NDCG and the LTR loss functions are exact.
   - The claim that LTR improves portfolio performance is empirical and shown in the momentum application.

# 5. Domain of applicability

- The framework applies to cross-sectional strategies where the portfolio is formed from relative ranking rather than absolute return targets.
- It is especially suitable for long-short equity selection and other tail-selection problems.
- The paper does not prove universal superiority of pairwise or listwise methods; the result is application-specific.
- Performance still depends on features, universe construction, rebalancing frequency, and transaction-cost assumptions.
- The novel contribution is aligning the machine-learning loss with the actual portfolio-construction problem.
