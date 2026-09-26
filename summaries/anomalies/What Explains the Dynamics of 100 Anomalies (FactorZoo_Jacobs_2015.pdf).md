# What Explains the Dynamics of 100 Anomalies? — Jacobs (2015) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | What explains the dynamics of 100 anomalies? |
| **Author** | Heiko Jacobs (University of Mannheim) |
| **Journal** | *Journal of Banking & Finance* **57**, 65–85, 2015 |
| **DOI** | 10.1016/j.jbankfin.2015.03.006 |
| **Keywords** | Anomalies; investor sentiment; limits to arbitrage; short leg; meta-anomalies; market-wide constraints |
| **Original PDF** | `FactorZoo_Jacobs_2015.pdf` |
| **Drive file_id** | `1mRZSfAv-IT7xFxoRVLW1lJtcJujXIL7k` |
| **Extraction** | pdftotext -layout; ~22,002 words clean text |

---

## Problem / Motivation

Behavioral finance explains cross-sectional anomalies with two ingredients (Barberis–Thaler 2003): (i) **psychology** that creates mispricing, and (ii) **limits to arbitrage** that prevent immediate correction. A testable implication is that abnormal returns should be stronger when sentiment is elevated or when arbitrageurs are constrained (Baker–Wurgler 2007; Brav–Heaton–Li; Hanson–Sunderam).

Empirically the evidence is mixed. Stambaugh, Yu, and Yuan (2012, 2014) find that **eleven** anomalies are stronger after high Baker–Wurgler sentiment, especially in the short leg—consistent with Miller (1977) overpricing under short-sale constraints. Other papers find strong time-series links between arbitrage conditions and **short-term reversal** or **law-of-one-price** violations (Nagel 2012; Pontiff 1996), but little consensus for momentum, value, accruals, etc. (Sadka; Frazzini–Pedersen; Akbas; Hanson–Sunderam; Asness; Green et al.).

Jacobs’s contribution is **breadth plus time-series focus**:

1. Replicate **100** anomalies on a **common** stock universe and methodology.
2. Aggregate into **20 meta-anomalies**.
3. Test whether **market-level** sentiment and **market-level** limits-to-arbitrage proxies predict meta-anomaly returns.
4. Ask whether market-level constraints map into **anomaly-level arbitrage activity** (short interest / turnover).

This is deliberately a “big picture” paper in the spirit of Subrahmanyam (2010) and Richardson–Tuna–Wysocki’s call for structure in the anomaly literature.

---

## Setup and Data

### Stock universe and filters

Baseline screens follow Jegadeesh–Titman (2001)-style size/liquidity filters: exclude about **50%** of CRSP common-stock firm-months, but those names are only a few percent of total market cap. Motivation (Fama–French 2008; Brav et al.): anomalies confined to microcaps are economically less interesting and can confound arbitrage-constraint tests.

### Anomaly construction

- Identify, categorize, and replicate **100** anomalies spanning: law-of-one-price violations, momentum, technical analysis, short- and long-term reversal, calendar effects, lead-lag among linked firms, pairs trading, beta, distress, skewness, differences of opinion, industry effects, fundamental analysis, net issuance/financing, investment/growth, innovation, accruals, dividends, earnings surprises.
- Resulting panel: **>65,500 anomaly-months**.
- Average pairwise correlation of FF3-adjusted equally weighted anomaly returns ≈ **0.12** — diverse, not one factor in disguise (cf. Green–Hand–Zhang multidimensionality).
- Aggregate to **20 meta-anomalies** (group means). Also form a **composite**: equal weight of meta-anomalies 2–20 (excluding pure law-of-one-price), and a **pooled** panel with random effects.

### Benchmarking

Primary left-hand side: monthly long-short returns **orthogonalized to Fama–French (1993) three factors**. Robustness: raw long-short, market-only orthogonalization, value-weighted vs equal-weighted.

