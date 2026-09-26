# Optimal Orthogonal Portfolios with Conditioning Information (2015)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/OptimalOrthogonalPortfolio_FersonSiegel_2015.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Optimal Orthogonal Portfolios with Conditioning Information
- **Author(s):** Wayne E. Ferson, Andrew F. Siegel
- **Year:** 2015
- **Journal/Venue:** Book chapter / handbook-style chapter

# 2. Problem statement

The paper asks how to define and compute the **optimal orthogonal portfolio** relative to a benchmark when portfolio weights may depend on lagged conditioning information $Z_t$. In the unconditional case, the optimal orthogonal portfolio measures how far a benchmark is from the mean-variance frontier. The paper generalizes this object to the Hansen-Richard setting with dynamic, information-conditioned portfolios.

# 3. Approach (short)

The paper works in the conditional mean-variance framework of Hansen and Richard. It first characterizes efficient portfolios whose weights are functions of the information set $Z_t$. It then defines the most mispriced or optimal orthogonal portfolio $R_c$ relative to a benchmark $R_p$ as the portfolio maximizing squared alpha per unit variance subject to orthogonality. The main results express $R_c$ in closed form and prove a conditional analogue of the law of conservation of squared Sharpe ratios:
$$
S_s^2=S_p^2+S_c^2.
$$

# 4. Approach (detailed)

1. **Conditional mean-variance setting**

   Asset returns $R_{t+1}$ are observed along with lagged instruments $Z_t$. Portfolio weights $x(Z_t)$ are measurable with respect to $Z_t$. This induces a set of dynamic portfolio returns whose unconditional means and unconditional standard deviations define an unconditional frontier “efficient with respect to $Z$.”

   The key distinction from the static case is that portfolio weights may vary over time with information.

2. **Benchmark and orthogonal portfolio**

   Let $R_p$ be a benchmark portfolio with unconditional mean $m_p$ and variance $s_p^2$. For a candidate orthogonal portfolio $R_c$, define its unconditional alpha relative to $R_p$ by
   $$
   \alpha_c
   =
   m_c-\left[g_0+\frac{m_p-g_0}{s_p^2}s_{cp}\right],
   $$
   where $g_0$ is a zero-beta rate and $s_{cp}=\operatorname{Cov}(R_c,R_p)$.

   The optimal orthogonal portfolio maximizes
   $$
   \frac{\alpha_c^2}{s_c^2}.
   $$
   Because orthogonality implies $s_{cp}=0$, the variance in the denominator is also the residual variance relative to the benchmark.

3. **Efficient-with-respect-to-$Z$ portfolio**

   Let $R_s$ denote the portfolio, with weights depending on $Z$, that maximizes the squared unconditional Sharpe ratio
   $$
   S_s^2=\frac{(m_s-g_0)^2}{s_s^2}.
   $$
   The chapter’s Theorems 1 and 2 characterize the weights of such efficient portfolios in cases with:

   - no risk-free asset;
   - constant risk-free rate;
   - time-varying conditionally risk-free rate $R_f(Z)$.

   These weights are explicit functions of conditional moments such as
   $$
   m(Z)=E(R\mid Z),\qquad
   E(RR^\top\mid Z).
   $$

4. **Proposition 2: explicit orthogonal-portfolio weights**

   The optimal orthogonal portfolio $R_c$ has weights $x_c(Z)$ that are explicit functions of the conditional moment matrices. In the case with a risk-free asset, the weights take the form
   $$
   x_c(Z)=A\big((c+1)m_s+b-R_f\big)Q\big(m(Z)-R_f\mathbf 1\big)+B x_p,
   $$
   where $Q$ is built from conditional second moments and $A,B,a,b,c$ are scalar functions/constants defined from the conditional frontier. The exact constants depend on whether the risk-free rate is absent, constant, or time-varying.

   The important structural point is simpler than the notation: the orthogonal portfolio combines the benchmark with an efficient-with-respect-to-$Z$ portfolio through coefficients determined by unconditional mean-variance geometry.

