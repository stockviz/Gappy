# Stock Price Predictability

**Author:** Wayne E. Ferson (Boston College, Carroll School of Management; Collins Chair in Finance)  
**Publication:** Working draft for Durlauf and Blume (eds.), *The New Palgrave Dictionary of Economics*, Second Edition, Palgrave Macmillan  
**Drafts:** first 28 August 2006; this draft 17 October 2006  
**Source PDF:** `StockPrediction_Ferson_2008.pdf`  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_1)  
**OCR:** Not required; clean extract (~6,179 words of source)

---

## 1. Problem and Motivation

Interest in predicting stock prices is as old as markets. Fama (1970) organized early evidence by information sets: **weak form** (past prices), **semi-strong** (public information), **strong** (private). Early work favored martingale/random-walk descriptions of price *levels*; predicting *returns* is harder and remains contested.

Two competing interpretations structure the modern debate:

1. **Exploitable inefficiencies:** frictions (trading costs, taxes, information costs) or behavioral biases prevent arbitrageurs from eliminating predictability (Friedman 1953; Samuelson 1965 as the foil; behavioral finance as the mechanism). Traders who avoid the friction/bias can profit.  
2. **Efficient-markets predictability:** required expected returns vary with interest rates, risk, and risk aversion. Write $R = E(R\mid\Omega) + u$ with $E(u\mid\Omega)=0$; only $E(R\mid\Omega)$ can be forecast. Conditional asset pricing (Ferson 1995 survey; Lo 2006 Palgrave entry) is the natural framework.

The entry focuses on weak and semi-strong predictability (not insider trading). It also notes large literatures on predictable **second** moments (ARCH/GARCH; Engle 2004) and **third** moments (Harvey–Siddique 2000).

---

## 2. Weak-Form Predictability

### 2.1 Autoregression and variance ratios

With continuously compounded one-period returns $R_t$ and horizon-$H$ sums $r(t,t+H)=\sum_{j=1}^H R_{t+j}$,

$$
r(t,t+H) = a_H + \rho_H\, r(t-H,t) + \varepsilon(t,t+H). \tag{1}
$$

Variance-ratio statistics $\mathrm{Var}\{r(t,t+H)\}/(H\,\mathrm{Var}(R_t))$ (Working 1949; Lo–MacKinlay 1988) are functions of autocorrelations (Cochrane 1988); Kaul (1996) shows many weak-form tests are re-weightings of multi-lag autocorrelations.

### 2.2 High-frequency serial dependence

Daily/intradaily serial dependence is often **statistically significant but not exploitable**: bid–ask bounce (Roll 1984), nonsynchronous trading in indexes (Fisher 1966; Scholes–Williams 1977). Such spurious predictability is **not** time-varying discount-rate variation. Nonetheless, some work models within-month expected returns as autoregressive (Lo–MacKinlay 1988; Conrad–Kaul 1988).

### 2.3 Weekly ARMA evidence (Conrad–Kaul)

If $E(R\mid\Omega)$ is AR, observed returns are ARMA with AR and MA coefficients of **opposite sign**: higher expected returns raise future means but lower current prices via discounting. Conrad–Kaul (1988, 1989) estimate weekly portfolio returns with AR coefficients near **+0.5**, explaining up to **~25%** of small-firm portfolio return variance. Caveat: nonsynchronous trading still contaminates weekly portfolios; Lo–MacKinlay (1990) and Muthuswamy (1988) separate effects; Boudoukh–Richardson–Whitelaw (1994) find little weekly predictability in stock-index **futures** (immune to nonsynchronicity).

### 2.4 Relative predictability: momentum and reversals

Cross-sectional versions of (1) study whether past winners beat past losers.

