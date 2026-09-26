# Portfolio Choice and the Bayesian Kelly Criterion

**Authors:** Sid Browne, Ward Whitt **Year:** 1996 **Journal/Venue:** *Advances in Applied Probability*, **28**, 1145--1176

## Problem statement

Derive optimal gambling and investment policies under logarithmic utility when the parameters of the underlying stochastic process are unobserved random variables. In the discrete-time setting, the increments are a simple random walk in a random environment (RWIRE): the success probability $\theta$ is itself random with prior density $f_\theta$. In the continuous-time setting, the return process is a Brownian motion with known diffusion coefficient $\sigma$ but unknown random drift $Z$. The goal is to maximize $E[\ln V_T]$, where $V_T$ is terminal wealth, and to quantify the financial value of randomness, the gain from perfect information, and the cost of Bayesian learning.

## Approach (short)

The paper solves the Bayesian Kelly problem in discrete time via dynamic programming and the certainty-equivalence principle, then obtains the continuous-time solution as a diffusion limit of the discrete-time results. The RWIRE with beta prior converges weakly to a Brownian motion with normally distributed random drift, preserving the structure of the optimal control. A martingale verification argument confirms optimality in continuous time. Explicit formulas for the financial value of information and the cost of learning are derived.

## Approach (detailed)

### 1. Non-Bayesian baseline (known parameters)

For a simple random walk with step $\pm\Delta$ and known success probability $\theta$, the Kelly criterion gives the optimal constant fraction:

$$f^* = \frac{2\theta - 1}{\Delta},$$

with optimal growth rate $\Lambda(\theta) = \ln 2 + \theta \ln \theta + (1-\theta)\ln(1-\theta)$ (entropy complement). The optimal value function over $N$ periods is $F_N(x) = \ln x + N\Lambda(\theta)$.

In continuous time, wealth follows $dV_t = f_t V_t(\mu\,dt + \sigma\,dW_t)$ and the optimal control is $f^* = \mu/\sigma^2$ for all $t$, yielding $F_T(x) = \ln x + T\mu^2/(2\sigma^2)$.

The financial value of randomness is always non-negative: a gambler who is told the drift realization after randomization but before play achieves expected gain $F_T^P(x) - F_T(x) = cT/(2\sigma^2)$ over the constant-parameter gambler, where $c = \operatorname{Var}(Z)$. Jensen's inequality on the convex function $\Lambda(\cdot)$ ensures $E[\Lambda(\Theta)] \geq \Lambda(E[\Theta])$, so one should always prefer randomness.

### 2. Bayesian discrete-time problem (Section 3)

**Setup.** The RWIRE has $P(Z_i = 1 \mid \theta) = \theta$, $P(Z_i = -1 \mid \theta) = 1 - \theta$, with prior density $f_\theta$ on $(0,1)$. Let $S_n = \sum_{i=1}^n Z_i$ and $Y_n = (S_n + n)/2$ (number of successes). The posterior distribution of $\theta$ given $Y_n$ is obtained by Bayes' rule:

$$dP(\theta \leq u \mid Y_n = y) = \frac{\binom{n}{y} u^y(1-u)^{n-y} f_\theta(u)\,du}{\int_0^1 \binom{n}{y} u^y(1-u)^{n-y} f_\theta(u)\,du}.$$

**Beta conjugate prior.** When $\theta \sim \operatorname{Be}(\alpha, \beta)$, the posterior is $\theta \mid Y_n \sim \operatorname{Be}(Y_n + \alpha,\; n - Y_n + \beta)$ with posterior mean:

$$E(\theta \mid Y_n) = \frac{Y_n + \alpha}{n + \alpha + \beta}.$$

The random walk $\{S_n\}$ becomes Markov with state-dependent transition probability $P(S_{n+1} = S_n + 1 \mid S_n) = (S_n + n + 2\alpha)/(2(n + \alpha + \beta))$.

**Optimal policy (Theorem 1).** The optimal strategy decomposes period-by-period. At each step, the optimal policy is the *certainty equivalent* of the deterministic counterpart: replace $\theta$ by the current posterior mean $E(\theta \mid S_i, i)$. The optimal fraction to bet on step $k+j+1$, having observed $k$ steps with current state $S_k$ and $m$ steps remaining, is:

$$f_{i+1}^*(S_i, i) = \frac{1}{\Delta}\left[\frac{S_i + \alpha - \beta}{i + \alpha + \beta}\right].$$

The expected log-terminal-wealth satisfies $F_m(x, S_k, k) = \ln x + C_m(S_k, k)$, where $C_j(i, l)$ solves the difference equation:

$$C_j(i, l) = \Lambda(i, l) + E(\theta \mid i, l)\,C_{j-1}(i+1, l+1) + (1 - E(\theta \mid i, l))\,C_{j-1}(i-1, l+1),$$

