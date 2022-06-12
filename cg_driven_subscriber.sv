import pkt_agent_pkg::pkt_tr;

class cg_driven_subscriber extends uvm_subscriber #(pkt_tr);

    `uvm_component_utils(cg_driven_subscriber)

    pkt_tr tr;

    covergroup cg_addr;
        c_addr : coverpoint tr.addr;
    endgroup

    function new (string name = "cg_driven_subscriber", uvm_component parent);
        super.new(name, parent);
        cg_addr = new();
    endfunction : new

    virtual function void write (pkt_tr t);
        tr = t;
        `uvm_info("SUBS", $sformatf("New transaction received:\n%0s", tr.sprint()), UVM_MEDIUM)
        cg_addr.sample();
    endfunction : write

endclass : cg_driven_subscriber