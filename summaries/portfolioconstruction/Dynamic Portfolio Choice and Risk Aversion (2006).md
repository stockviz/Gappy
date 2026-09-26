# Dynamic Portfolio Choice and Risk Aversion (2006)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/PortfolioChoice_Skiadas_2006.pdf>), 47 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Dynamic Portfolio Choice and Risk Aversion
- **Author(s):** Costis Skiadas
- **Source version:** December 23, 2005; updated February 13, 2007 (the local filename is labeled 2006)
- **Journal/Venue:** Chapter draft, forthcoming in the *Handbook of Financial Engineering*

# 2. Problem statement

The chapter develops a general theory of **continuous-time lifetime consumption-portfolio choice under recursive utility**, with particular emphasis on forms of risk aversion that are not captured by time-additive expected utility. The main mathematical question is: **how can recursive utility and optimal portfolio choice be characterized using BSDE/FBSDE methods, including source-dependent first- and second-order risk aversion?**

# 3. Approach (short)

The method is stochastic control via backward stochastic differential equations. Recursive utility is defined as the solution of a BSDE with aggregator $F$. Utility supergradients are derived from the BSDE representation and combined with state-price dynamics to obtain optimality conditions as a forward-backward SDE system. Under homotheticity, the system can be reduced to a single BSDE; for important subclasses such as Epstein-Zin and related specifications, this BSDE becomes quadratic and can be reduced further to ODE systems in Markov settings.

# 4. Approach (detailed)

1. **Recursive utility as a BSDE**

   For a consumption plan $c$, recursive utility is defined by a BSDE of the form
   $$
   U_t
   = F(T,c_T)+
   \int_t^T F(s,c_s,U_s,\Gamma_s)\,ds
   -\int_t^T \Gamma_s^\top\,dB_s,
   $$
   or in differential form
   $$
   dU_t = -F(t,c_t,U_t,\Gamma_t)\,dt + \Gamma_t^\top dB_t.
   $$
   The function $F$ is the **aggregator**. Different choices of $F$ generate Duffie-Epstein utility, Epstein-Zin utility, robust-control-style utilities, and source-dependent variants.

2. **Decision-theoretic properties**

   A central general result is that, under a regularity/comparison condition on the BSDE, recursive utility is:

   - dynamically consistent,
   - monotone,
   - concave,
   - independent of unrealized past alternatives.

   These are established using a BSDE comparison lemma: if one driver dominates another and terminal conditions are ordered, then the utility processes are correspondingly ordered.

3. **State prices and linear BSDEs**

   Before solving the portfolio problem, the chapter develops the dynamics of state-price densities. The state-price density follows a forward SDE; the associated wealth/valuation equation is a linear BSDE. This matters because optimality can be verified when the utility supergradient process matches a state-price density.

   The logic is the continuous-time version of the static first-order condition:
   $$
   \text{marginal utility} \propto \text{state price density}.
   $$

4. **Utility supergradient**

   The chapter derives a utility supergradient density from the recursive utility BSDE. If $F_c$ and $F_U$ denote derivatives of the aggregator, then the marginal-utility process can be written in terms of a linearization of the BSDE around the optimal plan. This gives a dynamic analogue of the first-order condition for utility maximization.

5. **Optimality as an FBSDE system**

   Combining:

   - wealth dynamics (forward SDE),
   - recursive utility dynamics (backward SDE),
   - the supergradient/state-price matching condition,

   the optimal consumption-portfolio problem becomes an **FBSDE**.

   In symbolic form, the system contains:

   - a forward wealth equation
     $$
     dW_t = \text{portfolio return and consumption terms},
     $$
   - a backward utility equation
     $$
     dU_t = -F(t,c_t,U_t,\Gamma_t)\,dt + \Gamma_t^\top dB_t,
     $$
   - first-order conditions linking consumption and portfolio choice to the adjoint/supergradient processes.

   Proposition 23 is the key verification result: if a feasible plan produces a supergradient density equal to a state-price density, then it is optimal.

