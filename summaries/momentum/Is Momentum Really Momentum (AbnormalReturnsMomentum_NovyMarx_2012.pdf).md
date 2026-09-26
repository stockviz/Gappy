# Is Momentum Really Momentum? — Novy-Marx (2012) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Is momentum really momentum? |
| **Author** | Robert Novy-Marx (Simon Graduate School of Business, University of Rochester) |
| **Outlet** | *Journal of Financial Economics* **103** (2012) 429–453 |
| **DOI** | 10.1016/j.jfineco.2011.05.003 |
| **Received / Accepted** | 1 Jul 2008 / 9 Feb 2010; available online 17 Aug 2011 |
| **JEL** | G12 |
| **Keywords** | Momentum; Factor models |
| **Sample (US equities)** | CRSP all stocks; **January 1926–December 2010** (strategy returns typically **Jan 1927–Dec 2010**, ~84 years) |
| **Themes** | Term structure of momentum; intermediate (12–7) vs recent (6–2) past performance; Fama–MacBeth; FF3+UMD alphas; size sorts; industries/styles/international assets |
| **Original PDF** | `AbnormalReturnsMomentum_NovyMarx_2012.pdf` |
| **Extraction** | `pdftotext -layout` (~20,009 words); clean text, no OCR needed |

---

## Problem / Motivation

Classical momentum—“the tendency of an object in motion to stay in motion”—is usually interpreted as **short-run autocorrelation**: winners keep winning and losers keep losing over the near past. Jegadeesh–Titman (1993) *J/K* strategies form portfolios on cumulative returns over the previous $J\in\{3,6,9,12\}$ months (skipping the most recent week/month to avoid microstructure reversals) and hold for $K$ months. Practitioners and theorists alike treat this as evidence of near-term positive serial correlation.

Novy-Marx’s central claim is that this description is **false as a characterization of where the premium lives**. Stocks that rose most over the past six months but did poorly 12–7 months ago **underperform** stocks that fell most recently but did well 12–7 months ago. **Intermediate-horizon past performance** $r_{12,7}$ (cumulative return from month $t-12$ through $t-7$) predicts average returns more strongly than **recent past performance** $r_{6,2}$ (months $t-6$ through $t-2$). The phenomenon looks more like an **echo** than classical momentum: information peaks around lags 7–12 months, recent lags add little once intermediate performance is controlled, and predictability collapses abruptly beyond 12 months (after controlling for value).

Practical stakes:
- Among **large, liquid** NYSE-breakpoint size-quintile stocks (~300 largest firms), a value-weighted strategy long (short) the top (bottom) **quintile** of $r_{12,7}$ earned **almost 10% per year** from Jan 1927–Dec 2010—suggesting capacity arguments (Korajczyk–Sadka 2004) and trading-cost critiques (Lesmond–Schill–Zhou 2004) overstate frictions relative to a properly designed intermediate-horizon strategy.
- Behavioral stories (Barberis–Shleifer–Vishny 1998; Hong–Stein 1999; Hirshleifer–Subrahmanyam 1999) and rational stories (Johnson 2002; Sagi–Seasholes 2007) do **not** deliver this term structure.
- The result is **not** the 12-month seasonal effect of Jegadeesh (1990) / Heston–Sadka (2008), not capital-gains overhang / disposition, and essentially unrelated to Grinblatt–Moskowitz (2004) consistency of performance.

---

## Data and Portfolio Construction

**Universe.** All CRSP stocks, Jan 1926–Dec 2010. Author’s UMD replication correlates **>99%** with Ken French’s posted UMD.

**Strategy definition.** Each month, winners (losers) = upper (lower) **decile** by **NYSE breaks** of cumulative returns over a test window. Notation:

$$
\mathrm{MOM}_{n,m} \equiv \text{WML based on } r_{n,m},
$$

where $r_{n,m}$ is cumulative return from $n$ to $m$ months **inclusive** prior to formation. Value-weighted and equal-weighted returns are both studied. Holding period is fixed at **one month** in the term-structure maps to keep the strategy count manageable.

**Key windows.**
- Intermediate: $\mathrm{MOM}_{12,7}$ (months −12 through −7).
- Recent (skipping last month): $\mathrm{MOM}_{6,2}$ (months −6 through −2).
- Very short: $\mathrm{MOM}_{1,1}$ / $\mathrm{MOM}_{6,1}$ where noted.

