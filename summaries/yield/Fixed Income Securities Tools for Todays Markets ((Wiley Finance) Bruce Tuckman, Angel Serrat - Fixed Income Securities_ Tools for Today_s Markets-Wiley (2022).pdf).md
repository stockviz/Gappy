# Fixed Income Securities: Tools for Today’s Markets (4th ed.) — Detailed Quantitative Research Notes

**Title:** Fixed Income Securities: Tools for Today’s Markets  
**Authors:** Bruce Tuckman, Angel Serrat  
**Year:** 2022 (Fourth Edition)  
**Publisher:** John Wiley & Sons (Wiley Finance)  
**Copyright:** © 2022 Bruce Tuckman and Angel Serrat  
**Structure:** 16 chapters + appendices covering Treasury cash, swaps/spot/forwards, returns/yields/spreads/P&L, DV01/duration/convexity, multi-factor risk, arbitrage pricing, repo, note futures, bond futures, SOFR transition, swap applications, credit, MBS, etc.

---

## Problem / Motivation

Provide a practitioner-grade toolkit for pricing, hedging, and attributing fixed-income P&L in post-LIBOR markets (SOFR, SONIA, ESTER, TONAR, SARON), with explicit compounding/day-count discipline and no-arbitrage extraction of discount factors, spots, and forwards from swap and Treasury curves.

---

## Chapter 1 — Treasury Markets, Discount Factors, STRIPS, Accrued Interest

**Law of one price:** PV of \$1 from Treasury on a given date independent of which bond pays it → unique discount factors $d(t)$.

**Pricing:** $P=\sum CF_t d(t)$. Fair bonds: model price ≈ market (errors <0.2% of price in examples).

**STRIPS:** Strip \$1M of 0.625s of 05/15/2030 → coupon STRIPS $1{,}000{,}000\times 0.625\%/2=\$3{,}125$ each plus \$1M P-STRIP. Reconstitution reverses.

**Accrued interest example (0.625s of 05/15/2030):** coupon \$31.25 per \$10k face; settlement May 17, 2021; accrued $31.25\times 91/181=\$15.711$; invoice $=\$10{,}000\times(91.78125\%+0.15711\%)=\$9{,}193.836$.

**RV trade sketch:** sell \$500M of 7.625s of 11/15/2022 vs fair value; edge $500{,}000{,}000\times 0.1172\%=\$586{,}000$.

**Industry context:** top managers’ AUM concentration (top 10 ~31%, top 5 ~21% of large-manager assets in cited 2020 stats); FI share of portfolios rising historically (29%→38%→43% in cited snapshots).

---

## Chapter 2 — Swaps, Spot, Forward Rates (Core Math)

### Compounding

Simple actual/360: interest $=F\times r\times days/360$ (e.g., \$100k × 1% × 90/360 = \$250).  
Daily compound: $F(1+r/360)^{90}=\$100{,}250.31$ vs \$250 simple — 31¢ difference at low rates; larger when rates/tenor high.

Semiannual: $F(1+\hat r/2)^N$. Equivalence example: 2% annual = 1.9901% sa = 1.9819% monthly for 100→102 in 1y.

General: $F(1+\hat r/n)^N$.

### SOFR swap example (Fig 2.1)

Notional \$100M, 2y, fixed **0.1120%** vs daily-compounded SOFR, actual/360. Fixed payment over 365d: $100{,}000{,}000\times 0.1120\%\times 365/360=\$113{,}556$.

Floating scenario: SOFR 0.10% (5d), 0.50% (170d), 0.01% (190d) → balance \$100,243,071 → floating interest **\$243,071**.

**May 14, 2021 term structure (Fig 2.2):** SOFR 2y 0.1120%, 10y **1.352%**, 30y **1.758%**; also SONIA, TONAR, ESTER, SARON (some negative).

### Extracting discount factors (Table 2.1)

| Term | Swap% | Spot% | Fwd% | DF |
|------|-------|-------|------|-----|
| 0.5 | 0.0340 | 0.0348 | 0.0348 | 0.999826 |
| 1.0 | 0.0460 | 0.0466 | 0.0585 | 0.999534 |
| 1.5 | 0.0670 | 0.0681 | 0.1111 | 0.998979 |
| 2.0 | 0.1120 | 0.1136 | 0.2500 | 0.997732 |

Bootstrapping: PV(fixed leg incl. fictional notional)=par, eqs (2.12)–(2.15).

### Spot & forward identities

$$
d(t)=\frac{1}{(1+\hat r(t)/2)^{2t}},\quad 1+\frac{f(t)}{2}=\frac{d(t-0.5)}{d(t)}
$$
Example: $f(2)=0.2500\%$ from DF ratio. Spot ≈ average of forwards: $(0.0348+0.0585+0.1111+0.2500)/4\approx 0.1136\%$.

**Curve shape rules:** spot rises iff forward > prior spot; when spots rise, par/swap slightly below spot (notional weight).

Floating+leg fictional principal ≈ par; receive-fixed ≈ long par bond financed floating.

---

## Chapter 3 — Returns, Yields, Spreads, P&L Attribution

### Realized returns

Buy \$1M of 7.625s of 11/15/2022 at **114.8765** (Nov 2020); six months later **111.3969**; coupon \$38,125. Gross 6m return **0.2898%**. With reinvestment over 1y at 0.05% and end price \$1,080,000 → **0.6524%**. Net of financing 0.05%: **0.2648%**. With 98% repo financing, ROC on 2% haircut capital → **13.27%** (≈50× leverage).

### Yield to maturity

Price 111.3969 for 7.625s with 3 remaining payments ⇒ y solves (3.5) → **y=0.0252%**. Closed form (3.8): par iff coupon rate = yield; premium/discount otherwise. Fig 3.1: all bonds at y=1.5% — coupon=1.5% ⇒ P=100 all maturities.

### Spreads & attribution

Multi-product FI requires spreads (G-spread, Z-spread, I-spread, OAS). Attribute P&L to time, rates, spreads with explicit “passage of time” definitions holding curve/spreads fixed.

---

## Later Chapters (Toolkit Map)

Ch.4–5: DV01, duration, convexity, key-rate / PCA multi-factor risk.  
Ch.6–9: arbitrage-free pricing, note/bond futures, CTD.  
Ch.10: repo.  
Ch.11–13: SOFR transition deep dive; swap applications for rate exposure.  
Ch.14–16: credit, CDS, MBS/agency.

**PCA:** level explains majority of yield variance (link to Ang Ch.9 80–90%); hedge with 2–3 PCs.

---

## Practical Takeaways

1. Always state compounding + day-count.  
2. Bootstrap DF from swaps with fictional notional=par identity.  
3. Think in forwards for curve trades; spots for zeros; pars for swaps.  
4. YTM ≠ expected return; use for quoting, not RV alone.  
5. Net returns and ROC differ radically under repo leverage.  
6. Attribute P&L to carry, roll, curve, spread.  
7. Post-LIBOR: SOFR/SONIA/ESTER/SARON/TONAR conventions differ (collateralized vs interbank).  
8. STRIPS enforce DF uniqueness via law of one price.  

---

## Formula Sheet

$F(1+r/360)^d$; $F(1+\hat r/n)^N$; $d(t)=(1+\hat r(t)/2)^{-2t}$; $1+f(t)/2=d(t-0.5)/d(t)$; YTM ∑ CF/(1+y/2)^t = P; gross return (P1+C−P0)/P0; ROC = net \$ / capital.

