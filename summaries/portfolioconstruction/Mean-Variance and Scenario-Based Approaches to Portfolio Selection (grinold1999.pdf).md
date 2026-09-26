# Mean-Variance and Scenario-Based Approaches to Portfolio Selection

**Author:** Richard C. Grinold (Barclays Global Investors, San Francisco)  
**Publication:** *The Journal of Portfolio Management*, Winter 1999, Vol. 25, No. 2, pp. 10–22  
**Source PDF:** `grinold1999.pdf` (Drive id `1rfX9hd58mZ3Z9jYU9pSkeqdJH_9Pre-F`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_3)  
**OCR:** Not required; clean extract (IIJ watermarked PDF)

---

## 1. Problem and Motivation

Grinold contrasts two portfolio-optimization traditions:

1. **Mean–variance (MV)** — dominant in professional investment management.
2. **Scenario-based / expected-utility / returns-based** optimization — favored in academia; revived interest among practitioners seeking skewness, downside risk, and higher moments.

Scenario methods appeal because they have academic roots, use the full outcome distribution, and are indispensable when options or other distribution-altering assets enter. Challenges: must specify the full return distribution; must specify a realistic objective; must handle the institutional **benchmark / active-risk** split (benchmark risk viewed differently from active risk).

**Main thesis.** For institutional problems with an explicit or implicit benchmark and a desire to keep predicted active risk near that benchmark, moving from MV to scenario-based methods offers **large dangers and small benefits**. When both are put on the same footing (benchmark-consistent unconditional means; scaled alphas targeting a desired active risk), portfolios are similar. Prefer MV unless options force scenarios.

Metaphor: do not be the sorcerer’s apprentice—stay in control of the tool.

---

## 2. Unconditional vs Conditional Expected Returns

Sports analogy: unconditional home-field edge ≈ 3 points; conditional forecast uses teams, weather, injuries, betting line. Finance analogue: unconditional equity risk premium 5.5%/yr and bond 2.0%/yr from long study; conditional forecast adds earnings yields, inflation outlook, etc. **Alpha** = conditional minus unconditional expected excess return.

Critical modeling step: separate unconditional means (harmonized so the **benchmark is optimal when alphas are zero**) from conditional alphas (research views).

---

## 3. Mean–Variance Portfolio Selection

Split expected return into risk-free, unconditional excess $\mu$, and alpha $\alpha$. Choose fully invested $h\in H$ to maximize

$$
(\mu+\alpha)^\top h - \tfrac{\lambda}{2} h^\top V h \tag{P-1}
$$

Fail-safe: when $\alpha=0$, optimum should be the benchmark $h_B$. This requires reverse-engineered (“grapes from wine”) means

$$
\mu=\lambda V h_B. \tag{1}
$$

For the benchmark, $\mu_B=\lambda\sigma_B^2$ (2). Running example: $\mu_B=5.5\%$, $\sigma_B=15.63\%$ so $\sigma_B^2=0.0245$, $\lambda=2.25$.

Active risk $\omega_P=\sqrt{(h_P-h_B)^\top V(h_P-h_B)}$. Information ratio $\mathrm{IR}(\alpha)=\sqrt{\alpha^\top V^{-1}\alpha}$ (paper’s notation writes $\mathrm{IR}(\alpha)=\alpha^\top V^{-1}\alpha$ in (4) but text treats IR as extra return per unit active risk—standard Grinold–Kahn usage is $\mathrm{IR}=\sqrt{\alpha^\top V^{-1}\alpha}$; the optimal active-risk rule $\omega_P\approx\mathrm{IR}/\lambda$ in (5) is consistent with IR being the square-root form, and with $\lambda=2.25$, IR$=0.1$ giving $\omega\approx4.45\%$).

**Inconsistency:** managers often claim IR≈1 yet run 2–10% active risk (median ~5%). With IR=1 and $\omega=4\%$, implied $\lambda=25$, which via (2) would imply absurd $\mu_B=60\%$. Industry resolution: treat active risk differently from benchmark risk—benchmark-relative objective

