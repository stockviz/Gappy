# The Supraview of Return Predictive Signals
**Authors:** Jeremiah Green, John R. M. Hand, X. Frank Zhang
**Year:** 2013
**Journal/Venue:** Review of Accounting Studies

## Problem statement

Green, Hand, and Zhang argue that the anomaly literature had become too fragmented. Researchers kept introducing individual return predictive signals (RPS), but almost nobody asked what the **population** of signals looked like as a whole. Their goal is therefore meta-empirical: build a database of published signals, describe their aggregate properties, and extract implications for:

- how much discovery is still happening,
- how strong these signals are on average,
- how correlated they are,
- how a new signal should be judged against old ones,
- and what a practitioner could gain from combining many signals.

The paper does not propose one new anomaly. It proposes that the anomaly literature itself should be treated as an object of study.

## Approach (short)

The authors compile a database of more than 330 published or publicly disclosed return predictive signals from 1970 to 2010. They then study:

- the rate of signal discovery over time,
- the average returns and Sharpe ratios reported for these signals,
- their cross-signal correlation structure,
- and the probability that a signal retains positive alpha after orthogonalization against other signals.

For implementation questions they take a subset of 39 signals that can be programmed directly from CRSP, Compustat, and I/B/E/S data and use that subset to estimate correlation structures and portfolio Sharpe ratios. A central formula comes from Bailey and Lopez de Prado for the Sharpe ratio of an equal-volatility-weighted portfolio of signals.

## Approach (detailed)

### 1. Build the RPS database as a population approximation

The first contribution is data construction. The paper compiles 333 return predictive signals from academic journal articles and working papers spanning 1970-2010. It records not just the signal names, but features such as:

- publication timing,
- discipline or thematic source,
- databases used,
- portfolio-construction details,
- whether the original paper orthogonalized the signal to existing factors,
- and reported or inferable return statistics.

This is the move from "study an anomaly" to "study the anomaly-production process."

### 2. Discovery has not slowed down

One of the paper's most striking descriptive findings is that the pace of signal discovery does not appear to taper off. Even late in the sample, new RPS continue to be found at a high rate, and the newly discovered signals do not look obviously weaker than older ones.

This matters because two very different interpretations become possible:

- markets are pervasively inefficient, leaving many distinct opportunities,
- or standard factor models are missing a very large amount of priced structure.

The paper does not resolve that theoretical debate, but it shows that the usual "all the low-hanging fruit must already be gone" intuition is not obviously borne out by the historical record.

### 3. Average signal performance is surprisingly strong

For the subset of signals with reported or reconstructable statistics, the paper documents roughly:

- mean annualized equally weighted return around `12.1%`,
- annualized standard deviation around `12.1%`,
- annualized Sharpe ratio around `1.04`,

and for value-weighted signals:

- mean annualized return around `8.1%`,
- standard deviation around `12.2%`,
- annualized Sharpe ratio around `0.70`.

Those numbers compare favorably with broad equity-market benchmarks. This is one reason the paper was so provocative: taken at face value, the published signal population looks much better than the market on both mean return and Sharpe ratio.

### 4. Famous signals are not necessarily representative

Green-Hand-Zhang show that heavily cited signals such as momentum or accruals are not necessarily better than the median published signal. That is an important corrective. The best-known anomalies are often the ones that shaped the theory debate, but they are not obviously representative of the overall return-predictive-signal population.

This also means a literature review built only around famous signals is missing the broader empirical ecology.

### 5. Signal quality has not obviously decayed over time

The paper reports that the returns, standard deviations, and Sharpe ratios of newly discovered signals remain broadly stable through time. That is methodologically interesting because it cuts against a simple exhaustion story. If discovery is still happening and average quality is not collapsing, then either:

- research technology is improving enough to offset depletion,
- or the underlying opportunity set is much larger than previously thought.

### 6. Most papers orthogonalize against only a tiny standard factor set

One practical and methodological finding is that about 88% of the papers in the database orthogonalize or benchmark the new signal only against a very small familiar set, typically combinations of:

- size / SMB,
- value / HML,
- momentum / MOM.

That fact motivates one of the paper's main questions: if hundreds of signals already exist, what should count as a convincing test that a new one is truly incremental?

### 7. Portfolio combination logic: the Bailey-Lopez de Prado formula

