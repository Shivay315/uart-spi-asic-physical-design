# SCL Report — UART/SPI Implementation Extracts

## UART — Chapter 7.4, pages 49–56

The report describes a full-duplex configurable UART with transmitter, receiver, programmable baud generation, oversampling and frame-error detection. Functional verification preceded ASIC implementation. Genus was used for synthesis; Innovus was used for core-only and I/O-pad-integrated physical implementation, including CTS and post-route optimization, followed by DRC and GDSII preparation.

Published measurements:

- Genus total power: `7.39923e-05 W`
- Innovus instance count: `339`
- Innovus area: `9994.432`
- Innovus total power: `0.57686031` (unit not stated in excerpt)
- Chip-level IO evidence: `65` pads

## SPI — Chapter 7.6, pages 65–70

The report describes a configurable SPI master with clock generation, FSM, shift register, bit counter, programmable divider and CPOL/CPHA support. Genus synthesis and Innovus physical implementation are documented through floorplanning, placement, CTS, routing and post-route optimization.

Published measurements:

- Genus total power: `3.60721e-04 W`
- Innovus instance count: `237`
- Innovus area: `6043.072`
- Innovus total power: `0.41032857` (unit not stated in excerpt)
