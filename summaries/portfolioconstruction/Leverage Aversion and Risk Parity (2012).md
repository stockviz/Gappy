# Leverage Aversion and Risk Parity

**Source:** [PortfolioLeverage_AsnessFrazziniPedersen_2012.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioLeverage_AsnessFrazziniPedersen_2012.pdf>)  
**Source coverage:** main argument, portfolio construction, Tables 1-3, and financing Appendix B of the published article.

## 1. Metadata

- **Title:** Leverage Aversion and Risk Parity
- **Author(s):** Clifford S. Asness, Andrea Frazzini, Lasse H. Pedersen
- **Year:** 2012
- **Journal/Venue:** *Financial Analysts Journal*

## 2. Problem statement

The paper asks whether **risk parity** can be justified as a rational equilibrium response to leverage constraints. More precisely: if some investors are leverage averse or leverage constrained, how do equilibrium expected returns differ from CAPM, and does that imply that low-risk assets should receive larger allocations than market-cap weighting would suggest?

## 3. Approach (short)

The paper synthesizes a constrained-equilibrium version of CAPM, associated with Black and with Frazzini-Pedersen’s betting-against-beta logic. In that equilibrium, leverage-constrained investors overpay for high-beta assets because they want high expected returns without borrowing, while unconstrained investors can lever low-beta assets. This flattens the security market line and raises the Sharpe ratios of safer assets. Risk parity, which equalizes risk allocation rather than capital allocation, becomes a natural portfolio response.

## 4. Approach (detailed)

1. **Standard CAPM benchmark**

   In the frictionless CAPM,
   $$
   E[R_i-r_f]=\beta_i E[R_M-r_f].
   $$
   All assets lie on the same security market line, and the tangency portfolio is the market portfolio. If leverage is freely available, investors can adjust risk simply by levering or delevering the tangency portfolio.

2. **Leverage aversion / constraint**

   The paper’s maintained economic mechanism is that many investors either cannot borrow freely or dislike leverage. Such investors still want higher expected returns, so they tilt toward high-beta assets instead of levering the low-beta/tangency portfolio.

   This demand pressure makes the security market line too flat relative to CAPM:

   - low-beta assets earn **higher** average returns than CAPM predicts;
   - high-beta assets earn **lower** average returns than CAPM predicts.

   In reduced-form language,
   $$
   E[R_i-r_f]=\alpha_i+\beta_i E[R_M-r_f],
   $$
   with $\alpha_i>0$ for low-beta assets and $\alpha_i<0$ for high-beta assets.

3. **Why this favors risk parity**

   Risk parity allocates capital so that each asset class contributes equally to total risk. The empirical paper uses inverse standalone volatility weights, which in the two-asset case equalize risk contributions even with nonzero correlation:
   $$
   w_i \propto \frac1{\sigma_i},
   $$
   A distinct full-covariance equal-risk-contribution formulation solves
   $$
   w_i(\Sigma w)_i = w_j(\Sigma w)_j
   \qquad \forall i,j.
   $$
   If safer assets have unusually high Sharpe ratios because the security market line is too flat, then overweighting them is efficient. A levered risk-parity portfolio can then outperform the market portfolio on a Sharpe-ratio basis.

4. **Market portfolio versus RP**

   In a two-asset stock/bond world, the market or a 60/40 portfolio allocates more capital to stocks because stocks have higher standalone expected returns. Risk parity allocates more capital to bonds because bonds contribute less risk per dollar. Under leverage aversion, this can be exactly the right move because bonds are the “underpriced” low-beta assets.

5. **Levered RP**

   Unlevered RP often has lower mean return than the market portfolio because it holds more low-volatility assets. The argument is not that unlevered RP always dominates. The argument is:

   - unlevered RP often has a higher Sharpe ratio;
   - if leverage is available to some investors, they should lever RP up to the desired risk level.

   That is the sense in which leverage aversion and risk parity fit together.

6. **Evidence**

   The paper compares:

   - the value-weighted market portfolio,
   - a 60/40 stock-bond portfolio,
   - unlevered and levered risk-parity portfolios

   across long, broad, and global samples. The empirical pattern is consistent with the theory: low-risk assets have stronger risk-adjusted performance than CAPM would predict, and RP benefits from leaning into that fact.

7. **What is proved and what is inherited**

   The formal equilibrium argument is mostly inherited from Black-style leverage-constrained CAPM and Frazzini-Pedersen’s theory. The paper itself is more of an integrative portfolio-construction note:

   - the equilibrium mechanism justifies why low-risk assets can be attractive;
   - RP is presented as a practical way to exploit that mechanism across asset classes.

   So the new contribution is less a new theorem than a portfolio-level synthesis.

