# Momentum Crashes (Daniel & Moskowitz 2016) — India futures WML adaptation

Status: executed exploratory adaptation.

## What the labels mean

WML is winner-minus-loser: buy the strongest past performers and short the
weakest. Here both legs trade single-stock futures; adjusted equity closes
only form the 12-2 ranking (roughly one year of momentum, skipping the most
recent month). Gross WML is the winner futures return minus the loser futures
return. Net WML also deducts turnover costs. A loser rally hurts the short.

`WML_Static` holds full exposure. `WML_CVol` targets a fixed volatility;
`WML_Gate` goes flat in a two-year bear market with high recent variance;
`WML_Panic` scales exposure using a PRE-fitted return/variance forecast
(variance-only expected return here because the PRE bear sample is thin).
`NIFTY50_TR` is the NIFTY 50 total-return market reference, not a WML leg.

PRE ends 2019-12-31; POST starts 2020-05-01; FULL also includes the
intervening gap. CAGR is annualized compounded return, Vol annualized
volatility, Sharpe annualized return divided by volatility, and MaxDD the
largest peak-to-trough loss (shown negative here). AvgExp is average book
size: 0 is flat and 1 is the standard book. Turnover is the sum of absolute
portfolio-weight changes, not a trade count; strategy metrics include its
modeled cost. The state tables use gross WML before costs. One bp is 0.01
percentage point; their mean daily bp are not annualized returns.

## Paper mapping (and what is NOT a literal reproduction)

The source paper shows that momentum crashes concentrate in panic states — a
negative trailing 24-month market return (the bear indicator I_B) combined with
high ex ante market variance (126-day) — and, crucially, that WML loses most on
bear-market UP days (losers behave like calls, so the short-loser leg is a written
call on the rebound). Its dynamic arm scales exposure by a pre-trained
mean/variance forecast (w proportional to mu_hat / sigma2_hat).

This India arm is an ADAPTATION, differing from the paper on purpose:

- **Momentum**: 12-2 skip-month computed on adjusted cash prices in trading days
  (skip 21d, look back 252d) instead of CRSP value-weighted deciles.
- **Book**: long top-20 / short bottom-20 equal-weight single-stock futures
  (`StockViz.dbo.BHAV_EQ_FUT`, `OPTION_TYP='XX'`, `STRIKE_PR=0`) for BOTH
  legs. No cash stock is shorted. Adjusted cash closes from
  `StockVizDyn.eod_adjusted_nse` are used only to rank the 12-2 signal.
  This is not the paper's value-weighted CRSP deciles.
- **Bear indicator**: trailing 24-month (504 trading-day) cumulative NIFTY 50 TR
  return < 0 — the paper's bear definition on an Indian market proxy, NOT a running drawdown.
- **Market variance**: trailing 126-day variance of daily NIFTY 50 TR returns.
- **Overlay**: a pre-trained mean/variance scalar and a binary gate. This is NOT
  the paper's GJR-GARCH conditional-variance model; the simple gate and the
  variance-only forecast are explicitly labelled approximations.
- **No beta hedge**: conditional market beta is estimated as a diagnostic only;
  it is never used to size a hedge (the task forbids future-beta hedging).

## Data audit
- Universe: India: single-stock futures WML (top/bottom-20, 12-2 momentum)
- Dates: 2015-09-16 to 2026-09-29; 2718 days; 372 futures symbols; 133 rolls.
- Bear days (24m cum return < 0): 132; panic days (bear & high var): 83.
- PRE bear days: 28; minimum required to fit the interaction: 63.
- Roll selection uses only stocks with a positive next-contract futures close
  on that roll date, plus an adjusted cash-price 12-2 score available then.
  The historical futures universe is not built from all-time symbol membership.
- Minimum quoted names at a roll: 138; minimum with usable scores: 80.

Actual quoted positions, not intended positions, by leg:

| Window | Days | Mean live longs | Mean live shorts | Max missing long | Max missing short |
|---|---:|---:|---:|---:|---:|
| PRE | 1050 | 20.00/20 | 19.97/20 | 1 | 1 |
| POST | 1584 | 20.00/20 | 19.98/20 | 0 | 1 |
| FULL | 2716 | 20.00/20 | 19.98/20 | 1 | 1 |

A build fails if either leg averages below 95% quoted returns or any day
has more than two missing held returns. Isolated missing daily marks count as
zero at the intended fixed leg weight; `holding_coverage.csv` shows each day.

## Pre-training limitation (central result)

The full PRE regression is `WML = g0 + gB * bear + gVar * variance +
gInt * bear * variance`. Its coefficients are estimable, but the PRE sample
contains only 28 bear days (gB = 0.014; gInt = -217.4). The protocol requires
at least 63 bear observations before using the interaction. The Panic arm
therefore uses the PRE variance-only forecast `mu = 0.00191 -24.16755 * variance`
and a trailing WML variance. This fallback is not the paper's conditional
mean model. The fixed binary Gate exits when bear AND variance exceeds the
PRE 80th percentile. Neither arm uses POST returns for parameter selection.

## Crash diagnostic (attribution, not a hedge)

State-conditional daily means of the unscaled static WML:

| State | days | mean WML (bp/d) | mean mkt (bp/d) |
|---|---:|---:|---:|
| normal | 2584 | 2 | 5 |
| bear | 132 | -30 | -7 |
| bear_high_var | 83 | -48 | -1 |
| bear_up | 62 | -66 | 156 |

