# 1. Metadata

- **Title:** Characteristic-Sorted Portfolios: Estimation and Inference
- **Author(s):** Matias D. Cattaneo, Richard K. Crump, Max H. Farrell, Ernst Schaumburg
- **Year:** 2017
- **Journal/Venue:** Federal Reserve Bank of New York Staff Report No. 788 (August 2016, revised May 2017)

# 2. Problem statement

The paper asks: **when is portfolio sorting a statistically valid estimator of characteristic-return relations, and how should the number of portfolios be chosen?** Formally, the paper treats portfolio sorts as nonparametric estimators of
$$
\mu(z)=E[R_{it}\mid z_{it}=z]
$$
or, more generally,
$$
R_{it}=\mu(z_{it})+x_{it}^\top \beta_t+\varepsilon_{it},
$$
where $z_{it}$ are sorting characteristics and $x_{it}$ are linear controls. The goal is valid inference for objects such as
$$
\mu(z_H)-\mu(z_L),
$$
and a data-driven rule for the number of portfolios $J_t$.

# 3. Approach (short)

The paper is a nonparametric asymptotic analysis of portfolio sorting with estimated quantile partitions. It builds a general estimator that allows multiple sorting characteristics and linear conditioning variables, derives a pointwise CLT and two valid standard-error estimators, and then develops a higher-order mean-square-error expansion. The higher-order expansion yields an inference-optimal number of portfolios, showing that the common fixed choice of 5 or 10 portfolios is not generally justified.

# 4. Approach (detailed)

1. **Statistical model**

   The paper’s general model is
   $$
   R_{it}=\mu(z_{it})+x_{it}^\top \beta_t+\varepsilon_{it},
   $$
   where:

   - $z_{it}\in\mathcal Z\subset\mathbb R^d$ are the characteristics to be sorted on nonparametrically;
   - $x_{it}\in\mathbb R^{d_x}$ are controls entering linearly;
   - $\mu(\cdot)$ is the object of interest.

   The additive separation is important: it allows portfolio sorts to remain nonparametric in $z$ while controlling parametrically for $x$.

2. **Portfolio-sort estimator as a partition estimator**

   At each date $t$, split each sorting characteristic into $J_t$ quantile bins using empirical quantiles. For $d>1$, the portfolios are Cartesian products of the marginal bins. Let $\hat P_{jt}$ denote the portfolio containing a target point $z$, and $\hat N_{jt}$ the number of assets in that cell.

   The date-$t$ estimator is a portfolio average within the cell containing $z$, optionally after controlling for $x_{it}$. Averaging over time yields
   $$
   \hat\mu(z)=\frac1T\sum_{t=1}^T \hat\mu_t(z).
   $$
   This is exactly the object used in empirical finance, but the paper interprets it explicitly as a **partition regression estimator with estimated quantile-spaced bins**.

3. **Pointwise CLT**

   Theorem 1 states that under smoothness, moment, and rate conditions,
   $$
   V(z)^{-1/2}\big(\hat\mu(z)-\mu(z)\big)
   =
   \sum_{t=1}^T\sum_{i=1}^{n_t}\hat w_{it}(z)\varepsilon_{it}+o_P(1)
   \Rightarrow N(0,1),
   $$
   with variance order
   $$
   V(z)\asymp \frac{J^d}{nT}.
   $$
   The weights are
   $$
   \hat w_{it}(z)=V(z)^{-1/2}
   \sum_{j=1}^{J_t^d}\frac{1}{T\hat N_{jt}}
   \hat 1_{jt}(z)\hat 1_{jt}(z_{it}),
   $$
   where $\hat 1_{jt}(\cdot)$ indicates cell membership.

   Two points matter:

   - the nonparametric variance cost is $J^{d}/(nT)$;
   - the smoothing bias is order $J^{-1}$.

   Therefore, for asymptotic normality one needs the bias to be negligible after normalization:
   $$
   \sqrt{\frac{nT}{J^d}}\cdot J^{-1}\to 0,
   $$
   equivalently
   $$
   \frac{nT}{J^{d+2}}\to 0.
   $$
   This is the paper’s undersmoothing condition.

4. **Why high-minus-low spreads are easy**

   If $z_H$ and $z_L$ lie in different portfolios, then the corresponding estimators are asymptotically uncorrelated because the portfolio indicator functions do not overlap:
   $$
   \hat 1_{jt}(z_H)\hat 1_{jt}(z_L)\equiv 0.
   $$
   Hence for the common object $\mu(z_H)-\mu(z_L)$,
   $$
   \frac{\hat\mu(z_H)-\hat\mu(z_L)-(\mu(z_H)-\mu(z_L))}
   {\sqrt{\hat V(z_H)+\hat V(z_L)}}
   \Rightarrow N(0,1).
   $$
   This explains why spread-portfolio inference reduces to adding the two variances.

