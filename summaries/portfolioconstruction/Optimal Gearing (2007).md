# Optimal Gearing

**Source:** [LeveragedPortfolio_JohnsonKahnPetrich_2007.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/LeveragedPortfolio_JohnsonKahnPetrich_2007.pdf>)  
**Source coverage:** all nine PDF pages, including Appendices A-B and the descriptions of Exhibits 1-5.

## 1. Metadata

- **Title:** Optimal Gearing
- **Author(s):** Seanna Johnson, Ronald N. Kahn, Dean Petrich
- **Year:** 2007
- **Journal/Venue:** *The Journal of Portfolio Management*

## 2. Problem statement

The paper asks whether all long-short portfolios are equally efficient. Its answer is no: **for a given alpha process, residual risk level, and breadth, there is an optimal amount of leverage/gearing, and mismatching risk with gearing lowers implementation efficiency.**

## 3. Approach (short)

The method is a stylized active-management model with many independent stock alphas and identical residual risks. The paper writes expected utility as alpha minus risk penalty, derives optimal holdings, and then computes the implied expected alpha, residual risk, and gearing. This reveals that these three objects are linked by a single degree of freedom. The paper evaluates deviations from the natural gearing using the transfer coefficient (TC).

## 4. Approach (detailed)

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

   In both cases, the model-implied information ratio falls.

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

   The holdings solution is exact in the stylized model; the closed-form aggregate relations replace cross-sectional sums by their expectations:

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

## 5. Domain of applicability

- The clean formulas apply to a **stylized market-neutral stock-selection model** with identical residual volatilities and independent standardized signals.
- The paper’s qualitative message is robust: risk and gearing are jointly determined by the signal and constraints.
- The exact constants are not universal; real portfolios have heterogeneous risks, factor constraints, and trading costs.
- Thus the paper proves a structural implementation point, not a universal gearing formula for all long-short portfolios.


## 6. Exact normalization and the natural gearing formula

The source appears in *The Journal of Portfolio Management* 33(4), Summer 2007, pp. 10-18. It studies expected implementation efficiency, not realized performance of a historical trading strategy. A key convention is $G=\tfrac12\|h\|_1$: 100% long plus 100% short has gearing one. A system that reports total gross exposure would report two for the same book. All numerical gearing comparisons must respect that factor of two.

For common residual volatility $\omega_0$, independent standard-normal scores, and positive $IC$, define $c=IC/(2\lambda\omega_0)$. The unconstrained holdings are $h_i=cz_i$. For a finite realized score vector,
$$
\alpha_P=\frac{IC^2}{2\lambda}\sum_i z_i^2,\qquad
\omega_P=\frac{IC}{2\lambda}\sqrt{\sum_i z_i^2},\qquad
G=\frac{IC}{4\lambda\omega_0}\sum_i|z_i|.
$$
Replacing the cross-sectional sums by their normal expectations yields
$$
\alpha^*\simeq\frac{IC^2N}{2\lambda},\quad
\omega^*\simeq\frac{IC\sqrt N}{2\lambda},\quad
G^*\simeq\frac{ICN}{2\lambda\omega_0\sqrt{2\pi}}.
$$
The first expected alpha identity is exact under the stated random-score model; the expression for risk uses the root of expected squared risk rather than the exact expectation of the square root. These formulas are large-universe approximations when used for an actual realized portfolio. Eliminating $\lambda$ gives the operational relation
$$
\boxed{G^*\simeq\frac{\omega^*}{\omega_0}\sqrt{\frac{N}{2\pi}}.}
$$
With $N=250$, $\omega_0=25\%$, and target residual risk $\omega^*=5\%$, this gives $G^*\simeq1.26$. Conversely, gearing one has natural residual risk about 3.96%. Choosing 10% risk while insisting on gearing one therefore requires changing the *shape* of the holdings away from the signal-efficient portfolio, not just scaling it.

The model's iid score vector is neutral in expectation. An exactly zero-net book in a finite sample requires an additional budget condition or score demeaning. Likewise, independent residual returns are stronger than simply using a factor model. The formula is a diagnostic benchmark; its $N$ cannot automatically be read as the number of securities in an arbitrarily correlated portfolio.

## 7. How a gearing penalty distorts the holdings

For clarity, use a penalty $\tau\sum_i|h_i|$, with $\tau$ measured in expected-return units. With positive $\tau$ and diagonal residual covariance, the problem is
$$
\max_h\sum_i\{\alpha_i h_i-\lambda\omega_0^2h_i^2-\tau|h_i|\}.
$$
The solution is soft thresholding:
$$
h_i=\frac{\operatorname{sign}(\alpha_i)}{2\lambda\omega_0^2}
\bigl(|\alpha_i|-\tau\bigr)_+.
$$
This is the mechanism behind undergearing. Weak forecasts no longer generate positions; stronger forecasts receive concentrated allocations. To raise risk without raising gross exposure, the optimizer progressively abandons weak signals and diversification. A portfolio can preserve substantial forecast alpha in a few names while losing a great deal of information ratio because risk rises too quickly.

