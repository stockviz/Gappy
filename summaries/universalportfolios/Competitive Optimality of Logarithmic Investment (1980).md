# Competitive Optimality of Logarithmic Investment
**Authors:** Robert M. Bell, Thomas M. Cover
**Year:** 1980 (received January 1979)
**Journal/Venue:** *Mathematics of Operations Research*, Vol. 5, No. 2

## Problem statement

The log-optimal portfolio $b^*$ (Kelly criterion) is known to maximize the asymptotic growth rate $\liminf (1/n)\ln S_n$ and minimize the expected time to reach a wealth target. But these are long-run properties. Samuelson (1967, 1969) and others argued this does not justify log-optimality for single-period decisions. Bell and Cover ask: **is there a one-period, utility-free, game-theoretic justification for the Kelly portfolio?** Specifically, in a two-person zero-sum game where each investor tries to end up with more capital than the opponent, what is the minimax-optimal investment policy?

## Approach (short)

Model one-period portfolio choice as a simultaneous-move, two-player zero-sum game where the payoff to player 1 is the indicator $\mathbf{1}\{B_1'X \geq B_2'X\}$. The authors solve for the value and saddle-point strategies via the Kuhn-Tucker conditions for the log-portfolio problem and a fair-randomization device. The optimal strategy turns out to be $B^* = Ub^*$, where $b^*$ is the Kelly portfolio and $U \sim \mathrm{Unif}[0,2]$ is an independent scalar. The value of the game is $\tfrac{1}{2}$, and among deterministic strategies $b^*$ alone is optimal. Thus the same portfolio that maximizes long-run growth is also competitively optimal in a single-period head-to-head contest.

## Approach (detailed)

### Setup

An investor faces $m$ stocks with random return vector $X = (X_1, \dots, X_m)'$, $X_i \geq 0$, joint distribution $F$ known. A portfolio $b = (b_1,\dots,b_m)'$ satisfies $b_i \geq 0$, $\sum b_i = 1$. The capital return is $S = b'X = \sum b_i X_i$.

### Why randomization is needed (Section 2)

A preliminary two-player game shows pure strategies are insufficient. If player 2 can choose any fair gamble $(EX = 1, X \geq 0)$, he can beat any fixed strategy of player 1 with probability $1 - \epsilon$ by concentrating mass near 0 and at a large value. Hence player 1 must randomize to protect himself. This is a purely game-theoretic necessity, not a modeling assumption.

### The competitive investment game (Section 3)

1. **Players and payoff.** Both players independently choose random investment policies $B^{(1)}, B^{(2)} \in \mathfrak{B}$ (the set of all random portfolios with $B \geq 0$, $E\sum B_i = 1$). Player 1's payoff is:
$$P\!\left(B^{(1)'}X \geq B^{(2)'}X\right), \tag{5}$$
where $B^{(1)}, B^{(2)}, X$ are jointly independent.

2. **Regularity condition.** The authors assume $-\infty < \sup_b E\ln b'X < \infty$, ensuring the log-optimal problem is well-posed.

3. **Theorem 1 (Main result).** *The solution to the competitive investment game is $B^* = Ub^*$, where $U \sim \mathrm{Unif}[0,2]$ independent of $X$, and $b^*$ maximizes $E\ln b'X$. The value of the game is $\frac{1}{2}$.*

### Proof of Theorem 1

