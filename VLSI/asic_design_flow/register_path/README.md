# RTL Register Path

## Objective

A simple RTL register path implemented to reinforce concepts introduced in the ASIC Design Flow module.

## Concepts

- RTL
- Flip-flop
- Clock
- Reset
- Register-to-register data transfer
- Synthesizable RTL

## Design

The design captures an 8-bit input on the active edge of the clock.

Reset initializes the output register to zero.

## Timing Concept

For a simplified register-to-register path:

Tclk(min) = tCQ + tPD + tsetup

fmax = 1 / Tclk(min)

## Verification

The testbench:

- Generates a clock
- Applies reset
- Applies multiple input values
- Observes the registered output