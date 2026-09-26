# 1. Metadata

- **Title:** A Preference Foundation for Log Mean-Variance Criteria in Portfolio Choice Problems
- **Author(s):** David G. Luenberger
- **Year:** 1993
- **Journal/Venue:** *Journal of Economic Dynamics and Control*

# 2. Problem statement

The paper asks a foundational question: **can the log-mean and log-mean-variance criteria used in long-run portfolio choice be derived from coherent asymptotic preferences, rather than treated as ad hoc approximations to expected utility?** The object is wealth over an infinite sequence of returns, and the goal is to characterize tail preference functionals over wealth paths.

# 3. Approach (short)

The method is preference theory on infinite-horizon wealth sequences. Luenberger abandons standard terminal-wealth expected utility and instead studies tail utility functions that evaluate the asymptotic behavior of the wealth process. He proves that a broad class of “simple” asymptotic utility criteria collapses to the mean logarithmic growth rate, and that broader “compound” criteria reduce to monotone transforms of a log mean-variance object. The techniques are functional and asymptotic, not dynamic programming.

# 4. Approach (detailed)

1. **Wealth paths and tail preferences**

   Let $W_n$ denote wealth after $n$ periods. The object of choice is the entire path $(W_1,W_2,\dots)$. A **tail preference** depends only on sufficiently far-out behavior of the sequence. This is the right domain for long-run portfolio choice, because finite prefixes of the wealth path should not determine asymptotic preference.

2. **Simple tail utility functions**

   The paper studies utility functionals of the form
   $$
   U(W)=\lim_{n\to\infty} p(W_n,n),
   $$
   where $p(\cdot,n)$ is increasing in wealth and satisfies regularity conditions. Luenberger’s core theorem shows that, under mild growth conditions, any nontrivial real-valued simple tail utility is equivalent, up to monotone transformation, to the mean logarithmic growth rate
   $$
   m = \lim_{n\to\infty}\frac{1}{n}\log W_n.
   $$

3. **Why the logarithm appears**

   Multiplicative wealth accumulation makes $\log W_n$ additive:
   $$
   \log W_n = \sum_{t=1}^n \log R_t.
   $$
   Any asymptotic criterion that is stable under scaling and depends only on tail behavior is therefore forced toward growth-rate comparisons. The proof uses the structure of tail events and regularity restrictions on $p(z,n)$ to rule out other stable real-valued representations.

4. **Compound utility functions**

   The paper then considers richer criteria that depend on the simple growth rate $m$ and additional asymptotic fluctuation information. Under suitable regularity, these compound utilities reduce to monotone transforms of a **log mean-variance** criterion:
   $$
   U(W)\sim \Phi\!\left(m - \frac{\kappa}{2}v\right),
   $$
   where $v$ is an asymptotic variance-type measure of log wealth and $\Phi$ is increasing.

5. **Implication for portfolio choice**

   If investors have such asymptotic preferences, then portfolio choice can be posed over the frontier in $(m,v)$-space: expected log growth versus variance of log growth. This is the paper’s foundational justification for “log mean-variance” analysis.

6. **Proof sketch of the main theorem**

   The rough proof strategy is:

   - define preferences on deterministic sequences first, then extend them to stochastic wealth paths through almost-sure association;
   - exploit the tail-property restriction to show only asymptotic growth characteristics matter;
   - impose continuity and monotonicity on $p(z,n)$;
   - show these conditions force any simple utility to rank paths by $m=\lim n^{-1}\log W_n$;
   - for compound criteria, show any extra admissible dependence enters through second-order asymptotic fluctuation terms, giving the log mean-variance representation.

   The result is exact as a representation theorem given the paper’s utility-class assumptions; the approximation enters only in interpreting $v$ as a familiar variance proxy.

7. **What is novel**

   The novelty is not a new portfolio optimizer but a preference-theoretic justification. Luenberger’s point is that log mean-variance criteria are not merely rough stand-ins for expected utility; under asymptotic tail preferences they can be the correct primitives.

# 5. Domain of applicability

- The theory applies to **long-run, infinite-horizon portfolio choice** where asymptotic path behavior is the relevant object.
- It does not apply directly to short-horizon utility maximization or to finite-horizon expected-utility problems.
- The conclusions depend on the specific class of admissible tail utility functions. If one rejects tail-based asymptotic preference as the primitive, the representation loses force.
- Within that domain, the support for log-growth and log mean-variance criteria is much stronger than the usual heuristic CLT argument.
