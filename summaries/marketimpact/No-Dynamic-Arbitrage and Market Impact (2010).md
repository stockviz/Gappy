# No-Dynamic-Arbitrage and Market Impact

**Authors:** Jim Gatheral  
**Year:** 2010  
**Journal/Venue:** *Quantitative Finance*, Vol. 10, No. 7, pp. 749--759

## Problem statement

Market impact models require specifying two functions: an *instantaneous market impact function* $f(v)$ mapping trading rate to price displacement, and a *decay kernel* $G(\tau)$ describing how that displacement fades. The literature proposes various functional forms for each (linear, power-law, logarithmic impact; exponential, power-law decay) but treats the choices as independent. This paper asks: **which pairs $(f, G)$ are mutually consistent with a no-dynamic-arbitrage principle**, i.e., the requirement that no round-trip trading strategy has negative expected cost?

## Approach (short)

Assume a price process $S_t = S_0 + \int_0^t f(\dot{x}_s) G(t-s)\,\mathrm{d}s + \sigma Z_t$, where $\dot{x}_s$ is the trading rate. Define a round-trip trade as any strategy with $\int_0^T \dot{x}_t\,\mathrm{d}t = 0$. No-dynamic-arbitrage requires $C[\Pi] = \int_0^T \dot{x}_t \int_0^t f(\dot{x}_s) G(t-s)\,\mathrm{d}s\,\mathrm{d}t \ge 0$ for all such strategies. By evaluating $C[\Pi]$ on parametric families of round-trip strategies (buy at rate $v_1$, sell at rate $v_2$), the paper derives inequalities linking the exponents $\delta$ (of $f$) and $\gamma$ (of $G$) and eliminates several common modelling choices.

## Approach (detailed)

1. **Price process.** The stock price is modelled as

$$S_t = S_0 + \int_0^t f(\dot{x}_s)\,G(t - s)\,\mathrm{d}s + \int_0^t \sigma\,\mathrm{d}Z_s, \tag{1}$$

where $f(\cdot)$ is the instantaneous impact function (odd: $f(v) = -f(-v)$), $G(\cdot)$ is a non-increasing decay kernel with $G(0)=1$, and $\dot{x}_s$ is the dollar trading rate. This nests Almgren et al. (2005) ($G(\tau) = \delta(\tau)$, $f(v) = \eta \sigma v^\beta$), Obizhaeva--Wang (2005) ($G(\tau) = e^{-\rho\tau}$, $f(v) \propto v$), and Bouchaud et al. (2004) ($f(v) \propto \log v$, $G(\tau) \propto \tau^{-\gamma}$).

2. **Cost of trading.** Expected cost of a strategy $\Pi = \{x_t\}$ over $[0,T]$ (neglecting slippage) is

$$C[\Pi] = \int_0^T \dot{x}_t\,\mathrm{d}t \int_0^t f(\dot{x}_s)\,G(t - s)\,\mathrm{d}s. \tag{3}$$

3. **No-dynamic-arbitrage principle.** For every round-trip trade ($\int_0^T \dot{x}_t\,\mathrm{d}t = 0$), require $C[\Pi] \ge 0$. This is *not* classical arbitrage; it is closer to "quasi-arbitrage" (Huberman--Stanzl 2004) -- it concerns expected cost, not sure profit.

4. **Permanent impact ($G \equiv 1$).** Evaluating cost on the strategy "buy at rate $+v$ for $[0, T/2]$, sell at rate $-v$ for $[T/2, T]$" yields $C[\Pi] = v\,\frac{T^2}{8}\{-f(-v) - f(v)\}$. No-dynamic-arbitrage then forces $f(v) = -f(-v)$ (odd symmetry). With the more general two-rate strategy (buy at $v_1$, sell at $v_2$ for fractions $\theta T$ and $(1-\theta)T$), the cost decomposes as $C = C_{11} + C_{22} - C_{12}$, where the cross-term $C_{12}$ captures the impact of prior purchases on subsequent sales. The constraint $C_{11} + C_{22} - C_{12} \ge 0$ must hold for all $v_1, v_2 > 0$.

5. **Exponential decay: elimination (exact).** Set $G(\tau) = e^{-\rho\tau}$. Explicit computation of $(C_{11}, C_{22}, C_{12})$ via equations (5) gives a closed-form expression (6) in $\rho T$, $v_1$, $v_2$. Expanding in $\rho T$:

$$\frac{v_1 v_2 [v_1 f(v_2) - v_2 f(v_1)](\rho T)^2}{2(v_1+v_2)^2} + O((\rho T)^3) \ge 0.$$

This is satisfiable for all $v_1, v_2$ **only if** $f(v) \propto v$. Since empirical $f$ is concave (sublinear) for reasonable sizes, exponential decay is ruled out as a realistic assumption.

   **Lemma 4.1** (exact): *If $G(\tau) = e^{-\rho\tau}$, price manipulation is possible unless $f(v) = \eta v$ (linear).*

   **Corollary 4.2:** Nonlinear permanent market impact ($G \equiv 1$) is also inconsistent with no-dynamic-arbitrage (recovers Huberman--Stanzl).

6. **Power-law decay.** Set $G(\tau) = \tau^{-\gamma}$, $0 < \gamma < 1$. All integrals in (4) evaluate in closed form (equations (7)). Substituting $\theta = v_2/(v_1+v_2)$ into the no-arbitrage constraint gives

