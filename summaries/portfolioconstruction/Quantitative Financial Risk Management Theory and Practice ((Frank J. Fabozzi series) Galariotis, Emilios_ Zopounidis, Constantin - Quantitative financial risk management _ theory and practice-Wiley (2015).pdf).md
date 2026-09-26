# Quantitative Financial Risk Management: Theory and Practice — Detailed Quantitative Research Notes

**Title:** Quantitative Financial Risk Management: Theory and Practice  
**Editors/Authors:** Emilios Galariotis, Constantin Zopounidis (Wiley, Frank J. Fabozzi series framing in filename)  
**Year:** 2015  
**Publisher:** Wiley  
**Focus:** Theory and practice of quantitative FRM—market, credit, operational, liquidity; econometric and optimization tools; regulation-aware applications.

---

## Problem / Motivation

Provide advanced quantitative methods for measuring and managing financial risk beyond introductory VaR—covering multivariate dependence, extreme values, credit portfolios, liquidity, and optimization under risk constraints for banks and asset managers.

---

## Thematic Quantitative Core

### Market risk
Return distributions; EWMA/GARCH vol; multivariate GARCH; copulas; EVT (peaks-over-threshold, GPD); VaR/ES estimation and backtesting; spectral risk measures.

### Credit risk
Structural (Merton) vs reduced-form; transition matrices; CreditMetrics-style; copula default dependence; CDO pricing sketches; counterparty risk/CVA themes.

### Operational & liquidity
Loss distribution approach; scenario analysis; liquidity-adjusted VaR; funding liquidity.

### Optimization & regulation
Portfolio optimization with risk constraints (VaR/ES); Basel-oriented capital; stress testing design.

### Key equations
$$
\mathrm{VaR}_\alpha=F^{-1}(\alpha),\quad \mathrm{ES}_\alpha=\mathbb{E}[L|L\ge\mathrm{VaR}_\alpha]
$$
GPD tail: $G(x)=1-(1+\xi x/\beta)^{-1/\xi}$.  
Gaussian copula: $C(u)=\Phi_\Sigma(\Phi^{-1}(u_i))$.  
Merton PD: $\Phi(-DD)$ with distance-to-default.

---

## Practical Takeaways

1. Fat tails: use EVT/GARCH-t, not Gaussian VaR alone.  
2. Dependence in crises: copulas / historical stress over linear corr.  
3. ES preferred for subadditivity.  
4. Credit: calibrate carefully to physical vs risk-neutral PDs.  
5. Integrate liquidity into risk limits.  
6. Optimization under ES is tractable with modern solvers.  


## Mapping to Hull & Ang

Hull provides institutional RM breadth; this volume deepens econometric estimation. Ang provides factor bad-times framing for which risks to underwrite.



---

## Source-Derived Research Blocks


### Research block 1

No part of this publication may be reproduced, stored in a retrieval system, or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, scanning, or otherwise, except as permitted under Section 107 or 108 of the 1976 United States Copyright Act, without either the prior written permission of the Publisher, or authorization through payment of the appropriate per-copy fee to the Copyright Clearance Center, Inc., 222 Rosewood Drive, Danvers, MA 01923, (978) 750-8400, fax (978) 646-8600, or on the Web at www.copyright.com. Requests to the Publisher for permission should be addressed to the Permissions Department, John Wiley & Sons, Inc., 111 River Street, Hoboken, NJ 07030, (201) 748-6011, fax (201) 748-6008, or online at http://www.wiley.com/go/permissions.


### Research block 2

Limit of Liability/Disclaimer of Warranty: While the publisher and author have used their best efforts in preparing this book, they make no representations or warranties with respect to the accuracy or completeness of the contents of this book and specifically disclaim any implied warranties of merchantability or fitness for a particular purpose. No warranty may be created or extended by sales representatives or written sales materials. The advice and strategies contained herein may not be suitable for your situation. You should consult with a professional where appropriate. Neither the publisher nor author shall be liable for any loss of profit or any other commercial damages, including but not limited to special, incidental, consequential, or other damages.


### Research block 3

Iain Clacher, Mark Freeman, David Hillier, Malcolm Kemp and Qi Zhang A Brief Look at Markov Regime Switching in Academic Economics and Finance 74 Regime Switching and Interest Rate Processes 75 Regime Switching and Exchange Rates 76 Regime Switching, Stock Returns, and Asset Allocation 77 Single-Asset Markov Models 79 Two-State Estimation 82 Three-State Estimation 84 Markov Models for Multiple Assets 85 Practical Application of Regime Switching Models for Investment Purposes 87 Intuitive Appeal of Such Models 87 Implementation Challenges 89 Selecting the “Right" Model Structure 89 Calibrating the Selected Model Type to Suitable Data 90 Drawing the Right Conclusions from the Model 93 References 95


### Research block 4

T he book Quantitative Financial Risk Management: Theory and Practice provides an invaluable forum for creative and scholarly work on financial risk management, risk models, portfolio management, credit risk modeling, portfolio management, and financial markets throughout the world. Quantitative financial risk management consists of economics, account- ing, statistics, econometrics, mathematics, stochastic processes, and computer science and technology. The tools of financial management are more frequently being applied to manage, monitor, and measure risk, espe- cially in the context of globalization, market volatility, and economic crisis. The main objectives of this book are to advance knowledge related to risk management and portfolio optimization, as well as to generate theoretical knowledge with the aim of promoting research within various sectors wherein financial markets operate. Chapters will relate to one of these areas, will have a theoretical and/or empirical problem orientation, and will demonstrate innovation in theoretical and empirical analyses, methodologies, and applications. We would like to thank the assistant editors Georgios Manthoulis and Stavroula Sarri for their invaluable help. We extend appreciation to the authors and referees of these chapters, and to the editors at John Wiley & Sons, Inc., for their assistance in producing this book. The editors, Constantin Zopounidis Emilios Galariotis


### Research block 5

Constantin Zopounidis is professor of Financial Engineering and Opera- tions Research at Technical University of Crete in Greece, distinguished research professor at Audencia Nantes, School of Management (EQUIS, AMBA, AACSB) in France, senior academician of the Royal Academy of Doctors and the Royal Academy of Economics and Financial Sciences of Spain, and elected president of the Financial Engineering and Banking Society (FEBS). His research interests include financial engineering, financial risk man- agement, and multiple-criteria decision making. He has edited and authored more than 70 books in international publishers and more than 450 research papers in scientific journals, edited volumes, conference proceedings, and encyclopedias in the areas of finance, accounting, operations research, and management science. Prof. Zopounidis is editor-in-chief and member of the editorial board of several international journals. In recognition of his scientific work, he has received several awards from international research societies. Emilios Galariotis is professor of Finance at Audencia Nantes School of Management (AMBA, EQUIS, AACSB) in France. He is the founder and director of the Centre for Financial and Risk Management (CFRM) and head of research in the area of Finance, Risk, and Accounting Performance at Audencia. His academic career started at Durham University and head of research in the area of Finance, Risk, and Accounting Performance as well as co-chair of the department of Accounting and Finance at Audencia. UK. There, beyond his academic role. His academic career start


### Research block 6

T he global financial crisis of 2007–2008, often considered as the worst financial crisis since the Great Depression of the 1930s, resulted in a change of paradigms in the financial and banking sector. These crisis years saw collapses of large financial institutions, bailouts of banks by govern- ments, and declines of stock markets. Triggered by the U.S. housing bubble, which itself was caused by giving easy access to loans for subprime bor- rowers, financial distress spread over the banking sector and led to failure of key businesses and to the 2008–2012 global recession. Finally, this also contributed to the European sovereign-debt crisis, with lots of aftereffects in our present times. 3


### Research block 7

Uncertainties about bank solvency, declines in credit availability, and reduced investor confidence had an impact on global stock markets. Governments responded with fiscal measures and institutional bailouts, which in the long term resulted in extreme public debts and necessary tax increases. This negative experience demonstrates that the economy as a whole, but especially the financial sector is subject to risks, which are grounded in the interdependencies between the different economic actors and not in the performance of individual actors. This type of risk is generally called systemic risk. While aspects of systemic risk (e.g., bank run and contagion) were always an issue in discussions about the financial system, the recent crises have increased the interest in the topic, not only in academic circles, but also among regulators and central banks.


### Research block 8

If one aims at measuring—and in a further step managing and mitigating— systemic risk, it is important to start with a definition. However, despite the consent that systemic risk is an important topic, which is reflected by an increasing number of related papers and technical reports, there is still not a single generally accepted definition. As a first step, one should distinguish between systemic and systematic risk. Systematic risks are aggregate (macroeconomic) risks that cannot be reduced by hedging and diversification. Systemic risk, on the other hand, is a different notion. It refers to the risk of breakdown or at least major dys- function of financial markets. The Group of Ten (2001) gave the following, often cited definition:


### Research block 9

Systemic financial risk is the risk that an event will trigger a loss of eco- nomic value or confidence in, and attendant increases in uncertainly about, a substantial portion of the financial system that is serious enough to quite probably have significant adverse effects on the real economy. Systemic risk events can be sudden and unexpected, or the likelihood of their occurrence can build up through time in the absence of appropriate policy responses. The adverse real economic effects from systemic problems are generally seen as arising from disruptions to the payment system, to credit flows, and from the destruction of asset values.


### Research block 10

