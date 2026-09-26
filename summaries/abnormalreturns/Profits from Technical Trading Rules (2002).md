# Profits from Technical Trading Rules
**Authors:** Mark J. Ready
**Year:** 2002
**Journal/Venue:** Financial Management

## Problem statement

Ready revisits one of the classic technical-analysis claims in equities: Brock, Lakonishok, and LeBaron's moving-average rules appeared to generate economically meaningful profits on the Dow Jones Industrial Average. Ready's question is more precise than "did those rules work in sample?" He asks whether an investor standing at the end of 1962 could reasonably have identified those rules as the ones that would work from 1963 to 1986.

That framing turns the paper into a test of data snooping. If the profitable rules of 1963-1986 were genuinely discoverable from pre-1963 data, then technical analysis may have exploitable content. If not, then the famous success of the BLL rules is more likely an artifact of searching historical data and then highlighting the lucky winners.

## Approach (short)

Ready compares two rule-generation methods on DJIA data:

- the fixed moving-average rules studied by Brock-Lakonishok-LeBaron (BLL),
- the flexible genetic-algorithm rules of Allen and Karjalainen (AK).

The comparison is clever. The AK procedure is designed to search past data for profitable trading patterns without using future information. If the BLL rules really captured a persistent pre-1963 pattern, then AK should be able to find comparably strong rules from the same pre-1963 information set. If AK cannot, the case that the BLL success was ex ante discoverable becomes much weaker.

Ready then evaluates the rules on DJIA **total returns**, includes dividends, uses explicit transaction costs, and compares both in-sample and later out-of-sample performance.

## Approach (detailed)

### 1. Exact definition of the BLL moving-average rules

The Brock-Lakonishok-LeBaron rules are variable-length moving-average strategies. A buy signal is generated when the short moving average exceeds the long moving average by at least a filter `c`, and a sell signal is generated when it falls below by that filter:

$$
Buy \quad \text{if} \quad MA_{short,t} > (1+c) MA_{long,t},
$$

$$
Sell \quad \text{if} \quad MA_{short,t} < (1-c) MA_{long,t}.
$$

Ready studies the well-known rules such as:

- `(1,150,1%)`,
- `(5,150,1%)`,
- `(1,200,1%)`,

where the tuple means:

1. short moving-average length,
2. long moving-average length,
3. percentage band around the long average.

When the rule is long stocks, the portfolio holds the DJIA; when it receives a sell signal, it moves into T-bills. So the strategy is a market-versus-cash timing rule, not a long-short equity spread.

### 2. Improve the data construction relative to the older literature

Ready makes several important implementation choices that materially affect the results.

#### 2.1 Use total returns, not just price returns

The original BLL analysis worked with index price data excluding dividends. Ready reconstructs DJIA total returns using CRSP stock data and dividend information. This matters because excluding dividends mechanically makes the "move to T-bills" side of the rule look better than it should relative to buy-and-hold equities.

#### 2.2 Simulate explicit transaction costs

Ready assumes a one-way trading cost of `0.13%`, broadly consistent with effective spread estimates for DJIA stocks in institutional-size trades. He also notes that this figure is likely too low for early decades, which means the cost-adjusted profitability results are, if anything, favorable to the technical rules.

#### 2.3 Check implementation timing

The main simulations assume trading at the previous day's close, adjusted for transaction costs, as in AK. Ready also studies a one-day execution lag. Under that lag, both BLL and AK rules fail to generate positive after-cost excess returns in both the 1963-1986 and 1987-2000 periods. This is an important robustness point: modest implementation delay largely kills the profits.

### 3. Define excess return carefully

Ready does not rely on a single benchmark. He uses two excess-return measures.

#### 3.1 Excess return versus always holding stocks

The first benchmark is a fully invested stock position. This is close to AK's original metric. It asks whether moving into T-bills on sell days improves performance enough to offset the fact that the rule is sometimes out of equities entirely.

#### 3.2 Excess return versus a stock-bond weighted benchmark

The second measure compares the strategy to a passive benchmark that holds stocks and bonds with the same average stock/bond exposure as the rule itself. This is important because a random timing rule that spends time in T-bills will mechanically underperform a 100% stock benchmark if stocks have a higher unconditional mean return.

So the second benchmark isolates the value added by **timing**, not just by lowering average stock exposure.

### 4. The central identification idea: use AK as an ex ante rule-search device

