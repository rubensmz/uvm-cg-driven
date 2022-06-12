class cg_driven_env extends uvm_env;

    function new(string name = "cg_driven_en", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

endclass : cg_driven_env