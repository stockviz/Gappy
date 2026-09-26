# The Cross-Section of Volatility and Expected Returns — Ang, Hodrick, Xing & Zhang (2006) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | The Cross-Section of Volatility and Expected Returns |
| **Authors** | Andrew Ang (Columbia, NBER); Robert J. Hodrick (Columbia, NBER); Yuhang Xing (Rice); Xiaoyan Zhang (Cornell) |
| **Journal** | *Journal of Finance*, Vol. LXI, No. 1, February 2006, pp. 259–299 |
| **Sample (aggregate vol)** | January **1986**–December **2000** (VIX availability) |
| **Sample (idio vol)** | July **1963**–December **2000** |
| **Universe** | AMEX, NASDAQ, NYSE common stocks |
| **Key instruments** | VIX / ΔVIX; factor-mimicking portfolio FVIX; FF-3 residuals |
| **Original PDF** | `AbnormalReturnsLowVol_AngHodrickXingZhang_2006.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsSHFwanJUSi11Rlk` |
| **Extraction** | `pdftotext -layout`; clean text |

NSF support acknowledged; editor Rob Stambaugh; extensive seminar circuit.

---

## Problem / Motivation

Two linked questions organize the paper:

1. **Is aggregate market volatility a priced risk factor in the cross-section of equities?** Option markets imply a negative price of volatility risk (Jackwerth–Rubinstein, Bakshi–Kapadia, Pan, Eraker–Johannes–Polson, Carr–Wu, etc.). If that price is negative, stocks with **high positive sensitivity** to volatility innovations should earn **low** average returns—they are hedges against deteriorations in the investment opportunity set (Campbell 1993, 1996; Chen 2002), against downside markets (French–Schwert–Stambaugh; Campbell–Hentschel), and against coskewness preferences (Harvey–Siddique).

2. **What is the cross-sectional price of idiosyncratic volatility relative to FF-3?** If FF-3 is complete, sorting on residual volatility should not produce return differentials. If aggregate volatility is an omitted factor orthogonal to FF-3, high residual-vol stocks might embed high loadings on that factor—predicting *low* returns if the vol risk price is negative. Separately, behavioral / lottery-demand theories (not the paper’s primary frame, but relevant to later literature) also predict low returns to high-idio-vol names.

The paper’s contribution is to estimate the **price of aggregate volatility risk from equity portfolios** (not only from options), to construct a traded factor-mimicking portfolio **FVIX**, and to document that **high idiosyncratic volatility stocks earn abysmally low average returns**—a finding that **cannot** be explained by their exposure to aggregate volatility risk, nor by size, value, momentum, or liquidity.

For a quant: this is the foundational “low-vol / low-idio-vol” anomaly paper in equities, alongside the systematic volatility-risk pricing result.

---

## Setup / Data

### Aggregate volatility proxy

- **VIX** (CBOE): implied volatility of S&P 100 options until the later VIX methodology; sample from **Jan 1986**.
- Innovation: $\Delta\mathrm{VIX}_t = \mathrm{VIX}_t - \mathrm{VIX}_{t-1}$ (daily). Mean ΔVIX ≈ 0; SD cited in text; AR(1) of ΔVIX ≈ 0 (negligible serial correlation)—reasonable innovation measure.
- Figure 1: large spikes in Oct 1987 and Aug 1998.

### Factor-mimicking portfolio FVIX

To obtain a traded factor, the authors project ΔVIX onto a basis of stock portfolios and take the fitted return as **FVIX**—the return of a portfolio designed to track aggregate volatility innovations. Ex post FVIX loadings are then used in Fama–MacBeth and time-series tests.

### Idiosyncratic volatility

For stock $i$ in month $t$, estimate FF-3 on daily data within the month:

$$
r_{i,d} = \alpha_i + \beta_{i,M}\mathrm{MKT}_d + \beta_{i,S}\mathrm{SMB}_d + \beta_{i,H}\mathrm{HML}_d + \varepsilon_{i,d},
$$

and set

$$
\mathrm{ivol}_{i,t} = \sqrt{\widehat{\mathrm{Var}}(\varepsilon_{i,d})}\quad\text{(within-month daily residual SD)}.
$$

