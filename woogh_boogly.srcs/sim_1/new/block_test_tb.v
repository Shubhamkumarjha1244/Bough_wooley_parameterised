`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2025 17:13:10
// Design Name: 
// Module Name: block_test_tb
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


//module block_test_tb();
//parameter size=4;
//reg[size-1:0] arr;
//reg inn;
//wire[size-1:0] out;

////to check and_block
//    //and_block dut(arr,inn,out);
////to check Nand_block
//    nand_block dut(arr,inn,out);
//initial
//    begin
//    arr=4'b1010;
//    inn=1'b0;
//    #10
//    arr=4'b1010;
//    inn=1'b1;
//    end
//endmodule


module horizontal_full_adder_block_test_tb();
    parameter size=3;
    reg[size-1:0] vertical_inn,horizontal_inn,carry_in;
    wire[size-1:0] sum,carry_out;
    
    
   adder_block dut(vertical_inn,horizontal_inn,carry_in,sum,carry_out);
        
           
    initial
        begin
            vertical_inn=3'b111;
            horizontal_inn=3'b111;
            carry_in=3'b111;
            #10
            vertical_inn=3'b111;
            horizontal_inn=3'b111;
            carry_in=3'b000;
        end
        
endmodule
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

