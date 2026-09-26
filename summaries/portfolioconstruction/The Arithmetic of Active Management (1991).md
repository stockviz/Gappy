# The Arithmetic of Active Management

[Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/The Arithmetic of Active Management.pdf>). William F. Sharpe, *Financial Analysts Journal* 47(1), January–February 1991, pp. 7–9. The local four-page PDF is a printout of the author’s web reprint, dated May 8, 2014; that printout date is not the publication year. All four pages were read using local OCR.

## 1. Metadata

- **Title:** The Arithmetic of Active Management
- **Author(s):** William F. Sharpe
- **Year:** 1991
- **Journal/Venue:** *Financial Analysts Journal*

## 2. Problem statement

Sharpe answers a precise aggregation question: if one partitions all invested dollars in a given market into a passive segment that holds the market portfolio and an active segment that deviates from it, what must be true about the **average** active dollar's return relative to the **average** passive dollar's return? The claim is not about whether some managers can outperform; it is about the arithmetic of the aggregate.

## 3. Approach (short)

The paper is an accounting identity, not an econometric or equilibrium model. It decomposes the market into passive and active holdings, writes the market return as the value-weighted average return across those holdings, and then uses the definition of a passive portfolio to show that the average active dollar must earn the market return before costs and must underperform after costs when its average costs exceed passive costs. The method belongs to aggregation/accounting rather than optimization.

## 4. Approach (detailed)

1. **Fix the market and define passive management exactly.**

   Let the relevant market be a fixed universe of securities, with market-cap weights $m_i$, $\sum_i m_i = 1$. A passive manager holds portfolio weights exactly equal to $m$. An active manager holds any different portfolio $w \neq m$.

2. **Partition all invested wealth into passive and active dollars.**

   Let total dollars invested in the market be
   $$
   V = V_P + V_A,
   $$
   where $V_P$ is the total passive capital and $V_A$ is the total active capital. Let $r_M$, $r_P$, and $r_A$ denote the market, average passive, and average active gross returns over the period.

3. **Use market-clearing arithmetic.**

   Because all invested dollars together hold the market portfolio,
   $$
   r_M = \frac{V_P}{V} r_P + \frac{V_A}{V} r_A.
   $$
   By definition of passive management, every passive dollar holds the market portfolio, hence
   $$
   r_P = r_M.
   $$
   Substituting into the aggregation identity gives
   $$
   r_M = \frac{V_P}{V} r_M + \frac{V_A}{V} r_A
   \quad\Longrightarrow\quad
   \frac{V_A}{V}(r_A-r_M)=0.
   $$
   If $V_A>0$, then necessarily
   $$
   r_A = r_M = r_P.
   $$
   This proves the before-cost result.

4. **Introduce costs.**

   Let average costs per dollar for passive and active management be $c_P$ and $c_A$, with typically $c_A>c_P$. Net returns are
   $$
   r_P^{net}=r_P-c_P,\qquad r_A^{net}=r_A-c_A.
   $$
   Since $r_A=r_P$ before costs,
   $$
   r_A^{net}-r_P^{net}=-(c_A-c_P)<0.
   $$
   Therefore
   $$
   r_A^{net}<r_P^{net}.
   $$

5. **Explain apparent empirical counterexamples.**

   Sharpe lists three main measurement failures:

   $$
   \text{(i) the "passive" comparator is not truly passive,}
   $$
   $$
   \text{(ii) the set of observed active managers is not the full active universe,}
   $$
   $$
   \text{(iii) performance is averaged across managers, not across dollars.}
   $$
   Equal-weighted or median-manager summaries are not estimates of the return on the average active dollar. Survivorship bias and benchmark mismatch create the same distortion.

6. **Interpret the theorem correctly.**

   The result is an aggregate identity. It does **not** imply:

   - no active manager can outperform,
   - no subset of active managers can outperform,
   - passive management is optimal for every investor under every objective.

   It implies only that outperformance is a zero-sum game before costs and negative-sum after costs at the aggregate level.

