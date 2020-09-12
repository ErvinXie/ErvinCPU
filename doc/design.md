# Single cycle processor design

## Info

Instruction set: MIPS

Harvard Arch



## 

|      |      |      |      |      |      |
| ---- | ---- | ---- | ---- | ---- | ---- |
|      |      |      |      |      |      |
|      |      |      |      |      |      |
|      |      |      |      |      |      |
|      |      |      |      |      |      |
|      |      |      |      |      |      |
|      |      |      |      |      |      |
|      |      |      |      |      |      |
|      |      |      |      |      |      |
|      |      |      |      |      |      |

## Control 

| instruction     | alu sel | alu_in_1 | alu_in_2 | mem  |      |      |      |      |      |
| --------------- | ------- | -------- | -------- | ---- | ---- | ---- | ---- | ---- | ---- |
| `define lui 1   |         |          |          |      |      |      |      |      |      |
| `define addiu 2 |         |          |          |      |      |      |      |      |      |
| `define add 3   |         |          |          |      |      |      |      |      |      |
| `define sub 4   |         |          |          |      |      |      |      |      |      |
| `define lw 5    |         |          |          |      |      |      |      |      |      |
| `define sw 6    |         |          |          |      |      |      |      |      |      |
| `define beq 7   |         |          |          |      |      |      |      |      |      |
| `define j 8     |         |          |          |      |      |      |      |      |      |
| `define ori 9   |         |          |          |      |      |      |      |      |      |
| `define divu 10 |         |          |          |      |      |      |      |      |      |
| `define addu 11 |         |          |          |      |      |      |      |      |      |
| `define sll 12  |         |          |          |      |      |      |      |      |      |
| `define srl 13  |         |          |          |      |      |      |      |      |      |

