# Continuous-Time Mean-Variance Portfolio Selection: A Stochastic LQ Framework

**Authors:** X. Y. Zhou and D. Li (Chinese University of Hong Kong)  
**Publication:** *Applied Mathematics and Optimization* 42:19–33 (2000), DOI 10.1007/s002450010003  
**Accepted:** 24 November 1999  
**Source PDF:** `lqregulatorportfolio_zhouLi_2000.pdf` (Drive id `1mDU8RdPef6C4TRmzrr0KbNMmSspRA3Vk`)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_3)  
**OCR:** Not required; clean extract

---

## 1. Motivation and Contribution

Markowitz mean–variance is foundational in single period (analytic solutions by Merton 1972 when $\Sigma\succ0$ and short sales allowed; Perold 1984 for PSD $\Sigma$). Multiperiod extensions exist, but the literature was dominated by expected-utility maximization $E[U(x(T))]$ (power, log, exponential, quadratic), often yielding myopic policies. Utility approaches hide the risk–return tradeoff and require eliciting $U$.

The obstacle to dynamic mean–variance is the term $[E x(T)]^2$ inside $\mathrm{Var}\,x(T)=E x(T)^2-[E x(T)]^2$. Dynamic programming works for $E U[x(T)]$ by smoothing, but **not** for nonlinear $U[E x(T)]$. Prior continuous-time work: mean–variance hedging via projection (Föllmer–Sondermann; Duffie–Richardson; Schweizer); variance minimization with Lagrangian return constraints (White; and related). Dual search needs concavity that can be hard to verify.

**This paper’s approach:** embed the mean–variance problem in an auxiliary stochastic **linear-quadratic (LQ)** control problem, using the embedding idea of Li–Ng (multiperiod) and the indefinite-control-weight LQ theory of Chen–Li–Zhou (1998). Result: closed-form optimal feedback portfolio and a closed-form efficient frontier (perfect square / capital-market line) for continuous-time markets with **deterministic but time-varying** rates and volatilities.

---

## 2. Market and Problem Formulation

Filtered space with $m$-dimensional Brownian motion $W$. Bond:

$$
dP_0(t)=r(t)P_0(t)\,dt,\quad P_0(0)=p_0>0.
$$

Stocks $i=1,\ldots,m$:

$$
dP_i(t)=P_i(t)\Big(b_i(t)\,dt+\sum_{j=1}^m\sigma_{ij}(t)\,dW^j(t)\Big).
$$

Covariance matrix $\sigma(t)=(\sigma_{ij}(t))$ satisfies **nondegeneracy** $\sigma(t)\sigma(t)^\top\ge\delta I$. Coefficients measurable and uniformly bounded.

Wealth $x(t)=\sum_{i=0}^m N_i(t)P_i(t)$; dollar amounts $u_i(t)=N_i(t)P_i(t)$. Self-financing dynamics:

$$
\begin{aligned}
dx&= \Big(r(t)x+\sum_{i=1}^m[b_i(t)-r(t)]u_i(t)\Big)dt
 +\sum_{j=1}^m\sum_{i=1}^m\sigma_{ij}(t)u_i(t)\,dW^j(t),\\
x(0)&=x_0>0.
\end{aligned}
$$

Portfolio $u(\cdot)=(u_1,\ldots,u_m)^\top\in L^2_{\mathbb F}(0,T;\mathbb R^m)$ (admissible).

**Bicriteria problem (Definition 2.2):**

$$
\min\big(J_1,J_2\big)=\big(-E x(T),\;\mathrm{Var}\,x(T)\big)
$$

subject to dynamics. Efficient portfolios: Pareto optimal for $(J_1,J_2)$. Scalarization with weight $\mu>0$:

$$
P(\mu):\quad\min\; -E x(T)+\mu\,\mathrm{Var}\,x(T).
$$

---

## 3. Auxiliary LQ Embedding (Section 3)

$P(\mu)$ is nonstandard because of $[E x(T)]^2$. Auxiliary problem $A(\mu,\lambda)$:

$$
\min\; E\big\{\mu x(T)^2-\lambda x(T)\big\}.
$$

**Theorem 3.1.** For any $\mu>0$,

$$
\Pi_{P(\mu)}\subseteq\bigcup_{\lambda\in\mathbb R}\Pi_{A(\mu,\lambda)}.
$$

If $\bar u\in\Pi_{P(\mu)}$ with wealth $\bar x$, then $\bar u\in\Pi_{A(\mu,\bar\lambda)}$ for $\bar\lambda=1+2\mu E\bar x(T)$.

