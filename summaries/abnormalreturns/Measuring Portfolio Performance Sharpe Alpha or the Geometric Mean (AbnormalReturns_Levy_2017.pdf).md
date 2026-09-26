# Measuring Portfolio Performance: Sharpe, Alpha, or the Geometric Mean? — Detailed Quantitative Research Notes

## Bibliographic Header
| Field | Detail |
|------|--------|
| Title | Measuring Portfolio Performance: Sharpe, Alpha, or the Geometric Mean? |
| Author | Moshe Levy (Jerusalem School of Business, Hebrew University) |
| Outlet | *Journal of Investment Management*, Vol. 15, No. 3 (2017), pp. 1–17 |
| Original PDF | `AbnormalReturns_Levy_2017.pdf` |
| Drive file_id | `1BgivK6TduMOLmtAeHTe469nHgoTCY5LM` |
| Sample | CRSP Survivor-Bias-Free Mutual Fund Database; all U.S. domestic equity funds with complete monthly returns July 2005–June 2015; $N=10{,}145$ funds (analysis uses $10{,}019$ with $x^*>0$) |
| Hedge-fund robustness | Thomson-Reuters U.S. hedge funds, same window, complete monthly records |
| Factors / RF | Fama–French 5-factor returns and RF lending rate from Ken French library |
| Borrowing setup | Reg T max leverage $x\le 2$; base case $R^L_f=0.82\%$ annualized equivalent and $R^B_f=4.32\%$ (350 bps spread); robustness over spread and leverage caps |
| Core claim | Under realistic borrowing constraints the Sharpe ratio and FF5 alpha are poorly aligned with expected utility; the geometric mean (GM) is far better aligned and horizon-invariant under i.i.d. returns |

## Problem / Motivation
Sharpe (1966, 1994) proved that if returns are normal and unlimited borrowing/lending at a single risk-free rate is available, ranking funds by the Sharpe ratio is perfectly aligned with expected utility for all risk-averse (and, later, all monotone) investors: Fund A dominates Fund B for every such investor iff $\mathrm{Sharpe}_A>\mathrm{Sharpe}_B$. That uniqueness result made Sharpe the default academic and practitioner ranking. Morningstar star ratings are highly correlated with Sharpe (Sharpe 1998).

Two CAPM-era assumptions fail systematically in practice:
1. **Borrowing rate $\neq$ lending rate.** Saunders–Schumacher (2000) report ~4.2% U.S. bank interest margins (1995). U.S. prime was ~3.5% in Jan 2016 with deposit rates near zero. Aggregate broker margin debt is typically $<10\%$ of customer assets and $<2.5\%$ at major brokers (Fortune 2000); investors who do borrow often stay near 50% of Reg T capacity.
2. **Reg T / hard leverage caps.** Federal Reserve Regulation T caps borrowing at 100% of initial capital ($x\le 2$).

Markowitz (2005) shows graphically that with a kinked capital-market line (higher borrowing rate + leverage cap), a lower-Sharpe fund with higher mean can dominate a high-Sharpe, low-vol fund that would require hundreds of percent leverage to match mean at equal volatility. Alpha (Jensen 1968; multi-factor extensions) is even less appropriate for **fund selection**: it guides infinitesimal weight adjustments relative to a benchmark, not discrete choice among funds (Levy–Roll 2015).

Horizon dependence is a further Sharpe pathology (Levy 1972; Levhari–Levy 1977): monthly Sharpe rankings need not match $H$-period Sharpe rankings even under unlimited borrowing.

**Candidate alternative: geometric mean.**
$$
\mathrm{GM}=\prod_{i=1}^{N} R_i^{p_i},\qquad \mathrm{GM}\approx \mu-\frac{\sigma^2}{2}
$$
(Young–Trent 1969; Markowitz 2012). GM coincides with expected utility for log (Bernoulli) investors, so the max-GM fund is always in the SSD-efficient set (Levy 2015). Higher-order expansions make GM increasing in skewness. Under i.i.d. returns, $\mathrm{GM}_{H\text{-period}}=(\mathrm{GM}_{1\text{-period}})^H$, so ranking is horizon-invariant—unlike Sharpe.

