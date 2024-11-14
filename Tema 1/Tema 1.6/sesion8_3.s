.data
tam: .word 8
ocur: .word 0
vector: .word 2, -3, 6, 5, -4, 8, 2, 0
val: .word 2

.text
.global main
main:
ldr r0, =tam
ldr r1, [r0]
ldr r0, =ocur
ldr r2, [r0]
ldr r0, =val
ldr r3, [r0]
ldr r0, =vector
mov r5, #0

bucle:
ldr r4, [r0], #4
cmp r5, r1
beq exit
cmp r3, r4
addeq r2, r2, #1
add r5, r5, #1
b bucle

exit:
ldr r6, =ocur
str r2, [r6]
bx lr