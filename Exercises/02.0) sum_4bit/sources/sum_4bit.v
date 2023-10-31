// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the HW description for a 4 bit full adder

module sum_4bit (
        input  wire [3:0] a, b,
        input  wire ci,
        output wire [3:0] s,
        output wire co
    );

    wire [5:0] sum_aux;
    assign sum_aux = {1'b0, a, ci} + {1'b0, b, 1'b1};
    assign s    = sum_aux[4:1];
    assign co      = sum_aux[5];
endmodule;