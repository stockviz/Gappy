# Empirical Log-Optimal Portfolio Selections A Survey (2010)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_GyorfiOttucsak_2010.pdf>), 34 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Empirical Log-Optimal Portfolio Selections: A Survey
- **Author(s):** László Györfi, György Ottucsák
- **Year:** 2010
- **Journal/Venue:** survey / monograph-style paper

# 2. Problem statement

The paper surveys a precise family of problems: **how should one construct static, log-optimal, semi-log-optimal, and kernel-based empirical portfolio rules under memoryless and stationary ergodic market models, and what asymptotic guarantees are available?**

# 3. Approach (short)

The article is a structured survey rather than a single new theorem. It begins from static and constant-rebalanced portfolios, develops log-optimal and semi-log-optimal strategies for i.i.d. markets, then moves to stationary ergodic markets and data-driven nonparametric portfolio rules. The organizing device is the asymptotic growth rate $n^{-1}\log S_n$.

# 4. Approach (detailed)

1. **Notation and return representation**

   Prices $s_n$ are transformed into return vectors
   $$
   x_n^{(j)}=\frac{s_n^{(j)}}{s_{n-1}^{(j)}}, \qquad x_n\in\mathbb R_+^d.
   $$
   A portfolio vector lies in
   $$
   \Delta_d=\{b\ge 0,\ \sum_{j=1}^d b^{(j)}=1\}.
   $$

2. **Static and constantly rebalanced portfolios**

   A CRP with weight $b$ has wealth
   $$
   S_n(b)=\prod_{i=1}^n \langle b,x_i\rangle.
   $$
   Its asymptotic growth rate is
   $$
   W(b)=\lim_{n\to\infty}\frac1n\log S_n(b),
   $$
   when the limit exists.

3. **Log-optimal portfolio for memoryless markets**

   For i.i.d. returns $X_i$, the best CRP solves
   $$
   b^\star \in \arg\max_{b\in\Delta_d} \mathbb E[\log\langle b,X_1\rangle].
   $$
   This is the classical Kelly/Cover object. The survey reviews why its achieved growth equals the maximal long-run growth rate among CRPs.

4. **Semi-log-optimal approximation**

   The survey then introduces the semi-log-optimal rule, replacing $\log z$ by its quadratic approximation around $z=1$:
   $$
   \log z \approx (z-1)-\frac12(z-1)^2.
   $$
   Hence the semi-log portfolio solves
   $$
   \bar b^\star
   \in
   \arg\max_{b\in\Delta_d}
   \left\{
   \mathbb E[\langle b,X\rangle-1]
   -
   \frac12 \mathbb E[(\langle b,X\rangle-1)^2]
   \right\}.
   $$
   The survey stresses two advantages: easier computation and dependence only on low-order moments.

5. **Stationary ergodic markets and universal consistency**

   The survey defines universal consistency of a data-driven strategy $B$ by
   $$
   \lim_{n\to\infty}\frac1n\log S_n(B)=W^\star
   \quad\text{a.s.}
   $$
   for every process in the target class. It reviews Algoet’s existence theorem and the kernel-based constructions of Györfi, Lugosi, and Udina.

6. **Kernel-based empirical strategies**

   The empirical rule uses a family of experts indexed by window length $k$ and bandwidth/radius $\ell$. Each expert matches the current past to similar historical windows and optimizes a local criterion on the matched sample. For the kernel log-optimal strategy the criterion is empirical average log return; for the semi-log variant it is the semi-log objective. The aggregate portfolio is a wealth-weighted mixture of experts.

7. **Main surveyed theorem**

   The survey reports universal consistency for the kernel-based log-optimal strategy for stationary ergodic return processes satisfying
   $$
   \mathbb E|\log X^{(j)}|<\infty.
   $$
   The proof ingredients are ergodic theorems, conditional distribution approximation, and expert aggregation. The semi-log replacement is an approximation and is not given the same exact log-optimality guarantee by this proof.