## Setup / Data
**Mutual funds.** All U.S. domestic equity funds in CRSP Survivor-Bias-Free MF Database with complete monthly returns July 2005–June 2015: 10,145 funds. Empirical distribution: equal probability $p_i=1/120$ on each of 120 historical monthly total returns. Selection bias from requiring complete records is immaterial—results nearly identical when incomplete-record funds are included.

**Median monthly moments (Table 1).**
| | Mutual funds | Hedge funds |
|--|-------------:|------------:|
| Mean | 0.59% | 0.49% |
| Std. | 4.32% | 4.38% |
| Skewness | −0.75 | −0.57 |
| Kurtosis | 5.33 | 5.34 |
| Jarque–Bera reject normality @1% | 90.6% | 91.9% |
| @5% | 97.1% | 97.2% |
| @10% | 98.2% | 98.5% |

Non-normality is nearly universal, yet (as Levy–Markowitz 1979; Kroll–Levy–Markowitz 1984; Simaan 1993 emphasize) this alone need not destroy Sharpe’s usefulness when leverage is unlimited.

**Investor problem.** For utility $U$ and initial wealth $W_0$,
$$
EU(x)=\sum_{i=1}^{N} p_i\, U\!\left[W_0\big(x R_i+(1-x)R_f\big)\right],
$$
choose $x^*$ to maximize $EU(x)$. Realistic RF schedule:
$$
R_f=\begin{cases}R^L_f & x\le 1\ \text{(lending)}\\ R^B_f & x>1\ \text{(borrowing)}\end{cases},\quad R^B_f>R^L_f,\quad x\le 2.
$$
Base case annual rates over the sample: $R^L_f=0.82\%$, $R^B_f=4.32\%$ (350 bps spread). Sharpe uses the **lending** rate in the numerator (market practice). Alpha = FF5 alpha on monthly returns. GM as above.

**Preferences examined (Table 2).** CRRA $U(W)=W^{1-\alpha}/(1-\alpha)$ for $\alpha\in\{0.5,1.0,1.5,2.0,2.5\}$; generalized CRRA $U(W)=(W+A)^{1-\alpha}/(1-\alpha)$ with $\alpha=1.5$, $A\in\{0.5,1,2\}$; negative exponential $U=-e^{-bW}$ with $W_0=1$, $b\in\{0.01,0.1,1\}$. Relevant empirical $\alpha$ range ~1–2 (Arrow; Tobin–Dolde; Friend–Blume; Kydland–Prescott).

**Evaluation metrics.**
1. Spearman rank-correlation between $EU(x^*)$ and the candidate performance measure across all funds.
2. Probability of **wrong choice**: draw 1,000 random menus of 10 funds; investor picks max of Sharpe / alpha / GM; fraction where that pick $\neq$ true $EU$ maximizer.
3. Average **annual certainty-equivalent loss** on those wrong choices: solve $U(CE)=EU(x^*)$ for chosen vs optimal fund; annualize as $CE_B^{12}-CE_A^{12}$ (Endnote 9).

Only funds with $x^*>0$ enter (10,019 of 10,145)—i.e., mean exceeding lending RF (Arrow 1971). Random menus make differences larger than pre-screened industry menus, so criticism of Sharpe is conservative.

## Model / Methods with Formulas
**Unlimited-borrowing benchmark.** Same $R_f$ for borrow/lend, no cap on $x$. Under normality Sharpe is theoretically optimal. Empirically (CRRA $\alpha=1.5$): Spearman(Sharpe, $EU$)=**0.998**. Wrong-choice rate on 10-fund menus: **7.7%**; annual CE loss: **0.04%**. Non-normality barely hurts when leverage is free—consistent with Levy–Markowitz (1979) et al.

**Realistic borrowing.** Cap $x\le 2$ and $R^B_f-R^L_f=3.5\%$ annual. Same CRRA $\alpha=1.5$:
| Measure | Spearman | Wrong choice (10 funds) | Ann. CE loss |
|---------|---------:|------------------------:|-------------:|
| Sharpe | **0.372** | **82.5%** | **4.22%** |
| FF5 alpha | **0.188** | **69.8%** | **2.61%** |
| Geometric mean | **0.974** | **18.0%** | **0.15%** |

