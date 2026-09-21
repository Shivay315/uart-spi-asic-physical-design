`timescale 1ns/1ps
module baud_gen (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [15:0] baud_div,
    output reg         baud_tick
);
    reg [15:0] counter;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter   <= 16'd0;
            baud_tick <= 1'b0;
        end
        else begin
            // Default: no tick
            baud_tick <= 1'b0;
            // Protect against invalid divider
            if (baud_div == 16'd0) begin
                counter <= 16'd0;
            end
            else begin
                if (counter == (baud_div - 1'b1)) begin
                    counter   <= 16'd0;
                    baud_tick <= 1'b1;
                end
                else begin
                    counter <= counter + 1'b1;
                end
            end
        end
    end
endmodule