# Stocks, Bonds and Hedge Funds: Not A Free Lunch!

**Authors:** Gaurav S. Amin (Manager, Schroder Hedge Funds, London); Harry M. Kat (Professor of Risk Management, Cass Business School, City University, London)  
**Series:** Alternative Investment Research Centre Working Paper #0009  
**Affiliation:** Alternative Investment Research Centre, Cass Business School, City University, 106 Bunhill Row, London EC2Y 8TZ  
**Sample period:** June 1994 – May 2001 (7 years of monthly net-of-fee returns)  
**Data:** Tremont TASS (live and dead funds); S&P 500; 10-year Salomon Brothers Government Bond index  
**Source PDF:** `HedgeFunds_AminPalaro.pdf`  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_1)  
**OCR:** Not required; clean `pdftotext -layout` extract (~4,468 words of source)

---

## 1. Problem and Motivation

Hedge funds are frequently marketed as offering “the best of both worlds”: equity-like expected returns with bond-like risk, when risk is defined solely as the **standard deviation** of returns and when past returns are simply extrapolated. Amin and Kat argue that this framing is incomplete. A growing literature (Brooks and Kat 2002; Favre and Galeano 2002; Amin and Kat 2003a) shows that hedge-fund risk and dependence structures are substantially more complex than those of stocks and bonds. Consequently, when hedge funds enter a multi-asset portfolio, **higher moments**—skewness (asymmetry) and kurtosis (tail thickness)—must be given explicit weight.

The paper’s central question is: what happens to the **mean, volatility, skewness, and kurtosis** of a traditional stock–bond portfolio when an equally-weighted basket of hedge funds is introduced? The authors’ answer is that hedge funds are **not a free lunch**. Mean–variance characteristics improve, but skewness falls and kurtosis rises. Moreover, allocations of the order typically contemplated by institutions (1–5% of AUM) are too small to move overall portfolio moments in a meaningful way; meaningful effects require **at least 25–30%** in hedge funds.

Scott and Horvath (1980) provide the preference-theoretic backdrop: under weak assumptions on utility, investors desire high odd moments and low even moments. Hedge funds deliver relatively high means and low variances but, as the paper documents, skewness and kurtosis attributes that run **opposite** to what investors typically want.

---

## 2. Data Construction and Survivorship Handling

### 2.1 Asset proxies

- **Equities:** S&P 500 index.  
- **Bonds:** 10-year Salomon Brothers Government Bond index.  
- **Hedge funds:** equally-weighted portfolio of **20** funds (not a single fund), reflecting the industry practice of multi-fund / fund-of-funds exposure.

### 2.2 TASS database and bias correction

Tremont TASS supplied monthly net-of-fee returns. After eliminating incomplete/ambiguous series and funds of funds, as of May 2001 the usable database contained **1,195 live** and **526 dead** funds. Concentrating only on live funds is known to:

- **overestimate** mean returns by roughly **2%** per annum;  
- **underestimate** standard deviation;  
- **overestimate** skewness;  
- **underestimate** kurtosis  

(Brown–Goetzmann–Ibbotson 1999; Liang 2000; Amin–Kat 2003b).

To mitigate survivorship, the authors construct **455** complete 7-year monthly return series by starting with the 455 funds alive in June 1994 and, whenever a fund closes, **replacing** it with a randomly selected fund alive at closure that follows the **same strategy** and is of similar **age and size**. From these 455 series they draw **500** equally-weighted 20-fund portfolios by random sampling without replacement, compute mean / std / skew / kurtosis for each, take the **median** of each statistic, and select the single portfolio whose sample statistics are closest to those medians—the **“median portfolio of 20 funds.”**

### 2.3 Exhibit 1 sample statistics (June 1994 – May 2001)

| Statistic | Stocks | Bonds | Hedge Funds |
|-----------|--------|-------|-------------|
| Mean (monthly) | 1.46% | 0.43% | 0.99% |
| Std Dev | 4.39% | 1.77% | 2.44% |
| Skewness | −0.79 | 0.56 | −0.52 |
| Kurtosis | 3.92 | 4.29 | 5.39 |
| Corr(Stocks, ·) | 1.00 | 0.15 | 0.62 |
| Corr(Bonds, ·) | 0.15 | 1.00 | −0.08 |
| Corr(HF, ·) | 0.62 | −0.08 | 1.00 |

