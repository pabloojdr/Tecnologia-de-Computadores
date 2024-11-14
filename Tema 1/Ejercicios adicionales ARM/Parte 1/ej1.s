.data
len:	.word 8
datos:	.word 8,-3,4,-7,9,-7,6,-1
res:	.word 0 

.text
.global main
main:
ldr r0, =datos
ldr r1, =len
ldr r1, [r1]
bl rango
ldr r1, =res
str r0, [r1]


rango:
push {r4-r11, lr}
mov r4, r0
mov r5, r1
ldr r6, [r0]
ldr r7, [r0]

loop:
cmp r5, #0
beq salida
ldr r8, [r4], #4
cmp r8, r6
movgt r6, r8
cmp r8, r7
movlt r7, r8
sub r5, #1
b loop

salida:
sub r0, r6, r7
pop {r4-r11, lr}
bx lr

