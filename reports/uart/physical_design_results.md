# UART — Innovus Physical-Design Evidence

**Source:** SCL internship report, Chapter 7.4, report pages 55–56.

## Area

```text
Innovus Area Report:

Hinst Name                        Module Name       Inst Count       Total Area
--------------------------------------------------------------------------------
uart_top                                             339            9994.432
```

## Power

```text
Total Internal Power:         0.50895602            88.2286%
Total Switching Power:       0.06777921            11.7497%
Total Leakage Power:         0.00012508             0.0217%
Total Power:                 0.57686031

Total instances in design: 339
Total instances in design with no power: 0
Total instances in design with no activity: 0
```

The report excerpt does not explicitly state the unit for the Innovus total-power value, so this repository preserves `0.57686031` exactly as reported and does not add a unit.

## Implementation flow

The report states that the UART was implemented first without I/O pads and then with I/O pad cells. Both configurations underwent CTS and post-route optimization followed by DRC and GDSII preparation.
