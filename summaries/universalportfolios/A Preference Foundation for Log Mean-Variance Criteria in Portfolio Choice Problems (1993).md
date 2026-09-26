# A Preference Foundation for Log Mean-Variance Criteria in Portfolio Choice Problems

**Authors:** David G. Luenberger  
**Year:** 1993  
**Journal/Venue:** Journal of Economic Dynamics and Control 17, 887--906

## Problem statement

The criterion $\mathrm{E}\log W_n$ (expected log of terminal wealth) is known to yield maximal exponential growth rate and is widely used in infinite-horizon portfolio theory, yet it lacks a rigorous preference-theoretic foundation from first principles. The log mean-variance efficient frontier -- trading off $\mathrm{E}\log W_n$ against $\mathrm{var}(\log W_n)$ -- is intuitively appealing but not derivable from von Neumann-Morgenstern expected utility. Prior attempts to justify it via central-limit-theorem arguments or $n \to \infty$ limits on $\mathrm{E}\,U(W_n)$ were shown by Merton and Samuelson (1974) to be fallacious once proper normalization is accounted for. The paper asks: under what preference axioms does the log mean-variance criterion emerge as the *exact* asymptotic representation of rational choice over infinite wealth sequences?

## Approach (short)

Luenberger sidesteps the $\mathrm{E}\,U(W_n)$ limit problem entirely by defining preferences directly on infinite deterministic wealth sequences via their *tails*, extending these to stochastic processes by almost-sure association. He shows that any "simple" tail utility function reduces, up to monotone transformation, to $\mathrm{E}\log X_1$. Introducing "compound" utility functions that subtract the mean before taking limits, he proves the asymptotic utility depends only on $(m, \sigma)$ where $m = \mathrm{E}\log X_1$ and $\sigma^2 = \mathrm{var}(\log X_1)$, thereby deriving the log mean-variance frontier from preference axioms rather than imposing it ad hoc.

## Approach (detailed)

**1. Investment environment.**
$S$ securities with i.i.d. nonnegative return vectors $Z_k = (Z_{1k}, \ldots, Z_{Sk})$. A stationary policy $\alpha$ yields one-period gross return $X_k = \alpha \cdot Z_k$ and wealth

$$W_n = \prod_{k=1}^{n} X_k, \qquad W_0 = 1.$$

Standing assumptions (A.1--A.2): $Z_k$ i.i.d., bounded, $\alpha$ constant and bounded, $\log X_k$ has finite first and second moments.

**2. Asymptotic growth.**
By the strong law of large numbers,

$$\frac{1}{n}\log W_n = \frac{1}{n}\sum_{k=1}^n \log X_k \;\xrightarrow{\text{a.s.}}\; m \coloneqq \mathrm{E}\log X_1.$$

Hence $W_n \approx \exp(n\,m)$, motivating the max $\mathrm{E}\log X_1$ criterion. But this is not derived from expected utility.

**3. Tail preferences on deterministic sequences.**
Let $\Gamma$ be the set of nonneg, exponentially bounded sequences. A preference $\succsim$ on $\Gamma \times \Gamma$ satisfies:

- (P.1--P.3) Completeness, reflexivity, transitivity.
- (P.4) **Tail property**: $w \succsim v$ depends only on the tail -- altering finitely many elements does not change the ranking.

Examples of such preferences include $\overline{\lim}\,\frac{1}{n}\log w_n \geq \overline{\lim}\,\frac{1}{n}\log v_n$ and variants using $\frac{1}{n^2}\sum \log w_k$.

**4. Extension to stochastic processes (Theorem 1).**
Add (P.5) measurability. Define stochastic preference by almost-sure association:

$$W \succsim_s V \;\;\text{if}\;\; P\{W \succsim V\} = 1.$$

By the Hewitt-Savage zero-one law, every tail event on the i.i.d. process $(X_k, Y_k)$ has probability 0 or 1. Therefore $\succsim_s$ is complete, reflexive, and transitive -- *without* imposing von Neumann-Morgenstern axioms. This is the key structural insight: the zero-one law does the work that expected utility axioms usually perform.

**5. Tail utility functions.**
A utility $U: \Gamma \to \mathbb{R}$ is a *tail utility* if $U(w) = U(\bar{w})$ whenever $w, \bar{w}$ differ in finitely many elements.

*Simple utility functions* have the form

$$U(W) = \overline{\lim}_{n\to\infty}\; \rho(\log W_n,\, n), \tag{$*$}$$

where $\rho(z, n)$ is continuous and increasing in $z$ for each $n$, with $\rho(0, n) = 0$. By the zero-one law, if $U(W)$ is finite, it is a.s. constant.

**6. Simple utilities reduce to $\mathrm{E}\log X_1$ (Theorem 2).**
Let $m = \mathrm{E}\log X_1$. Two cases:

- (a) If $\overline{\lim}_{n\to\infty} \rho(nz, n) = \mathrm{sgn}(z)\cdot\infty$, then $U(W) = +\infty$ for $m > 0$, $-\infty$ for $m < 0$ (degenerate).
- (b) If $\overline{\lim}_{n\to\infty} \rho(nz, n) = g(z)$ with $g$ continuous, then $U(W) = g(m)$.

