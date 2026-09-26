# Dynamic Factor Models — Stock & Watson (2010) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Dynamic Factor Models |
| **Authors** | James H. Stock (Harvard University & NBER); Mark W. Watson (Princeton University & NBER) |
| **Venue** | *Oxford Handbook of Economic Forecasting*, Clements & Hendry (eds), Oxford University Press |
| **Date** | January 2010 |
| **Type** | Survey / handbook chapter |
| **JEL / themes** | Dynamic factor models, principal components, Bai–Ng criteria, FAVAR, nowcasting, approximate factor structure |
| **Original PDF** | `DynamicFactorModels_StockWatson2010.PDF` |
| **Drive file id** | `0B-6kBz0I0dMsbVdQZE5oQ3RGbzA` |
| **Extraction** | `pdftotext` on Drive PDF (~9,709 words); text usable |

Prepared with thanks to Jushan Bai and Serena Ng; research assistance by Ugo Troiano. Complementary surveys: Bai & Ng (2008) (theory-heavy); Stock & Watson (2006a,b) (many-predictor forecasting).

---

## Problem / Motivation

Macroeconometricians confront data that are **short in time** ($T$ often 20–40 years of quarterly observations) but **wide in cross section** ($N$ in the hundreds or thousands of related macro, financial, and sectoral series). Unrestricted VARs cannot absorb this width: parameter counts scale with $N^2$.

**Dynamic factor models (DFMs)** posit that a few latent dynamic factors $f_t$ drive comovements of $X_t$, with idiosyncratic $e_t$ capturing measurement error and series-specific shocks (e.g., a Salmonella scare hitting restaurant employment). The foundational empirical claim—Sargent & Sims (1977), confirmed by Giannone, Reichlin & Sala (2004) and Watson (2004)—is that **two (or a few) dynamic factors explain a large fraction of the variance of major US quarterly macro aggregates** (output, employment, prices).

If factors were known and shocks Gaussian, the population MSE-optimal one-step forecast of series $i$ depends only on lagged factors and own lags—**forecast dimension does not grow with $N$**. The survey maps the theory and practice needed to estimate factors, choose their number, and use them in forecasting, IV, FAVARs, and DSGE estimation.

---

## Canonical Model

### Dynamic form

$$
X_t = \lambda(L) f_t + e_t \tag{1}
$$
$$
f_t = \Psi(L) f_{t-1} + \eta_t \tag{2}
$$

- $X_t,e_t\in\mathbb{R}^N$; $f_t,\eta_t\in\mathbb{R}^q$; $\lambda(L)$ is $N\times q$; $\Psi(L)$ is $q\times q$.
- $\lambda_i(L)f_t$: common component of series $i$.
- Stationarity assumed in the core exposition.
- $Ee_t\eta_{t-k}'=0$ all $k$.
- **Exact DFM:** $Ee_{it}e_{js}=0$ for $i\neq j$, all $s$.
- **Approximate DFM:** limited cross-sectional dependence of idiosyncratics.

### Efficient forecast collapse

$$
E[X_{i,t+1}\mid X_t,f_t,\ldots]=\alpha(L)f_t+\delta(L)X_{it}. \tag{3}
$$

### Static (state-space) form

Stack $F_t=(f_t',\ldots,f_{t-p}')'$ ($r\times 1$), $\Lambda=(\lambda_0,\ldots,\lambda_p)$:
$$
X_t=\Lambda F_t+e_t \tag{4}
$$
$$
\Phi(L)F_t=G\eta_t \tag{5}
$$
$$
d_i(L)e_{it}=\zeta_{it},\quad i=1,\ldots,N \tag{6}
$$
with Gaussian $\zeta_{it},\eta_{jt}$ independent across $i,j$ in the parametric case. Here $r\ge q$: static factors include lags of dynamic factors.

**Preprocessing:** difference out unit roots/trends; standardize (typical $X_{it}$: growth rate of a real-activity indicator, mean 0, SD 1). Intercepts suppressed in the write-up.

