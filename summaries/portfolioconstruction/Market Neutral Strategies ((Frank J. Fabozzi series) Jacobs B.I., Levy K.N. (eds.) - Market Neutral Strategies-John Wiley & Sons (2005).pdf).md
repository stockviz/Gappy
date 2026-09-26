# Market Neutral Strategies — Detailed Quantitative Research Notes

**Title:** Market Neutral Strategies  
**Editors:** Bruce I. Jacobs, Ph.D., and Kenneth N. Levy, CFA (Jacobs Levy Equity Management)  
**Year:** 2005  
**Publisher:** John Wiley & Sons, Inc., Hoboken, New Jersey (Frank J. Fabozzi Series)  
**ISBN:** 0-471-26868-2  
**Contributing authors:** Jane Buchan (PAAMCO); John Maltby (DKR Capital); George E. Hall & Seth C. Fischoff (Clinton Group); Daniel S. Och (Och-Ziff) & Todd C. Pulvino (Kellogg / CNH Partners); Peter E. Pront, John E. Tavss, S. John Ryan (Seward & Kissel); Foreword by Mark Anson (then CIO, CalPERS)  
**Structure:** 12 chapters + glossary; practitioner-authored treatments of equity market-neutral, convertible bond hedging, sovereign FI arbitrage, MBS market-neutral, merger arbitrage, alpha transport, case studies (Askin / LTCM), and tax/ERISA considerations.

---

## Problem / Motivation

Institutional investors in the early 2000s faced a structural tension: long-only mandates and tracking-error constraints prevented full use of negative security views, while absolute-return and portable-alpha frameworks were gaining acceptance among pensions and endowments. Market-neutral construction—holding roughly equal dollar longs and shorts with matched factor exposures—aims to isolate active security-selection return (alpha) from market beta. The editors’ central thesis, developed since the early 1990s, is that **the full benefits of long–short emerge only from integrated optimization**, not from naively pairing a long portfolio with a separately constructed short book. Short selling expands the opportunity set because many investors cannot or will not short; consequently, negative views are under-exploited and short-side alphas can be larger than long-side alphas.

Mark Anson’s foreword frames merger arbitrage as writing insurance against deal failure (consistent, moderate returns like an insurer’s underwriting book) and stresses that “market neutral” extends beyond equities to convertibles, sovereign FI, and MBS. The book’s practical aim is to give CIOs and trustees a single volume covering economics, mechanics (prime brokerage, short rebate, margin), risk, alpha transport, and the tax/ERISA overlay that often dominates taxable and plan-sponsor implementation.

---

## Chapter 1 — Introduction (Jacobs & Levy)

The introduction defines market neutrality as **dollar neutrality plus risk-factor neutrality** (especially equity-market beta ≈ 0), while retaining residual (idiosyncratic and style) risk that security selection is paid to take. Key conceptual distinctions:

1. **Market-neutral vs. hedged long-only:** A long-only portfolio with futures overlay can reduce beta but cannot profit from underweights beyond zero weight; market-neutral can size shorts freely (subject to borrow and margin).
2. **Integrated long–short optimization:** Maximize expected residual return subject to residual-risk and neutrality constraints over the joint long–short holdings, rather than “long book + short book.”
3. **Alpha as cash-plus, not benchmark-relative:** Because beta to the source market is designed to be ≈ 0, performance is appropriately measured vs. cash / short-rebate / T-bill return, not vs. the S&P 500.
4. **Alpha transport (equitization):** Overlay equity (or other) futures/swaps on a market-neutral book to deliver “cash + alpha + desired beta,” enabling portable alpha across plan asset classes.

The editors preview later chapters’ coverage of strategy families and the cautionary histories of Askin (1994 CMO blow-up) and LTCM (1998), arguing that failures reflected leverage, liquidity, and model risk—not an indictment of properly constructed market-neutral investing.

---

## Chapter 2 — Q&A on Market Neutral Investing (Buchan, Jacobs, Levy)

This chapter is structured as institutional FAQ. Quantitatively and operationally important points:

- **Capital deployment:** Typical equity MN uses ~90% of capital for matched long and short notionals, retaining ~10% as a liquidity buffer for marks, dividends, and margin.
- **Short rebate:** Cash proceeds of shorts are held as collateral; the lender/broker pays interest (rebate) often near Fed funds / broker call minus a spread; hard-to-borrow names may pay **negative rebate** (borrow fee).
- **Fed Regulation T / NYSE Rule 431:** Initial short positions require margin account housing; Reg T 50% initial; maintenance typically 25% long and greater of \$5 or 30% for shorts > \$5 (brokers often stricter).
- **Sources of return:** (i) long–short spread from security selection; (ii) short rebate / interest on proceeds; (iii) interest on liquidity buffer; (iv) optional equitization overlay return.
- **Risks retained:** Residual stock risk, factor mismatches (if neutrality imperfect), borrow recalls, corporate actions, model/estimation error, operational/prime-broker risk.
- **Capacity:** Strategy capacity limited by borrow availability, market impact on shorts, and correlation of alpha signals across managers (crowding).
- **Benchmarking:** Cash or cash + x bp is the natural benchmark for pure MN; equitized MN is benchmarked to the overlay index.

---

## Chapter 3 — Market Neutral Equity Investing (Jacobs & Levy)

This is the core quantitative equity chapter. Mechanics are illustrated with a **\$10 million** initial investment.

### Capital structure (Exhibit 3.1)

| Item | Amount |
|------|--------|
| Initial capital | \$10M |
| Long securities purchased | \$9M |
| Short securities sold | \$9M |
| Liquidity buffer (cash) | \$1M (10%) |
| Short-sale proceeds posted as collateral | \$9M |

Reg T allows up to \$10M long + \$10M short on \$10M capital (50% initial), but the authors retain a 10% buffer as a practical tradeoff between leverage utilization and margin-call frequency.

### Return decomposition — bull market example (Exhibit 3.2)

Assumptions: market **+30%**; longs **+33%**; shorts **+27%** (symmetric ±3% residual vs market); short rebate / buffer interest **5%**.

- Long P&L: \$9M × 33% = **+\$2.97M**
- Short P&L: shorts rise to \$11.43M ⇒ loss **−\$2.43M**
- Net equity P&L: **+\$0.54M** = 6.0% on \$9M equity deployed = (33% − 27%)
- As fraction of total capital: 0.90 × 6.0% = **5.4%**
- Interest on short proceeds: 5% × \$9M = **\$0.45M**
- Interest on buffer: 5% × \$1M = **\$0.05M**
- **Terminal value \$11.04M; total return 10.4%** (= 5% cash return + 5.4% long–short spread contribution)

### Bear market symmetry

Market **−15%**; longs **−12%**; shorts **−18%**. Net equity P&L again **+\$0.54M**; with 5% interest, portfolio again ends at **\$11.04M (10.4%)**. The key pedagogical result: **if the long–short residual spread is preserved, MN return is approximately independent of market direction.**

### Asymmetry and short-side alpha

The authors note that short-side excess returns need not mirror long-side excess returns. Historical short interest on the NYSE rose from ~0.2% of shares two decades earlier to ~1.6% at publication—still leaving substantial room for informed shorts. Because long-only investors cannot underweight below zero, **negative-alpha stocks can be more mispriced**, supporting larger short contributions to the spread.

### Position sizing and neutrality

- To establish a 1% overweight (underweight): allocate 1% of capital long (short)—unlike long-only, where a 1% underweight vs a 2% benchmark weight requires a 1% holding, and a full underweight of a 2% name requires zero weight (only 2% active).
- Stock-level active bounds: authors discuss ~0.01%–0.02% materiality for residual beta; portfolios target **portfolio beta ≈ 0** and often additional factor neutrality (industry, size, value/growth).
- Integrated optimization (conceptual form):

$$
\max_{w} \; w^{\top}\hat{\alpha} - \lambda\, w^{\top} V_{\varepsilon} w
$$

subject to $w^{\top}\mathbf{1}_{L} = -w^{\top}\mathbf{1}_{S}$ (dollar neutrality), $\beta^{\top} w \approx 0$, factor exposures $B^{\top} w \approx 0$, and borrow/position bounds. Here $V_{\varepsilon}$ is residual covariance. The critical point: **joint** choice of $w_i > 0$ and $w_j < 0$ exploits the full signal vector.

### Margin dynamics (Exhibit 3.7)

Stress on \$10M MN with \$9M long + \$9M short:

- **Both sides −50%:** Longs and shorts mark to \$4.5M; \$4.5M released to the account; buffer rises; investor can scale notionals back up by buying \$4.5M and shorting \$4.5M.
- **Both sides +100%:** Short proceeds still \$9M but borrowed shares now worth \$18M ⇒ must post additional \$9M to lenders. Drawing from the \$1M buffer creates an **\$8M deficit**; margin falls to **27.8%** (below broker maintenance). Cure: sell \$9M longs and cover \$9M shorts to restore margin; alternatively hold a larger buffer ex ante.
- With a **5%** buffer instead of 10%, a +5% parallel rise in longs/shorts increases owed marks by \$0.45M, buffer → \$0.55M, margin **52.9%** (still OK) but requires rebalancing to restore the buffer target.

**Practical takeaway:** Buffer size is a control variable trading leverage (expected alpha on capital) against rebalancing frequency and forced liquidation risk in rallies—the opposite of the usual long-only concern (drawdowns).

### Implementation frictions

- Borrow: availability, recalls, locate process; concentrated small-cap shorts face higher fees and recall risk.
- Corporate actions: dividends on shorts are owed by the short; special dividends and M&A create operational P&L.
- Trading costs: two-sided turnover; market impact often higher on shorts.
- Risk models: residual risk forecasting error leads to unintended factor bets; neutrality must be monitored continuously.

