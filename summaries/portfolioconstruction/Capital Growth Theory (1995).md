# Capital Growth Theory

[Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_HakanssonZiemba_1995.pdf>). Chapter 3 in *Handbooks in Operations Research and Management Science*, volume 9 (1995), pp. 65–86. The complete 22-page chapter, including its applications and references, was reviewed.

## 1. Metadata

- **Title:** Capital Growth Theory
- **Author(s):** Nils H. Hakansson, William T. Ziemba
- **Year:** 1995
- **Journal/Venue:** Handbook chapter in *Handbooks in Operations Research and Management Science*

# 2. Problem statement

The chapter asks: **what is the exact content of capital-growth theory and the growth-optimal portfolio (Kelly criterion), what are its main mathematical properties, and how does it relate to expected utility, mean-variance analysis, and long-run portfolio choice?**

# 3. Approach (short)

The chapter is a theoretical survey centered on the growth-optimal portfolio. It formulates long-run investment as maximizing the almost-sure asymptotic growth rate of wealth, derives the resulting policy, reviews and explains central properties such as asymptotic dominance and myopia, and compares it with mean-variance and other expected-utility criteria. The methods are stochastic growth theory and dynamic portfolio choice rather than empirical optimization.

# 4. Approach (detailed)

1. **Growth criterion**

   Let gross portfolio return in period $t$ be $1+x_t^\top R_t$. The growth-optimal strategy solves
   $$
   \max_x E[\log(1+x^\top R)]
   $$
   in the i.i.d. one-period formulation, or equivalently maximizes the long-run almost-sure growth rate
   $$
   \lim_{T\to\infty}\frac{1}{T}\log W_T
   $$
   when the same opportunity set repeats through time.

2. **First-order condition**

   For an interior optimum $x^\star$, the FOC is
   $$
   E\!\left[\frac{R_i}{1+x^{\star\top}R}\right]=0
   \qquad \forall i.
   $$
   This is the exact Kelly optimality condition. It reflects that marginal reallocation across assets must leave expected log growth unchanged at the optimum.

3. **Core properties**

   The chapter emphasizes several classic results:

   - **myopia:** the growth-optimal strategy is myopic under broad conditions;
   - **proportionality:** investment is proportional to current wealth;
   - **log-utility equivalence:** the growth-optimal strategy is implied by, and implies, logarithmic utility in the standard expected-utility framework;
   - **asymptotic dominance:** under suitable conditions, no other significantly different strategy matches its long-run growth rate.

4. **Breiman-style dominance**

   One of the key theorems, due originally to Breiman, is that if a positive long-run growth opportunity exists, the growth-optimal strategy asymptotically dominates any other strategy in the sense that the wealth ratio of any other admissible strategy to the growth-optimal strategy tends to zero almost surely, unless the alternative is asymptotically equivalent. This is the mathematical core of the Kelly criterion’s reputation.

5. **Capital growth versus expected utility**

   The chapter is careful not to overclaim. Growth optimality is not a universal welfare criterion. It corresponds to logarithmic utility, and investors with different curvature may rationally choose different portfolios despite lower long-run growth. The chapter therefore distinguishes:

   - maximizing almost-sure capital growth;
   - maximizing expected utility of terminal wealth;
   - mean-variance approximations.

6. **Relation to mean-variance**

   The chapter stresses that the growth-optimal portfolio need not coincide with the mean-variance optimum, because the Kelly problem depends on all moments through $\log(1+x^\top R)$, not just mean and variance. Mean-variance can sometimes approximate Kelly locally or sequentially, but it is not equivalent except in special cases.

7. **Tradeoffs with security**

   A recurring practical theme is that full Kelly can be too aggressive. The chapter reviews strategies that mix cash and the growth-optimal portfolio, generating growth-security tradeoffs. The chapter explicitly calls these fractional Kelly strategies and discusses existing applications; they are not merely predecessors of a later unnamed rule.

8. **Proof logic**

   The derivations are standard:

   - define wealth recursively;
   - convert multiplicative wealth growth into additive log growth;
   - solve the one-step log-growth problem;
   - invoke law-of-large-numbers style arguments and Breiman-type theorems for long-run dominance.

   The chapter is a survey, so many proofs are summarized rather than rederived, but the logical structure is explicit.

# 5. Domain of applicability

- The theory applies to **repeated investment under multiplicative wealth dynamics**.
- It is strongest when long-run growth is the relevant objective and ruin avoidance matters.
- The chapter does not claim that Kelly is the correct criterion for all investors; it is explicit that growth optimality is only one point in the space of admissible preferences.
- The results are less directly applicable when leverage, drawdown, financing frictions, or nonstationary opportunities dominate the problem.


## 6. The exact dynamic budget and the role of admissibility

