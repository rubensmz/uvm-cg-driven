class cg_driven_test extends uvm_test;

    function new(string name = "cg_driven_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    virtual task main_phase(uvm_phase phase);
        super.main_phase(phase);
    endtask : main_phase

endclass : cg_driven_test