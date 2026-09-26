# On-line Portfolio Selection Using Multiplicative Updates (1998)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_HelmboldSchapireSingerWarmuth_1998.pdf>), 23 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** On-line Portfolio Selection Using Multiplicative Updates
- **Author(s):** David P. Helmbold, Robert E. Schapire, Yoram Singer, Manfred K. Warmuth
- **Year:** 1998
- **Journal/Venue:** *Mathematical Finance*

# 2. Problem statement

The paper asks whether one can design a computationally light online trading rule that **achieves nearly the same asymptotic wealth as the best constant rebalanced portfolio in hindsight**, while using only linear time and storage in the number of assets.

# 3. Approach (short)

The method is multiplicative-weights / exponentiated-gradient online optimization. Each day’s portfolio weights are updated by exponentially tilting the previous weights toward assets with better relative performance. The analysis measures regret in normalized log-wealth relative to the best CRP and proves universality-type guarantees.

# 4. Approach (detailed)

1. **Portfolio and wealth**

   A portfolio is a weight vector $w_t\in\Delta_N$. If $x_t$ is the vector of price relatives on day $t$, wealth evolves by
   $$
   S_T = \prod_{t=1}^T w_t^\top x_t.
   $$
   For a fixed CRP $w$, the hindsight benchmark is
   $$
   S_T(w)=\prod_{t=1}^T w^\top x_t.
   $$

2. **Exponentiated-gradient update**

   The proposed algorithm updates weights multiplicatively:
   $$
   w_{t+1,i}
   \propto
   w_{t,i}\exp\!\left(\eta \frac{x_{t,i}}{w_t^\top x_t}\right),
   $$
   with renormalization so $\sum_i w_{t+1,i}=1$. Assets that contributed more to the day’s portfolio return get larger future weight.

3. **Regret criterion**

   The performance metric is normalized log-wealth regret relative to the best CRP:
   $$
   L_T^\star - L_T,
   \qquad
   L_T = \frac{1}{T}\log S_T.
   $$
   Universality means the worst-case positive gap is asymptotically nonpositive; the precise staged construction and return assumptions are given below.

4. **Why multiplicative updates are natural**

   The log-wealth objective is concave in $w$. A first-order ascent step in the simplex geometry induced by relative entropy yields exactly the exponentiated-gradient form. The update is therefore an online mirror-descent step for log wealth.

5. **Main guarantee**

   The paper proves sublinear regret for appropriately tuned EG under bounded relative returns, and universality for a staged, smoothed modification. For those constructions,
   $$
   \lim_{T\to\infty}\big(L_T^\star-L_T\big)=0.
   $$
   The finite-sample upper bound is weaker than Cover’s sharp integral-based bound but is computationally far cheaper.

6. **Side information extension**

   If a side-information variable $y_t$ is observed before trading, the method expands one portfolio into a family $w^{(1)},\dots,w^{(K)}$, one per signal state. The same multiplicative-update analysis then applies to the enlarged expert set.

7. **Proof sketch**

   The proof uses relative entropy as a potential function. One bounds the one-step change in KL divergence between the algorithm’s weights and any fixed comparison CRP, then telescopes over time. The result is the standard multiplicative-weights regret inequality translated into log-wealth language.

# 5. Domain of applicability

- The algorithm applies to **online portfolio selection** with daily or period-by-period rebalancing.
- It is computationally attractive when Cover’s exact universal portfolio is too expensive.
- The guarantee is against the best **constant** rebalanced portfolio only.
- The theory ignores transaction costs, which can be especially damaging for multiplicative-update strategies because they rebalance frequently.


## 6. Exact guarantee for the basic update

The source is *Mathematical Finance* 8(4), October 1998, pp. 325–347. Its basic EG update and its fully universal modification are different algorithms. A fixed learning rate in the simple formula does **not** by itself establish vanishing worst-case average regret for arbitrary nonnegative price relatives.

The analysis normalizes each day's price-relative vector so $\max_i x_{t,i}=1$. This loses no information for regret: multiplying every asset's gross return on a day by the same positive constant changes both strategies' log wealth by the same amount, and leaves the update ratio unchanged. Assume that every normalized component is at least $r>0$. Theorem 4.1 gives, for every fixed comparison portfolio $u$,

