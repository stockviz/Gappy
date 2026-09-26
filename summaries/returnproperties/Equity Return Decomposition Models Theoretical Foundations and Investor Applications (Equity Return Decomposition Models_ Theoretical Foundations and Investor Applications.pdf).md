# Equity Return Decomposition Models: Theoretical Foundations and Investor Applications — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Equity Return Decomposition Models: Theoretical Foundations and Investor Applications |
| **Authors** | Not attributed in source PDF (practitioner/academic survey synthesis) |
| **Type** | Survey / practitioner research note synthesizing Gordon, Bogle, Grinold–Kroner, CAPE / Campbell–Shiller, and risk-factor frameworks |
| **Original PDF** | `Equity Return Decomposition Models_ Theoretical Foundations and Investor Applications.pdf` |
| **Drive file_id** | `1EUepB2Hr_Dpqo251rz3c0b-j6WjVj2h7` |
| **Extraction** | `pdftotext -layout`; clean text (~9.1k words source) |
| **Core theme** | Decompose equity total return into income, growth, valuation change (± risk/uncertainty overlays); map frameworks to discretionary and quantitative investor use |

This document is a structured synthesis rather than a single empirical paper: it compares canonical return-decomposition identities, shows how each handles valuation, discount rates, and growth, then discusses uncertainty incorporation and active-investor applications. Quantitative content is primarily formulaic and illustrative (e.g., S&P expected-return arithmetic, Grinold–Kroner numerical example ≈7.5%, historical decade attributions for dividends / EPS growth / P/E change).

---

## Problem / Motivation

Equity total return is often treated as a black-box historical average. Practitioners and academics instead need an **accounting-plus-expectations** decomposition that answers: *where does the return come from*, and *what can be forecasted*. The note organizes answers around three (sometimes four) economically distinct pieces:

1. **Income / cash yield** — dividends (or earnings yield / free-cash-flow yield analogues).
2. **Growth** — earnings or dividend growth (real vs nominal; per-share after buybacks/issuance).
3. **Valuation change** — $\Delta(P/E)$, $\Delta$ yield, CAPE mean reversion (“speculative return”).
4. Optionally **risk / uncertainty** — discount-rate overlays (CAPM / multi-factor premia), scenario ranges, volatility risk premia.

Motivation spans: (i) setting **capital-market assumptions** for asset allocation; (ii) **stock-level DCF** hurdle rates vs implied expected returns; (iii) understanding why decades differ (1980s–1990s P/E expansion vs 2000s P/E collapse); (iv) linking cash-flow decompositions to **Campbell–Shiller** news decompositions (cash-flow news vs discount-rate news).

For a quant, the operational payoff is a disciplined prior for expected returns that beats naive historical means, and a transparent bridge between value factors (high E/P) and forecast mean reversion in $\Delta V$.

---

## Setup / Data (Illustrative Empirics Cited)

The note does not run a proprietary panel regression; it cites and tallies known empirical regularities:

- **Bogle decade attribution (Figure 1 concept)**: S&P 500 total return by decade broken into dividends, earnings growth, and P/E change. Classic pattern: **1980s–1990s** — strong fundamentals *plus* large positive speculative return from rising P/E; **2000s** — weak dividends/growth plus sharp P/E decline → roughly **−1%/yr** poor decade outcome.
- **Damodaran-style implied ERP**: Invert Gordon on index level + dividends + assumed growth → implied expected return minus risk-free rate.
- **Grinold–Kroner / CFA practice**: Component forecasts for yield, inflation, real growth, $\Delta S$ (share change), $\Delta(P/E)$.
- **CAPE literature**: High CAPE → lower subsequent 10–20y real returns; three-component (yield + growth + CAPE change) forecasts outperform single-component models (cite to Ma et al. / Basilico summary as in text).
- **Campbell–Shiller (1988)**: Log-linear PV identity; long-run price variation dominated by **discount-rate / expected-return news**, not cash-flow news — consistent with large speculative $\Delta V$ swings at intermediate horizons.

