# Smile! CTA Convexity Is Not Lost...
**Authors:** Johann Mauchand, Steeve Brument
**Year:** 2022
**Journal/Venue:** Candriam marketing communication / white paper

## Problem statement

CTAs have historically been valuable because they combine low correlation with crisis convexity. But allocators increasingly suspect that the classic equity "smile" of managed futures has flattened as the industry scaled. The paper asks two concrete questions: **has CTA convexity to equities in fact faded over time, and if so can it be maintained through different signal design?** It also checks whether the same issue appears in rate markets.

## Approach (short)

The paper measures CTA convexity by fitting a quadratic relationship between monthly BarclayHedge CTA Index returns and monthly equity or bond returns. Rolling 10-year estimates show that the CTA equity smile has visibly flattened over time, especially in the most recent decade, while the bond/rate smile has remained largely intact. The proposed explanation is that industry growth pushed managers toward longer-horizon, lower-frequency signals to reduce trading costs and market impact. A toy exercise with moving-average strategies confirms that the current CTA index is much more correlated with long-horizon trend models than with short-horizon ones. Candriam then argues that mixing short- to medium-term trend, contrarian, and pattern-recognition models can restore convexity, and presents its own fund as an example.

## Approach (detailed)

### 1. Measuring the CTA smile

The paper uses a simple but sensible measurement protocol:

1. plot monthly CTA index returns against monthly returns of a benchmark asset class;
2. fit a second-order polynomial;
3. interpret the curvature as convexity or "smile".

Against the MSCI World index, the full-sample BarclayHedge CTA Index still shows the expected bowl shape. Against the Bloomberg US Aggregate Bond Index, the same procedure also produces a smile, which the authors interpret as evidence that CTA convexity is not just an equity-crisis phenomenon but also linked to rate moves.

The measure is deliberately descriptive. The aim is not a structural model but a rolling diagnostic of whether the asset class still offers the payoff shape allocators think they are buying.

### 2. Equity convexity has faded

The main empirical finding comes from rolling 10-year windows. When the authors plot the fitted equity smiles for windows ending in 1990, 1995, 2000, 2005, 2010, 2015, and 2020, the left tail flattens markedly over time. The most recent decade is the weakest.

The interpretation is straightforward: the average CTA fund still has positive convexity, but the amount of protection delivered in large equity selloffs has declined materially relative to earlier decades.

This is the paper's most important claim, and it is narrower than "CTAs no longer work". The claim is specifically about the *equity smile* of the industry average.

### 3. Bond/rate convexity has not faded in the same way

The authors repeat the same rolling-smile exercise against the Bloomberg Aggregate bond index. Here the result is different:

- CTA convexity to bond moves remains present,
- the exact shape varies by rate regime,
- but there is no comparable secular flattening.

The paper interprets this through the history of rate regimes. Long bond positions embedded in CTA models carried a premium through long falling-rate and stable-rate periods, and the strategy also did well in some rising-rate periods because those regimes created trends in rates and bonds rather than mere noise.

So the "smile is fading" thesis is explicitly an equity-smile thesis, not a general statement about all CTA convexity.

### 4. Capacity explanation: longer horizons, lower trading frequency

The explanatory hypothesis is capacity. CTA AUM rose from less than \$50 billion around the dot-com era to well above \$350 billion by 2022. If managers become bigger, they care more about:

- market impact,
- turnover costs,
- slippage from reacting to short-lived moves.

That naturally pushes them toward slower trend identification and lower trading frequency.

To test this idea, the paper builds a stylized universe of 40 futures contracts and applies simple moving-average trend strategies with windows ranging from about 30 trading days to 250 trading days. The portfolio equalizes risk across positions and targets 15% volatility.

The result is striking:

- the BarclayHedge CTA Index has become increasingly correlated with long-horizon trend models, especially one-year-type signals;
- correlations with 30-day to 90-day trend models have weakened sharply since the late 1990s.

This is the paper's causal story in one sentence: **industry capacity pushed CTA managers toward slower models, and slower models are less reactive to equity crashes, so the equity smile flattened.**

### 5. Why slower models flatten the equity smile

The mechanism is intuitive and the paper states it clearly.

Longer-term trend models:

- filter noise better,
- avoid false signals,
- trade less often,
- but confirm reversals slowly.

In a sharp equity selloff, or in a fast rebound after a selloff, delayed reversal of position weakens convexity. That is exactly the trade-off:

- short-term signals are noisy but reactive,
- long-term signals are robust but slow.

Thus the same change that improves capacity and implementation can degrade allocator-visible tail convexity.

### 6. Proposed solution: mix trend with contrarian and pattern-recognition models

The authors do not advocate simply returning to very short trend signals. Their proposed remedy is a multi-bucket process:

- trend-following,
- contrarian,
- pattern recognition.

The idea is to keep the strong structural qualities of medium-horizon trend while recovering some responsiveness to early regime changes and short-lived dislocations. Within Candriam Diversified Futures, they describe a stylized internal risk budget of roughly:

- 70% trend,
- 15% contrarian,
- 15% pattern recognition.

The claim is not that contrarian overlays create convexity on their own. Rather, they help improve the signal-to-noise trade-off that pure short-term trend models struggle with.

### 7. Candriam's own fund as a counterexample to the industry average

The note then compares its internal fund's 10-year smiles with:

- the recent CTA index smiles,
- the best industry smiles from the 1990s.

The reported result is that Candriam Diversified Futures maintains stronger equity and rate convexity than the recent CTA index and, on some metrics, approaches the stronger historical regime. The paper uses this as evidence that flattening is not inevitable; it is a feature of the *average* industry design, not a law of nature.

## Domain of applicability

- **Where it works well:** The paper is useful as an allocator diagnostic. If one wants to know whether the industry average CTA still delivers the same tail profile it did twenty years ago, the rolling-smile method is informative and easy to replicate.
- **What is implementable:** The implementation message is concrete: estimate convexity through rolling quadratic fits; recognize the trade-off between signal speed and capacity; if you want to preserve convexity, consider blending trend with faster complementary models rather than just lengthening the trend window.
- **Main limitations:** This is a practitioner note with a descriptive methodology. Quadratic fits on monthly data are coarse and do not establish causality. The internal Candriam comparison is not an out-of-sample academic test.
- **What it does not prove:** It does not prove that longer horizons are the only cause of fading equity convexity, nor that the Candriam mix is the uniquely right remedy. It also does not analyze costs, leverage, or crowding formally.
- **What is genuinely novel:** The paper's useful contribution is to separate two facts that are often blurred together: the CTA industry's equity smile appears to have faded, but its rate smile has not; and the most plausible operational explanation is the secular migration toward slower, lower-frequency models as capacity rose.
