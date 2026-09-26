# Game-Theoretic Optimal Portfolios
**Authors:** Robert Bell and Thomas M. Cover
**Year:** 1988
**Journal/Venue:** Management Science, Vol. 34, No. 6

## Problem statement

Consider two investors competing in a stock market with $m$ assets distributed according to a known joint distribution $F(\mathbf{x})$. Each player chooses a portfolio $\mathbf{b} \in \mathbf{B} = \{\mathbf{b} \in \mathbb{R}^m : b_i \ge 0, \sum b_i = 1\}$ and is additionally allowed to randomize initial capital via a fair gamble (a nonneg r.v. with mean $\le 1$). The payoff to player 1 is $E\,\phi(W_1 \mathbf{b}_1'\mathbf{X} / W_2 \mathbf{b}_2'\mathbf{X})$ for a nondecreasing function $\phi$. Does this two-person zero-sum game have a value, and what are its minimax strategies? In particular, is there a single portfolio that is simultaneously optimal across the entire class of such $\phi$-games?

## Approach (short)

The paper shows that the log-optimal portfolio $\mathbf{b}^* = \arg\max_{\mathbf{b}} E \ln \mathbf{b}'\mathbf{X}$ is the unique game-theoretic optimal portfolio for every monotone nondecreasing payoff $\phi$. The optimal strategy factors into (i) a fair randomization of initial capital, designed to win a primitive gamble that involves no portfolio selection, and (ii) a deterministic allocation of the resulting capital according to $\mathbf{b}^*$. The same conclusion extends to multistage markets with sequential portfolio revision.

## Approach (detailed)

### 1. Setup and the stock market $\phi$-game

$m$ assets with price-relative vector $\mathbf{X} \sim F$. A portfolio $\mathbf{b} \in \mathbf{B}$ yields random capital $S = \mathbf{b}'\mathbf{X}$. Two players each start with one unit of capital. A strategy for player $i$ consists of:

- a choice of "fair" distribution $G_i$ on initial capital ($G_i(0^-) = 0$, $\int w\,dG_i(w) \le 1$),
- a portfolio $\mathbf{b}_i \in \mathbf{B}$.

Player $i$ gambles his unit of capital for $W_i \sim G_i$, independently, then invests $W_i$ according to $\mathbf{b}_i$. Player 1's payoff:

$$E\,\phi(W_1 \mathbf{b}_1'\mathbf{X} / W_2 \mathbf{b}_2'\mathbf{X}) = \int \phi(w_1 \mathbf{b}_1'\mathbf{x} / w_2 \mathbf{b}_2'\mathbf{x})\,dG_1(w_1)\,dG_2(w_2)\,dF(\mathbf{x}).$$

### 2. The primitive $\phi$-game (Section 2)

Strip out the portfolio: players simply choose fair r.v.'s $W_1, W_2$ with $EW_i \le 1$ and play the game $E\,\phi(W_1/W_2)$.

**Theorem 1.** The primitive $\phi$-game has pure optimal strategies $W_1^* = W_2^* \equiv 1$ (no randomization needed) if and only if $\phi'(1) \ge 0$ exists and

$$\frac{(t-1)}{t}\phi'(1) \le \phi(t) - \phi(1) \le (t-1)\phi'(1), \qquad \forall\; t > 0.$$

This is equivalent to $\phi$ being bounded between its tangent line at 1 from above and a specific hyperbolic bound from below. The value is $\mathbf{v}_\phi = \phi(1)$.

The proof constructs explicit two-point perturbations $W_1, W_2$ and shows that the saddlepoint conditions force $\phi$ to be continuous at 1, differentiable at 1 from both sides, with these sandwich inequalities.

**Remark.** The family $\phi_\alpha(t) = t^\alpha$, $0 \le \alpha \le 1$, satisfies these conditions, so pure strategies suffice for all such "power" payoffs.

### 3. Convex families and the log-optimal dominance (Section 3)

**Definition.** A set $\mathbf{S}$ of random variables is a *convex family* if $S_1, S_2 \in \mathbf{S}$ implies $\lambda S_1 + (1-\lambda)S_2 \in \mathbf{S}$ for all $\lambda \in [0,1]$.