No CRSP/Compustat sample window is primary; the frameworks are intended for **market-level** and **single-name** application.

---

## Model / Methods (with LaTeX)

### 1. Gordon Growth Model (constant-growth DDM)

Intrinsic value and implied expected return:

$$
V_0 = \frac{D_1}{r-g},\qquad r = \frac{D_1}{P_0} + g,
$$

under constant dividend growth $g$ and constant valuation (yield fixed). Interpretation: expected return = **dividend yield + growth**. Risk enters only via choice of $r$ (higher uncertainty → higher $r$ → lower $P_0$).

**Illustrative market inversion**: dividend yield $2\%$, assumed long-run growth $5\%$ ⇒ $r \approx 7\%$; if $R_f=4\%$, implied ERP $\approx 3\%$.

### 2. One-period identity → yield + growth + valuation change

From

$$
r_{t,t+1} = \frac{D_{t+1}}{P_t} + \frac{P_{t+1}-P_t}{P_t},
$$

decompose price change into fundamental growth and multiple re-rating:

$$
r_{t,t+1} \approx \underbrace{\text{Dividend Yield}_t}_{\text{income}} + \underbrace{g}_{\text{growth}} + \underbrace{\Delta V}_{\text{valuation / speculative}}.
$$

$\Delta V>0$ if multiples expand; $\Delta V<0$ if rich valuations normalize. Research Affiliates framing: move from “constant-yield” Gordon to **yield + growth + valuation change**.

### 3. Bogle’s “investment vs speculative” return

$$
\mathbb{E}[R] \approx \text{Dividend Yield} + \text{EPS Growth} \pm \Delta(P/E).
$$

- **Investment return** = yield + earnings growth (corporate performance).
- **Speculative return** = change in willingness to pay ($\Delta P/E$).

Example arithmetic in text: yield $2\%$, EPS growth $\sim5\%$, P/E contraction $\sim1\%/$yr ⇒ expected return $\approx 2+5-1=6\%$ (text’s incomplete “roughly 2” is a pagination artifact; the three-term sum is the intended object).

Bogle emphasizes long-horizon mean reversion of extreme P/Es and historical S&P earnings growth near economy-wide growth (~5% real historically, with possible haircuts).

### 4. Grinold–Kroner extended identity

$$
\mathbb{E}[R_{\text{equity}}] = \frac{D_1}{P_0} + i + g - \Delta S + \Delta(P/E),
$$

where:

| Term | Meaning |
|------|---------|
| $D_1/P_0$ | Expected dividend yield |
| $i$ | Expected inflation |
| $g$ | Expected **real** per-share earnings growth |
| $\Delta S$ | Expected % change in shares outstanding (**subtract** issuance; buybacks enter as $-\Delta S>0$ contribution) |
| $\Delta(P/E)$ | Expected multiple change |

**Numerical example in text**: yield $2\%$, inflation $2\%$, real growth $3\%$, share count shrink $1\%/$yr ($\Delta S=-1\%$), P/E pullback $0.5\%/$yr:

$$
2 + 2 + 3 - (-1) + (-0.5) = 7.5\%.
$$

If required equity return is $8\%$, market looks slightly expensive vs hurdle.

**Fed model** (related but distinct): compare earnings yield $E/P$ to 10y Treasury yield as relative-value snapshot — not a full forward decomposition; academically contested but used as a quick check.

### 5. CAPE / multi-stage DCF

Cyclically Adjusted P/E (10y real earnings). Forecast schematic:

$$
\mathbb{E}[R^{\text{real}}] \approx \underbrace{1/\text{CAPE}}_{\text{earnings yield}} + \underbrace{g^{\text{real}}}_{\text{growth}} + \underbrace{\text{CAPE mean-reversion}}_{\Delta V}.
$$

