// class i2c_test extends base_test;
// `uvm_component_utils(i2c_test)
 
// function new(input string inst = "i2c_test", uvm_component c);
//     super.new(inst,c);
// endfunction
 
// i2c_env e;
// write_data wdata;
// read_data rdata;
// writeb_readb wrrdb;
// reset_dut rstdut;  
 
  
// virtual function void build_phase(uvm_phase phase);
// super.build_phase(phase);
//    e      = i2c_env::type_id::create("env",this);
//    wdata  = write_data::type_id::create("wdata");
//    rdata  = read_data::type_id::create("rdata");
//    wrrdb  = writeb_readb::type_id::create("wrrdb");
//    rstdut = reset_dut::type_id::create("rstdut");
// endfunction
 
// virtual task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//         wrrdb.start(env.agent.seqr);
    
//     phase.drop_objection(this);
// endtask
// endclass