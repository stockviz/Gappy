# Are Optimizers Error Maximizers (2006)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioOptimization_Kritzman_2006.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

## 1. Metadata

- **Title:** Are Optimizers Error Maximizers?
- **Author(s):** Mark Kritzman
- **Year:** 2006
- **Journal/Venue:** *Journal of Portfolio Management*

## 2. Problem statement

The paper asks whether mean-variance optimizers are genuinely "error maximizers." More precisely: when the inputs $(\mu,\Sigma)$ are estimated with error, do those errors produce economically large mistakes in the optimized portfolio, or do they merely produce large changes in **weights** that have little effect on the resulting portfolio return distribution?

## 3. Approach (short)

Kritzman uses comparative statics and calibrated numerical examples inside a standard mean-variance framework. The key move is to evaluate sensitivity not by the turnover required to move from the misestimated optimum to the true optimum, but by changes in economically relevant distributional objects such as loss probabilities and value at risk. The method is mean-variance optimization plus robustness assessment by induced portfolio distribution.

## 4. Approach (detailed)

1. **Formulate the standard optimization problem.**

   For assets with expected returns $\mu$ and covariance matrix $\Sigma$, and risk-aversion coefficient $\lambda$, the optimal portfolio solves
   $$
   w^*=\arg\max_w \left\{\mu^\top w-\frac{\lambda}{2}w^\top\Sigma w\right\},
   $$
   with the usual full-investment constraints.

2. **Perturb the mean vector and compare true and perceived optima.**

   Let $w^*(\mu)$ denote the true optimum and $w^*(\tilde\mu)$ the optimizer's portfolio under a perturbed mean vector $\tilde\mu=\mu+\varepsilon$. Kritzman then compares:

   - the **allocation error**
     $$
     \frac12 \sum_i |w_i^*(\tilde\mu)-w_i^*(\mu)|,
     $$
   - and the induced change in loss probabilities and value at risk.

3. **Case 1: close substitutes.**

   In the first example, country equity indexes have very similar expected returns, volatilities, and correlations. Small mean errors produce large changes in weights because the optimizer is nearly indifferent across close substitutes. But because the assets are so similar, the return distribution of $w^*(\tilde\mu)$ is close to that of $w^*(\mu)$:
   $$
   \Delta \Pr(R<0),\quad \Delta \Pr(R<-10\%),\quad \Delta \mathrm{VaR}_{1\%},\quad \Delta \mathrm{VaR}_{5\%}
   $$
   remain small even when turnover between the two portfolios is large.

4. **Case 2: dissimilar assets.**

   In the second example, stocks, bonds, cash, and commodities are not close substitutes. Then the same mean perturbation produces only small weight changes:
   $$
   w^*(\tilde\mu)\approx w^*(\mu),
   $$
   because the optimizer can distinguish the assets sharply. Hence both allocations and risk distributions move little.

5. **Infer the general mechanism.**

   The sensitivity of portfolio **weights** is approximately
   $$
   \frac{\partial w^*}{\partial \mu}\propto \Sigma^{-1},
   $$
   so ill-conditioning or near-substitutability can make $w^*$ highly sensitive to $\mu$. But the objective loss from using the wrong weights depends on the curvature of the efficient frontier in payoff space, not just in weight space. When assets are near-substitutes, large weight changes often map into small payoff changes.

6. **Conclusion.**

   The slogan "optimizers are error maximizers" confuses weight instability with economically meaningful instability. Proper robustness diagnostics should compare induced return distributions or utility, not merely allocation differences.

### Proof sketch

There is no formal theorem. The argument is constructive:

- if assets are similar, the optimizer is locally ill-conditioned in weights but the opportunity set is locally flat in payoffs;
- if assets are dissimilar, the optimizer is well-conditioned in weights;
- in neither case do small input errors mechanically imply large errors in the portfolio loss distribution.

## 5. Domain of applicability

The argument applies to standard mean-variance settings with moderate input perturbations and sensitivity measured in portfolio payoff space. It does **not** prove that optimization is safe under large misspecification, unstable covariance estimates, omitted tail risk, or structural breaks. It also does not overturn the substantial literature on estimation error; it narrows one specific claim, namely that large weight changes automatically imply large economic mistakes.

## 6. Numerical evidence and experimental assumptions

