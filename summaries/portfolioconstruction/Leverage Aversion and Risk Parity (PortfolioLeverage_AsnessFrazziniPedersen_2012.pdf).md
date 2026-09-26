# Leverage Aversion and Risk Parity

**Authors:** Clifford S. Asness, Andrea Frazzini, and Lasse H. Pedersen  
**Publication:** *Financial Analysts Journal*, Vol. 68, No. 1, January/February 2012, pp. 47–59  
**Affiliation note:** Authors affiliated with AQR Capital Management, which offers risk parity funds (editor’s note in the article)  
**Source PDF:** `PortfolioLeverage_AsnessFrazziniPedersen_2012.pdf`  
**Summary prepared:** 2026-09-23 (Scholar batch_2026-09-23_1)  
**OCR:** Not required; `pdftotext -layout` yielded clean extractable text (~8,640 words of source)

---

## 1. Problem and Motivation

Strategic asset allocation remains dominated by two folklore prescriptions: (i) hold the value-weighted market portfolio and lever or de-lever to taste (the CAPM two-fund separation result of Sharpe–Lintner–Mossin), or (ii) hold a fixed-mix 60/40 stock/bond portfolio. Risk parity (RP) has emerged among practitioners as a third approach. Its core claim is that traditional dollar-based allocations are *not* diversified when viewed through a risk lens: because equities are far more volatile than bonds, nearly all of the variation in a market or 60/40 portfolio is equity variation. RP therefore allocates so that each asset class contributes a similar amount of *risk*, which mechanically requires overweighting safer assets (bonds, credit) relative to their market-capitalization weights, and then applying leverage to restore desired expected return and volatility.

Asness, Frazzini, and Pedersen argue that the popular case for RP—(1) “diversify by risk, not dollars” and (2) long-horizon backtests showing RP outperformance—is intuitively appealing but theoretically incomplete. Equal risk weights are optimal only under a joint hypothesis about *expected returns*: roughly, that assets offer similar Sharpe ratios (or, more precisely, that the equity risk premium is not large enough to justify equity’s dominance of portfolio risk). Under the CAPM, risk premia are exactly such that the market is mean–variance efficient; an RP advocate must therefore explain *which* CAPM failure justifies overweighting low-risk assets. The authors supply that missing link by embedding RP in the theory of *leverage aversion* developed by Black (1972) and extended by Frazzini and Pedersen (2010): when some investors cannot or will not use leverage, they reach for expected return by overweighting high-beta assets; equilibrium then delivers higher risk-adjusted returns for safer assets. Investors who *can* apply leverage optimally overweight those safer assets—exactly what RP does across asset classes.

The paper’s contribution is therefore dual: (i) a clean theoretical justification that places RP inside an equilibrium model rather than as a free-standing heuristic, and (ii) broad empirical evidence across a long U.S. sample (1926–2010), a broad multi-asset sample (1973–2010), a global 11-country sample (1986–2010), and within-asset-class “betting against beta” evidence that the security market line is too flat both across and within asset classes.

---

## 2. Setup and Data

### 2.1 Portfolio constructions

Three competing allocations are compared throughout:

- **Value-weighted market portfolio:** asset classes weighted by total market capitalization, rebalanced monthly to maintain value weights.
- **60/40 portfolio:** 60% stocks / 40% bonds, rebalanced monthly to constant weights.
- **Risk parity (RP):** at each month-end $t$, set the (unnormalized) weight of asset class $i$ to the inverse of its volatility estimated from three years of monthly excess returns up to $t-1$:
  
$$
  w_{i,t}^{\text{raw}} = \frac{1}{\hat{\sigma}_{i,t-1}}, \qquad
  \hat{\sigma}_{i,t-1}^{2} = \text{Var}\bigl(r_{i,s}-r_{f,s};\; s\in[t-36,t-1]\bigr).
  
$$

  Two normalizations are used:
  - *Unlevered RP:* rescale weights to sum to one.
  - *Levered RP:* multiply by a constant so that *ex post* realized volatility matches that of the value-weighted benchmark (a clean volatility-matched comparison of Sharpe and alpha).

