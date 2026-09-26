# Nonparametric Kernel-Based Sequential Investment Strategies (2006)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_GyorfiLugosiUdina_2006.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Nonparametric Kernel-Based Sequential Investment Strategies
- **Author(s):** László Györfi, Gábor Lugosi, Frederic Udina
- **Year:** 2006
- **Journal/Venue:** *Mathematical Finance*

# 2. Problem statement

The paper asks whether one can construct sequential investment rules that are **universal with respect to the log-optimal growth rate under stationary and ergodic market processes**, while using only nonparametric estimation of the unknown conditional law of returns.

# 3. Approach (short)

The method is nonparametric prediction plus expert aggregation. The authors define the log-optimal strategy as the portfolio maximizing conditional expected log return given the past, then approximate this object using histogram- and kernel-based local estimators on lagged return histories. A countable family of such experts is combined by wealth-weighting. The main theorems prove almost-sure convergence of the achieved growth rate to the optimal one under stationarity and ergodicity.

# 4. Approach (detailed)

1. **Market and wealth**

   Let $X_t\in\mathbb R_+^d$ be the vector of price relatives. A portfolio $b_t\in\Delta_d$ produces wealth
   $$
   S_n = \prod_{t=1}^n b_t^\top X_t,
   \qquad
   W_n = \frac{1}{n}\log S_n.
   $$

2. **Log-optimal benchmark**

   For a stationary ergodic process, the ideal strategy is the measurable rule $b^\star(\cdot)$ maximizing conditional expected log growth:
   $$
   b^\star(x_{-\infty}^{t-1})
   \in
   \arg\max_{b\in\Delta_d}
   E\big[\log(b^\top X_t)\mid X_{-\infty}^{t-1}=x_{-\infty}^{t-1}\big].
   $$
   Its asymptotic growth rate is $W^\star$. This is the target the paper wants to match without knowing the data-generating law.

3. **Elementary experts**

   For fixed memory length $k$ and smoothing parameter $h$, an elementary expert uses past windows $X_{t-k}^{t-1}$, finds historically similar windows, and chooses the portfolio $b$ maximizing the empirical average of $\log(b^\top X_s)$ over those matched histories. Histogram and kernel versions differ only in how they localize “similar” histories.

4. **Aggregation**

   Let $H^{(k,h)}$ denote an expert strategy. The final portfolio is a wealth-weighted combination over a countable family of such experts:
   $$
   b_t = \sum_{k,h} q_{k,h,t}\, b_t^{(k,h)},
   $$
   where the weights $q_{k,h,t}$ are proportional to the wealth accumulated by each expert up to time $t-1$, times an initial prior.

5. **Universality theorems**

   The main results show that both the histogram-based and kernel-based aggregated schemes are universal under stationarity and ergodicity:
   $$
   \liminf_{n\to\infty} \frac{1}{n}\log S_n \ge W^\star
   \qquad \text{a.s.}
   $$
   Since $W^\star$ is the maximal attainable asymptotic growth rate, equality follows.

6. **Why the proof works**

   Two ingredients matter:

   - nonparametric conditional estimation becomes consistent under ergodicity;
   - expert aggregation guarantees the combined strategy asymptotically performs at least as well as the best expert in the countable family.

   By choosing a dense enough family of memories and bandwidths, one approximates the log-optimal strategy arbitrarily well.

7. **What is exact and what is approximate**

   The benchmark $W^\star$ is exact. The expert construction is approximate at finite $n$, but the convergence theorem is asymptotic and almost sure. The computational implementation requires solving many small log-optimal portfolio problems over local subsamples.

# 5. Domain of applicability

- The theory applies to **stationary ergodic markets**.
- It targets the full-information conditional growth optimum under statistical assumptions, whereas adversarial CRP regret targets a different, narrower comparator without those assumptions.
- The asymptotic guarantee says nothing about finite-sample turnover, drawdowns, or implementability with costs.
- The method is most relevant when the investor believes return dynamics contain exploitable local dependence in lagged histories.

## 6. Causal local estimation and exact wealth aggregation

The source is *Mathematical Finance* 16(2), April 2006, 337-357. The histogram strategy reviewed in Section 2 is earlier work; the new contribution is the kernel family and its theoretical and empirical analysis. A uniform-kernel expert finds past indices $i<n$ for which the preceding $k$ market vectors are close to the current length-$k$ context. It uses the *successor* $X_i$ of each matched context as the local training response. Matching directly on the target $X_n$ would introduce look-ahead bias.

