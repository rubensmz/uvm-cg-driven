class pkt_tr extends uvm_sequence_item;

    rand logic [3:0] addr;
    rand logic [3:0] data;
    rand logic [1:0] freq;

    function new(string name="pkt_tr");
        super.new(name);
    endfunction : new

endclass : pkt_tr