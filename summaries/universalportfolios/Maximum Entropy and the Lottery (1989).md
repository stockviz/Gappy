# Maximum Entropy and the Lottery

**Authors:** Hal Stern, Thomas M. Cover  
**Year:** 1989  
**Journal/Venue:** *Journal of the American Statistical Association*, Vol. 84, No. 408, pp. 980--985

## Problem statement

In a pari-mutuel lotto game (Canada's Lotto 6/49), the prize pool for each tier is split among winners. Tickets consisting of unpopular number combinations yield higher expected payouts because fewer co-winners share the prize. The central statistical question: given only the observed *marginal* frequencies (the proportion of tickets containing each number $k = 1, \ldots, M$), can one estimate the full joint distribution $P(t)$ over all $\binom{M}{m}$ possible $m$-tuples $t$? This estimate is needed to evaluate the expected return of any candidate ticket and thus to identify exploitable unpopular combinations.

## Approach (short)

Under the assumption that the unconditional (population-level) distribution on tickets is uniform, the conditional distribution given the observed marginals converges to the *constrained maximum entropy* distribution. The authors compute this distribution numerically via generalized iterative scaling, then use Monte Carlo simulation of the lottery mechanism to evaluate expected returns for tickets of varying popularity.

## Approach (detailed)

1. **Setup.** Players choose $m = 6$ numbers from $\{1, \ldots, M\}$, $M = 49$. Let $T_j$ ($j = 1, \ldots, n$) be $n$ i.i.d. tickets drawn from unknown distribution $P(t)$ on the $\binom{M}{m}$ possible $m$-tuples. The observable data are the marginal selection frequencies $r_k$ = empirical probability that number $k$ appears on a ticket, for each $k = 1, \ldots, M$. The indicator $I_k(t) = 1$ iff tuple $t$ contains number $k$.

2. **Maximum entropy characterization (Theorem 1).** Assume the unconditional distribution is uniform: $\Pr(T_1 = t) = 1/\binom{M}{m}$ for all $t$. Then the conditional distribution given the marginal constraints converges:
$$\Pr\!\left(T_1 = t \;\middle|\; \frac{1}{n}\sum_{j=1}^{n} I_k(T_j) = r_k,\; k = 1, \ldots, M\right) \;\longrightarrow\; P^*(t),$$
where $P^*(t)$ maximizes Shannon entropy $H(P) = -\sum_t P(t)\ln P(t)$ subject to $\sum_t P(t) I_k(t) = r_k$ for $k = 1, \ldots, M$. This is the conditional limit theorem of Csiszar (1984) and Van Campenhout & Cover (1981).

3. **Exponential family form (Theorem 2, Kagan--Linnik--Rao 1973).** The solution is a multiplicative (log-linear) model:
$$P^*(t) = \exp\!\left(\lambda_0 + \sum_{j=1}^{M} \lambda_j I_j(t)\right) = c \prod_{j=1}^{M} \theta_j^{I_j(t)},$$
where $\lambda_0, \ldots, \lambda_M$ (equivalently $c, \theta_1, \ldots, \theta_M$) are chosen to satisfy the marginal constraints and normalization.

   *Proof sketch that $P^*$ maximizes entropy.* For any feasible $Q$:
   $$H(Q) = -\sum_t Q(t)\ln Q(t) \;\le\; -\sum_t Q(t)\ln P^*(t) = -\sum_t P^*(t)\ln P^*(t) = H(P^*).$$
   The first inequality is nonnegativity of $D_{\mathrm{KL}}(Q \| P^*)$; the subsequent equality uses the fact that $\ln P^*(t)$ is an affine function of the sufficient statistics $I_k(t)$, so $\sum_t Q(t)\ln P^*(t)$ depends on $Q$ only through its marginals, which equal those of $P^*$.

4. **Numerical computation via generalized iterative scaling (Darroch--Ratcliff 1972).** Initialize $\phi_k^{(0)} = 1/\binom{M}{m}^{1/m}$ for each $k$ (corresponding to the uniform distribution). Update:
$$\phi_k^{(n+1)} = \phi_k^{(n)} \left(\frac{r_k}{r_k^{(n)}}\right)^{1/m}, \qquad k = 1, \ldots, M,$$
where $r_k^{(n)} = \Pr\{I_k(t) = 1\}$ under $P^{(n)}(t) = \prod_j \phi_j^{I_j(t)}$ (after normalization). This avoids storing all $\binom{49}{6} \approx 14 \times 10^6$ tuple probabilities; only $M = 49$ parameters are maintained. Convergence is guaranteed whenever the constraints are feasible (Darroch--Ratcliff). Computation: $> 20$ CPU hours on a VAX 11/780.

5. **Expected return evaluation via Monte Carlo.** For a candidate ticket $t$:
   - Winning numbers are drawn uniformly; a bonus number is drawn separately.
   - Under $P^*$, compute the probabilities $p_3, p_4, p_5, p_{5+b}, p_6$ that a random ticket matches 3, 4, 5, 5+bonus, or 6 of the winning numbers.
   - The number of co-winners at each tier is drawn from a binomial (or Poisson approximation) with $X - 1$ trials. Prizes are split according to the Canadian pari-mutuel rules (55% to government; remainder allocated 25%/13%/17%/45% across the four prize tiers).
   - 100 simulated draws yield mean expected prize and standard error for each tier.

6. **Key quantitative results (Table 1).** With $X = 10$ million tickets sold:
   - Least popular sixtuple (20-30-39-40-41-48): expected return \$0.703 per \$1 ticket.
   - Most popular sixtuple (3-7-9-11-25-27): expected return \$0.249.
   - "Average" ticket: expected return \$0.397.
   - At $X = 1$ billion (eliminating jackpot minimum/carryover effects): least popular returns \$1.28, most popular \$0.25, average \$0.45.
   - Unpopular numbers: those $> 30$ and those ending in 8, 9, 0. Popular numbers: 3, 7, 9, 11, 25, 27.

7. **Goodness of fit (Section 5, Tables 2--3).** Comparison against California data (5.7 million tickets): the maximum entropy distribution underestimates the number of duplicated sixtuples and assigns zero probability to tickets chosen $\ge 10$ times. The uniform-unconditional assumption is violated because $\sim 71\%$ of players choose from a restricted subset ($\sim 30$ numbers), with $\sim 29\%$ choosing truly at random.

8. **Alternative models (Section 6).** Two-component mixture: fraction $P_1$ choose uniformly at random, fraction $1 - P_1$ choose from a restricted set of $\binom{M'}{m}$ sixtuples. MLE gives $\hat{P}_1 = 0.711$, $\hat{P}_2 = 0.041 \approx \binom{30}{6}/\binom{49}{6}$. A Gamma-Poisson (negative binomial) model for individual ticket frequencies also fits better than maximum entropy (Table 3), but neither alternative identifies *which* sixtuples are unpopular---they only confirm the existence of popular/unpopular structure.

## Domain of applicability

- **Core validity.** The maximum entropy result is exact in the limit of large $n$ under the uniform-unconditional assumption and requires only marginal data---a major practical advantage since pairwise or higher-order selection frequencies are typically unavailable.
- **Uniform-unconditional assumption is empirically violated.** The data show heavy tails in the ticket frequency distribution (some sixtuples chosen $> 20$ times in $\sim 6$ million tickets), which the max-entropy model assigns probability zero. The authors acknowledge this directly.
- **Marginals-only limitation.** With only $M$ parameters, the model cannot capture correlations between number choices (e.g., birthday clusters, geometric patterns on the ticket slip). If pairwise marginals $q_{ij}$ were available, a richer max-entropy model with $\binom{M}{2}$ parameters could be fit.
- **The max-entropy estimate is conservative.** It underestimates the popularity gap between popular and unpopular tickets. Returns to the unpopular-number strategy are likely *higher* than reported.
- **Pari-mutuel structure is essential.** The entire analysis is specific to lotteries where prizes are shared. In fixed-prize lotteries, ticket popularity is irrelevant to expected return.
- **Stationarity.** The analysis uses a single week's marginals. If public behavior shifts (e.g., due to publicity about unpopular numbers), the advantage erodes---a point noted by the authors.
- **Transaction costs.** The favorable expected return at high sales volumes or large carryovers ignores taxes, time value, and the extreme variance inherent in rare large prizes.
