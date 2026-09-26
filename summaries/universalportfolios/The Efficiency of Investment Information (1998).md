# The Efficiency of Investment Information

**Authors:** Elza Erkip, Thomas M. Cover  
**Year:** 1998 (manuscript received 1996, revised 1997)  
**Journal/Venue:** IEEE Transactions on Information Theory, Vol. 44, No. 3, May 1998

## Problem statement

An investor in a stock market $\boldsymbol{X} = (X_1, \dots, X_m)$ with known distribution $F(\boldsymbol{x})$ has access to correlated side information $V$, but cannot observe $V$ directly. Instead, an encoder provides a rate-$R$ description (i.e., $\lceil 2^{nR} \rceil$ possible messages) of $V^n$. The paper asks: what is the maximum increase in the growth rate of wealth $\Delta(R)$ attainable from a rate-$R$ description of the side information? What is the marginal value of the first bit of description -- the initial efficiency $\Delta'(0)$ -- and how does it relate to the statistical dependence between $V$ and $\boldsymbol{X}$?

## Approach (short)

The problem is reformulated as an indirect rate distortion problem where the "distortion" is the log-wealth ratio between the investor's portfolio and the log-optimal portfolio. The incremental growth rate $\Delta(R)$ admits a single-letter characterization. The initial efficiency $\Delta'(0)$ equals the square of the Hirschfeld--Gebelein--Renyi maximal correlation $\rho_m^2(V, X)$ for the horse race market, and equals $1$ whenever $V = \boldsymbol{X}$ (the general market).

## Approach (detailed)

**1. Setup and growth rate.**
The investor holds a constant-rebalanced portfolio $\boldsymbol{b} = (b_1, \dots, b_m) \in \mathcal{B}$, the $(m-1)$-simplex. The growth rate of wealth under distribution $F$ is
$$W(\boldsymbol{b}, F) = \int \log \boldsymbol{b}^t \boldsymbol{x} \, dF(\boldsymbol{x}),$$
and the log-optimal portfolio is $\boldsymbol{b}^\star = \arg\max_{\boldsymbol{b}} W(\boldsymbol{b}, F)$, achieving $W^\star(F) = W(\boldsymbol{b}^\star, F)$. With perfect side information $V$, the increase in growth rate is $\Delta W = E_V W^\star(F(\cdot \mid V)) - W^\star(F(\cdot))$, which Barron and Cover [6] showed is bounded by $I(X; V)$.

**2. Incremental growth rate (Theorem 1, exact).**
A $(2^{nR}, n)$ code consists of an encoding function $i_n: \mathcal{V}^n \to \{1, \dots, 2^{nR}\}$ and an investment strategy $\boldsymbol{b}^n: \{1, \dots, 2^{nR}\} \to \mathcal{B}^n$. The incremental growth rate is
$$\Delta(R) = \max_{\substack{F(\tilde{v} \mid v): \; I(\tilde{V}; V) \le R, \\ \tilde{V} \to V \to \boldsymbol{X}}} E \log \frac{\boldsymbol{b}^{\star t}(\tilde{V}) \boldsymbol{X}}{\boldsymbol{b}^{\star t} \boldsymbol{X}},$$
where $\tilde{V}$ is a quantized version of $V$ satisfying the Markov chain $\tilde{V} \to V \to \boldsymbol{X}$ and the rate constraint $I(\tilde{V}; V) \le R$. This is a single-letter expression.

*Proof sketch.* Define the distortion function $d(\boldsymbol{b}, \boldsymbol{X}) = -\log(\boldsymbol{b}^t \boldsymbol{X} / \boldsymbol{b}^{\star t} \boldsymbol{X})$, which measures the log-wealth shortfall of portfolio $\boldsymbol{b}$ relative to $\boldsymbol{b}^\star$. The growth-rate increase $\Delta_n$ for any code $\mathcal{C}$ equals $-E\,d(\boldsymbol{b}^n(i_n(V^n)), \boldsymbol{X}^n)$. Hence maximizing the growth rate is equivalent to minimizing expected distortion, i.e., an indirect rate distortion problem (the encoder sees $V$, not the source $\boldsymbol{X}$ directly). Berger's indirect rate distortion theory then yields the single-letter form.

**3. Upper bound (Theorem 2, exact).**
$$\Delta(R) \le R.$$
Follows from $\Delta W \le I(\tilde{V}; \boldsymbol{X}) \le I(\tilde{V}; V) \le R$ via the data processing inequality.

**4. Initial efficiency (Definition).**
$$\Delta'(0) \triangleq \lim_{R \to 0} \frac{\Delta(R)}{R},$$
the maximum increase in growth rate per bit of description at zero rate. Since $\Delta(R)$ is concave and nondecreasing, $\Delta'(0)$ is the largest marginal value.

**5. Horse race market specialization.**
In the horse race market, exactly one stock is positive at each time: $\boldsymbol{X} = o_i \boldsymbol{e}_i$ with probability $p_i$. The optimal portfolio is proportional betting $b_i^\star = p_i$ (Kelly criterion), giving $W^\star(X) = \sum p_i \log o_i - H(X)$. With side information $Y$:
$$\Delta = W^\star(X \mid Y) - W^\star(X) = I(X; Y). \tag{Eq.\,8}$$

**Theorem 3 (exact):** For the horse race, $\Delta(R) = \max I(\tilde{V}; X)$ over all $\tilde{V} \to V \to X$ with $I(\tilde{V}; V) \le R$. The problem reduces exactly to source coding with side information (Wyner [22], Ahlswede--Korner [5]), with
$$\Delta(R) = H(X) - C(R),$$
where $C(R)$ is the minimum descriptive complexity of $X$ given a rate-$R$ description of $V$.

