// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the testbench of a 4 bit full adder

`timescale 1 ns / 100 ps

module sum_4bit_tb;
    // DUT Input Signals
    reg  [3:0] a_tb, b_tb;
    reg  ci_tb;
    wire [3:0] s_tb;
    wire co_tb;

    initial begin
    $dumpfile("sum_4bit_tb.vcd"); // Create a file in which variables will be allocated
    $dumpvars(0, sum_4bit_tb);    // Allocate desing variables in the created file
    #1000 $finish;                // Simulation duration
    end

    initial begin
        $display($time, " << Starting the Simulation >>");
        a_tb  = 4'b0;
        b_tb  = 4'b0;
        ci_tb = 1'b0;
        #10;             // After 10 ns
        a_tb  = 4'b1000; // Set a_tb  = 8
        b_tb  = 4'b0011; // Set b_tb  = 3
        #10;             // After 20 ns
        ci_tb = 1'b1;    // Set ci_tb = 1
        #10;             // After 30 ns
        b_tb  = 4'b1010; // Set b_tb  = 10
    end

    // DUT Instantiation
    sum_4bit DUT(.a(a_tb), .b(b_tb), .ci(ci_tb), .s(s_tb), .co(co_tb));
endmodule;