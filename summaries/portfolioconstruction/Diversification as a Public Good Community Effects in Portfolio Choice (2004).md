# Diversification as a Public Good Community Effects in Portfolio Choice (2004)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/Diversification as a Public Good- Community Effects in Portfolio Choice.pdf>), 40 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Diversification as a Public Good: Community Effects in Portfolio Choice
- **Author(s):** Peter M. DeMarzo, Ron Kaniel, Ilan Kremer
- **Year:** 2004
- **Journal/Venue:** *Journal of Finance*

# 2. Problem statement

The paper studies whether individual portfolio choices can create an externality when agents compete for community-specific nontradable goods or services. In an otherwise rational general-equilibrium setting with complete financial markets, the question is whether borrowing constraints and local goods can induce investors to herd into correlated risky portfolios, thereby generating inefficient undiversified equilibria.

# 3. Approach (short)

The method is general equilibrium with segmented communities and borrowing-constrained participation. The model first shows that without the relevant friction, the usual diversified benchmark emerges. It then introduces local goods and collateral constraints, derives each investor’s best-response portfolio volatility as a function of community volatility, and studies fixed points of that best-response map. The main contribution is to show that diversification failure can arise endogenously even without irrational utility.

# 4. Approach (detailed)

1. **Community structure**

   Agents are partitioned into communities that consume community-specific local goods in addition to global goods. Prices of local goods move with community wealth, so a household cares about its wealth relative to others in the same community.

   In the frictionless benchmark, this relative-wealth effect is neutralized at the community aggregate: each representative community holds the market portfolio and the allocation is Pareto efficient. Individual portfolios may also hedge different local endowments.

2. **Borrowing constraints and asymmetric market participation**

   The friction is that local goods are poor collateral. Agents endowed mainly with local resources are more constrained in financial markets than agents endowed with globally tradable wealth. As a result, the set of investors actively trading securities is tilted toward those who want their financial wealth to covary positively with community wealth. This breaks the offsetting-trade logic of the benchmark model.

3. **Two-state reduction**

   In the core two-state example, investor $i$ in community $j$ chooses a portfolio payoff
   $$
   z_i=
   \begin{cases}
   \bar z_i(1+\sigma_i), & s=1,\\
   \bar z_i(1-\sigma_i), & s=2,
   \end{cases}
   $$
   where $\sigma_i$ measures portfolio volatility/bias and community volatility is $\sigma$. Taking community wealth as given, the investor chooses $\sigma_i$ to equalize marginal utility across states.

4. **Best-response function**

   The first-order condition implies
   $$
   \frac{h(1+\sigma)}{1+\sigma_i}=\frac{h(1-\sigma)}{1-\sigma_i},
   $$
   hence
   $$
   \sigma_i=m(\sigma)\equiv
   \frac{h(1+\sigma)-h(1-\sigma)}{h(1+\sigma)+h(1-\sigma)}.
   $$
   Equilibrium requires the fixed-point condition
   $$
   \sigma = m(\sigma).
   $$
   This is the key reduced-form object in the paper.

5. **Properties of the best-response map**

   Lemma 4 establishes:
   - $m(0)=0$,
   - $m$ is odd,
   - for $\gamma>1$, $m$ is increasing,
   - the slope at zero is
     $$
     m'(0)=\frac{\alpha(\gamma-1)}{1+\alpha},
     $$
     so $m'(0)>1$ iff
     $$
     \gamma > 2+\frac{1}{\alpha}.
     $$

   The interpretation is direct: sufficiently risk-averse agents overreact to small community tilts, so herding can become self-reinforcing.

6. **Existence of undiversified equilibrium**

   Theorem 1 states that for $\gamma>1$ investors have a herding motive, and for sufficiently large $\gamma$ the fully diversified equilibrium $\sigma=0$ coexists with undiversified equilibria $\sigma^*>0$ and $-\sigma^*$. The undiversified equilibrium emerges entirely from strategic complementarity in hedging local-good price risk.

