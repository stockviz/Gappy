# 1. Metadata

- **Title:** A Statistic for Measuring the Influence of Side Information in Investment
- **Author(s):** Charles Mathis, Thomas M. Cover
- **Year:** 2005
- **Journal/Venue:** working paper / conference-style note

# 2. Problem statement

The paper asks: **given a realized stock-return sequence $x_1,\dots,x_n$ and a side-information state sequence $s_1,\dots,s_n\in\{1,\dots,d\}$, can one test whether the side-information sequence has genuine financial value by comparing hindsight-optimal wealth with and without conditioning on the states?**

# 3. Approach (short)

The method is a nonparametric permutation test built from hindsight-optimal constant rebalanced portfolios. Mathis and Cover compare the wealth of the best CRP on the full sample with the product of the best CRPs on the subsequences indexed by side-information states. Under the null that the state labels are irrelevant to returns, they prove a universal asymptotic null law: half a chi-squared random variable.

# 4. Approach (detailed)

1. **Hindsight-optimal wealth without side information**

   For return vectors $x_i\in\mathbb R_+^m$, constant portfolio $b\in\Delta_m$, and sample $x^n$,
   $$
   S_n(b,x^n)=\prod_{i=1}^n b^\top x_i.
   $$
   The hindsight-optimal CRP wealth is
   $$
   S_n^\star(x^n)=\max_{b\in\Delta_m} S_n(b,x^n).
   $$

2. **Hindsight-optimal wealth with state-dependent rebalancing**

   Let $s_i\in\{1,\dots,d\}$. For each state $k$, define the subsequence wealth
   $$
   S_{n,k}^\star
   =
   \max_{b\in\Delta_m}
   \prod_{i:\,s_i=k} b^\top x_i.
   $$
   If the investor may use a separate constant portfolio for each state, the resulting hindsight wealth is
   $$
   S_n^{\star\star}=\prod_{k=1}^d S_{n,k}^\star.
   $$

3. **Define the test statistic**

   The side-information value statistic is
   $$
   T_n^\star=\frac{S_n^{\star\star}}{S_n^\star}\ge 1.
   $$
   If side information is useless, splitting the sample by state should not create much extra hindsight wealth. Large values of $T_n^\star$ indicate exploitable dependence between states and returns.

4. **Null hypothesis**

   The null is not probabilistic independence of two random sequences in the usual sense, because the return sequence is treated as fixed. Instead, conditional on the multiset of states, all permutations of the state sequence are assumed equally likely. This is a permutation-test null: the time ordering of states carries no information about returns.

5. **Main theorem**

   For any nondegenerate return sequence $x^n$ and state sequence with counts $n_k$, if the state sequence is uniformly distributed over all permutations with those counts, then
   $$
   \frac12 \log T_n^\star
   \xrightarrow{d}
   \frac12 \chi^2_{(d-1)(m-1)}
   $$
   or equivalently
   $$
   \log T_n^\star
   \xrightarrow{d}
   \frac12 \chi^2_{(d-1)(m-1)}.
   $$
   The paper states the result as the asymptotic distribution of $\log T_n^\star$, independent of the underlying return sequence and of the marginal state frequencies, provided the permutation null holds.

6. **Why the degrees of freedom are $(d-1)(m-1)$**

   There are $d$ state-specific portfolios and $m$ assets, but simplex constraints remove one degree in each dimension. Intuitively, the statistic measures whether the cross-classification of states and assets departs from the product structure implied by “no financial value,” leaving $(d-1)(m-1)$ effective dimensions.

7. **Proof sketch**

   Around the unrestricted optimum, the log-wealth criterion has a quadratic expansion in the additional state-specific parameters. Under the null, the first-order term is asymptotically centered and the second-order term is governed by the usual likelihood-ratio geometry. Thus the improvement in maximized log wealth from allowing state dependence behaves like a quadratic form in asymptotically normal score terms, giving the chi-squared limit. The paper’s novelty is that this limit law is distribution free with respect to the fixed return sequence.

8. **Decision rule**

   Because the null law is universal, one can compute a $p$-value from the observed $T_n^\star$ using the $\chi^2$ quantile. This gives a direct financial-value test of side information: if even hindsight state-dependent CRPs do not beat the unconditional hindsight CRP by more than the chi-squared benchmark, the side information is not persuasive.

# 5. Domain of applicability

The method applies to discrete-valued side information and long-only constant rebalanced portfolios. It is especially attractive when the researcher wants a financially meaningful nonparametric test rather than a conventional dependence test on discretized returns. The theorem depends on nondegeneracy of the return subsequences and on the permutation-null interpretation. It does not address transaction costs, continuous side information, or the implementability of the hindsight-optimal state strategy; it only tests whether the side information could have had financial value in principle.
