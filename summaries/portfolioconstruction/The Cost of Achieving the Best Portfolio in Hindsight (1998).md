# The Cost of Achieving the Best Portfolio in Hindsight (1998)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_OrdentlichCover_1998.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** The Cost of Achieving the Best Portfolio in Hindsight
- **Author(s):** Erik Ordentlich, Thomas M. Cover
- **Year:** 1998
- **Journal/Venue:** *Mathematics of Operations Research* / working-paper version dated 1997

# 2. Problem statement

Fix $m$ assets and horizon $n$. Let
$$
S_n^\star(x^n)=\max_{b\in\Delta_m}\prod_{t=1}^n b^\top x_t
$$
be the wealth of the best constant rebalanced portfolio (CRP) in hindsight. The paper asks: **what is the largest guaranteed fraction of $S_n^\star$ that any nonanticipating strategy can secure uniformly over all market sequences, and what strategy attains it?**

# 3. Approach (short)

The method is adversarial game theory plus combinatorial entropy bounds. Ordentlich and Cover cast the problem as a max-min game between the investor and the market, identify the exact value of the game, construct a horizon-dependent mixture of extremal strategies that attains it, and interpret the value both as the universalization cost of matching the hindsight CRP and as the price of a hindsight-allocation derivative.

# 4. Approach (detailed)

1. **Benchmark and guaranteed-performance ratio**

   For a market path $x^n=(x_1,\dots,x_n)$, the best hindsight CRP earns
   $$
   S_n^\star(x^n)=\max_{b\in\Delta_m}\prod_{t=1}^n b^\top x_t.
   $$
   A nonanticipating strategy $\hat b_t(x^{t-1})$ earns
   $$
   \hat S_n(x^n)=\prod_{t=1}^n \hat b_t^\top x_t.
   $$
   The object is the worst-case ratio
   $$
   \inf_{x^n}\frac{\hat S_n(x^n)}{S_n^\star(x^n)}.
   $$
   The optimal guarantee is the supremum over all strategies of this infimum.

2. **Exact value of the game**

   The main theorem identifies the game value as
   $$
   V_n
   =
   \left(
   \sum_{\substack{n_1+\cdots+n_m=n\\ n_i\ge 0}}
   \binom{n}{n_1,\dots,n_m}
   \prod_{i=1}^m \left(\frac{n_i}{n}\right)^{n_i}
   \right)^{-1}.
   $$
   Equivalently, using entropy,
   $$
   V_n^{-1}
   =
   \sum_{n_1+\cdots+n_m=n}
   e^{-nH(n_1/n,\dots,n_m/n)}
   \binom{n}{n_1,\dots,n_m}.
   $$
   This is exact, not asymptotic.

3. **Construct the optimal strategy**

   A related, horizon-free strategy averages terminal wealth over CRPs and uses the wealth-weighted posterior mean. This gives the universal-portfolio strategy
   $$
   \hat S_n=\int_{\Delta_m} S_n(b)\,d\pi(b)
   $$
   with prior $\pi$. Its next-period allocation is the wealth-weighted average of $b$. The exact minimax construction is different and is given in Section 6 below.

4. **Why the worst case reduces to Kelly sequences**

   The minimax argument shows it suffices to consider extreme market paths that at each date place all return on a single asset. Then the relevant statistic of the path is the count vector $(n_1,\dots,n_m)$ of how often each asset is the winner. For such a path the hindsight-CRP wealth is
   $$
   S_n^\star
   =
   \max_{b\in\Delta_m}\prod_{i=1}^m b_i^{n_i}
   =
   \prod_{i=1}^m \left(\frac{n_i}{n}\right)^{n_i},
   $$
   by the multinomial maximum achieved at $b_i=n_i/n$.

5. **Proof sketch of the value**

   The proof has two directions.

   - **Upper bound:** for any strategy, sum its wealth over all Kelly sequences with the same count vector structure. The terminal wealths sum to one over all unit-vector paths; summing the proposed guarantees then bounds the ratio by $V_n$.

   - **Lower bound / attainability:** the horizon-dependent extremal-strategy mixture assigns each winner sequence capital proportional to its maximum CRP likelihood. Coefficientwise comparison of the resulting wealth polynomials shows it attains $V_n$.

   This establishes the max-min ratio exactly.

6. **Asymptotics**

   Stirling approximation implies
   $$
   V_n \asymp n^{-(m-1)/2}
   $$
   up to constants depending on $m$. Therefore
   $$
   \frac{1}{n}\log V_n \to 0.
   $$
   So the cost of universality is only polynomial in $n$, whereas $S_n^\star$ is typically exponential in $n$. This is the precise asymptotic sense in which universal strategies match the hindsight CRP growth rate.

7. **Derivative-security interpretation**

   The paper also interprets $S_n^\star$ as the payoff of a “hindsight allocation option.” The exact quantity $1/V_n$ is then the minimal superhedging cost of delivering that payoff pathwise. This turns the universal-portfolio guarantee into an option-pricing statement.

# 5. Domain of applicability

The theorem applies in frictionless markets with no transaction costs, continuous divisibility, and comparison against the class of constant rebalanced portfolios. It is strongest in adversarial or model-free settings because the guarantee is pathwise. It does **not** say a strategy can match the best fully dynamic hindsight strategy; the benchmark is deliberately restricted to CRPs. The option-pricing interpretation is exact only in the idealized frictionless framework. In practical markets, rebalancing costs and leverage limits can easily dominate the polynomial universalization cost.

