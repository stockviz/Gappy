# Characteristics of Risk and Return in Risk Arbitrage — Mitchell & Pulvino (2000) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Characteristics of Risk and Return in Risk Arbitrage |
| **Authors** | Mark Mitchell (Harvard Business School); Todd Pulvino (Kellogg, Northwestern) |
| **Status** | Forthcoming, *Journal of Finance* (manuscript October 2000) |
| **Sample** | **4,750** stock-swap mergers, cash mergers, cash tender offers, **1963–1998**; hedge-fund comparison **1990–1998** |
| **Themes** | Merger arbitrage, nonlinear market beta, put-like payoffs, transaction costs, contingent-claims performance evaluation |
| **Original PDF** | `riskrbitrage_mitchellpulvino.pdf` |
| **Drive file id** | `1KSK6WEjU4XFtaxK7VnuhOIs3wUId0-4H` |
| **Extraction** | `pdftotext` (~18,282 words); text usable |

---

## Problem / Motivation

After a deal announcement, the target trades at a discount to the offer (the **arbitrage spread**). Risk arb profits if the deal closes; losses if it fails—losses typically much larger than spreads captured on success. Popular press emphasizes huge gains (Boesky) and blowups (LTCM). Academic studies report enormous excess returns: Jindra–Walkling, Dukes et al. (>100% annualized on tenders); Karolyi–Shannon (Canadian 1997) 26% with $\beta=0.39$; Baker–Savasoglu ~12.5% excess.

Three explanations: (1) true market inefficiency; (2) **transaction costs / practical limits** prevent earning paper alphas; (3) returns are compensation for **nonlinear crash risk** mismeasured by linear betas. Mitchell–Pulvino build two return series from 4,750 deals to separate these channels and show risk arb resembles **writing uncovered index puts**.

---

## Data and Portfolio Construction

- CRSP/deal databases: stock swaps, cash mergers, cash tenders, 1963–1998.
- Final sample **4,750** transactions (Table I: 73% success rate overall; mean duration ~59 days; mean target equity value \$391m).
- **VWRA:** calendar-time value-weighted average of active-deal returns, **ignore TCA**—upper bound.
- **RAIM (Risk Arbitrage Index Manager):** mimics a hypothetical index fund with **brokerage + price impact**, practical constraints, **no** active deal picking (does not avoid anticipated failures).

Comparing VWRA vs RAIM isolates transaction-cost drag.

---

## Aggregate Performance (Table II)

Compound annual returns 1963–1998:
| Series | CAGR | Ann. SD | Sharpe |
|--------|------|---------|--------|
| **VWRA** | **16.05%** | 9.29% | **0.288** |
| **RAIM** | **10.64%** | 7.74% | **0.161** |
| CRSP VW | 12.24% | 15.08% | 0.126 |
| RF | 6.22% | 0.73% | 0 |

RAIM still beats the market on Sharpe but much of VWRA’s edge is **costs**. Annual series show rare bad years (e.g., RAIM −4.03% in 1966, −7.45% in 1973) amid many steady positive years—foreshadowing put-like payoffs. Figure 3: wealth indexes—risk arb smoother than market until stress episodes.

Linear CAPM/FF alphas (intro summary): VWRA $\alpha\approx 74$ bps/month (**9.25%** ann.); RAIM $\alpha\approx 29$ bps/month (**3.54%** ann.).

---

## Linear Factor Regressions (Table III)

Model: $R_{arb}-r_f=\alpha+\beta_{MKT}(R_m-r_f)[+ \beta_{SMB}SMB+\beta_{HML}HML]$.

**Panel A full sample (432 months):**
- RAIM: $\alpha=0.0029^{**}$, $\beta_{MKT}=0.123^{***}$, $R^2=0.057$
- RAIM+FF: $\alpha=0.0027^{*}$, $\beta_{MKT}=0.105$, $\beta_{SMB}=0.122^{**}$, $\beta_{HML}=0.036$
- VWRA: $\alpha=0.0074^{***}$, $\beta_{MKT}=0.054$ (insignificant)

**Panel B months with $R_m-r_f<-3\%$ (n=76):**
- RAIM: $\alpha=0.0260^{***}$, $\beta_{MKT}=0.507^{***}$, $R^2=0.306$
- VWRA: $\alpha=0.0368^{***}$, $\beta_{MKT}=0.519^{***}$

