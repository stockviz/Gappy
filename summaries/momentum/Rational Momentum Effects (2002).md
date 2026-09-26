# Rational Momentum Effects
**Authors:** Timothy C. Johnson
**Year:** 2002
**Journal/Venue:** Journal of Finance

## Problem statement

Momentum is often treated as evidence of investor irrationality or slow diffusion of information. Johnson asks whether that inference is logically necessary. His question is: **can a completely rational asset-pricing model with a standard pricing kernel generate momentum if expected dividend growth varies over time in a sufficiently nonlinear way?**

The paper is therefore a theory paper aimed at producing momentum without behavioral frictions.

## Approach (short)

Johnson builds a single-firm model in which expected dividend growth is stochastic. The key mechanism is that stock prices are highly nonlinear in the growth-rate state, so positive recent growth shocks both raise past realized returns and increase current expected returns. Past winners then rationally have higher expected returns. The basic model uses persistent growth-rate dynamics; an extended model adds **episodic persistent shocks** via a regime-like structure so that momentum can be strong in the short run without implying implausibly persistent expected-return spreads.

## Approach (detailed)

### 1. Start from cash flows, not from trader behavior

The paper deliberately avoids:

- heterogeneous beliefs,
- investor underreaction,
- market frictions,
- technical trading.

Instead it uses a standard discounted-cash-flow environment in which the firm has stochastic expected dividend growth and investors price risk with an ordinary pricing kernel.

The question is whether momentum can arise from the state dynamics alone.

### 2. Make expected dividend growth stochastic

The central state variable is the firm's expected dividend-growth rate, often denoted `m_t` in the paper. Dividends evolve with a growth process whose conditional mean changes over time.

This matters because if expected growth were constant, recent returns would not help forecast future expected returns in the required way. Once growth rates vary, recent returns become informative about the current level of the latent growth state.

### 3. Use the nonlinear pricing of growth

The crucial mechanism is not merely that growth changes. It is that **equity prices are highly convex in expected growth**. Johnson emphasizes that the log stock price is a convex function of the growth-rate state.

That convexity creates two linked effects:

- a positive shock to growth raises the stock's recent realized return,
- but it also raises the stock's current exposure to growth-rate risk and therefore its expected return going forward.

So a momentum sort based on recent performance indirectly sorts on the current growth state and hence on expected return.

### 4. Prove a positive covariance between past return and expected return

The formal proposition in the basic model is that, under reasonable sign restrictions:

- growth-rate shocks are sufficiently persistent,
- growth-rate risk carries a positive price,

there is positive covariance between recent realized return and subsequent expected excess return.

That is the paper's rational analogue of momentum. It does not say prices underreact. It says that high recent returns reveal a high-growth state that rationally commands a higher expected return.

### 5. Explain why the simple version is not yet enough

Johnson is careful about the weakness of the first model. If growth shocks are made persistent enough to generate realistic momentum magnitudes, then expected-return differences become too persistent relative to the data. Empirically, momentum profits fade and often reverse more quickly than the simple persistent-growth model would imply.

So the paper does not stop with the simplest specification.

### 6. Add episodic persistent shocks

The extended model introduces **time-varying persistence** in growth-rate shocks. Persistent shocks occur only intermittently rather than all the time. The intuition is that:

- most innovations are transient,
- but occasionally there are major, rare, persistent changes in the firm's growth prospects.

This is implemented with a regime-like or state-dependent innovation process, where a persistent-shock state occurs infrequently and lasts for limited durations.

The benefit is clear:

- recent returns can still identify high-growth states and generate momentum,
- but unconditional expected-return spreads need not remain too persistent all the time.

### 7. Match more of the empirical momentum facts

The enhanced model is meant to reproduce several features of the data simultaneously:

- positive short- to intermediate-horizon continuation,
- stronger effects when shocks are large and persistent,
- a link between stock-specific and industry momentum if growth shocks are partly common,
- and only episodic rather than permanently elevated expected-return differences.

Johnson explicitly notes that persistent growth shocks could be partly sectoral, which offers a rational route to an industry component of momentum.

### 8. Clarify what the model is and is not saying

The model does **not** claim that every winner is a rational high-growth stock. The econometrician does not observe the latent growth state directly, so past return is used as an imperfect proxy for it. In the model, the sort on recent returns works because recent shocks help reveal the unobserved state.

This distinction is important:

- the theory variable is the growth-rate state,
- the implementable variable is recent return.

### 9. What a reader should implement

The paper itself is not a trading recipe in the Jegadeesh-Titman sense. Its reusable methodology is:

1. specify a latent state for expected cash-flow growth;
2. derive how price and expected return jointly depend on that state;
3. show that recent realized return is informative about the latent state;
4. examine whether occasional persistent shocks can reconcile strong short-run momentum with limited long-run persistence.

So the paper is best used as a structural template for rationalizing momentum, not as a portfolio-construction manual.

## Domain of applicability

- **Where it works well:** Structural or equilibrium research on whether momentum can arise without behavioral assumptions.
- **What is implementable:** Calibrate or estimate rational models with stochastic expected-growth states and test whether recent returns proxy for those states in the cross section.
- **Main limitation:** The model explains momentum by an unobserved growth process, so empirical implementation requires strong assumptions or indirect proxies.
- **Why the paper matters:** It shows that momentum is not logically equivalent to irrationality; it can emerge from rational pricing with nonlinear state dynamics.