Notable features: hedge funds have roughly bond–equity intermediate volatility, **negative skewness** (−0.52) and **elevated kurtosis** (5.39), and a **substantial equity correlation** (0.62) despite near-zero bond correlation (−0.08). A 50/50 stock–bond mix and the hedge-fund portfolio both have expected returns of about **1% per month** over the sample—important for the “minimize volatility at fixed mean” experiments below.

### 2.4 On random sampling as a proxy for active selection

The authors acknowledge that investors do not pick funds randomly. They argue, however, that there is little evidence of consistent outperformance selection skill: Kat and Lu (2002) find that over 1994–2001 the average fund of funds **underperformed** an equally-weighted random hedge-fund portfolio by almost **3% per annum**. Persistence after bias correction is weak; older funds may be closed to new capital, forcing new allocators into short-track-record funds. Hence a carefully constructed random basket is a reasonable proxy for what many investors actually get.

---

## 3. Mean–Variance Optimizations

Two Markowitz problems are solved:

1. **Stocks + bonds only.**  
2. **Stocks + bonds + hedge funds.**

Each efficient set is examined in two dual ways:

- **Maximize mean** for a target standard deviation (σ ∈ {2.0%, 2.5%, 3.0%, 3.5%, 4.0%} monthly).  
- **Minimize standard deviation** for a target mean (μ ∈ {0.7%, 0.8%, …, 1.4%} monthly).

For every optimized portfolio the authors also report **skewness** and **kurtosis**—moments that standard M–V optimization ignores but that investors care about.

### 3.1 Stocks and bonds only (Exhibit 2)

Moving up the frontier is a straightforward exchange of bonds for stocks. As σ (or μ) rises, skewness falls roughly **linearly** because equity is more negatively skewed than bonds; kurtosis stays roughly flat (≈3–4).

Illustrative rows (maximize mean at given σ):

| σ | Mean | % Stocks | % Bonds | Skew | Kurtosis |
|---|------|----------|---------|------|----------|
| 2.0% | 0.77% | 32.8 | 67.2 | +0.04 | 3.23 |
| 2.5% | 0.95% | 50.3 | 49.7 | −0.34 | 2.97 |
| 3.0% | 1.10% | 64.7 | 35.3 | −0.55 | 3.24 |
| 3.5% | 1.23% | 77.9 | 22.1 | −0.68 | 3.57 |
| 4.0% | 1.36% | 90.4 | 9.6 | −0.77 | 3.86 |

Minimize-σ at given mean yields the dual picture: μ = 1.0% requires σ ≈ 2.67% with ≈55% stocks / 45% bonds and skew ≈ −0.42.

### 3.2 Adding hedge funds (Exhibit 3)

The allocation path along the frontier changes qualitatively (Exhibit 5):

1. Start near **50% bonds / 50% hedge funds**.  
2. As risk/return targets rise, **bonds are exchanged for stocks** while the hedge-fund weight stays roughly **constant near 50–60%**.  
3. Once bonds are depleted (around σ ≈ 3%), further increases replace **hedge funds with equity**.

Illustrative rows (max mean at given σ):

| σ | Mean | % Stocks | % Bonds | % HF | Skew | Kurtosis |
|---|------|----------|---------|------|------|----------|
| 2.0% | 0.92% | 18.1 | 26.8 | 55.1 | −0.82 | 4.39 |
| 2.5% | 1.06% | 30.0 | 10.8 | 59.3 | −0.99 | 5.26 |
| 3.0% | 1.20% | 45.1 | 0 | 54.9 | −1.07 | 5.47 |
| 3.5% | 1.30% | 67.1 | 0 | 32.9 | −1.00 | 4.81 |
| 4.0% | 1.39% | 86.1 | 0 | 13.9 | −0.89 | 4.32 |

**Skewness** no longer declines linearly. It falls while bonds are replaced by equity, reaches a **minimum near −1.07** when bonds hit zero (≈45% stocks / 55% HF), then **rises again** toward −0.79 at 100% equity as hedge funds are replaced by stocks (Exhibit 6). Kurtosis peaks in the same mid-frontier region (≈5.45–5.47).

