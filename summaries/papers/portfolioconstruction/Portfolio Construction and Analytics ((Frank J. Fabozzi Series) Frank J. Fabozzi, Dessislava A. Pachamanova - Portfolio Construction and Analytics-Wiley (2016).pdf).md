# Portfolio Construction and Analytics — Detailed Quantitative Research Notes

**Title:** Portfolio Construction and Analytics  
**Authors:** Frank J. Fabozzi, Dessislava A. Pachamanova  
**Year:** 2016  
**Publisher:** Wiley (Frank J. Fabozzi Series)  
**Structure (typical Fabozzi/Pachamanova):** portfolio theory refresher; optimization formulations; risk models; constraints; transaction costs; robust/practical construction; factor models; analytics for performance and risk; case implementations.

---

## Problem / Motivation

Bridge classical MV optimization to implementable portfolios under real constraints (transactions, taxes, turnover, long-short, factor exposures), with analytics to diagnose risk and performance. Companion spirit to *Robust Portfolio Optimization and Management* (Fabozzi/Kolm/Pachamanova/Focardi 2007) focusing on construction workflow and analytics.

---

## Core Quantitative Framework

### Classical MV
$$
\min_w w^\top\Sigma w \quad \text{s.t.} \quad w^\top\mu \ge \mu_*, \; w^\top 1=1, \; w\in\mathcal{W}
$$
or maximize utility $\mu_p - \frac{\lambda}{2}\sigma_p^2$.

### Factor risk models
$$
r = B f + \varepsilon, \quad \Sigma = B \Sigma_f B^\top + D
$$
Use for dimensionality reduction and risk budgeting.

### Constraints common in text
Long-only; turnover; transaction cost linear/quadratic; cardinality; industry/factor; tracking error to benchmark; tax lots; ESG.

### Transaction cost aware
$$
\max w^\top\mu - \lambda w^\top\Sigma w - \Lambda^\top |w-w_0|
$$

### Analytics
Ex-ante TE, marginal risk, risk decomposition by factor, performance attribution (Brinson / factor), transfer coefficient (Clarke–de Silva–Thorley) linking ICs to IR under constraints.

---

## Practical Construction Workflow

1. Signal → expected returns  
2. Risk model Σ  
3. Optimize with constraints & costs  
4. Trade list with ADV limits  
5. Attribute risk/performance  
6. Feedback to signals  

---

## Takeaways

1. Unconstrained MV is pedagogic; constraints define live IR.  
2. Factor Σ beats sample Σ for large universes.  
3. Explicit transaction costs prevent churn.  
4. Transfer coefficient diagnoses constraint tax on alpha.  
5. Analytics equal construction—without attribution, optimizers drift.


## Relation to Robust Optimization Volume

Where the 2007 robust book emphasizes uncertainty sets and worst-case optimization, the 2016 construction book emphasizes end-to-end portfolio manufacturing and measurement—use together.



---

## Source-Derived Research Blocks


### Research block 1

No part of this publication may be reproduced, stored in a retrieval system, or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, scanning, or otherwise, except as permitted under Section 107 or 108 of the 1976 United States Copyright Act, without either the prior written permission of the Publisher, or authorization through payment of the appropriate per-copy fee to the Copyright Clearance Center, Inc., 222 Rosewood Drive, Danvers, MA 01923, (978) 750-8400, fax (978) 646-8600, or on the Web at www.copyright.com. Requests to the Publisher for permission should be addressed to the Permissions Department, John Wiley & Sons, Inc., 111 River Street, Hoboken, NJ 07030, (201) 748-6011, fax (201) 748-6008, or online at http://www.wiley.com/go/permissions.


### Research block 2

Limit of Liability/Disclaimer of Warranty: While the publisher and author have used their best efforts in preparing this book, they make no representations or warranties with respect to the accuracy or completeness of the contents of this book and specifically disclaim any implied warranties of merchantability or fitness for a particular purpose. No warranty may be created or extended by sales representatives or written sales materials. The advice and strategies contained herein may not be suitable for your situation. You should consult with a professional where appropriate. Neither the publisher nor author shall be liable for any loss of profit or any other commercial damages, including but not limited to special, incidental, consequential, or other damages.


### Research block 3

Names: Fabozzi, Frank J., author. | Pachamanova, Dessislava A., author. Title: Portfolio construction and analytics / Frank J. Fabozzi, Dessislava Pachamanova. Description: Hoboken, New Jersey : John Wiley & Sons, Inc., [2016] | Series: Frank J. Fabozzi series | Includes bibliographical references and index. Identifiers: LCCN 2015040278 (print) | LCCN 2016003023 (ebook) | ISBN 9781118445594 (hardback) | ISBN 9781119238140 (ePub) | ISBN 9781119238164 (Adobe PDF) Subjects: LCSH: Portfolio management. | BISAC: BUSINESS & ECONOMICS / Finance. Classification: LCC HG4529.5 .F33456 2016 (print) | LCC HG4529.5 (ebook) | DDC 332.6—dc23 LC record available at http://lccn.loc.gov/2015040278


### Research block 4

CHAPTER 1 Introduction to Portfolio Management and Analytics 1 1.1 Asset Classes and the Asset Allocation Decision 1 1.2 The Portfolio Management Process 4 1.2.1 Setting the Investment Objectives 4 1.2.2 Developing and Implementing a Portfolio Strategy 6 1.2.3 Monitoring the Portfolio 8 1.2.4 Adjusting the Portfolio 9 1.3 Traditional versus Quantitative Asset Management 9 1.4 Overview of Portfolio Analytics 10 1.4.1 Market Analytics 12 1.4.2 Financial Screening 15 1.4.3 Asset Allocation Models 16 1.4.4 Strategy Testing and Evaluating Portfolio Performance 17 1.4.5 Systems for Portfolio Analytics 20 1.5 Outline of Topics Covered in the Book 22


### Research block 5

2.3 The Binomial Probability Distribution and Discrete Distributions 34 2.4 The Normal Distribution and Probability Density Functions 38 2.5 The Concept of Cumulative Probability 41 2.6 Describing Distributions 44 2.6.1 Measures of Central Tendency 44 2.6.2 Measures of Risk 47 2.6.3 Skew 54 2.6.4 Kurtosis 55 2.7 Dependence between Two Random Variables: Covariance and Correlation 55 2.8 Sums of Random Variables 57 2.9 Joint Probability Distributions and Conditional Probability 61 2.10 Copulas 64 2.11 From Probability Theory to Statistical Measurement: Probability Distributions and Sampling 66 2.11.1 Central Limit Theorem 70 2.11.2 Confidence Intervals 71 2.11.3 Bootstrapping 72 2.11.4 Hypothesis Testing 73


### Research block 6