**Panel C $R_m-r_f<-5\%$ (n=35):** betas still ~0.48–0.51 (some α lose significance with small n).

**Message:** unconditional $\beta$ ~0.1 hides **state-dependent $\beta\sim 0.5$** in market crashes—linear models misstate risk.

---

## Piecewise Linear / Put-Like Payoff (Table IV)

$$
R_{arb}-r_f=(1-\delta)[\alpha_L+\beta_L(R_m-r_f)]+\delta[\alpha_H+\beta_H(R_m-r_f)]
$$
with continuity at threshold; $\delta=1$ if market above threshold. Threshold **−4%** maximizes adj $R^2$.

**Full sample RAIM:** $\alpha_H=0.0053^{***}$, $\beta_L=0.492^{***}$, $\beta_H=0.0167$ (≈0), adj $R^2=0.124$.

**VWRA:** $\alpha_H=0.0101^{***}$, $\beta_L=0.476^{***}$, $\beta_H=-0.068$.

Subperiods 1963–79, 1980–89, 1990–98: **same pattern**—high-state beta ≈0, low-state beta 0.38–0.58. Intro summary: in flat/up markets, ~**50 bps/month** over RF with ~0 beta; in ≤−4% months, beta jumps to ~**0.50**.

**Economic interpretation:** risk arb ≈ **short index put** (Glosten–Jagannathan contingent-claims evaluation; links to Bhagat et al. tender-offer put intuition). Figure 2 sketches the kinked payoff.

---

## Deal Failure Probit (Table V)

$$
\Pr(\mathrm{Fail}=1)=f(R_{m,t},R_{m,t-1},R_{m,t-2},\mathrm{LBO},\mathrm{Cash},\mathrm{Premium},\mathrm{Size},\mathrm{Tender},\mathrm{Hostile})
$$
Fail = negative arb return (deal not consummated).

Key marginal effects: $R_m$ −0.44; $R_{m,-1}$ −0.46 (***); Hostile **+12.8 pp** failure probability. A **5% market drop** raises failure probability by ~**2.25%** (text). Mechanism for nonlinear beta: downturns → more breaks → arb losses correlate with market.

---

## Cash vs Stock Deals (Table VI)

Piecewise results stronger/cleaner in **cash** transactions; stock deals add fixed-exchange-ratio equity market exposure even when deals succeed. Panels A/B split confirm nonlinearity in both but magnitudes differ.

---

## Transaction Costs & Capital Constraints (Table VII)

Scenarios vary commission, price impact, and max capital deployed per deal / total. Practical limits **substantially** reduce alpha vs frictionless VWRA. Larger capital bases face more impact—returns not linearly scalable. Authors conclude that after realistic frictions **and** nonlinear risk adjustment, excess returns shrink to ~**4% per year** (abstract).

Black–Scholes-style valuation of the embedded short put (strike tied to −4% threshold + RF) accounts for a large fraction of linear-model alpha—contingent-claims charge for crash insurance sold by arb.

---

## Hedge Fund Comparison (Tables VIII–IX, Figure 5)

HFR merger-arb fund aggregates 1990–1998 show the **same kinked** payoff vs market as RAIM. Correlations between RAIM, HFR, and individual funds positive; stronger alignment in down markets. Active funds may pick deals better than passive RAIM but still sell crash insurance.

---

## Limitations

- Sample ends 1998 (pre-2000s/08 arb stress—qualitatively consistent with thesis).
- RAIM TCA model is calibrated, not frictionless truth.
- Probit uses negative return as fail proxy—imperfect.
- Piecewise threshold chosen to max $R^2$ (−4%)—data-mined level, but subperiod robustness helps.
- Ignores active prediction of deal success (both a limitation and a feature for passive alpha measurement).
- Option analogy is illustrative; markets incomplete; BS price is a benchmark not a unique no-arb price.

---

## Practical Takeaways for a Quant Investor