### Investor sentiment

Primary: **Baker and Wurgler (2006)** orthogonalized sentiment index. Binary high/low relative to sample median; also continuous standardized specifications. Average anomaly long-short spread is roughly **50% larger** after above-median sentiment than after below-median sentiment.

### Limits-to-arbitrage proxies (six)

| Proxy | Economic channel |
|-------|------------------|
| VIX | Risk / funding stress |
| Average idiosyncratic volatility | Holding costs (Pontiff) |
| TED spread | Funding liquidity |
| Moody’s credit spread | Credit / funding |
| Average bid-ask spreads | Transaction costs |
| Pastor–Stambaugh market liquidity (sign-flipped) | Market illiquidity |

Dummies = 1 if prior-month proxy above its full-sample median. Average correlation among continuous proxies ≈ **0.42** (0.21 for dummies). Correlation of each with Baker–Wurgler sentiment is low: average ≈ **0.10** (0.05 for dummies); no pairwise correlation with sentiment exceeds **0.25** (VIX dummy). Sentiment and LTA therefore make **distinct** predictions.

Eyeball clusters of high LTA: Great Depression, 1987 crash, LTCM / late-1990s, 2008–09 crisis.

### Sample for main predictive tests

Often **August 1965 – January 2011** ($N=546$ months), or shorter when a meta-anomaly’s constituents are unavailable.

---

## Model / Methods

### Predictive regressions (baseline)

For each meta-anomaly $a$ and proxy $x$:

$$
r_{a,t}^{\mathrm{FF3}}=\alpha_a+\beta_a\,D_{x,t-1}+\varepsilon_{a,t},
$$

where $D_{x,t-1}=1\{x_{t-1}>\mathrm{median}(x)\}$. Report $\alpha$ (“Baseline” = average return in low-constraint months) and $\beta$ (“High” = incremental return in high-constraint months). *t*-stats: White (1980) heteroskedasticity-consistent.

Analogous regressions replace $D_x$ with continuous $x_{t-1}$, and replace $x$ with Baker–Wurgler sentiment.

### Joint tests

- Composite EW and pooled RE panels.
- Multivariate regressions with sentiment **and** LTA principal components.
- Long-leg vs short-leg splits.
- PCA on the six LTA proxies to extract a common “arbitrage constraint” factor (mirroring BW index construction).

### Anomaly-level arbitrage activity

For each of 96 anomalies (groups 2–20):

1. **Short-interest rank differential:** rank NYSE/AMEX stocks by Compustat short interest on $[0,1]$; compute mean rank in short leg minus mean rank in long leg; take monthly changes.
2. **Turnover activity:** average turnover rank $0.5\times\mathrm{long}+0.5\times\mathrm{short}$; Nasdaq-adjusted; monthly changes.

Regress these activity changes on contemporaneous continuous LTA proxies. Hypothesis: if market-wide constraints bind, anomaly-level arbitrage activity should fall when VIX/TED/spreads rise.

---

## Results (with numbers)

### Unconditional anomaly magnitude

Averaged across time and anomalies, FF3-adjusted monthly abnormal returns ≈ **70–80 bp**. This holds despite stricter size screens than many originals and samples on average **~20 years longer** (earlier starts + more recent data)—partial OOS. Jacobs interprets this as evidence against pure statistical flukes (echoing Green et al.; Harvey et al. 2015; McLean–Pontiff).

Table 1 (in paper) shows sample periods and predictive strength by anomaly; many “enhanced” momentum variants coexist but metal-level diversity remains (corr 0.12).

### Sentiment (core positive result)

- For **>80%** of anomalies, sentiment loads in the predicted direction; statistically significant for ~**40%**.
- Average anomaly: long-short spread ~**50% larger** after high BW sentiment than after low.
- Strongest among **overreaction**-type phenomena; driven by the **short leg**.
- Aggregate anomaly: +1 SD lagged sentiment ⇒ **<3 bp** (insignificant) in the **long** leg vs **≈ −18 bp** (highly significant) in the **short** leg.
- Consistent with Miller (1977) / Stambaugh–Yu–Yuan: overpricing more prevalent than underpricing when shorting is constrained.