With 100-fund menus, Sharpe wrong-choice rate rises to **98%** and annual CE loss to **9.24%**. GM’s CE loss is ~28× smaller than Sharpe’s and ~17× smaller than alpha’s at the 10-fund menu.

**Hedge funds (Figure 6).** Same realistic borrowing, CRRA $\alpha=1.5$: Spearman Sharpe 0.36; FF5 alpha 0.42; GM **0.96**. Pattern replicates.

**Mean–variance geometry (Figure 7).** Top-10 Sharpe funds (hollow circles) vs top-10 GM funds (stars) on the $\mu$–$\sigma$ plane: Sharpe ranking is more sensitive to $\sigma$ in the denominator; GM more sensitive to $\mu$. Levering top-Sharpe funds onto the capital line above top-GM funds would require **hundreds of percent** leverage—ruled out under Reg T. Hence GM funds dominate for constrained investors.

**Decomposing constraints (Figure 8).**
- **Panel A (spread only, no hard cap):** Spearman(Sharpe, $EU$) falls monotonically in $R^B_f-R^L_f$, leveling near ~0.4. Spearman(GM, $EU$) **rises** in the spread. Crossover: GM beats Sharpe once the annual borrow–lend spread exceeds **~1.6%**. Alpha always inferior to Sharpe.
- **Panel B (hard leverage cap only, equal rates):** Spearman(Sharpe, $EU$) deteriorates as the max borrowable fraction of capital falls. Crossover: GM preferred when max borrowing $<\sim 120\%$ of capital (Reg T is 100%). Combined constraints amplify GM’s advantage.

**Risk-aversion gradient (Figure 9).** As CRRA $\alpha$ rises, optimal leverage on the max-Sharpe fund falls (parentheses: average optimal leverage at $\alpha=0.5,1,1.5,2,2.5$), so Sharpe’s CE loss shrinks—but GM remains superior over the entire empirically relevant $\alpha$ range.

**Negative exponential (Figure 10, $b=0.1$).** Spearman(Sharpe, $EU$)=**0.086**; Spearman(GM, $EU$)=**0.969**.

### Table 2 — Full Preference Sweep (Realistic Borrowing)
| Preference | Sharpe $\rho$ | Wrong% | CE loss% | Alpha $\rho$ | Wrong% | CE loss% | GM $\rho$ | Wrong% | CE loss% |
|------------|----------------:|-------:|---------:|---------------:|-------:|---------:|-----------:|-------:|---------:|
| CRRA $\alpha=0.5$ | 0.173 | 88.5 | 8.65 | 0.034 | 74.2 | 5.64 | **0.995** | 0.7 | 0.00 |
| CRRA $\alpha=1.0$ | 0.279 | 82.9 | 5.79 | 0.116 | 73.3 | 3.87 | **0.992** | 20.2 | 0.11 |
| CRRA $\alpha=1.5$ | 0.372 | 82.5 | 4.22 | 0.188 | 69.8 | 2.61 | **0.974** | 18.0 | 0.15 |
| CRRA $\alpha=2.0$ | 0.479 | 80.3 | 3.07 | 0.273 | 68.1 | 2.00 | **0.934** | 23.4 | 0.18 |
| CRRA $\alpha=2.5$ | 0.586 | 78.6 | 2.36 | 0.365 | 67.4 | 1.54 | **0.873** | 34.2 | 0.26 |
| Gen. CRRA $A=0.5$ | 0.429 | 79.7 | 3.58 | 0.286 | 65.4 | 2.31 | **0.969** | 19.6 | 0.15 |
| Gen. CRRA $A=1$ | 0.344 | 79.6 | 4.52 | 0.225 | 67.2 | 2.99 | **0.989** | 20.3 | 0.13 |
| Gen. CRRA $A=2$ | 0.277 | 82.3 | 6.35 | 0.176 | 67.0 | 4.20 | **0.995** | 11.9 | 0.07 |
| NegExp $b=0.01$ | 0.058 | 89.6 | 11.29 | 0.056 | 71.8 | 7.01 | **0.957** | 19.2 | 0.23 |
| NegExp $b=0.1$ | 0.086 | 88.5 | 10.73 | 0.068 | 69.7 | 7.11 | **0.969** | 15.2 | 0.13 |
| NegExp $b=1$ | 0.302 | 82.9 | 5.71 | 0.195 | 66.7 | 3.55 | **0.993** | 16.3 | 0.13 |

