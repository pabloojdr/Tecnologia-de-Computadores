.data
tam:   .word 8
datos: .word 2, 4, 6, 8, -2, -4, -6, -7
res:   .word 0

.text
.global main
main:
ldr r0, =datos
ldr r1, =tam
ldr r1, [r1]
mov r2, #0
mov r3, #0
mov r5, r0
ldr r3, [r5]

loop:
cmp  r1, r2
beq salida
ldr r4, [r0], #4
cmp r3, r4
movlt r3, r4
sub r1, #1
b loop

salida:
ldr r0, =res
str r3, [r0]
bx lr 