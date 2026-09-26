# The Surprising Robustness of Dynamic Mean–Variance Portfolio Optimization to Model Misspecification Errors

**Pieter M. van Staden, Duy-Minh Dang, and Peter A. Forsyth.** Accepted 12 July 2020; manuscript dated 25 July 2020. *European Journal of Operational Research*, journal pre-proof, DOI: 10.1016/j.ejor.2020.07.021. [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/portfolio_multiperiod_2021.pdf>). The local filename says 2021, while the supplied pre-proof requests a 2020 citation. All 33 PDF pages, including the appendix and numerical tables, are covered here.

## 1. What the paper asks—and what robustness means

An investor optimizes a dynamic mean–variance policy under a specified return model, then trades that same feedback policy in a market with different dynamics. The paper derives the resulting terminal mean and variance rather than simply recomputing a new optimal portfolio after changing parameters. Its central result is that, in the unconstrained model, the effect of misspecification depends on a few combinations of first and second moments. Large changes in individual jump or diffusion parameters can leave those combinations nearly unchanged.

The investigation distinguishes pre-commitment mean–variance optimization (PCMV) from time-consistent mean–variance optimization (TCMV), continuous from discrete rebalancing, and unconstrained from leverage- and insolvency-constrained policies. The conclusions are conditional: some calibrated model pairs give small errors, while others produce very large risk errors. Neither formulation dominates under every measure of robustness.

There is one risky asset—a diversified equity index—and one risk-free asset. This is chiefly a stock–cash allocation problem. It is not a theorem that high-dimensional estimated stock covariance inverses are stable or that individual portfolio weights are insensitive to estimation error.

## 2. Asset dynamics and the parameter combinations that matter

All returns are real, after inflation. The investor and true model share a correctly specified constant real risk-free rate \(r\). The risky asset in model \(j\in\{iv,tr\}\) follows

\[
\frac{dS_j}{S_{j,-}}
=(\mu_j-\lambda_j\kappa_{j,1})dt+\sigma_jdZ_j
+d\!\left(\sum_{k=1}^{N_j(t)}(\xi_{j,k}-1)\right),
\]

where \(N_j\) is Poisson with intensity \(\lambda_j\), jump multipliers are independent of the diffusion and arrival process, and

\[
\kappa_{j,1}=E(\xi_j-1),\quad
\kappa_{j,2}=E[(\xi_j-1)^2],\quad
v_j=\sigma_j^2+\lambda_j\kappa_{j,2}.
\]

Thus the infinitesimal expected return is \(\mu_jdt\), and the infinitesimal variance is \(v_jdt\). The jump second moment, including the squared mean of the jump return, is required; it cannot be replaced by jump variance alone. The relevant squared instantaneous Sharpe ratio is

\[
A_j=\frac{(\mu_j-r)^2}{v_j}.
\]

With equal rebalancing intervals \(\Delta=T/m\), define the risky excess gross-return mean and gross-return variance by

\[
\alpha_j=e^{\mu_j\Delta}-e^{r\Delta},\qquad
\psi_j^2=e^{(2\mu_j+v_j)\Delta}-e^{2\mu_j\Delta},
\quad A_{j,\Delta}=\frac{\alpha_j^2}{\psi_j^2\Delta}.
\]

The key misspecification ratios are

\[
M=\frac{\mu_{tr}-r}{\mu_{iv}-r},\quad L=\frac{v_{tr}}{v_{iv}},
\qquad
M_\Delta=\frac{\alpha_{tr}}{\alpha_{iv}},\quad
L_\Delta=\frac{\psi_{tr}^2}{\psi_{iv}^2}.
\]

As \(\Delta\downarrow0\), the discrete ratios converge to \(M,L\), and \(A_{j,\Delta}\to A_j\). Ratios equal to one mean agreement in the relevant moments, not necessarily agreement in the entire distribution. Distinct diffusion and jump models can therefore generate identical terminal mean–variance outcomes under the policies considered here while differing in tail behavior.

