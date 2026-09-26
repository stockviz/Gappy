## 1. Metadata

- **Title:** The Arithmetic of Active Management
- **Author(s):** William F. Sharpe
- **Year:** 1991
- **Journal/Venue:** *Financial Analysts Journal*

## 2. Problem statement

Sharpe answers a precise aggregation question: if one partitions all invested dollars in a given market into a passive segment that holds the market portfolio and an active segment that deviates from it, what must be true about the **average** active dollar's return relative to the **average** passive dollar's return? The claim is not about whether some managers can outperform; it is about the arithmetic of the aggregate.

## 3. Approach (short)

The paper is an accounting identity, not an econometric or equilibrium model. It decomposes the market into passive and active holdings, writes the market return as the value-weighted average return across those holdings, and then uses the definition of a passive portfolio to show that the average active dollar must earn the market return before costs and must underperform after costs. The method belongs to aggregation/accounting rather than optimization.

## 4. Approach (detailed)

1. **Fix the market and define passive management exactly.**

   Let the relevant market be a fixed universe of securities, with market-cap weights $m_i$, $\sum_i m_i = 1$. A passive manager holds portfolio weights exactly equal to $m$. An active manager holds any different portfolio $w \neq m$.

2. **Partition all invested wealth into passive and active dollars.**

   Let total dollars invested in the market be
   $$
   V = V_P + V_A,
   $$
   where $V_P$ is the total passive capital and $V_A$ is the total active capital. Let $r_M$, $r_P$, and $r_A$ denote the market, average passive, and average active gross returns over the period.

3. **Use market-clearing arithmetic.**

   Because all invested dollars together hold the market portfolio,
   $$
   r_M = \frac{V_P}{V} r_P + \frac{V_A}{V} r_A.
   $$
   By definition of passive management, every passive dollar holds the market portfolio, hence
   $$
   r_P = r_M.
   $$
   Substituting into the aggregation identity gives
   $$
   r_M = \frac{V_P}{V} r_M + \frac{V_A}{V} r_A
   \quad\Longrightarrow\quad
   \frac{V_A}{V}(r_A-r_M)=0.
   $$
   If $V_A>0$, then necessarily
   $$
   r_A = r_M = r_P.
   $$
   This proves the before-cost result.

4. **Introduce costs.**

   Let average costs per dollar for passive and active management be $c_P$ and $c_A$, with typically $c_A>c_P$. Net returns are
   $$
   r_P^{net}=r_P-c_P,\qquad r_A^{net}=r_A-c_A.
   $$
   Since $r_A=r_P$ before costs,
   $$
   r_A^{net}-r_P^{net}=-(c_A-c_P)<0.
   $$
   Therefore
   $$
   r_A^{net}<r_P^{net}.
   $$

5. **Explain apparent empirical counterexamples.**

   Sharpe lists three main measurement failures:

   $$
   \text{(i) the "passive" comparator is not truly passive,}
   $$
   $$
   \text{(ii) the set of observed active managers is not the full active universe,}
   $$
   $$
   \text{(iii) performance is averaged across managers, not across dollars.}
   $$
   Equal-weighted or median-manager summaries are not estimates of the return on the average active dollar. Survivorship bias and benchmark mismatch create the same distortion.

6. **Interpret the theorem correctly.**

   The result is an aggregate identity. It does **not** imply:

   - no active manager can outperform,
   - no subset of active managers can outperform,
   - passive management is optimal for every investor under every objective.

   It implies only that outperformance is a zero-sum game before costs and negative-sum after costs at the aggregate level.

### Proof sketch

The proof is complete once one writes the market return as the value-weighted average of passive and active returns and uses the fact that the passive segment, in aggregate, **is** the market portfolio. No equilibrium assumptions are needed; the argument is purely additive.

## 5. Domain of applicability

The result applies whenever:

- the market is a closed universe over the horizon,
- passive management means holding market weights for that universe,
- one evaluates the **average invested dollar**, not the average manager.

It weakens if the benchmark is not the actual market held by the agents being compared, if one studies only a selected subset of active managers, or if costs are measured inconsistently. The result says nothing directly about equilibrium prices, optimality of indexing for a specific investor, or the persistence of skill among a minority subset of active managers.