- **Momentum (continuation):** Jegadeesh (1990) monthly; Jegadeesh–Titman (1993) on US 1927–1989 (focus 1965–89): top 20% winners over prior **6 months** outperform losers by about **1% per month** over the next 6 months. Huge subsequent literature; risk-based explanations largely fail (partial: Ang–Chen–Xing downside risk).  
- **Behavioral mechanisms:** biased self-attribution → underreaction (Daniel–Hirshleifer–Subrahmanyam 1998); disposition effect (Grinblatt–Han 2003).  
- **Trading costs:** Lesmond–Schill–Zhou (2004) and Korajczyk–Sadka (2004) argue apparent momentum profits are **consumed by trading costs**.  
- **Short-horizon reversals:** Lehmann (1990) weekly.

### 2.5 Long-horizon mean reversion

Fama–French (1988) find **U-shaped** autocorrelations with **negative** serial dependence at **4–5 year** horizons—consistent with stationary time-varying expected returns *or* temporary price departures from fundamentals. DeBondt–Thaler (1985): long-term past winners underperform over the next five years (overreaction). Reversals concentrate in **January** (Zarowin 1990; Grinblatt–Moskowitz 2003)—tax-loss selling story—and in **high idiosyncratic-risk** stocks (McLean 2006), consistent with limits to arbitrage. Behavioral models (Barberis–Shleifer–Vishny 1998; DHS 1998; Hong–Stein 1999) jointly target short-run momentum and long-run reversal.

**Ferson’s interim verdict on weak form:** the jury is still out; many patterns look sample-specific once sliced by size, price, industry, subperiod, and business-cycle phase.

---

## 3. Semi-Strong Form Predictability

Regression form:

$$
r(t,t+H) = \alpha_H + \beta_H' Z_t + v(t,t+H). \tag{2}
$$

### 3.1 Valuation ratios

Cash-flow / price measures: detrended price (Keim–Stambaugh 1986); dividend/price (Rozeff 1984; Campbell–Shiller 1988; Fama–French 1989); book/price (Pontiff–Schall 1998; Kothari–Shanken 1997); payouts including repurchases (Boudoukh et al. 2004; Lei 2006); consumption/wealth (Lettau–Ludvigson 2001). All produce significant $\beta_H$.

**Gordon intuition:** $P=c/R$ ⇒ $R=c/P$; with growth, $c/P=R-g$. Campbell–Shiller show the intuition extends to time-varying $R,g$. Empirically, D/P **does not** forecast cash-flow growth well; Cochrane (2006) “dog that did not bark” argument: if D/P fails to forecast cash flows, it **must** forecast returns.

### 3.2 Economic magnitude vs $R^2$

Monthly–annual $R^2$ often **≤10–15%**; multi-year $R^2$ up to **~40%+** at 4–5 year horizons because expected returns are more persistent than returns (Fama–French 1989). Small $R^2$ can still matter: stocks are long-duration assets. Gordon example in the text: P/E=15, payout 0.6, g=3% ⇒ R=7%; a **1%** shock to R changes value by ~**20%** ceteris paribus. Portfolio studies (Kandel–Stambaugh 1996; Campbell–Viceira 2002; Fleming–Kirby–Ostdiek 2001) confirm economically large allocation effects from modest predictability.

### 3.3 Calendar / seasonal effects

January, turn-of-month, holidays, Monday, time-of-day, sunlight/SAD, even geomagnetic storms—long list (Haugen–Lakonishok 1988; Schwert 2003 surveys).

### 3.4 Yields, spreads, volatility, and “other”

- Short T-bill yields predict equity returns with **negative** sign (Fama–Schwert 1977)—interpreted as expected inflation; Ferson (1989) links this to time-varying systematic risk.  
- Credit / quality spreads (Keim–Stambaugh 1986); term-structure spreads (Campbell 1987).  
- Conditional variance (Merton 1980).  
- Fama–French (1989) map 1980s predictors to US business cycles.  
- Newer candidates: equity share of new issues (Baker–Wurgler 2000), investment plans (Lamont 2000), idiosyncratic vol (Polk–Thompson–Vuolteenaho), cash holdings (Greenwood), dividend initiations, share issuance (Pontiff–Woodgate), political party (Santa-Clara–Valkanov 2003).

