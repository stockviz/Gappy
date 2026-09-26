# Multi-period Portfolio Selection with Drawdown Control

**Peter Nystrup, Stephen Boyd, Erik Lindström, and Henrik Madsen.** Published online 20 June 2018; *Annals of Operations Research* 282 (2019), 245–271. DOI: 10.1007/s10479-018-2947-3. [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/multiperiod_portfolio_drawdown_NystrumBoyd_2018.pdf>). All 27 pages, including forecasting equations, training choices, performance tables, and qualifications, are covered here.

## 1. The contribution and its boundaries

The paper combines three components: a convex model predictive control (MPC) portfolio optimizer, an adaptive hidden Markov model (HMM) for multi-step return forecasts, and a feedback rule that raises risk aversion as the portfolio approaches a drawdown limit. Each day it forecasts, plans several days of trades, executes the first trade, observes new information, and replans.

This is a tractable approximation to stochastic dynamic portfolio choice. It does not solve a full scenario-tree or Bellman problem, and it does not optimize maximum drawdown directly. The drawdown mechanism is reactive: it changes the variance penalty using realized wealth history. Convexity of each optimization problem is exact under the chosen costs and constraints; stochastic optimality and a hard drawdown guarantee are not.

The empirical result is that the combined strategy performs well on a broad liquid-asset-index universe over 1999–2016 after stated trading costs. At the main parameter setting, adding drawdown feedback to a leveraged long-only portfolio reduces maximum drawdown from about 19% to 10%, while retaining a Sharpe ratio near one. That evidence concerns the complete forecasting-and-control system, rather than identifying the incremental causal contribution of every component separately.

## 2. Portfolio variables, objective, and receding-horizon decisions

Let \(w_t\in\mathbb R^{n+1}\) contain current portfolio weights, including cash, with \(\mathbf1^Tw_t=1\). Negative risky weights are shorts, and a negative cash weight represents borrowing. Positive total wealth is assumed.

The ideal stochastic-control objective sums discounted expected returns, risk charges, and trading and holding costs. MPC substitutes forecast values for future unknown quantities and solves

\[
\max_{w_{t+1},\ldots,w_{t+H}}
\sum_{\tau=t+1}^{t+H}
\left[
\widehat\mu_{\tau|t}^Tw_\tau
-\gamma_\tau w_\tau^T\widehat\Sigma_{\tau|t}w_\tau
-\widehat\phi^{trade}_{\tau|t}(w_\tau-w_{\tau-1})
-\widehat\phi^{hold}_{\tau|t}(w_\tau)
\right],
\]

subject to the budget identity and chosen convex position or trading restrictions. The initial \(w_t\) is known, not optimized. Discounting is omitted over the short planning horizon in the implemented formulation.

Only \(w^*_{t+1}-w_t\) is executed. The remaining weights form a provisional plan conditional on the current forecast; they are recomputed the next day. This creates adaptation through repeated resolution, but the plan inside one solve does not contain future state-contingent recourse decisions. Future HMM parameter estimates are likewise held fixed at their current estimates while forecasting.

The planning horizon is different from the total investment horizon. The selected planning horizon is 15 trading days, while the evaluation spans 18 years. Its purpose is to anticipate how forecast persistence and trading costs affect a sequence of near-term positions, not to predict returns precisely decades ahead.

The optimization is expressed in normalized weights and cost penalties. A replication must additionally implement consistent realized wealth accounting, drifted pretrade weights, and cost deductions. A plan in which weights sum to one at every date is not, by itself, a complete exact dollar self-financing equation after nonlinear costs and realized returns.

## 3. Quadratic risk and the meaning of the multi-period approximation

The risk charge is

\[
\psi_\tau(w)=w^T\widehat\Sigma_{\tau|t}w.
\]

It penalizes forecast one-period variance. Under independence and an appropriate additive-return approximation, summing such terms resembles a mean–variance criterion over the horizon. In general, variance of a cumulative return includes cross-time covariance terms; compounded terminal wealth introduces further nonlinearities. Regime persistence can generate serial dependence even when observations are independent conditional on their states.

