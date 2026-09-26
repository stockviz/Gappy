# Book-to-Market Equity, Distress Risk, and Stock Returns
**Authors:** John M. Griffin, Michael L. Lemmon
**Year:** 2002
**Journal/Venue:** Journal of Finance

## Problem statement

If the book-to-market premium is really a distress premium, it should be strongest precisely where distress risk is highest. Griffin and Lemmon test that claim directly. They ask whether the `BE/ME` effect is amplified among firms with high financial distress, and whether the pattern looks like rational compensation for risk or like mispricing.

## Approach (short)

The paper uses Ohlson's `O-score` as the distress proxy, sorts firms independently by:

- `BE/ME`,
- `O-score`,
- size,

and studies subsequent annual buy-and-hold returns, three-factor alphas, earnings-announcement reversals, and analyst-coverage interactions. The main finding is that the high-minus-low `BE/ME` spread is largest in the highest `O-score` quintile, and that the especially low returns of low-`BE/ME`, high-`O-score` firms look more like overpricing than like risk compensation.

## Approach (detailed)

### 1. Measure distress with Ohlson's bankruptcy score

The distress proxy is Ohlson's `O-score`, defined from accounting ratios and indicator variables. In the paper it takes the form

$$
O\text{-score}=
-1.32
-0.407 \log(\text{TA})
+6.03\frac{\text{TL}}{\text{TA}}
-1.43\frac{\text{WC}}{\text{TA}}
+0.076\frac{\text{CL}}{\text{CA}}
-1.72 \mathbf{1}(\text{TL}>\text{TA})
-2.37\frac{\text{NI}}{\text{TA}}
-1.83\frac{\text{FFO}}{\text{TL}}
+0.285 \mathbf{1}(\text{loss in last two years})
-0.521\frac{\Delta NI}{|NI_t|+|NI_{t-1}|}.
$$

The point is not the exact coefficients by themselves, but that the paper uses a pre-existing bankruptcy-likelihood measure rather than inventing a new distress proxy around the result.

### 2. Form independent sorts on value, distress, and size

Each June, firms are independently ranked into:

- three `BE/ME` groups using 30th and 70th percentiles,
- five `O-score` quintiles,
- two size groups.

Returns are then computed from July of year `t` to June of year `t+1`. The paper often reports size-adjusted averages formed from the large and small size buckets.

### 3. Ask whether `BE/ME` spreads widen with distress

The first test is a direct interaction test:

1. hold distress quintile fixed;
2. compare high versus low `BE/ME` returns;
3. see whether that spread gets larger as `O-score` rises.

It does. The value premium is dramatically larger in the highest-distress quintile than in the others.

### 4. Examine the strange corner of the sort: low `BE/ME`, high `O-score`

The paper's most important diagnostic is that low-`BE/ME` firms within the highest `O-score` quintile earn extremely low returns, despite having:

- high factor loadings,
- weak profitability,
- high leverage,
- and a high probability of delisting.

That is awkward for a clean distress-risk story. If these firms are the riskiest, they should not be the worst earners.

### 5. Test the three-factor explanation directly

The paper estimates time-series regressions for the sorted portfolios and checks whether the Fama-French three-factor model prices them. It does not. The low-`BE/ME`, high-`O-score` portfolios have large negative intercepts, and the high-minus-low `BE/ME` spread among high-distress firms remains too large to be dismissed as loading differences.

### 6. Use earnings-announcement returns as a mispricing diagnostic

To distinguish risk from expectational error, the paper examines abnormal returns around the four quarterly earnings announcements after formation. For each firm, the abnormal return is measured over `t=-1` to `t=+1` around the announcement relative to a benchmark portfolio matched on size decile and medium `BE/ME`.

If the low returns of low-`BE/ME`, high-`O-score` firms reflect overly optimistic expectations, those firms should experience negative earnings-announcement reversals later. That is exactly what the paper finds. The difference in earnings-announcement abnormal returns between high- and low-`BE/ME` is largest in the highest-distress quintile.

### 7. Add analyst coverage and size

The paper then shows that the effect is strongest in:

- small firms,
- low analyst coverage firms.

Those are classic information-friction environments. This pushes the interpretation toward mispricing rather than rational distress compensation alone.

### 8. What a reader should implement

To reproduce the paper:

1. compute `BE/ME` and Ohlson `O-score` each June;
2. form `3 x 5 x 2` independent sorts on `BE/ME`, distress, and size;
3. calculate annual buy-and-hold and size-adjusted returns;
4. estimate three-factor regressions for the sorted portfolios;
5. compute `[-1,+1]` earnings-announcement abnormal returns over the following year;
6. repeat the tests conditioning on size and analyst coverage.

The paper's core empirical object is the interaction: `BE/ME` matters most where distress is highest, but the weakest corner is low-`BE/ME` high-distress, which looks overpriced.

## Domain of applicability

- **Where it works well:** Distinguishing between risk and mispricing explanations for the value premium.
- **What is implementable:** O-score/`BE/ME` interaction sorts, factor-alpha diagnostics, and post-formation earnings-announcement reversal tests.
- **Main limitation:** O-score is itself an accounting composite and can be noisy for some firms.
- **Why the paper matters:** It shows that "distress risk explains value" is at best incomplete and that the worst anomaly sits exactly where overpricing is plausible.
