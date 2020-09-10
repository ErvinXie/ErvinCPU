# Single cycle processor design

## Info

Instruction set: MIPS

Harvard Arch



## Supported Instruction

| Instruction | Format                  | Purpose                                                  |      |      |      |
| ----------- | ----------------------- | -------------------------------------------------------- | ---- | ---- | ---- |
| Lui         | LUI rt, immediate       | To load a constant into the upper half of a word         |      |      |      |
| Addiu       | ADDIU rt, rs, immediate | To add a constant to a 32-bit integer                    |      |      |      |
| Add         | ADD rd, rs, rt          | To add 32-bit integers. If an overflow occurs, then trap |      |      |      |
| Lw          | LW rt, offset(base)     | To load a word from memory as a signed value             |      |      |      |
| Sw          | SW rt, offset(base)     | To store a word to memory                                |      |      |      |
| Beq         | BEQ rs, rt, offset      | To compare GPRs then do a PC-relative conditional branch |      |      |      |
| J           | J target                | To branch within the current 256 MB-aligned region       |      |      |      |
| Ori         | ORI rt, rs, immediate   | To do a bitwise logical OR with a constant               |      |      |      |
| DIVU        | DIVU rs, rt             | To divide a 32-bit unsigned integers                     |      |      |      |

