# Do Industries Explain Momentum? — Moskowitz & Grinblatt (1999) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Do Industries Explain Momentum? |
| **Authors** | Tobias J. Moskowitz (Chicago GSB); Mark Grinblatt (UCLA Anderson) |
| **Journal** | *Journal of Finance*, Vol. 54, No. 4, August 1999, pp. 1249–1290 (AFA Papers & Proceedings issue) |
| **Sample** | CRSP; industry portfolios; primary evidence on intermediate-horizon (6–12 month) momentum |
| **Industry scheme** | 20 industries (SIC-based classification detailed in paper) |
| **Original PDF** | `AbnormalReturnsIndustryMomentum_MoskowitzGrinblatt_1999.pdf` |
| **Drive file_id** | `0B-6kBz0I0dMsT1lqWlQ3MDRxSHM` |
| **Extraction** | `pdftotext`; JSTOR scan—readable; some Table II OCR as “Table 11” |

---

## Problem / Motivation

Individual stock momentum (Jegadeesh–Titman 1993) produces large abnormal returns—up to ~12% per dollar long per year on self-financing strategies—with a distinctive horizon pattern: poor at very short horizons (<1 month, reversal), strong at 6–12 months, weak/reversed at long horizons. The open question: **what economic object is persistent?** Firm-specific news? Cross-sectional mean dispersion (Conrad–Kaul)? Lead-lag microstructure? Or **industry components** of returns?

Moskowitz–Grinblatt show that **industry momentum** is strong, robust, and accounts for much of individual-stock momentum profits. Once industry effects are controlled, individual momentum weakens dramatically and often becomes insignificant. Industry strategies remain profitable after size, BM, individual momentum, mean-dispersion, and microstructure controls—and work among large liquid stocks. Notably, industry momentum profits are driven more by the **long** side, whereas individual momentum relies heavily on shorting losers (especially illiquid ones).

For quants: this paper is why many momentum implementations are industry-relative (or why industry momentum is traded as a separate sleeve).

---

## Setup / Data

### Industry definitions

Twenty industries based on SIC groupings (Mining, Food, Apparel, …, Financial, Other)—Table in paper lists SIC ranges (e.g., Machinery 35, Electrical Eq. 36, Utilities 49, Financial 60–69).

### Momentum conventions

- Formation on past $L$-month returns; hold $H$ months; various $(L,H)$ pairs with emphasis on 6-month formation.
- Breakpoints: often **top/bottom 30%** (not always deciles)—more diversified legs.
- Individual stock momentum: VW of top 30% minus bottom 30% by past returns.
- Industry momentum: rank industries by past VW industry return; long stocks in winning industries, short stocks in losing industries (or long/short the industry portfolios themselves).
- Industry-neutral individual momentum: sort stocks on past returns *within* industry.

### Decomposition mindset

Model stock returns as industry component + idiosyncratic component; ask how much of WML profits come from industry vs within-industry sorts.

---

## Model / Methods

### Profit measurement

Monthly profits of overlapping strategies (Jegadeesh–Titman style), reported per dollar long.

### Key strategy set (Table II / “Table 11” in OCR)

1. Raw individual stock momentum (30% breakpoints).
2. Industry momentum.
3. Industry-neutral (within-industry) stock momentum.
4. Random-industry adjustment placebos.
5. Cross strategy: long losers from best industries / short winners from worst industries—should be poor if industry dominates.

### Controls

Size, BE/ME, skipping a month, excluding small/illiquid names, matching on past returns, Conrad–Kaul mean-dispersion tests, lead-lag checks.

### Cross-section section (V)

Interaction of industry momentum with expected-return cross-section; DGTW-style characteristic adjustments.

---

## Results with Numbers

### Individual momentum baseline

With 30% breakpoints and monthly rebalancing, individual momentum ≈ **9.3%/year** (text); Jegadeesh–Titman decile EW strategies historically ~12%/year per dollar long—paper’s 30% VW design is more conservative.

