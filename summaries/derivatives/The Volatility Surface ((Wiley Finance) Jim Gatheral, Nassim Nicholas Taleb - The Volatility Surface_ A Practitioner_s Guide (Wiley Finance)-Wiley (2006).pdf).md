# The Volatility Surface: A Practitioner's Guide — Detailed Quantitative Research Notes

## Bibliographic Header

| Field | Detail |
|------|--------|
| **Title** | The Volatility Surface: A Practitioner's Guide |
| **Author** | Jim Gatheral |
| **Foreword** | Nassim Nicholas Taleb |
| **Year** | 2006 |
| **Publisher** | John Wiley & Sons, Inc. (Wiley Finance Series) |
| **ISBN-13** | 978-0-471-79251-2 |
| **ISBN-10** | 0-471-79251-9 |
| **LCCN / Call** | HG6024.A3G38 2006; 332.63'2220151922—dc22 2006009977 |
| **Origin** | Courant Institute (NYU) lecture notes, ~2000–2006, six iterations |
| **Audience** | Graduate financial mathematics / equity derivatives desk quants |

These notes are written for a quantitative investor or desk quant who needs the book's substance—not a marketing synopsis. All major models, derivations, fitted coefficients, empirical universes, and exotic results are retained with LaTeX formulas.

---

## Problem / Motivation

Black–Scholes assumes a constant volatility input. Market European options imply a **volatility surface** $\sigma_{\mathrm{BS}}(K,T)$ that depends on strike and expiry. Gatheral's central programme is to:

1. Relate **implied**, **local**, and **instantaneous** variance rigorously.
2. Calibrate and diagnose popular dynamics (Heston, SVJ, SVJJ, SABR, Merton jump-to-ruin, CreditGrades).
3. Show that matching vanillas is **not** enough: dynamics determine exotic prices (barriers, cliquets, Napoleons, variance/vol swaps).
4. Emphasize **pricing consistency / no-arbitrage** over hedging perfection (Taleb foreword): models are tools for relative pricing, not top-down statistical maps of "true" dynamics.

Empirical anchors throughout: **SPX**, especially the surface as of the close on **15 September 2005** (day before triple witching), spot $S=1227.73$. Historical SPX daily log returns from **31 Dec 1984 – 31 Dec 2004** illustrate fat tails and the **−22.9%** crash on **19 Oct 1987**. Seventy-seven years of SPX daily log returns vs Normal (Q–Q) motivate jumps / stochastic vol.

---

## Chapter 1 — Stochastic Volatility and Local Volatility

### 1.1 Two-factor SDEs

Under the physical (then risk-neutral) measure, Gatheral writes the generic SV system

$$
\frac{dS_t}{S_t}=\mu_t\,dt+\sqrt{v_t}\,dZ_1,\qquad
dv_t=\alpha(S,v,t)\,dt+\beta(S,v,t)\sqrt{v_t}\,dZ_2,
$$

with $\langle dZ_1\,dZ_2\rangle=\rho\,dt$. Instantaneous variance $v_t$ is mean-reverting in leading models; $\eta$ (vol-of-vol) and correlation $\rho$ (typically large and **negative** for equities) generate skew.

### 1.2 Valuation PDE and market price of volatility risk

A portfolio $\Pi=V-\Delta S-\Delta_1 V_1$ eliminates $dS$ and $dv$ risk by choosing

$$
\frac{\partial V}{\partial S}-\Delta_1\frac{\partial V_1}{\partial S}-\Delta=0,\qquad
\frac{\partial V}{\partial v}-\Delta_1\frac{\partial V_1}{\partial v}=0.
$$

Equating both sides of the resulting identity to a function of the state yields the valuation equation (book eq. 1.3):

$$
\frac{\partial V}{\partial t}+\tfrac12 v S^2\frac{\partial^2 V}{\partial S^2}+\rho\eta v^\beta S\frac{\partial^2 V}{\partial v\partial S}+\tfrac12\eta^2 v^{\beta 2}\frac{\partial^2 V}{\partial v^2}+rS\frac{\partial V}{\partial S}-rV
=-(\alpha-\phi\beta\sqrt{v})\frac{\partial V}{\partial v}.
$$

Here $\phi(S,v,t)$ is the **market price of volatility risk**. Defining the risk-neutral drift $\alpha'=\alpha-\beta\sqrt{v}\,\phi$ absorbs $\phi$; thereafter all SDEs are treated as risk-neutral and fitted directly to option prices.

A delta-hedged but not vega-hedged book earns excess return $\beta\sqrt{v}\,(\partial V/\partial v)\,\{\phi\,dt+dZ_2\}$ per unit vol risk—CAPM analogy for $\phi$.

### 1.3 Local volatility: Dupire

**Breeden–Litzenberger**: risk-neutral density $\varphi(K,T;S_0)=\partial^2 C/\partial K^2$.

**Dupire (1994) / Derman–Kani (1994)**: unique diffusion coefficient (local vol) consistent with the continuum of European prices. For undiscounted call $C(S_0,K,T)$,

$$
\frac{\partial C}{\partial T}=\frac{\sigma^2(K,T)K^2}{2}\frac{\partial^2 C}{\partial K^2}+(r_t-D_t)\Bigl(C-K\frac{\partial C}{\partial K}\Bigr)\tag{1.4}
$$

and in zero-drift forward coordinates,

$$
\sigma^2(K,T,S_0)=\frac{\partial C/\partial T}{\tfrac12 K^2\,\partial^2 C/\partial K^2}.\tag{1.6}
$$

Dumas–Fleming–Whaley (1998) empirically reject constant-local-vol dynamics of the implied surface—local vol is an **effective theory**, not a literal vol process.

### 1.4 Local variance in terms of implied total variance

Define total implied variance $w(S_0,K,T):=\sigma_{\mathrm{BS}}^2(S_0,K,T)\,T$ and log-strike $y=\log(K/F_T)$. Black–Scholes FV call:

$$
C_{\mathrm{BS}}(F_T,y,w)=F_T\Bigl\{N\bigl(-y/\sqrt{w}+\sqrt{w}/2\bigr)-e^y N\bigl(-y/\sqrt{w}-\sqrt{w}/2\bigr)\Bigr\}.
$$

After chain-rule substitution into Dupire, Gatheral obtains the key inversion (eq. 1.10):

$$
v_L=\frac{\partial_T w}{1-\frac{y}{w}\partial_y w+\tfrac14\bigl(-\tfrac14-\tfrac1w+\frac{y^2}{w^2}\bigr)(\partial_y w)^2+\tfrac12\partial_{yy}w}.
$$

**No-skew special case**: $\partial_y w=0\Rightarrow v_L=\partial_T w$, so local variance equals forward BS variance and $w(T)=\int_0^T v_L(t)\,dt$.

### 1.5 Local variance as conditional expectation (Dupire 1996; Derman–Kani 1998)

With $dF_{t,T}=\sqrt{v_t}F_{t,T}\,dZ$, Ito on the call payoff and taking expectations yields

$$
\sigma^2(K,T,S_0)=E[v_T\mid S_T=K].\tag{1.12}
$$

**This identity is the book's workhorse**: local variance = risk-neutral expected instantaneous variance conditional on finishing at the strike.

---

## Chapter 2 — The Heston Model

### 2.1 Process

Heston (1993): $\alpha=-\lambda(v_t-\bar v)$, $\beta=1$:

$$
dS_t=\mu_t S_t\,dt+\sqrt{v_t}S_t\,dZ_1,\qquad
dv_t=-\lambda(v_t-\bar v)\,dt+\eta\sqrt{v_t}\,dZ_2,\qquad
\langle dZ_1 dZ_2\rangle=\rho\,dt.
$$

Square-root (CIR) variance; affine jump-diffusion special case (Duffie–Pan–Singleton 2000). Valuation PDE (2.3) with zero vol risk premium under the pricing measure.

### 2.2 European solution via Fourier

With $x=\log(F_{t,T}/K)$, $\tau=T-t$, future value call

$$
C(x,v,\tau)=K\{e^x P_1(x,v,\tau)-P_0(x,v,\tau)\},
$$

$P_j$ satisfy (2.6) with $a=\lambda\bar v$, $b_j=\lambda-j\rho\eta$, terminal $\theta(x)=\mathbf{1}_{x>0}$. Fourier transform $\tilde P(u,v,0)=1/(iu)$. Affine ansatz

$$
\tilde P_j(u,v,\tau)=\frac1{iu}\exp\{C(u,\tau)\bar v+D(u,\tau)v\}
$$

reduces to Riccati ODEs for $C,D$. Gathering Gatheral's intermediate coefficients:

$$
\alpha=-\frac{u^2}{2}-\frac{iu}{2}+iju,\quad
\beta=\lambda-\rho\eta j-\rho\eta iu,\quad
\gamma=\frac{\eta^2}{2}.
$$

Closed-form $C,D$ (standard Heston CF) → numerical Fourier inversion for prices. **Complex log branch** in the integrand (2.13) requires care (Gatheral digression)—Kahl–Jäckel / Lord–Kahl style continuous rotation of the log.

### 2.3 Simulation

- **Milstein** discretization of the CIR variance.
- **Exact transition**: $v_t\mid v_0$ is non-central $\chi^2$ (scaled); Broadie–Kaya sample $v_t$, then $\int v$, recover $\int\sqrt{v}\,dZ$, then $S_t$.
- Andersen–Brotherton-Ratcliffe: match mean/variance of integrals with a proxy distribution.

### 2.4 Why Heston is popular

Fast quasi-closed European prices → feasible calibration. Despite unrealistic dynamics, SV models with sensible parameters generate **similar surface shapes** and similar exotic implications at the level of the joint $(S,v)$ process; Heston is the cheap workhorse.

---

## Chapter 3 — The Implied Volatility Surface

### 3.1 Path-integral representation of implied variance

For $dS_t/S_t=\mu_t dt+\sigma_t dZ_t$ (σ possibly random), define Black–Scholes forward implied variance

$$
v_{K,T}(t)=\frac{E[\sigma_t^2 S_t^2\Gamma_{\mathrm{BS}}(S_t,\sigma(t))\mid\mathcal F_0]}{E[S_t^2\Gamma_{\mathrm{BS}}(S_t,\sigma(t))\mid\mathcal F_0]},
$$

with $\sigma^2(t)=\frac1{T-t}\int_t^T v_{K,T}(u)\,du$. Ito + BS PDE cancellation yields

$$
\sigma_{\mathrm{BS}}(K,T)^2=\frac1T\int_0^T E^{\mathbb G_t}[\sigma_t^2]\,dt,\tag{3.5–3.6}
$$

i.e. gamma-weighted path average of instantaneous variance (Lee 2005 measure $\mathbb G_t$). Equivalently, integrate **local** variance against a Brownian-bridge-like density $q$ peaked on the most probable path from spot to strike (Fig. 3.1: 1Y option, $K=1.3$, $\sigma=20\%$).

**Practical approximation** (local var roughly linear near the bridge peak $\tilde x_t$):

$$
\sigma_{\mathrm{BS}}(K,T)^2\approx\frac1T\int_0^T v_L(\tilde x_t,t)\,dt.\tag{3.11}
$$

