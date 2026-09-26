# Betting Against Beta or Demand for Lottery? — Bali, Brown, Murray & Tang (2015) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Betting against Beta or Demand for Lottery? |
| **Authors** | Turan G. Bali (Georgetown); Stephen J. Brown (NYU Stern; Melbourne); Scott Murray (Nebraska); Yi Tang (Fordham) |
| **Version** | April 2015; **2014 Jack Treynor Prize** (Q-Group) |
| **Keywords** | Beta, Betting Against Beta, Lottery Demand, Stock Returns, Funding Liquidity |
| **Core proxy** | $MAX$ = average of the five highest daily returns within the month (Bali–Cakici–Whitelaw 2011); ≥15 daily obs |
| **Beta** | Slope of daily excess returns on market over trailing 12 months; ≥200 days |
| **Sample** | CRSP US equities with standard filters; monthly frequency; delisting per Shumway |
| **Original PDF** | `AbnormalReturns_Bali_2015.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsLUZEcnA3SUdfbXc` |
| **Extraction** | Drive `read_file` (~5,347 lines). No OCR failure. |

---

## Problem / Motivation

Black–Jensen–Scholes (1972) and a large subsequent literature document that high-beta stocks earn negative abnormal returns and low-beta stocks earn positive abnormal returns—the **betting-against-beta (BAB)** pattern. Frazzini–Pedersen (2014) attribute BAB to **leverage-constrained** investors overweighting high-beta names, flattening the security market line (SML).

This paper proposes an alternative: **lottery demand** (Kumar 2009; Bali–Cakici–Whitelaw 2011), consistent with cumulative prospect theory and realization utility. Lottery investors bid up stocks with high probabilities of large short-term upside. Market beta is one channel for such upside, so lottery demand falls disproportionately on high-beta stocks, raising their prices and lowering future returns—generating BAB.

Key predictions: (i) BAB disappears after controlling for lottery demand ($MAX$); (ii) BAB exists only when $\beta$–$MAX$ correlation is high; (iii) BAB and $MAX$ effects concentrate in low institutional ownership; (iv) a lottery factor $FMAX$ prices BAB/BAB factor, but not vice versa; (v) after controlling for lottery demand, the SML slope equals the market risk premium.

---

## Setup / Data / Variables

**β:** 12-month daily CAPM slope (≥200 days).

**MAX:** mean of five highest daily returns in month $t$ (≥15 days). Robust to $k\in\{1..5\}$ in online appendix.

**Dependent variable:** next-month excess return (Shumway delisting).

**Controls — firm characteristics:** MKTCAP / SIZE (log), BM, MOM (t−11..t−1), ILLIQ (Amihud), IVOL (FF3 residual SD, 1 month, ≥15 days).

**Controls — risk:** COSKEW (Harvey–Siddique), TSKEW, DRISK (Ang–Chen–Xing downside β), TRISK (Kelly–Jiang / Ruenzi–Weigert tail β); ≥200 days.

**Controls — funding liquidity sensitivities:** β on TED, VOLTED, TBILL, FLEV (financial leverage), estimated with ≥24 months in 5-year windows. These test FP’s funding-constraint channel.

---

## Model / Methods

1. Univariate deciles on β and on MAX (EW and VW; FFC4 alphas, NW6 *t*-stats).
2. Bivariate sorts: β portfolios neutral to MAX (dependent and independent sorts).
3. Fama–MacBeth with β and MAX together; test whether β slope ≈ market risk premium.
4. Orthogonalize β to MAX; sort on residual β.
5. Condition BAB on cross-sectional Corr(β, MAX) months (high vs low).
6. Institutional ownership splits.
7. Factor $FMAX$: 2×3 size × MAX (FF style); average low-MAX minus average high-MAX (sign: paper reports average return −0.54%/mo on the construction as stated—lottery long/short orientation as defined in text).
8. Spanning: regress High−Low β and FP’s BAB factor on FFC4 ± PS liquidity ± FMAX.
9. SML tests: portfolios with market exposure but zero lottery/other-factor exposure; compare mean return to market premium.
10. Validate MAX as lottery: links to price, IVOL, idiosyncratic skewness; persistence to 1 year; reject MAX as priced risk factor via FMAX loadings.

---

## Results with Numbers

### Univariate β deciles (Table 1 style)
Post-ranking β from ≈0 (decile 1) to ≈2.02 (decile 10). Excess returns drift down from **0.69%** to **0.35%/mo** (High−Low −0.35%, insignificant). **FFC4 alphas:** low-β **+0.22%** (*t*=2.22); high-β **−0.29%** (*t*=−2.22); High−Low α **−0.51%** (*t*=−2.50)—the BAB anomaly. High-β portfolio: small fraction of names but **12.86%** of market cap vs **1.92%** for low-β; positive SMB, negative HML/UMD loadings.

