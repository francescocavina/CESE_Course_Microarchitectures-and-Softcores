// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the testbench of a Nx1 multiplexer

module mux_Nx1_tb;
    // Declare local parameters
    localparam N_tb = 4;
    localparam M_tb = 2;

    // Declare DUT Input Signals
    reg  [N_tb-1:0] x_tb;
    reg  [M_tb-1:0] sel_tb;
    wire [N_tb-1:0] y_tb;

    initial begin
        $dumpfile("mux_Nx1_tb.vcd"); // Create a file in which variables will be allocated
        $dumpvars(0, mux_Nx1_tb);    // Allocate desing variables in the created file
        #1000 $finish;               // Simulation duration
    end

    initial begin
        $display($time, " << Starting the Simulation >>");
        x_tb   = 4'b0101;
        sel_tb = 2'b00;
        #10;            // After 10 ns
        sel_tb = 2'b01;
        #10;            // After 20 ns
        sel_tb = 2'b10;
        #10;            // After 30 ns
        sel_tb = 2'b11;
    end

    // DUT Instantiation
    mux_Nx1 
        #(
            .N(N_tb),
            .M(M_tb)
        )
        DUT
        (
            .x(x_tb),
            .sel(sel_tb),
            .y(y_tb)
        );
endmodule;