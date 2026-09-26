# Behavioral Portfolio Theory (2000)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/Behavioral Portfolio Theory.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Behavioral Portfolio Theory
- **Author(s):** Hersh Shefrin, Meir Statman
- **Year:** 2000
- **Journal/Venue:** *Journal of Financial and Quantitative Analysis*

# 2. Problem statement

The paper develops a positive theory of portfolio choice consistent with the Friedman-Savage observation that investors may simultaneously want insurance and lottery-like upside. The mathematical problem is to characterize efficient portfolios when investors care not just about mean and variance, but about aspiration levels, downside probabilities, and “security” versus “potential.” The paper asks whether such portfolios coincide with mean-variance efficient portfolios and whether CAPM two-fund separation survives.

# 3. Approach (short)

The approach combines SP/A theory (security, potential, aspiration) with prospect-theory-style mental accounting. In the single-account version, the investor chooses terminal state payoffs to maximize a criterion trading off expected wealth and the probability of reaching an aspiration level. The authors characterize the resulting efficient frontier and compare it to mean-variance efficiency. In the multiple-account version, they reinterpret portfolios as layered mental-account pyramids aimed separately at avoiding poverty and reaching riches.

# 4. Approach (detailed)

1. **Single-account behavioral objective**

   In the discrete-state setup, a portfolio is a vector of terminal state consumptions
   $$
   W=(W_1,\dots,W_n)
   $$
   priced by state prices $v_i$ and probabilities $p_i$, subject to the budget constraint
   $$
   \sum_i v_i W_i \le W_0.
   $$
   The investor values:
   - distorted expected wealth $E_h(W)=\sum_i r_i W_i$, with rank-dependent decision weights $r_i$ (defined below),
   - and the probability of meeting aspiration $A$,
     $$
     D(A)=\Pr\{W\ge A\}.
     $$
   Efficient BPT-SA portfolios maximize a utility $U(E_h(W),D(A))$ along the frontier of feasible $(E_h,D)$ pairs.

2. **Efficient BPT-SA portfolio shape**

   Theorem 1 characterizes the efficient payoff shape. In equiprobable states, there exists a critical state $i_c$ such that the optimal payoff has three regions:
   $$
   W_i=0 \quad (i<i_c),\qquad
   W_i=A \quad (i_c\le i<n),\qquad
   W_n>\!A.
   $$
   Economically, the investor buys:
   - a security layer guaranteeing aspiration in sufficiently likely/good states,
   - plus a lottery layer concentrated in the cheapest state-price-per-probability state.

   This is the formal version of “bonds plus lottery tickets.”

3. **Why that payoff is optimal**

   The proof is constructive. To maximize expected wealth subject to a minimum aspiration-probability requirement:
   - first buy the cheapest state-contingent claim per unit probability to maximize expected wealth;
   - then, if the aspiration-probability constraint is violated, reallocate wealth minimally into a set of states whose total probability just exceeds the target $a$, purchasing exactly $A$ in those states.

   Under equiprobability, this means filling the highest-probability-value states first and then concentrating residual upside in the cheapest state.

4. **Mean-variance benchmark**

   Theorem 2 derives the mean-variance-efficient payoff in the same discrete-state environment as
   $$
   W_i=\frac{1}{b}\left[1-\lambda \frac{v_i}{p_i}\right],
   $$
   with $b>0$ and $\lambda$ chosen from the budget constraint. This is an affine function of the probability-normalized state price $v_i/p_i$; the source’s contrary prose is inconsistent with its displayed formula.

5. **Noncoincidence of frontiers**

   Theorem 3 shows that if the BPT-SA efficient portfolio has at least three positive payoff states with distinct $v_i/p_i$, then it is generically **not** mean-variance efficient. The reason is structural:
   - mean-variance-efficient payoffs vary smoothly with $v_i/p_i$,
   - BPT-SA efficient payoffs have kinks and flat regions (zero region, aspiration plateau, lottery spike).

   Therefore the BPT efficient frontier and the mean-variance frontier do not generally coincide.