Minimize-σ at μ = 1.0%: σ falls to **2.27%** (vs 2.67% without HF) with allocations ≈25% stocks / 18% bonds / **57% HF**, but skew collapses to **−0.92** and kurtosis rises to **4.91**.

### 3.3 Differences attributable to hedge funds (Exhibit 4)

At fixed σ = 2.0%, introducing HF raises mean by **+0.16%** per month but worsens skew by **−0.86** and kurtosis by **+1.16**. At σ = 4.0% the mean gain shrinks to **+0.03%** with much smaller moment degradation. Dual view: at μ = 0.7%, σ falls by **0.43%** but skew falls by **0.57**. The largest mean–variance improvements coincide with the **worst** skew/kurtosis trade-offs—the improvement is “bought” by accepting a higher probability of a relatively large loss.

**Allocation magnitude:** realizing the advertised mean–variance benefits requires HF weights of **at least 25–30%**, far above the 1–5% institutional digests being discussed (CalPERS and ABP billion-dollar programs amounted to **<1%** of total assets).

---

## 4. Why Equity and Hedge Funds Combine Poorly on Higher Moments

When equity markets sell off, hedge funds often suffer as well—not necessarily because they hold equities, but because equity crashes co-occur with:

- widening **credit spreads**,  
- collapsing **liquidity**,  
- elevated **volatility**.

Hedge-fund strategies are highly sensitive to these factors. The authors illustrate with **2002**: S&P 500 fell >20% amid high volatility and widening spreads. Distressed-debt and credit-exposed convertible-arbitrage managers suffered; volatility traders fared better; statistical-arbitrage funds were hurt by liquidity droughts; low-net equity long/short outperformed persistently net-long managers. Aggregate hedge-fund index performance was roughly **flat**—not a hedge when equity was down sharply.

Formally, the **opportunity set** of (μ, σ², skew) combinations for stocks+bonds+HF has the property that the **most attractive mean–variance points lie at the lowest skewness levels** (Exhibit 7). Avoiding the skew penalty forces the investor back toward the no-HF frontier. Mean–variance–skewness portfolio selection (Jean 1971, 1973; Simkowitz and Beedles 1978) therefore deserves revival precisely because hedge funds make skewness first-order.

---

## 5. Investor Heterogeneity and Suitability

Whether the HF-augmented portfolio is “better” is a **taste** question, not a universal rule. Institutions that can absorb large losses (e.g., by raising premiums) may rationally trade skewness for higher mean / lower σ. Retail investors—historically the main HF clientele—are less well equipped. Institutional interest was rising (endowments aside) but large allocations remained rare as of the paper’s writing.

---

## 6. Additional Caveats That Further Reduce the Case for Hedge Funds

### 6.1 Serial-correlation / stale-pricing bias

Brooks and Kat (2002) document high positive serial correlation in monthly returns of convertible-arbitrage, risk-arbitrage, and distressed strategies, arising from lagged/conservative valuations of illiquid holdings. Correcting for autocorrelation **raises** estimated volatility substantially: for the CSFB/Tremont Convertible Arbitrage index, monthly σ rises from **1.36% to 2.42%**. Incorporating this bias makes certain HF types less attractive as diversifiers.

### 6.2 Illiquidity and lock-ups

Long lock-ups and notice periods reduce managing costs and enable illiquid investments, but they make HF stakes **far less liquid** than stocks or bonds. Properly priced illiquidity further shrinks the net benefit.

### 6.3 Estimation error and regime specificity

Most HF databases begin around **1994** with monthly reporting only. The available history spans the 1990s bull market and subsequent crises—a short and special window—whereas stocks and bonds offer high-frequency data over many business cycles. The HF return-generating process remains poorly understood (e.g., risk-arbitrage thrived in the merger boom then faced deal drought). Capacity concerns also loom: AUM growth has coincided with lower returns, consistent with crowding. Embedding these uncertainties in portfolio choice again reduces HF attractiveness.

---

## 7. Practical Takeaways for a Quant Investor

