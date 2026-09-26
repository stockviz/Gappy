# Risk Management and Financial Institutions (5th ed.) — Detailed Quantitative Research Notes

**Title:** Risk Management and Financial Institutions  
**Author:** John C. Hull  
**Edition:** Fifth Edition, 2018  
**Publisher:** John Wiley & Sons (Wiley Finance)  
**ISBN:** 978-1-119-44811-2 (cloth); 978-1-119-44816-7 (ePDF); 978-1-119-44809-9 (ePub)  
**Companion:** www-2.rotman.utoronto.ca/~hull ; RMFI Software v1.00  
**Structure:** 29 chapters in 5 parts + appendices — Institutions & trading; Market risk; Regulation; Credit risk; Other topics (stress, op risk, liquidity, model risk, economic capital, ERM, innovation, mistakes)

---

## Problem / Motivation

Unified textbook for market, credit, operational, and liquidity risk in banks, insurers, funds—integrating valuation (risk-neutral vs real-world), regulatory capital (Basel I→III, FRTB, SA-CCR, Solvency II), and risk measures (VaR, ES, coherent measures). Aimed at managers, FMA/PRM candidates, and courses; math kept accessible with numerical examples and software.

**5th ed. new material:** financial innovation (Ch.28); OTC derivatives regulation & SIMM (Ch.17); rewritten FRTB (Ch.18); model-building VaR/ES for SIMM/FRTB (Ch.14); op risk SMA (Ch.23); model risk SR 11-7 (Ch.25); IFRS 9, SA-CCR.

---

## Part 1 — Institutions & Trading (Ch.1–7)

**Ch.1:** Risk vs return; efficient frontier; CAPM; APT; corporate risk management motives; credit ratings.  
**Ch.2 Banks:** commercial vs investment banking; capital; deposit insurance; conflicts; risks.  
**Ch.3 Insurance/Pensions:** mortality tables; longevity; P&C; moral hazard/adverse selection; reinsurance; capital.  
**Ch.4 Funds:** mutual funds, ETFs, HF strategies & performance.  
**Ch.5 Markets:** clearing, longs/shorts, vanilla & exotic derivatives; risk challenges (snapshots: P&G, SocGen).  
**Ch.6 Crisis 2007–08:** housing, securitization, BBB heterogeneity, lessons.  
**Ch.7:** Risk-neutral vs real-world valuation; when both needed; estimating real-world processes.

---

## Part 2 — Market Risk (Ch.8–14)

**Ch.8 Greeks:** delta, gamma, vega, theta, rho; Taylor expansions; dynamic hedging; exotics.  
**Ch.9 Rates:** NII; duration/convexity; nonparallel shifts; PCA; gamma/vega on rates.  
**Ch.10 Vol:** implied vol; non-normality; power law; EWMA; GARCH(1,1); MLE; forecasting.  
**Ch.11 Corr/Copulas:** monitoring corr; Gaussian vs copulas; Vasicek loan portfolio model.  
**Ch.12 VaR & ES:** definitions; VaR drawbacks; ES; coherent risk measures; marginal/incremental/component; Euler; aggregation; backtesting.  
**Ch.13 Hist sim & EVT:** methodology; accuracy; extensions; EVT applications.  
**Ch.14 Model-building:** linear/quadratic; term structures; risk weights; nonlinearity; vs hist sim; SIMM/FRTB relevance.

### Key formulas

VaR$_\alpha$ = loss quantile; ES$_\alpha=\mathbb{E}[L|L>\mathrm{VaR}_\alpha]$.  
EWMA: $\sigma_n^2=\lambda\sigma_{n-1}^2+(1-\lambda)u_{n-1}^2$.  
GARCH(1,1): $\sigma_n^2=\omega+\alpha u_{n-1}^2+\beta\sigma_{n-1}^2$.  
Duration/convexity P&L ≈ −DΔy + (1/2)C(Δy)^2.  
PCA on yield curve for nonparallel risk.

---

## Part 3 — Regulation (Ch.15–18)

Basel I (1988), 1996 market risk amendment, Basel II (credit IRB, op risk, pillars), Solvency II.  
Basel II.5/III: capital, liquidity (LCR/NSFR), CoCos, SA-CCR, Dodd–Frank.  
OTC clearing, uncleared margin, SIMM.  
FRTB: standardized vs IMA; trading vs banking book boundary.

---

## Part 4 — Credit Risk (Ch.19–21)

Default probs: ratings, historical, recovery, CDS, spreads→PD, equity-based (Merton).  
CVA/DVA; wrong-way risk.  
Credit VaR: transition matrices, Vasicek, CreditRisk+, CreditMetrics, spread risk.

---

## Part 5 — Other Topics (Ch.22–29)

Stress testing; op risk (SMA, power law, SOX); liquidity trading/funding/black holes (Northern Rock, MG, 1987); model risk (London Whale, Kidder); economic capital & RAROC; ERM (appetite, culture); fintech innovation; mistakes (risk limits, trading room, liquidity).

**Business snapshots:** LTCM, SocGen, London Whale, Metallgesellschaft, Ashanti, Wells Fargo cross-sell, ABACUS, etc.—case library for controls.

---

## Practical Takeaways for Quants

1. Prefer ES / coherent measures alongside VaR (FRTB direction).  
2. Separate risk-neutral pricing from real-world risk measurement.  
3. GARCH/EWMA for vol; copulas for default dependence.  
4. PCA for curve risk beyond duration.  
5. CVA/DVA and wrong-way risk in derivatives books.  
6. Model risk governance (SR 11-7) equal to market risk.  
7. Liquidity black holes: crowded strategies fail together.  
8. Economic capital / RAROC for business steering.  
9. Learn from snapshot failures—limits, culture, liquidity.  
10. Keep regulation calendar (Basel/FRTB) in model roadmap.

---

## Numerical / Conceptual Pinboard

| Topic | Hull emphasis |
|-------|----------------|
| Risk measures | VaR, ES, coherence |
| Vol models | EWMA, GARCH(1,1) |
| Dependence | Corr matrices, copulas, Vasicek |
| Rates | Duration, convexity, PCA |
| Credit | CDS, CVA/DVA, Credit VaR |
| Capital | Basel I–III, FRTB, Solvency II |
| Liquidity | LCR/NSFR concepts; case failures |


## Mapping Hull to a Quant Production Stack

Market data → Greeks/VaR/ES engines (hist + parametric) → limit system → capital (FRTB SA/IMA) → CVA desk → stress inventory → model validation. Appendices A–L supply compounding, zeros, forwards, swaps, options, Taylor, eigen, PCA, transitions, CDS, synthetic CDOs—use as formula cards.

## Limitations

2018 vintage—update for final FRTB calibrations, SA-CCR experience, and post-2020 market moves. Still the standard institutional RM reference.



---

## Source-Derived Research Blocks


### Research block 1

Many people have played a part in the production of this book. I have benefited from interactions with many academics and practicing risk managers. I would like to thank the students in my MBA, Master of Finance, and Master of Financial Risk Management courses at the University of Toronto, many of whom have made suggestions as to how the material could be improved. Alan White, a colleague at the University of Toronto, deserves a special acknowl- edgment. Alan and I have been carrying out joint research and consulting in the area of derivatives and risk management for about 30 years. During that time we have spent countless hours discussing key issues. Many of the new ideas in this book, and many of the new ways used to explain old ideas, are as much Alan’s as mine. Alan has done most of the development work on the RMFI software. Special thanks are due to many people at Wiley, particularly Bill Falloon, Mike Hen- ton, Kimberly Monroe-Hill, Judy Howarth, and Steven Kyritz, for their enthusiasm, advice, and encouragement. I welcome comments on the book from readers. My e-mail address is:


### Research block 2

I magine you are the Chief Risk Officer (CRO) of a major corporation. The Chief Executive Officer (CEO) wants your views on a major new venture. You have been inundated with reports showing that the new venture has a positive net present value and will enhance shareholder value. What sort of analysis and ideas is the CEO looking for from you? As CRO it is your job to consider how the new venture fits into the company’s portfolio. What is the correlation of the performance of the new venture with the rest of the company’s business? When the rest of the business is experiencing difficulties, will the new venture also provide poor returns, or will it have the effect of dampening the ups and downs in the rest of the business? Companies must take risks if they are to survive and prosper. The risk management function’s primary responsibility is to understand the portfolio of risks that the company is currently taking and the risks it plans to take in the future. It must decide whether the risks are acceptable and, if they are not acceptable, what action should be taken. Most of this book is concerned with the ways risks are managed by banks and other financial institutions, but many of the ideas and approaches we will discuss are equally applicable to nonfinancial corporations. Risk management has become progres- sively more important for all corporations in the last few decades. Financial institutions in particular are finding they have to increase the resources they devote to risk man- agement. Large “rogue trader” losses such as those at Barings Bank in 1995, Allied Irish Bank


### Research block 3

carefully developed. Huge subprime losses at banks such as Citigroup, UBS, and Merrill Lynch would have been less severe if risk management groups had been able to convince senior management that unacceptable risks were being taken. This chapter sets the scene. It starts by reviewing the classical arguments concerning the risk-return trade-offs faced by an investor who is choosing a portfolio of stocks and bonds. It then considers whether the same arguments can be used by a company in choosing new projects and managing its risk exposure. The chapter concludes that there are reasons why companies—particularly financial institutions—should be concerned with the total risk they face, not just with the risk from the viewpoint of a well-diversified shareholder. 1.1 Risk vs. Return for Investors


### Research block 4

As all fund managers know, there is a trade-off between risk and return when money is invested. The greater the risks taken, the higher the return that can be realized. The trade- off is actually between risk and expected return, not between risk and actual return. The term “expected return” sometimes causes confusion. In everyday language an outcome that is “expected” is considered highly likely to occur. However, statisticians define the expected value of a variable as its average (or mean) value. Expected return is therefore a weighted average of the possible returns, where the weight applied to a particular return equals the probability of that return occurring.The possible returns and their probabilities can be either estimated from historical data or assessed subjectively. Suppose, for example, that you have \$100,000 to invest for one year. Suppose further that Treasury bills yield 5%. 1 One alternative is to buy Treasury bills. There is then no risk and the expected return is 5%. Another alternative is to invest the \$100,000 in a stock. To simplify things, we suppose that the possible outcomes from this investment are as shown in Table 1.1. There is a 0.05 probability that the return will be +50%; there


### Research block 5

This shows that, in return for taking some risk, you are able to increase your expected return per annum from the 5% offered by Treasury bills to 10%. If things work out well, your return per annum could be as high as 50%. But the worst-case outcome is a −30% return or a loss of \$30,000. One of the first attempts to understand the trade-off between risk and expected return was by Markowitz (1952). Later, Sharpe (1964) and others carried the Markowitz analysis a stage further by developing what is known as the capital asset pricing model. This is a relationship between expected return and what is termed “systematic risk.” In 1976, Ross developed arbitrage pricing theory, which can be viewed as an extension of the capital asset pricing model to the situation where there are several sources of systematic risk. The key insights of these researchers have had a profound effect on the way portfolio managers think about and analyze the risk-return trade-offs they face. In this section we review these insights.


### Research block 6

where σ1 and σ2 are the standard deviations of R1 and R2 and ρ is the coefficient of correlation between the two. Suppose that μ1 is 10% per annum and σ1 is 16% per annum, while μ2 is 15% per annum and σ2 is 24% per annum. Suppose also that the coefficient of correlation, ρ, between the returns is 0.2 or 20%. Table 1.2 shows the values of μP and σP for a number of different values of w1 and w2. The calculations show that by putting part of your money in the first investment and part in the second investment a wide range of risk- return combinations can be achieved. These are plotted in Figure 1.2.


### Research block 7

Most investors are risk-averse. They want to increase expected return while reduc- ing the standard deviation of return. This means that they want to move as far as they can in a “northwest” direction in Figures 1.1 and 1.2. Figure 1.2 shows that forming a portfolio of the two investments we have been considering helps them do this. For example, by putting 60% in the first investment and 40% in the second, a portfolio with an expected return of 12% and a standard deviation of return equal to 14.87% is obtained. This is an improvement over the risk-return trade-off for the first investment. (The expected return is 2% higher and the standard deviation of the return is 1.13% lower.) Expected return (%) Standard deviation of return (%) 0


### Research block 8

Let us now bring a third investment into our analysis. The third investment can be com- bined with any combination of the first two investments to produce new risk-return combinations. This enables us to move further in the northwest direction. We can then add a fourth investment. This can be combined with any combination of the first three investments to produce yet more investment opportunities. As we continue this process, considering every possible portfolio of the available risky investments, we obtain what is known as an efficient frontier. This represents the limit of how far we can move in a north- west direction and is illustrated in Figure 1.3. There is no investment that dominates a point on the efficient frontier in the sense that it has both a higher expected return and a lower standard deviation of return. The area southeast of the efficient frontier repre- sents the set of all investments that are possible. For any point in this area that is not on the efficient frontier, there is a point on the efficient frontier that has a higher expected return and lower standard deviation of return. In Figure 1.3 we have considered only risky investments. What does the efficient frontier of all possible investments look like? Specifically, what happens when we include the risk-free investment? Suppose that the risk-free investment yields a return of RF.In Figure 1.4 we have denoted the risk-free investment by point F and drawn a tangent from point F to the efficient frontier of risky investments that was developed in Figure 1.3. M is the point of tangency. As we will now 


### Research block 9

where σM is the standard deviation of return for portfolio M. This risk-return com- bination corresponds to the point labeled I in Figure 1.4. From the perspective of both expected return and standard deviation of return, point I is βI of the way from F to M. All points on the line FM can be obtained by choosing a suitable combination of the investment represented by point F and the investment represented by point M.The points on this line dominate all the points on the previous efficient frontier because they give a better risk-return combination. The straight line FM is therefore part of the new efficient frontier. If we make the simplifying assumption that we can borrow at the risk-free rate of RF as well as invest at that rate, we can create investments that are on the continuation of FM beyond M. Suppose, for example, that we want to create the investment represented by the point J in Figure 1.4 where the distance of J from F is βJ times the distance of M from F (βJ > 1). We borrow βJ − 1 of the amount that we have available for investment at rate RF and then invest everything (the original funds and the borrowed funds) in


### Research block 10

This shows that the risk and expected return combination corresponds to point J.(Note that the formulas for the expected return and standard deviation of return in terms of beta are the same whether beta is greater than or less than 1.) The argument that we have presented shows that, when the risk-free investment is considered, the efficient frontier must be a straight line. To put this another way, there should be a linear trade-off between the expected return and the standard deviation of returns, as indicated in Figure 1.4. All investors should choose the same portfolio of risky assets. This is the portfolio represented by M. They should then reflect their appetite for risk by combining this risky investment with borrowing or lending at the risk-free rate. It is a short step from here to argue that the portfolio of risky investments represented by M must be the portfolio of all risky investments. Suppose a particular investment is not in the portfolio. No investors would hold it and its price would have to go down so that its expected return increased and it became part of portfolio M.In fact, we can go further than this. To ensure a balance between the supply and demand for each investment, the price of each risky investment must adjust so that the amount of that investment in portfolio M is proportional to the amount of that investment available in the economy. The investment represented by point M is therefore usually referred to as the market portfolio.


