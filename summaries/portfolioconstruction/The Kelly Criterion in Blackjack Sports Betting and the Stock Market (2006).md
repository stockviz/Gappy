# The Kelly Criterion in Blackjack Sports Betting and the Stock Market (2006)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_Thorp_2006_survey.pdf>).

# 1. Metadata

- **Title:** The Kelly Criterion in Blackjack, Sports Betting, and the Stock Market
- **Author(s):** Edward O. Thorp
- **Year:** 2006
- **Journal/Venue:** Chapter 9, *Handbook of Asset and Liability Management*, Volume 1, edited by S. A. Zenios and W. Ziemba

# 2. Problem statement

The paper asks: **what exact betting and portfolio formulas does the Kelly criterion imply in simple favorable games and in capital markets, and how should one think about the trade-off between long-run growth optimality and short-run drawdown risk?**

# 3. Approach (short)

The paper is an applied survey built around expected log-wealth maximization. Thorp starts from repeated favorable gambles, derives the familiar Kelly fraction in simple cases, studies finite-horizon probabilities such as hitting a goal or suffering a drawdown, then extends the same logic to securities and multi-asset portfolios. It is partly expository and partly cautionary: full Kelly is growth-optimal, but fractional Kelly can be preferable for finite-horizon risk control and parameter uncertainty.

# 4. Approach (detailed)

1. **Single favorable binary bet**

   Suppose a fraction $f$ of wealth is wagered on a game that wins with probability $p$, loses with probability $q=1-p$, and pays odds $b:1$. Wealth multipliers are $1+bf$ on a win and $1-f$ on a loss. Expected log growth is
   $$
   g(f)=p\log(1+bf)+q\log(1-f).
   $$
   Differentiating,
   $$
   g'(f)=\frac{pb}{1+bf}-\frac{q}{1-f}.
   $$
   Setting $g'(f)=0$ yields the Kelly fraction
   $$
   f^\star=\frac{bp-q}{b}.
   $$
   For even-money bets ($b=1$), this reduces to $f^\star=p-q=2p-1$.

2. **Long-run optimality**

   With independent repetitions, the asymptotic exponential growth rate of wealth equals $g(f)$. Since $g$ is strictly concave, $f^\star$ uniquely maximizes long-run growth. This is the core Kelly theorem. Thorp emphasizes that the criterion is period-by-period log optimization, hence automatically horizon-consistent under iid repetition.

3. **Finite-horizon risk quantities**

   A large part of the chapter studies probabilities not captured by $g(f)$, such as:
   - reaching a target wealth by time $n$;
   - ever dropping below a specified fraction of initial wealth;
   - ending above a threshold after $n$ plays;
   - expected time to hit a goal.

   The point is conceptual: Kelly dominates asymptotically, but investors often care about pathwise events. The paper develops approximations for these quantities and shows that higher-than-Kelly staking sharply worsens drawdown probabilities.

4. **Fractional Kelly**

   If one uses $f=\alpha f^\star$ with $0<\alpha<1$, growth falls below the maximum, but variance and drawdown risk fall more than proportionally in many examples. The chapter argues that fractional Kelly is sensible when:
   - probabilities or expected returns are estimated with error;
   - leverage or ruin constraints matter;
   - investor utility is less risk tolerant than log utility over the relevant horizon.

5. **Continuous-time / stock-market approximation**

   In capital markets, if risky returns have mean excess return $\mu-r$ and variance $\sigma^2$, the approximate Kelly leverage in one risky asset is
   $$
   f^\star \approx \frac{\mu-r}{\sigma^2}.
   $$
   In multi-asset form, the continuous-time Merton/Kelly allocation is
   $$
   w^\star=\Sigma^{-1}(\mu-r\mathbf 1),
   $$
   with cash weight $1-\mathbf1^\top w^\star$; the risky weights are not normalized to sum to one. Thorp treats this as the market analogue of the simple favorable-bet formula.

