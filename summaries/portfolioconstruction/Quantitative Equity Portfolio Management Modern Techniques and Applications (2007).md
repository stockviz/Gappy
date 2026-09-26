# Quantitative Equity Portfolio Management Modern Techniques and Applications (2007)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/EquityPortfolioManagement_QianHuaSorensen_2007.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

## 1. Metadata

- **Title:** Quantitative Equity Portfolio Management: Modern Techniques and Applications
- **Author(s):** Edward E. Qian, Ronald H. Hua, and Eric H. Sorensen
- **Year:** 2007
- **Journal/Venue:** Book, Chapman & Hall/CRC Financial Mathematics Series

## 2. Problem statement

This is a book-length treatment of the *quantitative* long-only/long-short equity process, in contrast to textbooks that stop at mean-variance optimization. Its governing question is: given that an equity manager is evaluated on multiperiod IR against a benchmark, how should one build, diagnose, combine, and implement alpha factors under realistic risk models, turnover constraints, long-only constraints, and linear/quadratic transaction costs? The unifying object is the **information ratio in a multiperiod setting**, not the single-period mean-variance frontier.

The book's specific technical contributions relative to the prior state of the art (Grinold-Kahn 2000):

1. Replace the "raw IC" with a **risk-adjusted IC** consistent with a BARRA-style multifactor optimizer.
2. Distinguish **strategy risk** $\operatorname{std}(IC_t)$ from risk-model tracking error and show the former typically dominates.
3. Derive a multiperiod IR $\approx \overline{IC}/\operatorname{std}(IC)$, closed-form optimal multifactor weights that maximize it, and the correct way to fold in lagged forecasts for turnover-constrained alpha.
4. Close the loop with portfolio optimization under long-only and transaction-cost constraints.

## 3. Approach (short)

The methodology is a sequence of linked regression/optimization decompositions. Portfolio excess return is written as a cross-sectional correlation identity (IC $\times$ dispersions). Mean-variance optimization under factor neutrality gives closed-form active weights whose multiperiod statistics reduce to time-series moments of the IC. These results feed a multifactor alpha optimizer (maximize IR subject to IC covariance structure), then a turnover-constrained alpha optimizer (maximize IR subject to forecast autocorrelation), and finally a portfolio optimizer with linear and quadratic transaction costs (reformulated as QP over buy/sell decompositions).

## 4. Approach (detailed)

### 4.1 Single-period excess return as a correlation identity

Active weights $\mathbf{w}$ and subsequent returns $\mathbf{r}$ satisfy $\mathbf{w}^\top \mathbf{1}=0$ for a dollar-neutral long-short or benchmark-relative portfolio. Then

$$\alpha_t=\mathbf{w}^\top\mathbf{r}=\mathbf{w}^\top(\mathbf{r}-\bar r\mathbf{1})=(N-1)\,\mathrm{corr}(\mathbf{w},\mathbf{r})\,\mathrm{dis}(\mathbf{w})\,\mathrm{dis}(\mathbf{r}),$$

where $\mathrm{dis}$ is cross-sectional dispersion. If one *assumed* $\mathbf{w}\propto \mathbf{f}$ (proportional to the forecast), this would collapse to

$$\alpha_t=c(N-1)\,IC_t\,\mathrm{dis}(\mathbf{f})\,\mathrm{dis}(\mathbf{r}),\qquad IC_t=\mathrm{corr}(\mathbf{f},\mathbf{r}).$$

This is the "raw IC" of Grinold. The authors argue it is misleading because naive proportional weights are mean-variance optimal only if the risk model is a scalar diagonal - i.e., no systematic factors and equal specific risk.

### 4.2 Risk-adjusted IC

Replace the heuristic weight with the solution to the constrained MV optimization

$$\max_{\mathbf{w}} \; \mathbf{f}^\top \mathbf{w}-\tfrac{1}{2}\lambda\,\mathbf{w}^\top\Sigma\mathbf{w} \quad \text{s.t.} \quad \mathbf{w}^\top\mathbf{1}=0,\; \mathbf{w}^\top \mathbf{B}=0,$$

with $\Sigma=\mathbf{B}\Sigma_I\mathbf{B}^\top+\mathbf{S}$ a factor-model covariance. Neutrality to all factor exposures $\mathbf{B}$ kills the systematic term in the objective and the Lagrangian KKT conditions yield the stock-level active weight

