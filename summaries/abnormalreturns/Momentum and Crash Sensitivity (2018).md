# Momentum and Crash Sensitivity
**Authors:** Stefan Ruenzi, Florian Weigert
**Year:** 2018
**Journal/Venue:** Economics Letters

## Problem statement

The crash risk of momentum is well known, but most explanations are narrative rather than factor-based. This paper asks a narrower question: **if one explicitly controls for a crash-sensitivity factor built from stocks' lower-tail dependence with the market, how much of momentum's alpha survives?**

Unlike the Chabi-Yo, Ruenzi, and Weigert paper, this one does not estimate crash sensitivity from scratch. It asks whether that already-constructed crash factor can explain momentum.

## Approach (short)

The paper regresses annual momentum returns on standard factor models with and without an added **CRASH** factor. For the United States, CRASH is the return difference between high and low crash-sensitivity quintiles, where crash sensitivity is estimated from stocks' copula-based lower-tail dependence with the market. The paper then repeats the exercise in 23 international equity markets. Adding CRASH substantially reduces or eliminates momentum alpha in the U.S. and lowers it in most foreign markets.

## Approach (detailed)

### 1. Use standard momentum rather than redefining it

The momentum factor is the usual UMD-style return. For the U.S. data drawn from Kenneth French's library, the factor is built from six value-weighted portfolios based on:

- firm size,
- past returns from month `t-12` through `t-1`.

UMD is then the average return on the two high past-return portfolios minus the average return on the two low past-return portfolios.

This matters because the paper is trying to explain the standard momentum factor, not a custom crash-managed version.

### 2. Import crash sensitivity from earlier work

The crash factor is taken from Chabi-Yo, Ruenzi, and Weigert (2017). There, each stock's crash sensitivity is measured by its **lower-tail dependence** with the market, estimated from daily returns using copulas.

The CRASH factor is then constructed as:

- equally weighted high-crash-sensitivity quintile return,
- minus equally weighted low-crash-sensitivity quintile return.

So this paper is effectively a spanning test: does a factor built from lower-tail dependence absorb momentum?

### 3. Regress momentum on standard factors plus CRASH

The main U.S. regression is annual:

$$
UMD_t = \alpha + \beta_1(MKT-RF)_t + \beta_2 SMB_t + \beta_3 HML_t
+ \beta_4 RMW_t + \beta_5 CMA_t + \beta_6 CRASH_t + \varepsilon_t,
$$

with variants using either the Fama-French three-factor or five-factor baseline model.

Newey-West standard errors with two lags are used.

The logic is:

- estimate momentum alpha under standard factors,
- add CRASH,
- see how much of the alpha disappears.

### 4. Evaluate the U.S. result quantitatively

In the U.S. sample from 1963 to 2012, momentum has a large and significant annual alpha under the standard factor models. Once CRASH is added:

- the loading on CRASH is strongly positive,
- the alpha drops sharply,
- the residual alpha is no longer statistically different from zero.

That means a sizeable fraction of the U.S. momentum premium looks like compensation for systematic crash sensitivity.

### 5. Replicate the test internationally

The international extension uses country-specific:

- momentum returns,
- Fama-French factors,
- crash-sensitivity factors.

For each of 23 stock markets, the paper runs the same style of regression and records:

- the baseline momentum alpha,
- the loading on CRASH,
- the alpha after CRASH is added,
- the change in adjusted `R^2`.

This design is useful because it tests whether the U.S. relation is a curiosity or a broader feature of equity momentum.

### 6. Interpret what the spanning result means

The paper's argument is not that crash sensitivity explains every detail of momentum. It is that if:

- momentum loads heavily on a factor built from lower-tail dependence,
- and the alpha largely disappears when that factor is added,

then at least a substantial part of momentum looks like a **priced crash-risk exposure** rather than a purely unexplained anomaly.

### 7. What a reader should implement

The paper is implementable in two layers:

1. estimate or obtain a crash-sensitivity factor built from lower-tail dependence;
2. add that factor to the regression model used to evaluate momentum.

So the reusable lesson is not how to estimate LTD itself from scratch, but how to test whether momentum alpha is actually compensation for that specific tail-risk exposure.

## Domain of applicability

- **Where it works well:** Factor-spanning tests of equity momentum, especially when crash risk is suspected to be central to the premium.
- **What is implementable:** Add a CRASH factor based on lower-tail dependence to standard momentum regressions and compare the change in alpha.
- **Main limitation:** The paper relies on an externally constructed crash factor, so its force depends on the validity of that prior tail-dependence measurement.
- **Why the paper matters:** It provides one of the cleanest direct tests of whether momentum can be interpreted as compensation for systematic crash sensitivity.