The chapter allows a risk-free asset, borrowing, and short sales in specified securities. If $r_{1t}$ is the safe rate, $r_{it}$ the risky net returns, and $x_{it}=z_{it}/w_{t-1}$ the risky dollars divided by beginning wealth, then

$$
w_t=w_{t-1}R_t(x_t),\qquad
R_t(x_t)=1+r_{1t}+\sum_{i=2}^{M_t}(r_{it}-r_{1t})x_{it}.
$$

Cash receives the residual allocation. The solvency requirement is $P(w_t>0)=1$ in every period, and short-sale restrictions apply to assets outside the permitted set. The perfect-market assumptions include no taxes, no transaction costs, divisibility of positions, price taking, and full use of short-sale proceeds. These assumptions are part of the theorem's environment, not inconsequential implementation details.

The “no-easy-money” condition is stronger and more uniform than a casual statement that the mean return is finite. In every normalized feasible risky direction there is a probability bounded away from zero of an adverse excess payoff of nontrivial magnitude. Together with bounded expected returns and solvency, it rules out unlimited profitable scaling and supports existence of the optimum. The chapter additionally assumes a favorable opportunity set, including a nonnegative safe rate and a positive expected excess return for some asset.

Log wealth satisfies

$$
\ln(w_T/w_0)=\sum_{t=1}^T\ln R_t(x_t).
$$

Consequently the relevant growth object is the average of expected log returns, under the law-of-large-numbers conditions, rather than the expected arithmetic return. In a stationary environment the sign of $E\ln R$ separates exponentially growing wealth from wealth tending to zero. In a nonstationary environment the chapter uses conditions bounded away from zero for sufficiently late periods. A positive arithmetic mean alone is insufficient.

The interior first-order condition, with risky returns measured relative to the safe asset, is

$$
E_{t-1}\left[\frac{r_{it}-r_{1t}}{R_t(x_t^*)}\right]=0.
$$

At binding constraints this becomes a set of directional inequalities. The denominator places a large marginal value on payoffs in states where the overall portfolio is poor. Thus the criterion contains a portfolio hedge effect even when each asset is described by the same expected return. Strict concavity produces a unique optimal payoff distribution; redundant securities can leave multiple weight vectors implementing it.

## 7. Two examples that separate growth from other objectives

The first example has a safe return of 5% and a risky return equal to either +100% or −60%, each with probability one half. The risky investment has an arithmetic mean return of 20%, but its long-run gross geometric return is

$$
\sqrt{2\times0.4}=\sqrt{0.8},
$$

so its compound return is approximately −10.55% per period. Expected wealth grows at 20% per period while typical wealth tends to zero. The chapter emphasizes that expected wealth can diverge even as the median and mode tend to zero and the probability of ending below a fixed small sum tends to one. A thin but very long upper tail accounts for the apparent contradiction.

The second example addresses the claim that risk aversion is sufficient to make long-run investment safe. The safe rate is 2%, and the risky asset returns −8.2% with probability 0.9 or +206% with probability 0.1. Maximizing square-root utility calls for a risky fraction of about 1.5792, financed by borrowing 0.5792 of wealth. Although the utility is increasing and concave, this allocation has an asymptotic compound return of approximately −0.756% per period. It can therefore maximize the specified expected utility and still drive capital toward zero almost surely.

These examples do not refute expected utility. They refute the inference that maximizing any risk-averse expected utility necessarily maximizes capital growth, or that increasing expected utility must mean increasing typical long-run wealth.

## 8. Myopia, proportionality, and turnpikes are different claims

With logarithmic preferences and a frictionless reinvestment problem, multiplying current wealth by a positive scalar adds a constant to log utility. The optimal fractions are therefore independent of the wealth level, and optimal dollar positions scale in proportion to wealth. This proportionality does not mean fixed weights across time: current conditional opportunities can change, leading to different optimal fractions.

The myopia property says that, given the current information state and one-period return distribution, the optimal current growth allocation need not hedge changes in future investment opportunities. The chapter emphasizes that log optimality retains this property in a Markov economy. Other isoelastic utilities also have myopic proportional policies when returns are independent over time, but they generally lose the same simple property when investment opportunities are state dependent.

For power utility $u(w)=w^\gamma/\gamma$, $\gamma<1$, the logarithmic case is the limit $\gamma\to0$. Relative risk aversion is $1-\gamma$. Under independent returns, dynamic programming preserves the power functional form up to positive scaling and an additive constant. A much broader class of terminal utilities has long-horizon limiting behavior associated with an isoelastic member under the stated turnpike conditions.

The important qualification is that the limiting family contains many risk-aversion parameters. A distant horizon does not force every investor to become a log investor. Log utility is one member of the family. Likewise, almost-sure eventual wealth dominance does not imply expected-utility dominance. For negative powers, very small lower-tail differences can dominate expected utility; for positive powers, rare upper-tail outcomes can matter enough to reverse a typical-wealth comparison.

## 9. Consumption, labor income, and payment obligations

