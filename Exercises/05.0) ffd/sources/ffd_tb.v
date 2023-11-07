// Author: Francesco Cavina <francescocavina98@gmail.com>
// Brief:  This is the testbench of a flip flop

module ffd_tb;
    // Declare DUT Input Signals
    reg  d_tb, ena_tb, rst_tb, clk_tb;
    wire q_tb;

    initial begin
        $dumpfile("ffd_tb.vcd");   // Create a file in which variables will be allocated
        $dumpvars(0, ffd_tb);   // Allocate desing variables in the created file
        #1000 $finish;          // Simulation duration
    end   

    initial begin
        $display($time, " << Starting the Simulation >>");
        d_tb   = 1'b0;
        ena_tb = 1'b0;
        rst_tb = 1'b0;
        clk_tb = 1'b0;
        #10;            // After 10 ns
        rst_tb = 1'b1;
        #50;            // After 60 ns
        rst_tb = 1'b0;
        d_tb   = 1'b1;
        #40;            // After 100 ns
        ena_tb = 1'b1;
        #50;            // After 150 ns
        d_tb   = 1'b0;
    end

    always #10 clk_tb = ~ clk_tb; // Toggle after 10 ns

    // DUT Instantiation
    ffd DUT(
        .d(d_tb),
        .ena(ena_tb),
        .rst(rst_tb),
        .clk(clk_tb),
        .q(q_tb)
    );
endmodule;