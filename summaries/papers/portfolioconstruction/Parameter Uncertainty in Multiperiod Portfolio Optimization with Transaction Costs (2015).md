## 1. Metadata

- **Title:** Parameter Uncertainty in Multiperiod Portfolio Optimization with Transaction Costs
- **Author(s):** Victor DeMiguel, Alberto Martín-Utrera, and Francisco J. Nogales
- **Year:** 2015
- **Journal/Venue:** *Journal of Financial and Quantitative Analysis*

## 2. Problem statement

The paper asks how parameter uncertainty interacts with dynamic portfolio choice when the investor faces quadratic transaction costs. The single-period literature already showed that plugging estimated means and covariances into a Markowitz rule produces utility losses, and the transaction-cost literature already showed that with quadratic costs the optimal policy trades gradually toward the Markowitz portfolio. What had not been characterized is the utility loss from estimation error in the genuinely multiperiod setting with trading costs, nor the associated optimal shrinkage rules.

The problem is therefore twofold:

1. characterize analytically the expected utility loss from using estimated inputs rather than true parameters in a multiperiod mean-variance problem with quadratic costs;
2. derive implementable shrinkage policies that reduce this loss.

## 3. Approach (short)

The method is dynamic mean-variance optimization with closed-form policy structure, combined with Kan-Zhou style shrinkage analysis. Starting from the Gârleanu-Pedersen quadratic-cost setup, the authors show that the true optimal multiperiod policy trades at a constant rate toward the static Markowitz portfolio. They then compare this true policy with a plug-in version built from sample estimates and derive a decomposition of expected utility loss into a single-period estimation-loss term times multiperiod amplification factors that separately reflect mean-variance losses and transaction-cost losses. Finally, they propose two shrinkage policies, a 3-fund rule and a 4-fund rule, and show that the optimal shrinkage intensities coincide with the static Kan-Zhou intensities even though the trading problem is dynamic.

## 4. Approach (detailed)

1. **Start from the multiperiod quadratic-cost mean-variance problem.**

   Let $x_i$ be the portfolio of risky-asset holdings at period $i$, $x_{-1}$ the inherited initial portfolio, and $\Delta x_i=x_i-x_{i-1}$ the trade. The investor faces expected excess returns $\mu$, covariance matrix $\Sigma$, risk-aversion parameter $\gamma$, transaction-cost parameter $\lambda$, and impatience/discount factor $\rho$.

   The dynamic objective is a discounted mean-variance criterion with quadratic trading costs. In the single-period approximation highlighted by the paper,
   $$
   \max_x
   (1-\rho)x'\mu-\frac{\gamma}{2}x'\Sigma x-\frac{\lambda}{2}\Delta x'\Sigma \Delta x.
   $$
   This already shows the economic structure:
   - the first term rewards expected return,
   - the second penalizes portfolio risk,
   - the third penalizes moving too quickly.

2. **Use the known no-estimation-error solution as the baseline.**

   In the absence of parameter uncertainty, the optimal static Markowitz portfolio is
   $$
   x^M=\frac1\gamma \Sigma^{-1}\mu.
   $$
   With quadratic trading costs, the investor does not jump instantly to $x^M$. Instead the optimal multiperiod policy trades toward it at a constant trading rate $\beta\in(0,1)$:
   $$
   x_i=(1-\beta)x_{i-1}+\beta x^M.
   $$
   Iterating gives
   $$
   x_i=(1-\beta)^{i+1}x_{-1}+\beta x^M\sum_{j=0}^i (1-\beta)^j.
   $$
   Thus the dynamic problem is effectively a three-fund rule even before shrinkage:
   - the risk-free asset,
   - the inherited portfolio $x_{-1}$,
   - the Markowitz portfolio $x^M$.

