# Building Cross-Sectional Systematic Strategies by Learning to Rank

**Source:** [PortfolioRanking_PohLimZohren.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioRanking_PohLimZohren.pdf>)  
**Source coverage:** Full main article, model descriptions, training design, performance and ranking exhibits, and relevant appendix context.

## 1. Metadata

- **Title:** Building Cross-Sectional Systematic Strategies by Learning to Rank
- **Author(s):** Daniel Poh, Bryan Lim, Stefan Zohren, Stephen Roberts
- **Year:** 2021
- **Journal/Venue:** *The Journal of Financial Data Science*

## 2. Problem statement

The paper asks whether cross-sectional portfolio construction should use ranking-specific machine-learning objectives rather than standard pointwise prediction losses. In a cross-sectional momentum strategy, the investor ultimately needs an ordering of assets, not accurate mean-squared forecasts of each return. The problem is therefore to learn a ranking function that maximizes trading performance by better identifying the top and bottom assets at each rebalance.

## 3. Approach (short)

The method imports learning-to-rank (LTR) from information retrieval into portfolio construction. Each rebalance date is treated as a query, assets are documents, and next-period decile labels are relevance scores. The paper compares pointwise baselines with pairwise and listwise LTR models—RankNet, LambdaMART, ListNet, and ListMLE—and evaluates how improved ranking quality translates into long-short momentum performance.

## 4. Approach (detailed)

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

## 5. Domain of applicability

- The framework applies to cross-sectional strategies where the portfolio is formed from relative ranking rather than absolute return targets.
- It is especially suitable for long-short equity selection and other tail-selection problems.
- The paper does not prove universal superiority of pairwise or listwise methods; the result is application-specific.
- Performance still depends on features, universe construction, rebalancing frequency, and transaction-cost assumptions.
- The novel contribution is aligning the machine-learning loss with the actual portfolio-construction problem.


## 6. A ranking objective is a particular choice of economic surrogate

At each decision date the model receives a set of stock features and produces scores. Only their order determines membership in the long and short sleeves. An increasing transformation of all scores at a date leaves the selected securities unchanged, whereas it can radically change squared prediction error. This is the central reason to consider a ranking loss.

It does not imply that accurate conditional-mean prediction is theoretically irrelevant. If the true conditional means were known, ordering them would be appropriate for a simple equal-weight expected-return objective. The practical issue is how finite-sample learning allocates model capacity and penalizes mistakes. A ranking objective can prioritize relative comparisons useful for selection, while a pointwise objective may devote capacity to common movements or level calibration that selection does not use.

The source trains with returns 21 days ahead, even though trading occurs at month ends. Relevance labels are obtained from cross-sectional return ordering. Labels must be formed from the future outcome only for training and assessment; they must never enter contemporaneous features or live universe selection. Date-level grouping is integral to the loss: comparisons across unrelated market dates are not the same learning problem as comparisons among securities available simultaneously.

### 6.1 The losses and their different emphases

For RankNet, let $s_i$ and $s_j$ be predicted scores and let $y_{ij}$ indicate which asset should rank higher. A standard pair probability is

$$p_{ij}=\frac{1}{1+e^{-(s_i-s_j)}},$$

and the pairwise cross-entropy is $-y_{ij}\log p_{ij}-(1-y_{ij})\log(1-p_{ij})$. The loss depends on score differences, not an absolute return scale. Ties require an explicit convention. Exhaustive pairing is quadratic in cross-sectional size, although pair sampling can reduce computation.

LambdaMART combines boosted trees with ranking-oriented gradient signals. Comparisons whose reversal would have a larger effect on a ranking metric receive greater emphasis. It is therefore misleading to describe all four tested LTR methods as minimizing the same objective in different architectures.

ListNet forms softmax distributions from relevance labels and predicted scores and minimizes their cross-entropy. This uses the whole list while avoiding enumeration of every possible permutation. ListMLE instead maximizes the probability of a target ordering under a sequential choice model. In standard notation, for target permutation $\pi$,

$$-\log P(\pi\mid s)
=-\sum_{k=1}^n\left[s_{\pi(k)}-\log\sum_{j=k}^ne^{s_{\pi(j)}}\right].$$

These expressions explain the methods discussed in the source; they are not a claim that arbitrary neural-network parameterizations create a convex training problem. A loss can be convex in a free score vector and still be nonconvex in network weights. Similarly, a listwise formulation does not guarantee better out-of-sample performance than a pairwise one.

## 7. Ranking metrics and the portfolio mapping

For an ordered list with relevance values $q_j$, discounted cumulative gain has the conventional form

$$DCG@k=\sum_{j=1}^k\frac{2^{q_j}-1}{\log_2(j+1)},\qquad
NDCG@k=\frac{DCG@k}{IDCG@k}.$$

The ideal denominator is the gain obtained by ordering the same realized labels correctly. The cutoff $k=100$ matches each traded sleeve in the main test. For the short sleeve the authors reverse relevance so that the worst future returns receive the highest short-side relevance. Applying the long-side convention unchanged to shorts would evaluate the wrong objective.

NDCG emphasizes the selected tail, but it is still a surrogate for investor returns. It does not price transaction costs, model portfolio covariance, or distinguish a small and large economic mistake except through the chosen relevance transformation. Kendall's tau complements it by measuring ordering across the full list. Neither statistic alone determines the optimal holdings.

The trading rule selects 100 long and 100 short stocks, approximately the top and bottom deciles, and scales individual positions using estimated volatility. Daily volatility is estimated with a 63-day exponentially weighted window; the strategy is rebalanced monthly. The evaluation then applies an additional portfolio-level scaling to bring strategies near a 15% annual volatility target. Individual inverse-volatility scaling is not equivalent to targeting portfolio volatility when correlations change, hence the importance of distinguishing the two layers.

Equal numbers of long and short names do not ensure exact dollar or beta neutrality after heterogeneous volatility scaling. A production implementation would need explicit neutrality or exposure normalization if that were part of the mandate. Moreover, any portfolio-level scaling estimated from the evaluation sample should be regarded as an ex post comparison device unless a prospective estimator is specified. The source's reported performance should be interpreted under its stated normalization.

## 8. Dataset, training design, and reported evidence

The dataset consists of actively traded NYSE common stocks with CRSP share codes 10 and 11 from 1980–2019. Stocks must trade above $1 and have valid prices and trading history over the preceding year. These filters define the tested universe; the findings are not automatically about all US equities or illiquid small stocks.

Predictors are price-based momentum variables: raw 3-, 6-, and 12-month returns; volatility-normalized versions; and normalized MACD signals at multiple speeds and lags. The MACD group contributes 16 features. This keeps the application focused on momentum rather than combining an unrestricted collection of fundamental and macroeconomic predictors.

Models are retuned every five years, then held fixed for the following five-year out-of-sample interval. Neural rankers use two hidden layers, Adam, dropout, a 90%/10% training-validation partition, up to 100 epochs, and early stopping after 25 epochs without validation improvement. Hyperparameter search uses 50 trials. These details matter because architecture and tuning choices affect the comparison with the MLP regression baseline.

The main results are **before transaction costs**. The reported Sharpe ratios are 0.551 for the raw-return momentum rule, 0.696 for the MACD rule, 0.265 for the MLP, 1.502 for RankNet, 2.156 for LambdaMART, 1.970 for ListNet, and 1.611 for ListMLE. LambdaMART's roughly threefold improvement refers naturally to its comparison with the stronger heuristic baseline, not an invariant multiplier across methods or samples.

The rank improvements are numerically much smaller than the return improvements. Long-side NDCG@100 rises from 0.555 for raw momentum and 0.562 for MACD to 0.576 for LambdaMART; short-side values are 0.562, 0.555, and 0.585 respectively. The relevant point is that persistent small cross-sectional improvements can matter for repeated tail selection. It is not that the ranker predicts almost perfectly: reported Kendall correlations remain low, around 0.032 for LambdaMART.

Decile tests divide the cross-section into actual equal-sized deciles, unlike the main fixed-100-stock sleeves. The steeper relationship between predicted rank and realized performance for LTR models supports the proposed mechanism. There is no consistent dominance of listwise over pairwise learning; LambdaMART performs best on many financial metrics, while ListNet has slightly stronger full-list rank correlation.

## 9. What remains to be demonstrated before implementation

The paper demonstrates a useful empirical alignment between a ranking task and ranking-specific training. It does not establish that better NDCG necessarily means better net portfolio performance. A strategy can improve tail ordering while selecting less liquid stocks, increasing turnover, taking concentrated factor exposures, or requiring expensive shorts.

A careful replication would preserve chronological splits, ensure point-in-time universes and delisting treatment, and prevent overlap of forward-return labels from leaking across training and validation boundaries. Five-year out-of-sample windows do not by themselves establish that every internal tuning split is free from overlap. These are replication checks, not assertions that the paper's implementation violated them.

It would also compare methods at common constraints, realistic borrow availability, and estimated net costs; report turnover and exposure; and assess uncertainty using dependence-aware methods across rebalance dates. Pairwise construction creates many training pairs, but those pairs are not independent observations when they reuse the same assets and date. Their quadratic count should not be interpreted as a quadratic increase in independent financial information.

The generalizable idea is to choose the prediction target and loss around the decision being made. For tail-selection portfolios, ordering deserves direct attention. For portfolios that optimize dollar allocations using calibrated expected returns, costs, and covariance, a ranking-only score may need an additional calibration layer or a joint economic objective.
