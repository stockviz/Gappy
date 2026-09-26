# On the History of the Growth Optimal Portfolio

**Source:** [UniversalPortfolios_Christensen_2005.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_Christensen_2005.pdf>)  
**Source coverage:** Historical introduction and main theoretical, investment, pricing, and empirical sections reviewed; detailed attention to Sections 2–5, with cited literature treated through the survey.

## 1. Metadata

- **Title:** On the History of the Growth Optimal Portfolio
- **Author(s):** Morten Mosegaard Christensen
- **Year:** 2005
- **Journal/Venue:** survey / draft paper

## 2. Problem statement

The paper asks a survey question with a definite theoretical core: **what exactly is the growth-optimal portfolio (GOP), how has it been characterized in discrete and continuous time, and what claims about long-run dominance, utility optimality, and derivative pricing are actually justified by the underlying theorems?**

## 3. Approach (short)

The method is a literature survey organized around the mathematical properties of the GOP. Christensen starts from the discrete-time log-optimal portfolio, then reviews the continuous-time formulation, the numéraire/supermartingale property, the long-running dispute over whether the GOP should be held by all investors, and the later use of the GOP as a pricing numéraire in the benchmark approach. The value of the paper is synthesis and separation of what is proved from what was historically overclaimed.

## 4. Approach (detailed)

1. **Define the GOP in discrete time**

   In its basic form the GOP solves
   $$
   \pi^\star \in \arg\max_{\pi} \mathbb E[\log W_T^\pi]
   $$
   or, in one-period notation,
   $$
   b^\star \in \arg\max_{b\in\Delta_d}\mathbb E[\log(b^\top X)].
   $$
   The survey emphasizes two distinct but equivalent viewpoints under standard conditions:
   - maximization of expected log utility;
   - maximization of asymptotic growth rate.

2. **State the long-run dominance property carefully**

   The classical Kelly-Breiman idea is that if $\pi^\star$ is growth optimal, then for any sufficiently different admissible strategy $\pi$,
   $$
   \frac{W_T^\pi}{W_T^{\pi^\star}}\to 0
   \quad\text{a.s.}
   $$
   under appropriate stationarity/integrability assumptions. The survey is careful that this is not a universal finite-horizon welfare statement. It is an asymptotic almost-sure statement.

3. **Review the numéraire property**

   One of the central exact results is: when wealth processes are denominated in units of the GOP,
   $$
   \hat W_t^\pi := \frac{W_t^\pi}{W_t^{\pi^\star}},
   $$
   the resulting process is a supermartingale for every admissible $\pi$. In discrete time:
   $$
   \mathbb E\!\left[\left.\frac{W_{t+1}^\pi}{W_{t+1}^{\pi^\star}}\right|\mathcal F_t\right]
   \le
   \frac{W_t^\pi}{W_t^{\pi^\star}}.
   $$
   This is one of the structural pillars of the benchmark approach.

4. **Explain the proof idea for the numéraire property**

   The proof is a first-order optimality argument for log utility. Since $\pi^\star$ maximizes conditional expected log growth, for any alternative $\pi$,
   $$
   \mathbb E\!\left[\left.\log\frac{W_{t+1}^\pi/W_t^\pi}{W_{t+1}^{\pi^\star}/W_t^{\pi^\star}}\right|\mathcal F_t\right]\le 0.
   $$
   The log-growth inequality alone does not imply the supermartingale property. The required argument differentiates expected log wealth along a feasible mixture with the alternative strategy, giving the conditional expectation of the return ratio at most one; the full derivation appears below.

5. **Continuous-time formulation**

   In continuous time the GOP is the self-financing strategy maximizing drift of $\log W_t$. In diffusion form,
   $$
   \frac{dW_t^\pi}{W_t^\pi}=r_t\,dt+\pi_t^\top(\mu_t-r_t\mathbf 1)\,dt+\pi_t^\top \sigma_t\,dB_t,
   $$
   and Ito’s lemma implies
   $$
   d\log W_t^\pi
   =
   \left(
   r_t+\pi_t^\top(\mu_t-r_t\mathbf 1)-\frac12\|\sigma_t^\top \pi_t\|^2
   \right)dt
   +\pi_t^\top \sigma_t\,dB_t.
   $$
   Maximizing the drift gives the continuous-time GOP. The survey does not propose a new theorem here; it consolidates known results.