The source scales its penalty by $IC\omega_0$, so its dimensionless $\phi$ corresponds to $\tau/(IC\omega_0)$. A value of one therefore thresholds at a one-standard-deviation alpha. A penalty traces expected gearing across random score realizations; it does not fix precisely the same gross exposure for every sample.

Negative $\phi$ encourages gearing. In the source's construction, the side of each security is fixed by the sign of its alpha; positive-alpha names remain long and negative-alpha names remain short. On that sign-restricted domain, an encouragement term increases the absolute magnitude of even weak forecasts, leaving a gap around zero. This qualification matters: an equality constraint on gross exposure, or an objective that rewards an absolute-value norm, is not generically a convex optimization problem on unrestricted signed holdings.

### Transfer coefficient as an angle

Under diagonal common risk, the information ratio of a nonzero portfolio is proportional to $\alpha^\top h/\|h\|_2$. Its ratio to the unconstrained maximum is
$$
TC=\frac{\alpha^\top h}{\|\alpha\|_2\|h\|_2}.
$$
For a general positive-definite covariance $V$, the corresponding geometric formula is
$$
TC=\frac{\alpha^\top h}{\sqrt{\alpha^\top V^{-1}\alpha}\sqrt{h^\top Vh}}.
$$
These expressions make the efficiency loss precise: scale alone does not change the angle, but incompatible risk and gross targets change the direction of holdings. The denominator uses the optimum for the same admissible baseline; extra neutrality restrictions require the appropriately projected optimum.

## 8. Why the two extremes are asymmetric

In the undergeared limit, positions concentrate in the strongest positive and negative forecasts and many holdings are exactly zero. In the source's continuum normal approximation, information transfer can approach zero as concentration becomes extreme. For a finite universe, the attainable extremes are bounded by the actual score realization and the number of names; the limiting curve should not be interpreted as a literal zero-IR theorem for every finite portfolio.

In the overgeared limit, equal-risk independent assets receive nearly equal absolute weights on each side. Forecast *magnitudes* are lost, but forecast *signs* remain. Under the standard-normal score model, the limiting correlation of $z$ with $\operatorname{sign}(z)$ is
$$
E|z|=\sqrt{2/\pi}\simeq0.798.
$$
This explains the roughly 80% lower limit visible in the simple-model transfer-coefficient discussion. It is not a universal floor after costs, constraints, unequal volatilities, or correlated returns.

Cauchy-Schwarz also gives a feasibility bound:
$$
2G=\sum_i|h_i|\le\sqrt{N}\,\|h\|_2
=\frac{\sqrt N}{\omega_0}\omega_P.
$$
Hence $G\le\sqrt N\,\omega_P/(2\omega_0)$, or $\omega_P\ge2G\omega_0/\sqrt N$. At a fixed risk, the maximum feasible gearing is only $\sqrt{\pi/2}\simeq1.253$ times the natural gearing in this model. This is a bound induced by the diagonal risk structure and finite universe, not a general regulatory leverage limit. With heterogeneous independent risks, the analogous bound contains $\sqrt{\sum_i\omega_i^{-2}}$.

The holding-distribution diagnostics follow directly: a mass at exactly zero suggests a binding penalty on gross exposure; a missing region around zero suggests gross exposure has been forced too high for the risk target. They are suggestive rather than conclusive in a real book, because transaction costs, minimum trade sizes, integer lots, and explicit cardinality constraints can create similar patterns.

## 9. Evidence, costs, and the practical decision

The paper first uses random alphas and a realistic covariance matrix to show that the same qualitative frontier shape survives beyond the independent-risk toy model. It then adds transaction costs, asset bounds, and gearing constraints. These exhibits compare expected alpha with expected risk. They are not a time-series out-of-sample test, and the paper should not be cited as establishing a realized return premium for a particular leverage ratio.

Costs make both extremes more damaging. An overgeared minimum-risk portfolio can change the side of weak-alpha positions as signals cross zero, incurring costs disproportionate to their expected contribution. An undergeared high-risk book may trade aggressively into a few large positions. In the realistic examples, expected net returns can become negative at both ends. The clean cost-free 80% limiting efficiency does not protect the net strategy.

The paper also identifies stock borrowing charges, regulatory limits, changes in individual-stock risk, and changes in the eligible liquid universe as determinants of natural gearing. For a fixed portfolio risk, higher single-stock residual volatility lowers the formula's natural gearing. A shrinking universe lowers the amount of diversification available. These changes can make a previously reasonable fixed product specification inefficient.

For implementation, estimate the unconstrained or baseline-constrained signal-efficient portfolio at the desired risk, measure its implied gross exposure, and compare nearby joint risk/gross choices after costs. Do not impose a mandated gross exposure as an equality when it is merely an upper limit: with only an upper bound, an optimizer may simply choose less gross exposure instead of becoming overgeared. Report expected net alpha, risk, gross exposure, concentration, turnover, and marginal shadow costs together. The central contribution is to make risk and gearing a joint portfolio-design decision rather than independent marketing specifications.
