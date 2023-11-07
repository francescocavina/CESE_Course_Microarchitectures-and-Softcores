// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the HW description for a 2x1 multiplexer

module mux_2x1(
        input wire a, b,
        input wire sel,
        output reg c
    );

    always @ (a, b, sel) begin
        if(sel == 1'b0) 
            begin
                c = a;
            end
        else
            begin
                c = b;
            end
    end
endmodule;