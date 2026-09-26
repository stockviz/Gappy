# Portfolio Choice Theory with Non-Gaussian Distributed Returns (2003)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioChoice_OrtobelliHuberRachevSchwartz_2003.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Portfolio Choice Theory with Non-Gaussian Distributed Returns
- **Author(s):** Sergio Ortobelli, Isabella Huber, Svetlozar T. Rachev, Eduardo S. Schwartz
- **Year:** 2003
- **Journal/Venue:** Chapter in *Handbook of Heavy Tailed Distributions in Finance*

# 2. Problem statement

The chapter asks which finite-parameter families of return distributions are consistent with expected-utility maximization and stochastic-dominance portfolio choice once Gaussianity is abandoned. More concretely, it studies how portfolio choice should be reformulated when returns are heavy-tailed, possibly stable, and possibly outside the finite-variance elliptical world in which mean-variance analysis is valid.

# 3. Approach (short)

The method is a classification argument based on stochastic dominance and parametric distribution families. The authors first identify broad classes of portfolio return distributions that can be ordered by a finite number of parameters in a way consistent with expected utility. They then specialize to stable-Paretian and sub-Gaussian stable models, where variance is replaced by scale/dispersion parameters and separation results analogous to mean-variance theory can be recovered. The chapter is mainly structural rather than algorithmic.

# 4. Approach (detailed)

1. **Why mean-variance is too narrow**

   In the Gaussian/elliptical case, expected utility can often be ordered by mean and variance alone. Once returns are non-Gaussian and heavy-tailed, this is generally false:
   - variance may not exist;
   - higher-order tail behavior matters;
   - the Markowitz-Tobin efficient set need not coincide with the expected-utility efficient set.

   The chapter’s aim is to recover a finite-parameter ordering wherever possible.

2. **Parametric classes consistent with stochastic dominance**

   The authors define broad families of portfolio return distributions indexed by a finite vector of parameters. Their Theorems 1 and 2 relate location and scale orderings to stochastic dominance within carefully defined common families. Additional shape parameters are held common in the stated comparisons; the results do not provide a universal monotone ordering of arbitrary tail parameters.

   In schematic form, if portfolio returns belong to a common family indexed by
   $$
   a=(a_1,\dots,a_k),
   $$
   and one portfolio has better parameter values in the relevant partial order, then first- or second-order stochastic dominance follows. The exact ordering depends on whether the class is bounded below ($\sigma\tau_k^+$-type families) or unbounded ($\sigma\tau_k$-type families).

   The important logical point is this: the chapter does **not** claim that every heavy-tailed family admits such a reduction. It identifies classes where the reduction is valid.

3. **Implication for classical portfolio theory**

   Theorem 1 shows why mean-variance survives only as a special case. If the common family is elliptical with finite variance, then the finite parameter vector collapses to location plus a dispersion parameter proportional to variance. Outside that case, the efficient frontier must be described in a different mean-risk plane.

4. **Stable laws and domains of attraction**

   The chapter then argues that stable laws are attractive for portfolio choice because:
   - sums of stable variables remain stable;
   - many empirical heavy-tailed return processes lie in the domain of attraction of stable laws;
   - one can replace variance by a scale parameter when $\alpha<2$.

   If $r$ is jointly $\alpha$-stable with $1<\alpha<2$, linear portfolios $x^\top r$ are again $\alpha$-stable. Hence one can formulate a mean-dispersion problem using expected return and stable scale.

5. **Sub-Gaussian stable model**

   In the sub-Gaussian $\alpha$-stable case, portfolio risk is summarized by a quadratic form
   $$
   \sigma_\alpha(x)=\sqrt{x^\top Q x},
   $$
   where $Q$ is the dispersion matrix playing the role that covariance plays under normality. The portfolio characteristic function has the stable form
   $$
   \phi_{x^\top r}(u)=\exp\!\left(iu\,x^\top \mu - |u|^\alpha \sigma_\alpha(x)^\alpha\right)
   $$
   in the symmetric case.

   This leads to a mean-dispersion frontier formally analogous to Markowitz:
   - maximize $x^\top \mu$ for fixed $\sigma_\alpha(x)$, or
   - minimize $\sigma_\alpha(x)$ for fixed $x^\top\mu$.

   The algebra mirrors Gaussian portfolio choice, but the interpretation changes: the relevant risk object is stable scale, not variance.

6. **Fund separation under heavy tails**

   A major result of the chapter is that separation theorems can survive in stable settings.

   - In the symmetric sub-Gaussian stable model, the efficient set admits a two-fund separation analogous to the Gaussian case.
   - With additional asymmetric or factor structure, one obtains a three-fund separation or, more generally, a $k+1$-fund separation for returns in the domain of attraction of a multivariate stable law.

   Separation is exact for the stipulated distributional model. Results involving domains of attraction also use limiting arguments and should not be treated as exact finite-horizon empirical distribution claims.

