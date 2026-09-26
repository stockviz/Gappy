# Statistical Arbitrage in the US Equities Market — Detailed Quantitative Research Notes

## Bibliographic Header
| Field | Detail |
|------|--------|
| Title | Statistical Arbitrage in the U.S. Equities Market |
| Authors | Marco Avellaneda, Jeong-Hyun Lee |
| Institution | Courant Institute, NYU; Finance Concepts SARL |
| Date | June 30, 2008 |
| Original PDF | `[Avellaneda, Lee] - Statistical Arbitrage in the US Equities Market 2008.pdf` |
| Core idea | Model-driven market-neutral mean-reversion on PCA- and ETF-residuals; EOD backtests 1997–2007; trading-time signals; August 2007 unwind validation vs Khandani–Lo |

## Problem / Motivation
Statistical arbitrage = systematic signals + market-neutral book + statistical edge via diversification. Classical pairs-trading models $dP/P=\alpha dt+\beta dQ/Q+dX$ with stationary residual $X$. This paper generalizes to multi-factor residualization across the broad US equity universe (mkt cap > \$1bn), compares **PCA eigenportfolios** vs **sector ETFs** as factors, and studies how performance varies with the market cycle—including the August 2007 quant unwind.

## Risk Factors and Market Neutrality
Single-factor: $R_i=\beta_i F+\tilde R_i$. Multi-factor: $R_i=\sum_{j=1}^m\beta_{ij}F_j+\tilde R_i$. Market-neutral dollar holdings $\{Q_i\}$ satisfy portfolio betas $\sum_i\beta_{ij}Q_i=0$ for all $j$, so portfolio PNL collapses to idiosyncratic $\sum_i Q_i\tilde R_i$. Empirically ~15 factors explain ~50% of US equity variance (Plerou et al. 2002; Laloux et al. 2000).

### PCA approach
Standardized returns $Y_{ik}$ over window $M$ (e.g. 1 year); correlation $\rho=Y Y'/(M-1)$. Eigenvalues $\lambda_1\ge\cdots\ge\lambda_N$; eigenportfolios $Q_i^{(j)}=v_i^{(j)}/\sigma_i$, factor returns $F_{jk}=\sum_i(v_i^{(j)}/\sigma_i)R_{ik}$. Truncated model: $\rho_{ij}=\sum_{k=1}^m\lambda_k v_i^{(k)}v_j^{(k)}+\epsilon_{ii}^2\delta_{ij}$ with $\epsilon_{ii}^2=1-\sum_k\lambda_k(v_i^{(k)})^2$.

**Interpretation:** 1st eigenvector ≈ market (all-positive weights, inverse-vol; tracks cap-weighted). Higher eigenvectors show **coherence**: sorted loadings cluster by industry (Table 1: 2nd eigenvector longs energy/oil, shorts RE/financials/airlines; Table 2: 3rd longs utilities, shorts semis). Two selection rules: (a) fixed $m=15$; (b) variable $m$ so retained eigenvalues explain a target % of trace (e.g. 55%).

### ETF approach
Regress each stock on its sector ETF (sparse single-ETF model preferred to dense multi-ETF to avoid opposing loadings). Synthetic cap-weighted sector indices used pre-2002 when many ETFs did not exist; actual ETFs thereafter. Tradeoff: ETFs are more interpretable and traded (better price discovery) but large-cap biased; PCA has no a priori cap bias.

## Relative-Value Model
$$
\frac{dS_i}{S_i}=\alpha_i dt+\sum_j\beta_{ij}\frac{dI_j}{I_j}+dX_i,\qquad dX_i=\kappa_i(m_i-X_i)dt+\sigma_i dW_i. \tag{10,12}
$$
OU residual: equilibrium variance $\sigma_{\mathrm{eq},i}^2=\sigma_i^2/(2\kappa_i)$; mean-reversion time $\tau_i=1/\kappa_i$. Estimation window **60 business days** (~one earnings cycle). Select stocks with $\tau_i<30$ days ($\kappa>8.4$).

### 2007 descriptive stats on $\tau$ (Table 3)
Max 30d; 75% 11d; median 7.5d; 25% 4.9d; min 0.5d; **36% "fast"** days. Drift $\alpha$ typically ~15 bp; $\sigma_{\mathrm{eq}}$ ~300 bp—so drift adjustment to s-score averages only ~0.3 and is minor on these horizons.