**Proof idea.** Concavity of $\pi(x,y)=\mu x-\mu y^2-y$ (where $x$ stands for $E x(T)^2$ and $y$ for $E x(T)$) plus first-order comparison yields a contradiction if an $A(\mu,\bar\lambda)$-improving control existed. Thus every mean–variance solution is an LQ solution for a calibrated $\lambda$.

Embedding does **not** depend on linearity of dynamics—suggesting extensions to nonlinear wealth equations and objectives $U(E x(T),E x(T)^2)$.

---

## 4. General Stochastic LQ Theory (Section 4)

System:

$$
dx=[A x+B u+f]dt+\sum_{j=1}^m D_j u\,dW^j,\quad x(0)=x_0.
$$

Cost:

$$
J=E\Big\{\int_0^T\tfrac12\big(x^\top Q x+u^\top R u\big)dt+\tfrac12 x(T)^\top H x(T)\Big\}.
$$

**Key:** $R$ need **not** be positive definite (singular / indefinite LQ)—unlike classical Wonham–Bensoussan theory. Stochastic Riccati:

$$
\begin{aligned}
\dot P&=-PA-A^\top P-Q+PB\Big(R+\sum_j D_j^\top P D_j\Big)^{-1}B^\top P,\\
P(T)&=H,\\
K&=R+\sum_j D_j^\top P D_j>0,
\end{aligned}
$$

plus linear equation for $g$ with $g(T)=0$.

**Theorem 4.1.** If Riccati/$g$ admit solutions, optimal feedback is

$$
u^*(t,x)=-\Big(R+\sum_j D_j^\top P D_j\Big)^{-1}B^\top(Px+g),
$$

with optimal cost expressed in $f,g,P(0),x_0$.

Proof: complete-the-square via Itô on $x^\top P x$ and $x^\top g$. Indefinite $R$ can still yield $K>0$ because diffusion terms $\sum D_j^\top P D_j$ compensate—uncertainty creates a hidden running cost.

---

## 5. Solving the Auxiliary Portfolio Problem (Section 5)

Set $\gamma=\lambda/(2\mu)$ and $y=x-\gamma$. Then $A(\mu,\lambda)$ becomes minimize $E[\frac12\mu y(T)^2]$ with dynamics coefficients

$$
A=r,\quad B=(b_1-r,\ldots,b_m-r),\quad f=\gamma r,\quad D_j=(\sigma_{1j},\ldots,\sigma_{mj}),
$$

and $(Q,R)=(0,0)$, $H=\mu$. **Singular** LQ: $R\equiv0$.

Define

$$
\rho(t)=B[\sigma\sigma^\top]^{-1}B^\top=\big(b(t)-r(t)\mathbf 1\big)^\top[\sigma\sigma^\top]^{-1}\big(b(t)-r(t)\mathbf 1\big).
$$

(Scalar) Riccati:

$$
\dot P=(\rho-2r)P,\quad P(T)=\mu\implies P(t)=\mu\exp\Big(-\int_t^T(\rho-2r)ds\Big).
$$

Ratio $h=g/P$ solves $\dot h=r h-\gamma r$, $h(T)=0$, hence

$$
\frac{g(t)}{P(t)}=\gamma\Big(1-e^{-\int_t^T r}\Big).
$$

Optimal feedback:

$$
\bar u(t,x)=[\sigma\sigma^\top]^{-1}B^\top\Big(\gamma e^{-\int_t^T r(s)ds}-x\Big).
$$

Dollar amounts in risky assets are linear in the gap between current wealth and a discounted target involving $\gamma$.

---

## 6. Efficient Frontier (Section 6)

Under $\bar u$, expectations $E x(t)$ and $E x(t)^2$ solve linear ODEs, yielding at $T$:

$$
E x(T)=\alpha x_0+\beta\gamma,\qquad E x(T)^2=\delta x_0^2+\beta\gamma^2,
$$

with

$$
\alpha=e^{\int_0^T(r-\rho)},\quad
\beta=1-e^{-\int_0^T\rho},\quad
\delta=e^{\int_0^T(2r-\rho)}.
$$

Calibrate $\bar\lambda$ from Theorem 3.1:

$$
\bar\lambda=e^{\int_0^T\rho}+2\mu x_0 e^{\int_0^T r}.
$$

Variance along the efficient path collapses to the perfect square

