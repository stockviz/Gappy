# Seeking Alpha? It's a Bad Guideline for Portfolio Optimization
**Authors:** Moshe Levy, Richard Roll
**Year:** 2016
**Journal/Venue:** Journal of Portfolio Management

## Problem statement

Alpha is often treated as the natural direction in which to tilt a benchmark portfolio. Levy and Roll ask whether that is actually true once the weight change is finite rather than infinitesimal. Their answer is no: alpha is a local gradient, not a reliable guide for practical portfolio optimization.

## Approach (short)

The paper starts from the fact that alpha relative to a benchmark portfolio is proportional to the derivative of the portfolio's Sharpe ratio with respect to an asset's weight. It then studies what happens when one actually shifts weights by a non-infinitesimal amount in the direction of that alpha vector and compares the achieved Sharpe ratio with the true optimum at the same distance from the benchmark.

## Approach (detailed)

### 1. Interpret alpha as a local derivative

For a benchmark portfolio `B`, asset `i` has alpha

$$
\alpha_i = E[R_i] - R_f - \beta_i\,(E[R_B]-R_f).
$$

The paper's key observation is that `\alpha_i` is proportional to the derivative of the portfolio Sharpe ratio with respect to the asset's weight at the benchmark. So the alpha vector points in the direction of maximal increase in Sharpe ratio for an **infinitesimal** perturbation.

### 2. Distinguish infinitesimal from finite moves

This distinction is the whole paper. If one changes the portfolio only by `d x`, then the local gradient is informative. But practical portfolio optimization requires a finite shift:

$$
\Delta x_i = x_i^* - x_i^B,
$$

often subject to a distance constraint from the benchmark.

Once the move is not infinitesimal:

- betas change,
- alphas change,
- the gradient at the starting point is no longer the correct direction.

### 3. Compare two optimization procedures

The paper compares:

- an alpha-guided portfolio that shifts weights from the benchmark in the direction of the original alpha vector,
- the true optimal portfolio that maximizes Sharpe ratio subject to the same distance from the benchmark.

The distance is measured as an average deviation in weights from the benchmark. This lets the paper ask a clean question: for a given amount of active risk budget, how much Sharpe is lost by following alpha rather than solving the actual optimization?

### 4. Run the experiment on a realistic benchmark

The benchmark is the value-weighted portfolio of the largest stocks. The paper then computes the Sharpe ratio of:

- the benchmark,
- the alpha-shifted portfolio,
- the truly optimal portfolio,

as the allowed deviation from the benchmark increases.

### 5. Show the local-gradient failure

For very small deviations, alpha works as the differential argument says it should. But the deterioration is rapid. At small but finite distances, the alpha-guided portfolio produces a Sharpe ratio well below the optimum. The paper emphasizes that even modest deviations from benchmark can make the alpha direction materially suboptimal.

The economic reason is simple:

- alpha is a first-order object,
- portfolio choice is nonlinear in weights,
- the relevant gradient moves as soon as the portfolio moves.

### 6. Implementation lesson

If one insists on using alpha, it must be updated iteratively after each tiny move. But once one admits that, one is already conceding the main point: direct optimization dominates one-shot alpha ranking.

### 7. What a reader should implement

To reproduce the paper:

1. choose a benchmark portfolio;
2. compute each asset's alpha relative to that benchmark;
3. build a portfolio by shifting weights in the alpha direction for a given distance `D`;
4. separately solve the true Sharpe-ratio optimization under the same `D`;
5. compare resulting Sharpe ratios.

The gap between steps 3 and 4 is the paper's core empirical object.

## Domain of applicability

- **Where it works well:** Portfolio construction problems benchmarked to an existing portfolio.
- **What is implementable:** Direct constrained optimization or iterative re-estimation, rather than static alpha tilts.
- **Main limitation:** The paper is about optimization geometry, not about estimating expected returns themselves.
- **Why the paper matters:** It punctures the common shortcut of treating alpha as a practical optimizer rather than a local derivative.
