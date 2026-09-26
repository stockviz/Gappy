# Optimal Investment in Incomplete Financial Markets

**Walter Schachermayer.** Survey manuscript, 37 pages. The library filename and existing summary assign 2002; the supplied title page does not establish a publication year or journal venue, and its bibliography contains papers described as forthcoming around 2000. [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/OptimalInvestmentPortfolio_Schachermayer_2002.pdf>). All 37 pages are covered below. The main semimartingale results are attributed in the manuscript to Kramkov–Schachermayer and Schachermayer's earlier research, rather than presented as new proofs in this survey.

## 1. The central problem and the two distinct wealth domains

An investor chooses a predictable, self-financing strategy \(H\) in discounted asset prices \(S\) to maximize expected utility of terminal wealth:

\[
u(x)=\sup_H E[U(x+(H\!\cdot\!S)_T)].
\]

The survey develops the dual problem, characterizes optimizers by inverse marginal utility, and explains why incomplete markets require more than inserting an arbitrary risk-neutral measure into the complete-market solution.

Two cases must be kept separate:

1. **Nonnegative wealth:** utility is finite on \((0,\infty)\), equals \(-\infty\) on negative wealth, and has infinite marginal utility at zero. The primal domain has a natural positive-wealth closure; the dual must generally be enlarged beyond probability densities to supermartingale deflators.
2. **Wealth on the whole real line:** utility is finite on \(\mathbb R\), as with exponential utility. The dual optimizer can be a probability measure, but the primal domain requires a utility-dependent closure because the optimal strategy may fail any fixed lower wealth bound. The survey's general theorem additionally assumes locally bounded prices.

The shorter account's emphasis on positive wealth misses much of the second half of the paper. These domains lead to different admissibility, closure, asymptotic-growth, and representation conditions.

## 2. Market and utility assumptions

There are \(d\) risky securities and a strictly positive numeraire, normalized so the discounted cash account is one. Prices \(S\) form an adapted \(\mathbb R^d\)-valued semimartingale on a filtered probability space satisfying the usual conditions. A strategy is predictable and \(S\)-integrable, with wealth

\[
X_t=x+\int_0^tH_s\,dS_s.
\]

The initial admissibility convention requires the gains process to be bounded below by a deterministic constant, which may depend on the strategy:

\[
(H\!\cdot\!S)_t\ge-C\quad\text{for all }t\le T.
\]

This excludes doubling schemes that claim arbitrage only by accepting arbitrarily deep interim losses. Terminal payoff alone does not determine whether a proposed dynamic strategy is admissible.

The no-arbitrage assumption is a nonempty set \(\mathcal M^e(S)\) of equivalent pricing measures with the appropriate local-martingale property for admissible gains. The distinction among martingale, local-martingale, and sigma-martingale measures matters for unbounded semimartingales. For locally bounded prices, equivalent local-martingale measures give the familiar formulation; the finite-state case avoids these distinctions. The paper relates the assumption to no free lunch with vanishing risk.

Utility is increasing, strictly concave and differentiable on its effective interior, with

\[
U'(\infty)=0,
\]

and either \(U'(0+)=\infty\) or \(U'(-\infty)=\infty\), according to its domain. Nondegeneracy is also imposed:

\[
u(x)<\sup_\xi U(\xi)
\]

for some, hence in this setting all, admissible initial wealths. For unbounded-above utility this requires finite maximal expected utility; for bounded-above utility it prevents approaching the utility supremum costlessly. No-arbitrage and Inada conditions alone do not automatically imply this condition in general markets.

## 3. Conjugate utility and the basic inequality

Define

\[
V(y)=\sup_{z\in\operatorname{dom}U}\{U(z)-yz\},\qquad y>0.
\]

Then \(V\) is strictly convex and differentiable, and

