# Author: Francesco Cavina <francescocavina98@gmail.com>
# For more information refer to https://github.com/steveicarus/iverilog

#! /bin/bash

# Compile the Verilog files
iverilog -o mux_2x1 ../sources/mux_2x1.v ../sources/mux_2x1_tb.v

# Run simulation
vvp mux_2x1

# Open the waveform using GTKWave
gtkwave mux_2x1_tb.vcd