---

## Chapter 4 — Convertible Bond Hedging (Jane Buchan)

Convertible arbitrage is presented as a classic market-neutral (or market-light) strategy: long cheap convertibles, short the underlying equity (and sometimes interest-rate or credit hedges) to isolate cheapness of the embedded option / credit package.

### Economic sources of return

1. **Cheapness of the convertible** vs theoretical value from an options/credit model (mispriced implied volatility, credit spread, or soft-call assumptions).
2. **Carry:** convertible coupon + short rebate on stock hedge − financing.
3. **Gamma / convexity:** dynamically delta-hedged long options earn from realized volatility if long gamma and realized vol > implied (with path dependence).
4. **Credit and rate residuals** if not fully hedged.

### Hedging mechanics (quantitative structure)

Let $C$ be convertible price, $S$ underlying stock, $\Delta = \partial C/\partial S$ model delta. Hedge ratio:

$$
n_{S} = -\Delta \times \frac{\text{parity conversion factor}}{\text{contract multiplier conventions}}
$$

For a long convertible position of face $F$ convertible into $n_{\text{conv}}$ shares:

$$
\text{shares short} \approx \Delta \cdot n_{\text{conv}}
$$

Additional hedges:

- **Interest-rate DV01:** short Treasuries or pay fixed in swaps to match convertible duration if rates exposure is unwanted.
- **Credit:** CDS on issuer or proxy; or short high-yield index. Convertible credit exposure is complicated by equity optionality (credit-equity correlation).

**Greek management:**

- Delta ≈ 0 (equity MN)
- Target vega > 0 if long cheap vol
- Monitor gamma (rehedge frequency vs cost)
- Rho / DV01 near 0 with FI hedges
- Credit spread DV01 managed explicitly

### Risks emphasized

- **Liquidity:** convertibles are OTC-ish; exits during stress costly (cf. 1994 and 1998 convertible dislocations mentioned elsewhere in the book).
- **Implied vs realized vol** and **credit-vol correlation** shocks.
- **Call risk / forced conversion** altering hedge ratios discontinuously.
- **Borrow** on underlying for the short stock leg.
- **Leverage:** typical CA books run substantial gross leverage; financing spreads widen in stress.

Buchan’s practitioner framing stresses that “market neutral” in convertibles is multi-market hedging (equity + rates + credit), not a single beta number.

---

## Chapter 5 — Sovereign Fixed-Income Arbitrage (John Maltby)

Sovereign FI arbitrage seeks relative-value profits across government curves, futures, and related basis markets while neutralizing parallel yield-curve (duration) exposure—and often key-rate / PCA factor exposures.

### Typical trade families

1. **Curve trades:** 2s10s, 5s30s flattener/steepener with duration-weighted notionals so parallel DV01 ≈ 0:

$$
N_1 \cdot \mathrm{DV01}_1 + N_2 \cdot \mathrm{DV01}_2 \approx 0
$$

2. **Butterfly / bar-bell:** weight wings vs body so parallel and slope factors are neutralized; isolate curvature:

$$
w_{\text{body}}\,\mathrm{DV01}_b + w_{w1}\,\mathrm{DV01}_{w1} + w_{w2}\,\mathrm{DV01}_{w2} = 0
$$

(and similarly for key-rate or PCA loadings).

3. **Futures basis:** cash bond vs bond futures delivery option / cheapest-to-deliver (CTD) dynamics—deeply related to Burghardt–Belton treasury basis analysis (companion literature).
4. **Cross-country / swap-spread:** e.g., Treasury vs Bund, or Treasury vs interest-rate swap spread, hedged for duration and FX if needed.

### Risk and capital

- **PCA factor neutrality:** first 2–3 principal components of yield-curve changes (level, slope, curvature) often explain >90–95% of variance; residual is the trade’s risk budget.
- **Leverage:** sovereign RV historically used high leverage (LTCM’s core book); small yield errors × large notionals.
- **Liquidity & repo:** financing specialness; fails; balance-sheet constraints post-stress.
- **Model risk:** spline / Nelson–Siegel / no-arbitrage term-structure models drive “rich/cheap”; parameter instability.

Maltby emphasizes that true market neutrality in sovereign space means **factor neutrality across the curve**, not merely matching one modified duration number.

---

## Chapter 6 — Market Neutral Strategies with Mortgage-Backed Securities (Hall & Fischoff)

MBS market-neutral strategies long and short MBS pass-throughs, CMOs, IO/PO strips, and hedges in Treasuries/swaps/futures to isolate relative value in prepayment and volatility views.

### Core quantitative issues

**Prepayment optionality:** An MBS is a callable amortizing bond; price:

$$
P = \mathbb{E}\left[\sum_t \frac{CF_t(r,\text{prepays})}{(1+r_t)^{t}}\right]
$$

where prepayments depend on rate incentive, burnout, housing turnover, refris.

**Duration types:**

- Modified / effective duration (with OAS model)
- **Spread duration**
- **Partial / key-rate durations**
- **Prepayment duration** (sensitivity to prepayment-speed multiples)
- **Vega** to implied vol in the OAS framework

**IO/PO:** Interest-only strips rise when prepayments fall (rates up); principal-only opposite—used as pure prepayment views with rate hedges.

### Market-neutral construction

Long cheap MBS / CMO tranches vs short rich ones (or vs TBA hedges), with:

$$
\sum_i w_i\, D^{\text{eff}}_i \approx 0,\quad \sum_i w_i\, D^{\text{KR}}_{i,k} \approx 0
$$

plus convexity and vega budgets. Clinton Group-style implementations historically combined quantitative OAS relative value with discretionary credit/structure views.

### Lessons tied to Askin (Ch. 9)

Askin’s “market neutral” CMO book claimed neutrality via long “bullish” and “bearish” CMOs, targeting **15%/yr** “regardless of bond market direction,” later marketing **25%** targets. Effective durations of many holdings exceeded **10–15**, and hedges failed in the 1994 rate shock when mortgage derivatives’ empirically realized sensitivities diverged from model durations. Chapter 6’s constructive message: MBS neutrality requires **continuous re-estimation of effective durations under stressed prepayment regimes**, adequate liquidity buffers, and skepticism toward model duration for exotic CMOs.

---

## Chapter 7 — Merger Arbitrage (Och & Pulvino)

This chapter is empirically rich: merger arb as **writing insurance against deal failure**.

### Economics of the spread

On announcement, targets typically jump **~20%+** yet still trade at a **1%–3%** discount to deal consideration because of completion risk. Failed deals often see target prices drop on the order of **~25%**. Arbitrageurs buy target (and short acquirer in stock deals) to earn the spread if the deal closes.

### Cash deal example — Odwalla

- Pre-rumor dynamics and rumor run-up: close **\$6.80 → \$10.05** (**+48%**) on rumor day; drifted to **\$11.83**.
- Definitive cash tender: **\$15.25**/share (**+29%** vs prior close; **+144%** vs pre-rumor).
- Post-announcement trade **\$15.13** ⇒ spread **0.79%** to \$15.25.
- If completed on schedule, **0.79%** over ~6 weeks annualizes to **~6.8%**.
- Implied failure probability (risk-neutral sketch): with $r_f=5\%$, payoff $V_{\text{success}}=15.25$, if failure price $V_f=12$, implied $p_{\text{fail}}\approx 1.8\%$; if $V_f=10$, $p_{\text{fail}}\approx 1.1\%$.

### Stock-for-stock example — Compaq / HP (announced 2001)

- Compaq **\$11.08**, HP **\$18.87**, exchange ratio **0.6325**.
- Short $0.6325$ HP shares → proceeds **\$11.94**; buy 1 Compaq @ **\$11.08**.
- Gross spread **\$0.86 (7.8%)**.
- Short rebate typically **25–50 bp** below funding; example builds **~\$0.20** interest + dividends ⇒ total expected **~8.9%** if closes; annualized illustration **~29.4%** if the calendar were a full year of identical spreads (pedagogical; actual calendar shorter).
- When deal risk spiked, spread jumped from **7.8% to 47.4%**; a **\$100** position marked to **~\$72** (Exhibit 7.2 path). Eventual completion delivered **8.9%** gross (**14.0%** annualized over the holding period shown).

### Collar structures

Examples with floating exchange ratios between average-price bands (e.g., bands **\$20–\$30** with ratio floored/capped; or **\$30–\$50** maintaining \$10 target value)—arbitrage requires dynamic hedge ratios as the collar deltas change.

### Empirical completion and antitrust

Among HSR-reported deals, roughly **~2–3%** received second requests on average (1991–2000 figures cited: 98 of deals received second requests, ~2%). Hostile deals historically show **~30%** failure probability vs **<10%** for friendly deals (order-of-magnitude chapter figures).

### Return statistics (Mitchell–Pulvino simulated & HFR)

- Successful mergers: average return **~9.9%** over **~3.5 months**
- Failed mergers: average return **~−18.8%**
- CAPM beta of merger arb (HFR 1990–2001): **β ≈ 0.14**; simulated 1963–1998: **β ≈ 0.12**
- **Down-market beta** (piecewise linear): **β_down ≈ 0.44** (significantly > 0)—i.e., merger arb is **not** market-neutral in crashes; it embeds a short put on deal completion that correlates with market stress (Oct 1987: market **−22%**, simulated MA **−8.2%**; Aug 1998: market **−15%**, simulated **−4.5%**, HFR **−5.7%**).

**Investor implication:** treat merger arb as a **short-volatility / short-discontinuity** insurance book with mild average beta but **state-dependent beta** that rises when markets gap down.

---

## Chapter 8 — Transporting Alpha (Jacobs & Levy)

