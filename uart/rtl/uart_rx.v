`timescale 1ns/1ps
module uart_rx (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       rx,
    input  wire       oversample_tick,
    output reg [7:0] rx_data,
    output reg       rx_valid,
    output reg       frame_error
);
    localparam [1:0]
        IDLE  = 2'b00,
        START = 2'b01,
        DATA  = 2'b10,
        STOP  = 2'b11;
    reg [1:0] state;
    reg [7:0] shift_reg;
    reg [2:0] bit_count;
    reg [3:0] sample_count;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state        <= IDLE;
            rx_data      <= 8'd0;
            rx_valid     <= 1'b0;
            frame_error  <= 1'b0;
            shift_reg    <= 8'd0;
            bit_count    <= 3'd0;
            sample_count <= 4'd0;
        end
        else begin
            //----------------------------------
            // Default pulse behavior
            //----------------------------------
            rx_valid <= 1'b0;
            case(state)
                //----------------------------------
                // IDLE
                //----------------------------------
                IDLE: begin
                    frame_error <= 1'b0;
                    bit_count    <= 3'd0;
                    sample_count <= 4'd0;
                    if (rx == 1'b0) begin
                        state <= START;
                    end
                end
                //----------------------------------
                // START BIT VALIDATION
                //----------------------------------
                START: begin
                    if (oversample_tick) begin
                        if (sample_count == 4'd7) begin
                            if (rx == 1'b0) begin
                                sample_count <= 4'd0;
                                bit_count    <= 3'd0;
                                state <= DATA;
                            end
                            else begin
                                state <= IDLE;
                            end
                        end
                        else begin
                            sample_count <= sample_count + 1'b1;
                        end
                    end
                end
                //----------------------------------
                // DATA BITS
                //----------------------------------
                DATA: begin
                    if (oversample_tick) begin
                        if (sample_count == 4'd15) begin
                            sample_count <= 4'd0;
                            shift_reg[bit_count] <= rx;
                            if (bit_count == 3'd7) begin
                                state <= STOP;
                            end
                            else begin
                                bit_count <= bit_count + 1'b1;
                            end
                        end
                        else begin
                            sample_count <= sample_count + 1'b1;
                        end
                    end
                end
                //----------------------------------
                // STOP BIT
                //----------------------------------
                STOP: begin
                    if (oversample_tick) begin
                        if (sample_count == 4'd15) begin
                            sample_count <= 4'd0;
                            if (rx == 1'b1) begin
                                rx_data  <= shift_reg;
                                rx_valid <= 1'b1;
                            end
                            else begin
                                frame_error <= 1'b1;
                            end
                            state <= IDLE;
                        end
                        else begin
                            sample_count <= sample_count + 1'b1;
                        end
                    end
                end
                //----------------------------------
                // Recovery
                //----------------------------------
                default: begin
                    state        <= IDLE;
                    sample_count <= 4'd0;
                    bit_count    <= 3'd0;
                end
            endcase
        end
    end
endmodule
