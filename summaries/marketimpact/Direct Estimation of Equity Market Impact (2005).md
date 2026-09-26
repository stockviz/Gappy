# Direct Estimation of Equity Market Impact

**Authors:** Robert Almgren, Chee Thum, Emmanuel Hauptmann, Hong Li
**Year:** 2005
**Journal/Venue:** Working paper (University of Toronto / Citigroup Global Quantitative Research). Original version December 2004.

## Problem statement

Estimate the functional form and coefficients of permanent and temporary equity market impact from proprietary institutional order-flow data, decomposing total execution cost into a permanent component (information-driven price shift) and a temporary component (liquidity concession), both as functions of trade rate. The result must be directly usable as input to optimal trade scheduling algorithms (Almgren--Chriss framework) and pre-/post-trade cost estimation.

## Approach (short)

Model price dynamics as arithmetic Brownian motion in *volume time* with drift determined by a permanent impact function $g$ of trade rate and an additive temporary impact function $h$. Assume power-law forms for $g$ and $h$. Fit exponents by nonlinear regression and coefficients by heteroskedasticity-weighted linear regression on ~29,500 filtered S&P 500 orders from Citigroup equity desks (Dec 2001--Jun 2003). Introduce a cross-sectional liquidity factor depending on turnover $\Theta/V$.

## Approach (detailed)

1. **Data and filtering.** Starting universe: ~700,000 US equity orders executed by Citigroup, Dec 2001--Jun 2003. Filters retain S&P 500 names only, exclude VWAP orders, market-on-close/open, after-hours fills, high-volatility stocks ($>12.5\%$ daily), and small orders ($<1000$ shares, $<0.25\%$ of ADV, $<2$ completed transactions). Final sample: 29,509 orders; median ~5 executions per order, median duration ~30 min, typical size a few percent of ADV.

2. **Volume time.** All computations use *volume time* $\tau \in [0,1]$, defined as the cumulative fraction of the average day's volume executed up to clock time $t$. This normalizes intraday volume and volatility profiles simultaneously. The mapping $t \mapsto \tau$ is estimated nonparametrically from a 10-day moving average of market volume for each stock.

3. **Observable impact variables.** For each order of signed size $X = \sum_j x_j$ shares, define:
   - Pre-trade price $S_0$ = bid-ask midpoint just before first transaction.
   - Post-trade price $S_{\text{post}}$ = first quote at $t_{\text{post}} = t_n + 30\text{ min}$ (carry over to next morning if after close).
   - Average realized price $\bar{S} = \sum x_j S_j / \sum x_j$.
   - **Permanent impact:** $I = (S_{\text{post}} - S_0)/S_0$.
   - **Realized impact:** $J = (\bar{S} - S_0)/S_0$.

4. **Trajectory cost model.** Assume constant execution rate $v = X/T$ in volume time over interval $T = \tau_n - \tau_0$. Price follows
   $$dS = S_0\, g(v)\, d\tau + S_0\, \sigma\, dB,$$
   where $g$ is the permanent impact function, $\sigma$ is daily volatility, and $B(\tau)$ is standard Brownian motion. The price received on each execution is displaced by a temporary impact function $h(v)$:
   $$\hat{S}(\tau) = S(\tau) + S_0\, h\!\left(\frac{X}{T}\right).$$

5. **Integrated expressions (exact under the constant-rate assumption).** Integrating and taking expectations:
   $$I = T\, g\!\left(\frac{X}{T}\right) + \sigma\sqrt{T_{\text{post}}}\;\xi, \qquad \xi \sim \mathcal{N}(0,1), \tag{1}$$
   $$J - \frac{I}{2} = h\!\left(\frac{X}{T}\right) + \sigma\left(\sqrt{\frac{T}{12}\!\left(4 - 3\frac{T}{T_{\text{post}}}\right)}\;\chi - \frac{T_{\text{post}}-T}{2\sqrt{T_{\text{post}}}}\;\xi\right), \quad \chi \sim \mathcal{N}(0,1), \tag{2}$$
   where $T_{\text{post}} = \tau_{\text{post}} - \tau_0$. The $I/2$ correction in (2) accounts for permanent impact accumulated on later executions. The noise terms $\xi,\chi$ are independent under the Brownian model and are used for heteroskedasticity weighting.

6. **Power-law functional forms.**
   $$g(v) = \pm\,\gamma\,|v|^{\alpha}, \qquad h(v) = \pm\,\eta\,|v|^{\beta}, \tag{3,4}$$
   with sign chosen so $g,h$ have the same sign as $v$. The no-arbitrage constraint of Huberman and Stanzl (2004) requires $\alpha = 1$ (linear permanent impact); concavity of temporary impact ($0 < \beta < 1$) is standard empirically. Same coefficients for buys and sells.

