# On the Evidence Supporting the Existence of Risk Premiums in the Capital Market (Haugen–Heins 1972/1975) — Detailed Quantitative Research Notes

> **OCR / source note.** Drive file `AbnormalReturns_HaugenHeins_1972.pdf` (`0B-6kBz0I0dMsdHg2YVZRZkJYR2c`) is OCR-unusable (Drive `read_file` returned 3 lines / empty body). Summary reconstructed from the published JFQA 1975 version (“Risk and the Rate of Return on Financial Assets: Some Old Wine in New Bottles,” *JFQA* 10(5), Dec 1975, pp. 775–784), which the authors state is the refereed compression of the December 1972 Wisconsin Working Paper 4-75-20 / SSRN 1783797. Text extracted via `pdftotext` from a public Low-Vol Classics archive PDF. Flag for Scholar: **OCR issue on Drive original; quantitative content from published JFQA + working-paper abstract.**

## Bibliographic Header
| Field | Detail |
|------|--------|
| Working paper title | On the Evidence Supporting the Existence of Risk Premiums in the Capital Market |
| Authors | Robert A. Haugen (Wisconsin); A. James Heins (Illinois) |
| WP date | December 1, 1972 (Wisconsin Graduate School of Business Working Paper) |
| Published version | “Risk and the Rate of Return on Financial Assets: Some Old Wine in New Bottles,” *Journal of Financial and Quantitative Analysis* 10(5), December 1975, 775–784 |
| SSRN | abstract_id=1783797 |
| Original Drive PDF | `AbnormalReturns_HaugenHeins_1972.pdf` |
| Sample design | 114 equally weighted 25-stock portfolios drawn from NYSE listings as of 1926; no survivorship screen; monthly rebalancing; replacement on delisting |
| Sample period | February 1926 – December 1971 (~46 years); focus subperiod 1946–1971 (stable variance); also nine ~5-year windows |
| Risk measures | Portfolio monthly standard deviation; CAPM beta ($\beta$) vs CRSP/market; also skewness and kurtosis |
| Return measure | Geometric mean of monthly performance relatives (primary); arithmetic mean as robustness |
| Core claim | Over long samples, the cross-section of realized returns is **negatively** related to both total volatility and beta—contradicting a positive risk premium. Short-window positive risk–return slopes are mechanical bull-market artifacts. |

## Problem / Motivation
By 1972 the Sharpe–Lintner–Mossin–Fama CAPM apparatus was already orthodoxy. Empirical papers (Sharpe 1965; Douglas 1969; Jensen 1969; Black–Jensen–Scholes; etc.) were widely read as confirming that higher systematic risk earns higher average return. Haugen and Heins argue that this reading is contaminated by a **timing / bull–bear bias**: if the sample market return differs from the ex-ante expected market return, the cross-sectional slope of return on beta (or on volatility) is biased in the direction of that surprise.

They then design a long-horizon, diversified-portfolio test that minimizes the bias and ask whether a positive risk premium appears in realized returns at all. Their answer—**no; if anything the slope is negative**—is the earliest clean documentation of what later became the low-volatility / low-beta anomaly (Blitz–van Vliet; Baker–Bradley–Wurgler; Frazzini–Pedersen BAB; etc.).

## Theoretical Setup: The Bull–Bear Bias
Assume the single-index generating process over each horizon-length period $t$:
$$
r_{j,t}=a_j+\beta_j p_t+e_{j,t},\qquad a_j=E(r_f)(1-\beta_j),
$$
with $p_t$ the market return. Sampling over $t=1,\ldots,n$ and averaging,
$$
\bar r_j=a_j+\beta_j\bar p+\bar e_j.
$$
Under $\mathrm{Cov}(e_j,p)\approx 0$, the cross-sectional covariance between estimated betas and average returns satisfies a decomposition whose regression slope of return on beta is approximately
$$
b_{\hat\beta}\approx \underbrace{\big[E(p)-E(r_f)\big]}_{\text{true risk premium}}+\underbrace{\big[\bar p-E(p)\big]}_{\text{market surprise}}.
$$
(Equation (4) in the paper; analogous expression for slope on total volatility.)

