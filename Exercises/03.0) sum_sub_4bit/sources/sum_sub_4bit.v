// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the HW description for an N bit full adder/substractor

module sum_sub_4bit(
        input wire [3:0] a, b,
        input wire ci, sel,
        output wire [3:0] s,
        output wire co
    );

    reg [5:0] op_aux;

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

    assign s  = op_aux[4:1];
    assign co = op_aux[5];  
endmodule;