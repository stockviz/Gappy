# An Algorithm for Maximizing Expected Log Investment Return

**Thomas M. Cover (1984), IEEE Transactions on Information Theory, IT-30(2), pp. 369–373.** [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_Cover_1984.pdf>). The five-page source was read in full. The main results concern a fixed return distribution, exact expectation evaluations, and long-only portfolio weights on the unit simplex.

## Problem and contribution

Given a nonnegative random gross-return vector \(X\in\mathbb R_+^m\), choose a portfolio \(b\) to maximize

\[
W(b)=E\ln(b^\top X),\qquad
b\in\Delta_m=\{b\ge0:\mathbf1^\top b=1\}.
\]

Cover proposes the multiplicative update

\[
b_i^{(n+1)}=b_i^{(n)}E\left[\frac{X_i}{(b^{(n)})^\top X}\right],
\qquad b_i^{(0)}>0.
\]

It maps the current allocation to the expected end-of-period allocation produced by one play of the market. The paper proves monotone improvement, convergence of objective values to the global optimum, and an explicit computable upper bound on the remaining objective gap. The important computational contribution is the combination of a simple update and a rigorous stopping certificate.

This is not an online-learning rule that observes only the next realized return. The expectation is evaluated under the same distribution at every iteration. Iteration number indexes optimization steps; it need not index trading dates. Replacing the expectation with a realized return creates a different procedure and does not inherit the theorem automatically.

## Setup, existence, and concavity

The multiplier \(b^\top X\) must be positive almost surely where logarithms and ratios are used, and the optimal expected logarithm must be finite for the convergence argument. The paper works with \(-\infty<W^*<\infty\), where \(W^*=\sup_bW(b)\). This rules out a market that is identically worthless with positive probability under every feasible allocation.

On its effective domain,

\[
a_i(b):=\frac{\partial W}{\partial b_i}
=E\frac{X_i}{b^\top X},
\]

and, when differentiation is justified,

\[
\nabla^2W(b)=-E\frac{XX^\top}{(b^\top X)^2}.
\]

Thus \(W\) is concave. Strict concavity in every feasible direction follows if no nonzero relevant difference of portfolios has zero payoff almost surely. If securities are redundant, several distinct allocations may generate the same return and attain the same optimum. Objective convergence should therefore be distinguished from convergence to one unique vector of weights.

A useful identity is

\[
\sum_ib_ia_i(b)=E\frac{b^\top X}{b^\top X}=1.
\]

It determines the multiplier in the portfolio first-order conditions and makes the multiplicative update automatically normalized.

## The update as an expected wealth composition

Starting with allocation \(b\), the realized fraction of wealth in asset \(i\) after a return vector \(X\) is

\[
q_i(X;b)=\frac{b_iX_i}{b^\top X}.
\]

These fractions are nonnegative and sum to one in every state. Their expectation is

\[
b_i'=E[q_i(X;b)]=b_ia_i(b).
\]