Finite second moments are essential. For the Kou jump model, the positive-tail exponent must be large enough for the second jump moment, not merely the first, to exist. The calibrated examples meet that requirement. A misspecified zero or negative excess mean also requires care because some comparison results assume positive excess returns in both models.

## 3. Why PCMV and TCMV are different control problems

The objective is

\[
\max_u\{E[W_T]-\rho\operatorname{Var}(W_T)\}.
\]

Variance is not separable under conditional expectation, so directly applying an ordinary Bellman recursion changes the problem. PCMV solves an embedded quadratic terminal-target problem,

\[
\min_u E[(W_T-H)^2],\qquad H=\gamma/2,
\]

with the target chosen at inception to correspond to the desired efficient point. The policy is time-inconsistent with repeated reoptimization of the original mean–variance objective, but time-consistent for this fixed quadratic target. It is therefore an implementable feedback strategy if the investor retains the target.

TCMV instead restricts future behavior to an equilibrium policy: at each decision time the current self optimizes knowing that future selves will use their own mean–variance-optimal equilibrium controls. The paper calls this an optimal policy, but it is optimal within the time-consistency formulation, not the unrestricted pre-commitment control set.

No free cash withdrawal is included in the comparison. Consequently the quadratic target can penalize overshooting as well as falling short. This matters when interpreting target-seeking behavior as an investor preference rather than merely a numerical device.

## 4. Closed-form continuous policies and their investor-model frontiers

Let \(q=\mu_{iv}-r\), \(A=A_{iv}\), and let \(u_t\) denote dollars in the risky asset, not a fraction of wealth. With unrestricted positions,

\[
u_t^p=\frac{A}{q}\left(He^{-r(T-t)}-W_t\right),
\qquad
u_t^c=\frac{A}{2\rho q}e^{-r(T-t)}.
\]

PCMV decreases risky investment as wealth approaches the discounted target. TCMV invests a deterministic dollar amount in this constant-parameter model; its wealth fraction changes as wealth changes. Neither formula alone imposes nonnegative wealth, a borrowing limit, or a no-short constraint.

Put \(B=w_0e^{rT}\), \(D=H-B>0\), and \(a=AT\). Under the investor model,

\[
E_{iv}^p=B+(1-e^{-a})D,\qquad
S_{iv}^p=e^{-a}\sqrt{e^a-1}\,D,
\]

\[
E_{iv}^c=B+\frac{a}{2\rho},\qquad
S_{iv}^c=\frac{\sqrt a}{2\rho}.
\]

The upper efficient rays have slopes

\[
\Gamma_{iv}^p=\sqrt{e^a-1},\qquad
\Gamma_{iv}^c=\sqrt a,
\quad E_{iv}=B+\Gamma_{iv}S_{iv}.
\]

The restriction \(D>0\) selects the upper branch. Quadratic targets below the risk-free terminal wealth do not generate the economically relevant upper efficient ray simply because they solve an embedding problem.

For a common target standard deviation \(S_0>0\), the investor chooses

\[
D=\frac{S_0e^a}{\sqrt{e^a-1}},\qquad
\rho=\frac{\sqrt a}{2S_0}.
\]

Comparisons hold this intended risk level fixed, rather than fixing the same arbitrary \(\rho\) or \(\gamma\) across models and formulations.

## 5. Implementing the wrong policy: exact moments and a derivation

Keep the investor's policy and target fixed but let the asset evolve under the true model. Theorem 3.4 gives

\[
E_{iv\to tr}^p=B+(1-e^{-Ma})D,
\qquad
S_{iv\to tr}^p=e^{-Ma}\sqrt{e^{La}-1}\,D,
\]

\[
E_{iv\to tr}^c=B+\frac{Ma}{2\rho},
\qquad
S_{iv\to tr}^c=\frac{\sqrt{La}}{2\rho}.
\]

The PCMV mean follows by inserting the affine feedback into the true wealth equation. Its conditional expectation \(g(t)=E(W_t)\) satisfies

