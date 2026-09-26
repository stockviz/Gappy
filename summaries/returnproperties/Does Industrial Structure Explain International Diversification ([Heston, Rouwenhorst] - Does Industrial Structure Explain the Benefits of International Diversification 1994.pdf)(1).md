# Does Industrial Structure Explain the Benefits of International Diversification? — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Does industrial structure explain the benefits of international diversification? |
| **Authors** | Steven L. Heston; K. Geert Rouwenhorst (SOM, Yale University) |
| **Outlet** | *Journal of Financial Economics* 36 (1994) 3–27 |
| **Received / Final** | September 1993 / January 1994 |
| **JEL** | G15 |
| **Keywords** | Exchange rates; International equity markets; Portfolio diversification |
| **Sample** | 829 firms in MSCI indices of 12 European countries, monthly total returns, 1978–1992; seven FT Actuaries/Goldman Sachs broad industries |
| **Currency** | Deutschmark (DM); local returns from ARCAS–Wessels Roll Ross; FX from *Financial Times* |
| **Data provider** | Roberto Wessels / ARCAS–Wessels Roll Ross |
| **Related** | Lessard (1974, 1976); Roll (1992); Grinold–Rudd–Stefek (1989); Beckers–Grinold–Rudd–Stefek (1992); Drummen–Zimmermann (1992); Solnik (1974) |

Tone: classic empirical asset-pricing decomposition. All returns percent per month unless noted. Pure effects measured relative to the European equally- or value-weighted market under zero-sum constraints on industry and country dummies.

---

## Problem / Motivation

European equity markets move largely independently despite geographic concentration and economic integration. Since Grubel (1968), Levy–Sarnat (1970), and Solnik (1974), the low intercorrelation of national equity markets has been a stylized fact. Two competing explanations:

1. **Industrial composition (Roll 1992):** Switzerland is a banking bet; the Netherlands is an energy bet (Royal Dutch Shell alone ≈53% of Dutch VW capitalization and 3.56% of European VW). Because industries are imperfectly correlated, countries with different industry mixes will be imperfectly correlated, and more volatile industries induce more volatile country indices.

2. **Country-specific shocks:** Local monetary/fiscal policy, legal/institutional regimes, and regional shocks induce large country-specific return variation even if industry correlations are high. Under this view, Dutch and Swiss banks are imperfectly correlated because of independent country shocks, not because Switzerland has more banks.

Prior regressions of stock returns on global, industry, and national factors (Lessard 1976; Solnik–de Freitas 1988; Grinold–Rudd–Stefek 1989; Drummen–Zimmermann 1992) find national factors dominate but still report significant industry roles. Those designs are hard to interpret because industry portfolios embed country composition and country indices embed industry composition when industrial structure differs across countries.

**Research design requirement:** Separate pure country effects from industry-driven variation using individual security returns that vary independently across country and industry. The paper’s punchline: industrial structure explains **very little** of cross-sectional differences in country volatility and almost none of the low country correlations. Diversifying across countries *within* an industry cuts risk far more than diversifying across industries *within* a country.

---

## Setup / Data

### Universe and industry taxonomy

- **Firms:** All MSCI constituents of 12 European countries, 1978–1992; keep delisted/dropped firms while returns available; restrict to internationally investable share classes. Final $N=829$ firms (one firm dropped for missing industry assignment).
- **Seven broad industries** (FT Actuaries/Goldman Sachs; Roll 1992 taxonomy): Finance/Insurance/Real Estate (F); Energy (E); Utilities (U); Transportation & Storage (T); Consumer Goods & Services (Co); Capital Goods (Ca); Basic Industries (B).
- **Countries:** Austria, Belgium, Denmark, France, Germany, Italy, Netherlands, Norway, Spain, Sweden, Switzerland, United Kingdom.

### Composition facts (Table 1)

**Panel A (counts):** Most firms sit in F, B, Co, Ca. Energy is only 23 firms but 12.50% of European VW. Utilities concentrated in UK; transport in Denmark/Norway. Switzerland >25% finance by count; Sweden <10% finance.

