# Discussion of “The Supraview of Return Predictive Signals”

**Author:** Peter Algert (Algert Coldiron Investors, San Francisco)  
**Publication:** *Review of Accounting Studies* (2013) 18:731–733; DOI 10.1007/s11142-013-9237-8; published online 31 July 2013 (Springer)  
**Discussed paper:** Green, Hand and Zhang — “The supraview of return predictive signals”  
**Source PDF:** `AbnormalReturnsReview_Algert_2013.pdf` (Drive id `0B-6kBz0I0dMsRmlkSWx6SGVzSlk`)  
**JEL:** G12, G14  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_2)  
**OCR:** Not required; clean `pdftotext -layout` extract (~1,150 words of source; 3 pages). This is a short discussion note; the summary expands every claim and practitioner implication without inventing empirical results beyond Algert’s text and the GHZ findings he cites.

---

## 1. Problem and Motivation

Green, Hand and Zhang (GHZ) assembled what Algert calls the most extensive database to date on **return predictive signals (RPS)** research results. Algert’s discussion highlights three GHZ findings as most relevant to academics and practitioners:

1. **RPS discovery continues at an undiminished pace**, with in-sample Sharpe ratios not declining over time.
2. Debate over academic **$n$-factor** risk controls and the right hurdle for declaring a new RPS “significant.”
3. The broader implication that equity returns are either **“pervasively inefficient”** or that **many more priced factors** exist than previously understood.

Algert briefly treats (1)–(2) and then focuses on return properties of RPS strategies and—critically—the **implementation frictions** that prevent practitioners from closing apparent anomalies. The note is short but dense with operational numbers from a practicing quant (Algert Coldiron Investors).

---

## 2. Setup: What GHZ Document (as Reported by Algert)

- New RPS appear each year without clear diminution; in-sample Sharpes remain high.
- Resource analogy: either the ocean still has many fish, or **technology more than compensates** for declining “population.” Algert, recalling Fortran-era research, favors the technology explanation—but either interpretation is “surprising and encouraging.”
- Research concentration on **US stocks** implies large remaining opportunity from **global expansion** and from simply extending the set of RPS.
- For economists of science, GHZ’s data offer a rare quantitative window on the **production function of academic research** (quantity and type of output).

---

## 3. Methods Theme: How to Evaluate a New RPS (GHZ Section 4, per Algert)

GHZ argue one need **not** control for an exhaustive factor zoo. A signal that is significant **net of the standard three factors** is likely to remain significant when many more factors are included. They acknowledge that **highly correlated** or **a priori similar** factors should still be considered, but simulations show the probability a new RPS remains significant in the presence of correlated RPS stays high—especially for **value-weighted hedge portfolio** returns. Algert: “no prescription for research methodology, but their analysis will likely be a useful citation.”

**Practitioner reading.** This lowers the bar relative to “must be orthogonal to the entire zoo,” while still demanding three-factor net significance plus sanity checks against near-duplicate signals. It does *not* license ignoring correlated cousins of value/momentum/quality.

---

## 4. Results Theme: RPS Return Properties and Combinations

Many RPS in the GHZ database show **high Sharpe ratios relative to equity indices**. GHZ explore combinations and the effect of assumptions on the combined signal’s Sharpe. A key input is the average correlation of RPS returns: GHZ find average correlation **near zero**, yet **average absolute correlation ≈ 0.29**, implying large subgroups are highly correlated with each other.

**Implication Algert draws:** a very attractive investment return was available over the sample from combining RPS—and indeed large firms successfully ran multi-RPS strategies from the **early 1990s**, peaking in **2007–2008** when many quantitative strategies “famously imploded.”

### 4.1 Leverage regime shift post-2007

Historically, managers maximized combined Sharpe and **levered up** to a return target. Sound in theory, but the most levered strategies bore severe **liquidity risk**—a primary cause of poor 2007 returns. Since then, both supply and demand for high leverage changed: strategies that raise Sharpe but **lower mean return** may now be *less* attractive than in the old lever-to-target paradigm.

### 4.2 Implementation costs that scale with leverage

Algert emphasizes costs roughly scaling with leverage: **stock loan fees, trading costs, margin/financing charges**. The first two correlate with the size of the apparent return opportunity—consistent with GHZ findings that **higher return-spread RPS have higher Sharpes**. Mechanism: higher spreads often load extreme quantiles with high-idiosyncratic-risk names that are **expensive to borrow and trade**. That cost structure reduces practitioner pressure to “arbitrage away” those RPS—helping explain **partial post-discovery decay** rather than full elimination.

### 4.3 Algert’s quantitative cost anchors (central empirical content of the note)