8. **Numerical evidence**

   A large part of the survey compares log-optimal and semi-log-optimal algorithms on NYSE data. The main empirical point is not a theorem but a computational one: semi-log optimization often delivers growth close to the log-optimal version at materially lower computational cost.

# 5. Domain of applicability

The survey covers long-only, frictionless sequential rebalancing under log-growth objectives. Its theoretical results are strongest for i.i.d. or stationary ergodic markets with integrability. The semi-log approximation is computationally attractive but is not an exact representation of log utility. The broadest “universal consistency” claims remain asymptotic and model-class dependent, so they should not be read as finite-sample robustness guarantees in real markets with costs and structural breaks.


## 6. Source scope and three different benchmarks

The local source is a 34-page survey by László Györfi and György Ottucsák. The library associates it with 2010, but the PDF's title page does not supply a dated journal citation. It surveys earlier work and includes numerical experiments; it should not be assigned a more precise publication venue without further bibliographic evidence.

The text distinguishes three opportunities that are easily conflated. A static buy-and-hold investment makes one initial allocation and never rebalances. A constant-rebalanced portfolio restores fixed fractions after each trading period. A general causal strategy changes its target using the observed return history. Their wealth processes and optimal comparators are different.

For buy-and-hold weights $b_j>0$ in every asset,

$$
S_n=S_0\sum_jb_j s_n^{(j)},
$$

and, if the individual limiting log-growth rates exist, the portfolio's limiting rate is the maximum constituent rate. Positive initial exposure to the eventual best grower suffices because fixed multiplicative weights disappear after taking $n^{-1}\log$. This statement concerns an asymptotic rate, not matching the best stock's final wealth or knowing which stock will become dominant.

For a CRP, $S_n=\prod_{t=1}^n b^\top X_t$. Rebalancing creates a different return process, and its growth rate can exceed that of every constituent. In an IID market, maximizing $E\log(b^\top X)$ identifies the best constant allocation. In a stationary dependent market, the oracle uses a conditional distribution given the past, so a causal strategy can improve on every unconditional CRP.

## 7. Typical growth and expected wealth

For IID returns and a fixed allocation,

$$
\frac1n\log S_n\to E\log(b^\top X),\qquad
E[S_n]=(b^\top E[X])^n.
$$

Jensen's inequality gives $E\log(b^\top X)\le\log E[b^\top X]$, with strict inequality when portfolio gross return is nonconstant and the expectations exist. The survey's intuitive statement that wealth is “close” to its typical exponential trajectory should be understood on the logarithmic scale. Convergence of $n^{-1}\log S_n$ does not imply $S_n/\exp(nW)\to1$.

The cash-plus-volatile-stock example makes this distinction concrete. The stock independently doubles or halves with equal probability, while cash has gross return one. The stock has expected wealth $(5/4)^n$ but zero long-run log-growth rate. A half-stock, half-cash CRP has gross returns 1.5 and 0.75, producing

$$
W(1/2)=\frac12\log(1.5\times0.75)
=\frac12\log(9/8)\approx0.0589
$$

per period. The positive growth comes from repeated rebalancing under the specified distribution; it is not a general claim that volatility alone makes money.

The horse-race example gives $W(b)=\sum_jp_j\log(b_jo_j)$ when exactly one asset pays per race and the entire budget is allocated among the bets. Maximization gives $b_j=p_j$, since the payoff term is constant in $b$. This independence from odds is specific to this complete-allocation horse-race formulation. Adding cash or allowing a decision not to bet changes it. With fair odds $o_j=1/p_j$, the optimal growth is zero; other allocations have nonpositive growth, with equality for the optimum. The source's informal phrase that “any” strategy has negative growth should not include the optimum itself.

## 8. Semi-log optimization: moment compression, not exact log utility

Let simple returns be $R=X-\mathbf1$. Since $\mathbf1^\top b=1$, portfolio gross return is $1+b^\top R$. The Taylor criterion is

