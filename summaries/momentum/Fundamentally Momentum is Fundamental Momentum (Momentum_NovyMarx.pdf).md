# Fundamentally, Momentum Is Fundamental Momentum — Novy-Marx (working paper) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Fundamentally, momentum is fundamental momentum |
| **Author** | Robert Novy-Marx (Simon Graduate School of Business, University of Rochester) |
| **Type** | Working paper / asset-pricing empirics |
| **JEL** | G12 |
| **Keywords** | Momentum, earnings surprises, PEAD, factor models |
| **Sample** | US equities, **January 1975 – December 2012** (SUE/CAR3 data constraints) |
| **Original PDF** | `Momentum_NovyMarx.pdf` |
| **Drive file id** | `15e_eDRAx0_6i1MXaJTs3psCk-QSHVM9F` |
| **Extraction** | `pdftotext` (~12,504 words); text usable |

Thanks: Fama, French, Milena Novy-Marx, Schwert.

---

## Problem / Motivation

Price momentum (Jegadeesh–Titman; Carhart UMD)—winners over the prior year outperform losers—is often called the premier anomaly: large, volatile, hard to reconcile with risk-based stories, and **wrong-signed** under Fama–French three-factor logic (negative HML loading predicts negative, not positive, average returns).

Chan, Jegadeesh & Lakonishok (1996, CJL) concluded that past returns and earnings surprises **each** predict drifts after controlling for the other, based largely on coarse 3×3 independent sorts. Novy-Marx argues that evidence is weak (within an earnings tertile, sorting on past return still induces earnings-surprise variation) and that stronger tests show **earnings momentum subsumes price momentum**.

Related: Chordia–Shivakumar (2006) reach similar conclusions but primarily in small caps; this paper shows results in **large caps** too, and extends to **volatility-managed** momentum (Barroso–Santa-Clara; Daniel–Moskowitz). Further: price momentum *inside* earnings-momentum strategies is **detrimental**—it adds volatility and crash risk without adding expected return.

---

## Measurement

- **Past performance:** $r_{2,12}$ — return over prior year skipping most recent month (avoids short-term reversal).
- **SUE:** year-over-year change in EPS (Compustat EPSPXQ), scaled by SD of earnings innovations over last 8 announcements (min 6). Announcement dates: RDQ.
- **CAR3:** cumulative market-excess return from day −1 to day +1 around most recent earnings announcement.

**Average rank correlations:** $r_{2,12}$–SUE **29.1%**; $r_{2,12}$–CAR3 **13.7%**; SUE–CAR3 **19.9%**. SUE correlates more with past returns than with announcement-window returns → much of the EPS change is priced **before** the announcement.

Controls in FM regressions: $\ln(\mathrm{ME})$, $\ln(B/M)$, GP/A (Novy-Marx 2013), $r_{0,1}$. Independents trimmed 1/99%.

---

## Fama–MacBeth Results (Table 1)

Full sample 1/75–12/12; also 1/75–12/93 (≈ CJL era) and 1/94–12/12.

| Spec | $r_{2,12}$ | SUE | CAR3 | Notes |
|------|-------------|-----|------|-------|
| (1) alone | **0.59 [2.84]** | | | momentum present |
| (2) earnings only | | **0.27 [17.0]** | **5.84 [19.7]** | very strong |
| (3) joint | **0.15 [0.70]** | **0.26 [19.2]** | **5.75 [20.4]** | **price mom insignificant** |
| Early (4)/(5) | 0.80 [3.79] → 0.30 [1.28] | 0.30 [16.4] | 6.63 [15.2] | attenuation |
| Late (6)/(7) | 0.38 [1.05] → **−0.00 [−0.00]** | 0.21 [11.2] | 4.87 [13.9] | mom dies; earnings live |

Controls: size weak/negative; B/M and GP/A positive; short-term reversal strongly negative ($r_{0,1}$ ≈ −5 to −8).

**Conclusion:** earnings surprises **subsume** $r_{2,12}$ in the cross section; adding past return barely moves SUE/CAR3 coefficients.

---

## Factor Construction and Spanning (Table 2)

**UMD:** Ken French. **SUE & CAR3 factors:** 2×3 sorts (NYSE median size × NYSE 30/70 earnings-surprise breaks); factor = average of value-weighted large and small high-minus-low. Figure 1: \$1 growth 1975–2012, factors scaled to **10% sample vol**—SUE and CAR3 paths dominate UMD (higher Sharpe).

### Panel A: $y=$ UMD

| Spec | $\alpha$ | Loadings | adj $R^2$ |
|------|------------|----------|-------------|
| (1) mean | **0.64 [3.03]** | | |
| (2) FF3 | **0.85 [4.05]** | MKT −0.18, SMB 0.07, HML −0.34 | 5.8% |
| (3) FF3+SUE+CAR3 | **−0.48 [−2.55]** | $\beta_{SUE}=1.18[10.9]$, $\beta_{CAR3}=0.84[6.09]$ | **40.6%** |
| Early (5) | −0.03 [−0.13] | | 25.4% |
| Late (7) | **−0.60 [−2.16]** | | 50.1% |

