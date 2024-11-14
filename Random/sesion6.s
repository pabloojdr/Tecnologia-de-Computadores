.data
nota1: .word 7
nota2: .word 8
nota3: .word 6
nota4: .word 5
media: .word 0

.text
.global _start
_start:
	ldr r0, =nota1
	ldr r1, [r0]
	ldr r0, =nota2
	ldr r2, [r0]
	add r1, r1, r2
	ldr r0, =nota3
	ldr r2, [r0]
	add r1, r1, r2
	ldr r0, =nota4
	ldr r2, [r0]
	add r1, r1, r2
	mov r1, r1, LSR #2
	ldr r0, =media
	str r1, [r0]