BITS    64

SECTION .text
GLOBAL  strstr

strstr:
    PUSH    RBP
    MOV     RBP, RSP

    CMP     BYTE[RSI], 0x00
    JE      end
    MOV     R12B, BYTE[RSI]
loop:
    MOV     R9B, BYTE[RDI]
    MOV     R10B, BYTE[RSI]
    CMP     R9B, R10B
    JE      str_loop
    CMP     R9B, 0x00
    JE      end_null
    INC     RDI
    JMP     loop
str_loop:
    MOV     R9B, BYTE[RDI]
    MOV     R10B, BYTE[RSI]
    CMP     R10B, 0x00
    JE      reset_end
    CMP     R9B, R10B
    JNE     reset
    INC     RSI
    INC     RDI
    JMP     str_loop

reset:
    CMP     BYTE[RSI], R12B
    JE      add_one
    DEC     RSI
    DEC     RDI
    JMP     reset
add_one:
    INC     RDI
    JMP     loop

end_null:
    XOR     RAX, RAX
    LEAVE
    RET

reset_end:
    CMP     BYTE[RSI], R12B
    JE      end
    DEC     RSI
    DEC     RDI
    JMP     reset_end

end:
    MOV     RAX, RDI
    LEAVE
    RET