Multi-stage DCF: high-growth phase then terminal Gordon with stable multiple. Terminal value embeds a discount rate (often CAPM-based).

### 6. Risk-factor expected returns (orthogonal lens)

$$
\mathbb{E}[R_i] = R_f + \beta_i\,(\mathbb{E}[R_m]-R_f)
$$

or Fama–French / multi-factor extensions. Here expected return is compensation for **systematic risk exposures**, not an explicit cash-flow split. Valuation effects appear as factor loadings (e.g., value factor picks cheap multiples). Complementary, not contradictory: cash-flow models say *what* you get; factor models say *why the market prices risk*.

### 7. Uncertainty overlays

Four practitioner channels:

1. **Higher discount rate** for volatile earnings (CAPM $\beta$, industry risk buckets: e.g., staples $r\sim7\%$ vs early tech $r\sim12\%+$).
2. **Scenario / Monte Carlo** on $(g,i,\Delta P/E)$ → distribution of $\mathbb{E}[R]$; prefer narrow bands.
3. **Margin of safety / hurdles** — buy only with cushion to intrinsic value.
4. **Factor risk premia** for earnings volatility / quality-minus-junk: unstable firms priced cheaper (higher expected returns).

Conceptual augmented equation:

$$
\mathbb{E}[R] = \text{DY} + g + \Delta V + \underbrace{\text{uncertainty adjustment}}_{\ge 0\text{ if cash flows very uncertain}}.
$$

Usually implemented via $r$ or scenarios, not a closed-form fifth term.

Campbell–Shiller variance accounting: variance of returns reflects variance of cash-flow news and discount-rate news; earnings volatility maps into return volatility and required premia. Volatility risk premium (options: implied > realized) is the market’s priced analogue.

---

## Results / Quantitative Patterns Emphasized

Although not a single regression table paper, the synthesis stresses several **quantitative regularities**:

1. **Gordon baseline**: $r=\text{DY}+g$ is the steady-state anchor; deviations require $\Delta V \neq 0$.
2. **Decade attribution**: speculative $\Delta(P/E)$ can dominate intermediate (10–15y) outcomes; over very long horizons it washes out (P/E cannot trend forever), so investment return dominates asymptotically.
3. **Grinold–Kroner arithmetic** yields transparent $\sim7\text{–}8\%$ forward expectations under mid-2010s-like inputs; ERP estimates in cited practice often $\sim3.5\text{–}4\%$ (Grinold–Kroner–Siegel 2011 context in text).
4. **CAPE three-component models** beat single-signal forecasts for 10–20y horizons (cited 2024 Ma et al. / Basilico summary).
5. **Campbell–Shiller**: most long-run price variation from expected-return news — i.e., valuation / risk appetite — aligning with large $\Delta V$ importance at strategic horizons.
6. **Crisis pricing**: elevated VIX / uncertainty → lower prices → higher *forward-looking* expected returns (ERP rises when volatility is high).

**Comparative Table 1 (qualitative but operational)** contrasts:

| Model | Components | Valuation assumption | Growth | Risk treatment | Use |
|------|------------|----------------------|--------|----------------|-----|
| Gordon | DY + $g$ | Constant multiples | Constant forever | All in $r$ | Stable payers; implied ERP |
| Bogle | DY + EPS growth ± $\Delta P/E$ | Mean-reverting P/E | Long-term / GDP-linked | Via conservative inputs / ranges | 10y market forecasts; AA |
| Grinold–Kroner | DY + $i+g-\Delta S+\Delta(P/E)$ | Flexible $\Delta(P/E)$ | Real + inflation; buybacks | Overlay judgment | CFA / institutional CMA |
| CAPE / multi-stage | Yield + growth + CAPE revert | Mean-reverting CAPE | Near- vs long-term | High CAPE = valuation risk | 10–20y forecasts; stock DCF |
| CAPM / FF | Risk premia × loadings | Implicit in prices | Via factor exposures | Explicit $\beta$, size, value, … | Cost of equity; quant factors |

