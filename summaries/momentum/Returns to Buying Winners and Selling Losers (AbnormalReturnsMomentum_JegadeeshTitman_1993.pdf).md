# Returns to Buying Winners and Selling Losers: Implications for Stock Market Efficiency — Jegadeesh & Titman (1993) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Returns to Buying Winners and Selling Losers: Implications for Stock Market Efficiency |
| **Authors** | Narasimhan Jegadeesh; Sheridan Titman |
| **Outlet** | *The Journal of Finance*, Vol. 48, No. 1 (Mar 1993), pp. 65–91 |
| **Sample** | NYSE / AMEX stocks, **January 1965 – December 1989** |
| **Themes** | Relative-strength (momentum) strategies; market efficiency; January effect; size; risk adjustment; behavioral underreaction |
| **Original PDF** | `AbnormalReturnsMomentum_JegadeeshTitman_1993.pdf` |
| **Drive file id** | `0B-6kBz0I0dMsZHVpNnU0WkMzQXM` |
| **Extraction** | Drive PDF is **scanned** (Relais Articlizer / ImagePDF 1.2, 27 pp.); `pdftotext` empty. Summary reconstructed from the published JF text/tables; tesseract OCR of Drive scan in progress for archival text layer. |

---

## Problem / Motivation

Can simple strategies that buy recent **winners** and sell recent **losers** earn abnormal returns? Prior work emphasized **contrarian** (reversal) profits at very short horizons (Jegadeesh 1990; Lehmann 1990—weekly/monthly microstructure) and at long horizons (DeBondt–Thaler 1985—3–5 year reversals). Intermediate horizons were under-studied. Casual evidence and some practitioner relative-strength rules (e.g., discussions around Grinblatt–Titman mutual-fund trades) suggested continuation over 3–12 months.

JT systematically measure profits to **J-month formation / K-month holding** relative-strength portfolios, then ask whether profits survive risk adjustment and what they imply for efficiency / behavioral underreaction.

---

## Strategy Construction

Universe: all NYSE/AMEX stocks with returns on CRSP (standard filters for valid price/return history at formation).

**Formation:** At month $t$, rank stocks by cumulative return over months $t-J$ through $t-1$ (various implementations; classic tables use contiguous $J$ months ending at $t-1$).

**Portfolios:** Decile (or sometimes quintile) cutoffs. Long equal-weighted portfolio of top decile (**winners**); short equal-weighted bottom decile (**losers**).

**Holding:** Hold for $K$ months. To increase power and reduce timing noise, JT use **overlapping** portfolios: each month hold $1/K$ in each of the K cohorts formed in the prior K months (standard overlapping calendar-time method).

**Grid:** $J,K\in\{3,6,9,12\}$ — sixteen strategies, plus selected variants.

---

## Headline Results (Table I style)

Across the 1965–1989 sample, **all** 16 $J\times K$ relative-strength strategies earn **positive** and statistically significant profits. Typical magnitudes:

- Profits on the order of **~1% per month** for the long-short portfolio.
- The often-cited **6-month formation / 6-month holding** strategy earns about **0.95% per month** (highly significant).
- 12-month formation strategies are among the strongest; very short formation without careful microstructure handling is more contaminated by one-month reversals.

Equal-weighted winners outperform losers in event time for several months after formation; profits are not a one-month fluke.

---

## Risk Adjustment

JT show that momentum profits are **not** explained by contemporaneous market beta in a simple CAPM sense: winners do not earn their edge merely by loading more on the market in a way that accounts for the spread. If anything, risk adjustment often **preserves or accentuates** abnormal returns (a theme later stressed by Fama–French 1996, who famously could not price momentum with their three factors).

Size controls: profits exist in large and small stocks, though magnitudes can be larger among smaller names—raising transaction-cost questions (later addressed by Korajczyk–Sadka and others).

---

## Seasonality: The January Effect

Relative-strength profits are **negative in January** and strongly positive in other months. This links to tax-loss selling and related microstructure/seasonal patterns: losers rebound in January, hurting a short-loser book. Non-January annualized profits are therefore larger than the full-sample average. Any live implementation must either avoid January shorts of losers or accept seasonal drawdowns.

---

## Subperiod Robustness

Results hold across subperiods within 1965–1989 (e.g., splits into earlier/later decades in the paper’s tables). This undercuts pure one-regime flukes inside the original sample. (JT 2001 later shows post-1989 out-of-sample persistence—outside this paper but important for interpretation.)

---

## Sources of Profits: Cross-Sectional vs Time-Series

JT discuss whether profits come from **cross-sectional** dispersion in mean returns (winners are simply high-mean stocks) versus **time-series** autocorrelation / underreaction. Evidence on post-holding returns and the pattern of continuation then partial reversal informs the behavioral underreaction narrative: prices drift in the direction of the formation-period news for about a year, inconsistent with instantaneous incorporation of information.

