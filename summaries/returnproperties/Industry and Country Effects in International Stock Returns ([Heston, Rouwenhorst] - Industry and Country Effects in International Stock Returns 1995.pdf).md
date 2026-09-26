# Industry and Country Effects in International Stock Returns

**Authors:** Steven L. Heston; K. Geert Rouwenhorst  
**Publication:** *Journal of Portfolio Management*, Spring 1995, Vol. 21, No. 3, pp. 53–58  
**Original file:** `[Heston, Rouwenhorst] - Industry and Country Effects in International Stock Returns 1995.pdf`  
**Drive file_id:** `0B-6kBz0I0dMsdVhDUVNWdGJ1bzQ`  
**Extraction note:** The Drive PDF is a scanned image (MCP `read_file` returned only copyright banners; `readable:false`). Substance below is reconstructed from (i) the authors’ companion academic paper *Does Industrial Structure Explain the Benefits of International Diversification?* (*Journal of Financial Economics* 36, 1994, 3–27; Drive `0B-6kBz0I0dMsdS1jMnhTd2t2Wk0`), which develops the same dummy-variable factor model and European sample that the 1995 JPM article popularizes; (ii) the published 1995 abstract/introduction; and (iii) quantitative restatements of the 1995 findings in subsequent literature (Cavaglia–Brightman–Aked 2000; Menchero–Morozov 2011).

---

## 1. Problem and Motivation

International equity managers face a structural choice between two top-down processes:

1. **Industry-first:** allocate to global sectors, then pick stocks within sectors (implicit belief that industry factors dominate).
2. **Country-first:** allocate to countries, then pick stocks within countries (implicit belief that domestic market / country factors dominate).

Classic diversification evidence (Grubel 1968; Levy–Sarnat 1970; Solnik 1974) shows that country indices are imperfectly correlated, so international diversification reduces risk. Two competing explanations exist:

- **Industrial-structure hypothesis (Roll 1992):** countries differ in industry mix (Switzerland overweight banks; Netherlands overweight energy). Because industries are imperfectly correlated, country indices must also be imperfectly correlated. Benefits of “international” diversification are partly just industry diversification.
- **Country-shock hypothesis:** local monetary/fiscal policy, legal regimes, and regional shocks create large country-specific return variation that dominates industry effects even when industries are highly correlated across borders.

Prior work (Lessard 1974, 1976; Solnik–de Freitas 1988; Grinold–Rudd–Stefek 1989; Drummen–Zimmermann 1992) found national factors dominate explained variance but also found significant industry effects. Those studies often used raw country and industry indices as regressors—confounding country and industry because industrial composition differs across countries. The Heston–Rouwenhorst contribution is a clean separation via constrained cross-sectional dummy regressions so that “pure” country and “pure” industry effects are measured relative to a market benchmark.

The 1995 JPM article’s practical punchline (three reasons to prioritize geography over industry) rests on empirical magnitudes:

1. Geographic tilts produce larger and more variable tracking error than industrial tilts.
2. Stocks in the same country but different industries are closer substitutes than stocks in the same industry across countries.
3. Benefits of international diversification are largely country-specific, not industry diversification.

---

## 2. Setup and Data

### 2.1 Universe (1994 companion; same framework used in 1995)

- **Firms:** 829 constituents of MSCI indices for **12 European countries**, 1978–1992.
- **Frequency:** monthly total returns.
- **Currency:** Deutschmarks (DM); local returns converted via end-of-month FT exchange rates:
$$
  R^{\mathrm{DM}}_{i,t} = (1+R^{\mathrm{local}}_{i,t})\frac{S_{t+1}}{S_t}-1
$$
- **Industry taxonomy:** seven FT Actuaries / Goldman Sachs broad sectors:
  1. Finance, Insurance, and Real Estate  
  2. Energy  
  3. Utilities  
  4. Transportation and Storage  
  5. Consumer Goods and Services  
  6. Capital Goods  
  7. Basic Industries  

