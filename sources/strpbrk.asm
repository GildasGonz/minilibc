BITS    64

SECTION .text
GLOBAL strpbrk

strpbrk:
    PUSH    RBP,
    MOV     RBP, RSP

    CMP     BYTE[RSI], 0x00
    JE      end_null
    MOV     R12B, BYTE[RSI]

loop:
    MOV     R9B, BYTE[RDI]
    MOV     R10B, BYTE[RSI]
    CMP     R9B, 0x00
    JE      end_null
    CMP     R10B, 0x00
    JNE     search

search:
    MOV     R10B, BYTE[RSI]
    CMP     R9B, R10B
    JE      end
    CMP     R10B, 0x00
    JE      reset
    INC     RSI
    JMP     search
reset:
    CMP     BYTE[RSI], R12B
    JE      add_one
    DEC     RSI
    JMP     reset
add_one:
    INC     RDI
    JMP     loop

end_null:
    XOR     RAX, RAX
    LEAVE
    RET
end:
    MOV     RAX, RDI
    LEAVE
    RET