**Step 1: Characterize $b^*$ via KKT.** The Kuhn-Tucker theorem (1951) applied to $\max E\ln \sum b_i X_i$ subject to $\sum b_i = 1$, $b \geq 0$ yields the first-order conditions:
$$E\frac{X_i}{\sum b_j^* X_j} \begin{cases} = \lambda & \text{if } b_i^* > 0, \\ \leq \lambda & \text{if } b_i^* = 0, \end{cases} \quad i = 1,\dots,m. \tag{6}$$
The Lagrange multiplier satisfies $\lambda = \sum b_i^* \lambda = \sum b_i^* E\!\left(X_i / b^{*'}X\right) = E\!\left(b^{*'}X / b^{*'}X\right) = 1$, so $\lambda = 1$. This is the key identity.

**Step 2: Bound the winning probability.** For any $B \in \mathfrak{B}$:
$$P\!\left(B'X \geq B^{*'}X\right) = P\!\left(B'X \geq Ub^{*'}X\right) = P\!\left(U \leq \frac{B'X}{b^{*'}X}\right).$$
Since $U \sim \mathrm{Unif}[0,2]$:
$$= \frac{1}{2}E\!\left(\frac{B'X}{b^{*'}X}\right) = \frac{1}{2}\sum_i EB_i \cdot E\!\left(\frac{X_i}{b^{*'}X}\right) \leq \frac{1}{2}\sum_i EB_i \cdot \lambda = \frac{\lambda}{2} = \frac{1}{2}. \tag{8}$$
The inequality uses: (a) independence of $B$ and $X$; (b) the KKT condition $E(X_i / b^{*'}X) \leq 1$ for all $i$; (c) $E\sum B_i = 1$.

Hence $B^* = Ub^*$ achieves value $\frac{1}{2}$ against every opponent, confirming it is the game-theoretic optimum.

### Corollaries (deterministic dominance)

**Corollary 1.** $P(B'X \geq cUb^{*'}X) \leq \frac{1}{2}c$ for all $B \in \mathfrak{B}$, $c > 0$. (Follows from the same Markov-type argument.)

**Corollary 2.** Dropping the randomization $U$: $P(B'X \geq c\, b^{*'}X) \leq 1/c$ for all deterministic or random $B$, $c > 0$. This is a one-sided Markov inequality with $b^{*'}X$ playing the role of a "fixed amount of capital." It says the log-optimal portfolio is hard to beat by a large factor.

### Underlying lemma (Section 2)

The lemma solves the auxiliary game where players 1 and 2 choose distributions $F$ and $G$ on $[0,\infty)$ with unit mean, drawing $X \sim F$, $Y \sim G$ independently; payoff to player 1 is $P(X \geq Y)$. The unique optimal strategies are:
$$F^*(t) = G^*(t) = \begin{cases} t/2 & 0 \leq t \leq 2, \\ 1 & t > 2. \end{cases} \tag{3}$$
This is $\mathrm{Unif}[0,2]$ -- explaining why the randomization factor $U$ appears.

### St. Petersburg paradox example (Section 4)

Applied to a St. Petersburg gamble with entry fee $c$ per unit: $P(X = 2^i) = 2^{-i}$, $EX = \infty$. The investor allocates fraction $b$ of capital $S_0$. The log-optimal fraction satisfies $b^* = 1$ for $0 < c \leq 3$, and $b^* \to 0$ as $c \to \infty$. For $c \leq 3$ all entry fees are "fair" in the sense that $\max E\ln S > 0$, and the growth rate is $(1/n)\log_2 S_n \to 2 - \log_2 c$.

## Domain of applicability

**Where it works:**
- Single-period and (by Breiman's results) repeated i.i.d. investment with known distribution $F$.
- Any number of assets $m$; no distributional assumptions beyond $X \geq 0$ and finiteness of $\sup_b E\ln b'X$.
- The competitive justification is utility-free: it does not assume logarithmic preferences.

**Where it breaks / limitations:**
- **Known distribution.** The entire analysis conditions on known $F$. There is no estimation error, model uncertainty, or learning. (Cover's later "universal portfolios" (1991) address this for a different objective.)
- **Single-period game.** The head-to-head competitive framing is one-shot. Multi-period competitive optimality is not established here (the paper only cites Breiman's asymptotic results).
- **Randomization caveat.** The game-theoretic optimum requires the $\mathrm{Unif}[0,2]$ randomization of capital. The authors themselves concede (Section 5) they would not advocate using $U$ in practice. The deterministic portfolio $b^*$ is only shown to satisfy the weaker Corollary 2 bound $P(B'X \geq cb^{*'}X) \leq 1/c$, not the tight $\frac{1}{2}$ result.
- **No transaction costs, frictions, or constraints** beyond the simplex.
- **Nonnegative returns only** ($X_i \geq 0$). This excludes short selling and leveraged positions.
- **Samuelson's critique still applies in part.** The paper rebuts the claim that log-optimality is only a long-run criterion, but the competitive framing (beat the opponent at least half the time) is a specific objective. An investor who cares about expected utility of terminal wealth with a non-log utility is not addressed.

**What is genuinely novel:** The game-theoretic single-period justification for $b^*$ is new. The connection between the Kelly criterion and minimax competitive portfolio selection, and the precise role of the $\mathrm{Unif}[0,2]$ randomization as the solution to the capital-distribution game, are the original contributions. The KKT characterization of $b^*$ and the Breiman properties (P1, P2) were known.
