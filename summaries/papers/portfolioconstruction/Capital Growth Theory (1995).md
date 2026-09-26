# 1. Metadata

- **Title:** Capital Growth Theory
- **Author(s):** Nils H. Hakansson, William T. Ziemba
- **Year:** 1995
- **Journal/Venue:** Handbook chapter in *Handbooks in Operations Research and Management Science*

# 2. Problem statement

The chapter asks: **what is the exact content of capital-growth theory and the growth-optimal portfolio (Kelly criterion), what are its main mathematical properties, and how does it relate to expected utility, mean-variance analysis, and long-run portfolio choice?**

# 3. Approach (short)

The chapter is a theoretical survey centered on the growth-optimal portfolio. It formulates long-run investment as maximizing the almost-sure asymptotic growth rate of wealth, derives the resulting policy, proves its central properties such as asymptotic dominance and myopia, and compares it with mean-variance and other expected-utility criteria. The methods are stochastic growth theory and dynamic portfolio choice rather than empirical optimization.

# 4. Approach (detailed)

1. **Growth criterion**

   Let gross portfolio return in period $t$ be $1+x_t^\top R_t$. The growth-optimal strategy solves
   $$
   \max_x E[\log(1+x^\top R)]
   $$
   in the i.i.d. one-period formulation, or equivalently maximizes the long-run almost-sure growth rate
   $$
   \lim_{T\to\infty}\frac{1}{T}\log W_T
   $$
   when the same opportunity set repeats through time.

2. **First-order condition**

   For an interior optimum $x^\star$, the FOC is
   $$
   E\!\left[\frac{R_i}{1+x^{\star\top}R}\right]=0
   \qquad \forall i.
   $$
   This is the exact Kelly optimality condition. It reflects that marginal reallocation across assets must leave expected log growth unchanged at the optimum.

3. **Core properties**

   The chapter emphasizes several classic results:

   - **myopia:** the growth-optimal strategy is myopic under broad conditions;
   - **proportionality:** investment is proportional to current wealth;
   - **log-utility equivalence:** the growth-optimal strategy is implied by, and implies, logarithmic utility in the standard expected-utility framework;
   - **asymptotic dominance:** under suitable conditions, no other significantly different strategy matches its long-run growth rate.

4. **Breiman-style dominance**

   One of the key theorems, due originally to Breiman, is that if a positive long-run growth opportunity exists, the growth-optimal strategy asymptotically dominates any other strategy in the sense that the wealth ratio of any other admissible strategy to the growth-optimal strategy tends to zero almost surely, unless the alternative is asymptotically equivalent. This is the mathematical core of the Kelly criterion’s reputation.

5. **Capital growth versus expected utility**

   The chapter is careful not to overclaim. Growth optimality is not a universal welfare criterion. It corresponds to logarithmic utility, and investors with different curvature may rationally choose different portfolios despite lower long-run growth. The chapter therefore distinguishes:

   - maximizing almost-sure capital growth;
   - maximizing expected utility of terminal wealth;
   - mean-variance approximations.

6. **Relation to mean-variance**

   The chapter stresses that the growth-optimal portfolio need not coincide with the mean-variance optimum, because the Kelly problem depends on all moments through $\log(1+x^\top R)$, not just mean and variance. Mean-variance can sometimes approximate Kelly locally or sequentially, but it is not equivalent except in special cases.

7. **Tradeoffs with security**

   A recurring practical theme is that full Kelly can be too aggressive. The chapter reviews strategies that mix cash and the growth-optimal portfolio, generating growth-security tradeoffs. These are conceptual predecessors to later “fractional Kelly” rules.

8. **Proof logic**

   The derivations are standard:

   - define wealth recursively;
   - convert multiplicative wealth growth into additive log growth;
   - solve the one-step log-growth problem;
   - invoke law-of-large-numbers style arguments and Breiman-type theorems for long-run dominance.

   The chapter is a survey, so many proofs are summarized rather than rederived, but the logical structure is explicit.

# 5. Domain of applicability

- The theory applies to **repeated investment under multiplicative wealth dynamics**.
- It is strongest when long-run growth is the relevant objective and ruin avoidance matters.
- The chapter does not claim that Kelly is the correct criterion for all investors; it is explicit that growth optimality is only one point in the space of admissible preferences.
- The results are less directly applicable when leverage, drawdown, financing frictions, or nonstationary opportunities dominate the problem.
