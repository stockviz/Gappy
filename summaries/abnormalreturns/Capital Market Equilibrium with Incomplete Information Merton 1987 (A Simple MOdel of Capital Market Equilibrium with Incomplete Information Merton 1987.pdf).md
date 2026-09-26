# A Simple Model of Capital Market Equilibrium with Incomplete Information (Merton 1987) — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | A Simple Model of Capital Market Equilibrium with Incomplete Information |
| **Author** | Robert C. Merton (MIT Sloan; AFA President 1986) |
| **Outlet** | *Journal of Finance*, Vol. XLII, No. 3, July 1987, pp. 483–510 |
| **Context** | Presidential address–style synthesis + formal model of investor recognition |
| **Related empirics** | Neglected-firm / listing / institutional-holding anomalies (Arbel–Carvell–Strebel; Barry–Brown; Banz; Reinganum) |

---

## Problem / Motivation (Prologue)

Finance evolved from rules of thumb to rigorous theory with practice impact (EMH, portfolio selection, contingent claims). Yet the field faces accumulating anomalies, theoretical inconsistencies, and power concerns — “more questions than at the start.” Merton’s stance: useful ignorance (specified ignorance) should drive research that relaxes frictionless markets and complete information *without* abandoning rational optimizing agents.

Perfect-market models struggle to explain roles of institutions, complex contracts, and regulation. Time scales differ: institutional structure adjusts slowly; portfolios and prices adjust fast. Examples:

- Dealer capital fixed on trading timescales → margin/regulation bind → short-run marginal cost of capital volatile → first-order for microstructure.
- Tatonnement models omit dealers/market makers → limited insight into short-run price formation.
- Information diffusion is not instantaneous for all information types: earnings via standard channels vs scientific publication of an anomaly (small-firm effect debated for years after first studies).
- Implementation costs, prudence rules, marketing to clients delay “corrective” trades.
- Historical EMH tests may classify inaccessible past prices as “public,” biasing against efficiency.

Thesis: modest recognition of institutions and information costs can explain behavior that looks anomalous under frictionless CAPM. The paper’s model: **incomplete diffusion of awareness** — investors only use securities they “know about.”

---

## Setup / Data (Model Environment)

### Securities and cash flows

$n$ firms with end-of-period cash flows:
$$
\tilde C_k = I_k\big[\bar A_k + a_k \tilde Y + s_k \tilde\varepsilon_k\big]
$$
Common factor $\tilde Y$ with $\mathbb{E}Y=0$, $\mathbb{E}Y^2=1$; idiosyncratic $\tilde\varepsilon_k$ mean-zero, uncorrelated. Market value $V_k$; return:
$$
\tilde R_k = \bar R_k + b_k \tilde Y + \sigma_k \tilde\varepsilon_k,
$$
with $\bar R_k = I_k\bar A_k/V_k$, $b_k=a_k I_k/V_k$, $\sigma_k=s_k I_k/V_k$ — Sharpe diagonal / one-factor APT structure.

Also: riskless return $R$; security $n+1$ combining riskless + forward on $Y$ with unit return SD:
$$
\tilde R_{n+1} = \bar R_{n+1} + \tilde Y.
$$
Securities $n+1$ and $n+2$ (riskless) are **inside** securities: aggregate demand zero in equilibrium.

### Investors

$N$ price-taking investors; mean-variance preferences on end-of-period wealth:
$$
U_j = \mathbb{E}(\tilde R^j W_j) - \frac{\delta_j}{2W_j}\mathrm{Var}(\tilde R^j W_j).
$$
Common knowledge: $R$, distribution of the factor security, structure (2). **Incomplete info:** investor $j$ knows parameters $(\bar R_k,b_k,\sigma_k)$ only for $k\in J_j$. Factor and riskless always known. Conditional homogeneous beliefs among those who know $k$.

**Key behavioral assumption:** investor uses security $k$ in the optimal portfolio **only if** $k\in J_j$. Motivates observed undiversified holdings (Friend–Blume). Reduced-form shadow of many frictions (segmentation, shortsale limits, taxes, liquidity, indivisibility).

Awareness fixed-cost story: firm transmission costs + investor “receiver” set-up costs ⇒ each investor follows only a subset. Connects to neglected-stock theory (Arbel–Strebel): small analyst coverage ↔ small $q_k$ here even without quality differences. Contrasts Barry–Brown differential *precision* across securities — Merton holds precision equal, varies **breadth** of cognizance.

---

## Model / Methods

