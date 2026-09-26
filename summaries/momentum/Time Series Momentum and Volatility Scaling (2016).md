# Time Series Momentum and Volatility Scaling
**Authors:** Abby Y. Kim, Yiuman Tse, John K. Wald
**Year:** 2016
**Journal/Venue:** Journal of Financial Markets

## Problem statement

Moskowitz, Ooi, and Pedersen report large alphas for time-series momentum in futures, but they scale each contract to a common volatility target. This paper asks: **how much of those famous alphas come from the directional momentum signal itself, and how much come from volatility scaling, which is essentially a risk-parity style leverage rule?**

That distinction matters because it tells you whether TSMOM is a forecasting result or mostly an allocation result.

## Approach (short)

The paper reconstructs the MOP strategy and compares:

- volatility-scaled TSMOM,
- unscaled TSMOM,
- volatility-scaled buy-and-hold,
- unscaled buy-and-hold,
- and cross-sectional momentum,

on 55 futures contracts from 1984 to 2013. The MOP contract-level return is

$$
r_{t,t+1}^{TSMOM,s}
=
\operatorname{sign}(r_{t-12,t}^s)\frac{40\%}{\sigma_t^s}r_{t,t+1}^s,
$$

with ex ante volatility estimated from exponentially weighted daily returns. The paper shows that much of MOP's large alpha comes from the volatility-scaling rule itself; without scaling, TSMOM often looks similar to buy-and-hold.

## Approach (detailed)

### 1. Reconstruct the MOP volatility-scaling rule exactly

The authors do not criticize TSMOM abstractly. They rebuild the actual procedure used by Moskowitz, Ooi, and Pedersen.

Ex ante annualized volatility for contract `s` is estimated from daily returns using an exponentially weighted scheme:

$$
\sigma_t^2
=
261\sum_{i=0}^{\infty}(1-\delta)\delta^i (r_{t-1-i}-\bar r_t)^2,
$$

with `\delta` chosen so that the center of mass of the weights is 60 days.

That volatility estimate is then used to lever each contract to a 40% annual-volatility target.

### 2. Define the contract-level TSMOM return

For each contract `s`, the monthly return on the scaled TSMOM position is

$$
r_{t,t+1}^{TSMOM,s}
=
\operatorname{sign}(r_{t-12,t}^s)\frac{40\%}{\sigma_t^s}r_{t,t+1}^s.
$$

The diversified portfolio return is the equal-weighted average across contracts available at time `t`.

The paper's point is immediate: this return combines two ingredients:

- the sign forecast,
- the volatility-scaling or leverage rule.

### 3. Interpret the scaling as a risk-parity allocation

The paper explicitly frames the MOP rule as a form of risk parity:

- lower-volatility assets receive larger notional positions,
- higher-volatility assets receive smaller positions,
- and because most futures have volatility below 40%, many positions are levered up.

This is not a side detail. It is the paper's core reinterpretation of the MOP alpha.

### 4. Introduce the right benchmark: scaled buy-and-hold

If scaling alone improves alpha, then comparing scaled TSMOM only to an unscaled passive strategy is not informative. So the paper creates the natural counterfactual:

- take the same futures contracts,
- go long them without a trend sign,
- scale them by the same ex ante volatility rule.

This produces a **volatility-scaled buy-and-hold** benchmark.

That benchmark is methodologically essential. It isolates whether alpha comes from directional forecasting or from levering a low-volatility cross section.

### 5. Include unscaled TSMOM and unscaled buy-and-hold too

The full comparison set is:

- scaled TSMOM,
- unscaled TSMOM,
- scaled buy-and-hold,
- unscaled buy-and-hold.

Only with all four can one say whether scaling or the sign signal is doing the work.

### 6. Extend the comparison to cross-sectional momentum

MOP also argued that TSMOM beats cross-sectional momentum. Kim, Tse, and Wald note that many cross-sectional studies use standard equal weights rather than per-contract volatility scaling.

So they include:

- conventional XSMOM,
- and Barroso-Santa-Clara-style risk-managed cross-sectional momentum,

to show that part of the apparent TSMOM advantage is a weighting comparison rather than a pure signal comparison.

### 7. Use a broad futures sample and several levels of aggregation

The data consist of 55 futures contracts from January 1984 to December 2013 across four sectors:

- commodities,
- bonds,
- equity indexes,
- currencies.

The tests are run at several levels:

- individual contracts,
- sector portfolios,
- overall diversified portfolio,
- and leave-one-sector-out variants.

That matters because one could otherwise worry that bonds or another low-volatility sector are driving the result mechanically.

### 8. Evaluate alpha in a rich factor model

To avoid attributing passive risk exposures to alpha, the paper estimates alphas using a seven-factor model:

$$
r_t
=
\alpha
+
\beta_1 MSCI_t
+
\beta_2 GSCI_t
+
\beta_3 AGGR_t
+
\beta_4 DXY_t
+
\beta_5 SMB_t
+
\beta_6 HML_t
+
\beta_7 UMD_t
+
\varepsilon_t.
$$

This is stronger than simply comparing raw means, especially for buy-and-hold futures portfolios with obvious sector risk exposures.

### 9. Document the negative correlation between volatility and Sharpe ratios

Across contracts, lower-volatility futures tend to have higher Sharpe ratios. That empirical fact is crucial because inverse-volatility scaling will naturally overweight precisely those contracts.

So if low-volatility contracts happened to earn strong returns in the sample, scaling alone can create a large alpha even without any momentum forecast skill.

### 10. Compare scaled and unscaled results

This is where the paper's main result appears.

Without scaling:

- TSMOM alpha is much smaller,
- buy-and-hold alpha is similar,
- and the difference between the two is usually not statistically significant.

With scaling:

- both TSMOM and buy-and-hold alphas become much larger,
- and scaled buy-and-hold often looks surprisingly similar to scaled TSMOM.

So the famous MOP alpha is not purely a time-series-predictability result.

### 11. Repeat the analysis by sector

The authors run the same comparison within commodities, bonds, equities, and currencies. The key finding survives sector by sector:

- scaled TSMOM often has significant alpha,
- but scaled buy-and-hold frequently does too,
- and the difference is usually small.

This rules out the easy rebuttal that one specific sector is contaminating the portfolio result.

### 12. Study alternative volatility targets and cross-sectional scaling

The paper also varies the volatility target and compares the effect of scaling on XSMOM. This shows that changing the target leverage changes both TSMOM and buy-and-hold alphas in the same direction, again reinforcing the idea that scaling itself is a major part of the performance story.

### 13. Main conclusion

The paper does **not** say there is no time-series momentum. It says:

- unscaled TSMOM exists, but it is much weaker;
- the large alpha documented in MOP is driven importantly by volatility scaling;
- once one uses the right passive benchmark, much of the apparent superiority fades.

That is a narrower but very important claim.

### 14. What a reader should implement

A faithful implementation is:

1. estimate ex ante volatility from exponentially weighted daily returns;
2. compute both scaled and unscaled TSMOM returns;
3. compute both scaled and unscaled buy-and-hold returns on the same contracts;
4. compare them at contract, sector, and full-portfolio levels;
5. estimate alphas in a multifactor model rather than relying on raw mean returns alone;
6. only then decide how much performance belongs to the sign rule.

That benchmark discipline is the paper's main methodological contribution.

## Domain of applicability

- **Where it works well:** Futures-based trend-following studies where volatility scaling is part of the implementation.
- **What is implementable:** Side-by-side scaled and unscaled TSMOM, buy-and-hold, and XSMOM portfolios with factor-model alpha comparisons.
- **Main limitation:** The paper does not deny trend predictability; it mainly reallocates credit from the signal to the leverage rule, so readers still need to decide whether that distinction matters for their objective.
- **Why the paper matters:** It is the cleanest demonstration that a large fraction of "time-series momentum alpha" can be a volatility-scaling effect in disguise.
