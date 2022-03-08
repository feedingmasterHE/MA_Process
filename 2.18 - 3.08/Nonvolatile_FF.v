`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/21 15:32:26
// Design Name: 
// Module Name: Nonvolatile_FF
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


module nonvolatile_ff(
    input clk,
    input rst,
    input d,
    input read_mtj,
    input write_mtj,
    output reg q
    );
    
   reg store_MTJ;
   //assign store_MTJ  = write_mtj ? d : store_MTJ;
    
    //write process in the MTJ corresponding to the signal write_mtj
    always@(posedge clk,negedge rst) begin
        if(!rst)
            store_MTJ <= 1'b0;
        else begin
            if(write_mtj) 
                store_MTJ <= d;
            else 
                store_MTJ <= store_MTJ;
        end
           
    end
    
    
    //read process
    always@(posedge clk,negedge rst) begin
        if(!rst) 
            q <= 1'b0;
        else begin
            if(read_mtj)
                q <= store_MTJ;
            else
                q <= d;
        end
    end
   
    
    
endmodule
