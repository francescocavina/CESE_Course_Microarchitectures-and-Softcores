// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the HW description for a 1 bit full adder

module sum_1bit (
        input wire a, b, ci,
        output wire s, co
    );

    assign s = a ^ b ^ ci;
    assign co = (a & b) | (a & ci) | (b & ci);
endmodule;