6. **Asset-pricing implications**

   If $V_t$ is a contingent claim, benchmark pricing takes
   $$
   V_t
   =
   W_t^{\pi^\star}\,
   \mathbb E\!\left[
   \left.\frac{V_T}{W_T^{\pi^\star}}\right|\mathcal F_t
   \right].
   $$
   This is “fair pricing” under the GOP numéraire. The survey stresses the distinction between:
   - standard complete markets with the necessary true-martingale conditions, where this coincides with risk-neutral pricing;
   - incomplete markets where it becomes a specific pricing rule rather than a no-arbitrage necessity.

7. **What the survey argues against**

   A historical theme of the article is that the GOP does **not** imply every investor should hold the same portfolio. Long-run growth optimality, log-utility optimality, and pricing-numéraire status are different claims. The survey’s novel contribution is largely to disentangle them and document where the literature slid from one statement to another without proof.

## 5. Domain of applicability

The survey is applicable wherever the GOP is invoked: gambling/Kelly problems, long-run portfolio choice, and benchmark pricing. The strongest rigor lies in the discrete- and continuous-time numéraire property and in long-run growth arguments under admissibility and integrability conditions. The broader “everyone should hold the GOP” interpretation is explicitly criticized as going beyond the proofs. Likewise, GOP-based pricing is fully compelling in complete markets or as a benchmark-approach choice, but it is not forced by arbitrage theory in general incomplete markets.


## 6. Historical structure and distinctions among optimality claims

The local source is Christensen's draft dated November 1, 2005. It separates three uses of the growth-optimal portfolio: an investment objective, a mathematical numéraire, and an asset-pricing device. These uses overlap but are not interchangeable. Bernoulli's logarithmic utility, Williams's emphasis on geometric growth, Kelly's information-theoretic gambling argument, and Latané's investment criterion enter the history through different questions. Log utility predates the almost-sure growth arguments by centuries.

For positive gross wealth multipliers $R_t^p$, log terminal wealth is additive: $\log W_T=\log W_0+\sum_{t=1}^T\log R_t^p$. Under an i.i.d. law and suitable integrability, the sample average converges to $E\log R^p$. The exponential of this expectation is the population geometric mean. Maximizing expected terminal wealth instead involves the arithmetic mean and can select much riskier, even ruinous, strategies. The survey uses this difference to explain the initial appeal of growth maximization.

Three statements should be distinguished:

- The GOP maximizes expected log wealth within a specified admissible class.
- No competitor has a strictly greater asymptotic exponential growth rate under the relevant theorem's conditions.
- A particular competitor's wealth divided by GOP wealth converges to zero.

The third is stronger than the second. The draft occasionally describes a growth-rate inequality as if it automatically implied eventual strict wealth dominance. It does not: strategies can share the same limiting growth rate, coincide after a finite date, or maintain a nonzero limiting relative wealth. A persistent growth gap or sufficiently sustained deviation is needed for the strongest relative-wealth conclusion.

## 7. The numéraire proof and why Jensen alone is insufficient

Let $R^*>0$ be the one-period return of a conditionally log-optimal portfolio and $R$ that of an alternative with the same initial cost. Assume convex mixtures are feasible. For $0\le\epsilon\le1$, define $R_\epsilon=(1-\epsilon)R^*+\epsilon R$. Optimality at the boundary $\epsilon=0$ gives the directional derivative

$$
\left.\frac{d}{d\epsilon}E_t\log R_\epsilon\right|_{0+}
=E_t\left[\frac{R}{R^*}-1\right]\le0,
$$

with the appropriate integrability or limiting justification. Thus $E_t[R/R^*]\le1$. Multiplying by the current wealth ratio proves that any nonnegative admissible wealth divided by GOP wealth is a supermartingale.

It is **not** valid to infer this from $E\log(R/R^*)\le0$ by exponentiating and invoking Jensen: the exponential is convex and gives the opposite direction of comparison. The directional derivative is essential. In the reverse direction, a supermartingale ratio and concavity of the logarithm imply the log-optimal inequality, when expectations are defined.