A similar definition can be found in Acharya et al. 2009. Given the described diversity of definitions, which are similar but also different with respect to their focus, it is hard to develop universally accepted measures for systemic risk. Different definitions refer to different important nuances of systemic risk, which means that on the operational level a robust framework for monitoring and managing systemic risk should involve a vari- ety of risk measures related to these different aspects. See Hansen (2012) for a deeper discussion of the basic difficulties in defining and identifying systemic risk. We will focus on the first part of the definition by Kaufmann and Scott (2003), which summarizes the most important aspect of systematic risk in financial systems, without addressing more general economic aspects. Such an approach could be seen as “systemic risk in the narrow sense” and we state it (slightly modified) as follows: Systemic risk is the risk of breakdowns in an entire system, as opposed to breakdowns in individual parts or components. Three issues have to be substantiated, if one wants to apply such a defi- nition in concrete situations: system, breakdowns, and risk.


### Research block 11

In financial applications, the focus lies on parts of the financial system (like the banking system, insurance, hedge funds) or the financial system as a whole. Any analysis has to start with describing the agents (e.g., banks in the banking system) within the analyzed system. This involves their assets and liabilities and the main risk factors related to profit and loss. For a systemic view, it is important that the agents are not isolated enti- ties at all. Systematic risk can be modeled by joint risk factors, influencing all profit and losses. Systemic risk in financial systems usually comes by mutual debt between the entities and the related leverage.


### Research block 12

In single-period models, breakdown is related to bankruptcy in a technical sense—that is, that the asset value of an agent at the end of the period does not reach a certain level (e.g., is not sufficient to pay back the agents debt). A lower boundary than debt can be used to reflect the fact that confidence into a bank might fade away even before bankruptcy, which severely reduces confidence between banks. In a systemic view, it is not sufficient to look at breakdowns of individual agents: Relevant are events that lead to the breakdown of more than one agent.


### Research block 13

Risk is the danger that unwanted events (here, breakdowns) may happen or that developments go in an unintended direction. Quantifiable risk is described by distributions arising from risk. For financial systems this may involve the probability of breakdowns or the distribution of payments nec- essary to bring back asset values to an acceptable level. Risk measures sum- marize favorable or unfavorable properties of such distributions. It should be mentioned that such an approach assumes that a good distri- butional model for the relevant risk factors can be formulated and estimated. During this chapter, we will stick to exactly this assumption. However, it is clear that in practice it is often difficult to come up with good models, and data availability might be severely restricted. Additional risk (model risk) is related to the quality of the used models and estimations; see Hansen (2012) for a deeper discussion of this point.


### Research block 14

contractual obligations (liabilities). Simple models such as Merton (2009) start by modeling a single firm in the framework of the Black–Scholes option pricing model, whereas more complex models extend the framework to mul- tivariate formulations, usually based on correlations between the individual asset values. A famous example is Vasicek’s asymptotic single factor model (see Vasicek 1987; 1991; and 2002), which is very stylized but leads to a closed-form solution. In most structural default models, it is not possible to calculate the port- folio loss explicitly; hence, Monte Carlo simulation is an important tool for default calculations. Even then, the models usually make simplifying assumptions. Consider a system consisting of k economic entities (e.g., banks), and let A1(t), A2(t), … , Ak(t) denote the asset processes—that is, the asset values at time t for the individual entities. Furthermore, for each entity i a limit Di, the distress barrier, defines default in the following sense: default occurs if the asset value of entity i falls below the distress barrier:


### Research block 15

denote the distance to default of the individual entities. Note that alter- natively the distance to default can also be defined in terms of Xi(t) as a percentage of asset value, divided by the asset volatility (see e.g., Crosbie and Bohn 2003). In a one period setup—as used throughout this chapter—one is interested at values Ai(T), Xi(T) at time T, the end of the planning horizon. Analyzing systemic risk then means analyzing the joint distri- bution of the distances to default Xi(t), in particular their negative parts Xi(T)− = max {−Xi(T), 0}, and the underlying random risk factors are described by the joint distribution of asset values Ai(T). Many approaches for modeling the asset values exist in literature. In a classical finance setup, one would use correlated geometric Brownian motions resulting in correlated log-normal distributions for the asset values at the end of the planning horizon. Segoviano Basurto proposes a Bayesian approach (Segoviano Basurto 2006); for applications, see also Jin and Nadal de Simone (2013). In this chapter, we will use copula-based models, as discussed later.


### Research block 16

The second component of the approach, the distress barrier, is in the sim- plest case (Merton 2009), modeled just by the face value of overall debt for each entity. Other approaches distinguish between short-term and long-term debt (longer than the planning horizon). Usually, this is done by adding some reasonable fraction of long-term debt to the full amount of short term debt; see, for example, Servigny and Renault (2007). Still, such classical credit default models (see, e.g., Guerra et al. 2013), although classified as systemic risk models, neglect an important aspect: Economic entities like banks are mutually indebted, and each amount of debt is shown as a liability for one entity but also as an asset for another entity. Default of one entity (a reduction in liabilities) may trigger subse- quent defaults of other entities by reducing their asset values. We call such models systemic models in the strict sense. Such approaches with mutual debt have been proposed, such as in Chan-Lau et al. (2009a; 2009b). Models neglecting this aspect are systemic models in a broad sense; in fact, they are restricted to the effects of systematic risk related to asset values. The basic setup of systemic models in the strict sense can be described as follows: Let H0 ij denote the amount of debt between entities i and j —that is, the amount of money borrowed by entity i from entity j. We also include debt to the nonbank sector, denoted by Hi for each entity i and credit Ci to the nonbanking sector, both repayable (including interest) at the end of the planning horizon, time T. Furthermore, 


### Research block 17

occurrences of H0 i by H1 i . This first default triggers further ones and starts a loss cascade: It may happen that after the first adjustment step new defaults can be observed, which results in a new set of bankrupt entities I1 D after the second round. In addition, bankruptcy of additional entities may reduce even further the insolvent assets of entities that already defaulted in the first round. This process can be continued, leading to new values Xk i (T), Hk ij, A k i (T),


### Research block 18

The distances to default, derived from structural models, in particular from systemic models in the strict sense, can be used to measure systemic risk. In principle, the joint distribution of distances to default for all involved entities contains (together with the definition of distress barriers) all the rel- evant information. We assume that the joint distribution is continuous and let p(x)= p(x1, x2, … , xk) denote the joint density of the distances to default X1(T), X2(T), … , Xk(T) for all entities. Note that the risk measures discussed in the following are often defined in terms of asset value, which is fully appropriate for systemic models in the broader sense. In view of the previous discussion of systemic models in the strict sense, we instead prefer to use the distances to default or loss variables derived from the distance to default. The first group of risk measures is based directly on unconditional and conditional default probabilities. See Guerra et al. (2013) for an overview of such measures. The simplest approach considers the individual distress probabilities


### Research block 19

The term in squared brackets is the marginal density of Xi(T), which means that it is not necessary to estimate the joint density for this mea- sure. In similar manner, one can consider joint distributions for any subset I ⊆ {1, … , k} of entities by using the related (joint) marginal density pI(x), which can be obtained by integrating the joint density p(x) over all other entities, that is, j ∉ I. Joint probabilities of distress for a subset I can be achieved by


### Research block 20

(1.12) where the set I contains the elements i1, i2, … , ikI . Of special interest are the default probabilities of pairs of entities (see, e.g., Guerra, et al., 2013). Joint probabilities of distress describe tail risk within the chosen set I.If I represents the whole system (i.e., it contains all the entities), then the joint probability of distress can be considered as a tail risk measure for systemic risk (see, e.g., Segoviano & Goodhart, 2009). Closely related are conditional probabilities of distress, that is, the prob- ability that entity j is in distress, given that entity j is in distress, which can be written as P D j|i = P(Xj(T) < 0|Xi(T) < 0)= PD {i,j} PD i . (1.13)


### Research block 21

These conditional probabilities can be presented by a matrix with PD j|i as its ijth matrix element, the distress dependency matrix. While conditional distress probabilities contain important information, it should be noted that they only reflect the two-dimensional marginal distri- butions. Conditional probabilities are often used for analyzing the interlink- age of the system and the likelihood of contagion. However, such arguments should not be carried to extremes. Finally, conditional probabilities do not contain any information about causality. Another systemic measure related to probabilities is the probability of at least one distressed entity; see Segoviano and Goodhart (2009) for an application to a small system of four entities. It can be calculated as


### Research block 22

That is, the conditional value at risk at level 𝛼 is compared to the condi- tional value at risk at the median level. From all the ΔCoVaR𝛼 =(j | i) values, it is possible to construct another kind of dependency matrix. This idea can also be applied to the system as a whole: If Xj(T) is replaced by X(T)= ∑k i=1 Xi(T), the distance to default of the whole system, (1.16) to (1.18), leads to a quantity ΔCoVaR𝛼 =(j | i) that measures the impact of entity i on the system. In this way one is able to analyze notions like “too big to fail” or “too interconnected to fail.” In contrast to probability-based measures, CoVaR emphasizes the role of potential monetary losses. This approach can be carried forward, leading to the idea that systemic risk should be related to the losses arising from


### Research block 23

Ltot covers all credit losses in the whole system, both from interbank credits and from credits to the public. From the viewpoint of a state, this notion of total loss may be seen as too extensive. One may argue that only losses guaranteed by the state are really relevant. Definition (1.19) therefore depicts a situation in which a state guarantees all debt in the system, which can be considered as unrealistic. However, in most developed countries, the state guarantees saving deposits to a high extend, and anyhow society as a whole will have to bear the con- sequences of lost debt from outside the banking system. Therefore, a further notion of loss is given by L sav = k∑


### Research block 24