6. **Failure of CAPM two-fund separation**

   Since optimal BPT portfolios depend on aspiration levels and the security/potential tradeoff, two investors with the same beliefs but different aspirations need not hold scaled versions of one risky fund plus the risk-free asset. Hence standard CAPM two-fund separation fails.

7. **Multiple mental accounts**

   The paper then moves from BPT-SA to BPT-MA, where investors segment wealth into distinct accounts:
   - a downside-protection account (“avoid poverty”),
   - an upside account (“shot at riches”),
   possibly more layers.

   Covariances across accounts are psychologically underweighted or ignored, so the optimal total portfolio resembles a layered pyramid rather than a single integrated efficient portfolio.

8. **Interpretation**

   BPT is positive rather than normative. The paper is not claiming investors *should* ignore covariance; it claims many investors appear to choose portfolios as if they do, because aspirations and mental accounts matter. The model rationalizes concentrated upside bets coexisting with safety-seeking behavior.

9. **What is exact**

   - The single-account discrete-state characterization theorems are exact.
   - The noncoincidence with mean-variance efficiency is exact in the stated discrete framework.
   - The multi-account layering interpretation is more behavioral and less theorem-driven.

# 5. Domain of applicability

- The theory applies to investors whose preferences are aspiration-based and behaviorally segmented rather than globally concave over final wealth.
- It is useful for explaining demand for structured products, capital-protected speculation, concentrated upside bets, and mental-account portfolio construction.
- It is not a market-clearing equilibrium asset-pricing theory in the CAPM sense.
- The multi-account version sacrifices some normative coherence by underweighting covariance across accounts.
- The novel contribution is the theorem-backed distinction between aspiration-efficient portfolios and mean-variance-efficient portfolios, not merely the verbal claim that investors like lotteries.

# 6. Probability distortion is part of the model

The subscript in $E_h$ is substantive: this is generally **not** ordinary expectation under the objective state probabilities. For ordered wealth outcomes $W_1\leq\cdots\leq W_n$, define $D_i=\Pr(W\geq W_i)$, $D_{n+1}=0$, and decision weights $r_i=h(D_i)-h(D_{i+1})$. Then
$$
E_h(W)=\sum_i r_iW_i=\sum_i h(D_i)(W_i-W_{i-1}),\qquad W_0=0
$$
where the last $W_0$ is the baseline in the telescoping expression, not initial capital. The source combines fear and hope through
$$
h(D)=\delta D^{1+q_s}+(1-\delta)\{1-(1-D)^{1+q_p}\}.
$$
Here $q_s,q_p\geq0$ govern fear and hope, and $\delta$ their relative strength. Fear shifts decision weight toward poor outcomes; hope toward favorable ones. The aspiration probability $D(A)$ remains a separate criterion. When both distortion parameters are zero, $h(D)=D$ and distorted expectation reduces to ordinary expectation.

The optimization must respect the consistency of the payoff ordering and the ordering of state prices divided by decision weights. One cannot assign arbitrary fixed $r_i$ to states, optimize, and ignore that a change in payoff ranking changes the rank-dependent weights. This is why the complete-state characterization has more structure than a generic mean-plus-probability objective.

# 7. Exact frontier construction and its qualifications

To avoid ambiguity in the printed probability notation, write the safety requirement as $\Pr(W\geq A)\geq q$. For each feasible collection of success states, purchase the minimum aspiration payoff $A$ in those states and place residual capital in the state with the most favorable payoff per unit cost. Under the theorem's ordering and equiprobability conditions, success states form the upper segment of the state ordering. With unequal probabilities they need not be contiguous: a high-probability state can be necessary even when intermediate states remain unfunded. The source illustrates this with probabilities $(0.6,0.2,0.2)$ and a success target exceeding $0.55$.