Thus the objective should be understood as a sum of local risk-adjusted performance measures, not an exact terminal-wealth mean–variance criterion for arbitrary adaptive strategies. The paper motivates this practical objective and cites broader MPC performance results; it does not derive an approximation-error bound for the particular adaptive HMM backtest.

Other convex risk penalties could be substituted, including expected shortfall with an appropriate scenario representation. The authors prefer variance here partly because tail estimates are noisy. Replacing variance by a different risk measure changes the estimation and optimization problem; coherence alone does not guarantee better out-of-sample downside performance.

## 4. Trading and holding costs as both economics and regularization

The general trading penalty is a weighted elastic-net expression,

\[
\phi^{trade}(z)=\kappa_1^T|z|+\kappa_2^Tz^{\circ2},
\]

where powers and absolute values are componentwise. The absolute-value term discourages frequent small trades and can create a no-trade region. The quadratic term penalizes large changes, can model temporary impact, and encourages splitting trades across dates. Both are convex for nonnegative penalty coefficients.

A short-borrow cost has the form

\[
\phi^{borrow}(w)=s^Tw^-,\qquad w^-_i=\max(-w_i,0).
\]

A nonzero cash-borrow coefficient represents a spread over the cash rate already included in asset returns, not a second charge of the full base rate. The generic holding regularizer is

\[
\phi^{hold}(w)=\rho_1^T|w|+\rho_2^Tw^{\circ2}.
\]

Quadratic holding penalties act like adding a diagonal covariance regularizer, scaled relative to risk aversion. Absolute holding penalties can correspond to worst-case mean uncertainty: for componentwise uncertainty \(|\delta\mu_i|\le\rho_{1i}\), the worst-case mean is \(\widehat\mu^Tw-\rho_1^T|w|\). These interpretations explain why optimization penalties can be larger than realized economic costs.

A qualification is useful for the sparsity discussion: with long-only fully invested weights and equal coefficients on every asset including cash, \(\|w\|_1=1\), so a uniform absolute holding penalty is constant and cannot induce sparsity. Sparsity effects require differing coefficients, exclusions such as cash, or a domain allowing short positions. The empirical implementation selects no absolute holding penalty.

Bounds include

\[
-w^{min}\le w_\tau\le w^{max},
\qquad\|(w_\tau)_{1:n}\|_1\le L_{max}.
\]

The gross-exposure constraint excludes cash. A leveraged long-only portfolio permits negative cash while keeping risky positions nonnegative; this differs from allowing short risky assets.

## 5. The exact drawdown feedback rule

Define the historical wealth peak and current relative drawdown as

\[
M_t=\max_{s\le t}V_s,\qquad D_t=1-V_t/M_t.
\]

The implemented rule is

\[
\boxed{\gamma_t=\gamma_0\frac{D_{max}}{\max(D_{max}-D_t,\varepsilon)}.}
\]

The numerator \(D_{max}\) is important: it makes \(\gamma_t=\gamma_0\) at zero drawdown, provided the small floor is inactive. The denominator is clipped by a maximum, rather than merely adding \(\varepsilon\) to the cushion. This corrects the formula in the earlier short summary.

Within one MPC solve, the current \(\gamma_t\) is used at every planned date. The algorithm does not forecast a separate future drawdown state and embed \(\gamma(D_\tau)\) into the optimization. Keeping the penalty fixed during a solve preserves its simple convex structure.

For example, with a 10% drawdown limit, risk aversion is twice its initial level at 5% realized drawdown, five times at 8%, and ten times at 9%, before denominator clipping. In a frictionless unconstrained stock–cash mean–variance problem, risky weights are proportional to \(1/\gamma\). This gives the heuristic connection to investing proportionally to the remaining drawdown cushion.

