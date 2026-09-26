# Presidential Address: Discount Rates — Cochrane (2011) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Presidential Address: Discount Rates |
| **Author** | John H. Cochrane (Chicago Booth; NBER); AFA President 2010 |
| **Journal** | *Journal of Finance*, Vol. LXVI, No. 4, August 2011, pp. 1047–1108 |
| **Type** | AFA Presidential Address / survey-agenda article |
| **Core thesis** | Discount-rate variation is the central organizing question of contemporary asset-pricing research |
| **Original PDF** | `AbnormalReturnsDiscountRates_Cochrane_2011.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsMGM2NVB4Y3oyWWs` |
| **Extraction** | `pdftotext -layout`; clean text |

Thanks: Campbell, Constantinides, Diamond, Fama, He, Kelly, Linnainmaa, Moskowitz, Pastor, Piazzesi, Seru, Viceira, Zhang, Zhou; CRSP support; RA Yoshio Nozawa.

---

## Problem / Motivation

Forty years earlier, Fama (1970) organized finance around the **expected** part of “expected discounted cashflows”—testing market efficiency. Cochrane argues the field’s organizing principle today is the **discounted** part: **time-varying and cross-sectionally varying discount rates (risk premia / expected returns)**.

Previously: returns roughly unpredictable; price–dividend variation attributed to expected cashflow variation; CAPM explained the cross-section. Now: essentially **all** price–dividend variation corresponds to discount-rate variation; a “zoo” of new factors has replaced a simple CAPM. The address surveys **facts**, categorizes **theories**, and sketches **applications** (portfolio theory, accounting, cost of capital, capital structure, compensation, macro). Explicitly an agenda with more questions than answers.

For a quant investor: this is the intellectual constitution behind return forecasting, multi-factor risk models, and the interpretation of value, investment, and carry as discount-rate phenomena.

---

## Setup / Data (illustrative facts, not a single new dataset)

Primary time-series laboratory: CRSP value-weighted market vs dividend yield; annual data **1947–2009** in Table I; long-horizon identities via Campbell–Shiller. Additional illustrations: housing rent–price ratios; Lettau–Ludvigson $cay$; Fama–French BM-sorted portfolios 1963–2010; bond spreads; CDS vs cash; covered interest parity deviations in crisis; Nasdaq tech episode; surplus-consumption and investment–capital ratios.

---

## Model / Methods (organizing identities)

### Campbell–Shiller approximate present-value identity

$$
dp_t \approx \sum_{j=1}^{k}\rho^{j-1} r_{t+j} - \sum_{j=1}^{k}\rho^{j-1}\Delta d_{t+j} + \rho^k dp_{t+k},
$$

with $dp_t=\log(D_t/P_t)$, $\rho\approx 0.96$.

Long-run regressions on $dp_t$:

$$
\sum_{j=1}^k \rho^{j-1} r_{t+j} = a_r + b_r^{(k)} dp_t + \varepsilon^r_{t+k},
$$

$$
\sum_{j=1}^k \rho^{j-1} \Delta d_{t+j} = a_d + b_{\Delta d}^{(k)} dp_t + \varepsilon^d_{t+k},
$$

$$
dp_{t+k} = a_{dp} + b_{dp}^{(k)} dp_t + \varepsilon^{dp}_{t+k}.
$$

Identity implies:

$$
1 \approx b_r^{(k)} - b_{\Delta d}^{(k)} + \rho^k b_{dp}^{(k)}.
$$

Message: if dividend yields vary, they must forecast long-run returns, long-run dividend growth, or a bubble term. Empirically, almost all variation is in return forecasts.

### Simple return–forecast regression (Table I)

$$
R^e_{t\to t+k} = a + b\, (D_t/P_t) + \varepsilon_{t+k}.
$$

### Cross-section

Fama–French factor representation for BM portfolios:

$$
R^{e}_{i,t}=\alpha_i + b_i\,\mathrm{rmrf}_t + h_i\,\mathrm{hml}_t + \varepsilon_{i,t},
$$

with average returns lining up with $h_i E[\mathrm{hml}]$, not with CAPM betas.

### Theory taxonomy (Section III)