6. **Homothetic recursive utility**

   The chapter then imposes scale invariance / homotheticity. This is crucial because it uncouples the FBSDE. Instead of solving for wealth and utility jointly, one can often reduce the problem to a single BSDE for a suitably normalized multiplier or value ratio.

   This is the real tractability result of the chapter. Without homotheticity, the general FBSDE is usually too hard to solve explicitly.

7. **Duffie-Epstein and Epstein-Zin cases**

   A major special case is the continuous-time limit of Kreps-Porteus utility, i.e. Duffie-Epstein utility. The associated aggregator can be written in homothetic form, and Epstein-Zin utility becomes a parametric special case. In these cases the chapter derives explicit optimality conditions and shows how risk aversion and intertemporal substitution separate; the later quadratic-BSDE examples impose additional functional restrictions.

8. **Source-dependent risk aversion**

   The chapter’s genuinely novel conceptual contribution is to allow risk aversion to depend on the **source of risk**. Instead of a scalar risk-aversion coefficient applied uniformly across Brownian shocks, one can have a matrix- or direction-dependent penalty. This allows:

   - source-dependent second-order risk aversion with smooth aggregators;
   - source-dependent first-order risk aversion with nonsmooth certainty equivalents.

   This connects recursive utility to ambiguity-aversion and robust-control formulations.

9. **Quadratic BSDEs**

   For important homothetic specifications, the normalized backward equation becomes quadratic:
   $$
   dY_t = -g(t,Y_t,Z_t)\,dt + Z_t^\top dB_t,
   $$
   where $g$ is quadratic in $Z_t$. In Markovian environments one can conjecture an affine-quadratic form for $Y_t$, apply Itô’s lemma, and reduce the BSDE to a system of ODEs (typically Riccati-type equations). This yields tractable solutions for Epstein-Zin-type problems and related cases.

10. **Proof logic**

   The chapter’s proofs proceed in layers:

   - define recursive utility through a BSDE and prove comparison principles;
   - derive utility supergradients by linearizing the BSDE;
   - match those supergradients to state-price dynamics;
   - obtain verification via the resulting FBSDE;
   - simplify under homotheticity and then under quadratic structure.

   So the chapter is both a general theory and a tractability program.

**Additional mathematical details**

The chapter’s core verification step can be stated succinctly. If recursive utility satisfies the BSDE
$$
U_t = E_t\!\left[\int_t^T F(c_s,U_s,Z_s)\,ds + \Phi(c_T)\right],
$$
then linearizing the driver around a candidate optimum produces a supergradient density process $\pi_t$. Optimality follows when that supergradient can be identified with a state-price density, because then any feasible perturbation has nonpositive first-order effect on lifetime utility. Proposition 23 is exactly this dynamic first-order-condition argument written in BSDE form.

Homotheticity matters because it collapses the coupled wealth-utility system to a normalized backward equation. In the Epstein-Zin class, that normalized BSDE is quadratic in the control term $Z_t$, which is why Markovian problems can often be reduced to Riccati-type ODEs. So the tractability gain is not generic to recursive utility; it comes from the specific homothetic and quadratic structure isolated by the chapter.

# 5. Domain of applicability

- The general results apply to **continuous-time portfolio choice under recursive utility** with sufficient BSDE regularity.
- The explicit tractable solutions require much more:
  - homotheticity,
  - often Markovian dynamics,
  - often quadratic-BSDE structure.
- The source-dependent risk-aversion discussion is conceptually broad, but only certain subclasses are solved explicitly.
- The chapter is mathematically stronger on **representation and optimality conditions** than on complete closed-form solutions in arbitrary environments.


## Source version, setting and what is established

The local filename carries 2006, but the chapter's title page reads **December 23, 2005; updated February 13, 2007**, forthcoming in the *Handbook of Financial Engineering*. Those dates describe the source actually checked. The chapter develops and explains a mathematical framework, largely based on Schroder and Skiadas (2003), and adds a decision-theoretic treatment of source-dependent risk aversion. It contains illustrative solution classes, not a calibrated portfolio backtest or empirical estimate of the gains from recursive preferences.

