# Momentum, Rational Agents and Efficient Markets
**Authors:** John Crombez
**Year:** 2001
**Journal/Venue:** Journal of Psychology and Financial Markets

## Problem statement

Most momentum models of that period explain continuation by some departure from rationality. Crombez asks whether that move is necessary. The paper's question is: **can a rational Bayesian investor, operating in an informationally efficient market but facing expert signals of uncertain precision, generate the same slow-adjustment patterns that look like momentum and later overreaction?**

The friction is therefore moved away from psychology and into information quality. The investor is rational. The problem is that even rational investors do not know how much to trust the costly information communicated by experts.

## Approach (short)

The paper models returns with a simple normal linear regression,

$$
r_t = \mu \iota_t + \varepsilon_t,
$$

and lets investors update beliefs about `\mu` using both historical returns and expert opinions. The precision of the expert signal is not taken as known; it is proxied by disagreement among experts, measured from analyst forecast ranges using a Parkinson-style dispersion proxy. Posterior expectations for `\mu` are computed with a Bayesian bootstrap regression using 5,000 draws. The simulations show that the same optimistic expert opinion produces very different price reactions depending on the strength of the evidence: strong evidence leads to fast incorporation, weak evidence leads to underreaction and momentum, repeated evidence can produce eventual overreaction, and stronger agreement in downturns can make crashes faster than booms.

## Approach (detailed)

### 1. Keep efficient markets and rational updating

The paper is explicit about what it is **not** doing:

- it is not assuming conservatism,
- not assuming overconfidence,
- not assuming heuristic traders.

Instead it keeps a Grossman-Stiglitz style world in which information is costly and rational agents use all available evidence. Momentum then has to arise because the evidence itself is noisy, especially its precision.

That distinction matters. The model is intended as a counterexample to the inference "momentum implies irrationality."

### 2. Write the return process in the simplest Bayesian form

The return process is written as

$$
P_t = \mu + P_{t-1} + \varepsilon_t,
$$

or equivalently, in return space,

$$
r_t=\mu \iota_t+\varepsilon_t.
$$

This is just a normal linear regression for the mean return `\mu`. The investor's task is to infer `\mu`, the next-period expected return, from:

- historical price changes,
- expert opinions about future value.

The model is deliberately simple at this stage because the point is not rich dynamics from the law of motion alone; it is the effect of uncertain signal precision on Bayesian weighting.

### 3. Treat expert disagreement as information about precision

The investor observes not just the consensus expert forecast but also the degree of disagreement behind it. That is the methodological core.

The paper uses analyst-style expert information from I/B/E/S:

- mean consensus forecast,
- highest forecast,
- lowest forecast,
- analyst coverage.

The consensus forecast is interpreted as the directional signal. The range of opinions proxies for the noise in that signal. Greater disagreement means lower precision.

Crombez operationalizes this via a scale parameter `\tau`. Higher `\tau` means weaker evidence. The range of expert opinions is translated into this scale using a Parkinson-style measure based on extremes. So the Bayesian investor does not just ask "are experts bullish?" He asks "how tight is the evidence behind that bullish view?"

### 4. Derive the posterior for expected return

The posterior density is written in the standard Bayesian form:

$$
p(\mu,\sigma\mid r)\propto p(\mu,\sigma) f(r\mid \mu,\sigma).
$$

Because the object of interest is the expected return `\mu`, the paper integrates out `\sigma` and focuses on the marginal posterior

$$
p(\mu\mid r)=\int_0^\infty p(\mu,\sigma\mid r)\,d\sigma.
$$

Posterior expectations of any function `g(\mu)` are then computed as expectations under that marginal posterior.

This is standard Bayesian econometrics in structure, but the novel input is that the prior is informed by expert forecasts whose precision varies with disagreement.

### 5. Use Bayesian bootstrap regression to approximate the posterior

Closed forms are inconvenient here, so the paper uses Bayesian bootstrap regression as the computational engine. The logic is:

1. take the historical return sample and the prior information implied by the expert consensus and its precision;
2. simulate draws of `\mu` from an importance distribution;
3. reweight draws by the prior evidence;
4. compute posterior moments as weighted averages.

The paper writes posterior expectations as prior-weighted averages over bootstrap draws:

$$
E[g(\mu)] \approx
\frac{\sum_i g(\mu_i^*) p(\mu_i^*)}
{\sum_i p(\mu_i^*)}.
$$

For the simulations, the author uses 5,000 bootstrap draws. This is the actual numerical mechanism that turns expert disagreement into a posterior forecast.

### 6. Calibrate the environment with European analyst data

The empirical environment is not just hypothetical. The paper studies liquid European stocks from the MSCI Europe universe using I/B/E/S data from March 1992 through August 2000. For each stock it collects:

- the one-year-ahead earnings-yield forecast,
- the consensus forecast,
- the highest and lowest analyst forecasts,
- the number of analysts.

Stocks are then grouped into deciles by size and by beta, and the paper computes average evidence-strength measures `\tau` for those deciles. The broad pattern is intuitive:

- small stocks and extreme-beta stocks have noisier expert evidence;
- large, liquid stocks have more precise expert signals.

This calibration step matters because it shows the required variation in signal precision is not fictional. It is visible in real analyst data.

### 7. Run scenario analysis with the same bullish opinion but different precision

The cleanest part of the paper is the scenario table. The expert consensus in every scenario says the stock should rise 4 percent next period. What changes is the strength of the evidence:

- `\tau = 0.00000`: effectively perfect agreement,
- `\tau = 0.00008`: strong evidence,
- `\tau = 0.00085`: medium evidence,
- `\tau = 0.00331`: weak evidence.

The historical sample mean used as the baseline expectation is about `1.668%` per period. The Bayesian forecasts then become:

- `4.000%` when precision is perfect,
- `2.262%` with strong evidence,
- `1.728%` with medium evidence,
- `1.680%` with weak evidence.

That result is the model in one table. The *same* positive expert opinion can produce almost full incorporation, partial incorporation, or near-irrelevance, depending only on the precision investors infer from disagreement.

### 8. Generate underreaction and momentum from repeated signals

The next step is a two-period simulation. Suppose the expert valuation remains unchanged and no new public information arrives. The investor now sees that the same expert signal persists, so he increases the weight assigned to it. Crombez formalizes this by doubling the strength of the evidence in the next period.

The resulting prices move from the first-period Bayesian update toward the expert valuation only gradually. For example, after a first-period move to around `102.26`, `101.73`, or `101.68` depending on precision, the second-period Bayesian forecast still adds positive expected return and pushes the price further upward to about `103.97`, `103.45`, or `103.38`.

This is exactly the momentum mechanism:

1. a positive signal arrives,
2. rational investors discount it because precision is uncertain,
3. the price moves in the right direction but not to full value,
4. continued confirmation causes additional price appreciation.

No behavioral bias is needed.

### 9. Show how the same mechanism can produce overreaction and asymmetric crashes

The paper then extends the logic:

- if the same optimistic signal keeps getting confirmed, the investor can keep revising upward and eventually overshoot the true value;
- if expert agreement tends to be stronger in falling markets, then bad news is incorporated more quickly than good news.

That gives two extra implications:

- eventual overreaction and reversal can follow rationally from repeated evidence,
- crashes can be faster than booms because the precision of expert information is higher in downturns.

The paper even gives a numerical illustration in which continued updating under weak-evidence scenarios can push the price beyond the fundamental value of `104`, up to about `105.1`, thereby producing rational overreaction.

### 10. What the paper is actually claiming

The paper is not claiming that analyst disagreement fully explains momentum in the data. It is making a methodological claim:

1. if investors are Bayesian,
2. if expert opinions matter,
3. if the precision of those opinions is uncertain and inferred from disagreement,
4. then momentum-like underreaction, later overreaction, and asymmetric adjustment speeds can all emerge in an efficient market.

That is a narrower but more disciplined claim than the usual behavioral narrative.

## Domain of applicability

- **Where it works well:** Post-news and analyst-driven settings where signal precision varies and analyst disagreement is observable.
- **What is implementable:** Use forecast disagreement as a state variable, estimate Bayesian-updating weights or posterior means conditional on that disagreement, and test whether continuation is strongest when the same directional news arrives with weak precision.
- **Main limitation:** The model is stylized and simulation based; it does not estimate a full structural equilibrium from market prices.
- **Why the paper matters:** It gives a concrete rational-information mechanism for momentum and reversal, with an explicit computational procedure rather than only a verbal story.