Across **every** preference and **every** metric (correlation, wrong-choice rate, CE loss), GM dominates Sharpe and alpha.

## Investment Horizon
Even under unlimited borrowing at equal rates, monthly vs 10-year Sharpe rankings diverge (Figure 11): bootstrap 1,000 paths of 120 monthly draws (with replacement) per fund to form 10-year Sharpes; scatter vs monthly Sharpe shows substantial reordering. Under i.i.d. returns,
$$
\log(\mathrm{GM}_{H})=H\cdot\mathbb{E}[\log R]=H\cdot\log(\mathrm{GM}_1)\implies \mathrm{GM}_H=(\mathrm{GM}_1)^H,
$$
so one-period GM ranking is horizon-invariant. That is a structural advantage for multi-horizon clients (pensions, endowments, RIAs with heterogeneous horizons) who cannot recompute Sharpe at every client $H$.

**Stochastic-dominance safeguard.** Sharpe can violate FSD: Fund A returns $\{16\%,20\%\}$ eq. prob., Fund B $\{20\%,40\%\}$, $r_f=0$: $\mathrm{Sharpe}_A=9>\mathrm{Sharpe}_B=3$, yet B FSD-dominates A. GM ranks correctly (17.98% vs 29.61%). Goetzmann–Ingersoll–Spiegel–Welch (2007) related manipulation issues also bite Sharpe more than GM.

## Limitations
- **Ex-post distributions treated as known.** Estimation error affects all three measures; paper does not claim GM is more robust to estimation error, only that conditional on a distribution it better matches EU.
- **Complete-record selection.** Survivorship / completeness bias exists but results are robust to including incomplete funds.
- **Single-period CRRA / NegExp / GenCRRA.** No dynamic multiperiod consumption–portfolio problem; no habit, ambiguity, or loss aversion beyond the cited PT robustness of Sharpe under unlimited leverage.
- **Borrowing schedule stylized.** Single step-function borrow rate; reality has margin calls, portfolio-level haircuts, and fund-level leverage constraints (40-Act).
- **Alpha definition.** FF5 alpha on monthly returns; other factor models (q-factor, mispricing factors) not explored—but alpha’s theoretical role as a *marginal* weight nudge already limits its fund-selection usefulness.
- **Horizon i.i.d. assumption** for GM invariance; serial correlation / regime shifts can break exact invariance (though Sharpe remains horizon-dependent even under i.i.d.).

## Practical Takeaways for a Quant Investor
1. **Stop using Sharpe as the primary fund-selection score when clients cannot (or will not) lever at the T-bill rate.** With any plausible broker margin spread $\gtrsim 1.6\%$ or Reg T-like caps, Sharpe’s Spearman with EU collapses to ~0.2–0.5 and wrong-choice rates exceed 80% on 10-fund menus, with multi-percent annual CE losses.
2. **Alpha is worse for selection.** Spearman often $<0.3$; use alpha only for *incremental* active weight tilts vs a benchmark, never as a menu-ranking statistic (Levy–Roll 2015).
3. **Report and optimize geometric mean (or $\mu-\sigma^2/2$) as the headline performance number** for constrained investors. Spearman with EU stays $\gtrsim 0.87$ across preferences; CE losses typically $<0.3\%$ annual.
4. **Compensation / objective functions for PMs:** if the investor base is Reg-T constrained (retail, many RIAs, risk-parity with leverage caps), writing PM bonuses to Sharpe or IR can systematically push the book toward low-vol, levered-looking strategies that clients cannot actually lever—destroying client EU. GM (or growth-optimal / Kelly-adjacent objectives with risk overlays) better aligns incentives.
5. **Horizon hygiene:** if you must keep Sharpe, compute it at the client’s holding-period return frequency; monthly Sharpe for a 10-year endowment mandate is theoretically mis-specified. GM sidesteps this under i.i.d.
6. **Implementation:** for monthly return series $\{R_t\}_{t=1}^{T}$, $\mathrm{GM}=(\prod R_t)^{1/T}-1$ (or $\exp(\overline{\log R})-1$). Pair with drawdown / CVaR constraints; GM alone is growth-optimal and can be aggressive for high $\alpha$ CRRA clients—but Table 2 shows it still dominates Sharpe even at $\alpha=2.5$.
7. **Low-vol anomaly connection:** Figure 7’s geometry is the micro-foundation for why “high Sharpe / low vol” products sold to unlevered investors underperform what a CAPM textbook promises—the client cannot climb the CML. Haugen–Heins (1972/1975) and the subsequent low-risk literature are the cross-sectional cousins of this point.

