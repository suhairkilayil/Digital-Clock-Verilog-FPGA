# Digital Clock Using Verilog HDL and FPGA

A digital clock designed using **Verilog HDL** and implemented on an FPGA using **AMD Vivado Design Suite**. The project uses a clock divider and modular counters to track seconds, minutes, and hours. Vivado's Integrated Logic Analyzer (ILA) and Virtual Input/Output (VIO) IP cores are used for on-chip debugging and reset control.

## Features

- Clock division from a 100 MHz input clock to a 1 Hz clock.
- Modular RTL design using Verilog HDL.
- Seconds counter with a range of 0–59.
- Minutes counter with a range of 0–59.
- Hours counter with a range of 0–23.
- On-chip signal monitoring using the ILA IP core.
- Reset control using the VIO IP core.
- FPGA synthesis, implementation, and bitstream generation using Vivado.

## Block Diagram

```text
             100 MHz Clock
                   |
                   v
             Clock Divider
                   |
                1 Hz Clock
                   |
          +--------+--------+
          |        |        |
          v        v        v
       Seconds  Minutes   Hours
       Counter  Counter   Counter
          |        |        |
          +--------+--------+
                   |
             ILA Monitoring

       VIO ----> Reset Control
```

## Project Structure

```text

Digital-Clock-Verilog-FPGA/
│
├── README.md
│
├── rtl/
│   ├── digital_clock.v
│   ├── clock_divider.v
│   ├── seconds_counter.v
│   ├── minutes_counter.v
│   └── hour_counter.v
│
├── constraints/
│   └── digital_clock.xdc
│
├── testbench/
│   └── digital_clock_testbench.v
│
└── docs/
    ├── rtl_block_diagram.png
    ├── simulation_waveform.png
    ├── ila_waveform.png
    └── vio_reset_control.png

```

## Design Modules

| Module | Description |
|---|---|
| `digital_clock.v` | Top-level module connecting all components |
| `clock_divider.v` | Divides the 100 MHz input clock to generate a 1 Hz clock |
| `seconds_counter.v` | Counts seconds from 0 to 59 |
| `minutes_counter.v` | Implements the minutes counter |
| `hour_counter.v` | Implements the hours counter from 0 to 23 |

## Tools and Technologies

- **Hardware Description Language:** Verilog HDL
- **FPGA Design Tool:** AMD Vivado Design Suite
- **Debugging:** Integrated Logic Analyzer (ILA)
- **Virtual Control:** Virtual Input/Output (VIO)
- **Constraints:** Xilinx Design Constraints (XDC)

## Clock Divider

The clock divider receives a 100 MHz clock input. It toggles its output after every 50,000,000 input clock cycles, producing a 1 Hz square-wave clock.

\[
f_{out} = \frac{100\,\text{MHz}}{2 \times 50{,}000{,}000}
= 1\,\text{Hz}
\]

The divided clock drives the counter modules. The ILA is configured to use the 100 MHz input clock for signal monitoring.

## Debugging with ILA and VIO

- **ILA:** Monitors the seconds, minutes, and hours counter outputs.
- **VIO:** Provides reset control through a virtual output probe.
- **Hardware Manager:** Used to program the FPGA and inspect the debug cores.

## Implementation Steps

1. Create the Verilog modules in Vivado.
2. Add the XDC file containing the FPGA pin assignments and clock constraints.
3. Add and configure the ILA and VIO IP cores.
4. Run synthesis and implementation.
5. Generate the FPGA bitstream.
6. Program the FPGA using Vivado Hardware Manager.
7. Use ILA to inspect counter outputs and verify operation.

## Future Improvements

- Verify and refine minute and hour rollover logic.
- Add a seven-segment display interface.
- Develop a Verilog testbench for simulation.
- Include simulation waveforms and verified hardware results.

## Author

**Suhair K**

## Repository

[Digital-Clock-Verilog-FPGA](https://github.com/suhairkilayil/Digital-Clock-Verilog-FPGA)
