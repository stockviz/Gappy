# Equity Market Impact

**Authors:** Robert Almgren, Chee Thum, Emmanuel Hauptmann, Hong Li
**Year:** 2005
**Journal/Venue:** *Risk*, July 2005, pp. 57--62

## Problem statement

Estimate the market impact cost of executing large equity orders as a function of observable trade and stock characteristics---specifically order size, trade duration, daily volume, volatility, and shares outstanding. The model must decompose impact into a *permanent* component (information transmitted to the market) and a *temporary* component (liquidity concession during execution), produce quantitatively accurate pre-trade cost estimates, and be directly usable as input to an optimal trade scheduling algorithm.

## Approach (short)

Working from ~700,000 Citigroup US equity brokerage orders (Dec 2001--Jun 2003), the authors extend the Almgren--Chriss (2000) framework with nonlinear impact functions. They posit power-law forms for both permanent and temporary impact, fit the exponents via nonlinear regression on the full cross-section, then estimate universal dimensionless coefficients by linear regression with heteroscedastic error weighting derived from the theoretical model. The central result is that permanent impact is linear in normalised order size with a liquidity factor depending on shares outstanding, and temporary impact follows a $3/5$ power law in normalised trade rate.

## Approach (detailed)

### 1. Data and variable construction

The dataset comprises ~29,500 filtered orders on S&P 500 stocks (after excluding VWAP orders, market-on-close/open, orders with unreliable timestamps, orders with fewer than 2 executions, orders under 1,000 shares, and orders below 0.25% of average daily volume).

Key variables per order:
- $S_0$: pre-trade price (bid-ask midpoint just before first execution).
- $S_{post}$: post-trade price at $t_{post} = t_n + 30$ minutes (to allow temporary impact to dissipate).
- $\bar{S} = \sum x_j S_j / \sum x_j$: volume-weighted average execution price.
- $X = \sum_{j=1}^n x_j$: total executed size (shares); positive for buys, negative for sells.
- $T = \tau_n - \tau_0$: trade duration in *volume time* $\tau$ (fraction of average daily volume executed up to clock time $t$; $\tau=0$ at open, $\tau=1$ at close).
- $V$: 10-day moving average daily volume. $\sigma$: intra-day volatility estimator.
- $\Theta$: total shares outstanding.

Impact measures:

$$I = \frac{S_{post} - S_0}{S_0} \quad (\text{permanent}), \qquad J = \frac{\bar{S} - S_0}{S_0} \quad (\text{realised}).$$

Temporary impact is derived as $K = J - I/2$.

### 2. Theoretical trajectory cost model

Based on Almgren & Chriss (2000) with simplifications. The asset price in volume time $\tau$ follows:

$$dS = S_0 \, g(v) \, d\tau + S_0 \, \sigma \, dB$$

where $v = X/T$ is the constant trade rate (volume-time units), $g(v)$ is the permanent impact function, $g(0)=0$, $g$ increasing, and $B(\tau)$ is standard Brownian motion. Integrating over $[0, T]$ yields the permanent impact:

$$I = T \, g\!\left(\frac{X}{T}\right) + \sigma\sqrt{T_{post}} \;\xi \tag{1}$$

where $\xi \sim \mathcal{N}(0,1)$.

The *temporary* impact introduces a function $h(v)$: the execution price at time $\tau$ is shifted by $S_0 \, h(X/T)$ relative to the unaffected price. After averaging over the execution trajectory and accounting for the permanent drift already experienced, the realised impact becomes:

$$J - \frac{I}{2} = h\!\left(\frac{X}{T}\right) + \sigma\!\left(\sqrt{\frac{T}{12}}\left(4 - 3\frac{T}{T_{post}}\right)\chi - \frac{T_{post}-T}{2\sqrt{T_{post}}}\,\xi\right) \tag{2}$$

where $\chi \sim \mathcal{N}(0,1)$ is independent of $\xi$. The complicated noise term is the heteroscedastic error from Brownian motion on $[0,T]$ relative to its endpoint at $T_{post}$; it is used only for weighting in the regression.

### 3. Cross-sectional normalisation

To pool across stocks, the authors normalise by volatility $\sigma$ and express order size as a fraction of volume traded during execution, $X/(VT)$:

$$I = \sigma T \, g\!\left(\frac{X}{VT}\right) + \langle\text{noise}\rangle \tag{3}$$

$$J - \frac{I}{2} = \sigma \, h\!\left(\frac{X}{VT}\right) + \langle\text{noise}\rangle \tag{4}$$