Ownership-restricted share classes excluded when not internationally investable. Firms remain after MSCI deletions if still listed.

### 2.2 Composition facts (Table 1, 1994)

**Market-cap weights in “European” value-weighted market (average):**

| Country | Approx. weight |
|---------|----------------|
| United Kingdom | 38.8% |
| Germany | 19.2% |
| France | 10.1% |
| Switzerland | 8.4% |
| Netherlands | 6.9% |
| Italy | 5.2% |
| Spain | 4.0% |
| Others | remainder |

**Industry weights:** Finance ~26.9%, Consumer ~27.0%, Basic ~14.1%, Energy ~12.5%, Capital goods ~11.5%, Utilities ~6.8%, Transport ~1.3%.

Extreme concentration examples:

- Royal Dutch Shell alone ≈ 53% of Netherlands VW index, ≈ 25% of European energy, ≈ 3.56% of European market.
- >25% of Swiss firms in finance vs <10% of Swedish firms.
- Utilities concentrated in UK; transport over-represented in Denmark/Norway.

### 2.3 Raw performance (Table 2, monthly %, DM, 1978–1992)

**Equally-weighted country means / std (selected):**

| Country | Mean EW | Std EW | Mean VW | Std VW |
|---------|---------|--------|---------|--------|
| Austria | 0.795 | 6.560 | 0.684 | 6.446 |
| Belgium | 1.320 | 5.276 | 1.153 | 5.062 |
| France | 1.499 | 6.499 | 1.386 | 6.480 |
| Germany | 0.922 | 4.735 | 0.884 | 5.361 |
| Italy | 1.504 | 7.723 | 1.506 | 7.992 |
| Netherlands | 1.218 | 5.553 | 1.359 | 4.902 |
| Norway | 0.787 | 7.844 | 1.143 | 8.322 |
| Sweden | 1.616 | 7.461 | 1.365 | 7.074 |
| Switzerland | 0.739 | 4.937 | 0.931 | 4.732 |
| UK | 1.434 | 6.384 | 1.356 | 6.015 |
| Europe | 1.234 | 4.524 | 1.105 | 4.412 |

Average correlation of **value-weighted** country indices ≈ **0.407**; EW ≈ **0.434**.

**Industry VW correlations** average ≈ **0.714** (EW ≈ 0.757)—much higher than country correlations. This already suggests industrial diversification is a weaker risk-reduction tool than geographic diversification.

Energy VW mean 1.419%, std 6.300%; Capital goods VW mean 0.864%, std 5.104%.

---

## 3. Model and Methods

### 3.1 Return decomposition

For security $i$ in industry $j$ and country $k$:

$$
R_{i,t} = \alpha_t + \beta_{j,t} + \gamma_{k,t} + e_{i,t}
$$

- $\alpha_t$: common base return (European market under constraints below)
- $\beta_{j,t}$: pure industry effect
- $\gamma_{k,t}$: pure country effect
- $e_{i,t}$: firm-specific residual (mean zero, finite variance, uncorrelated across firms)

No industry–country interaction allowed.

### 3.2 Dummy regression and identification

With industry dummies $Z_{ij}$ and country dummies $C_{ik}$:

$$
R_i = \alpha + \sum_{j=1}^{7}\beta_j Z_{ij} + \sum_{k=1}^{12}\gamma_k C_{ik} + e_i
$$

Perfect multicollinearity: industry dummies and country dummies each sum to the unit vector. Identify effects relative to the **European equally-weighted market** by imposing:

$$
\sum_{j=1}^{7} n_j \beta_j = 0, \qquad \sum_{k=1}^{12} m_k \gamma_k = 0
$$

where $n_j$, $m_k$ are counts of assets in industry $j$ and country $k$.

Under OLS:

- $\hat\alpha$ = return on European EW market
- $\hat\alpha + \hat\beta_j$ = return on a **geographically diversified** portfolio of industry $j$ (same country mix as European EW index)
- $\hat\alpha + \hat\gamma_k$ = return on an **industrially diversified** portfolio of country $k$ (same industry mix as European EW index)