Alpha transport (portable alpha) equitizes a market-neutral book so the investor receives **equity-market return + MN alpha** (or transports alpha onto any futures/swap overlay).

### Equitized capital structure (Exhibit 8.1)

Starting from the \$10M MN setup (\$9M L, \$9M S, \$1M buffer):

- Buy equity futures (e.g., S&P 500) with **~\$10M** notional.
- Futures initial margin ~**5%** ⇒ **~\$0.5M** in T-bills from the buffer; buffer remains **~\$0.5M**.

### Performance vs pure MN (Exhibit 8.3)

Same residual spread as Ch.3 (±3% vs market) plus overlay:

- Bull market (market +30%): equitized return **~35.4%** vs pure MN **10.4%**
- Bear market (market −15%): equitized **~−9.6%** vs pure MN **10.4%**

Decomposition: overlay delivers market; long–short still contributes **~5.4%** spread (plus cash components adjusted for buffer used as futures margin).

### Swap-based transport example

\$10M active small-cap portfolio; Russell 2000 **+10%**, S&P 500 **+13%**, portfolio **+12%**:

- Pay Russell 2000 on \$10M = **−\$1.0M**
- Receive S&P 500 on \$10M = **+\$1.3M**
- Portfolio ends **\$11.2M** from securities + net swap **+\$0.3M** ⇒ **\$11.5M**

Investor keeps small-cap alpha (**+2%** vs Russell) while holding large-cap beta.

### Asset-allocation context

Citing Brinson-style results: **>90%** (e.g., **>97%** for 1985–1989 in one cited study) of typical pension return *variance* is explained by asset allocation policy. Portable alpha reframes active management as **portable residual return** stacked on desired betas. Example mix discussion: large-cap **46%**, mid **31%**, small **19%**, Europe allocations—alpha from small-cap MN can be transported onto large-cap overlay.

### Costs and frictions

- Futures margin ~5% + variation margin volatility
- Drag from maintaining overlay can approach **~1%/yr** in adverse implementation
- Swap spreads: paying Russell + x bp to receive S&P
- Contra-asset haircuts when equitizing with stock loans

---

## Chapter 9 — A Tale of Two Hedge Funds (Askin & LTCM)

### Askin Capital Management (1994)

- Strategy: leveraged “market neutral” **CMO** book; target **15%/yr** “regardless of bond market,” later **25%** marketing; financing with **3–4%** interest and **5–25%** haircuts.
- Scale: ~**\$200M** equity generating **17–18%** gross; 1993 return ~**20%**; AUM ~**\$450M** plus segregated accounts **\$10–25M** each.
- Stress: Feb 1994 marks **−20%** month (Askin contested broker marks showing ~1–2% losses initially—valuation opacity).
- Margin calls: Bear Stearns **>\$30M** then **>\$50M**; liquidity buffer ~**5%** inadequate; scrambled **\$10M** cash + **\$18M** securities; additional **\$10M** demand.
- Outcome: bankruptcy April 1994; investor losses estimated **~\$600M**.
- Diagnosis: **>80%** in mortgage derivatives by end-1993; effective durations **>10**, near **~15** for some; “bullish/bearish CMO” pairing failed as a hedge when empirics diverged from models; leverage + illiquidity + mark disputes.

### Long-Term Capital Management (1998)

- Capital: >**\$1B** raised by mid-1994 atop **\$100–150M** GP capital; fees **2%** management + **25%** of profits (note: chapter cites 25% incentive in places—LTCM’s classic terms were famously 2-and-25).
- Leverage / size: by 1997–98, order **~\$125–140B** balance-sheet assets on **~\$5–7B** equity (leverage often **~25×**, at times discussed near **20×**, later **>100×** as equity collapsed); **>\$1T** notional derivatives.
- Returns: 1994 (partial) strong; **1995 +59%** pre-fee; **1996 +57%**; **1997 +25%** with lower leverage; returned **\$2.7B** capital end-1997.
- 1998 path: May **−6.5%**, June **−10%**; Russia / LTCM crisis: August loss **~\$1.8B**; Sep 21 loss **>\$500M**; equity **<\$1B**.
- Vol targeting anecdote: daily P&L vol objective discussed around **\$45M**, cut toward **\$34M**.
- Bailout: consortium **\$3.6B** for **~90%** of the firm; old investors left **~\$400M**; later wind-down with final **\$925M** payment to consortium; some residual positive performance in wind-down (~**+10%** noted).
- Lessons: convergence trades with huge notionals are **short liquidity and short crisis correlation**; models calibrated on quiet correlations fail when correlations → 1; returning capital while keeping positions **increases leverage**; opacity and repo/financing runs amplify.

**Editors’ synthesis:** neither failure invalidates market-neutral *construction*; both show that **leverage × illiquidity × model error × crowded trades** dominate outcomes. Stated another way: Askin’s 15–20% targets at high effective duration risk, and LTCM’s ~**2.45% ROA** in 1995 magnified by leverage into **59%** ROE, illustrate return on equity as a misleading quality metric without accompanying liquidity-adjusted risk.



---

## Chapter 10 — Significant Tax Considerations for Taxable Investors (Pront & Tavss)

This long legal-quantitative chapter (among the densest in page count) addresses how U.S. taxable investors experience market-neutral returns **after tax**, which can reorder strategy rankings versus pre-tax Sharpe comparisons.

### Character of income

- **Long equity gains:** holding-period dependent (short-term vs long-term capital gains rates).
- **Short equity gains/losses:** generally short-term character because the short position’s holding period rules differ; covering a short typically produces short-term capital gain/loss regardless of how long the short was open (practical summary of the chapter’s rule discussion—investors must verify current IRC §§ 1233 / related).
- **Dividends on longs:** qualified dividend treatment if holding-period and issuer tests met.
- **Payments in lieu of dividends on shorts:** generally **not** qualified; ordinary income character from the short side creates a tax asymmetry that **reduces after-tax alpha** of dividend-paying short legs.
- **Short rebate / interest:** interest income taxable at ordinary rates.
- **Constructive sales / straddles (IRC §1259, §1092):** overlapping long–short in substantially identical securities can suspend loss recognition, defer recognition, or recharacterize timing—integrated optimizers that ignore tax lots can create adverse straddle outcomes.

### After-tax alpha sketch

Let $\alpha_{\text{pre}}$ be pre-tax long–short spread contribution, $r_{\text{rebate}}$ ordinary-taxed, $\tau_o$ ordinary tax rate, $\tau_c$ capital-gains rate, $f_{\text{ST}}$ fraction of equity P&L taxed as short-term:

$$
\alpha_{\text{after}} \approx (1-\tau_c)\,(1-f_{\text{ST}})\alpha_{\text{eq}} + (1-\tau_o)\,f_{\text{ST}}\alpha_{\text{eq}} + (1-\tau_o)\,r_{\text{rebate}} - \text{PIL dividend tax drag}
$$

For a high-income U.S. taxable investor with $\tau_o \gg \tau_c$, strategies that generate ordinary income (rebate, PIL dividends, short-term trading) suffer larger haircuts than low-turnover long-term gain strategies. **Quantitative implication:** a market-neutral book with 100% annual two-sided turnover may look excellent pre-tax yet mediocre after-tax vs a lower-turnover long-short tax-aware book.

### Entity choice and blockers

Discussion covers direct accounts vs partnerships (hedge-fund pass-through), offshore blockers for certain investors, and the tradeoff between tax efficiency and fee/complexity overhead. Wash-sale and year-end loss-harvesting interactions with short covers are operationally material.

### Practical takeaways for taxable quants

1. Optimize on **after-tax expected return** with lot-level tax factors in the α vector.
2. Prefer shorts in low-dividend names when PIL drag is material.
3. Avoid inadvertent straddles with overlay hedges.
4. Measure performance with after-tax benchmarks (cash after-tax).

---

## Chapter 11 — Tax-Exempt Organizations & ERISA Concerns (Pront & Ryan)

For pensions, endowments, foundations:

### UBTI (Unrelated Business Taxable Income)

Tax-exempt investors can create UBTI via **debt-financed income** and certain partnership allocations. Short sales and leverage inside a pass-through can raise UBTI issues depending on structure. Offshore corporations or total-return swaps are often used as **blockers**.

### ERISA / plan-asset issues

- **Plan asset regulation:** if ERISA plans own a significant enough share of a fund vehicle, the fund’s assets may be treated as plan assets, imposing fiduciary duties and prohibited-transaction rules on the manager.
- **Prohibited transactions:** principal trades with affiliates, soft-dollar issues, securities lending conflicts with the plan’s own lending program.
- **Custody & prime brokerage:** plan assets require careful custody arrangements; rehypothecation terms matter for counterparty risk.
- **QPs / QPAM exemptions:** managers rely on exemptions to trade routinely without prohibited-transaction violations.

### Quantitative governance implication

Even if a strategy’s Sharpe is attractive, **structural leakage** (UBTI tax, ERISA constraints reducing investable universe, higher custody costs) can dominate. The chapter’s role in a quant library is to force the allocator to treat legal/structural constraints as hard portfolio constraints, analogous to Reg T.

---

## Chapter 12 — Afterword (Jacobs & Levy)

The afterword restates: market-neutral investing is a **risk-budgeting technology** that separates alpha from beta; success requires integrated optimization, realistic leverage, liquidity awareness, and institutional infrastructure (borrow, tax, ERISA). The Askin/LTCM autopsies are meant as design requirements, not scare stories.

---

## Cross-Strategy Quantitative Comparison (Synthesis)

