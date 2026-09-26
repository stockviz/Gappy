# The Kelly Criterion and the Stock Market

**Authors:** Louis M. Rotando, Edward O. Thorp  
**Year:** 1992  
**Journal/Venue:** *The American Mathematical Monthly*, Vol. 99, No. 10, pp. 922--931

## Problem statement

Determine the optimal fraction $f$ of current capital to wager (or invest) at each stage of a sequential favorable gamble so as to maximize the long-run exponential growth rate, while avoiding ruin. The paper treats discrete binomial games, continuous-distribution games, and applies the framework to long-term investment in S&P 500 stocks versus T-bills.

## Approach (short)

Exposition of Kelly's criterion -- maximize $E[\log X_n]$ -- from first principles in the binomial case, extension to continuous return distributions via Theorem 2, and a numerical application to U.S. equity excess returns modeled with a truncated normal distribution. The optimal Kelly fraction $f^*$ and the critical "ruin fraction" $f_c$ are computed for historically calibrated parameters.

## Approach (detailed)

### 1. Binomial (discrete) case

A gambler with capital $X_0$ bets fraction $f \in [0,1]$ of current wealth on each of $n$ independent Bernoulli trials with win probability $p > 1/2$, loss probability $q = 1 - p$. After $n$ trials with $S$ successes and $F = n - S$ failures:

$$X_n = X_0 (1+f)^S (1-f)^F.$$

Since $\Pr(X_n = 0) = 0$ for $f \in (0,1)$, technical ruin cannot occur. The expected growth rate coefficient is

$$G(f) = E\!\left[\log\!\left(\frac{X_n}{X_0}\right)^{1/n}\right] = p\log(1+f) + q\log(1-f).$$

Maximizing: $G'(f) = p/(1+f) - q/(1-f) = 0$ yields the **Kelly fraction**

$$f^* = p - q.$$

Second-order condition: $G''(f) = -(f^2 + 2f(p-q) - 1)/((1-f^2)^2) < 0$ on $[0,1)$, so $f^*$ is the unique global maximum.

