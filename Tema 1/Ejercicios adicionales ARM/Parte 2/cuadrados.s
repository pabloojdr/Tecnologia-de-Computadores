cuad:
push {r4-r8, lr}
mov r4, r0
mov r5, #0

loop:
cmp r4, #0
beq salida

mov r0, r4
bl sum
add r5, r0

sub r4, #1
b loop

salida:
mov r0, r5
pop {r4-r8, lr}
bx lr

sum:
push {r4-r8, lr}
mov r4, r0
mov r5, r0
mov r6, #0

loop1:
cmp r4, #0
beq exit

add r6, r5

sub r4, #1
b loop1

exit:
mov r0, r6
pop {r4-r8, lr}
bx lr