\[
I(y)=(U')^{-1}(y)=-V'(y).
\]

The pointwise Fenchel inequality is

\[
U(z)\le V(y)+yz,
\]

with equality exactly when \(y=U'(z)\), or \(z=I(y)\). Applied state by state to a feasible wealth and a feasible dual variable, it supplies the upper bound that becomes equality at the optimum.

The paper's representative pairs are

\[
U(z)=\log z,\quad V(y)=-\log y-1,\quad I(y)=1/y;
\]

\[
U(z)=z^\alpha/\alpha,\quad
V(y)=\frac{1-\alpha}{\alpha}y^{\alpha/(\alpha-1)},
\quad I(y)=y^{1/(\alpha-1)},\quad0<\alpha<1;
\]

\[
U(z)=-e^{-\gamma z}/\gamma,\quad
V(y)=\frac y\gamma(\log y-1),
\quad I(y)=-\frac1\gamma\log y.
\]

The normalization of exponential utility matters in the displayed inverse and conjugate. Multiplying utility by a positive constant does not change portfolio preferences, but rescales the multiplier and its formula.

## 4. Finite complete markets: the full calculation

Let states be \(\omega_1,\ldots,\omega_N\), with physical probabilities \(p_n>0\). In a complete arbitrage-free market there is a unique pricing measure \(Q\), with \(q_n>0\). Discounted Arrow–Debreu prices are \(q_n\).

A payoff vector \(\xi\) can be financed, or dominated by a financed payoff, from initial wealth \(x\) exactly when

\[
\sum_nq_n\xi_n\le x.
\]

The utility domain additionally determines whether negative components are permitted. The Lagrangian is

\[
L(\xi,y)=\sum_np_n\left[U(\xi_n)-y\frac{q_n}{p_n}\xi_n\right]+yx.
\]

For fixed \(y\), maximization separates across states. Its value is

\[
v(y)+xy,\qquad v(y)=\sum_np_nV(yq_n/p_n).
\]

Choose \(y>0\) so that \(-v'(y)=x\). The optimal state wealth is

\[
\widehat\xi_n=I(yq_n/p_n).
\]

The budget binds, \(\sum_nq_n\widehat\xi_n=x\), because utility is increasing. Fenchel equality then gives

\[
u(x)=v(y)+xy=\inf_{z>0}\{v(z)+xz\}.
\]

Theorem 2.1 proves existence and uniqueness of terminal wealth, conjugacy of the value functions, and

\[
U'(\widehat X_T)=y\frac{dQ}{dP},\qquad y=u'(x),
\quad x=-v'(y).
\]

This is an exact finite-dimensional result. Uniqueness of the terminal payoff does not by itself imply uniqueness of the vector of trading positions if securities or strategies are redundant.

For log utility the formula becomes \(\widehat X_T=x/(dQ/dP)\), since the budget yields \(y=1/x\). For power utility, \(y\) is chosen by a single scalar budget equation. The pricing density makes wealth relatively expensive in some states; optimal marginal utility is correspondingly high there, hence optimal wealth is relatively low.

## 5. Finite incomplete markets: why the dual chooses a measure

With incomplete markets, there are many martingale measures. A claim is superreplicable from \(x\) precisely when

\[
E_Q[X_T]\le x\quad\text{for every }Q\in\mathcal M^a(S),
\]

where \(\mathcal M^a\) includes absolutely continuous measures. These inequalities describe **dominated or superreplicable claims**, not a criterion that every such claim must itself be exactly replicable. At an optimum with increasing utility, unused domination slack is eliminated.

In finite states, \(\mathcal M^a\) is a compact convex polytope with finitely many extreme measures \(Q^1,\ldots,Q^M\). The superreplication constraints can therefore be imposed only at these extreme points. If their nonnegative Lagrange multipliers are \(\eta_m\), write

\[
y=\sum_m\eta_m,\qquad
Q=\sum_m(\eta_m/y)Q^m.
\]

This consolidates the many budget multipliers into a positive scalar and one martingale measure. The dual is

\[
v(y)=\inf_{Q\in\mathcal M^a(S)}
E\left[V\left(y\frac{dQ}{dP}\right)\right].
\]

Compactness yields a minimizer, strict convexity gives uniqueness of its density, and the boundary behavior \(V'(0+)=-\infty\) pushes the finite-state optimum into equivalence with \(P\). Theorem 2.3 then gives

\[
\widehat X_T(x)=I\left(y\frac{d\widehat Q(y)}{dP}\right),
\qquad y=u'(x),
\]

together with the same value-function conjugacy as in the complete case.

The minimizing pricing measure is generally specific to the utility and to initial wealth through \(y\). Choosing an arbitrary equivalent martingale measure and applying inverse marginal utility need not produce an attainable or optimal claim in the original incomplete market.

## 6. Marginal utility prices and fictitious market completion

For any bounded claim \(f\), finite-state duality yields

\[
\left.\frac{d}{dh}E[U(\widehat X_T+hf)]\right|_{h=0}
=u'(x)E_{\widehat Q(y)}[f].
\]

Thus \(E_{\widehat Q(y)}f\) is a marginal utility price: at that price the investor is indifferent to first order about a small addition of the claim. It is not a universal no-arbitrage price for a nonreplicable payoff and need not equal the price for a finite quantity. Wealth, preferences, and existing positions matter.

The survey explains the economics through fictitious securities. Add enough missing claims \(f^j\) to complete the market, and assign their price processes

\[
S_t^{d+j}=E_{\widehat Q(y)}[f^j\mid\mathcal F_t].
\]

The completed market has \(\widehat Q(y)\) as its unique pricing measure. Yet the original optimal payoff remains optimal and can be attained without trading the added securities. The fictitious completion is a supporting-price construction for the investor's optimum, not an assertion that those markets already exist.

The finite-state envelope identities include

\[
u'(x)=E[U'(\widehat X_T)],\qquad
xu'(x)=E[\widehat X_TU'(\widehat X_T)].
\]

They represent first-order indifference to a marginal cash investment and to scaling the optimal portfolio, respectively. The first identity can fail in the general positive-wealth setting because the optimal dual variable may lose probability mass; the second survives.

## 7. Reasonable asymptotic elasticity

The additional utility-growth condition is

\[
AE_+(U)=\limsup_{x\to\infty}\frac{xU'(x)}{U(x)}<1.
\]

For utility defined on the entire real line, one also requires

\[
AE_-(U)=\liminf_{x\to-\infty}\frac{xU'(x)}{U(x)}>1.
\]

The inequalities are interpreted with the usual appropriate utility normalization; positive affine transformations preserve preference order and the economically relevant asymptotic condition. Log and standard power utility satisfy the positive-wealth requirement; exponential utility satisfies the whole-line conditions.

The ratio compares marginal utility with average utility per unit wealth. A utility that behaves like \(x/\log x\) for large positive \(x\) has marginal utility tending to zero, yet the ratio tends to one. It therefore satisfies the usual right Inada condition while failing reasonable asymptotic elasticity. On the negative side, behavior like \(x\log|x|\) produces the analogous boundary failure.

The condition is related to relative risk aversion

\[
RRA(x)=-xU''(x)/U'(x),
\]

but should not be replaced casually by a second-derivative condition. When the relevant limits exist and differentiation is justified, l'Hôpital's rule connects the elasticity limit with \(1-\lim RRA(x)\). A strictly positive lower asymptotic bound on relative risk aversion gives a sufficient condition in the setting discussed. Oscillatory curvature can prevent an equivalence based only on \(RRA\), while asymptotic elasticity still has the exact growth-control property needed for duality.

The claim of necessity is **uniform over a broad class of markets**: without the condition there exist admissible, even continuous and complete, markets where the conclusions fail. It is not a claim that every individual market fails whenever a chosen utility has boundary elasticity. Finite-state markets already demonstrate why such a universal market-by-market interpretation would be wrong.

## 8. The counterexample and why no-arbitrage is insufficient

Example 3.2 treats a whole-line utility whose asymptotic elasticity equals one at both tails. The construction produces a continuous complete market, represented using Brownian motion with a suitably chosen adapted drift, such that

\[
u(x)=c+x,
\]

and

\[
v(1)<\infty,\qquad v(y)=\infty\quad(y\ne1).
\]

The value function loses strict concavity and the desired marginal-utility boundary behavior. An optimal terminal payoff exists at only one initial wealth \(x_0\); at other wealth levels the supremum is not attained. This is not a counterexample based on arbitrage or a nonsmooth price process.

The mathematical construction starts with a positive density \(f\), \(E f=1\), selected so \(E V(f)<\infty\) but \(E V(yf)=\infty\) for every other scale. It then realizes that density through an equivalent Brownian pricing measure and uses Girsanov's theorem to build a complete market with the required dynamics.

The economic mechanism is a sequence of rare-state payoffs with roughly unit price and unit expected utility gain. Increasingly extreme claims keep improving the objective, but no limiting feasible payoff delivers the supremum. Reasonable elasticity prevents this combination from coexisting with finite maximal utility: suitable mixtures of such opportunities would otherwise make expected utility diverge. The survey sketches this construction and its economic interpretation; it refers to the original papers for the complete proof.

## 9. Positive wealth: the primal polar set

For \(x>0\), define

\[
\mathcal C(x)=\{g\ge0:g\le x+(H\!\cdot\!S)_T
\text{ for some admissible }H\},
\quad \mathcal C(x)=x\mathcal C(1).
\]

The superreplication theorem identifies it through expectations under pricing measures. The natural ambient space is \(L^0_+\), with convergence in probability: claims need not belong to a fixed \(L^p(P)\) space. This choice also avoids making the theory depend artificially on integrability under one particular equivalent probability measure.

The difficulty is that \(L^0\) is generally not locally convex, and the set of terminal wealths is not compact. A conventional normed-space Lagrange multiplier argument cannot simply be imported from the finite-state proof.

Positivity saves the essential pairing. For \(g,h\ge0\),

\[
\langle g,h\rangle=E[gh]\in[0,\infty]
\]

is always well defined, even if infinite, and Fatou's lemma supplies lower semicontinuity. The correct dual domain is the closed, convex, solid hull of pricing densities in \(L^0_+\), denoted \(\mathcal D\). “Solid” means that if \(h\) belongs to the domain, every nonnegative \(h'\le h\) also belongs.

The polar identities are

\[
g\in\mathcal C\iff E[gh]\le1\ \forall h\in\mathcal D,
\qquad
h\in\mathcal D\iff E[gh]\le1\ \forall g\in\mathcal C.
\]

These statements encode the feasible budget geometry needed for duality. They do not require an ordinary Hilbert-space inner product or a continuous bilinear form on all signed random variables.

## 10. Deflators, convex compactness, and Theorem 3.4

An equivalent dynamic description of \(\mathcal D\) uses terminal values of nonnegative supermartingale deflators. A process \(Y\) starts at one and makes \(YX\) a supermartingale for every admissible nonnegative wealth process \(X\). Unlike a probability-density process, it can lose expectation.

Lemma 3.3 supplies the compactness substitute: every sequence in a closed, convex subset of \(L^0_+\) bounded in probability admits forward convex combinations converging almost surely to a member of the set. The result is not that every bounded sequence has an almost surely convergent subsequence. Convexification is essential, and it is compatible with optimizing concave or convex objectives.

Set \(\mathcal D(y)=y\mathcal D\). Under no-arbitrage, the stated utility assumptions, nondegeneracy, and reasonable elasticity, Theorem 3.4 gives

\[
u(x)=\sup_{g\in\mathcal C(x)}E[U(g)],\qquad
v(y)=\inf_{h\in\mathcal D(y)}E[V(h)],
\]

with finite, continuously differentiable, strictly concave/convex value functions, conjugacy, and unique terminal optimizers satisfying

\[
\widehat X_T=I(\widehat Y_T),\qquad
\widehat Y_T=U'(\widehat X_T),\qquad y=u'(x).
\]

At the optimum the budget pairing saturates:

\[
E[\widehat X_T\widehat Y_T]=xy.
\]

Accordingly,

\[
u'(x)=\frac1xE[\widehat X_TU'(\widehat X_T)].
\]

The theorem is stated with explanation of the necessary domains and compactness machinery; the full proof is delegated to Kramkov–Schachermayer. Reasonable elasticity supplies the growth and integrability control needed to turn almost-sure limits of optimizing sequences into optimizer and differentiability results. Almost-sure convergence alone is not sufficient to exchange limits and expected utility.

## 11. Why a probability measure may fail to attain the positive-wealth dual

The survey describes a stopped geometric Brownian stock

\[
S_t=\exp(B_{t\wedge\tau}+\tfrac12(t\wedge\tau)),
\]

where \(\tau\) depends on a filtration generated by two independent Brownian motions. Its natural Girsanov density candidate is

\[
Z_t=\exp(-B_{t\wedge\tau}-\tfrac12(t\wedge\tau)).
\]

The stopping time can be chosen so the terminal density candidate has \(E[Z_\tau]<1\), while other equivalent pricing measures still exist. For logarithmic utility, this mass-losing candidate nevertheless attains the enlarged dual problem. It is not the density of a probability measure, which is why minimization over probability measures alone can fail to attain its infimum.

The primal–dual marginal utility identity survives. What fails is the inference

\[
u'(x)=E[U'(\widehat X_T)],
\]

because the right side equals \(E[\widehat Y_T]\), which may be strictly below \(y=u'(x)\). Normalizing the terminal deflator to have mean one changes the dual variable and does not automatically preserve the optimizer.

There is a useful change-of-numeraire interpretation. The optimal product process \(\widehat X\widehat Y\) is a uniformly integrable martingale. Using optimal wealth as numeraire restores a probability-based pricing rule through the density proportional to \(\widehat X_T\widehat Y_T\), whose expectation equals its initial value. Loss of cash-numeraire density mass is therefore compatible with coherent pricing in the appropriate numeraire.

## 12. Whole-line utility: closure of the primal rather than the dual

Exponential-utility optimal terminal wealth can have essential infimum \(-\infty\), even in familiar diffusion models. It may be approximated by bounded-loss strategies without itself satisfying a fixed credit-line constraint. Searching only within the original admissible class can therefore produce the right supremum but no maximizer.

For a locally bounded price process, define \(\mathcal C_U^b(x)\) as terminal random variables dominated by admissible wealth and having integrable absolute utility. Enlarge to

\[
\mathcal C_U(x)=\{X_T:U(X_T)\text{ lies in the }L^1(P)
\text{ closure of }\{U(G):G\in\mathcal C_U^b(x)\}\}.
\]

The closure is taken in **utility**, not simply in wealth under convergence in probability. This preserves expected-utility values and controls loss tails in a way related to the investor's preferences. When utility is bounded above, the abstract closed domain may initially allow \(+\infty\) payoff on some states; finiteness and trading representation require the additional conclusions discussed below.

Theorem 3.5 assumes both reasonable-elasticity conditions, no-arbitrage, nondegeneracy, and local boundedness. It gives conjugacy and unique optimizers for

\[
u(x)=\sup_{X_T\in\mathcal C_U(x)}E[U(X_T)],
\quad
v(y)=\inf_{Q\in\mathcal M^a(S)}E[V(y\,dQ/dP)].
\]

Here the dual optimizer is an absolutely continuous probability measure. The inverse-marginal relation and both finite-state envelope identities return. Equivalence with \(P\) is an additional issue, not something to assume merely because a probability optimizer exists.

If the optimal measure is equivalent, the terminal optimum is finite almost surely and is represented by a predictable self-financing strategy whose wealth is a uniformly integrable martingale under that optimal measure. This provides an economically meaningful allowable class that excludes doubling while admitting unbounded downside states. For unbounded-above utility, the dual cost of zero density forces equivalence; for exponential utility, the survey cites finite-relative-entropy conditions ensuring it.

The proof strategy approximates whole-line utility by utilities with successively lower finite wealth boundaries, applies the positive-wealth theorem after translation, and passes to a limit. The delicate part is proving that the limiting primal and dual objects inhabit the intended enlarged domains.

## 13. Exponential utility, entropy, and the direction of the divergence

With \(U(x)=-e^{-\gamma x}/\gamma\) and a probability density \(Z=dQ/dP\),

\[
E[V(yZ)]=\frac y\gamma\{\log y-1+E[Z\log Z]\}.
\]

For fixed \(y\), the dual therefore chooses the martingale measure minimizing relative entropy \(E[Z\log Z]=D(Q\Vert P)\). The minimizing measure does not depend on the scalar \(y\) in this special utility family, though its existence and equivalence still require the theorem's conditions.

For logarithmic utility,

\[
E[V(yZ)]=-\log y-1-E[\log Z].
\]

When \(Z\) is a probability density, its variable term is \(D(P\Vert Q)\), the reverse entropy direction. These objectives are not interchangeable. In the general log-utility case the optimizer may be a deflator with mass below one, so even the probability-divergence interpretation requires care.

This comparison makes the economic content of duality concrete: different preferences select different supporting pricing measures through different convex penalties, rather than there being one canonical risk-neutral measure for all incomplete-market investors.

## 14. Scope, extensions, and practical use

The survey briefly points toward intermediate consumption, state-dependent utility, random endowment, nonsmooth utilities, and transaction costs. It does not prove that the displayed terminal-wealth theorems apply unchanged to those settings. Random endowment can require keeping track of singular finitely additive dual components; transaction costs change the trading and dual feasibility geometry. These are substantive extensions, not extra parameters in the same formula.

There is no empirical portfolio test or new numerical optimization algorithm in the manuscript. Its practical contribution is a specification discipline for utility optimization: state the wealth domain and admissibility rule, check that utility is nondegenerate, verify the appropriate tail-growth conditions, use the correct closed primal and dual sets, and only then interpret inverse marginal utility as an optimizer.

The finite-state calculation provides a computational template: find the utility-optimal pricing measure, solve the scalar budget equation for \(y\), recover the terminal payoff through \(I\), and establish its trading representation. In general markets each of those steps has an existence or closure issue. A formal first-order condition alone does not prove that the proposed payoff is attainable, admissible, integrable, or optimal.