with $C_0 = 0$ and $\Lambda(S_i, i) = \ln 2 + E(\theta \mid S_i, i)\ln E(\theta \mid S_i, i) + (1 - E(\theta \mid S_i, i))\ln(1 - E(\theta \mid S_i, i))$.

This policy also asymptotically maximizes the growth rate (by the Algoet--Cover (1988) infinite-horizon result).

**Adaptive portfolios.** When the investor splits between the RWIRE and a riskless bond with return $r$ per period, the optimal invested fraction is likewise the certainty equivalent:

$$f^*(S_i, i) = \frac{(1+r)(\Delta(2E(\theta \mid S_i, i) - 1) - r)}{\Delta^2 - r^2}.$$

### 3. Diffusion limits for RWIREs (Section 4)

**Theorem 2.** Let $\theta_n \sim \operatorname{Be}(\alpha_n, \beta_n)$ with $\alpha_n, \beta_n$ chosen so the prior mean is $\tfrac{1}{2} + \mu/(2\sigma\sqrt{n})$ and the prior variance is $c/(4\sigma^2 n)$, where $c > 0$. Then:

$$\frac{\sigma S^n_{[nt]}}{\sqrt{n}} \Rightarrow X_t := (\sigma^2 + ct)W_{t/(\sigma^2 + ct)} + \mu t,$$

where $W$ is a standard Brownian motion. Equivalently, $X_t \stackrel{d}{=} \sigma W_t + tZ$ with $Z \sim N(\mu, c)$ independent of $W$. This is exact, not approximate.

**Proof structure.** Uses the Kiefer process (tied-down Brownian sheet) $B(t,x) = W(t,x) - xW(t,1)$ and a functional CLT for exchangeable random variables. The beta--binomial converges to a normal--normal conjugate pair. The key steps are:
  - Theorem 3 (Kiefer): the empirical process of i.i.d. uniforms converges weakly to $B(t,x)$.
  - Theorem 4: a general perturbation lemma for random-probability random walks.
  - Theorem 5: combines these to show the RWIRE converges to $2B(t,x) + 2tL$, where $\sqrt{n}(X_n - x) \Rightarrow L$.
  - Corollary 2 specializes to the beta case, yielding $L \sim N(\mu/(2\sigma), c/(4\sigma^2))$.

**Proposition 1 (time-change representation).** The diffusion $X_t$ with random drift satisfies:

$$X_t \stackrel{d}{=} (\sigma^2 + ct)\hat{W}_{t/(\sigma^2 + ct)} + \mu t,$$

where $\hat{W}$ is a standard Brownian motion. This is a deterministically time-changed Brownian motion, proved constructively by matching drift and diffusion coefficients of the SDE $dX_t = \frac{cX_t + \sigma^2\mu}{\sigma^2 + ct}\,dt + \sigma\,d\hat{W}_t$.

### 4. Continuous-time Bayesian control (Section 5)

**Filtering.** The return process follows $dX_t = Z\,dt + \sigma\,dW_t$ with $Z \sim N(\mu, c)$ unobserved. The posterior $Z \mid \mathscr{F}_t^X \sim N\!\left(\frac{cX_t + \sigma^2\mu}{\sigma^2 + ct},\; \frac{\sigma^2 c}{\sigma^2 + ct}\right)$ (Gaussian filtering / Kalman--Bucy).

**Theorem 6.** The optimal control for $\max E[\ln V_T]$ subject to $dV_t = f_t V_t\,dX_t$ is:

$$f_t^* = \frac{1}{\sigma^2}\!\left(\frac{cX_t + \mu\sigma^2}{\sigma^2 + ct} - \gamma\right),$$

i.e. the posterior mean of $(Z - \gamma)$ divided by $\sigma^2$. This is exactly the certainty equivalent of the non-Bayesian control $f^* = \mu/\sigma^2$.

**Proof (Theorem 7, martingale verification).** For arbitrary prior on $Z$ (not necessarily normal), the optimal control is $f_t^* = [E(Z \mid \mathscr{F}_t^X) - \gamma]/\sigma^2$ (equation (64)). Apply Ito's rule to $\ln V_t$ under control $f_t$:

$$E[\ln V_T \mid \mathscr{F}_T^X] = X_0 + \int_0^T \left[(1-f_t)\gamma + f_t E(Z \mid \mathscr{F}_t^X) - \tfrac{1}{2}f_t^2\sigma^2\right]dt.$$

The integrand does not depend on $V_t$, so pointwise maximization over $f_t$ suffices, yielding (64). This holds for *any* prior distribution on $Z$.

### 5. Financial value of information and cost of learning (Section 5.2)

Under the optimal Bayesian policy, by Ito's formula:

$$\ln V_T^* = \ln x + \frac{1}{2\sigma^2}\int_0^T \!\left(\frac{cX_t + \mu\sigma^2}{\sigma^2 + ct}\right)^2 dt + \frac{1}{\sigma}\int_0^T \!\frac{cX_t + \mu\sigma^2}{\sigma^2 + ct}\,d\hat{W}_t.$$

