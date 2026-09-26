# 1. Metadata

- **Title:** Portfolio Theory
- **Author(s):** John H. Cochrane
- **Year:** 2007
- **Journal/Venue:** Lecture notes / manuscript

# 2. Problem statement

The notes ask the canonical question of asset allocation in its most general form: **given contingent-claim prices or, equivalently, a stochastic discount factor $m$, what payoff or portfolio solves an investor’s utility-maximization problem, and how do the standard mean-variance formulas emerge as approximations or special cases?** The problem is solved in both payoff space and portfolio-weight space, and then extended to dynamic settings with forecastable returns.

# 3. Approach (short)

The method is intertemporal asset-pricing plus optimization. Cochrane formulates portfolio choice first as a problem over final payoffs $x$, using the pricing identity $p=E(mx)$, which makes first-order conditions simple. He then maps the solution back into portfolio weights, derives the mean-variance frontier as a quadratic approximation, and connects dynamic portfolio choice to choosing managed portfolios or contingent claims.

# 4. Approach (detailed)

1. **Choose payoffs, not weights**

   In a complete one-period market, the investor chooses a payoff $x$ rather than weights:
   $$
   \max_x E[u(x)]
   \qquad \text{s.t.} \qquad E[mx]\le W_0.
   $$
   The Lagrangian is
   $$
   \mathcal L = E[u(x)]-\lambda(E[mx]-W_0),
   $$
   and the first-order condition is
   $$
   u'(x(s))=\lambda m(s).
   $$
   Therefore the optimal payoff is
   $$
   x^\star(s) = (u')^{-1}(\lambda m(s)).
   $$
   This is the cleanest version of portfolio theory in the notes: optimal portfolios load heavily in states with low state prices and lightly in states with high state prices.

2. **Power utility and payoff shape**

   For CRRA utility $u(x)=x^{1-\gamma}/(1-\gamma)$,
   $$
   x^\star \propto m^{-1/\gamma}.
   $$
   The optimal payoff is therefore a nonlinear claim on the discount factor, not just a static stock-bond mix. This is a central conceptual point of the notes: solving in payoff space often makes the problem trivial, whereas the same solution looks complicated in security-weight space.

3. **Recover the mean-variance approximation**

   Mean-variance analysis arises from a quadratic or local approximation to expected utility. If $R_p$ is a gross return near 1, then
   $$
   E[u(R_p)] \approx u(E[R_p]) + \frac12 u''(E[R_p])\operatorname{Var}(R_p),
   $$
   which yields the standard objective
   $$
   \max_w \; E[R_p]-\frac{\gamma}{2}\operatorname{Var}(R_p),
   \qquad R_p = r_f + w^\top (R-r_f\mathbf 1).
   $$
   Writing $\mu=E[R-r_f\mathbf 1]$ and $\Sigma=\operatorname{Var}(R-r_f\mathbf 1)$, the first-order condition gives
   $$
   w^\star = \frac{1}{\gamma}\Sigma^{-1}\mu.
   $$
   This is the standard tangency-demand formula.

4. **Frontier geometry**

   The notes rederive the mean-variance frontier and two-fund theorem. Any efficient portfolio can be represented as a combination of:

   - the risk-free asset; and
   - one tangency portfolio of risky assets.

   Equivalently, in the risky-only problem, all frontier portfolios lie in the span of $\Sigma^{-1}\mathbf 1$ and $\Sigma^{-1}\mu$. This is standard quadratic programming, but Cochrane’s emphasis is that it is only a local/approximate representation of the more general payoff-choice problem.

5. **Relative-to-market portfolios**

   The notes then decompose portfolios relative to the market portfolio and factor/beta representations. In essence, once one has
   $$
   E[R_i-r_f] = \beta_i \lambda,
   $$
   the portfolio problem can be re-expressed in terms of exposures to priced risk factors and deviations from the market portfolio. This connects standard portfolio choice to linear factor pricing.

6. **Bayesian and estimation issues**

   One reason practical portfolios differ wildly from textbook formulas is that
   $$
   w^\star = \frac{1}{\gamma}\Sigma^{-1}\mu
   $$
   is highly sensitive to estimation error. The notes discuss “wacky weights” and Bayesian/shrinkage approaches precisely because the unconstrained quadratic solution is ill-conditioned when $\mu$ is estimated noisily.

7. **Dynamic portfolios**

   The dynamic problem is conceptually reduced to the same payoff logic: a dynamic strategy is just a claim with a state-contingent payoff. Thus dynamic portfolio choice can be read as static portfolio choice over managed portfolios or contingent claims. When returns are forecastable, state variables enter both the investment opportunity set and the SDF, and the optimal policy inherits hedging motives against changes in state variables.

8. **Proof logic**

   The notes contain several derivations, but the backbone is:

   - use the budget set $E[mx]\le W_0$;
   - derive $u'(x)=\lambda m$;
   - map that payoff back into portfolios if the market is complete;
   - obtain mean-variance formulas by quadratic approximation in return space;
   - extend to dynamics by enlarging the span of attainable payoffs.

   The exact result is the payoff FOC $u'(x)=\lambda m$. Mean-variance formulas are approximations or special cases built on top of that exact pricing relation.

# 5. Domain of applicability

- The notes apply broadly to **portfolio choice in complete and approximately complete markets**.
- The exact payoff-space solution requires knowledge of attainable contingent claims or an equivalent market-completeness representation.
- Mean-variance formulas are only exact under special conditions and otherwise serve as approximations.
- The notes are strongest as a conceptual unification of portfolio theory and asset-pricing theory; they are not a new empirical portfolio-construction method.
