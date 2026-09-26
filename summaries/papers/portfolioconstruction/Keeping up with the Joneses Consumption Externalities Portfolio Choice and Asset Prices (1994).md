# 1. Metadata

- **Title:** Keeping up with the Joneses: Consumption Externalities, Portfolio Choice, and Asset Prices
- **Author(s):** Jordi Gali
- **Year:** 1994
- **Journal/Venue:** *Journal of Money, Credit and Banking*

# 2. Problem statement

The paper studies how contemporaneous consumption externalities affect portfolio choice and equilibrium asset prices. In a static CAPM setup and then in a Lucas-tree multiperiod economy, the question is whether utility of the form
$$
U(c,C)=\frac{1}{1-\alpha}c^{\,1-\alpha}C^{\alpha\gamma}
$$
changes the optimal risky share and the equity premium relative to the standard externality-free model.

# 3. Approach (short)

The method is exact comparative statics under a parametric utility specification. Gali first solves the one-period portfolio problem by linearizing around a symmetric equilibrium and deriving the optimal risky share as a function of the aggregate risky share. He then embeds the same utility in a Lucas exchange economy and proves an equivalence result: the externality economy has the same asset prices as an externality-free CRRA economy with an adjusted effective risk-aversion coefficient.

# 4. Approach (detailed)

1. **Static portfolio problem**

   The representative household chooses the risky share $\lambda$ to maximize
   $$
   \max_\lambda E[U(c,C)]
   $$
   subject to
   $$
   c = w(R+\lambda x),
   $$
   where $R$ is the gross riskless return and $x=Z-R$ is the excess return on equity. In equilibrium the aggregate risky share is $A$, and each household takes the distribution of average consumption $C$ as given.

2. **Utility specification**

   The imposed form
   $$
   U(c,C)=\frac{1}{1-\alpha}c^{\,1-\alpha}C^{\alpha\gamma}
   $$
   has two key local elasticities:
   - relative risk aversion around the symmetric equilibrium equals $\alpha$;
   - the elasticity of marginal utility with respect to average consumption equals $\alpha\gamma$.

   Hence $\gamma>0$ means “keeping up with the Joneses” type positive externalities, while $\gamma<0$ means the others’ consumption acts as a substitute.

3. **Approximate risky-share mapping**

   For small mean excess return $E[x]$, the equilibrium mapping from aggregate risky share $A$ to individual best response is approximately
   $$
   \lambda^*[F(x)] \approx \gamma A + \frac{\Omega}{\alpha},
   \qquad
   \Omega=\frac{E[x]}{\sigma_x^2}.
   $$
   Solving the fixed point $A=\lambda^*$ gives
   $$
   A^*=\frac{\Omega}{\alpha(1-\gamma)}.
   $$

   Implications:
   - if $0<\gamma<1$, positive externalities raise the equilibrium risky share;
   - if $\gamma<0$, negative externalities lower it;
   - the responsiveness of the risky share to changes in the Sharpe ratio is amplified by positive externalities and damped by negative ones.

4. **Equity premium implication in the static model**

   If riskless debt is in zero net supply so that market clearing requires $A^*=1$, then the required excess return is approximately
   $$
   E[x]=\alpha(1-\gamma)\sigma_x^2.
   $$
   Positive externalities reduce the required equity premium; negative externalities increase it.

5. **Multiperiod Lucas economy**

   In the exchange economy, preferences are
   $$
   E_0\sum_{t=0}^\infty \beta^t U(c_t,C_t),
   $$
   with the same period utility form. The pricing kernel in symmetric equilibrium is driven by
   $$
   \beta \frac{U_c(c_{t+1},C_{t+1})}{U_c(c_t,C_t)}.
   $$

6. **Equivalence proposition**

   Consider instead an externality-free economy with CRRA utility
   $$
   V(c)=\frac{1}{1-\sigma}c^{\,1-\sigma}.
   $$
   Gali proves that equilibrium prices in the externality economy coincide with those in the no-externality economy if and only if
   $$
   \sigma = \alpha(1-\gamma).
   $$
   This is the paper’s main exact theorem.

   Proof sketch:
   - compute $U_c(c,C)$ at the symmetric equilibrium $c=C$;
   - show that the intertemporal marginal rate of substitution is proportional to
     $$
     \beta \left(\frac{c_t}{c_{t+1}}\right)^{\alpha(1-\gamma)};
     $$
   - this is exactly the CRRA pricing kernel with effective risk aversion $\sigma=\alpha(1-\gamma)$.

7. **Interpretation**

   Contemporaneous consumption externalities do not create a new pricing mechanism in this setup. They simply renormalize effective risk aversion. Therefore:
   - positive externalities act like lower effective risk aversion;
   - negative externalities act like higher effective risk aversion.

8. **Limits of the result**

   Because the equivalence is exact, the model inherits the same difficulties as standard CRRA Lucas models:
   - it does not solve excess-volatility problems;
   - it cannot simultaneously fix the equity premium without affecting the riskless rate in problematic ways.

   Gali explicitly contrasts his result with Abel-type lagged consumption externality models, where the pricing implications differ sharply.

# 5. Domain of applicability

- The result applies to contemporaneous consumption externalities of the specific multiplicative form used in the paper.
- The static CAPM comparative statics are local, relying on the small-$E[x]$ approximation.
- The multiperiod equivalence theorem is exact, but only because the symmetric equilibrium collapses the externality into an adjusted curvature parameter.
- Different externality timing assumptions, such as lagged “habit” or “catching up” terms, need not share the equivalence result.
- The novel contribution is the exact mapping from contemporaneous externalities to effective CRRA risk aversion in equilibrium asset pricing.
