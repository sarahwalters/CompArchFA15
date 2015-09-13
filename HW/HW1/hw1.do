# Compile the file "hw1.v" into the workspace "work"
vlog -reportprogress 300 -work work hw1.v

# load the "hw1test" into the simulator
vsim -voptargs="+acc" hw1test

# Run the simulator for 100 units of time
run 100