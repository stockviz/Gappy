## 1. Metadata

- **Title:** Portfolio Theory: As I Still See It
- **Author(s):** Harry M. Markowitz
- **Year:** 2010
- **Journal/Venue:** *Annual Review of Financial Economics*

## 2. Problem statement

This is a retrospective synthesis rather than a single theorem paper. Markowitz revisits three precise issues:

1. when mean-variance analysis is normatively justified,
2. what sort of utility/risk assumptions underlie practical portfolio theory,
3. and what CAPM and related theories do and do not imply.

## 3. Approach (short)

The paper is conceptual and analytic. Markowitz re-derives the conditions under which expected utility is well approximated by a mean-variance criterion, reviews alternative risk measures through the utility they implicitly assume, discusses hypotheses about actual behavior under uncertainty, and critiques the interpretation of CAPM. The method is theoretical clarification rather than new optimization machinery.

## 4. Approach (detailed)

1. **Clarify what Markowitz never assumed.**

   The paper emphasizes two negative points:

   - portfolio theory does **not** require Gaussian returns,
   - and it does **not** require investors to have globally quadratic utility.

2. **Justify mean-variance as an approximation.**

   If utility $U(R)$ is sufficiently well approximated by a quadratic over the relevant range of portfolio returns, then
   $$
   E[U(R)] \approx f(E[R],\operatorname{Var}(R)).
   $$
   Markowitz revisits quadratic expansions around zero or around the mean to show when this approximation is reasonable.

3. **Discuss alternative risk measures.**

   Risk measures such as variance, semivariance, VaR, and CVaR implicitly correspond to different preference structures. The paper argues that when the return distribution is too wide for quadratic approximation, one should use a criterion more directly tied to the investor's underlying utility rather than forcing mean-variance language.

4. **Revisit behavior under uncertainty.**

   Markowitz compares his 1952 "dual kinks around current wealth" view with prospect-theory-type ideas and returns to the question of lotteries and insurance. He also gives proofs that an expected-utility maximizer would not prefer a multiple-prize lottery to all single-prize lotteries, clarifying a claim left informal in his earlier work.

5. **Critique CAPM interpretations.**

   The paper stresses that the linear expected-return-beta relation of textbook CAPM depends on very strong assumptions. If one relaxes frictionless borrowing at the risk-free rate or overly simple budget constraints, the market portfolio need not be mean-variance efficient and the standard beta relation need not hold. Hence empirical "beta pricing" exercises often test much stronger assumptions than is usually acknowledged.

### Proof sketch

The paper's main technical content is not a new theorem but a sequence of analytic clarifications:

- Taylor approximation explains when expected utility reduces to a function of mean and variance;
- counterexamples and proofs regarding lotteries distinguish expected-utility from alternative behavioral hypotheses;
- simple CAPM algebra shows that the usual beta-pricing conclusion requires the full bundle of strong market assumptions, not merely investor dislike of variance.

## 5. Domain of applicability

The essay applies as a guide to how mean-variance theory should be interpreted in practice. Its central message is narrow but important: mean-variance is an approximation discipline, not a universal truth about either preferences or distributions. It does not provide a new implementable portfolio rule. Where users overread CAPM or overstate the generality of variance-based risk measures, the paper is corrective.

## 6. Source, scope, and the distinction between recommendation and description

[Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioManagement_Markowitz_2010.pdf>). Harry M. Markowitz, *Annual Review of Financial Economics* 2 (2010), pp. 1–23, DOI 10.1146/annurev-financial-011110-134602. The local PDF contains the full essay and two journal contents pages. It is a retrospective argument with mathematical examples, not a new empirical backtest or a new covariance estimator.

Markowitz distinguishes the 1952 portfolio article from his 1959 book. The former suggested mean-variance behavior both as a descriptive hypothesis and as a recommendation; the latter developed the normative expected-utility rationale without insisting that investors actually behave that way. His 1952 utility-of-wealth hypothesis about people who buy both insurance and lottery tickets is likewise a descriptive proposal, not his recommended investment criterion for a fiduciary.

For multiperiod decisions, the one-period utility that an optimizer approximates should be the dynamic program's **derived continuation utility**, reflecting the remaining investment and consumption problem. It need not be a fixed primitive utility of this period's return. Changes in age, wealth, liabilities, or opportunities can change that continuation function.

## 7. The two quadratic approximations, explicitly

For portfolio return $R$ with mean $m$ and variance $v$, expansion around zero gives