Notably, this simple RP construction does **not** use covariance estimates—only volatilities. Over the long sample the average unlevered RP allocation is about **15% stocks / 85% bonds**; as of June 2010 it was 14%/86%.

### 2.2 Three samples

**A. Long sample (1926–2010).** U.S. stocks (CRSP value-weighted) and U.S. Treasury bonds (CRSP). Average market weights: 68% stocks, 32% bonds.

**B. Broad sample (1973–2010).** Global/U.S. stocks (CRSP VW), U.S. Treasuries and other government bonds (Barclays), a rich credit complex (Barclays U.S. Corporate, Securitized, High Yield, Eurodollar, EM, 144A, CMBS, Emerged Bonds—with staggered start dates from 1976 to 2006), and commodities (S&P GSCI). Average market weights: stocks 58%, Treasuries/gov’t 15%, credit 18%, commodities 9%. Most recent (September 2010) weights shift toward credit (29%) and away from stocks (42%).

**C. Global sample (1986–2010).** Stocks (MSCI) and government bonds (J.P. Morgan Global Government Bond Index) in 11 countries covered by the JPM GBI: Austria, Belgium, Canada, France, Germany, Italy, Japan, Netherlands, Spain, United Kingdom, United States. Global portfolios are equity-cap weighted across countries.

Excess returns are above the U.S. one-month T-bill. Alphas are intercepts from time-series regressions of monthly excess returns on the value-weighted benchmark. Returns, alphas, and volatilities are reported as annual percentages; Sharpes are annualized.

### 2.3 Implementability via futures

When leverage is applied through futures, $F_t/F_{t-1}-1$ is already an excess return and no financing-rate assumption is needed. Results with futures are similar to cash-security results (Appendix), which is an important robustness check against the critique that RP’s edge is an artifact of assumed financing costs.

---

## 3. Model and Methods: Leverage Aversion

### 3.1 MPT, CAPM, and the empirical tangency portfolio

Modern portfolio theory (Markowitz 1952) says investors should hold combinations of the risk-free asset and the *tangency* portfolio (maximum Sharpe). The CAPM adds the equilibrium claim that the tangency portfolio *is* the market portfolio.

In the long sample of U.S. stocks and Treasuries (1926–2010):

| Asset | Avg. annual return | Volatility |
|-------|-------------------|------------|
| Stocks | 10.8% | 18.9% |
| Bonds | 5.2% | 3.4% |
| T-bills | 3.6% | — |

The *ex post* tangency portfolio puts **88% in bonds and 12% in stocks**—the opposite of the market’s average 68%/32% stock/bond mix. Because stocks have realized a *lower* Sharpe than bonds (0.35 vs 0.47 in excess-return terms in Table 2), any approximation of the market or 60/40 underperforms the tangency portfolio. This is a direct empirical rejection of the CAPM’s identification of market with tangency.

### 3.2 Equilibrium with leverage-averse investors

Following Black (1972) and Frazzini–Pedersen (2010): some investors want higher expected return than the tangency offers but will not (or cannot) borrow. They therefore overweight high-beta/risky assets relative to the tangency portfolio—e.g., hold 100% equities. Their demand elevates prices (compresses expected returns) of risky assets and depresses prices (raises expected returns) of safe assets. Equilibrium then has:

- Tangency portfolio that *overweights safer assets* relative to market weights.
- No agent holds the market; some overweight risk, some overweight safety and apply leverage.
- Investors who can lever earn compensation for bearing *leverage risk* through the relative pricing of securities.

RP is a practical approximation to this leverage-tolerant side of the market: equalize risk contributions across asset classes (a strong move toward overweighting safer assets), then lever to the desired volatility. The theory does *not* claim that exact parity is uniquely optimal—only that the direction of the tilt is equilibrium-consistent.

### 3.3 Hypotheses tested

1. Levered RP should deliver higher Sharpe than market and 60/40 when compared at matched volatility.
2. RP minus market (and RP minus 60/40) should have positive alpha vs the market.
3. The same pattern should appear in a broader multi-asset universe and internationally.
4. Within asset classes, high-beta securities should underperform low-beta on a risk-adjusted basis (security market line too flat)—out-of-sample confirmation that the across-asset-class RP result is not a fluke.

