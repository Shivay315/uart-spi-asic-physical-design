# UART Architecture

The SCL report describes the UART as a modular full-duplex controller composed of:

- transmitter
- receiver
- programmable baud-rate generation
- receiver oversampling
- frame-error detection

The supplied RTL under `uart/rtl/` contains `uart_top.v`, `uart_tx.v`, `uart_rx.v`, and `baud_gen.v`, plus the supplied chip-level wrapper.
