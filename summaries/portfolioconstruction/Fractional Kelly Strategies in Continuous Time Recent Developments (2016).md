# Fractional Kelly Strategies in Continuous Time Recent Developments (2016)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_DavisLloyd_2016.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Fractional Kelly Strategies in Continuous Time: Recent Developments
- **Author(s):** Mark Davis, Sébastien Lleo
- **Year:** 2016
- **Journal/Venue:** Chapter / survey article

# 2. Problem statement

The paper asks when the usual definition of a fractional Kelly strategy remains correct in continuous time: **if the Kelly portfolio is the log-utility optimum, under what asset-price models is a “fraction $f$ of Kelly plus $1-f$ in cash” representation still optimal for power-utility investors, and how must it be modified in more general incomplete or factor-driven models?**

# 3. Approach (short)

The method is continuous-time stochastic control plus fund separation. The paper first rederives the Kelly portfolio and fractional Kelly rule in the Merton model, where power-utility optimal policies are scalar multiples of the log-optimal portfolio. It then moves to the ICAPM with state variables and to benchmarked investment problems, showing that the correct generalization of fractional Kelly involves extra hedging or benchmark-tracking funds. The techniques are HJB equations and mutual-fund theorems.

# 4. Approach (detailed)

1. **Kelly portfolio in the Merton model**

   With
   $$
   \frac{dS_t}{S_t} = \mu\,dt + \Sigma\, dW_t,
   $$
   and a risk-free asset $r$, the log-utility investor solves
   $$
   \max_h E[\log V_T],
   $$
   producing the Kelly allocation
   $$
   h^{K} = (\Sigma\Sigma^\top)^{-1}(\mu-r\mathbf 1).
   $$

2. **Fractional Kelly under power utility**

   For CRRA utility $U(V_T)=V_T^{1-\gamma}/(1-\gamma)$, the Merton solution is a scaled version of Kelly:
   $$
   h^{(\gamma)} = \frac{1}{\gamma} h^{K}.
   $$
   Thus the classical fractional Kelly rule is exact in the Merton model: power-utility investors invest a risk-aversion-dependent fraction of the full Kelly portfolio and the rest in cash.

3. **Fund separation interpretation**

   The paper emphasizes that fractional Kelly is a mutual-fund theorem. In the Merton environment, every optimal portfolio lies in the span of:

   - the Kelly (log-optimal) risky fund;
   - the money-market account.

   This is why “fractional Kelly” is exact there.

4. **ICAPM extension**

   When expected returns depend on state variables, the HJB solution includes an intertemporal hedging demand. Optimal policies no longer lie in the span of Kelly plus cash alone. Instead, the appropriate fund-separation theorem says optimal portfolios lie in the span of:

   - the Kelly fund;
   - an intertemporal hedging portfolio;
   - possibly cash.

   Hence the naive definition of fractional Kelly is incomplete.

5. **When the classical rule reappears**

   If the factor innovations are uncorrelated with asset returns in the relevant way, the intertemporal hedging portfolio collapses and the classical Kelly-plus-cash representation reemerges. The paper states this as a corollary to the ICAPM fund-separation theorem.

6. **Benchmarked investment**

   If the investor’s objective is to outperform a benchmark, an additional benchmark-replicating fund enters the optimal decomposition. Then the optimal policy becomes a linear combination of:

   - the Kelly fund;
   - the intertemporal hedging fund;
   - the benchmark-tracking fund.

   This is the correct “benchmarked fractional Kelly” generalization.

7. **Proof logic**

   The proofs are standard stochastic-control arguments:

   - solve the HJB for log utility to get the Kelly portfolio;
   - solve the HJB for power utility;
   - identify the mutual-fund structure in the optimal policy coefficients;
   - read off when the additional hedging fund vanishes.

   The exact Merton scaling result is classical; the paper’s contribution is the generalized interpretation of fractional Kelly through the appropriate fund-separation theorem.

# 5. Domain of applicability

- The clean fractional-Kelly formula $h^{(\gamma)}=\gamma^{-1}h^K$ applies to the **Merton lognormal model**.
- In more general incomplete or state-dependent models, the correct decomposition needs extra funds and classical fractional Kelly is not generally exact.
- The paper is strongest as a conceptual clarification of what “fractional Kelly” should mean outside the Merton benchmark.

# 6. Notation and the economic meaning of a Kelly fraction

The source writes power utility as $U(v)=v^p/p$ (using $\gamma$ for $p$). Relative risk aversion is $a=1-p$. This summary's earlier $\gamma$ denotes relative risk aversion instead. Keeping these conventions separate is essential: the source's fraction is $1/(1-p)=1/a$, and log utility is the limit $p\to0$, or $a\to1$.

In the constant-parameter diffusion model let $C=\Sigma\Sigma^\top$ and $b=\mu-r\mathbf1$. For $h=fC^{-1}b$, expected log growth is
$$
g(f)=r+(f-\tfrac12f^2)\,b^\top C^{-1}b,
$$
and instantaneous log-return variance is $f^2b^\top C^{-1}b$. Half Kelly therefore retains $75\%$ of full Kelly's excess expected log growth while halving volatility, under this precise diffusion model. These relationships are algebraic consequences of the quadratic log-growth objective, not universal facts for jump or discrete-time returns.