| Strategy | Primary alpha source | Typical neutrality | Key residual risks | Empirical notes from text |
|----------|---------------------|--------------------|--------------------|---------------------------|
| Equity MN | Security selection L/S spread | β≈0, often industry/style neutral | Residual idiosyncratic, borrow | Ch.3: 10.4% example = 5% cash + 5.4% spread |
| Convertible arb | Cheap vol/credit in converts | Delta≈0; optional DV01/credit hedge | Credit, liquidity, vol | Multi-market hedges required |
| Sovereign FI RV | Curve relative value | DV01/PCA≈0 | Convexity, liquidity, repo | High leverage historically |
| MBS MN | OAS / prepay relative value | Eff. duration / KRDs≈0 | Prepay model error, liquidity | Askin: duration 10–15 failure |
| Merger arb | Deal-completion insurance premium | Low average β (~0.12–0.14) | Jump-to-failure, β_down≈0.44 | Success +9.9%/3.5m; fail −18.8% |
| Equitized MN | MN alpha + overlay beta | β≈1 to overlay | Futures basis, margin | Bull +35.4% vs MN +10.4% in example |

---

## Deeper Formalization for the Quant Practitioner

### 1. Defining neutrality

Let $r_p = \sum_i w_i r_i$ with $\sum_{i\in L} w_i = +1$, $\sum_{i\in S} w_i = -1$ on the *deployed equity* basis (or equal absolute dollars). Market beta:

$$
\beta_p = \sum_i w_i \beta_i \approx 0
$$

Multi-factor neutrality with exposure matrix $B$ (industries, styles):

$$
B^{\top} w = 0
$$

Dollar neutrality alone is **not** risk neutrality: a \$9M long tech / \$9M short utilities book is dollar neutral but has large factor bets.

### 2. Information ratio and leverage

If residual expected return is $\alpha$ on the long–short book and residual volatility is $\sigma_{\varepsilon}$, the IR on *deployed* capital is $\alpha/\sigma_{\varepsilon}$. On *investor* capital with gross leverage $G = (\text{long \$}+\text{short \$})/\text{capital}$:

$$
IR_{\text{capital}} = \frac{(G/2)\,\alpha_{\text{one-side spread defs}}}{\sigma_{\text{capital}}}
$$

In the book’s \$10M example, gross notional \$18M ⇒ $G=1.8$, buffer 10%. Increasing $G$ raises expected return and residual risk roughly linearly until borrow/impact/margin constraints bind.

### 3. Short rebate in the return equation

$$
r_{MN} = \underbrace{\sum_{i\in L} w_i r_i + \sum_{j\in S} w_j r_j}_{\text{long–short spread}} + \underbrace{r_{\text{rebate}}\sum_{j\in S}|w_j|}_{\text{rebate}} + \underbrace{r_f w_{\text{buffer}}}_{\text{buffer interest}} - \text{fees} - \text{borrow fees}
$$

Hard-to-borrow names replace $r_{\text{rebate}}$ with $r_{\text{rebate}} - f_{\text{borrow}}$, possibly negative.

### 4. Merger arb as insurance pricing

Let deal consideration be $X$, current target price $T$, risk-neutral failure probability $q$, failure price $V_f$, time to resolution $\Delta t$:

$$
T \approx e^{-r\Delta t}\left[(1-q)X + q V_f\right]
$$

$$
q \approx \frac{e^{r\Delta t}T - X}{V_f - X}
$$

(Och–Pulvino numerical examples use this logic: 0.79% cash spreads imply single-digit % failure probabilities when $V_f$ is not too far below $T$.) Annualized expected return if $q=0$ is approximately $\text{spread}/\Delta t$; with nonzero $q$, expected return equals insurance premium minus expected loss.

### 5. Portable alpha identity

$$
r_{\text{equitized}} \approx r_{\text{overlay}} + r_{MN} - r_f^{\text{financing adjustment}}
$$

More precisely, futures overlay with notional equal to capital contributes ≈ spot index excess return, while MN contributes cash-plus residual; financing and basis create slippage (book cites up to ~1%/yr implementation drag).

### 6. Stress beta of merger arb

Piecewise model:

$$
r_{MA} = \alpha + \beta^{+} r_m^{+}/\!+ + \beta^{-} r_m^{-} + \varepsilon
$$

with $\beta^{-}\approx 0.44 > \beta^{+}\approx\text{near 0}$ on HFR 1990–2001—allocators using full-sample β≈0.14 **understate equity risk in left tails**.

---

## Implementation Playbook (Operational Quant Details)

### Prime brokerage & locate

1. Pre-borrow / locate before shorting; monitor hot lists.
2. Segregate hard-to-borrow alpha: require higher expected α to justify borrow fee.
3. Track **days-to-cover** and short interest as crowding risk factors.

### Risk desk daily monitors

- Net β, sector βs, style exposures (value, momentum, size)
- Gross / net exposure, largest 10 longs/shorts
- Liquidity: days to liquidate at X% ADV
- Margin cushion vs maintenance; projected cushion under ±10/20/50% shocks (recall Exhibit 3.7)
- Borrow recalls and corporate actions calendar

### Optimization constraints (practical)

$$
\begin{aligned}
|w_i| &\le \min(w^{\max}, c\cdot \mathrm{ADV}_i)\\
\sum_i |\beta_i w_i| &\le \epsilon_{\beta}\\
\|B^{\top} w\|_{\infty} &\le \epsilon_{\text{fac}}\\
\sum_i |w_i - w_i^{\text{prev}}| &\le \tau_{\text{turnover}}\\
w_{\text{buffer}} &\ge b_{\min}
\end{aligned}
$$

### Accounting P&L attribution

Daily attribute to: long residual, short residual, factor misfit, rebate, financing, costs, overlay. Without attribution, “market neutral” labels hide unintended beta.

---

## Limitations of the Book / Strategy Class

1. **Pre-GFC institutional detail:** Published 2005; prime-broker risk (Lehman 2008), Reg T evolution, and swap-based synthetics later changed the opportunity set. Numbers (short interest 1.6%, fee examples) are period-specific.
2. **Limited formal econometrics:** Unlike Ang (2014) or academic HF literature, most chapters are practitioner-quantitative rather than regression-heavy (merger arb chapter is the empirical exception).
3. **Tax chapters are U.S.-centric** and age with the Code; principles remain, rates/rules change.
4. **Capacity externalities:** Book discusses crowding qualitatively; does not fully quantify multi-manager capacity in equity MN post-2000 quant growth.
5. **Model risk underemphasized outside Ch.9:** MBS and FI chapters need continuous model validation; readers must import modern validation discipline.

---

## Practical Takeaways for a Quantitative Investor

1. **Integrate L and S in one optimizer.** Separately built long and short books waste risk budget and double-count hedges.
2. **Benchmark pure MN to cash**, not to the equity market; use equitization when equity beta is desired.
3. **Size the liquidity buffer explicitly** (book’s base case 10%) as a function of volatility and gap risk; rallies drain margin via short marks.
4. **Measure merger arb with down-market beta** (~0.44 in-sample) and treat it as insurance underwriting, not “alpha without beta.”
5. **Distrust mortgage “neutrality” without stressed effective-duration tests**—Askin’s durations 10–15 and \$600M losses are the permanent case study.
6. **Haircut LTCM-like ROE figures by leverage and liquidity;** 59% returns on ~2.45% ROA is a leverage story.
7. **Portable alpha is an overlay engineering problem** (futures margin, swap spreads, basis)—budget ~0–1%/yr implementation cost.
8. **Taxable investors must reoptimize:** PIL dividends and short-term character can erase apparent IR advantages.
9. **ERISA/UBTI structures are first-class constraints** equal to β constraints for plan sponsors.
10. **Crowding & borrow** are now first-order alpha decay channels; require borrow-fee-adjusted α and crowding risk factors in the model.

---

## Extended Numerical Worked Examples (Reconstructed from Chapter Exhibits)

### Example A — Pure equity MN return identity

Capital $C=10$, deployment fraction $d=0.9$, long return $R_L=0.33$, short underlying return $R_S=0.27$, rebate rate $r=0.05$:

$$
\begin{aligned}
\Pi_{\text{equity}} &= d C (R_L - R_S) = 0.9\times 10\times 0.06 = 0.54\\
\Pi_{\text{rebate}} &= r\, d C = 0.05\times 9 = 0.45\\
\Pi_{\text{buffer}} &= r\,(1-d)C = 0.05\times 1 = 0.05\\
R_{MN} &= (\Pi_{\text{equity}}+\Pi_{\text{rebate}}+\Pi_{\text{buffer}})/C = 1.04/10 = 10.4\%
\end{aligned}
$$

### Example B — Equitized payoff identity

Overlay excess ≈ market return $R_M$ on notional ≈ $C$:

$$
R_{\text{eq}} \approx R_M + R_{MN} - r_{\text{adj}}
$$

With $R_M=+30\%$ and $R_{MN}=10.4\%$, chapter illustration **35.4%** implies interaction of margin financing and the fact that part of the cash return is redirected—use exhibit accounting rather than the naive sum 40.4%. With $R_M=-15\%$, illustration **−9.6%**. The residual spread contribution remains the portable piece.

### Example C — Margin after 100% rally

Longs & shorts double; additional mark to lenders $= dC = 9$. Buffer $bC=1$ insufficient by 8. Margin ratio roughly:

$$
\frac{C}{\text{long MV} + \text{short MV after}} \approx \frac{10}{18+18} \approx 27.8\%
$$

as in Exhibit 3.7—below typical maintenance. Deleveraging rule: trade down notionals until buffer target restored.

### Example D — Merger arb HP–CPQ cashflows (chapter)

$$
\begin{aligned}
\text{Buy 1 CPQ } &= -11.08\\
\text{Short 0.6325 HP } &= +11.94\\
\text{Gross spread } &= 0.86 \ (7.8\%)\\
\text{+ rebate/div approx } &= 0.20\\
\text{Total } &\approx 0.985 \ (8.9\%)
\end{aligned}
$$

