                 
class i2c_agent extends uvm_agent;
`uvm_component_utils(i2c_agent)
  
 
function new(input string inst = "i2c_agent", uvm_component parent = null);
super.new(inst,parent);
endfunction
 
 i2c_driver drv;
 uvm_sequencer#(transaction) seqr;
 i2c_monitor mon;
 
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
    mon = i2c_monitor::type_id::create("mon",this);  
    drv = i2c_driver::type_id::create("drv",this);
    seqr = uvm_sequencer#(transaction)::type_id::create("seqr", this);
endfunction
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
endfunction
 
endclass
 