UMD earns 64 bps/month raw but **negative alpha** once earnings-momentum factors are included.

### Panel B: $y=$ SUE

Mean **0.59 [7.14]**; FF3 $\alpha=0.70[8.68]$; vs FF3+UMD+CAR3: $\alpha=0.38[5.31]$ still highly significant. Subsamples both strong.

### Panel C: $y=$ CAR3

Mean **0.53 [8.42]**; FF3 $\alpha=0.59[9.35]$; full controls $\alpha=0.37[6.18]$ still strong.

**Investor implication:** an investor who wants momentum exposure can **ignore price momentum** and trade earnings momentum; the reverse is false.

---

## Results by Size (Table 3)

Within each NYSE size quintile, build WML / SUE / CAR3 (top–bottom 30%, VW, monthly). Spanning conclusions hold in **large-cap quintiles**, not only microcaps—addresses the Chordia–Shivakumar identification concern.

---

## Controlling for the Other Characteristic (Section 3, Tables 4–5)

Construct conditional strategies:
- **UMD\|SUE:** price momentum neutralizing earnings surprise.
- **SUE\|UMD:** earnings momentum neutralizing past return.
- Analogues with CAR3.

**Findings:**
- Controlling for earnings surprises **cuts price-momentum returns** sharply without cutting volatility → worse Sharpe; crashes remain.
- Controlling for past returns when forming earnings strategies **cuts volatility and eliminates momentum-style crashes** without cutting average returns → **higher Sharpe**, better skewness (Table 5 higher moments).

Figure 2: double-sort average past performance and earnings surprises—shows residual variation. Figure 3: cumulative performance of UMD, UMD\|SUE, SUE, SUE\|UMD.

Table 5: negative skewness / crash features of momentum are **driven by the price-momentum component** of earnings strategies.

---

## Constant-Volatility Strategies (Section 4, Table 6)

Barroso–Santa-Clara / Daniel–Moskowitz: scale momentum to target vol using trailing realized vol → Sharpe roughly **doubles**. Novy-Marx: same vol-management helps SUE/CAR3; **vol-managed earnings momentum still subsumes vol-managed UMD**. Figure 4: trailing 12-month leverage paths. Figure 5: constant-vol performance time series.

---

## Transaction Costs (Appendix Table A1)

Net of costs, all three strategies weaken, but **earnings still subsume price momentum**. Table A2: ex-post MVE portfolio weights tilt to earnings factors. Tables A4–A7: underlying portfolio details, conditional strategy construction.

---

## Limitations

- US sample from 1975 (Compustat earnings-announcement coverage).
- SUE definition choices (window length, EPS item) can matter at the margin.
- CJL used percentile ranks and longer-horizon returns—design differences, not only sample, drive disagreement.
- Spanning tests are linear; nonlinear dependence possible.
- TCA analysis in appendix is stylized; live PEAD capacity varies by size.
- Does not claim earnings surprises are “risk”; still an anomaly—just the *more primitive* anomaly.

---

## Practical Takeaways for a Quant Investor

1. **Replace or subordinate UMD with earnings-momentum factors (SUE, CAR3 / PEAD)** in the factor zoo and in risk models that need a momentum sleeve.
2. In FM-style alpha research, **never claim price-momentum alpha without SUE/CAR3 controls**.
3. When trading PEAD/SUE, **neutralize $r_{2,12}$** to reduce vol and crash risk without sacrificing mean return.
4. Do **not** neutralize SUE when trading price momentum—you destroy the return.
5. Vol-targeting helps both, but does not resurrect independent price-momentum alpha.
6. Large-cap investability: results hold in upper size quintiles—capacity story better than pure microcap PEAD.
7. Interpret Hou–Xue–Zhang “ROE factor” success on momentum (Novy-Marx 2015 companion point): much of it is **earnings surprise**, not earnings *level*—do not conflate profitability with PEAD.

---

## Key Numbers

| Object | Value |
|--------|-------|
| UMD mean | 64 bps/mo [3.03] |
| UMD α vs FF3+SUE+CAR3 | **−48 bps [−2.55]** |
| SUE mean | 59 bps [7.14] |
| CAR3 mean | 53 bps [8.42] |
| FM $r_{2,12}$ alone / with earnings | 0.59 [2.84] / 0.15 [0.70] |
| Rank corr $r_{2,12}$, SUE | 29.1% |
| Sample | 1975–2012 |

---

## Extended Discussion

CJL’s 3×3 sorts are too coarse: the conditional distribution of SUE given a past-return tertile is still wide, so “controlling” for earnings by tertile fails. Continuous FM and time-series spanning are stricter. Time-series spanning is also more robust to measurement error in firm-level SUE.

Why does price momentum exist at all? It is a noisy proxy for fundamental momentum: markets partially incorporate earnings news before announcements (rank corr structure), then underreact (PEAD), and past returns pick up both the pre-announcement incorporation and the underreaction. Once SUE/CAR3 are held fixed, residual past-return variation is mostly noise and crash-prone comovement.

