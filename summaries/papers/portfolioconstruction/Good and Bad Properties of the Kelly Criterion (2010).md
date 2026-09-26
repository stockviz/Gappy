# 1. Metadata

- **Title:** Good and Bad Properties of the Kelly Criterion
- **Author(s):** Leonard C. MacLean, Edward O. Thorp, William T. Ziemba
- **Year:** 2010
- **Journal/Venue:** survey / chapter paper

# 2. Problem statement

The paper asks: **what does the Kelly criterion genuinely guarantee, what are its main short-run weaknesses, and how do estimation error and risk aversion alter the case for full Kelly betting or investing?**

# 3. Approach (short)

The article is a synthetic review. It takes expected log-wealth maximization as the benchmark, lists the main good properties that follow from it, then lists the bad properties that arise in finite samples and under parameter uncertainty. The contribution is evaluative rather than constructive: it positions Kelly as asymptotically unmatched but often too aggressive in practice.

# 4. Approach (detailed)

1. **Define the Kelly rule**

   In each period choose portfolio or bet $w$ to maximize
   $$
   \mathbb E[\log W_{t+1}(w)].
   $$
   In the one-asset, two-outcome betting case this gives
   $$
   f^\star=\frac{\text{edge}}{\text{odds}},
   $$
   the familiar Kelly fraction. In general multi-asset problems it is the log-optimal portfolio.

2. **Good property: maximal asymptotic growth**

   If one can repeat the opportunity under stable conditions, the criterion maximizes the limiting exponential growth rate
   $$
   \lim_{n\to\infty}\frac1n \log W_n.
   $$
   This is the primary rigorous advantage. It is the exact theorem behind all “long-run dominates” claims.

3. **Good property: eventual dominance over inferior fixed rules**

   If a competing rule has lower expected log growth, then by the strong law,
   $$
   \frac{1}{n}\log\frac{W_n^{Kelly}}{W_n^{alt}}
   \to
   g_{Kelly}-g_{alt}>0,
   $$
   implying almost-sure relative dominance at long horizons.

4. **Bad property: short-run volatility and drawdown**

   The same strategy can be very risky over practical horizons. Because log utility has Arrow-Pratt relative risk aversion
   $$
   RA(w)=-\frac{u''(w)}{u'(w)}=\frac{1}{w},
   $$
   it is relatively risk tolerant for large wealth and often recommends large stakes. The paper’s main criticism is therefore not asymptotic correctness but finite-horizon path risk.

5. **Bad property: sensitivity to mean estimation**

   The article stresses a well-known but practically decisive result from Chopra and Ziemba: in mean-variance style allocation, estimation errors in means matter much more than comparable errors in variances or covariances. The summary ratio is roughly
   $$
   20:2:1
   $$
   for mean, variance, and covariance errors in cash-equivalent-loss terms. Since Kelly allocations lean heavily on expected returns, they are especially exposed to mean-estimation error.

6. **Fractional Kelly as a response**

   The paper reviews the common remedy
   $$
   w^{(\alpha)}=\alpha w^{Kelly}, \qquad 0<\alpha<1.
   $$
   This sacrifices asymptotic growth but substantially reduces drawdown and sensitivity to mis-estimated edge. The authors do not claim fractional Kelly is universally optimal; rather, they argue it is often preferable under estimation error, leverage limits, or non-log utility.

7. **What is proved and what is observed**

   Proven:
   - Kelly maximizes asymptotic growth.
   - Kelly eventually dominates fixed inferior policies.

   Observed / argued:
   - full Kelly can be too risky in realistic finite-horizon investing;
   - fractional Kelly often performs better under estimation error;
   - practical asset allocation should pay disproportionate attention to mean estimation.

   The paper is explicit that the “bad” properties are not contradictions of the theorem; they arise because real investors do not live in the theorem’s asymptotic regime.

# 5. Domain of applicability

The article applies to repeated investment or betting with multiplicative wealth, especially when practitioners are tempted to apply full Kelly literally. Its strongest theoretical support concerns asymptotic growth and almost-sure long-run dominance. Its cautionary conclusions matter most when opportunities are finite, leverage is limited, or expected returns are estimated noisily. The paper does not offer a full alternative decision theory; it mainly clarifies when the exact Kelly theorem is too narrow for practice.