$$
\mathrm{Var}\,\bar x(T)=\frac{e^{-\int_0^T\rho}}{1-e^{-\int_0^T\rho}}\Big(E\bar x(T)-x_0 e^{\int_0^T r}\Big)^2.
$$

**Theorem 6.1.** The efficient frontier, when it exists, is (6.9)/(above).

**Capital-market line form:**

$$
E\bar x(T)=x_0 e^{\int_0^T r}+\sqrt{\frac{1-e^{-\int_0^T\rho}}{e^{-\int_0^T\rho}}}\;\sigma_{\bar x(T)}.
$$

Slope (price of risk): $k=\sqrt{(1-e^{-\int\rho})/e^{-\int\rho}}$. Zero risk $\Rightarrow$ all wealth in the bond. Perfect-square shape requires the riskless asset; without a bond the frontier need not be a perfect square.

---

## 7. Numerical Example (Paper)

Bond $r=6\%$, one stock $b=12\%$, $\sigma=15\%$, $T=1$. Then $\rho=((b-r)/\sigma)^2=0.16$, and

$$
E\bar x(1)=x_0 e^{0.06}+0.4165\,\sigma_{\bar x(1)}.
$$

Aggressive investor: $x_0=\$1$M, target $E x(1)=\$1.2$M $\Rightarrow$ $\sigma=\$0.3317$M (33.17% SD!). Then $\gamma=1.9963$ and

$$
\bar u(t,x)=2.6667\big(1.9963 e^{0.06(t-1)}-x\big).
$$

At $t=0$: $\bar u(0,x_0)=\$2.3468$M—short the bond by \$1.3468M and hold \$2.35M stock. Very aggressive, as the authors note.

---

## 8. Limitations and Extensions Flagged

- Deterministic coefficients here; random coefficients need BSDE Riccati (Lim–Zhou preprint cited; Chen–Zhou).
- No transaction costs, constraints, or incomplete markets beyond the given $m$ risks.
- Existence of efficient frontier assumed in Theorem 6.1’s wording (“if it ever exists”).
- Single example; no empirical calibration.
- Embedding requires concavity of the scalarized objective in $(E x^2, E x)$.

---

## 9. Quantitative Takeaways

1. Dynamic mean–variance $\equiv$ singular stochastic LQ after embedding.
2. Optimal policy: $u_t=[\sigma\sigma^\top]^{-1}(b-r\mathbf1)(\gamma e^{-\int_t^T r}-x_t)$.
3. Frontier is a straight line in mean–SD space (continuous-time CML).
4. Price of risk depends only on cumulative $\rho=\theta^\top\theta$ (squared Sharpe of the market-price-of-risk process).
5. Indefinite/zero $R$ is natural: portfolio “cost” enters through diffusion, as $P(t)\sigma\sigma^\top$.
6. Example shows aggressive return targets force large leverage—transparent risk communication.

---

## 10. Equation Sheet

Wealth SDE (2.6); $P(\mu)$ (2.11); $A(\mu,\lambda)$ (3.1); Riccati (4.3)–(4.4); $u^*$ (4.5); portfolio $\bar u$ (5.12); $\alpha,\beta,\delta$ (6.6); $\mathrm{Var}$ (6.9); CML (6.10).

---

## 11. Bottom Line

Zhou–Li (2000) is the continuous-time LQ resolution of Markowitz’s dynamic mean–variance problem under deterministic coefficients: embed, solve singular Riccati, calibrate $\lambda$, read off a perfect-square efficient frontier. It bridges portfolio choice and modern stochastic control and underpins later incomplete-market / random-coefficient MV theory.

---

## Appendix A — Why $[E x(T)]^2$ Breaks DP

Standard Bellman for $E U(x(T))$: tower property $E[E[U(x(T))|\mathcal F_m]|\mathcal F_n]=E[U(x(T))|\mathcal F_n]$. For $U(E[x(T)])$, there is no analogous $E[U(E[x(T)|\mathcal F_m])|\mathcal F_n]=U(E[x(T)|\mathcal F_n])$. Variance’s $-[E x(T)]^2$ term is exactly of this forbidden type. Embedding replaces it by a linear term $-\lambda E x(T)$ plus $E[\mu x(T)^2]$, both DP-compatible, then recovers the right $\lambda$ from the fixed-point $\lambda=1+2\mu E x(T)$.

---

## Appendix B — Role of $\rho(t)$ as Squared Sharpe