which describes the amount of lost nonbanking debt For the structural model, which has been described in the previous section, loss given default can be calculated using (1.8) and (1.9). In general, the notion of loss depends on the exact viewpoint (loss to whom). We will therefore use the symbol L to represent any kind of loss variable in the following discussion of systemic risk measures. An obvious measure is expected loss—that is, the (discounted) expec- tation of the risk variable L. For simple structural models like (1.2), this measure can be calculated from the marginal distribution of asset values, respectively, of distances to default. Modeling the joint distributions is not necessary. Note that this is different for the strict systemic model (1.9). The expectation can be calculated with respect to an observed (esti- mated) model, or with respect to a risk-neutral (martingale) model. Using observed probabilities may account insufficiently for risk, which contradicts the aim of systemic risk measurement. Using risk-neutral valuation seems reasonable from a finance point of view and has been used, for example, in Gray and Jobst (2010) or Gray et al. (2010). However, it should be kept in mind that the usual assumptions underlying contingent claims analysis—in particular, that the acting investor is a price taker—are not valid if the investor has to hedge the whole financial system, which clearly would be the case when hedging the losses related to systemic risk.


### Research block 25

Using expectation and the concept of loss cascades, Cont et al. (2010) define a contagion index as follows: They define first the total loss of a loss cascade triggered by a default of entity i and the contagion index of entity i as the expected total loss conditioned on all scenarios that trigger the default of entity i. Clearly, the expectation does not fully account for risk. An obvious idea is to augment expectation by some risk measure 𝜌, which, with weight a, leads to 𝜋𝜌(L)= E[L]+ a𝜌(L). (1.21)


### Research block 26

Typical choices of 𝜌 are dispersion measures like the variance or the standard deviation. Such measures are examples of classical premium cal- culation principles in insurance. Further, more general premium calculation principles are for example, the distortion principle or the Esscher premium principle. For an overview on insurance pricing, see Furmann and Zitikis (2008). In the context of systemic risk, the idea to use insurance premiums was proposed in Huang et al. (2009). In this chapter, empirical methods were used for extracting an insurance premium from high-frequency credit default swap data. Even more generally, it should be noted that any monetary risk measure—in particular, coherent measures of risk—can be applied to the overall loss in a system. See Kovacevic and Pflug (2014) for an overview and references. In this broad framework, an important class of risk measures is given by the quantiles of the loss variable L:


### Research block 27

With probability 𝛼, the loss will not be higher than the related quantile. Quantiles are closely related to the value at risk (VaR), which measures quantiles for the deviation of the loss from the expected loss. Note the slight difference between (1.22) and (1.17), because (1.17) is stated in terms of distance to default and (1.12) in terms of loss. Q𝛼(L) can also be interpreted in an economic way, as follows. Assume that a fund is built up in order to cover systemic losses in the banking sys- tem. If we ask how large the fund should be, such that it is not exhausted, with probability 𝛼 over the planning period, then the answer will be QL(𝛼). This idea can also be reversed. Assume now that a fund of size q has been accumulated to deal with systemic losses. Then the probability that the fund is not exhausted, FL(q)= P(L ≤ q), (1.23)


### Research block 28

The distinction between risk factors that are related to individual perfor- mances and risk factors that are a consequence of the interrelations of the economic agents has its parallel in a similar distinction for probability dis- tributions or stochastic processes: Suppose that X1(t), … , Xk(t) describe the performance processes of k economic agents. The individual (marginal) processes are assumed to follow certain stochastic models as discrete Markov processes, diffusion models, or jump-diffusion models. The joint distribution, however, depends on the copula process, which links the marginal processes. To simplify, suppose only a single-period model is considered and that the performance after one period is X1, … , Xk. If this vector has marginal cumulative distribution functions F1, … , Fk (meaning that P(Xi ≤ u)= Fi(u)), then the joint distribution of the whole vector can be represented by


### Research block 29

Example 2. Consider a system of seven banks, where the performances Xi, i = 1, … , 7 are related by a normal copula stemming from a correlation matrix with all off-diagonal elements 𝜌 (the diagonal elements are 1). Sup- pose that the first bank defaults if its performance drops below the 5 percent quantile. Given the copula, one may determine the number of other banks that also fall below the 5 percent quantile (i.e., default as a consequence of the first bank’s default). Figures 1.1 and 1.2 show the distribution of these numbers for the choice of 𝜌 = 0,𝜌 = 0.2,𝜌 = 0.5 and 𝜌 = 0.8. One may observe that in the independent case (𝜌 = 0) the other banks are practically not affected by the default of one bank, while for higher correlated cases a contagion effect to other banks can be easily seen. A very interdependent banking system carries a high systemic risk. It has therefore been proposed to limit the dependencies by creating quite indepen- dent subsystems. Example 3 gives evidence for this argument.


### Research block 30

Example 3. Here, we consider seven banks, each of which has a perfor- mance given by a negative gamma distribution with mean 100 and variance 200, but shifted such that with probability 5 percent a negative performance happens, which means bankruptcy. The total losses of the system are cal- culated on the basis of a normal copula linking the individual losses. By assuming that the government (or the taxpayer) takes responsibility for cov- ering total losses up to the 99 percent quantile, this quantile (the 99 percent VaR) can be seen as a quantization of the systemic risk. In Figures 1.3 to 1.6, we show in the upper half a visualization of the correlations (which determine the normal copula) by the thickness of the arcs connecting the seven nodes representing the banks. The lower half shows


### Research block 31

Systemic financial risk is an important issue in view of the distress the bank- ing systems all over the world have experienced in the recent years of crises. Even if breakdowns are prevented by the government, the related societal costs are extremely high. We described the measurement of systemic risk, based on the struc- tural approach originating from structural credit risk models. In particular, the cascading effects that are caused by mutual debt between the individ- ual banks in the system were analyzed in detail. Furthermore, we related the notion of systemic risk to the copula structure, modeling dependency between the performances of the individual banks. The effects of different levels of dependency on the total systemic risk in terms of the value at risk of total losses were demonstrated by examples.


### Research block 32

Acharya, V., L. Pedersen, T. Phillipon, and M. Richardson. 2009. Regulating systemic risk. In Restoring Financial Stability: How to Repair a Failed System. Hoboken, NJ: John Wiley and Sons. Adrian, T., and M. K. Brunnermeier. 2009. CoVar. In: Staff Report 348: Federal Reserve Bank of New York. Chan-Lau, J., J. M. Espinosa-Vega, and J. Sole. 2009a. On the use of network analysis to assess systemic financial linkages. Washington, D.C.: International Monetary Fund, IMF. Chan-Lau, J., M. A. Espinosa-Vega, K. Giesecke, and J. Sole. 2009b. A. Assessing the systemic implications of financial linkages. In: Global Financial Stability Report. Washington, D.C.: International Monetary Fund, IMF. Cont, R., A. Moussa, and E.e.S. Bastos. 2010. Network structure and sys- temic risk in banking systems, s.l.: Preprint, electronic copy available at http://ssrn.com/abstract=1733528. Crosbie, P. and J. Bohn. 2003. Modeling default risk: Moody’s KMV. European Central Bank. 2004. Annual Report, Frankfurt, available at http://www .ecb.europa.eu/pub/pdf/annrep/ar2004en.pdf. Furmann, E., and R. Zitikis. 2008. Weighted premium calculation principles. Insur- ance, Mathematics and Economics, 459–465.


### Research block 33

Girardi, G., and T. Ergün. 2012. Systemic risk measurement: Multivariate GARCH estimation of CoVaR. available at http://papers.ssrn.com/sol3/papers.cfm? abstract_id=1783958. Gray, D. F., A. A. Jobst, and S. W. Malone. 2010. Quantifying systemic risk and reconceptualizing the role of finance for economic growth. Journal of Investment Management 8(2). Gray, D., and A. A. Jobst. 2010. New directions in financial sector and sovereign risk management. Journal of Investment Management 8(1). Group of Ten. 2001. The G10 Report on Consolidation in the Financial Sector, Chap. 3, http://www.imf.org/external/np/g10/2001/01/Eng/pdf/file3.pdf Guerra, S. M., B. M. Tabak, R. A. Penaloza, and R. C. de Castro. 2013. Systemic Risk Measures. Working paper 321, Banco do Brasil, http://www.bcb.gov.br/pec /wps/ingl/wps321.pdf [Online]. Hansen, L. P. 2012. Challenges in identifying and measuring systemic risk, s.l.: National Bureau of Economic Research. Huang, X., H. Zhou, and H. Zhu. 2009. A framework for assessing the systemic risk of major financial institutions. Journal of Banking and Finance 33: 2036–2049. Jin, X., and F. Nadal de Simone. 2013. Banking Systemic Vulnerabilities: A Tail-Risk Dynamic CIMDO Approach. Banque centrale de Luxembourg. Kaufmann, G. G., and K. E. Scott. 2003. What is systemic risk, and do bank regula- tors retard or contribute to it? Independent Review 7: 371–391. Kovacevic, R., and G. Ch. Pflug. 2014. Measuring and Managing Risk. Chapter 2 In: Investment Risk Management, edited by K. Baker and G. Filbeck, Oxford University Press, Oxford, UK. Mainink, G., and E. Schaan


### Research block 34

A bank’s counterparty credit risk (CCR) exposure quantifies how much money the counterparty might owe the bank in the event of default. The CCR quantity is broken down into current exposure (CE), which measures the exposure if the counterparty were to default today, and potential exposure (PE), which measures the potential increase in exposure that could occur between today and some time horizon in the future. The time of default is typically modeled as a stochastic stopping time. As opposed to the known CE, the PE must be estimated, usually by simulation. First, the expected positive exposure (EPE) is computed by simulating a large number (on the order of 102 to 103) of different paths for the various under- lying future prices in the possible market environments, using a so-called regularized variance-covariance matrix. Then the system prices each of the derivative transactions on each path for each sample date,2 computes collat- eral call amounts based on relevant marked-to-market (MTM) calculations,