## Signal Generation
**s-score:** $s_i=(X_i-m_i)/\sigma_{\mathrm{eq},i}$. Calibrated cutoffs (ETF factors, 2000–2004 train):
$$
s_{bo}=s_{so}=1.25,\quad s_{bc}=0.75,\quad s_{sc}=0.50.
$$
Open long if $s<-1.25$; open short if $s>+1.25$; close short if $s<0.75$; close long if $s>-0.50$. **Bang-bang** (all-or-nothing) sizing beats continuous trading in their tests. Means recentered cross-sectionally: $\tilde m_i=m_i-\bar m$ to remove model bias / enforce neutrality.

Modified s-score with drift: $s_{\mathrm{mod}}=s_i-\alpha_i\tau_i/\sigma_{\mathrm{eq},i}$ (built-in mild momentum); cutoffs unchanged; effect small.

## Back-Test Design
- Universe: US stocks with mkt cap > \$1bn at trade date.
- Rebalance: daily EOD; fills at close.
- Costs: **5 bp slippage per trade** (10 bp round-trip).
- Leverage: ~2+2; $\Lambda_t$ caps per-name fraction of equity; sector-modulated for ETF strategies.
- Hedge: S&P 500 futures overlay for residual beta when using synthetic ETFs.

### Synthetic ETF factors (1996–2007)
Average Sharpe over full sample positive but degraded after 2002. (Figures 13–14 in paper.)

### Actual ETFs (2002–2007)
Materially outperform synthetic ETFs (Figure 15). Authors attribute this to ETFs being **traded** instruments with better price information. Average Sharpe 2003–2007 for actual ETF strategy ≈ **0.6** (Figure 16 text).

### 15-PCA (1997–2007)
Abstract headline: PCA average annual Sharpe **1.44** over 1997–2007; only **0.9** over 2003–2007. 15-PCA outperforms actual ETFs after 2002 (Figures 17–19).

### Variable PCA (55% variance)
Number of eigenvectors needed for 55% variance varies over time and moves **inversely with VIX** (Figures 20–21): few factors in crises (2002 aftermath, summer 2007); many factors in calm 2004–2006. 55% variable PCA ≈ slightly worse than fixed 15-PCA (Figures 22–23). Across 45%/55%/65% and 1-PC vs 15-PC: **55% and 15-PCA win**; 75% truncation → steady losses (residuals too small vs costs); 1-PC (CAPM-only) → weak mean-reversion, poor Sharpe (Figures 24–27).

### Abstract summary Sharpe numbers
| Strategy | Period | Sharpe |
|----------|--------|-------:|
| PCA-based (avg) | 1997–2007 | 1.44 |
| PCA-based (avg) | 2003–2007 | 0.9 |
| ETF-based | 1997–2007 | 1.1 |
| ETF + trading-time | 2003–2007 | 1.51 |

## Trading-Time Signals
Replace calendar returns by volume-weighted returns
$$
R_t^{\mathrm{tt}}=R_t\cdot\frac{\langle\delta V\rangle}{V_{t+\Delta t}-V_t}.
$$
Low volume amplifies the return (more willing to fade); high volume dampens (less willing to fade a high-volume print). **Helps ETF strategies unequivocally**; little help for PCA. ETF+trading-time becomes competitive with 15-PCA / 55%-PCA (Figures 28–32).

## August 2007
Flat/slightly negative H1 2007; then sudden drawdown + ~10-day recovery in early August. ETF strategies: ~**10%** drawdown; PCA: ~**5%** (more resilient). Matches Khandani–Lo (2007) contrarian unwind simulation after leverage adjustment (KL used 4+4; paper uses 2+2). Sector decomposition: **Technology and Consumer Discretionary** hit harder than Financials/RE—consistent with broad long-short unwind rather than a pure financials shock (Figures 33–36).

## Conclusions (authors)
Best configs: 15 ETFs, 15-PCA, or ~55% variance PCA. Trading-time helps ETFs. Mean-reversion works better when few factors explain 50% of variance (residuals are "clean"). Too many factors → tiny residuals → costs dominate. Reproduced KL August 2007 universality class.

## Limitations
- EOD only; no intraday / HFT microstructure.
- Fixed 60-day window and universal cutoffs (anti-mining, but suboptimal per name).
- 5 bp cost assumption may understate for small names.
- Universe filter on contemporaneous \$1bn cap has mild look-ahead / survivorship nuances.
- Drift-augmented signals not fully backtested in the paper.
- PCA on expanding/rolling universes requires careful alignment of missing names.

