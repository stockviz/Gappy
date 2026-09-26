# The Statistical Properties of Hedge Fund Index Returns and Their Implications for Investors

**Authors:** Chris Brooks (ISMA Centre, University of Reading); Harry M. Kat (Cass Business School, City University, London; Alternative Investment Research Centre)  
**Publication:** Alternative Investment Research Centre Working Paper #0004; this version 10 November 2001  
**Source PDF:** `HedgeFunds_BrooksKat_2001.pdf` (Drive id `0B-6kBz0I0dMsNUMwYzVaQUZ4eVk`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_2)  
**OCR:** Not required; clean `pdftotext -layout` extract (~11,185 words of source; 42 pages)

---

## 1. Problem and Motivation

By 2001 the hedge fund industry had grown to roughly 6,000 funds with an estimated \\$400 billion in capital and \\$1 trillion in total assets; about 80% of funds were smaller than \\$100 million and about 50% smaller than \\$25 million. Institutional investors deciding whether and how to allocate to hedge funds typically did so by comparing mean–variance characteristics of portfolios with and without a hedge fund sleeve, with that sleeve represented by a publicly available monthly hedge fund *index*. Brooks and Kat argue that this practice is systematically misleading for two independent reasons.

First, indices that purport to cover the *same* strategy type differ materially across data vendors (HFR, Zurich/MAR, CSFB/Tremont, Hennessee, Van, Altvest, Tuna). Second, the statistical properties of the indices themselves are highly non-Gaussian and serially dependent: monthly returns exhibit negative skewness, excess kurtosis, and strong positive first-order autocorrelation. Consequently, Sharpe ratios overstate true risk-adjusted performance, and mean–variance optimizers over-allocate to hedge funds and overstate attainable portfolio improvements. The paper documents these facts on 48 indices over January 1995–April 2001 (a window that includes the Asian, Russian, and LTCM crises and the end of the IT bubble) and draws concrete implications for performance evaluation and portfolio construction.

---

## 2. Setup and Data

### 2.1 Strategy taxonomy

Funds are grouped into three ideal types—**Global** (International, Emerging Markets, Macro), **Event-Driven** (Distressed Securities, Risk Arbitrage), and **Market Neutral** (Long/Short Equity, Convertible Arbitrage, Equity Market Neutral, Fixed Income)—plus **Funds of Funds**. Global Macro uses leverage and derivatives to trade large currency and rate shifts; Distressed trades reorganization/bankruptcy capital structures; Risk Arbitrage typically buys the target and shorts the acquirer; Long/Short Equity is often long-biased and not always market-neutral; Convertible Arbitrage buys undervalued convertibles and hedges intrinsic risks; Equity Market Neutral runs matched long/short books designed for zero market beta. Funds of Funds invest in other hedge funds; the paper later shows their indices have *lower* means than Aggregate indices, consistent with fee drag that is not offset by selection skill.

### 2.2 Index providers and construction

| Vendor | Approx. DB size | Index subset | Weighting | Notes |
|--------|-----------------|--------------|-----------|-------|
| HFR | ~4,000 | ~1,500 → 33 indices | Equal-weight | Net of fees |
| Zurich/MAR | ~1,500 | 19 indices | *Median* monthly returns | Sold to Zurich Mar 2001 |
| CSFB/Tremont | TASS ~2,600 | ~650 → 10 indices | **Asset-weighted** | Min \\$10m AUM + audit; quarterly reselection |
| Hennessee | ~3,000 | ~500 → 23 | Equal-weight | Advisory firm |
| Van | ~3,400 | ~500 → 15 | Equal-weight | Advisory firm |
| Altvest | ~2,000 | 14 | Equal-weight | Website |
| Tuna (hedgefund.net) | ~1,800 | 35 | Equal-weight | **Survivorship bias**: defunct funds removed |

Most vendors include dead funds and thus mitigate survivorship bias; Tuna is the exception and produces relatively high means. Data are manager/administrator-supplied and largely unaudited. Plausibility checks raise red flags (e.g., Zurich Market Neutral Median returned *exactly* 1.00% in 13 of 136 months from Jan 1990–Apr 2001). Liang (2000) found only 465 common funds between HFR and TASS, so vendor universes barely overlap.

