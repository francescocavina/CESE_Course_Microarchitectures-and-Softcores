// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the testbench of a 2x1 multiplexer

module mux_2x1_tb;
    // Declare DUT Input Signals
    reg  a_tb, b_tb;
    reg  sel_tb;
    wire c_tb;

    initial begin
        $dumpfile("mux_2x1_tb.vcd"); // Create a file in which variables will be allocated
        $dumpvars(0, mux_2x1_tb);    // Allocate desing variables in the created file
        #1000 $finish;               // Simulation duration
    end

    initial begin
        $display($time, " << Starting the Simulation >>");
        a_tb   = 1'b0;
        b_tb   = 1'b1;
        sel_tb = 1'b0;
        #10;            // After 10 ns
        sel_tb = 1'b1;
        #10;            // After 20 ns
        b_tb   = 1'b0;
        #10;            // After 30 ns
        sel_tb = 1'b0;
        #10;            // After 40 ns
        a_tb   = 1'b1;
    end

    // DUT Instantiation
    mux_2x1 DUT (
            .a(a_tb),
            .b(b_tb),
            .sel(sel_tb),
            .c(c_tb)
        );
endmodule;