### Industry momentum profits

Industry strategy generates about **6% per year** per dollar long (Table II Panel A discussion)—large, highly significant. Equal-weighted industries: **0.81%/mo ≈ 10.2%/year** ($t=7.71$), ~90 bp/year higher than VW industry implementation.

### Industry vs individual

Industry momentum strategies are **more profitable** than individual stock momentum in several matched comparisons in the paper. After adjusting individual returns for industry, remaining individual momentum profits fall sharply—often statistically insignificant.

### Industry-neutral momentum

Sorting within industry on past returns produces much weaker profits than unconditional individual momentum—showing that cross-industry ranking drove a large share of the classic effect.

### Long vs short

Industry momentum: profitability **predominantly from longs** (winning industries). Individual momentum: largely from **shorts** (losers), especially among less liquid stocks. Implication: industry momentum is more implementable for long-only or long-biased institutions.

### Robustness (Section IV)

- Survives size and BM controls.
- Works in large, liquid stocks.
- Skipping a month: industry momentum remains (Table III style results; average monthly returns still ~0.40%/mo with skip in some specs vs without).
- Microstructure / lead-lag not the full story.
- Random industry assignments do **not** reproduce the profit reduction—real industry membership matters (Table II Panel B style placebo: random adjustment leaves individual profits nearly unaltered, whereas true industry adjustment cuts them).

### Cross strategy

Long worst stocks from best industries and short best stocks from worst industries—designed to go against industry momentum while keeping stock momentum—performs poorly relative to industry-aligned strategies, reinforcing industry’s role.

### Numerical anchors from text

- Individual momentum profit after certain industry adjustments ≈ **0.43%/mo** in one matched comparison—identical in magnitude to a cited benchmark but with interpretation that industry component was crucial elsewhere.
- DGTW-adjusted profits discussed around **0.20–0.43%/mo** range depending on specification.
- 76.94% of profits attributed to a component in one variance decomposition passage (industry-related concentration among winners/losers).

---

## Limitations / Critical Assessment

1. **20-industry granularity**: coarser than GICS 24/68 or FF49; results may change with taxonomy (later papers use FF49).
2. **Sample vintage**: ends in 1990s; subsequent work (Asness–Porter–Stevens; industry momentum post-sample) generally confirms but magnitudes vary.
3. **Proceedings version length**: denser on results than on structural theory—does not fully explain *why* industries momentum (gradual information diffusion across firms in an industry, correlated behavioral biases, slow-moving institutional flows).
4. **OCR table labels**: replicate from original JF tables carefully.
5. **Overlap with factor models**: industry momentum may correlate with factor timing; not the paper’s focus.

---

## Practical Takeaways for a Quant Investor

1. **Prefer industry-relative momentum** for stock selection if you want the classic JT effect without betting the industry book—or trade **industry momentum explicitly** as a separate sleeve.
2. **Long-only friendly**: industry momentum’s long-side concentration is a major practical advantage vs individual momentum’s short-loser dependence.
3. **Large-cap valid**: do not dismiss as microcap microstructure.
4. **Risk**: industry momentum can cluster crashes when entire sectors rebound (e.g., financials in 2009)—combine with Daniel–Moskowitz panic scaling at the industry-portfolio level.
5. **Taxonomy**: test sensitivity to SIC20 vs FF49 vs GICS; lock a taxonomy before research freeze.
6. **Combination**: industry momentum + within-industry residual momentum can both be sized if residual still pays after costs.

---

## Equations / Strategy Definitions

Industry return:

$$
R^{\mathrm{ind}}_{j,t}=\sum_{i\in j} w_{i,t} R_{i,t}.
$$

Industry momentum signal for industry $j$: $\sum_{k=1}^{L} R^{\mathrm{ind}}_{j,t-k}$.

Individual industry-adjusted return: $R_{i,t}-R^{\mathrm{ind}}_{j(i),t}$ (or matching on industry past-return benchmarks).