### Research block 11

The first component is referred to as systematic risk. The second component is referred to as nonsystematic risk. Consider first the nonsystematic risk. If we assume that the ϵ variables for different investments are independent of each other, the nonsystematic risk is almost completely diversified away in a large portfolio. An investor should not therefore be concerned about nonsystematic risk and should not require an extra return above the risk-free rate for bearing nonsystematic risk. The systematic risk component is what should matter to an investor. When a large well-diversified portfolio is held, the systematic risk represented by βRM does not disap- pear.An investor should require an expected return to compensate for this systematic risk. We know how investors trade off systematic risk and expected return from Figure 1.4. When β= 0 there is no systematic risk and the expected return is RF.When β= 1, we have the same systematic risk as the market portfolio, which is represented by point M, and the expected return should be E(RM ). In general


### Research block 12

The parameter β is equal to ρσ∕σM ,where ρ is the correlation between the return on the investment and the return on the market portfolio, σ is the standard deviation of the return on the investment, and σM is the standard deviation of the return on the market portfolio. Beta measures the sensitivity of the return on the investment to the return on the market portfolio. We can define the beta of any investment portfolio as in equation (1.3) by regressing its returns against the returns on the market portfolio. The capital asset pricing model in equation (1.4) should then apply with the return R defined as the return on the portfolio. In Figure 1.4 the market portfolio represented by M has a beta of 1.0 and the riskless portfolio represented by F has a beta of zero. The portfolios represented by the points I and J have betas equal to βI and βJ, respectively.


### Research block 13

The analysis we have presented leads to the surprising conclusion that all investors want to hold the same portfolios of assets (the portfolio represented by M in Figure 1.4). This is clearly not true. Indeed, if it were true, markets would not function at all well because investors would not want to trade with each other! In practice, different investors have different views on the attractiveness of stocks and other risky investment opportunities. This is what causes them to trade with each other and it is this trading that leads to the formation of prices in markets. The reason why the analysis leads to conclusions that do not correspond with the realities of markets is that, in presenting the arguments, we implicitly made a number of assumptions. In particular:


### Research block 14

moment. In the case of positive skewness, very high returns are more likely and very low returns are less likely than the normal distribution would predict; in the case of negative skewness, very low returns are more likely and very high returns are less likely than the normal distribution would predict. Excess kurtosis leads to a distribution where both very high and very low returns are more likely than the normal distribution would predict.Most investors are concerned about the possibility of extreme negative outcomes. They are likely to want a higher expected return from investments with negative skewness or excess kurtosis. 2. We assumed that the ϵ variables for different investments in equation (1.3) are inde- pendent. Equivalently we assumed the returns from investments are correlated with each other only because of their correlation with the market portfolio. This is clearly not true. Ford and General Motors are both in the automotive sector. There is likely to be some correlation between their returns that does not arise from their corre- lation with the overall stock market. This means that the ϵ for Ford and the ϵ for General Motors are not likely to be independent of each other. 3. We assumed that investors focus on returns over just one period and the length of this period is the same for all investors. This is also clearly not true. Some investors such as pension funds have very long time horizons. Others such as day traders have very short time horizons. 4. We assumed that investors can borrow and lend at the same risk-free rate. This is approximately true in


### Research block 15

Portfolio managers are continually searching for ways of producing a positive alpha. One way is by trying to pick stocks that outperform the market. Another is by market timing. This involves trying to anticipate movements in the market as a whole and moving funds from safe investments such as Treasury bills to the stock market when an upturn is anticipated and in the other direction when a downturn is anticipated. Chapter 4 explains other strategies used by hedge funds to try to create positive alpha. Although the capital asset pricing model is unrealistic in some respects, the alpha and beta parameters that come out of the model are widely used to characterize investments. Beta describes the amount of systematic risk. The higher the value of beta, the greater the systematic risk being taken and the greater the extent to which returns are dependent on the performance of the market. Alpha represents the extra return made from superior portfolio management (or perhaps just good luck). An investor can make a positive alpha only at the expense of other investors who are making a negative alpha. The weighted average alpha of all investors must be zero.


### Research block 16

Arbitrage pricing theory can be viewed as an extension of the capital asset pricing model. In the capital asset pricing model, an asset’s return depends on just one factor. In arbitrage pricing theory, the return depends on several factors. (These factors might involve vari- ables such as the gross national product, the domestic interest rate, and the inflation rate.) By exploring ways in which investors can form portfolios that eliminate exposure to the factors, arbitrage pricing theory shows that the expected return from an investment is linearly dependent on the factors. The assumption that the ϵ variables for different investments are independent in equation (1.3) ensures that there is just one factor driving expected returns (and therefore one source of systematic risk) in the capital asset pricing model. This is the return on the market portfolio. In arbitrage pricing theory there are several factors affecting investment returns. Each factor is a separate source of systematic risk. Unsystematic (i.e., diversifiable) risk in arbitrage pricing theory is the risk that is unrelated to all the factors.


### Research block 17

We now move on to consider the trade-offs between risk and return made by a company. How should a company decide whether the expected return on a new investment project is sufficient compensation for its risks? The ultimate owners of a company are its shareholders and a company should be managed in the best interests of its shareholders. It is therefore natural to argue that a new project undertaken by the company should be viewed as an addition to its share- holders’ portfolio. The company should calculate the beta of the investment project and its expected return. If the expected return is greater than that given by the capital asset pricing model, it is a good deal for shareholders and the investment should be accepted. Otherwise it should be rejected. The argument just given suggests that nonsystematic risks should not be considered when accept/reject decisions on new projects are taken. In practice, companies are con- cerned about nonsystematic as well as systematic risks. For example, most companies insure themselves against the risk of their buildings burning down—even though this risk is entirely nonsystematic and can be diversified away by their shareholders. They try to avoid taking high risks and often hedge their exposures to exchange rates, interest rates, commodity prices, and other market variables. Earnings stability and the survival of the company are often important manage- rial objectives. Companies do try to ensure that their expected returns on new ven- tures are consistent with the risk-return trade-offs of their shareholders. But there is an overridin


### Research block 18

and meet earnings forecasts. They like companies to manage risks carefully and limit the overall amount of risk—both systematic and nonsystematic—they are taking. The theoretical arguments we presented in Sections 1.1 to 1.4 suggest that investors should not behave in this way. They should hold a well-diversified portfolio and encour- age the companies they invest in to make high-risk investments when the combination of expected return and systematic risk is favorable. Some of the companies in a share- holder’s portfolio will go bankrupt, but others will do very well. The result should be an overall return to the shareholder that is satisfactory. Are investors behaving suboptimally? Would their interests be better served if com- panies took more nonsystematic risks? There is an important argument to suggest that this is not necessarily the case. This argument is usually referred to as the “bankruptcy costs” argument. It is often used to explain why a company should restrict the amount of debt it takes on, but it can be extended to apply to a wider range of risk management decisions than this.


### Research block 19