### 2.3 Sample

Monthly net-of-fee returns on **48 indices**, Jan 1995–Apr 2001, classified as Aggregate, Funds of Funds, Convertible Arbitrage, Risk Arbitrage, Distressed, Emerging Markets, Macro, Long-Short Equity, Equity Market Neutral. Benchmarks: S&P 500, DJIA, Russell 2000, NASDAQ, Lehman Brothers Government Bond.

---

## 3. Model and Methods

### 3.1 Unconditional moments and normality

For each series the authors report mean, standard deviation, skewness, excess kurtosis, Bera–Jarque normality statistic, and min/max. Under the null of normality, Bera–Jarque is asymptotically $\chi^2(2)$ with 5% critical value 5.99. Significance stars on means/skewness/kurtosis follow conventional $t$/asymptotic tests.

### 3.2 Serial correlation and ARCH

Autocorrelations at lags 1–5 and Ljung–Box $Q^*(10)$ test the joint null that the first 10 ACFs are zero. For this sample size, an ACF is significant at 10%/5%/1% if outside $\pm 0.19$ / $\pm 0.22$ / $\pm 0.30$. Engle’s ARCH(4) LM test is applied to residuals of an AR(5) to remove linear dependence; it is asymptotically $\chi^2(4)$ (5% CV 9.49). Power is limited (~71 residual observations).

### 3.3 Unsmoothing (Geltner)

Observed (smoothed) index value is modeled as single exponential smoothing of the true value:

$$
V_t^* = \alpha V_t + (1-\alpha) V_{t-1}^*.
$$

Inverting yields unsmoothed returns with (approximately) zero lag-1 autocorrelation:

$$
r_t = \frac{r_t^* - \alpha r_{t-1}^*}{1-\alpha},
$$

with $\alpha$ set to the observed lag-1 ACF. Unsmoothed series retain the same mean; positive $\alpha$ *raises* volatility. An alternative de-smoothing check uses **3-month** returns and reports $\sqrt{\mathrm{Var}(r^{(3)})/3}$ on a monthly basis.

### 3.4 Performance and portfolio metrics

Sharpe ratios use average excess return over return standard deviation (risk-free rate convention as in the paper’s Table 6). Mean–variance optimizations use S&P 500 + Lehman Gov Bond + one hedge fund index at a time, **no short selling**, target annualized volatility **8%**. Baseline (stocks+bonds only) attainable expected return at that risk: **1.07% per month**. They also run a constrained case with hedge fund weight capped at 5%.

---

## 4. Empirical Results (with numbers)

### 4.1 Unconditional distributions (Table 1)

Relative to stocks and bonds, most hedge fund indices combine **high means with low volatilities**—except Macro and Emerging Markets. Convertible Arbitrage, Risk Arbitrage, and Equity Market Neutral have bond-like vols but much higher means; Long/Short Equity has lower vol than equity indices but higher means.

**Illustrative monthly means / stdevs / skew / excess kurtosis:**