### Research block 35

applies the portfolio effects of netting and collateral, and aggregates expo- sure results to compute the average exposure along a term structure. While an EPE may be a good indicator of the cost to replace a contract should the counterparty default, EPE is not helpful in the trade inception approval process because of its volatility and the need for a high confidence interval. Therefore, many banks will also report a very high percentile (e.g., 97.7th or 97.5th) of the exposure distribution over a large number of paths. Note that these peaks in exposure profiles are not simply added over different products for a given counterparty, as these peaks may happen at different points in time. Rather, the time profiles of exposures are summed over products traded with a single counterparty, and the peak of that time profile is the summary PE measure. This methodology is conservative, as PEs are simply added over counterparties, while the bank may enter trades that mitigate each other in terms of PE with different counterparties. We can readily see that CCR measurement necessarily combines the tools of standard market risk measurement with the tools of standard credit risk determination, a unique challenge to both. This frequently requires calculating probability-of-default (PD), loss-given-default (LGD), exposure-at-default (EAD), and a credit rating of the counterparty.3


### Research block 36

The credit valuation adjustment (CVA) is defined as the product of the EPE times the LGD times the cumulative mortality rate (CMR), where the CMR is simply a multi-period PD rate. This is structurally equivalent to pric- ing EPE as the contingent leg of a credit default swap (CDS) by applying the counterparty spread to it. Such a spread is either a market quote if the name has a bespoke traded CDS, or a pseudo-CDS spread computed along a grid arrayed by region, industry, rating, and tenor. In the worst case, bond or loan spreads are used, giving rise to basis risk. It can be recognized that it is this part of the process that joins the market and the credit risk aspects of the algorithm. Practices for measuring market risk are used in mapping deriva- tives exposures to a set of market risk factors (e.g., spreads, volatilities, or correlations), simulating those factors out to a forward-looking time hori- zon, and determining the distribution of the level of exposures over various realizations of these risk factors in the simulation. Separately, standard credit risk processes provide assessments of the credit quality of the counterparty, such as PD and LGD estimation. Direct or originating businesses (i.e., trading desks) are viewed as credit portfolios: As their positions get in the money, this gives rise to CCR, since


### Research block 37

the counterparty may default while owing money to the bank. The CVA represents a daily MTM transfer price of default risk charged to the origi- nating business for insuring default risk, which is the price of a pseudo-CDS hedge with the EPE as underlying notional. The group (e.g., the market risk management department) that sells insurance to the business at inception of the trade will cover any loss due to counterparty default. As the exposure rises, due to either an increase in the position or a decrease in the credit qual- ity of the counterparty, the CVA increases as it is marked to market. On the other hand, a profit is reported if the CVA decreases, due either to the bank’s position becoming less in the money, an improvement in the counterparty’s credit rating, or just the passage of time without any credit event. However, no further credit-related charges or costs are incurred by the business. In the limit, the CVA disappears as the maturity of the derivative contract is reached, and payment—if any is due—is made to the bank. Products that are new or too complex to be properly simulated within the main CCR engine are dealt with “offline.” This usually means assigning them “risk factors” or more generally “add-ons” that are conservative and do not allow for netting; for this reason, such offline trades may account for up to 50 percent of the total exposure, although only 5 to 10 percent of trades made. The problem is that the counterparty credit exposure (CCE) is not sensitive to actual risk any longer: The sum of these add-ons may lead to the same measure of CCE for 


### Research block 38

Analogous to the CVA, scenarios for underlying market factors are gen- erated and averaged over the resultant negative portfolio marked-to-market values (liabilities), taking into account legal netting and collateral agree- ments. The resulting expected negative exposure, floored at zero if a bank gets in the money in any given scenario, is what risk managers expect to owe its counterparties on its derivative portfolio at the time of its default. It is priced as the contingent leg of a credit default swap using the bank’s bank spreads, assuming that all deals are netted where possible, reflecting the fact that within the bank’s jurisdiction it is likely that its counterparties would legally seek to net all positions upon its default. For collateral considerations, often two types of default are considered. First, consider the case in which a bank defaults idiosyncratically, and a “springing” unilateral collateral agreement is assumed. This reflects the likely behavior of counterparties, who upon a worsening of a bank’s credit worthiness will either demand to enter into unilateral collateral agreements where there are none or renegotiate existing collateral agreements to terms favorable to them. Second, there is the case of a systemic default, where a bank’s default is part of a broad economic downturn. In this case it is much less clear that counterparties will be able to impose or change collateral agreements in their favor, and thus springing collateral is not considered. The final expected negative exposure value is a weighted average of the two cases, such that the rela


### Research block 39

Supervisory rules and guidance on CCR can be found in the Basel Committee on Banking Supervision (BCBS) frameworks of Basel I (BCBS, 1988); Basel II (BCBS, 2006); Basel III (BCBS, 2011); and BCSB (2012). The U.S. Office of the Comptroller of the Currency (OCC) and the Board of Governors of the Federal Reserve System (BOG-FRS) issued supervisory guidelines (OCC & BOG-FRS 2011). Kang and Kim (2005) provide simple closed-form pric- ing models for floating-rate notes and vulnerable options under the CCR framework, deriving closed-form pricing models for them and illustrating the impact of the counterparty default intensity on the prices of floating-rate notes and vulnerable options. Brigo and Chourdakis (2009) consider CCR for credit default swaps when default of the counterparty is correlated with default of the CDS reference credit. They incorporate credit spread volatility, adopt stochastic


### Research block 40

intensity models for the default events, and connect defaults through a copula function. The authors find that both default correlation and credit spread volatility have a relevant impact on the positive CCR valuation adjustment to be subtracted from the counterparty risk-free price. Jorion and Zhang (2009) observe that standard credit risk models cannot explain the observed clustering of default, sometimes described as “credit con- tagion,” and provide the first empirical analysis of credit contagion via direct counterparty effects. They find that bankruptcy announcements cause negative abnormal equity returns and increases in CDS spreads for creditors, and that creditors with large exposures are more likely to suffer from financial distress later, suggesting that counterparty risk is a potential additional channel of credit contagion. Arora, Gandhi, and Longstaff (2012) use proprietary data from 14 CDS dealers and find that counterparty risk is priced in the CDS market and the magnitude of the effect is small. Brigo, Capponi, Pallavicini, and Papatheodorou (2013) value bilateral CCR through stochastic dynamical models when collateral is included with possible rehypothecation. The authors show for credit default swaps that a perfect collateralization cannot be achieved under default correlation. Brigo, Buescu, and Morini (2012) compare two different bilateral counterparty valuation adjustment formulas (an approximation based on subtracting the two unilateral credit valuation adjustment formulas as seen from the two different parties in the transaction) and a fully specifie


### Research block 41

CCR is defined as the risk that the counterparty to a transaction could default or deteriorate in creditworthiness before the final settlement of a transaction’s cash flows. Unlike a loan, where only a bank faces the risk of loss, CCR creates a bilateral risk of loss because the market value of a trans- action can be positive or negative to either counterparty. The future market value of the exposure and the counterparty’s credit quality are uncertain and may vary over time as underlying market factors change. The regula- tory focus is on institutions with large derivatives portfolios setting their risk


### Research block 42

management practices as well as on supervisors as they assess and examine CCR management. CCR is multidimensional, affected by both the exposure to and credit quality of the counterparty, as well as their interactions, all of which are sensitive to market-induced changes. Constructing an effective CCR man- agement framework requires a combination of risk management techniques from the credit, market, and operational risk disciplines. CCR management techniques have evolved rapidly and improved over the last decade even as derivative instruments under management have increased in complexity. While institutions substantially improved their risk management practices, in some cases implementation of sound practices has been uneven across business lines and counterparty types. The financial crisis of 2007–2009 revealed weaknesses in CCR management of timely and accurate exposure aggregation capabilities and inadequate measurement of correlation risks. The crisis also highlighted deficiencies in monitoring and managing counter- party limits and concentrations, ranging from poor selection of CCR metrics to inadequate infrastructure. The Basel II “Revised Framework” (BCBS 2004) was intended to pro- mote a more forward-looking approach to capital supervision that encour- ages banks to identify and manage the risks they face. Treatment of CCR arising from over-the-counter (OTC) derivatives and repos in either trading or banking books was first set forth in an amendment to the original 1988 Basel Accord (BCBS 1988) treatments for the CCR of repo-style transac- tions. The Basel II frame


### Research block 43

Positions that give rise to CCR exposures share certain generic characteris- tics. First, the positions generate a credit exposure—the cost of replacing the transaction if the counterparty defaults, assuming there is no recov- ery of value. Second, exposures depend on one or more underlying market factors. Third, transactions involve an exchange of payments or financial instruments identified with an explicit counterparty having a unique PD. CCR for a position at any point in time equals a maximum of zero or replacement cost (market value) for each counterparty over tenure. This may


### Research block 44

include the use of collateral to mitigate risk, legal netting or “rights of offset” contracts, and the use of re-margining agreements. The fact that similar risk characteristics, products, and related activities with CCR are managed by institutions using similar methods and processes imply they may merit similar capital requirements. However, there are differences in rule treat- ment between OTC exposures and securities financing transactions (SFTs). SFTs include securities lending and borrowing, securities margin lending, and repurchase and reverse repurchase agreements. The Basel II revised framework (BCBS 2004) already provides three methods for SFTs: a simple approach, a comprehensive approach with both supervisory and nonsupervisory haircuts, and a value-at-risk (VaR) model. An internal model method (IMM) to CCR is available for both SFTs and OTC derivatives, but the nonmodel methods available for the latter are not applicable to the former. Institutions use several measures to manage their exposure to CCR, including potential future exposure (PFE), expected expo- sure (EE), and expected positive exposure (EPE). Banks typically compute these using a common stochastic model as shown in Figure 2.1. PFE is the maximum exposure estimated to occur on a future date at a high level of sta- tistical confidence, often used when measuring CCR exposure against credit limits. EE is the probability-weighted average exposure estimated to exist on a future date. EPE is the time-weighted average of individual expected exposures estimated for given forecasting horizons (e.g., one year)


