# 1. Metadata

- **Title:** The Intuition Behind Black-Litterman Model Portfolios
- **Author(s):** Guangliang He, Robert Litterman
- **Year:** 1999
- **Journal/Venue:** Goldman Sachs Investment Management Research note / practitioner paper

# 2. Problem statement

The paper asks: **how can an investor combine equilibrium asset-allocation information with a small set of subjective views so that the implied expected returns and resulting mean-variance portfolio are stable, intuitive, and analytically tractable?** Equivalently, starting from the market portfolio $w^{eq}$ and a covariance matrix $\Sigma$, how should one update the implied equilibrium returns $\Pi$ after observing linear views $P\mu \approx Q$?

# 3. Approach (short)

The method is Bayesian mean-variance portfolio construction. The market portfolio is treated as revealing a prior mean return vector $\Pi=\delta \Sigma w^{eq}$, views are encoded as noisy linear restrictions $P\mu=Q+\varepsilon^{(v)}$, and the posterior mean of expected returns is plugged into the standard unconstrained quadratic-utility optimizer. The novelty of this note is not the posterior formula itself, which comes from the Black-Litterman setup, but the portfolio-level interpretation: the resulting optimal allocation is the equilibrium portfolio plus a weighted sum of portfolios representing the investor’s views.

# 4. Approach (detailed)

1. **Set up the equilibrium prior**

   There are $N$ risky assets with covariance matrix $\Sigma$. The market (equilibrium) portfolio is $w^{eq}$, and aggregate risk aversion is $\delta>0$. The implied equilibrium expected return vector is
   $$
   \Pi=\delta \Sigma w^{eq}.
   $$
   The prior on the unknown expected return vector $\mu$ is
   $$
   \mu=\Pi+\varepsilon^{(e)}, \qquad \varepsilon^{(e)}\sim N(0,\tau \Sigma).
   $$
   Here $\tau>0$ is a scalar measuring uncertainty in equilibrium returns. This is exact within the Gaussian prior formulation.

2. **Encode views as linear observations**

   The investor expresses $K$ views through a matrix $P\in\mathbb R^{K\times N}$ and a vector $Q\in\mathbb R^K$:
   $$
   P\mu = Q+\varepsilon^{(v)}, \qquad \varepsilon^{(v)}\sim N(0,\Omega),
   $$
   where $\Omega$ is diagonal or otherwise positive definite if the views are taken independent or jointly normal with given confidence structure. A row $p_k^\top$ of $P$ defines a portfolio spread, and $q_k$ is the expected return on that spread.

3. **Compute posterior expected returns**

   Since prior and views are Gaussian and independent, the posterior mean is
   $$
   \mu^{BL}
   =
   \left[(\tau\Sigma)^{-1}+P^\top \Omega^{-1}P\right]^{-1}
   \left[(\tau\Sigma)^{-1}\Pi+P^\top\Omega^{-1}Q\right].
   $$
   This is the central updating formula. It is exact in the normal-normal model, not an approximation.

   A useful equivalent form is
   $$
   \mu^{BL}
   =
   \Pi+\tau\Sigma P^\top\left(P\tau\Sigma P^\top+\Omega\right)^{-1}(Q-P\Pi),
   $$
   which makes clear that the posterior is the prior plus a correction proportional to the view mispricing $Q-P\Pi$.

4. **Translate posterior means into optimal portfolios**

   For quadratic utility
   $$
   \max_w \; w^\top \mu - \frac{\delta}{2} w^\top \Sigma w,
   $$
   the unconstrained optimizer is
   $$
   w^\star = (\delta \Sigma)^{-1}\mu.
   $$
   Plugging in $\mu^{BL}$ gives
   $$
   w^{BL}=(\delta\Sigma)^{-1}\mu^{BL}.
   $$
   Because $(\delta\Sigma)^{-1}\Pi=w^{eq}$, the paper’s key interpretation is
   $$
   w^{BL}=w^{eq}+P^\top \Lambda,
   $$
   for a vector $\Lambda\in\mathbb R^K$ of view-portfolio weights determined by $Q,\Omega,P,\Sigma,\tau$. Thus the unconstrained BL portfolio is the market portfolio plus positions in view portfolios.

5. **Characterize the weights on views**

   The note shows that the coefficients on view portfolios vary monotonically with the content and confidence of the views. If one changes a single view $q_k$, holding everything else fixed, then the corresponding portfolio weight $\lambda_k$ moves in the same direction. If the uncertainty of that view, $\omega_k$, rises, the absolute tilt shrinks. In matrix form this follows because the updating term uses
   $$
   \left(P\tau\Sigma P^\top+\Omega\right)^{-1},
   $$
   so larger $\Omega$ downweights the associated signal.

6. **Use constrained optimization when needed**

   The paper emphasizes that the posterior mean $\mu^{BL}$ can be fed into any standard optimizer. For example:
   - unconstrained mean-variance:
     $$
     w^\star=(\delta\Sigma)^{-1}\mu;
     $$
   - budget-constrained minimum-variance portfolio:
     $$
     w^{(m)}=\frac{\Sigma^{-1}\iota}{\iota^\top\Sigma^{-1}\iota};
     $$
   - risk-budgeted and beta-constrained problems admit solutions of the affine form
     $$
     w = a w^\star + b w^{(m)} + c w^{eq}.
     $$
   These formulas are listed explicitly in the appendices.

7. **Proof sketch of the posterior and portfolio decomposition**

   The posterior mean formula is the standard generalized least-squares update for a Gaussian prior and Gaussian linear observation system. Write the log posterior up to constants:
   $$
   -\frac12 (\mu-\Pi)^\top (\tau\Sigma)^{-1}(\mu-\Pi)
   -\frac12 (P\mu-Q)^\top \Omega^{-1}(P\mu-Q).
   $$
   Differentiating with respect to $\mu$ and setting the gradient to zero yields
   $$
   \left[(\tau\Sigma)^{-1}+P^\top\Omega^{-1}P\right]\mu
   =
   (\tau\Sigma)^{-1}\Pi + P^\top\Omega^{-1}Q,
   $$
   hence the posterior mean above. Multiplying by $(\delta\Sigma)^{-1}$ gives the optimal portfolio. Since $\Pi=\delta\Sigma w^{eq}$,
   $$
   (\delta\Sigma)^{-1}\Pi=w^{eq},
   $$
   and every remaining term lies in the span of the columns of $P^\top$, proving that the tilt away from equilibrium is a linear combination of the view portfolios.

# 5. Domain of applicability

The method applies when the investor is comfortable with a covariance matrix $\Sigma$, an equilibrium anchor $w^{eq}$, and linear views $P\mu\approx Q$. It is especially useful in large universes where direct expected-return specification produces unstable mean-variance weights. Its formal justification depends on a Gaussian prior/view structure and quadratic-utility or mean-variance logic. The paper’s intuition extends beyond strict normality, but the exact posterior and clean decomposition into equilibrium plus view portfolios are tied to this linear-Gaussian setup. It also does not solve the hard upstream problems of choosing $\tau$, calibrating $\Omega$, or defending the market portfolio as the right prior anchor.