In a perfect world, bankruptcy would be a fast affair where the company’s assets (tangible and intangible) are sold at their fair market value and the proceeds are distributed to the company’s creditors using well-defined rules. If we lived in such a perfect world, the bankruptcy process itself would not destroy value for stakeholders. Unfortunately, the real world is far from perfect. By the time a company reaches the point of bankruptcy, it is likely that its assets have lost some value. The bankruptcy process itself invariably reduces the value of its assets further. This further reduction in value is referred to as bankruptcy costs. What is the nature of bankruptcy costs? Once a bankruptcy has happened, customers and suppliers become less inclined to do business with the company; assets sometimes have to be sold quickly at prices well below those that would be realized in an orderly sale; the value of important intangible assets, such as the company’s brand name and its reputation in the market, are often destroyed; the company is no longer run in the best interests of shareholders; large fees are often paid to accountants and lawyers; and so on. The story in Business Snapshot 1.1 is representative of what often happens in practice. It illustrates how, when a high-risk decision works out badly, there can be disastrous bankruptcy costs. The largest bankruptcy in U.S. history was that of Lehman Brothers on September 15, 2008. Two years later, on September 14, 2010, the Financial Times reported that the legal and accounting fees in the United States and Europe relating to 


### Research block 20

Several years ago, a company had a market capitalization of \$2 billion and \$500 million of debt. The CEO decided to acquire a company in a related industry for \$1 billion in cash. The cash was raised using a mixture of bank debt and bond issues. The price paid for the company was justified on the basis of potential synergies, but key threats to the profitability of the company were overlooked. Many of the anticipated synergies were not realized. Furthermore, the com- pany that was acquired was not profitable and proved to be a cash drain on the parent company. After three years, the CEO resigned. The new CEO sold the acquisition for \$100 million (10% of the price paid) and announced that the company would focus on its original core business. However, by then the com- pany was highly leveraged. A temporary economic downturn made it impossible for the company to service its debt and it declared bankruptcy. The offices of the company were soon filled with accountants and lawyers representing the interests of the various parties (banks, different categories of bondholders, equity holders, the company, and the board of directors). These people directly or indirectly billed the company about \$10 million per month in fees. The company lost sales that it would normally have made because nobody wants to do business with a bankrupt company. Key senior executives left. The company experienced a dramatic reduction in its market share. After two years and three reorganization attempts, an agreement was reached among the various parties, and a new company with a market capitalization of 


### Research block 21

reason why this is so. Bankruptcy laws vary widely from country to country, but they all have the effect of destroying value as lenders and other creditors vie with each other to get paid. If a company chooses projects with very high risks (but sufficiently high expected returns to be above the efficient frontier in Figure 1.4), the probability of bankruptcy will be quite high. When expected bankruptcy costs are taken into account, projects that have a high total (systematic plus nonsystematic) risk are liable to be rejected as unacceptable. This explains why investors like companies to limit the overall amount of risk they take and reward companies that manage risks so that they meet earnings forecasts. Introduction 17


### Research block 22

One can argue about how important bankruptcy costs are for the decision making of a non-financial company, but there can be no question that it is crucially important for a financial institution such as a bank to keep its probability of bankruptcy very low. Large banks rely on wholesale deposits and instruments such as commercial paper for their funding. Confidence is the key to their survival. If the risk of default is perceived by the market to be other than very low, there will be a lack of confidence and sources of funding will dry up. The bank will be then be forced into liquidation–even if it is solvent in the sense of having positive equity. Lehman Brothers was the largest bankruptcy in U.S. history. Northern Rock was a large failure of a financial institution in the United Kingdom. In both cases, the failure was because there was a lack of confidence and traditional sources of funding dried up.


### Research block 23

Even if, in spite of the arguments we have just given, the managers of a bank wanted to take huge risks, they would not be allowed to do so. Unlike other companies, many financial institutions are heavily regulated. Governments throughout the world want a stable financial sector. It is important that companies and private individuals have confi- dence in banks and insurance companies when they transact business. The regulations are designed to ensure that the probability of a large bank or an insurance company expe- riencing severe financial difficulties is low. The bailouts of financial institutions in 2008 during the subprime crisis illustrate the reluctance of governments to let large financial institutions fail. Regulated financial institutions are forced to consider total risks (system- atic plus nonsystematic). Bankruptcy often arises from losses being incurred. Regulators try to ensure that the capital held by a bank is sufficient to provide a cushion to absorb the losses with a high probability. Suppose, for example, that there is considered to be only a 0.1% probability that a financial institution will experience a loss of \$2 billion or more in a year.Regulators might require the bank to hold equity capital equal to \$2 billion. This would ensure that there is a 99.9% probability that the equity capital is sufficient to absorb the losses. The models used by regulators are discussed in more detail in later chapters. The key point here is that regulators are concerned with total risks,not just systematic risks. Their goal is to make bankruptcy a highly unlikely event


### Research block 24

There are two broad risk management strategies open to a financial institution (or any other organization). One approach is to identify risks one by one and handle each one separately. This is sometimes referred to as risk decomposition. The other is to reduce risks by being well diversified. This is sometimes referred to as risk aggregation. Both approaches are typically used by financial institutions. Consider,for example,the market risks incurred by the trading room of a bank.These risks depend on the future movements in a multitude of market variables (exchange rates, interest rates, stock prices, and so on). To implement the risk decomposition approach, the trading room is organized so that a trader is responsible for trades related to just one market variable (or perhaps a small group of market variables). For example, there could be one trader who is responsible for all trades involving the dollar-yen exchange rate. At the end of each day, the trader is required to ensure that certain risk measures are kept within limits specified by the bank. If the end of the day is approached and it looks as though one or more of the risk measures will be outside the specified limits, the trader must either get special permission to maintain the position or execute new hedging trades so that the limits are adhered to. (The risk measures and the way they are used are discussed in Chapter 8.) The risk managers, working in what is termed the middle office of a bank, implement the risk aggregation approach for the market risks being taken. This involves calculating at the end of each 


### Research block 25

is likely to be much better diversified than a small bank in Texas that lends entirely to oil companies. But, however well diversified a bank is, it is still exposed to systematic risk, which creates variations in the probability of default for all borrowers from year to year. Suppose that the probability of default for borrowers in an average year is 1%. When the economy is doing well, the probability of default is less than this and when there is an economic downturn it is liable to be considerably more than this.Models for capturing this exposure are discussed in later chapters. Since the late 1990s, we have seen the emergence of an active market for credit derivatives. Credit derivatives allow banks to handle credit risks one by one (risk decom- position) rather than relying solely on risk diversification. They also allow banks to buy protection against the overall level of defaults in the economy. However, for every buyer of credit protection there must be a seller. Many sellers of credit protection, whether on individual companies or on portfolios of companies, took huge losses during the credit crisis that started in 2007. The credit crisis is discussed further in Chapter 6.


### Research block 26