$$w_i=\lambda^{-1}\,\frac{f_i-\mu_0-\mu_1\beta_{1i}-\cdots-\mu_K\beta_{Ki}}{\sigma_i^2},$$

where $\{\mu_k\}$ are the Lagrange multipliers solving a $(K+1)$-dim linear system in the inner products $\langle \mathbf{x},\mathbf{y}\rangle=\sum_i x_i y_i/\sigma_i^2$. Define risk-adjusted forecast and return

$$F_i=\frac{f_i-\mu_0-\sum_k\mu_k\beta_{ki}}{\sigma_i},\qquad R_i=\frac{r_i-m_0-\sum_k m_k\beta_{ki}}{\sigma_i},$$

where the return-factor component drops out under neutrality and the intercept is chosen so that the standardized return vector has zero cross-sectional mean, as required by the correlation identity. Then

$$\alpha_t=\lambda^{-1}\sum_i F_i R_i=(N-1)\lambda^{-1}\,\mathrm{corr}(F_t,R_t)\,\mathrm{dis}(F_t)\,\mathrm{dis}(R_t).$$

The correlation term $IC_t^{RA}=\mathrm{corr}(F_t,R_t)$ is the **risk-adjusted IC**. It can differ in sign and magnitude from the raw IC; in practice it is the relevant statistic for any factor-neutral portfolio. Calibrate $\lambda$ to the target risk using $\lambda=\|F_t\|_2/\sigma_{\text{model}}$; the book approximates this by $\sqrt{N-1}\,\mathrm{dis}(F_t)/\sigma_{\text{model}}$ when the mean of $F_t$ is negligible.

### 4.3 Multiperiod IR and strategy risk

Assuming $\mathrm{dis}(R_t)$ is near-constant (empirically $\approx 1$ with low coefficient of variation), excess return per period is approximately $\alpha_t\approx \sqrt{N-1}\,\sigma_{\text{model}}\,IC_t$. At the common observation horizon (annualization requires an additional horizon factor):

$$\overline{\alpha}\approx \sqrt{N}\,\sigma_{\text{model}}\,\overline{IC},\qquad \mathrm{std}(\alpha_t)\approx \sqrt{N}\,\sigma_{\text{model}}\,\mathrm{std}(IC_t),$$

so

$$\boxed{\;IR\approx\frac{\overline{IC}}{\mathrm{std}(IC_t)}.\;}$$

This is the paper's core correction of the single-period FLAM $IR=IC\sqrt{N}$. The denominator $\mathrm{std}(IC_t)$ the authors call **strategy risk**; it decomposes as $\mathrm{std}(IC_t)^2 = 1/N + \sigma^2(IC_t)$ (sampling error plus true variation). Empirically on 60 equity factors over 1987-2003, the tested factor portfolios generally realize risk above their common risk-model target; this is a result for that experiment, not a universal 50% bias in commercial risk models. Including a correlation correction between IC and dispersion gives the refined approximation

$$IR=\frac{\overline{IC}}{\mathrm{std}(IC_t)}+\rho[IC_t,\mathrm{dis}(R_t)]\,\frac{\mathrm{std}[\mathrm{dis}(R_t)]}{\overline{\mathrm{dis}(R_t)}}.$$

### 4.4 Multifactor alpha models: optimal IR weights

Let $F_c=\sum_i v_i F_i$ be a composite of $M$ factor scores, all standardized so $\mathrm{dis}(F_i)=1$, with cross-sectional correlation matrix $\Phi$ (assumed time-invariant). Then $\mathrm{dis}(F_c)=\tau=\sqrt{\mathbf{v}^\top\Phi\mathbf{v}}$, so the composite IC is

$$IC_{c,t}=\frac{1}{\tau}\sum_i v_i\,IC_{i,t}.$$

Let $\overline{\mathbf{IC}}$ be the mean IC vector and $\Sigma_{IC}$ its time-series covariance. The multiperiod IR becomes

$$IR_c=\frac{\overline{IC}_c}{\mathrm{std}(IC_{c,t})}=\frac{\mathbf{v}^\top\overline{\mathbf{IC}}}{\sqrt{\mathbf{v}^\top \Sigma_{IC}\,\mathbf{v}}}.$$

This is scale-invariant, so the maximizer is determined up to normalization. Since $\tau$ (factor-score dispersion) cancels in the ratio, $\Phi$ does **not** enter the optimal-weight problem directly:

$$\mathbf{v}^*\propto \Sigma_{IC}^{-1}\overline{\mathbf{IC}}.$$

Compare with naive Grinold-Kahn weighting $\mathbf{v}\propto \Phi^{-1}\overline{\mathbf{IC}}$. The correct object is the **IC covariance**, not the factor-score covariance. These coincide only under restrictive conditions. The authors also develop an orthogonalization variant: Gram-Schmidt or Cholesky on $\Phi$ produces uncorrelated composite factors with closed-form IR, and derive an equivalence with Fama-MacBeth regression coefficients.

### 4.5 Turnover and lagged forecasts

Forecast-induced turnover for a factor with serial autocorrelation $\rho_f$ is proportional to $\sqrt{2(1-\rho_f)}$. Adding a *lagged* forecast $F_{t-1}$ to the current $F_t$ raises the composite autocorrelation at the cost of a lower average IC, provided lagged ICs are nonzero. Formally, the composite $F_c=\sum_{k,i}v_{ki}F_{i,t-k}$ has autocorrelation

$$\rho_{f_c}=\frac{\mathbf{v}^\top D\,\mathbf{v}}{\mathbf{v}^\top C\,\mathbf{v}},$$

for shift matrices $C$, $D$ built from factor autocorrelations. The turnover-constrained optimization is

$$\max_{\mathbf{v}} \; \frac{\mathbf{v}^\top\overline{\mathbf{IC}}}{\sqrt{\mathbf{v}^\top\Sigma_{IC}\,\mathbf{v}}}\quad\text{s.t.}\quad \frac{\mathbf{v}^\top D\,\mathbf{v}}{\mathbf{v}^\top C\,\mathbf{v}}=\rho^*.$$

No analytic solution because of the quadratic ratio constraint; solved numerically. **Economic content:** value factors (low IC, high autocorrelation) deserve more weight on lags than momentum factors (high IC, fast decay) when the turnover constraint binds. The authors' "horizon IC" formalism shows that for rebalancing horizon $h$, the effective IC divided by $\sqrt{h}$ declines roughly linearly, while turnover declines faster; there is an interior optimum.

### 4.6 Advanced alpha modeling

- **Contextual models.** Rather than fitting one alpha model to the universe, segment on economic context (distress, liquidity, etc.) and fit separate models; the composite dominates unsegmented models in-sample and out-of-sample on the Russell 3000 data.
- **Nonlinear effects.** Use piecewise-linear or rank transformations where factor payoffs saturate (quality) or reverse (extreme value).
- **Factor timing.** Document significant calendar effects (January, earnings season) and market-state effects (up/down) on factor ICs; use as conditioning variables while watching for overfit.

### 4.7 Long-only constraints

Active weight distribution $w_i\sim \mathcal N(0, s_i^2)$ with $s_i=\sigma_{\text{target}}/(\sqrt{N}\sigma_i)$. For a stock with benchmark weight $b_i$, total weight $W_i\sim\mathcal N(b_i,s_i^2)$. The long-only constraint $W_i\ge 0$ binds with probability $\Phi(-b_i/s_i)$. Expected average short position (truncated normal):

$$E[W_i\mathbf1_{\{W_i<0\}}]=-\frac{s_i}{\sqrt{2\pi}}\exp\!\left(-\frac{b_i^2}{2s_i^2}\right)+b_i\,\Phi(-b_i/s_i).$$

Aggregating over a simulated benchmark (lognormal-scaled weights with concentration parameter $c$, per Grinold-Kahn) gives the portfolio's average long/short ratio as a function of tracking error and index concentration. Results consistent with Clarke-Silva-Thorley: at 3% TE on S&P 500, the long-only constraint costs ~20-30% of IR; at 5% TE, the implicit leverage of an unconstrained optimal portfolio is ~160%.

### 4.8 Transaction costs

**Linear cost, single asset.** Utility $U(w)=f w-\tfrac{1}{2}\lambda\sigma^2 w^2-\theta|w-w_0|$ gives a no-trade band: buy only if $\Delta w>w_c$ (where $w_c=\theta/(\lambda\sigma^2)$), sell only if $\Delta w<-w_c$, else no trade. Equivalent formulation: **adjust the forecast** by $\mp\theta$ depending on trade direction, and trade to the adjusted frictionless optimum.

**Quadratic cost, multi-asset.** With cost matrix $\psi$ (often diagonal with market-impact scaling),