1. **Do not underwrite merger arb on CAPM $\beta\approx 0.1$ and 10%+ Sharpes from gross spreads**—unconditional beta hides put-like crash exposure ($\beta\sim 0.5$ in ≤−4% months).
2. **Budget TCA and impact:** paper alpha ~9% (VWRA) collapses toward ~3.5% linear α / ~**4%** contingent-claims-adjusted excess for RAIM-like implementation.
3. **Capacity is binding**—Table VII: more capital → worse returns; treat arb as capacity-constrained absolute-return sleeve.
4. **Hostile deals** carry sharply higher break risk (+12.8 pp)—require wider spreads or avoidance.
5. **Cash vs stock:** stock deals embed market exposure even on success; hedge acquirer leg carefully (fixed-exchange collars, etc.).
6. **Risk management:** stress arb books with equity-market crash scenarios and correlated break waves; plain VaR on historical monthly σ (~8% ann.) understates.
7. **HF due diligence:** expect HFR-like kinked payoffs; ask for downside capture ratios, not only Sharpe.
8. **Performance evaluation:** use piecewise or option-based benchmarks (Glosten–Jagannathan), not CAPM alone.

---

## Key Numbers

| Object | Value |
|--------|-------|
| Deals | 4,750 (1963–1998) |
| Success rate | 73% |
| VWRA CAGR / Sharpe | 16.05% / 0.288 |
| RAIM CAGR / Sharpe | 10.64% / 0.161 |
| RAIM unconditional $\alpha,\beta$ | 29 bps/mo, $\beta=0.12$ |
| RAIM $\beta$ when mkt < −3% | **0.51** |
| Piecewise $\beta_L,\beta_H$ (RAIM, −4% thresh) | **0.49**, **0.02** |
| Excess after costs + nonlinearity | ~**4%/year** |
| Hostile failure +marginal | +12.8 pp |

---

## Extended Discussion

Linear asset pricing assumes payoff linearity in factors. Merger arb’s payoff is concave in market returns: capped upside (spread), large downside when breaks cluster in panics. Selling insurance earns a premium in normal times (positive $\alpha_H$ with zero $\beta_H$) and pays out in crises. Whether 4% residual excess is “inefficiency” or compensation for higher moments / liquidity / funding risk is open; the paper’s contribution is to **shrink the puzzle** from double-digit CAPM alphas to a single-digit contingent-claims residual.

For multi-strategy hedge funds, correlation of arb with other short-vol strategies (credit, volatility selling) rises in crises—aggregation risk. LTCM narrative fits: not that arb has high average $\beta$, but that **left-tail $\beta$ and funding liquidity** bite together.

Index construction lesson: studying **deal-level passive** returns (RAIM) avoids selection bias in reported HF returns (Ackermann et al. caveats in footnotes) while still matching the shape of live HF payoffs (Figure 5)—powerful validation.

### Process Checklist for an Arb Desk

1. Ingest announced deals; compute spreads vs terms (cash, fixed ratio, collars).
2. Estimate break probability with market returns, hostility, premium, size, payment form (Table V style).
3. Size positions with impact models; enforce firm-level and book-level capital caps (Table VII).
4. Hedge systematic legs on stock deals; monitor portfolio piecewise beta vs −4% market threshold.
5. Attribute P&L to: spread capture, breaks, hedges, TCA.
6. Report performance vs piecewise benchmark, not only excess over RF.

### Final Assessment

Mitchell & Pulvino replace the folklore of riskless “arbitrage” and fantasy triple-digit alphas with a precise characterization: **merger arb is a short-put strategy on the market**, earning modest excess (~4% after costs and optionality) for bearing deal-break risk that materializes when markets crash. Essential reading for anyone allocating to event-driven / merger strategies or evaluating HF merger-arb streams.


---

## Source Evidence Appendix — Mitchell & Pulvino (2000)

Curated quantitative excerpts from the extracted PDF text for auditability.

### Excerpt 1

```
1997 has a beta of 0.39 and an annualized return of 26%, almost twice that of the TSE 300. In a

similar study using a much larger sample of U.S. cash and stock mergers, Baker and Savasoglu
```

### Excerpt 2

```
(1999) conclude that risk arbitrage generates excess returns of 12.5%.

        These findings suggest that financial markets exhibit systematic inefficiency in the
```

### Excerpt 3

```
weighted risk arbitrage returns are subsequently referred to as VWRA returns). The second

portfolio return series mimics the returns from a hypothetical risk arbitrage index manager
```

### Excerpt 4

```
(subsequently referred to as RAIM returns). RAIM returns include transaction costs, consisting

of both brokerage commissions and the price impact associated with trading less than perfectly
```

