class read_seq extends uvm_sequence#(transaction);
  `uvm_object_utils(read_seq)
  
  transaction tr;
 
  function new(string name = "read_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(100)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op = readd;
        `uvm_info("SEQ", $sformatf("MODE : READ ADDR : %0d ", tr.addr), UVM_NONE);
        finish_item(tr);
      end
  endtask
  
 
endclass