### Proof sketch

The proof is complete once one writes the market return as the value-weighted average of passive and active returns and uses the fact that the passive segment, in aggregate, **is** the market portfolio. No equilibrium assumptions are needed; the argument is purely additive.

## 5. Domain of applicability

The result applies whenever:

- the market and complete set of holders are consistently defined, with changes in capitalization and cash flows accounted for,
- passive management means holding market weights for that universe,
- one evaluates the **average invested dollar**, not the average manager.

It weakens if the benchmark is not the actual market held by the agents being compared, if one studies only a selected subset of active managers, or if costs are measured inconsistently. The result says nothing directly about equilibrium prices, optimality of indexing for a specific investor, or the persistence of skill among a minority subset of active managers.


## 6. The holdings identity behind the return identity

Let security $i$ have market value $M_i$, total market value $M=\sum_iM_i$, and weight $m_i=M_i/M$. Suppose the passive segment owns a fraction $p$ of each security. Its dollars in security $i$ are $pM_i$. The remaining active segment must own $(1-p)M_i$. Dividing by its total capital $(1-p)M$ shows that the active segment's aggregate weights are also $m_i$.

Individual active portfolios can differ sharply from the market and from one another. Their value-weighted active deviations nevertheless sum to zero. If manager $j$ has capital $A_j$ and weights $w_j$, then

$$
\sum_{j\in A}A_j(w_j-m)=0.
$$

Multiplying by the common security-return vector yields

$$
\sum_{j\in A}A_j(r_j-r_M)=0.
$$

This is the central cancellation. It does not require forecast errors to be independent, investors to agree, markets to be informationally efficient, or a particular asset-pricing model to hold. In an inefficient market, gains from correctly exploiting mispricing still have counterparties inside the comprehensive ownership accounting.

The quantity being averaged is return per **beginning-of-period invested dollar**. It is neither an equally weighted average across legal fund entities nor the return earned by a hypothetical investor choosing the median manager. Those objects may answer other questions, but they do not estimate the aggregate return appearing in the theorem.

## 7. What is assumed in the after-cost conclusion

The before-cost equality is arithmetic once the universe and classifications are consistent. The after-cost inequality adds an economic premise: the active segment bears greater average costs per invested dollar. Sharpe motivates this through research expenses and trading activity. If $c_A=c_P$, the two aggregate net returns are equal; if a supposed passive product is unusually expensive, its net return need not exceed that of a cheaper active product.

For consistent all-in cost measures,

$$
r_A^{net}-r_P^{net}=c_P-c_A.
$$

A fund expense ratio is not necessarily the complete cost measure. Trading commissions, spreads, market impact, and research resources affect the investor's economic outcome. Fees paid from portfolio assets must be treated consistently with the return convention. The paper does not estimate a universal numerical cost gap; it derives the implication of a positive gap.

Some trading costs are revenues to brokers, market makers, and other intermediaries. That does not eliminate their cost to the class of investment clients being compared. It does mean that an expanded accounting system including intermediary businesses needs a consistent boundary. Sharpe's argument is about returns on managed investment dollars after the resources used to manage them are paid for.

## 8. A numerical illustration of weighting and incomplete coverage

Consider an active sector with 90 units of capital in a manager earning 9% and 10 units in a manager earning 19%. Its value-weighted return is 10%, while the equally weighted manager average is 14%. If the market returned 10%, the high equal-weighted average does not contradict the identity. The small manager's large gain is offset in dollars by the large manager's smaller shortfall. This example is a reconstruction of the accounting mechanism, not data reported in the paper.

Now partition active holders into institutions with capital share $q$ and other active holders with share $1-q$. Before costs,

$$
q(r_I-r_M)+(1-q)(r_O-r_M)=0.
$$

