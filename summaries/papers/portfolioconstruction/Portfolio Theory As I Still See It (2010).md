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
