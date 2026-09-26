# 1. Metadata

- **Title:** On the History of the Growth Optimal Portfolio
- **Author(s):** Morten Mosegaard Christensen
- **Year:** 2005
- **Journal/Venue:** survey / draft paper

# 2. Problem statement

The paper asks a survey question with a definite theoretical core: **what exactly is the growth-optimal portfolio (GOP), how has it been characterized in discrete and continuous time, and what claims about long-run dominance, utility optimality, and derivative pricing are actually justified by the underlying theorems?**

# 3. Approach (short)

The method is a literature survey organized around the mathematical properties of the GOP. Christensen starts from the discrete-time log-optimal portfolio, then reviews the continuous-time formulation, the numéraire/supermartingale property, the long-running dispute over whether the GOP should be held by all investors, and the later use of the GOP as a pricing numéraire in the benchmark approach. The value of the paper is synthesis and separation of what is proved from what was historically overclaimed.

# 4. Approach (detailed)

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
   Applying Jensen’s inequality to the exponential then yields the supermartingale property of the benchmarked wealth ratio. The survey repeatedly returns to this argument because it underlies both long-run dominance and pricing.

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
   - complete markets where this coincides with risk-neutral pricing;
   - incomplete markets where it becomes a specific pricing rule rather than a no-arbitrage necessity.

7. **What the survey argues against**

   A historical theme of the article is that the GOP does **not** imply every investor should hold the same portfolio. Long-run growth optimality, log-utility optimality, and pricing-numéraire status are different claims. The survey’s novel contribution is largely to disentangle them and document where the literature slid from one statement to another without proof.

# 5. Domain of applicability

The survey is applicable wherever the GOP is invoked: gambling/Kelly problems, long-run portfolio choice, and benchmark pricing. The strongest rigor lies in the discrete- and continuous-time numéraire property and in long-run growth arguments under admissibility and integrability conditions. The broader “everyone should hold the GOP” interpretation is explicitly criticized as going beyond the proofs. Likewise, GOP-based pricing is fully compelling in complete markets or as a benchmark-approach choice, but it is not forced by arbitrage theory in general incomplete markets.