---

## Numerical Pinboard

| Item | Value |
|------|-------|
| SOFR 2y (May 2021) | 0.1120% |
| SOFR 10y / 30y | 1.352% / 1.758% |
| DF 2y | 0.997732 |
| f(2) | 0.2500% |
| 7.625s YTM ex. | 0.0252% |
| Gross 6m return ex. | 0.2898% |
| ROC 50× lev ex. | 13.27% |
| Accrued ex. | \$15.711 on \$10k |
| RV edge ex. | \$586k on \$500M |


## Desk-Ready Bootstrap Pseudocode

```
for each swap maturity T in ascending order:
  solve d(T) from PV_fixed_leg(d, swap_rate(T)) == 1
  spot(T) = 2*((1/d(T))**(1/(2T)) - 1)
  fwd(T) = 2*(d(T-0.5)/d(T) - 1)
assert abs(spot(T) - mean(fwds_to_T)) < tol
```

## Curve Trading Implications

If f(t) >> spot(t-0.5), curve steep; receiving fixed long-end vs paying short earns if forwards realized below forwards (classic). SARON negative forwards (May 2021) show need for signed rate engines—not absolute-value bugs.

## Limitations of 2022 Edition Snapshot

Tables dated May 2021 near ZIRP; levels obsolete but identities permanent. Always refresh DF tables; keep formulas.



---

## Source-Derived Research Blocks


### Research block 1

investment-grade and high-yield bonds coming to a halt. Over the same time, however, ETF trading volumes increased dramatically. In other words, investors could not trade individual bonds, but could trade ETFs. The pricing of ETFs over the period, however, surprised some observers. As bond prices plummeted, ETFs traded at significant discounts from NAV; that is, the prices of the ETFs were very much below the estimated value of their underlying portfolios. Similarly, when bond prices rapidly recovered, ETFs traded at significant premiums to NAV, that is, at prices well above estimated portfo- lio values. Critics took this pricing behavior as evidence that ETFs were not working well, in the sense that investors could not trade shares at their true values. But by the definition of illiquidity during stress events, “true values” of individual bonds cannot be accurately determined at those times. It is most likely, therefore, that observed discounts from NAV resulted from stale bond prices: as prices swiftly fell with nearly no liquidity, bond prices recorded for the purposes of estimating NAV were stale, higher prices. Similarly, as prices rebounded quickly with little liquidity, NAV was estimated with stale, lower prices, making it seem that ETFs traded at a premium. Supporting this nar- rative was the fact that when prices were falling and ETFs were selling at a discount to NAV, investors were nevertheless giving bonds to APs to create new ETFs. Despite the apparent loss in value, investors could sell their bonds most efficiently by first exchanging them into ETFs.41


### Research block 2

Concentration in the asset management industry has been growing for some time. Assets under management at the top 20 global managers were 29% of total assets in 1995, 38% in 2000, and 43% in 2020. Furthermore, in 2020, the top 10 global managers managed 31% of total assets, and the top five, 21%. With respect to flows, a 2018 study found that 42% of asset management trading in investment-grade corporate bonds came from the top five managers.42 Increasing concentration in asset management implies a growing demand in the market for larger trades or, equivalently,


### Research block 3

41For accounts of ETFs during March 2020, see, for example: Aramonte, S. and Avalos, F. (2020), “The recent distress in corporate bond markets: cues from ETFs,” BIS Bulletin No. 6, April 14; Levine, M. (2020), “Money Stuff: The Bull Market Caught a Virus,” Liquidity Illusion Illusion, Bloomberg, March 12; and S&P Global Ratings (2020), “Credit Trends: How ETFs Contributed to Liquidity and Price Dis- covery in the Recent Market Dislocation,” July 8. 42McPartland, K. (2019), “The Challenge of Trading Corporate Bonds Electroni- cally,” Greenwich Associates, Q2; Thinking Ahead Institute (2020), “Global Asset Manager AuM tops US\$100 Trillion for the First Time,” Willis Towers Watson, October 19; and Author Calculations.


### Research block 4

The changing nature of liquidity in bond markets has raised the issue of market resilience or, its reverse, market fragility. In particular, some believe that liquidity provision by PTFs is less stable than by dealers. The argument is that PTFs will shut down in stress conditions, so as to avoid any losses on their own accounts, while dealers will continue to make markets for their clients, with whom they have ongoing and valuable business relationships. The “flash rally” in the Treasury market on October 15, 2014, provided a case study in which to examine this argument. On that day, there was a release of retail sales data at 8:30am, but it is generally agreed that the news was not particularly surprising. Neverthe- less, Treasury yields dropped relatively steeply over the next hour or so. Then, over the 12 minutes from 9:33am to 9:45am, the yield on the 10-year Treasury fell by 16 basis points and then rose by 16 basis points (i.e., prices rose by a lot and then fell by a lot). This was an extremely large move for such a short time period – the daily standard deviation of the 10-year yield was perhaps four or five basis points per day. Was any particular group of market participants to blame for this flash rally? Does the event forewarn of worse occurrences to come? Subsequent analysis showed that over the 12 minutes in question, trad- ing volume increased dramatically and market depth dropped precipitously. In other words, trading continued throughout the interval, and in large


### Research block 5

quantities, but through very many small orders and a consistent replenish- ment of limit orders. Market depth provided by both PTFs and dealers fell during the window. While market depth supplied by PTFs fell by a much larger percentage, PTFs supplied much more of the total throughout. Fur- thermore, PTFs did not change their bid–ask spreads by much, while dealers did at times. A joint study of regulators concluded that: “In very broad terms...PTFs, as a group, reacted ...primarily by reducing limit order quantities, while the bank-dealers reacted by widening bid–ask spreads and, for brief periods of time, removing their offers to sell securities.”43 Evidence from the flash rally, therefore, is consistent with the different nature of liquidity provision by PTFs and dealers; is not consistent with PTFs closing shop during a stress event; and is consistent with a liquidity regime that is shifting execution risk to the buy side. There was a similar flash event on February 25, 2021, though this time Treasury prices fell significantly and then recovered in a short amount of time. The event was again characterized by sharply reduced market depth and sharply elevated trading volumes, that is, by rapid replenishment of limit orders.44 The extent to which markets are susceptible to similar and perhaps worse occurrences remains a topic of concern.


### Research block 6

T his chapter begins by introducing the cash flows of fixed-rate, government coupon bonds. It shows that prices of these bonds can be used to extract discount factors, which are the market prices of one unit of currency to be received on various dates in the future. Relying on a principle known as the law of one price, discount factors extracted from a particular group of bonds can be used to price bonds that are not part of that original group. Furthermore, a particularly persuasive relative pricing methodology, known as arbitrage pricing, turns out to be mathematically identical to pricing with discount factors. Hence, discounting can rightly be used and regarded as shorthand for arbitrage pricing. Market prices on a single, fixed date are used to illustrate that the law of one price and arbitrage pricing describe the US Treasury market relatively well, but not perfectly. Bonds are not commodities: their prices reflect sup- ply and demand characteristics that are not fully captured by their scheduled cash flows. The US Treasury’s Separate Trading of Registered Interest and Principal of Securities (STRIPS) are introduced next, both as a topic of inde- pendent interest and as an additional illustration of the complex realities of pricing in bond markets. The chapter concludes with accrued interest and day-count conventions, which are used throughout fixed income markets and throughout this book. For clarity of exposition, prices and examples in this chapter are all as of the close of business on Friday, May 14, 2021. Also, because transactions in the US Treasury market typi