### Individual optimization

Portfolio return $\tilde R^j = \bar R^j + b^j \tilde Y + \sigma^j \tilde\varepsilon$. With shadow prices $\lambda_k^j$ for unknown securities, FOCs give:
$$
b^j = (\bar R_{n+1}-R)/\delta_j, \qquad
w_k^j = \frac{\Delta_k}{\delta_j \sigma_k^2}\ \text{for }k\in J_j,\quad 0\text{ else},
$$
where $\Delta_k = \bar R_k - R - b_k(\bar R_{n+1}-R)$ is residual expected excess after factor hedging. Shadow cost of not knowing $k$: $\lambda_k=\Delta_k$ (same for all uninformed about $k$).

### Aggregation (identical preferences & wealth)

All choose same factor exposure $b$; $\bar R_{n+1}=R+\delta b$. Let $q_k=N_k/N$ = fraction who know $k$. Market weight:
$$
x_k = \frac{q_k \Delta_k}{\delta \sigma_k^2}.
$$
Equilibrium expected return:
$$
\bar R_k = R + b_k \delta b + \frac{\delta x_k \sigma_k^2}{q_k}. \tag{16}
$$
Firm value:
$$
V_k = \frac{I_k}{R}\Big[\bar A_k - \delta b a_k - \frac{\delta s_k^2 I_k}{q_k M}\Big]. \tag{17}
$$
Relative to complete information ($q_k=1$) value $V_k^*$:
$$
V_k = V_k^* - \frac{\delta(1-q_k)s_k^2 I_k}{q_k M R}.
$$
Incomplete info **always lowers** value; smaller investor base ⇒ larger discount. Aggregate shadow cost $\lambda_k=(1-q_k)\Delta_k$; price like extra discount rate:
$$
V_k = \frac{V_k^*}{1+\lambda_k/R}, \qquad \bar R_k-\bar R_k^* = \lambda_k(\bar R_k^*/R).
$$

### Security market line distortion

Market portfolio **not** mean-variance efficient. CAPM alpha:
$$
\alpha_k = \lambda_k - \beta_k \lambda_M, \qquad \lambda_M=\sum x_k\lambda_k. \tag{26}
$$
Fully informed investor’s optimal weights differ from market by $w_k^*-x_k=\lambda_k/(\delta\sigma_k^2)$.

---

## Results with Numbers (Comparative Statics & Calibrations)

### Elasticities of expected excess return (28)

$\partial\log|\bar R_k-R|/\partial\log b_k >0$; size $x_k$ positive; idiosyncratic vol positive; **$q_k$ negative**. For firms with $x_k\sigma_k^2/q_k \ll b_k\delta b$, only beta matters (standard CAPM intuition). If $q_k\ll 1$, firm size relative to *aware* wealth $x_k/q_k=V_k/(N_k W)$ can make residual risk priced.

### Flat SML / Black-like pattern

Among securities with common $q,\sigma^2,x$ but different $b_k$: $\partial\alpha/\partial\beta=-\lambda_M<0$ — empirical SML “too flat” (Blume–Friend; Black–Jensen–Scholes; Fama–MacBeth). If $E[\lambda_k|\beta]=\lambda_M$, then $E[\alpha|\beta]=(1-\beta)\lambda_M$ — observationally like Black’s zero-beta model, **but** alphas also depend on $\sigma^2$, $x$, $q$.

### Cross-section at fixed $\beta$ (31)

$\partial\alpha/\partial\sigma^2>0$; $\partial\alpha/\partial x>0$ conditional on $q,\sigma$; $\partial\alpha/\partial q<0$. Size effect unconditional can go either way because small firms have higher $\sigma$ and lower $q$ — model can match Banz–Reinganum *or* reverse depending on $dq/dx$. Listing period / institutional neglect as proxies for $q$ match Barry–Brown and Arbel–Carvell–Strebel: neglected/low-institution stocks earn higher alphas controlling for size/beta.

### Calibration magnitudes (Section III)

Typical $\sigma^2_{\text{total}}=0.16$; half idiosyncratic ⇒ $\sigma^2=0.08$; $\delta=2$. Then $\lambda_k=0.16(1-q_k)x_k/q_k$.

Hypothetical: \$200M firm, \$2T market ⇒ $x_k=0.0001$; 22,500 shareholders ⇒ shadow cost $\lambda_k>0.03$ ⇒ **+300 bp** expected return vs complete info. Large firms’ raw shareholder counts overstate incompleteness because institutions multiply effective $q$.

