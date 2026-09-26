# Heterogeneity and Portfolio Choice Theory and Evidence (2004)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioChoice_Curcuru_2002.pdf>). The detailed discussion below follows this library copy.

# 1. Metadata

- **Title:** Heterogeneity and Portfolio Choice: Theory and Evidence
- **Author(s):** Stephanie Curcuru, John Heaton, Deborah Lucas, Damien Moore
- **Year:** 2004
- **Journal/Venue:** Survey manuscript prepared for the *Handbook of Financial Econometrics*, marked “Revised September 2004”

# 2. Problem statement

The paper asks a cross-sectional portfolio-choice question rather than a single-investor optimization question: **which economic frictions and heterogeneities can explain the large observed dispersion in household portfolio composition, including nonparticipation in risky asset markets, low risky shares, and underdiversification?** Formally, the benchmark model is the standard dynamic portfolio problem
$$
\max_{\{c_t,\theta_t\}} E_0\sum_{t=0}^T \beta^t u(c_t)
$$
subject to wealth dynamics and portfolio-return processes, and the paper asks which modifications to this problem generate empirically plausible cross-sectional policies $\theta_t$.

# 3. Approach (short)

The paper is a theory-and-evidence survey with calibration. It organizes the household portfolio-choice literature around progressively richer dynamic programming problems: the frictionless Merton-Samuelson benchmark, then models with background risk, borrowing constraints, participation costs, labor income, entrepreneurial risk, housing, retirement accounts, and life-cycle structure. It compares the policy implications of these models to Survey of Consumer Finances facts on participation, risky shares, and concentration.

# 4. Approach (detailed)

1. **Empirical target moments**

   The paper first fixes the facts to be explained:

   - many households hold zero risky assets;
   - among participants, risky shares vary widely;
   - many portfolios are poorly diversified and tilted toward own business, employer stock, or housing;
   - age, wealth, labor income, and institutional constraints matter.

   The statistical object is therefore not an aggregate market portfolio, but a conditional distribution
   $$
   \mathcal L(\theta_{it}\mid X_{it}),
   $$
   where $\theta_{it}$ denotes portfolio composition and $X_{it}$ household characteristics.

2. **Frictionless benchmark**

   In the classical continuous-time benchmark with one risky asset and CRRA utility,
   $$
   dW_t = \big(rW_t + \theta_t(\mu-r)W_t - c_t\big)\,dt + \theta_t \sigma W_t\,dB_t,
   $$
   the Merton share is
   $$
   \theta_t^\star = \frac{\mu-r}{\gamma \sigma^2}.
   $$
   In the multivariate case,
   $$
   \theta^\star = \frac{1}{\gamma}\Sigma^{-1}(\mu-r\mathbf 1).
   $$
   This benchmark predicts broad participation and smooth risky shares conditional on risk aversion. The paper stresses that this is immediately at odds with the data unless one permits implausibly large heterogeneity in $\gamma$.

3. **Background risk and nontraded wealth**

   The first enlargement adds human capital, entrepreneurial risk, or housing:
   $$
   W_{t+1} = (W_t-c_t-\theta_t^\top \mathbf 1)R_f + \theta_t^\top R_{t+1} + Y_{t+1},
   $$
   where $Y_{t+1}$ is labor or business income. Positive covariance with nontraded income creates a motive to hedge overlapping financial risk, but the total effect on the risky share need not be monotone. Saving, income floors, preferences, and the wealth denominator also change; the source emphasizes these complications.

4. **Participation costs and market non-entry**

   To explain zero stockholding, the paper emphasizes fixed participation costs $F>0$. Then the investor compares
   $$
   V^{in}(W_t-F,X_t)
   \qquad\text{versus}\qquad
   V^{out}(W_t,X_t),
   $$
   and enters when the value after paying the monetary cost exceeds the nonentry value. A cost subtracted directly from a value function would instead need utility units. This simple discrete choice generates a wealth threshold for participation and matches the strong empirical link between wealth and stock-market entry much better than the frictionless model.