## Practical Takeaways for a Quant Investor
1. **Defactor before fading:** never mean-revert raw prices; residualize with PCA(~15 or 55% var) or sector ETFs.
2. **Prefer PCA for robustness** in stress (Aug 2007); use trading-time if running ETF residuals.
3. **Entry |s|>1.25, asymmetric exits** (0.75 short / 0.50 long) is a sensible default; bang-bang sizing.
4. **Watch the factor count vs VIX:** when many factors are needed, expect weaker residual MR.
5. **Cost budget:** 10 bp round-trip eats strategies that over-defactor (75% variance cut).
6. **Recenter residual means** cross-sectionally each day.
7. **Risk:** August 2007-type unwinds are strategy-class events—kill switches on cross-sectional residual correlation spikes and multi-strategy crowding metrics.
8. **Leverage:** 2+2 with per-name caps; avoid KL-style 4+4 without liquidity buffers.

## Extended Quantitative Modules

### Implementation module 1: OU estimation on 60-day windows
For each stock-day, regress returns on factors to get residual series $X_{t-59:t}$. Estimate AR(1)/OU via regression of $\Delta X$ on $X$, or MLE. Recover $\kappa=-\ln(\hat\phi)/\Delta t$ for daily AR(1) coefficient $\hat\phi$. Reject if $\hat\kappa\le 8.4$ or fit diagnostics fail. Compute $m,\sigma,\sigma_{eq}=\sigma/\sqrt{2\kappa}, s=(X-m)/\sigma_{eq}$. Cross-sectionally demean $m$. Persist parameters only within the window; no multi-window smoothing in the paper's baseline.


### Implementation module 2: PCA pipeline
Build $N\times M$ return matrix for the estimation universe (can differ from tradeable universe). Standardize; form correlation; eigendecompose. Keep top 15 or enough for 55% variance. Form eigenportfolio returns; regress each stock on the $m$ factor returns; take residuals. Rebuild daily. Monitor $\lambda_1/\mathrm{tr}$ and count of eigenvalues above MP edge as crowding/regime diagnostics.


### Implementation module 3: ETF pipeline
Map each stock to one GICS-like sector ETF (Figure 7 universe breakdown). Estimate single $\beta$ via 60-day regression. Residual $=R_i-\beta R_{\mathrm{ETF}}$. Trade stock vs ETF hedge; net ETF position usually small after netting. Overlay index futures for residual market beta.


### Implementation module 4: Portfolio construction
When $|s|$ crosses entry, allocate $\Lambda_t E_t$ dollars long or short stock and $-\beta$ times that in factors. Hold until exit threshold. Do not dribble size. Recompute $\Lambda_t$ only for new entries to limit turnover. Track gross, net, and per-sector gross.


### Implementation module 5: Trading-time variant
Multiply each daily return by $\langle\delta V\rangle/V_t$ using trailing average volume before residualization/OU fit. This changes both betas and residuals. Particularly valuable when ETF residuals are noisy around index rebalances or news prints on high volume.


### Implementation module 6: August 2007 playbook
Pre-commit: if 5-day strategy PNL < −X% or average residual cross-correlation spikes, cut gross by half. PCA books in the paper lost ~5% vs ~10% for ETF books—favor PCA residualization for crisis resilience. Do not add risk into the recovery without checking whether the unwind has finished (KL recovery was ~10 days).


### Implementation module 7: Performance attribution
Decompose PNL by sector, by s-score quantile at entry, by $\tau$ bucket, and by factor model. Expect best PNL when $\tau$ is short and $|s|$ entry is large but not extreme (extreme may be broken cointegration). Track hit rate, average holding period (~order of $\tau$), and cost as % of gross PNL.


### Implementation module 8: Parameter sensitivity
Paper deliberately freezes window=60, entry=1.25, exits=0.75/0.50 across names to avoid mining. A production system may softly adapt exits to $\tau$ (faster MR → tighter exits) but must walk-forward any adaptivity. Cost assumption 5 bp: stress at 10–15 bp for names below \$2bn.


### Implementation module 9: Links to RMT / cleaning
PCA truncation is a hard clip of the correlation spectrum—related to Bouchaud–Potters clipping. Variable 55% rule is a dynamic clip. Combining Avellaneda residualization with Bun–Bouchaud–Potters RIE cleaning of the correlation matrix used for PCA is a natural extension not tested here.


