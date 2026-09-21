`timescale 1ns/1ps
module uart_top (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [15:0] baud_div,
    input  wire [15:0] oversample_div,
    input  wire [7:0] tx_data,
    input  wire       tx_valid,
    output wire       tx_busy,
    output wire [7:0] rx_data,
    output wire       rx_valid,
    output wire       frame_error
);
    //----------------------------------
    // Internal Signals
    //----------------------------------
    wire baud_tick;
    wire oversample_tick;
    wire serial_line;
    //----------------------------------
    // TX Baud Generator
    //----------------------------------
    baud_gen tx_baud_gen (
        .clk       (clk),
        .rst_n     (rst_n),
        .baud_div  (baud_div),
        .baud_tick (baud_tick)
    );
    //----------------------------------
    // RX Oversample Generator
    //----------------------------------
    baud_gen rx_os_gen (
        .clk       (clk),
        .rst_n     (rst_n),
        .baud_div  (oversample_div),
        .baud_tick (oversample_tick)
    );
    //----------------------------------
    // UART TX
    //----------------------------------
    uart_tx tx_inst (
        .clk       (clk),
        .rst_n     (rst_n),
        .baud_tick (baud_tick),
        .tx_data   (tx_data),
        .tx_valid  (tx_valid),
        .tx        (serial_line),
        .tx_busy   (tx_busy)
    );
    //----------------------------------
    // UART RX
    //----------------------------------
    uart_rx rx_inst (
        .clk             (clk),
        .rst_n           (rst_n),
        .rx              (serial_line),
        .oversample_tick (oversample_tick),
        .rx_data         (rx_data),
        .rx_valid        (rx_valid),
        .frame_error     (frame_error)
    );
endmodule