---

## Factor Estimation: Three Generations

### Generation 1 — Time-domain MLE + Kalman filter

Engle & Watson (1981, 1983), Stock & Watson (1989), Sargent (1989), Quah & Sargent (1993): write (4)–(6) as linear Gaussian state space; maximize likelihood; filter/smooth $F_t$.

**Pros:** statistically efficient under correct specification; **mixed frequency and missing data** handled by changing the row dimension of the measurement equation (Harvey 1989, p. 325).
**Applications highlighted:** Angelini, Bańbura & Rünstler (2008) monthly distribution of Euro-area GDP; Aruoba, Diebold & Scotti (2009) weekly activity index (1 weekly + 4 monthly + 1 quarterly series, single dynamic factor).
**Cons:** parameters $\propto N$; historical computational burden limited $N$. EM helps but does not remove the dimensionality problem.

### Generation 2 — Nonparametric cross-sectional averaging (PC / GPC)

**Why averaging works.** Weighted averages of idiosyncratics vanish by WLLN if factors are pervasive, leaving span($F_t$).

Approximate factor conditions (Chamberlain–Rothschild style):
$$
N^{-1}\Lambda'\Lambda\to D_\Lambda\quad(D_\Lambda\text{ full rank}) \tag{7}
$$
$$
\operatorname{maxeval}(\Sigma_e)\le c<\infty\quad\forall N \tag{8}
$$

For $W$ with $W'W/N=I_r$ and $N^{-1}W'\Lambda\to H$ full rank:
$$
\hat F_t(N^{-1}W)=N^{-1}W'X_t=N^{-1}W'\Lambda F_t+N^{-1}W'e_t\xrightarrow{p}HF_t. \tag{9–10}
$$

**Principal components:** eigenvectors of $\hat\Sigma_X$ for the $r$ largest eigenvalues—optimal when idiosyncratics are spherical. Consistency of the factor space and rates allowing $\hat F_t$ to be treated as observed in second-stage regressions: Bai (2003), Stock & Watson (2002a).

**Special case:** single contemporaneous factor, loadings bounded away from 0 and $\infty$ → equal weights $W=\iota$ consistent (Forni–Reichlin style example).

**Generalized PC** (Forni, Hallin, Lippi & Reichlin frequency-domain methods): accounts for serial correlation / heteroskedastic idiosyncratics. Monte Carlo: Forni et al. (2005) find precision gains when dynamics are persistent and $N$ small (gaps close as $N,T$ grow). Boivin & Ng (2005), US-calibrated: small differences vs PC. Forecast comparisons (Boivin–Ng; Stock–Watson 2006b; D’Agostino–Giannone): holding the forecast specification fixed, PC vs GPC forecasts are **highly collinear**; pseudo-OOS MSE differences negligible for applied $N,T$. Intuition: many $W$ satisfy consistency—uniqueness is not required.

### Generation 3 — Hybrid PC + state space

Doz, Giannone & Reichlin (2006); Giannone, Reichlin & Small (2008):
1. Estimate factors by PC/GPC.
2. Regress $X_t$ on $\hat F_t$ (or $\hat f_t$ and lags) to populate loadings; estimate idiosyncratic ARs and factor VAR; **Kalman smooth** for refined factors (time-domain as well as cross-sectional averaging).

Optional: consistent starts for full MLE via EM (Engle–Watson; Quah–Sargent; Doz et al.). Jungbacker & Koopman (2008): collapse $X_t$ to $r\times 1$ to speed Kalman; Jungbacker–Koopman–van der Wel (2009): missing-data devices.

**When hybrid wins:** ragged-edge **nowcasting**; low signal-to-noise common components (Reiss & Watson 2010). Doz et al. MC: MLE advantage material for small $N$ under correct specification; negligible once $N,T\approx 50$ in their design.

---

## Choosing $r$ and $q$

### Static $r$