**Controls in Fama–MacBeth.** Prior-month return $r_{1,0}$, $\log(\mathrm{ME})$, $\log(\mathrm{BM})$; independents winsorized monthly at 1%/99%.

**Subsamples.** Full 1927–2010; early/late halves 1927–1968 / 1969–2010; quarters 1927–47, 1948–68, 1969–89, 1990–2010.

**Other asset classes (Section 5).** Fama–French 49 industries; 25 size–BTM style portfolios; international equity indices, commodities, currencies (Asness–Moskowitz–Pedersen-style universe).

---

## Methods and Core Econometrics

### Term-structure map (Section 2)

Fig. 1 plots, for each lag $\ell=1,\ldots,15$, the WML based on a **single month** $\mathrm{MOM}_{\ell,\ell}$: average monthly return, monthly SD, and annualized Sharpe (VW black / EW gray).

**Qualitative facts from Fig. 1:**
- **Panel A (mean returns):** upward-sloping term structure in lag—spreads **increase** with time between evaluation and formation—then **fall off a cliff after 12 months**. Inconsistent with monotonically decaying short-run autocorrelation.
- **Panel B (volatility):** generally downward-sloping in lag; consistent with mean-reverting stochastic volatility (selection on large movers biases both legs toward high-vol stocks that subsequently cool).
- **Panel C (Sharpe):** inherits the return pattern, tilted counterclockwise by falling vol—so the **performance** term structure slopes up even more steeply than expected returns. Near-formation months contribute little to typical momentum Sharpe.

Simple horse race of $\mathrm{MOM}_{12,7}$ vs $\mathrm{MOM}_{6,2}$ follows directly from this map.

### Fama–MacBeth (Section 3 / Table 1)

Cross-sectional regressions each month:

$$
r_t^j = b_0 + b_{12,7}\, r_{12,7}^j + b_{6,2}\, r_{6,2}^j + b_{1,0}\, r_{1,0}^j + b_{\mathrm{ME}}\log(\mathrm{ME}^j) + b_{\mathrm{BM}}\log(\mathrm{BM}^j) + e_t^j,
$$

then average $b$ over time with Newey–West / FM $t$-stats.

**Table 1 key coefficients** (slopes $\times 10^2$, $[t]$):

| Sample | $b_{12,7}$ | $b_{6,2}$ | $b_{12,7}-b_{6,2}$ | $b_{1,0}$ | $\log\mathrm{ME}$ | $\log\mathrm{BM}$ |
|--------|-------------|-------------|---------------------|-------------|---------------------|---------------------|
| Whole 1927–2010 | **1.07 [5.72]** | 0.49 [1.88] | **0.58 [2.47]** | −7.77 [−20.9] | −0.14 [−4.08] | 0.26 [5.51] |
| Early 1927–1968 | 1.21 [3.70] | 0.62 [1.40] | 0.60 [1.46] | −9.44 | −0.18 | 0.22 |
| Late 1969–2010 | **0.93 [5.17]** | 0.36 [1.32] | **0.57 [2.42]** | −6.10 | −0.09 | 0.31 |
| Q1 1927–47 | 1.29 [2.12] | **−0.97 [−1.23]** | 2.26 [3.11] | −11.9 | −0.25 | 0.27 |
| Q2 1948–68 | 1.14 [4.54] | **2.20 [6.00]** | −1.06 [−3.08] | −6.93 | −0.10 | 0.17 |
| Q3 1969–89 | 1.24 [5.29] | 0.37 [1.00] | 0.88 [2.96] | −8.18 | −0.04 | 0.48 |
| Q4 1990–2010 | 0.61 [2.26] | 0.36 [0.87] | 0.25 [0.69] | −4.02 | −0.15 | 0.14 |

Interpretation: intermediate coefficient is **large and stable**; recent coefficient is **volatile**—huge in the 1950s–60s, **negative** through WWII, near zero in modern Nasdaq-inclusive samples. Difference $b_{12,7}-b_{6,2}$ is significant over the full sample and late half.

### Time-series factor regressions (Table 2)