# 6. The finite-horizon strategy and its proof

A crucial distinction is between **the exact horizon-dependent minimax strategy** and a fixed-prior universal portfolio. The source proves the former by mixing *extremal switching strategies*, not by evaluating the ordinary uniform-prior integral over CRPs. The Dirichlet-half universal portfolio is an infinite-horizon strategy with the same polynomial order and a bounded multiplicative gap; it need not attain the exact finite-horizon value.

For an asset-index sequence $j^n=(j_1,\ldots,j_n)$, let $n_i(j^n)$ count the appearances of asset $i$, and define
$$
q_n(j^n)=V_n\prod_{i=1}^m\left(\frac{n_i(j^n)}n\right)^{n_i(j^n)},\qquad 0^0:=1.
$$
The combinatorial normalization in the main theorem is exactly the condition $\sum_{j^n}q_n(j^n)=1$. Assign initial capital $q_n(j^n)$ to a strategy that holds asset $j_t$ on date $t$. All these choices are scheduled at inception; no future price information is used. Their aggregate terminal wealth is
$$
\widehat S_n=\sum_{j^n}q_n(j^n)\prod_{t=1}^nx_{t,j_t}.
$$
The next-period weights are the fractions of aggregate current wealth scheduled for each next asset. More explicitly, with $q_n(j^t)$ denoting marginal probabilities,
$$
\widehat b_{t,k}=
\frac{\sum_{j^{t-1}}q_n(j^{t-1},k)\prod_{s<t}x_{s,j_s}}
{\sum_{j^{t-1}}q_n(j^{t-1})\prod_{s<t}x_{s,j_s}}.
$$
This gives equations (9)–(14) of the source in $m$-asset notation. It also exposes the horizon dependence: the marginal distribution changes when the intended terminal horizon changes.

For any constant portfolio $b$, expand its wealth as a polynomial:
$$
S_n(b)=\sum_{j^n}\left(\prod_i b_i^{n_i(j^n)}\right)\prod_tx_{t,j_t}.
$$
Every coefficient satisfies $\prod_i b_i^{n_i}\leq\prod_i(n_i/n)^{n_i}$. Since price relatives are nonnegative, this coefficientwise inequality implies $\widehat S_n\geq V_nS_n(b)$ simultaneously for every $b$, hence for the hindsight optimum. This is the lower-bound argument; it does not require a probability law for market returns.

For the matching upper bound, restrict nature to sequences of unit vectors $x_t=e_{j_t}$. A self-financing long-only strategy assigns a conditional probability to each successive winner, so its terminal wealths sum to one over all $m^n$ such sequences. If its ratio exceeded $V_n$ on every sequence, summing the inequalities would give $1>V_n\sum_{j^n}S_n^*(e_{j_1},\ldots,e_{j_n})=1$, a contradiction. Zero returns are allowed in this argument; with strictly positive relatives the same worst-case obstruction is approached by limits.

# 7. Scale of the cost and what it compares

For fixed $m$ and large $n$, the leading asymptotic is
$$
V_n\sim\frac{\Gamma(m/2)}{\sqrt\pi}\left(\frac2n\right)^{(m-1)/2}.
$$
Thus $-\log V_n$ grows approximately as $(m-1)\log n/2$, while its contribution to annualized or per-period log growth vanishes as $\log n/n$. The dimension $m-1$ is the number of independent CRP weights. This fixed-dimension asymptotic should not be applied unchanged when the number of assets grows rapidly with the sample horizon.

For a concrete finite example with two assets and two dates, the count terms in $V_2^{-1}$ are $1,1/2,1$, giving $V_2=0.4$. The minimax capital allocation across index sequences $(1,1),(1,2),(2,1),(2,2)$ is $(0.4,0.1,0.1,0.4)$. This illustrates why the exact strategy has a different prior construction from an arbitrary wealth-weighted CRP average.

The paper also shows why seemingly reasonable rules fail. Buy-and-hold can be wiped out by alternating winner assets; equal-weight CRP loses exponentially relative to a permanently winning asset; following yesterday's hindsight-best portfolio can be wiped out by a reversal. These examples explain the hedging role of retaining capital on many possibilities. They are worst-case constructions, not empirical predictions about typical returns.

# 8. Option interpretation, computation, and limitations

The inverse value is the tight **model-independent** initial-capital requirement for dominating the best-CRP payoff on every allowed path. The paper separately studies option pricing in specified binomial and diffusion models. A model-specific arbitrage price need not equal this universal superhedging bound, because those models restrict admissible paths and supply state prices absent from the adversarial game.

Literal implementation with $m^n$ accounts is an existence proof, not an efficient large-universe implementation. Symmetry and count-based recursions can reduce computation; a Dirichlet-half universal mixture provides a horizon-free alternative with a constant-factor guarantee. Approximating its integral introduces numerical error that the exact theorem does not cover automatically.

The result controls relative terminal wealth against frictionless constant-weight strategies. It imposes no absolute floor on wealth and no drawdown, volatility, turnover, or liquidity guarantee. Matching the comparator's exponential rate remains compatible with both portfolios losing money. Trading costs would change the wealth recursion and the comparator; simply subtracting a fixed cost after applying this theorem is not a new minimax result.