Crash mechanism: momentum crashes occur in violent rebounds when losers rally; earnings-neutral price momentum still loads on that. Past-return-neutral earnings momentum avoids holding the extreme loser cohort on price alone, improving skewness.

For portfolio construction: a practical “clean momentum” book is long high-SUE / high-CAR3 names with controls for $r_{2,12}$, size, and value—close to SUE\|UMD. A dirty book that piles UMD on top adds risk without alpha in spanning tests.

Relation to industry momentum and intermediate-horizon momentum (Novy-Marx other work): this paper’s claim is specifically about **earnings news as the driver of standard 2–12 price momentum**, not a denial of all serial correlation structures.

### Process Checklist

1. Build SUE and CAR3 with the EPSPXQ/RDQ definitions above; require ≥6 of 8 announcements.
2. Form 2×3 factors mirroring UMD methodology for clean spanning comparisons.
3. Run FM with GP/A, B/M, size, $r_{0,1}$, $r_{2,12}$, SUE, CAR3.
4. Spanning: regress UMD on FF3+SUE+CAR3; expect insignificant/negative α.
5. Build SUE\|UMD via residual sorts or conditional sorts; compare Sharpe and skew to raw SUE.
6. Optional: constant-vol overlay using 12-month trailing vol.
7. Net of costs: focus on large-cap PEAD; avoid microcap capacity illusions.

### Final Assessment

Novy-Marx reframes momentum: **the anomaly worth trading and modeling is earnings momentum; price momentum is its noisy shadow.** Quantitatively, UMD’s 64 bps mean becomes −48 bps α after SUE and CAR3; FM coefficients on $r_{2,12}$ lose significance once earnings surprises enter. Implementation should neutralize past returns inside PEAD books and stop treating UMD as an independent priced factor once earnings surprises are in the model.


---

## Source Evidence Appendix — Novy-Marx

Curated quantitative excerpts from the extracted PDF text for auditability.

### Excerpt 1

```
not subsume the other” (pp. 1682–3). They draw this conclusion primarily on the basis
of return spreads they see in both directions from an independent three by three portfolio
```

### Excerpt 2

```
base their conclusion. These sorts are far too coarse to provide adequate controls for the
two variables. In any third of the stock universe picked on the basis of earnings surprises,
sorting on past performance still induces significant variation in earnings surprises.
```

### Excerpt 3

```
momentum. Price momentum strategies do not have a positive alpha relative to earnings
momentum strategies, while earnings momentum strategies have large, highly significant
alphas relative to price momentum strategies. This suggests that an investor who wants to
```

### Excerpt 4

```
momentum strategies, while earnings momentum strategies have large, highly significant
alphas relative to price momentum strategies. This suggests that an investor who wants to

trade momentum would lose nothing by completely ignoring price momentum.
```

### Excerpt 5

```
find that price momentum strategies that invest more aggressively when volatility is
low have Sharpe ratios twice as large as the already high Sharpe ratios observed on
their conventional counterparts. I show here that managing volatility also improves the
```

### Excerpt 6

```
by price momentum generate average returns comparable to their traditional counterparts,
they have significantly higher Sharpe ratios.

   The remainder of the paper proceeds as follows. Section 2 establishes the basic asset
```

### Excerpt 7

```
with short term reversals (r2;12 ). For earnings surprises I use two measures commonly
employed in the literature, standardized unexpected earnings (SUE) and cumulative three
day abnormal returns (CAR3). SUE is defined as the most recent year-over-year change in
```

### Excerpt 8

```
employed in the literature, standardized unexpected earnings (SUE) and cumulative three
day abnormal returns (CAR3). SUE is defined as the most recent year-over-year change in

earnings per share, scaled by the standard deviation of the earnings innovations over the last
```

### Excerpt 9

```
dates are Compustat quarterly data item RDQ. CAR3 is defined as the cumulative return
in excess of that earned by the market over the three days starting the day before the
most recent earnings announcement and ending at the end of the day following the
```

### Excerpt 10

```
announcement.
   The time-series average rank correlation between r2;12 and SUE is 29.1%, between
r2;12 and CAR3 is 13.7%, and between SUE and CAR3 is 19.9%. This suggests that
```

### Excerpt 11

```
The time-series average rank correlation between r2;12 and SUE is 29.1%, between
r2;12 and CAR3 is 13.7%, and between SUE and CAR3 is 19.9%. This suggests that

                                              4
```

### Excerpt 12

```
largely expected; SUE correlates more strongly with past performance than it does with
the market’s contemporaneous reaction to the earnings’ announcements. Past performance
reflects innovations to investors’ beliefs about a firm’s prospects, including guidance the
```

### Excerpt 13

```
firm has provided regarding it operations, some of which is reflected directly in announced
earnings. The fact that SUE correlates more strongly with r2;12 than with CAR3 indicates
that more of the information regarding the change in earnings per share is incorporated into
```

### Excerpt 14