On $\mathrm{MOM}_{12,7}$ and $\mathrm{MOM}_{6,2}$ vs constant / MKT / FF3 / FF3+UMD.

| Spec | Dep. var. | Intercept (%/mo) | Notes |
|------|-----------|------------------|-------|
| (1) | $\mathrm{MOM}_{12,7}$ | **1.20 [5.79]** | Raw mean |
| (5) | $\mathrm{MOM}_{6,2}$ | **0.67** | Raw mean |
| Diff | 12–7 minus 6–2 | **0.54 [2.21]** | Significant at 5% |
| (4) | $\mathrm{MOM}_{12,7}$ on FF3+UMD | **α = 0.54 [3.78]** | Survives four-factor |
| (8) | $\mathrm{MOM}_{6,2}$ on FF3+UMD | **α ≈ −0.05** | Insignificant |

Both strategies load heavily on UMD; adding UMD shrinks alphas (also via reducing negative HML/MKT loadings). Critically, **only intermediate momentum retains significant four-factor alpha**.

### Spanning / information ratios (Table 3)

Time-series regressions of each strategy on the other (+ FF factors). Message: $\mathrm{MOM}_{12,7}$ has a large information ratio vs $\mathrm{MOM}_{6,2}$; the reverse is not true—recent momentum is largely spanned once intermediate momentum is traded.

### Independent double sorts (Tables 4–6)

25 portfolios: independent NYSE-breakpoint **quintile** sorts on $r_{12,7}$ and $r_{6,2}$, value-weighted. Because serial correlation is weak, the two sort keys are relatively uncorrelated → no thin cells.

**Qualitative:** return variation across the **intermediate** dimension is roughly **twice** that across the **recent** dimension.

**Late sample (1969–2010), Table 5–6:** disparity sharpens. Conditional intermediate WML spreads remain highly significant; GRS fails to reject that excess returns of recent-conditioned portfolios are jointly zero in some specifications. Table 6 (conditional WMLs):

Example (late sample, %/mo, $[t]$):
- $\mathrm{MOM}_{12,7}$ conditioned on $r_{6,2}$ quintiles: means from **1.07 [4.58]** (loser RR) to **1.30 [6.35]** (winner RR)—all large.
- $\mathrm{MOM}_{6,2}$ conditioned on $r_{12,7}$: means **0.26–0.49**, mostly insignificant or marginal ($[0.97]$ to $[1.93]$).

### Size interaction (Table 7 / Section 4)

Within NYSE size quintiles, quintile WML on intermediate vs recent.

**Panel A characteristics (time-series averages):** largest quintile holds **~77.9%** of cap, ~337 firms, avg cap ~\\$4.7B; smallest ~1.7% of cap, ~1772 firms.

**Panel B full-sample excess returns (%/mo):**

| Size | $\mathrm{MOM}^i_{12,7}$ | $\mathrm{MOM}^i_{6,2}$ |
|------|--------------------------|-------------------------|
| Small | 0.83 [5.17] | 0.53 [2.99] |
| 2 | 0.85 [6.39] | 0.73 [4.22] |
| 3 | 1.00 [6.53] | 0.52 [2.70] |
| 4 | 0.87 [5.10] | 0.53 [2.85] |
| **Large** | **0.82 [4.66]** | **0.24 [1.25]** |

Among **large** stocks, recent momentum is **insignificant**; intermediate remains **~0.8%/mo**. Late-sample Panel D: large $\mathrm{MOM}_{12,7}$ still **0.91 [4.20]**. Root-mean-squared spreads favor intermediate across size. This is the capacity-relevant result.

### Industries, styles, international (Tables 8–10)

**Industry momentum (FF49, Table 8):** $\mathrm{MOM}^{\mathrm{ind}}_{12,7}$ mean **0.57%/mo [4.93]**, Sharpe **0.54**; $\mathrm{MOM}^{\mathrm{ind}}_{6,2}$ **0.27 [2.19]**, Sharpe **0.24**. Spanning: 12–7 α vs 6–2 remains large; 6–2 α vs 12–7 ≈ 0. Including month −1 in short window ($\mathrm{MOM}_{6,1}$) does **not** overturn spanning—6–1 still lacks IR vs 12–7.

