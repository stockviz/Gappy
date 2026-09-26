# The Growth of Relative Wealth and the Kelly Criterion (2018)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_LoOrrZhang_2018.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** The Growth of Relative Wealth and the Kelly Criterion
- **Author(s):** Andrew W. Lo, H. Allen Orr, Ruixun Zhang
- **Year:** 2018
- **Journal/Venue:** *Journal of Bioeconomics*

# 2. Problem statement

The paper asks when the Kelly criterion remains optimal once the objective shifts from absolute wealth to **relative wealth**. Formally: **if an investor cares about her wealth share relative to another investor rather than about $E[\log W_T]$ alone, how does the optimal leverage or risky allocation deviate from the Kelly fraction, and how does this depend on initial market share?**

# 3. Approach (short)

The method is an evolutionary two-investor portfolio-growth model. The paper compares the classic Kelly solution for maximizing expected log wealth with the solution to maximizing expected relative wealth, both myopically and over longer horizons. The analysis yields explicit propositions showing that relative-wealth optimality generally does not coincide with Kelly, and that the deviation depends on the opponent’s behavior and the investor’s current market share.

# 4. Approach (detailed)

1. **Absolute-wealth benchmark**

   Let $f$ be the investor’s risky allocation and $g$ the competitor’s. If the gross return on the investor’s portfolio is $\omega_t(f)$, the Kelly problem maximizes
   $$
   E[\log \omega_t(f)]
   $$
   or the long-run sum of such terms. The optimal $f^{Kelly}$ is the standard growth-optimal choice.

2. **Relative wealth**

   Let $W_t^f$ and $W_t^g$ be the two investors’ wealth levels and define the relative-wealth share
   $$
   q_t = \frac{W_t^f}{W_t^f + W_t^g}.
   $$
   The new objective is to maximize $E[q_T]$ or $E[q_1]$, not $E[\log W_T^f]$.

3. **Why the objective changes the solution**

   Relative wealth depends on both portfolios simultaneously:
   $$
   q_{t+1} = \frac{q_t \omega_t(f)}{q_t\omega_t(f)+(1-q_t)\omega_t(g)}.
   $$
   The denominator means the investor’s optimal policy now depends on the competitor’s behavior and the current share $q_t$. Kelly’s separability is lost.

4. **Main propositions**

   The paper proves several monotonicity and local-comparison results:

   - if the investor maximizes relative wealth, the optimizer need not equal $f^{Kelly}$;
   - the deviation depends on the competitor’s allocation $g$;
   - the sign of the deviation depends on initial relative wealth $\lambda=q_0$.

   In particular, a dominant investor and a minor investor may optimally deviate from Kelly in opposite directions when competing against the same opponent.

5. **Interpretation**

   Kelly is optimal for absolute-growth maximization because only the investor’s own multiplicative process matters. Relative-wealth maximization is a competitive or evolutionary criterion. The investor trades off growth against relative position versus the opponent. This makes initial market power a state variable.

6. **Proof sketch**

   For the one-period problem, the paper differentiates the expected relative-wealth objective
   $$
   E\!\left[
   \frac{\lambda \omega(f)}
   {\lambda \omega(f)+(1-\lambda)\omega(g)}
   \right]
   $$
   with respect to $f$ and compares the FOC to the Kelly FOC. The resulting derivative contains the opponent’s payoff $\omega(g)$ and the initial share $\lambda$, which is exactly why the solution shifts away from Kelly unless special symmetry conditions hold.

7. **What is novel**

   The novelty is conceptual and mathematical: portfolio growth theory changes materially when the objective is relative rather than absolute. The Kelly criterion emerges only as a special case of the broader evolutionary problem.

# 5. Domain of applicability

- The analysis applies to **competitive wealth dynamics** where investors care about market share or relative standing.
- It is not a replacement for Kelly in standard single-investor welfare problems.
- The model is stylized, with a small number of assets and investors, but it cleanly isolates the effect of relative-wealth objectives.
- The main limitation is that relative wealth is only one possible social or institutional objective; the paper does not claim it is universally relevant.

# 6. Exact one-period comparative statics

The formal main model uses two assets with positive gross payoffs $(X_a,X_b)$ and constant allocations $f,g\in[0,1]$. Portfolio payoffs are $\omega_f=fX_a+(1-f)X_b$ and similarly for $g$. The assets' joint distribution repeats independently across periods. There are no price-impact or strategic return effects: the opponent's allocation is treated as given.

