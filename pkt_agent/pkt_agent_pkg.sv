`include "pkt_if.sv"

package pkt_agent_pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "pkt_tr.sv"
    `include "pkt_sequence.sv"
    `include "pkt_driver.sv"
    `include "pkt_sequencer.sv"
    `include "pkt_monitor.sv"
    `include "pkt_agent.sv"
endpackage : pkt_agent_pkg