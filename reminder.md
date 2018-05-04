# Assembler reminder (intel syntax)

## Parameters registers
|  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| rdi | rsi | rdx | rcx | r8  | r9  | r10 | r11 |


## Functions registers
|  Call | Return | Loop counter | Instruction pointer |
| :---: |:-------| :----------- | :------------------ |
|  rsp  |   rax  | rcx          | rip

## Registers utility
| register | Utility                                                           |
| :------: | :---------------------------------------------------------------- |
| rsp      | Stack pointer                                                     |
| rbp      | Base Stack Pointer                                                |
| r1-15    | Multi purposes general registers                                  |
| rcx      | Loop counter                                                      |
| rdi      | Comparaison destination                                           |
| rsi      | Comparaison/moving source                                         |

## Syscall
For MAC OS the prefix is 0x2000000

for LINUX the prefix is 0x1000000

to perform a syscall the address of systemcall has to be set into "rax" register

## Registers size
| Size        | Registers                                                |
| :---------- | :------------------------------------------------------- |
| 64 bits     | rax, rbx, rcx, rdx, rdi, rsi, rbp, rsp, r8, r9... r15    |
| 32 bits     | eax, ebx, ecx, edz, edi, esi, ebp, esp, r8d, r9d... r15d |
| 16 bits     | ax, bx, cx, di, si, bp, sp, r8w, r9w... r15w             |
| 8 bits high | ah, bh, ch, dh                                           |
| 8 bits low  | al, bl, dl, dil, sil, bpl, spl, r8b, r9b... r15b         |


## Registers
(this is a new notation, prefer the previous one the time i finish it)

| Size        | ret |  ?  | counter | 1   | 2   | 3   | 4   |  -  | 5   | 6   |
| :---------- | :-- | :-- | :------ | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| 64 bits     | rax | rbx | rcx     | rdi | rsi | rdx | rcx | rbp | r8  | r9  |
| 32 bits     | eax | ebx | ecx     | edi | edi | edz | ecx | ebp | r8d | r9d |
| 16 bits     | ax  | bx  | cx      | di  | bp  |  ?  | bx  | sp  | r8w | r9w |
| 8 bits high | ah  | bh  | dh      | dih | bph |  ?  | bh  | sph | r8h | r9h |
| 8 bits low  | al  | bl  | dl      | dil | bpl |  ?  | bl  | spl | r8b | r9b |

after r15, parameter of functions are sent to the stack

## Keywords
|   Word   | Sigification                                                      |
|:--------:|:------------------------------------------------------------------|
|   mov    | copy param 2 value to param 1 register                            |
|   cld    | clear the "direction" flag                                        |
|   jmp    | perform a "jump" in the code, take the address where to jump in param |
|   push   | push (add) the given register value on the stack                  |
|   pop    | pop (remove) the given register from stack                        |
|   enter  | push the fonction on the stack                                    |
|   leave  | pop the function out of the stack                                 |
|   ret    | return                                                            |
|   rep    |                                                                   |
|   add    | add param2 to param1                                              |
|   sub    | substract param2 from param1                                      |
|   neg    | inverst the bit sign of given register                            |
|   inc    | increment                                                         |
|   dec    | decrement                                                         |
|   not    | equivalent ot ~register                                           |
|   cld    | flag of repeatstring operator (set to "not finished")             |
|   lea    | load effective address : mov with arithmetic                      | 

# Repstring
## Rep
Before use, set the loop direction (with cld)

| rdi                     | rcx               | rax/eax/ax/al                  |
| source string pointer   | counter register  | value to compare with

| Instruction | Description                                                    |
| :---------- | :------------------------------------------------------------- |
| repne       | loop until not equal to rax (see scas)                         |

## Scas / Movs
| Param    | Read register                                                     |
| :------: | :---------------------------------------------------------------- |
| scasb    | al                                                                |
| scasw    | ax                                                                |
| scasd    | eax                                                               |
| scasq    | rax                                                               |
| movs     |                                                                   |
| mosw     |                                                                   |
| movsd    |                                                                   |
| movsq    |                                                                   |

## ressources
### General documentation
http://www.lacl.fr/tan/asm

### Comparaisons
http://unixwiz.net/techtips/x86-jumps.html

### Calling conventions
https://wiki.osdev.org/System_V_ABI 

### Repstring operations
https://www.csc.depauw.edu/~bhoward/asmtut/asmtut7.html

### Pointers operations
https://stackoverflow.com/questions/43769467/x86-assembly-pointers

### Basics notions
http://beta.hackndo.com/assembleur-notions-de-base/

### Registers protection
https://software.intel.com/sites/default/files/article/402129/mpx-linux64-abi.pdf