### Limits to arbitrage — binary proxies (Tables 3–4)

**Law of one price:** strong positive link to high VIX, idiosyncratic vol, TED, bid-ask, illiquidity.

Illustrative magnitudes:

- Above-median **bid-ask** in $t-1$ ⇒ ≈ **0.75 SD** increase in LoOP violations in $t$ (coefficient 0.365, *t* = 6.79; baseline −0.378).
- Above-median **idiosyncratic volatility** ⇒ ≈ **2/3 SD** increase (0.318, *t* = 4.96).
- VIX high: LoOP high-state coeff **0.279** (*t* = 5.06) vs baseline **−0.295**.

**Short-term reversal, pairs trading, net issuance/financing, innovation:** related to some LTA proxies, but **not stable across all six**.

**Idiosyncratic volatility** is the strongest among the six for the broad set: **75%** of meta-anomalies load positively; **40%** significantly. Composite anomaly ≈ **+20 bp** more pronounced after high IV than after low IV (~1/3 of the low-IV baseline composite return). Composite EW baseline under low VIX ≈ **0.623%/mo** (*t* = 10.67); high-VIX increment only **0.083** (*t* = 0.63)—insignificant.

**Most other meta-anomalies** (momentum, fundamentals, accruals, earnings surprises, etc.): LTA dummies usually **insignificant** or wrong-signed. Example from Table 3: momentum high-VIX coeff **−0.370** (*t* = −0.71) with baseline **1.247** (*t* = 6.15)—momentum is large unconditionally but not larger when VIX is high.

Earnings surprises remain large in low-LTA states (**0.89–1.28%/mo** depending on proxy) without needing high-constraint months.

### Continuous LTA proxies (Table 5)

LoOP, short-term reversal, and pairs trading remain linked. For the rest, continuous specs are **weaker**. Idiosyncratic volatility **loses** significance for many anomalies once used continuously. Starting in 1960 (dropping 1930s extreme LTA) does not change the message.

Composite EW continuous VIX coeff **−0.0058** (*t* = −0.58); continuous IV **2.015** (*t* = 0.11)—economically and statistically flat.

### Robustness battery (Section 2.5)

Winsorization; value-weighted returns (slightly weaker); raw vs FF3 vs market-only orthogonalization; time trends; 25-year subperiods; excluding publication/time effects; including small firms; quarterly returns; alternative LTA proxies; PCA aggregate LTA factor; contemporaneous rather than lagged proxies; changes vs levels—**inferences unchanged**: sentiment strong, LTA dynamics weak for most anomalies.

### Joint sentiment vs LTA (Tables 6–8 family)

When sentiment and LTA proxies (or their PCAs) enter together, **sentiment retains predictive power**; LTA remains weak for the composite. Standardizing both to zero mean / unit variance, sentiment’s economic magnitude dominates.

### Long vs short legs (Table 9)

Most meta-anomaly profitability is from the **short leg**. Averaged across meta-anomalies, illustrative splits on the order of **~24.5 bp** (long) vs **~36.4 bp** (short) in comparable windows (paper’s tabulated long/short decomposition). Sentiment predicts the short leg far more than the long leg—again Miller/Stambaugh logic.

### LTA and anomaly-level activity (Table 11)

Regressions of Δ short-interest rank differentials and Δ turnover ranks on VIX, TED, bid-ask: **virtually all coefficients insignificant**. Market-wide LTA proxies do **not** line up with measurable changes in anomaly-level arbitrage popularity. This helps explain why LTA *dynamics* fail to forecast most anomaly returns: the proxies may not capture the capital that actually trades each anomaly.