## Quantitative Bottom Line
Under the CAPM textbook borrowing assumptions, Sharpe is near-perfect (Spearman 0.998, CE loss 0.04%). Under Reg T + 350 bps borrow–lend spread—the empirically relevant case—Sharpe Spearman collapses to 0.372, wrong-choice rate 82.5%, CE loss 4.22% (CRRA 1.5, 10-fund menus). FF5 alpha is worse (Spearman 0.188). Geometric mean retains Spearman 0.974, wrong-choice 18%, CE loss 0.15%. The pattern is robust across CRRA, generalized CRRA, negative exponential, mutual funds, and hedge funds. For a quant building ranking, allocation, or PM-incentive systems for leverage-constrained principals, **GM — not Sharpe or alpha — is the performance statistic that matches the objective.**


## Extended Discussion of Preference Classes and Economic Magnitudes

The paper’s central empirical object is not a single t-statistic but a **decision-error surface**: for each preference class, how often does a popular ranking statistic pick the wrong fund from a realistic menu, and how large is the certainty-equivalent damage? Table 2 is therefore the paper’s “alpha table.” Reading it as a quant PM compensation designer:

- At low risk aversion ($\alpha=0.5$), Sharpe is catastrophic: Spearman 0.173, wrong-choice 88.5%, CE loss **8.65% annual**. This is the region where optimal leverage on max-Sharpe funds is highest (Figure 9 parentheses), so the CML-leverage fantasy is most tempting and most false under Reg T.
- At $\alpha=1$ (log-adjacent), Sharpe wrong-choice is still 82.9% with 5.79% CE loss; GM wrong-choice 20.2% with 0.11% CE loss.
- At $\alpha=1.5$ (Friend–Blume / Kydland–Prescott central case), the headline numbers apply: Sharpe 82.5%/4.22% vs GM 18%/0.15%.
- At $\alpha=2.5$ (high risk aversion), Sharpe improves (Spearman 0.586, CE loss 2.36%) because optimal leverage shrinks, but GM still wins on correlation (0.873) and especially on CE loss (0.26%).

Negative-exponential investors with low absolute risk aversion $b=0.01$ or $0.1$ are even more poorly served by Sharpe (Spearman 0.058–0.086; CE losses **10.7–11.3%**). These are the “aggressive” absolute-risk-aversion calibrations. GM holds Spearman $\ge 0.957$ and CE loss $\le 0.23\%$.

Generalized CRRA with subsistence/background wealth $A>0$ (Litzenberger–Rubinstein 1976; Kroll et al. 1984; Samuelson 1989) tilts even more toward GM: at $A=2$, GM Spearman is **0.995** with wrong-choice only 11.9% and CE loss 0.07%.

### Why Alpha Fails Even Worse Than Sharpe

Alpha’s Spearman with $EU$ never exceeds 0.365 in Table 2 and is often $<0.2$. Two structural reasons:

1. **Marginal vs discrete.** Jensen alpha and its multi-factor descendants answer: “If I already hold the benchmark, should I put an infinitesimal long (short) in this fund?” Fund selection asks: “Which single fund (or small menu) should absorb my entire risky budget?” These are different optimization problems; the first-order condition for the second is not alpha (Levy–Roll 2015).
2. **Benchmark sensitivity.** Roll (1978) shows SML-based ranking flips with the benchmark. FF5 alpha inherits that fragility. GM needs no benchmark.

