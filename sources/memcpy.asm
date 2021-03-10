BITS    64

SECTION .text
GLOBAL  memcpy

memcpy:
    PUSH    RBP
    MOV     RBP, RSP

    XOR     RCX, RCX
loop:
    CMP     RCX, RDX
    JE      end
    MOV     R8B, [RSI + RCX]
    MOV     [RDI + RCX], R8B
    INC     RCX
    JMP     loop

end:
    MOV     RAX, RDI
    LEAVE
    RET