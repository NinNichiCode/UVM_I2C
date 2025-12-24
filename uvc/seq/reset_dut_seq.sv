class reset_dut_seq extends uvm_sequence#(transaction);
  `uvm_object_utils(reset_dut_seq)
  
  transaction tr;
 
  function new(string name = "reset_dut_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(50)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op = rstdut;
        `uvm_info("SEQ", "MODE : RESET", UVM_NONE);
        finish_item(tr);
      end
  endtask
  
 
endclass