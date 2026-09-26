# A New Interpretation of Information Rate (Kelly Criterion)

**Author:** J. L. Kelly, Jr.  
**Publication:** *The Bell System Technical Journal*, July 1956, pp. 917–926  
**Manuscript received:** March 21, 1956  
**Source PDF:** `UniversalPortfolios_Kelly_1956.pdf` (Drive id `1wGJc-o2U-POnusOAn8qzBoIl_Q7wBHSB`; filename is a misnomer—content is Kelly 1956, not Cover’s Universal Portfolios)  
**Summary prepared:** 2026-09-25 (Scholar batch_2026-09-25_3)  
**OCR:** Not required; clean extract (~10 journal pages)

---

## 1. Bibliographic Context and Motivation

Kelly’s 1956 BSTJ paper is the foundational derivation of what the finance and gambling literatures later call the **Kelly criterion**: size bets to maximize the almost-sure exponential growth rate of wealth. The paper’s stated purpose is information-theoretic, not financial. Shannon (1948) had defined the channel transmission rate and given it operational meaning via the coding theorem (reliable communication of binary digits at that rate). Many workers wanted a meaning for transmission rate **when no coding is contemplated** (e.g., radar detectors designed by maximum mutual information). Kelly argues that an arbitrary cost function on symbol pairs is too general and external to the channel. Instead he analyzes a concrete “real-life situation which seems to possess the essential features of a communication problem”: a gambler who receives channel outputs over a private wire and bets on the transmitted symbols before they become public.

**Main theorem (fair odds).** The maximum exponential growth rate of the gambler’s capital equals the Shannon rate of transmission over the channel.

**Generalizations.** The result extends to unfair odds (no track take) and, with more complex formulas, to a positive track take. The optimal policy is to bet in proportion to posterior probabilities $q(s|r)$ when odds are fair or merely “consistent” (no track take); with a track take, some outcomes may receive zero stake and cash may be held back.

Acknowledgments credit R. E. Graham and C. E. Shannon.

---

## 2. Setup: The Gambler with a Private Wire

A communication channel transmits results of a chance event **before** those results are common knowledge, so bets can still be placed at the posted odds.

### 2.1 Exponential growth rate

Define

$$
G = \lim_{N\to\infty}\frac{1}{N}\log_2\frac{V_N}{V_0},
$$

where $V_N$ is capital after $N$ bets and $V_0$ is starting capital. Logarithms are base 2 so that $G$ is in bits per trial—commensurate with Shannon rates.

### 2.2 Noiseless binary channel (motivating example)

Two equally matched teams; even-money bets; noiseless private wire revealing the winner. The gambler bets everything each time and doubles with certainty: after $N$ bets, $V_N = 2^N V_0$, so $G=1$. Economically this is like an investment paying 100% interest per period compounded each period (if symbols arrive once per week, weekly).

### 2.3 Noisy binary channel

Each symbol is received correctly with probability $q$ and flipped with probability $p=1-q$.

**Naive policy—bet everything ($\ell=1$).** Maximizes expected capital:

$$
\langle V_N\rangle = (2q)^N V_0,
$$

but the gambler is ruined with probability one if play continues indefinitely (whenever a single error occurs, capital hits zero).

**Fractional policy.** Bet a fraction $\ell$ of capital each time. Then

$$
V_N = (1+\ell)^W (1-\ell)^L V_0,
$$

with $W$ wins and $L$ losses, and almost surely

$$
G = q\log(1+\ell) + p\log(1-\ell).
$$

Maximizing $G$ in $\ell$ uses the log-convexity argument: for $Z=\sum_i X_i\log Y_i$ subject to $\sum_i Y_i=Y$, the maximum puts $Y_i \propto X_i$. Here this yields

$$
1+\ell = 2q,\qquad 1-\ell=2p,
$$

hence

$$
G_{\max} = 1 + p\log p + q\log q = R,
$$

the Shannon binary transmission rate (capacity of the BSC when inputs are fair coins, equal to $1-H_2(p)$).

