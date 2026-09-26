# Momentum Crashes — Daniel & Moskowitz (2016) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Momentum Crashes |
| **Authors** | Kent Daniel (Columbia, NBER); Tobias J. Moskowitz (Chicago Booth, NBER) |
| **Journal** | *Journal of Financial Economics*, 2016 (accepted manuscript; DOI 10.1016/j.jfineco.2015.12.002) |
| **JEL** | G12 |
| **Keywords** | Asset pricing, market anomalies, market efficiency, momentum |
| **Sample (primary)** | CRSP US common stocks; momentum portfolios **1927:01–2013:03** (~87 years) |
| **Extensions** | International equities; equity index futures, currencies, commodities, bonds (Asness–Moskowitz–Pedersen universe) |
| **Core strategy** | Decile WML: long top 10% / short bottom 10% by cumulative return from $t-12$ to $t-2$ (skip month $t-1$); value-weighted |
| **Original PDF** | `AbnormalReturnsMomentum_DanielMoskowitz_2016.pdf` |
| **Drive file_id** | `1WDH0Xig8NkaDzdagiRe3AnhbP9r5Epkx` |
| **Extraction** | `pdftotext -layout`; clean OCR; tables at end of manuscript |

Moskowitz discloses an ongoing relationship with AQR Capital, which invests in momentum among other strategies.

---

## Problem / Motivation

Momentum—buying past winners and selling past losers—is one of the most pervasive empirical regularities in asset pricing. Following Jegadeesh and Titman (1993) and Asness (1994), the literature has documented intermediate-horizon momentum in US equities (pre- and post-sample), industries (Moskowitz–Grinblatt 1999), developed and emerging equities (Rouwenhorst), country indices, currencies, commodities, futures, and bonds (Asness–Moskowitz–Pedersen 2013), with historical evidence extending to Victorian markets and even 1801–2012 (“world’s longest backtest”).

The practical and theoretical problem is that this strong average premium is punctuated by **infrequent but catastrophic crashes**. Like currency carry, momentum returns are **negatively skewed**, and the drawdowns can be large and persistent. Two canonical US equity examples:

1. **July–August 1932**: consecutive months; past-loser decile returned **+232%** while past winners gained only **+32%**.
2. **March–May 2009**: past losers rose **+163%**; past winners only **+8%**.

These are not random bad months: they cluster in **panic states**—after large market declines, when volatility is high—and are **contemporaneous with market rebounds**. Cooper–Gutierrez–Hameed (2004) and Stivers–Sun (2010) already showed that momentum premia shrink after negative three-year markets and when volatility is high. Daniel–Moskowitz go further: they characterize the **conditional beta / optionality** of losers that mechanically generates written-call-like payoffs for WML in bear markets, show that crashes are **partly forecastable**, design an **optimal dynamic leverage** rule that approximately **doubles** Sharpe and alpha, and demonstrate robustness across markets and asset classes.

For a quant investor the paper answers three operational questions: (i) when does WML blow up and why; (ii) can you hedge or scale it ex ante; (iii) is the crash phenomenology universal or US-equity-specific.

---

## Setup / Data

### US equity momentum construction

- Universe: CRSP common stocks.
- Ranking signal: cumulative return from month $t-12$ through $t-2$ (standard 12-2, skip recent month to avoid short-term reversal).
- Portfolios: ten value-weighted deciles; **WML** = Decile 10 − Decile 1 (paper’s Table 1 note says “long Decile 1 short Decile 10” in one place—this is a manuscript typo; throughout results WML is winners minus losers, i.e., long high past return / short low past return).
- Full sample for Table 1: **1927:01–2013:03**.
- Dynamic-strategy performance comparison (Table 7): **1934:01–2013:03** (needs lag for variance estimation).
- Bear-market indicator $I_{B,t-1}$: equals 1 if cumulative CRSP VW market return over past **24 months** is negative.
- Up-market indicator $I_{U,t}$: equals 1 if contemporaneous excess market return $> 0$.
- Ex ante market variance $\hat\sigma^2_{m,t-1}$: variance of daily market returns over preceding **126 trading days**.

### International and other asset classes

Section 5 uses country equity markets and the Asness–Moskowitz–Pedersen (AMP) asset-class momentum portfolios (equity indices, currencies, commodities, fixed income). Same panic-state instruments and dynamic weighting applied market-by-market / asset-class-by-asset-class.

