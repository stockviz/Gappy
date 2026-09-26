# On the Increasing Importance of Industry Factors

**Authors:** Stefano Cavaglia; Christopher Brightman; Michael Aked (Brinson Partners, Chicago)  
**Date:** March 21, 2000 (accepted FAJ; published *Financial Analysts Journal*)  
**Full title:** On the Increasing Importance of Industry Factors: Implications for Global Portfolio Management  
**Original file:** `[Cavaglia, Brightman, Aked] - On the Increasing Importance of Industry Factors 2000.pdf`  
**Drive file_id:** `0B-6kBz0I0dMsOXpxVVF6NzI4NlU`

---

## 1. Problem and Motivation

Classic literature (Lessard 1974/76; Solnik 1974; Grinold–Rudd–Stefek 1989; Beckers et al. 1992, 1996; Heston–Rouwenhorst 1994/95) concluded **country factors dominate industry factors**. Traditional top-down managers therefore prioritize country allocation.

Globalization forces—GATT, EC/NAFTA/ASEAN, EMU coordination, cross-border M&A—may raise global industry factors’ importance. Freiman (1998): European market correlations tripled mid-1970s to 1996, threatening country-allocation alpha. Brinson (1998) and Weiss (1998) advocate global industry strategy.

Cavaglia–Brightman–Aked re-estimate a Heston–Rouwenhorst-style model on a **broader, finer** universe and show industries have grown to **dominate** countries by the late 1990s, with industry diversification now offering greater risk reduction.

---

## 2. Setup and Data

- **Countries:** 21 MSCI World Developed Markets.
- **Industries:** FT/S&P **36** industry national total-return indices (380–425 country–industry portfolios).
- **Sample:** weekly local returns Wed–Wed, **1986-01-01 to 1999-11-03**; excess over local 1M Eurodeposit (DRIFACS)—i.e., **currency-hedged** from any DM investor’s view (Singer–Karnosky).
- Contrast Griffin–Karolyi (includes EM—may inflate countries); Rouwenhorst 1999 (Europe only, 7 coarse industries).

### Table 1 — Country excess returns (local, annualized geo mean / vol)

Selected: Finland 16.3%/25.8%; Sweden 11.9%/22.4%; US 10.6%/15.3%; Netherlands 10.5%/16.6%; Hong Kong 10.7%/28.6%; Japan 0.6%/20.6%; New Zealand −4.0%/20.3%; Austria 0.5%/20.6%. Cap weights: US 40.9%, Japan 28.3%, UK 10.1%, France 3.1%, Germany 3.7%.

### Table 2 — Global industry excess returns

Bus Services/Comp Software 16.5%/21.4%; Health/Pers Care 11.8%/15.6%; Electronics 8.6%/22.1%; Oil 7.8%/14.6%; Precious Metals −3.7%/23.6%; Heavy Eng/Ship −0.6%/23.9%; Commercial Banks 4.7%/19.7%. Cap weights: Commercial Banks 12.4%, Utilities 10.4%, Oil 5.8%, Health 7.2%, etc.

Foreign sales / total sales for MSCI World: 24% (1988) → 31% (1998). Intra-sector cross-border M&A: 51% (1989–93) → 64% (1994–99Q1).

---

## 3. Model and Methods

Heston–Rouwenhorst dummy model on local excess returns:

$$
R_i(t)=A(t)+\beta_{j(i)}(t)+\gamma_{k(i)}(t)+\varepsilon_i(t)
$$

WLS with cap weights; constraints:

$$
\sum_j W_j\beta_j=0,\quad\sum_k V_k\gamma_k=0
$$

⇒ A = world cap-weighted return.  
A+β_j = geographically diversified industry portfolio.  
A+γ_k = industrially diversified country portfolio.

Country index decomposition:

$$
R_k=A+\gamma_k+\sum_j Z_{jk}\beta_j
$$

**MAD (Rouwenhorst):**

$$
\mathrm{MAD}_I(t)=\sum_j W_j|\beta_j(t)|,\quad
\mathrm{MAD}_C(t)=\sum_k V_k|\gamma_k(t)|
$$

Perfect-foresight tilt opportunity measure. Plot 52-week moving averages.

Also: factor vols; cap-weighted country/industry factor correlations; Solnik-style diversification charts; max Sharpe portfolios on factor histories.

---

## 4. Empirical Results

### 4.1 Table 3 — Pure factor means and vols (annualized)

**World A:** full sample mean 6.6%, vol 13.5%. Subperiod 12/95–11/99 mean 14.3%, vol 14.3%.

**Industry pure means (full):** BusServ/Software **+7.7%**; Electronics +3.3%; Health +2.5%; Precious Metals **−9.3%**; Aerospace −6.1%; Non-oil energy −5.6%; Real Estate −4.1%.

**Country pure means (full):** Finland **+8.4%**; Hong Kong +5.4%; Sweden +5.1%; Netherlands +3.6%; US +3.2%; Japan **−5.1%**; New Zealand **−10.0%**; Austria −4.8%.

