// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the HW description for an N bit full adder/substractor

module sum_sub_Nbit
    #(
        parameter N = 4
    )
    (
        input wire [N-1:0] a, b,
        input wire ci, sel,
        output wire [N-1:0] s,
        output wire co
    );

    reg [N+1:0] op_aux;

    always @* begin
        if(sel == 1'b0) 
            begin
                op_aux = {1'b0, a, ci} + {1'b0, b, 1'b1}; 
            end
        else 
            begin
                op_aux = {1'b0, a, 1'b1} + {1'b0, ~b, 1'b1};
            end
    end        

    assign s  = op_aux[N:1];
    assign co = op_aux[N+1];  
endmodule;