# uvm-cg-driven
UVM testbench using covergroup to determine when test has to end. It instantiates a dummy, empty DUT with 3 input ports: address, data and clock.
The testbench just instantiates the DUT and the agent interface. Regarding the UVM architecture, the environment instantiates a simple packet agent with a monitor that rebuilds the transactions seen on the agent's interface.

The environment contains also a uvm_subscriber component where the covergroup is placed. This component is use to control the test flow.

## How to run
The setup is prepared to be run on Xcelium. If you want to run the simulation in non-interactive mode, you can use:
```
make run
```

On the other hand, you can open SimVision to plot any waveform required running:
```
make run-gui
```
