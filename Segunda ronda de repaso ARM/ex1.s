.data
numel: .word 5
vector: .word 9,5,4,10,7
nrp: .word 0
nop: .word 0

.text
.global main
main:
push {lr}
ldr r3, =vector
ldr r4, =numel
ldr r4, [r4]
mov r8, r4

loop:
cmp r4, #0
beq salida

ldr r0, [r3], #4
bl cperfecto

cmp r0, #1
addeq r7, #1

sub r4, #1
b loop

cperfecto:
push {lr}
mov r1, #0
mov r2, #1

loop1:
cmp r1, r0

bgt noperfect
beq fin

add r1, r2
add r2, #2

b loop1

noperfect:
mov r0, #0
pop {lr}
bx lr

fin:
mov r0, #1
pop {lr}
bx lr

salida:
sub r8, r7 
ldr r5, =nrp
str r7, [r5]
ldr r5, =nop
str r8, [r5]
mov lr, #0
pop {lr}
bx lr