# Different Measures of Win Rate for Optimal Proportional Betting

**Authors:** Peter A. Griffin  
**Year:** 1984  
**Journal/Venue:** *Management Science*, Vol. 30, No. 12, pp. 1540--1550

## Problem statement

A Kelly-criterion bettor wagering a fixed fraction $f = 2p - 1$ of capital on i.i.d. favorable coin tosses ($p > 1/2$) achieves maximal exponential growth rate. Two natural measures of "win rate" exist: (i) $E(\text{Win})/E(\text{Bet})$ -- expected winnings divided by expected amount bet, and (ii) $E(\text{Win}/\text{Bet})$ -- expectation of the per-gambler ratio of winnings to bets. These are not the same object. The paper asks: what is the long-run behavior of each, and how do they relate to the single-trial expected return $EX_1 = 2p - 1$?

A secondary, sharper question: conditional on the sample proportion of wins being $p'$, what is the asymptotic ratio $W_{n,p'}/B_{n,p'}$ of total win to total bet?

## Approach (short)

Griffin shows that while the collective (ratio-of-expectations) win rate $E(\text{Win})/E(\text{Bet})$ equals $f = EX_1$ at every finite $n$ -- an algebraic identity from i.i.d. structure -- the individual (expectation-of-ratios) win rate $E(\text{Win}/\text{Bet})$ converges to the same constant $f$ only in a paradoxical way: almost all of the expectation comes from exponentially rare, astronomically large outcomes. Conditioning on the sample win proportion $p'$, he proves that $W_{n,p'}/B_{n,p'} \to 0$ for all $p' < p$, meaning the win-per-unit-bet vanishes for every gambler whose empirical frequency is below (or even at) the true probability, yet the unconditional expectation stays constant at $f$.

## Approach (detailed)

**1. Setup and notation.**
$X_i \in \{-1, +1\}$ i.i.d. with $P(X_i = 1) = p > 1/2$. Bettor wagers fraction $f$ of current fortune $F_n$ each trial, $F_0 = 1$:

$$F_n = \prod_{i=1}^{n}(1 + fX_i).$$

The return on investment (net gain / total bet):

$$R_n = (F_n - 1)/f\sum_{k=0}^{n-1} F_k.$$

By Ethier and Tavare (1983), $F_n \xrightarrow{\text{a.s.}} +\infty$ when $E\log(1+fX_1) > 0$, and

$$R_n \xrightarrow{D} R = \frac{1}{f}\sum_{k=1}^{\infty}(1/F_k), \quad P(0 < R < 1) = 1, \quad ER < EX_1.$$

Crucially, $P(\lim R_n \text{ exists}) = 0$: individual sample paths of $R_n$ do not converge (eq. 6), because $R_n/R_{n-1} < 1 - f$ whenever trial $n$ is a loss. Thus $R_n$ is not useful as a per-gambler long-run win rate.

**2. Two measures of win rate and why they differ.**
Using a craps example ($p = 244/495$, goal: win \$1 from \$3 via "double up if you lose"), Griffin illustrates that $E(\text{Win})$ and $E(\text{Bet})$ can have different signs from $E(\text{Win}/\text{Bet})$. The key identity (eq. 7):

$$\frac{E(\text{Win})}{E(\text{Bet})} = \frac{E(F_n - 1)}{E\!\left(f\sum_{k=0}^{n-1}F_k\right)} = f = EX_1,$$

holds exactly for all $n$, since $E(F_n) = (1+f^2)^n$ and each $E(F_k)$ factors by independence.

In contrast, $E(\text{Win}/\text{Bet}) = E(R_n)$ has a different character: it is the average of individual win rates, not the ratio of aggregates. For $p$ close to $1/2$ and $f$ small, $R/f = R/EX_1$ converges in distribution to $\text{Exponential}(2)$ with density $g(y) = 2e^{-2y}$ (eq. 4), and $ER/EX_1 \to 1/2$ (eq. 5). So individuals on average perceive a win rate about half the collective rate.

**3. Conditioning on sample proportion $p'$ (main result).**
Let $np'$ wins occur in $n$ trials. Define conditional expected win and bet:

$$W_{n,p'} = E_{n,p'}(F_n - 1) = (1+f)^{np'}(1-f)^{n-np'} - 1,$$
$$B_{n,p'} = E_{n,p'}\!\left(f\sum_{k=0}^{n-1}F_k\right).$$

Let $p_0$ solve $(1+f)^{p_0}(1-f)^{1-p_0} = 1$; then $W_{n,p_0} = 0$ (breakeven sample proportion; for $p \sim 1/2$, $p_0 \sim p/2 + 1/4$).

**Theorem (eq. 8).** For $p' > p_0$:

$$\limsup\; W_{n,p'}/B_{n,p'} \leq Q(p, p') = \max\!\left(\frac{p' - p}{p' + p - 2pp'},\; 0\right).$$