where $g(\cdot)$ and $h(\cdot)$ are now *dimensionless, universal* functions (same for all stocks and dates).

### 4. Power-law functional forms and exponent estimation

The authors postulate:

$$g(v) = \pm \gamma |v|^\alpha, \qquad h(v) = \pm \eta |v|^\beta$$

(sign matching that of $v$). A *liquidity factor* $\mathcal{L} = (\Theta/V)^\delta$ is introduced into the permanent component to capture cross-stock variation via the inverse turnover ratio. The full regression models become:

$$\frac{I}{\sigma} = \gamma T \,\text{sgn}(X) \left|\frac{X}{VT}\right|^\alpha \!\left(\frac{\Theta}{V}\right)^\delta + \langle\text{noise}\rangle \tag{5}$$

$$\frac{1}{\sigma}\!\left(J - \frac{I}{2}\right) = \eta\,\text{sgn}(X)\left|\frac{X}{VT}\right|^\beta + \langle\text{noise}\rangle \tag{6}$$

Exponents are estimated via modified Gauss--Newton nonlinear regression minimising normalised residuals. Results ($\pm$ one standard deviation):

$$\alpha = 0.891 \pm 0.10, \qquad \delta = 0.267 \pm 0.22, \qquad \beta = 0.600 \pm 0.038.$$

**Key decisions based on these estimates:**

- $\alpha = 1$ cannot be reliably rejected; the authors fix $\alpha = 1$ (linear permanent impact), consistent with the quasi-arbitrage argument of Huberman & Stanzl (2004)---this is the unique exponent preventing price manipulation.
- $\delta \approx 1/4$ is adopted.
- $\beta = 1/2$ (square-root model) is rejected at 95% confidence. The authors fix $\beta = 3/5$, giving a concave temporary impact---slightly smaller costs for small trades and slightly larger for large trades versus the square-root alternative.

### 5. Coefficient estimation (linear regression)

With exponents fixed, $\gamma$ and $\eta$ are estimated by OLS on (5) and (6) with heteroscedastic weighting from the noise terms in (1) and (2):

$$\gamma = 0.314 \pm 0.041 \quad (t = 7.7), \qquad \eta = 0.142 \pm 0.0062 \quad (t = 23).$$

$R^2 < 1\%$ in both regressions---expected because the permanent impact signal is small relative to volatility-driven noise over the execution window. Significance comes from the large sample size.

### 6. Final model equations

$$\boxed{I = \gamma\,\sigma\,\frac{X}{V}\left(\frac{\Theta}{V}\right)^{1/4} + \langle\text{noise}\rangle}$$

$$\boxed{J = \frac{I}{2} + \text{sgn}(X)\;\eta\,\sigma\left|\frac{X}{VT}\right|^{3/5} + \langle\text{noise}\rangle}$$

where $\gamma \approx 0.314$, $\eta \approx 0.142$. Permanent impact $I$ depends on total order size and the liquidity factor but *not* on execution time $T$. Temporary impact depends on the *rate* $X/(VT)$ and hence is highly sensitive to the trading schedule.

### 7. Residual analysis

Under the Brownian motion assumption, $\xi$ and $\chi$ should be independent standard normals. Empirically: means $\approx 0$, variances $\approx 1$, near-zero correlation, but distributions are fat-tailed (as expected for short-horizon returns). The Gaussian framework is thus an approximation; the model is close to the best achievable within a Brownian motion setting.

## Domain of applicability

- **Asset class:** US large-cap equities (S&P 500 constituents). Calibrated on NYSE and NASDAQ-listed stocks.
- **Order size:** Up to roughly 10% of average daily volume. Orders above a few percent of daily volume have "substantial sources of uncertainty" not captured by the model.
- **Trade duration:** Intraday; orders completed within one trading day. The model uses a constant-rate (VWAP-like) execution assumption.
- **Limitations:** Calibrated exclusively on Citigroup execution data (potential broker-specific bias). Limited coverage of small-cap and very large (block) trades. No cross-impact between simultaneous orders in different stocks. The linear permanent impact and $3/5$-power temporary impact are simplifications chosen for parsimony over a broad universe; narrower models (by sector, date range, or exchange) could refine coefficients and possibly exponents.
- **Practical use:** Pre-trade cost estimation and as direct input to the Almgren--Chriss optimal execution framework. The universal coefficients $\gamma$, $\eta$ can be updated as new data arrives without changing the functional form.