Uncertainty is generated by a $d$-dimensional Brownian motion over a finite horizon. There are $m\le d$ risky securities, with excess-return dynamics
$$
dR_t=\mu_t^Rdt+(\sigma_t^R)^\top dB_t,
$$
where $\sigma^R$ is $d\times m$ and has linearly independent columns at every state and date. Thus the covariance rate $(\sigma^R)^\top\sigma^R$ is invertible, even when the market is incomplete because $m<d$. The opportunity set may depend on the whole observed history; Markov structure is introduced only for particular solution methods.

A risky-asset weight vector $\psi_t$ and consumption-to-wealth rate $\rho_t$ generate
$$
\frac{dW_t}{W_t}=(r_t-\rho_t+\psi_t^\top\mu_t^R)dt
 +(\sigma_t^R\psi_t)^\top dB_t,
\qquad c_t=\rho_tW_t.
$$
Terminal consumption equals final wealth, so $\rho_T=1$ by convention. The main analysis assumes no transaction costs and no nontradeable endowed income; a tradeable income stream can be capitalized into initial wealth. Convex portfolio constraints and nontradeable income are extensions, not assumptions silently included in every displayed unconstrained formula.

Utility is normalized in consumption units: the agent is indifferent between a plan $c$ and a constant plan equal to $U_t(c)$ from the current information state onward. For this cardinal normalization, $U_T=c_T$. An ordinally transformed utility may have a different terminal function $F(T,c_T)$. This terminal condition is part of the BSDE and must be retained; setting it to zero would instead describe a different no-bequest specification.

## State prices and the exact verification logic

A market-price-of-risk vector $\eta$ satisfies
$$
\mu^R=(\sigma^R)^\top\eta.
$$
It is unique in a complete nonredundant market, but has unpriced orthogonal components in an incomplete market. A candidate state-price density obeys the **forward** stochastic differential equation
$$
\frac{d\pi_t}{\pi_t}=-r_tdt-\eta_t^\top dB_t.
$$
The associated wealth valuation is the linear BSDE
$$
dW_t=-(c_t-r_tW_t-\eta_t^\top\Sigma_t)dt+\Sigma_t^\top dB_t,
\qquad W_T=c_T.
$$
Under the stated integrability condition,
$$
W_t=\pi_t^{-1}E_t\left[\int_t^T\pi_sc_sds+\pi_Tc_T\right].
$$
Without the stronger martingale/integrability justification, positivity only yields the appropriate supermartingale inequality. Formal cancellation of stochastic-integral drifts is not enough to establish an equality of expectations.

The chapter works in a consumption-process Hilbert space with pairing
$$
(\pi\mid x)=E\left[\int_0^T\pi_tx_tdt+\pi_Tx_T\right].
$$
A utility supergradient at $c$ supports the concave objective:
$$
U_0(c+x)-U_0(c)\le(\pi\mid x).
$$
A state-price density at that feasible plan supports the budget set: $(\pi\mid x)\le0$ for every feasible perturbation. Combining the two proves optimality immediately. This is Proposition 3's general sufficient condition. Proposition 23 specializes it to the recursive-utility FBSDE system and explicitly requires feasibility, integrability of the supergradient, and $E[\sup_t\pi_tW_t]<\infty$.

The distinction between a gradient and a supergradient matters. Nonsmooth risk preferences can have a set of supporting marginal valuations. The argument still works after selecting a suitable supergradient; differentiability in every risk direction is unnecessary. The chapter does not assert that an arbitrary solution of formal first-order equations is an admissible global optimum without the verification conditions.

## Why recursive utility is needed for the stated comparison

For time-additive expected utility, preferences over deterministic consumption schedules already determine the entire utility ordering, up to ordinal equivalence, under the chapter's continuity assumptions. Its argument applies the uniqueness of additive representations to increasingly fine deterministic time partitions. Thus changing curvature to make the investor more risk averse also changes their preference for intertemporal consumption smoothing.

