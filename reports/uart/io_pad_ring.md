# UART I/O Pad Ring — Evidence-Derived Record

The supplied UART chip-level `.io` material defines a 65-pad ring.

| Pad cell | Count | Function represented in supplied IO definition |
|---|---:|---|
| `pc3d21` | 3 | `clk`, `rst_n`, `tx_valid` |
| `pc3o02` | 11 | output-side pads including `tx_busy`, `rx_valid`, `frame_error`, `rx_data[7:0]` |
| `pc3b02` | 40 | `tx_data[7:0]`, `baud_div[15:0]`, `oversample_div[15:0]` |
| `pvdc` | 5 | VDD |
| `pv0c` | 6 | VSS |
| **Total** | **65** | |

The raw `.io` and PDK IO LEF are intentionally omitted from the public repository.