Key examples:
- (Ex. 1) $\mathbf{S} = \{\mathbf{b}'\mathbf{X} : \mathbf{b} \in \mathbf{B}\}$ -- portfolio returns form a convex family.
- (Ex. 3) Returns from sequential (causal) portfolio strategies also form a convex family, via capital-splitting: invest $\lambda$ according to one strategy and $1-\lambda$ according to another, pool only at the terminal date.

**Theorem 2.** If $\mathbf{S}$ is a convex family and $S^*$ achieves $\sup_{S \in \mathbf{S}} E \ln S$, then

$$E \ln(S/S^*) \le 0 \quad \forall S \in \mathbf{S}$$

if and only if

$$E(S/S^*) \le 1 \quad \forall S \in \mathbf{S}.$$

*Proof sketch.* The forward direction is Jensen: $E\ln(S/S^*) \le \ln E(S/S^*) \le 0$. The converse uses a contradiction argument: if $E(S_1/S^*) > 1$ for some $S_1 \in \mathbf{S}$, form $S_\lambda = \lambda S_1 + \bar\lambda S^* \in \mathbf{S}$. Then $\ln(S_\lambda/S^*) = \ln(1 + \lambda(S_1/S^* - 1))$. A Taylor expansion around $\lambda = 0$, truncating at a finite level $M_0$ chosen so $E Y_{M_0} > 0$ where $Y = S_1/S^* - 1$, gives $E\ln(S_\lambda/S^*) > 0$ for small $\lambda > 0$, contradicting log-optimality of $S^*$.

**Corollary 2 (KKT conditions).** For $\mathbf{S} = \{\mathbf{b}'\mathbf{X}\}$, the log-optimal $\mathbf{b}^*$ satisfies:

$$E\frac{X_i}{\mathbf{b}^{*\prime}\mathbf{X}} \le 1 \quad \forall i, \qquad \text{with equality if } b_i^* > 0.$$

These are the Kuhn-Tucker conditions for $\max_{\mathbf{b}} E\ln \mathbf{b}'\mathbf{X}$ subject to $\mathbf{b} \in \mathbf{B}$.

**Equivalence of orderings.** The partial ordering $S_1 \ge S_2$ iff $E(S_2/S_1) \le 1$ and the ordering $E\ln S_1 \ge E\ln S_2$ share the same maximal element $S^* = S^{**}$, addressing Samuelson's (1969) concerns about intransitivity of "best portfolio" concepts.

### 4. The stock market $\phi$-game: main result (Section 4)

**Theorem 3.** Let $\phi$ be monotone nondecreasing. The two-person zero-sum game with payoff $E\,\phi(W_1\mathbf{b}_1'\mathbf{X}/W_2\mathbf{b}_2'\mathbf{X})$ has value $\mathbf{v}_\phi$ and optimal strategies:

$$W_i^* \sim G_i^*, \quad \mathbf{b}_1^* = \mathbf{b}_2^* = \mathbf{b}^*,$$

where $\mathbf{b}^*$ is the log-optimal portfolio and $G_1^*, G_2^*$ solve the primitive $\phi$-game.

*Proof.* The argument pivots on the fact that for any $W_2 \in \mathbf{W}$ and any $S_2 = \mathbf{b}_2'\mathbf{X}$, the ratio $W_2 S_2 / S^*$ is nonneg with $E(W_2 S_2/S^*) = (EW_2)(ES_2/S^*) \le 1$ by Theorem 2 and independence. So $W_2 S_2/S^* \in \mathbf{W}$, reducing the stock market game to the primitive $\phi$-game.

The strategy factors cleanly:
1. **Randomization phase:** each player gambles initial capital according to $G_i^*$, designed purely to win the primitive $\phi$-game. This depends on $\phi$ but not on $F$.
2. **Portfolio phase:** both players invest all resulting capital according to $\mathbf{b}^*$, which depends on $F$ but not on $\phi$.

### 5. Multistage extension (Sections 5-6)

For a sequential market $\mathbf{X}_1, \mathbf{X}_2, \ldots, \mathbf{X}_n$ (possibly dependent), the sequential log-optimal portfolio $\mathbf{b}_t^*(\mathbf{X}_1, \ldots, \mathbf{X}_{t-1})$ at each stage $t$ is conditionally log-optimal given the past.

**Theorem 4 (Section 5).** In the multistage setting with $\phi$ nondecreasing, the conditionally log-optimal sequential portfolio is minimax for all stopping times $n$.

**Theorem 5 (Section 6, conditionally randomized game).** Players observe each other's portfolio returns $S_1, S_2$ after portfolio choice and before the randomization phase. Each player can condition the randomization $W_i$ on $(\mathbf{x}, S_1, S_2)$. The game still has value $\mathbf{v}_\phi$ and optimal strategies $\mathbf{b}_1^* = \mathbf{b}_2^* = \mathbf{b}^*$ with unconditional randomization $W_{i,\phi}^*$. Conditional randomization dominates unconditional in the admissibility sense but does not improve the value.

### 6. Asymptotic interpretation

At time $n$, the ratio of any competitor's capital to the log-optimal capital satisfies $S_n / S_n^* \ge 0$ and $E(S_n/S_n^*) \le 1$. Hence $S_n$ is always within "fair reach" of $S_n^*$: any competitor's wealth relative to the log-optimal investor is a nonneg supermartingale. This provides an alternative, competitive rationale for the log criterion beyond the Kelly/Breiman growth-rate arguments.

## Domain of applicability

**Where it applies:**
- Known distribution $F$ (or at least the ability to compute $\mathbf{b}^*$). The game-theoretic optimality is *conditional* on knowing $F$.
- Nonneg asset prices (price relatives $X_i \ge 0$), long-only portfolios ($b_i \ge 0$).
- Arbitrary dependence structure across time periods in the multistage version.
- Any monotone nondecreasing payoff $\phi$, covering relative return, probability of outperformance, expected excess return, etc.

**Where it breaks:**
- **Unknown distribution.** The entire analysis is conditional on $F$ being known. In practice $\mathbf{b}^*$ must be estimated, and the competitive optimality guarantees do not survive estimation error. (The companion "universal portfolios" line of work by Cover, starting in 1991, addresses this.)
- **Short sales and leverage.** The constraint set $\mathbf{B}$ is the simplex; the results do not extend to $b_i < 0$ or $\sum b_i \ne 1$ without modification.
- **Finite-horizon utility.** The log criterion is myopic. For an investor with a finite horizon and non-log utility, the log-optimal portfolio is not generally optimal in the classical expected-utility sense (Samuelson's objection). The paper addresses only the *competitive* criterion.
- **Transaction costs.** Absent from the model. Continuous rebalancing to $\mathbf{b}^*$ is implicitly assumed costless.
- **The factorization into randomization + portfolio is elegant but the randomization step is a modeling device**; real investors do not pre-gamble their capital. The content is the irrelevance of $\phi$ for the portfolio decision, not a recommendation to randomize.
- **$E\ln S^* > -\infty$ is required** for $\mathbf{b}^*$ to exist and the theorems to apply. Degenerate markets where all portfolios can go to zero are excluded.
