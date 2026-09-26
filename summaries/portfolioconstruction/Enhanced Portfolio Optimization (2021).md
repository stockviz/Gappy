# Enhanced Portfolio Optimization (2021)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/EnhancedPortfolioOptimization_PedersenBabuLevine_2021.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

## 1. Metadata

- **Title:** Enhanced Portfolio Optimization
- **Author(s):** Lasse Heje Pedersen, Abhilash Babu, and Ari Levine
- **Year:** 2021
- **Journal/Venue:** *Financial Analysts Journal*

## 2. Problem statement

The paper asks why standard mean-variance optimization (MVO) performs so poorly in practice and how to repair it without abandoning optimization. The precise issue is that noisy estimates of expected returns and correlations induce extreme allocations to "problem portfolios" that look attractive in sample but fail out of sample.

## 3. Approach (short)

The method diagnoses MVO in principal-component space and then shrinks correlations to penalize the least important principal components. The resulting enhanced portfolio optimization (EPO) can be written as simple correlation-shrunk MVO, as a Bayesian/Black-Litterman update, or as a robust optimization solution. The technique is PCA diagnosis plus regularized mean-variance optimization.

## 4. Approach (detailed)

1. **Start from standard MVO.**

   With signal $s$, covariance matrix $\Sigma$, and risk aversion $\gamma$, standard MVO chooses
   $$
   x_{MVO}=\frac{1}{\gamma}\Sigma^{-1}s.
   $$

2. **Move to principal-component space.**

   Write the covariance matrix as
   $$
   \Sigma = \sigma \Omega \sigma,
   $$
   and decompose the correlation matrix
   $$
   \Omega = P D P^\top,
   $$
   where $D$ contains eigenvalues (principal-component variances). In PC coordinates, MVO allocates risk in proportion to the estimated Sharpe ratios of the principal-component portfolios.

3. **Identify the problem portfolios.**

   The least important PCs (smallest eigenvalues) are fragile:

   - their risk is most likely underestimated,
   - their expected return estimates are noisy relative to their tiny estimated risk,
   - MVO therefore applies large leverage to them.

   These are the "problem portfolios" that drive bad out-of-sample behavior.

4. **Simple EPO: shrink correlations.**

   Replace the correlation matrix by
   $$
   \tilde\Omega = (1-\omega)\Omega + \omega I,
   $$
   with shrinkage parameter $\omega\in[0,1]$. Then set
   $$
   \tilde\Sigma = \sigma \tilde\Omega \sigma
   $$
   and optimize as usual:
   $$
   x_{EPO}=\frac{1}{\gamma}\tilde\Sigma^{-1}s.
   $$
   In PC space this amounts to shrinking low-variance components toward the average variance, thereby reducing leverage on fragile directions.

5. **Anchored/Bayesian EPO.**

   Let $a$ be an anchor portfolio and let signal noise have covariance $\Lambda$. The posterior/Bayesian version yields
   $$
   x=\frac{1}{\gamma}(\tau\Sigma+\Lambda)^{-1}(\tau s + \gamma \Lambda a),
   $$
   which the paper shows is equivalent to a Black-Litterman specification under appropriate parameterization.

6. **Robust-optimization interpretation.**

   Solve
   $$
   \max_x \min_\mu \left\{(x-a)^\top \mu - \frac{\gamma}{2}x^\top \Sigma x\right\}
   $$
   subject to ellipsoidal uncertainty
   $$
   (\mu-s)^\top \Lambda^{-1}(\mu-s)\le c^2.
   $$
   The solution coincides with the anchored EPO form above. Hence correlation shrinkage, Bayesian updating, and robust optimization are three representations of the same regularization logic.

7. **Empirical use.**

   The paper estimates $\omega$ from past out-of-sample Sharpe ratios and applies EPO to time-series momentum and industry momentum, showing sizeable gains relative to standard MVO, equal weighting, and existing benchmark constructions.

### Proof sketch

In principal-component space, MVO weights are diagonalized, so the optimizer's overexposure to low-eigenvalue directions becomes transparent. Correlation shrinkage raises the eigenvalues of the least important PCs, reducing their ex ante Sharpe ratios and leverage. The Bayesian and robust forms are obtained by completing the square in the posterior or worst-case mean problem, which yields the same regularized inverse as the shrinkage form.

## 5. Domain of applicability

The method applies when expected returns and correlations are both noisy and the investor still wants a mean-variance optimizer rather than a purely heuristic portfolio. It is especially relevant in large universes or factor portfolios where small-eigenvalue directions are abundant. It is not a transaction-cost or multiperiod dynamic model, and its performance depends on the empirical choice of shrinkage/anchor parameters. The broader applicability claimed by the paper is broadly supported for regularized MVO, but not for all possible portfolio problems.

## 6. Principal-component diagnosis in implementable notation

The published source is *Financial Analysts Journal* 77(2), 124-151, DOI 10.1080/0015198X.2020.1854543. Its diagnosis uses principal components of the **correlation** matrix, so assets are first put into comparable volatility units. Let $D=\operatorname{diag}(\sigma_i)$, $C=D^{-1}\Sigma D^{-1}$, and $C=U\operatorname{diag}(\lambda_i)U^\top$. Write $z=Dw$ for volatility-scaled positions and $a=D^{-1}\widehat\mu$ for expected returns per unit standalone risk. Unconstrained MVO gives

