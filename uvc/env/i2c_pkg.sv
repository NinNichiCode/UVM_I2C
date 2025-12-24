
package i2c_pkg;

    `include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "transaction.sv"
    // `include "i2c_seq.sv"
    `include "write_seq.sv"
	`include "read_seq.sv"
	// `include "wr_rd_seq.sv"
	// `include "write_err_seq.sv"
	// `include "read_err_seq.sv"
	`include "reset_dut_seq.sv"
	`include "wr_bulk_rd_bulk_seq.sv"
    `include "full_range_seq.sv"


    `include "i2c_driver.sv"
    `include "i2c_monitor.sv"
    `include "i2c_agent.sv"
    `include "i2c_scoreboard.sv"
    `include "i2c_coverage.sv"
    `include "i2c_env.sv"

    `include "base_test.sv"
    // `include "i2c_test.sv"
    `include "write_test.sv"
	`include "read_test.sv"
	// `include "wr_rd_test.sv"
	// `include "write_err_test.sv"
	// `include "read_err_test.sv"
	`include "reset_dut_test.sv"
	`include "wr_bulk_rd_bulk_test.sv"
    `include "full_range_test.sv"

endpackage