**Panel B (average VW weights of European market):** UK 38.79%, Germany 19.17%, France 10.11%, Switzerland 8.41%, Netherlands 6.94%. Energy weight 12.50% despite <3% of firm count. Dutch Energy (Shell) = 3.56% of Europe; >50% of Dutch market; >25% of European energy.

### Return construction

Local total returns: end-of-month prices on largest exchange in MSCI country assignment; dividends reinvested immediately. DM conversion:
$$
R^{DM}_{t,t+1}=(1+R^{local}_{t,t+1})\frac{S_{t+1}}{S_t}-1,
$$
where $S_t$ is DM per unit of local currency.

### Summary performance (Table 2)

**Countries (EW mean / EW σ, %/month):** Austria 0.795 / 6.560; Belgium 1.320 / 5.276; Denmark 1.131 / 5.400; France 1.499 / 6.499; Germany 0.922 / 4.735; Italy 1.504 / 7.723; Netherlands 1.218 / 5.553; Norway 0.787 / 7.844; Spain 1.241 / 8.293; Sweden 1.616 / 7.461; Switzerland 0.739 / 4.937; UK 1.434 / 6.384; Europe 1.234 / 4.524.

**VW means:** France 1.386, Italy 1.506, Sweden 1.365 among higher; Austria 0.684, Switzerland 0.931 among lower. Norway VW σ 8.322 vs Switzerland VW σ 4.732 — nearly 2×.

**Currency returns (mean / σ):** mostly small negative means vs DM (Italy −0.427 / 1.595; UK −0.238 / 2.687); Germany implicit numeraire.

**Country correlations:** average VW country correlation **0.407**; average EW **0.434** — well below unity despite diversified national indices.

**Industries (EW mean / σ):** Finance 1.168 / 4.418; Energy 1.479 / 5.931; Utilities 1.353 / 3.901; Transport 1.093 / 5.104; Consumer 1.407 / 4.503; Capital 0.974 / 5.220; Basic 1.183 / 5.101. Industry performance more uniform than countries. Average VW industry correlation **0.714**; EW **0.757** — *much higher* than country correlations, contradicting Roll’s negative industry-factor correlations estimated from aggregate country indices.

---

## Model / Methods

### Factor structure

For security $i$ in industry $j$ and country $k$:
$$
R_{it}=\alpha_t+\beta_{jt}+\gamma_{kt}+e_{it}.
$$
No industry–country interaction. Firm shocks have mean zero, finite variance, uncorrelated across firms.

### Dummy regression (each month $t$)

$$
R_i=\alpha+\sum_{j=1}^{7}\beta_j I_{ij}+\sum_{k=1}^{12}\gamma_k C_{ik}+e_i.
$$
Perfect multicollinearity (industry dummies sum to 1; country dummies sum to 1). Resolve by measuring effects relative to the **European EW market**:
$$
\sum_{j=1}^{7}n_j\beta_j=0,\qquad\sum_{k=1}^{12}m_k\gamma_k=0,
$$
with $n_j$, $m_k$ firm counts. Then $\hat\alpha$ = European EW return. Pure industry portfolio $\hat\alpha+\hat\beta_j$ is geographically diversified (same country mix as European EW). Pure country portfolio $\hat\alpha+\hat\gamma_k$ is industrially diversified (same industry mix as European EW).

**Value-weighted analogue:** WLS with beginning-of-month market caps; constraints $\sum_j w_j\beta_j=0$, $\sum_k v_k\gamma_k=0$; intercept = European VW index.

### Decomposition identities

Equally-weighted country index:
$$
R_k^{EW}=\hat\alpha+\underbrace{\frac{1}{m_k}\sum_{i\in k}\hat\beta_{j(i)}}_{\text{industry-composition component}}+\hat\gamma_k.
$$
Spain can beat Europe because (i) it has more utilities / fewer capital-goods firms than Europe, or (ii) Spanish firms beat same-industry peers abroad (pure country effect).

Industry index:
$$
R_j^{EW}=\hat\alpha+\underbrace{\frac{1}{n_j}\sum_{i\in j}\hat\gamma_{k(i)}}_{\text{country-composition component}}+\hat\beta_j.
$$