$$
\alpha^\top h - \tfrac{\phi}{2}(h-h_B)^\top V(h-h_B) \tag{P-1*}
$$

with large active risk aversion $\phi$, or equivalently scale alphas in (P-1) as $[\mu+(\lambda/\phi)\alpha]$ (P-1**).

---

## 4. Scenario-Based Selection

$S$ scenarios with probabilities $\pi_s$, total returns $r_{s,n}$. Maximize

$$
\sum_{s=1}^S \pi_s U(r_{s,P}) \tag{P-2}
$$

with same constraints as MV. Utility increasing and concave. Running family: power utility $U(r)=r^{1-\gamma}/(1-\gamma)$ ($\gamma\to1$ gives log). $\gamma$ plays risk-aversion role analogous to $\lambda$.

**Skewness value (Exhibit 1).** Transform one 900-point sample into normal vs lognormal, both with excess mean 5.50% and SD 15.63%. Normal skewness 0.008; lognormal 0.425. Annualized willingness-to-pay to switch to positively skewed lognormal:

| $\gamma$ | 0.1 | 1.5 | 2.25 | 3 | 10 |
|------------|-----|-----|------|---|-----|
| Benefit % | 0.00 | 0.08 | 0.16 | 0.27 | 2.51 |

In the realistic band $1.5\le\gamma\le3$, skewness preference is only **8–27 bp/year**—modest relative to alpha and specification risk.

---

## 5. Specifying Returns (Pitfalls of Raw History)

Naive historical scenarios are reckless because:

1. Risk-free rates vary wildly historically; use **current** $i_F$.
2. Historical vols need not be forward vols (use implied, GARCH, views).
3. Historical mean excess returns are extremely noisy: 25 years at 20% vol $\Rightarrow$ SE ≈ 4% for the mean under ideal conditions; 100 years for SE≈1%. A 0.40% mean shift already moves allocations a lot.
4. International samples mix local equity and FX; separate them.

**Proactive model (7):**

$$
r_{n,s}=1+i_F+\mu_n+\sigma_n z_{n,s},
$$

with $z$ standardized (mean 0, var 1), possibly historically shaped but not historically scaled. Build $z$ by stripping risk-free, stripping mean, dividing by realized SD.

**Example universe:** hedged equity regions Eur, Jpn, Ukd, Usa; benchmark 20/30/10/40; monthly history Jan 1978–Dec 1995.

Exhibit 2 vols (inputs): Eur 19.5%, Jpn 22.5%, Ukd 21%, Usa 18%, B 15.63%. All show negative skewness and positive excess kurtosis. Dropping October 1987 cuts benchmark skewness from −1.09 to −0.44 and excess kurtosis from 4.88 to 1.44—one month dominates.

---

## 6. Benchmark-Consistent Unconditional Means (“Nonlinear Grapes from Wine”)

Require: (A.1) $h_B$ feasible; (A.2) know $\mu_B$. Then benchmark returns (8) are known. Optimality of $h_B$ for (P-2) implies a valuation under modified probabilities $\pi^*_s\propto\pi_s U'(r_{s,B})$:

$$
\sum_s\pi^*_s r_{s,n}=\sum_s\pi^*_s r_{s,B}. \tag{9}
$$

Equivalently $\mu_n=\mu_B+\mathrm{Cov}(\rho,r_n-r_B)$ with $\rho_s\propto -U'(r_{s,B})$ (10). This is the nonlinear reverse-engineering that makes the benchmark the no-alpha optimum.

Exhibit 3 (all with $\mu_B=5.50\%$):

| Model | Risk aversion | Eur | Jpn | Ukd | Usa |
|-------|---------------|-----|-----|-----|-----|
| MV $\lambda=2.25$ | 2.25 | 5.46 | 5.78 | 5.56 | 5.28 |
| Scenario $\gamma=2.25$ | 2.25 | 5.67 | 5.59 | 5.79 | 5.27 |
| Scenario $\gamma=0.10$ | 0.10 | 5.50 | 5.51 | 5.51 | 5.49 |
| Scenario $\gamma=10$ | 10 | 10.21 | 0.88 | 10.97 | 5.24 |
| Scenario $\gamma=1.5$ | 1.5 | 5.56 | 5.60 | 5.63 | 5.36 |
| Scenario $\gamma=3$ | 3 | 5.75 | 5.56 | 5.90 | 5.23 |