```
Table 1 reports results of Fama-MacBeth (1973) regressions of individual monthly
stock returns onto the past performance (r2;12 ), and the most recent earnings surprises
measured by both standardized unexpected earnings (SUE) and cumulative three day
```

### Excerpt 15

```
stock returns onto the past performance (r2;12 ), and the most recent earnings surprises
measured by both standardized unexpected earnings (SUE) and cumulative three day

abnormal returns (CAR3). Regressions include controls for other variables known to
```

### Excerpt 16

```
abnormal returns (CAR3). Regressions include controls for other variables known to
predict the cross sectional of returns, size, relative valuations, profitability, and short
horizon past performance. I measure these variables by the log of market capitalizations
```

### Excerpt 17

```
full sample covers January 1975 through December 2012, dates determined by the data
requirements for making the SUE and CAR3 strategies. The table also reports subsample
results. The first period, January 1975 through December 1993, largely coincides with the
    1
```

### Excerpt 18

```
Table 1. Fama-MacBeth regressions
The table reports results of Fama-MacBeth (1973) regressions of individual monthly stock returns onto past
performance, measured over the preceding year skipping the most recent month (r2;12 ), and firms’ most recent
```

### Excerpt 19

```
Table 1. Fama-MacBeth regressions
The table reports results of Fama-MacBeth (1973) regressions of individual monthly stock returns onto past
performance, measured over the preceding year skipping the most recent month (r2;12 ), and firms’ most recent
earnings surprises, measured using both standardized unexpected earnings (SUE) and the cumulative three
```

### Excerpt 20

```
performance, measured over the preceding year skipping the most recent month (r2;12 ), and firms’ most recent
earnings surprises, measured using both standardized unexpected earnings (SUE) and the cumulative three
day abnormal returns around the most recent earnings announcement (CAR3). Regressions include controls
for other variables known to predict cross sectional variation in expected returns, the log of firms’ market
```

### Excerpt 21

```
earnings surprises, measured using both standardized unexpected earnings (SUE) and the cumulative three
day abnormal returns around the most recent earnings announcement (CAR3). Regressions include controls
for other variables known to predict cross sectional variation in expected returns, the log of firms’ market
capitalizations (ln(ME)), the log of firms’ book-to-market ratios (ln(B/M)), gross profitability (GP/A, where
```

### Excerpt 22

```
variables are trimmed at the one and 99% levels. The sample covers January 1975 through December 2012,
with the dates determined by the data requirements for making the SUE and CAR3 strategies.
                         Full sample                         1/75–12/93                   1/94–12/12
                 (1)          (2)           (3)             (4)       (5)                (6)       (7)
```

### Excerpt 23

```
(1)          (2)           (3)             (4)       (5)                (6)       (7)
 r2;12          0.59                       0.15            0.80        0.30             0.38         -0.00
               [2.84]                    [0.70]           [3.79]      [1.28]           [1.05]       [-0.00]
 SUE                          0.27         0.26                        0.30                           0.21
```

### Excerpt 24

```
r2;12          0.59                       0.15            0.80        0.30             0.38         -0.00
               [2.84]                    [0.70]           [3.79]      [1.28]           [1.05]       [-0.00]
 SUE                          0.27         0.26                        0.30                           0.21
                             [17.0]      [19.2]                       [16.4]                         [11.2]
```

### Excerpt 25

```
[2.84]                    [0.70]           [3.79]      [1.28]           [1.05]       [-0.00]
 SUE                          0.27         0.26                        0.30                           0.21
                             [17.0]      [19.2]                       [16.4]                         [11.2]
 CAR3                         5.84         5.75                        6.63                           4.87
```

### Excerpt 26

```
[17.0]      [19.2]                       [16.4]                         [11.2]
 CAR3                         5.84         5.75                        6.63                           4.87
                             [19.7]      [20.4]                       [15.2]                         [13.9]
 ln(ME)         -0.06        -0.08        -0.08            -0.11       -0.13            -0.01        -0.04
```

### Excerpt 27

```
[19.7]      [20.4]                       [15.2]                         [13.9]
 ln(ME)         -0.06        -0.08        -0.08            -0.11       -0.13            -0.01        -0.04
               [-1.39]      [-1.69]      [-1.93]          [-1.92]     [-2.11]          [-0.11]      [-0.64]
 ln(B/M)         0.44         0.30         0.32            0.46        0.38              0.42         0.27
```

### Excerpt 28

```
ln(ME)         -0.06        -0.08        -0.08            -0.11       -0.13            -0.01        -0.04
               [-1.39]      [-1.69]      [-1.93]          [-1.92]     [-2.11]          [-0.11]      [-0.64]
 ln(B/M)         0.44         0.30         0.32            0.46        0.38              0.42         0.27
               [5.96]        [3.82]      [4.47]           [4.94]      [3.93]           [3.65]        [2.47]
```

### Excerpt 29

