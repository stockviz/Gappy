# Are Cash Flows Better Stock Return Predictors Than Profits?
**Authors:** Stephen R. Foerster, John Tsagarelis, Grant Wang
**Year:** 2016
**Journal/Venue:** Working paper

## Problem statement

The paper starts from a practical accounting complaint: most firms report operating cash flow using the **indirect method**, which nets together recurring operating cash generation and many less informative adjustments. If the point of valuation is to estimate the firm's ability to generate distributable cash, then a more disaggregated, direct-method-style cash flow statement may be more informative for expected returns than standard profit measures.

The paper asks whether investors can predict the cross section of stock returns better with carefully reconstructed cash-flow measures than with traditional accounting profitability ratios.

## Approach (short)

The authors reconstruct a standardized **direct cash flow template** from the income statement and indirect cash flow statement, isolate operating, financing, tax, and non-operating cash flows, subtract capex, and form several free-cash-flow measures:

$$
CFAFAT = C - Capex,\qquad CFAF = B - Capex,\qquad CFO = A - Capex.
$$

These are then scaled by total assets or market value of equity and used in monthly decile sorts on S&P 1500 nonfinancial stocks from October 1994 to December 2013. The paper compares their performance with gross profits, operating profits, standard indirect cash-flow measures, and earnings-based ratios using one-month-ahead portfolio returns, Fama-MacBeth regressions, and factor-model alphas.

## Approach (detailed)

### 1. Rebuild the cash flow statement into a direct-method template

The paper's methodological core is Table 1, which reconstructs a standardized cash flow statement:

**Operating activities**

- Sales
- `±` change in accounts receivable
- `±` change in deferred revenues
- `±` change in other cash inflows from operations

to obtain **cash inflows to the firm**.

Then subtract:

- cost of goods sold,
- selling, general and administrative expenses,
- `±` change in operating accounts payable,
- `±` change in inventories,

to obtain

$$
A = \text{Net Cash Flows from Operations}.
$$

Next remove financing items:

- interest expense,
- `±` other financing income/expense,

to obtain

$$
B = \text{Net Cash Flows from Operations After Financing Activities}.
$$

Then remove tax items:

- taxes from the income statement,
- `±` change in taxes payable,
- `±` change in deferred taxes,

to obtain

$$
C = \text{Net Cash Flows from Operations After Financing and Tax Activities}.
$$

Then adjust for non-operating items:

- discontinued operations / special charges,
- foreign exchange gains/losses,
- pension gains/losses/contributions,

to obtain

$$
D = \text{Net Cash Flows from Operations After Financing, Tax, and Extraordinary Activities}.
$$

Finally subtract capital expenditures:

$$
FCF = D - Capex.
$$

The paper's tradable measures are:

$$
CFAFAT = C - Capex,
$$

$$
CFAF = B - Capex,
$$

$$
CFO = A - Capex,
$$

and the benchmark indirect-method free-cash-flow measure

$$
CFIM \approx D - Capex.
$$

This is the paper's main contribution. It is not "cash flow beats earnings" in the abstract. It is that **which cash-flow template you use matters**.

### 2. Scale the measures into cross-sectional signals

Each cash-flow measure is scaled two ways:

- by total assets, e.g. `CFAFAT/TA`, `CFAF/TA`, `CFO/TA`;
- by market value of equity, e.g. `CFAFAT/MVE`, `CFAF/MVE`, `CFO/MVE`.

These are compared against:

- gross profits-to-assets,
- operating profits-to-assets,
- net income-to-assets,
- earnings-to-price style measures,
- standard indirect cash-flow measures such as `CFOIM` and `CFONM`.

Scaling by assets makes the measures comparable to profitability ratios. Scaling by market value turns them into yield measures.

### 3. Form monthly decile portfolios on the cash-flow ratios

The sample is S&P 1500 nonfinancial firms from October 1994 to December 2013. Each month:

1. compute the cash-flow measures from the most recent accounting information;
2. rank stocks into deciles;
3. compute one-month-ahead value-weighted returns for portfolios `P1` through `P10`;
4. study the `P10-P1` spread.

The highest cash-flow deciles strongly outperform the lowest deciles. The paper emphasizes that the spread exceeds 10% per year on a risk-adjusted basis for the best direct-method measures.

### 4. Compare direct-method signals with standard accounting signals

A key horse race is:

- direct-method free cash flow,
- indirect-method cash flow,
- gross profits,
- operating profits,
- and traditional earnings profitability.

The direct-method measures dominate because they better isolate recurring operating cash generation from financing, tax, and non-operating items. This is why the paper repeatedly distinguishes ordinary operating skill from temporary or non-recurring cash realizations.

### 5. Use Fama-MacBeth regressions to identify the informative components

The cross-sectional regressions forecast one-month-ahead stock returns using:

- `Gross Profit`,
- `Operating Profit`,
- `Net CF Ops`,
- `CFOIM`,
- `CFONM`,
- `Fin Act`,
- `Tax Act`,
- `Non-Op Act`,
- `Capex`,

all deflated by total assets, together with controls:

- `log(BVE/MVE)`,
- `log(ME)`,
- prior one-month return `r1,1`,
- prior twelve-month return skipping one month `r12,2`.

This is an important part of the methodology because it asks whether the prediction comes entirely from one scalar profitability ratio or whether distinct cash-flow subcomponents add independent information.

The answer is that the operating cash-flow components matter most, but **cash taxes** and **capital expenditures** also have incremental explanatory power.

### 6. Run factor regressions on the hedge portfolios

The paper estimates both Fama-French three-factor and five-factor regressions on the `P10-P1` portfolios:

$$
R^{spread}_t = \alpha + \beta_{MKT}MKT_t + \beta_{SMB}SMB_t + \beta_{HML}HML_t + \varepsilon_t,
$$

and then the five-factor extension including `RMW` and `CMA`.

The alphas remain strong. This matters because the paper's best signals are themselves profitability- and investment-related, so beating the five-factor model is a high bar.

### 7. Check sector neutrality

The paper also forms sector-neutral versions of the strategy by sorting within GICS sectors. This is a useful robustness check because raw cash-flow ratios can vary mechanically across sectors. The predictive ability survives that restriction, which supports the claim that the strategy is not just loading on sector composition.

### 8. What a reader should implement

A faithful implementation needs:

1. the direct cash flow template above;
2. direct-method proxies `A`, `B`, `C`, `D`;
3. free-cash-flow measures `CFAFAT`, `CFAF`, `CFO`, and `CFIM`;
4. scaling by assets or market value;
5. monthly decile sorts and `P10-P1` spreads;
6. Fama-MacBeth cross-sectional regressions with the stated controls;
7. FF3 and FF5 alpha estimation;
8. optional sector-neutral ranking.

The paper's practical message is that if the objective is return prediction, the accounting engineer's job matters: how you reconstruct cash flow can materially change the signal.

## Domain of applicability

- **Where it works well:** Equities with sufficiently rich financial statements to reconstruct direct-method cash-flow approximations.
- **What is implementable:** Monthly profitability/yield strategies based on direct-method free cash flow rather than reported earnings.
- **Main limitation:** The direct cash flow statement is reconstructed, not observed natively, so implementation quality depends on accounting-data coverage and consistent mapping of line items.
- **Why the paper matters:** It argues that return predictability improves when accounting measures are redesigned to isolate recurring cash-generation capacity rather than accepted as reported.