7. **Stability**

   Using iterative best responses, Theorem 2 shows:
   - when $m'(0)>1$, full diversification is unstable,
   - the undiversified equilibrium is locally stable.

   Thus, the inefficient equilibrium is not just a mathematical curiosity; it is the dynamically attractive one under fictitious-play style adjustment.

8. **Welfare**

   Theorem 3 shows every investor prefers full diversification; every laborer does too provided individual local-good endowments are uncorrelated with firm payoffs. Under that condition the fully diversified equilibrium Pareto dominates the undiversified equilibrium. Diversification is therefore a public good: no individual wants to diversify unilaterally once the community is tilted, but everyone would be better off if the community diversified jointly.

   This is the paper’s main economic punchline. Herding is rational individually but inefficient socially.

9. **Biased or constrained traders**

   The model is then extended to include a group with exogenous bias or tighter constraints. Theorem 4 shows that any positive mass of such traders can eliminate the full-diversification equilibrium and push the whole community to a stable positive-volatility equilibrium. Rational traders amplify the bias rather than offset it because the bias changes the local-good price hedge they face.

10. **What is exact**

   - The fixed-point characterization of equilibrium in the two-state model is exact.
   - The existence, stability, and welfare theorems are exact within the model.
   - The broader claims about real-world herding are interpretations of those exact comparative statics.

# 5. Domain of applicability

- The paper applies where investors compete for local or demographic-specific nontradables and face borrowing/collateral frictions.
- It is a rational-herding theory, not a behavioral one; the mechanism does not require irrational utility.
- The clean fixed-point results come from a highly stylized two-state structure. The qualitative insight is broader than the exact formulas.
- The theory is about portfolio correlation and diversification, not security selection per se.
- The genuine novelty is showing that underparticipation and local goods make diversification a coordination problem, hence a public good.


## Economic mechanism and exact market structure

The checked article appears in *The Journal of Finance* 59(4), August 2004, pp. 1677–1715, with a final blank journal page in the local PDF. It is a theoretical general-equilibrium paper with illustrative numerical examples and a discussion of outside empirical evidence. It does not estimate a new portfolio-return backtest or establish an empirical causal effect of community membership.

There are two dates. At the first, investors trade securities paying the global consumption good. At the second, uncertainty resolves, local and global goods trade in spot markets, and agents consume. A community can be geographic or demographic: its members share demand for a good that outsiders do not value. A nursing service, local housing or location-specific labor is the motivating scarce good. Preferences depend only on each person's own consumption, not directly on rank, envy or other people's utility.

For member $i$ of community $j$, baseline utility is
$$
u_i(x_0,x_j)=\frac{x_0^{1-\gamma}+\alpha x_j^{1-\gamma}}{1-\gamma},
\qquad \alpha>0,\quad\gamma>0,
$$
with the logarithmic limit understood at $\gamma=1$. The global good is the numeraire. If the community has global resources $Z_j$ and fixed local supply $\bar X_j$, the spot-market equilibrium satisfies
$$
p_j=\alpha(Z_j/\bar X_j)^\gamma.
$$
This follows by equating each household's marginal rate of substitution to price and aggregating its demands. Greater financial wealth relative to local supply raises the local price.

The household's indirect utility for total numeraire wealth $w$ is
$$
v_i(w;p_j)=\frac{w^{1-\gamma}}{1-\gamma}\phi(p_j)^\gamma,
\qquad
\phi(p)=1+\alpha^{1/\gamma}p^{1-1/\gamma}.
$$
At equilibrium prices, $\phi(p_j)=h(Z_j/\bar X_j)$ with $h(z)=1+\alpha z^{\gamma-1}$. When differentiating with respect to an individual's wealth, the person takes the spot-price process as given. One must not differentiate through the community aggregate as if an atomistic investor directly controlled everybody's wealth. That distinction is the source of the externality.