```
[-1.39]      [-1.69]      [-1.93]          [-1.92]     [-2.11]          [-0.11]      [-0.64]
 ln(B/M)         0.44         0.30         0.32            0.46        0.38              0.42         0.27
               [5.96]        [3.82]      [4.47]           [4.94]      [3.93]           [3.65]        [2.47]
 GP/A            0.91         0.76         0.75            0.89        0.74              0.93         0.77
```

### Excerpt 30

```
ln(B/M)         0.44         0.30         0.32            0.46        0.38              0.42         0.27
               [5.96]        [3.82]      [4.47]           [4.94]      [3.93]           [3.65]        [2.47]
 GP/A            0.91         0.76         0.75            0.89        0.74              0.93         0.77
               [6.82]        [5.58]      [5.60]           [5.00]      [4.17]           [4.67]        [3.79]
```

### Excerpt 31

```
[5.96]        [3.82]      [4.47]           [4.94]      [3.93]           [3.65]        [2.47]
 GP/A            0.91         0.76         0.75            0.89        0.74              0.93         0.77
               [6.82]        [5.58]      [5.60]           [5.00]      [4.17]           [4.67]        [3.79]
 r0;1           -4.66        -5.83        -6.00            -6.49       -8.07            -2.83        -3.92
```

### Excerpt 32

```
GP/A            0.91         0.76         0.75            0.89        0.74              0.93         0.77
               [6.82]        [5.58]      [5.60]           [5.00]      [4.17]           [4.67]        [3.79]
 r0;1           -4.66        -5.83        -6.00            -6.49       -8.07            -2.83        -3.92
               [-10.2]      [-11.9]      [-12.9]          [-12.1]     [-14.0]          [-3.89]      [-5.53]
```

### Excerpt 33

```
[6.82]        [5.58]      [5.60]           [5.00]      [4.17]           [4.67]        [3.79]
 r0;1           -4.66        -5.83        -6.00            -6.49       -8.07            -2.83        -3.92
               [-10.2]      [-11.9]      [-12.9]          [-12.1]     [-14.0]          [-3.89]      [-5.53]
```

### Excerpt 34

```
r0;1           -4.66        -5.83        -6.00            -6.49       -8.07            -2.83        -3.92
               [-10.2]      [-11.9]      [-12.9]          [-12.1]     [-14.0]          [-3.89]      [-5.53]
```

### Excerpt 35

```
The results of the Fama-MacBeth regressions shown in Table 1 suggest that the power

of past performance to predict the cross section of returns is largely subsumed by earnings
```

### Excerpt 36

```
strategies, among those constructed using past performance and the two measures of
earnings surprises, generate significant alpha relative to the others.       They do so by
regressing the returns of a test strategy, taken from the set of momentum strategies, onto the
```

### Excerpt 37

```
the test strategy.
       For the price momentum strategy I use the up-minus-down factor, UMD, available from
Ken French’s data library.2 For the earnings momentum factors I construct analogues
```

### Excerpt 38

```
to UMD based on the two measures of earnings surprises. Specifically, these factors
are constructed from underlying portfolios that are formed monthly, as the intersection
of two size and three earnings momentum portfolios. The size portfolios divide stocks
```

### Excerpt 39

```
SUE or CAR3. The earnings momentum factors are each formed as an equal weighted
average of value weighted large cap and small cap earnings momentum strategies, which
buy the upper tertile and short the bottom tertile of the earnings surprises portfolios based
```

### Excerpt 40

```
these earnings momentum factors are denoted SUE and CAR3, the same as the earnings
surprise measures on which they are based. The performance of the portfolios underlying
these factors is provided in the Appendix, in Table A4.
```

### Excerpt 41

```
surprise measures on which they are based. The performance of the portfolios underlying
these factors is provided in the Appendix, in Table A4.

       Figure 1 shows the performance of the three momentum factors, UMD, SUE, and
```

### Excerpt 42

```
Figure 1 shows the performance of the three momentum factors, UMD, SUE, and
CAR3. The figure shows the growth of a dollar, net of financing costs, invested in the
beginning of 1975 into each of the strategies. To facilitate comparison, the strategies are
```

### Excerpt 43

```
Figure 1 shows the performance of the three momentum factors, UMD, SUE, and
CAR3. The figure shows the growth of a dollar, net of financing costs, invested in the
beginning of 1975 into each of the strategies. To facilitate comparison, the strategies are
```

### Excerpt 44

```
momentum strategies dramatically outperformed the price momentum strategy, suggesting
that these strategies had significantly higher Sharpe rations than UMD.

       Table 2 analyzes the performance of the three momentum factors formally. Panel A
```

### Excerpt 45

```
Table 2 analyzes the performance of the three momentum factors formally. Panel A
shows the performance of UMD. Specification one shows that over the 38 year sample
   2
```

### Excerpt 46

```
Table 2 analyzes the performance of the three momentum factors formally. Panel A
shows the performance of UMD. Specification one shows that over the 38 year sample
   2
       The library resides at http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data library.html.
```

### Excerpt 47

```
CAR3
$100               SUE
                   UMD
```

### Excerpt 48

```
CAR3
$100               SUE
                   UMD
```

