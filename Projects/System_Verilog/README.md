                         SYSTEM VERILOG FIFO VERIFICATION

EDA Playground: https://www.edaplayground.com/x/wPcn

Project: 16-Depth, 8-Bit FIFO Verification Environment

Description:
This project implements and verifies a synchronous FIFO using SystemVerilog.

DUT Specifications:
- FIFO depth: 16 entries
- Data width: 8 bits
- Write operation: wr
- Read operation: rd
- Status flags: full and empty
- Synchronous reset
- Write and read pointers
- Occupancy counter

Verification Environment:
- SystemVerilog transaction class
- Constrained-random stimulus generation
- Generator class
- Mailbox-based communication
- Driver
- Monitor
- Scoreboard
- Data comparison between expected and actual FIFO output
- Randomized read/write operations
- Simulation result checking

Verification Result:
- Randomized transactions executed successfully
- Scoreboard data comparison: PASS
- Error Count: 0

Simulator:
Cadence Xcelium 25.03