Credit rating agencies provide information that is widely used by financial market partic- ipants for the management of credit risks. A credit rating is a measure of the credit quality of a debt instrument such as a bond. However, the rating of a corporate or sovereign bond is often assumed to be an attribute of the bond issuer rather than of the bond itself. Thus, if the bonds issued by a company have a rating of AAA, the company is often referred to as having a rating of AAA. The three major credit rating agencies are Moody’s, S&P, and Fitch. The best rating assigned by Moody’s is Aaa. Bonds with this rating are considered to have almost no chance of defaulting. The next best rating is Aa. Following that come A, Baa, Ba, B, Caa, Ca, and C. The S&P ratings corresponding to Moody’s Aaa, Aa, A, Baa, Ba, B, Caa, Ca, and C are AAA, AA, A, BBB, BB, B, CCC, CC, and C, respectively. To create finer rating measures Moody’s divides the Aa rating category into Aa1, Aa2, and Aa3; it divides A into A1, A2, and A3; and so on. Similarly S&P divides its AA rating category into AA+, AA, and AA−; it divides its A rating category into A+,A,and A−; and so on. Moody’s Aaa rating category and S&P’s AAA rating are not subdivided, nor usually are the two lowest rating categories. Fitch’s rating categories are similar to those of S&P. There is usually assumed to be an equivalence between the meanings of the ratings assigned by the different agencies. For example, a BBB+ rating from S&P is considered equivalent to a Baa1 rating from Moody’s. Instruments with ratings of BBB− (Baa3) or above are con


### Research block 27

An important general principle in finance is that there is a trade-off between risk and return. Higher expected returns can usually be achieved only by taking higher risks. In theory, shareholders should not be concerned with risks they can diversify away. The expected return they require should reflect only the amount of systematic (i.e., non- diversifiable) risk they are bearing. Companies, although sensitive to the risk-return trade-offs of their shareholders, are concerned about total risks when they do risk management. They do not ignore the unsystematic risk that their shareholders can diversify away. One valid reason for this is the existence of bankruptcy costs, which are the costs to shareholders resulting from the bankruptcy process itself. For financial institutions such as banks and insurance companies there is another important reason: regulation. The regulators of financial institutions are primarily con- cerned with minimizing the probability that the institutions they regulate will fail. The probability of failure depends on the total risks being taken, not just the risks that cannot be diversified away by shareholders. As we will see later in this book, regulators aim to ensure that financial institutions keep enough capital for the total risks they are taking. Two general approaches to risk management are risk decomposition and risk aggre- gation. Risk decomposition involves managing risks one by one. Risk aggregation involves relying on the power of diversification to reduce risks.Banks use both approaches to manage market risks. Credit risks have traditi


### Research block 28

1.1 An investment has probabilities 0.1, 0.2, 0.35, 0.25, and 0.1 of giving returns equal to 40%, 30%, 15%, −5%, and −15%. What are the expected returns and the standard deviations of returns? 1.2 Suppose that there are two investments with the same probability distribution of returns as in Problem 1.1. The correlation between the returns is 0.15. What is the expected return and standard deviation of return from a portfolio where money is divided equally between the investments? 1.3 For the two investments considered in Figure 1.2 and Table 1.2, what are the alter- native risk-return combinations if the correlation is (a) 0.3, (b) 1.0, and (c) −1.0? 1.4 What is the difference between systematic and nonsystematic risk? Which is more important to an equity investor? Which can lead to the bankruptcy of a corpora- tion? 1.5 Outline the arguments leading to the conclusion that all investors should choose the same portfolio of risky investments. What are the key assumptions? 1.6 The expected return on the market portfolio is 12% and the risk-free rate is 6%. What is the expected return on an investment with a beta of (a) 0.2, (b) 0.5, and (c) 1.4? 1.7 “Arbitrage pricing theory is an extension of the capital asset pricing model.”Explain this statement. 1.8 “The capital structure decision of a company is a trade-off between bankruptcy costs and the tax advantages of debt.” Explain this statement. 1.9 What is meant by risk aggregation and risk decomposition? Which requires an in- depth understanding of individual risks? Which requires a detailed knowledge of the correlations between


### Research block 29

1.15 Suppose that one investment has a mean return of 8% and a standard deviation of return of 14%. Another investment has a mean return of 12% and a standard deviation of return of 20%. The correlation between the returns is 0.3. Produce a chart similar to Figure 1.2 showing alternative risk-return combinations from the two investments. 1.16 The expected return on the market is 12% and the risk-free rate is 7%. The standard deviation of the return on the market is 15%. One investor creates a portfolio on the efficient frontier with an expected return of 10%. Another creates a portfolio on the efficient frontier with an expected return of 20%. What is the standard deviation of the return on each of the two portfolios? 1.17 A bank estimates that its profit next year is normally distributed with a mean of 0.8% of assets and the standard deviation of 2% of assets. How much equity (as a percentage of assets) does the company need to be (a) 99% sure that it will have a positive equity at the end of the year and (b) 99.9% sure that it will have positive equity at the end of the year? Ignore taxes. 1.18 A portfolio manager has maintained an actively managed portfolio with a beta of 0.2. During the last year, the risk-free rate was 5% and major equity indices performed very badly, providing returns of about −30%. The portfolio manager produced a return of −10% and claims that in the circumstances it was good.Discuss this claim. Part One


### Research block 30

T he word “bank” originates from the Italian word banco. This is a desk or bench, covered by a green tablecloth,that was used several hundred years ago by Floren- tine bankers. The traditional role of banks has been to take deposits and make loans. The interest charged on the loans is greater than the interest paid on deposits. The difference between the two has to cover administrative costs and loan losses (i.e., losses when borrowers fail to make the agreed payments of interest and principal), while providing a satisfactory return on equity. Today, most large banks engage in both commercial and investment banking. Com- mercial banking involves, among other things, the deposit-taking and lending activities we have just mentioned. Investment banking is concerned with assisting companies in raising debt and equity, and providing advice on mergers and acquisitions, major cor- porate restructurings, and other corporate finance decisions. Large banks are also often involved in securities trading (e.g., by providing brokerage services). Commercial banking can be classified as retail banking or wholesale banking.Retail banking, as its name implies, involves taking relatively small deposits from private indi- viduals or small businesses and making relatively small loans to them. Wholesale banking involves the provision of banking services to medium and large corporate clients, fund managers, and other financial institutions. Both loans and deposits are much larger in wholesale banking than in retail banking. Sometimes banks fund their lending by bor- rowing in financial markets th


### Research block 31

dollar amount of retail lending, the expected loan losses and administrative costs are usually much less.) Banks that are heavily involved in wholesale banking and may fund their lending by borrowing in financial markets are referred to as money center banks. This chapter will review how commercial and investment banking have evolved in the United States over the last hundred years. It will take a first look at the way the banks are regulated, the nature of the risks facing the banks, and the key role of capital in providing a cushion against losses.


### Research block 32

Commercial banking in virtually all countries has been subject to a great deal of regu- lation. This is because most national governments consider it important that individuals and companies have confidence in the banking system. Among the issues addressed by regulation is the capital that banks must keep, the activities they are allowed to engage in, deposit insurance, and the extent to which mergers and foreign ownership are allowed. The nature of bank regulation during the twentieth century has influenced the structure of commercial banking in different countries. To illustrate this, we consider the case of the United States. The United States is unusual in that it has a large number of banks (5,060 in 2017). This leads to a relatively complicated payment system compared with those of other countries with fewer banks. There are a few large money center banks such as Citigroup and JPMorgan Chase. There are several hundred regional banks that engage in a mixture of wholesale and retail banking, and several thousand community banks that specialize in retail banking. Table 2.1 summarizes the size distribution of banks in the United States in 1984 and 2017. The number of banks declined by over 65% between the two dates. In 2017, there were fewer small community banks and more large banks than in 1984. Although there were only 102 banks (2% of the total) with assets of \$10 billion or more in 2017, they accounted for over 84% of the assets in the U.S. banking system. The structure of banking in the United States is largely a result of regulatory restric- tions on interstate ban


### Research block 33