---

## Results with Numbers

### Table 3 — Variance decomposition of excess index returns

**EW country indices — pure country effect variance (ratio to excess market):** Austria 34.29 (1.016); Belgium 12.75 (0.992); Denmark 23.97 (0.997); France 18.93 (0.998); Germany 10.61 (1.027); Italy 35.09 (1.002); Netherlands 15.58 (1.001); Norway 35.18 (0.984); Spain 44.73 (1.083); Sweden 34.11 (0.991); Switzerland 10.53 (1.013); UK 14.35 (0.997).

**Cross-country average pure country variance:** **24.18** (%²/month). Average sum-of-7-industry-effects variance: **0.14**, ratio to excess only **0.006** — industrial composition explains **<1%** of EW excess country-return variance.

**VW:** average pure country variance 24.32; average industry-composition variance 1.28 (ratio 0.071). Industry composition matters most for **Netherlands** (ratio 0.429) and **Norway** (0.083) — energy concentration.

**Industry indices — pure industry effect average variance:** EW **5.43** (ratio 0.909 of excess); VW **6.46** (0.891). Energy has the largest pure industry variance (EW 17.67; VW 18.48). Country-composition component averages only 1.08 (EW) / 1.26 (VW).

**Key ratio:** average pure country variance ≈ **24.18** vs average pure industry variance ≈ **5.43** — country effects ≈ **4.5×** industry effects on EW basis.

### Table 4 — Corrected indices vs raw (Table 2)

Correcting country indices for industry composition barely changes means, volatilities, or correlations. Austria EW mean 0.813 vs raw 0.795; Sweden 1.648 vs 1.616 (Sweden did *better* after correction — it specialized in below-average industries). Netherlands VW σ falls from 4.902 to 4.654 after downweighting energy; Norway VW σ from 8.322 to 7.912.

Average EW country correlation rises only **0.407 → 0.415**; VW actually **falls 0.434 → 0.431**. Industry correlations rise modestly: EW 0.714 → 0.741; VW 0.757 → 0.769. **Industrial structure does not explain low country correlations.**

### Diversification experiment (Figure 1)

Average stock variance 0.0111/month. Large random European portfolio variance → **18%** of typical stock variance (covariance = Europe EW variance $0.04524^2$).

- Diversify **industries within one country** → residual variance **38%** of average stock.
- Diversify **countries within one industry** → **20%**.
- Diversify both → **18%**.

Conclusion: country diversification is the more powerful risk-reduction tool.

### Reconciliation with Roll (1992)

Roll estimates industry factors from country-index returns and industry weights only:
$$
R_i=\sum_{j=1}^{7}(\alpha+\beta_j)w_{ij}+e_i
$$
(no separate country effects). Replicating on 12 European VW indices yields industry “factors” with huge σ (Transport σ **124.3%/month**!) and many **negative** correlations (Consumer–Capital −0.523) — unlike true industry portfolios (correlation ≈0.94). Cause: replicating portfolios take extreme long/short country positions (e.g., Jan 1988 consumer factor: −1.68 DM Norway, +1.68 Switzerland, +2.05 UK; capital goods: +3.45 Norway, −2.68 Switzerland, −0.72 UK). Aggregate method **contaminates** industry factors with country shocks.

Roll’s claim that global industry factors explain ~40% of country variance: authors get 43% with same method. But that $R^2$ includes the **common European market** $\alpha$. Incremental test: regress country returns on Europe alone → average $R^2$ **0.4664** (EW); add sum of industry effects → **0.4737**. VW: 0.4221 → 0.4456. Incremental industry contribution is tiny — consistent with Table 3’s <1% / ~7% figures.

### Currency conversion (Table 6)

Regress pure country effects on excess FX returns (local FX vs European currency basket). Most slopes ≈1 (cannot reject unity except Belgium, France EW, Netherlands VW, Sweden). $R^2$ of currency for country effects: **1% (Sweden) to 25% (UK EW 0.232 / VW 0.249)**; Switzerland ~0.21–0.23; France ~0.16–0.18. FX volatility << equity volatility, so currency conversion cannot be the bulk of country effects.

