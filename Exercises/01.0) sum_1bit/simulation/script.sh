# Author: Francesco Cavina <francescocavina98@gmail.com>
# For more information refer to https://github.com/steveicarus/iverilog

#! /bin/bash

# Compile the Verilog files
iverilog -o sum_1bit ../sources/sum_1bit.v ../sources/sum_1bit_tb.v

# Run simulation
vvp sum_1bit

# Open the waveform using GTKWave
gtkwave sum_1bit_tb.vcd



