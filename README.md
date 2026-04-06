# Parameterized Synchronous FIFO Design

## Overview
This repository contains a Verilog implementation of a Synchronous FIFO (First-In, First-Out) buffer. 
It is designed to handle data buffering between logic blocks operating on the same clock domain.

## Key Features
- **Parameterized Design:** Easily configurable `WIDTH` and `DEPTH`.
- **Status Flags:** Robust logic for `Full` and `Empty` detection using $N+1$ bit pointers.
- **Synthesizable:** Written in RTL-standard Verilog (no simulation-only constructs in the design).

## Tools Used
- **Simulation:** Icarus Verilog
- **Waveform Viewer:** EPWave / GTKWave
- **Platform:** EDA Playground

## Verification Results
The design was verified using a testbench covering:
1. Sequential Write/Read operations.
2. Full and Empty corner cases.
3. Overflow/Underflow protection.