---

## 4. Empirical Results (with Numbers)

### 4.1 Long sample: U.S. stocks and bonds, 1926–2010 (Table 2, Panel A)

| Portfolio | Excess return | t(ER) | Alpha | t(α) | Vol | Sharpe |
|-----------|--------------|-------|-------|------|-----|--------|
| CRSP stocks | 6.71%* | 3.18 | — | — | 19.05% | 0.35 |
| CRSP bonds | 1.56%* | 4.28 | — | — | 3.28% | 0.47 |
| Value-weighted | 3.84%* | 2.30 | — | — | 15.08% | 0.25 |
| 60/40 | 4.65%* | 3.59 | — | — | 11.68% | 0.40 |
| RP, unlevered | 2.20%* | 4.67 | 1.39%* | 4.44 | 4.25% | **0.52** |
| RP (levered to VW vol) | 7.99%* | 4.78 | 5.50%* | 4.30 | 15.08% | **0.53** |
| RP − VW | 4.15%* | 2.95 | 5.50%* | 4.30 | 12.69% | 0.33 |
| RP − 60/40 | 3.34%* | 2.93 | 3.76%* | 3.33 | 10.31% | 0.32 |

Key takeaways:

- Unlevered RP has the highest Sharpe among unlevered mixes (0.52) but lower average excess return than 60/40 or market—exactly what a leverage-*constrained* investor might rationally avoid.
- Levered RP matches market volatility (15.08%) but more than doubles the market’s Sharpe (0.53 vs 0.25) and posts a highly significant alpha of **5.50%** per year ($t=4.30$).
- Long–short RP−market and RP−60/40 both have $t$-statistics near 3 on excess returns and alphas.

The cumulative-return chart (Figure 1) shows RP pulling far ahead of 60/40 and the market over 1926–2010 on a log scale. Critically, this is *not* merely a bond bull-market artifact: 1926–2010 includes a near round-trip in bond yields and a near doubling of equity valuation (Shiller 10-year P/E), i.e., a sample if anything biased *toward* equities—yet RP still wins.

### 4.2 Broad sample: stocks, bonds, credit, commodities, 1973–2010 (Table 2, Panel B)

| Portfolio | Excess return | Alpha | Vol | Sharpe |
|-----------|--------------|-------|-----|--------|
| Stocks | 5.96%* | — | 15.71% | 0.38 |
| Bonds | 2.72%* | — | 5.36% | 0.51 |
| Credit | 3.03%* | — | 6.63% | 0.46 |
| S&P GSCI | 3.10% | — | 19.24% | 0.16 |
| Value-weighted | 4.31%* | — | 10.10% | 0.43 |
| RP, unlevered | 3.39%* | 1.68%* ($t=2.65$) | 5.44% | **0.62** |
| RP (levered) | 6.15%* | 3.03%* ($t=2.52$) | 10.10% | **0.61** |
| RP − VW | 1.84% ($t=1.43$) | 3.03%* | 7.52% | 0.24 |

Again RP Sharpe (~0.61) dominates market (0.43). The alpha of levered RP vs VW remains significant. Commodity Sharpe is low (0.16) but commodities’ *beta* to the multi-asset market is much lower than equity’s because of low correlation—consistent with a flat empirical SML (Figure 5).

### 4.3 Global evidence: RP vs 60/40 by country, 1986–2010 (Table 3)

In every one of 11 countries, levered RP has a higher Sharpe than 60/40. Selected rows:

| Country | 60/40 ER | RP ER | RP−60/40 (pp) | t | 60/40 SR | RP SR |
|---------|----------|-------|---------------|---|----------|-------|
| United States | 4.79% | 7.43% | 2.64* | 2.13 | 0.51 | **0.78** |
| Japan | −2.94% | −0.09% | 2.85* | 2.27 | −0.23 | −0.01 |
| Canada | 4.38% | 6.03% | 1.65 | 1.71 | 0.42 | 0.58 |
| Global (VW) | 2.26% | 4.62% | **2.35*** | **2.42** | 0.24 | **0.52** |
| Global ex-U.S. | 0.28% | 2.11% | **1.84*** | **2.04** | 0.03 | 0.21 |

