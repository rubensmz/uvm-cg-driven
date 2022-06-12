class pkt_driver extends uvm_driver;

    `uvm_component_utils(pkt_driver)

    virtual pkt_if pkt_if;

    function new(string name="pkt_driver", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual pkt_if)::get(this, "", "pkt_vif", pkt_if))
            `uvm_fatal("NO_IF", "Couldn't retrieve pkt_if from DB")
    endfunction : build_phase

endclass : pkt_driver