Profit of overlapping JT portfolio: average of $H$ active cohorts’ long−short returns.

---

## Extended Discussion: Why Industries?

Correlated cash-flow news (sector demand shocks), gradual diffusion of industry information across analysts/firms (Hong–Stein style), and common behavioral narratives about “hot industries” all predict industry-level continuation. Lead-lag from large to small firms within industry is related but the paper argues industry momentum is not *only* microstructure lead-lag.

Conrad–Kaul hypothesis (profits from cross-sectional mean dispersion rather than time-series predictability) is tested; industry momentum’s strength and placebo tests weigh against a pure cross-sectional-mean story.

---

## Link to Moskowitz later work

Moskowitz–Grinblatt 1999 seeds Moskowitz’s later momentum agenda (industry, then Daniel–Moskowitz crashes, AMP everywhere). Industry momentum is one reason momentum survives in large liquid underlyings (country indices, sectors, ETFs).

---

## Numerical Digest

| Quantity | Approx. value |
|----------|---------------|
| Industry momentum profit (VW-style) | ~6%/yr per $ long |
| EW industry momentum | ~0.81%/mo (~10.2%/yr), t≈7.7 |
| Individual mom (30% BP) | ~9.3%/yr |
| Individual mom after industry control | much weaker / often insignif. |
| Skip-month industry mom | still ~0.40%/mo in cited specs |
| Profit source (industry) | mainly longs |
| Profit source (individual) | mainly shorts |

---

## Bottom Line

A large share of the individual stock momentum anomaly is **industry momentum in disguise**. Trading industries directly yields robust, long-side-driven profits that survive standard controls and liquidity filters. Stock-level momentum strategies should be industry-neutralized unless the manager explicitly wants industry bets; industry momentum deserves its own risk budget.

---

## Detailed Strategy Taxonomy for Implementation

### Sleeve A — Pure industry momentum

Rank 20 (or 49) industries on past 6- or 12-month VW returns; long top 30% of industries, short bottom 30%; equal-weight industries or cap-weight; hold 6 months with overlapping cohorts. Expected historical profit ~6–10%/yr depending on EW/VW. Apply vol targeting.

### Sleeve B — Industry-neutral stock momentum

Within each industry, long top 30% stocks and short bottom 30% by 12-2 returns; aggregate with industry caps. Expect smaller alpha than unconstrained JT; lower industry risk.

### Sleeve C — Hybrid

Take unconstrained stock momentum, then hedge industry exposures to zero with industry futures/ETFs—isolates residual momentum.

### Empirical checklist from the paper’s robustness section

- Verify profits among largest NYSE size group.
- Skip most recent month to avoid reversal.
- Confirm random industry labels do not “explain” profits (placebo).
- Check that short-side dependence is weaker than in raw stock momentum.

### Interaction with asset growth and low vol

Winning industries may attract asset growth and exhibit vol regime shifts. Cross-sectional books should orthogonalize industry momentum to ASSETG and ivol via multivariate expected-return models.

### Crash note

Industry momentum is still a momentum strategy: when a beaten-down sector mean-reverts violently (financials 2009), industry WML crashes similarly to stock WML. Use Daniel–Moskowitz instruments on the industry portfolio returns.

### Replication caveats with this PDF

JSTOR scan OCR misreads Table II as Table 11 and Table III as Table 111 in places. Use numerical context (0.81%/mo, 6%/yr, 30% breakpoints) as anchors when parsing tables.

### Historical significance

Before 1999, momentum was widely viewed as a stock-picking anomaly. After Moskowitz–Grinblatt, sophisticated managers treated industries as first-class momentum citizens—paving the way for sector ETF momentum and for AMP-style everywhere momentum.

### Final desk card

Industry momentum ≈ 6–10%/yr; explains much of JT; long-side driven; works in large caps; neutralize or embrace industry risk intentionally; vol-manage like any momentum book.

---

## Expanded Quantitative and Institutional Discussion (Moskowitz–Grinblatt)

