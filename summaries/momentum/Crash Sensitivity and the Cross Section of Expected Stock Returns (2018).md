# Crash Sensitivity and the Cross Section of Expected Stock Returns
**Authors:** Fousseni Chabi-Yo, Stefan Ruenzi, Florian Weigert
**Year:** 2018
**Journal/Venue:** Journal of Financial and Quantitative Analysis

## Problem statement

Most downside-risk measures are moment based. They summarize average covariance in bad states, but they do not ask the sharper question that matters for crash risk: **when the market moves deep into its far left tail, how likely is the stock to be there too?**

This paper asks whether that object, not beta or downside beta or coskewness, is priced in the cross section. The paper's answer depends on measuring crash sensitivity as genuine lower-tail dependence with the market rather than as an average over moderately bad states.

## Approach (short)

The paper defines a stock's crash sensitivity by its copula-based lower-tail dependence coefficient with the market,

$$
\text{LTD}_i=\lim_{q\to 0^+}\Pr\!\left(r_i<F_i^{-1}(q)\mid r_m<F_m^{-1}(q)\right).
$$

Each month, it estimates LTD and the corresponding upper-tail dependence measure UTD from daily stock and market returns over the previous 12 months. The estimation uses nonparametric marginal distributions and a large menu of parametric copula mixtures. The selected LTD estimates are then used in monthly Fama-MacBeth regressions and quintile portfolio sorts. Strong-LTD stocks earn higher average future returns than weak-LTD stocks, and the effect survives controls for beta, downside beta, coskewness, cokurtosis, Kelly-Jiang tail beta, and standard characteristics.

## Approach (detailed)

### 1. Define crash sensitivity as asymptotic left-tail comovement

The paper starts by defining left-tail dependence through a conditional tail probability. Let `X1` and `X2` denote two returns, for example a stock return and the market return. For the left tail,

$$
P_l(q)=\Pr\!\left(X_1<F^{-1}_{X_1}(q)\mid X_2<F^{-1}_{X_2}(q)\right).
$$

Then lower-tail dependence is

$$
\text{LTD}=\lim_{q\to 0^+}P_l(q).
$$

Similarly, upper-tail dependence is

$$
\text{UTD}=\lim_{q\to 1^-}\Pr\!\left(X_1>F^{-1}_{X_1}(q)\mid X_2>F^{-1}_{X_2}(q)\right).
$$

This is the core methodological move. Ordinary beta is linear dependence over the full support. Downside beta is conditional second-moment dependence over all below-average states. LTD instead asks whether joint crashes persist even as one moves into the extreme left tail.

### 2. Use copulas because standard moments cannot identify tail dependence cleanly

The paper does not estimate LTD nonparametrically from just a few extreme observations because that would be too noisy for stock-month panels. Instead it uses copulas:

- nonparametric empirical margins for the stock and market return distributions;
- parametric copulas for the dependence structure;
- closed-form tail-dependence coefficients implied by the chosen copula.

This separation matters. By estimating the margins nonparametrically, the authors avoid imposing a parametric shape on individual return distributions. By estimating the copula parametrically, they obtain much more precise LTD and UTD estimates than a purely tail-counting approach would allow.

### 3. Build a flexible copula family instead of committing to one dependence structure

Most basic copulas can capture only one feature well:

- no tail dependence,
- lower-tail dependence only,
- or upper-tail dependence only.

The paper therefore constructs convex combinations of three components:

$$
C(u_1,u_2;\Theta)=
w_1 C^{LTD}(u_1,u_2;\theta_1)
 + w_2 C^{NTD}(u_1,u_2;\theta_2)
 + (1-w_1-w_2) C^{UTD}(u_1,u_2;\theta_3).
$$

The candidate building blocks are chosen from:

- lower-tail-dependent copulas such as Clayton and rotated Gumbel/Joe/Galambos,
- asymptotically independent copulas such as Gaussian, Frank, FGM, and Plackett,
- upper-tail-dependent copulas such as Gumbel, Joe, Galambos, and rotated Clayton.

Taking one candidate from each class yields `4 x 4 x 4 = 64` possible three-copula mixtures. That is an important design choice: the paper tries hard to avoid calling a stock "crash sensitive" merely because the wrong copula was imposed.

### 4. Estimate LTD stock by stock, month by month, on rolling 12-month windows

For each stock-month:

1. take daily stock returns and daily market returns from the previous 12 months;
2. estimate the marginal CDFs `F_i` and `F_m` nonparametrically by scaled empirical distributions;
3. estimate parameters for each of the 64 candidate copula mixtures;
4. choose the best-fitting mixture by minimizing the integrated Anderson-Darling distance between the empirical copula and the fitted parametric copula;
5. compute the LTD and UTD implied by the chosen copula.

The paper explicitly prefers a short 12-month window because tail dependence is time varying. Longer windows smooth away the state dependence the authors are trying to measure.

### 5. Ground the measure in asset-pricing theory rather than leaving it as a statistic

The paper includes a theoretical argument based on investor preferences over tail outcomes. The key claim is that lower- and upper-tail dependence map into tail-based co-moment risk, and that the sign of the premium follows from how painful marginal utility is in the left tail.

The implication is intuitive and precise:

- strong LTD means the stock fails as a hedge exactly when the market is crashing, so it should command a **higher** expected return;
- strong UTD means the stock comoves in the right tail, which can reduce its hedge value differently and should matter with the opposite sign.

Empirically the LTD channel dominates. That is consistent with investors caring more about crash insurance than about extra upside comovement.

### 6. Test the measure in both regressions and portfolios

The main asset-pricing tests use two complementary designs.

**Fama-MacBeth regressions**

Each month, regress next month's excess returns on current LTD and a set of controls. The control set is intentionally demanding and includes:

- market beta,
- downside beta and upside beta,
- coskewness,
- cokurtosis,
- Kelly-Jiang tail-risk beta,
- size, value, momentum, illiquidity, and related firm characteristics.

If LTD were just a nonlinear proxy for one of these known objects, its coefficient should disappear. It does not.

**Portfolio sorts**

Each month, sort stocks into quintiles by lagged LTD:

- Q1 = weak LTD,
- Q5 = strong LTD.

Then form future return portfolios, typically value weighted, and compute both raw returns and factor alphas. The `Q5 - Q1` portfolio earns about `0.360%` per month in average future return, and the spread survives CAPM, Carhart, and Fama-French five-factor adjustments.

### 7. Prove that LTD is not the same thing as downside beta

This is a central methodological point. Downside beta and LTD are related but not equivalent.

Downside beta is a conditional covariance over all below-average market states. LTD asks about the **limit** of conditional crash probability in the far left tail. A stock can have modest downside beta and still exhibit large LTD if its dependence becomes especially strong only in crashes.

The paper makes this distinction operational by:

- including downside beta directly in the regressions,
- conducting double sorts on LTD and downside beta,
- comparing LTD to alternative tail-beta and co-moment measures.

The LTD premium remains. That persistence is the main evidence that true crash dependence contains pricing information beyond moment-based downside risk.

### 8. Validate the interpretation by looking at realized crash states

The equilibrium story is that weak-LTD stocks provide insurance in market crashes and should therefore earn lower average returns. The paper checks this directly:

- during extreme market downturns, weak-LTD stocks outperform strong-LTD stocks;
- aggregate LTD spikes in known crisis periods such as 1987, 1998, and 2008;
- the LTD premium is larger when market participants plausibly care more about crash protection.

So the cross-sectional premium lines up with the realized hedge value of the weak-LTD stocks in the states the measure was designed to isolate.

### 9. Stress-test the estimation procedure instead of relying on one implementation

Because copula estimation can be sensitive to specification, the paper repeats the exercise several ways:

- fixed ad hoc copula combinations,
- two-copula mixtures instead of three-copula mixtures,
- log-likelihood rather than integrated Anderson-Darling model selection,
- 24-month and 36-month rolling windows,
- industry portfolio sorts,
- LTD estimates computed after residualizing returns for time-varying volatility.

The effect survives these checks, though the 12-month window performs best, which reinforces the claim that LTD is genuinely time varying and should be estimated with short lookbacks.

## Domain of applicability

- **Where it works well:** Equity cross sections when the relevant risk object is crash comovement with the market, not generic market exposure.
- **What is implementable:** Monthly rolling LTD estimation from daily stock and market returns, followed by stock ranking or cross-sectional regression on lagged LTD.
- **Main limitation:** The signal is computationally expensive and noisy for thinly traded names, because every stock-month requires a nontrivial copula-selection problem.
- **Why the paper matters:** It replaces vague talk about downside risk with an explicit, estimable tail-dependence object and shows that the market prices that object.
