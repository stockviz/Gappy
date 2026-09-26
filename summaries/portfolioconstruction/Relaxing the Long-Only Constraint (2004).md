# Relaxing the Long-Only Constraint

**Source:** [EfficientPortfolios_ClarkeDesilvaSapra_2004.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/EfficientPortfolios_ClarkeDesilvaSapra_2004.pdf>)  
**Source coverage:** Entire 10-page article, including exhibits and endnotes.

## 1. Metadata

- **Title:** Toward More Information-Efficient Portfolios: Relaxing the Long-Only Constraint
- **Author(s):** Roger Clarke, Harindra de Silva, Steven Sapra
- **Year:** 2004
- **Journal/Venue:** *The Journal of Portfolio Management*

## 2. Problem statement

The paper asks: **how much implementation efficiency is lost because active equity portfolios are long-only, and how much of that loss can be recovered by allowing limited shorting?** The relevant concept is not raw expected return but the ability of the optimized portfolio to transmit the manager’s information into positions.

## 3. Approach (short)

The paper uses quadratic active management optimization and evaluates portfolios through the transfer coefficient (TC), the implementation-efficiency term in the fundamental law of active management. By comparing optimizations with and without long-only and related constraints, it shows that the long-only restriction is usually the largest source of information loss and that modest shorting often recovers most of the loss.

## 4. Approach (detailed)

1. **Optimization setting**

   Let $h$ denote active portfolio weights relative to a benchmark, let $\alpha$ denote expected active returns (or a standardized score proportional to expected alpha), and let $\Sigma$ denote the active risk model. The canonical quadratic active utility is
   $$
   \max_h \;\alpha^\top h-\lambda h^\top \Sigma h
   $$
   subject to implementation constraints such as:

   - beta neutrality / market exposure;
   - sector neutrality;
   - industry neutrality;
   - market-cap neutrality;
   - position limits;
   - long-only or bounded-short constraints.

   Without binding constraints, the optimizer would choose
   $$
   h^\ast \propto \Sigma^{-1}\alpha.
   $$
   Constraints distort this direction.

2. **Transfer coefficient**

   The paper interprets implementation efficiency through the fundamental law:
   $$
   IR \approx IC \times TC \times \sqrt{\text{breadth}}.
   $$
   Here $TC$ measures how closely the implemented portfolio aligns with the unconstrained optimal signal direction. In a standard quadratic setting, one can think of it as the correlation, under the risk inner product, between the constrained solution and $\Sigma^{-1}\alpha$. Thus:

   - $TC=1$: no information loss;
   - $TC<1$: constraints block the expression of alpha.

3. **Why long-only is especially costly**

   In benchmarked equity portfolios, many benchmark names have small benchmark weights. If the manager dislikes those names, the natural active position is often a short or at least a large underweight. But long-only means active weights cannot go below $-w_b$, so many negative views get compressed. Algebraically, the feasible set truncates the negative coordinates of $\Sigma^{-1}\alpha$, and the constrained KKT solution becomes
   $$
   \alpha-2\lambda \Sigma h-\Gamma^\top \eta =0,
   $$
   with complementary slackness on the inequality constraints. The truncation is strongest where benchmark weights are smallest, so the implemented portfolio becomes systematically less aligned with the alpha vector.

4. **Risk level and shorting**

   The paper emphasizes a comparative-static result: if one increases target active risk while keeping the portfolio long-only, the transfer coefficient declines. The reason is simple. At low target risk, only a modest part of the unconstrained solution is needed, so inequality constraints may not bind much. At high target risk, the optimizer wants more extreme positive and negative positions; long-only bites harder, so TC falls.

   By contrast, once shorting is allowed, the optimizer can keep the portfolio closer to the unconstrained direction over a wider range of risk levels. This is why the paper finds a much flatter TC-versus-tracking-error relation for long-short portfolios.

5. **Marginal value of relaxing constraints**

   The paper studies a sequence of optimizations in which constraints are removed one at a time. Empirically, removing the long-only constraint causes the largest increase in TC. This is consistent with the math above: long-only changes the feasible set most directly relative to the unconstrained $\Sigma^{-1}\alpha$ solution.

   The market-cap neutrality constraint is next most important in the reported examples because it forces the optimizer away from the names where alpha often concentrates.

6. **Limited shorting**

   The practically relevant part of the paper is not “go fully unconstrained,” but “allow some shorting.” The authors compare portfolios such as:

   - long-only;
   - $+110/-10$;
   - $+120/-20$;
   - $+130/-30$;
   - etc.

   The main finding is that much of the TC improvement arrives very early: even $10\%$–$20\%$ short capacity can recover a large share of the efficiency loss. In quadratic terms, once the optimizer is allowed to express at least the strongest negative views, the marginal value of further shorting declines.