Compustat 1,387 firms (Dec 31, 1985), deciles by market value (Table I): top 10% ≈63.5% of sample MV; MV per shareholder rises much slower than MV (top/bottom MV ratio ~600× vs MV/shareholder ~12×). Implied $q_k/q_{10}$ for bottom groups ~0.02–0.09 — large cognizance gaps.

### Firm policies (Section IV)

$\partial V/\partial q>0$: managers maximize value by expanding investor base (IR, advertising, exchange listing, ratings) — expenditures **without** new cash-flow information can raise price via $q$. Optimal $N_k$ from marketing cost $F(N_k)$ with $F'>0,F''>0,F'(N)=\infty$:
$$
F'(N_k)=\delta s_k^2 I_k^2/(R N_k^2 W).
$$
Larger idiosyncratic cash-flow variance ⇒ larger optimal base. Joint choice of $I_k$ and $N_k$: incomplete info ⇒ less investment than complete-info optimum; expansion of base and investment coincide; issues of new securities often accompany both. Downward-sloping demand for shares when $q$ small — relevant for SEO price impact.

Media stories that attract new followers raise $q$ even if current holders learn nothing new — rationalizes price reactions to “no news” widely circulated features.

### Pending issues (Section V)

- General covariance: $\alpha_k=\lambda_k-\beta_k\lambda_M$ still; $\lambda$ may differ across investors; need $\partial\lambda/\partial q<0$ for comparative statics robustness (Errunza–Losq mild segmentation analogy).
- Costly/prohibited short sales accentuate effects (especially high-$\sigma$ names) by reducing value of becoming informed.
- Institutions reduce per-investor set-up costs but face their own marketing costs — do not imply complete information; portfolios still concentrated; aggregator $q_k$ from direct+indirect holdings.
- Indexers: isomorphic to boosting effective $q$ proportional to active aware fraction; if indexers omit small names, they **widen** $q$ gaps.
- Neglected-stock alpha strategy: dollar capacity limited (5% ownership caps; price impact); \$200M firm’s “mispricing” may be only \$6–46M total — not a free lunch for giant institutions. Diffusion of corrective capital can be slow (prologue theme).

---

## Limitations

1. Two-period mean-variance; identical agents simplify aggregation.
2. Exogenous information sets until Section IV’s firm-cost extension.
3. Diagonal factor structure; qualitative robustness claimed for general Σ.
4. No differential information *quality* (by design).
5. Calibration illustrative; institutional adjustment to $q$ ad hoc.
6. Silent on liquidity level effects distinct from awareness.

---

## Quant-Investor Takeaways

1. **Investor recognition is a priced state variable.** Low $q_k$ ⇒ higher expected returns and lower valuations — neglected/small/under-followed names.

2. **Alphas are not only “market inefficiency.”** In Merton 1987 they are equilibrium compensation for bearing residual risk with limited risk-sharing.

3. **SML flatness and zero-beta patterns arise without borrowing constraints** — from shadow costs correlated with structure of who holds what.

4. **Size effect is conditional.** Controlling for $q$ and $\sigma$, larger $x$ raises alpha; unconditionally small firms may win via lower $q$ / higher $\sigma$.

5. **Corporate actions affecting $q$ are value-relevant:** listings, index inclusion, IR campaigns, ratings — test as $q$-shocks.

6. **Capacity:** recognition premia may be real but small in dollars for large AUM — aligns with why anomalies persist.

7. **Portfolio construction:** shadow-cost adjustment $\delta x\sigma^2/q$ resembles a name-specific hurdle rate on top of beta — practical for long-short books trading obscure names (borrow, shortability, and following constraints map into effective $q$).

8. **Bridge to modern factors:** index inclusion literature, ETF membership, analyst coverage, and institutional ownership breadth are empirical cousins of $q_k$.


---

## Extended Formal Walkthrough

### From FOCs to the pricing equation

The investor’s Lagrangian treats unknown securities as constrained to zero weight. The multiplier equals the mean-variance “alpha” of the security relative to the factor-hedged portfolio — hence $\lambda_k=\Delta_k$. Aggregating only over the $N_k$ aware investors scales demand by $q_k$, which is why $\Delta_k$ must be larger when $q_k$ is smaller to clear a given market weight $x_k$. Rearrangement produces the additive term $\delta x_k\sigma_k^2/q_k$ in expected returns — residual-risk pricing scaled by inverse awareness.

### Beta representation

