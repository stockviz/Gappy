# A New Interpretation of Information Rate

**J. L. Kelly Jr. (1956), Bell System Technical Journal, July, pp. 917–926.** [Local source PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_Kelly_1956.pdf>). The local file contains all ten pages. This note follows the original betting model; statements about modern portfolio implementation below are interpretations, not empirical results reported in the paper.

## Main contribution

Kelly supplies an operational meaning for Shannon information without invoking error-correcting codes. An investor who repeatedly stakes a fraction of current capital on mutually exclusive events can turn a signal into exponential wealth growth. When the offered gross odds are the reciprocals of unconditional event probabilities, the largest attainable almost-sure growth rate is the mutual information between event and signal. When odds correspond to a different probability distribution but there is no bookmaker take, information contributes the same incremental growth rate on top of the return from favorable odds.

The result concerns compounded wealth and a precise feasible set. It does not assert that mutual information is generally the monetary value of a forecasting signal, that expected wealth is maximized by Kelly stakes, or that arbitrary securities span all the event bets used in the argument. The paper also solves the less familiar case with a bookmaker take and an explicit cash reserve. That extension changes the optimal allocation and breaks the simple entropy formula.

## Why expected wealth and growth give different answers

Consider even-money betting on a binary event. The private signal is correct with probability \(q\), wrong with probability \(p=1-q\), and the gambler follows it by betting fraction \(f\) of current capital. After \(N\) bets,

\[
V_N=V_0(1+f)^{W_N}(1-f)^{L_N},\qquad W_N+L_N=N.
\]

For independent repeated outcomes, the strong law gives

\[
G(f)=\lim_{N\to\infty}\frac1N\log_2(V_N/V_0)
=q\log_2(1+f)+p\log_2(1-f)
\]

almost surely. Here the logarithm is base two, so the growth rate and information rate are both measured in bits per bet. Differentiation, with an immaterial factor \(1/\ln2\) suppressed, gives

\[
G'(f)=\frac{q}{1+f}-\frac{p}{1-f},\qquad
G''(f)=-\frac{q}{(1+f)^2}-\frac{p}{(1-f)^2}<0.
\]

Thus \(f^*=q-p=2q-1\), provided the signal is oriented so \(q\ge1/2\), and

\[
G^*=1+q\log_2q+p\log_2p=1-H_2(p).
\]

This is the capacity per use of the symmetric binary channel in the example. If the signal is noiseless, investing everything doubles wealth each round and gives one bit per bet. If the signal is uninformative, the optimal bet is zero and growth is zero.

Maximizing \(E[V_N]\) instead recommends staking everything whenever \(q>1/2\), because then \(E[V_N]=V_0(2q)^N\). Yet for \(p>0\), eventual bankruptcy under that rule occurs with probability one. The large expectation is sustained by increasingly rare surviving paths. Kelly is explicit that a gambler with a fixed terminal date and particular preferences might still choose differently: the logarithmic criterion is justified here by multiplicative repetition and the long-run comparison, not by a claim that every person must have logarithmic utility.

## General event and signal model

Let \(S\) be the event on which bets settle and \(R\) the received signal. Write

\[
p_s=P(S=s),\quad q_r=P(R=r),\quad p_{s|r}=P(S=s\mid R=r).
\]

A unit stake on event \(s\) returns \(\alpha_s\) units in total if that event occurs, including return of the stake, and zero otherwise. After observing \(r\), the gambler allocates wealth fractions \(a_{s|r}\ge0\). In the no-take formulation the whole bankroll is allocated, so \(\sum_sa_{s|r}=1\). The gross wealth multiplier is then \(\alpha_Sa_{S|R}\).

For independent repetitions of the event–signal pair and a time-invariant policy,

\[
G(a)=\sum_{r,s}P(S=s,R=r)\log_2(\alpha_sa_{s|r}).
\]

