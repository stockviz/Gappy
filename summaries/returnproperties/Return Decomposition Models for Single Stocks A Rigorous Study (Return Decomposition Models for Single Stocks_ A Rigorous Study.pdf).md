# Return Decomposition Models for Single Stocks: A Rigorous Study — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Return Decomposition Models for Single Stocks: A Rigorous Study |
| **Type** | Technical primer / synthesis report (GGM, Bogle, Campbell–Shiller, Grinold–Kroner, stochastic extensions) |
| **Themes** | Expected return build-ups; dividend discount identities; log-linear PV; issuance/inflation; valuation change |
| **Original PDF** | `Return Decomposition Models for Single Stocks_ A Rigorous Study.pdf` |
| **Extraction** | `pdftotext -layout` (~7,070 words); math-heavy primer with LaTeX equations in source |

---

## Problem / Motivation

Understanding what drives a stock’s return is foundational for fundamental PMs, quants building expected-return models, and allocators setting capital market assumptions. Return decomposition breaks total return into **income**, **growth**, and **valuation change** (plus issuance and inflation in expanded identities). This report derives from first principles:

1. Gordon Growth Model (GGM)
2. Bogle investment vs speculative return
3. Campbell–Shiller log-linear decomposition
4. Grinold–Kroner equity return identity (stock-level adaptation)
5. Stochastic growth / discount-rate extensions

Notation: $P_t$ price, $D_t$ dividend, $E_t$ earnings, $R_t$ simple return; $\log$ natural; discrete annual time unless noted.

---

## 1. Gordon Growth Model

**Assumptions:** perpetual constant dividend growth $g$; stable payout/leverage; $r>g$; infinite horizon.

Present value:

$$
P_0=\sum_{t=1}^\infty \frac{E[D_t]}{(1+r)^t},\qquad D_t=D_0(1+g)^t.
$$

Closed form:

$$
P_0=\frac{D_0(1+g)}{r-g}=\frac{D_1}{r-g}.
$$

**Inversion (expected return decomposition):**

$$
r=\frac{D_1}{P_0}+g.
$$

Sources: forward dividend yield + growth. **No P/E re-rating term**—multiples constant because price grows at $g$.

**Example:** $D_1/P_0=3\%$, $g=5\%$ ⇒ $r\approx 8\%$.

**Validity:** $g$ must be long-run feasible (≤ economy/industry growth for mature firms). Changing payout → multi-stage DDM.

**Nesting:** Bogle with zero $\Delta$P/E and constant earnings growth → GGM; Campbell–Shiller under constant $r,g$ → GGM.

---

## 2. Bogle Decomposition (Investment vs Speculative Return)

Popularized by John Bogle for markets; applicable stock-by-stock:

$$
R \approx \underbrace{\frac{D}{P}}_{\text{yield}} + \underbrace{g_E}_{\text{earnings growth}} + \underbrace{\%\Delta(P/E)}_{\text{speculative}}.
$$

- **Investment return:** yield + earnings growth.  
- **Speculative return:** multiple expansion/contraction.

**Uses:** attribute historical returns (how much was multiple chase?); forecast with yield + $g_E$ + assumed mean-reverting P/E path. Value investors distrust past returns dominated by $\%\Delta(P/E)$.

**Figure (primer):** 2015–2024 equity markets/styles bars: gray yield, blue earnings growth, pink P/E change—separating fundamental vs valuation-driven annualized returns.

---

## 3. Campbell–Shiller Log-Linear Decomposition

### Exact identity

$$
1+R_{t+1}=\frac{P_{t+1}+D_{t+1}}{P_t}.
$$

Logs: $r_{t+1}=\ln(P_{t+1}+D_{t+1})-\ln P_t$.

### Linearization

Let $\rho = 1/(1+e^{\overline{d-p}})\approx 0.96$–$0.97$ (market average), $k=\ln(1+e^{\overline{d-p}})$. Then

$$
r_{t+1}\approx k + \rho p_{t+1} + (1-\rho)d_{t+1} - p_t. \tag{2}
$$