1. **Do not judge HF diversification in mean–variance space alone.** Report and constrain skewness and kurtosis (or use CVaR / drawdown / option-implied crash premia).  
2. **Expect equity–HF co-crashes** via credit, liquidity, and vol channels even when HF beta looks moderate in quiet markets. Sample equity correlation of **0.62** already warns against treating HF as an orthogonal diversifier.  
3. **Token 1–5% sleeves are largely cosmetic** for overall portfolio moments; meaningful M–V impact requires **≥25–30%**, which also maximizes the skew/kurtosis penalty.  
4. **Correct for stale pricing** before trusting HF volatility and Sharpe ratios; autocorrelation-adjusted σ can be **~80% higher** (convertible arb example).  
5. **Treat historical HF moments as upper bounds** on attractiveness once illiquidity, capacity, short samples, and selection-skill evidence (FoF underperformance ≈3%/yr vs random) are recognized.  
6. **If allocating anyway**, prefer frameworks that optimize in (μ, σ, skew) or use scenario/stress correlations rather than unconditional estimates—foreshadowing the Rebonato–Jäckel correlation-matrix methodology in related risk-management literature.  
7. **Who should buy the trade-off?** Institutions with loss-absorption capacity may rationally accept lower skew for better M–V; retail investors less so—yet historically the opposite base of clients prevailed.

---

## 8. Limitations

- Single 7-year window (1994–2001); results may be sample-specific.  
- One representative 20-fund median portfolio; strategy mix matters (note 6: convertible arb improves the low end of the frontier, long/short equity the high end).  
- Moments estimated from monthly data without explicit dynamic correlation or regime switching.  
- Mean–variance optimization with non-negativity but without transaction costs, lock-up constraints, or estimation-error shrinkage.  
- Exhibits 5–7 are graphical; exact intermediate weights must be read from Exhibits 2–4.  
- No formal utility-function optimization over skewness preference parameters.

---

## 9. Conclusion

Amin and Kat’s message is precise: introducing hedge funds into a stock–bond portfolio **improves mean–variance metrics but worsens skewness and kurtosis**. The apparent free lunch disappears once higher moments, illiquidity, data biases, and estimation uncertainty are acknowledged. Hedge funds are neither inherently good nor bad—they are **different**, and they demand a more elaborate decision framework than the mean–variance toolkit still used by most investors. The same caveat applies, by extension, to other alternatives (emerging markets, managed futures, private equity/venture capital, catastrophe- and credit-linked notes).

---

## 10. Detailed Dual Frontiers and Numerical Magnitudes

### 10.1 Full minimize-σ frontier without hedge funds

From Exhibit 2 (second block), targeting monthly means from 0.7% to 1.4%:

| Target Mean | Achieved σ | % Stocks | % Bonds | Skew | Kurtosis |
|-------------|------------|----------|---------|------|----------|
| 0.7% | 1.87% | 26.2 | 73.8 | +0.20 | 3.60 |
| 0.8% | 2.08% | 35.9 | 64.1 | −0.03 | 3.11 |
| 0.9% | 2.35% | 45.6 | 54.4 | −0.25 | 2.95 |
| 1.0% | 2.67% | 55.3 | 44.7 | −0.42 | 3.04 |
| 1.1% | 3.01% | 65.1 | 35.0 | −0.56 | 3.25 |
| 1.2% | 3.38% | 74.8 | 25.2 | −0.66 | 3.49 |
| 1.3% | 3.76% | 84.5 | 15.5 | −0.73 | 3.73 |
| 1.4% | 4.15% | 94.2 | 5.8 | −0.79 | 3.94 |

Skewness falls almost monotonically from +0.20 to −0.79 as the equity share rises from ~26% to ~94%. Kurtosis dips slightly near μ = 0.9% then rises toward the equity kurtosis of 3.92–3.94. This is the classic stock–bond trade-off: more equity buys mean and drains positive skew inherited from bonds.

### 10.2 Full minimize-σ frontier with hedge funds

Exhibit 3 (second block):

| Target Mean | Achieved σ | % Stocks | % Bonds | % HF | Skew | Kurtosis |
|-------------|------------|----------|---------|------|------|----------|
| 0.7% | 1.44% | 0.2 | 51.0 | 48.8 | −0.37 | 3.31 |
| 0.8% | 1.65% | 8.3 | 40.0 | 51.7 | −0.59 | 3.60 |
| 0.9% | 1.94% | 16.5 | 28.9 | 54.6 | −0.79 | 4.26 |
| 1.0% | 2.27% | 24.7 | 17.9 | 57.4 | −0.92 | 4.91 |
| 1.1% | 2.63% | 32.8 | 6.8 | 60.3 | −1.02 | 5.43 |
| 1.2% | 3.02% | 45.8 | 0 | 54.2 | −1.07 | 5.45 |
| 1.3% | 3.49% | 66.7 | 0 | 33.3 | −1.00 | 4.82 |
| 1.4% | 4.04% | 87.5 | 0 | 12.5 | −0.89 | 4.29 |

