BITS    64

SECTION .text
GLOBAL  strchr

strchr:
    PUSH    RBP,
    MOV     RBP, RSP

loop:
    CMP     BYTE[RDI], SIL
    JE      return
    CMP     BYTE[RDI], 0
    JE      return_null
    INC     RDI
    JMP     loop

return:
    MOV     RAX, RDI
    LEAVE
    RET

return_null:
    XOR     RAX, RAX
    LEAVE
    RET