---

## 4. Methodological Issues

Predictive regressions look simple; interpretation is not. Key problems:

- **Data mining:** naive vs sophisticated (White 2000 reality check). With 100 independent searches, expect five “5% significant” false positives. CRSP has been mined relentlessly; only significant results get published.  
- **Out-of-sample:** mixed. Support: Fama–French 1989; Pesaran–Timmermann 1995; international (Harvey 1991; Solnik 1993; Ferson–Harvey 1993, 1999). Failure vs historical mean: Goyal–Welch 2003, 2004; Simin 2006. Nuance: real predictability can still lose to naive benchmarks OOS (Campbell–Thompson 2005; Hjalmarsson 2006).  
- **Small-sample bias, standard errors, spurious regression, structural breaks, regime shifts,** and—critically—their **interactions** (Boudoukh–Richardson 1994 survey; Granger spurious-regression entry; Ferson–Sarkissian–Simin 2003 on mining × spurious regression). Interaction research remains thin and active.

---

## 5. Perspective — Reasons for Skepticism and Belief

### 5.1 Why be skeptical?

Classic EMH logic: predictable high returns get bid away. Data mining and publication bias manufacture patterns. Momentum “works” mainly in certain industries, sizes, price filters (>\\$5), post-1940, post-1968, expansions—not uniformly. Long-term reversals concentrate in small, low-priced, January, high-idio-risk, earlier samples. Sample-specific patterns plus clever stories raise multiple-comparison alarms.

### 5.2 Why believe?

Theory: persistent time-varying expected returns **imply** predictability. Business-cycle variation in risk premia is intuitive and matches evidence. Conditional asset-pricing models absorb much lagged-variable predictability when risk premia vary (Ferson–Harvey 1991; Ferson–Korajczyk 1995; Avramov–Chordia 2006). Behavioral mechanisms match introspective cognitive errors. Momentum survives JT’s original sample (JT 2001 on 1990–98) and appears internationally (Rouwenhorst 1998). Semi-strong predictors often work across countries, asset classes (bonds, futures), and macro growth rates, and survive many statistical corrections. Firm-level predictor covariances show no recent weakening (Ferson–Heuson–Su 2005); Campbell–Thompson (2005) find OOS support with theoretically motivated restrictions.

---

## 6. Practical Takeaways for a Quant Investor

1. **Treat weak-form signals (especially long-horizon reversals) as fragile**; demand strict OOS, transaction-cost, and multiple-testing discipline (White reality checks, holdout decades).  
2. **Momentum is the most robust weak-form pattern (~1%/month in classic J/K windows)** but may not clear realistic t-costs—pair with the Goldman shortfall lesson.  
3. **Semi-strong valuation and term-structure predictors** are more convincing as statements about **time-varying expected returns** than as easy alpha; use them for **strategic allocation / risk-budget timing**, not necessarily for high-turnover trading.  
4. **Do not confuse low $R^2$ with economic irrelevance**; duration amplifies small return-forecast changes into large value and allocation effects.  
5. **Prefer predictors tied to business-cycle economics** (spreads, D/P, cay) over pure calendar curiosities.  
6. **Always ask:** is this $E(R)$ variation (efficient) or frictions/behavioral (exploitable)? Implementation costs decide whether “inefficiency” is tradable.  
7. **Conditional factor models** that allow time-varying premia are the right research/production frame if you take predictability seriously.

---

## 7. Limitations of the Entry

Dictionary format—selective, not a meta-analysis with pooled effect sizes. Draft dated 2006; post-2006 predictability literature (e.g., further Goyal–Welch debate, machine-learning predictors, crisis-period breaks) is outside scope. Strong-form evidence intentionally omitted.

---

## 8. Conclusion

Ferson’s measured bottom line: evidence for **weak-form** predictability is **more fragile and less compelling** than evidence for **semi-strong** predictability. For asset pricing, allowing time-varying expected returns, risks, and volatilities has been one of the field’s major developments—enriching tests, performance evaluation, and econometrics. Predictability research will remain useful and controversial; quants should exploit the robust parts (cost-aware momentum, macro-aware expected-return timing) and discount the sliced, sample-specific curiosities.