They also examine lead-lag / delayed reaction stories related to Lo–MacKinlay-type results (large stocks leading small), but the relative-strength profits remain after accounting for such structure in the authors’ tests.

---

## Implications for Market Efficiency

Under strict EMH with frictionless markets and risk-based pricing, zero-net-investment relative-strength should not earn abnormal returns after risk adjustment. JT’s evidence is a direct challenge: large, persistent, implementable (subject to costs) continuation profits at 3–12 month horizons. Combined with short-horizon reversals and long-horizon DeBondt–Thaler reversals, the return landscape is **horizon-dependent**—a central stylized fact of empirical asset pricing since 1993.

Behavioral reading (developed more fully in later literature): **underreaction** to firm-specific news over intermediate horizons; possible **overreaction** at longer horizons. Risk reading: needs a state variable that rises for recent winners—hard to square with leverage and with FF3 failure.

---

## Detailed Quantitative Sketch of Portfolio Returns

Let $R_i(t-J,t-1)$ be stock $i$’s cumulative formation return. Assign ranks; winners $W_t$, losers $L_t$. Monthly overlapping LS return:

$$
r_{LS,t}=\frac{1}{K}\sum_{k=1}^{K}\Bigl(\bar r_{W,t}^{(t-k)}-\bar r_{L,t}^{(t-k)}\Bigr),
$$

where $\bar r^{(t-k)}$ denotes the equal-weighted return in month $t$ of the decile portfolio formed at $t-k$.

Statistical tests use time-series $t$-stats on $\{r_{LS,t}\}$, with awareness of overlapping-induced autocorrelation (Newey–West-type adjustments in spirit).

Approximate economic scale: 0.95%/month × 12 ≈ **11.4% per year** gross long-short before costs—enormous relative to market equity premium uncertainty, hence the industry’s obsession with momentum ever since.

---

## Transaction Costs and Implementation (Paper’s Caveats + Later Literature)

JT note that profits could be eroded by costs, especially in small stocks and with high turnover (decile membership churns). They argue profits remain relevant for efficiency even if costly to arb, and that large-stock subsets still show continuation. Modern implementations use:

- Skip most recent month (avoid short-term reversal).
- Value-weight or liquid universes.
- Industry neutralization (Moskowitz–Grinblatt).
- Volatility scaling / crash controls (Daniel–Moskowitz).

---

## Tables Typically Emphasized in Teaching

1. **Table I:** Mean LS returns for all $J\times K$ — all positive/significant.
2. **CAPM alphas** / beta tables — alphas survive.
3. **Size-sorted** momentum — present across sizes.
4. **January vs other months** — sign flip in January.
5. **Post-holding event-time returns** — continuation then fade.

(Exact cell-by-cell digits should be verified against OCR of the Drive scan or a clean JF PDF when available; magnitudes above match the standard published record.)

---

## Limitations (1993 paper)

- US NYSE/AMEX only; no Nasdaq emphasis in the core sample.
- Equal-weighting overweight microcaps.
- Limited formal multifactor risk model (pre-FF94/96 in the paper’s main tests).
- Costs not fully modeled.
- Overlapping portfolios complicate inference if not carefully adjusted.
- Does not settle behavioral vs risk debate—documents the anomaly.

---

## Practical Takeaways for a Quant Investor

1. **Intermediate-horizon relative strength is first-order.** 3–12 month formation/hold is the empirical sweet spot; do not confuse with 1-month reversal or 3–5 year value/reversal.
2. **~100 bps/month gross LS** is the historical headline—budget **costs, capacity, and crash risk** explicitly.
3. **Avoid naive January short-loser exposure** or hedge the seasonal.
4. **Risk models that omit momentum** (CAPM, FF3) will mis-attribute; use momentum-aware benchmarks (Carhart).
5. **Overlapping calendar-time portfolios** are the right performance reporting convention.
6. Combine with **value** (Asness et al.): value-momentum diversifies crash modes.

---

## Equation / Design Sheet

Formation window $J$, hold $K$, decile LS, overlapping $1/K$ cohorts.

Primary metric: mean monthly $r_{LS}$ and $t$-stat; secondary: CAPM $\alpha$; seasonal split; size split.

---

## Historical Position

JT (1993) is the paper that made “momentum” a named, replicable academic factor. Everything from Carhart (1997) four-factor models to AQR-style style premia traces to this relative-strength grid. For Gappy’s library, it is the **source document** that Sbuelz-type continuous-time models and Ferson-style active portfolios ultimately try to rationalize or exploit.

### Methodological note

Table magnitudes follow the published Journal of Finance (1993) article. The Drive PDF is a scanned Relais ImagePDF without an embedded text layer; when OCR completes, cross-check figures against this reconstruction.