Crisis mark: spread → 47.4%, NAV → ~72 from 100.

### Example E — LTCM leverage arithmetic

If assets $A=140\text{B}$, equity $E=5\text{B}$, leverage $A/E=28$. A **−4%** move on assets ≈ **−112%** on equity without hedges. LTCM’s August 1998 **−\$1.8B** on sub‑\$5B equity is consistent with extreme leverage plus adverse basis moves across many small edges simultaneously.

---

## Glossary Themes (Quant-Relevant)

The book’s glossary crystallizes: **alpha transport, rebate, locate, maintenance margin, Reg T, OAS, CTD, deal spread, dollar neutrality vs beta neutrality, equitization, portable alpha, pair trade vs portfolio optimization, short interest, hard-to-borrow.** For implementation teams, aligning internal data dictionaries to these definitions avoids the common error of reporting “net exposure 0%” while residual β is 0.3.

---

## Research Bibliography Touchpoints Embedded in the Text

- Jacobs & Levy, “The Long and Short on Long-Short,” *Journal of Investing* (Spring 1997)—source of Exhibits 3.2, 3.7, 8.2, 8.3.
- Mitchell & Pulvino merger-arbitrage academic simulations (1963–1998) underlying β and success/fail stats.
- HFR merger arb index 1990–2001 for live-fund β estimates.
- Brinson / Sharpe asset-allocation variance attribution studies motivating portable alpha.
- Trustee reports on Askin; public LTCM autopsy literature (Lowenstein; Fed consortium disclosures).

---

## Final Assessment for Library Use

*Market Neutral Strategies* (2005) remains a **practitioner systems manual** for separating alpha from beta across equity, convertible, sovereign, MBS, and event-driven books, with uniquely valuable **worked capital-account exhibits** (\$10M examples) and **failure forensic detail** (Askin, LTCM). It is not a substitute for modern factor models, execution algos, or post-2008 balance-sheet regulation, but it is essential reading for understanding **why** integrated long–short optimization, buffer sizing, and insurance-style thinking in merger arb matter in portfolio construction. For a quantitative investor, the highest-ROI chapters are **3 (equity MN mechanics), 7 (merger arb empirics), 8 (portable alpha), and 9 (failures)**; tax/ERISA chapters are mandatory for implementation in taxable and ERISA channels.

**Word-count note for this research summary:** designed as peer-level notes preserving exhibit numerics, legal constraints, and formal neutrality conditions sufficient to re-implement the book’s core examples in a risk system.



---

## Expanded Chapter 2 Notes — Capacity of Shorting vs Long-Only

A critical quantitative insight in the Q&A: if a stock is **0.01% of U.S. equity market cap**, a long-only portfolio that does not hold it can underweight by at most **0.01%** relative to a cap-weighted benchmark. A market-neutral (or long–short) investor can short multiples of that weight, subject to borrow—so the **active capacity of a negative view is far larger** on the short side. Conversely, leverage is optional: with \$100 capital one may run \$50 long / \$50 short (same gross risk capital as \$100 long-only) or lever beyond. Convertible arb drawdowns in liquidity crises are noted as typically **−2% to −7%** in the Q&A framing (context: strategy can be painful but historically bounded vs equity beta crashes)—later chapters add more severe crisis observations (1987, 1990, 1994, 1998).

---

## Expanded Chapter 4 — Convertible Bond Hedging: Full Numerical Detail

### Strategy return profile

Reported convertible arb returns historically averaged roughly **13%–16% per year** (chapter’s characterization of reported strategy returns), with relative stability vs equities—purchased with the caveat that liquidity crises produce clustered losses.

### Pricing sketch used in exhibits

Hypothetical convertible: maturity **7 years**, coupon **10%**, issuer’s straight debt yield **10%**. Exhibit 4.2 compares convertible values when the general level of rates is **10% vs 9%** (100 bp parallel shift), illustrating interest-rate sensitivity (rho / duration) even for equity-sensitive converts.

### Staples 5% convertible due 1999 — delta hedge worked example

- Purchase price: **\$965** (per \$1000 face convention in exhibit arithmetic)
- Staples stock: **\$31.50**
- Delta-neutral short: **12.3 shares** (exhibit also uses 12.25 in return table)
- Interest-rate hedge ratio: **\$2.09** per 100 bp (Treasury or futures DV01 match)

**Standstill return (Exhibit 4.3):**

| Component | Amount |
|-----------|--------|
| Short rebate @ 85% of 2.96% | \$9.75 |
| Dividends paid on short | \$0.00 |
| Coupon income (implied in full exhibit) | (included) |
| **Standstill % return** | **6.19%** |

Portfolio value at stock **\$31.50**: **\$579**. If stock **−\$1**: value **\$579.25**; if stock **+\$1**: **\$579.75**—near-flat delta, small gamma residual (embedded optionality ⇒ return not exactly zero under ±\$1 moves; net changes **+\$0.25 / +\$0.75** in Exhibit 4.4 alongside convertible fair-value moves to **\$953 / \$965 / \$978** and short-stock legs **\$373.75 / \$386.00 / \$398.25**).

### Simulation assumptions & results

- Universe: convertibles / preferreds with size at least **\$100M**
- Short rebate: **85% of 3M T-bill**
- Stock transaction cost: **\$0.10/share** each way; bond cost **1 point (\$10 per \$1000 face)**; futures round-trip **\$20/contract**
- Result over **90 months**: average monthly return **75.53 bp** ⇒ **9.06%/yr** unlevered; average monthly excess over T-bills **30.37 bp** ⇒ **364 bp/yr** excess; only **19 of 90 months** negative (chapter’s count)
- Soft-dollar / friction note: equity trading costs on the order of **\$0.69/share** in some comparative discussion

### Leverage & crises

With Reg-T-style capacity (~\$1 long + \$1 short per \$1 equity), convertible books often run leveraged. Liquidity crises in **1987, 1990, 1994, 1998** are flagged as periods when hedges held delta-wise still lost money from **spread widening, financing stress, and forced deleveraging**. Duration of converts is sometimes called **rho** in the chapter’s terminology.

**Quant takeaway:** CA “market neutrality” is **local** (small stock moves) and **model-dependent**; standstill carry (~6% in the Staples example; ~9% unlevered simulated) is the compensation for crash/liquidity convexity that is not spanned by a static delta hedge.

---

## Expanded Chapter 5 — Sovereign FI Arbitrage: Basis, CTD, and Curve

### Cross-market motivation

Over a decade preceding publication, Canada–US government yield spreads moved by as much as **~300 bp** while outright yields moved **~400 bp**, and FX moved from **~1.12 to ~1.60** CAD per USD—so naked cross-country yield trades embed large FX and spread risks; true RV needs FX and duration hedges.

### Gilt cash-and-carry example (Exhibit 5.1) — UKT 7.25% Dec 2007 vs Mar 1999 gilt futures

- Start price **118.13**; gross basis **−0.1410**; net basis **−0.0577**
- Start accrued **£203,402.74**
- Forward/delivery arithmetic around invoice price **~118.213628**
- Futures hedge notional example **£10.2M**
- Delivery basket: coupon gilts with maturity **8.75–13 years**

**Short basis trade (Exhibit 5.2):** notional **£10M**, net basis **~0.058**; profit identity:

$$
\text{Profit} \approx \frac{\text{Notional}}{100}\times \text{Net basis}
$$

(if net basis converges to zero at delivery as expected for CTD).

### Conversion factors & CTD switching

Notional futures coupon convention **8% semiannual** (period example). Conversion factor ≈ price the bond would have at **8%** yield on delivery date. High-coupon vs low-coupon bonds:

- Example bonds due **1 Jan 2002**: **6.25%** vs **12%** coupons—when prices rise, higher-coupon bond’s % price change is smaller (**7.73% vs 8.14%** in exhibit)—duration differences drive CTD switches.
- **8% Jul 2002** has lower duration than **4.5% Aug 2002** ⇒ becomes CTD as yields fall.

### CTD probability / basis table (yield-shock grid)

Exhibit walks yield shocks from **−90 bp to +80 bp** showing CTD flip:

| Shock (bp) | Illustrating price path | CTD | Approx CTD probability |
|------------|-------------------------|-----|------------------------|
| −90 to −70 | ~106.8 → 106.2 | 8% 7/2002 | ~100% → 99.6% |
| −40 | ~105.16 | 8% 7/2002 | ~95% |
| 0 (UNCH) | ~103.83 / fut ~104.90 | 8% 7/2002 | ~73.9% |
| +10 | | 8% 7/2002 | ~65% |
| +30 | fut ~105.22 | **switches to 4.5% 8/2002** | ~54.7% |
| +80 | | 4.5% 8/2002 | ~82.4% |

Net basis for the 8% Jul 2002 is near zero when it is firmly CTD (market above ~**102.83** in the chapter’s telling) and widens when delivery option value rises. **Quality option** value is the futures short’s right to deliver the cheapest bond—traders long basis (long bond / short futures) are **short the quality option**.

### Duration hedging (Exhibit 5.6)

When CTD switches, a duration hedge calibrated to the old CTD mis-hedges. Maltby’s prescription: scenario grids over yield **level, slope, and butterfly**, recompute CTD and DV01, and treat delivery-option vega as a first-class risk—not a footnote.

**Quant takeaway:** sovereign “arbitrage” P&L is often **delivery-option and repo specialness** P&L, not risk-free convergence; neutrality requires matching not only DV01 but **CTD-state-contingent DV01**.

---

## Expanded Chapter 6 — MBS Market Neutral: OAS, Key-Rate Durations, Case Trades

### OAS is not enough (Exhibit 6.1)

