
class i2c_env extends uvm_env;
`uvm_component_utils(i2c_env)
 
function new(input string inst = "i2c_env", uvm_component c);
super.new(inst,c);
endfunction
 
i2c_agent agent;
i2c_scoreboard scb;
i2c_coverage cov;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  agent = i2c_agent::type_id::create("agent",this);
  scb = i2c_scoreboard::type_id::create("scb", this);
  cov = i2c_coverage::type_id::create("cov", this);
endfunction
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
 agent.mon.item_send_port.connect(scb.item_recv_imp);
 agent.mon.item_send_port.connect(cov.analysis_export);
endfunction
 
endclass