---

## Limitations

1. **Meta-anomaly aggregation** can mask heterogeneity inside groups (e.g., “enhanced” momentum variants).
2. **Equal-weighting** within meta-anomalies and composites; VW robustness is weaker but directionally similar.
3. **Baker–Wurgler** is one sentiment construct; alternatives exist (though paper explores several).
4. **Six LTA proxies** may miss anomaly-specific constraints (hard-to-borrow names, stock-level IV).
5. **Short-interest data** mainly NYSE/AMEX; Nasdaq coverage limited historically.
6. **Correlation ≠ mechanism**: predictive regressions do not identify structural causal channels.
7. **Publication selection** of the 100 anomalies: all were interesting enough to publish; unconditional 70–80 bp may overstate a random trader’s opportunity set (HLZ multiplicity).
8. Cannot deep-dive psychology/economics of each anomaly—by design a breadth paper.

---

## Practical Takeaways for a Quant Investor

1. **Sentiment timing of the short book.** High BW sentiment is a tangible overlay: expect wider anomaly spreads, concentrated in names you are **short**. A practical rule: scale short-leg risk up after high sentiment only if locate/borrow and squeeze risk are controlled.
2. **Do not expect VIX/TED overlays to unlock most anomalies.** Except for LoOP, short-term reversal, pairs, and some issuance/innovation effects, market-wide LTA dummies add little. A “buy anomalies when VIX is high” heuristic is **not** supported for momentum, value-like fundamentals, accruals, or PEAD.
3. **Idiosyncratic volatility is the least-bad LTA proxy**—but even IV’s composite effect (~20 bp) is modest vs unconditional 70–80 bp, and continuous IV is fragile.
4. **Persistent short-sale frictions > fluctuating macro constraints.** Jacobs’s interpretation: the **level** of shorting difficulty, not month-to-month VIX moves, sustains mispricing. Risk systems should model hard-to-borrow and short inventry permanently, not only crisis dummies.
5. **Composite diversification works.** With average pairwise corr ~0.12, a diversified anomaly book diversifies. Sentiment still times the aggregate short leg.
6. **Activity monitors.** If your process tracks short interest/turnover in anomaly legs as “crowding” gauges, do not expect them to co-move tightly with VIX/TED; crowding can be anomaly-specific (Hanson–Sunderam).
7. **Research allocation.** Incremental research on **anomaly-level** sentiment/constraints likely beats another market-wide LTA proxy paper—Jacobs’s own suggested agenda.
8. **Reconciliation with Stambaugh et al.** Broader anomaly set confirms sentiment; does **not** confirm a general LTA-dynamics story beyond a few microstructure-heavy strategies.
9. **Portfolio construction.** Keep a core of high-unconditional-Sharpe meta-anomalies; apply sentiment as a short-leg risk budget modulator; treat LoOP/reversal/pairs as the subset where funding-liquidity overlays are economically justified.
10. **Skepticism on crisis alpha narratives.** Many anomalies’ baseline returns in *low* LTA months remain large (e.g., momentum baseline 1.25%/mo). Waiting for crises to harvest anomalies leaves most of the premium on the table—and crises are exactly when shorting is hardest.

---

## Extended Numerical Digest (selected Table 3 composite / exemplars)

| Meta-anomaly | VIX High $\beta$ | VIX Baseline $\alpha$ | IV High $\beta$ | IV Baseline $\alpha$ |
|--------------|-------------------:|------------------------:|------------------:|-----------------------:|
| LoOP | 0.279*** | −0.295*** | 0.318*** | −0.396*** |
| Momentum | −0.370 | 1.247*** | −0.113 | 1.170*** |
| Short-term reversal | 1.017** | −0.089 | 0.997*** | 0.940*** |
| Pairs trading | 0.463** | 0.345*** | 0.249* | 0.963*** |
| Earnings surprises | −0.05 | 1.069*** | 0.276 | 1.037*** |
| Composite EW | 0.083 | 0.623*** | 0.222*** | 0.637*** |