Properties of $G(f)$ (from Figure 1 and the shape of $G'$): $G(0) = 0$, $G(f^*) = p\log p + q\log q + \log 2 > 0$, and there exists a unique $f_c \in (f^*,1)$ with $G(f_c) = 0$.

### 2. Theorem 1 (key optimality results, binomial case)

Six parts (proofs for (i)--(iii), (vi) in [4]; (iv)--(v) in [6]):

1. $G(f) > 0 \implies X_n \to \infty$ a.s.; $\Pr[\liminf X_n > M] = 1$ for every finite $M$.
2. $G(f) < 0 \implies X_n \to 0$ a.s.
3. $G(f) = 0 \implies \limsup X_n = \infty$ and $\liminf X_n = 0$ a.s. (boundary case: chaotic oscillation).
4. **Dominance:** For the Kelly strategy $\Phi^*$ and any "essentially different" strategy $\Phi$, $\lim_{n\to\infty} X_n(\Phi^*)/X_n(\Phi) = \infty$ a.s.
5. Expected time to reach any fixed goal $\bar{X}$ is asymptotically minimized by maximizing $E\log X_n$.
6. **Non-stationary extension:** If $p_i$ varies across trials, $E\log X_n$ is maximized by choosing $f_i^* = p_i - q_i$ on each trial.

### 3. Uneven-payoff binomial extension

If the gambler wins $b$ units per unit wagered (with probability $p$, $pb - q > 0$):

$$G(f) = p\log(1 + bf) + q\log(1-f), \qquad f^* = \frac{bp - q}{b}.$$

### 4. Continuous return distributions

Let the per-period return on invested fraction $f$ be the random variable $fs$, where $s$ has CDF $F$ supported on $[a, \infty)$ with $a > -\infty$ and mean $\mu = \int_a^\infty s\,dF(s) > 0$.

The growth rate coefficient becomes

$$G(f) = \int_a^\infty \log(1 + fs)\,dF(s).$$

**Theorem 2.** If $\mu > 0$, then $G(f)$ attains a unique maximum $G(f^*)$ at some $f^* \in (0, -1/a)$ if and only if $\lim_{f \to (-1/a)^-} G'(f) < 0$.

*Proof sketch.* $G''(f) = -\int_a^\infty sf/(1+fs)^2\,dF(s) < 0$, so $G$ is strictly concave on $(0, -1/a)$. Also $G(0) = 0$ and $G'(0) = \mu > 0$, guaranteeing the maximum lies in the interior. Uniqueness follows from strict concavity; boundary behavior pins down $f^*$. The condition $\lim_{f\to(-1/a)^-} G'(f) < 0$ ensures $f^*$ is strictly interior.

**Remark.** If $a \to -\infty$ (unbounded losses, e.g., full normal), $f^* \to 0$: the Kelly criterion yields no non-trivial solution, motivating the truncated distribution used in the empirical section.

### 5. Application to S&P 500 excess returns (1926--1984)

**Data.** Annual log excess returns (stock total return minus T-bill rate) for 59 years; sample statistics $\hat\mu = 0.058$, $\hat\sigma = 0.2160$ (equations (2)--(3)).

**Distributional model.** A quasi-normal (truncated and height-adjusted) density on $[A, B]$ with $A = \mu - 3\sigma = -0.590$, $B = \mu + 3\sigma = 0.706$:

$$N(s) = \begin{cases} h + \frac{1}{\sqrt{2\pi\alpha^2}}\,e^{-(s-\mu)^2/2\alpha^2}, & A \le s \le B,\\ 0, & \text{otherwise}, \end{cases}$$

where $\alpha = 0.2183$ is chosen so that $\int_A^B s^2 N(s)\,ds - \mu^2 = \sigma^2$, and $h$ is set so that $\int_A^B N(s)\,ds = 1$. This avoids the unbounded-support problem that forces $f^* \to 0$.

**Numerical optimization.** The growth rate

$$G(f) = \int_A^B \log(1+fs)\,N(s)\,ds$$

is maximized via Simpson's rule ($n = 1000$ subintervals). Results (approximate, from numerical integration):

| Quantity | Value |
|---|---|
| $f^*$ | $1.17$ |
| $G(f^*)$ | $0.0350$ |
| $f_c$ (ruin threshold) | $\approx 1.69$ |

**Interpretation.** $f^* = 1.17$ means the Kelly-optimal investor should be 117% invested in equities (17% on margin). At $f^* = 1.17$, the maximal average real growth rate exceeds T-bills. Beyond $f_c \approx 1.69$ (i.e., leverage $> 1.7\times$), ruin is almost sure.

The upper bound argument confirming $G(f) = 0$ has a solution $f_c \in (0, -1/A)$:

$$L = \lim_{f \to (-1/A)^-} \int_A^B \log(1+fs)\,N(s)\,ds \le M\!\left[A - B + (B-A)\log\!\left(1 - \frac{B}{A}\right)\right] = -0.51 < 0,$$

where $M = \max N(s) = h + 1/\sqrt{2\pi\alpha^2}$. Since $G(0)=0$, $G(f^*)>0$, and $L < 0$, the intermediate value theorem guarantees a unique $f_c$.

### 6. Finite-horizon risk caveat

Assuming i.i.d. normal excess returns with $\bar{x} = 0.058$, $s_n = 0.2160/\sqrt{n}$, the probability of negative excess return over $n$ years is

$$\Pr\!\left(t < \frac{0 - 0.058}{0.2160/\sqrt{n}}\right),$$

which remains non-negligible for moderate horizons (e.g., 0.38 for $n=2$, 0.10 for $n=25$). The Kelly criterion is asymptotic; it does not address finite-horizon shortfall risk.

## Domain of applicability

- **Favorable game required.** The entire framework assumes $\mu > 0$ (positive expected excess return). With $\mu \le 0$, optimal $f^* = 0$ (do not play).
- **Bounded support needed for continuous distributions.** If the return distribution has unbounded left tail (e.g., Gaussian), $f^* \to 0$. A truncation or otherwise bounded-support model is necessary for a non-trivial Kelly fraction. This is a modeling choice, not a feature of the criterion itself.
- **i.i.d. or known-distribution assumption.** Theorem 1(vi) extends to non-stationary $p_i$ if these are known each period. In practice, $\mu$ and $\sigma$ must be estimated -- estimation error in the mean is the dominant source of fragility.
- **Infinite divisibility of capital.** Results are exact only when bets are continuously divisible. For quantized bets, the probability of ruin is small but positive when the minimum bet is small relative to capital [7].
- **Asymptotic criterion.** Kelly maximizes long-run growth rate. It does not optimize expected utility for risk-averse agents with finite horizons, nor does it control drawdown or shortfall probability over finite periods.
- **No transaction costs, taxes, or margin constraints** in the theoretical development. The authors note that including margin costs would reduce the effective $f^*$ somewhat.
- **Stationarity.** The S&P 500 application treats 59 years of data as a single stationary regime. Structural breaks, fat tails beyond $\pm 3\sigma$, and volatility clustering are not addressed.