Recursive utility separates those roles. Write
$$
F(t,c,U,\Sigma)=f(t,c,U)-A(t,U,\Sigma),\qquad A(t,U,0)=0.
$$
The $f$ component determines deterministic consumption choices. Increasing the nonnegative risk penalty $A$, holding that deterministic component fixed, lowers utility of uncertain plans while preserving deterministic rankings. The comparison theorem makes this precise for regular aggregators. This is a partial order of risk aversion; two direction-dependent penalty functions can be incomparable.

The chapter's illustrative additive-utility example compares a persistent favorable or unfavorable consumption outcome selected early in life with a sequence of separately resolved annual outcomes having the same marginal distribution at each date. Time-additive utility values them identically. Recursive utility can distinguish their temporal risk structure. This motivates the model; it is not an empirical assertion that every investor ranks those plans in a particular way.

The BSDE representation is
$$
dU_t=-F(t,c_t,U_t,\Sigma_t)dt+\Sigma_t^\top dB_t,
\qquad U_T=F(T,c_T).
$$
The pair $(U,\Sigma)$ must be adapted: it is a backward recursion on an information tree, not integration backward along a known future Brownian path. The chapter assumes existence and uniqueness in a specified utility class. It reviews earlier BSDE results but explicitly does not solve general existence, uniqueness or numerical-computation questions. Standard globally Lipschitz conditions are too restrictive for some of its central homothetic examples.

## Supergradient dynamics and the coupled system

For a differentiable aggregator, or an appropriate supergradient selection $(F_c,F_U,F_\Sigma)$, define the stochastic exponential
$$
\frac{d\mathcal E_t}{\mathcal E_t}=F_U(t)dt+F_\Sigma(t)^\top dB_t,
\qquad\mathcal E_0=1.
$$
Proposition 21 gives the utility supergradient density
$$
\pi_t=\mathcal E_tF_c(t).
$$
Let $\lambda_t=F_c(t,c_t,U_t,\Sigma_t)$ and write
$$
\frac{d\lambda_t}{\lambda_t}=\mu_t^\lambda dt+(\sigma_t^\lambda)^\top dB_t.
$$
Matching $d(\mathcal E\lambda)/(\mathcal E\lambda)$ to state-price dynamics yields
$$
\mu^\lambda=-r-F_U-(\sigma^\lambda)^\top F_\Sigma,
\qquad \mu^R+(\sigma^R)^\top(F_\Sigma+\sigma^\lambda)=0.
$$
The inverse marginal-consumption function $I$ satisfies $F_c(t,I(t,\lambda,U,\Sigma),U,\Sigma)=\lambda$. Substitute $c=I(t,\lambda,U,\Sigma)$ into the wealth and utility equations. Wealth starts at $W_0=w_0$, while utility and $\lambda$ have terminal conditions depending on $W_T$. This is the forward–backward coupling: current consumption depends on shadow values that depend on the entire future opportunity set and terminal wealth.

The comparison lemma requires a supporting linearization and an integrable stochastic exponential. These are substantive conditions for the supergradient argument. Concavity supplies the sign of the approximation error; martingale estimates justify passing from local stochastic identities to global utility inequalities.

## Homotheticity and the portfolio formula

For a homogeneous cardinal utility, the aggregator takes the form
$$
F(t,c,U,\Sigma)=U\,G(t,c/U,\Sigma/U),\qquad U_T=c_T.
$$
In the separable proportional specification, $G(t,x,z)=g(t,x)-R(t,z)$. At an optimum, scale invariance gives
$$
U=\lambda W.
$$
This identity is the key to decoupling the wealth process. Let $I_g$ be the inverse of $g_x$, and define $g^*(t,\lambda)=\sup_{x>0}\{g(t,x)-\lambda x\}$. Then
$$
\rho=\lambda I_g(t,\lambda).
$$
The optimal consumption ratio and risky weights can first be solved from a backward equation for $\lambda$; wealth is subsequently obtained by a forward simulation of its budget equation.