The rule is inspired by continuous-time drawdown insurance results and the distinction between a fixed wealth floor and a floor tied to the running high-water mark. The empirical controller has discrete trading, costs, estimation error, and finite numerical penalties, so the continuous-time theorem does not supply an almost-sure guarantee for this implementation.

Indeed, the paper explicitly reports small breaches for \(\gamma_0=1\). Its qualitative statements about preventing losses beyond a given limit must be read alongside that evidence. Gaps between trading dates can cross the limit before the controller reacts. Near the limit, the portfolio may become almost entirely cash and remain trapped, depending on the cash rate and recovery dynamics. A tighter limit combined with aggressive initial risk-taking increases that possibility.

## 6. HMM filtering and adaptive parameter estimation

Let hidden state \(s_t\) follow a first-order Markov chain with transition matrix \(\Gamma\), and let the state-conditioned observation distribution be multivariate Gaussian:

\[
o_t\mid s_t=i\sim N(\mu_i,\Sigma_i).
\]

The observations used for estimation are log returns. Conditional on states, observations follow the specified independent emission model; unconditional forecasts are mixtures, and need not be Gaussian. State duration is geometrically distributed under the fixed transition matrix.

The forward recursion is

\[
\alpha_t(j)=f_j(o_t)\sum_i\alpha_{t-1}(i)\Gamma_{ij},
\qquad
\xi_t(j)=\frac{\alpha_t(j)}{\sum_k\alpha_t(k)}.
\]

For long data sequences it should be implemented with scaling or log probabilities to avoid underflow. The filtered probability of a transition is

\[
\zeta_t(i,j)=
\frac{\alpha_{t-1}(i)\Gamma_{ij}f_j(o_t)}{\sum_k\alpha_t(k)}.
\]

The paper updates state-specific means, covariances, and transition probabilities online, using filtered state assignments and exponentially discounted sufficient statistics. It is an adaptive online estimation procedure, not repeated full-sample smoothing with future data.

With forgetting factor \(\lambda\), a generic statistic obeys

\[
S_t=\lambda S_{t-1}+(1-\lambda)s_t.
\]

The paper calls \(1/(1-\lambda)\) the effective memory length. This is a decay-horizon convention; it is not the usual independent-observation variance-equivalent effective sample size \((1+\lambda)/(1-\lambda)\) for normalized geometric weights. State-specific information is smaller still when a regime is infrequently visited.

For a faithful numerical implementation, maintain state occupancy, weighted raw first moments, and weighted raw second moments, then compute covariance as \(Q_i/N_i-\mu_i\mu_i^T\). The printed recursive covariance expression in equation (14) omits the old-mean-to-new-mean correction if interpreted literally as an exact update of its preceding weighted centered sum. Similarly, transition rows must be normalized using outgoing transition counts; the displayed occupancy denominator in equation (12) should be checked against that normalization. These algebraic checks matter independently of whether the authors' actual code uses a stable equivalent implementation.

## 7. Covariance shrinkage and multi-step forecasts

Regime-specific covariance matrices are shrunk toward an isotropic target,

\[
\widehat\Sigma_i^{shrink}
=(1-\nu_i)\widehat\Sigma_i
+\nu_i\frac{\operatorname{tr}(\widehat\Sigma_i)}nI_n.
\]

A rare regime has fewer effective observations and may need greater shrinkage. The target preserves average variance while reducing extreme eigenvalue dispersion. Forecast state probabilities are

\[
\widehat\xi_{t+h|t}^T=\widehat\xi_{t|t}^T\Gamma_t^h.
\]

Parameters are frozen during this forecast because no separate model of their future changes is specified. For an ergodic fixed transition matrix, probabilities and moments converge toward the stationary mixture as the forecast horizon increases; persistence determines the speed.

Log-return moments must first be converted within each regime to arithmetic-return moments:

\[
\mu_{s,i}^{arith}=\exp(\mu_{s,i}^{log}+\tfrac12\Sigma_{s,ii}^{log})-1,
\]