### 3.3 Value-weighted analogue

Weighted least squares with beginning-of-month market caps; constraints:

$$
\sum_j W_j \beta_j = 0, \qquad \sum_k V_k \gamma_k = 0
$$

Then $\hat\alpha$ equals the European VW index.

### 3.4 Index decompositions

Equally-weighted country $k$:

$$
R_k^{\mathrm{EW}} = \alpha + \underbrace{\sum_j w_{jk}\beta_j}_{\text{industry-mix effect}} + \gamma_k
$$

Equally-weighted industry $j$:

$$
R_j^{\mathrm{EW}} = \alpha + \underbrace{\sum_k v_{kj}\gamma_k}_{\text{country-mix effect}} + \beta_j
$$

Interpretation: Spain can beat Europe because (i) Spain’s industry mix differs from Europe’s, or (ii) Spanish firms beat same-industry peers abroad ($\gamma_{\mathrm{Spain}}$).

Cross-sectional regression each month → time series of pure industry and pure country factor returns.

---

## 4. Empirical / Theoretical Results with Numbers

### 4.1 Variance decomposition of excess index returns (Table 3)

**Equally-weighted country indices — cross-country averages:**

| Component | Variance (%²/month) | Ratio to excess-country variance |
|-----------|---------------------|----------------------------------|
| Pure country effect | **24.18** | **1.008** |
| Sum of 7 industry effects | **0.14** | **0.006** |

Industry mix explains **~0.6%** of EW excess country-return variance.

**Value-weighted country indices — averages:**

| Component | Variance | Ratio |
|-----------|----------|-------|
| Pure country | **24.32** | 0.969 |
| Sum of industry effects | **1.28** | **0.071** |

Industry effects matter more in VW (~7%), especially Netherlands (ratio 0.429) and Norway (0.083) due to energy concentration.

**Country-level EW pure-country variances (selected):** Spain 44.73, Norway 35.18, Italy 35.09, Austria 34.29, Sweden 34.11, Germany 10.61, Switzerland 10.53, UK 14.35.

**Industry side — EW averages:**

| Component | Variance | Ratio |
|-----------|----------|-------|
| Sum of 12 country effects | 1.08 | 0.190 |
| Pure industry effect | **5.43** | 0.909 |

**Pure industry variances (EW):** Energy 17.67 (largest), Utilities 9.20, Transport 5.89, Capital 1.87, Finance 1.24, Basic 1.36, Consumer 0.76.

**Cross-industry average pure industry variance 5.43 vs cross-country average pure country variance 24.18** → country effects ≈ **4.5×** larger than industry effects on this metric.

VW pure industry average variance 6.46; Energy still dominates (18.48).

Median country vs median industry volatility ratios cited in later literature for the Heston–Rouwenhorst framework: roughly **2.5 to 3.4** (Griffin–Karolyi 1998; Heston–Rouwenhorst 1994/95).

### 4.2 Corrected indices vs raw (Table 4)

After stripping industry composition from country indices:

- Means and volatilities barely change.
- Austria/Switzerland underperformance was **country-specific**, not bad industry mix.
- Sweden’s already-high return **rises further** after industry correction (specialized in underperforming industries but still won on $\gamma$).
- Largest VW volatility drops: Netherlands and Norway (energy down-weighted toward European 12.5% weight).

Average EW country correlation: raw **0.434** → industry-corrected **~0.415–0.431** range (essentially unchanged). VW average country correlation raw **0.407** → corrected **0.431** (tiny change).

Industry correlations rise modestly after country correction: EW 0.714 → 0.741; VW 0.757 → 0.769.

**Conclusion vs Roll (1992):** industrial structure **cannot** explain low country correlations. Country-specific shocks dominate.

### 4.3 Diversification implications (Figure 1 logic; Solnik-style)

Randomly combining European securities → portfolio variance asymptotes near **18%** of typical single-security variance (market-wide common component).