Total volatility = within-month daily return SD without factor adjustment. Require >17 daily observations in the month.

### Portfolio formation

- **Systematic vol exposure**: each month, regress daily excess returns on MKT and ΔVIX over the past month (eq. 3); sort into value-weighted **quintiles** by $\beta^{\Delta\mathrm{VIX}}$. Hold one month (1/0/1).
- **Idio vol**: sort into VW quintiles by prior-month ivol (or total vol); 1/0/1.

Controls in double sorts / characteristic adjustments: size, B/M, momentum, liquidity (Pástor–Stambaugh), volume, leverage, bid–ask, coskewness, analyst dispersion, etc.

---

## Model / Methods

### Pre-formation two-factor regression

$$
r^i_t = \beta_0 + \beta^i_{\mathrm{MKT}}\mathrm{MKT}_t + \beta^i_{\Delta\mathrm{VIX}}\Delta\mathrm{VIX}_t + \varepsilon^i_t.
$$

Rationale for omitting SMB/HML in the *sorting* regression: keep estimation noise down in a short window; control for FF-3 *ex post* in alphas and in FM pricing.

### Requirements for a factor explanation

1. Contemporaneous link between loadings and average returns.
2. Persistent / ex post loadings that line up with pre-formation sorts (otherwise the sort is not capturing a stable factor exposure).

### Fama–MacBeth with FVIX

Second-pass cross-sectional regressions on 25 portfolios (e.g., β_MKT × other sorts) estimate the price of FVIX risk $\lambda_{\mathrm{FVIX}}$.

### Idio-vol anomaly tests

Time-series CAPM and FF-3 alphas of ivol-sorted quintiles; double sorts with size, B/M, momentum, liquidity, volume, and with $\beta^{\Delta\mathrm{VIX}}$ itself to see whether aggregate vol exposure subsumes the ivol effect (it does not).

---

## Results with Numbers

### Table I — Portfolios sorted by $\beta^{\Delta\mathrm{VIX}}$ (1986–2000)

Pre-formation $\beta^{\Delta\mathrm{VIX}}$ averages: quintile 1 = **−2.09**; quintile 5 = **+2.18**.

| Quintile | Mean ret %/mo | FF-3 α | Ex post β_FVIX |
|----------|---------------|--------|----------------|
| 1 (low β) | 1.64 | +0.30 | **−5.06** |
| 2 | 1.39 | +0.09 | −2.72 |
| 3 | 1.36 | +0.08 | −1.55 |
| 4 | 1.21 | −0.06 | +3.62 |
| 5 (high β) | (lowest) | | **+8.07** (implied by text spread) |

**5−1 average return spread: −1.04% per month** (highly significant). CAPM α spread **−1.15%**; FF-3 α spread **−0.83%**. Joint GRS-style tests reject zero alphas.

Next-month post-formation $\beta^{\Delta\mathrm{VIX}}$ remains monotonically increasing but much attenuated (mean reversion of estimated betas)—yet full-sample ex post FVIX betas preserve the ordering strongly (from −5.06 to high positive).

### Price of aggregate volatility risk

Fama–MacBeth (Table V): $\hat\lambda_{\mathrm{FVIX}} \approx \mathbf{-0.08\%}$ per month ≈ **−1% per annum**, statistically significant, sign-consistent with option literature.

Accounting exercise: ex post FVIX beta spread between Q5 and Q1 ≈ $8.07 - (-5.06) = 13.13$. Then

$$
13.13 \times (-0.080\%) \approx -1.05\%
$$

per month—**almost exactly** matches the −1.04% raw 5−1 return spread. Virtually all of the systematic-vol sort’s return differential is attributable to priced FVIX exposure.

### Peso / sample concern

Only two major vol spikes (1987, 1998) in-sample. Authors discuss whether the small negative FVIX mean is a peso artifact (fewer crashes than agents expected). Statistical significance survives, but economic magnitude of $\lambda$ is modest (−1%/yr); the *cross-sectional* spread is large because beta dispersion is large.

### Table VI — Total and idiosyncratic volatility sorts (1963–2000)

**Panel A (total vol):**

