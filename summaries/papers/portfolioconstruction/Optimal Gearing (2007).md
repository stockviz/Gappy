# 1. Metadata

- **Title:** Optimal Gearing
- **Author(s):** Seanna Johnson, Ronald N. Kahn, Dean Petrich
- **Year:** 2007
- **Journal/Venue:** *The Journal of Portfolio Management*

# 2. Problem statement

The paper asks whether all long-short portfolios are equally efficient. Its answer is no: **for a given alpha process, residual risk level, and breadth, there is an optimal amount of leverage/gearing, and mismatching risk with gearing lowers implementation efficiency.**

# 3. Approach (short)

The method is a stylized active-management model with many independent stock alphas and identical residual risks. The paper writes expected utility as alpha minus risk penalty, derives optimal holdings, and then computes the implied expected alpha, residual risk, and gearing. This reveals that these three objects are linked by a single degree of freedom. The paper evaluates deviations from the natural gearing using the transfer coefficient (TC).

# 4. Approach (detailed)

1. **Stylized alpha model**

   Let $h_n$ be holdings in stock $n$, $\alpha_n$ its expected residual return, and $\omega_0$ the common residual volatility. In the simplest model, residual returns are independent and alphas satisfy
   $$
   \alpha_n = IC\cdot z_n \cdot \omega_0,
   $$
   where $z_n\sim N(0,1)$ independently and $IC$ is the information coefficient.

2. **Quadratic active utility**

   The optimizer maximizes
   $$
   U = h^\top \alpha - \lambda h^\top V_R h.
   $$
   With $V_R=\omega_0^2 I$, the optimal holdings are
   $$
   h_n^\ast = \frac{\alpha_n}{2\lambda \omega_0^2}
   = \frac{IC}{2\lambda \omega_0} z_n.
   $$

3. **Definition of gearing**

   The paper defines gearing $G$ for a market-neutral portfolio as
   $$
   G=\frac12\sum_{n=1}^N |h_n|.
   $$
   Under this convention, a $100\%$ long / $100\%$ short market-neutral portfolio has gearing $1$.

4. **Expected alpha, risk, and gearing**

   Replacing sums by expectations over the $z_n$, the paper derives closed-form expressions for the unconstrained optimum:
   $$
   \alpha^\ast \propto \frac{IC^2 N}{2\lambda},
   \qquad
   \omega^\ast \propto \frac{IC\sqrt N}{2\lambda},
   \qquad
   G^\ast \propto \frac{IC\,N}{\lambda \omega_0}.
   $$
   The exact constant in $G^\ast$ comes from $E|z|=\sqrt{2/\pi}$. The economic point is that $\alpha^\ast$, $\omega^\ast$, and $G^\ast$ are not independent choices. Given the alpha process, **one free parameter** (equivalently $\lambda$) determines all three.

5. **Optimal relation between risk and gearing**

   Eliminating $\lambda$, the paper obtains a direct relation between optimal residual risk and optimal gearing:
   $$
   G^\ast \propto \frac{\omega^\ast}{\omega_0}\sqrt N.
   $$
   Thus, more risk should naturally come with more gearing. Fixing both risk and gearing arbitrarily can move the portfolio away from the efficient implementation of the signal.

6. **Undergearing and overgearing**

   - **Undergeared portfolio:** target risk is high relative to allowed gearing. The optimizer must concentrate in fewer names to hit the risk target, giving up diversification.
   - **Overgeared portfolio:** gearing is high relative to natural risk. The optimizer must flatten signals and move toward equal-weight long and short books to avoid excessive risk.

   In both cases, the realized information ratio falls.

7. **Transfer coefficient interpretation**

   The paper evaluates implementation efficiency through the transfer coefficient
   $$
   TC=\frac{IR_{\text{implemented}}}{IR_{\text{intrinsic}}}.
   $$
   At the natural gearing, $TC=1$. Deviating from the natural gearing reduces $TC$. The paper finds the loss is asymmetric: severe undergearing is especially damaging because it destroys breadth by forcing concentration.

8. **Gearing penalty variant**

   The paper also introduces a gearing-penalized utility, effectively modifying the optimization problem to discourage or encourage leverage:
   $$
   U_\phi = h^\top\alpha - \lambda h^\top V_R h - \phi \cdot \text{gearing term}.
   $$
   Varying $\phi$ traces the trade-off among alpha, risk, gearing, and TC. This is the device used to plot efficient frontiers at fixed gearing levels.

9. **Proof logic**

   The main derivations are exact in the stylized Gaussian model:

   - solve the quadratic utility by first-order conditions;
   - compute expected risk from the second moment of $z_n$;
   - compute gearing from $E|z_n|$;
   - eliminate $\lambda$ to obtain the optimal risk-gearing relation.

   The extensions to more realistic constraints are then empirical/simulation-based.

**Additional mathematical details**

Because $h_n^\ast\propto z_n$, all three portfolio objects are functions of the same scalar $\lambda^{-1}$:
$$
E[\alpha^\top h^\ast]\propto \lambda^{-1},\qquad
\sqrt{E[(h^\ast)^\top V_R h^\ast]}\propto \lambda^{-1},\qquad
E[G^\ast]\propto \lambda^{-1}.
$$
That is the paper’s precise sense in which risk, alpha, and gearing are not separately free design variables. Fixing one effectively fixes the other two up to the common signal-strength constants $IC$, $\omega_0$, and breadth $N$.

The transfer-coefficient discussion can also be read geometrically. Once a nonoptimal gearing level forces the optimizer away from the proportional-to-$\alpha$ allocation, the implemented holdings are no longer collinear with the intrinsic alpha vector in the residual-risk metric. $TC$ therefore falls because the implemented portfolio ceases to be the risk-metric projection of the signal. This is why both undergearing and overgearing are harmful, even though they distort the portfolio in different directions.

# 5. Domain of applicability

- The clean formulas apply to a **stylized market-neutral stock-selection model** with identical residual volatilities and independent standardized signals.
- The paper’s qualitative message is robust: risk and gearing are jointly determined by the signal and constraints.
- The exact constants are not universal; real portfolios have heterogeneous risks, factor constraints, and trading costs.
- Thus the paper proves a structural implementation point, not a universal gearing formula for all long-short portfolios.
