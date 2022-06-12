class pkt_monitor extends uvm_monitor;

    `uvm_component_utils(pkt_monitor)

    virtual pkt_if pkt_if;

    uvm_analysis_port#(pkt_tr) mon_analysis_port;
    pkt_tr tr;

    function new(string name="pkt_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if ( !uvm_config_db#(virtual pkt_if)::get(this, "", "pkt_vif", pkt_if) ) begin
            `uvm_fatal("NO_IF", "Couldn't retrieve pkt_if from UVM DB")
        end
        mon_analysis_port = new ("mon_analysis_port", this); 
    endfunction : build_phase

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        tr = pkt_tr::type_id::create("tr");
        @(posedge pkt_if.clk);
        tr.addr = pkt_if.addr;
        tr.data = pkt_if.data;
        `uvm_info("MON", $sformatf("Sending transaction %0s", tr.sprint()), UVM_MEDIUM)
        mon_analysis_port.write(tr);
    endtask : run_phase

endclass : pkt_monitor