7. **What is proved and what is empirical**

   The paper does not prove a theorem in the econometric sense. Its mathematical content is the standard quadratic-optimization geometry:

   - unconstrained active portfolios point in the direction $\Sigma^{-1}\alpha$;
   - binding inequality constraints reduce the cosine between the implemented and unconstrained directions;
   - long-only constraints bind asymmetrically on negative views and therefore are especially destructive.

   The size of the effect, however, is empirical. The “10%–20% shorting recovers most of the benefit” statement is a property of the tested portfolios, not a general theorem.

**Additional mathematical details**

The unconstrained active problem behind the paper is
$$
\max_h \alpha^\top h
\qquad\text{s.t.}\qquad
h^\top V h = \sigma_A^2,
$$
with solution
$$
h^\star=\kappa V^{-1}\alpha,
\qquad
\kappa=\frac{\sigma_A}{\sqrt{\alpha^\top V^{-1}\alpha}}.
$$
In that case the transfer coefficient is $TC=1$. Once long-only or box constraints are imposed, the KKT system projects $V^{-1}\alpha$ onto the feasible set, and the implemented $TC$ becomes the cosine of the angle between the feasible portfolio and the unconstrained optimum in the $V$-inner product:
$$
TC=\frac{\alpha^\top h}{\sqrt{\alpha^\top V^{-1}\alpha}\sqrt{h^\top V h}}.
$$

This geometry explains why limited shorting helps so much. The long-only constraint binds mainly on the negative-alpha names, so allowing even modest short positions enlarges the feasible set enough to keep the implemented portfolio much closer to $V^{-1}\alpha$. The exhibits illustrate constrained optimization conditional on the specified signal and risk model; they do not constitute a general theorem about the optimal extension level.

## 5. Domain of applicability

- The analysis applies to **benchmark-relative active equity management** with quadratic risk control.
- It is most relevant when alpha is cross-sectional and benchmark weights are highly uneven, because that is where long-only most heavily censors negative views.
- The paper is less informative for:
  - absolute-return portfolios,
  - portfolios with large transaction-cost penalties,
  - strategies whose primary constraints are factor neutrality rather than long-only.
- Its broad claim that modest shorting is valuable is well supported by the optimization geometry, but the exact optimal short budget is not proved to be universal.


## 6. Source identity and design of the experiment

The PDF's main title is **Toward More Information-Efficient Portfolios**, with **Relaxing the long-only constraint** as subtitle. The original summary filename uses the subtitle; this note retains that filename for continuity. The article appeared in the Fall 2004 *Journal of Portfolio Management*. Its evidence is a set of portfolio-construction comparisons, not a long historical net-return backtest.

The initial experiment fixes annualized forecast tracking error at 4% against the S&P 500. The fully constrained portfolio is capitalization-, industry-, and sector-neutral, limits individual active positions to ±3%, disallows short sales, and has benchmark beta one. The beta condition is retained in every comparison. Barra USE3 provides the risk model. Forecast returns follow the calibration

$$\alpha_i=IC\,\sigma_i\,s_i,$$

with assumed $IC=0.05$, specific volatility $\sigma_i$, and scores based on book-to-price. Consequently, the results are conditional on a particular value signal, a particular covariance estimate, and the stated constraint set. The authors do not estimate a universally available 5% IC.

The fully constrained TC is 0.332. Removing long-only raises TC by about 108% relative to this baseline; removing capitalization neutrality raises it by about 46%. Removing sector and industry controls together raises TC to 0.422, about 27%. The last comparison shows why individually small effects should not be added mechanically: overlapping restrictions can substitute for one another, so their combined removal has a different effect from separate marginal relaxations.

### 6.1 What the transfer coefficient measures here

The operational statistic is a cross-sectional correlation between $\alpha_i/\sigma_i$ and $h_i\sigma_i$, using specific risks. The full-covariance cosine shown above is a useful geometric interpretation, but should not be silently treated as the exact statistic plotted in the article. Its relation to the simple $IC\sqrt N$ law relies on residual-risk and centering approximations.

A budget, beta, or factor-neutrality condition also means the relevant ideal direction is the alpha vector projected into the feasible linear subspace, rather than the completely unrestricted $\Sigma^{-1}\alpha$. Inequality constraints further restrict that subspace. In particular, $h_i\ge-w_{B,i}$ describes a translated polyhedron in active-weight coordinates, not generally a cone. A quadratic-program solution may be represented as a projection in a risk metric, but simple Euclidean clipping does not solve the problem when risks are correlated.

