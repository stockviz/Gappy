# A Preference Foundation for Log Mean-Variance Criteria in Portfolio Choice Problems (1993)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_Luenberger_1993.pdf>), 20 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

## Bibliographic identity and central conclusion

David G. Luenberger, *A Preference Foundation for Log Mean-Variance Criteria in Portfolio Choice Problems*, Journal of Economic Dynamics and Control 17 (1993), pp. 887-906. The source is a theoretical paper about preferences over infinite wealth sequences. It does not propose a covariance estimator, report a backtest, or prove that all investors should maximize expected log wealth.

Its precise contribution is conditional: in an IID investment environment, a specified class of preferences that ignores finite portions of wealth paths can be extended to random wealth processes through almost-sure comparisons. Simple limiting utilities then depend only on mean log return. A richer, centered class depends on mean and standard deviation of log return. The fluctuation argument uses the law of the iterated logarithm, not a normal approximation to terminal wealth.

A correction to the earlier short summary is essential. The paper does **not** derive the particular objective $m-\kappa v/2$ as the unique or general compound utility. It obtains a general function $f(m,\sigma)$, where $m=E\log X$ and $\sigma^2=\operatorname{Var}(\log X)$. Depending on whether upper or lower limiting fluctuations are evaluated, that function can favor *higher* or *lower* volatility. Calling the result “log mean-variance” means dependence on those two moments; it does not imply a quadratic penalty or ordinary mean-variance risk aversion.

## 1. Investment environment and admissible policies

Let $Z_k$ be the vector of investment opportunities in period $k$. A fixed policy $\alpha$ maps $Z_k$ into a nonnegative gross portfolio return $X_k=\alpha(Z_k)$. Wealth satisfies

$$
W_0=1,\qquad W_n=\prod_{k=1}^n X_k,
\qquad \log W_n=\sum_{k=1}^n\log X_k.
$$

In the linear securities example, $\alpha(z)=\sum_i a_i z_i$, with nonnegative portfolio weights summing to one. The same mapping is repeated each period. Nonlinear mappings can represent nonlinear payoffs; the theory is not confined to a linear basket of stocks. Proportional withdrawals can be folded into the one-period return mapping, but unrestricted consumption choice is not solved.

The basic setting imposes IID opportunity vectors, nonnegative and uniformly bounded returns, a constant policy, and finite first and second moments of log return. Finite log moments exclude positive probability of a zero portfolio gross return. Cross-sectional dependence is allowed: independence concerns dates, not securities within a date. These restrictions matter because the comparison and limit arguments work on the resulting repeated independent return process.

The paper's explanatory wealth relation $W_n\approx\exp(nm)$ should be understood at the level of exponential growth rates. It is not the assertion $W_n/e^{nm}\to1$. In fact, with nonzero log-return variance that ratio has substantial fluctuations. The strong law establishes only

$$
\frac{1}{n}\log W_n\longrightarrow m\quad\text{almost surely}.
$$

This distinction is exactly why an additional treatment of fluctuations is needed.

## 2. Why conventional terminal-utility arguments are insufficient

The introduction separates three different problems: maximizing expected terminal log wealth; maximizing expected terminal utility for an arbitrary utility; and maximizing discounted utility of consumption. These need not produce the same policy, even at long horizons. Luenberger does not claim that the conventional expected-utility problem collapses to Kelly merely because the horizon becomes large.

There are two tempting but invalid shortcuts. First, one cannot generally exchange an infinite-horizon limit with an expected-utility operation. Second, a central limit theorem for

$$
\frac{\log W_n-nm}{\sigma\sqrt n}
$$

does not justify replacing the unnormalized terminal-wealth distribution by a convenient limiting distribution and then applying arbitrary utility. Utility can give disproportionate importance to tails where weak convergence is uninformative. Moreover, the relative size of the standard deviation of log wealth to its mean shrinks with the horizon, so a naive limiting mean-variance frontier can degenerate.

The paper therefore changes the primitive object of preference. It starts with an infinite sequence, rather than first specifying finite-horizon utility and then trying to pass to a limit. This is a substantive preference assumption, not a derivation of ordinary expected utility from weaker mathematics.

## 3. Deterministic tail preferences and stochastic extension