**6. Binary horse race (Theorem 4, exact).**
$V \sim \text{Bern}(1/2)$, $X$ related to $V$ through a BSC with crossover probability $p$. Then
$$(R, \Delta(R)) = (1 - H(\alpha),\; 1 - H(\alpha * p)), \quad 0 \le \alpha \le 1,$$
where $\alpha * p = \alpha(1-p) + (1-\alpha)p$ is the cascade crossover probability. Proof uses Mrs. Gerber's Lemma (Wyner--Ziv): $H(V \mid \tilde{V}) \ge a \Rightarrow H(X \mid \tilde{V}) \ge H(p * H^{-1}(a))$.

**Theorem 5 (exact):** For binary $V, X$, $\Delta'(0) = (1 - 2p)^2 = \rho^2(V, X)$.

**7. Gaussian horse race (Theorem 6, exact).**
$V, X$ jointly Gaussian with correlation $\rho$, $X = V + Z$, $Z \sim N(0, \sigma_Z^2)$ with $\sigma_Z^2 = (1 - \rho^2)/\rho^2$. Then
$$\Delta(R) = \frac{1}{2} \log \frac{1}{1 - \rho^2(1 - 2^{-2R})}.$$
Proof uses Bergmans' conditional entropy power inequality. The effective correlation at rate $R$ is $\rho_{\text{eff}} = \rho\sqrt{1 - 2^{-2R}}$.

**Theorem 7 (exact):** $\Delta'(0) = \rho^2$ for jointly Gaussian $(V, X)$.

**8. Initial efficiency for the horse race (Theorem 8, exact).**
For the general horse race market:
$$\Delta'(0) = \rho_m^2(V, X),$$
where $\rho_m(V, X) = \sup_{g, h} E[g(V)h(X)]$ subject to $Eg(V) = Eh(X) = 0$, $Eg^2(V) = Eh^2(X) = 1$, is the Hirschfeld--Gebelein--Renyi maximal correlation.

*Proof sketch (upper bound).* For small $I(\tilde{V}; V) \le \epsilon$, Pinsker's inequality gives $p(\tilde{v} \mid v) \approx p(\tilde{v})$ in variational distance. Write $p(\tilde{v} \mid v) = p(\tilde{v}) + \lambda u(\tilde{v}, v)$ with $\lambda \to 0$. Taylor-expand both $I(\tilde{V}; V)$ and $I(\tilde{V}; X)$ to leading order in $\lambda^2$. The ratio $I(\tilde{V}; X)/I(\tilde{V}; V)$ is then bounded by $\rho_m^2$ via Renyi's characterization (Eq. 12). Achievability uses the function $g_m(v)$ attaining the supremum in the maximal correlation, choosing $\tilde{V} \sim \text{Bern}(1/2)$ and $u(\tilde{v}, v) \propto g_m(v)$.

This connects to the hypercontraction of the Markov operator (Ahlswede--Gacs [2]).

**9. General market initial efficiency (Theorem 9, exact).**
When $V = \boldsymbol{X}$ (the encoder can observe the stock outcomes):
$$\Delta'(0) = 1.$$
Every bit of description adds exactly one bit to the growth rate. Proof constructs an explicit perturbation: let $g(\boldsymbol{X}) = \boldsymbol{c}^t \boldsymbol{X} / \boldsymbol{b}^{\star t} \boldsymbol{X}$ for a suitable direction $\boldsymbol{c} \ne \boldsymbol{0}$ in the active-stock subspace, set $\tilde{V} \sim \text{Bern}(1/2)$, and perturb the conditional density as $f(\boldsymbol{x} \mid \tilde{v}) = f(\boldsymbol{x})(1 \pm \lambda g(\boldsymbol{x}))$. The portfolio is perturbed as $\boldsymbol{b}(\tilde{v}) = \boldsymbol{b}^\star \pm \lambda \boldsymbol{c}$. Both $\Delta$ and $R$ are $O(\lambda^2)$, and their ratio tends to $1$.

**Regularity conditions:**
- $\boldsymbol{X}$ has a known distribution $F(\boldsymbol{x})$ with $X_j \ge 0$.
- $(X_i, V_i)$ are i.i.d.
- The log-optimal portfolio $\boldsymbol{b}^\star$ exists and has at least two active stocks ($k \ge 2$) for Theorem 9.
- For Theorem 8: discrete $V$ suffices; extension to continuous $V$ via quantization.
- Gaussian results (Theorem 6) assume the AWGN channel model with finite variance.
- All logarithms are base 2 unless stated otherwise.

## Domain of applicability

- **Horse race markets** (only one stock pays off per period): the incremental growth rate admits a clean reduction to source coding with side information, and explicit solutions exist for binary and Gaussian cases.
- **General stock markets** with known distribution: Theorem 1 applies but no closed-form solutions are provided for $\Delta(R)$ or $\Delta'(0)$ when $V \ne \boldsymbol{X}$, except the bound $\Delta'(0) = 1$ at $V = \boldsymbol{X}$.
- The framework is information-theoretic and asymptotic ($n \to \infty$, i.i.d. markets). It does not address finite-sample or adversarial settings.
- The model assumes a constant known distribution $F(\boldsymbol{x})$; non-stationary or partially known distributions are outside scope.
- Practical relevance: quantifies the marginal value of additional bits of communication about side information for growth-rate-optimal investing. The maximal correlation $\rho_m^2$ provides a single scalar summarizing how efficiently side information can be compressed for investment purposes.
- Open question (stated in the paper): a simple characterization of $\Delta'(0)$ for the general market with arbitrary side information $V$ is not known.
