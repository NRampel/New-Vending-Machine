![VHDL](https://img.shields.io/badge/Language-VHDL-29b6f6?style=for-the-badge&logo=vhdl&logoColor=white)

# Vending Machine Controller

A robust Finite State Machine (FSM) implementation of a vending machine controller, designed for FPGA integration

## Overview 
* Employs Control Signal Based Design
* Accepts Multiple Coin Denominations
* Properly Increments and Decrements
* Dispenses Desired Item if Correct Amount was Inserted

## Key Features: 
* **Synchronus Design:** All logic is bound to a common clock
* **Input Pulsing & Debouncing:** All buttons and switches are debounced to ensure proper calculation
* **7-Segment Display:** Displays machine state and balance, all changes are displayed


## Finite State Machine: 
![Vending Machine State Diagram](fsm_vm.png_0.svg)
