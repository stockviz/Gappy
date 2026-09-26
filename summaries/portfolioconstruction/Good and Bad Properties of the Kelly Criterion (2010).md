# Good and Bad Properties of the Kelly Criterion (2010)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_ZiembaThorp_2010.pdf>), 11 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

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

   The same strategy can be very risky over practical horizons. Because log utility has Arrow-Pratt absolute risk aversion
   $$
   RA(w)=-\frac{u''(w)}{u'(w)}=\frac{1}{w},
   $$
   its dollar risk tolerance grows with wealth, while its relative risk aversion remains one; it can recommend large proportional stakes when the modeled edge is favorable. The paper’s main criticism is therefore not asymptotic correctness but finite-horizon path risk.

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


# 6. Detailed reading: guarantees, counterexamples, and sizing

## 6.1 Bibliography and the nature of the evidence

The local eleven-page manuscript is dated January 1, 2010 and is explicitly a review of good properties, bad properties, and observations. Many statements summarize earlier theorems; the numerical examples are drawn from prior studies. It should not be represented as a new unified theorem with a new market backtest. Its useful contribution is the organization of results that are too often conflated: long-run growth, competitive wealth comparisons, finite-horizon drawdown, and robustness to an estimated edge.

The prior summary mislabeled $-u''(w)/u'(w)=1/w$ as *relative* risk aversion. It is **absolute** risk aversion. Log utility has constant **relative** risk aversion $-wu''(w)/u'(w)=1$. A wealthy log investor scales the dollar stake with wealth but does not become less risk averse in proportional terms. The large recommended fraction comes from the estimated opportunity distribution and logarithmic preferences, not merely from wealth being large.

## 6.2 Binary Kelly from first principles

Suppose a bet wins net odds $b>0$ with probability $p$ and loses the stake with probability $q=1-p$. Betting fraction $f$ of current wealth gives multipliers $1+bf$ and $1-f$. For an interior admissible fraction,

$$
g(f)=p\log(1+bf)+q\log(1-f),
$$

$$
g'(f)=\frac{pb}{1+bf}-\frac q{1-f},\qquad
f^*=\frac{pb-q}{b}.
$$

Thus “edge divided by odds” means $(pb-q)/b$, not $p/b$. Concavity follows from

$$
g''(f)=-\frac{pb^2}{(1+bf)^2}-\frac q{(1-f)^2}<0.
$$

Feasibility and any no-short or leverage bounds still apply. If the computed fraction is negative and the wager cannot be reversed, the optimum is zero. At even odds, $f^*=2p-1$. A 51% win probability implies a 2% full-Kelly stake; it does not imply investing 51% of wealth.

For fixed fractions and IID outcomes, $n^{-1}\log(W_n/W_0)\to g(f)$. If two policies have a strictly positive expected log-growth difference, their wealth ratio eventually diverges in the corresponding direction under the applicable law-of-large-numbers conditions. A small difference implies potentially very slow separation. “Asymptotically best” supplies no universal date at which one policy becomes better with a specified probability.

## 6.3 Myopia is conditional, not ignorance of history

With log utility,

$$
\log W_T=\log W_0+\sum_{t=1}^T\log(1+f_tR_t).
$$

When current investment choices do not alter future opportunity sets and there are no state-dependent implementation constraints linking decisions, maximizing each conditional expected increment maximizes the sum. The conditioning distribution can depend on the entire observed past. Thus the paper's myopia property does not require discarding return predictability or pretending the next outcome is independent of history.

Transaction costs, market impact, taxes, or constraints whose future feasibility depends on current positions can break this separability. The simple one-period fraction then need not solve the dynamic problem. Likewise, an investor with consumption or liabilities is optimizing a different object unless these have been included in the state and utility specification.

## 6.4 Competitive optimality has a different quantifier

For a one-period attainable payoff $X^*$ maximizing expected log payoff over a convex feasible set, consider a feasible alternative $X$ and the path $(1-\epsilon)X^*+\epsilon X$. Concavity and the first-order condition imply

$$
E\left[\frac{X-X^*}{X^*}\right]\le0,
\quad\text{hence}\quad E\left[\frac X{X^*}\right]\le1.
$$

This explanatory derivation is the origin of the wealth-ratio property cited in the review. Markov's inequality then gives

$$
P\{X\ge tX^*\}\le\frac1t,\qquad t\ge1.
$$

It controls the probability of being beaten by a large factor; at $t=1$ it is uninformative. It does not imply that unrandomized Kelly has at least a 50% chance of beating every alternative in one period. The review discusses Bell-Cover's fair initial randomization, using a uniform multiplier on $[0,2]$, to obtain the corresponding competitive game result. That additional randomization is part of the theorem, not an optional detail that can be dropped from its conclusion.

The same conceptual separation applies to minimizing expected time to reach a goal: the review states an asymptotic result as the goal becomes large. It is not a claim that Kelly minimizes every finite target-hitting time under arbitrary payoff distributions.

## 6.5 Fractional Kelly in the diffusion approximation

Let a risky opportunity have excess drift $a=\mu-r$ and diffusion volatility $\sigma$. Constant risky exposure $f$ gives

$$
g(f)=r+fa-\tfrac12f^2\sigma^2,
\qquad f^*=a/\sigma^2.
$$

At a fraction $c$ of full Kelly,

$$
g(cf^*)-r=(2c-c^2)\,[g(f^*)-r].
$$

This parabola explains the attraction of reducing exposure: half Kelly retains 75% of the ideal excess log-growth rate while halving diffusion volatility; quarter Kelly retains 43.75%. At double Kelly the excess log-growth rate is zero, and beyond it the growth penalty outweighs the arithmetic edge. These exact fractions concern the diffusion/quadratic-growth setting. The binary-bet log function is not a parabola and need not give exactly the same percentages.

The appendix proves the double-Kelly result in a CAPM illustration and notes that CAPM is not necessary. The essential ingredients are the linear scaling of expected excess return and quadratic scaling of variance with exposure. If borrowing costs differ from lending rates, or market impact rises nonlinearly with size, the parabola changes.

## 6.6 Relation to power utility: exact in one model, approximate in others

For CRRA utility $U(w)=w^\delta/\delta$ with $\delta<1$, relative risk aversion is $1-\delta$. In the stationary diffusion problem the optimal risky fraction is $a/[(1-\delta)\sigma^2]$, so the Kelly multiplier is $c=1/(1-\delta)$. Negative $\delta$ corresponds to a fraction below one. Half Kelly corresponds to $\delta=-1$ and quarter Kelly to $\delta=-3$.

The source explicitly warns that this mapping is not exact for arbitrary payoff distributions. For an even-money binary gamble the power-utility optimum instead is

$$
f_\delta^*=
\frac{p^{1/(1-\delta)}-q^{1/(1-\delta)}}
{p^{1/(1-\delta)}+q^{1/(1-\delta)}}.
$$

It generally differs from $(p-q)/(1-\delta)$. A local small-edge approximation can make the two close, but the distinction becomes material for large edges or asymmetric payoffs. Consequently, “fractional Kelly” is an implementable cash blend, whereas “optimal for this investor's power utility” is a model-dependent statement.

## 6.7 Drawdown and survival are separate from eventual growth

The review's claim that Kelly avoids ruin concerns admissible modeled payoffs: an investment that can produce exactly zero wealth with positive probability has expected log payoff minus infinity. It does not provide immunity to arbitrarily large drawdowns, unmodeled losses, margin liquidation, fraud, or a cash requirement before recovery. Mathematical positivity is a much weaker property than institutional survival.

For an even-money fraction $f$, a path with $n$ wins and $n$ losses ends with

$$
W_{2n}=W_0(1+f)^n(1-f)^n=W_0(1-f^2)^n<W_0.
$$

Equal numbers of positive and negative percentage returns therefore do not cancel. This identity is not a special failure of Kelly; it applies to every nonzero fixed fraction. Kelly chooses the fraction accounting for this compounding effect.

The review reproduces a blackjack example with a 2% edge. The table reports probability of doubling before halving of about 0.67 at full Kelly, 0.89 at half Kelly, and 0.999 at one-tenth Kelly, together with corresponding growth ratios. These are results under the stated illustrative gambling model. They are not general drawdown probabilities for equity portfolios.

A further example shows how favorable opportunities can still produce severe losses over 700 wagers. It also discusses very long horizons needed to establish performance dominance with high confidence when volatility differs or growth rates are close. These examples substantiate the distinction between an almost-sure asymptotic result and an acceptable distribution of outcomes during an investor's actual horizon.

## 6.8 Mean-estimation error and a useful diagnostic calculation

The often-quoted 20:2:1 relative importance of errors in means, variances, and covariances comes from earlier numerical studies using certainty-equivalent loss. The table varies risk tolerance and shows materially different ratios. It is therefore a stylized summary of particular experiments, not an invariant law of portfolio optimization.

A simple diffusion calculation makes the concern precise. Suppose volatility is known but drift is estimated as $\widehat a=a+\epsilon$ with $E\epsilon=0$ and variance $s^2$. Full plug-in Kelly uses $\widehat f=\widehat a/\sigma^2$. Its expected true growth is

$$
E[g(\widehat f)]-r=\frac{a^2-s^2}{2\sigma^2}.
$$

At a fixed shrinkage multiplier $c$,

$$
E[g(c\widehat f)]-r=
\frac{ca^2-\tfrac12c^2(a^2+s^2)}{\sigma^2}.
$$

Under these deliberately simple assumptions, the multiplier maximizing expected true growth is $c=a^2/(a^2+s^2)$. This is an explanatory extension, not a theorem established in the review. It shows why a universal “use half Kelly” rule cannot be optimal in every estimation problem: the appropriate contraction depends on the signal relative to its estimation uncertainty.

For multiple assets, the corresponding quadratic growth loss is measured in the covariance metric. Errors in directions with little estimated risk are especially dangerous because inversion amplifies them. Robust sizing therefore requires jointly auditing alpha uncertainty, covariance conditioning, leverage, and scenario losses.

## 6.9 Practical interpretation

The paper supports using growth optimality as a benchmark and then assessing whether its path and estimation risks fit the actual mandate. A reproducible implementation should record the estimated full-Kelly position, the chosen fraction, the distribution used to compute it, and the constraints that alter the theoretical optimum. Stress scenarios should test losses outside the calibration sample, and finite-horizon evaluation should include drawdown and capital adequacy rather than terminal average growth alone.

The review expressly rejects the argument that eventual wealth dominance implies higher expected utility for every investor. With linear utility and a favorable binary bet, maximizing expected wealth can prescribe betting everything, even though that policy risks ruin and is inferior for long-run log growth. Changing the objective changes the optimal policy; the long-run theorem does not erase that preference distinction.
