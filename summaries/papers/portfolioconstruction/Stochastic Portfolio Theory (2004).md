# 1. Metadata

- **Title:** Stochastic Portfolio Theory
- **Author(s):** Bernd Brommundt
- **Year:** 2004
- **Journal/Venue:** University of St. Gallen working paper / lecture note

# 2. Problem statement

The paper introduces the core mathematical question of stochastic portfolio theory (SPT): **how can one analyze portfolio growth, relative performance, and market structure directly from the stochastic dynamics of market weights, without relying on equilibrium pricing or expected-return forecasts?** The emphasis is on excess growth, diversity, and functionally generated portfolios.

# 3. Approach (short)

The method is continuous-time stochastic calculus on capitalization processes and portfolio weights. Starting from Itô processes for stock capitalizations, the paper derives the wealth dynamics of arbitrary portfolios, isolates the excess-growth-rate term, studies relative wealth versus the market portfolio, and then introduces entropy-weighted and functionally generated portfolios. The class belongs to stochastic analysis rather than optimization.

# 4. Approach (detailed)

1. **Capitalization dynamics**

   Let stock capitalizations $X_i(t)$ satisfy
   $$
   d\log X_i(t)=\gamma_i(t)\,dt+\sum_{\nu=1}^d \xi_{i\nu}(t)\,dW_\nu(t),
   $$
   with covariance matrix
   $$
   \sigma_{ij}(t)=\sum_{\nu=1}^d \xi_{i\nu}(t)\xi_{j\nu}(t).
   $$
   SPT takes these dynamics as primitives rather than deriving them from equilibrium.

2. **Portfolio dynamics**

   A portfolio is a progressively measurable weight vector $\pi(t)$ with $\sum_i \pi_i(t)=1$. If $Z_\pi(t)$ is portfolio wealth, then Itô’s formula gives
   $$
   d\log Z_\pi(t)
   =
   \sum_i \pi_i(t)\, d\log X_i(t)
   + \gamma_\pi^\ast(t)\,dt,
   $$
   where
   $$
   \gamma_\pi^\ast(t)
   =
   \frac12\left(\sum_i \pi_i(t)\sigma_{ii}(t) - \sum_{i,j}\pi_i(t)\pi_j(t)\sigma_{ij}(t)\right).
   $$
   This is the **excess growth rate**.

3. **Interpretation of excess growth**

   $\gamma_\pi^\ast$ is half the difference between weighted average component variance and portfolio variance. For long-only diversified portfolios it is nonnegative. This is the fundamental SPT insight: diversification contributes directly to logarithmic growth, not only to lower variance.

4. **Market portfolio and relative wealth**

   Define market weights
   $$
   \mu_i(t)=\frac{X_i(t)}{\sum_j X_j(t)}.
   $$
   The market portfolio $\mu$ is the portfolio holding each stock in proportion to capitalization. Relative wealth of $\pi$ versus the market can be analyzed through
   $$
   d\log \frac{Z_\pi(t)}{Z_\mu(t)},
   $$
   which depends on relative drift and excess-growth differences.

5. **Diversity and long-run outperformance**

   The paper discusses **diverse markets**, where no single stock dominates market capitalization. Under diversity and nondegeneracy, constant-weight or entropy-weighted portfolios can outperform the market over long horizons because they harvest excess growth from continual rebalancing.

6. **Entropy-weighted portfolio**

   One example is the entropy-weighted portfolio, generated from the entropy function of market weights. The paper states the master-equation-style result that relative log wealth can be decomposed into:

   - a change in the generating function applied to market weights; and
   - an integral involving excess growth.

   This gives a pathwise explanation of outperformance under diversity.

7. **Functionally generated portfolios**

   More generally, choose a smooth generating function $S(\mu)$. The associated functionally generated portfolio has weights derived from the derivatives of $S$, and its relative wealth satisfies a master equation of the form
   $$
   \log\frac{Z_\pi(T)}{Z_\mu(T)}
   =
   \log\frac{S(\mu(T))}{S(\mu(0))}
   + \int_0^T \mathfrak g(t)\,dt,
   $$
   where $\mathfrak g$ is the drift process induced by the generating function and the covariance structure of market weights. This is the central exact result of SPT.

8. **Proof logic**

   The mathematics is Itô calculus:

   - write the stock and portfolio log dynamics;
   - isolate the quadratic-variation correction that becomes $\gamma_\pi^\ast$;
   - express market weights and relative wealth by Itô’s formula;
   - for generated portfolios, apply Itô’s formula to $S(\mu(t))$.

   No mean-variance approximation is used; the results are pathwise and exact.

# 5. Domain of applicability

- The theory applies to **continuous-time equity markets** modeled by semimartingale capitalizations.
- It is strongest for questions about **relative portfolio growth and market structure**, not for expected-return forecasting.
- The diversity-based outperformance results do not say that generated portfolios dominate in every finite sample; they require structural conditions such as diversity and nondegeneracy.
- The paper is an introduction, so it states more than it fully proves in places, but the core excess-growth and generated-portfolio formulas are standard exact SPT results.