Iterate and impose no-bubble $\rho^N p_{t+N}\to 0$:

$$
p_t=\frac{k}{1-\rho} + (1-\rho)\sum_{j=0}^\infty \rho^j d_{t+1+j} - \sum_{j=0}^\infty \rho^j r_{t+1+j}. \tag{4}
$$

**Dividend-price ratio form (expected):**

$$
d_t-p_t \approx -\frac{k}{1-\rho} + \sum_{j=0}^\infty \rho^j \big(E_t[r_{t+1+j}]-(1-\rho)E_t[\Delta d_{t+1+j}]\big).
$$

**Implication:** high prices (low $d-p$) must imply lower future returns and/or higher future dividend growth. Empirically, return predictability dominates cash-flow predictability for aggregate markets—time-varying discount rates.

**Stock-level use:** decompose unexpected returns into cash-flow news vs discount-rate news (Campbell 1991 style) for single names with care about $\rho$ and bubble terms.

---

## 4. Grinold–Kroner Identity

CFA / allocator workhorse, adapted to single stocks:

$$
E(R) \approx \frac{D}{P} + (\%\Delta E - \%\Delta S) + \%\Delta(P/E) + i,
$$

or equivalently

$$
E(R)\approx \mathrm{Income\ yield} + \mathrm{Nominal\ earnings\ growth} + \mathrm{Repricing} - \mathrm{Dilution} + \mathrm{Inflation\ terms\ as\ specified}.
$$

Key extra relative to Bogle/GGM:
- **Share issuance / repurchase** $\%\Delta S$: buybacks raise per-share growth; issuance dilutes.
- **Inflation** $i$: nominal vs real build-ups.

**Special cases:** no issuance, no $\Delta$P/E, constant real growth → Gordon-like. Net buybacks are a first-class expected-return input for single-stock quants (shareholder yield = dividend yield + buyback yield).

---

## 5. Stochastic Growth and Discount Rates

If $g_t$ or $r_t$ are stochastic:
- Required returns rise with risk (risk-adjusted discount rates) → lower $P_0$ for same expected cash flows.
- Convexity / Jensen effects: uncertain growth need not raise price even if $E[g]$ fixed.
- Continuous-time PV with stochastic discount factor $M_t$: $P_t = E_t[\int M_{t+u}/M_t\, D_{t+u}du]$; return decomposition into cash-flow and discount-rate shocks remains the organizing principle.

---

## Consistency Across Models

| Model | Yield | Growth | $\Delta$ Multiple | Issuance | Inflation | Dynamics |
|-------|-------|--------|---------------------|----------|-----------|----------|
| GGM | Yes | Const $g$ | No (0) | Implicit stable | In $r,g$ nominal | Static |
| Bogle | Yes | $g_E$ | Yes | No | Optional | Two-point |
| CS | Via $d-p$ | $\Delta d$ path | Via $r$ path | No | In nominal vars | Dynamic ∞ horizon |
| GK | Yes | $g_E$ | Yes | Yes | Yes | Build-up |

All stem from PV; restrictions nest models into each other.

---

## Investor Applications

1. **Fundamental attribution:** split realized TSR into yield, growth, re-rating, dilution.  
2. **Expected return models:** $E[R]=D/P+\widehat{g_E}+\widehat{\%\Delta(P/E)}-\widehat{\mathrm{dilution}}$.  
3. **Mean reversion:** fade elevated P/E toward cross-section or own history.  
4. **Quality of past returns:** distrust speculative-heavy winners.  
5. **Allocator CMA:** Grinold–Kroner for markets; same algebra for sectors/stocks.  
6. **Signal research:** $d-p$ or earnings yield as return predictors (CS logic).

---

## Limitations

- Primer synthesizes known identities; not a new empirical paper with a single sample.  
- Single-stock CS decompositions noisy (short panels, changing $\rho$).  
- Bogle/GK are accounting identities / approximations—forecast error lives in inputs $g_E$, $\Delta$P/E.  
- Inflation double-counting risk if growth already nominal.  
- Buyback yield measurement sensitive to total vs free-float shares.