| Q | Mean %/mo | % mkt share | FF-3 α |
|---|-----------|-------------|--------|
| 1 low | 1.06 | 41.7% | +0.03 |
| 3 | 1.22 | 15.5% | +0.12 |
| 5 high | **0.09** | 2.4% | **−1.16** ($t=-6.85$) |
| 5−1 | **−0.97** ($t=-2.86$) | | **−1.19** ($t=-5.92$) |

**Panel B (idio vol vs FF-3):**

| Q | Mean | % mkt share | FF-3 α |
|---|------|-------------|--------|
| 1 | 1.04 | **53.5%** | +0.04 |
| 5 | **−0.02** | **1.9%** | **−1.27** ($t=-7.68$) |
| 5−1 | **−1.06** ($t=-3.10$) | | **−1.31** ($t=-7.00$) |

High-ivol stocks are small and high B/M—FF-3 therefore predicts they should have *high* returns; instead alphas are deeply negative. Quintile 5 is only ~2% of market cap—raising investability questions—but the alpha is not a tiny-stock curiosity alone (robustness below).

### Controls (Tables VII–IX narrative)

The ivol effect survives controls for:

- Size, B/M, leverage
- Liquidity beta (Pástor–Stambaugh) and volume
- Momentum (past 1m, 12m)—important because high ivol correlates with losers; double sorts still show ivol alpha within momentum buckets
- Coskewness, analyst forecast dispersion, bid–ask spreads

**Critical result vs aggregate vol:** after controlling for $\beta^{\Delta\mathrm{VIX}}$ / FVIX loadings, the ivol 5−1 alpha remains large. High idiosyncratic volatility’s low return is **not** the same phenomenon as high systematic volatility exposure. Two distinct facts:

1. High **systematic** vol beta → low returns ≈ priced FVIX risk (−1%/yr price).
2. High **idiosyncratic** vol → low returns ≈ anomaly relative to FF-3, not explained by FVIX.

### Robustness highlights

- NYSE-only and large-cap subsets: effect smaller but typically still present for ivol.
- Value-weighting already used (conservative vs EW).
- Alternative ivol vs CAPM residuals ≈ identical to FF-3 residuals (correlation >99% across quintile portfolios).

---

## Limitations / Critical Assessment

1. **VIX sample short (1986–2000)** for systematic-vol tests; peso problem real. Later literature extends with VIX/VXO longer samples and confirms negative vol risk price with varying magnitudes.
2. **Ivol sort capacity**: Q5 is ~2% of market; transaction costs, short-sale constraints, and borrow fees are first-order for harvesting the −1.3%/mo FF-3 alpha. Subsequent work (e.g., Stambaugh–Yu–Yuan, short-leg explanations) stresses that much of the anomaly is in hard-to-short names.
3. **Lottery / skewness**: paper discusses coskewness but later Bali–Cakici–Whitelaw and related work emphasize retail lottery demand as a complementary explanation for low ivol returns.
4. **Factor mimicking**: FVIX construction choices affect $\lambda$ estimates; results are qualitative-robust but quantitative λ is small.
5. **Does not claim** a full ICAPM estimation with continuous-time volatility; reduced-form factor approach.

---

## Practical Takeaways for a Quant Investor

1. **Two separate “vol” trades:**
   - **Systematic**: underweight stocks that rally when VIX jumps (positive $\beta^{\Delta\mathrm{VIX}}$); this is a risk-premium harvest with λ ≈ −1%/yr per unit FVIX beta—but beta dispersion makes portfolio-level premia larger.
   - **Idiosyncratic**: underweight / short high prior-month residual-vol names; historically enormous FF-3 alpha (−1.3%/mo 5−1) but capacity- and shorting-constrained.
2. **Low-vol investing** as practiced in industry often blends low total vol and low beta; Ang et al. caution that low *idiosyncratic* vol is a distinct signal from low *systematic* vol exposure.
3. **Risk model implication**: include a traded vol factor (FVIX or option-implied) in equity risk models; residual-vol characteristic still needs an alpha overlay.
4. **Portfolio construction**: if harvesting ivol, neutralize size and ensure the short leg is locate-rich; consider longer formation windows than 1 month to reduce turnover (tradeoff vs signal freshness—later literature explores).
5. **Correlation with momentum crashes**: high-ivol names overlap with losers; combining Ang et al. ivol with Daniel–Moskowitz crash control is prudent.

