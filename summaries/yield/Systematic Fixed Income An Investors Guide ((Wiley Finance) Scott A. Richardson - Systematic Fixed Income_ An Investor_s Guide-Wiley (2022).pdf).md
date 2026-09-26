# Systematic Fixed Income: An Investor’s Guide — Detailed Quantitative Research Notes

**Title:** Systematic Fixed Income: An Investor’s Guide  
**Author:** Scott A. Richardson, PhD (AQR senior advisor/former principal; LBS professor of practice; ex-BGI/BlackRock)  
**Year:** 2022  
**Publisher:** John Wiley & Sons (Wiley Finance)  
**ISBN:** 978-1-119-90013-9 (cloth); 978-1-119-90023-8 (PDF); 978-1-119-90019-1 (ePub)  
**Structure:** 11 chapters — stage-setting; strategic AA; tactical AA; incumbent managers; govvies selection; credit selection; EM hard currency; portfolio construction; liquidity/trading; sustainability; synthesis  

---

## Problem / Motivation

FI markets **>\$100T**; traditionally discretionary “reach for yield” destroys diversification vs equities. Systematic (prespecified hypotheses → algorithms → portfolios) now feasible with better data (pre/post-trade transparency, issuer fundamentals). Goal: preserve FI diversifying role **and** add security-selection excess returns.

**Systematic ≠ merely quantitative:** all FI investors use duration/convexity math; few precommit narratives to code.

---

## Chapter 1 — Setting the Stage

Define FI claims; market size; analytics (yield, duration, convexity) with limitations; book focus on public rates & credit across DM/EM.

Price identity: $P=\mathbb{E}[\sum CF_t/(1+r_t)^{t}]$ with credit/liquidity adjustments.

---

## Chapter 2 — Strategic Asset Allocation

### Key return drivers

1. **Term premium** (duration)  
2. **Credit premium**  
3. **Prepayment / complexity / volatility premium** (MBS ~**\$9T** of ~**\$68T** bonds cited; specific segments ~\$100B Dec 2020 context)

### Empirics (exhibits)

Cumulative & rolling 36m excess returns for US Treasuries (1926–2020 mixes of T-bill and Bloomberg Treasury). Credit excess via Asvanunt–Richardson (2017) approach updated through 2020.

**Sharpe ratios (full sample 1926–2020 context):** credit premium Sharpe **0.48** vs term **0.34** vs ERP **0.44** — credit attractive on SR basis historically; still correlated to equities in crises (Ang’s warning).

Strategic diversification: FI helps when not implemented as perpetual credit overweight (“reach for yield”). Low-rate threat to diversification discussed—correlations and term premium compression.

Spread identity: $s=y^*-y>0$; excess returns require duration-matched long credit / short Treasuries (or swaps).

---

## Chapter 3 — Tactical Asset Allocation

Market timing of **term premium** and **credit premium** with valuation and macro signals. Other considerations: transaction costs, crowding, regime shifts.

---

## Chapter 4 — Incumbent Active FI Managers

Framework for evaluating Core Plus (US Agg), Global Agg, Unconstrained, EM, credit L/S. Critique: discretionary books often embed structural credit overweight vs benchmark — looks like alpha in credit bull markets, fails diversification mandate.

---

## Chapters 5–7 — Security Selection

### Rates (Ch.5)

Opportunity set: DM government bonds. Reduce dimensionality via PCA (level/slope/curvature). Themes: carry, roll-down, value vs model, momentum. Trade level/slope/curvature portfolios with DV01 neutrality where required.

### Credit (Ch.6)

DM corporates. Dimensions: issuer vs capital structure vs maturity. Themes: value (spread vs fundamentals), momentum, quality, carry. Performance exhibits show systematic credit selection efficacy when risk-controlled.

### EM hard currency (Ch.7)

Hard-currency EM bonds: sovereign/corporate spread themes analogous to DM credit with country risk overlays.

---

## Chapters 8–10 — Construction, Liquidity, ESG

Optimization, rebalancing, trading; electronification of credit; primary/secondary liquidity provision; ESG integration in credit and rates (tilts, exclusions, engagement) without destroying systematic premia.

---

## Chapter 11 — Synthesis

Successful process: strategic premia (term/credit/prepaid) + tactical overlays + systematic security selection + liquidity-aware construction + ESG constraints. Final thought: systematic FI as diversifying excess-return engine for asset owners.

---

## Practical Takeaways

1. Don’t destroy FI diversification by structural HY overweight.  
2. Harvest term & credit premia deliberately (SR 0.34 & 0.48 historical).  
3. Security selection via coded themes beats narrative-only.  
4. PCA for rates; fundamental+market themes for credit.  
5. Liquidity is first-class constraint in credit.  
6. Measure managers vs systematic baselines.  

---

## Formula / Identity Sheet

Duration-matched credit excess ≈ carry + spread change × (−spread duration).  
PCA: $dy = \sum_k pc_k loading_k$.  
IR ≈ IC × √breadth (credit universe large).  

---

## Numerical Pinboard

| Item | Value |
|------|-------|
| FI market size | >\$100T |
| MBS share context | ~\$9T of ~\$68T |
| Credit SR 1926–2020 | 0.48 |
| Term SR | 0.34 |
| Equity SR (comp) | 0.44 |


## Process Blueprint (Ch.11 Operationalized)

1. Strategic weights to term/credit/MBS premia from owner liabilities (Ang-consistent).  
2. Tactical signals scaled by expected IR and cost.  
3. Security selection model outputs α̂ with turnover penalty.  
4. Optimize subject to DV01, spread-duration, issuer, liquidity, ESG.  
5. Execute via electronified markets; measure implementation shortfall.  
6. Report factor-like premia attribution weekly.

## Link to Tuckman & Ang

Tuckman supplies pricing/hedging plumbing; Ang supplies bad-times rationale for term/credit; Richardson supplies the systematic investment process binding them for FI allocations.



---

## Source-Derived Research Blocks


### Research block 1

