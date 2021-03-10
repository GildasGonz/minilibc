BITS    64

SECTION .text
GLOBAL  strcmp

strcmp:
    PUSH    RBP,
    MOV     RBP, RSP

loop:
    MOV     R9B, BYTE[RSI]
    MOV     R10B, BYTE[RDI]
    CMP     R10B, 0
    JE      s1_end
    CMP     R9B, 0
    JE      s2_end
    CMP     R10B, R9B
    JNE     not_equal_byte
    INC     RDI
    INC     RSI
    JMP     loop

not_equal_byte:
    CMP     R10B, R9B
    JL      less
    JMP     greater   

s1_end:
    CMP     R9B, 0
    JNE     less
    JMP     equal

s2_end:
    CMP     R10B, 0
    JNE     greater
    JMP     equal

less:
    MOV     RAX, -1
    LEAVE
    RET

equal:
    XOR     RAX, RAX
    LEAVE
    RET

greater:
    MOV     RAX, 1
    LEAVE
    RET