3. **Estimate the inputs and define the plug-in loss.**

   Suppose returns $r_t$ are observed for $t=1,\dots,T$. The paper uses the usual sample estimators
   $$
   \hat\mu=\frac1T\sum_{t=1}^T r_t,
   \qquad
   \hat\Sigma=\frac{1}{T-N-2}\sum_{t=1}^T (r_t-\hat\mu)(r_t-\hat\mu)'.
   $$
   The plug-in Markowitz portfolio is
   $$
   \hat x^M=\frac1\gamma \hat\Sigma^{-1}\hat\mu.
   $$
   The investor who ignores parameter uncertainty uses the same trading-rate formula as if inputs were true, but with $\hat x^M$ replacing $x^M$. The question is how much utility is lost relative to the true policy.

4. **Use the Kan-Zhou single-period loss as the building block.**

   For the static problem, Kan and Zhou give the utility loss from using $\hat x^M$ rather than $x^M$:
   $$
   L_1(x^M,\hat x^M)
   =
   \frac{1}{2\gamma}\left[(c-1)\theta+c\frac{N}{T}\right],
   $$
   where
   $$
   c=\frac{(T-N-2)(T-2)}{(T-N-1)(T-N-4)},
   \qquad
   \theta=\mu'\Sigma^{-1}\mu
   $$
   is the squared Sharpe ratio. This is the static estimation-risk object the paper lifts into the dynamic setting.

5. **Derive the multiperiod loss decomposition.**

   Proposition 1 is the paper's main analytical result:
   $$
   L(\{x_i\},\{\hat x_i\})
   =
   L_1(x^M,\hat x^M)\,[f_{mv}+f_{tc}],
   $$
   where $f_{mv}$ is a multiperiod mean-variance loss factor and $f_{tc}$ is a multiperiod transaction-cost factor.

   The appendix shows
   $$
   f_{mv}
   =
   \frac{1-\rho}{\rho}
   -
   \frac{2(1-\rho)(1-\beta)}{1-(1-\rho)(1-\beta)}
   +
   \frac{(1-\rho)(1-\beta)^2}{1-(1-\rho)(1-\beta)^2},
   $$
   and
   $$
   f_{tc}
   =
   \frac{\lambda}{\gamma}
   \frac{\beta^2}{1-(1-\rho)(1-\beta)^2}.
   $$
   These factors arise from summing discounted geometric sequences of variance and trading-cost distortions along the path of gradual adjustment.

6. **Interpret the decomposition economically.**

   The decomposition is not just algebra. It says that dynamic estimation risk is exactly static estimation risk multiplied by dynamic propagation factors. The first factor captures how often and how heavily the investor remains exposed to the wrong risky portfolio. The second captures the extra trading costs caused by converging gradually toward the wrong target.

   The paper further decomposes
   $$
   L=L_{mv}+L_{tc},
   $$
   with
   $$
   L_{mv}
   =
   \frac{\gamma}{2}\sum_{i=0}^\infty (1-\rho)^{i+1}
   E\!\left[x_i'\Sigma x_i-\hat x_i'\Sigma \hat x_i\right],
   $$
   $$
   L_{tc}
   =
   \frac{\lambda}{2}\sum_{i=0}^\infty (1-\rho)^{i+1}
   E\!\left[\Delta x_i'\Sigma \Delta x_i-\Delta \hat x_i'\Sigma \Delta \hat x_i\right].
   $$
   This is why the factors are named mean-variance and transaction-cost multipliers.

7. **Derive monotonicity implications.**

   Because the trading rate $\beta$ rises with $\gamma$ and falls with $\lambda$ and $\rho$, the paper obtains comparative statics:
   - larger transaction costs reduce estimation loss because the investor trades more slowly toward the misestimated portfolio;
   - greater impatience also reduces loss for the same reason;
   - greater risk aversion reduces exposure to risky assets and therefore reduces estimation loss.

   In the single-period benchmark,
   $$
   \beta_1=\frac{\gamma}{\gamma+\lambda},
   $$
   and the one-period loss becomes
   $$
   \beta_1\,L_1(x^M,\hat x^M),
   $$
   making the mechanism transparent.

