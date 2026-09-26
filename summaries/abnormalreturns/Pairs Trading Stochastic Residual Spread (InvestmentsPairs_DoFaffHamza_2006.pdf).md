# A New Approach to Modeling and Estimation for Pairs Trading — Do, Faff & Hamza (2006) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | A New Approach to Modeling and Estimation for Pairs Trading |
| **Authors** | Binh Do (PhD Candidate, Monash Accounting & Finance); Robert Faff (Director of Research, Monash); Kais Hamza (Mathematical Sciences, Monash) |
| **Date** | May 29, 2006 (working paper) |
| **Contribution** | Critique of distance / cointegration / Elliott stochastic-spread methods; propose **stochastic residual spread** state-space model nested in APT/CAPM relative pricing; EM algorithm for LGSS with exogenous inputs; empirical κ≈6–6.5 on three pairs |
| **Original PDF** | `InvestmentsPairs_DoFaffHamza_2006.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsRHJGdVdQYndDUlE` |
| **Extraction** | `pdftotext -layout`; clean (~9,243 words source). |

---

## Problem / Motivation

Pairs trading (mid-1980s Wall Street; Vidyamurthy 2004): long underpriced / short overpriced leg of a historically co-moving pair; unwind on convergence. Published research scarce (proprietary). Canonical refs: **Gatev–Goetzmann–Rouwenhorst (1999)** distance empirics; **Vidyamurthy (2004)** cointegration playbook; **Elliott–van der Hoek–Malcolm (2005)** Kalman/Vasicek spread.

Authors argue existing methods are ad hoc or special-case, force return parity, and sit poorly with mainstream asset pricing. They propose a general **residual spread** relative to an APT-style equilibrium, estimated as a Vasicek latent state with EM.

Boundary vs market-neutral: MN is portfolio optimization harvesting two alphas with ~zero systematic exposure (Jacobs–Levy; Michaud debate). Pairs is relative mispricing of **two** names (statistical arb or merger arb). Need not be market neutral.

---

## Existing Methods Critiqued

### Distance method (GGR 1999; Nath 2003)
Normalize prices; distance = SSD of normalized series. Trade when distance > threshold (GGR: 2 historical σ; Nath: 15th percentile of empirical distribution; stop-loss at 5th). Model-free (no misspecification) but **no forecast** of convergence time; assumes **static price-level distance / return parity**—only valid for near-identical risk-return twins.

### Cointegration method (Vidyamurthy 2004)
Engle–Granger:
$$
\log p^A_t-\gamma\log p^B_t=\mu+\epsilon_t
$$
Test residuals stationary (ADF). Ordering sensitivity; if not cointegrated, regression spurious (Lim–Martin 1995). Prefer Johansen VECM cross-check; **do not trade** if cointegration fails.

APT link attempt: if factor loadings of A are γ times B’s, cointegration follows—but authors show this **mishandles the risk-free rate**:
$$
R^A=R_f+\gamma(\cdots)+R^{s,A},\quad R^B=R_f+(\cdots)+R^{s,B}
$$
so $R^A\neq\gamma R^{c,B}+noise$ in general. Cointegration model (1) does not reconcile cleanly with APT.

### Stochastic spread (Elliott et al. 2005)
Latent Vasicek:
$$
dx_t=\kappa(\theta-x_t)dt+\sigma dB_t,\quad y_t=x_t+H\omega_t
$$
Advantages: mean reversion; continuous-time forecasts / first-passage times; Kalman MLE. Discrete:
$$
x_k=\theta(1-e^{-\kappa\Delta})+e^{-\kappa\Delta}x_{k-1}+\epsilon_k
$$
**Limitation:** forces long-run **return parity** (spread of logs/prices mean-reverts to constant)—same twins restriction. Authors note level spreads should widen as prices rise; prefer log differences.

---

## Proposed Model: Stochastic Residual Spread

