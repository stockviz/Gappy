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
   Universality means this gap vanishes as $T\to\infty$ for every price sequence.

4. **Why multiplicative updates are natural**

   The log-wealth objective is concave in $w$. A first-order ascent step in the simplex geometry induced by relative entropy yields exactly the exponentiated-gradient form. The update is therefore an online mirror-descent step for log wealth.

5. **Main guarantee**

   The paper proves that the algorithm’s regret against the best CRP is sublinear, so
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
