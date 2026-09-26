# 1. Metadata

- **Title:** Leverage Aversion and Risk Parity
- **Author(s):** Clifford S. Asness, Andrea Frazzini, Lasse H. Pedersen
- **Year:** 2012
- **Journal/Venue:** *Financial Analysts Journal*

# 2. Problem statement

The paper asks whether **risk parity** can be justified as a rational equilibrium response to leverage constraints. More precisely: if some investors are leverage averse or leverage constrained, how do equilibrium expected returns differ from CAPM, and does that imply that low-risk assets should receive larger allocations than market-cap weighting would suggest?

# 3. Approach (short)

The paper synthesizes a constrained-equilibrium version of CAPM, associated with Black and with Frazzini-Pedersen’s betting-against-beta logic. In that equilibrium, leverage-constrained investors overpay for high-beta assets because they want high expected returns without borrowing, while unconstrained investors can lever low-beta assets. This flattens the security market line and raises the Sharpe ratios of safer assets. Risk parity, which equalizes risk allocation rather than capital allocation, becomes a natural portfolio response.

# 4. Approach (detailed)

1. **Standard CAPM benchmark**

   In the frictionless CAPM,
   $$
   E[R_i-r_f]=\beta_i E[R_M-r_f].
   $$
   All assets lie on the same security market line, and the tangency portfolio is the market portfolio. If leverage is freely available, investors can adjust risk simply by levering or delevering the tangency portfolio.

2. **Leverage aversion / constraint**

   The paper’s maintained economic mechanism is that many investors either cannot borrow freely or dislike leverage. Such investors still want higher expected returns, so they tilt toward high-beta assets instead of levering the low-beta/tangency portfolio.

   This demand pressure makes the security market line too flat relative to CAPM:

   - low-beta assets earn **higher** average returns than CAPM predicts;
   - high-beta assets earn **lower** average returns than CAPM predicts.

   In reduced-form language,
   $$
   E[R_i-r_f]=\alpha_i+\beta_i E[R_M-r_f],
   $$
   with $\alpha_i>0$ for low-beta assets and $\alpha_i<0$ for high-beta assets.

3. **Why this favors risk parity**

   Risk parity allocates capital so that each asset class contributes equally to total risk. In a simple diagonal-covariance approximation this means
   $$
   w_i \propto \frac1{\sigma_i},
   $$
   while in full covariance form it solves
   $$
   w_i(\Sigma w)_i = w_j(\Sigma w)_j
   \qquad \forall i,j.
   $$
   If safer assets have unusually high Sharpe ratios because the security market line is too flat, then overweighting them is efficient. A levered risk-parity portfolio can then outperform the market portfolio on a Sharpe-ratio basis.

4. **Market portfolio versus RP**

   In a two-asset stock/bond world, the market or a 60/40 portfolio allocates more capital to stocks because stocks have higher standalone expected returns. Risk parity allocates more capital to bonds because bonds contribute less risk per dollar. Under leverage aversion, this can be exactly the right move because bonds are the “underpriced” low-beta assets.

5. **Levered RP**

   Unlevered RP often has lower mean return than the market portfolio because it holds more low-volatility assets. The argument is not that unlevered RP always dominates. The argument is:

   - unlevered RP often has a higher Sharpe ratio;
   - if leverage is available to some investors, they should lever RP up to the desired risk level.

   That is the sense in which leverage aversion and risk parity fit together.

6. **Evidence**

   The paper compares:

   - the value-weighted market portfolio,
   - a 60/40 stock-bond portfolio,
   - unlevered and levered risk-parity portfolios

   across long, broad, and global samples. The empirical pattern is consistent with the theory: low-risk assets have stronger risk-adjusted performance than CAPM would predict, and RP benefits from leaning into that fact.

7. **What is proved and what is inherited**

   The formal equilibrium argument is mostly inherited from Black-style leverage-constrained CAPM and Frazzini-Pedersen’s theory. The paper itself is more of an integrative portfolio-construction note:

   - the equilibrium mechanism justifies why low-risk assets can be attractive;
   - RP is presented as a practical way to exploit that mechanism across asset classes.

   So the new contribution is less a new theorem than a portfolio-level synthesis.

8. **Limits of the argument**

   The paper is careful, implicitly if not formally, about two limits:

   - leverage is not free; financing and deleveraging risk matter;
   - risk parity is not implied by the theory with mathematical necessity, only suggested as a natural approximation to an allocation that tilts toward high-Sharpe low-beta assets.

**Additional mathematical details**

The equilibrium story can be summarized by a flattened security market line of the form
$$
E[R_i-r_f]=\psi + \beta_i \lambda,
\qquad \psi>0,
$$
or equivalently
$$
E[R_i-r_f]
=
\beta_i E[R_M-r_f] + \psi(1-\beta_i),
$$
where $\psi$ captures the shadow value of leverage constraints. Low-beta assets then earn positive intercepts relative to CAPM, and high-beta assets earn negative intercepts. This is the reduced-form pricing relation that links leverage aversion to the BAB/risk-parity logic.

Risk parity is not derived as the unique optimizer of that equilibrium, but it is directionally consistent with it because it increases exposure to the asset classes with the highest Sharpe ratios once the line is too flat. In full covariance language, RP solves
$$
w_i(\Sigma w)_i = w_j(\Sigma w)_j,
$$
and a levered RP portfolio can then approximate a tangency portfolio in the distorted opportunity set created by leverage-averse equilibrium demand.

# 5. Domain of applicability

- The argument applies when **leverage constraints or leverage aversion are important equilibrium frictions**.
- It is especially relevant for cross-asset allocation where asset classes have very different volatilities and betas.
- The paper does not prove that RP is universally optimal; it argues that RP moves in the direction favored by leverage-constrained equilibrium.
- If financing costs are high, correlations shift sharply, or the low-beta premium disappears, the justification weakens.
