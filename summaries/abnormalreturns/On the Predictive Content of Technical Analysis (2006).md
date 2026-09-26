# On the Predictive Content of Technical Analysis
**Authors:** Stefan Reitz
**Year:** 2006
**Journal/Venue:** North American Journal of Economics and Finance

## Problem statement

Reitz tries to rationalize a class of technical trading rules instead of dismissing them. The question is not whether chartists are magically good at reading pictures. The question is whether price-based rules can proxy for rational learning when some fundamentals are hidden or observed only with delay. In that environment, past prices may contain information about unobserved state changes, so technical analysis might be a cheap approximation to Bayesian inference rather than irrational superstition.

The paper focuses on foreign exchange, where regime shifts in policy or underlying fundamentals can occur before the relevant state variable is cleanly observed by the market.

## Approach (short)

The paper has two parts.

1. A theoretical learning model in which a latent fundamental can switch regimes from mean `mu_0` to mean `mu_1`, while agents only gradually infer whether the shift has occurred.
2. An empirical Markov regime-switching analysis of several U.S.-dollar exchange rates that asks whether technical forecasting appears to dominate precisely in the low-volatility environments where the theory says it should work best.

The key result is a derivation showing that a moving-average or oscillator rule can reproduce the **sign prediction** of a Bayesian learner when the fundamental is hidden for several periods.

## Approach (detailed)

### 1. The economic environment: exchange rates with hidden fundamentals

Reitz starts from a standard asset-pricing logic for exchange rates: today's exchange rate reflects expected future depreciation and contemporaneous fundamentals. One of the fundamentals, call it `z_t`, can switch from a low-mean regime to a high-mean regime at time `tau`.

Before the shift, the fundamental evolves around mean `mu_0`. After the shift it evolves around mean `mu_1`, with `mu_1 > mu_0` in the appreciation case. The complication is that the market does not observe the regime change perfectly or instantly. Agents instead update probabilities:

- `P_{1,t}` = probability the new regime is in force,
- `P_{0,t}` = probability the old regime remains in force.

So the forecasting problem is a Bayesian learning problem about a hidden state.

### 2. When fundamentals are observed immediately, the rational sign forecast is simple

Reitz first derives the benchmark case where observations of the fundamental are available without delay. Then a rational forecasting device predicts an appreciation whenever the posterior probability of the high-mean regime exceeds one half:

$$
P_{1,t} > P_{0,t}.
$$

Using the Gaussian learning structure, this can be rewritten in terms of the observed realizations of `z`. The sign prediction is:

$$
E_t[\Delta e_{t+1}] > 0
\quad \Longleftrightarrow \quad
\frac{1}{t-\tau+1}\sum_{j=\tau}^{t} z_j > \frac{\mu_0+\mu_1}{2}.
$$

This is a crucial step. It says the exchange rate should be expected to rise whenever the running average of the observed fundamental is closer to the post-shift mean than to the pre-shift mean. In other words, Bayesian sign prediction is equivalent to a threshold rule based on a moving average.

### 3. The real case: fundamentals are observed with delay

The paper then adds the key friction: observations of the fundamental arrive only with a lag of `delta` periods. During the interval after the suspected shift but before the data arrive, the market must infer the state from price movements themselves.

Over that window, the exchange rate becomes a linear transformation of the hidden fundamental. Because the fundamental is unobserved but affects price contemporaneously, past prices contain indirect information about the regime.

This is where technical analysis enters. If price is the observable shadow of the hidden state, a chartist rule based on recent prices may be rationally informative.

### 4. Deriving the technical-analysis rule from Bayesian sign prediction

Reitz now maps the Bayesian forecast onto a moving-average condition using past exchange rates instead of the unobserved fundamental. For `kappa = 1, ..., delta`, the sign rule becomes:

$$
E_{\tau+\kappa}[\Delta e_{\tau+\kappa+1}] > 0
\quad \Longleftrightarrow \quad
\frac{1}{\kappa+1}\sum_{j=\tau}^{\tau+\kappa} e_j
>
\frac{ E_t[e_t \mid \tilde{\mu}=\mu_0] + E_t[e_t \mid \tilde{\mu}=\mu_1] }{2}.
$$

