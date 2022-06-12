class pkt_sequencer extend uvm_sequencer;

    `uvm_component_utils(pkt_sequencer)

    function new(string name="pkt_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction build_phase

endclass : pkt_sequencer