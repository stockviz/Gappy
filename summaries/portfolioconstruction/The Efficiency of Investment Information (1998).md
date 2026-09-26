# The Efficiency of Investment Information

**Source:** [UniversalPortfolios_ErkipCover_1997.pdf](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_ErkipCover_1997.pdf>)  
**Source coverage:** Full article, including coding formulation, horse-race and Gaussian examples, and proofs of the initial-efficiency claims; Theorem 8 checked against a later primary-source correction.

## 1. Bibliographic identity and principal question

Elza Erkip and Thomas M. Cover, “The Efficiency of Investment Information,” *IEEE Transactions on Information Theory* 44(3), May 1998, pp. 1026–1040. The library filename carries 1997, but the supplied PDF is the published 1998 article. Its subject is the economic value of **compressed predictive information**, measured by the increase in optimal expected logarithmic wealth growth per observation.

An encoder sees side information $V$ correlated with a future market vector $X$. The investor receives only a rate-limited description. How should the description be chosen, and how much growth can $R$ bits per investment period buy? The paper turns this question into an indirect rate-distortion problem. Its operational characterization and worked examples are its durable contributions. Its general maximal-correlation claim in Theorem 8 requires a later correction, identified below.

## 2. Investment and communication model

$X=(X_1,\ldots,X_m)$ contains nonnegative price relatives. A portfolio lies in the simplex $B=\{b\ge0:\mathbf1^\top b=1\}$ and multiplies wealth by $b^\top X$. The model is long-only, fully invested, and frictionless. The baseline portfolio and growth are

$$
b^*\in\arg\max_{b\in B}E\log_2(b^\top X),\qquad
W^*=E\log_2(b^{*\top}X).
$$

The logarithm base matters: with base two, both description rate and growth increments are measured in bits. Natural-log growth must be divided by $\ln2$ before comparing it numerically with a bit rate. Integrability and positive realized portfolio wealth are needed for finite log-growth expressions.

The pairs $(X_t,V_t)$ are independent copies of a known joint distribution. In the operational block model, the encoder observes $V^n$, maps it to one of at most $2^{nR}$ messages, and the investor uses the decoded portfolio sequence over the block. This is an information-theoretic source-coding experiment. It is not a model in which a trading desk is given contemporaneous signals sequentially and must obey arbitrary causal latency restrictions. The advance observation of the side-information block is part of the setup, even though the encoder does not directly observe $X^n$ except insofar as $V^n$ reveals it.

Let $U$ denote a single-letter compressed description, with Markov relation $U-V-X$. Conditional on $U=u$, the investor chooses a log-optimal portfolio for the conditional law of $X$. Thus

$$
W(U)=E\log_2(b^*(U)^\top X),\qquad
\Delta(R)=\sup_{\substack{U-V-X\\I(U;V)\le R}}[W(U)-W^*].
$$

The optimization is over the information channel as well as the portfolio decision. Compressing a signal to reconstruct its numerical value accurately need not preserve its investment value: the relevant loss is logarithmic wealth, not squared forecast error.

## 3. Why rate-distortion theory applies

The portfolio-induced distortion can be written

$$
d(x,b)=-\log_2\frac{b^\top x}{b^{*\top}x}.
$$

Here $b^*$ is the **fixed, unconditional log-optimal portfolio**, not an oracle portfolio $b^*(x)$ that knows the realized outcome. Consequently the distortion can be negative for a particular $(x,b)$. Its expectation is minus the growth improvement relative to the baseline. Appropriate shifts and boundedness arguments permit the rate-distortion construction; there is no need to interpret this as a conventional nonnegative pointwise prediction error.

Because the encoder observes $V$, the equivalent distortion available to it is $E[d(X,b)\mid V=v]$. The coding problem is therefore a remote-source or indirect rate-distortion problem. The single-letter formula can use the portfolio itself as the reproduction symbol:

$$
\Delta(R)=\sup_{\substack{P_{B|V}:\,B-V-X\\I(B;V)\le R}}
E\log_2\frac{B^\top X}{b^{*\top}X}.
$$