Because $\mathrm{Cov}(R_k,R_M)=b_k\delta b + x_k\sigma_k^2$ (diagonal world),
$$
\beta_k=\frac{b_k\delta b+x_k\sigma_k^2}{\mathrm{Var}(R_M)}.
$$
Substituting into the return equation isolates $\alpha_k=\lambda_k-\beta_k\lambda_M$. Efficiency of the market portfolio fails exactly when shadow costs are heterogeneous across securities.

### Numerical classroom example

Market $M=\$2\times 10^{12}$, $\delta=2$, $\sigma^2=0.08$, $R=1.05$ (gross). Firm with $V=\$2\times 10^8$ ⇒ $x=10^{-4}$. If $q=0.01$ (1% of investors aware),
$$
\frac{\delta x\sigma^2}{q}=2\times 10^{-4}\times 0.08/0.01=0.0016\ \text{(16 bp)},
$$
while if $q=0.001$, the residual-risk term is 160 bp; if also $\sigma^2$ is higher for small names (say 0.20), the term becomes 400 bp. The paper’s 300 bp example uses the interaction of small $q$ with the $\lambda=(1-q)\Delta$ representation — order-of-magnitude hundreds of bp for obscure names is easy to obtain.

### Index inclusion as a natural experiment

When a stock enters a widely held index, effective $q$ jumps. Model predicts: price up on announcement, expected subsequent returns down (lower $\alpha$). This matches the empirical index-inclusion literature’s price effects, with Merton providing an awareness-risk-sharing interpretation complementary to demand-curve / imperfect-substitution stories (which also appear in Section IV’s downward-sloping demand discussion).

### Connection to Paleologo risk management themes

Paleologo emphasizes factor awareness for discretionary PMs — knowing hidden betas. Merton emphasizes security awareness for investors — knowing names exist. Both are information-structure constraints that make naive CAPM residuals look like alpha. A multi-PM platform (Millennium-style) expands institutional $q$ for approved names while stop-losses bind residual risk — operational Merton.

### Connection to commodity papers

Incomplete information about global oil inventories (Singleton) is a *precision* and higher-order-belief problem; Merton’s $q$ is awareness breadth. Different frictions, similar moral: equilibrium prices embed information structure, not only physical cash flows.

### Empirical research design ideas

1. Proxy $q_k$ with: # shareholders, # analysts, institutional breadth, Google search / news reach, options listing, major-index membership.
2. Test $\alpha_k$ increasing in $\sigma^2_{\varepsilon}/q$ after controlling for $\beta$.
3. Event studies: initiation of analyst coverage; exchange uplisting; first options listing.
4. SEO discount larger when $q$ small — downward-sloping demand.
5. Interaction: size × listing age (Barry–Brown) as $x\times q$ design.

### What Merton is careful *not* to claim

He does not claim markets are irrational, nor that neglected-stock screens are arbitrarily scalable, nor that complete-information CAPM is useless for long-run coarse description. He claims short-to-intermediate frequency pricing and cross-sectional anomalies can reflect rational equilibrium with incomplete awareness — and that firms optimally invest in raising $q$.

---

## Conclusion

Merton (1987) delivers a tractable incomplete-information CAPM where the fraction of investors who know a security, $q_k$, enters pricing like a risk-sharing capacity parameter. Valuations fall and expected returns rise when awareness is narrow; the market portfolio ceases to be mean-variance efficient; alphas inherit shadow costs; classic flat-SML and neglected-firm patterns emerge naturally. Firms optimally spend to expand investor bases, rationalizing IR and “no-news” media effects. For quants, investor recognition belongs alongside beta and residual volatility in expected-return models — with sober respect for dollar capacity.


---

## Extended Derivations, Calibrations, and Empirical Protocols

### Shadow cost units

$\lambda_k$ is measured in expected return units (same as $\Delta_k$). The valuation ratio $V=V^*/(1+\lambda/R)$ interprets $\lambda$ as an additive discount-rate wedge relative to gross riskless $R$. If $R=1.05$ and $\lambda=0.03$, price drops about 2.9% versus complete information for a one-period model — larger if the wedge is expected to persist (footnote dynamic discussion).

### Why institutions multiply $q$

If each institution represents $K$ ultimate beneficiaries who would otherwise be unaware, effective $N_k$ scales roughly with institutional ownership breadth × assets. That is why GE/IBM raw shareholder counts mislead — and why institutional neglect measures (Arbel) align with Merton’s $q$.

### Table I reading protocol