\[
g'(t)=(r-MA)g(t)+MAHe^{-r(T-t)}.
\]

The second-moment equation closes because the control is affine in wealth and the jump–diffusion has finite second moments. Subtracting the square of the first moment yields the displayed variance. An equivalent interpretation uses the target gap: its mean contracts at a rate determined by \(MA\), while its relative second moment grows at a rate determined by \(LA\).

For TCMV, risky dollar holdings are deterministic, so the expected accumulated risky gain scales by the drift ratio \(M\), while its variance scales by \(L\). This explains why TCMV risk distortion depends on \(L\) alone, whereas PCMV risk distortion depends on both ratios through wealth feedback.

The paper calls these realized coordinates a “true efficient point.” They are the mean and standard deviation of a policy optimized under the investor model; they need not lie on the unrestricted true-model efficient frontier. The terminology should not be read as a general efficiency guarantee.

## 6. Exact error measures and corrections to the shorter summary

The paper's reported relative errors are

\[
\%\Delta S=100\frac{S_{iv\to tr}-S_0}{S_0},\qquad
\%\Delta E=100\frac{E_{iv\to tr}-E_{iv}}{E_{iv}},
\]

and \(R=\sqrt{(\%\Delta S)^2+(\%\Delta E)^2}\). **Expected-wealth error is divided by total expected wealth**, not by \(E_{iv}-B\). The latter denominator instead arises naturally in its expected-excess-wealth multiplier.

Define

\[
E_{iv\to tr}-E_{iv}=\Theta\Gamma_{iv}S_0,
\qquad S_{iv\to tr}-S_0=\Psi S_0.
\]

Then

\[
\Theta_p=\frac{1-e^{-Ma}}{1-e^{-a}}-1,
\quad
\Psi_p=e^{(1-M)a}\sqrt{\frac{e^{La}-1}{e^a-1}}-1,
\]

\[
\Theta_c=M-1,\qquad\Psi_c=\sqrt L-1.
\]

Thus \(\%\Delta S=100\Psi\), while

\[
\%\Delta E=100\Theta\frac{E_{iv}-B}{E_{iv}}.
\]

When \(M=1\), \(R=100|\Psi|\) in percentage-point units. The source sometimes suppresses this factor of 100 when discussing error norms; consistency of units is necessary when implementing the formulas.

The local sensitivities near \(M=L=1\) further clarify the mechanism:

\[
\Theta_p\approx\frac{a}{e^a-1}(M-1),
\quad
\Psi_p\approx-a(M-1)+\frac{ae^a}{2(e^a-1)}(L-1),
\]

\[
\Theta_c\approx M-1,\qquad\Psi_c\approx\tfrac12(L-1).
\]

These first-order expansions are consequences of the paper's exact formulas. The factor \(a/(e^a-1)<1\) attenuates PCMV mean distortion, but its risk error can be amplified or partly canceled by interactions between drift and variance errors. Long horizons do not provide a blanket protection against misspecification.

## 7. Discrete rebalancing without numerical ambiguity

A compact form of the discrete formulas avoids cumbersome nested ratios. Let

\[
z=A_{iv,\Delta}\Delta=\alpha_{iv}^2/\psi_{iv}^2,
\quad b_0=(1+z)^{-1},
\quad k=1-\frac{M_\Delta z}{1+z},
\quad h=\frac{L_\Delta z}{(1+z)^2}.
\]

There are \(m=T/\Delta\) rebalancing intervals. The investor PCMV moments satisfy

\[
E_{iv}^p=B+(1-b_0^m)D,
\quad (S_0^p)^2=D^2\{b_0^m-b_0^{2m}\}.
\]

Under misspecification,

\[
E_{iv\to tr}^p=B+(1-k^m)D,
\quad
(S_{iv\to tr}^p)^2=D^2\{(k^2+h)^m-k^{2m}\}.
\]

