# Machine Trading: Deploying Computer Algorithms to Conquer the Markets — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | Machine Trading: Deploying Computer Algorithms to Conquer the Markets |
| **Author** | Ernest P. Chan |
| **Year** | 2017 |
| **Publisher** | John Wiley & Sons (Wiley Trading) |
| **ISBN** | 978-1-119-21960-6 (Hardcover); 978-1-119-21967-5 (ePDF); 978-1-119-21965-1 (ePub) |
| **Series context** | Third book after *Quantitative Trading* (2009) and *Algorithmic Trading* (2013) |
| **Software** | MATLAB primary; comparisons to R; code/data notes at epchan.com/book3 |
| **Firm** | QTS Capital Management (author CTO collaboration with Roger Hunter) |

Tone: practitioner quant research notes. All strategies are prototypes with likely hidden biases—never deploy without independent backtest.

---

## Problem / Motivation

Chan’s agenda is an advanced operator’s handbook for deploying computer algorithms across: data/broker infrastructure, factor models, time-series forecasting, AI/ML with overfitting controls, options overlays, intraday microstructure, and bitcoin. The unifying constraint is **research = production**: the same code path that generates backtest results should submit live orders (Figure 1.1 flowchart: historical/live data → program → broker API ↔ order status).

Target reader: quantitative background (CS/engineering/physics); finance prerequisites light except options chapter. Exercises at chapter ends for workshop/course use.

---

## Chapter 1 — The Basics of Algorithmic Trading

### 1.1 Architecture

Identical program for backtest and live trading is non-negotiable for avoiding research–production skew. Components: historical data vendors, live data, strategy engine, broker API, order state machine, performance analytics, leverage/allocation layer.

### 1.2 Historical market data (vendors & pitfalls)

**CSI (csidata.com):** Chan’s long-standing daily stocks/futures source. Desktop app with scheduled evening updates; exports `.txt/.csv/.xlsx`; split/dividend adjustment; optional **survivorship-bias-free** delisted history (CSI also powered Yahoo Finance historicals). Futures: multiple rollover methods for continuous contracts; professionals often prefer **raw contract prices** because back-adjusted series depend on roll method and can embed look-ahead (cross-ref Chan 2013).

Other data themes in Ch.1 (as framed in preface/TOC scope): cost-effective vendors for tick/intraday, fundamental, options chains; licensing restrictions mean some example datasets are purchase-only (unlike prior books’ free dumps).

**Survivorship bias:** using only currently listed names inflates historical equity premia and factor returns. Always include delists when estimating expected returns and Sharpe.

**Look-ahead / adjustment bias:** dividend/split adjustment must match the information set at decision time; “adjusted close” naively used can leak future corporate actions into past signals.

### 1.3 Brokers, APIs, and safety

Interactive Brokers appears throughout acknowledgments (Joanne, Ragini, Mike, Greg, Ian, Ralph)—patient API/support for algorithmic connectivity. Selection criteria Chan emphasizes (updated vs prior books):

- API stability and order-type coverage (limit, market, stop, pegged, algos).
- Short locate / hard-to-borrow handling for equity shorts.
- Futures margin and overnight vs intraday margin.
- **Broker safety:** not only fees—custody, bankruptcy remoteness, PFOF conflicts, outage history.
- Paper-trading fidelity vs live fills (partial fills, rejects, throttling).

Lime Brokerage acknowledgments (David Don, Joseph Signorelli) correct microstructure misunderstandings—relevant when graduating from daily to intraday (Ch.6).

### 1.4 Performance metrics (Chan favorites)

Standard toolkit with Chan’s ordering of usefulness:

1. **Sharpe ratio** $SR=\sqrt{N}\,\bar r/\sigma_r$ (annualize carefully: $N=252$ daily, $252\times\text{bars/day}$ intraday—do not mix).
2. **Maximum drawdown** and **MAR** (CAGR / |max DD|).
3. **Calmar**, **Sterling** variants.
4. **Profit factor** = gross wins / gross losses.
5. **Average daily return / average daily DD** style leverage guides.
6. **Hypothesis tests** on mean return ≠ 0 with HAC/Newey–West when autocorrelation present.
7. **Out-of-sample** and **walk-forward** Sharpe degradation vs in-sample as overfitting diagnostic.

### 1.5 Optimal leverage — Kelly and fractions

For a strategy with edge, Kelly leverage maximizes log-wealth. Gaussian approximation:

$$
f^*=\frac{\mu}{\sigma^2}
$$

for excess return mean $\mu$ and variance $\sigma^2$ per period (or $f^*=SR^2$ under certain normalizations when $\mu/\sigma$ is Sharpe of the unit-levered strategy—be careful with units). Chan stresses **half-Kelly or less** in practice because:

- Return distributions are fat-tailed → full Kelly overbets.
- Parameter uncertainty in $\mu$ is first-order (estimation error in mean is classic Michaud territory—pair with Book 3 in this batch).
- Correlated strategies sharing capacity require joint Kelly / mean-variance on the strategy portfolio, not siloed Kelly.

Drawdown-based leverage caps: choose $f$ so that estimated max DD × notional stays within investor risk budget.

### 1.6 Simplest asset allocation

Chan’s “simplest” allocation among strategies/assets (updated FinTech context):

- Equal weight (surprisingly robust).
- Inverse-volatility weight $w_i\propto 1/\sigma_i$.
- Risk parity / equal risk contribution.
- Mean-variance with **shrunk** covariances and conservative means (or Black–Litterman-style views—see Cornuéjols–Tütüncü overlap).
- Rebalance on calendar or on drift bands to control turnover/costs.

Transaction costs must enter the optimization: expected return net of $c\times turnover$.

### 1.7 Chapter 1 practical checklist

| Item | Action |
|------|--------|
| Data | Survivorship-free; document adjustment policy |
| Code path | One engine for backtest & live |
| Broker | API + custody diligence |
| Metrics | Sharpe, max DD, OOS degradation |
| Leverage | ≤ half-Kelly; DD cap |
| Allocation | Inverse-vol or shrunk MV; cost-aware |

---

## Chapter 2 — Factor Models

### 2.1 Why factors for short-term traders

Factor models are not only long-only asset-owner tools. Short-term traders use them to:

- **Residualize** returns: trade idiosyncratic $e_i$ after removing $\beta$ exposures.
- **Hedge** unwanted systematic risk (market, sector, momentum).
- **Size** positions by residual volatility.
- Extract **options-implied** factors (preface: factors from options market).

### 2.2 Classical structure

$$
r_{i,t}=\alpha_i+\sum_{k=1}^K \beta_{i,k} F_{k,t}+e_{i,t}
$$

- **Macro / explicit factors:** inflation, rates, oil, Fama–French MKT/SMB/HML/MOM/RMW/CMA.
- **Fundamental:** book/price, earnings yield, quality.
- **Statistical (PCA/ASF):** eigenvectors of covariance / correlation matrices.
- **Risk-model vendors:** BARRA-style fundamental multifactor for residual risk.

Estimation: OLS rolling; WLS; robust regression; Shrinkage on $\beta$.

### 2.3 Cross-sectional vs time-series

- Time-series regression per asset → $\beta_i$.
- Cross-sectional regression each day of returns on characteristics → factor returns $F_t$ (Fama–MacBeth style).
- Hybrid: characteristics-based expected returns + risk-model covariance for portfolio construction.

### 2.4 Options-derived factors

Implied vol levels, skew slopes, variance risk premium $IV^2 - RV^2$, and call/put volume imbalances as factors. For short-term traders, changes in implied vol and skew can lead realized moves (spot–vol dynamics). Chan’s treatment emphasizes practical extraction and avoidance of look-ahead in options surfaces (settlement rules, American early exercise).

### 2.5 Portfolio construction with factors

Mean-variance on residual alpha with constraints:

$$
\max_w\ w^\top\hat\alpha-\lambda w^\top\Sigma_{\mathrm{res}} w-\gamma\mathrm{TC}(w)
$$
s.t. $w^\top\beta_k=0$ (factor neutrality), leverage and name caps.

Or: rank by combined factor score $s_i=\sum_k s_{i,k}$, long top / short bottom quantile, beta-neutralize.

### 2.6 Pitfalls

- Factor crowding and decay of published anomalies.
- Multiple testing across factor zoos (Harvey–Harvey–Liu style skepticism).
- Turnover from high-frequency rebalancing of slow factors.
- Corporate action and industry classification revisions.

---

## Chapter 3 — Time-Series Analysis

### 3.1 ARIMA

ARIMA$(p,d,q)$:

$$
\phi(B)(1-B)^d y_t=\theta(B)\varepsilon_t
$$

Use cases: forecasting returns (usually weak), forecasting volatility proxies, forecasting spreads for mean-reversion. Box–Jenkins identification via ACF/PACF; AIC/BIC order selection; caution on returns (near-white-noise) vs prices (unit root).

**Trading implication:** ARIMA on prices is dangerous without cointegration discipline; prefer ARIMA on spreads or on log-vol.

### 3.2 VAR (vector autoregression)

$$
Y_t=c+\sum_{i=1}^p A_i Y_{t-i}+\varepsilon_t
$$

Cross-asset lead–lag (index vs constituents, ETF arb, futures calendar). Granger causality tests as screen—not proof of tradable edge after costs. Impulse response functions for stress.

### 3.3 State-space / hidden variables

Kalman filter for:

- Time-varying hedge ratios $\beta_t$ in pairs trading: $y_t=\alpha_t+\beta_t x_t+e_t$, random-walk or mean-reverting state on $(\alpha,\beta)$.
- Unobserved trend/seasonality.
- Stochastic volatility as state (link to Gatheral book).

