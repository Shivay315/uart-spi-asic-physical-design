# SPI Master Controller ASIC Implementation

## Design overview

The SCL report describes a configurable SPI Master Controller with:
- programmable serial-clock generation
- FSM-controlled transfer sequencing
- transmit and receive shift registers
- bit counter
- CPOL/CPHA support for all four SPI operating modes
- full-duplex MOSI/MISO transfer

## ASIC implementation

The report states that the SPI controller was:
1. functionally verified,
2. synthesized using Cadence Genus,
3. imported into Cadence Innovus,
4. taken through floorplanning, placement, CTS, routing and post-route optimization,
5. analyzed for area and power,
6. prepared for GDSII generation.

## Supplied-source limitation

No SPI RTL, standalone synthesis/physical-design scripts, raw reports, or SPI screenshots were included in the uploaded source package.

Accordingly, this repository does **not** fabricate or reconstruct an SPI RTL implementation.

## Reported results

| Metric | Value |
|---|---:|
| Innovus instance count | 237 |
| Innovus total area | 6043.072 |
| Genus total power | `3.60721e-04 W` |
| Innovus total power | `0.41032857` |

The Innovus power unit is not stated in the supplied report excerpt, so the value is preserved exactly.

## Timing / verification

No clean numerical SPI WNS/TNS/setup/hold values or numerical DRC/LVS result were supplied in the relevant report section. No such values are claimed here.

## Future addition

If the SPI RTL and authorized implementation artifacts become available, they can be added under:
- `spi/rtl/`
- `spi/constraints/`
- `spi/scripts/`
- `spi/reports/`
- `spi/images/`
