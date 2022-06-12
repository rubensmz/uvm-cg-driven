class cg_driven_env extends uvm_env;

    `uvm_component_utils(cg_driven_env)

    pkt_agent pkt_agt;
    cg_driven_subscriber cg_subs;

    function new(string name = "cg_driven_en", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        pkt_agt = pkt_agent::type_id::create("pkt_agt", this);
        cg_subs = cg_driven_subscriber::type_id::create("cg_subs", this);
    endfunction : build_phase

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        pkt_agt.mon.mon_analysis_port.connect(cg_subs.analysis_export);
    endfunction : connect_phase

endclass : cg_driven_env