- Prior economic knowledge.
- **Scree plots** (Cattell 1966): ordered eigenvalues of $\hat\Sigma_X$ vs rank; visual contribution to trace $R^2$.
- **Bai & Ng (2002) information criteria** $PC_p$, $IC_p$: penalized residual fit; consistent for $r$ as $N,T\to\infty$ under approximate factor assumptions. Variants differ in penalty rate ($p_1,p_2,p_3$).

Practice: combine IC with scree; mild overfit of $r$ often less harmful for forecasting than severe underfit, but consistency is the formal goal.

### Dynamic $q$

Bai–Ng (2007) and related criteria on factor-innovation covariance / VAR of static factors; Amengual–Watson; Hallin–Liška frequency-domain IC. Empirically, macro panels often show **small $q$ (1–3)** even when $r$ is larger because lags inflate static dimension.

---

## Applications (Section 4)

### Second-stage regressions / diffusion indices

Stock & Watson (2002a,b): $y_{t+h}=\beta'\hat F_t+\gamma(L)y_t+e_{t+h}$. Large pseudo-OOS gains vs univariate benchmarks for US inflation and industrial production when $N$ is large. Theoretical warrant: if $N\to\infty$ fast enough relative to $T$, factor estimation error is asymptotically negligible in OLS (Bai; Stock–Watson)—factors “treated as data.” Factors also usable as **instruments** when endogeneity is spanned by low-dimensional shocks.

### FAVAR (Bernanke, Boivin & Eliasz 2005)

Augment a monetary VAR with factors from a large information set so the policy authority’s information is not artificially small. Identify policy shocks with standard short-run restrictions; map impulse responses to all series via loadings. Direct response to omitted-information critiques of small VARs (Rudebusch).

### DSGE + DFM

Boivin–Giannoni and related: many observables via DFM measurement equations; check whether DSGE-implied common components match nonparametric factors; efficiency gains vs tiny observable vectors.

---

## Extensions (Section 5)

- **Breaks / TVP:** rolling PC; TVP state-space DFMs; tests for loading breaks. Factor *space* can be more stable than individual series parameters—useful, but monitor IC-selected $r$ and OOS stability.
- **Nonstationarity:** I(1) factors / cointegrated idiosyncratics; careful prefiltering. Differenced growth-rate panels remain the forecasting workhorse.
- **Hierarchical DFMs:** block structures (regions, sectors) with common and block-specific factors (Moench–Ng–Potter; Kose–Otrok–Whiteman).
- **Outlook:** PC asymptotics meet real-time nowcasting pipelines; vintage alignment; sparse loadings; better $q$ selection.

---

## Limitations

- Handbook survey: no single sample table of “the” coefficients.
- Weak factors (non-pervasive loadings) break PC consistency.
- Exact vs approximate assumptions matter for inference.
- Finite-sample IC can mis-select $r$; small-$N$ estimator rankings disagree across Monte Carlos.
- Factors identified only up to rotation without further restrictions (FAVAR/DSGE).

---

## Practical Takeaways for a Quant / Macro Forecaster

1. For $N\gg T$ macro/financial panels: extract $r$ PCs (Bai–Ng IC + scree), forecast with diffusion-index regressions or FAVAR—do not run unrestricted $N$-VARs.
2. For live nowcasting (asynchronous releases, mixed frequencies): Gen-3 hybrid (PC → state space → Kalman as prints arrive).
3. PC vs Forni GPC is second-order for large balanced panels—spend effort on cleaning, vintages, and transformations.
4. Treat $\hat F_t$ as data in second stage only when $N$ satisfies rate conditions; otherwise keep state-space uncertainty.
5. Risk-model isomorphism: approximate factor structure ↔ statistical equity risk models; Bai–Ng chooses the number of statistical factors; weak/group factors need hierarchical specifications.
6. Always standardize (unless GPC models $\Sigma_e$); monitor OOS vs AR and random-walk benchmarks.

---

## Key Equations Quick Reference