Descriptive within-state contemporaneous WML beta (not an ex-ante hedge):

| State | days | beta (wml~mkt) | mean WML (bp/d) | mean mkt (bp/d) |
|---|---:|---:|---:|---:|
| normal | 2584 | -0.10 | 2 | 5 |
| bear_down | 70 | 0.10 | 2 | -151 |
| bear_up | 62 | 0.44 | -66 | 156 |

Worst WML days (top 10):

| Date | WML | market | bear | panic |
|---|---:|---:|---|---|
| 2024-06-04 | -10.6% | -5.9% | FALSE | FALSE |
| 2019-06-20 | -10.0% | 1.3% | FALSE | FALSE |
| 2019-10-29 | -7.1% | 1.4% | FALSE | FALSE |
| 2020-11-10 | -7.0% | 1.4% | FALSE | FALSE |
| 2020-06-05 | -6.4% | 1.1% | TRUE | TRUE |
| 2017-01-04 | -6.2% | -0.0% | FALSE | FALSE |
| 2018-05-17 | -5.7% | -0.5% | FALSE | FALSE |
| 2026-01-02 | -5.7% | 0.7% | FALSE | FALSE |
| 2016-02-15 | -5.4% | 2.6% | FALSE | FALSE |
| 2019-02-14 | -5.2% | -0.4% | FALSE | FALSE |

In the corrected sample, bear-up WML averages -66 bp/day and bear-down
WML averages 2 bp/day. The within-bear-up beta is 0.44, so the
rebound-day loss is descriptive, not proof of the paper's short-loser
written-call mechanism. Several worst days are outside the bear state.

## Results

### PRE (through 2019-12-31)
| System | N | CAGR | Vol | Sharpe | MaxDD | AvgExp |
|---|---:|---:|---:|---:|---:|---:|
| NIFTY50_TR | 1052 | 12.6% | 12.9% | 0.98 | -16.3% | NA |
| WML_Static | 1050 | -2.1% | 23.6% | 0.03 | -41.5% | 1.00 |
| WML_Gate | 1050 | -2.1% | 23.6% | 0.03 | -41.5% | 1.00 |
| WML_Panic | 1050 | -3.6% | 21.3% | -0.07 | -50.7% | 0.89 |
| WML_CVol | 1050 | -5.0% | 24.5% | -0.09 | -51.4% | 1.16 |

![PRE cumulative return and drawdown](cum_dd_pre.png)

### POST (from 2020-05-01)
| System | N | CAGR | Vol | Sharpe | MaxDD | AvgExp |
|---|---:|---:|---:|---:|---:|---:|
| NIFTY50_TR | 1584 | 14.9% | 14.6% | 1.02 | -16.9% | NA |
| WML_Panic | 1584 | 3.4% | 17.5% | 0.28 | -31.2% | 0.68 |
| WML_Gate | 1584 | -1.1% | 17.0% | 0.02 | -32.6% | 0.97 |
| WML_CVol | 1584 | -5.5% | 24.0% | -0.11 | -48.8% | 1.39 |
| WML_Static | 1584 | -5.8% | 18.4% | -0.23 | -45.6% | 1.00 |

![POST cumulative return and drawdown](cum_dd_post.png)

### FULL
| System | N | CAGR | Vol | Sharpe | MaxDD | AvgExp |
|---|---:|---:|---:|---:|---:|---:|
| NIFTY50_TR | 2718 | 11.3% | 16.0% | 0.75 | -38.3% | NA |
| WML_Panic | 2716 | 0.5% | 18.8% | 0.12 | -50.7% | 0.74 |
| WML_Gate | 2716 | -1.0% | 19.9% | 0.05 | -41.5% | 0.97 |
| WML_CVol | 2716 | -5.8% | 24.2% | -0.13 | -61.1% | 1.29 |
| WML_Static | 2716 | -5.2% | 21.1% | -0.14 | -61.5% | 1.00 |

![FULL cumulative return and drawdown](cum_dd_full.png)

## Interpretation

The earlier all-time futures-universe run was INVALID: it selected future F&O
listings and contracts that had already stopped trading. Its missing returns
were silently zero-marked. All metrics and charts above were rebuilt from
roll-date eligible, quoted contracts; do not compare the invalid series as
a strategy candidate.

- Static WML POST CAGR -5.8%, Sharpe -0.23, MaxDD -45.6%; the corrected book is
  still weak, but the old run overstated the evidence of failure.
- The Gate reduces POST MaxDD from -45.6% to -32.6%, and POST CAGR is -1.1%.
- The variance-only Panic fallback has POST CAGR 3.4% and Sharpe 0.28;
  this is an exploratory timing result, not a test of the paper's dynamic rule.
  With only 28 PRE bear days, conditional crash prediction remains underpowered.

## Limitations

- Not a literal reproduction: 12-2 is a trading-day approximation of monthly
  deciles, and the overlay is not the paper's GJR-GARCH model.
- The corporate-action exclusion uses ex-dates no later than each decision,
  but adjusted cash prices may incorporate later back-adjustments; their
  point-in-time adjustment provenance has not been established.
- Lot sizes, margin funding, borrow fees, and spreads are not modelled; drag is
  a flat 25 bps on gross turnover.
- With only 28 PRE bear days, the interaction is too thin for the
  63-observation exploratory guard. The paper's headline dynamic model is not tested.