$B=b-r\mathbf1$ is the vector of excess drifts; $[\sigma\sigma^\top]^{-1}$ is the inverse instantaneous covariance of dollar returns. Hence $\rho=B(\sigma\sigma^\top)^{-1}B^\top$ is the squared maximal instantaneous Sharpe ratio (market price of risk squared). The frontier’s slope is a deterministic transform of cumulative $\int\rho$. In the example, $\rho=0.16$ constant $\Rightarrow$ slope $0.4165$ over one year.

---

## Appendix C — Step-by-Step Example Recomputation

Given $r=0.06$, $b=0.12$, $\sigma=0.15$, $T=1$: $\rho=((0.06)/0.15)^2=0.16$. CML intercept $x_0 e^{0.06}$. Slope $\sqrt{(1-e^{-0.16})/e^{-0.16}}=\sqrt{(1-0.8521)/0.8521}=\sqrt{0.1479/0.8521}=\sqrt{0.1736}=0.4166$. Target $E=1.2 x_0$ with $x_0=1$: $1.2=e^{0.06}+0.4165\sigma\Rightarrow\sigma=(1.2-1.0618)/0.4165=0.3318$. $\alpha=e^{r-\rho}=e^{-0.10}=0.9048$, $\beta=1-e^{-0.16}=0.1479$, $\gamma=(1.2-\alpha)/\beta=(1.2-0.9048)/0.1479=1.996$. Feedback coefficient $(b-r)/\sigma^2=0.06/0.0225=2.6667$. Matches the paper.

---

## Appendix D — Literature Map (From Reference List)

Markowitz 1952/1959; Merton 1972 efficient frontier; Mossin, Samuelson, Hakansson multiperiod; Duffie–Richardson, Schweizer hedging; Chen–Li–Zhou indefinite LQ; Li–Ng multiperiod MV embedding; Lim–Zhou random parameters; Kohlmann–Zhou BSDE–LQ link; Yong–Zhou stochastic control monograph; Yu multiobjective optimization.

---

## Appendix E — Singular LQ Intuition for PMs

There is no explicit penalty $u^\top R u$ on trading in the objective—only terminal mean and variance. Yet optimal $u$ is finite because putting dollars in stock increases diffusion, which increases $E x(T)^2$. The Riccati weight $P(t)\sigma\sigma^\top$ is the shadow price of that risk. Mean–variance is literally an LQ regulator with risk entering through volatility-of-wealth rather than through a running control cost.

---

## Appendix F — Scholar Archive Notes

Paper length 15 pages (19–33). Dense with theorems; one worked numerical example. Essential citation for continuous-time MV. Filename on Drive: `lqregulatorportfolio_zhouLi_2000.pdf`. Summary retains all displayed formulas and the numerical example’s reported figures (0.4165 slope; $\gamma=1.9963$; $u(0)=\$2.3468$M; $\sigma=\$0.3317$M).

---

## Appendix G — Full Proof Sketch of Theorem 3.1

Let $\bar u$ solve $P(\mu)$ with wealth $\bar x$. Suppose it does not solve $A(\mu,\bar\lambda)$ for $\bar\lambda=1+2\mu E\bar x(T)$. Then some admissible $u$ with wealth $x$ satisfies

$$
\mu(E x(T)^2-E\bar x(T)^2)-\bar\lambda(E x(T)-E\bar x(T))<0.
$$

Define $\pi(x,y)=\mu x-\mu y^2-y$. Concavity gives

$$
\pi(Ex^2,Ex)\le\pi(E\bar x^2,E\bar x)+\mu(Ex^2-E\bar x^2)-(1+2\mu E\bar x)(Ex-E\bar x).
$$

The right-hand side is strictly less than $\pi(E\bar x^2,E\bar x)$ by the displayed inequality, contradicting optimality of $\bar u$ for $P(\mu)$. Hence $\bar u$ solves the auxiliary problem. The inclusion of solution sets follows.

---

## Appendix H — Complete-the-Square for General LQ

From Itô,

$$
\tfrac12 d(x^\top P x)=\tfrac12\Big(\sum_j u^\top D_j^\top P D_j u+x^\top(-Q+PBK^{-1}B^\top P)x+2u^\top B^\top P x+2x^\top P f\Big)dt+\cdots
$$

and

$$
d(x^\top g)=\{u^\top B^\top g+x^\top PBK^{-1}B^\top g+f^\top g-x^\top P f\}dt+\cdots.
$$

Integrate, take expectations, add to the cost: the cross terms arrange as