This is the paper's key methodological move.

Allen and Karjalainen use genetic algorithms to search over a very large family of nonlinear trading rules built from price-based functions. A candidate rule is represented as a tree of logical and arithmetic operators on lagged or averaged prices. The procedure:

1. generates an initial population of 500 random rules,
2. evaluates their fitness over a training sample,
3. breeds new generations by favoring higher-fitness rules,
4. tests the best candidate of each generation on a separate selection sample,
5. and chooses the rule with the highest excess return in the selection period.

In Ready's implementation, the pre-1963 exercise uses:

- a four-year training period,
- a two-year selection period,
- and then evaluates the selected rules on the 1963-1986 test period.

This matters because the AK rules are immune to the particular look-ahead bias that would arise from choosing a rule after seeing 1963-1986. They search only the information set available before the test period begins.

### 5. Why the AK comparison is so informative

Suppose the BLL rules truly reflected a persistent price pattern already visible before 1963. Then a sufficiently rich ex ante search procedure should find rules at least as good as BLL. AK is allowed to search a much larger class than simple moving averages, and the BLL rules are effectively a tiny subset of that class.

If even this flexible ex ante search cannot identify rules that reliably outperform in 1963-1986, then the ex post success of BLL is hard to interpret as evidence of a discoverable inefficiency.

That is exactly the comparison Ready performs.

### 6. Main findings on the BLL rules

Ready confirms that the BLL rules did look good in the famous 1963-1986 window. Even after transaction costs, several moving-average rules generated positive excess returns over this period.

But two facts weaken the inference:

1. the same rules perform poorly after 1986,
2. and their success is not something a realistic pre-1963 rule-selection process would have identified reliably.

Ready therefore separates two claims that had often been conflated:

- "the rules were profitable in one historical interval,"
- "the rules were discoverable and exploitable in real time."

The first is true. The second is much less convincing.

### 7. Main findings on the AK rules

The AK procedure generates 50 candidate rules for the pre-1963 training/selection problem by varying the random starting point of the genetic search. These rules do not replicate the BLL-level success in the 1963-1986 test period in any robust ex ante sense.

This is the sharpest evidence in the paper. A flexible search procedure, using only the pre-1963 data, fails to identify the supposedly valuable pattern that later made BLL famous.

Ready also notes that the correlation between training/selection performance and later test performance across the 50 AK rules is essentially zero. So even when some rules happen to perform well later, there is no ex ante way to recognize them.

### 8. Interpretation: data snooping versus nonstationarity

Ready is careful not to claim logical proof. There are two possible readings of the evidence.

#### 8.1 Data-snooping interpretation

The most natural interpretation is that the 1963-1986 BLL profits are a statistical accident discovered ex post. The moving-average rule happened to be lucky in that period, and the literature then celebrated it because it was already known to have worked.

#### 8.2 Nonstationarity interpretation

An alternative is that the 1963-1986 period genuinely had a temporary return-generating process favorable to the BLL rules, but that process was not present before or after. Ready acknowledges this possibility. The pre-1963 versus 1963-1986 comparison cannot fully distinguish "pure data snooping" from "real but transient predictability."

What the paper does establish is more limited but still important:

- the famous rule profits were not reliably predictable from prior price data alone,
- so they do not provide a strong basis for implementable trading.

### 9. Broader implication

The paper ends with a distinction that remains useful. It is possible for daily returns to contain some predictability and yet for that predictability to be too weak, unstable, or costly to exploit through trading rules. Technical analysis might therefore teach something about return dynamics without constituting a profitable investment technology.

This is a more nuanced conclusion than either "technical analysis works" or "technical analysis is nonsense." Ready's point is that the classic DJIA moving-average evidence does not survive the stronger ex ante standard that an investor would actually need.

## Domain of applicability

- **Where it works well:** Reassessing historical technical-rule claims when the real issue is ex ante discoverability rather than ex post profitability.
- **What is implementable:** A comparison between predetermined rule families and flexible algorithmic searches using only pre-test data, with total-return data, transaction costs, and alternative excess-return benchmarks.
- **Main limitation:** The focus is the DJIA and the BLL/AK rule families, so the paper is not a universal verdict on all technical trading in all markets.
- **Why the paper matters:** It remains one of the cleanest demonstrations that a rule's historical success is not enough; the rule must also have been identifiable in real time from the information available before the success window began.
