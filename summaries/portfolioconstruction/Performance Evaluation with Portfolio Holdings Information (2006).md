# Performance Evaluation with Portfolio Holdings Information (2006)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioPerformance_Wermers2006.PDF>).

# 1. Metadata

- **Title:** Performance Evaluation with Portfolio Holdings Information
- **Author(s):** Russ Wermers
- **Year:** 2006
- **Journal/Venue:** *North American Journal of Economics and Finance*

# 2. Problem statement

The paper asks how portfolio holdings can improve manager evaluation: **can one use the actual security weights held by a manager to construct better performance measures and attributions than standard returns-based alpha, especially in the presence of Roll’s benchmark-choice problem?**

# 3. Approach (short)

The paper is a survey of holdings-based performance measurement. It reviews self-benchmarking covariance-style measures, dynamic benchmark construction from lagged holdings, characteristic-based benchmarks such as DGTW, and conditional extensions that strip out public-information effects. The common idea is to evaluate performance at the security-holdings level rather than only from aggregate fund returns.

# 4. Approach (detailed)

1. **Why returns-based alpha is problematic**

   Returns-based performance measures use regressions of fund returns on benchmark returns. Roll’s critique implies that rankings can change when the benchmark changes if the benchmark is not mean-variance efficient. This motivates a holdings-level alternative.

2. **Grinblatt-Titman logic**

   A holdings-based measure asks whether the manager overweights securities that subsequently outperform. In stylized form, if $w_{j,t-1}$ is the portfolio weight on stock $j$ and $R_{j,t}$ its realized return, then a covariance-style performance measure is based on
   $$
   \sum_j w_{j,t-1} R_{j,t},
   $$
   compared against a benchmark formed from expected or lagged weights rather than a fixed external index.

3. **Self-benchmarking**

   The Copeland-Mayers / Grinblatt-Titman approach forms a “homemade” dynamic benchmark from the manager’s own lagged holdings. The idea is that if weights are informative and the manager has skill, current holdings should forecast future returns better than stale or expected holdings do.

4. **Characteristic-based benchmarks**

   Daniel, Grinblatt, Titman, and Wermers (DGTW) match each held stock to a portfolio of stocks with similar characteristics (size, book-to-market, momentum). If stock $j$ has benchmark return $R_{j,t}^{bench}$, then the characteristic-selectivity measure aggregates
   $$
   \sum_j w_{j,t-1}\big(R_{j,t}-R_{j,t}^{bench}\big).
   $$
   This security-level benchmarking is more precise than comparing the whole fund to a broad market index.

5. **Decomposition**

   Holdings-based measures can be decomposed into:

   - characteristic selectivity;
   - style or timing components;
   - industry bets;
   - residual stock-picking skill.

   Because the decomposition is additive across securities or groups, it provides much richer attribution than a single regression alpha.

6. **Conditional extensions**

   Conditional holdings-based methods use instruments $Z_{t-1}$ to form conditional expected weights $E[w_{j,t-1}\mid Z_{t-1}]$. The residual
   $$
   w_{j,t-1} - E[w_{j,t-1}\mid Z_{t-1}]
   $$
   isolates active deviations from publicly predictable positions. This separates skill from mechanical exposure to conditioning information.

7. **What is actually proved**

   The paper is a survey, so its contribution is organizational rather than theorem-producing. The core logical claim is that holdings-based methods mitigate benchmark misspecification because they benchmark at the security level and can use evolving, manager-specific benchmark portfolios rather than a static index proxy.

# 5. Domain of applicability

- The methods apply to **active-manager performance measurement** when holdings data are available.
- They are especially useful for mutual funds and institutional equity portfolios with disclosed positions.
- Holdings-based measures still require benchmark design choices, especially for characteristic matching and expected weights; they do not eliminate all model dependence.
- The paper is broader than a single estimator and should be read as a survey map of the holdings-based literature.

## 6. The common statistical object is a summed time-series covariance

The survey appears in *North American Journal of Economics and Finance* 17 (2006), pp. 207–230, DOI 10.1016/j.najef.2006.01.001. Its central organizing identity is

$$
PHM=\sum_j\operatorname{Cov}(w_{j,t-1},R_{j,t}).
$$

This is a time-series covariance for each security, summed across the investable universe. It is not simply the portfolio return, nor a single cross-sectional covariance measured at one date. Different estimators center weights, returns, or both:

$$
\operatorname{Cov}(w,R)
=E[w(R-ER)]
=E[(w-Ew)R]
=E[(w-Ew)(R-ER)].
$$

