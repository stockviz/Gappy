# Capital Market Equilibrium with Restricted Borrowing
**Authors:** Fischer Black
**Year:** 1972
**Journal/Venue:** Journal of Business

## Problem statement

The Sharpe-Lintner CAPM assumes investors can borrow unlimited amounts at the risk-free rate. Black's question is what happens to equilibrium pricing when that assumption fails. The paper is motivated by the empirical fact that low-beta portfolios seemed to do too well and high-beta portfolios too poorly relative to the standard CAPM.

## Approach (short)

Black relaxes the unrestricted-borrowing assumption and rebuilds equilibrium from mean-variance portfolio choice. The key steps are:

1. characterize efficient portfolios without relying on unlimited risk-free borrowing;
2. show that efficient risky portfolios can still be represented as combinations of two basic portfolios;
3. derive the asset-pricing relation with a zero-beta portfolio replacing the risk-free borrowing rate.

The result is the Black CAPM:

$$
E(R_i)=E(R_z)+\beta_i\,[E(R_M)-E(R_z)],
$$

where `R_z` is the return on a portfolio uncorrelated with the market.

## Approach (detailed)

### 1. Start from the standard CAPM benchmark

Black begins with the usual CAPM relation

$$
E(\tilde R_i)=R_f+\beta_i\,[E(\tilde R_M)-R_f],
$$

with

$$
\beta_i=\frac{\operatorname{cov}(\tilde R_i,\tilde R_M)}{\operatorname{var}(\tilde R_M)}.
$$

He then notes that the most restrictive assumption behind this equation is the ability to borrow at `R_f` without limit.

### 2. Re-solve mean-variance choice without relying on a riskless borrowing technology

The intermediate step is a no-riskless-asset mean-variance problem. For a given target expected return, investor `k` chooses portfolio weights `x_{ki}` to:

$$
\min \operatorname{var}(\tilde R_k)=\sum_{i=1}^N \sum_{j=1}^N x_{ki}x_{kj}\operatorname{cov}(\tilde R_i,\tilde R_j),
$$

subject to

$$
E(\tilde R_k)=\sum_{j=1}^N x_{kj} E(\tilde R_j),
$$

$$
\sum_{j=1}^N x_{kj}=1.
$$

The Lagrangian first-order conditions imply that every efficient portfolio can be written as a linear combination of two basic portfolios:

$$
x_{ki}=w_{kp}x_{pi}+w_{kq}x_{qi}.
$$

This is the structural backbone of the paper. Even without the simple capital-market line, efficient portfolios still lie in a two-fund spanning set.

### 3. Interpret restricted borrowing in equilibrium

If investors cannot lever the market portfolio by borrowing at `R_f`, they will not all hold just one risky tangency portfolio plus borrowing/lending. Some investors are pushed toward different efficient combinations of risky assets.

That changes the cross-sectional pricing relation. The intercept is no longer tied mechanically to the risk-free rate. Instead, there exists a portfolio `z` with:

$$
\operatorname{cov}(R_z,R_M)=0,
$$

and expected returns satisfy the linear relation

$$
E(R_i)=E(R_z)+\beta_i[E(R_M)-E(R_z)].
$$

This is the zero-beta CAPM.

### 4. Why the security market line becomes flatter

Under unrestricted borrowing, investors who want more expected return lever the market portfolio. When borrowing is constrained, they instead tilt toward high-beta risky assets directly. That extra demand raises the prices of high-beta assets and lowers their expected returns relative to Sharpe-Lintner.

Symmetrically:

- low-beta assets become under-demanded,
- their prices are lower,
- their expected returns are higher than in the standard CAPM.

So the paper's main empirical implication is a flatter security market line.

### 5. Connect the theory to the data that motivated it

Black explicitly frames the model as consistent with evidence from:

- Black, Jensen, and Scholes,
- Miller and Scholes,
- and other studies showing low-beta outperformance and high-beta underperformance.

The point is not to overthrow equilibrium pricing, but to show that the bad empirical fit of the classic CAPM can come from one unrealistic financing assumption.

### 6. What a reader should implement

For empirical use, the paper implies:

1. estimate market betas as usual;
2. do not force the pricing intercept to equal the T-bill rate;
3. estimate the cross-sectional line allowing a zero-beta intercept;
4. interpret a flatter-than-CAPM security market line as consistent with leverage constraints.

That is the operational meaning of Black's model.

## Domain of applicability

- **Where it works well:** Explaining low-beta anomalies, leverage-constraint effects, and empirical departures from the Sharpe-Lintner CAPM.
- **What is implementable:** Cross-sectional tests of the Black CAPM with a free intercept or an estimated zero-beta portfolio.
- **Main limitation:** The model still lives in mean-variance equilibrium and does not by itself resolve all cross-sectional anomalies.
- **Why the paper matters:** It is the canonical demonstration that borrowing constraints change the CAPM intercept and flatten the security market line.
