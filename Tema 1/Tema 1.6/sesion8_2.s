.data
tam: .word 8
pos: .word 0
vector: .word 2, -3, 6, 5, -4, 8, 1, 0
val: .word -4

.text
.global main
main: 
ldr r0, =pos
ldr r1, [r0]
ldr r0, =tam
ldr r2, [r0]
ldr r0, =val
ldr r3, [r0]
ldr r0, =vector

bucle:
ldr r4, [r0], #4
cmp r1, r2
moveq r1, #-1
beq exit
cmp r4, r3
beq exit
add r1, r1, #1
b bucle

exit:
ldr r0, =pos
str r1, [r0]
bx lr






