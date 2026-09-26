# A Statistic for Measuring the Influence of Side Information in Investment

**Charles Mathis and Thomas M. Cover (2005).** [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_MathisCover_2005.pdf>). The local source is a two-page conference-style manuscript. It states one asymptotic theorem and explains the associated statistic; it does not supply a detailed proof, numerical experiment, or empirical return study. The year follows the library record. No journal venue is identified in the file itself.

## Research question and contribution

A signal may be statistically related to returns yet have little value for investment. Mathis and Cover instead measure the value of discrete side information through the additional wealth obtainable by a portfolio that conditions on it. They compare two hindsight optimizations on exactly the same realized return sequence: one constant rebalanced portfolio for the entire sample, and one constant rebalanced portfolio for each signal state. The ratio of their terminal wealth is a measure of how much the state labels could have helped within this investment class.

Because the state-dependent model has more parameters, its optimized in-sample wealth cannot be smaller even when the states are irrelevant. The contribution is a calibration for that mechanical improvement. Under a permutation null and the source's nondegeneracy conditions,

\[
2\ln\left(S_n^{**}/S_n^*\right)
\ \xrightarrow{d}\ \chi^2_{(d-1)(m-1)}.
\]

The factor of two is essential. The earlier short summary contained two purportedly equivalent expressions that were inconsistent. The source states \(\ln(S_n^{**}/S_n^*)\Rightarrow\tfrac12\chi^2\), which is the normalization used throughout this note.

## Wealth accounting and the two optimization problems

Let \(x_t=(x_{t1},\ldots,x_{tm})\in\mathbb R_+^m\) be the vector of gross asset returns at date \(t\), and let \(s_t\in\{1,\ldots,d\}\) be the observed side-information state. The source calls \(x_{tj}\) the closing-to-opening price relative. A constant rebalanced portfolio invests fractions \(b_j\) in the assets and restores the same fractions at the start of each period. Its cumulative wealth relative is

\[
S_n(b;x^n)=\prod_{t=1}^n b^\top x_t.
\]

This is different from buy-and-hold: the latter allows weights to drift with returns. It is also different from a portfolio whose coefficients can change freely each date. The comparator has the same chosen allocation at every date, or at every occurrence of a given state in the conditional version.

The source explicitly imposes \(\sum_jb_j=1\), but does not explicitly state \(b_j\ge0\) in its optimization display. Its nondegeneracy definition and the assertion that the maximizing portfolio is finite are material to this point. A long-only simplex is a common universal-portfolio setting, but adding it silently changes the optimization domain and can change the null law when an optimum is on a boundary. A faithful implementation must specify the admissible portfolio domain and ensure positive realized wealth factors. The formulas below use \(\mathcal B\) for that specified domain.

The unconditional hindsight benchmark is

\[
S_n^*(x^n)=\max_{b\in\mathcal B}\prod_{t=1}^n b^\top x_t,
\qquad
\ell_0^*=\max_{b\in\mathcal B}\sum_{t=1}^n\ln(b^\top x_t).
\]

The state-dependent benchmark chooses \(d\) allocations:

\[
S_n^{**}(x^n,s^n)=\max_{b(1),\ldots,b(d)\in\mathcal B}
\prod_{t=1}^n b(s_t)^\top x_t.
\]

Because each state uses a separate parameter vector,

\[
S_n^{**}=\prod_{k=1}^d S_{n,k}^*,\qquad
\ell_1^*=\sum_{k=1}^d\max_{b\in\mathcal B}
\sum_{t:s_t=k}\ln(b^\top x_t).
\]

No probability model for the numerical values of the observed stock returns is fitted. There are \(d+1\) concave optimization problems: one on the full sample and one for each state. The wealth ratio and log improvement are

\[
T_n^*=\frac{S_n^{**}}{S_n^*}=\exp(\ell_1^*-\ell_0^*),
\qquad \Delta\ell=\ell_1^*-\ell_0^*\ge0.
\]

Nonnegativity follows from nesting: setting every state portfolio equal to the unconditional optimum is feasible in the larger model. It is not evidence by itself that the signal is useful.

## The null is exchangeability of state labels

The paper treats the return sequence \(x^n\) as fixed. Calling an arbitrary random state sequence independent of a fixed object would be vacuous, so the authors define a more specific null. Conditional on the number \(n_k\) of observations in each state, every permutation of the state labels across dates is equally likely.

Thus the null preserves the marginal frequencies of states and randomizes their alignment with returns. The statistic asks whether the observed alignment creates more optimized log wealth than would typically arise from a random allocation of those same labels. It is a conditional randomization argument, not a model of normally distributed returns or a conventional return-regression t-test.

This distinction matters for financial signals with persistence. A regime sequence may have long runs of the same label. Uniformly permuting individual labels destroys those runs. Independence between two serially correlated stochastic processes does not automatically imply that every ordering of one observed label multiset is equally likely. The paper's calibration should therefore not be applied without examining whether its exchangeability null is a defensible description of the intended question.

For a persistent state process, block permutations or other dependence-preserving randomizations may be useful modifications, but they require their own validity argument. They are implementation extensions rather than results established in the two-page source.

## Nondegeneracy and the theorem

The source defines a sequence to have full dimension when the convex hull of its return vectors strictly contains a ray \(\lambda\mathbf1\). It calls the full return sequence nondegenerate relative to the state sequence if every state-induced subsequence has full dimension. The authors explain that these conditions ensure the problem truly involves \(m\) stocks and that the maximizing portfolio is finite in each component.

The theorem then considers a sequence with state counts \(n_k\) and uniformly random permutations of those labels. As \(n\to\infty\) and every \(n_k\to\infty\), it states

