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
