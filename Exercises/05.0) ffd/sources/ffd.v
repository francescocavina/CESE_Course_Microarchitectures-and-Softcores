// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the HW description for an flip flop

module ffd(
        input  wire d, ena, rst, clk,
        output reg  q
    );

    always @(posedge clk) 
        begin
            if(rst == 1'b1) 
                begin
                    q <= 1'b0;
                end
            else if(ena == 1'b1)
                begin
                    q <= d;
                end   
        end
endmodule;