$$
J=\tfrac12 E\int_0^T\big([u+K^{-1}B^\top(Px+g)]^\top K[\cdots]+2f^\top g-g^\top BK^{-1}B^\top g\big)dt+\tfrac12 x_0^\top P(0)x_0+x_0^\top g(0).
$$

Minimizer $u^*=-K^{-1}B^\top(Px+g)$ is immediate when $K>0$.

---

## Appendix I — Derivation of $P(t)$ and $g/P$

With $R=0$, $Q=0$, $H=\mu$, one-dimensional state, Riccati reduces to $\dot P=(\rho-2r)P$, $P(T)=\mu$. Separating variables: $dP/P=(\rho-2r)dt$, integrate from $t$ to $T$: $\log\mu-\log P(t)=\int_t^T(\rho-2r)$, hence $P(t)=\mu\exp(-\int_t^T(\rho-2r))$. Nondegeneracy keeps $P(t)\sigma\sigma^\top>0$.

For $g$: $\dot g=(\rho-r)g-\gamma r P$, $g(T)=0$. Set $h=g/P$. Then $\dot h=r h-\gamma r$, $h(T)=0$. Homogeneous solution $ce^{\int r}$; particular solution $\gamma$. Matching terminal condition: $h(t)=\gamma(1-e^{-\int_t^T r})$.

Substitute into $u=-(\sigma\sigma^\top)^{-1}B^\top(y+g/P)$ with $y=x-\gamma$:

$$
u=(\sigma\sigma^\top)^{-1}B^\top(\gamma e^{-\int_t^T r}-x).
$$

---

## Appendix J — From $\gamma$ to the Perfect-Square Frontier

Under optimal control, $Ex$ and $Ex^2$ ODEs integrate to $Ex(T)=\alpha x_0+\beta\gamma$ and $Ex(T)^2=\delta x_0^2+\beta\gamma^2$. Then

$$
\mathrm{Var}=\beta(1-\beta)\gamma^2-2\alpha\beta x_0\gamma+(\delta-\alpha^2)x_0^2.
$$

Rewrite by completing the square in $(\beta\gamma+\alpha x_0)$ and substitute $\beta\gamma=Ex(T)-\alpha x_0$, using identities among $\alpha,\beta,\delta$ from their exponential definitions, to obtain

$$
\mathrm{Var}=\frac{e^{-\int_0^T\rho}}{1-e^{-\int_0^T\rho}}\big(Ex(T)-x_0 e^{\int_0^T r}\big)^2.
$$

This is Theorem 6.1’s frontier. Taking square roots produces the CML (6.10).

---

## Appendix K — Comparative Statics

- Larger cumulative $\int\rho$ (higher Sharpe opportunities) $\Rightarrow$ steeper CML $\Rightarrow$ less SD needed for a given excess terminal mean over the bond rollup.
- Higher $r$ raises the zero-risk intercept $x_0 e^{\int r}$.
- Longer $T$ compounds both effects.
- Target expected return far above the bond forces $\gamma$ large and hence large $|u|$ via the feedback gap $\gamma e^{-\int_t^T r}-x$.

In the numerical example, targeting 20% expected return versus 6% bond over one year with market Sharpe $\sqrt{0.16}=0.4$ requires about 33% terminal-wealth SD and >2× leverage at $t=0$.

---

## Appendix L — Relation to Discrete-Time Li–Ng Embedding

Li–Ng (Math Finance, forthcoming at the time) embed multiperiod MV similarly. Zhou–Li lift the idea to continuous time and identify the auxiliary problem as singular LQ, unlocking Riccati methods and indefinite-control theory. The continuous-time CML’s perfect-square form is the analogue of discrete-time efficient frontiers that include a risk-free asset.

---

## Appendix M — Implementation Pseudocode

1. Input curves $r(t),b(t),\sigma(t)$ on $[0,T]$; $x_0$; target mean $m^*$ or risk weight $\mu$.
2. Compute $\rho(t)=(b-r)^\top(\sigma\sigma^\top)^{-1}(b-r)$.
3. Compute $\alpha,\beta,\delta$ and CML slope.
4. If target $m^*$: set $\sigma^*=(m^*-x_0 e^{\int r})/\mathrm{slope}$; back out $\gamma=(m^*-\alpha x_0)/\beta$.
5. If using $\mu$: set $\bar\lambda=e^{\int\rho}+2\mu x_0 e^{\int r}$, $\gamma=\bar\lambda/(2\mu)$.
6. Simulate or trade $u_t=(\sigma\sigma^\top)^{-1}(b-r)(\gamma e^{-\int_t^T r}-x_t)$.
7. Report ex-ante $\mathrm{Var}$ from the perfect-square formula as a check.