5. **Proposition 3: linear combination representation**

   The most useful representation is
   $$
   R_c
   =
   \frac{\frac{m_s-g_0}{s_s^2}R_s-\frac{m_p-g_0}{s_p^2}R_p}
   {\frac{m_s-g_0}{s_s^2}-\frac{m_p-g_0}{s_p^2}}.
   $$
   Equivalently,
   $$
   R_c = A R_s + B R_p,\qquad A+B=1.
   $$
   This shows $R_c$ is the regression residual of the efficient-with-respect-to-$Z$ portfolio on the benchmark, normalized so that it is itself a portfolio.

   The proof is straightforward frontier algebra: choose the linear combination of $R_s$ and $R_p$ that makes covariance with $R_p$ zero and then normalize.

6. **Proposition 4: law of conservation of squared Sharpe ratios**

   The chapter proves
   $$
   S_s^2=S_p^2+S_c^2.
   $$
   This is the conditional-information analogue of the classical decomposition for orthogonal portfolios. The proof uses the fact that $R_s$ can be decomposed into the benchmark component plus the orthogonal component, with no covariance cross term.

   Concretely, if $R_s=R_p+\text{active component}$ and the active component is orthogonal to $R_p$, then the mean-standard-deviation geometry implies additivity of squared Sharpe ratios.

7. **Economic interpretation**

   The squared Sharpe ratio of $R_c$ measures how far the benchmark lies from the frontier available to an informed manager using $Z$. If $S_c^2=0$, the benchmark is already efficient with respect to the information. The larger $S_c^2$, the greater the potential value of dynamic tilts based on $Z$.

   This makes $R_c$ the correct active-management object in the presence of conditioning information.

8. **Proof structure**

   The chapter combines three ingredients:

   - Hansen-Richard conditional mean-variance frontier;
   - orthogonalization of one portfolio relative to another;
   - static frontier algebra carried out over the larger space of $Z$-measurable portfolio rules.

   The results are exact conditional-moment identities, not asymptotic approximations.

**Additional mathematical details**

The orthogonal portfolio can be read as an $L^2$-projection residual. If $R_s$ is the efficient portfolio achievable with conditioning information and $R_p$ is the benchmark, then the optimal orthogonal portfolio is the normalized combination
$$
R_c = a R_s + b R_p
$$
chosen so that $\operatorname{Cov}(R_c,R_p)=0$. Solving
$$
a\,\operatorname{Cov}(R_s,R_p)+b\,\operatorname{Var}(R_p)=0
$$
and normalizing to portfolio weights yields the closed-form expression in the paper. The law
$$
S_s^2=S_p^2+S_c^2
$$
is then just the Pythagorean identity in the mean-standard-deviation plane once the covariance cross term is killed by construction.

What changes relative to the classical case is not the algebra but the opportunity set. The efficient object $R_s$ itself comes from weights that are measurable with respect to $Z_t$, so the distance $S_c^2$ measures benchmark inefficiency relative to the larger Hansen-Richard conditional frontier, not merely relative to the static unconditional frontier.

# 5. Domain of applicability

- The theory applies to **dynamic portfolio rules measurable with respect to lagged instruments**.
- It is strongest in settings where conditional moments are well defined and second moments exist.
- The object is still **mean-variance**; the paper does not solve nonquadratic utility or trading-friction problems.
- In practice, implementing the formulas requires estimating conditional moments and therefore introduces substantial model risk that the chapter does not analyze asymptotically.

# 6. Solving the unconditional problem with conditional moments

This is Chapter 35 of *Handbook of Financial Econometrics and Statistics*, pp. 977–1001. The relevant objective evaluates **unconditional** moments of a payoff generated using conditional information. It differs from optimizing a conditional Sharpe ratio separately at every date. The latter ignores the contribution of changing conditional means to unconditional variance.

With constant risk-free return $r_f$, set $a(Z)=E[R-r_f\mathbf1\mid Z]$, $M(Z)=E[(R-r_f\mathbf1)(R-r_f\mathbf1)^\top\mid Z]$, and $z=E[a^\top M^{-1}a]$. For target unconditional mean $m_s$, the frontier weights are
$$
x_s(Z)=\frac{m_s-r_f}{z}M(Z)^{-1}a(Z),\qquad
\operatorname{Var}(R_s)=\frac{1-z}{z}(m_s-r_f)^2.
$$
Consequently the maximum squared Sharpe ratio is $z/(1-z)$. Under nonsingular conditional covariance $\Sigma(Z)$, define $q(Z)=a^\top\Sigma^{-1}a$. Sherman–Morrison gives
$$
M^{-1}a=\frac{\Sigma^{-1}a}{1+q(Z)},\qquad z=E\frac{q(Z)}{1+q(Z)}.
$$
The denominator moderates extreme forecasts. Replacing $M^{-1}$ with $\Sigma^{-1}$ loses this correction and generally solves a different problem.

