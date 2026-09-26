# 1. Metadata

- **Title:** Behavioral Portfolio Theory
- **Author(s):** Hersh Shefrin, Meir Statman
- **Year:** 2000
- **Journal/Venue:** *Journal of Financial and Quantitative Analysis*

# 2. Problem statement

The paper develops a positive theory of portfolio choice consistent with the Friedman-Savage observation that investors may simultaneously want insurance and lottery-like upside. The mathematical problem is to characterize efficient portfolios when investors care not just about mean and variance, but about aspiration levels, downside probabilities, and “security” versus “potential.” The paper asks whether such portfolios coincide with mean-variance efficient portfolios and whether CAPM two-fund separation survives.

# 3. Approach (short)

The approach combines SP/A theory (security, potential, aspiration) with prospect-theory-style mental accounting. In the single-account version, the investor chooses terminal state payoffs to maximize a criterion trading off expected wealth and the probability of reaching an aspiration level. The authors characterize the resulting efficient frontier and compare it to mean-variance efficiency. In the multiple-account version, they reinterpret portfolios as layered mental-account pyramids aimed separately at avoiding poverty and reaching riches.

# 4. Approach (detailed)

1. **Single-account behavioral objective**

   In the discrete-state setup, a portfolio is a vector of terminal state consumptions
   $$
   W=(W_1,\dots,W_n)
   $$
   priced by state prices $v_i$ and probabilities $p_i$, subject to the budget constraint
   $$
   \sum_i v_i W_i \le W_0.
   $$
   The investor values:
   - expected wealth $E_h(W)=\sum_i p_i W_i$,
   - and the probability of meeting aspiration $A$,
     $$
     D(A)=\Pr\{W\ge A\}.
     $$
   Efficient BPT-SA portfolios maximize a utility $U(E_h(W),D(A))$ along the frontier of feasible $(E_h,D)$ pairs.

2. **Efficient BPT-SA portfolio shape**

   Theorem 1 characterizes the efficient payoff shape. In equiprobable states, there exists a critical state $i_c$ such that the optimal payoff has three regions:
   $$
   W_i=0 \quad (i<i_c),\qquad
   W_i=A \quad (i_c\le i<n),\qquad
   W_n>\!A.
   $$
   Economically, the investor buys:
   - a security layer guaranteeing aspiration in sufficiently likely/good states,
   - plus a lottery layer concentrated in the cheapest state-price-per-probability state.

   This is the formal version of “bonds plus lottery tickets.”

3. **Why that payoff is optimal**

   The proof is constructive. To maximize expected wealth subject to a minimum aspiration-probability requirement:
   - first buy the cheapest state-contingent claim per unit probability to maximize expected wealth;
   - then, if the aspiration-probability constraint is violated, reallocate wealth minimally into a set of states whose total probability just exceeds the target $a$, purchasing exactly $A$ in those states.

   Under equiprobability, this means filling the highest-probability-value states first and then concentrating residual upside in the cheapest state.

4. **Mean-variance benchmark**

   Theorem 2 derives the mean-variance-efficient payoff in the same discrete-state environment as
   $$
   W_i=\frac{1}{b}\left[1-\lambda \frac{v_i}{p_i}\right],
   $$
   with $b>0$ and $\lambda$ chosen from the budget constraint. This is a strictly concave function of the probability-normalized state price $v_i/p_i$.

5. **Noncoincidence of frontiers**

   Theorem 3 shows that if the BPT-SA efficient portfolio has at least three positive payoff states with distinct $v_i/p_i$, then it is generically **not** mean-variance efficient. The reason is structural:
   - mean-variance-efficient payoffs vary smoothly with $v_i/p_i$,
   - BPT-SA efficient payoffs have kinks and flat regions (zero region, aspiration plateau, lottery spike).

   Therefore the BPT efficient frontier and the mean-variance frontier do not generally coincide.

6. **Failure of CAPM two-fund separation**

   Since optimal BPT portfolios depend on aspiration levels and the security/potential tradeoff, two investors with the same beliefs but different aspirations need not hold scaled versions of one risky fund plus the risk-free asset. Hence standard CAPM two-fund separation fails.

7. **Multiple mental accounts**

   The paper then moves from BPT-SA to BPT-MA, where investors segment wealth into distinct accounts:
   - a downside-protection account (“avoid poverty”),
   - an upside account (“shot at riches”),
   possibly more layers.

   Covariances across accounts are psychologically underweighted or ignored, so the optimal total portfolio resembles a layered pyramid rather than a single integrated efficient portfolio.

8. **Interpretation**

   BPT is positive rather than normative. The paper is not claiming investors *should* ignore covariance; it claims many investors appear to choose portfolios as if they do, because aspirations and mental accounts matter. The model rationalizes concentrated upside bets coexisting with safety-seeking behavior.

9. **What is exact**

   - The single-account discrete-state characterization theorems are exact.
   - The noncoincidence with mean-variance efficiency is exact in the stated discrete framework.
   - The multi-account layering interpretation is more behavioral and less theorem-driven.

# 5. Domain of applicability

- The theory applies to investors whose preferences are aspiration-based and behaviorally segmented rather than globally concave over final wealth.
- It is useful for explaining demand for structured products, capital-protected speculation, concentrated upside bets, and mental-account portfolio construction.
- It is not a market-clearing equilibrium asset-pricing theory in the CAPM sense.
- The multi-account version sacrifices some normative coherence by underweighting covariance across accounts.
- The novel contribution is the theorem-backed distinction between aspiration-efficient portfolios and mean-variance-efficient portfolios, not merely the verbal claim that investors like lotteries.