5. **Life-cycle portfolio choice**

   The dynamic version is a Bellman problem
   $$
   V_t(W_t,S_t)=\max_{c_t,\theta_t}
   \left\{
   u(c_t)+\beta E_t[V_{t+1}(W_{t+1},S_{t+1})]
   \right\},
   $$
   where $S_t$ includes age, labor-income state, pension or retirement-account status, and housing/entrepreneurial wealth. The paper’s survey result is that life-cycle structure plus participation costs explains:

   - delayed entry into risky markets for young/low-wealth households;
   - participation patterns that depend on age, wealth, and cohort, without a universal monotone age effect;
   - some, but not all, of the observed risky-share heterogeneity among participants.

6. **Why underdiversification is hard**

   Classical utility maximization with frictionless access to many securities implies broad diversification, essentially because idiosyncratic risk is cheap to eliminate. The survey therefore highlights underdiversification as a residual puzzle. Employer-stock holdings, own-business risk, and local/informational biases can rationalize some concentration, but calibrated models still struggle to reproduce the extreme empirical concentration seen in household data.

7. **What the paper itself contributes**

   The paper is not proposing one new optimization theorem. Its contribution is comparative and synthetic:

   - map the facts on participation, risky shares, and concentration;
   - place each friction into a common dynamic portfolio-choice structure;
   - evaluate which combinations of frictions can jointly match the observed cross section.

8. **Proof status**

   There is no central new theorem to reproduce. The “proof” logic is model-comparison logic:

   - start from the Merton/Samuelson benchmark;
   - add one friction at a time to the Bellman problem;
   - examine how the induced policy functions shift;
   - compare the implied cross-sectional allocations with the SCF facts.

   The paper’s claims are therefore strongest as a literature synthesis, not as a new structural identification result.

# 5. Domain of applicability

- The paper applies to **household portfolio choice**, not institutional portfolio construction.
- Its strongest conclusions are about **which frictions are necessary** to explain participation and risky-share heterogeneity.
- The evidence supports participation costs, life-cycle effects, and background risk as important, but the survey is explicit that these do **not** fully explain underdiversification.
- Because the paper is synthetic, its scope is broader than any one calibrated model, but its proofs are weaker than those of a single structural paper: broad applicability is argued by accumulation of evidence, not established in one theorem.

## 6. What is measured: participation, allocation, and concentration

The source is a manuscript revised in September 2004 and prepared for the *Handbook of Financial Econometrics*. The local PDF filename contains 2002, but the revision date on the first page is the relevant date for this summary. The evidence is historical; its household percentages should not be presented as current participation statistics.

The paper separates three empirical targets. Participation asks whether a household holds equity at all. Conditional allocation asks how much equity a participating household holds. Diversification asks whether that equity is spread across risks or concentrated in a few securities. A model can explain one without explaining the other two. For instance, a participation cost may rationalize zero stockholding for low-wealth households but does little to explain why an affluent participant voluntarily holds mainly its employer's stock.

Wealth definitions materially change each comparison. The paper's broad “total financial wealth” includes owner-occupied housing, other real estate, and private businesses, in addition to liquid financial assets. It does not capitalize all human wealth, and the reported gross-asset composition does not subtract mortgage leverage. This is different from the narrow stock share in stocks, bonds, and cash, and different again from the stock-to-net-worth ratio.

Table 1's survey-weighted average household allocation in the 2001 SCF assigns 15.8% to stocks, 7.6% to bonds, 24.4% to cash, 41.3% to housing, 4.8% to other real estate, 4.2% to private business, and 1.9% to other assets. These are household-composition averages, not the aggregate economy's asset-value weights. A large position in housing can dominate a family's balance sheet even when its liquid portfolio looks conservatively invested.

## 7. The principal empirical facts in the source

