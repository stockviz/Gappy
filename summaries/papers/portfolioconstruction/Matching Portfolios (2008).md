# 1. Metadata

- **Title:** Matching Portfolios
- **Author(s):** David Kane, Jeff Enos
- **Year:** 2008
- **Journal/Venue:** Technical note / software-oriented article

# 2. Problem statement

The paper asks a benchmarking problem: **how can one construct a comparison portfolio that matches the observable characteristics of a target portfolio, while holding different securities, so that relative performance can be interpreted as stock-selection skill rather than a byproduct of country/sector/size/liquidity tilts?**

# 3. Approach (short)

The method imports matching ideas from causal inference into portfolio analytics. A target portfolio is treated as a “treated sample” of securities, and a benchmark is formed by greedily matching each held security to nonheld securities with similar covariates such as country, sector, and liquidity. The matched benchmark is then used as a distributional rather than single-index comparator for portfolio performance.

# 4. Approach (detailed)

1. **Target portfolio and covariates**

   Let the target portfolio hold securities $i\in T$ with weights $w_i$, $\sum_{i\in T} w_i=1$, and let each security have observable characteristics $z_i$ such as:

   - country;
   - sector;
   - liquidity;
   - market capitalization or other style descriptors.

   A naive benchmark such as the full universe can be badly misleading if the target portfolio is concentrated in a special subset of securities.

2. **Matching objective**

   The benchmark should be similar in covariate space but disjoint in names. In stylized notation, one would like to solve
   $$
   \min_{\mathcal M} \sum_{i\in T} d(z_i,z_{\mathcal M(i)})
   $$
   over assignments $\mathcal M(i)$ to controls $j\notin T$, where $d(\cdot,\cdot)$ is a distance in covariate space. The paper uses off-the-shelf matching machinery from the `MatchIt` framework and a greedy-matching implementation.

3. **Constructing the matched portfolio**

   Once matches are chosen, the benchmark portfolio inherits the weights of the target portfolio on the matched names:
   $$
   w_j^{match} = \sum_{i\in T:\mathcal M(i)=j} w_i.
   $$
   The resulting portfolio mimics the target’s ex ante characteristics without using the same securities.

4. **Performance evaluation**

   If $R^T$ is the target-portfolio return and $R^{match}$ the matched-portfolio return, the abnormal performance measure is
   $$
   \alpha^{match} = R^T - R^{match}.
   $$
   The paper’s key point is that $\alpha^{match}$ is more interpretable than performance relative to an index that may have very different characteristics from the target portfolio.

5. **Distributional benchmarking**

   Because matching is not unique, one can generate multiple matched portfolios and examine the empirical distribution of matched returns. The target portfolio’s percentile within this distribution becomes a more informative statement than a single benchmark-relative return.

6. **Illustrative case**

   The paper uses a short-only portfolio derived from an assay focus list to show the method’s purpose. A raw comparison to the whole universe is misleading because the target portfolio differs sharply in country, sector, and liquidity composition. Matching corrects that by creating a control portfolio that “looks like” the target except for the actual stock identities.

7. **Proof status**

   There is no theorem of optimality. The logic is constructive:

   - define relevant observables $z_i$;
   - choose a distance metric and a matching rule;
   - form a benchmark on matched securities;
   - compare realized returns.

   The credibility of the benchmark depends on the adequacy of observed covariates, exactly as in matching estimators in causal inference.

# 5. Domain of applicability

- The method applies to **benchmarking and attribution**, not direct portfolio optimization.
- It is useful when a portfolio is unusual enough that standard benchmark indexes are structurally mismatched.
- It is only as good as the chosen observables $z_i$: unobserved differences between held and matched securities remain uncontrolled.
- The method is strongest for descriptive relative-performance analysis, not for causal claims about manager skill.
