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

The method is exact comparative statics under a parametric utility specification. Gali first solves the one-period portfolio problem by linearizing around a symmetric equilibrium and deriving the optimal risky share as a function of the aggregate risky share. He then embeds the same utility in a Lucas exchange economy and proves an equivalence result across admissible dividend processes: the externality economy has the same asset prices as an externality-free CRRA economy with an adjusted effective risk-aversion coefficient.

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
   - the responsiveness of the risky share to changes in the mean-to-variance ratio is amplified by positive externalities and damped by negative ones.

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

# 6. Source and the precise meaning of an externality

[Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/Keeping up with the Jonses- Consumption Externalities, Portfolio Choice, and Asset Prices.pdf>). Jordi Galí, *Journal of Money, Credit and Banking* 26(1), February 1994, pp. 1–8. The local PDF contains a JSTOR cover plus all eight article pages. This is a theoretical paper with a local portfolio approximation and an exact equilibrium-pricing proposition; it does not estimate an externality parameter or test a trading strategy.

The assumptions are $\alpha>0$ and $\gamma<1$, with strictly positive consumption where marginal utility is evaluated. The displayed power utility is written for $\alpha\ne1$; limiting marginal-utility formulations can cover the logarithmic case. The restriction $\gamma<1$ ensures positive effective curvature along the symmetric equilibrium and a finite interior fixed point in the local portfolio calculation.

The terminology “positive externality” refers to the **effect on marginal utility**, not necessarily a positive effect on utility levels. In fact,

$$
U_c=c^{-\alpha}C^{\alpha\gamma},\qquad
U_{cc}=-\alpha c^{-\alpha-1}C^{\alpha\gamma},\qquad
U_{cC}=\alpha\gamma c^{-\alpha}C^{\alpha\gamma-1}.
$$

Thus $\gamma>0$ means other people's higher consumption makes an extra unit of one's own consumption more valuable. It does not mean an agent is altruistic or enjoys other people's prosperity. The sign of $U_C$ additionally depends on the power-utility normalization and on $1-\alpha$.

At a fixed level of others' consumption, own-consumption relative risk aversion is exactly $\alpha$. Along a symmetric equilibrium, however, both own and aggregate consumption change together. Asset prices are driven by the latter variation. Confusing these two derivatives would erase the mechanism of the paper.

# 7. Deriving the static approximation and its limits

Each household treats the distribution of aggregate consumption as given when optimizing. It does not differentiate through its own effect on aggregate consumption. With equal initial wealth, aggregate consumption is $C=W(R+Ax)$ and private consumption is $c=W(R+\lambda x)$. The interior first-order condition is

$$
E\left[U_c\bigl(W(R+\lambda x),W(R+Ax)\bigr)x\right]=0.
$$

Expand marginal utility around $(W,W)$, using $R$ close to one. To first order,

$$
\frac{U_c(c,C)}{U_c(W,W)}
\simeq 1-\alpha[(R-1)+\lambda x]
+\alpha\gamma[(R-1)+Ax].
$$

Multiply by $x$ and take expectations. Dropping the product $(R-1)E[x]$ and using $E[x^2]\simeq\operatorname{Var}(x)$ when $E[x]$ is small yields

$$
0\simeq E[x]-\alpha(\lambda-\gamma A)\sigma_x^2.
$$

Solving gives the best response and then its symmetric fixed point. This derivation clarifies why the formula is a local mean-variance approximation, rather than an exact solution for arbitrary nonnormal return distributions. The paper's $\Omega=E[x]/\sigma_x^2$ is a mean-to-variance ratio. It is not the Sharpe ratio $E[x]/\sigma_x$.

A higher aggregate risky share raises aggregate consumption more in good equity states. With $\gamma>0$, it consequently raises the private marginal value of consumption in those states, increasing the household's appetite for equity. The best-response slope is $\gamma$. Positive externalities produce strategic complementarity in risky holdings; negative externalities produce substitution. The fixed-point multiplier is $1/(1-\gamma)$.

This is a comparative-static result, not a dynamic adjustment model. For example, a negative $\gamma$ less than $-1$ can leave the algebraic fixed point well-defined while making naive repeated best-response iteration unstable. The paper does not claim that all conceivable adjustment processes converge to equilibrium.

The approximation also does not impose a long-only or no-leverage constraint. If its solution lies outside an investor's feasible range, a constrained problem must be solved and the simple formula no longer gives the realized share. As $\gamma$ approaches one from below, the expression becomes very sensitive, which makes both feasibility and approximation error especially consequential.

# 8. Portfolio comparative statics versus equilibrium risk prices

The first exercise holds the distribution of $x$ fixed and asks how risky demand responds to social preferences. The equity-premium statement changes the closure: riskless debt has zero net supply, so market clearing requires the aggregate risky share to equal one. Expected excess return must adjust to induce households to hold all equity.

Under that closure,

$$
E[x]\simeq\alpha(1-\gamma)\sigma_x^2.
$$

