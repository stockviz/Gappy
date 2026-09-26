# Momentum, Rational Agents and Efficient Markets

**Authors:** John Crombez (Professor, Hogeschool Gent; Director, Ghent Finance Center, KPMG and Ghent University). PhD Economics; Masters in Statistical Sciences (Université de Neuchâtel). Affiliation for correspondence: Department of Financial Economics, Ghent University, Sint-Pietersplein 4, 9000 Ghent, Belgium.  
**Publication:** *The Journal of Psychology and Financial Markets*, 2001, Vol. 2, No. 4, pp. 190–200. Copyright Institute of Psychology and Markets. (Drive/PDF basename uses “2000”; journal imprint is 2001.)  
**Source PDF:** `AbnormalReturnsMomentum_Crombez_2000.pdf` (Drive id `0B-6kBz0I0dMsek1DQkx6cTBHYU0`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_4)  
**Extraction:** `pdftotext -layout` OK (~7,802 words source; 11 pages). No OCR required.

---

## 1. Problem and Motivation

### 1.1 The momentum anomaly and the behavioral default

Jegadeesh and Titman [1993] document that a strategy of buying recent winners and selling recent losers earns roughly **1% per month** in U.S. equities; Jegadeesh and Titman [1999] (NBER #7159) re-evaluate alternative explanations and find the profitability robust. Rouwenhorst [1998] finds a similar European momentum premium of about **1% per month** over 1980–1995 on samples covering roughly 60–90% of included countries’ market capitalization—i.e., not only on tiny, infrequently traded names. The Fama–French [1993] three-factor model does not absorb these returns. Dreman and Lufkin [2000] argue that fundamentals are relatively stable around large favored/unfavored price moves, concluding that psychological factors must drive the price path.

Given the difficulty of risk-based or fundamental explanations, the literature’s modal response has been **descriptive behavioral modeling**: assume financial agents suffer cognitive failures documented in psychology labs. Daniel, Hirshleifer, and Subrahmanyam [1998] build overconfidence and biased self-attribution into a theory of under- and over-reaction. Barberis, Shleifer, and Vishny [1998] explain momentum as **underreaction to news**: news is not quickly reflected in price and therefore continues to affect subsequent returns—but underreaction itself violates rationality. Hong and Stein [1999] offer a unified theory of underreaction, momentum trading, and overreaction with boundedly rational agent types (“newswatchers” and “momentum traders”).

### 1.2 Why Crombez objects to the leap

Crombez argues that leaping from “anomaly exists” to “agents are irrational” is unjustified on two grounds:

1. **External validity of cognitive failures.** We do not know how susceptible professional financial decision-makers are to biases observed in unrelated experimental settings (overconfidence in the De Bondt–Thaler [1995] sense; conservatism à la Edwards [1968]).  
2. **Incomplete alternative to EMH.** As Fama [1998] stresses, behavioral models often work well on the anomalies they were designed to explain and rarely provide a comprehensive substitute for the efficient-market hypothesis.

Einhorn and Hogarth [1988] put the methodological point sharply: treating human judgment as suboptimal without discussing the limitations of optimal models is naïve. De Bondt and Thaler [1995] note that finance often invokes “assumed optimality”—actual decision processes are not studied because they supposedly do not affect outcomes. Descriptive behavioral finance flips that assumption but imports cognitive failure without testing it on financial agents.

### 1.3 Normative counterfactual

Crombez constructs a **normative** environment (how agents *should* behave) with three properties: agents form **Bayesian rational expectations**; markets are **Grossman–Stiglitz [1980] efficient**; and there are **information-market imperfections**—noise in the precision (strength) of expert evidence. Within this environment he shows numerically that momentum-like continuation, boom/crash speed asymmetry, and even overshooting can arise. The paper therefore **benchmarks** behavioral explanations: if anomalies appear under rationality and efficiency, cognitive-failure assumptions are not necessary and should be demonstrated rather than presumed.

---

## 2. Decision-Making Environment

### 2.1 The agent’s information set

The decision problem is the judgment of next-period payoff/return. Good news bids prices up and lowers expected subsequent returns. The agent’s information set has two components:

- **Historical price changes** — the likelihood / data distribution.  
- **Expert opinion about value** — analysts and similar experts who typically do **not** trade but communicate earnings forecasts and buy/sell recommendations, having acquired **costly** public information (site visits, management access, proprietary models).

This matches the Hong–Stein uninformed trader’s use of prices, augmented by expert priors. Griffin and Tversky [1992] emphasize that when tasks are difficult, experts themselves acquire extra information; investment banks’ model investment is the market analogue of costly public information.

Bayes’ rule is the “language” translating evidence into judgment:

$$
P(A\mid B)=\frac{P(B\mid A)\,P(A)}{P(B)}.
$$

Here $B$ is historical price-change evidence and $A$ is expert opinion about the future price change. Markowitz [1952] already envisioned combining statistical parameters with expert judgment via Bayes to feed mean–variance portfolio choice.

### 2.2 Three assumptions

**Assumption 1 — Asymmetric information.** Some information must be acquired at cost. Costly public information is not only accounting fundamentals; it includes model- and theory-based expert judgment.

**Assumption 2 — Grossman–Stiglitz efficiency.** Prices fully reflect **costless** public information. Costly information is reflected only noisily because of noise in the precision of informed participants’ signals. Market imperfections in the information market therefore persist even under efficiency. Griffin–Tversky: for hard problems, **strength** of evidence (dispersion of opinions) dominates **weight** (number of speakers). Hong, Lim, and Stein [2000]: information diffusion is slower for small-caps; analyst coverage is primarily a size phenomenon—book-to-market and residual coverage add little.

**Assumption 3 — Theoretical news–price link.** News on expected returns maps into prices via valuation identities. Gordon growth $P=D/(r-g)$: with price-to-dividend 25, $r-g=4\%$, so a **1 percentage-point** change in expected return implies a **25%** price change (Cochrane [2001]). Ohlson [1995] residual income under persistent abnormal earnings: $P=e_{t+1}/r$; with earnings-yield forecast 5%, a 1 pp expected-return change implies about a **17%** price change (Dechow, Hutton, and Sloan [1999]). Precision of expert news is therefore first-order for price discovery.

### 2.3 Prior construction: FY1 and Parkinson $\tau$

The prior is the **one-year analyst consensus earnings yield (FY1)**. Dechow–Hutton–Sloan find FY1 informative for true value. Strength of evidence $\tau$ follows Kinney, Burgstahler, and Martin [1999]: use the **range** of high ($H$) and low ($L$) forecasts. Variance of expert opinion uses Parkinson’s [1980] extreme-value estimator:

$$
\widehat{\mathrm{Var}}(\text{expert opinions}) = 0.361\,(H - L)^2.
$$

Using range rather than analyst count operationalizes Griffin–Tversky strength-over-weight and avoids conflating coverage quantity with signal quality.

---

## 3. Models and Methods: Bayesian Bootstrap Regression

### 3.1 Likelihood from random-walk prices

Let $P_t$ be log price. Random walk with drift:

$$
P_t = \mu + P_{t-1} + \varepsilon_t.
$$

Returns $r_t$ then obey the normal linear regression on a unit vector $\iota$:

$$
r_t = \mu\,\iota + \varepsilon_t. \tag{2}
$$

At **monthly** rebalancing frequency, short-horizon predictability from past prices is weak (Campbell, Lo, and MacKinlay [1997]); the uninformed Hong–Stein forecast is essentially the sample mean $\hat\mu$. Classical likelihood inference is hard when priors and functions of interest are intractable (Geweke [1989]); common-shrinkage Bayes–Stein estimators (Jorion [1991]) impose a **common** prior parameter (e.g., minimum-variance portfolio return) and lose asset-specific information (Bawa, Brown, and Klein [1979]).

### 3.2 Posterior structure

Likelihood $f(r\mid\mu,\sigma)=L(\mu,\sigma\mid r)$. In BBR, residuals follow a nonparametric empirical distribution $h(\varepsilon\mid\sigma)$. By Bayes:

$$
p(\mu,\sigma\mid r)=\frac{p(\mu,\sigma)\,f(r\mid\mu,\sigma)}{p(r)}.
$$

Independence of prior $\mu$ and $\sigma$ is assumed. Marginal posterior for the decision-relevant parameter $\mu$:

$$
p(\mu\mid r)=\int_0^\infty p(\mu,\sigma\mid r)\,d\sigma.
$$

Weighting the likelihood by the prior on $\sigma$ and integrating $\sigma$ out yields $f_\sigma(r\mid\mu)$, the posterior for $\mu$ when $p(\mu)=1$. Posterior expectations of any $g(\mu)$ become integrals against this marginal.

### 3.3 Importance sampling / bootstrap approximation

Draw i.i.d. $\mu_i^*$ from $f_\sigma(r\mid\mu)$ (or via the empirical residual bootstrap). Approximate

$$
E[g(\mu)] \approx \frac{N^{-1}\sum_i g(\mu_i^*)\,p(\mu_i^*)}{N^{-1}\sum_i p(\mu_i^*)},
$$

with numerical standard error (nse) from the weighted squared deviations (Heckelei and Mittelhammer [1996]). Convergence is monitored by stability of $E[g(\mu)]$ as replications increase; Crombez reports stable estimates. **Simulation size: $N=5{,}000$** bootstraps per scenario—interpreted as mimicking the human mind’s weighing of evidence “as a pan balance.”

The BBR engine is attributed to Geweke’s [1986] constrained normal linear regression solution and Kloek–Van Dijk [1978] Monte Carlo integration, but without Geweke’s parametric assumptions—allowing **flexible individual priors**, the key advantage over conjugate/common-prior setups (Lenk and Wedel [2001] discuss prior choice as a model limitation).

### 3.4 Likelihood data for the weighing experiment

Sixty months of **Belgian** Datastream total-market monthly percentage returns, **1996–2000**. Historical sample mean used as uninformed benchmark: **1.668%** per month; sample standard deviation **4.17%**.

---

## 4. Empirical Evaluation of Expert Strength (MSCI Europe)

### 4.1 Database

Intersection of **IBES** (mean consensus FY1, high/low forecasts, number of analysts) and **Datastream** (market values, returns) for stocks in the **MSCI Europe** index, **March 1992 – August 2000**. Average index membership ≈ **588**; average covered ≈ **471**. Coverage rose over the 1990s; average analysts per covered name rose from ~**16** (1992) to ~**21** (1997) then ~**19** (2000)—more names covered by slightly fewer analysts per name by sample end. Portuguese stocks enter late 1997. Almost no stocks with a single analyst (in that edge case $\tau$ is set to twice the market-portfolio SD).

This universe is deliberately **liquid**. Carhart [1997] finds momentum unattractive after costs; Rouwenhorst still finds ~1%/month on broad European stocks. If expert noise exists here, rational momentum is not confined to microcaps.

### 4.2 Decile $\tau$ patterns (Table 1)

Each month, stocks are sorted into **ten MV deciles** and **ten CAPM-beta deciles** (~50 names). For each decile-month, Parkinson $\tau$ is averaged with **MAD** (mean absolute deviation) robustness against outliers. Selected averages:

**By market capitalization (Q1 = smallest):**  
Q1: $\tau=0.02914$; Q2: $0.02801$; Q3: $0.00331$; Q4: $0.00219$; Q5: $0.00085$; Q6: $0.00040$; Q7: $0.00042$; Q8: $0.00036$; Q9: $0.00028$; Q10: $0.00008$.

**By beta (Q1 = lowest):**  
Q1: $0.00169$; Q2: $0.00158$; Q3: $0.00077$; Q4: $0.00047$; Q5: $0.00077$; Q6: $0.00077$; Q7: $0.00023$; Q8: $0.00093$; Q9: $0.00108$; Q10: $0.00526$.

**Interpretation.** Small-cap Q1–Q2 expert variance is extreme (~2.85%, SD ~**17%**), partly from negative earnings forecasts; Crombez therefore treats Q3 ($\tau=0.00331$, expert SD ~**5.75%**) as the weak-but-usable liquid case, Q5 ($\tau=0.00085$, SD ~**2.92%**) as medium, and Q10 ($\tau=0.00008$, SD ~**0.89%**) as strong. Noise declines monotonically with size—confirming faster large-firm diffusion (Hong–Lim–Stein). Beta sorts show **weak evidence at both extremes** (low-beta SD ~4%; high-beta SD ~7%), so high systematic risk does not imply clean expert consensus.

---

## 5. Results: Scenarios, Weighing Functions, Momentum Paths

### 5.1 Scenario design (Table 2)

Expert consensus is fixed at **+4%** next-period return (price 100 → “true” fundamental 104). Only disagreement $\tau$ varies. Highest/lowest forecasts are symmetric around 4% from the Parkinson definition.

| Strength $\tau$ | Expert SD | High forecast | Low forecast | Bayesian $\widehat{E}(\mu)$ |
|-------------------|-----------|---------------|--------------|-------------------------------|
| 0.00000 | 0.000% | 4.000% | 4.000% | **4.000%** |
| 0.00008 | 0.899% | 4.744% | 3.256% | **2.262%** |
| 0.00085 | 2.916% | 6.426% | 1.574% | **1.728%** |
| 0.00331 | 5.753% | 8.788% | −0.008% | **1.680%** |

Uninformed historical mean = **1.668%**. Perfect consensus ⇒ agent adopts 4% fully. As $\tau$ rises, the posterior collapses toward history: the optimistic expert view is progressively ignored because strength is low—even when expert SD is still below historical return SD (medium case 2.92% < 4.17%).

### 5.2 Weighing-function geometry (Figures 1–3)

Weights from 5,000 bootstrap possible outcomes are ranked on the x-axis from low to high candidate returns.

- **Figure 1 (low disagreement, $\tau=0.00008$).** Steep weighing function: mass shifts to large positive outcomes. Posterior **2.262%** is **+0.594 percentage points per month** above the uninformed mean—economically large. Right-tail weights rise sharply. Looking at Table 1, this precision is typical of the largest MV decile.  
- **Figure 2 (moderate, $\tau=0.00085$).** Much flatter. Posterior **1.728%** (+0.060 pp/month). The agent already trusts statistical evidence more than the optimistic expert.  
- **Figure 3 (high disagreement, $\tau=0.00331$).** Nearly flat. Posterior **1.680%** (+0.012 pp). The only effect of +4% expert consensus is a slight tilt against bad outcomes; no strong preference among possible judgments.

**Price-discovery implication.** Strong signals → aggressive bidding → news quickly in prices → little autocorrelation. Weak signals → muted revision → prices lag expert valuation → **serial correlation / momentum** as information slowly arrives—without any cognitive bias.

### 5.3 Two-period diffusion simulation (Table 3)

Assume: (i) no additional public information; (ii) experts continue to value the stock at 104; (iii) when consensus persists, the agent **doubles** the strength weight on experts. Period-1 Bayesian prices and period-2 updates:

| Price at $t=1$ | Remaining expert forecast | Doubled $\tau$ | Bayesian at $t=2$ | Price end $t=2$ |
|------------------|---------------------------|------------------|---------------------|-------------------|
| 102.26 | 1.699% | 0.00004 | 1.671% | **103.97** |
| 101.73 | 2.223% | 0.00043 | 1.693% | **103.45** |
| 101.68 | 2.281% | 0.00166 | 1.671% | **103.38** |

Only the **strong-signal** path approximately reaches true value 104 by $t=2$. Medium and weak paths remain underpriced after two periods. **Differences in information diffusion therefore account for momentum** under maintained rationality and efficiency. This matches the *phenomenology* of Barberis–Shleifer–Vishny underreaction without their irrationality premise. Frictions are defined as expert disagreement from different models and different expert–firm relationships (Lim [2001]).

### 5.4 Booms, crashes, and efficient overreaction

**Crash vs boom speed.** Empirically, for each size decile, analyst agreement (strength) is **larger when markets decline**. Higher strength ⇒ expert opinion reflects faster into prices ⇒ **crashes are fast, booms are slow**—an efficient-market rationalization of a classic empirical asymmetry.

**Overreaction without irrationality.** Continue the weak-signal path. With experts still at fundamental 104 but high disagreement, the flat weighing function makes the agent almost an uninformed price trader (always ~1.668%). By period 3, remaining expert view ~**0.60%** but the investor forecasts ~**1.62%**, bidding the price to about **105.1**—**above** true value. Fuzzy costly information prevents filtering; the rational agent overshoots. Under- and over-reaction are regimes of the **same** noisy-expert mechanism.

---

## 6. Limitations

1. **Numerical existence, not a tradable backtest.** The paper shows momentum *can* exist under stated assumptions; it does not estimate net-of-cost strategy profits (Carhart’s critique remains open empirically).  
2. **Hybrid geography.** Weighing-function likelihood is Belgian 1996–2000; $\tau$ patterns are MSCI Europe 1992–2000. Cross-market transferability of the Belgian residual distribution is assumed, not tested.  
3. **Prior sensitivity.** FY1 range is one prior among many (earnings yield, surveys, etc.); Lenk–Wedel stress prior choice as a model limitation. Negative-earnings extremes force discarding Q1–Q2 size deciles.  
4. **Mechanical persistence weight.** Doubling $\tau$ when consensus repeats is a modeling device, not estimated learning.  
5. **No microstructure or agency layer.** Transaction costs, short-sale constraints, and analyst career concerns (Lim) are cited but not inside the BBR.  
6. **Does not refute behavioral models.** It shows they are not *necessary*. Cognitive failures could still operate; they need independent evidence in financial populations.  
7. **Appendix algorithm** (Figure A-1) is referenced but not fully tabulated in the extract; replication requires Heckelei–Mittelhammer details.

---

## 7. Quantitative Takeaways for Quants and Researchers

1. **Rational momentum channel.** Under Grossman–Stiglitz efficiency, momentum is predicted where expert **strength** $\tau$ is high (noisy)—smaller MV, extreme beta—exactly the cohorts where behavioral papers also find stronger continuation.  
2. **Calibrated Bayesian–expert blend.** With history 1.668% and expert 4%, posteriors are 2.262% / 1.728% / 1.680% across strong/medium/weak $\tau$. The **diffusion wedge** is ~59 bp/month (strong) vs ~1 bp (weak).  
3. **Parkinson FY1 range as a live signal-quality metric.** Monitor cross-sectional $(H-L)$ of one-year earnings yields; $\tau=0.361(H-L)^2$. Size-decile averages in MSCI Europe spanned roughly **eight basis points of variance at the large end to ~3% at the small end**.  
4. **Coverage count is secondary.** Do not equate “many analysts” with “precise signal”; strength dominates weight for difficult valuation tasks.  
5. **Liquid-universe relevance.** Momentum among MSCI Europe names is compatible with noisy expert precision—useful when skeptics dismiss momentum as a microcap illusion.  
6. **State-dependent crash velocity.** Higher analyst agreement in down markets rationalizes faster crashes; risk systems that assume symmetric news incorporation will mis-time stress.  
7. **Efficient overshoot risk.** Prolonged high disagreement can produce rational overshooting above expert fair value—relevant for mean-reversion overlays that assume underreaction only.  
8. **Policy / microstructure.** Raising independence and precision of expert communication (Kinney–Burgstahler–Martin accuracy improvements in the 1990s) should compress $\tau$, accelerate incorporation, and **erode** momentum profits—an efficiency-improving prediction.  
9. **Implementation diagnostic.** Before attributing residual momentum alpha to behavioral biases in a live book, sort names by forecast dispersion and re-estimate continuation; high-dispersion buckets are the rational-friction prediction.  
10. **Valuation multiplier reminder.** Because 1 pp expected-return news maps to teens–25% price moves, modest yield-forecast disagreement is economically large for price paths.

---

## 8. Conclusion

Crombez replaces the behavioral default with a normative Bayesian agent in a Grossman–Stiglitz market where expert evidence is noisy. Using Bayesian bootstrap regression (5,000 draws) calibrated to Belgian return history and MSCI Europe IBES dispersion, he shows that **strong** expert consensus produces rapid price adjustment (~2.26% Bayesian vs 1.67% uninformed), while **weak** consensus barely moves beliefs (~1.68%)—generating multi-period underpricing, momentum-like paths, asymmetric boom/crash speeds, and eventual overshooting, all without irrationality. The paper’s lasting contribution for quantitative researchers is the discipline it imposes: information-market frictions are a sufficient explanation that must be ruled out—or measured via forecast-dispersion diagnostics—before cognitive-failure stories are treated as necessary.

---

## 9. Deeper Method Notes and Related-Model Mapping

### 9.1 Mapping to Hong–Stein and BSV

Hong and Stein [1999] split the market into newswatchers (who underreact because they do not extract information from prices) and momentum traders (who chase trends and create overreaction). Crombez’s single Bayesian agent plays both roles **dynamically** as a function of $\tau$: when expert strength is high, the agent behaves like an informed newswatcher who rapidly incorporates FY1; when strength is low, the agent collapses toward the pure price-based forecast (Hong–Stein’s uninformed linear forecast = sample mean) and can later overshoot—momentum-trader phenomenology without a second boundedly rational tribe.

Barberis–Shleifer–Vishny [1998] generate underreaction from a conservative regime-shifting belief about earnings. Crombez generates observationally similar slow incorporation from **dispersion in the expert channel** that rational agents correctly down-weight. The empirical prediction that distinguishes them is measurable: BSV-style conservatism is a psychological parameter; Crombez’s friction is **observable IBES (H−L) dispersion**, which the MSCI Europe exercise shows varies strongly with size and beta.

Daniel–Hirshleifer–Subrahmanyam [1998] rely on overconfidence (agents overweight private signals). Crombez’s rational agent does the opposite when $\tau$ is large: overweight the **public statistical** record relative to noisy experts. Overconfidence would amplify weak expert signals; Crombez’s mechanism **dampens** them. A quant diagnostic follows: if continuation is strongest where forecast dispersion is highest, the Crombez channel is favored; if continuation is strongest where agents appear to overweight thin private information, DHS is favored.

### 9.2 Why BBR rather than conjugate Normal–Inverse-Gamma

A conjugate Normal–Inverse-Gamma prior would deliver closed-form posteriors but would force a parametric residual law and a tightly specified prior family. Finance applications often need non-Gaussian residuals and asset-specific expert priors (different FY1 and different $(H,L)$ per name). BBR’s nonparametric residual bootstrap plus importance reweighting by $p(\mu)$ constructed from the expert consensus and Parkinson scale is designed exactly for that flexibility. The cost is Monte Carlo error, controlled here by $N=5{,}000$ and by monitoring stability of $E[g(\mu)]$.

The estimator of the posterior mean and nse in equation (6) of the paper is the standard self-normalized importance-sampling pair:

$$
\widehat{E}(\mu)=\frac{\sum_{i=1}^{N}\mu_i^* p(\mu_i^*)}{\sum_{i=1}^{N}p(\mu_i^*)},\qquad
\mathrm{nse}=\left(\frac{\sum_{i=1}^{N}(\mu_i^*-\widehat{E}(\mu))^2 p(\mu_i^*)^2}{\bigl(\sum_{i=1}^{N}p(\mu_i^*)\bigr)^2}\right)^{1/2}.
$$

When $p(\mu)$ is tightly concentrated (low $\tau$), effective sample size can drop; Crombez’s reported stability suggests the Belgian likelihood and chosen $\tau$ grid were well behaved.

### 9.3 Connecting Gordon / RIM multipliers to the 4% expert scenario

The scenario’s +4% expert return on a price-100 stock is not an arbitrary toy. Under Gordon with $P/D=25$, $r-g=4\%$; a move from an uninformed expected return near the Belgian sample mean (~1.7%/month annualized context differs, but the paper’s levels are monthly judgmental returns) toward a 4% expert view is precisely the kind of expected-return revision that valuation theory maps into large price gaps. Under RIM $P=e_{t+1}/r$ with 5% earnings yield, a 1 pp revision in $r$ is a ~17% price event. Thus the gap between Bayesian 2.262% and uninformed 1.668%—about 59 bp at monthly horizon—is not a rounding error: compounded and capitalized, it is the wedge that Table 3 shows taking two periods to close under strong signals and longer under weak ones.

### 9.4 MAD robustness and outlier economics

The paper stresses that raw cross-sections of $\tau$ contain extreme outliers, especially in small-MV deciles where negative earnings forecasts inflate $(H-L)$. MAD-based location estimates prevent a few distressed names from dominating decile averages. For live risk systems importing dispersion signals, the same lesson applies: use robust location (MAD, trimmed means) rather than equal-weighted average range, and consider winsorizing negative-earnings names separately—as Crombez effectively does by focusing inference on Q3–Q10.

### 9.5 What “Grossman–Stiglitz efficiency” buys

Grossman and Stiglitz [1980] show that fully revealing prices destroy the incentive to acquire costly information, so equilibrium prices must be only **partially** revealing. Crombez operationalizes the residual noise as cross-expert disagreement about FY1. Efficiency in this sense is compatible with slow diffusion: costly information *is* in the market (in analysts’ heads and models) but is communicated with noise, so prices need not jump to the experts’ consensus valuation in a single period. Momentum is then the finite-sample path of Bayesian updating under noisy public costly signals—not a violation of the Grossman–Stiglitz notion of efficiency.

### 9.6 Practical research design suggested by the paper

A natural extension (not performed in-paper but tightly implied) is a panel sort:

1. Each month, compute Parkinson $\tau_i$ from IBES FY1 high/low for name $i$.  
2. Form $\tau$ quintiles within size buckets (to avoid pure size confounding).  
3. Within each cell, measure standard 12-1 momentum profits over the next $K$ months.  
4. Prediction: **higher $\tau$ ⇒ stronger continuation**, declining as Kinney-style forecast accuracy improves through time.

A second design: condition $\tau$ on up vs down market months to test the crash-speed channel (higher agreement in declines ⇒ less continuation after down-month news, faster gap closure).

### 9.7 Relation to estimation-risk literature

Bawa–Brown–Klein and Jorion emphasize that ignoring estimation risk in means leads to extreme portfolios; Bayes–Stein shrinkage toward a grand mean is the classic fix. Crombez’s contribution is orthogonal but complementary: the **prior** itself comes from experts, and the **precision of that prior** is empirically measurable and varies in the cross-section. Portfolio construction that shrinks toward FY1 without scaling by $\tau$ will over-trust noisy small-cap forecasts—the exact mistake Figure 3’s flat weighing function warns against.

---

## 10. Synthesis for Portfolio Practice

For a quantitative long–short equity process, Crombez’s results recommend treating analyst-dispersion not only as a risk or uncertainty signal but as a **state variable for expected momentum half-life**. In high-$\tau$ regimes and names, expect slower incorporation and more trend persistence; size the horizon of momentum signals longer and beware of early mean-reversion exits. In low-$\tau$ large-cap names with tight FY1 bands, expect faster gap closure; momentum signals should be shorter-horizon and more quickly faded. Overlay a market-state switch: when cross-sectional agreement rises in selloffs, shorten reaction times and reduce the assumption that “underreaction always buys time.” Finally, track industry-level improvements in forecast precision as a secular attenuator of classic momentum—consistent with the paper’s closing claim that better independent expert communication improves market efficiency and reduces the profitability of continuation strategies.
