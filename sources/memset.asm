BITS    64

SECTION .text
GLOBAL  memset

memset:
    PUSH    RBP
    MOV     RBP, RSP

    MOV     R9, 0
loop:
    CMP     R9, RDX
    JZ      end
    MOV     [RDI + R9], SIL
    INC     R9
    JMP     loop

end:
    MOV     RAX, RDI
    LEAVE
    RET