# Dynamic Portfolio Analysis

[Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/[The Journal of Portfolio Management vol. 34 iss. 1] Grinold, Richard C - Dynamic Portfolio Analysis (2007) [10.3905_jpm.2007.698029] - libgen.li (1).pdf>). *Journal of Portfolio Management* 34(1), Fall 2007, pp. 12–26; the local 19-page file includes Appendices A–E. All source pages were checked.

## 1. Metadata

- **Title:** Dynamic Portfolio Analysis
- **Author(s):** Richard C. Grinold
- **Year:** 2007
- **Journal/Venue:** *Journal of Portfolio Management*

## 2. Problem statement

The paper asks how to characterize an active long-short investment process dynamically at the aggregate level. Specifically: if information decays through time, new information arrives stochastically, and trading only partially closes the gap between the desired and actual portfolio because of costs, how do information decay and trading speed jointly determine turnover, stock of positions, transfer efficiency, information age, and the optimal rate of trading?

## 3. Approach (short)

Grinold proposes a reduced-form linear dynamical system for a "model" portfolio and the actual traded portfolio. The method is discrete-time state dynamics with two parameters: an information-decay rate $g$ and a trading-speed parameter $d$. From these laws of motion he derives formulas for stock, flow, transfer coefficient, information age, and cost-sensitive optimal trading speed. The technique is linear systems analysis applied to portfolio management.

## 4. Approach (detailed)

1. **Define the model portfolio $m(t)$.**

   $m(t)$ is the portfolio one would hold absent transaction costs. Its law of motion over interval $\Delta t$ is
   $$
   \Delta m(t) = -g\,m(t-\Delta t)\,\Delta t + u(t),
   $$
   where $g>0$ is the information-decay rate and $u(t)$ is new information.

   Exponential form used as a small-rebalancing-interval approximation:
   $$
   m(t)=\gamma m(t-\Delta t)+u(t),\qquad \gamma=e^{-g\Delta t}.
   $$

2. **Define the actual portfolio $p(t)$.**

   Trading closes only a fraction of the gap between desired and actual holdings:
   $$
   \Delta p(t)=d\,[m(t)-p(t-\Delta t)]\,\Delta t,
   $$
   or, under the same short-interval approximation,
   $$
   p(t)=\delta p(t-\Delta t)+(1-\delta)m(t),\qquad \delta=e^{-d\Delta t},
   $$
   where $d>0$ is the trading-speed parameter.

3. **Interpret the parameters.**

   - $1/g$ is the average age of information in the model.
   - $\ln 2/g$ is the half-life of information.
   - Larger $d$ means faster implementation and higher turnover.

4. **Derive implementation efficiency.**

   The transfer coefficient of the actual portfolio relative to the model is
   $$
   \tau_P = \sqrt{\frac{d}{d+g}}.
   $$
   Hence faster trading raises implementation efficiency; faster information decay lowers it.

5. **Relate information ratio to the dynamic system.**

   If the model portfolio has information ratio $IR_M$, then before costs
   $$
   IR_P = \tau_P\, IR_M.
   $$
   Thus dynamic trading frictions reduce information ratio exactly through the transfer coefficient.

6. **Connect stock and flow.**

   Let $S$ denote the expected gross size of positions and $F$ annual round-trip turnover. Grinold derives an approximate stock-flow relation of the form
   $$
   F \approx S \sqrt{gd},
   $$
   equivalently
   $$
   S \approx \frac{F}{\sqrt{gd}},
   $$
   up to the paper's scaling conventions. Faster information or faster implementation implies more flow for a given stock of positions.

7. **Analyze age distribution.**

   Because the actual portfolio is a geometrically weighted average of past model portfolios, it holds older information than the costless model. The average age of information in the actual portfolio increases as $d$ falls relative to $g$.

8. **Choose optimal trading speed.**

   Given trading costs and the value of forecast information, one can optimize $d$. More trading increases pre-cost efficiency but also increases cost drag; the optimal $d$ balances the two.

### Proof sketch

All results come from solving the two linear difference equations. The transfer coefficient is obtained from the covariance between $m(t)$ and $p(t)$; because $p$ is a lagged geometric smoother of $m$, the correlation reduces to $\sqrt{d/(d+g)}$ in the small-interval limit. The stock-flow formulas follow from steady-state second moments of the induced AR(1)-type system. The age results come from expanding $p(t)$ as a weighted sum of past information shocks.

## 5. Domain of applicability

The framework applies to aggregate descriptions of active strategies when one wants parsimonious dynamics rather than security-level realism. It is useful for inferring effective information decay, trading aggressiveness, and turnover economics from realized positions and trades. It breaks where nonlinear constraints, episodic liquidity, inventory effects, or state-dependent trading costs dominate, because the two-parameter linear system cannot represent those features. It is a reduced-form diagnostic tool, not a microfounded market-impact model.


## 6. Correct interpretation of the two rates

