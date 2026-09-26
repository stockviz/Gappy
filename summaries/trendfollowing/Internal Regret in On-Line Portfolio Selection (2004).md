# Internal Regret in On-Line Portfolio Selection

**Authors:** Gilles Stoltz, Gabor Lugosi
**Year:** 2004
**Journal/Venue:** Machine Learning, 59, 125--159 (Kluwer Academic Publishers). Extended abstract in Proceedings of the 16th Annual Conference on Learning Theory and 7th Kernel Workshop, Springer, 2003.

## Problem statement

The EG strategy of Helmbold et al. (1998) and Cover's universal portfolio (1991) achieve small *external regret* (worst-case log-wealth ratio versus the best constantly rebalanced portfolio). But external regret does not preclude a more subtle inefficiency: the investor may systematically regret, for every pair of assets $(i,j)$, not having shifted all capital allocated to stock $i$ into stock $j$. This pairwise notion is *internal regret*, imported from the game-theoretic prediction literature (Foster--Vohra 1998, 1999; Hart--Mas-Colell 2000, 2001). The paper asks: can one design sequential portfolio strategies whose cumulative internal regret grows sublinearly in $n$ (number of trading periods) for all market sequences, while simultaneously achieving a small worst-case logarithmic wealth ratio versus constantly rebalanced portfolios?

## Approach (short)

Adapt the internal-regret framework from sequential prediction with expert advice to the on-line portfolio setting, where the loss function $\ell'(\mathbf{Q}, \mathbf{x}) = -\ln \mathbf{Q} \cdot \mathbf{x}$ is concave rather than linear. Introduce a conversion trick that turns any external-regret-minimizing algorithm over $N(N-1)$ fictitious modified strategies into an internal-regret-minimizing portfolio, via a fixed-point equation solved by Gaussian elimination at each period. Propose four concrete algorithms (B1EXP, B1POL, B2POL, GBH) with provable sublinear internal regret, and show that B1EXP additionally matches the EG strategy's external-regret bound versus constantly rebalanced portfolios. Extend the notion to *generalized* internal regret (all column-stochastic linear departures) and construct a universal-portfolio-style algorithm achieving $O(N^2 \ln n)$ generalized internal regret.

## Approach (detailed)

### Background: external vs. internal regret in prediction

1. **External regret (prediction).** A predictor chooses distributions $\mathbf{P}_t$ over $N$ experts at each round $t$. External regret after $n$ rounds:

$$\sum_{t=1}^n \ell_t(\mathbf{P}_t) - \min_{i=1,\ldots,N} \sum_{t=1}^n \ell_{i,t}.$$

The exponentially weighted average (EWA) predictor with $\eta = B^{-1}\sqrt{8\ln N/n}$ achieves external regret $\le B\sqrt{(n/2)\ln N}$ when losses $\ell_{i,t} \in [0,B]$. A time-adaptive version with $\eta_t = B^{-1}\sqrt{8\ln N/t}$ removes the need to know $n$ (Theorem 1: bound $B(2\sqrt{(n/2)\ln N} + \sqrt{\ln N / 8})$).

2. **Internal regret (prediction).** For each pair $(i,j)$, the $i \to j$ *modified strategy* $\mathbf{P}_t^{i \to j}$ shifts all mass from expert $i$ to expert $j$. Internal regret:

$$\max_{i,j \in \{1,\ldots,N\}} R_{(i,j),n}, \quad R_{(i,j),n} = \sum_{t=1}^n P_{i,t}(\ell_{i,t} - \ell_{j,t}).$$

Key relationship (exact): external regret $= \max_j \sum_i R_{(i,j),n}$, so small internal regret implies small external regret (up to factor $N$), but not conversely. Example 1 proves the EWA predictor can have $\Theta(n)$ internal regret (three-expert, three-regime construction).

### Conversion trick: external to internal regret

3. **Core construction.** Define $N(N-1)$ fictitious experts indexed by pairs $(i,j)$, $i \ne j$, with losses at time $s$ equal to $\ell_s(\mathbf{P}_s^{i \to j})$. Run an external-regret-minimizing algorithm (EWA or polynomial) over these fictitious experts, producing a distribution $\boldsymbol{\Delta}_t = (\Delta_{(i,j),t})_{i \ne j}$, and choose $\mathbf{P}_t$ satisfying the fixed-point equality:

$$\mathbf{P}_t = \sum_{(i,j): i \ne j} \Delta_{(i,j),t} \mathbf{P}_t^{i \to j}.$$

4. **Existence and computation (Lemma 1).** More generally, for any distribution $\mathbf{Q}$ and $\alpha \in [0,1]$:

$$\mathbf{P} = (1 - \alpha) \sum_{i \ne j} \Delta_{(i,j)} \mathbf{P}^{i \to j} + \alpha \mathbf{Q}$$

has a solution $\mathbf{P}$ computable by Gaussian elimination on an $N \times N$ matrix $S = A + I_N$, where $A_{m,i} = w_{m,i}$ for $i \ne m$ and $A_{m,m} = -\sum_{j \ne m} w_{j,m}$, with $w_{m,i} = (1-\alpha)\Delta_{(i,m)} + \alpha Q_m$. $S$ is column-stochastic, so the fixed point exists and is a probability distribution.

5. **Internal regret bound (Theorem 3).** Using the EWA forecaster over the $N(N-1)$ fictitious experts with $\eta = 4B^{-1}\sqrt{\ln N/n}$:

$$\max_{i \ne j} R_{(i,j),n} \le B\sqrt{n \ln N}.$$

With time-adaptive $\eta_t$: bound becomes $B(2\sqrt{n \ln N} + \sqrt{\ln N}/2)$. With polynomial forecaster of order $p \ge 1$: bound $B\sqrt{(p-1)n N^{4/p}}$.

### Sequential portfolio selection and internal regret

6. **Portfolio setting.** Market vector $\mathbf{x}_t = (x_{1,t}, \ldots, x_{N,t}) \in \mathbb{R}_+^N$ (price relatives). Portfolio $\mathbf{P}_t \in \mathcal{X}$ (simplex). Wealth factor $S_n = \prod_{t=1}^n \mathbf{P}_t \cdot \mathbf{x}_t$. Loss function $\ell'(\mathbf{Q}, \mathbf{x}) = -\ln \mathbf{Q} \cdot \mathbf{x}$ is *not* linear in $\mathbf{Q}$ -- this is the key difficulty versus the prediction setting.

7. **Internal regret for portfolios.** The $i \to j$ modified portfolio $\mathbf{P}_t^{i \to j}$ sets $P_{i,t} = 0$, $P_{j,t} \leftarrow P_{j,t} + P_{i,t}$, others unchanged. The instantaneous internal regret for pair $(i,j)$ at time $t$:

$$\widetilde{r}_{(i,j),t} = \ln \frac{\mathbf{P}_t^{i \to j} \cdot \mathbf{x}_t}{\mathbf{P}_t \cdot \mathbf{x}_t}.$$

Cumulative internal regret: $\widetilde{R}_n = \max_{1 \le i,j \le N} \sum_{t=1}^n \widetilde{r}_{(i,j),t}$.

8. **Negative examples.** Both buy-and-hold (Example 2) and EG (Example 3) can have $\Theta(n)$ internal regret for bounded markets. The EG lower bound uses a three-stock, three-regime construction where $R_{(B,C),n} \ge \gamma n - O(\sqrt{n})$ for some $\gamma > 0$.

### B1EXP: linear upper bound approach

9. **Key inequality.** By concavity of $\ln$:

$$\widetilde{R}_{(i,j),n} \le \sum_{t=1}^n P_{i,t}\left(\frac{x_{j,t}}{\mathbf{P}_t \cdot \mathbf{x}_t} - \frac{x_{i,t}}{\mathbf{P}_t \cdot \mathbf{x}_t}\right).$$

Define pseudo-losses $\ell_{i,t} = -x_{i,t}/(\mathbf{P}_t \cdot \mathbf{x}_t)$. Under boundedness $m \le x_{i,t} \le M$, these are in $[-M/m, 0]$, enabling the conversion trick of Section 3.

10. **B1EXP algorithm.** Apply exponential weighting over the $N(N-1)$ fictitious modified strategies with $\eta = 4(m/M)\sqrt{(\ln N)/n}$, solve the fixed-point equation at each period.

