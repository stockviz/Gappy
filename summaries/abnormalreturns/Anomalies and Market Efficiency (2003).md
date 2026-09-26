# Anomalies and Market Efficiency
**Authors:** G. William Schwert
**Year:** 2003
**Journal/Venue:** Handbook of the Economics of Finance

## Problem statement

Schwert asks a disciplined version of the anomaly question. A pattern in realized returns is not yet an economically meaningful violation of market efficiency. To count as an anomaly, it must survive a sensible asset-pricing benchmark, remain visible out of sample, and be strong enough to matter after trading frictions and institutional constraints. The chapter therefore studies the anomaly literature through three filters at once:

- whether the original return spread is statistically reliable,
- whether it survives after the anomaly becomes public knowledge,
- and whether it can plausibly represent abnormal profits rather than compensation for omitted risk or a by-product of data mining.

The chapter is methodologically important because it does not simply list famous anomalies. It imposes a common evaluative standard on them, with particular emphasis on post-publication decay, the joint-hypothesis problem, and the distinction between predictable returns and exploitable alpha.

## Approach (short)

Schwert combines survey and replication. He organizes the literature into:

- cross-sectional return regularities,
- time-series return predictability,
- return differences across investor classes,
- long-run event returns,
- and the implications for asset pricing and corporate finance.

Within that structure he repeatedly re-expresses anomaly claims in terms of benchmark-adjusted returns or predictive regressions, then compares pre-publication and post-publication performance. The recurring object is abnormal return, typically a Jensen-style intercept

$$
\alpha_i = E[R_i - R_f] - \beta_i E[R_m - R_f],
$$

or a related intercept from a richer factor model or forecasting regression. The central empirical test is not just "did the anomaly exist in the original sample?" but "what happened after researchers and traders knew about it?"

## Approach (detailed)

### 1. A common efficiency standard: predictable returns are not enough

Schwert begins from the classic point that tests of market efficiency are joint tests. One never tests efficiency in isolation; one tests efficiency together with a maintained model of expected returns. This is why the chapter repeatedly translates anomaly claims into abnormal returns relative to a benchmark model.

His standard is close to Jensen's: if a trading rule based on public information yields a reliably positive risk-adjusted intercept net of realistic frictions, then the evidence is more troubling for efficiency than a bare forecasting regression with unstable coefficients. This distinction matters throughout the chapter:

- a statistically predictable variable may not generate implementable profits,
- a raw return spread may disappear once risk adjustment is applied,
- and even a large in-sample alpha may say more about data snooping than about a persistent inefficiency.

### 2. Cross-sectional anomalies are evaluated one by one, but all through the same lens

The first major block of the chapter covers predictable differences in returns across assets.

#### 2.1 Data snooping as a first-order issue

Schwert does not treat data snooping as an afterthought. The chapter argues that when researchers search over many variables, cutoff rules, sample periods, and portfolio constructions, some apparently strong anomalies will emerge mechanically. The cleanest informal test for this problem is what happens after publication:

- if the anomaly survives, it becomes harder to dismiss as a sampling accident;
- if it weakens sharply, the evidence becomes more consistent with either data mining or arbitrage removing the opportunity.

That post-publication comparison is the chapter's recurring diagnostic.

#### 2.2 The size effect

The size effect is the claim that small-cap stocks earn higher average returns than CAPM would predict. Schwert reviews the original Banz evidence and then recomputes size-sorted abnormal returns over long samples. The operational object is a size-sorted portfolio spread, evaluated through benchmark-adjusted returns rather than raw means.

Methodologically, the size effect is tested by:

1. sorting firms by market equity,
2. forming portfolio returns for small and large firms,
3. estimating risk-adjusted abnormal returns for those portfolios,
4. and comparing early and later subsamples.

The chapter's conclusion is not that the size effect never existed. It is that the effect is much weaker after it became widely known, and in later data often looks economically unimportant or statistically fragile. This is one of Schwert's strongest examples of an anomaly that loses force once publication and implementability are taken seriously.