### Research block 7

The cash flows from government coupon bonds are defined by coupon rate; maturity date; and, synonymously, face amount, principal amount,or par value. For example, in May 2014 the US Treasury sold a bond with a coupon rate of 2.5% and a maturity date of May 15, 2024. Purchasing \$1 million face amount of these “2.5s of 05/15/2024” entitles the buyer, as of settle- ment in mid-May 2021, to the schedule of payments depicted in Table 1.1. More specifically, the Treasury promises to make a coupon payment every six months equal to half the bond’s annual coupon rate of 2.5% times the face amount, that is, 2.5%∕2 × \$1,000,000 = \$12,500. Finally, on the matu- rity date of May 15, 2024, in addition to the coupon payment on that date, the Treasury promises to pay the bond’s face amount of \$1,000,000.1


### Research block 8

This chapter restricts attention to US Treasury bonds, but the analytics presented here apply easily to bonds issued by other countries, because cash flows across sovereign bonds differ mostly with respect to the frequency of coupon payments. Government bonds in France and Germany, for example, make annual coupon payments, while those in Italy, Japan, and the United Kingdom pay semiannually, as in the United States. Returning to the US Treasury market, Table 1.2 reports the prices of selected US Treasury bonds as of May 14, 2021. Per market convention, bond prices are always quoted per 100 face amount. Also, each price in the table is a full or invoice ask price, that is, the total price at which traders stand ready to sell that particular bond. (The division of full price into a flat or quoted price and accrued interest will be explained later in the chapter.) From the third row of the table, then, for example, purchasing the 1.625s


### Research block 9

of 11/15/2022 costs 102.2862 per 100 face amount or \$102,286,200 for \$100,000,000 face amount. The bonds in Table 1.2 are selected from the broader list of US Trea- suries for two reasons. First, it is convenient for the computations in the next section that bonds mature in approximate six-month intervals. Second, when two or more Treasury bonds mature on a given date, the most recently issued bond is chosen because it is likely to be more liquid and, consequently, its quoted price more reliable. For example, the 0.25s of 05/15/2024, which were issued in 2021, are chosen over the 2.5s of 05/15/2024, which were featured in Table 1.1 and issued in 2014.


### Research block 10

The discount factor for a particular term gives the value today, or the present value, of one unit of currency to be received at the end of that term. Denote the discount factor for t years by d(t). Then, for example, if d(3.0)= 0.99, the present value of \$1 to be received in three years is 99 cents. Because Treasury bonds promise future cash flows, discount factors can be extracted from Treasury bond prices. In fact, the rows of Table 1.2 can be used to write equations that relate bond prices to discount factors. Starting with the first row of the table, that is, with the bond maturing in six months,


### Research block 11

The US Treasury 1.75s of 05/15/2022 mature in mid-May, approximately one year from the settlement date of the examples of this chapter but are not included among the bonds in Table 1.2. How should the 1.75s of 05/15/2022 be priced? A natural answer is to apply the discount factors of Table 1.3 even though the 1.75s of 05/15/2022 are not used to construct those discount fac- tors. After all, because all of these bonds are obligations of the US Treasury, it seems reasonable to assume as a first approximation that the present value of receiving \$1 from the Treasury on some future date does not depend on which particular bond pays that \$1. This reasoning is known as the law of one price: absent confounding factors (e.g., liquidity, financing, taxes, credit risk), identical cash flows should sell for the same price. According to the law of one price, then, the price of the 1.75s of 05/15/2022 should be,


### Research block 12

0.5 2.875 11/15/2021 101.4297 101.4297 0.0000 11/15/2018 0.5 2.000 11/15/2021 100.9952 100.9922 0.0030 11/15/2011 0.5 8.000 11/15/2021 104.0904 103.9920 0.0984 11/15/1991 1.0 2.125 05/15/2022 102.0662 102.0662 0.0000 05/15/2019 1.0 1.750 05/15/2022 101.6931 101.6914 0.0017 05/15/2012 1.5 1.625 11/15/2022 102.2862 102.2862 0.0000 11/15/2012 1.5 7.625 11/15/2022 111.3969 111.2797 0.1172 11/16/1992 2.0 0.125 05/15/2023 99.9538 99.9538 0.0000 05/15/2020 2.0 1.750 5/15/2023 103.1970 103.1997 −0.0026 05/15/2013 2.5 0.250 11/15/2023 100.0795 100.0795 0.0000 11/16/2020 2.5 2.750 11/15/2023 106.3040 106.3163 −0.0123 11/15/2013 3.0 0.250 05/15/2024 99.7670 99.7670 0.0000 05/17/2021 3.0 2.500 05/15/2024 106.5448 106.4941 0.0508 05/15/2014 3.5 2.250 11/15/2024 106.3091 106.3091 0.0000 11/17/2014 3.5 7.500 11/15/2024 124.8220 124.5906 0.2314 08/15/1994


### Research block 13

The “Present Value” column is computed along the lines of Equation (1.4), giving the prices of the bonds as predicted by the law of one price. The column “Rich (+) / Cheap (−)” is the difference between the market price and the present value. Bonds with prices greater than that predicted by a model, like the law of one price, are said to be trading rich, while bonds with prices less than predicted by the model are said to be trading cheap. The bonds in bold in Table 1.4 are those listed in Table 1.2 and used to compute the discount factors in Table 1.3. Therefore, these bonds are fair, that is, neither rich nor cheap, relative to those discount factors. The prices of the other bonds in Table 1.4, however, can be either rich or cheap relative to those discount factors or, equivalently, relative to the prices of the bonds in bold. The table, as a whole, more or less supports the law of one price. Most of the deviations of present values from market prices are very small, and even the largest deviation, the 23-cent richness of the 7.5s of 11/15/2024, is less than 0.2% of the bond’s market price. Across the bonds in Table 1.4, those with the largest deviations are the older, high-coupon bonds, for example, the 8s of 11/15/2021, issued in 1991; and the 7.625s of 11/15/2022, issued in 1992. Furthermore, these bonds all trade rich relative to the bonds in bold. This is somewhat surprising because, historically, older bonds, which tend to be relatively illiquid, have tended to


### Research block 14

trade cheap relative to other bonds. Perhaps in the current, low-rate envi- ronment, some investors have a strong preference for income and are willing to pay more than fair value for bonds paying high coupons. While the law of one price is generally supported by Table 1.4, it is natural to ask whether a trader or investor could profit by buying cheap bonds and simultaneously selling fairly priced bonds; by selling rich bonds and simultaneously buying fairly prices bonds; or – so as to profit on both sides of the trade – by buying cheap bonds and simultaneously selling rich bonds. The next section addresses this question.


### Research block 15