Using an auxiliary $U$ and an optimized mapping $b(U)$ gives the same decision problem: irrelevant distinctions between messages need not be retained once they induce the same portfolio.

The achievability argument constructs long codebooks whose decoded sequences have the desired joint empirical behavior with $V^n$. A rate exceeding the requisite mutual information supplies sufficiently many descriptions. The converse says that a code with only $nR$ communicated bits cannot produce a better expected portfolio distortion than the indirect rate-distortion bound. These are asymptotic coding statements. They do not supply a finite-block, low-latency encoder with negligible computational cost.

## 4. Shape of the value-of-information curve

The investor can ignore a message, so $\Delta(0)=0$ and $\Delta(R)\ge0$. Increasing the allowed rate enlarges the feasible set. Time sharing between two codes makes $\Delta$ concave: increasingly abundant communication has diminishing marginal value at the optimized frontier.

For any description, the increase in log-optimal growth is at most its mutual information with the market. Together with data processing,

$$
W(U)-W^*\le I(U;X)\le I(U;V)\le R.
$$

Hence $\Delta(R)\le R$. Full access to $V$ also bounds the attainable gain. For general stock markets, the first inequality need not be equality: information about market outcomes may have little value if it does not change the best feasible portfolio. The limit from an unlimited communication budget is the full-information portfolio value, which is itself bounded by $I(X;V)$.

The paper defines initial efficiency as the right derivative $\Delta'(0+)$. Concavity makes it the largest marginal efficiency on the curve. This is an economically meaningful quantity only within the specified objective, distribution, and message-timing model; it is not a universal conversion rate between data volume and investment alpha.

## 5. Horse-race markets and their exact information identity

In a horse-race market, one outcome $X=i$ occurs and only the security attached to outcome $i$ pays. Write its payoff as $o_i>0$. Given outcome probabilities $p_i$, a portfolio earns expected log wealth $\sum_i p_i\log_2(b_i o_i)$. Maximizing over $b$ gives $b_i=p_i$. Conditional information replaces these probabilities by $P(X=i\mid U)$.

The payoff terms cancel when subtracting conditional and unconditional growth, leaving

$$
W(U)-W^*=H(X)-H(X\mid U)=I(U;X).
$$

Thus the rate-growth frontier is exactly

$$
\Delta(R)=\sup_{\substack{U-V-X\\I(U;V)\le R}}I(U;X).
$$

For finite $V$, an auxiliary alphabet of at most $|\mathcal V|+1$ suffices in the paper's characterization. The same optimization appears in source coding with side information: if $C(R)$ is the minimum additional rate required to describe $X$ when a rate-$R$ description of $V$ is supplied, then $\Delta(R)=H(X)-C(R)$. This is a precise bridge between investing and compression, not merely an analogy.

If $V=X$, every transmitted bit can contribute one bit of growth until the outcome entropy is exhausted:

$$
\Delta(R)=\min\{R,H(X)\}.
$$

Once the investor knows the outcome, further communication cannot improve the betting decision.

## 6. Binary symmetric and Gaussian examples

For the symmetric binary example, $V$ is equiprobable and $X$ is obtained by flipping it with probability $p\le1/2$. Let $h_2$ be binary entropy and $a*p=a(1-p)+(1-a)p$. An optimal description is another binary symmetric channel with crossover $a\in[0,1/2]$. The frontier is parametrized by

$$
R=1-h_2(a),\qquad \Delta(R)=1-h_2(p*a).
$$

At $a=1/2$ the message is uninformative; at $a=0$ it conveys all of $V$. Mrs. Gerber's lemma provides the upper bound and the cascaded binary channel attains it. Differentiating at zero rate gives $\Delta'(0+)=(1-2p)^2$. In this special symmetric model the ordinary correlation has magnitude $|1-2p|$, so initial efficiency is its square.

The Gaussian example extends horse-race betting to a continuum of outcomes, with a betting density replacing a finite portfolio vector. It does **not** posit Gaussian price relatives for ordinary equities; such relatives could be negative. If the continuous outcome and side information are jointly Gaussian with correlation $\rho$, a Gaussian auxiliary channel is optimal and