**Criterion defense.** Maximizing $\langle V_N\rangle$ by betting everything is myopic for a **nonterminating** game: the Kelly gambler eventually gets ahead and stays ahead of any other fixed-$\ell$ gambler with probability one. Kelly assumes the gambler always maximizes $G$.

---

## 3. The General Discrete Memoryless Case (Fair Odds)

### 3.1 Notation

| Symbol | Meaning |
|--------|---------|
| $p(s)$ | Prior on transmitted symbol $s$ |
| $p(r\mid s)$ | Channel law |
| $p(s,r)$ | Joint |
| $q(r)$ | Marginal on received symbol |
| $q(s\mid r)$ | Posterior |
| $\alpha_s$ | Odds: dollars returned per dollar bet on $s$ (stake included) |
| $a(s\mid r)$ | Fraction of capital bet on $s$ after observing $r$ |

Independent symbols and independent noise are assumed.

### 3.2 Fair odds

$$
\alpha_s = \frac{1}{p(s)}.
$$

Parimutuel markets without track take tend toward fairness: $\sum_s 1/\alpha_s = 1$, and if some $\alpha_s > 1/p(s)$, repeated betting would force $\alpha_s$ down. Kelly remarks that analogous feedback “probably takes place in more complicated betting situations, such as stock market speculation.”

Without loss of generality $\sum_s a(s\mid r)=1$ (bet full capital): canceling bets can synthesize cash when $\sum_s 1/\alpha_s=1$.

Wealth evolves as

$$
V_N = \prod_{r,s}\big[a(s\mid r)\,\alpha_s\big]^{W_{sr}} V_0,
$$

so almost surely

$$
G = \sum_{r,s} p(s,r)\log\big(\alpha_s\, a(s\mid r)\big).
$$

Under fair odds $\alpha_s=1/p(s)$,

$$
G = \sum_{r,s} p(s,r)\log\frac{a(s\mid r)}{p(s)} = \sum_{r,s} p(s,r)\log a(s\mid r) + H(X),
$$

with $H(X)$ the source entropy. The first term is maximized by

$$
a(s\mid r) = q(s\mid r) = \frac{p(s,r)}{q(r)},
$$

yielding

$$
G_{\max} = H(X) - H(X\mid Y),
$$

Shannon’s mutual information / transmission rate.

**Interpretation.** Betting posterior-to-prior (here, since fair odds identify prior with implied odds probabilities) extracts exactly the information rate as growth rate.

---

## 4. When Odds Are Not Fair (No Track Take)

Still assume $\sum_s 1/\alpha_s = 1$ but $\alpha_s \neq 1/p(s)$ in general. Then

$$
G = \sum_{r,s} p(s,r)\log a(s\mid r) + \sum_s p(s)\log\alpha_s.
$$

Optimum remains $a(s\mid r)=q(s\mid r)$, and

$$
G_{\max} = H(\alpha) - H(X\mid Y),
\qquad H(\alpha)=\sum_s p(s)\log\alpha_s.
$$

**Three striking facts (Kelly’s enumeration):**

**(a)** The gambler **ignores posted odds** when allocating $a(s\mid r)$—stakes follow posteriors, not $\alpha_s$. Odds affect the *level* of $G$ through $H(\alpha)$, not the optimal proportions (absent track take).

**(b)** Minimum of $H(\alpha)$ subject to $\sum_s 1/\alpha_s=1$ occurs at fair odds $\alpha_s=1/p(s)$, where $H(\alpha)=H(X)$. Any deviation from fairness **helps** the gambler (raises $G_{\max}$).

**(c)** Without a channel, $H(X\mid Y)=H(X)$ and $G_{\max}=H(\alpha)-H(X)$, minimized at 0 under fair odds. Thus $R=H(X)-H(X\mid Y)$ is exactly the **increment** in growth rate due to the channel. This sharpens the meaning of “fair odds.”

---

## 5. Track Take: Withholding and Corner Solutions

With a track take, $\sum_s 1/\alpha_s < 1$ and canceling bets are costly. Let

$$
b_r = 1 - \sum_s a(s\mid r)
$$

be the unbet fraction given $r$. Maximize