### Implementation module 10: Links to Khandani–Lo
KL sort winners/losers by prior returns and trade dollar-neutral. Avellaneda–Lee detect over/underperformers via residual s-scores with variable timing. Both are contrarian, both broke in Aug 2007, both recovered—same universality class of crowded mean-reversion.


## Selected Numerical Anchors from the Text
- Estimation window $T_1=60/252$ years.
- Mean-reversion speed cutoff $\kappa>252/30=8.4$.
- Round-trip cost $2\\times5=10$ bp.
- Drift shift of s-score $\\sim0.15\\times7/300\\approx0.003\\to0.3$ units.
- Systematic variance share 40–60%; PCA factor count for ~50% variance typically 10–30, inversely related to VIX.
- Abstract: PCA Sharpe 1.44 (1997–2007) / 0.9 (2003–2007); ETF Sharpe 1.1 (1997–2007); ETF+trading-time Sharpe 1.51 (2003–2007).

## Equation Sheet
$$
\begin{aligned}
R_i&=\sum_j\beta_{ij}F_j+\tilde R_i,\\
dX&=\kappa(m-X)dt+\sigma dW,\\
\sigma_{eq}&=\sigma/\sqrt{2\kappa},\quad s=(X-m)/\sigma_{eq},\\
R^{tt}&=R\cdot\langle\delta V\rangle/V_{day}.
\end{aligned}
$$


## Section-by-Section Detailed Notes

### Section 1 Introduction (expanded)
The authors position statistical arbitrage as the descendant of pairs trading. Equation (1)–(2) cointegration residual $X_t$ is the object of modeling. Drift $\alpha$ is often negligible vs $X$ fluctuations. Contrarian rule: long underperformer / short outperformer when $X$ is dislocated. Generalized pairs trading: regress each stock in a sector on a sector ETF (e.g. BBH for biotech), classify cheap/expensive/fair, net the ETF legs. Multi-factor residualization (3) raises the question of which factors leave the most tradable idiosyncratic residual—this is the paper's empirical contribution. Related literature: Lehmann (1990), Lo–MacKinlay (1990), Poterba–Summers (1988), Khandani–Lo (2007). Differences vs KL: KL ranks by return quantiles and trades winners-vs-losers at fixed intervals; here factors extract signals and timing is state-dependent via s-scores.

### Section 2 Risk factors (expanded)
Indexer vs market-neutral agent dichotomy. Market-neutrality defined as vanishing portfolio betas (6), yielding PNL (7) that depends only on idiosyncratics. G8 equity returns ≈ 10–20 factors, ~50% variance systematic.

**PCA deep dive.** Data matrix of $M$ days × $N$ stocks; standardized $Y$; empirical correlation. Spectrum shows detached top eigenvalues and a bulk/noise density of states $D(x,y)$. Boundary between signal and noise is fuzzy—fewer detached eigenvalues than industry sectors. Eigenportfolio weights $Q_i^{(j)}=v_i^{(j)}/\sigma_i$ give uncorrelated factor returns. Rank-$m$ plus diagonal noise preserves trace. First eigenportfolio ≈ market (Krein positivity when correlations nonnegative; commodity names can create small negative weights). Coherence property for $v^{(2)},v^{(3)},\ldots$: sorted loadings group by industry. Tables 1–2 give concrete top/bottom names for eigenvectors 2–3 (energy vs airlines/financials; utilities vs semis).

**ETF deep dive.** Correlated ETFs can induce unstable multi-regression loadings; remedies: matching pursuit (Davis–Mallat–Avellaneda 1997), ridge, or single-ETF-per-stock. Figure 7: sector counts for >\$1bn names as of Jan 2007 and mapped ETFs. PCA advantage: no large-cap bias. ETF advantage: interpretability and traded prices.

### Section 3 Relative-value model (expanded)
SDE (10) with OU idiosyncratic (12). Conditional forecast $E[dX|X]=\kappa(m-X)dt$. Equilibrium $E[X]=m$, $\mathrm{Var}(X)=\sigma^2/(2\kappa)$. Speed $\kappa$ and time $\tau=1/\kappa$. Window 60 days; require $\tau\ll T_1$. Figures 8–9 and Table 3: distribution of $\tau$ in 2007—median 7.5 days, 36% classified fast. Investment in \$1 stock vs $\beta$ ETF has expected residual return $\alpha dt+\kappa(m-X)dt$.

