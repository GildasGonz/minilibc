BITS    64

SECTION .text
GLOBAL  strlen

strlen:
    PUSH    RBP,
    MOV     RBP, RSP

    XOR     R9, R9
    CMP     BYTE[RDI], 0
    JNE     loop
loop:
    INC     R9
    INC     RDI
    CMP     BYTE[RDI], 0
    JNE     loop

    MOV     RAX, R9
    LEAVE
    RET