For a known-at-formation but time-varying $R_f(Z)$, the source's Theorem 1 gives
$$
x_s(Z)=(\lambda-R_f(Z))Q(Z)a(Z),\quad
\lambda=\frac{m_s-E[R_f]+E[R_fa^\top Qa]}{E[a^\top Qa]}.
$$
This explicitly recognizes that a conditionally risk-free asset is unconditionally variable. With no risk-free asset, the weights must sum to one for every information realization; the source supplies a different solution built from the inverse conditional raw second-moment matrix $E[RR^\top\mid Z]^{-1}$. None of these cases is obtained by simply replacing a constant cash return in a static Sharpe formula with its sample average.

# 7. Orthogonality and normalization

Let $c_{sp}=\operatorname{Cov}(R_s,R_p)$ and $v_p=\operatorname{Var}(R_p)$. The useful equivalent expression is
$$
R_c=\frac{v_pR_s-c_{sp}R_p}{v_p-c_{sp}}.
$$
Covariance with $R_p$ is zero by cancellation, while the coefficients sum to one. This requires $v_p-c_{sp}\ne0$; degenerate cases need separate treatment. The object is a normalized portfolio return, not merely the raw OLS residual after subtracting an intercept.

The squared-Sharpe identity concerns the best combination of orthogonal components. For excess means $a_p,a_c$ and uncorrelated returns with variances $v_p,v_c$, maximizing the squared Sharpe ratio over combinations gives $a_p^2/v_p+a_c^2/v_c$. Orthogonality alone does not mean that an arbitrary sum $R_p+R_c$ achieves this bound. The coefficients matter, as do consistent zero-beta or risk-free conventions.

The identity measures benchmark inefficiency relative to a larger information-feasible return space. It does not establish that an estimated manager can realize the population gap. Optimizing the same sample used to estimate conditional moments creates selection and estimation effects, just as it does in static mean-variance analysis.

# 8. Empirical illustration and limitations of its interpretation

The chapter uses annual returns from 1931–2007: small, value and growth stock portfolios; long-term US government bonds; and the CRSP value-weighted market benchmark. Instruments are lagged Treasury returns and the log market price/dividend ratio. The fixed zero-beta rate is the average Treasury return, $3.8\%$ annually. Conditional means are modeled using regressions on instruments and the conditional covariance is taken as constant in the illustration.

The fixed-weight orthogonal portfolio has alpha $4.66\%$, residual volatility $16.5\%$ and information ratio $0.282$. With information, the fixed-risk-free, no-risk-free and varying-risk-free versions have ratios $0.340,0.297,0.955$. The improvement is much larger when cash exposure can vary. Some average positions are extreme: the fixed-weight orthogonal portfolio shorts the market by $126\%$ and holds $141\%$ in long-term bonds. These are explanatory optimized examples rather than an investable recommendation.

The source explicitly acknowledges that the subsequent annual Treasury rollover return is not actually known at formation in its varying-risk-free illustration; lagged and subsequent Treasury returns have correlation $0.92$. This approximation limits the literal empirical interpretation of the conditionally risk-free theorem. Full-sample estimates and the absence of realistic trading constraints also limit out-of-sample claims.

There is a small arithmetic inconsistency in printed Table 35.1: $0.182+0.909=1.091$, although one table entry reads $1.191$. The surrounding text reports the correct upper value $1.091$. The theoretical conservation identity should be implemented from consistent underlying moments, not copied from that table entry.

Appendix 2 discusses a parametric bootstrap that preserves dependence between return shocks and instrument shocks. It models persistent instruments recursively, resampling joint shock rows rather than independently shuffling instruments and returns. This matters because naive resampling destroys persistence and can miss predictive-regression bias. In practice, estimation, regularization and genuinely out-of-sample evaluation are needed before interpreting an apparent orthogonal Sharpe opportunity as achievable active performance.