$$
\sum_{t=1}^{T}\log(u^\top x_t)
-\sum_{t=1}^{T}\log(w_t^\top x_t)
\le\frac{D_{KL}(u\|w_1)}{\eta}+\frac{\eta T}{8r^2}.
$$

With uniform initialization, $D_{KL}(u\|w_1)\le\log N$. Choosing

$$
\eta=2r\sqrt{\frac{2\log N}{T}}
$$

yields total log regret at most $\sqrt{2T\log N}/(2r)$ and average regret at most $\sqrt{\log N/(2r^2T)}$. The lower bound $r$ is a bound on the daily worst-to-best gross-return ratio, not a positive lower bound on daily simple returns. Negative simple returns are entirely compatible with the model.

If $\eta$ remains fixed as $T$ grows, the stated upper bound divided by $T$ retains the term $\eta/(8r^2)$. Thus the basic theorem alone cannot support the blanket universal-consistency claim for any fixed learning rate. Horizon-dependent tuning or a suitable staged construction is part of the guarantee.

## 7. Why KL divergence telescopes

The update can be derived by maximizing a first-order approximation to the next step's log-return objective minus relative entropy from the current allocation. It exactly solves

$$
\max_{w\in\Delta_N}\left\{
\eta\frac{x_t^\top w}{w_t^\top x_t}-D_{KL}(w\|w_t)
\right\}.
$$

The term involving $x_t$ is linearized. The update does not exactly solve $\eta\log(w^\top x_t)-D_{KL}(w\|w_t)$; the paper calls that more expensive implicit alternative Exact EG.

For any comparator $u$, the change in divergence is

$$
D_{KL}(u\|w_{t+1})-D_{KL}(u\|w_t)
=-\eta\frac{u^\top x_t}{w_t^\top x_t}+\log Z_t.
$$

A bound on the exponential normalizer gives $\log Z_t\le\eta+\eta^2/[8(w_t^\top x_t)^2]$. Combining this with $1-z\le-\log z$, summing over time, and using nonnegativity of the final divergence produces the regret inequality. The proof is deterministic: it does not assume independent returns, Gaussianity, or a stationary stochastic model.

Uniform positive initialization is also mathematically useful. A coordinate initialized at zero remains zero under multiplicative updates. A comparator using that asset would then have infinite initial KL divergence, defeating the stated finite bound. In a numerical implementation, log weights and a stable log-sum-exp normalizer avoid accidental underflow that effectively deletes an asset.

## 8. Removing the return lower bound and the known horizon

The universal variant smooths both the observed normalized returns and the portfolio used for investment:

$$
\widetilde x_t=(1-\alpha/N)x_t+(\alpha/N)\mathbf1,
\qquad
\widetilde w_t=(1-\alpha)w_t+(\alpha/N)\mathbf1.
$$

The internal $w_t$ is updated with $\widetilde x_t$, while actual wealth earns $\widetilde w_t^\top x_t$. These two smoothing coefficients are intentionally different. The return transformation enforces a lower bound $\alpha/N$; the investment mixture protects against putting effectively no money in an asset that can dominate the day's return.

For $0<\alpha\le1/2$, Theorem 4.2 bounds total regret by

$$
2\alpha T+\frac{D_{KL}(u\|w_1)}{\eta}
+\frac{\eta T}{8(\alpha/N)^2}.
$$

The first term is the cost of protective mixing. With uniform initialization and $T\ge2N^2\log N$, the choices

$$
\alpha=\left(\frac{N^2\log N}{8T}\right)^{1/4},
\qquad
\eta=\sqrt{\frac{8\alpha^2\log N}{N^2T}}
$$

give a bound $2(2N^2\log N)^{1/4}T^{3/4}$. A doubling-stage procedure restarts at uniform weights and retunes parameters for each stage length, removing advance knowledge of the final horizon. Corollary 4.3 establishes universality for this staged, smoothed algorithm.

The resulting average regret rate is of order $((N^2\log N)/T)^{1/4}$, slower than the bounded-relative-return rate. Cover–Ordentlich's comparison bound is of order $N\log T/T$. The computational tradeoff is central: the EG update requires linear time and storage per period, whereas the direct integral/grid implementations of the universal portfolio considered in this paper become expensive rapidly with dimension.