**Vols:** cap-weighted industry factor vol 9.7% vs country 11.6% (full). Late subperiod 12/95–11/99: industry **10.9%** vs country **9.8%** — industries now *more* volatile on this aggregate.

Oil industry factor vol 12.5% > Netherlands country factor 11.9%. Non-oil energy 21.2%; Precious metals 22.2%; Hong Kong country 24.7%; Singapore 24.0%.

Finland late-period pure mean **+32.7%** (Nokia effect discussion: hard to split idiosyncratic vs Finnish factor).

### 4.2 MAD crossover (Figures 1–2)

Since **early 1997**, industry MAD dominates country MAD and the ratio rises. Robust to collapsing 36→21 industries by economic grouping.

### 4.3 Correlations (Figure 3)

Cap-weighted country factor correlations rose with integration (matches Beckers–Connor–Curds; Solnik–Roulet). Industry factor correlations relatively stable. By 1999-11-03, 52-week country and industry cap-weighted correlations were equal.

### 4.4 Diversification charts (Figures 4a–c)

Average stock vol benchmark ~28.8% (FT World, 60m).  
- 12/85–12/94: country diversification dominates industry (classic HR).  
- 11/94–11/99: industry diversification **slightly superior**.  
- 11/98–11/99 (52w): industry gains **larger** than country gains.  
Still best to diversify both.

### 4.5 Table 5 — Max Sharpe (full sample VCVs, short sales allowed)

| Strategy | Hist means SR | Null means SR* |
|----------|---------------|----------------|
| Industries only | 1.41 | 0.67 |
| Countries only | 1.28 | 0.58 |
| Both | **1.84** | **0.75** |

*Null: factor means set to 0, world mean kept—pure risk diversification. Industries beat countries; combination best.

---

## 5. Limitations

- Developed markets only; EM still country-dominated (later Estrada–Kritzman–Page; Menchero).
- No style factors—Menchero–Morozov argue styles absorbed some late-1990s industry vol.
- 0/1 global industry loadings ignore regional factor structure and firm foreign-sales differences.
- Nokia/Finland identification ambiguity.
- Sample ends Nov 1999 (tech bubble)—industry dominance partly bubble-period phenomenon; later work shows partial mean reversion toward parity after 2003.
- Weekly local excess; results differ from DM-common-currency monthly Europe studies.

---

## 6. Practical Takeaways for a Quant Investor

1. **Revisit process:** if your MAD_I > MAD_C on a live 52-week window, elevate global sector allocation.
2. **Home bias cost:** UK IT ~1.5% vs World ~11.3%—home-biased UK book takes a large unintended underweight to a high-vol global industry.
3. **Stock selection:** compare names **within global industries across countries**.
4. **Risk models:** prefer 36-GICS-like granularity over 7 supersectors; use local excess.
5. **Diversify both** country and industry; don’t replace one silo with another.
6. **Monitor MAD ratio** as a regime indicator (integration vs fragmentation).
7. **Active industry timing:** Cavaglia et al. (1995) claim industry returns predictability—pair with this paper’s risk evidence.
8. **Attribution:** use pure β and γ for performance vs world.

---

## 7. Lit Context Numbers

Prior R² for industry-only models: 5% (Beckers 1996) to 40% (Roll 1992, likely upward biased). Marginal industry R² after countries: 4–15%. Significance frequency 9–71%. HR median country/industry vol ratio 2.5–3.4. Rouwenhorst 1999: country MAD ~2× industry in Europe through 1998—Cavaglia’s global finer weekly local-excess design is why they differ.


## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.



## Extended Table 3 Reading Guide

Subperiod columns (means): 85–90, 90–95, 95–99. Software industry pure mean rises from −1.8% (early) to +12.2% to +15.2% (late)—the new-economy factor. Oil flips from +4.7% (85–90) to −5.8% (95–99). Japan country pure mean +4.3% then −8.1% then −12.5%—country, not industry mix, drove Japan’s lost decade relative performance (Australia’s underperformance conversely tied more to basic-goods exposure in narrative).

Volatility columns show compression then expansion: world vol 15.6% → 10.3% → 14.3% across subperiods. Late-period industry aggregate vol 10.9% exceeding country 9.8% is the headline regime shift versus HR’s 1978–92 Europe.

### Sharpe Portfolio Construction Detail

Optimizations use full-sample historical mean vector of pure factors plus full-sample VCV, allowing shorts. Null-mean experiment isolates diversification: still SR_I=0.67 > SR_C=0.58, and joint 0.75. This addresses criticism that mean errors drive the industry SR edge in the historical-means column (1.41 vs 1.28).

### Policy Implications Paragraph Expansion

Passive investors using domestic benchmarks inherit industry bets orthogonal to global CAPM. Active global managers need industry research coverage equal in stature to country economics. Sell-side organization toward global sectors matches the MAD evidence post-1997. Quant signals: estimate industry-relative alphas (stock vs global industry peers) rather than only vs local market.