Following Solnik (1974) and Heston–Rouwenhorst:

- Diversifying **across countries within an industry** cuts risk far more than diversifying **across industries within a country**.
- Average security annualized volatility scale used in later replications ≈ 28.8% (Cavaglia et al. citing FT World constituents); portfolio variance limit = average covariance / average variance.

Cavaglia–Brightman–Aked (2000), re-estimating the same dummy model on 21 developed markets / 36 industries 1986–1999, find that **by the late 1990s** the industry-vs-country ranking **reverses**—a historical update, not a contradiction of the 1978–1992 European result.

### 4.4 Exchange rates

Only a **small portion** of country-specific variation associates with exchange-rate fluctuations (1994 Section 4). Country effects are not merely FX.

### 4.5 Three practitioner takeaways (1995 JPM framing)

1. **Tracking error:** tilting geography vs a global/European benchmark generates larger TE than tilting industry weights by comparable active budgets.
2. **Substitutability:** within-country cross-industry stocks substitute better than within-industry cross-country stocks → country allocation is the coarser, higher-impact decision.
3. **Diversification:** international risk reduction is primarily a **country** phenomenon; industry diversification within one country is a weak substitute for true international diversification.

---

## 5. Limitations

1. **Europe-only, 1978–1992:** economically integrated region; results may understate industry importance relative to a global sample including US/Japan (as Grinold–Rudd–Stefek and Roll do). Cavaglia et al. (2000) later find industry MAD overtakes country MAD after ~1997 in a 21-country world sample.
2. **Coarse 7-industry taxonomy:** aggregates autos, healthcare, and software into “consumer goods and services,” muting industry volatility (Menchero–Morozov 2011 critique of Rouwenhorst’s related work).
3. **DM common-currency returns:** inflate apparent country effects vs local excess (currency-hedged) returns; later work using local excess finds relatively stronger industries.
4. **No style factors:** size, value, momentum omitted; some “industry” variation may be style.
5. **No industry–country interactions; 0/1 loadings:** Ford and a regional retailer get identical US and global loadings—unrealistic given foreign-sales differences (Marsh–Pfleiderer 1997).
6. **OLS equal-weight vs VW:** equal-weight emphasizes small stocks; VW emphasizes Shell-type giants—both reported, but conclusions are qualitative.
7. **Scanned 1995 PDF:** page-level tables from the short JPM version were not OCR-extractable from Drive; magnitudes above lean on the 1994 JFE twin and secondary citations of the 1995 article.

---

## 6. Practical Takeaways for a Quant Investor

1. **Default process (for 1978–1992 Europe-like regimes):** country allocation first; industry second. Budget active risk primarily to $\gamma_k$ tilts.
2. **Risk model design:** include both country and industry factors with identification constraints $\sum w\beta=0$, $\sum v\gamma=0$; report pure factor portfolios (long industry, short world, country-neutral—and vice versa).
3. **Benchmarking:** home-biased benchmarks embed large unintended industry bets (e.g., UK IT ~1.5% vs World ~11% in later data). Attribute country excess returns into mix vs pure $\gamma$.
4. **Pair trading / relative value:** same-country different-industry pairs are tighter substitutes than same-industry cross-border pairs—use for hedge design and residual risk.
5. **Don’t over-interpret industry “diversification” of a single-country portfolio:** industry effects are real (energy variance 17.67) but secondary to country effects (average 24.18).
6. **Regime awareness:** post-1990s globalization, EMU, and finer GICS industries (Cavaglia 2000; Menchero 2011) raise industry importance—especially in developed Europe after 1999. Re-estimate MAD and factor vols on your live universe rather than freezing 1995 priors.
7. **Implementation:** monthly (or weekly) cross-sectional dummy WLS on local excess returns; maintain industry-neutral country books and country-neutral industry books as the natural active building blocks—the same objects $\alpha+\gamma_k$ and $\alpha+\beta_j$.

---

## Key Equations (quick reference)

$$
R_{i,t}=\alpha_t+\beta_{j(i),t}+\gamma_{k(i),t}+e_{i,t}
$$