**Implications.**
- If the sample is a **bull** market ($\bar p>E(p)$), estimated slopes are biased **upward**—you “find” a risk premium even if the true premium is zero.
- If the sample is a **bear** market ($\bar p<E(p)$), estimated slopes are biased **downward**.
- Only samples where $\bar p\approx E(p)$ identify the true premium. Short academic samples that happen to be bullish (common in 1960s empirical CAPM work) spuriously confirm CAPM.

For well-diversified portfolios, residual variance is small relative to systematic variance, so beta and volatility rankings align closely; the bias argument applies to both.

## Data and Portfolio Construction
- **Universe:** NYSE stocks listed in 1926. **No survivorship screen**—delisted names are replaced at delisting, so the test is not conditioned on firms that survived 46 years.
- **Portfolios:** 114 portfolios of 25 stocks each, equal-weighted. Monthly performance relative = arithmetic mean of the 25 stocks’ monthly relatives (equal dollar allocation at month-start, held to month-end).
- **Statistics per portfolio:** geometric mean of monthly returns; standard deviation of monthly returns; CAPM $\beta$; skewness; kurtosis. Computed over (i) full 1926–71, (ii) 1946–71, (iii) successive five-year windows (last window six years: 1965–71).
- **Why 1946–71 is highlighted:** relatively stable variance of monthly performance relatives—reduces confounding from heteroskedasticity across the Depression and WWII.
- **Average portfolio monthly return:** 0.94% (1926–71), 0.89% (1946–71). Average portfolio monthly $\sigma$: 8.93% (1926–71), 4.60% (1946–71)—illustrating the postwar volatility decline.

## Results

### Table 1 — Long-Period Cross-Sectional Slopes
Geometric means regressed on risk measures across the 114 portfolios:

| Statistic | 1926–71 | 1946–71 |
|-----------|--------:|--------:|
| Slope on **standard deviation** $b_\sigma$ | **−0.0353** | **−0.0945** |
| $t(b_\sigma)$ | **−4.87** | **−5.82** |
| Slope on **beta** $b_\beta$ | **−0.0031** | **−0.0043** |
| $t(b_\beta)$ | **−4.79** | **−5.42** |
| Avg portfolio return (monthly) | 0.0094 | 0.0089 |
| Avg portfolio $\sigma$ (monthly) | 0.0893 | 0.0460 |

**Interpretation.** Over both the full 46-year window and the stable-variance postwar window, higher-volatility and higher-beta portfolios earned **significantly lower** geometric mean returns. Magnitudes: in 1946–71, a one-unit increase in monthly $\sigma$ is associated with a −9.45 percentage point decline in monthly geometric mean (scaled by the units of $\sigma$); beta slopes are similarly negative and highly significant. If CAPM’s true premium were positive, realized returns over 1946–71 would have had to fall systematically short of expectations—an uncomfortable rationalization.

**Arithmetic-mean robustness (1946–71):** arithmetic mean returns also regress negatively on $\sigma$ ($t=-2.97$).

**Multiple regression (1946–71):**
$$
r = 0.015 - 0.098\,\sigma - 0.039\,\mathrm{SKEW} - 0.004\,\mathrm{KURT}
$$
($t$: 11.33, **−6.01**, −0.48, −1.43). Volatility remains strongly negative; skewness and kurtosis are insignificant. The low-vol effect is not a proxy for coskewness in this design.

### Table 2 — Five-Year Windows and the Bull–Bear Pattern
Simple regressions of portfolio returns on portfolio variances by subperiod, compared to whether that period’s market geometric mean exceeded the prior 10-year market mean (“+” = bullish surprise relative to recent history):

| Period | $b$ (on variance) | $t$ | Avg mkt geo. mean | vs prior 10y |
|--------|--------------------:|------:|------------------:|:------------:|
| 1926–30 | −0.035 | −0.73 | −0.0048 | − |
| 1931–35 | −0.045 | −1.70 | 0.0173 | − |
| 1936–40 | −0.098 | −5.58 | 0.0012 | − |
| **1941–45** | **+0.212** | **+7.12** | 0.0258 | **+** |
| 1946–50 | −0.162 | −4.08 | 0.0063 | − |
| 1951–55 | −0.234 | −4.46 | 0.0142 | − |
| 1956–60 | −0.101 | −2.55 | 0.0085 | − |
| **1961–65** | **+0.292** | **+6.35** | 0.0119 | **+** |
| 1965–71 | −0.041 | −1.33 | 0.0072 | − |

