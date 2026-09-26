# 1. Metadata

- **Title:** Dynamic Mean-Variance Portfolio Selection: A Reinforcement Learning Framework
- **Author(s):** Haoran Wang, Thaleia Zariphopoulou, Xun Yu Zhou
- **Year:** 2019
- **Journal/Venue:** Working paper / SSRN preprint

# 2. Problem statement

The paper asks how to formulate and solve **continuous-time mean-variance portfolio choice as a reinforcement-learning problem with explicit exploration**. In the classical continuous-time Markowitz problem, the control is deterministic conditional on the state. Here the question is: if the agent randomizes actions to explore, what is the optimal exploratory policy, how does it relate to the classical mean-variance solution, and can one derive a policy-improvement theorem suitable for learning?

# 3. Approach (short)

The method is entropy-regularized relaxed stochastic control. Instead of choosing a point control $u_t$, the agent chooses a control distribution $\pi_t(\cdot)$. The objective adds an entropy reward for exploration. The resulting HJB equation can be solved explicitly because the problem is linear-quadratic. The optimizer over distributions is Gaussian, yielding an explicit exploratory policy with time-decaying variance. The paper then proves equivalence with the classical mean-variance problem as the exploration parameter vanishes, derives the cost of exploration, and establishes a policy-improvement theorem.

# 4. Approach (detailed)

1. **Classical mean-variance benchmark**

   In the classical single-risky-asset setting, wealth under a control $u_t$ evolves as
   $$
   dX_t = \rho \sigma u_t\,dt + \sigma u_t\,dW_t,
   $$
   where $\rho$ is the Sharpe ratio and $\sigma$ the asset volatility. The dynamic mean-variance problem is handled through a Lagrange multiplier $w$, reducing the terminal criterion to
   $$
   \inf_u E\big[(X_T-w)^2\big]-(w-z)^2.
   $$
   The corresponding HJB equation yields the classical optimal feedback
   $$
   u^\ast(t,x;w)=-\frac{\rho}{\sigma}(x-w),
   $$
   and value function
   $$
   V^{cl}(t,x;w)=(x-w)^2e^{-\rho^2(T-t)}-(w-z)^2.
   $$

2. **Exploratory/entropy-regularized formulation**

   The paper replaces the point control by a density $\pi_t(u)$. The controlled wealth dynamics use the first and second moments of the randomized action:
   $$
   dX_t^\pi
   =
   \rho \sigma \Big(\int u\,\pi_t(u)\,du\Big)\,dt
   +
   \sigma \Big(\int u^2\,\pi_t(u)\,du\Big)^{1/2} dW_t .
   $$
   The exploratory objective for fixed $w$ is
   $$
   \inf_\pi
   E\!\left[(X_T^\pi-w)^2\right]
   - (w-z)^2
   -\lambda E\!\left[\int_0^T \mathcal H(\pi_t)\,dt\right],
   $$
   where $\mathcal H(\pi_t)=-\int \pi_t(u)\ln \pi_t(u)\,du$ is Shannon entropy and $\lambda>0$ controls exploration.

   Exploration is therefore rewarded directly in the objective.

3. **HJB and Gaussian optimizer**

   The HJB equation optimizes over densities $\pi$. At each $(t,x)$, the Hamiltonian contains
   $$
   \rho \sigma V_x \int u\,\pi(u)\,du
   +
   \frac12 \sigma^2 V_{xx} \int u^2\,\pi(u)\,du
   -
   \lambda \int \pi(u)\ln\pi(u)\,du.
   $$
   Maximizing this functional over all densities is a calculus-of-variations problem. Because the objective is quadratic in $u$ and entropy regularization is the convex conjugate of the log-normalizer, the optimizer is Gaussian.

   The optimal feedback density is
   $$
   \pi^\ast(u;t,x,w)
   =
   N\!\left(
   u\;\middle|\;
   -\frac{\rho}{\sigma}(x-w),
   \frac{\lambda}{2\sigma^2}e^{\rho^2(T-t)}
   \right).
   $$
   This is Theorem 1’s core result. The mean equals the classical control $u^\ast$; exploration enters through the variance only.

4. **Value function and optimal wealth dynamics**

   Theorem 1 gives the explicit value function
   $$
   V(t,x;w)
   =
   (x-w)^2 e^{-\rho^2(T-t)}
   + \text{explicit entropy term depending on }\lambda,\rho,\sigma,T,t
   -(w-z)^2.
   $$
   The exact entropy term is closed form and quadratic/logarithmic in $(T-t)$. The associated optimal wealth SDE is
   $$
   dX_t^\ast
   =
   -\rho^2(X_t^\ast-w)\,dt
   +
   \sqrt{\rho^2(X_t^\ast-w)^2+\frac{\lambda}{2}e^{\rho^2(T-t)}}\,dW_t.
   $$
   The diffusion coefficient is larger than in the classical problem because exploration injects controlled randomness.