At every mean target from 0.7% to 1.4%, volatility is lower with HF than without—but skew is substantially more negative and kurtosis is higher once HF weights exceed ~50%. The **worst skew (−1.07)** and near-peak kurtosis (5.45) occur at μ = 1.2%, precisely where the M–V improvement is still economically large (σ 3.02% vs 3.38% without HF).

### 10.3 Delta table interpretation (Exhibit 4)

Changes due to introducing HF:

**At fixed σ (max-mean problem):**

| σ | ΔMean | ΔSkew | ΔKurtosis |
|---|-------|-------|-----------|
| 2.0% | +0.16% | −0.86 | +1.16 |
| 2.5% | +0.12% | −0.65 | +2.29 |
| 3.0% | +0.10% | −0.51 | +2.23 |
| 3.5% | +0.07% | −0.32 | +1.23 |
| 4.0% | +0.03% | −0.13 | +0.46 |

**At fixed mean (min-σ problem):**

| Mean | Δσ | ΔSkew | ΔKurtosis |
|------|-----|-------|-----------|
| 0.7% | −0.43% | −0.57 | −0.29 |
| 0.8% | −0.43% | −0.56 | +0.49 |
| 0.9% | −0.41% | −0.54 | +1.30 |
| 1.0% | −0.40% | −0.50 | +1.87 |
| 1.1% | −0.38% | −0.46 | +2.17 |
| 1.2% | −0.36% | −0.41 | +1.95 |
| 1.3% | −0.27% | −0.27 | +1.09 |
| 1.4% | −0.11% | −0.10 | +0.35 |

Pattern: **largest M–V gains ↔ largest higher-moment costs**. At the low-risk end, a manager can cut monthly σ by ~40 bps and lift mean by ~10–16 bps, but must accept skewness drops of 0.5–0.9 and kurtosis jumps of 1–2 units. At the high-risk end the M–V gains shrink toward zero and so do the higher-moment penalties—because the optimal HF weight itself shrinks toward zero.

### 10.4 Annualizing the economic magnitudes (approximate)

Using 12 × monthly mean and √12 × monthly σ as rough annualizers (ignoring compounding and serial correlation):

- Without HF, μ_ann ≈ 12%, σ_ann ≈ 9.3% at the μ = 1.0% monthly target.  
- With HF, same mean at σ_ann ≈ 7.9%—about **140 bps of annualized vol reduction**.  
- Skewness is scale-free; a drop from −0.42 to −0.92 is a large change in left-tail asymmetry for any horizon.  
- Excess kurtosis rising from ~0 to ~2 (kurtosis 3 → 5) materially thickens tails for VaR/ES calculations.

These are economically first-order for a risk manager who reports monthly or annual VaR at 99%, even if they look modest in a mean–variance plot.

---

## 11. Preferential Moments and Utility

Scott and Horvath (1980) show that under weak restrictions on utility, investors prefer:

- higher **odd** moments (mean, skewness, …),  
- lower **even** moments (variance, kurtosis, …).

Hedge funds, in this sample, score well on mean and variance but poorly on skewness and kurtosis—exactly the dimensions investors dislike. Hence a mean–variance “improvement” can still reduce expected utility for any investor with non-negligible aversion to negative skew and fat tails. This is why Exhibit 7’s mean–variance–skewness geometry matters: the M–V efficient set with HF sits on the **bad-skewness** side of the opportunity set.

Jean (1971, 1973) and Simkowitz–Beedles (1978) developed three-moment portfolio theory decades earlier; interest faded because stocks and bonds alone do not make skewness first-order. Amin and Kat’s contribution is to show that **alternatives revive the need for three-moment (or four-moment) decision rules**.

---

## 12. Strategy Heterogeneity (Note 6)