---

## Equations Desk Card

$$
r^i_t=\beta_0+\beta^i_{\mathrm{MKT}}\mathrm{MKT}_t+\beta^i_{\Delta\mathrm{VIX}}\Delta\mathrm{VIX}_t+\varepsilon^i_t
$$

$$
\lambda_{\mathrm{FVIX}}\approx -0.08\%/\mathrm{month}\approx -1\%/\mathrm{year}
$$

$$
\alpha^{\mathrm{FF3}}_{5-1}(\mathrm{ivol})\approx -1.31\%/\mathrm{month}\quad(t\approx -7)
$$

$$
\mathrm{ivol}_{i,t}=\mathrm{SD}_d(\varepsilon_{i,d}^{\mathrm{FF3}})
$$

---

## Extended Discussion: Why Negative Price of Vol Risk?

Campbell’s ICAPM intuition: when market volatility rises, future investment opportunities worsen (higher vol for given mean, or lower expected returns via feedback). Assets that pay off in those states (positive vol beta) provide insurance → higher prices → lower expected returns. Bakshi–Kapadia: vol-sensitive assets hedge downside. Harvey–Siddique: positive vol-beta stocks have positively skewed payoffs preferred by coskewness-loving agents.

Option markets embed the same negative price via expensive puts / high implied vol risk premium. Ang et al.’s equity-cross-section estimate aligns in **sign** with options; the equity route allows controls for SMB, HML, momentum, liquidity that option papers lack.

---

## Extended Discussion: Idiosyncratic Volatility Puzzle

Under CAPM/FF-3 completeness, ivol should not price. Explanations surveyed by subsequent literature (building on this paper):

- **Omitted factor**: rejected here for aggregate vol; other candidates (jump risk, microstructure) partially tested.
- **Short-sale constraints / asymmetric information**: high ivol → disagreement → overpricing if shorting constrained (Miller 1977).
- **Lottery preferences**: investors overpay for high-ivol, high-skew names.
- **Maxing-out effects**: related Bali–Cakici–Whitelaw MAX anomaly.

Ang et al.’s key empirical claim that still disciplines theory: the ivol effect is **not** aggregate-vol exposure in disguise.

---

## Sample Construction Details for Replication

- Daily CRSP returns; FF factors from Ken French.
- VIX from CBOE; beware VIX methodology change (VIX vs VXO)—paper uses the series available contemporaneously for 1986–2000.
- Monthly rebalance; VW within quintiles using lagged market cap.
- Newey–West t-stats on monthly portfolio returns.
- Joint alpha tests: GRS and robust variants.

Replication targets: Table I 5−1 mean ≈ −1.04%/mo; Table VI Panel B 5−1 FF-3 α ≈ −1.31%/mo; FM λ_FVIX ≈ −0.08%/mo.

---

## Relation to Low-Beta / Betting-Against-Beta

Ang et al. is about **volatility** (total, idiosyncratic, and systematic vol *sensitivity*), not directly about market beta. Black–Jensen–Scholes / Frazzini–Pedersen BAB concerns low-beta vs high-beta. Empirically high-ivol and high-beta overlap, but double sorts in the literature (and controls in Ang et al.) show distinct components. A production “defensive equity” book should separate: (i) low beta, (ii) low residual vol, (iii) negative FVIX beta, rather than treating “low vol” as one knob.

---

## Numerical Digest

| Quantity | Value |
|----------|-------|
| ΔVIX-sort 5−1 mean (1986–2000) | −1.04%/mo |
| FF-3 α 5−1 (ΔVIX sort) | −0.83%/mo |
| λ_FVIX | −0.08%/mo (~−1%/yr) |
| FVIX beta spread Q5−Q1 | ~13.1 |
| Explained by λ×Δβ | ~−1.05%/mo |
| Ivol 5−1 mean (1963–2000) | −1.06%/mo |
| Ivol 5−1 FF-3 α | **−1.31%/mo** ($t=-7$) |
| Ivol Q5 market share | ~1.9% |
| Total vol 5−1 FF-3 α | −1.19%/mo |

---

## Bottom Line

