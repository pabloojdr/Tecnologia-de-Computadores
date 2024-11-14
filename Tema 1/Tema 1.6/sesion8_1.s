.data
tam: .word 8
max: .word 0
vector: .word 2, -3, 6, 5, -4, 8, 1, 0


.text
.global main
main: 
ldr r0, =tam
ldr r1, [r0]
ldr r0, =vector
ldr r2, [r0]
mov r4, r2

bucle:

cmp r1, #0
beq fin
ldr r2, [r0], #4

cmp r4, r2
movgt r4, r4
movlt r4, r2
sub r1, r1, #1


b bucle

fin:
ldr r0, =max
str r4, [r0]
bx lr