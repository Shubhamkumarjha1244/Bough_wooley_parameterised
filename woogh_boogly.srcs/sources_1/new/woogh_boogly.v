`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2025 16:58:25
// Design Name: 
// Module Name: woogh_boogly
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
module fa(innA,innB,carry_in,sum,carry_out);
    input innA,innB,carry_in;
    output sum,carry_out;
    
    assign {carry_out,sum}=innA+innB+carry_in;
endmodule

module adder_block(vertical_inn,horizontal_inn,carry_in,sum,carry_out);
    parameter size=4;
    input[size-2:0] vertical_inn;
    input[size-2:0] horizontal_inn;
    input [size-2:0] carry_in;
    output[size-2:0] sum;
    output[size-2:0] carry_out;
    
    genvar i;
    
    generate for(i=0;i<size-1;i=i+1)
        begin:full_adder
            fa full_add(vertical_inn[i],horizontal_inn[i],carry_in[i],sum[i],carry_out[i]);    
        end
   endgenerate
endmodule       
    


//endmodule

//block_tested
module nand_block(arr,inn,out);
    parameter size=4;
    input[size-1:0] arr;
    input inn;
    output[size-1:0] out;
    genvar i;
    generate for(i=0;i<size;i=i+1)
    begin:bit
        assign out[i]=~(arr[i]&inn);
    end
    endgenerate       
endmodule

//block_tested
module and_block(arr,inn,out);
    parameter size=4;
    input[size-1:0] arr;
    input inn;
    output [size-1:0] out;
    genvar i;
    generate for(i=0;i<size;i=i+1)
    begin:bit
        assign out[i]=arr[i]&inn;
    end
    endgenerate       
endmodule
    
//module woogh_boogly(input1,input2,product);
//    parameter size=4;
//    input[size-1:0] input1,input2;
//    output[size-1:0] product;
    
//endmodule