Equilibrium relative pricing from APT differentials:
$$
R^A_t=R^B_t+\Gamma'r^m_t+e_t
$$
Residual spread observation:
$$
G_t=R^A_t-R^B_t-\Gamma'r^m_t
$$
State space:
$$
dx_t=\kappa(\theta-x_t)dt+\sigma dB_t,\qquad y_t=G_t=x_t+\omega_t
$$
Or jointly estimate Γ by rewriting measurement:
$$
y_k=R^A_k-R^B_k=x_k+\Gamma'r^m_k+H\omega_k
$$
with transition
$$
x_k=\theta(1-e^{-\kappa\Delta})+e^{-\kappa\Delta}x_{k-1}+\epsilon_k
$$
**Nests Elliott** when Γ=0. Nonzero θ allowed = firm-specific relative premium (management quality, etc.), absorbed in θ rather than adding μ in G.

Empirical design uses **CAPM** single factor (market excess return).

### Trading rule philosophy (return-level, not price-level)
Open when accumulated filtered residual $\delta_k=\sum_{i=k-l}^k \mathbb{E}[x_i|Y_i]$ exceeds θ by a threshold; unwind when accumulated spread neutralizes (may cross to opposite side of θ). Example: identical twins, A +5% / B +3% → need subsequent residual ≈ −2% to neutralize. Expected holding period via first-passage Monte Carlo (analytic OU passage under investigation).

---

## Estimation

LGSS likelihood via Kalman prediction-error decomposition (Durbin–Koopman). Parameters $\Psi=\{\theta,\kappa,\sigma,\Gamma,H\}$.

**EM** (Shumway–Stoffer): treat latent x as missing; maximize expected complete-data likelihood; RTS smoother byproduct. Literature EM usually for $x_k=Ax_{k-1}+Gv$, $y=Cx+H\omega$; authors derive EM for
$$
x_k=Ax_{k-1}+B+Gv_{k-1},\quad y_k=x_k+DU_k+H\omega_k
$$
(exogenous U = market excess)—appendix. Avoids numerical MLE fragility; monotone likelihood.

Alternatives: MCMC (Jacquier–Polson–Rossi; Eraker); joint filtering / self-organizing SS (Kitagawa; Haykin)—parameters as slow random walks; particle / auxiliary PF (Pitt–Shephard). PF needs correct noise law—less robust to misspecification than KF-MLE. Hybrid: EM warm-start → numerical MLE → PF particles.

### Simulation
True: A=0.9, B=0.005, D=0.1, G=0.0529, H=0.05 ↔ θ=0.05, κ=5, σ=0.4, Γ=0.1, H=0.05. Init distant. N=100. EM converges fast; further MLE/PF little gain. Figures 1–4 show KF smoother tracking residual vs noisy return differential; parameter paths for A,B,D,G,H.

---

## Empirical Results (Section 5; Table 1)

Three pairs, daily-ish sample ~120 observations illustrated: **BHP vs Rio Tinto**; **Target vs Walmart**; **Shell vs BP**.

| Param | BHP–RIO | Target–Walmart | Shell–BP |
|-------|---------|----------------|----------|
| log(A) | −6.3665 (−3.53) | −6.1471 (−6.90) | −6.5089 (−6.07) |
| B | −0.0009 (−5.48) | 0.0048 (18.29) | −0.0000 (−0.01) |
| D (=Γ) | **0.4420 (34.14)** | −0.0251 (−1.33) | −0.0518 (−7.12) |
| G | 0.0121 (16.38) | 0.0155 (7.58) | 0.0132 (15.79) |
| H | 0.0110 (13.44) | 0.0226 (15.91) | 0.0117 (12.60) |
| θ | −0.0009 | 0.0048 | ≈0 |
| **κ** | **6.37** | **6.15** | **6.51** |
| σ | 0.0433 | 0.0545 | 0.0475 |

(z-stats in parentheses.)