(Significance stars as in paper: * 10%, ** 5%, *** 1%.)

Moody’s / Bid-Ask / Liquidity (Table 4) tell the same story: LoOP and short-term reversal respond; composite EW high-state increments are small (bid-ask **0.163***, liquidity **−0.026**).

---

## Equation Sheet

**FF3 residual anomaly return:**

$$
r_{a,t}=\alpha_a+\beta_a^{\mathrm{MKT}}\mathrm{MKT}_t+\beta_a^{\mathrm{SMB}}\mathrm{SMB}_t+\beta_a^{\mathrm{HML}}\mathrm{HML}_t+e_{a,t},\quad
r_{a,t}^{\mathrm{FF3}}\equiv \hat\alpha_a+\hat e_{a,t}\ \text{(or use full residualized series)}.
$$

(Jacobs orthogonalizes the anomaly series before predictive regression.)

**Binary LTA regression:**

$$
r_{a,t}^{\mathrm{FF3}}=\alpha+\beta\,1\{x_{t-1}>\mathrm{med}(x)\}+\varepsilon_t.
$$

**Sentiment economic effect (aggregate):**

$$
\frac{\partial\,r^{\mathrm{short}}}{\partial\,\mathrm{Sent}}\approx -18\,\mathrm{bp/SD},\qquad
\frac{\partial\,r^{\mathrm{long}}}{\partial\,\mathrm{Sent}}\approx +3\,\mathrm{bp/SD}.
$$

**Meta-anomaly composite:**

$$
r^{\mathrm{comp}}_t=\frac{1}{|\mathcal{A}_t|}\sum_{a\in\mathcal{A}_t}r_{a,t},\quad \mathcal{A}_t=\{\text{meta-anomalies 2--20 available at }t\}.
$$

---

## Synthesis

Jacobs (2015) is the breadth complement to Stambaugh–Yu–Yuan’s depth. Across 100 anomalies and 20 meta-anomalies on a liquid-stock universe, **investor sentiment robustly predicts anomaly returns via the short leg**, while **market-wide limits-to-arbitrage dynamics are weak predictors except for law-of-one-price, short-term reversal, and a few related strategies**. Idiosyncratic volatility is the best of a weak LTA lot. Market-level constraint proxies also fail to track anomaly-level short interest and turnover changes. For practitioners: **time the short book with sentiment; do not overfit crisis overlays; respect permanent short-sale frictions; diversify across low-correlation anomalies.**

---

*Scholar batch_2026-09-23_2 | Paleologo-style notes*

---

## Additional Quant Commentary

### Why average pairwise correlation of 0.12 matters

A correlation of 0.12 among FF3-adjusted anomaly returns implies that a 20-meta-anomaly equal-weight book has strategy-level variance well below that of a typical single anomaly. Roughly, if each meta-anomaly has monthly residual vol $\sigma$ and average corr $\bar\rho=0.12$, portfolio vol scales as

$$
\sigma_p\approx\sigma\sqrt{\bar\rho+\frac{1-\bar\rho}{n}}.
$$

For $n=20$, $\sigma_p\approx\sigma\sqrt{0.12+0.044}=\sigma\sqrt{0.164}\approx0.40\sigma$. Diversification across the zoo is real—**provided** you can short the short legs. Sentiment’s short-leg channel is exactly where that diversification is hardest to harvest in practice (locate, recall risk, buy-ins).

### Interaction with Harvey–Liu–Zhu

Jacobs’s unconditional 70–80 bp should be read through an HLZ lens: many of the 100 anomalies would fail *t* > 3 hurdles, and the composite’s strength partly reflects selection of published winners. Still, the **relative** result—sentiment yes, LTA dynamics no—does not rely on every anomaly being “true.” Even among survivors, the timing patterns should be informative.