If the institutional subset earns gross alpha $a_I>0$, the omitted subset must have gross alpha $-qa_I/(1-q)$. Institutional managers can therefore outperform the passive benchmark collectively if other active holders supply sufficient underperformance. A database containing only mutual funds or only surviving professional managers is not the complete active sector.

This distinction preserves room for skill and adverse selection. The arithmetic says that not everyone can earn positive aggregate dollar alpha simultaneously. It does not identify who has skill, how stable it is, or whether an allocator can select it before fees and capacity effects erode the gain.

## 9. The paper's three explanations for apparent contradictions

First, the passive comparison may not satisfy the definition. An index fund that samples instead of replicating its stated market can have residual active exposure. High fees can also erase its cost advantage. A factor index or alternatively weighted index is not the market portfolio of the underlying capitalization-weighted universe merely because it is managed by a rule.

Second, the observed active sample may omit relevant holders, hold assets outside the benchmark universe, or omit funds that failed. Sharpe explicitly mentions individual investors, cash held by equity funds, and survivorship bias. A cash-holding equity fund can trail an all-equity index in a rising market and outperform in a falling market without that difference demonstrating stock-selection skill.

Third, manager-weighted or median performance need not match dollar-weighted performance. The article notes the historical tendency of smaller equity managers to hold smaller-capitalization stocks. Equal-weighting their returns can therefore produce an implicit small-cap bias relative to the whole market. Relative performance will then vary with the small-cap cycle even while aggregate active dollars obey the accounting identity.

These are concrete measurement issues. Finding that a selected manager universe beat a particular index is not by itself evidence against the theorem, but neither should one automatically label every such empirical result meaningless. It may be a valid result about that selected group or that different opportunity set. The appropriate response is to state the estimand and reconcile it with complete holdings accounting.

## 10. Dynamic accounting and the source's simplifying footnotes

The article uses a simple period calculation but notes that mergers, new listings, dividend reinvestment, and related events require more careful calculations. Cross-holdings inside the selected market should be netted out to avoid double counting. Its passive-return equality assumes passive investors buy before the measurement period and sell after it; trades during the period can interact with active liquidity providers at a price.

For an empirical multi-period study, use consistent subperiod valuation and flow conventions before compounding. A constant starting market-cap vector applied to a long span with issuance, redemptions, distributions, and market changes need not be the correct self-financing market return. These accounting refinements preserve the basic ownership identity; they do not justify comparing incompatible return definitions.

The paper's general lesson extends to a small-stock market as readily as a large-stock market if the selected universe and complete owners are properly defined. A claim that small caps are inefficient is insufficient to show that all active dollars in that market beat its passive ownership return before costs. It could support a claim about a skilled subset, which is a different proposition requiring evidence.

## 11. Benchmark choice and what the article does not establish

Sharpe recommends a feasible passive alternative identified before the evaluation period. The comparator should match the mandate's opportunity set and be available to the investor. An ex-post peer-group median is not an investable alternative whose identity was known in advance, and a peer average can be both structurally expensive and poorly aligned with the client's objective.

A negative average net active alpha does not imply that a majority of managers, or even necessarily a minority of active dollars, must underperform. The sign of a weighted mean constrains weighted magnitudes, not the count or capital share of positive observations. The source uses informal language about a minority of outperforming dollars; the exact theorem by itself is only the weighted-average result. A large share can have small gains while a smaller share has sufficiently large losses.

Likewise, the argument does not prove that passive investing is optimal for every investor. Taxes, liabilities, control motives, constraints, hedging needs, and heterogeneous objectives can affect the relevant feasible alternative. It also does not establish that all prices are correct or that active research has no social value. Price discovery and liquidity provision may affect the market as a whole while active investors still face the same ex-post arithmetic.

The useful research implication is a disciplined burden of proof. A claim of active value should identify a specific process or selection advantage, the counterpart opportunity, a mandate-appropriate benchmark, all-in costs, and the correct dollar weights. The paper itself supplies no return dataset or causal test of manager skill; its strength is the exact accounting restriction that any such empirical study must respect.
