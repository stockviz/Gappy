# Dimensions of Popularity
**Authors:** Roger G. Ibbotson, Thomas M. Idzorek
**Year:** 2015
**Journal/Venue:** Journal of Portfolio Management

## Problem statement

The paper argues that many well-known return premia can be reinterpreted as manifestations of one broader concept: **popularity**. Investors pay up for assets that are easier to own, easier to understand, heavily traded, fashionable, or otherwise attractive along dimensions that go beyond classical risk.

The central question is whether a unifying popularity-versus-unpopularity framework can organize anomalies that are usually discussed separately under labels like size, liquidity, beta, volatility, momentum, and value.

## Approach (short)

Rather than building one formal factor, the paper proposes a conceptual ranking framework:

- assets can be ordered from more popular to less popular along several dimensions;
- more popular assets tend to command higher prices and lower future returns;
- less popular assets tend to command lower prices and higher future returns.

The empirical illustrations compare return spreads across independent sorts on traditional risk measures and on popularity-related characteristics such as turnover.

## Approach (detailed)

### 1. Define popularity as a pricing characteristic

The paper treats popularity as a latent attribute that shifts demand. In reduced form:

$$
Price = Fundamental\ Value + Popularity\ Premium,
$$

so, holding fundamentals fixed, more popular assets have:

- higher current prices,
- lower forward expected returns.

This is not a CAPM replacement in the strict econometric sense. It is a synthesis: many anomalies can be viewed as cases where investors prefer a characteristic and therefore overpay for it.

### 2. Distinguish risk popularity from broader popularity

In standard asset pricing, one dimension of popularity is simply low risk:

- investors like low default risk,
- low earnings uncertainty,
- high liquidity,
- transparent information.

But the authors argue that popularity also covers:

- heavy recent trading,
- media or investor attention,
- glamour characteristics,
- and other preference-driven demand.

The methodological point is that one should not expect a single scalar popularity measure to capture all dimensions. Instead, different anomalies can be interpreted as different projections of the same demand-for-popularity idea.

### 3. Use turnover as a particularly transparent popularity proxy

The paper's cleanest empirical proxy is trading activity. It examines stocks ranked by previous-year turnover and shows:

- high-turnover stocks are more popular,
- low-turnover stocks are less popular,
- lower-popularity portfolios earn higher subsequent returns.

This matters because turnover is not a conventional cash-flow fundamental. It is a direct trace of investor interest and activity.

### 4. Compare popularity sorts with beta and volatility sorts

The paper then uses two-way sorts. Conceptually:

1. sort stocks into popularity quartiles;
2. within each popularity quartile, sort by beta or volatility;
3. compare the strength of return monotonicity across the two dimensions.

The result emphasized in the paper is that the popularity dimension often dominates the classical risk dimension in producing monotonic return differences. In other words, low volatility alone is not the full story; low volatility **combined with low popularity** is much more informative.

### 5. Reinterpret many anomalies in one language

The paper suggests the following translation:

- low beta / low volatility: unpopular because they look boring, levering them is hard, and attention is low;
- value: unpopular because fundamentals look weak or unexciting;
- illiquidity: unpopular because trading is difficult;
- momentum and attention effects: popularity shocks can move prices in the short run;
- lottery demand: popularity of exciting payoffs depresses future returns.

The paper's contribution is not a new traded factor. It is a unifying comparative-static statement:

$$
\text{Higher popularity} \Rightarrow \text{higher price today} \Rightarrow \text{lower expected return}.
$$

### 6. What a reader should implement

The paper leaves behind a practical framework rather than one canonical strategy:

1. choose a popularity proxy such as turnover, visibility, liquidity, or recent investor demand;
2. independently sort on popularity and a standard anomaly characteristic;
3. compare return monotonicity within and across popularity buckets;
4. overweight low-popularity assets when the goal is higher expected return.

## Domain of applicability

- **Where it works well:** Cross-sectional stock selection where several anomalies may be manifestations of the same demand effect.
- **What is implementable:** Low-popularity tilts using turnover or attention proxies, and two-way sorts combining popularity with value, low volatility, or other characteristics.
- **Main limitation:** Popularity is a broad organizing concept, not a uniquely measured factor.
- **Why the paper matters:** It offers a common language for anomalies that are often treated as separate phenomena.
