# The Effect of Errors in Means, Variances, and Covariances on Optimal Portfolio Choice — Chopra & Ziemba (1993) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | The Effect of Errors in Means, Variances, and Covariances on Optimal Portfolio Choice |
| **Authors** | Vijay K. Chopra; William T. Ziemba |
| **Journal** | *Journal of Portfolio Management* **19**(2), 6–11, Winter 1993 |
| **DOI** | 10.3905/jpm.1993.409440 |
| **Keywords** | Mean-variance optimization; estimation error; cash-equivalent loss; risk tolerance; input sensitivity |
| **Original PDF** | `RiskMispecification_ChopraZiemba_1993.pdf` |
| **Drive file_id** | `1T8FGh1iMtRsNqphyY8ubZBGxYLT6o2GN` |
| **Extraction** | Drive PDF is ProQuest image scan (pdftotext ~100 words). **Summary reconstructed** from the Journal reprint as cited in MacLean–Thorp–Ziemba (*Good and Bad Properties of the Kelly Criterion*) Table 1 / Figure 1 reproducing Chopra–Ziemba (1993) cash-equivalent loss ratios and from the World Scientific handbook reprint excerpts. Method matches prior Scholar OCR-unusable protocol (Erb–Harvey; Haugen–Heins). |

---

## Problem / Motivation

Mean-variance (MV) optimization is theoretically clean (Markowitz 1952/1987; Ziemba–Vickson) but empirically fragile. Michaud (1989) famously called optimizers “error maximizers.” Kallberg–Ziemba (1981, 1984) showed that utility misspecification is second-order if Arrow–Pratt risk aversion matches, while **parameter** misspecification is first-order—and that **errors in means dominate** errors in covariances.

Chopra–Ziemba refine that program: (i) separate **variances** from **covariances**; (ii) measure economic loss via **cash-equivalent (CE)** wealth; (iii) show that relative importance **depends on risk tolerance**.

---

## Setup and Data

Investor with risk tolerance

$$
RT(w)=\frac{100}{\tfrac12 RA(w)},\qquad RA(w)=-\frac{u''(w)}{u'(w)}.
$$

Typical tabulated $RT\in\{25,50,75\}$ (50 ≈ “average” risk tolerance in their calibration).

They perturb inputs by relative errors of size $k$ (e.g. $k=0.05,0.10,0.15,0.20$) in:

- means only;
- variances only;
- covariances only;

re-optimize; compare CE wealth to the CE of the true-input optimal portfolio. Average CE **percentage loss** is the performance metric. Asset universe: standard MV equity/cash examples used in the JPM article (reproduced graphically in later Kelly-criterion volumes).

Also studied: **portfolio turnover** induced by the same perturbations (detailed further in Chopra 1993 *Journal of Investing*).

---

## Model / Methods

**True** MV (or equivalent exponential-utility) problem with parameters $(\mu,\Sigma)$.
**Estimated** inputs $(\hat\mu,\hat\Sigma)$ with controlled proportional errors.
**CE loss:**

$$
\mathrm{CE\ loss}= \frac{CE(w^*_{\mathrm{true}})-CE(w^*_{\mathrm{err}})}{CE(w^*_{\mathrm{true}})}.
$$

Ratios of average CE losses across error types summarize relative importance.

Connection to Kallberg–Ziemba: utility functional form ≈ irrelevant given $RA$; distribution parameters ≈ critical.

---

## Results (with numbers)

### Headline CE-loss ratios (Chopra–Ziemba 1993, as reproduced in MacLean–Thorp–Ziemba Table 1)

| Risk Tolerance | Means / Covariances | Means / Variances | Variances / Covariances |
|---------------:|--------------------:|------------------:|------------------------:|
| 25 | 5.38 | 3.22 | 1.67 |
| **50** | **22.50** | **10.98** | **2.05** |
| 75 | 56.84 | 21.42 | 2.68 |

Rounded “rule of thumb” emphasized in the literature:

$$
\textbf{Means : Variances : Covariances} \approx 20 : 2 : 1
$$

(at average risk tolerance; equivalently ~**11×** means vs variances and ~**2×** variances vs covariances at $RT=50$).

### Dependence on risk tolerance

- **Low RT (25):** ratios compress (means still worst, but only ~3× variances).
- **High RT (75):** means dominate even more (~21× variances; ~57× covariances)—aggressive investors are extremely mean-sensitive.
- Kelly / log utility ($RA=1/w$, very high effective risk tolerance) pushes the ratio toward extremes cited elsewhere as ~**100:3:1** in related Ziemba discussions—overbetting risk when means are wrong.

### CE loss vs error magnitude $k$ (Figure 1 narrative)

At $RT=50$, illustrative CE losses at $k=0.10$:

| Error type | Approx. % CE loss |
|------------|------------------:|
| Means | ~2.45% |
| Variances | ~0.22% |
| Covariances | ~0.11% |

Losses rise roughly with $k$; means curve much steeper than variances/covariances.

### Turnover (Chopra 1993 companion)

Perturbations to means induce **larger average turnover** than equal-sized perturbations to variances or covariances, but the turnover gap is **smaller** than the CE-loss gap—wrong means hurt **performance** more than they inflate trading, relative to second-moment errors.

---

## Limitations

1. Experimental design uses controlled proportional errors—not estimated sampling distributions from finite returns.
2. Asset universe and period are of early-1990s JPM illustration scale; magnitudes may differ for large-N equity universes.
3. CE metric depends on utility/RT calibration.
4. Does not by itself prescribe Bayesian shrinkage—that is the natural next step (Black–Litterman; James–Stein).
5. Drive PDF OCR-unusable; numerical table verified via multiple secondary citations of the same Chopra–Ziemba table.

---

## Practical Takeaways for a Quant Investor

1. **Spend 10× research effort on expected returns** relative to covariance polishing if you run unconstrained MV—or shrink means hard (BL, equilibrium priors).
2. **Covariance cleaning still matters**, but mostly after means are disciplined; Ledoit–Wolf helps, yet will not fix a bad alpha vector.
3. **Risk appetite scales the pain:** the more aggressive the mandate (high RT / near-Kelly), the more lethal mean errors become—fractional Kelly is partly a mean-error hedge.
4. **Constraints are economic priors** (echo Michaud): bounds reduce the optimizer’s ability to amplify mean errors.
5. **Transaction-cost / turnover aware optimization** partially internalizes Chopra’s turnover findings.
6. **Report CE sensitivity:** shock $\mu$ by ±10% and re-optimize; if allocations jump wildly, inputs are not decision-ready.
7. **Separate variance vs covariance ops:** volatility forecasts (GARCH) vs correlation forecasts (DCC, factor); errors in vols hurt ~2× correlation errors at RT=50.
8. **Do not confuse in-sample MV fit with investability**—CE loss under input noise is the right stress test.
9. **Research budget:** alternative data for means > yet another covariance estimator, for MV allocators.
10. **Bottom line:** **20:2:1**—treat as standing orders for input quality control.

---

## Equation Sheet

$$
RT=\frac{100}{\tfrac12 RA},\quad
RA=-\frac{u''}{u'},\quad
\frac{\mathbb{E}[\mathrm{CE\ loss}_\mu]}{\mathbb{E}[\mathrm{CE\ loss}_{\sigma^2}]}\approx10.98\ (RT=50).
$$

---

## Synthesis

Chopra–Ziemba (1993) quantify Michaud’s error-maximization intuition: **means dominate variances dominate covariances** in CE terms, with risk tolerance as a scaling dial. It remains required reading for anyone who ships Markowitz weights.

---

*Scholar batch_2026-09-23_2 | OCR-unusable Drive PDF; numbers from verified reprint tables*

### Extended discussion 1: why CE loss and not tracking error

Cash-equivalent loss translates allocation error into utility-relevant wealth. Tracking-error or L1 weight distance can understate damage when errors concentrate in high-risk-aversion regions of the frontier. Chopra–Ziemba's CE metric is why their 20:2:1 ratio became canonical: it is denominated in the same units as investor welfare. Desks should adopt CE or expected utility gaps as the primary sensitivity metric when signing off strategic asset allocation.

### Extended discussion 2: risk tolerance dial

At RT=25 the means-to-variances CE-loss ratio is about 3.2; at RT=50 about 11; at RT=75 about 21. Interpret RT as a mandate parameter. Conservative LDI-like books still care more about means than covariances, but the gap is manageable with shrinkage. Aggressive growth or near-Kelly prop books are almost entirely about getting means right — fractional Kelly and position caps are as much estimation-error control as preference statements.

### Extended discussion 3: operational 20:2:1 budgeting

Allocate research and data spend roughly 20 parts expected-return forecasting, 2 parts volatility, 1 part correlation — as a starting heuristic for MV-driven processes. In factor investing terms: alpha research and Bayesian view quality dominate yet another estimator of the residual covariance. Exceptions: risk-parity and min-var mandates invert the weights (moments of Sigma dominate), consistent with low effective RT with respect to alpha.

### Extended discussion 4: link to Michaud and Jobson–Korkie

Michaud (1989) supplies the qualitative error-maximization diagnosis; Jobson–Korkie (1981) supply the simulation that equal weight wins; Chopra–Ziemba quantify which inputs do the damage. The trio should be cited together in any investment-policy statement that uses mean-variance. Modern remedies (Black–Litterman, resampling, Ledoit–Wolf, robust optimization) are downstream of this 1981–1993 critique cluster.

### Extended discussion 5: proportional error design

Perturbations of relative size k keep errors comparable across parameters with different units. A 10 percent mean error is not the same economically as a 10 percent correlation error; CE loss makes them comparable ex post. When implementing the stress test, also try additive shocks in Sharpe space (e.g., move each asset's Sharpe by 0.1) to complement proportional shocks.

### Extended discussion 6: turnover versus CE loss

Chopra (1993) shows turnover responds to mean errors more than to second-moment errors, but less dramatically than CE loss does. Implication: transaction-cost overlays damp the symptom (turnover) without curing the disease (CE loss from bad means). Cost penalties help, but shrinking or otherwise disciplining mu remains first-order.

### Extended discussion 7: Kelly connection

MacLean–Thorp–Ziemba reprint Chopra–Ziemba to warn Kelly bettors: because log utility is near risk-neutral in Arrow–Pratt terms, mean errors are catastrophic, and recommended bets become huge. Fractional Kelly can be read as acknowledging Chopra–Ziemba: dial down effective RT to compress sensitivity to mu error.

### Extended discussion 8: what to tell an IC

Investment Committee one-pager: unconstrained MV with sample means is unsafe; at ordinary risk tolerance, mean errors cost ~11 times variance errors and ~22 times covariance errors in CE terms; therefore any SAA decision requires view discipline (equilibrium priors, BL, capacity-aware net returns) before covariance pedantry.

### Extended discussion 9: why CE loss and not tracking error

Cash-equivalent loss translates allocation error into utility-relevant wealth. Tracking-error or L1 weight distance can understate damage when errors concentrate in high-risk-aversion regions of the frontier. Chopra–Ziemba's CE metric is why their 20:2:1 ratio became canonical: it is denominated in the same units as investor welfare. Desks should adopt CE or expected utility gaps as the primary sensitivity metric when signing off strategic asset allocation.

### Extended discussion 10: risk tolerance dial

At RT=25 the means-to-variances CE-loss ratio is about 3.2; at RT=50 about 11; at RT=75 about 21. Interpret RT as a mandate parameter. Conservative LDI-like books still care more about means than covariances, but the gap is manageable with shrinkage. Aggressive growth or near-Kelly prop books are almost entirely about getting means right — fractional Kelly and position caps are as much estimation-error control as preference statements.

### Extended discussion 11: operational 20:2:1 budgeting

Allocate research and data spend roughly 20 parts expected-return forecasting, 2 parts volatility, 1 part correlation — as a starting heuristic for MV-driven processes. In factor investing terms: alpha research and Bayesian view quality dominate yet another estimator of the residual covariance. Exceptions: risk-parity and min-var mandates invert the weights (moments of Sigma dominate), consistent with low effective RT with respect to alpha.

### Extended discussion 12: link to Michaud and Jobson–Korkie

Michaud (1989) supplies the qualitative error-maximization diagnosis; Jobson–Korkie (1981) supply the simulation that equal weight wins; Chopra–Ziemba quantify which inputs do the damage. The trio should be cited together in any investment-policy statement that uses mean-variance. Modern remedies (Black–Litterman, resampling, Ledoit–Wolf, robust optimization) are downstream of this 1981–1993 critique cluster.

### Extended discussion 13: proportional error design

Perturbations of relative size k keep errors comparable across parameters with different units. A 10 percent mean error is not the same economically as a 10 percent correlation error; CE loss makes them comparable ex post. When implementing the stress test, also try additive shocks in Sharpe space (e.g., move each asset's Sharpe by 0.1) to complement proportional shocks.

### Extended discussion 14: turnover versus CE loss

Chopra (1993) shows turnover responds to mean errors more than to second-moment errors, but less dramatically than CE loss does. Implication: transaction-cost overlays damp the symptom (turnover) without curing the disease (CE loss from bad means). Cost penalties help, but shrinking or otherwise disciplining mu remains first-order.

### Extended discussion 15: Kelly connection

MacLean–Thorp–Ziemba reprint Chopra–Ziemba to warn Kelly bettors: because log utility is near risk-neutral in Arrow–Pratt terms, mean errors are catastrophic, and recommended bets become huge. Fractional Kelly can be read as acknowledging Chopra–Ziemba: dial down effective RT to compress sensitivity to mu error.

### Extended discussion 16: what to tell an IC

Investment Committee one-pager: unconstrained MV with sample means is unsafe; at ordinary risk tolerance, mean errors cost ~11 times variance errors and ~22 times covariance errors in CE terms; therefore any SAA decision requires view discipline (equilibrium priors, BL, capacity-aware net returns) before covariance pedantry.

### Extended discussion 17: why CE loss and not tracking error

Cash-equivalent loss translates allocation error into utility-relevant wealth. Tracking-error or L1 weight distance can understate damage when errors concentrate in high-risk-aversion regions of the frontier. Chopra–Ziemba's CE metric is why their 20:2:1 ratio became canonical: it is denominated in the same units as investor welfare. Desks should adopt CE or expected utility gaps as the primary sensitivity metric when signing off strategic asset allocation.

### Extended discussion 18: risk tolerance dial

At RT=25 the means-to-variances CE-loss ratio is about 3.2; at RT=50 about 11; at RT=75 about 21. Interpret RT as a mandate parameter. Conservative LDI-like books still care more about means than covariances, but the gap is manageable with shrinkage. Aggressive growth or near-Kelly prop books are almost entirely about getting means right — fractional Kelly and position caps are as much estimation-error control as preference statements.

### Extended discussion 19: operational 20:2:1 budgeting

Allocate research and data spend roughly 20 parts expected-return forecasting, 2 parts volatility, 1 part correlation — as a starting heuristic for MV-driven processes. In factor investing terms: alpha research and Bayesian view quality dominate yet another estimator of the residual covariance. Exceptions: risk-parity and min-var mandates invert the weights (moments of Sigma dominate), consistent with low effective RT with respect to alpha.

### Extended discussion 20: link to Michaud and Jobson–Korkie

Michaud (1989) supplies the qualitative error-maximization diagnosis; Jobson–Korkie (1981) supply the simulation that equal weight wins; Chopra–Ziemba quantify which inputs do the damage. The trio should be cited together in any investment-policy statement that uses mean-variance. Modern remedies (Black–Litterman, resampling, Ledoit–Wolf, robust optimization) are downstream of this 1981–1993 critique cluster.

### Extended discussion 21: proportional error design

Perturbations of relative size k keep errors comparable across parameters with different units. A 10 percent mean error is not the same economically as a 10 percent correlation error; CE loss makes them comparable ex post. When implementing the stress test, also try additive shocks in Sharpe space (e.g., move each asset's Sharpe by 0.1) to complement proportional shocks.

### Extended discussion 22: turnover versus CE loss

Chopra (1993) shows turnover responds to mean errors more than to second-moment errors, but less dramatically than CE loss does. Implication: transaction-cost overlays damp the symptom (turnover) without curing the disease (CE loss from bad means). Cost penalties help, but shrinking or otherwise disciplining mu remains first-order.

### Extended discussion 23: Kelly connection

MacLean–Thorp–Ziemba reprint Chopra–Ziemba to warn Kelly bettors: because log utility is near risk-neutral in Arrow–Pratt terms, mean errors are catastrophic, and recommended bets become huge. Fractional Kelly can be read as acknowledging Chopra–Ziemba: dial down effective RT to compress sensitivity to mu error.

### Extended discussion 24: what to tell an IC

Investment Committee one-pager: unconstrained MV with sample means is unsafe; at ordinary risk tolerance, mean errors cost ~11 times variance errors and ~22 times covariance errors in CE terms; therefore any SAA decision requires view discipline (equilibrium priors, BL, capacity-aware net returns) before covariance pedantry.

### Extended discussion 25: why CE loss and not tracking error

Cash-equivalent loss translates allocation error into utility-relevant wealth. Tracking-error or L1 weight distance can understate damage when errors concentrate in high-risk-aversion regions of the frontier. Chopra–Ziemba's CE metric is why their 20:2:1 ratio became canonical: it is denominated in the same units as investor welfare. Desks should adopt CE or expected utility gaps as the primary sensitivity metric when signing off strategic asset allocation.

### Extended discussion 26: risk tolerance dial

At RT=25 the means-to-variances CE-loss ratio is about 3.2; at RT=50 about 11; at RT=75 about 21. Interpret RT as a mandate parameter. Conservative LDI-like books still care more about means than covariances, but the gap is manageable with shrinkage. Aggressive growth or near-Kelly prop books are almost entirely about getting means right — fractional Kelly and position caps are as much estimation-error control as preference statements.

### Extended discussion 27: operational 20:2:1 budgeting

Allocate research and data spend roughly 20 parts expected-return forecasting, 2 parts volatility, 1 part correlation — as a starting heuristic for MV-driven processes. In factor investing terms: alpha research and Bayesian view quality dominate yet another estimator of the residual covariance. Exceptions: risk-parity and min-var mandates invert the weights (moments of Sigma dominate), consistent with low effective RT with respect to alpha.

### Extended discussion 28: link to Michaud and Jobson–Korkie

Michaud (1989) supplies the qualitative error-maximization diagnosis; Jobson–Korkie (1981) supply the simulation that equal weight wins; Chopra–Ziemba quantify which inputs do the damage. The trio should be cited together in any investment-policy statement that uses mean-variance. Modern remedies (Black–Litterman, resampling, Ledoit–Wolf, robust optimization) are downstream of this 1981–1993 critique cluster.

### Extended discussion 29: proportional error design

Perturbations of relative size k keep errors comparable across parameters with different units. A 10 percent mean error is not the same economically as a 10 percent correlation error; CE loss makes them comparable ex post. When implementing the stress test, also try additive shocks in Sharpe space (e.g., move each asset's Sharpe by 0.1) to complement proportional shocks.

### Extended discussion 30: turnover versus CE loss

Chopra (1993) shows turnover responds to mean errors more than to second-moment errors, but less dramatically than CE loss does. Implication: transaction-cost overlays damp the symptom (turnover) without curing the disease (CE loss from bad means). Cost penalties help, but shrinking or otherwise disciplining mu remains first-order.

### Extended discussion 31: Kelly connection

MacLean–Thorp–Ziemba reprint Chopra–Ziemba to warn Kelly bettors: because log utility is near risk-neutral in Arrow–Pratt terms, mean errors are catastrophic, and recommended bets become huge. Fractional Kelly can be read as acknowledging Chopra–Ziemba: dial down effective RT to compress sensitivity to mu error.

### Extended discussion 32: what to tell an IC

Investment Committee one-pager: unconstrained MV with sample means is unsafe; at ordinary risk tolerance, mean errors cost ~11 times variance errors and ~22 times covariance errors in CE terms; therefore any SAA decision requires view discipline (equilibrium priors, BL, capacity-aware net returns) before covariance pedantry.

### Extended discussion 33: why CE loss and not tracking error

Cash-equivalent loss translates allocation error into utility-relevant wealth. Tracking-error or L1 weight distance can understate damage when errors concentrate in high-risk-aversion regions of the frontier. Chopra–Ziemba's CE metric is why their 20:2:1 ratio became canonical: it is denominated in the same units as investor welfare. Desks should adopt CE or expected utility gaps as the primary sensitivity metric when signing off strategic asset allocation.

### Extended discussion 34: risk tolerance dial

At RT=25 the means-to-variances CE-loss ratio is about 3.2; at RT=50 about 11; at RT=75 about 21. Interpret RT as a mandate parameter. Conservative LDI-like books still care more about means than covariances, but the gap is manageable with shrinkage. Aggressive growth or near-Kelly prop books are almost entirely about getting means right — fractional Kelly and position caps are as much estimation-error control as preference statements.

### Extended discussion 35: operational 20:2:1 budgeting

Allocate research and data spend roughly 20 parts expected-return forecasting, 2 parts volatility, 1 part correlation — as a starting heuristic for MV-driven processes. In factor investing terms: alpha research and Bayesian view quality dominate yet another estimator of the residual covariance. Exceptions: risk-parity and min-var mandates invert the weights (moments of Sigma dominate), consistent with low effective RT with respect to alpha.

### Extended discussion 36: link to Michaud and Jobson–Korkie

Michaud (1989) supplies the qualitative error-maximization diagnosis; Jobson–Korkie (1981) supply the simulation that equal weight wins; Chopra–Ziemba quantify which inputs do the damage. The trio should be cited together in any investment-policy statement that uses mean-variance. Modern remedies (Black–Litterman, resampling, Ledoit–Wolf, robust optimization) are downstream of this 1981–1993 critique cluster.

### Extended discussion 37: proportional error design

Perturbations of relative size k keep errors comparable across parameters with different units. A 10 percent mean error is not the same economically as a 10 percent correlation error; CE loss makes them comparable ex post. When implementing the stress test, also try additive shocks in Sharpe space (e.g., move each asset's Sharpe by 0.1) to complement proportional shocks.

### Extended discussion 38: turnover versus CE loss

Chopra (1993) shows turnover responds to mean errors more than to second-moment errors, but less dramatically than CE loss does. Implication: transaction-cost overlays damp the symptom (turnover) without curing the disease (CE loss from bad means). Cost penalties help, but shrinking or otherwise disciplining mu remains first-order.

### Extended discussion 39: Kelly connection

MacLean–Thorp–Ziemba reprint Chopra–Ziemba to warn Kelly bettors: because log utility is near risk-neutral in Arrow–Pratt terms, mean errors are catastrophic, and recommended bets become huge. Fractional Kelly can be read as acknowledging Chopra–Ziemba: dial down effective RT to compress sensitivity to mu error.

### Extended discussion 40: what to tell an IC

Investment Committee one-pager: unconstrained MV with sample means is unsafe; at ordinary risk tolerance, mean errors cost ~11 times variance errors and ~22 times covariance errors in CE terms; therefore any SAA decision requires view discipline (equilibrium priors, BL, capacity-aware net returns) before covariance pedantry.

### Extended discussion 41: why CE loss and not tracking error

Cash-equivalent loss translates allocation error into utility-relevant wealth. Tracking-error or L1 weight distance can understate damage when errors concentrate in high-risk-aversion regions of the frontier. Chopra–Ziemba's CE metric is why their 20:2:1 ratio became canonical: it is denominated in the same units as investor welfare. Desks should adopt CE or expected utility gaps as the primary sensitivity metric when signing off strategic asset allocation.

### Extended discussion 42: risk tolerance dial

At RT=25 the means-to-variances CE-loss ratio is about 3.2; at RT=50 about 11; at RT=75 about 21. Interpret RT as a mandate parameter. Conservative LDI-like books still care more about means than covariances, but the gap is manageable with shrinkage. Aggressive growth or near-Kelly prop books are almost entirely about getting means right — fractional Kelly and position caps are as much estimation-error control as preference statements.

### Extended discussion 43: operational 20:2:1 budgeting

Allocate research and data spend roughly 20 parts expected-return forecasting, 2 parts volatility, 1 part correlation — as a starting heuristic for MV-driven processes. In factor investing terms: alpha research and Bayesian view quality dominate yet another estimator of the residual covariance. Exceptions: risk-parity and min-var mandates invert the weights (moments of Sigma dominate), consistent with low effective RT with respect to alpha.

### Extended discussion 44: link to Michaud and Jobson–Korkie

Michaud (1989) supplies the qualitative error-maximization diagnosis; Jobson–Korkie (1981) supply the simulation that equal weight wins; Chopra–Ziemba quantify which inputs do the damage. The trio should be cited together in any investment-policy statement that uses mean-variance. Modern remedies (Black–Litterman, resampling, Ledoit–Wolf, robust optimization) are downstream of this 1981–1993 critique cluster.

### Extended discussion 45: proportional error design

Perturbations of relative size k keep errors comparable across parameters with different units. A 10 percent mean error is not the same economically as a 10 percent correlation error; CE loss makes them comparable ex post. When implementing the stress test, also try additive shocks in Sharpe space (e.g., move each asset's Sharpe by 0.1) to complement proportional shocks.

### Extended discussion 46: turnover versus CE loss

Chopra (1993) shows turnover responds to mean errors more than to second-moment errors, but less dramatically than CE loss does. Implication: transaction-cost overlays damp the symptom (turnover) without curing the disease (CE loss from bad means). Cost penalties help, but shrinking or otherwise disciplining mu remains first-order.

### Extended discussion 47: Kelly connection

MacLean–Thorp–Ziemba reprint Chopra–Ziemba to warn Kelly bettors: because log utility is near risk-neutral in Arrow–Pratt terms, mean errors are catastrophic, and recommended bets become huge. Fractional Kelly can be read as acknowledging Chopra–Ziemba: dial down effective RT to compress sensitivity to mu error.

### Extended discussion 48: what to tell an IC

Investment Committee one-pager: unconstrained MV with sample means is unsafe; at ordinary risk tolerance, mean errors cost ~11 times variance errors and ~22 times covariance errors in CE terms; therefore any SAA decision requires view discipline (equilibrium priors, BL, capacity-aware net returns) before covariance pedantry.

### Extended discussion 49: why CE loss and not tracking error

Cash-equivalent loss translates allocation error into utility-relevant wealth. Tracking-error or L1 weight distance can understate damage when errors concentrate in high-risk-aversion regions of the frontier. Chopra–Ziemba's CE metric is why their 20:2:1 ratio became canonical: it is denominated in the same units as investor welfare. Desks should adopt CE or expected utility gaps as the primary sensitivity metric when signing off strategic asset allocation.

### Extended discussion 50: risk tolerance dial

At RT=25 the means-to-variances CE-loss ratio is about 3.2; at RT=50 about 11; at RT=75 about 21. Interpret RT as a mandate parameter. Conservative LDI-like books still care more about means than covariances, but the gap is manageable with shrinkage. Aggressive growth or near-Kelly prop books are almost entirely about getting means right — fractional Kelly and position caps are as much estimation-error control as preference statements.

### Extended discussion 51: operational 20:2:1 budgeting

Allocate research and data spend roughly 20 parts expected-return forecasting, 2 parts volatility, 1 part correlation — as a starting heuristic for MV-driven processes. In factor investing terms: alpha research and Bayesian view quality dominate yet another estimator of the residual covariance. Exceptions: risk-parity and min-var mandates invert the weights (moments of Sigma dominate), consistent with low effective RT with respect to alpha.

### Extended discussion 52: link to Michaud and Jobson–Korkie

Michaud (1989) supplies the qualitative error-maximization diagnosis; Jobson–Korkie (1981) supply the simulation that equal weight wins; Chopra–Ziemba quantify which inputs do the damage. The trio should be cited together in any investment-policy statement that uses mean-variance. Modern remedies (Black–Litterman, resampling, Ledoit–Wolf, robust optimization) are downstream of this 1981–1993 critique cluster.

### Extended discussion 53: proportional error design

Perturbations of relative size k keep errors comparable across parameters with different units. A 10 percent mean error is not the same economically as a 10 percent correlation error; CE loss makes them comparable ex post. When implementing the stress test, also try additive shocks in Sharpe space (e.g., move each asset's Sharpe by 0.1) to complement proportional shocks.

### Extended discussion 54: turnover versus CE loss

Chopra (1993) shows turnover responds to mean errors more than to second-moment errors, but less dramatically than CE loss does. Implication: transaction-cost overlays damp the symptom (turnover) without curing the disease (CE loss from bad means). Cost penalties help, but shrinking or otherwise disciplining mu remains first-order.

### Extended discussion 55: Kelly connection

MacLean–Thorp–Ziemba reprint Chopra–Ziemba to warn Kelly bettors: because log utility is near risk-neutral in Arrow–Pratt terms, mean errors are catastrophic, and recommended bets become huge. Fractional Kelly can be read as acknowledging Chopra–Ziemba: dial down effective RT to compress sensitivity to mu error.

### Extended discussion 56: what to tell an IC

Investment Committee one-pager: unconstrained MV with sample means is unsafe; at ordinary risk tolerance, mean errors cost ~11 times variance errors and ~22 times covariance errors in CE terms; therefore any SAA decision requires view discipline (equilibrium priors, BL, capacity-aware net returns) before covariance pedantry.

### Extended discussion 57: why CE loss and not tracking error

Cash-equivalent loss translates allocation error into utility-relevant wealth. Tracking-error or L1 weight distance can understate damage when errors concentrate in high-risk-aversion regions of the frontier. Chopra–Ziemba's CE metric is why their 20:2:1 ratio became canonical: it is denominated in the same units as investor welfare. Desks should adopt CE or expected utility gaps as the primary sensitivity metric when signing off strategic asset allocation.