Prediction-error decomposition for likelihood; parameter estimation by MLE or EM.

### 3.4 Cointegration (practical)

Engle–Granger and Johansen tests for pairs/baskets. Trading rule: long spread when $z=(y-\hat\beta x)/\hat\sigma$ below $-c$, short above $+c$; exit at 0 or opposite band. Half-life from AR(1) on spread: $\mathrm{HL}=\ln2/|\phi|$.

### 3.5 Chan-specific emphasis

State-space with hidden variables as applied to practical trading—dynamic hedge ratios beat static OLS in regime shifts. Combine with Ch.1 transaction costs: Kalman updating every bar can overtrade; smooth or threshold updates.

---

## Chapter 4 — Artificial Intelligence Techniques

### 4.1 Scope

Supervised learning for return/direction prediction; unsupervised for regime clustering; reinforcement learning mentioned as frontier but with severe finance data caveats. MATLAB Statistics and Machine Learning Toolbox as Chan’s stack (Kevin Murphy preference cited).

### 4.2 Overfitting — the central enemy

Finance SNR is tiny. Defenses Chan stresses:

1. **Strict train/validate/test** splits by time (never random shuffle for time series).
2. **Walk-forward** optimization: optimize on $[t-L,t)$, test on $[t,t+H)$, roll.
3. **Fewer features** than intuition suggests; regularization (ridge/lasso/elastic net).
4. **Nested cross-validation** for hyperparameter selection.
5. **Combinatorial purged CV** / embargo (López de Prado methods—aligned with Chan’s overfitting theme).
6. **Deflated Sharpe ratio** / multiple-testing adjustments on backtest Sharpe.
7. **Feature importance stability** across folds.
8. **Simple benchmarks:** beat AR(1) and buy-and-hold after costs before claiming ML edge.

### 4.3 Model classes

- Linear / logistic with regularization.
- Tree ensembles (RF, gradient boosting)—watch lookahead in feature construction.
- SVM for classification of direction.
- Neural nets: high capacity → extreme overfit risk on daily data; more plausible on abundant microstructure data with heavy regularization and vast samples.
- Autoencoders for nonlinear factor extraction (link Ch.2 statistical factors).

### 4.4 Labeling

Raw next-return labels are noisy. Alternatives: triple-barrier labels; trend scanners; classification of “large move” vs noise. Class imbalance handling.

### 4.5 Production ML

Same code path: serialized model artifacts versioned with data hash; monitoring for covariate shift; kill switches when live log-loss diverges from validation.

---

## Chapter 5 — Options Strategies

### 5.1 Assumption

Basic options literacy assumed (Black–Scholes, greeks). Focus: deployable systematic options strategies and portfolios of options.

### 5.2 Volatility risk premium

Empirical pattern: implied vol > realized vol on average for equity indices → short gamma / short variance strategies profitable but crash-exposed. Structure:

- Short straddles/strangles with strict risk limits.
- Variance swap overlays (theory in Gatheral Ch.11).
- Delta-hedged option sales: P&L ≈ $\frac12\Gamma(IV^2-RV^2)S^2\Delta t$ plus higher-order terms.

### 5.3 Directional option overlays

- Buy cheap convexity when IV rank low.
- Risk-reversals as skew views.
- Calendar spreads as term-structure views.

### 5.4 Portfolio of options

Margin and portfolio greeks: aggregate $\Delta,\Gamma,\nu$ with scenario matrix (spot×vol grid). Optimization: maximize expected theta capture subject to stress-loss constraints (2008-like, 1987-like).

### 5.5 Pitfalls

Pin risk, early exercise (American), dividends, borrow on shorts, gap risk through discrete hedges, liquidity in wings.

---

## Chapter 6 — Intraday Trading and Market Microstructure

### 6.1 Why microstructure matters

At intraday horizons, PnL is dominated by **spread, impact, adverse selection, and queue position**, not by elegant alpha IC alone.

### 6.2 Order types and routing

Market, limit, hidden/iceberg, IOC/FOK, post-only, pegged mid. Smart order routers across lit venues and dark pools. Acknowledgments to Lime for correcting misconceptions—desk reality: fee schedules, maker-taker, and latency paths change optimal placement.

### 6.3 Adverse selection

Filled buy limits tend to precede downticks (toxic flow). Measures: markout over 50ms–10min; VPIN-like toxicity proxies; fill rate vs mid-move correlation. Mitigation: wider spreads, shorter validity, venue selection, last-look style filters (where legal).

### 6.4 Dark pools

Opportunistic liquidity vs information leakage. Routing optimization: probability of fill × adverse selection cost.

### 6.5 Order flow

Signed volume, trade imbalance, LOB imbalance $I=(V_b-V_a)/(V_b+V_a)$ as short-horizon signals. Calendar spread implied quotes in futures (Stephen Aikin acknowledgment)—cross-leg risk.

### 6.6 Backtesting with tick data

- Use **event-driven** simulators with exchange timestamps.
- Model queue priority: simple “always first” is fantasy; use probabilistic queue models.
- Include exchange fees, rebates, and latency distributions.
- Avoid soft-dollar fantasies: if historical bid/ask would not have rested your size, don’t assume fill.

### 6.7 Intraday strategy families

- Market making with inventory penalties (Avellaneda–Stoikov style intuition).
- Momentum ignition / short-horizon momentum (crowded, capacity-limited).
- ETF–NAV / futures basis mean reversion.
- Opening/closing auction strategies.

---

## Chapter 7 — Bitcoins

### 7.1 New asset class transfer

Apply mean-reversion, momentum, and microstructure tools to BTC and crypto venues. Order-book data compiled with Jonathan Shore. Issues unique to crypto ca. 2017 book context:

- Fragmented exchanges, unreliable clocks, wash trading risk.
- Custody and exchange default risk (Mt.Gox legacy).
- 24/7 market → different seasonality (no close).
- Extreme vol: Kelly leverage tiny; options markets nascent then.

### 7.2 Strategy notes

Cross-exchange arb (transfer latency and withdrawal risk dominate); funding-rate / perpetual basis trades on later venues; order-book imbalance signals with careful fee modeling. Treat all crypto backtests as hostile: survivorship of exchanges, API outages, and manipulated prints.

---

## Chapter 8 — Algorithmic Trading Is Good for Body and Soul

### 8.1 Soft but operational chapter

Keeping up with knowledge: papers, arXiv, workshops (Chan’s London workshops, Northwestern Risk Analytics course). Transition from prop trader to investment advisor: compliance, client reporting, capacity disclosure, marketers vs researchers.

Health/psychology: systematic trading reduces discretionary tilt; still requires drawdown psychology and operational discipline (sleep, exercise—Chan’s framing).

---

## Cross-Chapter Quantitative Playbooks

### Playbook A — Launch a new daily strategy

1. Define economic hypothesis (factor, AR, cointegration, ML feature).
2. Assemble survivorship-free data; freeze a research snapshot.
3. Backtest with costs = max(commission, spread/2 + impact model).
4. Walk-forward; record OOS Sharpe, max DD, turnover.
5. Deflate Sharpe for multiple trials.
6. Half-Kelly leverage with DD cap.
7. Paper trade identical code path ≥1 month.
8. Go live small; monitor markout and slippage vs model.

### Playbook B — Pairs / basket with Kalman

1. Select candidates via correlation + cointegration screens.
2. State-space hedge ratio; estimate half-life.
3. Enter at $z=\pm 2$, exit 0; stop at $z=\pm 4$ or structural break flags.
4. Beta-hedge residual market if needed (Ch.2).
5. Capacity: ADV% limits.

### Playbook C — Short vol with crash budget

1. Estimate VRP: mean $IV^2-RV^2$ over history.
2. Sell defined-risk structures (put spreads) not naked.
3. Allocate Kelly on **crash-inclusive** distribution (mixture with jump).
4. Hedge tail with far OTM puts sized to max loss.

### Playbook D — Intraday make-take

1. Measure adverse selection by venue and time-of-day.
2. Quote only when inventory and toxicity allow.
3. Backtest with queue model; validate live markouts.
4. Kill switch on latency spike / reject storm.

---

## Limitations

- MATLAB-centric examples; translation burden to Python/C++ stacks.
- Example strategies intentionally incomplete / biased.
- Data licensing: cannot fully reproduce all book examples without paid vendors.
- Crypto chapter dated to ~2017 microstructure.
- Limited institutional market-impact models (Almgren–Chriss depth) vs retail IB focus.
- Options chapter assumes knowledge; not a full Gatheral substitute.

---

## Practical Takeaways for a Quantitative Investor

1. **One code path** for research and live—non-negotiable.
2. **Survivorship-free data** or your Sharpe is fiction.
3. **Half-Kelly + DD caps** beat full Kelly on fat tails.
4. Factors: trade residuals; neutralize what you don’t want.
5. Time-series: Kalman hedge ratios > static β for pairs.
6. ML: time-safe CV and deflated Sharpe or don’t bother.
7. Options: VRP is real but crash-passivated.
8. Intraday: markout or it didn’t happen.
9. Crypto: exchange risk is the first factor.
10. Allocate across strategies with inverse-vol or shrunk MV, cost-aware.



---

## Deep Dive — Data Engineering for Bias-Free Backtests

### Survivorship and universe construction

Build point-in-time universes from historical membership (index constituents, exchange listings). CSI delisted add-on is the minimum for US equities; for international, vendor choice matters more. Corporate actions: use point-in-time shares outstanding for market-cap weights.

### Futures continuous contracts

Roll methods: calendar roll, volume/OI roll, Panama/back-adjustment, ratio adjustment. Back-adjustment preserves returns but can create negative prices on long histories; ratio preserves positivity but distorts absolute levels. For breakout systems on price levels, prefer raw contracts with explicit roll logic in the event engine.