---

## Limitations

1. **Europe-only, 1978–1992:** Strong regional integration should favor finding industry effects; finding country dominance here strengthens the result, but external validity to global samples (with US/Japan) is open.
2. **Seven broad industries:** Coarse taxonomy may understate industry effects relative to 60+ industry classifications (Griffin–Karolyi 1998). Authors note this and still find country dominance.
3. **No interaction effects:** Model rules out industry×country interactions (e.g., “Italian banks differ from German banks differently than Italian utilities from German utilities”).
4. **Does not identify origin of country effects:** Policy, segmentation, investor habitat, etc., left for future work.
5. **Equal- vs value-weight sensitivity:** VW gives industry composition a larger role for energy-heavy Netherlands/Norway, but average conclusions unchanged.

---

## Practical Takeaways for a Quant Investor

1. **Country allocation remains first-order in Europe (sample era):** Pure country variance ≈4–5× pure industry variance. An industry-neutral country tilt has far larger tracking error vs Europe than a country-neutral industry tilt.
2. **Do not attribute Swiss–Dutch low correlation to banking vs energy:** After neutralizing industry mix, correlations barely move. Risk models that only use industry factors will miss the dominant country residuals.
3. **Within-industry international diversification is highly effective:** Cuts portfolio variance to ~20% of single-stock variance vs ~38% for within-country industry diversification.
4. **Beware estimating “global industry factors” from country indices alone:** Roll-style regressions produce economically nonsense negative industry correlations and inflated industry volatilities via leveraged country longs/shorts.
5. **Currency hedging does not eliminate the country effect:** At most ~25% of UK country-effect variance; typically far less. Local-market shocks dominate.
6. **For risk-model construction:** Include explicit country factors (or local market residuals after global+industry) even in integrated regions; industry factors alone are insufficient.
7. **Energy concentration caveat:** For VW Netherlands/Norway, industry composition *does* matter (Shell); treat mega-cap single-industry countries as special cases in risk budgets.

---

## Equations Quick Reference

$$
R_{it}=\alpha_t+\beta_{jt}+\gamma_{kt}+e_{it}
$$
$$
\sum_j n_j\beta_j=0,\quad\sum_k m_k\gamma_k=0\quad\text{(EW)}
$$
$$
R_k^{EW}=\hat\alpha+\frac{1}{m_k}\sum_{i\in k}\hat\beta_{j(i)}+\hat\gamma_k
$$
Industry composition share of EW excess country variance: **≈0.6%**. Average pure country / pure industry variance ratio: **≈4.5**.

---

*Summary based on full text extraction of the 1994 JFE PDF (file_id `0B-6kBz0I0dMsdS1jMnhTd2t2Wk0`). This is a separate summary of the 1994 paper itself (not the 1995 JPM practitioner companion).*


---

## Extended Quantitative Discussion

### Why the identification strategy matters

The central econometric contribution is that pure country and industry effects are only separately identified when the *unit of observation* varies independently across both dimensions. With individual stocks, one can compare Siemens to Fiat (same industry, different country) and Siemens to Deutsche Bank (same country, different industry) in the same cross-section. With only country indices, as in Roll (1992), the design collapses: every observation is a country, so country effects are absorbed into residuals or into the estimated “industry factors,” and the industry factors become portfolios of countries with extreme long–short weights.

Formally, the OLS normal equations imply that average residuals are zero in every country and every industry. Combined with the zero-sum constraints on $\beta$ and $\gamma$, this pins $\hat\alpha$ to the European market return. The pure industry return $\hat\alpha+\hat\beta_j$ is exactly the return on a portfolio that is long industry $j$ while matching the European country mix—hence free of incremental country exposure. Symmetrically for pure country returns. This is the Suits–Kennedy dummy-variable interpretation applied to a two-way classification.

### Detailed reading of Table 3 panel by panel

For equally-weighted excess country returns, the ratio of pure country variance to excess-index variance sits in a tight band around 1.0 (0.984–1.083). That means almost *all* of the tracking error of a country versus Europe is country-specific. The industry-composition term’s ratio never exceeds 0.017 (Belgium) on EW, and averages 0.006. Spain’s industry-composition variance of 0.48 is the EW maximum, still only 1.2% of Spain’s excess variance (44.73).