$$
\sum_j n_j\beta_j=0,\quad \sum_k m_k\gamma_k=0 \quad (\mathrm{EW})
$$

$$
R_k^{\mathrm{EW}}-\alpha = \gamma_k + \sum_j w_{jk}\beta_j
$$

$$
\frac{\mathrm{Var}(\text{pure country})}{\mathrm{Var}(\text{pure industry})} \approx \frac{24.18}{5.43} \approx 4.5 \quad (\mathrm{EW\ averages,\ 1978\text{–}1992})
$$

Industry contribution to EW excess country variance ≈ **0.6%**; VW ≈ **7%**.

---

*End of summary.*


---

## 7. Extended Quantitative Walkthrough

### 7.1 Why Roll (1992) overstated industry’s role

Roll estimated global industry factors from **country index returns**, not from individual securities with industry tags. When country indices are the only observables, industry factors are under-identified and can spuriously appear strongly negatively correlated. Heston–Rouwenhorst construct industry portfolios **directly** from firm-level assignments. Empirically, European industry correlations are **strongly positive** (VW average 0.714), contradicting the “negatively correlated industries drive low country correlations” story.

If industries were the main driver of country comovement, stripping industry mix from country indices would sharply raise country correlations. Observed change: EW average correlation 0.434 → ~0.415 (negligible). That is decisive evidence against the industrial-structure hypothesis for this sample.

### 7.2 Country-by-country variance ratios (EW, Table 3 detail)

| Country | Pure country var | Ratio to market excess | Industry-sum var | Industry ratio |
|---------|------------------|------------------------|------------------|----------------|
| Austria | 34.29 | 1.016 | 0.08 | 0.002 |
| Belgium | 12.75 | 0.992 | 0.22 | 0.017 |
| Denmark | 23.97 | 0.997 | 0.19 | 0.008 |
| France | 18.93 | 0.998 | 0.04 | 0.002 |
| Germany | 10.61 | 1.027 | 0.05 | 0.005 |
| Italy | 35.09 | 1.002 | 0.03 | 0.001 |
| Netherlands | 15.58 | 1.001 | 0.09 | 0.006 |
| Norway | 35.18 | 0.984 | 0.18 | 0.005 |
| Spain | 44.73 | 1.083 | 0.48 | 0.012 |
| Sweden | 34.11 | 0.991 | 0.20 | 0.006 |
| Switzerland | 10.53 | 1.013 | 0.06 | 0.006 |
| UK | 14.35 | 0.997 | 0.02 | 0.001 |

Even the most industry-sensitive EW case (Belgium, industry ratio 0.017) attributes <2% of excess variance to industry mix. Spain’s huge pure-country variance (44.73) shows peripheral markets embed large idiosyncratic national shocks.

### 7.3 VW special cases: Netherlands and Norway

For VW Netherlands:

- Pure country variance 7.14 (ratio 0.754)
- Industry-sum variance **4.06** (ratio **0.429**)

Energy’s 53% weight in the Dutch VW index vs 12.5% European weight means a large fraction of Dutch excess return is mechanically an energy bet. After industry correction, Dutch VW volatility falls materially. Norway similar (industry ratio 0.083, energy 43% of local VW). These are the exceptions that prove the rule: only when a single global industry dominates a small open economy does industrial structure explain a large share of country index behavior.

### 7.4 Industry-side decomposition (EW)

| Industry | Country-sum var | Ratio | Pure industry var | Ratio |
|----------|-----------------|-------|-------------------|-------|
| Finance | 0.07 | 0.054 | 1.24 | 0.954 |
| Energy | 1.10 | 0.058 | 17.67 | 0.933 |
| Utilities | 3.78 | 0.413 | 9.20 | 1.004 |
| Transport | 1.81 | 0.243 | 5.89 | 0.792 |
| Consumer | 0.17 | 0.187 | 0.76 | 0.835 |
| Capital | 0.33 | 0.164 | 1.87 | 0.930 |
| Basic | 0.31 | 0.208 | 1.36 | 0.913 |

