# Portfolio Optimization with Factors, Scenarios, and Realistic Short Positions

**Bruce I. Jacobs, Kenneth N. Levy, and Harry M. Markowitz (2005).** *Operations Research* 53(4), 586–599. DOI: 10.1287/opre.1050.0212. [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/scenarioportfolios_Markowitz_2005.pdf>). This summary covers all 14 PDF pages, including the mathematical results, numerical example, and endnotes.

## 1. The problem and the contribution

A factor model makes portfolio optimization fast because a large covariance matrix can be represented by a small factor covariance matrix plus a diagonal residual covariance matrix. Short selling creates a subtle obstacle. If the same stock is represented by a nonnegative long holding and a separate nonnegative short holding, their residual returns are perfectly negatively correlated. A conventional factor-model optimizer that treats the two residuals as independent therefore uses an incorrect covariance matrix.

The main result identifies conditions under which that apparently incorrect input nevertheless produces the correct mean–variance frontier. Under **Property P**, any feasible simultaneous long and short position in one risky security can be canceled, with adjustments only to zero-risk positions, without lowering expected return. Cancellation leaves the true risk unchanged. The covariance approximation penalizes precisely the offsetting positions that can be removed. Thus its overstatement of risk does not alter the frontier or the economically relevant trimmed solutions.

This is a theorem about an optimization problem and its feasible set, not a claim that the altered covariance matrix describes returns correctly. It also distinguishes factor or scenario models with residual risk from an exact historical-covariance representation. The historical case does not need Property P because there is no omitted residual covariance term.

## 2. General mean–variance optimization and the critical-line algorithm

The underlying problem maximizes expected return and minimizes variance subject to finite linear restrictions. With nonnegative variables after introducing slacks or splitting free variables,

\[
E(X)=\mu^TX,\qquad V(X)=X^TCX,\qquad AX=b,\quad X\ge0.
\]

The covariance matrix is positive semidefinite; it need not be nonsingular. The constraint matrix may also be rank deficient, provided the optimization problem is properly handled. Feasibility and existence matter: an unbounded positive-mean, zero-risk direction can prevent a finite efficient solution.

For a return-preference parameter \(\lambda_E\), solve the equivalent quadratic program

\[
\min_X\;\tfrac12X^TCX-\lambda_E\mu^TX.
\]

Holding the active set fixed, the stationarity and equality conditions form a linear system with a block matrix of the form

\[
\begin{pmatrix}C_{II}&A_I^T\\A_I&0\end{pmatrix}
\begin{pmatrix}X_I\\\eta\end{pmatrix}
=
\begin{pmatrix}\lambda_E\mu_I\\b\end{pmatrix}.
\]

Consequently the free holdings are affine in \(\lambda_E\) between changes in the active set. As the parameter moves, a free nonnegative holding can hit zero, or the reduced gradient of an excluded holding can reach the value permitting entry. These events determine the next critical line. Portfolio weights are piecewise linear in the parameter, while the corresponding mean–variance frontier consists of parabolic pieces.

The algorithm produces a complete nonredundant representation of the frontier: one efficient portfolio for each represented mean–variance point, rather than every portfolio sharing that point when the covariance is singular. At \(\lambda_E\downarrow0\), it reaches an efficient minimum-variance portfolio; not every minimum-variance portfolio is efficient if several have different means.

The computational gain from factor or scenario structure is principally a reduction in the work required to solve the active-set equations. It is not a theorem that the number of active-set changes becomes small.

## 3. Exact factor-model reformulation

Write risky returns as

\[
r=\alpha+Bf+u,\qquad \operatorname{Cov}(f)=F,
\quad\operatorname{Cov}(u)=D,
\]

where residuals are uncorrelated with the factors and \(D\) is diagonal. The ordinary covariance is

\[
C=BFB^T+D.
\]

Introduce fictitious holdings \(y=B^Tx\), one for each factor. Portfolio variance can then be evaluated as

\[
x^TDx+y^TFy,
\]

with the linear equality linking \(y\) to actual positions. The fictitious securities are computational variables, not additional investment opportunities. They may take either sign and must remain linked to the physical portfolio. If factors are uncorrelated, the augmented variance matrix is diagonal; otherwise it has a small factor block and a diagonal residual block.

This formulation preserves the objective exactly. Its usefulness comes from retaining sparse constraints and avoiding a dense asset-by-asset covariance matrix. Factor exposures need not sum to one and do not satisfy investment-budget restrictions independently of the actual positions.

## 4. Scenario and historical covariance representations

The scenario model is more general than a collection of deterministic return observations. Suppose scenario \(s\) has probability \(p_s\), conditional asset mean \(\mu_{is}\), and conditional idiosyncratic variance \(v_{is}\), with conditional residuals uncorrelated across assets. Let

