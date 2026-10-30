# Digital Clock Using Verilog HDL and FPGA

A digital clock designed using **Verilog HDL** and implemented on an FPGA using **AMD Vivado Design Suite**. The project uses a clock divider and modular counters to track seconds, minutes, and hours. Vivado's Integrated Logic Analyzer (ILA) and Virtual Input/Output (VIO) IP cores are used for on-chip debugging, reset control, and manual time setting.

## Features

- Clock division from a 100 MHz input clock to a 1 Hz clock.
- Modular RTL design using Verilog HDL.
- Seconds counter with a range of 0–59.
- Minutes counter with a range of 0–59.
- Hours counter with a range of 0–23.
- Manual setting of hours, minutes, and seconds using VIO.
- Reset control using the VIO IP core.
- On-chip signal monitoring using the ILA IP core.
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
        |
        +------> Manual Time Setting
                 (Hours, Minutes, Seconds)
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
    ├── hardware status.png
    ├── ila_waveform.png
    ├── vio_reset_control.png
    └── vio_manual_time_setting.png
```

## Design Modules

| Module | Description |
|---|---|
| `digital_clock.v` | Top-level module connecting all components, ILA, and VIO |
| `clock_divider.v` | Divides the 100 MHz input clock to generate a 1 Hz clock |
| `seconds_counter.v` | Counts seconds from 0 to 59 and supports manual loading |
| `minutes_counter.v` | Implements the minutes counter and supports manual loading |
| `hour_counter.v` | Implements the hours counter from 0 to 23 and supports manual loading |

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

## Manual Time Setting Using VIO

The VIO IP core allows the user to manually set the digital clock time without physically interacting with the FPGA.

The VIO output probes are configured as follows:

| VIO Probe | Width | Function |
|---|---:|---|
| `probe_out0` | 1 bit | Reset |
| `probe_out1` | 1 bit | Set time control |
| `probe_out2` | 6 bits | Set seconds |
| `probe_out3` | 6 bits | Set minutes |
| `probe_out4` | 5 bits | Set hours |

To manually set the time:

1. Enter the required hours, minutes, and seconds through the VIO dashboard.
2. Set `set_time` to HIGH.
3. Wait for a rising edge of the divided clock so that the counters load the selected values.
4. Set `set_time` to LOW.
5. The clock continues counting from the manually entered time.

Valid input ranges are 0–23 for hours and 0–59 for minutes and seconds.

## Debugging with ILA and VIO

- **ILA:** Monitors the seconds, minutes, and hours counter outputs.
- **VIO:** Provides reset control and manual time-setting functionality.
- **Hardware Manager:** Used to program the FPGA and inspect the debug cores.

## Implementation Steps

1. Create the Verilog modules in Vivado.
2. Add the XDC file containing the FPGA pin assignments and clock constraints.
3. Add and configure the ILA and VIO IP cores.
4. Configure the VIO output probes for reset and manual time setting.
5. Run synthesis and implementation.
6. Generate the FPGA bitstream.
7. Program the FPGA using Vivado Hardware Manager.
8. Use VIO to reset the clock and manually set the time.
9. Use ILA to inspect counter outputs and verify operation.

## Future Improvements

- Add a seven-segment display interface.
- Develop and enhance the Verilog testbench for simulation.
- Include additional simulation waveforms and hardware testing results.

## Author

**Suhair K**

## Repository

[Digital-Clock-Verilog-FPGA](https://github.com/suhairkilayil/Digital-Clock-Verilog-FPGA)
