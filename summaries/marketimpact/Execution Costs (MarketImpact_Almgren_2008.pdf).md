# Execution Costs

**Author:** Robert Almgren  
**Publication:** *Encyclopedia of Quantitative Finance* entry; dated 17 December 2008  
**Source PDF:** `MarketImpact_Almgren_2008.pdf` (Drive id `1Eo20GjgEvhaUym1ngKASQRnHC_EZTQNm`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_2)  
**OCR:** Not required; clean `pdftotext -layout` extract (~3,494 words of source; 5 pages)

---

## 1. Problem and Motivation

Execution costs are the difference in value between an *ideal* trade and what was actually done. For a completed trade the cost is typically the difference between the final average trade price (including commissions, fees, and all other costs) and a suitable **benchmark** representing a hypothetical perfect execution. The sign convention is that **positive cost = loss of value** (buying higher or selling lower than the benchmark). Costs can be negative if price drifts favorably during a purchase program, or if the chosen benchmark (e.g., same-day close) sits above the average fill on a buy.

If a trade is incomplete—endogenously (price moves through a limit) or exogenously (trader illness, system failure)—some value must still be assigned to unexecuted shares. Portfolio-level cost is a size-weighted average of individual executions.

Almgren separates **direct/predictable** costs (commissions, taxes, exchange fees)—often excluded from quantitative execution-cost analysis despite being material—from **indirect** costs: limited liquidity (market impact) and price motion from volatility. Indirect costs are harder to measure and more improvable. Equity markets have the most mature measurement technology; other asset classes remain less developed.

A well-calibrated execution-cost model is required at three layers of the investment process (Grinold–Kahn 1999): (i) evaluating the trading desk and brokers against pre-trade forecasts; (ii) feeding anticipated costs into portfolio construction alongside expected alpha; (iii) choosing optimal trade schedules. The encyclopedia entry organizes the subject in reverse chronological order from a single trade’s viewpoint: **post-trade reporting → optimal trading → pre-trade estimation**.

---

## 2. Setup and Benchmarks (Post-Trade Reporting)

### 2.1 Implementation shortfall and arrival price

The most common benchmark is the **arrival price**: the quoted market price when the order is released to the desk. A zero-cost trade would execute instantaneously at arrival. Cost vs arrival is Perold’s (1988) **implementation shortfall**: “on paper you transact instantly, costlessly, and in unlimited quantities… look at the current bid and ask, and consider the deal done at the average of the two.”

**Example.** Overnight decision assumes purchase at prior close \\$50. Trade completes at average \\$50.25 → reported cost **25¢/share**. But costs are only part of the picture: if the stock closes at \\$51, the PM’s decision still looks good; a naïve attribution might credit the PM +\\$1 and the trader −\\$0.25. Forecast costs on any single order have very high uncertainty from volatility and other randomness.

### 2.2 Alternative benchmarks

- **VWAP** over the execution interval: popular for assessing execution *quality* because it largely filters volatility; does **not** correspond directly to an investment goal.
- **Post-trade price** (e.g., same-day close): completes the before/during/after triad typical reporting systems display.

### 2.3 Aggregation rules

When aggregating across heterogeneous trades:

- Costs in **¢/share** → weight by **shares**.
- Costs in **basis points** → weight by **dollar value**.

Goal: the aggregate should represent overall change in portfolio value. Also report **standard deviation** of costs (same size weights as the mean) as a reality check on mean significance. Example: if sample SD = 25 bp on 100 independent trades, SE of the mean ≈ 2.5 bp, so a 1–2 bp mean change is insignificant.

**Subdivision pathology.** Aggregate cost numbers are generally **not** indifferent to splitting blocks. Buying 100,000 shares vs arrival at the open differs from treating 40,000 morning + 60,000 afternoon with midday arrival for the second block—the overall reported cost falls. VWAP or a fixed-time benchmark (close) avoids this artifact. Choice requires knowledge of the investor’s goals.

### 2.4 Limits and incomplete fills

A buy at \\$50 with a \\$50.05 cap guarantees impact ≤5¢ but may leave most of the order unfilled. Valuing unexecuted shares has **no simple rule**; marking them at the close is often too stringent and ignores why trading stopped. Cost reporting must embed the entire investment process (limits, urgency, alpha decay), not only fills.

