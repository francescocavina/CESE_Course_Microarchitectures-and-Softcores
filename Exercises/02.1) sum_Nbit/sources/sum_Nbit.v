// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the HW description for an N bit full adder

module sum_Nbit 
    #(
        parameter N = 4
    )
    (
        input wire  [N-1:0] a, b,
        input wire  ci,
        output wire [N-1:0] s,
        output wire co
    );

    wire [N+1:0] sum_aux;
    assign sum_aux = {1'b0, a, ci} + {1'b0, b, 1'b1};
    assign s       = sum_aux[N:1];
    assign co      = sum_aux[N+1];
endmodule;