11. **Theorem 4.** Assume $m \le x_{i,t} \le M$ for all $i, t$. Then:
    - Internal regret: $\widetilde{R}_n \le \frac{M}{m}\sqrt{n \ln N}$.
    - Worst-case log-wealth ratio versus CRPs: $W_n(P, \mathcal{Q}) \le N \cdot \frac{M}{m}\sqrt{n \ln N}$.

    *Proof sketch.* The internal regret bound follows directly from the linear upper bound on $\widetilde{R}_{(i,j),n}$ and Theorem 3. For the wealth ratio, use the decomposition $\ln(\prod \mathbf{B} \cdot \mathbf{x}_t / \prod \mathbf{P}_t \cdot \mathbf{x}_t) \le \sum_j B_j \sum_i (\sum_t P_{i,t}(\ell_{i,t} - \ell_{j,t}))$, and bound the right side by $N$ times the internal regret.

12. **Computation.** Requires inverting an $N \times N$ matrix per period -- feasible for $N \lesssim 100$.

### B1POL and B2POL: polynomial weighting variants

13. **B1POL.** Replace exponential weighting by polynomial weighting (order $p$) in the conversion trick. Bound: $\widetilde{R}_n \le (M/m)\sqrt{(p-1)n N^{2/p}}$, optimized at $p \approx 4\ln N$.

14. **B2POL.** Uses the exact (non-linearized) internal regret $\widetilde{r}_{(i,j),t}$ with polynomial weighting and the Blackwell condition:

$$\sum_{i \ne j} \Delta_{(i,j),t} \widetilde{r}_{(i,j),t} \le 0.$$

Weights $\Delta_{(i,j),t} \propto (\widetilde{R}_{(i,j),t-1})_+^{p-1}$, and the fixed point $\mathbf{P}_t = \sum_{i \ne j} \Delta_{(i,j),t} \mathbf{P}_t^{i \to j}$ is enforced directly.

15. **Theorem 5.** B2POL: $\widetilde{R}_n \le (\ln M/m)\sqrt{(p-1)n N^{2/p}}$. Note the factor $\ln(M/m)$ vs. $M/m$ for B1POL/B1EXP -- a meaningful improvement when $M/m$ is large.

### GBH and GBH2: generalized buy-and-hold

16. **GBH.** Performs buy-and-hold on the $N(N-1)$ fictitious modified strategies via the conversion trick. At each round:

$$\mathbf{P}_t = \sum_{i \ne j} \frac{W_{t-1}^{i \to j}}{\sum_{k \ne l} W_{t-1}^{k \to l}} \mathbf{P}_t^{i \to j},$$

where $W_t^{i \to j} = \prod_{s=1}^t \mathbf{P}_s^{i \to j} \cdot \mathbf{x}_s$. Telescoping argument yields:

17. **Theorem 6.** $\widetilde{R}_n \le \ln N(N-1)$ for all $n$ -- a *constant* (in $n$) internal regret bound, independent of market behavior. However, GBH does not guarantee small external regret versus CRPs or even buy-and-hold.

18. **GBH2.** Mixes GBH with a buy-and-hold component across single stocks:

$$\mathbf{P}_t = \frac{\sum_k S_{t-1}(k)\mathbf{e}_k + \sum_{i \ne j} W_{t-1}^{i \to j} \mathbf{P}_t^{i \to j}}{\sum_k S_{t-1}(k) + \sum_{i \ne j} W_{t-1}^{i \to j}}.$$

Both internal regret and external regret versus buy-and-hold are $\le 2\ln N$.

### Generalized internal regret and universal portfolio

19. **Generalized internal regret.** Replace pairwise $i \to j$ transfers with all column-stochastic matrices $\mathbf{A} \in \mathcal{A}$: modified strategy $\mathbf{P}_t^{\mathbf{A}} = \mathbf{A}\mathbf{P}_t$. Generalized internal regret:

$$\max_{\mathbf{A} \in \mathcal{A}} \ln \frac{W_n^{\mathbf{A}}}{W_n}, \quad W_n^{\mathbf{A}} = \prod_{t=1}^n \sum_{i=1}^N P_{i,t}^{\mathbf{A}} x_{i,t}.$$

