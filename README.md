+ Overview

This project implements a UVM-based verification environment for an I2C memory controller (i2c_mem.v).
The verification focuses on validating correct I2C transactions such as reset, read, write, bulk transfers, and full address range access, with functional coverage collection using QuestaSim, executed via Cygwin on Windows.


+ Implemented Tests

reset_dut_test –> Verifies DUT reset behavior

write_test –> I2C write transaction verification

read_test –> I2C read transaction verification

wr_bulk_rd_bulk_test –> Continuous write/read stress test

full_range_test –> Verifies full address range access

i2c_test –> Integrated I2C functionality test

+ Functional Coverage

Functional coverage is collected using UCDB

Coverage reports are automatically generated in HTML format:  sim/cov/html/index.html


<img width="294" height="166" alt="image" src="https://github.com/user-attachments/assets/f364159f-c752-46b8-a709-3151a6ef81ac" />


<img width="541" height="395" alt="image" src="https://github.com/user-attachments/assets/bad92d3a-1c49-419e-a393-88118f00c661" />