- **Aggregate HFR:** mean $1.22\%^{***}$, $\sigma=2.44$, skew $-0.72^{**}$, excess kurt $2.78^{***}$, BJ $31.14^{***}$; min $-8.70\%$, max $7.65\%$.
- **CSFB/Tremont Aggregate:** $1.22\%$, $2.86$, skew $-0.09$, excess kurt $0.79$ (closer to normal; BJ 2.08).
- **Convertible Arb HFR:** $1.14\%$, $\sigma=0.92$, skew $\mathbf{-1.50}^{***}$, excess kurt $\mathbf{5.88}^{***}$, BJ $137.7^{***}$.
- **CSFB Convertible Arb:** $1.14\%$, $1.36$, skew $\mathbf{-2.41}^{***}$, excess kurt $\mathbf{8.73}^{***}$.
- **Risk Arb HFR:** $1.13\%$, $1.06$, skew $\mathbf{-3.78}^{***}$, excess kurt $\mathbf{22.53}^{***}$, BJ $1788^{***}$; min $-5.69\%$, max only $2.47\%$ (extreme left-tail asymmetry; Figure 1).
- **Distressed HFR:** $0.91\%$, $1.75$, skew $-2.18^{***}$, excess kurt $10.57^{***}$.
- **Emerging Markets HFR:** mean $0.60\%$ (insignificant), $\sigma=5.04$, skew $-0.81^{***}$, min $\mathbf{-21.20\%}$.
- **Long/Short Equity HFR:** $1.75\%^{***}$, $3.07$, near-zero skew $0.02$, excess kurt $1.24^{**}$.
- **Equity MN CSFB:** $1.14\%$, $\sigma=0.90$, near-Gaussian (BJ 0.61).
- **Funds of Funds HFR:** mean only $0.86\%^{**}$ vs Aggregate $1.22\%$—fee drag evidence.
- **Benchmarks:** S&P 500 mean $1.55\%$, $\sigma=4.53$, skew $-0.87^{***}$; Lehman Gov Bond $0.62\%$, $\sigma=0.86$.

Most series reject normality. High Sharpe candidates are precisely those with the worst skew/kurtosis—Convertible Arb, Risk Arb, Distressed.

Vendor outliers: CSFB Aggregate, Altvest Emerging Markets, Zurich Macro, Zurich/Van Equity MN differ sharply within-group; CSFB’s asset-weighting raises $\sigma$; Tuna’s survivorship bias inflates means.

### 4.2 Correlations with markets (Table 2)

- Majority of indices: **low/negative** correlation with bonds; exceptions Macro and Equity MN (leverage).
- Most indices: **high** correlation with equities, especially **Russell 2000**; Long/Short Equity also highly correlated with NASDAQ → heavy small-cap / tech exposure during the sample. Long/short funds >30% of industry by count and AUM, so Aggregate and FoF inherit this.
- Claim that hedge funds are “market-proof” fails at the *index/basket* level (though individual funds may still have high idiosyncratic risk). Convertible Arb and Equity MN are the main low-equity-beta exceptions.
- Within Equity MN, S&P correlation ranges from **−0.02 to 0.54**; Macro S&P correlation from **0.25 to 0.60**.

### 4.3 Within- and cross-category correlations (Tables 3–4)

Within Aggregate, FoF, Risk Arb, Distressed, EM, Long/Short: pairwise correlations typically **0.7–0.9**. Convertible Arb, Macro, and especially Equity MN: much lower within-group correlation → more complex/heterogeneous systematic factors. Cross-category HFR correlations are mostly **>0.5** even for strategies that look unrelated (e.g., Convertible Arb vs Distressed **0.76**); Equity MN is the exception (~0.2 with other groups).

### 4.4 Autocorrelation and ARCH (Table 5)

Equity/bond indices show little serial correlation (mostly small *negative* ACFs). Hedge fund indices often show **large positive lag-1 ACF**:

- All Convertible Arb indices: ACF(1) $\ge 0.4$, significant at 1%.
- Distressed and some Risk Arb, EM, Equity MN: similarly strong.
- Pattern appears in FoF but, surprisingly, **not** in Aggregate indices.
- Economic interpretation: delayed mark-to-market of illiquid/OTC positions (last trade or stale estimate), not lagged risk factors—consistent with Convertible Arb and Distressed showing the strongest ACF.
- ARCH(4): little evidence after AR(5) filtering except some Convertible Arb, Long/Short, Equity MN; sample short for power.

### 4.5 Sharpe ratios and unsmoothing (Table 6)

Observed Sharpes far exceed equity/bond Sharpes for most categories (EM and Hennessee Macro excepted). Examples:

| Index | Obs $\sigma$ | Obs SR | Unsmoothed $\sigma$ | Unsmoothed SR | 3m $\sigma$ | 3m SR |
|-------|----------------|--------|----------------------|---------------|---------------|-------|
| CSFB Conv Arb | 1.36% | **1.81** | **2.42%** | **1.01** | 1.87% | 1.07 |
| HFR Conv Arb | 0.92 | 2.64 | 1.41 | 1.73 | 1.22 | 1.62 |
| HFR Risk Arb | 1.06 | 2.26 | 1.26 | 1.90 | 1.19 | 1.68 |
| Tuna Aggregate | 2.19 | 1.80 | 2.64 | 1.49 | 2.43 | 1.18 |
| S&P 500 | 4.53 | 0.85 | 4.12 | 0.94 | 4.54 | 0.85 |
| Zurich Equity MN | 0.54 | 3.53 | 0.46 | 3.69 | 0.55 | 3.12 |

Unsmoothing and 3-month aggregation both raise hedge fund vols and cut Sharpes; equity vols barely change. High Sharpe ↔ negative skew + high kurtosis (Scott–Horvath preference for high odd / low even moments). Amin–Kat (2001a) cited: full-distribution evaluation finds little superior performance.

### 4.6 Mean–variance portfolio results (Tables 7–9)

At 8% annualized target vol, stocks+bonds only → 1.07%/month expected return. Adding unrestricted hedge funds:

- Average Aggregate allocation ~**75%**; Convertible Arb ~**55%**.
- Annualized expected-return pick-up for Aggregate indices ranges **1.08% to 6.12%**; allocations **50–100%**.
- Risk Arb, Long/Short Equity, Equity MN offer large pick-ups; Emerging Markets generally do not.
- Economic substitution: Aggregate/Macro displace both stocks and bonds; Long/Short primarily displaces equity; Convertible/Risk Arb/Distressed/Equity MN primarily displace bonds.
- With HF weight **capped at 5%**, optimizer still takes the full 5%, but average improvement collapses to only **~0.30% per annum**.

Skewness/kurtosis of MV-optimal portfolios (Table 8): base stocks+bonds skew $\approx -0.66$. Adding most HF indices **worsens** skew and **raises** kurtosis (Risk Arb / Distressed: skew changes like −0.88 to −1.39 and kurtosis +3 to +8). Equity MN themselves are nearly unskewed but still **worsen portfolio skew**—suggesting higher correlation with S&P in down markets than up. Long/Short and Equity MN give large mean pick-up with relatively modest higher-moment damage; Convertible and Risk Arb bring heavy left-tail cost.

Unsmoothed and 3-month inputs (Table 9): correlations of Convertible Arb and Distressed with S&P **rise** after unsmoothing (e.g., CSFB Conv Arb vs S&P: 0.08 → 0.27). Re-optimized portfolios (Table 7) show **materially smaller** expected-return improvements and generally lower HF weights, though Conv Arb / Risk Arb / Equity MN weights remain stable because of very low $\sigma$.

---

## 5. Limitations

- Sample ends April 2001; post-2008, post-Quant Quake, and modern CTA/HF regimes not covered.
- Index-level analysis ≠ single-fund analysis; survivorship, self-reporting, and classification noise remain.
- Geltner unsmoothing is illustrative, not a structural valuation model; true $\alpha$ unknown.
- ARCH tests underpowered; no formal regime-switching or conditional-correlation model (authors flag up/down correlation and VaR implications for follow-on work).
- MV optimizations are unrestricted limit cases; real mandates constrain HF share far below 50–100%.
- No transaction costs, lockups, gates, or side-pocket frictions in the portfolio math.

---

## 6. Practical Takeaways for a Quant Investor

