# Portfolio Diversification and Value at Risk under Thick-Tailedness (2009)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioHeavyTails_Ibragimov_2009.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Portfolio Diversification and Value at Risk under Thick-Tailedness
- **Author(s):** Rustam Ibragimov
- **Year:** 2009
- **Journal/Venue:** *Quantitative Finance* 9(5), 565–580

# 2. Problem statement

The paper studies a precise question: **does greater portfolio diversification always lower Value at Risk when returns are heavy-tailed?** The answer is no. Under moderately heavy tails, diversification lowers VaR; under extremely heavy tails, diversification can increase VaR. The paper formalizes “more diversified” using majorization of portfolio weights.

# 3. Approach (short)

The method combines stable-law scaling, majorization theory, and shape restrictions such as symmetry and unimodality. Portfolio VaR is treated as a function of the weight vector $w$, and the paper characterizes when this function is Schur-convex or Schur-concave. Stable distributions provide the exact algebra; convolution and unimodality arguments extend the results beyond pure stable laws.

# 4. Approach (detailed)

1. **Portfolio and diversification order**

   Let
   $$
   Z_w=\sum_{i=1}^n w_i X_i,
   \qquad
   w\in\mathbb R_+^n.
   $$
   Often $w$ lies in the simplex
   $$
   I_n=\{w_i\ge 0,\ \sum_i w_i=1\}.
   $$
   Diversification is ordered by **majorization**. If $v\prec w$, then $v$ is more equal, hence more diversified, than $w$. The equal-weight vector is most diversified; a corner vector such as $(1,0,\dots,0)$ is least diversified.

2. **Risk measure**

   For a loss variable $X$, the paper uses
   $$
   \operatorname{VaR}_q(X)=\inf\{z\in\mathbb R:P(X>z)\le q\},
   \qquad q\in(0,1/2).
   $$
   The analysis focuses on how $\operatorname{VaR}_q(Z_w)$ changes with $w$.

3. **Stable-law scaling intuition**

   If $X_i$ are i.i.d. symmetric $\alpha$-stable, then
   $$
   \sum_{i=1}^n w_i X_i
   \overset d=
   \left(\sum_{i=1}^n w_i^\alpha\right)^{1/\alpha} X_1.
   $$
   Hence
   $$
   \operatorname{VaR}_q(Z_w)
   =
   \left(\sum_{i=1}^n w_i^\alpha\right)^{1/\alpha}
   \operatorname{VaR}_q(X_1).
   $$
   Everything therefore reduces to the Schur geometry of
   $$
   \phi_\alpha(w)=\sum_i w_i^\alpha.
   $$

   - If $\alpha>1$, then $\phi_\alpha$ is Schur-convex, so more equal weights reduce VaR.
   - If $\alpha<1$, then $\phi_\alpha$ is Schur-concave, so more equal weights increase VaR.
   - If $\alpha=1$, the Cauchy boundary case, VaR is independent of $w$.

4. **Theorem 4.1: diversification helps under moderate tails**

   The paper defines a broad class $CSLC$ containing, among others, convolutions of symmetric log-concave distributions and symmetric stable laws with $\alpha\in(1,2]$. For $X_i$ i.i.d. in this class,
   $$
   v\prec w,\ v\not\sim w
   \quad\Longrightarrow\quad
   \operatorname{VaR}_q(Z_v)<\operatorname{VaR}_q(Z_w).
   $$
   Equivalently, $w\mapsto \operatorname{VaR}_q(Z_w)$ is strictly Schur-convex.

   The intuition is that, with finite mean and not-too-heavy tails, aggregation reduces tail exposure in the usual sense.

5. **Theorem 4.2: diversification hurts under extreme tails**

   For the class $CS(1)$, which includes symmetric stable laws with tail index $\alpha<1$, the ordering reverses:
   $$
   v\prec w,\ v\not\sim w
   \quad\Longrightarrow\quad
   \operatorname{VaR}_q(Z_v)>\operatorname{VaR}_q(Z_w).
   $$
   Hence $w\mapsto \operatorname{VaR}_q(Z_w)$ is strictly Schur-concave.

   Example: for Lévy-stable $\alpha=1/2$, equal weighting can have larger VaR than holding a single asset. This is not a pathology of estimation; it is a structural feature of extremely heavy tails.