CHAPTER 9 Factor Models 232 9.1 Factor Models in the Financial Economics Literature 233 9.2 Mean-Variance Optimization with Factor Models 236 9.3 Factor Selection in Practice 239 9.4 Factor Models for Alpha Construction 243 9.5 Factor Models for Risk Estimation 245 9.5.1 Macroeconomic Factor Models 245 9.5.2 Fundamental Factor Models 246 9.5.3 Statistical Factor Models 248 9.5.4 Hybrid Factor Models 250 9.5.5 Selecting the "Right" Factor Model 250 9.6 Data Management and Quality Issues 251 9.6.1 Data Alignment 252 9.6.2 Survival Bias 253 9.6.3 Look-Ahead Bias 253 9.6.4 Data Snooping 254 9.7 Risk Decomposition, Risk Attribution, and Performance Attribution 254 9.8 Factor Investing 256


### Research block 7

CHAPTER 11 Advances in Quantitative Equity Portfolio Management 281 11.1 Portfolio Constraints Commonly Used in Practice 282 11.1.1 Long-Only (No-Short-Selling) Constraints 283 11.1.2 Holding Constraints 283 11.1.3 Turnover Constraints 284 11.1.4 Factor Constraints 284 11.1.5 Cardinality Constraints 286 11.1.6 Minimum Holding and Transaction Size Constraints 287 11.1.7 Round Lot Constraints 288 11.1.8 Tracking Error Constraints 290 11.1.9 Soft Constraints 291 11.1.10 Misalignment Caused by Constraints 291 11.2 Portfolio Optimization with Tail Risk Measures 291 11.2.1 Portfolio Value-at-Risk Optimization 292 11.2.2 Portfolio Conditional Value-at-Risk Optimization 294 11.3 Incorporating Transaction Costs 297 11.3.1 Linear Transaction Costs 299 11.3.2 Piecewise-Linear Transaction Costs 300 11.3.3 Quadratic Transaction Costs 302 11.3.4 Fixed Transaction Costs 302 11.3.5 Market Impact Costs 303 11.4 Multiaccount Optimization 304 11.5 Incorporating Taxes 308 11.6 Robust Parameter Estimation 312 11.7 Portfolio Resampling 314 11.8 Robust Portfolio Optimization 317


### Research block 8

CHAPTER 13 Fundamentals of Fixed Income Portfolio Management 361 13.1 Fixed Income Instruments and Major Sectors of the Bond Market 361 13.1.1 Treasury Securities 362 13.1.2 Federal Agency Securities 363 13.1.3 Corporate Bonds 363 13.1.4 Municipal Bonds 364 13.1.5 Structured Products 364 13.2 Features of Fixed Income Securities 365 13.2.1 Term to Maturity and Maturity 365 13.2.2 Par Value 366 13.2.3 Coupon Rate 366 13.2.4 Bond Valuation and Yield 367 13.2.5 Provisions for Paying Off Bonds 368 13.2.6 Bondholder Option Provisions 370 13.3 Major Risks Associated with Investing in Bonds 371 13.3.1 Interest Rate Risk 371 13.3.2 Call and Prepayment Risk 372 13.3.3 Credit Risk 373 13.3.4 Liquidity Risk 374 13.4 Fixed Income Analytics 375 13.4.1 Measuring Interest Rate Risk 375 13.4.2 Measuring Spread Risk 383 13.4.3 Measuring Credit Risk 384 13.4.4 Estimating Fixed Income Portfolio Risk Using Simulation 384


### Research block 9

CHAPTER 18 Using Derivatives in Fixed Income Portfolio Management 515 18.1 Controlling Interest Rate Risk Using Treasury Futures 515 18.1.1 Strategies for Controlling Interest Rate Risk with Treasury Futures 518 18.1.2 Pricing of Treasury Futures 520 18.2 Controlling Interest Rate Risk Using Treasury Futures Options 521 18.2.1 Strategies for Controlling Interest Rate Risk Using Treasury Futures Options 524 18.2.2 Pricing Models for Treasury Futures Options 526 18.3 Controlling Interest Rate Risk Using Interest Rate Swaps 527 18.3.1 Strategies for Controlling Interest Rate Risk Using Interest Rate Swaps 528 18.3.2 Pricing of Interest Rate Swaps 530 18.4 Controlling Credit Risk with Credit Default Swaps 532 18.4.1 Strategies for Controlling Credit Risk with Credit Default Swaps 534 18.4.2 General Principles for Valuing a Single-Name Credit Default Swap 535


### Research block 10

“A nalytics” and “Big Data” have become buzzwords in many industries, and have dominated the news over the past few years. In finance, analyt- ics and big data have been around for a long time, even if they were described with different terms. As J.R. Lowry, chief operating officer of State Street Global Exchange, stated in a 2014 interview published in the MIT Sloan Management Review, “In general, data and analytics have pervaded our business for many, many years, but it wasn’t something that we were focused on in any kind of coherent way.” The need to focus on investment analytics in a coherent way has never been greater. In the aftermath of the 2007–2009 financial crisis, there has been a tremendous amount of regulatory change. Like most industries, the financial industry is trying to cope with the challenges of managing big data and the risks associated with using models. Many asset management firms face increasing pressure to address important questions such as


### Research block 11

The solution of banking giant State Street Corporation was to launch a new business, State Street Global Exchange (SSGX), which applies “a wrap- per of information, insights and analytics around the investment process,” and provides a “more purposeful approach to data and analytics across the company.”1 SSGX is a center that has pulled in software capabilities and analytics groups focused on risk, as well as electronic trading platforms focused on foreign exchange, fixed income, and derivatives trading. Portfolio and risk analytics platforms are offered by investment product providers such as Barclays (the POINT Advanced Analytics Platform)2 and BlackRock (the Aladdin Platform)3 with a similar goal of combining sophis- ticated risk analytics with comprehensive portfolio management, trading


### Research block 12

and operations tools. Longtime portfolio software vendors (Axioma, IBM Algorithmics, MSCI Barra, and Northfield Information Services) and data providers (Bloomberg, FactSet, Thomson Reuters) are adding both advanced analytics tools and the ability to link to various data sources. New part- nerships are being formed—for example, financial data provider Thomson Reuters joined forces with Palantir Technologies, a leading Silicon Valley big data technology company, to create QA Studio, a solution for quanti- tative research that combines powerful analytics and intuitive visualizations to help with the generation of investment ideas.4 The development of free open source software such as the statistical modeling environment R5 and the open source programming environment Python6 with libraries for finan- cial applications has greatly improved accessibility to analytical tools and has reduced the costs of implementing portfolio analytics solutions. In this book, we often refer to the traditional asset management company model, in which the focus is on the selection of star portfolio man- agers in charge of different portions of a firm’s funds under management. However, new technologies have been disrupting the investment industry as a whole. The bundling of asset management practice and software platform offerings is a recent phenomenon, as is the democratization of access to financial data7 and trading opportunities.8 The popularity of automated investment services companies, also called robo advisors,9 has been increasing. New-generation asset management companies include Quantop