Pooled global and global-ex-U.S. differences are statistically significant. Country-level $t$-stats are often modest (small samples), but the *sign* is uniform—strong qualitative support.

### 4.4 Security market line across and within asset classes

Figure 5 (broad sample) plots average excess return against $\beta\times$ market excess return. The CAPM predicts a 45-degree line; the empirical SML is much flatter: bonds, credit, and GSCI plot *above* the CAPM line; stocks plot *below*. This is the across-asset-class analogue of Black–Jensen–Scholes (1972).

Within asset classes, Frazzini–Pedersen (2010) document the same flat SML in U.S. and global equities, Treasuries by maturity, corporate bonds, and futures. The paper treats this within-asset-class evidence as crucial *out-of-sample* confirmation: if the RP edge were a single draw of asset-class history, one would not expect the same low-beta / high-Sharpe pattern inside every major asset class.

### 4.5 Financing-cost robustness

Appendix B varies financing rates. The authors note that simulated levered-RP returns in the main tables do not deduct financing spreads or forced-deleveraging costs. At *modest* leverage those costs are small; at high leverage they can be material for large portfolios. Futures-based implementations sidestep much of this issue and preserve the qualitative ranking.

---

## 5. Limitations

1. **Leverage operational risk.** The theory assumes leverage is available at near-risk-free rates. Real leverage involves haircuts, margin calls, and procyclical funding (cf. Gârleanu–Pedersen 2011 on Law-of-One-Price violations). The paper flags this but does not fully price crisis deleveraging.
2. **Ex-post volatility matching.** Levered RP is scaled to match *ex post* VW volatility—convenient for Sharpe comparison but not a live trading rule. Live RP typically targets a *forward* volatility, introducing tracking-error vs the paper’s construction.
3. **Simple risk model.** Equal risk uses only volatilities, ignoring correlations. In crises, correlations among “diversifiers” spike; true risk parity (or risk budgeting with a full covariance) can behave differently.
4. **Author affiliation.** AQR markets RP products; the editor notes this. The evidence is transparent and multi-sample, but readers should treat the paper as both research and industry advocacy.
5. **Sample end in 2010.** Post-GFC and post-ZIRP bond behavior (and the 2022 bond–equity joint drawdown) are outside the sample. The leverage-aversion *mechanism* is not sample-dependent, but magnitudes are.
6. **Bond bull market concern.** The authors address this with the 1926–2010 round-trip in yields; still, a quant should re-estimate with post-2010 data before sizing an RP sleeve.

---

## 6. Practical Takeaways for a Quant Investor

1. **RP is not “free diversification.”** It is a *view* that Sharpes of safer assets exceed what CAPM implies—equivalently, a bet that the SML is too flat. Size the bet as you would any factor: with an equilibrium story (leverage aversion) and cross-sectional confirmation (BAB within asset classes).
2. **Leverage access is the scarce resource.** The RP premium accrues to investors who *can* lever (futures, swaps, prime brokerage) while constrained investors (many mutual funds, some pensions) are forced into high-beta concentration. If your mandate forbids leverage, you cannot harvest the premia the theory identifies; you may even be on the other side.
3. **Implementation hierarchy.** Prefer (i) futures overlays for capital efficiency and clean excess returns, (ii) volatility targeting with *ex ante* risk models that include correlation stress, (iii) explicit financing and gap-risk budgets. Do not treat Appendix-style zero-spread leverage as live P&L.
4. **Within-asset-class complement.** Pair across-asset RP with within-asset “betting against beta” / low-risk anomalies. The paper’s strongest epistemic claim is that the same mechanism operates at both levels.
5. **Benchmarking.** Compare RP to 60/40 and to a multi-asset market at *matched volatility*, and report alpha vs the market—not just cumulative wealth charts. The Table 2 $t$-stats ($>2$ on alpha) are the right reporting template.
6. **When RP can fail.** If the equity premium structurally rises enough to justify equity’s risk share, or if leverage becomes prohibitively expensive/procyclical exactly when RP needs to rebalance, the historical edge compresses. Monitor: (a) relative Sharpes of bonds/credit vs equities, (b) funding spreads and futures basis, (c) realized correlation of the RP sleeve with equity drawdowns.