### Excerpt 5

```
liquid securities. RAIM returns also reflect practical constraints faced by most risk arbitrage

hedge funds. However, unlike actively managed hedge funds, no attempt to discriminate between
```

### Excerpt 6

```
anticipated successful and unsuccessful deals is made when generating RAIM returns.

Comparing the VWRA and RAIM return series indicates that transaction costs have a substantial
```

### Excerpt 7

```
Comparing the VWRA and RAIM return series indicates that transaction costs have a substantial

effect on risk arbitrage returns. Ignoring transaction costs results in a statistically significant
```

### Excerpt 8

```
alpha (assuming linear asset pricing models are valid) of 74 basis points per month (9.25%

annual). However, when we account for transaction costs, the alpha declines to 29 basis points
```

### Excerpt 9

```
annual). However, when we account for transaction costs, the alpha declines to 29 basis points

per month (3.54% annual).
```

### Excerpt 10

```
per month (3.54% annual).

         The second possible explanation for the extraordinary returns to risk arbitrage
```

### Excerpt 11

```
The sample includes stock swap mergers, cash mergers, and cash tender offers. Constructing returns from
individual mergers allows us to avoid the sample selection issues inherent in recent studies that use hedge
fund returns to assess the risk/reward profile of risk arbitrage. For example, Ackermann et al. (1999) and
```

### Excerpt 12

```
and appreciating markets, risk arbitrage generates returns 50 basis points per month (6.2%

annual) greater than the risk-free rate with essentially a zero market beta. However, in months
```

### Excerpt 13

```
annual) greater than the risk-free rate with essentially a zero market beta. However, in months

where the stock market experiences a decrease of 4% or more, the market beta of the risk
```

### Excerpt 14

```
where the stock market experiences a decrease of 4% or more, the market beta of the risk

arbitrage portfolio increases to 0.50. Thus, our RAIM portfolio generates moderate returns in
```

### Excerpt 15

```
arbitrage portfolio increases to 0.50. Thus, our RAIM portfolio generates moderate returns in

most environments but, in rare cases, generates large negative returns. This pattern is robust
```

### Excerpt 16

```
performance associated with risk arbitrage, and the alphas reported in previous studies do not
```

### Excerpt 17

```
excess returns of 10.3%. This is greater than, not less than, the 9.25% estimate obtained using

CAPM to measure the excess return generated by risk arbitrage investments. When returns that
```

### Excerpt 18

```
remarkably similar to those obtained using returns from our RAIM portfolio.

        The remainder of this paper is organized as follows. Section I describes typical arbitrage
```

### Excerpt 19

```
would have earned a daily return of 0.47%. This corresponds to an annualized return well over

100%, although the authors concede that it would be difficult for an investor to repeat these
```

### Excerpt 20

```
returns on a continuing basis. Jindra and Walkling (1999) report similar results. Using a sample

of 361 cash tender offers between 1981 and 1995, they find that an arbitrageur who purchased the
```

### Excerpt 21

```
tender period excess returns of 2.0% (18% annually, based on an average tender period of 29

days) obtained by buying the target’s stock the day after the tender offer announcement and
```

### Excerpt 22

```
Nevertheless, they find excess returns of 5.3% and raw returns of 20.08% over the transaction

period. Based on the median transaction period of 31 trading days, these numbers correspond to
```

### Excerpt 23

```
an annualized excess return of 51.9% and an annualized raw return of 337%. Like Larcker and

Lys (1987), Karolyi and Shannon (1998) also study both cash and stock mergers. From a sample
```

### Excerpt 24

```
generated a beta of 0.39 and an annualized return of 26%, almost twice the return achieved by the

TSE 300 in 1997. Baker and Savasoglu (1999) use a much larger sample over the 1978 - 1996
```

### Excerpt 25

```
(approximately 12.5% annualized).

        Results presented in previous risk arbitrage studies are consistent with more recent papers
```

### Excerpt 26

```
Muse, Tate and Furst for $16.25 per share. Three days later, Hadco Corp. entered a competing

bid of $18 per share. An arbitrageur that purchased Zycon stock one day after the original bid
```

### Excerpt 27

```
would have made a three-day return of 9.5% and an annualized return of 1,903%. Large returns

such as this weigh heavily in the averaging process used to calculate event-time returns. Yet, as
```