## Why complete securities markets do not remove the distortion

In the unconstrained benchmark, households can trade claims against their local endowments. Investors within a community aggregate into a representative household whose wealth includes both financial resources and the local good:
$$
W_j=Z_j+p_j\bar X_j.
$$
Its equilibrium marginal utility of income reduces to $Z_j^{-\gamma}$. The factor arising from local prices cancels against the value of the local endowment. Complete financial markets then equalize marginal utilities across communities, so their global consumption is proportional and each **community's aggregate portfolio** is proportional to the market portfolio. Individual households with different local endowments need not each hold the market portfolio: their endowment hedges can differ.

The constrained model separates two groups. Investors hold securities but no local-good endowment; laborers own only the local good. Securities must have nonnegative terminal payoffs in every state, $Y\theta_i\ge0$, and laborers cannot pledge their future local income. A laborer has no initial securities wealth, so a nonzero affordable portfolio with nonnegative payoffs would be an arbitrage. Consequently laborers hold no securities. Investors retain an interior securities choice because their consumption needs already require positive financial wealth.

The missing trades are precisely those that would offset investors' local-price hedging demands. Investor wealth is $Z_j$, while total community wealth is $W_j$. Their marginal utility becomes
$$
v_i'(Z_j)=Z_j^{-\gamma}h(Z_j/\bar X_j)^\gamma.
$$
For $\gamma>1$, holding own wealth fixed, a higher local price raises marginal utility of financial wealth. Investors therefore want payoffs when their neighbors are rich and local goods expensive. For $\gamma<1$, the substitution response reverses the direction. At log utility the local-price effect drops out and the diversified benchmark reappears. Complete markets in global-good payoffs coexist with an inability to collateralize local endowments; completeness alone is not an efficiency guarantee once participation constraints remain.

## Fixed points, sufficient thresholds and an explicit example

In the symmetric example, each local supply is one, total global output is two, and the two states are equally likely. Firm payoffs are $(1+d,1-d)$ and $(1-d,1+d)$ with $0<d\le1$. Their total output is certain. Symmetric endowments support equal security prices. Community one receives $1+\sigma$ and $1-\sigma$, and community two receives the reverse. Here $\sigma$ is a **signed** state tilt; the standard deviation of normalized global resources is $|\sigma|$.

The best-response map is
$$
m(\sigma)=\frac{\alpha[(1+\sigma)^{\gamma-1}-(1-\sigma)^{\gamma-1}]}{2+\alpha[(1+\sigma)^{\gamma-1}+(1-\sigma)^{\gamma-1}]}.
$$
It arises by equating state marginal utilities and taking a $\gamma$th root. The individual's average wealth cancels, so the response is common to investors of different sizes. Equilibrium is $m(\sigma)=\sigma$.

A tendency to imitate and an undiversified equilibrium are distinct. For $1<\gamma\le2$, the response is increasing, but full diversification remains the only equilibrium. The stronger sufficient condition
$$
m'(0)=\frac{\alpha(\gamma-1)}{1+\alpha}>1
\quad\Longleftrightarrow\quad
\gamma>2+1/\alpha
$$
ensures exactly three symmetric equilibria: zero and a unique pair $\pm\sigma^*$. The article does not state that this simple slope threshold is a necessary characterization of all possibilities in the intermediate parameter region. For $\gamma>2$, one can instead solve the equilibrium equation for the required importance of local goods:
$$
\alpha=\frac{2\sigma}{(1-\sigma^2)[(1+\sigma)^{\gamma-2}-(1-\sigma)^{\gamma-2}]}.
$$

As an explanatory calculation, set $\alpha=1$ and $\gamma=4$. Then
$$
m(\sigma)=\frac{\sigma(3+\sigma^2)}{2+3\sigma^2},
$$
and the nonzero fixed points are $\sigma=\pm1/\sqrt2$. The derivative at zero is $3/2$, so a small positive community tilt is amplified. This is the parameter configuration illustrated in the paper's basic reaction-function discussion; the explicit algebra makes the fixed point transparent.

