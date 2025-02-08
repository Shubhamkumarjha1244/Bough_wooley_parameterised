`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2025 19:47:28
// Design Name: 
// Module Name: bough_wooley_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bough_wooley_tb();
    parameter size=4;
    reg[size-1:0] input1,input2;
    wire [(2*size)-1:0] product;
    woogh_boogly dut(input1,input2,product);
    initial
        begin
            input1=9;
            input2=2;
        end
endmodule
