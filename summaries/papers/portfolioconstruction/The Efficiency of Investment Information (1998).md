# 1. Metadata

- **Title:** The Efficiency of Investment Information
- **Author(s):** Elza Erkip, Thomas M. Cover
- **Year:** 1998
- **Journal/Venue:** *IEEE Transactions on Information Theory*

# 2. Problem statement

The paper asks: **if an investor receives a finite-rate description of side information $V$ correlated with the market outcome $X$, how much can that description increase the asymptotic log-growth rate of wealth?** Formally, if the description rate is bounded by $R$, what is the maximal incremental growth rate
$$
\Delta(R)
=
\sup\{ \text{growth gain achievable with description rate }R\}?
$$

# 3. Approach (short)

The method is information-theoretic dynamic portfolio analysis. Erkip and Cover write optimal growth with side information as a log-optimal portfolio problem conditional on a compressed message $U$, then show that maximizing incremental growth at description rate $R$ is equivalent to an indirect rate-distortion problem with a portfolio-induced distortion function. The paper then derives general bounds, exact single-letter formulas, and local-efficiency results.

# 4. Approach (detailed)

1. **Baseline growth without and with side information**

   Let $X$ denote the stock-market outcome and let $V$ be side information. For an i.i.d. sequence $(X_t,V_t)$, a portfolio rule $b(\cdot)$ based on a message $U$ achieves growth
   $$
   W(U)=\mathbb E\big[\log(b(U)^\top X)\big].
   $$
   Without side information, the optimal growth is
   $$
   W^\star = \sup_{b} \mathbb E[\log(b^\top X)].
   $$
   With full side information $V$, one gets
   $$
   W^\star(X|V)=\sup_{b(\cdot)} \mathbb E[\log(b(V)^\top X)].
   $$
   The object of interest is the gain from describing $V$ at finite rate $R$.

2. **Define the incremental growth-rate function**

   A description $U$ of $V$ is admissible at rate $R$ if
   $$
   I(U;V)\le R
   $$
   and $U\!-\!V\!-\!X$ is a Markov chain. For such $U$, the incremental growth rate is
   $$
   \Delta(U)=W(U)-W^\star.
   $$
   The optimal rate-constrained gain is
   $$
   \Delta(R)=\sup_{U: \, I(U;V)\le R,\ U-V-X}\Delta(U).
   $$

3. **Convert the problem into indirect rate-distortion**

   The key step is to define a distortion between the true market realization $x$ and a portfolio decision $b$:
   $$
   d(x,b)=\log\frac{b^\star(x)^\top x}{b^\top x},
   $$
   or, more generally, relative to the optimal portfolio available under the relevant information set. Then maximizing growth is equivalent to minimizing expected distortion. Because the encoder observes $V$, not $X$, the problem becomes a remote-source or indirect rate-distortion problem.

4. **State and prove the single-letter characterization**

   Theorem 1 gives
   $$
   \Delta(R)
   =
   \max_{p(u|v):\, I(U;V)\le R,\ U-V-X}
   \Big(
   \mathbb E[\log(b(U)^\top X)]-W^\star
   \Big),
   $$
   where $b(u)$ is the log-optimal portfolio under the conditional distribution of $X|U=u$.

   The proof has two parts.
   - **Achievability:** fix $p(u|v)$, build a random codebook of $u^n$-sequences jointly typical with $v^n$, transmit the codeword index, and use the induced conditional-optimal portfolio $b(U_t)$. Typicality gives the target conditional law, hence the targeted growth.
   - **Converse:** using Berger’s remote-source rate-distortion theorem, any code with rate $R$ induces an expected distortion bounded below by the indirect rate-distortion function. Because growth gain is exactly baseline growth minus expected distortion, this yields the single-letter upper bound and hence equality.

5. **Global upper bound**

   The paper proves
   $$
   \Delta(R)\le R.
   $$
   This follows from data processing and the fact that side information cannot raise capital-growth rate by more than its information content. The result is exact and general.

6. **Initial efficiency**

   The authors study the derivative at the origin,
   $$
   \Delta'(0),
   $$
   interpreted as the maximal growth increase per marginal bit of description. For horse-race markets, the initial efficiency is linked to Hirschfeld-Gebelein-Rényi maximal correlation. In that setting the paper shows
   $$
   \Delta'(0)=\rho_m^2(X,V),
   $$
   making precise how informative $V$ is for growth when only a tiny message can be sent.

7. **Special cases**

   The paper works out discrete horse-race and Gaussian examples explicitly. In the horse-race case the formulas connect directly to source coding with side information. In the Gaussian case, the growth-rate problem becomes an analytically tractable quadratic-information problem. These are exact within the corresponding distributional assumptions.

# 5. Domain of applicability

The theory applies to repeated log-optimal investment with i.i.d. market outcomes and side information observed through a rate-limited channel. It is strongest in problems where the investor truly maximizes expected log growth and where side information can be idealized as a finite-rate message. The indirect rate-distortion characterization is rigorous, but it does not extend automatically to non-log utilities, transaction costs, feedback trading, or nonstationary markets. The local-efficiency results for horse-race markets are sharper than what is proved for general stock markets, so broad “investment information efficiency” interpretations should be read with that distinction in mind.