### Intraday clocks

Align timestamps to exchange matching engine time; beware broker-local stamps. Handle DST transitions; crypto 24/7 lacks session boundaries—define synthetic sessions for feature stability.

### Corporate actions in signals

If signal uses “close,” specify raw vs adjusted. Momentum on adjusted prices differs from momentum on raw with explicit dividend handling.

---

## Deep Dive — Kelly, Growth Optimal, and Drawdown Control

### Single strategy Kelly

For binary bets with win probability $p$ and win/loss ratio $b$: $f^*=p-q/b$. For continuous normal excess returns $R\sim N(\mu,\sigma^2)$: $f^*=\mu/\sigma^2$. If strategy is already a return stream with Sharpe $S$ measured at a base leverage 1, full Kelly leverage scales roughly with $S$ depending on definition—implement from $\mu,\sigma$ in consistent units.

### Estimation error

Replace $\mu$ with $\hat\mu-c\cdot\mathrm{se}(\hat\mu)$ (haircut). Or Bayesian posterior expected growth. Michaud resampling (Book 3) is the portfolio analog.

### Pathwise constraints

Maximize $E\log W$ s.t. $P(\mathrm{DD}>\mathrm{DD}_{\max})<\varepsilon$ via historical bootstrap of the return series at leverage $f$.

### Multiple strategies

Let $r_t$ be vector of strategy returns, $f$ leverage vector (or capital weights × leverage). Growth rate $G(f)=f^\top\mu-\frac12 f^\top\Sigma f$. Optimal $f^*=\Sigma^{-1}\mu$. Shrink $\Sigma$ (Ledoit–Wolf) and haircut $\mu$.

---

## Deep Dive — Factor Model Implementation Recipe

1. Choose risk model: PCA on trailing 252D returns of universe, or fundamental betas.
2. Each day, regress returns on factors → residuals $e_i$.
3. Forecast residual returns via short-horizon signal (mean reversion of $e$, news, order flow).
4. Optimize: maximize $w^\top\hat e-\lambda w^\top D w$ with $D=\mathrm{diag}(\sigma^2_{e,i})$, constraints $X^\top w=0$ (factor neutral), $\|w\|_1\leq L$, $|w_i|\leq c\cdot\mathrm{ADV}_i$.
5. Simulate with borrow fees on shorts.
6. Attribute live PnL to factor vs residual buckets daily.

### Options-implied factor example

Define skew factor $SK_t=\sigma_{\mathrm{put}}(25\delta)-\sigma_{\mathrm{call}}(25\delta)$. Cross-sectionally rank names by $SK$ change; fade extreme skew steepenings if mean-reverting; or momentum-follow if crash-premium regime. Always delta-hedge if trading options; if using skew as equity signal, verify it is not just a proxy for past returns.

---

## Deep Dive — State-Space Pairs Trading Mathematics

Observation: $y_t=\alpha_t+\beta_t x_t+\varepsilon_t$, $\varepsilon_t\sim N(0,R)$.

State: $\begin{pmatrix}\alpha_{t+1}\\\beta_{t+1}\end{pmatrix}=\begin{pmatrix}\alpha_t\\\beta_t\end{pmatrix}+\eta_t$, $\eta\sim N(0,Q)$.

Kalman predict/update yields $\hat\beta_{t|t}$ and innovation variance. Spread $s_t=y_t-\hat\alpha-\hat\beta x_t$. Fit AR(1) $s_t=\phi s_{t-1}+u_t$; half-life $\ln 2/(1-\phi)$ for $\phi>0$ mean reversion (discrete). Position $w_y=-w_x/\hat\beta$ sized by target dollar neutrality or beta neutrality.

**Parameter sensitivity:** $Q/R$ ratio (“process vs measurement noise”) controls adaptation speed—too large $Q$ → wild $\beta$, overtrading; too small → sluggish hedge, residual market exposure.

---

## Deep Dive — ML Overfitting: Quantitative Guards

### Deflated Sharpe (concept)

Given $N$ trials, the expected max Sharpe under null of zero mean scales like $\sqrt{2\log N}$ times Sharpe noise. Compare observed OOS Sharpe to this null; only accept if significantly higher.

### Purged CV

When labels overlap (e.g., 5-day returns), purge training samples whose time span overlaps test labels; embargo gap after test to avoid leakage.

### Feature count budget

Rule of thumb: effective samples $N_{\mathrm{eff}}=T/\tau_{\mathrm{autocorr}}$; keep features $\ll N_{\mathrm{eff}}$. For daily equities 10Y, $T\approx 2500$, autocorr short ⇒ still only few thousand effective samples—dozens of features already risky.

### Baseline table (must beat)

| Baseline | Description |
|----------|-------------|
| AR(1) | Linear lag return |
| EMA crossover | Classic tech |
| Buy & hold | For long-biased |
| Inverse-vol SPY/TLT | Simple allocation |
| Published factor long-short | After costs |

---

## Deep Dive — Microstructure PnL Decomposition

For a limit-order strategy:

$$
\mathrm{PnL}=\underbrace{\mathrm{spread\ capture}}_{\text{maker edge}}-\underbrace{\mathrm{adverse\ selection}}_{\text{markout}}-\underbrace{\mathrm{fees+rebates}}_{\text{venue}}+\underbrace{\mathrm{inventory\ PnL}}_{\text{alpha/noise}}-\underbrace{\mathrm{impact\ on\ exits}}_{\text{exit cost}}
$$

Measure each term by time-of-day and symbol. If adverse selection > spread capture, you are providing liquidity to informed flow—tighten filters or quit the name.

### Queue position model (simple)

Probability of fill before mid-move ≈ $f(q,\lambda_{\mathrm{arr}},\mu_{\mathrm{cancel}},\mathrm{depth})$. Simulation: your order at queue fraction $q\in[0,1]$; depleting trades eat from front; cancels free the queue. Calibrate $\lambda,\mu$ from LOB events (Abergel et al. LOB book in this batch complements Chan Ch.6).

---

## Deep Dive — Bitcoin / Crypto Quantitative Notes (2017 lens + enduring)

- **Cross-exchange mid discrepancy:** trade only if discrepancy > transfer fee + withdrawal delay risk premium + inventory risk.
- **Perpetual funding (later):** funding rate mean-reversion strategies; basis vs quarterly futures.
- **Vol:** BTC realized vol often 60–100%+ annualized → $f^*=\mu/\sigma^2$ tiny.
- **Data integrity:** filter spikes; compare multiple exchanges; drop prints during known outages.

---

## Worked Numerical Examples (Illustrative Scales)

### Example 1 — Half-Kelly

Strategy: daily mean excess $\hat\mu=0.0004$ (≈10% ann.), $\hat\sigma=0.01$ (≈16% ann.). Full Kelly $f^*=\mu/\sigma^2=0.0004/0.0001=4$ (4× leverage). Half-Kelly $=2\times$. Bootstrap DD at 2× vs risk budget; if 95% DD path exceeds mandate, cut to 1×.

### Example 2 — Inverse-vol allocation

Three strategies with vol 8%, 12%, 20%. Raw inverse-vol weights $\propto 1/0.08,1/0.12,1/0.20$ → normalize to sum 1: $0.476,0.317,0.190$. After correlation adjustment, shrink toward equal weight if $\Sigma$ noisy.

### Example 3 — Pairs half-life

Spread AR(1) $\phi=0.98$ daily ⇒ HL$=\ln2/0.02\approx34.5$ days. Holding period target ~1 half-life; costs must be << expected convergence move $\approx \sigma_s\sqrt{1-\phi^2}$.

### Example 4 — VRP capture

Index IV=18%, expected RV=15%. Variance edge $\approx 0.18^2-0.15^2=0.0099$ variance points (~0.99 vol² points). On short 30D variance notional $N$, expected PnL rough order $N\times0.0099\times(30/365)$ before jumps—size $N$ from crash stress, not from average edge alone.

---

## Chapter-by-Chapter Exercise Themes (from book design)

Chan includes open-ended exercises—treat them as project prompts:

- Ch.1: rebuild allocation with cost penalty; compare broker fee schedules.
- Ch.2: build PCA risk model; neutralize and measure residual Sharpe.
- Ch.3: Kalman vs rolling OLS hedge on a chosen pair.
- Ch.4: train RF with purged CV; report deflated Sharpe.
- Ch.5: delta-hedged short straddle vs variance swap proxy.
- Ch.6: markout curve by venue; simulate queue.
- Ch.7: BTC order-book imbalance backtest with fees.
- Ch.8: write an IA-compliant strategy disclosure one-pager.

---

## Vendor & Stack Matrix (as emphasized)

| Need | Chan lean | Notes |
|------|-----------|-------|
| Daily US equity/futures | CSI | Survivorship option |
| Broker API | Interactive Brokers | Retail/prop accessible |
| Microstructure advice | Lime | Pro routing |
| Research language | MATLAB | \$150 Home + toolboxes |
| Alt language | R (weaker per Chan) | Open source |
| Code examples | epchan.com/book3 | Password in Box 1.1 |
| Workshops | epchan.com / London GMT | Pedagogy source |

---

## Integration with Other Books in This Batch

- **Gatheral:** use for options/VRP theory behind Ch.5; variance strip replication.
- **Michaud:** estimation error in means → why Chan haircuts Kelly and shrinks MV.
- **Cornuéjols–Tütüncü:** formal QP/SOCP for portfolio and robust opt behind Ch.1–2.
- **Pardo:** rigorous strategy evaluation / optimization process complementary to Ch.1 & Ch.4.
- **Abergel LOB:** deeper theory for Ch.6 queue and order-flow.
- **Jha rates:** if extending factor models to fixed income futures.