The signal is observed before the bet is placed, while the settlement outcome is still unavailable to the bettor except through the signal. Prices must remain at the quoted odds after receipt of the signal. That timing is economically essential: if odds immediately incorporate all private information, the original opportunity is no longer the one modeled.

For a fixed signal \(r\), the odds contribute a constant to the objective. The allocation problem reduces to

\[
\max_{a_s\ge0,\ \sum_sa_s=1}\sum_sp_{s|r}\log_2a_s.
\]

The first-order conditions on positive-probability events give \(a_s=p_{s|r}\). More transparently, for any candidate allocation,

\[
\sum_sp_{s|r}\log_2a_s
=-H(S\mid R=r)-D_{\rm KL}(p_{\cdot|r}\Vert a_{\cdot|r}),
\]

so the posterior allocation uniquely maximizes the objective on its effective support. This relative-entropy restatement is a useful derivation of the original argument; it also quantifies the loss from using inaccurate probabilities.

## Fair odds and the exact information identity

Fair odds mean \(\alpha_s=1/p_s\). With optimal allocations,

\[
G^*=\sum_{s,r}p_{sr}\log_2\frac{p_{s|r}}{p_s}
=H(S)-H(S\mid R)=I(S;R).
\]

The benchmark without a signal chooses \(a_s=p_s\). Its realized multiplier equals one for every event, because \(p_s\alpha_s=1\). It earns exactly zero growth. The signal produces a state-contingent departure from this cash-equivalent portfolio, and the expected log likelihood ratio measures its gain.

The equality depends on exhaustive mutually exclusive bets and the ability to distribute wealth freely among them. In a stock universe, the state-payoff matrix generally does not allow arbitrary event-contingent portfolios. A stock signal may contain considerable information about states that cannot be monetized by available trades. Consequently the identity is a statement about this complete betting opportunity set, not a formula that converts any predictive information coefficient or mutual information estimate directly into portfolio alpha.

The requirement to bet all capital does not imply economically holding zero safe capital. Under fair odds, a fraction \(c\) allocated as \(cp_s\) across events pays \(c\) with certainty. Cash can therefore be replicated using canceling bets. The distinction between a fully allocated vector of event stakes and a leveraged risky exposure matters when interpreting posterior-proportional betting.

## Unfair odds without a bookmaker take

Suppose

\[
\sum_s\alpha_s^{-1}=1,
\]

but \(\alpha_s\ne1/p_s\). Define the probabilities implied by the odds as \(r_s=1/\alpha_s\). A certain unit payoff still costs one, so cash is replicable and full allocation remains without loss. The maximizing fractions remain \(a_{s|r}=p_{s|r}\), and

\[
G^*=\sum_sp_s\log_2\alpha_s-H(S\mid R)
=D_{\rm KL}(p\Vert r)+I(S;R).
\]

Without side information the maximum is \(D_{\rm KL}(p\Vert r)\). Therefore

\[
G^*_{\rm signal}-G^*_{\rm no\ signal}=I(S;R).
\]

This decomposition separates two sources of profitability: probability mismatch in the posted odds and the additional information in the signal. Fair odds minimize the optimized growth rate over all normalized inverse-odds vectors, because relative entropy is nonnegative.

The statement that optimal fractions ignore odds can initially seem paradoxical. It holds because the investor must distribute all wealth among exhaustive event claims and can replicate cash at unit cost; odds affect the payoff to every possible allocation through an additive term in expected log wealth. Once cash becomes a distinct superior instrument or the claims are not exhaustive, the same inference does not follow.

## Bookmaker take: the active-set solution

With a take, canceling bets lose money, and the gambler may retain cash \(b\). Conditional on each signal, the relevant problem has the form

\[
\max_{b\ge0,\ a_s\ge0}
\sum_sp_s\log(b+\alpha_sa_s),
\qquad b+\sum_sa_s=1.
\]

Here \(p_s\) can be interpreted as the posterior probabilities for that signal, and natural logarithms can be used without changing the optimizer. Let \(A\) denote the events receiving positive stakes and put

