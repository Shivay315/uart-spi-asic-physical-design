# UART & SPI ASIC Physical Design

A public-facing engineering record of ASIC synthesis and physical-design work on a **configurable UART controller** and **SPI master controller** using Cadence Genus and Cadence Innovus during the SCL internship.

The two designs are intentionally maintained as separate sections:

- [`uart/`](uart/)
- [`spi/`](spi/)

> **Scope note:** The supplied evidence establishes ASIC implementation activity and reports results. This repository does not claim personal authorship of the original UART/SPI RTL unless the supplied material proves it.

## Overview

The SCL internship report describes both a configurable UART controller and an SPI master controller passing through the RTL-to-GDSII implementation methodology.

For UART, the supplied material includes core Verilog RTL, an IO-ring definition, and Cadence/Synopsys screenshots.

For SPI, the supplied material includes the implementation description and numerical Genus/Innovus results in the SCL report, but no SPI RTL/scripts/archive were supplied in this upload.

## Tools & Technology

- Cadence Genus — synthesis
- Cadence Innovus — physical implementation
- Synopsys Design Compiler / VCS — additional flow exposure documented in the internship report
- SCL 180 nm CMOS context
- Reported Genus technology library: `tsl18fs120_scl_ss_1`

Proprietary PDKs, standard-cell/IO libraries, LEF files, and generated databases are intentionally excluded.

## ASIC Flow

![RTL-to-GDSII flow](docs/rtl-to-gdsii.svg)

1. RTL
2. Functional verification
3. Logic synthesis
4. Floorplanning
5. Placement
6. Clock-tree synthesis
7. Routing
8. Post-route optimization
9. Timing / physical verification
10. GDSII preparation

## Results At A Glance

| Design | Innovus instances | Innovus area | Genus total power | Innovus total power |
|---|---:|---:|---:|---:|
| UART | 339 | 9994.432 | `7.39923e-05 W` | `0.57686031` |
| SPI | 237 | 6043.072 | `3.60721e-04 W` | `0.41032857` |

**Important:** The report does not state a unit for the Innovus total-power blocks in the UART/SPI excerpts. Values are therefore preserved exactly as reported and are not converted.

Timing metrics such as WNS/TNS are not included because clean numerical values were not supplied in the report.

## Repository Structure

```text
uart-spi-asic-physical-design/
├── README.md
├── LICENSE
├── .gitignore
├── docs/
│   ├── rtl-to-gdsii.svg
│   ├── source_reference.md
│   └── publication_audit.md
├── uart/
│   ├── rtl/
│   ├── constraints/
│   ├── scripts/
│   ├── reports/
│   ├── images/
│   └── results/
└── spi/
    ├── rtl/
    ├── constraints/
    ├── scripts/
    ├── reports/
    ├── images/
    └── results/
```

## Reproduction / Usage

A full rerun is not possible from this public package alone because the original implementation depended on SCL infrastructure, proprietary PDK/library assets and Cadence installation files.

The expected conceptual order is:

```text
RTL
 ↓
Genus synthesis + constraints
 ↓
gate-level netlist / reports
 ↓
Innovus initialization
 ↓
floorplan / power plan / placement
 ↓
CTS / routing / post-route optimization
 ↓
timing / area / power / DRC
 ↓
GDSII preparation
```

No complete Genus/Innovus TCL implementation scripts were supplied in the upload, so runnable scripts are not fabricated.

## Publication Safety

PDK-specific files and raw pad-ring definitions are intentionally omitted. Sanitized screenshots are used instead of the original screenshots where workstation paths/hostnames were visible.

Before public release, confirm that the internship/employer permits publication of the remaining RTL and screenshots.