\[
\ln T_n^*\ \xrightarrow{d}\ \frac12\chi^2_\nu,
\qquad \nu=(d-1)(m-1).
\]

Equivalently, \(T_n^*\) has the approximate distribution \(\exp(\chi^2_\nu/2)\). “Distribution free” here means that the asymptotic calibration does not depend on the particular numerical return sequence or state marginal frequencies once the specified conditions hold. It does not mean every finite-sample constrained variant has this distribution or that the quality of approximation is uniform over ill-conditioned samples.

The extra dimension has a transparent interpretation. A budget constraint leaves \(m-1\) free portfolio coefficients. The unconditional model has \(m-1\) such parameters, while the state-dependent model has \(d(m-1)\). Their difference is \((d-1)(m-1)\). This counting motivates the chi-square dimension, but it is not by itself a proof: a chi-square limit also requires the appropriate local regularity and probabilistic approximation.

## The likelihood-ratio analogy and its limits

The log-wealth objective has gradient and Hessian

\[
\nabla\ell(b)=\sum_t\frac{x_t}{b^\top x_t},\qquad
\nabla^2\ell(b)=-\sum_t\frac{x_tx_t^\top}{(b^\top x_t)^2}.
\]

After removing the budget direction, a local quadratic expansion has the same form as the expansion used in likelihood-ratio asymptotics. Under irrelevant randomly assigned states, state-specific scores fluctuate around the pooled score; the optimized gain is approximately a quadratic form in those fluctuations. This explains why a chi-square calibration is plausible.

The source does not print this proof or a complete list of analytic regularity assumptions beyond the stated nondegeneracy conditions. The expansion should therefore be read as an explanatory reconstruction, not as a theorem proved in the supplied file. In particular, adding long-only bounds can place the optimum at a corner, where ordinary parameter-counting asymptotics need not apply. Redundant assets, rare states, zero gross wealth, and nearly singular curvature also deserve separate treatment.

## Test construction and financial interpretation

For an observed statistic, the asymptotic p-value is

\[
p_{\rm asym}=P\{\chi^2_\nu\ge2\Delta\ell\}.
\]

At significance level \(\alpha\), rejection occurs when

\[
2\Delta\ell>\chi^2_{\nu,1-\alpha},
\]

or, equivalently,

\[
T_n^*>\exp\left(\tfrac12\chi^2_{\nu,1-\alpha}\right).
\]

For example, with two assets and two states, there is one additional degree of freedom. The familiar 5% chi-square threshold is about 3.84, giving a log-wealth threshold of about 1.92 and a wealth ratio of about 6.82. These numbers are an illustrative calculation from the theorem, not an empirical example reported in the paper. They show why seemingly impressive hindsight wealth ratios can arise from fitting more flexible portfolios.

A complementary effect size is \(\Delta\ell/n\), the improvement in average log return per observation. The wealth ratio alone depends exponentially on sample length. Reporting both the cumulative statistic and its per-period magnitude helps distinguish a statistically compelling but economically small effect from a large estimated effect based on little data.

Rejection says that the observed labels have unusual financial alignment with the return sample relative to the specified permutation null. It does not show that the optimal portfolios were knowable in advance, that their coefficients are stable, or that the signal survives costs. Failure to reject also does not establish universal uselessness of the signal: the method examines a particular class of state-dependent constant rebalanced strategies and can have limited power.

## Relation to universal portfolios

The paper motivates its hindsight benchmark by earlier universal-portfolio results. Those strategies causally combine constant rebalanced portfolios and approach the hindsight optimum at the level of exponential growth. The source gives a two-stock lower-bound example with a subexponential wealth penalty and cites Cover (1991), Cover–Ordentlich (1996), and Ordentlich–Cover (1998).

The role of that literature is conceptual: the hindsight CRP is not wholly detached from a feasible causal investment benchmark. A subexponential regret factor vanishes after division of log wealth by the horizon. This does not make the state-specific hindsight maximizer directly implementable, nor does it establish a finite-horizon net profit guarantee. Every state also needs enough observations to learn its associated allocation.

## Reproducible implementation

Compute gross total returns consistently across securities, align states to information available before the return period, and document the exact allocation domain. Solve the pooled and state-specific problems in log space to avoid numerical overflow. Use the same asset universe, price convention, and admissible constraints in every fit. Require positive wealth factors and inspect optimizer residuals rather than accepting a solver's success flag blindly.

Store the fitted weights, \(n_k\), objective values, smallest realized wealth factor, curvature condition diagnostics, and whether any bounds bind. These records reveal whether an apparent signal is driven by rare states or extreme portfolio coefficients. The optimization error must be small relative to the observed \(\Delta\ell\); otherwise the difference between several fitted objectives can be numerically misleading.

A finite-sample permutation implementation keeps \(x^n\) fixed, repeatedly permutes labels while preserving \(n_k\), and refits all conditional portfolios. The pooled optimum need only be computed once because it does not depend on the labels. An empirical upper-tail p-value compares the observed improvement with the randomized improvements, including the observed arrangement in the usual Monte Carlo counting convention. This follows the stated null directly and avoids relying exclusively on the asymptotic chi-square approximation; its usefulness does not repair an inappropriate exchangeability assumption.

Finally, selection of states, lag lengths, thresholds, assets, or transformations on the same sample introduces an additional search problem. A single-test chi-square p-value does not account for that search. An independent validation sample or a randomization procedure that repeats the whole selection pipeline is needed for the expanded research question. The source offers an elegant financial-value statistic, not a complete defense against adaptive backtest selection.
