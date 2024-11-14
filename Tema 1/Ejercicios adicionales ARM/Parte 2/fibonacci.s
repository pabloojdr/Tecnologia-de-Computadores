fib:
push {lr}
mov r1, #0
mov r2, #1
mov r3, r0

loop:
cmp r3, #0
beq salida
add r0, r1, r2
mov r1, r2
mov r2, r0
sub r3, #1
b loop

salida:
pop {lr}
mov r0, r1
bx lr