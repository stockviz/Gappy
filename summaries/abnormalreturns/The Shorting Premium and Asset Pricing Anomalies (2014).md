# The Shorting Premium and Asset Pricing Anomalies
**Authors:** Itamar Drechsler, Qingyi (Freda) Drechsler
**Year:** 2014
**Journal/Venue:** Working paper

## Problem statement

Drechsler and Drechsler ask whether the stock-lending market contains a systematic cross-sectional return signal and whether that signal helps explain why many famous anomalies appear strongest in precisely the stocks that are hardest to short. The central object is the **short rebate fee** or stock-borrowing fee. Existing literature had treated high fees mainly as evidence of short-sale constraints and possible overpricing. This paper argues that the fee itself may proxy for a distinct risk premium, and that the same force may organize a large part of the anomaly literature.

So the question is not simply whether hard-to-short stocks are overvalued. It is whether the **shorting premium** is a priced return component and whether anomaly returns are, to a large extent, concentrated in and explained by high-fee stocks.

## Approach (short)

The paper uses direct data on stock-lending fees and constructs the **cheap-minus-expensive-to-short** portfolio, denoted `CME`:

- long cheap-to-short stocks,
- short expensive-to-short stocks.

It then does three things:

1. measures the gross and net return to this `CME` factor,
2. studies the interaction between shorting fees and seven prominent asset-pricing anomalies,
3. augments the Fama-French four-factor model with the `CME` factor to test whether anomaly alphas shrink.

The main findings are:

- `CME` earns very large average returns and alpha,
- anomaly profits are weak among the 80% of stocks with low short fees and much larger among high-fee stocks,
- and an `FF4 + CME` model captures most anomaly returns across both low-fee and high-fee subsamples.

## Approach (detailed)

### 1. Measure shorting costs directly

The paper uses stock-lending data with observed rebate fees rather than relying only on indirect proxies such as short interest. This is important because the actual fee is the market price of borrowing the stock. A high fee tells us that shorting capacity is scarce and that someone is being compensated for supplying it.

The paper first documents the cross-sectional distribution of these fees and the characteristics associated with high-fee stocks. This step matters because it shows that expensive-to-short names are not randomly scattered across the market. They cluster in the very parts of the cross section that often generate anomaly profits.

### 2. Construct the shorting-premium factor

Each month, stocks are sorted into fee deciles from cheapest to most expensive to short. The factor of interest is

$$
CME = \text{cheap-to-short} - \text{expensive-to-short}.
$$

In words:

- buy the stocks with the lowest borrowing fees,
- short the stocks with the highest borrowing fees.

The basic result is very large. The paper reports that the gross average monthly return on `CME` is about `1.45%`, the net return after accounting for the fees is still about `0.92%`, and the four-factor alpha is roughly `1.55%` per month.

This already tells us that shorting fees contain major return information. Importantly, the effect remains large even after subtracting the direct borrowing cost, so the phenomenon is not merely "expensive stocks have high fees and the fee itself explains everything."

### 3. Why a shorting premium can exist

The paper's interpretation is not the standard one-line "short-sale constraints imply overpricing." Instead, it proposes a risk-based explanation. Investors who supply lending capacity or otherwise absorb the risk associated with the short side demand compensation. In that sense, high short fees signal stocks associated with concentrated shorting risk.

The paper argues that high short fees are consistent with the idea that the marginal investor in such stocks may actually be buying them because they can be lent out at attractive fees. That mechanism can support high prices rather than mechanically pushing them down. The relevant compensation then shows up in the return spread between cheap- and expensive-to-short stocks.

### 4. Relation to the anomaly literature

The next step is the most important one. The paper looks at seven major cross-sectional anomalies, including:

- value-growth,
- momentum,
- idiosyncratic volatility,
- composite share issuance,
- distress,
- net stock issues,
- and failure probability or related financing/distress anomalies.

For each anomaly, the paper shows that the stocks on the anomaly's short leg are typically the stocks with high shorting fees. This is already suggestive: the anomaly portfolios and the stock-lending market are systematically interacting.

### 5. Unconditional anomaly returns and fees

Before conditioning on fee buckets, the authors document that:

- the anomaly short legs have much higher average shorting fees than the other deciles,
- and fees rise monotonically as one moves toward the anomaly portfolios that drive the long-short return.