Cochrane groups discount-rate theories by central ingredients and data links (analogous to Fama’s weak/semi-strong/strong forms)—macro-finance habits / long-run risks / intermediary and segmented-markets models / behavioral extrapolative models, etc.—emphasizing that theories must confront both time-series and cross-sectional discount-rate facts.

---

## Results with Numbers

### Table I — Dividend yield forecasts (CRSP VW − T-bill; annual 1947–2009)

| Horizon | $b$ | $t(b)$ | $R^2$ | $\sigma[E_t(R^e)]$ | $\sigma[E]/E[R^e]$ |
|---------|-------|----------|---------|----------------------|----------------------|
| 1 year | **3.8** | 2.6 | 0.09 | 5.46 | **0.76** |
| 5 years | **20.6** | 3.4 | 0.28 | 29.3 | 0.62 |

Economic reading: +1 pp dividend yield forecasts ~+4 pp higher 1-year return (prices rise an additional ~3 pp). Variation in expected returns (~5.5 pp SD) is on the order of the equity premium itself—the “equity premium puzzle” is also an “equity premium *volatility* puzzle.” $R^2=9\%$ looks small but is the wrong metric for “how much do expected returns move?”

Figure 1: high $D/P$ (low prices) in 1980 precedes strong multi-year returns; low $D/P$ in 2000 precedes poor returns.

### Table II — Long-run coefficient decomposition ($k=15$ and $\infty$)

Direct 15-year regression: $b_r \approx 1.01$, $b_{\Delta d}\approx -0.11$, bubble/ persistence term small. VAR-implied infinite-horizon: $b_r \approx 1.35$, $b_{\Delta d}\approx 0.35$ with $\rho^k b_{dp}\to 0$. Bottom line Cochrane stresses: **stocks’ dividend yields forecast returns, not dividend growth**—prices are high when discount rates are low, not primarily when cashflows will surge.

(Other asset classes contrast: some show more cashflow predictability; housing rent–price discussion in Figure 2.)

### Role of $cay$

Lettau–Ludvigson $cay$ helps one-year return forecasts (Figure 3) but has little effect on long-run return forecasts (Figure 4)—long-run discount-rate variation remains tied to $dp$. Impulse responses (Figure 5 / Table IV VAR): dividend-growth shocks, $dp$ shocks, and $cay$ shocks have distinct dynamic profiles; $cay$ shocks look like temporary expected-return shifts that leave long-run $dp$ nearly unchanged.

### Cross-section: value without CAPM beta (Figure 6)

FF 10 BM portfolios (1963–2010 monthly): average returns rise from growth to value, but **market betas are roughly flat**. The puzzle is joint: high expected return without high CAPM beta (and beta without expected return is also a puzzle—Frazzini–Pedersen). HML loadings $h_i$ line up with average returns; CAPM fails, FF3 data-reduces the zoo to explaining the HML premium.

### “Zoo” and multiple testing

Cochrane emphasizes proliferation of factors/anomalies; theories must explain **factor premia**, not every portfolio. Using 25 FF portfolios to “test” theories that already fit HML is weak. Panel forecasting / characteristics (Appendix tables AIII–AIV) discuss how time effects, firm effects, and characteristics interact—linking time-series discount-rate variation to cross-sectional expected returns (a stock with high BM is like the market when $D/P$ is high).

### Recent performance / crises (Sections IV–V)

Illustrations that discount rates (not only cashflows) moved violently in the financial crisis:

- Credit spreads and equity valuations comove (Figures 11–12).
- CDS–cash basis and covered-interest parity deviations (Figures 13–14) show **segmentation / intermediation frictions**—discount rates differ across otherwise similar claims when balance-sheet capacity is scarce.
- Nasdaq tech (Figures 15–16): prices and volume; hard to square with pure cashflow news without discount-rate / risk-bearing narratives.
- Multifactor efficient frontiers (Figure 17): investors care about multiple priced risks; mean-variance on the market alone is insufficient.
- Tips / bond price paths (Figure 18); volatility spikes (Figure 19).

### Macro-finance links

Surplus-consumption ratio vs price–dividend (Figure 9); investment–capital vs market-to-book and $P/D$ (Figure 10): investment high when prices high—consistent with low discount rates driving both. Cochrane still finds macro-finance promising despite specification struggles.

