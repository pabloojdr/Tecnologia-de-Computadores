.data
numel: .word 8
vector: .word 8,-3,4,-2,5,7,6,1
res: .word 0

.text
.global main
main: 
push {lr}
ldr r0, =vector
ldr r1, =numel
ldr r1, [r1]
bl sumabs
ldr r1, =res
str r0, [r1]
pop {lr}
bx lr

abs: 
mov r1, #0
mov r2, r0
cmp r2, r1
mov r3, #0
sublt r0, r1, r0
mov pc, lr


sumabs:
push {r4-r12, lr}
mov r4, r0
mov r5, r1
mov r7, #0

loop:
cmp r5, #0
beq salida

ldr r6, [r4], #4
mov r0, r6

bl abs

add r9, r0

sub r5, #1
b loop

salida:
mov r0, r9
pop {r4-r12, lr}
bx lr