### 2.5 Forecast vs realized

If a pre-trade model exists, compare realized vs forecast at trade and portfolio level—both to flag bad executions and to keep the model calibrated.

---

## 3. Optimal Trading

Once measurement exists and “good trade” criteria are agreed, design strategies. Best execution is both economically valuable and often **regulatory**. Primary goal: reduce **mean** execution cost (market impact + uncaptured short-term alpha). Secondary: reduce **cost volatility** to cut overall investment volatility (Engle–Ferstenberg 2007).

### 3.1 Liquidity in space and time

- **Space:** access as many venues and counterparties as possible—exchanges, dark pools, block crossing. US equity market structure complexity: Hasbrouck (2007, Appendix).
- **Time:** slow trading to let counterparties arrive. Absent significant short-term drift, average costs generally fall with slower trading.

### 3.2 The urgency trade-off

Alford–Jones–Lim (2003) summarize: “Trading each stock quickly minimizes lost alpha and price uncertainty due to delay, but impatient trading incurs maximum impact. … Trading more patiently … reduces market impact but incurs larger opportunity costs and short-term execution price risk.” Optimal schedules balance impact, alpha decay, and volatility; may adapt dynamically to observed liquidity. For portfolios, include **cross-asset correlation** and possibly maintain neutrality to a market index or risk factor.

### 3.3 Trajectory shape (Almgren–Chriss 2000)

Mean–variance optimal trajectories and expected-cost-optimal trajectories under short-term drift are typically similar (Figure 1): **rapid trading early** to cut volatility/alpha exposure, then **slowing** to limit cumulative impact. The dominant scalar decision is effective duration $T_{\mathrm{eff}}$ (linear approximation to the trajectory)—minutes vs hours vs days—not fine curvature. An approximate quantitative cost model is essential for that speed choice.

---

## 4. Pre-Trade Cost Estimation and the Almgren et al. (2005) Model

### 4.1 Problem statement

After enough measured trades accumulate, build an analytic forecast $C$ (¢/share or bp) of expected cost and forecast uncertainty. Ideally this is a full theory of how trading moves prices (survey: Madhavan 2000; subtler response models: Bouchaud et al. 2004; Lillo–Farmer–Mantegna 2003). In practice one estimates the future from past data.

Inputs at minimum: shares $X$, daily volume $V$ (historical or day-of), effective duration $T$, volatility $\sigma$; optionally market cap, exchange/country, short-term alpha, algorithm identity. Supervised learning (Poggio–Smale 2003) is theoretically attractive but high-dimensional sparsity of “similar” trades pushes practitioners toward **parametric regression**.

### 4.2 Permanent vs temporary impact; three prices

Almgren et al. (2005)—the most detailed calibration cited—separates permanent and temporary impact using three prices:

- $S_{\mathrm{pre}}$: arrival (typically bid–ask midpoint before first fill)
- $S_{\mathrm{exec}}$: average execution price
- $S_{\mathrm{post}}$: post-trade market price (optionally lagged to let transients die)

For a **buy** (signs reverse for sells):

$$
I = \log\frac{S_{\mathrm{post}}}{S_{\mathrm{pre}}} \approx \frac{S_{\mathrm{post}}-S_{\mathrm{pre}}}{S_{\mathrm{pre}}},
\qquad
J = \log\frac{S_{\mathrm{exec}}}{S_{\mathrm{pre}}} \approx \frac{S_{\mathrm{exec}}-S_{\mathrm{pre}}}{S_{\mathrm{pre}}}.
$$

Approximations hold for moderate orders (price move of a few percent). $I$ and $J$ are fractional price changes vs pre-trade.

### 4.3 Permanent impact (linear form)

Permanent impact = net displacement from the trade’s buy–sell imbalance. Simplest model:

$$
I = \gamma\,\sigma\,\frac{X}{V} + \langle\mathrm{noise}\rangle.
$$

Normalize size by daily volume ($X/V$) and impact by daily volatility $\sigma$, so $\gamma$ is a **dimensionless constant across stocks** with widely different $V$ and $\sigma$. Noise is intraday volatility from others’ trading. Linearity in $X$ is convenient theoretically; Almgren et al. (2005) found reasonable empirical agreement, but other studies have challenged linearity.

### 4.4 Temporary impact (power-law in participation)