### Crisis playbook (what Jacobs implies you should *not* do)

A common hedge-fund narrative is: “Anomalies are strongest when capital is scarce; raise anomaly exposure when VIX spikes.” Tables 3–5 say this is true for **LoOP and short-term reversal**, mixed for pairs/issuance, and **false for momentum and most fundamental anomalies**. Raising momentum risk into a VIX spike is unsupported here (point estimate negative). The correct crisis playbook is strategy-specific, not zoo-wide.

### Research debt

Jacobs leaves open anomaly-level sentiment and constraints. A desk can operationalize that gap: maintain name-level short-interest and borrow-fee panels; regress each live factor’s residual on **its own** crowding metric rather than on TED. That is the natural next measurement layer after this paper.

---

## Meta-Anomaly Map and Strategy Taxonomy

Jacobs’s twenty meta-anomalies (conceptual grouping of the 100):

1. Violations of the law of one price (closed-end funds, dual-listed, parity breaks)
2. Momentum (JT and enhancements)
3. Technical analysis
4. Short-term reversal
5. Long-term reversal
6. Calendar-based
7. Lead-lag / economically linked firms
8. Pairs trading
9. Beta / low-risk
10. Distress risk
11. Skewness / lottery
12. Differences of opinion
13. Industry effects
14. Fundamental analysis
15. Net stock issues and financing
16. Capital investment and growth
17. Innovation / R&D
18. Accruals
19. Dividend anomalies
20. Earnings surprises (PEAD and related)

**Microstructure cluster (LTA-sensitive):** 1, 4, 8 (and partly 15, 17).
**Sentiment / overreaction cluster:** short legs of many of 2, 5, 10, 11, 15, 18.
**Underreaction cluster:** 20, 14, parts of 7 — sentiment still matters via short leg but LTA dynamics weak.

### Table 5 continuous-spec reading guide

Large significant continuous coefficients concentrate in:

- LoOP × IV (44.78***), LoOP × bid-ask (79.73***), LoOP × VIX (0.0249***)
- Short-term reversal × IV (138.7***), × bid-ask (86.72***)
- Pairs × VIX (0.0384***), × liquidity (4.80***)

Composite row near zero across columns—the headline “weak LTA” result.

### Sentiment vs LTA correlation matrix (qualitative)

Sentiment ⊥ LTA (corr ~0–0.25) is crucial: it means the paper’s horse race is statistically meaningful. If sentiment were just a proxy for VIX, the “sentiment works, LTA doesn’t” conclusion would be spurious. The low correlation validates treating them as separate state variables in a timing model:

$$
r_{a,t}=\alpha+\beta_S S_{t-1}+\beta_L L_{t-1}+\varepsilon_t,
$$

with $\beta_S$ robustly positive for short-leg aggregates and $\beta_L\approx 0$ for most $a$.

### Capacity and implementation frictions (practitioner layer)

Even if sentiment predicts short-leg returns, harvesting requires:

- borrow availability precisely when sentiment is high (often when retail overpricing concentrates in hard-to-borrow names);
- willingness to endure squeeze risk;
- compliance constraints on short exposure.

Thus the **paper’s statistical sentiment edge** may be partially offset by **worsening implementation** exactly in high-sentiment months. A sober implementation multiplies Jacobs’s 18 bp short-leg coefficient by a locate-success probability < 1 and by a cost schedule that rises with sentiment.

### Link to funding-liquidity theory

Brunnermeier–Pedersen (2009) style funding liquidity suggests LTA proxies *should* matter. Jacobs’s negative result for most anomalies does not refute that theory for all markets; it says that **as measured**, popular market-wide proxies do not forecast the bulk of the equity anomaly zoo. Possible reconciliations: (i) permanent short-sale constraints dominate transient funding shocks; (ii) proxies are noisy; (iii) anomaly-level capital is sticky (Table 11); (iv) FF3 orthogonalization removes the priced funding component. The paper tests many of these and still finds weak LTA dynamics—so (i) and (iii) are the leading interpretations.