The representative 20-fund portfolio’s location in (μ, σ) space shapes *where* on the frontier HF helps most. Typically the largest improvement occurs near the HF portfolio’s own mean and volatility (~0.99%, 2.44%). Consequently:

- A **convertible-arbitrage–heavy** sleeve improves especially the **lower** end of the frontier (bond-like vol, moderate mean).  
- A **long/short equity–heavy** sleeve improves especially the **upper** end (higher mean, equity-like vol).  

Investors should not extrapolate Exhibit 3’s weights to a different strategy mix without re-estimating moments and correlations. Distressed, merger arb, and convertible strategies also drive the stale-pricing autocorrelation problem (Brooks–Kat), so volatility corrections are strategy-specific.

---

## 13. Crisis Co-Movement Mechanism — Quantitative Implication

The equity–HF correlation of **0.62** understates crisis dependence if correlation is state-dependent (as in equity-crash literature; cf. Boyer–Gibson–Loretan). A risk manager who plugs unconditional correlations into a variance–covariance VaR:

$$
\text{VaR} \propto \sqrt{w^\top \Sigma w}
$$

will **overstate diversification** precisely when it is most needed. The 2002 narrative—flat HF indices amid a >20% equity drawdown—is the empirical counterpart: diversification “works” in calm months and fails in stress months that dominate skewness and kurtosis of the mixed portfolio.

---

## 14. Implementation Checklist for CIOs

1. **Rebuild the opportunity set** in (μ, σ, skew, kurt) using live+dead HF data and autocorrelation-adjusted returns.  
2. **Stress the correlation** of HF with equity to crash levels (e.g., 0.8–1.0) and recompute frontier moments.  
3. **Impose a minimum skew constraint** (or maximum CVaR) rather than maximizing Sharpe alone.  
4. **Size the allocation** only if the constrained problem still prefers HF; otherwise the 1–5% “toe in the water” is psychologically comforting but analytically inert.  
5. **Haircut expected HF means** for capacity, fees, and FoF underperformance (~3%/yr vs random baskets in Kat–Lu 2002).  
6. **Document liquidity**: lock-ups, gates, side pockets—fold into a liquidity-adjusted Sharpe or into a separate liquidity budget.  
7. **Revisit annually**: short HF histories mean parameter uncertainty is large; Bayesian or resampling overlays (related to Michaud-type concerns) are warranted.

---

## 15. Relation to the Broader Literature Cited

- **Amin–Kat (2003a, JFQA forthcoming):** performance 1990–2000—do “money machines” add value after proper benchmarking?  
- **Amin–Kat (2003b, JAI forthcoming):** attrition and survivorship 1994–2001—quantifies the live-only bias the present paper avoids by replacement sampling.  
- **Brooks–Kat (2002, JAI):** statistical properties of HF index returns—serial correlation and implications for investors; source of the 1.36% → 2.42% convertible-arb volatility correction.  
- **McFall Lamm (1999, JAI):** “Why not 100% hedge funds?”—the provocative mean–variance case that Amin–Kat qualify with higher moments.  
- **Favre–Galeano (2002):** Loess-fit performance analysis—another higher-moment-aware treatment.

Together these papers form a coherent AIRC research program: naive mean–variance advocacy for hedge funds does not survive careful attention to biases, dependence, and higher moments.

---

## 16. Final Synthesis

The paper’s title is earned. Over June 1994–May 2001, a carefully bias-adjusted 20-fund hedge-fund portfolio offers monthly mean 0.99%, σ 2.44%, skew −0.52, kurtosis 5.39, and equity correlation 0.62. Grafting it onto stocks and bonds:

- raises achievable mean at fixed σ by up to ~16 bps/month (low-risk end),  
- cuts achievable σ at fixed mean by up to ~43 bps/month,  
- but drives portfolio skewness as low as **−1.07** and kurtosis as high as **~5.5**,  
- and requires HF weights of **~50–60%** to matter—orders of magnitude above institutional 1–5% pilots.

Add stale-pricing volatility understatement, lock-up illiquidity, short/special samples, and weak evidence of selection skill, and the case for hedge funds becomes a **trade-off between profit potential and loss potential**, not a free lunch. Quant investors should therefore replace “HF improve the Sharpe ratio” with “HF reshape the entire return distribution—optimize accordingly.”