Empirically, on 10-fund menus alpha’s wrong-choice rate is 65–74% across preferences—better than Sharpe’s 78–90% only because alpha is less anti-correlated with mean, not because it is a good selector. CE losses remain 1.5–7%.

### Geometric Mean Approximation and Skewness

The second-order expansion
$$
\mathrm{GM}\approx\mu-\frac{\sigma^2}{2}
$$
places max-GM funds near the mean–variance frontier. The third-order term involves skewness positively for standard preferences, so GM does not punish positive skew the way variance-based ratios can. This matters in the mutual-fund sample where median skewness is −0.75 (left-tail risk): GM still ranks in a way that matches CRRA/NegExp EU because those preferences also penalize left tails via the full distribution, not via a variance proxy alone.

Kelly (1956), Latane (1959), and Markowitz (1976) argued for GM on long-run almost-sure dominance grounds. Samuelson (1971) and Merton–Samuelson (1974) countered that only log utility ($\alpha=1$) exactly maximizes EU via GM. Levy’s contribution is empirical and finite-horizon: even when $\alpha\neq 1$ and $H$ is not infinite, GM remains a **much better approximate ranking** than Sharpe once leverage is constrained. The theoretical debate about asymptotic Kelly is largely beside the point for Reg-T investors.

### Horizon Simulation Design

Figure 11’s 10-year Sharpe is constructed by: for each fund, draw 120 monthly returns with replacement from the empirical monthly distribution, compound to a 10-year total return; repeat 1,000 times; compute Sharpe of the simulated 10-year return distribution; scatter against the monthly Sharpe. The cloud is wide: many high-monthly-Sharpe funds have mediocre 10-year Sharpes and vice versa. This is not estimation error—it is the mathematical fact that Sharpe is not invariant to temporal aggregation even under i.i.d. Compounding interacts with the mean–variance tradeoff nonlinearly. GM’s exact power scaling under i.i.d. eliminates that inconsistency.

### Connection to Portfolio Construction Practice

For a multi-strategy platform allocating risk budget across PMs:
- If PMs are scored on Sharpe/IR and clients are unlevered or soft-levered, the platform will systematically overweight low-vol, high-Sharpe sleeves that look good in risk reports but destroy client CE relative to higher-mean sleeves the client would have preferred under their true leverage constraint.
- Replacing the score with GM (or $\mu-\sigma^2/2$ with an explicit leverage penalty matching the client’s borrow curve) realigns PM incentives with client EU.
- For levered vehicles (risk-parity funds, CITs with internal repo), Sharpe remains closer to optimal **inside the vehicle**—but the vehicle’s own share class should still be sold to end clients on GM/CE terms.

### Numerical Recipe for Implementation

Given monthly total returns $R_1,\ldots,R_T$ (as decimals, e.g. 1.01):
$$
\mathrm{GM}_{\mathrm{month}}=\exp\Big(\frac{1}{T}\sum_t\log R_t\Big),\qquad
\mathrm{GM}_{\mathrm{ann}}=\mathrm{GM}_{\mathrm{month}}^{12}-1.
$$
Compare funds by $\mathrm{GM}_{\mathrm{ann}}$. Optionally report $\widehat{\mathrm{GM}}\approx 12\mu_m-6\sigma_m^2$ as a quick screen (annualized). For menus, pick max GM subject to liquidity, capacity, and operational constraints—not max Sharpe.

Certainty-equivalent loss calculation used in the paper (CRRA):
$$
CE=\big[(1-\alpha)\,EU\big]^{1/(1-\alpha)}\quad(\alpha\neq 1),\qquad
CE=\exp(EU)\quad(\alpha=1),
$$
with $W_0=1$, then annualize $CE_{\mathrm{opt}}^{12}-CE_{\mathrm{chosen}}^{12}$.