There are also feasibility constraints. If initial capital is insufficient to finance aspiration in states with enough total probability, no feasible portfolio exists. If the unconstrained expected-payoff maximizing state alone meets the target, the solution can collapse to a concentrated contingent claim. Increasing aspiration can therefore reduce diversification sharply rather than simply increase the scale of a fixed risky fund.

The mean-variance comparison follows directly from quadratic utility in a complete state market:
$$
\max_W\sum_i p_i\left(W_i-\frac b2W_i^2\right),\quad \sum_i v_iW_i=W_{\rm initial}.
$$
The first-order condition is $W_i=(1-\lambda v_i/p_i)/b$, with
$$
\lambda=\frac{\sum_i v_i-bW_{\rm initial}}{\sum_i v_i^2/p_i}.
$$
This payoff is **affine**, not strictly concave, in $v_i/p_i$. The source's prose uses “strictly concave,” but its displayed formula is linear. Nonnegativity truncates the solution at zero and changes the active state set. A positive aspiration plateau plus a distinct upside spike cannot generally match this affine payoff across distinct state-price ratios. This is the operative reason for noncoincidence of the frontiers.

# 8. Numerical examples and what they demonstrate

In the eight-state example, states are equiprobable and state prices are $0.37,0.19,0.12,0.09,0.07,0.06,0.05,0.04$. With one dollar initially and aspiration $0.90$, the behavioral portfolio pays $0.90$ in the first seven states and $3.70$ in the last. Its expected return is about $25.37\%$, with return variance about $0.8756$. The paper constructs a mean-variance portfolio with the same mean and variance about $0.0941$. The example demonstrates mean-variance inefficiency; it does not imply behavioral inefficiency under the investor's aspiration objective.

The normal-return examples provide a separate lesson. A higher-variance, lower-mean asset can offer a higher chance of clearing an unusually high target. Under no short sales, it may therefore lie on an aspiration-efficient frontier even though another asset dominates it in mean and variance. This is about the location of the target relative to the return distribution, not an unconditional liking for variance.

The safety-first discussion also corrects a common inference from Chebyshev's inequality. Minimizing an upper bound on shortfall probability need not minimize the actual probability. The bound can be very loose or even exceed one. Improving a mean-to-shortfall-distance ratio can sacrifice expected wealth while leaving the actual shortfall probability unchanged. A robust bound and an exact probability objective are different optimization problems.

# 9. Mental accounts, evidence, and use

In BPT-MA a planner divides capital between doers with different aspirations. Each doer solves its own problem; the planner aggregates their utilities rather than pooling their terminal payoffs into one globally integrated account. The indirect utility within an account can have increasing marginal utility at the points where another success state becomes affordable. These discrete changes help explain why the safety and upside layers become qualitatively different.

The two-account numerical example allocates $0.20$ to the safety account and $0.80$ to the upside account. The safety doer puts $93\%$ of its account into the lower-risk security; the upside doer puts all its account into the riskier security. Reported aspiration failure probabilities are $5.8\%$ and more than $99.9\%$, respectively. These are calibrated illustrative outcomes, not estimates from an investor sample. If shorting is allowed, different accounts can take offsetting long and short positions in the same security, reflecting their failure to integrate risks.

The empirical support discussed consists of existing experimental and institutional observations, including insensitivity to changes in supplied correlations and securities/currency overlay separation. It is not a new broad portfolio backtest. Nor does the evolutionary discussion prove that all behavioral portfolios dominate all mean-variance portfolios: long-run fitness depends on state budget shares, and zero wealth in recurring states can be fatal for either class.

For implementation, first specify actual attainable securities, aspiration amounts and dates, probabilities, distortion parameters, and borrowing restrictions. The complete contingent-claim market is an analytical benchmark; replicating its bond-and-lottery shape can be costly or impossible in an incomplete market. A practical goals-based plan can retain account labels while calculating aggregate covariance and liabilities explicitly. The descriptive model explains why people separate goals; it does not establish that ignoring cross-account exposures is a sound risk-control procedure.