5. **Lagrange multiplier**

   The multiplier $w$ is pinned down by the target mean constraint $E[X_T^\ast]=z$. Since the drift of $X_t^\ast$ is the same as in the classical problem, the mean satisfies
   $$
   \frac{d}{dt}E[X_t^\ast]
   =
   -\rho^2(E[X_t^\ast]-w),
   \qquad
   E[X_0^\ast]=x_0.
   $$
   Solving gives
   $$
   E[X_t^\ast]=(x_0-w)e^{-\rho^2 t}+w.
   $$
   Imposing $E[X_T^\ast]=z$ yields
   $$
   w=\frac{ze^{\rho^2 T}-x_0}{e^{\rho^2 T}-1}.
   $$
   This is exact and, importantly, identical to the classical multiplier.

6. **Equivalence to the classical MV problem**

   Theorem 2 proves an equivalence between the exploratory and classical problems:

   - same Lagrange multiplier $w$;
   - same mean control $u^\ast(t,x;w)$;
   - exploratory policy equals a Gaussian centered at the classical control.

   This is stronger than mere convergence. The exploratory solution is not an unrelated control rule; it is the classical rule plus optimally chosen Gaussian exploration.

7. **Vanishing-exploration limit**

   Theorem 3 states
   $$
   \pi^\ast(\cdot;t,x,w)\Rightarrow \delta_{u^\ast(t,x;w)}
   \quad\text{as }\lambda\to 0,
   $$
   and
   $$
   V(t,x;w)\to V^{cl}(t,x;w).
   $$
   Since the variance of $\pi^\ast$ is
   $$
   \operatorname{Var}_{\pi^\ast}(u)
   =
   \frac{\lambda}{2\sigma^2}e^{\rho^2(T-t)},
   $$
   the result is immediate: the Gaussian collapses to a point mass. The paper also emphasizes a second decay: even for fixed $\lambda$, the exploration variance declines as $t\to T$. Hence exploration is endogenously annealed over the investment horizon.

8. **Exploration cost**

   Theorem 4 computes the exact value loss from imposing exploration. The cost depends only on the exploration weight $\lambda$ and the horizon $T$, and is increasing in both. The economic point is clean: exploration is not free, but in this LQ problem its cost can be priced exactly.

9. **Policy-improvement theorem**

   Theorem 5 is the dynamic-programming core for learning. Starting from any admissible feedback density $\pi$, define its value function $V^\pi$. The improved policy is obtained by maximizing the local entropy-regularized Hamiltonian constructed from $V^\pi$. The theorem shows the new policy weakly improves the value:
   $$
   V^{\tilde\pi}(t,x;w)\le V^\pi(t,x;w)
   $$
   in the minimization convention used by the paper.

   Theorem 6 specializes this to a parametric Gaussian family
   $$
   \pi^0(u;t,x,w)=N\!\big(u\mid a(x-w), c_1 e^{c_2(T-t)}\big),
   $$
   and proves convergence of policy-improvement iterates to the optimal Gaussian policy. This provides the justification for the paper’s RL algorithm.

10. **Proof logic**

   The proofs are exact LQ-control arguments with entropy regularization:

   - guess a quadratic value function;
   - optimize the HJB over distributions, obtaining a Gaussian by convex duality;
   - verify admissibility and derive the closed-form coefficients;
   - compare the exploratory and classical HJB systems to prove equivalence;
   - use weak convergence of Gaussians to Dirac masses for the $\lambda\to0$ limit;
   - prove policy improvement by the standard verification inequality adapted to relaxed/entropy-regularized controls.

**Additional mathematical details**

The Gaussian policy is obtained directly from the pointwise maximization in the HJB. If
$$
q(u)=\rho \sigma V_x\,u+\frac12 \sigma^2 V_{xx}\,u^2,
$$
the optimizer over densities solves
$$
\sup_{\pi}\int \big(q(u)-\lambda\log \pi(u)\big)\pi(u)\,du.
$$
The Euler-Lagrange condition gives
$$
\log \pi^\ast(u)=\frac{q(u)}{\lambda}+c,
$$
so whenever $V_{xx}<0$ the density is Gaussian, with mean and variance read off from the linear and quadratic coefficients of $q(u)$. This is the exact reason the exploratory policy is Gaussian rather than a modeling guess.

The paper’s equivalence theorem is also stronger than small-$\lambda$ convergence. The mean of $\pi^\ast$ is exactly the classical optimal control for every $\lambda>0$; only the variance changes. In this LQ environment, exploration widens the control around the same classical center instead of shifting that center.

# 5. Domain of applicability

- The theory applies to **continuous-time mean-variance portfolio choice in a linear-Gaussian single-asset setting**.
- The exact Gaussian form relies on the problem being essentially **linear-quadratic**.
- The “same mean as the classical control, extra variance for exploration” result is therefore much more special than a generic RL insight.
- The paper does not prove comparable explicit results for:
  - multi-asset portfolios with full covariance matrices,
  - portfolio constraints,
  - transaction costs,
  - nonquadratic utilities.
- Its strongest contribution is conceptual and mathematical: it shows that, in this benchmark MV problem, **optimal exploration is Gaussian, time-decaying, and analytically connected to the classical solution**.