The paper distinguishes the annualized rates $g,d$ from the discrete coefficients $\gamma=e^{-g\Delta t}$ and $\delta=e^{-d\Delta t}$. The original difference equations use $g\Delta t$ and $d\Delta t$ directly; treating them as $1-\gamma$ and $1-\delta$ relies on a sufficiently short rebalance period. The simple headline formulas are limiting approximations, whereas Appendix A gives finite-interval covariance formulas. Daily trading with modest annual rates is one environment in which the distinction is small; coarse annual rebalancing with fast signals is not.

The source assumes new information innovations are serially uncorrelated and orthogonal to previous model and portfolio positions. The asset covariance matrix is held fixed in the derivation, and the process is analyzed in statistical equilibrium. This means stable second moments, not that every realized holding or risk estimate is constant. Mark-to-market changes in portfolio weights are ignored as a second-order effect. External subscriptions and withdrawals should be removed when estimating a trading rule.

A particularly important correction is that $d/(d+g)$ is the **beta** of the held portfolio relative to the model, and the fraction of its variance aligned with the model. The transfer coefficient is the **correlation**, the square root of that quantity. Confusing beta and correlation understates implementation efficiency and contaminates the subsequent information-ratio calculation.

## 7. Reconstructing the stationary covariance results

Use the risk inner product $\langle a,b\rangle_\Omega=a'\Omega b$, and define