Ang, Hodrick, Xing, and Zhang establish two cornerstone facts. First, innovations in aggregate volatility are a **priced risk factor** with a negative price (~−1% per year); stocks that hedge vol shocks earn low average returns, and a mimicking portfolio FVIX accounts for the cross-sectional spread in ΔVIX-beta portfolios. Second, stocks with high **idiosyncratic** volatility relative to FF-3 earn disastrously low returns (~−1.3% FF-3 alpha per month for 5−1), and this anomaly is **not** explained by aggregate volatility exposure or by standard characteristics. For quants, treat systematic vol risk and the ivol anomaly as separate design problems—one a risk premium, one an alpha/short-constraint phenomenon.

---

## Deeper Dive: Table I Mechanics and Persistence of Betas

Pre-formation betas use only ~20 daily observations; sampling error is large, so the enormous pre-formation range (−2.09 to +2.18) shrinks dramatically next month (post-formation ΔVIX betas near zero but still ordered). Full-sample FVIX regressions restore large, ordered ex post betas (−5 to +8). This pattern is classic in conditional-beta sorts: short-window estimates are noisy but contain a persistent component revealed by long-horizon ex post loadings. For implementation, prefer **shrunk** or longer-window vol-beta estimates (e.g., 3–6 months of daily data, or Bayesian shrink to cross-sectional mean) to reduce turnover from noise.

Value-weighting matters: equal-weighted ΔVIX sorts would load more on microcaps and inflate spreads. The paper’s VW design is the conservative, institution-relevant cut.

Market-share column in Table I shows middle quintiles dominate cap; extreme vol-beta quintiles are smaller—again a capacity note for pure quintile sleeves.

---

## Deeper Dive: Idiosyncratic Volatility and Momentum Interaction

Because losers have high residual vol, a naive ivol short may duplicate momentum’s short leg. Table VIII-style controls (past 1-month and past 12-month sorts) show that within momentum buckets, high ivol still underperforms. Conversely, momentum profits are not subsumed by ivol. Production implication: include **both** 12-2 momentum and ivol in a characteristic model (à la Lewellen 2015-style FM), with collinearity diagnostics; do not drop one for the other.

One-month total vol / ivol signals churn; transaction-cost-aware versions use lower rebalance frequency or require persistence (e.g., average ivol over 3 months).

---

## Deeper Dive: Liquidity and Volume Controls

Pástor–Stambaugh liquidity beta sorts and volume sorts (Table IV panels) address whether high-ivol / high-vol-beta names are simply illiquid. Panel evidence: controlling for liquidity beta, the vol effects remain. High volume does not fully explain low returns of high-ivol names either—important because one might fear microstructure bias in daily residual SDs for low-price names.

Still, excluding stocks below \\$5 or below NYSE 20th percentile size is a prudent robustness overlay for live trading even if the academic table includes them.

---

## Information for Risk Systems

- Add FVIX (or ΔVIX beta) as a style exposure in barra-like models.
- Flag names with high ivol as higher idiosyncratic risk *and* negative alpha expectation under the anomaly view.
- During VIX spikes, expect positive-FVIX-beta names to outperform—hedges work when you need them, which is why they earn low average returns.

---

## What Changed After 2006 (context for the reader)

Later work confirmed the ivol puzzle’s existence but debated its source (short-leg, lottery MAX, mispricing vs risk). Low-volatility ETFs and defensive factors industrialized the long side (low vol / low beta). Option-implied vol risk premium literature refined λ estimates. None of that overturns Ang et al.’s twin findings; it contextualizes implementation.

---

## Final Synthesis

Read this paper as two papers in one binding. Paper A: ICAPM/option-consistent negative price of aggregate volatility risk, identified in the equity cross-section with ΔVIX and FVIX. Paper B: the idiosyncratic volatility anomaly—high residual-vol stocks’ low returns—not reducible to Paper A. Quant processes should implement them with different tools: a risk-factor loading constraint for A, and an alpha signal with realistic shorting/cost model for B.

---

## Section-by-Section Walkthrough with Extra Quantitative Detail

### Introduction claims (restated with magnitudes)

