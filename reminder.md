# Assembler reminder (intel syntax)

## Parameters registers
|  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| rdi | rsi | rdx |     | r8  | r9  | r10 | r11 |


## Functions registers
|  Call | Return | Loop counter |
| :---: |:-------| :----------- |
|  rsp  |   rax  | rcx          |

## Registers size
| Size        | Registers                                                |
| :---------- | :------------------------------------------------------- |
| 64 bits     | rax, rbx, rcx, rdx, rdi, rsi, rbp, rsp, r8, r9... r15    |
| 32 bits     | eax, ebx, ecx, edz, edi, esi, ebp, esp, r8d, r9d... r15d |
| 16 bits     | ax, bx, cx, di, si, bp, sp, r8w, r9w... r15w             |
| 8 bits high | ah, bh, ch, dh                                           |
| 8 bits low  | al, bl, dl, dil, sil, bpl, spl, r8b, r9b... r15b         |


## Keywords
|   Word   | Sigification                                                      |
|:--------:|:------------------------------------------------------------------|
|   mov    | copy param 2 value to param 1 register                            |
|   cld    | clear the "direction" flag                                        |
|   jmp    | perform a "jump" in the code, take the address where to jump in param |
|   push   | push (add) the given register value on the stack                  |
|   pop    | pop (remove) the given register from stack                        |
|   leave  |                                                                   |
|   ret    |                                                                   |
|   rep    |                                                                   |
|   add    | add param2 to param1                                              |
|   sub    | substract param2 from param1                                      |
|   neg    | inverst the bit sign of given register                            |
|   inc    | increment                                                         |
|   dec    | decrement                                                         |
|   not    | equivalent ot ~register                                           |


## ressources
http://www.lacl.fr/tan/asm