6. **Why Kelly eventually dominates**

   If $g(f^\star)>g(f)$ for another fixed-fraction strategy $f$, then
   $$
   \frac{1}{n}\log\frac{W_n(f^\star)}{W_n(f)}\to g(f^\star)-g(f)>0
   \quad\text{a.s.}
   $$
   Hence
   $$
   \frac{W_n(f^\star)}{W_n(f)}\to\infty
   \quad\text{a.s.}
   $$
   This is the basic proof of long-run dominance: it is a law-of-large-numbers consequence of maximizing expected log wealth.

7. **Portfolio case study logic**

   In the case study sections, the paper applies the same framework to a portfolio of securities under practical constraints. The decision rule is still “maximize expected log wealth subject to admissibility,” but the realistic frictions and uncertainty motivate using less than full Kelly.

# 5. Domain of applicability

The chapter applies wherever repeated favorable bets or rebalanced risky portfolios can be approximated by multiplicative wealth dynamics. Its exact formulas apply to the specified repeated-gamble models and to the idealized continuous-time diffusion setting; finite-period Gaussian simple returns alone do not ensure admissible positive wealth. The long-run dominance theorem is exact under repeated favorable opportunities with fixed distribution. The main caveat, stressed by Thorp himself, is that finite-horizon drawdowns, leverage limits, and estimation error can make full Kelly too aggressive for real investors even when its asymptotic theorem is correct.

## 6. Source version and the exact betting problem

This is Chapter 9 of the *Handbook of Asset and Liability Management*, Volume 1, edited by S. A. Zenios and W. Ziemba, copyright 2006, DOI 10.1016/S1872-0978(06)01009-X. The library PDF is a typeset proof with line numbers and some unresolved cross-references. It builds on a 1997 conference presentation and a 2000 publication, with corrections added in April 2005. In particular, Thorp explicitly corrects an earlier missing factor of two in the barrier-probability exponent; the corrected formula is the one summarized here.

For a general one-period payoff $X$ per dollar staked, the objective is

$$
g(f)=E\log(1+fX),
$$

with $1+fX>0$ on relevant outcomes and appropriate integrability. For discrete outcomes $x_i$ with probabilities $p_i$, the first-order condition is $\sum_i p_ix_i/(1+fx_i)=0$, with the optimizer checked against the feasible boundaries. The binary formula is a special case. If negative stakes are forbidden and the computed edge is nonpositive, the optimum is no bet. If losses larger than the nominal stake are possible, the admissible fraction can be much smaller than one.

Positive expected dollar profit is not sufficient for positive long-run log growth. In the even-money example, $g(f)$ rises from zero, peaks at $f^*=2p-1$, then falls and crosses zero again at a critical $f_c>f^*$. Betting above $f_c$ leads wealth toward zero almost surely under the repeated model, despite the game's favorable arithmetic expectation. At the nonzero zero-growth boundary, log wealth can oscillate widely rather than converge to its starting level. The trivial no-bet strategy $f=0$ is an exception to any such oscillation statement.

## 7. What long-run optimality does and does not say

For two fixed fractions applied to the same IID outcome sequence, the difference in average log wealth converges to the difference in their expected log-growth rates. When the latter difference is positive, their wealth ratio diverges exponentially. The logarithmic objective also makes terminal expected log wealth additive across periods, so maximizing each conditional one-step log increment is appropriate when current actions do not alter future opportunity sets or impose additional intertemporal constraints.

This is different from maximizing the probability of reaching a particular target by a deadline. With one trial left and a target requiring a large gain, the target-probability optimizer may rationally take an all-or-nothing stake that log utility would reject. It is also different from maximizing expected terminal wealth, which can favor very large stakes because it gives substantial weight to rare large outcomes.

Thorp stresses that the time needed for practical dominance can be arbitrarily long when two strategies have almost equal growth rates. Comparing strategies on the same realized opportunities removes some noise; comparing separate independent sample paths makes superiority much harder to see. The asymptotic theorem therefore supplies a limiting ordering, not a universal number of bets or years after which Kelly is guaranteed to be ahead.

