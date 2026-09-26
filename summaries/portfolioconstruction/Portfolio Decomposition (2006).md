# Portfolio Decomposition (2006)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/Vandenbussche_  Portfolio Decomposition_2006.pdf>), 8 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Portfolio Decomposition
- **Author(s):** Dieter Vandenbussche
- **Year:** 2006
- **Journal/Venue:** Technical note / white paper

# 2. Problem statement

The paper asks an implementation-attribution question: **given a constrained optimized portfolio and the corresponding unconstrained mean-variance portfolio, how can the difference be decomposed into additive contributions from individual constraints and objective terms?** The goal is not to solve the optimization problem itself but to allocate “unrealized alpha” and holdings distortion to specific constraints.

# 3. Approach (short)

The method is KKT-based decomposition. Starting from the first-order conditions of a differentiable constrained portfolio optimization problem, the paper rewrites the stationarity equation so that the implied-alpha vector, the holdings vector, and the expected-return shortfall each decompose into sums of terms associated with the objective and each active constraint. This turns dual multipliers into interpretable attribution objects.

# 4. Approach (detailed)

1. **Generic optimization problem**

   The paper considers a broad differentiable problem of the form
   $$
   \max_w \;
   \alpha^\top w - \frac{1}{2r} w^\top Q w
   + \sum_{j\in O} f_j(w)
   $$
   subject to
   $$
   g_i(w)\le 0,\qquad i\in C,
   $$
   where:

   - $\alpha$ is the forecast alpha vector;
   - $Q$ is the active-risk matrix;
   - $r$ is a risk-tolerance scalar;
   - $f_j$ are differentiable objective add-ons;
   - $g_i$ are differentiable constraints.

   The unconstrained mean-variance active portfolio is
   $$
   w^{MV}= r Q^{-1}\alpha.
   $$

2. **KKT stationarity**

   Let $w^\star$ be the constrained optimum and $\lambda_i\ge 0$ the dual multipliers. The first-order condition is
   $$
   \alpha + \sum_{j\in O}\nabla f_j(w^\star)
   - \sum_{i\in C}\lambda_i \nabla g_i(w^\star)
   - \frac{1}{r}Qw^\star = 0.
   $$
   Rearranging,
   $$
   \frac{1}{r}Qw^\star
   =
   \alpha + \sum_{j\in O}\nabla f_j(w^\star)
   - \sum_{i\in C}\lambda_i \nabla g_i(w^\star).
   $$
   The left-hand side is interpreted as the **implied alpha** consistent with the realized constrained portfolio.

3. **Implied-alpha decomposition**

   Define
   $$
   \alpha^{imp} := \frac{1}{r}Qw^\star.
   $$
   Then
   $$
   \alpha^{imp}
   =
   \alpha
   + \sum_{j\in O}\nabla f_j(w^\star)
   - \sum_{i\in C}\lambda_i \nabla g_i(w^\star).
   $$
   Each term on the right is attributable to a specific objective or constraint. This is the implied-alpha decomposition.

4. **Holdings decomposition**

   Premultiplying by $rQ^{-1}$ gives
   $$
   w^\star
   =
   rQ^{-1}\alpha
   + \sum_{j\in O} rQ^{-1}\nabla f_j(w^\star)
   - \sum_{i\in C}\lambda_i rQ^{-1}\nabla g_i(w^\star).
   $$
   Hence
   $$
   w^\star = w^{MV} + \sum_{j\in O} w_j + \sum_{i\in C} w_i,
   $$
   where the attributable portfolio for a constraint $i$ is
   $$
   w_i = -\lambda_i rQ^{-1}\nabla g_i(w^\star).
   $$
   This is the paper’s main constructive result: the deviation from the ideal MV portfolio is the sum of portfolios caused by each active constraint/objective.

5. **Returns decomposition**

   If the expected active return of a portfolio $u$ is $\alpha^\top u$, then the difference between the unconstrained and constrained expected returns can be decomposed by applying $\alpha^\top$ to the holdings decomposition. This produces an additive return shortfall attributable to each constraint group.

6. **Transfer coefficient link**

   Let $y=rQ^{-1}\alpha$ denote the unconstrained ideal active holdings. The transfer coefficient is
   $$
   TC(w)=\frac{w^\top Q y}{\sqrt{w^\top Q w}\sqrt{y^\top Q y}},
   $$
   i.e. the cosine between implemented and ideal portfolios in the $Q$-metric. The return decomposition can therefore be interpreted as a decomposition of implementation inefficiency relative to the ideal active portfolio.

7. **Why the decomposition works**

   The proof is exact KKT algebra. The only substantive assumptions are differentiability and existence of dual multipliers. Once the stationarity condition is written, every decomposition follows by linear transformation:

   - identity map for implied alpha;
   - $rQ^{-1}$ for holdings;
   - $\alpha^\top$ for expected return.

8. **Limits**

   Nondifferentiable constraints, such as gross-exposure or total-short constraints, complicate the analysis because gradients are replaced by subgradients or set-valued KKT terms. The paper notes this and treats the smooth case as the clean theoretical base.

