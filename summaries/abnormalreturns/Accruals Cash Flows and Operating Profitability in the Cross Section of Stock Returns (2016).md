# Accruals, Cash Flows, and Operating Profitability in the Cross Section of Stock Returns
**Authors:** Ray Ball, Joseph Gerakos, Juhani T. Linnainmaa, Valeri Nikolaev
**Year:** 2016
**Journal/Venue:** Journal of Financial Economics

## Problem statement

Prior work finds two large regularities:

- expected returns rise with profitability,
- expected returns fall with accruals.

This paper asks whether these are really two separate anomalies. The authors argue they are largely one thing: profitability measures that include accruals are noisy, and **cash-based operating profitability** is the cleaner state variable.

## Approach (short)

The paper compares three related measures:

1. operating profitability,
2. accruals,
3. cash-based operating profitability.

Operating profitability is defined from the income statement, while accruals are measured from the balance sheet:

$$
Accruals = \Delta ACT - \Delta CH - [\Delta LCT - \Delta DLC - \Delta TXP] - DP,
$$

all scaled by lagged total assets. Cash-based operating profitability strips accruals out of operating profitability. The paper uses annual June portfolio sorts, Fama-MacBeth regressions, factor-pricing tests, and mean-variance frontier comparisons.

## Approach (detailed)

### 1. Define the three accounting variables on the same scale

All variables are deflated by lagged total assets.

**Operating profitability** is:

$$
OP = REVT - COGS - XSGA - XINT,
$$

scaled by lagged assets.

**Accruals** in the main balance-sheet implementation follow Sloan:

$$
Accruals = \Delta ACT - \Delta CH - [\Delta LCT - \Delta DLC - \Delta TXP] - DP.
$$

The paper also checks cash-flow-statement versions post-1988.

**Cash-based operating profitability** is conceptually:

$$
CBOP = OP - Accruals,
$$

that is, profitability purged of accounting accrual adjustments.

### 2. Form annual portfolios and run stock-level regressions

The design follows the standard June rebalancing convention:

1. measure the accounting variables using the most recent annual reports;
2. sort firms into quantile portfolios at the end of June;
3. hold the portfolios for the next year.

The paper then estimates Fama-MacBeth cross-sectional regressions of monthly stock returns on lagged profitability, accruals, and cash-based profitability.

### 3. Show that cash-based profitability dominates accruals and accruals-based profitability

The main empirical result is that `CBOP` outperforms both:

- operating profitability that includes accruals,
- and accruals as a standalone predictor.

Once profitability is purged of accruals, the incremental predictive power of accruals largely disappears. This is the paper's decisive claim: the accrual anomaly is not a separate source of expected returns once the correct profitability measure is used.

### 4. Test the result in factor-pricing space

The authors then construct:

- an accruals factor,
- an operating-profitability factor,
- a cash-based operating-profitability factor.

They ask which factor best prices:

- size-accrual portfolios,
- and related test assets.

The answer is that the cash-based profitability factor prices both the operating-profitability factor and the accruals factor better than the reverse combinations do.

### 5. Compare investment opportunity sets

The paper also evaluates the incremental mean-variance contribution of adding the different factors to a standard investment opportunity set. The key conclusion is that augmenting the standard factor menu with the cash-based profitability factor produces a larger Sharpe-ratio gain than adding both accruals and accruals-contaminated operating profitability.

This is an important methodological step because it turns predictive regressions into portfolio-allocation significance.

### 6. Study signal longevity

The paper examines how far out the signals forecast returns. Cash-based operating profitability retains predictive ability for years, while accruals' standalone power is weaker once the profitability decomposition is respected.

That long-horizon evidence supports the authors' interpretation that investors are gradually learning about the cash-based component of profitability rather than separately mispricing accruals.

### 7. What a reader should implement

1. compute `OP`, `Accruals`, and `CBOP` from Compustat;
2. scale all by lagged total assets;
3. run annual June portfolio sorts;
4. estimate monthly Fama-MacBeth regressions;
5. construct the corresponding factors and compare their pricing power.

## Domain of applicability

- **Where it works well:** Equity universes with reliable accounting data.
- **What is implementable:** A cash-based profitability factor that replaces accruals-plus-profitability two-factor setups.
- **Main limitation:** The cash-based measure still depends on accounting line items and timing conventions.
- **Why the paper matters:** It unifies the accrual and profitability anomalies by showing that the clean profitability measure is the cash-based one.