### Supplemental empirical note (1)

Jacobs’s composite anomaly returning roughly 60–70 bp per month in low-LTA states (Table 3 baselines near 0.62–0.72) is the economically central unconditional fact. Relative to that baseline, the typical high-LTA increment for the composite is single-digit to low double-digit basis points and often insignificant—whereas the sentiment channel moves the short leg by ~18 bp per standard deviation. Translating to annualized terms, a 0.65%/mo composite is ~7.8%/yr before costs; a sentiment-driven short-leg impulse of 18 bp/mo when sentiment is +1 SD is material at the margin but still second-order to the unconditional premium. This quantitative ordering—**level of anomaly premium ≫ sentiment timing ≫ LTA dynamics**—should drive how much complexity a desk builds into each overlay. It also clarifies why crisis-only narratives are costly: they trade away the large baseline for a small, unstable increment that appears reliably only in microstructure-heavy strategies (law of one price, short-term reversal, pairs).

### Supplemental empirical note (2)

Jacobs’s composite anomaly returning roughly 60–70 bp per month in low-LTA states (Table 3 baselines near 0.62–0.72) is the economically central unconditional fact. Relative to that baseline, the typical high-LTA increment for the composite is single-digit to low double-digit basis points and often insignificant—whereas the sentiment channel moves the short leg by ~18 bp per standard deviation. Translating to annualized terms, a 0.65%/mo composite is ~7.8%/yr before costs; a sentiment-driven short-leg impulse of 18 bp/mo when sentiment is +1 SD is material at the margin but still second-order to the unconditional premium. This quantitative ordering—**level of anomaly premium ≫ sentiment timing ≫ LTA dynamics**—should drive how much complexity a desk builds into each overlay. It also clarifies why crisis-only narratives are costly: they trade away the large baseline for a small, unstable increment that appears reliably only in microstructure-heavy strategies (law of one price, short-term reversal, pairs).

### Supplemental empirical note (3)

Jacobs’s composite anomaly returning roughly 60–70 bp per month in low-LTA states (Table 3 baselines near 0.62–0.72) is the economically central unconditional fact. Relative to that baseline, the typical high-LTA increment for the composite is single-digit to low double-digit basis points and often insignificant—whereas the sentiment channel moves the short leg by ~18 bp per standard deviation. Translating to annualized terms, a 0.65%/mo composite is ~7.8%/yr before costs; a sentiment-driven short-leg impulse of 18 bp/mo when sentiment is +1 SD is material at the margin but still second-order to the unconditional premium. This quantitative ordering—**level of anomaly premium ≫ sentiment timing ≫ LTA dynamics**—should drive how much complexity a desk builds into each overlay. It also clarifies why crisis-only narratives are costly: they trade away the large baseline for a small, unstable increment that appears reliably only in microstructure-heavy strategies (law of one price, short-term reversal, pairs).

### Supplemental empirical note (4)

Jacobs’s composite anomaly returning roughly 60–70 bp per month in low-LTA states (Table 3 baselines near 0.62–0.72) is the economically central unconditional fact. Relative to that baseline, the typical high-LTA increment for the composite is single-digit to low double-digit basis points and often insignificant—whereas the sentiment channel moves the short leg by ~18 bp per standard deviation. Translating to annualized terms, a 0.65%/mo composite is ~7.8%/yr before costs; a sentiment-driven short-leg impulse of 18 bp/mo when sentiment is +1 SD is material at the margin but still second-order to the unconditional premium. This quantitative ordering—**level of anomaly premium ≫ sentiment timing ≫ LTA dynamics**—should drive how much complexity a desk builds into each overlay. It also clarifies why crisis-only narratives are costly: they trade away the large baseline for a small, unstable increment that appears reliably only in microstructure-heavy strategies (law of one price, short-term reversal, pairs).

