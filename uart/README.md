# UART ASIC Implementation

## Design overview

The SCL report describes a configurable, full-duplex UART controller with:
- dedicated transmitter and receiver units
- programmable baud-rate generation
- 8-bit transmit and receive data paths
- oversampling in the receiver
- frame-error detection

## ASIC implementation

The report states that the UART was:
1. functionally verified,
2. synthesized with Cadence Genus,
3. implemented in Cadence Innovus without IO pads,
4. implemented again with IO pads,
5. taken through CTS and post-route optimization,
6. checked with DRC,
7. prepared for GDSII generation.

## Supplied RTL

The public package contains the supplied core RTL snapshot:
- `uart_top.v`
- `uart_tx.v`
- `uart_rx.v`
- `baud_gen.v`

The PDK-specific chip wrapper is intentionally omitted.

## IO-ring extraction

The supplied final IO definition specifies **65 total pads**:

| Category | Count |
|---|---:|
| Clock/reset/tx_valid input pad type | 3 |
| Output pad type | 11 |
| Bidirectional pad type | 40 |
| VDD | 5 |
| VSS | 6 |
| **Total** | **65** |

The clockwise side distribution in the supplied final IO file is:
- Top: 20 pads
- Right: 18 pads
- Bottom: 9 pads
- Left: 18 pads

Raw IO definitions are intentionally omitted because they contain PDK-specific pad-cell information.

## Reported results

| Metric | Value |
|---|---:|
| Innovus instance count | 339 |
| Innovus total area | 9994.432 |
| Genus total power | `7.39923e-05 W` |
| Innovus total power | `0.57686031` |

The report does not provide a clear unit for the Innovus power block; the value is preserved verbatim.

## Timing / physical verification

The report describes timing-constrained implementation and DRC, but no clean numerical UART WNS/TNS/setup/hold result is supplied in the relevant result excerpt. No numerical DRC count is asserted here.

## Screenshots

See `images/` for sanitized supplied screenshots covering synthesis, schematic/layout, IO-pad implementation, and simulation views.