$$
Q_0(R)=U(0)+U'(0)R+\frac12U''(0)R^2,
$$

and therefore

$$
E[Q_0(R)]=U(0)+U'(0)m+\frac12U''(0)(m^2+v).
$$

Expansion around the mean gives

$$
Q_m(R)=U(m)+U'(m)(R-m)+\frac12U''(m)(R-m)^2,
$$

so $E[Q_m(R)]=U(m)+U''(m)v/2$. These are different approximations. In particular, a quadratic expansion around zero includes the squared-mean term; it is not automatically the familiar linear-mean-minus-variance objective.

For log wealth utility $U(R)=\log(1+R)$, the two expected-utility approximations are

$$
m-\frac12(m^2+v),
\qquad
\log(1+m)-\frac{v}{2(1+m)^2}.
$$

The source's table shows that $R-R^2/2$ approximates log utility reasonably over moderate **whole-portfolio** returns. At $R=-0.3$, the values are roughly −0.35 and −0.36; at $R=0.4$, they are roughly 0.32 and 0.34. The essay describes a useful central interval around a 30-percent loss to a 40-percent gain, with tolerable but growing discrepancies somewhat beyond it. These are illustrative approximation ranges, not a formal universal error tolerance for every investor.

The failure at extremes is essential. As $R\downarrow-1$, log utility diverges to minus infinity while the quadratic approaches −1.5. For sufficiently large gains the quadratic turns downward, although log utility remains increasing. A small chance of near-total loss can therefore matter enormously to expected log utility even if the first two moments look ordinary. Leverage can push portfolio returns out of the range in which the approximation is defensible.

The argument does not need Gaussian returns. It needs control of expected approximation error over the relevant return distribution. A useful mathematical restatement is that if $|U(R)-Q(R)|\le\epsilon$ for every feasible outcome, then the expected-utility error is at most $\epsilon$; if the bound holds only on a central region, the tails require a separate integrable error bound. The latter qualification is the substance behind the essay's phrase that departures should not occur too far or too often.

## 8. What a risk measure says about preferences

The essay asks what utility specification is implicit when expected-utility choices depend only on expected return and an expected function $E[f(R)]$. Over a sufficiently rich family of lotteries, the corresponding utility must have the form $a+bR+cf(R)$. This is a characterization of exact expected-utility representation, distinct from the claim that a chosen pair of statistics can approximate preferences over a restricted investment menu.

For a fixed threshold $b$, semivariance uses $E[((R-b)^-)^2]$ and corresponds to a utility that is quadratic below the threshold and linear above it. With $b=0$, it avoids penalizing large gains but loses diminishing marginal utility over all positive returns. In the source's log-utility comparison, ordinary quadratic utility is closer over moderate positive gains precisely because log utility is still concave there.

Expected loss and absolute deviation about a fixed threshold lead to piecewise-linear utilities. They are locally risk-neutral on each side of the kink. That may be a useful approximation for some objectives, but it is not a free improvement on a concave utility representation merely because the statistic sounds like downside risk.

Deviation about the **mean** is a different object from deviation about a fixed threshold. For a Bernoulli payoff taking 1 with probability $p$ and 0 otherwise, mean absolute deviation about its own mean is $2p(1-p)$, whereas $E[f(R)]$ for a fixed state utility is affine in $p$. This proves that no fixed function $f$ can represent that statistic as an expectation for all probabilities. It does not prove that the statistic has no useful role in risk management.

## 9. VaR and CVaR: the author's critique needs qualification

Markowitz objects that quantile-based criteria need not be linear expectations of a fixed utility function and discusses discontinuity as outcome probabilities cross a quantile threshold. The VaR example is valid: for a discrete distribution, an arbitrarily small probability change can switch the selected quantile from one support point to another.

The essay also asserts that CVaR jumps by identifying it with the conditional mean of every outcome at or beyond the VaR threshold. For distributions with atoms, that convention is not the same as the coherent expected-shortfall/CVaR definition that includes only the required fraction of probability mass at the quantile. For a finite loss distribution with bounded outcomes, standard CVaR can be written

$$
\operatorname{CVaR}_{\alpha}(L)
=\min_z\left[z+\frac{1}{1-\alpha}E[(L-z)^+]\right].
$$

With the appropriate fractional mass convention, the value is continuous in the probabilities in the finite-support example, although derivatives and optimal thresholds can change. Consequently the essay's blanket CVaR-discontinuity objection should not be repeated as a general theorem about coherent CVaR.

