# Author: Francesco Cavina <francescocavina98@gmail.com>
# For more information refer to https://github.com/steveicarus/iverilog

#! /bin/bash

# Compile the Verilog files
iverilog -o ffd ../sources/ffd.v ../sources/ffd_tb.v

# Run simulation
vvp ffd

# Open the waveform using GTKWave
gtkwave ffd_tb.vcd