\[
\mu_i=\sum_sp_s\mu_{is},\qquad
 y_s=\sum_i x_i(\mu_{is}-\mu_i),\qquad
 d_i=\sum_sp_sv_{is}.
\]

The law of total variance gives

\[
V(x)=\sum_i d_ix_i^2+\sum_sp_sy_s^2.
\]

The first term is average within-scenario residual risk; the second is between-scenario variation in conditional portfolio means. Introducing \(y_s\) with linear linking equations again produces a structured quadratic program. Ignoring within-scenario residuals changes the economic model unless these variances really are zero.

A historical covariance matrix admits a related exact representation. For centered observed returns \(r_{it}-\bar r_i\), define

\[
y_t=\sum_i x_i(r_{it}-\bar r_i).
\]

Sample variance is a common normalization times \(\sum_t y_t^2\). Here the residual diagonal term is zero. This is particularly useful with many more securities than observations, when the asset covariance is necessarily singular. Forecast expected returns can be supplied separately; they need not equal the historical means used to center the covariance sample.

A split long–short representation of historical returns preserves covariance exactly because the short history is the negative of the long history, apart from deterministic financing terms. Theorem 1 therefore permits the historical algorithm regardless of Property P. Transferring the Property P requirement to every historical-covariance problem would be too restrictive.

## 5. Modeling real short-sale cash flows

A short position is not simply a negative long holding whose sale proceeds can always be reinvested without restriction. The paper discusses restrictions on the use of proceeds, margin requirements, interest rebates, borrowing charges, and limits on shortability. These institutional arrangements affect the feasible set and expected returns.

Represent each underlying stock by long and short magnitudes \(l_i,s_i\ge0\). With a deterministic cash rate \(r_c\) and rebate fraction \(h_i\), the short return per unit of short exposure is modeled as

\[
-r_i+h_i r_c.
\]

Thus its expected return is \(-\mu_i+h_i r_c\), while its random exposure is the negative of the underlying stock. A rebate fraction below one reflects the loss of part of the interest on restricted proceeds; a negative effective rebate can represent an expensive borrow. Cash lending and cash borrowing can have different rates and are modeled as separate zero-variance positions.

The authors' institutional examples are dated to their setting. Actual constraints must be built from the investor's arrangements, rather than inferred from the algebra or treated as current universal margin rules. Broker collateral and investor margin are different quantities. The paper's illustrative gross-exposure bound corresponds to a particular margin setup; the results apply to much more general linear restrictions.

Taxes, stochastic borrow costs, recalls, nonlinear transaction costs, and changes in margin requirements are not incorporated in the displayed one-period return formula. If financing becomes random and correlated with securities, treating it as a zero-variance adjustment can fail.

## 6. Why the conventional factor input is wrong

For one underlying stock, the long residual is \(u_i\) and the short residual is \(-u_i\). Their covariance is \(-d_i\), not zero. In block notation the correct residual covariance is

\[
\begin{pmatrix}D&-D\\-D&D\end{pmatrix},
\]

while a conventional factor model supplied with two apparently distinct securities uses

\[
\begin{pmatrix}D&0\\0&D\end{pmatrix}.
\]

The signed factor loadings remain \((B,-B)\). Consequently true and modified variances are

\[
V(l,s)=\{B^T(l-s)\}^TF\{B^T(l-s)\}
       +\sum_i d_i(l_i-s_i)^2,
\]

\[
\widetilde V(l,s)=\{B^T(l-s)\}^TF\{B^T(l-s)\}
       +\sum_i d_i(l_i^2+s_i^2).
\]

Subtracting gives the central identity

\[
\boxed{\widetilde V-V=2\sum_i d_i l_i s_i\ge0.}
\]

The altered model is an upper bound on true variance. It is exact when positions are **trim**, meaning that a risky security is never held both long and short. For strictly positive residual variances, any overlap produces strict overstatement. When all residual variances vanish, as in the historical representation, the equality holds for every portfolio.

## 7. Property P and the frontier-equivalence proof

Property P is a dominance property of the complete model, including expected financing returns. For every feasible portfolio with \(l_i,s_i>0\), it must be possible to reduce both by their common minimum, retain all other risky holdings, and alter only zero-variance positions so that the result remains feasible and has expected return at least as large.

Cancellation preserves every risky net holding and therefore true variance. Applying the operation repeatedly produces a trim portfolio. The no-loss-in-mean condition is indispensable; merely having feasible net positions does not establish the result.

The frontier argument can be expressed in three steps:

1. Every feasible portfolio is dominated, or matched, under the true model by a feasible trim portfolio.
2. True and modified variances agree on all trim portfolios.
3. The modified model assigns no lower variance to any untrim portfolio, because its error is nonnegative.