---

## Model / Methods

### 1. Unconditional and conditional market models

Unconditional CAPM for WML:

$$
\tilde R^{\mathrm{WML}}_t = \alpha_0 + \beta_0 \tilde R^e_{m,t} + \varepsilon_t.
$$

Conditional / optionality specification (Table 3–4):

$$
\tilde R^{e}_{i,t} = \bigl[\alpha_0 + \alpha_B I_{B,t-1}\bigr] + \Bigl[\beta_0 + I_{B,t-1}\bigl(\beta_B + I_{U,t}\beta_{B,U}\bigr)\Bigr]\tilde R^e_{m,t} + \varepsilon_t.
$$

Interpretation: in bear markets, the **up-market beta** of losers rises sharply relative to down-market beta—losers behave like **out-of-the-money calls** that pay off when the market rebounds. WML, being short losers, behaves like a **written call** on the market in bear states.

Bull-market analogue replaces $I_B$ with $I_L = 1-I_B$; optionality is concentrated in bear markets, not bull markets.

### 2. Forecastability of momentum mean

$$
\tilde R^{\mathrm{WML}}_t = \gamma_0 + \gamma_B I_{B,t-1} + \gamma_{\sigma^2_m}\hat\sigma^2_{m,t-1} + \gamma_{\mathrm{int}} I_{B,t-1}\cdot\hat\sigma^2_{m,t-1} + \varepsilon_t.
$$

Key result: interaction of bear markets with high ex ante variance forecasts low (often negative) WML returns.

### 3. Volatility risk hedge test

Daily regressions of WML on market and on **S&P 500 variance-swap** returns, interacted with panic instrument $I_{B\sigma^2}$. Question: does selling volatility (or buying variance swaps) restore bear-market profitability? Answer: no—time-varying vol risk exposure does not explain the crash premium.

### 4. Optimal dynamic weighting (Appendix C)

To maximize the **unconditional** Sharpe ratio of a strategy that scales a risky asset with time-varying conditional mean $\mu_t$ and variance $\sigma^2_t$, the optimal weight satisfies

$$
w^*_t \propto \frac{\mu_t}{\sigma^2_t},
$$

equivalently: choose leverage so that **conditional volatility is proportional to the conditional Sharpe ratio**. Implementable version:

- Forecast $\mu_{t-1}$ from the Table 5-style regression (bear × variance instruments), estimated expanding or full-sample.
- Forecast $\sigma^2_{t-1}$ from trailing 126-day WML realized variance.
- Scale WML by $w^*_t = c\cdot \hat\mu_{t-1}/\hat\sigma^2_{t-1}$ (constant $c$ normalizes average exposure).

Comparators: static WML; **constant-volatility** (cvol) scaling by $1/\hat\sigma_{t-1}$; variance-scaled $1/\hat\sigma^2_{t-1}$ without mean forecast.

### 5. Spanning / appraisal ratios

Time-series regressions of dynamic strategy returns on static WML, cvol, and multifactor benchmarks (including conditional betas in crash states). Treynor–Black appraisal ratios measure incremental Sharpe of each nested improvement.

---

## Results with Numbers

### Table 1 — Momentum decile characteristics, 1927:01–2013:03 (annualized %)

| Statistic | Loser (1) | … | Winner (10) | **WML** | Market |
|-----------|-----------|---|-------------|---------|--------|
| $r-r_f$ | −2.5 | | 15.3 | **17.9** | 7.7 |
| $\sigma$ | 36.5 | | 23.7 | **30.0** | 18.8 |
| $\alpha$ (vs VW mkt) | −14.7 | | 7.5 | **22.2** ($t=7.3$) | 0 |
| $\beta$ | 1.61 | | 1.03 | **−0.58** | 1 |
| Sharpe | −0.07 | | 0.65 | **0.60** | 0.41 |
| Monthly log skewness | +0.09 | | −0.82 | **−4.70** | −0.57 |

WML’s mean excess ~18% with Sharpe ~0.60–0.71 (text also cites 0.71 depending on sample cut) dwarfs the market’s ~0.40, but **monthly skewness of −4.7** is extreme. Winners themselves are more negatively skewed than losers—consistent with written-option character of the long-short book when losers rally in rebounds.

