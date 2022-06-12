class pkt_driver extends uvm_driver #(pkt_tr);

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

    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        forever begin
            seq_item_port.get_next_item(req);
            drive();
            seq_item_port.item_done();
        end

    endtask : run_phase

    virtual task drive();
        int half_clk_ns;
        case(req.freq)
            0: half_clk_ns = 2;
            1: half_clk_ns = 3;
            2: half_clk_ns = 4;
            3: half_clk_ns = 5;
        endcase

        for(int i = 3; i >= 0; i--) begin
            pkt_if.clk = 1'b1;
            pkt_if.addr = req.addr[i];
            pkt_if.data = req.data[i];
            #(half_clk_ns * 1ns);
            pkt_if.clk = 0;
            #(half_clk_ns * 1ns);
        end
    endtask : drive

endclass : pkt_driver