| Object | Formula |
|--------|---------|
| Dynamic DFM | $X_t=\lambda(L)f_t+e_t$, $f_t=\Psi(L)f_{t-1}+\eta_t$ |
| Static form | $X_t=\Lambda F_t+e_t$, $\Phi(L)F_t=G\eta_t$ |
| Idiosyncratic AR | $d_i(L)e_{it}=\zeta_{it}$ |
| Averaging consistency | $\hat F_t=N^{-1}W'X_t\to HF_t$ |
| Pervasiveness / limited idiosyncratic correlation | (7), (8) |
| Efficient forecast | $E[X_{i,t+1}\mid\cdot]=\alpha(L)f_t+\delta(L)X_{it}$ |

---

## Implementation Checklist (Operational Detail)

**Panel construction.** Choose a universe of real activity, inflation, money/credit, asset prices, and surveys. Apply the Stock–Watson transformation codes (logs, differences, second differences as appropriate). Winsorize or adjust additive outliers. Align to a monthly or quarterly time grid; for nowcasting keep the ragged edge rather than balancet-trimming.

**Eigenvalue diagnostics.** Plot the first 20–50 eigenvalues of the correlation matrix of $X_t$. A sharp drop after 2–5 eigenvalues supports small $r$. Compare cumulative variance explained: if the first three PCs explain 30–50%+ of trace variance in a macro panel, the DFM premise is empirically plausible (magnitudes vary by dataset).

**Information criteria workflow.** Compute Bai–Ng $IC_{p1},IC_{p2},IC_{p3}$ over $r=0,\ldots,r_{\max}$ with $r_{\max}$ set by a rule such as $r_{\max}=\lfloor 8\cdot\min(N,T)^{1/4}\rfloor$ or a fixed cap (e.g., 10–15). Prefer the $r$ selected by at least two criteria; if criteria disagree, inspect scree and OOS MSFE for $r$ and $r\pm 1$.

**Forecast evaluation protocol.** Recursive estimation origin; fixed or expanding window; horizons $h=1,3,6,12$ months. Benchmarks: AR($p$) with BIC lag, random walk (for integrated targets), and small VAR. Report relative MSFE and Diebold–Mariano $p$-values. Check stability across Great Moderation / crisis subsamples.

**Nowcasting protocol.** Maintain a real-time state vector; when a subset of series updates, run the Kalman filter update only on observed measurements. Produce conditional expectations of unobserved monthly GDP or other latents (Angelini et al.; ADS index logic). Re-estimate loadings infrequently (monthly/quarterly); update factors daily/weekly as data arrive.

**FAVAR protocol.** Partition series into slow and fast; extract factors from the slow block (or the full panel with ordering constraints); place the policy rate last in a recursive identification; report IRFs with bootstrap or Kilian-style bias corrections.

**Risk / residual decomposition.** For a cross-section of asset returns $R_t=\Lambda F_t+e_t$, report: (i) fraction of variance due to common component; (ii) residual covariance eigenvalues after removing $r$ factors—should be flat if idiosyncratics are weak; (iii) time-series of factor-mimicking portfolio returns for use as covariates in alpha tests.

**Failure modes to monitor.** (a) Sudden jump in selected $r$ after a crisis—may reflect a new pervasive shock or a break in idiosyncratic volatility. (b) Factors that load only on a few series—weak-factor problem; drop or block-model those series. (c) Forecast gains that vanish after transaction costs or after excluding revisions—real-time vs final-vintage gap. (d) Near-collinearity between $\hat F_t$ and lagged $y_t$—regularize or orthogonalize.

**Relation to other many-predictor methods.** Ridge, LASSO, and Bayesian VARs with Minnesota priors are competitors. Empirically, diffusion indices often match or beat sparse regressions when comovement is truly low-rank; sparse methods win when only a handful of predictors matter. Hybrid strategies (target predictors, then PC on residuals or on a selected subset) appear in Bai–Ng targeting papers and are consistent with the survey’s message that the factor *space*, not a particular rotation, is the object of interest.