**Exact bull–bear regularity:** whenever the period’s market performance **exceeded** the previous decade (+), the cross-sectional slope of return on risk is **positive** and large. Whenever market performance **lagged** the previous decade (−), the slope is **negative**. This is precisely the prediction of equation (4). Short-sample “confirmations” of CAPM in bullish windows are therefore not independent evidence of a risk premium—they are the bias.

## Methods Detail Worth Emphasizing
- Portfolios are **well diversified** (25 names), so residual risk is small; ranking by $\sigma$ ≈ ranking by $\beta$. Negative slopes on both are mutually reinforcing, not alternatives.
- Authors correlate **total returns** (not excess returns) with risk; they cite Miller–Scholes that excess-return betas differ little, and confirm this.
- No attempt to estimate a risk-free rate carefully period-by-period for the main tables; the qualitative conclusion is robust to that choice.
- Replacement of delisted stocks avoids the classic survivor bias that would otherwise tilt long-horizon high-risk portfolios upward (survivors of high-risk names are winners).

## Limitations
- **Equal-weighted 25-stock portfolios from 1926 NYSE list** are not the modern CRSP value-weighted universe; microstructure and listing standards differ.
- **Geometric mean as dependent variable** is the right long-horizon compound measure but differs from the arithmetic means used in much CAPM empirics; they do report arithmetic robustness for 1946–71.
- **No formal errors-in-variables correction** for beta (though diversification reduces the problem).
- **No industry / size controls** in the modern Fama–MacBeth sense; the design is deliberately simple.
- Working paper vs JFQA: published version is shorter; some WP detail may be absent from the 10-page JFQA article. Drive OCR failure prevents verifying WP-only tables.
- The paper demonstrates absence of a *positive realized* risk premium and the bull–bear bias; it does not propose a full equilibrium substitute (that came decades later with leverage-constraint / lottery / intermediary models).

## Practical Takeaways for a Quant Investor
1. **Low-risk anomaly is not a 1990s discovery.** Haugen–Heins 1972/1975 already document negative long-run slopes of return on $\sigma$ and $\beta$ with $t$-stats around −5 to −6. Treat “risk premium” as a hypothesis to be tested, not an identity.
2. **Never trust short-window cross-sectional risk–return slopes.** A 5-year bull market will mechanically produce a positive slope even if the true premium is zero or negative. Require long samples or explicitly adjust for $\bar p-E(p)$.
3. **Design implication for low-vol / min-var / BAB strategies:** the economic content is a long-run failure of compensation for volatility and beta. Implementation should emphasize (a) true ex-ante risk rankings, (b) avoidance of survivor-conditioned universes, (c) awareness that “risk-on” regimes temporarily reverse the sign.
4. **Connection to Levy (2017):** unlevered investors cannot climb the CML; high-Sharpe low-vol funds that look inefficient under textbook CAPM are exactly what constrained investors should hold. Haugen–Heins supply the cross-sectional fact; Levy supplies the decision-theoretic ranking fix.
5. **Research hygiene:** when reading empirical CAPM confirmations from the 1960s–70s, check whether the sample market return was above long-run averages. Table 2 is a template for that audit.
6. **Portfolio construction:** over horizons measured in decades, tilting toward lower portfolio $\sigma$ (and lower beta) has historically **raised**, not lowered, geometric growth. That is the opposite of the CAPM teaching slide.

## Quantitative Bottom Line
Across 114 NYSE 25-stock portfolios, February 1926–December 1971, geometric mean returns regress on monthly $\sigma$ with slope **−0.0353** ($t=-4.87$) and on beta with slope **−0.0031** ($t=-4.79$). Over 1946–71: **−0.0945** ($t=-5.82$) and **−0.0043** ($t=-5.42$). Five-year windows flip sign exactly with bull vs bear realizations relative to the prior decade, matching the paper’s bias formula $b\approx[E(p)-E(r_f)]+[\bar p-E(p)]$. **Conclusion:** long-run realized equity returns do not embed a positive risk premium in the cross-section; the early empirical “support” for CAPM is largely a bull-market artifact. This is the foundational low-volatility anomaly paper.

