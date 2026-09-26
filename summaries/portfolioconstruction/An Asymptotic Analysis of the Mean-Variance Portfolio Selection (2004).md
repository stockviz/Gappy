# An Asymptotic Analysis of the Mean-Variance Portfolio Selection (2004)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_OttucsakVajda_2004.pdf>), 23 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** An Asymptotic Analysis of the Mean-Variance Portfolio Selection
- **Author(s):** György Ottucsák, István Vajda
- **Year:** 2004
- **Journal/Venue:** *Statistics & Decisions*

# 2. Problem statement

The paper asks: **how much asymptotic growth does a risk-aware Markowitz-type strategy sacrifice relative to the log-optimal strategy in stationary ergodic markets, and can a nonparametric kernel-based version recover the same asymptotic benchmark without knowing the data-generating law?**

# 3. Approach (short)

The method is asymptotic growth analysis under stationarity and ergodicity. Ottucsák and Vajda define a multiperiod Markowitz-type objective using conditional first and second moments of one-period portfolio excess returns, derive lower bounds on its asymptotic growth relative to the log-optimal benchmark, and then build a kernel-based empirical version by mixing local experts.

# 4. Approach (detailed)

1. **Dynamic Markowitz-type criterion**

   Let $X_n\in\mathbb R_+^d$ be the return vector. The paper considers a one-step conditional objective of the form
   $$
   \max_{b\in\Delta_d}
   \left\{
   (1-2\lambda)\,\mathbb E[\langle b,X_0\rangle-1\mid \mathcal F_{-1}]
   -
   \lambda\,\mathbb E[(\langle b,X_0\rangle-1)^2\mid \mathcal F_{-1}]
   + \text{normalization term}
   \right\},
   $$
   with $\lambda$ a risk-aversion parameter. This is the sequential analogue of mean-variance optimization.

2. **Compare with the log-optimal benchmark**

   Let
   $$
   W^\star
   =
   \sup_B \liminf_{n\to\infty}\frac1n\log S_n(B)
   $$
   denote the optimal asymptotic growth rate. Under the bounded-return assumption
   $$
   a\le X_n^{(j)}\le a^{-1}
   \qquad (0<a<1),
   $$
   the paper proves a lower bound for the growth rate of the Markowitz-type strategy:
   $$
   \liminf_{n\to\infty}\frac1n\log \bar S_{n,\lambda}
   \ge
   W^\star - \text{explicit penalty terms depending on }\lambda \text{ and conditional moments}.
   $$
   The exact bound is cumbersome, but the point is quantitative: risk aversion lowers growth by a controlled amount.

3. **Interpretation of the bound**

   The penalty terms involve conditional first and second moments of $X_0^{(m)}-1$ weighted by the predictive sigma-field. Hence the difference between log-optimal and Markowitz-type growth is driven by the second-order approximation error induced by replacing log utility with a risk-penalized quadratic criterion.

4. **Kernel-based empirical strategy**

   Since the conditional laws are unknown, the paper constructs experts indexed by window length $k$ and radius $\ell$. For matched past windows $J_n$, the expert solves the empirical analogue
   $$
   \arg\max_{b\in\Delta_d}
   \left[
   (1-2\lambda)\sum_{i\in J_n}(\langle b,X_i\rangle-1)
   -
   \lambda\sum_{i\in J_n}(\langle b,X_i\rangle-1)^2
   +
   \frac{\lambda}{|J_n|}
   \left(\sum_{i\in J_n}\langle b,X_i\rangle\right)^2
   \right].
   $$
   The overall strategy is a positive-weight mixture over experts.

5. **Main empirical-theory theorem**

   The kernel-based Markowitz-type strategy satisfies the same asymptotic lower bound as the infeasible full-information strategy:
   $$
   \liminf_{n\to\infty}\frac1n\log \bar S_{n,\lambda}
   \ge
   W^\star - \text{same penalty}.
   $$
   Thus the data-driven rule asymptotically loses no extra growth beyond the Markowitz-vs-log-optimal approximation itself.

6. **Proof sketch**

   The proof combines:
   - ergodic convergence of matched-window empirical criteria to conditional expectations;
   - continuity of maximizers in the underlying conditional law;
   - wealth-mixture lower bounds ensuring the aggregate tracks the best expert asymptotically.

   The lower bound in the full-information case comes from bounding $\log z$ below by a quadratic function of $z-1$, which converts log growth into a mean-variance-style criterion plus remainder terms.

# 5. Domain of applicability

The method applies to long-only sequential investment under stationary ergodic returns and bounded price relatives. It is useful when one wants a computationally simpler risk-aware proxy for the log-optimal strategy. The exact asymptotic guarantee is not equality with $W^\star$ but a lower bound below it, unless $\lambda$ and the remainder terms make the gap negligible. The framework also excludes transaction costs and relies heavily on asymptotics; in finite samples the kernel tuning problem can be severe.


# 6. Detailed formulation, evidence, and qualifications

## 6.1 Source identity and a cleaner statement of the decision rule