The investment tilt can be implemented even if it exceeds the firms' fundamental output volatility $d$. A fully invested allocation $a$ to the first firm and $1-a$ to the second produces $\sigma=d(2a-1)$, hence $a=(1+\sigma/d)/2$. If $\sigma>d$, this involves shorting the other firm. The collateral condition restricts total state payoffs, not every individual security position. The economy can therefore create risky cross-community allocations even when fundamental aggregate output is constant.

Under the specific iteration $\sigma_{n+1}=m(\sigma_n)$, every positive starting point converges monotonically to $\sigma^*$ in the high-aversion case, and every negative one to $-\sigma^*$. Zero is globally unstable except when the iteration starts exactly there. This is stability under a stipulated best-response adjustment process, not a model of actual calendar-time trading dynamics or proof that every plausible learning rule selects the same equilibrium.

## Welfare: the participation condition matters

All investors are worse off at the undiversified equilibria than at full diversification. The same statement holds for every laborer when their individual local endowments are uncorrelated with firm payoffs, as Theorem 3 requires. A constant aggregate local supply does not mean each laborer's endowment is constant. Omitting this condition overstates the Pareto comparison.

The investor proof uses the equilibrium fact that $h(Z_j)/Z_j=c$ is equal across states. Since $E[Z_j]=1$ and $h$ is strictly convex in the relevant range $\gamma>2$, a nondegenerate allocation gives
$$
c=E[h(Z_j)]>h(EZ_j)=h(1).
$$
Substituting into expected indirect utility shows the welfare loss. Thus the proof compares both state allocations and the local-price consequences of collective diversification. An individual diversifying alone faces the prevailing risky local prices and does not receive this collective gain.

This is the public-good mechanism: coordinated diversification reduces the local-price risk that induces each person to imitate an undiversified community. It also explains the counterintuitive comparison with financial integration. If two autarkic communities initially face sufficiently small local-firm output risk, integrating their securities markets can let them trade into a more volatile stable allocation. The paper proves an existence result for parameter ranges where autarky Pareto dominates the stable integrated equilibrium. It does not conclude that integration or financial innovation is generally harmful.

## Biased investors, partial participation and mobility

Let a wealth fraction $\omega$ have an exogenous positive tilt $\hat\sigma$. The aggregate fixed point becomes
$$
\sigma=(1-\omega)m(\sigma)+\omega\hat\sigma.
$$
For $\gamma>1$, any positive wealth share and positive bias remove zero as an equilibrium. There is a largest positive stable equilibrium. **Uniqueness requires a sufficiently large biased share**; a small biased group does not automatically eliminate every negative or other equilibrium. At the largest positive equilibrium, rational investors have positive tilt, so total tilt exceeds the direct contribution $\omega\hat\sigma$. If $m(\hat\sigma)>\hat\sigma$, rational investors take an even more extreme position than the biased group.

If the exogenous restriction is a minimum tilt rather than a fixed holding, the constraint may cease to bind at the selected equilibrium. Curing one investor's initial bias would then leave their choice unchanged because the community's equilibrium portfolio makes the tilt privately optimal. This is an equilibrium-selection argument, not a claim that an arbitrary behavioral error improves decision making.

Partial laborer participation counteracts the effect. With a fraction $\ell$ of local-good endowments held by unconstrained laborers, the response becomes $m_\ell(\sigma)=m(\sigma)-\ell b(\sigma)$, where the laborers' zero-cost hedge pays negatively in the locally rich state. The initial slope is
$$
m_\ell'(0)=m'(0)-\ell\frac{\alpha(\alpha+\gamma)}{1+\alpha}.
$$
An increasing response survives if $\ell<(\gamma-1)/(\gamma+\alpha)$, and a sufficient condition for an undiversified equilibrium is $\ell<[\gamma-(2+1/\alpha)]/(\gamma+\alpha)$. The underlying mechanism therefore does not require literally zero participation, but stronger access to endowment hedging weakens it.

