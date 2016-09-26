# Pezaris multiplier implementation

Example project for an 8x8-bit Pezaris multiplier implementation written in Verilog.
This implementation was only tested in simulation.
Implementation in an FPGA is still pending.
This work was originally done for an Embedded Systems class project.

The algorithm was presented first by Stylianos D. Pezaris and published in an [article](https://doi.org/10.1109/T-C.1971.223261 "A 40-ns 17-Bit by 17-Bit Array Multiplier") in *IEEE Transactions on Computers* in 1971.

The purpose of this project was to show the effects of pipelining by developing several implementations of the Pezaris multiplier that differ in the stages of pipelining used.
Versions for two, four, and eight stages were developed, as well as a version with no pipeline, and their performances were compared by looking at the maximum operating frequency calculated by ISE in the synthesis report.

**DOCUMENTATION ON THIS PROJECT IS PENDING**
