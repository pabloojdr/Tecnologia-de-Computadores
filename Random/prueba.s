.data
res: .word 0
num: .word 4

.text
.global main
main:
ldr r0, =num
ldr r0, [r0]
bl cuad
ldr r1, =res
str r0, [r1]
cuad:
push {lr}
mov r1, r0
loop:
cmp r1, #0
beq salida
bl sum
add r3, r4
sub r1, #1
b loop

salida:
mov r0, r3
pop {lr}
bx lr

sum:
push {r1, lr}
mov r3, r1
mov r2, r1
loop1:
cmp r3, #0
beq exit
add r4, r2
sub r3, #1
b loop1

exit:
pop {r1, lr}
bx lr