To move from signal discovery to investment implications, the paper studies portfolios of signals. Suppose signal `s` has mean `mu_s`, volatility `sigma_s`, and Sharpe ratio `SR`. If one constructs an equal-volatility-weighted portfolio of `S` signals and the mean signed pairwise correlation is `q`, then the portfolio Sharpe ratio is

$$
SR_P = SR \sqrt{\frac{S}{1 + (S-1)q}}.
$$

This formula is operationally central. It says the portfolio Sharpe ratio is increasing in:

- the average signal Sharpe ratio,
- the number of signals,

and decreasing in:

- the average correlation among them.

So the empirical question becomes not just "how good is the average signal?" but "how correlated are the signals?"

### 8. Sample of 39 readily programmable signals

The full database is too heterogeneous for exhaustive return-correlation analysis, so the authors take a subset of 39 signals that can be programmed directly from standard databases over a common period. This subset is then used to estimate:

- signed pairwise correlations,
- absolute pairwise correlations,
- and the empirical performance of multi-signal portfolios.

The key findings are:

- mean signed correlation is near zero,
- but mean absolute correlation is materially positive, around `0.29` for equally weighted returns and `0.22` for value-weighted returns.

This is an important nuance. Signals are not independent, but they are also not so positively correlated that diversification benefits disappear.

### 9. How large can the portfolio Sharpe ratio get?

Using the formula above and the empirical correlation estimates, the paper shows that portfolios of many weakly correlated signals can have extremely high theoretical Sharpe ratios. The result is driven more by low correlation than by simply adding more signals.

That is a subtle but important point:

- increasing the number of signals helps,
- but reducing average correlation helps even more.

This explains why the paper focuses so much on correlation structure and not only on the mean return of individual signals.

### 10. Orthogonalization as a test of novelty

The paper next asks how likely it is that a randomly chosen signal remains significant after being orthogonalized against other signals. The experiment is simple:

1. choose one signal,
2. regress its returns on the returns of `N` other signals,
3. test whether the intercept remains significantly positive,
4. repeat this many times for different random signal combinations.

The results are striking. The probability that a randomly chosen signal remains significant is roughly:

- `74%` after controlling for 1 other signal,
- `62%` after controlling for 5,
- `50%` after controlling for 10,
- `40%` after controlling for 15,
- `32%` after controlling for 25.

So even after fairly aggressive orthogonalization, many signals still retain positive alpha.

This is the paper's practical answer to the "what counts as new?" question: it may not be necessary to orthogonalize against every historically published signal, but orthogonalization against a relevant subset is essential.

### 11. Best-control orthogonalization

The authors also go beyond purely random controls. For each signal, they choose up to 10 other signals that maximize explanatory power in the orthogonalizing regression. Even under this more aggressive procedure, a large share of signals retain significantly positive intercepts:

- about `46%` using equally weighted returns,
- about `69%` using value-weighted returns.

That is an even stronger statement about incremental structure in the signal population.

### 12. Practitioner implications

The paper is not purely academic. It explicitly asks what a sophisticated investor could do with the signal population. The answer is:

- combine many signals,
- scale them sensibly,
- exploit the low average signed correlation,
- and judge new signals by whether they add incremental alpha after orthogonalization.

The authors also compare the academic signal population with the limited set of factors disclosed by practitioners such as J.P. Morgan. The practitioner-disclosed sets appear much more conservative, with lower maximal Sharpe ratios than the academic record.

### 13. The main contribution

The paper contributes a new level of analysis. Instead of asking whether one anomaly is right, it asks:

1. How many signals are there?
2. How quickly are they still being discovered?
3. How strong are they on average?
4. How correlated are they?
5. What is the right novelty standard for future signal discovery?

That is why the paper matters. It does not solve the anomaly debate, but it reframes it from the level of isolated signals to the level of the signal ecosystem.

## Domain of applicability

- **Where it works well:** Meta-research on the anomaly literature and practical research design for evaluating whether a proposed signal is truly incremental.
- **What is implementable:** A database approach to signals, equal-volatility signal-combination analysis, the portfolio-Sharpe formula `SR_P = SR sqrt(S / (1 + (S-1)q))`, and orthogonalization tests against relevant existing signals.
- **Main limitation:** The object being studied is the published signal population, so publication bias remains embedded in the data.
- **Why the paper matters:** It is the clearest attempt to treat return predictive signals as a population with measurable ecology rather than as a disconnected list of anomaly papers.
