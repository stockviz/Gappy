# Kelly Myths and Heroes (2016)

**Source checked:** [Local original PDF](</Users/gappy/Library/CloudStorage/GoogleDrive-paleologo@gmail.com/My Drive/library/Finance/UniversalPortfolios_Brown_2016.pdf>), 5 PDF pages. The discussion below distinguishes the source's results from explanatory derivations and implementation implications.

# 1. Metadata

- **Title:** Kelly Myths and Heroes
- **Author(s):** Aaron Brown
- **Year:** 2016
- **Journal/Venue:** practitioner magazine article

# 2. Problem statement

The paper asks: **why does the Kelly criterion work, what common folk interpretations of it are wrong, and how should it be adjusted when real decisions violate the clean assumptions of the textbook Kelly problem?**

# 3. Approach (short)

The article is a conceptual exposition anchored by simple binary-bet algebra. Brown derives the standard Kelly fraction from median/log-growth reasoning, contrasts it with naive expected-profit reasoning, and then uses that derivation to debunk several common myths: that Kelly is only about bet sizing, that it requires many repeated identical bets, or that its chief virtue is “never going broke.”

# 4. Approach (detailed)

1. **Even-money benchmark**

   Suppose wealth is $w$, one bets $b$, the win probability is $0.6$, and the bet pays even money. Expected profit is $0.2b$, which mechanically rises with $b$. But the multiplicative wealth outcome is
   $$
   (w+b)^{0.6}(w-b)^{0.4},
   $$
   and maximizing this geometric mean is equivalent to maximizing expected log wealth.

2. **Derive the Kelly fraction**

   Differentiate
   $$
   g(b)=0.6\log(w+b)+0.4\log(w-b).
   $$
   The first-order condition is
   $$
   \frac{0.6}{w+b}-\frac{0.4}{w-b}=0,
   $$
   which gives
   $$
   \frac{b}{w}=0.2.
   $$
   Hence the Kelly fraction is 20 percent in this example.

3. **Volatility drag interpretation**

   Brown interprets the gap between expected profit and median/geometric-growth outcome as volatility drag. The article’s argument is that excessive betting raises arithmetic expectation but lowers the typical path outcome because multiplicative losses hurt more than symmetric gains help.

4. **Myth 1: Kelly needs many repeated identical bets**

   Brown argues this is overstated. The deeper requirement is not identical repetition but that each individual decision is small relative to total lifetime wealth uncertainty, so maximizing expected log wealth remains a sensible local criterion. This is more of an interpretive argument than a theorem.

5. **Myth 2: the key benefit is “never going broke”**

   The article rejects this as the core justification. One can devise many non-Kelly rules that avoid total ruin in idealized models. Kelly’s real claim is growth optimality under the stated assumptions, not a categorical ruin-avoidance property.

6. **Myth 3: Kelly is only about bet size**

   Brown emphasizes that Kelly is a complete decision rule once outcomes and probabilities are specified. In portfolio form it chooses both direction and scale through the optimization of expected log wealth.

7. **Practical modifications**

   The article recommends relaxing Kelly’s heroic assumptions:
   - probabilities are uncertain;
   - “wealth” is not always the only objective;
   - future opportunities and background risk matter.

   Brown develops Bayesian updating and explicit choice of the capital base; the detailed reading below explains that proposal and its limits.

8. **Exact versus interpretive content**

   Exact:
   - the binary-bet derivation of the Kelly fraction from expected log wealth;
   - the volatility-drag intuition in multiplicative wealth settings.

   Interpretive:
   - the myth-debunking extensions to broader decision problems;
   - the practical guidance about when Kelly is only “art.”

# 5. Domain of applicability

The article applies best as a clean explanation of the binary-bet Kelly rule and of why naive expected-profit reasoning is wrong in multiplicative settings. It is not a formal research paper, so its broader claims about real-world decision-making are heuristic rather than proved. It is most useful as a warning against literalist or slogan-like use of Kelly outside the small-bet, known-probability, wealth-maximization regime.


# 6. Detailed source reading and corrected mathematical interpretation

## 6.1 Scope and the article's central practical proposal

The five-page local source is a Wilmott magazine article, pages 10-14, with the 2016 date supplied by the library filename. It is an argumentative practitioner essay, not a theorem paper. Its second half is substantially about **Bayesian Kelly**, an element underrepresented in the original short summary. Brown advocates explicitly representing uncertainty about success probabilities, updating that uncertainty after outcomes, and defining the capital base against which risks are scaled.