#### 2.3 Turn-of-the-year seasonality

Schwert next reviews the January or turn-of-the-year effect. Here the methodological point is that the annual size premium is not spread evenly across the calendar. A large share historically appeared in a narrow calendar window. The chapter interprets this not as a self-standing model of expected returns, but as evidence that the size effect itself may be partly seasonal, tax-driven, or institutionally induced.

The operational test is again straightforward:

1. compute returns for size-sorted portfolios,
2. isolate January or turn-of-year observations,
3. compare seasonal and nonseasonal means,
4. and examine whether the seasonal spike survives in later periods.

Schwert concludes that the turn-of-the-year pattern weakened materially after publication and is not robust enough to sustain the older strong-form anomaly interpretation.

#### 2.4 Weekend effect

The weekend effect is treated much more explicitly as a regression problem. Let `Weekend_t` equal one for a return spanning the weekend and zero otherwise. The chapter considers regressions of the form

$$
R_t = a_0 + a_W \, Weekend_t + \varepsilon_t,
$$

where `a_W` measures the difference between weekend and non-weekend mean returns.

Schwert's historical evidence shows:

- strong negative weekend returns in earlier samples,
- weaker estimates in long pre-1928 data,
- and little reliable effect in later decades.

The methodological lesson is important. Calendar anomalies often look strongest in the sample that made them famous. Once the sample is extended, the coefficient shrinks toward zero. For Schwert, this is exactly the pattern one would expect if the original result combined a real but temporary institutional feature with data-snooping amplification.

#### 2.5 Value effect

The value effect is treated as a family of related sorts: high book-to-market, high dividend yield, or otherwise "cheap" stocks earn higher average returns than growth stocks. Schwert reviews both U.S. and international evidence and emphasizes two separate questions:

1. Is the value premium statistically real in long samples?
2. Is it an inefficiency or a compensation for some omitted risk?

Implementation-wise, the literature forms value and growth portfolios and then studies average returns or benchmark-adjusted alphas. Schwert's synthesis is deliberately cautious. The value premium is harder to dismiss than the weekend effect, but it is also the exact kind of pattern that triggered the search for multifactor models such as the Fama-French framework. In other words, value may be a challenge to the CAPM without being a challenge to efficiency in a broader sense.

He also notes that the magnitude of value effects often declines after publication, which weakens any naive reading that the original estimates reflect a stable, free abnormal return.

#### 2.6 Momentum effect

Momentum is the major cross-sectional anomaly that looks harder to dismiss. The basic trading rule is the Jegadeesh-Titman winner-minus-loser portfolio:

1. rank stocks by lagged medium-horizon returns,
2. buy recent winners,
3. short recent losers,
4. and hold the spread portfolio over the prescribed horizon.

Schwert evaluates momentum under both CAPM and Fama-French-style benchmarks. The core empirical point is that the winner-minus-loser intercept remains large and statistically reliable in periods where several older anomalies fade. He treats this as evidence that momentum cannot be explained away by the same simple "it disappeared after publication" story that works for size or the weekend effect.

This is one of the chapter's sharpest comparative judgments:

- size, weekend, and some predictability variables often attenuate sharply;
- momentum remains much more stubborn.

That asymmetry is central to Schwert's broader message. Not all anomalies are equally fragile.

### 3. Time-series predictability is handled through forecasting regressions, then stress-tested historically

The second main block concerns predictable differences in aggregate stock returns through time. Here the object is no longer a cross-sectional spread but a forecasting regression.

#### 3.1 Short-term rates, inflation, and expected returns

Schwert reviews evidence that high short rates or high expected inflation predict lower subsequent stock returns. The empirical design is a predictive regression of future stock returns on macro-financial state variables such as the short rate or inflation proxies. The chapter's emphasis is not on inventing a new predictor but on re-estimating old claims over very long samples.

