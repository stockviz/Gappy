# Market Reaction to Earnings News: A Unified Test of Information Risk and Transaction Costs
**Authors:** Qianqiu Zhang, Chao Cai, Kevin Keasey
**Year:** 2013
**Journal/Venue:** Journal of Accounting and Economics

## Problem statement

Two literatures try to explain post-earnings-announcement drift (PEAD):

- **information risk**: high-uncertainty firms deliver more informative announcements;
- **transaction costs**: frictions slow down price adjustment.

This paper asks how those two channels fit together. In particular, it asks whether information risk affects drift directly, or whether it mainly matters because it raises transaction costs and thereby slows price discovery.

## Approach (short)

The paper constructs standardized unexpected earnings

$$
SUE_{i,q}=\frac{e_{i,q}-e_{i,q-4}}{s_{i,q}},
$$

extracts three latent information-risk factors from eight proxies, and estimates systems of equations for:

1. the initial earnings response coefficient (ERC),
2. transaction costs,
3. post-announcement returns.

The main ERC specification is

$$
CAR=\alpha+\beta SUE+\sum_i \lambda_i(Factor_i\times SUE)+\kappa(Cost\times SUE)+\sum_j \eta_j(Control_j\times SUE)+\varepsilon,
$$

estimated jointly with

$$
Cost=\alpha+\sum_i \gamma_i Factor_i+\sum_j \theta_j Control_j+u
$$

by GMM. The paper finds that information risk raises the announcement response per unit of surprise, but it also raises transaction costs, which depress the initial reaction and explain the later drift.

## Approach (detailed)

### 1. Define the earnings surprise carefully

The sample is U.S. earnings announcements from the first quarter of 1993 to the second quarter of 2007. The surprise measure is:

$$
SUE_{i,q}=\frac{e_{i,q}-e_{i,q-4}}{s_{i,q}},
$$

where `e_{i,q}` is quarterly earnings before extraordinary items and discontinued operations, and `s_{i,q}` is the standard deviation of seasonal earnings changes over the preceding eight quarters.

This is a standard seasonal-random-walk SUE, but the paper then converts SUE into quintiles for the interaction regressions, which makes the coefficients easy to interpret as state-dependent differences in response.

### 2. Reduce many information-risk proxies to three factors

Instead of choosing one proxy, the paper uses eight:

- `ARBI` for arbitrage risk,
- `SIGMA` for volatility,
- `DISP` for analyst-dispersion,
- `DTO` for change in market-adjusted turnover,
- `SUV` for standardized unexpected volume,
- `MV` for firm size,
- `COV` for analyst coverage,
- `AGE` for firm age.

Factor analysis on these variables produces three information-risk factors. This step is methodologically important because it avoids over-interpreting any one proxy and lets the paper study dimensions of information risk rather than a single noisy scalar.

### 3. Model transaction costs as an endogenous channel

The paper measures transaction costs using:

- `BAS`: the percentage bid-ask spread on and one day after the announcement;
- `LDV`: an alternative transaction-cost proxy estimated from prior trading data.

Rather than plugging transaction costs into the return equation as an exogenous control, the paper recognizes that information risk affects costs. Hence the system:

$$
Cost=\alpha+\sum_i \gamma_i Factor_i+\sum_j \theta_j Control_j+u.
$$

This is the bridge equation. It is what turns the paper from "two variables both matter" into a causal architecture in which information risk partly works through costs.

### 4. Estimate the initial announcement reaction with an ERC system

The initial response is measured with cumulative size-adjusted returns on and one day after the announcement (`CAR2d`), with a longer-window robustness measure as well.

The ERC regression is:

$$
CAR=\alpha+\beta SUE+\sum_i \lambda_i(Factor_i\times SUE)+\kappa(Cost\times SUE)+\sum_j \eta_j(Control_j\times SUE)+\varepsilon.
$$

Controls include interactions with:

- persistence,
- predictability of earnings,
- a loss dummy,
- a fourth-quarter dummy,
- book-to-market,
- market beta.

Because the cost equation and CAR equation may have correlated residuals, the paper estimates them jointly by GMM.

The main findings are:

- `Factor × SUE` coefficients are positive: higher information risk makes a unit of earnings surprise more informative;
- `Cost × SUE` is negative: higher transaction costs damp the immediate price response.

That means information risk has two effects at once:

1. a positive **information-content** effect,
2. a negative **transaction-cost** effect.

### 5. Test post-announcement returns directly

The paper then turns to PEAD using quarter-by-quarter Fama-MacBeth regressions:

$$
R_{qQ}=\alpha+\beta SUE+\sum_i \lambda_i(Factor_i\times SUE)+\kappa(Cost\times SUE)+\sum_l \eta_l(Control_l\times SUE)+\sum_l \rho_l Control_l+\varepsilon.
$$

Here `R1Q` is the return from the second day after the announcement to the day before the next announcement, and `R4Q` extends four quarters forward.

The crucial result is:

- without explicit cost controls, higher information risk appears to predict more drift;
- once transaction costs are included, the direct effect of information risk disappears.

So the paper's unified conclusion is that information risk matters for PEAD mainly because it creates higher transaction costs.

### 6. Test the economic significance with hedged PEAD portfolios

The paper also forms PEAD hedge portfolios within information-risk quintiles:

1. long positive-SUE firms,
2. short negative-SUE firms,
3. estimate factor-model alphas before and after deducting transaction costs.

The cost adjustment uses the bid-ask spread at entry and exit:

- half the spread when the stock enters the portfolio,
- half the spread when it leaves.

Before costs, higher-information-risk portfolios show larger abnormal returns. After costs, most of those alphas vanish. This is a strong economic check on the regression evidence.

### 7. Why the GMM system matters

The paper could have run separate OLS regressions, but the system approach matters because:

- information risk determines costs,
- costs determine how much surprise is impounded initially,
- and both equations are estimated on the same announcement events.

That structure lets the paper identify two effects of information risk rather than averaging them into one coefficient.

## Domain of applicability

- **Where it works well:** Earnings-announcement event studies, PEAD strategies, and settings where information asymmetry and trading frictions are both plausible.
- **What is implementable:** State-dependent PEAD strategies that explicitly haircut expected alpha by transaction costs.
- **Main limitation:** The factor-analysis step makes the information-risk factors harder to interpret economically than simple raw proxies.
- **Why the paper matters:** It shows that information risk does not just make announcements more informative; it also makes them more expensive to arbitrage, and that second effect explains much of the drift.