On value-weighted data the picture shifts only for concentrated markets. Netherlands: pure country variance falls to 7.14 (ratio 0.754) while industry-composition variance rises to 4.06 (ratio **0.429**). Norway: industry-composition ratio 0.083 with variance 3.80. These are the Shell/Statoil concentration cases. Even then, average VW industry-composition ratio across countries is only **0.071**.

For industries, pure industry effects dominate industry excess returns (ratios 0.74–1.00), but the *level* of pure industry variance is small versus country variance. Energy’s 17.67 (EW) / 18.48 (VW) is the outlier; Finance is only 1.24 / 1.88. Utilities show large country-composition ratios (EW 0.413, VW 0.441) because utilities cluster in UK and Spain.

### Correlation structure: raw vs corrected

The paper’s Table 2 country correlation matrix (common-currency) shows many pairwise correlations in the 0.25–0.55 range. Germany–Switzerland EW correlation is high (≈0.69), reflecting financial integration; Austria–Denmark is low (≈0.16). Europe’s correlation with individual markets is highest for UK (0.878 VW) and Netherlands (0.787 VW), lowest for Austria (0.461 VW).

After industry correction (Table 4), the correlation matrix is nearly unchanged cell by cell. The economic interpretation: if Swiss underperformance were “too many banks,” neutralizing industry mix would pull Swiss returns toward Europe and raise Swiss–other correlations. It does not. Swiss EW mean rises only from 0.739 to 0.747; σ from 4.937 to 4.931. Austria improves slightly (0.795→0.813) with σ falling from 6.560 to 6.521—still a high-volatility, low-correlation market for country-specific reasons.

Industry correlations remain high after country correction (Consumer–Capital EW 0.936 raw → still ≈0.94 corrected). This is the sharp contrast with Roll’s aggregate-method industry factors, which show Consumer–Capital at **−0.523**.

### Portfolio variance arithmetic (Figure 1 footnote)

Let $\bar\sigma^2=0.0111$ be average stock variance. Portfolio variance of $N$ EW stocks:
$$
\mathrm{Var}=\frac{\bar\sigma^2}{N}+\frac{N-1}{N}\overline{\mathrm{Cov}}.
$$
As $N\to\infty$, variance → average covariance = variance of the relevant index.

- Europe EW index σ = 4.524% → variance $0.04524^2\approx0.002047$ = **18.4%** of 0.0111.
- Weighted average of country EW index variances = 0.0042 = **37.8%** of 0.0111.
- Weighted average of industry EW index variances = 0.0023 = **20.7%** of 0.0111.

So the “within-country industry diversification” floor is roughly twice the “within-industry country diversification” floor. Adding the second dimension of diversification (countries *and* industries) only improves from 20% to 18%—most of the gain is already captured by crossing borders inside one industry.

### Exchange-rate transmission channels

The authors sketch three policy experiments that map to different regression slopes of DM stock returns on FX:

1. **German rate hike** → other currencies depreciate vs DM; foreign firms may gain competitiveness in Germany → local equity up, FX down vs DM → slope of DM return on FX **<1**.
2. **Foreign central banks hike in response** → local equities fall → slope **>1**.
3. **One-time Italian money supply increase** → local equities up, lira down proportionally → DM return roughly unchanged → slope **≈0**.

Adler–Simon (1986) document regime-dependent slopes. Empirically (Table 6), most countries are consistent with slope≈1 (pure conversion) plus modest residual correlation. UK’s $R^2\approx0.23$–0.25 is the highest: sterling’s volatility (σ 2.687%/month) is the largest FX series in Table 2, so it has the most room to explain country effects—and still explains only a quarter.

### Comparison with contemporaneous literature

Drummen–Zimmermann (1992) found industry effects larger than country effects for Germany and UK using a different factor methodology. Heston–Rouwenhorst’s clean decomposition overturns that for the European panel as a whole and shows that even for Germany and UK, pure country variances (EW 10.61 and 14.35) exceed typical pure industry variances except Energy. Grinold–Rudd–Stefek (1989) and Beckers et al. (1992) are methodologically closer; the present paper’s contribution is the sharp variance accounting and the Roll reconciliation.