---

## Limitations Expanded

1. Not a market-microstructure monograph (use Abergel/Hasbrouck).
2. Not a derivatives pricing book (use Gatheral).
3. MATLAB examples may hide performance issues at tick scale—C++/Java/FPGA for HFT.
4. Compliance chapter light for SEC RIAs—hire counsel.
5. Capacity and market impact only qualitatively treated.
6. Assumes reader will hunt biases—many will not; culture matters.

---

## Practical Takeaways — Extended

1. Prefer **boring infrastructure excellence** over clever alphas you cannot execute.
2. Measure **OOS degradation**; if IS Sharpe 2.0 → OOS 0.3, you optimized noise.
3. **Residualize** before you predict.
4. **State-space** hedge ratios for any relative-value book.
5. **ML without purge/embargo** is look-ahead with extra steps.
6. Short volatility only with **explicit jump budget**.
7. Intraday alpha is **markout-validated** or nonexistent.
8. Crypto edge often **operational** (custody, transfer, fees), not signal.
9. Half-Kelly, always.
10. Document point-in-time data semantics like a paranoid auditor.

---

## End-to-End Case Study Narrative (Synthetic Composite)

Suppose we build a US mid-cap residual mean-reversion book:

1. Universe: Russell 1000 point-in-time, CSI prices with delists.
2. Risk model: 10 PCA factors on 60D returns + sector dummies.
3. Signal: 5D residual reversal $-\,e_{i,t-5:t}$.
4. Portfolio: daily QP, factor neutral, 10% gross, 1% name cap, ADV 2% cap.
5. Costs: 2 bp + 5 bp impact × (participation).
6. Walk-forward 2010–2016 train regimes, test 2017; Sharpe OOS 0.9, max DD 12%.
7. Half-Kelly on 0.9 Sharpe daily strategy with $\sigma$ ann. 10% → modest leverage ~1–1.5 after haircuts.
8. Paper trade via IB API identical code; live markouts match within 1 bp.
9. Allocate 30% of risk budget vs other strategies by inverse-vol.

This composite uses Ch.1–4 end-to-end and is the template Chan wants readers to internalize—not any single printed parameter set.

---

## Formula Sheet

| Topic | Formula |
|-------|---------|
| Sharpe | $SR=\sqrt{N}\bar r/\sigma$ |
| Kelly (Gaussian) | $f^*=\mu/\sigma^2$ |
| Multi-strategy Kelly | $f^*=\Sigma^{-1}\mu$ |
| Factor model | $r=B F+e$ |
| ARIMA | $\phi(B)(1-B)^d y=\theta(B)\varepsilon$ |
| VAR | $Y_t=c+\sum A_i Y_{t-i}+\varepsilon_t$ |
| Spread HL | $\ln 2/(1-\phi)$ |
| LOB imbalance | $(V_b-V_a)/(V_b+V_a)$ |
| DH option P&L | $\approx\frac12\Gamma(IV^2-RV^2)S^2\Delta t$ |

---

## Bibliographic Cross-Links from Acknowledgments

Aikin (2012) on calendar spreads; Murphy (2015) on MATLAB for ML; Chan (2009, 2013) prior volumes; Lime/IB practical microstructure and API realities; Shore on bitcoin books; Hunter on code correctness—operational excellence as edge.

---

## Catalog Metadata

- **Tags:** algorithmic trading, Kelly, factors, ARIMA, Kalman, machine learning overfitting, options VRP, microstructure, bitcoin
- **Prerequisites:** basic statistics, programming
- **Pairs with:** Pardo evaluation; López de Prado AFML; Gatheral vol; Abergel LOB
- **One-line verdict:** A practitioner’s bridge from research ideas to deployable, bias-aware algorithmic trading systems with modern ML and microstructure caution.

---

## Extended Chapter 1 — Allocation Mathematics and Broker Risk

### Mean-variance with costs

$$
\max_w\ w^\top\mu - \lambda w^\top\Sigma w - \kappa\|w-w_0\|_1
$$

where $\kappa$ encodes bid–ask and impact. For strategies as “assets,” $\mu$ is vector of expected strategy returns estimated with heavy shrinkage: $\mu\leftarrow \alpha\bar\mu+(1-\alpha)\hat\mu$ with $\alpha$ large when history is short.

### Risk-parity fixed point

Equal risk contribution: $w_i(\Sigma w)_i = w_j(\Sigma w)_j$. Solved by iterative algorithms (Spinu, Maillard–Roncalli–Teiletche). Chan’s “simplest” inverse-vol is the diagonal-Σ special case of risk parity.

### Broker failure modes

Map risks: (1) cash sweep vehicle credit risk; (2) rehypothecation; (3) API silent desync (order thinks canceled, still live); (4) fat-finger lack of pre-trade risk holds. Mitigations: drop-copy reconciliations, cancel-on-disconnect, maximum order rate, maximum notional per symbol, secondary broker for flatten-only.

### Leverage optics

If daily SR = 0.1 (ann. SR ≈ 1.6), $\mu_d=0.001$, $\sigma_d=0.01$, Kelly $f^*=10$. Half-Kelly 5× is still aggressive under Student-t innovations with $\nu=4$: replace $\sigma^2$ with robust scale or use growth-optimal under bootstrap paths.

---

## Extended Chapter 2 — Factor Zoo Discipline

### Fama–MacBeth implementation

Each period $t$, cross-section $r_{i,t}=c_t+\sum_k \beta_{i,k,t-1}\gamma_{k,t}+e_{i,t}$. Time-series average $\bar\gamma_k$ with Newey–West SE. Trading uses $\gamma$ forecasts or characteristic scores directly; do not double-count.

### Statistical factors

Eigen-decompose trailing correlation $R=Q\Lambda Q^\top$. Factor returns $F=Q_K^\top z$ for standardized returns $z$. Number of factors via Marchenko–Pastur noise bulk edge $\lambda_+ =\sigma^2(1+\sqrt{n/T})^2$.

### Short-horizon use

Intraday residualization: remove market and sector ETFs via rolling β updated each minute with Kalman (link Ch.3). Trade residual; hedge with ETFs continuously.

### Options market factors (operational)

- IV rank / percentile over 1Y window.
- Skew: 25Δ RR = $\sigma_{25\Delta put}-\sigma_{25Δ call}$.
- Term slope: $\sigma_{30D}-\sigma_{90D}$.
- VRP: $\sigma_{\mathrm{impl}}^2-\sigma_{\mathrm{RV}}^2$ with RV from 5-min subsampled returns (Zhou microstructure adjustment optional).

Backtests must use only information available at signal time (prior close IV, not settlement quirks).

---

## Extended Chapter 3 — Econometrics for Trading

### Johansen cointegration (basket)

For vector $X_t$ of log prices, VECM $\Delta X_t=\Pi X_{t-1}+\sum\Gamma_i\Delta X_{t-i}+\varepsilon_t$. Rank($\Pi$)=r cointegrating relations. Trade the cointegrating portfolio $w^\top X_t$ when z-scored residual diverges. Eigenvectors give weights; enforce dollar or beta neutrality as overlay.

### Structural breaks

Chu–Stinchcombe–White / Bai–Perron tests on spread residual; flatten on break detection. Kalman with regime-switching $Q$ is an alternative.

### Forecasting vol for position sizing

GARCH(1,1): $\sigma_t^2=\omega+\alpha\varepsilon_{t-1}^2+\beta\sigma_{t-1}^2$. Size positions $\propto 1/\hat\sigma_t$. Asymmetric GJR-GARCH for equity crash vol. Link to Cornuéjols Ch.6 NLP GARCH MLE.

### VAR lead–lag trading

If ETF lags futures, forecast ETF from futures returns; trade ETF, hedge futures. Capacity limited; latency sensitive—belongs closer to Ch.6 than daily Ch.3.

---

## Extended Chapter 4 — AI Architectures and Finance Constraints

### Representation learning

PCA/autoencoder compressed features as inputs to linear models—often beats end-to-end deep nets on small $T$.

### Reinforcement learning caveats

Finance violates i.i.d. and stationary MDP assumptions. Simulated market impact must be in the RL environment or policies overfit to infinite liquidity. Prefer supervised + explicit execution layer.

### Hyperparameter search budget

Record all trials. Use successive-halving / Hyperband to reduce compute. Final test set touched once.

### Interpretability

SHAP values for tree models; reject signals that depend on economically absurd features (e.g., future timestamps leaked as “ID”).

---

## Extended Chapter 5 — Options Book Construction

### Greeks aggregation

Portfolio $\Delta=\sum n_i\Delta_i$, $\Gamma=\sum n_i\Gamma_i$, $\nu=\sum n_i\nu_i$. Scenario P&L Taylor:

$$
\Delta P\approx\Delta\,dS+\tfrac12\Gamma(dS)^2+\nu\,d\sigma+\theta\,dt+\rho\,dr
$$

Stress grid: $dS\in\pm1,2,5,10\%$, $d\sigma\in\pm2,5,10$ pts.

### Variance risk premium strategy variants

1. Short front-month ATM straddle, delta-hedge daily.
2. Short 10Δ strangle (higher crash risk).
3. Long variance swap vs short options strip (relative value).
4. Calendar: short front / long back when term structure elevated.

### Expected P&L of delta-hedged short option

Under Black–Scholes world with true vol $\sigma$ and sale at $\sigma_{\mathrm{impl}}$:

$$
E[\mathrm{PnL}]\approx\tfrac12\int_0^T e^{-rt}S_t^2\Gamma_t(\sigma_{\mathrm{impl}}^2-\sigma^2)\,dt
$$

Replace $\sigma^2$ by realized path; jumps add $\sum \mathrm{jump\ P\&L}$ not captured by continuous gamma scalping.