### Table 2 — Fifteen worst WML months

| Rank | Month | WML % | Mkt−2y % | Mkt contemporaneous % |
|------|-------|-------|----------|------------------------|
| 1 | 1932:08* | **−74.36** | −67.77 | **+36.49** |
| 2 | 1932:07* | **−60.98** | −74.91 | **+33.63** |
| 3 | 2001:01‡ | −49.19 | +10.74 | +3.66 |
| 4 | 2009:04† | −45.52 | −40.62 | +10.20 |
| 5 | 1939:09* | −43.83 | −21.46 | +16.97 |
| 6 | 1933:04* | −43.14 | −59.00 | +38.14 |
| 7 | 2009:03† | −42.28 | −44.90 | +8.97 |
| … | | | | |
| 15 | 1974:01 | −24.04 | −5.67 | +0.46 |

Pattern triad: (1) extreme negative WML; (2) typically deeply negative trailing two-year market (exceptions: some 2001 tech-bust months); (3) **large positive contemporaneous market**—crashes are rebound months, not further collapses. Clustering in 1932–39, 2001–02, and 2009 is visible in daily cumulative-return plots (Figs. 1–2 in paper).

### Table 3 — Market-timing regressions for WML (1927:01–2013:03)

Specification (4) highlights:

- $\hat\alpha_0 \approx 2.03\%$ per month ($t=8.4$) outside crash interactions.
- Unconditional $\hat\beta_0 \approx -0.03$ (insignificant once bear interactions included)—the famous negative WML beta is almost entirely a **bear-market phenomenon**.
- $\hat\beta_B \approx -0.71$ ($t=-6.1$): in bear markets WML’s down-beta becomes sharply more negative.
- $\hat\beta_{B,U} \approx -0.73$ ($t=-5.6$): **additional** negative beta on up-moves in bear markets—the written-call term.
- Adj. $R^2$ rises from 0.13 (unconditional) to **0.28** with optionality.

Economically: when the market is in a 24-month bear state and then rallies, WML’s effective market beta can be on the order of $\beta_0+\beta_B+\beta_{B,U} \approx -1.5$, so a +30% market month (as in mid-1932) predicts order −45% WML—matching Table 2.

### Table 4 — Optionality by momentum decile

Panel A (bear markets): loser decile has $\hat\beta_B = 0.22$ and $\hat\beta_{B,U} = 0.60$ ($t=4.4$)—losers’ up-beta in bears is much higher than their down-beta. Winner decile has $\hat\beta_B = -0.44$ and $\hat\beta_{B,U} = -0.22$. WML inherits $\hat\beta_{B,U} = -0.815$ ($t=-4.5$).

Panel B (bull markets): the analogous up-market interaction $\hat\beta_{L,U}$ for WML is only **−0.24** ($t=-1.3$)—**not significant**. Optionality is asymmetric: it is a bear-market / loser phenomenon.

### Table 5 — Bear markets × estimated market variance

Regression (4): $\hat\gamma_{\mathrm{int}} = -0.397$ ($t=-5.7$) on $I_B \times \hat\sigma^2_m$. Bear indicator alone and variance alone are weaker once the interaction is included. Column (5) shows the interaction remains significant ($t=-2.2$) with all terms present. **Panic = bear market + high ex ante vol** is the relevant state variable for low expected WML returns.

### Table 6 — Variance-swap hedge (daily, 1990–2013)

Annualized $\hat\alpha \approx 30\%$ ($t\sim 4.8$); panic instrument $I_{B\sigma^2}$ coefficient ≈ −50 to −59 ($t\sim -5$). Interacting variance-swap returns with the panic instrument: coefficient −0.10 ($t=-4.7$), but **does not eliminate** the large negative intercept associated with panic states. Selling vol / buying variance swaps is not a complete hedge for momentum crashes.

### Table 7 — Dynamic strategy Sharpes (1934:01–2013:03)

| Strategy | Sharpe | Appraisal vs previous |
|----------|--------|------------------------|
| Static WML | **0.682** | — |
| Constant-vol (cvol) | **1.041** | 0.786 |
| Variance-scaled | (intermediate) | |
| Dynamic OOS | ~**1.2+** range | |
| Dynamic in-sample | highest | |