### Summary Verdict for Quants
Levy (2017) is a clean, decision-theoretic repudiation of Sharpe-as-default under realistic financing. The magnitudes are large enough (multi-percent annual CE) that ignoring them is a first-order governance error for any allocator whose principals face broker margin or Reg-T-like constraints. Geometric mean—or an explicit utility-based ranking—should replace Sharpe on fund menus, PM scorecards, and client reports whenever leverage at the T-bill rate is not literally available.


## Replication Checklist for a Quant Desk
1. Pull CRSP MF monthly total returns for a 10-year window; keep funds with $\ge 120$ months.
2. Pull FF5 + RF from French library; set $R^L_f$ to sample mean RF; set $R^B_f=R^L_f+0.035/12$ monthly.
3. For each fund, evaluate $EU(x)$ on a grid $x\in[0,2]$ with the piecewise RF; store $EU^*$.
4. Compute Sharpe $(\bar R-R^L_f)/\sigma$, FF5 $\alpha$, and GM.
5. Spearman-rank $EU^*$ vs each metric; bootstrap 10-fund menus for wrong-choice and CE loss.
6. Stress: vary spread $\{0,100,160,250,350,500\}$ bps and leverage caps $\{\infty,3,2,1.5,1\}$.
7. Report: if your clients’ effective spread $\ge 160$ bps or cap $\le 120\%$, replace Sharpe with GM in production rankings.

## Additional Theoretical Remarks
Unlimited-borrowing Sharpe optimality extends beyond risk aversion to all investors who prefer more to less, including Prospect Theory investors (Levy–Levy 2004; Levy–De Giorgi–Hens 2012). That extension makes Sharpe’s theoretical pedigree even stronger—and makes the empirical collapse under constrained borrowing even more consequential. The theory is not “wrong”; its domain of applicability excludes the typical retail and advisory client.

Manipulation-proofness (Goetzmann–Ingersoll–Spiegel–Welch 2007) is another reason to prefer GM-like measures: dynamic trading can inflate Sharpe without improving terminal wealth distributions in an SSD sense. GM of the buy-and-hold fund return distribution is harder to game without actually improving compounded growth.

## Closing Synthesis
Across mutual funds, hedge funds, CRRA, generalized CRRA, and negative exponential preferences, with and without hard leverage caps, with borrow–lend spreads from 0 to several hundred bps, the geometric mean dominates Sharpe and FF5 alpha as a fund-selection statistic whenever investors cannot freely lever at the lending rate. The economic stakes are measured in annual certainty-equivalent points, not basis points of tracking error. For Giuseppe Paleologo-style quant practice—precise, decision-theoretic, hostile to hand-waving—this paper argues that the industry’s default performance number is the wrong number for the clients who actually use it.



## Full Preference-by-Preference Narrative

### CRRA family
Relative risk aversion $\alpha$ indexes how painful leverage is. At $\alpha=0.5$ the investor *wants* to lever high-Sharpe funds aggressively; Reg T and the borrow–lend spread frustrate that desire, so ranking by Sharpe (which assumes free leverage) is almost orthogonal to attainable EU (Spearman 0.173). GM, which rewards raw compounded growth without assuming leverage, matches EU almost perfectly (0.995). As $\alpha$ rises toward 2.5, desired leverage falls, Sharpe’s Spearman climbs to 0.586, but GM remains ahead and CE losses under Sharpe stay above 2% annual — still first-order for an allocator.

### Generalized CRRA
Background wealth $A$ makes the investor behave as if richer, often amplifying risk-taking on the margin. GM’s dominance widens (Spearman 0.969–0.995). This class matters for households with housing/human-capital background wealth who still face margin constraints on their brokerage sleeve.

### Negative exponential
CARA with low $b$ is extremely aggressive in absolute dollar risk; Sharpe Spearman collapses to 0.058–0.086 and CE losses exceed **10% annual**. These are the investors for whom selling a high-Sharpe low-mean fund as “optimal” is most damaging. GM Spearman stays ≥0.957.

