
typedef enum bit [1:0]   {readd = 0, writed = 1, rstdut = 2} oper_mode;
 
 
class transaction extends uvm_sequence_item;
  `uvm_object_utils(transaction)
  
  rand oper_mode op;
  rand bit wr;
  randc bit [6:0] addr;
  rand bit [7:0] din;
  bit [7:0] datard;
  bit done;
         
  // constraint addr_c { addr <= 10;}
 
   constraint addr_c { addr inside {[0:127]}; }
 
  function new(string name = "transaction");
    super.new(name);
  endfunction
 
endclass : transaction
 