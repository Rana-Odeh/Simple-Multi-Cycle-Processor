# COMPUTER ARCHITECTURE
## To design and verify a simple multi RISC processor in Verilog

## **Processor Specifications :**
1. The instruction size and the words size is 32 bits
2. 16 32-bit general-purpose registers: from R0 to R15.
3. 32-bit special purpose register for the program counter (PC)
4. 32-bit special purpose register for the stack pointer (SP), which points to the topmost empty element of the stack. This register is visible to the programmer.
5. The program memory layout comprises the following three segments:
(i) Static data segment
(ii) Code segment
(iii) Stack segment. It is a LIFO (Last in First out) data structure. This machine has explicit instructions that enables the programmer to push/pop elements on/from the stack. The stack stores the return address, registers’ values upon function calls, etc.
6. The processor has two separate physical memories, one for instructions and the other one for data. The data memory stores both the static data segment and the stack segment.
7. Four instruction types (R-type, I-type, J-type, and S-type).
8. Separate data and instructions memories
9. Word-addressable memory
10. You need to generate the required signals from the ALU to calculate the condition branch outcome (taken/ not taken). These signals might include zero, carry, overflow, etc.

## **Instruction Types and Formats :**

**1 :**

![image](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/064aa772-ea86-4209-a17b-2b5cffec535e)

**2 :**

![image](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/454ebf9e-6eb9-4f77-bd51-ba426bcb30c2)

**3 :**

![image](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/a1d3e9a1-b09b-4503-929c-21ee83ab3f2c)

**4 :**

![image](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/10f83bdb-cdbb-49bb-b909-a1c9416a7207)



## **Instructions’ Encoding :**
![image](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/19463d7b-9f69-4c51-9881-4115d5165f5e)
![image](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/9b9d6d7b-9cbe-41d0-af07-83d78bb0441e)


## **Datapath:**
![DATA1 (5)](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/8a16f809-c862-4c41-bb53-536ab78c08a2)

## **State Diagram:**
![gg (2)](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/c9cb5c2f-c111-41e1-9391-aa923a4780b0)


## **Test Case :**

![WhatsApp Image 2024-03-30 at 22 08 35_bbd04a79](https://github.com/Rana-Odeh/ENCS4370-project2/assets/144602671/b9b9f67a-c743-4bc7-8d2d-c2c12fa327d3)