6. **Boundary case $\alpha=1$**

   For symmetric Cauchy risks,
   $$
   Z_w \overset d= X_1
   \qquad\text{for all }w\in I_n,
   $$
   so
   $$
   \operatorname{VaR}_q(Z_w)=\operatorname{VaR}_q(X_1)
   $$
   independently of diversification. This is the dividing line between the two regimes.

7. **How the extension beyond pure stable laws works**

   The exact stable-law scaling proves the result for stable distributions. The broader classes are handled by combining:

   - majorization results for tail probabilities;
   - symmetry and unimodality;
   - closure under convolution;
   - a comparison principle for VaR under convolution (Appendix A, Proposition A.6).

   So the proof is not “all heavy tails behave like stable laws.” Rather, stable laws give the clean scaling, and unimodality/convolution arguments transport the VaR orderings to broader classes.

8. **Dependent and heterogeneous extensions**

   Theorems 5.1 and 5.2 extend the logic to some dependent stable settings. Appendix C further develops heterogeneous/skewed-risk analogues using majorization of powers $(w_1^r,\dots,w_n^r)$. These results preserve the same threshold logic: the tail index controls whether diversification lowers or raises VaR.

9. **Economic meaning**

   The paper shows that the slogan “diversification is always good” depends on the risk measure. For VaR:

   - with moderate tails, the classical intuition survives;
   - with extreme tails, aggregation can load more heavily on rare large losses.

   This is one of the cleanest mathematical explanations of why VaR is not a coherent risk measure in heavy-tailed environments.

**Additional mathematical details**

For the stable benchmark case, the mechanism is exact. If $X_i$ are i.i.d. symmetric $\alpha$-stable with common scale $\gamma$, then
$$
\sum_{i=1}^n w_i X_i
\sim
S_\alpha\!\left(\gamma\Big(\sum_{i=1}^n |w_i|^\alpha\Big)^{1/\alpha}\right),
$$
so any fixed-tail quantile, and hence VaR at a fixed confidence level, is proportional to
$$
\Big(\sum_{i=1}^n |w_i|^\alpha\Big)^{1/\alpha}.
$$
Because $x\mapsto x^\alpha$ is convex for $\alpha>1$ and concave for $\alpha<1$, this scale factor is Schur-convex in the weights when $\alpha>1$ and Schur-concave when $\alpha<1$. That is the exact source of the paper’s “diversification helps” versus “diversification hurts” split.

The broader theorems extend this beyond pure stable laws by using symmetry, unimodality, and convolution ordering to preserve the same Schur-shape conclusions for VaR. So the stable model is not just an illustration; it is the clean algebraic core from which the more general majorization results are motivated.

# 5. Domain of applicability

- The strongest results apply to **symmetric i.i.d. risks** in stable/log-concave/convolution classes.
- The paper is specifically about **VaR**, not expected shortfall. Expected shortfall can behave differently.
- The exact threshold results rely on heavy-tail shape restrictions, especially stable-law-type scaling.
- If dependence is arbitrary, tails are asymmetric, or one uses a different diversification order, the theorems no longer apply automatically.
- The paper’s substantive claim is narrower than “diversification fails”: it says **VaR-based diversification rankings can reverse under sufficiently heavy tails**.

# 6. Majorization, scaling, and exact examples

The article is *Quantitative Finance* 9(5), 565–580, DOI 10.1080/14697680802629384. Its tail probability parameter $q$ is an exceedance probability, so $q=0.01$ corresponds to the familiar 99% quantile. This convention prevents accidentally reversing the relevant tail when applying the theorems.

To check majorization, sort weights decreasingly. Then $v\prec w$ means $\sum_{i=1}^kv_{(i)}\leq\sum_{i=1}^kw_{(i)}$ for $k<n$, with equal total sums. It is a partial order: two portfolios can be incomparable. The theorem gives no ranking for incomparable weights without further calculation. Independence and identical distributions make permutations economically equivalent; with heterogeneous assets, moving a large weight between names is not innocuous.