7. **Cross-sectional scaling.** To pool across stocks, normalize order size by $VT$ (shares traded during execution in an average day) and impact by $\sigma$. Introduce a liquidity factor $\mathcal{L} = (\Theta/V)^{\delta}$ for permanent impact, where $\Theta$ = shares outstanding, so $\Theta/V$ = inverse turnover. The regression equations become:
   $$\frac{I}{\sigma} = \gamma\, T\, \operatorname{sgn}(X)\left|\frac{X}{VT}\right|^{\alpha}\!\left(\frac{\Theta}{V}\right)^{\delta} + \langle\text{noise}\rangle, \tag{7}$$
   $$\frac{1}{\sigma}\!\left(J - \frac{I}{2}\right) = \eta\, \operatorname{sgn}(X)\left|\frac{X}{VT}\right|^{\beta} + \langle\text{noise}\rangle. \tag{8}$$
   Note: no cross-sectional liquidity factor is needed for temporary impact; $h$ depends only on normalized trade rate $X/(VT)$.

8. **Nonlinear regression for exponents.** Fit $\gamma, \alpha, \delta$ jointly in (7) and $\eta, \beta$ in (8) via modified Gauss--Newton, minimizing normalized residuals with heteroskedastic weights from the noise variances in (1,2). Results:
   $$\alpha = 0.891 \pm 0.10, \quad \delta = 0.267 \pm 0.22, \quad \beta = 0.600 \pm 0.038.$$
   - $\alpha = 1$ (linear) cannot be reliably rejected; adopted for theoretical consistency.
   - $\delta \approx 1/4$; adopted as $\delta = 1/4$.
   - $\beta = 1/2$ (square-root) **rejected** at 95% confidence. Adopted value: $\beta = 3/5$.

9. **Linear regression for coefficients.** With exponents fixed at $\alpha=1$, $\delta=1/4$, $\beta=3/5$, OLS with heteroskedastic weighting yields:
   $$\gamma = 0.314 \pm 0.041 \quad (t = 7.7), \qquad \eta = 0.142 \pm 0.0062 \quad (t = 23).$$
   $R^2$ values are $< 1\%$, which is expected: volatility noise dominates single-order realizations. The coefficients $\gamma, \eta$ are "universal" across all stocks and orders.

10. **Final model (closed-form).** Collecting all terms:
    $$I = \gamma\,\sigma\,\frac{X}{V}\!\left(\frac{\Theta}{V}\right)^{1/4} + \langle\text{noise}\rangle,$$
    $$J = \frac{I}{2} + \operatorname{sgn}(X)\;\eta\,\sigma\,\left|\frac{X}{VT}\right|^{3/5} + \langle\text{noise}\rangle.$$
    Permanent impact is linear in $X/V$, independent of execution time $T$, and scaled by inverse turnover. Temporary impact is concave ($3/5$ power) in the instantaneous trade rate $|X/(VT)|$, independent of stock-specific liquidity beyond $\sigma$ and $V$.

11. **Residual analysis.** Residuals $\xi$ and $\chi$ have mean $\approx 0$, variance $\approx 1$, low mutual correlation, but are fat-tailed (as expected for short-horizon returns). Q-Q plots confirm the model is close to the best achievable within the Brownian framework.

## Domain of applicability

- **Asset universe:** US large-cap equities (S&P 500). Cross-sectional variation handled via $\sigma$, $V$, $\Theta$, but calibration is on this universe only.
- **Order size range:** Up to ~10% of ADV. Model is not calibrated for larger participation rates; substantial additional effects (information leakage, supply/demand imbalance) arise beyond this range.
- **Execution style:** "Active" scheduling (not VWAP, not market-on-close/open). Assumes approximately constant rate in volume time.
- **Time horizon:** Intraday. Orders completing within a single trading day; median ~30 min.
- **Structural assumptions:** Arithmetic Brownian motion for prices; power-law impact functions; no cross-impact between stocks; permanent impact independent of schedule; buy/sell symmetry in coefficients.
- **Limitations:** Single-broker data (Citigroup); thin coverage of small-cap and very large orders; $R^2$ at single-order level is very low (noise-dominated); fat-tailed residuals mean Gaussian confidence intervals are approximate. The $3/5$ vs $1/2$ exponent distinction matters mainly at the tails of the order-size distribution.
- **Sample period:** Dec 2001--Jun 2003 (19 months). Coefficients are expected to drift and should be re-estimated on a rolling basis.