---

## 9. Mapping Classic Magnitudes into a Quant Dashboard

| Phenomenon | Horizon | Classic magnitude | Exploitability caveat |
|------------|---------|-------------------|----------------------|
| Bid–ask / nonsynchronicity | daily | significant AC | not tradable |
| Conrad–Kaul AR | weekly | AR≈0.5; $R^2$ up to ~25% small-cap | futures weaken it |
| JT momentum | 3–12m | ~1%/month winners−losers | t-costs may erase |
| FF mean reversion | 4–5y | negative $\rho_H$ | sample / stats fragile |
| DeBondt–Thaler | 5y | long-term reversal | January / microcap |
| D/P, cay, spreads | 1m–5y | monthly $R^2$≤15%; long-h $R^2$~40% | OOS contested |
| Gordon duration | — | 1% ΔR ≈ 20% ΔP | illustrates economics |

---

## 10. Econometric Pitfalls — Operational Controls

1. **Newey–West / Hansen–Hodrick** SEs for overlapping long-horizon returns.  
2. **Stambaugh bias** corrections when predictors are persistent and innovations correlate with returns.  
3. **Bonferroni / White reality check / Hansen SPA** for multiple predictors.  
4. **Pre-registered OOS** windows; report constrained Campbell–Thompson forecasts.  
5. **Deflated** strategies: subtract proportional costs before claiming anomalous $\alpha$.

---

## 11. Link to Conditional Asset Pricing

If $\beta_t$ and $\lambda_t$ vary with $Z_t$, then

$$
E(R_{i,t+1}\mid Z_t) = \gamma_0(Z_t) + \beta_i(Z_t)'\lambda(Z_t)
$$

generates semi-strong predictability without inefficiency. Empirically, much of the lagged-instrument predictability for portfolios is spanned by time-varying risk premia (Ferson–Harvey 1991). Quants building “macro overlays” should test whether their signal survives conditioning on scaled factor premia; if not, they may be rediscovering compensated risk.

---

## 12. Behavioral vs Risk — A Decision Rule

- If profits **survive** costs, shorting constraints, and risk adjustment → operational anomaly (trade, but watch capacity).  
- If profits **die** under costs (momentum per Korajczyk–Sadka) → useful for understanding markets, not for naive implementation.  
- If profits are **absorbed** by conditional factor models → treat as risk, not alpha.  
- If profits are **OOS fragile** → assume mining until proven otherwise.

---

## 13. Final Synthesis

Ferson’s Palgrave entry is a disciplined tour: weak-form patterns are real enough to generate literatures but too fragile and cost-sensitive to treat as free alpha; semi-strong predictability is more coherent as time-varying expected returns, economically large despite modest $R^2$, yet statistically treacherous. The productive quant stance is conditional asset pricing plus ruthless OOS/cost discipline—not wholesale denial, not uncritical anomaly harvesting.

---

## 14. Deep Dive — Weak-Form Empirical Architecture

### 14.1 From single autocorrelations to combinations

Kaul (1996) emphasizes that variance ratios, Box–Pierce statistics, and multi-horizon regressions are all **linear combinations of autocorrelations** with different lag weights. Disagreeing tests can therefore reflect weighting schemes rather than contradictory economics. A quant replicating weak-form claims should always report the **full autocorrelation spectrum** out to the horizon of interest, not a single summary statistic.

### 14.2 Opposite-sign ARMA intuition — numerical sketch

Suppose conditional expected weekly return $m_t$ follows $m_t = 0.5 m_{t-1} + \nu_t$ and unexpected return $u_t$ is white noise discounted into prices. A positive $\nu_t$ raises future $m$ (positive AR contribution to returns) but lowers the current price (negative MA-like impulse). Net unconditional autocorrelation of returns can be near zero even when expected returns are strongly persistent—exactly why Conrad–Kaul estimate the **structural** ARMA rather than raw ACs. For small-cap portfolios they attribute up to a quarter of return variance to the expected-return component.