### Horizon pattern restated

Individual momentum’s horizon profile—reversal at <1 month, continuation at 3–12 months, reversal at 2–5 years—is one of the most replicated facts in empirical finance. Moskowitz–Grinblatt locate much of the *intermediate* continuation in industry components. They do not claim industries explain long-run reversals (DeBondt–Thaler), which may have different economics (overreaction, changing risk).

### Why 30% breakpoints?

Decile (10%) strategies maximize spread but increase idiosyncrasy and short-leg toxicity. Thirty-percent legs improve diversification and better match implementable sector tilts. Comparing industry vs individual at the same 30% rule is methodologically clean.

### Equal-weight vs value-weight industries

EW industry momentum paying ~10.2%/yr vs lower VW profits implies smaller industries contribute meaningfully. A production compromise: cap-weight industries but floor weights so tiny industries retain some voice, or trade a dual EW/VW blend.

### Within-industry momentum economics

If information diffuses from large to small firms in an industry, within-industry sorts may still pay. The paper finds within-industry profits much weaker than unrestricted—suggesting the *cross-industry* rank is the first-order effect. Later microstructure papers refine intra-industry lead-lag; for practical momentum, industry rank remains primary.

### Characteristic adjustments (DGTW)

Daniel–Grinblatt–Titman–Wermers benchmarks adjust for size, BM, and momentum characteristics. Industry-momentum profits that survive DGTW-style controls are less likely to be passive style exposures. The paper’s discussion of 0.20–0.43%/mo adjusted profits shows sensitivity to exact adjustment—always report both raw and characteristic-adjusted.

### Size and liquidity

A key selling point: industry momentum works among large liquid stocks. That underpins sector ETF strategies and futures-based industry momentum overlays with far lower costs than stock-level loser shorts.

### Short-side dependence contrast

Individual momentum’s reliance on shorting losers creates locate risk, borrow fees, and crash exposure (Daniel–Moskowitz). Industry momentum’s long-side dominance means a long-only “overweight winning industries / underweight losing industries” mandate captures much of the premium without hard shorts—critical for ’40 Act and many institutional constraints.

### Placebo random industries

Assigning stocks to random industry labels and repeating the “industry adjustment” should not destroy individual momentum if true industry membership were irrelevant. The paper finds random adjustment fails to mimic true industry adjustment—strong design evidence.

### Connection to Asness–Moskowitz–Pedersen “Value and Momentum Everywhere”

Industry and stock momentum are part of a broader everywhere momentum complex. MG1999 is an intellectual ancestor: once you accept industries momentum, accepting country and asset-class momentum is a smaller leap.

### Implementation blueprint

1. Choose taxonomy (FF49 recommended today).
2. Signal: 6-1 or 12-2 industry return.
3. Portfolio: long top quartile industries / short bottom; monthly or overlapping 6-month holds.
4. Risk: industry vol targeting; panic-state scaling on the industry WML series.
5. Stock overlay: optional residual momentum within industry with tight tracking error to industry-neutral benchmark.

### Teaching paragraph

Ask: when you buy last year’s winning stocks, are you mostly buying last year’s winning industries? MG say yes. So either neutralize industry and see how much alpha remains, or harvest industry momentum deliberately.

---

## Further Robustness Themes and Desk Card (MG)

Skip-month results show industry continuation is not a one-month microstructure bounce. Controlling for BM and size does not erase profits. Strategies remain profitable when restricted to high-price, large-ME names. Cross-sectional expected-return regressions including industry past returns show significant slopes.

Desk card: ~6%/yr VW industry mom; ~10%/yr EW; explains large share of JT; longs matter most; large-cap OK; neutralize or embrace; vol-manage; taxonomy lock; link to crash control.

Addendum on measurement: profits “per dollar long” means a \\$1 long / \\$1 short book reports the long−short return as profit per dollar long (not per dollar gross). Annualize carefully when comparing to Sharpe ratios on the long−short return series.

---
