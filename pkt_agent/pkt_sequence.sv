class pkt_sequence extends uvm_sequence#(pkt_tr);

    `uvm_object_utils(pkt_sequence)

    function new (string name = "pkt_sequence");
        super.new(name);
    endfunction : new

    task body();
        `uvm_do(req)
    endtask

endclass : pkt_sequence