### Applications agenda (Section V)

Incorporating discount-rate variation changes:

1. **Portfolio theory**: myopic CAPM rules fail when opportunity sets move; intertemporal hedges matter; dynamic strategies (including momentum/value timing) are natural.
2. **Accounting / valuation**: high prices need not imply high expected cashflows; falling discount rates raise PV.
3. **Cost of capital**: time-varying; project evaluation should not use constant IRRs blindly.
4. **Capital structure & compensation**: risk premia affect financing and incentive design.
5. **Macroeconomics**: asset prices as discount-rate indicators for policy and cycle analysis.

---

## Limitations / Critical Assessment

1. **Survey, not a single identification paper**—magnitudes are illustrative; readers must chase underlying citations for full specs.
2. **“All P/D variation is discount rates”** is approximately true for US aggregate equities in postwar samples; other markets/assets differ; small-sample biases in long-horizon regressions are well-known (Stambaugh bias, etc.).
3. **Theory taxonomy** is deliberately incomplete—an agenda.
4. **Factor zoo critique** cuts both ways: discipline is needed, but some “zoo animals” (investment, profitability, momentum) have out-of-sample and international support (AMP).
5. **Behavioral vs rational**: address is ecumenical; intermediary frictions get serious crisis attention.

---

## Practical Takeaways for a Quant Investor

1. **Treat expected returns as highly time-varying**—a 1 pp $D/P$ move is a several-pp expected-return move, not a curiosity.
2. **Value is a discount-rate phenomenon** in Cochrane’s reading: high BM ≈ high expected return, not necessarily higher CAPM beta.
3. **Do not confuse valuation ratios with cashflow forecasts** for the aggregate market.
4. **Crisis playbook**: watch intermediaries, bases, and CIP—discount rates can diverge across markets when capital is scarce.
5. **Portfolio construction**: include dynamic exposures to priced factors; opportunity-set hedging is first-order.
6. **Research discipline**: explain factor premia; avoid overfitting the 25 portfolios; connect characteristics to time-series state variables.
7. **Investment factor link**: high investment when prices high (Figure 10) ties Cooper–Gulen–Schill-type results to discount-rate variation.

---

## Equations Desk Card

$$
1 \approx b_r^{(k)} - b_{\Delta d}^{(k)} + \rho^k b_{dp}^{(k)},\quad \rho\approx 0.96
$$

$$
b_{1\mathrm{yr}}(D/P)\approx 3.8,\quad R^2\approx 0.09,\quad \sigma(E_t R^e)\approx 5.5\%
$$

$$
E[R_i^e]\approx b_i E[\mathrm{rmrf}] + h_i E[\mathrm{hml}]\quad \text{(not CAPM alone)}
$$

---

## Extended Time-Series Discussion

Cochrane hammers that **economic significance ≠ regression $R^2$**. Short-horizon returns are mostly news; low $R^2$ is automatic. The right question is the volatility of the *conditional mean*. Table I’s last columns show $\sigma(E_t R)/E[R]$ near three-quarters at one year—expected returns are neither constant nor a sideshow.

Long-horizon coefficient inflation (1y b=3.8 → 5y b=20.6) matches persistent expected-return AR(1) math: if expected returns are persistent, long-horizon projections accumulate. Present-value discipline then forces the decomposition into returns vs cashflows vs terminal $dp$.

Bubbles: a “rational bubble” term would show up as failure of the identity’s coefficients to sum to one with explosive $dp$ dynamics. Empirical decompositions assign little role to bubbles in Cochrane’s reading of US postwar data—though he discusses the temptation and the identification difficulty.

---

## Extended Cross-Section Discussion

“Beta without expected return” (low-risk anomalies) and “expected return without beta” (value, etc.) are symmetric failures of CAPM. Multifactor models restore order by expanding the beta vector. The intellectual program: (i) find a factor that prices the cross-section; (ii) give it a discount-rate interpretation (risk, intermediation, or behavioral demand).

Characteristics vs covariances: Appendix discussion of pooled vs cross-sectional vs time-dummy regressions shows how easy it is to mix discount-rate time variation with firm composition. Quants estimating FM slopes should know whether they are identifying “high BM firms earn more” or “times when BM is high on average earn more,” or both.