MV and scenario at comparable aversion give close but not identical $\mu$. Extreme $\gamma=0.1$ needs tiny mean differences to justify benchmark weights; $\gamma=10$ needs huge ones. Reasonable band $\gamma\in[1.5,3]$.

---

## 7. Incorporating Alphas Without Hyperspace Portfolios

Raw alpha addition (P-2*): maximize $\sum\pi_s U[r_{s,P}+\alpha_P]$—typically yields crazy positions because claimed IR is large vs risk aversion.

**Three-step alpha scaling** (mirror of P-1**):

1. Local risk aversion at benchmark: $\hat\lambda=-\sum\pi_s U''(r_{s,B})/\sum\pi_s U'(r_{s,B})$ (11). Example: $\gamma=2.25\Rightarrow\hat\lambda=2.246$.
2. Compute $\mathrm{IR}(\alpha)$.
3. Scale factor $\delta=\hat\lambda\,\hat\omega/\mathrm{IR}(\alpha)$ (12) so scaled alphas have IR $=\hat\lambda\hat\omega$.

Exhibit 4: raw annual alphas Eur/Jpn/Ukd/Usa = −4, +6, +6, −4 (IR=0.821); scaled = −0.33, +0.49, +0.49, −0.33 (IR=0.067). Scaled alphas are **one order of magnitude smaller than the 4% SE of historical means**.

Then solve (P-2**) with $\delta\alpha$. Quadratic approximation (P-2***): $\max\delta\alpha^\top h-(\hat\lambda/2)(h-h_B)^\top\Omega(h-h_B)$ with $\Omega_{nm}=\sum\pi^{**}_s r_{s,n}r_{s,m}$ and $\pi^{**}\propto-\pi U''(r_B)$.

**Exhibit 5 — Active positions for 3% target active risk (%):**

| Problem | Comment | Eur | Jpn | Ukd | Usa | Act. risk |
|---------|---------|-----|-----|-----|-----|-----------|
| P-2* | Unscaled, shorts OK | −179.5 | 85.4 | 219.8 | −125.7 | 37.00 |
| P-2* | Unscaled, no shorts | −20.0 | 16.0 | 44.0 | −40.0 | 7.67 |
| P-2** | Scaled, no shorts | −14.6 | 7.0 | 17.8 | −10.2 | 3.02 |
| P-2*** | Scaled quadratic | −14.6 | 7.0 | 17.8 | −10.2 | 3.03 |
| P-1* | MV scaled | −14.3 | 7.1 | 17.5 | −10.3 | 3.00 |

Insights: unscaled alphas → hyperspace; crude scaling works at 3%; MV and utility nearly agree when inputs controlled; quadratic tracks utility closely.

**Exhibit 6 — 6% desired active risk (hits no-short bound on Eur):**

| Problem | Eur | Jpn | Ukd | Usa | Risk |
|---------|-----|-----|-----|-----|------|
| P-2** | −20.0 | 12.0 | 31.7 | −23.7 | 5.39 |
| P-2*** | −20.0 | 12.0 | 31.9 | −23.9 | 5.42 |
| P-1* | −20.0 | 12.2 | 31.3 | −23.5 | 5.37 |

Actual risk < target because of binding constraints—scale slightly up if needed; large required changes signal overconstraint.

**Cash:** split into cash-vs-benchmark tradeoff (tune so default is e.g. −10% cash / 110% benchmark) plus full-investment no-cash problem. Separately scale benchmark-level alpha $\alpha_B$ and residual $\alpha^*$.

---

## 8. Options: Hidden Near-Arbitrage

Assumptions: options used to express underlying alphas (not to arb option mispricing); benchmark holds no options; options expire at horizon.

Internal valuation (9) vs external Black–Scholes can disagree sharply. One-month ATM-ish call on Japan: BS value \$2.81 vs internal \$2.37—about **20% “mispricing”**, two orders of magnitude larger than scaled alphas (~0.5%).