### Research block 45

Consistent with the Basel I Revised Framework for credit risk, the EAD for instruments with CCR must be determined conservatively and condition- ally on an economic downturn (i.e., a “bad state”; BCBS 1998). In order to accomplish such conditioning in a practical, pragmatic, and conserva- tive manner, the internal and standardized model methods proposed scale EPE using “alpha” and “beta” multipliers. Alpha is set at 1.4 in both the internal model method and the standardized model method, but supervi- sors have the flexibility to raise alpha in appropriate situations. Banks may internally estimate alpha and adjust it both for correlations of exposures across counterparties and potential lack of granularity across a firm’s coun- terparty exposures. The alpha multiplier is also viewed as a method to offset model error or estimation error. Industry and supervisors’ simulations sug- gest alphas may range from approximately 1.1 for large global dealers to more than 2.5 for new users of derivatives with concentrated or no expo- sures. Supervisors proposed to require institutions to use a supervisory spec- ified alpha of 1.4 with the ability to estimate a firm portfolio–specific alpha subject to supervisory approval and a floor of 1.2. To estimate alpha, a bank would compute the ratio of economic capital (EC) for counterparty credit risk (from a joint simulation of market and credit risk factors) to EC when counterparty exposures are a constant amount equal to EPE (see Figure 2.2). Under the internal model method, the resulting risk weight may be adjusted to reflect the transaction


### Research block 46

categories: OTC derivatives, repo transactions, and on-balance-sheet loans/deposits. However, under the BCBS Amended Accord and Revised Framework, netting across product categories is not recognized for regula- tory capital computation purposes. The intent is to allow supervisors discre- tion to permit banks to net margin loans secured by purchased securities and executed with a counterparty under a legally enforceable master agreement. This is not intended to permit banks to net across different types of SFTs or to net SFTs against OTC derivatives that might be included in a prime brokerage agreement. The Basel cross-product netting rules recognize such between OTC derivatives and SFTs subject to national supervisor determi- nation that enumerated legal and operational criteria are widely met. A bank should have obtained a high degree of certainty on the legal enforceability of the arrangement under the laws of all relevant jurisdictions in the event of a counterparty’s bankruptcy. It is also important that the bank demonstrate to the supervisory authority that it effectively integrates the risk-mitigating effects of cross-product netting into its risk management systems. Require- ments are added to those that already exist for the recognition of any master agreements and any collateralized transactions included in a cross-product netting arrangement. Netting other than on a bilateral basis, such as netting across transactions entered by affiliates under a cross-affiliate master netting agreement, is not recognized for regulatory capital computation.


### Research block 47

The BCBS has articulated the principle that banks should be allowed to use the output of their “own estimates” developed through internal models in an advanced EAD. In order to achieve this, the regulators permit qualifying institutions to employ internal EPE estimates of defined netting sets of CCR exposures in computing the EAD for capital purposes. In general, internal models commonly used for CCR estimate a time profile of EE over each point in the future, which equals the average exposure over possible future values of relevant market risk factors (e.g., interest rates, FX rates). The motivation for this was the need for more consistent treatments and is particularly crit- ical if banks may make use of their own estimates to calculate EAD through an internal model. Relatively short-dated SFTs pose problems in measuring EPE because estimating a time profile of EE in an internal model only considers current transactions. For some SFT portfolios, the expected exposure might spike up rapidly in the first few days before dropping off sharply at maturity. How- ever, a counterparty may enter new or roll over existing SFTs, generating new exposure not reflected in a current EE time profile. An additional prob- lem arises when short-term are combined with long-term transactions, so that EE is U-shaped, which implies that if short-term transactions roll over,


### Research block 48

the decline in EE might understate the CCR amount. These issues can also apply to short-term OTC derivatives. Effective expected positive exposure measurements always lie somewhere between EPE and peak EE. In the case of upward- versus downward-sloping EE profiles, effective EPE will equal EPE or peak EE, respectively. In general, the earlier that EE peaks, the closer effective EPE will be to peak EE; and the later that EE peaks, the closer effective EPE will be to peak EPE. Under the internal model method, a peak exposure measure is more conservative than effective EPE for any counterparty and can be used with prior supervisory approval. While banks generally do not use effective EPE for internal risk management purposes or in economic capital models, it can easily be derived from a counterparty’s EE profile. The consensus is that this is a pragmatic way of addressing rollover of short-dated transactions and differentiating counterparties with more volatile EE time profiles. EEs can be calculated based on risk-neutral or physical-risk factor distributions, the choice of which will affect the value of EE but not necessarily lead to a higher or lower EE. The distinction often made is that the risk-neutral distribution must be used for pricing trades, while the actual distribution must be used for risk measurement and economic capital. The calculation of effective EPE has elements of both pricing (e.g., in the calculation of an effective maturity parameter) and simulation. Ideally, the calculation would use distribution appropriate to whether pricing or simula- tion is being 


### Research block 49

Qualifying institutions may use internal models to estimate the EAD of their CCR exposures subject to supervisory approval, which requires certain model validations and operational standards. This applies to banks that do not qualify to estimate the EPE associated with OTC derivatives but would like to adopt a more risk-sensitive method than the current exposure method (CEM). The standardized method (SM) is designed both to capture some certain key features of the internal model method for CCR and to provide a simple and workable supervisory algorithm with simplifying assumptions. Risk positions in the SM are derived with reference to short-term changes in valuation parameters (e.g., durations and deltas), and assumed open positions remain over the forecasting horizon. This implies that the risk-reducing effect of margining is not recognized, and there is no recognition of diversification effects. In the SM, the exposure amount is defined as the product of two fac- tors: (1) the larger of the net current market value or “supervisory EPE” times, and (2) a scaling factor termed beta. The first factor captures two key features of the internal model method (IMM) not mirrored in CEM with respect to netting sets that are deep in the money: The EPE is almost entirely determined by the current market value at the money (current market value is not relevant), and CCR is driven only by potential changes in values of transactions. By summing the current and add-on exposures, CEM assumes that the netting set is simultaneously at and deep in the money. The CEM derives replacement cost i


### Research block 50

concern is relevant for netting sets that are narrowly focused on certain risk areas (e.g., interest swaps that are mostly denominated in the same currency). Unless the netting set is very deep in the money, the effective EPE will exceed both the net current market value and the “supervisory EPE,” as the latter is calibrated to transactions that are at the money. Supervisory EPE does not allow for basis risk, and price risk is reflected only by deltas, so beta is set considerably higher than alpha. However, some allowance is made for nonrecognition of diversification, which tends to make the first factor larger than effective EPE. The recognition of hedging within netting sets is another key conceptual difference between the SM and IMM in comparison to the CEM. In CEM, the size of the netting effect depends not on hedging but on the portion of the transactions that is in the money: If none is out of the money, that implies no netting is recognized. For example, consider two at-the-market (ATM) and exactly identical but offsetting transactions with the same party subject to netting. Under the CEM there is positive exposure, whereas under either the SM or the IMM there is zero exposure. In general, the recognition of netting increases with the extent to which out-of-the-money transactions are present within a netting set. Under the SM, supervisory EPE is determined by mapping to risk positions that represent certain key drivers of potential change in value, following a technique commonly employed in market risk modeling (e.g., delta/gamma hedging). Risk positions of the same 


### Extended analytical note 1

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.

### Extended analytical note 2

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.

### Extended analytical note 3

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.

### Extended analytical note 4

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.

### Extended analytical note 5

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.

### Extended analytical note 6

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.

### Extended analytical note 7

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.

### Extended analytical note 8

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.

### Extended analytical note 9

From a quantitative investor’s perspective, encode the chapter’s primary identity as a monitored metric with explicit owner: data feed, calculation engine, validation test, and escalation path. Stress the metric under historical crises (1987, 1994, 1998, 2008, 2020, 2022) and under hypothetical parallel and twist shocks. Compare analytical durations/Greeks to empirical regressions on overlapping windows. Require that hedge ratios be re-estimated when residual variance exceeds a threshold. Keep a decision log for discretionary overrides so that systematic processes remain auditable. Align reporting currency, day-count, and compounding conventions with the instrument’s market standard to avoid false P&L. Review limit utilization weekly at the risk committee with transfer-coefficient or capacity diagnostics where active risk is taken.


## Additional Source Blocks from Galariotis–Zopounidis Extract


### QFRM source 1

No part of this publication may be reproduced, stored in a retrieval system, or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, scanning, or otherwise, except as permitted under Section 107 or 108 of the 1976 United States Copyright Act, without either the prior written permission of the Publisher, or authorization through payment of the appropriate per-copy fee to the Copyright Clearance Center, Inc., 222 Rosewood Drive, Danvers, MA 01923, (978) 750-8400, fax (978) 646-8600, or on the Web at www.copyright.com. Requests to the Publisher for permission should be addressed to the Permissions Department, John Wiley & Sons, Inc., 111 River Street, Hoboken, NJ 07030, (201) 748-6011, fax (201) 748-6008, or online at http://www.wiley.com/go/permissions.


### QFRM source 2