### Research block 13

Portfolio Construction and Analytics attempts to look at the analytics pro- cess at investment firms from multiple perspectives: the data management side, the modeling side, and the software resources side. It reviews many widely used approaches to portfolio analytics and discusses new trends in metrics, modeling approaches, and portfolio analytics system design. The theoretical underpinnings of some of the modeling approaches are provided for context; however, our goal is to emphasize how such models are used in practice. The book contains 18 chapters in six parts. Part One, Statistical Models of Risk and Uncertainty, contains the fundamental statistical modeling con- cepts necessary to understand the modeling and measurement of portfolio risk. Part Two, Simulation and Optimization Modeling, explains two impor- tant modeling techniques for constructing portfolios with desired character- istics and evaluating their risk and performance—simulation and optimiza- tion. Part Three, Portfolio Theory, introduces the classical quantitative port- folio risk optimization approach and new tools for optimizing portfolios, both in terms of total risk and in terms of risk relative to a selected bench- mark. Parts Four and Five, Equity Portfolio Management and Fixed Income Portfolio Management, focus on specific factors and strategies used in equity and fixed income portfolio management, respectively. Part Six describes the basics of financial derivative instruments and how financial derivatives can be used for portfolio construction and risk management. The material is presented at a hi


### Research block 14

Portfolio Construction and Analytics covers finance and applied analytical techniques topics. It can be used as a textbook for upper-level undergraduate or lower-level graduate (such as MBA or master’s) courses with emphasis on modeling, such as applied investments, financial analytics, or the decision sciences. The book can be used also as a supplement in a special topics course in quantitative methods or finance, as a reference for student projects, or as a self-study aid by students. The book assumes that the reader has only very basic background in finance or quantitative methods, such as understanding of the time value of money, knowledge of basic calculus, and comfort with numbers and metrics. Most analytical concepts necessary for understanding the notation or appli- cations are introduced and explained in footnotes or in specified references. This makes the book suitable for readers with a wide range of backgrounds. Every chapter follows the same outline. The concepts are introduced in the main body of the chapter, and illustrations are provided. Instructions for implementation of the examples are provided in footnotes. There is a summary that contains the most important discussion points at the end of each chapter. A typical course may start with the material in Chapters 1 through 6. It can then cover Chapters 8 through 14, which discuss equity and fixed income portfolio construction strategies. Chapters 7 and 15 contain special topics that would be of interest in more quantitatively oriented courses and more advanced finance courses, respectively, or can be assign


### Research block 15

Dessislava A. Pachamanova is professor of analytics and computational finance and Zwerling Family Endowed Research Scholar at Babson College. Her research spans multiple areas, including portfolio risk management, simulation, high-performance and robust optimization, predictive analytics, and financial engineering. She has published dozens of articles in opera- tions research, finance, engineering, marketing and management journals, numerous book chapters, as well as two Wiley titles: Robust Portfolio Optimization and Management (2007) and Simulation and Optimization in Finance: Modeling with MATLAB, @RISK, or VBA (2010), both part of the Frank J. Fabozzi Series in Finance. Dessislava’s academic research is supplemented by consulting and previous work in the financial industry, including projects with quantitative strategy groups at WestLB and Gold- man Sachs. She holds an AB in mathematics from Princeton University and a PhD from the Sloan School of Management at MIT.


### Research block 16

Frank J. Fabozzi is professor of finance at EDHEC Business School and a senior scientific adviser at EDHEC-Risk Institute. Since 1984 he has served as editor of the Journal of Portfolio Management. A CFA and CPA holder, Fabozzi is a trustee for both the BlackRock closed-end fund complex and the equity-liquidity fund complex. He is the CFA Institute’s 2007 recipient of the C. Stewart Sheppard Award and the CFA Institute’s 2015 recipient of the James R. Vertin Award. Fabozzi was inducted into the Fixed Income Analysts Society Hall of Fame in November 2002. He has served on the faculty of Yale, MIT, and Princeton. The author and editor of numerous books in asset management, he earned a BA and MA in economics from The City College of New York and a doctorate in economics from the Graduate Center of the City University of New York. xxv


### Research block 17

I n writing a book that covers a wide range of topics in finance and draws on tools in statistics, simulation, and optimization, we were fortunate to have received valuable help from a number of individuals. We are very grateful to Andrew Geer, Ed Reis, Rick Barrett, and Bill McCoy of FactSet for creating the equity portfolio risk management example in Chapter 12. In addition, we thank Ed Reis for generating the exhibits for the example and for his careful proofreading of Chapter 12. Special thanks are due also to Anthony Lazanas and Cenk Ural of Bar- clays for preparing the fixed income portfolio risk management example in Chapter 14. The real-world examples are a true asset to the book. We are indebted to Andrew Aziz of IBM Algorithmics and Robert Bry of IBM for sharing materials about the IBM Algorithmics enterprise risk management software and for spending time discussing with us the specifics of systems for quantitative portfolio risk management and the role of cloud-based computing in making such systems more efficient and affordable. We thank Professor Alper Atamturk of the University of California at Berkeley and Bloomberg, Matt Nuffort (formerly of Amazon), Jack Cahill, manager of the Cutler Center for Investments and Finance at Babson College, Hugh Crowther of Crowther Investment, and Delaney Granizo-Mackenzie, Jess Stauth, David Edwards, Seong Lee, Scott Sanderson, and John Fawcett of Quantopian for helpful discussions. We also thank the R and Python developer communities, bloggers and contributors to online forums, who have made such tremendous resources for ana


### Research block 18

P ortfolio management is the process of managing money. Other terms commonly used to describe this process are investment management, asset management, and money management. Accordingly, the individual who manages a portfolio of investment vehicles is referred to as a portfolio manager, investment manager, asset manager,or money manager.Weuse these terms interchangeably throughout this book. In discussing portfolio management, reference is made to the “investor.” The investor is the entity that will receive the benefits from the investment of proceeds that results from managing of the portfolio. Typically, an investor does not make portfolio management decisions. Rather, the investor del- egates that responsibility to professional portfolio managers. Professional portfolio managers rely to varying degrees on portfolio analytics for identi- fying investment opportunities, keeping portfolios aligned with investment objectives, and monitoring portfolio risk and performance. In this book we review widely used approaches to portfolio analytics and discuss new trends in metrics, modeling approaches, and portfolio ana- lytics system design. This chapter provides an introduction to the portfolio management process. We begin with an overview of asset classes. We then describe the main areas of portfolio management where analytics are used, review trends in systems for portfolio analytics, and explain how the themes in this introduction chapter map to the content of the chapters to follow.


