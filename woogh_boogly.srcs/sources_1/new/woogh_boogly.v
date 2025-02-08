`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: iit patna
// Engineer: shubham kumar jha
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
//block tested
module fa(innA,innB,carry_in,sum,carry_out);
    input innA,innB,carry_in;
    output sum,carry_out;
    
    assign {carry_out,sum}=innA+innB+carry_in;
endmodule
 
//block tested
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
    
module woogh_boogly(input1,input2,product);
    parameter size=4;
    input[size-1:0] input1,input2;
    output[(2*size)-1:0] product;
    wire[size-1:0] first_vertical_inn;
    wire[size-2:0] first_horizontal_inn;
    wire[size-2:0] nand_horizontal_inn;
    wire[size-2:0] first_carry_in;
    
    wire [size-2:0] sum [size-2:0];
    wire[size-2:0] carry [size-2:0];
    wire[size-2:0] gen_horizontal_inn[size-3:1];
    
    genvar i;

    

    

    
    
    //first row (tested)
    and_block and_v_1(input1[size-2:0],input2[0],first_vertical_inn[size-2:0]);
    assign first_vertical_inn[size-1]=~(input1[size-1]&input2[0]);
    
    and_block and_h_1(input1[size-2:0],input2[1],first_horizontal_inn);
    
    adder_block add1(first_vertical_inn[size-1:1],first_horizontal_inn,3'b000,sum[0],carry[0]);
    assign product[0]=first_vertical_inn[0];
    assign product[1]=sum[0][0];
    
    
    
    //generate block for FA_block(tested)
    
    generate for(i=1;i<size-2;i=i+1)
        begin:fa_block
            and_block and_h(input1[size-2:0],input2[i+1],gen_horizontal_inn[i]);
            adder_block add1({~(input1[size-1]&input2[i]),sum[i-1][size-2:1]},gen_horizontal_inn[i],carry[i-1],sum[i],carry[i]);
            assign product[i+1]=sum[i][0];
       end
   endgenerate
   
   //FA_nand_block
            nand_block nand1(input1[size-2:0],input2[size-1],nand_horizontal_inn);
            adder_block add_nand({~(input1[size-1]&input2[size-2]),sum[size-3][size-2:1]},nand_horizontal_inn,carry[size-3],sum[size-2],carry[size-2]);
            assign product[size-1]=sum[size-2][0];
            
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
