`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 04:15:34 PM
// Design Name: 
// Module Name: forwardmux
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


module forwardmux(
forwarda,
forwardb,
ex_mem_rd,
mem_wb_rd,
id_ex_rs,
id_ex_rt,
ex_mem_regwrite,
ex_mem_memwrite,
mem_wb_regwrite
    );
    input [4:0] ex_mem_rd,mem_wb_rd,id_ex_rs,id_ex_rt;
    input ex_mem_regwrite, mem_wb_regwrite,ex_mem_memwrite;
    output [1:0] forwarda,forwardb;
    
    assign forwarda = (ex_mem_regwrite&&(ex_mem_rd == id_ex_rs))?2'b10:(mem_wb_regwrite&&(mem_wb_rd == id_ex_rs))?2'b01:2'b00;
    assign forwardb = ((ex_mem_memwrite||ex_mem_regwrite)&&(ex_mem_rd == id_ex_rt))?2'b10:(mem_wb_regwrite&&(mem_wb_rd == id_ex_rt))?2'b01:2'b00;
    
endmodule