**Style momentum (25 size–BTM, Table 9):** 12–7 **0.42%/mo** (significant); 6–2 weaker; same spanning pattern with UMD loadings.

**International / commodities / FX (Table 10):** 12–7 **0.93%/mo**, Sharpe **0.82**; 6–2 **0.43**, Sharpe **0.36**—again >2×. Both load on UMD (Asness–Moskowitz–Pedersen), but 6–2’s UMD beta is nearly **twice** 12–7’s despite lower mean—consistent with recent strategy being a noisier, more “classical UMD-like” object that adds little once intermediate is held.

### Time variation (Fig. 3 and related)

Trailing 10-year Sharpes: $\mathrm{MOM}_{6,2}$ strong in 1950s–60s, **negative** early sample through WWII, weak post-Nasdaq (<60% of 12–7 Sharpe over ~3.5 decades). $\mathrm{MOM}_{12,7}$ never posts a negative 10-year window. Correlation between the two strategies **rises** over time; even intermediate-neutral recent strategies load positively on intermediate factors after the mid-1940s (mean 10-year loading >0.25).

---

## Results Summary (Quantitative Scorecard)

1. **FM:** $b_{12,7}=1.07$ ($t=5.72$) vs $b_{6,2}=0.49$ ($t=1.88$); difference $t=2.47$.
2. **Raw WML:** 1.20%/mo vs 0.67%/mo; gap 0.54%/mo ($t=2.21$).
3. **Four-factor α:** 0.54%/mo ($t=3.78$) vs ≈0.
4. **Double sorts:** ~2× return dispersion on intermediate vs recent dimension.
5. **Large caps:** intermediate ~0.8–0.9%/mo significant; recent ~0.24%/mo insignificant (full sample).
6. **Other assets:** Sharpe ratios of intermediate strategies **>2×** recent; recent never generates significant abnormal returns vs intermediate.
7. **Echo, not momentum:** term structure rises with lag to 12 months then collapses—opposite of decaying autocorrelation.

---

## Limitations and Robustness Boundaries

- **Skip-month convention:** recent window is 6–2 (5 months) vs intermediate 12–7 (6 months); author checks 5-month intermediate window—qualitatively identical.
- **Microstructure:** last-month reversal $b_{1,0}\approx -7.77\times 10^{-2}$ ($t\approx -21$) is huge; excluding it is essential for “recent” not to be contaminated.
- **Implementation:** one-month hold abstracts from overlapping JT construction; transaction costs not modeled (though large-cap result speaks to capacity).
- **Theory gap:** paper is deliberately empirical; it **rejects** existing explanations without offering a complete new model.
- **International sample:** smaller cross-section / shorter histories than US CRSP; magnitudes (0.93 vs 0.43) still line up.
- **Multiple testing:** many windows/lags; primary horse race (12–7 vs 6–2) is pre-registered by the JT six-month convention split in half.

---

## Quant / PM Takeaways

1. **Build momentum on $r_{12,7}$ (or 12–7 quintiles), not 6–1/6–2**, especially in liquid large-cap books where classical recent momentum is weak.
2. **Do not expect UMD to span intermediate momentum**—four-factor α remains ~0.5%/mo historically; intermediate is the object that expands the opportunity set.
3. **Risk models:** if you already trade FF3 + intermediate momentum, recent-momentum overlays add little post-1960s once covariances are recognized.
4. **Echo challenge for research:** any structural model of “momentum” must deliver (i) peak predictability at 7–12 month lags, (ii) weak conditional recent predictability, (iii) cliff after 12 months given value.
5. **Capacity narrative:** ~10%/year VW large-cap 12–7 quintile WML (1927–2010) reframes the “momentum is a small-stock / high-cost anomaly” critique.
6. **Cross-asset:** same 12–7 dominance in industries, styles, indices, commodities, FX—suggests a **common term-structure of trend**, not a US equity microstructure artifact.
7. **Signal engineering:** when combining lookbacks, overweight intermediate months; downweight months 2–6 relative to months 7–12; always skip month 1 for equities.

---

## Equation Cheat-Sheet

$$
r_{n,m,t}^j = \prod_{k=m}^{n} (1+R_{t-k}^j) - 1,\qquad
\mathrm{MOM}_{n,m,t} = R^{\mathrm{W}}_{n,m,t} - R^{\mathrm{L}}_{n,m,t}.
$$