Abstract summary: implementable dynamic strategy based on forecasts of mean and variance **approximately doubles** alpha and Sharpe of static momentum. Text: going from in-sample to out-of-sample dynamic weighting still leaves large gains; cvol alone already lifts Sharpe from ~0.68 to ~1.04 by cutting exposure when WML vol is high (which coincides with crash states).

### Table 8 — Spanning

Dynamic WML produces significant alphas versus static WML and versus cvol; reverse regressions show cvol and static WML do **not** span the dynamic strategy. Conditional multifactor models that allow betas to shift in crash states still leave dynamic-strategy alpha.

### Tables 9–11 — International equities and other asset classes

- Same bear-market optionality of losers appears in non-US equity momentum.
- Currency, commodity, and bond momentum exhibit crash states tied to $I_B\sigma^2$-type instruments.
- Japan’s unconditional momentum alpha is weaker (known fact), but crash / optionality patterns remain informative.
- Dynamic weighting improves Sharpe in each asset class (Table 11); combining dynamic strategies across asset classes yields further diversification of crash risk because crash months are imperfectly synchronized.

### Hedging market and size

Paper notes that dynamically hedging market and size exposures improves performance especially in the **pre-WWII** era, when size and market betas of losers moved violently. Ex ante hedges help but do not remove the need for volatility-aware leverage.

---

## Limitations / Critical Assessment

1. **Rare events / data mining**: crashes are few; designing instruments on the full sample raises overfitting risk. Authors address this with OOS dynamic weights, international and cross-asset replication, and theory-motivated (not purely mined) instruments.
2. **Implementability**: dynamic leverage assumes frictionless shorting and ability to scale WML up/down monthly. Real-world borrow fees on losers (especially distressed names in panics), prime-broker recall risk, and capacity constraints bind exactly when the model wants nonzero exposure.
3. **Definition of bear market**: 24-month cumulative market < 0 is simple and robust but coarse; alternative state variables (drawdown depth, credit spreads, funding liquidity) may refine timing.
4. **Risk vs mispricing**: option-like loser payoffs are consistent with both (a) rationally high premium for rebound insurance and (b) forced selling / fire-sale dynamics that reverse violently. Paper leans toward a conditionally high premium for losers’ call-like payoffs but does not close the debate.
5. **Manuscript typo risk**: Table 1 prose momentarily reverses long/short labels; all numbers are consistent with standard WML = winners − losers.
6. **Conflict disclosure**: Moskowitz–AQR relationship is disclosed; results are academic-quality and replicated broadly, but readers should note commercial alignment with momentum products.

---

## Practical Takeaways for a Quant Investor

1. **Never run static full-notional WML through a post-crash rebound.** The left tail is not Gaussian; monthly skewness ≈ −4.7 over 87 years.
2. **State variables that matter**: (i) 24-month market still negative; (ii) trailing ~6-month market variance elevated; (iii) market starting to rally. The dangerous quadrant is **bear + high vol + up-move**.
3. **Scaling beats binary on/off**: constant-vol targeting (scale by $1/\hat\sigma$) already nearly doubles Sharpe (0.68 → 1.04). Adding a mean forecast $\hat\mu/\hat\sigma^2$ helps further and is what theory prescribes for unconditional Sharpe maximization.
4. **Do not expect variance-swap overlays to “fix” momentum.** Vol risk is correlated with crashes but is not the whole story.
5. **Crash risk diversifies imperfectly across asset classes**—combine equity, FX, commodity, and bond momentum with per-sleeve dynamic weights rather than one global on/off switch.
6. **Loser leg is the option.** Risk systems should flag rising loser betas in bear markets as a leading indicator of written-call exposure in the book.
7. **Performance attribution**: report WML returns conditional on $I_B$ and on $I_B\times\sigma^2$; unconditional Sharpe overstates the strategy’s experience for any investor who must survive 1932 / 2009-style windows.

---

## Equations Worth Keeping on a Desk Card

$$
w^*_t \propto \frac{\hat\mu_t}{\hat\sigma^2_t},\qquad
\hat\mu_t = \hat\gamma_0 + \hat\gamma_{\mathrm{int}} I_{B,t}\hat\sigma^2_{m,t},
$$