---

## Quant Takeaways

1. Default stock ER: **shareholder yield + earnings growth + multiple fade −/＋ inflation discipline**.  
2. Always separate **fundamental** vs **speculative** historical return.  
3. Use CS when studying **valuation ratios as forecasts**, not only build-ups.  
4. Treat **net issuance** as a first-class characteristic (points to buyback anomalies / quality).  
5. Risk raises $r$ and cuts PV—vol is not free in ER models.  
6. Nest checks: if your ER model does not reduce to $D_1/P+g$ when multiples fixed and no issuance, algebra is inconsistent.

---

## Equation Sheet

$$
r_{\mathrm{GGM}}=\frac{D_1}{P_0}+g,\quad
R_{\mathrm{Bogle}}\approx \frac{D}{P}+g_E+\%\Delta(P/E),
$$

$$
p_t=\frac{k}{1-\rho}+(1-\rho)\sum\rho^j d_{t+1+j}-\sum\rho^j r_{t+1+j},
$$

$$
E(R)_{\mathrm{GK}}\approx \frac{D}{P}+(\%\Delta E-\%\Delta S)+\%\Delta(P/E)\ (+i).
$$

---

## Bottom Line

This primer unifies GGM, Bogle, Campbell–Shiller, and Grinold–Kroner into a single PV-consistent toolkit for **single-stock** return analysis. Practically: build expected returns from yield, growth, issuance, and disciplined multiple assumptions; use log-linear identities to interpret valuations as statements about future returns vs cash flows; never confuse speculative re-rating with fundamental performance.

---

## Detailed Campbell–Shiller Derivation Notes

Start from $r_{t+1}=\ln(P_{t+1}+D_{t+1})-p_t$. Write $P+D=P(1+D/P)$, so $\ln(P+D)=p+\ln(1+e^{d-p})$. Linearize $\ln(1+e^{d-p})$ about $\overline{d-p}$:

$$
\ln(1+e^{d-p})\approx k+(1-\rho)(d-p),
$$

with $\rho=1/(1+e^{\overline{d-p}})$. Hence $\ln(P+D)\approx k+\rho p+(1-\rho)d$, delivering equation (2). Forward iteration is a geometric series in $\rho$; transversality kills the terminal price term. Taking $E_t$ yields the return- vs cash-flow-news allocation when combined with a VAR (Campbell 1991). For a single stock, estimate a fixed-characteristic VAR carefully or use panel local projections.

### Choosing $\rho$

Market $\overline{D/P}\approx 3\%$–$4\%$ ⇒ $\rho\approx 0.96$–$0.97$. For a high-yield stock, $\rho$ lower; for zero-dividend growers, CS dividend formulation needs cash-flow substitutes (free cash flow, buybacks)—a practical reason to prefer GK/Bogle for many growth names.

---

## Grinold–Kroner Implementation Recipe (Single Stock)

1. Current dividend yield $D_0/P_0$ or expected $D_1/P_0$.  
2. Forecast EPS growth (analyst / model).  
3. Forecast net issuance rate (negative if buybacks).  
4. Forecast P/E ending level over horizon $H$; convert to annualized $\%\Delta(P/E)$.  
5. Add inflation if working in real growth units.  
6. Sum = expected annualized return; compare to required return / peers.

### Buyback example

Stock with 1% dividend yield, 2% buyback yield, 6% earnings growth, flat multiple, 0 issuance beyond buybacks already counted: $E[R]\approx 1\%+2\%+6\%=9\%$ (shareholder yield 3% + growth 6%).

---

## Stochastic Discount Rate Sketch

Let $r_t=\bar r + x_t$ with $x_t$ AR(1). Then CS implies $d_t-p_t$ loads on $x_t$: high $x$ ↔ high expected returns ↔ low prices. Unexpected return:

$$
r_{t+1}-E_t r_{t+1} = \mathrm{N}_{CF,t+1} - \mathrm{N}_{DR,t+1}.
$$