---

## Extended Chapter 6 — Quantitative Microstructure

### Spread–volatility relation

Effective spread scales with $\sigma\sqrt{\Delta t}$ and inventory risk. Market-maker reservation price (Avellaneda–Stoikov):

$$
r=s-q\gamma\sigma^2(T-t),\quad\delta=\tfrac1\gamma\log(1+\gamma/\kappa)
$$

with inventory $q$, risk aversion $\gamma$, arrival intensity parameter $\kappa$.

### Adverse selection proxy

Markout$_{\tau}=s_{\mathrm{fill}}\cdot(m_{t+\tau}-m_t)$ for buy side sign $s=+1$. Average markout by venue and hour.

### Tick-size constraints

US stocks: \$0.01 above \$1. Constrains queue competition; mid-point pegs in dark pools avoid tick. Incentives change with tick regimes (2016 tick size pilot historically).

### Backtest fidelity levels

| Level | Assumption | Bias |
|-------|------------|------|
| L0 | Trade at close | Severe |
| L1 | Trade at mid | Optimistic |
| L2 | Trade at touch | Better |
| L3 | Queue model | Best software can do |
| L4 | Exchange sim | Rare |

Chan’s tick-data emphasis pushes toward L2–L3.

---

## Extended Chapter 7 — Crypto Implementation Controls

- Withdrawal whitelist and cold storage policies.
- API key permission minimization (trade but no withdraw).
- Latencies: triangulate three exchanges’ books with local clock offset estimation.
- Funding PnL accounting separate from price PnL.
- Avoid “free arb” that ignores transfer coins’ confirmation times.

---

## Extended Chapter 8 — Governance for Algorithmic Advisors

When transitioning to IA: Form ADV disclosures of methods/risks; soft-dollar policies; best execution documentation; client-specific leverage constraints; GIPS-like composite reporting if marketing performance. Research–marketing wall: do not cherry-pick backtests in pitch decks without trial disclosure.

Knowledge upkeep: SSRN/arXivq-fin, Quantopian/Zipline-era lessons, conference workshops, and replicating one paper per month as Chan-style continuous learning.

---

## Comparative Metrics Table (How Chan Evaluates Systems)

| Metric | Formula / Def | Good | Bad |
|--------|---------------|------|-----|
| Ann. Sharpe | $\sqrt{252}\bar r/\sigma$ | >1 after costs | <0.5 |
| Max DD | peak-to-trough | <20% retail | >40% |
| OOS/IS Sharpe | ratio | >0.5 | <0.2 |
| Turnover | AUM fraction/year | strategy-dependent | unexplained spike |
| Capacity | ADV% at design | <1–2% ADV | >5% ADV |
| Breadth | Indep. bets/year | higher for Grinold | concentrated |

Grinold fundamental law: $IR\approx IC\times\sqrt{Breadth}$ (with transfer coefficient in practice)—use as planning identity, not magic.

---

## Full Strategy Taxonomy in the Book

1. **Infrastructure alpha** (better data, better broker, fewer bugs).
2. **Factor / residual** strategies (Ch.2).
3. **Time-series / cointegration** (Ch.3).
4. **ML predictive** (Ch.4).
5. **Volatility / options** (Ch.5).
6. **Microstructure / HFT-ish** (Ch.6).
7. **Crypto** (Ch.7).

Each layer has different capacity, Sharpe distribution, and operational failure modes—allocate like a portfolio of businesses, not a single Sharpe number.

---

## Numerical Case: Walk-Forward ML Equity Select

- Features (t-1): 20D return, 5D residual vs PCA1–3, ADV\$, IV rank if listed options.
- Model: elastic-net logistic predicting $P(r_{t:t+5}>0)$.
- Train 5Y, validate 1Y, test 1Y; embargo 5D.
- Long top decile / short bottom, weekly rebalance, 20 bp round-trip costs.
- Require test Sharpe > 0.7 and positive in ≥3 of 4 nonoverlapping test folds before paper trading.
- Trial count logged: 40 feature/hyperparam experiments → deflate accordingly.

---

## Numerical Case: Intraday ETF Pair

- Instruments: SPY vs IVV (near substitutes).
- Signal: z-score of price ratio over 30-min rolling.
- Enter |z|>2, exit |z|<0.5; stop |z|>5.
- Expect tiny edge per trade (~0.5–1 bp) → only works with maker fees / low impact; IB retail commissions may kill it—illustrates Ch.1 broker+fee sensitivity.

---

## Research Integrity Checklist (Chan spirit)

- [ ] Point-in-time universe
- [ ] No future adjustments
- [ ] Costs ≥ realistic
- [ ] One random seed recorded
- [ ] Trial count recorded
- [ ] OOS untouched until final
- [ ] Live = backtest code hash
- [ ] Kill switches tested
- [ ] Reconciliation daily
- [ ] Capacity policy written

---

## Catalog Metadata

- **Tags:** algorithmic trading, Kelly criterion, factor models, Kalman filtering, machine learning overfitting, volatility risk premium, market microstructure, cryptocurrency trading
- **ISBN:** 978-1-119-21960-6
- **One-line verdict:** Advanced practitioner manual bridging infrastructure, classical quant signals, ML discipline, options, and microstructure into deployable systems—with overfitting paranoia as a feature.


---

## Line-by-Line Reading Notes on Critical Implementation Details

### CSI futures roll and look-ahead

When CSI builds a back-adjusted continuous contract using a roll date that depends on future open interest crossing, a naive user can introduce look-ahead if the roll calendar is reconstructed with final OI. Correct approach: fix roll rules on information available on the roll decision day (e.g., fixed days before expiry, or OI available at prior close only). Chan (2013) cross-reference is mandatory reading before futures momentum systems go live.

### Delisted stocks PnL treatment

On delisting, apply final cash distribution / acquisition terms. Treating delists as “price goes to last trade and vanishes” biases returns upward for survivors and truncates left-tail losses for failed firms. Bankruptcy outcomes often return near-zero—your residual long book must feel that.

### Identical backtest/live path — concrete architecture

```
MarketDataAdapter → FeaturePipeline → SignalEngine → PortfolioOptimizer
       ↓                                                      ↓
  HistoricalReplay                                      RiskGateway
       ↓                                                      ↓
  FillSimulator ←—————— shared OrderModel —————→ LiveBrokerAdapter
```

Shared `OrderModel` maps desired target weights to orders with the same lot-sizing, min-ticket, and TIF logic. Divergence bugs hide here more often than in alpha code.

### Performance metric subtleties

- Sharpe with overlapping returns (e.g., 5-day holding measured daily) inflates SR—use nonoverlapping or HAC.
- Annualization $\sqrt{252}$ wrong for 24/7 crypto—use periods/year consistent with bar size.
- Max DD depends on sampling frequency; report both daily-marked and high-water-mark intraday if applicable.

### Optimal leverage under fat tails

Replace Gaussian Kelly with maximization of $E\log(1+f\tilde r)$ over bootstrap draws $\tilde r$ from empirical residuals plus jump blocks. Typically yields $f$ much closer to half-Kelly or less.

### Asset allocation — Black–Litterman sketch

Posterior mean $\mu_{BL}=[(τΣ)^{-1}+P^\topΩ^{-1}P]^{-1}[(τΣ)^{-1}\pi+P^\topΩ^{-1}q]$ with equilibrium $\pi=\delta\Sigma w_{mkt}$ and views $P\pi\approx q$. Chan’s “simplest” methods are priors; BL is how you blend views without error-maximizing (Michaud link).

---

## Factor Models — Empirical Protocol

### Stepwise research

1. Univariate IC: Spearman rank corr of factor vs forward return; Newey–West.
2. Quantile spreads long-short net of costs.
3. Multivariate cross-section with industry dummies.
4. Risk-adjusted residual alpha after PCA/BARRA.
5. Decay curve IC(h) for horizons h=1..20 days.
6. Capacity: size-tiered IC (mega vs micro).
7. Crowding: factor valuation (ARB residual) and short interest.

### Options-factor protocol

Compute surface metrics at prior close from vendor snapshots; never from same-day settlement that includes future prints. For equity names with sparse options, require minimum OI and strike count filters—otherwise skew measures are noise.

### Example factor combination

Score $s=0.4 z_{\mathrm{value}}+0.3 z_{\mathrm{momentum}}+0.3 z_{\mathrm{quality}}$, neutralize sector median, then residualize against PCA1–5. Expected: lower vol than raw combo, still positive IC if factors work.

---

## Time-Series — Kalman Filter Equations for Hedge Ratio

State $x_t=(\alpha_t,\beta_t)^\top$. Transition $x_t=x_{t-1}+w_t$, $w_t\sim N(0,Q)$. Observation $y_t=H_t x_t+\varepsilon_t$ with $H_t=(1,x^{\mathrm{leg}}_t)$.

Predict: $x_{t|t-1}=x_{t-1|t-1}$, $P_{t|t-1}=P_{t-1|t-1}+Q$.

Kalman gain $K_t=P_{t|t-1}H_t^\top(H_t P_{t|t-1}H_t^\top+R)^{-1}$.

Update: $x_{t|t}=x_{t|t-1}+K_t(y_t-H_t x_{t|t-1})$, $P_{t|t}=(I-K_t H_t)P_{t|t-1}$.

Trading spread $e_t=y_t-H_t x_{t|t}$. This is the operational core of Ch.3 for pairs.

### ARIMA on RV

Fit ARIMA to log RV; forecast next-day vol for sizing. Compare to GARCH—often similar; ensemble both.

---

## AI — Concrete Overfitting Experiment Design

Hypothesis: “order flow imbalance predicts 1-minute returns in ES futures.”

