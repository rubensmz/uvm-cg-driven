class pkt_tr extends uvm_sequence_item;

    logic [3:0] addr;
    logic [3:0] data;

    function new(string name="pkt_tr");
        super.new(name);
    endfunction : new

endclass : pkt_tr