\[
P_A=\sum_{s\in A}p_s,\qquad R_A=\sum_{s\in A}\alpha_s^{-1}.
\]

When the cash reserve is positive, the multiplier on the budget constraint equals one. To see this, multiply the first-order conditions by the corresponding allocations and sum: the result is \(\sum_sp_s=1\). The active event conditions are

\[
\frac{p_s\alpha_s}{b+\alpha_sa_s}=1,
\]

which yield

\[
a_s=p_s-\frac b{\alpha_s},\qquad
b=\frac{1-P_A}{1-R_A}.
\]

Inclusion in the active set requires \(p_s\alpha_s>b\); an excluded event satisfies \(p_s\alpha_s\le b\). In the regular case the allocation can be written

\[
a_s=\max\left(p_s-\frac b{\alpha_s},0\right).
\]

Kelly gives a finite procedure: order the events by decreasing \(p_s\alpha_s\), consider initial segments, compute \((1-P_A)/(1-R_A)\), and take the appropriate smallest positive minimum. The paper treats ties by choosing the smallest qualifying segment. Degenerate zero-probability or limiting cases should be handled through the original concave program rather than an unchecked division by a zero denominator.

For the selected active set the optimized growth is

\[
G^*=\sum_{s\in A}p_s\log_2(p_s\alpha_s)
+(1-P_A)\log_2\frac{1-P_A}{1-R_A}.
\]

If no event has \(p_s\alpha_s>1\), holding all capital in cash is optimal. More surprisingly, when favorable opportunities exist, the optimal portfolio can include a bet whose standalone expected profit is negative. Its inclusion can hedge other mutually exclusive exposures and improve total expected log growth. The criterion is a marginal contribution to the complete portfolio, not the expected return of each bet considered separately.

## What is actually proved about long-run dominance

For a fixed policy, logarithmic wealth is a sum of independent identically distributed increments. The strong law identifies its almost-sure growth rate. If two fixed signal-contingent policies have strictly different expected log growth, then

\[
\frac1N\log(V_N^{(1)}/V_N^{(2)})\to G_1-G_2>0.
\]

Thus the higher-growth policy eventually exceeds and stays ahead of the lower-growth policy almost surely. This is a pathwise asymptotic statement; it says neither that its wealth is greater at every finite date nor that it has a greater probability of beating every comparator over an arbitrary short horizon.

Kelly explicitly limits the result proved in this paper to gamblers whose allocations for a given received symbol are fixed over time. He identifies dominance relative to arbitrary history-dependent betting systems as a further theorem still to be proved. Attributing the whole later theory of growth-optimal portfolios, numéraires, or universal portfolios to these ten pages would overstate their scope.

## Practical reconstruction and limitations

To implement the original model, specify the event payoffs, odds, signal timing, and conditional probabilities before choosing stakes. Check whether cash is exactly replicable. If it is and inverse odds sum to one, use the posterior allocation; otherwise solve the cash-plus-bets concave problem. Evaluate the complete payoff in every event and reject any allocation with zero wealth in a positive-probability state. Track realized log growth, drawdowns, and calibration separately.

The paper assumes known probabilities and ignores estimation error, transaction costs, market impact, financing, and changing opportunity sets. With estimated probabilities \(\widehat p_{s|r}\), the expected growth loss in the no-take model is exactly the average conditional relative entropy \(E_R[D(p_{\cdot|R}\Vert\widehat p_{\cdot|R})]\), as the decomposition above shows. This provides a direct reason why excessive confidence in rare events can be damaging: assigning a zero probability to an event that can occur can imply ruin and expected log utility of negative infinity.

Fractional Kelly, Bayesian shrinkage, and explicit drawdown limits are natural later responses to model uncertainty and finite-horizon risk, but Kelly does not develop them here. Likewise, the paper contains illustrative calculations rather than an empirical stock-market backtest. Its durable contribution is the exact mathematical bridge between information, reinvestment, and optimal growth, together with a careful statement of the assumptions under which that bridge exists.
