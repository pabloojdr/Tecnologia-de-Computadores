.data
vector1:  .word 1,2,3,4,5,6,7,8
vector2:  .word 0,0,0,0,0,0,0,0
len:      .word 8
 
.text
ldr r0, =vector1
ldr r1, =len
ldr r1, [r1]
ldr r2, =vector2
bl reverse
bx lr
 
reverse:
push {r4-r11, lr}
mov r4, r0
mov r5, r1
mov r7, r2
mov r8, r5, LSL #2
sub r8, #4
add r7, r8

loop:
cmp r5, #0
beq salida
ldr r8, [r4], #4
str r8, [r7], #-4
sub r5, #1
b loop

salida:
pop {r4-r11, lr}
bx lr