### 14.3 Momentum parameterizations used in practice

Canonical JT implementations:

- Formation $J \in \{3,6,9,12\}$ months, skip the most recent month (to avoid microstructure reversals), hold $K \in \{3,6,9,12\}$.  
- Long top decile or top quintile; short bottom.  
- Equal-weight or value-weight; the classic ~1%/month refers primarily to equal-weighted relative strength among the extreme quintiles over 1965–89.

Subsequent work layers industry-neutralization, residual momentum after factor adjustment, and volatility scaling (Barroso–Santa-Clara; Daniel–Moskowitz)—topics surveyed elsewhere but foreshadowed by Ferson’s cost and risk caveats.

### 14.4 Why futures evidence matters

Equity-index futures are marked continuously and not subject to stale component quotes. Boudoukh–Richardson–Whitelaw’s finding of **little weekly predictability in futures** is a sharp critique of portfolio-level weekly AC evidence: what looks like weak-form predictability in cash indexes may be microstructure. Quants should prefer futures or tradeable ETFs when testing high-frequency continuation.

---

## 15. Deep Dive — Semi-Strong Predictors as a System

Fama–French (1989) is the organizing paper for the 1980s predictor zoo: dividend yield, default spread, and term spread move with the business cycle in economically coherent ways—high expected returns when times are bad. Lettau–Ludvigson’s **cay** extends the logic to a cointegrating residual between consumption, asset wealth, and labor income. Baker–Wurgler’s equity share of new issues is a sentiment/timing proxy: firms issue equity when prices are high, forecasting low subsequent market returns.

A practical “semi-strong dashboard” for a multi-asset risk pipeline:

1. **Valuation block:** S&P earnings or dividend yield vs history; cyclically adjusted variants.  
2. **Credit block:** Baa–Treasuries or CDX IG spreads.  
3. **Curve block:** 10y–3m or 30y–3m slope.  
4. **Issuance/sentiment block:** equity share of total issuance; buyback-adjusted payout.  
5. **Risk-appetite block:** implied–realized vol spreads (links to Rosenberg–Engle EPK).

Regress each on subsequent excess returns at 1m/12m/60m horizons; apply Stambaugh bias corrections; report OOS $R^2$ vs historical mean with Campbell–Thompson sign restrictions (forecasts floored at zero equity premium when the model goes negative).

---

## 16. Duration Arithmetic — Why 1% Expected-Return Shocks Matter

Gordon: $P = kE / (R-g)$. With $k=0.6$, $E$ normalized so $P/E=15$, $g=0.03$:

$$
R = k/(P/E) + g = 0.6/15 + 0.03 = 0.07.
$$

Elasticity:

$$
\frac{dP}{P} \approx -\frac{dR}{R-g} = -\frac{0.01}{0.04} = -0.25
$$

(about −25% for a +1% parallel rise in required return if $g$ fixed; Ferson’s text cites ~20% in a closely related parameterization). Even if cash-flow expectations move partially offsetting, the **order of magnitude** shows why monthly $R^2$ of 5–10% on equity-premium forecasts can dominate strategic asset allocation (Kandel–Stambaugh; Campbell–Viceira).

---

## 17. Out-of-Sample Debate — How to Read Goyal–Welch

Goyal–Welch (2003, 2004) argue that most popular predictors fail to beat the historical mean OOS. Ferson’s balanced reading, aligned with Campbell–Thompson and Hjalmarsson:

- Beating the historical mean is a **harsh** benchmark when risk premia are themselves hard to estimate.  
- A predictor can be true yet lose OOS because of estimation noise, structural breaks, or decade-long dry spells.  
- **Economic restrictions** (non-negative premium forecasts; shrinkage toward the mean) restore OOS value for several valuation predictors.  
- International and cross-asset confirmation raises the prior that something real exists even when US equity OOS looks weak.

