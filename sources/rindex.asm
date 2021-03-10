BITS    64

SECTION .text
GLOBAL  rindex

rindex:
    PUSH    RBP
    MOV     RBP, RSP

    MOV     R9B, BYTE[RDI]
to_end:
    CMP     BYTE[RDI], 0
    JE      loop
    INC     RDI
    JMP     to_end
loop:
    MOV     R10B, BYTE[RDI]
    CMP     R10B, SIL
    JE      return
    CMP     R10B, R9B
    JE      return_null
    DEC     RDI
    JMP     loop

return:
    MOV     RAX, RDI
    LEAVE
    RET
return_null:
    XOR     RAX, RAX
    LEAVE
    RET