# Do Investors Overvalue Firms with Bloated Balance Sheets?
**Authors:** David Hirshleifer, Kewei Hou, Siew Hong Teoh, Yinglei Zhang
**Year:** 2004
**Journal/Venue:** Journal of Accounting and Economics

## Problem statement

The paper asks whether investors focus too much on recent accounting profitability and too little on the balance-sheet buildup required to generate it. The central claim is that a large stock of **net operating assets** is a cumulative warning sign: it indicates that reported operating performance has run ahead of free cash flow for a long time, so current earnings are less informative than they appear.

This is stronger than Sloan's accrual story. Sloan focuses on the current flow component of earnings. Hirshleifer et al. argue that the entire **level** of net operating assets is the right state variable because it accumulates past accruals, past investment, and the use of financing in operating assets.

## Approach (short)

Using annual Compustat accounting data matched to monthly CRSP returns from 1964-2002, the paper constructs a balance-sheet variable,

$$
NOA_t=\frac{OA_t-OL_t}{TA_{t-1}},
$$

sorts firms on it, and studies subsequent returns for up to three years. It then runs Fama-MacBeth style cross-sectional regressions and a Mishkin-style forecasting/pricing system to test whether investors overweight the earnings implications of `NOA`.

The core result is that firms with high `NOA` earn strongly negative abnormal returns for several years, even after controlling for size, book-to-market, momentum, reversals, accruals, financing, and growth-related variables.

## Approach (detailed)

### 1. Build the balance-sheet signal from operating assets and operating liabilities

The paper defines scaled net operating assets as

$$
NOA_t=\frac{Operating\ Assets_t-Operating\ Liabilities_t}{Total\ Assets_{t-1}}.
$$

The operating-side components are measured as:

$$
Operating\ Assets_t = Total\ Assets_t - Cash_t,
$$

$$
Operating\ Liabilities_t = Total\ Assets_t - STD_t - LTD_t - MI_t - PS_t - CE_t,
$$

where `STD` is short-term debt, `LTD` long-term debt, `MI` minority interest, `PS` preferred stock, and `CE` common equity. The scaling by lagged total assets makes the variable comparable across firms and aligns it with return-on-assets style profitability measures.

The theoretical point is that `NOA` is not just an accounting stock. It is a cumulative summary of how much operating investment has been financed and retained on the balance sheet rather than realized in free cash flow.

### 2. Relate `NOA` to accruals, cash flow, and investment

The paper also measures current operating accruals as

$$
Accruals_t=
\frac{[(\Delta CA_t-\Delta Cash_t)-(\Delta CL_t-\Delta STD_t-\Delta TaxesPayable_t)-DepAmort_t]}{TA_{t-1}}.
$$

Cash flow is then

$$
CashFlow_t = Earnings_t - Accruals_t,
$$

with earnings measured as income from continuing operations scaled by lagged assets.

Methodologically, the paper's key move is to argue that the **latest accrual** is only one slice of the problem. A firm can have ordinary current accruals and still have a very large `NOA` because of many years of prior accrual buildup, capitalized expenditures, inventory accumulation, or financing that has been parked in operating assets. `NOA` is therefore meant to dominate one-period flow variables as a proxy for investors' cumulative overoptimism.

### 3. Match accounting information to future returns with a clean reporting lag

The empirical design follows the standard accounting-to-returns timing rule:

1. measure `NOA` and other accounting variables from the fiscal year ending in calendar year `t-1`;
2. assume the information is known by July of year `t`;
3. study returns from July of year `t` through June of year `t+1`, and then continue into years `t+2` and `t+3`.

The paper uses a large annual panel of CRSP/Compustat firms over 1964-2002. It checks both equal-weighted and value-weighted strategies and then moves to stock-level cross-sectional regressions.

### 4. Run portfolio sorts and characteristic-adjusted return tests

Firms are sorted into deciles by `NOA`. The implementation is straightforward:

1. rank firms on `NOA`;
2. form decile portfolios at the annual rebalancing date;
3. compute buy-and-hold returns and benchmark-adjusted returns over the next one, two, and three years.

The headline hedge portfolio is:

- long the lowest-`NOA` decile;
- short the highest-`NOA` decile.

The paper reports large and persistent spreads. The extreme-decile strategy produces economically large abnormal returns in each of the first three post-formation years, which is exactly what the cumulative-misperception story predicts: the market does not correct immediately because `NOA` is a slow-moving state variable.

### 5. Show that `NOA` subsumes simpler predictors rather than merely correlating with them

The paper then estimates cross-sectional return regressions in which future returns are explained by `NOA` together with:

- size,
- book-to-market,
- one-month reversal,
- twelve-month momentum,
- three-year reversal,
- current operating accruals,
- and other growth/financing controls.

This matters because `NOA` is mechanically related to several known anomalies:

- it embeds past accruals,
- it is related to net equity issuance and debt issuance,
- it correlates with investment intensity,
- and it tends to be high for firms with strong recent earnings.

The paper's claim is that even after these controls, `NOA` remains strongly negative. That is the formal reason the paper treats `NOA` as an independent anomaly variable rather than a relabeling of accruals or issuance.

### 6. Decompose `NOA` to show which balance-sheet channels matter

The paper does not stop at the aggregate variable. It also decomposes `NOA` into financing-side pieces such as:

- scaled equity,
- scaled debt,
- and negative cash.

The purpose of the decomposition is to distinguish two cases:

1. the firm raised capital and held it as cash;
2. the firm raised capital and turned it into operating assets.

Only the second case should forecast low future returns under the paper's theory, because only then does financing feed the balance-sheet overstatement of operating profitability. The empirical decomposition supports that interpretation.

### 7. Test whether the market overweights `NOA` in forecasting earnings

The most direct market-efficiency test is a Mishkin-style system:

$$
Earnings_{t+1}=g_0+g_1 Accruals_t+g_2 NOA_t+g_3 CashFlows_t+v_{t+1},
$$

$$
AR_{t+1}=b\left(Earnings_{t+1}-g_0-g_1^*Accruals_t-g_2^*NOA_t-g_3^*CashFlows_t\right)+\varepsilon_{t+1}.
$$

The first equation estimates the rational forecasting weights. The second asks what weights investors appear to use when pricing earnings-relevant information.

Market efficiency requires:

$$
g_1^*=g_1,\qquad g_2^*=g_2,\qquad g_3^*=g_3.
$$

The paper finds that investors place too positive a weight on `NOA` when forecasting future earnings, meaning:

$$
g_2^*>g_2.
$$

That is the cleanest formal statement of the mechanism. `NOA` predicts returns because investors overinterpret the earnings implications of balance-sheet bloating.

### 8. What a reader should implement

A faithful replication needs:

1. annual Compustat balance-sheet and income-statement data;
2. CRSP monthly returns;
3. the `NOA`, accrual, earnings, and cash-flow definitions above;
4. annual July rebalancing into `NOA` deciles;
5. characteristic-adjusted or factor-adjusted post-formation returns;
6. stock-level cross-sectional regressions with standard asset-pricing controls;
7. the two-equation Mishkin system to test whether the market misweights `NOA`.

The distinctive contribution of the paper is that the predictor is a **stock variable** summarizing cumulative accounting history, not a one-period earnings-flow variable.

## Domain of applicability

- **Where it works well:** Public equity universes with reliable annual accounting data and enough history to form lagged balance-sheet measures.
- **What is implementable:** An annual long-short signal on `NOA`, plus a decomposition into financing and cash-retention components.
- **Main limitation:** `NOA` is reduced form. It captures cumulative accruals, investment, and financing jointly, so mechanism tests require auxiliary decompositions like the Mishkin system.
- **Why the paper matters:** It shows that the level of the balance sheet can be a stronger return predictor than current-period accruals because it better measures the cumulative gap between reported profitability and cash generation.