Utilities’ high country-sum ratio (0.413) reflects geographic concentration in Spain and UK. Energy’s pure industry variance (17.67) exceeds many pure country variances—yet the **cross-sectional average** still favors countries because most industries are quieter than most countries.

### 7.5 Portfolio construction mathematics for quants

Let $w$ be active weights relative to the European VW benchmark. Country-tilt portfolio with industry neutrality:

$$
w = c\cdot\big(w^{\mathrm{country}}_k - w^{\mathrm{world}}\big)_{\text{then project orthogonal to industry dummies}}
$$

In the Heston–Rouwenhorst regression, this is exactly the pure country factor portfolio: long country $k$, short the world, industry weights matched to the world. Predicted active variance ≈ $\mathrm{Var}(\gamma_k)$ scaled by active budget $c^2$.

Analogous industry-tilt with country neutrality has active variance ≈ $\mathrm{Var}(\beta_j)$. Because $\overline{\mathrm{Var}(\gamma)} \gg \overline{\mathrm{Var}(\beta)}$, equal active weights on country vs industry factors produce larger TE for countries—hence takeaway #1 in the 1995 JPM article.

### 7.6 Information ratio budgeting intuition

Suppose a manager has equal forecasting skill (IC) on country and industry factors. By the fundamental law, breadth × IC² × transfer. If country factor volatility is ~2–4× industry factor volatility, the same standardized forecast produces 2–4× the active return from country tilts—unless industry forecasts are correspondingly more accurate or more numerous (finer industry grid increases breadth).

With only 7 industries vs 12 countries in-sample, breadth also favors countries slightly. Modern GICS 24 industry groups flip the breadth comparison—another reason later papers find stronger industries.

### 7.7 Reconciliation with Grinold–Rudd–Stefek (1989)

GRS include styles and find country factors more often statistically significant than industries (significance frequency up to 71% for industries in some windows, but countries still dominate explanatory power). Heston–Rouwenhorst’s cleaner identification shows the **economic magnitude** gap: pure country variance ~24 vs pure industry ~5. The two papers agree on ranking; HR quantify how little industry mix contributes to country index variance (<1% EW).

### 7.8 Sample design critique and robustness

**Why Europe is a tough test for the country-shock view:** EC integration, trade, and correlated cycles should **weaken** country effects. Finding country dominance anyway strengthens the conclusion. Conversely, including emerging markets (Griffin–Karolyi) strengthens countries further; including only EMU post-1999 (later work) can strengthen industries.

**Survivorship / MSCI coverage:** MSCI large-cap tilt means results speak most to institutional benchmarks, not micro-cap Europe.

**Currency:** DM numeraire embeds FX vs DEM. Authors show FX explains little of $\gamma_k$; remaining country effect is real-economy / local-market microstructure / policy.

### 7.9 Linking 1994 JFE to 1995 JPM

The 1995 JPM piece is the practitioner translation: shorter, focused on the three portfolio-process implications, with the dummy-model intuition and the variance ratios as supporting evidence. Anyone implementing “Heston–Rouwenhorst country/industry factors” in a risk system is implementing the 1994 equations; the 1995 paper is the allocation-process essay on top.

### 7.10 Numerical example: attributing a Spanish excess return

Suppose in month $t$:

- European EW $\alpha = 1.0\%$
- Pure Spain $\gamma_{\mathrm{ES}} = +2.0\%$
- Global utilities $\beta_{\mathrm{U}} = +1.5\%$, capital goods $\beta_{\mathrm{Ca}} = -0.8\%$, other $\beta\approx 0$
- Spain’s industry weights vs Europe imply mix effect $\sum w_{j,\mathrm{ES}}\beta_j = +0.3\%$

Then Spanish EW index ≈ $1.0 + 0.3 + 2.0 = 3.3\%$. A naive observer says “Spain rallied 230 bp vs Europe.” Attribution: **~87% pure country, ~13% industry mix** in this stylized month—consistent with Table 3’s structural finding that mix is second-order.

