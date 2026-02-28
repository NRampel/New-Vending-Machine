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
<img width="722" height="93" alt="image" src="https://github.com/user-attachments/assets/02091eb4-95c2-455b-ab08-7077d0459b38" />

```mermaid
graph TD
    S0["S0: Initialize / Clear Credit"]
    S1["S1: Idle / Accept Coins"]
    S2["S2: Refund"]
    S3["S3: Insufficient Funds (Error)"]
    S4["S4: Dispense Item"]

    S0 -->|"Automatic"| S1
    S1 -->|"Quarter / Dollar Added"| S1
    S1 -->|"Refund Button Pressed"| S2
    S1 -->|"Item Selected (Sufficient Credit)"| S4
    S1 -->|"Item Selected (Insufficient Credit)"| S3

    S2 -->|"Timer Complete (ctr = x3FFFFFF)"| S0
    S3 -->|"Timer Complete (ctr = x3FFFFFF)"| S1
    S4 -->|"Timer Complete (ctr = x3FFFFFF)"| S1

