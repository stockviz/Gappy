## 1. Metadata

- **Title:** Dynamic Portfolio Choice with Linear Rebalancing Rules
- **Author(s):** Ciamac C. Moallemi and Mehmet Sağlam
- **Year:** 2017
- **Journal/Venue:** *Journal of Financial and Quantitative Analysis*

## 2. Problem statement

The paper studies a broad dynamic portfolio choice problem in which returns may be predictable through factor processes, transaction costs may be complex, and trading/position constraints may be convex but binding. In such settings the truly optimal dynamic policy is typically intractable. The question is whether one can restrict the policy space enough to restore tractability without collapsing all recourse to a static or purely deterministic rule.

The paper's answer is to optimize over a class of **linear rebalancing rules**, prove that the resulting problem is convex, and show that many common heuristics and exact linear-quadratic policies are nested in that class.

## 3. Approach (short)

The method is tractable policy-class restriction in stochastic control. Instead of solving over all admissible dynamic policies, the paper restricts attention to affine trading rules in the realized history of predictive factors:
$$
u_t=c_t+\sum_{s=1}^t E_{s,t} f_s.
$$
Under mild assumptions on exogenous factor dynamics, convex trading constraints, and concave pathwise reward, the finite-dimensional optimization over the policy parameters $(E,c)$ becomes a convex program. The paper then shows how to solve it exactly when structure permits, by sample-average approximation otherwise, or by stochastic approximation in large-scale settings. The contribution is therefore methodological: replace an intractable dynamic program by a tractable convex optimization over a rich but structured policy class.

## 4. Approach (detailed)

1. **Write the dynamic portfolio problem at the path level.**

   Let $x_t$ denote positions after trading at date $t$, $u_t=x_t-x_{t-1}$ the trade, and $f_t$ the vector of return-predictive factors. The paper assumes exogenous asset prices and factor dynamics driven by IID shocks. The objective is a concave functional of the realized position path and factor path, written abstractly as
   $$
   E_\pi[p(x,f)].
   $$
   This notation is intentionally broad enough to include:
   - expected utility of terminal wealth,
   - mean-variance style objectives,
   - execution problems,
   - risk-constrained formulations.

2. **State the admissible policy restriction.**

   The key definition is:
   $$
   u_t=c_t+\sum_{s=1}^t E_{s,t}f_s,\qquad t=1,\dots,T,
   $$
   where $c_t\in\mathbb R^N$ and $E_{s,t}\in\mathbb R^{N\times K}$ are decision variables. A policy of this form is called a **linear rebalancing policy**. It is nonanticipative because $u_t$ depends only on factors observed up to $t$.

   This class is broad enough to contain:
   - deterministic policies ($E_{s,t}=0$),
   - linear-quadratic-control optimal policies,
   - linear benchmark-adjustment rules,
   - basis-function expansions once factors are augmented.

3. **Define the feasible parameter set.**

   Let $U$ be the set of feasible trade sequences induced by convex trading and position constraints. Then define
   $$
   C=\{(E,c):\text{ the induced trade sequence }u \text{ lies in }U \text{ almost surely}\}.
   $$
   Examples of constraints that fit:
   - no short sales in positions,
   - sale-only execution,
   - leverage bounds,
   - convex transaction-cost budget constraints.

4. **Reduce the dynamic problem to finite-dimensional optimization.**

   The original stochastic control problem is replaced by
   $$
   \sup_{\pi\in L} E_\pi[p(x,f)],
   $$
   where $L$ is the class of feasible linear rebalancing rules. Since every such policy is determined by $(E,c)$, the optimization becomes
   $$
   \max_{E,c} E[p(x,f)]
   $$
   subject to
   $$
   x_t=x_{t-1}+u_t,\qquad
   u_t=c_t+\sum_{s=1}^t E_{s,t}f_s,\qquad
   (E,c)\in C.
   $$
   This is Proposition 1's program.

5. **Prove convexity of the parameterized problem.**

   The proof is short and central:
   - by assumption, for fixed factor path $f$, the reward $p(x,f)$ is concave in the position path $x$;
   - the positions $x$ are affine in the decision variables $(E,c)$ because trades are affine in $(E,c)$;
   - composition of a concave function with an affine map is concave;
   - expectation preserves concavity;
   - the feasible set $C$ is convex because it is induced by convex constraints on trades/positions.

   Therefore the finite-dimensional problem is a convex program. This is the core theorem: tractability comes from the joint choice of policy class and convex primitives.