Let $\Gamma$ be the admissible set of deterministic positive wealth sequences. A preference relation is assumed complete, reflexive, transitive, and measurable. Its defining economic restriction is the **tail property**: changing finitely many coordinates of either wealth sequence does not change the ranking. Thus a very poor first decade has no effect on the ranking if the two sequences eventually coincide. This assumption suits a pure asymptotic wealth-building criterion; it is demanding for investors with liabilities, drawdown limits, or finite lives.

For stochastic wealth processes $W$ and $V$, the extension is

$$
W\succeq_s V\quad\Longleftrightarrow\quad
P\{W\succeq V\}=1.
$$

Ordinarily an almost-sure ordering is incomplete: one outcome can favor $W$, another $V$. Theorem 1 explains why completeness survives here. The event that one wealth sequence is preferred is unchanged by a finite permutation of the underlying IID return pairs. A finite permutation changes only finitely many intermediate wealth observations; cumulative products after the permutation are unchanged. The Hewitt-Savage zero-one law therefore gives probability zero or one to the preference event. Completeness of deterministic preferences then supplies a direction almost surely.

This proof should not be replaced by the vague statement that “all asymptotic events have probability zero or one.” The invariance required for the zero-one law follows from the multiplicative wealth construction, IID paired returns, and the specific tail preference. With nonstationary or dependent opportunities, the argument needs new assumptions and is not established by this paper.

Likewise, a measurable finite-valued tail utility evaluated on an admissible stochastic wealth process is constant almost surely. That constant becomes its stochastic utility. No expectation of von Neumann-Morgenstern utility is introduced. Expected log return will emerge from a probability limit theorem instead.

## 4. Simple utility functions: statement and proof mechanism

A simple utility applies a time-dependent increasing transformation to an individual wealth observation, then takes a limit superior, limit inferior, or appropriate combination. In log coordinates a representative form is

$$
U(W)=\limsup_{n\to\infty}p(\log W_n,n),
$$

where $p(\cdot,n)$ is continuous and increasing, normalized by $p(0,n)=0$. Theorem 2 supplies sufficient scaling conditions. If

$$
p(nz,n)\longrightarrow g(z)
$$

for a continuous function $g$, then

$$
U(W)=g(m),\qquad m=E\log X_1.
$$

The proof is a useful example of an exact squeeze argument. On a probability-one set where $z_n=n^{-1}\log W_n\to m$, fix $\epsilon>0$. Eventually $m-\epsilon\le z_n\le m+\epsilon$. Monotonicity gives

$$
p(n(m-\epsilon),n)\le p(nz_n,n)
\le p(n(m+\epsilon),n).
$$

Take limiting upper and lower bounds and then let $\epsilon\downarrow0$. Continuity of $g$ yields equality with $g(m)$. The role of the scaling condition is not decorative: a poorly scaled transformation gives infinite or degenerate values instead of a useful real-valued utility.

For example, $p(z,n)=z/n$ produces $U=m$. The normalized power expression $W_n^{\gamma/n}$ produces $e^{\gamma m}$ for positive $\gamma$, an equivalent increasing ranking. By contrast, unnormalized positive powers of wealth generally diverge when log growth is positive. They do not yield a new finite asymptotic criterion in this class.

The theorem says that, under its conditions, the simple utility cannot retain separate information about volatility or higher moments after the leading exponential growth rate has been extracted. It does not classify every conceivable tail functional. Discontinuous criteria, lexicographic rankings, different state spaces, or other normalizations can lie outside the stated theorem.

## 5. Compound utility: extracting fluctuations after growth

To distinguish wealth processes with the same leading growth, the paper allows a utility to depend on a simple utility as an argument. Since that simple utility is represented by $m$, the relevant compound expressions become

$$
U(W)=\limsup_n\psi(\log W_n-nm,m,n)
$$

or the analogous limit inferior. The first coordinate is centered cumulative log return. The function is continuous and increasing in that coordinate and increasing in $m$, with additional monotonicity conditions in the time scaling.

Write $Y_k=\log X_k-m$. For $0<\sigma^2=E Y_k^2<\infty$, the classical iterated-logarithm result gives