**Historical lineage for citation hygiene.** Geweke (1977) frequency-domain DFM; Sargent–Sims (1977) dynamic indexes; Chamberlain–Rothschild (1983) approximate factor model; Connor–Korajczyk financial applications; Stock–Watson (1989) coincident index via Kalman; Stock–Watson (2002a,b) PC diffusion indices; Bai–Ng (2002) IC; Forni–Hallin–Lippi–Reichlin dynamic PCs; Bernanke–Boivin–Eliasz (2005) FAVAR; Doz–Giannone–Reichlin (2006) two-step; Giannone–Reichlin–Small (2008) nowcasting.

**Bottom line.** Stock & Watson (2010) remains the standard map: assume approximate factor structure, estimate with PC or hybrid KF, select $r$ with Bai–Ng + scree, and exploit the collapse of the forecasting problem to low dimension. Estimator horse races are secondary once $N$ is large; mixed-frequency ragged-edge handling and careful transformation are first-order for production systems.


---

## Extended Technical Development: From Exact to Approximate Factor Models

The exact dynamic factor model, in which idiosyncratics are mutually uncorrelated at all leads and lags, is pedagogically clean but empirically false for macro panels: measurement concepts overlap (e.g., multiple employment series), and sectoral shocks spill across related industries. Chamberlain and Rothschild’s (1983) approximate factor model replaces mutual uncorrelation with a bound on the maximum eigenvalue of $\Sigma_e=E e_t e_t'$. That bound keeps the idiosyncratic contribution to any well-diversified portfolio negligible as $N\to\infty$, which is exactly what principal components needs.

Pervasiveness condition (7), $N^{-1}\Lambda'\Lambda\to D_\Lambda$ full rank, rules out “weak” factors that affect only a vanishing fraction of series. In equity risk modeling language, a factor that loads on three stocks in a 2,000-name universe is not pervasive and will not be recovered as a leading principal component. Hierarchical DFMs (Section 5.3) exist precisely to recover block-level factors that are pervasive *within* a block but not globally.

### Rates, Inference, and “Factors as Data”

Let $\hat F_t$ denote the PC estimator. Under Bai (2003) / Stock–Watson (2002a) conditions, $\hat F_t - H F_t = O_p(1/\min(\sqrt{N},\sqrt{T}))$ (up to notation and normalization). In a second-stage regression $y_{t+h}=\beta'F_t+u_{t+h}$, replacing $F_t$ by $\hat F_t$ does not change the asymptotic distribution of $\hat\beta$ if $N\to\infty$ sufficiently fast relative to $T$ (intuitively, cross-sectional averaging error becomes smaller than the usual $\sqrt{T}$ OLS error). This is the warrant for reporting conventional OLS standard errors on diffusion-index regressions when $N$ is in the hundreds.

When $N$ is small (tens of series), this warrant fails: use Gen-1/Gen-3 state space and report filtered factor uncertainty, or use bootstrap methods that re-estimate factors in each draw.

### Static vs Dynamic Rank: Why $r>q$ Matters

If $\lambda(L)$ has degree $p$ and there are $q$ dynamic factors, the static form stacks $p+1$ lags and yields $r=q(p+1)$ static factors in the unrestricted case (fewer if loadings restrictions apply). Forecasting regressions on $\hat F_t$ therefore may use more than $q$ regressors even when the economy is driven by few dynamic shocks. Criteria for $q$ (Bai–Ng 2007; Hallin–Liška) ask how many shocks drive the common component; criteria for $r$ ask how many contemporaneous linear combinations are needed to span that component. Confusing the two leads to mis-specified FAVARs (too few/too many state variables) and to incorrect counts of “macro shocks” in structural exercises.

### Frequency-Domain vs Time-Domain Estimators