$$
\mathbb{E}_t[r_{t+1}^j] \approx \hat b_{12,7}\, r_{12,7}^j + \hat b_{6,2}\, r_{6,2}^j + \cdots,\quad \hat b_{12,7} \gg \hat b_{6,2}.
$$

Four-factor:

$$
R_{\mathrm{MOM},t} = \alpha + \beta_{\mathrm{MKT}} \mathrm{MKT}_t + \beta_{\mathrm{SMB}}\mathrm{SMB}_t + \beta_{\mathrm{HML}}\mathrm{HML}_t + \beta_{\mathrm{UMD}}\mathrm{UMD}_t + \varepsilon_t.
$$

---

## Bottom Line

Novy-Marx (2012) reframes the momentum anomaly as an **intermediate-horizon echo**. Empirically, $\mathrm{MOM}_{12,7}$ dominates $\mathrm{MOM}_{6,2}$ in means, Sharpes, four-factor alphas, double sorts, large caps, and every non-equity asset class tested. For quantitative portfolio construction, **replace or heavily reweight “classical” recent momentum with 12–7 intermediate momentum**, especially where liquidity and capacity matter.

---

## Extended Discussion: Relation to Jegadeesh–Titman and UMD

Jegadeesh and Titman (1993) document that portfolios formed on $J$-month past returns and held for $K$ months earn abnormal profits for $J,K\in\{3,6,9,12\}$. The industry shorthand “6/1/6” (six-month formation, one-month skip, six-month hold) became the workhorse. Ken French’s UMD factor is constructed from 2–12 month cumulative returns (skipping the most recent month) within size groups—so UMD itself **mixes** intermediate and recent information. Novy-Marx’s contribution is to **unbundle** that mixture.

Because UMD loads on both $r_{12,7}$ and $r_{6,2}$, a regression of $\mathrm{MOM}_{12,7}$ on FF3+UMD still leaves significant α (0.54%/mo), whereas $\mathrm{MOM}_{6,2}$’s α collapses to zero. That pattern is exactly what one expects if UMD’s priced component is predominantly intermediate-horizon and the residual recent component is either unpriced or subsumed after controlling for intermediate comovement.

Overlapping multi-month holds (classic JT) smooth month-to-month noise but do not change the **relative** ranking of intermediate vs recent formation windows; the paper’s one-month hold is a transparency device, not a claim that overlapping holds reverse the conclusion.

### Microstructure and the skip month

The FM coefficient on $r_{1,0}$ of about $-7.77\times 10^{-2}$ ($t\approx -21$) is an order of magnitude larger than momentum slopes. Including month $t-1$ in a “recent” signal without a skip converts momentum into a noisy blend of momentum and short-term reversal. That is why $\mathrm{MOM}_{6,1}$ can look stronger than $\mathrm{MOM}_{6,2}$ in raw means for industries yet still fail spanning tests against $\mathrm{MOM}_{12,7}$: the extra month adds reversal-related variance and covariance with UMD without adding independent priced variation orthogonal to intermediate momentum.

### Earnings announcements and the 12-month cliff

Heston and Sadka (2008) emphasize seasonal autocorrelation at annual lags. Novy-Marx argues his term structure is **not** reducible to that effect: after controlling for value, predictability drops sharply beyond 12 months, and the **within-year** hump (higher coefficients at lags 7–12 than 2–6) is the novel object. Any story that only produces monotonic decay or only annual seasonality fails.

Grinblatt and Moskowitz (2004) study consistency of signed returns (how often a stock was positive). Novy-Marx reports the intermediate-vs-recent result is essentially unrelated to that consistency measure—ruling out a simple “streakiness” reinterpretation.

### Behavioral vs rational accounts: what breaks

- **BSV (1998) regime-shifting / representativeness:** tends to generate underreaction then overreaction with horizons tied to learning speeds, not a 7–12 month echo peak.
- **Hong–Stein (1999) gradual diffusion:** predicts stronger effects in small, neglected stocks and at shorter diffusion lags; conflicts with **large-cap strength** of 12–7 and weakness of 6–2.
- **Johnson (2002) / Sagi–Seasholes (2007) growth-option / duration stories:** can generate momentum from convexity of value in expected growth, but do not naturally produce a **non-monotonic lag profile** with a cliff at 12 months.