For smooth source-dependent risk aversion,
$$
R(t,z)=\tfrac12z^\top Q_tz,
$$
where $Q_t$ is bounded, symmetric and positive definite. The exact risky-asset formula is
$$
\psi_t=[(\sigma_t^R)^\top Q_t\sigma_t^R]^{-1}
\left[\mu_t^R-(\sigma_t^R)^\top(Q_t-I)\sigma_t^\lambda\right].
$$
To see its origin, homogeneity implies $\sigma^U=\sigma^\lambda+\sigma^R\psi$, while $F_\Sigma=-Q\sigma^U$. Substitution into the state-price matching condition gives the displayed linear system. The first term expresses source-weighted compensation for instantaneous risk; the second reflects stochastic future opportunities or stochastic risk aversion through the shadow-value exposure.

With scalar relative risk aversion $Q=\gamma I$,
$$
\psi=\frac1\gamma[(\sigma^R)^\top\sigma^R]^{-1}\mu^R
-\frac{\gamma-1}{\gamma}[(\sigma^R)^\top\sigma^R]^{-1}(\sigma^R)^\top\sigma^\lambda.
$$
The first component is instantaneously mean–variance efficient. The second is an intertemporal hedge. A deterministic opportunity set and deterministic risk aversion make $\sigma^\lambda=0$, recovering the familiar myopic allocation. More surprisingly, $Q=I$ removes the hedge term even with stochastic opportunities. That result allows general $g$ and therefore is broader than time-additive log utility.

With nonscalar $Q$, the myopic component itself need not be mean–variance efficient under ordinary variance. Risk direction matters, so replacing $Q$ by one scalar coefficient loses part of the preference specification. Brownian rotations also rotate the risk-aversion matrix; the identity matrix is rotation invariant, but a source-dependent diagonal penalty is meaningful only relative to the chosen economic risk sources.

## Smooth versus first-order risk aversion

A smooth continuation certainty equivalent gives the Arrow–Pratt local penalty
$$
A(U,\Sigma)=\tfrac12a(U)\|\Sigma\|^2.
$$
Allowing a different curvature for each Brownian source produces $\tfrac12\Sigma^\top A(U)\Sigma$. Nonsmooth certainty equivalents add an absolute-exposure penalty. In the homothetic case,
$$
R(z)=\kappa^\top|z|+\tfrac12z^\top Qz,
\qquad\kappa\ge0.
$$
The first term is first order in exposure near zero. This can rationalize avoiding a source with a positive but insufficient risk premium, unlike smooth local risk neutrality. The chapter introduces the appropriate time-step scaling in its discrete certainty-equivalent approximation so the absolute-risk and mean terms both survive the continuous-information limit.

After rotating Brownian sources into marketed and nonmarketed components and imposing the diagonal structure used in this subsection, define the coordinatewise collar
$$
C(a,k)=\operatorname{sign}(a)(|a|-k)_+.
$$
The optimal marketed utility exposure is
$$
\sigma_M^U=Q_{MM}^{-1}C(\eta_M+\sigma_M^\lambda,\kappa_M).
$$
Thus a source contributes zero utility risk whenever its adjusted risk price lies within the corresponding interval $[-\kappa_i,\kappa_i]$. This is a statement about utility exposure. In a stochastic environment, the actual financial position can still hedge $\sigma^\lambda$ and need not vanish.

When opportunities and preferences are deterministic, $\sigma^\lambda=0$. With diagonal positive asset volatility, an asset receives zero weight whenever its instantaneous Sharpe ratio lies in $[-\kappa_i,\kappa_i]$. The resulting nonparticipation is generated by preferences, not a transaction-cost no-trade region around inherited holdings. Allowing a belief distortion shifts the interval; one example retains the usual positive-return long position while requiring a more negative expected return before shorting becomes optimal.

## Quadratic BSDEs: a restricted tractable subclass