Taking expectations yields the Bayesian optimal value function:

$$F_T^B(x) = \ln x + \frac{\mu^2}{2\sigma^2}T + \frac{c}{2\sigma^2}T + \frac{1}{2}\ln\!\left(\frac{\sigma^2}{\sigma^2 + cT}\right).$$

Three benchmark comparisons (all exact):

| Quantity | Formula |
|---|---|
| Gain of perfect info over constant gambler | $F_T^P(x) - F_T(x) = \frac{cT}{2\sigma^2}$ |
| Gain of Bayesian over constant gambler | $F_T^B(x) - F_T(x) = \frac{c}{2\sigma^2}T + \frac{1}{2}\ln\!\left(\frac{\sigma^2}{\sigma^2 + cT}\right)$ |
| Cost of learning (perfect info minus Bayesian) | $F_T^P(x) - F_T^B(x) = \frac{1}{2}\ln\!\left(1 + \frac{c}{\sigma^2}T\right)$ |

The ordering $F_T(x) \leq F_T^B(x) \leq F_T^P(x)$ holds for all $T > 0$. The cost of learning grows only logarithmically in $T$, while the gain from randomness is linear -- so the Bayesian gambler captures nearly all the value of randomness.

The marginal benefit of horizon extension: $\partial(F_T^B - F_T)/\partial T = c^2/(2\sigma^2(\sigma^2 + cT)) \to c/(2\sigma^2)$ as $T \to \infty$, matching the perfect-information rate.

### 6. Power utility (Section 6)

For $E[V_T^\eta]$ with $0 < \eta < 1$, let $\varepsilon = 1/(1-\eta)$. In the non-Bayesian discrete case with known $\theta$, the optimal constant fraction is:

$$f^* = \frac{1}{\Delta}\!\left[\frac{\theta^{\varepsilon} - (1-\theta)^{\varepsilon}}{\theta^{\varepsilon} + (1-\theta)^{\varepsilon}}\right],$$

and the optimal value function is separable: $F_N(x) = x^\eta [C(\theta,\eta)]^N$ where $C(\theta,\eta) = 2^\eta(\theta^{1/(1-\eta)} + (1-\theta)^{1/(1-\eta)})^{1-\eta}$.

The continuous-time limit gives $f^* \to \mu/(\sigma^2(1-\eta))$, recovering Merton's HARA result.

**Bayesian case: certainty equivalence fails.** For power utility, the Bayesian optimal control is *not* the certainty equivalent of the deterministic control. Already at a two-step horizon, the Bellman equation for the one-step optimizer is:

$$f^*(S_k, k) = \frac{1}{\Delta}\!\left[\frac{[E(\theta \mid S_k, k)]^{1/(1-\eta)} - [1-E(\theta \mid S_k, k)]^{1/(1-\eta)}}{[E(\theta \mid S_k, k)]^{1/(1-\eta)} + [1-E(\theta \mid S_k, k)]^{1/(1-\eta)}}\right],$$

but for $j \geq 2$ steps remaining, the optimizer depends on nonlinear difference equations in the posterior moments, and the value function is no longer separable as $x^\eta \cdot \psi(S_k, k)$. The continuous-time limit of these controls has not been determined.

A sufficient condition for certainty equivalence to hold is that the value function be completely separable: $F_j(x, S_k, k) = F_{j-1}(x, S_k, k) + \psi(S_k, k)$. This holds for log utility but not for power or exponential utility.

## Domain of applicability

- **Log utility only for full results.** The certainty-equivalence principle and all closed-form value functions require logarithmic utility. Power and exponential utility break the separability needed for the certainty-equivalent policy.
- **Single risky asset.** The model treats one risky asset plus a riskless bond. Extension to multiple assets with correlated unknown drifts is not addressed.
- **Simple random walk / Brownian motion.** The discrete-time results apply to simple random walks (binary increments). The continuous-time results assume Brownian dynamics with known $\sigma$ and unknown constant drift. Time-varying or stochastic volatility is excluded.
- **Conjugate priors for tractability.** Explicit formulas require beta priors (discrete) or normal priors (continuous). The certainty-equivalence result (Theorem 7) holds for arbitrary priors, but the value function and cost-of-learning formulas require Gaussian structure.
- **Known diffusion coefficient.** The continuous-time model assumes $\sigma$ is known and constant. This is motivated by the fact that quadratic variation identifies $\sigma$ from a sample path, but not the drift.
- **Fixed random drift.** The drift $Z$ is drawn once and held fixed. The model does not cover regime-switching, mean-reverting, or time-varying drift parameters.
- **No transaction costs, borrowing constraints, or consumption.** The investor can go short and lever without bound ($-\infty < f < \infty$). Adding portfolio constraints or consumption would require different techniques.