$$
E[h(b^\top X)]=b^\top m-\frac12 b^\top M b,
\qquad m=E[R],\quad M=E[RR^\top].
$$

The quadratic term uses the **raw second moment**, $M=\operatorname{Cov}(R)+mm^\top$, not covariance alone. Replacing it with covariance gives a different mean–variance objective. Sample means and second moments can be precomputed, so subsequent quadratic-program iterations need not scan the full history. The empirical matrix can be singular when there are few matched observations; the source explicitly flags that its chosen solver expects positive definiteness even though the mathematical problem only needs positive semidefiniteness.

The identity

$$
h(z)=\frac12-\frac12(z-2)^2
$$

also shows a limitation: this quadratic approximation penalizes sufficiently large positive gross returns, whereas log utility remains increasing. The identity is a least-squares characterization, not conventional principal-component analysis despite the source's informal terminology.

A useful error interpretation follows directly from Taylor's theorem. If $|b^\top R|\le\rho<1$ uniformly over feasible allocations, then

$$
|\log(1+b^\top R)-h(1+b^\top R)|
\le\frac{|b^\top R|^3}{3(1-\rho)^3}.
$$

If the expected approximation error is bounded uniformly by $\epsilon$, optimizing the quadratic criterion loses at most $2\epsilon$ in expected log growth relative to optimizing the exact criterion. This is an explanatory consequence of a uniform approximation bound, not an additional theorem reported in the survey. It explains why small daily returns can make the approximation effective while large negative returns or leverage can undermine it.

The survey's stated universal-consistency proof is for the **kernel log-optimal** strategy. It does not establish exact attainment of the log oracle $W^*$ merely by replacing every expert's objective with the quadratic approximation. A persistent approximation bias does not vanish just because the sample becomes large.

## 9. The stationary ergodic oracle and proof structure

The benchmark conditional strategy maximizes

$$
E[\log(b^\top X_n)\mid X_1,\ldots,X_{n-1}].
$$

Its limiting growth is expressed through conditioning on the infinite past of a two-sided stationary process. The survey states that no admissible causal competitor has a larger asymptotic log-growth rate under the stated integrability conditions. Its elementary proof uses a uniform second-moment condition on conditional log returns to apply a martingale-difference strong law. This proof condition should not be confused with the weaker componentwise log-integrability condition quoted for the separate universal kernel theorem.

The proof decomposes log returns into conditional expectations plus martingale differences. Conditional optimality orders the expectation terms period by period; the time average of the martingale differences vanishes. This shows why conditional one-step maximization is appropriate for frictionless logarithmic wealth: log wealth is additive and current allocation does not change the exogenous future return law or a future trading-cost state.

Stationary ergodicity is a strong scope condition. It allows dependence and does not require IID returns, but it does not cover every structural-break process. The theorem supplies asymptotic consistency, with no finite-sample rate promised for arbitrary stationary ergodic laws.

## 10. Kernel experts and the exact aggregation identity

An expert indexed by memory length $k$ and radius $r_{k,\ell}$ finds past windows close to the latest $k$-return window. It maximizes the sum of log returns on the outcomes **following** those past windows. All historical outcomes used must precede the decision date. With no matches, the source uses equal weights. Increasing memory can reduce approximation bias but makes close historical matches rarer in the $dk$-dimensional state space.

For each fixed $k$, the theoretical radii approach zero along an infinite expert family. Every expert receives positive prior capital $q_{k,\ell}$. With wealth-proportional mixing,

$$
v_{n,k,\ell}=\frac{q_{k,\ell}S_{n-1}^{k,\ell}}
{\sum_{a,b}q_{a,b}S_{n-1}^{a,b}},\qquad
b_n=\sum_{k,\ell}v_{n,k,\ell}b_n^{k,\ell},
$$

frictionless aggregate wealth satisfies the exact telescoping identity

$$
S_n=\sum_{k,\ell}q_{k,\ell}S_n^{k,\ell}.
$$