$$
V_M=E[m_t'\Omega m_t],\quad
V_P=E[p_t'\Omega p_t],\quad
C=E[p_t'\Omega m_t].
$$

For the discrete system $m_t=\gamma m_{t-1}+u_t$ and $p_t=\delta p_{t-1}+(1-\delta)m_t$, orthogonality of innovations gives

$$
C=\delta\gamma C+(1-\delta)V_M.
$$

Consequently, with $\psi=(1-\delta)/(1-\delta\gamma)$,

$$
C=\psi V_M.
$$

Expanding $E[p_t'\Omega p_t]$ and imposing stationarity gives

$$
V_P=\frac{1+\delta\gamma}{1+\delta}\psi V_M.
$$

As $\Delta t\to0$, $\psi\to d/(d+g)$ and $(1+\delta\gamma)/(1+\delta)\to1$. Therefore

$$
C\simeq V_P\simeq\frac d{d+g}V_M,
\qquad
\tau_P=\frac C{\sqrt{V_MV_P}}\simeq\sqrt{\frac d{d+g}}.
$$

Writing $\omega_M=\sqrt{V_M}$ and $\omega_P=\sqrt{V_P}$,

$$
\omega_P=\tau_P\omega_M,
\qquad
IR_P=\tau_P IR_M
$$

under the paper's expected-alpha relation. The actual portfolio can be decomposed as

$$
p_t=\frac d{d+g}m_t+e_t,\qquad E[e_t'\Omega m_t]=0.
$$

The residual has variance $[d/(d+g)][g/(d+g)]V_M$, so the proportion of $P$'s variance in this unaligned component is $g/(d+g)$. It represents stale or displaced information under the model, not necessarily realized losses in every period.

The backlog is $m_t-p_t$. Its risk obeys

$$
\omega_{M-P}^2=\frac g{d+g}\omega_M^2
=\frac gd\omega_P^2.
$$

The annualized trade-flow risk, defined from $\Delta p/\Delta t$, satisfies

$$
\omega_{\dot P}^2=gd\,\omega_P^2
=d^2\omega_{M-P}^2.
$$

These identities link position risk, delayed information, and trading intensity using the same risk metric. They do not require converting gross turnover to risk through a single security volatility, which is one reason they are useful diagnostics.

## 8. Stock, flow, and the additional assumptions behind the turnover formula

Gross stock is $S=E\sum_i|p_i|$. To express it through portfolio risk, Appendix B adds assumptions that are not needed for all the covariance identities: uncorrelated securities, equal expected risk allocation across securities, and approximately normal position sizes. These yield

$$
E|p_i|=\sqrt{\frac2\pi}\frac{\omega_P}{\sqrt N\sigma_i},
\qquad
S=\sqrt{\frac2\pi}\,\omega_P\sqrt N\left(\frac1N\sum_i\frac1{\sigma_i}\right).
$$

Writing the reciprocal average in terms of the harmonic mean asset volatility gives the paper's compact stock formula. The same assumptions applied to trades lead to $F\simeq S\sqrt{gd}$ in the paper's annual-flow convention. Different operational definitions of turnover, particularly whether buys and sells are each counted, require consistent conversion before comparison.

The source itself calls the flow formula rough. It should not be treated as an identity for concentrated portfolios, correlated industry books, lumpy rebalances, or constrained long-only holdings. The portfolio-risk identity for trade flow is more general than the absolute-dollar approximation. A manager can use disagreement between predicted and observed turnover to diagnose a failure of the supplementary assumptions.

## 9. Age distribution and effective breadth

Repeated substitution gives

$$
m_t=\sum_{j\ge0}\gamma^j u_{t-j}.
$$

Normalizing the exposure coefficients, the model's mean information age is $\Delta t\,\gamma/(1-\gamma)$, approaching $1/g$. The held portfolio has impulse-response coefficients

$$
a_j=(1-\delta)\frac{\delta^{j+1}-\gamma^{j+1}}{\delta-\gamma},\qquad \delta\ne\gamma,
$$

and $a_j=(1-\delta)(j+1)\delta^j$ in the equal-rate limit. Its normalized mean age is the sum of the two geometric-filter delays:

$$
A_P=\Delta t\left(\frac\gamma{1-\gamma}+\frac\delta{1-\delta}\right)
\longrightarrow\frac1g+\frac1d.
$$

These are ages based on exposure coefficients, not a squared-coefficient decomposition of risk. The portfolio holds too little recent information and too much old information relative to the model. In the limit,

$$
\tau_P=\sqrt{A_M/A_P}.
$$

The paper proposes the aggregate breadth approximation $B=gN$, giving $IR_M=IC\sqrt{gN}$ and

$$
IR_P=IC\sqrt{\frac{N}{A_P}}
=IC\sqrt{\frac{Ngd}{g+d}}.
$$

This links an economic description of information replacement to the fundamental law. It is not a general proof that security count times an estimated decay rate equals statistically independent breadth under arbitrary signal correlations.

## 10. Optimizing trading speed and scale

The annual objective is

$$
U_P=\alpha_P-\frac\lambda2\omega_P^2-c_P,
\qquad
c_P=\frac\chi2\omega_{\dot P}^2
=\frac\chi2gd\omega_P^2.
$$

The cost assumption is quadratic in the risk of the trade rate. It captures superlinear costs and gives lower modeled cost to hedged baskets, but it is a deliberately coarse market-impact representation. It is not a security-level liquidity curve and does not include fixed or bid–ask costs explicitly.

Using $q=d/(d+g)$ and model risk $\omega_M$,

$$
U_P(d,\omega_M)
=q\left[IR_M\omega_M-\frac{\lambda+\chi gd}{2}\omega_M^2\right].
$$

For fixed $d$,

$$
\omega_M(d)=\frac{IR_M}{\lambda+\chi gd},
\qquad
U_P(d)=\frac{IR_M^2}{2}\frac{d}{(d+g)(\lambda+\chi gd)}.
$$

Differentiating the final scalar expression leads to $\lambda=\chi d^2$, so

$$
d^*=\sqrt{\lambda/\chi},
\qquad
\omega_M^*=\frac{IR_M}{\lambda+g\sqrt{\lambda\chi}}.
$$

Trading speed is independent of $g$ in this specific joint optimization, although scale and realized transfer efficiency depend on $g$. Higher cost intensity reduces speed. Higher risk aversion increases speed while reducing optimal scale: the portfolio is smaller and tracks its smaller target more closely. The source's nearby prose about risk aversion should be interpreted through this explicit formula; the equation has an unambiguous comparative static.

The optimized objective is

$$
U_P^*=\frac{IR_M^2}{2\lambda}\left(\frac{d^*}{d^*+g}\right)^2.
$$

This supports strategic comparison of signals with different decay rates and gross information ratios. Slowing a signal can improve net utility even if its gross IR declines. It does not identify an optimal $g$ without an additional relation between signal design and achievable information quality.

## 11. Estimation and the worked strategy example

Given histories of model positions, held positions, and covariance matrices, the paper estimates a risk-weighted lag coefficient for the model and converts it to $g=-\ln\gamma/L$. To estimate implementation speed, it regresses the current held portfolio on lagged holdings and the current model in the same covariance metric, obtains $\delta$, and uses $d=-\ln\delta/L$. It allows a separate loading on the model because the saved model may have an arbitrary scale. It recommends lags long enough to average out asynchronous information arrival and trading noise.

The illustrative long–short strategy has a history extending through 2007. The source compares directly calculated model–portfolio correlations with correlations predicted from smoothed estimated rates. Agreement improves after initially unstable observations, while smoothing predictably introduces lag. This is a descriptive validation of a coarse dynamic model, not a claim of precisely estimated structural parameters.

For the numerical example, $IR_M=1.75$ is assumed, $\omega_P=4.5\%$ observed, and $d=3$, $g=2.5$ estimated. The model gives $\tau_P\approx0.74$, pre-cost $IR_P\approx1.29$, information ages 0.40 and 0.73 years, annual trade-flow risk 12.32%, and backlog risk 4.11%. Assuming observed scale and speed are optimal implies $\lambda=15.67$, $\chi=1.7407$, annual alpha 5.82%, risk penalty 1.59%, cost 1.32%, and net IR about 1.00.

Those inferred costs depend on assumed information quality. If independent cost evidence suggests only 0.85% annually, reducing assumed model IR to 1.12 reconciles the calculation and lowers implied net IR to 0.64. This example illustrates the paper's intended use: compare a coherent set of implied quantities with external evidence and revise implausible assumptions. It does not estimate alpha quality from holdings alone.