---

## 7. Equations Worth Keeping on a Desk Card

**Inverse-vol RP weights (monthly):**

$$
w_{i,t} \propto \hat{\sigma}_{i,t-1}^{-1}, \qquad
\sum_i w_{i,t}=1 \text{ (unlevered)} \quad\text{or}\quad
\sigma\!\left(\sum_i w_{i} r_{i}\right)=\sigma_{\text{VW}} \text{ (levered)}.
$$

**Alpha test:**

$$
r^{\text{RP}}_{t}-r_{f,t} = \alpha + \beta\bigl(r^{\text{VW}}_{t}-r_{f,t}\bigr)+\varepsilon_{t}.
$$

Reject $\alpha=0$ at conventional levels in both long and broad samples ($t=4.30$ and $t=2.52$).

**Leverage-aversion prediction (informal):** safer assets have higher Sharpe than riskier assets ⇒ tangency overweight safe ⇒ unconstrained investors lever a safe-heavy portfolio.

---

## 8. Bottom Line

Asness–Frazzini–Pedersen replace the slogan “diversify by risk” with an equilibrium theory: leverage aversion flattens the SML, so risk-adjusted returns accrue to safer assets, and investors who can lever should overweight them. Empirically, a simple inverse-volatility RP portfolio dominates the market and 60/40 on Sharpe and alpha in U.S. (1926–2010), multi-asset (1973–2010), and global (1986–2010) samples, with consistent within-asset-class evidence. For a quant allocator, RP is best treated as a *levered low-risk / flat-SML* strategy with a coherent economic engine—not as a model-free improvement on Markowitz.

---

## 9. Deeper Discussion of the Equilibrium Mechanism

The CAPM’s two-fund separation result is fragile once a leverage constraint is introduced for even a subset of agents. Formally, if unconstrained agents solve

$$
\max_w \; w'\mu - \frac{\gamma}{2} w'\Sigma w
$$

while constrained agents solve the same problem subject to $1'w \le 1$ (no borrowing), market clearing requires that the aggregate demand equal the market portfolio. Constrained agents’ demand is tilted toward assets with high $\mu_i/(\Sigma w)_i$ among the feasible unlevered set—typically high-beta assets. Unconstrained agents then clear the market by holding the residual, which is short high-beta and long low-beta, financed with leverage. The resulting equilibrium expected returns satisfy a security market line that is flatter than the CAPM line: $\mathbb{E}[R_i]-R_f = \alpha_0 + \alpha_1\beta_i$ with $\alpha_1 < \mathbb{E}[R_m]-R_f$ and often $\alpha_0>0$.

This is isomorphic to Black’s (1972) zero-beta CAPM when the zero-beta rate exceeds the risk-free rate because of borrowing restrictions. Frazzini–Pedersen (2010) operationalize the idea with margin requirements that are tighter for high-volatility assets, generating the Betting-Against-Beta factor. Asness–Frazzini–Pedersen’s contribution is to recognize that *across asset classes*, bonds play the role of the low-beta asset and equities the high-beta asset, so RP is the natural strategic-allocation expression of the same force.

### 9.1 Why equal risk is a useful approximation

Exact mean–variance optimality would use

$$
w^\star \propto \Sigma^{-1}\mu,
$$

which requires estimates of both $\mu$ and $\Sigma$. Under the leverage-aversion null that Sharpe ratios are roughly equalized (or that $\mu \propto \sigma$ more than CAPM allows), inverse-volatility weighting

$$
w_i \propto \sigma_i^{-1}
$$

is a first-order approximation to risk budgeting when correlations are similar. When correlations differ materially—e.g., commodities vs credit—full risk-parity (equal marginal risk contributions $w_i(\Sigma w)_i$) is preferable. The paper’s simple rule is deliberately stripped down to isolate the economic mechanism; a production system should upgrade the risk model while preserving the safe-asset overweight.

### 9.2 Connection to other leverage and liquidity phenomena