While the law of one price is intuitive, its real justification rests on a stronger foundation. It turns out that a deviation from the law of one price implies the existence of an arbitrage opportunity, that is, a trade that generates profit without any chance of losing money.4 But because arbitrageurs would flock toward any such trade, market prices can be expected to adjust quickly so as to rule out any significant deviations from the law of one price. Put another way, arbitrage activity can be expected to enforce the law of one price. To make this argument more concrete, consider an arbitrage trade based on the richness of the 7.625s of 11/15/2022, as reported in Table 1.4. More specifically, sell or short5 the 7.625s of 11/15/2022 and simultaneously buy a portfolio of bonds, from among the bonds in bold in Table 1.4, which perfectly replicates the cash flows of the 7.625s of 11/15/2022. Because the 7.625s of 11/15/2022 are rich relative to the bonds in bold, selling the former and buying a portfolio of the latter, in a way that generates no future cash flows, should generate a riskless profit. Table 1.5 describes this replicating portfolio and this arbitrage trade in more detail. Columns (2) through (4) of Table 1.5 correspond to the three bonds cho- sen from Table 1.2 to construct the replicating portfolio. Row (iii) gives the face amount of each bond in the replicating portfolio, that is, the portfolio is long about 2.90 face amount of the 2.875s of 11/15/2021; about 2.94 of the 2.125s of 05/15/2022; and about 102.98 of the 1.625s of 11/15/2022. Rows (iv) through (vi)


### Research block 16

15, 2021, and on May 15, 2022, and coupon plus principal payments of 102.97582 ×(1 + 1.625%∕2)= 103.8125 on November 15, 2022. Row (vii) gives the price of each of the bonds, simply copied from Table 1.2, and row (viii) gives the cost of purchasing the face amount of each bond given in row (iii). As an example of the latter, the cost of purchasing 2.94454 face amount of the 2.125s of 05/15/2022 at a price of 102.0662 (per 100 face amount) is 2.94454 × 102.0662%= 3.00538. Column (5) of Table 1.5 gives details of the rich bond to be sold, namely, the 7.625s of 11/15/2022. Its cash flows on the three payment dates are given in rows (iv) through (vi). And, most importantly, note that the sums of the cash flows of the three replicating bonds for each date equal the cash flows of the 7.625s of 11/15/2022. More specifically, 2.94454 + 0.03129 + 0.83668 = 3.8125; 2.97583 + 0.83668 = 3.8125; and trivially, 103.8125 = 103.8125. Hence, the replicating portfolio, as defined by the three bonds and their respective face amounts in row (iii), do indeed replicate the cash flows of the 7.625s of 11/15/2022. Section A1.1 in the appendix to this chapter shows how to derive the face amounts of the bonds in this or any such replicating portfolio. The discussion now returns to the arbitrage trade. According to row (ix) of Table 1.5, an arbitrageur can sell 100 face amount of the 7.625s of 11/15/2022 for 111.3969 and buy the replicating portfolio for 111.2797, which is just the sum of the costs of the three bond positions given in row (viii). The net proceeds of this trade, given in row (x), is 0


### Research block 17

12 cents. But, by definition of the replicating portfolio, this trade will neither generate nor require cash on any of the three future payment dates. Hence, through this trade, the arbitrageur receives 12 cents today without incur- ring any future obligations. While these proceeds may seem small, the trade described in Table 1.5 can, at least in theory, be scaled up dramatically. For example, selling \$500 million of the 7.625s of 11/15/2022 and buying the appropriately sized replicating portfolio would generate a riskless profit of \$500,000,000 × 0.1172%= \$586,000. As discussed at the start of this section, if a riskless and profitable trade like the one just described were readily available, arbitrageurs would col- lectively rush to do the trade and, in so doing, force prices to relative levels that admit no further arbitrage opportunities. In the present example, arbi- trageurs would drive the price of the 7.625s of 11/15/2022 lower and the price of the replicating portfolio higher until the two were equal. The crucial link between arbitrage and the law of one price can now be explained. The total cost of the replicating portfolio, 111.2797, given in row (ix) of Table 1.5, exactly equals the present value of the 7.625s of 11/15/2022 as reported in Table 1.4. In other words, exactly the same value for the 7.625s of 11/15/2022 is computed through the law of one price (i.e., applying discount factors derived from the prices of bonds in the replicating portfolio) and through arbitrage pricing (i.e., finding the price of the replicating portfolio). This is not a coincidence. 


### Research block 18

In contrast to coupon bonds that make payments every six months, zero coupon bonds make no payments until maturity. Zero coupon bonds issued by the US Treasury are called STRIPS. For example, \$1,000,000 face amount of STRIPS maturing on May 15, 2030, promises only one payment: \$1,000,000 on that date. STRIPS are created when a particular coupon bond is delivered to the Treasury in exchange for claims on its future coupon and principal components. Table 1.6 illustrates the stripping of \$1,000,000 face amount of the 0.625s of 05/15/2030. As of mid-May 2021, the bond has nine years remaining to maturity, which means it will make 18 coupon payments, from November 15, 2021, to May 15, 2030, and one principal payment, on May 15, 2030. STRIPS received in exchange for coupon (interest) payments are called TINTs, INTs, or C-STRIPS, while STRIPS received in exchange for principal payments are called TPs, Ps, or P-STRIPS. Table 1.6 shows that stripping \$1,000,000 face amount of the 0.625s of 05/15/2030 generates \$1,000,000 × 0.625%∕2 = \$3,125 face amount of C-STRIPS maturing on each coupon payment date and \$1,000,000 face amount of P-STRIPS maturing on the bond’s maturity date. The Treasury not only creates STRIPS but retires them as well. For example, upon delivery of all of the STRIPS in Table 1.6, the Treasury would reconstitute the \$1,000,000 face amount of the 0.625s of 05/15/2030. It is critical to note, however, that C-STRIPS are fungible while P-STRIPS are not. When reconstituting a bond, any C-STRIPS maturing on a particular date may be applied toward the coupon payment of th


### Research block 19

be used to reconstitute the principal payment of that bond.6 This feature of the STRIPS program implies that P-STRIPS, and not C-STRIPS, are likely to inherit the cheapness or richness of the bonds from which they are stripped. STRIPS prices are essentially discount factors. If the price of C-STRIPS maturing on May 15, 2030, is 85.9453 per 100 face amount, then the implied discount factor to that date is 0.859453. As of mid-May 2021, the STRIPS market provides another illustration of the idiosyncratic pricing of US Treasury bonds, that is, of the occasional failures of the law of one price to describe prices accurately. Table 1.7 iso- lates one such case by reporting the prices of three STRIPS that all mature on May 15, 2030. In theory, because each of these zero coupon bonds pay \$1 on May 15, 2030, they should all sell for the same price. But they don’t. The C-STRIPS maturing on that date are priced at 85.95, while two P-STRIPS, one from stripping the 0.625s of 05/15/2030 and the other from stripping the 6.25s of 05/15/2030, are priced at 86.85 and 87.04, respectively. Reit- erating the discussion earlier, these price discrepancies do not necessarily imply an arbitrage opportunity of buying the C-STRIPS and shorting one of the P-STRIPS because of likely significant market frictions. An investor plan- ning to buy and hold one of these zero coupon bonds to maturity, however, would certainly be most attracted to the C-STRIPS. Figure 1.2 shows a broader pattern of the idiosyncratic pricing of STRIPS. The thick, round data points are C-STRIPS prices, and the plus signs are P-ST


### Research block 20

This section describes the market practice of separating the full or invoice price of a bond, which is the price paid by a buyer to the seller, into two parts: a flat or quoted price, which appears on trading screens and is used when negotiating transactions; and accrued interest. Full and flat prices are also known as dirty and clean prices, respectively. For concreteness, consider an investor who purchases \$10,000 face amount of the US Treasury 0.625s of 08/15/2030, for settlement on May 17, 2021. The bond last made a coupon payment of \$10,000 × 0.625%∕2 = \$31.25 on February 15, 2021, and makes its next coupon payment of \$31.25 on August 15, 2021. See the timeline in Figure 1.3. Assuming that the buyer holds the bond through August 15, 2021, the buyer collects the semiannual coupon on that date. But it can be argued that the buyer is not really entitled to the whole coupon because the buyer will have held the bond for only three months, that is, from May 17, 2021, to August 15, 2021. More precisely, using what is known as the actual/actual day-count convention, and referring again to Figure 1.3, the buyer should receive only 90 of the 181 days of the coupon payment, that is,