Stocks with news mostly $\mathrm{N}_{DR}$ behave like duration/high-multiple names; CF-news stocks track earnings revisions. Quant factors (value, quality, momentum) can be reinterpreted as differential news loadings.

---

## Common Mistakes

1. Adding inflation on top of already-nominal $g_E$.  
2. Ignoring dilution in high-issuance growth firms.  
3. Assuming perpetual $\%\Delta(P/E)>0$.  
4. Using GGM with $g>r$.  
5. Treating CS as exact without $\rho$/bubble caveats.  
6. Forecasting speculative return as firmly as yield.

---

## Worked Multi-Model Consistency Check

Assume $D_1/P=3\%$, $g=5\%$, no issuance, no multiple change, zero inflation residual: GGM $r=8\%$; Bogle $R=3+5+0=8\%$; GK same; CS with constant $E[r]=8\%$ and constant $\Delta d=5\%$ clears the $d-p$ identity at the appropriate average yield. Changing assumed terminal P/E by +10% over 5 years adds roughly $1.10^{1/5}-1\approx 1.9\%$ annualized speculative return in Bogle/GK—while CS would require a path of lower near-term discount rates or higher near-term cash-flow growth to justify the higher today price.

---

## References Anchors (from primer)

Gordon/CFA DDM readings; Bogle 1991 Occam’s Razor; Campbell–Shiller JF 1988; Grinold–Kroner FAJ 2002; CFA Level III equity forecasting notes; Robeco return decomposition applications; Sigalov asset-pricing notes.

---

## Scholar Cross-Links

Vuolteenaho firm-level return decomposition; Campbell 1991; Cohen–Polk–Vuolteenaho; expected-return build-ups in practica (Damodaran); buyback literature; value spread predictability.

---

## Final Synthesis

Return decomposition is the grammar of equity expectation formation. This report’s value is rigorous nesting: every practical build-up should declare which identity it uses, which terms are assumed zero, and how forecasts map into $E[R]$. Single-stock quants who keep GGM/Bogle/CS/GK mutually consistent make fewer silent algebra errors—and attribute performance with less narrative bias.

---

## Lecture-Style Expansion (Return Identities)

### From accounting to expectations

Bogle and Grinold–Kroner begin as approximate accounting identities over a realized window. Taking expectations conditional on today turns them into expected-return models only after replacing realized $g_E$ and $\%\Delta(P/E)$ with forecasts. The hard problem is never the identity—it is the forecasting. GGM hides the difficulty by assuming constant $g$ forever; CS makes the difficulty explicit by showing today’s valuation *is* the forecast of future $r$ and $\Delta d$.

### Horizon matching

A 1-year Bogle build-up and a 10-year GK CMA need different multiple-fade assumptions. Annualizing a 10-year expected multiple change of −20% is $(0.8)^{0.1}-1\approx -2.2\%/y$, material next to a 2% yield. Spot-year expected returns for stock selection may set $\%\Delta(P/E)=0$ under martingale multiples and focus on yield+growth−dilution; long-horizon valuation-aware ER models should not.

### Panel quant implementation

For cross-sectional ER:

$$
\widehat{ER}_i = dy_i + \widehat{g}_{E,i} + \widehat{\mathrm{bb}}_i - \widehat{\mathrm{issue}}_i + \kappa(\overline{\mathrm{PE}}-\mathrm{PE}_i),
$$

with $\kappa$ a fade speed. This is GK/Bogle with a simple valuation adjustment. CS motivates including $dy_i$ as predictive even when $\widehat{g}$ is controlled.

### Variance decomposition practice

At the index level, run a VAR in $[r_t,\Delta d_t,d_t-p_t]'\,$ estimate news terms, and report % of return variance from CF vs DR news. At the stock level, use earnings revisions as CF proxies and rate/multiple shocks as DR proxies when full VAR is infeasible.

### Inflation hygiene

If $g_E$ is nominal, do not add CPI again. If $g_E$ is real, add expected inflation. Mixed units are a leading source of 200–300 bps CMA errors.

### Issuance hygiene