The authors situate leverage aversion alongside related work: Gârleanu–Pedersen (2011) on margin-based asset pricing and Law-of-One-Price violations; Ashcraft–Gârleanu–Pedersen (2010) on central-bank lending facilities; Brunnermeier–Pedersen (2009) on liquidity spirals. The common theme is that funding constraints distort relative prices. RP’s historical edge is, in this reading, compensation for supplying the leverage that constrained investors will not supply—and for bearing the associated funding risk.

---

## 10. Numerics an Allocator Should Replicate

Before allocating capital, a quant desk should reproduce at least:

1. **Long-sample RP vs VW vs 60/40** monthly Sharpes and Newey–West $t$-stats on $\alpha$.
2. **Rolling three-year inverse-vol weights** and the implied leverage path (how much notional vs NAV).
3. **Futures-only implementation** with roll costs and roll yield separated from spot.
4. **Stress overlay:** 2008 and 2022 path dependence—correlation of RP P&L with equity and with funding spreads.
5. **Within-asset BAB** in the same sample as a joint test of the mechanism.

Target diagnostics: RP Sharpe gap vs 60/40 of order 0.1–0.3 annualized historically; alpha $t>2$ in long samples; leverage typically 1.5–3× for volatility matching depending on the bond share.

---

## 11. Relation to Sibling Papers in This Batch

- **Jagannathan–Ma (2003):** shows that *no-short-sale constraints* shrink covariance estimates and improve out-of-sample risk. RP’s overweight of bonds is a different constraint-driven phenomenon (leverage constraints on *other* investors), but both papers teach that institutional constraints reshape efficient frontiers.
- **DeMiguel–Garlappi–Uppal (2009):** documents that $1/N$ beats optimized mean–variance out of sample. RP is *not* $1/N$ in dollar space; it is closer to $1/N$ in *risk* space. The estimation-error critique still applies to fancy RP variants that optimize expected returns.
- **Gârleanu–Pedersen (2013):** optimal dynamic trading with alpha decay and costs—relevant when implementing RP overlays and BAB with futures, where signals and costs interact.

---

## 12. Concise Verdict

Leverage aversion supplies the missing equilibrium foundation for risk parity. The empirical case—long U.S., broad multi-asset, global country-by-country, and within-asset-class flat SMLs—is unusually coherent for a strategic-allocation paper. Implement RP as a leveraged, risk-balanced, low-beta overweight with explicit funding-risk management; do not confuse it with an unlevered 15/85 stock/bond mix, which has high Sharpe but insufficient expected return for most institutional targets.

---

## 13. Detailed Walk-Through of Figure 2 (Efficient Frontier)

Figure 2 is the pedagogical heart of the paper. Plot average annual return against annual volatility for U.S. stocks and Treasuries, 1926–2010. The hyperbola of stock–bond mixes has:

- Left vertex near bonds: ~5.2% return, 3.4% vol.
- Right end at stocks: ~10.8% return, 18.9% vol.
- 60/40 sits on the hyperbola between them.
- Value-weighted market sits *inside* the hyperbola (time-varying weights) and far to the right of the *ex post* tangency (88% bonds / 12% stocks).
- Unlevered RP sits near the tangency on the hyperbola.
- Levered RP is the ray from the risk-free rate through unlevered RP, extended to match market volatility—visually above and left of the market point, illustrating a superior Sharpe.

An unconstrained mean–variance investor who can borrow at $r_f$ prefers points on the capital market line through the tangency (approximately RP). A leverage-*averse* investor who wants stock-like expected returns but refuses to borrow chooses points on the hyperbola to the right of tangency—concentrating in equities. Those choices are individually rational given the constraint and collectively distort prices.

### 13.1 Arithmetic of risk contribution

For a two-asset portfolio with weights $w_s, w_b$ and correlation $\rho$,

$$
\sigma_p^2 = w_s^2\sigma_s^2 + w_b^2\sigma_b^2 + 2w_s w_b\rho\sigma_s\sigma_b.
$$

Equity’s risk contribution is $w_s\partial\sigma_p/\partial w_s$. With $\sigma_s\approx 19\%$, $\sigma_b\approx 3.5\%$, even a 60/40 dollar mix assigns the large majority of variance to equities. Equal risk contribution requires roughly

