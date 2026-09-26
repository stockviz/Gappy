# 1. Metadata

- **Title:** Mimicking Portfolios and Exact Arbitrage Pricing
- **Author(s):** Gur Huberman, Shmuel Kandel, Robert F. Stambaugh
- **Year:** 1987
- **Journal/Venue:** *The Journal of Finance*

# 2. Problem statement

The paper asks how to construct **portfolios of traded risky assets that can replace nontraded factors in an exact $K$-factor arbitrage-pricing relation**. More precisely, if expected returns satisfy an exact linear factor-pricing relation, what are the sets of factor-mimicking positions, when can they be normalized into portfolios, and how do these portfolios relate to the minimum-variance frontier?

# 3. Approach (short)

The method is exact linear algebra. Starting from the factor-pricing equation and the covariance matrix of asset returns, the paper defines a matrix $A$ whose columns represent factor-mimicking positions. It proves that all such sets are nonsingular linear transformations of $V^{-1}B$, where $V$ is the asset covariance matrix and $B$ the matrix of factor loadings. It then characterizes when these positions can be rescaled into actual portfolios and studies their relation to the global minimum-variance portfolio and the minimum-variance frontier.

# 4. Approach (detailed)

1. **Exact factor-pricing environment**

   Let $R\in\mathbb R^N$ be the vector of risky-asset payoffs or returns, and assume an exact $K$-factor pricing relation
   $$
   E(R)=\iota r_0 + B u,
   $$
   where:

   - $\iota$ is the $N$-vector of ones;
   - $r_0$ is the zero-beta or arbitrage-pricing intercept;
   - $B\in\mathbb R^{N\times K}$ is the matrix of factor loadings;
   - $u\in\mathbb R^K$ is the vector of factor risk premia.

   Let
   $$
   V=\operatorname{Cov}(R)
   $$
   denote the covariance matrix.

2. **Definition of mimicking positions**

   A matrix $A\in\mathbb R^{N\times K}$ represents $K$ positions in the risky assets. Their payoffs are $A^\top R$. These positions are factor-mimicking if they can replace the factors in pricing all $N$ assets. Let
   $$
   C=\operatorname{Cov}(R,A^\top R)=VA.
   $$
   The mimicking requirement is that whenever the exact factor-pricing relation holds, there exists some $w$ such that
   $$
   E(R)=\iota r_0 + C w.
   $$
   Since this must hold for all $u$, the column space of $C$ must coincide with the column space of $B$.

3. **Proposition 1: complete characterization**

   The paper proves:
   $$
   A \text{ is factor-mimicking } \iff A=V^{-1}BL,
   $$
   where $L$ is any nonsingular $K\times K$ matrix.

   This result is fundamental. It says all factor-mimicking systems are just nonsingular reparameterizations of $V^{-1}B$. The proof is immediate once one observes that $C=VA$, so the mimicking condition is exactly that the column spaces of $VA$ and $B$ coincide.

4. **When do mimicking positions become portfolios?**

   A position vector becomes a portfolio if its weights sum to one. Hence the columns of $A$ must be rescalable to satisfy
   $$
   \iota^\top A = \iota_K^\top
   $$
   after a suitable choice of $L$.

   **Proposition 2** states that a set of mimicking portfolios exists **if and only if** the global minimum-variance portfolio has positive systematic risk. Since the GMV portfolio is
   $$
   w_{GMV}=\frac{V^{-1}\iota}{\iota^\top V^{-1}\iota},
   $$
   its systematic risk is positive iff
   $$
   \iota^\top V^{-1}B \neq 0^\top.
   $$
   This condition is exactly what is needed to find a nonsingular $L$ making the columns of $A=V^{-1}BL$ sum to one.

5. **Minimum-variance characterizations**

   The paper gives important special cases.

   - A mimicking position can be chosen to minimize **idiosyncratic risk** subject to a factor-loading normalization:
     $$
     \min_a a^\top Z a
     \quad\text{s.t.}\quad
     a^\top b_k = \text{target},
     $$
     yielding $Z^{-1}B$-type solutions.

   - The “factor scores” specification solves
     $$
     \min_a a^\top V a
     \quad\text{s.t.}\quad
     a^\top B = e_k,
     $$
     with solution
     $$
     A=V^{-1}B(B^\top V^{-1}B)^{-1}.
     $$
     This is the minimum-variance mimicking system.

   These are exact quadratic programs, not approximations.

6. **Relation to the minimum-variance frontier**

   The second half of the paper studies how portfolios of mimicking portfolios sit on the minimum-variance frontier.

   The key intuition is:

   - if exact factor pricing holds, then the span of mimicking portfolios captures the priced systematic-return space;
   - hence efficient frontier objects must be tightly linked to these portfolios.

   One central result is that, under exact pricing and provided the zero-beta rate differs from the expected return on the global minimum-variance portfolio, there is a unique portfolio of mimicking portfolios on the minimum-variance boundary. This connects exact APT-style pricing to mean-variance efficiency geometry.

7. **Why the result matters**

   If factors are not traded, empirical asset pricing still wants portfolio returns that stand in for them. The paper shows:

   - such mimicking systems always exist under exact pricing;
   - they are not arbitrary;
   - all of them are nonsingular transforms of a single canonical object $V^{-1}B$.

   So empirical tests using “factor-mimicking portfolios” are not ad hoc if exact factor pricing is the maintained model.

8. **Proof structure**

   The proofs are concise:

   - Proposition 1 is a column-space argument using $C=VA$.
   - Proposition 2 follows from the existence of $L$ such that $\iota^\top V^{-1}BL=\iota_K^\top$, which is possible iff $\iota^\top V^{-1}B\neq 0$.
   - The minimum-variance characterizations are standard quadratic programs with linear constraints.

   The paper is therefore exact and nonasymptotic throughout.

**Additional mathematical details**

Among all mimicking systems, the paper’s minimum-variance construction is
$$
A^\star = V^{-1}B(B^\top V^{-1}B)^{-1},
$$
which is the solution to
$$
\min_A \operatorname{tr}(A^\top V A)
\qquad\text{s.t.}\qquad
B^\top A=I_K.
$$
The first-order condition $2VA-B\Lambda=0$ yields $A=V^{-1}B\Lambda/2$, and imposing $B^\top A=I_K$ gives the stated formula. So the canonical mimicking system is just a constrained generalized least-squares projection.

This also clarifies Proposition 1. Since $VA$ is the covariance between asset returns and the mimicking returns $A^\top R$, requiring the latter to span the exact pricing factors is equivalent to requiring $\operatorname{col}(VA)=\operatorname{col}(B)$. With $V$ nonsingular, that is exactly the statement that $A$ must be of the form $V^{-1}BL$ for some nonsingular $L$.

# 5. Domain of applicability

- The results require an **exact** linear factor-pricing relation. Approximate factor models are outside the proof.
- Covariance matrix $V$ must be nonsingular, and factor loadings $B$ must have rank $K$.
- The portfolio-normalization result depends on the GMV portfolio having nonzero systematic exposure.
- The paper supports exact structural claims about factor-mimicking systems; it does **not** address sampling error in estimated $B$ or $V$, which is where most empirical difficulties arise.
