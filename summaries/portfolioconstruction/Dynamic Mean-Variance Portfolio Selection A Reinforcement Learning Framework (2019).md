# Dynamic Mean-Variance Portfolio Selection A Reinforcement Learning Framework

**Source:** [DynamicPortfolio_WangYu_2019.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/DynamicPortfolio_WangYu_2019.pdf>)  
**Source coverage:** Analytic control formulation and Theorems 1–6, EMV algorithm, stationary simulation table, and discussion of nonstationary and annealed exploration experiments.

## 1. Metadata

- **Title:** Continuous-Time Mean–Variance Portfolio Selection: A Reinforcement Learning Framework
- **Author(s):** Haoran Wang and Xun Yu Zhou
- **Year:** 2019
- **Journal/Venue:** Working paper / SSRN preprint

## 2. Problem statement

The paper asks how to formulate and solve **continuous-time mean-variance portfolio choice as a reinforcement-learning problem with explicit exploration**. In the classical continuous-time Markowitz problem, the control is deterministic conditional on the state. Here the question is: if the agent randomizes actions to explore, what is the optimal exploratory policy, how does it relate to the classical mean-variance solution, and can one derive a policy-improvement theorem suitable for learning?

## 3. Approach (short)

The method is entropy-regularized relaxed stochastic control. Instead of choosing a point control $u_t$, the agent chooses a control distribution $\pi_t(\cdot)$. The objective adds an entropy reward for exploration. The resulting HJB equation can be solved explicitly because the problem is linear-quadratic. The optimizer over distributions is Gaussian, yielding an explicit exploratory policy with time-decaying variance. The paper then proves equivalence with the classical mean-variance problem as the exploration parameter vanishes, derives the cost of exploration, and establishes a policy-improvement theorem.

## 4. Approach (detailed)

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
   +
   \lambda \int \pi(u)\ln\pi(u)\,du.
   $$
   Minimizing this functional over all densities is a calculus-of-variations problem. Because the objective is quadratic in $u$ and entropy regularization is the convex conjugate of the log-normalizer, the optimizer is Gaussian.

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

   Theorem 4 computes the additional expected terminal quadratic loss from exploration after excluding the entropy reward. The cost depends only on the exploration weight $\lambda$ and the horizon $T$, and is increasing in both. The economic point is clean: exploration is not free, but in this LQ problem its cost can be priced exactly.

9. **Policy-improvement theorem**

   Theorem 5 is the dynamic-programming core for learning. Starting from any admissible feedback density $\pi$, define its value function $V^\pi$. The improved policy is obtained by minimizing the local entropy-regularized Hamiltonian constructed from $V^\pi$. The theorem shows the new policy weakly improves the value:
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

The Gaussian policy follows from pointwise **minimization** of the Hamiltonian. With
$$q(u)=\rho\sigma V_xu+\tfrac12\sigma^2V_{xx}u^2,$$
the problem is
$$\inf_\pi\int[q(u)+\lambda\log\pi(u)]\pi(u)\,du.$$
The variational first-order condition gives $\log\pi^*(u)=-q(u)/\lambda+c$. The density is normalizable when $V_{xx}>0$, as holds for the quadratic cost value function. Its mean is $-\rho V_x/(\sigma V_{xx})$ and its variance is $\lambda/(\sigma^2V_{xx})$.

The paper’s equivalence theorem is also stronger than small-$\lambda$ convergence. The mean of $\pi^\ast$ is exactly the classical optimal control for every $\lambda>0$; only the variance changes. In this LQ environment, exploration widens the control around the same classical center instead of shifting that center.

## 5. Domain of applicability

- The theory applies to **continuous-time mean-variance portfolio choice in a single-risky-asset diffusion setting with linear state dynamics before feedback and a quadratic cost**.
- The exact Gaussian form relies on the problem being essentially **linear-quadratic**.
- The “same mean as the classical control, extra variance for exploration” result is therefore much more special than a generic RL insight.
- The paper does not prove comparable explicit results for:
  - multi-asset portfolios with full covariance matrices,
  - portfolio constraints,
  - transaction costs,
  - nonquadratic utilities.
- Its strongest contribution is conceptual and mathematical: it shows that, in this benchmark MV problem, **optimal exploration is Gaussian, time-decaying, and analytically connected to the classical solution**.


## 6. Source identity and a consistent control convention

