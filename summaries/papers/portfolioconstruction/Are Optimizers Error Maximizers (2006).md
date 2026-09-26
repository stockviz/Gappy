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
