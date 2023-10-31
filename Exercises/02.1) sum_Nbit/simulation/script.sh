# Author: Francesco Cavina <francescocavina98@gmail.com>
# For more information refer to https://github.com/steveicarus/iverilog

#! /bin/bash

# Compile the Verilog files
iverilog -o sum_Nbit ../sources/sum_Nbit.v ../sources/sum_Nbit_tb.v

# Run simulation
vvp sum_Nbit

# Open the waveform using GTKWave
gtkwave sum_Nbit_tb.vcd