### Research block 19

The funds are then managed within the asset classes.1 In most developed countries, the four major asset classes are (1) common stocks, (2) bonds, (3) cash equivalents, and (4) real estate. How do market participants define an asset class? There are several ways to do so. The first is in terms of the investment attributes that the members of an asset class have in common. These investment characteristics include (1) the major economic factors that influence the value of the asset class and, as a result, correlate highly with the returns of each member included in the asset class; (2) similar risk and return characteristics; and (3) a common legal or regulatory structure. Based on this way of defining an asset class, the correlation between the returns of different asset classes should be low. The four major asset classes above can be extended to create other asset classes. From the perspective of a U.S. investor, for example, the four major asset classes can be expanded by separating foreign securities from U.S. secu- rities: (1) U.S. common stocks, (2) non-U.S. (or foreign) common stocks, (3) U.S. bonds, (4) non-U.S. bonds, (5) cash equivalents, and (6) real estate. Common stock and bonds are commonly further partitioned into sectors, loosely referred to by some practitioners as asset classes. For U.S. com- mon stocks (also referred to as U.S. equities), the following are classified as sectors: market capitalization stocks and value/growth stocks. A company’s market capitalization (or simply market cap) is the total market value of its common stock outstanding. For example,


### Research block 20

term “growth company.” There is no analog for the value manager—as in “value company.” Accordingly to value managers, two characteristics of value companies are that they trade at a low multiple relative to earnings and that they trade at a low price relative to their book value. For U.S. bonds, also referred to as fixed income securities, the following are classified as sectors: (1) U.S. government bonds, (2) corporate bonds, (3) U.S. municipal bonds (i.e., state and local bonds), (4) residential mortgage-backed securities, (5) commercial mortgage-backed securities, and (6) asset-backed securities. In turn, several of these sectors are further segmented by the credit rating of the issuer assigned by commercial firms referred to as credit rating agencies. For example, for corporate bonds, investment-grade (i.e., high credit quality) corporate bonds and noninvestment-grade corporate bonds (i.e., speculative quality) are treated as two sectors. For non-U.S. stocks and bonds, the following are classified as sectors: (1) developed market foreign stocks, (2) developed market foreign bonds, (3) emerging market foreign stocks, and (4) emerging market foreign bonds. The characteristics that market participants use to describe emerging markets is that the countries in this group:


### Research block 21

Setting investment objectives starts with a thorough analysis of the investor’s investment objectives. Investors can be classified as individual investors and institutional investors. Within each of these broad classifications is a wide range of investment objectives. The objectives of an individual investor may be to accumulate funds to purchase a home or other major acquisition, to have sufficient funds to be able to retire at a specified age, or to accumulate funds to pay for col- lege tuition for children. An individual investor may engage the services of a financial advisor/consultant in establishing investment objectives. The investment objectives of institutional investors fall into one of the following two broad categories: nonliability-driven objectives and liability-driven objectives. Those institutional investors that fall into the first category can manage their assets without regard to satisfying any liabilities. An example of an institutional investor that is not driven by liabilities is a regulated investment company. The second category includes institutional investors that must meet contractually specified liabilities. A liability is a cash outlay that must be made at a specific future date in


### Research block 22

order to satisfy the contractual terms of an obligation. An institutional investor is concerned with both the amount and timing of liabilities, because its assets must produce the cash flow to meet any payments it has promised to make in a timely way. Two examples of institutional investors that face liabilities are life insurance companies and defined benefit plans. Life insurance companies have a wide range of products. Some provide for pure life insurance protection while others offer investment-oriented life insurance products. One product that is investment-oriented is a guaranteed investment contract (GIC) whereby the life insurance company guarantees an interest rate over a predetermined time period on the funds given it to by a policyholder. When managing funds for a GIC account, the investment objective of the portfolio manager is to earn a return greater than the rate guaranteed. In the case of pension funds, there are two types of pension plans offered by sponsors. The sponsor can be a corporation, a state government, or a local government. The two types of pension plans that can be sponsored are a defined contribution or a defined benefit plan. For defined contribution plans, the sponsor need only provide a specified amount for an employee to invest and the employee is then responsible for investing those funds. The plan sponsor has no further obligation. In the case of a defined benefit plan, the plan sponsor has agreed to make specified payments to the employee after retirement. Thus, the plan sponsor has created a liability against itself and in managing the 


### Research block 23

3Institutional investors may have accounts that have both nonliability-driven objec- tives and liability-driven objectives. For example, a life insurance company may have a GIC account (which as explained above is a liability-driven objective product) and a variable annuity account. With a variable annuity account, an investor makes either a single payment or a series of payments to the life insurance company and in turn the life insurance company (1) invests the payments received and (2) makes payments to the investor at some future date. The payments that the life insurance company makes will depend on the performance of the insurance company’s asset manager. Although the life insurance company has a liability, the insurance company does not guarantee any specific dollar payment.


### Research block 24

Typically, an investment policy is developed by the investor in conjunction with a consultant. Given the investment policy, investment guidelines are established for individual managers hired by the investor. The portfolio allo- cation among different asset classes is usually decided in advance, and then each portfolio manager is hired to manage a specific asset class, or a sub- set of an asset class. In this book, we discuss the actual implementation of portfolio strategies for two specific asset classes—equities and fixed income securities. The implementation of the portfolio strategy can be divided into the following tasks:


### Research block 25

1.2.2.1 Selecting the Type of Investment Strategy Portfolio strategies can be classified as either active (alpha)or passive (beta) strategies. Between these extremes of passive and active strategies, there are strategies that have elements of both. For example, the core of a portfolio may be passively man- aged with the balance actively managed. A passive portfolio strategy involves minimal expectational input, and instead relies on diversification to match the performance of some bench- mark. In effect, a passive strategy assumes that the marketplace will effi- ciently reflect all available information in the price paid for securities and it is difficult to earn a return in excess of the benchmark without being exposed to more risk than the benchmark and after taking into account higher manage- ment fees and transaction costs. Passive portfolio strategies are also referred to as indexing since the typical benchmark is some market index. The strate- gies are also referred to as beta strategies because for historical reasons the term beta refers to the risk a well-diversified portfolio (such as an indexed portfolio) faces relative to a market index. An active portfolio strategy uses available information and forecasting techniques to seek a better performance than a portfolio that is simply diversified broadly. These strategies are often referred to as alpha strategies because for historical reasons the term alpha refers to the return realized in excess of the return offered by the market. Essential to all active strategies are expectations about the factors that have been f


### Research block 26