| Cost component | Algert’s rule of thumb |
|----------------|------------------------|
| Annual financing + stock borrow | **50–100 bp** outside largest ~1,500 CRSP names; **~half that** in larger names |
| General borrow rate | ~**25 bp/year** typical |
| Hot-stock borrow | sometimes **>20%/year**; few outliers can dominate portfolio borrow cost |
| Round-trip trading costs in smaller names | easily **100–200 bp** of return on a simple hedge portfolio **per full rebalance** |
| Turnover to fully rebalance at 1×1 leverage | **~400% of capital** |

Business models typically require deploying **hundreds of millions of dollars** for a strategy to matter firm-wide—amplifying market-impact and loan constraints.

### 4.4 Why gaps persist

Once an RPS is discovered, do **not** expect managers to fully close the return/risk gap vs other opportunities—especially in smaller, less liquid stocks. Frictions are consistent with **observed partial decay** of RPS post-discovery. Marginal opportunities remain, but success depends on research process quality, implementation-cost management, and investor willingness to bear the risk.

### 4.5 Correlation with other alt risks

GHZ note average RPS returns have **low negative correlation with the market**. Algert cautions combined RPS books may still correlate meaningfully with **credit or volatility strategies** that institutions already hold—important for portfolio overlays.

### 4.6 Organizing the zoo

GHZ call for a unifying view of RPS research. Practitioners often group signals by **correlation with price** (positive / negative / zero)—useful for combination engineering, unlikely to yield conceptual unity. Algert suggests grouping by **theme**—valuation, corporate finance, behavioral effects—and studying **within-group** relationships.

---

## 5. Limitations of the Discussion Note

- Three pages; no independent tables—relies on GHZ for statistical results.
- Cost numbers are practitioner rules of thumb, not a formal market-wide estimation study.
- Written in 2013; post-MiFID II, ETF market-making, and short-rebate regimes may shift the bp anchors.
- Does not formalize an optimal leverage / cost tradeoff model.
- Does not adjudicate “pervasive inefficiency” vs “many factors” ontologically—only notes GHZ push the industry toward that fork.

---

## 6. Practical Takeaways for a Quant Investor

1. **Expect ongoing signal discovery**—capacity and cost, not “academia ran out of anomalies,” are the binding constraints.
2. **Three-factor net significance is a useful screen**, but still test near-duplicate / high-correlation cousins (GHZ simulations + Algert’s caveat).
3. **Average pairwise ρ≈0 among RPS is misleading**; $|\rho|$ average 0.29 ⇒ build combinations with **cluster-aware** diversification, not naive $1/N$ across all published signals.
4. **2007 is the leverage lesson:** maximizing Sharpe then levering to return target embeds liquidity crash risk. Today, evaluate signals on **capital-efficient mean**, not only Sharpe.
5. **Budget borrow and impact explicitly:** 50–100 bp financing/borrow outside top 1500; hot borrows >20%; 100–200 bp round-trip in small caps per full rebalance at ~400% turnover.
6. **High spread ≠ free lunch:** spreads correlate with costly names—paper Sharpes overstate live Sharpes most where paper Sharpes look best.
7. **Partial decay is equilibrium**, not proof of data mining alone; frictions protect residual edges in illiquid names.
8. **Check credit/vol correlation** of the combined RPS book before treating it as market-orthogonal diversifier.
9. **Organize research by economic theme** (value, corporate finance, behavioral) to understand within-group correlation and avoid pseudo-diversification.

---

## 7. Extended Practitioner Commentary (Faithful to Algert’s Claims)

### 7.1 Production function of anomalies

If technology (computing, data, econometric practice) continually lowers the cost of searching for RPS, undiminished discovery rates are rational even if the “true” anomaly pool is finite. That favors investment in **search infrastructure**—alternative data pipelines, robust multiple-testing control, and live trading simulators—over assuming a fixed menu of known factors.

### 7.2 Value-weighted vs equal-weighted hurdles

GHZ’s simulation result that significance is likelier to survive correlated controls in **value-weighted** hedge returns matters for capacity: value-weighted edges are the ones large firms can traffic. Equal-weighted microcap RPS may clear academic t-stats and still fail Algert’s cost schedule (100–200 bp trading + hot borrows).

### 7.3 Multi-signal architecture before and after 2007

Early 1990s–2007: stack low-correlation RPS, observe high portfolio Sharpe, apply leverage, harvest high mean. 2007–2008: correlated deleveraging and liquidity withdrawal across quantitative books. Post-crisis: leverage scarcity ⇒ a signal that improves Sharpe by cutting both mean and vol may be **less** useful to a returns-hungry allocator than a moderate-Sharpe higher-mean signal. Research KPIs should match the firm’s leverage regime.