### Univariate MAX deciles
High−Low excess return **−1.15%/mo** (*t*=−4.41); FFC4 α **−1.40%** (*t*=−8.95)—lottery demand effect much stronger raw than BAB.

### Bivariate / FM / orthogonal β
When portfolios are MAX-neutral, High−Low β alphas vanish. FM with MAX included: β coefficient **positive** and economically near the market risk premium. Sorting on MAX-orthogonal β: no BAB.

### Channel tests
β and MAX highly cross-sectionally correlated in the average month. In **low** Corr(β,MAX) months, BAB absent; in **high** correlation months, BAB strong—and those months coincide with high aggregate lottery demand. BAB and MAX effects exist primarily among **low institutional ownership** stocks—fits retail lottery demand, harder for funding-liquidity story alone.

### FMAX factor
Average monthly return about **−0.54%** (*t* large). Augmenting FFC4 with FMAX: High−Low β α goes from **−0.51%** (*t*=−2.50) to **+0.06%** (*t*=0.35). With PS liquidity too: α **0.04%** (*t*=0.22). High-β portfolio’s FMAX loading ≈ **0.85** (*t*=12.49). FMAX explains FP’s BAB factor; BAB does **not** explain FMAX.

### SML restoration
After neutralizing lottery demand, reject zero slope on β; **fail to reject** slope equal to the contemporaneous market risk premium—lottery demand is an overlay on standard risk/reward, not a replacement.

### MAX construct validity
No support for MAX as risk or as sensitivity to a priced FMAX factor in the cross-section of FMAX loadings. MAX strongly related to low price, high IVOL, high idiosyncratic skewness contemporaneously and forward; persists up to a year—lottery characteristics per Kumar (2009).

---

## Limitations

β definition differs from FP’s construction (robustness claimed in appendix). MAX is one lottery proxy among several (jackpot probability, ISKEW, etc.). Institutional ownership is an imperfect retail proxy. Factor spanning tests are in-sample. Lottery explanation and leverage constraints could coexist; paper argues lottery is the main driver of *measured* BAB. Sample and filters follow standard CRSP practices but deserve PIT replication. Very long paper—online appendix carries many robustness checks not fully extracted here.

---

## Practical Takeaways for a Quant Investor

1. **Do not run a naive low-beta / BAB sleeve without a lottery/MAX control**—you may just be short lottery stocks.
2. Prefer **MAX (or related lottery scores)** as the direct characteristic; FMAX as the factor for risk models.
3. BAB “alpha” is largely **FMAX exposure** (loading ~0.85 on High−Low β).
4. Focus lottery/BAB trades in **low IO** names where the effect lives; expect little in high-IO large caps.
5. Time-vary: BAB stronger when Corr(β,MAX) is high / aggregate lottery demand is elevated.
6. After neutralizing MAX, **trust beta again**—SML slope ≈ market premium; use β for risk budgeting without expecting BAB alpha.
7. Funding-liquidity betas (TED, etc.) do not displace MAX in the paper’s horse races—do not assume FP’s channel is sufficient.
8. Risk models: add FMAX alongside FFC4; expect BAB factor residuals to collapse.

---

## Expanded Discussion: Mechanism

Lottery investors want right-tail payoffs. A stock’s market β scales its response to market up-moves; holding idiosyncratic skewness fixed, higher β raises the chance of large positive daily returns—the ingredients of MAX. Bidding pressure on high-β names flattens the SML: intercept above $r_f$, slope below $E[R_m]-r_f$. Low-β names, starved of lottery demand, become cheap and earn positive alpha. This is isomorphic to FP’s price-pressure story but with a different demand source—and one that predicts the IO and Corr(β,MAX) interaction patterns FP’s leverage channel does not naturally emphasize.

## Expanded Discussion: Spanning

The spanning result is asymmetric: FMAX kills BAB, BAB does not kill FMAX. That asymmetry is the statistical definition of “BAB is a manifestation of lottery demand,” not merely a correlate. Combined with the SML restoration tests, the paper rehabilitates the CAPM as a conditional risk-reward relation once a behavioral overlay is controlled.

## Desk Implementation Notes

- Compute MAX month-end; skip stocks with <15 daily returns.
- Compute β with 12-month daily window; require 200 observations.
- For a lottery-neutral low-volatility book: double-sort or regress β on MAX and use residual β—or simply optimize for low IVOL/low MAX rather than low β.
- For a pure lottery strategy: short high MAX, long low MAX, size-neutral via 2×3; hedge FFC4.
- Monitor aggregate MAX and average Corr(β,MAX) as regime indicators for when low-beta overlays will look good or bad ex post.

## Related Literature Hooks

FP 2014 BAB; BCW 2011 MAX; Kumar 2009 lottery; Baker–Bradley–Wurgler 2011; Barberis–Huang prospect theory; Hong–Sraer limits to arbitrage; Black 1972/1993 leverage constraints. International MAX evidence: China (Carpenter–Lu–Whitelaw), Europe (Annaert; Walkshäusl), Australia (Zhong–Gray).