This is the same moment recursion as Theorem 3.3, expressed directly as a nonnegative variance. It avoids assigning a sign to standard deviation if an extreme drift ratio makes \(k<0\), a domain in which a factored expression using \(k^m\) needs an absolute value.

For TCMV,

\[
E_{iv\to tr}^c=B+\frac{M_\Delta A_{iv,\Delta}T}{2\rho},
\qquad
S_{iv\to tr}^c=\frac{\sqrt{L_\Delta A_{iv,\Delta}T}}{2\rho}.
\]

The discrete slopes are \(\sqrt{(1+z)^m-1}\) for PCMV and \(\sqrt{A_{iv,\Delta}T}\) for TCMV. Taking \(\Delta\downarrow0\) recovers the continuous formulas. Annual trading therefore changes both the policy and the return-moment ratios, not merely the number of times an unchanged continuous policy is sampled.

## 8. What the comparison theorems establish

With positive excess means and nonzero diffusion volatility in both models, Theorem 3.8 shows

\[
|\Theta_p|\le|\Theta_c|\quad(M>0)
\]

for continuous trading, strictly except at \(M=1\). This compares normalized excess-mean multipliers. Absolute dollar or total-mean-percentage errors additionally depend on frontier slopes and the chosen risk target. The discrete counterpart holds over a broad but not unrestricted range of drift ratios; the paper identifies a threshold beyond which the ordering can reverse.

There is no comparably simple unconditional ordering of PCMV and TCMV risk error. In the important case \(M=1\), Theorem 3.10 establishes

\[
|\Psi_c|\le|\Psi_p|,
\]

with equality only at \(L=1\), and a corresponding result for discrete trading. The absolute-value bars are essential. When \(L<1\), PCMV has a more negative risk error: its realized risk is lower than anticipated by a larger amount. Calling that outcome worse merely because its error norm is larger would conflate accuracy with welfare.

For TCMV with matching drifts, discrete trading weakly increases the magnitude of risk distortion relative to the continuous limit. PCMV has no universal ordering of this kind. In the calibrated examples, annual trading reduces its risk distortion, partly because it lowers large early risky exposures.

The realized excess-wealth-to-risk slope is

\[
\Gamma_{iv\to tr}=\frac{1+\Theta}{1+\Psi}\Gamma_{iv}.
\]

For continuous trading,

\[
\Gamma_{iv\to tr}^p=\frac{e^{Ma}-1}{\sqrt{e^{La}-1}},
\qquad
\Gamma_{iv\to tr}^c=\frac{M}{\sqrt L}\sqrt a.
\]

For positive excess returns the latter equals \(\sqrt{A_{tr}T}\). The analogous discrete TCMV equality also holds. Hence the exact unconstrained TCMV slope is independent of the investor calibration for a fixed true model. The supplied pre-proof's Table 4.5 displays varying TCMV slopes across investor models in a fixed true-model row, which is inconsistent with that identity; its entries should not override the analytical result. PCMV's superior investor-model frontier slope can reverse under sufficiently adverse misspecification, although the authors do not report such reversal in their chosen calibration set.

## 9. Calibration and unconstrained numerical results

The empirical calibration uses daily CRSP value-weighted total returns for 1926–2014, short-government-rate data covering the same long period, and CPI inflation adjustment. The resulting real risk-free rate is 0.00623. GBM is estimated by likelihood; Merton and Kou jump models use jump thresholds of two, three, or four estimated diffusion standard deviations. The seven models are Gbm0, Mer2/3/4, and Kou2/3/4.

The experiment uses \(w_0=100\), a 20-year horizon, target terminal standard deviation 400, and either continuous or annual rebalancing. These are high-risk illustrative targets, not recommended investment settings. Jump thresholds substantially alter diffusion volatility and jump intensity: Merton intensity falls from 2.3483 at threshold two to 0.1461 at threshold four, while diffusion volatility rises from 0.0972 to 0.1584. Total variance changes much less because the components partly offset.