\[
\Sigma_{s,ij}^{arith}
=\exp\!\left(\mu_{s,i}^{log}+\mu_{s,j}^{log}
+\tfrac12\Sigma_{s,ii}^{log}+\tfrac12\Sigma_{s,jj}^{log}\right)
\left(e^{\Sigma_{s,ij}^{log}}-1\right).
\]

Then the forecast mixture mean and covariance are

\[
\widehat\mu=\sum_i\pi_i\mu_i,
\qquad
\widehat\Sigma=\sum_i\pi_i\Sigma_i
+\sum_i\pi_i(\mu_i-\widehat\mu)(\mu_i-\widehat\mu)^T.
\]

The between-regime mean term is required by the law of total variance. Averaging only conditional covariances understates mixture risk. Converting a mixture-averaged log mean to an arithmetic mean is also not equivalent to converting each state first.

## 8. Data, initialization, and hyperparameter selection

Training uses eight asset-class indices with 2,316 daily closing observations from 1990–1998. The first two years initialize estimation; the last seven train the hyperparameters. The out-of-sample data contain ten indices from 1997–2016, with 1997–1998 again serving as initialization and 1999–2016 as the 18-year performance test. Describing the full 20-year data span as 20 years of traded out-of-sample performance would be inaccurate.

The universe includes developed and emerging equities, listed real estate, developed and emerging high-yield bonds, oil, gold, corporate bonds, inflation-linked bonds, and government bonds. Training has fewer indices because some histories are unavailable. All index returns are in USD; specified government and inflation-linked series are hedged to USD. The risk-free rate is the daily equivalent of a one-month Treasury bill yield.

Nontrading days with zero changes in a majority of indices are removed. A few early high-yield months are filled from monthly prices using linear interpolation with Gaussian noise. The training universe and data processing therefore differ from a perfectly homogeneous set of directly investable daily instruments.

Initial HMM fitting to all asset indices produces rapid state changes and excessive turnover. The chosen model instead infers states from **developed and emerging equity indices only**, while estimating state-conditioned means and covariances for all assets. Two regimes are selected; three give no improvement and four are difficult to distinguish out of sample.

The chosen memory length is 130 days. Lengths below about 100 risk regimes receiving effectively no visits and probabilities failing to recover. Shrinkage is 0.2 for the frequently visited regime and 0.4 for the rarer one. The optimization choices are:

- Planning horizon: 15 days; 10 was too short in training, with little benefit beyond 15.
- Baseline risk aversion in training: \(\gamma_0=5\).
- Maximum risky-asset position: 40% of wealth.
- Linear trading penalty: 0.004 on risky assets, zero on cash.
- Quadratic trading penalty: zero, since it added delay without benefit under the assumed absence of realized impact.
- Quadratic holding regularizer: 0.0005 on all positions, including cash; absolute holding penalty: zero.

The **optimization trading penalty is 40 basis points**, while the **realized one-way trading cost deducted from performance is 10 basis points**. The difference is intentional regularization. The quadratic holding term is likewise not a realized fee. These distinctions are necessary to reproduce the objective and the reported net returns.

## 9. Main out-of-sample performance

Table 2 reports the following rounded annualized values at \(\gamma_0=5\):

| Strategy | Excess return | Excess risk | Sharpe | Max drawdown | Calmar | Annual turnover |
|---|---:|---:|---:|---:|---:|---:|
| Long-only MPC | 10% | 11% | 0.97 | 19% | 0.56 | 2.93 |
| Leveraged long-only MPC | 13% | 12% | 1.01 | 19% | 0.65 | 3.22 |
| Leveraged long-only, 10% drawdown limit | 11% | 11% | 1.00 | 10% | 1.07 | 3.24 |
| Long–short MPC | 12% | 12% | 1.01 | 23% | 0.54 | 6.75 |
| Fixed mix | 6% | 12% | 0.51 | 38% | 0.16 | 0.16 |
| Equal weight | 6% | 11% | 0.52 | 37% | 0.16 | 0.16 |

