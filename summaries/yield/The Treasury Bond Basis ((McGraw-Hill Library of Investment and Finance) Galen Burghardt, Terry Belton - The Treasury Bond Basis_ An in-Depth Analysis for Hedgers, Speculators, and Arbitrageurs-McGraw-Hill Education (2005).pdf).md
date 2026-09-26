# The Treasury Bond Basis — Detailed Quantitative Research Notes

**Title:** The Treasury Bond Basis: An In-Depth Analysis for Hedgers, Speculators, and Arbitrageurs  
**Authors:** Galen Burghardt, Terry Belton  
**Year:** 2005  
**Publisher:** McGraw-Hill Education (McGraw-Hill Library of Investment and Finance)  
**Focus:** US Treasury cash–futures basis, CTD, conversion factors, delivery options, hedging, speculative basis trading.

---

## Problem / Motivation

Bond futures are delivery options on a basket, not forwards on one bond. Hedgers and relative-value traders must model gross/net basis, implied repo, CTD switches, and the short’s quality/timing/wildcard options. Mis-hedging with naive duration ignores CF and switch risk.

---

## Core Identities

**Conversion factor (CF):** exchange formula ≈ dirty price at notional coupon (classically 6%) on delivery.  
**Invoice:** $F \times CF + AI$.  
**Gross basis:** $P_{clean} - F\times CF$.  
**Net basis:** gross − carry (coupon − financing).  
**CTD:** minimizes net basis / maximizes IRR (implied repo).  
**Implied repo:** financing rate equating cash-and-carry to futures.

### Hedge ratio
$$
N_f \approx \frac{\mathrm{DV01}_{cash}}{\mathrm{DV01}_{CTD}\times CF}
$$
Recompute across yield scenarios where CTD flips.

### Delivery options
Quality (which bond), timing, wild card, end-of-month—raise futures vs forward on CTD; net basis can be negative by option value.

---

## Trading Applications

1. **Basis RV:** long cheap basis / short rich vs option-adjusted fair value.  
2. **Hedging:** DV01 with CF; scenario CTD.  
3. **Rolls:** calendar spreads embed CF and option changes.  
4. **Speculation:** bet on switch / vol of basis near cusps.

---

## Links

Tuckman bond-futures chapters; Jacobs–Levy Ch.5 gilt CTD grids; Hull duration/PCA.

---

## Numerical Intuition

Notional 6% system: when yields ≪ 6%, low-coupon long-duration bonds tend CTD; when yields ≫ 6%, high-coupon shorter bonds CTD. Switch region = elevated basis vol.


### Basis desk note 1

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 2

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 3

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 4

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 5

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 6

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 7

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 8

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 9

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 10

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 11

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 12

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 13

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 14

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 15

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 16

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 17

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 18

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 19

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 20

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 21

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 22

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 23

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 24

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 25

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 26

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 27

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 28

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 29

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 30

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 31

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 32

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 33

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 34

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 35

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 36

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 37

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 38

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 39

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 40

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 41

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 42

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 43

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 44

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 45

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 46

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 47

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 48

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 49

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 50

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 51

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 52

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 53

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 54

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 55

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 56

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 57

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 58

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 59

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 60

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 61

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 62

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 63

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 64

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 65

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 66

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 67

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 68

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 69

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 70

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 71

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 72

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 73

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 74

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 75

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 76

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 77

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 78

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.

### Basis desk note 79

Monitor gross and net basis for each deliverable vs front future. Flag CTD changes when yield shock grids (e.g., ±10, ±25, ±50, ±100 bp) flip the minimizing bond. Attribute basis P&L to carry, mark of futures vs forward, and delivery-option residual. Enforce repo specialness checks—special CTD financing alters net basis independently of futures fair value. Align invoice AI with exchange delivery standards. For hedges of non-deliverable bonds, add beta/PCA residual limits. Recalibrate CF tables on contract cycle rolls. Document wild-card exercise risk on last delivery days.


---

## Extended CTD and Basis Analytics (Burghardt–Belton Framework)

### Carry components
Carry over hedge horizon $H$:
$$
\mathrm{Carry}=\mathrm{CouponIncome}-\mathrm{RepoInterest}+\mathrm{other}
$$
Special repo on CTD reduces financing cost ⇒ increases carry ⇒ lowers net basis, making the bond “cheaper to deliver” on a net basis metric.

