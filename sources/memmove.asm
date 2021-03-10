BITS    64

SECTION .text
GLOBAL  memmove

memmove:
	PUSH	RBP
	MOV		RBP, RSP

	MOV		R8, RDI
	SUB		R8, RSI
	CMP		R8, 0x00
	JGE		overlap
	XOR		RCX, RCX
loop:
	CMP		RCX, RDX
	JE		end
	MOV		R8B, [RSI + RCX]
	MOV		[RDI + RCX], R8B
	INC		RCX
	JMP		loop

overlap:
	DEC		RDX
	JMP		overlap_loop
overlap_loop:	
	CMP		RDX, 0
	JL		end
	MOV 	R8B, [RSI + RDX]
	MOV 	[RDI + RDX], R8B
	DEC 	RDX
	JMP 	overlap_loop

end:
	MOV	RAX, RDI
	LEAVE
	RET