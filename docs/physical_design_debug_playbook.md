# Physical-Design Debug Playbook (Reconstructed)

This guide captures the practical command sequence an engineer can discuss for UART/SPI backend implementation. It is reconstructed from the SCL report and public Cadence flow conventions; it is **not claimed to be the original SCL command history**.

```tcl
# placement
placeDesign
optDesign -preCTS

# clock tree
ccopt_design
optDesign -postCTS

# routing
routeDesign

# post-route optimization
optDesign -postRoute

# signoff checks
report_timing
report_area
report_power
verify_drc
verifyConnectivity -type all
```

### DRC debug loop

1. Run `verify_drc`.
2. Classify the violation and locate it in the layout viewer.
3. Check whether the cause is routing, spacing, via selection, power-grid geometry, or an IO/macro boundary condition.
4. Apply the PDK-appropriate repair or route optimization.
5. Re-run DRC and connectivity checks.

Exact rule-specific fixes are intentionally left as PDK-dependent placeholders because the internal SCL rule deck and original debug transcript were not supplied.
