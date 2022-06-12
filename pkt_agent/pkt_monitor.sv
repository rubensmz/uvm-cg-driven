class pkt_monitor extends uvm_monitor;

    `uvm_component_utils(pkt_monitor)

    virtual pkt_if pkt_if;

    uvm_analysis_port item_collected_port;

    function new(string name="pkt_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if ( !uvm_config_db#(virtual pkt_if)::get(this, "", "pkt_vif", pkt_if) ) begin
            `uvm_fatal("NO_IF", "Couldn't retrieve pkt_if from UVM DB")
        end
    endfunction : build_phase



endclass : pkt_monitor