### Supplemental empirical note (5)

Jacobs’s composite anomaly returning roughly 60–70 bp per month in low-LTA states (Table 3 baselines near 0.62–0.72) is the economically central unconditional fact. Relative to that baseline, the typical high-LTA increment for the composite is single-digit to low double-digit basis points and often insignificant—whereas the sentiment channel moves the short leg by ~18 bp per standard deviation. Translating to annualized terms, a 0.65%/mo composite is ~7.8%/yr before costs; a sentiment-driven short-leg impulse of 18 bp/mo when sentiment is +1 SD is material at the margin but still second-order to the unconditional premium. This quantitative ordering—**level of anomaly premium ≫ sentiment timing ≫ LTA dynamics**—should drive how much complexity a desk builds into each overlay. It also clarifies why crisis-only narratives are costly: they trade away the large baseline for a small, unstable increment that appears reliably only in microstructure-heavy strategies (law of one price, short-term reversal, pairs).

### Supplemental empirical note (6)

Jacobs’s composite anomaly returning roughly 60–70 bp per month in low-LTA states (Table 3 baselines near 0.62–0.72) is the economically central unconditional fact. Relative to that baseline, the typical high-LTA increment for the composite is single-digit to low double-digit basis points and often insignificant—whereas the sentiment channel moves the short leg by ~18 bp per standard deviation. Translating to annualized terms, a 0.65%/mo composite is ~7.8%/yr before costs; a sentiment-driven short-leg impulse of 18 bp/mo when sentiment is +1 SD is material at the margin but still second-order to the unconditional premium. This quantitative ordering—**level of anomaly premium ≫ sentiment timing ≫ LTA dynamics**—should drive how much complexity a desk builds into each overlay. It also clarifies why crisis-only narratives are costly: they trade away the large baseline for a small, unstable increment that appears reliably only in microstructure-heavy strategies (law of one price, short-term reversal, pairs).

### Supplemental empirical note (7)

Jacobs’s composite anomaly returning roughly 60–70 bp per month in low-LTA states (Table 3 baselines near 0.62–0.72) is the economically central unconditional fact. Relative to that baseline, the typical high-LTA increment for the composite is single-digit to low double-digit basis points and often insignificant—whereas the sentiment channel moves the short leg by ~18 bp per standard deviation. Translating to annualized terms, a 0.65%/mo composite is ~7.8%/yr before costs; a sentiment-driven short-leg impulse of 18 bp/mo when sentiment is +1 SD is material at the margin but still second-order to the unconditional premium. This quantitative ordering—**level of anomaly premium ≫ sentiment timing ≫ LTA dynamics**—should drive how much complexity a desk builds into each overlay. It also clarifies why crisis-only narratives are costly: they trade away the large baseline for a small, unstable increment that appears reliably only in microstructure-heavy strategies (law of one price, short-term reversal, pairs).

### Supplemental empirical note (8)

Jacobs’s composite anomaly returning roughly 60–70 bp per month in low-LTA states (Table 3 baselines near 0.62–0.72) is the economically central unconditional fact. Relative to that baseline, the typical high-LTA increment for the composite is single-digit to low double-digit basis points and often insignificant—whereas the sentiment channel moves the short leg by ~18 bp per standard deviation. Translating to annualized terms, a 0.65%/mo composite is ~7.8%/yr before costs; a sentiment-driven short-leg impulse of 18 bp/mo when sentiment is +1 SD is material at the margin but still second-order to the unconditional premium. This quantitative ordering—**level of anomaly premium ≫ sentiment timing ≫ LTA dynamics**—should drive how much complexity a desk builds into each overlay. It also clarifies why crisis-only narratives are costly: they trade away the large baseline for a small, unstable increment that appears reliably only in microstructure-heavy strategies (law of one price, short-term reversal, pairs).