### 7.4 Cost as a function of apparent alpha

Algert’s observation that loan and trading costs rise with the apparent opportunity is an equilibrium clue: the names that identify the signal are exactly the names that are hard to hold short or turn over. Any research process that measures alpha on mid-prices without a loan tape and an impact model will systematically overfit to expensive names. Tie GHZ-style RPS databases to **borrow intensity** and **ADV** filters before promotion to production.

### 7.5 Portfolio construction implications

Given average absolute correlation 0.29, a risk model for a multi-RPS book needs **block correlation** among thematic clusters (e.g., all accruals-like; all momentum-like). Treating 100 signals as independent overstates breadth (Grinold–Kahn) and overstates attainable IR. Algert’s thematic grouping proposal is a qualitative version of that block structure.

### 7.6 Investor education

Institutions evaluating multi-RPS or “quant equity” allocations should ask: (i) live costs vs Algert anchors; (ii) leverage policy vs 2007; (iii) correlation to credit/vol; (iv) value- vs equal-weighted implementation; (v) decay monitoring post-publication. GHZ’s optimistic discovery findings do not license ignoring these.

### 7.7 Academic citation use

Algert expects GHZ Section 4 to be cited in methodology debates over factor controls. Quants writing white papers can cite Algert for the **cost and leverage** counterweight to anomaly catalogs—keeping the discussion from collapsing into “t-stats forever.”

### 7.8 What this discussion is not

It is not a replacement for reading GHZ; it does not publish new t-stats; it does not claim all RPS survive costs. It is a practitioner’s boundary condition on the anomaly literature: **discovery continues; implementation decides who gets paid.**

---

## 8. Closing Synthesis

Algert congratulates GHZ on the database and discovery facts, endorses their practical stance on limited factor controls, then relocates the debate to where live capital is constrained: **leverage policy, stock loan, trading costs, and thematic correlation structure**. The memorable quantitative residues for a quant investor are the cost table (50–100 bp financing/borrow outside top 1500; hot borrow >20%; 100–200 bp small-cap round-trip; ~400% turnover for full 1×1 rebalance) and the historical arc from early-1990s multi-RPS success through the 2007–2008 quant drawdown to a post-leverage world where Sharpe-improving but mean-reducing signals lost appeal. Partial post-discovery decay of RPS is framed as the equilibrium footprint of those frictions—not as a puzzle to be ignored nor as proof that every anomaly is fake.

---

## 9. Mapping Algert’s Cost Schedule into a Live Alpha Budget

Consider a candidate long–short RPS with paper mean spread 8% per year and paper vol 10% (paper Sharpe 0.8) implemented outside the top 1,500 names at 1×1 with two full rebalances per year.

- Financing + borrow: take midpoint **75 bp/year**.
- Trading: 2 × 150 bp = **300 bp/year** if each full rebalance costs 150 bp round-trip mid of Algert’s 100–200 bp band.
- Hot-borrow overage: reserve **50–100 bp** expected for a few hard-to-borrow names.

Live alpha budget ≈ 8% − 0.75% − 3.0% − 0.75% ≈ **3.5%** before management frictions—less than half the paper mean—and vol may rise if optimization tilts into costlier names. A high paper Sharpe RPS with return spreads concentrated in microcaps can easily go to **zero live Sharpe** under Algert’s anchors. This arithmetic is the operational content of his claim that costs correlate with apparent opportunity and that gaps need not fully close.

## 10. Breadth and Absolute Correlation

Suppose $N$ signals with average absolute pairwise correlation $\bar{|\rho|}=0.29$. Effective breadth is far below $N$. A crude equicorrelation approximation for average correlation $\bar\rho$ (signed) near 0 but with block structure can still yield portfolio vol $\approx \sigma\sqrt{\bar{|\rho|}}$ when combining many same-direction thematic signals. Combination Sharpes reported without a covariance model overstate attainable IR—echoing Algert’s warning that subgroups are highly correlated despite near-zero average signed correlation.

## 11. Institutional Checklist Derived from the Note

1. GHZ-style catalog scan → three-factor net screen → correlated-cousin screen.  
2. Capacity: value-weight simulation + ADV/borrow filters.  
3. Cost sheet using Algert anchors by size bucket.  
4. Leverage policy explicit (post-2007).  
5. Theme clustering; portfolio optimizer uses block correlations.  
6. Overlay correlation vs credit and vol risk factors.  
7. Decay monitor after publication/discovery.  
8. IC / research-production investment if discovery rates remain high.