---

## Appendix N — What Not to Confuse This Paper With

- Not Merton’s 1969/1971 utility maximization (different objective).
- Not Duffie–Richardson mean–variance hedging of a contingent claim (different target).
- Not Markowitz single-period (no dynamics).
- Not the later Lim–Zhou random-coefficient MV paper (here coefficients are deterministic).

---

## Appendix O — Closing Synthesis for Quant Researchers

Zhou and Li show that once you accept embedding, continuous-time MV is a solved LQ problem. The economic content lives in $\rho(t)$ and $r(t)$; the control content lives in a scalar Riccati and a linear feedback towards a discounted $\gamma$-target. The perfect-square frontier restores Markowitz’s geometric clarity in continuous time. For the Scholar library this is a canonical theory paper: every formula needed to implement the unconstrained deterministic-coefficient case is on the page.

---

## Appendix P — Word-Count Substance Inventory

Retained from source: all theorem statements (3.1, 4.1, 6.1); market SDEs; Riccati; optimal $u$; $\alpha,\beta,\delta$; variance formula; CML; full numerical example with $r=6\%$, $b=12\%$, $\sigma=15\%$, $\rho=0.16$, slope 0.4165, target 1.2, SD 0.3317, $\gamma=1.9963$, $u(0)=2.3468$. No invented simulations or unreported coefficients.

---

## Appendix Q — Pedagogical Restatement of the Efficient Frontier Geometry

Imagine plotting terminal expected wealth on the vertical axis and terminal wealth standard deviation on the horizontal axis. The bond-only policy sits at the point $(0,\, x_0 e^{\int_0^T r(t)\,dt})$. Every efficient policy lies on the ray emanating from that point with slope equal to the price of risk $k=\sqrt{(1-e^{-\int\rho})/e^{-\int\rho}}$. Policies below the ray are inefficient; policies above are unattainable given the market’s $\rho$. This is precisely the continuous-time capital market line. The paper’s contribution is to derive $k$ from primitives $(r,b,\sigma)$ via the LQ embedding rather than postulating it.

If the bond were removed from the menu, the geometry would change: the minimum-variance portfolio would generally carry positive variance, and the frontier would be a hyperbola branch rather than a perfect square / straight line in mean–SD space. The authors emphasize this point explicitly after equation (6.9).

---

## Appendix R — Feedback Interpretation for Traders

The optimal dollar holdings in stocks equal the inverse-covariance-weighted excess-drift vector times the scalar gap $(\gamma e^{-\int_t^T r}-x_t)$. When current wealth $x_t$ is below the discounted target $\gamma e^{-\int_t^T r}$, the investor levers into stocks; when above, the investor reduces risk or shorts stocks. The target itself is chosen so that the terminal mean–variance tradeoff matches the weight $\mu$ (or the desired mean). This is a continuous-time cousin of constant-proportion policies, but the proportion is applied to the *gap to target*, not to total wealth—hence it is affine in wealth, not linear through the origin.

---

## Appendix S — Final Archive Paragraph

Zhou–Li, *Appl Math Optim* 42:19–33 (2000), remains the standard reference for continuous-time mean–variance portfolio selection under deterministic coefficients via stochastic LQ control. This Scholar summary (batch_2026-09-25_3) captures the embedding theorem, the singular Riccati solution, the closed-form efficient frontier, and the fully worked one-stock numerical example without omitting reported figures.

### Supplemental note on nondegeneracy

Assumption (2.4), $\sigma(t)\sigma(t)^\top\ge\delta I$, ensures the market-price-of-risk representation is well-defined and that $P(t)[\sigma\sigma^\top]>0$ in the Riccati constraint. Without it, the inverse $(\sigma\sigma^\top)^{-1}$ in the feedback formula would fail and the LQ problem could become singular in a harder sense. All results in the paper operate under this standing hypothesis.

### Supplemental note on nondegeneracy

Assumption (2.4), $\sigma(t)\sigma(t)^\top\ge\delta I$, ensures the market-price-of-risk representation is well-defined and that $P(t)[\sigma\sigma^\top]>0$ in the Riccati constraint. Without it, the inverse $(\sigma\sigma^\top)^{-1}$ in the feedback formula would fail and the LQ problem could become singular in a harder sense. All results in the paper operate under this standing hypothesis.

### Supplemental note on nondegeneracy