The SCF tabulations show equity ownership across all account types rising from 31.8% of households in 1989 to 51.9% in 2001. The share owning equity only through pension accounts rises from 11.2% to 21.2%, while the share owning only direct equity declines from 12.6% to 9.8%. Institutional access through mutual funds and retirement plans is therefore central to the participation story. The statement that most households do not own stock describes earlier survey years and is not literally true of the 2001 all-account ownership measure.

For comparisons of household characteristics, the authors classify stockholders using at least $500 of equity and focus on positive-net-worth households with survey weights. In 2001, average broad financial wealth is about $794,817 for stockholders and $167,729 for nonstockholders; the corresponding medians are $290,850 and $77,885. Large mean–median differences show why a representative average household is a poor description of the cross section.

Among stockholders, the mean stock share of broad financial wealth is 26.9%, the median is 20.0%, and the interquartile range runs from 7.0% to 40.5%. Even after conditioning on participation, age and wealth leave considerable heterogeneity unexplained. The top wealth decile holds 76.6% of stock wealth in 2001, down from 84% in 1989 but still highly concentrated.

The paper defines one observable underdiversification indicator as having more than half of equity holdings in brokerage accounts containing fewer than ten stocks. The share of equity-owning households meeting this definition falls from above 30% in the early 1990s to 13.7% in 2001. This is an imperfect measure because the SCF does not reveal the number of individual stocks held inside every retirement account. For the undiversified group, own-company stock accounts for 28.4% of stock holdings in 2001. A decline in measured brokerage concentration can coexist with substantial employer-stock exposure inside retirement plans.

## 8. Euler equations explain why zero holdings are a special puzzle

For an unconstrained household with CRRA preferences, the excess-return Euler condition is

$$
E_t\left[\beta\left(\frac{c_{t+1}}{c_t}\right)^{-\gamma}
(R^s_{t+1}-R^b_{t+1})\right]=0.
$$

Nontraded income changes this condition through its effect on consumption and the covariance of marginal utility with returns. Its presence does not by itself insert a fixed participation threshold into the financial choice. With smooth preferences and freely adjustable long and short positions, the desired stock position may become small or negative, but an exact zero is generally a knife-edge outcome. A short-sale restriction can turn a negative desired position into a zero corner; a fixed entry or maintenance cost can make a range of small desired positions unprofitable to implement.

The distinction between avoiding all saving and saving only in bonds is especially important. A model that produces no stockholding because impatient poor households hold no financial assets has not explained bondholders who avoid a positive equity premium. The paper emphasizes that plausible calibrations often struggle to produce safe saving and zero risky saving together.

A monetary participation cost must enter the household budget. If an entry payment is $F$, the comparison is between an entry value evaluated at resources reduced by $F$ and the nonentry value. Writing $V^{in}-F$ is only appropriate if $F$ has already been converted into utility units. One-time entry costs, annual maintenance costs, and per-trade costs produce different thresholds and persistence in participation.

## 9. Why more background risk need not mean fewer stocks

The paper explicitly cautions against a universal monotonic rule. An exogenous income stream can be risky yet have a lower bound that acts like a safe asset in very bad states. Adding that income to a financial-wealth-only model can reduce overall consumption risk and increase the desired risky share of liquid wealth. The hedge demand depends on covariance with traded returns, while precautionary saving changes the scale of financial wealth on which the share is measured.

Preferences also matter. Under CRRA, risk aversion and the inverse elasticity of intertemporal substitution are tied together. Raising the CRRA coefficient changes both willingness to bear risk and willingness to move consumption across time. More precautionary wealth can make fixed entry costs easier to absorb, so participation can rise even while the conditional risky share falls. A comparative-static statement about one margin should not be exported to another.

The horizon effect is similarly conditional. In the frictionless constant-opportunity model with CRRA preferences and only tradable financial wealth, the risky share need not decline with age. Age profiles arise from labor-income dynamics, retirement, housing, borrowing limits, adjustment costs, or changing opportunities. The paper discusses flexible labor supply as one reason young workers may bear more financial risk, but a highly leveraged house purchase or an entry cost can point the other way.

## 10. Calibration results illustrate both progress and sensitivity