## 8. Barrier and terminal probabilities from the diffusion approximation

Let $Y_t=\log(W_t/W_0)=mt+sB_t$, where $m$ is log-wealth drift and $s$ is its volatility. For $m>0$ and a lower wealth level $0<x<1$,

$$
P\{\inf_{t\ge0}W_t\le xW_0\}=x^{2m/s^2}.
$$

For the diffusion model this is exact; for a discrete betting sequence it is an approximation that ignores overshoots and depends on the suitability of the Brownian limit. If drift is nonpositive, the eventual lower-barrier probability is one under the nondegenerate Brownian model, so the positive-drift expression should not be used to produce a probability above one.

For an upper goal $C>1$ by time $T$, the corresponding probability is

$$
P\{\sup_{t\le T}Y_t\ge\log C\}
=\Phi\left(\frac{mT-\log C}{s\sqrt T}\right)
+e^{2m\log C/s^2}
\Phi\left(\frac{-mT-\log C}{s\sqrt T}\right).
$$

The terminal probability $P(W_T\ge CW_0)$ is only the first term. Reaching the goal and subsequently falling below it still counts in the first-passage event but not in the terminal event. This is the reason the chapter obtains different optimal fractions for superficially similar “reach a goal” questions.

For positive drift, the diffusion expected first-passage time to $C$ is $\log C/m$. Exact discrete-time hitting times can differ because of overshoots. These formulas address barriers relative to initial wealth; a drawdown from a running peak is a different stochastic event and should not be labeled with the same probability.

## 9. Fractional Kelly quantifies a growth–risk trade-off

In the constant-parameter diffusion model with zero cash rate, write risky arithmetic drift $\mu$, volatility $\sigma$, full Kelly $f^*=\mu/\sigma^2$, and fraction $f=cf^*$. Then

$$
g(cf^*)=\frac{\mu^2}{\sigma^2}\left(c-\frac{c^2}{2}\right),
\qquad
\frac{g(cf^*)}{g(f^*)}=c(2-c).
$$

Log-wealth volatility scales by $c$ and its variance by $c^2$. Half Kelly therefore keeps 75% of the maximum excess log-growth rate while halving volatility and quartering variance in this model. At twice Kelly, excess growth is zero; above it, excess growth is negative. These are exact properties of the quadratic diffusion growth function, not universal identities for all discrete payoff distributions.

Substituting into the lower-barrier expression gives

$$
P\{\inf_tW_t\le xW_0\}=x^{2/c-1},\qquad0<c<2.
$$

At full Kelly the chance of ever falling below half the initial capital is one-half; at half Kelly it is one-eighth. The probability of doubling before halving is two-thirds at full Kelly and eight-ninths at half Kelly. The safer strategy typically takes longer to achieve a given expected log gain. With a nonzero cash rate, the clean fractional formulas apply to wealth discounted by that cash account; nominal-wealth barrier probabilities use the full drift including interest.

Parameter uncertainty strengthens the case for caution but does not identify a universally optimal fraction. If the estimated edge is twice the true edge, betting the estimated full-Kelly amount can put the investor near twice true Kelly and eliminate growth in the approximation. Half of estimated Kelly then corresponds to full true Kelly. This is a sensitivity argument, not proof that a fixed half-Kelly policy is optimal for every estimation problem or utility function.

## 10. Blackjack and simultaneous bets require the actual joint problem

Blackjack differs from a unit-payoff coin because blackjacks, splits, and doubles alter the payoff distribution and variance. Thorp emphasizes computing or simulating the distribution for each known state and optimizing expected log wealth from those payoffs. A shortcut that uses only the expected edge as the betting fraction ignores this difference.

The chapter's waiting-bet example illustrates constraint dependence. If the fraction wagered on unfavorable hands is fixed independently of the favorable-hand stake, its contribution to expected log growth is constant while optimizing the favorable stake. But if unfavorable stakes must equal $a$ times favorable stakes, raising the favorable stake also raises the losses incurred while waiting. With favorable win probability 0.51 and $a=1/3$, the optimal favorable fraction falls from 0.02 to about 0.0120. The difference comes from a linked decision constraint, not a change in the favorable hand's edge.