In either case, to within a monotone transformation, the only real-valued simple tail utility is $m = \mathrm{E}\log X_1$. Proof uses the strong law: $\frac{1}{n}\log W_n \to m$ a.s., so $\rho(\log W_n, n) = \rho(n \cdot \frac{1}{n}\log W_n, n) \to g(m)$.

**7. Compound utility functions.**
To go beyond the degenerate simple case, subtract the mean:

$$U(W) = \overline{\lim}_{n\to\infty}\;\phi(\log W_n - nm,\, n) \quad \text{a.s.},$$

where $\phi(z, n)$ is continuous and increasing in $z$, $\phi(0, n) = 0$. The argument for $m = 0$ now centers on the law of the iterated logarithm rather than the SLLN: $\overline{\lim}\;\frac{\log W_n}{\sigma\sqrt{2n\log\log n}} = 1$ a.s. The critical object is the asymptotic behavior of $\phi(\sqrt{n}\,z, n)$.

**8. Compound utilities depend only on $\sigma$ (Proposition 1).**
Assume $\phi(\sqrt{n}\,z, n)$ is *decreasing with respect to $n$ above* a constant $A$ (a regularity condition ensuring the limit captures volatility correctly). Then for any process with $m = \mathrm{E}\log X_1 = 0$ and $\sigma^2 = \mathrm{var}(\log X_1) > 0$:

$$U(W) = h(\sigma),$$

where $h$ is nondecreasing. This is *exact*, not approximate. The proof uses the extended law of the iterated logarithm (Feller 1943, Breiman 1968) to connect the convergence of the series $\sum \frac{y_n}{n} e^{-y_n^2/2}$ (where $y_n = f(r,n)/(\sigma\sqrt{n})$) to the threshold $\sigma$.

For utility with $\underline{\lim}$ instead of $\overline{\lim}$, the symmetric result (Proposition 2) gives $U(W) = g(\sigma)$ with $g$ *nonincreasing* -- the investor is variance-averse.

**9. Full log mean-variance representation (Theorem 3).**
Reintroducing dependence on $m$: let $\psi(z, m, n)$ be continuous, increasing in $z$ and $m$. If for each fixed $m$, $\phi_m(z,n) \coloneqq \psi(z, m, n)$ satisfies the conditions of Propositions 1 or 2, then there exists $f: \mathbb{R} \times \mathbb{R}_+ \to \mathbb{R} \cup \{\pm\infty\}$ such that:

- $f(m, \sigma)$ is increasing in $m$;
- $f(m, \sigma)$ is either increasing or decreasing in $\sigma$ (depending on $\overline{\lim}$ vs $\underline{\lim}$);
- For *any* process satisfying (A.2) with $m = \mathrm{E}\log X_1$ and $\sigma^2 = \mathrm{var}(\log X_1)$:

$$U(W) = f(m, \sigma).$$

This is the log mean-variance criterion derived purely from tail preferences.

**10. Efficient frontier.**
The set of attainable $(m, \sigma)$ pairs across feasible policies defines a region $S$. The *right frontier* (largest $\sigma$ for given $m$) is selected by $\overline{\lim}$-type investors; the *left frontier* (smallest $\sigma$) by $\underline{\lim}$-type investors. This parallels exactly the classical Markowitz efficient frontier, but in the space $(\mathrm{E}\log X_1,\; \sqrt{\mathrm{var}(\log X_1)})$.

## Domain of applicability

- **Stationary environment only.** Returns must be i.i.d. (or at least stationary ergodic for the SLLN/LIL arguments to carry through). Time-varying opportunity sets or regime changes are outside scope.
- **Constant (fixed-mix) policies.** The analysis restricts to policies $\alpha_k = \alpha$ for all $k$. Adaptive or state-dependent strategies are excluded.
- **Long-only, bounded portfolios.** Short sales are excluded ($\alpha: \mathbb{R}_+^S \to \mathbb{R}_+$), and portfolio weights are uniformly bounded.
- **Infinite horizon, no intermediate consumption.** The entire framework is about terminal wealth accumulation; withdrawals can be embedded by redefining the return, but the preference structure is purely on the growth path.
- **Tail preferences only.** The axioms capture investors who care *only* about long-run asymptotic behavior. Any finite-horizon or transient consideration is invisible to this framework.
- **Finite second moments required.** $\mathrm{var}(\log X_1) < \infty$ is needed for the LIL-based arguments. Heavy-tailed log-returns with infinite variance break the compound-utility results.
- **Regularity on $\phi$.** The "decreasing with respect to $n$ above $A$" condition on $\phi(\sqrt{n}\,z, n)$ is a technical requirement that rules out certain pathological utility specifications. It is satisfied by standard forms (e.g., $\phi(z,n) = z/(2n\log\log n)^{1/2}$) but must be verified case by case.
- **Not a normative recommendation.** The paper provides a preference *foundation* for the log mean-variance criterion, not a claim that investors should adopt it. The Merton-Samuelson critique (that maximizing $\mathrm{E}\log W_n$ is not universally optimal) remains valid for finite horizons.