The paper therefore leaves a clean research agenda: match the **empirical impulse-response** of expected returns to past monthly returns $\{\beta_\ell\}_{\ell=1}^{15}$.

---

## Implementation Notes for a Quant Book

**Signal.** For stock $i$ at month $t$:

$$
s_{i,t} = z(r_{12,7,i,t}) - \lambda\, z(r_{6,2,i,t}),
$$

with $\lambda\in[0,1]$ small (often $\lambda=0$ in liquid large-cap sleeves). Winsorize and industry-neutralize if the mandate is industry-relative; keep raw cross-section if harvesting industry momentum (Table 8).

**Portfolio.** NYSE-breakpoint quintiles or deciles; value-weight within bucket; skip month $t-1$; rebalance monthly. For capacity, restrict to size quintile 5 (or Russell 1000 / mega-cap filters). Historical full-sample large-cap $\mathrm{MOM}_{12,7}$ ≈ 0.82%/mo ≈ **9.8%/year**—matches the “almost 10%” claim for quintile sorts.

**Risk.** Residualize vs FF3 (and optionally vs a **recent**-momentum factor if you must report classical UMD exposure). Expect high UMD correlation but still significant residual α for intermediate.

**Monitoring.** Track 10-year rolling Sharpes of 12–7 vs 6–2 separately. Rising correlation between them (as documented post-1940s) warns that naive “diversification” across lookbacks is illusory.

**International overlay.** On futures (equity indices, commodities, FX), prefer 12–7 WML; expect Sharpe ≈ 0.8 vs ≈ 0.4 for 6–2 in the paper’s sample—pair with Asness–Moskowitz–Pedersen time-series momentum carefully, because TSMOM also mixes horizons.

---

## Detailed Walk-Through of Table 2 Factor Loadings

Although the excerpted Table 2 block emphasizes intercepts, the narrative states:
- Specs (2) and (6): both strategies have significant market and FF3 exposures; alphas rise when moving from raw means to FF3 (1.36 and 0.99 in the printed intercept row for early columns)—consistent with **negative** HML/MKT loadings typical of momentum (winners are growth / high-beta in some regimes).
- Specs (4) and (8): adding UMD collapses 6–2 α to ≈0 while 12–7 α remains 0.54% ($t=3.78$).

Economic reading: classical “momentum factor” hedging removes the recent-horizon component and the shared comovement, but **cannot** remove intermediate-horizon mispricing. An optimizer that treats UMD as the complete momentum risk factor will **understate** alpha available from 12–7 construction.

---

## Double-Sort Numerics and GRS Logic

Let $r_{q,s}$ be the VW return of intermediate-quintile $q$ and recent-quintile $s$. Conditional intermediate spreads

$$
\mathrm{WML}^{\mathrm{IR}}|_s = r_{5,s}-r_{1,s}
$$

are large for each $s$ (Table 6: 1.07 to 1.30%/mo). Conditional recent spreads

$$
\mathrm{WML}^{\mathrm{RR}}|_q = r_{q,5}-r_{q,1}
$$

are 0.26–0.49%/mo. A GRS test on the five $\mathrm{WML}^{\mathrm{RR}}|_q$ portfolios asks whether their mean vector is zero after risk adjustment; the paper reports failure to reject in late-sample settings where intermediate remains strong—formalizing that recent momentum is **not** a reliable second dimension once intermediate is conditioned on.

---

## Cross-Asset Replication Recipe

1. Each month, compute trailing returns $r_{12,7}$ and $r_{6,2}$ for each futures contract / industry portfolio.
2. Rank into thirds or halves if $N$ is small (indices/FX), deciles if $N$ is large (industries).
3. Long top, short bottom; equal-weight contracts; report means, Sharpes, and spanning regressions on UMD and on each other.
4. Expect: $\mathbb{E}[\mathrm{MOM}_{12,7}] \approx 2\,\mathbb{E}[\mathrm{MOM}_{6,2}]$, $\mathrm{SR}_{12,7}\approx 2\,\mathrm{SR}_{6,2}$, and $\alpha_{12,7|6,2}>0$ while $\alpha_{6,2|12,7}\approx 0$.

