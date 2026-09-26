# Momentum Strategies
**Authors:** Louis K. C. Chan, Narasimhan Jegadeesh, Josef Lakonishok
**Year:** 1996
**Journal/Venue:** Journal of Finance

## Problem statement

Chan, Jegadeesh, and Lakonishok ask whether price momentum is really just earnings momentum in disguise. By the mid-1990s two empirical facts were already clear:

- stocks with strong past returns continue to outperform,
- and stocks with favorable earnings news also continue to outperform.

The unresolved question is whether these are the same phenomenon. If delayed response to earnings news is the true mechanism, then conditioning on earnings information should largely eliminate price momentum. If not, price momentum must contain information beyond the standard earnings-news variables.

## Approach (short)

The paper compares a canonical six-month **price momentum** strategy to several **earnings momentum** strategies built from:

- standardized unexpected earnings (`SUE`),
- abnormal announcement-window returns around the most recent earnings release (`ABR`),
- and a six-month moving average of analyst forecast revisions (`REV6`).

The authors:

1. rank stocks into deciles each month from January 1977 to January 1993,
2. form equally weighted portfolios using NYSE breakpoints,
3. compare future buy-and-hold returns over six- and twelve-month horizons,
4. analyze returns around the first several earnings announcements after formation,
5. and run two-way sorts and cross-sectional regressions to see whether price and earnings momentum subsume one another.

The main result is that the two are related but not identical. Earnings news explains an important component of price momentum, especially around subsequent earnings announcements, but prior returns still contain independent predictive content.

## Approach (detailed)

### 1. Sample construction and monthly ranking procedure

The sample includes domestic primary stocks listed on the NYSE, AMEX, and Nasdaq with CRSP and COMPUSTAT coverage, supplemented with I/B/E/S analyst forecast data when available. At the beginning of each month from January 1977 to January 1993, stocks are ranked on either:

- past price performance,
- or a measure of earnings news.

The ranking breakpoints are based on NYSE firms only, but eligible stocks from all three exchanges are assigned to the resulting deciles. All portfolios are equally weighted.

This NYSE-breakpoint design is methodologically important because it prevents tiny Nasdaq names from mechanically dominating the tails of the sort.

### 2. Price momentum variable

The price-momentum ranking variable is the stock's compounded return over the prior six months. This is the direct precursor to the now-standard intermediate-horizon momentum sort.

After portfolio formation, the authors skip the first five trading days before measuring holding-period returns. That skip is meant to reduce contamination from bid-ask bounce and short-horizon microstructure effects. The same skip is used for the earnings momentum strategies for comparability.

### 3. Three distinct earnings-news variables

The paper is careful not to treat "earnings momentum" as a single object. It uses three measures.

#### 3.1 Standardized unexpected earnings

The first is the familiar `SUE`, defined as the change in quarterly earnings per share relative to the same quarter a year earlier, scaled by the standard deviation of that unexpected-earnings series over the previous eight quarters:

$$
SUE_{it}
=
\frac{e_{iq} - e_{iq-4}}{\sigma_{it}},
$$

where `e_{iq}` is the most recently announced quarterly EPS and `sigma_{it}` is the historical volatility of the seasonal earnings change.

This is a long-horizon earnings-news measure because it summarizes information through the latest quarter.

#### 3.2 Announcement-window abnormal return

The second measure is the cumulative abnormal stock return around the most recent earnings announcement:

$$
ABR_{it}
=
\sum_{j=-2}^{+1} (r_{ij} - r_{mj}),
$$

where `r_{ij}` is the stock return on event day `j` and `r_{mj}` is the equally weighted market return.

This is a cleaner measure of the market's immediate reaction to earnings news because it does not require a model of expected earnings. But it only captures the information released in a narrow event window.

#### 3.3 Analyst forecast revisions

The third measure is a six-month moving average of changes in analysts' current-fiscal-year earnings forecasts:

$$
REV6_{it}
=
\sum_{j=0}^{5}
\frac{f_{it-j} - f_{it-j-1}}{P_{it-j-1}},
$$

where `f` is the consensus I/B/E/S forecast and the revision is scaled by the prior stock price.

This variable tries to capture more gradually diffused earnings information than the announcement-window return.

### 4. First layer of evidence: univariate decile sorts

For each ranking variable, the authors form deciles and then compute buy-and-hold returns over:

- the first six months after formation,
- the first year,
- and in some tables longer intervals.

The initial result is that all three earnings measures predict returns, but past six-month returns generally generate the larger spreads. So price momentum is empirically stronger than announcement-window earnings momentum when each is used alone.

### 5. Track what happens at subsequent earnings announcements

This is one of the paper's best design choices. It does not stop at post-formation average returns. It also measures cumulative abnormal returns around the first four earnings announcements after portfolio formation.

Why is this so informative? Because if momentum is partly delayed response to earnings information, a substantial share of post-formation abnormal performance should occur precisely when subsequent earnings are announced.

That is what the paper finds:

- winner-minus-loser portfolios and positive-earnings-news portfolios continue to show abnormal performance around future announcement dates,
- and a meaningful fraction of the total return spread is concentrated in those windows.

This supports an underreaction-to-fundamentals interpretation.

### 6. Two-way sorts: does one signal survive conditioning on the other?

The central empirical design is the independent two-way sort. The authors first sort on prior return into three groups, then independently sort on one of the earnings-news measures into three groups, producing nine cells.

This allows them to ask both:

- among stocks with similar past returns, do those with better earnings news outperform?
- among stocks with similar earnings news, do those with better past returns outperform?

The answer in both directions is yes.

For example:

- conditional on prior return, sorts on `SUE`, `ABR`, or `REV6` still generate meaningful future return spreads;
- conditional on the earnings variable, sorts on prior return still generate meaningful future return spreads, often larger and more persistent.

This is the key result of the paper. Neither signal fully subsumes the other.

### 7. Earnings momentum is shorter-lived than price momentum

The authors then compare six-month and twelve-month horizons. A recurring pattern is that the component associated with earnings news is more short-lived than the component associated with prior returns.

In the two-way sorts:

- conditioning on prior return, announcement-return and SUE spreads are strong at six months but weaken more by twelve months;
- conditioning on earnings measures, prior-return spreads remain strong and often grow larger by twelve months.

This suggests that price momentum is not just a stale earnings-announcement effect. Earnings news is one source of continuation, but past returns also reflect other slowly diffusing information.

### 8. Cross-sectional regressions confirm the sort evidence

The paper also runs monthly cross-sectional regressions using prior return and the earnings variables jointly. This matters because the sort results could in principle be sensitive to discretization or interaction patterns at the breakpoints.

The regression evidence broadly confirms the same conclusion:

- prior return remains significant when the earnings variables are included,
- and earnings variables remain significant when prior return is included,
- though the price signal is generally stronger.

### 9. What the results mean economically

The paper's interpretation is disciplined. It does **not** say that price momentum is unrelated to fundamentals. In fact, the concentration of some return continuation around later earnings announcements strongly suggests that part of the momentum effect comes from delayed incorporation of earnings-related information.

But it also does **not** say that momentum is fully explained by earnings drift. The return history still predicts future returns even after conditioning on:

- standardized unexpected earnings,
- recent announcement-window abnormal returns,
- and analyst revisions.

So the correct conclusion is intermediate:

- earnings news and price momentum overlap substantially,
- but each captures information the other misses.

### 10. Why the paper matters methodologically

The paper matters because it does not argue by slogan. It uses three distinct earnings proxies, tracks announcement-window returns after formation, and performs conditioning tests in both directions. That is exactly the right empirical design for the question "does X subsume Y?"

Its methodological lesson is still relevant: when two anomalies appear related, one should not compare their average spreads casually. One should:

1. define each signal precisely,
2. put them in the same ranking and holding framework,
3. condition one on the other,
4. and examine where in calendar time the profits actually occur.

## Domain of applicability

- **Where it works well:** Equity momentum research that needs to separate price continuation from delayed reaction to earnings-related information.
- **What is implementable:** Monthly NYSE-breakpoint decile strategies based on six-month prior returns, `SUE`, announcement-window abnormal returns, and analyst-revision signals, plus two-way sorts and joint regressions.
- **Main limitation:** Portfolios are equally weighted and the sample ends before later momentum crashes and implementation-cost debates, so the paper is strongest as a mechanism study rather than a final investability statement.
- **Why the paper matters:** It established that earnings momentum explains an important part of price momentum without eliminating it, making momentum harder to dismiss as either pure overreaction or pure earnings drift.