A particularly tractable example uses
$$
G(x,z)=\alpha+\beta\log x-\tfrac\gamma2\|z\|^2,
\qquad\beta,\gamma>0.
$$
Here $\rho=\beta$ regardless of investment opportunities. Set $\ell=\log\lambda$. The backward equation becomes
$$
d\ell_t=-[p_t-\beta\ell_t+h_t^\top Z_t+\tfrac12Z_t^\top H_tZ_t]dt+Z_t^\top dB_t,
\qquad\ell_T=0,
$$
with coefficients determined by the opportunity set and risk aversion. This is a quadratic BSDE because its driver is quadratic in the martingale coefficient $Z$.

For a Gaussian mean-reverting state vector, affine market prices of risk and a quadratic short rate, conjecture $\ell_t=C_0(t)+C_1(t)^\top X_t+\tfrac12X_t^\top C_2(t)X_t$. Applying Itô's lemma and matching polynomial coefficients yields an ODE system. A square-root state specification with appropriately matched risk prices instead permits an affine conjecture. These examples explain why Riccati-type calculations arise, but neither homotheticity alone nor arbitrary Epstein–Zin preferences guarantee an affine or quadratic closed form. The chapter leaves detailed ODE construction for these examples as an exercise or refers to the underlying papers.

More generally, a Markovian specification yields a nonlinear PDE for $\lambda(t,X_t)$ with $\sigma^\lambda=b\nabla\lambda/\lambda$. Solving that PDE still requires terminal conditions, state-domain conditions and regularity adequate to justify the BSDE verification. An ansatz is useful only when substitution actually closes within the proposed functional family.

## Incomplete markets, constraints and endowed income

In marketed/nonmarketed coordinates, traded excess returns depend directly on $B_M$, while opportunity-set coefficients can depend on both $B_M$ and $B_N$. Nonmarketed risk prices are not determined by traded assets. At the optimum, utility selects shadow prices for them. A fictitious market completion can price the extra assets so the investor optimally holds none of them; the original incomplete-market value then equals the minimum over suitable complete-market optimal values. This is a dual interpretation, not a claim that nontraded risks can actually be purchased.

For block-diagonal $Q$, one such completion sets $\eta_N=(Q_{NN}-I)\sigma_N^\lambda$. The chapter also gives a more specialized equivalence for scalar $0<\gamma<2$: completing markets at zero nonmarketed risk prices and changing aversion to nonmarketed risk to $1/(2-\gamma)$ recovers the original marketed allocation and consumption ratio. Wealth and utility processes need not be identical under that transformation.

With convex trading restrictions $\psi\in K$, state pricing acquires a support-function term. If $\epsilon=\mu^R-(\sigma^R)^\top\eta$ and $\delta_K(\epsilon)=\sup_{k\in K}k^\top\epsilon$, complementary optimality requires $\psi^\top\epsilon=\delta_K(\epsilon)$. The corresponding BSDE and portfolio formula include this shadow distortion. A single linear band on weights has a tractable metric projection, but ordinary componentwise clipping is not generally the correct constrained solution under correlated risks.

Nontradeable income typically destroys the simple wealth-scaling reduction. The final section instead studies translation-invariant preferences relative to a tradeable reference consumption stream. Portfolios are expressed in dollars because wealth can vanish or become negative. Exponential expected utility is a special case. A suitably normalized value combines financial wealth with a BSDE-derived income value, yielding another quadratic backward equation. This tractability comes from a different preference restriction, not from extending the main homothetic formula unchanged.

## Implementation and limitations

To apply the framework, specify the opportunity-set dynamics, consumption/bequest convention, deterministic-consumption preferences, and risk-source penalty separately. Establish the chosen utility's existence, admissible solution class and integrability. Solve the normalized BSDE or PDE if scale invariance applies, recover consumption and weights, and verify the original forward–backward equations and budget feasibility. Check deterministic-opportunity and $Q=I$ limiting cases as diagnostics.

The chapter's strength is the connection between economic preference restrictions, supergradient state pricing and tractable backward equations. It does not supply a universal numerical solver, a statistical method for estimating source-dependent aversion, or net-of-cost performance evidence. The references to transaction costs, jumps, labor supply and retirement identify extensions and literature as of the source's date; they are not claims that the displayed Brownian unconstrained model already includes those features.