For weights $K_i\ge0$, the local problem is

$$
\max_{b\in\Delta_d}\sum_{i<n}K_i\log(b^\top X_i).
$$

It is concave in $b$. Its gradient is $\sum_iK_iX_i/(b^\top X_i)$ and its negative Hessian is a positive-semidefinite sum of outer products. The optimizer need not be unique in weights if returns are redundant; what matters for growth is the achieved portfolio payoff. Empty matching sets require a defined fallback allocation.

A positive prior $q_j$ allocates initial capital to each expert. At time $t$, expert capital fractions are $q_jS_{t-1}^j/\sum_lq_lS_{t-1}^l$. Then

$$
S_t=\sum_jq_jS_t^j,\qquad
\frac1t\log S_t\ge\frac1t\log S_t^j+\frac1t\log q_j.
$$

This exact self-financing mixture identity is the entire aggregation guarantee. It is not valid if expert weights are recomputed using future terminal wealth, and it changes when trades incur costs.

## 7. What universality does and does not require

Theorem 3.1 establishes universality for the moving-window scheme under stationary ergodicity and $E|\log X^{(j)}|<\infty$ for every asset. The proof combines recurrence/ergodic averages at fixed context resolution, increasingly fine localization, increasingly long memory, and the mixture's lower bound. All relevant experts must retain positive prior mass. The generalized-kernel theorem imposes conditions on the kernel family; the theorem is not a license to choose arbitrary signed or nonlocal smoothing weights.

The growth target is the best strategy that knows the law and uses the full past. It is generally richer than the best constant rebalanced portfolio, because dependence can make the optimal position change with history. Under independence there is no additional predictive content in lagged returns and the conditional target reduces accordingly. The theorem allows dependent markets but gives no distribution-free rate at which that dependence can be learned.

An infinite expert family is essential to the stated approximation argument. A fixed finite grid is a practical approximation and is not automatically universal over every stationary ergodic process. Neither the theorem nor ergodicity supplies a drawdown bound, a finite-sample Sharpe ratio or a turnover bound.

## 8. Empirical design and decisive caveats

The NYSE experiment uses 36 assets and 5,651 daily observations over 22 years ending in 1985. It uses five memory lengths, ten smoothing settings and an additional whole-history expert. The histogram method is computationally impractical at full 36-dimensional size, while the kernel version is run on the full universe. On the contemporary Xeon 2 GHz computer, the authors report about eight seconds per portfolio computation on average.

Table 4.1 reports final wealth of about $5.627\times10^8$ for one kernel specification versus 250.6 for the hindsight best CRP. The paper itself emphasizes that the explosive outcome is largely associated with one stock, Kin Ark. Removing it reduces that strategy's reported final wealth to 753.76. Such concentration in the source of performance is a crucial empirical finding, and prevents treating the headline result as diversified evidence across independent opportunities.

The currency experiment covers eight currencies against the US dollar, March 25, 1988-March 27, 2003, with 3,914 observations. Table 4.3 reports final wealth of 143.6 for one kernel setting, 48.95 for the histogram strategy, and 3.635 for the hindsight constant portfolio. The study also partitions capital across all asset pairs or triples to reduce computational burden. It explicitly states that those simplified variants do not inherit a universality guarantee for the full market.

Transaction costs are excluded from the main theorem but included in numerical variants. The paper gives a useful impossibility argument: a predictable market that alternates the only surviving asset requires a full switch every period to achieve frictionless optimal growth; any positive switching fee makes that frictionless growth unattainable. Stationarity alone cannot remove that economic loss. The authors also explicitly assume unlimited divisibility, available quantities and no price impact, and acknowledge that spectacular growth would violate the small-investor assumption in real markets.

## 9. A disciplined reproduction

Store past contexts and their subsequent returns, update each expert using only information available before the next trade, aggregate with prior wealth, and use log wealth internally to avoid overflow. Evaluate the whole specified expert grid rather than reporting only a hindsight winner. Keep a holdout period for choices such as kernel scale, memory range and asset universe; the asymptotic theorem does not protect against researcher selection among backtests.

For practical use, inspect which securities and dates produce the growth, corporate-action and stale-price treatment, fraction of dates with few matches, turnover and net execution costs. The contrast with the 2007 semi-log follow-up is precise: this paper uses the full log objective and proves exact asymptotic growth consistency; replacing log by a quadratic generally leaves an explicit approximation gap. The central methodological contribution is a causal nonparametric path from lagged market contexts to portfolio decisions, with assumptions and implementation costs kept visible.