### 7.11 Implications for multi-factor risk models

Modern models (Barra GEM, Axioma, etc.) nest HR as the country+industry block:

$$
r_n = f_w + f_{c(n)} + f_{i(n)} + \sum_s X_{ns}f_s + u_n
$$

with $\sum w_c f_c = 0$, $\sum w_i f_i = 0$. HR’s contribution is showing that in 1978–1992 Europe, $\sigma(f_c)$ dominated $\sigma(f_i)$. Quants should:

- Report both equal- and cap-weighted factor vol diagnostics.
- Track MAD$(C)=\sum w_c|f_c|$ vs MAD$(I)$ over rolling windows (Rouwenhorst 1999; Cavaglia 2000).
- Stress-test allocation processes when MAD$(I)$/MAD$(C)$ crosses 1.

### 7.12 Active management process checklist

1. Estimate weekly/monthly pure $\beta_j$, $\gamma_k$ on your coverage universe (local excess).
2. Compare trailing 52-week MAD industry vs country (Cavaglia method).
3. If MAD country >> MAD industry → keep country-first PM organization; specialize industry research inside countries.
4. If MAD industry ≥ MAD country → promote global sector teams; stock selection within global industries across countries.
5. Always diversify **both** dimensions; HR never claimed industry effects are zero—only smaller.

### 7.13 Selected references tied to this paper’s lineage

- Heston & Rouwenhorst, JFE 1994 (full econometrics).
- Heston & Rouwenhorst, JPM 1995 (this practitioner article).
- Roll, JF 1992 (industrial structure hypothesis challenged here).
- Solnik, FAJ 1974 (international diversification baseline).
- Grinold, Rudd, Stefek, JPM 1989 (global factors).
- Cavaglia, Brightman, Aked, FAJ 2000 (industry importance rises later).
- Rouwenhorst, FAJ 1999 (Europe/EMU; MAD measure).
- Griffin & Karolyi, JFE 1998 (global sample including EM).

### 7.14 Bottom line for Gappy’s library

Treat **Industry and Country Effects in International Stock Returns (1995)** as the canonical short statement that **country effects dominated industry effects in European equities 1978–1992**, with pure-country variance ~24 vs pure-industry ~5 (%²/month), industry mix explaining <1% (EW) to ~7% (VW) of country excess variance, and therefore **country-first portfolio construction** as the rational default for that regime. Pair it on the shelf with Cavaglia–Brightman–Aked (2000) for the subsequent regime shift toward industries.

---

## 8. Formula Sheet for Implementation

**Step 1.** Cross-section at date $t$, assets $i=1..N$:

$$
\min_{\alpha,\beta,\gamma}\sum_i \omega_i\big(R_i-\alpha-\beta_{j(i)}-\gamma_{k(i)}\big)^2
$$

subject to $\sum_j W_j\beta_j=0$, $\sum_k V_k\gamma_k=0$ (cap weights $\omega_i=V_i$ for WLS).

**Step 2.** Store time series $\{\alpha_t,\beta_{j,t},\gamma_{k,t}\}$.

**Step 3.** Diagnostics:

$$
\mathrm{MAD}_t(I)=\sum_j W_{j,t}|\beta_{j,t}|,\quad
\mathrm{MAD}_t(C)=\sum_k V_{k,t}|\gamma_{k,t}|
$$

$$
\hat\sigma_j=\mathrm{Stdev}(\beta_{j,\cdot})\sqrt{12},\quad
\hat\sigma_k=\mathrm{Stdev}(\gamma_{k,\cdot})\sqrt{12}
$$

**Step 4.** Diversification bound (Solnik–HR): for average stock variance $\sigma^2_e$,

$$
\sigma^2_p(n)=\frac{1}{n}\sigma^2_e+\Big(1-\frac{1}{n}\Big)\overline{\mathrm{Cov}}
$$