The local PDF is **Continuous-Time Mean–Variance Portfolio Selection: A Reinforcement Learning Framework**, by **Haoran Wang and Xun Yu Zhou**, first drafted in February 2019 and revised in May 2019. Thaleia Zariphopoulou is not an author of this paper; she is associated with related exploratory-control work cited by the authors. The existing summary filename is retained, but the source title and authors above are authoritative.

The problem is a **minimization of a quadratic terminal cost**. Consequently the value function is convex in wealth, $V_{xx}>0$, and the entropy term enters as $+\lambda\int\pi\log\pi$, equivalently minus entropy. Mixing this with a concave utility maximization convention reverses both signs and produces the wrong Gaussian-normalizability condition.

Wealth and the risky dollar allocation are expressed in discounted units so that the risk-free drift is removed. The control $u$ is an amount invested in the risky asset, not necessarily a fraction constrained between zero and one. Borrowing and short sales are unrestricted. The coefficients are constant in the analytic benchmark, with volatility $\sigma>0$ and Sharpe ratio $\rho$.

The target-mean formulation is a precommitment mean–variance problem. Introducing the multiplier $w$ turns it into a family of time-consistent quadratic terminal-cost control problems. This does not turn the original variance criterion into an ordinary additive Bellman reward or prove that the solution is a time-consistent equilibrium strategy under repeated resetting of the target.

## 7. Why relaxed control changes the diffusion

An exploratory action is a probability density $\pi(u)$ at each state and time. In the relaxed-control formulation, the drift averages linearly over actions, while the instantaneous variance averages the **squared** action:

$$b^\pi=\rho\sigma E_\pi[u],\qquad
(a^\pi)^2=\sigma^2E_\pi[u^2].$$

Replacing the diffusion with $\sigma E_\pi[u]$ would omit the contribution of exploration variance. Since $E_\pi[u^2]=(E_\pi[u])^2+\operatorname{Var}_\pi(u)$, the exploratory process has additional quadratic variation even though its drift matches that of the mean action.

The density optimization in the HJB can be solved by completing the square. For $V_{xx}>0$,

$$q(u)=\frac{\sigma^2V_{xx}}2
\left(u+\frac{\rho V_x}{\sigma V_{xx}}\right)^2
-\frac{\rho^2V_x^2}{2V_{xx}}.$$

The minimizing density is proportional to $e^{-q(u)/\lambda}$. Its variance is $\lambda/(\sigma^2V_{xx})$, so greater curvature of the value function reduces the optimal exploratory spread. This is a derivation of a Gaussian policy within this model, not an assumption that returns or terminal wealth remain Gaussian under the optimal feedback.

Differential entropy depends on the scale used for the action variable. A numerical exploration parameter is meaningful only together with the action's units and normalization. Rescaling wealth or dollars without correspondingly rescaling the objective changes the interpretation of $\lambda$.

## 8. Explicit value, mean constraint, and exploration cost

Write $\tau=T-t$. A compact equivalent form of the source's value function is

$$V(t,x;w)=(x-w)^2e^{-\rho^2\tau}
-\frac{\lambda\rho^2}{4}\tau^2
-\frac{\lambda}{2}\log\left(\frac{\pi\lambda}{\sigma^2}\right)\tau
-(w-z)^2.$$

The quadratic coefficient implies

$$V_x=2(x-w)e^{-\rho^2\tau},\qquad
V_{xx}=2e^{-\rho^2\tau},$$

which immediately gives the mean and variance displayed earlier. At maturity the entropy terms vanish and the required terminal condition is recovered.

Exploration variance decreases over calendar time when $\rho\ne0$, but it does **not** go to zero as $t\uparrow T$ at fixed $\lambda$: its limit is $\lambda/(2\sigma^2)$. The remaining interval over which an action can affect wealth goes to zero. Concentration to a deterministic policy requires $\lambda\downarrow0$, not merely approaching the horizon. When $\rho=0$, the variance is constant over time and the drift cannot generate a target mean different from initial discounted wealth. The multiplier formula with denominator $e^{\rho^2T}-1$ must therefore be treated separately in that degenerate case.

The mean wealth equation is unchanged by exploration, explaining why the same multiplier enforces the same target. Nevertheless, equality of policy means does not mean equality of wealth distributions. The exploratory diffusion is larger and generates an additional terminal quadratic loss.

Theorem 4 measures the loss **after removing the entropy reward from the exploratory value**. The result is exactly

