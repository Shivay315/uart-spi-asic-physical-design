# SPI Architecture

The SCL report describes the SPI master as a configurable serial controller composed of:

- serial-clock generation
- finite-state machine
- shift register
- bit counter
- programmable clock divider
- CPOL/CPHA mode support

The current public source package does not include the SPI RTL, so this document is an architecture record derived from the internship report rather than an implementation source tree.