$$f(v_1)\{v_1 v_2^{1-\gamma} - (v_1+v_2)^{2-\gamma} + v_1^{2-\gamma} + v_2^{2-\gamma}\} + f(v_2) v_1^{2-\gamma} \ge 0. \tag{8}$$

   This is the master inequality from which all subsequent results follow.

7. **Slow accumulation / fast liquidation limits.**
   - *Limit $v_1 \ll v_2$* (slow build, fast dump), $0 < \gamma < 1$: setting $v_1 = \epsilon v$, $v_2 = v$ and sending $\epsilon \to 0$ yields the **small-$v$ condition**

     $$\frac{f(\epsilon v)}{f(v)} \le \frac{\epsilon^{1-\gamma}}{1 - \gamma}. \tag{9}$$

     Violation means price manipulation is possible by accumulating slowly and liquidating rapidly.

   - *Limit $v_1 \gg v_2$* (pump and dump): setting $v = v_2/v_1 < 1$ in (8) with power-law decay gives

     $$f(v_1)\{v^{1-\gamma} - (1+v)^{2-\gamma} + 1 + v^{2-\gamma}\} + f(v_2) \ge 0. \tag{10}$$

     Defining $h(v,\gamma) := v^{1-\gamma} - (1+v)^{2-\gamma} + 1 + v^{2-\gamma}$, the paper shows (Appendix A) that $h(v,\gamma) < 0$ for some $v \in (0,1)$ **if and only if**

     $$\gamma < \gamma^* := 2 - \frac{\log 3}{\log 2} \approx 0.415. \tag{11}$$

8. **Power-law impact $f(v) \propto v^\delta$.**
   - Condition (9) reduces to $\gamma + \delta \ge 1$.
   - **Lemma 5.1** (small-$v$): $G(\tau) = \tau^{-\gamma}$, $f(v) = v^\delta$ $\Longrightarrow$ no-dynamic-arbitrage requires $\gamma + \delta \ge 1$.
   - **Lemma 5.2** (large-$v$, exact, proved in Appendix A): $\gamma \ge \gamma^* \approx 0.415$.

9. **Log impact $f(v) \propto \log(v/v_0)$.** Since $\log v = \lim_{\delta \to 0} (v^\delta - 1)/\delta$, this is the boundary case $\delta \to 0$. With $\gamma = 1/2$, specific numerical substitutions into (8) produce negative cost, so $f(v) \sim \log v$ combined with power-law decay ($\gamma < 1$) always permits manipulation in the limit $v_0 \to 0$.

10. **Recovering the square-root formula.** Cost per share of a VWAP execution of $n$ shares with duration $T$ is proportional to $v^{1+\delta} T^{1-\gamma}$. Setting $v = n/(VT)$ and requiring cost per share to be independent of $T$ forces $\gamma + \delta = 1$ (the lower bound). With $\gamma = \delta = 1/2$ this gives cost $\propto \sigma\sqrt{n/V}$, the empirical square-root formula.

11. **Limit-order-book tail and high trading rates.** Using the Bouchaud et al. (2002) model of order-book density with power-law tail exponent $\mu$, the virtual impact function behaves as $\Delta P \sim (n_{\max} - n)^{-1/\mu}$ near $n_{\max}$. Mapping $n \mapsto v$ gives $f(v_i) \sim (1 - v_i)^{-\nu}$ as $v_i \to v_{\max}$. Substituting into (10) in the limit $\epsilon \to 0$ yields the **large-size condition** $\gamma \ge \gamma^*$.

12. **Constraint on autocorrelation exponent $\alpha$.** Bouchaud et al. (2004) relate $\gamma = (1 - \alpha)/2$ where $\alpha$ is the power-law exponent of trade-sign autocorrelation decay. Combining $\gamma \ge \gamma^*$ with $\gamma = (1-\alpha)/2$ gives

$$\alpha \le 1 - 2\gamma^* \approx 0.17.$$

This is a *testable* and *surprisingly tight* empirical prediction, apparently at odds with several estimates in the literature ($\alpha \approx 0.5$--$0.6$).

## Domain of applicability

- **Model scope.** Results hold within the specific price process (1), which assumes (i) impact depends only on trading rate, not on the state of the order book or order-flow history; (ii) impact and decay factorise multiplicatively; (iii) no conditioning on market state. The model is equivalent to the BGPW picture and, under ARFIMA order-flow assumptions, to the LF (Farmer et al.) picture.
- **Round-trip strategies considered.** The derived inequalities use piecewise-constant-rate strategies only. They are necessary conditions; sharper (possibly tighter) conditions could follow from richer strategy classes (e.g., discrete trading, state-dependent strategies).
- **Slippage ignored.** The paper neglects the bid-ask spread / slippage component of transaction costs. All inequalities are therefore *weakened* in practice -- the true no-arbitrage region is larger.
- **Key limitations.**
  - The factorisation $\alpha \le 0.17$ appears inconsistent with empirical estimates $\alpha \approx 0.5$--$0.6$, suggesting either that the separable price process (1) is too restrictive, or that high-rate pump-and-dump is not practically feasible (order-book constraints, market surveillance).
  - The paper derives *necessary* conditions only; it does not prove that satisfying $\gamma + \delta \ge 1$ is *sufficient* for no-dynamic-arbitrage across all possible strategies.
  - All results assume continuous-time, continuous-rate trading. Discrete order flow or latency effects could alter the conclusions.