At an interior optimum with reversible feasible directions, first-order equalities can make benchmarked primary assets martingales. At a constrained boundary only one-sided inequalities need hold. The survey emphasizes that empirical tests imposing equality can wrongly reject a valid GOP or misinterpret constrained solutions. A numéraire portfolio in the modern supermartingale sense is more general than a portfolio that makes every normalized asset a true martingale.

The unique object is the optimal **wealth process**. Redundant securities can produce multiple holdings vectors with the same payoff. Existence also requires attention: the finite discrete model's equivalence with no arbitrage must not be exported unchanged to general continuous-time markets or cases with infinite expected log utility.

## 8. Diffusions, jumps, and portfolio constraints

With excess drift $a=\mu-r\mathbf1$ and covariance $C=\sigma\sigma^\top$, the instantaneous expected log-growth objective is

$$
g(\pi)=r+\pi^\top a-\frac12\pi^\top C\pi.
$$

If $C$ is positive definite and the solution is admissible and unconstrained, $\pi^*=C^{-1}a$. If $\sigma$ is square and invertible, this is $\sigma^{-\top}\theta$, where $\theta=\sigma^{-1}a$. The transpose is required; an unqualified $\sigma^{-1}\theta$ is generally wrong for nonsymmetric $\sigma$. The covariance form avoids the draft's matrix-notation ambiguity.

The logarithm makes the optimal investment fraction independent of wealth and, with exogenous opportunities and no intertemporal trading constraints, removes the usual horizon-dependent hedging demand. Myopia does not mean constant weights: the policy still responds to the current conditional distribution. Nor does it mean each holding is simply proportional to that asset's expected return; cross-covariances enter $C^{-1}a$, and in general discrete-time markets the first-order conditions are nonlinear.

Jump models require more. A jump return $z$ changes wealth by $1+\pi^\top z$, so feasibility requires this quantity to remain positive on relevant jump support. A representative growth term is an integral involving $\log(1+\pi^\top z)$ and the compensating linear term. Differentiation introduces $z/(1+\pi^\top z)$, explaining why the jump first-order conditions are nonlinear and why diffusion leverage formulas cannot simply be carried over. The survey describes the general characterization through semimartingale drift, covariance, and jump compensator.

A useful boundary illustration uses a unit-price cash asset and a stock with $\log X\sim N(\mu,\sigma^2)$. Solvency for all realizations restricts the stock fraction to $[0,1]$. The derivative at zero is $EX-1=e^{\mu+\sigma^2/2}-1$; hence all cash is optimal when $\mu\le-\sigma^2/2$. At one, the derivative is $1-E(1/X)=1-e^{-\mu+\sigma^2/2}$; all stock is optimal when $\mu\ge\sigma^2/2$. The interior region is between these thresholds. This corrects the inconsistent lower-bound sign in the draft's prose for Example 2.11. It also shows why equalities for all normalized assets fail at a corner.

## 9. Long horizons do not remove preference differences

The Samuelson controversy concerns an invalid passage from a pathwise statement to an expected-utility ordering. Even if the probability that GOP wealth exceeds a competitor's tends to one, rare adverse outcomes can retain large utility weight. Exchanging limits with expectations requires conditions such as uniform integrability, and even a shared limiting utility value would not rank every finite-horizon decision.

In the constant-parameter diffusion example, a CRRA investor with relative risk aversion $\gamma$ holds risky fraction $(a-r)/(\gamma\sigma^2)$; the GOP corresponds to $\gamma=1$. The fraction does not converge toward the GOP merely because the horizon increases. A more risk-averse investor can rationally choose lower exposure at every finite horizon. Conversely, a less risk-averse investor can choose greater exposure even though this lowers logarithmic growth beyond its maximum. The disagreement is about the objective, not about algebra.

The survey also distinguishes median wealth, hitting times, and probability of beating a competing portfolio. They are different objectives. In discrete games, overshooting a target can prevent the GOP from minimizing the expected time to every fixed target, despite asymptotic results for increasingly large targets. Statements about avoiding exact bankruptcy depend on divisibility and admissibility and do not provide protection against very large drawdowns or economically ruinous wealth levels.