First-generation Geweke (1977) / Sargent–Sims work estimated the importance of factors in the frequency domain (coherence, gain) without recovering $f_t$ paths—hence useless for forecasting. Forni–Hallin–Lippi–Reichlin dynamic principal components resurrect frequency-domain averaging to estimate the common component, then recover time-domain factors. Stock–Watson PC works entirely in the time domain on the static form. Empirically, once $N$ is large, the common-component estimates are close; the practical distinction is computational familiarity and how easily each method handles missing data (Kalman wins).

### Monte Carlo and Forecast Horse-Race Detail

Forni et al. (2005): GPC more precise than PC for common-component estimation when factors and idiosyncratics are persistent and $N$ is small; advantage disappears for large $N,T$. Boivin & Ng (2005): under US-calibrated designs, PC vs Forni GPC differences are minor; they also warn that adding more series is not always better if additional series are noisy or belong to a different factor structure—**targeted predictors** can dominate kitchen-sink panels. D’Agostino & Giannone (2006) and Stock–Watson (2006b): pseudo-OOS forecasts using different factor estimators are highly correlated; model uncertainty across estimators is small relative to uncertainty about $r$ and about target transformation.

Doz, Giannone & Reichlin (2006): two-step and MLE state-space estimates dominate raw PC when $N$ is small and the state-space model is correct; once $N,T\ge 50$ in their design, differences shrink. Reiss & Watson (2010) emphasize that when the common signal is small relative to idiosyncratic noise, time-domain Kalman averaging still helps even at larger $N$.

### Nowcasting Architecture (Giannone–Reichlin–Small)

1. Specify a monthly state vector of factors evolving as a VAR.
2. Link mixed-frequency observables via measurement equations (quarterly GDP loads on sums/averages of latent monthly states).
3. Initialize parameters with PC on a balanced subsample.
4. As each data release arrives within the month, run a Kalman update on the observed block only.
5. Publish the filtered expectation of current-quarter GDP growth (or other targets) as a nowcast; revise as the information set expands.

This is the intellectual core of modern central-bank nowcasting desks and of “tracking” indices in markets.

### FAVAR: Quantitative Identification Sketch

Observation equation: $X_t=\Lambda F_t+e_t$, where $X_t$ includes slow-moving macro series and the policy instrument may be entered separately. Transition: VAR on $(F_t',R_t')$. Ordering: slow factors ordered first, policy rate last, so that a recursive identification attributes within-period surprises in $R_t$ to the policy shock after absorbing contemporaneous factor variation. Impulse responses for series $i$: $\partial X_{i,t+h}/\partial\varepsilon^R_t = \Lambda_i \cdot \partial F_{t+h}/\partial\varepsilon^R_t$. Confidence bands via bootstrap that re-extracts factors.

### DSGE Link

A linearized DSGE implies a state-space representation with a low-dimensional state. Embedding that state inside a DFM measurement system for a large $X_t$ (i) improves estimation efficiency and (ii) provides misspecification diagnostics: if nonparametric factors require larger $q$ than the DSGE state dimension, the DSGE omits empirically relevant shocks.

### Breaks and Time Variation

Macro loadings shift across policy regimes (pre-/post-Volcker, pre-/post-ELB). Strategies: (i) rolling PC with window $W$; (ii) TVP-loadings state space; (iii) split-sample Bai–Ng. For forecasting, recursively re-estimated PC diffusion indices often outperform fixed-loading models after major breaks. For structural FAVARs, ignore breaks at your peril—IRFs can be artifacts of averaged regimes.

### Hierarchical / Multi-Level Factors

World–region–country hierarchies (Kose, Otrok & Whiteman) and sector hierarchies allow factors that are pervasive at one level but not another. Estimation: Bayesian MCMC or sequential PC within blocks then across block aggregates. For global equity desks, this is the right language for “global risk on/off” vs regional cycles.

### Nonstationarity

If raw levels are I(1), either (a) difference to I(0) and apply standard DFM, or (b) specify I(1) factors with cointegrated idiosyncratics. Option (a) dominates forecasting practice. Option (b) matters for estimating common stochastic trends (e.g., shared productivity trends across countries).

### Connection to Equity Statistical Risk Models