July 1997 comparison:

| Security | OAS | Fast OAS (1.5× prepays) | Slow OAS (0.75×) | Realized ann. return |
|----------|-----|-------------------------|------------------|----------------------|
| FHR 1971 S | **1113** | **−874** | **1989** | **−29.84%** |
| FHR 1688 SA | **333** | **−360** | **601** | **+12.88%** |

The high-OAS bond’s OAS collapsed under fast prepay scenarios and realized catastrophic returns; the “cheaper” looking OAS was a mirage without prepayment-stress OAS. **Rule:** report OAS under base, fast, and slow paths; trade only if the edge survives.

### Collateral differences

FHR 1899 SB from **8%** pass-through, WAC **8.504%**; companion structures with WAC **8.579%**—**7.5 bp** higher average coupon ⇒ faster expected prepays. Speed **125%** means **1.25×** base CPR vector. 1994’s dramatic prepay slowdown punished profiles that needed fast prepays.

### Key-rate duration (Exhibit 6.3)

FNR 1993-178 SD: coupon formula linked to **10-year** rates (inverse floater–like sensitivity). OAS engines typically simulate **360 monthly** cashflow nodes (30y × 12); full key-rate hedging across all nodes is impractical—managers hedge principal KRDs (2y, 5y, 10y, 30y) and accept residual.

### Duration-hedged trade (Exhibit 6.4) — FHLMC 1468 SC

| Date | Price | 10y yield | Hedged level | P&L vs start |
|------|-------|-----------|--------------|--------------|
| 23 Jan 1993 | 99.53 | 6.38% | 99.53 | — |
| 4 Aug 1993 | 116.00 | 5.85% | **111.32** | **+4.68 pts** |
| 14 Nov 1994 | 69.00 | 7.94% | **65.34** | **−3.66 pts** vs start if held |

A Jan→Aug 1993 hold earned **+4.68** points net of duration hedge as yields fell **53 bp**; holding through Nov 1994 (yields **7.94%**) produced large losses—hedge did not protect against **spread/structure/prepay** moves. Separately, a security with effective duration **~14** saw the 10-year yield drop **157 bp**; a duration-matched short 10y hedge would have suggested large offsetting gains, but **option/negative convexity** and eventual payoff in Jan 1999 made static duration hedging insufficient—**option hedges** were required.

### Inverse floater / support tranche risk

Chapter discusses securities that can become **~\$80** prices with large positive prepay exposure when rates fall; duration near **22** means **~22%** price move per 100 bp—lethal if mis-signed. 1998 rate rally and prepay surge are the living laboratory.

**Quant takeaway:** MBS market-neutral books must constrain **OAS-under-stress**, **prepayment duration**, **convexity**, and **KRD buckets**, not headline OAS alone. Askin’s failure (Ch.9) is the extreme of ignoring this.

---

## Expanded Merger Arbitrage Econometrics (Chapter 7 Addendum)

### Piecewise CAPM specification

$$
r_{MA,t}-r_{f,t}=\alpha+\beta^{+} \max(r_{m,t}-r_{f,t},0)+\beta^{-}\min(r_{m,t}-r_{f,t},0)+\varepsilon_t
$$

Estimates reported: full-sample HFR β≈**0.14**; down-market β≈**0.44** (significantly ≠ 0). Interpretation: merger arb sells a put on the market via deal-break correlation with risk-off episodes.

### Growth-of-\$1 (Exhibit 7.8)

From Dec 30, 1989 through the sample, \$1 in merger arb compounds above T-bills with lower drawdowns than equities in many periods but still experiences synchronized hits in **1987, 1998, 2001**—consistent with insurance underwriting: many small premiums, occasional large claims.

### Hostile vs friendly

Failure probability **~30%** hostile vs **<10%** friendly—spread must compensate. Antitrust second-request rate **~2–3%** of HSR filings is a separate jump channel.

---

## Expanded Alpha Transport Mathematics (Chapter 8 Addendum)

### Futures equitization cash identity under ±100% shock (Exhibit 8.2)

If securities long and short and futures all rise 100%:

- Short marks owe lenders **+\$9M** (on original \$9M proceeds)
- Futures variation on \$10M notional pays **~\$10M**
- Net can pay lenders and leave **~\$1M**, but futures margin must be restored (**~\$0.5M**), leaving buffer tight—same engineering problem as pure MN but with futures margin layered on.

### Policy portfolio variance

If **>90–97%** of return variance is asset-allocation policy, then the rational active budget is to maximize **IR of portable alpha** subject to overlay tracking error, not to maximize information ratio inside a constrained long-only sleeve that also bears unwanted beta relative to policy.

### Cost budget

Implementation drag up to **~1%/yr** from margin, roll, and swap spreads must be subtracted from α before declaring portability “free.”

---

## Risk-Management Checklist Derived from Chapter 9 Failures

| Control | Askin failure mode | LTCM failure mode | Control metric |
|---------|--------------------|-------------------|----------------|
| Liquidity buffer | ~5% too small | Financing run | Buffer / monthly 99% VaR ≥ X |
| Duration / factor model | Model duration ≠ empirics | Quiet correlations | Stress CRAR / PCA shocks |
| Valuation | Broker mark disputes | Mark-to-model opacity | Independent marks; IPV |
| Leverage | High on illiquids | 25–100× | Gross & net; haircut-adjusted |
| Crowding | Niche CMO dealers | Relative-value community | Position / open interest limits |
| Capital policy | — | Returned \$2.7B keeping risk | Leverage ceiling if capital leaves |
| Transparency | Investors surprised | Counterparties surprised | Regular risk reporting |

---

## Mapping Book Concepts to Modern Quant Stack (2020s lens)

Although the book is 2005-dated, its structures map cleanly onto modern tooling:

1. **Integrated L/S optimizer** → quadratic/conic optimizers with factor covariance (Barra/Axioma-style) and short-borrow constraints.
2. **Buffer & margin** → prime-broker portfolio margin / REGSHO locate feeds.
3. **Portable alpha** → total-return swaps and listed futures; cleared OTC.
4. **Merger arb β_down** → regime-switching risk models; “insurance” capital charges.
5. **MBS OAS stress** → pathwise prepay Monte Carlo with rate-vol surfaces; KRD limits.
6. **Tax/ERISA** → still binding; after-tax optimizers and 40-Act / Cayman feeders.

---

## End-to-End Example: Building a \$100M Equity MN Book Using Chapter Rules

1. **Capital:** \$100M. Set buffer $b=10\%$ ⇒ \$10M cash; deploy \$90M long + \$90M short.
2. **Signal:** forecast residual returns $\hat{\alpha}_i$ from a multi-factor model; winsorize; subtract borrow fee $f_i$ from short-side α.
3. **Optimize:** maximize $w^{\top}\hat{\alpha} - \lambda w^{\top} V_{\varepsilon} w$ s.t. $\sum w^{+}=0.9$, $\sum w^{-}=-0.9$, $\beta^{\top}w=0$, industry $B^{\top}w=0$, $|w_i|\le 1.5\%$, ADV limits, turnover ≤ 10%/month.
4. **Expected return (illustrative):** if spread on deployed = 6%/yr and rebate = 4%/yr, then  
   $R \approx 0.9\times 6\% + 0.9\times 4\% + 0.1\times 4\% = 5.4\% + 3.6\% + 0.4\% = 9.4\%$ before costs/fees.
5. **Risk:** target residual σ = 8%/yr on capital ⇒ IR ≈ 9.4/8 ≈ 1.2 before costs; after 2% costs/fees IR ≈ 0.9.
6. **Equitize (optional):** overlay \$100M S&P futures; expect $r_m + 9.4\% - \text{drag}$.
7. **Daily:** monitor β, margin cushion under ±20% and ±50% shocks (scale Exhibit 3.7), borrow recalls, tax lots if taxable.

This is precisely the operationalization of Chapters 2–3 and 8.

---

## Conclusion

Jacobs & Levy’s *Market Neutral Strategies* delivers a complete institutional blueprint: ** mechanized capital accounts, neutrality definitions, strategy-specific empirics (especially merger arb), portable-alpha engineering, and forensic leverage/liquidity lessons**. The quantitative spine is the set of **\$10M exhibits** showing that MN return ≈ cash + long–short spread, that rallies stress margin via short marks, that equitization adds market return on top, and that “neutral” labels without stressed factor tests (MBS OAS, CTD grids, merger β_down) are hazardous. For a quantitative investor’s library, this volume is the **systems-and-controls** counterpart to later factor tomes (e.g., Ang 2014): it tells you how to *hold* alpha once you believe you have it.



---

## Deep Dive: Chapter 10 Tax Architecture for Market-Neutral Books

### Short-sale gain/loss recognition (IRC §1233)

Gain or loss is generally recognized when the short is closed by delivering securities to the lender. Character is typically capital if the asset is a capital asset, but **holding-period rules are special**—Congress designed them to prevent converting short-term gains into long-term via short sales.

**Core holding-period rules (chapter’s Rules 1–3):**

- **Rule 1:** If on the short-sale date the taxpayer held substantially identical securities for **≤1 year** (or acquired them before closing), the gain on close can be **short-term**, and the holding period of the substantially identical securities can be tolled.
- **Rule 2 / related:** Mechanics tying the closed short’s character to the holding period of securities used to close.
- **Rule 3:** If substantially identical securities are held on the short-sale date, special suspension of holding period applies.

Exhibit 10.1 walks dated examples (e.g., short initiated mid-1999, closed January 2000 with shares acquired on specified dates) showing how a sequence that looks “long-term” economically can be forced short-term under §1233 and Treas. Reg. §1.1233-1.

### Constructive sales (IRC §1259)