This is an uncountable class of departures.

20. **Theorem 7.** There exists a strategy $P$ (a Cover-style universal portfolio over column-stochastic matrices) such that:

$$\max_{\mathbf{A} \in \mathcal{A}} \ln \frac{W_n^{\mathbf{A}}}{W_n} \le N(N-1)\ln(n+1) + 1.$$

*Proof.* Define the measure $\nu$ over $\mathcal{A}$ as the product of $N$ independent uniform measures on the simplex (one per column). Set $\mathbf{P}_t = \int_{\mathcal{A}} W_{t-1}^{\mathbf{A}} \mathbf{P}_t^{\mathbf{A}} \, d\nu(\mathbf{A}) / \int_{\mathcal{A}} W_{t-1}^{\mathbf{A}} \, d\nu(\mathbf{A})$. Then $W_n = \int_{\mathcal{A}} W_n^{\mathbf{A}} \, d\nu(\mathbf{A})$. For any fixed $\mathbf{A}$, the $\alpha$-neighborhood $\chi_{\alpha, \mathbf{A}}$ (column-stochastic matrices within $(1-\alpha)\mathbf{A} + \alpha \mathbf{z}$) satisfies $\nu(\chi_{\alpha,\mathbf{A}}) = (\alpha^{N-1})^N$ and $W_n^{\mathbf{A}'} \ge (1-\alpha)^n W_n^{\mathbf{A}}$ for $\mathbf{A}' \in \chi_{\alpha,\mathbf{A}}$. Set $\alpha = 1/(n+1)$ to get the bound. Computation requires $N \times N$ matrix inversion per period, but the matrix elements involve integrals over $\mathcal{A}$ -- computationally exponential in $N$ in general.

### Experimental results (Appendix)

21. NYSE data, 36 stocks, daily/monthly rebalancing, with and without transaction costs (1% daily, 2% monthly). B1EXP is the overall best performer: it outperforms EG in 80--100 out of 100 random stock samples (3--25 stocks), with especially large gains for monthly rebalancing and larger portfolios. B1EXP is also more robust to the learning rate $\eta$ than EG. The polynomial variants B1POL and B2POL exhibit excessive volatility (huge standard deviations) due to aggressive reallocation, making them impractical despite comparable theoretical guarantees. GBH performs well under transaction costs owing to its buy-and-hold nature.

## Domain of applicability

- **Strongest regime.** Moderate number of assets ($N \lesssim 100$) with bounded price relatives ($m \le x_{i,t} \le M$, ratio $M/m$ not too large). B1EXP is the practical recommendation.
- **Advantage over EG.** B1EXP achieves the same $O(\sqrt{n \ln N})$ worst-case external regret rate as EG but additionally guarantees sublinear internal regret. Experimentally, B1EXP is more stable and more robust to learning-rate misspecification than EG.
- **Internal regret as stability.** The authors argue that minimizing internal regret is related to portfolio stability: the investor cannot identify a simple pairwise reallocation that would have systematically improved wealth. The experiments confirm lower volatility of achieved wealth for B1EXP versus EG.
- **Transaction costs.** No explicit treatment in the theory; GBH is empirically advantaged under heavy costs due to low turnover. B1EXP degrades more gracefully than EG.
- **Computational cost.** B1EXP/B1POL/B2POL/GBH all require $O(N^2)$ per period (fixed-point solve via $N \times N$ matrix inversion), versus $O(N)$ for EG. The generalized universal portfolio (Theorem 7) is exponential in $N$.
- **Polynomial weighting.** Theoretically comparable to exponential but empirically inferior -- too aggressive reallocation. Not recommended in practice.
- **Horizon dependence.** B1EXP with fixed $\eta$ requires knowledge of $n$ and $M/m$. A time-adaptive $\eta_t$ or doubling trick removes this at the cost of slightly worse constants.
- **Limitation of the internal-regret criterion.** Small internal regret does *not* automatically imply small external regret versus CRPs in the portfolio setting (unlike in prediction with linear losses). Theorem 4 provides the external-regret bound for B1EXP as a separate result using the linear upper bound. GBH achieves $O(1)$ internal regret but can have unbounded external regret versus CRPs.