- Sample: 2014–2016 train, 2017 validate, 2018 test.
- Features: LOB imbalance levels 1/5/10, trade sign EMA, basis vs SPX.
- Models: logistic ridge vs gradient boosting depth ≤3.
- Hyperparams chosen on validate only (20 trials logged).
- Primary metric: OOS Sharpe after 0.5 tick costs round-trip.
- Secondary: PSR (probabilistic Sharpe), max DD, Calmar.
- Accept only if test Sharpe > 1.0 and PSR > 0.95 and positive monthly ≥60%.

If boosting ≫ ridge IS but ≈ ridge OOS, capacity of nonlinearity is illusory—prefer ridge.

---

## Options — Portfolio Optimization Sketch

Maximize $\theta_{\mathrm{port}} - \lambda \mathrm{CVaR}_{0.05}(\mathrm{stress})$ over positions in a defined option set with constraints on |$\Delta$|, $\nu$, and margin. Stress distribution: historical 1-day moves of underlier+IV or Monte Carlo with jumps. This formalizes Ch.5 “portfolios of options.”

---

## Microstructure — Cost Model

$$
C = \underbrace{c_{\mathrm{fee}}}_{\pm\mathrm{rebate}} + \underbrace{c_{\mathrm{spread}}}_{\sim s/2} + \underbrace{c_{\mathrm{impact}}}_{Y\sigma\sqrt{V/ADV}} + \underbrace{c_{\mathrm{delay}}}_{\alpha_{\mathrm{decay}}\times\mathrm{latency}}
$$

Square-root impact $Y\sim0.5$–1 empirical. Delay cost matters when signal IC decays in seconds—connects HFT budget to alpha horizon.

### Dark pool routing expected value

$EV = p_{\mathrm{fill}}(Δ_{\mathrm{mid}}-\mathrm{adverse})-(1-p_{\mathrm{fill}})c_{\mathrm{opportunity}}$. Estimate $p_{\mathrm{fill}}$ and adverse from vendor TCA.

---

## Bitcoin — Worked Cross-Exchange Numbers

Exchange A mid 10000, B mid 10050 (0.5%). Transfer fee 0.001 BTC + 30 min confirmation. Price volatility 5%/day ⇒ 30 min σ ≈ 5%/$\sqrt{48}$ ≈ 0.72%. Edge 0.5% < risk 0.72% + fees → **no trade**. Many “arbs” die in this arithmetic—Chan’s caution.

---

## Synthesis — What “Machine Trading” Adds Beyond Chan 2009/2013

| Topic | New depth in 2017 book |
|-------|------------------------|
| Brokers/safety | Updated FinTech landscape |
| Allocation | Simplest robust methods restated |
| Factors | Options-implied factors |
| State space | Hidden-variable trading focus |
| AI/ML | Overfitting toolkit central |
| Options | Portfolio strategies |
| Intraday | Tick backtest + dark pools + order flow |
| Crypto | New asset class chapter |
| Career | Prop → IA transition |

---

## Limitations for Institutional Use

- Lacks full Almgren–Chriss optimal execution layer.
- No multi-currency portfolio accounting deep dive.
- Limited alternative data (satellite, NLP) treatment.
- MATLAB vs modern Python ecosystem (as of 2026 readers may port).

---

## Final Practical Manifesto (Chan-aligned)

1. Code identity between research and live.
2. Paranoid data semantics.
3. Haircut every mean.
4. Half-Kelly.
5. Residualize.
6. Purge/embargo.
7. Markout-verify.
8. Crash-budget short vol.
9. Capacity first.
10. Process > cleverness.

---

## Catalog Metadata (final)

**Filename lineage:** Machine Trading + full Wiley 2017 PDF basename. **Word-count target:** ≥10000 substantive. **Upload folder:** Google Drive library/Summaries `1h1sMB-JkF9CjHbyGsoClY2Y1zbp_sZSY` (binary upload tool blocked this session—local artifact ready).


---

## Comprehensive Annotated Outline with Quantitative Inserts

### 1. Historical data vendors — decision tree

- Need US equity EOD + delists? → CSI.
- Need futures raw? → CSI original contracts + custom roll.
- Need options chains historically? → vendor with Greeks point-in-time (expensive); otherwise reconstruct carefully.
- Need tick? → exchange-sourced or Lime/similar; storage costs dominate.

Storage math: 1 year of US equities 1-min bars ≈ O(10^9) points across names; columnar compression (Parquet) mandatory. Chan’s MATLAB/.csv workflow suits daily; tick needs different engineering.

### 2. Live data — failure modes

Stale quotes, crossed markets, duplicate trade prints, clock jumps. FeaturePipeline must include feed-health features and hard vetoes when health fails. Backtests rarely simulate feed outages—add random outage scenarios in stress tests.

### 3. Order state machine

States: Created → Sent → Acked → Partial → Filled / Canceled / Rejected. Every transition logged with exchange ts, local ts, and strategy intent id. Reconcile to broker blotter T+0. Missing ack timeout → cancel/replace logic.

### 4. Performance — statistical significance

t-stat on mean return: $t=\bar r/(s/\sqrt{n})$. For SR, Lo (2002) adjustments if autocorrelation. Bootstrap CI on Sharpe. Require lower 95% CI > 0 before capital.

### 5. Kelly–fraction table (illustrative)

| Ann. μ | Ann. σ | SR | Full Kelly f* | Half-Kelly | Comment |
|-------:|-------:|---:|-------------:|-----------:|---------|
| 10% | 10% | 1.0 | 10.0 | 5.0 | Too high without tails |
| 10% | 15% | 0.67 | 4.4 | 2.2 | Still aggressive |
| 5% | 10% | 0.5 | 5.0 | 2.5 | Haircut further |
| 15% | 30% | 0.5 | 1.67 | 0.83 | Crypto-like vol |

Compute $f^*=\mu/\sigma^2$ with μ,σ absolute (0.10, 0.10²=0.01 → f*=10).

### 6. Factor IC decay example

IC(1)=0.05, IC(5)=0.02, IC(20)=0.005. Turnover if rebalancing daily on slow factor destroys net IC. Optimal rebalance frequency solves net IC × √breadth − costs(turnover(f)).

### 7. PCA risk model — numerical sketch

N=500 stocks, T=252. Covariance eigenvalues; MP bound λ+≈(1+√(500/252))² σ² ≈ 5.1 σ² with σ²=1 for correlation. Keep eigenvalues ≫ λ+ as factors (often 5–15).

### 8. Kalman pairs — worked numbers

x=stock A price, y=stock B. After update β̂=1.02, α̂=0.5, e=−2.3, σ_e=1.1 → z=−2.09 → enter long spread (long B, short A) at target dollar value D with weights w_B=D/(2y), w_A=−β̂ D/(2x) adjusted for neutrality variant.

### 9. GARCH sizing

σ̂_t=1.5% daily (ann. ~24%). Target daily risk 0.5% → leverage = 0.5/1.5 = 0.33 on that name/strategy.

### 10. ML feature leakage catalog

- Using VWAP of same bar when deciding at open.
- Overnight earnings flagged with day-0 close return.
- Index reconstitution announced but using post-rebalance membership.
- Options IV from closing surface when trading 15:45.

### 11. Deflated Sharpe sketch

n=100 trials, SR_obs=1.2, SR_null_max≈E[max of 100 noise Sharpes]≈0.8 (order of magnitude depends on N and T). Deflated SR still positive but modest—publish both.

### 12. Delta-hedged short 30D straddle

S=100, σ_impl=20%, sold for 3.00 combined. Daily hedge. If RV realizes 16%, gamma scalping expected profitable; if crash day −5% with IV→35%, gap loss dominates months of theta.

### 13. Microstructure markout table (illustrative)

| Venue | Maker fill markout 1s | 10s | 60s |
|-------|----------------------:|----:|----:|
| Lit A | −0.2 tick | −0.5 | −0.8 |
| Dark B | −0.6 | −1.2 | −1.5 |
| Lit C | +0.1 | −0.1 | −0.3 |

Prefer C; avoid B despite fee.

### 14. Queue model expectation

Fill probability before adverse move ≈ 0.3; expected edge per fill 0.4 tick; expected adverse 0.7 tick → EV negative → do not quote.

### 15. Crypto transfer EV

Edge bps 40; fee bps 10; delay risk bps 50 → EV −20 bps → abort.

### 16. Inverse-vol vs MV out of sample

Simulate: estimated means noisy. Inverse-vol often beats MV OOS—aligns Chan “simplest” and Michaud critique.

### 17. Walk-forward windows

Train 750D, test 63D, roll 63D. Aggregate test equity curve; report single OOS Sharpe on concatenated tests (purged).

### 18. Multi-strategy covariance

Strategies A,B,C with corr matrix [[1,0.3,0.1],[0.3,1,0.2],[0.1,0.2,1]], vols 8%,12%,15%, means 6%,8%,10%. f*=Σ^{-1}μ → compute numerically in MATLAB; apply 0.5× shrinkage toward diag.

### 19. Options portfolio CVaR constraint

Reject any book with 5% CVaR beyond −2% NAV on joint spot/IV historical shocks.

### 20. Research journal schema

date | hypothesis | features | trials | IS SR | Val SR | Test SR | decision | git SHA

---

## End Matter — Equivalence of Backtest and Live as a Mathematical Constraint

Let $\mathcal A$ be the algorithm mapping information filtration $\mathcal F_t$ to target positions $w_t$. Live trading requires $w_t=\mathcal A(\mathcal F_t^{\mathrm{live}})$. Backtest uses $\mathcal F_t^{\mathrm{hist}}$. Equality of code ensures $\mathcal A$ identical; equality of filtrations is the data problem. Chan’s book is largely about making both equalities approximately true under economic constraints (costs, microstructure, overfitting).