In the illustrative background-income model, borrowing and short stock positions are forbidden. Nontraded income growth has a mean of 1% and standard deviations of either 15% or 29%, with first-order autocorrelation −0.4. Stock returns have mean 7.75% and standard deviation 15.7%. The discount factor is set to 0.9 to prevent excessive saving in the model. These choices are not incidental: altering income persistence, lower-tail behavior, or correlation with returns substantially changes portfolio predictions.

With risk aversion five, zero contemporaneous income/stock correlation, and the lower-risk income specification, the model invests about 97% of financial savings in stocks. Thus adding a reasonably risky labor-income stream does not automatically explain conservative observed financial portfolios. Considerable bondholding requires more extreme combinations of background risk and risk aversion in the illustrated cases. Small covariance changes can have large effects once those combinations are imposed.

The range of estimated participation costs is also model-dependent. The survey reports an early calibration requiring one-time costs from 3% to 54% of wealth, depending on risk aversion and the equity premium. Other evidence suggests much smaller annual costs: one cited study finds $50 per year sufficient to explain half of nonparticipants and $260 sufficient to explain three quarters. These are different cost concepts and empirical designs, not contradictory estimates of one common structural parameter.

Housing models demonstrate the difficulty of matching several facts jointly. One calibrated housing/portfolio model produces stock-to-net-worth ratios rising from 9% for the youngest households to 60% for the oldest and predicts fully mortgaged houses at every age. The source contrasts those predictions with observed age patterns and with mortgage incidence of 66% overall and 26.4% among seniors in the 2001 SCF. A model can capture the influence of housing while missing its optimal leverage and life-cycle implications.

## 11. Measurement and identification limit the conclusions

Aggregate labor income is much smoother than the income of an individual household. Aggregate housing returns also conceal local and property-specific risk. Calibrating household decisions using aggregate variances can therefore make nontraded wealth look too safe and imply excessive stock demand. Panel data help separate persistent from transitory shocks, but income shocks must still be distinguished from anticipated changes, measurement error, and voluntary labor-supply decisions.

The SCF offers detailed balance sheets and oversamples wealthy households, but the repeated cross-sectional surveys used here provide limited information about a given household's time-series income/return covariance. The PSID follows households over time but contains less detailed financial portfolios and fewer observations in the wealthy tail. Combining the strengths of these data sources is difficult. Age, cohort, and calendar-time effects are also confounded unless the research design explicitly separates them.

Associations between housing and lower equity participation are consistent with both a wealth-allocation mechanism and a risk mechanism. A household that buys a house may have less liquid wealth available to absorb entry costs; a leveraged house may also increase background risk. Cross-sectional coefficients alone do not identify which mechanism is causal. Business owners additionally self-select on risk tolerance, so their higher observed risky financial share does not show that entrepreneurial background risk is harmless.

Voluntary employer-stock concentration is conceptually different from a nontradable private business forced by contracting frictions. Restrictions on selling employer shares can create background risk; choosing to retain freely saleable shares requires an explanation involving beliefs, preferences, incentives, or perceived participation/diversification costs. Evidence reviewed from detailed Swedish portfolios finds more support for familiar local or occupational stocks than for active hedging of nonfinancial income.

## 12. Implications and remaining questions

The survey's conclusion is that household portfolio choice must be analyzed with the whole balance sheet and institutional environment in view. Participation, conditional risky share, and diversification respond to different frictions, and a successful quantitative model should match them together with saving and debt choices. Fixed costs and life-cycle circumstances help explain young and low-wealth nonparticipation, but wealthy nonparticipants and large voluntary concentrations remain difficult cases.

For constructing a household model, the appropriate state variables include liquid wealth, human-capital risk, housing and mortgage exposure, private-business holdings, retirement-plan restrictions, age, and access costs. Calibration should be checked against joint distributions and transition behavior rather than only an average stock share. The source provides a map of these mechanisms and their empirical shortcomings; it does not establish one universally identified optimal household allocation rule.