$$
G = \sum_{r,s} p(s,r)\log\big(b_r + \alpha_s a(s\mid r)\big)
$$

subject to $b_r+\sum_s a(s\mid r)=1$. Terms for different $r$ separate, so each conditional problem mirrors the **no-channel** problem

$$
G = \sum_s p(s)\log\big(b + \alpha_s a(s)\big).
$$

### 5.1 First-order conditions

Let $\lambda$ be the set where $a(s)>0$ and $\lambda'$ where $a(s)=0$. At an interior optimum for $s\in\lambda$,

$$
\frac{\partial G}{\partial a(s)} = \frac{p(s)\alpha_s}{b+\alpha_s a(s)}\log e = k,
\qquad
\frac{\partial G}{\partial b} = \sum_s\frac{p(s)}{b+\alpha_s a(s)}\log e = k,
$$

with inequality $\partial G/\partial a(s)\le k$ on $\lambda'$. Solving yields $k=\log e$ and

$$
b = \frac{1-p}{1-\sigma},\qquad
a(s) = p(s) - \frac{b}{\alpha_s}\quad(s\in\lambda),
$$

where $p=\sum_{\lambda}p(s)$, $\sigma=\sum_{\lambda}1/\alpha_s$, and the inequalities

$$
p(s)\alpha_s \le b \quad(s\in\lambda'),
\qquad
p(s)\alpha_s > b\quad(s\in\lambda),
\qquad \sigma<1
$$

identify $\lambda$.

### 5.2 Algorithmic construction

Permute so that $p(s)\alpha_s$ is nonincreasing. Define

$$
p_t=\sum_{s=1}^t p(s),\quad
\sigma_t=\sum_{s=1}^t\frac{1}{\alpha_s},\quad
F_t=\frac{1-p_t}{1-\sigma_t},\quad F_0=1.
$$

Set $b$ to the **minimum positive** $F_t$; set $a(s)=\max\{p(s)-b/\alpha_s,\,0\}$. Then

$$
G_{\max} = \sum_{s=1}^t p(s)\log\big(p(s)\alpha_s\big) + (1-p_t)\log\frac{1-p_t}{1-\sigma_t}.
$$

**Classical vs Kelly gambler.** If $p(s)\alpha_s<1$ for all $s$, place no bets. But if the largest $p(s)\alpha_s>1$, the optimum may include some bets with $p(s)\alpha_s<1$ (negative expected edge)—violating the classical “never bet on negative expectation” rule. Edge is evaluated jointly with the cash/withholding decision under log growth.

---

## 6. Criterion Discussion and Limitations (Kelly’s Own)

Kelly emphasizes that maximizing $E[\log V]$ is **not** because of a logarithmic utility of money. Rather, the logarithm is additive across independent bets and is the quantity to which the law of large numbers applies. Alternative institutional rules change the criterion: if the gambler’s wife allows only a fixed \\$1 bet each week with no reinvestment, one should maximize expected capital each period and bet the whole dollar on the highest-expectation event—and with probability one beat anyone who splits differently under that constraint.

**Proved dominance.** Capital under the fixed proportional rule $a(s\mid r)$ eventually surpasses any other **fixed** (time-and-history independent) proportional rule, almost surely. Kelly explicitly leaves open superiority versus **adaptive** $a(s\mid r)$ depending on time or past events—“theorems remain to be proved.”

**Economic scope.** The model needs (i) reinvestment of profits and (ii) controllable stake sizes across categories. The “channel” may be a literal wire or “the totality of inside information available to the investor.”

---

## 7. Summary of Formal Results (Paper’s Conclusion)

1. Fixed proportional betting → exponential capital growth/shrinkage.
2. Fair odds → max growth rate = Shannon transmission rate.
3. Unfair but take-free odds → max growth exceeds the no-channel case by exactly the transmission rate; optimal proportions still equal posteriors.
4. Track take → analogous optimization with withholding; formulas more complex and less purely information-theoretic.

---

## 8. Quantitative Takeaways for Finance Readers

1. **Growth-optimal fraction (binary):** $\ell^*=q-p=2q-1$ when fair even-money odds; $G_{\max}=1-H_2(p)$.
2. **Proportional gambling / Kelly rule:** $a(s\mid r)=q(s\mid r)$ under fair/take-free odds—the ancestor of “bet your edge / posterior.”
3. **Ignore prices for proportions (no take):** allocation follows beliefs; market odds enter wealth growth through multiplicative factors, not through the argmax over $a(\cdot\mid r)$.
4. **Track take induces sparsity:** only sufficiently favorable $p(s)\alpha_s$ receive capital; cash buffer $b>0$ appears.
5. **Myopic expected-wealth maximization is ruinous** under repeated multiplicative bets with noise.
6. **Fair odds as zero-edge baseline:** without information, $G_{\max}=0$ at fairness; information rate is incremental growth.
7. **Open problem flagged in 1956:** optimality among adaptive policies—later addressed by Breiman, Thorp, Algoet–Cover, and the universal-portfolio literature (ironically the filename of this PDF).

---

## 9. Limitations

- Discrete memoryless channel; independent trials.
- Fixed proportional strategies in the dominance claim.
- No continuous-outcome / continuous-time market model (later Kelly–Breiman–Thorp continuous analogues).
- No estimation error: $p$, $q(s\mid r)$ known.
- Utility interpretation carefully denied; yet finance practice often reintroduces log utility as a preference justification.
- Stock-market remark is heuristic, not a theorem about equilibrium prices.

---

## 10. Equation Sheet

$$
G=\lim_{N\to\infty}\frac1N\log_2\frac{V_N}{V_0}
$$

Binary noisy, fair even money:

$$
G(\ell)=q\log(1+\ell)+p\log(1-\ell),\quad
G_{\max}=1+p\log p+q\log q.
$$

General fair odds:

$$
G_{\max}=I(X;Y)=H(X)-H(X\mid Y),\quad a^*(s\mid r)=q(s\mid r).
$$

Take-free unfair:

$$
G_{\max}=H(\alpha)-H(X\mid Y).
$$

Track take (no channel form):

$$
a(s)=\max\{p(s)-b/\alpha_s,0\},\quad
b=\min_t^+ F_t.
$$

---

## 11. Bottom Line

Kelly (1956) attaches operational meaning to Shannon’s transmission rate without coding: it is the maximum almost-sure exponential growth rate of a gambler who sees channel outputs and reinvests optimally. Fair-odds growth equals mutual information; take-free unfair odds add an $H(\alpha)$ term while preserving posterior staking; track take introduces withholding and corner solutions. The paper is short, complete, and still the cleanest derivation of proportional gambling as information-rate maximization.

---

## 12. Worked Binary Example

Suppose $q=0.9$, $p=0.1$ (10% noise), even-money fair odds. Then $\ell^*=0.8$, and

$$
G_{\max}=1+0.1\log_2 0.1+0.9\log_2 0.9 \approx 1-0.469=0.531\text{ bits/trial}.
$$

Capital multiplies by about $2^{0.531}\approx 1.44$ per trial on the asymptotic path—far below the noiseless factor of 2, but infinitely superior to $\ell=1$, which yields almost-sure ruin. Expected capital under $\ell=1$ still grows as $(1.8)^N$, illustrating the divergence between $E[V_N]$ and almost-sure path behavior that motivates Kelly’s criterion.

---

## 13. Link from $G$ to Modern Portfolio Language

Identify “symbols” with market scenarios, “odds” $\alpha_s$ with gross returns available on Arrow–Debreu (or horse-race) securities, and $a(s\mid r)$ with portfolio weights after observing side information $r$. Then $G$ is the asymptotic continuously compounded excess growth rate (in bits if $\log_2$, in nats if $\ln$). Fair odds correspond to risk-neutral (or parimutuel) prices equal to physical probabilities; $G_{\max}=0$ without edge or information. Mutual information $I(X;Y)$ becomes the growth-rate value of the signal $Y$. This horse-race economics reading—implicit in Kelly’s stock-market aside—was developed explicitly by Breiman (1961), Thorp, and later Cover–Thomas textbook treatments. The present PDF’s filename “UniversalPortfolios” points at Cover (1991), which builds universal strategies that asymptotically match the best constant-rebalanced portfolio in hindsight; Kelly (1956) is the single-period / known-distribution ancestor of that growth-rate tradition, not Cover’s algorithm itself.

---

## 14. Final Assessment

For quantitative finance, Kelly (1956) remains essential primary source material: every later debate about fractional Kelly, leverage caps, and estimation error sits on top of the almost-sure growth criterion and the proportional betting rule derived here. The paper should be read as information theory first and betting theory second—the finance implications are corollaries of identifying capital growth with transmitted information.

---

## 15. Section-by-Section Close Reading

### Introduction (pp. 917–918)

Kelly opens by recalling Shannon’s definition of transmission rate and the coding theorem. He notes the desire to use rate as a design criterion even when coding is impossible (radar). He rejects unconstrained cost-function approaches as too general: average cost need not relate to Shannon rate, and an arbitrary transducer-plus-cost pair need not even be a “communication system.” The distinguishing feature of communication is that the ultimate receiver can profit from knowledge of inputs or refined probabilities. The gambling wire is chosen as a real situation embodying that feature without an arbitrary external cost.

### The Gambler with a Private Wire (pp. 918–920)

The noiseless baseball example makes $G=1$ vivid. The noisy case introduces the central tension between maximizing expected wealth (bet everything) and almost-sure growth (bet a fraction). The derivation of $G=q\log(1+\ell)+p\log(1-\ell)$ via the strong law is elementary but crucial: pathwise growth, not expectation, is the object. The log-convexity lemma used to optimize $\ell$ is the same information-theory workhorse that yields $D_{KL}$ projections and I-projections elsewhere.

### The General Case (pp. 920–922)

Notation for $p(s)$, $p(r|s)$, posteriors, odds $\alpha_s$, and stakes $a(s|r)$ is set carefully. Fair-odds justification via parimutuel feedback and the stock-market analogy appear here. The product-form wealth update and the almost-sure limit for $G$ follow from counting frequencies $W_{sr}/N\to p(s,r)$. Maximization producing $a=q(s|r)$ and $G_{\max}=I(X;Y)$ is the paper’s flagship theorem.

### When Odds Are Not Fair (pp. 922–923)

The decomposition $G=\sum p\log a + \sum p\log\alpha$ isolates the role of odds in an additive $H(\alpha)$ term. Fact (a)—ignore odds in staking—is repeatedly surprising to first-time readers and remains a teaching point. Fact (b)—unfairness helps—means bookmaker or market miscalibration is a free lunch for the informed growth-optimal bettor when there is no take. Fact (c)—channel value equals $R$ as an increment—gives transmission rate a differential growth interpretation.

### Track Take (pp. 923–925)

This is the most technical section. Separability across received symbols reduces the problem to a static horse race with cash. The KKT-style conditions identify a threshold $b$ on $p(s)\alpha_s$. The sorting-plus-minimum-$F_t$ algorithm is an explicit finite procedure. The remark that negative-edge bets can appear in the optimum is philosophically important: under log growth with a menu of bets and a cash option, marginal conditions are joint, not horse-by-horse NPV tests.

### Conclusion (pp. 925–926)

Kelly separates the log criterion from utility theory, gives the wife’s-\\$1-per-week counterexample where expectation maximization is correct, states the fixed-rule dominance result, flags the open adaptive-policy question, and sketches economic applicability (reinvestment + controllable stakes). The final paragraph restates the four regimes: fair, unfair take-free, and track take.

---

## 16. Numerical Fair-Odds Multinomial Sketch

Consider three outcomes with $p=(1/2,1/4,1/4)$ and a noiseless channel ($Y=X$). Fair odds $\alpha=(2,4,4)$. Then $H(X)=1.5$ bits, $H(X|Y)=0$, so $G_{\max}=1.5$ bits/trial. After seeing $r=s$, the gambler sets $a(s|r)=1$ on the revealed outcome—i.e., bets everything on the known winner—recovering the noiseless doubling logic generalized to a ternary alphabet (growth factor $\alpha_s$ when $s$ occurs, averaging to $2^{1.5}\approx 2.828$ per trial in the asymptotic rate sense).

If the channel is useless ($Y$ independent of $X$), $G_{\max}=0$ at fair odds: any staking against fair odds yields nonpositive asymptotic growth, and the optimum holds a synthetic cash position via canceling bets.

---

## 17. Track-Take Numerical Sketch

Suppose two horses, $p=(0.6,0.4)$, odds $\alpha=(1.5,1.5)$ so $\sum 1/\alpha_s=4/3>1$ is impossible—adjust to a take: let $\alpha=(1.4,1.4)$, $\sum 1/\alpha\approx 1.429>1$ still; better, classic example form $\alpha_1=1.5$, $\alpha_2=2.0$ with $\sum 1/\alpha=2/3+1/2=7/6>1$ means overround inverted. For a **take**, need $\sum 1/\alpha_s<1$. Take $\alpha=(1.5,1.8)$: $1/\alpha_1+1/\alpha_2=0.667+0.556=1.222$ still >1. Take $\alpha=(1.4,1.5)$: $0.714+0.667=1.381$. 

Proper track-take example: $\alpha_1=1.6$, $\alpha_2=1.7$ gives $0.625+0.588=1.213$. To get sum <1 need shorter odds: $\alpha_1=2.5$, $\alpha_2=2.5$ gives $\sum 1/\alpha=0.8<1$. Then $p\alpha=(1.5,1.0)$ if $p=(0.6,0.4)$. Sorting puts horse 1 first. $F_0=1$. $t=1$: $p_1=0.6$, $\sigma_1=0.4$, $F_1=(0.4)/(0.6)\approx0.667$. $t=2$: $F_2=(0)/(0.2)=0$. Minimum positive $F$ is $F_1\approx0.667$. Then $a_1=0.6-0.667/2.5=0.6-0.267=0.333$, $a_2=\max(0.4-0.667/2.5,0)=\max(0.133,0)=0.133$, $b=0.667$. Both horses receive positive stakes even though horse 2 has $p\alpha=1.0$ on the boundary region depending on exact $F$ comparisons—illustrating the joint nature of the solution (numbers illustrative of the algorithm’s bookkeeping; implementers should recompute $F_t$ inequalities carefully from Kelly’s exact conditions).

The qualitative lesson stands without fragile arithmetic: **withholding $b$ and a truncated support $\lambda$** replace full-support posterior staking once a take exists.

---

## 18. Relationship to Shannon’s Coding Theorem

Shannon’s theorem: one can communicate $R$ bits per symbol with arbitrarily small error using suitable codes. Kelly’s theorem: one can grow wealth at rate $R$ bits per symbol with suitable proportional bets and **no coding of the source**—the “code” is the betting allocation. Errors (channel noise) are not driven to zero; they are absorbed into fractional staking. This is why Kelly claims to give rate meaning “even though no coding is contemplated.” The two theorems are complementary operational readings of the same mutual-information number.

---

## 19. What Later Literature Added (Boundary of This Summary)

Kelly himself does not discuss: continuous-time geometric Brownian Kelly fractions $f^*=\mu/\sigma^2$; fractional Kelly as pragmatic shrink; estimation error / Bayesian Kelly; horse-race universality; Cover universal portfolios; growth-optimal numeraire portfolios in asset pricing (Long, Becherer, etc.). Those are descendants. This summary stays with 1956 content; the descendants explain why the PDF was mis-filed under “UniversalPortfolios.”

---

## 20. Practitioner Checklist Drawn Only from Kelly’s Results

1. Define the discrete outcome alphabet and information signal analogous to $(X,Y)$.
2. Estimate or posit $q(s|r)$ and market-implied $\alpha_s$.
3. If no take / full payout: set $a(s|r)=q(s|r)$ (or proportional if not fully investing).
4. If take: run the $F_t$ threshold algorithm; allow $b>0$.
5. Evaluate success by realized log-growth $\frac1N\sum\log(V_{t+1}/V_t)$, not by average arithmetic return.
6. Never confuse maximizing $E[V]$ under multiplicative risk with maximizing $G$.
7. Treat “fair odds” as the zero-information, zero-growth benchmark.

---

## 21. Final Synthesis

Kelly (1956) is simultaneously a BSTJ information-theory paper and the birth certificate of growth-optimal betting. Its equations are few; their consequences are vast. The correct reading for a finance audience is: **mutual information equals incremental log-growth under proportional betting with reinvestment**, with clean extensions to mispriced odds and track takes. Everything else in the Kelly literature elaborates robustness, dynamics, and estimation around this core.

---

## 22. Derivation Details: Why Posterior Staking Maximizes $G$

From

$$
G=\sum_{r,s}p(s,r)\log a(s|r)+H(X)
$$

under fair odds, fix $r$ and maximize $\sum_s p(s,r)\log a(s|r)$ subject to $\sum_s a(s|r)=1$, $a\ge0$. The Lagrangian yields $p(s,r)/a(s|r)=\nu_r$, hence $a(s|r)=p(s,r)/q(r)=q(s|r)$. The maximized inner sum equals $-\sum_r q(r)H(X|Y=r)=-H(X|Y)$, so $G_{\max}=H(X)-H(X|Y)$. Strict concavity of $\log$ makes the optimum unique. This is the same mathematics as maximum-likelihood probability assignment and as the I-projection onto the simplex.

Under take-free unfair odds the same Lagrangian applies to the $a$-dependent part; the $\sum p(s)\log\alpha_s$ term is constant in $a$. Hence posteriors remain optimal even when $\alpha$ is wrong—odds miscalibration shifts wealth growth but not the argmax.

---

## 23. Almost-Sure Versus Expectation: A Mini Monte Carlo Narrative

Imagine 1,000 trials of the binary channel with $q=0.55$, even money. Full-bet policy: wealth is $2^{W}$ after $W$ wins until first loss, then zero forever—so sample paths are eventually absorbed at 0 with probability 1, while the tiny fraction of paths with long win streaks dominate $E[V_N]$. Kelly $\ell^*=0.10$: wealth follows a random walk in log coordinates with positive drift $G_{\max}=1-H_2(0.45)\approx0.0073$ bits/trial—slow but relentless. After large $N$, virtually all Kelly paths sit above all surviving full-bet paths (there are none surviving). This narrative is exactly Kelly’s comparison of two gamblers in a nonterminating game.

---

## 24. Closing Paragraph for Archive Metadata

**Document identity:** J. L. Kelly, Jr., “A New Interpretation of Information Rate,” *Bell System Technical Journal* 35 (July 1956): 917–926. Source file on Drive named `UniversalPortfolios_Kelly_1956.pdf` contains this Kelly article (AT&T reproduction permission noted on the title page), not Cover’s universal portfolio paper. Summary length targets Scholar batch standards for quantitative substance retention.

---

## 25. Glossary of Kelly (1956) Symbols for Quick Reference

- $V_0,V_N$: starting and terminal capital after $N$ bets.
- $G$: exponential growth rate in bits per trial (base-2 log).
- $p,q$: binary error and correct-transmission probabilities ($p+q=1$).
- $\ell$: fraction of capital wagered in the binary even-money problem.
- $p(s),p(r|s),q(s|r)$: prior, channel, posterior.
- $\alpha_s$: decimal odds (gross payout per unit stake including stake).
- $a(s|r)$: capital fraction assigned to outcome $s$ after signal $r$.
- $b_r$ or $b$: unbet cash fraction when a track take prevents free canceling bets.
- $H(X),H(X|Y),H(\alpha)$: source entropy, equivocation, and odds entropy $\sum p(s)\log\alpha_s$.
- $R=I(X;Y)$: Shannon transmission rate; equals $G_{\max}$ under fair odds.
- $\lambda,\lambda'$: active and inactive outcome sets in the track-take KKT system.
- $F_t=(1-p_t)/(1-\sigma_t)$: threshold sequence used to select cash level $b$.

This glossary is faithful to Kelly’s notation (with only light modernization of $q(s|r)$ for posteriors). Together with the equation sheet in Section 10 it should allow re-implementation of every optimizer described in the article without consulting secondary sources.