**Exhibit 7 — Active positions (%):**

| Case | Eur | Jpn | Ukd | Usa | Option |
|------|-----|-----|-----|-----|--------|
| Alphas, no options | −14.59 | 7.00 | 17.79 | −10.20 | 0.00 |
| Alphas, internally valued option | −14.59 | 7.00 | 17.79 | −10.20 | −0.01 |
| No alphas, externally valued option | −20.00 | 70.00 | −6.03 | −38.45 | −5.52 |

With consistent internal valuation, options barely appear—optimization prefers expressing alpha in underlyings. With external valuation and no alphas, the optimizer writes calls and piles into Japan (70% active)—near-arbitrage behavior. Without position limits: 105.71% Japan, −5.71% option notional.

Even a “perfect” alpha option (max of zero and high-alpha Japan+UK minus low-alpha Eur+US averages) is unattractive when valued consistently (\$1.52 no-alpha vs \$1.55 with unscaled alphas)—underlyings duplicate the payoff.

**Exhibit 8 — Distribution moments:**

| Portfolio | E[excess] % | SD % | Skew | ExKurt | Act.risk % |
|-----------|-------------|------|------|--------|------------|
| Benchmark | 5.50 | 15.63 | −1.09 | 4.81 | NA |
| Opt alphas, no opt | 5.77 | 16.09 | −0.96 | 4.06 | 3.03 |
| Opt alphas, int. option | 5.75 | 16.04 | −0.98 | 4.08 | 3.01 |
| Ext. valued option, no alpha | 11.41 | 15.48 | −1.64 | 2.94 | 20.36 |

External option case buys much higher mean and more negative skew at 20% active risk—utility may like it, but it is an artifact of valuation inconsistency.

---

## 9. Summary and Recommendations

Scenario methods can be adapted to: (i) benchmark-consistent unconditional means; (ii) scaled alphas for target active risk; (iii) cash; (iv) options. Key is splitting unconditional vs conditional forecasts and using the no-alpha benchmark baseline.

**When MV and scenarios are aligned, results are close.** Scenarios are harder and invite subtle mistakes. **Default to mean–variance** unless options (or similar) make scenarios necessary—and then value options **internally consistently** with (9).

---

## 10. Quantitative Takeaways

1. Reverse-engineer $\mu=\lambda V h_B$ (MV) or nonlinear (9)–(10) (scenarios).
2. Never feed raw IR≈1 alphas into either engine without scaling to desired $\omega$.
3. Skewness value often <30 bp/yr for moderate risk aversion—rarely worth specification risk.
4. Historical means are too noisy to use as $\mu$; use benchmark-implied means.
5. Options + external pricing = accidental arb; use internal valuation if the goal is alpha expression.
6. Quadratic utility approximation (P-2***) nearly matches full utility when alphas are scaled.
7. Binding long-only cuts delivered active risk below target—diagnose constraints, don’t just add more.

---

## 11. Limitations

- Single-stage only; multistage dangers “out in force.”
- Four-asset allocation example, not security selection.
- Power utility family; claims robustness but doesn’t exhaust alternatives.
- Monthly model; longer horizons widen MV–scenario gaps.
- Ignores importance sampling, semivariance models, kurtosis prediction.
- IR notation in (4) vs (5) requires careful reading (square vs square-root convention).

---

## 12. Bottom Line

Grinold (JPM Winter 1999) is a practitioner’s manual for not shooting yourself with expected-utility optimizers. Benchmark-consistent means plus aggressively scaled alphas make scenario portfolios look like MV portfolios; without those controls, scenarios produce hyperspace weights or option arb. For benchmark-aware institutional management, mean–variance remains the safer default.

---

## Appendix — Exhibit-by-Exhibit Teaching Notes

**Exhibit 1** teaches that higher-moment gains from lognormal vs normal at matched mean/vol are small at institutional risk aversions—undercutting a common sales pitch for scenario engines.

**Exhibit 2** teaches that sample higher moments are fragile (Oct 1987) and that vols should be inputs, not sample slaves.