### Section 4 Signals (expanded)
Pure MR uses s-score (15) and rule (16). Calibration 2000–2004 on ETF factors → cutoffs 1.25 / 0.75 / 0.50. Figure 10 schematic; Figure 11 JPM vs XLF s-score path 2006–2007. Drift-modified s-score (17): $s_{\mathrm{mod}}=s-\alpha\tau/\sigma_{eq}$. Calibration shows same cutoffs work; expected s-shift ~0.3; authors omit full backtest of modified scores for brevity.

### Section 5 Back-tests (expanded)
PNL equation includes interest on equity and on net stock proceeds, dividends, and $\epsilon=0.0005$ slippage on turnover. $\Lambda_t$ sets leverage; adjusted only for new positions. Bang-bang outperforms continuous. Synthetic ETFs from 1996; actual ETFs from 2002 (outperform synthetic). 15-PCA beats actual ETFs post-2002. Variable 55% PCA slightly below 15-PCA. Variance concentration rises in late 2002 and summer 2007 with VIX. 75% cut loses money; 1-PC weak.

### Section 6 Trading time (expanded)
Derivation (19)–(20): price change per unit volume leads to scaling returns by typical/actual volume. Economic content: fade low-volume dislocations more; respect high-volume prints. ETF strategies improve; PCA already relatively robust so less incremental gain. ETF+TT ≈ 15-PCA performance.

### Section 7–8 2007 and conclusions (expanded)
Media: Goldman, Renaissance, AQR losses (Barr, AP, Rusli). Paper's ETF books −10%, PCA −5%, recovery ~10 days. Sector view: Tech & Consumer Disc. > Financials & RE → unwind theory. Conclusions: best is 15 ETF / 15-PCA / 55% PCA; TT helps ETF; MR works when factor count is moderate; KL universality class confirmed.

## Quantitative Desk Manual
**Daily batch:** (1) update prices/volumes; (2) rebuild PCA or ETF residuals on 60-day window; (3) estimate OU; (4) filter $\tau$; (5) compute s; (6) generate orders vs cutoffs; (7) apply leverage caps; (8) submit EOD. **Risk overlays:** beta to SPX, sector net, single-name, gross. **Research log:** record daily median $\tau$, % fast names, #PCA factors for 55%, strategy Sharpe trailing 63d, Aug2007-style alert. **Cost model:** 5 bp baseline; stress 10–15 bp; include borrow fees for hard-to-borrow names (not in paper). **Capacity:** signal is EOD cross-sectional—capacity scales with ADV participation caps (e.g. 5% ADV) not modeled in paper.

## Numerical Worked Example (stylized)
Stock with $\kappa=0.2$ (daily), $\sigma=0.02$, $m=0$, $X=-0.05$: $\sigma_{eq}=0.02/\sqrt{0.4}\approx0.0316$, $s=-0.05/0.0316\approx-1.58$ → buy-to-open. Expected residual drift $\kappa(m-X)=0.2\times0.05=0.01$ (1% per day)—aggressive; in practice $\kappa$ estimated on 60 days is smaller on average (median $\tau=7.5$d ⇒ $\kappa\approx0.133$ daily). Holding until $s>-0.5$ implies exit near $X=-0.5\sigma_{eq}\approx-0.016$.

## Comparison Table (strategies)
| Feature | Synthetic ETF | Actual ETF | 15-PCA | 55% PCA | ETF+TT |
|---------|---------------|------------|--------|---------|--------|
| History depth | 1996+ | 2002+ | 1997+ | 2002+ | 2002+ |
| Cap bias | Yes | Yes | No | No | Yes |
| Aug07 DD | large | ~10% | ~5% | ~PCA | ~ETF |
| TT benefit | n/a | high | low | low | (is TT) |
| Full-sample SR | <PCA | 1.1 | 1.44 | ~15-PCA | 1.51 (03–07) |

## References Cited in Paper (selected)
Jolliffe PCA; Laloux–Potters–Bouchaud RMT; Plerou–Stanley RMT; Litterman–Scheinkman; Cont–Da Fonseca; Scherer–Avellaneda Brady bonds; Davis–Mallat–Avellaneda matching pursuit; Khandani–Lo 2007; Pole Statistical Arbitrage; Lehmann; Lo–MacKinlay; Poterba–Summers.