For Gbm0 as investor model and Mer3 as true model, Table 4.3 reports continuous PCMV errors of approximately (−5%, 0%) and TCMV errors of (−1%, 0%). Annual PCMV gives (−4%, 0%). Thus ignoring jumps can have a small effect on these two moments when the matched total variance and excess mean are similar.

The Kou comparisons demonstrate the limits. Gbm0 used in a Kou3 market produces approximately (+66%, +1%) under continuous PCMV and (+21%, +7%) under continuous TCMV. With annual trading the corresponding errors are (+55%, +1%) and (+22%, +7%). A Mer3 investor in the Kou3 market reaches a continuous PCMV risk error of about +80%. These are substantial errors despite the paper's title.

For the reverse direction, Kou3 as investor model and Mer3 as true model, continuous errors are about (−26%, −1%) for PCMV and (−18%, −6%) for TCMV. The asymmetry follows from the nonlinear formulas. Model labels alone do not determine robustness: matching the relevant moments is more important than whether both models have jumps.

## 10. Investment constraints change the ranking

The constrained calculations impose a maximum risky fraction of 1.5 after rebalancing and liquidation of risky holdings once wealth is nonpositive, followed by cessation of risky trading. Liquidation does not retroactively prevent insolvency between annual decisions or eliminate jump losses. The constrained strategy must be solved numerically; it is not obtained by using the unconstrained formulas unchanged.

The authors store optimal investor-model controls on the numerical state grid, then evaluate them with 10 million true-model Monte Carlo paths. With the same 20-year horizon and annual trading, Gbm0 in a Kou3 market now gives PCMV errors of roughly (+14%, +2%), versus (+20%, +6%) for TCMV. The error norms are about 15% and 21%. For Mer3 in the Kou3 market, the reported constrained PCMV error is (+13%, +2%), much smaller than the unconstrained annual risk error of +65%.

The leverage cap has a particularly strong effect on PCMV's large early risky positions. Later, target-seeking feedback cuts exposure after good performance. These mechanisms reduce its sensitivity enough to reverse the unconstrained ranking in the cases with the largest model mismatch. The conclusion is numerical for these constraints and calibrations, not an extension of the unconstrained closed-form theorem to arbitrary constrained models.

## 11. Historical resampling, tail outcomes, and practical limits

The appendix evaluates stored constrained policies on five million historical block-bootstrap paths. Blocks of five and ten years start at random quarters, wrap around the sample endpoints, and are concatenated with replacement. Both risky returns and historical real risk-free returns are used. For Gbm0, the five-year-block PCMV error is about (+6%, +1%), while TCMV gives (−2%, 0%); ten-year blocks give (+7%, +3%) and (−8%, 0%). The result supports the broad numerical findings under this resampling scheme, but the same historical period supplies calibration and bootstrap data. It is not an independent future-period investment record.

Mean–variance robustness also does not imply tail robustness. With a Mer3 investor policy, the PCMV probability of finishing below risk-free accumulated initial wealth is 12.9% in a Mer3 market and 17.1% in a Kou3 market. The corresponding lower 5% wealth quantiles are 52.4 and 24.5, and lower-tail mean wealth values are 30.3 and 5.0. These are wealth thresholds and lower-tail means, although the table labels them 95%-VaR and CVaR; they are not positive loss VaR numbers. TCMV's corresponding probabilities are 11.0% and 14.1%, with quantiles 63.4 and 40.4 and tail means 38.3 and 18.1.

For implementation, calculate the moment ratios at the actual rebalancing horizon; compare errors in both mean and risk with their signs; and evaluate tail outcomes separately. Audit whether the constant-parameter, finite-activity, finite-second-moment model is appropriate. Stochastic volatility, changing investment opportunities, multiple risky assets, transaction costs, parameter learning, and misspecified risk-free dynamics lie outside the exact analytical result. The useful finding is a precise explanation of when different return models yield similar dynamic mean–variance outcomes, together with equally explicit examples of when they do not.
