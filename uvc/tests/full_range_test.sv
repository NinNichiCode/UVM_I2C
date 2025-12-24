class full_range_test extends base_test;
`uvm_component_utils(full_range_test)
 
function new(input string inst = "full_range_test", uvm_component c);
    super.new(inst,c);
endfunction
 
full_range_seq seq;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
   seq  = full_range_seq::type_id::create("seq");
endfunction
 
virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
        seq.start(env.agent.seqr);
    
    phase.drop_objection(this);
endtask
endclass