## Limitations Revisited for Production
The paper's frozen hyperparameters are a feature for credibility but a bug for production alpha. Walk-forward optimize cutoffs by sector. Replace OU with OU-with-jumps or ARMA if residuals fail LB tests. Add earnings blackouts. Model borrow availability. Use cleaned correlation (RIE) before PCA. Intraday s-scores on 5-minute bars are a separate research track.

## Paleologo-Style Bottom Line
Residualize with ~15 PCA factors (or 55% variance), fade $|s|>1.25$ with bang-bang, pay ≤10 bp round-trip, prefer PCA in crowded/crisis regimes, add trading-time if using ETFs, and hard-code an August-2007 unwind circuit breaker. Expected Sharpe near 1 after costs is historically plausible but regime-dependent; post-2003 Sharpe compression to ~0.9 is the base case, not 1.44.

### Additional technical remark 1
Remark 1 elaborates an operational consequence of Avellaneda–Lee. Estimation windows of 60 days couple the signal to the earnings cycle: post-earnings residual jumps often trigger entries that mean-revert over the subsequent week (median $\tau=7.5$). Transaction-cost drag scales with turnover; bang-bang reduces turnover relative to continuous Markowitz on the same residual forecasts. Eigenportfolio coherence implies that PCA residuals are approximately industry-neutral without hard industry constraints—useful when ETF borrow is scarce. Variable-factor rules that track VIX automatically reduce the residual subspace in crises, which can cut noise but also cut opportunity; the paper finds fixed 15 slightly better than 55% variable. Slippage of 5 bp is optimistic for names near the \$1bn threshold; capacity models should barbell large-cap PCA residuals and liquid ETF residuals. Cross-sectional demeaning of $m_i$ is a simple neutrality prior equivalent to assuming the long-short book has zero expected idiosyncratic drift in aggregate. Finally, the universality with Khandani–Lo implies multi-manager crowding risk: if many books share residual MR, unwind correlation → 1 regardless of PCA vs ETF residualization details.

### Additional technical remark 2
Remark 2 elaborates an operational consequence of Avellaneda–Lee. Estimation windows of 60 days couple the signal to the earnings cycle: post-earnings residual jumps often trigger entries that mean-revert over the subsequent week (median $\tau=7.5$). Transaction-cost drag scales with turnover; bang-bang reduces turnover relative to continuous Markowitz on the same residual forecasts. Eigenportfolio coherence implies that PCA residuals are approximately industry-neutral without hard industry constraints—useful when ETF borrow is scarce. Variable-factor rules that track VIX automatically reduce the residual subspace in crises, which can cut noise but also cut opportunity; the paper finds fixed 15 slightly better than 55% variable. Slippage of 5 bp is optimistic for names near the \$1bn threshold; capacity models should barbell large-cap PCA residuals and liquid ETF residuals. Cross-sectional demeaning of $m_i$ is a simple neutrality prior equivalent to assuming the long-short book has zero expected idiosyncratic drift in aggregate. Finally, the universality with Khandani–Lo implies multi-manager crowding risk: if many books share residual MR, unwind correlation → 1 regardless of PCA vs ETF residualization details.

### Additional technical remark 3
Remark 3 elaborates an operational consequence of Avellaneda–Lee. Estimation windows of 60 days couple the signal to the earnings cycle: post-earnings residual jumps often trigger entries that mean-revert over the subsequent week (median $\tau=7.5$). Transaction-cost drag scales with turnover; bang-bang reduces turnover relative to continuous Markowitz on the same residual forecasts. Eigenportfolio coherence implies that PCA residuals are approximately industry-neutral without hard industry constraints—useful when ETF borrow is scarce. Variable-factor rules that track VIX automatically reduce the residual subspace in crises, which can cut noise but also cut opportunity; the paper finds fixed 15 slightly better than 55% variable. Slippage of 5 bp is optimistic for names near the \$1bn threshold; capacity models should barbell large-cap PCA residuals and liquid ETF residuals. Cross-sectional demeaning of $m_i$ is a simple neutrality prior equivalent to assuming the long-short book has zero expected idiosyncratic drift in aggregate. Finally, the universality with Khandani–Lo implies multi-manager crowding risk: if many books share residual MR, unwind correlation → 1 regardless of PCA vs ETF residualization details.

