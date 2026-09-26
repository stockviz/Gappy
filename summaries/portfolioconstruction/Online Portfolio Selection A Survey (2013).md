# Online Portfolio Selection A Survey (2013)

Source: [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_LiHoi_2013.pdf>). The discussion below follows this library copy; section and exhibit references refer to the source.

# 1. Metadata

- **Title:** Online Portfolio Selection: A Survey
- **Author(s):** Bin Li, Steven C. H. Hoi
- **Year:** 2013
- **Journal/Venue:** *ACM Computing Surveys* preprint / survey article

# 2. Problem statement

The paper asks a classification-and-synthesis question: **how should the online portfolio selection literature be organized algorithmically, what update rules define the main methods, and how do those methods relate to capital-growth theory?**

# 3. Approach (short)

The article is a comprehensive survey from an online-learning viewpoint. It formalizes online portfolio selection as sequential decision-making with rebalancing, then groups algorithms into benchmarks, Follow-the-Winner, Follow-the-Loser, Pattern-Matching, and Meta-Learning classes. The contribution is structural understanding rather than a new optimization theorem.

# 4. Approach (detailed)

1. **Formal online portfolio model**

   There are $m$ assets and $n$ periods. At period $t$, the investor chooses
   $$
   b_t\in\Delta_m,
   $$
   then observes price relatives $x_t\in\mathbb R_+^m$. Wealth evolves as
   $$
   S_n = S_0\prod_{t=1}^n b_t^\top x_t.
   $$
   The natural objective is cumulative log wealth,
   $$
   \log\frac{S_n}{S_0}=\sum_{t=1}^n \log(b_t^\top x_t).
   $$

2. **Benchmark class**

   The survey begins with Buy-and-Hold, Best Stock, Constant Rebalanced Portfolios, and Universal Portfolios. These are not merely examples; they provide comparison standards and motivate regret or competitive-ratio analysis.

3. **Follow-the-Winner**

   These algorithms move capital toward assets or experts that have recently performed well. The survey places in this class:
   - Universal Portfolio / Aggregating-type algorithms;
   - Exponential Gradient:
     $$
     b_{t+1,i}\propto b_{t,i}\exp\!\left(\eta \frac{x_{t,i}}{b_t^\top x_t}\right);
     $$
   - Follow-the-Leader / Follow-the-Regularized-Leader variants.

   The common logic is to approximate or compete with the best CRP or best expert in hindsight.

4. **Follow-the-Loser**

   These algorithms implement mean reversion. Capital is shifted away from assets that have just risen and toward recent losers. Examples surveyed include Anticor, Passive-Aggressive Mean Reversion, Confidence-Weighted Mean Reversion, and robust median-reversion variants. The article emphasizes that this is economically opposite to momentum but often effective empirically.

5. **Pattern-Matching**

   These methods estimate a predictive conditional distribution of future returns by selecting historical windows similar to the current one, then solve a portfolio problem on that empirical conditional law. The survey decomposes them into:
   - sample-selection rule;
   - portfolio-optimization rule.

   Kernel, histogram, nearest-neighbor, semi-log-optimal, Markowitz-type, and GV-type strategies are all presented as combinations of these two modules.

6. **Meta-learning**

   The survey then covers algorithms that combine underlying portfolio rules rather than choosing one. This includes Aggregating Algorithm variants, universalization methods, Online Gradient Updates, Online Newton Updates, and switching/leading-history methods. The generic form is to update expert weights based on past loss and combine portfolios accordingly.

7. **Connection to capital-growth theory**

   A distinctive section of the survey reconnects the algorithmic literature to Kelly/Cover growth-optimality. For instance, the best CRP in an i.i.d. market solves
   $$
   b^\star\in \arg\max_{b\in\Delta_m}\mathbb E[\log(b^\top X)],
   $$
   and universal portfolios aim to match its growth without knowing the distribution. Pattern-matching methods can likewise be read as estimating the conditional law of $X_{t+1}$ and then applying a local log-growth optimizer.

8. **What is proved versus what is catalogued**

   The survey itself proves essentially no new master theorem. Its role is to collect theorems from the literature: competitive-regret bounds for universal/exponential-gradient methods, universal-consistency results for nonparametric log-optimal rules, and empirical comparisons across algorithm classes. Its real contribution is organizational.

# 5. Domain of applicability

The article is applicable as a map of the online portfolio selection literature up to roughly 2013. It is strongest when the reader wants algorithm classes, update rules, and conceptual links to capital-growth theory. Because it is a survey, broad claims about “state of the art” are time-stamped, and several empirical conclusions depend on frictionless backtest conventions. The theoretical guarantees it cites vary widely across classes: regret bounds for some methods, asymptotic consistency for others, and only empirical success for many.

# 6. A precise comparison map

The library copy is a 2013-era preprint with placeholder ACM volume and publication-date fields. Its taxonomy describes the literature covered by that version, not the current state of the field. The categories classify update mechanisms; their names should not be interpreted as universal economic predictions.