1. **Do not rank hedge fund sleeves by monthly Sharpe.** High observed SR is often purchased with left-tail risk and stale pricing. Prefer full-distribution metrics (Amin–Kat style), drawdown/CVaR, and stress periods (Aug 1998, Aug 2007, Mar 2020 analogues).
2. **Unsmoothing is mandatory for vol and correlation inputs.** For Convertible Arb / Distressed / other illiquid books, use lag-1 ACF and Geltner (or quarterly returns) before any risk parity, vol targeting, or MV step. Expect $\sigma$ to rise 50–80%+ (CSFB Conv Arb 1.36% → 2.42%).
3. **Vendor choice is a first-order decision.** CSFB (asset-weighted, audited) vs equal-weight HFR vs survivorship-biased Tuna can change Aggregate S&P $\rho$ from ~0.50 to ~0.70 and Equity MN $\rho$ from −0.02 to 0.54. Always cross-check ≥2 vendors.
4. **Funds of Funds underperform Aggregate on mean**—fee stack is visible in the data (HFR FoF 0.86% vs Aggregate 1.22% monthly).
5. **“Market neutral” at the index level is rare.** Only Convertible Arb and Equity MN are consistently low-equity-beta; Long/Short Aggregate is small-cap/tech equity in disguise in this sample.
6. **A 5% HF allocation barely moves the portfolio needle** (~30 bps/yr in this calibration); meaningful mean–variance impact requires large weights that also concentrate left-tail risk—so size to *higher-moment* budget, not just vol budget.
7. **For multi-strategy HF books,** assume cross-strategy correlations ≥0.5 except true Equity MN; diversification across “styles” is weaker than marketing suggests.

---

---

## 7. Extended Discussion of Mechanism and Investor Decision Rules

### 7.1 Why autocorrelation is a risk-measurement problem, not an alpha opportunity

Positive lag-1 autocorrelation in reported monthly NAVs is often misread as “momentum in hedge fund returns.” Brooks and Kat’s preferred explanation is mechanical: when managers cannot obtain timely marks on illiquid convertibles, distressed loans, or OTC derivatives, they insert the last transaction price or a smoothed estimate. Equation (1) then generates an MA-like structure in observed returns. The investment implication is asymmetric. You **cannot** harvest the autocorrelation as a trading signal (you do not observe the true $V_t$ in real time), but you **must** inflate risk estimates. Treating ACF(1) = 0.4 Convertible Arbitrage NAVs as if they were liquid equity returns understates volatility by the factor roughly $1/\sqrt{(1-\alpha)/(1+\alpha)}$ in the AR(1) case—numerically matching the jump from 1.36% to 2.42% for CSFB Convertible Arbitrage when $\alpha$ is set to the sample ACF(1).

### 7.2 Mapping categories to economic exposures (sample-period specific)

The January 1995–April 2001 window coincides with a powerful small-cap and technology rally and the subsequent crash. Table 2’s Russell 2000 and NASDAQ correlations therefore carry a regime warning:

- **Long/Short Equity** (HFR $\rho_{\text{Russell}}=$ high; also high NASDAQ): net long small-growth beta dressed as “hedge.”
- **Aggregate / FoF**: inherit Long/Short’s footprint because Long/Short exceeded 30% of funds and AUM.
- **Risk Arbitrage**: low $\sigma$ (~1%) but extreme negative skew (HFR −3.78) and excess kurtosis (22.53)—the classic “picking up nickels in front of a steamroller” merger-break profile. Figure 1 shows essentially no upper tail and a very long lower tail versus a matched normal.
- **Distressed**: similar left-tail shape plus ACF(1) from stale marks on bankrupt names.
- **Emerging Markets**: means statistically insignificant, $\sigma$ 4.5–6%, minima −20% to −26%—equity-like downside without equity-like premium in this window.
- **Macro**: more heterogeneous across vendors; Zurich shows *positive* skew (+1.23); CSFB Macro $\sigma=4.18\%$ with min −11.55%.
- **Equity Market Neutral**: lowest cross-category correlations (~0.2) and often near-Gaussian BJ stats—but portfolio experiments still worsen skew when mixed with S&P/bonds, consistent with down-market correlation spikes.

### 7.3 Vendor taxonomy as a model risk input

Because Liang (2000) found only 465 overlapping funds between HFR and TASS, two “Convertible Arbitrage” indices are not two noisy observations of one population—they are partially different populations plus different weighting schemes. CSFB/Tremont’s asset-weighting and \\$10m AUM + audit filter produce systematically higher $\sigma$ and, for Aggregate, lower within-group correlation with equal-weight peers. Tuna’s deletion of dead funds inflates means and Sharpes. Zurich’s use of *medians* rather than means dampens outliers differently. A disciplined allocator should treat vendor identity as a categorical factor in any meta-analysis of HF premia and should never blend indices without documenting construction.