The two assumptions emphasized at the outset are that possible outcomes and probabilities are known, and that the same quantity called wealth is both the decision objective and the resource constraint. The essay explores what changes when these assumptions are relaxed. Its venture examples are heuristics intended to improve consistency of judgment, not validated optimal-control solutions.

## 6.2 Geometric outcome, expected wealth, and median are different objects

For an even-money bet with probability $p$, the expected log-growth rate at fraction $f$ is

$$
g(f)=p\log(1+f)+(1-p)\log(1-f).
$$

Its optimizer is $f^*=2p-1$ when the fraction is interior and both sides of the bet are feasible. Brown's $p=0.6$ example gives $f^*=0.2$. The single-period geometric mean multiplier is $e^{g(f)}=(1+f)^p(1-f)^{1-p}$. This is not literally the median of a one-period binary payoff. For $p=0.6$, that median is the winning payoff. The article's “median” terminology is best read as typical repeated-path or geometric-growth reasoning.

After $n$ fixed-fraction wagers with exactly $k$ wins,

$$
W_n=W_0(1+f)^k(1-f)^{n-k}.
$$

For large $n$, typical win frequencies are near $p$, motivating $W_n\approx W_0e^{ng(f)}$. Exact finite-sample median wealth requires a binomial median for $k$; it is not obtained by assuming $np$ wins in every experiment.

The article's first-page derivative contains an apparent reciprocal/typesetting problem. The correct equation is

$$
\frac p{w+b}-\frac{1-p}{w-b}=0
\quad\Longrightarrow\quad b/w=2p-1.
$$

It is $b/w=0.2$, not $w/b=0.2$. The earlier summary's derivation is correct; the PDF's printed algebra should not be copied literally.

## 6.3 The 100-bet example explains overbetting

With $W_0=100$, $p=0.6$, and exactly sixty wins, a 50% fraction ends at approximately $3.34$, whereas the 20% Kelly fraction ends at approximately $748.99. The 50% rule needs at least 64 wins to finish above initial wealth; the 20% rule needs at least 56. Brown reports corresponding profit probabilities of about 24% and 82%.

Yet the expected wealth of a fixed fraction is

$$
E W_n=W_0[1+(2p-1)f]^n.
$$

This gives approximately $1.378$ million for $f=0.5$ and $5,050$ for $f=0.2$ after 100 wagers. There is no contradiction. A small collection of very large outcomes lifts the mean of the more aggressive strategy while most paths do poorly. Capping terminal payoffs at $100,000 makes the two expected outcomes far closer in Brown's calculation. The cap changes the objective and therefore changes which tail outcomes are economically valuable.

This example also qualifies the essay's categorical language about Kelly. Expected wealth maximization is a coherent different objective; it simply generates a different risk distribution. The choice of typical growth as the relevant objective is an economic decision, not an arithmetic identity that forces every investor to agree.

## 6.4 Capital definition changes the whole feedback rule

Brown's unusual example gives a bettor $100 of real wealth but tells her to size against $250 of accounting capital. A $50 first bet then equals 20% of the accounting base. After a win the next bet is $60, and after a loss it is $40. By contrast, a 50%-of-real-wealth rule moves from $50 to $75 after a win or $25 after a loss.

The first dollar bet is identical but the future reaction to outcomes is different. This is what the article means when arguing that Kelly is about more than bet size. It determines a feedback rule linking gains and losses to subsequent exposure. Fictitious capital does not create actual solvency: after sufficient losses the prescribed wager can exceed remaining real resources. Brown explicitly stops the illustrative strategy when it becomes infeasible.

Table 1 reports a higher loss probability for the fictitious-capital bettor, about 33% rather than 18%, but larger chances of high terminal wealth. This is a different trade-off, not a free improvement over ordinary Kelly. The capital-base choice embeds a preference about how quickly to increase risk after success and reduce risk after failure.

A related identity explains “volatility drag.” A gain and a loss at the same fraction multiply capital by $(1+f)(1-f)=1-f^2$. Faster scaling after wins and losses raises this two-step compounding penalty. Rules that reverse the feedback can benefit from alternating outcomes but become exposed to long runs. Neither feedback shape is universally best without specifying the opportunity process and payoff objective.