*Proof sketch.* The total amount won $F_n - 1$ is constant across all orderings of $np'$ wins and $n(1-p')$ losses, but the total amount *bet* depends on ordering. Griffin identifies, for a sequence with $v$ wins and $d$ losses, the quantities $B$ (bet up to and including a designated loss) and $A$ (bet after that loss), then shows that moving the designated loss later in the sequence strictly increases the ratio $(B + (1+f)A/(1-f))/(B + A)$ (eq. 13). By summing over all $\binom{n}{d}$ placements of each loss among $\binom{v+d-1}{d-1}$ possible sequences, a combinatorial cancellation yields:

$$(v+1)\binom{n}{d}\frac{B_{n,p'}}{W_{n,p'}} < d\binom{n}{d}\frac{B_{n,p'}}{W_{n,p'}},$$

which inverts to give (12): $W_{n,p'}/B_{n,p'} < W_{n,p''}/B_{n,p''}$ when $p' < p''$, i.e., the conditional win rate is monotone increasing in $p'$.

Taking $p'' = (1 + f + f\epsilon)/(2(1+f)) > p$ for small $\epsilon$ and using $E(\text{Win}|A_n)/E(\text{Bet}|A_n) < \epsilon$ where $A_n$ is the event that the sample proportion exceeds $p''$ (established via eq. 10 and Jensen-type bounds on $E(1/R)$), one obtains:

$$\limsup\; E(\text{Win}|A_n)/E(\text{Bet}|A_n) \leq \epsilon,$$

and since $P(A_n) \to 1$, the unconditional ratio stays at $f$ only because the vanishingly rare event $A_n^c$ (improbably many wins) contributes disproportionately.

**4. Corollary (eq. 11).** For $p_0 \leq p' \leq p$:

$$\lim W_{n,p'}/B_{n,p'} = 0.$$

At $p' = p$ specifically: every gambler whose empirical win fraction equals or approaches the true probability $p$ has a win-per-unit-bet converging to zero. The constant value $f = EX_1$ of the unconditional ratio $E(\text{Win})/E(\text{Bet})$ is sustained entirely by the exponentially rare sequences with $p' > p$.

**5. Long-run fantasy (Section 5).**
Among $m$ independent Kelly bettors playing $n$ trials, almost all have won huge sums, but their individual win rates $R_n$ cluster near zero. The aggregate $E(\text{Win})/E(\text{Bet}) = f$ is maintained by the few with anomalously many wins. The histogram of $R_n$ values approximates an exponential distribution (Figure 1). Even with $p = 0.99$, $f = 0.98$, the proportion of gamblers with sample proportion below $p'' = 0.9902$ -- hence collective win rate below $\epsilon = 0.01$ -- approaches 1.

## Domain of applicability

**Applies to:** Kelly-fraction betting on i.i.d. binary $\{+1, -1\}$ outcomes with known $p > 1/2$. The conceptual insight -- that ratio-of-expectations and expectation-of-ratios are fundamentally different objects, and that the Kelly criterion's optimality is a statement about the former, not the latter -- extends broadly to proportional betting with general payoffs (Griffin notes in Section 6(d) that the qualitative conclusions hold for games with payoffs other than $\pm 1$ where optimal $f \neq EX_1$, though proofs become harder).

**Key limitations:**
- Strictly i.i.d. binary payoffs; no treatment of continuous returns, serial dependence, or parameter uncertainty.
- The asymptotic results are genuinely asymptotic: convergence is slow and the "host" population size $m$ needed to observe the distributional results of Section 5 can be very large. Griffin himself notes (Section 6) that the practical curiosities are unlikely to be realized -- they require trial counts and fortune magnitudes beyond practical experience.
- The paper does not address what a practitioner *should* use as a performance measure; it diagnoses the paradox but does not prescribe. The result that $E(\text{Win}/\text{Bet})$ is dominated by rare events is a warning against naive interpretation of Kelly-criterion returns, but it does not invalidate the criterion (which is justified by growth rate, not win rate).
- No connection to the continuous-time (log-Brownian) Kelly literature or to portfolio theory more broadly. The betting is on a single asset with known edge; multi-asset or estimation-error issues are absent.