Limit of Liability/Disclaimer of Warranty: While the publisher and author have used their best efforts in preparing this book, they make no representations or warranties with respect to the accuracy or completeness of the contents of this book and specifically disclaim any implied warranties of merchantability or fitness for a particular purpose. No warranty may be created or extended by sales representatives or written sales materials. The advice and strategies contained herein may not be suitable for your situation. You should consult with a professional where appropriate. Neither the publisher nor author shall be liable for any loss of profit or any other commercial damages, including but not limited to special, incidental, consequential, or other damages.


### QFRM source 3

Iain Clacher, Mark Freeman, David Hillier, Malcolm Kemp and Qi Zhang A Brief Look at Markov Regime Switching in Academic Economics and Finance 74 Regime Switching and Interest Rate Processes 75 Regime Switching and Exchange Rates 76 Regime Switching, Stock Returns, and Asset Allocation 77 Single-Asset Markov Models 79 Two-State Estimation 82 Three-State Estimation 84 Markov Models for Multiple Assets 85 Practical Application of Regime Switching Models for Investment Purposes 87 Intuitive Appeal of Such Models 87 Implementation Challenges 89 Selecting the “Right" Model Structure 89 Calibrating the Selected Model Type to Suitable Data 90 Drawing the Right Conclusions from the Model 93 References 95


### QFRM source 4

T he book Quantitative Financial Risk Management: Theory and Practice provides an invaluable forum for creative and scholarly work on financial risk management, risk models, portfolio management, credit risk modeling, portfolio management, and financial markets throughout the world. Quantitative financial risk management consists of economics, account- ing, statistics, econometrics, mathematics, stochastic processes, and computer science and technology. The tools of financial management are more frequently being applied to manage, monitor, and measure risk, espe- cially in the context of globalization, market volatility, and economic crisis. The main objectives of this book are to advance knowledge related to risk management and portfolio optimization, as well as to generate theoretical knowledge with the aim of promoting research within various sectors wherein financial markets operate. Chapters will relate to one of these areas, will have a theoretical and/or empirical problem orientation, and will demonstrate innovation in theoretical and empirical analyses, methodologies, and applications. We would like to thank the assistant editors Georgios Manthoulis and Stavroula Sarri for their invaluable help. We extend appreciation to the authors and referees of these chapters, and to the editors at John Wiley & Sons, Inc., for their assistance in producing this book. The editors, Constantin Zopounidis Emilios Galariotis


### QFRM source 5

Constantin Zopounidis is professor of Financial Engineering and Opera- tions Research at Technical University of Crete in Greece, distinguished research professor at Audencia Nantes, School of Management (EQUIS, AMBA, AACSB) in France, senior academician of the Royal Academy of Doctors and the Royal Academy of Economics and Financial Sciences of Spain, and elected president of the Financial Engineering and Banking Society (FEBS). His research interests include financial engineering, financial risk man- agement, and multiple-criteria decision making. He has edited and authored more than 70 books in international publishers and more than 450 research papers in scientific journals, edited volumes, conference proceedings, and encyclopedias in the areas of finance, accounting, operations research, and management science. Prof. Zopounidis is editor-in-chief and member of the editorial board of several international journals. In recognition of his scientific work, he has received several awards from international research societies. Emilios Galariotis is professor of Finance at Audencia Nantes School of Management (AMBA, EQUIS, AACSB) in France. He is the founder and director of the Centre for Financial and Risk Management (CFRM) and head of research in the area of Finance, Risk, and Accounting Performance at Audencia. His academic career started at Durham University and head of research in the area of Finance, Risk, and Accounting Performance as well as co-chair of the department o


### QFRM source 6

T he global financial crisis of 2007–2008, often considered as the worst financial crisis since the Great Depression of the 1930s, resulted in a change of paradigms in the financial and banking sector. These crisis years saw collapses of large financial institutions, bailouts of banks by govern- ments, and declines of stock markets. Triggered by the U.S. housing bubble, which itself was caused by giving easy access to loans for subprime bor- rowers, financial distress spread over the banking sector and led to failure of key businesses and to the 2008–2012 global recession. Finally, this also contributed to the European sovereign-debt crisis, with lots of aftereffects in our present times. 3


### QFRM source 7

Uncertainties about bank solvency, declines in credit availability, and reduced investor confidence had an impact on global stock markets. Governments responded with fiscal measures and institutional bailouts, which in the long term resulted in extreme public debts and necessary tax increases. This negative experience demonstrates that the economy as a whole, but especially the financial sector is subject to risks, which are grounded in the interdependencies between the different economic actors and not in the performance of individual actors. This type of risk is generally called systemic risk. While aspects of systemic risk (e.g., bank run and contagion) were always an issue in discussions about the financial system, the recent crises have increased the interest in the topic, not only in academic circles, but also among regulators and central banks.


### QFRM source 8

If one aims at measuring—and in a further step managing and mitigating— systemic risk, it is important to start with a definition. However, despite the consent that systemic risk is an important topic, which is reflected by an increasing number of related papers and technical reports, there is still not a single generally accepted definition. As a first step, one should distinguish between systemic and systematic risk. Systematic risks are aggregate (macroeconomic) risks that cannot be reduced by hedging and diversification. Systemic risk, on the other hand, is a different notion. It refers to the risk of breakdown or at least major dys- function of financial markets. The Group of Ten (2001) gave the following, often cited definition:


### QFRM source 9

Systemic financial risk is the risk that an event will trigger a loss of eco- nomic value or confidence in, and attendant increases in uncertainly about, a substantial portion of the financial system that is serious enough to quite probably have significant adverse effects on the real economy. Systemic risk events can be sudden and unexpected, or the likelihood of their occurrence can build up through time in the absence of appropriate policy responses. The adverse real economic effects from systemic problems are generally seen as arising from disruptions to the payment system, to credit flows, and from the destruction of asset values.


### QFRM source 10

A similar definition can be found in Acharya et al. 2009. Given the described diversity of definitions, which are similar but also different with respect to their focus, it is hard to develop universally accepted measures for systemic risk. Different definitions refer to different important nuances of systemic risk, which means that on the operational level a robust framework for monitoring and managing systemic risk should involve a vari- ety of risk measures related to these different aspects. See Hansen (2012) for a deeper discussion of the basic difficulties in defining and identifying systemic risk. We will focus on the first part of the definition by Kaufmann and Scott (2003), which summarizes the most important aspect of systematic risk in financial systems, without addressing more general economic aspects. Such an approach could be seen as “systemic risk in the narrow sense” and we state it (slightly modified) as follows: Systemic risk is the risk of breakdowns in an entire system, as opposed to breakdowns in individual parts or components. Three issues have to be substantiated, if one wants to apply such a defi- nition in concrete situations: system, breakdowns, and risk.


### QFRM source 11

In financial applications, the focus lies on parts of the financial system (like the banking system, insurance, hedge funds) or the financial system as a whole. Any analysis has to start with describing the agents (e.g., banks in the banking system) within the analyzed system. This involves their assets and liabilities and the main risk factors related to profit and loss. For a systemic view, it is important that the agents are not isolated enti- ties at all. Systematic risk can be modeled by joint risk factors, influencing all profit and losses. Systemic risk in financial systems usually comes by mutual debt between the entities and the related leverage.


### QFRM source 12

Risk is the danger that unwanted events (here, breakdowns) may happen or that developments go in an unintended direction. Quantifiable risk is described by distributions arising from risk. For financial systems this may involve the probability of breakdowns or the distribution of payments nec- essary to bring back asset values to an acceptable level. Risk measures sum- marize favorable or unfavorable properties of such distributions. It should be mentioned that such an approach assumes that a good distri- butional model for the relevant risk factors can be formulated and estimated. During this chapter, we will stick to exactly this assumption. However, it is clear that in practice it is often difficult to come up with good models, and data availability might be severely restricted. Additional risk (model risk) is related to the quality of the used models and estimations; see Hansen (2012) for a deeper discussion of this point.


### QFRM source 13

contractual obligations (liabilities). Simple models such as Merton (2009) start by modeling a single firm in the framework of the Black–Scholes option pricing model, whereas more complex models extend the framework to mul- tivariate formulations, usually based on correlations between the individual asset values. A famous example is Vasicek’s asymptotic single factor model (see Vasicek 1987; 1991; and 2002), which is very stylized but leads to a closed-form solution. In most structural default models, it is not possible to calculate the port- folio loss explicitly; hence, Monte Carlo simulation is an important tool for default calculations. Even then, the models usually make simplifying assumptions. Consider a system consisting of k economic entities (e.g., banks), and let A1(t), A2(t), … , Ak(t) denote the asset processes—that is, the asset values at time t for the individual entities. Furthermore, for each entity i a limit Di, the distress barrier, defines default in the following sense: default occurs if the asset value of entity i falls below the distress barrier:


### QFRM source 14

denote the distance to default of the individual entities. Note that alter- natively the distance to default can also be defined in terms of Xi(t) as a percentage of asset value, divided by the asset volatility (see e.g., Crosbie and Bohn 2003). In a one period setup—as used throughout this chapter—one is interested at values Ai(T), Xi(T) at time T, the end of the planning horizon. Analyzing systemic risk then means analyzing the joint distri- bution of the distances to default Xi(t), in particular their negative parts Xi(T)− = max {−Xi(T), 0}, and the underlying random risk factors are described by the joint distribution of asset values Ai(T). Many approaches for modeling the asset values exist in literature. In a classical finance setup, one would use correlated geometric Brownian motions resulting in correlated log-normal distributions for the asset values at the end of the planning horizon. Segoviano Basurto proposes a Bayesian approach (Segoviano Basurto 2006); for applications, see also Jin and Nadal de Simone (2013). In this chapter, we will use copula-based models, as discussed later.