strategies this may include forecasts of future earnings, dividends, or price/ earnings ratios. With bond portfolios that are actively managed, expec- tations may involve forecasts of future interest rates and sector spreads. Active portfolio strategies involving foreign securities may require forecasts of local interest rates and exchange rates. A useful way of thinking about active versus passive management is in terms of the following three activities performed by the manager: (1) port- folio construction (deciding on the securities to buy and sell), (2) trading of securities, and (3) portfolio monitoring. Generally, active managers devote the majority of their time to portfolio construction. In contrast, passive man- agers devote less time to this activity. Given the choice among passive and active portfolio strategies, what factors should a client consider in selecting a strategy? Three factors that should be considered are (1) the investor’s view of how “price efficient” the market is, (2) the investor’s risk tolerance, and (3) the nature of the investor’s liabilities. Marketplace price efficiency refers to the difficulty a portfolio manager faces in earning a greater return than passive portfolio management after adjusting for the risk associated with a strategy and the transaction costs associated with implementing that strategy. There is a considerable literature in finance dealing with the issue of market efficiency. Given the existence of active portfolio managers and the flow of funds to those managers, clients obviously are not con- vinced that markets are suff


### Research block 27

1.2.2.2 Formulating the Inputs for Portfolio Construction Formulating the inputs for portfolio construction in an active portfolio strategy involves forecasting the inputs that are expected to impact the performance of a security and the portfolio as a whole. For example, often of interest are the factors that determine the expected returns of the assets in the portfolio and the covariance structure of the portfolio. Some of these inputs are extrapolated from past market data; others reflect the market’s “expecta- tions” that are priced into observed security prices in the market today.4


### Research block 28

assembles the portfolio. The exact portfolio allocation may be based on solving an optimization problem as explained in Chapters 8, 10, 11, and 14, but the ultimate decision is made after careful human evaluation of the port- folio strategy. In constructing the portfolio, there may be constraints that an investor may impose. For example, an investor may impose a constraint that is a concentration limit (i.e., maximum exposure) to a particular issuer or a par- ticular market sector. When the objective is to outperform a benchmark, there may be a restriction imposed by the investor with respect to the degree to which the portfolio manager hired may deviate from some key charac- teristics of the benchmark. For example, there are portfolio risk measures that are used to quantify different types of risk that we describe in later chapters. These portfolio risk measures provide an estimate of the exposure of a portfolio to changes in key factors that affect the portfolio’s perfor- mance. Typically, an investor will not set a specific value for the level of risk exposure. Instead, an investor may impose a maximum on the level of the risk exposure or a permissible range for the risk measure relative to the benchmark. In addition to constraints that must be considered in constructing a portfolio, an investor may request that the portfolio manager take into consideration taxes. Tax considerations are important for most investors but certain institutional investors such as pension funds, endowments, and foundations are exempt from federal income taxation. Consequently, the asset classe


### Research block 29

Once the portfolio has been constructed, it must be monitored. Monitoring involves two activities. The first is to assess whether there have been changes in the market that might suggest that any of the key inputs used in con- structing the portfolio may not be realized. The second task is to monitor the performance of the portfolio. Portfolio performance is monitored in two phases. The first phase is performance measurement, which involves the calculation of the return real- ized by the portfolio manager over a specified time interval (the evaluation period). The second phase is performance evaluation, which determines whether the manager has added value, and how the portfolio manager achieved the observed return. The decomposition of the performance results to explain why those results were achieved is called return attribu- tion analysis. A detailed example of performance evaluation is described in Chapter 12.


### Research block 30

Portfolio management is an ongoing process, and portfolio strategies are in fact performed in a multiperiod context. Portfolio selection strategies are designed to take advantage of market conditions, but those conditions exist temporarily, and as the conditions change, the portfolio manager must perform portfolio rebalancing. In doing so, the portfolio manager typically takes the following steps. By monitoring developments in the capital market, the portfolio manager determines whether to revise the inputs used in the portfolio con- struction process. Based on the new inputs, the portfolio manager constructs a new portfolio. In constructing a new portfolio, the costs of trading are often evaluated against the benefits of rebalancing. Specifically, a portfolio manager who wants to adjust the portfolio can do so by changing the risk exposure of each security in the portfolio. When doing so, the portfolio manager must consider the adverse implication of rebalancing the portfolio exposures resulting from the incurrence of trans- actions costs associated with purchasing and selling securities. Moreover, adjusting a portfolio’s risk can have adverse tax consequences. A trans- actionally efficient vehicle for controlling portfolio risk is to use financial derivatives. These instruments, which include futures, forwards, swaps, and options, are discussed in Chapters 16 through 18, where we also show how they can be used to control a portfolio’s risk. The notion that financial deriva- tives can be used to control portfolio risk may seem contrary to stories in the popular press about


### Research block 31

There are two general approaches to portfolio management: traditional and quantitative. Both approaches seek to find the best securities to include in a portfolio in order to construct an efficient portfolio. Our focus in this book is on quantitative portfolio management and we provide the essential port- folio analytics needed to implement the activities of portfolio management described in this chapter. Let’s briefly look at how in general the traditional and quantitative approaches to portfolio management differ. Recall that inputs in con- structing a portfolio are the expected return and risk of the securities


### Research block 32

under consideration. Given the generated inputs for each security and other attributes that a portfolio manager uses to select potential candidate securities, how that information is used differentiates traditional and quantitative portfolio managers. To illustrate, suppose that a portfolio manager is considering 3,000 securities as potential candidates for creating a portfolio. The first step is screening the 3,000 securities to select potential investments. With the traditional approach, the 3,000 securities would be screened by using certain criteria that are provided by the portfolio manager. Once the 3,000 securities are whittled down to a reasonable number of securities, say, N (which is much less than 3,000), security analysts who are part of the portfolio management team will perform an in-depth analysis of each security, looking at the fundamental characteristics of the security and the security issuer. The determination of N is constrained by the size of the portfolio management team. At the end of this process, the candidate list will be less than N. With quantitative portfolio management, the 3,000 securities would be screened based on quantitative criteria that the portfolio manager believes are drivers of returns to create acceptable securities but the number of candidate securities, N, will be far larger than the candidate list created by the traditional approach. The reason is that the criteria used in the quantitative approach will create a list that is not necessarily further investigated by the portfolio management team. The candidate list will be used as


### Research block 33