$$
w_s\sigma_s \approx w_b\sigma_b \implies \frac{w_s}{w_b}\approx\frac{\sigma_b}{\sigma_s}\approx\frac{1}{5},
$$

i.e., order 15–20% equity—matching the paper’s average unlevered RP weights. This calculation makes precise why “balanced dollars” are unbalanced risk.

---

## 14. Statistical Inference Details

The paper’s primary inference tools:

1. **Time-series alpha** of RP excess returns on VW excess returns; $t$-stats reported in Table 2 (long-sample levered RP: $t_\alpha=4.30$; broad: $t_\alpha=2.52$).
2. **Long–short portfolios** RP−VW and RP−60/40: excess-return $t$-stats 2.95 and 2.93 (long sample).
3. **Country panel**: individual-country $t$-stats often <2, but pooled global and global-ex-U.S. differences significant at 5% ($t=2.42$ and $2.04$).

A careful reader should also ask about Newey–West lags (business-cycle persistence of bond and equity premia) and about multiple testing across three samples. The within-asset-class BAB evidence from the companion paper substantially raises the bar for a pure data-mining explanation.

---

## 15. Implementation Cookbook (Production)

**Step 1 — Universe.** Choose asset-class futures or total-return indices with reliable financing: equity index futures, Treasury futures / swaps, credit CDX or cash with repo, commodity futures (GSCI or equally risk-weighted commodities).

**Step 2 — Risk model.** Estimate $\hat{\sigma}_i$ on a trailing window (paper: 36 months). Prefer EWMA or realized-vol with floors/caps. Optionally replace inverse-vol with ERC using a shrunk correlation matrix (Ledoit–Wolf).

**Step 3 — Target volatility.** Set $\sigma^\star$ (e.g., 10% annualized to match a multi-asset market, or 12% to match 60/40). Scale notional:

$$
L_t = \frac{\sigma^\star}{\hat{\sigma}\!\left(\sum_i w_{i,t}r_i\right)}.
$$

**Step 4 — Leverage & funding.** Prefer exchange-traded futures; monitor variation margin and basis. Maintain a cash buffer sized to historical margin spikes (2008, 2020).

**Step 5 — Rebalance.** Monthly as in the paper, or band-based when risk contributions drift. Account for transaction costs explicitly (see Gârleanu–Pedersen 2013 for optimal speed).

**Step 6 — Risk overlay.** Kill switches on funding stress (TED, CP–Tbill, futures basis) and on realized correlation breakdowns. RP can lose to 60/40 for multi-year stretches when equity Sharpes dominate.

**Step 7 — Attribution.** Decompose P&L into: (i) unlevered risk-balanced mix, (ii) leverage scaling, (iii) financing/roll, (iv) rebalance timing. The economic premium should show up primarily in (i)+(ii).

---

## 16. What Would Falsify the Thesis?

- Sustained period where equity Sharpe ≫ bond/credit Sharpe *and* high-beta assets outperform low-beta within equities and credit—joint failure of flat SML.
- Structural removal of leverage constraints (universal access to cheap leverage) compressing the premium.
- Funding markets that systematically punish levered safe-asset holders more than the premium compensates (a state-dependent negative premium).

Absent those, the paper’s recommendation stands: if you can lever prudently, do not hold the market; hold a safer mix and lever it.

---

## 17. Final Quantitative Snapshot

| Metric | Long sample | Broad sample | Global pooled |
|--------|-------------|--------------|---------------|
| RP Sharpe | 0.53 | 0.61 | 0.52 |
| VW / 60/40 Sharpe | 0.25 / 0.40 | 0.43 / — | — / 0.24 |
| Levered RP alpha vs VW | 5.50% (t=4.30) | 3.03% (t=2.52) | — |
| Avg unlevered stock weight | ~15% | risk-balanced multi-asset | country-level RP |

These magnitudes—Sharpe gaps of 0.1–0.3 and alphas of 3–5.5% at market volatility—are large enough to matter for strategic allocation, yet not so large as to suggest uncorrected look-ahead or costless leverage. That combination is what makes the paper durable for practitioners.
