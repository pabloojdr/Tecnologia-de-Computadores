.data
dato1: .word 65537
var1: .word 1
var2: .word 2

.text
.global _start
_start:
	mov r3, #85
	ldr r0,=dato1
	ldr r2, [r0]
	mov r1, r3
	sub r4, r3, r2
	ldr r1, =var1
	ldr r0, [r1]
	ldr r6, =var2
	str r8, [r6]
	mov r2, r2, LSL #2
	bx lr
	