**Exhibit 3** teaches that reverse-engineered means depend on risk aversion; extreme $\gamma$ produces extreme $\mu$ dispersion needed to rationalize the same $h_B$.

**Exhibit 4** teaches humility about alpha size versus estimation error in means.

**Exhibits 5–6** are the empirical core: scaling works; MV ≈ utility; constraints bind at higher risk targets.

**Exhibits 7–8** are the options warning label: internal vs external valuation is first-order.

---

## Appendix — Formula Card

(P-1) MV; (1) $\mu=\lambda V h_B$; (2) $\mu_B=\lambda\sigma_B^2$; (3) active risk; (4)–(5) IR and $\omega\approx\mathrm{IR}/\lambda$; (P-1*), (P-1**); (P-2) utility; (6) power utility; (7) return model; (8) benchmark return path; (9) internal valuation; (10) cov representation; (11) $\hat\lambda$; (12) $\delta$; (P-2*), (P-2**), (P-2***).

---

## Appendix — Parameter Values Used Throughout

$\mu_B=5.5\%$, $\sigma_B=15.63\%$, $\lambda=2.25$, $\gamma=2.25$, $\hat\lambda=2.246$, benchmark weights 20/30/10/40 Eur/Jpn/Ukd/Usa, sample 1978–1995 monthly, raw IR 0.821, scaled IR 0.067, target active risks 3% and 6%, BS call 2.81 vs internal 2.37.

---

## Archive Note

Grinold, R.C. “Mean-Variance and Scenario-Based Approaches to Portfolio Selection.” *Journal of Portfolio Management* 25(2): 10–22, Winter 1999. Author then at Barclays Global Investors. Scholar batch_2026-09-25_3 summary.

### Additional practitioner checklist

1. Write down $h_B$, $\mu_B$, and risk aversion.
2. Build $V$ or scenario $z$'s with chosen forward vols and current $i_F$.
3. Reverse-engineer $\mu$ so $\alpha=0$ recovers $h_B$.
4. Produce research alphas; compute IR; scale to target $\omega$.
5. Optimize with MV (default) or utility (if options).
6. If options: value with internal $\pi^*$ unless explicitly trading valuation gaps.
7. Compare utility solution to MV and to quadratic approximation; large gaps signal bugs.
8. Stress Oct-1987-like points and binding constraints.

---

## Extended Walkthrough: The Active-Risk vs Benchmark-Risk Tension

Grinold’s diagnosis of the IR–risk-aversion–active-risk triangle is one of the most useful passages in the JPM practitioner literature. Start from three observables managers actually have:

- A benchmark with known volatility $\sigma_B$ and an agreed equity (or policy) risk premium $\mu_B$. Equation (2) then implies a **policy** risk aversion $\lambda=\mu_B/\sigma_B^2$. With 5.5% and 15.63%, $\lambda=2.25$.
- A research process that, optimistically, claims IR near 1.0.
- A risk budget that, conservatively, allows only ~4–5% active risk.

These three cannot be reconciled inside a single-risk-aversion MV problem: IR/$\lambda$ would say $\omega\approx0.44$ (44% active risk!) if IR=1 and $\lambda=2.25$. Either the IR claim is fantasy, the policy $\lambda$ is “too low” for active risk, or active risk is priced differently from benchmark risk. The industry chose the third path: objectives (P-1*)/(P-1**) with a separate active risk aversion $\phi\gg\lambda$, or equivalently shrunk alphas. Grinold’s scenario sections simply import that same discipline into expected-utility land via the scale factor $\delta$.

The deeper cultural point: constraints slapped on after the fact to “fix” hyperspace portfolios treat symptoms. The cause is oversized alphas relative to the risk budget. Shrink the alphas (or raise $\phi$); do not congratulate yourself for binding long-only constraints that happen to save you from your inputs.

---

## Extended Walkthrough: Building Scenario Returns the Grinold Way