### 7.4 Mean–variance math: why 5% does almost nothing

Let the opportunity set be $\{e,b,h\}$ with target $\sigma_p=8\%$ annualized. Without $h$, the paper’s calibration delivers $E[r]=1.07\%$ per month. Unrestricted inclusion of attractive HF indices pushes $w_h$ into the 50–100% range because those indices’ sample $(\mu,\sigma)$ dominate bonds and often dominate a stock–bond mix on the MV frontier. Institutional practice of “dip a toe in at 5%” is then revealed as almost pure marketing optics: the optimizer still grabs the full 5%, but expected-return uplift averages only ~30 bps per year. If the investment committee’s true goal is material diversification or return uplift, either (i) size HF risk to a meaningful fraction of portfolio volatility budget, or (ii) admit that the HF sleeve is a satellite for idiosyncratic/alternative risk premia and evaluate it with higher-moment and liquidity-adjusted tools rather than MV.

### 7.5 Higher-moment trade-off is not monotone

Table 8 shows that the worst skew/kurtosis degradation is not always attached to the largest mean pick-up. Convertible and Risk Arbitrage add a lot of left-tail risk per unit of mean improvement; Long/Short Equity and Equity Market Neutral often deliver large mean pick-ups with milder kurtosis increases (and sometimes improved skew in the Long/Short case). This breaks any simple “more HF alpha ⇒ more crash risk” heuristic and argues for **strategy-level** higher-moment budgeting: a Risk Arb sleeve should be sized to its crash contribution (merger-break months), not to its 1% monthly $\sigma$.

### 7.6 Correlation distortion under stale pricing

Table 9 is operationally important for multi-asset risk models. Unsmoothing raises HF–S&P correlations especially for Convertible Arb and Distressed (CSFB Conv Arb: 0.08 → 0.27). Using raw monthly correlations in a covariance matrix therefore understates equity beta of “market-neutral” credit-sensitive strategies. Three-month correlations with bonds often *fall* (sometimes becoming largely negative for Aggregates), so the bond-diversification story is also horizon-dependent. Risk systems that mix daily equity factors with monthly HF NAVs without lag-adjustment will mis-state both betas and diversification ratios.

### 7.7 Performance evaluation protocol implied by the paper

A practical evaluation stack consistent with Brooks–Kat:

1. Report raw and **unsmoothed** $\sigma$ and Sharpe (Geltner with $\alpha=\widehat{\rho}_1$).
2. Report skewness, excess kurtosis, BJ $p$-value, and historical max drawdown / worst month.
3. Report correlations with S&P, Russell 2000, NASDAQ, and bonds at 1-month, unsmoothed, and 3-month horizons.
4. Cross-validate at least two vendors; flag Tuna for survivorship.
5. Reject MV-only allocation; add CVaR or scenario constraints (LTCM month, merger-break clusters).
6. For FoF vs direct Aggregate exposure, demand fee-justifying selection alpha explicitly—average FoF means sit below Aggregate means in this sample.

### 7.8 Quantitative anchors for common conversations

- “Our Conv Arb Sharpe is ~1.8”: after unsmoothing, CSFB’s 1.81 collapses to **1.01**—no longer clearly superior to equities on a vol-only basis, and still carrying skew −2.41.
- “Hedge funds diversify equity”: Aggregate HFR $\rho(\text{S\&P})=0.70$, $\rho(\text{Russell})=0.90$—diversification vs large-cap only, not vs the equity complex that actually drove HF books in 1995–2001.
- “We only allocate 5% so risk is small”: expected-return impact ~30 bps/yr; higher-moment impact can still be non-trivial if the 5% is concentrated in Risk Arb/Distressed.
- “All market-neutral is the same”: Equity MN within-group and vs-S&P correlations disagree sharply across vendors (−0.02 to 0.54 vs S&P).

### 7.9 Relation to subsequent literature (as framed by the paper)

