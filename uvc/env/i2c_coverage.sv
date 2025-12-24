class i2c_coverage extends uvm_subscriber#(transaction);
    `uvm_component_utils(i2c_coverage);

    transaction trans;

    covergroup cov_inst;
        option.per_instance = 1;

        ADDR: coverpoint trans.addr {
            bins low    = {[0:31]};
            bins mid    = {[32:95]};
            bins high   = {[96:127]};
            bins corner[] = {0, 127}; // Điểm biên
        }

        DATA: coverpoint (trans.wr ? trans.din : trans.datard) {
            bins all_zeros = {8'h00};
            bins all_ones  = {8'hFF};
            bins others    = {[8'h01:8'hFE]};
        }

        OP_TYPE: coverpoint trans.wr {
            bins write = {1'b1};
            bins read  = {1'b0};
        }

        // Cross Coverage: wwr, rd every address except unsupported case
        ADDR_X_OP: cross ADDR, OP_TYPE{
    // ignore_bins unsupported_last_addr = binsof(ADDR) intersect {127} && binsof(OP_TYPE) intersect {1'b0};
    }

    // ========================================
//     Bug: “READ transaction fails at address 7’h7F while all other addresses pass.
// Functional coverage cross ADDR_X_OP shows READ@127 never completes.
// Likely boundary condition bug in address handling or FSM termination.”
    // ========================================
        

        DATA_X_OP: cross DATA, OP_TYPE;

    endgroup

    function new (string name = "i2c_coverage", uvm_component parent = null);
        super.new(name, parent);
        cov_inst = new();
    endfunction

    virtual function void write(transaction t);
        this.trans = t;
        cov_inst.sample();
    endfunction

endclass