Thus the best mean available at a given efficient risk level is the same in both models. A trim optimum for the original problem is optimal for the modified one, and modified efficient portfolios with positive residual variances must be trim. In the original model there may still be untrim portfolios tied with trimmed ones, for example when canceling positions produces no change in financing income. The theorem should therefore not be described as equality of every feasible risk estimate or every redundant portfolio representation.

Positive residual variances provide strict convexity in economically distinct risky net holdings. This supports uniqueness of the relevant trimmed risky portfolio at an efficient point. A claim of uniqueness of the entire augmented vector also needs nonredundancy among zero-variance cash variables, slacks, and fictitious representations. Duplicating a cash instrument can create multiple augmented vectors with identical risky holdings, mean, and variance.

## 8. Constraints that satisfy Property P—and those that may not

The paper supplies a sufficient class incorporating upper bounds on gross exposure, individual position bounds, restrictions on net exposure, and a budget with cash lending and borrowing. Trimming reduces gross exposure and leaves net risky exposures unchanged. If canceling a long position frees principal that can be transferred to cash, the expected-return change in the simple rebate model is

\[
\Delta E=\theta(1-h_i)r_c,
\qquad \theta=\min(l_i,s_i).
\]

It is nonnegative when \(h_i\le1\) and \(r_c\ge0\). The nonnegative cash-rate condition is an economic assumption in this argument; \(h_i\le1\) alone does not suffice if the rate is negative. More generally, use the actual cash-flow changes to test Property P directly.

Cash caps can invalidate the necessary adjustment. Required gross exposure, lower bounds on separate long and short books, or restrictions that distinguish offsetting positions can also prevent trimming. A tax benefit from maintaining both sides would additionally change the expected-return comparison, outside the paper's tax-free model.

A concrete diagnostic example illustrates the issue without relying on a vague statement that cash caps are always harmful. Suppose the model permits \(l=s=1\), has deterministic rebate \(h r_c\), and caps cash at \(u<h\). The offsetting risky positions have true variance zero and expected rebate \(h r_c\). Under the modified residual covariance, any such overlap has positive risk. Its zero-risk portfolios can earn at most \(u r_c\) from capped cash, absent another offsetting financing instrument. The two zero-risk frontier endpoints then differ. This is an illustrative construction of the mechanism; the particular numerical assumptions must be made consistent with the remaining margin and funding constraints.

## 9. The numerical example and the scale of the computational gain

The example has three stocks, with expected long returns 10%, 12%, and 16%; one-factor betas 0.8, 1, and 1.25; factor variance 0.04; and residual variances 0.0768, 0.1200, and 0.1875. Thus total variances are 0.1024, 0.1600, and 0.2500, and covariances are 0.032, 0.040, and 0.050.

The cash lending rate is 3%, the borrowing rate 5%, and each rebate fraction is one-half. Expected short returns are consequently −8.5%, −10.5%, and −14.5%. These numbers emphasize that a short's mean is not simply the negative long mean. Its beta is the negative long beta, and the correct long–short residual covariance is the negative residual variance.

With a fictitious portfolio-beta security, a long-only one-factor model requires \(2n+1\) covariance-structure coefficients rather than \(n(n+1)/2\) arbitrary covariances. At \(n=1{,}000\), these counts are 2,001 and 500,500. A 500-stock long–short model has 1,000 split risky variables and the same corresponding count comparison, plus its linking constraint and auxiliary factor variable.

Endnote 16 gives operation counts per iteration for the one-factor algorithm. For \(n=1{,}000\) and 10 active securities, the structured version requires about 3,070 multiplications and divisions versus 25,190 in the general version. With 100 active securities, the comparison is about 3,700 versus 269,900. These are algorithmic arithmetic counts, not measured wall-clock timings or a trading backtest. Factor count, constraints, numerical linear algebra, and the sequence of active sets affect actual speed.

## 10. Implementation and interpretation

An implementation should retain distinct long, short, cash, and borrowing variables when their economic cash flows differ. Construct signed factor exposures and expected short returns from those arrangements. Verify Property P for the entire feasible set before dropping the long–short residual covariance blocks. Then compare small test instances against a general quadratic program using the full correct covariance.

For a returned portfolio, compute risk from net underlying exposures and the true covariance. Check overlap explicitly: substantial simultaneous long and short positions in a positive-residual-risk security can indicate solver tolerances, degeneracy, a failed Property P assumption, or a misconstructed objective. Validate the funding equations and bound conventions separately from numerical optimality.

The paper supplies an exact computational shortcut under a recognizable economic dominance condition. It does not justify ignoring arbitrary correlations, replace estimation of factor risk, or demonstrate out-of-sample portfolio improvement. Its practical value is to combine realistic linear short-sale restrictions with the computational structure of factor, scenario, and historical covariance models while stating when that combination is mathematically valid.