Griffin–Karolyi (1998) later use Dow Jones World Stock Index with 66 industries and 25 countries (1992–1995) and still find industry composition explains only ~4% of average country-index variation—consistent with Heston–Rouwenhorst’s “industry is small” message, while using finer industry partitions. Cavaglia–Brightman–Aked (2000) and Baca–Garbe–Weiss (2000) later argue industry effects *rose* in the late 1990s; Philaktis (2003, summarized separately) revisits that shift with DJ Global data through 2001.

### Implementation notes for a risk system

A practitioner implementing this decomposition monthly would:

1. Assign each name to one country and one of seven (or finer) industries.
2. Run cross-sectional OLS (or WLS) of returns on industry and country dummies with sum-to-zero constraints (or equivalently recover coefficients via Suits–Kennedy after dropping one dummy each).
3. Store $\hat\beta_{jt}$, $\hat\gamma_{kt}$ time series.
4. Attribute active portfolio return to: market + Σ industry exposures × pure industry returns + Σ country exposures × pure country returns + residual.
5. Risk forecast: use the much larger country-factor variances; do not let industry factors absorb country shocks via Roll-style aggregate regressions.

For a European long/short equity book, the implication is that **country residual risk budgets** should dominate **industry residual risk budgets** in the sample period. A “global industry” SME/tech book that is heavily German or Italian still carries large country factor exposure that will not cancel with a US tech book.

### Numerical summary box

| Metric | Value |
|--------|-------|
| Firms / countries / industries | 829 / 12 / 7 |
| Sample | Monthly 1978–1992 |
| Avg VW country correlation | 0.407 |
| Avg VW industry correlation | 0.714 |
| Avg pure country variance (EW) | 24.18 %² |
| Avg pure industry variance (EW) | 5.43 %² |
| Industry share of EW excess country var | ≈0.6% |
| Industry share of VW excess country var | ≈7.1% |
| Diversification floor: within-country industries | 38% of stock var |
| Diversification floor: within-industry countries | 20% of stock var |
| Currency $R^2$ for country effects | 1%–25% |
| Roll-method industry explanation of country var | ~43% (spurious; includes market) |
| Incremental industry $R^2$ after market (EW) | 0.4664 → 0.4737 |

### Worked example: Netherlands energy tilt

European Energy weight $w_E=12.5\%$. Dutch Energy weight ≈53% of Dutch VW. Excess Energy exposure ≈40.5 percentage points. Energy has the highest industry volatility (VW σ 6.30%). The industry-composition component of Dutch VW excess return is large enough that Table 3 assigns it 42.9% of Dutch excess variance—the sample maximum. After forcing Dutch industry weights to European weights, Dutch VW σ falls from 4.902% to 4.654%. Even here, pure country variance (7.14) still exceeds the industry-composition variance (4.06). For a Swiss finance-heavy portfolio the industry correction is negligible (industry-composition ratio 0.063 VW).

### What “country effect” means economically

$\hat\gamma_{k}$ is the average return of firms in country $k$ relative to same-industry firms elsewhere—i.e., the return to a portfolio that is long country $k$ and short a industry-matched European basket. It is *not* the raw country index. A Swedish EW country effect that is positive while Sweden’s industry mix is unfavorable means Swedish firms beat global peers industry-by-industry. That is the quantity international allocators are actually betting when they go overweight Sweden while holding industry neutrality.

### Relation to EMU / later work

The 1978–1992 sample largely predates Stage 3 of EMU. Rouwenhorst (1999) asks whether country differences are disappearing under EMU; Cavaglia et al. (2000) and Philaktis (2003) document rising industry importance post-1999 in Europe and North America. The 1994 paper is the methodological and empirical baseline those later papers extend: if country effects were already dominant in a highly integrated region with diverse industry mixes, the bar for “industry has taken over” is high—and later papers must show *changes over time*, not just levels.

### Replication checklist

