.data
mytam:      .word 8
myvect:     .word 8,-3,4,-2,5,7,6,1
myres:      .word 0
 
.text
.global main
main:       
push {lr}
ldr r0, =myvect
ldr r1, =mytam
ldr r1, [r1]
bl absmax
ldr r1, =myres
str r0, [r1]
pop {lr}
bx lr
 
abs:        
mov r1, #0
cmp r0, r1
sublt r0, r1, r0
bx lr
                 
absmax:
push {r4-r6, lr}
mov r4, r0
mov r5, #0
mov r6, r1

loop:
cmp r6, #0
beq salida
ldr r0, [r4], #4
bl abs
cmp r0, r5
movgt r5, r0
sub r6, #1
b loop

salida:
mov r0, r5
pop {r4-r6, lr}
bx lr