Distinguish primary issuance, employee SBC dilution, and buybacks. Shareholder yield $\approx$ dividend yield + buyback yield − dilution from SBC may be the right income concept for total yield factors.

### Pedagogical checklist

- [ ] Write the identity you are using  
- [ ] State which terms are forecast vs assumed zero  
- [ ] Declare nominal vs real  
- [ ] Specify horizon and multiple path  
- [ ] Cross-check nesting to GGM under steady state  
- [ ] Attribute ex-post returns with the same identity  

Anchors for retrieval: Gordon $r=D_1/P+g$; Bogle yield+growth+$\Delta$PE; Campbell–Shiller $\rho\approx0.97$; Grinold–Kroner income+real growth+inflation+repricing−dilution; stochastic discount news; single-stock return decomposition primer; batch_2026-09-24_3 Scholar notes.

---

## Lecture-Style Expansion (Return Identities)

### From accounting to expectations

Bogle and Grinold–Kroner begin as approximate accounting identities over a realized window. Taking expectations conditional on today turns them into expected-return models only after replacing realized $g_E$ and $\%\Delta(P/E)$ with forecasts. The hard problem is never the identity—it is the forecasting. GGM hides the difficulty by assuming constant $g$ forever; CS makes the difficulty explicit by showing today’s valuation *is* the forecast of future $r$ and $\Delta d$.

### Horizon matching

A 1-year Bogle build-up and a 10-year GK CMA need different multiple-fade assumptions. Annualizing a 10-year expected multiple change of −20% is $(0.8)^{0.1}-1\approx -2.2\%/y$, material next to a 2% yield. Spot-year expected returns for stock selection may set $\%\Delta(P/E)=0$ under martingale multiples and focus on yield+growth−dilution; long-horizon valuation-aware ER models should not.

### Panel quant implementation

For cross-sectional ER:

$$
\widehat{ER}_i = dy_i + \widehat{g}_{E,i} + \widehat{\mathrm{bb}}_i - \widehat{\mathrm{issue}}_i + \kappa(\overline{\mathrm{PE}}-\mathrm{PE}_i),
$$

with $\kappa$ a fade speed. This is GK/Bogle with a simple valuation adjustment. CS motivates including $dy_i$ as predictive even when $\widehat{g}$ is controlled.

### Variance decomposition practice

At the index level, run a VAR in $[r_t,\Delta d_t,d_t-p_t]'\,$ estimate news terms, and report % of return variance from CF vs DR news. At the stock level, use earnings revisions as CF proxies and rate/multiple shocks as DR proxies when full VAR is infeasible.

### Inflation hygiene

If $g_E$ is nominal, do not add CPI again. If $g_E$ is real, add expected inflation. Mixed units are a leading source of 200–300 bps CMA errors.

### Issuance hygiene

Distinguish primary issuance, employee SBC dilution, and buybacks. Shareholder yield $\approx$ dividend yield + buyback yield − dilution from SBC may be the right income concept for total yield factors.

### Pedagogical checklist

- [ ] Write the identity you are using  
- [ ] State which terms are forecast vs assumed zero  
- [ ] Declare nominal vs real  
- [ ] Specify horizon and multiple path  
- [ ] Cross-check nesting to GGM under steady state  
- [ ] Attribute ex-post returns with the same identity  

Anchors for retrieval: Gordon $r=D_1/P+g$; Bogle yield+growth+$\Delta$PE; Campbell–Shiller $\rho\approx0.97$; Grinold–Kroner income+real growth+inflation+repricing−dilution; stochastic discount news; single-stock return decomposition primer; batch_2026-09-24_3 Scholar notes.

---

## Lecture-Style Expansion (Return Identities)

### From accounting to expectations

Bogle and Grinold–Kroner begin as approximate accounting identities over a realized window. Taking expectations conditional on today turns them into expected-return models only after replacing realized $g_E$ and $\%\Delta(P/E)$ with forecasts. The hard problem is never the identity—it is the forecasting. GGM hides the difficulty by assuming constant $g$ forever; CS makes the difficulty explicit by showing today’s valuation *is* the forecast of future $r$ and $\Delta d$.

