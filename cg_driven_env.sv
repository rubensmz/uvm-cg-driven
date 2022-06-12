class cg_driven_env extends uvm_env;

    `uvm_component_utils(cg_driven_env)

    pkt_agent pkt_agt;

    function new(string name = "cg_driven_en", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        pkt_agt = pkt_agent::type_id::create("pkt_agt", this);
    endfunction : build_phase

endclass : cg_driven_env