applied to nationally chartered as well as to state-chartered banks. One way of getting around the McFadden Act was to establish a multibank holding company. This is a com- pany that acquires more than one bank as a subsidiary. By 1956, there were 47 multibank holding companies. This led to the Douglas Amendment to the Bank Holding Company Act. This did not allow a multibank holding company to acquire a bank in a state that prohibited out-of-state acquisitions. However, acquisitions prior to 1956 were grandfa- thered (that is, multibank holding companies did not have to dispose of acquisitions made prior to 1956). Banks are creative in finding ways around regulations—particularly when it is prof- itable for them to do so. After 1956, one approach was to form a one-bank holding company. This is a holding company with just one bank as a subsidiary and a number of nonbank subsidiaries in different states from the bank. The nonbank subsidiaries offered financial services such as consumer finance, data processing, and leasing and were able to create a presence for the bank in other states. The 1970 Bank Holding Companies Act restricted the activities of one-bank holding companies. They were only allowed to engage in activities that were closely related to banking, and acquisitions by them were subject to approval by the Federal Reserve. They had to divest themselves of acquisitions that did not conform to the act. After 1970, the interstate banking restrictions started to disappear. Individual states passed laws allowing banks from other states to enter and acquire local banks. 


### Research block 34

A to do so.) In some cases, groups of states developed regional banking pacts that allowed interstate banking. In 1994, the U.S. Congress passed the Riegel-Neal Interstate Banking and Branching Efficiency Act. This Act led to full interstate banking becoming a reality. It permitted bank holding companies to acquire branches in other states. It invalidated state laws that allowed interstate banking on a reciprocal or regional basis.Starting in 1997,bank holding companies were allowed to convert out-of-state subsidiary banks into branches of a single bank. Many people argued that this type of consolidation was necessary to enable U.S. banks to be large enough to compete internationally. The Riegel-Neal Act prepared the way for a wave of consolidation in the U.S. banking system (for example, the acquisition by JPMorgan of banks formerly named Chemical, Chase, Bear Stearns, and Washington Mutual). As a result of the credit crisis that started in 2007 and led to a number of bank failures, the Dodd–Frank Wall Street Reform and Consumer Protection Act was signed into law by President Barack Obama on July 21, 2010. This is discussed further in Section 16.5.


### Research block 35

To illustrate the role of capital in banking, we consider a hypothetical small community bank named Deposits and Loans Corporation (DLC). DLC is primarily engaged in the traditional banking activities of taking deposits and making loans. A summary balance sheet for DLC at the end of 2018 is shown in Table 2.2 and a summary income statement for 2018 is shown in Table 2.3. Table 2.2 shows that the bank has \$100 million in assets. Most of the assets (80% of the total) are loans made by the bank to private individuals and small corporations. Cash and marketable securities account for a further 15% of the assets. The remaining 5% of the assets are fixed assets (i.e., buildings, equipment, etc.). A total of 90% of the funding for


### Research block 36

the assets comes from deposits of one sort or another from the bank’s customers. A fur- ther 5% is financed by subordinated long-term debt. (These are bonds issued by the bank to investors that rank below deposits in the event of a liquidation.) The remaining 5% is financed by the bank’s shareholders in the form of equity capital. The equity capital con- sists of the original cash investment of the shareholders and earnings retained in the bank. Consider next the income statement for 2018 shown in Table 2.3. The first item on the income statement is net interest income. This is the excess of the interest earned over the interest paid and is 3% of the total assets in our example. It is important for the bank to be managed so that net interest income remains roughly constant regardless of movements in interest rates of different maturities. We will discuss this in more detail in Chapter 9. The next item is loan losses. This is 0.8% of total assets for the year in question. Clearly it is very important for management to quantify credit risks and manage them carefully. But however carefully a bank assesses the financial health of its clients before making a loan, it is inevitable that some borrowers will default. This is what leads to loan losses. The percentage of loans that default will tend to fluctuate from year to year with economic conditions. It is likely that in some years default rates will be quite low, while in others they will be quite high. The next item, non-interest income, consists of income from all the activities of the bank other than lending money. This incl


### Research block 37

One measure of the performance of a bank is return on equity (ROE). Tables 2.2 and 2.3 show that DLC’s before-tax ROE is 0.6/5 or 12%. If this is considered unsatisfactory, one way DLC might consider improving its ROE is by buying back its shares and replacing them with deposits so that equity financing is lower and ROE is higher. For example, if it moved to the balance sheet in Table 2.4 where equity is reduced to 1% of assets and deposits are increased to 94% of assets, its before-tax ROE would jump to 60%. How much equity capital does DLC need? This question can be answered by hypoth- esizing an extremely adverse scenario and considering whether the bank would survive. Suppose that there is a severe recession and as a result the bank’s loan losses rise by 3.2% of assets to 4% next year. (We assume that other items on the income statement in Table 2.3 are unaffected.) The result will be a pre-tax net operating loss of 2.6% of assets (0.6 – 3.2 =−2.6). Assuming a tax rate of 30%, this would result in an after-tax loss of about 1.8% of assets. 1


### Research block 38

In Table 2.2, equity capital is 5% of assets, so an after-tax loss equal to 1.8% of assets, although not at all welcome, can be absorbed. It would result in a reduction of the equity capital to 3.2% of assets. Even a second bad year similar to the first would not totally wipe out the equity. If DLC has moved to the more aggressive capital structure shown in Table 2.4, it is far less likely to survive. One year where the loan losses are 4% of assets would totally wipe out equity capital and the bank would find itself in serious financial difficulties. It would no doubt try to raise additional equity capital, but it is likely to find this difficult when in such a weak financial position. It is possible that there would be a run on the bank (where all depositors decide to withdraw funds at the same time) and the bank would be forced into liquidation. If all assets could be liquidated for book value (a big assumption), the long-term debt-holders would likely receive about \$4.2 million rather than \$5 million (they would in effect absorb the negative equity) and the depositors would be repaid in full. Clearly, it is inadequate for a bank to have only 1% of assets funded by equity capital. Maintaining equity capital equal to 5% of assets as in Table 2.2 is more reasonable. Note that equity and subordinated long-term debt are both sources of capital. Equity provides the best protection against adverse events. (In our example, when the bank has \$5 million of equity capital rather than \$1 million, it stays solvent and is unlikely to be liquidated.) Subordinated long-term debt-holders


### Research block 39

The United States with its large number of small banks is particularly prone to bank failures. After the stock market crash of 1929 the United States experienced a major recession and about 10,000 banks failed between 1930 and 1933. Runs on banks and panics were common. In 1933, the United States government created the Federal Deposit Insurance Corporation (FDIC) to provide protection for depositors. Originally, the maximum level of protection provided was \$2,500. This has been increased sev- eral times and became \$250,000 per depositor per bank in October 2008. Banks pay an insurance premium that is a percentage of their domestic deposits. Since 2007, the size of the premium paid has depended on the bank’s capital and how safe it is considered to be by regulators. For well-capitalized banks, the premium might be less than 0.1% of the amount insured; for under-capitalized banks, it could be over 0.35% of the amount insured. Up to 1980, the system worked well. There were no runs on banks and few bank failures. However, between 1980 and 1990, bank failures in the United States accelerated, with the total number of failures during this decade being over 1,000 (larger than for the whole 1933 to 1979 period). There were several reasons for this. One was the way in which banks managed interest rate risk and we will talk about that in Chapter 9. Another reason was the reduction in oil and other commodity prices, which led to many loans to oil, gas, and agricultural companies not being repaid. A further reason for the bank failures was that the existence of deposit insurance allowe