**Key insight sentence from text**: all frameworks revolve around cash received, growth of that cash, and the multiple paid — differing in whether these are fixed or time-varying and whether risk is explicit.

---

## Investor Applications (Discretionary vs Quant)

### Discretionary / fundamental

- Build multi-stage DCFs; communicate theses as “$\sim15\%$ annualized = $2\%$ yield + $10\%$ growth + multiple expansion from 12× to 15×.”
- Compare **model-implied $\mathbb{E}[R]$** to **required $r$**; gap = mispricing.
- Asset allocation: if US 10y expected return only $4\%$ (low yields, high P/Es) vs EM $8\%$, tilt.
- Performance attribution: “12% = 2% dividends + 8% earnings growth + 2% multiple expansion” — flags non-repeatable speculative piece.
- Target prices + margin of safety (e.g., require 30% discount to DCF value).

### Quantitative / systematic

- **Value factor** = high E/P or D/P as proxy for high income component + expected positive $\Delta V$ mean reversion; long cheap / short expensive implements the speculative term systematically.
- Capital-market assumption engines (Research Affiliates, BlackRock, AQR-style CMAs): yield + growth + valuation mean reversion over ~10y; rich assets get negative $\Delta V$.
- Alpha models: discrepancy between fundamental decomposed $\mathbb{E}[R]$ and market-implied return → long/short signal.
- Portfolio construction: combine alphas with risk models ($\Sigma$); high-uncertainty names get smaller weights even if point $\mathbb{E}[R]$ is high (Sharpe / IR targeting).
- Evidence cited: fundamental decomposition forecasts beat pure historical mean extrapolation (Alpha Architect / related summary in text).

---

## Limitations

1. **Not a peer-reviewed empirical paper** with a single identifiable identification strategy; strength is synthesis and pedagogy.
2. **Point estimates** of $g$, $\Delta(P/E)$, $\Delta S$ are highly uncertain; models can create false precision.
3. **Gordon / constant-growth** fails for life-cycle firms and changing payout policy; multi-stage needed.
4. **Mean-reversion speed** of CAPE / P/E is slow and irregular — valuation timing is hard at tactical horizons.
5. **Fed model** mixes equity risk premium with nominal bond yields; inflation regime shifts break the comparison.
6. **Risk overlays** (CAPM $\beta$) and cash-flow decompositions can double-count or conflict if not carefully separated (price already embeds risk).
7. Buyback-heavy regimes make **dividend yield** alone a poor income measure — Grinold–Kroner’s $\Delta S$ (or total shareholder yield) is essential.
8. Illustrative numbers (2%+5%, 7.5% GK example) are **teaching arithmetic**, not a dated live forecast.

---

## Quant Takeaways

1. **Always write $\mathbb{E}[R] \approx \text{Yield} + g + \Delta V$** (plus $\,-\Delta S$ and inflation split when needed). Refuse to use historical average equity return as a forward assumption without this decomposition.
2. **Separate investment vs speculative return** (Bogle). At 10–15y horizons, starting valuation ($\Delta V$) is first-order; at multi-decade horizons, yield+growth dominate.
3. **Implement buybacks explicitly** via $-\Delta S$ or per-share growth — aggregate market “earnings growth” without dilution adjustment misstates shareholder return.
4. **Value / high E/P signals** are the cross-sectional analogue of expecting $\Delta V>0$ for cheap names; size positions with a risk model, not raw yield.
5. **When uncertainty rises**, either raise $r$ or demand margin of safety; elevated VIX historically coincides with higher *forward* ERP — do not confuse ex post crash returns with ex ante required returns.
6. **For capital-market assumptions**, prefer three-component (yield + growth + valuation) over single CAPE or single historical mean; stress-test with scenarios on each component.
7. **Attribution**: decompose realized portfolio returns into income, growth, and multiple change to judge whether performance is repeatable.
8. **Bridge to factors**: cash-flow decomposition informs *expected-return priors*; CAPM/FF informs *risk budget*. Optimal quant pipeline uses both: $w \propto \Sigma^{-1}\mu$ with $\mu$ from decomposed / factor-based expected returns.