Even independent simultaneous bets are not exactly the same as sequential bets, because they share the same current bankroll. For two identical independent even-money bets with edge $m=2p-1$, the optimal fraction on each simultaneous bet is $m/(1+m^2)$, rather than $m$. With positively correlated outcomes, allocations must be reduced further; negative dependence can permit larger joint exposure. For exact finite-step log optimization, covariance alone is insufficient: the full joint payoff distribution determines the possible wealth multipliers.

The sports-betting field test reports a $50,000 initial bankroll and $123,000 profit over 101 betting days in early 1994, with deliberately conservative edge estimates. It is a historical case report about a selected system and its implementation, not a controlled out-of-sample proof that Kelly staking creates predictive edge. Log-optimal sizing requires a favorable opportunity; it does not manufacture one.

## 11. Securities: cash, leverage, and discontinuities

With risky weights $w$, instantaneous excess-return vector $a=\mu-re$, and covariance $\Sigma$, diffusion log growth is

$$
g(w)=r+w'a-\tfrac12w'\Sigma w.
$$

The unconstrained solution is $w^*=\Sigma^{-1}a$ when the covariance is positive definite, and the cash weight is $1-e'w^*$. The risky weights do not need to sum to one. A negative cash weight represents borrowing under the idealized assumption that borrowing and lending occur at the same rate. Rescaling risky weights to sum to one changes the problem rather than merely normalizing its solution.

The source extends the objective for higher borrowing costs and reduced interest on short-sale proceeds, and adds a stylized gross-exposure limit associated with margin. These modifications are necessary for an implementable allocation. The historical margin percentages in the examples are part of their setup, not statements about current rules.

Continuous rebalancing is especially important for leveraged portfolios. A diffusion model keeps wealth positive under finite constant leverage, but a large jump can exhaust equity before the investor has an opportunity to rebalance. Minimum trading sizes, margin calls, financing changes, and transaction costs can likewise invalidate the frictionless policy. Thorp uses this point to reject the extremely large leverage produced by some attractive sample mean/variance estimates.

## 12. The concentrated-equity case study and its evidential limits

The corporate case study begins with a portfolio about 54% invested in BioTime, alongside Berkshire Hathaway and cash. The admissible set includes those securities, an S&P 500 fund, and Treasury bills; short Treasury bills proxy for margin borrowing. Estimates use 63 monthly observations from March 1992 through June 1997. The actual broker's borrowing rate is about two percentage points above bills, a difference initially omitted from the stylized calculation.

Using those estimates, the no-borrowing solution holds approximately 63% Berkshire and 37% BioTime. The 50% initial-margin case holds 150% Berkshire, 50% BioTime, and −100% bills. The unrestricted solution is extremely leveraged, including about −1904% bills, and the author explicitly regards it as imprudent. A conservative-input sensitivity exercise shifts the leveraged allocation to roughly 165% Berkshire, 17% BioTime, 18% S&P 500, and −100% bills. The shift demonstrates the importance of return and volatility assumptions.

The reported realized comparison favors the recommended leveraged policy during the subsequent sharp rise in both principal stocks, but the author notes that the advantage is much larger than normally expected. It is a short, selected realized path with counterfactual rebalancing policies, not a broad validation of that allocation rule. The chapter's separate account of long-run partnership performance is likewise author-reported historical evidence, not an experiment isolating Kelly sizing from security selection, hedging, execution, and financing skill.

## 13. Operational interpretation

A faithful application specifies the payoff distribution and information available before each bet, enforces wealth positivity and financing constraints, distinguishes arithmetic return drift from log-growth drift, and evaluates both terminal and path-dependent outcomes. It then stresses probability/return estimates and the possibility of jumps or changing opportunities. The criterion supplies a coherent objective for repeated compounding, while fractional exposure and explicit constraints express concerns that an unconstrained long-run theorem does not resolve.