Operational rule: never promote a predictor to production on in-sample t-stats alone; require restricted OOS and a decision-theoretic utility metric (CER gains).

---

## 18. Momentum After Costs — Bridging to Execution Research

Lesmond–Schill–Zhou and Korajczyk–Sadka estimate that quoted and effective spreads, especially among loser-leg shorts, erase JT profits for many implementations. Combined with the Goldman Sachs Street Smart lesson (optimize **net** of shortfall), the quant implication is:

- Momentum **signals** may still inform conditional expected returns and risk models.  
- Momentum **strategies** require cost-aware portfolio construction, participation caps, and possibly lengthened holding periods to survive.  
- Capacity is endogenous: the more capital piles into JT, the higher the shortfall for a given turnover.

---

## 19. Relative vs Absolute Predictability

Absolute predictability forecasts the market’s own return. Relative predictability ranks stocks. Relative strategies can profit even if the market direction forecast is useless—hence the enormous industry attention to momentum, value, quality, etc. Ferson stresses that weak-form **relative** evidence (momentum) is stronger than weak-form **index** autocorrelation evidence, while semi-strong evidence is mostly about **absolute** expected-return variation. A barbell research agenda follows: factor/relative premia on the cross-section; macro instruments on the aggregate.

---

## 20. What “Predictability Survives Conditional Models” Means

When Ferson–Harvey-type models absorb lagged instruments, the interpretation is that instruments forecast **risk premia**, not alpha. For a hedge fund claiming alpha from D/P timing, the right test is whether returns net of scaled-factor exposures remain nonzero. If not, clients should pay beta fees, not alpha fees. Conversely, instruments that forecast residuals **after** conditional betas/premia are more plausible alpha candidates—subject to mining controls.

---

## 21. Calendar Effects — Standing Advice

Schwert (2003) documents that many calendar anomalies weaken post-publication. January effect, weekend effect, etc., are cautionary tales for anomaly trading. Ferson lists them for completeness but his skepticism section clearly downgrades sample-split curiosities. Quants should treat calendar rules as **controls** in regressions (to avoid omitted seasonality) more than as standalone strategies.

---

## 22. Research Frontier Circa 2006 (Still Relevant)

- Interactions among spurious regression, mining, and breaks.  
- Better OOS design and decision-theoretic evaluation.  
- Firm-level predictability aggregation (Ferson–Heuson–Su).  
- Linking option-implied distributions and EPKs (Rosenberg–Engle) to return predictability and risk aversion.  
- Integrating trading-cost endogenous capacity into anomaly evaluation.

---

## 23. Expanded Conclusion for Practitioners

Read stock-return predictability as a **layered** phenomenon:

1. Microstructure layers create illusory weak-form patterns.  
2. Momentum is the primary robust relative weak-form pattern but is cost-fragile.  
3. Long-horizon reversals and many calendar effects are fragile.  
4. Semi-strong valuation and yield-curve instruments likely capture genuine time-varying expected returns with large allocation consequences despite modest $R^2$.  
5. Statistical landmines are everywhere—process beats narrative.

That layered view is Ferson’s lasting pedagogical contribution in the New Palgrave entry.

---

## 24. One-Page Implementation Spec

**Signal set (semi-strong):** excess D/P or earnings yield vs 10y median; term spread; default spread; cay if available.  
**Filters (weak-form):** 12-2 momentum residualized to industry; exclude names below \\$5 and below median ADV.  
**Evaluation:** expanding-window OOS; Campbell–Thompson floor; CER utility for 1/γ ∈ {1,3,5}; subtract GSSM-style shortfall at target turnover.  
**Risk overlay:** scale positions by inverse conditional vol (ARCH/GARCH).  
**Kill criteria:** 36-month OOS CER below historical-mean strategy after costs; White reality-check p-value >0.10 on the mined set.

This spec converts Ferson’s survey skepticism into an operational gate that lets through only predictability robust enough for real capital.
