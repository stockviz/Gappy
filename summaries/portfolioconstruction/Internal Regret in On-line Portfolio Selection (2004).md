# Internal Regret in On-line Portfolio Selection (2004)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_StoltzLugosi_2004.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Internal Regret in On-line Portfolio Selection
- **Author(s):** Gilles Stoltz, Gábor Lugosi
- **Year:** 2004
- **Journal/Venue:** Working paper / manuscript

# 2. Problem statement

The paper asks whether online portfolio strategies can satisfy a stronger benchmark than external regret: **can one design sequential investment rules whose cumulative performance has vanishing internal regret, while still achieving wealth almost as large as the best constant rebalanced portfolio?** Internal regret means the investor should not wish, ex post, that every time one action was used it had been replaced by another.

# 3. Approach (short)

The method imports regret theory from sequential prediction into online portfolio selection. The authors define portfolio analogues of external and internal regret in terms of logarithmic wealth, construct finite and continuum classes of “swap” transformations on portfolio rules, and then apply calibrated/internal-regret-minimizing prediction algorithms to these transformed experts. Some of the resulting strategies also retain CRP-competitiveness.

# 4. Approach (detailed)

1. **External regret benchmark**

   Standard universal portfolios minimize
   $$
   \log S_T^\star - \log S_T,
   $$
   where $S_T^\star$ is the wealth of the best CRP. This is the portfolio analogue of external regret.

2. **Internal regret**

   Internal regret is stronger in the standard linear-loss prediction setting, but pairwise portfolio internal regret alone need not imply external CRP competitiveness. In prediction, it asks whether one regrets not replacing action $i$ by action $j$ whenever $i$ was chosen. In portfolio language, the paper defines transformations of a base strategy and compares realized log wealth under such systematic substitutions. A strategy has small internal regret if no such systematic replacement yields a linear improvement in cumulative log wealth.

3. **Reduction to fictitious experts**

   The authors build a pool of fictitious experts corresponding to action-swapping rules. Running an external-regret minimizer on this enlarged pool yields an internal-regret minimizer on the original problem. This is the classic Blackwell/Foster-Vohra construction adapted to portfolio payoffs.

4. **Portfolio implementation**

   The instantaneous payoff is logarithmic:
   $$
   \ell_t(w)=\log(w^\top x_t).
   $$
   The sequential strategy chooses a portfolio distribution over transformed experts, then computes a fixed point whose induced portfolio has the required internal-regret guarantee.

5. **Main result**

   The paper proves sublinear internal regret:
   $$
   \max_{\text{swap rules}} R_T^{int} = o(T).
   $$
   Moreover, some of the proposed strategies also maintain cumulative wealth close to that of the best CRP, so the stronger no-regret requirement does not destroy the classical universal-portfolio benchmark.

6. **Continuum extension**

   The paper then generalizes from finite expert sets to an uncountable class of portfolio rules using a Cover-style continuum mixture argument. This is conceptually important because the natural comparison class in portfolio selection is continuous.

7. **Proof logic**

   The proof is built from general regret theory:

   - external-regret algorithms for finite pools;
   - construction of swap experts;
   - fixed-point argument mapping expert mixtures back to portfolio allocations;
   - continuum generalization via mixture distributions over strategies.

   The novelty is the adaptation of internal regret to logarithmic-wealth payoffs.

# 5. Domain of applicability

- The results apply to **adversarial online portfolio selection**, not just stochastic markets.
- They are strongest when the benchmark of interest is richer than the best CRP and stability under action substitutions matters.
- The algorithms are more complex than standard external-regret universal portfolios.
- The principal regret theory omits transaction costs; the empirical appendix explicitly includes purchase-fee experiments, as detailed below.

## 6. Exact departure rule and the limits of the comparison

The local manuscript is dated November 19, 2004 and notes an extended abstract at COLT 2003. For portfolio $p_t$, the $i\to j$ departure moves all capital assigned to asset $i$ into asset $j$, leaving other weights unchanged:

$$
p_t^{i\to j}=p_t+p_{i,t}(e_j-e_i),\qquad
\widetilde R_{ij,n}=\sum_{t=1}^n\log\frac{(p_t^{i\to j})^\top x_t}{p_t^\top x_t}.
$$