### Research block 21

\$31.25 × 90∕181 = \$15.539. The seller, on the other hand, who presumably held the bond from the previous coupon date to the settlement date, should collect the rest of the coupon, namely, the accrued interest from February 15, 2021, to May 17, 2021, which is \$31.25 × 91∕181 = \$15.711. A conceivable institutional arrangement would be for the seller and the buyer to divide the coupon payment on the next payment date, but this would undesirably require additional arrangements to ensure compliance. Instead, market convention dictates that the buyer pay the seller the \$15.711 of accrued interest on the settlement date, and that the buyer keep the entire coupon of \$31.25 on the coupon payment date. The flat or quoted price of the 0.625s of 08/15/2030 on May 14, 2021, for settlement on May 17, is 91.78125. The full or invoice price, which is defined as the flat or quoted price plus accrued interest, is 91.78125 + 0.15711 = 91.93836. For the particular trade just described, of \$10,000 face amount, the invoice amount is \$10,000 ×(91.78125%+ 0.15711%) = \$9,178.125 + \$15.711 = \$9,193.836, or, equivalently, \$10,000 ×91.93836%= \$9,193.836. At this point, it becomes clear why earlier in the chapter it is noted that prices are full prices. With bonds paying coupons on May 15 and November 15, and with trades settling on Monday, May 17, 2021, buyers have to pay sellers two days of accrued interest. The full price of a bond, the amount a buyer actually pays to purchase a bond, should equal the present value of a bond’s cash flows. Mathematically, denote the flat price of the bond by p, accru


### Research block 22

interest convention changes neither the present value of all cash flows, PV, in Equation (1.5), nor the full price, P, which is the amount actually exchanged at settlement. The convention only changes the quoted market price, p, relative to the calculated amount of accrued interest. If accrued interest is in any sense too high, the market reduces p accordingly. Having made this argument, why bother with the accrued interest con- vention in the first place; that is, why not just quote bonds using the full price? The answer is told in Figure 1.4, which draws the full and flat prices of the 0.625s of 08/15/2030 from February 15, 2021, to September 15, 2021, under the simplifying assumption that interest rates are constant at the approximate market rate of 1.60% over the entire period.7


### Research block 23

Figure 1.4 shows that the full price changes dramatically over time – including a sudden drop on August 15, 2021 – even though the market, in terms of interest rates, is unchanged. The flat price, by contrast, changes only gradually over time. Therefore, when trading bonds day to day, it is more intuitive to follow flat prices and negotiate transactions in those terms. The behavior of the prices in Figure 1.4 can be understood readily. First, as of February 2021, the price of the bond is below 100, because its coupon rate is below the market rate for its maturity. But as the bond matures, its flat price approaches 100. (The dynamics of prices at below and above market


### Research block 24

rates are discussed further in Chapter 3.) Second, within a coupon period, the full price of a bond increases over time as its cash flows get closer to being paid, that is, as their present values increase. But from just before the coupon payment date to just after, the full price falls by the coupon payment: the coupon is included in the present value just before the payment, but not included just after. The flat price, by contrast, which equals the full price minus accrued interest, rises more gradually than the full price and does not fall precipitously just after the coupon payment. Because accrued interest just before the coupon payment nearly equals that coupon payment, subtracting accrued interest from the full price leaves the flat price essentially without that coupon – both just before and just after its payment date.


### Research block 25

As mentioned in the previous section, accrued interest is calculated using the actual/actual convention, that is, by dividing the actual number of days from the last coupon payment by the actual number of days between coupon payments. Hence the term “actual/actual” for this day-count convention. The actual/actual convention is commonly used in government bond markets, but, in other markets, different conventions are used. Two of the most common are actual/360 and 30/360. The actual/360 convention divides the actual number of days between two dates by 360. The 30/360 conven- tion calculates the difference between two dates under the assumption that there are 30 days in each month, and then divides that difference by 360. To illustrate, there are 75 actual days between June 1 and August 15: there are 29 days from June 1 to the end of June; 31 days in July; and 15 days to August 15. The 30/360 convention, however, assumes that there are 30 days in every month, including July, giving a total of 29 + 30 + 15 or 74 days. Money markets typically use the actual/360 convention; swap markets use either actual/360 or 30/360; and corporate bond markets typically use the 30/360 convention.


### Research block 26

C hapter 1 showed that discount factors fully describe the time value of money as embedded in market prices. Investors and traders, however, often find it more intuitive to quote the time value of money in terms of interest rates and, in particular, in terms of either swap rates or par rates, spot rates, and forward rates. This chapter begins by explaining that interest rates are always quoted as annual rates, that interest is conceptualized as being paid over a number of periods of fixed length (e.g., 90 days, three semiannual periods), and that interest rate quotations indicate the payment of either simple or compound interest. The chapter then introduces interest rate swaps (IRS) as context for the material. Swaps and bonds together comprise a significant portion of fixed income markets, and swaps, because they are relatively liquid, have become benchmarks against which to evaluate other fixed income instruments. At the time of this writing, interest rate swap markets are in transition away from LIBOR (London Interbank Offered Rate), which has dominated floating-rate indexes for decades. Chapter 12 discusses this transition, but this chapter briefly introduces the leading candidates for replacing LIBOR (e.g., Secured Overnight Financing Rate (SOFR) in the United States) and their associated swaps. Chapter 13 discusses why and how market partici- pants use interest rate swaps.


### Research block 27

included in Figure O.7, but constituted 93% of commercial bank liabilities. Other liabilities include investments by the bank’s parent company, long-term debt, commercial paper, assorted loans, and repurchase agreements,or repo, which are loans collateralized by debt securities, as discussed in Chapter 10. While deposits are certainly the main source of funding for bank invest- ments, they are actually a product or output of banking, just like business loans and mortgages are bank products. Depositors value the safety and immediacy of deposits, and they incorporate deposits into their manage- ment of cash and liquidity. Furthermore, banks actively manage the liquidity they offer to depositors, in part by having some fraction of liabilities in longer-term debt, and in part by investing some fraction of assets in liq- uid products that can be sold quickly and easily to meet any unexpected withdrawals of deposits. Turning to assets, Figure O.11 shows the asset composition of large and small commercial banks. Commercial and industrial (C&I) loans, real estate loans, and consumer loans are all considered the main business of banking. In addition to these assets, however, along the lines of the previous para- graph, banks hold liquid assets. The most liquid, of course, are cash, reserves or deposits at the Federal Reserve, and other money market (MM) instru- ments. But these assets have the disadvantage of earning very low rates of return. Therefore, to earn higher rates of return while maintaining satis- factory liquidity profiles, banks also hold Treasuries, agency securities, 


### Research block 28

Figure O.11 also reveals some differences between large and small banks. First, commercial bank assets are highly concentrated. There are over 4,000 commercial banks in the United States, but \$12.5 trillion of the sector’s \$19 trillion of assets, or 66%, are held by the largest 25 banks.12 As an aside, the number of banks in the country has been declining gradually but swiftly: there were over 14,000 banks in 1984. This decline is likely an adjustment from historical restrictions on interstate banking and branching that prevented larger banks from satisfying market demand. In any case, a second difference between the largest and smaller banks is the difference in the fractions of their assets in real estate loans: 17.4% for the largest banks and 36.7% for the smaller banks. The concentration of a small bank’s assets in real estate loans, which are often local, can challenge the bank’s viability through regional economic downturns.


