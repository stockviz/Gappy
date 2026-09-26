# Idiosyncratic Risk and Security Returns
**Authors:** Burton G. Malkiel, Yexiao Xu
**Year:** 2004
**Journal/Venue:** Working paper

## Problem statement

Standard CAPM says only market risk should be priced, because idiosyncratic risk can be diversified away. Malkiel and Xu challenge the premise, not the algebra. If some investors cannot or do not hold the full market portfolio, then the effective portfolio available to unconstrained investors is imperfectly diversified, and some idiosyncratic risk should become priced in equilibrium.

The paper therefore asks whether one can derive a modified CAPM with an idiosyncratic-risk premium and then find evidence for it in cross-sectional stock returns.

## Approach (short)

The paper starts from mean-variance demand:

$$
X_j=\tau V^{-1}(\mu-r\mathbf{1}),
$$

which under full participation yields the standard CAPM:

$$
\mu-r\mathbf{1}=\beta(\mu_m-r).
$$

It then introduces investor groups that are constrained from holding parts of the market, derives an altered equilibrium, and shows that expected returns become

$$
\mu_i^c-r=\beta_i(\mu_m^\dagger-r)+\beta_{I,i}\mu^I.
$$

Under additional assumptions this simplifies to a cross-sectional relation in idiosyncratic variance:

$$
\mu_i^c-r \approx \beta_i(\mu_m^\dagger-r)+k\delta_{SR}\bar w\,\sigma_{I,i}^2 + e_i.
$$

The paper then tests this using portfolio and individual-stock Fama-MacBeth regressions and an idiosyncratic-risk hedging portfolio.

## Approach (detailed)

### 1. Re-derive CAPM from mean-variance demand

With homogeneous unconstrained investors,

$$
X_j=\tau V^{-1}(\mu-r\mathbf{1}),
$$

and market clearing implies

$$
\mu-r\mathbf{1}=\frac{1}{n\tau}VS.
$$

Defining the market portfolio from aggregate supply leads to the standard CAPM:

$$
\mu-r\mathbf{1}=\beta(\mu_m-r),
$$

and the time-series return representation

$$
R_{i,t}-r_{f,t}=\beta_i(R_{m,t}-r_{f,t})+\varepsilon_{i,t}.
$$

Idiosyncratic volatility is then the residual variance:

$$
V = \Sigma - \sigma_m^2 \beta\beta'.
$$

This section is not filler. It provides the benchmark against which the constrained-investor economy is compared.

### 2. Introduce constrained investors and derive the altered equilibrium

The paper assumes that some investor groups cannot hold some securities. That breaks the CAPM's key spanning condition. The equilibrium expected-return vector becomes:

$$
\mu^c-r\mathbf{1}=\frac{1}{n\tau}\left[\eta_{1,3}(V^*)^{-1}+\eta_2V^{-1}\right]^{-1}S,
$$

which can be rewritten as

$$
\mu^c-r\mathbf{1}=\frac{1}{n\tau}VS^*.
$$

The interpretation is that investors behave **as if** they price securities relative to an altered, less diversified effective market portfolio `S^*`, not the true aggregate market portfolio.

That is the theoretical core of the paper. Once the econometrician insists on using the observed market portfolio rather than the effective portfolio faced by investors, some idiosyncratic risk appears priced.

### 3. Rewrite the model as a market-plus-idiosyncratic-factor pricing equation

After algebraic manipulation, the equilibrium becomes:

$$
\mu_i^c-r=\beta_i(\mu_m^\dagger-r)+\beta_{I,i}\mu^I,
$$

where `\mu_m^\dagger` is the expected return on the observable market portfolio and `\beta_{I,i}` is the loading on a market-wide undiversified idiosyncratic-risk factor.

Under the additional assumption that pairwise residual correlations are close to zero, this simplifies to:

$$
\mu_i^c-r = \beta_i(\mu_m^\dagger-r)+k\delta_{SR}w_i^*\sigma_{I,i}^2,
$$

and then to the cross-sectional approximation

$$
\mu_i^c-r \approx \beta_i(\mu_m^\dagger-r)+k\delta_{SR}\bar w\,\sigma_{I,i}^2 + e_i.
$$

This last equation is the one that motivates the empirical tests. It says that, holding market beta fixed, higher idiosyncratic variance should raise expected returns.

### 4. Test the theory on Fama-MacBeth style portfolios

The paper first revisits the classic Fama-MacBeth portfolio setting:

- the original 1935-1968 period,
- and an extended 1963-2000 period.

Stocks are sorted into size groups and then beta groups. For each portfolio, the paper reports:

- average return,
- average beta,
- average log size,
- average residual standard deviation.

The key observation is that idiosyncratic volatility varies strongly across the portfolios and appears useful in explaining return differences even when beta and size do not explain them well.

### 5. Move to individual-stock cross-sectional regressions

The more powerful tests assign portfolio-estimated betas and idiosyncratic volatilities to individual stocks, following the Fama-French approach to reduce errors-in-variables.

The design is:

1. form 100 portfolios by first sorting NYSE stocks into size deciles and then beta deciles;
2. use the NYSE breakpoints to classify all stocks;
3. estimate portfolio betas from 24-60 prior monthly returns;
4. estimate idiosyncratic volatility from the residual standard deviation of either a market model or the FF3 model;
5. run monthly cross-sectional regressions of returns on beta, size, book-to-market, and residual standard deviation.

This is the paper's main empirical engine. It studies both market-model-based and FF3-based idiosyncratic volatility.

### 6. Construct an idiosyncratic-risk hedging portfolio

Because the theoretical idiosyncratic factor is not directly observable, the paper constructs a hedging portfolio in the spirit of Fama-French. The idea is to create a traded return that proxies for market-wide undiversified idiosyncratic risk, and then test whether portfolio returns covary with it in the predicted direction.

This step matters because the theory is not merely saying "residual standard deviation correlates with returns." It is saying that constrained-market equilibrium creates an additional priced factor.

### 7. Interpret the empirical results

The empirical findings are consistent with the theory in the paper's own direction:

- idiosyncratic volatility is useful in explaining the cross section of returns in Fama-MacBeth frameworks;
- and portfolio returns covary with the constructed idiosyncratic-risk hedge.

So the paper's conclusion is not that CAPM is numerically perfect after a small tweak. It is that once full diversification is no longer guaranteed, a rational premium for idiosyncratic risk becomes theoretically coherent and empirically relevant.

### 8. What a reader should implement

A faithful implementation needs:

1. the theoretical sequence from unconstrained CAPM to constrained equilibrium;
2. size-beta sorted portfolios for classical Fama-MacBeth tests;
3. individual-stock regressions using portfolio-assigned betas and residual standard deviations;
4. both market-model and FF3-based residual-volatility measures;
5. a traded or mimicking portfolio for market-wide idiosyncratic risk.

The distinctive lesson is that the empirical variable should be the **residual variance conditional on an imperfect market portfolio**, not just a raw volatility number.

## Domain of applicability

- **Where it works well:** Settings in which diversification is plausibly incomplete or constrained.
- **What is implementable:** Cross-sectional return tests using residual standard deviation and idiosyncratic-risk hedge portfolios.
- **Main limitation:** The theory relies on an unobserved effective market portfolio and on assumptions about how constraints are distributed across investors.
- **Why the paper matters:** It provides one of the clearest rational arguments for why idiosyncratic risk might be priced when the CAPM's full-market-holding assumption fails.