5. **Valid standard errors**

   Theorem 2 proves consistency of two variance estimators.

   **Fama-MacBeth-type estimator**
   $$
   \hat V_{FM}(z)=\frac1{T^2}\sum_{t=1}^T\big(\hat\mu_t(z)-\hat\mu(z)\big)^2.
   $$

   **Plug-in estimator**
   $$
   \hat V_{PI}(z)
   =
   \frac1{T^2}
   \sum_{t=1}^T
   \sum_{j=1}^{J_t^d}
   \sum_{i=1}^{n_t}
   \frac{1}{\hat N_{jt}^2}
   \hat 1_{jt}(z)\hat 1_{jt}(z_{it})\hat\varepsilon_{it}^2 .
   $$

   The result is
   $$
   \frac{nT}{J^d}\big(\hat V_{FM}(z)-V(z)\big)\to_P 0,
   \qquad
   \frac{nT}{J^d}\big(\hat V_{PI}(z)-V(z)\big)\to_P 0.
   $$
   The contribution here is not merely proposing the estimators; it is proving that the standard Fama-MacBeth practice is actually valid in this nonparametric sorting setting.

6. **Higher-order MSE expansion**

   Theorem 3 derives an expansion for the spread estimator:
   $$
   E\!\left[
   \big(
   \hat\mu(z_H)-\hat\mu(z_L)-(\mu(z_H)-\mu(z_L))
   \big)^2
   \,\middle|\, Z,X
   \right]
   $$
   $$
   =V^{(1)}\frac{J^d}{nT}
   +V^{(2)}\frac{J^{2d}}{n^2T}
   +\frac{B^2}{J^2}
   +O_P\!\left(\frac1{nT}\right)
   +o_P\!\left(J^{-2}+\frac{J^{2d}}{n^2T}\right).
   $$

   Interpretation:

   - $J^d/(nT)$: first-order variance;
   - $J^{2d}/(n^2T)$: higher-order variance;
   - $J^{-2}$: squared bias.

7. **Optimal number of portfolios**

   The inference-oriented optimal $J_t$ balances the higher-order variance and squared bias, not the first-order variance. The resulting rule is
   $$
   J_t^\star
   =
   \left\lfloor
   \left(
   \frac{\bar B^2\, n_t^2\, T}{d\,\bar V^{(2)}}
   \right)^{1/(2d+2)}
   \right\rfloor.
   $$
   A feasible rule minimizes a sample analogue of
   $$
   \widehat{MSE}(J)
   =
   \hat V^{(2)}\frac{J^{2d}}{n^2T}
   +\frac{\hat B^2}{J^2}.
   $$
   The key message is that the optimal number of portfolios is **data dependent** and can be much larger than 10.

8. **Proof logic**

   The proofs follow the standard nonparametric pattern, but adapted to a finance-specific estimator:

   - show the partition estimator admits a linear representation with estimated-quantile indicators;
   - control the extra randomness induced by estimated quantiles;
   - derive the variance from within-cell averaging;
   - show the bias is $O(J^{-1})$ using smoothness of $\mu(\cdot)$;
   - prove the Fama-MacBeth and plug-in estimators recover the same leading variance;
   - derive the MSE expansion by keeping the second-order variance term rather than stopping at the CLT.

**Additional mathematical details**

For a univariate sort, if $P_{jt}$ denotes the $j$-th estimated quantile cell at date $t$ and $N_{jt}$ its occupancy, then the basic estimator can be written as
$$
\hat\mu(z)
=
\frac1T\sum_{t=1}^T\sum_{j=1}^{J_t}
1\{z\in P_{jt}\}
\frac1{N_{jt}}
\sum_{i=1}^{n_t}1\{z_{it}\in P_{jt}\}R_{it}.
$$
The proof of Theorem 1 decomposes $\hat\mu(z)-\mu(z)$ into a within-cell sampling fluctuation of order $(J^d/(nT))^{1/2}$, a smoothing bias of order $J^{-1}$, and an extra remainder from using estimated quantiles instead of fixed partitions. The last term is shown to be asymptotically negligible under Assumptions 1-4.

This is why the higher-order MSE expansion is the real design result:
$$
\operatorname{MSE}\{\hat\mu(z)\}
=
V^{(1)}\frac{J^d}{nT}
+V^{(2)}\frac{J^{2d}}{n^2T}
+\frac{B^2}{J^2}
+o(\cdot).
$$
The usual practice of fixing $J=5$ or $10$ ignores both the bias term and the second-order variance term, which is exactly the behavior the paper proves is not generally inference-optimal.

# 5. Domain of applicability

- The results apply to **portfolio-sorting estimators** with one or a few continuous characteristics and large cross sections.
- The curse of dimensionality is real: with $d$ sorting characteristics, variance scales with $J^d$ and empty/near-empty cells become a serious issue.
- The paper explicitly shows that standard practice with a fixed $J\in\{5,10\}$ is not generally justified.
- The proofs support multi-characteristic sorting only when rate conditions keep cells nonempty. In practice, this sharply limits $d$.
- The framework is strongest for inference on characteristic spreads and partial means; it says less about welfare, trading costs, or optimal factor construction once one moves outside the portfolio-sort estimator itself.
