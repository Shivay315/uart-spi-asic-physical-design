# Public-Repository Publication Audit

## UART included
- Core UART Verilog RTL: `uart/rtl/`
- Sanitized synthesis / physical-design screenshots
- Extracted 65-pad IO-ring summary

## UART omitted
- `uart_chip_top.v`: contains PDK-specific pad-cell names/interfaces.
- `uart_chip_top.io` and `uart_chip_top_final.io`: raw PDK-specific pad mapping files.
- `pdkIO.lef`: omitted because it is a PDK/IO-library artifact.
- Raw screenshots: original copies showed internal workstation paths/hostnames.

## SPI
The report documents SPI implementation and results, but no SPI RTL, TCL scripts, standalone reports, or SPI screenshots were supplied in this upload. The SPI section therefore documents only what the supplied report supports.

## Publication warning

Cropping screenshots is only a technical sanitization measure. It does not establish legal/NDA permission. Confirm SCL/employer publication rights before pushing the repository publicly.
