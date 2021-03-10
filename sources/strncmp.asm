BITS    64

SECTION .text
GLOBAL  strncmp

strncmp:
    PUSH    RBP,
    MOV     RBP, RSP

    CMP     RDX, 0
    JLE     equal
    MOV     R9, 0
loop:    
    CMP     R9, RDX
    JE      equal
    MOV     R11B, BYTE[RSI]
    MOV     R10B, BYTE[RDI]
    CMP     R10B, 0
    JE      s1_end
    CMP     R11B, 0
    JE      s2_end
    CMP     R10B, R11B
    JNE     not_equal_byte
    INC     RDI
    INC     RSI
    INC     R9
    JMP     loop

not_equal_byte:
    CMP     R10B, R11B
    JL      less
    JMP     greater   

s1_end:
    CMP     R11B, 0
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