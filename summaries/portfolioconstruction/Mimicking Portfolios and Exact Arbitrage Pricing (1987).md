# Mimicking Portfolios and Exact Arbitrage Pricing (1987)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/MimickingPortfolios_HubermanKandelStambaugh_1987.pdf>), 9 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

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

   One central result is that, under exact pricing, provided $\iota\notin\operatorname{col}(B)$ and the zero-beta rate differs from the expected return on the global minimum-variance portfolio, there is a unique portfolio of mimicking portfolios on the minimum-variance boundary. This connects exact APT-style pricing to mean-variance efficiency geometry.

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


# 6. Complete characterization and empirical consequences

## 6.1 Model assumptions and the meaning of “mimicking”

The article appears in The Journal of Finance 42(1), March 1987, pp. 1-9. It assumes a return-generating model

$$
r=E+Bf+e,\qquad Ef=Ee=0,\qquad E(ff^T)=I_K,
\qquad E(e\mid f)=0,
$$

with $B$ full column rank, $V=BB^T+Z$ nonsingular, and $E$ not proportional to the vector of ones $\iota$. The factor covariance normalization loses no generality when the factors are nondegenerate. Exact pricing means $E=r_0\iota+Bu$; the paper takes this relation as the pricing hypothesis to analyze, rather than proving exact pricing from a finite-asset no-arbitrage assumption.

A mimicking position need not replicate the realization of a nontraded factor. It is enough that its covariances with the traded assets span the same cross-sectional pricing directions. Because the definition must work for **every** risk-premium vector $u$, accidental matching of a single expected-return vector is insufficient. This quantifier makes the column-space result substantive.

A zero-cost long-short position is valid as a payoff vector but cannot be divided by its cost to define a unit-cost portfolio return. This distinction is essential when empirical “factors” are zero-investment spreads. Position payoffs and ordinary fully invested returns have different intercept normalization.

## 6.2 Why all valid systems are rotations of one space

For $R=A^Tr$, covariance with asset returns is $VA$. If the columns of $VA$ and $B$ have the same span, both have rank $K$ and there is an invertible $L$ with $VA=BL$. Conversely this equation makes every $Bu$ representable as $VA(L^{-1}u)$. Hence

$$
A=V^{-1}BL
$$

is both necessary and sufficient. The invariant object is the $K$-dimensional space $\operatorname{col}(V^{-1}B)$, not any particular portfolio basis or factor naming convention. Rotating or rescaling factors changes coordinates without changing that space.

Suppose $\iota^TV^{-1}B=0$. Every vector in this space has zero cost, and no choice of basis can yield unit-cost portfolios. If the row vector is nonzero, a basis can be chosen whose every column has nonzero cost and then normalized. The global minimum-variance portfolio $v_G=V^{-1}\iota/(\iota^TV^{-1}\iota)$ has factor exposure proportional to $B^TV^{-1}\iota$, yielding Proposition 2.

This existence statement does not mean every aesthetically appealing basis can be rescaled column by column. A particular basis can contain a zero-cost column even when another basis consists entirely of nonzero-cost positions. The paper supplies a three-asset, two-factor example of exactly this issue for factor-score positions.

## 6.3 The complete frontier classification

The minimum-variance frontier consists of fully invested portfolios minimizing variance for their mean, including both branches where relevant. The paper classifies intersections with the mimicking span, rather than simply asserting that factor portfolios are mean-variance efficient.

| Case | Condition under exact pricing | Intersection with frontier |
|---|---|---|
| Generic intercept | $\iota\notin\operatorname{col}(B)$ and $r_0\ne E r_G$ | Exactly one portfolio, not GMV |
| GMV intercept | $\iota\notin\operatorname{col}(B)$ and $r_0=E r_G$ | None |
| Budget direction spanned | $\iota\in\operatorname{col}(B)$ | Entire frontier |

If the sole intersection is GMV, exact pricing cannot hold. Conversely, a unique non-GMV frontier intersection implies exact pricing with the corresponding intercept and the condition that the budget direction is not in the loading span.

To see the generic construction, define $q=\iota^TV^{-1}Bu$. Exact pricing gives

$$
q=(\iota^TV^{-1}\iota)(E r_G-r_0).
$$

When this is nonzero,

$$
x=\frac{V^{-1}Bu}{q}
$$