### QFRM source 15

The second component of the approach, the distress barrier, is in the sim- plest case (Merton 2009), modeled just by the face value of overall debt for each entity. Other approaches distinguish between short-term and long-term debt (longer than the planning horizon). Usually, this is done by adding some reasonable fraction of long-term debt to the full amount of short term debt; see, for example, Servigny and Renault (2007). Still, such classical credit default models (see, e.g., Guerra et al. 2013), although classified as systemic risk models, neglect an important aspect: Economic entities like banks are mutually indebted, and each amount of debt is shown as a liability for one entity but also as an asset for another entity. Default of one entity (a reduction in liabilities) may trigger subse- quent defaults of other entities by reducing their asset values. We call such models systemic models in the strict sense. Such approaches with mutual debt have been proposed, such as in Chan-Lau et al. (2009a; 2009b). Models neglecting this aspect are systemic models in a broad sense; in fact, they are restricted to the effects of systematic risk related to asset values. The basic setup of systemic models in the strict sense can be described as follows: Let H0 ij denote the amount of debt between entities i and j —that is, the amount of money borrowed by entity i from entity j. We also include debt to the nonbank sector, denoted by Hi for each entity i and credit Ci to the nonbanking s


### QFRM source 16

The distances to default, derived from structural models, in particular from systemic models in the strict sense, can be used to measure systemic risk. In principle, the joint distribution of distances to default for all involved entities contains (together with the definition of distress barriers) all the rel- evant information. We assume that the joint distribution is continuous and let p(x)= p(x1, x2, … , xk) denote the joint density of the distances to default X1(T), X2(T), … , Xk(T) for all entities. Note that the risk measures discussed in the following are often defined in terms of asset value, which is fully appropriate for systemic models in the broader sense. In view of the previous discussion of systemic models in the strict sense, we instead prefer to use the distances to default or loss variables derived from the distance to default. The first group of risk measures is based directly on unconditional and conditional default probabilities. See Guerra et al. (2013) for an overview of such measures. The simplest approach considers the individual distress probabilities


### QFRM source 17

(1.12) where the set I contains the elements i1, i2, … , ikI . Of special interest are the default probabilities of pairs of entities (see, e.g., Guerra, et al., 2013). Joint probabilities of distress describe tail risk within the chosen set I.If I represents the whole system (i.e., it contains all the entities), then the joint probability of distress can be considered as a tail risk measure for systemic risk (see, e.g., Segoviano & Goodhart, 2009). Closely related are conditional probabilities of distress, that is, the prob- ability that entity j is in distress, given that entity j is in distress, which can be written as P D j|i = P(Xj(T) < 0|Xi(T) < 0)= PD {i,j} PD i . (1.13)


### QFRM source 18

These conditional probabilities can be presented by a matrix with PD j|i as its ijth matrix element, the distress dependency matrix. While conditional distress probabilities contain important information, it should be noted that they only reflect the two-dimensional marginal distri- butions. Conditional probabilities are often used for analyzing the interlink- age of the system and the likelihood of contagion. However, such arguments should not be carried to extremes. Finally, conditional probabilities do not contain any information about causality. Another systemic measure related to probabilities is the probability of at least one distressed entity; see Segoviano and Goodhart (2009) for an application to a small system of four entities. It can be calculated as


### QFRM source 19

That is, the conditional value at risk at level 𝛼 is compared to the condi- tional value at risk at the median level. From all the ΔCoVaR𝛼 =(j | i) values, it is possible to construct another kind of dependency matrix. This idea can also be applied to the system as a whole: If Xj(T) is replaced by X(T)= ∑k i=1 Xi(T), the distance to default of the whole system, (1.16) to (1.18), leads to a quantity ΔCoVaR𝛼 =(j | i) that measures the impact of entity i on the system. In this way one is able to analyze notions like “too big to fail” or “too interconnected to fail.” In contrast to probability-based measures, CoVaR emphasizes the role of potential monetary losses. This approach can be carried forward, leading to the idea that systemic risk should be related to the losses arising from


### QFRM source 20

Ltot covers all credit losses in the whole system, both from interbank credits and from credits to the public. From the viewpoint of a state, this notion of total loss may be seen as too extensive. One may argue that only losses guaranteed by the state are really relevant. Definition (1.19) therefore depicts a situation in which a state guarantees all debt in the system, which can be considered as unrealistic. However, in most developed countries, the state guarantees saving deposits to a high extend, and anyhow society as a whole will have to bear the con- sequences of lost debt from outside the banking system. Therefore, a further notion of loss is given by L sav = k∑


### QFRM source 21

which describes the amount of lost nonbanking debt For the structural model, which has been described in the previous section, loss given default can be calculated using (1.8) and (1.9). In general, the notion of loss depends on the exact viewpoint (loss to whom). We will therefore use the symbol L to represent any kind of loss variable in the following discussion of systemic risk measures. An obvious measure is expected loss—that is, the (discounted) expec- tation of the risk variable L. For simple structural models like (1.2), this measure can be calculated from the marginal distribution of asset values, respectively, of distances to default. Modeling the joint distributions is not necessary. Note that this is different for the strict systemic model (1.9). The expectation can be calculated with respect to an observed (esti- mated) model, or with respect to a risk-neutral (martingale) model. Using observed probabilities may account insufficiently for risk, which contradicts the aim of systemic risk measurement. Using risk-neutral valuation seems reasonable from a finance point of view and has been used, for example, in Gray and Jobst (2010) or Gray et al. (2010). However, it should be kept in mind that the usual assumptions underlying contingent claims analysis—in particular, that the acting investor is a price taker—are not valid if the investor has to hedge the whole financial system, which clearly would be the case when hedging the losses related to systemic risk.


### QFRM source 22

Typical choices of 𝜌 are dispersion measures like the variance or the standard deviation. Such measures are examples of classical premium cal- culation principles in insurance. Further, more general premium calculation principles are for example, the distortion principle or the Esscher premium principle. For an overview on insurance pricing, see Furmann and Zitikis (2008). In the context of systemic risk, the idea to use insurance premiums was proposed in Huang et al. (2009). In this chapter, empirical methods were used for extracting an insurance premium from high-frequency credit default swap data. Even more generally, it should be noted that any monetary risk measure—in particular, coherent measures of risk—can be applied to the overall loss in a system. See Kovacevic and Pflug (2014) for an overview and references. In this broad framework, an important class of risk measures is given by the quantiles of the loss variable L:


### QFRM source 23

With probability 𝛼, the loss will not be higher than the related quantile. Quantiles are closely related to the value at risk (VaR), which measures quantiles for the deviation of the loss from the expected loss. Note the slight difference between (1.22) and (1.17), because (1.17) is stated in terms of distance to default and (1.12) in terms of loss. Q𝛼(L) can also be interpreted in an economic way, as follows. Assume that a fund is built up in order to cover systemic losses in the banking sys- tem. If we ask how large the fund should be, such that it is not exhausted, with probability 𝛼 over the planning period, then the answer will be QL(𝛼). This idea can also be reversed. Assume now that a fund of size q has been accumulated to deal with systemic losses. Then the probability that the fund is not exhausted, FL(q)= P(L ≤ q), (1.23)


### QFRM source 24

The distinction between risk factors that are related to individual perfor- mances and risk factors that are a consequence of the interrelations of the economic agents has its parallel in a similar distinction for probability dis- tributions or stochastic processes: Suppose that X1(t), … , Xk(t) describe the performance processes of k economic agents. The individual (marginal) processes are assumed to follow certain stochastic models as discrete Markov processes, diffusion models, or jump-diffusion models. The joint distribution, however, depends on the copula process, which links the marginal processes. To simplify, suppose only a single-period model is considered and that the performance after one period is X1, … , Xk. If this vector has marginal cumulative distribution functions F1, … , Fk (meaning that P(Xi ≤ u)= Fi(u)), then the joint distribution of the whole vector can be represented by


### QFRM source 25

Example 2. Consider a system of seven banks, where the performances Xi, i = 1, … , 7 are related by a normal copula stemming from a correlation matrix with all off-diagonal elements 𝜌 (the diagonal elements are 1). Sup- pose that the first bank defaults if its performance drops below the 5 percent quantile. Given the copula, one may determine the number of other banks that also fall below the 5 percent quantile (i.e., default as a consequence of the first bank’s default). Figures 1.1 and 1.2 show the distribution of these numbers for the choice of 𝜌 = 0,𝜌 = 0.2,𝜌 = 0.5 and 𝜌 = 0.8. One may observe that in the independent case (𝜌 = 0) the other banks are practically not affected by the default of one bank, while for higher correlated cases a contagion effect to other banks can be easily seen. A very interdependent banking system carries a high systemic risk. It has therefore been proposed to limit the dependencies by creating quite indepen- dent subsystems. Example 3 gives evidence for this argument.


### QFRM source 26

Example 3. Here, we consider seven banks, each of which has a perfor- mance given by a negative gamma distribution with mean 100 and variance 200, but shifted such that with probability 5 percent a negative performance happens, which means bankruptcy. The total losses of the system are cal- culated on the basis of a normal copula linking the individual losses. By assuming that the government (or the taxpayer) takes responsibility for cov- ering total losses up to the 99 percent quantile, this quantile (the 99 percent VaR) can be seen as a quantization of the systemic risk. In Figures 1.3 to 1.6, we show in the upper half a visualization of the correlations (which determine the normal copula) by the thickness of the arcs connecting the seven nodes representing the banks. The lower half shows


### QFRM source 27