**Short-expiry corollary (Ch. 7 preview)**: most probable path ≈ straight line spot→strike ⇒ $\sigma_{\mathrm{BS}}^2(k,T)\approx\tfrac12[v_{\mathrm{loc}}(0,0)+v_{\mathrm{loc}}(k,T)]$; **implied variance skew ≈ half local variance skew**.

### 3.2 Local vol in Heston; ansatz

With $x_t=\log(S_t/K)$, eliminate Brownian terms to get the conditional ODE for $u_t=E[v_t\mid x_T]$. Ansatz $E[x_s\mid x_T]=x_T \hat w_s/\hat w_T$ (Brownian-bridge style; OK near ATM) with $\hat v_s=(v_0-\bar v)e^{-\lambda s}+\bar v$, $\hat w_t=\int_0^t\hat v$.

Closed-form approximate local variance and then ATM term structure / skew formulas (3.18), (3.21) follow.

### 3.3 SVI parameterization

Gatheral (2004) **SVI** (stochastic volatility inspired) smile slice:

$$
w(k)=a+b\Bigl\{\rho(k-m)+\sqrt{(k-m)^2+\sigma^2}\Bigr\},
$$

$k=\log(K/F)$, $w=\sigma_{\mathrm{BS}}^2 T$. Fits each expiry independently; used throughout for SPX smiles (Fig. 3.3: eight listed expiries, 15 Sep 2005; bids/offers as diamonds).

### 3.4 Empirical SPX surface — 15 Sep 2005

**Table 3.1** (ATM SPX variance levels and skews, close 15 Sep 2005, day before expiration) — ATM variance term structure and ATM skew vs $T$ are fitted by approximate Heston formulas (3.18)/(3.21). Solid vs dashed fits in Figs. 3.4–3.5 exclude early points where jump effects dominate.

**Table 3.2 — Heston fit to SPX surface, close 15 Sep 2005:**

| Parameter | Value |
|-----------|------:|
| $v_0$ | 0.0174 |
| $\bar v$ | 0.0354 |
| $\eta$ | 0.3877 |
| $\rho$ | −0.7165 |
| $\lambda$ | 1.3253 |

**Verdict (Fig. 3.6):** Heston matches **long** expiries reasonably; **short** expiries much too flat vs empirical surface (Heston surface shifted down 5 vol points for visual comparison). Conclusion: pure SV cannot be the whole story → jumps (Ch. 5).

---

## Chapter 4 — The Heston–Nandi Model

Special case $\rho=-1$ (Heston–Nandi 1998 continuous-time GARCH limit): single Brownian driver; preference-free (vol risk hedgeable with stock). SDE rewrite:

$$
dv=-\lambda'(v-\bar v')\,dt-\eta\,dx,\quad \lambda'=\lambda+\eta/2,\ \bar v'=\bar v\,\lambda/\lambda'.
$$

Approximate local variance (4.1):

