class cg_driven_test extends uvm_test;

    `uvm_component_utils(cg_driven_test)

    pkt_sequence seq;
    cg_driven_env env;

    function new(string name = "cg_driven_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = cg_driven_env::type_id::create("env", this);
    endfunction : build_phase

    virtual task main_phase(uvm_phase phase);
        super.main_phase(phase);
        phase.raise_objection(this);
        `uvm_info("TEST", "Hello, World!", UVM_LOW)
        #100ns;
        seq = pkt_sequence::type_id::create("seq");
        while(env.cg_subs.cg_addr.get_inst_coverage() < 100.0) begin
            seq.start(env.pkt_agt.sqr);
            `uvm_info("CF", $sformatf("CG coverage = %0.2f %", env.cg_subs.cg_addr.get_inst_coverage()), UVM_MEDIUM);
        end
        phase.drop_objection(this);
    endtask : main_phase

endclass : cg_driven_test