Consequently \(b'\in\Delta_m\) without projection or line search. Assets with \(a_i(b)>1\) gain weight; those with \(a_i(b)<1\) lose weight. The quantity \(a_i\) is an expected relative payoff to the current portfolio, not the asset's unconditional expected return. An asset with lower standalone expected return can receive more weight if it performs well when the present portfolio performs poorly.

Strict positivity of the starting allocation matters. If \(b_i=0\), then \(b_i'=0\) regardless of the marginal appeal of asset \(i\). An arbitrary boundary initialization can permanently exclude a necessary asset. Starting in the interior avoids trapping the algorithm on an inappropriate face.

## Exact monotonicity proof

Define the Kullback–Leibler divergence between successive portfolio vectors as

\[
D(b'\Vert b)=\sum_ib_i'\ln\frac{b_i'}{b_i}.
\]

Theorem 1 states

\[
W(b')-W(b)\ge D(b'\Vert b)\ge0.
\]

To prove it, write the wealth ratio as a mixture using the *realized* composition \(q_i(X;b)\):

\[
\frac{(b')^\top X}{b^\top X}
=\sum_iq_i(X;b)\frac{b_i'}{b_i}.
\]

Concavity of the logarithm gives, state by state,

\[
\ln\frac{(b')^\top X}{b^\top X}
\ge\sum_iq_i(X;b)\ln\frac{b_i'}{b_i}.
\]

Taking expectations replaces \(q_i\) by \(b_i'\), producing precisely the relative-entropy lower bound. The weights in this application of Jensen's inequality depend on the return vector. Applying Jensen directly to the outer expectation of a logarithm would give an upper bound and therefore would not prove the required improvement.

The earlier short summary had an incorrect extra factor in this ratio identity. The equation above is the exact mixture decomposition. The proof also explains why the update and the objective are so closely matched: the expected mixture coefficients are exactly the next iterate.

Equality in objective improvement occurs if and only if \(b'=b\). Hence every nontrivial step gives a strict increase in expected log return, although the increase can be extremely small near an optimum or near a poorly conditioned face.

## The second monotonicity result

Theorem 2 concerns the expected ratio of *successive* portfolio returns:

\[
E\left[\frac{(b')^\top X}{b^\top X}\right]\ge1.
\]

Indeed,

\[
E\frac{(b')^\top X}{b^\top X}
=\sum_ib_i a_i(b)^2
\ge\left(\sum_ib_ia_i(b)\right)^2=1.
\]

This is a simple weighted second-moment inequality. It is not a claim that an arbitrary ratio measuring distance to the unknown optimum decreases at a specified rate. The source explicitly says this theorem is not needed for its convergence proof.

## Optimality conditions and the boundary subtlety

For the simplex problem, the necessary and sufficient concave-programming conditions are

\[
a_i(b^*)=1\quad\text{if }b_i^*>0,
\qquad
a_i(b^*)\le1\quad\text{if }b_i^*=0.
\]

The budget multiplier equals one by \(\sum_ib_i^*a_i(b^*)=1\). At positive-weight assets the expected marginal return relative to the portfolio is equalized. An omitted asset cannot offer a larger marginal value.

A fixed point of the multiplicative map guarantees only the first part: \(a_i=1\) on its positive support. A vertex is a fixed point even when moving toward another asset would improve the objective. The source calls a fixed point “stable” in this limited sense and then separately proves that limit points of an interior-started sequence satisfy the omitted-asset inequalities. The earlier summary's blanket assertion that every fixed point satisfies all Kuhn–Tucker conditions was too strong.

This distinction is useful in implementations. Checking \(b'\approx b\) is not as reliable as checking the full gradient certificate, especially when some weights are tiny. Multiplication by a nearly zero weight can make a coordinate change look negligible despite a significant marginal improvement opportunity.

## Structure of the convergence proof

Monotonicity and an upper bound imply that \(W(b^{(n)})\) has a limit. However, monotone values alone do not prove that this limit is globally optimal. Cover's proof supplies the missing argument in several steps.

First, compactness of the simplex guarantees accumulation points. The relative-entropy bound and convergence of the objective imply

\[
D(b^{(n+1)}\Vert b^{(n)})\to0,
\]

and hence successive vector differences go to zero. The accumulation set is nonempty, compact, and connected. Intuitively, if it had separated components, the sequence would have to cross a compact region between them infinitely often; vanishing step sizes would create an accumulation point in that intervening region.

Second, continuity of the update's relevant extended-valued gradient terms shows that each accumulation point is a fixed point, and thus satisfies the equality conditions on its positive coordinates. Boundary derivatives may be infinite, so the paper carefully uses Fatou's lemma and dominated convergence rather than assuming ordinary smoothness on the closed simplex without qualification.

Third, the proof rules out an omitted asset with \(a_i>1\). If the whole sequence converged to such a point, then eventually the multiplicative factor on that asset would exceed one, so its initially positive weight could not tend to zero. In fact,

\[
b_i^{(n)}=b_i^{(0)}\prod_{k=0}^{n-1}a_i(b^{(k)}),
\]

which would become unbounded if the limiting multiplier exceeded one, contradicting the simplex constraint.

When there can be multiple accumulation points, Cover projects portfolios onto the linear span of the support of \(X\). Portfolios with identical projections have identical payoffs. Each face contributes at most one relevant projected fixed point; there are finitely many faces. Since the accumulation set has a connected image, that image must reduce to a single point. The same multiplicative contradiction then applies to the limiting marginal multipliers.

All accumulation points consequently satisfy the full optimality conditions, and

\[
W(b^{(n)})\uparrow W^*.
\]

With a unique maximizer, the vectors themselves converge to \(b^*\). The paper gives full dimension of the market as a sufficient setting for this conclusion. It does not establish a dimension-uniform fast iteration bound.

## An explicit optimality-gap certificate

For any candidate \(b\) for which the expressions are defined, Theorem 4 gives

\[
0\le W^*-W(b)\le\max_i\ln a_i(b)
=\ln\max_iE\frac{X_i}{b^\top X}.
\]

The derivation is short and useful independently of the update rule. Let \(b^*\) be optimal. Jensen's inequality gives

\[
W^*-W(b)
=E\ln\frac{(b^*)^\top X}{b^\top X}
\le\ln E\frac{(b^*)^\top X}{b^\top X}
=\ln\sum_ib_i^*a_i(b)
\le\ln\max_i a_i(b).
\]

Thus one can stop when \(\max_i\ln a_i(b)\le\varepsilon\) and certify expected-log-return error at most \(\varepsilon\). The certificate applies to a portfolio generated by another algorithm as well. Cover notes using ad hoc acceleration in stock-market computations and relying on this bound to determine when the resulting candidate was sufficiently good.

The certificate is in units of expected log return per period. It is not a confidence interval for out-of-sample performance and does not include uncertainty in the return distribution. If expectations are approximated by simulation, the computed maximum must be interpreted with its numerical and sampling errors.

## Worked example from the source

Take cash \(X_1=1\) and a risky asset \(X_2\) that is 2 or \(1/2\), each with probability one half. Let \(u=b_2\). Then

\[
W(u)=\frac12\ln(1+u)+\frac12\ln(1-u/2).
\]

The maximizing risky weight is \(u^*=1/2\), giving

\[
W^*=\frac12\ln(9/8)>0.
\]

Cash alone has zero growth, and the risky asset alone also has zero expected log return. Rebalancing the mixture generates positive growth in this example. That gain comes from the shape of the return process and repeated rebalancing; it does not imply that diversification produces growth under arbitrary price dynamics or after arbitrary trading costs.

Writing \(u=1/2+e\), the next update has error

\[
e'=\frac{8e}{9-4e^2}=\frac89e+O(e^3).
\]

This example therefore converges geometrically near the optimum, with contraction factor \(8/9\). It is an example-specific local rate rather than a universal rate theorem for the algorithm.

## Implementation under a finite scenario distribution

For scenarios \(x^{(k)}\) with probabilities \(p_k\), calculate

\[
z_k=b^\top x^{(k)},\qquad
a_i=\sum_kp_k\frac{x_i^{(k)}}{z_k},\qquad
b_i\leftarrow b_i a_i.
\]

One pass costs order \(Km\) for \(K\) scenarios and \(m\) assets, apart from data handling. Compute the objective \(\sum_kp_k\ln z_k\) and gap bound at each accepted iterate. Numerical normalization can remove rounding drift in \(\sum_ib_i\), but an appreciable deviation from one signals an implementation or probability-weight error. Use strictly positive initial weights and handle assets with identically zero payoff explicitly.

Near-zero wealth in a scenario leads to large derivatives and possible numerical instability. Bounds, regularization, transaction costs, short positions, and leverage restrictions cannot simply be bolted onto the multiplicative map while retaining the original proof. They change the feasible set or objective and call for a corresponding constrained method.

The return distribution is the substantive input. Solving its log-optimal allocation to very high numerical accuracy does not make an estimated distribution accurate. The paper's theorem cleanly separates optimization error from model error: the upper bound certifies the former, while the latter remains a research and portfolio-risk issue outside the five-page analysis.