Systemic financial risk is an important issue in view of the distress the bank- ing systems all over the world have experienced in the recent years of crises. Even if breakdowns are prevented by the government, the related societal costs are extremely high. We described the measurement of systemic risk, based on the struc- tural approach originating from structural credit risk models. In particular, the cascading effects that are caused by mutual debt between the individ- ual banks in the system were analyzed in detail. Furthermore, we related the notion of systemic risk to the copula structure, modeling dependency between the performances of the individual banks. The effects of different levels of dependency on the total systemic risk in terms of the value at risk of total losses were demonstrated by examples.


### QFRM source 28

Acharya, V., L. Pedersen, T. Phillipon, and M. Richardson. 2009. Regulating systemic risk. In Restoring Financial Stability: How to Repair a Failed System. Hoboken, NJ: John Wiley and Sons. Adrian, T., and M. K. Brunnermeier. 2009. CoVar. In: Staff Report 348: Federal Reserve Bank of New York. Chan-Lau, J., J. M. Espinosa-Vega, and J. Sole. 2009a. On the use of network analysis to assess systemic financial linkages. Washington, D.C.: International Monetary Fund, IMF. Chan-Lau, J., M. A. Espinosa-Vega, K. Giesecke, and J. Sole. 2009b. A. Assessing the systemic implications of financial linkages. In: Global Financial Stability Report. Washington, D.C.: International Monetary Fund, IMF. Cont, R., A. Moussa, and E.e.S. Bastos. 2010. Network structure and sys- temic risk in banking systems, s.l.: Preprint, electronic copy available at http://ssrn.com/abstract=1733528. Crosbie, P. and J. Bohn. 2003. Modeling default risk: Moody’s KMV. European Central Bank. 2004. Annual Report, Frankfurt, available at http://www .ecb.europa.eu/pub/pdf/annrep/ar2004en.pdf. Furmann, E., and R. Zitikis. 2008. Weighted premium calculation principles. Insur- ance, Mathematics and Economics, 459–465.


### QFRM source 29

Girardi, G., and T. Ergün. 2012. Systemic risk measurement: Multivariate GARCH estimation of CoVaR. available at http://papers.ssrn.com/sol3/papers.cfm? abstract_id=1783958. Gray, D. F., A. A. Jobst, and S. W. Malone. 2010. Quantifying systemic risk and reconceptualizing the role of finance for economic growth. Journal of Investment Management 8(2). Gray, D., and A. A. Jobst. 2010. New directions in financial sector and sovereign risk management. Journal of Investment Management 8(1). Group of Ten. 2001. The G10 Report on Consolidation in the Financial Sector, Chap. 3, http://www.imf.org/external/np/g10/2001/01/Eng/pdf/file3.pdf Guerra, S. M., B. M. Tabak, R. A. Penaloza, and R. C. de Castro. 2013. Systemic Risk Measures. Working paper 321, Banco do Brasil, http://www.bcb.gov.br/pec /wps/ingl/wps321.pdf [Online]. Hansen, L. P. 2012. Challenges in identifying and measuring systemic risk, s.l.: National Bureau of Economic Research. Huang, X., H. Zhou, and H. Zhu. 2009. A framework for assessing the systemic risk of major financial institutions. Journal of Banking and Finance 33: 2036–2049. Jin, X., and F. Nadal de Simone. 2013. Banking Systemic Vulnerabilities: A Tail-Risk Dynamic CIMDO Approach. Banque centrale de Luxembourg. Kaufmann, G. G., and K. E. Scott. 2003. What is systemic risk, and do bank regula- tors retard or contribute to it? Independent Review 7: 371–391. Kovacevic, R., and G. Ch. Pflug. 2014. Measuring and Managing Risk. Chapter 2 In: Investment Risk Management


### QFRM source 30

A bank’s counterparty credit risk (CCR) exposure quantifies how much money the counterparty might owe the bank in the event of default. The CCR quantity is broken down into current exposure (CE), which measures the exposure if the counterparty were to default today, and potential exposure (PE), which measures the potential increase in exposure that could occur between today and some time horizon in the future. The time of default is typically modeled as a stochastic stopping time. As opposed to the known CE, the PE must be estimated, usually by simulation. First, the expected positive exposure (EPE) is computed by simulating a large number (on the order of 102 to 103) of different paths for the various under- lying future prices in the possible market environments, using a so-called regularized variance-covariance matrix. Then the system prices each of the derivative transactions on each path for each sample date,2 computes collat- eral call amounts based on relevant marked-to-market (MTM) calculations,


### QFRM source 31

applies the portfolio effects of netting and collateral, and aggregates expo- sure results to compute the average exposure along a term structure. While an EPE may be a good indicator of the cost to replace a contract should the counterparty default, EPE is not helpful in the trade inception approval process because of its volatility and the need for a high confidence interval. Therefore, many banks will also report a very high percentile (e.g., 97.7th or 97.5th) of the exposure distribution over a large number of paths. Note that these peaks in exposure profiles are not simply added over different products for a given counterparty, as these peaks may happen at different points in time. Rather, the time profiles of exposures are summed over products traded with a single counterparty, and the peak of that time profile is the summary PE measure. This methodology is conservative, as PEs are simply added over counterparties, while the bank may enter trades that mitigate each other in terms of PE with different counterparties. We can readily see that CCR measurement necessarily combines the tools of standard market risk measurement with the tools of standard credit risk determination, a unique challenge to both. This frequently requires calculating probability-of-default (PD), loss-given-default (LGD), exposure-at-default (EAD), and a credit rating of the counterparty.3


### QFRM source 32

The credit valuation adjustment (CVA) is defined as the product of the EPE times the LGD times the cumulative mortality rate (CMR), where the CMR is simply a multi-period PD rate. This is structurally equivalent to pric- ing EPE as the contingent leg of a credit default swap (CDS) by applying the counterparty spread to it. Such a spread is either a market quote if the name has a bespoke traded CDS, or a pseudo-CDS spread computed along a grid arrayed by region, industry, rating, and tenor. In the worst case, bond or loan spreads are used, giving rise to basis risk. It can be recognized that it is this part of the process that joins the market and the credit risk aspects of the algorithm. Practices for measuring market risk are used in mapping deriva- tives exposures to a set of market risk factors (e.g., spreads, volatilities, or correlations), simulating those factors out to a forward-looking time hori- zon, and determining the distribution of the level of exposures over various realizations of these risk factors in the simulation. Separately, standard credit risk processes provide assessments of the credit quality of the counterparty, such as PD and LGD estimation. Direct or originating businesses (i.e., trading desks) are viewed as credit portfolios: As their positions get in the money, this gives rise to CCR, since


### QFRM source 33

the counterparty may default while owing money to the bank. The CVA represents a daily MTM transfer price of default risk charged to the origi- nating business for insuring default risk, which is the price of a pseudo-CDS hedge with the EPE as underlying notional. The group (e.g., the market risk management department) that sells insurance to the business at inception of the trade will cover any loss due to counterparty default. As the exposure rises, due to either an increase in the position or a decrease in the credit qual- ity of the counterparty, the CVA increases as it is marked to market. On the other hand, a profit is reported if the CVA decreases, due either to the bank’s position becoming less in the money, an improvement in the counterparty’s credit rating, or just the passage of time without any credit event. However, no further credit-related charges or costs are incurred by the business. In the limit, the CVA disappears as the maturity of the derivative contract is reached, and payment—if any is due—is made to the bank. Products that are new or too complex to be properly simulated within the main CCR engine are dealt with “offline.” This usually means assigning them “risk factors” or more generally “add-ons” that are conservative and do not allow for netting; for this reason, such offline trades may account for up to 50 percent of the total exposure, although only 5 to 10 percent of trades made. The problem is that the counterparty credit exposure (CCE) is not se


### QFRM source 34

Analogous to the CVA, scenarios for underlying market factors are gen- erated and averaged over the resultant negative portfolio marked-to-market values (liabilities), taking into account legal netting and collateral agree- ments. The resulting expected negative exposure, floored at zero if a bank gets in the money in any given scenario, is what risk managers expect to owe its counterparties on its derivative portfolio at the time of its default. It is priced as the contingent leg of a credit default swap using the bank’s bank spreads, assuming that all deals are netted where possible, reflecting the fact that within the bank’s jurisdiction it is likely that its counterparties would legally seek to net all positions upon its default. For collateral considerations, often two types of default are considered. First, consider the case in which a bank defaults idiosyncratically, and a “springing” unilateral collateral agreement is assumed. This reflects the likely behavior of counterparties, who upon a worsening of a bank’s credit worthiness will either demand to enter into unilateral collateral agreements where there are none or renegotiate existing collateral agreements to terms favorable to them. Second, there is the case of a systemic default, where a bank’s default is part of a broad economic downturn. In this case it is much less clear that counterparties will be able to impose or change collateral agreements in their favor, and thus springing collateral is not considered. T


### QFRM source 35

Supervisory rules and guidance on CCR can be found in the Basel Committee on Banking Supervision (BCBS) frameworks of Basel I (BCBS, 1988); Basel II (BCBS, 2006); Basel III (BCBS, 2011); and BCSB (2012). The U.S. Office of the Comptroller of the Currency (OCC) and the Board of Governors of the Federal Reserve System (BOG-FRS) issued supervisory guidelines (OCC & BOG-FRS 2011). Kang and Kim (2005) provide simple closed-form pric- ing models for floating-rate notes and vulnerable options under the CCR framework, deriving closed-form pricing models for them and illustrating the impact of the counterparty default intensity on the prices of floating-rate notes and vulnerable options. Brigo and Chourdakis (2009) consider CCR for credit default swaps when default of the counterparty is correlated with default of the CDS reference credit. They incorporate credit spread volatility, adopt stochastic