Costly migration or elastic local supply caps relative local prices. With positive migration costs, the response's slope near zero remains the same while its magnitude is capped away from zero. Mobility can limit equilibrium underdiversification without eliminating the local instability condition. Zero-cost mobility is a different limiting case and should not be included in the claim that migration leaves the mechanism intact.

## Beyond the baseline preference and symmetry assumptions

The separable baseline ties risk aversion to substitution between local and global goods. The CES/CRRA extension separates them. If $\gamma_r$ is relative risk aversion and $\gamma_c$ the inverse elasticity of substitution, the local response slope becomes
$$
m'(0)=\gamma_c\frac{\gamma_r-1}{\gamma_r}\frac{\alpha}{1+\alpha}.
$$
Herding strengthens with risk aversion, complementarity and local-good importance. Setting $\gamma_c=\gamma_r$ recovers the original formula. This distinguishes the price sensitivity caused by scarce complementary goods from aversion to wealth risk itself.

Simply assuming utility of relative wealth $u(x_i/Z_j)$ does not reproduce self-sustaining underdiversification. When everyone holds the same portfolio, relative shares are constant, but a small deviation toward diversification can still be attractive. The representative marginal utility under that specification behaves like $1/Z_j$, yielding full diversification. The precise functional form of a status externality matters; the paper's contribution is to derive one from goods markets rather than impose it arbitrarily.

With asymmetric communities, securities prices also move. The appendix solves for state-price ratio $\pi$, average community resources $c_j$, and tilts $\sigma_j$, subject to
$$
\sum_jc_j=1,\qquad\sum_jc_j\sigma_j=0,
$$
and each community's state-price budget and first-order conditions. A sufficiently small community with a strong local hedging effect can remain undiversified because its price impact is limited. Other communities absorb the opposite allocation in exchange for a risk premium.

In the numerical example $\gamma_1=\gamma_2=4$, $\alpha_1=1$ and $\alpha_2=0$, an undiversified allocation is supported when the first community's wealth share is below one third. The maximum attainable Sharpe ratio in the two equiprobable states is
$$
\rho=\left|\frac{\pi-1}{\pi+1}\right|.
$$
Its relationship to community size is nonmonotonic: tiny communities barely affect prices, while sufficiently large communities face enough price impact to extinguish the undiversified outcome. Intermediate sizes can generate sizable premia even though aggregate consumption is certain. The premium compensates the counterparty's risky individual consumption, which aggregate consumption statistics conceal.

## Empirical implications and practical boundaries

The paper predicts greater portfolio correlation where local resources are scarce, supply is inelastic, local industries are volatile, and migration costs are high. Unconstrained neighbors of workers tied to a dominant industry can choose especially concentrated **financial** portfolios; this does not imply their total wealth exposure exceeds that of workers with restricted equity and human capital. Movers should gradually shift portfolio correlation toward their destination community. Distinguishing this mechanism from local information advantages requires more than observing home bias.

The empirical discussion cites existing evidence on housing prices, nontradable expenditure shares, local stockholding and migration. Its calibration examples illustrate feasibility rather than identify parameters from a joint structural estimation. There is no new test establishing that this mechanism explains all home bias or all equity premia.

For portfolio analysis, the useful implication is to define risk relative to the investor's consumption opportunities, including local prices and untradeable endowments. At the same time, the social welfare result warns that a privately rational hedge can reinforce the risk everyone is trying to hedge. Translating that insight into an actual allocation would require identifying the relevant community, measuring local-price exposure, modeling endowments and constraints, and allowing securities prices to adjust. The stylized fixed point is an explanation of a possible coordination failure, not an instruction to imitate neighbors' holdings.