# 5. Domain of applicability

- The decomposition applies to **differentiable constrained portfolio optimizations**.
- It is especially useful for active equity optimizers with many exposure, bound, and turnover constraints.
- The results are exact in the smooth case; nondifferentiable constraints require extensions beyond the note’s core derivation.
- The decomposition is interpretive rather than causal: it attributes the constrained optimum to KKT forces, not to economically independent “effects.”


# 6. Source details, corrected conventions, and an implementation guide

## 6.1 Source status and the economically relevant baseline

The local source is an eight-page Axioma technical note, with a four-asset demonstration, a 500-asset use case, and a mathematical appendix. Its filename attributes it to Vandenbussche and 2006; the extracted title page itself does not provide a conventional journal citation. It is an optimization attribution note rather than an empirical asset-pricing study.

The appendix uses **absolute holdings** $x$, benchmark holdings $b$, reference portfolio size $r$, and a covariance matrix $Q$:

$$
\max_x\ \alpha^Tx-\frac1{2r}(x-b)^TQ(x-b)+\sum_j f_j(x),
\quad g_i(x)\le0.
$$

Setting $a=x-b$ converts this to the active-holdings convention used above. Under this normalization the unconstrained absolute-holdings baseline is

$$
x^{MV}=b+rQ^{-1}\alpha,
$$

not simply $rQ^{-1}\alpha$. The latter is its active component. Confusing the two makes the decomposition fail its budget and holdings reconciliations. The reference size $r$ also gives the units: dollar holdings multiplied by a return covariance need to be normalized before being compared with dimensionless alpha forecasts.

The unconstrained baseline may involve enormous leverage and may fail every investment mandate constraint. That is intentional: it is the reference solution generated by the alpha-risk trade-off alone. It should not be presented as a feasible portfolio the manager could otherwise have held.

## 6.2 Conditions for the KKT interpretation

For a maximization problem with $g_i\le0$, define

$$
L(x,\lambda)=\alpha^Tx-\frac1{2r}(x-b)^TQ(x-b)
+\sum_jf_j(x)-\sum_i\lambda_i g_i(x).
$$

The inequalities have $\lambda_i\ge0$. Equality constraints have unrestricted multipliers and should be entered consistently with a chosen sign convention. Stationarity, feasibility, dual feasibility, and complementarity give

$$
Q(x^*-b)/r=\alpha+\sum_j\nabla f_j(x^*)
-\sum_i\lambda_i\nabla g_i(x^*),
\qquad \lambda_i g_i(x^*)=0.
$$

The source's statement that the added objective functions are convex is inconsistent with a generic concave maximization interpretation when they enter with a plus sign. For a globally solvable convex optimization problem, positive cost functions should enter as $f_j=-c_j$, with $c_j$ convex, so that $f_j$ is concave. The displayed stationarity identity can still hold at a regular local optimum without global concavity, but it then provides no global optimality guarantee. This is a source-level sign qualification, not a reason to discard the decomposition.

Existence of suitable multipliers requires an applicable constraint qualification. The inverse-risk transformation also requires invertibility of $Q$ on the relevant decision space. A positive-semidefinite risk matrix with unpenalized directions cannot simply be inverted. Regularization or a restricted-space formulation must be stated, and changing it changes the attribution baseline.

## 6.3 Why a local bound creates a global holdings effect

For an upper bound $x_k\le u_k$, the constraint gradient is $e_k$. Its implied-alpha contribution is $-\lambda_ke_k$: only asset $k$'s implied alpha changes directly. Its holdings contribution is

$$
a^{(k)}=-r\lambda_kQ^{-1}e_k.
$$

That vector usually has nonzero entries in many assets. The optimizer has to rebalance correlated hedges when one position is restricted. The off-diagonal entries of the precision matrix translate a local shadow-price adjustment into a market-wide holdings adjustment.

For a lower bound $x_k\ge l_k$, write $g_k=l_k-x_k$, so the gradient is $-e_k$. Its implied-alpha correction is $+\lambda_ke_k$. A short-sale restriction can therefore offset a strongly negative alpha, making a zero or positive implemented holding consistent with the altered alpha vector.

For a factor upper bound $\beta^Tx\le c$, the implied-alpha adjustment is proportional to $-\beta$, and the holdings adjustment is proportional to $-Q^{-1}\beta$. Thus the constraint attribution corresponds to a risk-efficient portfolio carrying the constrained exposure. Budget constraints act through the all-ones vector. The same linear mapping explains the apparently unintuitive cross-asset effects in the note's tables.

## 6.4 Four-asset example and exact reconciliation

The example uses DELL, IBM, MSFT, and ORCL, a $100,000 reference size, and an alpha-risk optimizer. Unconstrained holdings are approximately -$230,393, $200,448, $101,571, and -$74,735. The constraints permit no asset to be short more than $5,000, cap IBM at $50,000, and require net holdings of $100,000. The managed solution is -$5,000, $50,000, $60,000, and -$5,000.

