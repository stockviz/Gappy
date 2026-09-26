# Quality Investing
**Authors:** Robert Novy-Marx
**Year:** 2014
**Journal/Venue:** Working paper / practitioner note

## Problem statement

Novy-Marx asks how "quality" should actually be measured in equity investing and whether quality is best thought of as a separate style or as an additional dimension of value investing. The paper is motivated by the rapid spread of quality investing in practice, but it points out that the label "quality" had come to cover many very different ideas:

- profitability,
- low leverage,
- earnings quality,
- financial strength,
- return on capital,
- defensive or low-risk characteristics.

The paper's goal is therefore comparative and implementational: define several leading quality concepts, run a performance horse race, and determine which measures are most useful stand-alone and which most improve value strategies.

## Approach (short)

The paper compares seven leading quality concepts, including:

- Graham-style quality screens,
- Grantham/GMO-style quality,
- return on invested capital,
- earnings-quality and accrual-based measures,
- Piotroski's `F-score`,
- and gross profitability.

It evaluates them as:

1. stand-alone quality strategies,
2. quality overlays combined side-by-side with value,
3. and integrated value-plus-quality stock-selection rules.

The main result is that all quality measures have some predictive power, especially in small caps and especially when combined with value. But **gross profitability** is the standout measure:

- it works best as a stand-alone strategy,
- has the strongest alpha among large caps,
- and most effectively improves value investing.

## Approach (detailed)

### 1. Reframe value investing as price plus quality

The paper's conceptual claim is that buying cheap assets is only half of value investing. The other half is buying productive, financially sound, high-quality assets without overpaying for them. In that sense:

- value = low price relative to fundamentals,
- quality = strength of the underlying business.

The paper therefore argues that quality is not merely a competing style bucket. It is often the missing second dimension of value.

### 2. Define and compare multiple notions of quality

Rather than privileging one measure at the start, Novy-Marx constructs several quality strategies from the literature and practice.

These include:

- **Graham quality:** built from Benjamin Graham's screening criteria for financial soundness and business quality, converted into a composite score.
- **Grantham quality:** emphasizing high return, stable return, and low debt.
- **ROIC-based quality:** using return on invested capital.
- **Earnings quality:** including accrual-based measures in the Sloan tradition.
- **Piotroski-style financial strength:** composite accounting-health signals.
- **Gross profitability:** revenues minus cost of goods sold, scaled by assets.
- and a few additional strategies marketed as quality but closer to defensive equity.

This horse-race structure is the main method of the paper.

### 3. Stand-alone quality strategies

Each quality strategy is first implemented on its own. The paper studies its:

- average return,
- CAPM alpha,
- Fama-French three-factor alpha,
- size behavior,
- and stand-alone Sharpe ratio.

The key result is not that all measures are useless except one. Several quality signals work to some extent. But only gross profitability generates robust and statistically significant stand-alone excess returns across a wide enough universe to look like a genuinely strong independent style.

### 4. Gross profitability as the dominant quality measure

The paper's winning quality metric is:

$$
GP/A = \frac{\text{Revenue} - \text{COGS}}{\text{Assets}}.
$$

This is the same basic idea from Novy-Marx's earlier work, but here it is evaluated against the full menu of popular quality concepts. The paper finds that gross profitability:

- has as much return-predictive power as traditional value,
- is especially powerful among large caps,
- produces the strongest Fama-French three-factor alpha,
- and often subsumes the explanatory power of the other quality strategies.

This is important because quality investing is often sold in practice through complex composite scores. Novy-Marx argues that a much simpler profitability measure often does better.

### 5. Size-split evidence

The paper then splits the universe by size. This is a useful robustness check because many accounting-based strategies are strongest in small stocks.

The results are:

- many quality measures look stronger in small caps,
- but **gross profitability** remains the most reliable strategy among large caps,
- and among large caps it is often the only quality measure with consistently strong abnormal returns relative to standard factors and to the other quality strategies.

This greatly strengthens the practical relevance of the gross-profitability result.

### 6. Side-by-side combination of value and quality

The next exercise asks what happens if an investor simply runs value and quality strategies alongside each other. For long-only investors, this means holding a value sleeve and a quality sleeve simultaneously.

The paper shows that this can improve information ratios, but it also points out a practical limitation: many quality portfolios load negatively on the traditional value factor. So a side-by-side combination can partly neutralize the very value exposure the investor wanted.

This is an important methodological distinction. Combining two good strategies naively is not equivalent to selecting stocks that are jointly attractive on both dimensions.

### 7. Integrated value-plus-quality selection

The paper therefore studies the integrated alternative:

1. rank stocks jointly on value and a quality measure,
2. buy firms that are both attractively priced and high quality,
3. avoid firms that are cheap but low quality or high quality but expensively priced.

This integrated method yields larger effective value and quality tilts than simply running separate sleeves. The improvement is especially strong when quality is measured by gross profitability.

This is the paper's most practical portfolio-construction lesson. If the objective is to avoid junk value and buy productive assets cheaply, joint sorting or composite ranking is superior to a simple overlay.

### 8. Gross profitability helps value investors avoid value traps

The paper repeatedly returns to this point. Traditional value portfolios buy cheap firms indiscriminately. Many of those firms are cheap for good reasons: poor profitability, deteriorating operations, weak capital allocation, or fragile balance sheets.

Quality, especially gross profitability, helps identify:

- **bargains**: cheap firms with real productive strength,
- **value traps**: cheap firms with poor quality.

So the economic role of quality is not merely to add another return premium. It is to improve the mapping from cheapness to true mispricing.

### 9. Long-only versus long-short interpretation

The paper is careful to discuss long-only investors. In long-short academic factor tests, a quality premium can be harvested more directly. Long-only investors face an additional challenge: quality strategies often achieve apparent alpha partly through negative factor exposures and tracking-error effects rather than through large improvements in portfolio volatility. This makes integrated stock selection more attractive than separate long-only sleeves.

That practical discussion is one reason the paper matters. It is not just a factor-paper argument; it is explicitly a portfolio-implementation argument.

### 10. What the horse race actually concludes

The conclusion is nuanced:

- many quality notions have some forecasting power,
- most work better when combined with value than when used alone,
- only gross profitability is truly strong as a stand-alone strategy,
- and gross profitability is also the best quality complement to value.

That is a much sharper conclusion than the generic practitioner slogan "quality works."

## Domain of applicability

- **Where it works well:** Equity strategies that want to incorporate quality in a way that is disciplined, comparable across candidate measures, and directly linked to value investing.
- **What is implementable:** Construction of multiple quality scores, stand-alone quality sorts, side-by-side value and quality sleeves, and most importantly integrated joint value-plus-quality ranking systems, especially those using gross profitability.
- **Main limitation:** Quality is inherently multidimensional, so no single metric captures all economically relevant dimensions; the paper's strength is comparative, not that it claims a complete definition of quality.
- **Why the paper matters:** It showed that the broad "quality investing" idea can be made precise, and that among the many competing notions of quality, gross profitability is the most useful both on its own and as a way to improve value investing.