8. **Limits of the argument**

   The paper is careful, implicitly if not formally, about two limits:

   - leverage is not free; financing and deleveraging risk matter;
   - risk parity is not implied by the theory with mathematical necessity, only suggested as a natural approximation to an allocation that tilts toward high-Sharpe low-beta assets.

**Additional mathematical details**

The equilibrium story can be summarized by a flattened security market line of the form
$$
E[R_i-r_f]=\psi + \beta_i \lambda,
\qquad \psi>0,
$$
or equivalently
$$
E[R_i-r_f]
=
\beta_i E[R_M-r_f] + \psi(1-\beta_i),
$$
where $\psi$ captures the shadow value of leverage constraints. Low-beta assets then earn positive intercepts relative to CAPM, and high-beta assets earn negative intercepts. This is the reduced-form pricing relation that links leverage aversion to the BAB/risk-parity logic.

Risk parity is not derived as the unique optimizer of that equilibrium, but it is directionally consistent with it because it increases exposure to the asset classes with the highest Sharpe ratios once the line is too flat. For comparison, the full-covariance ERC formulation solves
$$
w_i(\Sigma w)_i = w_j(\Sigma w)_j,
$$
and a levered RP portfolio can then approximate a tangency portfolio in the distorted opportunity set created by leverage-averse equilibrium demand.

## 5. Domain of applicability

- The argument applies when **leverage constraints or leverage aversion are important equilibrium frictions**.
- It is especially relevant for cross-asset allocation where asset classes have very different volatilities and betas.
- The paper does not prove that RP is universally optimal; it argues that RP moves in the direction favored by leverage-constrained equilibrium.
- If financing costs are high, correlations shift sharply, or the low-beta premium disappears, the justification weakens.


## 6. What leverage aversion explains, and what it leaves undetermined

This is *Financial Analysts Journal* 68(1), January/February 2012, pp. 47-59. The article supplies a portfolio interpretation and empirical tests of a theory developed more formally elsewhere. It does not derive a new equilibrium theorem that uniquely selects equal risk contributions. The authors explicitly describe parity as a simple move toward safer assets, rather than an exact estimate of the unknown tangency portfolio.

The distinction from standard mean-variance portfolio theory is essential. Mean-variance theory says that an investor with known moments and frictionless funding can choose a tangency risky portfolio and scale it. CAPM adds equilibrium assumptions under which that tangency portfolio must be the value-weighted market. Leverage aversion challenges the latter identification: investors seeking high expected return without borrowing increase demand for high-beta assets, lowering their expected compensation per unit of risk. Investors able to use leverage can take the opposite side by holding more low-beta assets.

A reduced-form illustration is
$$
E[R_i-r_f]=\beta_iE[R_M-r_f]+\psi(1-\beta_i),\qquad\psi>0.
$$
It gives positive CAPM alpha for $\beta_i<1$ and negative alpha for $\beta_i>1$. This is an explanatory representation of the constrained-equilibrium mechanism, not an equation newly estimated or proved in this practitioner article. Beta also differs from standalone volatility: a high-volatility commodity portfolio can have modest market beta because its correlation with equities is low.

Equal risk is itself a claim about relative expected returns. If stocks had a sufficiently high expected premium, an equity-dominated risk budget could be optimal. The authors' argument is that observed compensation for taking more equity risk has not justified the typical equity-heavy allocation. The theory offers a reason for that pattern to persist, but does not eliminate estimation error, time variation in constraints, or competing explanations of low-beta returns.

## 7. The portfolios actually tested

The empirical construction is inverse standalone volatility, using trailing three-year monthly excess returns. At each date,
$$
w_{i,t}=k_t/\widehat\sigma_{i,t}.
$$
The unlevered version chooses $k_t=(\sum_i\widehat\sigma_{i,t}^{-1})^{-1}$ so that weights sum to one. The levered version uses a constant scale coefficient $k$ calibrated so that full-sample realized volatility matches the chosen benchmark. Because $\widehat\sigma_{i,t}$ changes, a constant $k$ is not constant total leverage.

This construction intentionally avoids covariance estimation. In a two-asset long-only portfolio, inverse-volatility weights do equalize Euler risk contributions even when correlation is nonzero. In more than two assets, equal standalone risk exposures generally do not equalize total portfolio-risk contributions unless correlation structure has special symmetry. The broad-sample portfolio should therefore be described by its actual inverse-volatility rule rather than retroactively as the solution of a full-covariance ERC optimization.

The monthly inverse-volatility signals are based on past data. The full-sample choice of $k$, however, is a hindsight scaling convention for historical comparisons. It is not a complete point-in-time rule for an investor at the beginning of 1926. The authors report similar conclusions from conditional volatility matching but do not display all those tests. Normalized return/volatility evidence can still be informative, provided this distinction is explicit.

