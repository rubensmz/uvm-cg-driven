class pkt_tr extends uvm_sequence_item;

    rand logic [3:0] addr;
    rand logic [3:0] data;
    rand logic [1:0] freq;

    `uvm_object_utils_begin(pkt_tr)
        `uvm_field_int(addr, UVM_ALL_ON)
        `uvm_field_int(data, UVM_ALL_ON)
        `uvm_field_int(freq, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name="pkt_tr");
        super.new(name);
    endfunction : new

endclass : pkt_tr