### Research block 40

then placing them with investors. In a typical arrangement a corporation approaches an investment bank indicating that it wants to raise a certain amount of financing in the form of debt, equity, or hybrid instruments such as convertible bonds. The securities are originated complete with legal documentation itemizing the rights of the security holder. A prospectus is created outlining the company’s past performance and future prospects. The risks faced by the company from such things as major lawsuits are included. There is a “road show” in which the investment bank and senior management from the com- pany attempt to market the securities to large fund managers. A price for the securities is agreed between the bank and the corporation. The bank then sells the securities in the market. There are a number of different types of arrangement between the investment bank and the corporation. Sometimes the financing takes the form of a private placement in which the securities are sold to a small number of large institutional investors, such as life insurance companies or pension funds, and the investment bank receives a fee. On other occasions it takes the form of a public offering, where securities are offered to the general public. A public offering may be on a best efforts or firm commitment basis. In the case of a best efforts public offering, the investment bank does as well as it can to place the securities with investors and is paid a fee that depends, to some extent, on its success. In the case of a firm commitment public offering, the investment bank agrees to buy the sec


### Research block 41

A bank has agreed to underwrite an issue of 50 million shares by ABC Corporation. In negotiations between the bank and the corporation the target price to be received by the corporation has been set at \$30 per share. This means that the corporation is expecting to raise 30 × 50 million dollars or \$1.5 billion in total. The bank can either offer the client a best efforts arrangement where it charges a fee of \$0.30 per share sold so that, assuming all shares are sold, it obtains a total fee of 0.3 × 50 = \$15 million. Alternatively, it can offer a firm commitment where it agrees to buy the shares from ABC Corporation for \$30 per share. The bank is confident that it will be able to sell the shares, but is uncertain about the price. As part of its procedures for assessing risk, it considers two alternative scenarios. Under the first scenario, it can obtain a price of \$32 per share; under the second scenario, it is able to obtain only \$29 per share. In a best-efforts deal, the bank obtains a fee of \$15 million in both cases. In a firm commitment deal, its profit depends on the price it is able to obtain. If it sells the shares for \$32, it makes a profit of (32 − 30) × 50 = \$100 million because it has agreed to pay


### Research block 42

When the company wishing to issue shares is not publicly traded, the share issue is known as an initial public offering (IPO). This type of offering is typically made on a best efforts basis. The correct offering price is difficult to determine and depends on the invest- ment bank’s assessment of the company’s value. The bank’s best estimate of the market price is its estimate of the company’s value divided by the number of shares currently outstanding. However, the bank will typically set the offering price below its best esti- mate of the market price. This is because it does not want to take the chance that the issue will not sell. (It typically earns the same fee per share sold regardless of the offering price.) Often there is a substantial increase in the share price immediately after shares are sold in an IPO (sometimes as much as 40%), indicating that the company could have raised more money if the issue price had been higher. As a result, IPOs are considered attractive buys by many investors. Banks frequently offer IPOs to the fund managers who are their best customers and to senior executives of large companies in the hope that they will provide them with business. (The latter is known as “spinning” and is frowned upon by regulators.)


### Research block 43

A company wants to sell one million shares in an IPO. It decides to use the Dutch auction approach. The bidders are shown in the table below. In this case, shares are allocated first to C, then to F, then to E, then to H, then to A. At this point, 800,000 shares have been allocated. The next highest bidder is D, who has bid for 300,000 shares. Because only 200,000 shares remain unallocated, D’s order is only two-thirds filled. The price paid by all the investors to whom shares are allocated (A, C, D, E, F, and H) is the price bid by D, or \$29.00. Bidder Number of Shares Price


### Research block 44

Dutch auctions potentially overcome two of the problems with a traditional IPO that we have mentioned. First, the price that clears the market (\$29.00 in Example 2.2) should be the market price if all potential investors have participated in the bidding process. Second, the situations where investment banks offer IPOs only to their favored clients are avoided. However, the company does not take advantage of the relationships that investment bankers have developed with large investors that usually enable the investment bankers to sell an IPO very quickly. One high-profile IPO that used a Dutch auction was the Google IPO in 2004. This is discussed in Business Snapshot 2.1.


### Research block 45

Google, developer of the well-known Internet search engine, decided to go public in 2004. It chose the Dutch auction approach. It was assisted by two investment banks, Morgan Stanley and Credit Suisse First Boston. The SEC gave approval for it to raise funds up to a maximum of \$2,718,281,828. (Why the odd number? The mathematical constant e is 2.7182818 …) The IPO method was not a pure Dutch auction because Google reserved the right to change the num- ber of shares that would be issued and the percentage allocated to each bidder when it saw the bids. Some investors expected the price of the shares to be as high as \$120. But when Google saw the bids, it decided that the number of shares offered would be 19,605,052 at a price of \$85. This meant that the total value of the offering was 19,605,052 × 85 or \$1.67 billion. Investors who had bid \$85 or above obtained 74.2% of the shares they had bid for. The date of the IPO was August 19, 2004. Most companies would have given investors who bid \$85 or more 100% of the amount they bid for and raised \$2.25 billion, instead of \$1.67 billion. Perhaps Google (stock symbol: GOOG) correctly anticipated it would have no difficulty in selling further shares at a higher price later. The initial market capitalization was \$23.1 billion with over 90% of the shares being held by employees. These employees included the founders, Sergey Brin and Larry Page, and the CEO, Eric Schmidt. On the first day of trading, the shares closed at \$100.34, 18% above the offer price, and there was a further 7% increase on the second day. Google’s issue therefore p


### Research block 46

1. A potential target adds to its charter a provision where, if another company acquires one third of the shares, other shareholders have the right to sell their shares to that company for twice the recent average share price. 2. A potential target grants to its key employees stock options that vest (i.e., can be exer- cised) in the event of a takeover. This is liable to create an exodus of key employees immediately after a takeover, leaving an empty shell for the new owner. 3. A potential target adds to its charter provisions making it impossible for a new owner to get rid of existing directors for one or two years after an acquisition. 4. A potential target issues preferred shares that automatically get converted to regular shares when there is a change in control. 5. A potential target adds a provision where existing shareholders have the right to purchase shares at a discounted price during or after a takeover. 6. A potential target changes the voting structure so that shares owned by management have more votes than those owned by others.


### Research block 47

Poison pills, which are illegal in many countries outside the United States, have to be approved by a majority of shareholders. Often shareholders oppose poison pills because they see them as benefiting only management.An unusual poison pill,tried by PeopleSoft to fight a takeover by Oracle, is explained in Business Snapshot 2.2. Valuation, strategy, and tactics are key aspects of the advisory services offered by an investment bank. For example, in advising Company A on a potential takeover of Com- pany B, it is necessary for the investment bank to value Company B and help Company A assess possible synergies between the operations of the two companies. It must also consider whether it is better to offer Company B’s shareholders cash or a share-for-share exchange (i.e., a certain number of shares in Company A in exchange for each share of Company B). What should the initial offer be? What does it expect the final offer that will close the deal to be? It must assess the best way to approach the senior managers of Company B and consider what the motivations of the managers will be. Will the takeover be a hostile one (opposed by the management of Company B) or friendly one (supported by the management of Company B)? In some instances there will be antitrust issues, and approval from some branch of government may be required.


### Research block 48