## 10. How long is the long run?

The source's Black–Scholes illustration supplies a quantitative answer. With a single risky asset, constant Sharpe ratio $\theta=(a-r)/\sigma$, and initial wealth one,

$$
W_T^*=\exp\left[(r+\tfrac12\theta^2)T+\theta B_T\right],\qquad B_T\sim N(0,T).
$$

Against the savings account, for $\theta\ne0$,

$$
P(W_T^*>e^{rT})=\Phi\left(\tfrac12|\theta|\sqrt T\right).
$$

Thus the horizon for terminal outperformance probability $q>1/2$ is $T=[2\Phi^{-1}(q)/|\theta|]^2$. At annual Sharpe ratio 0.25, the draft reports approximately 105 years for 90% and 173 years for 95%. At Sharpe 0.5, the corresponding horizons are about 26 and 43 years. These are model calculations with known constant parameters, not empirical estimates of how fast a fitted strategy will succeed.

Against the risky stock itself, the same expression uses $|\theta-\sigma|$. When that difference is zero, the stock already is the GOP and strict outperformance is impossible. The probability of being ahead at the terminal date also differs from the probability of never falling behind before that date. These qualifications are crucial for translating asymptotic arguments into investor horizons.

## 11. Pricing: true martingales, strict local martingales, and fair values

For a nonnegative terminal claim $H$, benchmark fair value is

$$
V_t=W_t^*E_t\left[\frac{H}{W_T^*}\right].
$$

If the normalized savings account defines a **true** density martingale, changing numéraire connects this expression to risk-neutral valuation. In a complete market under the standard conditions it coincides with the unique replication price. In an incomplete market it selects a particular pricing rule, corresponding to the marginal price of a log-utility investor, rather than every possible arbitrage-free price. A finite-position utility-indifference price is generally nonlinear in position size and need not equal that marginal price.

Continuity of prices can make benchmarked wealth a local martingale without making it a true martingale. A positive local martingale is a supermartingale; it may lose expectation. The draft discusses models where a growth-optimal numéraire exists but the candidate density relative to the money-market account is strict local. No probability measure can be obtained merely by treating a density with expectation below one as a normalized Radon–Nikodym derivative.

In the specific complete-market framework discussed, fair valuation can identify a cheaper admissible replicating strategy than buying an asset with a strict-local-martingale component. Selling the expensive position and buying the cheaper replicator does not automatically yield an admissible arbitrage: intermediate losses and the chosen numéraire matter. This is an argument about model structure and admissibility, not evidence that ordinary traded bonds have been mispriced.

Novikov's condition is sufficient to establish a true stochastic-exponential martingale. Failure of that sufficient condition alone does **not** prove strict locality, despite wording in the draft that suggests otherwise. A separate argument or explicit example is required. Likewise, applying fair valuation to a merely strict-supermartingale primary asset in a constrained discrete model can conflict with existing prices; the source gives such an example and restricts the pricing discussion accordingly.

## 12. What the empirical literature does and does not establish

The survey separates estimating GOP composition from testing its realized investment performance. Candidate-numéraire tests examine ratios such as $(1+R_i)/(1+R_G)$ and test conditional or unconditional moment restrictions. Equality requires an appropriate interior/martingale setting; a supermartingale formulation produces inequalities. Estimation noise and weak statistical power make it hard to distinguish a market proxy from the unknown GOP.

The reviewed studies give mixed composition results. Some fitted GOPs are concentrated; some resemble leveraged market exposure; some vary substantially across historical periods. The survey discusses how finite-state approximations, short-sale restrictions, and overly restrictive diffusion models can drive these findings. A failure to reject a market proxy is not proof that the proxy is growth optimal. Anecdotes of successful investors are also distinct from controlled, broadly replicated evidence.

The source concludes that the growth criterion has practical appeal, but its long-run dominance can require great patience and its use in pricing requires a credible empirical GOP proxy. The lasting contribution of this historical survey is the separation of log-growth, utility, numéraire, and pricing claims. Each should be used with its own assumptions rather than as a chain of unconditional implications.