Qualitative and quantitative asset managers rely on quantitative investment models to a different extent. Different modeling tools are used by managers employing active versus passive investment styles. However, utilizing some fundamental level of portfolio analytics is critical for identi- fying investment opportunities, keeping portfolios aligned with investment objectives, and monitoring portfolio risk and performance. Analytics-based portfolio management enables investment managers to filter information quickly, take advantage of statistical arbitrage opportunities, and smoothen out inefficiencies such as transaction costs incurred during trading and tax consequences of investment decisions. In this section we review standard paradigms for portfolio analytics and survey recent developments. We also explain the quantitative methodol- ogy behind the techniques and the software implementation so that readers can catch a glimpse of the process from beginning to end. To introduce the subject, in this chapter we walk the reader through the analytics meth- ods during the steps of the investment process outlined earlier: (1) mar- ket analytics, (2) securities screening, (3) asset allocation and trade tim- ing analytics, and (4) investment strategy testing and performance evalu- ation. Portfolio analytics is an iterative process, and investment managers often go back and forth between these steps rather than following them in a strict sequence. In Section 1.5, we explain how these topics are addressed in the book. Before we begin, it is helpful to outline how a typical system fo


### Research block 34

The data then typically get processed through a data warehousing tool, which could contain estimates, research, and custom data fields calculated from the original data. Data warehousing is also where the data cleanup and organization occur. On top of the data warehousing tool sit tools that enable modeling based on the data, such as statistical and optimization mod- eling tools. Finally, the results of the analysis are summarized and displayed to aid the investment manager’s decision making. The last two stages— modeling and visualization—are often employed in an iterative process of evaluating trends, determining strategies, backtesting, and assessing portfo- lio performance. We discuss systems for portfolio analytics later in this chapter, including not only well-established vendors of portfolio management analytics tools but also general principles of building custom systems using cloud-based resources and open-source modeling software such as R.


### Research block 35

A large percentage of investment performance is contributed by trends in the overall market. A successful investment manager constantly analyzes mar- ket trends and thinks about ways to capitalize on new market information. Market analysis can be as straightforward as thinking through the impli- cations of news, new market reports, and changes in political or economic conditions. Simple, but effective ways to follow market trends include con- sidering time series plots of important market indices over time, or how market indices and industries move against each other. The latter trends can be analyzed by looking at relative strength—the ratio of one sector returns over another sector returns, or the ratio of the returns of one sector over particular indices. An interesting composite view of the relative strength of multiple stocks or sectors as well as the momentum that exists in the market is provided


### Research block 36

by Relative Rotation Graphs (RRGs).6 Such graphs enable visualization of the movement of a selected industry relative to the benchmark across a prespecified time period such as 12 weeks. RRGs are now a part of the Bloomberg analytics suite. Because most investment managers measure their performance against a benchmark, knowing which groups of securities are trending toward outperforming or underperforming the portfolio manager’s benchmark is valuable information. RRGs summarize multiple time series in such a way that the momentum and relative performance of sectors against the benchmark can all be displayed in one graph. On the horizontal axis of RRGs is the proprietary JdK RS-Ratio. It is a normalized metric of the relative strength of multiple sectors and indices against each other. On the vertical axis is a metric of the momentum of the stock or industry. The con- cept of momentum has to do with the belief that if the stock or industry had a positive return in the previous time period, it is more likely to have a positive return in the next time period. Depending on the value of their metrics, sectors can be in the “leading” (top right), “weakening” (bottom right), “lagging” (bottom left) or “improving” (top left) quadrant of the scatter plot. The expected movement of sectors in the graph over time is clockwise—an industry becomes “hot,” prices rise as investors swarm to invest in it, which decreases relative performance and eventually the indus- try’s relative worth decreases again.7 An investment strategy based on the expected behavior in an RRG would invest when an in


### Research block 37

Marketing analytics can be as complex as technical analysis, which uses statistical and econometric techniques to evaluate market activity, and decides whether to buy a security or increase holdings in an industry based on trends in prices and trading volume. Technicians look for patterns in the time series of the data related to securities in the market. Momentum, briefly explained earlier, is one such pattern identified by technical analysis. Technicians believe that, eventually, prices will adjust to their proper levels, but that in the meantime there are opportunities to make profits. Making above-average returns in the market is not easy, and should be virtually impossible if one believes a group of theories known collectively as the Efficient Market Theory. In its weak form, the Efficient Market Theory


### Research block 38

claims that current security prices reflect all the information available in previous security prices, so one should not expect technical analysis to lead to increased profits. In its semi-strong form, the Efficient Market Theory claims that security prices reflect all publicly available information in the market, so models based on publicly available data should not be helpful for picking out “winners.” Finally, the strong form of the Efficient Market Theory claims that security prices reflect all publicly or privately held infor- mation in the market, so inside information should not be helpful in picking out stocks. While multiple studies have disproved the strong form of the Efficient Market Theory, there is sufficient evidence that the market is at least very efficient. Still, one of the reasons the market is so efficient may be that investors are exploiting mispricing to bring market prices to their equilibrium levels. The past decade has witnessed the spread of algorithmic trading (also called algo trading, automated trading, smart order trading, program trading, and rules-based trading), which has taken technical analysis to the next level. Algorithmic trading is the use of electronic platforms to execute trading orders in an automated fashion according to a set of rules that could take into consideration market impact of the trade, execution risk analytics, cost-aware portfolio construction, and the use of market microstructure effects (Fabozzi, Focardi, and Kolm 2010). A special type of algorithmic trading is high-frequency trading, which involves rapid trading so


### Research block 39

The screening of investments typically relies on the identification of important factors that influence investment performance. Such factors may be fundamental, macroeconomic, statistical, technical, analyst views, and social responsibility. Once factors and industries of interest have been identified, specific securities can be selected as candidates for inclusion in the portfolio. A variety of screening methods are used by portfolio man- agers, including some that rely on simple statistical metrics of a particular security’s desirability relative to other securities. Advanced quantitative methods for portfolio construction include using factor models built based on multivariate statistical techniques. In addition to helping in the screening process, factor models provide important inputs, such as expected returns, covariances, and possible scenarios for returns, that are then used in asset allocation, portfolio rebalancing, and risk attribution models. Factor model construction from a technical point of view is covered in Chapter 9. Chapters 12 and 14 contain examples of using factor models for equity and fixed income portfolio construction and risk decomposition.


### Research block 40

9The full story is available from www.slate.com/articles/business/moneybox/2015/ 04/bot_makes_2_4_million_reading_twitter_meet_the_guy_it_cost_a_fortune.html. 10The distinction between long-term and short-term is sometimes ambiguous. For example, Northfield Information Services, a vendor of portfolio risk management software, recently incorporated a tool for scoring news about companies into its portfolio risk models. Two vendors of such tools are Alexandria Investment Research and Thomson Reuters. Portfolio risk model vendors have typically targeted longer term investors but in this case, the risk scoring is based on data mining algorithms applied to recent data from news sources found to be significant for prediction.


### Research block 41