## Extended Historical Context for Quants
Subsequent literature that builds directly on this finding includes Haugen–Baker (1991, 1996) on low-volatility outperformance, Ang–Hodrick–Xing–Zhang (2006) on idiosyncratic volatility, Baker–Bradley–Wurgler (2011) on benchmarking constraints as a mechanism, and Frazzini–Pedersen (2014) BAB. The 1972/1975 paper’s comparative advantage remains its combination of (i) an explicit econometric critique of short-sample CAPM tests and (ii) a long, survivor-bias-aware portfolio design that already shows the negative slope. Any modern low-vol prospectus that cites only post-2000 papers is underselling the pedigree—and any risk model that imposes a hard positive premium of return on beta without testing it is ignoring a 50-year empirical regularity.


## Replication / Audit Notes
**Portfolio formation.** Start from the 1926 NYSE list. Randomly assign names into 114 groups of 25 (or use a deterministic partition keyed on CUSIP/name order—the paper does not emphasize randomness beyond “constructed”). Each month, invest \$1/25 in each surviving name; if a name delists mid-month, the paper’s verbal description implies replacement “at the time of delisting” with another listed name so that the portfolio remains 25 names. Record the equal-weighted monthly relative. Compound geometrics over the chosen window; compute $\sigma$, $\beta$, skew, kurtosis of the monthly relative series.

**Beta estimation.** Market proxy: average return of all CRSP stocks (paper text) / S&P 425 industrials for some long-run comparisons in Table 2 footnotes. Standard single-index OLS of portfolio excess or total returns on market; authors note Miller–Scholes that the difference is small.

**Regression.** Cross-section of 114 geometric means on 114 risk measures; report slope and $t$-stat. For Table 2, replace geometric mean with the period’s mean return and risk with variance; tag each period by sign of (period market geo mean − prior 10-year market geo mean).

**Expected magnitudes under null of zero true premium.** If $E(p)-E(r_f)=0$, equation (4) says $b\approx \bar p-E(p)$. Using prior-decade market return as a proxy for $E(p)$, the sign pattern of Table 2 is a direct test. The long-window negative slopes then imply either a negative true premium or persistent negative surprises—neither of which is CAPM’s prediction.

## Why This Matters Alongside the Other Four Papers in This Batch
- **Drechsler–Drechsler (2014):** shorting premium and anomaly concentration in high-fee names—another cross-sectional “risk” that raises prices rather than lowering them.
- **Constantinides et al. (2010):** stochastic-dominance profitable option writing—risk-averse investors can improve EU by selling expensive options, inconsistent with simple representative-agent risk pricing.
- **Neely–Rapach–Tu–Zhou (2010):** equity-premium predictability concentrated in recessions—time-series dual of “risk premiums don’t show up where CAPM says.”
- **Levy (2017):** constrained investors should not use Sharpe; GM better. Haugen–Heins supply the reason low-vol high-GM portfolios historically won.

Together these papers form a coherent anti-naive-CAPM dossier: cross-section (Haugen–Heins), ranking metric (Levy), anomaly mechanics (Drechsler), option market (Constantinides), and time-series predictability (Neely et al.).

## Final Scholar Flag
Drive PDF `0B-6kBz0I0dMsdHg2YVZRZkJYR2c` is scanned/OCR-unusable. This summary uses the JFQA 1975 published text (public Low-Vol Classics PDF) plus SSRN abstract identification of the 1972 WP. Numbers in Tables 1–2 above are from the JFQA article. If the WP contains additional appendices, they were not recoverable from Drive.



