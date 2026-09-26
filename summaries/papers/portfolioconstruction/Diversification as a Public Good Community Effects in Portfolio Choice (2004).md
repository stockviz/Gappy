# 1. Metadata

- **Title:** Diversification as a Public Good: Community Effects in Portfolio Choice
- **Author(s):** Peter M. DeMarzo, Ron Kaniel, Ilan Kremer
- **Year:** 2004
- **Journal/Venue:** *Journal of Finance*

# 2. Problem statement

The paper studies whether individual portfolio choices can create an externality when agents compete for community-specific nontradable goods or services. In an otherwise rational general-equilibrium setting with complete financial markets, the question is whether borrowing constraints and local goods can induce investors to herd into correlated risky portfolios, thereby generating inefficient undiversified equilibria.

# 3. Approach (short)

The method is general equilibrium with segmented communities and borrowing-constrained participation. The model first shows that without the relevant friction, the usual diversified benchmark emerges. It then introduces local goods and collateral constraints, derives each investor’s best-response portfolio volatility as a function of community volatility, and studies fixed points of that best-response map. The main contribution is to show that diversification failure can arise endogenously even without irrational utility.

# 4. Approach (detailed)

1. **Community structure**

   Agents are partitioned into communities that consume community-specific local goods in addition to global goods. Prices of local goods move with community wealth, so a household cares about its wealth relative to others in the same community.

   In the frictionless benchmark, this relative-wealth effect is neutralized and the equilibrium is fully diversified and Pareto efficient.

2. **Borrowing constraints and asymmetric market participation**

   The friction is that local goods are poor collateral. Agents endowed mainly with local resources are more constrained in financial markets than agents endowed with globally tradable wealth. As a result, the set of investors actively trading securities is tilted toward those who want their financial wealth to covary positively with community wealth. This breaks the offsetting-trade logic of the benchmark model.

3. **Two-state reduction**

   In the core two-state example, investor $i$ in community $j$ chooses a portfolio payoff
   $$
   z_i=
   \begin{cases}
   \bar z_i(1+\sigma_i), & s=1,\\
   \bar z_i(1-\sigma_i), & s=2,
   \end{cases}
   $$
   where $\sigma_i$ measures portfolio volatility/bias and community volatility is $\sigma$. Taking community wealth as given, the investor chooses $\sigma_i$ to equalize marginal utility across states.

4. **Best-response function**

   The first-order condition implies
   $$
   \frac{h(1+\sigma)}{1+\sigma_i}=\frac{h(1-\sigma)}{1-\sigma_i},
   $$
   hence
   $$
   \sigma_i=m(\sigma)\equiv
   \frac{h(1+\sigma)-h(1-\sigma)}{h(1+\sigma)+h(1-\sigma)}.
   $$
   Equilibrium requires the fixed-point condition
   $$
   \sigma = m(\sigma).
   $$
   This is the key reduced-form object in the paper.

5. **Properties of the best-response map**

   Lemma 4 establishes:
   - $m(0)=0$,
   - $m$ is odd,
   - for $\gamma>1$, $m$ is increasing,
   - the slope at zero is
     $$
     m'(0)=\frac{\alpha(\gamma-1)}{1+\alpha},
     $$
     so $m'(0)>1$ iff
     $$
     \gamma > 2+\frac{1}{\alpha}.
     $$

   The interpretation is direct: sufficiently risk-averse agents overreact to small community tilts, so herding can become self-reinforcing.

6. **Existence of undiversified equilibrium**

   Theorem 1 states that for $\gamma>1$ investors have a herding motive, and for sufficiently large $\gamma$ the fully diversified equilibrium $\sigma=0$ coexists with undiversified equilibria $\sigma^*>0$ and $-\sigma^*$. The undiversified equilibrium emerges entirely from strategic complementarity in hedging local-good price risk.

7. **Stability**

   Using iterative best responses, Theorem 2 shows:
   - when $m'(0)>1$, full diversification is unstable,
   - the undiversified equilibrium is locally stable.

   Thus, the inefficient equilibrium is not just a mathematical curiosity; it is the dynamically attractive one under fictitious-play style adjustment.

8. **Welfare**

   Theorem 3 shows the fully diversified equilibrium Pareto dominates the undiversified equilibrium. Diversification is therefore a public good: no individual wants to diversify unilaterally once the community is tilted, but everyone would be better off if the community diversified jointly.

   This is the paper’s main economic punchline. Herding is rational individually but inefficient socially.

9. **Biased or constrained traders**

   The model is then extended to include a group with exogenous bias or tighter constraints. Theorem 4 shows that any positive mass of such traders can eliminate the full-diversification equilibrium and push the whole community to a stable positive-volatility equilibrium. Rational traders amplify the bias rather than offset it because the bias changes the local-good price hedge they face.

10. **What is exact**

   - The fixed-point characterization of equilibrium in the two-state model is exact.
   - The existence, stability, and welfare theorems are exact within the model.
   - The broader claims about real-world herding are interpretations of those exact comparative statics.

# 5. Domain of applicability

- The paper applies where investors compete for local or demographic-specific nontradables and face borrowing/collateral frictions.
- It is a rational-herding theory, not a behavioral one; the mechanism does not require irrational utility.
- The clean fixed-point results come from a highly stylized two-state structure. The qualitative insight is broader than the exact formulas.
- The theory is about portfolio correlation and diversification, not security selection per se.
- The genuine novelty is showing that underparticipation and local goods make diversification a coordination problem, hence a public good.