## 6.5 Bayesian Kelly with a beta prior

Take an unknown fixed win probability $p\sim\operatorname{Beta}(A,B)$, where $A$ counts prior wins and $B$ prior losses. After $w$ wins and $l$ losses,

$$
p\mid\mathcal D\sim\operatorname{Beta}(A+w,B+l),
\quad
\bar p=\frac{A+w}{A+B+w+l}.
$$

Because one-step expected log wealth is linear in $p$, integrating over the posterior gives the same one-step objective as using posterior mean $\bar p$. The unconstrained two-sided Bayesian Kelly fraction is

$$
f_{w,l}=2\bar p-1
=\frac{A-B+w-l}{A+B+w+l}.
$$

If only the original side can be bet, the fraction must be truncated at zero when this becomes negative. That operational restriction changes the closed-form terminal-wealth identity below.

For a two-sided even-money gamble, the win multiplier is $2(A+w)/(A+B+w+l)$ and the loss multiplier is $2(B+l)/(A+B+w+l)$. Multiplying sequentially gives

$$
\frac{W_{w+l}}{W_0}
=2^{w+l}\frac{B(A+w,B+l)}{B(A,B)},
$$

or, equivalently,

$$
2^{w+l}\frac{\Gamma(A+w)}{\Gamma(A)}
\frac{\Gamma(B+l)}{\Gamma(B)}
\frac{\Gamma(A+B)}{\Gamma(A+B+w+l)}.
$$

This reconstruction follows the text's convention that $A$ counts wins. The displayed factorial formula in the source appears to interchange the win/loss pairings. Using the beta-function expression with an explicitly stated convention prevents that transcription error.

The resulting wealth depends on counts rather than their order under this ideal model. In an implementation, use log-gamma functions to avoid overflow. There is no need to rely on a hand-coded Stirling approximation when a stable special-function library is available.

## 6.6 Learning is not the same as fractional Kelly

Brown compares priors $(3,2)$, $(30,20)$, and $(300,200)$. Each has mean 0.6 and initially prescribes the same 20% fraction. Their confidence differs. With the weak $(3,2)$ prior, a first win moves the probability estimate to $4/6$ and the fraction to one third; a first loss moves it to $3/6$ and the fraction to zero. The strong prior changes much more slowly.

This is not mechanically equivalent to taking half of a fixed full-Kelly fraction. Bayesian learning can raise or lower the fraction as outcomes arrive. Under a truly known and fixed $p=0.6$, the known-probability Kelly strategy remains the expected-log benchmark; Bayesian uncertainty imposes a learning cost. Brown's plots show that the adaptive rule can nevertheless outperform a fixed fraction on realized paths whose win counts differ from the assumed frequency.

He interprets the Bayesian rule as paying a terminal-wealth “tax” relative to the best hindsight choice from several fixed fractions, in return for adapting across plausible edges. The quoted 45%-60% cost and 70%-90% ratios after altered capital scaling are numerical observations for the plotted 100-bet setup. They are not universal regret bounds or guaranteed insurance rates.

The discussion of the “worst case” likewise belongs to that particular finite experiment and capital convention. It should not be extended into a general theorem that Bayesian Kelly prevents ruin. If learning reverses the side of the bet, the economic ability to take that other side must exist. Brown explicitly says that, when a financial strategy disappoints, understanding why it failed can be more sensible than immediately reversing it.

## 6.7 Venture applications and the boundary of the argument

For a new business, Brown proposes using estimated equity value as the common accounting unit for money, time, prototypes, customers, and other milestones. The initial capital base is the total resources the founder is prepared to lose. Updating the perceived value and underlying success factors disciplines subsequent commitments. The point is to make judgments explicit and learn from failures.

But project milestones generally do not generate exchangeable Bernoulli trials. Completing a prototype and obtaining a customer are different events, with different conditional probabilities and payoffs. The beta-binomial model cannot be transplanted without specifying a shared latent factor and how each observation informs it. Moreover, notional equity gains do not necessarily generate liquid resources for the next investment.

The article acknowledges these issues and does not claim its venture procedure is optimal. Its strongest practical contribution is to demand explicit capital accounting and learning rules. A portfolio application should similarly separate cash available, capital at risk, estimated economic wealth, and any notional sizing base. Without those distinctions, “Kelly fraction” can conceal leverage, liquidity, or stopping rules that dominate the outcome.