The same section equates a conditional tail mean with a lower-partial-moment expression. In general these are different: a conditional expectation divides by tail probability, while an unconditional shortfall moment does not. This does not invalidate the broader philosophical distinction between a coherent risk measure and expected-utility preferences, but it limits the specific argument as printed.

A change in the optimal portfolio itself is also different from a discontinuity in optimized value. The essay gives a linear-utility example in which a tiny change in expected returns switches all wealth between two securities, while the utility difference remains tiny. Portfolio turnover and preference continuity therefore require separate analysis.

## 10. The proposed alternative for wider return distributions

For cases in which mean-variance is inadequate, Markowitz proposes combining geometric mean as the return measure with semivariance about a fixed threshold. Since

$$
\log(1+GM)=E[\log(1+R)],
$$

a corresponding expected-utility criterion is based on

$$
U(R)=a+c\log(1+R)-d[((R-b)^-)^2],
\qquad c>0,\ d\ge0.
$$

On $R>-1$, this is increasing and concave: the log term preserves diminishing marginal utility for gains, while the downside term imposes extra caution below the threshold. Setting $d=0$ gives pure log growth; increasing $d$ sacrifices some long-run growth for downside protection in the specified sense.

The essay contrasts this with subtracting $dR^2$ from log utility, which eventually makes utility decline at very large positive returns. The proposed combination is thus motivated by the shape of utility across the entire relevant domain, not merely by a label attached to a risk statistic.

It is computationally and statistically more expensive than mean-variance because expected log return and downside moments require more distributional information. If log expectation is well approximated by mean and variance, one can first generate a conventional frontier and relabel the return axis with estimated geometric mean. When the approximation fails, simply relabeling does not recover the truly efficient geometric-mean/semivariance set.

Markowitz also acknowledges a tension: he regards bounded utility as normatively plausible, while log utility is unbounded below near ruin. He treats log utility itself as an approximation over a relevant choice set. The essay therefore advocates a hierarchy of useful approximations, not one globally exact utility formula.

## 11. Insurance, lotteries, and reference wealth

The Friedman–Savage utility curve has two concave regions separated by a convex region. Markowitz argues that it predicts implausibly extreme fair gambles for some middle-wealth individuals and implausible insurance choices near the upper tangency point.

His alternative locates a central inflection near customary wealth, with concavity immediately below and convexity immediately above. Farther into large losses and large gains, additional curvature changes keep utility bounded. After windfall gains or losses, current wealth can temporarily differ from customary wealth, changing the local attitude toward risk.

This differs from the usual prospect-theory value curve near its reference point, which is convex for losses and concave for gains. It also differs in using ordinary expected utility rather than nonlinear probability weighting. The essay reviews experimental and theoretical arguments rather than resolving the empirical debate. Allowing a utility curve to vary with time or circumstances is not the same as allowing it to change merely because the offered menu changes; the latter can violate the fixed-preference expected-utility hypothesis.

## 12. Why an individual can choose a two-outcome lottery

The finite-support theorem is particularly clean. Given possible dollar outcomes $d_i$, an agent chooses probabilities to maximize $\sum_i p_i u_i$ subject to

$$
p_i\ge0,\quad\sum_i p_i=1,\quad\sum_i p_i d_i=k.
$$

This is a linear program with two equality constraints. Its nonempty feasible set is compact, and an optimum exists at an extreme point with at most two positive probabilities. Thus no three-or-more-outcome lottery can be **strictly preferred to every** one- or two-outcome alternative with the same expected payoff. A multi-outcome lottery can still tie an optimum, and actual lottery buyers are rarely offered every feasible probability distribution.

The source's second proof for general prize distributions contains a gap: it conditions on a particular winning payoff while leaving the win probability fixed, then compares that component with the best single-prize lottery under the common expected-payoff constraint. The conditioned component generally has a different expected payoff and need not be feasible for that comparison.

For ordinary lotteries the intended mixture argument can be repaired. Hold ticket loss $-C$ fixed and suppose winning payoffs $R$ satisfy $R\ge k$, with $C+k>0$. A single-prize lottery with payoff $R$ and common expected payoff $k$ must win with probability

$$
p_R=\frac{C+k}{C+R}.
$$

If the original lottery has win probability $p$ and conditional prize distribution $Q(dR)$, weight these single-prize lotteries by

$$
a(dR)=\frac{p(C+R)}{C+k}Q(dR).
$$

