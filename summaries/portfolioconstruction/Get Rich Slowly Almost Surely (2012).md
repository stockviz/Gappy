# Get Rich Slowly Almost Surely

**Source:** [UniversalPortfolios_Benko_2012.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_Benko_2012.pdf>)  
**Source coverage:** all eleven PDF pages, including the finite-horizon examples and the discussion of fractional Kelly.

## 1. Metadata

- **Title:** Get Rich Slowly, Almost Surely
- **Author(s):** David Benko
- **Year:** 2012
- **Journal/Venue:** *The Mathematical Gazette*

## 2. Problem statement

The paper asks a pedagogical but mathematically precise question: **under a geometric-Brownian-motion model for stock prices, when does a buy-and-hold stock position almost surely outperform bonds in relative terms, and how can constant-mix rebalancing generate positive almost-sure growth even when buy-and-hold fails?**

## 3. Approach (short)

The method is continuous-time stochastic-process analysis. Benko models stock prices as geometric Brownian motion, studies the stock’s wealth relative to the bond account, invokes the law of the iterated logarithm to determine almost-sure asymptotics, and then compares buy-and-hold with a constant-mix strategy chosen by maximizing expected log wealth.

## 4. Approach (detailed)

1. **Relative stock wealth under GBM**

   Let the stock price follow
   $$
   S_t = S_0 \exp\!\left(\left(R-\frac{\sigma^2}{2}\right)t+\sigma W_t\right),
   $$
   and let the bond account be
   $$
   B_t=B_0 e^{rt}.
   $$
   Relative wealth is
   $$
   \mathrm{Rel}(t)=\frac{S_t/B_t}{S_0/B_0}
   =
   \exp\!\left(\left(R-r-\frac{\sigma^2}{2}\right)t+\sigma W_t\right).
   $$

2. **Almost-sure asymptotics of buy-and-hold**

   Since $W_t/t\to 0$ almost surely (and more sharply by the law of the iterated logarithm), the linear drift term determines the sign of $\log \mathrm{Rel}(t)$. Therefore:
   $$
   \mathrm{Rel}(t)\to\infty \ \text{a.s. if } R-r-\frac{\sigma^2}{2}>0,
   $$
   $$
   \mathrm{Rel}(t)\to 0 \ \text{a.s. if } R-r-\frac{\sigma^2}{2}<0.
   $$
   This is the central proposition of the paper.

3. **Interpretation**

   The threshold is not the raw equity premium $R-r$, but the premium net of the variance drag $\sigma^2/2$. Thus a stock can have positive expected arithmetic excess return yet still almost surely lose to bonds in long-run relative wealth.

4. **Constant-mix strategy**

   Let a fraction $p$ be continuously maintained in the risky asset and $1-p$ in the bond. The relative wealth process of this rebalanced strategy is again geometric Brownian motion with drift
   $$
   p(R-r)-\frac12 p^2\sigma^2.
   $$
   Maximizing this drift gives
   $$
   p^\star=\min\{1,\max\{0,(R-r)/\sigma^2\}\},
   $$
   the continuous-time Kelly/Merton fraction in the one-risky-one-riskless setup.

5. **Positive drift from rebalancing**

   Substituting $p^\star$ gives maximal drift
   $$
   \frac{(R-r)^2}{2\sigma^2}>0
   $$
   for the interior optimum when $0<R-r\le\sigma^2$; when the no-borrowing bound binds, the appropriate growth rate is $R-r-\sigma^2/2$. Hence the constant-mix strategy can have positive almost-sure relative-growth drift even in cases where buy-and-hold has negative drift $R-r-\sigma^2/2<0$. This is the “huge surprise” highlighted in the article.

6. **Proof sketch**

   The buy-and-hold result is immediate from
   $$
   \log\mathrm{Rel}(t)=\left(R-r-\frac{\sigma^2}{2}\right)t+\sigma W_t
   $$
   and the sublinear growth of Brownian motion. The constant-mix result follows by writing the self-financing wealth SDE, applying Itô’s lemma to $\log W_t$, and optimizing the drift with respect to $p$.

## 5. Domain of applicability

The paper applies to the simple Black-Scholes-style world of one risky asset and one bond with continuous rebalancing and constant parameters. Its almost-sure asymptotic statements are exact in that model. Changes such as transaction costs, time-varying parameters, or jumps require a new analysis; the displayed theorem is not a guarantee for those settings. The pedagogical value is high: it cleanly separates arithmetic expectation from almost-sure long-run growth and shows why rebalancing can matter.


## 6. The distinctions needed to read the result correctly

The article is a mathematical exposition in *The Mathematical Gazette* 96(536), July 2012, pp. 226-235. It supplies no investment backtest or estimated equilibrium model. Its useful contribution is a transparent example in which expected wealth and almost-sure wealth growth give different answers. The source writes the log-price drift as $\mu$ and defines the arithmetic drift $R=\mu+\sigma^2/2$. Confusing these two drifts would remove the central variance correction.

Set $a=R-r$. For one dollar invested in the stock and measured in units of the bond account,
$$
Y_t=\exp\{(a-\sigma^2/2)t+\sigma W_t\}.
$$
Its expectation, median, and asymptotic log-growth rate are different objects:
$$
E[Y_t]=e^{at},\qquad
\operatorname{median}(Y_t)=e^{(a-\sigma^2/2)t},\qquad
\lim_{t\to\infty}\frac{\log Y_t}{t}=a-\frac{\sigma^2}{2}\quad\text{a.s.}
$$
For $0<a<\sigma^2/2$, expected relative wealth diverges while relative wealth converges to zero on almost every path. Rare, increasingly extreme outcomes support the growing expectation. One cannot interchange the almost-sure limit and the expectation here; there is no contradiction.