Temporary impact = premium for finishing in finite time, above a prorated permanent component:

$$
J = \frac{I}{2} + \eta\,\sigma\left(\frac{X}{VT}\right)^{\beta} + \langle\mathrm{noise}\rangle.
$$

Here $T$ is duration as a fraction of the trading day; $X/(VT)$ is the **participation rate**. The $I/2$ term is the share of post-trade permanent impact paid on the parent order itself. $\eta$ is taken constant across stocks. Bid–ask spread and market cap were **not** significant incremental factors in US equities in this calibration.

### 4.5 Calibration results

Two-step procedure: (1) calibrate permanent $I$, test linearity, estimate $\gamma$; (2) calibrate temporary $J$, estimate $\beta$ and $\eta$; verify residuals are consistent with volatility. Result: $\boldsymbol{\beta \approx 0.6}$, roughly compatible with earlier square-root models (Barra 1997 Market Impact Model Handbook). For trades of a few percent of daily volume over several hours, predicted impact is **tens of basis points**.

### 4.6 Intrinsic limitations of pre-trade models

1. **Tiny $R^2$** — typically a few percent at best. Single-trade prediction is poor because others’ flow dominates.
2. **Impact vs alpha confounding** — did price rise because the buy program impacted it, or because the PM correctly anticipated the rise?
3. **Small vs large trade regimes** — a model fit on small trades performs poorly on large ones despite claimed universality.

Nevertheless, the framework remains extremely useful for approximate pre-trade planning, scheduling, and post-trade evaluation—provided users recalibrate and extend critically.

---

## 5. Limitations (of the encyclopedia treatment)

- Equity-centric; FX/futures/credit microstructure differ.
- Point estimates $\beta\approx 0.6$, $\gamma$, $\eta$ are from Almgren et al. (2005) US equity sample—not universal constants for 2026 markets (maker-taker, inverted venues, retail internalization, 24h trading).
- No explicit multi-asset portfolio impact matrix beyond noting correlation in scheduling.
- Nonlinear and concave impact, transient kernel models (Bouchaud, Gatheral) are cited as richer frontiers but not developed here.
- Regulatory “best execution” is noted without jurisdiction-specific detail.

---

## 6. Practical Takeaways for a Quant Investor

1. **Instrument the full loop:** arrival, VWAP, and close benchmarks on every child order; weight aggregates by shares or dollars consistently; always report mean **and** SD of costs.
2. **Never judge a desk on raw mean without SE.** With SD ~25 bp, you need hundreds of independent trades to resolve a few bp of edge.
3. **Beware subdivision games** when arrival-price IS is the KPI; prefer VWAP or fixed-time benchmarks for quality scores, and arrival/IS for investment-goal alignment.
4. **Schedule shape:** front-load when alpha decay / volatility risk dominates; the scalar that matters is $T_{\mathrm{eff}}$. Pair with a calibrated impact model before debating trajectory curvature.
5. **Use the Almgren split:** estimate permanent $\gamma\sigma X/V$ and temporary $\eta\sigma (X/VT)^{\beta}$ separately; default $\beta\sim 0.5$–$0.6$ unless your own tape says otherwise.
6. **Feed costs into portfolio construction** (Grinold–Kahn): turnover and expected impact belong in the optimizer, not only at the desk.
7. **Expect low $R^2$:** use models for *unbiased* expected cost and for relative ranking of urgency, not for precise single-order prediction. Recalibrate by venue, cap bucket, and size regime.
8. **Incomplete fills:** define an institutional policy for unexecuted residual valuation before arguing about trader skill.

---

## 7. Formula Sheet (compact)

$$
\mathrm{IS} = \mathrm{side}\cdot(S_{\mathrm{exec}}-S_{\mathrm{arrival}}),\quad
I=\log\frac{S_{\mathrm{post}}}{S_{\mathrm{pre}}},\quad
J=\log\frac{S_{\mathrm{exec}}}{S_{\mathrm{pre}}},
$$

$$
I=\gamma\sigma\frac{X}{V}+\varepsilon_I,\qquad
J=\tfrac12 I+\eta\sigma\Bigl(\frac{X}{VT}\Bigr)^{\beta}+\varepsilon_J,\quad \beta\approx 0.6.
$$

---

## References (as cited)

