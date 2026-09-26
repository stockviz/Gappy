# On the Evidence Supporting the Existence of Risk Premiums in the Capital Market
**Authors:** Robert A. Haugen, A. James Heins
**Year:** 1972
**Journal/Venue:** Wisconsin working paper

## Problem statement

Haugen and Heins do not simply claim that low-risk stocks earn too much. Their deeper argument is that much of the early empirical evidence for a positive risk-return relation is methodologically biased by survivorship and by confusing ex post averages with ex ante expected returns.

## Approach (short)

The paper is a methodological critique plus an empirical illustration. It:

1. writes the conventional linear risk-return relation in ex ante form;
2. shows why sampling realized average returns can bias tests of that relation;
3. studies long stock histories, explicitly accounting for delistings and broken series.

The headline empirical message is that once one stops letting the data silently favor surviving high-return series, there is little support for a positive realized risk premium.

## Approach (detailed)

### 1. State the conventional empirical test explicitly

The standard setup is a market-model relation of the form

$$
r_{j,t}=a_j+\beta_j p_t+e_{j,t},
$$

where `p_t` is the market return. If one samples over `n` periods, the sample mean return is

$$
\bar r_j = a_j + \beta_j \bar p + \bar e_j.
$$

The conventional test then correlates realized mean return with variance or beta and interprets the slope as evidence about an ex ante risk premium.

### 2. Explain why that test is biased

The paper's core point is that ex post sampling is not the same as observing investors' ex ante beliefs. Two problems dominate:

- we do not observe the true expected return distribution investors faced;
- the sample is contaminated by survival and measurement effects.

If low-return, high-variance issues disappear, a cross section made only of survivors will mechanically exaggerate the apparent reward to risk.

### 3. Show survivorship bias in a simple stock experiment

To make the point concrete, Haugen and Heins randomly select `150` NYSE stocks from 1926 and track them through 1969, replacing delisted names to maintain the panel. They then compare:

- the `60` firms whose series survive continuously,
- the `90` broken series that are interrupted by delisting or disappearance.

The surviving firms have higher geometric mean returns and lower standard deviations than the broken series. That by itself shows how easy it is for conventional sampling to bias the measured risk-return relation.

### 4. Distinguish ex post realized relationships from the ex ante object of theory

The paper repeatedly emphasizes that CAPM-style theory is about **expected** returns. An empirical researcher only observes realized returns over finite samples. When the horizon, survival mechanism, and measurement convention are wrong, one can easily mistake an ex post artifact for a priced risk premium.

### 5. Use the critique to reinterpret positive risk-premium evidence

The paper does not claim all theory is false. It claims the empirical evidence then cited in favor of the risk-premium hypothesis was too weak because it depended on procedures that:

- eliminate broken series,
- average over nonstationary horizons,
- and assume realized means are unbiased proxies for expected returns.

With those issues corrected, the evidence for a positive risk-return slope becomes weak.

### 6. What a reader should implement

A faithful replication would:

1. build stock panels that retain delisting information and replacement logic;
2. compare return-risk relations for surviving and broken series;
3. avoid interpreting realized average return as a clean estimate of ex ante expected return;
4. test sensitivity to the sampling horizon and survivorship treatment.

The paper is therefore more a test-design paper than a stock-selection paper.

## Domain of applicability

- **Where it works well:** Any empirical study of risk premia where survivorship, sample construction, or ex post/ex ante confusion can contaminate the result.
- **What is implementable:** Delisting-aware panel construction and explicit sensitivity checks for survivorship bias.
- **Main limitation:** The paper is an early critique and does not provide a full alternative equilibrium model.
- **Why the paper matters:** It planted the seed for the later low-risk literature by showing that the original evidence for a positive risk premium was methodologically fragile.
