class pkt_agent extend uvm_agent;

    `uvm_component_utils(pkt_agent)

    pkt_sequencer sqr;
    pkt_driver drv;
    pkt_monitor mon;

    function new(string name="pkt_agent", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (get_is_active()) begin
            sqr = pkt_sequencer::type_id::create("sqr", this);
            drv = pkt_driver::type_id::create("drv", this);
        end
        mon = pkt_monitor::type_id::create("mon", this);

    endfunction build_phase

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        if (get_is_active()) begin
            // Connect driver with sequencer
            drv.seq_item_port.connect(sqr.seq_item_export);
        end
    endfunction : connect_phase

endclass : pkt_agent