Write $D=\lambda\omega_f+(1-\lambda)\omega_g$ and $\Delta=X_a-X_b$. Direct differentiation gives
$$
\frac{\partial E q_1}{\partial f}=\lambda(1-\lambda)E\left[\frac{\Delta\omega_g}{D^2}\right],\quad
\frac{\partial^2 E q_1}{\partial f^2}=-2\lambda^2(1-\lambda)E\left[\frac{\Delta^2\omega_g}{D^3}\right]\leq0.
$$
Thus the first-period problem is concave; endpoint derivative signs identify corner optima, and an interior optimum solves the stated first-order condition. At $f=g$, the first derivative reduces to $\lambda(1-\lambda)E[\Delta/\omega_g]$, the Kelly derivative up to a positive factor. This proves the paper's global directional comparison: if $g$ is below Kelly, the best response exceeds $g$; if $g$ is above Kelly, the best response falls below $g$. It does **not** say the response must always lie between $g$ and Kelly.

At an interior Kelly point, implicit differentiation yields an especially useful local result:
$$
\left.\frac{df_1^*}{dg}\right|_{g=f^K}=\frac{2\lambda-1}{2\lambda}.
$$
This follows by dividing the cross derivative by minus the second derivative. A dominant investor ($\lambda>1/2$) partly follows the opponent's deviation; a small investor ($\lambda<1/2$) deviates on the opposite side of Kelly. Equal initial wealth makes the first-order response zero. These are local statements; Figure 1(b) deliberately illustrates that extrapolation far from Kelly can fail.

# 7. Finite horizons and the numerical experiment

For a fixed allocation over $T$ periods,
$$
q_T=\left[1+\frac{1-\lambda}{\lambda}\exp\left\{\sum_{t=1}^T\log\frac{\omega_{g,t}}{\omega_{f,t}}\right\}\right]^{-1}.
$$
The logarithm of the wealth ratio is additive, but taking its logistic transform and then its expectation changes the objective. Maximizing expected log *relative ratio* $E\log(W_f/W_g)$ would still give Kelly when $g$ is fixed; maximizing expected *share* $E[W_f/(W_f+W_g)]$ does not. This distinction is the paper's central economic mechanism.

The finite-horizon propositions retain the directional and local comparisons with Kelly, for constant $f$ and $g$. They do not solve a fully adaptive policy $f_t(q_t)$. Constant portfolio fractions also require rebalancing after relative asset-price movements, so “constant strategy” should not be confused with costless buy-and-hold.

In the source's illustration, asset $a$ has gross return $2$ or $0.5$, each with probability $1/2$, while asset $b$ returns $1$. Kelly invests $f^K=1/2$. For each possible count $k$ of up moves, the authors compute the share exactly and average it with binomial probability $\binom Tk2^{-T}$. Figures examine initial shares $0.2,0.5,0.8$ and horizons through $101$ periods. They show that finite-horizon optimal allocations need not converge toward Kelly as horizon increases, and that the neighborhood in which the local comparative statics are useful can matter substantially.

The paper proposes evolutionary biology experiments, such as varying payoff environments and initial population shares, as possible tests. These are proposed tests, not completed experiments or evidence from live investment portfolios.

# 8. A qualification to the printed infinite-horizon statement

For unequal expected log-growth rates $\mu(f)$ and $\mu(g)$, the law of large numbers supports the robust conclusion: the higher-growth investor's share tends to one, and the lower-growth investor's share tends to zero. It follows that, against a sub-Kelly opponent, many constant strategies can attain the same limiting share of one. Optimizing the limiting objective is not the same operation as taking limits of finite-horizon optimizers.

The source's Proposition 7 also prints $q_T\to\lambda$ whenever $\mu(f)=\mu(g)$. That equality case needs an additional condition and does not follow merely from equal expected log growth. A zero mean for the log-return difference only implies its *time average* tends to zero; its cumulative sum can still fluctuate on a $\sqrt T$ scale. The share remains exactly $\lambda$ when the two portfolios have identical realized payoffs, for example $f=g$. Equal geometric means alone do not imply identical payoffs.

For a concrete counterexample using the paper's own binary asset, take $f=0$ and $g=1$. Both have expected log growth zero, but the opponent's log wealth is a symmetric random walk with steps $\pm\log2$. Consequently the wealth share does not converge in probability to its initial interior value. This qualification preserves the strict-growth comparison while avoiding an unjustified conclusion in the tie case.

# 9. Interpretation and limits

Initial wealth affects incentives through the denominator of relative share, not through a change in the available return distribution. A large investor has more to lose from divergence; a small investor can benefit from a different exposure to outcomes. This resembles tournament incentives but the objective here is a smooth terminal share, not a prize for crossing a rank threshold.

Implementation requires the joint payoff distribution, the opponent allocation and initial share, plus a precise choice between fixed and dynamically adjusted allocations. The source assumes positive wealth factors so the log and derivative expressions exist. Leverage boundaries, shorting costs, financing and turnover would alter feasibility. The analysis provides exact and local results within a stylized competitive objective; it neither invalidates Kelly for logarithmic utility nor establishes that relative-share maximization is an appropriate welfare criterion for every investor.
