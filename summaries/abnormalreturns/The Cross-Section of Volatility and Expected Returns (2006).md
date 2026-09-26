# The Cross-Section of Volatility and Expected Returns
**Authors:** Andrew Ang, Robert J. Hodrick, Yuhang Xing, Xiaoyan Zhang
**Year:** 2006
**Journal/Venue:** Journal of Finance

## Problem statement

This paper asks two related questions:

1. do stocks with high exposure to **aggregate volatility shocks** have different expected returns?
2. do stocks with high **idiosyncratic volatility** earn different average returns?

The theoretical motivation is intertemporal hedging demand. If volatility spikes are bad states, assets that covary positively with volatility innovations are hedges and should earn lower average returns.

## Approach (short)

The paper proxies aggregate volatility innovations with daily changes in `VIX` and estimates, for each stock,

$$
r_t^i=\beta_0^i+\beta_{MKT}^i MKT_t+\beta_{\Delta VIX}^i \Delta VIX_t+\varepsilon_t^i.
$$

Stocks are sorted monthly into quintiles on the realized `\beta_{\Delta VIX}` from the previous month of daily data. The paper then constructs a factor-mimicking portfolio `FVIX` and tests whether the sorted portfolios' average returns line up with their ex post `FVIX` loadings.

Separately, idiosyncratic volatility is measured as the standard deviation of daily residuals from the Fama-French three-factor model, and the paper studies monthly quintile spreads in that measure. The main findings are that high-volatility-beta stocks earn low returns and high-idiosyncratic-volatility stocks earn abysmally low returns.

## Approach (detailed)

### 1. Use daily `\Delta VIX` as the observable volatility innovation

Because the VIX series is highly persistent, the paper uses daily first differences:

$$
\Delta VIX_t = VIX_t - VIX_{t-1}
$$

as the empirical proxy for volatility innovations. The authors are explicit that this is a reduced-form measure. It may mix pure volatility news and volatility-risk-premium changes, but it is easy to compute and therefore easy to replicate.

### 2. Estimate stock-by-stock volatility exposure with a rolling daily regression

For each stock, over the previous month of daily data, estimate:

$$
r_t^i=\beta_0^i+\beta_{MKT}^i MKT_t+\beta_{\Delta VIX}^i \Delta VIX_t+\varepsilon_t^i.
$$

Stocks need more than 17 daily observations to enter the ranking. Each month:

1. estimate `\beta_{\Delta VIX}^i` from the prior month;
2. rank stocks into quintiles on that beta;
3. value-weight the stocks within each quintile;
4. hold the portfolios for the next month.

The resulting return spread between quintile 5 and quintile 1 is strongly negative. Stocks that load positively on volatility shocks earn lower average returns, which is the sign implied by hedging-demand theory.

### 3. Build a factor-mimicking portfolio for volatility risk

To test a genuine factor-pricing story, the paper constructs `FVIX`, a portfolio of basis assets designed to mimic innovations in aggregate volatility. Conceptually, this is done by projecting `\Delta VIX` onto returns on pre-formed basis portfolios:

$$
\Delta VIX_t = a + b'X_t + u_t,
$$

and then defining

$$
FVIX_t=b'X_t.
$$

This is not a tradable strategy in real time, because it uses future full-sample information, but it is the correct ex post factor for testing whether the sorted portfolios differ in factor loadings exactly where their average returns differ.

### 4. Run post-formation regressions with `FVIX`

The post-formation factor regression is:

$$
r_t^i=\alpha_i+\beta_{MKT}^i MKT_t+\beta_{SMB}^i SMB_t+\beta_{HML}^i HML_t+\beta_{FVIX}^i FVIX_t+\varepsilon_t^i.
$$

The paper shows that:

- portfolios sorted on past `\beta_{\Delta VIX}` exhibit monotonic ex post `\beta_{FVIX}` loadings;
- average returns and FF3 alphas become more negative as volatility exposure rises.

This is what turns the empirical pattern into a factor-risk argument instead of a simple portfolio-sort anomaly.

### 5. Define idiosyncratic volatility relative to the FF3 model

The second empirical block measures idiosyncratic volatility from daily residuals of:

$$
r_t^i=\alpha_i+\beta_{MKT}^i MKT_t+\beta_{SMB}^i SMB_t+\beta_{HML}^i HML_t+\varepsilon_t^i.
$$

Then

$$
IVOL_i = std(\varepsilon_t^i)
$$

over the formation window.

Stocks are sorted monthly into quintiles on `IVOL`, and the paper studies the subsequent one-month returns and FF3 alphas.

### 6. Document the high-`IVOL` puzzle

The result is not merely significant. It is extreme: the highest-idiosyncratic-volatility quintile earns much lower returns than the lowest, with a `5-1` FF3 alpha of about `-1.06%` per month.

This is puzzling because several theories would predict the opposite:

- incomplete diversification should make high idiosyncratic risk earn a premium;
- behavioral preference-for-lottery stories can also suggest high-volatility names should be bid up but not necessarily earn such poor future returns.

The paper's evidence is that they do earn poor future returns.

### 7. Control for momentum and systematic volatility exposure

The paper does not treat the `IVOL` result as automatically independent. It studies:

- double sorts on past returns and idiosyncratic volatility;
- double sorts on `\beta_{\Delta VIX}` and idiosyncratic volatility.

This is important because high-`IVOL` stocks are often recent losers or carry unusual systematic volatility exposure. The paper finds that controlling for volatility-factor exposure explains only a small part of the low returns to high-`IVOL` stocks.

### 8. Check robustness over horizons and states

The paper varies:

- formation windows,
- holding horizons,
- subperiods,
- NBER expansions versus recessions,
- and stable versus volatile market states.

The high-`IVOL` effect survives. It is especially pronounced in some subsamples, but not confined to a narrow episode.

### 9. What a reader should implement

A replication requires:

1. daily stock returns and daily `VIX`;
2. monthly estimation of `\beta_{\Delta VIX}` from the two-factor daily regression;
3. monthly quintile sorts on that beta;
4. construction of the `FVIX` mimicking factor for ex post tests;
5. daily FF3 residuals to compute `IVOL`;
6. monthly quintile sorts on `IVOL`;
7. FF3 alpha estimation and double sorts against momentum and volatility-beta.

The paper's methodological contribution is to separate **systematic volatility risk** from **residual volatility**, and to show that both are associated with low average returns, though for very different reasons.

## Domain of applicability

- **Where it works well:** Equity universes with daily returns and a liquid option-implied volatility index.
- **What is implementable:** Monthly volatility-beta and idiosyncratic-volatility sorts, plus ex post factor-loading tests.
- **Main limitation:** `\Delta VIX` is a reduced-form proxy for aggregate volatility news and may mix risk-premium movements with volatility movements.
- **Why the paper matters:** It established both a volatility-risk premium result and the now-famous low-return puzzle in idiosyncratic volatility.
