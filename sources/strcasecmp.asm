BITS    64

SECTION .text
GLOBAL  strcasecmp

strcasecmp:
    PUSH    RBP,
    MOV     RBP, RSP

loop:
    MOV     R9B, BYTE[RDI]
    MOV     R10B, BYTE[RSI]
    CMP     R9B, 0
    JE      s1_end
    CMP     R10B, 0
    JE      s2_end
    CMP     R9B, 65
    JGE     s1_check
loop_2:
    CMP     R10B, 65
    JGE     s2_check
loop_3:
    CMP     R9B, R10B
    JNE     not_equal_byte
    INC     RDI
    INC     RSI
    JMP     loop

s1_check:
    CMP     R9B, 90
    JLE     s1_lowercase
    JMP     loop_2
s1_lowercase:
    ADD     R9B, 32
    JMP     loop_2

s2_check:
    CMP     R10B, 90
    JLE     s2_lowercase
    JMP     loop_3
s2_lowercase:
    ADD     R10B, 32
    JMP     loop_3

not_equal_byte:
    CMP     R9B, R10B
    JL      less
    JMP     greater   

s1_end:
    CMP     R10B, 0
    JE      equal
    JMP     less

s2_end:
    CMP     R9B, 0
    JE      equal
    JMP     greater

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