Table 10’s 0.93 vs 0.43%/mo and Sharpes 0.82 vs 0.36 are the benchmarks.

---

## What “Echo” Means for Return Autocovariance

Write the projection of next-month excess return on lagged monthly returns:

$$
\mathbb{E}_t[r_{t+1}] = c + \sum_{\ell=1}^{L} \beta_\ell R_{t+1-\ell}.
$$

Classical momentum assumes $\beta_\ell$ positive and **decreasing** in $\ell$. Novy-Marx’s Fig. 1 implies $\beta_\ell$ **increasing** in $\ell$ up to ~12, then near zero (given value). The autocovariance-generating function of returns therefore cannot be a simple AR(1); it needs a hump-shaped MA structure or a state variable that re-visits with ~annual delay without being pure seasonality.

---

## Sample Splits: When Recent Momentum “Worked”

Quarter-sample FM (Table 1) shows $b_{6,2}=2.20$ ($t=6.00$) only in 1948–1968—the era that heavily influences early momentum lore—while $b_{6,2}$ is **negative** in 1927–1947 and insignificant after 1969. By contrast $b_{12,7}$ is positive in every quarter sample. Any backtest that starts in the 1950s–60s **overstates** recent-horizon momentum relative to a full 1927–2010 or post-1969 evaluation. This is a critical validation hygiene point for PMs inheriting JT-style code.

---

## Interaction with Value

Intermediate momentum’s cliff after 12 months appears **after controlling for BM**. Without value controls, longer-horizon past returns pick up the De Bondt–Thaler long-term reversal / value effect. The paper’s claim is carefully about momentum’s **own** term structure inside the one-year window, not a denial of long-run reversals.

In a three-characteristic model (size, value, intermediate momentum), recent momentum is the redundant fourth characteristic for much of modern history.

---

## Statistical Magnitude Conversion

A FM slope of $1.07\times 10^{-2}$ on a cumulative return means: a stock whose $r_{12,7}$ is 10 percentage points higher than another’s has expected next-month return higher by about $1.07\times 10^{-2}\times 0.10 = 10.7$ bps, holding other characteristics fixed. For a long-short decile with ~60–80 percentage-point spread in six-month cumulative returns (typical order of magnitude), this lines up with ~0.6–1.0%/mo WML means—consistent with Table 2’s 1.20%/mo for 12–7.

---

## Replication Checklist

- [ ] CRSP monthly; NYSE breakpoints for deciles/quintiles  
- [ ] Define $r_{12,7}$ and $r_{6,2}$ with inclusive month indexing  
- [ ] VW WML; also EW as robustness  
- [ ] FM with $r_{1,0}$, $\log\mathrm{ME}$, $\log\mathrm{BM}$; winsorize 1/99  
- [ ] TS regressions on MKT, SMB, HML, UMD  
- [ ] Independent 5×5 sorts; GRS on conditional spreads  
- [ ] Within-size-quintile WMLs  
- [ ] Industry (FF49), style (25), and liquid futures overlays  
- [ ] Rolling 10-year Sharpes and cross-strategy betas  

---

## Final Synthesis for Scholar Library

Novy-Marx (JFE 2012) is a **definitional** paper for momentum research and implementation: it replaces the verbal label “momentum” with a measured **lag profile**. The quantitative center of gravity is $\mathrm{MOM}_{12,7}$: ~1.2%/mo raw, ~0.54%/mo four-factor α, dominant in large caps and across asset classes, stable across decades. Recent-horizon momentum is a sometimes-profitable, often-spanned sideshow that misled theory and early empirical practice. Store this summary next to Jegadeesh–Titman (1993) and Asness–Moskowitz–Pedersen as the term-structure correction those papers require.

---

## Scholar Cross-Links

Pair with: Jegadeesh–Titman (1993) for the original J/K facts; Moskowitz–Grinblatt industry momentum; Asness–Moskowitz–Pedersen (value and momentum everywhere); Heston–Sadka (seasonality); Korajczyk–Sadka and Lesmond–Schill–Zhou (trading costs)—noting Novy-Marx’s large-cap 12–7 result softens cost critiques. For theory targets, any new model should match Table 1’s quarter-sample pattern and Fig. 1’s hump-shaped lag profile.