These algebraically equivalent population expressions lead to different practical estimators because normal weights and normal returns must be estimated. They trade off data requirements, sampling error, and sensitivity to misspecified benchmarks. A manager's weight choices also reflect aggressiveness and constraints; an unscaled covariance measure does not isolate information precision independently of position size.

The original holdings-based studies computed hypothetical gross returns from disclosed positions and security closing prices. Regressing those returns on an index still inherits benchmark-choice problems. The later methods improve the benchmark itself by using holdings. This distinction prevents the overly broad conclusion that possession of holdings data automatically removes all benchmark dependence.

## 7. Grinblatt–Titman self-benchmarking in implementable form

With a lag of $k$ months, the GT period measure is

$$
GT_t=\sum_j(w_{j,t-1}-w_{j,t-k-1})R_{j,t}.
$$

It is the return on a zero-investment comparison: long the current portfolio and short the manager's historical portfolio, both evaluated over the same current return period. Positions not present at one date must be represented by zero weights rather than deleted from the comparison universe. A correct implementation must retain delisted securities and their returns where relevant.

The lag is economically meaningful. A short lag can subtract away continuing gains from a good position once that position has entered both the current and stale portfolios. A long lag retains more of that forecast horizon, but increases the possibility that the two portfolios differ in systematic risk or mandate. It also requires a longer history and excludes performance during the initial $k$ months. This can induce selection if short-lived managers are omitted.

The measure is less sensitive to a stable omitted risk exposure than a conventional index alpha, because differencing removes the common component. It is still biased if the manager systematically shifts into securities with temporarily higher expected returns or risk loadings. The survey therefore suggests regressing $GT_t$ on market, size, value, and momentum factors as a supplementary check. That reintroduces a factor specification, but now it controls the difference in exposures rather than the whole portfolio exposure.

A further distinction is between stale weights and a stale portfolio allowed to drift through intervening returns. The conditional extension uses buy-and-hold-adjusted historical weights. For a self-financing stale portfolio,

$$
w^{BH}_{j,t-1}=w_{j,t-k-1}
\prod_{\tau=t-k}^{t-1}\frac{1+R_{j,\tau}}{1+R^{BH}_{p,\tau}}.
$$

The denominator must refer to the benchmark portfolio being carried forward. This adjustment separates active trading from mechanical weight changes caused by different security returns.

## 8. DGTW benchmarking and the exact decomposition

The DGTW method creates 125 benchmark portfolios from sequential quintile sorts on size, book-to-market, and prior return. The source describes annual June formation, NYSE size breakpoints, book-to-market information dated to the previous December, and a past-return measure ending in May to avoid the immediate-month reversal effect. Returns on each matched portfolio are value weighted. These date conventions are part of the estimator and must be preserved to avoid look-ahead bias.

Let $b(j,t-1)$ denote the characteristic portfolio matched to security $j$ using the relevant information at the holdings date. With the equity holdings normalized to sum to one, define

$$
CS_t=\sum_j w_{j,t-1}
\left[R_{j,t}-R_{b(j,t-1),t}\right],
$$

$$
CT_t=\sum_j\left[
 w_{j,t-1}R_{b(j,t-1),t}
-w_{j,t-k-1}R_{b(j,t-k-1),t}\right],
$$

$$
AS_t=\sum_jw_{j,t-k-1}R_{b(j,t-k-1),t}.
$$

Adding the terms gives the accounting identity

$$
GR_t=CS_t+CT_t+AS_t=\sum_jw_{j,t-1}R_{j,t}.
$$

Selectivity measures return relative to current characteristic peers; timing measures changes in characteristic exposure; average style is the return attributable to the lagged characteristic allocation. Both the lagged weights and their lagged benchmark memberships matter. Reassigning old holdings to today's characteristic buckets changes the timing/style split.

Despite its name, the period-by-period AS component is not a constant unconditional expected style premium. It is a current return on a lagged style portfolio; time-series averaging subsequently summarizes it. The identity is exact for the constructed gross stockholdings return, not necessarily for the investor's reported net fund return, which includes costs, cash, other assets, and within-period trades not observed in the snapshots.

## 9. Attribution is richer, but the interpretation remains conditional

One can sum CS over an industry, the largest ten positions, or a mandate-relevant subset. Leaving the original weights unchanged measures that subset's contribution to total portfolio performance. Renormalizing the subset's weights to one measures its standalone characteristic-adjusted return. These answer different questions. The latter is not automatically the return the manager would have earned under a new mandate restricted to those securities, because incentives, constraints, capacity, and trading could all change.