The abstract’s two sentences map to: (i) high sensitivity to aggregate volatility innovations → low average returns, with estimated price of risk ≈ −1% per annum; (ii) high idiosyncratic volatility relative to Fama–French (1993) → “abysmally low” average returns, with FF-3 alpha of the high-minus-low quintile on the order of **−1.3% per month**. Neither size, book-to-market, momentum, nor liquidity accounts for these patterns. Aggregate volatility exposure does **not** explain the idiosyncratic volatility effect.

### Why the cross-section of stocks (not only options)?

Option studies identify a negative volatility risk premium from index or equity option panels, but they typically cannot control for SMB, HML, momentum, and liquidity simultaneously in a transparent Fama–MacBeth design. Sorting equities on estimated ΔVIX betas creates a panel of portfolios whose mean returns should line up with vol loadings if vol is priced. That design also yields a traded mimicking portfolio FVIX usable in standard linear asset-pricing tests.

### Economic channels for $\lambda_{\sigma}<0$

1. **ICAPM / investment opportunity set**: rises in market volatility worsen the risk-return tradeoff or forecast lower future opportunities; agents pay for assets that hedge those states.
2. **Downside coincidence**: high-vol states coincide with market drops (French–Schwert–Stambaugh; Campbell–Hentschel); positive vol-beta assets hedge downside.
3. **Coskewness**: positive vol-beta names tend to have positively skewed intermediate-horizon returns; coskewness-loving agents (Harvey–Siddique) bid up prices.
4. **Structural models**: Bates (2001), Vayanos (2004) deliver reduced forms with negative vol risk prices.

### Pre-formation regression design choices

Equation (3) uses only MKT and ΔVIX with one month of daily data. Adding SMB and HML in the sorting regression would burn degrees of freedom (~20 points) and increase turnover from noise. Post-formation, alphas are reported vs CAPM and FF-3; FVIX is added in four-factor time-series regressions for ex post loadings.

Pastor–Stambaugh (2003) similarly use daily one-month windows for liquidity betas—precedent for the noisy-but-timely estimation philosophy.

### Interpreting Table I beyond the headline −1.04%

- Raw means decline nearly monotonically with past ΔVIX beta.
- CAPM adjustment **widens** the 5−1 gap to −1.15%: high vol-beta stocks do not fail because they have low market betas; if anything, market adjustment worsens their relative performance.
- FF-3 adjustment **narrows** the gap to −0.83%: some of the raw spread is correlated with size/value exposures, but most remains.
- Joint tests reject the null that all quintile alphas are zero.

### FVIX construction intuition

Think of FVIX as the return on a portfolio $w^\top R$ chosen so that $w^\top R$ maximally correlates with ΔVIX (subject to constraints). Then $\beta_{\mathrm{FVIX}}$ is a traded-factor loading. The FM estimate $\lambda_{\mathrm{FVIX}}\approx -0.08\%$ per month is the mean return attached to a unit FVIX beta after controlling for other factors in the cross-section of test assets (25 portfolios in Table V).

The accounting identity $13.13 \times (-0.08\%) \approx -1.05\%$ is unusually clean in empirical asset pricing—often λ×Δβ explains only a fraction of sorts’ spreads. Here it explains essentially all of the ΔVIX-beta sort’s raw spread, which is strong support for a risk interpretation **of that particular sort**.

### Idiosyncratic volatility: why FF-3 makes the puzzle sharper

High-ivol quintile stocks are small and high B/M. Under FF-3, they “should” earn a positive size+value premium. Observing **negative** raw returns and large **negative** FF-3 alphas means the anomaly is even more severe after risk adjustment than before. This is the opposite of many anomalies that shrink under FF-3.

Market-share figures: low-ivol quintile ≈ 53.5% of market cap; high-ivol ≈ 1.9%. An EW strategy would look even more extreme; VW already focuses attention on the investable long side (low ivol) more than the short side.

### Control battery (what was checked)

The paper systematically asks whether ivol is proxying for: illiquidity, low volume, high bid–ask, high leverage, adverse coskewness, high analyst disagreement, or momentum exposure. Across double sorts and characteristic controls, high-ivol underperformance persists. Controlling for aggregate vol betas likewise fails to kill the ivol alpha—hence the “two facts” conclusion.

### Momentum control detail

Sorting on past returns (1m and 12m) and then on ivol (Table VIII style) addresses the concern that ivol is merely a loser proxy. The 5×5 FF-3 alphas still show a vol effect within momentum groups. A quant combining signals should still orthogonalize (residualize ivol against momentum or use multivariate FM weights).

### Peso problem—honest reading

With only two huge spikes (1987, 1998), the estimated mean of FVIX could be upward-biased if agents feared more crashes than occurred (peso). That would bias $\lambda_{\mathrm{FVIX}}$ toward zero (less negative) or complicate inference. The authors discuss this; the cross-sectional slope remains significant. Practitioners should re-estimate λ on post-2000 data (2008, 2020 spikes) when updating the risk model.

### Implementation recipe (systematic vol)

1. Each month, estimate rolling ΔVIX or FVIX betas (preferably 3–6 months daily, EWMA, or shrink).
2. Penalize positive vol betas in portfolio optimization (risk constraint) or forecast lower expected returns via $\hat\lambda\hat\beta$.
3. Recalibrate λ annually with FM on a broad portfolio set.

### Implementation recipe (idio vol)

1. Compute prior-month FF-3 residual SD; winsorize extremes.
2. Use as negative alpha signal; impose borrow-availability filters on the short side.
3. Prefer VW or capped-VW implementation; monitor AR(1) of signal and turnover.
4. Combine with low-beta / BAB carefully to avoid double counting.

### Links to Daniel–Moskowitz momentum crashes

High-ivol names and losers overlap. In panic rebounds, shorting high-ivol may face the same written-call exposure as shorting losers. Vol-targeting and panic-state scaling (Daniel–Moskowitz) pair naturally with an ivol short sleeve.

### Links to Cooper–Gulen–Schill asset growth

High investment / asset growth firms sometimes show elevated volatility; check cross-correlations before treating all “anomaly shorts” as independent. Multivariate characteristic models (Lewellen) are the right combination device.

### Statistical appendix for the desk

- Newey–West HAC on monthly portfolio returns.
- GRS tests for joint alpha = 0.
- Robustness: NYSE only, price filters, longer formation windows.
- Replication tolerances: match Table VI Panel B 5−1 FF-3 α to about −1.3%/mo; Table I 5−1 mean to about −1.0%/mo.

### Concise critique

Strengths: clean identification design; dual contribution; careful controls; bridge to option literature. Weaknesses: short VIX sample for factor pricing; limited capacity of ivol short; reduced-form rather than structural vol model; daily-within-month ivol sensitive to microstructure.

### Bottom line restated

Estimate and constrain **aggregate volatility betas** as a priced risk exposure with $\lambda<0$. Separately, treat **high idiosyncratic volatility** as a strong negative expected-return characteristic that survives FF-3 and is not FVIX in disguise. Do not conflate the two under a single “low volatility” label.

---

## Final Numerical Digest (Ang et al.)

| Quantity | Estimate |
|----------|----------|
| ΔVIX-sort 5−1 mean return | −1.04%/mo |
| ΔVIX-sort CAPM α 5−1 | −1.15%/mo |
| ΔVIX-sort FF-3 α 5−1 | −0.83%/mo |
| Pre-formation βΔVIX Q1 / Q5 | −2.09 / +2.18 |
| Ex post βFVIX Q1 | −5.06 |
| FVIX beta spread Q5−Q1 | ~13.13 |
| λ_FVIX (FM) | −0.08%/mo (~−1%/yr) |
| λ × Δβ explains | ~−1.05%/mo of raw spread |
| Ivol 5−1 mean | −1.06%/mo |
| Ivol 5−1 FF-3 α | −1.31%/mo (t≈−7) |
| Total vol 5−1 FF-3 α | −1.19%/mo (t≈−5.9) |
| Ivol Q5 market cap share | ~1.9% |
| Systematic vol sample | 1986–2000 |
| Ivol sample | 1963–2000 |

These figures are the operational digest for risk models and alpha research.

For completeness: the paper also shows that results are robust to defining idiosyncratic volatility relative to the CAPM rather than FF-3 (quintile portfolio correlations above 99%), and that excluding the 1987 crash month does not overturn the qualitative cross-sectional pricing of volatility risk, though magnitudes move. Overall, Ang–Hodrick–Xing–Zhang remains required reading for any volatility-factor or defensive-equity research stack.