Replace macro $X_t$ with a cross-section of asset returns. Conditions (7)–(8) are Connor–Korajczyk / Chamberlain–Rothschild. Bai–Ng selects the number of statistical factors. Fundamental factor models (BARRA-style) impose $\Lambda$ from characteristics and estimate $F_t$ by cross-sectional regression—closer to Gen-1 with known loadings. Hybrid approaches: use characteristics to target, then extract residual statistical factors from the residual covariance.

### Quant Checklist (Expanded)

| Step | Action | Failure mode |
|------|--------|--------------|
| 1 | Transform & standardize panel | Mixing I(0)/I(1); scale dominance by noisy series |
| 2 | Scree + Bai–Ng for $r$ | Underfit omits factors; overfit fits noise |
| 3 | Optional: estimate $q$ | Confusing $r$ with $q$ in structural work |
| 4 | PC or hybrid KF factors | Ragged edge ignored → stale nowcasts |
| 5 | Diffusion index / FAVAR | Treating factors as data when $N$ small |
| 6 | Pseudo-OOS vs AR/RW | In-sample $R^2$ vanity |
| 7 | Monitor breaks | Averaged IRFs across regimes |

### Formula Sheet (Expanded)

**PC objective:** $\min_{\Lambda,F}\sum_t\|X_t-\Lambda F_t\|^2$ s.t. $N^{-1}\Lambda'\Lambda=I_r$, $T^{-1}\sum_t F_t F_t'$ diagonal (normalization variants abound).

**Bai–Ng IC (schematic):** $IC(r)=\ln V(r)+r\cdot \mathrm{penalty}(N,T)$, where $V(r)$ is average residual variance after $r$ factors; reject larger $r$ when penalty increase exceeds fit gain.

**Kalman recursion (conceptual):** predict state with VAR; update with observed measurements $X_t^{obs}= \Lambda^{obs}F_t+e_t^{obs}$; smoothed estimates use full-sample information.

**One-step forecast:** $\hat X_{i,t+1|t}=\hat\lambda_i(L)\hat f_{t+1|t}+\hat\delta(L)X_{it}$.

### Verdict for Library Use

This chapter is the canonical methods reference for DFM-based macro forecasting and nowcasting. It does not replace Bai–Ng (2008) for proofs, nor does it replace empirical papers for specific MSFE numbers on particular samples—but it is the right first read for a quant building a factor-based macro system, and it cleanly separates what is first-order (approximate factor structure, PC consistency, IC for $r$, hybrid KF for ragged edge) from what is second-order (PC vs GPC horse races at large $N$).


### Additional Worked Example: Building a Diffusion Index for Inflation

Suppose the target is US CPI inflation at horizon $h=12$ months. Assemble $N\approx 100$–$200$ monthly series: industrial production components, employment and hours, housing starts, order books, exchange rates, commodity prices, term spreads, credit spreads, and survey diffusion indices. Transform each to stationarity; standardize over the estimation sample. Extract $r$ PCs with Bai–Ng $IC_{p2}$; suppose $r=3$ is selected and the scree confirms a drop after the third eigenvalue. Estimate
$$
\pi_{t+12}=\alpha+\beta_1\hat F_{1t}+\beta_2\hat F_{2t}+\beta_3\hat F_{3t}+\gamma_1\pi_t+\gamma_2\pi_{t-1}+e_{t+12}
$$
by recursive OLS from an origin in the mid-1980s onward. Compare cumulative MSFE to an AR(2) benchmark. Typically, gains concentrate in periods when common real-activity factors move sharply (recoveries, recessions); in quiet periods, AR benchmarks are hard to beat. Add a Gen-3 nowcast layer for the current month’s factor state using weekly unemployment claims and other early prints to update $\hat F_t$ before CPI is released. This is the practical embodiment of equations (1)–(3) and Generation 3 in the survey.

### Glossary of Terms as Used in the Chapter