Step A — Choose horizon and $i_F$ (known).  
Step B — Choose forward-looking $\sigma_n$ (implied vols, risk models, views)—do **not** blindly use sample SDs.  
Step C — Build standardized residuals $z_{n,s}$ from history by stripping contemporaneous cash, stripping sample means, and dividing by sample SDs (or richer models). Preserve cross-sectional correlation and higher-moment shape in $z$, not in raw returns.  
Step D — Set $\mu_n$ by reverse engineering so that $h_B$ maximizes expected utility when alphas are zero.  
Step E — Only then add research alphas, scaled.

This pipeline prevents the four historical pitfalls. It also clarifies what scenario methods uniquely contribute: the shape of $z$ (skew, kurtosis, crash months). Exhibit 1 says that contribution is often worth only teens of basis points per year for moderate $\gamma$—important calibration for CIOs debating whether to rebuild the entire optimizer stack.

---

## Extended Walkthrough: Options and Internal Valuation

Modified probabilities $\pi^*_s\propto\pi_s U'(r_{s,B})$ are state prices implied by the benchmark’s optimality under $U$. Any payoff $c_s=f(r_s)$ has internal value $\sum\pi^*_s c_s$ (up to discounting conventions already in total returns). Black–Scholes uses a different probability (lognormal risk-neutral) and a different volatility input. The \$2.81 vs \$2.37 gap on the Japan call is not a market opportunity in Grinold’s intended use case—it is a **model disagreement**. Feeding BS prices into an optimizer whose baseline is $\pi^*$ is equivalent to inserting a 20% alpha on the option, dwarfing genuine research alphas. Hence Exhibit 7’s third row: the optimizer “discovers” a huge trade with zero research views.

Policy rule: if the mandate is to express equity alphas, value options with $\pi^*$. If the mandate is to trade option mispricing, that is a different problem with its own alpha pipeline—and should not be mixed accidentally.

---

## Extended Comparison: When Scenarios Still Win

Grinold is not anti-utility. Scenarios remain necessary when:

- Payoffs are nonlinear and cannot be spanned by linear holdings (true exotic options, path-dependent guarantees).
- The objective itself is nonlinear in a way MV cannot proxy (e.g., explicit ruin constraints, asymmetric institutional penalties).
- Communication to boards requires showing full outcome histograms.

Even then, his machinery (benchmark-consistent $\mu$, scaled $\alpha$, internal option valuation) still applies. The paper’s warning is against **naïve** scenario adoption, not against scenarios per se.

---

## Extended Limitations and Scope

Ignored topics (explicitly): number of scenarios needed, semivariance models, importance sampling (Dantzig–Infanger), predicting kurtosis/skewness (Kahn–Stefek), multistage stochastic programs. Monthly tactical horizon vs strategic investment horizon distinguished via sailing metaphor (Newport to Bermuda): strategy sets direction; tactics tack. Longer rebalance intervals widen MV–scenario gaps. Agency critique: institutional managers are agents; textbook expected utility of a terminal beneficiary may be the wrong objective—another reason MV-with-benchmark is pragmatically robust.

---

## Endnotes Worth Carrying

- Technical longer version available from author (endnote 2).  
- $\Omega$ in (P-2***) uses second-derivative weights $\pi^{**}\propto-\pi U''(r_B)$.  
- Separating $\alpha=\alpha_B+\alpha^*$ with $\alpha^{*\top}h_B=0$ allows different scales for market timing vs residual views.  
- BS not strictly appropriate under non-lognormal scenarios; any external model can create similar divergence (endnote 24).

---

## Final Synthesis Paragraph

Grinold (1999) operationalizes a simple doctrine: **control the inputs so the benchmark is the no-information optimum, and shrink information until active risk matches the budget.** Under that doctrine, mean–variance and scenario-based optimizers agree closely on a realistic four-region allocation problem, while unscaled scenarios and externally valued options produce nonsense. The quantitative exhibits—especially 1, 5, and 7—are the enduring teaching tools.

### Supplemental recount of Exhibit 5 positions

Unscaled with shorts: Europe −179%, Japan +85%, UK +220%, US −126%, active risk 37%—a caricature of IR=0.82 meeting $\gamma=2.25$ without a risk budget. Unscaled long-only: Europe −20% (to zero weight given 20% benchmark), Japan +16%, UK +44%, US −40%, active risk 7.67%—still about 2.5× the 3% target. Scaled versions cluster near Europe −14.5%, Japan +7%, UK +17.7%, US −10.2%, active risk ≈3.00–3.03%, whether utility, quadratic, or MV. That three-way agreement is the paper’s constructive result.

