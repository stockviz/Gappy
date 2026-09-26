# Optimal Leverage from Non-Ergodicity (2010)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_Peters_2010.pdf>), 17 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Optimal Leverage from Non-Ergodicity
- **Author(s):** Ole Peters
- **Year:** 2010
- **Journal/Venue:** Published article / preprint version in the file

# 2. Problem statement

The paper asks how leverage should be chosen when one distinguishes between **ensemble-average** and **time-average** growth in multiplicative wealth dynamics. The precise question is: **for a self-financing levered portfolio following geometric Brownian motion, what leverage maximizes the time-average growth rate, and why does this differ from the leverage suggested by expected-return calculations?**

# 3. Approach (short)

The method is stochastic calculus plus ergodicity analysis. Peters models levered portfolios as geometric Brownian motions, computes both the ensemble-average growth rate and the time-average growth rate, and argues for the latter as the relevant objective for long-run self-financing wealth accumulation. Ito’s lemma yields a concave time-average growth function with a finite maximizing leverage, which is exactly the continuous-time Kelly rule.

# 4. Approach (detailed)

1. **Levered geometric Brownian motion**

   Suppose an excess-return opportunity has drift $\mu$ and volatility $\sigma$. A self-financing levered portfolio with leverage $l$ has return process
   $$
   \frac{dW_t}{W_t} = l\mu\,dt + l\sigma\,dB_t.
   $$
   This is the continuous-time analogue of repeatedly betting a fraction $l$ on the risky opportunity.

2. **Ensemble-average growth**

   The expected infinitesimal return of wealth is
   $$
   E\!\left[\frac{dW_t}{W_t}\right] = l\mu\,dt.
   $$
   This quantity grows linearly in leverage and therefore never penalizes excessive leverage on its own.

3. **Time-average growth**

   Apply Itô’s lemma to $\log W_t$:
   $$
   d\log W_t = \left(l\mu - \frac12 l^2\sigma^2\right)dt + l\sigma\,dB_t.
   $$
   Hence the time-average growth rate is
   $$
   g(l)= l\mu - \frac12 l^2\sigma^2.
   $$
   This is the relevant long-run growth rate of a single investor’s realized wealth path.

4. **Optimal leverage**

   Maximizing $g(l)$ gives
   $$
   g'(l)=\mu-l\sigma^2=0
   \quad\Rightarrow\quad
   l^\star = \frac{\mu}{\sigma^2}.
   $$
   This is the optimal leverage. The critical leverage at which time-average growth falls to zero is
   $$
   l_{crit} = \frac{2\mu}{\sigma^2}.
   $$
   Beyond this point, expected wealth may still rise in ensemble average while the typical time-path shrinks.

5. **Interpretation**

   The quadratic penalty $-\tfrac12 l^2\sigma^2$ is the non-ergodicity correction. Ensemble averages ignore the pathwise compounding cost of volatility; time averages do not.

6. **Relation to Kelly and mean-variance**

   The result is a continuous-time Kelly rule. It also picks a point on the efficient frontier, but unlike mean-variance theory it does not rely on an externally chosen utility parameter. The leverage follows from the time-average growth criterion itself.

7. **Proof logic**

   The proof is one line of Itô calculus plus one line of optimization:

   - compute $d\log W_t$;
   - identify the drift as time-average growth;
   - maximize the drift with respect to $l$.

   The conceptual contribution is not algebraic difficulty but the insistence that the correct average for a multiplicative process is the time average, not the ensemble average.

# 5. Domain of applicability

- The result applies to **self-financing portfolios with geometric-Brownian-like multiplicative dynamics**.
- It is strongest as a critique of naive expected-return reasoning under leverage.
- The exact formulas rely on the GBM model. With jump risk, borrowing frictions, or drawdown constraints, the optimal leverage changes.
- The paper’s broad claim is about non-ergodicity; the explicit leverage formula is model-specific.


# 6. Full source interpretation and extensions needed for implementation

## 6.1 Bibliographic identity and claim discipline

The seventeen-page local file is arXiv:0902.2965v2, dated August 9, 2010, with a manuscript history showing receipt in February 2009 and final form in June 2010. It studies self-financing continuously rebalanced portfolios with geometric Brownian dynamics and zero transaction costs. Its algebra reproduces the continuous-time log-optimal leverage rule; its distinctive emphasis is the difference between ensemble and time averages.

The mathematical difference between these averages is exact. The assertion that every investor therefore ought to maximize long-run time-average growth is an interpretation. Investors with finite-horizon liabilities, consumption, other preferences, or nonlinear rewards have different objective functions. The source itself describes growth maximization as a default or null model and recognizes that personal circumstances require additional information.

