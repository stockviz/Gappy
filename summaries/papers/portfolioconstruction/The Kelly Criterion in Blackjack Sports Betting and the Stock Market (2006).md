# 1. Metadata

- **Title:** The Kelly Criterion in Blackjack, Sports Betting, and the Stock Market
- **Author(s):** Edward O. Thorp
- **Year:** 2006
- **Journal/Venue:** review chapter / survey article

# 2. Problem statement

The paper asks: **what exact betting and portfolio formulas does the Kelly criterion imply in simple favorable games and in capital markets, and how should one think about the trade-off between long-run growth optimality and short-run drawdown risk?**

# 3. Approach (short)

The paper is an applied survey built around expected log-wealth maximization. Thorp starts from repeated favorable gambles, derives the familiar Kelly fraction in simple cases, studies finite-horizon probabilities such as hitting a goal or suffering a drawdown, then extends the same logic to securities and multi-asset portfolios. It is partly expository and partly cautionary: full Kelly is growth-optimal, but fractional Kelly can be preferable for finite-horizon risk control and parameter uncertainty.

# 4. Approach (detailed)

1. **Single favorable binary bet**

   Suppose a fraction $f$ of wealth is wagered on a game that wins with probability $p$, loses with probability $q=1-p$, and pays odds $b:1$. Wealth multipliers are $1+bf$ on a win and $1-f$ on a loss. Expected log growth is
   $$
   g(f)=p\log(1+bf)+q\log(1-f).
   $$
   Differentiating,
   $$
   g'(f)=\frac{pb}{1+bf}-\frac{q}{1-f}.
   $$
   Setting $g'(f)=0$ yields the Kelly fraction
   $$
   f^\star=\frac{bp-q}{b}.
   $$
   For even-money bets ($b=1$), this reduces to $f^\star=p-q=2p-1$.

2. **Long-run optimality**

   With independent repetitions, the asymptotic exponential growth rate of wealth equals $g(f)$. Since $g$ is strictly concave, $f^\star$ uniquely maximizes long-run growth. This is the core Kelly theorem. Thorp emphasizes that the criterion is period-by-period log optimization, hence automatically horizon-consistent under iid repetition.

3. **Finite-horizon risk quantities**

   A large part of the chapter studies probabilities not captured by $g(f)$, such as:
   - reaching a target wealth by time $n$;
   - ever dropping below a specified fraction of initial wealth;
   - ending above a threshold after $n$ plays;
   - expected time to hit a goal.

   The point is conceptual: Kelly dominates asymptotically, but investors often care about pathwise events. The paper develops approximations for these quantities and shows that higher-than-Kelly staking sharply worsens drawdown probabilities.

4. **Fractional Kelly**

   If one uses $f=\alpha f^\star$ with $0<\alpha<1$, growth falls below the maximum, but variance and drawdown risk fall more than proportionally in many examples. The chapter argues that fractional Kelly is sensible when:
   - probabilities or expected returns are estimated with error;
   - leverage or ruin constraints matter;
   - investor utility is less risk tolerant than log utility over the relevant horizon.

5. **Continuous-time / stock-market approximation**

   In capital markets, if risky returns have mean excess return $\mu-r$ and variance $\sigma^2$, the approximate Kelly leverage in one risky asset is
   $$
   f^\star \approx \frac{\mu-r}{\sigma^2}.
   $$
   In multi-asset form, the continuous-time Merton/Kelly allocation is
   $$
   w^\star=\Sigma^{-1}(\mu-r\mathbf 1),
   $$
   up to the normalization implied by the chosen cash account. Thorp treats this as the market analogue of the simple favorable-bet formula.

6. **Why Kelly eventually dominates**

   If $g(f^\star)>g(f)$ for another fixed-fraction strategy $f$, then
   $$
   \frac{1}{n}\log\frac{W_n(f^\star)}{W_n(f)}\to g(f^\star)-g(f)>0
   \quad\text{a.s.}
   $$
   Hence
   $$
   \frac{W_n(f^\star)}{W_n(f)}\to\infty
   \quad\text{a.s.}
   $$
   This is the basic proof of long-run dominance: it is a law-of-large-numbers consequence of maximizing expected log wealth.

7. **Portfolio case study logic**

   In the case study sections, the paper applies the same framework to a portfolio of securities under practical constraints. The decision rule is still “maximize expected log wealth subject to admissibility,” but the realistic frictions and uncertainty motivate using less than full Kelly.

# 5. Domain of applicability

The chapter applies wherever repeated favorable bets or rebalanced risky portfolios can be approximated by multiplicative wealth dynamics. Its exact formulas are strongest for independent repeated gambles and for Gaussian/continuous-time approximations in securities. The long-run dominance theorem is exact under repeated favorable opportunities with fixed distribution. The main caveat, stressed by Thorp himself, is that finite-horizon drawdowns, leverage limits, and estimation error can make full Kelly too aggressive for real investors even when its asymptotic theorem is correct.