Momentum connection: Cochrane notes that even small predictability can generate momentum-like patterns in some mechanics; the address does not replace JT/Moskowitz but situates continuation in a world where discount rates move.

---

## Theories (Reader’s Map)

Without turning the address into a textbook:

- **Habit / surplus consumption** (Campbell–Cochrane): risk aversion rises as consumption falls toward habit → high discount rates, low prices.
- **Long-run risks** (Bansal–Yaron): persistent consumption growth risk priced by EIS/preferences.
- **Intermediary / segmented markets**: marginal investor is a constrained intermediary; when intermediary capital is low, risk premia rise across markets (explains commonality of spreads and bases in crises—Figure 8 conceptual diagram).
- **Behavioral extrapolation**: high past returns → high expected cashflows in investors’ minds → high prices / low subsequent returns.

Cochrane’s advice: judge theories by joint fit to time-series $dp$ facts and cross-sectional factor premia, and by whether their state variables are observable in data.

---

## Applications—Worked Intuition

**Valuation:** A firm’s multiple rising because discount rates fell is not “irrational exuberance” by itself; the forecast must separate cashflow vs discount-rate news (Campbell’s return decomposition).

**Cost of capital:** Using 10y average past returns as cost of capital is especially wrong if discount rates mean-revert; high past returns may signal *low* forward costs of capital.

**Macro:** Central banks watching only cashflow news in equity moves miss risk-premium shocks that affect investment (Figure 10) and credit (Figures 11–12).

---

## Numerical Digest

| Quantity | Value |
|----------|-------|
| 1y $D/P$ slope $b$ | 3.8 (t=2.6) |
| 1y $R^2$ | 0.09 |
| $\sigma(E_t R^e)$ 1y | 5.46% |
| 5y $b$ | 20.6 (t=3.4) |
| 5y $R^2$ | 0.28 |
| Long-run $b_r$ (direct k=15) | ~1.01 |
| Long-run $b_{\Delta d}$ | ~−0.11 ~ 0 (small) |
| ρ | ~0.96 |
| Sample Table I | 1947–2009 annual |
| Cross-section fig | FF10 BM 1963–2010 |

---

## Bottom Line

Cochrane’s presidential address reframes modern empirical finance around **discount-rate variation**. Aggregate valuations move because expected returns move, not primarily because dividend growth forecasts move. The cross-section’s factor zoo is the cross-sectional face of the same object. Theories and applications—from habits to intermediaries to valuation practice—should be judged by how they illuminate time-varying risk premia. For practitioners, the operational stance is: **forecast and risk-manage discount rates explicitly**; do not treat expected returns as constants with occasional anomalies.

---

## Supplementary Deep Dive: Present-Value Arithmetic for Practitioners

Suppose $\rho=0.96$ and expected returns follow a persistent AR(1) with autocorrelation $\phi$. Then long-horizon regression coefficients on $dp$ scale roughly with $(1-\phi^k)/(1-\phi)$ times the one-period coefficient (modulo joint dynamics with $dp$). This is why Table I’s 5-year slope is much larger than the 1-year slope without implying a different economic mechanism.

If dividends were a martingale and discount rates constant, $dp$ could not vary. Observed $dp$ volatility is therefore direct evidence of discount-rate and/or cashflow-forecast volatility. US postwar decompositions attribute the bulk to discount rates—Cochrane’s central time-series fact.

Housing (Figure 2): rent–price analogs of $D/P$ similarly relate to subsequent returns in real estate discussions, though measurement of rents and housing returns is harder than CRSP dividends. The conceptual parallel matters for multi-asset expected-return systems.

---

## Supplementary Deep Dive: From CAPM Chaos to Factor Order

Cochrane’s narrative arc—chaos → CAPM order → anomaly chaos → FF factor order → zoo chaos again—is a warning about intellectual cycles. Each “order” is a data reduction. The right response to the zoo is not nihilism but **requirement that new factors come with strong out-of-sample, theoretical, or institutional evidence**, and that theories target factor premia.

For a multi-factor quant: maintain a core priced-factor set (market, term, credit, equity value/investment/profitability/momentum, maybe FX and commodity risk premia) and demand spanning evidence for newcomers.