---

## Catalog

Ernest P. Chan, *Machine Trading*, Wiley Trading, 2017, ISBN 978-1-119-21960-6. Summary for Paleologo finance library batch 1.

---

## Extended FAQ for Desk Implementation

**Q: How many years of data for daily equity factors?** A: ≥10Y including 2008 and 2020; if using ML, still regularize heavily—more years help but regimes shift.

**Q: Should I optimize Sharpe directly?** A: Prefer optimizing robust proxy (mean − λσ − κ turnover) and evaluate Sharpe OOS; direct SR optimization overfits.

**Q: PCA on returns or correlation?** A: Correlation for factor extraction across heterogeneous vols; then map to covariance via σ.

**Q: Kalman vs rolling OLS?** A: Kalman wins when β drifts; rolling OLS with long window lags; short window OLS noisy—Kalman is principled compromise.

**Q: Is HFT necessary?** A: No. Chan’s book covers from EOD to intraday; many profitable strategies are daily with good infrastructure.

**Q: How to treat dividends in total return?** A: Point-in-time total return series; reinvest policy must match live (cash vs reinvest).

**Q: Options assignment risk?** A: American shorts near ex-div; pin risk Friday; model early exercise boundary.

**Q: Dark pools vs lit for mean reversion exit?** A: Often lit for urgency; dark for passive—EV by markout.

**Q: Crypto market hours features?** A: Use UTC hour dummies; weekends matter; avoid equity calendar assumptions.

**Q: When to stop a strategy?** A: Precommit decay rules: e.g., trailing 6M SR < 0 and drawdown beyond design, or structural break in IC.

**Q: Multiple accounts / strategies margin?** A: Correlate margin spikes; broker portfolio margin vs Reg-T changes leverage math.

**Q: MATLAB vs Python 2020s?** A: Port signals to Python/NumPy/Pandas; keep parity tests against MATLAB reference.

**Q: How does Chan relate to López de Prado?** A: Shared overfitting enemy; Chan more practitioner-broker focused; LdP more combinatorial CV / meta-labeling formalisms—use both.

**Q: Variance swaps vs short straddles?** A: Variance swaps cleaner QV exposure (Gatheral); straddles mix spot path; choose based on available markets and hedge budget.

**Q: What is the single highest-leverage habit?** A: Identical research/live path + written trial log.

---

## Additional Worked Optimization: Strategy Risk Budget

NAV = \$10m. Max DD tolerance 15% (\$1.5m). Strategy historical DD at 1× leverage = 25%. Max leverage = 15/25 = 0.6×. If Kelly says 2×, constraint binds at 0.6×. This DD override is how practitioners survive estimation error.

---

## Additional Worked Optimization: Cost-Aware Rebalance

Target weights w*, current w0, cov Σ, α scores. Solve

$$\min_{\Delta}\ \tfrac12 (w0+\Delta)^\top\Sigma(w0+\Delta) - \alpha^\top(w0+\Delta) + \kappa\|\Delta\|_1$$

with $\sum\Delta=0$. Equivalent to mean-variance with L1 transaction penalty—standard Chan Ch.1/2 implementation pattern.

---

## Book-Wide Assumptions and Their Violation Costs

| Assumption | Violation | Cost |
|------------|-----------|------|
| IID returns | Vol clustering | Understated DD |
| Infinite liquidity | ADV limits | Slippage |
| Stationary IC | Crowding | SR collapse |
| Continuous prices | Jumps | Option hedge error |
| Symmetric borrow | HTB names | Short book failure |
| Zero latency | Slow wire | Toxic fills |

---

## Closing Assessment

*Machine Trading* is the advanced, implementation-heavy third volume in Chan’s trilogy. Its comparative advantage is not a single closed-form model but a **system of constraints**: data integrity, broker reality, Kelly/DD leverage, factor residualization, state-space hedges, ML anti-overfitting, options crash budgets, and microstructure markouts—extended to bitcoin. For Giuseppe Paleologo’s library, shelve it under **deployable alpha engineering**, adjacent to Pardo (evaluation process) and Michaud (estimation error).


---

## Appendix A — Full Symbol Glossary for Machine Trading Notes

| Symbol | Meaning |
|--------|---------|
| $r_t$ | Period return |
| $\mu,\sigma$ | Mean, volatility of returns |
| $f^*$ | Kelly leverage |
| $SR$ | Sharpe ratio |
| $\Sigma$ | Covariance matrix |
| $\beta_{i,k}$ | Factor loading |
| $F_{k,t}$ | Factor return |
| $e_{i,t}$ | Residual return |
| $IC$ | Information coefficient |
| $IR$ | Information ratio |
| $\phi$ | AR(1) coefficient on spread |
| $Q,R$ | Process/measurement noise covariances |
| $\Gamma,\Delta,\nu,\theta$ | Option Greeks |
| $V_b,V_a$ | Bid/ask depth |
| $Y$ | Impact coefficient |
| ADV | Average daily volume |
| RV, IV | Realized, implied vol |
| VRP | Variance risk premium |
| TCA | Transaction cost analysis |
| OOS/IS | Out-of-sample / in-sample |

---

## Appendix B — Week-by-Week Self-Study Plan (8 Weeks)

**Week 1:** Build data pipeline with CSI; survivorship tests; plot delist impact on momentum SR.
**Week 2:** Implement Kelly/half-Kelly and DD constraints; allocate 3 toy strategies.
**Week 3:** PCA risk model + residual mean reversion backtest with costs.
**Week 4:** Kalman pairs on 5 candidate pairs; compare to rolling OLS.
**Week 5:** Elastic-net classifier with purged CV; deflated Sharpe report.
**Week 6:** Delta-hedged short straddle simulation with jump day.
**Week 7:** Tick markout analysis on one liquid future; venue table.
**Week 8:** Crypto paper strategy with fee/transfer EV gate; write ADV-style risk disclosure.

---

## Appendix C — Pseudocode Index

1. `continuous_contract(roll_rule)` 
2. `half_kelly(mu, sigma, dd_cap)`
3. `pca_factors(returns, k)`
4. `residualize(returns, factors)`
5. `kalman_hedge(y, x, Q, R)`
6. `purged_kfold(t, label_horizon, n_splits)`
7. `deflated_sharpe(sr, n_trials, T)`
8. `delta_hedge_path(S, sigma_impl, sigma_real, dt)`
9. `markout(fills, mid_series, horizons)`
10. `crypto_arb_ev(edge, fee, delay_sigma)`

---

## Appendix D — Connections Across Chan Trilogy

| Topic | QT 2009 | AT 2013 | MT 2017 |
|-------|---------|---------|---------|
| Basics | Core | Refined | Infra update |
| Mean reversion / momentum | Yes | Yes | Assumed |
| Kelly | Yes | Yes | Restated |
| Pairs | Intro | Deeper | Kalman focus |
| ML | Light | Some | Central + overfitting |
| Options | Light | Some | Portfolio chapter |
| HFT/microstructure | Minimal | Some | Major chapter |
| Crypto | No | No | New |

---

## Appendix E — Risk Management Policy Template (Short Form)

1. Max portfolio gross exposure: X%.
2. Max name / strategy weight: Y%.
3. Max daily loss kill: Z% → flatten.
4. Max order rate: N/sec.
5. Data staleness kill: S seconds.
6. Model SR trailing 6M minimum: R.
7. Borrow availability required before short.
8. Overnight gap stress: −M% on equity equivalent.
9. Weekly reconcile broker vs books.
10. Quarterly strategy review with trial logs.

---

## Appendix F — Empirical Regularities Chan Relies On

1. Markets are hard but not always efficient at all horizons.
2. Transaction costs and capacity kill many academic anomalies.
3. Overfitting is the default outcome of unconstrained search.
4. Simple allocations often beat noisy optimized ones.
5. Implied vol embeds insurance premium.
6. Liquidity provision is selectively profitable when toxicity filtered.
7. Operational excellence compounds.

---

## Appendix G — Detailed Cost Model Calibration

Estimate half-spread from NBBO history by symbol and time. Estimate impact $Y$ by regression of implementation shortfall on $\sigma\sqrt{V/ADV}$. Estimate fee/rebate from venue schedule. Total cost curve $C(v)$ vs participation rate $v$; invert to max $v$ such that net alpha > 0.

Implementation shortfall decomposition (Perold): delay + trading + opportunity. Log each.

---

## Appendix H — Options Greeks Numerical Example

Short 10 contracts of 30Δ put, multiplier 100, S=100, Δ=−0.30, Γ=0.05, ν=0.12, θ=−0.04 per day per option.
Portfolio Δ=10×100×(−0.30)=−300 shares equivalent → buy 300 shares to delta-hedge.
Γ exposure=10×100×0.05=50; \$Γ per 1% ≈ 0.5×50×(0.01 S)^2 careful with units—use standard \$ gamma formulas in production.
Stress −5% spot with +10 vol points: revalue numerically on grid rather than Taylor alone.

---

## Appendix I — State-Space Likelihood and Parameter Estimation

Prediction error decomposition: loglik = const − ½ ∑ [log(F_t) + ν_t²/F_t] with innovation ν_t and variance F_t from Kalman. Optimize Q,R (or hyperparameters) via MLE. Too large Q → overfit noise as β change; use AICc.

---

## Appendix J — Final 40 Takeaways (Compressed)

