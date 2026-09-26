# 1. Metadata

- **Title:** Heterogeneity and Portfolio Choice: Theory and Evidence
- **Author(s):** Stephanie Curcuru, John Heaton, Deborah Lucas, Damien Moore
- **Year:** 2004
- **Journal/Venue:** Survey chapter / working-paper-style manuscript (the file is marked “Revised September 2004”; no journal venue is identified on the first page)

# 2. Problem statement

The paper asks a cross-sectional portfolio-choice question rather than a single-investor optimization question: **which economic frictions and heterogeneities can explain the large observed dispersion in household portfolio composition, including nonparticipation in risky asset markets, low risky shares, and underdiversification?** Formally, the benchmark model is the standard dynamic portfolio problem
$$
\max_{\{c_t,\theta_t\}} E_0\sum_{t=0}^T \beta^t u(c_t)
$$
subject to wealth dynamics and portfolio-return processes, and the paper asks which modifications to this problem generate empirically plausible cross-sectional policies $\theta_t$.

# 3. Approach (short)

The paper is a theory-and-evidence survey with calibration. It organizes the household portfolio-choice literature around progressively richer dynamic programming problems: the frictionless Merton-Samuelson benchmark, then models with background risk, borrowing constraints, participation costs, labor income, entrepreneurial risk, housing, retirement accounts, and life-cycle structure. It compares the policy implications of these models to Survey of Consumer Finances facts on participation, risky shares, and concentration.

# 4. Approach (detailed)

1. **Empirical target moments**

   The paper first fixes the facts to be explained:

   - many households hold zero risky assets;
   - among participants, risky shares vary widely;
   - many portfolios are poorly diversified and tilted toward own business, employer stock, or housing;
   - age, wealth, labor income, and institutional constraints matter.

   The statistical object is therefore not an aggregate market portfolio, but a conditional distribution
   $$
   \mathcal L(\theta_{it}\mid X_{it}),
   $$
   where $\theta_{it}$ denotes portfolio composition and $X_{it}$ household characteristics.

2. **Frictionless benchmark**

   In the classical continuous-time benchmark with one risky asset and CRRA utility,
   $$
   dW_t = \big(rW_t + \theta_t(\mu-r)W_t - c_t\big)\,dt + \theta_t \sigma W_t\,dB_t,
   $$
   the Merton share is
   $$
   \theta_t^\star = \frac{\mu-r}{\gamma \sigma^2}.
   $$
   In the multivariate case,
   $$
   \theta^\star = \frac{1}{\gamma}\Sigma^{-1}(\mu-r\mathbf 1).
   $$
   This benchmark predicts broad participation and smooth risky shares conditional on risk aversion. The paper stresses that this is immediately at odds with the data unless one permits implausibly large heterogeneity in $\gamma$.

3. **Background risk and nontraded wealth**

   The first enlargement adds human capital, entrepreneurial risk, or housing:
   $$
   W_{t+1} = (W_t-c_t-\theta_t^\top \mathbf 1)R_f + \theta_t^\top R_{t+1} + Y_{t+1},
   $$
   where $Y_{t+1}$ is labor or business income. If $Y_{t+1}$ covaries positively with risky-asset returns, optimal risky financial holdings decline because total risk exposure is already large. This is standard spanning logic: nontraded background risk acts like an existing position in risky factors.

4. **Participation costs and market non-entry**

   To explain zero stockholding, the paper emphasizes fixed participation costs $F>0$. Then the investor compares
   $$
   V^{in}(W_t,X_t)-F
   \qquad\text{versus}\qquad
   V^{out}(W_t,X_t),
   $$
   and enters the stock market only when the value gain exceeds the fixed cost. This simple discrete choice generates a wealth threshold for participation and matches the strong empirical link between wealth and stock-market entry much better than the frictionless model.

5. **Life-cycle portfolio choice**

   The dynamic version is a Bellman problem
   $$
   V_t(W_t,S_t)=\max_{c_t,\theta_t}
   \left\{
   u(c_t)+\beta E_t[V_{t+1}(W_{t+1},S_{t+1})]
   \right\},
   $$
   where $S_t$ includes age, labor-income state, pension or retirement-account status, and housing/entrepreneurial wealth. The paper’s survey result is that life-cycle structure plus participation costs explains:

   - delayed entry into risky markets for young/low-wealth households;
   - rising risky participation with age and wealth;
   - some, but not all, of the observed risky-share heterogeneity among participants.

6. **Why underdiversification is hard**

   Classical utility maximization with frictionless access to many securities implies broad diversification, essentially because idiosyncratic risk is cheap to eliminate. The survey therefore highlights underdiversification as a residual puzzle. Employer-stock holdings, own-business risk, and local/informational biases can rationalize some concentration, but calibrated models still struggle to reproduce the extreme empirical concentration seen in household data.

7. **What the paper itself contributes**

   The paper is not proposing one new optimization theorem. Its contribution is comparative and synthetic:

   - map the facts on participation, risky shares, and concentration;
   - place each friction into a common dynamic portfolio-choice structure;
   - evaluate which combinations of frictions can jointly match the observed cross section.

8. **Proof status**

   There is no central new theorem to reproduce. The “proof” logic is model-comparison logic:

   - start from the Merton/Samuelson benchmark;
   - add one friction at a time to the Bellman problem;
   - examine how the induced policy functions shift;
   - compare the implied cross-sectional allocations with the SCF facts.

   The paper’s claims are therefore strongest as a literature synthesis, not as a new structural identification result.

# 5. Domain of applicability

- The paper applies to **household portfolio choice**, not institutional portfolio construction.
- Its strongest conclusions are about **which frictions are necessary** to explain participation and risky-share heterogeneity.
- The evidence supports participation costs, life-cycle effects, and background risk as important, but the survey is explicit that these do **not** fully explain underdiversification.
- Because the paper is synthetic, its scope is broader than any one calibrated model, but its proofs are weaker than those of a single structural paper: broad applicability is argued by accumulation of evidence, not established in one theorem.