## Scholar Index Tags

`BAB`, `lottery`, `MAX`, `beta`, `FMAX`, `SML`, `institutional-ownership`, `funding-liquidity`, `Treynor-prize`, `2015`.

## Detailed Factor and Portfolio Arithmetic

The High−Low beta portfolio’s FFC4 alpha of minus fifty-one basis points per month with a Newey–West t-statistic of minus two point five is the paper’s jumping-off point. That alpha is roughly symmetric in origin: low-beta decile contributes plus twenty-two basis points and high-beta contributes minus twenty-nine basis points. Market-cap concentration in high-beta names (twelve point eight six percent of capitalization versus one point nine two percent in low-beta) means value-weighted versions of BAB are economically important for market-wide SML estimates, not only equal-weighted micro curiosities.

MAX’s High−Low FFC4 alpha of minus one point four zero percent per month with a t-statistic of minus eight point nine five dwarfs BAB in both magnitude and statistical force. Any horse race that fails to control for MAX when studying beta is therefore mis-specified in a first-order way. The bivariate neutrality results show the mis-specification is not cosmetic: MAX-neutral beta sorts lose the BAB alpha entirely.

Fama–MacBeth slopes on beta flip from the classic weak/negative pattern to a significantly positive coefficient once MAX enters the regression, with magnitudes aligned to historical market premia. That alignment is the micro-foundation for the later SML tests using factor-mimicking portfolios that load on the market but not on FMAX.

The FMAX factor’s construction parallels Fama–French RMW/CMA methodology: two size groups by median, three MAX groups by 30/70 breakpoints, six value-weighted intersections, then average of the two low-MAX portfolios minus average of the two high-MAX portfolios (orientation as defined in the paper). Its roughly minus fifty-four basis points mean monthly return is the lottery premium in factor form. When FMAX joins FFC4, the High−Low beta alpha becomes six basis points with t-statistic zero point three five—economically and statistically zero. The High−Low beta portfolio’s FMAX loading near zero point eight five with t-statistic twelve point four nine shows BAB is largely a lottery-factor bet.

FP’s BAB factor itself is explained by FMAX in spanning regressions, while the reverse spanning fails. This one-way spanning is stronger evidence than simple correlation.

Conditional sorts on the month’s cross-sectional correlation between beta and MAX provide the mechanism test. Only when lottery demand pressure is concentrated on high-beta names does BAB appear. Months of high aggregate lottery demand coincide with high correlation months. Institutional ownership splits show both BAB and MAX phenomena live in low-IO stocks, matching retail lottery behavior documented by Barber–Odean and Kumar.

Construct validity tests reject interpreting MAX as a risk measure: relations between MAX and conventional risk metrics go the wrong way for a risk story, and loadings on FMAX do not predict returns in the manner a priced risk factor would require. Instead MAX lines up with low price, high idiosyncratic volatility, and high idiosyncratic skewness—Kumar’s lottery trio—both contemporaneously and in the future, with persistence out to at least twelve months.

## Practical Regime Dashboard

Track three series monthly: (1) aggregate MAX (cross-sectional mean or median), (2) rank correlation between beta and MAX, (3) median IO among high-beta names. When (1) and (2) are elevated and (3) is low, expect BAB strategies to print; when (2) is low, expect BAB to be flat and pure low-beta risk reduction to work without alpha. After MAX neutralization, use beta as a risk dial with slope equal to the equity premium—exactly the CAPM prescription.

## Limitations and Open Issues

Alternative beta estimators (FP’s methodology, Dimson lags, weekly betas) are addressed in the appendix but should be re-checked in each production system. Lottery proxies beyond MAX may capture additional dimensions (cumulative prospect-theory value, expected idiosyncratic skewness). Funding liquidity could still matter for other anomalies even if it does not explain BAB once MAX is controlled. Transaction costs of shorting high-MAX names (often small, volatile, low-IO) can erode the impressive raw alphas. Post-2015 data may show partial decay after the Treynor Prize publicity.

## Synthesis

Betting against beta, as measured in the standard empirical literature, is predominantly a lottery-demand phenomenon. Control for MAX, and the CAPM’s risk-reward tradeoff reappears. For quants: trade lottery directly if you want that premium; do not launder it through a low-beta label; restore beta as a risk measure after neutralization.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.


### Additional robustness narrative
The paper verifies that results hold for equal- and value-weighted portfolios, dependent and independent bivariate sorts, and alternative MAX definitions averaging the k highest daily returns for k from one through five. Funding-liquidity sensitivities to TED, TED volatility, T-bill rates, and financial-sector leverage do not subsume the MAX channel. Co-skewness, downside beta, and tail beta likewise fail to explain BAB once MAX is present. High-MAX portfolios are themselves high-MAX assets, including when MAX is orthogonalized to beta—important for interpreting FMAX as a genuine lottery factor rather than a mechanical remix of beta.