1.4.3.1 Ad Hoc Methods for Portfolio Allocation There is a variety of ad hoc and computational methods that investment managers use for portfolio allocation in practice. Simple ways to invest include selecting interesting securities and then investing in them equally. Some researchers (see, for example, DeMiguel et al., 2009) have found after substantial computational tests that in the case of equity portfolios, such a seemingly naïve strategy may actually have merit. Other ad hoc methods imitate the calculation of well-known market indices. For example, some equity portfolio managers may weigh the stocks in their portfolios by their market capitalization, which is how the S&P 500 Index is calculated. This method is referred to as value weighting. To obtain the market capitalization for a company, the number of shares outstanding is multiplied by the current market price per share. The market capitalizations of all companies under consideration are added up, and the weight of each company’s stock in the portfolio is determined as the ratio of the company’s market capitalization and the total market capitalization. Other equity investment schemes imitate the price-weighting method favored by indices like the Dow Jones Index. The same number of shares is bought from each stock, so that the weight of the stocks in the portfolio is proportional to their price in the market.


### Research block 42

To implement the optimization, a manager can use directly optimization solvers such as IBM ILOG’s CPLEX, or portfolio optimization software provided by vendors such as Bloomberg, Northfield, MSCI Barra, and Axioma. The optimization formulation must be in a form that the software understands. Before specifying the optimization problem for the software, the manager needs to specify the trade universe, that is, the set of securities that are under consideration for investment. For an active manager, the trade universe may be a set of stocks that were selected based on fundamental research (in the case of equity portfolio management) or credit quality (in the case of fixed income portfolio management), or the securities in a particular industry. For a passive portfolio manager, the trade universe may be the securities in a benchmark index such as the Russell 3000 Index or the Barclays Capital U.S. Aggregate Bond Index. The optimization software then determines the optimal weights of the securities in the portfolio (when used for portfolio construction), or the optimal trades to accomplish specific targets (when used for portfolio rebalancing). Many investors take a single-period view of investing, in the sense that the goal of the portfolio allocation procedure is to invest optimally over a single predetermined period of time, such as one month. Even though some investment companies, especially institutional investors, have a long invest- ment horizon, they often treat that horizon as a sequence of shorter period horizons. Risk budgets are often stated over a time period of a y


### Research block 43