| Term | Meaning |
|------|---------|
| Dynamic factors $f_t$ | Primitive $q$-vector shocks’ state |
| Static factors $F_t$ | Stack of current and lagged $f_t$ |
| Common component | $\lambda_i(L)f_t$ or $\Lambda_i F_t$ |
| Idiosyncratic | Series-specific residual $e_{it}$ |
| Exact DFM | Zero cross-correlation of $e_{it}$ |
| Approximate DFM | Bounded $\operatorname{maxeval}(\Sigma_e)$ |
| Pervasiveness | Loadings not vanishing in $N^{-1}\Lambda'\Lambda$ |
| Diffusion index | Forecast using estimated factors |
| FAVAR | VAR augmented with estimated factors |
| Nowcast | Current-state estimate with ragged edge |
| Scree plot | Eigenvalue vs rank diagnostic |
| Bai–Ng IC | Penalized criterion for $r$ |

These definitions are sufficient to read the empirical DFM literature and to implement a production pipeline consistent with Stock & Watson (2010). Combined with the preceding sections, the notes above preserve the survey’s quantitative structure—equations (1)–(10), the three generations, IC for $r$, applications to FAVAR/DSGE/nowcasting, and the empirical regularity that a few factors dominate macro comovement—in a form usable by a quant investor building systematic macro forecasts or statistical risk models.


### Citations to Anchor Empirical Claims

Sargent & Sims (1977): two dynamic factors explain large fractions of variance of US quarterly output, employment, and prices—the founding empirical result. Giannone, Reichlin & Sala (2004) and Watson (2004) reconfirm that a small number of factors span a large share of macro variance in modern panels. Stock & Watson (2002a,b) document diffusion-index forecast gains for inflation and real activity. Bernanke, Boivin & Eliasz (2005) show FAVAR monetary IRFs with large information sets. Giannone, Reichlin & Small (2008) operationalize nowcasting. Bai & Ng (2002) supply the IC used throughout the literature to choose $r$. These references, all cited in the chapter, are the empirical backbone behind the methodological survey.


### Appendix-Style Notes on Estimator Taxonomy

For library completeness, the three generations can be remembered as: (G1) parametric likelihood, small $N$, optimal under correct specification, mixed-frequency native; (G2) large-$N$ PC/GPC, consistent factor space under pervasive approximate factors, second-stage “factors as data”; (G3) PC initialize + Kalman refine, best of both for nowcasting and low SNR. Bai–Ng (2002) chooses $r$; separate criteria choose $q$. FAVAR and DSGE applications consume the estimated factors as states. That taxonomy, plus equations (1)–(10) and conditions (7)–(8), is the durable content of Stock & Watson (2010) for a quant reader.


### Recap of Core Quantitative Messages

1. Model: $X_t=\lambda(L)f_t+e_t$, $f_t=\Psi(L)f_{t-1}+\eta_t$; static form $X_t=\Lambda F_t+e_t$.
2. Exact DFM: idiosyncratics mutually uncorrelated; approximate DFM: $\operatorname{maxeval}(\Sigma_e)$ bounded; pervasiveness $N^{-1}\Lambda'\Lambda\to D_\Lambda$ full rank.
3. PC consistency: $\hat F_t=N^{-1}W'X_t\to H F_t$ when $W$ spans loadings.
4. Three generations: Kalman MLE (small $N$, mixed freq); PC/GPC (large $N$); hybrid PC+Kalman (nowcasting).
5. Choose $r$ with Bai–Ng IC + scree; choose $q$ with dynamic criteria; typically $q$ small (1–3) in macro.
6. Applications: diffusion-index forecasts, FAVAR, DSGE with many observables, IV.
7. Horse races: PC vs GPC forecasts collinear at large $N$; hybrid wins for ragged edge and low SNR.
8. Prep: difference, standardize; monitor breaks; hierarchical factors for blocks.


---

## Source Evidence Appendix — Stock & Watson (2010)

The following curated excerpts preserve quantitative statements from the extracted PDF text for auditability and completeness of the research notes.
