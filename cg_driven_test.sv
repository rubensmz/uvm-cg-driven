class cg_driven_test extends uvm_test;

    `uvm_component_utils(cg_driven_test)

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
        phase.drop_objection(this);
    endtask : main_phase

endclass : cg_driven_test