It follows that $n^{-1}\log S_n\ge n^{-1}\log S_n^{k,\ell}+n^{-1}\log q_{k,\ell}$ for every expert. The fixed prior penalty vanishes, so the mixture asymptotically matches the best approximating expert. Conditional-distribution approximation as radius shrinks and memory grows then reaches the log oracle under the theorem's assumptions. This capital identity is special to exponent one in the wealth weights; arbitrary exponential learning-rate choices do not inherit it unchanged.

A practical finite family does not contain arbitrarily long memories and arbitrarily small radii. Its asymptotic comparator is therefore restricted. The experiments use $K=5$, $L=10$, uniform initial expert capital, and specified radii; their implementation should not be described as literally instantiating the infinite universal family.

## 11. Numerical evidence and internal inconsistencies

The main experiments use 23 stocks over 11,178 trading days ending in 2006, approximately 44 years. An older benchmark contains 36 stocks and 5,651 days ending in 1985. Price relatives are adjusted for dividends and splits. The source assumes divisible assets, availability at quoted prices, no market impact, and initially no costs. Price-taking by the investor does not logically imply market inefficiency, despite that wording in the source.

For the full-sample hindsight CRP, both exact-log and semi-log optimization produce reported annual yields around 24%, versus 20% for the best stock, Morris. Only four weights are substantial: Commercial Metals about 29.6%, HP about 3.0%, Kin Ark about 21.6%, and Morris about 45.7%. Kin Ark's weak standalone growth is compatible with a positive rebalanced weight because its joint return behavior matters. Reported runtimes are 935 seconds for the log search and three seconds for semi-log; these are historical implementation-specific timings, not universal complexity ratios.

The finite kernel semi-log mixture reports 116% annual yield on all 23 assets. Excluding four stocks the source labels relatively small—Sherwin-Williams, Kodak, Commercial Metals, and Kin Ark—reduces the result to 31% for the remaining nineteen. These exceptionally large frictionless results are therefore highly sensitive to the asset universe and should not be presented as a realistic scalable investment expectation.

Section 14 contains an inconsistency: surrounding prose gives a no-cost aggregate result of 137%, while Table 4 reports 124%. The table's expert and aggregation figures are the explicit numerical record used here. This disagreement should remain visible rather than silently selecting whichever number is more impressive.

## 12. Costs introduce a stateful control problem

After a return, the drifted weights are $\widetilde b_{n,j}=b_{n,j}x_{n,j}/(b_n^\top x_n)$. If proportional costs $c$ apply on both purchases and sales, the fraction $\omega_n$ of pretrade wealth left after rebalancing to $b_{n+1}$ solves

$$
1=\omega_n+c\sum_j|\widetilde b_{n,j}-\omega_n b_{n+1,j}|,
\qquad \frac{1-c}{1+c}\le\omega_n\le1.
$$

This self-financing equation accounts for costs shrinking the capital available to buy the new target. A shortcut based only on $\|b_{n+1}-b_n\|_1$ ignores price drift and the reduction in wealth.

The current allocation now affects future costs, so exact growth optimization is a dynamic-programming problem even when returns are first-order Markov. Algorithm 1 learns the frictionless portfolio and charges costs afterward. Algorithm 2 incorporates the immediate log cost into a one-step objective; the source explicitly calls it suboptimal and does not claim global control optimality.

At $c=0.0015$, Table 4 reports 23-asset aggregate annual yields of 24% and 29% for Algorithm 1 under separate-expert-wealth and aggregate-portfolio accounting, compared with 68% and 73% for Algorithm 2. On nineteen assets, Algorithm 1 becomes −19% or −15%, while Algorithm 2 yields 13% or 17%. Separate expert accounts pay for their own trades; a single aggregate account can net opposing trades and pays costs on its combined portfolio. The frictionless equality between these constructions therefore no longer holds.

These experiments make costs central to the practical conclusion. The survey supplies clear asymptotic ideas and useful computational approximations, but neither a costless universal theorem nor a strong gross backtest establishes globally optimal, cost-aware investment in a changing real market.
