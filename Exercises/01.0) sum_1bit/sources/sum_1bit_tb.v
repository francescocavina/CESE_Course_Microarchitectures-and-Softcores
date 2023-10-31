// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the testbench of a 1 bit full adder

`timescale 1 ns / 100 ps

module sum_1bit_tb;
    // DUT Input Signals
    reg a_tb, b_tb, ci_tb;
    wire s_tb, co_tb;

    initial begin
        $dumpfile("sum_1bit_tb.vcd"); // Create a file in which variables will be allocated
        $dumpvars(0, sum_1bit_tb);    // Allocate desing variables in the created file
        #1000 $finish;                // Simulation duration
    end

    initial begin
        $display($time, " << Starting the Simulation >>");
        a_tb  = 1'b0;
        b_tb  = 1'b0;
        ci_tb = 1'b0;
    end

    // Test Signals Generation
    always #10 a_tb  = ~ a_tb;  // Invert after 10 ns
    always #20 b_tb  = ~ b_tb;  // Invert after 20 ns
    always #40 ci_tb = ~ ci_tb; // Invert after 40 ns

    // DUT Instantiation
    sum_1bit DUT(.a(a_tb), .b(b_tb), .ci(ci_tb), .s(s_tb), .co(co_tb));
endmodule

