# Momentum Trading, Return Chasing, and Predictable Crashes
**Authors:** Benjamin Chabot, Eric Ghysels, Ravi Jagannathan
**Year:** 2014
**Journal/Venue:** Federal Reserve Bank of Chicago Working Paper

## Problem statement

Momentum has two hard-to-reconcile facts:

- very strong long-run average performance,
- occasional violent crashes.

A common modern explanation is crowding by delegated money managers and return-chasing capital. But if that story is right, why do momentum profits and crashes also appear in Victorian London, long before modern hedge funds and quant equity shops? This paper asks: **are momentum crashes predictable in both modern and pre-modern markets, and can the predictability be explained by incentives that induce money managers to remain crowded into the strategy even when crash risk rises?**

## Approach (short)

The paper combines:

- Victorian London data from 1867 to 1907,
- U.S. CRSP data from 1927 to 2012.

It documents significant positive alpha in both eras and shows that crashes become more likely after strong recent momentum performance. Additional predictors depend on institutional setting: low interest rates matter in Victorian London, while recent momentum outperformance relative to the market matters in the CRSP era. A delegated-management model with convex fee incentives and return-chasing investors explains why skilled managers may rationally remain invested despite elevated crash risk.

## Approach (detailed)

### 1. Build comparable momentum series across two eras

The paper's identification strategy is historical comparison. It studies:

- the modern U.S. CRSP era, using the Fama-French momentum factor and a related `70/30` long-short momentum portfolio;
- pre-1907 London, using analogous value-weighted momentum portfolios built from the historical cross section.

The point is to keep the trading object conceptually similar across eras even though the institutional setting is radically different.

### 2. Show that momentum earns abnormal returns in both samples

The paper first runs factor regressions in each era. For modern U.S. data it uses the standard market, size, and value controls. For London it constructs analogous market, size, and dividend-yield factors from variables observable at the time.

The result is that momentum alpha is positive in both eras. That matters because it means the crash problem is not a modern data-mined artifact tied only to postwar U.S. institutional management.

### 3. Date momentum bull and bear markets explicitly

The next step is not just to eyeball crash months. The paper applies the Lunde-Timmermann bull/bear dating algorithm to the momentum return series itself. The rule tracks local maxima and minima of the cumulative momentum portfolio value and declares a transition when the drawdown or rebound exceeds a chosen threshold.

The authors use a 5% threshold to define momentum bear markets. This produces:

- a dated sequence of momentum bull states,
- a dated sequence of momentum bear states,
- durations and loss magnitudes for each bear spell.

This is the paper's first key methodological move. "Crash" becomes a state variable with a start, end, and hazard, not a narrative label for a few famous months.

### 4. Estimate a discrete-time hazard model for crashes

Once bull and bear states are dated, the paper models the probability that a momentum bull market ends in the next month. The baseline hazard is Weibull:

$$
h(t|X_t) = h_0(t)\exp(X_t'\beta),
$$

where the covariates include:

- the age of the momentum bull market,
- the risk-free rate,
- the cumulative momentum return over the previous 12 months,
- the cumulative market return over the previous 12 months.

This produces a time-varying ex ante crash probability.

### 5. Use recent momentum success as the main crowding proxy

Across both eras, the most stable predictor is recent momentum success. The interpretation is straightforward:

1. strong recent strategy performance attracts capital;
2. more capital crowds into the trade;
3. the trade becomes more fragile to reversal.

That is why the paper treats lagged momentum performance as a proxy for crowding or capital availability to momentum traders.

### 6. Let the institutional predictors differ across eras

The auxiliary predictors are deliberately allowed to differ in economic meaning across the two eras.

**Victorian London.** Low interest rates increase the odds of a momentum crash. The interpretation is leverage based: cheap financing makes self-funded speculative momentum easier, so crowding rises when rates are low.

**CRSP-era United States.** High recent momentum return relative to the market increases crash odds. The interpretation is delegated capital flows: when momentum outperforms the market, performance-chasing investors direct capital toward it.

This era-specific asymmetry is one of the paper's strongest pieces of evidence because it matches institutional reality rather than forcing one predictor to do all the work everywhere.

### 7. Evaluate the hazard model as a timing device

The paper does not stop at significance. It converts the hazard into a classification rule:

1. compute the ex ante probability that the bull market ends next month;
2. choose a threshold above which the manager exits momentum and moves to cash;
3. evaluate the resulting crash-detection and false-positive trade-off.

The authors use receiver-operating-characteristic style diagnostics and bootstrap tests to show that momentum bear markets are predictably different from random episodes. So the hazard model has genuine timing content, not just retrospective fit.

### 8. Add a delegated-management equilibrium story

The paper then explains why predictable crashes do not get arbitraged away. The model contains:

- skilled managers,
- outside investors who chase recent returns,
- fee income increasing with assets under management,
- and market states in which momentum is attractive but crowded.

The key wedge is that even if the manager privately knows crash risk is elevated, exiting too early sacrifices inflows and fee convexity. So the privately optimal action can be to stay invested using other people's money. That makes predictable crowding and predictable crashes equilibrium outcomes.

### 9. What a reader should implement

A faithful implementation is:

1. construct a momentum return series;
2. date momentum bull and bear markets using a drawdown-based state algorithm;
3. estimate a discrete-time Weibull hazard with lagged strategy return, lagged market return, and financing conditions as covariates;
4. treat unusually strong recent momentum performance as a warning signal, not purely as good news;
5. reduce exposure or move to cash when the estimated crash probability is high.

The paper is therefore not only historical interpretation. It is a design for a crash-risk overlay.

## Domain of applicability

- **Where it works well:** Momentum strategies run by professional managers or financed by capital that responds to recent performance.
- **What is implementable:** A crash-risk overlay that treats recent momentum success, leverage conditions, and crowding proxies as state variables.
- **Main limitation:** The manager-incentive model is stylized; it explains why crowding can persist, not every micro-detail of every crash.
- **Why the paper matters:** It shows that momentum crashes are not accidental surprises. They are predictable states that arise naturally when capital chases recent strategy success.