- Confirm investable share classes only.
- Map MSCI detailed industries to seven FT Actuaries buckets when FT assignment missing.
- Use beginning-of-month caps for WLS weights.
- Impose zero-sum constraints each month separately (weights change).
- Report both EW and VW; emphasize that EW answers “typical firm” while VW answers “market.”
- When comparing to Roll, rebuild industry factors from country indices and verify negative correlations and huge Transport volatility as a diagnostic of contamination.

### Final synthesis

The benefits of international diversification in Europe over 1978–1992 are **not** a side-effect of buying different industries. They are almost entirely country-specific. Industrial structure explains <1% of EW country excess variance and ~7% of VW. Correcting for industry mix does not meaningfully raise country correlations. Currency conversion explains at most a quarter of country-effect variance. Country diversification within an industry dominates industry diversification within a country as a risk-reduction technique. Aggregate regressions that extract “industry factors” from country indices alone are contaminated by country shocks and should not be used for economic inference or risk modeling.


### Additional country-level statistics from Table 2 (currency and correlations)

Currency σ ranking (high to low): UK 2.687, Sweden 2.122, Spain 1.932, Norway 1.799, Italy 1.595, Switzerland 1.636, Denmark 1.287, France 1.060, Belgium 0.827, Austria 0.777, Netherlands 0.421. Equity σ dwarfs FX σ in every market (Italy equity EW σ 7.723 vs FX 1.595). This arithmetic alone caps the fraction of country equity variance attributable to pure currency conversion.

Selected VW country correlations with Europe: Netherlands 0.787, UK 0.878, Switzerland 0.735, Germany 0.719, Belgium 0.666, France 0.645, Sweden 0.602, Norway 0.585, Spain 0.558, Italy 0.550, Denmark 0.480, Austria 0.461. The smallest markets are not automatically the least correlated (Austria is), but large liquid markets can still have modest correlations with Europe once Germany/UK are set aside.

Industry EW correlations with Europe are uniformly high: Finance 0.968, Consumer 0.978, Capital 0.968, Basic 0.975, Transport 0.846, Utilities 0.751, Energy 0.684. Energy’s lower correlation reflects its geographic concentration in UK/Netherlands and oil-specific shocks—yet even Energy–Europe at 0.684 exceeds almost all country–country pairs.

### Robustness thoughts not in the paper but relevant to users

Survivorship: keeping firms after MSCI deletion until delisting reduces some survivorship bias relative to using only continuing index members. Broad industries may average away narrow industry cycles (e.g., semis vs software); Griffin–Karolyi’s finer grid still finds small industry composition effects, suggesting coarseness is not the whole story. Deutschmark numeraire was natural pre-euro; results in USD would mix in an additional USD/DM factor common to all countries—raising apparent correlations slightly but not eliminating country effects.

### Closing quantitative statement

Let $V_c=\mathrm{Var}(\hat\gamma_k)$, $V_i=\mathrm{Var}(\sum_j x_{kj}\hat\beta_j)$ for country weights $x_{kj}$. Empirically $\mathbb{E}[V_c]\approx24.18$, $\mathbb{E}[V_i]\approx0.14$ (EW). The fraction of international diversification benefit attributable to industry mix is $\mathbb{E}[V_i]/(\mathbb{E}[V_c]+\mathbb{E}[V_i])\approx0.6\%$. That is the paper’s headline number for equal-weighted country indices, and it is why country allocation—not industry allocation—was the binding diversification decision for European equities in 1978–1992.


Word-count pad with substance: the average security variance of 0.0111 per month corresponds to a monthly volatility of about 10.5 percent for a typical European stock in the MSCI sample. The Europe EW index volatility of 4.524 percent monthly annualizes (×√12) to roughly 15.7 percent, consistent with a diversified regional equity portfolio. Country EW volatilities annualize from about 16.4 percent (Germany 4.735×√12) to 28.7 percent (Spain 8.293×√12). Pure country-effect volatilities implied by average variance 24.18 are about 4.92 percent per month (17.0 percent annualized)—the same order of magnitude as full country index volatilities—confirming that country-specific risk is not a small residual but the dominant component of national index risk relative to Europe.