Ratios use the underlying unrounded statistics, so they should not be recomputed from rounded cells and expected to match exactly. Performance deducts 10 basis points per one-way risky-asset trade and the stated shorting fee, equal to the risk-free rate. Assets are assumed liquid enough to ignore market impact; there are no additional realized holding costs.

The fixed-mix comparator rebalances monthly to the average allocation of the long-only MPC portfolio over the full test period. That benchmark intentionally uses hindsight to match average exposures and isolate timing effects. It is not a feasible preannounced fixed allocation. Equal weighting also rebalances monthly, so update frequency is part of the comparison.

Long-only MPC earns 445 basis points more excess return than the fixed-mix benchmark using unrounded results. Drawdown control's main effect is evident in 2008, when the leveraged controlled portfolio moves completely into cash. Shorting risky assets roughly doubles turnover relative to the other dynamic strategies without a corresponding improvement in the reported Sharpe or Calmar ratios.

Reported excess risks are adjusted for autocorrelation instead of using simple square-root-of-time annualization. This materially changes some asset-class volatility numbers; for example, the emerging-equity series rises from about 20% to 28%, and developed high-yield risk from about 5% to 12%. A replication must use the same convention before comparing Sharpe ratios.

## 10. Drawdown experiments and what the frontiers establish

The paper examines \(\gamma_0\in\{1,3,5,10,15,25\}\) with several drawdown limits. Dynamic performance curves compare favorably with an ex-post optimized fixed-mix frontier under matching position restrictions. The fixed-mix frontier is called a no-regret frontier because it uses future returns in hindsight. Dynamic policies belong to a larger strategy class, however, so beating a hindsight *static* frontier is not equivalent to beating an omniscient dynamic strategy.

For the tested daily-trading settings, values \(\gamma_0\ge3\) control a 10% drawdown limit successfully, while the most aggressive \(\gamma_0=1\) cases can breach it slightly. This is a historical finding, not a sufficient condition for future pathwise safety. Combining leverage and feedback allows higher returns at similar realized maximum drawdown in this sample.

Weekly updates reduce turnover but worsen return, risk, and especially Calmar performance. The authors note that hyperparameters were trained for daily decisions, so this does not isolate a universal daily-versus-weekly benefit after retuning. Full weekly results are not printed in the article.

The framework can become almost entirely cash after losses. This lowers average risk-taking and often helps during persistent adverse regimes. It can also miss a sharp recovery or remain stuck near the limit. The attractive sample tradeoff depends in part on the persistence of the observed regime changes and the usefulness of the forecasts.

## 11. Computation, reproducibility, and limitations

For ten assets and a 15-day horizon, the authors report solve times below 0.02 seconds using CVXPY and ECOS on a standard Windows laptop of the period. This makes repeated historical hyperparameter searches feasible. It is a historical timing claim for a small problem, not a performance guarantee for arbitrary asset universes, scenario trees, or current hardware.

A replication should update filtered probabilities using only available observations; preserve stable regime identification; verify covariance positive semidefiniteness; calculate arithmetic mixture moments correctly; update the high-water mark after realized net wealth changes; and freeze current risk aversion within each planned path. Trading decisions require an explicit timestamp convention: using a closing observation to trade at that same close needs an implementable latency or auction assumption.

The study uses index returns rather than a full inventory of investable funds, futures contracts, funding haircuts, and market-impact schedules. Fixed-income indices benefited from falling rates during the evaluation period. Hyperparameters were selected from many choices in the earlier sample, and the live test universe adds assets absent from training. There is no broad statistical proof that the resulting performance advantage persists across other periods or forecast models.

The contribution is a concrete, fast control architecture with transparent costs and a simple drawdown response. Its convex subproblem is reliable within its stated assumptions, while realized drawdown containment and superior investment performance remain empirical properties of the entire adaptive strategy.
