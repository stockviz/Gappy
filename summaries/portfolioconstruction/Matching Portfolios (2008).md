# Matching Portfolios

**Source:** [PortfolioReplication.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioReplication.pdf>)  
**Source coverage:** all nine PDF pages, including the printed holdings, balance checks, and Q1 2005 performance example.

## 1. Metadata

- **Title:** Matching Portfolios
- **Author(s):** David Kane, Jeff Enos
- **Year:** 2008
- **Journal/Venue:** Technical note / software-oriented article

## 2. Problem statement

The paper asks a benchmarking problem: **how can one construct a comparison portfolio that matches the observable characteristics of a target portfolio, while holding different securities, so that relative performance can be interpreted as stock-selection skill rather than a byproduct of country/sector/size/liquidity tilts?**

## 3. Approach (short)

The method imports matching ideas from causal inference into portfolio analytics. A target portfolio is treated as a “treated sample” of securities, and a benchmark is formed by greedily matching each held security to nonheld securities with similar covariates such as country, sector, and liquidity. The matched benchmark is then used as a distributional rather than single-index comparator for portfolio performance.

## 4. Approach (detailed)

1. **Target portfolio and covariates**

   For a long-only formulation, let the target portfolio hold securities $i\in T$ with weights $w_i$, $\sum_{i\in T} w_i=1$, and let each security have observable characteristics $z_i$ such as:

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

   Because matching is not unique, one can generate multiple matched portfolios and examine the empirical distribution of matched returns. A target percentile can summarize a distribution of matched controls, but the actual displayed example uses only one match and supplies no statistical significance test.

6. **Illustrative case**

   The paper uses a short-only portfolio derived from an assay focus list to show the method’s purpose. A raw comparison to the whole universe is misleading because the target portfolio differs sharply in country, sector, and liquidity composition. Matching corrects that by creating a control portfolio that “looks like” the target except for the actual stock identities.

7. **Proof status**

   There is no theorem of optimality. The logic is constructive:

   - define relevant observables $z_i$;
   - choose a distance metric and a matching rule;
   - form a benchmark on matched securities;
   - compare realized returns.

   The credibility of the benchmark depends on the adequacy of observed covariates, exactly as in matching estimators in causal inference.

## 5. Domain of applicability

- The method applies to **benchmarking and attribution**, not direct portfolio optimization.
- It is useful when a portfolio is unusual enough that standard benchmark indexes are structurally mismatched.
- It is only as good as the chosen observables $z_i$: unobserved differences between held and matched securities remain uncontrolled.
- The method is strongest for descriptive relative-performance analysis, not for causal claims about manager skill.


## 6. The actual example: what changes when the benchmark is matched

Kane and Enos use an Assay Research Focus List observed on December 31, 2004. The list contains 33 companies with accounting or financial-statement concerns. The available universe contains 4,000 developed-market companies, including every Focus List name. The exercise shorts each of the 33 names in equal proportion and evaluates the first quarter of 2005. This is a single illustrative cross-section, not a long backtest of an optimized strategy.

The data include security identifiers, trading country, currency, closing price, economic sector, normalized liquidity, Focus List membership, and three- and six-month dividend-inclusive returns. Country means the exchange country, which need not coincide with the issuer's domicile. Liquidity measures typical daily dollar volume and is standardized. The sample contains no missing observations, but that statement does not by itself establish that the universe construction is free from selection bias.

The example gives the following comparison:

| Q1 2005 comparator | Return on short portfolio | AFL advantage |
|---|---:|---:|
| Random short portfolio drawn from the full universe, in expectation | -1.40% | about 9.04 percentage points |
| Reported portfolio matched on country, sector, liquidity | 4.78% | 2.86 percentage points |
| Assay Focus List short portfolio | 7.64% | reference |

The large change in measured excess performance comes from the composition of the benchmark. The overall universe rose 1.4%, whereas the average US stock fell 3.6%. Technology and Staples fell roughly 4.7% and 4.5%, respectively; together they account for more than two-thirds of the Focus List positions. A randomly selected global short portfolio therefore faced a materially different opportunity set. A large part of the apparent nine-point advantage disappears once the benchmark is given comparable exposures.

This does not imply that the Focus List has no useful information. The reported matched comparison still leaves 2.86 percentage points of favorable selection. It implies that a claim about selection must be conditional on what securities the research process covers. Assay does not cover every sector. The authors argue that the service should not receive credit merely because it avoided shorting Energy, a sector on which it made no prediction and which rose strongly in the quarter.

## 7. Matching as a portfolio construction problem

The note's implementation calls the R `portfolio` package's `matching` method, which uses `MatchIt`, with the covariates `country`, `sector`, and `liq`. It is a greedy matching example. The source does not specify a complete global assignment optimization with a proven optimal distance, so the assignment objective in the earlier overview is a mathematical way of organizing the problem, not a theorem about the package's algorithm.