---

## Crisis Frictions as Discount-Rate Wedges

When CDS–bond bases and CIP deviations open, two claims with near-identical cashflows trade at different prices. That is literally a discount-rate (or constraint) differential. Intermediary balance-sheet capacity becomes a state variable for expected returns across markets—useful for risk parity, basis trades, and stress scenarios.

---

## Linkage to This Batch’s Other Papers

- **Daniel–Moskowitz**: momentum crashes are discount-rate / risk-bearing events in panic states; dynamic weighting is portfolio theory under time-varying opportunity sets—exactly Cochrane’s application theme.
- **Ang et al.**: volatility risk price is an ICAPM discount-rate channel.
- **Cooper–Gulen–Schill**: investment high when prices high matches Figure 10; ASSETG predicts low returns as a discount-rate/investment phenomenon.
- **Moskowitz–Grinblatt**: industry expected returns move together—cross-sectional discount-rate comovement within sectors.

---

## Agenda Items Cochrane Leaves Open (still open for research)

1. Cleaner observable state variables for habits / long-run risks.
2. Unifying time-series and characteristics in one estimation framework.
3. Quantitative intermediary models matching both levels and crisis bases.
4. Which zoo factors survive rigorous multiple-testing control?
5. How should CFOs compute hurdle rates when equity $E_t[r]$ moves 5+ pp?

---

## Final Desk Card

$D/P$ slope ~4 per year; $\sigma(E[r])\sim 5.5\%$; long-run return coefficients ~1; cashflow coefficients ~0; value premia are HML-betas not CAPM-betas; crises reveal segmented discount rates; build systems that forecast and hedge discount-rate shocks.

---

## Additional Commentary Block 1

Cochrane’s address rewards slow reading because it links empirical regressions, present-value identities, factor models, and institutional frictions into one worldview: **prices are high when discount rates are low**. Operationalizing that worldview means maintaining real-time estimates of equity risk premia (from $D/P$, $cay$-style filters, or multivariate return predictors), credit risk premia, and intermediary stress indicators—and allowing portfolio exposures to respond. Constant-mix strategies that ignore premium variation leave Sharpe on the table and misstate risk. Conversely, aggressive timing without rigorous OOS validation overfits. The disciplined middle path—shrinkage toward long-run average premia, limited timing intensity, and multifactor risk control—fits the spirit of the address without pretending the survey is a turnkey trading rule.

---

## Additional Commentary Block 2

Cochrane’s address rewards slow reading because it links empirical regressions, present-value identities, factor models, and institutional frictions into one worldview: **prices are high when discount rates are low**. Operationalizing that worldview means maintaining real-time estimates of equity risk premia (from $D/P$, $cay$-style filters, or multivariate return predictors), credit risk premia, and intermediary stress indicators—and allowing portfolio exposures to respond. Constant-mix strategies that ignore premium variation leave Sharpe on the table and misstate risk. Conversely, aggressive timing without rigorous OOS validation overfits. The disciplined middle path—shrinkage toward long-run average premia, limited timing intensity, and multifactor risk control—fits the spirit of the address without pretending the survey is a turnkey trading rule.

---

## Additional Commentary Block 3

Cochrane’s address rewards slow reading because it links empirical regressions, present-value identities, factor models, and institutional frictions into one worldview: **prices are high when discount rates are low**. Operationalizing that worldview means maintaining real-time estimates of equity risk premia (from $D/P$, $cay$-style filters, or multivariate return predictors), credit risk premia, and intermediary stress indicators—and allowing portfolio exposures to respond. Constant-mix strategies that ignore premium variation leave Sharpe on the table and misstate risk. Conversely, aggressive timing without rigorous OOS validation overfits. The disciplined middle path—shrinkage toward long-run average premia, limited timing intensity, and multifactor risk control—fits the spirit of the address without pretending the survey is a turnkey trading rule.

---

## Additional Commentary Block 4