### Excerpt 49

```
$100               SUE
                   UMD
```

### Excerpt 50

```
Fig. 1. Comparison of momentum factor performance. The figure shows the value of a dollar
invested at the beginning of 1975 in the price momentum factor, UMD (dashed line), and the
earnings momentum factors, SUE (solid line) and CAR3 (dotted line). Returns are calculated net of
financing costs (i.e., are excess returns). To facilitate comparison, factors are scaled to have a sample
```

### Excerpt 51

```
invested at the beginning of 1975 in the price momentum factor, UMD (dashed line), and the
earnings momentum factors, SUE (solid line) and CAR3 (dotted line). Returns are calculated net of
financing costs (i.e., are excess returns). To facilitate comparison, factors are scaled to have a sample
volatilities of 10%. The sample covers January 1975 through December 2012, dates determined by
```

### Excerpt 52

```
volatilities of 10%. The sample covers January 1975 through December 2012, dates determined by
the data required to make the SUE and CAR3.
```

### Excerpt 53

```
the standard price momentum factor earned a highly significant 64 basis points per month,
with a t-statistic of 3.03. Specification two provides the standard result that momentum’s
```

### Excerpt 54

```
the standard price momentum factor earned a highly significant 64 basis points per month,
with a t-statistic of 3.03. Specification two provides the standard result that momentum’s

Fama and French three-factor alpha is even larger. Specification three shows that UMD
```

### Excerpt 55

```
Fama and French three-factor alpha is even larger. Specification three shows that UMD
loads heavily on both SUE and CAR3, and as a result has a significant negative alpha
relative to earnings momentum, even after controlling for the three Fama and French
```

### Excerpt 56

```
Fama and French three-factor alpha is even larger. Specification three shows that UMD
loads heavily on both SUE and CAR3, and as a result has a significant negative alpha
relative to earnings momentum, even after controlling for the three Fama and French
factors. This fact, that earnings momentum subsumes price momentum in time-series
```

### Excerpt 57

```
Specifications four through seven show consistent subsample results. UMD generates
positive returns over both the early and late halves of the sample, though these were only
statistically significant over the early sample. Yet even in the early sample, when UMD
```

### Excerpt 58

```
positive returns over both the early and late halves of the sample, though these were only
statistically significant over the early sample. Yet even in the early sample, when UMD

earns 85 bps/month, it fails to generate abnormal returns relative to the price momentum
```

### Excerpt 59

```
earns 85 bps/month, it fails to generate abnormal returns relative to the price momentum
factors.
   Panels B and C show that the performance of each of the earnings momentum factors,
```

### Excerpt 60

```
Panels B and C show that the performance of each of the earnings momentum factors,
SUE and CAR3, is not explained by the other factors. The earnings momentum strategies

both generate highly significant returns over the whole sample, with t-statistics exceeding
```

### Excerpt 61

```
both generate highly significant returns over the whole sample, with t-statistics exceeding
seven for SUE and eight for CAR3. For both factors the returns are highly significant over
both subsamples, though roughly 50% larger and more significant over the early sample.
```

### Excerpt 62

```
both generate highly significant returns over the whole sample, with t-statistics exceeding
seven for SUE and eight for CAR3. For both factors the returns are highly significant over
both subsamples, though roughly 50% larger and more significant over the early sample.
```

### Excerpt 63

```
Table 2
Momentum factor spanning tests
 This table presents results of time-series regressions of the form:
```

### Excerpt 64

```
Momentum factor spanning tests
 This table presents results of time-series regressions of the form:
                                          yt   D ˛ C ˇ 0 Xt C " t
```

### Excerpt 65

```
where the yt are the monthly excess returns to the price momentum factor, UMD, or the earnings momentum
factors, SUE and CAR3, and the explanatory factors are the returns to the Fama and French factors (MKT,
SMB, and HML), or these factors and the other two momentum factors. The sample covers January 1975
```

### Excerpt 66

```
where the yt are the monthly excess returns to the price momentum factor, UMD, or the earnings momentum
factors, SUE and CAR3, and the explanatory factors are the returns to the Fama and French factors (MKT,
SMB, and HML), or these factors and the other two momentum factors. The sample covers January 1975
through December 2012, dates determined by the data required to make the SUE and CAR3.
```

### Excerpt 67

```
SMB, and HML), or these factors and the other two momentum factors. The sample covers January 1975
through December 2012, dates determined by the data required to make the SUE and CAR3.
                            Full sample                       1/75–12/93            1/94–12/12
                     (1)         (2)           (3)           (4)      (5)          (6)      (7)
```

### Excerpt 68

```
(1)         (2)           (3)           (4)      (5)          (6)      (7)
 Panel A: y D UMD
 ˛             0.64             0.85        -0.48           0.82        -0.03      0.46       -0.60
              [3.03]           [4.05]      [-2.55]         [3.67]      [-0.13]    [1.29]     [-2.16]
```

### Excerpt 69