be extended to emerging markets as well. Although this can enhance the breadth of tactical allocation models, it is important to keep in mind that these are not independent bets, because there is a large common component in yield moves across countries and aggregate credit spreads across geogra- phies and rating categories. Careful risk budgeting is needed to account for the correlated positions. Expanding breadth for tactical investment decisions on term and credit premium also opens the choice of delta-adjusting your investment views. For example, in the cross-section of credit sensitive securities, there is natu- ral variation in the sensitivity of the credit and equity claims for an issuer (see e.g., Lok and Richardson 2011). As the riskiness of the borrower increases (think of increased leverage and/or increased volatility), the credit claim starts to resemble the equity claim more closely (Schaefer and Strebulaev 2008). In options-pricing language, the debt claim is more in the money and the value of that claim is more sensitive to the underlying asset value of the corporate issuer. Exhibit 3.17 shows this relation for a company that has both debt and equity outstanding. For simplicity, we assume that the risk-free rate is zero, the firm does not pay dividends, asset volatility is 40 percent, and the outstanding debt has a value of \$100. The hockey-stick shaped lines capture the intrinsic value of the respective claim (i.e., the equity claim has an intrinsic value of zero when the value of assets is less than the amount


### Research block 2

that needs to be paid to creditors). The dashed and dotted curves reflect the market value of the debt and equity claims, respectively, using standard option pricing formulae. What can we learn from Exhibit 3.17? As you start at the far right of Exhibit 3.17, the asset value of the firm is far more than the outstanding debt. Thus, any change in the expected asset value has very minimal impact on the credit value (i.e., the slope of the upper dashed line is relatively flat, so the debt claim is out of the money). But as you move from right to left, the asset value decreases relative to the value of the outstanding debt (the “distance to default” decreases) and the sensitivity of the credit claim to underlying asset value increases. At the point where the asset value approaches the value of outstanding debt, the sensitivity of the credit claim to changes in asset value approaches the sensitivity of the equity claim to changes in asset value (i.e., the slope of the two dashed lines become more similar as you move toward the middle). This is the key take-away: the credit and equity are expected to co-move more strongly when there is more underlying credit risk (up to a point, of course, because in distressed situations the equity claim becomes insensitive to changes in asset values because it is too far out of the money). What is the relevance to our tactical timing discussion? Investment decisions around aggregate credit markets might include views on (i) North American vs European corporate indices, (ii) IG vs. HY corporate indices, and (iii) developed vs. emerging market cor


### Research block 3

will be underinvested in government or corporate bonds. The determination of conditional attractiveness was made in a partial equilibrium framework with no direct awareness of what else was happening in the asset owner’s overall portfolio. Similar approaches for tactical timing can be applied to other asset classes, especially stocks. An asset owner needs to appreciate the con- sequences of tactical timing decisions in one asset class. How are these investment decisions to be funded? If the tactical insights are implemented via a derivative overlay, that may simply mean allowing risk levels to vary through time around a long-term target. By itself, that may not be too challenging, but when there are multiple tactical timing decisions across asset classes (and even within asset classes as we have examined here with term and credit premia), what happens if tactical investment views across the board are suggesting to take more or less risk? As of writing in 2021, with interest rates low and elevated asset prices across most markets (public and private), this is a daunting challenge for asset owners. Although it might be easy to say government bonds look expensive, what else looks cheap where you may reallocate your capital (risk)?


### Research block 4

Asness, C., A. Ilmanen, and T. Maloney. (2017). Market timing: Sin a little resolving the valuation timing puzzle. Journal of Investment Management, 15, 23–40. Asness, C., T. Moskowitz, and L. Pedersen. (2013). Value and momentum every- where. Journal of Finance, 68, 929–985. Asvanunt, A., and S. Richardson. (2017). The credit risk premium. Journal of Fixed Income, 26, 6–24. Brooks, J. (2017). A half century of macro momentum. AQR working paper. Grinold, R., and R. Kahn. (2000). Active Portfolio Management. McGraw-Hill. Houweling, P., and J. van Zundert. (2017). Factor investing in the corporate bond market. Financial Analysts Journal, 73, 100–115. Israel, R., D. Palhares, and S. Richardson. (2018). Common factors in corporate bond returns. Journal of Investment Management, 16, 17–46. Kessler, S., B. Scherer, and J. Harries. (2020). Value by design? Journal of Portfolio Management, 46, 25–43. Kozicki, S., and P. Tinsley. (2006). Survey-based estimates of the term structure of expected US inflation. Bank of Canada, working paper. Lok, S., and S. Richardson. (2011). Credit markets and financial information. Review of Accounting Studies, 16, 487–500. Schaefer, S. M., and I. A. Strebulaev. (2008). Structural models of credit risk are useful: Evidence from hedge ratios on corporate bonds. Journal of Financial Economics, 90, 1–19.


### Research block 5

This chapter starts with a high-level overview of the types of investment approaches that are commonly used by fixed income managers. Active fixed income investment strategies include (i) avoidance of bad-selling practices (e.g., avoiding simple reliance on index inclusion rules), (ii) duration timing and yield curve management generally (e.g., variants of the tactical tim- ing strategies discussed in Chapter 3), (iii) rotation across the broad sectors within aggregate indices (e.g., moving from developed to emerging markets or switching from duration to spread risk), (iv) seeking additional sources of return beyond the benchmark (e.g., private credit, bank loans and emerg- ing markets), and (v) security selection, the primary focus of this book. Most of the active fixed income returns in excess of benchmark can be explained by passive beta, particularly an overreliance on the credit pre- mium. We will see this pervasive pattern of reaching for yield via credit exposures across a wide set of active fixed managers including (i) US aggre- gate benchmarked managers (Core Plus), (ii) Global aggregate benchmarked managers, (iii) unconstrained bond managers, (iv) emerging market man- agers, and (v) credit long/short managers.


### Research block 6

