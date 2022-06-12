import pkt_agent_pkg::pkt_tr;

class cg_driven_subscriber extends uvm_subscriber #(pkt_tr);

    logic [3:0] addr;
    logic [3:0] data;
    logic [1:0] freq;

    `uvm_component_utils(cg_driven_subscriber)

    covergroup c_addr;
        coverpoint addr;
    endgroup

    c_addr cg_addr;

    function new (string name = "cg_driven_subscriber", uvm_component parent);
        super.new(name, parent);
        cg_addr = new();
    endfunction : new

    virtual function void write (pkt_tr tr);
        addr = tr.addr;
        data = tr.data;
        freq = tr.freq;
        cg_addr.sample();
    endfunction : write

endclass : cg_driven_subscriber