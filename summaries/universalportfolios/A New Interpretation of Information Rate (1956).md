# A New Interpretation of Information Rate
**Authors:** J. L. Kelly, Jr.
**Year:** 1956
**Journal/Venue:** Bell System Technical Journal, 35(4), 917--926

## Problem statement

Shannon's channel capacity $C = \max_{p(x)} I(X;Y)$ gives the maximum rate at which bits can be reliably transmitted, but this operational meaning requires coding and decoding over long blocks. Is there a meaningful interpretation of channel capacity (and mutual information more generally) in settings where *no coding is used* -- i.e., where each symbol is acted upon individually as it arrives?

Kelly answers: yes. If the symbols of a communication channel represent outcomes of repeated betting events, the maximum exponential growth rate of a gambler's capital who bets optimally using the channel output equals the channel's rate of transmission of information.

## Approach (short)

A gambler receives noisy side-information about the outcome of a fair-odds event via a communication channel, then allocates fractions of his wealth across outcomes. Kelly shows that the strategy maximizing the almost-sure exponential growth rate $G$ of capital is to bet proportionally to the posterior probabilities $q(s|r)$, and that $G_{\max}$ equals the mutual information $I(X;Y)$ (in bits, base-2 log). He then generalizes to unfair odds and to the case with a "track take."

## Approach (detailed)

### 1. Setup and growth rate

A sequence of i.i.d. events with outcome $s$ drawn with probability $p(s)$. A noisy channel transmits $s$ and the gambler observes received symbol $r$. Channel statistics: $p(r|s)$, posterior $q(s|r) = p(s,r)/q(r)$. The gambler chooses allocation $a(s|r)$ (fraction of capital bet on outcome $s$ when $r$ is observed), with $\sum_s a(s|r) = 1$ for each $r$. Odds on outcome $s$: $\alpha_s$ (total return per unit bet, including stake).

After $N$ bets, capital is

$$V_N = V_0 \prod_{r,s} [\alpha_s \, a(s|r)]^{W_{sr}}$$

where $W_{sr}$ counts joint occurrences of $(s,r)$. The exponential growth rate is

$$G = \lim_{N\to\infty} \frac{1}{N} \log_2 \frac{V_N}{V_0} = \sum_{s,r} p(s,r) \log_2 [\alpha_s \, a(s|r)] \quad \text{a.s.}$$

by the strong law of large numbers (i.i.d. assumption throughout).

### 2. Fair odds case: $\alpha_s = 1/p(s)$

Substituting fair odds:

$$G = \sum_{s,r} p(s,r) \log_2 \frac{a(s|r)}{p(s)} = H(X) + \sum_{s,r} p(s,r) \log_2 a(s|r).$$

The second term is maximized (it is a cross-entropy, hence bounded above by the negative conditional entropy) by setting

$$a(s|r) = q(s|r) = \frac{p(s,r)}{q(r)}.$$

**Result (exact):**

$$G_{\max} = H(X) - H(X|Y) = I(X;Y) = R,$$

the Shannon mutual information / rate of transmission. The optimal strategy bets in proportion to the Bayesian posterior, independent of the odds.

### 3. Binary channel illustration

Noiseless channel: $G = 1$ bit/bet (capital doubles each round). Noisy binary symmetric channel with crossover probability $p$, correct-transmission probability $q = 1 - p$: the gambler bets fraction $\ell$ of capital each round. Then

$$G(\ell) = q \log_2(1+\ell) + p \log_2(1-\ell).$$

Maximizing over $\ell$: optimal $\ell^* = q - p$, yielding

$$G_{\max} = 1 + p\log_2 p + q\log_2 q = R.$$

This is proved by the concavity of $\log$ and the Lagrange characterization $Y_i = (Y/X)\,X_i$ for maximizing $\sum X_i \log Y_i$ subject to $\sum Y_i = Y$.

Key point: maximizing expected *capital* ($\ell = 1$, bet everything) gives $\langle V_N \rangle = (2q)^N V_0$ but leads to ruin with probability 1. Maximizing expected *log-capital* avoids ruin and, by the SLLN, dominates any other fixed-fraction strategy almost surely in the long run.

### 4. Unfair odds, no track take: $\sum_s 1/\alpha_s = 1$, but $\alpha_s \neq 1/p(s)$

Now

$$G = \sum_{s,r} p(s,r) \log_2 a(s|r) + \sum_s p(s) \log_2 \alpha_s.$$

The first term is still maximized by $a(s|r) = q(s|r)$ -- the gambler *ignores the posted odds* in choosing allocations. Define

$$H(\alpha) = \sum_s p(s) \log_2 \alpha_s.$$

Then

$$G_{\max} = H(\alpha) - H(X|Y).$$

Three consequences:

- (a) Optimal allocation $a(s|r) = q(s|r)$ is unchanged from the fair-odds case.
- (b) $H(\alpha) \geq H(X)$ with equality iff $\alpha_s = 1/p(s)$, so any deviation from fair odds *helps* the informed gambler.
- (c) The *increment* in $G_{\max}$ due to the channel is $R = H(X) - H(X|Y) = I(X;Y)$, same as before. Without a channel, $G_{\max} = H(\alpha) - H(X)$; with a channel, $G_{\max} = H(\alpha) - H(X|Y)$.

### 5. Track take: $\sum_s 1/\alpha_s > 1$

The gambler can no longer costlessly hold back money via offsetting bets. Let $b_r = 1 - \sum_s a(s|r) \geq 0$ be the fraction not bet. The growth rate becomes

$$G = \sum_{s,r} p(s,r) \log_2 [b_r + \alpha_s \, a(s|r)],$$

subject to $b_r + \sum_s a(s|r) = 1$ and $a(s|r) \geq 0$. Since terms for different $r$ are separable, maximize for each $r$ independently:

$$G_r = q(r) \sum_s q(s|r) \log_2 [b + \alpha_s \, a(s)]$$

subject to $b + \sum_s a(s) = 1$, $a(s) \geq 0$.

KKT conditions yield: partition outcomes into $\lambda$ (those with $a(s)>0$) and $\lambda'$ (those with $a(s)=0$). Permute indices so that $p(s)\alpha_s \geq p(s+1)\alpha_{s+1}$. Then

$$a(s) = p(s) - \frac{b}{\alpha_s} \quad \text{for } s \in \lambda, \qquad a(s) = 0 \quad \text{for } s \in \lambda',$$

with

$$b = \frac{1 - p_t}{1 - \sigma_t}, \quad p_t = \sum_{s=1}^{t} p(s), \quad \sigma_t = \sum_{s=1}^{t} \frac{1}{\alpha_s},$$

where $t$ is the smallest index giving $(1-p_t)/(1-\sigma_t)$ its minimum positive value.

$$G_{\max} = \sum_{s=1}^{t} p(s) \log_2 [p(s)\alpha_s] + (1-p_t)\log_2 \frac{1-p_t}{1-\sigma_t}.$$

Notable: some bets with negative expected gain ($p(s)\alpha_s < 1$) may still be placed, violating the classical gambler's criterion. The Kelly gambler optimizes growth rate, not single-bet expectation.

### 6. Dominance property (stated, not fully proved)

With probability one, the Kelly-optimal gambler's capital will eventually and permanently exceed that of any other gambler using a *fixed* allocation rule $a(s|r)$. Kelly notes this is proved only for the class of strategies where $a(s|r)$ does not vary with time; dominance over time-varying strategies remains open (in the paper).

## Domain of applicability

**Where it applies:**

- Repeated i.i.d. betting/investment with full reinvestment of capital and known probability model $p(s,r)$.
- Directly relevant to portfolio theory (cf. Breiman 1961, Thorp 1969, Cover & Thomas): any setting with multiplicative compounding and a stationary return distribution.
- The core identity $G_{\max} = I(X;Y)$ is exact, not asymptotic in the distributional parameters -- only the convergence $G \to G_{\max}$ is asymptotic in $N$ (SLLN).

**Where it breaks:**

- **Known distribution.** The entire analysis assumes the gambler knows $p(s)$ and $p(r|s)$ exactly. Estimation error is unaddressed and, in practice, dominant.
- **i.i.d. assumption.** The SLLN convergence requires independence and identical distribution of the $(s,r)$ pairs. Serial dependence (e.g., financial time series) is outside scope; ergodic extensions exist but are not treated here.
- **No intermediate consumption or liabilities.** The objective is purely terminal log-wealth. With intermediate consumption, liquidity constraints, or leverage limits, the Kelly fraction is generically suboptimal (cf. Merton's continuous-time consumption-portfolio problem).
- **Almost-sure dominance vs. finite-horizon.** The dominance result is asymptotic. Over any finite horizon, a Kelly bettor can underperform other strategies with high probability; risk-averse agents with finite horizons rationally prefer fractional Kelly.
- **Track take case.** When the vigorish is large, the optimal strategy may be not to bet at all ($G_{\max} < 0$). The formulae are correct but the information-theoretic interpretation becomes less clean.
- **The paper does not overclaim:** Kelly explicitly flags that dominance over time-varying strategies is unproved, that the model is drawn from gambling as a tractable special case, and that applicability to broader economic settings (investing) is conjectural. The only implicit overclaim is the suggestion that the log-growth criterion is the "natural" one -- Samuelson (1971) later argued forcefully that this is a non-sequitur unless the horizon is literally infinite.