This is a strong stylized fact. It implies that many anomaly returns are tied to precisely the names where shorting is costly and risky.

### 6. Condition anomaly returns on short-fee buckets

The paper then sorts stocks into fee buckets and runs each anomaly inside those buckets. The basic design is:

1. form a large low-fee bucket containing the bottom 80% of stocks by shorting fee,
2. split the remaining high-fee names into finer fee buckets,
3. compute the anomaly long-short return separately inside each fee bucket.

The results are striking:

- among low-fee stocks, the anomalies are weak, statistically insignificant, or greatly reduced;
- among high-fee stocks, the anomalies are much larger and often very strong.

So the anomalies are not uniformly present across the market. They are concentrated exactly where shorting frictions and shorting risk are most severe.

### 7. Augment the factor model with `CME`

The paper then asks whether `CME` is a useful explanatory factor. It estimates an asset-pricing model that adds the shorting-premium factor to the usual Fama-French-Carhart style benchmark:

$$
R_{t} - R_f
=
\alpha + \beta_{MKT} MKT_t + \beta_{SMB} SMB_t + \beta_{HML} HML_t + \beta_{UMD} UMD_t + \beta_{CME} CME_t + \varepsilon_t.
$$

The point of this specification is not just to fit the `CME` portfolio itself. It is to see whether anomaly alphas shrink once the shorting premium is included.

### 8. `FF4 + CME` explains most anomaly returns

This is the key empirical result. Under the standard four-factor model, the anomalies retain large alphas, especially in high-fee stocks. Once `CME` is added:

- low-fee bucket alphas become economically small and statistically insignificant,
- high-fee bucket alphas shrink sharply,
- and for six of the seven anomalies the difference in alphas between low-fee and high-fee buckets becomes insignificant.

The idiosyncratic-volatility anomaly is one of the strongest examples: its alpha is greatly reduced and becomes statistically unimportant once `CME` is included.

This is powerful evidence that shorting-related risk or friction is an organizing component of anomaly returns rather than an incidental side fact.

### 9. Gross versus net returns

Another strength of the paper is that it reports both gross and net returns. That matters because one might suspect that the apparent shorting premium disappears once the borrow cost is paid. The paper shows that this is not the case. The net spread is smaller than the gross spread, as it must be, but it remains economically large.

That makes the argument stronger. The shorting premium is not just an accounting identity based on loan fees; it is a broader return phenomenon.

### 10. Additional proxy evidence

Because direct fee data are available for a limited sample, the paper also uses a longer-sample proxy related to the ratio of short interest to institutional ownership. The longer-sample evidence points in the same direction:

- the proxy identifies a strong cheap-minus-expensive spread,
- anomaly returns again concentrate where the proxy indicates high shorting pressure,
- and a factor model incorporating the shorting premium continues to absorb much of the anomaly alpha.

### 11. Interpretation

The paper's interpretation is deliberately joint:

1. there is a large shorting premium in the cross section,
2. this premium is associated with high-fee, hard-to-short names,
3. those same names dominate the anomaly short legs,
4. and the return on the `CME` factor prices much of the anomaly structure.

This does not prove that all anomalies are pure risk premia. But it does show that the stock-lending market is central to understanding where anomaly returns come from and why they survive.

### 12. Why the paper mattered

The paper mattered because it connected two literatures that were often discussed separately:

- the anomaly literature,
- and the stock-lending / short-sale-constraint literature.

Its strongest contribution is the conditioning result: once one looks only at low-fee stocks, a large part of the anomaly zoo becomes much less impressive. That is a very different statement from saying merely that hard-to-short stocks are sometimes overvalued.

## Domain of applicability

- **Where it works well:** U.S. equity research settings with stock-lending-fee data and anomaly portfolios whose short legs are plausibly constrained.
- **What is implementable:** Monthly fee-decile sorts, construction of the `CME` factor, fee-conditioned anomaly portfolios, and `FF4 + CME` alpha tests.
- **Main limitation:** Direct stock-lending-fee data are institutionally specialized and not always available across long samples or broad international universes.
- **Why the paper matters:** It shows that the stock-lending market is not peripheral to anomaly returns; the shorting premium appears to be a major force behind where anomaly profits are located and how they should be priced.
