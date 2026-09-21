`timescale 1ns/1ps
module uart_tx (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       baud_tick,
    input  wire [7:0] tx_data,
    input  wire       tx_valid,
    output reg        tx,
    output reg        tx_busy
);

    localparam [1:0]
        IDLE  = 2'b00,
        START = 2'b01,
        DATA  = 2'b10,
        STOP  = 2'b11;
    reg [1:0] state;
    reg [7:0] shift_reg;
    reg [2:0] bit_count;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= IDLE;
            tx        <= 1'b1;
            tx_busy   <= 1'b0;
            shift_reg <= 8'd0;
            bit_count <= 3'd0;
        end
        else begin
            case(state)
                //--------------------------------------
                // IDLE
                //--------------------------------------
                IDLE: begin
                    tx        <= 1'b1;
                    tx_busy   <= 1'b0;
                    bit_count <= 3'd0;
                    if (tx_valid && !tx_busy) begin
                        shift_reg <= tx_data;
                        tx_busy   <= 1'b1;
                        state     <= START;
                    end
                end
                //--------------------------------------
                // START BIT
                //--------------------------------------
                START: begin
                    tx <= 1'b0;
                    if (baud_tick) begin
                        state <= DATA;
                    end
                end
                //--------------------------------------
                // DATA BITS
                //--------------------------------------
                DATA: begin
                    tx <= shift_reg[0];
                    if (baud_tick) begin
                        shift_reg <= shift_reg >> 1;
                        if (bit_count == 3'd7) begin
                            state <= STOP;
                        end
                        else begin
                            bit_count <= bit_count + 1'b1;
                        end
                    end
                end
                //--------------------------------------
                // STOP BIT
                //--------------------------------------
                STOP: begin
                    tx <= 1'b1;
                    if (baud_tick) begin
                        state     <= IDLE;
                        tx_busy   <= 1'b0;
                        bit_count <= 3'd0;
                    end
                end
                //--------------------------------------
                // RECOVERY
                //--------------------------------------
                default: begin
                    state     <= IDLE;
                    tx        <= 1'b1;
                    tx_busy   <= 1'b0;
                    bit_count <= 3'd0;
                end
            endcase
        end
    end
endmodule