The local PDF is a 23-page manuscript carrying a 2004 Statistics & Decisions header with placeholder volume and page numbers. Those placeholders should not be treated as verified publication details. It contains the full model, numerical table, and proofs.

The basic rule is simpler and less ambiguous than its expanded polynomial representation. At date $n$, given available history $\mathcal F_{n-1}$, select

$$
\bar b_{n,\lambda}\in\arg\max_{b\in\Delta_d}
\{b^T\mu_n-\lambda b^T\Sigma_n b\},
$$

where $\mu_n=E[X_n\mid\mathcal F_{n-1}]$ and $\Sigma_n=\operatorname{Cov}(X_n\mid\mathcal F_{n-1})$. Thus the objective is conditional expected gross return minus a conditional variance penalty. It is concave for $\lambda\ge0$, and the feasible simplex is compact. A maximizer exists. Singularity of the covariance can produce nonuniqueness of weights without making the objective ill-defined.

For $R=b^TX_n-1$, the same objective, up to the constant one, is

$$
E[R\mid\mathcal F]-\lambda E[R^2\mid\mathcal F]
+\lambda(E[R\mid\mathcal F])^2.
$$

This is the form to implement. If instead the linear term is written $(1-2\lambda)E[R]$, the final squared term must use $E[1+R]$, with corresponding constants. Mixing the linear coefficient from one expansion with the square of excess rather than gross returns changes the optimizer. The original short summary's empirical equation made precisely this ambiguity; the direct conditional mean-variance expression resolves it.

## 6.2 What is dynamic, and what is not

The strategy is dynamic because it conditions on the observed past and rebalances at each date. It is not the precommitment solution of a terminal-wealth mean-variance problem such as

$$
\max E[W_T]-\lambda\operatorname{Var}(W_T).
$$

Each decision optimizes a one-period conditional mean-variance criterion. The subsequent analysis asks what long-run compound growth this sequence of decisions achieves. That distinction matters because mean-variance preferences do not generally have the dynamic consistency of log utility.

The model excludes shorting, borrowing, consumption, and transaction costs. With $b\in\Delta_d$ and $a\le X_n^{(j)}\le a^{-1}$, every feasible portfolio gross return also lies in $[a,a^{-1}]$. This uniform lower bound does several jobs simultaneously: it prevents bankruptcy, bounds log utility, and controls third-order Taylor remainders uniformly over all portfolios. Stationarity and ergodicity supply long-run averages; they do not promise rapid mixing or a useful finite-sample convergence rate.

The theoretical information set ultimately becomes the infinite past $X_{-\infty}^{-1}$. An implementable estimator sees only a finite history. The paper's expert construction bridges these two objects through increasingly rich historical pattern matches.

## 6.3 Relation to the semi-log objective

The semi-log function is

$$
h(z)=z-1-\tfrac12(z-1)^2.
$$

Writing $m_b=E[Z]$ and $v_b=\operatorname{Var}(Z)$ for $Z=b^TX$, its conditional expectation is

$$
E h(Z)=2m_b-\tfrac12m_b^2-\tfrac12v_b-\tfrac32.
$$

Thus semi-log optimization is not simply maximization of $m_b-\lambda v_b$ with a fixed, externally specified $\lambda$ for all portfolios. The term $m_b^2$ is part of the objective. The paper's intuitive discussion writes a return-dependent effective coefficient; that algebra should be interpreted as a connection between objective surfaces, not as a proof that one fixed mean-variance risk aversion is universally identical to log utility.

When returns are small, the third-order remainder is small relative to the leading terms. Taylor's theorem gives, for some $\xi$ between $z$ and one,

$$
\log z=h(z)+\frac{(z-1)^3}{3\xi^3}.
$$

Since $\xi\ge a$, a simple absolute bound is

$$
|\log z-h(z)|\le\frac{|z-1|^3}{3a^3}.
$$

This explanatory bound shows why the theorem involves absolute third moments and a lower-return bound. Near-zero gross returns make the constant large and undermine any claim that the quadratic proxy is uniformly accurate.

## 6.4 Meaning of the growth comparison theorem

Let $B^*$ maximize conditional expected log return at every date. Under the source's assumptions, its long-run rate is

$$
W^*=E\big[\log(b^*(X_{-\infty}^{-1})^TX_0)\big].
$$

Every admissible strategy satisfies an asymptotic upper bound relative to this rate. Theorem 4.1 supplies a quantitative lower bound for the mean-variance strategy in terms of $W^*$, $\lambda$, the uniform bound $a$, and conditional moments of individual price relatives. Its terms include the gap $1+\log X-X$, second-order return terms, and absolute third-order terms. The explicit displayed theorem is for $0\le\lambda<1/2$; a remark discusses modification for $\lambda>1/2$. The value $\lambda=1/2$ is not covered by that displayed bound, even though the portfolio optimization problem itself is perfectly well-defined there.

The denominator $1-2\lambda$ is an artifact of the proof's comparison algebra. Its singularity should not be read as an economic singularity of mean-variance investing. Nor should one select risk aversion merely to optimize a possibly loose theoretical lower bound.