To express the portfolio arithmetic correctly for shorts, let $h_i$ be a *signed* target position. For the equal-weighted short example, $h_i=-1/33$, so $\sum_i h_i=-1$. If security $m(i)$ is the selected control for security $i$, assign
$$
\widetilde h_j=\sum_{i:m(i)=j}h_i.
$$
Then
$$
R_T=\sum_i h_i r_i,\qquad
R_M=\sum_j\widetilde h_jr_j,
$$
and, for one-to-one matching,
$$
R_T-R_M=\sum_i h_i\bigl(r_i-r_{m(i)}\bigr).
$$
For a short portfolio, a more negative target-stock return creates a positive contribution to selection performance. The signed formula avoids the common error of subtracting long-stock returns while interpreting the result as short-strategy P&L. These returns are exposures times underlying security returns; the source does not supply a complete financing, collateral, dividend-payment, or borrow-cost accounting model.

Copying the target position sizes onto controls is useful for unequal-weighted portfolios: otherwise one would confound name selection with concentration. But it also makes matching quality most consequential for the largest target positions. If controls may be reused, their inherited weights must be aggregated and the resulting concentration inspected. A one-to-one restriction, replacement policy, and treatment of names without close controls are implementation choices that need to be specified; the broad benchmarking idea alone does not settle them.

### Balance is approximate, and must be measured

The reported matching portfolio contains no Focus List names. It also contains only US-traded securities, matching that aspect of the target. Sector and liquidity balance are close but not exact. The target's signed liquidity exposure is -0.54 and the matched portfolio's is -0.49. Technology exposure is -0.394 in both. The printed sector tables show other residual differences.

The note itself warns that changes in the package can cause inconsistencies in the displayed examples. Its prose description of the sector differences is not completely aligned with every printed exposure entry. A replication should treat the actual computed holdings and exposure table as the authoritative output, rather than use the narrative as a set of exact equality constraints.

For numerical covariates $z$, a useful diagnostic is the signed exposure difference
$$
\Delta_z=\sum_i h_i z_i-\sum_j\widetilde h_jz_j.
$$
For categorical covariates, compare the vector of portfolio exposure in every category. Beyond these means, check whether the distributions and extreme observations match; equal average liquidity can conceal very different liquidity tails. These diagnostics are practical extensions of the source's displayed checks, not additional empirical tests performed by its authors.

## 8. What the causal analogy does and does not justify

The conceptual inspiration is matching in observational studies: compare a selected group with a control group similar on observed characteristics. Here there is no randomized assignment of securities to the research list. Moreover, placement on a list is not a clean intervention analogous to a drug treatment. The authors acknowledge that prices may fall because of pre-existing company problems, customer trading after publication, or both. Their investment question is whether the list predicts negative future returns early enough to trade.

Consequently, the matched difference is descriptive evidence of selection performance conditional on the chosen covariates. It is not an identified causal effect of appearing on the list. Unobserved financial distress, valuation, momentum, accounting quality, beta, and other exposures can still explain a return difference. Which variables should be matched also depends on the evaluation objective. Matching away a variable that is itself the manager's intended signal changes the question from total signal performance to performance beyond that variable.

A benchmark should be specified from information available at formation. Selecting covariates, calipers, or distance weights after seeing which ones make performance look best would simply shift the data-mining problem into the benchmark. Similarly, using future liquidity or classifications would leak information into the control construction. These are requirements for a sound extension of the method; the brief example does not establish all of them empirically.

## 9. Distributional benchmarking and a reproducible research design

A single greedy match can be sensitive to ordering, tie breaks, or the particular eligible control set. Repeating the matching exercise can reveal that sensitivity. Let $R_M^{(b)}$ be the return on control portfolio $b$. Useful reports include the median and quantiles of $R_M^{(b)}$, the distribution of $R_T-R_M^{(b)}$, and the target's rank among the eligible controls.

However, the displayed source example has **one** matched portfolio. Its output saying the target beat “100% of matches” therefore means one out of one. It is not a Monte Carlo significance result. Even with many constructed matches, those portfolios are dependent because they draw from the same market and often reuse securities. A percentile under the matching generator is not automatically a frequentist p-value for manager skill.

A research-grade extension would freeze the eligible universe and covariates at each formation date; exclude the target names; construct matched controls with documented constraints; report balance and unavailable matches; preserve the target's signs and position sizes; then calculate dividends, financing and trading costs consistently for target and controls. Repeat across formation dates and report time-series uncertainty separately from the variation across matches at one date.

The method is most valuable when an index is visibly unlike the strategy being evaluated. It can test a fundamental short list, a sector-specialist portfolio, or a concentrated stock-selection process against an economically relevant opportunity set. It does not itself estimate expected returns, control portfolio covariance, or choose the optimal target portfolio. Its contribution is to make the counterfactual comparator explicit and auditable.
