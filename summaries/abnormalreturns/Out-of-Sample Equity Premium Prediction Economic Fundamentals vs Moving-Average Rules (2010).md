# Out-of-Sample Equity Premium Prediction: Economic Fundamentals vs. Moving-Average Rules
**Authors:** Christopher J. Neely, David E. Rapach, Jun Tu, Guofu Zhou
**Year:** 2010
**Journal/Venue:** Federal Reserve Bank of St. Louis working paper

## Problem statement

Two literatures claim to forecast equity returns:

- macro-finance predictive regressions using variables like dividend yield and term spread,
- technical-analysis rules such as moving-average signals.

Neely, Rapach, Tu, and Zhou ask which approach works better *out of sample*, whether the gains are economically meaningful for allocation, and whether the two methods are really exploiting the same business-cycle variation.

## Approach (short)

The paper compares:

1. recursive predictive regressions based on economic variables;
2. recursive forecasts derived from moving-average signals.

Out-of-sample performance is evaluated using Campbell-Thompson `R^2_{OS}` and utility gains for a mean-variance investor with portfolio weight

$$
w_{j,t} = \frac{1}{\gamma}\frac{\hat r_{j,t+1}}{\hat\sigma^2_{t+1}}.
$$

## Approach (detailed)

### 1. Build recursive predictive-regression forecasts

For each economic predictor `x_{i,t}`, the paper estimates:

$$
r_{t+1} = \alpha_i + \beta_i x_{i,t} + \varepsilon_{i,t+1},
$$

recursively with an expanding window. The initial out-of-sample forecast uses data through time `m`, then each subsequent forecast re-estimates the regression with one more observation.

The paper also follows Campbell-Thompson restrictions:

- impose the economically expected sign on `\beta_i`,
- truncate negative equity-premium forecasts at zero.

### 2. Convert moving-average trading rules into comparable point forecasts

The technical rules begin as signals. For moving-average horizons `s < l`,

$$
S_{t+1}=
\begin{cases}
1 & \text{if } MA_{s,t} \ge MA_{l,t},\\
0 & \text{if } MA_{s,t} < MA_{l,t},
\end{cases}
$$

with

$$
MA_{j,t}=\frac{1}{j}\sum_{i=0}^{j-1} P_{t-i}.
$$

To put MA rules on the same footing as economic predictors, the paper estimates:

$$
r_t = \alpha_{s,l} + \beta_{s,l} S^{s,l}_t + \varepsilon_t,
$$

again recursively, and generates point forecasts

$$
\hat r^{\,s,l}_{t+1} = \hat\alpha_{s,l,t} + \hat\beta_{s,l,t} S^{s,l}_{t+1}.
$$

This step is methodologically central. It turns buy/sell rules into comparable expected-return forecasts.

### 3. Evaluate statistically with `R^2_{OS}`

Forecasts are compared to the historical-average benchmark using the Campbell-Thompson out-of-sample statistic:

- positive `R^2_{OS}` means the model beats the historical-average forecast in mean-squared-prediction-error terms.

The paper studies both individual predictors and simple combination forecasts for:

- economic variables,
- MA rules.

### 4. Evaluate economically with optimal allocation

The paper then asks whether those forecasts matter for a real investor. A mean-variance investor allocates

$$
w_{j,t} = \frac{1}{\gamma}\frac{\hat r_{j,t+1}}{\hat\sigma^2_{t+1}}
$$

to equities, where `\gamma` is risk aversion and `\hat\sigma^2_{t+1}` is forecast variance estimated from a rolling five-year window of returns.

Average realized utility is then computed as

$$
\hat\nu_j = \hat\mu_j - \frac{1}{2}\gamma \hat\sigma_j^2.
$$

The utility gain is the annualized management fee an investor would pay to use forecast `j` rather than the historical-average forecast.

### 5. Compare behavior over the business cycle

The paper splits results by NBER expansions and recessions. This reveals the key qualitative difference:

- MA rules tend to detect the decline in the equity premium early in recessions and thus cut equity exposure quickly;
- economic variables tend to pick up the rebound in expected returns later in recessions, closer to troughs.

So both can work during recessions even though their forecasts move in different directions over the recession timeline.

### 6. Use multiple MA horizons

The moving-average rules vary in short and long windows, such as `MA(1,12)` and `MA(2,12)`, and the paper also studies a simple average of all MA forecasts. Moderate long windows perform especially well in recessions.

### 7. What a reader should implement

To reproduce the paper:

1. estimate recursive predictive regressions for each economic variable;
2. compute MA signals and convert them to recursive point forecasts through the signal regression;
3. evaluate each forecast by `R^2_{OS}` against the historical average;
4. plug the forecasts into the mean-variance allocation rule above;
5. compare utility gains overall and separately in recessions.

The important practical lesson is that economic and technical forecasts are complements, not just substitutes.

## Domain of applicability

- **Where it works well:** Tactical equity allocation and forecast-combination research.
- **What is implementable:** Recursive predictive-regression and moving-average forecast engines tied directly to portfolio weights.
- **Main limitation:** Out-of-sample equity-premium forecasting remains unstable; the gains are concentrated in recessionary regimes.
- **Why the paper matters:** It puts macro predictors and technical rules into one unified out-of-sample forecasting and allocation framework.