$$
U^\top z=\gamma^{-1}\operatorname{diag}(\lambda_i^{-1})U^\top a.
$$

The smallest eigenvalues magnify both estimation noise in $a$ and errors in the corresponding variance. The direction can look like a low-risk combination of offsetting positions while having a large inferred Sharpe ratio. Figure 1 uses monthly data for 55 global assets over 1985-2018 and shows this joint effect: the least important estimated principal components have risk understated, expected return overstated, and poor realized Sharpe ratios despite receiving large MVO allocations.

For simple EPO, use $C_\eta=(1-\eta)C+\eta I$. Its eigenvectors are unchanged and eigenvalues become $(1-\eta)\lambda_i+\eta$. For $\lambda_i<1$, the estimated risk of the direction rises; for $\lambda_i>1$, it falls. Thus correlation shrinkage is not a uniform inflation of every risk estimate. It redistributes the optimizer's emphasis away from the low-eigenvalue directions. The endpoint $\eta=1$ gives $w_i\propto\widehat\mu_i/\sigma_i^2$, which is signal-weighted inverse variance, not automatically equal weighting. Equal-risk or equal-notional endpoints require specific signal scaling.

## 7. Why this can fix alpha errors with a known covariance

Suppose the investor's prior mean vector has mean $\bar\mu=\gamma\Sigma a_0$ and covariance $\tau\Sigma$, where $a_0$ is an anchor portfolio. The observed signal is $s=\mu+\epsilon$ with independent Gaussian error covariance $\Lambda$. Gaussian conditioning yields

$$
E[\mu\mid s]=\bar\mu+\tau\Sigma(\tau\Sigma+\Lambda)^{-1}(s-\bar\mu).
$$

Substituting this posterior mean into MVO, and simplifying in matrix form, gives the source's expression

$$
w=\frac1\gamma(\Sigma+\Lambda/\tau)^{-1}
\left(s+\frac{\gamma}{\tau}\Lambda a_0\right).
$$

Although the investor only introduced measurement error in expected returns, the final allocation can be computed as if the covariance had been inflated by $\Lambda/\tau$. When signal noise is diagonal in volatility-scaled units, this becomes correlation shrinkage plus an appropriate scale adjustment. The anchor is the allocation implied by the prior mean, not an arbitrary extra vector to insert after solving.

The robust formulation instead minimizes over uncertain expected returns in an ellipsoid while evaluating incremental performance relative to the anchor. Its penalty is proportional to the uncertainty norm of $w-a_0$. Its first-order conditions can be written in a similar regularized form, with a multiplier that depends on the solution. These equivalences require the stated uncertainty/prior structure and parameter mapping; they do not mean every Black-Litterman prior or every robust uncertainty set generates simple EPO.

## 8. Parameter selection is decision-focused

The authors distinguish shrinkage selected to estimate covariance accurately from shrinkage selected to improve the final portfolio's out-of-sample Sharpe ratio. The latter can be much larger because it also offsets alpha uncertainty. A parameter near 75% worked well in several applications reported in the paper, but it is not a universal theorem or a fixed production recommendation.

Their out-of-sample procedure estimates which parameter would have produced the best Sharpe ratio using information available up to a date, then applies that choice to the next period. A reproduction should include the fitting window, shrinkage grid, risk normalization and signal scaling in the research specification. Comparing alternatives at different risk levels obscures whether an improvement comes from direction selection or merely a leverage change.

The empirical applications are time-series momentum across global equities, bonds, currencies and commodities, and industry momentum within equities. The reported improvements include outperformance of equal-notional and equal-volatility momentum, standard MVO, and MVO with improved risk estimators. The industry application reports significant alpha relative to the Fama-French five-factor model augmented with standard industry momentum. These results evaluate particular signals and universes; they do not demonstrate that correlation shrinkage creates expected returns in an uninformative signal.

## 9. Implementation checks and scope

Estimate volatilities and correlations from synchronized histories; build the shrunken correlation matrix; reconstruct covariance in original units; solve the resulting linear system; and impose the desired risk target and feasible set. A closed-form inverse-covariance formula applies to the unconstrained model with a cash asset. Full investment, sector neutrality, leverage limits or trade costs require solving the corresponding constrained problem using the modified inputs.

Shrinking correlation toward identity preserves the estimated marginal variances, so it cannot by itself repair systematically understated volatility. The result also depends on the noise geometry. If correlated forecast errors align with a genuine economic factor, a diagonal error model can suppress or preserve the wrong directions. The anchor offers a way to encode a baseline allocation, but a poor anchor is still a poor prior.

A useful research diagnostic is to reproduce the paper's component-level decomposition: compare predicted and realized variance, predicted and realized mean, and the risk actually allocated across components. This reveals whether a small eigenvalue is an estimation artifact or a legitimate hedge. Then assess turnover, financing, capacity and net performance under the intended mandate. EPO's contribution is a parsimonious regularization framework and an explanation of why it works in the tested applications; it is not a substitute for an economically credible alpha model.
