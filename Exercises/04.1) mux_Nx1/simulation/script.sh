# Author: Francesco Cavina <francescocavina98@gmail.com>
# For more information refer to https://github.com/steveicarus/iverilog

#! /bin/bash

# Compile the Verilog files
iverilog -o mux_Nx1 ../sources/mux_Nx1.v ../sources/mux_Nx1_tb.v

# Run simulation
vvp mux_Nx1

# Open the waveform using GTKWave
gtkwave mux_Nx1_tb.vcd