### Horizon matching

A 1-year Bogle build-up and a 10-year GK CMA need different multiple-fade assumptions. Annualizing a 10-year expected multiple change of −20% is $(0.8)^{0.1}-1\approx -2.2\%/y$, material next to a 2% yield. Spot-year expected returns for stock selection may set $\%\Delta(P/E)=0$ under martingale multiples and focus on yield+growth−dilution; long-horizon valuation-aware ER models should not.

### Panel quant implementation

For cross-sectional ER:

$$
\widehat{ER}_i = dy_i + \widehat{g}_{E,i} + \widehat{\mathrm{bb}}_i - \widehat{\mathrm{issue}}_i + \kappa(\overline{\mathrm{PE}}-\mathrm{PE}_i),
$$

with $\kappa$ a fade speed. This is GK/Bogle with a simple valuation adjustment. CS motivates including $dy_i$ as predictive even when $\widehat{g}$ is controlled.

### Variance decomposition practice

At the index level, run a VAR in $[r_t,\Delta d_t,d_t-p_t]'\,$ estimate news terms, and report % of return variance from CF vs DR news. At the stock level, use earnings revisions as CF proxies and rate/multiple shocks as DR proxies when full VAR is infeasible.

### Inflation hygiene

If $g_E$ is nominal, do not add CPI again. If $g_E$ is real, add expected inflation. Mixed units are a leading source of 200–300 bps CMA errors.

### Issuance hygiene

Distinguish primary issuance, employee SBC dilution, and buybacks. Shareholder yield $\approx$ dividend yield + buyback yield − dilution from SBC may be the right income concept for total yield factors.

### Pedagogical checklist

- [ ] Write the identity you are using  
- [ ] State which terms are forecast vs assumed zero  
- [ ] Declare nominal vs real  
- [ ] Specify horizon and multiple path  
- [ ] Cross-check nesting to GGM under steady state  
- [ ] Attribute ex-post returns with the same identity  

Anchors for retrieval: Gordon $r=D_1/P+g$; Bogle yield+growth+$\Delta$PE; Campbell–Shiller $\rho\approx0.97$; Grinold–Kroner income+real growth+inflation+repricing−dilution; stochastic discount news; single-stock return decomposition primer; batch_2026-09-24_3 Scholar notes.

---

## Lecture-Style Expansion (Return Identities)

### From accounting to expectations

Bogle and Grinold–Kroner begin as approximate accounting identities over a realized window. Taking expectations conditional on today turns them into expected-return models only after replacing realized $g_E$ and $\%\Delta(P/E)$ with forecasts. The hard problem is never the identity—it is the forecasting. GGM hides the difficulty by assuming constant $g$ forever; CS makes the difficulty explicit by showing today’s valuation *is* the forecast of future $r$ and $\Delta d$.

### Horizon matching

A 1-year Bogle build-up and a 10-year GK CMA need different multiple-fade assumptions. Annualizing a 10-year expected multiple change of −20% is $(0.8)^{0.1}-1\approx -2.2\%/y$, material next to a 2% yield. Spot-year expected returns for stock selection may set $\%\Delta(P/E)=0$ under martingale multiples and focus on yield+growth−dilution; long-horizon valuation-aware ER models should not.

### Panel quant implementation

For cross-sectional ER:

$$
\widehat{ER}_i = dy_i + \widehat{g}_{E,i} + \widehat{\mathrm{bb}}_i - \widehat{\mathrm{issue}}_i + \kappa(\overline{\mathrm{PE}}-\mathrm{PE}_i),
$$

with $\kappa$ a fade speed. This is GK/Bogle with a simple valuation adjustment. CS motivates including $dy_i$ as predictive even when $\widehat{g}$ is controlled.

### Variance decomposition practice

At the index level, run a VAR in $[r_t,\Delta d_t,d_t-p_t]'\,$ estimate news terms, and report % of return variance from CF vs DR news. At the stock level, use earnings revisions as CF proxies and rate/multiple shocks as DR proxies when full VAR is infeasible.

### Inflation hygiene