## 7. Benchmark concentration explains the asymmetry

At the source's observation date, the S&P 500's effective number of holdings is approximately

$$N_{\mathrm{eff}}=\frac{1}{\sum_i w_{B,i}^2}=114.$$

This is a concentration statistic, not an estimate of the number of independent alpha forecasts. The top 20 stocks account for about one-third of benchmark capitalization, the next 76 another third, and the remaining 404 the last third. Average weights are roughly 1.7%, 0.4%, and 0.1%, respectively.

A long-only manager can remove a disliked stock altogether, but cannot make its active weight lower than minus its benchmark weight. Two equally unattractive stocks can therefore receive radically different negative positions solely because one begins with a larger index weight. For the average stocks in the first and last groups, the available maximum underweight differs by about seventeenfold.

Short extensions ease this asymmetry and also permit larger overweights, since the portfolio remains net invested. At a 4% tracking-error target, 52% of the long-only portfolio's total absolute active weight lies in the largest capitalization quintile and only about 5% in the smallest. For the 150/50 example these shares are about 29% and 17%. The correlation between absolute active weight and benchmark weight declines from 0.44 to 0.19. These are changes in the allocation of active *capital*, not direct decompositions of active variance.

The concentration effect provides an economic reason why the main benefit often arrives early. A little short capacity can release the most distorted negative views, particularly among small benchmark constituents. Further extension improves already less constrained positions and has diminishing benefits in the examples. It remains possible for borrow restrictions, illiquidity, or inaccurate small-cap forecasts to reverse the net advantage.

## 8. Permission to short versus a requirement to short

A crucial qualification is whether the mandate allows *up to* a specified short amount or forces an exact long–short structure. Let

$$S(w)=\sum_i\max(-w_i,0),\qquad \mathbf1'w=1.$$

Then long exposure is $1+S(w)$ and gross exposure is $1+2S(w)$. A 120/20 portfolio is net 100%, gross 140%. Net investment alone does not imply market beta one; that is why the article separately retains the beta restriction.

If the constraint is $S(w)\le s$, increasing $s$ enlarges the feasible set. Holding the objective and all other restrictions fixed, the optimized objective cannot decrease: the previous portfolio remains feasible. A falling TC or expected return at high extension in the article's fixed-structure curves concerns **forcing** a given short exposure, along with the risk target and other restrictions. The distinction prevents the mistaken conclusion that merely granting additional flexibility necessarily harms the optimizer.

At very low tracking error, forcing substantial short exposure requires offsetting positions whose main purpose is to keep active risk down. The paper notes that a 1% tracking-error strategy can be more information-efficient at 110/10 than at 150/50. In its example, the latter becomes more attractive only beyond roughly 2–2.5% tracking error. Conversely, when shorting is determined endogenously rather than fixed, the optimizer can scale an efficient direction across risk levels until some other restriction binds.

The article reports that, at typical 4% tracking error, long-only achieves about 68% of the TC of a 200/100 comparison portfolio, while 120/20 achieves about 85%. That is a substantial improvement, but the arithmetic should be described accurately: moving from 68 to 85 recovers 17 of the missing 32 percentage points, or about 53% of that particular gap. It does not establish that 20% shorting captures all the benefit or constitutes an optimal universal mandate.

## 9. Translating the result into a construction decision

The paper supports jointly selecting risk tolerance and short capacity. A useful construction study would vary both, preserving the same forecast, benchmark, risk model, and non-short constraints. It would report forecast alpha, TC, realized gross exposure, concentration, expected turnover, and estimated net benefit. Constraint shadow prices can help identify which restriction is currently costly, but local multipliers do not replace a full reoptimization when constraints interact or the active set changes.

Several qualifications limit the article's strong practical language. Equal forecast tracking error does not ensure equal realized risk. Short portfolios may face financing, recall, gap, and liquidity risks poorly represented by a covariance model. A broader ability to express negative forecasts is beneficial only to the extent that those forecasts remain informative after borrow and trading costs. Factor-neutrality restrictions may deliberately suppress risks the manager does not wish to take, rather than simply destroy useful information.

The durable contribution is to show how benchmark concentration, active-risk targets, and short-sale restrictions jointly determine the fidelity of alpha implementation. The numerical extension levels are examples of this relationship, not estimates of a stable optimal leverage constant.