In 2003, the management of PeopleSoft, Inc., a company that provided human resource management systems,was concerned about a takeover by Oracle,a com- pany specializing in database management systems. It took the unusual step of guaranteeing to its customers that, if it were acquired within two years and prod- uct support was reduced within four years, its customers would receive a refund of between two and five times the fees paid for their software licenses. The hypo- thetical cost to Oracle was estimated at \$1.5 billion. The guarantee was opposed by PeopleSoft’s shareholders. (It appears to be not in their interests.) PeopleSoft discontinued the guarantee in April 2004. Oracle did succeed in acquiring PeopleSoft in December 2004. Although some jobs at PeopleSoft were eliminated, Oracle maintained at least 90% of Peo- pleSoft’s product development and support staff.


### Research block 49

trading. In some other countries, proprietary trading is allowed, but it usually has to be organized so that losses do not affect depositors. Most large investment and commercial banks have extensive trading activities. Apart from proprietary trading (which may or may not be allowed), banks trade to provide services to their clients. (For example, a bank might enter into a derivatives transaction with a corporate client to help it reduce its foreign exchange risk.) They also trade (typically with other financial institutions) to hedge their risks. A broker assists in the trading of securities by taking orders from clients and arranging for them to be carried out on an exchange. Some brokers operate nationally, and some serve only a particular region. Some, known as full-service brokers, offer investment research and advice. Others, known as discount brokers, charge lower commissions, but provide no advice. Some offer online services, and some, such as E ∗Trade, provide a platform for customers to trade without a broker. A market maker facilitates trading by always being prepared to quote a bid (the price at which it is prepared to buy) and an offer (the price at which it is prepared to sell). When providing a quote, it does not know whether the person requesting the quote wants to buy or sell. The market maker makes a profit from the spread between the bid and the offer, but takes the risk that it will be left with a big long or short position and lose money. Many exchanges on which stocks, options, and futures trade use market makers. Typically, an exchange will specify a 


### Research block 50

1. When asked for advice by an investor, a bank might be tempted to recommend securities that the investment banking part of its organization is trying to sell. When it has a fiduciary account (i.e., a customer account where the bank can choose trades for the customer), the bank can “stuff ” difficult-to-sell securities into the account. 2. A bank, when it lends money to a company, often obtains confidential information about the company. It might be tempted to pass that information to the mergers and acquisitions arm of the investment bank to help it provide advice to one of its clients on potential takeover opportunities. 3. The research end of the securities business might be tempted to recommend a com- pany’s share as a “buy” in order to please the company’s management and obtain investment banking business. 4. Suppose a commercial bank no longer wants a loan it has made to a company on its books because the confidential information it has obtained from the company leads it to believe that there is an increased chance of bankruptcy. It might be tempted to ask the investment bank to arrange a bond issue for the company, with the proceeds being used to pay off the loan. This would have the effect of replacing its loan with a loan made by investors who were less well informed.


### Research block 51

As a result of these types of conflicts of interest, some countries have in the past attempted to separate commercial banking from investment banking. The Glass-Steagall Act of 1933 in the United States limited the ability of commercial banks and investment banks to engage in each other’s activities. Commercial banks were allowed to continue underwriting Treasury instruments and some municipal bonds. They were also allowed to do private placements. But they were not allowed to engage in other activities such as public offerings. Similarly, investment banks were not allowed to take deposits and make commercial loans. In 1987, the Federal Reserve Board relaxed the rules somewhat and allowed banks to establish holding companies with two subsidiaries, one in investment banking and the other in commercial banking. The revenue of the investment banking subsidiary was restricted to being a certain percentage of the group’s total revenue.


### Research block 52

In 1997, the rules were relaxed further so that commercial banks could acquire exist- ing investment banks. Finally, in 1999, the Financial Services Modernization Act was passed. This effectively eliminated all restrictions on the operations of banks, insurance companies, and securities firms. In 2007, there were five large investment banks in the United States that had little or no commercial banking interests. These were Goldman Sachs, Morgan Stanley, Merrill Lynch, Bear Stearns, and Lehman Brothers. In 2008, the credit crisis led to Lehman Brothers going bankrupt, Bear Stearns being taken over by JPMorgan Chase, and Merrill Lynch being taken over by Bank of America. Goldman Sachs and Morgan Stanley became bank holding companies with both commercial and investment banking interests. (As a result, they have had to subject themselves to more regulatory scrutiny.) The year 2008 therefore marked the end of an era for investment banking in the United States. We have not returned to the Glass–Steagall world where investment banks and com- mercial banks were kept separate. But increasingly banks are required to ring-fence their deposit-taking businesses so that they cannot be affected by losses in investment banking. 2.7 Today’s Large Banks


### Research block 53

Today’s large banks operate globally and transact business in many different areas.They are still engaged in the traditional commercial banking activities of taking deposits, making loans, and clearing checks (both nationally and internationally). They offer retail cus- tomers credit cards, telephone banking, Internet banking, and automatic teller machines (ATMs). They provide payroll services to businesses and, as already mentioned, they have large trading activities. Banks offer lines of credit to businesses and individual customers. They provide a range of services to companies when they export goods and services. Companies can enter into a variety of contracts with banks that are designed to hedge risks they face relating to foreign exchange, commodity prices, interest rates, and other market variables. These contracts will be discussed in later chapters. Even risks related to the weather can be hedged. Banks undertake securities research and offer “buy,” “sell,” and “hold” recommenda- tions on individual stocks. They offer brokerage services (discount and full service). They offer trust services where they are prepared to manage portfolios of assets for clients. They have economics departments that consider macroeconomic trends and actions likely to be taken by central banks. These departments produce forecasts on interest rates, exchange rates, commodity prices, and other variables. Banks offer a range of mutual funds and in some cases have their own hedge funds. Increasingly banks are offering insurance products. The investment banking arm of a bank has complete free


### Research block 54

How are the conflicts of interest outlined in Section 2.6 handled? There are inter- nal barriers known as Chinese walls. These internal barriers prohibit the transfer of information from one part of the bank to another when this is not in the best interests of one or more of the bank’s customers. There have been some well-publicized violations of conflict-of-interest rules by large banks. These have led to hefty fines and lawsuits. Top management has a big incentive to enforce Chinese walls. This is not only because of the fines and lawsuits. A bank’s reputation is its most valuable asset. The adverse publicity associated with conflict-of-interest violations can lead to a loss of confidence in the bank and business being lost in many different areas.


### Research block 55

It is appropriate at this point to provide a brief discussion of how a bank calculates a profit or loss from its many diverse activities. Activities that generate fees, such as most investment banking activities, are straightforward. Accrual accounting rules similar to those that would be used by any other business apply. For other banking activities, there is an important distinction between the “banking book” and the “trading book.” As its name implies, the trading book includes all the assets and liabilities the bank has as a result of its trading operations. The values of these assets and liabilities are marked to market daily. This means that the value of the book is adjusted daily to reflect changes in market prices. If a bank trader buys an asset for \$100 on one day and the price falls to \$60 the next day, the bank records an immedi- ate loss of \$40—even if it has not sold the asset. Sometimes it is not easy to estimate the value of a contract that has been entered into because there are no market prices for similar transactions. For example, there might be a lack of liquidity in the market or it might be the case that the transaction is a complex nonstandard derivative that does not trade sufficiently frequently for benchmark market prices to be available. Banks are nevertheless expected to come up with a market price in these circumstances. Often a model has to be assumed. The process of coming up with a “market price” is then some- times termed marking to model. (Chapter 25 discusses model risk and accounting issues further.) The banking book includes loans made t