### Research block 29

Life insurance products often pay death benefits, of course, but they are also often savings vehicles, through which policy holders invest funds with the advantages of tax deferral. Life insurance companies are, therefore, financial intermediaries that collect and invest premiums so as to meet their obliga- tions under policies sold and to earn additional returns for their sharehold- ers. Furthermore, long-term fixed income assets are natural hedges to the long-term nature of their policy liabilities. Reflecting these considerations, the asset portfolios of life insurance companies contain large fractions of corporate bonds and equities, 36.4% and 8.5%, respectively, with an addi- tional 18.8% in mutual fund shares that are some mix of bonds and equities. In fact, their corporate bond investments make life insurers very significant players in that market: their direct holdings of \$3.5 trillion of corporate bonds comprise about 24% of the total \$14.7 trillion outstanding. While Treasuries are theoretically useful as a match for long-term liabilities, they do not earn enough to meet insurer return hurdles. As a result, Treasuries comprise only 2.4% of life insurance company assets. Finally, life insurance companies also use derivatives to achieve their return and hedging objectives.


### Research block 30

history, etc. Sponsors collect employee and their own contributions into a pension fund, and then invest the assets of that fund so as to be able to honor promised obligations. A low-risk strategy combines relatively high contri- butions to the pension fund with low-risk investments, while a high-risk strategy combines relatively low contributions with aggressive investments. In any case, investment risk in DB plans resides with the sponsor, which, in the end, is responsible for paying the promised benefits. For decades now, however, defined contribution (DC) plans have become more important. In these plans, employees and employers contribute to individual employee accounts, and each employee can typically choose among a few investment options. Upon retirement, employee benefits are determined completely by the funds accumulated in their respective accounts. Hence, in DC plans, investment risk resides with employees. Employers can, of course, offer both types of plans or a hybrid of the two types. Government employees, at the federal, state, and local levels, nearly always have DB plans or an option to participate in a DB plan. In the private sector, however, the trend has been for corporations and other employers to avoid the risks and costs of managing pension funds, that is, to migrate from DB to DC plans. In 1975, there were about 33.0 million participants in private DB plans and 11.5 million in private DC plans. In 2019, the numbers were 32.8 million and 109.1 million, respectively.13 Furthermore, corporations are actively shedding DB pension fund risk through pension 


### Research block 31

government funds, which purchase only short-term, government-backed debt; prime funds, which invest predominantly in short-term, high-quality corporate debt, like commercial paper; and tax-exempt funds, which invest in short-term, high-quality, tax-exempt municipal debt. Before changes implemented after the financial crisis of 2007–2009, investors could buy money market fund shares for \$1 per share; their money was invested in relatively safe and liquid assets; and, except in extraordinary circumstances, they could sell their shares at any time for \$1 per share. More specifically, a fund that i) complied with Securities and Exchange Commission (SEC) rules governing the safety and liquidity of fund investments, known as 2a-7 rules; and ii) had a portfolio or net asset value (NAV) corresponding to a value per share of between 99.5 cents and \$1.005, could offer and redeem shares at a “fixed NAV” or “stable NAV” of \$1 per share. But if the value of the fund fell such that the value per share fell below 99.5 cents, the fund would “break the buck” and shares would no longer be redeemed at \$1, but rather at a value corresponding to the fund’s NAV. Hence, money market fund shares were very similar to bank deposits, but did not have the benefit of an explicit government guarantee, like federal deposit insurance. Instead, money market shareholders had to rely on their fund sponsors or management companies to make up for any NAV shortfalls. Only one money market fund had ever broken the buck, in 1994, but it was to happen a second time during the financial crisis of 2007–2009. In Sept


### Research block 32

After the crisis, the SEC changed several rules governing money market funds.16 First, 2a-7 rules were tightened to increase the safety and improve the liquidity profiles of money market fund portfolios. Second, institutional prime and tax-exempt money market funds, as opposed to funds with only retail investors, must allow share price to float with the fund’s NAV. Proponents of this change argue that floating NAVs raise awareness that fund values can fluctuate and may discourage withdrawals timed to precede a fund’s breaking the buck. Opponents argue that money market fund investors, particularly institutional investors, are well aware of the risks; that floating NAVs have little to no bearing on flights-to-safety away from prime funds; and that floating NAVs significantly increase the accounting, operational, tax, and legal complexities of using money market funds for cash management. The third post-crisis change was that prime and tax-exempt money market funds had to have the power, under various stress conditions, to impose redemption fees of up to 2% and gates that prevent withdrawals for up to 10 business days in any 90-day period. Redemption fees, which are paid into the fund, are intended both to discourage investor withdrawals in a crisis and to recover losses from liquidating assets in a crisis to meet those withdrawals. Gates are intended to give funds a grace period in which to manage through stressed market conditions. If, however, a fund cannot restore stability by the end of its grace period, the fund is liquidated. Government funds, by the way, may choose to


### Research block 33

and institutional balances fell more than retail balances, but, due to swift action by the Treasury and Federal Reserve in support of financial markets in general and money market funds in particular, balances recovered rela- tively quickly. In any case, it seems that the possibility of redemption fees and gates in March 2020 did encourage preemptive withdrawals by prime investors and sales of assets by prime fund managers, who raised liquidity in order to avoid triggering fees and gates. Consequently, at the time of this writing, the SEC is revisiting fees and gates and considering other changes to the regulation of institutional prime funds.17


### Research block 34

To introduce the roles of the Federal Reserve system or “the Fed” as a mod- ern central bank, Table O.4 shows its pre-crisis balance sheet, as of December 2007. One role, the creation and maintenance of a widely accepted national currency, is achieved by purchasing government bonds with that currency. The currency of the United States is comprised of green bills labeled as liabil- ities of the Federal Reserve, that is, as “Federal Reserve Notes.” In terms of the balance sheet, therefore, outstanding currency is a liability and Treasury securities are assets. Put another way, currency is “backed” by government


### Research block 35

bonds. As shown in the table, \$773.9 billion of currency outstanding was about 83% of Federal Reserve liabilities. A second role of the central bank is to provide liquidity to banks under short-term distress. As mentioned earlier, bank assets, like loans, are rela- tively illiquid, while bank liabilities, like deposits or short-term borrowings from other financial institutions, may be due immediately. Therefore, a bank may find itself solvent but illiquid, that is, with assets of sufficient value to pay off its liabilities but without enough cash on hand to meet its immediate obligations. In these situations, a bank can borrow from the Fed through the discount window on any acceptable collateral. The discount window borrowings of a well-managed bank are expected to be infrequent and of relatively limited duration. The third role discussed here, as set out in the Federal Reserve Act, is to “maintain long run growth of the monetary and credit aggregates ...so as to promote effectively the goals of maximum employment, stable prices, and moderate long-term interest rates.” Despite the three objectives, by the way, the Fed is often said to have a “dual mandate” of full employment and low inflation. In any case, two points are made before proceeding:


### Research block 36