“Short against the box” and similar hedges of **appreciated financial positions** can trigger immediate gain recognition as a constructive sale:

- Entering a short of substantially identical stock against an appreciated long (§1259(c)(1)(A))
- Entering certain offsetting positions including futures/forwards (§1259(c)(1)(D) family)

Consequences: recognize gain as if sold; basis adjustments; holding period restarts in part (§1259(a)). Safe harbors exist for temporary hedges that sufficiently leave risk with the taxpayer (§1259(c)(3) interactions with §246(c)(4) concepts). **For market-neutral managers running pair trades in names also held long in another sleeve, §1259 is a hard constraint.**

### Payments in connection with shorts

- Stock-loan **premium / borrow fee**: generally ordinary; deductibility for individuals may be constrained as investment interest / miscellaneous deduction regimes (chapter cites §§67, 163(d), 265 interactions—rules evolve; principle: not all hedge costs are cleanly deductible against capital gains).
- **Payments in lieu of dividends:** short seller pays PIL to the lender. After the 2003 Tax Act, **qualified dividend income** for individuals was taxed at preferential rates (then **15%** under §1(h)(11)). PIL generally **does not** qualify—creating the chapter’s warning that shorts of high-dividend stocks convert preferential dividend income into ordinary character economically on the combined book.
- Special rules if the short has been open for required periods (chapter discusses **46-day**-type holding concepts for certain dividend-related provisions) and anti-abuse aggregation when cash dividends ≥ **10%** (or **5%** for preferred) within windows (§263(h) themes).

### Puts as short sales; arbitrage exception

Acquiring puts can be treated as short sales for holding-period purposes. **Arbitrage operations** receive special statutory treatment under §1233(f): when shorts are part of bona fide arbitrage (e.g., convertible arb hedges established “as soon as practicable”), certain holding-period taints are relaxed—**critical for convertible bond hedging (Ch.4) and merger arb (Ch.7)**. Exhibit 10.2 illustrates Rule 2 applicability with dated common-stock short examples (Nov/Dec 1999 closes).

### Merger arbitrage tax issues

- Constructive sale risk if long target + short acquirer is interpreted as hedging an appreciated position—analysis depends on whether positions are “substantially identical” (generally **not** for different issuers) vs other §1259 prongs.
- Stock vs cash deals: basis and holding period in stock consideration; collar structures complicate timing.
- Convertible debt acquired in nontaxable exchanges: basis carries over; amortization elections affect character.

### Notional principal contracts (NPCs), caps/floors, options, §1256

Portable-alpha and hedge overlays often use swaps (NPCs):

- NPC regulations treat the contract as a **unitary instrument**; periodic payments have specific timing; nonperiodic payments allocated over life.
- Character: generally ordinary for periodic swap payments (practitioner consensus / guidance discussed); hedge identification can alter treatment.
- Listed options / §1256 contracts: **60/40** long-term/short-term character marking; straddles with SFCs interact badly with intended character.
- Holding an SFC and shorting underlyings can create straddle or constructive-sale issues.

### Straddle rules for stock (§1092)

A straddle exists with **offsetting positions** substantially diminishing risk. Consequences:

- **Loss deferral** on the loss leg until unrecognized gain on offsetting positions is recognized
- **Interest and carrying-charge capitalization** possibilities
- **Modified short-sale holding-period rules**
- Mixed straddles (some §1256 legs) create character recharacterization

Exceptions (e.g., qualified covered call options—QCCO under §1092(c)(4)) are narrow and term-limited. **A multi-factor market-neutral book can inadvertently create straddles** across correlated names or index futures vs stock baskets—tax-aware optimizers must flag offsetting positions.

### Practical tax-aware optimization constraints

$$
\begin{aligned}
&\text{Maximize } \mathbb{E}[r_{\text{after-tax}}] - \lambda \sigma^2\\
&\text{s.t. no §1259 constructive sale vs locked-in LT gains}\\
&\text{s.t. avoid §1092 straddles unless identified mixed-straddle election}\\
&\text{s.t. prefer low-dividend shorts if } \tau_{\text{QDI} < \tau_o}\\
&\text{s.t. convertible/merger shorts tagged as §1233(f) arbitrage where applicable}
\end{aligned}
$$

---

## Deep Dive: Chapter 11 — Tax-Exempt & ERISA Constraints as Portfolio Limits

While less formula-driven than Ch.10, Ch.11’s constraints bind like risk limits:

1. **UBTI from debt-financed income / dealer activity** inside partnerships → prefer offshore corporate blockers or total-return swaps for leveraged MN.
2. **Plan-asset look-through** if ERISA ownership exceeds thresholds → manager becomes ERISA fiduciary; prohibited-transaction regime applies to prime brokerage, soft dollars, affiliated lending.
3. **QPAM / PTE reliance** for ordinary trading.
4. **Custody and rehypothecation** limits differ from offshore HF norms—margin efficiency may be lower, reducing feasible gross leverage vs the book’s \$9/\$9 on \$10 examples.

**Allocator’s quantitative translation:** haircut expected IR by structural cost $c_{\text{struct}}$ (blocker fees, reduced leverage, narrower short universe):

$$
IR_{\text{net}} = \frac{\alpha - c_{\text{struct}}}{\sigma}
$$

---

## Consolidated Formula Sheet (All Chapters)

**Dollar neutrality:** $\sum_i w_i^{+} = -\sum_i w_i^{-} = d$

**Beta neutrality:** $\sum_i w_i\beta_i = 0$

**MN return:** $r_{MN}=d(R_L-R_S)+r_{\text{rebate}}d+r_f(1-d)-\text{costs}$

**Equitized:** $r_{EQ}\approx r_M + r_{MN} - \text{drag}$

**Merger implied fail prob.:** $q\approx\frac{e^{r\Delta t}T-X}{V_f-X}$

**Convertible delta hedge:** $n_S=\Delta\cdot n_{\text{conv}}$

**FI butterfly DV01 flat:** $\sum_k N_k\,\mathrm{DV01}_k=0$

**MBS stress screen:** trade only if $\mathrm{OAS}_{\text{fast}}>0$ and $\mathrm{OAS}_{\text{slow}}>0$ at sized limits (counterexample: OAS 1113 with fast OAS −874)

**Margin after parallel MV shock $s$:** require $\frac{C}{(1+s)(L+S)}\ge m_{\text{maint}}$ or delever

**After-tax α:** apply $\tau_o$ to rebate/PIL/ST; $\tau_c$ to LT; subtract straddle drag

---

## Bibliographic & Series Context

Part of the Frank J. Fabozzi Series alongside Fabozzi’s fixed-income and derivatives handbooks. Companion theoretical roots: Jacobs & Levy’s 1980s–90s work on “disentangling” inefficiencies and integrated long–short optimization; Pulvino’s merger-arb empirics; practitioner chapters from Och-Ziff, Clinton Group, DKR, PAAMCO. Readers should pair with:

- Modern portable-alpha / risk-parity literature for post-2008 overlay design
- Ang (*Asset Management*, 2014) for factor-theoretic foundations of why residual risks earn premia
- Burghardt–Belton for deeper Treasury basis than Ch.5’s gilt examples
- Current IRC/ERISA updates replacing 2005 rate and exemption details

---

## Closing Peer Assessment

This book earns its shelf space not as a source of novel asset-pricing anomalies but as the **canonical institutional description of market-neutral *plumbing***: capital accounts, neutrality, equitization, strategy-specific risk, and tax/ERISA. The numerical exhibits—**10.4% MN returns from 5% cash + 5.4% spread**, **equitized 35.4%/−9.6%**, **merger β_down 0.44**, **Askin ~\$600M loss / durations ~15**, **LTCM 59% on ~2.45% ROA**, **convertible standstill 6.19% / simulated 9.06% unlevered**, **MBS OAS 1113 that realized −29.84%**—are the durable quantitative memory a research team should encode into investment-policy statements and risk manuals.



---

## Appendix to These Notes: Chapter-by-Chapter Reading Guide for Quants

| Ch | Pages (approx from TOC) | Quant intensity | Must-extract artifacts |
|----|-------------------------|-----------------|------------------------|
| 1 Intro | 1–8 | Low | Definition of integrated optimization; alpha vs beta separation |
| 2 Q&A | 9–20 | Medium | 0.01% underweight capacity; optional leverage \$50/\$50 on \$100 |
| 3 Equity MN | 21–46 | **Very high** | Exhibits 3.1–3.7 capital accounts; 10.4% worked returns; margin 27.8% under +100% |
| 4 Convertible | 47–58 | High | Staples delta 12.3 sh; standstill 6.19%; sim 75.53 bp/mo; 364 bp excess |
| 5 Sovereign | 59–84 | High | Gilt net basis −0.0577; CTD grid −90..+80 bp; quality option |
| 6 MBS | 85–106 | High | OAS 1113 vs 333 stress table; FHLMC 1468 SC +4.68/−3.66; dur ~14–22 |
| 7 Merger | 107–130 | **Very high** | Spreads 1–3%; Odwalla/HP–CPQ; β=0.12–0.14; β_down=0.44; +9.9%/−18.8% |
| 8 Transport | 131–146 | High | Equitized 35.4%/−9.6%; swap portable alpha \$10M example; ~1% drag |
| 9 Failures | 147–172 | High | Askin \$600M, dur 10–15; LTCM 59%/57%/25%, \$1.8B Aug loss, \$3.6B bailout |
| 10 Taxable | 173–222 | High (legal) | §1233, §1259, §1092, QDI 15%, PIL, NPC, §1256 |
| 11 ERISA | 223–244 | Medium | UBTI, plan assets, QPAM |
| 12 Afterword | 245–250 | Low | Synthesis |

### Replication exercises for a research team