8. **Construct the first shrinkage rule: the multiperiod 3-fund policy.**

   Since the true policy trades toward $x^M$, the simplest correction is to shrink the estimated Markowitz portfolio toward the risk-free asset. The rule is
   $$
   x_i^{3F}=(1-\beta)x_{i-1}^{3F}+\beta \eta \hat x^M,
   $$
   where $\eta\in[0,1]$ is a shrinkage intensity. This preserves the dynamic trading-rate structure but reduces sensitivity to mean estimation by shrinking the risky target itself.

9. **Construct the second shrinkage rule: the multiperiod 4-fund policy.**

   The second rule also introduces the sample minimum-variance portfolio
   $$
   \hat x^{Min}=\frac1\gamma \hat\Sigma^{-1}\iota.
   $$
   The policy becomes
   $$
   x_i^{4F}
   =
   (1-\beta)x_{i-1}^{4F}
   +
   \beta(\varsigma_1 \hat x^M+\varsigma_2 \hat x^{Min}).
   $$
   The idea is exactly the Kan-Zhou logic: keep exposure to the estimated tangency/Markowitz direction, but hedge estimation error by mixing in the more stable minimum-variance component.

10. **State the central shrinkage result.**

   Proposition 2 shows that the optimal shrinkage intensities for the multiperiod 3-fund and 4-fund rules coincide with the single-period Kan-Zhou optimal intensities. This is the paper's cleanest theoretical finding after the loss decomposition. Dynamic trading costs do not alter the optimal amount of shrinkage in the target portfolio; they only affect how slowly the investor trades toward that shrunk target.

   Economically:
   - the dynamic problem changes the adjustment path via $\beta$,
   - but it does not change the ex ante best linear shrinkage of the risky target.

11. **Proof sketch of the loss factorization.**

   The proof uses the explicit linear state equation for the optimal policy. Because both the true and plug-in policies evolve with the same scalar trading rate $\beta$, the difference between them is proportional at each horizon to the static target error $(x^M-\hat x^M)$. Writing
   $$
   \xi_i=\sum_{j=0}^i (1-\beta)^j=\frac{1-(1-\beta)^{i+1}}{\beta},
   $$
   the risky-position distortion at horizon $i$ is proportional to $\beta\xi_i(x^M-\hat x^M)$, while the trade distortion is proportional to $\beta(1-\beta)^i(x^M-\hat x^M)$. Substituting these expressions into the discounted utility difference and summing the resulting geometric series yields $f_{mv}$ and $f_{tc}$. That is why the total loss factors exactly into the single-period Kan-Zhou loss times dynamic multipliers.

12. **Implementation recipe.**

   To reproduce the paper's method:
   1. estimate $\hat\mu$ and $\hat\Sigma$ from a rolling, fixed, or expanding window;
   2. compute $\hat x^M=\gamma^{-1}\hat\Sigma^{-1}\hat\mu$ and, if using the 4-fund rule, $\hat x^{Min}=\gamma^{-1}\hat\Sigma^{-1}\iota$;
   3. compute or choose the trading rate $\beta$ from the quadratic-cost model;
   4. compute Kan-Zhou shrinkage intensities for the chosen target set;
   5. iterate
      $$
      x_i=(1-\beta)x_{i-1}+\beta \times \text{shrunk target};
      $$
   6. rebalance each period and evaluate certainty-equivalent performance net of trading costs.

## 5. Domain of applicability

The method applies to investors using dynamic mean-variance policies with quadratic transaction costs and repeatedly re-estimated moments. It is strongest when the investor's problem is genuinely linear-quadratic, because then the trading-rate structure and the loss factorization are exact. It is also particularly useful when one wants a closed-form policy rather than a fully numerical dynamic program.

Its limitations are structural. The paper does not solve the general transaction-cost problem; it relies on quadratic costs, normal/mean-variance preferences, and the Gârleanu-Pedersen tractable setup. Proportional costs, CRRA utility, binding leverage constraints, or nonlinear state dynamics generally break the simple constant-trading-rate rule. The equivalence between static and dynamic optimal shrinkage intensities is therefore specific to this model class, not a universal statement about dynamic portfolio choice.