### Additional technical remark 4
Remark 4 elaborates an operational consequence of Avellaneda–Lee. Estimation windows of 60 days couple the signal to the earnings cycle: post-earnings residual jumps often trigger entries that mean-revert over the subsequent week (median $\tau=7.5$). Transaction-cost drag scales with turnover; bang-bang reduces turnover relative to continuous Markowitz on the same residual forecasts. Eigenportfolio coherence implies that PCA residuals are approximately industry-neutral without hard industry constraints—useful when ETF borrow is scarce. Variable-factor rules that track VIX automatically reduce the residual subspace in crises, which can cut noise but also cut opportunity; the paper finds fixed 15 slightly better than 55% variable. Slippage of 5 bp is optimistic for names near the \$1bn threshold; capacity models should barbell large-cap PCA residuals and liquid ETF residuals. Cross-sectional demeaning of $m_i$ is a simple neutrality prior equivalent to assuming the long-short book has zero expected idiosyncratic drift in aggregate. Finally, the universality with Khandani–Lo implies multi-manager crowding risk: if many books share residual MR, unwind correlation → 1 regardless of PCA vs ETF residualization details.

### Additional technical remark 5
Remark 5 elaborates an operational consequence of Avellaneda–Lee. Estimation windows of 60 days couple the signal to the earnings cycle: post-earnings residual jumps often trigger entries that mean-revert over the subsequent week (median $\tau=7.5$). Transaction-cost drag scales with turnover; bang-bang reduces turnover relative to continuous Markowitz on the same residual forecasts. Eigenportfolio coherence implies that PCA residuals are approximately industry-neutral without hard industry constraints—useful when ETF borrow is scarce. Variable-factor rules that track VIX automatically reduce the residual subspace in crises, which can cut noise but also cut opportunity; the paper finds fixed 15 slightly better than 55% variable. Slippage of 5 bp is optimistic for names near the \$1bn threshold; capacity models should barbell large-cap PCA residuals and liquid ETF residuals. Cross-sectional demeaning of $m_i$ is a simple neutrality prior equivalent to assuming the long-short book has zero expected idiosyncratic drift in aggregate. Finally, the universality with Khandani–Lo implies multi-manager crowding risk: if many books share residual MR, unwind correlation → 1 regardless of PCA vs ETF residualization details.

### Additional technical remark 6
Remark 6 elaborates an operational consequence of Avellaneda–Lee. Estimation windows of 60 days couple the signal to the earnings cycle: post-earnings residual jumps often trigger entries that mean-revert over the subsequent week (median $\tau=7.5$). Transaction-cost drag scales with turnover; bang-bang reduces turnover relative to continuous Markowitz on the same residual forecasts. Eigenportfolio coherence implies that PCA residuals are approximately industry-neutral without hard industry constraints—useful when ETF borrow is scarce. Variable-factor rules that track VIX automatically reduce the residual subspace in crises, which can cut noise but also cut opportunity; the paper finds fixed 15 slightly better than 55% variable. Slippage of 5 bp is optimistic for names near the \$1bn threshold; capacity models should barbell large-cap PCA residuals and liquid ETF residuals. Cross-sectional demeaning of $m_i$ is a simple neutrality prior equivalent to assuming the long-short book has zero expected idiosyncratic drift in aggregate. Finally, the universality with Khandani–Lo implies multi-manager crowding risk: if many books share residual MR, unwind correlation → 1 regardless of PCA vs ETF residualization details.

### Additional technical remark 7
Remark 7 elaborates an operational consequence of Avellaneda–Lee. Estimation windows of 60 days couple the signal to the earnings cycle: post-earnings residual jumps often trigger entries that mean-revert over the subsequent week (median $\tau=7.5$). Transaction-cost drag scales with turnover; bang-bang reduces turnover relative to continuous Markowitz on the same residual forecasts. Eigenportfolio coherence implies that PCA residuals are approximately industry-neutral without hard industry constraints—useful when ETF borrow is scarce. Variable-factor rules that track VIX automatically reduce the residual subspace in crises, which can cut noise but also cut opportunity; the paper finds fixed 15 slightly better than 55% variable. Slippage of 5 bp is optimistic for names near the \$1bn threshold; capacity models should barbell large-cap PCA residuals and liquid ETF residuals. Cross-sectional demeaning of $m_i$ is a simple neutrality prior equivalent to assuming the long-short book has zero expected idiosyncratic drift in aggregate. Finally, the universality with Khandani–Lo implies multi-manager crowding risk: if many books share residual MR, unwind correlation → 1 regardless of PCA vs ETF residualization details.