A fraction $f<1$ corresponds to risk aversion above log utility; $f>1$ is also possible for less risk-averse power utility. Even a fractional Kelly portfolio can contain leveraged risky positions if the full Kelly portfolio is sufficiently leveraged. Its total risky weights need not sum to the verbal fraction: the Kelly mutual fund itself includes a money-market position.

# 7. Factor models: separating current attractiveness from hedging

The chapter's affine diffusion specification has factors
$$
dX=(b_X+B X)dt+\Lambda dW,
$$
with stock excess drift $\widehat a+\widehat A X$. The transformed value function is quadratic in the state,
$$
F(t,X)=\tfrac12X^\top Q(t)X+q(t)^\top X+k(t),
$$
where $Q$ satisfies a Riccati equation and $q,k$ satisfy associated ODEs. In the source's power parameter $p$, the optimal risky allocation is
$$
h^*=\frac1{1-p}C^{-1}\left[\widehat a+\widehat A X+p\Sigma\Lambda^\top\nabla_XF\right].
$$
Thus $h^K=C^{-1}(\widehat a+\widehat A X)$ is myopic, while the extra term uses covariance between traded returns and factors together with the sensitivity of continuation value to those factors. The hedge need not be a fixed fund common to investors: $Q$ and $q$ generally depend on preferences and horizon.

When $\Sigma\Lambda^\top=0$, the hedge vanishes even though opportunities can change randomly. Its absence is due to lack of hedgeable covariance, not proof that changing opportunities have no economic relevance. Conversely, replacing a changing factor by its unconditional mean loses both the current-state change in the Kelly portfolio and the intertemporal hedge.

The numerical example uses a mean-reverting short-rate factor and a stock whose expected return depends on it. At the long-run factor level, full Kelly has $150\%$ in the stock. The intertemporal hedging fund has a comparatively small short stock position, shrinking to zero as the horizon approaches. Perfect factor/stock correlation is deliberately used to display the hedge clearly; the chapter says that assumption is unrealistic. These are numerical illustrations, not fitted evidence that real intertemporal hedges are always small.

# 8. Benchmark-relative investment

For utility of wealth relative to a stochastic benchmark, the benchmark's diffusion exposure contributes a tracking demand. If the benchmark volatility vector is $\varsigma$, its instantaneous minimum-variance replication exposure is $C^{-1}\Sigma\varsigma$. When the benchmark is exactly a tradable constant-weight portfolio, this expression recovers its risky weights. If it contains unspanned risk, the residual benchmark risk remains and cannot be eliminated by fund labels.

The chapter's two-stock illustration uses a $60/40$ benchmark. At the factor equilibrium, full Kelly holds approximately $168.83\%$ and $131.71\%$ in the stocks, while the benchmark-replicating fund holds exactly $60\%$ and $40\%$. The low-risk-aversion allocation is dominated by growth demand; increasing risk aversion shifts the relative-wealth allocation toward benchmark replication. This illustrates why a benchmarked investor should not generally scale every risky asset toward cash.

# 9. Jumps invalidate the simple quadratic scaling argument

The later section allows jump returns $\eta(z)$ with Lévy intensity $\nu(dz)$. Admissibility requires
$$
1+h^\top\eta(z)>0
$$
for relevant jumps, as well as integrability and a true-martingale condition for the change of measure. This is a solvency restriction on all jumps in the modeled support. A covariance-only position can violate it even when its diffusion variance appears acceptable.

With a consistent compensation convention, the Kelly first-order condition becomes the nonlinear fixed-point equation
$$
Ch^K=\widehat a+\widehat A X+
\int\left[\frac{\eta(z)}{1+h^{K\top}\eta(z)}-\eta(z)\mathbf1_{Z_0}(z)\right]\nu(dz).
$$
The denominator penalizes proximity to jump-induced ruin. For power utility it is replaced by a different nonlinear marginal-utility term. Scaling the Kelly solution by $1/(1-p)$ therefore does not ordinarily solve the power-utility problem.

The source gives a generalized fund decomposition by defining a residual preference-dependent hedging fund from the optimal control and Kelly allocation. This is mathematically valid but less constructive than classical two-fund separation: the residual fund depends on the solution one is trying to calculate. Numerical policy improvement or finite differences remain necessary. The diffusion factor state itself has no jumps in this specification, which simplifies the state equation after the change of measure; the jump distribution still enters the control optimization through the integral.

For use, identify which assumptions justify the desired interpretation of “fractional Kelly”: constant opportunities and diffusion returns yield literal scaling; factor covariance adds hedging; a benchmark adds tracking; jumps add nonlinear solvency and distributional terms. Estimation uncertainty, trading costs, portfolio constraints, and parameter learning are separate problems. The chapter clarifies optimality within these models and does not provide an empirically universal safe Kelly fraction.
