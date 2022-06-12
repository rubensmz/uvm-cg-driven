class cg_driven_test extends uvm_test;

    function new(string name = "cg_driven_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    virtual task main_phase(uvm_phase phase);
        phase.raise_objection(this);
        super.main_phase(phase);
        `uvm_info("TEST", "Hello, World!", UVM_MEDIUM)
        phase.drop_objection(this);
    endtask : main_phase

endclass : cg_driven_test