---

## Concise Formula Cheat-Sheet

$$
\begin{aligned}
r_{\text{Gordon}} &= \frac{D_1}{P_0}+g,\\
r_{\text{Bogle}} &\approx \text{DY} + g_{\text{EPS}} + \Delta(P/E),\\
r_{\text{GK}} &= \frac{D_1}{P_0}+i+g-\Delta S+\Delta(P/E),\\
r_{\text{CAPM}} &= R_f+\beta\,(\mathbb{E}[R_m]-R_f).
\end{aligned}
$$

Use Gordon/Bogle/GK for **building $\mu$**; use CAPM/FF for **risk and relative pricing**; use scenarios for **uncertainty**.

---

*Summary prepared for Scholar batch_2026-09-24_4. Source: Drive PDF `1EUepB2Hr_Dpqo251rz3c0b-j6WjVj2h7`, pdftotext extraction.*


## Worked Numerical Illustrations (Expanded)

### A. Implied equity risk premium via Gordon

Suppose S&P dividend yield $D_1/P_0 = 1.8\%$, consensus long-run nominal dividend growth $g=5.2\%$, and 10y real-rate proxy $R_f=3.5\%$. Then

$$
\hat r = 1.8\% + 5.2\% = 7.0\%,\qquad \widehat{\text{ERP}} = 7.0\%-3.5\%=3.5\%.
$$

If the same market trades at a cyclically elevated P/E such that a Bogle user expects $\Delta(P/E)=-1.0\%/$yr over a decade, forward total return falls to $6.0\%$ and ERP to $2.5\%$. Allocation committees typically respond by cutting equity weight or seeking higher-yielding geographies — exactly the discretionary AA use-case in the note.

### B. Single-name Bogle-style thesis

Stock with DY $2.5\%$, expected EPS CAGR $9\%$, and P/E expected to expand from $14\times$ to $16\times$ over 3 years ($\approx +4.5\%$ cumulative multiple contribution, $\sim1.5\%/$yr):

$$
\mathbb{E}[R]\approx 2.5 + 9 + 1.5 = 13\%.
$$

If the stock’s CAPM required return is $10\%$ ($\beta=1.1$, ERP $5\%$, $R_f=4.5\%$), the $3\%$ wedge is the discretionary “alpha” — but only if growth and multiple paths are not already in the price. Quants implement the same wedge via expected-return vs consensus implied return.

### C. Buyback-adjusted Grinold–Kroner

Market DY $1.5\%$ (low), inflation $2.5\%$, real EPS growth $2.0\%$, net buybacks $1.5\%/$yr ($\Delta S=-1.5\%$), flat multiples:

$$
\mathbb{E}[R]=1.5+2.5+2.0-(-1.5)+0=7.5\%.
$$

Ignoring buybacks would understate expected return by 150 bps — material for CMA vs actuarial hurdles near $7\%$.

### D. Uncertainty haircut

Two firms, same DY+$g$ point estimate $10\%$. Firm A earnings vol low; Firm B high. Assign $r_A=9\%$, $r_B=13\%$. Firm B only clears hurdle if price falls enough to raise DY (or expected $\Delta V$) until model $\mathbb{E}[R]\ge 13\%$. This is the micro foundation for quality/low-vol vs junk pricing differentials discussed via Asness et al. quality-minus-junk in the note.

### E. Decade speculative dominance

If investment return is stably $\sim6\%$ but P/E goes from $15\times$ to $25\times$ over a decade ($+5.2\%/$yr CAGR of multiple), total return $\sim11\%+$. The reverse path (25→15) yields $\sim1\%$ or worse despite unchanged fundamentals — the 2000s pattern highlighted in Figure 1 discussion. Risk systems that only look at trailing 10y returns without decomposition will **overstate** future expected returns after expansion decades and **understate** them after contraction decades.