a. Avoidance of bad selling practices: This covers a wide set of active invest- ment choices designed to avoid forced trading decisions because of index inclusion rules. Investment guidelines used by many large asset owners that force adherence to fixed income policy benchmarks can give rise to investment opportunities for those who are less constrained with respect to these guidelines. There are many examples. First, bonds are continu- ally issued over time as the entities issuing them are going concerns and they need a regular source of financing for their operating and invest- ment decisions. When bonds are newly issued, they do not enter bond indices until the month after their issuance. This creates a liquidity pro- vision opportunity for asset owners who can participate in the primary market and collect what is known as the “new issue concession” (see e.g., Chapter 7 in Ben Dor, Desclee, Dynkin, Hyman, and Polbennikov 2021). Second, corporate bond parent indices continue to be demar- cated by investment grade (IG) and high-yield (HY) ratings. Investor guidelines, especially for large insurance and pension entities, can limit or even preclude noninvestment grade rated securities. As, and when, corporate bonds are downgraded from IG to HY, this creates another liquidity provision opportunity for asset owners who are less rating con- strained. This tolerance for rating downgrades can avoid the losses that get realized by selling around the time of the downgrade, because prices are depressed at this point from a net supply–demand imbalance (see e.g., Chapter 2 in Ben Dor,


### Research block 7

The solid black line in Exhibit 4.1 is the time series of the US 10-year nominal bond yield over the 1993–2021 period. The short gray lines capture the forecast at the start of each calendar year for what the yield will be at the end of that calendar year. Nominal yield forecasts are the average across participants in the Consensus Economics dataset (results are similar if the median is used instead). The short dark pairs of horizontal lines that strad- dle the end of the gray lines capture the lower and upper quartile of yield forecasts across the forecasters covered by Consensus Economics. It should be very clear that professional forecasters are not successful in their fore- casts of one-year forward long-term US bond yields. If these forecasters were investors, the average absolute error in their forecasts is 1 percent. Given the duration for US 10-year government bonds is about 8, this translates to an average –8 percent annualized return from duration timing or yield curve management if you relied on professional yield forecasts. Humbling.


### Research block 8

fixed income policy benchmarks (e.g., Aggregate Indices). Examples include riskier HY corporate bonds, corporate loans, collateralized debt obligations, inflation-linked securities, and various forms of emerging market debt. Although the number of these out-of-benchmark sectors suggests a substantial increase in the investment opportunity set, it is useful to see how correlated the returns are across these sectors. Exhibit 4.2 reports the correlation of returns over the 1992–2020 for the main out-of-benchmark sectors. Although each sector has a low correlation with the term premium, and hence is potentially diversifying, it is important to note the very high correlation among these out-of-benchmark sectors. They do not appear to be diversifying beyond the credit premium. This will be a common theme for the rest of the chapter. d. Liquidity provision: This can cover some of the avoidance of bad selling practices discussed earlier, but it also reflects the return potential from efficient portfolio construction and trading execution. This is true espe- cially for corporate bonds, where liquidity can be hard to source, and even when it is found it can be very expensive to be a liquidity taker in corporate bond markets. So asset owners who have the scale and wherewithal to position themselves as regular liquidity providers can reap the benefits of very cheap trading. We will have more to say on this in Chapter 9 when we focus on trading. e. Security selection: This covers a wide variety of investment decisions based on the relative attractiveness of specific bonds at a particula


### Research block 9

So active fixed income investment decisions cover a vast opportunity set. Let us examine how successful incumbent active fixed managers are. Does the typical active fixed income manager beat the benchmark? If so, how are they beating the benchmark? Fixed income markets have idiosyncrasies (e.g., constantly evolving market with regular new issuance, option exercises, tenders, bifurcated liquidity pools, etc.) that may make it easier to beat the fixed income benchmark (see e.g., Baz, Mattu, Moore, and Guo 2017). What follows is an updated analysis of the excess of benchmark returns for a broad set of active fixed income managers. For full details of the orig- inal research, I refer readers to the following papers: (i) Brooks, Gould, and Richardson (2020) for the analysis on US Aggregate, Global Aggregate, and Unconstrained Bond funds, (ii) Brooks, Richardson, and Xu (2020) for the analysis of emerging market bond funds, and (iii) Palhares and Richardson (2020) for the analysis of credit long/short managers. In all cases, the empirical analysis will focus on returns. This has the ben- efit of consistent comparability across a very large number of active fixed income funds, allowing for greater generalizability of the results. It does, however, have the limitation of unobservability of holdings in the respective fixed income funds. We can only infer the exposures of each fixed income manager based on the observed correlation of their returns with what we call traditional market risk premia. For the sake of parsimony, we will use the main risk premia discussed in Chapter 3 (term


### Research block 10

Term US Term (USTP) Bloomberg Indices US Treasury excess of cash returns Term Global Term (GTP) Bloomberg Indices Global Treasury excess of cash (USD hedged) returns Term Global Aggregate (GAGG) Bloomberg Indices Global Aggregate excess of cash (USD hedged) returns Term Inflation Linked Securities (INF) Bloomberg Indices Global Aggregate Inflation Linked Securities excess of cash (USD hedged) returns Credit Corporate Debt (CP) 50%/50% Barclays U.S. High Yield Corporate Bond Index return in excess of Duration-Matched Treasuries/ S&P Leverage Loan Index in excess of three- month Libor Credit Emerging Debt (EMD) Bloomberg Indices Emerging Market Debt duration-adjusted excess returns Credit Emerging Corporate (EMCORP) Bloomberg Emerging Markets Corporate Index duration-adjusted excess returns Credit Emerging Currency (EMFX) Equal-weighted basket of emerging currency returns Volatility Treasury Implied Volatility (VOL) Delta-hedged straddles on 10-year US Treasury futures


### Research block 11

retained for the analysis, and funds with less than 24 months of returns data are excluded. This leaves a final sample of 142 funds for the returns analysis that follows, and this reduced sample of funds covers 97 percent of the \$1.7 trillion USD covered in this category. All returns are gross of fees. We run the following regression specification for each individual fund as well as for an equally weighted average across all funds. The period starts in January 1993 and runs through the end of 2020, and we use the full period available for each fund.


### Research block 12

The average active (excess of benchmark) return is 1.18 percent (annu- alized) across all 142 funds. The average realized tracking error is 2.4 per- cent (annualized), leading to an average Sharpe ratio of 0.54. Impressive. For this analysis we have forced all funds to have the same benchmark: Bloomberg US Aggregate. The regression coefficients suggest meaningful positive exposure to the credit premium. The strength of that positive corre- lation is emphasized in the last column that shows the average correlation of active returns to credit premium, 𝜌CP, is 0.72. Exhibit 4.5 shows a frequency histogram of this correlation coefficient across the 142 funds and Exhibit 4.6 shows a scatter plot of the monthly returns to the EW portfolio and credit premium. The strength of this passive beta capture is striking.


### Research block 13

Removing the effects of passive exposure to traditional market risk pre- mia reduces the average active return of 1.18 percent to an “alpha” return of 0.41 percent, a reduction of 65 percent. To emphasize the broad-based impact of how great an influence traditional market risk premia exposures have on the impressive active returns reported earlier, Exhibit 4.7 shows the relative frequency histograms of the annualized active returns and annual- ized alphas. The superimposed bell-shaped curves are normal distributions with a zero average return and standard deviation equal to the sample return standard deviation. This easily allows the reader to see both the economic and statistical impact of passive beta exposure on estimated alphas. The bars are clearly far to the right of zero for active returns and much less so for alphas.


### Research block 14

For our analysis of Global Aggregate benchmarked managers, we use the full universe of 108 active funds covered in the eVestment database under the “Global Aggregate” category as of the start of 2021. All active funds are retained for the analysis, and funds with less than 24 months of returns data are excluded. This leaves a final sample of 94 funds for the returns analysis that follows, and this reduced sample of funds covers 90 percent of the \$355 billion USD covered in this category. All returns are gross of fees. We run the following regression specification for each individual fund as well as for an equally weighted average across all funds. The period starts in


### Research block 15

The average active (excess of benchmark) return is 0.77 percent (annu- alized) across all 94 funds. The average realized tracking error is 3.8 per- cent (annualized), leading to an average Sharpe ratio (excess of benchmark returns) of 0.26. For this analysis we have forced all funds to have the same benchmark: Bloomberg Global Aggregate. The regression coefficients sug- gest positive exposures to the credit premium, emerging market premium, and volatility premium. The average correlation of active returns to the credit premium, 𝜌CP, is 0.29, considerably lower than what was seen for the Core Plus category. Exhibit 4.9 shows a scatter plot of the monthly returns to the equally weighted (EW) portfolio and credit premium, and we can again see a pervasive passive credit beta capture. Removing the effects of passive exposure to traditional market risk premia reduces the average active return of 0.77 percent to an “alpha” return of 0.57 percent, a reduction of 25 percent. Exhibit 4.10 shows the relative frequency histograms of the annualized active returns and annual- ized alphas. Again, it is easy to see the economic and statistical impact of


### Research block 16

For our analysis of Global Unconstrained Bond funds, we use the full universe of 113 active funds covered in the eVestment database under the “‘Global Aggregate” category as of the start of 2021. All active funds are retained for the analysis, and funds with less than 24 months of returns data are excluded. This leaves a final sample of 103 funds for the returns analysis that follows, and this reduced sample of funds covers 90 percent of the \$450 billion USD covered in this category. All returns are gross of fees. We run the following regression specification for each individual fund as well as for an equally weighted average across all funds. The period starts in November 1997 and runs through the end of 2020, and we use the full period available for each fund. The inclusion of the inflation risk premium shortens the sample by four years (Bloomberg Indices for inflation-linked securities started in 1997).


### Research block 17

The average active (excess of benchmark) return is 4.09 percent (annual- ized) across all 103 funds. The average realized tracking error is 6.9 percent (annualized), leading to an impressive average Sharpe ratio (excess of bench- mark returns) of 0.74. For this analysis we have forced all funds to have the same benchmark: US cash rates (T-bill returns). The regression coefficients suggest strong positive exposures to the term premium, credit premium, and emerging market currency premium. The average correlation of active returns to credit premium, 𝜌CP, is 0.63. Exhibit 4.12 shows a scatter plot of the monthly returns to the EW portfolio and credit premium, and we can again see a pervasive passive credit beta capture. y = 0.5095x + 0.0026 R2 = 0.512(Equally weighted) Average GlobalUnconstrained Bond Fund Active Return Credit Premium


### Research block 18

For our analysis of emerging market bond funds, we use the full universe of 131 active funds covered in the eVestment database under the “‘Global Aggregate” category as of the start of 2021. All active funds are retained for the analysis and funds with less than 24 months of returns data are excluded. This leaves a final sample of 117 funds for the returns analysis that follows, and this reduced sample of funds covers 98 percent of the \$355 billion USD covered in this category. All returns are gross of fees. We run the following regression specification for each individual fund as well as for an equally weighted average across all funds. The period starts in February 2003 and runs through the end of 2020, and we use the full period available for each fund. The inclusion of the emerging corporate risk premium shortens the sample by a further six years (Bloomberg Indices for emerging corporate securities started in 2003).


### Research block 19

3.66 percent (annualized), leading to an average Sharpe ratio (excess of benchmark returns) of 0.29. For this analysis we have forced all funds to have the same benchmark: the Bloomberg Emerging Market USD Aggregate Index. The regression coefficients suggest positive exposures to the emerging market premium and to a lesser extent the volatility premium. The average correlation of active returns to credit premium, 𝜌CP, is 0.26, lower than what was seen for the core-plus and unconstrained categories. Removing the effects of passive exposure to traditional market risk premia reduces the average active return of 1.04 percent to an “alpha” return of 0.54 percent, a reduction of just over 50 percent. Exhibit 4.15 shows the relative frequency histograms of the annualized active returns and


### Research block 20

Although there have been very attractive risk-adjusted returns for holding long-term government bonds over the past century, there have been extended periods of underperformance. Long-term government bonds have experienced a couple of lean decades in the middle of the past century, but experienced stellar returns over the last few decades with the secular decline in interest rates and yields. Combining Exhibit 2.8 with the declining and low yields seen in Chapter 1, it is natural to ask whether investing in government bonds (core fixed income) is still worthwhile. All investors would agree that if your investment view were that yields will increase going forward, then tactically you would reduce allocations to core fixed income. However, simply noting that yields are low, and therefore yields must rise, is too naïve. Equation 2.14 notes that yields are expected to be low if current short-term interest rates are low, expected future short-term


### Research block 21

interest rates are low and the term premium is low. At the time of this writing (the end of 2021), yields are low because the determinants of yields suggest so. We will revisit tactical investment decisions for fixed income in Chapter 3. Our purpose here is to make the strategic case for investing in long-term government bonds to harvest the term premium. There is a century of evi- dence to support this on a stand-alone basis. In the next section we will see how fixed income diversifies alongside equity to provide a more balanced overall portfolio.


### Research block 22

The credit premium is the additional return an investor expects to receive from holding a risky bond relative to the return from holding a similar risk- less bond. The risky and riskless bonds are similar in their cash flow profiles; they differ in terms of the probability of getting paid your coupons. A riskless government bond has zero probability of nonpayment, whereas for riskier corporate issuers there is a nonzero probability of nonpayment. The greater the risk of nonpayment, the greater the need for the expected return to com- pensate the investor. It is possible to quantify the extent of this risk ex ante. In Chapter 1 we talked about a “spread” and this is a market-implied view of the credit risk of the issuer. The spread can be computed by taking the difference in yields between the riskless and risky bonds with identical cash flows. If we extend our example of a 10-year coupon-bearing bond from Chapter 1, we can price that bond assuming the issuer is riskless, as in Equation (2.15), or risky, as in Equation (2.16):


### Research block 23

The only difference across Equations 2.15 and 2.16 is the discount rate. For the riskless bond we use a risk-free discount rate, y, such as a government bond yield. For the risky bond we use a different discount rate, y∗, such as a corporate bond yield. Generally speaking, y∗ > y, and the difference is the spread, that is, s = y∗ − y, and, because spreads are positive, s > 0, the price of the risky bond will be below that of the similar riskless bond, Prisky < Priskless. The credit spread is an ex-ante measure of the return potential from exposure to credit risk, analogous to yield as an ex-ante measure of the return potential from exposure to the term premium. We will have much


### Research block 24

to say on the determinants of credit risk, and hence credit spreads, later in Chapter 6 when we examine the default process in greater detail. Now, let’s look at the data to see whether investors have been compensated for bearing credit risk. Using an updated data series from Asvanunt and Richardson (2017) cov- ering the 1926–2020 period, we can examine the long-run evidence from investing in long-term corporate bonds. There are a variety of corporate bonds to select from for this exercise. To ensure consistency with the data historically, we will focus on investment-grade-rated corporate bonds (the high-yield market did not really develop until the 1980s). The source data for this time series is Ibbotson’s US Long-Term Corporate Bond Total Return for the 1926–1988 period and Bloomberg Indices (LUAC) for 1988–2020. Estimates of credit excess returns prior to 1988 require empirically estimat- ing interest rate sensitivities. Asvanunt and Richardson (2017) describe the details, but the basic idea flows from an understanding of what duration is. If we have access to corporate bond returns (we do, Ibbotson data goes back to 1926), and we can observe contemporaneous changes in government bond yields (we do, bond yield data also goes back at least as far as 1926), you can then approximate duration. A simple regression of the total returns of corporate bonds onto changes in government bond yields will produce a regression coefficient. That regression coefficient tells you the change in corporate bond prices (i.e., returns) for a given change in yield. And that is duration! Asvanun


### Research block 25

couple of decades reduces the size of the credit risk premium. Although in a strict sense that is correct, the pervasiveness of the credit-risk premium across geographies, rating categories, and its existence in both cash and index derivative markets makes its existence noncontroversial. A fun exercise for the reader is to use the century of data and find periods where there is no credit risk premium or select random periods and see how frequently you find a positive risk-adjusted return (the same can be done for the equity risk premium and term premium). I find this helpful to remind students what a risk premium means: over a long period the average return is positive, but in any one period it is not guaranteed to be positive. This also starts to get students thinking about what causes temporal variation in risk premium, setting up tactical investment decisions that we will cover in Chapter 3.


### Research block 26

flows from other obligations. They are a repackaging of existing contrac- tual commitments. There are sound economic reasons for these repackaged bonds: they allow for improved risk sharing among capital market par- ticipants. Of course, that efficient risk sharing only works if those market participants understand the risks that they are sharing in. Some would say that the Great Financial Crisis is the poster child for a lack of such under- standing. In any event, the securitized market is here to stay. As we noted in Chapter 1, the Global Securitized subcategory accounted for approxi- mately \$9 trillion USD, out of the \$68 trillion USD outstanding bonds in the Global Aggregate. The securitized market is very large. Within this category, however, there are many different types of securitized bonds. The Bloomberg Global Securitized index includes securitized bonds from four broad categories: (i) agency mortgage-backed passthrough securities, (ii) asset-backed securities, (iii) commercial mortgage-backed securities, and (iv) covered bonds. Agency MBS includes the passthrough bonds issued by government agencies including GNMA (Ginnie Mae, or the Government National Mortgage Association), FHLMC (Freddie Mac, or the Federal Home Loan Mortgage Corporation), and FNMA (Fannie Mae, the Federal National Mortgage Association). This category accounts for 75 percent of the total global securitized market (Bloomberg indices) as at December 31, 2020, and the majority of these are 30-year conventional fixed rate mortgages. These three entities are all government sponsored, whose purpose i


### Research block 27

be single-tranche or multitranche facilities, which adds a further layer of complexity to the securitization. The covered-bonds category within the Bloomberg Global Securitized Index accounted for around \$1.4 trillion USD as at December 31, 2020, and is almost exclusively related to mortgage loans issued outside the United States (typically by European financial institutions). What all the securitized bonds share is a risk associated with early pre- payment. That risk commands a premium in the form of a spread over cash-flow-matched riskless government bonds. In some cases, there will also be credit risk associated with the underlying entity creating and servicing the securitized debt. Estimating the duration profile of these securitized bonds, so as to measure spreads, can be very challenging, as the future cash flows are dependent on current interest rates and expected paths of future interest rates. The behavior of the underlying mortgage holders may also need to be modeled in response to your forecasted future path of interest rates. This is no easy task, and different smart people trying to estimate the same interest rate sensitivities may end up with very different answers. Diep, Eisfelt, and Richardson (2021) examined the prepayment risk pre- mium embedded in the US securitized market using 30-year fixed-rate bonds backed by Fannie Mae. This involved assessing the return profile across the “coupon stack.” At a point in time there will be outstanding pooled mort- gages from various points in time, so while new fixed-rate mortgages all have a similar rate, over time, a


### Research block 28

coupon rates below prevailing market rates (i.e., the supply of MBS is domi- nated by discount MBS) the opposite is true: discount coupons attract higher spreads. The market price of prepayment risk is time varying. Why all this seemingly technical discussion? This will be clear when we look at the return profile of excess returns for securitized bonds. Exhibit 2.10 shows the cumulative and rolling three-year average returns for US MBS. Over the 1988–2020 period the full sample Sharpe ratio is 0.26, which is only slightly smaller than the risk premia observed for the term premium and credit premium. This Sharpe ratio of 0.26 is considerably lower than the 1.34 reported in Exhibit 2.1 because we are now talking about the nonrate component of returns (i.e., excess returns over duration marched govern- ment bonds, not excess returns over cash). Over this time period, the rate component of returns for all fixed income assets was strongly positive. Still, a Sharpe ratio of 0.26 is economically meaningful, but it does mask an excep- tionally low average excess return (about three basis points annualized over this period). What is causing this? It could be measurement error in the estimates of duration used to measure spreads. This is likely not the cul- prit, as similar patterns of tiny excess returns are observed using estimates of duration across different index providers or using empirical estimates of duration. The source of the small average excess return is that the MBS index has most of its securities outstanding at close to par (prevailing mortgage rates). This means that


### Research block 29

sensitive to prepayment shocks (\$100 notional will return \$100). They will be sensitive to volatility in interest rates because there may be future pre- payment risk for these bonds, but that effect is small. Attempts to capture the prepayment risk premium need to focus on securities that are distant from par (i.e., premium and discount securities in the “wings” of the coupon stack) and ideally condition exposure to discount and premium bonds based on the prevailing market price of prepayment risk. The greatest excess return potential for securitized assets resides in the less liquid corners of this mar- ket (e.g., nonagency securitized bonds and far out of the money mortgage pools). We could add further categories of fixed income risk premia. The two most obvious categories would be for emerging and private markets. An emerging market fixed income risk premium would reflect the combina- tion of return opportunities across emerging market local currency bonds, emerging market hard currency bonds, and emerging currency returns. The emerging market corporate risk is very similar in spirit to the developed market credit premia already discussed, and the emerging market local cur- rency (mostly government bonds) is like the developed market term premium already discussed. Extending the cross-section of government and corporate bond issuers beyond developed markets will provide additional diversifica- tion benefits as the risks underlying term premium (inflation and growth shocks) and credit premium (growth shocks) can be diversified internation- ally. Finally, emerging market h


### Research block 30

annualized total return of the Bloomberg High Yield Index (LF98) over the 2004–2020 period was 7.6 percent and an associated Sharpe ratio of 0.83. This is a lot smaller than the 2.47 Sharpe ratio for private markets over the same period, but the difference is primarily attributable to return volatil- ity, not to the level of returns. Private markets are another way to capture the credit risk premium, but it is not clear how diversifying they really are. And for some direct-lending activities that have short track records, there is concern about security selection around default risk. Private credit markets have the potential to add to credit risk premium, but more data analysis is needed.


### Research block 31

We can now put what we have learned together to think about broader asset allocation decisions. Why do we allocate to fixed income markets, and subcategories within fixed income markets? Section 2.2 illustrated stand-alone evidence supporting (i) investments into government bonds to harvest the term premium, (ii) investments into corporate bonds (and other credit-sensitive assets) to harvest the credit premium, and (iii) investments into securitized markets to harvest the prepayment premium. But are these risk premia additive in the context of the asset owner’s overall portfolio? This is particularly important in the context of investments into the less liquid, and hence more costly to trade, corners of the fixed income markets like corporate and securitized bonds. Don’t incur transaction costs and introduce liquidity risk to your portfolio unless you are compensated for doing so. Let’s start with the empirical fact that equity markets (public and pri- vate) are represented in most, if not all, asset owner portfolios. The equity risk premium has long been the base building block of asset allocation. Government bonds are added to equities in the classic 60/40 portfolio (60 percent capital allocated to equities and 40 percent allocated to bonds). The ubiquitous nature of the 60/40 portfolio reflects the fundamental strategic diversification benefit of fixed income relative to equities. Indeed, there are now many risk parity variants (e.g., Bridgewater, PanAgora, AQR etc.) that prudently utilize leverage to allocate across stocks and bonds (and other diversifying asset classes


### Research block 32

Exhibit 2.11 shows the annualized return of US government bonds and US stocks over the 1926–2020 period using rolling 10-year periods to esti- mate annualized returns. The exhibit also shows the correlation between US bonds and US stocks over the past 120 months. The correlation between stocks and bonds has varied enormously over this period, but it has only been reliably negative for the past couple of decades. A 60/40 combination of US bonds and US stocks generates a full sample Sharpe ratio of 0.49 that exceeds the 0.44 (0.35) Sharpe ratio for US stocks (bonds) over the same period. This higher risk-adjusted return is due to the less than one correla- tion between stocks and bonds and the fact that they both have a similar return per unit of risk. Of course, the unlevered 60/40 portfolio generates a total return that is lower than that of equities (5.6 percent annualized return for 60/40 vs. 8.2 percent annualized returns for US stocks), but leverage can increase the return of the 60.40 portfolio to 9.1 percent and yield the same overall volatility of the US stocks only portfolio. –0.6


### Research block 33

corporations are exposed to underlying macroeconomic variables: growth and inflation. Stocks have a positive exposure to economic growth shocks (stock prices rise and fall with changing expectations of the business cycle). Stocks have a relation to inflation shocks (generally they fare better in lower inflationary environments, but this relation is more subtle – see e.g., Ilmanen, Maloney, and Ross 2014). Government bonds, as we discussed in Section 2.2, are also exposed to growth and inflation. Improving business cycle out- look or increasing inflation leads to more cautionary monetary policy and higher yields (hence lower returns), whereas worsening business cycle out- look or falling inflation leads to more accommodative monetary policy and lower yields (hence higher returns). It should therefore be clear that stocks and bonds structurally have a different sign on their sensitivity to growth shocks (growth shocks are good for stocks and bad for bonds), but a sim- ilar sign on their sensitivity to inflation shocks (inflation shocks are bad for stocks but even worse for bonds). It is this difference in sensitivities to underlying macroeconomic state variables that creates the diversification benefit across stocks and bonds. Of course, there are other drivers of stock and bond returns including (i) aggregate risk aversion that would increase the common component of stock and bond returns, and (ii) sentiment or net demand factors from capital market participants seeking safe-haven assets that decrease the common component of stock and bond returns. Indeed, the temporal varia


### Research block 34

R is a vector of average corporate bond, government bond, and stock excess returns; w is the vector of portfolio weights to be solved for; and 𝚺 is the corresponding excess return covariance matrix. The optimal portfolio solution is mean-variant efficient. An important caveat for the large asset owner is that this analysis does not incorporate information on the expected transaction costs or capacity of each asset, and as such the results here should be interpreted with caution for large asset allocation decisions. Capacity con- siderations would reduce the importance of less liquid assets (e.g., corporate bonds and/or credit index derivatives) in the overall portfolio.


### Research block 35

For the 1926–2020 period, the optimal weights are 55 percent for cor- porate bonds, 36 percent for government bonds, and 9 percent for stocks. Of course, this analysis can be run for different time periods with very dif- ferent optimal weights. For the period 1973–2020 (which is the period after the original Lehman indices that pre-date the Bloomberg Indices started) the optimal weights are 23 percent for corporate bonds, 63 percent for govern- ment bonds, and 14 percent for stocks. A potential limitation of this optimal weight analysis is that it is based on a mean-variant analysis of returns, which may be less relevant when the underlying distribution of returns is not normal. Asvanunt and Richardson (2017) assess whether the inference that the credit risk premium is additive to both the term and equity risk premium is robust to return nonnormality. That analysis uses the Sortino ratio (e.g., Sortino and Price 1994):


### Research block 36

Given our choice of a 0% target return, the numerator of our Sortino ratio will be the same as that for the Sharpe ratio. The difference is in the denominator, where the Sortino ratio only “penalizes” return realiza- tions that are below the target return. Both the frequency and magnitude of below-target returns are penalized. For the period 1926–2020 the optimal weights that maximize the Sortino ratio are as follows: 51 percent for cor- porate bonds, 39 percent for government bonds, and 10 percent for stocks. There is consistent evidence that fixed income allocations are important for overall portfolio diversification.


### Research block 37

a strong belief in mean reversion. If government bond yields are low, they must revert to a higher level. And if the fear is that mean reversion will happen soon, that fear leads to an investment decision: reduce allocations to the asset class with near-term expected losses. Although rising yields do not automatically lead to negative returns, because carry still has a positive expected return (i.e., the change in the yield multiplied by duration needs to exceed the initial yield), directionally rising yields mean lower future returns. Is that fear of rising yields rational? The discussion of term premium in Section 2.2 tells us that long-term government bond yields are determined by current short-term interest rates, expected short-term interest rates in the future, and the term premium (a catch-all for risk aversion, sentiment, and general macroeconomic uncertainty). The low yields today might be justi- fied if we look at the economic backdrop (low levels of inflation, low levels of economic growth, and central banks universally consistent in their use of monetary policy to help stimulate the real economy). Although inflation and growth expectations remain low, government bond yields may remain low for the foreseeable future. What does this mean for fixed income investors? There is still the potential for positive returns by allocating to long-term gov- ernment bonds. And this is especially true for the investor who can make use of derivatives to maintain a constant-maturity exposure to a long-dated gov- ernment bond (e.g., 10-year Treasury Note Future). Although the shap


### Research block 38

Gilchrist, S., B. Wei, V. Yue, and E. Zakrajsek. (2021). The Fed takes on corporate credit risk: An analysis of the efficacy of the SMCCF. NBER working paper. Holston, K., T. Laubach, and J. Williams. (2017). Measuring the natural rate of inter- est: International trends and determinants. Journal of International Economics, 108, S39–S75. Ilmanen, I., T. Maloney, and A. Ross. (2014). Exploring macroeconomic sensitivi- ties: How investments respond to different economic environments. Journal of Portfolio Management, 40, 87–99. Kizer, J., S. Grover, and C. Hendershot. (2019). Re-examining the credit premium. Buckingham Strategic Wealth, working paper. Laubach, T., and J. Williams. (2003). Measuring the natural rate of interest. Review of Economics and Statistics, 85, 1063–1070. Sortino, F. A. and L. N. Price (1994). Performance measurement in a downside risk framework. Journal of Investing, 3, 59–64.


### Research block 39

This chapter lays out a framework for timing the two primary traditional risk premia in fixed income markets: the term premium and the credit pre- mium. Building on our understanding of the sources of these risk premia discussed in Chapter 2, we will start to think about forecasting when those risk premia are expected to out (under) perform. The framework is designed to be general to identify the relevant inputs for timing models. We are not designing the “best” possible timing models. That arduous task is for the fixed-income investor. That said, the simple timing models introduced in this chapter show some promise for out-of-sample forecasts of risk premia. Data mining concerns are especially important with timing models, as there is a very limited dataset to work with (one history for one asset), so we will discuss the importance of point-in-time timing models and unconscious bias that creeps into reworked timing models.


### Research block 40

In Chapter 2 we saw that long-term US government bonds generated an attractive risk-adjusted excess (of cash) return over the past century. This is known as the term premium. Obviously, although the term premium has a positive average excess return, there was considerable temporal variation. Indeed, the annualized average excess return was 1.8 percent and the average annualized volatility was 5.1 percent over the past century. The asset owner then asks: Is it possible to vary my exposure to the term premium through time to try and capture more than just the average 1.8 percent return? That is the purpose of this section. 57


### Research block 41

To be clear, this is an approximation simply to illustrate that changing expectations about the discount rate will determine the change in govern- ment bond prices and hence the return. The other component of the return is governed by the initial yield: ownership of the bond carries participation rights in the expected, and in this case known, coupons and principal pay- ments. As discussed in Chapter 1, at the time of purchase of the bond the price of the bond implies a yield to maturity. So our expected return has two broad components:


### Research block 42

We now have our simple framework. Our timing model for the term premium will focus on these two components of expected excess returns (i.e., in excess of cash to be consistent with our definition of term premium at the start of the chapter). First, we have the initial yield. More generally, this can be thought of as the “carry” associated with the government bond position. Second, we have the expected change in yields over the investor’s holding period. Technically, this change in yield needs to be multiplied by duration to convert the expected change in yield to an expected return.


### Research block 43

Exhibit 3.1 provides a simple representation of what “carry” is. If noth- ing happens but the passage of time, carry is the return you will receive. In the case of our risk-free government bond from Equation (3.4), this means that the return we get from carry is the price change for our bond when the discount-rate term structure remains unchanged, but, we are now discount- ing the fixed set of coupon and principal payments after rolling the cash flows forward (i.e., we are repricing the bond cash flows with the same discount rates, but because the cash flows are shifted forward they are discounted at different rates). We can write the approximate expected excess return (here the excess of cash is explicit) assuming the discount rate structure remains unchanged as:


### Research block 44

Equation (3.6) is approximate, because we have made use of duration and are working with a linear, first-order approximation of expected returns. We are ignoring higher-order moments of yield curve changes. This simply says that a measure of carry should reflect the current yield to maturity and expected changes in yields from the passage of time (i.e., yield curve does not change its shape). For our measure of carry we will use what is called the term spread, y LT Bond t − y ST Bond t , the difference in the nominal long-term government bond yield and the nominal short-term government yield (labeled by the thick black arrow in Exhibit 3.1). This is simply the first portion of Equation (3.6). We are making this choice for data expediency. As we will discuss in Section 3.1.b, our data access for the last century does not include rich data of the entire yield curve, so this approximation is out of necessity. As depicted in Exhibit 3.1, this simple measure will miss curvature in the yield curve and the associated “roll-down” component (labeled by the thin black arrow in Exhibit 3.1). This “roll-down” captures the expected change in yield from the passage of time. This gives a better measure of “carry,” but still leaves open the possibility of other expected changes in yields (and hence returns). The second component of expected excess returns in Equation (3.4) is the expected change in yields. For this, we will lean heavily on recent research (e.g., Asness, Moskowitz, and Pedersen 2013, and Asness, Ilmanen, and Maloney 2017) and group our timing models into two broad categorie


### Research block 45

(one-month) were only formally introduced in 1929, Global Financial Data can source Treasury instruments with a slightly longer maturity (three to six months) to complete the series back to 1920. Treasury bill secondary market prices and yields are computed as the averages of the bid rates quoted by a sample of primary dealers who report to the Federal Reserve Bank of New York. We use prices and yields as of the close of the last trading day each month to compute (i) T-bill yield (used as a component of our carry measure), and (ii) T-bill returns (used as our measure of cash returns). Data for the yields and returns of long-term government bonds are also from Global Financial Data. Over our 1920–2020 period, long-term government bond yield and return data are linked to the Federal Reserve Board’s 10–15 Treasury Bond Index for the 1920–1941 period, and specific 10-year bonds are used from 1941 onward. This data is used to compute (i) US government bond nominal yield (used as part of the real bond yield value measure), and (ii) US government bond total returns (used to compute US government bond excess returns, our primary variable of interest to forecast). Data for long-term inflation expectations comes from multiple sources (thank you to Antti Ilmanen for graciously sharing this data). From 1920 to 1955, statistical estimates based on a weighted average of past 10-year inflation rates are used. From 1955–1978 statistical estimates of long-term inflation expectations from Kozicki-Tinsley (2006) are used (their statistical estimates use a different weighting function that als


### Research block 46

We can now assess whether, and how, our return forecasting framework works. To do this we need to create a time series of “signals” that indicate our willingness to increase or decrease our exposure to long-term govern- ment bonds (term premium). We will assess our skill from the perspective of a real money investor who needs to remain invested in the fixed income markets, but is able to dial up or down the amount of capital invested into the market at any specific point in time. We have three investment signals: (i) value (measured as real bond yield, the difference between nominal long-term government bond yields and long-term inflation forecasts), (ii) momentum (measured as the most


### Research block 47

recent 12-month arithmetic average of long-term government bond excess returns, and (iii) carry (measured as the term spread, or difference between long-term government bond nominal yields and short-term government bill nominal yields). For each of these three measures we need to convert them to a “sig- nal.” It is important that we do not make use of any future information when constructing these signals (that would be cheating). For each measure we will conduct the following transformations: (i) extreme value treatment (to help reduce the influence of extreme values we will cap and floor each signal based on the expanding 95th and 5th percentile values, respectively), (ii) benchmarking (we will subtract from the current realization of the unpro- cessed signal the expanding median value of its value), (iii) volatility scaling (we will divide that benchmark adjusted value by a measure of volatility, we will use a nonparametric method computed as an expanding window of the difference between the 95th and 5th percentile value of the respective signal), and (iv) timing curves (our effectively Z-scored signal is converted to a value that can be applied to the capital invested in long-term govern- ment bonds, we will use a simple linear capped and floored transformation that is restricted to be between 50 and 150 percent invested in bonds). These choices mirror those made in Asness, Ilmanen, and Maloney (2017).


### Research block 48

It is easiest to see how these various transformations affect the raw values of signals visually. Exhibit 3.2 consists of four panels that illustrate the impact of each transformation on our real bond yield value signal. Panel A is a scatter plot reflecting the impact of treatment of extreme values. At first glance this may look surprising, as there is not a concentration of data points at a global extreme value. This is because the capping and flooring is done each month using all data available up until that point. Consequently, what is extreme is an evolving concept over time. The correlation between the original and capped/floored values is 0.96. Panel B is a scatter plot reflecting the impact of benchmarking and volatility scaling. This transformation is changing the information contained in real bond yields over the full period. What is going on? This is because our analysis needs to be at a point in time. For each month we can only make use of the information that was available at that point in time. Thus, the benchmarking is based on a median of real bond yield using all data up to the month of interest, and the nonparametric volatility scaling is also only using information on the distribution of real bond yields up to the month of interest. The correlation between the capped/floored real bond yield and the fully transformed value signal is 0.86. In contrast, if we had


### Research block 49

used a full-sample median and full sample 95th less 5th percentile deflator we would have a correlation of 1. This is not a loss of information from a tactical asset allocation perspective. You can only use information that is available to you at the relevant time. Panel C then shows the impact of our selected timing curve. This has the expected shape as all values more than 0.5 in absolute value are floored and capped at −0.5 and +0.5, respectively. This monotone transformation is one way to scale the strength of your convictions in the signal. There is a lot of choice here. Our choice is linear in the transformed real bond yield signal between −0.5 and +0.5. We are choosing not to tactically vary our positions in government bonds too much. Alternative choices could be placing even less weight on central values and only taking active positions when your signal is sufficiently large in either direction. Finally, we are now able to assess whether our simple value measure has any out-of-sample success in timing exposure to the term premium. Panel D shows the data. The vertical axis is the one-month forward excess return of long-term government bonds, and the horizontal axis is the fully trans- formed value signal. The line of best fit is shown on the exhibit and it has an R2 of 0.0006, which corresponds to a correlation (information coefficient) of 0.024. This is a small correlation coefficient and suggests value signals, at least as we have chosen to measure them, have only limited success in timing exposure to the term premium. Exhibit 3.3 and Exhibit 3.4 show scatter plots


### Research block 50

The correlation across the active return series is informative to help understand the return profile of the combinations of signals. Value and momentum have a modest negative correlation of −0.17, value and carry have a very low correlation of 0.01, and momentum and carry have a positive correlation of 0.48 (part of this higher correlation is due to the use of total returns as the measure of momentum that includes the realization of carry). The combination of value and momentum, and value and momentum and carry, are formed by simple averages of the underlying fully transformed individual signals. Given their low pairwise correlations, it is not surprising to see improved risk-adjusted returns from the combinations. This is diversification at work. Although the Sharpe ratios are all positive, the magnitude is small com- pared to the full sample Sharpe ratio for the term premium (0.35). The astute reader will notice that this Sharpe ratio is slightly different than the 0.34 quoted in Chapter 2 (this is due to a slightly longer time period and different data source used here). The average excess return for long-term government bonds is around 2 percent for the 1920–2020 period. Except for carry, the “alphas” in Exhibit 3.5 are small relative to the term premium itself (of course, leverage can be applied to a long/short implementation of the var- ious timing signals to increase the level of returns). Furthermore, these active investment decisions all require active trading, which would incur additional trading costs. The returns that we have looked at are all before accounting 