The departure is applied to each portfolio the original strategy actually chose. It is not a complete counterfactual rerun of the learning algorithm with a changed history. Small internal regret means no fixed pairwise redirection would have generated exponentially greater wealth asymptotically.

Unlike the linear-loss prediction problem, pairwise internal regret in the nonlinear logarithmic portfolio game does **not** automatically imply small regret to the best asset or best constant rebalanced portfolio. Section 7 provides a counterexample: generalized buy-and-hold has bounded pairwise internal regret while a best stock can grow exponentially faster. This is why simultaneous internal and external guarantees are a substantive part of the paper, rather than an automatic consequence of the terminology “internal.”

## 7. Algorithms and quantitative guarantees

For the `b1exp` algorithm, use $\log(1+u)\le u$ to bound departures by linearized return advantages:

$$
\widetilde R_{ij,n}\le\sum_t p_{i,t}
\frac{x_{j,t}-x_{i,t}}{p_t^\top x_t}.
$$

Assuming all market relatives lie in $[m,M]$ with $m>0$, the resulting fictitious losses are bounded. Exponential weighting of pairwise deviations, coupled with a fixed-point portfolio computation, gives Theorem 4's bounds of order

$$
\widetilde R_n\le(M/m)\sqrt{n\log N},\qquad
\log\frac{S_n({\rm best\ CRP})}{S_n(p)}
\le N(M/m)\sqrt{n\log N}.
$$

The displayed constants correspond to the paper's tuned learning rate. Horizon-free variants use time-varying learning rates or the doubling device. Bounds deteriorate when the lower return bound becomes small. The main algorithm requires an $N\times N$ linear-system/fixed-point calculation at each date, not just the scalar exponentiated update of ordinary EG.

The `b2pol` construction weights positive cumulative internal regrets polynomially and chooses $p_t=\sum_{i\ne j}\Delta_{ij,t}p_t^{i\to j}$. Concavity of logarithm makes the average weighted departure advantage nonpositive at that fixed point. Its bound contains $\log(M/m)$ rather than $M/m$, but this better internal-regret constant does not supply the same CRP guarantee as `b1exp`.

Generalized buy-and-hold (`gbh`) instead uses the realized wealth of the fictitious departure strategies as weights. A telescoping identity gives

$$
S_n(p)=\frac1{N(N-1)}\sum_{i\ne j}S_n(p^{i\to j}),
$$

hence internal regret at most $\log[N(N-1)]$, independent of the horizon and market bounds. The modified `gbh2` adds the $N$ individual-stock strategies, giving both pairwise internal regret and regret to the best buy-and-hold stock bounded by $2\log N$. That benchmark is still narrower than all constant rebalanced portfolios.

Section 7.2 enlarges departures to $p\mapsto Ap$, where $A$ is any column-stochastic matrix. Each column specifies how one original asset allocation is redistributed. Constant maps include CRPs; a continuum mixture over these maps connects the richer internal-regret concept to Cover-style universalization. The departure class must therefore always be stated alongside a regret claim.

## 8. Experiments, costs and implementation

The appendix studies real stock data, daily and monthly rebalancing, random subsets of assets and several tuning parameters. It compares EG, the new exponential/polynomial rules, generalized buy-and-hold, Cover's algorithm, uniform buy-and-hold and hindsight constant portfolios. The authors report that `b1exp` generally performs best among the tested variants in accumulated wealth, with exceptions including the two-stock case, where EG performs well.

Contrary to the earlier summary, transaction costs are included in part of the experiments: purchases bear fees under the Blum-Kalai model, with reported cases of 2% for monthly rebalancing and 1% for daily rebalancing. Generalized buy-and-hold is competitive under high daily trading costs because it behaves closer to buy-and-hold. These simulations do not alter the frictionless mathematical regret benchmark or prove a general cost-aware regret theorem.

The useful distinction is between **stability to systematic portfolio redirection** and low turnover or low volatility. The former is what the regret definition measures; the latter require separate measurements. A strategy can satisfy an asymptotic logarithmic regret guarantee and still have large drawdowns or finite-horizon losses. A reproduction must update all fictitious wealth series causally, solve the fixed point accurately, maintain nonnegative normalized weights, and compute actual traded amounts after price drift when charging fees.