## 6.2 Two limits applied to one observable

For unlevered wealth

$$
\frac{dW_t}{W_t}=\mu\,dt+\sigma\,dB_t,
\qquad
\frac{W_T}{W_0}=\exp[(\mu-\sigma^2/2)T+\sigma B_T].
$$

The source defines an estimator using $N$ independent realizations:

$$
\widehat g(T,N)=\frac1T\log\left[
\frac1N\sum_{i=1}^N\frac{W_T^{(i)}}{W_0}\right].
$$

The order of operations is important: average wealth first, then take its logarithm. For fixed $T$ and $N\to\infty$, the law of large numbers gives the average payoff $e^{\mu T}$, so $\widehat g\to\mu$. With one path and $T\to\infty$,

$$
\widehat g(T,1)=\mu-\frac12\sigma^2+\sigma\frac{B_T}{T}
\longrightarrow\mu-\frac12\sigma^2\quad\text{a.s.}
$$

A precise pathwise justification is $B_T/T\to0$ almost surely. Brownian scaling $B_T\overset d=\sqrt T B_1$ explains the distributional scale of the error but is not itself an equality of one sample path across different dates. This qualification improves the source's informal scaling argument.

For any fixed finite number of independent paths, the asymptotic logarithmic growth of their sum also has the latter rate, whereas taking an infinite ensemble first yields $\mu$. This is the noncommutation relevant to the paper. It does not mean expectations are mathematically invalid; it means the expected wealth and the typical long-run realized growth answer different questions.

## 6.3 Why mean wealth can grow while almost every path shrinks

The expectation is $E W_T=W_0e^{\mu T}$. The median is $W_0e^{(\mu-\sigma^2/2)T}$. If $0<\mu<\sigma^2/2$, the expected level grows but $W_T\to0$ almost surely as time increases. Rare large outcomes account for an increasing share of the expectation.

In Figure 2, the source uses $\mu=0.05$ and $\sigma=0.45$ per stated time unit. The log-growth rate is approximately $-0.05125$, even though arithmetic drift is positive. The figure is a simulated illustration of this model, not evidence that a particular traded portfolio has those stable parameters.

The model never reaches exactly zero wealth at a finite time. That property does not make it safe: asymptotic decline, arbitrarily deep drawdowns, and practical margin or liability failures can occur while mathematical wealth remains positive.

## 6.4 Financing and the correct leveraged formula

Let the lending and borrowing rate both equal $r$, and let the risky asset have drift $\mu_M$ and volatility $\sigma_M$. Define excess drift $a=\mu_M-r$. A constantly rebalanced risky exposure $l$ gives

$$
\frac{dW_t}{W_t}=(r+la)\,dt+l\sigma_M\,dB_t,
$$

$$
g(l)=r+la-\frac12l^2\sigma_M^2.
$$

Thus

$$
l^*=\frac a{\sigma_M^2},\qquad
 g(l^*)=r+\frac{a^2}{2\sigma_M^2}.
$$

The original short summary set $r=0$ implicitly. Under that convention $2l^*$ is where total growth becomes zero. With $r\ne0$, double Kelly instead gives $g(2l^*)=r$, so it eliminates excess growth over cash. The roots of **total** growth are

$$
l_\pm=l^*\pm\sqrt{(l^*)^2+2r/\sigma_M^2}.
$$

For the source's Figure 1 parameters $r=0.05$, $\mu_M=0.10$, and $\sigma_M=0.18$, optimal leverage is about 1.54 and the positive zero-total-growth root is about 3.88. Those are illustrative parameter calculations. Treating 3.88 and $2\times1.54$ as contradictory confuses the cash baseline with zero growth.

For a mandate restricting $l$ to a closed interval, concavity means the constrained optimum is the projection of $l^*$ onto that interval. If borrowing carries a higher rate than lending, the objective becomes piecewise quadratic with a kink at $l=1$. The frictionless formula must then be recomputed on each financing region.

## 6.5 A quantitative horizon, and its limitations

For fixed leverage, the realized annualized log rate has standard deviation $|l|\sigma_M/\sqrt T$. The paper compares drift magnitude to one standard deviation and defines

$$
T_c(l)=\frac{l^2\sigma_M^2}{g(l)^2}.
$$

This is a signal-to-noise crossover, not a guaranteed minimum holding period after which investment becomes safe. At $T=T_c$, the drift has only a one-standard-deviation advantage over zero. If $g(l)>0$, an explicit model-based probability is