Alford–Jones–Lim (2003); Almgren–Chriss (2000); Almgren–Thum–Hauptmann–Li (2005); Barra Market Impact Model Handbook (1997); Bouchaud–Gefen–Potters–Wyart (2004); Engle–Ferstenberg (2007); Grinold–Kahn (1999); Hasbrouck (2007); Lillo–Farmer–Mantegna (2003); Madhavan (2000); Perold (1988); Poggio–Smale (2003).

---

## 8. Worked Numerical Intuition

Suppose a name with daily volume $V=10$ million shares, daily volatility $\sigma=2\%$, and a buy of $X=200{,}000$ shares (2% of ADV) executed over $T=0.5$ day (half session). Participation rate $X/(VT)=0.02/0.5=4\%$. Permanent impact mean $\gamma\sigma X/V$: if $\gamma$ is order-1 (the exact Almgren et al. point estimate is paper-specific; the encyclopedia stresses cross-sectional constancy of $\gamma$), permanent move is on the order of a non-trivial fraction of daily vol times participation—tens of bp when combined with temporary $\eta\sigma(0.04)^{0.6}$. The encyclopedia’s qualitative calibration statement—“tens of basis points” for few-percent-ADV trades over several hours—matches this regime and is the right mental anchor for large-cap US equities circa mid-2000s.

For risk budgeting: if cost SD across similar trades is ~25 bp, a PM who “saves” 5 bp versus arrival on one ticket has essentially zero statistical evidence of skill. Skill inference requires stratified pooling (by ADV bucket, urgency, venue) and comparison to the pre-trade model residual, not raw IS.

Dynamic adaptation: if mid-flight realized volume is half of expected, effective participation doubles and temporary impact scales by $2^{0.6}\approx 1.52$; optimal policy typically extends $T$ or cuts residual size rather than mechanically finishing on the original clock—exactly the Almgren–Chriss urgency logic under a mis-estimated $V$.

Portfolio constraint example: a dollar-neutral long/short book that must finish a 200-name rebalance by the close faces a vector participation problem. Ignoring cross-impact and factor neutrality can create unintended market beta during the day even if start and end books are neutral—hence the encyclopedia’s insistence that portfolio schedules include correlations and index-neutrality constraints, not only single-name $\sigma$.

Broker evaluation: compare each broker’s residual $J-\widehat J(X,V,T,\sigma)$ distribution, not raw VWAP outperformance. A broker who wins on VWAP by trading only in high-liquidity names is not better than one who takes difficult orders with residuals consistent with the model.

Research agenda implied for practitioners: maintain a cleaned tape of $(S_{\mathrm{pre}},S_{\mathrm{exec}},S_{\mathrm{post}},X,V,T,\sigma,\text{algo},\text{venue})$; refit $\gamma,\eta,\beta$ quarterly; test linearity of $I$ vs $X/V$ by size quantile; never promote a model to production on in-sample $R^2$ alone—use calibration stability and residual heteroskedasticity diagnostics as Almgren et al. emphasize.

---

## 9. Connecting Post-Trade, Optimal Trading, and Pre-Trade into One Control Loop

Almgren’s encyclopedia article is short, but its architecture is a complete control loop for institutional execution. This section expands that architecture into an implementable quant workflow, staying faithful to the article’s claims and cited calibrations.

### 9.1 Stage A — Measurement ontology

Define for every parent order $i$:

- Arrival mid $S^{\mathrm{pre}}_i$, exec VWAP of fills $S^{\mathrm{exec}}_i$, post mid $S^{\mathrm{post}}_i$.
- Signed size $X_i$ (positive buy), ADV proxy $V_i$, duration fraction $T_i$, daily vol $\sigma_i$.
- Benchmarks: IS vs arrival, vs interval VWAP, vs close.
- Flags: limit price, cancel reason, dark vs lit fraction, algo ID.

Kitchen-sink “performance scorecards” that mix VWAP-outperformance with IS without stating the investment goal are exactly what the article warns against: VWAP quality ≠ investment shortfall.

### 9.2 Stage B — Aggregation without lying

Let $c_i$ be cost in bp and $D_i$ dollar value. Portfolio cost $\sum_i D_i c_i / \sum_i D_i$. Share-denominated costs use share weights. Always publish $\widehat{\mathrm{SE}}(\bar c)=\hat s/\sqrt{n}$ with size-weighted $\hat s$. If the desk claims a 3 bp improvement on $n=40$ tickets with $\hat s=30$ bp, SE ≈ 4.7 bp—improvement is noise.

