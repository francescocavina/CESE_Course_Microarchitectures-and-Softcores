# Author: Francesco Cavina <francescocavina98@gmail.com>
# For more information refer to https://github.com/steveicarus/iverilog

#! /bin/bash

# Compile the Verilog files
iverilog -o sum_sub_4bit ../sources/sum_sub_4bit.v ../sources/sum_sub_4bit_tb.v

# Run simulation
vvp sum_sub_4bit

# Open the waveform using GTKWave
gtkwave sum_sub_4bit_tb.vcd