```
Panel A: y D UMD
 ˛             0.64             0.85        -0.48           0.82        -0.03      0.46       -0.60
              [3.03]           [4.05]      [-2.55]         [3.67]      [-0.13]    [1.29]     [-2.16]
 ˇMKT                           -0.18       -0.04                       0.08                  -0.08
```

### Excerpt 70

```
˛             0.64             0.85        -0.48           0.82        -0.03      0.46       -0.60
              [3.03]           [4.05]      [-2.55]         [3.67]      [-0.13]    [1.29]     [-2.16]
 ˇMKT                           -0.18       -0.04                       0.08                  -0.08
                               [-3.83]     [-1.12]                     [1.60]                [-1.32]
```

### Excerpt 71

```
[3.03]           [4.05]      [-2.55]         [3.67]      [-0.13]    [1.29]     [-2.16]
 ˇMKT                           -0.18       -0.04                       0.08                  -0.08
                               [-3.83]     [-1.12]                     [1.60]                [-1.32]
 ˇSMB                           0.07         0.22                       0.02                  0.33
```

### Excerpt 72

```
ˇMKT                           -0.18       -0.04                       0.08                  -0.08
                               [-3.83]     [-1.12]                     [1.60]                [-1.32]
 ˇSMB                           0.07         0.22                       0.02                  0.33
                               [1.07]      [3.87]                      [0.24]                [4.05]
```

### Excerpt 73

```
[-3.83]     [-1.12]                     [1.60]                [-1.32]
 ˇSMB                           0.07         0.22                       0.02                  0.33
                               [1.07]      [3.87]                      [0.24]                [4.05]
 ˇHML                           -0.34       -0.17                       -0.16                 -0.14
```

### Excerpt 74

```
ˇSMB                           0.07         0.22                       0.02                  0.33
                               [1.07]      [3.87]                      [0.24]                [4.05]
 ˇHML                           -0.34       -0.17                       -0.16                 -0.14
                               [-4.65]     [-2.96]                     [-1.92]               [-1.66]
```

### Excerpt 75

```
[1.07]      [3.87]                      [0.24]                [4.05]
 ˇHML                           -0.34       -0.17                       -0.16                 -0.14
                               [-4.65]     [-2.96]                     [-1.92]               [-1.66]
 ˇSUE                                        1.18                       0.90                  1.35
```

### Excerpt 76

```
ˇHML                           -0.34       -0.17                       -0.16                 -0.14
                               [-4.65]     [-2.96]                     [-1.92]               [-1.66]
 ˇSUE                                        1.18                       0.90                  1.35
                                           [10.9]                      [6.17]                [8.59]
```

### Excerpt 77

```
[-4.65]     [-2.96]                     [-1.92]               [-1.66]
 ˇSUE                                        1.18                       0.90                  1.35
                                           [10.9]                      [6.17]                [8.59]
 ˇCAR3                                       0.84                       0.34                  1.03
```

### Excerpt 78

```
ˇSUE                                        1.18                       0.90                  1.35
                                           [10.9]                      [6.17]                [8.59]
 ˇCAR3                                       0.84                       0.34                  1.03
                                           [6.09]                      [1.82]                [5.18]
```

### Excerpt 79

```
[10.9]                      [6.17]                [8.59]
 ˇCAR3                                       0.84                       0.34                  1.03
                                           [6.09]                      [1.82]                [5.18]
 adj.-R2 (%)                     5.8         40.6                       25.4                  50.1
```

### Excerpt 80

```
ˇCAR3                                       0.84                       0.34                  1.03
                                           [6.09]                      [1.82]                [5.18]
 adj.-R2 (%)                     5.8         40.6                       25.4                  50.1
 Panel B: y D SUE
```

### Excerpt 81

```
adj.-R2 (%)                     5.8         40.6                       25.4                  50.1
 Panel B: y D SUE
 ˛                  0.59        0.70         0.38           0.71        0.41       0.46       0.34
                   [7.14]      [8.68]      [5.31]          [7.20]      [4.18]     [3.53]     [3.36]
```

### Excerpt 82

```
Panel B: y D SUE
 ˛                  0.59        0.70         0.38           0.71        0.41       0.46       0.34
                   [7.14]      [8.68]      [5.31]          [7.20]      [4.18]     [3.53]     [3.36]
 ˇMKT                           -0.08       -0.03                       -0.04                 -0.05
```

### Excerpt 83

```
˛                  0.59        0.70         0.38           0.71        0.41       0.46       0.34
                   [7.14]      [8.68]      [5.31]          [7.20]      [4.18]     [3.53]     [3.36]
 ˇMKT                           -0.08       -0.03                       -0.04                 -0.05
                               [-4.25]     [-1.94]                     [-1.74]               [-2.11]
```

### Excerpt 84

```
[7.14]      [8.68]      [5.31]          [7.20]      [4.18]     [3.53]     [3.36]
 ˇMKT                           -0.08       -0.03                       -0.04                 -0.05
                               [-4.25]     [-1.94]                     [-1.74]               [-2.11]
 ˇSMB                           -0.11       -0.11                       -0.03                 -0.15
```