**Interpretation:**
1. Coefficients significant → Vasicek residual mean reversion supported.
2. **κ≈6–6.5** all three: fast reversion (good for non-convergence risk; bad for opportunity half-life—edges vanish quickly).
3. θ≠0: BHP–RIO residual ~**5% annualized favoring Rio** (mgmt/asset quality story). Target–Walmart θ implies ~**25% p.a.** residual—**pair to avoid** (short-term comovement, long-term divergent trends). BP–Shell θ≈0 (clean).
4. Γ̂≈0.442 for BHP–RIO matches raw market-model betas 1.7827 vs 1.3377 (Δ=0.445)—oil exposure differential.

---

## Limitations

1. Only three illustrative pairs—no cross-section profitability study (promised as next project).
2. Trading rules / TC / short-sale constraints not optimized.
3. CAPM-only factor; multi-factor Γ not empirically shown.
4. κ very high → limited economic value after costs.
5. Working paper; EM appendix not independently verified here.
6. Sample paths ~2 years—regime specificity.

---

## Practical Takeaways for a Quant Investor

1. Prefer **residual spreads vs explicit factor equilibrium** over raw price distances—avoids forced return parity.
2. Estimate **κ, θ, Γ jointly** (state space); reject pairs with large |θ| (structural drift) even if short-term distance triggers fire.
3. κ≈6 on liquid twins ⇒ half-lives of days; TCA and latency dominate.
4. Use EM for stable LGSS estimation with exogenous market factor in measurement.
5. Pre-screen on economic twins (DLCs, dual listings, same-industry global majors) then confirm with state-space—not the reverse.
6. Distance method remains useful as model-free monitor but lacks E[τ] and mistreats β≠1 pairs (BHP–RIO).
7. Next research step the authors flag—and a desk should demand—is **panel net-of-cost P&L** with optimized entry thresholds.

## Equations Quick Reference

$$
dx=\kappa(\theta-x)dt+\sigma dB,\quad y_k=x_k+\Gamma'r^m_k+H\omega_k
$$
$$
x_k=\theta(1-e^{-\kappa\Delta})+e^{-\kappa\Delta}x_{k-1}+\epsilon_k
$$
Elliott nest: Γ=0. Trade on accumulated $\sum \mathbb{E}[x|Y]$ vs θ.

## Numerical Summary Box

| Item | Value |
|------|-------|
| Model | Vasicek residual + CAPM Γ |
| Est. method | EM on LGSS with exogenous U |
| Sim true κ | 5 |
| Empir. κ | 6.15–6.51 |
| BHP–RIO Γ | 0.442 vs βΔ 0.445 |
| BHP–RIO θ | −0.0009 (~5% ann. favoring RIO) |
| Target–WMT θ | 0.0048 (~25% ann.—avoid) |

## Closing Synthesis

Do–Faff–Hamza (2006) replace ad hoc price-distance pairs rules with an APT/CAPM-consistent **stochastic residual spread**, nesting Elliott et al. when Γ=0. EM estimation is stable; three-pair evidence shows fast mean reversion (κ≈6) and warns against large-θ pairs. For production: factor-adjust spreads, estimate κ/θ/Γ jointly, and require panel net-P&L before capital allocation.


---

## Source-Anchored Deep Dive (from extracted PDF text)

### Source-anchored note