1. Rebuild Exhibit 3.2 in Python/Excel; verify 10.4% identity.
2. Estimate piecewise merger-arb β on modern HFR/CSFB indices; compare to 0.44.
3. Reprice a sample convertible; match delta hedge P&L flatness to Exhibit 4.4.
4. Run a gilt or Treasury CTD grid; reproduce switch probabilities qualitatively.
5. Take a high-OAS CMO; compute OAS under 0.75×/1.5× prepays; apply Exhibit 6.1 lesson.
6. Stress a 10% buffer MN book under +50%/+100% shocks; design auto-delever rule.
7. Compute after-tax IR for a 100% turnover MN book at ordinary vs QDI rates.

### Why this book still matters operationally

Factor models and execution have improved since 2005, but **prime-broker margin math, short-rebate accounting, portable-alpha overlays, deal-spread insurance economics, and tax straddles** remain the difference between a backtest and a live fund. Jacobs & Levy’s insistence on **integrated** long–short optimization anticipates modern portfolio construction: the short book is not an afterthought overlay on a long-only process. Combined with Pulvino’s empirical warning that merger arb’s crash beta is a multiple of its average beta, and with the Askin/LTCM forensic chapters, the volume supplies a complete **risk culture** for market-neutral investing.

### Final quantitative one-pager (pin to the risk committee pack)

- Neutrality ≠ dollar matching; require $\beta$ and factor neutrality.
- MN return ≈ rebate + residual spread; benchmark to cash.
- Buffer ≥ 10% baseline; test +100% rally margin.
- Merger arb: underwrite deals; capitalize for β_down≈0.4+.
- MBS: reject trades whose fast-prepay OAS is negative despite rich headline OAS.
- FI basis: model CTD option; don’t assume fixed hedge ratio.
- Convertibles: delta is local; budget liquidity crises.
- Leverage transforms 2% ROA into 50% ROE—and into ruin when correlations spike.
- Taxable: optimize after-tax; avoid §1259/§1092 traps.
- ERISA: structure before sizing.

These notes preserve the book’s numerical substance at peer quant level for Giuseppe Paleologo’s finance library summarization project.



---

## Additional Notes from Chapter 11 Themes and Investor Categories

Tax-exempt organizations (pension plans, endowments, private foundations) confront a different objective function than taxable HNWI investors. The chapter walks through:

- **Private foundations and excise taxes** on investment income—market-neutral turnover can affect excise-tax computations differently than long-only buy-and-hold.
- **Charitable remainder trusts and other split-interest vehicles** where UBTI can have punitive effects (including potential loss of tax-exempt status in extreme cases historically discussed in practitioner literature).
- **Foreign investors** and FIRPTA / effectively connected income issues when shorts and partnerships are involved.
- **Insurance company separate accounts** as another channel with statutory investment constraints resembling “neutrality plus admissibility” rules.

ERISA fiduciary process requirements mean that adopting market-neutral strategies requires IPS language covering: (i) role of alpha vs beta; (ii) leverage and counterparty limits; (iii) valuation and liquidity procedures; (iv) manager watch-list criteria after Askin/LTCM-type events. From a quant perspective, these are **governance constraints** that belong in the same layer as risk-model constraints.

### Interaction of Chapters 8 and 11

Portable alpha overlays using futures are often ERISA-friendlier than total-return swaps with offshore dealers, but futures require liquidity and roll management. Swaps can embed financing advantageous to plans yet raise counterparty and documentation burden (ISDA, collateral annexes). The optimal overlay is a constrained optimization:

$$
\max \mathbb{E}[r_{\text{overlay}}+r_{MN}] - \lambda \sigma^2 - \mu\, c_{\text{legal}} - \nu\, c_{\text{counterparty}}
$$

### Interaction of Chapters 7 and 10

Merger arb taxable accounts must track deal terms for tax-free reorganization treatment vs taxable cash deals; mistaken character assumptions distort after-tax expected spreads. A 1–3% pre-tax deal spread can be acceptable pre-tax IR yet fail after-tax hurdle if forced short-term and stacked with PIL on the short acquirer leg (stock deals).

### Interaction of Chapters 4 and 10

Convertible arb’s §1233(f) arbitrage exception is operationally valuable only if hedges are established promptly and books document arbitrage intent—another example where **process** creates **tax alpha**.

---

## Statistical Summary Table of All Headline Numbers in the Volume

| Metric | Value | Source chapter |
|--------|-------|----------------|
| Example MN capital | \$10M | 3, 8 |
| Long/short deployment | \$9M / \$9M | 3 |
| Liquidity buffer | 10% (\$1M) | 3 |
| Bull/bear example MN return | 10.4% | 3 |
| of which cash/rebate | 5.0% | 3 |
| of which L/S spread on capital | 5.4% | 3 |
| Margin after +100% shock | 27.8% | 3 |
| Equitized bull / bear | 35.4% / −9.6% | 8 |
| Overlay margin | ~5% of notional | 8 |
| Implementation drag (upper) | ~1%/yr | 8 |
| CA historical reported returns | 13–16%/yr | 4 |
| CA sim unlevered | 9.06%/yr; +364 bp vs T-bills | 4 |
| CA standstill example | 6.19% | 4 |
| Staples delta short | 12.3 shares @ \$31.50 | 4 |
| Merger announcement jump | ~20%+ | 7 |
| Typical deal spread | 1–3% | 7 |
| Fail drawdown order | ~25% | 7 |
| Success / fail avg returns | +9.9% / −18.8% | 7 |
| Avg success horizon | ~3.5 months | 7 |
| MA β (HFR / sim) | 0.14 / 0.12 | 7 |
| MA β_down | 0.44 | 7 |
| Hostile fail rate | ~30% vs <10% friendly | 7 |
| HSR second request | ~2–3% | 7 |
| Askin target / loss | 15–25% target; ~\$600M losses | 9 |
| Askin effective duration | ~10–15 | 9 |
| LTCM 1995–96 returns | +59%, +57% | 9 |
| LTCM Aug 1998 loss | \$1.8B | 9 |
| LTCM bailout | \$3.6B for ~90% | 9 |
| LTCM notional derivatives | >\$1T | 9 |
| MBS OAS example pair | 1113 vs 333 | 6 |
| Realized returns that pair | −29.84% vs +12.88% | 6 |
| Canada–US spread move | up to ~300 bp | 5 |
| QDI preferential rate (then) | 15% | 10 |
| Policy variance from allocation | >90–97% | 8 |

This table is the minimal dataset a new team member should memorize before touching a market-neutral mandate informed by this book.



---

## Selected Mechanistic Details from Chapters 1–2 (Expanded)

Chapter 1 situates market-neutral investing historically with **A.W. Jones (1949)**, conventionally cited as the first hedge fund combining longs, shorts, and leverage. The editors argue that what is new for institutional investors is not the existence of long–short but the **integration of long–short into pension-quality risk systems** and the separation of alpha from beta via equitization. They preview that failures in Chapter 9 arose from “lack of” liquidity, transparency, and appropriate leverage—not from neutrality as a concept.

Chapter 2’s Q&A clarifies several allocator misconceptions:

1. **“Isn’t shorting un-American / too risky?”** Risk is optional in sizing: \$50 long/\$50 short on \$100 capital matches the dollar risk of \$100 long-only while enabling two-sided views.
2. **“Does market neutral eliminate all risk?”** No—only systematic market risk (when properly built). Residual risk remains and is the source of expected active return.
3. **“Can I just combine a long fund and a short fund?”** Weakly. Without joint optimization, factor exposures cancel incompletely and transaction costs rise; the information ratio suffers.
4. **“What about unlimited losses on shorts?”** Individually true; portfolio-level risk is managed via diversification, hard position caps, and stop/delever rules—analogous to managing long gaps.
5. **“How does financing work?”** Short proceeds earn rebate; hard-to-borrow names pay fees; cash buffer earns interest; all are first-order return components, not noise.
6. **“Benchmark?”** Cash for pure MN; overlay index for equitized MN; peer HF indices are descriptive, not normative benchmarks for institutional mandates.

These allocator-facing answers encode the same mathematics as Chapter 3’s exhibits without requiring trustees to read balance-sheet tables.

### Information-ratio algebra linking Ch.3 and Ch.8

Let $\alpha_{LS}$ be expected long–short spread on deployed capital fraction $d$, $\sigma_{LS}$ residual volatility on deployed, $r_c$ cash rate on all capital effectively (rebate≈buffer rate for simplicity):

$$
\mathbb{E}[r_{MN}] = d\,\alpha_{LS} + r_c,\quad \sigma_{MN}=d\,\sigma_{LS}
$$

$$
IR_{MN}=\frac{d\alpha_{LS}}{d\sigma_{LS}}=\frac{\alpha_{LS}}{\sigma_{LS}}
$$

Equitized with overlay volatility $\sigma_M$ and correlation of residual to market $\approx 0$:

$$
\sigma_{EQ}\approx\sqrt{\sigma_M^2+\sigma_{MN}^2},\quad \mathbb{E}[r_{EQ}]\approx \mathbb{E}[r_M]+d\alpha_{LS}
$$

so the **total-portfolio Sharpe** depends on the policy mix of $\sigma_M$ and the portable IR—exactly the portable-alpha budgeting problem pensions face when >90% of variance is policy beta.

### Why residual risk budgeting beats ad hoc pair trading

Pair trades ($w_i=+w, w_j=-w$) neutralize one factor if $\beta_i\approx\beta_j$ but leave industry and style residues. Portfolio optimization with $B^{\top}w=0$ neutralizes many factors simultaneously, freeing the risk budget for idiosyncratic α. This is the editors’ long-standing critique of “pairs as strategy” versus “pairs as special case of optimized MN.”