### Excerpt 85

```
ˇMKT                           -0.08       -0.03                       -0.04                 -0.05
                               [-4.25]     [-1.94]                     [-1.74]               [-2.11]
 ˇSMB                           -0.11       -0.11                       -0.03                 -0.15
                               [-3.94]     [-5.21]                     [-0.80]               [-5.10]
```

### Excerpt 86

```
[-4.25]     [-1.94]                     [-1.74]               [-2.11]
 ˇSMB                           -0.11       -0.11                       -0.03                 -0.15
                               [-3.94]     [-5.21]                     [-0.80]               [-5.10]
 ˇHML                           -0.10       -0.02                       -0.09                 0.00
```

### Excerpt 87

```
ˇSMB                           -0.11       -0.11                       -0.03                 -0.15
                               [-3.94]     [-5.21]                     [-0.80]               [-5.10]
 ˇHML                           -0.10       -0.02                       -0.09                 0.00
                               [-3.44]     [-0.80]                     [-2.51]               [0.04]
```

### Excerpt 88

```
[-3.94]     [-5.21]                     [-0.80]               [-5.10]
 ˇHML                           -0.10       -0.02                       -0.09                 0.00
                               [-3.44]     [-0.80]                     [-2.51]               [0.04]
 ˇUMD                                        0.18                       0.16                  0.18
```

### Excerpt 89

```
ˇHML                           -0.10       -0.02                       -0.09                 0.00
                               [-3.44]     [-0.80]                     [-2.51]               [0.04]
 ˇUMD                                        0.18                       0.16                  0.18
                                           [10.9]                      [6.17]                [8.59]
```

### Excerpt 90

```
[-3.44]     [-0.80]                     [-2.51]               [0.04]
 ˇUMD                                        0.18                       0.16                  0.18
                                           [10.9]                      [6.17]                [8.59]
 ˇCAR3                                       0.30                       0.39                  0.22
```

### Excerpt 91

```
ˇUMD                                        0.18                       0.16                  0.18
                                           [10.9]                      [6.17]                [8.59]
 ˇCAR3                                       0.30                       0.39                  0.22
                                           [5.52]                      [5.03]                [2.91]
```

### Excerpt 92

```
ˇCAR3                                       0.30                       0.39                  0.22
                                           [5.52]                      [5.03]                [2.91]
 adj.-R2 (%)                     8.3         41.4                       31.3                  49.3
```

### Excerpt 93

```
Table 2 continued
                          Full sample                    1/75–12/93           1/94–12/12
                    (1)        (2)       (3)            (4)      (5)         (6)      (7)
```

### Excerpt 94

```
(1)        (2)       (3)            (4)      (5)         (6)      (7)
 Panel C: y D CAR3
 ˛                0.53       0.59         0.37          0.63     0.39       0.43       0.34
                 [8.42]     [9.35]      [6.18]         [8.43]   [4.81]     [4.26]     [3.96]
```

### Excerpt 95

```
Panel C: y D CAR3
 ˛                0.53       0.59         0.37          0.63     0.39       0.43       0.34
                 [8.42]     [9.35]      [6.18]         [8.43]   [4.81]     [4.26]     [3.96]
 ˇMKT                        -0.06       -0.02                   0.02                  -0.05
```

### Excerpt 96

```
˛                0.53       0.59         0.37          0.63     0.39       0.43       0.34
                 [8.42]     [9.35]      [6.18]         [8.43]   [4.81]     [4.26]     [3.96]
 ˇMKT                        -0.06       -0.02                   0.02                  -0.05
                            [-3.87]     [-1.77]                 [1.22]                [-2.62]
```

### Excerpt 97

```
[8.42]     [9.35]      [6.18]         [8.43]   [4.81]     [4.26]     [3.96]
 ˇMKT                        -0.06       -0.02                   0.02                  -0.05
                            [-3.87]     [-1.77]                 [1.22]                [-2.62]
 ˇSMB                        -0.02       -0.01                   -0.04                 -0.01
```

### Excerpt 98

```
ˇMKT                        -0.06       -0.02                   0.02                  -0.05
                            [-3.87]     [-1.77]                 [1.22]                [-2.62]
 ˇSMB                        -0.02       -0.01                   -0.04                 -0.01
                            [-1.08]     [-0.36]                 [-1.43]               [-0.26]
```

### Excerpt 99

```
[-3.87]     [-1.77]                 [1.22]                [-2.62]
 ˇSMB                        -0.02       -0.01                   -0.04                 -0.01
                            [-1.08]     [-0.36]                 [-1.43]               [-0.26]
 ˇHML                        -0.06       -0.01                   0.03                  -0.03
```

### Excerpt 100

```
ˇSMB                        -0.02       -0.01                   -0.04                 -0.01
                            [-1.08]     [-0.36]                 [-1.43]               [-0.26]
 ˇHML                        -0.06       -0.01                   0.03                  -0.03
                            [-2.78]     [-0.50]                 [1.19]                [-1.23]
```