### Supplemental recount of Exhibit 5 positions

Unscaled with shorts: Europe −179%, Japan +85%, UK +220%, US −126%, active risk 37%—a caricature of IR=0.82 meeting $\gamma=2.25$ without a risk budget. Unscaled long-only: Europe −20% (to zero weight given 20% benchmark), Japan +16%, UK +44%, US −40%, active risk 7.67%—still about 2.5× the 3% target. Scaled versions cluster near Europe −14.5%, Japan +7%, UK +17.7%, US −10.2%, active risk ≈3.00–3.03%, whether utility, quadratic, or MV. That three-way agreement is the paper’s constructive result.

### Supplemental recount of Exhibit 5 positions

Unscaled with shorts: Europe −179%, Japan +85%, UK +220%, US −126%, active risk 37%—a caricature of IR=0.82 meeting $\gamma=2.25$ without a risk budget. Unscaled long-only: Europe −20% (to zero weight given 20% benchmark), Japan +16%, UK +44%, US −40%, active risk 7.67%—still about 2.5× the 3% target. Scaled versions cluster near Europe −14.5%, Japan +7%, UK +17.7%, US −10.2%, active risk ≈3.00–3.03%, whether utility, quadratic, or MV. That three-way agreement is the paper’s constructive result.

### Supplemental recount of Exhibit 5 positions

Unscaled with shorts: Europe −179%, Japan +85%, UK +220%, US −126%, active risk 37%—a caricature of IR=0.82 meeting $\gamma=2.25$ without a risk budget. Unscaled long-only: Europe −20% (to zero weight given 20% benchmark), Japan +16%, UK +44%, US −40%, active risk 7.67%—still about 2.5× the 3% target. Scaled versions cluster near Europe −14.5%, Japan +7%, UK +17.7%, US −10.2%, active risk ≈3.00–3.03%, whether utility, quadratic, or MV. That three-way agreement is the paper’s constructive result.

### Supplemental recount of Exhibit 5 positions

Unscaled with shorts: Europe −179%, Japan +85%, UK +220%, US −126%, active risk 37%—a caricature of IR=0.82 meeting $\gamma=2.25$ without a risk budget. Unscaled long-only: Europe −20% (to zero weight given 20% benchmark), Japan +16%, UK +44%, US −40%, active risk 7.67%—still about 2.5× the 3% target. Scaled versions cluster near Europe −14.5%, Japan +7%, UK +17.7%, US −10.2%, active risk ≈3.00–3.03%, whether utility, quadratic, or MV. That three-way agreement is the paper’s constructive result.

### Supplemental recount of Exhibit 5 positions

Unscaled with shorts: Europe −179%, Japan +85%, UK +220%, US −126%, active risk 37%—a caricature of IR=0.82 meeting $\gamma=2.25$ without a risk budget. Unscaled long-only: Europe −20% (to zero weight given 20% benchmark), Japan +16%, UK +44%, US −40%, active risk 7.67%—still about 2.5× the 3% target. Scaled versions cluster near Europe −14.5%, Japan +7%, UK +17.7%, US −10.2%, active risk ≈3.00–3.03%, whether utility, quadratic, or MV. That three-way agreement is the paper’s constructive result.

### Supplemental recount of Exhibit 5 positions

Unscaled with shorts: Europe −179%, Japan +85%, UK +220%, US −126%, active risk 37%—a caricature of IR=0.82 meeting $\gamma=2.25$ without a risk budget. Unscaled long-only: Europe −20% (to zero weight given 20% benchmark), Japan +16%, UK +44%, US −40%, active risk 7.67%—still about 2.5× the 3% target. Scaled versions cluster near Europe −14.5%, Japan +7%, UK +17.7%, US −10.2%, active risk ≈3.00–3.03%, whether utility, quadratic, or MV. That three-way agreement is the paper’s constructive result.