### Excerpt 28

```
a continuing basis (Dukes et al. (1992), Karolyi and Shannon (1998)). To address this issue, we

calculate average risk arbitrage returns based on calendar-time rather than event-time. That is, we
```

### Excerpt 29

```
simulate a realistic investment strategy, more similar to strategies pursued by risk arbitrage hedge

funds. In order to keep investors' money employed, these hedge funds typically invest in a broad
```

### Excerpt 30

```
Table I contains a summary of the 4,750 mergers used in this study, broken down by

announcement year and transaction type. The sample contains relatively few mergers in the
```

### Excerpt 31

```
average market equity value of acquiring firms is $1.55 billion.
```

### Excerpt 32

```
and other practical aspects associated with risk arbitrage investments (VWRA returns). The

second approach generates the return time series from a hypothetical risk arbitrage index manager
```

### Excerpt 33

```
(RAIM returns). Because they include transaction costs, and because capital is invested in cash
```

### Excerpt 34

```
when there is not enough merger activity to employ the simulated fund’s capital, RAIM returns

are lower than VWRA returns.
```

### Excerpt 35

```
are lower than VWRA returns.
```

### Excerpt 36

```
A.      Target Value-Weighted Average Return Series (VWRA)

        For every active transaction-month in the sample period, monthly returns are calculated
```

### Excerpt 37

```
There are two other features of the VWRA approach that are worth noting. First, this

method effectively assumes that the arbitrage portfolio is invested in every transaction. Because
```

### Excerpt 38

```
B.        Risk Arbitrage Index ManagerReturns (RAIM)

          The second time series of risk arbitrage returns used in this paper attempts to correct for
```

### Excerpt 39

```
obtained by calculating predicted values using regression results presented in Table 5 of Breen et

al. (1999). A detailed description of their procedure is provided in Appendix A of this paper. It
```

### Excerpt 40

```
Table A.II of Appendix A) that decrease to $0.10 per share between 1975 and 1979, to $0.05 per

share between 1980 and 1989, and to $0.04 per share between 1990 and 1998.
```

### Excerpt 41

```
share between 1980 and 1989, and to $0.04 per share between 1990 and 1998.

        Table II presents the annualized time series of monthly returns for both the VWRA and
```

### Excerpt 42

```
Table II presents the annualized time series of monthly returns for both the VWRA and

RAIM portfolios. As expected, the VWRA portfolio significantly outperforms the RAIM
```

### Excerpt 43

```
RAIM portfolios. As expected, the VWRA portfolio significantly outperforms the RAIM

portfolio. Whereas the VWRA portfolio generates a compound annual return of 16.05%, the
```

### Excerpt 44

```
portfolio. Whereas the VWRA portfolio generates a compound annual return of 16.05%, the

RAIM portfolio generates a compound annual return of 10.64%. Of the 5.41% difference,
```

### Excerpt 45

```
RAIM portfolio generates a compound annual return of 10.64%. Of the 5.41% difference,

approximately 1.5% can be attributed to direct transaction costs (e.g. brokerage commissions,
```

### Excerpt 46

```
approximately 1.5% can be attributed to direct transaction costs (e.g. brokerage commissions,

surcharges, and taxes), and 1.5% can be attributed to indirect transaction costs (e.g. price impact).
```

### Excerpt 47

```
surcharges, and taxes), and 1.5% can be attributed to indirect transaction costs (e.g. price impact).

The remaining 2.5% can be attributed to limitations in position sizes caused by illiquidity in the
```

### Excerpt 48

```
The remaining 2.5% can be attributed to limitations in position sizes caused by illiquidity in the

merging firms' stocks. Thus, ignoring transaction costs and the price impact associated with
```

### Excerpt 49

```
Also shown in Table II are the annualized CRSP value-weighted average return and the

risk-free rate of return. Over the 1963-1998 time period, the CRSP value-weighted index had a
```

### Excerpt 50

```
compound annual return of 12.24%, almost 400 basis points less than the VWRA average and

only 160 basis points greater than the RAIM average. Annual standard deviations and monthly
```

### Excerpt 51

```
only 160 basis points greater than the RAIM average. Annual standard deviations and monthly

Sharpe ratios are also presented in Table II. Even though the compound annual return of the
```

### Excerpt 52