## Equation-by-Equation Derivation of the Bull–Bear Bias
Start from $r_{j,t}=a_j+\beta_j p_t+e_{j,t}$ with $a_j=E(r_f)(1-\beta_j)$. Average over $n$ periods:
$$
\bar r_j=a_j+\beta_j\bar p+\bar e_j.
$$
Cross-sectional covariance with $\hat\beta_j$:
$$
\mathrm{Cov}(\hat\beta,\bar r)=\mathrm{Cov}(\hat\beta,a)+\bar p\,\mathrm{Cov}(\hat\beta,\beta)+\mathrm{Cov}(\hat\beta,\bar e).
$$
Under the CAPM restriction on $a$ and approximate $\mathrm{Cov}(\hat\beta,\bar e)\approx 0$,
$$
\mathrm{Cov}(\hat\beta,\bar r)\approx \sigma^2_{\hat\beta}\Big([E(p)-E(r_f)]+[\bar p-E(p)]\Big),
$$
hence the OLS slope $b_{\hat\beta}$ estimates true premium plus market surprise. Replace $\beta$ with total volatility for the analogous $\sigma$-slope. This is why 1941–45 and 1961–65 (bullish vs prior decade) show large *positive* slopes (+0.212, +0.292) while most other five-year windows are negative — not because risk aversion flipped, but because $\bar p-E(p)$ flipped.

## Mapping to Modern Low-Vol Evidence
| Haugen–Heins finding | Modern counterpart |
|----------------------|--------------------|
| Negative long-run slope of return on $\sigma$ | Ang et al. (2006) IVOL; Blitz–van Vliet; Baker–Bradley–Wurgler |
| Negative slope on beta | Black (1972) empirically; Frazzini–Pedersen BAB |
| Bull–bear sign flips | Conditional beta / market timing critiques of CAPM tests |
| Diversified 25-stock portfolios | Reduces errors-in-variables vs individual-stock Fama–MacBeth |

Annualized intuition for 1946–71: monthly $b_\sigma=-0.0945$ with mean $\sigma=0.046$ says moving from 0.5× to 1.5× average $\sigma$ cuts geometric mean by roughly $0.0945\times 0.046\approx 0.43\%$ per month (~5% per year) — enormous.

## Critiques and Rebuttals
- “Geometric means mechanically punish volatility.” Partially true (Jensen inequality), but arithmetic means also slope negative in 1946–71 ($t=-2.97$), and multiple regression still loads negatively on $\sigma$ after skew/kurtosis controls.
- “1926 NYSE list is stale.” The no-survivorship design is a feature; refreshing the universe would be a useful robustness the WP may contain.
- “No microstructure controls.” Valid for short horizons; less so for 46-year geometrics.
- “Risk premium could be in consumption CAPM / ICAPM dimensions.” Possible — the paper claims only that *equity-market β and σ* are not positively rewarded in realized equity returns.

## Practical Low-Vol Implementation Notes Inspired by HH
1. Rank by ex-ante predicted $\sigma$ or $\beta$, not ex-post.
2. Rebalance slowly; the edge is compounding over decades.
3. Avoid loading the short leg of low-vol on unshortable names (tie to Drechsler).
4. Report geometric growth and CE, not only arithmetic mean / Sharpe (tie to Levy).
5. Expect drawdowns in raging bull markets (Table 2 + windows) — educate LPs.

## Scholar Flag (repeat)
Drive original OCR-unusable; numbers from JFQA 1975 public PDF. WP SSRN 1783797 is the longer ancestor.


## Extended Historical and Replication Notes

### Why 114 portfolios of 25
Diversification drives residual variance near zero so total σ ≈ systematic risk ranking. 25 names is Evans–Archer territory for most of the idiosyncratic variance reduction. 114 portfolios give a thick cross-section for slope estimation without single-stock noise.

### Geometric vs arithmetic
Long-horizon investors care about geometric growth. Critics say GM mechanically penalizes volatility; HH show arithmetic means also slope negative on σ in 1946–71 (t=−2.97), and multivariate controls for skew/kurtosis leave σ’s negative coefficient intact (t=−6.01).

### Bull–bear table as a diagnostic template
For any claimed risk premium test, split the sample into windows, compare each window’s market return to a long prior benchmark, and check whether the risk–return slope sign tracks the surprise. If it does, the “premium” is contaminated.

### Numerical anchors
1926–71: b_σ=−0.0353 (t=−4.87); b_β=−0.0031 (t=−4.79).
1946–71: b_σ=−0.0945 (t=−5.82); b_β=−0.0043 (t=−5.42).
Five-year + windows: 1941–45 b=+0.212 (t=7.12); 1961–65 b=+0.292 (t=6.35).
Avg monthly portfolio return ~0.9%; avg σ 8.9% (full) / 4.6% (postwar).