is fully invested and satisfies $E=r_0\iota+qVx$, the standard first-order characterization of a non-GMV frontier portfolio. If $\iota$ is outside the loading span, this intersection is unique. If $\iota$ lies inside it, every linear combination of $V^{-1}E$ and $V^{-1}\iota$ needed for the frontier lies inside the mimicking span.

The omitted budget-span condition in the earlier short description of uniqueness would incorrectly exclude the entire-frontier case. It is an essential assumption, not a minor technicality.

## 6.4 Three economically different normalizations

**Maximum correlation.** For factor $k$, $\operatorname{Cov}(a^Tr,f_k)=a^Tb_k$. Cauchy-Schwarz in the $V$ metric bounds

$$
\frac{a^Tb_k}{\sqrt{a^TVa}}
\le\sqrt{b_k^TV^{-1}b_k},
$$

with equality in direction $a\propto V^{-1}b_k$. This position can load on other factors. It maximizes correlation with one target, rather than imposing zero exposure to every other factor.

**Minimum residual variance with one loading fixed.** Replacing $V$ by nonsingular $Z$ gives direction $Z^{-1}b_k$. The Woodbury identity implies $Z^{-1}B=V^{-1}B(I+B^TZ^{-1}B)$, so this alternative is still a basis of the same mimicking space. It minimizes idiosyncratic rather than total variance under its particular one-loading constraint.

**Unit exposure to one factor and zero to the rest.** Imposing $B^TA=I$ gives

$$
A_*=V^{-1}B(B^TV^{-1}B)^{-1}
=Z^{-1}B(B^TZ^{-1}B)^{-1}.
$$

The equality follows because, when factor loadings are fixed, systematic variance is fixed; minimizing total variance and residual variance are equivalent. This is the GLS factor-score construction. The columns have unit factor exposure, but do not necessarily cost one and do not generally produce mutually uncorrelated portfolio returns.

## 6.5 Additional restrictions available with traded mimicking returns

Regressing asset returns on $R=A^Tr$ gives slope

$$
G=VA(A^TVA)^{-1}.
$$

The pricing relation can be written $E=r_0\iota+Gh$. Premultiplying by $A^T$ and using $A^TG=I$ gives

$$
h=ER-r_0A^T\iota.
$$

For unit-cost mimicking portfolios, risk premia must therefore equal their own expected excess returns. For general positions, their costs multiply the pricing intercept. When nontraded factors are used directly, their risk prices need not equal their means because those factors are not payoffs purchasable at the corresponding unit cost.

This restriction is the empirical testing benefit highlighted in the paper. With regression intercept $g=E-GER$ and unit-cost portfolios, the restriction is

$$
g=r_0(\iota-G\iota_K).
$$

Mean-variance spanning by those portfolios imposes the stronger pair $g=0$ and $G\iota_K=\iota$. More restrictions can potentially improve test power, but the source explicitly leaves the net power benefit unresolved because portfolio weights must themselves be estimated.

## 6.6 Mimicking does not preserve diagonal residual covariance

Even if the original factor residual covariance $Z$ is diagonal, the residual covariance after linear projection on mimicking payoffs is

$$
V-VA(A^TVA)^{-1}A^TV
=V-B(B^TV^{-1}B)^{-1}B^T.
$$

It is invariant to the choice of invertible $L$, but generally dense. The mimicking payoff contains idiosyncratic estimation noise from the assets used to construct it, and residuals inherit corresponding dependencies. Using a diagonal residual assumption again in the second regression would impose a restriction not justified by the original factor model.

## 6.7 Practical use and limits

An implementation should define whether each output is a payoff position, a unit-cost portfolio, or a unit-factor-exposure hedge; check loading rank and covariance conditioning; solve linear systems for $V^{-1}B$; and inspect column costs before normalizing. Near-zero costs create enormous normalized holdings and unstable returns even when the theoretical span is well-defined. Adding leverage or long-only constraints generally changes the exact characterization and must be treated as an approximation or a different problem.

Sampling error in $B$ and $V$ affects both the constructed factors and asset-pricing tests. A source-grounded use of this paper should preserve its distinction between population algebra and estimated implementation. The theorem is exact at the population level and for the specified asset set; it does not certify that an estimated factor proxy spans the same pricing directions out of sample or in a larger investment universe.