$$\max_{\mathbf{w}} \; \mathbf{f}^\top\mathbf{w}-\tfrac{1}{2}\lambda\mathbf{w}^\top\Sigma\mathbf{w}-(\mathbf{w}-\mathbf{w}_0)^\top\psi(\mathbf{w}-\mathbf{w}_0)$$

has closed form

$$\mathbf{w}^*=(\lambda\Sigma+2\psi)^{-1}(\mathbf{f}+2\psi\mathbf{w}_0).$$

Iterating gives the portfolio dynamics

$$\mathbf{w}_t=(\lambda\Sigma+2\psi)^{-1}\mathbf{f}_t+A\mathbf{w}_{t-1},\qquad A=(\lambda\Sigma+2\psi)^{-1}(2\psi),$$

so $\mathbf{w}_t=\sum_{k\ge 0}A^k(\lambda\Sigma+2\psi)^{-1}\mathbf{f}_{t-k}$. Under fixed matrices and a stable recurrence, the current portfolio is a matrix-weighted history of past cost-adjusted forecasts - a smoothing rule for this repeated one-period problem. Equivalence to a fully forward-looking dynamic optimum requires additional assumptions.

**Linear cost, multi-asset.** Reformulate as QP: introduce nonnegative buy vector $\mathbf{w}_B\ge 0$ and sell vector $\mathbf{w}_S\ge 0$ with $\mathbf{w}=\mathbf{w}_0+\mathbf{w}_B-\mathbf{w}_S$, $|\mathbf{w}-\mathbf{w}_0|=\mathbf{w}_B+\mathbf{w}_S$, exploiting the fact that at optimum $w_{B,i}w_{S,i}=0$ (can't simultaneously buy and sell). Stack $\mathbf{W}=[\mathbf{w}_B;\mathbf{w}_S]$ and solve a standard QP in $2N$ variables. Extensions: piecewise-linear impact (brackets for size), short-sale constraints, turnover caps.

## 5. Domain of applicability

The framework assumes:

1. A multifactor risk model (BARRA-style or APT) whose exposures $\mathbf{B}$ and specific risks $\sigma_i$ are reasonable; the book acknowledges these are systematically optimistic on tracking-error.
2. Stationarity of IC moments $(\overline{IC},\Sigma_{IC})$ over the estimation window. Explicit regime-dependent extensions exist (contextual and factor-timing chapters) but require the regimes to be identifiable ex-ante.
3. Stocks are liquid enough that a linear or quadratic cost model is adequate. Market impact nonlinearities beyond quadratic are not treated analytically.
4. Cross-sectional normality of forecasts, used in the long-only derivations; heavy tails bias the closed-form L/S ratios.

Where it applies well: large institutional equity mandates (US/global large/mid-cap) with 100-3000 names, 3-10% tracking error, benchmark-relative mandates, quant long-short. Also directly transferable to statistical-arbitrage and 130/30 contexts.

Where it breaks: highly concentrated portfolios (where the correlation identity is dominated by a few positions); smallcap illiquid universes where the quadratic-cost QP is too optimistic about fills; regime-switching markets where $\Sigma_{IC}$ is nonstationary and the optimal multifactor weights $\mathbf{v}^*\propto\Sigma_{IC}^{-1}\overline{\mathbf{IC}}$ have the usual ill-conditioning of MV with estimated covariance; mandates where the objective is drawdown or CVaR rather than IR.

The book does not address: dynamic programming under fully stochastic returns (treated only through the implicit exponential-averaging in 4.8), robust-optimization uncertainty sets, or high-frequency execution. For those the reader needs Garleanu-Pedersen, Fabozzi-Kolm-Pachamanova, Almgren-Chriss, respectively.

## 6. A consistent projection view of risk-adjusted forecasting

The book's central diagnostic is derived from the portfolio one would actually hold under a specified risk model. Let $C=[e,B]$ collect the dollar and factor-neutrality constraints, and let $S$ be the diagonal specific-variance matrix. Under exact factor neutrality, systematic covariance drops out of the objective. The constrained solution can be written compactly as

$$
w=\lambda^{-1}S^{-1}\left[f-C(C'S^{-1}C)^{-1}C'S^{-1}f\right].
$$

This expression assumes the constraint columns are independent in the relevant metric; redundant factors should be removed or handled with an appropriate generalized solve. It exhibits the two adjustments to a raw forecast: remove the components forbidden by the mandate, then scale the remaining forecasts by specific variance. A raw IC may reward a beta or industry exposure that this portfolio is explicitly prevented from taking, explaining why raw and risk-adjusted rankings can differ.

The return decomposition must also be treated carefully. Subtracting any return component in the span of $C$ leaves $w'r$ unchanged because $C'w=0$. The chapter then chooses the residual-return intercept so that the standardized return vector has zero cross-sectional mean. That centering makes the correlation-times-dispersions identity exact. A generic unweighted OLS residual followed by division by heterogeneous specific volatilities does not necessarily have the required zero mean.

For the standardized forecast $F$, the exact specific-risk relation is $\sigma_{\rm model}=\|F\|_2/\lambda$. Replacing the norm by $\sqrt{N-1}\operatorname{dis}(F)$ assumes its cross-sectional mean is negligible. The book states this approximation explicitly. Similarly, replacing $N-1$ by $N$ is justified for large cross sections, not an exact identity for a three-stock example.

## 7. Strategy risk is about a sequence of changing portfolios

The distinction between target risk and realized active risk is not a claim that a commercial covariance model must underestimate the risk of every fixed portfolio. The source discusses buy-and-hold risk tests where forecast errors can go in either direction. Its contribution concerns portfolios repeatedly reconstructed from a strategy's signals: their long-run return variation depends on how signal efficacy itself changes over time.

With approximately constant opportunity dispersion and target risk,

$$
\alpha_t\approx \sqrt N\,\sigma_{\rm model}\,IC_t.
$$

Consequently, a strategy with highly variable IC can realize substantially more active risk than another strategy with the same risk-model target. The decomposition $\operatorname{Var}(IC_t)\approx1/N+\sigma^2_{\rm true\,IC}$ separates an approximate sampling component from variation in the underlying correlation, assuming those components are independent. It is not a universal variance identity for correlated stocks, dependent observations, or arbitrary IC estimators.

The ratio $\overline{IC}/\operatorname{sd}(IC)$ is measured at the IC observation horizon. Under independent nonoverlapping periods, annualizing a quarterly ratio multiplies it by $\sqrt4$, and annualizing a monthly ratio multiplies it by $\sqrt{12}$. If returns are autocorrelated or horizons overlap, a long-run variance calculation is needed instead. This unit convention is essential when comparing the book's periodic algebra with annualized empirical IRs.

The dispersion correction to IR is also approximate. The covariance between IC and opportunity dispersion is included in the expected return, while the denominator is approximated using the small variability of dispersion. It captures the intuition that skill is particularly valuable when the cross section offers large return differences; it should not be described as an exact formula for the ratio of two products of random variables.

## 8. The 60-factor experiment: what was observed

Chapter 4 evaluates 60 alpha factors in the Russell 3000 universe over 1987–2003, using quarterly observations and the BARRA US E3 risk model. Portfolios are reconstructed at each quarter's start and neutralized to 13 systematic and 55 industry factors. The target is 2.5% tracking error per quarter, equivalent to 5% annually under the stated scaling. Data availability and outlier exclusions reduce the available cross section below 3,000 stocks.

Despite the common target, reported annualized realized active risks average 7.7%, with a cross-strategy standard deviation of 1.7%; the range is 5.0% to 13.1%. Thus almost every tested strategy exceeds the target in this experiment, and many do so by 50% or more. This is a specific finding for these strategies and this construction process. It does not establish a fixed 50% bias for every risk model or portfolio.

The dispersion of risk-adjusted returns has mean 1.01 and standard deviation 0.15. The authors view this as evidence of internal consistency of the risk normalization, even though strategy active risk varies widely. That combination is the empirical point: a useful cross-sectional risk model and variable strategy efficacy can coexist. Later analysis relates in-sample to out-of-sample strategy risk; the reported scatter-plot regression has an $R^2$ of 52%, suggesting persistence but leaving substantial uncertainty.

## 9. Two covariance matrices answer different questions

The score correlation matrix $\Phi$ describes cross-sectional overlap among signals at a point in time. The time-series covariance $\Sigma_{IC}$ describes when their predictive successes and failures occur together. For a composite with approximately stable normalization, the ratio

$$
\frac{v'\overline{IC}}{\sqrt{v'\Sigma_{IC}v}}
$$

therefore controls multiperiod skill consistency. Its unconstrained tangency direction is $\Sigma_{IC}^{-1}\overline{IC}$, provided the matrix is nonsingular and the unconstrained optimum is admissible. Score correlations still matter for constructing and normalizing the composite, assessing redundancy, and modeling turnover; their cancellation from this particular ratio does not make them irrelevant to the full investment process.

This factor-combination problem inherits the estimation difficulties of portfolio optimization. A long list of similar factors can make $\Sigma_{IC}$ nearly singular. Small changes in estimated IC means can generate extreme positive and negative factor weights. Useful implementation checks include conditioning, stability across estimation windows, sensitivity to weight constraints, and the incremental performance of a factor after the existing set is included. A large in-sample optimized IR does not demonstrate that these estimated weights will be stable out of sample.

Lagged forecasts expand the factor universe in a structured way. They can lower turnover by smoothing the target, but their forecast value depends on the signal's decay and correlation with the current signal. Adding lags without estimating the associated lagged ICs and dependence can merely delay stale positions. The book's turnover-constrained factor optimization makes this trade-off explicit; it is separate from the subsequent security-level trading optimization.

## 10. Long-only geometry and a corrected truncated-normal expression

If a desired unconstrained total weight has distribution $W\sim N(b,s^2)$, the expected negative part is

$$
E[W\mathbf1_{\{W<0\}}]
=b\Phi(-b/s)-s\phi(b/s).
$$

This is an unconditional truncated moment. The conditional mean given a short position is instead

$$
E[W\mid W<0]
=b-s\frac{\phi(b/s)}{\Phi(-b/s)}.
$$

The first quantity, negated and summed over assets, is the natural input for expected aggregate short exposure. The existing short summary had labeled it as the second quantity. Keeping the distinction prevents understating the conditional size of a short position, especially when shorts are rare.

The Gaussian weight model is a stylized diagnostic of how benchmark concentration and risk targets make lower bounds bind. It is not the distribution of the constrained optimum. Once many lower bounds bind, the budget and factor conditions cause all remaining holdings to readjust. Thus clipping negative weights and renormalizing generally fails to reproduce a constrained quadratic program. The empirical cost of long-only restrictions depends on the benchmark, alpha distribution, risk target, and remaining constraints.

## 11. Trading formulas and their scope

For a single asset with linear cost, the no-trade band is an exact subgradient result for the stated one-period quadratic objective. For multiple assets, buy/sell auxiliary variables produce a convenient quadratic program. The equality $|w-w_0|=w_B+w_S$ holds at a cost-minimizing solution with strictly positive marginal trading charges; arbitrary feasible positive buy/sell vectors can include offsetting trades. With zero costs, complementarity need not be unique, so a solver output may require cleanup even though net holdings are correct.

Quadratic costs produce the linear recurrence displayed above only for the unconstrained problem with fixed covariance and cost matrices. If $A$ has spectral radius below one, repeated substitution yields the infinite weighted history after the initial condition decays. With changing matrices the weights become products of time-varying transition matrices. Position bounds, cash accounting, and factor constraints also modify the recurrence.

This myopic smoothing rule resembles some dynamic-trading policies, but it is not automatically the solution of a forward-looking stochastic-control problem. A dynamic optimum anticipates future signals, future costs, and future risk exposures. The book's formula is valuable as a transparent one-period implementation mechanism; its interpretation should stay tied to that objective.

## 12. Research and implementation lessons

The contextual and nonlinear modeling chapters ask whether a signal has the same meaning for every security and market condition. Cheapness can interact with quality, momentum, distress, and the peer group used for comparison. These are economically interpretable hypotheses, but segmenting the universe or timing factors creates additional estimation and selection risk. The resulting models should be evaluated using only information available before each holding period.

A practical research record should retain raw IC, risk-adjusted IC, IC volatility, opportunity dispersion, score autocorrelation, and forecast-horizon decay. The portfolio record should then retain target versus realized risk, constraint effects, gross exposure, turnover, costs, and realized attribution. These quantities connect signal research to the mandate and make it possible to identify whether a disappointing strategy failed in prediction, combination, risk control, or implementation.

This detailed expansion uses selected core chapters and examples from the 462-page book. Its numerical findings are historical illustrations, while the most portable contribution is the explicit connection between a realistic factor-neutral optimizer, the time variation of forecasting skill, and the costs of implementing a sequence of portfolios.