The result is a **growth-loss bound**, not a theorem that conditional variance is uniformly lower than under every competing strategy, and not a theorem of equality with Kelly growth. The paper reports that, for the IBM-Coca-Cola pair, estimated orders of magnitude of three bound components are $10^{-5}$, $10^{-4}$, and $10^{-6}$ while $W^*$ is about $9\times10^{-4}$. With optimized $\lambda$, it reports a gap below one percent of $W^*$. This is an illustrative estimated comparison, not a universal one-percent bound.

## 6.5 The empirical expert is a local quadratic program

For each memory length $k$ and radius index $\ell$, compare the latest window of $k$ market vectors to past windows. The matching set is

$$
J_n(k,\ell)=\{i:k<i<n,\ \|X_{i-k}^{i-1}-X_{n-k}^{n-1}\|\le r_{k,\ell}\}.
$$

Only observations strictly before the trading decision are admissible. The outcome associated with a matched window is $X_i$, so the indexing must not accidentally include the current unknown return. From the matched outcomes calculate

$$
\widehat\mu_{n,k,\ell}=|J_n|^{-1}\sum_{i\in J_n}X_i,
\quad
\widehat\Sigma_{n,k,\ell}=|J_n|^{-1}\sum_{i\in J_n}
(X_i-\widehat\mu)(X_i-\widehat\mu)^T.
$$

The expert solves $\max_{b\in\Delta_d}b^T\widehat\mu-\lambda b^T\widehat\Sigma b$. The population-variance normalization $|J_n|$ corresponds to the empirical distribution being optimized. An unbiased covariance divisor would change the effective penalty in small cells. If there are no matches, the source uses the equal-weight portfolio.

Given positive initial expert weights $q_{k,\ell}$, the aggregate wealth is

$$
S_n=\sum_{k,\ell}q_{k,\ell}S_n^{k,\ell},
$$

and the actual portfolio at the next date is the corresponding previous-wealth-weighted average. Crucially, the aggregate is not generally the optimizer of a single pooled mean-variance objective. Its guarantee comes from the identity for mixed wealth, not from an asserted equality of optimization problems.

For every expert,

$$
\log S_n\ge\log q_{k,\ell}+\log S_n^{k,\ell}.
$$

After dividing by $n$, the fixed initial allocation penalty disappears. That is the core tracking argument. Conditional distribution approximation and ergodic convergence then establish that sufficiently rich experts approximate the desired conditional decisions.

## 6.6 What the empirical experiment actually tests

The data are the familiar 36-stock NYSE dataset with 5,651 trading days over twenty-two years ending in 1985. The numerical illustration uses four pairs: Iroquois-Kin Ark, Commercial Metals-Meicco, Commercial Metals-Kin Ark, and IBM-Coca-Cola. The finite expert grid uses $K=5$, $L=10$, uniform initial allocations, and radii satisfying

$$
r_{k,\ell}^2=0.0001\,d\,k\,\ell.
$$

This finite grid is a computational choice. It is not the infinite family with arbitrarily fine radii used in the consistency proof. A claim that the empirical implementation inherits the entire infinite-family asymptotic theorem would require an additional approximation argument.

Table 6.1 displays wealth for selected best-performing experts for the four pairs while varying $\lambda$. The best expert indices differ across pairs. It is therefore important to distinguish these displayed hindsight-selected expert results from a prespecified investable aggregate. For IBM-Coca-Cola, wealth grows from about 152 at $\lambda=0$ to about 223 at $\lambda=0.80$, compared with about 182 for the corresponding log-optimal expert. That finite-sample improvement is compatible with Kelly's asymptotic result; it does not refute it.

The pairs containing Kin Ark produce enormous reported wealth, of order $10^{11}$-$10^{12}$ for some parameters. The authors explicitly attribute this to apparently predictable variation in that asset, despite its modest overall price appreciation. These figures demand particular care about data quality, price adjustments, liquidity, transaction costs, and selection of the universe before any economic extrapolation. The paper does not provide a modern tradability audit of those gains.

## 6.7 Proof architecture and reproducibility

The proof uses a generalized ergodic theorem to average a sequence of conditional functions that themselves converge as the available history increases. Bounded returns give the needed domination. Further lemmas compare expected returns and log returns, control cubic remainders over the simplex, and establish convergence properties of the decision problem as conditional distributions are approximated.

For reproduction, the safest route is to implement the direct mean-minus-variance objective, verify it against the source's expanded equation on randomly generated matched samples, and audit all time indices. Record empty-match frequencies, effective local sample sizes, weight concentration, turnover, and the difference between the selected best expert and the wealth-weighted mixture. Those diagnostics distinguish a statistical conditioning gain from a sample-selection artifact.

The durable contribution is a framework for quantifying the compound-growth cost of a sequence of risk-aware one-step decisions, together with a nonparametric implementation. It is not a general solution to finite-horizon mean-variance control, and its universal statements remain asymptotic statements within the stationary ergodic bounded-return model.
