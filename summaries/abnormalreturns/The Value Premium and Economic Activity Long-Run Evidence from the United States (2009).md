# The Value Premium and Economic Activity: Long-Run Evidence from the United States
**Authors:** Angela J. Black, Bin Mao, David G. McMillan
**Year:** 2009
**Journal/Venue:** Journal of Asset Management

## Problem statement

The value premium is usually studied as a return spread. Black, Mao, and McMillan instead ask whether the *wealth index* of a long-value/short-growth strategy has a stable long-run relation to macroeconomic activity. The question is explicitly risk-based: if value outperformance is compensation for macro risk, the value premium price index should be cointegrated with business-cycle variables.

## Approach (short)

The paper constructs a monthly value premium price index (`VPPI`) and tests for cointegration between `VPPI` and macro variables using a Johansen vector error-correction model (`VECM`). The system includes industrial production, inflation, money supply, and long-term interest rates over `1959-2005`.

## Approach (detailed)

### 1. Recast the value premium as a price index

Instead of studying one-period `HML`-type returns, the paper builds a level series for a strategy that is:

- long value stocks,
- short growth stocks.

This series is the value premium price index, `VPPI`. The object of interest is then the long-run relation between `\log(VPPI_t)` and macroeconomic state variables.

### 2. Specify the macro state vector

The monthly system contains:

- `VPPI`,
- industrial production (`IP`),
- consumer prices (`CPI`),
- money supply (`MS`),
- long-term interest rate (`LIR`).

All are treated in logs or growth-rate form as appropriate. The sample runs from January 1959 to December 2005.

### 3. Use a Johansen VECM, not pairwise predictive regressions

The paper's methodological core is the multivariate cointegration setup:

$$
\Delta y_t = \Pi y_{t-1} + \sum_{i=1}^{p-1} \Gamma_i \Delta y_{t-i} + Bx_t + \varepsilon_t,
$$

with

$$
\Pi = \alpha \beta'.
$$

Here:

- `y_t` is the vector of nonstationary variables,
- `\beta' y_t` are the cointegrating relations,
- `\alpha` contains adjustment speeds.

This is the right framework because the claim is about shared long-run equilibria, not just short-run forecasting.

### 4. Determine the number of long-run relations

The Johansen procedure uses both the trace test and the maximum-eigenvalue test:

$$
Q_T = -T \sum_{i=r+1}^k \log(1-\lambda_i),
$$

$$
Q_{\max} = -T \log(1-\lambda_{r+1}),
$$

to test how many cointegrating vectors exist in the system.

So the empirical procedure is:

1. estimate a VAR lag length;
2. test stationarity/integration properties;
3. run Johansen rank tests;
4. estimate the cointegrating vector(s);
5. interpret the signs economically.

### 5. Map economic intuition into sign restrictions

The paper's hypotheses are state-contingent:

- better real activity (`IP`) should reduce the relative attractiveness of distressed/value firms, implying a lower `VPPI`;
- higher money growth can support good conditions for growth firms, again pressuring value relative to growth;
- higher long-term rates can hurt long-duration growth stocks more, supporting value relative to growth.

Thus the estimated long-run signs are informative about whether value is tied to bad macro states.

### 6. Interpret the estimated cointegrating relation

The main reported long-run relation is:

- negative with `IP`,
- negative with `MS`,
- positive with long-term rates,
- weakly negative and statistically weaker with inflation.

That pattern is consistent with value outperforming in worse macro states and when discount-rate pressure hits long-duration growth stocks.

### 7. What a reader should implement

To reproduce the paper:

1. construct a monthly value-minus-growth price index;
2. collect monthly `IP`, `CPI`, `M2`, and long-rate data;
3. log-transform the level variables;
4. estimate a VAR and then a Johansen `VECM`;
5. use trace and max-eigenvalue statistics to determine rank;
6. inspect the normalized cointegrating vector and the error-correction coefficients.

This is not a timing rule paper. It is a structural macro-linkage paper.

## Domain of applicability

- **Where it works well:** Macro interpretation of style premia and long-run equilibrium analysis.
- **What is implementable:** A cointegration test of whether a value-spread wealth index loads on business-cycle state variables in the long run.
- **Main limitation:** Cointegration evidence is about long-run comovement, not a direct short-horizon trading signal.
- **Why the paper matters:** It tries to locate the value premium inside a macro-risk system rather than treating it as an isolated cross-sectional fact.