The authors explicitly point to (i) conditioning biases in up/down correlation estimates (Boyer–Gibson–Loretan 1999), (ii) full-distribution performance tests (Amin–Kat 2001a), and (iii) VaR/risk-budgeting under skewness and kurtosis as open agendas. For a 2026 reader, the paper is best read as an early, clean empirical warning that **NAV-based hedge fund indices are not IID elliptical returns**, and that every downstream tool assuming they are—Sharpe rankings, MV optimizers, Gaussian VaR, unadjusted covariance matrices—will be biased in the direction of making hedge funds look too good.

### 7.10 Implementation sketch for a multi-strategy book

Suppose a risk manager receives monthly returns $r_t^*$ for strategy sleeves $s=1,\ldots,S$. Recommended pipeline:

1. Estimate $\hat\rho_{1,s}$ and unsmooth: $r_{t,s}=(r_{t,s}^*-\hat\rho_{1,s} r_{t-1,s}^*)/(1-\hat\rho_{1,s})$.
2. Build covariance $\Sigma$ from unsmoothed returns (or mixed-frequency with lagged betas).
3. Replace Gaussian VaR with historical or Cornish–Fisher VaR using sleeve skew/kurtosis.
4. Cap sleeve weights by contribution to portfolio CVaR in stress windows, not by inverse-$\sigma$.
5. When benchmarking, choose the vendor whose construction matches the investable universe (e.g., CSFB-like if the book is AUM-weighted large funds; HFR-like if equal-weight small-fund access).

This pipeline is a direct operationalization of Sections V–VI of the paper and closes the loop from statistical diagnosis to portfolio decision.

## References (as cited)

Amin & Kat (2001a); Bera & Jarque (1987); Boyer, Gibson & Loretan (1999); Geltner (1991, 1993); Liang (2000); Ljung & Box (1978); Markowitz (1959); Scott & Horvath (1980); Engle ARCH; and the vendor methodology notes above.

---

## 8. Selected Numerical Case Studies from the Tables

**Case A — CSFB/Tremont Convertible Arbitrage.** Mean $1.14\%$ monthly, $\sigma=1.36\%$, skew $-2.41$, excess kurtosis $8.73$, ACF(1) high enough that unsmoothed $\sigma$ becomes $2.42\%$ and Sharpe falls from $1.81$ to $1.01$. S&P correlation rises from $0.08$ to $0.27$ after unsmoothing. MV optimizer still likes the sleeve because even unsmoothed $\sigma$ is bond-like, but Table 8 shows portfolio skew change $\approx -0.77$ to $-0.86$ and kurtosis $+4.9$ to $+6.2$. Lesson: the entire “bond substitute with equity-like Sharpe” marketing pitch is an artifact of stale marks plus ignored left tails.

**Case B — HFR Risk Arbitrage.** Mean $1.13\%$, $\sigma=1.06\%$, skew $-3.78$, excess kurtosis $22.53$, BJ $1788$. Figure 1’s density has almost no right tail. Observed Sharpe $2.26$; unsmoothed still $1.90$. Portfolio skew deterioration $\approx -0.98$ with kurtosis $+5.26$. This is the purest “short crash risk” profile in the study.

**Case C — Long/Short Equity HFR.** Mean $1.75\%$, $\sigma=3.07\%$, nearly symmetric, modest excess kurtosis. High $\rho$ with Russell/NASDAQ. Large MV pick-up by replacing equity; Table 8 skew change can be *positive* ($+0.66$) with only modest kurtosis increase. In 1995–2001 this sleeve was less a diversifier than a cleaner small-cap growth mandate with some short overlay—evaluate it as equity risk, not alternative risk.

**Case D — Funds of Funds vs Aggregate.** HFR FoF mean $0.86\%$ vs Aggregate $1.22\%$ with comparable or only modestly lower $\sigma$. Unless a specific FoF can demonstrate selection alpha above its fee stack in out-of-sample live data, the index-level evidence argues for direct multi-strategy construction.

These four cases instantiate conclusions 6–9 in Section VII and should be the default anecdotes in any investment-committee discussion that still opens with “hedge fund Sharpes look amazing.”