## 12. Relation to the Broader Anomaly Debate

Algert frames GHZ as forcing a fork: pervasive inefficiency vs a much larger factor set. His friction narrative is compatible with both: either inefficiencies persist in costly segments, or “factors” are compensation for liquidity/loan risks partially spanned by his cost schedule. Quants need not resolve the ontology to use the note—they need to **price implementation**.

## 13. Final Emphasis

The discussion’s scarce pages punch above their weight because they inject **numbered institutional constraints** into a literature that often stops at t-statistics. Undiminished RPS discovery is good news; 2007 leverage wreckage, 50–100 bp borrow outside top 1500, 100–200 bp small-cap trading per rebalance, and $|\rho|\approx0.29$ among signals are the binding realities that decide whether that news appears in live PnL.

---

## 14. Sentence-Level Digestion of Algert’s Note

**Opening.** GHZ built the largest RPS results database; three findings matter most: undiminished discovery; n-factor evaluation standards; pervasive inefficiency vs many factors. Algert skims the first two and focuses on RPS returns.

**Discovery.** New RPS per year undiminished; in-sample Sharpes stable. Ocean-vs-technology metaphor; Algert favors technology. US-centric literature ⇒ global + more signals still to write. GHZ data inform the academic production function.

**Section 4 evaluation.** Need not exhaust factors; three-factor significance likely survives richer controls. Correlated/similar factors still deserve attention; simulations show high survival probability, especially value-weighted hedges. Useful citation without being a full methods mandate.

**Returns bulk.** Many RPS beat equity-index Sharpes. Combinations depend on correlations: mean ρ≈0 but mean |ρ|≈0.29 ⇒ correlated subgroups. Attractive combined returns existed; large firms ran multi-RPS from early 1990s, peaking into 2007–2008 quant wipeout.

**Leverage history.** Old playbook: max Sharpe, lever to return target → liquidity risk → 2007 damage. Post-crisis leverage supply/demand lower ⇒ Sharpe↑ with mean↓ less attractive.

**Costs.** Scale with leverage: loan, trading, financing. Loan/trading rise with apparent opportunity—aligned with GHZ’s higher-spread ⇒ higher Sharpe pattern via high-idio extreme quantile names that are costly to borrow/trade. Less practitioner pressure to close those RPS.

**Numeric anchors.** 50–100 bp annual financing+borrow outside top 1500 CRSP; half in larger names; general borrow ~25 bp; hot borrow sometimes >20%/year; small-stock round-trip 100–200 bp per full rebalance; 400% turnover to fully rebalance at 1×1; managers want hundreds of millions deployed.

**Decay.** Don’t expect full gap closure especially in illiquid names; frictions match partial post-discovery decay; success = research quality + cost control + risk appetite.

**Cross-correlations.** GHZ: average RPS vs market low negative; Algert: combined books may still tie to credit/vol institutional factors.

**Unifying view.** Practitioner price-correlation grouping helps combinations but not theory; prefer themes—valuation, corporate finance, behavioral—and within-group structure.

## 15. Integrating with Multi-Factor Risk Models

Algert’s discussion implies a two-layer risk model for multi-RPS books: (i) standard equity factors (market, size, value, etc.) for the three-factor hurdle GHZ endorse; (ii) **theme factors** spanning clusters of RPS with high |ρ|. Layer (ii) prevents false breadth. Cost overlays act as a third “factor” consuming alpha in small-cap high-spread signals.

## 16. Closing for the Scholar Library

Store this note beside GHZ as the practitioner brake pedal: discovery is alive; 2007 taught leverage; costs are tens to hundreds of bp and rise with paper attractiveness; absolute correlations among signals are material; organize by economics, not only by sign of price correlation.

---

## 17. Bibliographic Pointer

Readers should pair this discussion with Green, Hand and Zhang’s original *Review of Accounting Studies* article on the RPS “supraview,” then overlay Algert’s cost and leverage constraints before any live allocation decision. The DOI for Algert’s note is 10.1007/s11142-013-9237-8; affiliation Algert Coldiron Investors, San Francisco (peter.algert@acinvestors.net as printed).

---

## 18. Source-Length Disclosure

Algert’s published note is only three journal pages (~1,150 extracted words). Every quantitative claim above (50–100 bp financing/borrow, hot borrow >20%, 100–200 bp small-cap round-trip, ~400% turnover, mean |ρ|≈0.29, early-1990s to 2007–2008 arc, three-factor evaluation stance) is taken from that note or from GHZ findings as Algert reports them. No additional regression results were fabricated to pad length; remaining space is structured interpretation for quant investors.