The key finding is instability. Coefficients that looked strong in the original sample become much weaker in later data. Again, the chapter's methodology is conservative: it is not enough that a coefficient once had a large t-statistic. It should continue to matter after the variable becomes famous.

#### 3.2 Dividend yields

The same logic is applied to dividend-yield predictability. The canonical regression is of the form

$$
R_{t+h} = a + b \, \frac{D_t}{P_{t-1}} + u_{t+h},
$$

with `h` often taken to be a long horizon such as one year. Schwert reviews the long-horizon predictability literature and then stresses the fragility of the evidence in real time and post-publication data. Dividend yield forecasting works much less cleanly than the most cited early papers suggest.

Methodologically, this matters because long-horizon predictive regressions are exactly where small-sample bias, overlapping observations, and specification search can create misleading confidence. Schwert's treatment is therefore deliberately skeptical.

### 4. The chapter broadens from anomalies to who earns unusual returns and why mispricing may persist

The next sections study return differences across investor types and long-run event returns. These are not presented as isolated curiosities. They are part of the causal story about why anomalies, if real, may not be arbitraged away immediately.

#### 4.1 Investor categories

Schwert reviews evidence on:

- individual investors,
- closed-end funds,
- mutual funds,
- hedge funds,
- and IPO-related returns.

The organizing question is whether some investor classes systematically buy overpriced securities or fail to exploit mispricing. This naturally connects anomaly evidence to limits to arbitrage.

#### 4.2 Limits to arbitrage

This is one of the chapter's most important conceptual sections. Even if a return pattern reflects mispricing, arbitrage may be risky, capital-constrained, horizon-dependent, or institutionally infeasible. That means the mere persistence of an anomaly does not automatically refute efficiency in a practical sense. Conversely, the disappearance of an anomaly after publication may reflect learning and arbitrage rather than the original result having been false.

### 5. Long-run event studies are treated as especially fragile

Schwert reviews long-run returns after equity issuance and returns to bidder firms. This literature typically computes abnormal returns over long windows after corporate events. He is skeptical because long-horizon abnormal-return measurement is technically difficult:

- benchmark choice matters a lot,
- cross-correlation across event firms can distort inference,
- and compounding small mis-specifications over long horizons can manufacture abnormal performance.

This part of the chapter is an important warning against taking long-run event-study alphas at face value.

### 6. The anomaly literature feeds directly into asset pricing and corporate finance

Schwert closes by explaining what anomaly evidence forced the profession to confront.

For asset pricing:

- if CAPM leaves large residual structure, researchers search for new risk factors;
- if factor additions merely relabel anomalies, the interpretation remains open;
- conditional models may rescue some evidence, but not all;
- and behavioral finance gains traction where neither static risk models nor post-publication decay fully resolves the facts.

For corporate finance:

- size and liquidity matter for financing costs,
- book-to-market effects interact with capital structure and issuance decisions,
- and slow stock-price responses to corporate policies raise the possibility that financing choices exploit misvaluation.

### 7. The chapter's real contribution

Schwert's contribution is not one new estimator. It is a methodology for reading anomaly evidence:

1. convert raw patterns into benchmark-adjusted abnormal returns or forecasting coefficients;
2. ask whether the effect survives publication;
3. ask whether it survives implementation frictions and reasonable risk adjustment;
4. and only then decide whether the pattern is a serious challenge to efficiency.

That methodological discipline is why the chapter remains important. It shows that "anomaly" is not a label earned by statistical surprise alone.

## Domain of applicability

- **Where it works well:** Evaluating broad classes of anomalies under a common efficiency standard rather than taking each published result at face value.
- **What is implementable:** A replication protocol built around benchmark-adjusted returns, post-publication subsamples, and explicit separation of predictability from tradable abnormal profits.
- **Main limitation:** The chapter is synthetic; it does not estimate one unified structural model of all anomalies.
- **Why the paper matters:** It is one of the clearest statements that anomaly research should be judged by persistence, benchmark robustness, and implementability, not by in-sample surprise alone.
