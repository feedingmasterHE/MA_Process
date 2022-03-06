`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/04 09:26:22
// Design Name: 
// Module Name: wr_rd_controller
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


module wr_rd_controller(
    input clk,
    input rst,
    output write_mtj,
    output read_mtj
    );
    
    reg[9:0] signal_gen_counter;
    reg wr_mtj;
    reg rd_mtj;
    //counting process for the counter signal  
    always@(posedge clk, negedge rst) begin
        if(!rst)
            signal_gen_counter <= 10'b0;
        else begin
            if(signal_gen_counter < 500)
                signal_gen_counter <= signal_gen_counter + 1;
            else
                signal_gen_counter <= 0;
        end         
            
    end
    
    // generate read/write signal for controlling the Nonvolatile FF corresponding the signal_gen_counter
    always@(posedge clk, negedge rst) begin
        if(!rst) begin
            wr_mtj <= 1'b0;
            rd_mtj <= 1'b0;
        end
        else begin
            if(signal_gen_counter == 400)
                wr_mtj <= 1'b1;
            else if(signal_gen_counter == 500) 
                rd_mtj <= 1'b1;
            else begin
                wr_mtj <= 1'b0;
                rd_mtj <= 1'b0;
            end
        end
    end
    
    assign write_mtj = wr_mtj;
    assign read_mtj = rd_mtj;
endmodule
