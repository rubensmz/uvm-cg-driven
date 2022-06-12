`include "uvm_macros.svh"
import uvm_pkg::*;
import cg_driven_pkg::*;
import pkt_agent_pkg::*;

module tb;

    dut u_dut(
        .addr(pkt_if.addr),
        .data(pkt_if.data),
        .clk (pkt_if.clk)
    );

    pkt_if pkt_if();

    initial begin
        uvm_config_db#(virtual pkt_if)::set(null, "*", "pkt_vif", pkt_if);
        run_test();
    end

endmodule : tb