$$
\Delta(R)=\frac12\log_2\frac{1}{1-\rho^2(1-2^{-2R})}.
$$

The conditional entropy-power inequality supplies the converse. This gives $\Delta'(0+)=\rho^2$ and, for $|\rho|<1$, saturation at $-\tfrac12\log_2(1-\rho^2)=I(X;V)$. The effective correlation after compression is $\rho\sqrt{1-2^{-2R}}$: a high-quality raw signal can still be weak after severe communication compression. These special-case formulas do not require the disputed general Theorem 8.

## 7. Correction to the general initial-efficiency claim

Theorem 8 claims that the initial efficiency in every horse-race market equals squared Hirschfeld–Gebelein–Rényi maximal correlation,

$$
\rho_m^2(V,X)=\sup_{Eg=0,\,Eg^2=1}E[(E[g(V)\mid X])^2].
$$

**That general equality is false.** Anantharam, Gohari, Kamath, and Nair give a counterexample and identify the tight information-contraction coefficient. In the present notation, for finite alphabets,

$$
\Delta'(0+)=\sup_{U-V-X,\ I(U;V)>0}\frac{I(U;X)}{I(U;V)}
=\sup_{Q_V\ne P_V}\frac{D(Q_X\Vert P_X)}{D(Q_V\Vert P_V)},
$$

where $Q_X=Q_VP_{X|V}$. This coefficient can strictly exceed $\rho_m^2$. The original perturbation argument identifies a local quadratic quantity; it does not control rare-message descriptions uniformly. The symmetric binary and Gaussian examples above remain valid. See the primary correction, [Anantharam et al., “On Hypercontractivity and a Data Processing Inequality”](https://chandra.ie.cuhk.edu.hk/pub/papers/HC/EC-ISIT.pdf), and its [2013 preprint](https://arxiv.org/abs/1304.6133).

The equality between initial slope and the supremum of information ratios also follows directly from the frontier geometry: time sharing a fixed informative channel with a null channel scales both mutual informations by the same small probability. A small *average* information rate therefore need not mean that every informative conditional distribution is a small perturbation of the unconditional distribution. This explains the distinction economically: rarely sending a highly informative message can matter as much as continually sending a very weak message.

## 8. Perfect market information and active-asset assumptions

Theorem 9 studies $V=X$ for a general stock market and states unit initial efficiency. Its proof assumes at least two active assets in the baseline log-optimal portfolio and constructs a feasible direction $c$ supported on those assets, with $\mathbf1^\top c=0$. The first-order conditions imply

$$
E\left[\frac{X_i}{b^{*\top}X}\right]=1\quad\text{for active }i,
\qquad
Eg(X)=0,\quad g(X)=\frac{c^\top X}{b^{*\top}X}.
$$

For a sufficiently small perturbation, a binary message induces conditional densities proportional to $1\pm\epsilon g(x)$ and portfolios $b^*\pm\epsilon c$. Their portfolio return ratios have exactly the same factors, linking the logarithmic investment gain to the message information. A nontrivial direction with positive variation and the requisite feasibility conditions is essential.

The headline should not be applied to degenerate markets. If one asset always dominates every other asset, learning the whole market vector may never change the optimal holding and may have zero investment value. Likewise, duplicate active assets can make a nominal portfolio direction economically null. The proof's active-asset and nondegeneracy requirements explain why unrestricted statements about “every first bit being worth one bit of growth” are too broad.

## 9. Practical interpretation and limitations

The article identifies a decision-aware compression target: preserve the parts of a predictive signal that change the optimal bet. It separates raw information, useful information, and communication capacity. This can inform the design of signal summaries or restricted data feeds, but the theory assumes the joint distribution is already known; it does not estimate a signal's reliability, pay for acquiring it, or protect against overfitting.

There are no market backtests or transaction-cost-adjusted trading claims. The worked examples validate mathematical cases, not empirical profitability. Non-log utility, leverage limits beyond the simplex, execution costs, correlated time series, changing distributions, causal message arrival, and finite-block coding all require additional analysis. The appropriate reading is a rigorous characterization of one information-constrained investment model, with an explicit correction to one of its general dependency claims.