The published article is *Journal of Portfolio Management* 32(4), Summer 2006, pp. 66-69. The library scan has four article pages and an additional contents page. It is a sensitivity experiment with assumed “true” inputs, not a historical test in which the population parameters are observable.

The country-allocation experiment uses Australia, Canada, France, Germany, Japan, Switzerland, the United Kingdom and the United States. Covariances are estimated from January 1980-December 2005; assumed expected returns are proportional to historical world-market betas. Their highest-to-lowest spread is only 67 basis points. Kritzman then adds one percentage point to Australia, France, Japan and the UK and subtracts one point from Canada, Germany, Switzerland and the US, holding covariances fixed.

The resulting one-way allocation difference is 56.32%. Yet the assumed true return distributions give the following results (Exhibit 4):

| One-year loss statistic | Correct portfolio | Portfolio using wrong means |
|---|---:|---:|
| Probability of a loss | 37.88% | 39.46% |
| Probability of loss worse than 10% | 15.39% | 18.37% |
| Loss VaR at 1% tail probability | 25.84% | 28.98% |
| Loss VaR at 5% tail probability | 17.96% | 20.46% |

The first difference is 1.58 **percentage points**, not a 1.58% relative change. The VaR deterioration is not zero and may still be material to a mandate; the author's argument is that its scale is much smaller than a 56% weight-change statistic suggests. Five-year figures are also reported, with larger differences in tail-loss amounts.

The second example uses stocks, bonds, cash and commodities. Expected returns are assumed to be 9%, 4%, 2% and 8%; volatility and correlation estimates use January 1985-December 2005. The mean perturbation subtracts a percentage point from stocks and commodities and adds one to bonds and cash. The true allocation is 61.42% stocks and 38.58% commodities. The misestimated allocation is approximately 60.05% stocks, 2.35% bonds and 37.59% commodities, with no cash. Required one-way turnover is 2.35%.

Exhibit 8 gives one-year loss probabilities of 25.17% and 24.96%, and 1%-tail loss VaR of 17.19% and 16.83%, respectively. Some downside measures actually improve under the wrong weights. That is possible because the optimization trades expected return against variance; it does not independently minimize every loss statistic.

## 7. Curvature explains why weight distance is insufficient

A useful analytical extension of the article's examples is the exact utility-loss identity. For $U(w)=\mu^\top w-\lambda w^\top\Sigma w/2$, suppose $w^*$ is an interior optimum under a fixed collection of affine constraints. If $d=w-w^*$ is a feasible displacement, first-order terms vanish:

$$
U(w^*)-U(w)=\frac\lambda2d^\top\Sigma d.
$$

The relevant distance is therefore the covariance norm, not $\|d\|_1$ or $\|d\|_2$. Large changes in weights along a near-redundant asset direction can have small risk and utility consequences. This provides mathematical intuition for the country example. With binding inequality constraints, the first-order term need not vanish for arbitrary feasible changes, and the simple identity needs the corresponding KKT contribution.

However, a low eigenvalue does not by itself make estimation error harmless. In an unconstrained problem with fixed true covariance, a mean error $e$ generates $d=\Sigma^{-1}e/\lambda$, giving utility loss $e^\top\Sigma^{-1}e/(2\lambda)$. Errors aligned with low-variance directions can still be amplified. Kritzman's examples refute the inference “large weight change necessarily means large economic loss”; they do not prove the converse or a dimension-free error bound.

## 8. What to take into an optimizer review

Assess candidate portfolios under a common evaluation model, using expected utility or certainty equivalent, tracking risk, loss probabilities, factor exposures and implementation costs. Comparing each portfolio under the inputs that produced it would confound parameter error with the evaluation criterion. Keep the weight-distance statistic as a trading-cost and operational diagnostic: a 56% change can be expensive even if its frictionless payoff distribution is close to the original.

The paper varies means while holding the covariance model correct. It does not jointly perturb correlations, volatilities, tail dependence and means; it also does not estimate capacity, slippage, or the cost of repeated forecast revisions. The author explicitly acknowledges cases such as portable-alpha optimization where input sensitivity can be consequential. The defensible conclusion is a discipline for evaluating sensitivity, supported by two concrete counterexamples to a broad slogan, rather than a general validation of unregularized Markowitz portfolios.
