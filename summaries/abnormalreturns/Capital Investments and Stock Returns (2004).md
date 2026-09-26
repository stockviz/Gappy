# Capital Investments and Stock Returns
**Authors:** Sheridan Titman, K. C. John Wei, Feixue Xie
**Year:** 2004
**Journal/Venue:** Journal of Financial and Quantitative Analysis

## Problem statement

Firms that invest heavily often look strong at the time they invest: recent stock performance is good, external financing is available, and managers can tell optimistic stories about growth opportunities. The paper asks whether those high-investment episodes are actually followed by poor stock performance because investors underreact to the possibility of **empire building** and overinvestment.

The central question is not whether capital expenditures are high on average after good times. It is whether **abnormal capital investment**, relative to the firm's own recent benchmark, predicts negative subsequent abnormal returns.

## Approach (short)

The paper measures abnormal capital investment as the percentage deviation of current capital expenditures from a rolling historical benchmark:

$$
CI_{t-1}=\frac{CE_{t-1}}{(CE_{t-2}+CE_{t-3}+CE_{t-4})/3}-1,
$$

where each `CE` is capital expenditures scaled by same-year sales. Firms are sorted annually on `CI`, and returns from July of year `t` to June of `t+1` are evaluated using characteristic-matched benchmarks, factor alphas, and earnings-announcement-window returns. The paper then tests whether the effect is stronger when managers have more investment discretion, proxied by high internal cash flow and low leverage.

The main result is that high-`CI` firms underperform for several years, and the underperformance is strongest exactly where agency-based overinvestment should be most likely.

## Approach (detailed)

### 1. Define abnormal investment relative to a firm-specific benchmark

The signal is not raw capex. It is capex relative to the firm's own recent history:

$$
CI_{t-1}=\frac{CE_{t-1}}{(CE_{t-2}+CE_{t-3}+CE_{t-4})/3}-1.
$$

Each `CE` is capital expenditures (Compustat item 128) divided by sales in the same fiscal year. Using sales as the deflator means the benchmark answers: how much capex is the firm doing relative to what would normally accompany its scale of operations?

By construction:

- `CI = 0` means investment equals the recent three-year average;
- `CI > 0` means abnormal investment expansion;
- `CI < 0` means investment contraction.

The paper checks robustness to alternative definitions, including five-year averages and alternative deflators, and finds similar results.

### 2. Match accounting variables to future returns with standard annual timing

The portfolio-formation rule is:

1. compute `CI` from fiscal-year `t-1` data;
2. form portfolios in June of year `t`;
3. study returns from July `t` to June `t+1`.

The sample covers July 1973 to June 1996 and includes nonfinancial common stocks from NYSE, Amex, and Nasdaq, subject to screens such as positive book equity, sales above a minimum threshold, and sufficient accounting history to compute the rolling benchmark.

### 3. Sort firms by `CI` and measure abnormal performance in three different ways

The paper evaluates the strategy using three return measures:

1. **Characteristic-based benchmark adjustment** using portfolios matched on size, book-to-market, and momentum;
2. **Factor-model alpha** using the Carhart/Fama-French style framework;
3. **Earnings-announcement-window returns**, following Chopra-Lakonishok-Ritter style event-window analysis.

This three-part design matters. If the effect only appeared under one benchmark, it could easily be dismissed as a measurement artifact. The paper shows it under multiple abnormal-return definitions.

### 4. Test the agency interpretation with investment-discretion splits

The agency story predicts that overinvestment should be more severe when managers have more freedom to invest. The paper therefore splits firms using two proxies:

- **cash flow**, where high cash flow means managers can invest without seeking external discipline;
- **leverage**, where low debt means fewer constraints from creditors.

The tests are implemented with double sorts and interaction regressions. For example:

1. split firms into high- and low-cash-flow groups;
2. within each group, sort firms into `CI` quintiles;
3. compare the low-`CI` minus high-`CI` spread across the two cash-flow groups.

The paper repeats the same logic with leverage. The negative `CI`-return relation is substantially stronger for high-cash-flow firms and for low-debt firms, exactly as the overinvestment hypothesis predicts.

### 5. Estimate cross-sectional regressions with interaction terms

The paper formalizes the discretion tests with regressions of adjusted returns on:

- `CI`,
- discretion dummies based on cash flow and debt ratios,
- and interaction terms such as `CI × DCF` and `CI × DDA`,

along with controls.

The identifying prediction is that the return slope on `CI` should be more negative when discretion is high. In other words, once the interaction terms are included, the strongest underperformance should be attributable not to investment per se, but to investment in settings where governance or financing constraints are weak.

### 6. Separate the effect from long-run reversal and equity issuance

A natural objection is that high-investment firms tend to be recent winners and frequent issuers, so `CI` might simply be a proxy for:

- long-run return reversal,
- or the seasoned-equity-issuance effect.

The paper addresses this directly by:

1. sorting jointly on past five-year returns and `CI`;
2. excluding IPO/SEO firms and re-running the strategy;
3. showing that the `CI` effect survives after these exclusions and controls.

That step is central. It is what lets the paper claim that abnormal investment contains incremental information beyond the standard issuance and reversal anomalies.

### 7. Use the hostile-takeover period as a governance experiment

The paper also compares periods with different external-discipline environments. The logic is:

- when hostile takeovers are more prevalent, managers face more discipline;
- overinvestment-related mispricing should therefore weaken.

Empirically, the negative `CI` effect is concentrated in periods when hostile takeovers were less prevalent and weakens during the high-takeover-discipline years. This time-series conditioning gives the agency explanation additional support.

### 8. Use earnings-announcement returns to test whether the correction is informational

If investors underreact to the adverse information embedded in high investment, then the correction should partly occur when firms release subsequent operating news. The paper therefore studies announcement-window returns after the portfolio is formed.

The design is important because it ties the long-horizon underperformance back to information arrival rather than to a mechanical factor loading. The finding that part of the correction comes around earnings announcements is consistent with gradual learning about overinvestment.

### 9. What a reader should implement

A replication requires:

1. annual capex and sales from Compustat;
2. annual `CI` as the capex deviation from the prior three-year benchmark;
3. annual June portfolio formation and July-June holding periods;
4. matched-benchmark returns and factor alphas;
5. cash-flow and leverage proxies for investment discretion;
6. interaction regressions and double sorts;
7. optional exclusions for recent equity issuers to show incremental power.

The practical signal is not "high capex is bad." It is "abnormally high capex relative to the firm's recent norm is bad, especially when managers have discretion to overinvest."

## Domain of applicability

- **Where it works well:** Equity universes with annual accounting data and a governance/financing context in which managerial discretion plausibly varies.
- **What is implementable:** Annual low-`CI` minus high-`CI` strategies, ideally interacted with cash-flow and leverage measures.
- **Main limitation:** `CI` is still a reduced-form overinvestment proxy; it does not directly observe project quality.
- **Why the paper matters:** It links an accounting-based investment signal to a specific agency mechanism and shows that the signal strengthens exactly where overinvestment should be most severe.