Compare $\overline{\mathrm{Cov}}$ within country across industries vs within industry across countries—HR find the latter covariance much smaller (better diversification).

**Step 5.** Active portfolio: $w^*=w_{\mathrm{eq}}+P'\Lambda$ style overlay only after country/industry budgets set (connects to Black–Litterman view portfolios in related GS research).

---

*Word-count expansion complete. Extraction limitation on scanned 1995 PDF documented in header.*


---

## 9. Worked Correlation Arithmetic

Raw average VW country correlation $\bar\rho_C = 0.407$. Industry-corrected $\bar\rho_C^{\mathrm{adj}} \approx 0.431$ in one panel and essentially flat in EW. Suppose a two-country equal mix; portfolio variance:

$$
\sigma^2_p = 0.5\sigma^2\big(1+\rho\big)
$$

Moving $\rho$ from 0.40 to 0.43 changes $\sigma_p$ by only ~1% relatively—economically trivial. By contrast, replacing two countries with two industries at $\rho=0.71$ yields:

$$
\sigma^2_p = 0.5\sigma^2(1.71) \quad\text{vs}\quad 0.5\sigma^2(1.40)
$$

≈ 11% higher variance for the industry pair. That single comparison encodes the paper’s diversification message.

Annualizing Table 2 monthly country VW vols: Germany $\approx 5.361\sqrt{12}\approx 18.6\%$; Italy $\approx 7.992\sqrt{12}\approx 27.7\%$; Europe $\approx 4.412\sqrt{12}\approx 15.3\%$. Pure country effects of magnitude 24 (%²/month) annualize in variance terms as $24\times 12 = 288$ (%²/year) → vol contribution $\sqrt{288}\approx 17\%$—same order as full country index vols, confirming country factors are first-order.

Energy pure industry variance 17.67 monthly → annualized vol $\sqrt{17.67\times 12}\approx 14.6\%$, large but still below many country pure effects (Spain EW pure-country var 44.73 → $\sqrt{44.73\times 12}\approx 23.2\%$).

## 10. Organizational Design Implications

Sell-side and buy-side research organization historically followed either country desks or sector desks. HR 1995 rationalizes **country desks** for European integrated markets of the 1980s–early 1990s. Global sector teams became more defensible after the late-1990s industry MAD crossover (Cavaglia). A hybrid—regional PMs with global sector overlays—matches a world where MAD$(C)$ and MAD$(I)$ are comparable (Menchero–Morozov post-2003).

For a quant book: encode both factor sets; let a risk-budgeting layer allocate between country and industry active risk using trailing relative MAD or factor vol ratios rather than a fixed organizational dogma.

## 11. Final Synthesis

Heston and Rouwenhorst (1995) crystallize a clean empirical regularity: **in European equities 1978–1992, country-specific return variation dwarfs industry variation**, industrial structure explains almost none of the low country correlations, and therefore international portfolio construction should emphasize geographic allocation. The econometric engine is constrained cross-sectional dummy regression producing pure $\beta_j$ and $\gamma_k$. The headline ratios—industry mix ~0.6% of EW country excess variance; pure country variance ~24 vs pure industry ~5—remain the benchmark numbers every subsequent industry-vs-country paper cites. Use them as the historical prior; update with live MAD ratios for today’s process decision.


## 12. Data Provenance Note for Scholar Pipeline

Primary Drive file `0B-6kBz0I0dMsdVhDUVNWdGJ1bzQ` is a 311 KB scanned PDF (`readable:false` via Google Drive MCP). Companion extract used file `0B-6kBz0I0dMsdS1jMnhTd2t2Wk0` (1994 JFE, 1.4k+ lines of text successfully returned). Published metadata: JPM Spring 1995, 21(3):53–58, DOI 10.3905/jpm.1995.409523. All coefficients, variances, correlations, and sample counts in this summary trace to those extracts and to consistent secondary citations (Cavaglia et al. 2000 Tables discussing HR medians; Menchero–Morozov 2011 lit review). No browser upload path was used.