For equal weights in the symmetric stable benchmark,
$$
\operatorname{VaR}_q\left(\frac1n\sum_iX_i\right)
=n^{1/\alpha-1}\operatorname{VaR}_q(X_1).
$$
At $\alpha=2$, this is the Gaussian $n^{-1/2}$ reduction. At $\alpha=1.5$, it is $n^{-1/3}$, a slower reduction despite infinite variance. At $\alpha=1$, there is no reduction. At $\alpha=1/2$, the factor is $n$: averaging ten independent risks has ten times the single-risk VaR. The paper separately gives a one-sided Lévy example with index $1/2$; that distribution is skewed, unlike the symmetric baseline theorem.

Thus the relevant threshold is not finite versus infinite variance. Stable laws with $1<\alpha<2$ have infinite variance but still exhibit the diversification ordering. The reversal occurs below the finite-first-absolute-moment threshold. A covariance-based explanation cannot capture it because covariance is unavailable in much of the regime being analyzed.

# 7. Distribution classes and what the extensions require

The source distinguishes overlined and underlined $CS(r)$ classes. The first convolves symmetric stable variables with indices above $r$; the second uses indices below $r$. Losing those typographical bars in extraction makes the notation ambiguous. In this summary the extreme-tail $CS(1)$ reference means the **below-one** class. $CSLC$ consists of convolutions of symmetric log-concave components and symmetric stable components with indices greater than one.

A sum of stable variables with different indices is generally not stable. The extension therefore needs more than the simple scaling formula. Symmetry and unimodality permit peakedness comparisons to survive convolution: if each component is more concentrated about zero in the appropriate tail order, adding independent symmetric unimodal components preserves that order. This transports the majorization conclusion from building blocks to the broader convolution classes.

The dependence extension uses joint $\alpha$-symmetric distributions with characteristic function
$$
\phi(t)=\psi\left(\left(\sum_i|t_i|^\alpha\right)^{1/\alpha}\right).
$$
The exponent in this geometric symmetry need not equal the marginal tail index. A spherically symmetric stable vector can have very heavy marginal tails but still has symmetry exponent two. Consequently dependence structure can preserve diversification benefits even when an independent model with similar marginal tails gives the opposite result. “Tail index below one” is not, by itself, a universal prescription to concentrate an arbitrarily dependent portfolio.

A useful covered common-factor form is $X_i=ZY_i$, with nonnegative $Z$ independent of identically distributed stable $Y_i$. The common random scale induces dependence, while retaining a tractable norm-based law for weighted sums. Arbitrary copulas, asymmetric common shocks, or name-specific scales require the specialized extensions or separate analysis.

# 8. VaR coherence and asymptotic versus global statements

For independent identical stable risks, positive homogeneity gives
$$
\frac{\operatorname{VaR}_q(X_1+X_2)}{\operatorname{VaR}_q(X_1)+\operatorname{VaR}_q(X_2)}=2^{1/\alpha-1}.
$$
This directly identifies subadditivity above one and superadditivity below one. The paper's main class results are stronger than an extreme-tail approximation: they hold throughout $q\in(0,1/2)$ under their distributional assumptions. For more general regularly varying tails, an analogous ratio is obtained as $q\downarrow0$; it does not automatically establish the same ranking at every finite confidence level.

There is no contradiction with the usual convex-order benefit of averaging integrable independent risks. In the extreme-tail cases, many expectations required for those convex-utility comparisons are infinite. Expected shortfall may likewise be infinite when the upper loss tail has index at most one. Replacing VaR with expected shortfall is not automatically a finite, informative solution in this regime.

# 9. Practical scope

The paper establishes distributional results rather than estimating an optimal equity allocation or conducting a historical portfolio backtest. Its cited applications include operational, catastrophe and innovation risks, where exceptionally heavy tails are more plausible than in bounded simple long-only asset losses. A symmetric stable model permits arbitrarily large positive and negative values and must be connected carefully to whether the variable represents a loss, a payoff, or a return.

Tail-index estimation is difficult precisely near the economically important threshold. The source discusses small-sample bias and sensitivity of Hill and log-rank regressions. A point estimate should not be treated as proof of membership in one of the theorem's convolution classes. Truncating tails can also restore moments while leaving economically relevant finite-quantile behavior similar over a range. Application should therefore include uncertainty about both tail shape and dependence, and should distinguish reweighting a fixed capital exposure from merely adding more independent risks without normalization.