> A New Approach to Modeling and Estimation for Binh Do ∗             Robert Faff †            Kais Hamza ‡ Pairs trading is an speculative investment strategy based on relative mispricing between a pair of stocks. Essentially, the strategy involves choosing a pair of stocks that historically move together. By taking a long-short position on this pair when they diverge, a profit will be made when they next converge to the mean by unwind-

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> little theoretical verification. This paper analyzes these existing methods in detail and proposes a general approach to modeling relative mispricing for pairs trading purposes, with reference to the mainstream asset pricing theory. Several estimation techniques are discussed and tested for state space formulation, with Expectation Maximization producing stable results. Initial empirical evidence shows clear mean reversion behavior in selected pairs’ relative pricing.

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> School of Mathematical Sciences, Monash University Pairs trading is one of Wall Street’s quantitative methods of speculation which dates back to the mid-1980s (Vidyamurthy, 2004). In its most common form, pairs trading involves forming a portfolio of two related stocks whose relative pricing is away from its “equilibrium” state. By going long on the relatively undervalued stock and short on the relatively overvalued stock, a profit may be made by unwinding the position upon

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> due to the proprietary nature of the area, published research has been largely limited. Most referenced works include Gatev, Goetzmann and Rouwenhorst (1999), Vidyamurthy (2004), and Elliott, van der Hoek and Malcolm (2005). The first paper is an empirical piece of research that, using a simple standard deviation strategy, shows pairs trading after costs can be profitable. The second of these papers details an implementation strategy based on a cointegration based framework, without empirical results. The last paper applies

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> two stocks. A pairs trading strategy forcing an equilibrium relationship between the two stocks with little room for adaptation, may lead to a conclusion of “non-tradeability” at best and non-convergence at worst. This paper attempts to provide a uniform, analytical framework to design and implement pairs trading on any arbitrary pairs although it is acknowledged that pairs trading is best based on a priori expectation of co-movement verified by historical time series. Econometric techniques involved in the implementation

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> to other seemingly related hedge fund strategies. There are as many classification themes in the industry as the number of strategies. After compiling both academic sources and in- formal, internet-based sources, pairs trading falls under the big umbrella of the long/short investing approach that is based on simultaneous exploitation of overpricing and under- pricing, by going long on perceived under-priced assets and short on perceived overpriced ones. Under the long/short investing umbrella (as opposed to say, event driven strategies),

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> (1993), market neutral investing is a portfolio optimization exercise that aims to achieve negligible exposure to systematic risks, whilst “harvesting” two alphas, or active returns, one from the long position on the winners and one from the short position in the losers. There are also market neutral strategies that earn both beta return and two alphas, via the use of derivatives, such as the equitized strategy and hedge strategy (see Jacobs and Levy, 1993). Alternatively, market neutral investing can also achieve alpha return in

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> securities selection skills, leverage, and mathematical optimization, the latter is partic- ularly proprietary, sometimes labeled ambiguously as “integrated optimization” (Jacob Pairs trading, on the other hand, exploits short term mispricing (sometimes heuris- tically called arbitrage), present in a pair of securities. It often takes the form of either statistical arbitrage or risk arbitrage (Vidyamurthy, 2004). Statistical arbitrage, the object of this study, is an equity trading strategy that employs time series methods to identify

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> arbitrage strategies, depends heavily on the modeling and forecasting of the spread time series although fundamental insights can aid in the pre-selection step. Pairs trading needs not be market neutral although some say it is a particular implementation of market neutral investing (Jacob and Levy, 1993). This paper contributes to the literature by proposing an asset pricing based approach to parameterize pairs trading with a view to incorporate theoretical considerations into

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> short up to \$100 worth of securities, with the cash placed with the broker as collateral. Thus the total exposure is \$200, or a leverage of two-for-one, plus cash. The manager then benefits from both the long position, and the short position, in the form of residual, or active return (alpha), plus interest earned from the cash proceeds. Clearly, unconstrained short selling is the key to creating this leverage, something the strategy as opposed to basing it purely on statistical history, as inherent in existing methods. The use of a parametric model enables rigorous testing and forecasting. In

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> forcing incorrect state of equilibrium. A technical contribution of this paper lies in the estimation of a Gaussian and linear state model with exogenous inputs in both transition The remainder of the paper is organized as follows. Section 2 outlines three exist- ing pairs trading methods and their assumptions/limitations. Section 3 proposes what is termed a stochastic residual spread model of pairs trading. Section 4 discusses two alterna- tive estimation methods, Maximum Likelihood Estimation and joint filtering, and suggests

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> This section describes three main methods to implement pairs trading, which we label: the distance method, the cointegration method and the stochastic spread method. The distance method is used in Gatev et al (1999)and Nath (2003) for empirical testing whereas the cointegration method is detailed in Vidyamurthy (2004). Both of these are known to be widely adopted by practitioners. The stochastic spread approach is recently proposed Under the distance method, the co-movement in a pair is measured by what is known as

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> formation period. In Gatev et al (1999), the pairs are selected by choosing, for each stock, a matching partner that minimizes the distance. The trading trigger is two historical standard deviations as estimated during the formation period. Nath (2003) keeps a record of distances for each pair in the universe, in an empirical distribution format so that each time an observed distance crosses a trigger of 15 percentile, a trade is entered for that pair. Risk control is instigated by limiting a trading period at the end of which positions have to

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> distance approach purely exploits the statistical relationship of a pair, at a price level. As the approach is economic model-free, it has the advantage of not being exposed to model mis-specification and mis-estimation. On the other hand, being non-parametric means that the strategy lacks forecasting ability regarding the convergence time or expected holding period. What is a more fundamental issue is its underlying assumption that the price level distance is static through time, or returns of the two stocks are in parity.

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> practice in existing pairs trading strategies that mispricing is measured in terms of price The cointegration approach outlined in Vidyamurthy (2004) is an attempt to parameterize pairs trading, by exploring the possibility of cointegration (Engle and Granger, 1987). Cointegration is the phenomenon that two time series that are both integrated of order d, can be linearly combined to produce a single time series that is integrated of order d − b, b > 0, the most simple case of which is when d = b = 1. As the combined time

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> of one time series at the current time is a correction of last period’s deviation from the equilibrium (called the error correction component) and possibly some lag dynamics (and noises). The significance of this is that forecast can be done based on the past information. Vidyamurthy (2004) observes that as the logarithm of two stock prices are often assumed to follow a random walk, or be non-stationary, there is a good chance that they will be co-integrated. If that is the case, cointegration results can be used to determine how far

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> and Granger’s 2-step approach (Engle and Granger, 1987) in which log price of stock A is first regressed against log price of stock B in what is called cointegrating regression: t ) − γlog(pt ) = µ + ǫt                              (1) where γ represents the cointegration coefficient and the constant term µ captures some sense of “premium” in stock A versus stock B. The estimated residuals are then tested for stationarity, hence cointegration, using the Augmented Dickey-Fuller test. Under this

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> sample. This issue can be resolved by using the t-statistics from Engle and Yoo (1987). However, Vidyamurthy’s procedure is not necessarily premised on the cointegration condition, instead it looks for evidence of mean reversion in the spread time series, defined t ) − γlog(pt ), heuristically interpreted as the return on a portfolio consisting of long 1 unit of A and short γ units of B. Cointegration means that the spread has a long run mean of µ, such that any deviation from it suggests disequilibrium. Vidyamurthy then

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).

### Source-anchored note

> as a mean reverting process, such as an ARMA process. The other approach manually constructs an empirical distribution of zero crossings from the data sample. A high rate of zero crossings is used as evidence of mean reversion, although it is not clear how to define the trigger point. The latter “model-free” approach appears to be favored by Vidyamurthy due to its simplicity and avoidance of model mis-specification. Apart from being rather adhoc, Vidyamurthy’s approach may be exposed to errors

**Quant reading:** Encode this claim as a testable statement in the replication notebook: define the exact sample filter, estimator, and null. Record the paper's reported magnitude beside your replication. If the claim is theoretical, write the mapping from symbols to code variables and state which proposition/equation number it corresponds to in the local extracted text. Flag any tension with adjacent results (sign flips, subsample dependence, joint hypotheses). Carry forward implications for portfolio construction, risk, or execution in one sentence tied to Giuseppe Paleologo–style precision (coefficients, horizons, universes).