7. **Institutional restrictions and no-short-sale cases**

   The chapter also distinguishes:
   - unrestricted short-sale settings, where the separation results have clean linear-algebra form;
   - constrained settings, where the dominance ordering must respect positivity or other institutional restrictions.

   The message is that the finite-parameter stochastic-dominance logic is preserved only after the admissible set is specified carefully.

8. **Comparison with Gaussian allocations**

   The authors estimate Gaussian and sub-Gaussian stable models and compare implied allocations. The direction of the difference depends on the preference functional and its moment order: stable-based investors are not uniformly more conservative. The numerical cases and the moment-existence restriction are discussed below.

9. **Proof structure**

   The proof logic in the chapter is mostly dominance-theoretic.

   - Theorems 1 and 2 use the common parametric family structure to show that parameter orderings imply FSD/SSD orderings.
   - The stable separation results then exploit closure of stable laws under linear combinations.
   - The Gaussian analogy arises because the sub-Gaussian stable family still delivers a quadratic portfolio dispersion form $x^\top Qx$.

   What is exact:
   - the dominance implications within the specified families;
   - the separation results conditional on stable-family assumptions.

   What is approximate or empirical:
   - the claim that actual return data are well represented by a given stable family;
   - the numerical superiority of stable over Gaussian allocations.

# 5. Domain of applicability

- The chapter applies where return distributions are plausibly heavy-tailed and can be represented, or approximated in the tail, by stable or stable-domain families.
- It is especially relevant when variance is infinite or empirically unreliable, so mean-variance is conceptually misaligned with investor risk.
- The results are only as strong as the common-family assumption. If portfolios do not belong to a single parametric family with the required ordering, the dominance reductions do not go through.
- The sub-Gaussian stable analogy to Markowitz is narrower than the prose sometimes suggests: it works because the stable model still preserves a quadratic dispersion form.
- The genuinely new contribution is not a numerical optimizer but a distributional map of when portfolio choice can still be reduced to a finite-dimensional ranking under non-Gaussian returns.

## 6. Distributional assumptions behind the dominance results

The chapter's two classes should not be compressed into a general rule that every tail parameter should simply be made smaller. In the stated comparisons, additional shape parameters are held common across the portfolios being compared. The location and scale restrictions then determine which stochastic orders can be inferred. The positive-return class $\sigma\tau_k^+$ and the translation-invariant class $\sigma\tau_k$ have different closure properties, so their theorems are not interchangeable.

For example, Theorem 1 includes the implication that a portfolio with a weakly larger mean and weakly smaller scale, with at least one strict inequality, second-order stochastically dominates its comparator within the specified positive class. With equal means, lower scale characterizes a Rothschild–Stiglitz improvement. Several other implications use the ratio of mean to scale and are one-way statements; the authors explicitly note counterexamples to their converses. A favorable mean/scale comparison outside the common family is therefore insufficient to establish dominance.

For unbounded returns, Theorem 2 links a mean-and-scale ordering to a dominance statement accompanied by a mean-preserving-spread representation. In schematic notation, the worse return can be represented in distribution as the better return less its mean advantage, plus a residual with conditional mean zero. It is the existence of this structure, not merely an observed pair of sample moments, that connects the order to preferences of all concave-utility investors. These distinctions matter when comparing a Gaussian fit with a stable fit: those models need not lie in the same common-shape comparison class.

A domain-of-attraction result is also an asymptotic statement. Properly centered and normalized sums converge to a stable law under the relevant tail assumptions. It does not imply that every finite-horizon return vector is exactly stable or that a finite-period portfolio separation theorem transfers without approximation. The chapter uses both exact stable models and limiting arguments; an implementation must identify which justification it is using.

## 7. Mean–dispersion optimization and the role of the risk-free asset

Write $\mu=E[r]$, $e=(1,\ldots,1)'$, and let $z_0$ be the risk-free return in the same units and horizon. Under the symmetric sub-Gaussian stable specification, all portfolios share a stability index $\alpha$, and their scales are proportional to $\sqrt{x'Qx}$. For $1<\alpha<2$, their means exist but their variances do not. $Q$ is thus a dispersion matrix and must not be reported as the population covariance matrix. Its normalization depends on the characteristic-function convention.

With unrestricted positions and nonsingular $Q$, the normalized risky tangency fund has the familiar algebraic form