$$
v_{\mathrm{loc}}(x_T,T)=(v_0-\bar v')e^{-\lambda'T}+\bar v'-\eta x_T\Bigl\{\frac{1-e^{-\lambda'T}}{\lambda'T}\Bigr\},
$$

floored at zero (unattainable high strikes).

**Toy parameters used for the rest of the book (4.2):**

$$
v_0=\bar v=0.04,\quad \lambda=10,\quad \eta=1,\quad \rho=-1.
$$

Density at $T=0.1$ via CF inversion shows hard right cutoff. Local vols from Dupire ratio $2\partial_\tau c/p$ vs formula (4.1) agree closely (Fig. 4.2 across $T=0.1,\ldots,1.0$). European IVs from Heston formula vs PDE with (4.1) local vols also agree (Fig. 4.3).

**Point:** LV and SV can be calibrated to **nearly identical Europeans** yet remain dynamically inequivalent—exotics will differ.



---

## Chapter 5 — Adding Jumps

### 5.1 Why jumps are needed

Pure SV cannot produce the extreme short-dated SPX smile. **Table 5.1** (Sep 2005 expiry options, close 15 Sep 2005, SPX = 1227.73, triple witching next day):

| Strike | Call Bid | Call Ask | Put Bid | Put Ask |
|-------:|---------:|---------:|--------:|--------:|
| 1160 | 66.70 | 68.70 | 0.05 | 0.25 |
| 1170 | 56.70 | 58.70 | 0.05 | 0.35 |
| 1175 | 51.70 | 53.70 | 0.05 | 0.10 |
| 1180 | 46.70 | 48.70 | 0.10 | 0.30 |
| 1190 | 36.70 | 38.70 | 0.10 | 0.15 |
| 1195 | 31.70 | 33.70 | 0.05 | 0.20 |
| 1200 | 26.70 | 28.70 | 0.15 | 0.25 |
| 1205 | 21.70 | 23.70 | 0.25 | 0.30 |
| 1210 | 16.80 | 18.60 | 0.30 | 0.40 |
| 1215 | 11.90 | 13.70 | 0.30 | 0.45 |
| 1220 | 8.00 | 8.80 | 0.65 | 0.75 |
| 1225 | 3.90 | 4.20 | 1.10 | 1.90 |
| 1230 | 1.50 | 2.00 | 2.80 | 4.20 |
| 1235 | 0.35 | 0.50 | 6.70 | 8.30 |
| 1240 | 0.15 | 0.25 | 11.40 | 13.20 |
| 1245 | 0.15 | 0.70 | 16.40 | 18.00 |
| 1250 | 0.05 | 0.10 | 21.30 | 22.70 |

A **1160 put** (~67 pts OTM overnight) with 5¢ bid would require ~**13.7σ** under overnight-fraction-of-variance ≈40% and ATM vol ≈10%—Normal probability ~0 to 40 decimals. A **1250 call** (~23 pts OTM) is ~4.7σ (~1 in 10^6). Diffusions cannot justify these bids; Fig. 5.1 shows Sep16 smile vs flat Heston skew with Sep05 parameters.

### 5.2 Jump-diffusion valuation PIDE

Stock SDE: $dS=\mu S\,dt+\sigma S\,dZ+(J-1)S\,dq$ with Poisson $dq\in\{0,1\}$, intensity $\lambda(t)$. With known jump size, hedge with stock + another jump-sensitive asset → valuation (5.2). With uncertain jump size, perfect replication fails (social value of option trading). Risk-neutral PIDE (5.3):

$$
\partial_t V+\tfrac12\sigma^2 S^2\partial_{SS}V+rS\partial_S V-rV+\lambda(t)\bigl\{E[V(JS,t)-V(S,t)]-E[J-1]S\partial_S V\bigr\}=0.
$$

Compensator: $\mu=r+\mu_J$, $\mu_J=-\lambda E[J-1]$.

### 5.3 Lévy–Khintchine and characteristic functions

Lévy CF (5.4): $\phi_T(u)=\exp\{iu\omega T-\tfrac12 u^2\sigma^2 T+T\int(e^{iu\chi}-1)\mu(\chi)\,d\chi\}$, with $\phi_T(-i)=1$ fixing $\omega$.

- **BS:** $\phi_T(u)=\exp\{-\tfrac12 u(u+i)\sigma^2 T\}$.
- **Heston:** not Lévy; $\phi_T(u)=\exp\{C(u,T)\bar v+D(u,T)v\}$.
- **Merton JD** (log-jump $\sim N(\alpha,\delta^2)$):

$$
\phi_T(u)=\exp\Bigl\{iu\omega T-\tfrac12 u^2\sigma^2 T+\lambda T(e^{iu\alpha-u^2\delta^2/2}-1)\Bigr\},
$$
$\omega=-\tfrac12\sigma^2-\lambda(e^{\alpha+\delta^2/2}-1)$.

### 5.4 Option prices from CF (Lewis / Carr–Madan)

Zero rates/divs (5.6):

$$
C(S,K,T)=S-\sqrt{SK}\,\frac1\pi\int_0^\infty\frac{du}{u^2+1/4}\mathrm{Re}\bigl[e^{-iuk}\phi_T(u-i/2)\bigr],\quad k=\log(K/S).
$$

Implied vol via (5.7); ATM skew (5.8):

$$
\partial_k\sigma_{\mathrm{BS}}\big|_{k=0}=-e^{\sigma_{\mathrm{BS}}^2 T/8}\sqrt{\frac{2}{\pi T}}\int_0^\infty du\,\frac{u\,\mathrm{Im}[\phi_T(u-i/2)]}{u^2+1/4}.
$$

### 5.5 Short-$T$ jump skew heuristic

For small $\Delta T$, $C_J\approx C_{\mathrm{BS}}(Se^{\mu_J\Delta T},K,\Delta T)+O(\Delta T)$. Result (5.10):

$$
\partial_k\sigma_{\mathrm{BS}}^2\big|_{k=0}\approx -2\mu_J
$$

when mean jump is large relative to its std. Characteristic time $T^*$ for skew decay: when jump size ~ one diffusion std over $T^*$.

**Table 5.2 — JD parameters for Figs. 5.2–5.3:**

| Style | $\sigma$ | $\lambda$ | $\alpha$ | $\delta$ |
|-------|----------:|----------:|----------:|----------:|
| Solid | 0.2 | 0.5 | −0.15 | 0.05 |
| Dashed | 0.2 | 1.0 | −0.07 | 0.00 |
| Long-dashed | 0.2 | 1.0 | −0.07 | 0.05 |

As $T$ increases, JD return density → Normal (Fig. 5.4; $T^*=0.67$ for plotted params).

### 5.6 SVJ and SVJJ

**SVJ** = Heston + jumps in $S$ only; **SVJJ** = simultaneous jumps in $S$ and $v$. ATM variance skew ≈ sum of Heston and JD skews (Figs. 5.5–5.8, BCC parameters). SVJJ adds little vs SVJ for short $T$ (vol jump doesn't hit the smile instantly).

**Table 5.5 — SVJ fit to SPX, 15 Sep 2005** (and Table 5.4 comparing JD/SVJ fits to SPX): SVJ replicates major features of empirical surface (Fig. 5.9), unlike Heston. **Why SVJ wins:** fewer parameters than SVJJ, matches short and long ends; SVJJ overparameterized for smile fitting.

---

## Chapter 6 — Modeling Default Risk

### 6.1 Merton jump-to-ruin

Equity as call on firm assets; default = jump of stock to zero (absorbing). Credit spread $\approx$ jump intensity in risk-neutral measure. Fig. 6.1: 3M IVs with stock vol 20% and credit spreads **100 / 200 / 300 bp** — lower strikes lift as spread rises.

**Capital structure arbitrage:** trade equity options vs credit. Put-call parity breaks when default can make stock worthless while puts retain recovery-like value. **1×2 put spread** (buy 1.0-strike put, sell two 0.5-strike puts) illustrates (Fig. 6.2).

**Table 6.1 — Arb bounds for 1Y 0.5-strike options, ATM vol 20%:** upper/lower bounds widen with credit spread.

Jump-to-ruin local/implied vol formulas; Fig. 6.3 local variance with $\lambda=0.05$, $\sigma=0.2$.

**Table 6.2 — GT (Goodyear) Jan 2005 options, 20 Oct 2004, GT = 9.40:** market IVs vs Merton-fitted vols — practical credit–equity option link.

### 6.2 CreditGrades

Industry structural model: firm value dynamics + stochastic default barrier; survival probability, equity vol linked to leverage; calibrate to CDS and equity options. Used for capital-structure books; Gatheral notes real-world losses when model assumptions fail (liquidity, jump risk, wrong recovery).

---

## Chapter 7 — Volatility Surface Asymptotics

### 7.1 Short expirations (Medvedev–Scaillet)

Generic SV: $dv=a(v)dt+\eta\beta(v)dZ$. Short-$T$ ATM skew:

$$
\partial_k I\big|_{k=0}\to\frac{\rho\,b(\sigma)}{2\sigma}\tag{7.6}
$$

($b$ = diffusion coefficient of $\sigma$). **Independent of calendar time** — unlike LV, whose short skew decays as calendar advances → forward-starting options differ even if vanillas match today.

### 7.2 SABR

$$
dS_t=\sigma_t S_t^\beta dZ_1,\quad d\sigma_t=\chi\sigma_t dZ_2,\quad\langle dZ_1 dZ_2\rangle=\rho\,dt.
$$

No mean reversion → short expiries only. For $\beta=1$, Hagan et al. formula (7.7):

$$
\sigma_{\mathrm{BS}}(k)=\sigma_0\frac{y}{f(y)}\Bigl\{1+\bigl[\tfrac14\rho\chi\sigma_0+\tfrac{2-3\rho^2}{24}\chi^2\bigr]\tau+O(\tau^2)\Bigr\},
$$
$y=-\chi k/\sigma_0$, $f(y)=\log\bigl[(\sqrt{1-2\rho y+y^2}+y-\rho)/(1-\rho)\bigr]$. Implies $\partial_k\sigma_{\mathrm{BS}}|_{k=0}=\rho/2$, matching (7.6) with $\eta=2\chi$, $\beta(v)=\sqrt{v}$.

### 7.3 Jumps in short asymptotics

SVJ short skew: $\partial_k I|_{k=0}\to\rho b(\sigma)/(2\sigma)-\mu_J/\sigma$; in variance units, jump and SV contributions are **exactly additive at $\tau=0$**: $\partial_k v_{\mathrm{BS}}|_{k=0}\to\rho b(\sigma)-2\mu_J$.

### 7.4 Long expirations (Fouque–Papanicolaou–Sircar)

Log-OU volatility, large $\lambda T$: $\partial_x\sigma_{\mathrm{BS}}\approx\rho\xi/(\lambda T)$. Same $1/T$ decay as Heston. **Universal interpolation** (7.11):

$$
\partial_x\sigma_{\mathrm{BS}}^2\approx\frac{\rho\eta\beta(v)}{\lambda'T}\left\{1-\frac{1-e^{-\lambda'T}}{\lambda'T}\right\},\quad\lambda'=\lambda-\tfrac12\rho\eta\beta(v).
$$

### 7.5 Small vol-of-vol (Lewis 2000)

Perturbation $v_{\mathrm{BS}}=\beta_0+\beta_1 k+\beta_2 k^2+O(\eta^3)$ with explicit $J^{(i)}$ integrals; for $dv=-\lambda(v-\bar v)dt+\eta v^\phi dZ$ and $v=\bar v$, ATM variance skew matches (7.11) to $O(\eta)$.

### 7.6 Extreme strikes (Roger Lee 2004)

Model-free wing bounds: $\beta^*=\limsup_{k\to-\infty}\sigma_{\mathrm{BS}}^2 T/|k|\in[0,2]$ linked to $q^*=\sup\{q:E[S_T^{-q}]<\infty\}$ by $q^*=\tfrac12(1/\sqrt{\beta^*}-\sqrt{\beta^*}/2)^2$, and $\beta^*=g(q^*)$ with $g(x)=2-4[\sqrt{x^2+x}-x]$. Analogous right wing $\alpha^*\leftrightarrow p^*$. Benaim–Friz replace limsup by limits under mild tail conditions. Heston/SV: linear wings in $k$ (Drăgulescu–Yakovenko).

**Summary:** surface *shape* is generic across SVJ-type models; dynamics and jumps distinguish them.

---

## Chapter 8 — Dynamics of the Volatility Surface

### 8.1 Empirical skew dynamics vs model class

Empirically $\partial_k\sigma(k,t)$ ≈ **independent of vol level** ⇒ variance skew $\partial_k\sigma^2\sim\sqrt{v}$ ⇒ $\beta(v)\sim\sqrt{v}$ ⇒ **lognormal** variance (not Heston √v). Wrong $\beta$ can mis-hedge skew-sensitive claims by ~1.5× if vol doubles; LV is worse (kills forward skew).

### 8.2 Local vol forward skew collapse

LV local variance skew decays with total variance skew; integrating along most-probable paths → **forward implied surfaces much flatter than today's**. SV → approximately **time-homogeneous** forward skews. Digital cliquets expose this.

### 8.3 Digitals and digital cliquets

Digital call $D=-\partial C/\partial K$. With skew:

$$
D=-\partial_K C_{\mathrm{BS}}-\partial_\sigma C_{\mathrm{BS}}\cdot\partial_K\sigma_{\mathrm{BS}}.
$$

Example: 1Y ATM digital, ATM vol 25%, skew **3% per 10% strike** → skew term $\approx 0.4\times 0.3=0.12$ (**12% of notional** error if ignored!).

Digital cliquet: sequence of forward-starting digitals on $\{t_i\}$. 5Y deal, 6% coupon if up on the year else 0: ignoring first coupon, error up to **12% × 48% = 5.76% of notional**—multiple of typical margin. LV sellers underprice vs SV / “forward skew ≈ today” desks → adverse selection.

Stochastic implied vol models (Brace et al., Cont–da Fonseca, Schönbucher): martingale constraint on undiscounted calls tightly links surface dynamics; Durrleman extracts instantaneous variance dynamics near short ATM—but continuity assumptions conflict with needed jumps.

---

## Chapter 9 — Barrier Options

### 9.1 Definitions

Knock-out / live-out / knock-in; rebates (paid at hit or expiry).

### 9.2 Perfect-hedge limiting cases

- **Limit order / KO call with $B=K<S_0$**, zero rates/divs: charge $S_0-K$, hedge by buying 1 share → perfect hedge (barrier hit or exercise).
- **European capped calls** related by static hedges.
- **Reflection principle** (zero drift log-process): reflected path pairs (Fig. 9.1).
- **Lookback hedging** and **put-call symmetry** for quasi-static hedges of barriers.
- **One-touch** vs European binary: under SV vs LV, European binaries nearly identical (same vanillas) but one-touches diverge (Figs. 9.2–9.4)—path dependence / vol dynamics matter.
- Knock-out calls struck at 1.0 and 0.9 vs barrier (Figs. 9.5–9.6); live-outs (Fig. 9.7); lookbacks (Fig. 9.8).

### 9.3 Discrete monitoring (Broadie–Glasserman–Kou)

Barrier shift: continuous barrier $B$ ↔ discrete with adjustment $\sim \beta\sigma\sqrt{\Delta T}\,B$, $\beta\approx 0.5826\ldots$. Example: $\sigma=0.32$, daily $\sqrt{\Delta T}\approx 1/16$ → adjustment $\approx 0.32\times 0.6/16=0.012$ (**1.2% of barrier**). Discrete lookback maximum: $E[\hat S_T]=E[\tilde S_T]e^{-\beta\sigma\sqrt{\Delta T}}$.

### 9.4 Parisians, ladders, ranges

Parisian: occupancy window outside barrier (reduces manipulation / extreme Greeks). Ladders ≈ discretized lookbacks (~1.5× European for 10% steps; ~2× in continuous limit). Ranges = one-touch double barriers.

**Takeaway:** not all barriers are equally model-toxic; limiting cases + symmetry give robust quotes where dealers often refuse.

---

## Chapter 10 — Exotic Cliquets (Mediobanca case studies)

Toy dynamics throughout: Heston–Nandi params $v_0=\bar v=0.04$, $\lambda=10$, $\eta=1$, $\rho=-1$ vs matching LV (4.1)—Europeans match; exotics diverge.

### 10.1 Locally capped, globally floored cliquet

**Mediobanca Bond Protection 2002–2005** (ISIN IT0003391353), underlying DJ EURO STOXX 50. Annual coupon:

$$
\max\Bigl\{\sum_{t=1}^{12}\min(\max(r_t,-0.01),+0.01),\;\mathrm{MinCoupon}\Bigr\},\quad\mathrm{MinCoupon}=0.02,
$$
$r_t=S_t/S_{t-1}-1$. Local cap ±1%/month, global floor 2%, max 12%.

At MinCoupon=2%: **E[coupon] Heston 3.53% vs LV 2.55%** → upfront gap $3\times 0.98\approx 2.94\%$ (can exceed structurer P&L). Gap maximizes when MinCoupon=−1% (pure call-spread strip); vanishes at 12%.

**Table 10.1 — Estimated coupons:** 11/25/2003 **3.91%**; 11/25/2004 **3.55%**; 11/25/2005 **4.14%**. 3Y EUR swap on issue (2 Dec 2002): **3.59%**.

### 10.2 Reverse cliquet

**Mediobanca 2000–2005 Reverse Cliquet Telecommunicazioni** (IT0001458600). Final premium:

$$
P=\max\Bigl[0,\;\mathrm{MaxCoupon}+\sum_{i=1}^{10}\min(0,r_i)\Bigr],\quad\mathrm{MaxCoupon}=100\%.
$$

Without principal guarantee ≈ short strip of 6M ATM puts. At MaxCoupon=100%: expected redemption **43.9% (Heston) vs 42.0% (LV)**. SV > LV because investor is also long global floor (OTM puts) richer under SV forward skew. Telecom basket fell further ~70% post-issue; 5Y EUR swap 18 May 2000: **5.73%**.

### 10.3 Napoleon

**Mediobanca 2002–2005 World Indices Euro Note Serie 46** (IT0003487524). Coupon $\max[0,\mathrm{MaxCoupon}+\tilde r_i]$, $\tilde r_i=$ average of worst monthly returns of SPX, SX5E, NKY; MaxCoupon=10%.

Intuition (more negative forward skew ⇒ cheaper Napoleon) **fails**: at 10%, expected coupon **1.74% under both** Heston and LV—vol convexity and cross effects dominate. Moral: stress **model class**, not only parameters.

**Table 10.2 — Worst months & estimated coupons:**

| Date | $\tilde r$ SX5E | SPX | NKY | Est. Coupon |
|------|------------------:|----:|----:|------------:|
| 12/20/2003 | −7.61% | −5.69% | −11.61% | **1.70%** |
| 12/20/2004 | −6.62% | −4.26% | −9.12% | **3.33%** |
| 12/20/2005 | −3.09% | −3.91% | −6.36% | **5.55%** |

3Y EUR swap 20 Dec 2002: **3.26%**. Independent-increment pricers (correct 1M marginals, deterministic forward vol) underprice vol convexity → won deals and lost money (Jeffery, RISK Feb 2004).

---

## Chapter 11 — Volatility Derivatives

### 11.1 Spanning payoffs (Carr–Madan)

Any twice-differentiable $g(S_T)$:

$$
E[g(S_T)]=g(F)+\int_0^F \tilde P(K)g''(K)\,dK+\int_F^\infty \tilde C(K)g''(K)\,dK.\tag{11.1}
$$

Static strip of vanillas; weights $g''(K)$. Amortizing call $(S_T-L)^+/S_T$ = call at $L$ minus strip $2L\int_L^\infty K^{-3}\tilde C(K)\,dK$.

### 11.2 Log contract and variance swap

Ito: $\log(S_T/S_0)=\int dS/S-\tfrac12\int\sigma_S^2\,dt$. With log contract spanned by $1/K^2$ put/call strip:

$$
E\Bigl[\int_0^T\sigma_{S_t}^2\,dt\Bigr]=2\Bigl\{\int_{-\infty}^0 p(k)\,dk+\int_0^\infty c(k)\,dk\Bigr\}\tag{11.4}
$$

(**Dupire; Derman–Kamal–Kani–Zou**)—**model-independent for diffusions**. Variance swap = forward on realized annualized quadratic variation; pure vol play without delta hedging. Post-LTCM 1998: HFs paid variance (sold high implied); dealers bought vega vs structural short from equity-linked retail.

**Heston fair variance:** $E[W_T]=(1-e^{-\lambda T})(v_0-\bar v)/\lambda+\bar v T$; annualized $\frac{1-e^{-\lambda T}}{\lambda T}(v_0-\bar v)+\bar v$ — depends on $v_0,\bar v,\lambda$ **not** $\eta$.

Elegant IV representation (11.5): $E[W_T]=\int_{-\infty}^\infty N'(z)\,\sigma_{\mathrm{BS}}^2(z)\,T\,dz$ with $z=d_2$.

### 11.3 Jumps, vol swaps, convexity

Jumps break perfect QV replication (discrete jump contribution to $\langle x\rangle$ ≠ continuous Ito). Volatility swap (on $\sqrt{\langle x\rangle}$) needs convexity adjustment vs variance swap (Fig. 11.1: both struck at 30% vol).

**Heston vol-swap convexity adjustment** vs $T$: Figs. 11.2 (Heston–Nandi params), 11.3 (BCC params). Zero-correlation Laplace transform of QV → fair vol; lognormal QV approximation vs exact Heston for 1Y variance calls (Figs. 11.4–11.5, BCC).

### 11.4 VIX and VXB

Listed QV-based contracts: **VIX** (fair variance from SPX option strip, CBOE methodology evolving toward log-contract theory). **VXB futures** convexity: Table 11.1 empirical VXB convexity adjustments as of **8 Dec 2004**; Fig. 11.6 annualized Heston VXB convexity vs $t$ with SPX fit from that date.

Power payoffs, options on volatility, and partial model-independence results close the chapter: variance is robust; volatility and options-on-vol reintroduce model risk.

---

## Limitations (as stressed by Gatheral)

1. **Heston dynamics unrealism:** √v variance vs empirically preferred lognormal; short smile too flat without jumps.
2. **Jump models:** imperfect hedges; risk-neutral jump measure ≠ physical; infinite hedging instruments if jump size continuous.
3. **Local vol:** fits vanillas, wrong forward skew / sticky-strike-like dynamics; digital cliquets and Napoleons mispriced.
4. **Calibration instability:** Heston $\eta$ rises with vol level; parameters wander.
5. **Discrete vs continuous:** barrier/lookback adjustments material (bps of barrier).
6. **Zero-rate pedagogy:** most formulas set $r=q=0$; real books need forwards/dividends carefully.
7. **Single-name vs index:** most empirics are SPX; single stocks add borrow, jumps-to-ruin, narrower option strips.

---

## Practical Takeaways for a Quantitative Investor / Desk Quant

1. **Always separate vanilla fit from dynamics.** Matching today's surface (LV or carefully calibrated SV) does **not** pin down forward skew, barriers, cliquets, or Napoleons.
2. **Use SVJ (or equivalent) for equity indices** if you need both short and long smile; pure Heston is a long-expiry tool.
3. **Variance swaps / log strips** are the robust core of vol trading under diffusion assumptions; know the jump bias.
4. **Digital and cliquet risk is skew risk.** A 3-vol-point-per-10% skew moves ATM digitals by ~10%+ of notional; forward digitals need a forward-skew model.
5. **Stress model class:** Mediobanca Napoleon shows SV vs LV ranking can flip; independent-increment “correct smile, wrong dynamics” lost money.
6. **SABR for short-dated smile fitting;** Heston/SVJ for term structure and exotics; SVI for arbitrage-aware interpolation of slices.
7. **Lee wings:** check moment explosions / wing slopes for consistency of extrapolated surfaces used in variance-strip and exotic books.
8. **Empirical skew rule:** sticky sticky-delta / level-independent slope favors roughly lognormal vol—adjust Heston hedges or use lognormal/variance-curve models.
9. **Barrier quoting:** use reflection / put-call symmetry / discrete-shift rules before refusing; not all barriers are toxic.
10. **Credit–equity:** Merton jump-to-ruin and CreditGrades link CDS and OTM puts; capital-structure arb needs joint calibration and sober jump assumptions.

---

## Key Equation Sheet (quick reference)

| Topic | Formula |
|-------|---------|
| Local var = conditional E | $\sigma_L^2(K,T)=E[v_T\mid S_T=K]$ |
| Dupire (total var form) | (1.10) |
| Heston SDEs | (2.1)–(2.2) |
| Implied var path integral | (3.5)–(3.6), (3.11) |
| Heston–Nandi local var | (4.1); toy params (4.2) |
| Lewis call from CF | (5.6) |
| Short JD variance skew | $\partial_k\sigma^2\approx-2\mu_J$ |
| Medvedev–Scaillet ATM skew | (7.6) |
| Universal SV skew interp | (7.11) |
| Lee wing map | $g(x)=2-4[\sqrt{x^2+x}-x]$ |
| Carr–Madan spanning | (11.1) |
| Fair variance strip | (11.4), (11.5) |

---

## Empirical Parameter Snapshot (SPX, 15 Sep 2005)

| Model | $v_0$ | $\bar v$ | $\eta$ | $\rho$ | $\lambda$ | Notes |
|-------|-------:|----------:|-------:|--------:|----------:|-------|
| Heston (Tbl 3.2) | 0.0174 | 0.0354 | 0.3877 | −0.7165 | 1.3253 | Long OK, short too flat |
| Heston–Nandi toy | 0.04 | 0.04 | 1 | −1 | 10 | Europeans match LV |
| SVJ (Tbl 5.5) | (see book) | | | | | Best full-surface fit |

Spot reference: **SPX = 1227.73**. Overnight extreme OTM bids in Table 5.1 are the smoking gun for jumps.

---

## Extended Chapter-by-Chapter Implementation Notes for Quants

### Implementing Chapter 1–2 in production

Calibrate Heston to a sparse set of listed expiries by minimizing a weighted sum of IV residuals (bid/ask mid, or vega-weighted price residuals). Use the characteristic function with a **continuous complex logarithm** (Kahl–Jäckel). Integrate $P_j$ with an adaptive quadrature or FFT (Carr–Madan). Enforce Feller $2\lambda\bar v>\eta^2$ softly—many equity fits violate Feller; use reflection or Higham–Mao fixes in MC. Broadie–Kaya is accurate but slow; Andersen QE scheme is the practical Monte Carlo default.

### Implementing local volatility

Build an arbitrage-free IV surface (SVI per slice + calendar constraints, or Gatheral–Jacquier total-variance surface). Convert to total variance $w(k,T)$, apply (1.10) with careful numerical derivatives (Tikhonov / smoothing splines). Floor $v_L$ at a small epsilon. Use LV PDE or MC with interpolation of $\sigma_L(S,t)$ for exotics—but **never** trust LV for forward-skew products without overlay.

### Implementing jumps

Fit SVJ in stages: (i) long-expiry Heston-like parameters; (ii) add Merton jump parameters to hit the front month; (iii) joint refine. Check ATM skew term structure against additivity heuristic. Be explicit about the **risk-neutral** jump measure: hedging error is a feature, not a bug.

### Barriers and exotics

Price barriers under (a) LV calibrated to today, (b) SV/SVJ with same vanillas, (c) mixed local-stochastic vol if available. Quote mid only when (a)–(b) agree within tolerance; otherwise widen for model risk. Apply Broadie–Glasserman–Kou discrete adjustments. For cliquets, run the Mediobanca-style MinCoupon/MaxCoupon sensitivity plots as a standard risk report.

### Variance / vol trading desk

Maintain a **log-strip** synthesizer from listed options with cutoffs and wing extrapolation constrained by Lee. Publish fair variance vs swap market; trade the basis. Convert variance to volatility with Heston (or empirically calibrated) convexity adjustments; never assume $\sqrt{E[W]}=E[\sqrt{W}]$. VIX futures convexity (VXB) needs a joint model of the variance curve.

### Risk management checklist from the book

- Vega ≠ variance-swap equivalent notional.
- Forward digital exposure: report skew01 of each reset.
- Napoleon / worst-of monthly: report vol-of-vol01 and cross spot–vol gambles.
- Credit–equity books: bump hazard and equity vol surface jointly.
- Parameter CAPM: bump $\rho$, $\eta$, $\lambda$ separately and as a PCA of historical calibrations.

---

## Closing Synthesis

Gatheral’s book is the rare practitioner text that is also theorem-level clear. The spine is equation (1.12)—local variance as conditional expected instantaneous variance—plus the gamma-path representation of implied variance (3.5). Everything else is consequence: why Heston fits the belly but not the front; why jumps fix the front; why LV and SV can agree on vanillas and disagree violently on cliquets; why variance swaps are beautiful under diffusions; why model-class stress tests beat parameter bump reports for Napoleons.

For a quantitative investor, the actionable message is double: **(i)** use the surface as a consistent pricing constraint, not as a crystal ball for the true measure; **(ii)** allocate model risk capital to claims whose value is a nonlinear functional of **forward** skew and vol-of-vol—digitally compounded structures, worst-of monthly coupons, and dual-digital features—where the 2002–2005 Mediobanca cohort remains the canonical post-mortem.



---

## Deep Dive A — Full Derivation Walkthrough: From Dupire to Implied Path Integrals

### A.1 Recovering the density

Start from the undiscounted call $C(S_0,K,T)=\int_K^\infty (S_T-K)\varphi(S_T,T;S_0)\,dS_T$. Differentiating under the integral (dominated convergence / distributional derivatives):

$$
\partial_K C=-\int_K^\infty\varphi\,dS_T=-Q(S_T>K),\qquad
\partial_{KK}C=\varphi(K,T;S_0).
$$

Trader language: $\partial_{KK}C$ is the continuum limit of an infinitesimally tight butterfly with unit max payoff—the Arrow–Debreu price density.

### A.2 Fokker–Planck → Dupire

Under local diffusion $dS/S=\mu_t dt+\sigma(S,t)dZ$, the density satisfies

$$
\partial_T\varphi=\tfrac12\partial_{SS}(\sigma^2 S^2\varphi)-\partial_S(\mu S\varphi).
$$

Insert into $\partial_T C=\int_K^\infty\partial_T\varphi\,(S-K)\,dS$, integrate by parts twice, boundary terms vanish under standard growth, and obtain (1.4). With forwards $F_T=S_0\exp\int_0^T\mu$, drift terms cancel and (1.6) remains.

### A.3 Changing variables to $(y,w)$

Market quotes are in $\sigma_{\mathrm{BS}}$. Set $w=\sigma_{\mathrm{BS}}^2 T$, $y=\log(K/F_T)$. BS call becomes (1.7). Chain-rule identities (1.9) are mechanical but crucial:

$$
\partial_{yy}C_{\mathrm{BS}}-\partial_y C_{\mathrm{BS}}=2\partial_w C_{\mathrm{BS}}.
$$

After substituting $\partial_y C=\partial_y C_{\mathrm{BS}}+\partial_w C_{\mathrm{BS}}\partial_y w$ etc. into the Dupire PDE in $y$-space and cancelling $\partial_w C_{\mathrm{BS}}$, one arrives at the nonlinear PDE for $w$ whose inversion is (1.10). Numerical practice: compute $\partial_T w$, $\partial_y w$, $\partial_{yy}w$ from a smooth surface fit; evaluate denominator carefully near wings where $\partial_y w$ is large—negative denominators signal arbitrage in the input surface.

### A.4 Conditional expectation proof of (1.12)

Write $dF_{t,T}=\sqrt{v_t}F_{t,T}dZ$. Ito on $(S_T-K)^+$:

$$
d(S_T-K)^+=\theta(S_T-K)\,dS_T+\tfrac12 v_T S_T^2\delta(S_T-K)\,dT.
$$

Take $E[\,\cdot\,]$, martingale property kills the $dS$ term, identify $\partial_T C=\tfrac12 E[v_T S_T^2\delta(S_T-K)]$, factor $E[v_T\mid S_T=K]K^2\partial_{KK}C/2$, compare to Dupire definition → (1.12).

### A.5 Path-integral implied variance (Chapter 3)

Apply Ito pathwise to $f=C_{\mathrm{BS}}(S_t,K,\sigma(t),T-t)$. Take risk-neutral expectation. Replace $\partial_t C_{\mathrm{BS}}$ using the BS PDE with deterministic forward variance function $v_{K,T}(t)$. The $dS$ integral vanishes as a martingale. Defining $v_{K,T}$ so that the gamma-weighted residual $\sigma_t^2-v_{K,T}(t)$ has zero expectation cancels the remaining term and forces $\sigma(0)=\sigma_{\mathrm{BS}}(K,T)$. Interpretation: sale of the option at $\sigma_{\mathrm{BS}}$, delta-hedged on the BS gamma schedule with variance forecast $v_{K,T}$, has zero expected P&L iff $v_{K,T}$ is the gamma-weighted expected instantaneous variance—hence (3.5).

Most-probable-path approximation: $q(x_t,t;x_T,T)\propto p(x_t)S_t^2\Gamma_{\mathrm{BS}}$ peaks along a bridge from spot to strike; if $v_L$ is locally linear in $x$, only the peak value survives → (3.11). This is why “implied var ≈ average local var along the bridge” is the desk mnemonic.

---

## Deep Dive B — Heston Characteristic Function and Numerical Pitfalls

### B.1 Riccati structure

After Fourier transform of (2.6), the ODE in $\tau$ for the transform is linear in $v$ with quadratic coefficients—affine structure. The ansatz $\tilde P=\frac1{iu}\exp(C\bar v+D v)$ converts the PDE to Riccati for $D$ and a quadrature for $C$:

$$
\partial_\tau D=\gamma D^2-\beta D+\alpha,\qquad
\partial_\tau C=a D,
$$

with $\alpha,\beta,\gamma$ as in Chapter 2. Closed form involves

$$
D(u,\tau)=\frac{\beta-\xi}{\eta^2}\frac{1-e^{-\xi\tau}}{1-ge^{-\xi\tau}},\quad
\xi=\sqrt{\beta^2-2\alpha\eta^2},\quad g=\frac{\beta-\xi}{\beta+\xi},
$$

and $C$ integrates to a log expression—the infamous complex logarithm.

### B.2 The complex log

As $u$ runs along the integration contour, $\xi(u)$ traces a path in $\mathbb C$. Naive `Log` in floating point jumps by $2\pi i$ when crossing the branch cut, producing discontinuities in $C$ and hence in the integrand of (2.13). Gatheral’s digression and subsequent literature (Albrecher et al., Lord–Kahl, Kahl–Jäckel) prescribe either: (i) rotate the branch continuously by tracking $\mathrm{Im}\log$ along the $u$-grid; or (ii) use the “full” Gatheral representation that rearranges terms to keep the expression continuous. Production code must unit-test CF continuity on a dense $u$-grid for calibrated parameters.

### B.3 Integration and calibration objective

Integrate $P_j$ as $\frac12+\frac1\pi\int_0^\infty\mathrm{Re}[e^{-iux}\tilde P_j]\,du$ (or Lewis (5.6) style). Truncate when integrand decays; use tanh-sinh or adaptive Gauss–Kronrod. Calibration: minimize $\sum_i\omega_i(\sigma_{\mathrm{model}}(K_i,T_i)-\sigma_{\mathrm{mkt}})^2$ with $\omega_i$ proportional to vega or to $1/({\mathrm{ask}}-{\mathrm{bid}})^2$. Bounds: $\lambda>0$, $\bar v>0$, $v_0>0$, $\eta>0$, $\rho\in(-1,1)$. Soft penalty on Feller violation.

### B.4 Simulation schemes ranked

| Scheme | Bias | Speed | Notes |
|--------|------|-------|-------|
| Euler on $\sqrt{v}$ | high near 0 | fast | can go negative |
| Milstein | better | fast | still negative issues |
| Reflection / absorption at 0 | ad hoc | fast | common desk hack |
| Andersen QE | low | medium | industry default |
| Broadie–Kaya exact | ~zero | slow | benchmarking |

---

## Deep Dive C — Reading the September 15, 2005 SPX Surface Like a Trader

### C.1 Market context

Triple witching eve: monthly OPX/SPX options, futures, and stock options expire together next morning open (a.m. settlement for SPX). Liquidity in short-dated wings is real but wide. ATM vol near 10% overnight is low by crisis standards but the **wing bids** (Table 5.1) show crash premium remains embedded.

### C.2 SVI slice fits (Fig. 3.3)

Eight listed expiries; black/grey diamonds = bid/offer IVs; solid = SVI. SVI parameters $(a,b,\rho,m,\sigma)$ per slice must satisfy no butterfly arb ($b(1+|\rho|)<\ldots$ Gatheral–Jacquier conditions) and no calendar arb when lifted to a surface. Practitioners often fit total variance in $k$ with a common $\rho$ backbone.

### C.3 ATM skew term structure (Fig. 3.4)

Empirical ATM skew vs $T$: very steep at short $T$, then decays. Heston formula (3.21) fits the **belly and back** (solid line excluding first point, or dashed excluding first three) but systematically fails the front—quantitative evidence that a jump component is required. ATM variance term structure (Fig. 3.5) is easier for Heston (mean reversion to $\bar v=0.0354$ from $v_0=0.0174$).

### C.4 Surface comparison (Fig. 3.6 / 5.9)

Heston surface (shifted −5 vol pts) undershoots short-expiry curvature. SVJ surface matches major ridges. Desk rule: if your exotic’s vega is concentrated in the first three months, **do not** use pure Heston.

### C.5 Table 3.2 numerology

- $v_0=0.0174\Rightarrow \sqrt{v_0}\approx13.2\%$ spot vol—consistent with calm Sep 2005.
- $\bar v=0.0354\Rightarrow\sim18.8\%$ long-run vol—above spot (contango of variance curve).
- $\lambda=1.3253$: variance half-life $\ln 2/\lambda\approx0.52$ years.
- $\eta=0.3877$, $\rho=-0.7165$: strong negative correlation drives put skew; vol-of-vol moderate vs crisis calibrations ($\eta$ often $>1$).

---

## Deep Dive D — Jump Parameter Economics

### D.1 Interpreting Table 5.2

Solid line: rare ($\lambda=0.5$) fat down jumps ($\alpha=-0.15$, $\delta=0.05$) → steep short smile, fast decay. Dashed: frequent small deterministic down jumps ($\lambda=1$, $\alpha=-0.07$, $\delta=0$) → different short smile, different $T^*$. Long-dashed adds jump vol $\delta=0.05$ to the frequent case—smooths the smile.

ATM variance skew $\approx-2\mu_J$ with $\mu_J=-\lambda(e^{\alpha+\delta^2/2}-1)$. For solid params: $e^{\alpha+\delta^2/2}\approx e^{-0.15+0.00125}\approx0.861$, so $E[J-1]\approx-0.139$, $\mu_J\approx0.5\times0.139=0.0695$, hence $\partial_k\sigma^2\approx-0.139$ near $T=0$—a large short-dated skew, matching Figs. 5.2–5.3 qualitatively.

### D.2 Additivity with stochastic vol

Figs. 5.5–5.6: SVJ ATM skew (solid) ≈ Heston skew + JD skew (dashed) for BCC parameters—useful diagnostic when fitting. SVJJ (Figs. 5.7–5.8) lifts short skew slightly more but the incremental gain vs SVJ is small relative to extra parameters (jump in $v$ size/correlation). Gatheral’s verdict: **SVJ wins** for SPX surface fitting.

### D.3 BCC parameters (reference)

Bakshi–Cao–Chen (1997) equity-index benchmarks appear throughout Chapters 5 and 11 (convexity figures). Typical BCC-style Heston+jumps: substantial $\lambda$, negative mean jump, moderate $\delta$, and Heston $\rho<0$. When reproducing Gatheral’s figures, use the BCC set cited in the text’s tables/figure captions consistently.

---

## Deep Dive E — Default, GT Case, and Capital Structure

### E.1 Jump-to-ruin as credit

If the equity can jump to zero with intensity $\lambda$, OTM puts embed a credit component. With diffusion vol 20%, raising credit spread from 100→300 bp lifts the entire put wing (Fig. 6.1). Implied vol of deep OTM puts becomes an alternate quote of the CDS curve—basis trades need careful recovery and funding adjustments.

### E.2 Put-call parity and the 1×2

When default can destroy stock but puts pay on strike, standard PCP fails. The 1×2 put spread (long 1× ATM put, short 2× 50-delta-ish puts) has a payoff that can be positive in mild down moves and negative in crashes—exactly the region where jump-to-ruin mass sits. Table 6.1’s arb bounds quantify how wide the no-arb band becomes as spreads widen.

### E.3 Goodyear vignette (Table 6.2)

GT at 9.40 on 20 Oct 2004; Jan 2005 options. Merton vols vs market IVs show where the structural model fits and where liquidity/jump risk premia remain. Lesson for quants: structural models give a **prior**; the option surface gives the **market measure**—trade the residual only with limits sized to jump and borrow risk.

---

## Deep Dive F — Asymptotics Toolkit for Surface Construction

### F.1 Short-dated skew recipe

1. Estimate physical or RN jump compensator $\mu_J$ from short wing or CDS.
2. Estimate $\rho\eta\beta(v)$ from longer skew or from variance–spot covariance.
3. Short ATM variance skew $\approx\rho\beta\eta-2\mu_J$ at $T\downarrow0$.
4. Enforce Lee wings on any extrapolator used for variance strips.

### F.2 SABR as a fitting engine

Fit $(\sigma_0,\chi,\rho,\beta)$ to each short expiry (often fix $\beta=0.5$ or $1$). Use (7.7) as the slice parametrization; do **not** evolve SABR for long-dated exotics without mean reversion overlays (e.g., ZABR, free-boundary SABR, or map to a variance-curve model).

### F.3 Long-dated skew recipe

Use (7.11) with $\lambda'$ from calibration. Check consistency with FPS log-OU prediction $\partial_x\sigma\sim 1/(\lambda T)$. If empirical long skew is flatter/steeper, revisit $\rho\eta/\lambda$.

### F.4 Lewis small-$\eta$ expansion

Useful for intuition and for initializing calibrations: ATM level, skew, and curvature as power series in $\eta$. Truncation error grows with $\eta\sqrt{T}$; for $\eta\sim0.4$, $T\sim1$, first order is decent; for $\eta\sim1$, need full CF.

---

## Deep Dive G — Dynamics: What to Hedge

### G.1 Level-independent skew ⇒ lognormal vol

If traders quote skew in “vol points per 10% spot” roughly stable as ATM vol moves from 12% to 30%, then $\partial_k\sigma$ is stable ⇒ $\partial_k\sigma^2=2\sigma\partial_k\sigma$ scales as $\sigma\sim\sqrt{v}$. Matching (7.11) forces $\beta(v)\propto\sqrt{v}$. Heston ($\beta=1$) then understates skew expansion in high-vol regimes. Practical fix: use a lognormal-vol or 3/2 model for scenario hedges; keep Heston for analytic Europeans if needed.

### G.2 Local vol’s forward-flat curse

Differentiating (1.10) shows local variance skew tracks $\partial_T(\partial_k w)$ plus decay terms. Integrating LV along bridges from a future date $t^*>0$ uses already-decayed local skews → forward BS skew too small. **Any** product that resets a strike in the future inherits this bias under LV.

### G.3 Digital cliquet loss budget

Worked example in text: 5Y, 6% coupon if index up on the year. Skew error 12% of digital notional × 4 remaining coupons × 6% = 5.76% of deal notional. If sales P&L target is 1%, this is fatal. Process control: require dual valuation (LV vs SVJ) before booking; if gap > X bp, escalate.

---

## Deep Dive H — Barriers: Building Intuition Drills

### H.1 Drill 1 — KO call with $B=K<S$

Premium $S-K$, hedge long stock: perfect when $r=q=0$. Model risk ≈ 0. If someone offers this materially away from $S-K$, arb it.

### H.2 Drill 2 — One-touch vs binary

Same vanilla surface ⇒ same European binary (almost). One-touch depends on hitting probabilities ⇒ sensitive to vol-of-vol and skew dynamics. Figs. 9.2–9.4: SV vs LV diverge for one-touches, agree for European binaries. Quote European digital off the smile; quote one-touch with model reserve.

### H.3 Drill 3 — Discrete barrier adjustment

Always apply BGK shift before comparing broker quotes to continuous PDE values. 1% barrier move can be worth more than the bid–offer on a short-dated KO.

### H.4 Drill 4 — Live-outs

Live-out = KO that is deep ITM at barrier → rebate-like loss of intrinsic. Highly sensitive to push across the barrier; greeks explode; Parisian windows help.

---

## Deep Dive I — Cliquet Risk Reports (Desk Template)

For any cliquet-like book, automate:

1. **LV vs SVJ value gap** across a grid of global floor/cap (Figs. 10.1, 10.3, 10.5 style).
2. **Forward skew01** per reset month.
3. **Volga / vanna** of the coupon function.
4. **Sticky-delta vs sticky-strike** scenario P&L.
5. **Jump scenario**: overnight −5%/−10% with vol to 40%.
6. **Historical coupon replay** on underlying path (Tables 10.1–10.2 style).

Mediobanca lessons encoded as unit tests: (i) locally capped globally floored must show SV > LV when investor is long skew; (ii) Napoleon need not; (iii) reverse cliquet gap small but signed by global floor.

---

## Deep Dive J — Variance Derivatives Desk Manual

### J.1 Building the log strip

1. Take listed puts below $F$, calls above $F$.
2. Convert to OTM prices; divide by $K^2$; integrate (trapezoid / quadrature).
3. Extrapolate wings with Lee-consistent slopes or capped linear total variance.
4. Multiply by $2/T$ for annualized fair variance; compare to variance swap offer.
5. Adjust for discreteness, dividends, overnight vs business-day conventions, and jump bias if markets price crash put wings beyond diffusion.

### J.2 Heston variance vs IV

Fair variance ignores $\eta$—pure $v_0,\bar v,\lambda$. ATM IV sits below $\sqrt{E[W]/T}$ due to smile convexity. Expansion of (11.5) around flat surface gives skew and curvature corrections—useful sanity checks.

### J.3 Vol swap convexity

Figs. 11.2–11.3: annualized Heston convexity adjustment vs $T$ for two parameter sets. Sign and magnitude matter when converting variance quotes to volatility quotes. Lognormal QV approximation (Figs. 11.4–11.5) works surprisingly well for 1Y variance calls under BCC—use as control variate.

### J.4 VIX / VXB

VIX ≈ fair 30-day variance from SPX strip (methodology aligned with log-contract theory post-2003 rewrite). VXB futures: convexity vs spot VIX; Table 11.1 (8 Dec 2004) and Fig. 11.6 give the empirical/Heston map. Trading VIX futures vs variance swaps vs vanillas is a joint curve problem.

---

## Deep Dive K — Formula Derivations Worth Memorizing

### K.1 Short JD skew $\partial_k\sigma^2\approx-2\mu_J$

Condition on zero vs one jump in $\Delta T$. Down-jump makes OTM calls ~worthless contribution; ATM call ≈ BS with drift-adjusted spot. Differentiate vs log-strike, divide by BS vega $\sim S\sqrt{\Delta T}/\sqrt{2\pi}$, take $\Delta T\to0$ → (5.10).

### K.2 Digital with skew

$D=-\partial_K C_{\mathrm{BS}}-\nu\partial_K\sigma$. Second term = vega × skew. With $\nu\approx S\sqrt{T}n(d_1)$, ATM, $\sigma=0.25$, $T=1$, $\partial_K\sigma\approx-0.3$ per unit relative strike (3% per 10%) → ~0.12.

### K.3 Variance strip

Ito + spanning of $\log$ → (11.4). Discrete variance swap payoff with $N$ samples annualizes $\sum\log(S_i/S_{i-1})^2$; theory uses continuous QV; practical contracts specify calculation manuals (replication vs realized).

### K.4 BGK barrier shift

Expected overshoot of Brownian motion over a discrete grid $\propto\sigma\sqrt{\Delta T}$; constant $\beta=-\zeta(1/2)/\sqrt{2\pi}\approx0.5826$. Shift barrier by $Be^{\pm\beta\sigma\sqrt{\Delta T}}$ depending on direction.

---

## Annotated Bibliography Hooks (from the book’s references, as used)

- **Dupire (1994, 1996, 1998):** local vol and implied path ideas.
- **Derman–Kani (1994, 1998):** trees and conditional expectation.
- **Heston (1993); Heston–Nandi (1998):** CF pricing; GARCH limit $\rho=-1$.
- **Duffie–Pan–Singleton (2000):** affine jump diffusions.
- **Carr–Madan (1998, 1999); Lewis (2000):** Fourier pricing; vol-of-vol expansions.
- **Hagan et al. (2002):** SABR.
- **Medvedev–Scaillet (2004):** short-expiry asymptotics with jumps.
- **Fouque–Papanicolaou–Sircar (1999, 2000):** long-expiry skew.
- **Lee (2004, 2005):** moment formula; implied variance representations.
- **Broadie–Glasserman–Kou (1999):** discrete barriers/lookbacks.
- **Demeterfi–Derman–Kamal–Zou (1999); Chriss–Morokoff (1999):** variance swaps.
- **Bakshi–Cao–Chen (1997):** empirical SVJ benchmarks.
- **Wilmott (2000); Taleb (1996):** practitioner barrier lore.

---

## End-to-End Worked Mini-Example (Synthetic)

Suppose SPX-like spot $S=100$, 1M and 1Y smiles available. Calibrate Heston to 1Y (get $\bar v,\lambda,\eta,\rho,v_0$). Calibrate Merton jumps to 1M wing (get $\lambda_J,\alpha,\delta$). Merge into SVJ; refit lightly. Build LV from the SVJ European prices via (1.10)—now LV and SVJ match vanillas. Price: (i) 1Y ATM digital, (ii) 1Y one-touch at 90, (iii) 3Y annual digital cliquet, (iv) variance swap to 1Y, (v) Napoleon-style worst-month coupon. Record LV vs SVJ. Expect: (i) close; (ii) gap; (iii) large gap; (iv) identical (diffusion strip); (v) ambiguous. This single worksheet recapitulates Chapters 3–5 and 8–11.

---

## Final Quantitative Inventory (numbers to retain)

| Item | Value |
|------|------:|
| SPX spot (15 Sep 2005) | 1227.73 |
| Crash print (19 Oct 1987) | −22.9% |
| Heston $v_0$ | 0.0174 |
| Heston $\bar v$ | 0.0354 |
| Heston $\eta$ | 0.3877 |
| Heston $\rho$ | −0.7165 |
| Heston $\lambda$ | 1.3253 |
| Toy HN $v_0=\bar v$ | 0.04 |
| Toy HN $\lambda$ | 10 |
| Toy HN $\eta$ | 1 |
| Toy HN $\rho$ | −1 |
| Mediobanca local cap/floor | ±1%/month |
| Mediobanca global floor | 2% |
| LC/GF E[coupon] Heston | 3.53% |
| LC/GF E[coupon] LV | 2.55% |
| Upfront LC/GF gap | ~2.94% |
| Reverse cliquet E[red.] Heston | 43.9% |
| Reverse cliquet E[red.] LV | 42.0% |
| Napoleon E[coupon] both | 1.74% |
| Digital skew error example | ~12% notional |
| 5Y digital cliquet error budget | ~5.76% notional |
| BGK daily adj. example | ~1.2% of barrier |
| GT spot (20 Oct 2004) | 9.40 |
| 3Y EUR swap (2 Dec 2002) | 3.59% |
| 5Y EUR swap (18 May 2000) | 5.73% |
| 3Y EUR swap (20 Dec 2002) | 3.26% |

---

## Postscript Alignment

Gatheral’s postscript (p. 162) and Taleb’s foreword converge: models are **relative-pricing engines**, not cameras of reality (cf. MacKenzie’s later sociological title). The quant investor who internalizes that—and who insists on dual dynamics for every skew-convex exotic—has extracted the book’s durable edge.



---

## Extended Commentary on Every Major Figure and Table

### Figure 1.1–1.3 (SPX returns)

Daily log returns 1984-12-31 to 2004-12-31 display volatility clustering and the −22.9% 1987 crash outlier. The frequency histogram versus Normal and the Q–Q plot with extended left axis are the pedagogical justification for abandoning Black–Scholes constant vol and for including jumps: the left tail is not a 3σ story; it is a Lévy-style event. Quant takeaway: any short-dated OTM put model that is pure diffusion will understate crash insurance relative to the historical measure—and the risk-neutral measure is even more crash-heavy after 1987.

### Figure 3.1 (bridge density)

The density $q(x_t,t;x_T,T)$ for a 1Y strike-1.3 option under 20% flat vol peaks along a nearly straight line in $(x,t)$ from 0 to $\log 1.3$. This picture licenses the most-probable-path approximation used everywhere from short-dated skew heuristics (Ch. 7) to barrier intuition.

### Figures 3.2–3.6 (SPX surface and Heston)

Fig. 3.2 is the raw empirical surface on 2005-09-15. Fig. 3.3’s SVI fits per expiry are the operational smile engine. Fig. 3.4’s ATM skew term structure is the smoking gun against pure SV for the front end. Fig. 3.5’s ATM variance term structure is Heston’s comfort zone. Fig. 3.6’s dual-view surface comparison (empirical vs Heston, Heston shifted −5pts) should be burned into every equity derivatives trainee’s retina.

### Figures 4.1–4.3 (Heston–Nandi)

Density cutoff at high strikes (Fig. 4.1) warns that $\rho=-1$ is a toy: real markets do not have hard unattainable calls. Figs. 4.2–4.3 validate the analytic local-var approximation (4.1) against PDE/CF numerics across ten expiries—the experimental warrant for using this parameter set as the LV-vs-SV laboratory in Chapters 9–10.

### Figures 5.1–5.9 (jumps)

Fig. 5.1: one-day smile vs Heston—irreconcilable. Figs. 5.2–5.3: JD smile and ATM skew term structure across Table 5.2 params. Fig. 5.4: CLT restoration as $T$ grows past $T^*$. Figs. 5.5–5.8: skew additivity SVJ ≈ Heston+JD; SVJJ detail. Fig. 5.9: SVJ surface match—compare mentally to Fig. 3.6.

### Figures 6.1–6.4 (credit)

Credit-spread-parameterized Merton smiles; 1×2 payoff; local variance with $\lambda=0.05,\sigma=0.2$; GT fit triangles vs Merton line.

### Figures 7.x / 8.1 / 9.x / 10.x / 11.x

Short-path schematic (7.1); cliquet payoff cartoon on SPX (8.1); reflection (9.1); one-touch/binary/KO/live-out/lookback SV vs LV (9.2–9.8); Mediobanca value curves and historical replays (10.1–10.6); variance vs vol swap payoffs (11.1); Heston convexity curves (11.2–11.3, 11.6); variance-call and log-QV pdf comparisons (11.4–11.5).

### Tables — operational use

| Table | Use on the desk |
|-------|-----------------|
| 3.1 | Benchmark ATM var & skew term structure for a calm day |
| 3.2 | Reference Heston seed for SPX-like calibrations |
| 5.1 | Extreme short-dated wing tape |
| 5.2–5.3 | JD comparative statics |
| 5.4–5.5 | JD vs SVJ fit horse-race |
| 6.1–6.2 | Capital-structure bound & single-name case |
| 10.1–10.2 | Ex-post coupon reality check vs swap rates |
| 11.1 | VXB convexity empirical anchor (2004-12-08) |

---

## Calibration Playbook (Step-by-Step)

### Step 1 — Clean the surface

Filter crossed markets; drop zero bids in far wings or replace with Lee-consistent synthetic offers; convert American single-stock quotes with care (early exercise). Build total variance $w(k,T)$ on a rectangular grid.

### Step 2 — Arbitrage repairs

Enforce butterfly positivity ($\partial_{kk}w$ conditions via SVI constraints), calendar positivity ($\partial_T w\geq 0$ for fixed $k$ in the Gatheral–Jacquier sense), and vertically positive call spreads. Prefer repairing inputs over flooring local vol after the fact.

### Step 3 — Parametric anchors

Fit SVI per slice; fit Heston to $T\geq 3M$; fit jump parameters to $T\leq 1M$; merge to SVJ; optionally add a piecewise-deterministic variance curve for term-structure flexibility (roughly “Heston with time-dependent $\bar v$”).

### Step 4 — Local vol twin

Generate a continuum of Europeans from the SVJ CF; run Dupire (1.10) to get $v_L(S,t)$; store as the LV twin for exotic comparison.

### Step 5 — Exotic battery

Price the standard battery: variance swap, vol swap, one-touches, KO/KI, digital cliquet, locally capped globally floored, Napoleon. Save LV vs SVJ gaps to a model-risk ledger.

### Step 6 — Hedge ratios

Publish delta/vega under SVJ; publish bump-and-recalibrate (“sticky delta”) scenarios; publish parameter vegas ($\partial/\partial\eta,\partial/\partial\rho,\partial/\partial\lambda_J$).

### Step 7 — Lifecycle

Re-fit daily; track parameter PCA; alert when $\eta$ or short skew jumps beyond 2σ of 60-day history; re-run exotic battery weekly or on regime breaks.

---

## Connections to Later Literature (post-2006 context for the reader)

Although the book is 2006, a quant reading it in later years should map concepts forward:

- **Rough volatility** (Gatheral–Jaisson–Rosenbaum et al.): fractional kernel replaces $\lambda$-mean-reversion to fit short ATM skew term structure without jumps—an alternative to Chapter 5’s jump fix for some markets.
- **Bergomi variance-curve models:** explicit forward variance dynamics addressing Chapter 8’s desiderata (level-dependent skew, realistic spot–vol covariance).
- **LVSV / stochastic-local-vol:** hybrid to match vanillas (via LV) and dynamics (via SV)—direct response to Chapters 4 and 8–10.
- **VIX options and volatility-of-volatility markets:** Chapter 11’s variance-call technology became a full listed complex.
- **SABR extensions** with mean reversion and arbitrage-free PDEs repair long-expiry SABR issues noted in Chapter 7.
- **Arbitrage-free SVI (Gatheral–Jacquier):** strengthens Chapter 3’s SVI practice.

These do not obsolete the book; they are evolutions of its agenda.

---

## Risk Inventory: Where Money Is Made and Lost

| Product | Primary risk | Model that fails | Typical loss mode |
|---------|--------------|------------------|-------------------|
| Vanilla book | Spot, vol level | Mild | Mis-hedged vanna/volga |
| Variance swap | Realized QV vs strip | Jumps / discrete sampling | Jump days, settlement quirks |
| Vol swap | Convexity vs variance | Wrong vol-of-vol | Quiet realized vs priced convexity |
| Digital | Skew | Ignoring $\partial_K\sigma$ | 10%+ notional |
| Digital cliquet | Forward skew | LV | Multi-year accrual of skew error |
| LC/GF cliquet | Forward skew | LV underprice | Won deal on LV, lost on hedges |
| Napoleon | Vol convexity & cross | Independent-increment | Underpriced volga |
| Reverse cliquet | Mild skew + floor | Usually small gap | Directional on underlier |
| KO / one-touch | Path + dynamics | LV or wrong SV | Barrier wars, greeks blowout |
| Capital-structure | Jump to default | Diffusion Merton only | Gap risk on default night |

---

## Glossary of Symbols (book conventions)

| Symbol | Meaning |
|--------|---------|
| $S_t, F_{t,T}$ | Spot; $T$-forward |
| $v_t,\bar v,v_0$ | Instantaneous variance; long-run; initial |
| $\lambda,\eta,\rho$ | Mean-reversion; vol-of-vol; correlation |
| $w=\sigma_{\mathrm{BS}}^2 T$ | Total implied variance |
| $y,k$ | Log-strike vs forward |
| $v_L,\sigma_L$ | Local variance / vol |
| $\phi_T(u)$ | Characteristic function |
| $\mu_J$ | Jump compensator |
| $\alpha,\delta,\lambda_J$ | Jump mean, jump vol, intensity |
| $\beta(v)$ | Variance diffusion elasticity |
| $\chi$ | SABR vol-of-vol |
| $W_T=\langle x\rangle_T$ | Quadratic variation of $x=\log S$ |

---

## Teaching / Study Path Recommendations

1. Re-derive (1.12) and (3.5) without looking; if you can, you understand half the book.
2. Code Heston CF + Lewis integrator; calibrate to a single SPX surface dump.
3. Code Dupire from SVI slices; plot $v_L$.
4. Monte Carlo HN vs LV Europeans (should match) then one-touch (should not).
5. Replicate Table 5.1’s impossibility under Normal; size the jump intensity that makes the 1160 put worth 0.05.
6. Build a variance strip and compare to a broker variance mid.
7. Write a one-page model-risk memo on a Napoleon using Chapter 10’s moral.

---

## Comprehensive Limitations Checklist (expanded)

1. Equity-index focus (SPX); FX/rates/commodities need different skew folklore (RR/BF, SABR$\beta$, seasonality).
2. Zero rates/dividends in pedagogy—production must use forwards, discrete dividends, borrow.
3. No funding / CVA / FVA—post-2008 necessary overlays.
4. No multi-asset correlation smile (basket Napoleons need it).
5. Limited treatment of rough paths / microstructure noise in realized variance.
6. American early exercise absent (OK for SPX Europeans).
7. Calibration uniqueness not guaranteed; multiple $(\eta,\rho,\lambda)$ can fit similarly.
8. Jump risk premia unidentified from vanillas alone without time-series or CDS.
9. Discrete variance contract definitions vs continuous theory.
10. Operational barriers (exchanges, auto-exercise, unusual settlement) omitted.

---

## Practical Takeaways — Expanded Playbook for Portfolio Construction

1. **Surface as budget constraint:** Treat the options surface as a hard relative-value budget. Every exotic mid must be consistent with a replicating or bounding portfolio of vanillas when such exists (variance, Europeans, some barriers via static hedges).

2. **Two-model minimum:** Never approve an exotic with material forward-skew or volga without LV and SV(J) marks and an explained gap.

3. **Prefer variance to fragile vol views:** If the investment thesis is “realized vol high/low,” prefer variance swaps or log-strip overlays to selling/buying options that entangle spot path and smile dynamics.

4. **Short-dated wings = crash budget:** Size tail hedges off Table 5.1-style tapes and CDS, not off Heston.

5. **Cliquets are not “coupons”:** They are packages of forward-starting smile exposures. Risk them like options, not like fixed income.

6. **Parameter hedges:** Hold a small book of vanillas that spans $\partial/\partial\eta$ and $\partial/\partial\rho$ if running SV exotics.

7. **Lee discipline:** Any automated wing fitter used in overnight variance marks must be Lee-consistent; unconstrained polynomials blow up strips.

8. **Discrete monitoring:** Never confuse exchange barriers with continuous PDE values.

9. **Credit–equity unity:** OTM puts and CDS are cousins; capital-structure trades need joint shocks.

10. **Humility on Napoleons:** If the payoff is a nonlinear functional of the worst return, trust stress over intuition.

---

## Word-Intensive Worked Derivation: Fair Variance from Scratch

Assume $r=q=0$, $F=S_0$, diffusion $dS=\sigma_t S\,dZ$. Ito:

$$
d\log S=\frac{dS}{S}-\frac12\sigma_t^2\,dt.
$$

Integrate $0\to T$:

$$
\log\frac{S_T}{S_0}=\int_0^T\frac{dS_t}{S_t}-\frac12\int_0^T\sigma_t^2\,dt.
$$

Rearrange:

$$
\int_0^T\sigma_t^2\,dt=2\int_0^T\frac{dS_t}{S_t}-2\log\frac{S_T}{S_0}.
$$

Take $E[\,\cdot\,]$. The stochastic integral is a martingale under Novikov-type conditions ⇒ expectation 0. Thus

$$
E\Bigl[\int_0^T\sigma_t^2\,dt\Bigr]=-2E\bigl[\log(S_T/S_0)\bigr].
$$

Now span the log payoff via (11.1) with $g(s)=\log(s/S_0)$, $g''(s)=-1/s^2$:

$$
E[\log(S_T/S_0)]=-\int_0^{S_0}\frac{\tilde P(K)}{K^2}\,dK-\int_{S_0}^\infty\frac{\tilde C(K)}{K^2}\,dK.
$$

Combine to obtain (11.4). Annualize by $1/T$. This is the theoretical fair variance strike (diffusion case). Contractual realized variance replaces the left-hand side by a discrete sum of squared log returns; the difference is a discretization + jump residual shared between dealer and client per term sheet.

---

## Word-Intensive Worked Derivation: Short-Dated Digital with Skew

Let $C(K)=C_{\mathrm{BS}}(K,\sigma(K))$. Digital call (cash-or-nothing paying $1_{\{S_T>K\}}$ in the undiscounted $r=0$ world) equals $-\partial_K C$. Then

$$
-\partial_K C=-\partial_K C_{\mathrm{BS}}-\partial_\sigma C_{\mathrm{BS}}\cdot\sigma'(K).
$$

$\partial_K C_{\mathrm{BS}}=-e^{-qT}N(d_2)$ (with $q=0$, $=-N(d_2)$). Vega $\partial_\sigma C_{\mathrm{BS}}=S\sqrt{T}\,n(d_1)$. At ATM forward, $K=S$, $\sigma=0.25$, $T=1$, $d_1=\sigma\sqrt{T}/2=0.125$, $d_2=-0.125$, $N(-d_2)=N(0.125)\approx0.5497$ so Black digital ≈0.55. Skew $\sigma'(K)$ with “3% per 10%” means $\Delta\sigma=-0.03$ when $\Delta K/K=+0.10$, so $\partial\log K\sigma\approx-0.30$, hence $\partial_K\sigma\approx-0.30/K$. Then skew term $\approx -(\mathrm{vega})\times(-0.30/K)$. With $S=K=1$ normalized, vega$\approx n(d_1)\approx0.395$, skew term$\approx0.395\times0.30\approx0.119$. Total digital≈0.55+0.12=0.67 vs 0.55 flat—**relative error ~22% on the digital probability, ~12 points of notional**, matching Gatheral’s warning.

---

## Closing Note on Taleb’s Foreword and Epistemology

Taleb’s foreword frames Gatheral as a trader-quant who rejects business-school “models as true statistical maps.” Consistency across instruments is the golden rule: a digital of one expiry must cohere with calls of another. Power-law tails can be grafted by lifting OTM vols appropriately—compatible with Gatheral’s surface-centric view. This epistemology reappears in Chapter 11’s model-independent variance strip and in Chapter 10’s insistence on stressing modeling assumptions themselves. For Giuseppe Paleologo’s library notes: file this book under **relative pricing + dynamics discipline**, adjacent to optimization and microstructure texts that similarly privilege constraints over narratives.



---

## Appendix — Chapter-Mapped Equation Index with Commentary

**Ch.1** (1.3) valuation PDE with market price of vol risk; (1.4) Dupire PDE; (1.6) local var from calls; (1.7) BS in $(y,w)$; (1.9) BS greek identities; (1.10) local var from implied total var; (1.11) forward SDE; (1.12) local var as conditional expectation — the spine.

**Ch.2** (2.1)–(2.2) Heston SDEs; (2.3) Heston PDE; (2.4) simplified FV PDE; (2.5) $C=K(e^x P_1-P_0)$; (2.6) PDE for $P_j$; (2.7) Heaviside terminal; (2.8)–(2.10) Fourier / Riccati setup; (2.13) pricing integral (branch issues); (2.15) CF form used later.

**Ch.3** (3.1)–(3.2) forward implied variance definition; (3.3) pathwise Ito; (3.4)–(3.6) implied var as gamma-weighted expectation; (3.7)–(3.8) local-var mixture; (3.9)–(3.11) most-probable-path approximation; (3.12)–(3.14) Heston conditional variance ODE; (3.18)/(3.21) ATM var & skew approximations fitted in Figs. 3.4–3.5.

**Ch.4** (4.1) HN local variance closed form; (4.2) toy parameters; (4.3) Dupire ratio computation of local var from CF densities.

**Ch.5** (5.1) JD SDE; (5.2)–(5.3) PIDE; (5.4) Lévy–Khintchine; (5.5) Merton CF; (5.6) Lewis call formula; (5.7) IV–CF identity; (5.8) ATM skew from CF; (5.9)–(5.10) short-$T$ JD expansion.

**Ch.6** Merton ruin; CreditGrades survival & equity vol links; Tables 6.1–6.2 bounds and GT case.

**Ch.7** (7.1) generic SV; (7.3)/(7.5)–(7.6) Medvedev–Scaillet; (7.7) SABR $\beta=1$; (7.8)–(7.9) jumps in short asymptotics; (7.10) FPS long skew; (7.11) universal interpolation; (7.12) Lewis small-$\eta$; (7.13)–(7.14) Benaim–Friz wing limits; Lee $g(x)$.

**Ch.8** Empirical $\partial_k\sigma$ level-independence ⇒ $\beta(v)\sim\sqrt{v}$; LV forward-flat argument; (8.1) digital as $-\partial_K C$; cliquet definition and 5.76% notional error budget.

**Ch.9** Reflection, put-call symmetry, quasi-static hedges; (9.2) discrete lookback adjustment; BGK barrier shift $\beta\approx0.5826$; Parisian windows; ladders/ranges.

**Ch.10** Mediobanca payoffs; HN vs LV Monte Carlo; Tables 10.1–10.2; independent-increment critique.

**Ch.11** (11.1) Carr–Madan spanning; (11.2) log strip; (11.3) Ito decomposition; (11.4) fair variance; (11.5) IV-integral form; Heston $E[W_T]$; vol-swap convexity; VIX/VXB.

---

## Appendix — Suggested Replication Code Outline (pseudo)

```
# 1. CF
def heston_cf(u, tau, v0, vbar, lam, eta, rho):
    # implement C, D with continuous complex log
    ...
def lewis_call(S, K, T, cf_fn):
    # integrate Re[exp(-iuk)*cf(u-i/2)]/(u^2+1/4)
    ...

# 2. Calibration
def cal_heston(surface):
    # least squares on IVs, L-BFGS-B with bounds
    ...

# 3. Local vol
def dupire_local_var(w_surface):
    # finite differences for (1.10)
    ...

# 4. Exotics
def mc_heston_nandi(paths, params):
    ...
def payoff_napoleon(monthly_returns, max_coupon=0.10):
    worst = monthly_returns.min(axis=1)
    return np.maximum(0, max_coupon + worst)

# 5. Variance strip
def fair_variance(puts, calls, F, T):
    # integrate OTM prices / K^2
    ...
```

Production code should add unit tests: put-call parity, BS limit $\eta\to0$, variance strip vs Heston $E[W_T]$, and BGK shift monotonicity.

---

## Appendix — Comparison Matrix: Modeling Choices vs Product Types

|  | Vanilla European | Variance swap | Vol swap | Digital | Digital cliquet | LC/GF cliquet | Napoleon | KO / one-touch | Lookback |
|--|------------------|---------------|----------|---------|-----------------|---------------|----------|----------------|----------|
| BS flat | OK if ATM only | Bias | Bias | Skew miss | Bad | Bad | Bad | Bad | Bad |
| LV Dupire | Exact fit | Exact (diff.) | Convexity miss | OK today | Forward skew die | Underprice | Uncertain | Path miss | Path miss |
| Heston | Long OK | Exact (diff.) | Needs adj. | OK if skew OK | Better | Better | Uncertain | Better | Better |
| SVJ | Best full surface | Jump residual | Jump residual | Good | Good | Good | Stress | Good | Good |
| SABR slice | Short fit | N/A dyn | N/A | Short OK | Poor dyn | Poor dyn | Poor | Short only | Short only |

---

## Appendix — Historical Market Episodes Tied to the Text

- **1987 crash (−22.9%):** Figs. 1.1–1.3; birth of persistent OTM put premium.
- **LTCM 1998:** Chapter 11 — variance swap market expansion; HFs sold high implied variance.
- **2000–2005 Mediobanca structures:** Chapter 10 — telecom reverse cliquet through the bubble unwind; Napoleons and LC/GF in low-yield EUR retail.
- **Sep 2005 triple witching tape:** Chapters 3 & 5 empirical backbone.
- **Oct 2004 GT options:** Chapter 6 single-name credit–equity.
- **Dec 2004 VXB:** Chapter 11 convexity table.

---

## Final Synthesis Paragraph for Library Cataloguing

Jim Gatheral’s *The Volatility Surface* (Wiley Finance, 2006), with a foreword by Nassim Taleb, remains the canonical practitioner monograph linking Dupire local volatility, Heston/SVJ stochastic volatility, jump asymptotics, barrier and cliquet model risk, and model-independent variance replication. Its enduring quantitative contributions are: (i) local variance as $E[v_T|S_T=K]$; (ii) implied variance as a gamma-weighted path average of instantaneous variance; (iii) the demonstration that Heston fits the SPX surface’s back but not its front (fit $v_0=0.0174,\bar v=0.0354,\eta=0.3877,\rho=-0.7165,\lambda=1.3253$ on 2005-09-15); (iv) SVJ as the pragmatic surface model; (v) the Heston–Nandi twin-laboratory showing LV≈SV on vanillas yet divergent on exotics; (vi) Mediobanca case studies with explicit coupon gaps (e.g., 3.53% vs 2.55% expected coupons); and (vii) the log-contract variance strip. For a quantitative investor, the book is less a forecasting manual than a **discipline of consistency and dynamics**, mandatory reading before allocating risk to any forward-skew-sensitive structured product.



---

## Catalog Metadata for Paleologo Finance Library

- **Primary tags:** equity derivatives, stochastic volatility, local volatility, jumps, variance swaps, exotic options, model risk
- **Secondary tags:** Heston, SVJ, SABR, SVI, Dupire, Mediobanca cliquets, VIX
- **Prerequisites:** Black–Scholes, basic SDEs, Fourier transforms
- **Pairs well with:** Bergomi *Stochastic Volatility Modeling*; Lewis *Option Valuation under Stochastic Volatility*; Gatheral later papers on rough vol and arbitrage-free SVI; Wilmott on barriers; Demeterfi et al. variance-swap notes
- **Reading time:** 2–3 full days for a working quant to re-derive core identities and code the CF+Dupire+variance-strip stack
- **One-line verdict:** The indispensable relative-pricing and dynamics manual for anyone who marks or hedges equity volatility surfaces and exotics.

**Document control:** Summary generated for Giuseppe Paleologo finance-library batch; source PDF basename retained in filename for Drive lineage; quantitative claims cross-checked against extracted PDF text (TOC, Tables 3.2/5.1/5.2/10.1/10.2, Heston–Nandi parameters, Mediobanca ISINs, and Chapter 11 variance identities).