price – which increases bank reserves and the liabilities of the Fed – and the Treasury bond is added to the assets of the Fed. The Fed can also add to reserves by lending money to a bank through a repurchase agree- ment or repo.19 The money is credited to the bank’s account at the Fed, which is a reserve liability of the Fed, and the loan obligation is added to the Fed’s assets. To reduce reserves, the Fed can do the opposite of these two transactions, that is, sell a bond to a bank or borrow money from a bank through a repo. In light of this discussion, the quantity of Treasury assets and net repo assets on the Fed’s balance sheet enter into the determination of the total amount of reserves in the banking system.


### Research block 37

Before the financial crisis of 2007–2009, reserves were scarce in the sense that banks traded reserves among themselves in the interbank fed funds market. Banks that needed reserves to satisfy their reserve requirements bor- rowed fed funds, while banks that had excess reserves, on which they did not earn interest, loaned fed funds at the market-determined fed funds rate. In this setting, if the Fed wanted to ease monetary conditions, to stimulate the economy (i.e., growth was too low and inflation not a threat), it would add reserves to the banking system, which – by increasing supply relative to demand in the market for reserves – would decrease the fed funds rate and likely increase the volume of bank loans to commercial enterprises. Simi- larly, if the Fed wanted to tighten monetary conditions, to slow the economy (e.g., growth was too inflationary), it would remove reserves from the sys- tem, which would increase the fed funds rate and likely decrease bank loans to commercial enterprises. Finally, the means by which the Fed changed reserves were called open market operations and consisted almost exclusively of lending and borrowing money through repurchase agreements. In response to the financial crisis and ensuing Great Recession, the Fed tried to stimulate the economy as just described, by reducing the fed funds rate from 5.25% in September 2007 to a range of between 0% and 0.25% by December 2008. But having reduced interest rates to nearly zero and wanting to stimulate the economy even more forcefully, the Fed began what became known as quantitative easing (QE): it 


### Research block 38

Figure O.13 shows the composition of the asset side of the Fed’s balance sheet from June 2006 to June 2021. Note that the total of Fed assets is often referred to by market participants simply as the Fed’s “balance sheet.” In any case, during the financial crisis itself, from 2007 to 2009, assets were elevated by expanded repo lending, lending through the discount window, loans through emergency facilities that the Fed put in place at the time, and through swap lines, through which the Fed lends US dollars to foreign central banks, collateralized by foreign currency. While small in hindsight, this bal- ance sheet expansion before QE was unprecedented, increasing from about \$900 billion at the start of 2007 to over \$2 trillion by the end of 2008. From then, the Fed fully engaged in QE by purchasing Treasuries and agency MBS, and the balance sheet grew dramatically. By the end of 2014, however, the Fed decided that economic conditions had improved enough to discon- tinue further stimulus. It stopped buying new assets, though it continued to roll over principal repayments from its holdings. From December 2015 to


### Research block 39

summer 2019, it raised the target Fed funds rate from a range of 0% to 0.25% to a range of 2.25% to 2.50% and, in what was named the “nor- malization” of the balance sheet, began allowing assets to decline with prin- cipal repayments. The Fed was clear to point out, however, that the balance sheet would not decline to anywhere near its size before the financial cri- sis, because, as explained later, post-crisis monetary policy requires greater levels of reserves. Along these lines, in summer 2019, the Fed resumed the reinvestment of principal payments to maintain the size of the balance sheet. Then, in response to turmoil in the repo market in September 2019, further described later, the Fed started growing the balance sheet again. The Fed also judged that “implications of global developments for the economic outlook as well as muted inflation pressures” warranted lowering rates and reduced the Fed funds target range to 1.50% to 1.75% by November 2019. Finally, with the onset of the COVID pandemic and economic shutdowns, the Fed reduced rates back to the range of between 0% and 0.25% and aggressively bought Treasuries and MBS. As of June 2021, the Fed’s balance sheet stood at \$8.25 trillion, more than nine times its size before the financial crisis. QE not only increased the size of the Fed’s balance sheet but also changed its nature in a way that necessitated a new approach to implement- ing monetary policy. This is best described in terms of the liability side of the balance sheet, which is shown in Figure O.14 for three dates: the end of 2007, before the financial crisis


### Research block 40

If banks were the only participants in money markets, then setting the IORB would set overnight, safe rates in the system. But nonbanks with funds to lend might very well lend at rates below the IORB. First, only banks hold reserves and, therefore, only banks can lend to the Fed directly at the IORB. Second, because of post-crisis regulations, discussed later, banks are not will- ing to accept deposits from all comers and then hold those funds as their own reserves at the Fed. Therefore, other significant market participants, partic- ularly money market funds, might very well lend funds at rates below the IORB. To prevent these lenders from pushing market rates below Fed tar- gets, the Fed offers to pay a minimum rate to these participants through its RRP. More specifically, through the RRP, money market funds and some other entities can lend money to the Fed, taking Treasury securities as col- lateral, at the Fed’s administered RRP rate.23 It has turned out, in fact, that the facility has had to grow very large and very quickly to keep rates in the Fed’s policy range. Figure O.14 shows that, as of June 2021, the Fed’s repo liabilities of \$1.3 trillion constituted 16% of the Fed’s total liabilities.


### Research block 41

because reserves are so plentiful that, between the relatively high discount window rate at which banks can borrow from the Fed, and the relatively low IORB at which banks can lend to the Fed, the market interest rate equals the lower IORB. In a “corridor” system, by contrast, reserves would be calibrated such that the market interest rate settles between the discount window rate and the IORB. 23In a reverse repo, a counterparty lends money and “reverses in” securities (see Chapter 10). Hence, the counterparties that are lending money to the Fed are doing reverse repo.


### Research block 42

Putting these pieces together, the Fed sets rates in the regime of abundant reserves as follows: the Fed sets a target range for the market-determined fed funds rate; it sets the IORB to determine the rate at which banks are willing to borrow and lend; and it sets the RRP rate as a floor to the rate at which money market funds and others will lend. At the time of this writing, the fed funds target range is between 0% and 0.25%; the RRP rate is 0.05%; and the IORB is 0.15%. This means of implementing monetary policy has been successful in that the weighted-average of fed funds transactions has most recently been between 0.06% and 0.10%. Policy implementation with abundant reserves has not been as success- ful, however, with respect to banks responding to market conditions with- out Fed assistance. Put another way, it has not been clear at what level reserves really are abundant. In mid-September 2019, reserves dropped by about 9% somewhat suddenly, from a variety of causes, including corpo- rate tax payments and the settlement of new Treasury issues, both of which move funds from banks to the government. Banks might have been expected, with their abundant reserves, to supply funds to any market participant needing funds. But that did not happen. Instead, in the ensuing scramble for funds, when the Fed’s target range was between 2% and 2.25%, the transaction-weighted repo rate on a particular day averaged 5.25%, and one trade was done at 10%. As mentioned earlier, the Fed responded swiftly by adding reserves, but the episode demonstrated that the determination of the quantity


### Research block 43