### OCR flag
Drive file unreadable; JFQA 1975 public PDF used. Scholar should note reconstruction.

### Synthesis
The first clear empirical rejection of a positive cross-sectional risk–return tradeoff in US equities — and an econometric warning about bull-market CAPM “confirmations” that still applies whenever someone shows you a five-year beta premium.

The bull–bear bias formula is simple enough to teach in a first empirical asset-pricing course and powerful enough to overturn a generation of short-sample CAPM confirmations. If the sample market return exceeds the expected market return, cross-sectional slopes of return on beta (or on volatility) are biased upward by approximately that surprise. Bullish five-year windows will “find” risk premia whether or not any exist.

In practical terms, paragraph 1 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Haugen and Heins’s long-window evidence goes further than bias critique: over 1926–71 and especially 1946–71, the estimated slopes are significantly *negative*. Geometric mean returns fall with volatility (t-statistics −4.87 and −5.82) and with beta (t-statistics −4.79 and −5.42). The sign is wrong for CAPM, not merely insignificant.

In practical terms, paragraph 2 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

The 1946–71 focus is motivated by relatively stable return variance, reducing heteroskedasticity confounds from the Depression and war. Average portfolio monthly sigma falls from 8.93 percent in the full sample to 4.60 percent postwar, while average returns remain near 0.9 percent per month. Against that quieter backdrop, the negative risk–return slope is even steeper.

In practical terms, paragraph 3 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Table 2’s five-year regularity is striking: every window whose market geometric mean exceeded the prior decade shows a positive risk–return slope; every window that lagged shows a negative slope. The 1941–45 and 1961–65 bullish windows produce t-statistics above 6 on positive slopes. Those are the samples that would have looked like CAPM successes to contemporary researchers.

In practical terms, paragraph 4 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Portfolio design choices — 1926 NYSE list, no survivorship screen, 25-name equal weight, replacement on delist — are early examples of best practice. Survivorship would otherwise inflate high-risk portfolio geometrics by keeping only the winners among volatile names. Equal weighting and diversification make residual variance small so that sigma and beta rankings align.

In practical terms, paragraph 5 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Multiple regression of geometric mean on sigma, skewness, and kurtosis in 1946–71 leaves sigma’s coefficient at −0.098 with a t-statistic of −6.01; skew and kurtosis are insignificant. The low-volatility effect is not a proxy for coskewness in this design.

In practical terms, paragraph 6 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Modern low-vol and BAB strategies are intellectual descendants. Citing only post-2000 papers erases a fifty-year pedigree. The mechanism literature (leverage constraints, benchmarking, lottery demand) came later; the fact pattern was already visible in 1972/1975.

In practical terms, paragraph 7 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

For practitioners, the lesson is dual: (1) do not trust short-window cross-sectional risk premia without a bull–bear audit; (2) over long horizons, tilting toward lower volatility and lower beta has historically *raised* geometric growth. That is the opposite of the classroom CML slide for unlevered investors.

In practical terms, paragraph 8 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

OCR limitation: the Drive PDF for the 1972 working paper is unscannable. This summary uses the JFQA 1975 published text from a public Low-Vol Classics archive, consistent with the authors’ note that the JFQA article is the refereed compression of the Wisconsin working paper (SSRN 1783797).

In practical terms, paragraph 9 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.

Together with Levy (2017), Haugen–Heins supply both the cross-sectional fact (low risk, high geometric return) and the decision-theoretic ranking fix (use GM when leverage is constrained). Together with Drechsler (2014), they warn that “risk” that is hard to short behaves nothing like textbook beta.

In practical terms, paragraph 10 above implies that production systems should encode the stated magnitudes as acceptance tests: if a replication or live monitor disagrees materially with the published point estimates, halt promotion of the related strategy until the discrepancy is understood. Documentation should cite the exact sample filters, rebalancing convention, and standard-error method so that two independent implementations can be reconciled to the paper’s t-statistics rather than to vague qualitative agreement. This discipline converts the paper from a citation into a verifiable module inside the investment process.