

`timescale 1ns / 1ps

module digital_clock_tb;

    reg clk;
    reg reset;

    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hr;

    // Instantiate the complete digital clock
    digital_clock dut (
        .clk(clk),
        .reset(reset),
        .sec(sec),
        .min(min),
        .hr(hr)
    );

    // 100 MHz clock: 10 ns period
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Apply reset
        reset = 1'b1;
        #10;
        reset = 1'b0;

        // Run simulation
        #10000000;

        $finish;
    end

    // Display counter values
    initial begin
        $monitor(
            "Time=%0t | Hours=%0d | Minutes=%0d | Seconds=%0d",
            $time, hr, min, sec
        );
    end

endmodule