$$
\bar x=\frac{Q^{-1}(\mu-z_0e)}{e'Q^{-1}(\mu-z_0e)}.
$$

The denominator must be nonzero, and its sign and the admissible risky exposure matter when interpreting the efficient branch. This formula identifies the risky composition; it does not identify the investor's allocation between that fund and cash. When short sales are prohibited, the composition instead comes from a constrained maximum excess-mean-to-scale problem. Active constraints can remove assets entirely, so blindly clipping the unrestricted vector does not reproduce the constrained optimum.

Two-fund separation is useful precisely because it separates two decisions. Common beliefs about the sub-Gaussian return family identify the risky fund, while preferences determine the total amount of risk held. The more general separation results require the chapter's additional factor or asymmetry structure. A generic multivariate stable law is characterized by a spectral measure, which contains more dependence information than a covariance-like matrix. The quadratic $Q$ representation should not be exported to every stable distribution.

## 8. Fractional-moment preferences make the tail issue explicit

For the numerical comparison the chapter uses a mean-minus-central-moment criterion, of the form

$$
J(W)=E[W]-cE|W-EW|^q,\qquad c>0.
$$

For a non-Gaussian $\alpha$-stable return, the absolute central moment is finite only for $q<\alpha$. Taking $q=2$ when $\alpha<2$ defeats the purpose of changing models: the risk term is then infinite. Likewise, existence of a mean does not guarantee existence of expected utility for an arbitrary utility function. Exponential utility, for example, can have an infinite negative expectation under an unbounded stable left tail.

For a fixed risky fund with mean $\bar\mu$ and scale $\bar\sigma$, put $a$ in that fund and $1-a$ in cash. For $a\ge0$,

$$
J(a)=z_0+a(\bar\mu-z_0)
-c\,a^q\bar\sigma^q V(\alpha,0,q),
$$

where $V(\alpha,0,q)$ is the standardized symmetric stable absolute moment. For $1<q<\alpha$ and a positive excess mean, the unconstrained interior solution is

$$
a^*=\left[\frac{\bar\mu-z_0}
{cq\bar\sigma^qV(\alpha,0,q)}\right]^{1/(q-1)}.
$$

This derivation explains why the risky weight can differ even when the tangency composition changes little: the tail-dependent moment coefficient enters the investor's demand directly. A cash/no-borrowing constraint requires clipping the interior solution to the feasible interval and checking the endpoints. At $q=1$, the objective is piecewise linear in exposure rather than strictly concave on the positive branch; the interior formula is inapplicable. Comparing models also requires matching the units of $c$, because a fractional-moment penalty has different scaling from variance.

## 9. What the numerical illustration actually establishes

The data exercise uses 23 index and commodity series over January 3, 1995–January 30, 1998, with a risk-free rate taken as 6% annually. The chapter compares a Gaussian model with two fitted sub-Gaussian stable specifications, whose reported stability indices are approximately 1.7488 and 1.8856. The no-short-sale risky funds concentrate in four indices: DAX 100 Performance, FTSE All Share, Nikkei 300 Weighted, and Dow Jones Industrials. The fitted models produce different allocations within that restricted set and different cash/risky splits.

The preference comparison is sensitive to $q$. In the reported cases $q=1.45$ and $1.55$, Gaussian-model investors can hold less risky exposure than stable-model investors. As $q$ approaches the smaller stable index, the relevant stable absolute moment grows sharply, and the stable investor becomes more conservative. Thus neither “heavy tails always reduce risky allocations” nor “Gaussian variance always understates the investor's chosen risk penalty” follows from this illustration. It is the complete fitted distribution, the selected moment order, and the preference coefficient together that determine the answer.

This is a fitted-allocation illustration, not a transaction-cost-adjusted out-of-sample trading contest. The sample is short for estimating extreme-tail behavior, and the asset set is small and historically specific. The chapter's primary contribution is the structural characterization of admissible distributional reductions and separation, not a demonstrated persistent return advantage of stable portfolio optimization.

## 10. Practical use and limits

A faithful application first checks moment existence and the appropriate distributional class, then estimates location and dependence/dispersion consistently with that class. Next it solves the risky-fund problem with actual position restrictions, and only then selects cash exposure using a well-defined preference functional. Tail-index uncertainty should be tested explicitly, particularly when the chosen moment order is close to the estimated index: a small change in $\alpha$ can substantially change the risk penalty or make it undefined.

Useful diagnostics include the sensitivity of asset selection to $Q$, the effect of alternative tail indices on $V(\alpha,0,q)$, and the stability of the cash weight under different estimation windows. Expected-return uncertainty remains important even though variance has been replaced by stable scale. The theory supplies a coherent framework under its assumptions; it does not remove the estimation problem or supply a universal ordering of portfolios from arbitrary heavy-tailed samples.