Before running the test, the investment manager needs to make a decision on the time period over which the strategy is to be tested, the rebalancing fre- quency, and how to assess the results of the backtest. The available data are usually split into in-sample (test) data and out-of-sample (validation) data. The manager tests a number of models on the in-sample data and when a satisfactory model is found, the manager uses the out-of-sample data to check whether the model performs well. It is tempting to find different inter- esting models based on the in-sample data, and then pick one from among them that performs the best on the out-of-sample data. However, this proce- dure may have serious issues.11 To follow a statistically sound methodology, once a model has been picked based on the in-sample data, if it fails on the out-of-sample data, it should be discarded, and the process should not be repeated again with the same data set. In statistics, this problem is referred to as the multiple testing prob- lem, and can be explained as follows (American Statistical Association 1999, guideline #8):


### Research block 44

Barra, Northfield Information Services, Bloomberg, Axioma, and FactSet Research Systems, among others. More general computing and modeling environments such as MATLAB have also been deployed enterprise-wide. There have been two major trends in the design of systems for portfolio analytics. The first trend is that portfolio analytics tools are being integrated with data feeds, making the different components of the system compatible and easier to manage for the end customer. Recognizing this trend, compa- nies like Bloomberg and FactSet Research Systems, which had traditionally been providers for real-time news coverage, data feeds, and single security analytics, have added portfolio analytics tools to their suites of buy-side trad- ing systems. Specialized portfolio analytics software providers such as MSCI Barra, IBM Algorithmics, and Northfield Financial Services are also address- ing the integration of analytics tools and data feeds, providing services to help customers integrate their data with the modeling tools provided by the companies. The second trend is that the availability of cheap computing infrastruc- ture through cloud-based resources provided by companies like Amazon, Google, IBM, and Microsoft as well as free open-source modeling tools like the statistical language environment R and the programming language Python have empowered more asset management firms to build such sys- tems in-house. The availability of cloud-based resources has meant that such investment houses do not need to maintain expensive IT solutions in-house, but have access to computing powe


### Research block 45

portfolio risk that generates scenarios for various factors, uses a list of prod- ucts provided by their clients, and estimates the risk in a particular client’s portfolio based on the combination of the factors in the product list pro- vided by the client. The scenario generation, or simulation piece can be done remotely at IBM instead of the client site using the IBM SmartCloud. This allows for computationally intensive pieces of the risk analysis to be run overnight, using scalable technology. Cloud-based solutions have been offered by Algorithmics since 2006–2007, and IBM’s purchase of Algorith- mics has made the integration of IBM SmartCloud and Algo portfolio risk management tools smoother and easier.


### Research block 46

This book is organized as follows. Part One (Chapters 2–4) lays the statistical foundation for a variety of concepts used in portfolio allo- cation and risk measurement and decomposition. Part Two (Chapters 5–7) provides background on important modeling techniques such as simulation (used for risk estimation) and optimization (used in portfolio allocation algorithms). Part Three (Chapters 8–10) introduces the classical underpinnings of Modern Portfolio Theory as well as recent developments in portfolio allocation schemes. Parts Four (Chapters 11–12) and Five (Chapters 13–15) provide an overview and practical examples of equity portfolio construction and fixed income portfolio construction, respectively. Part Six (Chapters 16–18) describes the use of financial derivatives for portfolio risk management and return enhancement strategies. Appendix A contains basic linear algebra concepts necessary to understand some of the statistical and optimization formulations in the book. Analytical concepts and techniques are weaved throughout the book. Many examples are constructed using Microsoft Excel and the open- source modeling language R. There are a variety of online resources for learning both. The R community is very active, and the website www.r- project.org is a wonderful resource for both beginners and advanced users of the software. We attempt to provide enough references to software functions and libraries that can help the reader reconstruct the examples in the book. We begin by outlining statistical concepts that are critical for rep- resentation of risk and return in Cha


### Research block 47

two important risk measures for portfolio management, value-at-risk and conditional value-at-risk, show how they relate to statistical measures of variability, and explain how they are estimated from data. In the remainder of the chapter, we discuss modeling dependency (correlation, covariance, copula functions), sums of random variables, and concepts from statis- tical inference such as hypothesis testing (necessary for understanding the concepts in the asset price forecasting and risk estimation chapters), bootstrapping, and confidence intervals. Chapter 3 reviews observed characteristics of financial return data and introduces important probability distributions that are used for modeling financial returns for the purpose of portfolio risk measurement. We discuss the families of elliptic, stable Paretian and generalized lambda distributions, as well as the families of generalized extreme value distributions and gener- alized Pareto distributions. The latter two families are used in the context of modeling extreme portfolio risk, also referred to as “risk in the tail.”14


### Research block 48

Chapter 4 takes a different approach to representing observed charac- teristics of financial return data: it introduces several statistical estimation models that help explain these characteristics by identifying factors that contribute to financial performance and, in some cases, incorporating dynamics in these factors. Regression, factor models, principal component analysis, and ARCH/GARCH models are explained on an intuitive level with examples. Chapter 5 moves the discussion from statistical modeling to simulation modeling. It illustrates the main idea behind simulation with an extensive example that also demonstrates how the statistical concepts from the pre- ceding chapters aid the construction of simulation models, the interpretation of simulation output, and the decision making of a risk manager when there is uncertainty. Chapter 6 provides a practical introduction to optimization, a technique with many applications that in the context of portfolio construction is used for determining optimal portfolio allocation and rebalancing strategies. We elaborate on the concept of “difficult” versus “easy” optimization problems and describe intuitively how optimization algorithms work. An illustration of a simple portfolio allocation problem that can be handled with opti- mization is provided, and its implementation with spreadsheet optimization software (Excel Solver) is outlined.


### Research block 49

Classical optimization methods treat the inputs to optimization problems as deterministic and accurate. In reality, however, these inputs are estimated through error-prone statistical procedures or based on subjective evaluation, resulting in estimates with significant estimation errors. Chapter 7 provides a taxonomy of methods for optimization when the input parameters are uncertain. We review the main ideas behind dynamic programming, stochastic programming, and robust optimization, and illustrate the techniques with examples. Chapter 8 uses the concept of optimization to introduce the mean-variance portfolio optimization framework, which was the first practical analytical framework for portfolio allocation. The mean-variance portfolio model quantified the idea of risk and presented an argument for diversification (that is, distributing the risk) of investments, which is widely accepted in the investment industry. We present an alternative framework for optimization decision making in investments—expected utility maximization—and also discuss recent work in redefining the concept of diversification. Chapter 9 explains factor models—statistical models that link asset returns to the returns of underlying factors—that were originally suggested as a way to improve the computational properties of the mean-variance optimization framework described in Chapter 8, and now provide the basis for portfolio risk decomposition schemes and new investment strategies. We discuss practical aspects of the construction and selection of factor models in industry, as well as issues with the da


### Research block 50

Chapter 12 continues the discussion of the use of analytics for equity portfolio management from Chapter 11 but focuses specifically on the application of factor models. It lists several important groups of equity factors, shows how to incorporate such factors in stock screens, and provides a detailed example of portfolio risk decomposition, stress testing, performance evaluation, and risk forecasting with simulation. Chapter 13 introduces fundamental concepts and terminology for fixed income portfolio management in practice. We review the sectors of the bond market, basics of fixed income analytics (yield, duration, convexity) and major sources of risk for bond investors, concluding with a description of the spectrum of bond portfolio strategies. Chapter 14 integrates the concepts from Chapter 13 in a real-world example of fixed income portfolio construction and risk decomposition using factor models. It also discusses the most common factors used in fixed income portfolio management, and outlines analytical approaches to fixed income portfolio construction and rebalancing. Chapter 15 focuses on the management of funds to satisfy contractual liabilities. We describe the spectrum of liability-driven investment strategies and discuss strategies used by two major types of institutional investors: life insurance companies and defined benefit pension plans. We provide explicit examples of the use of statistical, simulation, and optimization techniques in the context of asset-liability management. No discussion of portfolio construction is complete without mention- ing derivativ


### Research block 51

T o understand the risk and expected return associated with an individual asset or a portfolio, one needs a way to model uncertainty. Mathemat- ically, information about uncertainty can be summarized with probability distributions. Expected return and risk are measures describing features of these probability distributions. This chapter reviews the concepts of random variables, discrete and continuous probability distributions, distribution summary measures, and a law in statistics called the Central Limit Theorem. An important part of the chapter is the introduction of the concept of risk measures. Some of the most widely used risk measures in portfolio management such as standard deviation, value-at-risk, and conditional value-at-risk are explained.


### Research block 52

A natural way to think of uncertainty is in terms of scenarios. Scenarios represent possible events that could happen. For example, the value of a stock you own but are contemplating selling may go up (one scenario) or down (another scenario) one year from now. To these scenarios, you could assign probabilities, which reflect your estimate of the likelihood that the scenarios will occur. For example, you estimate that the probability that the stock’s value will go up is 0.30 (30%), and the probability that it will go down is 0.70 (70%). The information contained in the scenarios and the probabilities can be summarized in probability distributions. Basically, probability distributions


### Research block 53

are listings of the possible uncertain values and their probabilities. This information is often presented in graphs—we will see examples later in this chapter. We will also see that in order to analyze and summarize insights from probability distributions, it is better to have numbers (not categories) on the horizontal axis of the graph, popularly referred to as the “x-axis.” Thus, it is not a good idea to create a probability distribution for which the random event mentioned in the previous paragraph—that the stock’s value will go up or down—is plotted, because “up” and “down” are not numerical quantities. In order to create a probability distribution, we need to assign numerical values to the uncertain outcomes. Let us think of the outcome “up” as a 1, and of the outcome “down” as a 0. Such mapping of events to numerical values is called a random variable. The term “random variable” is actually a misnomer, because random variables are neither random nor variables. They are numerical representations, or, equivalently, function assignments, of the outcomes of uncertain events to numbers. Probability distributions are plots of distributions of random variables, and do not necessarily map one-to-one to a list of outcomes. Note, by the way, that the two probabilities of the two scenarios for the movement of the value of the stock add up to 1 (100%). This is because we assume that only one of the two events can happen (so, for example, the stock’s value cannot stay the same), which means that the two scenarios exhaust the possible states of the world, and thus should add up to


### Research block 54

We used x inside the parentheses to signal that this is the realization of the random variable ̃X, not the random variable ̃X itself (which is a func- tion); x is a specific value ̃X takes. Exhibit 2.1 corresponds to the probability listing above as follows: there is a bar at each of the values the random variable can take (0 and 1) and the height of the bar equals the probability that the specific value for the random variable occurs. The heights of all bars in the graph add up to 1.


### Research block 55

a “success.” Assume that the success in one year is independent of the suc- cess in another year, and let us count the number of successes out of the three possible times. This is going to be an uncertain quantity. The proba- bility distribution of the number of successes in a prefixed number of trials is called the binomial distribution. In our example, the number of trials is three, because in each of the three years there is a chance that the trial will be a “success” (the stock’s value will go up) or a “failure” (the stock’s value will go down). Note that the Bernoulli distribution is in fact a special case of the binomial distribution, in which the number of trials is 1. The binomial distri- bution is very important and widely used in a variety of applications—from statistical analysis of polling results to modeling prices of financial securities and evaluating the economic prospects of a capital budgeting project. To be mathematically specific, the binomial distribution can be used when the following four conditions are satisfied:

