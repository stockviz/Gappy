# 1. Metadata

- **Title:** Internal Regret in On-line Portfolio Selection
- **Author(s):** Gilles Stoltz, Gábor Lugosi
- **Year:** 2004
- **Journal/Venue:** Working paper / manuscript

# 2. Problem statement

The paper asks whether online portfolio strategies can satisfy a stronger benchmark than external regret: **can one design sequential investment rules whose cumulative performance has vanishing internal regret, while still achieving wealth almost as large as the best constant rebalanced portfolio?** Internal regret means the investor should not wish, ex post, that every time one action was used it had been replaced by another.

# 3. Approach (short)

The method imports regret theory from sequential prediction into online portfolio selection. The authors define portfolio analogues of external and internal regret in terms of logarithmic wealth, construct finite and continuum classes of “swap” transformations on portfolio rules, and then apply calibrated/internal-regret-minimizing prediction algorithms to these transformed experts. Some of the resulting strategies also retain CRP-competitiveness.

# 4. Approach (detailed)

1. **External regret benchmark**

   Standard universal portfolios minimize
   $$
   \log S_T^\star - \log S_T,
   $$
   where $S_T^\star$ is the wealth of the best CRP. This is the portfolio analogue of external regret.

2. **Internal regret**

   Internal regret is stronger. In prediction, it asks whether one regrets not replacing action $i$ by action $j$ whenever $i$ was chosen. In portfolio language, the paper defines transformations of a base strategy and compares realized log wealth under such systematic substitutions. A strategy has small internal regret if no such systematic replacement yields a linear improvement in cumulative log wealth.

3. **Reduction to fictitious experts**

   The authors build a pool of fictitious experts corresponding to action-swapping rules. Running an external-regret minimizer on this enlarged pool yields an internal-regret minimizer on the original problem. This is the classic Blackwell/Foster-Vohra construction adapted to portfolio payoffs.

4. **Portfolio implementation**

   The instantaneous payoff is logarithmic:
   $$
   \ell_t(w)=\log(w^\top x_t).
   $$
   The sequential strategy chooses a portfolio distribution over transformed experts, then computes a fixed point whose induced portfolio has the required internal-regret guarantee.

5. **Main result**

   The paper proves sublinear internal regret:
   $$
   \max_{\text{swap rules}} R_T^{int} = o(T).
   $$
   Moreover, some of the proposed strategies also maintain cumulative wealth close to that of the best CRP, so the stronger no-regret requirement does not destroy the classical universal-portfolio benchmark.

6. **Continuum extension**

   The paper then generalizes from finite expert sets to an uncountable class of portfolio rules using a Cover-style continuum mixture argument. This is conceptually important because the natural comparison class in portfolio selection is continuous.

7. **Proof logic**

   The proof is built from general regret theory:

   - external-regret algorithms for finite pools;
   - construction of swap experts;
   - fixed-point argument mapping expert mixtures back to portfolio allocations;
   - continuum generalization via mixture distributions over strategies.

   The novelty is the adaptation of internal regret to logarithmic-wealth payoffs.

# 5. Domain of applicability

- The results apply to **adversarial online portfolio selection**, not just stochastic markets.
- They are strongest when the benchmark of interest is richer than the best CRP and stability under action substitutions matters.
- The algorithms are more complex than standard external-regret universal portfolios.
- As usual in online portfolio theory, transaction costs are omitted and can materially weaken practical performance.