$$
P(W_T>W_0)=\Phi\left(\frac{g(l)\sqrt T}{|l|\sigma_M}\right).
$$

To target probability $1-\alpha$ under the same model would require

$$
T\ge z_{1-\alpha}^2\frac{l^2\sigma_M^2}{g(l)^2}.
$$

This last expression is an explanatory inference from the Gaussian model, not a separate theorem claimed in the source. It shows why a one-sigma crossover should not be marketed as high-confidence capital protection. At zero log drift the crossover diverges; with negative log drift, a finite crossover marks increasingly discernible decline.

The relevant horizon also depends on the benchmark. To evaluate outperformance of cash, use excess log drift rather than total drift. To compare two risky strategies, use the variance of their **relative** log return, including their covariance, rather than treating each strategy's standalone volatility independently.

## 6.6 Sharpe ratio selects a direction but not leverage

For positive $l$ in the frictionless model,

$$
S(l)=\frac{la}{l\sigma_M}=\frac a{\sigma_M}.
$$

The Sharpe ratio is unchanged when leverage changes, while log growth is strongly affected. Once each candidate risky portfolio is optimally scaled, however,

$$
g^*-r=\frac12S^2.
$$

Therefore Sharpe ranks optimally scaled positive-edge opportunities in this model. It cannot indicate whether the current exposure is below or above the maximizing level. This is a useful reconciliation with mean-variance theory: selecting the tangency direction and selecting its scale are separate decisions.

The source notes that $l^*=a/\sigma_M^2$ is dimensionless, whereas Sharpe has inverse-square-root-time units until an annualization convention is fixed. If drift and variance are converted consistently between daily and annual units, leverage is unchanged. Using an annual mean with daily variance would create a gross sizing error.

## 6.7 Extension to several risky assets

A transparent extension of the source's calculation uses excess-drift vector $a$ and instantaneous covariance $\Sigma$. For constant risky exposures $w$,

$$
g(w)=r+w^Ta-\tfrac12w^T\Sigma w.
$$

If $\Sigma\succ0$ and exposures are unrestricted, $w^*=\Sigma^{-1}a$. Completing the square yields

$$
g(w^*)-g(w)=\tfrac12(w-w^*)^T\Sigma(w-w^*).
$$

This derivation makes clear that growth maximization is a specific mean-variance scalarization under diffusion dynamics. It is not independent of the same covariance and expected-return estimation difficulties that affect Markowitz portfolios. With linear portfolio constraints, the maximization is a concave quadratic program; with jumps or path constraints, that convenient reduction generally fails.

The source does not perform this full multivariate estimation exercise. It studies scaling along an efficient frontier. The extension is useful for connecting its leverage lesson to a practical multi-asset optimizer while keeping the contribution of the paper properly bounded.

## 6.8 Frictions and the discussion's speculative equilibrium mechanism

The paper explicitly lists reasons frictionless optimal leverage may overstate practical leverage: continuous rebalancing, zero transaction costs, lognormal returns, known drift and volatility, and no extra borrowing premium. Market impact and available trading technology affect how well constant leverage can be maintained. Jumps can also cause bankruptcy at leverage levels that continuous diffusion keeps mathematically solvent.

Its “statistical market efficiency” discussion proposes that leverage above one may induce borrowing and investment, which increases volatility and reduces optimal leverage, while leverage below one may induce selling that raises expected returns. This is a qualitative feedback story suggesting a possible attraction toward leverage one. It is not an equilibrium theorem, a calibrated causal model of crises, or a demonstrated empirical law.

Similarly, the comments on mortgages, incentive compensation, and the 2007-2008 crisis extend the model's intuition. Real mortgages do not continuously rebalance like the model portfolio, and personal wealth may include labor income and other assets. The source's stylized leverage analogy should be identified as interpretation when used outside the mathematical setup.

## 6.9 Research use

The paper is valuable for forcing explicit specification of the growth statistic and the financing baseline. A credible leverage study should estimate expected excess log growth, incorporate parameter uncertainty and asymmetric borrowing costs, and evaluate finite-horizon drawdowns and liquidation rules. It should report the whole growth-versus-leverage curve, not just a single estimated optimum. Because the curve is locally flat near its maximum but losses grow quadratically away from it, conservative sizing can be justified by uncertainty even before imposing a separate drawdown preference.

The exact result remains simple: under constant-coefficient diffusion and frictionless self-financing rebalancing, the long-run log-growth rate is concave in leverage and is maximized at excess drift divided by variance. Non-ergodicity explains why maximizing expected wealth gives a different answer; it does not remove the need to define the investor's objective and constraints.
