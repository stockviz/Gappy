# 1. Metadata

- **Title:** Get Rich Slowly, Almost Surely
- **Author(s):** David Benko
- **Year:** 2012
- **Journal/Venue:** *The Mathematical Gazette*

# 2. Problem statement

The paper asks a pedagogical but mathematically precise question: **under a geometric-Brownian-motion model for stock prices, when does a buy-and-hold stock position almost surely outperform bonds in relative terms, and how can constant-mix rebalancing generate positive almost-sure growth even when buy-and-hold fails?**

# 3. Approach (short)

The method is continuous-time stochastic-process analysis. Benko models stock prices as geometric Brownian motion, studies the stock’s wealth relative to the bond account, invokes the law of the iterated logarithm to determine almost-sure asymptotics, and then compares buy-and-hold with a constant-mix strategy chosen by maximizing expected log wealth.

# 4. Approach (detailed)

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
   p^\star=\frac{R-r}{\sigma^2},
   $$
   the continuous-time Kelly/Merton fraction in the one-risky-one-riskless setup.

5. **Positive drift from rebalancing**

   Substituting $p^\star$ gives maximal drift
   $$
   \frac{(R-r)^2}{2\sigma^2}>0
   $$
   whenever $R\ne r$. Hence the constant-mix strategy can have positive almost-sure relative-growth drift even in cases where buy-and-hold has negative drift $R-r-\sigma^2/2<0$. This is the “huge surprise” highlighted in the article.

6. **Proof sketch**

   The buy-and-hold result is immediate from
   $$
   \log\mathrm{Rel}(t)=\left(R-r-\frac{\sigma^2}{2}\right)t+\sigma W_t
   $$
   and the sublinear growth of Brownian motion. The constant-mix result follows by writing the self-financing wealth SDE, applying Itô’s lemma to $\log W_t$, and optimizing the drift with respect to $p$.

# 5. Domain of applicability

The paper applies to the simple Black-Scholes-style world of one risky asset and one bond with continuous rebalancing and constant parameters. Its almost-sure asymptotic statements are exact in that model. They are not robust to transaction costs, time-varying parameters, leverage constraints, or fat tails. The pedagogical value is high: it cleanly separates arithmetic expectation from almost-sure long-run growth and shows why rebalancing can matter.