Characteristic matching controls the chosen characteristics, not every possible source of compensation. The survey explicitly discusses omitted liquidity effects and the challenge of extending equity benchmarks to other markets. A characteristic premium may be interpreted as risk compensation or as a return pattern that can be obtained mechanically; the arithmetic alone does not settle that economic debate. Nor does lower correlation between two alpha measures prove that one is more precise.

The source also discusses dividing performance by turnover to reduce sensitivity to manager aggressiveness. Its printed equations 21–22 use the signed sum $\sum_j(w_{j,t-1}-w_{j,t-k-1})$ in the denominator. For two fully invested portfolios this sum is zero, so it is not a usable turnover measure. A practical turnover normalization needs a clearly specified positive measure, such as one-half the sum of absolute trade weights under a stated convention, with treatment of zero-turnover periods. Even then, scale adjustment does not universally remove heterogeneous manager risk preferences or transaction costs.

## 10. Conditional evaluation removes a specified public-information component

The Ferson–Khang extension uses the law of total covariance:

$$
\operatorname{Cov}(w,R)
=E[\operatorname{Cov}(w,R\mid Z)]
+\operatorname{Cov}(E[w\mid Z],E[R\mid Z]).
$$

The second term reflects allocation changes associated with returns predictable from the selected public instruments. The first measures remaining conditional covariance. The survey's example uses dividend yield, default spread, term spread, and the Treasury bill yield as candidate instruments. One first estimates conditional expected security returns, then relates active weight changes to the residual returns, using centered instruments in the second-stage estimation.

A simple example shows the scale of the distinction. If two sectors alternate conditional expected returns of 10% and 14%, and a manager changes weights between 30% and 70% using public macroeconomic information, a transition-year GT measure can be 1.6%. Averaged over the source's equally likely regime transitions, the unconditional measure is 0.8% annually even though no private information has been assumed. The conditional procedure is designed to remove this component if the instrument model captures it.

“Private skill” is therefore relative to the chosen information set and forecasting specification. Public information omitted from $Z$, nonlinear relationships, or estimation error can remain in the residual. Moreover, using public information well may still have economic value after costs; the investor must decide what service the fee is paying for. Conditional attribution separates components rather than proving that only one component deserves compensation.

## 11. Evidence reported in the survey

For 155 U.S. domestic equity funds surviving throughout 1975–1984, the cited GT study reports average annual performance of 0.37% with a three-month lag and 2.04% with a twelve-month lag, with t-statistics 1.47 and 3.16 respectively. The difference illustrates sensitivity to the holding-period benchmark. A later sample including surviving and nonsurviving funds over 1975–1994 gives about 1.7% annually with the one-year lag. These are gross holdings-based measures, not investor net alphas.

The survey reports a 1.6% annual difference in CS between the most and least industry-concentrated fund deciles in one study, interpreted as evidence of industry-specific expertise. That observation does not establish that forcing any fund to concentrate would improve its performance. Selection, skill, and portfolio choice are jointly involved.

Across U.S. funds with at least 24 monthly observations over the 1975–1994 dataset, CS has Pearson correlations of 0.57 with gross Carhart alpha and 0.36 with net Carhart alpha. Gross and net Carhart alpha correlate at 0.62. Thus the measures are related but not interchangeable, and costs plus non-equity holdings can materially change rankings. The conditional study of 60 pension managers over 1985–1994 finds positive unconditional performance for growth managers but insignificant conditional performance after its public-information adjustment.

## 12. Data and inference requirements

A reliable implementation aligns beginning-period holdings with subsequent total returns, handles corporate actions and delistings, uses information actually available for characteristic classification, and reconciles the reconstructed gross stock return with the reported net fund return. Sparse disclosures miss intra-period round trips and permit window dressing. Missing cash, derivatives, securities lending, or short positions can further distort the reconstructed portfolio.

Inference should recognize cross-security and time dependence. Many holdings provide more detail, but common shocks mean that the number of securities is not the number of independent observations of skill. The survey's approximate-independence intuition should not replace dependence-aware standard errors in an actual evaluation. Multiple subgroup attributions and repeated manager selection also create a multiple-comparison problem.

The source recommends DGTW where defensible characteristic benchmarks exist, GT as a check on benchmark design, and conditional FK adjustments when public-information timing matters. Where suitable characteristic controls are unavailable, GT and FK offer alternatives. The methods are complementary tools for explaining a manager's observed decisions; they mitigate benchmark problems while retaining explicit assumptions about normal weights, normal returns, timing, costs, and the information set.