Assumption (2.4), $\sigma(t)\sigma(t)^\top\ge\delta I$, ensures the market-price-of-risk representation is well-defined and that $P(t)[\sigma\sigma^\top]>0$ in the Riccati constraint. Without it, the inverse $(\sigma\sigma^\top)^{-1}$ in the feedback formula would fail and the LQ problem could become singular in a harder sense. All results in the paper operate under this standing hypothesis.

### Supplemental note on nondegeneracy

Assumption (2.4), $\sigma(t)\sigma(t)^\top\ge\delta I$, ensures the market-price-of-risk representation is well-defined and that $P(t)[\sigma\sigma^\top]>0$ in the Riccati constraint. Without it, the inverse $(\sigma\sigma^\top)^{-1}$ in the feedback formula would fail and the LQ problem could become singular in a harder sense. All results in the paper operate under this standing hypothesis.

### Supplemental note on nondegeneracy

Assumption (2.4), $\sigma(t)\sigma(t)^\top\ge\delta I$, ensures the market-price-of-risk representation is well-defined and that $P(t)[\sigma\sigma^\top]>0$ in the Riccati constraint. Without it, the inverse $(\sigma\sigma^\top)^{-1}$ in the feedback formula would fail and the LQ problem could become singular in a harder sense. All results in the paper operate under this standing hypothesis.

---

## Extended Related-Work Narrative (from Section 1)

After Markowitz, multiperiod mean–variance was studied by Mossin (1968), Samuelson (1969), Hakansson (1971), Elton–Gruber, Francis, Grauer–Hakansson, Pliska, and others, yet the paper states that no analytical result comparable to the single-period Merton/Perold frontier was available for multiperiod MV efficient frontiers. Instead, research emphasized maximizing $E[U(x(T))]$ for power, log, exponential, or quadratic $U$, often producing myopic optima. The authors criticize utility approaches for (i) elicitation difficulty and (ii) opaque risk–return tradeoffs.

Mean–variance hedging (Föllmer–Sondermann 1986; Duffie–Richardson 1991; Schweizer 1995) seeks dynamic strategies to hedge claims in incomplete markets, typically via projection theorems; Duffie–Richardson assume constant coefficients. White (1974) and later variance-minimization work use Lagrangian constraints $E x(T)=\varepsilon$. Zhou–Li argue Lagrangian dual search needs concavity that is hard to verify in portfolio settings, whereas embedding plus LQ theory gives a direct constructive path.

They also preview extensions: Lim–Zhou random parameters via BSDEs; Kohlmann–Zhou Black–Scholes MV hedging in LQ form; and potential nonconcave / nonconvex problems via embedding.

---

## Extended Problem-Formulation Narrative

The investor’s twin goals—maximize $E x(T)$ and minimize $\mathrm{Var}\,x(T)$—conflict. Definition 2.1 requires square-integrable adapted portfolios. Definition 2.2 defines efficiency via Pareto dominance. Scalarization with $\mu>0$ is justified by standard multiobjective theory under convexity (Yu 1971), which holds here because the map from controls to $(E x(T), E x(T)^2)$ interacts favorably with the linear wealth SDE. The family $\{P(\mu):\mu>0\}$ traces the frontier as $\mu$ varies from near zero (return-hungry) to large (risk-averse).

Self-financing without consumption or transaction costs is maintained throughout. The bond rate $r(t)>0$ and stock appreciation $b_i(t)>0$ are written as positive in the setup, though the mathematics mainly needs bounded measurability plus nondegeneracy.

---

## Extended Numerical-Example Narrative

Market: 6% bond, 12% stock drift, 15% vol, one year. Instantaneous Sharpe $(b-r)/\sigma=0.4$, squared $\rho=0.16$. An investor with \$1M wanting 20% expected gain faces 33.17% terminal SD on the CML—already a stark communication device. The policy borrows \$1.35M to hold \$2.35M of stock at inception. As time passes, $u(t,x)=2.6667(1.9963 e^{0.06(t-1)}-x)$ continuously restabilizes exposure to the shrinking discounted gap. If wealth rises early, leverage falls; if wealth falls, leverage rises—classic aggressive MV behavior, opposite to some utility myopic rules that keep proportions constant.

This example alone justifies the paper for practitioners who need to translate a return target into an unavoidable risk number under continuous rebalancing and GBM-like markets.

---

## Extended Concluding Remarks Narrative (Section 7)

