# Stochastic Portfolio Theory (2004)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/StochasticPortfolioTheory_Brommundt_2004.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

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

   The paper discusses **diverse markets**, where no single stock dominates market capitalization. Under suitable structural assumptions, generated portfolios can outperform over sufficiently long horizons. Constant-weight claims additionally require control of individual market-weight decay, as explained below.

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

# 6. Relative covariance and the exact generated-portfolio identity

This is Brommundt's May 2004 introductory note, which explicitly omits most proofs. It should be distinguished from Fernholz's book of the same name. The base model fixes the number of companies and shares, excludes entry, failure, mergers, taxes and trading costs, and assumes continuous trading. Those restrictions are substantive when interpreting a real capitalization-weighted index.

Define covariance relative to the market by
$$
\tau_{ij}^{\mu}=\sigma_{ij}-\sigma_{i\mu}-\sigma_{j\mu}+\sigma_{\mu\mu},\qquad
\sigma_{i\mu}=\sum_k\mu_k\sigma_{ik}.
$$
Market-weight quadratic covariation is $d\langle\mu_i,\mu_j\rangle=\mu_i\mu_j\tau_{ij}^{\mu}dt$. For a positive $C^2$ generating function $G$, the generated weights are
$$
\pi_i=\mu_i\left[\partial_i\log G+1-\sum_j\mu_j\partial_j\log G\right].
$$
They sum to one. Positivity of $G$ alone does not imply all weights are nonnegative; that property must be checked for the chosen generator. Appropriate boundedness and integrability conditions are also needed for an admissible portfolio.

The master equation is
$$
\log\frac{Z_\pi(T)/Z_\pi(0)}{Z_\mu(T)/Z_\mu(0)}
=\log\frac{G(\mu(T))}{G(\mu(0))}
-\frac12\int_0^T\frac{\sum_{i,j}G_{ij}(\mu_t)\mu_i\mu_j\tau_{ij}^{\mu}}{G(\mu_t)}dt.
$$
The explicit stochastic integral cancels after matching the generated weights. If $G$ is concave, the Hessian is negative semidefinite and the integral drift is nonnegative. The generating-function change can nevertheless be negative. Finite-horizon outperformance requires accumulated drift to overcome that endpoint movement.

# 7. Entropy, constant weights and market assumptions

For entropy $H(\mu)=-\sum_i\mu_i\log\mu_i$, the weights simplify to $\pi_i=-\mu_i\log\mu_i/H(\mu)$ and
$$
\log\frac{Z_\pi(T)/Z_\pi(0)}{Z_\mu(T)/Z_\mu(0)}
=\log\frac{H(\mu(T))}{H(\mu(0))}+\int_0^T\frac{\gamma_\mu^*(t)}{H(\mu(t))}dt.
$$
Since $0<H\leq\log n$, a uniform positive lower bound on entropy and a positive lower bound on market excess growth produce a bounded endpoint loss and a linearly accumulating positive term. For example, if $H\geq h_0>0$ and $\gamma_\mu^*\geq c>0$, relative log wealth is at least $\log[h_0/H(\mu(0))]+cT/\log n$. This explanatory bound shows why the theorem needs sufficient horizon and quantitative structural assumptions.

A constant-weight portfolio $p$ is generated by $G(\mu)=\prod_i\mu_i^{p_i}$. Its master equation has drift $\gamma_p^*$, but its endpoint term includes $\sum_i p_i\log\mu_i(T)$. If one constituent disappears rapidly in relative capitalization, that term can overwhelm the rebalancing benefit. The note's constant-weight long-run statement is situated in its **coherence** discussion, where $\log\mu_i(T)/T\to0$ under appropriate regularity. Diversity alone merely prevents one stock from dominating and does not prevent another from decaying exponentially. Hence one must not infer that every fixed-weight portfolio beats a diverse market.

Strict positivity of excess growth also needs actual relative variation. If all assets have identical returns, diversification produces zero excess growth regardless of how many weights are positive. Nondegeneracy supplies the missing lower bound in the relevant results.

# 8. Examples and source qualifications

The note includes a concave quadratic generator $G(x)=1-\frac12\sum_i x_i^2$ and a sufficient long-horizon relative-arbitrage bound under nondegeneracy and weak diversity. Direct substitution into the general formula yields
$$
\pi_i=\mu_i\left[\frac{2-\mu_i}{G(\mu)}-1\right].
$$
This example illustrates an advantage of a generator bounded away from zero on the simplex: endpoint losses have a uniform bound. It does not imply a short-horizon arbitrage in actual markets with costs, discrete rebalancing and changing constituents.

The Swiss-market illustration uses seven quarterly observations ending in 2004Q1 and a broad set of roughly 240 possible SMI candidates. Estimated market entropy rises from $2.80$ to $2.96$ over the displayed interval. The five largest companies account for roughly $66.7\%$–$71.5\%$ of capitalization. In the narrower portfolio illustration, reported cumulative returns are $25.86\%$ for the entropy-weighted portfolio and $10.8\%$ for the market; the entropy portfolio underperforms in one declining quarter.

The source itself says the sample is too small to infer a relationship between entropy and performance. It is not an independently validated arbitrage test. The note also contains a statement that maximum entropy would be about 30,000; for normalized weights and natural logs the correct maximum is $\log n$, about $5.48$ for 240 stocks. The displayed entropy definition, rather than that numerical sentence, determines the units.

# 9. Implementation and interpretation

A reconstruction needs point-in-time market capitalizations, corporate-action and dividend treatment, a declared rebalancing schedule and exact self-financing accounting. The master equation describes continuous portfolios on a fixed universe; fees and discrete trades create differences that must be measured. Rank-based generators additionally bring local-time terms when stocks exchange ranks, which should not be omitted by using the smooth name-based formula unchanged.

The useful conceptual separation is between arithmetic drift forecasts and structural relative-growth identities. SPT can express relative performance without estimating each stock's expected return, but proving positive outperformance still requires assumptions on market weights and covariation. A positive excess-growth term is not free profit: it is one term in an exact decomposition with an endpoint change and implementation costs. This note is a helpful introduction to that accounting, with its informal theorem statements best read alongside their stated market restrictions.
