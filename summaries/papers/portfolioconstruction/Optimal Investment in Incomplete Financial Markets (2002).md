# 1. Metadata

- **Title:** Optimal Investment in Incomplete Financial Markets
- **Author(s):** Walter Schachermayer
- **Year:** 2002
- **Journal/Venue:** Survey/review article (chapter-length manuscript; no single journal venue identified from the file)

# 2. Problem statement

The paper studies expected-utility maximization for an investor trading in an arbitrage-free but generally incomplete market. In its most abstract form, the problem is
$$
u(x)=\sup_{X_T\in \mathcal C(x)} E[U(X_T)],
$$
where $\mathcal C(x)$ is the set of terminal wealths attainable from initial capital $x$, and $U$ is a strictly increasing, strictly concave utility function. The central mathematical question is: under what conditions do the primal optimizer $X_T^*(x)$ and the dual optimizer exist, how are they characterized, and how far can the finite-state convex-duality picture be extended to general semimartingale markets?

# 3. Approach (short)

The method is convex duality. Schachermayer starts in a finite probability space, where the primal problem reduces to finite-dimensional concave optimization and the dual problem minimizes the conjugate utility $V$ over equivalent martingale measures. He then lifts the argument to general semimartingale markets by replacing the set of densities of martingale measures with a suitably closed dual domain and identifying the exact regularity condition on $U$ needed for the duality theory to survive: reasonable asymptotic elasticity. The paper is partly expository and partly foundational; the key contributions are the clean finite-model proofs and the sharp role of asymptotic elasticity.

# 4. Approach (detailed)

