// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the HW description for an Nx1 multiplexer

module mux_Nx1
    #(
        parameter N = 4,
        parameter M = 2
    ) 
    (
        input  wire [N-1:0] x,
        input  wire [M-1:0] sel,
        output wire [N-1:0] y
    );

    assign y = x[sel];
endmodule;