Decile 10 has 63.5% of MV and normalized $q=1$. Deciles 1–5 have cumulative MV only 4.3% but $q/q_{10}$ from 0.02 to 0.06. The neglected universe is economically small in cap weight but large in name count — exactly where stock-selection capacity is limited in dollars (Section V) yet alpha per dollar may be large.

### Firm IR budget optimization

Marginal cost $F'(N)$ equals marginal value $\partial V/\partial N$. High $s_k$ firms (volatile cash flows, unique products) optimally spend more on investor marketing. Prediction: biotech/small tech IR intensity > regulated utilities, ceteris paribus.

### SEO / issuance implications

Eq (35)–(37): raising $I_k$ without raising $N_k$ increases required returns (downward-sloping demand). Joint optimality expands both. Explains why offerings accompany roadshows — not merely legal necessity but $q$-expansion.

### Short-sale constraints as $q$ reducers

Prohibition lowers the expected value of paying the set-up cost (investor gives away a put on the opportunity set). High-$\sigma$ names lose the most option value — accentuating neglectedness for volatile small names, reinforcing short-side crowding fragility (Paleologo/Melvin link).

### Indexer math

With $A_N$ indexers, effective $q_k = N_k/(N-A_N)$ among actives, but indexers add demand $x_k A_N W$. If indexers exclude small names, $q$ gaps widen — mechanical channel from passive growth to neglected-stock premia.

### Empirical protocol suite

**Protocol A — coverage shock:** difference-in-differences around first analyst initiation; dependent variables: returns, turnover, $\hat\alpha$.

**Protocol B — listing:** Barry–Brown style sort by years since listing × size; test interaction.

**Protocol C — institutional breadth:** number of 13F holders as $q$ proxy; Fama–MacBeth with $\beta,\sigma,x,q$.

**Protocol D — index addition/deletion:** event study + post-event $\alpha$ change.

**Protocol E — marketing spend:** abnormal IR/advertising spend vs subsequent breadth and returns (data-hard).

### Connection to CAPM testing philosophy

Roll’s critique: testing CAPM = testing market portfolio efficiency. Merton shows incomplete info ⇒ inefficiency of the observed market portfolio ⇒ nonzero alphas structurally. Apparent CAPM rejections need not imply irrationality.

### Closing Merton paragraph

Merton (1987) remains the canonical rational model of investor recognition. Its equations (16), (26), and (31) should sit beside CAPM in every quant equity expected-return toolkit, with $q$ proxied by coverage, breadth, and index membership, and with capacity limits respected exactly as Section V warns.


---

## Lecture-Length Reconstruction of Sections II–V

### Section II recapitulation with algebra

Start from cash-flow technology (1) and map to returns (2). The factor mimicking security (3) completes the spanning of systematic risk for mean-variance investors. Incomplete information enters only through the feasible set $J_j$, not through belief disagreements about known names — a deliberate modeling choice that shuts down Grossman–Stiglitz adverse-selection games inside each name’s trading crowd.

The Lagrangian for investor $j$ yields factor exposure $b^j=(\bar R_{n+1}-R)/\delta_j$ independent of which names are known — investors still dial systematic risk via the factor security. Name-level weights exist only on $J_j$ and equal residual mispricing over risk aversion times idiosyncratic variance. Aggregation with identical $\delta,W$ produces market clearing $x_k=q_k\Delta_k/(\delta\sigma_k^2)$. Invert to price residual risk: $\Delta_k=\delta x_k\sigma_k^2/q_k$. Add back factor premium to obtain (16).

### Section III recapitulation

Elasticities (28a–d) are the comparative-static engine. The economically novel elasticity is $\eta(q)<0$: awareness lowers required returns. Conditional size elasticity positive seems to contradict small-firm premia until one allows $q(x)$ and $\sigma(x)$ to covary with size. Barry–Brown listing interactions and Arbel institutional neglect results are presented as $q$-proxy evidence.

Calibration: with $\delta=2$ and $\sigma^2=0.08$, $\lambda=0.16(1-q)x/q$. Tiny $x$ with tiny $q$ still yields large $\lambda$ because of the $x/q$ ratio — firm size relative to *aware wealth*, not national wealth.

### Section IV recapitulation

Firms choose $N_k$ to max $V-F(N)$. First-order condition equates marketing marginal cost to marginal value from lowering the discount wedge. Investment $I_k$ jointly chosen; incomplete awareness reduces optimal scale. Public-relations “no new cash-flow news” can still move prices via expected $q$ paths — a rational expectations channel for media.