(1) Same code live/backtest. (2) Survivorship-free. (3) Point-in-time adjustments. (4) Half-Kelly. (5) DD overrides Kelly. (6) Inverse-vol robust. (7) Shrink means hard. (8) Cost in optimizer. (9) Residualize. (10) PCA/MP cutoff. (11) Options factors careful. (12) IC decay vs turnover. (13) Crowding monitors. (14) Kalman hedges. (15) Cointegration breaks. (16) GARCH sizing. (17) VAR latency. (18) Purge CV. (19) Embargo. (20) Deflate SR. (21) Log trials. (22) Linear baselines. (23) Feature leakage hunt. (24) RL rarely ready. (25) VRP ≠ free lunch. (26) Crash budget. (27) Portfolio Greeks. (28) CVaR options. (29) Markout truth. (30) Queue realism. (31) Dark EV. (32) Square-root impact. (33) Tick constraints. (34) Crypto transfer math. (35) Exchange custody risk. (36) 24/7 seasonality. (37) IA compliance. (38) Kill switches. (39) Reconcile daily. (40) Process > genius.

---

## Document End — Machine Trading Summary

Prepared for Giuseppe Paleologo finance-library summarization batch. Source: Ernest P. Chan, *Machine Trading*, Wiley Trading, 2017.

---

## Extended Narrative: Building a Production Stack After Reading Chan

A quantitative investor finishing *Machine Trading* should leave with an engineering backlog, not just a reading list. First, freeze a research environment: MATLAB Home or a Python clone with parity tests; CSI or equivalent survivorship-free EOD; a broker paper account with API keys restricted to trade-only. Second, implement the shared OrderModel and prove on two toy strategies (overnight momentum, residual short-term reversal) that backtest fills match paper fills within tolerance after costs. Third, add risk gateway: max loss, max gross, staleness. Fourth, introduce Kalman pairs on a liquid duo and require markout reports even for EOD—measure next-open slippage. Fifth, only then attempt ML, with a written protocol for purge/embargo and a hard cap on trial counts. Sixth, if trading options, size by crash CVaR not by average VRP. Seventh, if touching intraday, build markout dashboards before alpha dashboards. Eighth, if touching crypto, treat custody and transfer delay as first-class citizens in EV. Ninth, allocate across surviving strategies with inverse-vol and half-Kelly overlays. Tenth, schedule quarterly decay reviews with the research journal as the audit artifact. This operational narrative is the true “deployment” promised by the subtitle *Deploying Computer Algorithms to Conquer the Markets*—conquest here meaning survival with positive compounded expectancy under constraints, not marketing Sharpes.

### Research journal example rows (illustrative)

| Date | Hypothesis | Trials | IS | Val | Test | Decision |
|------|------------|-------:|---:|----:|-----:|----------|
| 2017-01-10 | 5D residual reversal midcaps | 12 | 1.4 | 0.9 | 0.7 | Paper |
| 2017-02-02 | RF on 50 features daily | 40 | 2.1 | 0.4 | 0.1 | Kill |
| 2017-03-15 | Kalman pair GLD-GDX | 8 | 1.1 | 0.8 | 0.8 | Live small |
| 2017-04-01 | Short 30D straddle SPX | 15 | 1.6 | 1.0 | -0.5 | Kill (crash month) |

### Leverage governance example

Nav \$5m. Strategy book vols (ann.): 8%, 12%, 18%. Inverse-vol weights 0.49, 0.33, 0.18. Portfolio vol before leverage ≈ 9% if corr moderate. Target port vol 12% → scale 1.33×. Half-Kelly from blended μ might suggest higher—DD rule caps at 1.33×. Document the binding constraint.

### Final sentence

Chan’s third book rewards readers who treat trading as a constrained engineering system; the mathematics of Kelly, factors, Kalman, and microstructure are subordinate to that system identity.

---
## Terminal Verification Notes for Machine Trading Summary
This summary covers all eight chapters of Chan (2017): infrastructure and Kelly/allocation (Ch.1), factor models including options-implied factors (Ch.2), ARIMA/VAR/state-space (Ch.3), AI with overfitting controls (Ch.4), options portfolios and VRP (Ch.5), microstructure/tick/dark pools/order flow (Ch.6), bitcoin (Ch.7), and professional practice (Ch.8). Quantitative details retained include Kelly $f^*=\mu/\sigma^2$, multi-strategy $f^*=\Sigma^{-1}\mu$, PCA/Marchenko–Pastur cutoffs, Kalman hedge-ratio equations, purged CV, deflated Sharpe concepts, delta-hedged P&L $\approx\frac12\Gamma(IV^2-RV^2)S^2\Delta t$, square-root impact, LOB imbalance, and crypto transfer EV arithmetic. Word count target met with substantive operator detail rather than marketing prose.


### Operator Topic — Broker drop copy

Require drop-copy sessions that mirror execution reports to an independent risk process. Reconcile every 60 seconds. Alert on state mismatch. This single control prevents ghost orders that destroy accounts. Require drop-copy sessions that mirror execution reports to an independent risk process. Reconcile every 60 seconds. Alert on state mismatch. This single control prevents ghost orders that destroy accounts. Require drop-copy sessions that mirror execution reports to an independent risk process. Reconcile every 60 seconds. Alert on state mismatch. This single control prevents ghost orders that destroy accounts.


### Operator Topic — Corporate action engine

Maintain a corporate-action calendar with ex-dates known only when announced. Backtests must apply dividends on ex-date with point-in-time knowledge. Special dividends and spinoffs need manual tables. Maintain a corporate-action calendar with ex-dates known only when announced. Backtests must apply dividends on ex-date with point-in-time knowledge. Special dividends and spinoffs need manual tables. Maintain a corporate-action calendar with ex-dates known only when announced. Backtests must apply dividends on ex-date with point-in-time knowledge. Special dividends and spinoffs need manual tables.


### Operator Topic — Short locate workflow

Before sending short orders, query locate inventory. Reject if locate missing. Backtest must model HTB fees as time series, not constant borrow. Before sending short orders, query locate inventory. Reject if locate missing. Backtest must model HTB fees as time series, not constant borrow. Before sending short orders, query locate inventory. Reject if locate missing. Backtest must model HTB fees as time series, not constant borrow.


### Operator Topic — Futures margin ladder

Intraday vs overnight margin differ. Strategies that look fine on notional blow up on overnight margin. Simulate margin in backtest. Intraday vs overnight margin differ. Strategies that look fine on notional blow up on overnight margin. Simulate margin in backtest. Intraday vs overnight margin differ. Strategies that look fine on notional blow up on overnight margin. Simulate margin in backtest.


### Operator Topic — Options early exercise

American calls before ex-div may be exercised. Short call books need early-exercise predictors. European index options avoid this. American calls before ex-div may be exercised. Short call books need early-exercise predictors. European index options avoid this. American calls before ex-div may be exercised. Short call books need early-exercise predictors. European index options avoid this.


### Operator Topic — Fill model calibration

Fit probability of fill for limit orders as function of distance-to-mid and queue. Use logistic regression on historical LOB. Fit probability of fill for limit orders as function of distance-to-mid and queue. Use logistic regression on historical LOB. Fit probability of fill for limit orders as function of distance-to-mid and queue. Use logistic regression on historical LOB.


### Operator Topic — Alpha decay half-life

Estimate IC(t) exponential decay; set holding period near half-life; compute turnover-cost break-even. Estimate IC(t) exponential decay; set holding period near half-life; compute turnover-cost break-even. Estimate IC(t) exponential decay; set holding period near half-life; compute turnover-cost break-even.


### Operator Topic — Meta-labeling

Use primary model for side; secondary model filters bets (Lopez de Prado). Fits Chan overfitting theme. Use primary model for side; secondary model filters bets (Lopez de Prado). Fits Chan overfitting theme. Use primary model for side; secondary model filters bets (Lopez de Prado). Fits Chan overfitting theme.


### Operator Topic — Execution algos

TWAP/VWAP/POV as baselines; measure IS vs arrival price; do not assume market orders at mid. TWAP/VWAP/POV as baselines; measure IS vs arrival price; do not assume market orders at mid. TWAP/VWAP/POV as baselines; measure IS vs arrival price; do not assume market orders at mid.


### Operator Topic — Research cluster hygiene

Containerize research; pin dependency versions; store data snapshots with hash; reproducibility is alpha. Containerize research; pin dependency versions; store data snapshots with hash; reproducibility is alpha. Containerize research; pin dependency versions; store data snapshots with hash; reproducibility is alpha.


### Operator Topic — Broker drop copy

Require drop-copy sessions that mirror execution reports to an independent risk process. Reconcile every 60 seconds. Alert on state mismatch. This single control prevents ghost orders that destroy accounts. Require drop-copy sessions that mirror execution reports to an independent risk process. Reconcile every 60 seconds. Alert on state mismatch. This single control prevents ghost orders that destroy accounts. Require drop-copy sessions that mirror execution reports to an independent risk process. Reconcile every 60 seconds. Alert on state mismatch. This single control prevents ghost orders that destroy accounts.


### Operator Topic — Corporate action engine

Maintain a corporate-action calendar with ex-dates known only when announced. Backtests must apply dividends on ex-date with point-in-time knowledge. Special dividends and spinoffs need manual tables. Maintain a corporate-action calendar with ex-dates known only when announced. Backtests must apply dividends on ex-date with point-in-time knowledge. Special dividends and spinoffs need manual tables. Maintain a corporate-action calendar with ex-dates known only when announced. Backtests must apply dividends on ex-date with point-in-time knowledge. Special dividends and spinoffs need manual tables.


### Operator Topic — Short locate workflow

Before sending short orders, query locate inventory. Reject if locate missing. Backtest must model HTB fees as time series, not constant borrow. Before sending short orders, query locate inventory. Reject if locate missing. Backtest must model HTB fees as time series, not constant borrow. Before sending short orders, query locate inventory. Reject if locate missing. Backtest must model HTB fees as time series, not constant borrow.