| Family | Main decision mechanism | Typical comparator or claim | Main qualification |
|---|---|---|---|
| Universal portfolios | Wealth-weighted mixture over constant portfolios | Hindsight best-CRP log-growth comparison | Finite-horizon wealth gap and computational integration cost |
| EG and online Newton methods | Regularized updates using log-wealth gradients | Regret relative to a fixed portfolio under stated return bounds | A comparator guarantee is not positive absolute profit |
| Anticor/PAMR/CWMR | Move exposure against recent winners | Primarily reported historical performance | Depend on a reversal pattern that can fail |
| OLMAR/median reversion | Predict a return toward a recent price center | Empirical comparison and update efficiency | Price-center forecast is an assumption |
| Pattern matching | Estimate a conditional law from similar histories | Some stationary-ergodic universality results | Assumptions, dimension and recurrence matter |
| Expert aggregation | Allocate among strategies using past wealth | Regret against a specified expert class | Cannot dominate a benchmark omitted from the pool for free |

Buy-and-hold and CRP differ operationally. Buy-and-hold lets weights drift with returns; CRP repeatedly restores a target. A CRP thus sells relative winners and buys relative losers, although the meta-algorithm selecting among CRPs may be wealth-following. The survey explicitly discusses this distinction, so “Follow-the-Winner” should not simply be equated with price momentum.

# 7. Representative algorithms beyond their labels

EG can be understood as maximizing a linearized log-return reward while penalizing KL distance from the previous portfolio. Its gradient is $x_{t,i}/(b_t^\top x_t)$, leading to the exponential update displayed above. The learning rate controls responsiveness; underflow and normalization must be managed numerically. Online Newton methods retain curvature information and project in a time-varying metric, trading more computation for stronger regret bounds in suitable exp-concave settings.

PAMR instead imposes a low exposure to the just-observed price-relative vector. In its basic unconstrained step,
$$
b_{t+1}=b_t-\tau_t(x_t-\bar x_t\mathbf1),\qquad
\tau_t=\frac{\max(0,b_t^\top x_t-\epsilon)}{\|x_t-\bar x_t\mathbf1\|^2},
$$
followed by a simplex projection. This explicitly reduces weight on recent winners. Soft variants cap or regularize the update. When all price relatives are equal, the denominator vanishes and the implementation needs the corresponding no-update case. The survey identifies a DJIA sample where the single-period reversal assumption performs poorly.

CWMR models uncertainty over **portfolio weights** using a Gaussian mean and covariance. Its covariance is a confidence parameter in the online-learning model; it is not the covariance matrix of asset returns. Confusing these two covariances would turn its update into an unintended Markowitz rule. Gaussian sampling also needs an admissibility/projection convention to produce simplex portfolios.

OLMAR predicts the next price vector by a moving average, giving $\widehat x_{t+1}=MA_t/p_t$ componentwise. It then seeks a nearby portfolio satisfying a desired predicted payoff. This uses multiple-period price reversion instead of predicting an immediate return to yesterday's price. Robust median reversion replaces the center estimate to reduce sensitivity to outliers. Neither change proves that prices must revert.

# 8. Pattern matching and aggregation

A pattern method first selects past windows resembling the latest window, then uses the returns immediately following those windows as an empirical conditional sample. A log-optimal expert solves
$$
\max_{b\in\Delta_m}\frac1{|J_t|}\sum_{s\in J_t}\log(b^\top x_s).
$$
Window length, distance, kernel bandwidth and the handling of an empty neighborhood determine the expert. More dimensions and longer histories can leave too few close matches. Aggregating many experts with positive initial capital reduces dependence on one parameter choice, while the initial mass assigned to an expert creates a finite-time performance penalty.

The full-log, semi-log and mean-variance variants must be distinguished. A quadratic Taylor approximation to log utility introduces approximation error; universal consistency of a full-log kernel procedure cannot automatically be attributed to its semi-log counterpart. Likewise a stationary-ergodic growth theorem compares with the appropriate conditional growth optimum almost surely, whereas adversarial CRP regret holds path by path against a narrower hindsight comparator. These are different strengths of guarantee.

Wealth aggregation over experts gives a simple finite-pool inequality. If $S_t=\sum_kp_kS_{t,k}$, then $S_t\geq p_kS_{t,k}$ for every expert. This proves a constant log-wealth gap to each fixed positive-prior expert before transaction costs. It does not make an average of arbitrary portfolios dominate the best expert unless the allocation and wealth accounting implement the mixture correctly.

# 9. Reading empirical and practical claims carefully

The survey summarizes published backtests rather than providing one newly standardized, independently held-out comparison across every method. Large cumulative wealth on a repeatedly used dataset does not establish robustness across markets or parameter searches. Data adjustment, surviving asset universes, timestamp alignment and repeated selection of windows can materially affect results.

Frictionless turnover should be measured against the **drifted** portfolio before rebalancing, not simply $\|b_{t+1}-b_t\|_1$. Following period $t$, that drifted portfolio is $b_t\circ x_t/(b_t^\top x_t)$. Costs reduce investable wealth and can change the optimal action; applying an after-the-fact haircut does not preserve the cited universality theorem automatically.

The source's research directions include risk control, additional information, changing patterns, transaction costs, leverage and liquidity. These are unresolved modeling issues within the surveyed framework. A practical use of the survey is to identify a comparator and a predictive assumption, then test the whole trading procedure under chronological validation, realistic costs and capital limits. The taxonomy helps locate the assumption responsible for an algorithm's success or failure rather than treating every high-growth update as the same Kelly strategy.