## Worked Numerical Example (Illustrative)
Suppose Fund S: monthly mean 0.4%, σ 2.0% → Sharpe vs RF 0.82% ann. ≈ (0.4−0.068)/2 ≈ 0.166 monthly Sharpe.
Fund G: monthly mean 0.9%, σ 5.0% → lower Sharpe.
Under unlimited lending-rate leverage, lever Fund S by ~2.5× to match Fund G’s σ and beat its mean. Under Reg T (max 2×) and borrowing at 4.32% ann., the levered-S path pays a high borrow rate and cannot reach the unconstrained CML point; EU(CRRA 1.5) prefers Fund G. GM ranks G above S; Sharpe ranks S above G. This is Figure 1 / Figure 7 in miniature.

## Desk Policy Language (Copy-Ready)
“Performance ranking for client-facing fund menus will use geometric mean of total returns over the evaluation window as the primary statistic. Sharpe ratio and multi-factor alpha will be reported as secondary risk-adjusted diagnostics but will not determine menu order unless the vehicle permits client leverage at rates within 100 bps of the T-bill rate. PM incentive compensation for vehicles distributed to Reg-T-constrained investors will include a GM or CE component with at least equal weight to IR/Sharpe.”

## Connection to Kelly / Growth Optimal Literature
Kelly (1956), Latane (1959), Markowitz (1976) recommended GM for long-run wealth. Samuelson (1971), Merton–Samuelson (1974) showed only log utility exactly optimizes via GM. Levy’s results say: for the *ranking* problem under leverage constraints, GM is an excellent approximate sufficient statistic even when $\alpha\neq 1$ and $H$ is finite. That narrows the debate from “is Kelly optimal?” to “is GM a better ranker than Sharpe for constrained agents?” — an easier, empirical question this paper answers affirmatively.

## Additional Robustness the Reader Should Run
- Replace FF5 alpha with FF3, CAPM, or q-factor alpha — expect similarly low Spearman with EU.
- Use overlapping 36-month windows instead of full 120-month empirical distribution.
- Impose a higher borrow spread (5–6%) matching retail margin cards.
- Restrict to institutional share classes only.
- Bootstrap standard errors on the Spearman differences GM−Sharpe.

## Bottom-Line Checklist
| Question | Answer |
|----------|--------|
| Is Sharpe optimal under textbook CAPM assumptions? | Yes (Spearman 0.998) |
| Do those assumptions hold for typical clients? | No |
| Cost of using Sharpe anyway (CRRA 1.5, 10-fund menu)? | 82.5% wrong picks, 4.22% ann. CE |
| Cost of using FF5 alpha? | 69.8% wrong, 2.61% CE |
| Cost of using GM? | 18% wrong, 0.15% CE |
| Horizon-invariant? | GM yes (i.i.d.); Sharpe no |
| Recommendation | **GM as primary ranking statistic** |


## Extended Implementation Playbook

### Computing GM in production
For monthly total returns R_t (e.g. 1.0123):
GM_month = exp(mean(log(R_t)))
GM_ann = GM_month**12 - 1
Report GM_ann alongside Sharpe and alpha; sort menus by GM_ann.

### Certainty-equivalent reporting
For a stated CRRA α (default 1.5), compute EU at optimal x* under the client’s borrow curve; invert to CE; show CE_ann. Ranking by CE is ideal when preferences are known; GM approximates CE ranking when preferences are unknown but leverage is constrained.

### Governance language
Investment Policy Statements should state whether the beneficiary can lever at near-RF rates. If not, the IPS should name GM (or CE) as the primary performance statistic and demote Sharpe to a risk diagnostic.

### Numerical anchors
Unlimited borrow: Spearman(Sharpe,EU)=0.998; wrong 7.7%; CE loss 0.04%.
Realistic: Spearman Sharpe 0.372 / alpha 0.188 / GM 0.974; wrong 82.5% / 69.8% / 18%; CE loss 4.22% / 2.61% / 0.15%.
Crossover spread ~160 bps; crossover leverage cap ~120% of capital.
N funds = 10,145 (10,019 with x*>0); July 2005–June 2015; RF lend 0.82%, borrow 4.32%.

### Synthesis
Sharpe is the right answer to a question most clients cannot ask (unconstrained CML). GM is the right answer to the question they actually face.