Cochrane’s address rewards slow reading because it links empirical regressions, present-value identities, factor models, and institutional frictions into one worldview: **prices are high when discount rates are low**. Operationalizing that worldview means maintaining real-time estimates of equity risk premia (from $D/P$, $cay$-style filters, or multivariate return predictors), credit risk premia, and intermediary stress indicators—and allowing portfolio exposures to respond. Constant-mix strategies that ignore premium variation leave Sharpe on the table and misstate risk. Conversely, aggressive timing without rigorous OOS validation overfits. The disciplined middle path—shrinkage toward long-run average premia, limited timing intensity, and multifactor risk control—fits the spirit of the address without pretending the survey is a turnkey trading rule.

---

## Additional Commentary Block 5

Cochrane’s address rewards slow reading because it links empirical regressions, present-value identities, factor models, and institutional frictions into one worldview: **prices are high when discount rates are low**. Operationalizing that worldview means maintaining real-time estimates of equity risk premia (from $D/P$, $cay$-style filters, or multivariate return predictors), credit risk premia, and intermediary stress indicators—and allowing portfolio exposures to respond. Constant-mix strategies that ignore premium variation leave Sharpe on the table and misstate risk. Conversely, aggressive timing without rigorous OOS validation overfits. The disciplined middle path—shrinkage toward long-run average premia, limited timing intensity, and multifactor risk control—fits the spirit of the address without pretending the survey is a turnkey trading rule.

---

## Extended Application Notes for Quant Funds

Discount-rate thinking changes how a fund reports and manages risk. Instead of treating the equity premium as a fixed 6% and attributing all variation in wealth to cashflow news or “alpha,” the fund should maintain an internal dashboard of implied premia: equity (from aggregate valuation ratios and predictive regressions), credit (from OAS and default-adjusted spreads), duration (from real and nominal term structures), and equity style premia (value, investment, momentum) estimated from trailing FM slopes or from valuation spreads. Position sizing can then respond to these premia with strong shrinkage—e.g., scale a sleeve’s risk budget by a logistic function of standardized premium estimates—so that extreme forecasts never produce extreme leverage.

Stress testing should include discount-rate shocks as first-class scenarios: a 200 bp parallel rise in equity expected returns (price decline with little cashflow news), a widening of intermediary bases, and a momentum crash state. These scenarios are more informative than repeating historical calendar episodes without a discount-rate interpretation.

Research governance should require every new factor proposal to state: (1) the time-series state variable that should forecast the factor’s premium; (2) the economic bearer of risk or friction; (3) out-of-sample and international evidence; (4) spanning tests against the current core set. That is the operational translation of Cochrane’s zoo critique.

Finally, communication with CIOs and boards should separate “markets became optimistic about cashflows” from “discount rates fell.” Both raise prices; only one raises expected forward returns differently. Presidential-address clarity on that distinction remains as useful in 2026 as in 2011.

---

## Extended Application Notes for Quant Funds

Discount-rate thinking changes how a fund reports and manages risk. Instead of treating the equity premium as a fixed 6% and attributing all variation in wealth to cashflow news or “alpha,” the fund should maintain an internal dashboard of implied premia: equity (from aggregate valuation ratios and predictive regressions), credit (from OAS and default-adjusted spreads), duration (from real and nominal term structures), and equity style premia (value, investment, momentum) estimated from trailing FM slopes or from valuation spreads. Position sizing can then respond to these premia with strong shrinkage—e.g., scale a sleeve’s risk budget by a logistic function of standardized premium estimates—so that extreme forecasts never produce extreme leverage.

Stress testing should include discount-rate shocks as first-class scenarios: a 200 bp parallel rise in equity expected returns (price decline with little cashflow news), a widening of intermediary bases, and a momentum crash state. These scenarios are more informative than repeating historical calendar episodes without a discount-rate interpretation.

Research governance should require every new factor proposal to state: (1) the time-series state variable that should forecast the factor’s premium; (2) the economic bearer of risk or friction; (3) out-of-sample and international evidence; (4) spanning tests against the current core set. That is the operational translation of Cochrane’s zoo critique.

Finally, communication with CIOs and boards should separate “markets became optimistic about cashflows” from “discount rates fell.” Both raise prices; only one raises expected forward returns differently. Presidential-address clarity on that distinction remains as useful in 2026 as in 2011.

---

## Extended Application Notes for Quant Funds