The forecast dollar return of the unconstrained solution is about $31,109; the managed portfolio's is $6,250. The displayed contributions are approximately +$1,718 for budget, -$15,802 for DELL's lower bound, -$3,181 for ORCL's lower bound, and -$7,593 for IBM's upper bound. Inactive lower bounds on IBM and MSFT contribute zero. Rounding explains a dollar-scale residual when the printed entries are added.

Several points are worth retaining. First, an attribution component can increase forecast return even when the overall set of constraints reduces objective value. The budget contribution is positive here. Second, the largest expected-return distortion comes from preventing the enormous DELL short. Third, the single-name IBM bound alters holdings in the other three assets because of correlations, whereas its direct implied-alpha entry is confined to IBM.

The source's holdings columns reconcile additively to the managed holdings. None of the individual constraint portfolios needs to satisfy a standalone budget or long-only mandate. They are decomposition vectors, not separately investable funds.

## 6.5 The 500-asset use case: diagnosis versus removal experiments

The larger illustration has a $10 million budget, 500 assets, long-only holdings, active single-name limits of 2%, and industry/style deviations limited to 2% from benchmark. The managed portfolio has 2.62% tracking error and forecast dollar return about $456,547. The unconstrained baseline has forecast return about $59.6 million, illustrating the extreme leverage embedded in that diagnostic baseline.

The attribution assigns roughly -$50.2 million to long-only restrictions, -$1.9 million to budget, -$3.5 million to position bounds, -$1.9 million to industry constraints, and -$1.7 million to style constraints. These figures sum appropriately but do **not** measure the gain from separately deleting each constraint group.

The note explicitly reruns the optimization after group removal. Deleting long-only restrictions raises forecast return to about $1.739 million, nowhere near a $50.2 million increase. Deleting position bounds yields about $487,349; deleting style constraints yields about $549,122. Other restrictions become binding when one group is removed, and all multipliers adjust. The decomposition describes the forces at the original optimum, whereas a removal experiment is a different optimization problem.

The practical demonstration uses implied-alpha distortions to choose ten securities for a small relaxation of long-only bounds and ten for relaxing active position limits from 2% to 3%. Forecast return rises to about $488,371. Analogous changes on randomly chosen securities yield only about $459,935. This is a targeted optimization illustration; it does not establish out-of-sample alpha improvement or a statistical superiority claim.

## 6.6 What “opportunity cost” means here

The return decomposition applies the original forecast vector $\alpha$ to each attributed holdings vector. It therefore adds to a difference in *forecast returns*. It is not a decomposition of realized investment performance, and it does not automatically decompose mean-variance utility loss.

For the unconstrained quadratic objective without added cost terms, a useful separate identity is

$$
U(a^{MV})-U(a^*)=
\frac1{2r}(a^*-a^{MV})^TQ(a^*-a^{MV}).
$$

This follows by completing the square. Substituting the sum of constraint portfolios produces cross terms between constraints. Thus a naive sum of each component's standalone quadratic loss will not generally equal total utility loss. Allocating those interactions requires an additional rule, which this note does not provide.

The transfer coefficient similarly contains a nonlinear normalization. The numerator $\alpha^Ta$ is additive in the holdings components; the denominator depends on the total implemented risk. The source calls its return attribution a decomposition of an **unnormalized** transfer coefficient. It should not be misreported as an intrinsic additive decomposition of normalized TC into independently interpretable percentages.

## 6.7 Nonuniqueness, rescaling, and nonsmooth terms

When active constraint gradients are linearly dependent, dual multipliers can be nonunique even if the optimal holdings are unique. The total KKT adjustment is pinned down by stationarity, but its allocation among redundant constraints may not be. For example, duplicated exposure constraints can share a multiplier in multiple ways. Grouping or removing redundancies is important before interpreting individual contributions.

Rescaling a constraint should leave its product $\lambda_i\nabla g_i$ unchanged when the multiplier is transformed consistently. This is a useful audit: units such as dollars versus percent must not change the attributed portfolio. A sign error in the solver's reported dual convention will reverse an attribution and can be detected by the stationarity reconciliation.

Absolute-value trading costs and gross-exposure constraints use subgradients. At a kink, the chosen subgradient need not be unique. The note says Axioma is developing proprietary methods for these cases and does not expose a complete general algorithm. A modern extension can use solver duals for an explicit linear/convex epigraph formulation, but that is an implementation choice beyond the published smooth derivation.

## 6.8 A reproducible audit workflow

Save the exact alpha vector, covariance, benchmark, objective scaling, constraints, optimum, and dual variables from the rebalance. Convert all dual conventions to the same Lagrangian. Compute the implied-alpha components first and verify stationarity. Solve linear systems with $Q$ to obtain holdings components; do not explicitly form a dense inverse if a stable factorization is available. Then verify both holdings and forecast-return sums.

Report residuals in economically meaningful units, identify inactive constraints, and group related bounds only after calculating their contributions. Use actual reoptimizations for proposed mandate changes. In a live process, the attribution is most valuable as a diagnostic explaining why forecasts failed to transfer into holdings, and as a way to select a small set of constraints for closer examination. It does not establish that every constraining risk control should be removed.
