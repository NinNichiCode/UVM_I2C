class full_range_seq extends uvm_sequence#(transaction);
  `uvm_object_utils(full_range_seq)

  function new(string name="full_range_seq");
    super.new(name);
  endfunction

  transaction tr;
  bit [6:0] addr_l;

  virtual task body();

    // -------------------------
    // 1. Corner case: addr = 127
    // -------------------------
    addr_l = 7'd127;

    `uvm_do_with(tr, {
      wr   == 1'b1;
      addr == addr_l;
      din  == 8'hAA;
    })

    `uvm_do_with(tr, {
      wr   == 1'b0;
      addr == addr_l;
    })

    // -------------------------
    // 2. Random range test
    // -------------------------
    repeat (5) begin
      addr_l = $urandom_range(32,127);

      `uvm_do_with(tr, {
        wr   == 1'b1;
        addr == addr_l;
        din  inside {8'h00, 8'hFF, 8'h55};
      })

      `uvm_do_with(tr, {
        wr   == 1'b0;
        addr == addr_l;
      })
    end

    // -------------------------
    // 3. Directed data patterns
    // -------------------------
    // addr = 0x05
    addr_l = 7'h05;
    `uvm_do_with(tr, { wr==1; addr==addr_l; din==8'hFF; })
    `uvm_do_with(tr, { wr==0; addr==addr_l; })

    // addr = 0x0A
    addr_l = 7'h0A;
    `uvm_do_with(tr, { wr==1; addr==addr_l; din==8'h55; })
    `uvm_do_with(tr, { wr==0; addr==addr_l; })

  endtask
endclass