### F. Mapping to portfolio optimizer

Let $c$ be a cross-sectional vector of decomposed expected-return edges (e.g., value + quality + carry). Post-standardize $c$ to mean 0, std 1. Optimal unconstrained weights $w\propto \Sigma^{-1}c$ then have a transparent Sharpe interpretation: the note’s quant section is exactly this pipeline, with decomposition supplying $\mu$ (or $c$) rather than raw historical means.

These illustrations operationalize every major formula in the survey for desk use.


## Extended Discussion: Linking Identities to Empirical Asset Pricing

### Present-value identities and return news

Campbell and Shiller’s log-linearization of the dividend-discount relation yields an approximate identity for unexpected returns:

$$
r_{t+1}-\mathbb{E}_t r_{t+1} \approx \mathbb{E}_{t+1}\sum_{j=0}^{\infty}\rho^j \Delta d_{t+1+j}
-\mathbb{E}_{t+1}\sum_{j=1}^{\infty}\rho^j r_{t+1+j}
-\mathbb{E}_t(\text{same sums}),
$$

i.e., unexpected returns equal **cash-flow news** minus **discount-rate news**. Empirically, for the aggregate US market, discount-rate news dominates return variance at long horizons. That result is the academic twin of Bogle’s observation that speculative $\Delta(P/E)$ drives a large share of decade-level return differences even when investment return (yield+growth) is relatively stable. For a quant building strategic expected returns, this argues against anchoring $\mu$ solely on smoothed earnings growth; valuation state variables (CAPE, earnings yield, or implied ERP) must enter the forecast.

### Cross-sectional translation

At the stock level, the same identity says a cheap stock (high expected return / high discount rate) can deliver high subsequent returns either because cash flows surprise to the upside or because discount rates fall (multiples expand). Value strategies historically harvest both channels, but the mix varies by episode (e.g., 2000–2007 value recovery vs. 2017–2020 growth multiple expansion). Decomposition-based research notes therefore caution that a pure $\Delta V$ bet and a pure growth bet have different crash risk and different correlation to duration / rates.

### Relationship to residual-income and EVA-style models

Although the survey emphasizes dividend and earnings forms, residual-income models (Feltham–Ohlson and practitioner EVA) rewrite value as book equity plus PV of expected residual earnings. Algebraically they are rearrangements of DDM under clean-surplus accounting. The implied expected return still decomposes into a yield-like piece (earnings relative to price or book) and a growth / fade piece for residual income — again yield + growth + valuation fade. Quants who use P/B or ROE–minus–cost-of-equity signals are implicitly in this family.

### Inflation regimes and the Fed model

The Fed model’s comparison of $E/P$ to nominal Treasury yields is most misleading when inflation expectations shift: both earnings yields and bond yields embed inflation, but equity cash flows are real claims with uncertain inflation pass-through. Grinold–Kroner’s explicit split of $i$ and real $g$ is the safer CMA practice. In a rising-inflation regime, nominal EPS growth may look strong while real growth and multiples compress — a decomposition that separates $i$, $g$, and $\Delta(P/E)$ avoids double-counting inflation in “growth.”

### Payout policy evolution

US markets shifted from dividends toward buybacks since the 1980s. Using dividend yield alone understates cash return to shareholders when net buybacks are large. The survey’s insistence on $\Delta S$ (or total shareholder yield = DY + buyback yield − issuance) is first-order for 2000s–2020s CMAs. A practical rule: replace DY with **total yield** in Bogle’s formula when analyzing the S&P 500 post-1990, then keep $\Delta(P/E)$ as the speculative term.

### Error budgets for CMA committees

Treat each component’s forecast error as an uncertainty budget:

| Component | Typical 10y RMSE (order of magnitude) | Notes |
|-----------|----------------------------------------|-------|
| Starting yield | Near zero (observed) | Measurement error small |
| Real growth | ~1–2 pp | GDP / margin uncertainty |
| Inflation | ~1 pp | Regime-dependent |
| $\Delta S$ | ~0.5–1 pp | Policy / issuance cycles |
| $\Delta(P/E)$ | Often largest | Slow, path-dependent mean reversion |

Monte Carlo CMA engines should draw these jointly (valuations and growth are not independent: high CAPE often coincides with optimistic growth narratives). The survey’s scenario analysis section is exactly this error-budget mindset without formal RMSE tables.

### Connecting to volatility and the VIX

When the note states that ERP rises with VIX, it is describing a **conditional** expected-return effect: prices gap down faster than cash-flow forecasts revise, mechanically raising forward DY and expected $\Delta V$. That is consistent with variance-risk-premium literature (options expensive; selling variance earns premium on average) and with time-varying risk aversion. Strategic allocators who raise equity exposure after volatility spikes are implicitly trading the decomposition: higher starting yield + likely positive subsequent $\Delta V$ if multiples were crushed below fundamentals.

### Quality, low-vol, and the uncertainty adjustment

Stable earnings (low variance of growth) correlate with higher valuations and slightly lower average returns (quality / low-vol / defensive factors). In decomposition language, the market applies a lower discount rate $r$ to low-uncertainty cash flows, raising $P_0$ and compressing forward $\mathbb{E}[R]$. Junk / high-leverage / high-earnings-volatility names embed an uncertainty surcharge. A quant expected-return model that only uses raw DY+$g$ without a risk overlay will **overweight junk** unless $\Sigma$ or an explicit penalty corrects it — hence the survey’s parallel discussion of CAPM/FF alongside cash-flow identities.

### Implementation checklist for a desk

1. **Market CMA**: compute DY (or total yield), consensus real growth, inflation, net buyback rate, and a valuation gap vs. target CAPE or median P/E; produce base/bull/bear $\mathbb{E}[R]$.
2. **Stock DCF**: multi-stage cash flows + terminal multiple; back out IRR; compare to CAPM $r$.
3. **Cross-section**: map E/P, B/P, shareholder yield, and expected growth into a standardized expected-return vector $c$; optimize $w\propto\Sigma^{-1}c$ with constraints.
4. **Attribution**: each month/quarter, split portfolio return into income, growth, and multiple change vs. benchmark.
5. **Risk overlay**: ensure high earnings-volatility names do not dominate on point $\mu$ alone.

### Why historical average returns fail as forecasts

Trailing 10y or 20y equity returns embed a realized speculative component that need not repeat. After a bull market with massive P/E expansion, historical averages are **upward biased** forecasts; after a lost decade with P/E compression, they are **downward biased**. Decomposition de-biases by replacing realized $\Delta(P/E)$ with a forward mean-reversion assumption (often toward a long-run median or model-consistent multiple). This is the central practical claim of the Bogle / Research Affiliates / Grinold–Kroner tradition summarized here.

### Pedagogical value for quant onboarding

New quantitative researchers often jump to machine learning on returns without an accounting identity prior. This survey’s pedagogical contribution is to insist that any signal ultimately answers: *more yield, more growth, or higher future multiple?* If a feature cannot be mapped to one of those channels (or to a risk premium that justifies a discount-rate difference), it is a candidate for overfitting. That discipline is the “theoretical foundation” promised in the title.

### Summary judgment

The document successfully unifies Gordon, Bogle, Grinold–Kroner, CAPE/multi-stage DCF, and risk-factor models under one narrative: equity returns are cash, growth, and revaluation, with risk determining the rate at which cash is discounted. Its quantitative contribution is organizational and illustrative rather than econometric, but the identities and worked arithmetic are directly implementable in CMA, DCF, and factor pipelines. For Scholar purposes it is best read as a **desk manual** with formulas, not as a journal identification paper.