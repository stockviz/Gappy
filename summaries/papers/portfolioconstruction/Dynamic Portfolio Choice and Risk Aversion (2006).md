# 1. Metadata

- **Title:** Dynamic Portfolio Choice and Risk Aversion
- **Author(s):** Costis Skiadas
- **Year:** 2006
- **Journal/Venue:** Book chapter

# 2. Problem statement

The chapter develops a general theory of **continuous-time lifetime consumption-portfolio choice under recursive utility**, with particular emphasis on forms of risk aversion that are not captured by time-additive expected utility. The main mathematical question is: **how can recursive utility and optimal portfolio choice be characterized using BSDE/FBSDE methods, including source-dependent first- and second-order risk aversion?**

# 3. Approach (short)

The method is stochastic control via backward stochastic differential equations. Recursive utility is defined as the solution of a BSDE with aggregator $F$. Utility supergradients are derived from the BSDE representation and combined with state-price dynamics to obtain optimality conditions as a forward-backward SDE system. Under homotheticity, the system can be reduced to a single BSDE; for important subclasses such as Epstein-Zin and related specifications, this BSDE becomes quadratic and can be reduced further to ODE systems in Markov settings.

# 4. Approach (detailed)

1. **Recursive utility as a BSDE**

   For a consumption plan $c$, recursive utility is defined by a BSDE of the form
   $$
   U_t
   =
   \int_t^T F(s,c_s,U_s,\Gamma_s)\,ds
   -\int_t^T \Gamma_s^\top\,dB_s,
   $$
   or in differential form
   $$
   dU_t = -F(t,c_t,U_t,\Gamma_t)\,dt + \Gamma_t^\top dB_t.
   $$
   The function $F$ is the **aggregator**. Different choices of $F$ generate Duffie-Epstein utility, Epstein-Zin utility, robust-control-style utilities, and source-dependent variants.

2. **Decision-theoretic properties**

   A central general result is that, under a regularity/comparison condition on the BSDE, recursive utility is:

   - dynamically consistent,
   - monotone,
   - concave,
   - independent of unrealized past alternatives.

   These are established using a BSDE comparison lemma: if one driver dominates another and terminal conditions are ordered, then the utility processes are correspondingly ordered.

3. **State prices and linear BSDEs**

   Before solving the portfolio problem, the chapter develops the dynamics of state-price densities. These satisfy linear BSDEs. This matters because optimality can be verified when the utility supergradient process matches a state-price density.

   The logic is the continuous-time version of the static first-order condition:
   $$
   \text{marginal utility} \propto \text{state price density}.
   $$

4. **Utility supergradient**

   The chapter derives a utility supergradient density from the recursive utility BSDE. If $F_c$ and $F_U$ denote derivatives of the aggregator, then the marginal-utility process can be written in terms of a linearization of the BSDE around the optimal plan. This gives a dynamic analogue of the first-order condition for utility maximization.

5. **Optimality as an FBSDE system**

   Combining:

   - wealth dynamics (forward SDE),
   - recursive utility dynamics (backward SDE),
   - the supergradient/state-price matching condition,

   the optimal consumption-portfolio problem becomes an **FBSDE**.

   In symbolic form, the system contains:

   - a forward wealth equation
     $$
     dW_t = \text{portfolio return and consumption terms},
     $$
   - a backward utility equation
     $$
     dU_t = -F(t,c_t,U_t,\Gamma_t)\,dt + \Gamma_t^\top dB_t,
     $$
   - first-order conditions linking consumption and portfolio choice to the adjoint/supergradient processes.

   Proposition 23 is the key verification result: if a feasible plan produces a supergradient density equal to a state-price density, then it is optimal.

6. **Homothetic recursive utility**

   The chapter then imposes scale invariance / homotheticity. This is crucial because it uncouples the FBSDE. Instead of solving for wealth and utility jointly, one can often reduce the problem to a single BSDE for a suitably normalized multiplier or value ratio.

   This is the real tractability result of the chapter. Without homotheticity, the general FBSDE is usually too hard to solve explicitly.

7. **Duffie-Epstein and Epstein-Zin cases**

   A major special case is the continuous-time limit of Kreps-Porteus utility, i.e. Duffie-Epstein utility. The associated aggregator can be written in homothetic form, and Epstein-Zin utility becomes a parametric special case. In these cases the chapter derives explicit optimality conditions and shows how risk aversion and intertemporal substitution separate.

8. **Source-dependent risk aversion**

   The chapter’s genuinely novel conceptual contribution is to allow risk aversion to depend on the **source of risk**. Instead of a scalar risk-aversion coefficient applied uniformly across Brownian shocks, one can have a matrix- or direction-dependent penalty. This allows:

   - source-dependent second-order risk aversion with smooth aggregators;
   - source-dependent first-order risk aversion with nonsmooth certainty equivalents.

   This connects recursive utility to ambiguity-aversion and robust-control formulations.

9. **Quadratic BSDEs**

   For important homothetic specifications, the normalized backward equation becomes quadratic:
   $$
   dY_t = -g(t,Y_t,Z_t)\,dt + Z_t^\top dB_t,
   $$
   where $g$ is quadratic in $Z_t$. In Markovian environments one can conjecture an affine-quadratic form for $Y_t$, apply Itô’s lemma, and reduce the BSDE to a system of ODEs (typically Riccati-type equations). This yields tractable solutions for Epstein-Zin-type problems and related cases.

10. **Proof logic**

   The chapter’s proofs proceed in layers:

   - define recursive utility through a BSDE and prove comparison principles;
   - derive utility supergradients by linearizing the BSDE;
   - match those supergradients to state-price dynamics;
   - obtain verification via the resulting FBSDE;
   - simplify under homotheticity and then under quadratic structure.

   So the chapter is both a general theory and a tractability program.

**Additional mathematical details**

The chapter’s core verification step can be stated succinctly. If recursive utility satisfies the BSDE
$$
U_t = E_t\!\left[\int_t^T F(c_s,U_s,Z_s)\,ds + \Phi(c_T)\right],
$$
then linearizing the driver around a candidate optimum produces a supergradient density process $\pi_t$. Optimality follows when that supergradient can be identified with a state-price density, because then any feasible perturbation has nonpositive first-order effect on lifetime utility. Proposition 23 is exactly this dynamic first-order-condition argument written in BSDE form.

Homotheticity matters because it collapses the coupled wealth-utility system to a normalized backward equation. In the Epstein-Zin class, that normalized BSDE is quadratic in the control term $Z_t$, which is why Markovian problems can often be reduced to Riccati-type ODEs. So the tractability gain is not generic to recursive utility; it comes from the specific homothetic and quadratic structure isolated by the chapter.

# 5. Domain of applicability

- The general results apply to **continuous-time portfolio choice under recursive utility** with sufficient BSDE regularity.
- The explicit tractable solutions require much more:
  - homotheticity,
  - often Markovian dynamics,
  - often quadratic-BSDE structure.
- The source-dependent risk-aversion discussion is conceptually broad, but only certain subclasses are solved explicitly.
- The chapter is mathematically stronger on **representation and optimality conditions** than on complete closed-form solutions in arbitrary environments.