Vanishing average log regret means a subexponential wealth ratio penalty. It does not mean the algorithm's terminal dollar wealth converges to the hindsight optimum, nor does it bound drawdown. A cumulative regret bound that grows like $\sqrt T$ can still correspond to a large multiplicative wealth gap.

## 9. Side information changes the comparator

If a finite signal $y_t\in\{1,\ldots,K\}$ is observed before choosing the period's portfolio, the algorithm maintains one EG vector per signal value and updates only the vector used on that date. The comparison class becomes $K$ different constant portfolios, one for each state. This is richer than a single CRP, but weaker than arbitrary history-dependent trading strategies.

The total log wealth is the sum over state-specific subsequences. Regret can therefore be analyzed separately on subsequences of lengths $T_k$ and added. Under bounded relative returns and appropriately tuned rates, the sum of square-root terms is bounded using $\sum_k\sqrt{T_k}\le\sqrt{KT}$. More signal states increase the comparator's flexibility and reduce the data available per state. Rare states especially require careful learning-rate choices.

The paper's empirical signal is the identity of the stock with the greatest wealth growth over the preceding 100 trading days. This is observed historical information, not the future winner. The regret theory permits any provided signal sequence; it does not explain how to choose the most useful signal representation without overfitting.

## 10. Empirical results and comparison limits

The experiments use subsets of 36 NYSE stocks over the 22-year period ending in 1985. The main reported learning rate is $\eta=0.05$, with useful performance across a range around 0.01–0.15. These are empirical settings for basic EG, not the horizon-dependent parameters of the universal theorem.

For Iroquois and Kin Ark, the best stock grows wealth by about 8.9 times, the hindsight CRP by 73.7, EG by 70.9, and the reported universal portfolio by about 40.0. For Commercial Metals and Kin Ark, the corresponding values are 52.0, 144.0, 110.2, and 78.4. For IBM and Coca-Cola the gap is smaller: hindsight CRP 15.1, EG 14.9, and universal 14.2. The paper associates larger gains from rebalancing with volatile, weakly correlated constituents.

Exact EG and the explicit update produce very similar wealth in the reported tests, generally within 1%, while Exact EG is slower. Better worst-case guarantees do not force better realized performance on a particular data set: an algorithm can sacrifice ordinary-case behavior to protect against hostile sequences. The experiments establish this possibility, not universal empirical superiority of EG.

The implementation of Cover's method is approximate. For at most nine stocks, the source uses a simplex grid with denominator ten. Above nine stocks it samples $10^8$ random portfolio vectors; the authors explicitly warn that sparse coverage can understate the integral strategy's performance. They omit high-dimensional universal results when this artifact becomes too severe. Comparisons at larger $N$ therefore mix algorithmic differences with approximation quality.

Side information substantially increases observed wealth in the illustrations. For IBM and Coca-Cola, EG rises from 14.9 to 89.9, while the state-conditioned hindsight comparator rises from 15.1 to 118.5. This is not the same benchmark as the original single CRP. The larger comparator gap also reflects the difficulty of learning separate portfolios on unevenly populated states.

## 11. Trading and model boundaries

The source also models a 50%-down margin investment as a synthetic asset with gross return $2x_{t,i}-1-c$, using daily financing rate $c=0.000233$, approximately 6% annually. Its use within the nonnegative-price-relative theory requires the synthetic return to remain nonnegative; sufficiently large one-day losses can violate that requirement. The experiment is not an unrestricted leverage theorem.

Transaction costs are omitted from the main wealth calculations. Even a constant target allocation requires trades after relative prices move, so turnover is not measured simply by changes in target weights. The actual pretrade weight is $w_{t,i}x_{t,i}/(w_t^\top x_t)$; trading to the next target must be compared with this drifted allocation. The KL movement penalty used to derive EG is not a monetary cost model.

The discussion identifies proportional costs, fixed fees, and changing comparator portfolios as open directions. The deterministic theorem itself does not assume stationarity, despite the discussion's economic concern that one fixed CRP may be an inadequate benchmark in a changing market. The right distinction is between a guarantee valid on any sequence and a comparator class that may miss useful dynamic opportunities.