For cash securities funded at $r_b$,
$$
r_{L,t}-r_{f,t}
=L_t(r_{U,t}-r_{f,t})-(L_t-1)(r_{b,t}-r_{f,t}).
$$
For futures, financing is embedded in prices, so an appropriately measured futures excess-return series should not receive the same funding subtraction a second time. Margin liquidity, trading, and forced deleveraging remain separate implementation concerns.

## 8. Data coverage and reported evidence

Appendix A describes a long US stock/Treasury sample from January 1926 through June 2010, a broader stock/bond/credit/commodity sample from January 1973 through June 2010, and stock/bond samples for 11 developed countries over January 1986-June 2010. Stocks use value-weighted CRSP or MSCI proxies; government and credit aggregates use CRSP, Barclays, or JPMorgan series; commodities use the S&P GSCI. Commodity market weight is proxied with dollar production, and the 1989 weight is carried backward where earlier production data are unavailable. These details limit what is meant by the tested “market portfolio.”

The long-sample historical tangency mix is about 12% stocks and 88% bonds. The unlevered parity mix averages around 15% stocks and 85% bonds, while the value-weighted stock/Treasury proxy averages roughly 68% stocks. This large difference motivates the claim that parity approximates the historical tangency allocation better than a conventional equity-heavy portfolio; the tangency weights themselves are known only ex post.

Central Table 2 results are:

| Long US sample strategy | Annual excess return | Annual volatility | Sharpe |
|---|---:|---:|---:|
| Value-weighted stock/bond market | 3.84% | 15.08% | 0.25 |
| 60/40 | 4.65% | 11.68% | 0.40 |
| Unlevered parity | 2.20% | 4.25% | 0.52 |
| Levered parity | 7.99% | 15.08% | 0.53 |

The levered parity-minus-market return is 4.15 percentage points with t-statistic 2.95; its regression alpha is 5.50 points with t-statistic 4.30. In the broad sample, parity has Sharpe 0.61 versus 0.43 for the value-weighted benchmark. However, the raw return spread is 1.84 points with t-statistic **1.43**, while regression alpha is 3.03 points with t-statistic **2.52**. Thus the source's broad narrative should not be read as saying every excess-return spread is individually significant. The alpha and raw spread are different tests.

In the country comparison, parity has higher reported Sharpe than 60/40 in every country. Most individual-country return differences are not significant at 5%; Japan and the US are the displayed significant cases. Pooling the global portfolios gives a 2.35-point return difference with t-statistic 2.42; excluding the US gives 1.84 points with t-statistic 2.04. Cross-country evidence strengthens breadth, but these markets share global shocks and are not 11 independent historical experiments.

The article also draws on previously documented low-beta patterns *within* equity, Treasury, credit, and futures markets. This is additional consistency evidence for the mechanism, not new security-level estimates all produced in the article itself.

## 9. Funding robustness and how far the conclusion travels

Appendix B varies the funding/risk-free proxy among T-bills, repo, OIS, federal funds, and LIBOR. For the long-sample parity-minus-market comparison, the excess-return estimate falls from 4.15% under T-bills to 1.81% under LIBOR, with its t-statistic falling from 2.95 to 1.29. Regression alpha remains positive at 2.95% with t-statistic 2.31. In the broad sample, the LIBOR case has a 1.25% return spread with t-statistic 0.97 and alpha 2.27% with t-statistic 1.89. Positive estimated performance therefore survives, but conventional significance does not survive uniformly across measures and samples.

Where rate histories are unavailable, the appendix uses the T-bill rate plus an estimated average spread. This is a historical extrapolation, not an observed funding quote for each date. The main strategy comparisons also do not fully model turnover, investor-specific financing, liquidation under margin stress, or the cost of maintaining the allocation through a liquidity crisis. The authors acknowledge that deleveraging risk matters especially at high leverage.

Several interpretations remain possible. Leverage aversion is an economic explanation consistent with the pattern, but benchmarking incentives, delegated-management frictions, and other demand effects can also contribute. A regression alpha does not uniquely identify the structural source of the premium. The broad low-risk pattern can motivate diversification research without validating exact parity as the correct capital allocation for every investor.

For portfolio construction, separate three decisions: which low-risk exposures offer attractive expected compensation; how much correlation-aware diversification is available; and how much leverage can be maintained after realistic financing and stress costs. Test the chosen rule sequentially with a predetermined risk target, and report both gross and net performance. The article gives a reason to investigate leveraged safer-asset portfolios and substantial historical support for doing so. Its claims are strongest as a challenge to automatic equity concentration, with exact allocations and leverage left to the investor's opportunity set and constraints.