Once consumption $c_t$ is removed and labor income $Y_t$ is added, the budget becomes

$$
w_t=\sum_{i=2}^{M_t}(r_{it}-r_{1t})z_{it}
+(1+r_{1t})(w_{t-1}-c_t)+Y_t.
$$

The investor maximizes expected utility of a consumption stream, often assumed additively separable with discount factors, possibly with terminal bequest. The Bellman recursion is then jointly over consumption and investments. Under deterministic labor income and interest rates, the present value of future labor income can be incorporated as human wealth. With isoelastic preferences, consumption and risky holdings scale with financial wealth plus that present value.

The log consumer invests the available invested funds according to the growth-optimal rule in the tractable model. But stochastic income, unhedgeable obligations, random interest rates, or borrowing restrictions can destroy the simple equivalence between financial wealth and capitalized income. The chapter points toward multistage stochastic programming in those cases. It does not establish a general rule to apply unconstrained Kelly fractions to financial assets while ignoring liabilities and human capital.

## 10. What “growth versus security” means

The chapter distinguishes several growth measures: expected wealth at a date, expected compound growth, and expected first-passage time to a target. It separately distinguishes security measures: probability of reaching a target by a date, probability of remaining above a prescribed wealth path, and probability of reaching an upper target before a lower boundary. Those objectives are not interchangeable and need not select the same allocation.

A fractional Kelly policy mixes the full growth-optimal portfolio with cash. Reducing the fraction typically sacrifices growth and improves the selected security measures in the stationary models studied. However, the chapter explicitly warns that these easily computed tradeoffs are generally **not efficient in discrete time**: some other portfolio can deliver greater security at the same growth constraint. It is therefore too strong to describe every fractional-Kelly rule as an optimal drawdown solution.

In a diffusion model with constant opportunities, write the excess-drift vector as $a$ and covariance as $\Sigma$. The instantaneous log-growth objective is

$$
g(x)=r+x'a-\frac12x'\Sigma x,
\qquad x_K=\Sigma^{-1}a.
$$

For a fraction $c$ of the Kelly risky exposure,

$$
g(cx_K)-r=(c-\tfrac12c^2)a'\Sigma^{-1}a.
$$

This reconstruction explains the familiar local growth–risk tradeoff: scaling exposure reduces volatility linearly, while the growth sacrifice near full Kelly is second order. It is exact in this diffusion model, not a universal formula for discrete heavy-tailed returns. The chapter's continuous-time discussion links such portfolios to mean-variance efficiency and two-fund separation.

## 11. Mean-variance approximation: regime and failure mode

For small risky returns, a Taylor expansion of the logarithm leads to a quadratic approximation. But a normal distribution for *discrete-period simple returns* has unbounded negative support. With strict almost-sure solvency and a safe asset, any nonzero exposure to a nondegenerate normal risky payoff creates a positive probability of negative wealth. The chapter therefore notes the extreme implication that exact log optimization in that setup can select only the safe asset. This is a support problem, not a claim that diffusion Kelly portfolios cannot hold risk.

As trading intervals shrink in a continuous-path model, instantaneous first and second moments dominate and finite-horizon compounded payoffs can remain positive and lognormal. Mean-variance equivalence there has a different foundation. In empirical comparisons reviewed by the chapter, quarterly mean-variance approximations tracked power-utility policies well, while annual revisions could produce very different holdings and outcomes for more risk-averse investors. Horizon and tail behavior determine whether a quadratic approximation is adequate.

## 12. Applications and the strength of their evidence

The chapter reviews historical asset-allocation applications using empirical joint distributions, including US stocks, bonds, bills, small stocks, international assets, real estate, and industry portfolios. In one domestic study with quarterly revisions and a 32-quarter estimation window applied over 1934–1992, the leveraged growth strategy earned nearly 15% annual compound growth. A global application with leverage reported about 27% over 1970–1986. These are results cited from the underlying studies, under their historical universes and implementation assumptions; they are not new controlled tests conducted within this chapter or reliable forward-looking return estimates.

The reviewed gambling applications make the scale of admissible stakes concrete. A simplified even-money blackjack opportunity with a 2% edge suggests a full-Kelly stake of about 2% of bankroll, while professional teams are described as using fractions of Kelly. Favorable lottery opportunities can justify stakes below one millionth of wealth because payoff variance is enormous. An index-futures implementation of a historical turn-of-year opportunity led to an estimated full-Kelly allocation near 74%, motivating fractional sizing. These examples demonstrate that edge alone does not determine a prudent dollar stake.

The chapter also reviews multistage models with transaction costs and price impact. In that setting a myopic rule can be inefficient because today's trade changes future trading costs. A practical application must jointly specify the return distribution, solvency and financing constraints, rebalancing frequency, costs, and the chosen definition of security. Growth optimality supplies a coherent objective; it does not eliminate those modeling decisions.
