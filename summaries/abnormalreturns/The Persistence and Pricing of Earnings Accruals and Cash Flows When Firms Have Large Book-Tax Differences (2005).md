# The Persistence and Pricing of Earnings, Accruals, and Cash Flows When Firms Have Large Book-Tax Differences
**Authors:** Michelle Hanlon
**Year:** 2005
**Journal/Venue:** The Accounting Review

## Problem statement

If book income and taxable income diverge sharply, that may reveal low-quality earnings. Large book-tax differences can arise from temporary timing items, aggressive accruals, tax planning, or special items. Hanlon asks two linked questions:

1. are current earnings, accruals, and cash flows **less persistent** for firms with large book-tax differences?
2. does the market correctly price that lower persistence?

The paper therefore extends Sloan's persistence-versus-pricing framework by conditioning it on book-tax differences.

## Approach (short)

The paper estimates future pretax earnings as a function of current pretax cash flows, pretax accruals, and indicators for firms with large positive or large negative book-tax differences. The main persistence regression takes the form

$$
PTBI_{t+1}=\gamma_0+\gamma_1LNBTD_t+\gamma_2LPBTD_t+\gamma_3PTCF_t+\gamma_4(PTCF_t\times LNBTD_t)+\gamma_5(PTCF_t\times LPBTD_t)+\gamma_6PTACC_t+\gamma_7(PTACC_t\times LNBTD_t)+\gamma_8(PTACC_t\times LPBTD_t)+\varepsilon_{t+1}.
$$

The paper then compares statistical persistence with market pricing, in the spirit of Mishkin/Sloan, and studies which components of large book-tax differences drive the weaker persistence. The main finding is that firms with large positive book-tax differences have materially less persistent earnings, and investors partially but not fully incorporate that information.

## Approach (detailed)

### 1. Measure book-tax differences as a signal about earnings quality

The basic quantity is:

$$
BTD_t = \text{Pretax Book Income}_t - \text{Estimated Taxable Income}_t.
$$

Estimated taxable income is inferred from tax-expense disclosures rather than directly observed tax returns. The paper then classifies firms into:

- `LPBTD`: firms with **large positive** book-tax differences,
- `LNBTD`: firms with **large negative** book-tax differences,

with the middle group serving as the omitted benchmark.

This grouping is important. The paper is not using book-tax differences as a continuous nuisance control. It is testing whether the extremes signal a regime change in persistence.

### 2. Decompose pretax book income into pretax cash flow and pretax accruals

The core accounting decomposition is:

$$
PTBI_t = PTCF_t + PTACC_t,
$$

where:

- `PTBI` is pretax book income,
- `PTCF` is pretax cash flow,
- `PTACC` is pretax accruals.

The point is the same as in Sloan, but now persistence can vary with the level and sign of `BTD`.

### 3. Estimate conditional persistence, not just average persistence

The main persistence regression is

$$
PTBI_{t+1}=\gamma_0+\gamma_1LNBTD_t+\gamma_2LPBTD_t+\gamma_3PTCF_t+\gamma_4(PTCF_t\times LNBTD_t)+\gamma_5(PTCF_t\times LPBTD_t)+\gamma_6PTACC_t+\gamma_7(PTACC_t\times LNBTD_t)+\gamma_8(PTACC_t\times LPBTD_t)+\varepsilon_{t+1}.
$$

This specification is methodologically important because it separates:

- the baseline persistence of pretax cash flow and pretax accruals,
- from the incremental change in persistence when book-tax differences are unusually large.

The prediction is that firms with large positive book-tax differences have lower persistence, especially in the accrual component.

### 4. Test whether the market prices that persistence correctly

The paper then uses a pricing test in the Mishkin/Sloan spirit. The idea is:

1. estimate the rational forecasting equation for next-period pretax earnings;
2. estimate a pricing equation in which abnormal returns depend on the gap between realized earnings and the earnings level implied by the market's implicit forecasting weights;
3. test whether the market-implied weights match the statistically optimal weights.

In notation, the pricing equation is conceptually of the form

$$
AR_{t+1}=b\left(PTBI_{t+1}-\widehat{E}^{\,market}_t[PTBI_{t+1}]\right)+u_{t+1},
$$

where `\widehat{E}^{market}` is formed from the market's implicit weights on `PTCF`, `PTACC`, and the `BTD` interactions.

If markets are efficient, the market-implied persistence parameters should equal the estimated persistence parameters from the forecasting equation. Hanlon's evidence implies that they do not line up cleanly for the large-book-tax-difference firms.

### 5. Focus on large positive book-tax differences

The most important empirical asymmetry is that **large positive** book-tax differences are the strongest warning sign. Intuitively, book income can look strong while taxable income looks much weaker, suggesting that reported profitability is partly supported by less persistent accrual or tax-accounting items.

The paper finds that:

- current earnings are less persistent for these firms;
- the lower persistence is due in part to the tax-difference component itself;
- and special items also contribute.

That last point matters because it shows the effect is not just one generic Sloan-style accrual problem. It is concentrated in a setting where accounting income and taxable income disagree sharply.

### 6. Use component analysis to identify what drives the weaker persistence

Hanlon goes beyond the aggregate `BTD` split and studies the sources of the difference. The evidence indicates that lower persistence among large-positive-`BTD` firms is partly attributable to:

- the tax-differential component of earnings,
- and special items.

Methodologically, this is what gives the paper teeth. If the effect only appeared in the aggregate regression, one could dismiss `BTD` as an omnibus proxy. By tracing the effect to specific components, the paper argues that large book-tax differences identify exactly the sort of accounting earnings that should be discounted more heavily.

### 7. The implementable design

A replication requires:

1. pretax book income, tax expense, and the data required to infer taxable income;
2. construction of `BTD_t`;
3. decomposition of pretax earnings into `PTCF_t` and `PTACC_t`;
4. classification into large positive and large negative `BTD` groups;
5. estimation of the conditional persistence regression above;
6. a pricing test comparing statistical persistence with market-implied persistence;
7. component analysis for the tax-differential and special-item channels.

The paper's core methodological idea is that persistence should be estimated **conditional on accounting disagreement between book and tax systems**, not only at the unconditional firm level.

## Domain of applicability

- **Where it works well:** Accounting-based equity strategies and forensic screens for earnings quality.
- **What is implementable:** Conditional accrual/persistence screens that penalize firms with large positive book-tax differences.
- **Main limitation:** Taxable income is inferred from financial statements rather than directly observed from tax returns, so measurement error is unavoidable.
- **Why the paper matters:** It shows that the pricing of earnings quality improves materially once one conditions on book-tax differences, especially large positive ones.