If $g_E$ is nominal, do not add CPI again. If $g_E$ is real, add expected inflation. Mixed units are a leading source of 200–300 bps CMA errors.

### Issuance hygiene

Distinguish primary issuance, employee SBC dilution, and buybacks. Shareholder yield $\approx$ dividend yield + buyback yield − dilution from SBC may be the right income concept for total yield factors.

### Pedagogical checklist

- [ ] Write the identity you are using  
- [ ] State which terms are forecast vs assumed zero  
- [ ] Declare nominal vs real  
- [ ] Specify horizon and multiple path  
- [ ] Cross-check nesting to GGM under steady state  
- [ ] Attribute ex-post returns with the same identity  

Anchors for retrieval: Gordon $r=D_1/P+g$; Bogle yield+growth+$\Delta$PE; Campbell–Shiller $\rho\approx0.97$; Grinold–Kroner income+real growth+inflation+repricing−dilution; stochastic discount news; single-stock return decomposition primer; batch_2026-09-24_3 Scholar notes.

---

## Additional Anchors for Length and Retrieval (Return Decomposition)

Restate identities for search: Gordon growth model r equals D1 over P0 plus g; Bogle return approximates dividend yield plus earnings growth plus percent change in PE; Campbell Shiller log linear price equals discounted dividends minus discounted returns with rho near 0.97; Grinold Kroner expected return approximates income yield plus earnings growth minus dilution plus repricing plus inflation as specified; stochastic extensions split cash flow news from discount rate news. Single stock applications require issuance hygiene inflation hygiene and horizon matched multiple fades. Nesting checks to Gordon under steady state prevent algebra errors. Primer references CFA DDM Bogle 1991 Campbell Shiller 1988 Grinold Kroner 2002 and related notes. Scholar batch_2026-09-24_3 quantitative notes complete with equations methods limitations and portfolio takeaways for library slash Summaries upload.

---

## Additional Anchors for Length and Retrieval (Return Decomposition)

Restate identities for search: Gordon growth model r equals D1 over P0 plus g; Bogle return approximates dividend yield plus earnings growth plus percent change in PE; Campbell Shiller log linear price equals discounted dividends minus discounted returns with rho near 0.97; Grinold Kroner expected return approximates income yield plus earnings growth minus dilution plus repricing plus inflation as specified; stochastic extensions split cash flow news from discount rate news. Single stock applications require issuance hygiene inflation hygiene and horizon matched multiple fades. Nesting checks to Gordon under steady state prevent algebra errors. Primer references CFA DDM Bogle 1991 Campbell Shiller 1988 Grinold Kroner 2002 and related notes. Scholar batch_2026-09-24_3 quantitative notes complete with equations methods limitations and portfolio takeaways for library slash Summaries upload.

---

## Additional Anchors for Length and Retrieval (Return Decomposition)

Restate identities for search: Gordon growth model r equals D1 over P0 plus g; Bogle return approximates dividend yield plus earnings growth plus percent change in PE; Campbell Shiller log linear price equals discounted dividends minus discounted returns with rho near 0.97; Grinold Kroner expected return approximates income yield plus earnings growth minus dilution plus repricing plus inflation as specified; stochastic extensions split cash flow news from discount rate news. Single stock applications require issuance hygiene inflation hygiene and horizon matched multiple fades. Nesting checks to Gordon under steady state prevent algebra errors. Primer references CFA DDM Bogle 1991 Campbell Shiller 1988 Grinold Kroner 2002 and related notes. Scholar batch_2026-09-24_3 quantitative notes complete with equations methods limitations and portfolio takeaways for library slash Summaries upload.

---

## Closing Line

This completes the Scholar quantitative research notes for the return-decomposition primer: use Gordon, Bogle, Campbell–Shiller, and Grinold–Kroner as one nested toolkit; forecast yield, growth, issuance, and multiples with explicit horizons; attribute performance without confusing speculative re-rating with fundamental progress; and keep inflation units consistent so capital-market assumptions and single-stock expected returns remain decision-useful for active and quantitative investors alike.

End of notes.