$$C_{u^*,\pi^*}(0,x_0;w)=\frac{\lambda T}{2}.$$

This is not simply $V-V^{cl}$, which also contains entropy terms. A useful derivation considers $Y=X-w$. Under the exploratory optimal policy,

$$\frac{d}{dt}E[Y_t^2]
=-\rho^2E[Y_t^2]+\frac{\lambda}{2}e^{\rho^2(T-t)}.$$

Multiplying by $e^{\rho^2t}$ and integrating shows that the additional second moment at $T$ is $\lambda T/2$. Since both policies satisfy the same mean target, this also gives the extra terminal variance in this benchmark. It is independent of market coefficients because the optimal exploration variance compensates for their effects; that cancellation need not survive constraints or nonlinear costs.

## 9. Policy improvement is exact only with exact evaluation

Given an admissible policy with a sufficiently regular value function and positive wealth curvature, the improved policy is

$$\tilde\pi=\mathcal N\left(-\frac{\rho V_x^\pi}{\sigma V_{xx}^\pi},
\frac{\lambda}{\sigma^2V_{xx}^\pi}\right).$$

The verification argument compares Hamiltonians and applies Itô's formula along the improved process. The resulting inequality is $V^{\tilde\pi}\le V^\pi$, consistent with minimization. Regularity, integrability, and admissibility are necessary; “any policy” does not mean an arbitrary density with nonexistent moments or entropy.

For the particular initial Gaussian family in Theorem 6, exact policy iteration is especially strong: the first improvement obtains the correct feedback mean, and after reevaluation the second improvement obtains the exact optimal variance. The theorem's asymptotic convergence statement is proved through this finite two-step property. This does not imply that a noisy data-driven implementation converges in two training updates.

The proposed EMV algorithm uses a low-dimensional value approximation,

$$V_\theta(t,x)=(x-w)^2e^{-\theta_3(T-t)}
+\theta_2t^2+\theta_1t+\theta_0,$$

and a Gaussian policy whose entropy is affine in remaining time. Terminal conditions and relationships between value curvature and policy variance constrain the parameters. Training uses simulated trajectories and stochastic-gradient updates based on a discretized temporal-difference objective. The policy parametrization in the displayed algorithm assumes a sign for the market Sharpe ratio; the paper notes that the negative case can be handled similarly. “Model-free” in this context does not mean free of structural assumptions: the parametric forms encode the solved LQ problem.

The multiplier is also learned, using a feedback update of the form

$$w_{n+1}=w_n-\alpha_n(\overline X_T-z).$$

Batching recent terminal wealth observations reduces noise. For a positive Sharpe ratio, a terminal mean above target reduces the multiplier and subsequently reduces the mean risky allocation. Estimation noise, learning rates, and finite episodes affect this mechanism.

## 10. Evidence and limits of the learning claim

The numerical comparison uses simulated markets and contrasts EMV with rolling maximum-likelihood plug-in control and a deep deterministic policy-gradient implementation. The stationary experiments use a one-year horizon, daily time steps, initial wealth one, and target terminal wealth 1.4. Drift and volatility vary over a grid of market scenarios. The report also considers time-varying market parameters and an exploration parameter annealed across training episodes.

EMV is much faster than the neural comparator in the reported setup and often obtains substantially better performance. The tables nevertheless contain scenarios where DDPG has a higher reported Sharpe ratio. Some policies also miss the target terminal mean materially. A Sharpe comparison therefore should not be treated as proof of lower variance at the same achieved mean in every row. The results support the efficiency of a problem-specific low-dimensional parametrization in the tested simulations, not universal dominance over all RL or adaptive-control methods.

The maximum-likelihood comparator illustrates the difficulty of estimating drift accurately even when volatility is relatively well estimated. That is economically relevant, but the exact policy-improvement theorem concerns the known-coefficient control problem; it is not itself a consistency theorem for every estimator used in the simulation algorithm.

No transaction costs, leverage limits, no-bankruptcy constraint, or stock-borrow restrictions enter the analytic benchmark. Gaussian action densities have unbounded support. Imposing bounded actions would generally replace the unrestricted Gaussian by a constrained density and invalidate the simple equivalence and exploration-cost formulas. The contribution is an explicit, interpretable benchmark linking exploratory control to classical mean–variance allocation, with a proposed learning procedure and simulation evidence whose scope is narrower than the exact control results.