```
Sharpe ratios are also presented in Table II. Even though the compound annual return of the

RAIM portfolio is lower than the market return, the low volatility associated with risk arbitrage
```

### Excerpt 53

```
RAIM portfolio is lower than the market return, the low volatility associated with risk arbitrage

returns results in a Sharpe ratio that exceeds that of the market.
```

### Excerpt 54

```
returns results in a Sharpe ratio that exceeds that of the market.

        Returns summarized in Table II are shown graphically in Figure 3. This figure shows the
```

### Excerpt 55

```
Returns summarized in Table II are shown graphically in Figure 3. This figure shows the

value of $1 invested at the beginning of 1963 in various strategies, including treasuries, equities,
```

### Excerpt 56

```
comparing the returns from the VWRA portfolio to the returns from the RAIM portfolio. It is

also evident from Figure 3 that returns to risk arbitrage are much less volatile than market returns.
```

### Excerpt 57

```
Because the RAIM portfolio return series is more realistic, we focus our discussion on results

obtained using this return series as the dependent variable.
```

### Excerpt 58

```
Panel A of Table III presents results for the entire 432 month (36 year) sample. The first

regression presents results from estimating the CAPM. Results from this regression indicate that
```

### Excerpt 59

```
the alpha is positive 29 basis points per month and is significantly different from zero.

Furthermore, the estimated market beta is only 0.12. This result indicates that over a broad range
```

### Excerpt 60

```
Furthermore, the estimated market beta is only 0.12. This result indicates that over a broad range

of market environments, risk arbitrage returns are independent of overall market returns.
```

### Excerpt 61

```
The alpha is 27 basis points per month and the market beta is 0.11, both significantly different

from zero. The SMB coefficient is also statistically different from zero in this regression.
```

### Excerpt 62

```
target and a short position in a relatively large acquirer, the correlation between RAIM returns

and SMB is not surprising.
```

### Excerpt 63

```
Panels B and C of Table III report results from estimating equation (1) after limiting the

sample to months where the market return minus the risk free rate is less than –3.0% and –5.0%
```

### Excerpt 64

```
sample to months where the market return minus the risk free rate is less than –3.0% and –5.0%

8
```

### Excerpt 65

```
respectively. The estimated alphas using these subsamples of data increase dramatically. As

shown in Panel B, when the excess market return is the only independent variable, the estimated
```

### Excerpt 66

```
alpha is 260 basis points per month (36.1% annualized) and the beta is 0.51. Including the

Fama/French factors reduces the alpha to 206 basis points per month (27.72% annualized), but it
```

### Excerpt 67

```
Fama/French factors reduces the alpha to 206 basis points per month (27.72% annualized), but it

is still statistically different from zero at the 1% level. The regression R2 increases dramatically
```

### Excerpt 68

```
when the sample is limited to months with negative market returns (from 0.057 to 0.306)

suggesting that the systematic risk in risk arbitrage is driven by time periods where market returns
```

### Excerpt 69

```
The coefficient estimates in Table III suggest that the relationship between risk arbitrage

returns and market returns is non-linear. To further assess the degree of non-linearity in risk
```

### Excerpt 70

```
the threshold, we present results obtained by setting the threshold equal to –4.0%, the value that

minimizes the sum of squared residuals.
```

### Excerpt 71

```
Panel A of Table IV presents results using the complete sample covering the 1963 – 1998

time period. Results from this panel indicate that in most market environments, risk arbitrage
```

### Excerpt 72

```
produces a return that is 53 basis points per month (6.5% annual) greater than the risk free rate

and a beta that is close to zero. However, when the market return is more than 4% below the risk
```

### Excerpt 73

```
and a beta that is close to zero. However, when the market return is more than 4% below the risk

free rate, the risk arbitrage market beta increases to 0.49.
```

### Excerpt 74

```
free rate, the risk arbitrage market beta increases to 0.49.
```

### Excerpt 75

```
the VWRA average return is 16.05%, the equal weighted average is 18.08%.
9
  A formal test of the null hypothesis that the risk arbitrage market beta is the same in appreciating and
```

### Excerpt 76

```
9
  A formal test of the null hypothesis that the risk arbitrage market beta is the same in appreciating and
depreciating markets rejects at the 0.001 level (see Jagannathan and Korajczyk (1986) for a description of
the procedures used to test for non-linearity in return series).
```