### Implied repo rate (IRR)
Solve $r$ such that buying cash, financing to delivery, and delivering into futures earns $r$. If IRR > actual term repo, cash-and-carry attractive (long basis); if IRR < repo, reverse cash-and-carry (short basis) subject to hard-to-borrow and delivery option risks.

### Option-adjusted basis
Fair net basis ≈ − (value of delivery options to the short). Empirical OA models decompose observed net basis into option value + residual mispricing. Trade residual, not raw negative basis.

### Wild card option
After futures settlement price fixed (afternoon), cash market may still trade; short can exploit favorable moves by choosing delivery. More valuable when cash vol high near delivery window.

### End-of-month / timing options
Rights to choose delivery day within window—interact with accrued interest and coupon dates.

### Quality option dynamics
As yields move through the notional coupon, CTD ranking changes; quality option value peaks near switch points. Hedge ratios that assume fixed CTD fail exactly then—use probability-weighted CTD or scenario hedges.

### Rolling the front future
Calendar spread ≈ basis differential between contracts. Rolls cheap/rich with changing CTD, seasonality, and delivery option decay into expiry.

### Speculative strategies
1. Long basis when OA residual cheap and option models overstate vol.  
2. Short basis when residual rich—mind squeeze risk into delivery.  
3. Curve-basis hybrids: duration-neutral across CTD candidates.  
4. Wildcard harvesting near delivery (specialist).

### Hedging non-deliverables
Corporate/agency bonds hedged with TY/US/WN futures need beta to CTD plus spread overlay; residual curve and credit risk remain. PCA level hedge with futures + spread duration with CDX/cash corporates.

### Historical contract evolution
Notional coupon changes and contract specs alter CF landscape—always read current CME rulebook; pedagogy often uses 6% notional.

### Worked mini-example
Cash mid 120-00, CF 1.1000, futures 108-00 → gross basis = 120 − 108×1.1 = 1.2 points. Carry over quarter 0.7 points ⇒ net basis 0.5. If OA option value 0.4, residual rich 0.1—candidate short basis if financing available.

### Risk limits for basis books
Gross notional, CTD concentration, delivery-month inventory, repo tenor mismatch, wildcard exposure days, scenario P&L under ±100 bp with CTD flip.

### Reporting
Daily: gross/net basis table all deliverables; CTD; IRR vs GC/special; OA residual; DV01 by candidate; delivery calendar countdown.

---

## Cross-Market Notes

Gilt and Bund futures obey analogous CF/CTD logic with local notional coupons and delivery rules—Burghardt–Belton methods transfer with contract-specific adjustments (see also Maltby in Market Neutral Strategies Ch.5).

## Final Assessment

The Treasury Bond Basis is the canonical deep-dive for US Treasury futures basis. Its lasting value is forcing quants to treat futures as **options on CTD** and to hedge/trade with conversion factors, carry, and delivery options explicit. Pair with Tuckman for curve math and Richardson for systematic FI portfolio context.


### Conversion factor quirks

CF formulas are piecewise and can create discontinuities in hedge ratios as bonds age through coupon periods. Recompute CF for each delivery month; do not freeze CF from a prior roll.

CF formulas are piecewise and can create discontinuities in hedge ratios as bonds age through coupon periods. Recompute CF for each delivery month; do not freeze CF from a prior roll. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Repo specialness

When CTD trades special, financing advantage can dominate futures fair-value signals. Monitor GC–special spread alongside basis.

When CTD trades special, financing advantage can dominate futures fair-value signals. Monitor GC–special spread alongside basis. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Delivery month liquidity

Open interest migrates; liquidity holes amplify wildcard and timing option values. Reduce speculative basis size into peak delivery risk weeks.

Open interest migrates; liquidity holes amplify wildcard and timing option values. Reduce speculative basis size into peak delivery risk weeks. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Auction cycle

New issues entering the basket can change CTD probabilities overnight. Maintain watchlist of on-the-run candidates vs old CTD.

New issues entering the basket can change CTD probabilities overnight. Maintain watchlist of on-the-run candidates vs old CTD. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Invoice AI conventions

Mismatch between cash AI and invoice AI is a known pitfall—reconcile with exchange delivery manual each cycle.

Mismatch between cash AI and invoice AI is a known pitfall—reconcile with exchange delivery manual each cycle. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Cross-contract hedges