$$
\limsup_n\frac{\sum_{k=1}^nY_k}
{\sqrt{2n\log\log n}}=\sigma,
\qquad
\liminf_n\frac{\sum_{k=1}^nY_k}
{\sqrt{2n\log\log n}}=-\sigma
\quad\text{a.s.}
$$

The extra $\sqrt{\log\log n}$ is critical. Scaling only by $\sqrt n$, as in a central limit theorem, does not yield a finite almost-sure upper envelope: normalized fluctuations exceed any fixed positive level infinitely often. That is why distributional normality at a single large date does not supply the required pathwise utility result.

A transparent admissible example is

$$
U_-(W)=m+\eta\liminf_n
\frac{\log W_n-nm}{\sqrt{2n\log\log n}}
=m-\eta\sigma,
\qquad\eta>0.
$$

This investor penalizes the magnitude of unfavorable asymptotic deviations. Replacing the lower limit by the upper limit produces $m+\eta\sigma$: an investor who values favorable peaks rewards dispersion. These examples illustrate the theorem; they should not be confused with a mandatory functional specification selected by the paper.

## 6. General fluctuation theorem and efficient sets

The technical development in Section 5 uses inverse functions and an extended iterated-logarithm test to obtain more general results than the preceding example. If $\phi(z,n)$ is strictly increasing in $z$, let its inverse in that coordinate be $f(r,n)$. Exceedance of a utility level can be rewritten as a boundary-crossing event for the centered log-wealth sum. The time-monotonicity restriction ensures that the standardized boundary falls within the scope of the probability test.

The relevant convergence or divergence test depends on the log-return distribution through $\sigma$, after centering. This yields Proposition 1: an upper-limit utility is a nondecreasing function of $\sigma$. Proposition 2 gives the lower-limit counterpart, nonincreasing in $\sigma$. Inserting the mean again yields Theorem 3:

$$
U(W)=F(m,\sigma),
$$

where $F$ increases in $m$ and has the corresponding sign of monotonicity in $\sigma$. The result permits extended values; finiteness still needs to be checked for a proposed utility and feasible process.

For a compact attainable set of $(m,\sigma)$ pairs, a volatility-averse investor can be restricted to the frontier of high log growth and low log volatility. A peak-oriented investor selects from a different boundary. No convexity of this attainable set or universal closed-form portfolio is supplied. In particular, ordinary return means and covariances alone generally do not determine $E\log(a^TZ)$ or $\operatorname{Var}(\log(a^TZ))$.

## 7. Translating the theory into a research implementation

A direct numerical use would fix the policy class, generate or estimate the distribution of gross portfolio returns for each feasible policy, and compute

$$
m(a)=E\log(a^TZ),\qquad
v(a)=E[(\log(a^TZ)-m(a))^2].
$$

One would then construct the attainable frontier and apply a separately specified preference $F(m,\sqrt v)$. This sequence makes clear what the paper does and does not determine: it justifies a dimension reduction in the preference representation, but leaves the trade-off, parameter estimation, constraints, and optimization algorithm to the decision maker.

Replacing log moments by arithmetic moments invokes an additional small-return approximation. For $R=a^TZ-1$,

$$
E\log(1+R)\approx ER-\tfrac12E R^2.
$$

The second term is a raw second moment, so it contains both variance and squared mean. Neither this Taylor expansion nor a Gaussian portfolio-return assumption is needed for Luenberger's main representation theorem. Keeping the distinction prevents an exact preference result from being misreported as an exact Markowitz formula.

Operationally, finite-horizon solvency and drawdown constraints must be imposed separately. A tail utility can be indifferent to path changes that are economically devastating before the asymptotic regime. Trading costs can be built into an IID return mapping only in special cases; costs generated by dynamic rebalancing typically introduce state dependence and require a different analysis. Estimating a frontier from a finite historical sample also adds uncertainty that the theoretical representation does not resolve.

## 8. What to retain from this paper

The paper provides a clean logical route from a restricted infinite-path preference to log-return moments. Its strongest step is the combination of zero-one laws, the strong law, and iterated-logarithm behavior. Its scope is narrow enough to be useful: a constant policy in an IID bounded-return environment, regular tail utilities, and finite log moments. Within that scope, the moment representation is exact. The economic choice to ignore every finite prefix, and the empirical choice to approximate an actual investment process by this environment, remain assumptions rather than consequences.