The interpretation is clean. The exchange rate is expected to rise when the moving average of recent exchange rates lies above the midpoint between the pre-shock and post-shock equilibrium values.

That is a technical-analysis rule. It is not derived from visual chart reading; it is derived from rational Bayesian learning under delayed observability.

### 5. Oscillator interpretation

The paper then shows that, under an agnostic prior at the moment of possible regime change and with enough averaging so that high-frequency noise largely cancels, the technical signal reduces to a moving-average oscillator. In practice:

- compare the recent average price to a reference level implied by the two candidate regimes,
- go with the sign suggested by whether recent prices are above or below that midpoint.

This is why Reitz describes technical analysis as a "cheap proxy" for Bayesian learning. The chartist does not explicitly estimate posterior regime probabilities, but the oscillator is extracting similar information from price history.

### 6. Why the signal can fail

The theory also explains why technical analysis is not always reliable.

- If the market begins to price a regime change that does **not** actually occur, prices may move as if the hidden state shifted and technical rules will generate false signals.
- If volatility is very high, noise can swamp the inferential content of recent price movements.
- If fundamentals become directly observable quickly, the incremental value of price-based inference falls.

So the model predicts that technical analysis should work only in a specific informational regime:

- hidden or delayed fundamentals,
- meaningful state shifts,
- and not too much noise.

### 7. Empirical design: Markov regime-switching in exchange rates

The empirical section tests this interpretation using daily U.S.-dollar exchange rates against several major currencies. Rather than fitting a single linear forecasting equation, Reitz estimates a Markov regime-switching model with chartist and fundamentalist components.

The idea is:

- one regime corresponds to technical or chartist forecasting being more informative,
- another regime corresponds to standard fundamentalist forecasting dominating.

The transition probabilities between regimes are estimated from the data. This is an empirical counterpart to the theory's hidden-state setup.

### 8. Main empirical findings

The estimated regime-switching models show:

- high persistence of regimes, with transition probabilities generally above `0.94`,
- meaningful regime-dependent volatility,
- and chartist coefficients of the predicted sign in the relevant states.

Most importantly, the chartist regime is associated with **low-volatility periods**. This lines up with the theory. When volatility is low, recent exchange-rate movements reveal more about the hidden fundamental. When volatility is high, noise contaminates the inference and technical rules are less informative.

The paper reports this pattern across several exchange rates, not just one isolated series.

### 9. Why the empirical result matters

This is not just an exercise in finding a regime where moving averages happen to forecast well. The empirical model is meant to validate the theory's conditional prediction:

- technical analysis should be informative when hidden fundamentals drive prices and volatility is low,
- not universally and not as an autonomous price-only law.

That conditional view is the paper's main intellectual contribution. It turns technical analysis from an unconditional anomaly into a state-contingent inference device.

### 10. The paper's methodological contribution

Reitz contributes a clear chain of reasoning:

1. specify a hidden-regime model for fundamentals,
2. derive the Bayesian sign forecast when the hidden state is observed and when it is delayed,
3. show that the delayed-information sign forecast is equivalent to a moving-average-type rule in exchange rates,
4. test whether chartist forecasting is empirically concentrated in the low-volatility regimes where the theory predicts it should be useful.

This is much richer than a standard technical-analysis backtest. It provides both an economic motivation and a regime-dependent empirical prediction.

## Domain of applicability

- **Where it works well:** Markets such as foreign exchange where policy or fundamental regimes can shift before the underlying state becomes fully observable.
- **What is implementable:** A moving-average or oscillator-style sign rule interpreted as a reduced-form approximation to Bayesian learning, combined with regime-switching tests that allow chartist and fundamentalist forecasting to alternate over time.
- **Main limitation:** The interpretation relies on a specific hidden-state structure; if prices are not informative about delayed fundamentals, the rationalization weakens.
- **Why the paper matters:** It is one of the cleanest papers showing how a standard technical rule can emerge from rational inference rather than from non-economic chartism.
