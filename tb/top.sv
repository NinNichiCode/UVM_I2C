
`include "uvm_macros.svh"
import uvm_pkg::*;
import i2c_pkg::*;

module top; 
    
  i2c_if vif();
  
  i2c_mem dut (.clk(vif.clk), .rst(vif.rst), .wr(vif.wr), .addr(vif.addr), .din(vif.din), .datard(vif.datard), .done(vif.done));
  
  initial begin
    vif.clk <= 0;
  end
 
  always #10 vif.clk <= ~vif.clk;
  
  initial begin
    uvm_config_db#(virtual i2c_if)::set(null, "*", "vif", vif);
    run_test("test");
   end
  
endmodule
 