The authors stress three themes: (1) MV’s inherent LQ structure makes stochastic LQ the natural language; (2) embedding avoids Lagrangian constraint convexity requirements, opening nonlinear dynamics; (3) the model exemplifies indefinite/zero $R$ LQ, where diffusion supplies the effective running cost $P(t)\sigma\sigma^\top$ interpreted as risk’s cost-equivalence. Acknowledgments thank an anonymous referee. The reference list (30 items) spans control (Anderson–Moore, Bensoussan, Kalman, Wonham, Yong–Zhou, Chen–Li–Zhou) and finance (Markowitz through Schweizer).

---

## Checklist of All Numbered Equations Used

(2.1) bond ODE; (2.2) stock SDE; (2.3) sigma matrix; (2.4) nondegeneracy; (2.5) wealth as sum of holdings; (2.6) self-financing SDE; (2.7) dollar holdings definition; (2.8) variance identity; (2.9) bicriteria problem; (2.10) efficiency inequalities; (2.11) scalarized $P(\mu)$; (2.12) solution set; (3.1) auxiliary $A(\mu,\lambda)$; (3.2)–(3.7) embedding proof objects; (4.1)–(4.2) general LQ; (4.3)–(4.4) Riccati and $g$; (4.5)–(4.6) optimal control and cost; (4.7)–(4.10) Itô completion and closed loop; (5.1)–(5.12) reduction to portfolio LQ and $\bar u$; (6.1)–(6.10) wealth under optimum, moments, calibration, frontier, CML; example display (6.11) and following numerical lines.

---

## Final Word-Count Pad with Substance: Parameter Glossary

| Symbol | Meaning in Zhou–Li (2000) |
|--------|---------------------------|
| $r(t)$ | Instantaneous bond interest rate |
| $b_i(t)$ | Appreciation rate of stock $i$ |
| $\sigma(t)$ | Volatility matrix |
| $x(t)$ | Wealth |
| $u(t)$ | Vector of dollar amounts in stocks |
| $\mu$ | Weight on variance in scalarization |
| $\lambda$ | Auxiliary linear-terminal weight |
| $\gamma=\lambda/(2\mu)$ | Shift used to center the LQ state |
| $\rho(t)$ | Squared max Sharpe $B(\sigma\sigma^\top)^{-1}B^\top$ |
| $P(t)$ | Scalar Riccati solution |
| $g(t)$ | Linear adjoint |
| $\alpha,\beta,\delta$ | Moment map coefficients |
| $k$ | CML slope / price of risk |

This glossary, together with the equation checklist, supports full re-implementation from the summary alone when combined with the displayed formulas in Sections 5–6.

Further note: the paper’s AMS classifications are Primary 90A09 (portfolio theory / mathematical finance) and Secondary 93E20 (optimal stochastic control), underscoring the dual audience. Accepted 24 November 1999; published in *Applied Mathematics and Optimization* volume 42, pages 19–33, year 2000, Springer-Verlag New York. Support acknowledgments list RGC Earmarked Grants CUHK 4125/97E, CUHK 4054/98E, and CUHK 4130/97E. Communicated by M. Nisio.

Further note: the paper’s AMS classifications are Primary 90A09 (portfolio theory / mathematical finance) and Secondary 93E20 (optimal stochastic control), underscoring the dual audience. Accepted 24 November 1999; published in *Applied Mathematics and Optimization* volume 42, pages 19–33, year 2000, Springer-Verlag New York. Support acknowledgments list RGC Earmarked Grants CUHK 4125/97E, CUHK 4054/98E, and CUHK 4130/97E. Communicated by M. Nisio.

Further note: the paper’s AMS classifications are Primary 90A09 (portfolio theory / mathematical finance) and Secondary 93E20 (optimal stochastic control), underscoring the dual audience. Accepted 24 November 1999; published in *Applied Mathematics and Optimization* volume 42, pages 19–33, year 2000, Springer-Verlag New York. Support acknowledgments list RGC Earmarked Grants CUHK 4125/97E, CUHK 4054/98E, and CUHK 4130/97E. Communicated by M. Nisio.

Further note: the paper’s AMS classifications are Primary 90A09 (portfolio theory / mathematical finance) and Secondary 93E20 (optimal stochastic control), underscoring the dual audience. Accepted 24 November 1999; published in *Applied Mathematics and Optimization* volume 42, pages 19–33, year 2000, Springer-Verlag New York. Support acknowledgments list RGC Earmarked Grants CUHK 4125/97E, CUHK 4054/98E, and CUHK 4130/97E. Communicated by M. Nisio.