6. **Show how common models fit inside the framework.**

   The paper embeds several examples.

   - **Models of returns with predictive variables:** factor processes can be general Markov dynamics, as long as they are exogenous.
   - **Gârleanu-Pedersen linear-quadratic trading:** when returns are linear in factors and costs are quadratic, the exact optimal policy is affine in state and therefore belongs to the linear-rebalancing class.
   - **Expected utility of terminal wealth:** if utility is increasing and concave and transaction costs are convex, then the pathwise reward satisfies the concavity assumption.

   This matters because the policy class is not ad hoc; it contains several models that are already standard.

7. **Explain the relation to exact LQC solutions.**

   In an LQC problem, the optimal policy has the form
   $$
   x_t=\Phi_{x,t}x_{t-1}+\Phi_{f,t}f_t,
   $$
   hence
   $$
   u_t=x_t-x_{t-1}
   $$
   is linear in current state and factors and therefore can be rewritten in the policy form above. So when the underlying problem is genuinely LQC, the optimal linear rebalancing rule is actually globally optimal over all admissible policies, not just within the restricted class.

8. **Provide numerical solution methods.**

   The paper gives three solution routes.

   - **Exact reformulation:** if the primitives are simple enough, the expectation can be integrated analytically and the problem becomes a standard quadratic, second-order-cone, or other convex program.

   - **Sample average approximation:** with sampled factor paths $f^{(1)},\dots,f^{(S)}$, solve
     $$
     \max_{E,c}
     \frac1S\sum_{\ell=1}^S p(x^{(\ell)},f^{(\ell)})
     $$
     subject to pathwise feasibility on each simulation. This is a deterministic convex approximation that converges under standard regularity conditions.

   - **Stochastic approximation:** writing the objective as $E[h(z)]$ with $z=(E,c)$, one can use stochastic gradient methods because
     $$
     \nabla h(z)=E[\nabla_z p(z,f)]
     $$
     under suitable conditions.

9. **Clarify the approximation logic.**

   The paper is explicit that solving over linear rebalancing rules generally does **not** give the fully optimal dynamic policy. The gain is instead:
   - keep recourse and dynamic response to factor realizations,
   - preserve convexity,
   - retain global solvability.

   This is superior to purely static or deterministic approximations, and unlike nonconvex parameterizations it avoids local-optimum ambiguity.

10. **Execution example.**

   In the liquidation example, the investor must sell a block over time, faces transaction costs, has predictive signals, and is constrained to sale-only trades. This does not admit a closed-form unconstrained LQC solution. The linear-rebalancing policy class handles it because sale-only constraints are convex and easily encoded in $C$. The paper then compares the best linear rule to deterministic schedules, MPC-type heuristics, and projected LQC approximations.

11. **Proof sketch of why the method is implementable.**

   The important proof is not existence of a solution but preservation of convexity under policy restriction. Once $x$ is affine in $(E,c)$, any concave pathwise objective yields a concave objective in policy parameters. This is precisely why the policy class is linear in *observables* rather than linear in arbitrary free coefficients attached to nonlinear wealth dynamics. The design is chosen so that simulation-based or exact convex optimization remains available.

12. **Implementation recipe.**

   To reproduce the method:
   1. specify factor dynamics $f_t$ and return dynamics;
   2. specify pathwise reward $p(x,f)$ and convex constraints;
   3. parameterize trades by
      $$
      u_t=c_t+\sum_{s\le t} E_{s,t}f_s;
      $$
   4. generate either an exact convex reformulation or a Monte Carlo sample-average approximation;
   5. solve the convex program for $(E,c)$;
   6. deploy the resulting rule online by plugging realized factors into the affine trade map.

## 5. Domain of applicability

The method applies whenever the investor has predictive factors, wants dynamic recourse, and faces convex objectives/constraints that make exact dynamic programming infeasible. It is especially useful in execution, benchmark-relative trading, and mean-variance-type rebalancing problems with frictions.

Its limitation is exactly its strength: the policy class is restricted. If the true optimal policy is highly nonlinear in the state, linear rebalancing rules may miss important structure. The guarantees are about convexity and tractability of the restricted problem, not global optimality in the full admissible policy space. The framework also requires exogenous price dynamics and convexity/concavity assumptions; endogenous price impact with strategic feedback or nonconvex trading rules lies outside the theory actually proved.