1. **Primal problem and convex conjugate**

   Let $U$ satisfy the standard Inada-type conditions on its domain. Define the Legendre-Fenchel conjugate
   $$
   V(y)=\sup_{x>0}\{U(x)-xy\},\qquad y>0,
   $$
   and the inverse marginal utility
   $$
   I(y)=(U')^{-1}(y).
   $$
   The candidate primal and dual value functions are
   $$
   u(x)=\sup_{X_T\in\mathcal C(x)} E[U(X_T)],\qquad
   v(y)=\inf_{Y_T\in\mathcal D(y)} E[V(Y_T)].
   $$
   The goal is to prove conjugacy
   $$
   u(x)=\inf_{y>0}\{v(y)+xy\},\qquad
   v(y)=\sup_{x>0}\{u(x)-xy\},
   $$
   and to identify optimizers through
   $$
   X_T^*(x)=I(Y_T^*(y)),\qquad Y_T^*(y)=U'(X_T^*(x)),
   $$
   where $y=u'(x)$.

2. **Finite complete market: pointwise optimization**

   When $\Omega=\{\omega_1,\dots,\omega_N\}$ is finite and the market is complete, the equivalent martingale measure $Q$ is unique. Then the static budget set is
   $$
   \mathcal C(x)=\Bigl\{X_T\ge 0:\ E_Q[X_T]\le x\Bigr\}.
   $$
   The Lagrangian is
   $$
   \mathcal L(X_T,y)=E[U(X_T)]-y(E_Q[X_T]-x).
   $$
   Because the objective separates state by state, optimality is pointwise:
   $$
   X_T^*(\omega_n)=I\!\left(y\frac{dQ}{dP}(\omega_n)\right).
   $$
   Theorem 2.1 states existence, uniqueness, conjugacy, and the first-order characterization
   $$
   U'(X_T^*(x))=y\frac{dQ}{dP}.
   $$
   The proof is finite-dimensional and exact: strict concavity gives uniqueness, and the budget multiplier gives the dual relation.

3. **Finite incomplete market: minimize over martingale measures**

   In the incomplete case, a claim is attainable only if it respects pricing under all martingale measures. The dual becomes
   $$
   v(y)=\inf_{Q\in\mathcal M^e(S)} E\!\left[V\!\left(y\frac{dQ}{dP}\right)\right].
   $$
   Theorem 2.3 shows that there exists a unique optimal measure $Q^*(y)$ and optimal terminal wealth
   $$
   X_T^*(x)=I\!\left(y\frac{dQ^*(y)}{dP}\right).
   $$
   The proof is a saddle-point argument. One writes a Lagrangian over attainable claims and state-price densities, uses convexity of $V$, and exploits the separating-hyperplane geometry of the attainable set. The economic content is “marginal utility pricing”: the optimal state-price density is proportional to the investor’s marginal utility.

4. **Why the finite-dimensional argument breaks in general**

   In general semimartingale markets, neither $\mathcal C(x)$ nor the set of densities of equivalent martingale measures is compact in a convenient norm topology. The paper explains that one must enlarge the dual domain from densities of equivalent martingale measures to a closed, solid hull $\mathcal D$ in $L^0_+$ (or a related dual object), because minimizing sequences of densities may converge only after convexification/closure.

5. **Reasonable asymptotic elasticity**

   The sharp regularity condition is
   $$
   AE(U)=\limsup_{x\to\infty}\frac{xU'(x)}{U(x)}<1.
   $$
   Schachermayer gives both intuition and necessity:
   - if $AE(U)<1$, marginal utility decays fast enough relative to average utility, preventing the optimizer from chasing unbounded payoffs at vanishing dual cost;
   - if $AE(U)\ge 1$, duality can fail: the dual value function may lose finiteness/smoothness and primal existence can break.

   The paper does not merely state this; it discusses a counterexample showing that without reasonable asymptotic elasticity, the whole dual program can collapse. So the condition is not a technical convenience but the boundary of the theory.

6. **General semimartingale theorem**

   For $U:\mathbb R_+\to\mathbb R$ satisfying the Inada conditions and $AE(U)<1$, Theorem 3.4 gives the general result:
   $$
   u(x)=\sup_{X_T\in\mathcal C(x)}E[U(X_T)],\qquad
   v(y)=\inf_{Y_T\in\mathcal D(y)}E[V(Y_T)],
   $$
   with
   $$
   u(x)=\inf_{y>0}\{v(y)+xy\},\qquad
   v(y)=\sup_{x>0}\{u(x)-xy\},
   $$
   and unique optimizers satisfying
   $$
   X_T^*(x)=I(Y_T^*(y)),\qquad Y_T^*(y)=U'(X_T^*(x)).
   $$
   This is the exact infinite-dimensional analogue of the finite-state theorem, except the dual optimizer now lives in the enlarged domain $\mathcal D$, not necessarily as the density of an equivalent martingale measure.

7. **Proof structure for the semimartingale case**

   The proof strategy, as sketched in the paper, has four parts.

   1. Construct the primal attainable set $\mathcal C$ and dual domain $\mathcal D$ as polar objects under the bilinear form $E[X_TY_T]$.
   2. Use convex compactness in $L^0$: bounded closed convex sets admit almost-sure convergent sequences of convex combinations.
   3. Apply a minimax theorem in the appropriate topological vector-space pairing, but only after embedding the problem in a dual pair where the bipolar relations are valid.
   4. Use $AE(U)<1$ to get the uniform-integrability and growth control needed to pass from optimizing sequences to actual optimizers and to establish differentiability/conjugacy of $u$ and $v$.

   The paper is explicit that step 4 is exactly where unreasonable asymptotic elasticity ruins the argument.

8. **Economic interpretation**

   The dual variable is a stochastic discount factor chosen to be as favorable as possible relative to the conjugate loss $V$. In complete markets this is the unique martingale measure; in incomplete markets it is the “best” martingale measure for the investor’s utility, not a purely market-implied object. The primal optimizer equates marginal utility to the optimal deflator. This is the continuous-time generalization of Arrow-Debreu first-order conditions.

9. **What is proved, and what remains survey material**

   - The finite complete and incomplete market theorems are proved in detail.
   - The semimartingale theorem is stated and its proof strategy explained rather than fully reproduced line by line in the survey.
   - The paper also surveys extensions to intermediate consumption, random endowment, nonsmooth utility, and transaction costs, but those are not proved here.

# 5. Domain of applicability

- The strongest exact results cover arbitrage-free semimartingale markets with utility on $\mathbb R_+$ satisfying Inada conditions and $AE(U)<1$.
- The finite-state proofs support broader intuition than the general proof: once one leaves the finite setting, closure of the dual domain is essential and naive minimization over equivalent martingale measures may be false.
- The survey emphasizes existence/duality, not explicit policy formulas. It applies where one cares about characterization rather than closed forms.
- The proofs do **not** justify broad claims for arbitrary utility functions. If $AE(U)\ge 1$, the broader applicability often claimed in informal discussions is not supported.
- The paper’s most durable contribution is the exact boundary condition on utility growth, not a new optimization algorithm.