$$
\beta^{\mathrm{WML}}_{\text{bear, up}} \approx \beta_0 + \beta_B + \beta_{B,U} \ll 0.
$$

---

## Bottom Line

Daniel and Moskowitz show that momentum’s impressive unconditional premium is the compensation (or the statistical artifact) attached to a strategy that is **short a call on the market in panic states**. Those states are partly forecastable with simple instruments. An implementable dynamic policy that scales exposure with conditional Sharpe approximately doubles risk-adjusted performance and survives out-of-sample, international, and cross-asset scrutiny. For production momentum engines, **volatility targeting plus a panic-state mean forecast** is not optional polish—it is central risk management.


---

## Extended Quantitative Narrative

### Anatomy of a momentum crash: 1932 and 2009

The July–August 1932 episode is the cleanest laboratory. The trailing two-year market had fallen on the order of **−70%**. Losers were firms that had already collapsed; many traded like deep out-of-the-money options on survival. When Roosevelt-era policy expectations and liquidity conditions flipped, the market rose **+34%** and **+36%** in consecutive months. Losers’ high conditional betas on those up-moves produced triple-digit portfolio returns for the short leg, crushing WML by **−61%** then **−74%**.

March–May 2009 rhymes: after the Lehman–March 2009 trough, the market rebounded while financials and cyclicals that had been annihilated in 2008 (the losers) led the rally. Losers +163% versus winners +8% over three months is not a failure of the ranking signal’s logic—it is exactly what written-call exposure predicts.

January 2001 (−49% WML) is instructive as a partial exception to the “deep bear” pattern: the trailing two-year market was still positive (+10.7%), but the tech bust had created an industry-concentrated loser cohort (dot-coms) whose rebound dynamics differed. The paper’s instrument still captures many such months via elevated variance even when the 24-month market sign is ambiguous.

### Why losers look like calls in bear markets

Mechanism sketch consistent with the beta estimates:

1. **Selection**: a 12-2 loser sort after a bear market concentrates firms with high operational and financial leverage, distressed equity, and equity that is economically an option on firm assets (Merton 1974).
2. **Beta shift**: as the market falls further, those equities approach zero and betas can compress; when the market reverses, the same names’ equity betas spike because a small change in asset value maps to a large change in deep-OTM equity.
3. **Crowding / covering**: momentum managers are systematically short these names; covering into a rebound amplifies the move (not formally identified in the paper, but consistent with clustering).

The Table 4 decomposition shows the call-like behavior is **in the loser leg**, not an artifact of winners becoming defensive. Winners’ bear-market up-beta interaction is negative but smaller in magnitude than losers’ positive interaction.

### Dynamic strategy design details

Appendix C solves a classic Merton-style portfolio problem for maximizing the unconditional Sharpe of a strategy that can rescale a single risky payoff each period. If conditional Sharpe $s_t = \mu_t/\sigma_t$ varies, optimal policy does **not** simply hold constant volatility; it holds volatility proportional to $s_t$, i.e., $w_t \propto \mu_t/\sigma_t^2$.

Implementation choices that matter in production:

- **Mean forecast**: use only lagged information—$I_{B,t-1}$ and $\hat\sigma^2_{m,t-1}$ (and their product). Full-sample estimation of $\gamma$ coefficients overstates OOS performance; expanding-window estimation is the honest implementable version (Table 7 “dyn, out-of-sample”).
- **Variance forecast**: 126-day WML realized variance is intentionally matched to the mean-forecast horizon conventions; both mean and variance channels contribute (Appendix D).
- **Normalization**: choose scalar $c$ so that average absolute exposure or average volatility matches the static WML’s, making Sharpe comparisons apples-to-apples.
- **Nested performance**: cvol captures the $\sigma$ channel alone; full dynamic adds the $\mu$ channel. Appraisal ratios in Table 7 show each step adds material Treynor–Black information ratio.

### Relation to prior literature (quantitative)