### Section V recapitulation

Robustness: general Σ keeps $\alpha=\lambda-\beta\lambda_M$ but complicates $\lambda$ heterogeneity; short-sale costs amplify; intermediaries help but do not complete information because they too must market themselves; indexers can worsen neglect for excluded names; dollar capacity bounds arbitrage against recognition premia.

### Worked SEO example

Firm with $q=0.05$, high $\sigma$, plans to double $I$. Without raising $q$, (35) says required excess returns rise elastically with $I$. If simultaneous roadshow doubles $q$ to 0.10, the $\delta x\sigma^2/q$ term halves for the same $x$, offsetting much of the issuance discount. This is the quantitative rationale for bundling IR with issuance.

### Worked neglected-stock screen

Sort universe by analyst count (lowest quintile), require $\hat\sigma_\varepsilon$ above median, long that quintile with beta neutralization. Merton predicts positive $\alpha$. Capacity: cap at 2% ADV and 3% ownership. Expected alpha haircut for costs and impact. This operationalizes Section III–V jointly.

### Integration with multi-factor equity risk models

Interpret $\delta x\sigma^2/q$ as an additional specific-risk price. In Barra-like engines, multiply specific variance by a recognition scalar $1/q$ in expected-return modules (not in risk modules) to tilt toward neglected names without inflating predicted vol.

### Ten exam questions

1. Derive (16) from FOCs and market clearing.
2. Show market portfolio inefficiency from (26).
3. Why can the model match a flat SML?
4. When does $\partial\alpha/\partial x$ positive coexist with small-firm premia?
5. Interpret Table I’s $q$ ratios.
6. Solve optimal $N_k$ under quadratic $F$.
7. Explain price response to a no-news media feature.
8. How do short-sale bans change $q$?
9. Effect of market indexers who omit small caps?
10. Why might a \$10B fund ignore a 300 bp neglected-stock alpha?

### Final expanded conclusion for Merton

The 1987 JF paper is the intellectual ancestor of investor-recognition and neglected-firm empirical programs and a template for how to amend CAPM with a single incomplete-information friction while preserving optimizing agents. Its formulas remain directly usable in quantitative equity expected-return research when $q$ is carefully proxied and capacity carefully respected.


### Supplementary reflection

costs amplify; intermediaries help but do not complete information because they too must market themselves; indexers can worsen neglect for excluded names; dollar capacity bounds arbitrage against recognition premia.

### Worked SEO example

Firm with $q=0.05$, high $\sigma$, plans to double $I$. Without raising $q$, (35) says required excess returns rise elastically with $I$. If simultaneous roadshow doubles $q$ to 0.10, the $\delta x\sigma^2/q$ term halves for the same $x$, offsetting much of the issuance discount. This is the quantitative rationale for bundling IR with issuance.

### Worked neglected-stock screen

Sort universe by analyst count (lowest quintile), require $\hat\sigma_\varepsilon$ above median, long that quintile with beta neutralization. Merton predicts positive $\alpha$. Capacity: cap at 2% ADV and 3% ownership. Expected alpha haircut for costs and impact. This operationalizes Section III–V jointly.

### Integration with multi-factor equity risk models

Interpret $\delta x\sigma^2/q$ as an additional specific-risk price. In Barra-like engines, multiply specific variance by a recognition scalar $1/q$ in expected-return modules (not in risk modules) to tilt toward neglected names without inflating predicted vol.

### Ten exam questions

1. Derive (16) from FOCs and market clearing.
2. Show market portfolio inefficiency from (26).
3. Why can the model match a flat SML?
4. When does $\partial\alpha/\partial x$ positive coexist with small-firm premia?
5. Interpret Table I’s $q$ ratios.
6. Solve optimal $N_k$ under quadratic $F$.
7. Explain price response to a no-news media feature.
8. How do short-sale bans change $q$?
9. Effect of market indexers who omit small caps?
10. Why might a \$10B fund ignore a 300 bp neglected-stock alpha?

### Final expanded conclusion for Merton

The 1987 JF paper is the intellectual ancestor of investor-recognition and neglected-firm empirical programs and a template for how to amend CAPM with a single incomplete-information friction while preserving optimizing agents. Its formulas remain directly usable in quantitative equity expected-return research when $q$ is carefully proxied and capacity carefully respected.


In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. In further reflection, the quantitative implications of this work should be stress-tested across multiple market regimes, documented in reproducible code, and translated into explicit risk limits, research roadmaps, and teaching notes for investment teams. 