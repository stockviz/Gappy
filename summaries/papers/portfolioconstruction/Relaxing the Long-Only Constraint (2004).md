# 1. Metadata

- **Title:** Relaxing the Long-Only Constraint
- **Author(s):** Roger Clarke, Harindra de Silva, Steven Sapra
- **Year:** 2004
- **Journal/Venue:** *The Journal of Portfolio Management*

# 2. Problem statement

The paper asks: **how much implementation efficiency is lost because active equity portfolios are long-only, and how much of that loss can be recovered by allowing limited shorting?** The relevant concept is not raw expected return but the ability of the optimized portfolio to transmit the manager’s information into positions.

# 3. Approach (short)

The paper uses quadratic active management optimization and evaluates portfolios through the transfer coefficient (TC), the implementation-efficiency term in the fundamental law of active management. By comparing optimizations with and without long-only and related constraints, it shows that the long-only restriction is usually the largest source of information loss and that modest shorting often recovers most of the loss.

# 4. Approach (detailed)

1. **Optimization setting**

   Let $h$ denote active portfolio weights relative to a benchmark, let $\alpha$ denote expected active returns (or a standardized score proportional to expected alpha), and let $\Sigma$ denote the active risk model. The canonical quadratic active utility is
   $$
   \max_h \;\alpha^\top h-\lambda h^\top \Sigma h
   $$
   subject to implementation constraints such as:

   - beta neutrality / market exposure;
   - sector neutrality;
   - industry neutrality;
   - market-cap neutrality;
   - position limits;
   - long-only or bounded-short constraints.

   Without binding constraints, the optimizer would choose
   $$
   h^\ast \propto \Sigma^{-1}\alpha.
   $$
   Constraints distort this direction.

2. **Transfer coefficient**

   The paper interprets implementation efficiency through the fundamental law:
   $$
   IR \approx IC \times TC \times \sqrt{\text{breadth}}.
   $$
   Here $TC$ measures how closely the implemented portfolio aligns with the unconstrained optimal signal direction. In a standard quadratic setting, one can think of it as the correlation, under the risk inner product, between the constrained solution and $\Sigma^{-1}\alpha$. Thus:

   - $TC=1$: no information loss;
   - $TC<1$: constraints block the expression of alpha.

3. **Why long-only is especially costly**

   In benchmarked equity portfolios, many benchmark names have small benchmark weights. If the manager dislikes those names, the natural active position is often a short or at least a large underweight. But long-only means active weights cannot go below $-w_b$, so many negative views get compressed. Algebraically, the feasible set truncates the negative coordinates of $\Sigma^{-1}\alpha$, and the constrained KKT solution becomes
   $$
   \alpha-2\lambda \Sigma h-\Gamma^\top \eta =0,
   $$
   with complementary slackness on the inequality constraints. The truncation is strongest where benchmark weights are smallest, so the implemented portfolio becomes systematically less aligned with the alpha vector.

4. **Risk level and shorting**

   The paper emphasizes a comparative-static result: if one increases target active risk while keeping the portfolio long-only, the transfer coefficient declines. The reason is simple. At low target risk, only a modest part of the unconstrained solution is needed, so inequality constraints may not bind much. At high target risk, the optimizer wants more extreme positive and negative positions; long-only bites harder, so TC falls.

   By contrast, once shorting is allowed, the optimizer can keep the portfolio closer to the unconstrained direction over a wider range of risk levels. This is why the paper finds a much flatter TC-versus-tracking-error relation for long-short portfolios.

5. **Marginal value of relaxing constraints**

   The paper studies a sequence of optimizations in which constraints are removed one at a time. Empirically, removing the long-only constraint causes the largest increase in TC. This is consistent with the math above: long-only changes the feasible cone most directly relative to the unconstrained $\Sigma^{-1}\alpha$ solution.

   The market-cap neutrality constraint is next most important in the reported examples because it forces the optimizer away from the names where alpha often concentrates.

6. **Limited shorting**

   The practically relevant part of the paper is not “go fully unconstrained,” but “allow some shorting.” The authors compare portfolios such as:

   - long-only;
   - $+110/-10$;
   - $+120/-20$;
   - $+130/-30$;
   - etc.

   The main finding is that much of the TC improvement arrives very early: even $10\%$–$20\%$ short capacity can recover a large share of the efficiency loss. In quadratic terms, once the optimizer is allowed to express at least the strongest negative views, the marginal value of further shorting declines.

7. **What is proved and what is empirical**

   The paper does not prove a theorem in the econometric sense. Its mathematical content is the standard quadratic-optimization geometry:

   - unconstrained active portfolios point in the direction $\Sigma^{-1}\alpha$;
   - binding inequality constraints reduce the cosine between the implemented and unconstrained directions;
   - long-only constraints bind asymmetrically on negative views and therefore are especially destructive.

   The size of the effect, however, is empirical. The “10%–20% shorting recovers most of the benefit” statement is a property of the tested portfolios, not a general theorem.

**Additional mathematical details**

The unconstrained active problem behind the paper is
$$
\max_h \alpha^\top h
\qquad\text{s.t.}\qquad
h^\top V h = \sigma_A^2,
$$
with solution
$$
h^\star=\kappa V^{-1}\alpha,
\qquad
\kappa=\frac{\sigma_A}{\sqrt{\alpha^\top V^{-1}\alpha}}.
$$
In that case the transfer coefficient is $TC=1$. Once long-only or box constraints are imposed, the KKT system projects $V^{-1}\alpha$ onto the feasible cone, and the implemented $TC$ becomes the cosine of the angle between the feasible portfolio and the unconstrained optimum in the $V$-inner product:
$$
TC=\frac{\alpha^\top h}{\sqrt{\alpha^\top V^{-1}\alpha}\sqrt{h^\top V h}}.
$$

This geometry explains why limited shorting helps so much. The long-only constraint binds mainly on the negative-alpha names, so allowing even modest short positions enlarges the feasible cone enough to keep the implemented portfolio much closer to $V^{-1}\alpha$. The paper’s empirical exhibits are therefore best read as a projection argument, not just as a simulation curiosity.

# 5. Domain of applicability

- The analysis applies to **benchmark-relative active equity management** with quadratic risk control.
- It is most relevant when alpha is cross-sectional and benchmark weights are highly uneven, because that is where long-only most heavily censors negative views.
- The paper is less informative for:
  - absolute-return portfolios,
  - portfolios with large transaction-cost penalties,
  - strategies whose primary constraints are factor neutrality rather than long-only.
- Its broad claim that modest shorting is valuable is well supported by the optimization geometry, but the exact optimal short budget is not proved to be universal.