| Paper | Finding | Daniel–Moskowitz incremental |
|-------|---------|------------------------------|
| Jegadeesh–Titman 1993 | ~1%/month WML 1965–89 | Extends to 1927–2013; focuses on crashes |
| Cooper–Gutierrez–Hameed 2004 | Momentum premium depends on 36m market state | Adds optionality decomposition + vol interaction |
| Stivers–Sun 2010 | Momentum low when vol high | Interacts vol with bear state; dynamic policy |
| Grundy–Martin 2001 | Momentum betas vary with market | Quantifies written-call asymmetry in bears |
| Barroso–Santa-Clara 2015 | Vol-managed momentum | Related cvol idea; DM add mean forecast theory |
| Daniel–Moskowitz | Crashes forecastable; dynamic doubles SR | This paper |

Barroso–Santa-Clara’s volatility-managed momentum is a close cousin of the cvol strategy here. Daniel–Moskowitz’s contribution is the **joint** mean–variance dynamic policy grounded in Sharpe-maximization theory, the optionality identification, and the cross-asset universality.

### International and asset-class magnitudes (qualitative–quantitative)

Table 9 panels show that non-US equity WML portfolios also load negatively on $I_B \times R_m$ in up-markets within bears. Japan’s unconditional $\alpha$ is often insignificant (momentum is weak in Japan historically), yet the crash-state interaction remains signed as in the US—important for risk systems even when the alpha case is weaker.

Table 10 AMP-style strategies:

- FX carry/momentum and commodity momentum exhibit negative skewness and panic-state drawdowns analogous to equity WML.
- Fixed-income momentum crashes are milder in some samples but still show elevated loser “optionality” when rates rebound from stress.

Table 11: applying the same $w \propto \hat\mu/\hat\sigma^2$ rule inside each asset class improves Sharpe; a diversified multi-asset dynamic momentum book further reduces the impact of any single crash month because 1932-equity-type and 2008–09-credit-type events are imperfectly aligned with, e.g., FX momentum crashes.

### Risk management checklist derived from the paper

1. **Daily monitor**: trailing 126d market variance; 24m market cumulative return; estimated WML $\beta$ on recent up-days vs down-days.
2. **Hard risk limit**: cut gross exposure when $I_B=1$ and $\hat\sigma_m$ is above its historical 80th percentile, even if the mean forecast has not yet turned negative.
3. **Stress test**: replay 1932:07–08 and 2009:03–05 on today’s loser constituency; if projected WML loss exceeds budget, reduce short-loser risk.
4. **Do not average crash months into “expected return”** without a mixture model: $E[r] = (1-p)E[r|\mathrm{normal}] + p E[r|\mathrm{crash}]$ with $E[r|\mathrm{crash}]$ on the order of −30% to −70% monthly.
5. **Capacity**: dynamic strategy sometimes wants *more* leverage in calm bull markets when $\hat\mu/\hat\sigma^2$ is high—capacity and borrow availability must be checked in both directions.

### Statistical footnotes for replication

- Newey–West / HAC t-stats on monthly regressions; daily regressions in Table 6 use appropriately scaled variance-swap returns (factor 25,200 = 252×100 mentioned in table notes).
- Skewness for WML uses $\log(1+r_{\mathrm{WML}}+r_f)$ construction to handle the zero-investment portfolio.
- Cumulative long-short returns use the Appendix A.1 methodology (important when plotting multi-month crash windows).

### What the paper does *not* claim

- It does not claim momentum is fully explained by rational option pricing of distressed equity.
- It does not claim dynamic weighting eliminates negative skewness—skewness improves but left-tail events can still occur if instruments fail.
- It does not provide a structural general-equilibrium model; the contribution is empirical asset pricing and portfolio construction.

### Synthesis for Paleologo-style application

In a multi-factor quant equity book, momentum should be:

- **Sized** by trailing strategy volatility and by a panic-state expected-return scalar;
- **Hedged** for market beta conditionally (especially size and market when losers’ betas diverge);
- **Attributed** in a state-contingent P&L framework;
- **Combined** with value (which often hedges momentum crashes—Asness–Moskowitz–Pedersen) because value tends to hold the cheap losers that momentum shorts, providing natural crash diversification when both are risk-balanced.

The headline number to remember: static WML Sharpe ≈ **0.7** with catastrophic skewness; dynamic/cvol Sharpe ≈ **1.0–1.4** with still-manageable but smaller crash exposure; written-call beta in bear up-markets ≈ **−0.7 to −1.5** incremental.

---

## Additional Equations and Formalism

Bear-market optionality regression (decile $i$):