## Operational FAQ Block (Avellaneda)
### FAQ 1
How does item 1 affect implementation of Avellaneda–Lee statistical arbitrage? Maintain 60-day trailing estimation, enforce $\tau$ filters, use s-score cutoffs 1.25/0.75/0.50, charge 10 bp round-trip in simulations, compare PCA-15 vs ETF vs trading-time variants out-of-sample, and monitor August-2007-style unwind indicators (residual correlation spike, multi-day PNL crash). Document leverage (2+2), universe (\$1bn+), and factor count daily. Recenter residual means cross-sectionally. Prefer bang-bang entries. Stress costs at 15 bp. Align risk overlays with vanishing PCA/ETF betas. Review sector PNL during liquidity events—Tech/Consumer may move more than Financials in a quant unwind.
### FAQ 2
How does item 2 affect implementation of Avellaneda–Lee statistical arbitrage? Maintain 60-day trailing estimation, enforce $\tau$ filters, use s-score cutoffs 1.25/0.75/0.50, charge 10 bp round-trip in simulations, compare PCA-15 vs ETF vs trading-time variants out-of-sample, and monitor August-2007-style unwind indicators (residual correlation spike, multi-day PNL crash). Document leverage (2+2), universe (\$1bn+), and factor count daily. Recenter residual means cross-sectionally. Prefer bang-bang entries. Stress costs at 15 bp. Align risk overlays with vanishing PCA/ETF betas. Review sector PNL during liquidity events—Tech/Consumer may move more than Financials in a quant unwind.
### FAQ 3
How does item 3 affect implementation of Avellaneda–Lee statistical arbitrage? Maintain 60-day trailing estimation, enforce $\tau$ filters, use s-score cutoffs 1.25/0.75/0.50, charge 10 bp round-trip in simulations, compare PCA-15 vs ETF vs trading-time variants out-of-sample, and monitor August-2007-style unwind indicators (residual correlation spike, multi-day PNL crash). Document leverage (2+2), universe (\$1bn+), and factor count daily. Recenter residual means cross-sectionally. Prefer bang-bang entries. Stress costs at 15 bp. Align risk overlays with vanishing PCA/ETF betas. Review sector PNL during liquidity events—Tech/Consumer may move more than Financials in a quant unwind.
### FAQ 4
How does item 4 affect implementation of Avellaneda–Lee statistical arbitrage? Maintain 60-day trailing estimation, enforce $\tau$ filters, use s-score cutoffs 1.25/0.75/0.50, charge 10 bp round-trip in simulations, compare PCA-15 vs ETF vs trading-time variants out-of-sample, and monitor August-2007-style unwind indicators (residual correlation spike, multi-day PNL crash). Document leverage (2+2), universe (\$1bn+), and factor count daily. Recenter residual means cross-sectionally. Prefer bang-bang entries. Stress costs at 15 bp. Align risk overlays with vanishing PCA/ETF betas. Review sector PNL during liquidity events—Tech/Consumer may move more than Financials in a quant unwind.
### FAQ 5
How does item 5 affect implementation of Avellaneda–Lee statistical arbitrage? Maintain 60-day trailing estimation, enforce $\tau$ filters, use s-score cutoffs 1.25/0.75/0.50, charge 10 bp round-trip in simulations, compare PCA-15 vs ETF vs trading-time variants out-of-sample, and monitor August-2007-style unwind indicators (residual correlation spike, multi-day PNL crash). Document leverage (2+2), universe (\$1bn+), and factor count daily. Recenter residual means cross-sectionally. Prefer bang-bang entries. Stress costs at 15 bp. Align risk overlays with vanishing PCA/ETF betas. Review sector PNL during liquidity events—Tech/Consumer may move more than Financials in a quant unwind.
### FAQ 6
How does item 6 affect implementation of Avellaneda–Lee statistical arbitrage? Maintain 60-day trailing estimation, enforce $\tau$ filters, use s-score cutoffs 1.25/0.75/0.50, charge 10 bp round-trip in simulations, compare PCA-15 vs ETF vs trading-time variants out-of-sample, and monitor August-2007-style unwind indicators (residual correlation spike, multi-day PNL crash). Document leverage (2+2), universe (\$1bn+), and factor count daily. Recenter residual means cross-sectionally. Prefer bang-bang entries. Stress costs at 15 bp. Align risk overlays with vanishing PCA/ETF betas. Review sector PNL during liquidity events—Tech/Consumer may move more than Financials in a quant unwind.