The expected-payoff constraint implies $\int a(dR)=1$, and $a(dR)p_R=pQ(dR)$. The mixture reproduces both the original prize probabilities and the loss probability. Its expected utility is an average of feasible single-prize utilities, so cannot exceed their supremum; existence of a maximizing single-prize lottery gives the desired conclusion. This reconstruction states the additional feasibility assumptions explicitly rather than treating the printed conditional-expectation step as sufficient.

## 13. Market supply of lotteries need not reveal an individual's preferences

Even if each expected-utility maximizer has a preferred single-prize design, a vendor serving heterogeneous buyers may rationally offer a multi-prize lottery. The essay provides two buyer types: one prefers a small-prize lottery and the other a large-prize lottery. Their expected utilities of the two single-prize alternatives are 1.010 and 0.999 in opposite order, while both obtain 1.0045 from the mixed prize structure, above the no-purchase utility of 1. A single offered multiple-prize lottery can therefore attract both types.

This is an aggregation point: observing that a product is sold does not imply every buyer would prefer it to all tailored alternatives. The example also restricts each buyer to at most one ticket, through budget or utility assumptions.

The essay speculates about nonlinear preference functions of probability vectors to describe a genuine preference for multiple prizes. Its suggestion that a positive-definite quadratic term would explain an interior diversification preference is not a general mathematical conclusion: maximizing a convex quadratic over the fixed-mean probability polytope still admits an extreme-point maximizer. That exploratory discussion should be treated as a behavioral conjecture rather than a proved characterization.

## 14. What the CAPM critique does establish

The Sharpe–Lintner version assumes common beliefs, mean-variance efficient choices, and unrestricted borrowing and lending at the risk-free rate. The alternative labeled “Roy” in the essay permits unrestricted signed weights subject only to $\mathbf1^\top w=1$. Both lead to efficient aggregation and linear beta pricing under their respective assumptions.

Markowitz argues that the lone budget equation is a poor representation of actual shorting. A portfolio with weights $(−1000,1001)$ satisfies it but demands gross exposures and unrestricted use of short-sale proceeds far beyond ordinary financing arrangements. Collateral, short rebates, margin, and asymmetric borrowing conditions matter. The exact regulatory arrangements are historical context in this essay, not current trading guidance.

With realistic heterogeneous constraints, even investors sharing correct beliefs and individually choosing efficiently need not aggregate into a mean-variance efficient market portfolio. Hence failure of a simple expected-return/beta relation is not by itself evidence that investors are irrational. It can reject the financing and aggregation assumptions instead. This is a joint-hypothesis critique, not proof that every empirical CAPM failure has one particular cause.

## 15. The “not paid for bearing risk” argument and its interpretation

Under the frictionless CAPM first-order conditions,

$$
\Sigma w_M=k_M e,
\qquad e_i=E[R_i]-R_f.
$$

In the uncorrelated case, $w_{M,i}=k_Me_i/V_i$. Two securities can have equal standalone variance and different expected excess returns, with equilibrium market weights adjusting accordingly. Likewise equal expected excess returns can coexist with different standalone variances.

The market covariance is then $\operatorname{Cov}(R_i,R_M)=V_iw_{M,i}=k_Me_i$, so beta pricing holds. Markowitz interprets this as a warning against treating the covariance structure alone as a causal determination of the vector of expected returns independently of supplies and market composition.

The provocative title should not be mistaken for a disproof of the algebraic CAPM relation or for a demonstration that marginal covariance risk is irrelevant. Market weights and hence betas are endogenous in the example. Equal standalone variances are compatible with different covariances with the market, which is precisely the risk variable in the standard pricing equation. A careful reading distinguishes the author's interpretation of compensation from the valid equilibrium relation itself.

## 16. Practical use of the essay

The essay supports an explicit decision process: specify the investor's actual objective and horizon, judge whether a quadratic approximation is adequate over whole-portfolio outcomes, estimate forward-looking moments, impose financing and other economically meaningful constraints, and examine a frontier through informed tradeoff choices. Historical windows, constraints, and utility approximations all embed judgment; using an optimizer does not remove it.

Its most valuable discipline is to separate statements that are often conflated: normative expected-utility reasoning versus observed behavior, exact utility representation versus local approximation, individual efficiency versus market efficiency, and a pricing identity versus a causal story. Some specific arguments in the essay require the mathematical qualifications above, but its insistence that portfolio theory be evaluated in the actual feasible investment setting remains central.