Subdivision neutrality fails for arrival IS; therefore any desk KPI that can be gamed by splitting parent orders needs either (i) a fixed decision-time benchmark frozen at release, or (ii) VWAP/close metrics for quality, with IS reserved for investment attribution.

### 9.3 Stage C — Scheduling policy

Almgren–Chriss trajectories solve a mean–variance tradeoff between impact cost and variance of remaining risk. Qualitatively:

$$
\min_{\{x_t\}} \mathbb{E}[\mathrm{Cost}] + \lambda\,\mathrm{Var}[\mathrm{Cost}],
$$

subject to $\sum_t x_t = X$. The article’s Figure 1 message: whatever the exact Euler–Lagrange curve, linearize to $T_{\mathrm{eff}}$ and pick the urgency bucket first. Portfolio extension: remaining risk uses $\mathrm{Var}(w^\top r)=w^\top\Sigma w$ including correlations; add constraints $B^\top w_t=0$ for factor neutrality during the trajectory.

### 9.4 Stage D — Model form and when to break it

Permanent linear impact $I=\gamma\sigma X/V$ is portfolio-construction friendly (quadratic-ish cost in continuous time under linear permanent impact). Temporary power $\beta\approx 0.6$ sits between linear temporary impact ($\beta=1$, favors slow continuous trading) and square-root ($\beta=0.5$, classical Barra/heuristic). If your own fit yields $\beta\to 1$, optimal schedules become more patient; if $\beta\to 0$, impact is almost size-invariant and urgency is dominated by alpha/volatility.

Break the model when: (i) $X/V$ exceeds the calibration support (block prints, primary offerings); (ii) news windows where alpha–impact confounding explodes; (iii) names with ADV regime shifts (index rebalance days). The article is explicit that small-trade calibrations fail on large trades.

### 9.5 Stage E — Governance

Pre-trade: every order ticket stores $\widehat C=\widehat J$ and $\widehat{\mathrm{SE}}$. Post-trade: residual $z=(J-\widehat J)/\widehat s$. Brokers and algos ranked by residual distribution, conditioned on predicted difficulty. Recalibrate $\gamma,\eta,\beta$ on a rolling window; track parameter drift as a first-class risk metric. This is the operational content of “compare realized with forecast” in the post-trade section.

### 9.6 Relation to portfolio alpha

Grinold–Kahn integration: expected residual return after costs is $\alpha_i - c_i(X_i)$. Positions that look positive on gross alpha but negative after $\eta\sigma(X/VT)^\beta$ should not enter the book. Turnover penalties without an impact model systematically overtrade high-ADV names and under-estimate damage in low-ADV names—exactly the failure mode the encyclopedia is written to prevent.

### 9.7 What the article does *not* claim

It does not claim a universal numerical $\gamma$ or $\eta$ for all markets and decades. It does not resolve the nonlinear-vs-linear permanent impact debate. It does not provide a Bayesian treatment of incomplete fills. Its contribution is the **measurement → optimal control → econometric forecast** stack, with Almgren et al. (2005) as the workhorse regression specification and $\beta\approx 0.6$ as the headline empirical anchor for US equities in that study.

---

## 10. Detailed Mapping to the Almgren–Chriss Optimal Execution Framework

The encyclopedia points to Almgren and Chriss (2000) for trajectory mathematics. In that framework one discretizes the trading day into $N$ intervals of length $\tau$, with trade list $n_1,\ldots,n_N$ summing to $X$ and holdings $x_k$ after $k$ periods. Price dynamics combine arithmetic Brownian motion with permanent and temporary impact. Expected cost and variance of cost form a Lagrangian minimized at urgency parameter $\lambda$ (risk aversion). Solutions are hyperbolic-sine trajectories that reduce to the article’s Figure 1 family: faster initial trading for larger $\lambda$. The encyclopedia’s practical reduction—focus on $T_{\mathrm{eff}}$—is exactly how desks implement Almgren–Chriss without re-solving a calculus-of-variations problem on every order: map $\lambda$ to a duration bucket (e.g., 5%, 10%, 20%, 35% of the day), then run a VWAP/POV algo with that participation cap.

