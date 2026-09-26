# 1. Metadata

- **Title:** The Growth of Relative Wealth and the Kelly Criterion
- **Author(s):** Andrew W. Lo, H. Allen Orr, Ruixun Zhang
- **Year:** 2018
- **Journal/Venue:** *Journal of Bioeconomics*

# 2. Problem statement

The paper asks when the Kelly criterion remains optimal once the objective shifts from absolute wealth to **relative wealth**. Formally: **if an investor cares about her wealth share relative to another investor rather than about $E[\log W_T]$ alone, how does the optimal leverage or risky allocation deviate from the Kelly fraction, and how does this depend on initial market share?**

# 3. Approach (short)

The method is an evolutionary two-investor portfolio-growth model. The paper compares the classic Kelly solution for maximizing expected log wealth with the solution to maximizing expected relative wealth, both myopically and over longer horizons. The analysis yields explicit propositions showing that relative-wealth optimality generally does not coincide with Kelly, and that the deviation depends on the opponent’s behavior and the investor’s current market share.

# 4. Approach (detailed)

1. **Absolute-wealth benchmark**

   Let $f$ be the investor’s risky allocation and $g$ the competitor’s. If the gross return on the investor’s portfolio is $\omega_t(f)$, the Kelly problem maximizes
   $$
   E[\log \omega_t(f)]
   $$
   or the long-run sum of such terms. The optimal $f^{Kelly}$ is the standard growth-optimal choice.

2. **Relative wealth**

   Let $W_t^f$ and $W_t^g$ be the two investors’ wealth levels and define the relative-wealth share
   $$
   q_t = \frac{W_t^f}{W_t^f + W_t^g}.
   $$
   The new objective is to maximize $E[q_T]$ or $E[q_1]$, not $E[\log W_T^f]$.

3. **Why the objective changes the solution**

   Relative wealth depends on both portfolios simultaneously:
   $$
   q_{t+1} = \frac{q_t \omega_t(f)}{q_t\omega_t(f)+(1-q_t)\omega_t(g)}.
   $$
   The denominator means the investor’s optimal policy now depends on the competitor’s behavior and the current share $q_t$. Kelly’s separability is lost.

4. **Main propositions**

   The paper proves several monotonicity and local-comparison results:

   - if the investor maximizes relative wealth, the optimizer need not equal $f^{Kelly}$;
   - the deviation depends on the competitor’s allocation $g$;
   - the sign of the deviation depends on initial relative wealth $\lambda=q_0$.

   In particular, a dominant investor and a minor investor may optimally deviate from Kelly in opposite directions when competing against the same opponent.

5. **Interpretation**

   Kelly is optimal for absolute-growth maximization because only the investor’s own multiplicative process matters. Relative-wealth maximization is a competitive or evolutionary criterion. The investor trades off growth against relative position versus the opponent. This makes initial market power a state variable.

6. **Proof sketch**

   For the one-period problem, the paper differentiates the expected relative-wealth objective
   $$
   E\!\left[
   \frac{\lambda \omega(f)}
   {\lambda \omega(f)+(1-\lambda)\omega(g)}
   \right]
   $$
   with respect to $f$ and compares the FOC to the Kelly FOC. The resulting derivative contains the opponent’s payoff $\omega(g)$ and the initial share $\lambda$, which is exactly why the solution shifts away from Kelly unless special symmetry conditions hold.

7. **What is novel**

   The novelty is conceptual and mathematical: portfolio growth theory changes materially when the objective is relative rather than absolute. The Kelly criterion emerges only as a special case of the broader evolutionary problem.

# 5. Domain of applicability

- The analysis applies to **competitive wealth dynamics** where investors care about market share or relative standing.
- It is not a replacement for Kelly in standard single-investor welfare problems.
- The model is stylized, with a small number of assets and investors, but it cleanly isolates the effect of relative-wealth objectives.
- The main limitation is that relative wealth is only one possible social or institutional objective; the paper does not claim it is universally relevant.