### Excerpt 77

```
A formal test of the null hypothesis that the risk arbitrage market beta is the same in appreciating and
depreciating markets rejects at the 0.001 level (see Jagannathan and Korajczyk (1986) for a description of
the procedures used to test for non-linearity in return series).
```

### Excerpt 78

```
Panels B, C and D of Table IV show that in all subperiods, market betas are significantly

different in up and down markets. Furthermore, except for the 1963-1979 time period when
```

### Excerpt 79

```
market returns, these intercepts cannot be interpreted as excess returns. Scatter plots of RAIM

returns versus market returns for various subperiods are shown in Figure 4. This figure shows
```

### Excerpt 80

```
The increase in market beta in depreciating markets is caused, at least in part, by the

increased probability of deal failure following a severe market downturn. Table V shows results
```

### Excerpt 81

```
increased probability of deal failure following a severe market downturn. Table V shows results

from a probit regression that estimates the probability of deal failure. For purposes of this
```

### Excerpt 82

```
market downturns. Based on the coefficient estimates in Table V, a 5% decrease in either the

contemporaneous market return or the lagged market return increases the probability of deal
```

### Excerpt 83

```
failure by 2.25%. Table V also shows that hostile deals have a 12.8% greater probability of

failure than friendly deals. In our dataset, “hostile” refers to deals in which the Dow Jones News
```

### Excerpt 84

```
11
   In addition to the probit model described in Table V, we also examined the effect of a market decline on
the ratio of failed deals in the month to active deals in the month. Results from this analysis are consistent
with those obtained from the probit model. A 5% decline in the market in the previous month increases the
```

### Excerpt 85

```
with those obtained from the probit model. A 5% decline in the market in the previous month increases the
fail/active ratio from 0.050 to 0.059, an increase of 18%. This effect is significant at the 0.1% level.
```

### Excerpt 86

```
depreciating markets, the “down-market” beta in our piecewise linear regressions should be

greater when the sample is limited to cash transactions. Table VI presents results from estimating
```

### Excerpt 87

```
greater when the sample is limited to cash transactions. Table VI presents results from estimating

the piecewise linear regressions after segmenting the data by means of payment. Panel A of
```

### Excerpt 88

```
Table VI presents results for cash transactions and Panel B presents results for stock transactions.

This table confirms that the down market beta is much greater when the sample is limited to cash
```

### Excerpt 89

```
This table confirms that the down market beta is much greater when the sample is limited to cash

transactions (0.77) than when it is limited to stock transactions (0.15).
```

### Excerpt 90

```
transactions (0.77) than when it is limited to stock transactions (0.15).
```

### Excerpt 91

```
Calculating the RAIM returns used in this paper requires numerous assumptions

regarding transaction costs and limitations associated with implementing the merger arbitrage
```

### Excerpt 92

```
test whether our assumptions are generating the non-linear relationship between RAIM and

market returns, we performed the analysis using alternative assumptions for diversification
```

### Excerpt 93

```
Table VII. Scenarios 1 through 4 in Table VII present results for various levels of transaction

costs. Comparing scenarios 1 and 2 indicates that direct transaction costs (e.g. brokerage
```

### Excerpt 94

```
commissions) decrease returns by approximately 1.37% annually. The effect of indirect

transaction costs (price impact) can be estimated by comparing returns from scenarios 2 and 3.
```

### Excerpt 95

```
indirect transaction costs decrease annual returns by 1.49%. If instead of eliminating indirect

transaction costs we double them (scenario 4), returns are reduced by 2.51%. Comparing the
```

### Excerpt 96

```
transaction costs we double them (scenario 4), returns are reduced by 2.51%. Comparing the
```

### Excerpt 97

```
13.50% return in scenario 3 (no transaction costs) with the VWRA annual return of 16.05%

reported in Table II (no transaction costs or practical limitations) indicates that practical
```

### Excerpt 98

```
reported in Table II (no transaction costs or practical limitations) indicates that practical

limitations reduce annual returns by 2.5% per year.
```

### Excerpt 99

```
limitations reduce annual returns by 2.5% per year.

        Scenario 5 provides an estimate of the return generated by the interest paid on short
```

### Excerpt 100

```
proceeds. The 2.02% difference in annual returns represents the portion of risk arbitrage returns

that are generated by interest payments on short proceeds.
```