A similar episode occurred in March 2020. News of the COVID pan- demic and economic shutdowns resulted in disorder in Treasury markets, manifested through high costs of trading and high spreads between other- wise similar securities. These disturbances were much more severe than those in September 2019, but banks again seemed unwilling to use their resources, and the Fed again intervened by reducing the fed funds target range, offer- ing unlimited repo loans, purchasing Treasuries and MBS, and temporarily excluding reserves, Treasuries, and Treasury repo from leverage ratio calcu- lations.25 As a more permanent response to the episodes of both September 2019 and March 2020, the Fed instituted a standing repo facility (SRF) in July 2021, through which primary dealers and bank counterparties can bor- row money overnight from the Fed on government-backed collateral. To discourage the use of the facility except under stressed conditions, the bor- rowing rate is set above market rates. At the time of this writing, with the RRP rate at 0.05% and the IORB at 0.15%, the rate on the SRF is 0.25%. Several policy issues arise with QE and the implementation of mone- tary policy in a regime of abundant reserves. First, the Fed was established and has traditionally accepted deposits only from banks. The idea was that the public deposits funds into banks, and banks decide to whom to make loans. In other words, the private banking sector was responsible for capital allocation decisions. The Fed has always held some quantity of government bonds, of course, because, in the current monetary s


### Research block 44

This can be viewed as a cost to taxpayers when, for example, the Treasury is borrowing through three-month T-bills – and the Fed is investing some of its assets in those same T-bills – at five or six basis points, while the Fed is bor- rowing from banks through reserves at 15 basis points. And this issue could become more acute when the Fed eventually increases rates by increasing the IORB. In fact, one of the reasons that the Treasury has been keeping more of its cash balances or deposits at the Fed is to avoid the situation in which Treasury holds stores of cash as deposits at banks, earning a relatively low rate of interest, while the banks are depositing those fund at the Fed and earning the IORB.26 Figure O.14 shows that Treasury deposits have grown to about 11% of Fed liabilities.


### Research block 45

Lending €1 at a negative rate means receiving less than €1 when the loan matures. Conversely, borrowing €1 at a negative rate means paying back less than €1 at maturity. Buying a bond at a negative yield means purchasing the bond for more than its face amount, receiving no interest over the life of the bond, and receiving only face amount at maturity.27 Individuals with relatively small amounts of money can avoid lending at negative rates by keeping money in cash. For individuals and corporations with larger sums, however, holding cash is very cumbersome, and depositing funds at a bank at a modestly negative rate of interest may be the best available choice. There are also reasons to buy long-term bonds trading at a negative yield, despite their being guaranteed to lose money in nominal or euro terms. First, if bank deposit rates are negative, say at −0.50%, then purchasing a bond yielding −0.25% might be preferable to a deposit. Second, if the future is characterized by falling prices, that is, by deflation, then a negative yielding bond can offer a positive real return. For example, a bond yielding −1% when prices are falling at a rate of 2% is actually gaining 1% in real terms, that is, in purchasing power. Third, from a short-term trading


### Research block 46

26And one of the reasons the Treasury has been holding greater cash balances is its wanting a cushion against the occasional political stalemates with respect to raising the debt ceiling, which, by limiting new borrowing, can leave the Treasury scrambling for cash. 27In theory, an investor could buy a negative yielding bond by paying its face amount, paying a periodic coupon, and then receiving the face amount at maturity. It is not feasible, however, for a government or corporate issuer to track down individual investors to collect coupon payments. Therefore, bonds with negative yields are sold as described in the text, with an initial price above par, a coupon of zero, and a return of par.


### Research block 47

perspective, negative yielding bonds increase in price if yields fall. In other words, a trader makes money by buying a bond at a yield of −1% if market yields subsequently fall to −1.5%. The Fed never lowered its target interest rate below zero as part of its easing program, but the European Central Bank (ECB) combined negative rates with QE starting in 2014, and the Bank of Japan did so in 2016. These policy decisions contributed to a peak of more than \$18 trillion of global debt trading at negative yields in December 2020, and nearly as much as recently as summer 2021, with more than 50% of that volume in European bonds and about a third in Japanese bonds.28 At the time of this writing, with central banks around the world expected to increase rates in response to inflation, the volume of negative yielding bonds is significantly lower, at less than \$5 trillion in early 2022. The Eurosystem refers to the ECB and the collection of national cen- tral banks in the euro area. Individual banks conduct transactions with and keep reserves at their respective national central banks, which, in turn, inter- act with the ECB. For simplicity, however, the discussion here is written as if banks trade directly with the ECB. The ECB targets interest rates by set- ting a deposit facility rate, which banks earn on their reserve deposits at the ECB, and a rate on main refinancing operations, which banks pay to borrow from the ECB through short-term repo transactions.29 In its easing of mone- tary conditions, the ECB lowered these policy rates from 3.25% and 4.25%, respectively, in July 2008


### Research block 48

To ease monetary conditions beyond reducing interest rates, the ECB turned both to loans to banks and to QE. Figure O.15 shows the assets of the ECB or, more precisely, the consolidated assets of the ECB and the national banks in the Eurosystem. Over the whole period, the multiplicative expansion of the balance sheet was similar to that at the Fed, shown in Figure O.13. The ECB began at a slower pace, however, and, at the start, placed a heavier reliance on bank loans. Before the financial crisis, the ECB loaned money to banks on a collateralized basis for a week through its main refinancing operations (MROs) and for three months through its longer-term refinancing operations (LTROs). As the ECB wanted to ease monetary conditions, it offered longer-maturity LTROs, first up to a year and then up to three years. The logic was that banks have more flexibility to expand their lending if they are more certain of their source of funds. Then, starting in 2014, with the aim of making its loans even more stimulative, the ECB began targeted long-term refinancing operations (TLTROs), which made four-year loans to banks in amounts based on the amounts that banks, in turn, loaned to their customers. At the time of this writing, MROs are for a week, LTROs for three months, and TLTROs for terms up to four years. As evident from Figure O.15, however, the ECB eventually expanded its balance sheet less through loans and more through QE, that is, through the purchase of securities. While government debt issues comprise the vast majority of these purchases, the ECB began purchasing nonbank cor


### Research block 49

The ECB faces a unique challenge in implementing QE. European law prevents the ECB from funding individual European governments, or more broadly, from encouraging any unsound budget policies. In this spirit, to pre- serve ECB purchases as purely monetary rather than fiscal interventions, the ECB has aimed to purchase the bonds of various national governments in proportions to their capital keys, which reflect the sizes of their populations and economies. Furthermore, in 2015, the ECB limited itself to purchas- ing at most one third of the outstanding amount of any country’s bonds. As QE purchases grew, however, keeping within these constraints has been difficult, and the ECB faced court challenges with respect to some of its deci- sions. One obstacle of growing significance has been that Germany has the greatest capital key, but a relatively small amount of debt outstanding. The ECB gave itself more leeway, therefore, for purchases under the Pandemic Emergency Purchase Programme in March 2020: the one-third limit would not be applied; the shortest eligible maturity would be 28 days rather than one year, which allowed for the purchase of short-term German government bills; bonds with less than investment-grade ratings would be eligible, which allowed for the purchase of Greek government debt; and some flexibility would be tolerated with respect to the capital keys constraint.32


### Research block 50

31These include €318 billion held under the Commercial Sector Purchase Programme (CSPP), as of early February 2022, and €50 billion under the Pandemic Emergency Purchase Programme (PEPP), as of the end of November 2021. 32“For purchases under the PEPP...the benchmark allocation...will be guided by the [capital] key[s] ...A flexible approach to the composition of purchases ...is nonetheless essential...” Source: Decision (EU) 2020/440 of the European Central Bank of 24 March 2020 on a temporary pandemic emergency purchase programme (ECB/2020/17), paragraph (5). 33Ainger, J. (2020), “One of the World’s Top Bond Markets Slowly Capitulating to QE,” December 9; Reuters (2021), “UPDATE-1-ECP Buys More Bonds Than Coun- tries Sell to Cap Yields,” August 2.

