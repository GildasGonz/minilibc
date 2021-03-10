BITS    64

SECTION .text
GLOBAL  strcspn

strcspn:
    PUSH    RBP
    MOV     RBP, RSP

    XOR     R9, R9
    CMP     BYTE[RSI], 0x00
    JE      strlen
    MOV     R10B, BYTE[RSI]
loop:
    CMP     BYTE[RDI], 0x00
    JE      end
    JMP     search
search:
    MOV     R11B, BYTE[RDI]
    MOV     R12B, BYTE[RSI]
    CMP     R11B, R12B
    JE      end
    CMP     R12B, 0x00
    JE      reset
    INC     RSI
    JMP     search
reset:
    CMP     BYTE[RSI], R10B
    JE      add_one
    DEC     RSI
    JMP     reset
add_one:
    INC     RDI
    INC     R9
    JMP     loop

strlen:
    CMP     BYTE[RDI], 0x00
    JE     end
    INC     R9
    INC     RDI
    JMP     strlen
end:
    MOV     RAX, R9
    LEAVE
    RET