The law of the iterated logarithm supplies a stronger bound than is needed for the two strict cases: $W_t/t\to0$ already proves them. At the omitted boundary $a=\sigma^2/2$ and $\sigma>0$, the log-relative process is driftless Brownian motion. Its limsup is $+\infty$ and liminf is $-\infty$; consequently $Y_t$ has limsup $+\infty$ and liminf zero. Zero asymptotic log-growth is not convergence to a stable wealth ratio. This boundary statement is a mathematical clarification of the source's two-case proposition.

### Finite-horizon probabilities

For a fixed horizon $T$, log-relative wealth is normal. If $0<c<d$,
$$
P(c<Y_T<d)=\Phi\!\left(\frac{\log d-(a-\sigma^2/2)T}{\sigma\sqrt T}\right)
-\Phi\!\left(\frac{\log c-(a-\sigma^2/2)T}{\sigma\sqrt T}\right).
$$
In particular,
$$
P(Y_T<1)=\Phi\!\left(-\frac{(a-\sigma^2/2)\sqrt T}{\sigma}\right).
$$
A positive asymptotic drift only says this probability tends to zero. At an economically relevant horizon it can remain large. The article illustrates $a=0.038$ and $\sigma=0.20$, giving a log-relative drift of 0.018. With $T=20$, the probability of finishing between one and two units of relative wealth is about 0.30. These are assumptions used in the illustration, not current parameter estimates or a forecast.

## 7. Deriving the self-financing rebalancing rule

Let $V_t$ be wealth and maintain a constant stock fraction $p$. Self financing gives
$$
\frac{dV_t}{V_t}=(r+pa)dt+p\sigma\,dW_t.
$$
Applying Ito's formula and subtracting the bond growth rate,
$$
\log\frac{V_T}{V_0e^{rT}}
=\left(pa-\frac12p^2\sigma^2\right)T+p\sigma W_T.
$$
Thus the growth function $g(p)=pa-p^2\sigma^2/2$ is strictly concave. The unconstrained optimizer is $a/\sigma^2$, but the article explicitly disallows borrowing and restricts $0\le p\le1$. Its operational rule is therefore
$$
p^*=\min\{1,\max\{0,a/\sigma^2\}\}.
$$
Under the source's standing assumption $a>0$, the lower clipping does not bind. If $0<a\le\sigma^2$, the optimal relative growth is $a^2/(2\sigma^2)>0$. If $a>\sigma^2$, the optimal feasible fraction is one and relative growth is $a-\sigma^2/2>0$. This is why the source obtains positive asymptotic growth for every strictly positive premium without relying on leverage. The formula $a^2/(2\sigma^2)$ is not valid for the clipped endpoint when $a>\sigma^2$.

The benefit when $a<\sigma^2/2$ comes from reducing the volatility exposure: expected excess return is linear in $p$, but the variance drag is quadratic. It is not a claim that any volatile asset yields a free rebalancing gain. For $a=0$, the constrained optimum is cash, and every $p>0$ has negative relative log-growth. For $a<0$, a positive growth solution would require a short position excluded from the paper's admissible range.

The wealth dynamics also explain why a portfolio can succeed while the relative value of each permanently held stock dollar eventually disappears. The constant-mix investor does not leave each original stock dollar untouched. Trading continually transfers wealth between the risky asset and the bond account. The relevant object is the self-financing wealth process of the strategy, not the sum of counterfactual buy-and-hold positions.

## 8. Fractional Kelly, numerical examples, and qualifications

For an interior Kelly fraction and $0\le f\le1$, use $p=fp^*$. Direct substitution gives
$$
g(fp^*)=(2f-f^2)g(p^*),\qquad
\operatorname{Var}\!\left(\log\frac{V_T}{V_0e^{rT}}\right)=f^2(p^*)^2\sigma^2T.
$$
Half Kelly retains 75% of the optimal log-growth while reducing the log-wealth variance to one-quarter. This is an explicit derivation from the model, not a separately estimated result in the paper. With the source's illustrative premium and volatility, the full fraction is 0.95. Benko emphasizes that even this mathematically optimal rule can be too risky over an ordinary human investment horizon.

The source compares a 50/50 constant-mix policy with a partially invested buy-and-hold position over 40 years. It reports approximate downside probabilities of 9% and 12%, but the text's matching of expected wealth is arithmetically problematic. If the constant-mix expected relative wealth is $e^{0.5aT}$, then a buy-and-hold portfolio with stock fraction $q$ has expected relative wealth $1-q+qe^{aT}$. Equal expectations require
$$
q=\frac{e^{0.5aT}-1}{e^{aT}-1},
$$
which is about 0.319 for $a=0.038$, $T=40$, rather than the source's approximately 0.47. The published comparison therefore should not be reproduced as a verified equal-expected-return dominance result. The exact lognormal distribution formulas are the reliable way to construct a new comparison.

The article also speculates that a preference for more stock risk should imply $a=\sigma^2$. That conclusion needs an additional boundary indifference or first-order condition. For log utility on $[0,1]$, an all-stock optimum alone implies $a\ge\sigma^2$, not equality. This discussion is intuition, not an equilibrium derivation of the equity premium. The accompanying diversification story about access to an independent economy is likewise an illustration of the value of lower correlation, not an empirically tested pricing model.

Finally, leveraged funds illustrate why daily leverage does not translate into the same multiple of long-horizon compound returns. In this diffusion model the variance drag grows quadratically with leverage. Actual fund returns also reflect financing, fees, tracking, and discrete rebalancing. The article's borrowing-game anecdote presumes repeated access to credit and does not supply a solvency theorem. None of these stories turns an asymptotic almost-sure result into a finite-horizon guarantee.