$$
\tilde R^e_{i,t}=\alpha_0+\alpha_B I_{B,t-1}+\bigl[\beta_0+I_{B,t-1}(\beta_B+I_{U,t}\beta_{B,U})\bigr]\tilde R^e_{m,t}+\varepsilon_t.
$$

Panic-state mean model:

$$
E_{t-1}[\tilde R^{\mathrm{WML}}_t]=\gamma_0+\gamma_{\mathrm{int}} I_{B,t-1}\hat\sigma^2_{m,t-1}.
$$

Optimal weight (up to risk aversion / leverage cap $\bar w$):

$$
w_t=\mathrm{clip}\!\left(\frac{1}{\gamma}\frac{\hat\mu_{t-1}}{\hat\sigma^2_{t-1}},\,-\bar w,\bar w\right).
$$

Appraisal ratio of strategy $A$ vs benchmark $B$:

$$
\mathrm{AR}=\frac{\alpha_A}{\sigma(\varepsilon_A)}\sqrt{12},\quad
\tilde R^A_t=\alpha_A+\beta\tilde R^B_t+\varepsilon_t.
$$

---

## Detailed Sample Construction Notes

US common stocks on CRSP; delisting returns handled per standard momentum literature (often incorporating CRSP delisting codes). Skip-month convention avoids one-month reversal (Jegadeesh 1990; Lehmann 1990). Value-weighting within deciles reduces microstructure noise relative to equal-weight extreme-loser strategies that can be dominated by pennies.

For international equities, country-level implementations typically use local-currency or USD returns consistently; AMP portfolios are already published constructs, which helps mitigate data-snooping relative to reinventing signals.

Variance-swap returns (Table 6) are synthesized from VIX / realized variance as detailed in Appendix A.2—readers replicating should not substitute raw $\Delta\mathrm{VIX}$ without the swap P&L scaling.

---

## Conclusion (Expanded)

Momentum crashes are not an embarrassing footnote to an anomaly; they are the central risk characteristic of the strategy. Daniel and Moskowitz formalize that characteristic as **time-varying, asymmetric market exposure concentrated in the short-loser leg during bear-market rallies**, show that simple instruments forecast the associated low expected returns, and deliver a theory-consistent dynamic overlay that roughly doubles risk-adjusted performance without being spanned by static momentum or by volatility targeting alone. The results generalize beyond US equities. Any institutional deployment of momentum that ignores panic-state scaling is leaving both Sharpe and survival probability on the table.


---

## Replication Priorities and Open Empirics

If rebuilding the result set from CRSP:

1. Confirm Table 1 moments to within sampling noise (WML mean ~18% ann., vol ~30%, skewness highly negative).
2. Reproduce Table 2 crash list—dates should match exactly if construction matches.
3. Estimate Table 3 specification (4); $\beta_{B,U}$ should be ~−0.7 with $|t|>4$.
4. Build expanding-window dynamic weights; verify OOS Sharpe ≫ static.
5. Stress: force $w_t=0$ whenever $I_B=1$ and compare to continuous $\mu/\sigma^2$ scaling—binary shutdown usually underperforms continuous scaling because it discards non-crash bear months where momentum can still earn alpha.

Open empirics since 2016 (for the reader’s research agenda, not in the paper): post-2013 live performance of vol-managed momentum; interaction with the investment and profitability factors in Fama–French five- and six-factor models; ETF and futures implementation of dynamic WML to sidestep stock-loan constraints on losers.

---

## Final Numerical Digest

| Quantity | Value |
|----------|-------|
| WML ann. excess return (1927–2013) | ~17.9% |
| WML ann. volatility | ~30% |
| WML Sharpe | ~0.60–0.71 |
| WML market alpha | ~22% ann. ($t\sim 7$) |
| WML unconditional β | ~−0.58 |
| WML monthly log skewness | ~−4.7 |
| Worst month | −74% (1932:08) |
| Bear+up incremental β | ~−0.8 ($t\sim-4.5$) |
| Static vs cvol Sharpe (1934–2013) | 0.68 → 1.04 |
| Dynamic improvement | ~2× Sharpe/alpha (abstract) |
| Variance risk price hedge | does **not** restore panic-state profits |

These numbers are the operational heart of the paper for portfolio construction.
