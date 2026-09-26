# Frog in the Pan: Continuous Information and Momentum
**Authors:** Zhi Da, Umit G. Gurun, Mitch Warachka
**Year:** 2014
**Journal/Venue:** Review of Financial Studies

## Problem statement

Momentum is normally measured only by cumulative past return. But two stocks can arrive at the same 12-month return through very different paths:

- many small same-signed moves,
- or a few large discrete jumps.

This paper asks: **does the *path* of information arrival matter because investors are more likely to underreact to information that arrives continuously in small amounts than to salient information that arrives discretely in large bursts?**

The paper's core claim is that the standard momentum signal is incomplete because it ignores how visible the underlying information flow was.

## Approach (short)

The paper proposes the frog-in-the-pan (FIP) hypothesis: investors fail to notice information that arrives gradually, so returns built from many small same-direction moves should exhibit stronger continuation than returns built from a few salient jumps. To test this, the authors construct an **information discreteness** measure `ID` from the signs of daily returns inside the formation period. Conditioning on the same formation-period return, low-`ID` stocks show much stronger momentum than high-`ID` stocks. Media coverage and other salience proxies line up with the same interpretation.

## Approach (detailed)

### 1. State the prediction conditionally, not unconditionally

The FIP hypothesis is not "continuous-information stocks outperform." The prediction is:

- hold cumulative formation-period return fixed,
- then ask whether the same total return was produced by many small same-signed moves or by a few salient jumps.

Under limited attention, gradual news is more likely to be truncated by investors, so continuation should be stronger precisely when the path was smooth and easy to ignore.

### 2. Construct the baseline information-discreteness proxy

Let `PRET` be the stock's cumulative return over the formation window, usually the standard 12-month momentum horizon. Define:

- `%pos` = fraction of daily returns in the formation period that are positive,
- `%neg` = fraction that are negative.

The baseline information-discreteness measure is

$$
ID = \operatorname{sgn}(PRET)\,[\%neg - \%pos].
$$

Interpretation:

- low `ID` means the cumulative return was built by many same-signed daily moves, so information arrived continuously;
- high `ID` means the same cumulative return came through relatively discrete jumps.

The clever part is that the measure isolates the **path** of returns rather than simply re-measuring the total return itself.

### 3. Make the benchmark momentum design explicit

The paper keeps the usual momentum architecture:

1. compute a formation-period return `PRET`,
2. rank stocks on that return,
3. hold for the next six months.

The innovation is to condition this standard signal on `ID` rather than replace it. So the empirical design asks whether two stocks with similar `PRET` have different continuation depending on their within-window path.

### 4. Use sequential and independent double sorts

The main test is a sequential double sort:

1. sort stocks into quintiles on `PRET`;
2. within each `PRET` quintile, sort into `ID` subportfolios;
3. compute future returns over the next six months and beyond.

The paper then repeats the exercise with independent double sorts to make sure the result is not just residual variation in `PRET` sneaking into the second sort.

This is the key identification step. It shows the effect is not simply "extreme winners keep winning." It is "among comparable winners, the ones built by continuous information continue more."

### 5. Quantify the effect over the holding horizon

The paper's headline number is that six-month momentum varies monotonically with `ID`: it is strongly positive for low-`ID` stocks and becomes weak or negative for high-`ID` stocks with similar formation returns.

The path of returns after formation is also informative:

- low-`ID` momentum persists for roughly eight months;
- high-`ID` momentum decays quickly and can reverse.

That persistence profile is crucial. The variable is not a one-month filter; it changes the entire continuation-versus-reversal trajectory.

### 6. Validate the salience interpretation with attention proxies

The hypothesis requires discrete information to be more visible. The paper therefore regresses `ID` and future returns on attention-related variables such as:

- changes in turnover,
- media coverage,
- analyst coverage,
- and earnings surprises.

The results line up with the theory:

- high-`ID` stocks receive more media attention and trading activity;
- low-`ID` stocks look more neglected;
- the FIP effect weakens when media coverage is high.

So the paper is not just using a return-path proxy in isolation. It shows that the proxy maps to economically plausible salience differences.

### 7. Compare `ID` with competing path-based variables

The authors test whether `ID` is just a relabeling of other momentum-conditioners such as:

- return consistency,
- unrealized capital gains or disposition-effect proxies,
- idiosyncratic volatility,
- and alternative path metrics.

They also build alternative versions of the signal, including:

$$
IDMAG = - \sum_i \operatorname{sgn}(PRET)\operatorname{sgn}(Return_i) w_i,
$$

which lets the path measure depend on daily-return magnitudes, and versions that account explicitly for zero-return days or use analyst forecast revisions instead of returns.

The effect survives. That is important because the baseline `ID` measure is intentionally simple and could otherwise be dismissed as too coarse.

### 8. What a reader should implement

A faithful implementation is:

1. compute standard formation-period momentum `PRET`;
2. calculate `ID` from the daily signs inside the formation window;
3. rank on `PRET` first and then on `ID`;
4. favor low-`ID` winners and low-`ID` losers if seeking continuation;
5. treat high-`ID` names as late-stage momentum where the move is already salient and closer to reversal.

The paper's practical lesson is that momentum depends not only on how far the stock moved, but on how visible the underlying information path was.

## Domain of applicability

- **Where it works well:** Equity universes with reliable daily returns and attention-sensitive price formation.
- **What is implementable:** A momentum overlay that conditions on whether the formation-period return arrived continuously or discretely.
- **Main limitation:** `ID` is still a proxy for information flow rather than a direct observation of news arrival. Different return paths can share the same `ID`.
- **Why the paper matters:** It shows that momentum depends not only on *how much* the stock moved, but on *how the move was built*.