It is therefore consistent for positive externalities to raise equity demand at a fixed premium and to lower the premium in equilibrium. These are two sides of the same demand shift. The result is conditional on the supply and symmetry assumptions; a nonzero outside supply of riskless assets would change the market-clearing aggregate risky share.

The risk premium falls because the consumption-based value of payouts in good aggregate states rises relative to the externality-free case. Households become less averse to moving with the aggregate economy even though their partial own-consumption risk aversion, holding others fixed, remains $\alpha$.

# 9. Exact multiperiod pricing equivalence

The Lucas economy has identical infinitely lived households, a single perishable good, time-separable discounted utility, and exogenous asset dividends. In the symmetric equilibrium $c_t=C_t$, marginal utility is

$$
U_c(C_t,C_t)=C_t^{-\alpha(1-\gamma)}.
$$

The one-period stochastic discount factor is consequently

$$
m_{t+1}=\beta\left(\frac{C_{t+1}}{C_t}\right)^{-\sigma},
\qquad \sigma=\alpha(1-\gamma).
$$

For an asset with ex-dividend price $P_{k,t}$ and dividend $d_{k,t+1}$,

$$
P_{k,t}=E_t[m_{t+1}(P_{k,t+1}+d_{k,t+1})].
$$

Excluding the speculative bubbles discussed in the source and imposing the appropriate convergence conditions gives the present-value formula

$$
P_{k,t}=E_t\sum_{j\ge1}\beta^j
\left(\frac{C_{t+j}}{C_t}\right)^{-\sigma}d_{k,t+j}.
$$

Every fundamental price generated by this kernel is the same as in the corresponding externality-free CRRA economy with curvature $\sigma$. The equivalence covers asset prices and returns under the same dividend and aggregate-consumption processes. It does not say the two economies have the same welfare comparisons or the same response to a policy that changes individual incentives and aggregates.

The source's necessity argument concerns equality of pricing relations **for arbitrary admissible dividend processes**, not identification of curvature from one special observed price path. If prices agreed only for a restricted payoff set, or consumption were deterministic and constant, uniqueness of the curvature parameter need not follow. Across the relevant processes, equality requires $V'(c)$ to be proportional to $U_c(c,c)$. Differentiating along the diagonal gives

$$
-\frac{cV''(c)}{V'(c)}
=-\frac{c[U_{cc}(c,c)+U_{cC}(c,c)]}{U_c(c,c)}
=\alpha(1-\gamma).
$$

Conversely, integrating equality of these logarithmic derivatives makes marginal utilities proportional. The constant cancels from intertemporal marginal-utility ratios, establishing sufficiency. The source excludes perpetual zero-net-supply assets for which its no-bubble reasoning would not apply automatically.

# 10. Why contemporaneous relative consumption can imply log pricing

An especially informative special case is utility over the ratio of own to contemporaneous aggregate consumption:

$$
U(c,C)=\frac{(c/C)^{1-\alpha}}{1-\alpha}.
$$

Here $\alpha\gamma=\alpha-1$, so $\gamma=1-1/\alpha$ and

$$
\alpha(1-\gamma)=1.
$$

Equilibrium asset pricing is therefore identical to log utility, independently of the individual's own-consumption curvature $\alpha$. Altering $\alpha$ changes the relative-consumption preference specification but does not change the equilibrium pricing kernel in this contemporaneous ratio model. Substituting $c=C$ into utility before taking the household's derivative would instead make utility appear constant and would give the wrong first-order conditions; agents take $C$ as external when choosing $c$.

Galí contrasts this with Abel's lagged reference consumption. Under lagged externalities, the reference term appears differently in marginal-utility ratios and need not collapse to a constant change in CRRA curvature. Timing is economically substantive. One cannot transfer the results of a lagged habit or “catching up” specification to contemporaneous “keeping up” preferences merely because both contain relative consumption.

# 11. Implications and unresolved questions

The exact equivalence limits the model's ability to resolve asset-pricing puzzles. Increasing negative externalities can raise the equity premium for a fixed individual $\alpha$, but it does so in the same way as increasing CRRA curvature in the corresponding standard model. In the familiar calibrations discussed by the paper, that also worsens the risk-free-rate problem. Positive externalities move the premium in the opposite direction. A new preference label does not by itself add a new independent pricing channel.

The paper also argues that this particular mechanism is unlikely to account for excess stock-price volatility, because its entire pricing effect can already be replicated by a change in conventional CRRA curvature. This is a model-based implication and a comparison with prior literature, not a newly estimated rejection using data in the article.

Potential applications include understanding benchmark-sensitive investor demand or relative-performance incentives, but the literal theorem requires identical agents and the specified consumption externality. Heterogeneous reference groups, incomplete markets, labor income, portfolio restrictions, aggregate feedback, and different externality timing require new analysis. The central lesson is precise: private risk aversion holding the social reference fixed and equilibrium pricing curvature when the reference moves with aggregate consumption are different objects.