**Link to equation $J$.** Temporary impact in the encyclopedia is written in participation form $\eta\sigma(X/VT)^\beta$. In Almgren–Chriss, temporary impact is often linear in trading rate $n_k/\tau$; the power-law generalization with $\beta\approx 0.6$ softens the penalty on bursty trading relative to $\beta=1$ and is the empirical content of Almgren et al. (2005). When embedding in a portfolio optimizer, a locally quadratic approximation of expected temporary cost about a planned rate yields a quadratic trading penalty matrix—compatible with standard mean–variance portfolio construction (Grinold–Kahn again).

**Engle–Ferstenberg (2007)** is cited for the claim that execution-cost variance is economically the same species of risk as investment variance. Consequence: a PM who ignores cost volatility understates total risk; risk parity and vol-targeting systems should include an execution-risk budget when turnover is high.

**Madhavan (2000)** survey anchors the microstructure literature; **Lillo–Farmer–Mantegna (2003)** master curve and **Bouchaud et al. (2004)** response functions are cited as “more subtle” than the permanent/temporary split. A desk that has graduated past Almgren et al. (2005) typically estimates a propagator/kernel for price response and optimizes trajectories against that kernel—still inside the encyclopedia’s three-part architecture, only with a richer Stage D model.

**Hasbrouck (2007)** Appendix on US equity market structure justifies the “liquidity in space” paragraph: Reg NMS-era fragmentation means best execution is a smart-order-router problem, not a single-venue VWAP. Dark-pool fill probability and information leakage trade off against impact—measured, again, by comparing residuals to the pre-trade model.

**Incomplete inventory valuation.** The article refuses a universal rule for unexecuted shares. Operational best practice consistent with its spirit: (i) decide ex ante whether the residual is still desired at the decision-time arrival benchmark; (ii) if yes, mark opportunity cost vs arrival or vs a model-based expected future path; (iii) if the limit was a hard risk control, mark residual at zero investment intent and attribute non-fill to the constraint, not the trader. Mixing these without a policy produces endless desk–PM disputes.

**Calibration sample size.** With $R^2$ of a few percent, thousands of parent orders are needed to stabilize $\gamma,\eta,\beta$. Stratify by ADV quantile and volatility quantile; pool across names only after $\sigma$ and $V$ normalization as the model prescribes. Reject fits that fail residual diagnostics (heteroskedasticity vs participation, alpha contamination proxies such as same-direction price drift before arrival).

**Bottom line for 2026 readers.** Despite market-structure change since 2008, the encyclopedia’s stack—measure IS/VWAP/close, optimize urgency via $T_{\mathrm{eff}}$, forecast with permanent+temporary participation models, expect low $R^2$, recalibrate—remains the standard mental model taught to quant traders. Treat $\beta\approx 0.6$ as a historical US-equity anchor to be re-estimated, not a constant of nature.

---

## 11. Synthesis for Portfolio and Trading Desks

Execution cost control is not a back-office reporting chore; it is a first-class quant signal in the same family as alpha and risk. Almgren’s encyclopedia entry, read as an operating manual, yields the following condensed playbook.

**Daily.** Log arrival, exec, post for every parent; compute IS, VWAP slip, close slip; store participation $X/VT$ and $\sigma$.

**Weekly.** Size-weighted mean/SD of IS by broker, algo, ADV bucket; flag residuals vs Almgren-style $\widehat J$ beyond 2σ.

**Monthly.** Refit $\gamma,\eta,\beta$ on rolling 6–12 months; publish parameter time series to the investment committee; adjust default $T_{\mathrm{eff}}$ buckets if $\beta$ or $\eta$ drift.

**In the optimizer.** Penalize expected temporary+permanent cost; cap names where forecast cost consumes >50% of expected alpha; enforce portfolio-level neutrality during multi-day programs.

**In research.** Never claim execution alpha from raw VWAP wins; demand residual evidence after a published pre-trade model. Treat Perold’s paper portfolio vs reality gap as the definition of the problem the entire stack exists to shrink.

With $\beta\approx 0.6$, tens of bp on few-percent ADV multi-hour trades, and single-trade $R^2$ near zero, the scientifically honest posture is humility on any one order and discipline on the ensemble—the exact posture the article teaches.