Using TU vs TY vs US vs WN depends on liability duration; CTD switch risk differs by contract—run separate scenario grids.

Using TU vs TY vs US vs WN depends on liability duration; CTD switch risk differs by contract—run separate scenario grids. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Volatility regimes

High rate vol inflates quality option value and widens fair negative net basis; models calibrated in low-vol regimes understate shorts' rights.

High rate vol inflates quality option value and widens fair negative net basis; models calibrated in low-vol regimes understate shorts' rights. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Balance sheet

Leverage in basis books via repo creates LTCM-style vulnerability when specialness and haircuts jump—set financing liquidity buffers.

Leverage in basis books via repo creates LTCM-style vulnerability when specialness and haircuts jump—set financing liquidity buffers. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Accounting P&L

Separate carry accrual, futures variation, and bond mark—otherwise traders mismanage what looks like 'theta'.

Separate carry accrual, futures variation, and bond mark—otherwise traders mismanage what looks like 'theta'. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

### Model validation

Backtest CTD prediction hit rate across yield shocks; require ≥X% accuracy before trusting automated hedge ratios.

Backtest CTD prediction hit rate across yield shocks; require ≥X% accuracy before trusting automated hedge ratios. Further, document exceptions when empirical CTD differs from model CTD for more than two consecutive days, and escalate to the rates risk committee with a proposed hedge retarget.

---

## Comprehensive Hedge Design Example

Portfolio: \$500M 10-year cash Treasuries, DV01 ≈ \$420k per bp. Front TY future CTD has DV01 per contract ≈ \$85 (illustrative), CF ≈ 0.92. Hedge contracts:
$$
N \approx \frac{420{,}000}{85 \times 0.92} \approx 5{,}370 \text{ contracts}
$$
Run scenarios: yields −50, −25, 0, +25, +50, +100 bp. If CTD switches at +50 bp to a bond with different DV01/CF, recompute N for each scenario; use probability-weighted average or barbell hedges across two candidates near the switch.

### Basis trade sizing
Capital at risk ≈ |net basis| × face + financing haircut buffer. Stop if OA residual mean-reverts through zero against model or if specialness shock exceeds X bp.

### Delivery timeline controls
T−10 business days: cut speculative shorts of rich basis. T−3: inventory only with explicit wildcard mandate. Post-delivery: reconcile actual deliveries vs intended CTD.

### Option Greeks analogue for basis
Treat quality option as short put on relative bond prices within basket; timing options as short calendar options. Rising implied rate vol → more negative fair net basis.

### Integration with systematic FI (Richardson)
Basis RV can be a coded theme: signal = OA residual z-score; trade when |z|>2 with CTD-stability filter; capacity limited by deliverable float and repo.

### Integration with market-neutral FI (Jacobs–Levy Ch.5)
Same identities as gilt net basis −0.0577 example; US Treasury version is Burghardt–Belton’s domain.

### Common failure modes
1. Frozen CTD assumption through a switch.  
2. Ignoring special repo.  
3. Gross vs net basis confusion.  
4. Wrong AI on invoice.  
5. Overlevered repo into delivery squeeze.  
6. Hedging corporates 1:1 into TY without beta.  
7. Using outdated notional coupon CF tables.  
8. Neglecting wildcard on exercise-eligible days.

### Monthly checklist
Update CF/CTD grids; validate OA model vs realized deliveries last 8 quarters; review financing lines; reset scenario probabilities from options/swaptions; report residual basis risk in risk committee pack.

### Glossary
Gross basis, net basis, BNOC, IRR/implied repo, CTD, CF, invoice price, quality option, wild card, EOM option, calendar roll, GC vs special, cash-and-carry, reverse cash-and-carry, OA basis.

### Closing
Burghardt & Belton remain required reading for anyone hedging or trading Treasury futures. The book’s lasting quantitative message: **futures = bond forward − delivery options**, so basis is an option-adjusted spread, not an arbitrage vacuum.


#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.

#### Supplemental CTD scenario paragraph

Recompute the full deliverable set’s net basis under parallel and twist shocks each morning. Maintain a ranked CTD list with gaps in net basis points; when the gap between CTD and second CTD is under 2/32s, treat switch risk as elevated and reduce one-way speculative basis risk by half. Align DV01 hedges to a 50/50 blend of the top two CTD candidates in that state. Record outcomes to improve switch-probability calibration.
