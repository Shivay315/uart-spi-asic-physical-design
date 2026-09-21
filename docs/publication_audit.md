# Public-Repository Audit

## Included

- Supplied UART RTL
- Sanitized Cadence and Synopsys screenshots
- Evidence-derived UART pad-ring summary
- SCL-report-derived UART/SPI methodology and numerical results
- Reconstructed Genus/Innovus reference TCL

## Intentionally omitted

- Raw UART `.io` files
- PDK IO LEF (`pdkIO.lef`)
- Standard-cell libraries
- Cadence databases / DEF / GDS outputs
- SCL internal paths, hostnames and infrastructure details
- SPI RTL because it was not supplied in the current source package

## Reason

The omitted items are proprietary technology collateral, generated implementation databases, internal infrastructure details, or missing source material. No missing SPI implementation is invented.

The PDK-specific UART chip wrapper and IO LEF were intentionally omitted because they directly expose technology-specific pad cells. The 65-pad integration is documented textually instead.