Discount-rate thinking changes how a fund reports and manages risk. Instead of treating the equity premium as a fixed 6% and attributing all variation in wealth to cashflow news or “alpha,” the fund should maintain an internal dashboard of implied premia: equity (from aggregate valuation ratios and predictive regressions), credit (from OAS and default-adjusted spreads), duration (from real and nominal term structures), and equity style premia (value, investment, momentum) estimated from trailing FM slopes or from valuation spreads. Position sizing can then respond to these premia with strong shrinkage—e.g., scale a sleeve’s risk budget by a logistic function of standardized premium estimates—so that extreme forecasts never produce extreme leverage.

Stress testing should include discount-rate shocks as first-class scenarios: a 200 bp parallel rise in equity expected returns (price decline with little cashflow news), a widening of intermediary bases, and a momentum crash state. These scenarios are more informative than repeating historical calendar episodes without a discount-rate interpretation.

Research governance should require every new factor proposal to state: (1) the time-series state variable that should forecast the factor’s premium; (2) the economic bearer of risk or friction; (3) out-of-sample and international evidence; (4) spanning tests against the current core set. That is the operational translation of Cochrane’s zoo critique.

Finally, communication with CIOs and boards should separate “markets became optimistic about cashflows” from “discount rates fell.” Both raise prices; only one raises expected forward returns differently. Presidential-address clarity on that distinction remains as useful in 2026 as in 2011.

---

## Extended Application Notes for Quant Funds

Discount-rate thinking changes how a fund reports and manages risk. Instead of treating the equity premium as a fixed 6% and attributing all variation in wealth to cashflow news or “alpha,” the fund should maintain an internal dashboard of implied premia: equity (from aggregate valuation ratios and predictive regressions), credit (from OAS and default-adjusted spreads), duration (from real and nominal term structures), and equity style premia (value, investment, momentum) estimated from trailing FM slopes or from valuation spreads. Position sizing can then respond to these premia with strong shrinkage—e.g., scale a sleeve’s risk budget by a logistic function of standardized premium estimates—so that extreme forecasts never produce extreme leverage.

Stress testing should include discount-rate shocks as first-class scenarios: a 200 bp parallel rise in equity expected returns (price decline with little cashflow news), a widening of intermediary bases, and a momentum crash state. These scenarios are more informative than repeating historical calendar episodes without a discount-rate interpretation.

Research governance should require every new factor proposal to state: (1) the time-series state variable that should forecast the factor’s premium; (2) the economic bearer of risk or friction; (3) out-of-sample and international evidence; (4) spanning tests against the current core set. That is the operational translation of Cochrane’s zoo critique.

Finally, communication with CIOs and boards should separate “markets became optimistic about cashflows” from “discount rates fell.” Both raise prices; only one raises expected forward returns differently. Presidential-address clarity on that distinction remains as useful in 2026 as in 2011.

---

## Extended Application Notes for Quant Funds

Discount-rate thinking changes how a fund reports and manages risk. Instead of treating the equity premium as a fixed 6% and attributing all variation in wealth to cashflow news or “alpha,” the fund should maintain an internal dashboard of implied premia: equity (from aggregate valuation ratios and predictive regressions), credit (from OAS and default-adjusted spreads), duration (from real and nominal term structures), and equity style premia (value, investment, momentum) estimated from trailing FM slopes or from valuation spreads. Position sizing can then respond to these premia with strong shrinkage—e.g., scale a sleeve’s risk budget by a logistic function of standardized premium estimates—so that extreme forecasts never produce extreme leverage.

Stress testing should include discount-rate shocks as first-class scenarios: a 200 bp parallel rise in equity expected returns (price decline with little cashflow news), a widening of intermediary bases, and a momentum crash state. These scenarios are more informative than repeating historical calendar episodes without a discount-rate interpretation.

Research governance should require every new factor proposal to state: (1) the time-series state variable that should forecast the factor’s premium; (2) the economic bearer of risk or friction; (3) out-of-sample and international evidence; (4) spanning tests against the current core set. That is the operational translation of Cochrane’s zoo critique.

Finally, communication with CIOs and boards should separate “markets became optimistic about cashflows” from “discount rates fell.” Both raise prices; only one raises expected forward returns differently. Presidential-address clarity on that distinction remains as useful in 2026 as in 2011.
